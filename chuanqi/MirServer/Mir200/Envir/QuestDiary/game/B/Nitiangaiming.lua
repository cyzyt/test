Nitiangaiming = {}
Nitiangaiming.ID = 20000

local _cfg = {}

for k,v in ipairs(cfg_ntgm) do
    _cfg[v.group] = _cfg[v.group] or {}
    _cfg[v.group][v.level] = _cfg[v.group][v.level] or {}
    _cfg[v.group][v.level] = {name=v.name,cost=v.cost,up=v.up,attribute=v.attribute}
end
    
Nitiangaiming._var_name = "NB_NTGM"     --变量前缀

local _var_name_tab = {}                --变量名表

local _var_lv_tab = {}                  --变量值表

local _npcid = 245

local ratio = 10000 --万分比

for i = 1,#_cfg do
    table.insert(_var_name_tab,Nitiangaiming._var_name..i)
    table.insert(_var_lv_tab,0)
end

--同步数据
local _login_data = {ssrNetMsgCfg.Nitiangaiming_SyncResponse, 0,0,0,_var_lv_tab}
function Nitiangaiming.SyncResponse(actor,logindatas)
    for i = 1 ,#_var_name_tab do
        _var_lv_tab[i] = getplayvar(actor, _var_name_tab[i])
    end
    if logindatas then
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.Nitiangaiming_SyncResponse, 0,0,0,_var_lv_tab)
    end
end

--逆天改命
function Nitiangaiming.RequestUp(actor, idx)
    --检查npc距离
    --if not FCheckNPCRange(actor, _npcid) then return end
    idx = tonumber(idx)
    local cfg = _cfg[idx]
    if not cfg then return end

    local lv = getplayvar(actor, _var_name_tab[idx])

    local next_lv = lv + 1

    if not cfg[next_lv] then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>['..cfg[lv].name..']已满级!</font>","Type":9}')
        Message.sendmsg(actor, ssrNetMsgCfg.Nitiangaiming_UpResponse, idx, lv)
        return
    end

    --判断消耗
    local name,num = Player.checkItemNumByTable(actor, cfg[next_lv].cost)
    if name then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>材料不足!</font>","Type":9}')
        Message.sendmsg(actor, ssrNetMsgCfg.Nitiangaiming_UpResponse, idx, lv)
        return
    end

    --扣消耗
    Player.takeItemByTable(actor, cfg[next_lv].cost)

    if FProbabilityHit( cfg[next_lv].up, ratio) then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>提升失败!</font>","Type":9}')
        Message.sendmsg(actor, ssrNetMsgCfg.Nitiangaiming_UpResponse, idx, lv)
        return
    end

    --写数据库
    setplayvar(actor, "HUMAN",_var_name_tab[idx], next_lv,1)
    sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#FFFF00\'>提升成功!</font>","Type":9}')
    Message.sendmsg(actor, ssrNetMsgCfg.Nitiangaiming_UpResponse, idx, next_lv)
    --刷新属性
    local cur_attr = cfg[lv] and cfg[lv].attribute or nil
    local next_attr = cfg[next_lv] and cfg[next_lv].attribute or nil

    Player.updateSomeAddr(actor, cur_attr, next_attr)

    GameEvent.push(EventCfg.goNiTian, actor)
end

-- ----------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------

--登陆触发
local function _onLoginEnd(actor,logindatas)
    local temp = {}
    for i ,var in ipairs(_var_name_tab) do
        table.insert(temp,var)
    end
    temp = table.concat(temp, "|")
    FIniPlayVar(actor, temp)

    Nitiangaiming.SyncResponse(actor, logindatas)
end
GameEvent.add(EventCfg.onLoginEnd, _onLoginEnd, Nitiangaiming)

--登陆获取附加属性
GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
        local level = 0
        for i = 1,#_cfg do
            --LOGWrite(level, type(level))
            level = getplayvar(actor, _var_name_tab[i])
            if _cfg[i][level] then
                table.insert(loginattrs, _cfg[i][level].attribute)
            end
        end
    end, Nitiangaiming)

Message.RegisterNetMsg(ssrNetMsgCfg.Nitiangaiming, Nitiangaiming)

return Nitiangaiming