local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create la_bg
	local la_bg = GUI:Layout_Create(Layer, "la_bg", 0.00, 0.00, 1136.00, 640.00, false)
	GUI:Layout_setBackGroundColorType(la_bg, 1)
	GUI:Layout_setBackGroundColor(la_bg, "#000000")
	GUI:Layout_setBackGroundColorOpacity(la_bg, 102)
	GUI:setTouchEnabled(la_bg, true)
	GUI:setTag(la_bg, 285)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 236)

	-- Create img_bg
	local img_bg = GUI:Image_Create(nd_root, "img_bg", 30.00, -8.00, "res/custom/common/00128.png")
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg, true)
	GUI:setTag(img_bg, 237)

	-- Create tx_title
	local tx_title = GUI:Text_Create(img_bg, "tx_title", 71.00, 442.00, 20, "#d6c6ad", [[卡牌]])
	GUI:setAnchorPoint(tx_title, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 500)
	GUI:Text_enableOutline(tx_title, "#000000", 2)

	-- Create btn_close
	local btn_close = GUI:Button_Create(img_bg, "btn_close", 745.00, 454.00, "res/custom/common/btn_close_1_1.png")
	GUI:Button_loadTexturePressed(btn_close, "res/custom/common/btn_close_1_2.png")
	GUI:Button_setScale9Slice(btn_close, 11, 11, 11, 11)
	GUI:setContentSize(btn_close, 26, 42)
	GUI:setIgnoreContentAdaptWithSize(btn_close, false)
	GUI:Button_setTitleText(btn_close, "")
	GUI:Button_setTitleColor(btn_close, "#414146")
	GUI:Button_setTitleFontSize(btn_close, 14)
	GUI:Button_titleDisableOutLine(btn_close)
	GUI:setAnchorPoint(btn_close, 0.50, 0.50)
	GUI:setTouchEnabled(btn_close, true)
	GUI:setTag(btn_close, 238)

	-- Create nd_content
	local nd_content = GUI:Node_Create(img_bg, "nd_content", 0.00, 0.00)
	GUI:setAnchorPoint(nd_content, 0.50, 0.50)
	GUI:setTag(nd_content, 241)

	-- Create template
	local template = GUI:Button_Create(nd_content, "template", 75.00, 364.50, "res/custom/common/btn_3_1.png")
	GUI:Button_loadTexturePressed(template, "res/custom/common/btn_3_2.png")
	GUI:Button_loadTextureDisabled(template, "res/custom/common/btn_3_2.png")
	GUI:Button_setScale9Slice(template, 15, 15, 11, 11)
	GUI:setContentSize(template, 150, 35)
	GUI:setIgnoreContentAdaptWithSize(template, false)
	GUI:Button_setTitleText(template, "")
	GUI:Button_setTitleColor(template, "#787974")
	GUI:Button_setTitleFontSize(template, 14)
	GUI:Button_titleDisableOutLine(template)
	GUI:setAnchorPoint(template, 0.50, 0.50)
	GUI:setTouchEnabled(template, true)
	GUI:setTag(template, 276)
	GUI:setVisible(template, false)

	-- Create tx_switch
	local tx_switch = GUI:Text_Create(template, "tx_switch", 75.00, 18.00, 18, "#787974", [[页签1]])
	GUI:setAnchorPoint(tx_switch, 0.50, 0.50)
	GUI:setTouchEnabled(tx_switch, false)
	GUI:setTag(tx_switch, 277)
	GUI:Text_enableOutline(tx_switch, "#000000", 1)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(nd_content, "ListView_1", 38.00, 34.00, 150.00, 382.00, 1)
	GUI:ListView_setBackGroundColorType(ListView_1, 1)
	GUI:ListView_setBackGroundColor(ListView_1, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_1, 0)
	GUI:ListView_setGravity(ListView_1, 5)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 275)

	-- Create Image_6
	local Image_6 = GUI:Image_Create(nd_content, "Image_6", 190.00, 33.00, "res/custom/common/img_line_1.png")
	GUI:setContentSize(Image_6, 4, 383)
	GUI:setIgnoreContentAdaptWithSize(Image_6, false)
	GUI:setAnchorPoint(Image_6, 0.50, 0.00)
	GUI:setTouchEnabled(Image_6, false)
	GUI:setTag(Image_6, 145)

	-- Create forgeBg_layout
	local forgeBg_layout = GUI:Layout_Create(nd_content, "forgeBg_layout", 192.00, 33.00, 513.00, 384.00, true)
	GUI:Layout_setBackGroundColorType(forgeBg_layout, 1)
	GUI:Layout_setBackGroundColor(forgeBg_layout, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(forgeBg_layout, 0)
	GUI:setTouchEnabled(forgeBg_layout, true)
	GUI:setTag(forgeBg_layout, 278)

	-- Create forgeBg
	local forgeBg = GUI:Image_Create(forgeBg_layout, "forgeBg", -2.00, -26.00, "res/custom/forge/bg_szcf_01.jpg")
	GUI:Image_setScale9Slice(forgeBg, 44, 44, 3, 3)
	GUI:setContentSize(forgeBg, 492, 445)
	GUI:setIgnoreContentAdaptWithSize(forgeBg, false)
	GUI:setScaleX(forgeBg, 1.05)
	GUI:setScaleY(forgeBg, 1.05)
	GUI:setTouchEnabled(forgeBg, false)
	GUI:setTag(forgeBg, 672)

	-- Create tx_title
	local tx_title = GUI:Text_Create(forgeBg, "tx_title", 110.00, 270.00, 16, "#ffffff", [[]])
	GUI:setAnchorPoint(tx_title, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 673)
	GUI:Text_enableOutline(tx_title, "#000000", 1)

	-- Create itemNeed1
	local itemNeed1 = GUI:Layout_Create(forgeBg_layout, "itemNeed1", 88.00, 127.00, 160.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemNeed1, 1)
	GUI:Layout_setBackGroundColor(itemNeed1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemNeed1, 0)
	GUI:setTouchEnabled(itemNeed1, true)
	GUI:setTag(itemNeed1, 282)

	-- Create itemNeed2
	local itemNeed2 = GUI:Layout_Create(forgeBg_layout, "itemNeed2", 270.00, 130.00, 160.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemNeed2, 1)
	GUI:Layout_setBackGroundColor(itemNeed2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemNeed2, 0)
	GUI:setTouchEnabled(itemNeed2, true)
	GUI:setTag(itemNeed2, 281)

	-- Create itemNeed3
	local itemNeed3 = GUI:Layout_Create(forgeBg_layout, "itemNeed3", 184.00, 100.00, 160.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemNeed3, 1)
	GUI:Layout_setBackGroundColor(itemNeed3, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemNeed3, 0)
	GUI:setTouchEnabled(itemNeed3, true)
	GUI:setTag(itemNeed3, 280)

	-- Create itemPro
	local itemPro = GUI:Layout_Create(forgeBg_layout, "itemPro", 224.00, 70.00, 80.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemPro, 1)
	GUI:Layout_setBackGroundColor(itemPro, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemPro, 0)
	GUI:setTouchEnabled(itemPro, true)
	GUI:setTag(itemPro, 279)

	-- Create Item_1
	local Item_1 = GUI:Layout_Create(forgeBg_layout, "Item_1", 225.00, 306.00, 62.00, 62.00, false)
	GUI:Layout_setBackGroundColorType(Item_1, 1)
	GUI:Layout_setBackGroundColor(Item_1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(Item_1, 0)
	GUI:setTouchEnabled(Item_1, true)
	GUI:setTag(Item_1, 283)

	-- Create Item_2
	local Item_2 = GUI:Layout_Create(forgeBg_layout, "Item_2", 137.00, 158.00, 62.00, 62.00, false)
	GUI:Layout_setBackGroundColorType(Item_2, 1)
	GUI:Layout_setBackGroundColor(Item_2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(Item_2, 0)
	GUI:setTouchEnabled(Item_2, true)
	GUI:setTag(Item_2, 284)

	-- Create Item_3
	local Item_3 = GUI:Layout_Create(forgeBg_layout, "Item_3", 313.00, 158.00, 62.00, 62.00, false)
	GUI:Layout_setBackGroundColorType(Item_3, 1)
	GUI:Layout_setBackGroundColor(Item_3, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(Item_3, 0)
	GUI:setTouchEnabled(Item_3, true)
	GUI:setTag(Item_3, 285)

	-- Create btn_go_activity
	local btn_go_activity = GUI:Button_Create(nd_content, "btn_go_activity", 455.00, 70.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(btn_go_activity, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(btn_go_activity, 15, 15, 11, 11)
	GUI:setContentSize(btn_go_activity, 122, 34)
	GUI:setIgnoreContentAdaptWithSize(btn_go_activity, false)
	GUI:Button_setTitleText(btn_go_activity, "")
	GUI:Button_setTitleColor(btn_go_activity, "#42311c")
	GUI:Button_setTitleFontSize(btn_go_activity, 18)
	GUI:Button_titleDisableOutLine(btn_go_activity)
	GUI:setAnchorPoint(btn_go_activity, 0.50, 0.50)
	GUI:setTouchEnabled(btn_go_activity, true)
	GUI:setTag(btn_go_activity, 216)

	-- Create Text_14
	local Text_14 = GUI:Text_Create(btn_go_activity, "Text_14", 61.00, 17.00, 18, "#ffff00", [[锻  造]])
	GUI:setAnchorPoint(Text_14, 0.50, 0.50)
	GUI:setTouchEnabled(Text_14, false)
	GUI:setTag(Text_14, 547)
	GUI:Text_enableOutline(Text_14, "#000000", 1)
end
return ui