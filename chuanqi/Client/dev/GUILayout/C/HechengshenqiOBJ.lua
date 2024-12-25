HechengshenqiOBJ = {}

HechengshenqiOBJ.__cname = "HechengshenqiOBJ"

HechengshenqiOBJ.cfg_compound = ssrRequireCsvCfg("cfg_Simplecompound")

HechengshenqiOBJ.cfg = {}


-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HechengshenqiOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, objcfg.UI_PATH)

    self._parent = parent
    self.ui = GUI:ui_delegate(parent)

    ssrListViewTemplate(self.ui.ListView_1,"template")

    --关闭按钮
    GUI:addOnClickEvent(self.ui.btn_close, function()
        GUI:Win_Close(self._parent)
    end)

    --关闭背景
    GUI:addOnClickEvent(self.ui.la_bg, function()
        GUI:Win_Close(self._parent)
    end)

    GUI:addOnClickEvent(self.ui.btn_go, function()
        self:RequestHecheng()
    end)

    local num = 1
    for k,v in ipairs(self.cfg_compound) do
        if v.type == 1 then
            self.cfg[num] = v
            v.idx=k
            num = num + 1
        end
    end

    for i,cfg in ipairs(self.cfg) do
        local btn = GUI:Clone(self.ui.template)
        GUI:setVisible(btn,true)
        GUI:ListView_pushBackCustomItem(self.ui.ListView_1,btn)
        local ui_item = GUI:ListView_getItemByIndex(self.ui.ListView_1, i-1)
        GUI:setName( ui_item,"btn1_switch_"..i)
        ssrLabelString(ui_item, "tx_switch", cfg.name2)

        --关闭按钮
        GUI:addOnClickEvent(ui_item, function()
            self:updateUI(i)
        end)

        --默认选择
        if i == 1 then
            self:updateUI(i)
        end
    end
end


function HechengshenqiOBJ:updateUI(page)
    --初始列表
    if self.btn then
        local btn_switch = self.ui["btn1_switch_"..self.btn]
        -- btn_switch:setEnabled(true)
        GUI:setTouchEnabled(btn_switch,true)
        local tx_switch = ssrSeekWidgetByName(btn_switch, "tx_switch")
        GUI:Text_setTextColor(tx_switch, ssrConstCfg.C3B_GRAY1)
    end
    
    local btn_switch = self.ui["btn1_switch_"..page]
    -- btn_switch:setEnabled(false)
    GUI:setTouchEnabled(btn_switch,false)
    local tx_switch = ssrSeekWidgetByName(btn_switch, "tx_switch")
    GUI:Text_setTextColor(tx_switch, ssrConstCfg.C3B_YELLOW1)
       
    local tab = self.cfg[page]
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
            local size = items_layout:getContentSize()
            GUI:RichText_Create(items_layout, "txt", size.width/2, size.height/2, need_str, ssrConstCfg.width)
    
            local pro_str = ""
            pro_str = "<font color='#4AE74A' size='16'>成功率："..tab.probability/100 .."%</font>"
            items_layout = self.ui.itemPro
            GUI:removeAllChildren(items_layout)
            local size = items_layout:getContentSize()
            GUI:RichText_Create(items_layout, "txt", size.width/2, size.height/2, pro_str, ssrConstCfg.width)
        else
            item_wnd = item_wnd + 1
        end
    end

    local wnd
    if item_wnd == 1 then
        -- self.ui.hechengWnd_1:show()
        GUI:setVisible(self.ui.hechengWnd_1,true)
        -- self.ui.hechengWnd_2:hide(false)
        GUI:setVisible(self.ui.hechengWnd_2,false)
        wnd = self.ui.hechengWnd_1
    elseif item_wnd == 2 then
        --self.ui.hechengWnd_1:setVisible(false)
        GUI:setVisible(self.ui.hechengWnd_1,false)
        --self.ui.hechengWnd_2:setVisible(true)
        GUI:setVisible(self.ui.hechengWnd_2,true)
        wnd = self.ui.hechengWnd_2
    end
    for i = 1,item_wnd do
        local need_str = ""
        local idx,need_num = tab.itemid1[i][1], tab.itemid1[i][2]
        local have_num = SL:GetMetaValue("ITEM_COUNT", idx)
        local itemname = SL:GetMetaValue("ITEM_NAME", idx)

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
        local itemshow =GUI:ItemShow_Create(itemBg, "item", 0, 0,{index = idx, look=true})

        local itemNum = GUI:getChildByName(wnd,"num_"..i)
        GUI:removeAllChildren(itemNum)
        local size = GUI:getContentSize(itemNum)
        GUI:RichText_Create(itemNum, "txt", size.width/2, size.height/2, need_str, ssrConstCfg.width)
    end
    GUI:removeAllChildren(self.ui.item)
    local itemshow =GUI:ItemShow_Create(self.ui.item, "item", 0, 0,{index = tab.product[1][1], look=true})
    ssrAddChildCentrePos(self.ui.item, itemshow)
    self.btn = page
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------


--打开界面
function HechengshenqiOBJ:OpenUI()
    --self:OpenLayer()
end

--合成
function HechengshenqiOBJ:RequestHecheng()
    local btn = self.btn or 1
    local idx = self.cfg[btn].idx
    ssrMessage:sendmsg(ssrNetMsgCfg.Hechengshenqi_RequestHecheng,idx,btn)
end

function HechengshenqiOBJ:HechengResponse(btn)
    if not btn then return end
    self:updateUI(btn)
end

return HechengshenqiOBJ