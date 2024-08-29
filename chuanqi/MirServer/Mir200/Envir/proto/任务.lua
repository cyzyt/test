action = Task
    
    --同步信息
    method = "SyncResponse"
    res = {
        data = {
            {
                taskid,             --任务Id       对应 cfg_renwu 表 TaskID 字段
                taskstate,          --任务状态 1：任务进行中 2：任务已完成
                {params},       --任务参数， 参数数量根据具体任务决定
            }
        },
    }

    --更新任务
    method = "updateTaskInfo"
    res = {
        arg1 = action,      -- 0：删除任务，1：领取任务，2：更新任务， 3：完成任务
        data = {
            taskid,             --任务Id       对应 cfg_renwu 表 TaskID 字段
            taskstate,          --任务状态  1：任务进行中 2：任务已完成
            {params},       --任务参数， 参数数量根据具体任务决定
        },
    }
    
    --打开npc对话界面
    method = "OpenTalkNpc"
    res = {
        taskid,                 --任务Id       对应 cfg_renwu 表 TaskID 字段
    }

    --与npc对话完成
    method = "RequestTalkFinish"
    req = {
        taskid,                 --任务Id       对应 cfg_renwu 表 TaskID 字段
    }
    
    --点击任务
    method = "RequestBehavior"
    req = {
        arg1 = taskid,                  --任务Id       对应 cfg_renwu 表 TaskID 字段
        arg2 = taskstate,               --任务状态
        arg3 = touchid,                 --点击行为Id       对应 cfg_renwu_touch 表 TouchID 字段     任务进行中状态才有该字段
    }