action = Nitiangaiming
    --ͬ����Ϣ(��¼����)
    method = "SyncResponse"
    req = {
        data = {
            {idx,lv},           --idx,�ȼ�
        },
    }
    --�򿪽���
    method = "OpenUI"
    req = {
    }
    --��ȡ����
    method = "RequestUp"
    req = {
        arg1 = idx,                     --������idx
    }
    method = "UpResponse"
    res = {
        arg1 = idx,                     --������idx
        arg2 = state,                   --�������lv
    }