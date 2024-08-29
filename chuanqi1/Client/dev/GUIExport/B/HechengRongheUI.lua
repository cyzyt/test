local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create la_bg
	local la_bg = GUI:Layout_Create(Layer, "la_bg", 1.00, 0.00, 1136.00, 640.00, false)
	GUI:Layout_setBackGroundColorType(la_bg, 1)
	GUI:Layout_setBackGroundColor(la_bg, "#000000")
	GUI:Layout_setBackGroundColorOpacity(la_bg, 102)
	GUI:setTouchEnabled(la_bg, true)
	GUI:setTag(la_bg, 19)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 11)

	-- Create img_bg
	local img_bg = GUI:Image_Create(nd_root, "img_bg", 9.00, 2.00, "res/custom/common/00128.png")
	GUI:setContentSize(img_bg, 852, 620)
	GUI:setIgnoreContentAdaptWithSize(img_bg, false)
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg, false)
	GUI:setTag(img_bg, 12)

	-- Create tx_title
	local tx_title = GUI:Text_Create(img_bg, "tx_title", 108.00, 509.00, 20, "#d6c6ad", [[神装融合]])
	GUI:setAnchorPoint(tx_title, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 73)
	GUI:Text_enableOutline(tx_title, "#000000", 2)

	-- Create btn_close
	local btn_close = GUI:Button_Create(img_bg, "btn_close", 859.00, 531.00, "res/custom/common/btn_close_1_1.png")
	GUI:Button_loadTexturePressed(btn_close, "res/custom/common/btn_close_1_2.png")
	GUI:Button_setScale9Slice(btn_close, 8, 8, 11, 11)
	GUI:setContentSize(btn_close, 26, 42)
	GUI:setIgnoreContentAdaptWithSize(btn_close, false)
	GUI:Button_setTitleText(btn_close, "")
	GUI:Button_setTitleColor(btn_close, "#414146")
	GUI:Button_setTitleFontSize(btn_close, 14)
	GUI:Button_titleDisableOutLine(btn_close)
	GUI:setAnchorPoint(btn_close, 0.50, 0.50)
	GUI:setTouchEnabled(btn_close, true)
	GUI:setTag(btn_close, 14)

	-- Create img_di
	local img_di = GUI:Image_Create(img_bg, "img_di", 182.00, 257.00, "res/custom/common/img_line_1.png")
	GUI:setAnchorPoint(img_di, 0.50, 0.50)
	GUI:setScaleY(img_di, 0.99)
	GUI:setTouchEnabled(img_di, false)
	GUI:setTag(img_di, 586)

	-- Create img_di_0
	local img_di_0 = GUI:Image_Create(img_bg, "img_di_0", 496.00, 95.00, "res/custom/common/img_line_2.png")
	GUI:setAnchorPoint(img_di_0, 0.50, 0.50)
	GUI:setScaleX(img_di_0, 1.02)
	GUI:setScaleY(img_di_0, 0.99)
	GUI:setTouchEnabled(img_di_0, false)
	GUI:setTag(img_di_0, 103)

	-- Create templist
	local templist = GUI:Layout_Create(nd_root, "templist", -226.00, -1.00, 620.00, 170.00, false)
	GUI:Layout_setBackGroundColorType(templist, 1)
	GUI:Layout_setBackGroundColor(templist, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(templist, 0)
	GUI:setTouchEnabled(templist, true)
	GUI:setTag(templist, 17)

	-- Create img_1
	local img_1 = GUI:Image_Create(templist, "img_1", 156.00, 87.00, "res/custom/common/img_bg_3.png")
	GUI:setAnchorPoint(img_1, 0.50, 0.50)
	GUI:setTouchEnabled(img_1, false)
	GUI:setTag(img_1, 180)

	-- Create itemNeed1
	local itemNeed1 = GUI:Layout_Create(img_1, "itemNeed1", 106.00, 99.00, 160.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemNeed1, 1)
	GUI:Layout_setBackGroundColor(itemNeed1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemNeed1, 0)
	GUI:setTouchEnabled(itemNeed1, true)
	GUI:setTag(itemNeed1, 554)

	-- Create itemNeed2
	local itemNeed2 = GUI:Layout_Create(img_1, "itemNeed2", 106.00, 76.00, 160.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemNeed2, 1)
	GUI:Layout_setBackGroundColor(itemNeed2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemNeed2, 0)
	GUI:setTouchEnabled(itemNeed2, true)
	GUI:setTag(itemNeed2, 555)

	-- Create itemNeed3
	local itemNeed3 = GUI:Layout_Create(img_1, "itemNeed3", 106.00, 54.00, 160.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemNeed3, 1)
	GUI:Layout_setBackGroundColor(itemNeed3, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemNeed3, 0)
	GUI:setTouchEnabled(itemNeed3, true)
	GUI:setTag(itemNeed3, 100)

	-- Create itemPro
	local itemPro = GUI:Layout_Create(img_1, "itemPro", 18.00, 28.00, 80.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemPro, 1)
	GUI:Layout_setBackGroundColor(itemPro, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemPro, 0)
	GUI:setTouchEnabled(itemPro, true)
	GUI:setTag(itemPro, 97)

	-- Create itemName
	local itemName = GUI:Text_Create(img_1, "itemName", 143.00, 143.00, 16, "#ccad35", [[测试道具名测试道具名]])
	GUI:setAnchorPoint(itemName, 0.50, 0.50)
	GUI:setTouchEnabled(itemName, false)
	GUI:setTag(itemName, 18)
	GUI:Text_enableOutline(itemName, "#000000", 1)

	-- Create itemBg
	local itemBg = GUI:Image_Create(img_1, "itemBg", 49.00, 91.00, "res/custom/common/img_cell_1.png")
	GUI:setContentSize(itemBg, 50, 50)
	GUI:setIgnoreContentAdaptWithSize(itemBg, false)
	GUI:setAnchorPoint(itemBg, 0.50, 0.50)
	GUI:setTouchEnabled(itemBg, false)
	GUI:setTag(itemBg, 550)

	-- Create itemBtn
	local itemBtn = GUI:Button_Create(img_1, "itemBtn", 186.00, 32.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(itemBtn, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(itemBtn, 15, 15, 11, 11)
	GUI:setContentSize(itemBtn, 125, 39)
	GUI:setIgnoreContentAdaptWithSize(itemBtn, false)
	GUI:Button_setTitleText(itemBtn, "")
	GUI:Button_setTitleColor(itemBtn, "#414146")
	GUI:Button_setTitleFontSize(itemBtn, 14)
	GUI:Button_titleDisableOutLine(itemBtn)
	GUI:setAnchorPoint(itemBtn, 0.50, 0.50)
	GUI:setScaleX(itemBtn, 0.70)
	GUI:setScaleY(itemBtn, 0.70)
	GUI:setTouchEnabled(itemBtn, true)
	GUI:setTag(itemBtn, 568)

	-- Create Text_14
	local Text_14 = GUI:Text_Create(itemBtn, "Text_14", 62.00, 18.00, 20, "#ffff00", [[合  成]])
	GUI:setAnchorPoint(Text_14, 0.50, 0.50)
	GUI:setTouchEnabled(Text_14, false)
	GUI:setTag(Text_14, 569)
	GUI:Text_enableOutline(Text_14, "#000000", 1)

	-- Create img_2
	local img_2 = GUI:Image_Create(templist, "img_2", 462.00, 87.00, "res/custom/common/img_bg_3.png")
	GUI:setAnchorPoint(img_2, 0.50, 0.50)
	GUI:setTouchEnabled(img_2, false)
	GUI:setTag(img_2, 570)

	-- Create itemNeed1
	local itemNeed1 = GUI:Layout_Create(img_2, "itemNeed1", 106.00, 99.00, 160.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemNeed1, 1)
	GUI:Layout_setBackGroundColor(itemNeed1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemNeed1, 0)
	GUI:setTouchEnabled(itemNeed1, true)
	GUI:setTag(itemNeed1, 571)

	-- Create itemNeed2
	local itemNeed2 = GUI:Layout_Create(img_2, "itemNeed2", 106.00, 76.00, 160.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemNeed2, 1)
	GUI:Layout_setBackGroundColor(itemNeed2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemNeed2, 0)
	GUI:setTouchEnabled(itemNeed2, true)
	GUI:setTag(itemNeed2, 572)

	-- Create itemNeed3
	local itemNeed3 = GUI:Layout_Create(img_2, "itemNeed3", 106.00, 54.00, 160.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemNeed3, 1)
	GUI:Layout_setBackGroundColor(itemNeed3, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemNeed3, 0)
	GUI:setTouchEnabled(itemNeed3, true)
	GUI:setTag(itemNeed3, 573)

	-- Create itemPro
	local itemPro = GUI:Layout_Create(img_2, "itemPro", 18.00, 28.00, 80.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemPro, 1)
	GUI:Layout_setBackGroundColor(itemPro, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemPro, 0)
	GUI:setTouchEnabled(itemPro, true)
	GUI:setTag(itemPro, 574)

	-- Create itemName
	local itemName = GUI:Text_Create(img_2, "itemName", 143.00, 143.00, 16, "#ccad35", [[测试道具名测试道具名]])
	GUI:setAnchorPoint(itemName, 0.50, 0.50)
	GUI:setTouchEnabled(itemName, false)
	GUI:setTag(itemName, 575)
	GUI:Text_enableOutline(itemName, "#000000", 1)

	-- Create itemBg
	local itemBg = GUI:Image_Create(img_2, "itemBg", 51.00, 91.00, "res/custom/common/img_cell_1.png")
	GUI:setContentSize(itemBg, 50, 50)
	GUI:setIgnoreContentAdaptWithSize(itemBg, false)
	GUI:setAnchorPoint(itemBg, 0.50, 0.50)
	GUI:setTouchEnabled(itemBg, false)
	GUI:setTag(itemBg, 576)

	-- Create itemBtn
	local itemBtn = GUI:Button_Create(img_2, "itemBtn", 186.00, 32.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(itemBtn, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(itemBtn, 15, 15, 11, 11)
	GUI:setContentSize(itemBtn, 125, 39)
	GUI:setIgnoreContentAdaptWithSize(itemBtn, false)
	GUI:Button_setTitleText(itemBtn, "")
	GUI:Button_setTitleColor(itemBtn, "#414146")
	GUI:Button_setTitleFontSize(itemBtn, 14)
	GUI:Button_titleDisableOutLine(itemBtn)
	GUI:setAnchorPoint(itemBtn, 0.50, 0.50)
	GUI:setScaleX(itemBtn, 0.70)
	GUI:setScaleY(itemBtn, 0.70)
	GUI:setTouchEnabled(itemBtn, true)
	GUI:setTag(itemBtn, 577)

	-- Create Text_14
	local Text_14 = GUI:Text_Create(itemBtn, "Text_14", 62.00, 18.00, 20, "#ffff00", [[合  成]])
	GUI:setAnchorPoint(Text_14, 0.50, 0.50)
	GUI:setTouchEnabled(Text_14, false)
	GUI:setTag(Text_14, 578)
	GUI:Text_enableOutline(Text_14, "#000000", 1)

	-- Create ListView_2
	local ListView_2 = GUI:ListView_Create(nd_root, "ListView_2", -232.00, 168.00, 620.00, 380.00, 1)
	GUI:ListView_setBackGroundColorType(ListView_2, 1)
	GUI:ListView_setBackGroundColor(ListView_2, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_2, 0)
	GUI:ListView_setGravity(ListView_2, 5)
	GUI:setAnchorPoint(ListView_2, 0.00, 1.00)
	GUI:setTouchEnabled(ListView_2, true)
	GUI:setTag(ListView_2, 188)

	-- Create template
	local template = GUI:Button_Create(nd_root, "template", -305.00, 151.00, "res/custom/common/btn_3_1.png")
	GUI:Button_loadTexturePressed(template, "res/custom/common/btn_3_2.png")
	GUI:Button_loadTextureDisabled(template, "res/custom/common/btn_3_2.png")
	GUI:Button_setScale9Slice(template, 15, 15, 11, 11)
	GUI:setContentSize(template, 135, 33)
	GUI:setIgnoreContentAdaptWithSize(template, false)
	GUI:Button_setTitleText(template, "")
	GUI:Button_setTitleColor(template, "#787974")
	GUI:Button_setTitleFontSize(template, 14)
	GUI:Button_titleDisableOutLine(template)
	GUI:setAnchorPoint(template, 0.50, 0.50)
	GUI:setTouchEnabled(template, true)
	GUI:setTag(template, 187)

	-- Create tx_switch
	local tx_switch = GUI:Text_Create(template, "tx_switch", 67.00, 16.00, 16, "#787974", [[页签2]])
	GUI:setAnchorPoint(tx_switch, 0.50, 0.50)
	GUI:setTouchEnabled(tx_switch, false)
	GUI:setTag(tx_switch, 82)
	GUI:Text_enableOutline(tx_switch, "#000000", 1)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(nd_root, "ListView_1", -373.00, 167.00, 135.00, 435.00, 1)
	GUI:ListView_setBackGroundColorType(ListView_1, 1)
	GUI:ListView_setBackGroundColor(ListView_1, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_1, 0)
	GUI:ListView_setGravity(ListView_1, 5)
	GUI:setAnchorPoint(ListView_1, 0.00, 1.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 186)

	-- Create Desc_text
	local Desc_text = GUI:Layout_Create(Layer, "Desc_text", 338.00, 53.00, 620.00, 50.00, false)
	GUI:Layout_setBackGroundColorType(Desc_text, 1)
	GUI:Layout_setBackGroundColor(Desc_text, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(Desc_text, 0)
	GUI:setTouchEnabled(Desc_text, true)
	GUI:setTag(Desc_text, 433)
end
return ui