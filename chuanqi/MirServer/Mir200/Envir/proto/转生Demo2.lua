action = Demo2

    --同步数据
    method = "SyncResponse"
    res = {
        arg1 = zslevel,                   --当前转生等级
    }

    --转生
    method = "RequestZS"
    req = {
    }
    
    method = "ZSResponse"
    res = {
        arg1 = zslevel,                  --当前转生等级
        arg2 = plevel,                   --当前人物等级
    }