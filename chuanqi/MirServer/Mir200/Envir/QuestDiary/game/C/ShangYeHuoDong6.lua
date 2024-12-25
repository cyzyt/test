ShangYeHuoDong6 = {}
ShangYeHuoDong6.ID = 32400

local _cfg = {}

local activity_id = 6   --活动id

local _sync_data_memory = {}                            --优先分配同步内存数据(itemIdx,db_var,role_var)

local _var_DB = "C_QsQ_var_DB_SYHD6"              --系统领取变量前缀

local _var_Role = "C_QsQ_var_player_SYHD6"         --玩家领取变量前缀

local _var_DB_GetName = {}
local _var_Role_GetName = {}
for i, v in ipairs(cfg_quanfu_huishou) do
    local item_idx = v.item
    _cfg[item_idx] = v
    _var_DB_GetName[item_idx] = _var_DB..item_idx
    _var_Role_GetName[item_idx] = _var_Role..item_idx
    _sync_data_memory[i] = {0,0,0}
end

local _state = {
    no_receive      = 0,        --不可领取
    yes_receive     = 1,        --可以领取
    has_receive     = 2,        --已领取
}

-- -------------------------------↓↓↓ 本地方法 ↓↓↓---------------------------------------
--更新同步数据
local function _select_first_data(actor)
    local i = 1
    local rd = _state.no_receive
    for idx,varname in pairs(_var_DB_GetName) do
        _sync_data_memory[i][1] = idx
        _sync_data_memory[i][2] = getplayvar(actor, _var_Role_GetName[idx])
        _sync_data_memory[i][3] = getsysvarex(varname)
        if _sync_data_memory[i][2] == _state.yes_receive then
            if _cfg[idx].num - _sync_data_memory[i][3] > 0 then
                rd = _state.yes_receive
            else
                _sync_data_memory[i][2] = _state.has_receive
            end
        end
        i = i + 1
    end
    return rd
end

local function _select_is_Colse()
    local server_Open_Num = grobalinfo(1)
    return (cfg_activity[activity_id] and server_Open_Num >= cfg_activity[activity_id].startTime and server_Open_Num <= cfg_activity[activity_id].overTime) and 0 or 1
end

local _login_data = {ssrNetMsgCfg.ShangYeHuoDong6_SyncResponse, 0,0,0,_sync_data_memory}
function ShangYeHuoDong6.SyncResponse(actor, logindatas)
    local isopen = _select_is_Colse()
    local rd = _select_first_data(actor)
    if logindatas then
        _login_data[2] = isopen
        _login_data[3] = rd
        _login_data[5] = _sync_data_memory
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.ShangYeHuoDong6_SyncResponse,isopen,rd,0,_sync_data_memory)
    end
end

function ShangYeHuoDong6.RequestReceive(actor,idx)
    local isopen = _select_is_Colse()
    if isopen ~= 0 then return end

    local cfg = _cfg[idx]
    if not cfg then return end
    local var_name = _var_Role_GetName[idx]
    local var_db_name = _var_DB_GetName[idx]

    --检查是否可领取
    local state = getplayvar(actor, var_name)
    if state ~= _state.yes_receive then
        return
    end
    --检查全服可领取数量
    local gnum = getsysvarex(var_db_name) + 1
    if gnum > cfg.num then
        sendmsg(actor, ConstCfg.notice.own, ssrResponseCfg.get(ssrResponseCfg.ShangYeHuoDong6_not_gnum))
        return
    end

    local item = {{idx,1}}
    local name,num = Player.checkItemNumByTable(actor, item)
    if name then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>回收道具不存在于包裹!</font>","Type":9}')
        return
    else
        Player.takeItemByTable(actor, item)
    end

    --写数据库
    setsysvarex(var_db_name, gnum, 1)
    FSetPlayVar(actor, var_name,_state.has_receive)

    --给奖励
    Player.giveItemByTable(actor, cfg.gift, "首爆回收首爆")

    --回复
    local rd = _select_first_data(actor)
    Message.sendmsg(actor, ssrNetMsgCfg.ShangYeHuoDong6_RecoveryResponse, rd,0,0,{idx, _state.has_receive, gnum})

    --发送公告
    if cfg.Gonggao then
        FSendNotice(actor, cfg.Gonggao, {name=true}, cfg.Name,cfg.Price[1][2])
    end

    if gnum >= cfg.num then
        local t = getplayerlst()
        for _,_actor in ipairs(t) do
            if _actor ~= actor then
                local _rd = _select_first_data(actor)
                Message.sendmsg(_actor, ssrNetMsgCfg.ShangYeHuoDong6_SyncMaxRecovery, idx,_rd)
            end
        end
    end
end

Message.RegisterNetMsg(ssrNetMsgCfg.ShangYeHuoDong6, ShangYeHuoDong6)
-- ----------------------------↓↓↓ 引擎事件 ↓↓↓---------------------------------------
--声明个人变量
local function _playerVar(actor)
    local temp = {}
    for _,var_name in pairs(_var_Role_GetName) do
        table.insert(temp,var_name)
    end
    FIniPlayVar(actor, temp)
end
GameEvent.add(EventCfg.goPlayerVar, _playerVar, ShangYeHuoDong6) --声明变量

--声明全局变量
local function _onStartUp()
    local var = 0
    for idx,var_name in pairs(_var_DB_GetName) do
        inisysvar("integer", var_name)
        local temp_tab = sorthumvar(_var_Role_GetName[idx], 0, 1, 0) or nil
        var = 0
        if temp_tab and type(temp_tab) == "table" and next(temp_tab) then
            for i=1,#temp_tab,2 do
                var = var + temp_tab[i+1]
            end
        end
        setsysvarex(var_name, var, 1)
    end
end
GameEvent.add(EventCfg.onStartUp, _onStartUp, ShangYeHuoDong6)

--物品进背包
local function _onAddBag(actor,itemobj)
    local isopen = _select_is_Colse()
    if isopen ~= 0 then return end
    local idx = getiteminfo(actor, itemobj, ConstCfg.iteminfo.idx)
    if not _cfg[idx] then return end
    local itemflag = getitemaddvalue(actor, itemobj, 2, 20)
    if itemflag == ConstCfg.itemflag.firstrecycle then return end
    setitemaddvalue(actor, itemobj, 2, 20, ConstCfg.itemflag.firstrecycle)

    --检查自身是否已领取
    local varname = _var_Role_GetName[idx]
    local state = getplayvar(actor, varname)
    if state ~= _state.no_receive then return end

    --检查全服可领取数量
    local var_db_name = _var_DB_GetName[idx]
    local hasNum = getsysvarex(var_db_name)
    if _cfg[idx].num - hasNum <= 0 then return end

    FSetPlayVar(actor, varname,_state.yes_receive)
    Message.sendmsg(actor, ssrNetMsgCfg.ShangYeHuoDong6_SyncItemFirst, idx)
end
GameEvent.add(EventCfg.onAddBag, _onAddBag, ShangYeHuoDong6)

--登陆触发
local function _onLoginEnd(actor,logindatas)
    ShangYeHuoDong6.SyncResponse(actor, logindatas)
end
GameEvent.add(EventCfg.onLoginEnd, _onLoginEnd, ShangYeHuoDong6)

return ShangYeHuoDong6