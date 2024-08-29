Bag = {}

--��ȡ��Ʒ����
function Bag.getItemNumByIdx(actor, idx)
	local itemName = getstditeminfo(idx,1)
  	return getbagitemcount(actor,itemName)
end

--�����Ʒ����
function Bag.checkItemNumByIdx(actor, idx, num)
	num = num or 1
	local count = Bag.getItemNumByIdx(actor, idx)
	return count >= num
end

--��ȡ�����ո�����
function Bag.getBagEmptyNum(actor)
	return getbagblank(actor)
end

--��鱳���ո�����
function Bag.checkBagEmptyNum(actor, num)
	return getbagblank(actor) >= num
end

--��鱳���Ƿ��㹻������Ʒ items
function Bag.checkBagEmptyItems(actor, items)
	local bagEmptyNum = Bag.getBagEmptyNum(actor)
	local needEmptyNum = 0
	for _,item in ipairs(items) do
        local idx,num = item[1],item[2]
        if not Item.isCurrency(idx) then    --��Ʒ װ��
			needEmptyNum = needEmptyNum + 1
        end
    end
	return bagEmptyNum >= needEmptyNum
end

--��ȡ������ĳ����Ʒ����
function Bag.getItemObjByIdx(actor, idx)
	local item_num = getbaseinfo(actor, ConstCfg.gbase.bag_num)
	for i=0, item_num-1 do
		local itemobj = getiteminfobyindex(actor, i)
		local itemidx = getiteminfo(actor, itemobj, ConstCfg.iteminfo.idx)
		if itemidx == idx then
			return itemobj
		end
	end
end

--��ȡ������ĳ����ƷΨһid
function Bag.getItemMakeIdByIdx(actor, idx)
	local itemobj = Bag.getItemObjByIdx(actor, idx)
	if not itemobj then return end
	return getiteminfo(actor, itemobj, ConstCfg.iteminfo.id)
end

--��鱳���Ƿ���ĳ����Ʒ������ͨ��Ψһid
function Bag.checkItemNumByMakeIndex(actor, makeindex, num)
	num = num or 1

	local item_num = getbaseinfo(actor, ConstCfg.gbase.bag_num)
	for i=0, item_num-1 do
		local itemobj = getiteminfobyindex(actor, i)
		local itemmakeid = getiteminfo(actor, itemobj, ConstCfg.iteminfo.id)
		if itemmakeid == makeindex then
			if num > 1 then
				local overlap = getiteminfo(actor, itemobj, ConstCfg.iteminfo.overlap)
				if overlap < num then return false end
			end
			return true
		end
	end

	return false
end

--��ȡ������ĳ����Ʒ����ͨ��ΨһID
function Bag.getItemObjByMakeIndex(actor, makeindex)
	local item_num = getbaseinfo(actor, ConstCfg.gbase.bag_num)
	for i=0, item_num-1 do
		local itemobj = getiteminfobyindex(actor, i)
		local itemmakeindex = getiteminfo(actor, itemobj, ConstCfg.iteminfo.id)
		if itemmakeindex == makeindex then
			return itemobj
		end
	end
end

return Bag