Fashion = {}
Fashion.ID = 31300

local _cfgch =  cfg_zhanshi


-------------------------------������ ������Ϣ ������---------------------------------------
--ͬ������
local _login_data = {ssrNetMsgCfg.Fashion_SyncResponse, 0}
function Fashion.SyncResponse(actor, logindatas)
    local tab = {}
    local fashion = getbaseinfo(actor, ConstCfg.gbase.fashion)


    if logindatas then
        _login_data[2] = fashion
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.Fashion_SyncResponse,fashion)
    end
end

function Fashion.RequestZS(actor,btn,btns,gou)
    btn = tonumber(btn)
    btns = tonumber(btns)
    local biao = ""
    if btn == 1 then
        biao = "C_QsQFashiontite"
    elseif btn == 2 then
        biao = "C_QsQFashionweapon"
    elseif btn == 3 then
        biao = "C_QsQFashionfoot"
    end
    local dqch = QaQIsPliaertite(actor,biao) --������ʱ����0 ���򷵻ص�ǰ�ƺ�id
    if dqch ~= 0 then  --��ǰ����ƺ�ʱ
        QaQShuttite(actor,biao) --ж�³ƺ�ʱ�����ж�ʱװ����������  
        if dqch ~= btns then  --����ƺ������ƺŲ�һ��ʱ�л�
            QaQShowtite(actor,btns,biao)  --չʾ�ƺ� 1actor 2�ƺ�id
        end
    else
        QaQShowtite(actor,btns,biao)
    end


    local tabs = {}
    local tite_tab = json2tbl(getplayvar(actor,biao))
    
    if biao == "C_QsQFashionweapon" then
        Fashion.FashionShow(actor,gou)
    end

    if tite_tab ~= nil then
        for k, v in pairs(tite_tab) do
            table.insert(tabs,{k,v})
        end
    else
        tabs = nil
    end

    Message.sendmsg(actor, ssrNetMsgCfg.Fashion_ZSResponse,btn,2,2,tabs)
end

function Fashion.TBRequest(actor,btn)  --��ť1 Ϊ�ƺ�vip 2ʱװ 3�㼣
    btn = tonumber(btn)
    local biao = ""
    if btn == 1 then
        biao = "C_QsQFashiontite"
    elseif btn == 2 then
        biao = "C_QsQFashionweapon"
    elseif btn == 3 then
        biao = "C_QsQFashionfoot"
    end
    local tabs = {}
    local tite_tab = json2tbl(getplayvar(actor,biao))
    if tite_tab ~= nil then
        for k, v in pairs(tite_tab) do
            table.insert(tabs,{k,v})
        end
    else
        tabs = nil
    end
    Message.sendmsg(actor,ssrNetMsgCfg.Fashion_ZSResponse,btn,2,2,tabs)
end

function Fashion.FashionShow(actor,gou)  --�Ƿ�չʾʱװ

    local tite_tab = json2tbl(getplayvar(actor,"C_QsQFashionweapon"))
    
    if gou == 1 then  --��ʾָ��
        if tite_tab ~= nil then
            if tite_tab[0] == 0 then  --����ʱװΪ��ʱ
                setbaseinfo(actor, ConstCfg.sbase.fashion,0)
            else    --ʱװ��Ϊ��ʱ  ��ʾʱװ
                setbaseinfo(actor, ConstCfg.sbase.fashion,1)
            end
        end
    else   --����ʾָ��ʱ
        setbaseinfo(actor, ConstCfg.sbase.fashion,0)
    end

    setbaseinfo(actor, ConstCfg.sbase.hair,0)

end

Message.RegisterNetMsg(ssrNetMsgCfg.Fashion,Fashion)  --ע��

-- ----------------------------������ ��Ϸ�¼� ������---------------------------------------
--"C_QsQFashiontite",    ���ʹ洢,   1,3    --1δ��ӳɹ�ʱ��ʱ������� 3ֻΪչʾ������ʵ������
--"C_QsQFashionweapon",  ���ʹ洢,   2      --2����(���ϼ���������ȡ������) ������ƺ�һ�����ʱ������� ����ҿ�����ѡ�����
--"C_QsQFashionfoot",    ���ʹ洢,   4      --4�㼣����ʱ���ٵ�������һ��������Ч ���������ƺ�һ�¼�ʱ��Ч

-- QaQADDtite(actor,1,C_QsQFashiontite) ����id 1 ����Ϊ3  ����ƺű�
-- QaQADDtite(actor,id,biao)    1.guid 2.����id 3.������ ���� ����Զ���ƺţ�ʱװ�㼣����Ч

-- QaQDeltite(actor,id,biao)    1.guid 2.����id 3.������ ���� ɾ���ƺŵ���Ч

-- QaQShowtite(actor,id,biao)   1.guid 2.����id 3.������ ���� չʾ�ƺŵ���Ч ��QaQShuttite���滻����

-- QaQShuttite(actor,biao)      1.guid 2.������ ���� ȡ����ǰ���� �Ѿ�չʾ�ĳƺ� ����Ч

-- QaQIsPliaertite(actor,biao)  1.guid 2.������ ���� ��ȡ ����չʾ�ĳƺ� ����Ч ����ֵ ����:num ����id �����ڷ��� 0

--�㼣�������� QF��run walk ���� 

local function _playerVar(actor)  --����ֹ�ͻ���ѹ������
    iniplayvar(actor, "string", "HUMAN", "C_QsQFashiontite")    --�ƺű� ��vip��һ��չʾ
    iniplayvar(actor, "string", "HUMAN", "C_QsQFashionweapon")  --ʱװ��
    iniplayvar(actor, "string", "HUMAN", "C_QsQFashionfoot")    --�㼣��
end

local function _playerADDtite(actor,id,biao)
    
    local btn = 0
    if biao == "C_QsQFashiontite" then
        btn = 1
    elseif biao == "C_QsQFashionweapon" then
        btn = 2
    elseif biao == "C_QsQFashionfoot" then
        btn = 3
    end

    local tabs = {}
    local tite_tab = json2tbl(getplayvar(actor,biao))
    if tite_tab ~= nil then
        for k, v in pairs(tite_tab) do
            table.insert(tabs,{k,v})
        end
    else
        tabs = nil
    end
    Message.sendmsg(actor,ssrNetMsgCfg.Fashion_ZSResponse,btn,2,2,tabs)
end


GameEvent.add(EventCfg.goPlayerVar, _playerVar, Fashion)

GameEvent.add(EventCfg.goADDFashion, _playerADDtite, Fashion)


--��¼��������  �����������Ը���  --��¼ʱ�Ὣ���Ա�������Ը��±��� Ȼ��ִ�����Ը��²���
GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    
    local biao_tab = {"C_QsQFashiontite","C_QsQFashionweapon","C_QsQFashionfoot"}
    for i=1,3 do
        local tite_tab = json2tbl(getplayvar(actor,biao_tab[i]))
        --LOGDump(tite_tab)
        if type(tite_tab) == "table" then 
            for k, v in pairs(tite_tab or {}) do
                if k ~= 0 then
                    if _cfgch[k]["leixing"] ~= 3 then
                        local cfg = _cfgch[k]["shuxing"]
                        table.insert(loginattrs, cfg)
                    end
                else
                    if v ~= 0 then
                        QaQShuttite(actor,biao_tab[i])
                        QaQShowtite(actor,v,biao_tab[i])
                    end
                end
            end
        end
    end

end, Fashion)

GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas)
    Fashion.SyncResponse(actor, logindatas)
end, Fashion)

return Fashion