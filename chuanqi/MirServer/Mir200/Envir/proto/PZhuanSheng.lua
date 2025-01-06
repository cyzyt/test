action = ShangYeHuoDong1

    --同步数据
    method = "SyncResponse"
    res = {
        arg1 = level,                   --当前转生等级
    }

    --转生
    method = "RequestZS"                --定义名字
    req = {
    }

    method = "ZSResponse"
    res = {
        arg1 = level,                   --当前转生等级
    }