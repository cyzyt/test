Playyydz = {}

Playyydz.ID = 20800

local _activityid = 2                                   --活动副本id

local _taskid = 5                                       --任务栏展示id

local _timerid = 21                                     --全局定时器id

local _shichang = cfg_duplicate[_activityid].totalTime      --活动时长

local _mapId = cfg_duplicate[_activityid].mapId         --活动地图

local _varg_starttime       = "G200"                    --活动开始时间戳
local _varg_endtime         = "G201"                    --活动结束时间戳

-------------------------------↓↓↓ 本地方法 ↓↓↓---------------------------------------
--活动是否结束
local function _isEnded()
    local curtime = os.time()
    local endtime = getsysvar(_varg_endtime)
    if endtime == 0 then return true end
    return curtime > endtime
end

--是否不在活动地图
local function _isNotInMap(actor)
    local cur_mapId = getbaseinfo(actor, ConstCfg.gbase.mapid)
    return cur_mapId ~= _mapId
end
-------------------------------↓↓↓ 逻辑处理 ↓↓↓---------------------------------------
--活动开启
function Playyydz.open()
    local endtime = os.time() + _shichang
    setsysvar(_varg_endtime, endtime)
    setsysvar(_varg_starttime, os.time())
    setontimerex(_timerid, 1)

    local now = os.time()
    --公告
    local isSendNotice = false
    for i,v in ipairs(cfg_gameactive) do
        if v.id == _activityid then
            if v.Begin and cfg_announce[v.Begin] then
                isSendNotice = v.Begin
            end

            --红点
            local BTime = string.split(v.BTime,"$")
            local OTime = string.split(v.OTime,"$")
            if now >= getTodayTimeStamp(BTime[1],BTime[2],0) and now <= getTodayTimeStamp(OTime[1],OTime[2],0) then
                GameEvent.push(EventCfg.goActivityState,i,ConstCfg.activitystate.opening)
                break
            end
        end
    end
    if isSendNotice then
        --FSendNotice(nil, isSendNotice)
        local _msg = cfg_announce[isSendNotice].Announce
        sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"30"}')
        sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"60"}')
        sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"90"}')
    end
end

--任务栏展示信息每秒刷新(倒计时/名次/积分)
local function _changetask(actor)
    if _isEnded() then newdeletetask(actor,_taskid) return end
    local down_time = getsysvar(_varg_endtime) - os.time()
    local down_time_str = ssrSecToHMS(down_time)
    newchangetask(actor,_taskid,down_time_str)
end

--活动倒计时
function Playyydz.countdown()
    --修改活动倒计时
    local curtime = os.time()
    local starttime = getsysvar(_varg_starttime)
    local endtime = getsysvar(_varg_endtime)
    --活动结束
    if curtime >= endtime then
        Playyydz.close()
        return
    else
        local _time = curtime - starttime
        --刷新地图内玩家的任务栏
        local map_actors = getobjectinmap(_mapId, 0, 0, 1000, 1)
        if map_actors then
            for _,actor in ipairs(map_actors) do
                _changetask(actor)
            end
        end
    end
end

--活动结束
function Playyydz.close()
    setofftimerex(_timerid)             --关闭活动定时器
    setsysvar(_varg_endtime, 0)         --清理活动结束时间

    --地图内玩家回城
    local map_actors = getobjectinmap(_mapId, 0, 0, 1000, 1)
    if map_actors then
        for _,actor in ipairs(map_actors) do
            if getbaseinfo(actor, ConstCfg.gbase.isdie) then
                realive(actor)              --复活
            end
            FBackZone(actor)
        end 
    end

    --公告
    for i,v in ipairs(cfg_gameactive) do
        if v.id == _activityid then
            if v.End and cfg_announce[v.End] then
                --FSendNotice(nil, v.End)
                local _msg = cfg_announce[v.End].Announce
                sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"30"}')
                sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"60"}')
                sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"90"}')
                break
            end
        end
    end
end

-------------------------------↓↓↓ 外部调用 ↓↓↓---------------------------------------
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--进入
function Playyydz.RequestEnter(actor)
    --活动未开启
    if _isEnded() then
        sendmsg(actor, ConstCfg.notice.own, ssrResponseCfg.get(ssrResponseCfg.not_open_activity))
        return 
    end

    if not _isNotInMap(actor) then return end
    
    --回复
    local endtime = getsysvar(_varg_endtime)

    FMapMove(actor, _mapId)

    Message.sendmsg(actor, ssrNetMsgCfg.Playggzj_EnterResponse, endtime)
end

--离开
function Playyydz.RequestExit(actor)
    --在地图中回城
    if _isNotInMap(actor) then return end
    FBackZone(actor)
    Message.sendmsg(actor, ssrNetMsgCfg.Playggzj_ExitResponse)
end

--请求回城
function Playyydz.RequestBack(actor)
    if _isNotInMap(actor) then return end
    FBackZone(actor)
end

Message.RegisterNetMsg(ssrNetMsgCfg.Playyydz, Playyydz)
-------------------------------↓↓↓ 外部调用 ↓↓↓---------------------------------------
--请求复活
function Playyydz.revive(actor)
    if _isNotInMap(actor) then return end
    map(actor,_mapId)
    realive(actor)
end
-- ----------------------------↓↓↓ 引擎事件 ↓↓↓---------------------------------------

-- ----------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------
--退出游戏
local function _onExitGame(actor)
    if _isNotInMap(actor) then return end
    FBackZone(actor)
end
GameEvent.add(EventCfg.onExitGame, _onExitGame, Playyydz)

--进入/切换地图
local function _goSwitchMap(actor,cur_mapid, former_mapid)
    if cur_mapid == _mapId then
        GameEvent.push(EventCfg.goActivityMap, actor)
        Message.sendmsg(actor, ssrNetMsgCfg.ActivitySystem_CreatRankBtn)
    end
    if former_mapid == _mapId then
        newdeletetask(actor,_taskid)
        GameEvent.push(EventCfg.goBackMap, actor)
        Message.sendmsg(actor, ssrNetMsgCfg.ActivitySystem_DeletRankBtn)
    end
end
GameEvent.add(EventCfg.goSwitchMap, _goSwitchMap, Playyydz)
-- -------------------------------↓↓↓ 自定义命令控制活动 ↓↓↓---------------------------------------
function Playyydz.custom_open(actor)
    if not _isEnded() then
        sendmsg(actor, ConstCfg.notice.own, ssrResponseCfg.get(ssrResponseCfg.usercmdinfo1))
        return
    end
    Playyydz.open()
end

function Playyydz.custom_close(actor)
    if _isEnded() then
        sendmsg(actor, ConstCfg.notice.own, ssrResponseCfg.get(ssrResponseCfg.usercmdinfo2))
        return
    end
    Playyydz.close()
end

return Playyydz