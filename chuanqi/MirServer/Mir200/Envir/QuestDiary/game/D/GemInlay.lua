--宝石镶嵌

GemInlay = {}
GemInlay.ID = 40000

local _cfg = cfg_baoshi

--镶嵌装备位
local common_equip_pos = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 55}

--宝石类型
local gemTypeNum = 8

local _var_name_tab = {}

local _var_num_tab = {}

for i,v in ipairs(common_equip_pos) do
    _var_name_tab[i] = {}
    _var_num_tab[i] = {}
    for j = 1,gemTypeNum do
        _var_name_tab[i][j] = "NB_Gem"..i.."_"..j
        _var_num_tab[i][j] = 0
    end
end

local _login_data = {ssrNetMsgCfg.GemInlay_SyncResponse, 0,0,0,_var_num_tab}
function GemInlay.SyncResponse(actor,logindatas)
    for i,v in ipairs(common_equip_pos) do
        for j = 1,gemTypeNum do
            _var_num_tab[i][j] = getplayvar(actor, _var_name_tab[i][j])
        end
    end
    if logindatas then
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.GemInlay_SyncResponse, 0,0,0,_var_num_tab)
    end
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--镶嵌
function GemInlay.RequestSet(actor, equip_pos, gem_makeid)
    --获取宝石对象
    local gemobj = FGetItemObjByMakeIndex(actor, gem_makeid)
    if not gemobj then return end      --背包中没有对应宝石

    --检查物品是否宝石
    local gem_idx = getiteminfo(actor, gemobj, ConstCfg.iteminfo.idx)
    local gem_cfg = _cfg[gem_idx]
    if not gem_cfg then return end

    --孔位信息
    local hole = gem_cfg.StdMode

    local holeidx = getplayvar(actor, _var_name_tab[equip_pos][hole])

    --检查是否可镶嵌
    local cur_gem_cfg = _cfg[holeidx]
    if cur_gem_cfg then
        if gem_cfg.dengji <= cur_gem_cfg.dengji then
            FSendOwnNotice(actor, ssrResponseCfg.GemInlay_set_fail)
            return
        end
    end

    if cur_gem_cfg then         --拆卸
        FGiveItem(actor, holeidx)
    end

    --镶嵌
    FSetPlayVar(actor, _var_name_tab[equip_pos][hole], gem_idx)

    --更新物品信息
    --refreshitem(actor, equipobj)
    Player.updateSomeAddr(actor, nil, gem_cfg.Attribute)

    --拿走镶嵌宝石
    delitembymakeindex(actor, gem_makeid)
    
    --回复
    Message.sendmsg(actor, ssrNetMsgCfg.GemInlay_SetResponse, equip_pos,hole,gem_idx)

    GameEvent.push(EventCfg.goSetGem, actor)
end

--拆卸
function GemInlay.RequestDel(actor, equip_pos, hole)
    if not _var_name_tab[equip_pos] then return end

    if not _var_name_tab[equip_pos][hole] then return end
    
    local holeidx = getplayvar(actor, _var_name_tab[equip_pos][hole])

    local gem_cfg = _cfg[holeidx]

    if not gem_cfg then return end

    --关孔
    --FDrillOneHole(actor, equipobj, hole, false)
    FSetPlayVar(actor, _var_name_tab[equip_pos][hole], 0)

    --更新物品信息
    --refreshitem(actor, equipobj)

    --给宝石
    FGiveItem(actor, holeidx)

    --更新人物属性
    recalcabilitys(actor)

    Player.updateSomeAddr(actor, gem_cfg.Attribute, nil)

    --回复
    Message.sendmsg(actor, ssrNetMsgCfg.GemInlay_DelResponse,equip_pos,hole,0)
end

Message.RegisterNetMsg(ssrNetMsgCfg.GemInlay, GemInlay)
-- ----------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------
--登录完成
GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas)
    --声明变量
    local temp = {}
    for i,v in pairs(_var_name_tab) do
        for i2,v2 in pairs(v) do
            table.insert(temp,v2)
        end
    end
    FIniPlayVar(actor, temp)

    GemInlay.SyncResponse(actor, logindatas)
end, GemInlay)

--登陆获取附加属性
GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    for i,v in ipairs(_var_name_tab) do
        for j,var in ipairs(v) do
            local gemidx = getplayvar(actor, var)
            if _cfg[gemidx] then
                table.insert(loginattrs, _cfg[gemidx].Attribute)
            end
        end
    end
end, GemInlay)

return GemInlay