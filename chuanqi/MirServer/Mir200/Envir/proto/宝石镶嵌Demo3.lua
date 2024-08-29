action = Demo3

    --镶嵌
    method = "RequestSet"
    req = {
        arg1 = equip_pos,                   --装备位
        arg2 = gem_makeid,                  --宝石唯一id
    }
    method = "SetResponse"
    res = {
        arg1 = equip_pos,                   --装备位
    }

    --拆卸
    method = "RequestDel"
    req = {
        arg1 = equip_pos,                   --装备位
        arg2 = hole,                        --拆卸孔位
    }
    method = "DelResponse"
    res = {
        arg1 = equip_pos,                   --装备位
    }