ShenShouZhiLi = {}
ShenShouZhiLi.ID = 30800

local _cfgsixiang =  cfg_sixiang                 

local _login_data = {ssrNetMsgCfg.ShenShouZhiLi_SyncResponse, 0}
function ShenShouZhiLi.SyncResponse(actor, logindatas)
    local map = getbaseinfo(actor,3)
    local xz = 0
    if map == "3" then
        xz = 10
    end

    
    local sszl_tab = {}
    for i=1,4 do
        local sszl = getplayvar(actor,"C_QsQshenshouzhili"..i)
        local shibai = getplayvar(actor,"C_QsQshenshouzhilishibai"..i)
        sszl_tab[i]= {sszl,shibai}
    end
    --LOGPrint("MAP="..map)
    --LOGDump(sszl_tab)
    if logindatas then
        _login_data[2] = xz
        _login_data[3] = 1
        _login_data[4] = 1
        _login_data[5] = sszl_tab
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor,ssrNetMsgCfg.ShenShouZhiLi_SyncResponse,xz,2,2,sszl_tab)
    end
end


function ShenShouZhiLi.RequestZS(actor,param,param2) ----param.���� 11=Ԫ�� 12=��� param2. �ڼ���ҳ��
    param = tonumber(param)
    param2 = tonumber(param2)
    local sszl = getplayvar(actor,"C_QsQshenshouzhili"..param2)
    local shibai = getplayvar(actor,"C_QsQshenshouzhilishibai"..param2)
    local dq_tab = {}

    for j=1,#_cfgsixiang do
        if _cfgsixiang[j]["type"] == param2 then
            local x = _cfgsixiang[j]["level"]
            dq_tab[x] = _cfgsixiang[j]
        end
    end
   
    if sszl >= #dq_tab then
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>������</font>","Type":9}') 
        return
    end
   
    local cfgx = {dq_tab[sszl+1]["cost"][param-10]}
    local name = Player.checkItemNumByTable(actor, cfgx)   --���ز������ name 
    
    if name then ---���Ԫ������ʱ  ���а�Ԫ���ж�
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>���ϲ���</font>","Type":9}')
        return
    end
    
    Player.takeItemByTable(actor, cfgx)  --�۳� ����Ʒ ���� ��������

    local random = math.random(1, 10000)
    local jilv = dq_tab[sszl+1]["cgjl"] + 500 * shibai
    --LOGPrint("��ǰ�ɹ���="..jilv)
    --LOGPrint("�����ɹ���="..dq_tab[sszl+1]["cgjl"])
    --LOGPrint("ʧ�ܳɹ���="..(500 * shibai))
    if random >= jilv then
        setplayvar(actor, "HUMAN","C_QsQshenshouzhilishibai"..param2,shibai+1,1)  --ʧ��֮�� ��¼���� 
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>����ʧ��</font>","Type":9}')
        local sszls_tab = {}
        for i=1,4 do
            local sszl = getplayvar(actor,"C_QsQshenshouzhili"..i)
            local shibai = getplayvar(actor,"C_QsQshenshouzhilishibai"..i)
            sszls_tab[i]= {sszl,shibai}
        end
    
        Message.sendmsg(actor, ssrNetMsgCfg.ShenShouZhiLi_ZSResponse,1,1,param2,sszls_tab)
        return
    end
    local dqshuxing = {}
    if sszl == 0 then
        dqshuxing = {
            attribute = {
                {[1]=74,[2]=0,},
                {[1]=75,[2]=0,},
                        },
		            }
    else
        dqshuxing = dq_tab[sszl]
    end
    local nxshuxing = dq_tab[sszl+1]
    Player.updateSomeAddr(actor,  dqshuxing.attribute,  nxshuxing.attribute)   --�������� ��ǰ���� ������

    setplayvar(actor, "HUMAN","C_QsQshenshouzhili"..param2,sszl+1,1)
    setplayvar(actor, "HUMAN","C_QsQshenshouzhilishibai"..param2,0,1) 
    sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>���׳ɹ�</font>","Type":9}')

    local sszl_tab = {}
    for i=1,4 do
        local sszl = getplayvar(actor,"C_QsQshenshouzhili"..i)
        local shibai = getplayvar(actor,"C_QsQshenshouzhilishibai"..i)
        sszl_tab[i]= {sszl,shibai}
    end
    
    Message.sendmsg(actor, ssrNetMsgCfg.ShenShouZhiLi_ZSResponse,1,1,param2,sszl_tab)

    GameEvent.push(EventCfg.goShenShou, actor)
end

Message.RegisterNetMsg(ssrNetMsgCfg.ShenShouZhiLi, ShenShouZhiLi)

-- ----------------------------������ ��Ϸ�¼� ������---------------------------------------
--��������
local function _playerVar(actor)
    for i=1,4 do
        iniplayvar(actor, "integer", "HUMAN", "C_QsQshenshouzhili"..i)   --�������֮�����
        iniplayvar(actor, "integer", "HUMAN", "C_QsQshenshouzhilishibai"..i)   --���ʧ�ܴ������
    end
end

--��¼��������  �����������Ը���  --��¼ʱ�Ὣ���Ա�������Ը��±��� Ȼ��ִ�����Ը��²���
GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    for i=1,4 do
        local dq_tab = {}
        for j=1,#_cfgsixiang do
            if _cfgsixiang[j]["type"] == i then
                local x = _cfgsixiang[j]["level"]
                dq_tab[x] = _cfgsixiang[j]
            end
        end
        local sszl = getplayvar(actor,"C_QsQshenshouzhili"..i)
        if sszl > 0 then 
            table.insert(loginattrs, dq_tab[sszl]["attribute"])
        end
    end
end, ShenShouZhiLi)

GameEvent.add(EventCfg.goPlayerVar, _playerVar, ShenShouZhiLi) --��������

GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas) --��¼ͬ������
    ShenShouZhiLi.SyncResponse(actor, logindatas)
end, ShenShouZhiLi)

return ShenShouZhiLi