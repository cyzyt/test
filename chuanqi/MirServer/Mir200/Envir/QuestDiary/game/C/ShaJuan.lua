ShaJuan = {}
ShaJuan.ID = 31100

local cfgsj =  cfg_sj

    -- ---------��������ȫ�ֱ���act-----------
    -- inisysvar("integer", "C_QsQsjdqval")  --shajuan
    -- inisysvar("string", "C_QsQsjjuan_tab")  --shajuan
    -- inisysvar("integer", "C_QsQHFCOUNT")  -- �Ϸ����
    -- ---------��������ȫ�ֱ���end-----------

    -- local hefuvar = getsysvarex("C_QsQHFCOUNT")
    -- local hefu = grobalinfo(3)
    -- if hefuvar ~= hefu then 
    --     local juan_tab = getsysvarex("C_QsQsjjuan_tab")
    --     juan_tab = QMjson2tbl(juan_tab)
    --     local tab = {}
    --     local juan_dq = 0
    --     setsysvarex("C_QsQHFCOUNT",hefu, 1)  
    --     local juan_mytab = sorthumvar("C_QsQsjjuan_my",0,1,0)
    --     for i=1,#juan_mytab,2 do
    --         if juan_mytab[i+1] ~= nil then
    --             juan_dq = juan_dq + juan_mytab[i+1]
    --             if juan_tab ~= nil then  --���װ�Ϊ��
    --                 local player_info = {juan_mytab[i],juan_mytab[i+1]}
    --                 table.insert(tab,player_info)
    --             end
    --         end
    --     end
    --     table.sort(tab, function(a,b) return a[2] > b[2] end)
    --     setsysvarex("C_QsQsjjuan_tab",QMtbl2json(tab),1)
    --     setsysvarex("C_QsQsjdqval",juan_dq, 1)  --��������ͳ�����о���
    -- end
-------------------------------������ ������Ϣ ������---------------------------------------
--ͬ������
local _login_data = {ssrNetMsgCfg.ShaJuan_SyncResponse, 0}
function ShaJuan.SyncResponse(actor, logindatas)

    local juan_my = getplayvar(actor,"C_QsQsjjuan_my")
	local juan_dq = getsysvarex("C_QsQsjdqval")  
    local juan_tab = getsysvarex("C_QsQsjjuan_tab")
    juan_tab = json2tbl(juan_tab)
    if logindatas then
        _login_data[2] = juan_my
        _login_data[3] = juan_dq
        _login_data[4] = 0
        _login_data[5] = juan_tab
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.ShaJuan_SyncResponse,juan_my,juan_dq,0, juan_tab)
    end
end

    
function ShaJuan.RequestZS(actor,num)
    num = tonumber(num)
    if num <= 0 then
        return
    end

    num = num * 1000
    local huibi = querymoney(actor,7)
    if huibi < num then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>�������</font>","Type":9}')
        return
    end
    changemoney(actor,7,"-",num,"ɳ�Ǿ���",true)
	local t = getplayerlst()
	local my = getplayvar(actor,"C_QsQsjjuan_my")
    local wan = getplayvar(actor,"C_QsQsjjuan_wan")
	setplayvar(actor, "HUMAN","C_QsQsjjuan_my",my+num,1)

	local dqval = getsysvarex("C_QsQsjdqval")  
	setsysvarex("C_QsQsjdqval",dqval + num, 1)  --�����ܽ��
	
	local tab = {}
	local juan_tab = getsysvarex("C_QsQsjjuan_tab")
    juan_tab = json2tbl(juan_tab)
	if juan_tab == nil then
		table.insert(tab, {"",0,"",""})
	else
		tab = juan_tab
	end
    local name = getbaseinfo(actor, ConstCfg.gbase.name)
    local juan_my = getplayvar(actor,"C_QsQsjjuan_my")
    
    if juan_my >= cfgsj[1]["qian"][1][2] then
        if wan == 0 then
            local sx1 = {}
            local sx2 = cfgsj[1]["shuxing"]
            Player.updateSomeAddr(actor, sx1, sx2)
            setplayvar(actor, "HUMAN","C_QsQsjjuan_wan",1,1)
        end
    end

	local player_info = {name,juan_my}
    if tab ~= nil then
        for i=1,5 do  --ǰ5���ȿ۳�  ��������
            if tab[i] == nil then
                break
            end
            for j=1,#t do
                if tab[i][1] ~= nil or tab[i][1] ~= "" then
                    local tname = getbaseinfo(t[j], ConstCfg.gbase.name)
                    if tname == tab[i][1] then
                        local att1 = cfgsj[i]["attribute1"]
                        local att2 = {}
                        Player.updateSomeAddr(t[j], att1, att2)
                    end
                end
            end
        end
    end

    local temp_index = 0
	for i=1, #tab do
		if tab[i][1] == name then
			temp_index = i
			break
		end
	end
	local mc = #tab
	if temp_index ~= 0 then
		tab[temp_index] = player_info
	else
		tab[mc+1] = player_info
	end

    table.sort(tab, function(a,b) return a[2] > b[2] end)
    for i=1,5 do  --������������������
        if tab[i] == nil then
            break
        end
        for j=1,#t do
            if tab[i][1] ~= nil or tab[i][1] ~= "" then
                local name = getbaseinfo(t[j], ConstCfg.gbase.name)
                if name == tab[i][1] then
                    local att1 = {}
                    local att2 = cfgsj[i]["attribute1"]
                    Player.updateSomeAddr(t[j], att1, att2)
                end
            end
        end
    end

    setsysvarex("C_QsQsjjuan_tab",tbl2json(tab),1)
    sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>���׳ɹ�</font>","Type":9}')

    local juan_my = getplayvar(actor,"C_QsQsjjuan_my")
	local juan_dq = getsysvarex("C_QsQsjdqval")  
    local juan_tab = getsysvarex("C_QsQsjjuan_tab")
    juan_tab = json2tbl(juan_tab)
    
    Message.sendmsg(actor, ssrNetMsgCfg.ShaJuan_ZSResponse,juan_my,juan_dq,2,juan_tab)
    ShaJuan.ALLSyncResponse()
end


function ShaJuan.ALLSyncResponse()
    local t = getplayerlst()
    for i=1,#t do 
        ShaJuan.SyncResponse(t[i], logindatas)
    end
end



Message.RegisterNetMsg(ssrNetMsgCfg.ShaJuan, ShaJuan)  --ע��

-- ----------------------------������ ��Ϸ�¼� ������---------------------------------------


local function _playerVar(actor)
    iniplayvar(actor, "integer", "HUMAN", "C_QsQsjjuan_my")
    iniplayvar(actor, "integer", "HUMAN", "C_QsQsjjuan_wan")
    iniplayvar(actor, "string", "HUMAN", "C_QsQkeyname") --���keyname

end

local function _playeCastlewarend()
    local prizename = getstditeminfo(7,1)
    local juan_dq = getsysvarex("C_QsQsjdqval")  
    local jl = 0
    local player_castle = castleinfo(ConstCfg.castle.info.guildmgr)
    if player_castle ~= "����Ա" then
        title = "���׽���"
        content = "����ɳ�����Ի�У���Ϊ��ɳ�Ϳ��ϴ������л������ܾ��׵�60%������ע����䣬����ա�"
        sendmail("#"..player_castle,1,title,content,prizename.."#"..(juan_dq*0.6))
    end 
    local t = getplayerlst()
    local cfgsj =  cfg_sj
    for i=1,#t do 
        local wan = getplayvar(t[i],"C_QsQsjjuan_wan")
        if wan == 1 then
            local sx1 = cfgsj[1]["shuxing"]
            local sx2 = {}
            Player.updateSomeAddr(t[i], sx1, sx2)
        end
        Message.sendmsg(t[i], ssrNetMsgCfg.ShaJuan_ZSResponse,0,0,2,{})
    end
    local tab = {}
    local juan_tab = getsysvarex("C_QsQsjjuan_tab")
    juan_tab = json2tbl(juan_tab)
    if juan_tab == nil then
        table.insert(tab, {"",0,""})
    else
        tab = juan_tab
    end
    if tab ~= nil then
        for i=1,5 do  --ǰ5���ȿ۳�  ��������
            if tab[i] == nil then
                break
            end
            for j=1,#t do
                if tab[i][1] ~= nil or tab[i][1] ~= "" then
                    local name = getbaseinfo(t[j], ConstCfg.gbase.name)
                    if name == tab[i][1] then
                        local att1 = cfgsj[i]["attribute1"]
                        local att2 = {}
                        Player.updateSomeAddr(t[j], att1, att2)
                    end
                end
            end
        end
    end
    clearhumcustvar("","C_QsQsjjuan_wan")
    clearhumcustvar("","C_QsQsjjuan_my")
    setsysvarex("C_QsQsjjuan_tab","",1)
    setsysvarex("C_QsQsjdqval",0,1)
end



GameEvent.add(EventCfg.goPlayerVar, _playerVar, ShaJuan)

GameEvent.add(EventCfg.goCastlewarend, _playeCastlewarend,ShaJuan)

--��¼��������  �����������Ը���  --��¼ʱ�Ὣ���Ա�������Ը��±��� Ȼ��ִ�����Ը��²���
GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    local name = getbaseinfo(actor, ConstCfg.gbase.name)
    local juan_tab = getsysvarex("C_QsQsjjuan_tab")
    local wan = getplayvar(actor,"C_QsQsjjuan_wan")
    local id = getbaseinfo(actor, ConstCfg.gbase.id)
    if wan == 1 then
        local sx = cfgsj[1]["shuxing"]
        table.insert(loginattrs, sx)
    end
    juan_tab = json2tbl(juan_tab)
    if juan_tab == nil or juan_tab == "" then
        return 
    end 
    for i=1,5 do
        if juan_tab[i] == nil then
            break
        end
        if juan_tab[i][1] ~= nil then
            if juan_tab[i][1] == name then
                local cfg = cfgsj[i]["attribute1"]
                table.insert(loginattrs, cfg)
                break
            end
        end
    end
    
end, ShaJuan)

--��¼���
GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas)
    ShaJuan.SyncResponse(actor, logindatas)
end, ShaJuan)



return ShaJuan