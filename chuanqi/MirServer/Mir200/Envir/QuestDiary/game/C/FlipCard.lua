FlipCard={}
FlipCard.ID=33000

release_print("-------进入测试---------")

function FlipCard.RequestZS(actor,p1,p2)
    -- release_print("--------元宝数量为："..tostring(yuanbao).."----------------")
    if p2 == 0 then
        local yuanbao = querymoney(actor, 4)
        if yuanbao >= 9000 then
            local randomIndex = math.random(1, 3)
            release_print("-----------------randomIndex---------"..tostring(randomIndex).."------------")
            sendluamsg(actor, 110, yuanbao, randomIndex, p1, "元宝数量足够,可以抽奖")
            release_print("-----p1的值是-------"..tostring(p1).."----------")
            -- consumebindmoney(actor, "绑定元宝", 1000)
            changemoney(actor, 4, "-", 1000)
            yuanbao = querymoney(actor, 4)
            if randomIndex == 1 then
                    giveitem(actor, "魔法药(中量)", 1, 0)
                elseif randomIndex == 2 then
                    giveitem(actor, "魔法药(小量)", 1, 0)
                else
                    giveitem(actor, "金创药(中量)", 1, 0)
            end
            release_print("--------抽奖后绑定元宝数量为："..tostring(yuanbao).."----------------")
        else
            sendluamsg(actor, 120, yuanbao, 2, 3, "元宝数量不够,不可以抽奖")      
        end
    else
        local jinbi = querymoney(actor, 3)
        if jinbi >= 9000 then
            release_print("--------抽奖前绑定金币数量为："..tostring(jinbi).."----------------")
            local randomIndex = math.random(1, 3)
            release_print("-----------------randomIndex---------"..tostring(randomIndex).."------------")
            sendluamsg(actor, 110, jinbi, randomIndex, p2, "金币数量足够,可以抽奖")
            release_print("-----p1的值是-------"..tostring(p2).."----------")
            -- consumebindmoney(actor, "绑定金币", 1000)
            changemoney(actor, 3, "-", 1000)
            jinbi = querymoney(actor, 3)
            if randomIndex == 1 then
                    giveitem(actor, "魔法药(中量)", 1, 0)
                elseif randomIndex == 2 then
                    giveitem(actor, "魔法药(小量)", 1, 0)
                else
                    giveitem(actor, "金创药(中量)", 1, 0)
            end
            release_print("--------抽奖后绑定金币数量为："..tostring(jinbi).."----------------")
        else
            sendluamsg(actor, 120, jinbi, 2, 3, "金币数量不够,不可以抽奖")      
        end
    end
  
end

Message.RegisterNetMsg(ssrNetMsgCfg.FlipCard,FlipCard)
return FlipCard
