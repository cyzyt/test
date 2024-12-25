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
	GUI:setTag(la_bg, 19)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 11)

	-- Create img_bg
	local img_bg = GUI:Image_Create(nd_root, "img_bg", 14.00, -2.00, "res/custom/common/00128.png")
	GUI:setContentSize(img_bg, 820, 605)
	GUI:setIgnoreContentAdaptWithSize(img_bg, false)
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg, false)
	GUI:setTag(img_bg, 12)

	-- Create tx_title
	local tx_title = GUI:Text_Create(img_bg, "tx_title", 92.00, 498.00, 20, "#d6c6ad", [[上古神器]])
	GUI:setAnchorPoint(tx_title, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 73)
	GUI:Text_enableOutline(tx_title, "#000000", 2)

	-- Create btn_close
	local btn_close = GUI:Button_Create(img_bg, "btn_close", 825.00, 513.00, "res/custom/common/btn_close_1_1.png")
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

	-- Create tx_title_bg1
	local tx_title_bg1 = GUI:Image_Create(img_bg, "tx_title_bg1", 520.00, 440.00, "res/custom/common/img_1.png")
	GUI:setAnchorPoint(tx_title_bg1, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title_bg1, false)
	GUI:setTag(tx_title_bg1, 66)

	-- Create title
	local title = GUI:Image_Create(tx_title_bg1, "title", 130.00, 7.00, "res/custom/hecheng/comp_5.png")
	GUI:setAnchorPoint(title, 0.50, 0.50)
	GUI:setTouchEnabled(title, false)
	GUI:setTag(title, 68)

	-- Create tx_title_bg2
	local tx_title_bg2 = GUI:Image_Create(img_bg, "tx_title_bg2", 520.00, 306.00, "res/custom/common/img_1.png")
	GUI:setAnchorPoint(tx_title_bg2, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title_bg2, false)
	GUI:setTag(tx_title_bg2, 69)

	-- Create title
	local title = GUI:Image_Create(tx_title_bg2, "title", 130.00, 5.00, "res/custom/hecheng/comp_4.png")
	GUI:setAnchorPoint(title, 0.50, 0.50)
	GUI:setTouchEnabled(title, false)
	GUI:setTag(title, 70)

	-- Create img_di
	local img_di = GUI:Image_Create(img_bg, "img_di", 207.00, 34.00, "res/custom/common/img_line_1.png")
	GUI:setAnchorPoint(img_di, 0.50, 0.00)
	GUI:setScaleY(img_di, 0.97)
	GUI:setTouchEnabled(img_di, false)
	GUI:setTag(img_di, 586)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(nd_root, "ListView_1", -352.00, 162.00, 160.00, 430.00, 1)
	GUI:ListView_setBackGroundColorType(ListView_1, 1)
	GUI:ListView_setBackGroundColor(ListView_1, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_1, 0)
	GUI:ListView_setGravity(ListView_1, 5)
	GUI:setAnchorPoint(ListView_1, 0.00, 1.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 182)

	-- Create hechengWnd_1
	local hechengWnd_1 = GUI:Layout_Create(nd_root, "hechengWnd_1", -100.00, -275.00, 459.00, 445.00, false)
	GUI:Layout_setBackGroundColorType(hechengWnd_1, 1)
	GUI:Layout_setBackGroundColor(hechengWnd_1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(hechengWnd_1, 0)
	GUI:setTouchEnabled(hechengWnd_1, true)
	GUI:setTag(hechengWnd_1, 65)

	-- Create xian
	local xian = GUI:Image_Create(hechengWnd_1, "xian", 225.00, 275.00, "res/custom/hecheng/aegis_line1.png")
	GUI:setContentSize(xian, 9, 90)
	GUI:setIgnoreContentAdaptWithSize(xian, false)
	GUI:setAnchorPoint(xian, 0.50, 0.50)
	GUI:setTouchEnabled(xian, false)
	GUI:setTag(xian, 71)

	-- Create item_bg1
	local item_bg1 = GUI:Image_Create(hechengWnd_1, "item_bg1", 225.00, 345.00, "res/custom/common/img_cell_1.png")
	GUI:setAnchorPoint(item_bg1, 0.50, 0.50)
	GUI:setTouchEnabled(item_bg1, false)
	GUI:setTag(item_bg1, 72)

	-- Create num_1
	local num_1 = GUI:Layout_Create(hechengWnd_1, "num_1", 193.00, 318.00, 64.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(num_1, 1)
	GUI:Layout_setBackGroundColor(num_1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(num_1, 0)
	GUI:setTouchEnabled(num_1, true)
	GUI:setTag(num_1, 185)

	-- Create hechengWnd_2
	local hechengWnd_2 = GUI:Layout_Create(nd_root, "hechengWnd_2", -100.00, -275.00, 459.00, 445.00, false)
	GUI:Layout_setBackGroundColorType(hechengWnd_2, 1)
	GUI:Layout_setBackGroundColor(hechengWnd_2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(hechengWnd_2, 0)
	GUI:setTouchEnabled(hechengWnd_2, true)
	GUI:setTag(hechengWnd_2, 101)

	-- Create xian
	local xian = GUI:Image_Create(hechengWnd_2, "xian", 225.00, 290.00, "res/custom/hecheng/comp_2.png")
	GUI:setContentSize(xian, 145, 115)
	GUI:setIgnoreContentAdaptWithSize(xian, false)
	GUI:setAnchorPoint(xian, 0.50, 0.50)
	GUI:setTouchEnabled(xian, false)
	GUI:setTag(xian, 102)

	-- Create item_bg1
	local item_bg1 = GUI:Image_Create(hechengWnd_2, "item_bg1", 157.00, 345.00, "res/custom/common/img_cell_1.png")
	GUI:setAnchorPoint(item_bg1, 0.50, 0.50)
	GUI:setTouchEnabled(item_bg1, false)
	GUI:setTag(item_bg1, 103)

	-- Create num_1
	local num_1 = GUI:Layout_Create(hechengWnd_2, "num_1", 125.00, 318.00, 64.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(num_1, 1)
	GUI:Layout_setBackGroundColor(num_1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(num_1, 0)
	GUI:setTouchEnabled(num_1, true)
	GUI:setTag(num_1, 183)

	-- Create item_bg2
	local item_bg2 = GUI:Image_Create(hechengWnd_2, "item_bg2", 293.00, 345.00, "res/custom/common/img_cell_1.png")
	GUI:setAnchorPoint(item_bg2, 0.50, 0.50)
	GUI:setTouchEnabled(item_bg2, false)
	GUI:setTag(item_bg2, 104)

	-- Create num_2
	local num_2 = GUI:Layout_Create(hechengWnd_2, "num_2", 261.00, 315.00, 64.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(num_2, 1)
	GUI:Layout_setBackGroundColor(num_2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(num_2, 0)
	GUI:setTouchEnabled(num_2, true)
	GUI:setTag(num_2, 184)

	-- Create item
	local item = GUI:Image_Create(nd_root, "item", 125.00, -76.00, "res/custom/common/img_cell_1.png")
	GUI:setAnchorPoint(item, 0.50, 0.50)
	GUI:setTouchEnabled(item, false)
	GUI:setTag(item, 73)

	-- Create itemPro
	local itemPro = GUI:Layout_Create(nd_root, "itemPro", 124.00, -185.00, 80.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemPro, 1)
	GUI:Layout_setBackGroundColor(itemPro, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemPro, 0)
	GUI:setAnchorPoint(itemPro, 0.50, 0.00)
	GUI:setTouchEnabled(itemPro, true)
	GUI:setTag(itemPro, 97)

	-- Create itemNeed1
	local itemNeed1 = GUI:Layout_Create(nd_root, "itemNeed1", 124.00, -149.00, 160.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemNeed1, 1)
	GUI:Layout_setBackGroundColor(itemNeed1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemNeed1, 0)
	GUI:setAnchorPoint(itemNeed1, 0.50, 0.00)
	GUI:setTouchEnabled(itemNeed1, true)
	GUI:setTag(itemNeed1, 98)

	-- Create btn_go
	local btn_go = GUI:Button_Create(nd_root, "btn_go", 124.00, -219.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(btn_go, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(btn_go, 15, 15, 11, 11)
	GUI:setContentSize(btn_go, 122, 34)
	GUI:setIgnoreContentAdaptWithSize(btn_go, false)
	GUI:Button_setTitleText(btn_go, "")
	GUI:Button_setTitleColor(btn_go, "#42311c")
	GUI:Button_setTitleFontSize(btn_go, 18)
	GUI:Button_titleDisableOutLine(btn_go)
	GUI:setAnchorPoint(btn_go, 0.50, 0.50)
	GUI:setTouchEnabled(btn_go, true)
	GUI:setTag(btn_go, 99)

	-- Create Text_14
	local Text_14 = GUI:Text_Create(btn_go, "Text_14", 61.00, 17.00, 18, "#ffff00", [[合  成]])
	GUI:setAnchorPoint(Text_14, 0.50, 0.50)
	GUI:setTouchEnabled(Text_14, false)
	GUI:setTag(Text_14, 100)
	GUI:Text_enableOutline(Text_14, "#000000", 1)

	-- Create template
	local template = GUI:Button_Create(Layer, "template", 295.00, 462.00, "res/custom/common/btn_3_1.png")
	GUI:Button_loadTexturePressed(template, "res/custom/common/btn_3_2.png")
	GUI:Button_loadTextureDisabled(template, "res/custom/common/btn_3_2.png")
	GUI:Button_setScale9Slice(template, 15, 15, 11, 11)
	GUI:setContentSize(template, 160, 35)
	GUI:setIgnoreContentAdaptWithSize(template, false)
	GUI:Button_setTitleText(template, "")
	GUI:Button_setTitleColor(template, "#eef622")
	GUI:Button_setTitleFontSize(template, 14)
	GUI:Button_titleEnableOutline(template, "#000000", 1)
	GUI:setAnchorPoint(template, 0.50, 0.50)
	GUI:setTouchEnabled(template, true)
	GUI:setTag(template, 185)
	GUI:setVisible(template, false)

	-- Create tx_switch
	local tx_switch = GUI:Text_Create(template, "tx_switch", 80.00, 17.00, 18, "#787974", [[页签1]])
	GUI:setAnchorPoint(tx_switch, 0.50, 0.50)
	GUI:setScaleY(tx_switch, 0.92)
	GUI:setTouchEnabled(tx_switch, false)
	GUI:setTag(tx_switch, 190)
	GUI:Text_enableOutline(tx_switch, "#000000", 1)
end
return ui