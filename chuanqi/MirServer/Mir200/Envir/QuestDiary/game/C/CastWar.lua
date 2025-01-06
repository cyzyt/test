CastWar = {}
CastWar.ID = 31400

local cfg = cfg_sbk


local function _Castlewaract()
    inisysvar("string", "C_QsQcastlewarplayers")  -- 参与攻城人员表

    --LOGWrite("据说")
end

local function _Castlewarend()
    local title = "沙城争霸"
    local player_castle = castleinfo(ConstCfg.castle.info.guildmgr)
    if player_castle ~= "管理员" then
        local castle_yes = castleinfo(2)  --胜利者行会名字
        local guid_guid = findguild(1,castle_yes)  --获取行会guid
        local guid_tab =  getguildinfo(guid_guid,3)  --根据行会guid获取行会成员 name包括会长
        local gtab = {}
        for k,v in ipairs(guid_tab) do
            gtab[v]=1
        end

        local players_tab = getsysvarex("C_QsQcastlewarplayers")
        players_tab = json2tbl(players_tab)  --参与者名单

        if players_tab == nil then
           return
        end
        
        for i=1,#players_tab do
            local jl = ""
            local content = ""
            local ji_tab = {}
            if players_tab[i][2] == player_castle then --城主参与者中
                content = "您在沙城争霸活动中，成为了沙巴克老大，您获得了会长专属奖励，请查收。"
                ji_tab = cfg[1]["reward"] 
            end 
            for i=1,#ji_tab do     --城主奖励
                local prizename = getstditeminfo(ji_tab[i][1],1)
                jl=jl..prizename.."#"..ji_tab[i][2].."&"
            end
            if jl ~= "" then 
                sendmail("#"..player_castle,1,title,content,jl) 
            end

            local hao_tab = {}  --胜利表
            local huai_tab = {} --失败表

            if players_tab[i][2] ~= "" then
                if players_tab[i][2] ~= player_castle then --剔除城主
                    if gtab[players_tab[i][2]] == 1 then  --胜利行会成员在参与名单中
                        table.insert(hao_tab,players_tab[i][2])
                    else
                        table.insert(huai_tab,players_tab[i][2])
                    end
                end 
            end

            for j=1,#hao_tab do 
                local hao_content = "您的行会沙城争霸活动中，成功占领沙巴克，您获得了胜利者奖励，请查收。"
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
                local huai_content = "您的行会沙城争霸活动中，虽未占领沙巴克，但您的努力我们看在眼中，您的获得了激励者奖励，请查收。"
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
    --LOGWrite("人被剥夺了自由后")
end

local function _mapeventwalk(actor)
    local tab = {}

    local keyname = getbaseinfo(actor,ConstCfg.gbase.name) 
    local guild = getbaseinfo(actor,ConstCfg.gbase.guild)   --没有行会 返回 ""  而不是 nil
    if guild == "" then
        return
    end
    local id = getbaseinfo(actor,ConstCfg.gbase.id) 
    local players_tab = getsysvarex("C_QsQcastlewarplayers")
    players_tab = json2tbl(players_tab)
    if players_tab == nil then
		table.insert(tab,{"",""}) -- 名字  guid
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
    --LOGWrite("才能真正了解自己。我在想，你有多了解自己呢？")
end

--活动开启时
--进入区域的行会成员==参与活动
--胜利方会长 和胜利方参与人员  发送邮件 胜利邮件奖励
--参与人员  发送邮件 失败邮件 奖励
--@Allcastwar
--@ForcedWallconquestWar 开始/停止攻城
GameEvent.add(EventCfg.gocastlewarstart ,_Castlewaract,CastWar)
GameEvent.add(EventCfg.goCastlewarend, _Castlewarend,CastWar)
GameEvent.add(EventCfg.gomapeventwalk, _mapeventwalk,CastWar)
return CastWar