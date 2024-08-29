Playyydz = {}

Playyydz.ID = 20800

local _activityid = 2                                   --�����id

local _taskid = 5                                       --������չʾid

local _timerid = 21                                     --ȫ�ֶ�ʱ��id

local _shichang = cfg_duplicate[_activityid].totalTime      --�ʱ��

local _mapId = cfg_duplicate[_activityid].mapId         --���ͼ

local _varg_starttime       = "G200"                    --���ʼʱ���
local _varg_endtime         = "G201"                    --�����ʱ���

-------------------------------������ ���ط��� ������---------------------------------------
--��Ƿ����
local function _isEnded()
    local curtime = os.time()
    local endtime = getsysvar(_varg_endtime)
    if endtime == 0 then return true end
    return curtime > endtime
end

--�Ƿ��ڻ��ͼ
local function _isNotInMap(actor)
    local cur_mapId = getbaseinfo(actor, ConstCfg.gbase.mapid)
    return cur_mapId ~= _mapId
end
-------------------------------������ �߼����� ������---------------------------------------
--�����
function Playyydz.open()
    local endtime = os.time() + _shichang
    setsysvar(_varg_endtime, endtime)
    setsysvar(_varg_starttime, os.time())
    setontimerex(_timerid, 1)

    local now = os.time()
    --����
    local isSendNotice = false
    for i,v in ipairs(cfg_gameactive) do
        if v.id == _activityid then
            if v.Begin and cfg_announce[v.Begin] then
                isSendNotice = v.Begin
            end

            --���
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

--������չʾ��Ϣÿ��ˢ��(����ʱ/����/����)
local function _changetask(actor)
    if _isEnded() then newdeletetask(actor,_taskid) return end
    local down_time = getsysvar(_varg_endtime) - os.time()
    local down_time_str = ssrSecToHMS(down_time)
    newchangetask(actor,_taskid,down_time_str)
end

--�����ʱ
function Playyydz.countdown()
    --�޸Ļ����ʱ
    local curtime = os.time()
    local starttime = getsysvar(_varg_starttime)
    local endtime = getsysvar(_varg_endtime)
    --�����
    if curtime >= endtime then
        Playyydz.close()
        return
    else
        local _time = curtime - starttime
        --ˢ�µ�ͼ����ҵ�������
        local map_actors = getobjectinmap(_mapId, 0, 0, 1000, 1)
        if map_actors then
            for _,actor in ipairs(map_actors) do
                _changetask(actor)
            end
        end
    end
end

--�����
function Playyydz.close()
    setofftimerex(_timerid)             --�رջ��ʱ��
    setsysvar(_varg_endtime, 0)         --��������ʱ��

    --��ͼ����һس�
    local map_actors = getobjectinmap(_mapId, 0, 0, 1000, 1)
    if map_actors then
        for _,actor in ipairs(map_actors) do
            if getbaseinfo(actor, ConstCfg.gbase.isdie) then
                realive(actor)              --����
            end
            FBackZone(actor)
        end 
    end

    --����
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

-------------------------------������ �ⲿ���� ������---------------------------------------
-------------------------------������ ������Ϣ ������---------------------------------------
--����
function Playyydz.RequestEnter(actor)
    --�δ����
    if _isEnded() then
        sendmsg(actor, ConstCfg.notice.own, ssrResponseCfg.get(ssrResponseCfg.not_open_activity))
        return 
    end

    if not _isNotInMap(actor) then return end
    
    --�ظ�
    local endtime = getsysvar(_varg_endtime)

    FMapMove(actor, _mapId)

    Message.sendmsg(actor, ssrNetMsgCfg.Playggzj_EnterResponse, endtime)
end

--�뿪
function Playyydz.RequestExit(actor)
    --�ڵ�ͼ�лس�
    if _isNotInMap(actor) then return end
    FBackZone(actor)
    Message.sendmsg(actor, ssrNetMsgCfg.Playggzj_ExitResponse)
end

--����س�
function Playyydz.RequestBack(actor)
    if _isNotInMap(actor) then return end
    FBackZone(actor)
end

Message.RegisterNetMsg(ssrNetMsgCfg.Playyydz, Playyydz)
-------------------------------������ �ⲿ���� ������---------------------------------------
--���󸴻�
function Playyydz.revive(actor)
    if _isNotInMap(actor) then return end
    map(actor,_mapId)
    realive(actor)
end
-- ----------------------------������ �����¼� ������---------------------------------------

-- ----------------------------������ ��Ϸ�¼� ������---------------------------------------
--�˳���Ϸ
local function _onExitGame(actor)
    if _isNotInMap(actor) then return end
    FBackZone(actor)
end
GameEvent.add(EventCfg.onExitGame, _onExitGame, Playyydz)

--����/�л���ͼ
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
-- -------------------------------������ �Զ���������ƻ ������---------------------------------------
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