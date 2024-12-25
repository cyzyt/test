HechengRonghe = {}
HechengRonghe.ID = 20200

local _cfg = cfg_compound

local ratio = 10000 --万分比

--道具合成
function HechengRonghe.RequestHecheng(actor,idx)
    idx = tonumber(idx)

    if not _cfg[idx] then return end
    local cfg = _cfg[idx]

    if not cfg.npcid then return end

    if cfg.npcid ~= 256 then return end

    if not UCheckNPCRange(actor, nil,cfg.npcid) then return end
    --判断消耗
    local items = clone(cfg.itemid1)

    if cfg.type == 2 then
        if cfg.itemid1[1][1] == cfg.itemid1[2][1] then
            items[1][2] = items[1][2] + items[2][2]
            table.remove(items,2)
        end
    end

    local name,num = Player.checkItemNumByTable(actor, items)
    if name then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>材料不足!</font>","Type":9}')
        if cfg.npcid then
            Message.sendmsg(actor, ssrNetMsgCfg.HechengRonghe_HechengResponse)
        end
        return
    end

    if FProbabilityHit( cfg.probability, ratio) then
        --type2,只扣部分材料
        if cfg.type == 2 then
            if cfg.itemid1[1][1] == cfg.itemid1[2][1] then
                items[1][2] = items[1][2] - cfg.itemid1[2][2]
            else
                table.remove(items,1)
            end
        end
        Player.takeItemByTable(actor, items)
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>道具合成失败!</font>","Type":9}')
        if cfg.npcid then
            Message.sendmsg(actor, ssrNetMsgCfg.HechengRonghe_HechengResponse)
        end
        GameEvent.push(EventCfg.goRongHe, actor)
        return
    end

    --合成成功,正常扣消耗
    Player.takeItemByTable(actor, cfg.itemid1)

    --给物品
    local productnum = #cfg.product
    if productnum > 1 then
        for i=1,num do
            local random = math.random(1, productnum)
            local product = {cfg.product[random]}
            Player.giveItemByTable(actor, product, "物品合成", nil)
        end
    else
        Player.giveItemByTable(actor, cfg.product, "物品合成", num)
    end
    sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#FFFF00\'>合成成功!</font>","Type":9}')
    if cfg.npcid then
        Message.sendmsg(actor, ssrNetMsgCfg.HechengRonghe_HechengResponse)
    end

    GameEvent.push(EventCfg.goRongHe, actor)
end

Message.RegisterNetMsg(ssrNetMsgCfg.HechengRonghe, HechengRonghe)

return HechengRonghe