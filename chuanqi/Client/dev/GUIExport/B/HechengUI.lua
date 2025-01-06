local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create bg_close
	local bg_close = GUI:Layout_Create(Layer, "bg_close", 0.00, 0.00, 1136.00, 640.00, false)
	GUI:Layout_setBackGroundColorType(bg_close, 1)
	GUI:Layout_setBackGroundColor(bg_close, "#000000")
	GUI:Layout_setBackGroundColorOpacity(bg_close, 102)
	GUI:setTouchEnabled(bg_close, true)
	GUI:setTag(bg_close, 19)

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
	local tx_title = GUI:Text_Create(img_bg, "tx_title", 92.00, 498.00, 20, "#d6c6ad", [[合  成]])
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
	local tx_title_bg1 = GUI:Image_Create(img_bg, "tx_title_bg1", 536.00, 440.00, "res/custom/common/img_1.png")
	GUI:setAnchorPoint(tx_title_bg1, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title_bg1, false)
	GUI:setTag(tx_title_bg1, 66)

	-- Create title
	local title = GUI:Image_Create(tx_title_bg1, "title", 130.00, 7.00, "res/custom/hecheng/comp_5.png")
	GUI:setAnchorPoint(title, 0.50, 0.50)
	GUI:setTouchEnabled(title, false)
	GUI:setTag(title, 68)

	-- Create tx_title_bg2
	local tx_title_bg2 = GUI:Image_Create(img_bg, "tx_title_bg2", 536.00, 306.00, "res/custom/common/img_1.png")
	GUI:setAnchorPoint(tx_title_bg2, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title_bg2, false)
	GUI:setTag(tx_title_bg2, 69)

	-- Create title
	local title = GUI:Image_Create(tx_title_bg2, "title", 130.00, 5.00, "res/custom/hecheng/comp_4.png")
	GUI:setAnchorPoint(title, 0.50, 0.50)
	GUI:setTouchEnabled(title, false)
	GUI:setTag(title, 70)

	-- Create img_di
	local img_di = GUI:Image_Create(img_bg, "img_di", 149.00, 34.00, "res/custom/common/img_line_1.png")
	GUI:setAnchorPoint(img_di, 0.50, 0.00)
	GUI:setScaleY(img_di, 0.97)
	GUI:setTouchEnabled(img_di, false)
	GUI:setTag(img_di, 586)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(img_di, "Image_1", 160.00, 224.00, "res/custom/common/img_line_1.png")
	GUI:setAnchorPoint(Image_1, 0.50, 0.50)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 178)

	-- Create template_3
	local template_3 = GUI:Button_Create(nd_root, "template_3", 0.00, 0.00, "res/custom/common2/126.png")
	GUI:Button_loadTexturePressed(template_3, "res/custom/common2/126_1.png")
	GUI:Button_loadTextureDisabled(template_3, "res/custom/common2/126_1.png")
	GUI:Button_setScale9Slice(template_3, 15, 15, 11, 11)
	GUI:setContentSize(template_3, 122, 25)
	GUI:setIgnoreContentAdaptWithSize(template_3, false)
	GUI:Button_setTitleText(template_3, "我是模板模板")
	GUI:Button_setTitleColor(template_3, "#ffffff")
	GUI:Button_setTitleFontSize(template_3, 14)
	GUI:Button_titleDisableOutLine(template_3)
	GUI:setAnchorPoint(template_3, 0.50, 0.50)
	GUI:setTouchEnabled(template_3, true)
	GUI:setTag(template_3, 182)

	-- Create ListView_3
	local ListView_3 = GUI:ListView_Create(nd_root, "ListView_3", -227.00, 97.00, 140.00, 25.00, 1)
	GUI:ListView_setGravity(ListView_3, 2)
	GUI:setTouchEnabled(ListView_3, true)
	GUI:setTag(ListView_3, 181)

	-- Create template_2
	local template_2 = GUI:Button_Create(nd_root, "template_2", -170.00, 140.00, "res/custom/common/btn_3_1.png")
	GUI:Button_loadTexturePressed(template_2, "res/custom/common/btn_3_2.png")
	GUI:Button_loadTextureDisabled(template_2, "res/custom/common/btn_3_2.png")
	GUI:Button_setScale9Slice(template_2, 15, 15, 11, 11)
	GUI:setContentSize(template_2, 140, 35)
	GUI:setIgnoreContentAdaptWithSize(template_2, false)
	GUI:Button_setTitleText(template_2, "")
	GUI:Button_setTitleColor(template_2, "#787974")
	GUI:Button_setTitleFontSize(template_2, 18)
	GUI:Button_titleEnableOutline(template_2, "#000000", 1)
	GUI:setAnchorPoint(template_2, 0.50, 0.50)
	GUI:setTouchEnabled(template_2, true)
	GUI:setTag(template_2, 187)

	-- Create ListView_2
	local ListView_2 = GUI:ListView_Create(nd_root, "ListView_2", -241.00, 160.00, 140.00, 430.00, 1)
	GUI:ListView_setBackGroundColorType(ListView_2, 1)
	GUI:ListView_setBackGroundColor(ListView_2, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_2, 0)
	GUI:ListView_setGravity(ListView_2, 2)
	GUI:setAnchorPoint(ListView_2, 0.00, 1.00)
	GUI:setTouchEnabled(ListView_2, true)
	GUI:setTag(ListView_2, 186)

	-- Create template_1
	local template_1 = GUI:Button_Create(nd_root, "template_1", -303.00, 142.00, "res/custom/common/btn_3_1.png")
	GUI:Button_loadTexturePressed(template_1, "res/custom/common/btn_3_2.png")
	GUI:Button_loadTextureDisabled(template_1, "res/custom/common/btn_3_2.png")
	GUI:Button_setScale9Slice(template_1, 15, 15, 11, 11)
	GUI:setContentSize(template_1, 100, 35)
	GUI:setIgnoreContentAdaptWithSize(template_1, false)
	GUI:Button_setTitleText(template_1, "")
	GUI:Button_setTitleColor(template_1, "#787974")
	GUI:Button_setTitleFontSize(template_1, 18)
	GUI:Button_titleEnableOutline(template_1, "#000000", 1)
	GUI:setAnchorPoint(template_1, 0.50, 0.50)
	GUI:setTouchEnabled(template_1, true)
	GUI:setTag(template_1, 187)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(nd_root, "ListView_1", -352.00, 162.00, 100.00, 430.00, 1)
	GUI:ListView_setBackGroundColorType(ListView_1, 1)
	GUI:ListView_setBackGroundColor(ListView_1, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_1, 0)
	GUI:ListView_setGravity(ListView_1, 5)
	GUI:setAnchorPoint(ListView_1, 0.00, 1.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 182)

	-- Create hechengWnd_1
	local hechengWnd_1 = GUI:Layout_Create(nd_root, "hechengWnd_1", -85.00, -275.00, 459.00, 445.00, false)
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
	local hechengWnd_2 = GUI:Layout_Create(nd_root, "hechengWnd_2", -85.00, -275.00, 459.00, 445.00, false)
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
	local item = GUI:Image_Create(nd_root, "item", 141.00, -76.00, "res/custom/common/img_cell_1.png")
	GUI:setAnchorPoint(item, 0.50, 0.50)
	GUI:setTouchEnabled(item, false)
	GUI:setTag(item, 73)

	-- Create itemPro
	local itemPro = GUI:Layout_Create(nd_root, "itemPro", 140.00, -185.00, 80.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemPro, 1)
	GUI:Layout_setBackGroundColor(itemPro, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemPro, 0)
	GUI:setAnchorPoint(itemPro, 0.50, 0.00)
	GUI:setTouchEnabled(itemPro, true)
	GUI:setTag(itemPro, 97)

	-- Create itemNeed1
	local itemNeed1 = GUI:Layout_Create(nd_root, "itemNeed1", 140.00, -149.00, 160.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemNeed1, 1)
	GUI:Layout_setBackGroundColor(itemNeed1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemNeed1, 0)
	GUI:setAnchorPoint(itemNeed1, 0.50, 0.00)
	GUI:setTouchEnabled(itemNeed1, true)
	GUI:setTag(itemNeed1, 98)

	-- Create btn_go
	local btn_go = GUI:Button_Create(nd_root, "btn_go", 140.00, -219.00, "res/custom/common/btn_2_1.png")
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
end
return ui