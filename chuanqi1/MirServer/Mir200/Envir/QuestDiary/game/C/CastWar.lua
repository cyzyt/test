CastWar = {}
CastWar.ID = 31400

local cfg = cfg_sbk


local function _Castlewaract()
    inisysvar("string", "C_QsQcastlewarplayers")  -- ���빥����Ա��

    --LOGWrite("��˵")
end

local function _Castlewarend()
    local title = "ɳ������"
    local player_castle = castleinfo(ConstCfg.castle.info.guildmgr)
    if player_castle ~= "����Ա" then
        local castle_yes = castleinfo(2)  --ʤ�����л�����
        local guid_guid = findguild(1,castle_yes)  --��ȡ�л�guid
        local guid_tab =  getguildinfo(guid_guid,3)  --�����л�guid��ȡ�л��Ա name�����᳤
        local gtab = {}
        for k,v in ipairs(guid_tab) do
            gtab[v]=1
        end

        local players_tab = getsysvarex("C_QsQcastlewarplayers")
        players_tab = json2tbl(players_tab)  --����������

        if players_tab == nil then
           return
        end
        
        for i=1,#players_tab do
            local jl = ""
            local content = ""
            local ji_tab = {}
            if players_tab[i][2] == player_castle then --������������
                content = "����ɳ�����Ի�У���Ϊ��ɳ�Ϳ��ϴ�������˻᳤ר������������ա�"
                ji_tab = cfg[1]["reward"] 
            end 
            for i=1,#ji_tab do     --��������
                local prizename = getstditeminfo(ji_tab[i][1],1)
                jl=jl..prizename.."#"..ji_tab[i][2].."&"
            end
            if jl ~= "" then 
                sendmail("#"..player_castle,1,title,content,jl) 
            end

            local hao_tab = {}  --ʤ����
            local huai_tab = {} --ʧ�ܱ�

            if players_tab[i][2] ~= "" then
                if players_tab[i][2] ~= player_castle then --�޳�����
                    if gtab[players_tab[i][2]] == 1 then  --ʤ���л��Ա�ڲ���������
                        table.insert(hao_tab,players_tab[i][2])
                    else
                        table.insert(huai_tab,players_tab[i][2])
                    end
                end 
            end

            for j=1,#hao_tab do 
                local hao_content = "�����л�ɳ�����Ի�У��ɹ�ռ��ɳ�Ϳˣ��������ʤ���߽���������ա�"
                local hao_jltab = cfg[1]["rewardt"]
                local hao_jl = ""
                for i=1,#hao_jltab do
                    local prizename = getstditeminfo(hao_jltab[i][1],1)
                    hao_jl=hao_jl..prizename.."#"..hao_jltab[i][2].."&"
                end
                if hao_jl ~= "" then 
                    sendmail("#"..hao_tab[j],1,title,hao_content,hao_jl) 
                end
            end

            for j=1,#huai_tab do 
                local huai_content = "�����л�ɳ�����Ի�У���δռ��ɳ�Ϳˣ�������Ŭ�����ǿ������У����Ļ���˼����߽���������ա�"
                local huai_jltab = cfg[2]["rewardt"]
                local huai_jl = ""
                for i=1,#huai_jltab do
                    local prizename = getstditeminfo(huai_jltab[i][1],1)
                    huai_jl=huai_jl..prizename.."#"..huai_jltab[i][2].."&"
                end
                if huai_jl ~= "" then
                    sendmail("#"..huai_tab[j],1,title,huai_content,huai_jl) 
                end
            end
        end
    end 
    setsysvarex("C_QsQcastlewarplayers","",1)
    --LOGWrite("�˱����������ɺ�")
end

local function _mapeventwalk(actor)
    local tab = {}

    local keyname = getbaseinfo(actor,ConstCfg.gbase.name) 
    local guild = getbaseinfo(actor,ConstCfg.gbase.guild)   --û���л� ���� ""  ������ nil
    if guild == "" then
        return
    end
    local id = getbaseinfo(actor,ConstCfg.gbase.id) 
    local players_tab = getsysvarex("C_QsQcastlewarplayers")
    players_tab = json2tbl(players_tab)
    if players_tab == nil then
		table.insert(tab,{"",""}) -- ����  guid
	else
		tab = players_tab
	end
    local temp = 0
    for i=1,#tab do
        if tab[i][1] == id then
            if tab[i][2] ~= keyname then
                tab[i][2] = keyname
            end
            setsysvarex("C_QsQcastlewarplayers",tbl2json(tab),1)
            return
        else
            temp = 1
        end
    end

    local mc = #tab
    if temp ~= 0 then
        tab[mc+1] = {id,keyname}
    end
    setsysvarex("C_QsQcastlewarplayers",tbl2json(tab),1)
    --LOGWrite("���������˽��Լ��������룬���ж��˽��Լ��أ�")
end

--�����ʱ
--����������л��Ա==����
--ʤ�����᳤ ��ʤ����������Ա  �����ʼ� ʤ���ʼ�����
--������Ա  �����ʼ� ʧ���ʼ� ����
--@Allcastwar
--@ForcedWallconquestWar ��ʼ/ֹͣ����
GameEvent.add(EventCfg.gocastlewarstart ,_Castlewaract,CastWar)
GameEvent.add(EventCfg.goCastlewarend, _Castlewarend,CastWar)
GameEvent.add(EventCfg.gomapeventwalk, _mapeventwalk,CastWar)
return CastWar