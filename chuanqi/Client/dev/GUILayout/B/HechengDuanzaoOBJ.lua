HechengDuanzaoOBJ = {}

HechengDuanzaoOBJ.__cname = "HechengDuanzaoOBJ"

HechengDuanzaoOBJ.cfg = {}
HechengDuanzaoOBJ.cfg_compound = ssrRequireCsvCfg("cfg_compound")
HechengDuanzaoOBJ.page1 = 262
HechengDuanzaoOBJ.page2 = 1

local itemtitle = {
    "[主]","[辅]",
}


HechengDuanzaoOBJ.cfg_compound = ssrRequireCsvCfg("cfg_compound")
for k,v in ipairs(HechengDuanzaoOBJ.cfg_compound) do
    if v.npcid and v.npcid == 262 then
        local index = v.npcid
        HechengDuanzaoOBJ.cfg[index] = HechengDuanzaoOBJ.cfg[index] or {title = v.name2}
        HechengDuanzaoOBJ.cfg[index][v.page2] = HechengDuanzaoOBJ.cfg[index][v.page2] or {title = v.name}
        HechengDuanzaoOBJ.cfg[index][v.page2][v.page3] = HechengDuanzaoOBJ.cfg[index][v.page2][v.page3] or {title = v.name}
        HechengDuanzaoOBJ.cfg[index][v.page2][v.page3] = {
            idx = k,type = v.type,page1 = v.page1,page2 = v.page2,page3 = v.page3,npcid = v.npcid,
            itemid1 = v.itemid1,product = v.product,name = v.name,probability = v.probability,
        }
        if v.type == 2 then
            if v.itemid1[1][1] == v.itemid1[2][1] then
                HechengDuanzaoOBJ.cfg[index][v.page2][v.page3].itemid1[1][2] = HechengDuanzaoOBJ.cfg[index][v.page2][v.page3].itemid1[1][2] + v.itemid1[2][2]
                table.remove(HechengDuanzaoOBJ.cfg[index][v.page2][v.page3].itemid1,2)
            end
        end
    end
end

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HechengDuanzaoOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, objcfg.UI_PATH)

    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    
    self.page1 = 262
    self.page2 = 1

    self.temp1 = self.ui.template
    self.temp2 = self.ui.templist


    --关闭按钮
    GUI:addOnClickEvent(self.ui.btn_close, function()
        GUI:Win_Close(self._parent)
    end)

    for i,cfg in ipairs(self.cfg[self.page1]) do
        local btn1 = GUI:Clone(self.temp1)
        GUI:setVisible(btn1, true)
        GUI:addChild(self.ui.ListView_1, btn1)
        local ui_item = GUI:ListView_getItemByIndex(self.ui.ListView_1, i-1)
        GUI:setName(ui_item,"btn1_switch_"..i)

        ssrLabelString(ui_item, "tx_switch", cfg.title)

        --关闭按钮
        GUI:addOnClickEvent(ui_item, function()
            self:updatePageBtn1(ui_item)
        end)
        GUI:Win_SetParam(ui_item, i)

        --默认选择
        if i == 1 then
            self:updatePageBtn1(ui_item)
        end
    end
    
    local cfg_Desc = ssrRequireCsvCfg("cfg_Desc")
    if cfg_Desc[objcfg.ID] then
        GUI:removeAllChildren(self.ui.Desc_text)
        local size = GUI:getContentSize(self.ui.Desc_text)
        GUI:RichText_Create(self.ui.Desc_text, "txt", size.width/2, size.height/2, cfg_Desc[objcfg.ID].desc, ssrConstCfg.width)
    end

end


--更新页签1
function HechengDuanzaoOBJ:updatePageBtn1(sender)
    --上一次选择按钮
    if self.page2 then
        local btn_switch = self.ui["btn1_switch_"..self.page2]
        GUI:setTouchEnabled(btn_switch, true)
        local tx_switch = ssrSeekWidgetByName(btn_switch, "tx_switch")
        GUI:Text_setTextColor(tx_switch, ssrConstCfg.C3B_GRAY1)
    end
    --这一次选择按钮
    local page2 = GUI:Win_GetParam(sender)

    if page2 == self.page2 then return end

    local btn_switch = self.ui["btn1_switch_"..page2]
    GUI:setTouchEnabled(btn_switch, false)
    local tx_switch = ssrSeekWidgetByName(btn_switch, "tx_switch")
    GUI:Text_setTextColor(tx_switch, ssrConstCfg.C3B_YELLOW1)

    self.page2 = page2

    self:updateUI()
end

function HechengDuanzaoOBJ:searchesNum(index)
    local cfg = self.cfg[self.page1][self.page2]
    local listViewUI = GUI:ui_delegate()

    local setStr = function(tab, parent)
        for j,items in ipairs(tab.itemid1) do
            local need_str = ""
            local idx,need_num = items[1], items[2]
            local have_num = SL:GetMetaValue("ITEM_COUNT", idx)
            local itemname = ""
            if itemtitle[j] then
                itemname = itemtitle[j]
            end
            itemname = itemname ..SL:GetMetaValue("ITEM_NAME", idx)
            if idx <= 100 then
                if have_num >= 10000 then
                    need_str = math.floor(have_num/10000) .."万"
                else
                    need_str = have_num
                end
                need_str = need_str.."/"
                if need_num >= 10000 then
                    need_str = need_str..math.floor(need_num/10000) .."万"
                else
                    need_str = need_str..need_num
                end
            else
                need_str = need_str .. need_num
            end
            if have_num >= need_num then
                need_str = ssrRTextCfg.get(20003, itemname,need_str)
            else
                need_str = ssrRTextCfg.get(20004, itemname,need_str)
            end
            local items_layout = GUI:getChildByName(parent, "itemNeed"..j)
            GUI:removeAllChildren(items_layout)
            local size = GUI:getContentSize(items_layout)
            GUI:RichText_Create(items_layout, "txt", size.width/2, size.height/2, need_str, ssrConstCfg.width)
        end
    end

    if index then
        local tab = cfg[index]
        local parent = listViewUI["img_"..index]
        setStr(tab, parent)
    else
        for i,tab in ipairs(cfg) do
            local parent = listViewUI["img_"..i]
            setStr(tab, parent)
        end
    end
end

function HechengDuanzaoOBJ:updateUI()
    self._parent:stopAllActions()
    GUI:removeAllChildren(self.ui.ListView_2)

    --初始列表
    local cfg = self.cfg[self.page1][self.page2]
    local max = #cfg
    local limit = 2
    local num = math.ceil(max/limit)

    for i = 1,num do
        local ui_item = GUI:Clone(self.ui.templist)
        GUI:setVisible(ui_item, true)
        GUI:addChild(self.ui.ListView_2, ui_item)
    end
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--合成
function HechengDuanzaoOBJ:RequestHecheng(page3)
    local idx = self.cfg[self.page1][self.page2][page3].idx
    ssrMessage:sendmsg(ssrNetMsgCfg.HechengDuanzao_RequestHecheng,idx)
end

function HechengDuanzaoOBJ:ZSResponse()
    self:updateUI()
end

--打开界面
function HechengDuanzaoOBJ:OpenUI()
    self:OpenLayer()
end

function HechengDuanzaoOBJ:HechengResponse()
    self:searchesNum()
end

return HechengDuanzaoOBJ