action = Global

    --点击Npc
    method = "ClickNpcResponse"
    res = {
        arg1 = npcid,                   --点击的npcid
    }

    --开启某模块通知
    method = "OpenModuleRun"
    res = {
        arg1 = moduleid,                 --模块唯一id
    }

    --同步创建角色信息
    method = "SyncCreateActor"
    res = {
        arg1 = create_actor_time,       --创建角色时间戳
        arg2 = create_actor_day,        --获取创建角色天数
    }

    --同步创建角色信息
    method = "SyncCreateActor"
    res = {
        arg1 = create_actor_time,       --创建角色时间戳
        arg2 = create_actor_day,        --获取创建角色天数
    }

    --同步创建角色信息
    method = "SyncAdmini"
    res = {
        arg1 = gmlevel,                 --gm权限等级
    }

    --同步创建角色信息
    method = "Recharge"
    res = {
        arg1 = gold,                    --充值货币数
        arg2 = productid,               --产品ID（保留）
        arg3 = moneyid,                 --货币ID
    }
