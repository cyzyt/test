action = BaoWu

    --同步数据
    method = "SyncResponse"
    res = {
        arg1 = bwlevel,                   --当前宝物等级
    }

    --升级宝物
    method = "RequestSJ"
    req = {
        arg1 = stype,                   --当前宝物类型
    }
    method = "ZSResponse"
    res = {
        arg1 = bwlevel,                  --当前宝物等级
        arg2 = stype,                   --当前宝物类型
    }