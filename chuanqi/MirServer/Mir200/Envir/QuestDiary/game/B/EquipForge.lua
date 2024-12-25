EquipForge = {}
EquipForge.ID = 21100

local _cfg = {}

local Page_Tab = {}
for k,v in ipairs(cfg_compound) do
    if v.name2 == "上古图腾" then
        local index = 0
        for i = 1, #Page_Tab do
            if Page_Tab[i] == v.page1 then
                index = i
                break
            end
        end
        if index == 0 then
            index = #Page_Tab + 1
            Page_Tab[index] = v.page1
        end
        _cfg[index] = _cfg[index] or {title = v.name2}
        _cfg[index][v.page2] = _cfg[index][v.page2] or {title = v.name}
        _cfg[index][v.page2][v.page3] = _cfg[index][v.page2][v.page3] or {title = v.name}
        _cfg[index][v.page2][v.page3] = {
            idx = k,type = v.type,page1 = v.page1,page2 = v.page2,page3 = v.page3,npcid = v.npcid,condition2 = v.condition2,
            itemid1 = v.itemid1,product = v.product,name = v.name,probability = v.probability,type2 = v.type2,
        }
    end
end

local ratio = 10000 --万分比

--道具锻造
function EquipForge.RequestForge(actor,page1,page2,page3)
    if not _cfg[page1] or not _cfg[page1][page2] or not _cfg[page1][page2][page3] then return end

    local subcfg = _cfg[page1][page2]

    local cfg = subcfg[page3]

    local limitType = cfg.condition2 and math.floor(cfg.condition2 / 10000) or nil

    if limitType then
        local needlevel = cfg.condition2 % 10000
        if limitType == 1 then
            local level = getbaseinfo(actor, ConstCfg.gbase.level)
            if level < needlevel then
                sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>请先将等级提升至'..needlevel..'级!</font>","Type":9}')
                Message.sendmsg(actor, ssrNetMsgCfg.EquipForge_ForgeResponse)
                return
            end
        elseif limitType == 3 then
            local zslevel = getbaseinfo(actor, ConstCfg.gbase.renew_level)  --转生等级
            if zslevel < needlevel then
                sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>请先提升至'..needlevel..'转!</font>","Type":9}')
                Message.sendmsg(actor, ssrNetMsgCfg.EquipForge_ForgeResponse)
                return
            end
        end
    end


    local itemobj = linkbodyitem(actor, cfg.type2)

    if page3 == 1 then
        if itemobj ~= "0" then
            Message.sendmsg(actor, ssrNetMsgCfg.EquipForge_ForgeResponse)
            return
        end
    else
        if itemobj == "0" then
            Message.sendmsg(actor, ssrNetMsgCfg.EquipForge_ForgeResponse)
            return
        else
            local itemidx = getiteminfo(actor, itemobj, ConstCfg.iteminfo.idx)
            if itemidx ~= _cfg[page1][page2][page3 - 1].product[1][1] then
                Message.sendmsg(actor, ssrNetMsgCfg.EquipForge_ForgeResponse)
                return
            end
        end
    end

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
        Message.sendmsg(actor, ssrNetMsgCfg.EquipForge_ForgeResponse)
        return
    end

    if FProbabilityHit( cfg.probability, ratio) then
        if cfg.type == 2 then
            items[1][2] = items[1][2] - cfg.itemid1[2][2]
        end
        Player.takeItemByTable(actor, items)
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>道具锻造失败!</font>","Type":9}')
        Message.sendmsg(actor, ssrNetMsgCfg.EquipForge_ForgeResponse)
        return
    end

    --锻造成功,正常扣消耗
    Player.takeItemByTable(actor, cfg.itemid1)

    local equipobj = linkbodyitem(actor, cfg.type2)
    if equipobj ~= "0" then
        local id = getiteminfo(actor, equipobj, ConstCfg.iteminfo.id)
        delitembymakeindex(actor, tostring(id))
    end

    --给物品
    local idx = cfg.product[1][1]
    local equip_name = getstditeminfo(idx, ConstCfg.stditeminfo.name)
    giveonitem(actor, cfg.type2 ,equip_name, 1, ConstCfg.binding)

    sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#FFFF00\'>锻造成功!</font>","Type":9}')
    Message.sendmsg(actor, ssrNetMsgCfg.EquipForge_ForgeResponse)
end

Message.RegisterNetMsg(ssrNetMsgCfg.EquipForge, EquipForge)

return EquipForge