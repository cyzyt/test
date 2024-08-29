JiangHuMingWang = {}

JiangHuMingWang.ID = 21700

JiangHuMingWang._var_name_Lv = "NB_JiangHuMingWang_Lv"              --�ȼ�������

JiangHuMingWang._var_name_renwu = "NB_jhmw_renwu_"                  --�������ǰ׺

JiangHuMingWang._var_name_gifts = "NB_jhmw_gifts_"                  --����������ǰ׺

JiangHuMingWang._var_info = "NB_JiangHuMingWang_info"               --��ʱ��Ϣ��(json,��½ʱ��ʼ��)

--Ŀ���������� cfg_goals �� type �ֶ�
local _target_types = {
    takeonequip     = 340,	    --����ָ������ָ���ȼ���װ��
    killmon         = 335,	    --��ָ���ȼ�ָ�������Ĺ���
    zhuansheng      = 119,	    --�ﵽת���ȼ�
    shenshou        = 552,      --����֮��
    baowu           = 550,      --�����ʦ
}

--����װ��λ,��������װ��ʱ�õ�
local common_equip_pos = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 55}

local _gifts_var_name = {}                                          --�����������

local _gifts_var = {}                                               --�������ֵ��

local cfg_info = {}

local _cfg = cfg_xiuxian

local _killMonNum_var_name = JiangHuMingWang._var_name_renwu.._target_types.killmon

local _takeonEquips_var_name = JiangHuMingWang._var_name_renwu.._target_types.takeonequip

local _cfg_goals = {}

for key, val in pairs(cfg_goals) do
    _cfg_goals[key] = {
        type = val.type,count = val.count,goInfo = val.goInfo,parentType = val.parentType,link = val.link,
    }
    if type(val.param) == "table" then
        _cfg_goals[key].param = {}
        for _, value in pairs(val.param[1]) do
            _cfg_goals[key].param[value] = 1
        end
        --LOGDump(_cfg_goals[key].param,"_cfg_goals[key].param")
    else
        _cfg_goals[key].param = val.param
    end
end

local _var_name_int = {                                             --����int���ͱ�������(��ʼ����)
    JiangHuMingWang._var_name_Lv,
    _killMonNum_var_name,
}

local _var_name_str = {                                             --����strint���ͱ�������(��ʼ����)
    JiangHuMingWang._var_info,
    _takeonEquips_var_name,
}

local JiangHuMingWang_Lv = 0                                        --��ɫ��ǰ�����׶�

for i,var in ipairs(_cfg) do
    table.insert(_gifts_var_name,JiangHuMingWang._var_name_gifts..i)
    table.insert(_gifts_var,0)
    table.insert(_var_name_int,_gifts_var_name[i])
end

local state = false
-- -------------------------------������ ���ط��� ������---------------------------------------
--�ж��Ƿ�������������
local function _checkTargetJHMW(targettype, actor, arg1)
    cfg_info = {}
    local temp = getplayvar(actor,JiangHuMingWang._var_info)
    if temp ~= "" and temp ~= nil then
        cfg_info = json2tbl(temp)
        if type(cfg_info) ~= "table" then
            cfg_info = {}
        end
    end

    JiangHuMingWang_Lv = getplayvar(actor, JiangHuMingWang._var_name_Lv)

    if type(JiangHuMingWang_Lv) ~= "number" then return end --���ڽ�ɫ�״ε�½������װ��ʱ��û�г�ʼ������,���Դ���ʱ�������ʹ���

    local cfg = _cfg[JiangHuMingWang_Lv + 1]
    if cfg then
        for i, v in ipairs(cfg.goal[1]) do
            if cfg_goals[v].type == targettype then

                if cfg_info[i] == 1 then return end --�����

                if targettype == _target_types.takeonequip then
                    -- LOGWrite("����װ���ж�,_itemOBJ:"..arg1)
                    --����װ���ж�
                    local _itemidx = getiteminfo(actor, arg1, ConstCfg.iteminfo.idx)

                    -- LOGWrite("����װ���ж�,_itemidx:".._itemidx)

                    local temp = getplayvar(actor, _takeonEquips_var_name)

                    -- LOGWrite("temp:"..temp..";")

                    local takeonequips = temp ~= "" and json2tbl(temp) or {}

                    --LOGDump(takeonequips,"takeonequips")

                    if type(takeonequips) ~= "table" then takeonequips = {} end

                    for _, itemobj in ipairs(takeonequips) do
                        if itemobj == arg1 then return end
                    end
                    if _cfg_goals[v].param[_itemidx] then
                        --LOGWrite("����װ���ж�2,_itemidx:".._itemidx)
                        table.insert(takeonequips,arg1)
                        FSetPlayVar(actor, _takeonEquips_var_name,tbl2json(takeonequips))
                        JiangHuMingWang.SyncResponse(actor)
                    end
                elseif targettype == _target_types.killmon then
                    --�����ɱ�ж�
                    if _cfg_goals[v].param[arg1] then
                        --LOGWrite("�����ɱ�ж�,monidx:"..arg1)
                        local killNum = getplayvar(actor, _killMonNum_var_name)
                        FSetPlayVar(actor,_killMonNum_var_name, killNum + 1)
                        --LOGWrite("�������,��ǰ��ɱ��:"..getplayvar(actor,_killMonNum_var_name))
                        JiangHuMingWang.SyncResponse(actor)
                    end
                elseif targettype == _target_types.zhuansheng then
                    --��ɫת���ж�
                    local count = getbaseinfo(actor, ConstCfg.gbase.renew_level)
                    if count >= _cfg_goals[v].count then
                        JiangHuMingWang.SyncResponse(actor)
                    end
                elseif targettype == _target_types.baowu then
                    --���������ж�
                    local count = 0
                    for j = 1, 4 do
                        count = count + getplayvar(actor,"NB_Baowu"..j)
                    end
                    --LOGWrite("��������ж�,count:"..count)
                    if count >= _cfg_goals[v].count then
                        JiangHuMingWang.SyncResponse(actor)
                    end
                elseif targettype == _target_types.shenshou then
                    --����֮���ж�
                    local varName = "C_QsQshenshouzhili"
                    local count = 0
                    for j = 1, 4 do
                        count = count + getplayvar(actor,varName..j)
                    end
                    if count >= _cfg_goals[v].count then
                        JiangHuMingWang.SyncResponse(actor)
                    end
                end
                return
            end
        end
    end
end

--������ɫ��ǰ�׶�����������
local function selectRoleVar(actor)
    cfg_info = {}

    JiangHuMingWang_Lv = getplayvar(actor, JiangHuMingWang._var_name_Lv)

    state = true

    local cfg = _cfg[JiangHuMingWang_Lv + 1]

    if cfg then
        local killNum = getplayvar(actor, _killMonNum_var_name)

        local takeonnum = 0

        local takeonequips = getplayvar(actor, _takeonEquips_var_name)
        if takeonequips ~= nil and takeonequips ~= "" then
            takeonequips = json2tbl(takeonequips)
            if type(takeonequips) == "table" then
                takeonnum = #takeonequips
            end
        end

        local zslevel = getbaseinfo(actor, ConstCfg.gbase.renew_level)

        for i,v in ipairs(cfg.goal[1]) do
            local goaltab = _cfg_goals[v]
            if goaltab then
                if goaltab.type == _target_types.takeonequip then
                    --LOGWrite("װ�������ж�2,����:"..goaltab.count..",��ǰ������:"..takeonnum..",�Ƿ���:"..tostring(takeonnum >= goaltab.count))
                    cfg_info[i] = takeonnum >= goaltab.count and 1 or 0
                    if state and takeonnum < goaltab.count then state = false end
                elseif goaltab.type == _target_types.killmon then
                    --LOGWrite("�����ɱ�ж�2,��Ҫ��ɱ:"..goaltab.count..",��ǰ��ɱ:"..killNum..",�Ƿ���:"..tostring(killNum >= goaltab.count))
                    cfg_info[i] = killNum >= goaltab.count and 1 or 0
                    if state and killNum < goaltab.count then state = false end
                elseif goaltab.type == _target_types.zhuansheng then
                    --LOGWrite("��ɫת���ж�2,��Ҫ��ɱ:"..goaltab.count..",��ǰ:"..zslevel.."ת,�Ƿ���:"..tostring(zslevel >= goaltab.count))
                    cfg_info[i] = zslevel >= goaltab.count and 1 or 0
                    if state and zslevel < goaltab.count then state = false end
                elseif goaltab.type == _target_types.shenshou then
                    local varName = "C_QsQshenshouzhili"
                    local lv = 0
                    for j = 1, 4 do
                        lv = lv + getplayvar(actor,varName..j)
                    end
                    --LOGWrite("����֮���ж�2,��Ҫ�ܵȼ�:"..goaltab.count..",��ǰ:"..lv.."��,�Ƿ���:"..tostring(lv >= goaltab.count))
                    cfg_info[i] = lv >= goaltab.count and 1 or 0
                    if state and lv < goaltab.count then state = false end
                elseif goaltab.type == _target_types.baowu then
                    local varName = "NB_Baowu"
                    local lv = 0
                    for j = 1, 4 do
                        lv = lv + getplayvar(actor,varName..j)
                    end
                    --LOGWrite("�����ʦ�ж�2,��Ҫ�ܵȼ�:"..goaltab.count.."��,��ǰ:"..lv.."��,�Ƿ���:"..tostring(lv >= goaltab.count))
                    cfg_info[i] = lv >= goaltab.count and 1 or 0
                    if state and lv < goaltab.count then state = false end
                end
            end
        end
    end

    return cfg_info,JiangHuMingWang_Lv,state
end
-- -------------------------------������ ������Ϣ ������---------------------------------------
--ͬ������
local _login_data = {ssrNetMsgCfg.JiangHuMingWang_SyncResponse, JiangHuMingWang_Lv,0,0,{cfg_info,_gifts_var}}
function JiangHuMingWang.SyncResponse(actor,logindatas)
    local last_state = false   --֮ǰ�Ƿ������������,����֮ǰ�������򵯴���ʾ
    local temp = getplayvar(actor,JiangHuMingWang._var_info)
    if temp ~= "" then
        temp = json2tbl(temp)
        if type(temp) == "table" then
            last_state = true
            for i, v in ipairs(temp) do
                if v == 0 then
                    last_state = false
                    break
                end
            end
        end
    end
    cfg_info,JiangHuMingWang_Lv,state = selectRoleVar(actor)
    if state and not last_state then
        --��ǰ�������,֮ǰ���������,������
        Message.sendmsg(actor, ssrNetMsgCfg.JiangHuMingWang_OpenGuideWnd, JiangHuMingWang_Lv + 1)
    end
    FSetPlayVar(actor, JiangHuMingWang._var_info, tbl2json(cfg_info))

    for i, v in ipairs(_gifts_var_name) do
        _gifts_var[i] = getplayvar(actor, v)
    end
    if logindatas then
        _login_data[2] = JiangHuMingWang_Lv
        _login_data[5][1] = cfg_info
        _login_data[5][2] = _gifts_var
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.JiangHuMingWang_UpgradeResponse, JiangHuMingWang_Lv,0,0,{cfg_info,_gifts_var})
    end
end

--������������
function JiangHuMingWang.RequestUpgrade(actor,test)
    cfg_info,JiangHuMingWang_Lv,state = selectRoleVar(actor)

    local cfg = _cfg[JiangHuMingWang_Lv + 1]
    if not cfg then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>��ǰ���޷�����������������!</font>","Type":9}')
        return
    end
    if not state then
        if test == 1 and ConstCfg.DEBUG then
            --gm����
        else
            sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>��ǰ����������������������!</font>","Type":9}')
            return
        end
    end

    FSetPlayVar(actor, JiangHuMingWang._var_name_Lv,JiangHuMingWang_Lv + 1)

    FSetPlayVar(actor, _killMonNum_var_name,0)

    FSetPlayVar(actor, _takeonEquips_var_name,"")

    FSetPlayVar(actor, JiangHuMingWang._var_info,"")

    local name = getbaseinfo(actor,1)

    _Fsendmail(name,cfg.mailId,cfg.prefix,cfg.name)

    sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#EEEE00\'>�����ѷ���,��ע���������!</font>","Type":9}')

    --ˢ������
    local cur_attr = cfg[JiangHuMingWang_Lv] and cfg[JiangHuMingWang_Lv].attribute or nil
    local next_attr = cfg[JiangHuMingWang_Lv + 1] and cfg[JiangHuMingWang_Lv + 1].attribute or nil

    Player.updateSomeAddr(actor, cur_attr, next_attr)

    for _, pos in ipairs(common_equip_pos) do
        local itemobj = linkbodyitem(actor,pos)
        if itemobj then
            _checkTargetJHMW(_target_types.takeonequip, actor, itemobj)
        end
    end
    JiangHuMingWang.SyncResponse(actor)
end

--���������ػ��������
function JiangHuMingWang.RequestBuyGifts(actor,page)
    if not _gifts_var_name[page] then return end

    local cfg = _cfg[page]

    JiangHuMingWang_Lv = getplayvar(actor, JiangHuMingWang._var_name_Lv)
    local isget = getplayvar(actor, _gifts_var_name[page])
    if JiangHuMingWang_Lv < page then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>���ȼ���������������!</font>","Type":9}')
        return
    end
    if isget == 1 then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>�޷��ظ��������!</font>","Type":9}')
        return
    end
    local moneyname = Item.getNameByIdx(ConstCfg.money.lf)
    if not Player.checkMoneyNum(actor, ConstCfg.money.lf,cfg.jiage) then
        sendmsg(actor, ConstCfg.notice.own, ssrResponseCfg.get(ssrResponseCfg.not_item, moneyname))
        return
    end
    --�ۻ���
    changemoney(actor,ConstCfg.money.lf, "-", cfg.jiage, "�ػ����", true)

    FSetPlayVar(actor, _gifts_var_name[page],1)
    local name = getbaseinfo(actor,1)
    _Fsendmail(name,cfg.mailId2,cfg.pet,cfg.name)
    sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#EEEE00\'>����ѷ���,��ע���������!</font>","Type":9}')
    Message.sendmsg(actor, ssrNetMsgCfg.JiangHuMingWang_BuyGiftsResponse, page,1)
end

--�Զ�Ѱ·Ѱ��NPC
function JiangHuMingWang.RequestFindNpc(actor,page)
    JiangHuMingWang_Lv = getplayvar(actor, JiangHuMingWang._var_name_Lv) + 1
    if not _cfg[JiangHuMingWang_Lv] then return end
    if not _cfg[JiangHuMingWang_Lv].Hyperlink2 then return end
    if not _cfg[JiangHuMingWang_Lv].Hyperlink2[page] then return end
    FOpenNpcShowEx(actor, _cfg[JiangHuMingWang_Lv].Hyperlink2[page])
end
-- ----------------------------������ �ⲿ���� ������---------------------------------------
function JiangHuMingWang.GmLevelAdd(actor)
    if ConstCfg.DEBUG then
        JiangHuMingWang.RequestUpgrade(actor,1)
    end
end

function JiangHuMingWang.GmLevelClear(actor)
    if ConstCfg.DEBUG then
        FSetPlayVar(actor, JiangHuMingWang._var_name_Lv,0)

        FSetPlayVar(actor, _killMonNum_var_name,0)

        FSetPlayVar(actor, _takeonEquips_var_name,"")

        FSetPlayVar(actor, JiangHuMingWang._var_info,"")

        FSetPlayVar(actor, _gifts_var_name, 0)

        for _, pos in ipairs(common_equip_pos) do
            local itemobj = linkbodyitem(actor,pos)
            if itemobj then
                _checkTargetJHMW(_target_types.takeonequip, actor, itemobj)
            end
        end
    end
end

function JiangHuMingWang.GmRw(actor)
    if ConstCfg.DEBUG then
        FSetPlayVar(actor,_killMonNum_var_name, 9999)
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#EEEE00\'>��ֵ�ɹ�,��Ctrl+Tab����!</font>","Type":9}')
    end
end
-- ----------------------------������ ��Ϸ�¼� ������---------------------------------------
--��ʼ�����˱���
local function _goPlayerVar(actor)
    FIniPlayVar(actor, _var_name_int)
    FIniPlayVar(actor, _var_name_str,true)
end
GameEvent.add(EventCfg.goPlayerVar, _goPlayerVar, JiangHuMingWang)

--��½����
local function _onLoginEnd(actor,logindatas)
    for _, pos in ipairs(common_equip_pos) do
        local itemobj = linkbodyitem(actor,pos)
        if itemobj then
            _checkTargetJHMW(_target_types.takeonequip, actor, itemobj,"6")
        end
    end

    JiangHuMingWang.SyncResponse(actor, logindatas)
end
GameEvent.add(EventCfg.onLoginEnd, _onLoginEnd, JiangHuMingWang)

--��½��ȡ��������
GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    for i = 1,#_cfg do
        JiangHuMingWang_Lv = getplayvar(actor, JiangHuMingWang._var_name_Lv)
        if _cfg[JiangHuMingWang_Lv] then
            table.insert(loginattrs, _cfg[JiangHuMingWang_Lv].attribute)
        end
    end
end, JiangHuMingWang)

GameEvent.add(EventCfg.onTakeOnEx, function (actor, itemobj) _checkTargetJHMW(_target_types.takeonequip, actor, itemobj) end, JiangHuMingWang)
GameEvent.add(EventCfg.onKillMon, function (actor, monobj, monidx) _checkTargetJHMW(_target_types.killmon, actor, monidx) end, JiangHuMingWang)
GameEvent.add(EventCfg.goZSLevelChange, function (actor) _checkTargetJHMW(_target_types.zhuansheng, actor) end, JiangHuMingWang)
GameEvent.add(EventCfg.goShenShou, function (actor) _checkTargetJHMW(_target_types.shenshou, actor) end, JiangHuMingWang)
GameEvent.add(EventCfg.goBaoWu, function (actor) _checkTargetJHMW(_target_types.baowu, actor) end, JiangHuMingWang)

Message.RegisterNetMsg(ssrNetMsgCfg.JiangHuMingWang, JiangHuMingWang)

return JiangHuMingWang