ShangYeHuoDong2 = {}
ShangYeHuoDong2.ID = 30400

local _cfg_stor =  cfg_mystery_store                    --奖励表

local _cfg_activity = {}                                --开服活动表
for i, v in ipairs(cfg_activity) do
    if v.activityType == 3 then
        _cfg_activity = v
        break
    end
end

local _state = {
    notbuy = 0,         --未购买
    hasbuy = 2,         --已购买
}

--系统自定义变量,礼包idx,每日更新奖励内容,四天一轮回
local _DB_varName = "C_DB_XSZG"

--变量名前缀,每日限购礼包购买状态
local _varName = "C_XSZG"

local cfg_varName = {}
local cfg_varValue = {}
for i, _ in ipairs(_cfg_activity.remarks[1]) do
    cfg_varName[i] = _varName .."_" .. i
    cfg_varValue[i] = 0
end

local _login_data = {ssrNetMsgCfg.ShangYeHuoDong2_SyncResponse, 0,0,0,cfg_varValue}
function ShangYeHuoDong2.SyncResponse(actor, logindatas)
    local index = getsysvarex(_DB_varName) + 1  --获取本轮奖励idx
    for i, name in ipairs(cfg_varName) do
        cfg_varValue[i] = getplayvar(actor,name)
    end
    if logindatas then
        _login_data[2] = index
        _login_data[5] = cfg_varValue
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.ShangYeHuoDong2_SyncResponse,index,0,0,cfg_varValue)
    end
end

function ShangYeHuoDong2.RequestZS(actor,param)
    param = tonumber(param)

    local varName = cfg_varName[param]
    if not varName then return end

    if getplayvar(actor,varName) ~= _state.notbuy then   --判断礼包是否已购买
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>已购买</font>","Type":9}')
        return
    end

    local index = getsysvarex(_DB_varName) + 1
    local idx = _cfg_activity.remarks[index][param]
    local stor = _cfg_stor[idx]

    local _name = Player.checkItemNumByTable(actor,  stor.price )   --返回不足材料 name 
    if _name then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>'.._name..'不足</font>","Type":9}')
        return
    end

    Player.takeItemByTable(actor, stor.price) --扣材料

    Player.giveItemByTable(actor,stor.itemId)    --给奖励

    FSetPlayVar(actor, varName, _state.hasbuy)

    sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>购买成功</font>","Type":9}')       --告诉玩家领取成功    

    for i, name in ipairs(cfg_varName) do
        cfg_varValue[i] = getplayvar(actor,name)
    end
    Message.sendmsg(actor, ssrNetMsgCfg.ShangYeHuoDong2_ZSResponse,index,0,0,cfg_varValue)
end

Message.RegisterNetMsg(ssrNetMsgCfg.ShangYeHuoDong2, ShangYeHuoDong2)

--每日清空/更新礼包
local function _playerroBeforedawn()
    local index = getsysvarex(_DB_varName) + 1
    if index > #_cfg_activity.remarks then  --开启循环
        setsysvarex(_DB_varName,0, 1)
    else
        setsysvarex(_DB_varName, index, 1)
    end

    for _, name in ipairs(cfg_varName) do
        clearhumcustvar("*",name)
    end

    local players = getplayerlst()
    for _, player in ipairs(players) do
        ShangYeHuoDong2.SyncResponse(player)
    end
end
GameEvent.add(EventCfg.roBeforedawn,  _playerroBeforedawn, ShangYeHuoDong2)  --每日凌晨触发系统变量

--声明个人变量
GameEvent.add(EventCfg.goPlayerVar, function (actor)
    FIniPlayVar(actor, cfg_varName)
end, ShangYeHuoDong2)

--声明系统变量
GameEvent.add(EventCfg.onStartUp, function (actor)
    inisysvar("integer", _DB_varName)
end, ShangYeHuoDong2)

--登录同步数据
GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas) 
    ShangYeHuoDong2.SyncResponse(actor, logindatas)
end, ShangYeHuoDong2)

return ShangYeHuoDong2