action = ShangYeHuoDong2

    --同步数据
    method = "SyncResponse"
    res = {
        arg1 = int1,         
        arg2 = int2,                  
        arg3 = int3,                  
        data = table,                  

    }

    --转生
    method = "RequestZS"                
    req = {
        arg1 = param,            
    }

    method = "ZSResponse"
    res = {
        arg1 = int1,         
        arg2 = int2,                  
        arg3 = int3,                  
        data = table,             
    }