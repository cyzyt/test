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
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setScaleX(img_bg, 1.10)
	GUI:setScaleY(img_bg, 1.17)
	GUI:setTouchEnabled(img_bg, true)
	GUI:setTag(img_bg, 12)

	-- Create tx_title
	local tx_title = GUI:Text_Create(img_bg, "tx_title", 81.00, 445.00, 20, "#d6c6ad", [[熔炉]])
	GUI:setAnchorPoint(tx_title, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 73)
	GUI:Text_enableOutline(tx_title, "#000000", 2)

	-- Create btn_close
	local btn_close = GUI:Button_Create(img_bg, "btn_close", 746.00, 456.00, "res/custom/common/btn_close_1_1.png")
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
	local img_di = GUI:Image_Create(img_bg, "img_di", 370.00, 225.00, "res/custom/fenjie/img_1.jpg")
	GUI:setAnchorPoint(img_di, 0.50, 0.50)
	GUI:setScaleX(img_di, 0.90)
	GUI:setScaleY(img_di, 0.86)
	GUI:setTouchEnabled(img_di, false)
	GUI:setTag(img_di, 586)

	-- Create img_di2
	local img_di2 = GUI:Layout_Create(img_bg, "img_di2", 38.00, 108.00, 405.00, 308.00, true)
	GUI:Layout_setBackGroundColorType(img_di2, 1)
	GUI:Layout_setBackGroundColor(img_di2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(img_di2, 0)
	GUI:setTouchEnabled(img_di2, true)
	GUI:setTag(img_di2, 551)

	-- Create Image_6
	local Image_6 = GUI:Image_Create(img_di2, "Image_6", 331.00, 161.00, "res/custom/common/00128.png")
	GUI:setAnchorPoint(Image_6, 0.50, 0.50)
	GUI:setTouchEnabled(Image_6, false)
	GUI:setTag(Image_6, 550)

	-- Create xian
	local xian = GUI:Image_Create(img_bg, "xian", 36.00, 105.00, "res/custom/common/img_line_2.png")
	GUI:setContentSize(xian, 666, 5)
	GUI:setIgnoreContentAdaptWithSize(xian, false)
	GUI:setAnchorPoint(xian, 0.00, 0.50)
	GUI:setTouchEnabled(xian, false)
	GUI:setTag(xian, 552)

	-- Create btn_fenjie
	local btn_fenjie = GUI:Button_Create(img_bg, "btn_fenjie", 580.00, 69.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(btn_fenjie, "res/custom/common/btn_2_2.png")
	GUI:Button_loadTextureDisabled(btn_fenjie, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(btn_fenjie, 15, 15, 11, 11)
	GUI:setContentSize(btn_fenjie, 125, 39)
	GUI:setIgnoreContentAdaptWithSize(btn_fenjie, false)
	GUI:Button_setTitleText(btn_fenjie, "熔   炼")
	GUI:Button_setTitleColor(btn_fenjie, "#ffff00")
	GUI:Button_setTitleFontSize(btn_fenjie, 18)
	GUI:Button_titleEnableOutline(btn_fenjie, "#000000", 1)
	GUI:setAnchorPoint(btn_fenjie, 0.50, 0.50)
	GUI:setTouchEnabled(btn_fenjie, true)
	GUI:setTag(btn_fenjie, 639)

	-- Create Desc_text
	local Desc_text = GUI:Layout_Create(img_bg, "Desc_text", 30.00, 39.00, 420.00, 60.00, false)
	GUI:Layout_setBackGroundColorType(Desc_text, 1)
	GUI:Layout_setBackGroundColor(Desc_text, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(Desc_text, 0)
	GUI:setTouchEnabled(Desc_text, true)
	GUI:setTag(Desc_text, 125)

	-- Create Text_23
	local Text_23 = GUI:Text_Create(nd_root, "Text_23", 237.00, 150.00, 20, "#d6c6ad", [[可分解]])
	GUI:setAnchorPoint(Text_23, 0.52, 0.40)
	GUI:setTouchEnabled(Text_23, false)
	GUI:setTag(Text_23, 267)
	GUI:Text_enableOutline(Text_23, "#000000", 1)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(nd_root, "ListView_1", 97.00, 131.00, 280.00, 325.00, 1)
	GUI:ListView_setBackGroundColorType(ListView_1, 1)
	GUI:ListView_setBackGroundColor(ListView_1, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_1, 0)
	GUI:ListView_setGravity(ListView_1, 5)
	GUI:setAnchorPoint(ListView_1, 0.00, 1.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 565)

	-- Create ListView_2
	local ListView_2 = GUI:ListView_Create(nd_root, "ListView_2", -352.00, 169.00, 445.00, 320.00, 1)
	GUI:ListView_setBackGroundColorType(ListView_2, 1)
	GUI:ListView_setBackGroundColor(ListView_2, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_2, 0)
	GUI:ListView_setGravity(ListView_2, 5)
	GUI:setAnchorPoint(ListView_2, 0.00, 1.00)
	GUI:setTouchEnabled(ListView_2, true)
	GUI:setTag(ListView_2, 617)

	-- Create check_auto_recycle
	local check_auto_recycle = GUI:Layout_Create(nd_root, "check_auto_recycle", -124.00, -151.00, 200.00, 30.00, false)
	GUI:setAnchorPoint(check_auto_recycle, 0.00, 1.00)
	GUI:setTouchEnabled(check_auto_recycle, false)
	GUI:setTag(check_auto_recycle, 203)

	-- Create btn_auto_recycle
	local btn_auto_recycle = GUI:Button_Create(check_auto_recycle, "btn_auto_recycle", 80.00, 14.00, "res/custom/touming.png")
	GUI:Button_setScale9Slice(btn_auto_recycle, 3, 4, 3, 4)
	GUI:setContentSize(btn_auto_recycle, 170, 30)
	GUI:setIgnoreContentAdaptWithSize(btn_auto_recycle, false)
	GUI:Button_setTitleText(btn_auto_recycle, "")
	GUI:Button_setTitleColor(btn_auto_recycle, "#414146")
	GUI:Button_setTitleFontSize(btn_auto_recycle, 14)
	GUI:Button_titleDisableOutLine(btn_auto_recycle)
	GUI:setAnchorPoint(btn_auto_recycle, 0.50, 0.50)
	GUI:setTouchEnabled(btn_auto_recycle, true)
	GUI:setTag(btn_auto_recycle, 206)

	-- Create check_autorecycle
	local check_autorecycle = GUI:CheckBox_Create(check_auto_recycle, "check_autorecycle", 12.00, 15.00, "res/custom/Gem/cb_1_1.png", "res/custom/Gem/cb_1_2.png")
	GUI:CheckBox_setSelected(check_autorecycle, false)
	GUI:setAnchorPoint(check_autorecycle, 0.50, 0.50)
	GUI:setTouchEnabled(check_autorecycle, false)
	GUI:setTag(check_autorecycle, 204)

	-- Create tx_title
	local tx_title = GUI:Text_Create(check_auto_recycle, "tx_title", 33.00, 15.00, 16, "#edf1f6", [[开启自动熔炼功能]])
	GUI:setAnchorPoint(tx_title, 0.00, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 205)
	GUI:Text_enableOutline(tx_title, "#000000", 1)

	-- Create Hidewnd
	local Hidewnd = GUI:Layout_Create(nd_root, "Hidewnd", -348.00, -200.00, 535.00, 440.00, false)
	GUI:Layout_setBackGroundColorType(Hidewnd, 1)
	GUI:Layout_setBackGroundColor(Hidewnd, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(Hidewnd, 0)
	GUI:setScaleX(Hidewnd, 0.85)
	GUI:setScaleY(Hidewnd, 0.85)
	GUI:setTouchEnabled(Hidewnd, true)
	GUI:setTag(Hidewnd, 74)

	-- Create hideWnd_close
	local hideWnd_close = GUI:Layout_Create(Hidewnd, "hideWnd_close", 0.00, 0.00, 535.00, 440.00, false)
	GUI:Layout_setBackGroundColorType(hideWnd_close, 1)
	GUI:Layout_setBackGroundColor(hideWnd_close, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(hideWnd_close, 0)
	GUI:setTouchEnabled(hideWnd_close, true)
	GUI:setTag(hideWnd_close, 85)

	-- Create hideWnd_bg
	local hideWnd_bg = GUI:Image_Create(Hidewnd, "hideWnd_bg", 265.00, 219.00, "res/custom/hecheng/img_bg_3.png")
	GUI:setAnchorPoint(hideWnd_bg, 0.50, 0.50)
	GUI:setTouchEnabled(hideWnd_bg, true)
	GUI:setTag(hideWnd_bg, 75)

	-- Create hideWnd_closeBtn
	local hideWnd_closeBtn = GUI:Button_Create(Hidewnd, "hideWnd_closeBtn", 431.00, 438.00, "res/custom/common/btn_close_1_1.png")
	GUI:Button_loadTexturePressed(hideWnd_closeBtn, "res/custom/common/btn_close_1_2.png")
	GUI:Button_loadTextureDisabled(hideWnd_closeBtn, "res/custom/common/btn_close_1_2.png")
	GUI:Button_setScale9Slice(hideWnd_closeBtn, 8, 8, 11, 11)
	GUI:setContentSize(hideWnd_closeBtn, 26, 42)
	GUI:setIgnoreContentAdaptWithSize(hideWnd_closeBtn, false)
	GUI:Button_setTitleText(hideWnd_closeBtn, "")
	GUI:Button_setTitleColor(hideWnd_closeBtn, "#414146")
	GUI:Button_setTitleFontSize(hideWnd_closeBtn, 14)
	GUI:Button_titleDisableOutLine(hideWnd_closeBtn)
	GUI:setAnchorPoint(hideWnd_closeBtn, 0.00, 1.00)
	GUI:setTouchEnabled(hideWnd_closeBtn, true)
	GUI:setTag(hideWnd_closeBtn, 76)

	-- Create hideWnd_xian
	local hideWnd_xian = GUI:Image_Create(Hidewnd, "hideWnd_xian", 265.00, 75.00, "res/custom/common/img_line_2.png")
	GUI:setContentSize(hideWnd_xian, 310, 5)
	GUI:setIgnoreContentAdaptWithSize(hideWnd_xian, false)
	GUI:setAnchorPoint(hideWnd_xian, 0.50, 0.50)
	GUI:setTouchEnabled(hideWnd_xian, false)
	GUI:setTag(hideWnd_xian, 95)

	-- Create hideWnd_allOn
	local hideWnd_allOn = GUI:Button_Create(Hidewnd, "hideWnd_allOn", 192.00, 45.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(hideWnd_allOn, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(hideWnd_allOn, 15, 15, 11, 11)
	GUI:setContentSize(hideWnd_allOn, 80, 33)
	GUI:setIgnoreContentAdaptWithSize(hideWnd_allOn, false)
	GUI:Button_setTitleText(hideWnd_allOn, "")
	GUI:Button_setTitleColor(hideWnd_allOn, "#414146")
	GUI:Button_setTitleFontSize(hideWnd_allOn, 14)
	GUI:Button_titleDisableOutLine(hideWnd_allOn)
	GUI:setAnchorPoint(hideWnd_allOn, 0.50, 0.50)
	GUI:setTouchEnabled(hideWnd_allOn, true)
	GUI:setTag(hideWnd_allOn, 164)

	-- Create Text
	local Text = GUI:Text_Create(hideWnd_allOn, "Text", 40.00, 17.00, 18, "#c0c0c0", [[全 选]])
	GUI:setAnchorPoint(Text, 0.50, 0.50)
	GUI:setTouchEnabled(Text, false)
	GUI:setTag(Text, 165)
	GUI:Text_enableOutline(Text, "#000000", 1)

	-- Create hideWnd_allOff
	local hideWnd_allOff = GUI:Button_Create(Hidewnd, "hideWnd_allOff", 334.00, 45.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(hideWnd_allOff, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(hideWnd_allOff, 15, 15, 11, 11)
	GUI:setContentSize(hideWnd_allOff, 80, 33)
	GUI:setIgnoreContentAdaptWithSize(hideWnd_allOff, false)
	GUI:Button_setTitleText(hideWnd_allOff, "")
	GUI:Button_setTitleColor(hideWnd_allOff, "#414146")
	GUI:Button_setTitleFontSize(hideWnd_allOff, 14)
	GUI:Button_titleDisableOutLine(hideWnd_allOff)
	GUI:setAnchorPoint(hideWnd_allOff, 0.50, 0.50)
	GUI:setTouchEnabled(hideWnd_allOff, true)
	GUI:setTag(hideWnd_allOff, 166)

	-- Create Text
	local Text = GUI:Text_Create(hideWnd_allOff, "Text", 40.00, 17.00, 18, "#c0c0c0", [[全不选]])
	GUI:setAnchorPoint(Text, 0.50, 0.50)
	GUI:setTouchEnabled(Text, false)
	GUI:setTag(Text, 167)
	GUI:Text_enableOutline(Text, "#000000", 1)

	-- Create ListView_3
	local ListView_3 = GUI:ListView_Create(Hidewnd, "ListView_3", 106.00, 426.00, 315.00, 350.00, 1)
	GUI:ListView_setBackGroundColorType(ListView_3, 1)
	GUI:ListView_setBackGroundColor(ListView_3, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_3, 0)
	GUI:ListView_setGravity(ListView_3, 5)
	GUI:setAnchorPoint(ListView_3, 0.00, 1.00)
	GUI:setTouchEnabled(ListView_3, true)
	GUI:setTag(ListView_3, 77)

	-- Create template_1
	local template_1 = GUI:Layout_Create(nd_root, "template_1", -341.00, 118.00, 335.00, 45.00, false)
	GUI:Layout_setBackGroundColorType(template_1, 1)
	GUI:Layout_setBackGroundColor(template_1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(template_1, 0)
	GUI:setTouchEnabled(template_1, true)
	GUI:setTag(template_1, 618)
	GUI:setVisible(template_1, false)

	-- Create img_1
	local img_1 = GUI:Button_Create(template_1, "img_1", 18.00, 14.00, "res/custom/touming.png")
	GUI:Button_setScale9Slice(img_1, 0, 400, 0, 400)
	GUI:setContentSize(img_1, 110, 30)
	GUI:setIgnoreContentAdaptWithSize(img_1, false)
	GUI:Button_setTitleText(img_1, "")
	GUI:Button_setTitleColor(img_1, "#414146")
	GUI:Button_setTitleFontSize(img_1, 14)
	GUI:Button_titleDisableOutLine(img_1)
	GUI:setAnchorPoint(img_1, 0.00, 0.50)
	GUI:setTouchEnabled(img_1, true)
	GUI:setTag(img_1, 619)

	-- Create type_name
	local type_name = GUI:Text_Create(img_1, "type_name", 25.00, 10.00, 16, "#edf1f6", [[套装1套装1]])
	GUI:setTouchEnabled(type_name, false)
	GUI:setTag(type_name, 620)
	GUI:Text_enableOutline(type_name, "#000000", 1)

	-- Create check_recycle
	local check_recycle = GUI:CheckBox_Create(img_1, "check_recycle", 0.00, 10.00, "res/custom/Gem/cb_1_1.png", "res/custom/Gem/cb_1_2.png")
	GUI:CheckBox_setSelected(check_recycle, false)
	GUI:setTouchEnabled(check_recycle, true)
	GUI:setTag(check_recycle, 621)

	-- Create item_recycle
	local item_recycle = GUI:Button_Create(img_1, "item_recycle", 16.00, 0.00, "res/private/gui_edit/Button_Normal.png")
	GUI:Button_setScale9Slice(item_recycle, 0, 0, 0, 0)
	GUI:setContentSize(item_recycle, 110, 30)
	GUI:setIgnoreContentAdaptWithSize(item_recycle, false)
	GUI:Button_setTitleText(item_recycle, "")
	GUI:Button_setTitleColor(item_recycle, "#414146")
	GUI:Button_setTitleFontSize(item_recycle, 14)
	GUI:Button_titleDisableOutLine(item_recycle)
	GUI:setOpacity(item_recycle, 0)
	GUI:setTouchEnabled(item_recycle, true)
	GUI:setTag(item_recycle, 72)

	-- Create img_2
	local img_2 = GUI:Button_Create(template_1, "img_2", 166.00, 14.00, "res/custom/touming.png")
	GUI:Button_setScale9Slice(img_2, 0, 400, 0, 400)
	GUI:setContentSize(img_2, 110, 30)
	GUI:setIgnoreContentAdaptWithSize(img_2, false)
	GUI:Button_setTitleText(img_2, "")
	GUI:Button_setTitleColor(img_2, "#414146")
	GUI:Button_setTitleFontSize(img_2, 14)
	GUI:Button_titleDisableOutLine(img_2)
	GUI:setAnchorPoint(img_2, 0.00, 0.50)
	GUI:setTouchEnabled(img_2, true)
	GUI:setTag(img_2, 622)

	-- Create type_name
	local type_name = GUI:Text_Create(img_2, "type_name", 25.00, 10.00, 16, "#edf1f6", [[套装1套装1]])
	GUI:setTouchEnabled(type_name, false)
	GUI:setTag(type_name, 623)
	GUI:Text_enableOutline(type_name, "#000000", 1)

	-- Create check_recycle
	local check_recycle = GUI:CheckBox_Create(img_2, "check_recycle", 0.00, 10.00, "res/custom/Gem/cb_1_1.png", "res/custom/Gem/cb_1_2.png")
	GUI:CheckBox_setSelected(check_recycle, false)
	GUI:setTouchEnabled(check_recycle, true)
	GUI:setTag(check_recycle, 624)

	-- Create item_recycle
	local item_recycle = GUI:Button_Create(img_2, "item_recycle", 16.00, 0.00, "res/private/gui_edit/Button_Normal.png")
	GUI:Button_setScale9Slice(item_recycle, 0, 0, 0, 0)
	GUI:setContentSize(item_recycle, 110, 30)
	GUI:setIgnoreContentAdaptWithSize(item_recycle, false)
	GUI:Button_setTitleText(item_recycle, "")
	GUI:Button_setTitleColor(item_recycle, "#414146")
	GUI:Button_setTitleFontSize(item_recycle, 14)
	GUI:Button_titleDisableOutLine(item_recycle)
	GUI:setOpacity(item_recycle, 0)
	GUI:setTouchEnabled(item_recycle, true)
	GUI:setTag(item_recycle, 73)

	-- Create img_3
	local img_3 = GUI:Button_Create(template_1, "img_3", 314.00, 14.00, "res/custom/touming.png")
	GUI:Button_setScale9Slice(img_3, 0, 400, 0, 400)
	GUI:setContentSize(img_3, 110, 30)
	GUI:setIgnoreContentAdaptWithSize(img_3, false)
	GUI:Button_setTitleText(img_3, "")
	GUI:Button_setTitleColor(img_3, "#414146")
	GUI:Button_setTitleFontSize(img_3, 14)
	GUI:Button_titleDisableOutLine(img_3)
	GUI:setAnchorPoint(img_3, 0.00, 0.50)
	GUI:setTouchEnabled(img_3, true)
	GUI:setTag(img_3, 194)

	-- Create type_name
	local type_name = GUI:Text_Create(img_3, "type_name", 25.00, 10.00, 16, "#edf1f6", [[套装1套装1]])
	GUI:setTouchEnabled(type_name, false)
	GUI:setTag(type_name, 195)
	GUI:Text_enableOutline(type_name, "#000000", 1)

	-- Create check_recycle
	local check_recycle = GUI:CheckBox_Create(img_3, "check_recycle", 0.00, 10.00, "res/custom/Gem/cb_1_1.png", "res/custom/Gem/cb_1_2.png")
	GUI:CheckBox_setSelected(check_recycle, false)
	GUI:setTouchEnabled(check_recycle, true)
	GUI:setTag(check_recycle, 196)

	-- Create item_recycle
	local item_recycle = GUI:Button_Create(img_3, "item_recycle", 16.00, 0.00, "res/private/gui_edit/Button_Normal.png")
	GUI:Button_setScale9Slice(item_recycle, 0, 0, 0, 0)
	GUI:setContentSize(item_recycle, 110, 30)
	GUI:setIgnoreContentAdaptWithSize(item_recycle, false)
	GUI:Button_setTitleText(item_recycle, "")
	GUI:Button_setTitleColor(item_recycle, "#414146")
	GUI:Button_setTitleFontSize(item_recycle, 14)
	GUI:Button_titleDisableOutLine(item_recycle)
	GUI:setOpacity(item_recycle, 0)
	GUI:setTouchEnabled(item_recycle, true)
	GUI:setTag(item_recycle, 197)

	-- Create template_3
	local template_3 = GUI:Layout_Create(nd_root, "template_3", -261.00, 117.00, 315.00, 45.00, false)
	GUI:Layout_setBackGroundColorType(template_3, 1)
	GUI:Layout_setBackGroundColor(template_3, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(template_3, 0)
	GUI:setTouchEnabled(template_3, true)
	GUI:setTag(template_3, 78)
	GUI:setVisible(template_3, false)

	-- Create img_1
	local img_1 = GUI:Button_Create(template_3, "img_1", 47.00, 13.00, "res/custom/touming.png")
	GUI:Button_setScale9Slice(img_1, 0, 400, 0, 400)
	GUI:setContentSize(img_1, 150, 33)
	GUI:setIgnoreContentAdaptWithSize(img_1, false)
	GUI:Button_setTitleText(img_1, "")
	GUI:Button_setTitleColor(img_1, "#414146")
	GUI:Button_setTitleFontSize(img_1, 14)
	GUI:Button_titleDisableOutLine(img_1)
	GUI:setAnchorPoint(img_1, 0.00, 0.50)
	GUI:setTouchEnabled(img_1, true)
	GUI:setTag(img_1, 79)

	-- Create item
	local item = GUI:Layout_Create(img_1, "item", 25.00, 5.00, 25.00, 25.00, false)
	GUI:Layout_setBackGroundColorType(item, 1)
	GUI:Layout_setBackGroundColor(item, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(item, 0)
	GUI:setTouchEnabled(item, true)
	GUI:setTag(item, 94)

	-- Create item_name
	local item_name = GUI:Text_Create(img_1, "item_name", 30.00, 10.00, 18, "#edf1f6", [[套装1套装1]])
	GUI:setTouchEnabled(item_name, false)
	GUI:setTag(item_name, 80)
	GUI:Text_enableOutline(item_name, "#000000", 1)

	-- Create item_recycle
	local item_recycle = GUI:Button_Create(img_1, "item_recycle", -5.00, -1.00, "res/private/gui_edit/Button_Normal.png")
	GUI:Button_setScale9Slice(item_recycle, 0, 0, 0, 0)
	GUI:setContentSize(item_recycle, 180, 33)
	GUI:setIgnoreContentAdaptWithSize(item_recycle, false)
	GUI:Button_setTitleText(item_recycle, "")
	GUI:Button_setTitleColor(item_recycle, "#414146")
	GUI:Button_setTitleFontSize(item_recycle, 14)
	GUI:Button_titleDisableOutLine(item_recycle)
	GUI:setOpacity(item_recycle, 0)
	GUI:setTouchEnabled(item_recycle, true)
	GUI:setTag(item_recycle, 82)

	-- Create check_recycle
	local check_recycle = GUI:CheckBox_Create(img_1, "check_recycle", 0.00, 10.00, "res/custom/Gem/cb_1_1.png", "res/custom/Gem/cb_1_2.png")
	GUI:CheckBox_setSelected(check_recycle, false)
	GUI:setTouchEnabled(check_recycle, true)
	GUI:setTag(check_recycle, 83)

	-- Create template_2
	local template_2 = GUI:Layout_Create(Layer, "template_2", 665.00, 380.00, 280.00, 70.00, false)
	GUI:Layout_setBackGroundColorType(template_2, 1)
	GUI:Layout_setBackGroundColor(template_2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(template_2, 0)
	GUI:setTouchEnabled(template_2, true)
	GUI:setTag(template_2, 871)
	GUI:setVisible(template_2, false)

	-- Create img_cell_1
	local img_cell_1 = GUI:Image_Create(template_2, "img_cell_1", 35.00, 34.00, "res/custom/common/img_cell_1.png")
	GUI:setAnchorPoint(img_cell_1, 0.50, 0.50)
	GUI:setTouchEnabled(img_cell_1, false)
	GUI:setTag(img_cell_1, 872)

	-- Create img_gou
	local img_gou = GUI:Image_Create(img_cell_1, "img_gou", 0.00, 0.00, "res/custom/common/img_cell_2.png")
	GUI:Image_setScale9Slice(img_gou, 21, 21, 21, 21)
	GUI:setContentSize(img_gou, 64, 64)
	GUI:setIgnoreContentAdaptWithSize(img_gou, false)
	GUI:setTouchEnabled(img_gou, false)
	GUI:setTag(img_gou, 876)

	-- Create img_cell_2
	local img_cell_2 = GUI:Image_Create(template_2, "img_cell_2", 104.00, 34.00, "res/custom/common/img_cell_1.png")
	GUI:setAnchorPoint(img_cell_2, 0.50, 0.50)
	GUI:setTouchEnabled(img_cell_2, false)
	GUI:setTag(img_cell_2, 873)

	-- Create img_gou
	local img_gou = GUI:Image_Create(img_cell_2, "img_gou", 0.00, 0.00, "res/custom/common/img_cell_2.png")
	GUI:Image_setScale9Slice(img_gou, 21, 21, 21, 21)
	GUI:setContentSize(img_gou, 64, 64)
	GUI:setIgnoreContentAdaptWithSize(img_gou, false)
	GUI:setTouchEnabled(img_gou, false)
	GUI:setTag(img_gou, 877)

	-- Create img_cell_3
	local img_cell_3 = GUI:Image_Create(template_2, "img_cell_3", 174.00, 34.00, "res/custom/common/img_cell_1.png")
	GUI:setAnchorPoint(img_cell_3, 0.50, 0.50)
	GUI:setTouchEnabled(img_cell_3, false)
	GUI:setTag(img_cell_3, 874)

	-- Create img_gou
	local img_gou = GUI:Image_Create(img_cell_3, "img_gou", 0.00, 0.00, "res/custom/common/img_cell_2.png")
	GUI:Image_setScale9Slice(img_gou, 21, 21, 21, 21)
	GUI:setContentSize(img_gou, 64, 64)
	GUI:setIgnoreContentAdaptWithSize(img_gou, false)
	GUI:setTouchEnabled(img_gou, false)
	GUI:setTag(img_gou, 879)

	-- Create img_cell_4
	local img_cell_4 = GUI:Image_Create(template_2, "img_cell_4", 243.00, 34.00, "res/custom/common/img_cell_1.png")
	GUI:setAnchorPoint(img_cell_4, 0.50, 0.50)
	GUI:setTouchEnabled(img_cell_4, false)
	GUI:setTag(img_cell_4, 875)

	-- Create img_gou
	local img_gou = GUI:Image_Create(img_cell_4, "img_gou", 0.00, 0.00, "res/custom/common/img_cell_2.png")
	GUI:Image_setScale9Slice(img_gou, 21, 21, 21, 21)
	GUI:setContentSize(img_gou, 64, 64)
	GUI:setIgnoreContentAdaptWithSize(img_gou, false)
	GUI:setTouchEnabled(img_gou, false)
	GUI:setTag(img_gou, 880)
end
return ui