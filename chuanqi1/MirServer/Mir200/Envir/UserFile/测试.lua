---@class GeneralSpecialItem 特殊属性道具
local GeneralSpecialItem = {}
function GeneralSpecialItem.initJson(player)
    local jsonStr = lualib:GetVar(player, VarCfg["特殊属性道具"])
    jsonStr = string.gsub(jsonStr, "%?nunt", "count")
    jsonStr = string.gsub(jsonStr, "＿munt", "count")
    jsonStr = string.gsub(jsonStr, "cou%?s", "count")
    local jsonTb = {}
    if jsonStr == "" then
        jsonTb = {}
        lualib:SetVar(player, VarCfg["特殊属性道具"], tbl2json(jsonTb))
    else
        jsonTb = json2tbl(jsonStr)
    end
    return jsonTb
end

function GeneralSpecialItem.getVarTb(player)
    local jsonTb = GeneralSpecialItem.initJson(player)
    return jsonTb
end

---------------------------------------------------------特殊爆率道具----------------------------------------------------------
local special_status_item = {
    [14304] = {pre="爆率道具", name="双倍爆率", show=100, real=10},
    [14401] = {pre="切割道具", name="切割1亿", show=100000000, real=100000000},
    [14402] = {pre="切割道具", name="切割2亿", show=200000000, real=200000000},
    [14403] = {pre="切割道具", name="切割20亿", show=2000000000, real=2000000000},
    --[14404] = {pre="切割道具", name="切割1000W", show=10000000, real=10000000},
    --[14405] = {pre="切割道具", name="切割2000W", show=20000000, real=20000000},
    --[14406] = {pre="切割道具", name="切割3000W", show=30000000, real=30000000},
    --[14407] = {pre="切割道具", name="切割5000W", show=50000000, real=50000000},

    --[14701] = {pre="真实伤害道具", name="真实伤害+50E", show=5000000000, real=5000000000},
    --[14702] = {pre="暴击伤害道具", name="暴击伤害+50E", show=5000000000, real=5000000000},
    --[14703] = {pre="切割道具", name="切割伤害+5000W", show=50000000, real=50000000},
    --
    --
    --[14501] = {pre="倍攻道具", name="倍攻1.1倍", show=10, real=10},
    [14202] = {pre="攻击道具", name="攻击丹", show=1000, real=1000},
    --
    [14204] = {pre="血量道具", name="生命丹", show=20000, real=20000},
    --
    [14203] = {pre="防御道具", name="防御丹", show=250, real=250},
}

local function dealUseSpecialStatusItem(player, v)
    local coinCount = lualib:GetBagItemCount(player, v.name)
    if lualib:GetBagItemCount(player, v.name) < coinCount then
        stop(player)
        return false
    end
    if not lualib:DelItem(player, v.name, coinCount, false, "特殊属性道具双击使用*"..coinCount) then
        stop(player)
        return false
    end
    local varTb = GeneralSpecialItem.getVarTb(player)
    if not varTb[v.pre] then
        varTb[v.pre] = {}
    end
    if varTb[v.pre][v.name] then
        varTb[v.pre][v.name].count = varTb[v.pre][v.name].count + coinCount
    else
        varTb[v.pre][v.name] = {v1=v.real, v2=v.show, count=coinCount}
    end
    lualib:SetVar(player, VarCfg["特殊属性道具"], tbl2json(varTb))
    Message:Msg9(player, string.format("恭喜您成功激活%s！", v.name))
    GeneralSpecialItem.setStatus(player)
end

for k,v in pairs(special_status_item) do
    _G["stdmodefunc"..k] = function(player)
        dealUseSpecialStatusItem(player, v)
    end
end

local template = { -- v1真实 v2展示
    ["爆率道具"] = {v1={209}, v2={210}},
    ["切割道具"] = {v1={201}, v2={}},
    ["真实伤害道具"] = {v1={202}, v2={}},
    ["暴击伤害道具"] = {v1={203}, v2={}},
    ["倍攻道具"] = {v1={207}, v2={208}},
    ["攻击道具"] = {v1={3,4}, v2={}},
    ["血量道具"] = {v1={1}, v2={}},
    ["防御道具"] = {v1={9,10,11,12}, v2={}},

}

local temp = {
    v1={209},
    v2={209},
}
function GeneralSpecialItem.setStatus(player)
    local varTb = GeneralSpecialItem.getVarTb(player)
    local statusTb = {}
    local qgVarTb = NpcLightCut.getVarTb(player)
    if qgVarTb.level <= 0 then
        statusTb[204] = 2
    end

    for i,v in pairs(varTb) do
        for j, se in pairs(v) do
            if se.count == nil then
                print(lualib:GetVar(player, VarCfg["特殊属性道具"]))
            else
                if se.count > 0 then
                    local sss = template[i]
                    if #sss.v1 > 0 then
                        for count=1, #sss.v1 do
                            local att = sss.v1[count]
                            if statusTb[att] then
                                statusTb[att] = statusTb[att] + se.v1 * se.count
                            else
                                statusTb[att] = se.v1 * se.count
                            end
                        end
                    end
                    if #sss.v2 > 0 then
                        for count=1, #sss.v2 do
                            local att = sss.v2[count]
                            if statusTb[att] then
                                statusTb[att] = statusTb[att] + se.v2 * se.count
                            else
                                statusTb[att] = se.v2 * se.count
                            end
                        end
                    end
                end
            end
        end
    end

    lualib:AddBuffEx(player, 60023, 0, 1, player, statusTb)
end


-- 登录触发
function GeneralSpecialItem.onLogin(player)
    GeneralSpecialItem.setStatus(player)
end

GameEvent.add(EventCfg.onLogin, GeneralSpecialItem.onLogin, GeneralSpecialItem)
--setFormAllowFunc("特殊属性道具", {"main", "reloadData", "MoveOk"})
Message.RegisterClickMsg("特殊属性道具", GeneralSpecialItem)

return GeneralSpecialItem