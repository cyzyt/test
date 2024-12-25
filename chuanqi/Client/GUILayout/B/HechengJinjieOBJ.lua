HechengJinjieOBJ = {}

HechengJinjieOBJ.__cname = "HechengJinjieOBJ"

HechengJinjieOBJ.cfg = {}

local itemtitle = {

}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HechengJinjieOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, objcfg.UI_PATH)

    self._parent = parent
    self.ui = GUI:ui_delegate(parent)

    self.page1 = 255
    self.page2 = nil
    self.btn1 = self.ui.template
    self.btn2 = self.ui.templist

    --关闭按钮
    GUI:addOnClickEvent(self.ui.btn_close, function()
        GUI:Win_Close(self._parent)
    end)

    self.cfg_compound = ssrRequireCsvCfg("cfg_compound")
    for k,v in ipairs(self.cfg_compound) do
        if v.npcid and v.npcid == 255 then
            local index = v.npcid
            self.cfg[index] = self.cfg[index] or {title = v.name2}
            self.cfg[index][v.page2] = self.cfg[index][v.page2] or {title = v.name}
            self.cfg[index][v.page2][v.page3] = self.cfg[index][v.page2][v.page3] or {title = v.name}
            self.cfg[index][v.page2][v.page3] = {
                idx = k,type = v.type,page1 = v.page1,page2 = v.page2,page3 = v.page3,npcid = v.npcid,
                itemid1 = v.itemid1,product = v.product,name = v.name,probability = v.probability,
            }
            if v.type == 2 then
                if v.itemid1[1][1] == v.itemid1[2][1] then
                    self.cfg[index][v.page2][v.page3].itemid1[1][2] = self.cfg[index][v.page2][v.page3].itemid1[1][2] + v.itemid1[2][2]
                    table.remove(self.cfg[index][v.page2][v.page3].itemid1,2)
                end
            end
        end
    end

    local cfg_Desc = ssrRequireCsvCfg("cfg_Desc")
    if cfg_Desc[objcfg.ID] then
        local size = GUI:getContentSize(self.ui.Desc_text)
        GUI:RichText_Create(self.ui.Desc_text, "txt", size.width/2, size.height/2, cfg_Desc[objcfg.ID].desc, ssrConstCfg.width)
    end

    for i,cfg in ipairs(self.cfg[self.page1]) do
        local btn = GUI:Clone(self.btn1)
        GUI:setVisible(btn,true)
        GUI:setTouchEnabled(btn, true)
        GUI:addChild(self.ui.ListView_1, btn)
        local ui_item = GUI:ListView_getItemByIndex(self.ui.ListView_1, i-1)
        GUI:setName(ui_item,"btn1_switch_"..i)

        ssrLabelString(ui_item, "tx_switch", cfg.title)

        GUI:addOnClickEvent(ui_item, function()
            self:updatePageBtn1(ui_item)
        end)
        GUI:Win_SetParam(ui_item, i)

        
        --默认选择
        if i == 1 then
            self:updatePageBtn1(ui_item)
        end
    end

end

--更新页签1
function HechengJinjieOBJ:updatePageBtn1(sender)
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
    GUI:setTouchEnabled( btn_switch, false)
    local tx_switch = ssrSeekWidgetByName(btn_switch, "tx_switch")
    GUI:Text_setTextColor(tx_switch, ssrConstCfg.C3B_YELLOW1)

    self.page2 = page2

    self:updateUI()
end

function HechengJinjieOBJ:searchesNum(index)
    local cfg = self.cfg[self.page1][self.page2]
    local listViewUI = GUI:ui_delegate(self.ui.ListView_2)

    local setStr = function(tab, parent)
        for j,items in ipairs(tab.itemid1) do
            local need_str = ""
            local idx,need_num = items[1], items[2]
            local have_num = SL:GetMetaValue("ITEM_COUNT", idx)
            local itemname = ""
            if itemtitle[j] then
                itemname = itemtitle[j]
            end
            itemname = itemname ..SL:GetMetaValue("ITEM_COUNT", idx)
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

function HechengJinjieOBJ:updateUI()
    self._parent:stopAllActions()
    GUI:removeAllChildren(self.ui.ListView_2)
    --初始列表
    local cfg = self.cfg[self.page1][self.page2]
    local max = #cfg
    local limit = 2
    local num = math.ceil(max/limit)
    for i = 1,num do
        local creatShowItems = function ()
            local btn = GUI:Clone(self.btn2)
            GUI:setVisible(btn,true)
            GUI:setTouchEnabled(btn, true)
            GUI:addChild(self.ui.ListView_2, btn)
            local ui_item = GUI:ListView_getItemByIndex(self.ui.ListView_2, i-1)

            for j=1,limit do
                local img = GUI:getChildByName(ui_item, "img_"..j)
                local index = (i-1)*limit+j
                GUI:setName(img,"img_"..index)
                
                local tab = cfg[index]
                if tab then
                    local imgUI = GUI:ui_delegate(img)
                    --名字
                    ssrLabelString(img, "itemName", SL:GetMetaValue("ITEM_NAME", tab.product[1][1]))
                    --物品展示
                    local itemshow = GUI:ItemShow_Create(imgUI.itemBg, "item", 0, 0, {index = tab.product[1][1], look=true})

                    local pro_str = ""
                    pro_str = "<font color='#4AE74A' size='15'>成功率："..tab.probability/100 .."%</font>"
                    GUI:removeAllChildren(imgUI.itemPro)
                    local size = GUI:getContentSize(imgUI.itemPro)
                    GUI:RichText_Create(imgUI.itemPro, "txt", size.width/2, size.height/2, pro_str, ssrConstCfg.width)

                    --背景图关闭
                    GUI:addOnClickEvent(imgUI.itemBtn, function(sender)
                        local page3 = GUI:Win_GetParam(sender)
                        self:RequestHecheng(page3)
                    end)
                    GUI:Win_SetParam(imgUI.itemBtn, index)

                    self:searchesNum(index)
                else
                    img:setVisible(false)
                end
            end
        end
        
        local time = 0.1 * (i - 1)
        performWithDelay(self._parent, function()
            creatShowItems()
        end, time)
    end

end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--合成
function HechengJinjieOBJ:RequestHecheng(page3)
    local idx = self.cfg[self.page1][self.page2][page3].idx
    local callback = function()
        ssrMessage:sendmsg(ssrNetMsgCfg.HechengJinjie_RequestHecheng,idx)
    end
    if self.cfg_compound[idx] and self.cfg_compound[idx].itemid1 then
        -- ssrCheckItemCostByTable(self.cfg_compound[idx].itemid1, callback,ssrNetMsgCfg.HechengJinjie)
        callback()
    else
        callback()
    end
    
end

function HechengJinjieOBJ:ZSResponse()
    self:updateUI()
end

--打开界面
function HechengJinjieOBJ:OpenUI()
    self:OpenLayer()
end

function HechengJinjieOBJ:HechengResponse()
    self:searchesNum()
end

--添加游戏事件
SL:RegisterLUAEvent(LUA_EVENT_TALKTONPC, "HechengRongheOBJ", function (data)
    if data.index == 255 then
        ssrUIManager:OPEN(ssrObjCfg.HechengRonghe)
    end
end)

return HechengJinjieOBJ