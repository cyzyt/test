
ActivitySystem = {}
ActivitySystem.ID = 20700

local _cfg = cfg_gameactive
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ActivitySystem.RequestGoto(actor, idx)
    local cfg = _cfg[idx]
    if not cfg then return end
    if cfg.Name == "沙城争霸" then
        local state = castleinfo(ConstCfg.castle.info.state)
        if state then
            local base_x,base_y = 645,290
            mapmove(actor, "3", math.random(base_x - 3, base_x + 3), math.random(base_y - 3, base_y + 3))
        else
            sendmsg(actor, ConstCfg.notice.own, ssrResponseCfg.get(ssrResponseCfg.not_open_activity))
        end
    else
        local activityid = cfg.id
        if activityid == 1 then         --大乱斗
            Playdld.RequestEnter(actor)
        elseif activityid == 2 then     --异域大战
            Playyydz.RequestEnter(actor)
        end
    end

end

local function _syncActivityState(idx, state)
    local t = getplayerlst()
    for _,actor in ipairs(t) do
        -- LOGWrite("idx:"..idx..",state:".. state)
        Message.sendmsg(actor, ssrNetMsgCfg.ActivitySystem_SyncActivityState, idx, state)
    end
end

GameEvent.add(EventCfg.goActivityState, _syncActivityState, ActivitySystem)

Message.RegisterNetMsg(ssrNetMsgCfg.ActivitySystem, ActivitySystem)

return ActivitySystem