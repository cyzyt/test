Die = {}

local _cfg = cfg_Fuhuo

local _timer_id         = 20001                 --复活计时定时器

local _varflag_fuhuo = 202          --死亡前触发标记,用于判断是否触发复活戒指

local _var_pro_die      = "NB_die_time"         --死亡前触发的时间,用于判断是否触发复活戒指

--戒指位置
local ring_where = {
    ConstCfg.stdmodewheremap[22][1],
    ConstCfg.stdmodewheremap[22][2]
}


local _open_type = {
    default     = 0,
    dld         = 1,                --大乱斗
    yiyu        = 2,                --异域大战
}

local _timer_state = {
    nothas = 0,         --存在复活定时器
    has = 1,            --不存在复活定时器
}

local revive_type = {
    FREE = 0,               --免费复活
    PAY = 1,                --收费复活
}

-------------------------------↓↓↓ 逻辑处理 ↓↓↓---------------------------------------
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
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--死亡前触发
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

--打开界面(死亡触发调用)
function Die.OpenUI(actor, hiter)
    local _mapID = getbaseinfo(actor, ConstCfg.gbase.mapid)
    local opentype = _open_type[_mapID] or _open_type.default
    local hitername = getbaseinfo(hiter, ConstCfg.gbase.name)           --获取击杀者名字
    --发送
    Message.sendmsg(actor, ssrNetMsgCfg.Die_OpenUI, opentype,0,0,{hitername, 0,_mapID})
end

--请求复活
function Die.RequestRevive(actor,opentype,_type)
    --判断当前是否死亡状态
    if not getbaseinfo(actor, ConstCfg.gbase.isdie) then return end

    if not opentype then
        opentype = _open_type._mapID or _open_type.default
    end

    _type = _type or revive_type.FREE

    if opentype == _open_type.default then
        if _type == revive_type.FREE then
            --回城复活
            FBackZone(actor)
            realive(actor)
        elseif _type == revive_type.PAY then
            local name,num = Player.checkItemNumByTable(actor, _cfg[1].Pay)
            if name then
                sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>灵符不足!</font>","Type":9}')
            else
                Player.takeItemByTable(actor, _cfg[1].Pay)
                realive(actor)
            end
        end
    elseif opentype == _open_type.dld then     --官渡之战
        GameEvent.push(EventCfg.goGdzzRevive, actor, revivetype)
        Playdld.revive(actor)
    elseif opentype == _open_type.yiyu then     --异域大战
        Playyydz.revive(actor)
    end
-------------------------------引导消费-------------------------------------------
    local int1 = getplayvar(actor, "C_QsQshouchong") --首充标记
    local int2 = getplayvar(actor, "C_QsQfirstdeath") --死亡标记

    if int1 == 0 then
        if int2 == 0 then
            Message.sendmsg(actor, ssrNetMsgCfg.ShouChong_FirstDeath)
            setplayvar(actor, "HUMAN","C_QsQfirstdeath",1,1)
        end
    end
------------------------------------------------------------------------

    --回复
    -- Message.sendmsg(actor, ssrNetMsgCfg.Die_ReviveResponse)
end
-------------------------------↓↓↓ 外部调用 ↓↓↓---------------------------------------
function Die.countdown(actor)
    local timer = getplayvar(actor, _var_pro_die) or 0
    if timer ~= 0 then
        local down_time = 0
        local now = os.time()
        if now >= timer then
            FSetPlayVar(actor, _var_pro_die, 0)
        else
            down_time = timer - now
            msg = timer - now .."秒后可用"
        end
        Message.sendmsg(actor, ssrNetMsgCfg.Die_updateDieInfo,down_time)
    end
end
-- ----------------------------↓↓↓ 引擎事件 ↓↓↓---------------------------------------
--登陆触发
local function _onLogin(actor)
    FIniPlayVar(actor, {_var_pro_die})
    ishasFuhuo(actor)
end
GameEvent.add(EventCfg.onLogin, _onLogin, Die)

--穿装备
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