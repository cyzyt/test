Hechengshenqi = {}
Hechengshenqi.ID = 31800
local _cfg = cfg_Simplecompound

local ratio = 10000 --��ֱ�
--���ߺϳ�
function Hechengshenqi.RequestHecheng(actor,idx,btn)
    idx = tonumber(idx) 
    btn = tonumber(btn) 
    
    if not _cfg[idx] then return end

    local cfg = _cfg[idx]

    local name,num = Player.checkItemNumByTable(actor, cfg.itemid1)
    if name then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>���ϲ���!</font>","Type":9}')
        Message.sendmsg(actor, ssrNetMsgCfg.Hechengshenqi_HechengResponse,btn)
        return
    end

    Player.takeItemByTable(actor, cfg.itemid1)

    if FProbabilityHit(cfg.probability, ratio) then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>���ߺϳ�ʧ��!</font>","Type":9}')
        Message.sendmsg(actor, ssrNetMsgCfg.Hechengshenqi_HechengResponse,btn)
        return
    end

    --����Ʒ
    local idx = cfg.product[1][1]
    local equip_name = getstditeminfo(idx, ConstCfg.stditeminfo.name)
    giveitem(actor,equip_name, 1, ConstCfg.binding)
  
    sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#FFFF00\'>�ϳɳɹ�!</font>","Type":9}')
    Message.sendmsg(actor, ssrNetMsgCfg.Hechengshenqi_HechengResponse,btn)
end

local site = {
    [10001] = 71,
    [10002] = 72,
    [10003] = 73,
    [10004] = 74,
    [10005] = 75,
    [10006] = 76,
    [10007] = 77,
    [10008] = 78,
    [10009] = 79,
    [10010] = 80,
    [10011] = 81,
    [10021] = 82,
}

local function _playeritem(actor,item)
    local item_id = getiteminfo(actor, item, ConstCfg.iteminfo.id)
    local item_idx = getiteminfo(actor, item, ConstCfg.iteminfo.idx)
    local stdmode = getstditeminfo(item_idx, ConstCfg.stditeminfo.stdmode)
    local where = site[stdmode]
     if where ~= nil then
        if where >= 71 and where <= 82 then
            local equipobj = linkbodyitem(actor, where)
            if equipobj ~= "0" then
                local itemx_id = getiteminfo(actor, equipobj, ConstCfg.iteminfo.id)
                delitembymakeindex(actor,itemx_id)
            end
            takeonitem(actor,where,item_id)
        end
     end
end

Message.RegisterNetMsg(ssrNetMsgCfg.Hechengshenqi,Hechengshenqi)

GameEvent.add(EventCfg.onAddBag, _playeritem, Hechengshenqi) ---��Ʒ������

return Hechengshenqi