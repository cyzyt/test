ShangYeHuoDong3 = {}

ShangYeHuoDong3.ID = 30600

--活动表
local _cfg_activity = {}
for i, cfg in ipairs(cfg_activity) do
    if cfg.activityType == 2 then
        _cfg_activity = cfg
        break
    end
end

--奖励表
local _cfg_stor = cfg_mystery_store

--系统变量,奖池idx
local db_varName = "C_QsQsyhdThreedays"

--玩家变量,奖励领取情况(int天变量,每日凌晨清空)
local cfg_role_varName = {}
local cfg_role_varValue = {}
for i = 1, 4 do
    cfg_role_varName[i] = "C_QsQljchongzhi"..i
    cfg_role_varValue[i] = 0
end

local _login_data = {ssrNetMsgCfg.ShangYeHuoDong3_SyncResponse, 0,0,0,cfg_role_varValue}
function ShangYeHuoDong3.SyncResponse(actor, logindatas)
    local day_bill = getplaydef(actor, VarCfg.U_today_real_recharge_cent)   --今日实际充值金额

    local db_index = getsysvarex(db_varName) + 1                              --今日奖励idx（奖励池3天一循环 0/1/2）

    for i, varName in ipairs(cfg_role_varName) do                           --今日玩家奖励领取情况
        cfg_role_varValue[i] = getplayvar(actor,varName)
    end

    if logindatas then
        _login_data[2] = day_bill
        _login_data[3] = db_index
        _login_data[5] = cfg_role_varValue
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.ShangYeHuoDong3_SyncResponse,day_bill,db_index,0,cfg_role_varValue)
    end
end

function ShangYeHuoDong3.RequestZS(actor,param)
    param = tonumber(param)
    local day_bill = getplaydef(actor, VarCfg.U_today_real_recharge_cent)   --今日实际充值金额
    local db_index = getsysvarex(db_varName) + 1                              --今日奖励idx（奖励池3天一循环 0/1/2）
    if not _cfg_activity.remarks[db_index] then return end

    local varName = cfg_role_varName[param]
    if not varName then return end

    if getplayvar(actor,varName) ~= 0 then   --判断变量是否使用
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>已领取</font>","Type":9}')
        return
    end

    local idx = _cfg_activity.remarks[db_index][param]
    local stor = _cfg_stor[idx]

    if day_bill < stor.price  then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>今日充值不足</font>","Type":9}')
        return
    end

    Player.giveItemByTable(actor,stor.itemId)    --给奖励

    FSetPlayVar(actor, varName, 1)

    sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>领取成功</font>","Type":9}')

    for i, _varName in ipairs(cfg_role_varName) do                           --今日玩家奖励领取情况
        cfg_role_varValue[i] = getplayvar(actor,_varName)
    end
    Message.sendmsg(actor, ssrNetMsgCfg.ShangYeHuoDong3_ZSResponse,day_bill,db_index,0,cfg_role_varValue)
end

Message.RegisterNetMsg(ssrNetMsgCfg.ShangYeHuoDong3, ShangYeHuoDong3)
-- ----------------------------↓↓↓ 引擎事件 ↓↓↓---------------------------------------
--声明个人变量
GameEvent.add(EventCfg.goPlayerVar, function (actor)
    FIniPlayVar(actor, cfg_role_varName)
end, ShangYeHuoDong3)

--每日凌晨 触发系统作循环使用
GameEvent.add(EventCfg.roBeforedawn,  function ()
    local db_index = getsysvarex(db_varName) + 1
    if db_index > 2 then  --开启循环  0 1 2 
        setsysvarex(db_varName,0, 1)
    else
        setsysvarex(db_varName, db_index, 1)
    end

    for _, varName in ipairs(cfg_role_varName) do
        clearhumcustvar("*",varName)
    end

    local players = getplayerlst()
    for i=1,#players do
        ShangYeHuoDong3.SyncResponse(players[i])
    end

end, ShangYeHuoDong3)

--登录触发,同步数据
GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas) 
    ShangYeHuoDong3.SyncResponse(actor, logindatas)
end, ShangYeHuoDong3)

--充值触发
GameEvent.add(EventCfg.onRecharge,  function (actor)
    ShangYeHuoDong3.SyncResponse(actor)
end, ShangYeHuoDong3)

return ShangYeHuoDong3