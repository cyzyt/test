ShouChong = {}
ShouChong.ID = 30100

local _var_name = VarCfg.C_QsQshouchong     --�׳�����ʱ�������

local _var_name_getInfo = {}                --�׳���ȡ���

local cfg = cfg_shouchong

for i, v in ipairs(cfg) do
    table.insert(_var_name_getInfo,"C_QsQgetInfo_"..i)
end

local _receive_state = {
    nosatisfy = 0,      --δ��ʱ��/������ȡ
    notreceive = 1,     --δ��ȡ
    received = 2,       --����ȡ
}

local _sync_data_memory = {                                 --���ȷ���ͬ���ڴ�����{{��ȡ���}}
    0,0,0,
}
--�Ƿ�չʾ���(0��չʾ/1չʾ)
local redPonit = 0
--icon�Ƿ�չʾ(0��δ����/1��ȫ����ȡ)
local iconIsShow = 0


-------------------------------������ ������Ϣ ������---------------------------------------
--ͬ������
local _login_data = {ssrNetMsgCfg.ShouChong_SyncResponse, redPonit,iconIsShow,0,_sync_data_memory}
function ShouChong.SyncResponse(actor, logindatas)
    redPonit = 0
    iconIsShow = 1
    for i, var in ipairs(cfg) do
        _sync_data_memory[i] = getplayvar(actor, _var_name_getInfo[i])
        if _sync_data_memory[i] ~= _receive_state.received then
            iconIsShow = 0
        end
        if _sync_data_memory[i] == _receive_state.notreceive then
            redPonit = 1
        end
    end

    if logindatas then
        _login_data[2] = redPonit
        _login_data[3] = iconIsShow
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.ShouChong_SyncResponse, redPonit,iconIsShow,0,_sync_data_memory)
    end
end

function ShouChong.LQRequestZS(actor,idx)
    if not cfg[idx] then return end
    local varname = _var_name_getInfo[idx]
    if getplayvar(actor, varname) == _receive_state.received then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>��������ȡ!</font>","Type":9}')
        return
    end

    Player.giveItemByTable(actor, cfg[idx]["reward"], "�׳佱��")
    FSetPlayVar(actor,varname,_receive_state.received)
    ShouChong.SyncResponse(actor)
end

Message.RegisterNetMsg(ssrNetMsgCfg.ShouChong,ShouChong)  --ע��

-- ----------------------------������ ��Ϸ�¼� ������---------------------------------------
--��������
local function _playerVar(actor)
    FIniPlayVar(actor, {VarCfg.C_QsQshouchong,VarCfg.C_QsQfirstdeath})
    FIniPlayVar(actor, _var_name_getInfo)
end

--��ֵ�ɹ�ʱ
local function _playerrecharge(actor)--��ֵ
    local int = getplayvar(actor, _var_name)
    if int == ConstCfg.flag.no then
        FSetPlayVar(actor,_var_name,os.time())
    end
    ShouChong.SyncResponse(actor)    --��ֵ��������ͼ��
end
GameEvent.add(EventCfg.onRecharge,  _playerrecharge, ShouChong)  --��ֵ

--��¼���
GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas)
    ShouChong.SyncResponse(actor, logindatas)
end, ShouChong)
GameEvent.add(EventCfg.goPlayerVar, _playerVar, ShouChong)

return ShouChong