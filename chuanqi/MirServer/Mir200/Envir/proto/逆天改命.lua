action = Nitiangaiming
    --同步信息(登录发送)
    method = "SyncResponse"
    req = {
        data = {
            {idx,lv},           --idx,等级
        },
    }
    --打开界面
    method = "OpenUI"
    req = {
    }
    --领取奖励
    method = "RequestUp"
    req = {
        arg1 = idx,                     --升级的idx
    }
    method = "UpResponse"
    res = {
        arg1 = idx,                     --升级的idx
        arg2 = state,                   --升级后的lv
    }