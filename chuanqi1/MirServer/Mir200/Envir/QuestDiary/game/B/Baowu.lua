Baowu = {}
Baowu.ID = 20500

local _cfg = {}

for k,v in ipairs(cfg_baowu) do
    _cfg[v.type] = _cfg[v.type] or {title = v.name1}
    _cfg[v.type][v.level] = _cfg[v.type][v.level] or {}
    _cfg[v.type][v.level] = {cost=v.cost,attribute=v.attribute}
end

Baowu._var_name = "NB_Baowu"     --����ǰ׺

local _var_name_tab = {}                --��������

local _var_lv_tab = {}                  --����ֵ��

local _npcid = 246

local ratio = 10000 --��ֱ�

for i = 1,#_cfg do
    table.insert(_var_name_tab,Baowu._var_name..i)
    table.insert(_var_lv_tab,0)
end

--ͬ������
local _login_data = {ssrNetMsgCfg.Baowu_SyncResponse, 0,0,0,_var_lv_tab}
function Baowu.SyncResponse(actor,logindatas)
    for i = 1 ,#_var_name_tab do
        _var_lv_tab[i] = getplayvar(actor, _var_name_tab[i])
    end
    if logindatas then
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.Baowu_SyncResponse, 0,0,0,_var_lv_tab)
    end
end

--�������
function Baowu.RequestUp(actor, idx)
    --���npc����
    --if not FCheckNPCRange(actor, _npcid) then return end
    idx = tonumber(idx)
    local cfg = _cfg[idx]
    if not cfg then return end
    local lv = getplayvar(actor, _var_name_tab[idx])
    local next_lv = lv + 1
    if not cfg[next_lv] then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>���޷���������!</font>","Type":9}')
        Message.sendmsg(actor, ssrNetMsgCfg.Baowu_UpResponse, idx, lv)
        return
    end
    --�ж�����
    local name,num = Player.checkItemNumByTable(actor, cfg[next_lv].cost)
    if name then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>���ϲ���!</font>","Type":9}')
        Message.sendmsg(actor, ssrNetMsgCfg.Baowu_UpResponse, idx, lv)
        return
    end
    --������
    Player.takeItemByTable(actor, cfg[next_lv].cost)

    --д���ݿ�
    setplayvar(actor, "HUMAN",_var_name_tab[idx], next_lv,1)
    sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#FFFF00\'>�����ɹ�!</font>","Type":9}')
    Message.sendmsg(actor, ssrNetMsgCfg.Baowu_UpResponse, idx, next_lv)
    --ˢ������
    local cur_attr = cfg[lv] and cfg[lv].attribute or nil
    local next_attr = cfg[next_lv] and cfg[next_lv].attribute or nil

    Player.updateSomeAddr(actor, cur_attr, next_attr)

    GameEvent.push(EventCfg.goBaoWu, actor)
end

-- ----------------------------������ ��Ϸ�¼� ������---------------------------------------

--��ʼ�����˱���
local function _goPlayerVar(actor)
    local temp = {}
    for i ,var in ipairs(_var_name_tab) do
        table.insert(temp,var)
    end
    temp = table.concat(temp, "|")
    FIniPlayVar(actor, temp)
end
GameEvent.add(EventCfg.goPlayerVar, _goPlayerVar, Baowu)

--��½����
local function _onLoginEnd(actor,logindatas)
    Baowu.SyncResponse(actor, logindatas)
end
GameEvent.add(EventCfg.onLoginEnd, _onLoginEnd, Baowu)

--��½��ȡ��������
GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    local level = 0
    for i = 1,#_cfg do
        level = getplayvar(actor, _var_name_tab[i])
        if _cfg[i][level] then
            table.insert(loginattrs, _cfg[i][level].attribute)
        end
    end
end, Baowu)

Message.RegisterNetMsg(ssrNetMsgCfg.Baowu, Baowu)

return Baowu