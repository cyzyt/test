GonglueOBJ = {}

GonglueOBJ.__cname = "GonglueOBJ"

GonglueOBJ.cfg = ssrRequireCsvCfg("cfg_gonglue")


-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function GonglueOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, objcfg.UI_PATH)

    self._parent = parent
    self.ui = GUI:ui_delegate(parent)


	--关闭按钮
    GUI:addOnClickEvent(self.ui.btn_close, function()
        GUI:Win_Close(self._parent)
    end)

	--关闭背景
    GUI:addOnClickEvent(self.ui.bg_close, function()
        GUI:Win_Close(self._parent)
    end)


	GUI:setVisible(self.ui.template_1,false)
	GUI:setVisible(self.ui.template_2,false)

	self.page1 = nil

    --克隆按钮
    for i,cfg in ipairs(self.cfg) do
		local btn = GUI:Clone(self.ui.template_1)
		GUI:setVisible(btn,true)
		GUI:ListView_pushBackCustomItem(self.ui.ListView_1, btn)
		local ui_item=GUI:ListView_getItemByIndex(self.ui.ListView_1,i-1)
		GUI:setName(ui_item,"btn1_switch_"..i)
        ssrLabelString(ui_item, "tx_switch", cfg.typeName)
        local btn_switch = ssrSeekWidgetByName(ui_item, "btn_switch")
		GUI:addOnClickEvent(btn_switch, function()
			self:updatePageBtn1(i)
		end)

        if i == 1 then
            self:updatePageBtn1(1)
        end
    end
end

function GonglueOBJ:updatePageBtn1(tag)
	--上一次选择按钮
	if self.page1 then
		local ui_item = self.ui["btn1_switch_"..self.page1]
		local btn_switch = ssrSeekWidgetByName(ui_item, "btn_switch")     --关联按钮和内容

		-- btn_switch:setEnabled(true)
		GUI:setTouchEnabled(btn_switch, true)
		local tx_switch = ssrSeekWidgetByName(btn_switch, "tx_switch")
        GUI:Text_setTextColor(tx_switch, ssrConstCfg.C3B_GRAY1)
	end

	--这一次选择按钮
	local page1 = tag

	if page1 == self.page1 then return end

	local ui_item = self.ui["btn1_switch_"..page1]
	local btn_switch = ssrSeekWidgetByName(ui_item, "btn_switch")
	GUI:setTouchEnabled(btn_switch,false)
	local tx_switch = ssrSeekWidgetByName(btn_switch, "tx_switch")
	GUI:Text_setTextColor(tx_switch, ssrConstCfg.C3B_YELLOW2)
	self.page1 = page1
	self:updateDescUI()
end

--替换item_tips
local function item_tips_gsub(str,s_begin,s_end)
	local s_begin_Len = string.len(s_begin)
	while string.find(str, s_begin, 1) do
		local s_begin_x = string.find(str, s_begin, 1)
		local s_end_x = string.find(str, s_end, s_begin_x + 1)
		local itemidx = (string.sub(str, s_begin_x + s_begin_Len, s_end_x - 1))
		local item_tips = string.format("<a enableUnderline ='false' href = 'jump#item_tips#%s'><u>&<ITEM_NAME_COLOR/%s>&</u></a>", itemidx,itemidx)
		local temp_tips = string.format("itemID:%s&item", itemidx)
		str = string.gsub(str, temp_tips, item_tips)
	end
	return str
end

function GonglueOBJ:OnJumpToFind(param)
	local slices = SL:Split(param, "#")
	if slices[1] == "openwin" then
		ssrUIManager:OPENBYID(tonumber(slices[2]))
	elseif slices[1] == "findnpc" then
		self:RequestFindNpc(tonumber(slices[2]))
	end
end

function GonglueOBJ:updateDescUI()
	local item_page = 0
	local neirong = self.cfg[self.page1].text
	neirong = item_tips_gsub(neirong,"itemID:","&item")
	GUI:removeAllChildren(self.ui.ListView_2)
	local cfg_itemshow = self.cfg[self.page1].show
	if string.find(neirong, "<br>") then
		local jiushangquan = SL:Split(neirong, "<br>")
		for i, value in ipairs(jiushangquan) do
			local btn = GUI:Clone(self.ui.template_2)
			GUI:setVisible(btn,true)
			GUI:ListView_pushBackCustomItem(self.ui.ListView_2,btn)
			local ui_item = GUI:ListView_getItemByIndex( self.ui.ListView_2,i-1)
			GUI:setName(ui_item, "btn1_switch_"..i)
			local richText =GUI:RichText_Create(ui_item,"item",0,0,value,5000)
			GUI:setAnchorPoint(richText,0, 0)
			if value ~= "" then
				item_page = item_page + 1
				if cfg_itemshow and cfg_itemshow[item_page] then
					for j, idx in ipairs(cfg_itemshow[item_page]) do
						local itemshow = GUI:ItemShow_Create(ui_item, "item"..j,  - 20 + (65*j), -45, {index = idx, look=true})
						GUI:setScale(itemshow, 0.8)
					end
				end
			end
		end
	end
end
-------------------------------↓↓↓ 网络 消息 ↓↓↓---------------------------------------
--打开界面
function GonglueOBJ:OpenUI()
    ssrUIManager:OPEN(ssrObjCfg.Gonglue)
end

function GonglueOBJ:RequestFindNpc(npcidx)
    ssrMessage:sendmsg(ssrNetMsgCfg.Gonglue_RequestFindNpc,npcidx)
end

return GonglueOBJ