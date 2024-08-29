Die = {}

local _cfg = cfg_Fuhuo

local _timer_id         = 20001                 --�����ʱ��ʱ��

local _varflag_fuhuo = 202          --����ǰ�������,�����ж��Ƿ񴥷������ָ

local _var_pro_die      = "NB_die_time"         --����ǰ������ʱ��,�����ж��Ƿ񴥷������ָ

--��ָλ��
local ring_where = {
    ConstCfg.stdmodewheremap[22][1],
    ConstCfg.stdmodewheremap[22][2]
}


local _open_type = {
    default     = 0,
    dld         = 1,                --���Ҷ�
    yiyu        = 2,                --�����ս
}

local _timer_state = {
    nothas = 0,         --���ڸ��ʱ��
    has = 1,            --�����ڸ��ʱ��
}

local revive_type = {
    FREE = 0,               --��Ѹ���
    PAY = 1,                --�շѸ���
}

-------------------------------������ �߼����� ������---------------------------------------
local function ishasFuhuo(actor)
    local bool = false
    for i, v in ipairs(ring_where) do
        local equipobj = linkbodyitem(actor, v)
        if equipobj ~= "0" then
            local idx = getiteminfo(actor, equipobj, ConstCfg.iteminfo.idx)
            local shape = getstditeminfo(idx, ConstCfg.stditeminfo.shape)
            if shape == 114 then
                bool = true
                break
            end
        end
    end
    if bool then
        setontimer(actor, _timer_id, 1, 0)
        setflagstatus(actor, _varflag_fuhuo,_timer_state.has)
        Message.sendmsg(actor, ssrNetMsgCfg.Die_updateDieInfo,0)
    else
        setofftimer(actor, _timer_id)
        setflagstatus(actor, _varflag_fuhuo,_timer_state.nothas)
        Message.sendmsg(actor, ssrNetMsgCfg.Die_updateDieInfo,-1)
    end
    return bool
end
-------------------------------������ ������Ϣ ������---------------------------------------
--����ǰ����
function Die.setFlag(actor)
    if getflagstatus(actor, _varflag_fuhuo) == _timer_state.has then
        local now = os.time()
        local next_time = now + getbaseinfo(actor,44)

        local timer = getplayvar(actor, _var_pro_die) or 0

        if now > timer then
            FSetPlayVar(actor, _var_pro_die, next_time)
            return true
        end
    end
end

--�򿪽���(������������)
function Die.OpenUI(actor, hiter)
    local _mapID = getbaseinfo(actor, ConstCfg.gbase.mapid)
    local opentype = _open_type[_mapID] or _open_type.default
    local hitername = getbaseinfo(hiter, ConstCfg.gbase.name)           --��ȡ��ɱ������
    --����
    Message.sendmsg(actor, ssrNetMsgCfg.Die_OpenUI, opentype,0,0,{hitername, 0,_mapID})
end

--���󸴻�
function Die.RequestRevive(actor,opentype,_type)
    --�жϵ�ǰ�Ƿ�����״̬
    if not getbaseinfo(actor, ConstCfg.gbase.isdie) then return end

    if not opentype then
        opentype = _open_type._mapID or _open_type.default
    end

    _type = _type or revive_type.FREE

    if opentype == _open_type.default then
        if _type == revive_type.FREE then
            --�سǸ���
            FBackZone(actor)
            realive(actor)
        elseif _type == revive_type.PAY then
            local name,num = Player.checkItemNumByTable(actor, _cfg[1].Pay)
            if name then
                sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>�������!</font>","Type":9}')
            else
                Player.takeItemByTable(actor, _cfg[1].Pay)
                realive(actor)
            end
        end
    elseif opentype == _open_type.dld then     --�ٶ�֮ս
        GameEvent.push(EventCfg.goGdzzRevive, actor, revivetype)
        Playdld.revive(actor)
    elseif opentype == _open_type.yiyu then     --�����ս
        Playyydz.revive(actor)
    end
-------------------------------��������-------------------------------------------
    local int1 = getplayvar(actor, "C_QsQshouchong") --�׳���
    local int2 = getplayvar(actor, "C_QsQfirstdeath") --�������

    if int1 == 0 then
        if int2 == 0 then
            Message.sendmsg(actor, ssrNetMsgCfg.ShouChong_FirstDeath)
            setplayvar(actor, "HUMAN","C_QsQfirstdeath",1,1)
        end
    end
------------------------------------------------------------------------

    --�ظ�
    -- Message.sendmsg(actor, ssrNetMsgCfg.Die_ReviveResponse)
end
-------------------------------������ �ⲿ���� ������---------------------------------------
function Die.countdown(actor)
    local timer = getplayvar(actor, _var_pro_die) or 0
    if timer ~= 0 then
        local down_time = 0
        local now = os.time()
        if now >= timer then
            FSetPlayVar(actor, _var_pro_die, 0)
        else
            down_time = timer - now
            msg = timer - now .."������"
        end
        Message.sendmsg(actor, ssrNetMsgCfg.Die_updateDieInfo,down_time)
    end
end
-- ----------------------------������ �����¼� ������---------------------------------------
--��½����
local function _onLogin(actor)
    FIniPlayVar(actor, {_var_pro_die})
    ishasFuhuo(actor)
end
GameEvent.add(EventCfg.onLogin, _onLogin, Die)

--��װ��
function _onTakeOnEx(actor, itemobj, where, itemname, makeid)
    ishasFuhuo(actor)
end
GameEvent.add(EventCfg.onTakeOnEx, _onTakeOnEx, Die)

function _onTakeOffEx(actor, itemobj, where, itemname, makeid)
    ishasFuhuo(actor)
end
GameEvent.add(EventCfg.onTakeOffEx, _onTakeOffEx, Die)

Message.RegisterNetMsg(ssrNetMsgCfg.Die, Die)

return Die