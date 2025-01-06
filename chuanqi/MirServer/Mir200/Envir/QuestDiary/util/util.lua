--判断成功率:如果成功返回false
--suc_rate:成功率
--ratio:比率
--return:返回true没成功
function FProbabilityHit(suc_rate, ratio)
    ratio = ratio or 100
    local rate = math.random(1, ratio)
    return rate > suc_rate
end

--检查一个对象的范围
function UCheckRange(x, y, range, obj)
    local min_x, max_x = x-range, x+range
    local min_y, max_y = y-range, y+range
    local cur_x, cur_y = getbaseinfo(obj, ConstCfg.gbase.x), getbaseinfo(obj, ConstCfg.gbase.y)

    if (cur_x >= min_x) and (cur_x <= max_x) and
       (cur_y >= min_y) and (cur_y <= max_y) then
        return true
    end

    return false
end

--检查自己与npc的距离
function UCheckNPCRange(actor, moduleid, npcidx, range)
    range = range or 10
    local npcobj = getnpcbyindex(npcidx)
    local npc_mapid = getbaseinfo(npcobj, ConstCfg.gbase.mapid)
    local my_mapid = getbaseinfo(actor, ConstCfg.gbase.mapid)
    if npc_mapid ~= my_mapid then return false end

    local npc_x = getbaseinfo(npcobj, ConstCfg.gbase.x)
    local npc_y = getbaseinfo(npcobj, ConstCfg.gbase.y)
    return UCheckRange(npc_x, npc_y, range, actor)
end

--回城
local base_map,base_x,base_y = "3",333,333
function FBackZone(actor)
    mapmove(actor, base_map, math.random(base_x - 9, base_x + 9), math.random(base_y - 9, base_y + 9))
end

--飞地图固定随机点
function FMapMove(actor, mapid, x, y, x_ran, y_ran)
    if type(mapid) ~= "string" then mapid = mapid.."" end
    if x and y then
        if x_ran then x = math.random(x-x_ran, x+x_ran) end
        if y_ran then y = math.random(y-y_ran, y+y_ran) end
        mapmove(actor, mapid, x, y)
    else
        map(actor, mapid)
    end
end

--发送公告
local type1str = '{"Msg":"%s","Type":1}'
local type4str = '{"Msg":"%s","Type":5}'
function FSendNotice(actor, noticeid, t, ...)
    local cfg = cfg_announce[noticeid]
    if not cfg then return end
    local str = cfg.Announce
    if t then
        if t.name and actor then
            local name = getbaseinfo(actor, ConstCfg.gbase.name)
            str = string.gsub(str, "%%name", name)
        end

        if t.createname and actor then
            local createname = getbaseinfo(actor, ConstCfg.gbase.name)
            str = string.gsub(str, "%%CreatName", createname)
        end

        if t.targetname then
            str = string.gsub(str, "%%Name", t.targetname)
        end

        if t.map and actor then
            local mapname = getbaseinfo(actor, ConstCfg.gbase.mapid)
            str = string.gsub(str, "%%Map", mapname)
        end

        if t.item then
            str = string.gsub(str, "%%Item", t.item)
        end

        if t.itemid then
            str = string.gsub(str, "%%ItemId", t.itemid)
        end

        if t.x and actor then
            local x = getbaseinfo(actor, ConstCfg.gbase.x)
            str = string.gsub(str, "%%X", x)
        end

        if t.y and actor then
            local y = getbaseinfo(actor, ConstCfg.gbase.y)
            str = string.gsub(str, "%%Y", y)
        end
        if t.day then
            str = string.gsub(str, "%%day", t.day)
        end
        if t.level then
            str = string.gsub(str, "%%level", t.level)
        end

        if t.vip then
            str = string.gsub(str, "%%vip", t.vip)
        end
        if t.hitername and actor then
            str = string.gsub(str, "%%hitername",t.hitername)
        end
    end
    local str = string.format(str, ...)
    --cfg.Region==1:全服 cfg.Region==2:当前地图
    for _,type in ipairs(cfg.Type) do
        local region
        if type == 1 then                           --聊天栏
            local str = string.format(type1str, str)
            if cfg.Region == 1 then
                region = 2
            elseif cfg.Region == 2 then
                region = 4
            end
            sendmsg(actor, region, str)
        elseif type == 2 then                       --聊天上方
            if cfg.Region == 1 then
                region = 0
            elseif cfg.Region == 2 then
                region = 3
            end
            sendtopchatboardmsg(actor, region, 0, 0, 2, str, 1)
        elseif type == 3 then                       --人物头顶
            if cfg.Region == 1 then
                region = 1
            elseif cfg.Region == 2 then
                region = 3
            end
            sendmsgnew(actor, 0, 0, str, region, 3)
        elseif type == 4 then                       --屏幕顶部
            local str = string.format(type4str, str)
            if cfg.Region == 1 then
                region = 2
            elseif cfg.Region == 2 then
                region = 4
            end
            sendmsg(actor, region, str)
        end
    end
end

--发送邮件
function FSendmail(sender, id, ...)
    local cfg = cfg_mail[id]
    if not cfg then return end

    --邮件内容
    local content
    if cfg.content then
        if cfg.parameter then
            content = string.format(cfg.content, ...)
        else
            content = cfg.content
        end
    end
    
    --邮件物品
    local stritem
    if cfg.items then
        if type(cfg.items) == "table" then
            local items
            for _,item in ipairs(cfg.items) do
                if type(item) == "table" then
                    items = items or {}
                    if item[3] == 1 then item[3] = ConstCfg.binding end
                    table.insert(items, table.concat(item, "#"))
                else
                    stritem = table.concat(cfg.items, "&")
                    break
                end
            end

            if items then stritem = table.concat(items, "&") end
        else
            stritem = cfg.items.."#1"
        end
    end
    --发送
    sendmail(sender, 1, cfg.title, content, stritem)
end

--发送邮件2
function _Fsendmail(name,id,reward,...)
    local cfg = cfg_mail[id]
    if not cfg then return end
    --邮件内容
    local content
    if cfg.content then
        if cfg.parameter then
            content = string.format(cfg.content, ...)
        else
            content = cfg.content
        end
    end
    local stritem
    --邮件物品
    if reward then
        if type(reward) == "table" then
            local items
            for _,item in ipairs(reward) do
                if type(item) == "table" then
                    items = items or {}
                    if item[3] == 1 then item[3] = ConstCfg.binding end
                    table.insert(items, table.concat(item, "#"))
                else
                    stritem = table.concat(reward, "&")
                    break
                end
            end

            if items then stritem = table.concat(items, "&") end
        else
            stritem = reward.."#1"
        end
    end
    sendmail("#"..name, 1, cfg.title, content, stritem)
end

function clone(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end

function getRanomByWeight(t, weights)
    local sum = 0
    for i = 1, #weights do
        sum = sum + weights[i]
    end
    local compareWeight = math.random(1, sum)
    local weightIndex = 1
    while sum > 0 do
        sum = sum - weights[weightIndex]
        if sum < compareWeight then
            return t[weightIndex]
        end
        weightIndex = weightIndex + 1
    end
    return weightIndex
end

--秒转时分秒  100 = 00:01:40
function ssrSecToHMS(sec)
    sec = sec or 0

    local h,m,s = 0,0,0
    if sec > 3600 then
        h = math.floor(sec/3600)
    end
    sec = sec % 3600
    if sec > 60 then
        m = math.floor(sec/60)
    end
    s = sec % 60

    return string.format("%02d:%02d:%02d", h, m, s)
end

--时间转换
function getTodayTimeStamp(hour,min,sec)
    local cDateCurrectTime = os.date("*t")
    local cDateTodayTime = os.time({year=cDateCurrectTime.year, month=cDateCurrectTime.month, day=cDateCurrectTime.day, hour=hour,min=min,sec=sec})
    return cDateTodayTime
end