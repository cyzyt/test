Hecheng = {}
Hecheng.ID = 20100
local _cfg = cfg_compound

local ratio = 10000 --万分比
--道具合成
function Hecheng.RequestHecheng(actor,idx)
    idx = tonumber(idx) 

    if not _cfg[idx] then return end

    local cfg = _cfg[idx]

    if cfg.npcid then return end

    if cfg.name2 == "上古图腾" then return end

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

        Message.sendmsg(actor, ssrNetMsgCfg.Hecheng_HechengResponse)

        return
    end

    if FProbabilityHit( cfg.probability, ratio) then
        if cfg.type == 2 then
            items[1][2] = items[1][2] - cfg.itemid1[2][2]
        end
        Player.takeItemByTable(actor, items)
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>道具合成失败!</font>","Type":9}')
        Message.sendmsg(actor, ssrNetMsgCfg.Hecheng_HechengResponse)
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
            Player.giveItemByTable(actor, product, "物品合成", nil, isbindresult)
        end
    else
        Player.giveItemByTable(actor, cfg.product, "物品合成", num, isbindresult)
    end
    sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#FFFF00\'>合成成功!</font>","Type":9}')
    Message.sendmsg(actor, ssrNetMsgCfg.Hecheng_HechengResponse)
end

Message.RegisterNetMsg(ssrNetMsgCfg.Hecheng, Hecheng)

return Hecheng