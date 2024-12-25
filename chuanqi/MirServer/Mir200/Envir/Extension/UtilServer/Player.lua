Player = {}

--获取创建角色天数
function Player.getCreateActorDay(actor)
    local openday = grobalinfo(ConstCfg.global.openday)
    local create_actor_openday = getplaydef(actor, VarCfg.U_create_actor_openday)
    local create_actor_day = openday - create_actor_openday + 1
    return create_actor_day
end

--检查货币数量
function Player.checkMoneyNum(actor, moneytype, num)
    local moneynum = querymoney(actor, moneytype)
    if moneytype == ConstCfg.money.bdyb then
        moneynum = moneynum + querymoney(actor, ConstCfg.money.yb)
    end
    if moneytype == ConstCfg.money.lf then
        moneynum = moneynum + querymoney(actor, ConstCfg.money.bdlf)
    end
    return moneynum >= num
end

--获取虚冲金额
function Player.getVirtualBillNum(actor)
    return getplaydef(actor, VarCfg.U_real_recharge_cent) + getplaydef(actor, VarCfg.U_virtual_recharge_cent)
end

--获取今日虚冲金额
function Player.getTodayVirtualBillNum(actor)
    return getplaydef(actor, VarCfg.U_today_real_recharge_cent) + getplaydef(actor, VarCfg.U_today_virtual_recharge_cent)
end

--扣除货币数量
function Player.takeMoney(actor, idx,num, desc)
    if idx == ConstCfg.money.bdyb then  --游戏设定 绑定元宝不足扣除正常元宝
        local bdyb = querymoney(actor, ConstCfg.money.bdyb)
        if num > bdyb then    --所需元宝大于绑定元宝时
            changemoney(actor, ConstCfg.money.bdyb, "-", bdyb, desc, true)   --首先扣除所有绑定元宝
            changemoney(actor, ConstCfg.money.yb, "-", (num-bdyb), desc, true)  --正常元宝补充不足元宝
        end
    end
    if idx == ConstCfg.money.lf then  --游戏设定 优先扣除绑定灵符
        local bdlf = querymoney(actor, ConstCfg.money.bdlf)
        if bdlf >= num then
            --如果绑定灵符大于等于需要扣除的数量
            changemoney(actor, ConstCfg.money.bdlf, "-", num, desc, true)
            -- LOGWrite("进入2,原:",bdlf,"修改后:",querymoney(actor, ConstCfg.money.bdlf))
            num = 0
        else
            --如果绑定灵符不足
            changemoney(actor, ConstCfg.money.bdlf, "-", bdlf, desc, true)
            -- LOGWrite("进入3,原:",bdlf,"修改后:",querymoney(actor, ConstCfg.money.bdlf))
            num = num - bdlf
        end
    end
    changemoney(actor, idx, "-", num, desc, true)
end


--检查 物品 货币 装备是否满足数量(数量不足返回不足物品的名字)
function Player.checkItemNumByTable(actor, t, multiple)
    for _,item in ipairs(t) do
        local idx,num = item[1],item[2]
        if multiple then num=num*multiple end

        local name = idx==ConstCfg.money.bdyb and "元宝" or getstditeminfo(idx, ConstCfg.stditeminfo.name)
        if Item.isCurrency(idx) then        --货币
            if not Player.checkMoneyNum(actor, idx, num) then
                return name, num
            end
        else                                    --物品 装备
            if not Bag.checkItemNumByIdx(actor, idx, num) then
                return name, num
            end
        end
    end
end

--如果是装备要检查身上(只供物品合成使用)
function Player.libcheckItemNumByTableEx(actor, t, multiple)
    for _,item in ipairs(t) do
        local idx,num = item[1],item[2]
        if multiple then num = num * multiple end
        local name = getstditeminfo(idx, ConstCfg.stditeminfo.name)
        if Item.isCurrency(idx) then        --货币
            if not Player.checkMoneyNum(actor, idx, num) then
                return false, name, num
            end
        elseif Item.isItem(idx) then        --物品
            if not Bag.checkItemNumByIdx(actor, idx, num) then
                return false, name, num
            end
        else                                --装备
            local count = Bag.getItemNumByIdx(actor, idx)
            if count < num then
                local wheres = Item.getWheresByIdx(idx)
                if wheres then
                    for _,where in ipairs(wheres) do
                        local equipobj = linkbodyitem(actor, where)
                        if equipobj ~= "0" then
                            local equipidx = getiteminfo(actor, equipobj, ConstCfg.iteminfo.idx)
                            if equipidx == idx then
                                count = count + 1
                            end
                        end
                    end
                end
            end
            if count < num then
                return false, name, num
            end
        end
    end
    return true
end

--拿走物品
function Player.takeItemByTable(actor, t, desc, multiple)
    for _,item in ipairs(t) do
        local idx,num = item[1],item[2]
        if multiple then num=num*multiple end
        if Item.isCurrency(idx) then        --货币
            if idx == 4 then  --游戏设定 绑定元宝不足扣除正常元宝
                local bdyb = querymoney(actor, 4)
                if num > bdyb then    --所需元宝大于绑定元宝时
                    changemoney(actor, 4, "-", bdyb, desc, true)   --首先扣除所有绑定元宝
                    changemoney(actor, 2, "-", (num-bdyb), desc, true)  --正常元宝补充不足元宝
                end
            end
            if idx == ConstCfg.money.lf then  --游戏设定 优先扣除绑定灵符
                local bdlf = querymoney(actor, ConstCfg.money.bdlf)
                if bdlf >= num then
                    --如果绑定灵符大于等于需要扣除的数量
                    changemoney(actor, ConstCfg.money.bdlf, "-", num, desc, true)
                    -- LOGWrite("进入2,原:",bdlf,"修改后:",querymoney(actor, ConstCfg.money.bdlf))
                    num = 0
                else
                    --如果绑定灵符不足
                    changemoney(actor, ConstCfg.money.bdlf, "-", bdlf, desc, true)
                    -- LOGWrite("进入3,原:",bdlf,"修改后:",querymoney(actor, ConstCfg.money.bdlf))
                    num = num - bdlf
                end
            end
            if num > 0 then
                changemoney(actor, idx, "-", num, desc, true)
            end
        else                                    --物品 装备
            local name = getstditeminfo(idx, ConstCfg.stditeminfo.name)
            takeitem(actor, name, num)
        end
    end
end

--优先拿走非绑定物品
function Player.takeItemByTableEx(actor, t, desc, multiple, isbind)
    --拆分物品和货币
    local t_gold = {}
    local t_item = {}
    local t_overlap_item = {}
    local iteminfos = {}
    local itemoverlapinfos = {}
    for _,item in ipairs(t) do  
        local idx,num = item[1],item[2]
        if multiple then num = num * multiple end
        if Item.isCurrency(idx) then    --货币
            t_gold[idx] = num
        else                                --物品 装备
            local overlap = getstditeminfo(idx, ConstCfg.stditeminfo.overlap)
            if overlap == 0 then        --不叠加
                t_item[idx] = num
                iteminfos[idx] = {bind={}, notbind={}}
            else                        --叠加物品
                t_overlap_item[idx] = num
                itemoverlapinfos[idx] = {bind={}, notbind={}}
            end
        end
    end
    --绑定与非绑定物品唯一id分开保存
    local item_num = getbaseinfo(actor, ConstCfg.gbase.bag_num)
    for i=0, item_num-1 do
        local itemobj = getiteminfobyindex(actor, i)
        local itemidx = getiteminfo(actor, itemobj, ConstCfg.iteminfo.idx)
        for idx,_ in pairs(t_item) do
            if idx == itemidx then
                local bind = getiteminfo(actor, itemobj, ConstCfg.iteminfo.bind)
                local t_bind = bind==0 and iteminfos[idx].notbind or iteminfos[idx].bind
                local itemmakeindex = getiteminfo(actor, itemobj, ConstCfg.iteminfo.id)
                table.insert(t_bind, itemmakeindex)
            end
        end

        for idx,_ in pairs(t_overlap_item) do
            if idx == itemidx then
                local bind = getiteminfo(actor, itemobj, ConstCfg.iteminfo.bind)
                local t_bind = bind==0 and itemoverlapinfos[idx].notbind or itemoverlapinfos[idx].bind
                local itemmakeindex = getiteminfo(actor, itemobj, ConstCfg.iteminfo.id)
                local itemnum = getiteminfo(actor, itemobj, ConstCfg.iteminfo.overlap)
                t_bind[itemmakeindex] = itemnum
            end
        end
    end

    --身上穿戴的物品也算在合成物品内
    for idx,_t in pairs(iteminfos) do
        if Item.isEquip(idx) then
            local wheres = Item.getWheresByIdx(idx)
            for _,where in ipairs(wheres) do
                local equipobj = linkbodyitem(actor, where)
                if equipobj ~= "0" then
                    local equipidx = getiteminfo(actor, equipobj, ConstCfg.iteminfo.idx)
                    if equipidx == idx then
                        local bind = getiteminfo(actor, equipobj, ConstCfg.iteminfo.bind)
                        local t_bind = bind==0 and iteminfos[idx].notbind or iteminfos[idx].bind
                        local equipmakeindex = getiteminfo(actor, equipobj, ConstCfg.iteminfo.id)
                        table.insert(t_bind, equipmakeindex)
                    end
                end
            end
        end
    end

    --扣物品
    local t_take = {}
    for idx,need_num in pairs(t_item) do
        local t_bind, t_notbind = iteminfos[idx].bind, iteminfos[idx].notbind
        local t_first = isbind and {t_notbind} or {t_bind, t_notbind}
        for _,v in ipairs(t_first) do
            for _,makeindex in ipairs(v) do
                table.insert(t_take, makeindex)
                need_num = need_num - 1
                if need_num == 0 then break end
            end
            if need_num == 0 then break end
        end
    end
    if #t_take > 0 then
        local takestr = table.concat(t_take, ",")
        delitembymakeindex(actor, takestr)
    end

    for idx,need_num in pairs(t_overlap_item) do
        local temp_num = need_num
        local t_bind, t_notbind = itemoverlapinfos[idx].bind, itemoverlapinfos[idx].notbind
        local t_first = isbind and {t_notbind} or {t_bind, t_notbind}
        for _,v in ipairs(t_first) do
            if temp_num <= 0 then break end
            for makeindex,num in pairs(v) do
                temp_num = temp_num - num
                if temp_num > 0 then
                    delitembymakeindex(actor, tostring(makeindex), num)
                    need_num = need_num - num
                else
                    delitembymakeindex(actor, tostring(makeindex), need_num)
                    break
                end
            end
        end
    end

    --扣货币
    for idx,num in pairs(t_gold) do
        changemoney(actor, idx, "-", num, desc, true)
    end
    return isbind
    --如果有一个物品是固定绑定 其他物品优先扣除绑定物品
    --如果没有任何物品是固定绑定那么说明非绑定物品足够
    --判断物品是否叠加物品 如果是叠加物品要单独拿走
end

--给物品
function Player.giveItemByTable(actor, t, desc, multiple, isbind)
    multiple = multiple or 1         --倍数

    for _,item in ipairs(t) do
        local idx,num,bind = item[1],item[2],item[3]
        if Item.isCurrency(idx) then        --货币
            changemoney(actor, idx, "+", num * multiple, desc, true)
        else                                    --物品 装备
            local name = getstditeminfo(idx, ConstCfg.stditeminfo.name)
            if bind or isbind then
                giveitem(actor, name, num * multiple, ConstCfg.binding)
            else
                giveitem(actor, name, num * multiple)
            end
        end
    end
end

--给物品盒子
function Player.giveItemBoxByIdx(actor, idx)
    local name = getstditeminfo(idx, ConstCfg.stditeminfo.name)
    giveitem(actor, name)
end

--获取当前穿戴装备的唯一id数组通过idx
function Player.getEquipIdsByIdx(actor, idx)
    if not Item.isEquip(idx) then return {} end

    local equipids = {}
    local wheres = Item.getWheresByIdx(idx)
    for _,where in ipairs(wheres) do
        local equipobj = linkbodyitem(actor, where)
        if equipobj ~= "0" then
            local equipidx = getiteminfo(actor, equipobj, ConstCfg.iteminfo.idx)
            if equipidx == idx then
                local equipmakeindex = getiteminfo(actor, equipobj, ConstCfg.iteminfo.id)
                table.insert(equipids, equipmakeindex)
            end
        end
    end
    return equipids
end

--获取装备位idx
function Player.getEquipPosIdx(actor, pos)
    local itemobj = linkbodyitem(actor, pos)
    if itemobj=="0" then return end
    local idx = getiteminfo(actor, itemobj, ConstCfg.iteminfo.idx)
    return idx
end


--更新属性
local _addrs = {}
function Player.updateAddr(actor, loginattrs)
    --引擎属性
    for attridx=1,250 do
        _addrs[attridx] = 0
    end

    for _,addr in ipairs(loginattrs) do
        for _,v in ipairs(addr) do
            local attridx = v[1]
            _addrs[attridx] = _addrs[attridx] + v[2]
        end
    end

    --附加引擎属性
    for attridx,value in ipairs(_addrs) do
        if value > 0 then
            changehumnewvalue(actor, attridx, _addrs[attridx], ConstCfg.attrtime)
        end
    end
end

--更新部分属性
function Player.updateSomeAddr(actor, cur_attr, next_attr)
    local newattr = {}
    if cur_attr then
        for _,attr in ipairs(cur_attr) do
            local attridx, attrvalue = attr[1], attr[2]
            newattr[attridx] = newattr[attridx] or gethumnewvalue(actor, attridx)
            newattr[attridx] = newattr[attridx] - attrvalue
            if newattr[attridx] < 0 then newattr[attridx] = 0 end
        end
    end

    -- LOGDump(newattr)

    if next_attr then
        for _,attr in ipairs(next_attr) do
            local attridx, attrvalue = attr[1], attr[2]
            newattr[attridx] = newattr[attridx] or gethumnewvalue(actor, attridx)
            newattr[attridx] = newattr[attridx] + attrvalue
        end
    end

    -- LOGDump(newattr)

    --cfg_att_score.xls 属性
    for attridx,attrvalue in pairs(newattr) do
        changehumnewvalue(actor, attridx, attrvalue, ConstCfg.attrtime)
    end
end

return Player