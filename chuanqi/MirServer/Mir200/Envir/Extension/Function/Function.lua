-------------------------
-------------------------
--�������ṩ��������չ
-------------------------
-------------------------



--�����Զ�����˱���
function FIniPlayVar(actor, varname, isstr)
    local vartype = isstr and "string" or "integer"
    if type(varname) == "table" then
        varname = table.concat(varname, "|")
    end
    iniplayvar(actor, vartype, "HUMAN", varname)
end

--�����Զ�����˱���
function FSetPlayVar(actor, varname, value, save)
    value = value or 0
    save = save or 1
    if type(varname) == "table" then
        for _,vname in ipairs(varname) do
            setplayvar(actor, "HUMAN", vname, value, save)
        end
    else
        setplayvar(actor, "HUMAN", varname, value, save)
    end
end

--���Լ�����֪ͨ
function FSendOwnNotice(actor, code, ...)
    sendmsg(actor, ConstCfg.notice.own, ssrResponseCfg.get(code, ...))
end


--����Ʒ
function FGiveItem(actor, idx_or_name, num, bind)
    num = num or 1
    if type(idx_or_name) == "number" then
        idx_or_name = getstditeminfo(idx_or_name, ConstCfg.stditeminfo.name)
    end
    return giveitem(actor, idx_or_name, num, bind)
end

--������Ʒ
function FTakeItem(actor, idx_or_name, num)
    num = num or 1
    if type(idx_or_name) == "number" then
        idx_or_name = getstditeminfo(idx_or_name, ConstCfg.stditeminfo.name)
    end
    return takeitem(actor, idx_or_name, num)
end

--��ȡ������ĳ����Ʒ����ͨ��ΨһID
function FGetItemObjByMakeIndex(actor, makeindex)
    local item_num = getbaseinfo(actor, ConstCfg.gbase.bag_num)
	for i=0, item_num-1 do
		local itemobj = getiteminfobyindex(actor, i)
		local itemmakeindex = getiteminfo(actor, itemobj, ConstCfg.iteminfo.id)
		if itemmakeindex == makeindex then
			return itemobj
		end
	end
end

--��ȡװ����λ��Ϣ
function FGetSockeTableItem(actor, itemobj, hole)
    local sockets = json2tbl(getsocketableitem(actor, itemobj))
    if hole then return sockets["socket"..hole] end
    return sockets
end

--����װ����λ����
function FDrillOneHole(actor, itemobj, hole, flag)
    flag = flag and 1 or 0
    drillhole(actor, itemobj, "{hole"..hole..":"..flag.."}")
end

--���һ������ķ�Χ
function FCheckRange(obj, x, y, range)
    local cur_x, cur_y = getbaseinfo(obj, ConstCfg.gbase.x), getbaseinfo(obj, ConstCfg.gbase.y)
    local min_x, max_x = x-range, x+range
    local min_y, max_y = y-range, y+range

    if (cur_x >= min_x) and (cur_x <= max_x) and
       (cur_y >= min_y) and (cur_y <= max_y) then
        return true
    end
    
    return false
end

--����Լ���npc�ľ���
function FCheckNPCRange(actor, npcidx, range)
    range = range or 15
    local npcobj = getnpcbyindex(npcidx)
    local npc_mapid = getbaseinfo(npcobj, ConstCfg.gbase.mapid)
    local my_mapid = getbaseinfo(actor, ConstCfg.gbase.mapid)
    if npc_mapid ~= my_mapid then return false end

    local npc_x = getbaseinfo(npcobj, ConstCfg.gbase.x)
    local npc_y = getbaseinfo(npcobj, ConstCfg.gbase.y)
    return FCheckRange(actor, npc_x, npc_y, range)
end

--���ͻ���·��npc���Ի�
local sdl_npc_list = {
    --����½npc,15ת�Ϳ���10��󿪷�
    [258] = 1,[259] = 1,[260] = 1,[262] = 1,[263] = 1,[276] = 1,[277] = 1,
    [278] = 1,[279] = 1,[280] = 1,[281] = 1,[282] = 1,[283] = 1,[284] = 1,
    [285] = 1,[286] = 1,[287] = 1,[288] = 1,[289] = 1,[290] = 1,
}
function FOpenNpcShowEx(actor, npcidx, range1, range2)
    if sdl_npc_list[npcidx] then
        local day = grobalinfo(1)
        if day < 10 then
            sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>Ŀ���ͼ����'..(10-day)..'�պ󿪷�</font>","Type":9}')
            return
        end
        if zslevel < 15 then
            sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>��Ҫת����ʮ��ת</font>","Type":9}')
            return
        end
    end
    if FCheckNPCRange(actor, npcidx) then
        opennpcshowex(actor, npcidx)
    else
        range1 = range1 or 1
        range2 = range2 or 1
        opennpcshowex(actor, npcidx, range1, range2)
    end
end