Forgingstar = {}
Forgingstar.ID = 21500

Forgingstar._var_name_star = "NB_forgingstar_"           --�Ǽ�����ǰ׺

Forgingstar._var_name_attr = "NB_forgingattr_"          --���Ա���ǰ׺

local _equipstarattr = {[1]=0, [3]=0, [4]=0, [9]=0, [10]=0}         --[��������]cfg_att_score�������õ�����Idx:   [1]����;[3],[4]����;[9],[10]����;

local _var_name_tab = {}                    --�Ǽ���������

local _var_lv_tab = {}                      --�Ǽ�����ֵ��

local _cfg = {}

local site_tab = {1,0,3,4,5,6,7,8,10,11} --װ��λ�ñ�

for i, weizhi in ipairs(site_tab) do
    _var_name_tab[i] = Forgingstar._var_name_star..weizhi
    _var_lv_tab[i] = 0
end

local ratio = 10000 --�������ñ���

for k,v in ipairs(cfg_qianghua) do
    _cfg[v.weizhi] = _cfg[v.weizhi] or {}
    _cfg[v.weizhi][v.level] = _cfg[v.weizhi][v.level] or {}
    _cfg[v.weizhi][v.level] = {
        weizhi=v.weizhi,shuxingjiacheng=v.shuxingjiacheng,xiaohao=v.xiaohao,chenggonglv=v.chenggonglv,
        shuxing = v.shuxing,jianji = v.jianji,item = v.item,
    }
end

local _var_name_tab2 = {}                   --�������Ա�������
for attridx,_ in pairs(_equipstarattr) do
    _var_name_tab2[attridx] = Forgingstar._var_name_attr..attridx
end

local function isTabEquip(where)
    local idx = 0
    for i, _weizhi in ipairs(site_tab) do
        if _weizhi == where then
            idx = i
            break
        end
    end
    return idx
end
-- -------------------------------������ ������Ϣ ������---------------------------------------
--ͬ������
local _login_data = {ssrNetMsgCfg.Forgingstar_SyncResponse, 0,0,0,_var_lv_tab}
function Forgingstar.SyncResponse(actor,logindatas)
    for i = 1 ,#_var_name_tab do
        _var_lv_tab[i] = getplayvar(actor, _var_name_tab[i])
    end
    if logindatas then
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.Forgingstar_SyncResponse, 0,0,0,_var_lv_tab)
    end
end

--ǿ��
function Forgingstar.RequestUpgradeStar(actor, weizhi, isLuck)
    if not _cfg[weizhi] then return end

    local idx = isTabEquip(weizhi)

    local lv = getplayvar(actor, _var_name_tab[idx])

    local next_lv = lv + 1

    local cfg = _cfg[weizhi]
    if not cfg[next_lv] then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>��λ��������!</font>","Type":9}')
        Message.sendmsg(actor, ssrNetMsgCfg.Forgingstar_UpgradeStarResponse, weizhi, lv)
        return
    end
    local name,num = Player.checkItemNumByTable(actor, cfg[next_lv].xiaohao)
    if name then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>���ϲ���!</font>","Type":9}')
        Message.sendmsg(actor, ssrNetMsgCfg.Forgingstar_UpgradeStarResponse, weizhi, lv)
        return
    end
    if isLuck == 1 then
        --���˱����ж�����
        --LOGDump(cfg[next_lv],"cfg[next_lv].item;")
        name,num = Player.checkItemNumByTable(actor, cfg[next_lv].item)
        if name then
            sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>���˱��ײ��ϲ���!</font>","Type":9}')
            Message.sendmsg(actor, ssrNetMsgCfg.Forgingstar_UpgradeStarResponse, weizhi, lv)
            return
        end
    end
    if isLuck == 1 then
        --���˱����ж�����
        Player.takeItemByTable(actor, cfg[next_lv].item)
    end

    Player.takeItemByTable(actor, cfg[next_lv].xiaohao)

    if FProbabilityHit( cfg[next_lv].chenggonglv, ratio) then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>ǿ��ʧ��!</font>","Type":9}')
        if isLuck ~= 1 then
            next_lv = lv - _cfg[weizhi][next_lv].jianji
        else
            next_lv =  lv
        end
    else
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#FFFF00\'>ǿ�ǳɹ�!</font>","Type":9}')
    end
    --д���ݿ�
    FSetPlayVar(actor, _var_name_tab[idx], next_lv)
    if next_lv ~= lv then
        --ˢ�»�������
        Forgingstar.updateEquipStarAttr(actor,weizhi)
        --ˢ���Ǽ�
        local cur_attr = cfg[lv] and cfg[lv].shuxing or nil
        local next_attr = cfg[next_lv] and cfg[next_lv].shuxing or nil
        Player.updateSomeAddr(actor, cur_attr, next_attr)
    end
    Message.sendmsg(actor, ssrNetMsgCfg.Forgingstar_UpgradeStarResponse, weizhi, next_lv)
end
-- -------------------------------������ �ⲿ���� ������---------------------------------------
--�����Ǽ����ڻ������Եļӳ�
function Forgingstar.updateEquipStarAttr(actor,site)
    for attridx,_ in pairs(_equipstarattr) do
        _equipstarattr[attridx] = 0
    end
    for i,weizhi in ipairs(site_tab) do
        local itemobj = linkbodyitem(actor, weizhi)          --������Ʒ����
        local level = getplayvar(actor, _var_name_tab[i])           --���ǵȼ�
        if itemobj ~= "0" and level > 0 then
            for attridx,_ in pairs(_equipstarattr) do
                local itemidx = getiteminfo(actor, itemobj, ConstCfg.iteminfo.idx)
                local attrvalue = getstditematt(itemidx, attridx)
                if attrvalue > 0 then
                    local pro = _cfg[weizhi][level].shuxingjiacheng/ratio        --����������ֱ�
                    local addattrvalue = math.floor(attrvalue * pro)
                    if addattrvalue > 0 then
                        _equipstarattr[attridx] = _equipstarattr[attridx] + addattrvalue
                    end
                end
            end
        end
    end
    local cur_attr,next_attr = {},{}
    for attridx,addvalue in pairs(_equipstarattr) do
        table.insert(next_attr,{attridx,addvalue})
        if site then
             --����װ��/�Ǽ������仯ʱ��������
             local db_addvalue = getplayvar(actor,_var_name_tab2[attridx])
             table.insert(cur_attr,{attridx,db_addvalue})
        else
           --��½��������
           cur_attr = nil
        end
        FSetPlayVar(actor, _var_name_tab2[attridx], addvalue)
    end
    Player.updateSomeAddr(actor, cur_attr, next_attr)
end
-- ----------------------------������ ��Ϸ�¼� ������---------------------------------------
--��½����
local function _onLoginEnd(actor,logindatas)
    local temp = {}
    for i ,var in ipairs(_var_name_tab) do
        table.insert(temp,var)
    end
    for attridx ,var in pairs(_var_name_tab2) do
        table.insert(temp,var)
    end
    temp = table.concat(temp, "|")
    FIniPlayVar(actor, temp)

    Forgingstar.SyncResponse(actor, logindatas)
    Forgingstar.updateEquipStarAttr(actor)
end
GameEvent.add(EventCfg.onLoginEnd, _onLoginEnd, Forgingstar)

--��װ��
function _onTakeOnEx(actor, itemobj, where, itemname, makeid)
    local idx = isTabEquip(where)
    if idx ~= 0 then
        Forgingstar.updateEquipStarAttr(actor,where)
    end
end
GameEvent.add(EventCfg.onTakeOnEx, _onTakeOnEx, Forgingstar)

--��װ��
function _onTakeOffEx(actor, itemobj, where, itemname, makeid)
    local idx = isTabEquip(where)
    if idx ~= 0 then
        Forgingstar.updateEquipStarAttr(actor,where)
    end
end
GameEvent.add(EventCfg.onTakeOffEx, _onTakeOffEx, Forgingstar)

--��½��ȡ�Ǽ�����
GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    local level = 0
    for i = 1,#site_tab do
        level = getplayvar(actor, _var_name_tab[i])
        local weizhi = site_tab[i]
        if _cfg[weizhi][level] then
            --LOGDump(_cfg[weizhi][level].shuxing,site_tab[i])
            table.insert(loginattrs, _cfg[weizhi][level].shuxing)
        end
    end
end, Forgingstar)

Message.RegisterNetMsg(ssrNetMsgCfg.Forgingstar, Forgingstar)

return Forgingstar