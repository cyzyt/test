ShangYeHuoDong2 = {}
ShangYeHuoDong2.ID = 30400

local _cfg_stor =  cfg_mystery_store                    --������

local _cfg_activity = {}                                --�������
for i, v in ipairs(cfg_activity) do
    if v.activityType == 3 then
        _cfg_activity = v
        break
    end
end

local _state = {
    notbuy = 0,         --δ����
    hasbuy = 2,         --�ѹ���
}

--ϵͳ�Զ������,���idx,ÿ�ո��½�������,����һ�ֻ�
local _DB_varName = "C_DB_XSZG"

--������ǰ׺,ÿ���޹��������״̬
local _varName = "C_XSZG"

local cfg_varName = {}
local cfg_varValue = {}
for i, _ in ipairs(_cfg_activity.remarks[1]) do
    cfg_varName[i] = _varName .."_" .. i
    cfg_varValue[i] = 0
end

local _login_data = {ssrNetMsgCfg.ShangYeHuoDong2_SyncResponse, 0,0,0,cfg_varValue}
function ShangYeHuoDong2.SyncResponse(actor, logindatas)
    local index = getsysvarex(_DB_varName) + 1  --��ȡ���ֽ���idx
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

    if getplayvar(actor,varName) ~= _state.notbuy then   --�ж�����Ƿ��ѹ���
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>�ѹ���</font>","Type":9}')
        return
    end

    local index = getsysvarex(_DB_varName) + 1
    local idx = _cfg_activity.remarks[index][param]
    local stor = _cfg_stor[idx]

    local _name = Player.checkItemNumByTable(actor,  stor.price )   --���ز������ name 
    if _name then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>'.._name..'����</font>","Type":9}')
        return
    end

    Player.takeItemByTable(actor, stor.price) --�۲���

    Player.giveItemByTable(actor,stor.itemId)    --������

    FSetPlayVar(actor, varName, _state.hasbuy)

    sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>����ɹ�</font>","Type":9}')       --���������ȡ�ɹ�    

    for i, name in ipairs(cfg_varName) do
        cfg_varValue[i] = getplayvar(actor,name)
    end
    Message.sendmsg(actor, ssrNetMsgCfg.ShangYeHuoDong2_ZSResponse,index,0,0,cfg_varValue)
end

Message.RegisterNetMsg(ssrNetMsgCfg.ShangYeHuoDong2, ShangYeHuoDong2)

--ÿ�����/�������
local function _playerroBeforedawn()
    local index = getsysvarex(_DB_varName) + 1
    if index > #_cfg_activity.remarks then  --����ѭ��
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
GameEvent.add(EventCfg.roBeforedawn,  _playerroBeforedawn, ShangYeHuoDong2)  --ÿ���賿����ϵͳ����

--�������˱���
GameEvent.add(EventCfg.goPlayerVar, function (actor)
    FIniPlayVar(actor, cfg_varName)
end, ShangYeHuoDong2)

--����ϵͳ����
GameEvent.add(EventCfg.onStartUp, function (actor)
    inisysvar("integer", _DB_varName)
end, ShangYeHuoDong2)

--��¼ͬ������
GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas) 
    ShangYeHuoDong2.SyncResponse(actor, logindatas)
end, ShangYeHuoDong2)

return ShangYeHuoDong2