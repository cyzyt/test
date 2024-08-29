SevenDaySignin = {}
SevenDaySignin.ID = 22700

local _cfg                      = cfg_qiandao

local _sync_data_memory = {}                                --��λ��ȡ���

local _var_create_day = "NB_SevenDay_createDay"             --��������

local _var_login_day = "NB_SevenDay_loginDay"               --�ۼƵ�¼����

local _var_name = "NB_SevenDay_giftsGet_"                   --��λ��ȡ������ǰ׺

local _var_gift_use_num = VarCfg.NB_QD_useNum               --�����ÿ��ʹ������

local _var_name_Tab = {}

local _state = {
    no_receive      = 0,        --������ȡ
    can_receive     = 1,        --������ȡ
    has_receive     = 2,        --����ȡ
}

for i = 1, #_cfg do
    _sync_data_memory[i] = _state.no_receive
    _var_name_Tab[i] = _var_name..i
end
-- ----------------------------������ ���ط��� ������---------------------------------------
--��ȡ�ۼƵ�¼����
local function _getLoginDay(actor)
    local createActorDay = Player.getCreateActorDay(actor)
    local create_day = getplayvar(actor, _var_create_day)
    local login_day = getplayvar(actor, _var_login_day)
    if create_day < createActorDay then
        FSetPlayVar(actor, _var_create_day, createActorDay)
        login_day = login_day + 1
        FSetPlayVar(actor, _var_login_day, login_day)
    end
    return login_day
end
-- ----------------------------������ ������Ϣ ������---------------------------------------
--ͬ����Ϣ
local _login_data = {ssrNetMsgCfg.SevenDaySignin_SyncResponse, 0, 0, 0,_sync_data_memory}
function SevenDaySignin.SyncResponse(actor, logindatas)
    local loginDay = _getLoginDay(actor)
    if loginDay >= 7 then
        loginDay = 7
    end
    for i = 1, #_cfg do
        _sync_data_memory[i] = getplayvar(actor, _var_name_Tab[i])

        if loginDay >= i and _sync_data_memory[i] == _state.no_receive then
            _sync_data_memory[i] = _state.can_receive
            FSetPlayVar(actor, _var_name_Tab[i], _state.can_receive)
        elseif loginDay < i and _sync_data_memory[i] ~= _state.no_receive then
            _sync_data_memory[i] = _state.no_receive
            FSetPlayVar(actor, _var_name_Tab[i], _state.no_receive)
        end
    end
    if logindatas then
        _login_data[2] = loginDay
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.SevenDaySignin_SyncResponse, loginDay,0,0,_sync_data_memory)
    end
end

--��ȡ��½����
function SevenDaySignin.RequestCurReceiveGet(actor, idx)
    local cfg = _cfg[idx]
    if not cfg then return end
    local state = getplayvar(actor,_var_name_Tab[idx])
    if state ~= _state.can_receive then return end
    if not Bag.checkBagEmptyNum(actor, #cfg.pet) then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>�����ռ䲻��!</font>","Type":9}')
        return
    end
    Player.giveItemByTable(actor, cfg.pet, "���յ�½")
    FSetPlayVar(actor, _var_name_Tab[idx], _state.has_receive)
    SevenDaySignin.SyncResponse(actor)
end

Message.RegisterNetMsg(ssrNetMsgCfg.SevenDaySignin, SevenDaySignin)
-------------------------------������ ��Ϸ�¼� ������---------------------------------------
--��ʼ�����˱���
local function _goPlayerVar(actor)
    FIniPlayVar(actor, _var_name_Tab)
    FIniPlayVar(actor, {_var_login_day,_var_create_day,_var_gift_use_num})
end
GameEvent.add(EventCfg.goPlayerVar, _goPlayerVar, SevenDaySignin)

--ÿ���賿 �� ÿ�յ�һ�ε�¼ ����
local function _goDailyUpdate(actor)
    FSetPlayVar(actor, _var_gift_use_num, 0)
    SevenDaySignin.SyncResponse(actor)
end
GameEvent.add(EventCfg.goDailyUpdate, _goDailyUpdate, SevenDaySignin)

--��¼���
local function _onLoginEnd(actor, logindatas)
    SevenDaySignin.SyncResponse(actor, logindatas)
end
GameEvent.add(EventCfg.onLoginEnd, _onLoginEnd, SevenDaySignin)

--��Ʒ������
local gift_item_idx = 20000
local function _onAddBag(actor,itemobj)
    local idx = getiteminfo(actor, itemobj, ConstCfg.iteminfo.idx)
    if gift_item_idx ~= idx then return end
    local itemflag = getitemaddvalue(actor, itemobj, 2, 18)
    if itemflag ~= 0 then return end
    setitemaddvalue(actor, itemobj, 2, 18, os.time() + 60*60)
end
GameEvent.add(EventCfg.onAddBag, _onAddBag, SevenDaySignin)
-- -------------------------------������ �Զ���������ƻ ������---------------------------------------
--���ñ���
function SevenDaySignin.GmCmd1(actor)
    FSetPlayVar(actor, _var_create_day, 0)
    FSetPlayVar(actor, _var_login_day, 0)
    FSetPlayVar(actor, _var_name_Tab, 0)

    SevenDaySignin.SyncResponse(actor)
end

--ǩ��+1
function SevenDaySignin.GmCmd2(actor)
    FSetPlayVar(actor, _var_create_day, getplayvar(actor, _var_create_day) - 1)
    SevenDaySignin.SyncResponse(actor)
end

return SevenDaySignin