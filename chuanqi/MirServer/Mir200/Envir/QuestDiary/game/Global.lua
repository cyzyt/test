Global = {}

function beforedawn()
    local t = getplayerlst()
    for _,actor in ipairs(t) do
        Global.dailyupdate(actor)
    end
    local openday = grobalinfo(ConstCfg.global.openday)
    GameEvent.push(EventCfg.RoBeforedawn, openday)
end

--����ȫ�ֱ���
function Global.onStartUp() --C��ȫ�ֱ���
    inisysvar("integer", "C_QsQsyhdweek")  --�ܱ������ShangYeHuoDong1
    inisysvar("integer", "C_QsQsyhdFourdays")  --4��ѭ������ShangYeHuoDong2
    inisysvar("integer", "C_QsQsyhdThreedays")  --3��ѭ������ShangYeHuoDong3
    for i=1,6 do
        inisysvar("integer", "C_QsQhzlqmax"..i)  --һ�����������5����ͬ�᳤��ȡ ShangYeHuoDong4
        inisysvar("integer", "C_QsQcylqmax"..i)  --һ�����������1000����ͬ�л��Ա��ȡShangYeHuoDong4
    end
	inisysvar("integer", "C_QsQfirstcastlewar")  -- ��һ�ι���ȫ�ֱ���
    inisysvar("string", "C_QsQranklist_tab")  --newranklist �Զ���ս����

    inisysvar("string","C_QsQserver")--choujiang.lua �齱���˱���
    inisysvar("string","C_QsQsluckshow")--choujiang.lua �齱չʾ

    setontimerex(23, 60)   --23 60  ���ˢ�����а�ȫ�ֶ�ʱ��
    --LOGPrint("C��ȫ�ֱ���end")
end
-------------------------------������Ϣ---------------------------------------
--ͬ����ʵ��/���
function Global.SyncTotalRealRecharge(actor)
    local real_recharge_cent = getplaydef(actor, VarCfg.U_real_recharge_cent)
    local virtual_recharge_cent = getplaydef(actor, VarCfg.U_virtual_recharge_cent)
    Message.sendmsg(actor, ssrNetMsgCfg.Global_SyncTotalRealRecharge, real_recharge_cent,virtual_recharge_cent)
end

--ͬ������ʵ��/���
function Global.SyncTodayRealRecharge(actor)
    local today_real_recharge_cent = getplaydef(actor, VarCfg.U_today_real_recharge_cent)
    local today_virtual_recharge_cent = getplaydef(actor, VarCfg.U_today_virtual_recharge_cent)
    Message.sendmsg(actor, ssrNetMsgCfg.Global_SyncTodayRealRecharge, today_real_recharge_cent,today_virtual_recharge_cent)
end

--���������ʡǮ
function Global.RequestOpenTTSQ(actor)
    qqgiftbox(actor)
end

-------------------------------�߼�����---------------------------------------
--ÿ�ո���
function Global.dailyupdate(actor, islogin, datas)
    local before_date = getplaydef(actor, VarCfg.T_daily_date)
    local cur_date = os.date("%Y%m%d") --��ǰ������
    if cur_date ~= before_date then
        --�������ʵ�ʳ�ֵ��
        setplaydef(actor, VarCfg.U_today_real_recharge_cent, 0)
        --�������ʵ�ʳ�ֵ��
        setplaydef(actor, VarCfg.U_today_virtual_recharge_cent, 0)

        setplaydef(actor, VarCfg.T_daily_date, cur_date)  --����һ����µ�ǰ������
        GameEvent.push(EventCfg.goDailyUpdate, actor, islogin, datas)
    end
end

--���ģ�鿪��
function Global.checkModuleOpen(actor)
    -- openmoduleid = 100
    -- GameEvent.push(EventCfg.goOpenModule, actor, openmoduleid)
    --ͨ�� openmoduleid ��ȡģ����� ͬ��ģ������
    -- Message.sendmsg(actor, ssrNetMsgCfg.Global_OpenModuleRun, openmoduleid)
end

-------------------------------�¼�---------------------------------------
--��¼���
local _login_SyncOpenDay = {ssrNetMsgCfg.Global_SyncOpenDay, 0,120}
local _login_SyncCreateActor = {ssrNetMsgCfg.Global_SyncCreateActor, 0, 0}
local _login_SyncTotalRealRecharge = {ssrNetMsgCfg.Global_SyncTotalRealRecharge, 0}
local _login_SyncTodayRealRecharge = {ssrNetMsgCfg.Global_SyncTodayRealRecharge, 0}
function Global.LoginEnd(actor, logindatas)
    Global.dailyupdate(actor, true, logindatas)

    --��������
    _login_SyncOpenDay[2] = grobalinfo(ConstCfg.global.openday)
    --����������
    _login_SyncOpenDay[3] = ConstCfg.bagcellnum + getplaydef(actor, VarCfg.U_Bag_OpenNum)
    table.insert(logindatas, _login_SyncOpenDay)

    --������ɫ��Ϣ
    _login_SyncCreateActor[2] = getplaydef(actor, VarCfg.U_create_actor_time)
    _login_SyncCreateActor[3] = Player.getCreateActorDay(actor)
    table.insert(logindatas, _login_SyncCreateActor)

    --��ʵ��/���
    _login_SyncTotalRealRecharge[2] = getplaydef(actor, VarCfg.U_real_recharge_cent)
    _login_SyncTotalRealRecharge[3] = getplaydef(actor, VarCfg.U_virtual_recharge_cent)
    table.insert(logindatas, _login_SyncTotalRealRecharge)

    --����ʵ��/���
    _login_SyncTodayRealRecharge[2] = getplaydef(actor, VarCfg.U_today_real_recharge_cent)
    _login_SyncTodayRealRecharge[3] = getplaydef(actor, VarCfg.U_today_virtual_recharge_cent)
    table.insert(logindatas, _login_SyncTodayRealRecharge)

    --gmȨ�޵ȼ�
    if ConstCfg.DEBUG then
        setgmlevel(actor,10)
    end
    table.insert(logindatas, {ssrNetMsgCfg.Global_SyncAdmini, getgmlevel(actor)})
end

--ÿ���賿
function Global.Beforedawn(actor, beforedawndatas)
    Global.dailyupdate(actor, false, beforedawndatas)

    --��������
    _login_SyncOpenDay[2] = grobalinfo(ConstCfg.global.openday)
    table.insert(beforedawndatas, _login_SyncOpenDay)

    --����ʵ���
    _login_SyncTodayRealRecharge[2] = getplaydef(actor, VarCfg.U_today_real_recharge_cent)
    _login_SyncTodayRealRecharge[3] = getplaydef(actor, VarCfg.U_today_virtual_recharge_cent)
    table.insert(beforedawndatas, _login_SyncTodayRealRecharge)
end

--���ĳNPC
function Global.ClickNpcResponse(actor, npcid)
    -- Message.sendmsg(actor, ssrNetMsgCfg.Global_ClickNpcResponse, npcid)
end

--��ֵ����
function Global.Recharge(actor, gold, productid, moneyid)
    Global.SyncTotalRealRecharge(actor)     --��ֵ��ͬ����ʵ
    Global.SyncTodayRealRecharge(actor)     --��ֵ��ͬ������
    Message.sendmsg(actor, ssrNetMsgCfg.Global_Recharge, gold, productid, moneyid)
end

--�����ֵ����
function Global.onVirtualRecharge(actor, gold)
    Global.SyncTotalRealRecharge(actor)     --��ֵ��ͬ����ʵ
    Global.SyncTodayRealRecharge(actor)     --��ֵ��ͬ������
    Message.sendmsg(actor, ssrNetMsgCfg.Global_Recharge, gold)
end

--�������������ͱ仯
function Global._onBagChange(actor)
    --��������
    local openDay = grobalinfo(ConstCfg.global.openday)
    --����������
    local bagNum = ConstCfg.bagcellnum + getplaydef(actor, VarCfg.U_Bag_OpenNum)
    Message.sendmsg(actor, ssrNetMsgCfg.Global_SyncOpenDay, openDay,bagNum)
end
-------------------------------�����¼�---------------------------------------
GameEvent.add(EventCfg.onStartUp, Global.onStartUp, Global, 1)
GameEvent.add(EventCfg.onBagChange, Global._onBagChange, Global, 1)
GameEvent.add(EventCfg.onLoginEnd, Global.LoginEnd, Global, 1)
GameEvent.add(EventCfg.goBeforedawn, Global.Beforedawn, Global, 1)
GameEvent.add(EventCfg.onClicknpc, Global.ClickNpcResponse, Global, 1)
GameEvent.add(EventCfg.onRecharge, Global.Recharge, Global, 1)
GameEvent.add(EventCfg.onVirtualRecharge, Global.onVirtualRecharge, Global, 1)

-------------------------------��������---------------------------------------
Message.RegisterNetMsg(ssrNetMsgCfg.Global, Global)

return Global