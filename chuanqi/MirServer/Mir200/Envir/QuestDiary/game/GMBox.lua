lualib = lualib or {}

function lualib:playerIsGm(actor)
    local gmLv = getgmlevel(actor)
    if gmLv < 10 then
        sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>GMȨ�޲���</font>","Type":9}')
    end
    return gmLv >= 10
end

function lualib:sendmsg(actor,str)
    sendmsg(actor, 1,string.format('{"Msg":"<font color=\'#D2B48C\'>[GM]%s</font>","Type":9}',str))
    sendmsg(actor, 1,string.format('{"Msg":"<font color=\'#D2B48C\'>[GM]%s</font>","Type":1}',str))
end

function lualib:getplayerbyname(actor,name)
    local player = getplayerbyname(name)
    if not player or player == "" or player == "0" or not isnotnull(player) then
        player = false
        lualib:sendmsg(actor,"��Ҳ�����")
    end
    return player
end

-- ==================================================================================
-- ==================================================================================
-- =====================================//ϵͳ//=====================================
-- ==================================================================================
-- ==================================================================================

--��ȡϵͳ���� gm_getsysvar
---@param param1 string ������
function usercmd1(actor,param1)
    if not lualib:playerIsGm(actor) then return end
    lualib:sendmsg(actor,string.format("��ȡ %s���� : %s",param1,getsysvar(param1)))
end

--����ϵͳ���� gm_setsysvar
---@param param1 string ������
---@param param2 string|number ����ֵ
---@param param3 string ����ֵ����
function usercmd2(actor,param1,param2,param3)
    if not lualib:playerIsGm(actor) then return end
    param2 = tonumber(param2) or param2
    if param3 == "integer" then
        param2 = tonumber(param2) or 0
    end
    local var = getsysvar(param1)
    setsysvar(param1,param2)
    lualib:sendmsg(actor,string.format("�޸� %s���� : %s �� %s",param1,param2,var,getsysvar(param1)))
end

--����ϵͳ�Զ������ gm_inisysvarex
---@param param1 string ������
---@param param2 string ����ֵ����
function usercmd3(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    inisysvar(param2,param1,0)
    lualib:sendmsg(actor,string.format("����ϵͳ�Զ������,%s - %s",param1,param2))
end

--��ȡϵͳ�Զ������ gm_getsysvarex
---@param param1 string ������
function usercmd4(actor,param1)
    if not lualib:playerIsGm(actor) then return end
    lualib:sendmsg(actor,param1..":"..getsysvarex(param1))
end

--����ϵͳ�Զ������ gm_setsysvarex
---@param param1 string ������
---@param param2 string|number ����ֵ
---@param param3 string ����ֵ����
---@param param4 number �Ƿ񱣴����ݿ�
function usercmd5(actor,param1,param2,param3,param4)
    if not lualib:playerIsGm(actor) then return end
    if param3 == "integer" then
        param2 = tonumber(param2) or 0
    end
    param4 = tonumber(param4) or 0
    local var = getsysvarex(param1)
    setsysvarex(param1,param2,param4)
    lualib:sendmsg(actor,string.format("�޸� %s���� : %s �� %s",param1,param2,var,getsysvarex(param1)))
end

--����ϵͳ�Զ������ gm_setsysvarex
---@param param1 string ������
---@param param2 string|number ����ֵ
---@param param3 string ����ֵ����
---@param param4 number �Ƿ񱣴����ݿ�
function usercmd5(actor,param1,param2,param3,param4)
    if not lualib:playerIsGm(actor) then return end
    if param3 == "integer" then
        param2 = tonumber(param2) or 0
    end
    param4 = tonumber(param4) or 0
    local var = getsysvarex(param1)
    setsysvarex(param1,param2,param4)
    lualib:sendmsg(actor,string.format("�޸� %s���� : %s �� %s",param1,param2,var,getsysvarex(param1)))
end

--����һ�����Է���˵���Ϣ gm_sendluamsg
---@param param1 number ��Ϣ��
---@param param2 number ����1
---@param param3 number ����2
---@param param4 number ����3
---@param param5 string ����3
function usercmd6(actor,param1,param2,param3,param4,param5)
    if not lualib:playerIsGm(actor) then return end
    param1 = tonumber(param1) or 0
    param2 = tonumber(param2) or 0
    param3 = tonumber(param3) or 0
    param4 = tonumber(param4) or 0
    sendluamsg(actor,param1,param2,param3,param3,param5)
    lualib:sendmsg(actor,string.format("���ͻ��˷���%s����Ϣ",param1))
end

-- ==================================================================================
-- ==================================================================================
-- =====================================//���//=====================================
-- ==================================================================================
-- ==================================================================================

--��ȡ��ұ��� gm_getplayvar
---@param param1 string �����
---@param param2 string ������
function usercmd1001(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        lualib:sendmsg(actor,string.format("%s ��ȡ %s���� : %s",param1,param2,getplaydef(player,param2)))
    end
end

--������ұ��� gm_setplayvar
---@param param1 string �����
---@param param2 string ������
---@param param3 string|number ����ֵ
---@param param4 string ����ֵ����
function usercmd1002(actor,param1,param2,param3,param4)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        if param4 == "integer" then
            param3 = tonumber(param3) or 0
        end
        local var = getplaydef(player,param2)
        setplaydef(player,param2,param3)
        lualib:sendmsg(actor,string.format("%s �޸� %s���� : %s �� %s",param1,param2,var,getplaydef(player,param2)))
    end
end

--��ȡ����Զ������ gm_getplayvarex
---@param param1 string �����
---@param param2 string ������
function usercmd1003(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        lualib:sendmsg(actor,string.format("%s ��ȡ %s���� : %s",param1,param2,getplayvar(player,"HUMAN",param2) or "��ȡʧ��(δ����)"))
    end
end

--��������Զ������ gm_setplayvarex
---@param param1 string �����
---@param param2 string ������
---@param param3 string|number ����ֵ
---@param param4 string ����ֵ����
---@param param5 number �Ƿ񱣴����ݿ�
function usercmd1004(actor,param1,param2,param3,param4,param5)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        if param4 == "integer" then
            param3 = tonumber(param3) or 0
        end
        param5 = tonumber(param5) or 0
        local var = getplayvar(player,"HUMAN",param2)
        iniplayvar(player, param4, "HUMAN", param2)
        setplayvar(player,"HUMAN",param2,param3,param5)
        lualib:sendmsg(actor,string.format("%s �޸� %s���� : %s �� %s",param1,param2,var,getplayvar(player,"HUMAN",param2)))
    end
end

-- ��ת����Ҹ��� gm_jumptoplay
---@param param1 string �����
function usercmd1005(actor,param1)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        local map,x,y = getbaseinfo(player,3), getbaseinfo(player,4), getbaseinfo(player,5)
        mapmove(actor,map,x,y,5)
        lualib:sendmsg(actor,string.format("��ת�� %s [%s,%s]",map,x,y))
    end
end

-- ����ҵ���� gm_bringplay
---@param param1 string �����
function usercmd1006(actor,param1)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        local map,x,y = getbaseinfo(actor,3), getbaseinfo(actor,4), getbaseinfo(actor,5)
        mapmove(player,map,x,y,5)
        lualib:sendmsg(actor,string.format("���˵� %s [%s,%s]",map,x,y))
    end
end

-- ���ͱ������� gm_giveitem
---@param param1 string �����
---@param param2 string ��Ʒ����
---@param param3 number ����
---@param param4 number ����
function usercmd1007(actor,param1,param2,param3,param4)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        param3 = tonumber(param3) or 1
        param4 = tonumber(param4) or 0
        if giveitem(player,param2,param3,param4) then
            lualib:sendmsg(actor,string.format("������Ʒ %s �� %s",param2,param1))
        else
            lualib:sendmsg(actor,string.format("%s����ʧ��",param2))
        end
    end
end

-- ���ұ������� gm_finditem
---@param param1 string �����
---@param param2 string ��Ʒ����
function usercmd1008(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        lualib:sendmsg(actor,string.format("%s ӵ�� %s * %s",param1,param2,getbagitemcount(player,param2) or 0))
    end
end

-- �����ҳƺ� gm_checktitle
---@param param1 string �����
---@param param2 string �ƺ�����
function usercmd1009(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        lualib:sendmsg(actor,string.format("%s-%s-%s�ƺ�",param1,checktitle(player,param2) and "ӵ��" or "û��",param2))
    end
end

-- �����ҳƺ� gm_addtitle
---@param param1 string �����
---@param param2 string �ƺ�����
---@param param3 number �Ƿ񼤻�
function usercmd1010(actor,param1,param2,param3)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        param3 = tonumber(param3) or 0
        if confertitle(player, param2, param3) then
            lualib:sendmsg(actor,"�ƺ���ӳɹ�")
        else
            lualib:sendmsg(actor,"�ƺ����ʧ��")
        end
    end
end

-- ɾ����ҳƺ� gm_deltitle
---@param param1 string �����
---@param param2 string �ƺ�����
function usercmd1011(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        if deprivetitle(player,param2) then
            lualib:sendmsg(actor,"�ƺ�ɾ���ɹ�")
        else
            lualib:sendmsg(actor,"�ƺ�ɾ��ʧ��")
        end
    end
end

-- ������BUFF gm_checkbuff
---@param param1 string �����
---@param param2 number buffID
function usercmd1012(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        param2 = tonumber(param2) or 0
        if param2 < 10000 then
            lualib:sendmsg(actor,"buffid�����10000")
            return
        end
        lualib:sendmsg(actor,string.format("%s-%s-%sBUFF",param1,hasbuff(player,param2) and "ӵ��" or "û��",param2))
    end
end

-- ������BUFF gm_addbuff
---@param param1 string �����
---@param param2 number buffID
---@param param3 number ʱ��
function usercmd1013(actor,param1,param2,param3)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        param2 = tonumber(param2) or 0
        param3 = tonumber(param3) or 0
        if param2 < 10000 then
            lualib:sendmsg(actor,"buffid�����10000")
            return
        end
        if addbuff(player, param2, param3) then
            lualib:sendmsg(actor,"buff��ӳɹ�")
        else
            lualib:sendmsg(actor,"buff���ʧ��")
        end
    end
end

-- ������BUFF2 gm_addbuffex
---@param param1 string �����
---@param param2 number buffID
---@param param3 number ʱ��
---@param param4 number ����
---@param param5 string �ͷ���
---@param param6 string ��������[1#10|4#20]
function usercmd1014(actor,param1,param2,param3,param4,param5,param6)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        param2 = tonumber(param2) or 0
        param3 = tonumber(param3) or 0
        param4 = tonumber(param4) or 0
        local hiter = lualib:getplayerbyname(actor,param5) or player
        if param2 < 10000 then
            lualib:sendmsg(actor,"buffid�����10000")
            return
        end
        local attr = {}
        for k,v in string.gmatch(param6,"([^#]+)#([^|]+)") do
            attr[tonumber(k)] = tonumber(v)
        end
        -- LOGPrint("attr",tbl2json(attr))
        if addbuff(player, param2, param3,param4,hiter,attr) then
            lualib:sendmsg(actor,"buff��ӳɹ�")
        else
            lualib:sendmsg(actor,"buff���ʧ��")
        end
    end
end

-- ɾ�����BUFF gm_delbuff
---@param param1 string �����
---@param param2 number buffID
function usercmd1015(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        if delbuff(player, param2) then
            lualib:sendmsg(actor,"buffɾ���ɹ�")
        else
            lualib:sendmsg(actor,"buffɾ��ʧ��")
        end
    end
end

-- ==================================================================================
-- ==================================================================================
-- =====================================//��ͼ//=====================================
-- ==================================================================================
-- ==================================================================================

-- ��ת��ͼ @gm_mapmove
---@param param1 string ��ͼ��
---@param param2 number X
---@param param3 number Y
function usercmd2001(actor,param1,param2,param3)
    if not lualib:playerIsGm(actor) then return end
    param2 = tonumber(param2) or 0
    param3 = tonumber(param3) or 0
    mapmove(actor,param1,param2,param3)
    lualib:sendmsg(actor,"��ͼ��ת")
end

-- ȫ�����(10*10) gm_killmon1
---@param param1 string ������(`*`ȫ��)
---@param param2 string �Ƿ����
function usercmd2002(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local bool = param2 == "1" and true or false
    local map,x,y = getbaseinfo(player,3), getbaseinfo(player,4), getbaseinfo(player,5)
    local mons = getmapmon(map,param1,x,y,10)
    for i, mon in ipairs(mons or {}) do
        killmonbyobj(actor,mon,bool,bool,bool)
        lualib:sendmsg(actor,"ȫ�����2")
    end
end

-- ��ͼ��� gm_killmon2
---@param param1 string ������(`*`ȫ��)
---@param param2 string �Ƿ����
function usercmd2003(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local bool = param2 == "1" and true or false
    local map = getbaseinfo(player,3)
    killmonsters(map,param1,0,bool)
    lualib:sendmsg(actor,"��ͼ���")
end

-- ��ѯ��ǰ��ͼ���� "@gm_selectmon ��������"
---@param param1 string ������(`*`ȫ����ѯ)
function usercmd2004(actor,param1)
    if not lualib:playerIsGm(actor) then return end
    local map = getbaseinfo(actor,3)
    local mons = getmapmon(map,param1,0,0,999)
    for i, mon in ipairs(mons or {}) do
        lualib:sendmsg(actor,string.format("mon,%s - [%s,%s]",getbaseinfo(mon,1),getbaseinfo(mon,4),getbaseinfo(mon,5)))
    end
end

-- ��ѯ��ǰ��ͼ��� "@gm_selectplay"
function usercmd2005(actor)
    if not lualib:playerIsGm(actor) then return end
    local map = getbaseinfo(actor,3)
    local player_list = getplaycount(map,true,true)
    for i, player in ipairs(player_list or {}) do
        lualib:sendmsg(actor,string.format("player,%s - [%s,%s]",getbaseinfo(player,1),getbaseinfo(player,4),getbaseinfo(player,5)))
    end
end

-- ת�Ƶ�ǰ��ͼ��� "@gm_moveplayers Ŀ���ͼ�� X Y"
---@param param1 string ��ͼ��
---@param param2 number X
---@param param3 number Y
function usercmd2006(actor,param1,param2,param3)
    if not lualib:playerIsGm(actor) then return end
    param2 = tonumber(param2) or 0
    param3 = tonumber(param3) or 0
    local players = getplaycount(param1,true,true)
    for _, player in ipairs(type(players) == "table" and players or {}) do
        -- if player ~= actor then
            mapmove(player,param1,param2,param3)
        -- end
    end
    lualib:sendmsg(actor,"��ͼת�����")
end

-- ==================================================================================
-- ==================================================================================
-- =====================================//����//=====================================
-- ==================================================================================
-- ==================================================================================


-- function usercmd3001(actor,param1)
-- end

-- ==================================================================================
-- ==================================================================================
-- =====================================//NPC//======================================
-- ==================================================================================
-- ==================================================================================

-- ˢnpc gm_createnpc
---@param param1 string ��ͼ��
---@param param2 number X
---@param param3 number Y
---@param param4 number npcID
---@param param5 string npc����
---@param param6 number ����[appr]
---@param param7 string �ű�·��[script]
function usercmd4001(actor,param1,param2,param3,param4,param5,param6,param7)
    if not lualib:playerIsGm(actor) then return end
    param2 = tonumber(param2) or 0
    param3 = tonumber(param3) or 0
    param4 = tonumber(param4) or 0
    param6 = tonumber(param6) or 0

    local npcInfo = {}
    npcInfo.Idx = param4
    npcInfo.npcname = param5
    npcInfo.appr = param6
    npcInfo.script = param7
    createnpc(param1,param2,param3,tbl2json(npcInfo))
    lualib:sendmsg(actor,"������ʱnpc")
end

-- ==================================================================================
-- ==================================================================================
-- =====================================//����//=====================================
-- ==================================================================================
-- ==================================================================================

-- ˢ�� gm_genmon
---@param param1 string ��ͼ��
---@param param2 number X
---@param param3 number Y
---@param param4 string ��������
---@param param5 number ��Χ
---@param param6 number ����
---@param param7 number ��ɫ
function usercmd5001(actor,param1,param2,param3,param4,param5,param6,param7)
    if not lualib:playerIsGm(actor) then return end
    param2 = tonumber(param2) or 0
    param3 = tonumber(param3) or 0
    param5 = tonumber(param5) or 5
    param6 = tonumber(param6) or 1
    param7 = tonumber(param7) or 0
    genmon(param1,param2,param3,param4,param5,param6,param7)
    lualib:sendmsg(actor,string.format("�ɹ�ˢ�� %s * %s",param4,param6))
end

-- ==================================================================================
-- ==================================================================================
-- =====================================//�л�//=====================================
-- ==================================================================================
-- ==================================================================================

-- �����л� "@gm_addguild ������� �л�����"
---@param param1 string �����
---@param param2 string �л�����
function usercmd6001(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        local guild = getmyguild(actor)
        if guild == "0" then
            addguildmember(player,param2)
            lualib:sendmsg(actor,string.format("%s����%s",param1,param2))
        else
            lualib:sendmsg(actor,string.format("���%s�Ѿ������л�:",param1,getguildinfo(guild,1)))
        end
    end
end

-- �˳��л� "@gm_delguild �������"
function usercmd6002(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        local guild = getmyguild(actor)
        if guild ~= "0" then
            delguildmember(player,param2)
            lualib:sendmsg(actor,string.format("%s����%s",param1,param2))
        else
            lualib:sendmsg(actor,string.format("���%sû�м����л�",param1))
        end
    end
end

-- �����л�ְ�� "@gm_setguildlv ������� �л�ְ��"
function usercmd6003(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        param2 = tonumber(param2) or 5
        local lv = getplayguildlevel(player)
        if lv ~= param2 and setplayguildlevel(player,param2) then
            lualib:sendmsg(actor,string.format("����%s�л�ְ�� %s �� %s",lv,param2))
        else
            lualib:sendmsg(actor,string.format("%ְ������ʧ��%s",param1,param2))
        end
    end
end

-- ==================================================================================
-- ==================================================================================
-- =====================================//ɳ�Ϳ�//===================================
-- ==================================================================================
-- ==================================================================================

-- ��ȡɳ�Ϳ˻�����Ϣ "@gm_castleinfo ��Ϣ����"
function usercmd7001(actor,param1)
    if not lualib:playerIsGm(actor) then return end
    param1 = tonumber(param1) or 1
    local config = {
        [1] = "ɳ������",
        [2] = "ɳ���л�����",
        [3] = "ɳ���л�᳤����",
        [4] = "ռ������",
        [5] = "��ǰ�Ƿ��ڹ�ɳ״̬",
        [6] = "ɳ���лḱ�᳤"
    }
    if not config[param1] then return lualib:sendmsg(actor,"δ֪����") end
    local value = castleinfo(param1)
    if type(value) == "table" then
        for i, name in ipairs(t) do
            lualib:sendmsg(actor,string.format("%s[%s] - %s",config[param1],i,name))
        end
    else
        lualib:sendmsg(actor,string.format("%s - %s",config[param1],value))
    end
end