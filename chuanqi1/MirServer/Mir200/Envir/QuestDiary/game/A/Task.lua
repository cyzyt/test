Task = {}

--������
local _task_actions = {
    delete          = 0,        --ɾ������
    receive         = 1,        --��ȡ����
    update          = 2,        --��������
    finish          = 3,        --�������
}
--����״̬
local _task_states = {
    ongoing         = 1,        --������״̬
    finish          = 2,        --�������״̬
}
--�����������
local _finish_types = {
    talknpc         = 1,        --�Ի�npc
    auto            = 2,        --�Զ����
    touch           = 3,        --������
}
--������񴥷�����
local _touch_types = {
    openui          = 1,
    findnpc         = 2,
    shopbuy         = 3,
    findmonkill     = 4,
}
--Ŀ���������� cfg_renwu_target �� Type �ֶ�
local _target_types = {
    mapgetequip     = 1,	    --ǰ����Ӧ��ͼ����ָ������װ��
    mapkillmon      = 2,	    --ǰ����Ӧ��ͼ����ָ����������
    zhuansheng      = 3,	    --�ﵽת���ȼ�
    setgem          = 4,	    --��ʯ��Ƕһ��
    baowu           = 5,	    --��������һ��
    nitian          = 6,	    --�����������һ��
    shenshou        = 7,	    --��������һ��
    kuangbao        = 8,	    --�񱩿���һ��
    ronghe          = 9,	    --װ���ں�һ��
    jinjie         = 10,	    --װ������һ��
}

local _var_id = {}                  --�������Ͷ�Ӧ������id
local _var_state = {}               --�������Ͷ�Ӧ������״̬
local _var_params = {}              --�������Ͷ�Ӧ�Ĳ���
local _npcidx_tasktype_map = {}     --npcidx �� �������� ��Ӧ��
local _tasktype_param_maxnum = {}   --�������Ͷ�Ӧ������������
for taskid,cfg in pairs(cfg_renwu) do
    local tasktype = cfg.Type

    if cfg.CompleteNpc then
        if not _npcidx_tasktype_map[cfg.CompleteNpc] then _npcidx_tasktype_map[cfg.CompleteNpc] = {} end
        _npcidx_tasktype_map[cfg.CompleteNpc][tasktype] = true
    end

    if not _var_id[tasktype] then
        _var_id[tasktype] = "NA_��������"..tasktype
        _var_state[tasktype] = "NA_��������״̬"..tasktype

        _tasktype_param_maxnum[tasktype] = _tasktype_param_maxnum[tasktype] or 1
        local cur_maxnum = _tasktype_param_maxnum[tasktype]     --��ǰ�����������Ŀ����������
        if cfg.Target then
            local target_task_num = #cfg.Target
            if target_task_num > cur_maxnum then 
                _tasktype_param_maxnum[tasktype] = target_task_num
            end
        end
    end
end

for tasktype, max_param_num in pairs(_tasktype_param_maxnum) do
    for target_task_index=1, max_param_num do
        _var_params[tasktype] = _var_params[tasktype] or {}
        _var_params[tasktype][target_task_index] = "NA_��������"..tasktype.."����"..target_task_index
    end
end

--��������
function Task.playerVar(actor)
    for type,_ in pairs(_var_id) do
        iniplayvar(actor, "integer", "HUMAN", _var_id[type])
        iniplayvar(actor, "integer", "HUMAN", _var_state[type])
        for i=1,#_var_params[type] do
            iniplayvar(actor, "integer", "HUMAN", _var_params[type][i])
        end
    end
end

-------------------------------������ ���ط��� ������---------------------------------------
--��������Ƿ��������npc
local function _checkTaskFinishNpc(actor, npcidx, tasktype)
    local curtaskid = getplayvar(actor, _var_id[tasktype])
    local curtaskstate = getplayvar(actor, _var_state[tasktype])
    if cfg_renwu[curtaskid] and cfg_renwu[curtaskid].CompleteNpc == npcidx and curtaskstate == _task_states.finish then
        return curtaskid
    end
end

--��ȡ�������Ͳ���
local function _getTaskTypeParams(actor, taskid)
    local parsms
    local tasktype = cfg_renwu[taskid].Type
    local targetIds = cfg_renwu[taskid].Target
    if targetIds then
        parsms = {}
        for i=1, #targetIds do
            parsms[i] = getplayvar(actor, _var_params[tasktype][i])
        end
    end
    return parsms
end

--�����������ͨ������id
local function _clearTaskVarById(actor, taskid)
    local typecfg = cfg_renwu[taskid]
    local tasktype = typecfg.Type
    FSetPlayVar(actor, _var_id[tasktype])
    FSetPlayVar(actor, _var_state[tasktype])
    FSetPlayVar(actor, _var_params[tasktype])
end

--��ȡ����Ŀ������
local function _getTaskTargetCfg(actor, tasktype, targettype)
    local taskid = getplayvar(actor, _var_id[tasktype])
    local taskcfg = cfg_renwu[taskid]
    if not taskcfg then return end

    local taskstate = getplayvar(actor, _var_state[tasktype])
    if taskstate == _task_states.finish then return end

    local targetIds = taskcfg.Target
    if not targetIds then return end

    for targetindex, targetid in ipairs(targetIds) do
        local targetcfg = cfg_renwu_target[targetid]
        if targettype == targetcfg.Type then
            return taskid, targetindex, targetcfg
        end
    end
end

--��������Ƿ������������
local function _checkTaskTargets(actor, taskid, taskcfg, targetIds)
    for targetindex, targetid in ipairs(targetIds) do
        local targetcfg = cfg_renwu_target[targetid]
        local curnum = getplayvar(actor, _var_params[taskcfg.Type][targetindex])
        if curnum < targetcfg.NeedNum then      --Ŀ���������δ��
            return false
        end
    end
    return true
end

--�����������
local function _updateTaskProgress(tasktype, targettype, actor, arg1, arg2, arg3)
    local isreceivetask = not targettype        --�Ƿ���ȡ����
    local taskid = getplayvar(actor, _var_id[tasktype])
    --��������
    local taskcfg = cfg_renwu[taskid]
    if not taskcfg then return end

    --����״̬
    local taskstate = getplayvar(actor, _var_state[tasktype])
    if taskstate == _task_states.finish then return end
    --����Ŀ��3
    local targetIds = taskcfg.Target
    if not targetIds then return end
    --��������Ŀ���չ
    local isSyncTask = false
    for targetindex, targetid in ipairs(targetIds) do
        local targetcfg = cfg_renwu_target[targetid]
        local curnum = getplayvar(actor, _var_params[tasktype][targetindex])
        if curnum < targetcfg.NeedNum then      --Ŀ���������δ��
            local ischange
            if targettype then
                if targettype == targetcfg.Type then
                    ischange = _target_types[targetcfg.Type](isreceivetask, tasktype, targetindex, targetcfg, actor, arg1, arg2, arg3)
                end
            else
                ischange = _target_types[targetcfg.Type](isreceivetask, tasktype, targetindex, targetcfg, actor, arg1, arg2, arg3)
            end
            if ischange and not isSyncTask then isSyncTask = true end
        end
    end

    --ͬ���ͻ���
    if isSyncTask or isreceivetask then
        --��������Ƿ����
        if _checkTaskTargets(actor, taskid, taskcfg, targetIds) then
            Task.finish(actor, taskid, isreceivetask)
        else
            local task_action = targettype and _task_actions.update or _task_actions.receive
            Task.change(actor, taskid, task_action)
        end
    end
end

-------------------------------������ ����Ŀ����ȱ仯 ������---------------------------------------
--ǰ����Ӧ��ͼ����ָ������װ��
_target_types[_target_types.mapgetequip] = function (isreceivetask, tasktype, targetindex, targetcfg, actor, itemobj)
    if isreceivetask then return end

    local mapid = getbaseinfo(actor, ConstCfg.gbase.mapid)
    local targetParam = targetcfg.Param
    if targetParam[1] == mapid then
        local itemidx = getiteminfo(actor, itemobj, ConstCfg.iteminfo.idx)
        if not Item.isEquip(itemidx) then return end         --����ǲ���װ��
        local curnum = getplayvar(actor, _var_params[tasktype][targetindex]) + 1
        FSetPlayVar(actor, _var_params[tasktype][targetindex], curnum)
        return true
    end
end

--ǰ����Ӧ��ͼ����ָ����������
_target_types[_target_types.mapkillmon] = function (isreceivetask, tasktype, targetindex, targetcfg, actor, monobj, monidx)
    if isreceivetask then return end
    
    local mapid = getbaseinfo(actor, ConstCfg.gbase.mapid)
    local targetParam = targetcfg.Param
    if targetParam[1] == mapid then
        local curnum = getplayvar(actor, _var_params[tasktype][targetindex]) + 1
        FSetPlayVar(actor, _var_params[tasktype][targetindex], curnum)
        return true
    end
end

--�ﵽת���ȼ�
_target_types[_target_types.zhuansheng] = function (isreceivetask, tasktype, targetindex, targetcfg, actor)
    local zslevel = getbaseinfo(actor, ConstCfg.gbase.renew_level)
    local needzslevel = targetcfg.NeedNum
    if zslevel < needzslevel then
        FSetPlayVar(actor, _var_params[tasktype][targetindex], zslevel)
    else
        FSetPlayVar(actor, _var_params[tasktype][targetindex], needzslevel)
    end
    return true
end

--��ʯ��Ƕһ��
_target_types[_target_types.setgem] = function (isreceivetask, tasktype, targetindex, targetcfg, actor)
    if isreceivetask then return end

    local curnum = getplayvar(actor, _var_params[tasktype][targetindex]) + 1
    FSetPlayVar(actor, _var_params[tasktype][targetindex], curnum)
    return true
end

--��������һ��
_target_types[_target_types.baowu] = function (isreceivetask, tasktype, targetindex, targetcfg, actor)
    if isreceivetask then return end

    local curnum = getplayvar(actor, _var_params[tasktype][targetindex]) + 1
    FSetPlayVar(actor, _var_params[tasktype][targetindex], curnum)
    return true
end

--�����������һ��
_target_types[_target_types.nitian] = function (isreceivetask, tasktype, targetindex, targetcfg, actor)
    if isreceivetask then return end

    local curnum = getplayvar(actor, _var_params[tasktype][targetindex]) + 1
    FSetPlayVar(actor, _var_params[tasktype][targetindex], curnum)
    return true
end

--��������һ��
_target_types[_target_types.shenshou] = function (isreceivetask, tasktype, targetindex, targetcfg, actor)
    if isreceivetask then return end

    local curnum = getplayvar(actor, _var_params[tasktype][targetindex]) + 1
    FSetPlayVar(actor, _var_params[tasktype][targetindex], curnum)
    return true
end

--������һ��
_target_types[_target_types.kuangbao] = function (isreceivetask, tasktype, targetindex, targetcfg, actor)
    --��ȡ����ʱ������ѿ������㿪����һ��
    if isreceivetask and not KuangBao.isOpenKB(actor) then 
        return
    end

    local curnum = getplayvar(actor, _var_params[tasktype][targetindex]) + 1
    FSetPlayVar(actor, _var_params[tasktype][targetindex], curnum)
    return true
end

--װ���ں�һ��
_target_types[_target_types.ronghe] = function (isreceivetask, tasktype, targetindex, targetcfg, actor)
    if isreceivetask then return end
    
    local curnum = getplayvar(actor, _var_params[tasktype][targetindex]) + 1
    FSetPlayVar(actor, _var_params[tasktype][targetindex], curnum)
    return true
end

--װ������һ��
_target_types[_target_types.jinjie] = function (isreceivetask, tasktype, targetindex, targetcfg, actor)
    if isreceivetask then return end

    local curnum = getplayvar(actor, _var_params[tasktype][targetindex]) + 1
    FSetPlayVar(actor, _var_params[tasktype][targetindex], curnum)
    return true
end

-------------------------------������ ������Ϣ ������---------------------------------------
--ͬ����Ϣ
function Task.SyncResponse(actor, logindatas)
    local data
    for tasktype,_ in pairs(_var_id) do
        local taskid = getplayvar(actor, _var_id[tasktype])
        if taskid ~= 0 and cfg_renwu[taskid] then     --�и���������
            local taskstate = getplayvar(actor, _var_state[tasktype])

            local taskdata = {}
            taskdata[1] = taskid
            taskdata[2] = taskstate
            taskdata[3] = _getTaskTypeParams(actor, taskid)
            
            data = data or {}
            table.insert(data, taskdata)
        end
    end

    if data then
        if logindatas then
            table.insert(logindatas, {ssrNetMsgCfg.Task_SyncResponse, 0, 0, 0, data})
        else
            LOGWrite("�������Task_SyncResponse")
            Message.sendmsg(actor, ssrNetMsgCfg.Task_SyncResponse, 0, 0, 0, data)
        end
    end
end

--����������Ϣ
function Task.updateTaskInfo(actor, taskaction, taskdata)
    Message.sendmsg(actor, ssrNetMsgCfg.Task_updateTaskInfo, taskaction, nil, nil, taskdata)
end

--��NPC�Ի�
function Task.OpenTalkNpc(actor, npcidx)
    local tasktypes = _npcidx_tasktype_map[npcidx]  --��npc��Ӧ����������
    if not tasktypes then return end

    --�ȴ�������
    for tasktype,_ in pairs(tasktypes) do
        if tasktype == 1 then
            local curtaskid = _checkTaskFinishNpc(actor, npcidx, tasktype)
            if curtaskid then
                Message.sendmsg(actor, ssrNetMsgCfg.Task_OpenTalkNpc, curtaskid)
                return true
            end
        end
    end

    for tasktype,_ in pairs(tasktypes) do
        if tasktype ~= 1 then
            local curtaskid = _checkTaskFinishNpc(actor, npcidx, tasktype)
            if curtaskid then
                Message.sendmsg(actor, ssrNetMsgCfg.Task_OpenTalkNpc, curtaskid)
                return true
            end
        end
    end
end

--��NPC�Ի����
function Task.RequestTalkFinish(actor, taskid)
    local taskcfg = cfg_renwu[taskid]
    if not taskcfg then return end

    local tasktype = taskcfg.Type
    local curtaskid = getplayvar(actor, _var_id[tasktype])
    local taskstate = getplayvar(actor, _var_state[tasktype])
    
    if taskstate == _task_states.finish and taskid == curtaskid then
        Task.finished(actor, taskid)
    end
end

--�������
function Task.RequestBehavior(actor, taskid, taskstate, touchid)
    local taskcfg = cfg_renwu[taskid]
    local tasktype = taskcfg.Type
    local cur_taskid = getplayvar(actor, _var_id[tasktype])
    if cur_taskid ~= taskid then return end
    local cut_taskstate = getplayvar(actor, _var_state[tasktype])
    if cut_taskstate ~= taskstate then return end
    --�Ƿ������
    if taskstate == _task_states.finish then         --���
        local finishtype = taskcfg.CompleteType     --�������
        if finishtype == _finish_types.talknpc then  --��Npc
            local npcidx = taskcfg.CompleteNpc
            if npcidx then FOpenNpcShowEx(actor, npcidx) end
        elseif finishtype == _finish_types.touch then     --����������
            Task.finished(actor, taskid)
        end
    elseif taskstate == _task_states.ongoing then
        if touchid then
            local touchcfg = cfg_renwu_touch[touchid]
            if touchcfg then
                if touchcfg.Type == _touch_types.findnpc then
                    FOpenNpcShowEx(actor, touchcfg.Param[1])
                elseif touchcfg.Type == _touch_types.findmonkill then
                    local mapid, x, y, auto = unpack(touchcfg.Param)
                    if type(mapid) ~= "string" then mapid=mapid.."" end

                    local curmapid = getbaseinfo(actor, ConstCfg.gbase.mapid)
                    if curmapid ~= mapid then mapmove(actor, mapid, x, y) end
                    --��������Ż���Ŀ�ĵؾ����������ĳֵ���ͷɹ�ȥ
                    if auto and auto == 1 then
                        killmobappoint(actor, mapid, x, y)
                    else
                        gotonow(actor, x, y)
                    end
                end
            end
        end
    end
end

Message.RegisterNetMsg(ssrNetMsgCfg.Task, Task)

-------------------------------������ �߼����� ������---------------------------------------
--������
function Task.receive(actor, taskid)
    local taskcfg = cfg_renwu[taskid]
    if not taskcfg then return end

    local tasktype = taskcfg.Type
    if not tasktype then return end
    --������е�ǰ�������ͣ����������������
    local curTaskid = getplayvar(actor, _var_id[tasktype])
    if curTaskid ~= 0 then Task.delete(actor, curTaskid) end
    --������ȡ�������
    local targetIds = taskcfg.Target
    local taskstate = targetIds and _task_states.ongoing or _task_states.finish
    FSetPlayVar(actor, _var_id[tasktype], taskid)
    FSetPlayVar(actor, _var_state[tasktype], taskstate)
    if taskstate == _task_states.ongoing then
        _updateTaskProgress(tasktype, nil, actor)
    else
        Task.change(actor, taskid, _task_actions.receive)
    end
end

--����������״̬
function Task.finish(actor, taskid, isMeetTask)
    local taskcfg = cfg_renwu[taskid]
    local finishtype = taskcfg.CompleteType
    if finishtype == _finish_types.auto then
        Task.finished(actor, taskid)
    else
        FSetPlayVar(actor, _var_state[taskcfg.Type], _task_states.finish)
        local taskaction = isMeetTask and _task_actions.receive or _task_actions.update        --����������������
        Task.change(actor, taskid, taskaction)
        if taskcfg.AutoTouchFinish == 1 then
            Task.Re3questBehavior(actor, taskid)
        end
    end
end

--���������
function Task.finished(actor, taskid)
    local taskcfg = cfg_renwu[taskid]
    Task.delete(actor, taskid, _task_actions.finish)

    --������
    if taskcfg.Reward then
        Player.giveItemBoxByIdx(actor, taskcfg.Reward)
    end

    --��ȡ���������
    if taskcfg.NextTask then
        for i=1, #taskcfg.NextTask do
            local newtaskid = taskcfg.NextTask[i]
            Task.receive(actor, newtaskid)
        end
    end
end

--ɾ������
function Task.delete(actor, taskid, taskaction)
    local taskcfg = cfg_renwu[taskid]
    local tasktype = taskcfg.Type
    local curTaskid = getplayvar(actor, _var_id[tasktype])
    if curTaskid ~= taskid then return end      --δ��ȡɾ������id

    --��������
    _clearTaskVarById(actor, taskid)

    --ͬ���ͻ���
    taskaction = taskaction or _task_actions.delete
    Task.change(actor, taskid, taskaction)
end

--����ı�
function Task.change(actor, taskid, taskaction)
    local taskcfg = cfg_renwu[taskid]
    local tasktype = taskcfg.Type

    local taskdata = {}
    taskdata[1] = taskid
    if taskaction == _task_actions.receive or taskaction == _task_actions.update then --���»���ȡ����
        local taskstate = getplayvar(actor, _var_state[tasktype])
        taskdata[2] = taskstate
        if taskcfg.Target and taskstate == _task_states.ongoing then
            taskdata[3] = _getTaskTypeParams(actor, taskid)
        end
    end
    Task.updateTaskInfo(actor, taskaction, taskdata)
end

--�л���ͼ
local function _goSwitchMap(actor, cur_mapid, former_mapid)
    for tasktype,_ in pairs(_var_id) do
        if tasktype == _target_types.mapgetequip or tasktype == _target_types.mapkillmon then
            local taskid = getplayvar(actor, _var_id[tasktype])
            if taskid ~= 0 and cfg_renwu[taskid] then     --�и���������
                local taskstate = getplayvar(actor, _var_state[tasktype])
                if taskstate == _task_states.ongoing then
                    local targetIds = cfg_renwu[taskid].Target
                    if targetIds then
                        for targetindex, targetid in ipairs(targetIds) do
                            local targetcfg = cfg_renwu_target[targetid]
                            if targetcfg.Param and targetcfg.Param[1] == cur_mapid then
                                startautoattack(actor)
                                return
                            end
                        end
                    end
                end
            end
        end
    end
end

-------------------------------������ ��Ϸ�¼� ������---------------------------------------
GameEvent.add(EventCfg.goPlayerVar, Task.playerVar, Task)
GameEvent.add(EventCfg.onLoginEnd, Task.SyncResponse, Task)
GameEvent.add(EventCfg.onClicknpc, Task.OpenTalkNpc, Task, 1)
GameEvent.add(EventCfg.onNewHuman, function (actor) Task.receive(actor, 1) end, Task)
GameEvent.add(EventCfg.goSwitchMap, _goSwitchMap, Task)

local function _checkTargetTask(targettype, actor, arg1, arg2, arg3)
    for tasktype,_ in pairs(_var_id) do
        _updateTaskProgress(tasktype, targettype, actor, arg1, arg2, arg3)
    end
end
GameEvent.add(EventCfg.goPickUpItemEx, function (actor, itemobj) _checkTargetTask(_target_types.mapgetequip, actor, itemobj) end, Task)
GameEvent.add(EventCfg.onKillMon, function (actor, monobj, monidx) _checkTargetTask(_target_types.mapkillmon, actor, monobj, monidx) end, Task)
GameEvent.add(EventCfg.goZSLevelChange, function (actor) _checkTargetTask(_target_types.zhuansheng, actor) end, Task)
GameEvent.add(EventCfg.goSetGem, function (actor) _checkTargetTask(_target_types.setgem, actor) end, Task)
GameEvent.add(EventCfg.goBaoWu, function (actor) _checkTargetTask(_target_types.baowu, actor) end, Task)
GameEvent.add(EventCfg.goNiTian, function (actor) _checkTargetTask(_target_types.nitian, actor) end, Task)
GameEvent.add(EventCfg.goShenShou, function (actor) _checkTargetTask(_target_types.shenshou, actor) end, Task)
GameEvent.add(EventCfg.goKuangBao, function (actor) _checkTargetTask(_target_types.kuangbao, actor) end, Task)
GameEvent.add(EventCfg.goActivityMap, function (actor) Message.sendmsg(actor, ssrNetMsgCfg.Task_clearTaskBar) end, Task)
GameEvent.add(EventCfg.goBackMap, function (actor) Message.sendmsg(actor, ssrNetMsgCfg.Task_createTaskBar) end, Task)
GameEvent.add(EventCfg.goRongHe, function (actor) _checkTargetTask(_target_types.ronghe, actor) end, Task)
GameEvent.add(EventCfg.goJinJie, function (actor) _checkTargetTask(_target_types.jinjie, actor) end, Task)
-- -------------------------------������ �ⲿ���� ������---------------------------------------

-- -------------------------------������ �Զ���������ƻ ������---------------------------------------
--��������ֱ�ӽ������״̬
function Task.rwwc(actor, tasktype)
    local taskid = getplayvar(actor, _var_id[tasktype])
    if cfg_renwu[taskid] then
        Task.finish(actor, taskid)
    end
end

--��������ֱ�ӽ������״̬
function Task.rwlq(actor, tasktype)
    local taskid = getplayvar(actor, _var_id[tasktype])
    if cfg_renwu[taskid] then
        Task.finish(actor, taskid)
    end
end


return Task