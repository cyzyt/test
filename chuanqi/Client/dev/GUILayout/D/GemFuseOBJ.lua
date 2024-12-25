GemFuseOBJ = {}

GemFuseOBJ.__cname = "GemFuseOBJ"

GemFuseOBJ.cfg = {}


local cfg_compound = ssrRequireCsvCfg("cfg_compound")
for k,v in ipairs(cfg_compound) do
    if v.npcid then
        if v.npcid == 249 then
            GemFuseOBJ.cfg[v.page2] = GemFuseOBJ.cfg[v.page2] or {title = v.name2}
            GemFuseOBJ.cfg[v.page2][v.page3] = GemFuseOBJ.cfg[v.page2][v.page3] or {}
            GemFuseOBJ.cfg[v.page2][v.page3] = {
                idx = k,type = v.type,page2 = v.page2,page3 = v.page3,
                itemid1 = v.itemid1,product = v.product,name = v.name,probability = v.probability,
            }
            if v.type == 2 then
                if v.itemid1[1][1] == v.itemid1[2][1] then
                    GemFuseOBJ.cfg[v.page2][v.page3].itemid1[1][2] = GemFuseOBJ.cfg[v.page2][v.page3].itemid1[1][2] + v.itemid1[2][2]
                    table.remove(GemFuseOBJ.cfg[v.page2][v.page3].itemid1,2)
                end
            end
        end
    end
end

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function GemFuseOBJ:main(objcfg,data,parent_ui)
    self.ui = parent_ui
    --将子页面加载进父页面nd_module容器中
    GUI:LoadExport(self.ui.nd_module, objcfg.UI_PATH)

    --居中
    local pos = GUI:getPosition(self.ui.nd_root)
    GUI:setPosition(self.ui.Layer,-pos.x, -pos.y)

    GUI:setVisible(self.ui.template,false)
    GUI:setVisible(self.ui.templist,false)

	local oneItem
    for i,cfg in ipairs(self.cfg) do
        local ui_item = GUI:Clone(self.ui.template)
        GUI:addChild(self.ui.ListView_1,ui_item)
        GUI:setName(ui_item, "btn1_switch_"..i)
        GUI:setVisible(ui_item,true)

        ssrLabelString(ui_item, "tx_switch", cfg.title)

		GUI:addOnClickEvent(ui_item, function()
			self:updatePageBtn1(ui_item)
		end)

		GUI:setTag(ui_item, i)
        --默认选择
        if i == 1 then
			oneItem = ui_item
        end
    end

	self.page2 = nil
	if oneItem then
		self:updatePageBtn1(oneItem)
	end
end

--更新页签1
function GemFuseOBJ:updatePageBtn1(sender)
    --上一次选择按钮
    if self.page2 then
        local btn_switch = self.ui["btn1_switch_"..self.page2]
        GUI:setEnabled(btn_switch,true)
        local tx_switch = ssrSeekWidgetByName(btn_switch, "tx_switch")
        GUI:Text_setTextColor(tx_switch, ssrConstCfg.C3B_GRAY1)
    end
    --这一次选择按钮
    local page2 = GUI:getTag(sender)

    if page2 == self.page2 then return end

    local btn_switch = self.ui["btn1_switch_"..page2]
    GUI:setEnabled(btn_switch,false)
    local tx_switch = ssrSeekWidgetByName(btn_switch, "tx_switch")
    GUI:Text_setTextColor(tx_switch, ssrConstCfg.C3B_YELLOW1)
    self.page2 = page2

    self:updateUI()
end

function GemFuseOBJ:updateUI()
    self.ui.ListView_2:removeAllChildren()
    --初始列表

    local cfg = self.cfg[self.page2]
    local max = #cfg
    local limit = 2
    local num = math.ceil(max/limit)
    for i = 1,num do
        local ui_item = GUI:Clone(self.ui.templist)
        GUI:addChild(self.ui.ListView_2,ui_item)
        GUI:setName(ui_item, "btn2_switch_"..i)
        GUI:setVisible(ui_item,true)
        --最后一个item 隐藏不需要的按钮
        if i==num then
            local manynum = max%limit
            if manynum > 0 then
                manynum = manynum + 1
                for begin=manynum, limit do
                    ssrSeekWidgetByName(ui_item, "img_"..begin):hide()
                end
            end
        end

        for j=1,limit do
            local img = ssrSeekWidgetByName(ui_item, "img_"..j)
            local index = (i-1)*limit+j
            GUI:setName(img,"img_"..index)
        end
    end

    for i,tab in ipairs(cfg) do
        local img = ssrSeekWidgetByName(self.ui.ListView_2, "img_"..i)
        --名字
        ssrLabelString(img, "itemName", SL:GetMetaValue("ITEM_NAME", tab.product[1][1]))

        --物品展示
        local txImgInfo = ssrSeekWidgetByName(img, "itemBg")
        GUI:ItemShow_Create(txImgInfo, "item", -5, -5, {index = tab.product[1][1], look=true})

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
            else
                need_str = need_num
            end
            if have_num >= need_num then
                need_str = ssrRTextCfg.get(20003, itemname,need_str)
            else
                need_str = ssrRTextCfg.get(20004, itemname,need_str)
            end
            local items_layout = ssrSeekWidgetByName(img, "itemNeed"..j)
            GUI:removeAllChildren(items_layout)
            local size = GUI:getContentSize(items_layout)
            local rich = GUI:RichText_Create(items_layout, "txt", size.width/2, size.height/3, need_str, ssrConstCfg.width) 
            GUI:setAnchorPoint(rich, 0.50, 0.50)
            if #tab.itemid1 == 2 then
                local pos = GUI:getPosition(items_layout)
                GUI:setPosition(items_layout, pos.x,pos.y - 10)
            end
        end

        local pro_str = ""
        pro_str = "<font color='#4AE74A' size='13'>成功率："..tab.probability/100 .."%</font>"
        local items_layout = ssrSeekWidgetByName(img, "itemPro")
        GUI:removeAllChildren(items_layout)
        local size = GUI:getContentSize(items_layout)
        local rich = GUI:RichText_Create(items_layout, "txt", size.width/2, size.height/4, pro_str, ssrConstCfg.width)
        GUI:setAnchorPoint(rich, 0.50, 0.50)
		local widget = ssrSeekWidgetByName(img, "itemBtn")
		GUI:addOnClickEvent(widget, function()
			local page3 = GUI:getTag(widget)
			self:RequestHecheng(page3)
		end)
		GUI:setTag(widget, i)

    end
    self:searchesNum()
end

function GemFuseOBJ:searchesNum()
    local cfg = self.cfg[self.page2]
    for i,tab in ipairs(cfg) do
        local img = ssrSeekWidgetByName(self.ui.ListView_2, "img_"..i)
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
            else
                need_str = need_num
            end
            if have_num >= need_num then
                need_str = ssrRTextCfg.get(20003, itemname,need_str)
            else
                need_str = ssrRTextCfg.get(20004, itemname,need_str)
            end
            local items_layout = ssrSeekWidgetByName(img, "itemNeed"..j)
            GUI:removeAllChildren(items_layout)
            local size = GUI:getContentSize(items_layout)
            local rich = GUI:RichText_Create(items_layout, "txt", size.width/2, size.height/2, need_str, ssrConstCfg.width)
            GUI:setAnchorPoint(rich, 0.50, 0.50)
        end
    end
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--合成
function GemFuseOBJ:RequestHecheng(page3)
    ssrMessage:sendmsg(ssrNetMsgCfg.GemFuse_RequestHecheng,self.cfg[self.page2][page3].idx)
end
function GemFuseOBJ:HechengResponse()
    self:searchesNum()
end
-------------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------
return GemFuseOBJ