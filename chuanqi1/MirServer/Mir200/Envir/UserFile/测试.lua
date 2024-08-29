---@class GeneralSpecialItem �������Ե���
local GeneralSpecialItem = {}
function GeneralSpecialItem.initJson(player)
    local jsonStr = lualib:GetVar(player, VarCfg["�������Ե���"])
    jsonStr = string.gsub(jsonStr, "%?nunt", "count")
    jsonStr = string.gsub(jsonStr, "��munt", "count")
    jsonStr = string.gsub(jsonStr, "cou%?s", "count")
    local jsonTb = {}
    if jsonStr == "" then
        jsonTb = {}
        lualib:SetVar(player, VarCfg["�������Ե���"], tbl2json(jsonTb))
    else
        jsonTb = json2tbl(jsonStr)
    end
    return jsonTb
end

function GeneralSpecialItem.getVarTb(player)
    local jsonTb = GeneralSpecialItem.initJson(player)
    return jsonTb
end

---------------------------------------------------------���ⱬ�ʵ���----------------------------------------------------------
local special_status_item = {
    [14304] = {pre="���ʵ���", name="˫������", show=100, real=10},
    [14401] = {pre="�и����", name="�и�1��", show=100000000, real=100000000},
    [14402] = {pre="�и����", name="�и�2��", show=200000000, real=200000000},
    [14403] = {pre="�и����", name="�и�20��", show=2000000000, real=2000000000},
    --[14404] = {pre="�и����", name="�и�1000W", show=10000000, real=10000000},
    --[14405] = {pre="�и����", name="�и�2000W", show=20000000, real=20000000},
    --[14406] = {pre="�и����", name="�и�3000W", show=30000000, real=30000000},
    --[14407] = {pre="�и����", name="�и�5000W", show=50000000, real=50000000},

    --[14701] = {pre="��ʵ�˺�����", name="��ʵ�˺�+50E", show=5000000000, real=5000000000},
    --[14702] = {pre="�����˺�����", name="�����˺�+50E", show=5000000000, real=5000000000},
    --[14703] = {pre="�и����", name="�и��˺�+5000W", show=50000000, real=50000000},
    --
    --
    --[14501] = {pre="��������", name="����1.1��", show=10, real=10},
    [14202] = {pre="��������", name="������", show=1000, real=1000},
    --
    [14204] = {pre="Ѫ������", name="������", show=20000, real=20000},
    --
    [14203] = {pre="��������", name="������", show=250, real=250},
}

local function dealUseSpecialStatusItem(player, v)
    local coinCount = lualib:GetBagItemCount(player, v.name)
    if lualib:GetBagItemCount(player, v.name) < coinCount then
        stop(player)
        return false
    end
    if not lualib:DelItem(player, v.name, coinCount, false, "�������Ե���˫��ʹ��*"..coinCount) then
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
    lualib:SetVar(player, VarCfg["�������Ե���"], tbl2json(varTb))
    Message:Msg9(player, string.format("��ϲ���ɹ�����%s��", v.name))
    GeneralSpecialItem.setStatus(player)
end

for k,v in pairs(special_status_item) do
    _G["stdmodefunc"..k] = function(player)
        dealUseSpecialStatusItem(player, v)
    end
end

local template = { -- v1��ʵ v2չʾ
    ["���ʵ���"] = {v1={209}, v2={210}},
    ["�и����"] = {v1={201}, v2={}},
    ["��ʵ�˺�����"] = {v1={202}, v2={}},
    ["�����˺�����"] = {v1={203}, v2={}},
    ["��������"] = {v1={207}, v2={208}},
    ["��������"] = {v1={3,4}, v2={}},
    ["Ѫ������"] = {v1={1}, v2={}},
    ["��������"] = {v1={9,10,11,12}, v2={}},

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
                print(lualib:GetVar(player, VarCfg["�������Ե���"]))
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


-- ��¼����
function GeneralSpecialItem.onLogin(player)
    GeneralSpecialItem.setStatus(player)
end

GameEvent.add(EventCfg.onLogin, GeneralSpecialItem.onLogin, GeneralSpecialItem)
--setFormAllowFunc("�������Ե���", {"main", "reloadData", "MoveOk"})
Message.RegisterClickMsg("�������Ե���", GeneralSpecialItem)

return GeneralSpecialItem