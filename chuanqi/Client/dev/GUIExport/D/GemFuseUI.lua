local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 11)

	-- Create img_di
	local img_di = GUI:Layout_Create(nd_root, "img_di", 87.00, -33.00, 734.00, 447.00, false)
	GUI:Layout_setBackGroundColorType(img_di, 1)
	GUI:Layout_setBackGroundColor(img_di, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(img_di, 0)
	GUI:setAnchorPoint(img_di, 0.60, 0.50)
	GUI:setTouchEnabled(img_di, false)
	GUI:setTag(img_di, 310)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(img_di, "Image_1", 188.00, 0.00, "res/custom/common/img_line_1.png")
	GUI:setAnchorPoint(Image_1, 0.50, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 277)

	-- Create ListView_2
	local ListView_2 = GUI:ListView_Create(img_di, "ListView_2", 194.00, 1.00, 535.00, 440.00, 1)
	GUI:ListView_setBackGroundColorType(ListView_2, 1)
	GUI:ListView_setBackGroundColor(ListView_2, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_2, 0)
	GUI:ListView_setGravity(ListView_2, 5)
	GUI:setTouchEnabled(ListView_2, true)
	GUI:ListView_setBounceEnabled(ListView_2, true)
	GUI:setTag(ListView_2, 343)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(img_di, "ListView_1", 9.00, 0.00, 170.00, 444.00, 1)
	GUI:ListView_setBackGroundColorType(ListView_1, 1)
	GUI:ListView_setBackGroundColor(ListView_1, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_1, 0)
	GUI:ListView_setGravity(ListView_1, 5)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 306)

	-- Create templist
	local templist = GUI:Layout_Create(img_di, "templist", 197.00, 291.00, 580.00, 160.00, false)
	GUI:Layout_setBackGroundColorType(templist, 1)
	GUI:Layout_setBackGroundColor(templist, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(templist, 0)
	GUI:setTouchEnabled(templist, true)
	GUI:setTag(templist, 352)

	-- Create img_1
	local img_1 = GUI:Image_Create(templist, "img_1", 138.00, 79.00, "res/custom/common/img_bg_3.png")
	GUI:setContentSize(img_1, 250, 150)
	GUI:setIgnoreContentAdaptWithSize(img_1, false)
	GUI:setAnchorPoint(img_1, 0.50, 0.50)
	GUI:setTouchEnabled(img_1, false)
	GUI:setTag(img_1, 353)

	-- Create itemNeed1
	local itemNeed1 = GUI:Layout_Create(img_1, "itemNeed1", 80.00, 87.00, 150.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemNeed1, 1)
	GUI:Layout_setBackGroundColor(itemNeed1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemNeed1, 0)
	GUI:setTouchEnabled(itemNeed1, true)
	GUI:setTag(itemNeed1, 354)

	-- Create itemNeed2
	local itemNeed2 = GUI:Layout_Create(img_1, "itemNeed2", 80.00, 66.00, 150.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemNeed2, 1)
	GUI:Layout_setBackGroundColor(itemNeed2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemNeed2, 0)
	GUI:setTouchEnabled(itemNeed2, true)
	GUI:setTag(itemNeed2, 355)

	-- Create itemNeed3
	local itemNeed3 = GUI:Layout_Create(img_1, "itemNeed3", 80.00, 45.00, 150.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemNeed3, 1)
	GUI:Layout_setBackGroundColor(itemNeed3, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemNeed3, 0)
	GUI:setTouchEnabled(itemNeed3, true)
	GUI:setTag(itemNeed3, 356)

	-- Create itemPro
	local itemPro = GUI:Layout_Create(img_1, "itemPro", 12.00, 22.00, 80.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemPro, 1)
	GUI:Layout_setBackGroundColor(itemPro, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemPro, 0)
	GUI:setTouchEnabled(itemPro, true)
	GUI:setTag(itemPro, 357)

	-- Create itemBtn
	local itemBtn = GUI:Button_Create(img_1, "itemBtn", 153.00, 31.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(itemBtn, "res/custom/common/btn_2_2.png")
	GUI:Button_loadTextureDisabled(itemBtn, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(itemBtn, 15, 15, 11, 11)
	GUI:setContentSize(itemBtn, 80, 25)
	GUI:setIgnoreContentAdaptWithSize(itemBtn, false)
	GUI:Button_setTitleText(itemBtn, "")
	GUI:Button_setTitleColor(itemBtn, "#c7c095")
	GUI:Button_setTitleFontSize(itemBtn, 14)
	GUI:Button_titleEnableOutline(itemBtn, "#000000", 1)
	GUI:setAnchorPoint(itemBtn, 0.50, 0.50)
	GUI:setTouchEnabled(itemBtn, true)
	GUI:setTag(itemBtn, 358)

	-- Create Text_10
	local Text_10 = GUI:Text_Create(itemBtn, "Text_10", 38.00, 13.00, 14, "#ffff00", [[合  成]])
	GUI:setAnchorPoint(Text_10, 0.50, 0.50)
	GUI:setTouchEnabled(Text_10, false)
	GUI:setTag(Text_10, 377)
	GUI:Text_enableOutline(Text_10, "#000000", 1)

	-- Create itemName
	local itemName = GUI:Text_Create(img_1, "itemName", 127.00, 126.00, 16, "#ccad35", [[测试道具名测试道具名]])
	GUI:setAnchorPoint(itemName, 0.50, 0.50)
	GUI:setTouchEnabled(itemName, false)
	GUI:setTag(itemName, 359)
	GUI:Text_enableOutline(itemName, "#000000", 1)

	-- Create itemBg
	local itemBg = GUI:Image_Create(img_1, "itemBg", 51.00, 74.00, "res/custom/common/img_cell_1.png")
	GUI:setContentSize(itemBg, 50, 50)
	GUI:setIgnoreContentAdaptWithSize(itemBg, false)
	GUI:setAnchorPoint(itemBg, 0.50, 0.50)
	GUI:setTouchEnabled(itemBg, false)
	GUI:setTag(itemBg, 360)

	-- Create img_2
	local img_2 = GUI:Image_Create(templist, "img_2", 397.00, 79.00, "res/custom/common/img_bg_3.png")
	GUI:setContentSize(img_2, 250, 150)
	GUI:setIgnoreContentAdaptWithSize(img_2, false)
	GUI:setAnchorPoint(img_2, 0.50, 0.50)
	GUI:setTouchEnabled(img_2, false)
	GUI:setTag(img_2, 492)

	-- Create itemNeed1
	local itemNeed1 = GUI:Layout_Create(img_2, "itemNeed1", 80.00, 87.00, 150.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemNeed1, 1)
	GUI:Layout_setBackGroundColor(itemNeed1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemNeed1, 0)
	GUI:setTouchEnabled(itemNeed1, true)
	GUI:setTag(itemNeed1, 493)

	-- Create itemNeed2
	local itemNeed2 = GUI:Layout_Create(img_2, "itemNeed2", 80.00, 66.00, 150.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemNeed2, 1)
	GUI:Layout_setBackGroundColor(itemNeed2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemNeed2, 0)
	GUI:setTouchEnabled(itemNeed2, true)
	GUI:setTag(itemNeed2, 494)

	-- Create itemNeed3
	local itemNeed3 = GUI:Layout_Create(img_2, "itemNeed3", 80.00, 45.00, 150.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemNeed3, 1)
	GUI:Layout_setBackGroundColor(itemNeed3, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemNeed3, 0)
	GUI:setTouchEnabled(itemNeed3, true)
	GUI:setTag(itemNeed3, 495)

	-- Create itemPro
	local itemPro = GUI:Layout_Create(img_2, "itemPro", 12.00, 22.00, 80.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemPro, 1)
	GUI:Layout_setBackGroundColor(itemPro, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemPro, 0)
	GUI:setTouchEnabled(itemPro, true)
	GUI:setTag(itemPro, 496)

	-- Create itemBtn
	local itemBtn = GUI:Button_Create(img_2, "itemBtn", 153.00, 31.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(itemBtn, "res/custom/common/btn_2_2.png")
	GUI:Button_loadTextureDisabled(itemBtn, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(itemBtn, 15, 15, 11, 11)
	GUI:setContentSize(itemBtn, 80, 25)
	GUI:setIgnoreContentAdaptWithSize(itemBtn, false)
	GUI:Button_setTitleText(itemBtn, "")
	GUI:Button_setTitleColor(itemBtn, "#c7c095")
	GUI:Button_setTitleFontSize(itemBtn, 14)
	GUI:Button_titleEnableOutline(itemBtn, "#000000", 1)
	GUI:setAnchorPoint(itemBtn, 0.50, 0.50)
	GUI:setTouchEnabled(itemBtn, true)
	GUI:setTag(itemBtn, 497)

	-- Create Text_10
	local Text_10 = GUI:Text_Create(itemBtn, "Text_10", 38.00, 13.00, 14, "#ffff00", [[合  成]])
	GUI:setAnchorPoint(Text_10, 0.50, 0.50)
	GUI:setTouchEnabled(Text_10, false)
	GUI:setTag(Text_10, 498)
	GUI:Text_enableOutline(Text_10, "#000000", 1)

	-- Create itemName
	local itemName = GUI:Text_Create(img_2, "itemName", 127.00, 126.00, 16, "#ccad35", [[测试道具名测试道具名]])
	GUI:setAnchorPoint(itemName, 0.50, 0.50)
	GUI:setTouchEnabled(itemName, false)
	GUI:setTag(itemName, 499)
	GUI:Text_enableOutline(itemName, "#000000", 1)

	-- Create itemBg
	local itemBg = GUI:Image_Create(img_2, "itemBg", 51.00, 74.00, "res/custom/common/img_cell_1.png")
	GUI:setContentSize(itemBg, 50, 50)
	GUI:setIgnoreContentAdaptWithSize(itemBg, false)
	GUI:setAnchorPoint(itemBg, 0.50, 0.50)
	GUI:setTouchEnabled(itemBg, false)
	GUI:setTag(itemBg, 500)

	-- Create template
	local template = GUI:Button_Create(img_di, "template", 85.00, 424.00, "res/custom/common/btn_3_1.png")
	GUI:Button_loadTexturePressed(template, "res/custom/common/btn_3_2.png")
	GUI:Button_loadTextureDisabled(template, "res/custom/common/btn_3_2.png")
	GUI:Button_setScale9Slice(template, 15, 15, 11, 11)
	GUI:setContentSize(template, 170, 40)
	GUI:setIgnoreContentAdaptWithSize(template, false)
	GUI:Button_setTitleText(template, "")
	GUI:Button_setTitleColor(template, "#414146")
	GUI:Button_setTitleFontSize(template, 14)
	GUI:Button_titleDisableOutLine(template)
	GUI:setAnchorPoint(template, 0.50, 0.50)
	GUI:setTouchEnabled(template, true)
	GUI:setTag(template, 307)

	-- Create tx_switch
	local tx_switch = GUI:Text_Create(template, "tx_switch", 85.00, 20.00, 18, "#787974", [[页签]])
	GUI:setAnchorPoint(tx_switch, 0.50, 0.50)
	GUI:setTouchEnabled(tx_switch, false)
	GUI:setTag(tx_switch, 308)
	GUI:Text_enableOutline(tx_switch, "#000000", 1)
end
return ui