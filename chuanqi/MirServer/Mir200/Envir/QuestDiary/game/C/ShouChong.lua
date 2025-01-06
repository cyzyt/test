ShouChong = {}
ShouChong.ID = 30100

local _var_name = VarCfg.C_QsQshouchong     --首充满足时间变量名

local _var_name_getInfo = {}                --首充领取情况

local cfg = cfg_shouchong

for i, v in ipairs(cfg) do
    table.insert(_var_name_getInfo,"C_QsQgetInfo_"..i)
end

local _receive_state = {
    nosatisfy = 0,      --未到时间/不可领取
    notreceive = 1,     --未领取
    received = 2,       --已领取
}

local _sync_data_memory = {                                 --优先分配同步内存数据{{领取情况}}
    0,0,0,
}
--是否展示红点(0不展示/1展示)
local redPonit = 0
--icon是否展示(0还未领完/1已全部领取)
local iconIsShow = 0


-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步数据
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
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>奖励已领取!</font>","Type":9}')
        return
    end

    Player.giveItemByTable(actor, cfg[idx]["reward"], "首充奖励")
    FSetPlayVar(actor,varname,_receive_state.received)
    ShouChong.SyncResponse(actor)
end

Message.RegisterNetMsg(ssrNetMsgCfg.ShouChong,ShouChong)  --注册

-- ----------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------
--声明变量
local function _playerVar(actor)
    FIniPlayVar(actor, {VarCfg.C_QsQshouchong,VarCfg.C_QsQfirstdeath})
    FIniPlayVar(actor, _var_name_getInfo)
end

--充值成功时
local function _playerrecharge(actor)--充值
    local int = getplayvar(actor, _var_name)
    if int == ConstCfg.flag.no then
        FSetPlayVar(actor,_var_name,os.time())
    end
    ShouChong.SyncResponse(actor)    --充值过后隐藏图标
end
GameEvent.add(EventCfg.onRecharge,  _playerrecharge, ShouChong)  --充值

--登录完成
GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas)
    ShouChong.SyncResponse(actor, logindatas)
end, ShouChong)
GameEvent.add(EventCfg.goPlayerVar, _playerVar, ShouChong)

return ShouChong