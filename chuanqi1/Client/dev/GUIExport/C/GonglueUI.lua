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
	GUI:setTag(bg_close, 267)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 196)

	-- Create img_bg
	local img_bg = GUI:Image_Create(nd_root, "img_bg", 0.00, 0.00, "res/custom/common/00128.png")
	GUI:Image_setScale9Slice(img_bg, 50, 50, 50, 50)
	GUI:setContentSize(img_bg, 772, 540)
	GUI:setIgnoreContentAdaptWithSize(img_bg, false)
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg, true)
	GUI:setTag(img_bg, 197)

	-- Create tx_title
	local tx_title = GUI:Text_Create(img_bg, "tx_title", 93.00, 444.00, 20, "#d6c6ad", [[攻     略]])
	GUI:setAnchorPoint(tx_title, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 198)
	GUI:Text_enableOutline(tx_title, "#000000", 2)

	-- Create bg_big
	local bg_big = GUI:Layout_Create(img_bg, "bg_big", 22.00, 464.00, 733.00, 442.00, true)
	GUI:Layout_setBackGroundColorType(bg_big, 1)
	GUI:Layout_setBackGroundColor(bg_big, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(bg_big, 0)
	GUI:setAnchorPoint(bg_big, 0.00, 1.00)
	GUI:setTouchEnabled(bg_big, true)
	GUI:setTag(bg_big, 248)

	-- Create img
	local img = GUI:Image_Create(bg_big, "img", 14.00, 399.00, "res/custom/touming.png")
	GUI:Image_setScale9Slice(img, 0, 400, 0, 400)
	GUI:setContentSize(img, 635, 370)
	GUI:setIgnoreContentAdaptWithSize(img, false)
	GUI:setAnchorPoint(img, 0.00, 1.00)
	GUI:setScaleX(img, 1.10)
	GUI:setScaleY(img, 1.05)
	GUI:setTouchEnabled(img, false)
	GUI:setTag(img, 249)

	-- Create btn_close
	local btn_close = GUI:Button_Create(img_bg, "btn_close", 776.00, 454.00, "res/custom/common/btn_close_1_1.png")
	GUI:Button_loadTexturePressed(btn_close, "res/custom/common/btn_close_1_2.png")
	GUI:Button_setScale9Slice(btn_close, 8, 8, 11, 11)
	GUI:setContentSize(btn_close, 26, 42)
	GUI:setIgnoreContentAdaptWithSize(btn_close, false)
	GUI:Button_setTitleText(btn_close, "")
	GUI:Button_setTitleColor(btn_close, "#414146")
	GUI:Button_setTitleFontSize(btn_close, 14)
	GUI:Button_titleDisableOutLine(btn_close)
	GUI:setAnchorPoint(btn_close, 0.50, 0.50)
	GUI:setScaleX(btn_close, 0.92)
	GUI:setTouchEnabled(btn_close, true)
	GUI:setTag(btn_close, 199)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(img_bg, "ListView_1", 39.00, 415.00, 120.00, 380.00, 1)
	GUI:ListView_setBackGroundColorType(ListView_1, 1)
	GUI:ListView_setBackGroundColor(ListView_1, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_1, 0)
	GUI:ListView_setGravity(ListView_1, 5)
	GUI:setAnchorPoint(ListView_1, 0.00, 1.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 92)

	-- Create ListView_2
	local ListView_2 = GUI:ListView_Create(img_bg, "ListView_2", 171.00, 415.00, 560.00, 385.00, 1)
	GUI:ListView_setBackGroundColorType(ListView_2, 1)
	GUI:ListView_setBackGroundColor(ListView_2, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_2, 0)
	GUI:ListView_setGravity(ListView_2, 5)
	GUI:setAnchorPoint(ListView_2, 0.00, 1.00)
	GUI:setTouchEnabled(ListView_2, true)
	GUI:setTag(ListView_2, 93)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(nd_root, "Image_2", -221.00, 145.00, "res/custom/common/img_line_1.png")
	GUI:Image_setScale9Slice(Image_2, 1, 1, 147, 147)
	GUI:setContentSize(Image_2, 4, 385)
	GUI:setIgnoreContentAdaptWithSize(Image_2, false)
	GUI:setAnchorPoint(Image_2, 0.50, 1.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 401)

	-- Create template_1
	local template_1 = GUI:Layout_Create(nd_root, "template_1", 0.00, -238.00, 120.00, 44.00, false)
	GUI:Layout_setBackGroundColorType(template_1, 1)
	GUI:Layout_setBackGroundColor(template_1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(template_1, 0)
	GUI:setTouchEnabled(template_1, true)
	GUI:setTag(template_1, 147)

	-- Create btn_switch
	local btn_switch = GUI:Button_Create(template_1, "btn_switch", 60.00, 19.00, "res/custom/common/btn_2_1.png")
	GUI:Button_setScale9Slice(btn_switch, 0, 0, 0, 0)
	GUI:setContentSize(btn_switch, 110, 36)
	GUI:setIgnoreContentAdaptWithSize(btn_switch, false)
	GUI:Button_setTitleText(btn_switch, "")
	GUI:Button_setTitleColor(btn_switch, "#414146")
	GUI:Button_setTitleFontSize(btn_switch, 14)
	GUI:Button_titleEnableOutline(btn_switch, "#000000", 1)
	GUI:setAnchorPoint(btn_switch, 0.50, 0.50)
	GUI:setTouchEnabled(btn_switch, true)
	GUI:setTag(btn_switch, 214)

	-- Create tx_switch
	local tx_switch = GUI:Text_Create(btn_switch, "tx_switch", 54.00, 18.00, 18, "#787974", [[游戏特色]])
	GUI:setAnchorPoint(tx_switch, 0.50, 0.50)
	GUI:setTouchEnabled(tx_switch, false)
	GUI:setTag(tx_switch, 215)
	GUI:Text_enableOutline(tx_switch, "#000000", 1)

	-- Create template_2
	local template_2 = GUI:Layout_Create(nd_root, "template_2", 0.00, 0.00, 560.00, 30.00, false)
	GUI:Layout_setBackGroundColorType(template_2, 1)
	GUI:Layout_setBackGroundColor(template_2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(template_2, 0)
	GUI:setTouchEnabled(template_2, false)
	GUI:setTag(template_2, 94)

	-- Create tx_desc
	local tx_desc = GUI:Text_Create(template_2, "tx_desc", 5.00, 15.00, 20, "#ffffff", [[]])
	GUI:setAnchorPoint(tx_desc, 0.00, 0.50)
	GUI:setTouchEnabled(tx_desc, false)
	GUI:setTag(tx_desc, 95)
	GUI:Text_enableOutline(tx_desc, "#000000", 1)
end
return ui