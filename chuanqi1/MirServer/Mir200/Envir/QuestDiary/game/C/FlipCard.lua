FlipCard={}
FlipCard.ID=33000

release_print("-------�������---------")

function FlipCard.RequestZS(actor,p1,p2)
    -- release_print("--------Ԫ������Ϊ��"..tostring(yuanbao).."----------------")
    if p2 == 0 then
        local yuanbao = querymoney(actor, 4)
        if yuanbao >= 9000 then
            local randomIndex = math.random(1, 3)
            release_print("-----------------randomIndex---------"..tostring(randomIndex).."------------")
            sendluamsg(actor, 110, yuanbao, randomIndex, p1, "Ԫ�������㹻,���Գ齱")
            release_print("-----p1��ֵ��-------"..tostring(p1).."----------")
            -- consumebindmoney(actor, "��Ԫ��", 1000)
            changemoney(actor, 4, "-", 1000)
            yuanbao = querymoney(actor, 4)
            if randomIndex == 1 then
                    giveitem(actor, "ħ��ҩ(����)", 1, 0)
                elseif randomIndex == 2 then
                    giveitem(actor, "ħ��ҩ(С��)", 1, 0)
                else
                    giveitem(actor, "��ҩ(����)", 1, 0)
            end
            release_print("--------�齱���Ԫ������Ϊ��"..tostring(yuanbao).."----------------")
        else
            sendluamsg(actor, 120, yuanbao, 2, 3, "Ԫ����������,�����Գ齱")      
        end
    else
        local jinbi = querymoney(actor, 3)
        if jinbi >= 9000 then
            release_print("--------�齱ǰ�󶨽������Ϊ��"..tostring(jinbi).."----------------")
            local randomIndex = math.random(1, 3)
            release_print("-----------------randomIndex---------"..tostring(randomIndex).."------------")
            sendluamsg(actor, 110, jinbi, randomIndex, p2, "��������㹻,���Գ齱")
            release_print("-----p1��ֵ��-------"..tostring(p2).."----------")
            -- consumebindmoney(actor, "�󶨽��", 1000)
            changemoney(actor, 3, "-", 1000)
            jinbi = querymoney(actor, 3)
            if randomIndex == 1 then
                    giveitem(actor, "ħ��ҩ(����)", 1, 0)
                elseif randomIndex == 2 then
                    giveitem(actor, "ħ��ҩ(С��)", 1, 0)
                else
                    giveitem(actor, "��ҩ(����)", 1, 0)
            end
            release_print("--------�齱��󶨽������Ϊ��"..tostring(jinbi).."----------------")
        else
            sendluamsg(actor, 120, jinbi, 2, 3, "�����������,�����Գ齱")      
        end
    end
  
end

Message.RegisterNetMsg(ssrNetMsgCfg.FlipCard,FlipCard)
return FlipCard
