--转生

Demo2 = {}
Demo2.ID = 10000

local _cfg = cfg_rein

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步数据
local _login_data = {ssrNetMsgCfg.Demo2_SyncResponse, 0}
function Demo2.SyncResponse(actor, logindatas)
    local zslevel = getbaseinfo(actor, ConstCfg.gbase.renew_level)
    if logindatas then
        _login_data[2] = zslevel
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.Demo2_SyncResponse, zslevel)
    end
end

--转生
function Demo2.RequestZS(actor)
    local zslevel = getbaseinfo(actor, ConstCfg.gbase.renew_level)
    local next_zslevel = zslevel + 1
    local cfg = _cfg[zslevel]
    local next_cfg = _cfg[next_zslevel]

    --检查满转
    if not next_cfg then
        FSendOwnNotice(actor, ssrResponseCfg.Demo2_full_level)
        return
    end

    --检查等级
    local level = getbaseinfo(actor, ConstCfg.gbase.level)
    if level < cfg.Level then
        FSendOwnNotice(actor, ssrResponseCfg.Demo2_not_level, cfg.Level)
        return
    end

    -- 检查材料
    local name = Player.checkItemNumByTable(actor, cfg.Consume)
    if name then
        FSendOwnNotice(actor, ssrResponseCfg.not_item, name)
        return
    end

    --扣材料
    Player.takeItemByTable(actor, cfg.Consume)

    --扣等级
    changelevel(actor, "-", cfg.DelLv)

    --修改转生等级
    setbaseinfo(actor, ConstCfg.gbase.renew_level, next_zslevel)

    --回复
    local plevel = getbaseinfo(actor, ConstCfg.gbase.level)
    Message.sendmsg(actor, ssrNetMsgCfg.Demo2_ZSResponse, next_zslevel, plevel)

    --更新属性
    Player.updateSomeAddr(actor, cfg.Attribute0, next_cfg.Attribute0)

    --事件
    GameEvent.push(EventCfg.goZSLevelChange, next_zslevel, zslevel)
end

Message.RegisterNetMsg(ssrNetMsgCfg.Demo2, Demo2)

-------------------------------↓↓↓ 事件 ↓↓↓---------------------------------------
--登录附加属性
GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    local zslevel = getbaseinfo(actor, ConstCfg.gbase.renew_level)
    LOGWrite(zslevel, type(zslevel))
    if zslevel <= 0 then return end
    local cfg = _cfg[zslevel]
    if not cfg then return end

    table.insert(loginattrs, cfg.Attribute0)
end, Demo2)

--登录完成
GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas)
    Demo2.SyncResponse(actor, logindatas)
end, Demo2)

return Demo2