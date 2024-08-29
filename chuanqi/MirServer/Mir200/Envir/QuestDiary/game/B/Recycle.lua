Recycle = {}
Recycle.ID = 20600

local _cfg = {}

local _cfg_item_Idx = {}                                            --���п��Ի��յĵ���idx

local _varflag_auto_equip   = 200                                   --�Զ�����װ����ʶ

local _var_name = "NB_recycle_checkItem"                            --���չ�ѡ������ǰ׺

local _var_name_tab = {}                                            --���չ�ѡ��������

local _var_check_info = {}                                          --���չ�ѡ��

local fIniPlayVar_temp = {}                                         --������Ҫ��ʼ��int���͵ı�����

local _setDataType = {
    ["mainCheck"] = 0,              --����年ѡ
    ["secondaryCheck"] = 1,         --����湴ѡ
    ["allCheck"] = 3,               --�����ȫѡ/ȫ��ѡ
}

for i,v in ipairs(cfg_huishou) do
    --��ʼ����������
    _var_name_tab[v.type] = _var_name_tab[v.type] or {}
    _var_name_tab[v.type][v.type2] = _var_name_tab[v.type][v.type2] or {}
    if #_var_name_tab[v.type][v.type2] == 0 then
        _var_name_tab[v.type][v.type2].ischoice = _var_name .."_ischoice_"..v.type.."_"..v.type2
        table.insert(fIniPlayVar_temp, _var_name_tab[v.type][v.type2].ischoice)
    end
    _var_name_tab[v.type][v.type2][v.type3] = _var_name .."_"..v.type.."_"..v.type2.."_"..v.type3
    table.insert(fIniPlayVar_temp,_var_name_tab[v.type][v.type2][v.type3])
    --��¼���յ�itemidx
    _cfg_item_Idx[v.itemid] = v

    --��ʼ����ѡ��
    _var_check_info[v.type] = _var_check_info[v.type] or {}
    _var_check_info[v.type][v.type2] = _var_check_info[v.type][v.type2] or {}
    if #_var_check_info[v.type][v.type2] == 0 then
        _var_check_info[v.type][v.type2].ischoice = 0
    end
    _var_check_info[v.type][v.type2][v.type3] = 0

    _cfg[v.type] = _cfg[v.type] or {}
    _cfg[v.type][v.type2] = _cfg[v.type][v.type2] or {}
    _cfg[v.type][v.type2][v.type3] = {gouxuan = v.gouxuan}
end

local viplevel = 0

local JHMWlevel = 0
-------------------------------������ ���ط��� ������---------------------------------------

--�Զ�������Ʒ
local function _auto_recycle_equip(actor, itemidxs)
    if not itemidxs then return end

    viplevel = getplayvar(actor,VarCfg.C_QsQVIP)

    JHMWlevel = getplayvar(actor,JiangHuMingWang._var_name_Lv)--���������ȼ�

    local t_take = {}
    if type(itemidxs) == "table" then
        local temp_take = {}
        for _,idx in ipairs(itemidxs) do
            local num = Bag.getItemNumByIdx(actor, idx)
            if num > 0 and not temp_take[idx] then temp_take[idx] = num end
        end
        for idx,num in pairs(temp_take) do
            table.insert(t_take, {idx, num})
        end
    else
        local num = Bag.getItemNumByIdx(actor, itemidxs)
        if num > 0 then table.insert(t_take, {itemidxs, num}) end
    end

    if #t_take == 0 then return end

    --��������Ʒ
    local _, name = Player.checkItemNumByTable(actor, t_take)
    if name then
        sendmsg(actor, ConstCfg.notice.own, ssrResponseCfg.get(ssrResponseCfg.not_item, name))
        return
    end

    --���߻�����Ʒ
    Player.takeItemByTable(actor, t_take, "װ������")

    local xiuxian_pro = 0
    if cfg_xiuxian[JHMWlevel] then
        xiuxian_pro = cfg_xiuxian[JHMWlevel].huishou /10000
    end

    local Reuse = {}
    for _,v in pairs(t_take) do
        local take_idx,multiple = v[1],v[2]
        local cfg = _cfg_item_Idx[take_idx]
        local price = cfg.price
        --�����ս���
        local pro = 1
        if cfg_vip[viplevel] and cfg_vip[viplevel].Recovery then
            price = cfg.price1
            pro = pro + cfg_vip[viplevel].Recovery / 10000 + xiuxian_pro
        end
        if cfg.ignore then
            pro = 1
        end
        for _,Reusecfg in ipairs(price) do
            local idx, num = Reusecfg[1], Reusecfg[2]
            Reuse[idx] = Reuse[idx] or 0
            Reuse[idx] = Reuse[idx] + num * multiple * pro
        end
    end

    local givedata = {}
    for idx,num in pairs(Reuse) do
        if idx == 2 then    --δ���������Ȩ,��õ��ǰ�Ԫ��
            if cfg_vip[viplevel] and cfg_vip[viplevel].dajin then
                if cfg_vip[viplevel].dajin ~= 1 then
                    idx = 4
                end
            else
                idx = 4
            end
        end
        table.insert(givedata, {idx, num})
    end
    Player.giveItemByTable(actor, givedata, "װ�����ջ��", nil, false)
end

-------------------------------������ ������Ϣ ������---------------------------------------

--ͬ������
local _login_data = {ssrNetMsgCfg.Recycle_SyncResponse, 0,0,0,_var_check_info}
function Recycle.SyncResponse(actor, logindatas)
    viplevel = getplayvar(actor,VarCfg.C_QsQVIP)
    _login_data[2] = getflagstatus(actor, _varflag_auto_equip)
    _login_data[3] = viplevel

    for i, value in ipairs(_var_name_tab) do
        for j, var in ipairs(value) do
            _var_check_info[i][j].ischoice = getplayvar(actor,var.ischoice)
            for x, v in ipairs(var) do
                _var_check_info[i][j][x] = getplayvar(actor,v)
            end
        end
    end
    if logindatas then
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.Recycle_SyncResponse, _login_data[2],_login_data[3],0,_var_check_info)
    end
end

--��ѡ�Զ�����װ��
function Recycle.RequestAutoEquip(actor, auto_state)
    viplevel = getplayvar(actor,VarCfg.C_QsQVIP)
    if not (cfg_vip[viplevel] and cfg_vip[viplevel].Pet == 1) then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>���ȿ�ͨ'..cfg_vip[2].Txt..'!</font>","Type":9}')
        auto_state = 0
    end
    setflagstatus(actor, _varflag_auto_equip,auto_state)
    Message.sendmsg(actor, ssrNetMsgCfg.Recycle_AutoEquipResponse, auto_state)
end

--װ������
function Recycle.RequestEquip(actor, arg1, arg2, arg3, itemidxs)
    _auto_recycle_equip(actor, itemidxs)
end

--װ������
function Recycle.RequestWarehouse(actor)
    openstorage(actor)
end

--���빴ѡ����
function Recycle.SetUserData(actor,_type,arg2,arg3,tab)
    if _setDataType.mainCheck == _type then
        local page1,page2,ischoice = tab[1],tab[2],tab[3]
        if not _var_name_tab[page1] or not _var_name_tab[page1][page2] then return end
        FSetPlayVar(actor,_var_name_tab[page1][page2].ischoice,ischoice)
    elseif _setDataType.secondaryCheck == _type then
        local page1,page2,page3,ischoice = tab[1],tab[2],tab[3],tab[4]
        if not _var_name_tab[page1] or not _var_name_tab[page1][page2] or not _var_name_tab[page1][page2][page3] then return end
        FSetPlayVar(actor,_var_name_tab[page1][page2][page3],ischoice)
    elseif _setDataType.allCheck == _type then
        local page1,page2,ischoice = tab[1],tab[2],tab[3]
        if not _var_name_tab[page1] or not _var_name_tab[page1][page2] then return end
        for _, v in ipairs(_var_name_tab[page1][page2]) do
            FSetPlayVar(actor,v,ischoice)
        end
    end
end

Message.RegisterNetMsg(ssrNetMsgCfg.Recycle, Recycle)
-- ----------------------------������ ��Ϸ�¼� ������---------------------------------------
--��½����
local function _onLoginEnd(actor,logindatas)
    Recycle.SyncResponse(actor, logindatas)
end
GameEvent.add(EventCfg.onLoginEnd, _onLoginEnd, Recycle)

--��ʼ�����˱���
local function _goPlayerVar(actor)
    FIniPlayVar(actor,fIniPlayVar_temp)
end
GameEvent.add(EventCfg.goPlayerVar, _goPlayerVar, Recycle)

--�����״ε�½,����Ĭ�Ϲ�ѡ
local gouxuan
local function _onNewHuman(actor)
    for i,v in ipairs(_cfg) do
        for j,var in ipairs(v) do
            for n,value in ipairs(var) do
                if n == 1 then
                    gouxuan = value.gouxuan and 1 or 0
                    FSetPlayVar(actor,_var_name_tab[i][j].ischoice,gouxuan)
                end
                FSetPlayVar(actor,_var_name_tab[i][j][n],1)
            end
        end
    end
end
GameEvent.add(EventCfg.onNewHuman, _onNewHuman, Recycle)

return Recycle