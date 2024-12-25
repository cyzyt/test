local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create bg_close
	local bg_close = GUI:Image_Create(Layer, "bg_close", 0.00, 0.00, "res/custom/common/bg_main_6.png")
	GUI:setContentSize(bg_close, 1136, 640)
	GUI:setIgnoreContentAdaptWithSize(bg_close, false)
	GUI:setOpacity(bg_close, 0)
	GUI:setTouchEnabled(bg_close, true)
	GUI:setTag(bg_close, 420)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 407)

	-- Create img_bg
	local img_bg = GUI:Image_Create(nd_root, "img_bg", -49.00, 10.00, "res/custom/common/00311.png")
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg, true)
	GUI:setTag(img_bg, 408)

	-- Create tx_title
	local tx_title = GUI:Text_Create(img_bg, "tx_title", 331.00, 208.00, 20, "#d6c6ad", [[激活码]])
	GUI:setAnchorPoint(tx_title, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 409)
	GUI:Text_enableOutline(tx_title, "#000000", 2)

	-- Create btn_close
	local btn_close = GUI:Button_Create(img_bg, "btn_close", 526.00, 209.00, "res/custom/shouchong/z_guanbianniu.png")
	GUI:Button_loadTexturePressed(btn_close, "res/custom/shouchong/z_guanbianniu.png1.png")
	GUI:Button_setScale9Slice(btn_close, 8, 8, 11, 11)
	GUI:setContentSize(btn_close, 33, 26)
	GUI:setIgnoreContentAdaptWithSize(btn_close, false)
	GUI:Button_setTitleText(btn_close, "")
	GUI:Button_setTitleColor(btn_close, "#414146")
	GUI:Button_setTitleFontSize(btn_close, 14)
	GUI:Button_titleDisableOutLine(btn_close)
	GUI:setAnchorPoint(btn_close, 0.50, 0.50)
	GUI:setTouchEnabled(btn_close, true)
	GUI:setTag(btn_close, 410)

	-- Create p_item
	local p_item = GUI:Layout_Create(img_bg, "p_item", 150.00, 115.00, 330.00, 60.00, false)
	GUI:setTouchEnabled(p_item, true)
	GUI:setTag(p_item, 554)

	-- Create Pan_tx
	local Pan_tx = GUI:Layout_Create(img_bg, "Pan_tx", 397.00, 52.00, 99.00, 32.00, false)
	GUI:setTouchEnabled(Pan_tx, true)
	GUI:setTag(Pan_tx, 553)

	-- Create Img_lq
	local Img_lq = GUI:Image_Create(img_bg, "Img_lq", 446.00, 68.00, "res/custom/common/hz_lqhz0.png")
	GUI:setAnchorPoint(Img_lq, 0.50, 0.50)
	GUI:setTouchEnabled(Img_lq, true)
	GUI:setTag(Img_lq, 489)

	-- Create Buy_img2
	local Buy_img2 = GUI:Image_Create(img_bg, "Buy_img2", 230.00, 68.00, "res/custom/hecheng/img_bg_2.png")
	GUI:setAnchorPoint(Buy_img2, 0.00, 0.50)
	GUI:setOpacity(Buy_img2, 153)
	GUI:setTouchEnabled(Buy_img2, false)
	GUI:setTag(Buy_img2, 485)

	-- Create Buy_txt1
	local Buy_txt1 = GUI:TextInput_Create(Buy_img2, "Buy_txt1", 69.00, 12.00, 130.00, 20.00, 18)
	GUI:TextInput_setString(Buy_txt1, "")
	GUI:TextInput_setFontColor(Buy_txt1, "#ffffff")
	GUI:TextInput_setMaxLength(Buy_txt1, 14)
	GUI:setAnchorPoint(Buy_txt1, 0.50, 0.50)
	GUI:setOpacity(Buy_txt1, 60)
	GUI:setTouchEnabled(Buy_txt1, true)
	GUI:setTag(Buy_txt1, 488)

	-- Create Buy_txt2
	local Buy_txt2 = GUI:Text_Create(Buy_img2, "Buy_txt2", 4.00, 13.00, 17, "#ffffff", [[输入激活码]])
	GUI:setAnchorPoint(Buy_txt2, 0.00, 0.50)
	GUI:setOpacity(Buy_txt2, 153)
	GUI:setTouchEnabled(Buy_txt2, false)
	GUI:setTag(Buy_txt2, 487)
	GUI:Text_enableOutline(Buy_txt2, "#000000", 1)
end
return ui