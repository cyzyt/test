MapMoveOBJ={}

MapMoveOBJ.__cname = "MapMoveOBJ"
MapMoveOBJ.cfgnpc = ssrRequireCsvCfg("cfg_map_npc")
MapMoveOBJ.cfgdel = ssrRequireCsvCfg("cfg_deliver")

function MapMoveOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)

    --关闭背景
    GUI:addOnClickEvent(self.ui.bg_close,function ()
        GUI:Win_Close(parent)
    end)
    
    --关闭按钮
    GUI:addOnClickEvent(self.ui.btn_close,function ()
        GUI:Win_Close(parent)
    end)


    GUI:addOnClickEvent(self.ui.btn_chuanshong,function ()
        self:RequestZS()
    end)
    self:updateUI()
end

function MapMoveOBJ:updateUI() 
    local cfgnpc=self.cfgnpc
    local cfgdel=self.cfgdel
    local nparent = self.ui.SlV_jieshao
    GUI:removeAllChildren(nparent)

    for i=1,#cfgnpc do
       if true then
            self.csid = cfgnpc[i]["Id"]
            local hanld = self.ui.tx_mapname    --最上面的名称
            GUI:Text_setString(hanld,cfgnpc[i]["npc"])
            if cfgdel[cfgnpc[i]["Id"]]["cost"] ~= nil then
                hanld = self.ui.tx_xiaohao   --显示价格
                local itemname = SL:GetMetaValue("ITEM_NAME",cfgdel[cfgnpc[i]["Id"]]["cost"][1][1])
                GUI:Text_setString(hanld,itemname..":"..cfgdel[cfgnpc[i]["Id"]]["cost"][1][2])
            else
                hanld = self.ui.tx_xiaohao   --显示价格
                GUI:Text_setString(hanld,"免费进入")
            end
            local str = cfgnpc[i]["mapDesc"]
            local text = GUI:RichText_Create(nparent, "p_xh_pos", 115, 20, str, ssrConstCfg.width)
            local size = GUI:getContentSize(nparent)
            GUI:setAnchorPoint(text, 0.5, 0)
            GUI:setPosition(text, size.width/2, -size.height/2)

            local itemparent = self.ui.lv_item
            GUI:ListView_setItemsMargin(itemparent, 12)
            for j=1,#cfgnpc[i]["yulan"] do
                local itemdata = {}
                itemdata.index = cfgnpc[i]["yulan"][j]
                itemdata.look  = true
                itemdata.bgVisible = true
                itemdata.count = 1
                itemdata.color = 225
                GUI:ItemShow_Create(itemparent, "item_"..j, 190+(120*j), 0, itemdata)
            end

            GUI:Text_setString(self.ui.tx_title,cfgnpc[i]["mapname"])
            break
        end
    end
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function MapMoveOBJ:RequestZS()
     local csid = self.csid
    ssrMessage:sendmsg(ssrNetMsgCfg.MapMove_RequestZS,csid)
end
return MapMoveOBJ