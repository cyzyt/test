MapMove = {}
MapMove.ID = 30300

local _cfgdel =  cfg_deliver
    
function MapMove.RequestZS(actor,id)
    --LOGPrint("服务端==MapMove=="..id)
    local day = grobalinfo(1)
    for i=1,#_cfgdel do
        if _cfgdel[i]["id"] == id then
            -- if _cfgdel[i]["time"] ~= nil then
            --     LOGPrint("MapMove==".._cfgdel[i]["time"])
            --     if day > _cfgdel[i]["time"] then
            --         sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>地图已经关闭</font>","Type":9}')
            --         return
            --     end
            -- end
            
            local cfgxiaohao = _cfgdel[id]
            if cfgxiaohao.cost ~= nil then
                
                local name = Player.checkItemNumByTable(actor, cfgxiaohao.cost)   --返回不足材料 name 
                --LOGWrite("333=="..name)
                if name then ---检查元宝不足时  进行绑定元宝判断
                    sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>'..name..'不足</font>","Type":9}')
                    return
                end
                Player.takeItemByTable(actor, cfgxiaohao.cost)  --材料 包括货币
                if cfgxiaohao.x ~= nil then
                    mapmove(actor,cfgxiaohao.toMapId,cfgxiaohao.x,cfgxiaohao.y)
                else
                    map(actor,cfgxiaohao.toMapId)
                end
            else
                if cfgxiaohao.x ~= nil then
                    mapmove(actor,cfgxiaohao.toMapId,cfgxiaohao.x,cfgxiaohao.y)
                else
                    map(actor,cfgxiaohao.toMapId)
                end

            end
        end
    end
end

Message.RegisterNetMsg(ssrNetMsgCfg.MapMove, MapMove)  --注册




-- ----------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------
--通知客户端打开面板


return MapMove

