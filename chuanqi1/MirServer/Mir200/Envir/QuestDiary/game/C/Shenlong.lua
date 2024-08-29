Shenlong = {}
Shenlong.ID = 31500


local cfg_mystery_stores =  cfg_mystery_store

local cfg = {}
local num = 1
for k,v in ipairs(cfg_mystery_stores) do
    if v.sellId == 102 then
        cfg[num] = v
        num = num + 1
    end
end
    
local var = "C_QsQshenlong"

local _login_data = {ssrNetMsgCfg.Shenlong_SyncResponse, 0}
function Shenlong.SyncResponse(actor, logindatas)
    local tian_tab = {}

    local lingqu = {}
    for i=1,6 do
        lingqu[i] = getplayvar(actor,var..i)
    end
    local daycz = getplayvar(actor,"C_QsQDayRecharge")  --�ճ� shangyehuodong3���������

    tian_tab[1]=lingqu

    if logindatas then
        _login_data[2] = daycz
        _login_data[3] = 1
        _login_data[4] = 1
        _login_data[5] = tian_tab
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.Shenlong_SyncResponse,daycz,2,2,tian_tab)
    end
    
    
end

function Shenlong.RequestZS(actor,param)
    local param = tonumber(param)
    
    local daycz = getplayvar(actor,"C_QsQDayRecharge")
    if getplayvar(actor,var..param) ~= 0 then
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>����ȡ</font>","Type":9}')
        return
    end
  
    -- local openDay = grobalinfo(1)  --��ȡ��������
    -- if openDay < 15 then  --15��֮����
    --     sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>���δ����</font>","Type":9}')
    --     return
    -- end
    
    if cfg == nil then
        return
    end

    if daycz < cfg[param]["price"]  then
        GameEvent.push(EventCfg.goQuickAccess, actor,ConstCfg.money.lf)
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>���ճ�ֵ����</font>","Type":9}')
        return
    end

    local tab = cfg[param]["itemId"]
    for i=1,#tab do  
        if Item.isCurrency(tab[i][1]) then
            changemoney(actor,tab[i][1],"+",tab[i][2],"������ֵ",true)
        else
            giveitem(actor, Item.getNameByIdx(tab[i][1]),tab[i][2])
        end
    end

    setplayvar(actor, "HUMAN",var..param,1,1)  --��¼��ȡ
    sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>��ȡ�ɹ�</font>","Type":9}')       --���������ȡ�ɹ�    
        

    local tian_tab = {}

    local lingqu = {}
    for i=1,6 do
        lingqu[i] = getplayvar(actor,var..i)
    end
    
    tian_tab[1]=lingqu

    Message.sendmsg(actor, ssrNetMsgCfg.Shenlong_ZSResponse,daycz,2,2,tian_tab)
end

Message.RegisterNetMsg(ssrNetMsgCfg.Shenlong, Shenlong)

---------------------------���߸�������
--��������
local function _playerVar(actor)
    for i=1,6 do
        iniplayvar(actor, "integer", "HUMAN", var..i)
    end
end

--�������
local function _playerBeforedawn()
    for i=1,6 do
        clearhumcustvar("",var..i)
    end
    local players = getplayerlst()
    for i=1,#players do
        Shenlong.SyncResponse(players[i], logindatas)
    end
end


--�ճ������ ShangYeHuoDong3 ��������� C_QsQDayRecharge
local function _playerrecharge(actor, gold, productid, moneyid)--��ֵ     (������actor, ��ֵ����, ��ֵ����)
    Shenlong.SyncResponse(actor)
end


GameEvent.add(EventCfg.onRecharge,  _playerrecharge, Shenlong)  --��ֵ
GameEvent.add(EventCfg.goPlayerVar, _playerVar, Shenlong) --��������
GameEvent.add(EventCfg.roBeforedawn,  _playerBeforedawn, Shenlong)  --ÿ���賿���������ұ���
GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas) --��¼ͬ������
    Shenlong.SyncResponse(actor, logindatas)
end, Shenlong)

return Shenlong