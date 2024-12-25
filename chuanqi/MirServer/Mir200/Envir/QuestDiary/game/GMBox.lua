lualib = lualib or {}

function lualib:playerIsGm(actor)
    local gmLv = getgmlevel(actor)
    if gmLv < 10 then
        sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>GM权限不足</font>","Type":9}')
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
        lualib:sendmsg(actor,"玩家不存在")
    end
    return player
end

-- ==================================================================================
-- ==================================================================================
-- =====================================//系统//=====================================
-- ==================================================================================
-- ==================================================================================

--获取系统变量 gm_getsysvar
---@param param1 string 变量名
function usercmd1(actor,param1)
    if not lualib:playerIsGm(actor) then return end
    lualib:sendmsg(actor,string.format("获取 %s变量 : %s",param1,getsysvar(param1)))
end

--设置系统变量 gm_setsysvar
---@param param1 string 变量名
---@param param2 string|number 变量值
---@param param3 string 变量值类型
function usercmd2(actor,param1,param2,param3)
    if not lualib:playerIsGm(actor) then return end
    param2 = tonumber(param2) or param2
    if param3 == "integer" then
        param2 = tonumber(param2) or 0
    end
    local var = getsysvar(param1)
    setsysvar(param1,param2)
    lualib:sendmsg(actor,string.format("修改 %s变量 : %s → %s",param1,param2,var,getsysvar(param1)))
end

--声明系统自定义变量 gm_inisysvarex
---@param param1 string 变量名
---@param param2 string 变量值类型
function usercmd3(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    inisysvar(param2,param1,0)
    lualib:sendmsg(actor,string.format("声明系统自定义变量,%s - %s",param1,param2))
end

--获取系统自定义变量 gm_getsysvarex
---@param param1 string 变量名
function usercmd4(actor,param1)
    if not lualib:playerIsGm(actor) then return end
    lualib:sendmsg(actor,param1..":"..getsysvarex(param1))
end

--设置系统自定义变量 gm_setsysvarex
---@param param1 string 变量名
---@param param2 string|number 变量值
---@param param3 string 变量值类型
---@param param4 number 是否保存数据库
function usercmd5(actor,param1,param2,param3,param4)
    if not lualib:playerIsGm(actor) then return end
    if param3 == "integer" then
        param2 = tonumber(param2) or 0
    end
    param4 = tonumber(param4) or 0
    local var = getsysvarex(param1)
    setsysvarex(param1,param2,param4)
    lualib:sendmsg(actor,string.format("修改 %s变量 : %s → %s",param1,param2,var,getsysvarex(param1)))
end

--设置系统自定义变量 gm_setsysvarex
---@param param1 string 变量名
---@param param2 string|number 变量值
---@param param3 string 变量值类型
---@param param4 number 是否保存数据库
function usercmd5(actor,param1,param2,param3,param4)
    if not lualib:playerIsGm(actor) then return end
    if param3 == "integer" then
        param2 = tonumber(param2) or 0
    end
    param4 = tonumber(param4) or 0
    local var = getsysvarex(param1)
    setsysvarex(param1,param2,param4)
    lualib:sendmsg(actor,string.format("修改 %s变量 : %s → %s",param1,param2,var,getsysvarex(param1)))
end

--请求一条来自服务端的消息 gm_sendluamsg
---@param param1 number 消息号
---@param param2 number 参数1
---@param param3 number 参数2
---@param param4 number 参数3
---@param param5 string 参数3
function usercmd6(actor,param1,param2,param3,param4,param5)
    if not lualib:playerIsGm(actor) then return end
    param1 = tonumber(param1) or 0
    param2 = tonumber(param2) or 0
    param3 = tonumber(param3) or 0
    param4 = tonumber(param4) or 0
    sendluamsg(actor,param1,param2,param3,param3,param5)
    lualib:sendmsg(actor,string.format("给客户端发送%s号消息",param1))
end

-- ==================================================================================
-- ==================================================================================
-- =====================================//玩家//=====================================
-- ==================================================================================
-- ==================================================================================

--获取玩家变量 gm_getplayvar
---@param param1 string 玩家名
---@param param2 string 变量名
function usercmd1001(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        lualib:sendmsg(actor,string.format("%s 获取 %s变量 : %s",param1,param2,getplaydef(player,param2)))
    end
end

--设置玩家变量 gm_setplayvar
---@param param1 string 玩家名
---@param param2 string 变量名
---@param param3 string|number 变量值
---@param param4 string 变量值类型
function usercmd1002(actor,param1,param2,param3,param4)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        if param4 == "integer" then
            param3 = tonumber(param3) or 0
        end
        local var = getplaydef(player,param2)
        setplaydef(player,param2,param3)
        lualib:sendmsg(actor,string.format("%s 修改 %s变量 : %s → %s",param1,param2,var,getplaydef(player,param2)))
    end
end

--获取玩家自定义变量 gm_getplayvarex
---@param param1 string 玩家名
---@param param2 string 变量名
function usercmd1003(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        lualib:sendmsg(actor,string.format("%s 获取 %s变量 : %s",param1,param2,getplayvar(player,"HUMAN",param2) or "获取失败(未声明)"))
    end
end

--设置玩家自定义变量 gm_setplayvarex
---@param param1 string 玩家名
---@param param2 string 变量名
---@param param3 string|number 变量值
---@param param4 string 变量值类型
---@param param5 number 是否保存数据库
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
        lualib:sendmsg(actor,string.format("%s 修改 %s变量 : %s → %s",param1,param2,var,getplayvar(player,"HUMAN",param2)))
    end
end

-- 跳转到玩家附近 gm_jumptoplay
---@param param1 string 玩家名
function usercmd1005(actor,param1)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        local map,x,y = getbaseinfo(player,3), getbaseinfo(player,4), getbaseinfo(player,5)
        mapmove(actor,map,x,y,5)
        lualib:sendmsg(actor,string.format("跳转到 %s [%s,%s]",map,x,y))
    end
end

-- 拉玩家到身边 gm_bringplay
---@param param1 string 玩家名
function usercmd1006(actor,param1)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        local map,x,y = getbaseinfo(actor,3), getbaseinfo(actor,4), getbaseinfo(actor,5)
        mapmove(player,map,x,y,5)
        lualib:sendmsg(actor,string.format("拉人到 %s [%s,%s]",map,x,y))
    end
end

-- 发送背包道具 gm_giveitem
---@param param1 string 玩家名
---@param param2 string 物品名称
---@param param3 number 数量
---@param param4 number 规则
function usercmd1007(actor,param1,param2,param3,param4)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        param3 = tonumber(param3) or 1
        param4 = tonumber(param4) or 0
        if giveitem(player,param2,param3,param4) then
            lualib:sendmsg(actor,string.format("发送物品 %s → %s",param2,param1))
        else
            lualib:sendmsg(actor,string.format("%s发送失败",param2))
        end
    end
end

-- 查找背包道具 gm_finditem
---@param param1 string 玩家名
---@param param2 string 物品名称
function usercmd1008(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        lualib:sendmsg(actor,string.format("%s 拥有 %s * %s",param1,param2,getbagitemcount(player,param2) or 0))
    end
end

-- 检测玩家称号 gm_checktitle
---@param param1 string 玩家名
---@param param2 string 称号名称
function usercmd1009(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        lualib:sendmsg(actor,string.format("%s-%s-%s称号",param1,checktitle(player,param2) and "拥有" or "没有",param2))
    end
end

-- 添加玩家称号 gm_addtitle
---@param param1 string 玩家名
---@param param2 string 称号名称
---@param param3 number 是否激活
function usercmd1010(actor,param1,param2,param3)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        param3 = tonumber(param3) or 0
        if confertitle(player, param2, param3) then
            lualib:sendmsg(actor,"称号添加成功")
        else
            lualib:sendmsg(actor,"称号添加失败")
        end
    end
end

-- 删除玩家称号 gm_deltitle
---@param param1 string 玩家名
---@param param2 string 称号名称
function usercmd1011(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        if deprivetitle(player,param2) then
            lualib:sendmsg(actor,"称号删除成功")
        else
            lualib:sendmsg(actor,"称号删除失败")
        end
    end
end

-- 检测玩家BUFF gm_checkbuff
---@param param1 string 玩家名
---@param param2 number buffID
function usercmd1012(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        param2 = tonumber(param2) or 0
        if param2 < 10000 then
            lualib:sendmsg(actor,"buffid需大于10000")
            return
        end
        lualib:sendmsg(actor,string.format("%s-%s-%sBUFF",param1,hasbuff(player,param2) and "拥有" or "没有",param2))
    end
end

-- 添加玩家BUFF gm_addbuff
---@param param1 string 玩家名
---@param param2 number buffID
---@param param3 number 时间
function usercmd1013(actor,param1,param2,param3)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        param2 = tonumber(param2) or 0
        param3 = tonumber(param3) or 0
        if param2 < 10000 then
            lualib:sendmsg(actor,"buffid需大于10000")
            return
        end
        if addbuff(player, param2, param3) then
            lualib:sendmsg(actor,"buff添加成功")
        else
            lualib:sendmsg(actor,"buff添加失败")
        end
    end
end

-- 添加玩家BUFF2 gm_addbuffex
---@param param1 string 玩家名
---@param param2 number buffID
---@param param3 number 时间
---@param param4 number 层数
---@param param5 string 释放者
---@param param6 string 额外属性[1#10|4#20]
function usercmd1014(actor,param1,param2,param3,param4,param5,param6)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        param2 = tonumber(param2) or 0
        param3 = tonumber(param3) or 0
        param4 = tonumber(param4) or 0
        local hiter = lualib:getplayerbyname(actor,param5) or player
        if param2 < 10000 then
            lualib:sendmsg(actor,"buffid需大于10000")
            return
        end
        local attr = {}
        for k,v in string.gmatch(param6,"([^#]+)#([^|]+)") do
            attr[tonumber(k)] = tonumber(v)
        end
        -- LOGPrint("attr",tbl2json(attr))
        if addbuff(player, param2, param3,param4,hiter,attr) then
            lualib:sendmsg(actor,"buff添加成功")
        else
            lualib:sendmsg(actor,"buff添加失败")
        end
    end
end

-- 删除玩家BUFF gm_delbuff
---@param param1 string 玩家名
---@param param2 number buffID
function usercmd1015(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        if delbuff(player, param2) then
            lualib:sendmsg(actor,"buff删除成功")
        else
            lualib:sendmsg(actor,"buff删除失败")
        end
    end
end

-- ==================================================================================
-- ==================================================================================
-- =====================================//地图//=====================================
-- ==================================================================================
-- ==================================================================================

-- 跳转地图 @gm_mapmove
---@param param1 string 地图号
---@param param2 number X
---@param param3 number Y
function usercmd2001(actor,param1,param2,param3)
    if not lualib:playerIsGm(actor) then return end
    param2 = tonumber(param2) or 0
    param3 = tonumber(param3) or 0
    mapmove(actor,param1,param2,param3)
    lualib:sendmsg(actor,"地图跳转")
end

-- 全屏清怪(10*10) gm_killmon1
---@param param1 string 怪物名(`*`全清)
---@param param2 string 是否掉落
function usercmd2002(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local bool = param2 == "1" and true or false
    local map,x,y = getbaseinfo(player,3), getbaseinfo(player,4), getbaseinfo(player,5)
    local mons = getmapmon(map,param1,x,y,10)
    for i, mon in ipairs(mons or {}) do
        killmonbyobj(actor,mon,bool,bool,bool)
        lualib:sendmsg(actor,"全屏清怪2")
    end
end

-- 地图清怪 gm_killmon2
---@param param1 string 怪物名(`*`全清)
---@param param2 string 是否掉落
function usercmd2003(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local bool = param2 == "1" and true or false
    local map = getbaseinfo(player,3)
    killmonsters(map,param1,0,bool)
    lualib:sendmsg(actor,"地图清怪")
end

-- 查询当前地图怪物 "@gm_selectmon 怪物名称"
---@param param1 string 怪物名(`*`全部查询)
function usercmd2004(actor,param1)
    if not lualib:playerIsGm(actor) then return end
    local map = getbaseinfo(actor,3)
    local mons = getmapmon(map,param1,0,0,999)
    for i, mon in ipairs(mons or {}) do
        lualib:sendmsg(actor,string.format("mon,%s - [%s,%s]",getbaseinfo(mon,1),getbaseinfo(mon,4),getbaseinfo(mon,5)))
    end
end

-- 查询当前地图玩家 "@gm_selectplay"
function usercmd2005(actor)
    if not lualib:playerIsGm(actor) then return end
    local map = getbaseinfo(actor,3)
    local player_list = getplaycount(map,true,true)
    for i, player in ipairs(player_list or {}) do
        lualib:sendmsg(actor,string.format("player,%s - [%s,%s]",getbaseinfo(player,1),getbaseinfo(player,4),getbaseinfo(player,5)))
    end
end

-- 转移当前地图玩家 "@gm_moveplayers 目标地图号 X Y"
---@param param1 string 地图号
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
    lualib:sendmsg(actor,"地图转移玩家")
end

-- ==================================================================================
-- ==================================================================================
-- =====================================//道具//=====================================
-- ==================================================================================
-- ==================================================================================


-- function usercmd3001(actor,param1)
-- end

-- ==================================================================================
-- ==================================================================================
-- =====================================//NPC//======================================
-- ==================================================================================
-- ==================================================================================

-- 刷npc gm_createnpc
---@param param1 string 地图号
---@param param2 number X
---@param param3 number Y
---@param param4 number npcID
---@param param5 string npc名称
---@param param6 number 外形[appr]
---@param param7 string 脚本路径[script]
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
    lualib:sendmsg(actor,"创建临时npc")
end

-- ==================================================================================
-- ==================================================================================
-- =====================================//怪物//=====================================
-- ==================================================================================
-- ==================================================================================

-- 刷怪 gm_genmon
---@param param1 string 地图号
---@param param2 number X
---@param param3 number Y
---@param param4 string 怪物名称
---@param param5 number 范围
---@param param6 number 数量
---@param param7 number 颜色
function usercmd5001(actor,param1,param2,param3,param4,param5,param6,param7)
    if not lualib:playerIsGm(actor) then return end
    param2 = tonumber(param2) or 0
    param3 = tonumber(param3) or 0
    param5 = tonumber(param5) or 5
    param6 = tonumber(param6) or 1
    param7 = tonumber(param7) or 0
    genmon(param1,param2,param3,param4,param5,param6,param7)
    lualib:sendmsg(actor,string.format("成功刷怪 %s * %s",param4,param6))
end

-- ==================================================================================
-- ==================================================================================
-- =====================================//行会//=====================================
-- ==================================================================================
-- ==================================================================================

-- 加入行会 "@gm_addguild 玩家名称 行会名称"
---@param param1 string 玩家名
---@param param2 string 行会名称
function usercmd6001(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        local guild = getmyguild(actor)
        if guild == "0" then
            addguildmember(player,param2)
            lualib:sendmsg(actor,string.format("%s加入%s",param1,param2))
        else
            lualib:sendmsg(actor,string.format("玩家%s已经加入行会:",param1,getguildinfo(guild,1)))
        end
    end
end

-- 退出行会 "@gm_delguild 玩家名称"
function usercmd6002(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        local guild = getmyguild(actor)
        if guild ~= "0" then
            delguildmember(player,param2)
            lualib:sendmsg(actor,string.format("%s加入%s",param1,param2))
        else
            lualib:sendmsg(actor,string.format("玩家%s没有加入行会",param1))
        end
    end
end

-- 设置行会职务 "@gm_setguildlv 玩家名称 行会职务"
function usercmd6003(actor,param1,param2)
    if not lualib:playerIsGm(actor) then return end
    local player = lualib:getplayerbyname(actor,param1)
    if player then
        param2 = tonumber(param2) or 5
        local lv = getplayguildlevel(player)
        if lv ~= param2 and setplayguildlevel(player,param2) then
            lualib:sendmsg(actor,string.format("设置%s行会职务 %s → %s",lv,param2))
        else
            lualib:sendmsg(actor,string.format("%职务设置失败%s",param1,param2))
        end
    end
end

-- ==================================================================================
-- ==================================================================================
-- =====================================//沙巴克//===================================
-- ==================================================================================
-- ==================================================================================

-- 获取沙巴克基本信息 "@gm_castleinfo 信息索引"
function usercmd7001(actor,param1)
    if not lualib:playerIsGm(actor) then return end
    param1 = tonumber(param1) or 1
    local config = {
        [1] = "沙城名称",
        [2] = "沙城行会名称",
        [3] = "沙城行会会长名字",
        [4] = "占领天数",
        [5] = "当前是否在攻沙状态",
        [6] = "沙城行会副会长"
    }
    if not config[param1] then return lualib:sendmsg(actor,"未知索引") end
    local value = castleinfo(param1)
    if type(value) == "table" then
        for i, name in ipairs(t) do
            lualib:sendmsg(actor,string.format("%s[%s] - %s",config[param1],i,name))
        end
    else
        lualib:sendmsg(actor,string.format("%s - %s",config[param1],value))
    end
end