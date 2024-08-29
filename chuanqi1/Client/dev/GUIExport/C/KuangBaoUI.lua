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
	GUI:setTag(bg_close, 682)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 670)

	-- Create img_bg
	local img_bg = GUI:Image_Create(nd_root, "img_bg", 14.00, 0.00, "res/custom/common/00129.png")
	GUI:setContentSize(img_bg, 741, 540)
	GUI:setIgnoreContentAdaptWithSize(img_bg, false)
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg, true)
	GUI:setTag(img_bg, 671)

	-- Create tx_title
	local tx_title = GUI:Text_Create(img_bg, "tx_title", 84.00, 442.00, 20, "#d6c6ad", [[狂暴之力]])
	GUI:setAnchorPoint(tx_title, 0.00, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 672)
	GUI:Text_enableOutline(tx_title, "#000000", 2)

	-- Create btn_close
	local btn_close = GUI:Button_Create(img_bg, "btn_close", 745.00, 454.00, "res/custom/common/btn_close_1_1.png")
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
	GUI:setTag(btn_close, 673)

	-- Create bg_di
	local bg_di = GUI:Image_Create(img_bg, "bg_di", 370.00, 218.00, "res/custom/kuangbao/kb_2.jpg")
	GUI:setContentSize(bg_di, 660, 400)
	GUI:setIgnoreContentAdaptWithSize(bg_di, false)
	GUI:setAnchorPoint(bg_di, 0.50, 0.50)
	GUI:setTouchEnabled(bg_di, false)
	GUI:setTag(bg_di, 674)

	-- Create p_fu_tx
	local p_fu_tx = GUI:Layout_Create(bg_di, "p_fu_tx", 350.00, 392.00, 300.00, 300.00, false)
	GUI:setAnchorPoint(p_fu_tx, 0.00, 1.00)
	GUI:setTouchEnabled(p_fu_tx, true)
	GUI:setTag(p_fu_tx, 38)

	-- Create btn_chuanshong
	local btn_chuanshong = GUI:Button_Create(bg_di, "btn_chuanshong", 512.00, 45.00, "res/custom/kuangbao/kb_3.png")
	GUI:Button_loadTexturePressed(btn_chuanshong, "res/custom/kuangbao/kb_3.png")
	GUI:Button_loadTextureDisabled(btn_chuanshong, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(btn_chuanshong, 15, 15, 11, 11)
	GUI:setContentSize(btn_chuanshong, 169.60000610352, 68)
	GUI:setIgnoreContentAdaptWithSize(btn_chuanshong, false)
	GUI:Button_setTitleText(btn_chuanshong, "")
	GUI:Button_setTitleColor(btn_chuanshong, "#414146")
	GUI:Button_setTitleFontSize(btn_chuanshong, 14)
	GUI:Button_titleDisableOutLine(btn_chuanshong)
	GUI:setAnchorPoint(btn_chuanshong, 0.50, 0.50)
	GUI:setTouchEnabled(btn_chuanshong, true)
	GUI:setTag(btn_chuanshong, 678)

	-- Create p_texiao
	local p_texiao = GUI:Layout_Create(bg_di, "p_texiao", 188.00, 198.00, 300.00, 300.00, false)
	GUI:setAnchorPoint(p_texiao, 0.50, 0.50)
	GUI:setTouchEnabled(p_texiao, true)
	GUI:setTag(p_texiao, 39)
end
return ui