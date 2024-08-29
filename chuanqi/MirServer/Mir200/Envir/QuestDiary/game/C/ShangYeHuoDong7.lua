ShangYeHuoDong7 = {}
ShangYeHuoDong7.ID = 32600

local _cfg_lj = cfg_leichong_tsleic
local _cfg_mr = cfg_leichong_mr

local _LJ_receive_zubie = "NB_SYHD7_LJ_zubie"           --累计领取组别
local _LJ_receive_day = "NB_SYHD7_LJ_day"               --累计领取天数
local _LJ_var_name = "NB_SYHD7_LJ"                      --累计领取自定义变量名前缀
local _LJ_var_tab = {}

local _LJ_Zubie_Max = 1                                 --累计领取最大组别
local _LJ_Reset_Day = 1                                 --累计领取重置天数
local _MR_Min_BillNum = 28                              --每日充值可以增加累计天数的最小充值金额

local _Mr_var_name = "NB_SYHD7_MR"                      --每日领取自定义变量名前缀
local _Mr_var_name_isFirst = "_Mr_var_name_isFirst"     --今日是否第一次达成日充奖励(达成则累计天数+1)
local _MR_var_tab = {}


local _sync_data_list = {
    MR_tab = {},    --每日礼包
    LJ_tab = {},    --累计礼包
}

local _state = {
    no_receive      = 0,        --不可领取
    yes_receive     = 1,        --可以领取
    has_receive     = 2,        --已领取
}

--获取当前开服日期对应的表(每日充值礼包)
local function getCfgByServerOpenDay(index)
    local cfg = {}
    local openDay = grobalinfo(ConstCfg.global.openday)
    for i, v in ipairs(_cfg_mr) do
        if openDay >= v.startTime and openDay <= v.overTime then
            cfg[v.money] = v
        end
    end
    return cfg[index]
end

--获取当前组别对应的累计奖励表
local function getCfgByZubie(zubie,idx)
    local cfg = {}
    for i, v in ipairs(_cfg_lj) do
        if v.zubie == zubie then
            cfg[v.tianshu] = v
        end
    end
    return cfg[idx]
end
for i, v in ipairs(_cfg_lj) do
    if v.tianshu then
        _LJ_var_tab[v.tianshu] = _LJ_var_name.."_"..v.tianshu
        if v.tianshu > _LJ_Reset_Day then
            _LJ_Reset_Day = v.tianshu
        end
        if v.zubie > _LJ_Zubie_Max then
            _LJ_Zubie_Max = v.zubie
        end
    end
end
for i, v in ipairs(_cfg_mr) do
    if v.money then
        _MR_var_tab[v.money] = _Mr_var_name.."_"..v.money

        if v.money < _MR_Min_BillNum and v.money ~= 0 then
            _MR_Min_BillNum = v.money
        end
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步信息
local _login_data = {ssrNetMsgCfg.ShangYeHuoDong7_SyncResponse,0,0,_LJ_Reset_Day,_sync_data_list}--优先分配同步内存数据
function ShangYeHuoDong7.SyncResponse(actor, logindatas)
    _sync_data_list.LJ_tab = {}
    local day_bill = Player.getTodayVirtualBillNum(actor)                       --日冲金额

    local get_lj_day = getplayvar(actor, _LJ_receive_day)                       --累计领取天

    local zubie = getplayvar(actor, _LJ_receive_zubie)                          --当前每日礼包组别

    local isfirst = getplayvar(actor,_Mr_var_name_isFirst)

    if isfirst == _state.no_receive and day_bill >= _MR_Min_BillNum then
        get_lj_day = get_lj_day + 1
        FSetPlayVar(actor,_Mr_var_name_isFirst,_state.yes_receive)
        FSetPlayVar(actor,_LJ_receive_day,get_lj_day)
    end

    local state = 0
    local str = ""
    --累计领取礼包
    for day,varname in pairs(_LJ_var_tab) do
        str = tostring(day)
        state = getplayvar(actor,varname)
        if state == _state.no_receive and day <= get_lj_day then
            state = _state.yes_receive
        end
        _sync_data_list.LJ_tab[str] = state
    end

    _sync_data_list.MR_tab = {}
    for money,varname in pairs(_MR_var_tab) do
        str = tostring(money)
        state = getplayvar(actor,varname)
        if state == _state.no_receive and money <= day_bill then
            state = _state.yes_receive
        end
        _sync_data_list.MR_tab[str] = state
    end

    if logindatas then
        _login_data[2] = get_lj_day
        _login_data[3] = zubie
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.ShangYeHuoDong7_SyncResponse,get_lj_day,zubie,_LJ_Reset_Day,_sync_data_list)
    end
end

--领取累计礼包
function ShangYeHuoDong7.RequestGetLJGift(actor,index)
    local zubie = getplayvar(actor, _LJ_receive_zubie)                          --当前每日礼包组别
    local cfg = getCfgByZubie(zubie,index)
    if not cfg then return end
    local var_name = _LJ_var_tab[cfg.tianshu]
    if not var_name then return end

    local state = getplayvar(actor, var_name)
    if state == _state.has_receive then return end  --奖励已领取

    local cur_day = getplayvar(actor, _LJ_receive_day)      --累计天数未达标
    if cur_day < index then return end

    if not Bag.checkBagEmptyNum(actor, #cfg.reward) then
        sendmsg(actor, ConstCfg.notice.own, ssrResponseCfg.get(ssrResponseCfg.not_bag_num))
        return
    end

    --写数据库
    FSetPlayVar(actor,var_name,_state.has_receive)

    --给物品
    Player.giveItemByTable(actor, cfg.reward, "每日累充奖励")

    --回复
    ShangYeHuoDong7.SyncResponse(actor)
end

--领取日冲奖励
function ShangYeHuoDong7.RequestGetMRGift(actor,index)
    local cfg = getCfgByServerOpenDay(index)
    if not cfg then return end

    local var_name = _MR_var_tab[cfg.money]
    if not var_name then return end

    local state = getplayvar(actor, var_name)
    if state == _state.has_receive then return end  --今日已领取

    if not Bag.checkBagEmptyNum(actor, #cfg.reward) then
        sendmsg(actor, ConstCfg.notice.own, ssrResponseCfg.get(ssrResponseCfg.not_bag_num))
        return
    end

    --充值未达标
    local day_bill = Player.getTodayVirtualBillNum(actor)
    if day_bill < cfg.money then
        sendmsg(actor, ConstCfg.notice.own, ssrResponseCfg.get(ssrResponseCfg.dailyrecharge_not_receive))
        return
    end

    --写数据库
    FSetPlayVar(actor,var_name,_state.has_receive)

    --给物品
    Player.giveItemByTable(actor, cfg.reward)

    --回复
    ShangYeHuoDong7.SyncResponse(actor)
end
Message.RegisterNetMsg(ssrNetMsgCfg.ShangYeHuoDong7, ShangYeHuoDong7)
-------------------------------↓↓↓ 外部调用 ↓↓↓---------------------------------------
--初始化个人变量
local function _goPlayerVar(actor)
    local var_all = {_LJ_receive_zubie,_LJ_receive_day,_Mr_var_name_isFirst}
    for _, key in pairs(_LJ_var_tab) do
        table.insert(var_all,key)
    end
    for _, key in pairs(_MR_var_tab) do
        table.insert(var_all,key)
    end
    FIniPlayVar(actor, var_all)
end
GameEvent.add(EventCfg.goPlayerVar, _goPlayerVar, ShangYeHuoDong7)

--每日凌晨 与 每日第一次登录 调用
local function _goDailyUpdate(actor)
    for _, key in pairs(_MR_var_tab) do
        FSetPlayVar(actor,key,0)
    end

    FSetPlayVar(actor,_Mr_var_name_isFirst,0)

    local zubie = getplayvar(actor, _LJ_receive_zubie)
    if zubie == 0 then
        FSetPlayVar(actor,_LJ_receive_zubie,1)
    end
    local cur_day = getplayvar(actor, _LJ_receive_day)
    if cur_day >= _LJ_Reset_Day then
        --累计奖励组别更新
        zubie = zubie + 1
        if zubie > _LJ_Zubie_Max then
            zubie = _LJ_Zubie_Max
        end
        for _,varname in pairs(_LJ_var_tab) do
            FSetPlayVar(actor,varname,0)
        end
        FSetPlayVar(actor,_LJ_receive_zubie,zubie)
        FSetPlayVar(actor,_LJ_receive_day,0)
    end
    ShangYeHuoDong7.SyncResponse(actor)
end
GameEvent.add(EventCfg.goDailyUpdate, _goDailyUpdate, ShangYeHuoDong7)

--登陆触发
local function _onLoginEnd(actor,logindatas)
    ShangYeHuoDong7.SyncResponse(actor, logindatas)
end
GameEvent.add(EventCfg.onLoginEnd, _onLoginEnd, ShangYeHuoDong7)

--充值触发(参数：actor, 充值索引, 充值金额分)
local function _onRecharge(actor,gold, productid, moneyid)
    ShangYeHuoDong7.SyncResponse(actor)
end
GameEvent.add(EventCfg.onRecharge,  _onRecharge, ShangYeHuoDong7)

--虚拟充值触发(参数：actor, 充值索引, 充值金额分)
local function _onVirtualRecharge(actor,gold, productid, moneyid)
    ShangYeHuoDong7.SyncResponse(actor)
end
GameEvent.add(EventCfg.onVirtualRecharge,  _onVirtualRecharge, ShangYeHuoDong7)
-- -------------------------------↓↓↓ 外部调用 ↓↓↓---------------------------------------
--变量重置
function ShangYeHuoDong7.GmClear(actor)
    for _,varname in pairs(_LJ_var_tab) do
        FSetPlayVar(actor,varname,0)
    end
    for _,varname in pairs(_MR_var_tab) do
        FSetPlayVar(actor,varname,0)
    end
    FSetPlayVar(actor,_Mr_var_name_isFirst,0)
    FSetPlayVar(actor,_LJ_receive_zubie,1)
    FSetPlayVar(actor,_LJ_receive_day,0)
    ShangYeHuoDong7.SyncResponse(actor)
    sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#7FFF00\'>变量重置成功!</font>","Type":9}')
end

return ShangYeHuoDong7