ShangYeHuoDong4 = {}

ShangYeHuoDong4.ID = 30700

local _cfg =  cfg_hanghuijingji            --行会奖励表

local _state = {
    not_receive = 0,         --未领取
    has_receive = 1,         --已领取
}

local cfg_role_varName = {}
local cfg_role_varValue = {}

local cfg_leader_varName = {}

for i = 1, 6 do
    cfg_role_varName[i] = "C_Guild_"..i
    cfg_role_varValue[i] = 0

    cfg_leader_varName[i] = "C_Guild_leader_"..i
end

local _login_data = {ssrNetMsgCfg.ShangYeHuoDong4_SyncResponse, 0,0,0,cfg_role_varValue}
function ShangYeHuoDong4.SyncResponse(actor, logindatas)
    local playersnum = getguildmembercount(actor)

    for i, varName in ipairs(cfg_role_varName) do
        cfg_role_varValue[i] = getplayvar(actor, varName)
    end

    if logindatas then
        _login_data[2] = playersnum
        _login_data[5] = cfg_role_varValue
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.ShangYeHuoDong4_SyncResponse,playersnum,0,0,cfg_role_varValue)
    end
end

--刷新界面
function ShangYeHuoDong4.HangHuiGengXing(actor)
    local playersnum = getguildmembercount(actor)

    for i, varName in ipairs(cfg_role_varName) do
        cfg_role_varValue[i] = getplayvar(actor, varName)
    end

    Message.sendmsg(actor, ssrNetMsgCfg.ShangYeHuoDong4_ZSResponse,playersnum,0,0,cfg_role_varValue)
end

--请求领取礼包
function ShangYeHuoDong4.RequestZS(actor,param)
    param = tonumber(param)

    local cfg = _cfg[param]
    local cfg_leader = _cfg[param + 6]

    if not cfg or not cfg_leader then return end

    local guild = getmyguild(actor)
    if guild == '0' or guild == 0 then
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>你还未加入行会</font>","Type":9}')
        return
    end

    local isLeader = getbaseinfo(actor,ConstCfg.gbase.isboos)

    local playersnum = getguildmembercount(actor)
    if playersnum < cfg.goal then
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>行会成员不足</font>","Type":9}')
        return
    end

    local state = getplayvar(actor,cfg_role_varName[param])

    local state_leader = getplayvar(actor,cfg_leader_varName[param])

    if state == _state.has_receive and state_leader == _state.has_receive then
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>礼包已全部领取</font>","Type":9}')
        return
    end

    if state == _state.not_receive then
        FSetPlayVar(actor, cfg_role_varName[param], _state.has_receive)
        Player.giveItemByTable(actor,cfg.reward)
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>成员礼包领取成功</font>","Type":9}')
    end

    if isLeader and state == _state.not_receive then
        FSetPlayVar(actor, cfg_leader_varName[param], _state.has_receive)
        Player.giveItemByTable(actor,cfg_leader.reward)
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>会长礼包领取成功</font>","Type":9}')
    end

    ShangYeHuoDong4.HangHuiGengXing(actor)
end

Message.RegisterNetMsg(ssrNetMsgCfg.ShangYeHuoDong4, ShangYeHuoDong4)
---------------------------离线更新属性
--声明变量
GameEvent.add(EventCfg.goPlayerVar, function (actor)
    FIniPlayVar(actor, cfg_role_varName)
    FIniPlayVar(actor, cfg_leader_varName)
end, ShangYeHuoDong4)

--登录同步数据
GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas) 
    ShangYeHuoDong4.SyncResponse(actor, logindatas)
end, ShangYeHuoDong4)

return ShangYeHuoDong4