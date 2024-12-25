HechengOBJ = {}

HechengOBJ.__cname = "HechengOBJ"

HechengOBJ.cfg = {}

HechengOBJ.cfg_compound = ssrRequireCsvCfg("cfg_compound")

local Page_Tab = {}

for k,v in ipairs(HechengOBJ.cfg_compound) do
    if not v.npcid and v.name2 ~= "上古图腾" and v.type ~= 3 then
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
        HechengOBJ.cfg[index] = HechengOBJ.cfg[index] or {title = v.name2}
        HechengOBJ.cfg[index][v.page2] = HechengOBJ.cfg[index][v.page2] or {title = v.name}
        HechengOBJ.cfg[index][v.page2][v.page3] = HechengOBJ.cfg[index][v.page2][v.page3] or {title = v.name}
        HechengOBJ.cfg[index][v.page2][v.page3] = {
            idx = k,type = v.type,page1 = v.page1,page2 = v.page2,page3 = v.page3,
            itemid1 = v.itemid1,product = v.product,name = v.name,probability = v.probability,
        }
    end
end

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HechengOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, objcfg.UI_PATH,function ()
        self._parent = parent
        self.ui = GUI:ui_delegate(parent)

        GUI:setVisible(self.ui.template_1,false)
        GUI:setVisible(self.ui.template_2,false)
        GUI:setVisible(self.ui.template_3,false)
        GUI:setVisible(self.ui.ListView_3,false)
        
        HechengOBJ.page1 = nil
        HechengOBJ.page2 = nil
    
        --关闭按钮
        GUI:addOnClickEvent(self.ui.btn_close, function()
            GUI:Win_Close(self._parent)
        end)
    
        --关闭背景
        GUI:addOnClickEvent(self.ui.bg_close, function()
            GUI:Win_Close(self._parent)
        end)
       
        GUI:addOnClickEvent(self.ui.btn_go, function()
            self:RequestHecheng()
        end)

        for i,cfg in ipairs(self.cfg) do
            local ui_item = GUI:Clone(self.ui.template_1)
            GUI:setVisible(ui_item,true)
            GUI:ListView_pushBackCustomItem(self.ui.ListView_1, ui_item)
            GUI:setName(ui_item,"btn1_switch_"..i)
            GUI:Button_setTitleText(ui_item, cfg.title)
            GUI:Win_SetParam(ui_item, i)
            GUI:addOnClickEvent(ui_item, function()
                self:updatePageBtn1(ui_item)
            end)

            --默认选择
            if i == 1 then
                self:updatePageBtn1(ui_item)
            end
        end

        --初始化背景
        self:updateBgSize()
    end)
end

--更新背景
function HechengOBJ:updateBgSize()
    local width,heihjt = SL:GetMetaValue("SCREEN_WIDTH"),SL:GetMetaValue("SCREEN_HEIGHT")
    GUI:setContentSize(self.ui.bg_close, width,heihjt)
end

SL:RegisterLUAEvent(LUA_EVENT_WINDOW_CHANGE, "HechengOBJ", function ()
    if not GUI:GetWindow(nil,HechengOBJ.__cname) then return end
    HechengOBJ:updateBgSize()
end)

--更新页签1
function HechengOBJ:updatePageBtn1(sender)
    --上一次选择按钮
    if self.page1 then
        local btn_switch = GUI:getChildByName(self.ui.ListView_1,"btn1_switch_"..self.page1)
        GUI:setTouchEnabled(btn_switch, true)
        GUI:Button_setTitleColor(btn_switch, ssrConstCfg.C3B_GRAY1)
    end

    --这一次选择按钮
    local page1 = GUI:Win_GetParam(sender)
    if page1 == self.page1 then return end
    self.page1 = page1

    local btn_switch = GUI:getChildByName(self.ui.ListView_1,"btn1_switch_"..self.page1)
    GUI:setTouchEnabled(btn_switch, false)
    GUI:Button_setTitleColor(btn_switch, ssrConstCfg.C3B_YELLOW1)

    GUI:removeAllChildren(self.ui.ListView_2)
    for i,cfg in ipairs(self.cfg[page1]) do
        local ui_item = GUI:Clone(self.ui.template_2)
        GUI:setVisible(ui_item,true)
        GUI:ListView_pushBackCustomItem(self.ui.ListView_2, ui_item)
        GUI:setName(ui_item,"btn2_switch_"..i)
        GUI:Button_setTitleText(ui_item, cfg.title)
        GUI:Win_SetParam(ui_item, i)
        GUI:addOnClickEvent(ui_item, function()
            self:updatePageBtn2(ui_item)
        end)
    end

    --默认选择
    self.page2 = nil
    self:updatePageBtn2(GUI:getChildByName(self.ui.ListView_2, "btn2_switch_1"))
end

--更新页签2
function HechengOBJ:updatePageBtn2(sender)
    --上一次选择按钮
    if self.page2 then
        local btn_switch = GUI:getChildByName(self.ui.ListView_2, "btn2_switch_"..self.page2)
        GUI:setTouchEnabled(btn_switch, true)
        GUI:Button_setTitleColor(btn_switch, ssrConstCfg.C3B_GRAY1)
    end
    --这一次选择按钮
    local page2 = GUI:Win_GetParam(sender)
    if page2 == self.page2 then return end
    self.page2 = page2
    local btn_switch = GUI:getChildByName(self.ui.ListView_2, "btn2_switch_"..self.page2)
    GUI:setTouchEnabled(btn_switch, false)
    GUI:Button_setTitleColor(btn_switch, ssrConstCfg.C3B_YELLOW1)
    self.page2 = page2

    SL:ScheduleOnce(function ()
        self:updatePageBtn3()
    end, 0.1)
end

function HechengOBJ:updatePageBtn3(sender)
    local page3 = 0
    if sender then
        page3 = GUI:Win_GetParam(sender)
        if page3 == self.page3 then return end
    else
        page3 = 1
    end
    local page3_List = GUI:getChildByName(self.ui.ListView_2, "ListView_3")
    if page3_List then
        local index = GUI:ListView_getItemIndex(self.ui.ListView_2, page3_List)
        GUI:ListView_removeItemByIndex(self.ui.ListView_2, index)
    end

    page3_List = GUI:Clone(self.ui.ListView_3)
    GUI:setVisible(page3_List,true)

    local size = GUI:getContentSize(page3_List)
    local pagedata = self.cfg[self.page1][self.page2]
    GUI:setContentSize(page3_List,size.width, size.height * #pagedata)
    GUI:ListView_insertCustomItem(self.ui.ListView_2, page3_List, self.page2)

    for i,cfg in ipairs(pagedata) do
        local ui_item = GUI:Clone(self.ui.template_3)
        GUI:setVisible(ui_item,true)
        GUI:ListView_pushBackCustomItem(page3_List, ui_item)
        GUI:setName(ui_item, "btn3_switch_"..i)
        GUI:Button_setTitleText(ui_item, SL:GetMetaValue("ITEM_NAME", cfg.product[1][1]))
        GUI:Win_SetParam(ui_item, i)
        GUI:Button_setBrightEx(ui_item, i ~= page3)
        GUI:addOnClickEvent(ui_item, function()
            self:updatePageBtn3(ui_item)
        end)
    end
    self.page3 = page3
    self:updateUI()
end

function HechengOBJ:updateUI()
    local handle,wnd
    --初始列表
    local tab = self.cfg[self.page1][self.page2][self.page3]
    local item_wnd = 0
    for j,items in ipairs(tab.itemid1) do
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
            if have_num >= need_num then
                need_str = ssrRTextCfg.get(20000, itemname,need_str)
            else
                need_str = ssrRTextCfg.get(20001, itemname,need_str)
            end
            local items_layout = self.ui.itemNeed1
            GUI:removeAllChildren(items_layout)
            local size = GUI:getContentSize(items_layout)
            handle = GUI:RichText_Create(items_layout, "txt", size.width/2, size.height/2, need_str, ssrConstCfg.width)
            GUI:setAnchorPoint(handle,0.5,0.5)
            local pro_str = ""
            pro_str = "<font color='#4AE74A' size='16'>成功率："..tab.probability/100 .."%</font>"
            items_layout = self.ui.itemPro
            GUI:removeAllChildren(items_layout)

            size = GUI:getContentSize(items_layout)
            handle = GUI:RichText_Create(items_layout, "txt", size.width/2, size.height/2, pro_str, ssrConstCfg.width)
            GUI:setAnchorPoint(handle,0.5,0.5)
        else
            item_wnd = item_wnd + 1
        end
    end

    if item_wnd == 1 then
        GUI:setVisible(self.ui.hechengWnd_1, true)
        GUI:setVisible(self.ui.hechengWnd_2, false)
        wnd = self.ui.hechengWnd_1
    elseif item_wnd == 2 then
        GUI:setVisible(self.ui.hechengWnd_1, false)
        GUI:setVisible(self.ui.hechengWnd_2, true)
        wnd = self.ui.hechengWnd_2
    end
    for i = 1,item_wnd do
        local need_str = ""
        local idx,need_num = tab.itemid1[i][1], tab.itemid1[i][2]
        local have_num = SL:GetMetaValue("ITEM_COUNT", idx)

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
        if have_num >= need_num then
            need_str = ssrRTextCfg.get(20007, need_str)
        else
            need_str = ssrRTextCfg.get(20008, need_str)
        end

        local itemBg = GUI:getChildByName(wnd,"item_bg"..i)
        GUI:removeAllChildren(itemBg)
        GUI:ItemShow_Create(itemBg, "item", 0, 0, {index = idx, look = true})

        local itemNum = GUI:getChildByName(wnd,"num_"..i)
        GUI:removeAllChildren(itemNum)
        local size = GUI:getContentSize(itemNum)
        handle = GUI:RichText_Create(itemNum, "txt", size.width/2, size.height/2, need_str, ssrConstCfg.width)
        GUI:setAnchorPoint(handle,0.5,0.5)
    end
    GUI:removeAllChildren(self.ui.item)
    GUI:ItemShow_Create(self.ui.item, "item", 0 , 0,{index = tab.product[1][1], look=true})
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--请求合成
function HechengOBJ:RequestHecheng()
    ssrMessage:sendmsg(ssrNetMsgCfg.Hecheng_RequestHecheng,self.cfg[self.page1][self.page2][self.page3].idx)
end

--响应合成
function HechengOBJ:HechengResponse()
    self:updateUI()
end

return HechengOBJ