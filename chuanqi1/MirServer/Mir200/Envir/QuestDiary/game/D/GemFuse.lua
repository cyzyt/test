--��ʯ��Ƕ

GemFuse = {}
GemFuse.ID = 40100

local _cfg = cfg_compound

local ratio = 10000 --��ֱ�

--���ߺϳ�
function GemFuse.RequestHecheng(actor,idx)
    idx = tonumber(idx) 

    if not _cfg[idx] then return end
    local cfg = _cfg[idx]

    if not UCheckNPCRange(actor, nil,cfg.npcid) then return end
    --�ж�����
    local items = clone(cfg.itemid1)

    if cfg.type == 2 then
        if cfg.itemid1[1][1] == cfg.itemid1[2][1] then
            items[1][2] = items[1][2] + items[2][2]
            table.remove(items,2)
        end
    end

    local name,num = Player.checkItemNumByTable(actor, items)
    if name then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>���ϲ���!</font>","Type":9}')
        if cfg.npcid then
            Message.sendmsg(actor, ssrNetMsgCfg.GemFuse_HechengResponse)
        end
        return
    end

    if FProbabilityHit( cfg.probability, ratio) then
        --type2,ֻ�۲��ֲ���
        if cfg.type == 2 then
            items[1][2] = items[1][2] - cfg.itemid1[2][2]
        end
        Player.takeItemByTable(actor, items)
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>���ߺϳ�ʧ��!</font>","Type":9}')
        if cfg.npcid then
            Message.sendmsg(actor, ssrNetMsgCfg.GemFuse_HechengResponse)
        end
        return
    end

    --�ϳɳɹ�,����������
    Player.takeItemByTable(actor, cfg.itemid1)

    --����Ʒ
    local productnum = #cfg.product
    if productnum > 1 then
        for i=1,num do
            local random = math.random(1, productnum)
            local product = {cfg.product[random]}
            Player.giveItemByTable(actor, product, "��Ʒ�ϳ�", nil, isbindresult)
        end
    else
        Player.giveItemByTable(actor, cfg.product, "��Ʒ�ϳ�", num, isbindresult)
    end
    sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#FFFF00\'>�ϳɳɹ�!</font>","Type":9}')
    if cfg.npcid then
        Message.sendmsg(actor, ssrNetMsgCfg.GemFuse_HechengResponse)
    end
end
-------------------------------������ ������Ϣ ������---------------------------------------

Message.RegisterNetMsg(ssrNetMsgCfg.GemFuse, GemFuse)

return GemFuse