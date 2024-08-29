action = ShangYeHuoDong1

    --同步数据
    method = "RequestZS"                --定义名字
    req = {
        arg1 = npcidx,  
    }

    method = "ZSResponse"
    res = {
        arg1 = npcidx,                   --当前转生等级
    }