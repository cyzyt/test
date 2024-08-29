ShangYeHuoDong3 = {}

ShangYeHuoDong3.ID = 30600

--���
local _cfg_activity = {}
for i, cfg in ipairs(cfg_activity) do
    if cfg.activityType == 2 then
        _cfg_activity = cfg
        break
    end
end

--������
local _cfg_stor = cfg_mystery_store

--ϵͳ����,����idx
local db_varName = "C_QsQsyhdThreedays"

--��ұ���,������ȡ���(int�����,ÿ���賿���)
local cfg_role_varName = {}
local cfg_role_varValue = {}
for i = 1, 4 do
    cfg_role_varName[i] = "C_QsQljchongzhi"..i
    cfg_role_varValue[i] = 0
end

local _login_data = {ssrNetMsgCfg.ShangYeHuoDong3_SyncResponse, 0,0,0,cfg_role_varValue}
function ShangYeHuoDong3.SyncResponse(actor, logindatas)
    local day_bill = getplaydef(actor, VarCfg.U_today_real_recharge_cent)   --����ʵ�ʳ�ֵ���

    local db_index = getsysvarex(db_varName) + 1                              --���ս���idx��������3��һѭ�� 0/1/2��

    for i, varName in ipairs(cfg_role_varName) do                           --������ҽ�����ȡ���
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
    local day_bill = getplaydef(actor, VarCfg.U_today_real_recharge_cent)   --����ʵ�ʳ�ֵ���
    local db_index = getsysvarex(db_varName) + 1                              --���ս���idx��������3��һѭ�� 0/1/2��
    if not _cfg_activity.remarks[db_index] then return end

    local varName = cfg_role_varName[param]
    if not varName then return end

    if getplayvar(actor,varName) ~= 0 then   --�жϱ����Ƿ�ʹ��
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>����ȡ</font>","Type":9}')
        return
    end

    local idx = _cfg_activity.remarks[db_index][param]
    local stor = _cfg_stor[idx]

    if day_bill < stor.price  then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>���ճ�ֵ����</font>","Type":9}')
        return
    end

    Player.giveItemByTable(actor,stor.itemId)    --������

    FSetPlayVar(actor, varName, 1)

    sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>��ȡ�ɹ�</font>","Type":9}')

    for i, _varName in ipairs(cfg_role_varName) do                           --������ҽ�����ȡ���
        cfg_role_varValue[i] = getplayvar(actor,_varName)
    end
    Message.sendmsg(actor, ssrNetMsgCfg.ShangYeHuoDong3_ZSResponse,day_bill,db_index,0,cfg_role_varValue)
end

Message.RegisterNetMsg(ssrNetMsgCfg.ShangYeHuoDong3, ShangYeHuoDong3)
-- ----------------------------������ �����¼� ������---------------------------------------
--�������˱���
GameEvent.add(EventCfg.goPlayerVar, function (actor)
    FIniPlayVar(actor, cfg_role_varName)
end, ShangYeHuoDong3)

--ÿ���賿 ����ϵͳ��ѭ��ʹ��
GameEvent.add(EventCfg.roBeforedawn,  function ()
    local db_index = getsysvarex(db_varName) + 1
    if db_index > 2 then  --����ѭ��  0 1 2 
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

--��¼����,ͬ������
GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas) 
    ShangYeHuoDong3.SyncResponse(actor, logindatas)
end, ShangYeHuoDong3)

--��ֵ����
GameEvent.add(EventCfg.onRecharge,  function (actor)
    ShangYeHuoDong3.SyncResponse(actor)
end, ShangYeHuoDong3)

return ShangYeHuoDong3