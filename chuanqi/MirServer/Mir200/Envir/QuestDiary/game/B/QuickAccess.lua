QuickAccess = {}
QuickAccess.ID = 21600

local _cfg = cfg_item_hyperlink

function QuickAccess.RequestFindNpc(actor,itemidx,id)
    if not _cfg[itemidx] then return end
    if not _cfg[itemidx].Hyperlink2 then return end
    if not _cfg[itemidx].Hyperlink2[id] then return end
    FOpenNpcShowEx(actor, _cfg[itemidx].Hyperlink2[id])
end

-- ----------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------

Message.RegisterNetMsg(ssrNetMsgCfg.QuickAccess, QuickAccess)

-------------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------

GameEvent.add(EventCfg.goQuickAccess, function (actor,itemIdx) Message.sendmsg(actor, ssrNetMsgCfg.QuickAccess_OpenWndResponse,itemIdx) end, QuickAccess)

return QuickAccess