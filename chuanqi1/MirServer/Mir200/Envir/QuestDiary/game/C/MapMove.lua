MapMove = {}
MapMove.ID = 30300

local _cfgdel =  cfg_deliver
    
function MapMove.RequestZS(actor,id)
    --LOGPrint("�����==MapMove=="..id)
    local day = grobalinfo(1)
    for i=1,#_cfgdel do
        if _cfgdel[i]["id"] == id then
            -- if _cfgdel[i]["time"] ~= nil then
            --     LOGPrint("MapMove==".._cfgdel[i]["time"])
            --     if day > _cfgdel[i]["time"] then
            --         sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>��ͼ�Ѿ��ر�</font>","Type":9}')
            --         return
            --     end
            -- end
            
            local cfgxiaohao = _cfgdel[id]
            if cfgxiaohao.cost ~= nil then
                
                local name = Player.checkItemNumByTable(actor, cfgxiaohao.cost)   --���ز������ name 
                --LOGWrite("333=="..name)
                if name then ---���Ԫ������ʱ  ���а�Ԫ���ж�
                    sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>'..name..'����</font>","Type":9}')
                    return
                end
                Player.takeItemByTable(actor, cfgxiaohao.cost)  --���� ��������
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

Message.RegisterNetMsg(ssrNetMsgCfg.MapMove, MapMove)  --ע��




-- ----------------------------������ ��Ϸ�¼� ������---------------------------------------
--֪ͨ�ͻ��˴����


return MapMove

