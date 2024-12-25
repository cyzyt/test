SL_Fenjie = {}
SL_Fenjie.ID = 20400

local _cfg = cfg_fenjie

local ratio = 100 --百分比

function SL_Fenjie.RequestFenjie(actor,makeindex)
    local itemidx = Bag.getItemObjByMakeIndex(actor,tonumber(makeindex)) or 0
    itemidx = getiteminfo(actor,itemidx, ConstCfg.iteminfo.idx) or 0
    local idx = 0
    if itemidx ~= 0 then
        for i,v in ipairs(_cfg) do
            if itemidx == v.equipid then
                idx = i
                break
            end
        end
    end
    local cfg = _cfg[idx]
    if not cfg then return end
    if cfg.type ~= 1 then return end
    if not Bag.checkBagEmptyNum(actor, 1) then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>包裹空间不足!</font>","Type":9}')
        return
    end
    --判断消耗
    local _,name = Player.checkItemNumByTable(actor, cfg.itemid)
    if name then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>材料不足!</font>","Type":9}')
        return
    end
    --扣消耗
    Player.takeItemByTable(actor, cfg.itemid)

    local harvest = cfg.harvest[1][1]

    local _cfg_box

    for i,v in ipairs(cfg_baoxiang) do
        if v.id == harvest then
            _cfg_box = v
        end
    end

    if not _cfg_box then return end

    local giftTab = {}

    local temp_giftTab = {}
    
    for i,v in ipairs(_cfg_box.items) do
        if v[3] then
            if v[4] then
                table.insert(temp_giftTab,v)
            else
                if not FProbabilityHit(v[3], ratio) then
                    table.insert(giftTab,{v[1],v[2]})
                end
            end
        else
            table.insert(giftTab,{v[1],v[2]})
        end
    end

    if #temp_giftTab > 0 then
        local weights = {}
        for i,v in ipairs(_cfg_box.items) do
            weights[i] = v[3]
        end
        local temp = getRanomByWeight(temp_giftTab, weights)
        table.insert(giftTab,{temp[1],temp[2]})
    end

    Player.giveItemByTable(actor, giftTab, "神龙分解")

    delitembymakeindex(actor, makeindex)

    Message.sendmsg(actor, ssrNetMsgCfg.SL_Fenjie_FenjieResponse)
end

-- ----------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------
Message.RegisterNetMsg(ssrNetMsgCfg.SL_Fenjie, SL_Fenjie)

return SL_Fenjie