Newranklist = {}
Newranklist.ID = 31600

local cfgsj =  cfg_sj
local playersnum = 20 --�ϰ����� ��ֹ��Ϸ���� cocos��ʱ�̶�����20  ��������Ϊ4ǧ
local my = "C_QsQmyrank"
local list = "C_QsQranklist_tab"

-------------------------------������ ������Ϣ ������---------------------------------------
--ͬ������

function Newranklist.SyncResponse(actor)
    local tab = {}
	local list_tab = getsysvarex(list)
    list_tab = json2tbl(list_tab)
	if list_tab == nil then
		table.insert(tab, {"","","","",0})
	else
		tab = list_tab
	end
    Message.sendmsg(actor, ssrNetMsgCfg.Newranklist_SyncResponse,1,1,1,tab)
end

function Newranklist.synchronization()
    local tab = {}
	local list_tab = getsysvarex(list)
    list_tab = json2tbl(list_tab)
	if list_tab == nil then
		table.insert(tab, {"","","","",0})
	else
		tab = list_tab
	end
    local ls = {}
   
    local players = getplayerlst()
    if #players >= 1 then
        for i=1,#players do
            local id = getbaseinfo(players[i], ConstCfg.gbase.id)
            local name = getbaseinfo(players[i], ConstCfg.gbase.name)
            local guild = getbaseinfo(players[i], ConstCfg.gbase.guild)

            local att = getbaseinfo(players[i], ConstCfg.gbase.dc2)
            local att_bf = (getbaseinfo(players[i], 51, 35)*0.01) or 0
            local attmax = att + (att*att_bf)
            ls[i] = {players[i],id,name,guild,attmax} 
        end

        table.sort(ls,function(a,b) return a[5] > b[5] end)


        local ls20 = {}
        for k,v in ipairs(ls) do
            if k <= 20 then
                table.insert(ls20,v)
            end
        end

        for i=1,#ls do
            table.insert(tab,ls[i])
        end
        local zl_tab = {}
        for k,v in ipairs(tab) do
            if v[2] ~= "" then
                zl_tab[v[2]] = v
            end
        end
        local cx_tab = {}
        for k,v in pairs(zl_tab) do
            table.insert(cx_tab,v)
        end

        tab = cx_tab

        table.sort(tab,function(a,b) return a[5] > b[5] end)
        local tab20 = {}
        for k,v in ipairs(tab) do
            if k <= 20 then
                table.insert(tab20,v)
            end
        end
        tab = tab20
        
        setsysvarex(list,tbl2json(tab),1)
    end
end
 
function Newranklist.RequestZS(actor)

    local list_tab = getsysvarex(list)
    list_tab = json2tbl(list_tab)
    Message.sendmsg(actor, ssrNetMsgCfg.Newranklist_SyncResponse,1,1,1,list_tab)
    
    local play = {}
    local pm = 0
    local guild = getbaseinfo(actor, ConstCfg.gbase.guild)
    local id = getbaseinfo(actor, ConstCfg.gbase.id)

    play[1]=guild
    if list_tab ~= nil then
        for i=1,#list_tab do 
            if list_tab[i][2] == id then
                pm = i
                break
            end
        end
    end

    Message.sendmsg(actor, ssrNetMsgCfg.Newranklist_ZSResponse,pm,2,2,play)
end

Message.RegisterNetMsg(ssrNetMsgCfg.Newranklist, Newranklist)  --ע��

-------------------------------������ ��Ϸ�¼� ������---------------------------------------

--��¼���
GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas)
    Newranklist.SyncResponse(actor, logindatas)
end, Newranklist)

return Newranklist