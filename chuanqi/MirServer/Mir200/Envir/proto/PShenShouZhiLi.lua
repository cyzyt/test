action = ShenShouZhiLi

    --同步数据
    method = "SyncResponse"
    res = {
        arg1 = int1,   --没用     
        arg2 = int2,   --没用              
        arg3 = int3,   --没用                 
        data = table,  --数据表              

    }

    --转生
    method = "RequestZS"                
    req = {
        arg1 = param,      --界面
        arg2 = param2,     --消耗方式
    }

    method = "ZSResponse"
    res = {
        arg1 = int1,      --界面     
        arg2 = int2,      --没用              
        arg3 = int3,      --没用              
        data = table,     --数据表        
    }