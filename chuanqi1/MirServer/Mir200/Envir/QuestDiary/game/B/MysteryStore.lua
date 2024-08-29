MysteryStore = {}
MysteryStore.ID = 20300

local _cfg = cfg_mystery_store

local BuyNum_var_name = {}

local _var_num_tab = {}

local ratio = 100 --�ٷֱ�

for i,v in ipairs(_cfg) do
    if v.leixing then
        BuyNum_var_name[i] = "NB_BuyNum"..v.leixing.."_"..i
    end
    _var_num_tab[i] = 0
end

local _login_data = {ssrNetMsgCfg.MysteryStore_SyncResponse, 0,0,0,_var_num_tab}
function MysteryStore.SyncResponse(actor,logindatas)
    for i,v in ipairs(_cfg) do
        if v.leixing then
            _var_num_tab[i] = getplayvar(actor, BuyNum_var_name[i])
        end
    end
    if logindatas then
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.MysteryStore_SyncResponse, 0,0,0,_var_num_tab)
    end
end

function MysteryStore.RequestBuy(actor,idx,num)
    idx,num = tonumber(idx) or 0,tonumber(num) or 1

    if not _cfg[idx] then return end

    local cfg = _cfg[idx]

    if cfg.npcid then 
        if not UCheckNPCRange(actor, nil,cfg.npcid) then return end
    end
    
    local item = cfg.itemId[1]
    local todayBuyNum = 0

    local name = getstditeminfo(cfg.itemId[1][1], ConstCfg.stditeminfo.name)


    if BuyNum_var_name[idx] then
        todayBuyNum = getplayvar(actor, BuyNum_var_name[idx]) + num
        if todayBuyNum > cfg.singleLimit then
            sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>['..name..']�Ѵﵽ��������!</font>","Type":9}')
            Message.sendmsg(actor, ssrNetMsgCfg.MysteryStore_BuyResponse,idx,_var_num_tab[idx])
            return
        end
    end


    if item[1] > 100 then
        if not Bag.checkBagEmptyNum(actor, 1) then
            sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>�����ռ䲻��!</font>","Type":9}')
            Message.sendmsg(actor, ssrNetMsgCfg.MysteryStore_BuyResponse,idx,_var_num_tab[idx])
            return
        end
    end

    --�ж�����
    local price = clone(cfg.price)
    price[1][2] = price[1][2] * num
    local _,name = Player.checkItemNumByTable(actor, cfg.price)
    if name then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>���ϲ���!</font>","Type":9}')
        Message.sendmsg(actor, ssrNetMsgCfg.MysteryStore_BuyResponse,idx,_var_num_tab[idx])
        return
    end

    --������
    Player.takeItemByTable(actor, price)

    local itemId = clone(cfg.itemId)
    itemId[1][2] = itemId[1][2] * num


    local _cfg_box

    for i,v in ipairs(cfg_baoxiang) do
        if v.id == itemId[1][1] then
            _cfg_box = v
        end
    end

    if _cfg_box then
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
    
        Player.giveItemByTable(actor, giftTab, "��Ʒ����")
    else
        Player.giveItemByTable(actor, itemId, "��Ʒ����")
    end


    if BuyNum_var_name[idx] then
        FSetPlayVar(actor, BuyNum_var_name[idx], todayBuyNum)
    end

    _var_num_tab[idx] = getplayvar(actor, BuyNum_var_name[idx])

    Message.sendmsg(actor, ssrNetMsgCfg.MysteryStore_BuyResponse,idx,_var_num_tab[idx])
    return
end
-------------------------------������ �ⲿ���� ������---------------------------------------
--ÿ���賿 �� ÿ�յ�һ�ε�¼ ����
local function _goDailyUpdate(actor)
    local state = 0
    local maxday = 0
    local no_receive = 0
    for i,v in ipairs(cfg_mystery_store) do
        if v.leixing and v.leixing == 1 then
            state = getplayvar(actor, BuyNum_var_name[i])
            if state ~= no_receive then
                setplayvar(actor, "HUMAN",BuyNum_var_name[i], no_receive,1)
            end
        end
    end

    for i,v in pairs(BuyNum_var_name) do
        _var_num_tab[i] = getplayvar(actor, v)
    end
    Message.sendmsg(actor, ssrNetMsgCfg.MysteryStore_SyncResponse, 0,0,0,_var_num_tab)
end
GameEvent.add(EventCfg.goDailyUpdate, _goDailyUpdate, MysteryStore)
-- ----------------------------������ ��Ϸ�¼� ������---------------------------------------
--��¼���
GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas)
    --��������
    local temp = {}
    for i,v in pairs(BuyNum_var_name) do
        table.insert(temp,v)
    end
    FIniPlayVar(actor, temp)

    --ͬ������
    MysteryStore.SyncResponse(actor, logindatas)
end, MysteryStore)

Message.RegisterNetMsg(ssrNetMsgCfg.MysteryStore, MysteryStore)

return MysteryStore