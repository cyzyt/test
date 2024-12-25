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

	-- Create img_bg
	local img_bg = GUI:Image_Create(nd_root, "img_bg", -0.00, 10.00, "res/custom/ShiJieDiTu/bg_npc_06.jpg")
	GUI:Image_setScale9Slice(img_bg, 84, 84, 166, 166)
	GUI:setContentSize(img_bg, 430, 550)
	GUI:setIgnoreContentAdaptWithSize(img_bg, false)
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setFlippedY(img_bg, true)
	GUI:setTouchEnabled(img_bg, true)
	GUI:setTag(img_bg, 12)

	-- Create btn_close
	local btn_close = GUI:Button_Create(img_bg, "btn_close", 430.00, 0.00, "res/custom/common/btn_close_1_1.png")
	GUI:Button_loadTexturePressed(btn_close, "res/custom/common/btn_close_1_2.png")
	GUI:Button_setScale9Slice(btn_close, 8, 8, 11, 11)
	GUI:setContentSize(btn_close, 26, 42)
	GUI:setIgnoreContentAdaptWithSize(btn_close, false)
	GUI:Button_setTitleText(btn_close, "")
	GUI:Button_setTitleColor(btn_close, "#414146")
	GUI:Button_setTitleFontSize(btn_close, 14)
	GUI:Button_titleDisableOutLine(btn_close)
	GUI:setTouchEnabled(btn_close, true)
	GUI:setTag(btn_close, 14)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(nd_root, "Panel_1", 0.00, 10.00, 430.00, 550.00, false)
	GUI:setAnchorPoint(Panel_1, 0.50, 0.50)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 334)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Panel_1, "Text_1", 215.00, 518.18, 24, "#ffff00", [[世界传送]])
	GUI:setAnchorPoint(Text_1, 0.50, 0.50)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 328)
	GUI:Text_enableOutline(Text_1, "#1a1a1a", 2)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Panel_1, "Image_1", 215.00, 491.14, "res/custom/common/img_line_1.png")
	GUI:setContentSize(Image_1, 410, 2)
	GUI:setIgnoreContentAdaptWithSize(Image_1, false)
	GUI:setAnchorPoint(Image_1, 0.50, 0.50)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 330)

	-- Create Image_1_0
	local Image_1_0 = GUI:Image_Create(Panel_1, "Image_1_0", 144.02, 490.49, "res/custom/common/img_line_2.png")
	GUI:setContentSize(Image_1_0, 2, 481)
	GUI:setIgnoreContentAdaptWithSize(Image_1_0, false)
	GUI:setAnchorPoint(Image_1_0, 0.50, 1.00)
	GUI:setTouchEnabled(Image_1_0, false)
	GUI:setTag(Image_1_0, 340)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Panel_1, "Button_1", 77.16, 464.03, "res/custom/common/btn_13_1.png")
	GUI:Button_loadTexturePressed(Button_1, "res/custom/common/btn_13_2.png")
	GUI:Button_setScale9Slice(Button_1, 15, 15, 11, 11)
	GUI:setContentSize(Button_1, 114, 36)
	GUI:setIgnoreContentAdaptWithSize(Button_1, false)
	GUI:Button_setTitleText(Button_1, "")
	GUI:Button_setTitleColor(Button_1, "#414146")
	GUI:Button_setTitleFontSize(Button_1, 14)
	GUI:Button_titleDisableOutLine(Button_1)
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 331)

	-- Create Text_1_0
	local Text_1_0 = GUI:Text_Create(Button_1, "Text_1_0", 57.00, 18.00, 18, "#f7e6c6", [[主城传送]])
	GUI:setAnchorPoint(Text_1_0, 0.50, 0.50)
	GUI:setTouchEnabled(Text_1_0, false)
	GUI:setTag(Text_1_0, 332)
	GUI:Text_enableOutline(Text_1_0, "#1a1a1a", 2)

	-- Create lv_btn
	local lv_btn = GUI:ListView_Create(Panel_1, "lv_btn", 144.96, 482.71, 276.00, 473.00, 1)
	GUI:ListView_setClippingEnabled(lv_btn, false)
	GUI:ListView_setBackGroundColorType(lv_btn, 1)
	GUI:ListView_setBackGroundColor(lv_btn, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(lv_btn, 102)
	GUI:ListView_setGravity(lv_btn, 2)
	GUI:ListView_setItemsMargin(lv_btn, 10)
	GUI:setAnchorPoint(lv_btn, 0.00, 1.00)
	GUI:setTouchEnabled(lv_btn, true)
	GUI:setTag(lv_btn, 358)

	-- Create l_item_1
	local l_item_1 = GUI:Layout_Create(lv_btn, "l_item_1", 0.00, 437.00, 276.00, 36.00, false)
	GUI:setTouchEnabled(l_item_1, true)
	GUI:setTag(l_item_1, 359)

	-- Create btn_1
	local btn_1 = GUI:Button_Create(l_item_1, "btn_1", 67.09, 18.00, "res/custom/common/btn_13_1.png")
	GUI:Button_loadTexturePressed(btn_1, "res/custom/common/btn_13_2.png")
	GUI:Button_setScale9Slice(btn_1, 15, 15, 11, 11)
	GUI:setContentSize(btn_1, 114, 36)
	GUI:setIgnoreContentAdaptWithSize(btn_1, false)
	GUI:Button_setTitleText(btn_1, "")
	GUI:Button_setTitleColor(btn_1, "#414146")
	GUI:Button_setTitleFontSize(btn_1, 14)
	GUI:Button_titleDisableOutLine(btn_1)
	GUI:setAnchorPoint(btn_1, 0.50, 0.50)
	GUI:setTouchEnabled(btn_1, true)
	GUI:setTag(btn_1, 335)

	-- Create Text_1_0
	local Text_1_0 = GUI:Text_Create(btn_1, "Text_1_0", 57.00, 18.00, 18, "#f7e6c6", [[盟重土城]])
	GUI:setAnchorPoint(Text_1_0, 0.50, 0.50)
	GUI:setTouchEnabled(Text_1_0, false)
	GUI:setTag(Text_1_0, 336)
	GUI:Text_enableOutline(Text_1_0, "#1a1a1a", 2)

	-- Create img_suo
	local img_suo = GUI:Image_Create(btn_1, "img_suo", 114.00, 18.00, "res/custom/ShiJieDiTu/icon_tyzys_02.png")
	GUI:setAnchorPoint(img_suo, 0.50, 0.50)
	GUI:setTouchEnabled(img_suo, false)
	GUI:setTag(img_suo, 351)

	-- Create btn_2
	local btn_2 = GUI:Button_Create(l_item_1, "btn_2", 199.12, 18.00, "res/custom/common/btn_13_1.png")
	GUI:Button_loadTexturePressed(btn_2, "res/custom/common/btn_13_2.png")
	GUI:Button_setScale9Slice(btn_2, 15, 15, 11, 11)
	GUI:setContentSize(btn_2, 114, 36)
	GUI:setIgnoreContentAdaptWithSize(btn_2, false)
	GUI:Button_setTitleText(btn_2, "")
	GUI:Button_setTitleColor(btn_2, "#414146")
	GUI:Button_setTitleFontSize(btn_2, 14)
	GUI:Button_titleDisableOutLine(btn_2)
	GUI:setAnchorPoint(btn_2, 0.50, 0.50)
	GUI:setTouchEnabled(btn_2, true)
	GUI:setTag(btn_2, 352)

	-- Create Text_1_0
	local Text_1_0 = GUI:Text_Create(btn_2, "Text_1_0", 57.00, 18.00, 18, "#f7e6c6", [[八卦古镇]])
	GUI:setAnchorPoint(Text_1_0, 0.50, 0.50)
	GUI:setTouchEnabled(Text_1_0, false)
	GUI:setTag(Text_1_0, 353)
	GUI:Text_enableOutline(Text_1_0, "#1a1a1a", 2)

	-- Create img_suo
	local img_suo = GUI:Image_Create(btn_2, "img_suo", 114.00, 18.00, "res/custom/ShiJieDiTu/icon_tyzys_02.png")
	GUI:setAnchorPoint(img_suo, 0.50, 0.50)
	GUI:setTouchEnabled(img_suo, false)
	GUI:setTag(img_suo, 354)

	-- Create l_item_1_0
	local l_item_1_0 = GUI:Layout_Create(lv_btn, "l_item_1_0", 0.00, 391.00, 276.00, 36.00, false)
	GUI:setTouchEnabled(l_item_1_0, true)
	GUI:setTag(l_item_1_0, 360)

	-- Create btn_3
	local btn_3 = GUI:Button_Create(l_item_1_0, "btn_3", 67.09, 18.00, "res/custom/common/btn_13_1.png")
	GUI:Button_loadTexturePressed(btn_3, "res/custom/common/btn_13_2.png")
	GUI:Button_setScale9Slice(btn_3, 15, 15, 11, 11)
	GUI:setContentSize(btn_3, 114, 36)
	GUI:setIgnoreContentAdaptWithSize(btn_3, false)
	GUI:Button_setTitleText(btn_3, "")
	GUI:Button_setTitleColor(btn_3, "#414146")
	GUI:Button_setTitleFontSize(btn_3, 14)
	GUI:Button_titleDisableOutLine(btn_3)
	GUI:setAnchorPoint(btn_3, 0.50, 0.50)
	GUI:setTouchEnabled(btn_3, true)
	GUI:setTag(btn_3, 361)

	-- Create Text_1_0
	local Text_1_0 = GUI:Text_Create(btn_3, "Text_1_0", 57.00, 18.00, 18, "#f7e6c6", [[葬生窟]])
	GUI:setAnchorPoint(Text_1_0, 0.50, 0.50)
	GUI:setTouchEnabled(Text_1_0, false)
	GUI:setTag(Text_1_0, 362)
	GUI:Text_enableOutline(Text_1_0, "#1a1a1a", 2)

	-- Create img_suo
	local img_suo = GUI:Image_Create(btn_3, "img_suo", 114.00, 18.00, "res/custom/ShiJieDiTu/icon_tyzys_02.png")
	GUI:setAnchorPoint(img_suo, 0.50, 0.50)
	GUI:setTouchEnabled(img_suo, false)
	GUI:setTag(img_suo, 363)

	-- Create btn_4
	local btn_4 = GUI:Button_Create(l_item_1_0, "btn_4", 199.12, 18.00, "res/custom/common/btn_13_1.png")
	GUI:Button_loadTexturePressed(btn_4, "res/custom/common/btn_13_2.png")
	GUI:Button_setScale9Slice(btn_4, 15, 15, 11, 11)
	GUI:setContentSize(btn_4, 114, 36)
	GUI:setIgnoreContentAdaptWithSize(btn_4, false)
	GUI:Button_setTitleText(btn_4, "")
	GUI:Button_setTitleColor(btn_4, "#414146")
	GUI:Button_setTitleFontSize(btn_4, 14)
	GUI:Button_titleDisableOutLine(btn_4)
	GUI:setAnchorPoint(btn_4, 0.50, 0.50)
	GUI:setTouchEnabled(btn_4, true)
	GUI:setTag(btn_4, 364)

	-- Create Text_1_0
	local Text_1_0 = GUI:Text_Create(btn_4, "Text_1_0", 57.00, 18.00, 18, "#f7e6c6", [[天然仙泉]])
	GUI:setAnchorPoint(Text_1_0, 0.50, 0.50)
	GUI:setTouchEnabled(Text_1_0, false)
	GUI:setTag(Text_1_0, 365)
	GUI:Text_enableOutline(Text_1_0, "#1a1a1a", 2)

	-- Create img_suo
	local img_suo = GUI:Image_Create(btn_4, "img_suo", 114.00, 18.00, "res/custom/ShiJieDiTu/icon_tyzys_02.png")
	GUI:setAnchorPoint(img_suo, 0.50, 0.50)
	GUI:setTouchEnabled(img_suo, false)
	GUI:setTag(img_suo, 366)

	-- Create l_item_1_1
	local l_item_1_1 = GUI:Layout_Create(lv_btn, "l_item_1_1", 0.00, 345.00, 276.00, 36.00, false)
	GUI:setTouchEnabled(l_item_1_1, true)
	GUI:setTag(l_item_1_1, 367)

	-- Create btn_5
	local btn_5 = GUI:Button_Create(l_item_1_1, "btn_5", 67.09, 18.00, "res/custom/common/btn_13_1.png")
	GUI:Button_loadTexturePressed(btn_5, "res/custom/common/btn_13_2.png")
	GUI:Button_setScale9Slice(btn_5, 15, 15, 11, 11)
	GUI:setContentSize(btn_5, 114, 36)
	GUI:setIgnoreContentAdaptWithSize(btn_5, false)
	GUI:Button_setTitleText(btn_5, "")
	GUI:Button_setTitleColor(btn_5, "#414146")
	GUI:Button_setTitleFontSize(btn_5, 14)
	GUI:Button_titleDisableOutLine(btn_5)
	GUI:setAnchorPoint(btn_5, 0.50, 0.50)
	GUI:setTouchEnabled(btn_5, true)
	GUI:setTag(btn_5, 368)

	-- Create Text_1_0
	local Text_1_0 = GUI:Text_Create(btn_5, "Text_1_0", 57.00, 18.00, 18, "#f7e6c6", [[棋之道]])
	GUI:setAnchorPoint(Text_1_0, 0.50, 0.50)
	GUI:setTouchEnabled(Text_1_0, false)
	GUI:setTag(Text_1_0, 369)
	GUI:Text_enableOutline(Text_1_0, "#1a1a1a", 2)

	-- Create img_suo
	local img_suo = GUI:Image_Create(btn_5, "img_suo", 114.00, 18.00, "res/custom/ShiJieDiTu/icon_tyzys_02.png")
	GUI:setAnchorPoint(img_suo, 0.50, 0.50)
	GUI:setTouchEnabled(img_suo, false)
	GUI:setTag(img_suo, 370)

	-- Create btn_6
	local btn_6 = GUI:Button_Create(l_item_1_1, "btn_6", 199.12, 18.00, "res/custom/common/btn_13_1.png")
	GUI:Button_loadTexturePressed(btn_6, "res/custom/common/btn_13_2.png")
	GUI:Button_setScale9Slice(btn_6, 15, 15, 11, 11)
	GUI:setContentSize(btn_6, 114, 36)
	GUI:setIgnoreContentAdaptWithSize(btn_6, false)
	GUI:Button_setTitleText(btn_6, "")
	GUI:Button_setTitleColor(btn_6, "#414146")
	GUI:Button_setTitleFontSize(btn_6, 14)
	GUI:Button_titleDisableOutLine(btn_6)
	GUI:setAnchorPoint(btn_6, 0.50, 0.50)
	GUI:setTouchEnabled(btn_6, true)
	GUI:setTag(btn_6, 371)

	-- Create Text_1_0
	local Text_1_0 = GUI:Text_Create(btn_6, "Text_1_0", 57.00, 18.00, 18, "#f7e6c6", [[龙骨船]])
	GUI:setAnchorPoint(Text_1_0, 0.50, 0.50)
	GUI:setTouchEnabled(Text_1_0, false)
	GUI:setTag(Text_1_0, 372)
	GUI:Text_enableOutline(Text_1_0, "#1a1a1a", 2)

	-- Create img_suo
	local img_suo = GUI:Image_Create(btn_6, "img_suo", 114.00, 18.00, "res/custom/ShiJieDiTu/icon_tyzys_02.png")
	GUI:setAnchorPoint(img_suo, 0.50, 0.50)
	GUI:setTouchEnabled(img_suo, false)
	GUI:setTag(img_suo, 373)

	-- Create l_item_1_2
	local l_item_1_2 = GUI:Layout_Create(lv_btn, "l_item_1_2", 0.00, 299.00, 276.00, 36.00, false)
	GUI:setTouchEnabled(l_item_1_2, true)
	GUI:setTag(l_item_1_2, 374)

	-- Create btn_7
	local btn_7 = GUI:Button_Create(l_item_1_2, "btn_7", 67.09, 18.00, "res/custom/common/btn_13_1.png")
	GUI:Button_loadTexturePressed(btn_7, "res/custom/common/btn_13_2.png")
	GUI:Button_setScale9Slice(btn_7, 15, 15, 11, 11)
	GUI:setContentSize(btn_7, 114, 36)
	GUI:setIgnoreContentAdaptWithSize(btn_7, false)
	GUI:Button_setTitleText(btn_7, "")
	GUI:Button_setTitleColor(btn_7, "#414146")
	GUI:Button_setTitleFontSize(btn_7, 14)
	GUI:Button_titleDisableOutLine(btn_7)
	GUI:setAnchorPoint(btn_7, 0.50, 0.50)
	GUI:setTouchEnabled(btn_7, true)
	GUI:setTag(btn_7, 375)

	-- Create Text_1_0
	local Text_1_0 = GUI:Text_Create(btn_7, "Text_1_0", 57.00, 18.00, 18, "#f7e6c6", [[战神之巅]])
	GUI:setAnchorPoint(Text_1_0, 0.50, 0.50)
	GUI:setTouchEnabled(Text_1_0, false)
	GUI:setTag(Text_1_0, 376)
	GUI:Text_enableOutline(Text_1_0, "#1a1a1a", 2)

	-- Create img_suo
	local img_suo = GUI:Image_Create(btn_7, "img_suo", 114.00, 18.00, "res/custom/ShiJieDiTu/icon_tyzys_02.png")
	GUI:setAnchorPoint(img_suo, 0.50, 0.50)
	GUI:setTouchEnabled(img_suo, false)
	GUI:setTag(img_suo, 377)
end
return ui