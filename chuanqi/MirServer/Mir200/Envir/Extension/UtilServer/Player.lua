Player = {}

--��ȡ������ɫ����
function Player.getCreateActorDay(actor)
    local openday = grobalinfo(ConstCfg.global.openday)
    local create_actor_openday = getplaydef(actor, VarCfg.U_create_actor_openday)
    local create_actor_day = openday - create_actor_openday + 1
    return create_actor_day
end

--����������
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

--��ȡ�����
function Player.getVirtualBillNum(actor)
    return getplaydef(actor, VarCfg.U_real_recharge_cent) + getplaydef(actor, VarCfg.U_virtual_recharge_cent)
end

--��ȡ���������
function Player.getTodayVirtualBillNum(actor)
    return getplaydef(actor, VarCfg.U_today_real_recharge_cent) + getplaydef(actor, VarCfg.U_today_virtual_recharge_cent)
end

--�۳���������
function Player.takeMoney(actor, idx,num, desc)
    if idx == ConstCfg.money.bdyb then  --��Ϸ�趨 ��Ԫ������۳�����Ԫ��
        local bdyb = querymoney(actor, ConstCfg.money.bdyb)
        if num > bdyb then    --����Ԫ�����ڰ�Ԫ��ʱ
            changemoney(actor, ConstCfg.money.bdyb, "-", bdyb, desc, true)   --���ȿ۳����а�Ԫ��
            changemoney(actor, ConstCfg.money.yb, "-", (num-bdyb), desc, true)  --����Ԫ�����䲻��Ԫ��
        end
    end
    if idx == ConstCfg.money.lf then  --��Ϸ�趨 ���ȿ۳������
        local bdlf = querymoney(actor, ConstCfg.money.bdlf)
        if bdlf >= num then
            --�����������ڵ�����Ҫ�۳�������
            changemoney(actor, ConstCfg.money.bdlf, "-", num, desc, true)
            -- LOGWrite("����2,ԭ:",bdlf,"�޸ĺ�:",querymoney(actor, ConstCfg.money.bdlf))
            num = 0
        else
            --������������
            changemoney(actor, ConstCfg.money.bdlf, "-", bdlf, desc, true)
            -- LOGWrite("����3,ԭ:",bdlf,"�޸ĺ�:",querymoney(actor, ConstCfg.money.bdlf))
            num = num - bdlf
        end
    end
    changemoney(actor, idx, "-", num, desc, true)
end


--��� ��Ʒ ���� װ���Ƿ���������(�������㷵�ز�����Ʒ������)
function Player.checkItemNumByTable(actor, t, multiple)
    for _,item in ipairs(t) do
        local idx,num = item[1],item[2]
        if multiple then num=num*multiple end

        local name = idx==ConstCfg.money.bdyb and "Ԫ��" or getstditeminfo(idx, ConstCfg.stditeminfo.name)
        if Item.isCurrency(idx) then        --����
            if not Player.checkMoneyNum(actor, idx, num) then
                return name, num
            end
        else                                    --��Ʒ װ��
            if not Bag.checkItemNumByIdx(actor, idx, num) then
                return name, num
            end
        end
    end
end

--�����װ��Ҫ�������(ֻ����Ʒ�ϳ�ʹ��)
function Player.libcheckItemNumByTableEx(actor, t, multiple)
    for _,item in ipairs(t) do
        local idx,num = item[1],item[2]
        if multiple then num = num * multiple end
        local name = getstditeminfo(idx, ConstCfg.stditeminfo.name)
        if Item.isCurrency(idx) then        --����
            if not Player.checkMoneyNum(actor, idx, num) then
                return false, name, num
            end
        elseif Item.isItem(idx) then        --��Ʒ
            if not Bag.checkItemNumByIdx(actor, idx, num) then
                return false, name, num
            end
        else                                --װ��
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

--������Ʒ
function Player.takeItemByTable(actor, t, desc, multiple)
    for _,item in ipairs(t) do
        local idx,num = item[1],item[2]
        if multiple then num=num*multiple end
        if Item.isCurrency(idx) then        --����
            if idx == 4 then  --��Ϸ�趨 ��Ԫ������۳�����Ԫ��
                local bdyb = querymoney(actor, 4)
                if num > bdyb then    --����Ԫ�����ڰ�Ԫ��ʱ
                    changemoney(actor, 4, "-", bdyb, desc, true)   --���ȿ۳����а�Ԫ��
                    changemoney(actor, 2, "-", (num-bdyb), desc, true)  --����Ԫ�����䲻��Ԫ��
                end
            end
            if idx == ConstCfg.money.lf then  --��Ϸ�趨 ���ȿ۳������
                local bdlf = querymoney(actor, ConstCfg.money.bdlf)
                if bdlf >= num then
                    --�����������ڵ�����Ҫ�۳�������
                    changemoney(actor, ConstCfg.money.bdlf, "-", num, desc, true)
                    -- LOGWrite("����2,ԭ:",bdlf,"�޸ĺ�:",querymoney(actor, ConstCfg.money.bdlf))
                    num = 0
                else
                    --������������
                    changemoney(actor, ConstCfg.money.bdlf, "-", bdlf, desc, true)
                    -- LOGWrite("����3,ԭ:",bdlf,"�޸ĺ�:",querymoney(actor, ConstCfg.money.bdlf))
                    num = num - bdlf
                end
            end
            if num > 0 then
                changemoney(actor, idx, "-", num, desc, true)
            end
        else                                    --��Ʒ װ��
            local name = getstditeminfo(idx, ConstCfg.stditeminfo.name)
            takeitem(actor, name, num)
        end
    end
end

--�������߷ǰ���Ʒ
function Player.takeItemByTableEx(actor, t, desc, multiple, isbind)
    --�����Ʒ�ͻ���
    local t_gold = {}
    local t_item = {}
    local t_overlap_item = {}
    local iteminfos = {}
    local itemoverlapinfos = {}
    for _,item in ipairs(t) do  
        local idx,num = item[1],item[2]
        if multiple then num = num * multiple end
        if Item.isCurrency(idx) then    --����
            t_gold[idx] = num
        else                                --��Ʒ װ��
            local overlap = getstditeminfo(idx, ConstCfg.stditeminfo.overlap)
            if overlap == 0 then        --������
                t_item[idx] = num
                iteminfos[idx] = {bind={}, notbind={}}
            else                        --������Ʒ
                t_overlap_item[idx] = num
                itemoverlapinfos[idx] = {bind={}, notbind={}}
            end
        end
    end
    --����ǰ���ƷΨһid�ֿ�����
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

    --���ϴ�������ƷҲ���ںϳ���Ʒ��
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

    --����Ʒ
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

    --�ۻ���
    for idx,num in pairs(t_gold) do
        changemoney(actor, idx, "-", num, desc, true)
    end
    return isbind
    --�����һ����Ʒ�ǹ̶��� ������Ʒ���ȿ۳�����Ʒ
    --���û���κ���Ʒ�ǹ̶�����ô˵���ǰ���Ʒ�㹻
    --�ж���Ʒ�Ƿ������Ʒ ����ǵ�����ƷҪ��������
end

--����Ʒ
function Player.giveItemByTable(actor, t, desc, multiple, isbind)
    multiple = multiple or 1         --����

    for _,item in ipairs(t) do
        local idx,num,bind = item[1],item[2],item[3]
        if Item.isCurrency(idx) then        --����
            changemoney(actor, idx, "+", num * multiple, desc, true)
        else                                    --��Ʒ װ��
            local name = getstditeminfo(idx, ConstCfg.stditeminfo.name)
            if bind or isbind then
                giveitem(actor, name, num * multiple, ConstCfg.binding)
            else
                giveitem(actor, name, num * multiple)
            end
        end
    end
end

--����Ʒ����
function Player.giveItemBoxByIdx(actor, idx)
    local name = getstditeminfo(idx, ConstCfg.stditeminfo.name)
    giveitem(actor, name)
end

--��ȡ��ǰ����װ����Ψһid����ͨ��idx
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

--��ȡװ��λidx
function Player.getEquipPosIdx(actor, pos)
    local itemobj = linkbodyitem(actor, pos)
    if itemobj=="0" then return end
    local idx = getiteminfo(actor, itemobj, ConstCfg.iteminfo.idx)
    return idx
end


--��������
local _addrs = {}
function Player.updateAddr(actor, loginattrs)
    --��������
    for attridx=1,250 do
        _addrs[attridx] = 0
    end

    for _,addr in ipairs(loginattrs) do
        for _,v in ipairs(addr) do
            local attridx = v[1]
            _addrs[attridx] = _addrs[attridx] + v[2]
        end
    end

    --������������
    for attridx,value in ipairs(_addrs) do
        if value > 0 then
            changehumnewvalue(actor, attridx, _addrs[attridx], ConstCfg.attrtime)
        end
    end
end

--���²�������
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

    --cfg_att_score.xls ����
    for attridx,attrvalue in pairs(newattr) do
        changehumnewvalue(actor, attridx, attrvalue, ConstCfg.attrtime)
    end
end

return Player