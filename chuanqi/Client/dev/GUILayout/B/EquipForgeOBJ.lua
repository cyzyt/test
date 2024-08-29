EquipForgeOBJ = {}

EquipForgeOBJ.__cname = "EquipForgeOBJ"
EquipForgeOBJ.cfg_compound = ssrRequireCsvCfg("cfg_compound")


EquipForgeOBJ.cfg = {}

local Page_Tab = {}
for k,v in ipairs(EquipForgeOBJ.cfg_compound) do
    if v.name2 == "上古图腾" then
        local index = 0
        for i = 1, #Page_Tab do
            if Page_Tab[i] == v.page1 then
                index = i
                break
            end
        end
        if index == 0 then
            index = #Page_Tab + 1
            Page_Tab[index] = v.page1
        end
        EquipForgeOBJ.cfg[index] = EquipForgeOBJ.cfg[index] or {title = v.name2}
        EquipForgeOBJ.cfg[index][v.page2] = EquipForgeOBJ.cfg[index][v.page2] or {title = v.name}
        EquipForgeOBJ.cfg[index][v.page2][v.page3] = EquipForgeOBJ.cfg[index][v.page2][v.page3] or {title = v.name}
        EquipForgeOBJ.cfg[index][v.page2][v.page3] = {
            idx = k,type = v.type,page1 = v.page1,page2 = v.page2,page3 = v.page3,npcid = v.npcid,
            itemid1 = v.itemid1,product = v.product,name = v.name,probability = v.probability,type2 = v.type2,
        }
    end
end

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------

function EquipForgeOBJ:main(objcfg)
    local cfg = self.cfg
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, objcfg.UI_PATH)

    self._parent = parent
    self.ui = GUI:ui_delegate(parent)

    self.page1 = 1
    self.page2 = nil

    --关闭按钮
    GUI:addOnClickEvent(self.ui.la_bg, function()
        GUI:Win_Close(self._parent)
    end)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.btn_close, function()
        GUI:Win_Close(self._parent)
    end)

    --锻造按钮
    GUI:addOnClickEvent(self.ui.btn_go_activity, function()
        self:RequestForge()
    end)



    for i,_cfg in ipairs(self.cfg[self.page1]) do
        local item_1 = GUI:Clone(self.ui.template)
        GUI:setVisible(item_1,true)
        GUI:ListView_pushBackCustomItem(self.ui.ListView_1, item_1)
        local ui_item = GUI:ListView_getItemByIndex(self.ui.ListView_1,i-1)
        GUI:setName(ui_item, "btn1_switch_"..i)


        local text = GUI:getChildByName(ui_item, "tx_switch")
        GUI:Text_setString(text, _cfg.title)

        GUI:addOnClickEvent(ui_item, function(sender)
            self:updatePageBtn1(sender)
        end)

        GUI:setTag(ui_item, i)

          --默认选择
        if i == 1 then
            self:updatePageBtn1(ui_item)
        end
    end

    -- self:createcustombtn()
    return self
end

--更新页签1
function EquipForgeOBJ:updatePageBtn1(sender)
    --上一次选择按钮
    if self.page2 then
        local btn_switch = self.ui["btn1_switch_"..self.page2]
        GUI:setEnabled(btn_switch, true)
        local tx_switch = ssrSeekWidgetByName(btn_switch, "tx_switch")
        GUI:Text_setTextColor(tx_switch,ssrConstCfg.C3B_GRAY1)
    end
    --这一次选择按钮
    local page2 = GUI:getTag(sender)

    if page2 == self.page2 then return end

    local btn_switch = self.ui["btn1_switch_"..page2]
    GUI:setEnabled(btn_switch,false)
    local tx_switch = ssrSeekWidgetByName(btn_switch, "tx_switch")
    GUI:Text_setTextColor(tx_switch,ssrConstCfg.C3B_YELLOW1)
    
    self.page2 = page2

    self:updateUI()
end

function EquipForgeOBJ:updateUI()
    local cfg = self.cfg[self.page1][self.page2]

    local equippos = cfg[1].type2

    if not equippos then return end

    local isMax
    isMax,self.page3 = self:EquipIsMax(self.page1,self.page2)

    GUI:removeAllChildren(self.ui.Item_1)
    local itemIdx = cfg[self.page3].product[1][1]
    GUI:ItemShow_Create(self.ui.Item_1, "item", 0, 0, {index = itemIdx, look=true})

    local iteminfo = SL:GetMetaValue("ITEM_DATA", itemIdx)
    local look = iteminfo.Looks

    local img = GUI:Image_Create(self.ui.Item_1, "image", -3, -20, "res/custom/kapai/00"..look..".png")
    GUI:setScale(img, 0.45)

    local page = self:SelectItemPage(itemIdx)
    img = GUI:Image_Create(self.ui.Item_1, "image1", 10, 45, "res/custom/baowu/"..tonumber(page)..".png")    -- 数字，阶数
    GUI:setScale(img, 0.6)

    img = GUI:Image_Create(self.ui.Item_1, "image2", 10, 30, "res/custom/baowu/10.png")                     --“阶” 字
    GUI:setScale(img, 0.6)

    for j,items in ipairs(cfg[self.page3].itemid1) do
        local need_str = ""
        local idx,need_num = items[1], items[2]
        local have_num = SL:GetMetaValue("ITEM_COUNT", idx)
        local itemname = SL:GetMetaValue("ITEM_NAME", idx)
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
            need_str = need_num
        end
        if have_num >= need_num then
            need_str = ssrRTextCfg.get(20000, itemname,need_str)
        else
            need_str = ssrRTextCfg.get(20001, itemname,need_str)
        end
        local items_layout = ssrSeekWidgetByName(self.ui.forgeBg_layout, "itemNeed"..j)
        GUI:removeAllChildren(items_layout)
        local size = GUI:getContentSize(items_layout)
        if isMax then
            need_str = ""
        end
        local text = GUI:RichText_Create(items_layout, "txt", size.width/2, size.height/2, need_str, ssrConstCfg.width)  --“少年郭靖”
        GUI:setAnchorPoint(text, 0.5, 0)
        GUI:setPosition(text, size.width/2, 0)

        if j < 3 then
            local item_layout = ssrSeekWidgetByName(self.ui.forgeBg_layout, "Item_"..(j + 1))
            GUI:removeAllChildren(item_layout)
            local itemShow = GUI:ItemShow_Create(item_layout, "item", -7, -8, {index = cfg[self.page3].itemid1[j][1], look=true})
            GUI:setScale(itemShow, 1.3)
        end
    end

    local pro_str = ssrRTextCfg.get(20000, "成功率",cfg[self.page3].probability/100).."<font color='#4AE74A' size='16'>%</font>"
    local items_layout = ssrSeekWidgetByName(self.ui.forgeBg_layout, "itemPro")
    GUI:removeAllChildren(items_layout)
    local size = GUI:getContentSize(items_layout)

    local pos_Y = size.height/2
    if isMax then
        pro_str = ssrRTextCfg.get(20002, cfg.title)
        pos_Y = pos_Y + 15
    end
    
    local text = GUI:RichText_Create(items_layout, "txt", size.width/2, pos_Y, pro_str, ssrConstCfg.width)
    GUI:setAnchorPoint(text, 0.5, 0)
    GUI:setPosition(text, size.width/2, 0)
end


function EquipForgeOBJ:SelectItemPage(index)
    local page = 0
    for k,v in ipairs(self.cfg_compound) do
        if index == v.product[1][1] then
            page = v.page3
            break
        end
    end
    return page
end

--是否满级
function EquipForgeOBJ:EquipIsMax(page1,page2)

    local cfg = self.cfg[page1][page2]
    local equippos = cfg[1].type2
    local equipdata = SL:GetMetaValue("EQUIP_DATA", equippos)
    --选择装备显示
    local isMax = false
    local page3 = 1
    if equipdata then
        for i ,v in ipairs(cfg) do
            if equipdata.Index == v.product[1][1] then
                page3 = i + 1
                if page3 > #cfg then
                    isMax = true
                    page3 = #cfg
                end
                break
            end
        end
    end
    return isMax,page3
end
-------------------------------↓↓↓ 网络 消息 ↓↓↓---------------------------------------
--打开界面
function EquipForgeOBJ:OpenUI()
    self:OpenLayer()
end

--合成
function EquipForgeOBJ:RequestForge()
    ssrMessage:sendmsg(ssrNetMsgCfg.EquipForge_RequestForge,self.page1, self.page2, self.page3)
end

function EquipForgeOBJ:ForgeResponse()
    if not self._layer then return end
    self._layer:updateUI()
end

--添加游戏事件
function EquipForgeOBJ:addGameEvent()
end


return EquipForgeOBJ