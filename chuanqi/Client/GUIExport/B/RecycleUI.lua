local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create la_bg
	local la_bg = GUI:Layout_Create(Layer, "la_bg", -2.00, 0.00, 1136.00, 640.00, false)
	GUI:Layout_setBackGroundColorType(la_bg, 1)
	GUI:Layout_setBackGroundColor(la_bg, "#000000")
	GUI:Layout_setBackGroundColorOpacity(la_bg, 102)
	GUI:setTouchEnabled(la_bg, true)
	GUI:setTag(la_bg, 89)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 11)

	-- Create img_bg
	local img_bg = GUI:Image_Create(nd_root, "img_bg", 0.00, 0.00, "res/custom/huishou/img_1.jpg")
	GUI:setContentSize(img_bg, 430, 460)
	GUI:setIgnoreContentAdaptWithSize(img_bg, false)
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg, false)
	GUI:setTag(img_bg, 12)

	-- Create btn_close
	local btn_close = GUI:Button_Create(img_bg, "btn_close", 429.00, 458.00, "res/custom/common/btn_close_1_1.png")
	GUI:Button_loadTexturePressed(btn_close, "res/custom/common/btn_close_1_2.png")
	GUI:Button_setScale9Slice(btn_close, 8, 8, 11, 11)
	GUI:setContentSize(btn_close, 26, 42)
	GUI:setIgnoreContentAdaptWithSize(btn_close, false)
	GUI:Button_setTitleText(btn_close, "")
	GUI:Button_setTitleColor(btn_close, "#414146")
	GUI:Button_setTitleFontSize(btn_close, 14)
	GUI:Button_titleDisableOutLine(btn_close)
	GUI:setAnchorPoint(btn_close, 0.00, 1.00)
	GUI:setTouchEnabled(btn_close, true)
	GUI:setTag(btn_close, 14)

	-- Create img_di
	local img_di = GUI:Layout_Create(img_bg, "img_di", 16.00, 447.00, 400.00, 427.00, false)
	GUI:Layout_setBackGroundColorType(img_di, 1)
	GUI:Layout_setBackGroundColor(img_di, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(img_di, 0)
	GUI:setAnchorPoint(img_di, 0.00, 1.00)
	GUI:setTouchEnabled(img_di, true)
	GUI:setTag(img_di, 81)

	-- Create img_title
	local img_title = GUI:Image_Create(img_di, "img_title", 198.00, 403.00, "res/custom/huishou/title_1.png")
	GUI:setAnchorPoint(img_title, 0.50, 0.50)
	GUI:setTouchEnabled(img_title, false)
	GUI:setTag(img_title, 320)

	-- Create img_1
	local img_1 = GUI:Image_Create(img_di, "img_1", 198.00, 401.00, "res/custom/common/img_1.png")
	GUI:setAnchorPoint(img_1, 0.50, 0.50)
	GUI:setTouchEnabled(img_1, false)
	GUI:setTag(img_1, 82)

	-- Create img_2
	local img_2 = GUI:Image_Create(img_di, "img_2", 198.00, 381.00, "res/custom/common/img_line_2.png")
	GUI:setContentSize(img_2, 670, 5)
	GUI:setIgnoreContentAdaptWithSize(img_2, false)
	GUI:setAnchorPoint(img_2, 0.50, 0.50)
	GUI:setScaleX(img_2, 0.60)
	GUI:setScaleY(img_2, 0.55)
	GUI:setTouchEnabled(img_2, false)
	GUI:setTag(img_2, 83)

	-- Create img_3
	local img_3 = GUI:Image_Create(img_di, "img_3", 198.00, 71.00, "res/custom/common/img_line_2.png")
	GUI:setContentSize(img_3, 670, 5)
	GUI:setIgnoreContentAdaptWithSize(img_3, false)
	GUI:setAnchorPoint(img_3, 0.50, 0.50)
	GUI:setScaleX(img_3, 0.60)
	GUI:setScaleY(img_3, 0.55)
	GUI:setTouchEnabled(img_3, false)
	GUI:setTag(img_3, 84)

	-- Create btn_recycle
	local btn_recycle = GUI:Button_Create(nd_root, "btn_recycle", 94.00, -180.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(btn_recycle, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(btn_recycle, 15, 15, 11, 11)
	GUI:setContentSize(btn_recycle, 122, 34)
	GUI:setIgnoreContentAdaptWithSize(btn_recycle, false)
	GUI:Button_setTitleText(btn_recycle, "")
	GUI:Button_setTitleColor(btn_recycle, "#414146")
	GUI:Button_setTitleFontSize(btn_recycle, 18)
	GUI:Button_titleEnableOutline(btn_recycle, "#000000", 1)
	GUI:setAnchorPoint(btn_recycle, 0.50, 0.50)
	GUI:setTouchEnabled(btn_recycle, true)
	GUI:setTag(btn_recycle, 1703)

	-- Create Text_14
	local Text_14 = GUI:Text_Create(btn_recycle, "Text_14", 61.00, 18.00, 18, "#c0c0c0", [[确认回收]])
	GUI:setAnchorPoint(Text_14, 0.50, 0.50)
	GUI:setTouchEnabled(Text_14, false)
	GUI:setTag(Text_14, 251)
	GUI:Text_enableOutline(Text_14, "#000000", 1)

	-- Create check_auto_recycle
	local check_auto_recycle = GUI:Layout_Create(nd_root, "check_auto_recycle", -152.00, -163.00, 200.00, 30.00, false)
	GUI:setAnchorPoint(check_auto_recycle, 0.00, 1.00)
	GUI:setTouchEnabled(check_auto_recycle, false)
	GUI:setTag(check_auto_recycle, 323)

	-- Create check_autorecycle
	local check_autorecycle = GUI:CheckBox_Create(check_auto_recycle, "check_autorecycle", 12.00, 15.00, "res/custom/Gem/cb_1_1.png", "res/custom/Gem/cb_1_2.png")
	GUI:CheckBox_setSelected(check_autorecycle, false)
	GUI:setAnchorPoint(check_autorecycle, 0.50, 0.50)
	GUI:setTouchEnabled(check_autorecycle, false)
	GUI:setTag(check_autorecycle, 324)

	-- Create tx_title
	local tx_title = GUI:Text_Create(check_auto_recycle, "tx_title", 33.00, 15.00, 16, "#edf1f6", [[开启自动回收功能]])
	GUI:setAnchorPoint(tx_title, 0.00, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 325)
	GUI:Text_enableOutline(tx_title, "#000000", 1)

	-- Create btn_auto_recycle
	local btn_auto_recycle = GUI:Button_Create(check_auto_recycle, "btn_auto_recycle", 80.00, 14.00, "res/private/gui_edit/Button_Normal.png")
	GUI:Button_setScale9Slice(btn_auto_recycle, 0, 0, 0, 0)
	GUI:setContentSize(btn_auto_recycle, 170, 30)
	GUI:setIgnoreContentAdaptWithSize(btn_auto_recycle, false)
	GUI:Button_setTitleText(btn_auto_recycle, "")
	GUI:Button_setTitleColor(btn_auto_recycle, "#414146")
	GUI:Button_setTitleFontSize(btn_auto_recycle, 14)
	GUI:Button_titleDisableOutLine(btn_auto_recycle)
	GUI:setAnchorPoint(btn_auto_recycle, 0.50, 0.50)
	GUI:setOpacity(btn_auto_recycle, 0)
	GUI:setTouchEnabled(btn_auto_recycle, true)
	GUI:setTag(btn_auto_recycle, 327)

	-- Create template_1
	local template_1 = GUI:Layout_Create(nd_root, "template_1", 0.00, 300.00, 40.00, 70.00, false)
	GUI:Layout_setBackGroundColorType(template_1, 1)
	GUI:Layout_setBackGroundColor(template_1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(template_1, 0)
	GUI:setTouchEnabled(template_1, true)
	GUI:setTag(template_1, 231)

	-- Create btn_switch
	local btn_switch = GUI:Button_Create(template_1, "btn_switch", 230.00, -176.00, "res/custom/common/btn_1_1.png")
	GUI:Button_loadTexturePressed(btn_switch, "res/custom/common/btn_1_2.png")
	GUI:Button_loadTextureDisabled(btn_switch, "res/custom/common/btn_1_2.png")
	GUI:Button_setScale9Slice(btn_switch, 15, 15, 11, 11)
	GUI:setContentSize(btn_switch, 36, 99)
	GUI:setIgnoreContentAdaptWithSize(btn_switch, false)
	GUI:Button_setTitleText(btn_switch, "")
	GUI:Button_setTitleColor(btn_switch, "#787974")
	GUI:Button_setTitleFontSize(btn_switch, 14)
	GUI:Button_titleDisableOutLine(btn_switch)
	GUI:setAnchorPoint(btn_switch, 0.50, 0.50)
	GUI:setTouchEnabled(btn_switch, true)
	GUI:setTag(btn_switch, 232)

	-- Create tx_switch
	local tx_switch = GUI:Text_Create(btn_switch, "tx_switch", 14.00, 60.00, 18, "#747071", [[页
签]])
	GUI:setAnchorPoint(tx_switch, 0.50, 0.50)
	GUI:setTouchEnabled(tx_switch, false)
	GUI:setTag(tx_switch, 233)
	GUI:Text_enableOutline(tx_switch, "#000000", 1)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(nd_root, "ListView_1", 207.00, 179.00, 40.00, 370.00, 1)
	GUI:ListView_setBackGroundColorType(ListView_1, 1)
	GUI:ListView_setBackGroundColor(ListView_1, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_1, 0)
	GUI:ListView_setGravity(ListView_1, 5)
	GUI:setAnchorPoint(ListView_1, 0.00, 1.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 230)

	-- Create template_2
	local template_2 = GUI:Layout_Create(nd_root, "template_2", -200.00, 128.00, 335.00, 40.00, false)
	GUI:Layout_setBackGroundColorType(template_2, 1)
	GUI:Layout_setBackGroundColor(template_2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(template_2, 0)
	GUI:setTouchEnabled(template_2, true)
	GUI:setTag(template_2, 349)

	-- Create img_1
	local img_1 = GUI:Button_Create(template_2, "img_1", 23.00, 13.00, "res/custom/touming.png")
	GUI:Button_setScale9Slice(img_1, 3, 4, 3, 4)
	GUI:setContentSize(img_1, 150, 30)
	GUI:setIgnoreContentAdaptWithSize(img_1, false)
	GUI:Button_setTitleText(img_1, "")
	GUI:Button_setTitleColor(img_1, "#414146")
	GUI:Button_setTitleFontSize(img_1, 14)
	GUI:Button_titleDisableOutLine(img_1)
	GUI:setAnchorPoint(img_1, 0.00, 0.50)
	GUI:setTouchEnabled(img_1, true)
	GUI:setTag(img_1, 370)

	-- Create type_name
	local type_name = GUI:Text_Create(img_1, "type_name", 25.00, 10.00, 16, "#edf1f6", [[套装1套装1]])
	GUI:setTouchEnabled(type_name, false)
	GUI:setTag(type_name, 369)
	GUI:Text_enableOutline(type_name, "#000000", 1)

	-- Create check_recycle
	local check_recycle = GUI:CheckBox_Create(img_1, "check_recycle", 0.00, 10.00, "res/custom/Gem/cb_1_1.png", "res/custom/Gem/cb_1_2.png")
	GUI:CheckBox_setSelected(check_recycle, false)
	GUI:setTouchEnabled(check_recycle, true)
	GUI:setTag(check_recycle, 368)

	-- Create img_2
	local img_2 = GUI:Button_Create(template_2, "img_2", 217.00, 13.00, "res/custom/touming.png")
	GUI:Button_setScale9Slice(img_2, 3, 4, 3, 4)
	GUI:setContentSize(img_2, 150, 30)
	GUI:setIgnoreContentAdaptWithSize(img_2, false)
	GUI:Button_setTitleText(img_2, "")
	GUI:Button_setTitleColor(img_2, "#414146")
	GUI:Button_setTitleFontSize(img_2, 14)
	GUI:Button_titleDisableOutLine(img_2)
	GUI:setAnchorPoint(img_2, 0.00, 0.50)
	GUI:setTouchEnabled(img_2, true)
	GUI:setTag(img_2, 449)

	-- Create type_name
	local type_name = GUI:Text_Create(img_2, "type_name", 25.00, 10.00, 16, "#edf1f6", [[套装1套装1]])
	GUI:setTouchEnabled(type_name, false)
	GUI:setTag(type_name, 450)
	GUI:Text_enableOutline(type_name, "#000000", 1)

	-- Create check_recycle
	local check_recycle = GUI:CheckBox_Create(img_2, "check_recycle", 0.00, 10.00, "res/custom/Gem/cb_1_1.png", "res/custom/Gem/cb_1_2.png")
	GUI:CheckBox_setSelected(check_recycle, false)
	GUI:setTouchEnabled(check_recycle, true)
	GUI:setTag(check_recycle, 451)

	-- Create ListView_2
	local ListView_2 = GUI:ListView_Create(nd_root, "ListView_2", -199.00, -132.00, 400.00, 300.00, 1)
	GUI:ListView_setBackGroundColorType(ListView_2, 1)
	GUI:ListView_setBackGroundColor(ListView_2, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_2, 0)
	GUI:ListView_setGravity(ListView_2, 5)
	GUI:setTouchEnabled(ListView_2, true)
	GUI:setTag(ListView_2, 348)

	-- Create Hidewnd
	local Hidewnd = GUI:Layout_Create(nd_root, "Hidewnd", -175.00, -200.00, 500.00, 440.00, false)
	GUI:Layout_setBackGroundColorType(Hidewnd, 1)
	GUI:Layout_setBackGroundColor(Hidewnd, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(Hidewnd, 0)
	GUI:setScaleX(Hidewnd, 0.85)
	GUI:setScaleY(Hidewnd, 0.85)
	GUI:setTouchEnabled(Hidewnd, true)
	GUI:setTag(Hidewnd, 428)

	-- Create Hidewnd_bg
	local Hidewnd_bg = GUI:Image_Create(Hidewnd, "Hidewnd_bg", -3.00, 223.00, "res/custom/hecheng/img_bg_3.png")
	GUI:setContentSize(Hidewnd_bg, 460, 568)
	GUI:setIgnoreContentAdaptWithSize(Hidewnd_bg, false)
	GUI:setAnchorPoint(Hidewnd_bg, 0.00, 0.50)
	GUI:setTouchEnabled(Hidewnd_bg, true)
	GUI:setTag(Hidewnd_bg, 429)

	-- Create Hidewnd_closeBtn
	local Hidewnd_closeBtn = GUI:Button_Create(Hidewnd, "Hidewnd_closeBtn", 457.00, 506.00, "res/custom/common/btn_close_1_1.png")
	GUI:Button_loadTexturePressed(Hidewnd_closeBtn, "res/custom/common/btn_close_1_2.png")
	GUI:Button_loadTextureDisabled(Hidewnd_closeBtn, "res/custom/common/btn_close_1_2.png")
	GUI:Button_setScale9Slice(Hidewnd_closeBtn, 8, 8, 11, 11)
	GUI:setContentSize(Hidewnd_closeBtn, 26, 42)
	GUI:setIgnoreContentAdaptWithSize(Hidewnd_closeBtn, false)
	GUI:Button_setTitleText(Hidewnd_closeBtn, "")
	GUI:Button_setTitleColor(Hidewnd_closeBtn, "#414146")
	GUI:Button_setTitleFontSize(Hidewnd_closeBtn, 14)
	GUI:Button_titleDisableOutLine(Hidewnd_closeBtn)
	GUI:setAnchorPoint(Hidewnd_closeBtn, 0.00, 1.00)
	GUI:setScaleX(Hidewnd_closeBtn, 1.15)
	GUI:setScaleY(Hidewnd_closeBtn, 1.15)
	GUI:setTouchEnabled(Hidewnd_closeBtn, true)
	GUI:setTag(Hidewnd_closeBtn, 430)

	-- Create Hidewnd_xian
	local Hidewnd_xian = GUI:Image_Create(Hidewnd, "Hidewnd_xian", 226.00, 32.00, "res/custom/common/img_line_2.png")
	GUI:setContentSize(Hidewnd_xian, 420, 5)
	GUI:setIgnoreContentAdaptWithSize(Hidewnd_xian, false)
	GUI:setAnchorPoint(Hidewnd_xian, 0.50, 0.50)
	GUI:setTouchEnabled(Hidewnd_xian, false)
	GUI:setTag(Hidewnd_xian, 202)

	-- Create Hidewnd_alloff
	local Hidewnd_alloff = GUI:Button_Create(Hidewnd, "Hidewnd_alloff", 336.00, -9.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(Hidewnd_alloff, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(Hidewnd_alloff, 15, 15, 11, 11)
	GUI:setContentSize(Hidewnd_alloff, 120, 40)
	GUI:setIgnoreContentAdaptWithSize(Hidewnd_alloff, false)
	GUI:Button_setTitleText(Hidewnd_alloff, "")
	GUI:Button_setTitleColor(Hidewnd_alloff, "#414146")
	GUI:Button_setTitleFontSize(Hidewnd_alloff, 14)
	GUI:Button_titleDisableOutLine(Hidewnd_alloff)
	GUI:setAnchorPoint(Hidewnd_alloff, 0.50, 0.50)
	GUI:setTouchEnabled(Hidewnd_alloff, true)
	GUI:setTag(Hidewnd_alloff, 198)

	-- Create Text
	local Text = GUI:Text_Create(Hidewnd_alloff, "Text", 60.00, 20.00, 20, "#c0c0c0", [[全不选]])
	GUI:setAnchorPoint(Text, 0.50, 0.50)
	GUI:setTouchEnabled(Text, false)
	GUI:setTag(Text, 199)
	GUI:Text_enableOutline(Text, "#000000", 1)

	-- Create Hidewnd_allon
	local Hidewnd_allon = GUI:Button_Create(Hidewnd, "Hidewnd_allon", 127.00, -9.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(Hidewnd_allon, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(Hidewnd_allon, 15, 15, 11, 11)
	GUI:setContentSize(Hidewnd_allon, 120, 40)
	GUI:setIgnoreContentAdaptWithSize(Hidewnd_allon, false)
	GUI:Button_setTitleText(Hidewnd_allon, "")
	GUI:Button_setTitleColor(Hidewnd_allon, "#414146")
	GUI:Button_setTitleFontSize(Hidewnd_allon, 14)
	GUI:Button_titleDisableOutLine(Hidewnd_allon)
	GUI:setAnchorPoint(Hidewnd_allon, 0.50, 0.50)
	GUI:setTouchEnabled(Hidewnd_allon, true)
	GUI:setTag(Hidewnd_allon, 200)

	-- Create Text
	local Text = GUI:Text_Create(Hidewnd_allon, "Text", 61.00, 20.00, 20, "#c0c0c0", [[全 选]])
	GUI:setAnchorPoint(Text, 0.50, 0.50)
	GUI:setTouchEnabled(Text, false)
	GUI:setTag(Text, 201)
	GUI:Text_enableOutline(Text, "#000000", 1)

	-- Create template_3
	local template_3 = GUI:Layout_Create(Hidewnd, "template_3", 0.00, 390.00, 315.00, 60.00, false)
	GUI:Layout_setBackGroundColorType(template_3, 1)
	GUI:Layout_setBackGroundColor(template_3, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(template_3, 0)
	GUI:setTouchEnabled(template_3, true)
	GUI:setTag(template_3, 453)

	-- Create img_1
	local img_1 = GUI:Button_Create(template_3, "img_1", 70.00, 21.00, "res/custom/touming.png")
	GUI:Button_setScale9Slice(img_1, 3, 4, 3, 4)
	GUI:setContentSize(img_1, 150, 60)
	GUI:setIgnoreContentAdaptWithSize(img_1, false)
	GUI:Button_setTitleText(img_1, "")
	GUI:Button_setTitleColor(img_1, "#414146")
	GUI:Button_setTitleFontSize(img_1, 14)
	GUI:Button_titleDisableOutLine(img_1)
	GUI:setAnchorPoint(img_1, 0.00, 0.50)
	GUI:setTouchEnabled(img_1, true)
	GUI:setTag(img_1, 454)

	-- Create item_bg
	local item_bg = GUI:Layout_Create(img_1, "item_bg", -50.00, 22.00, 30.00, 30.00, false)
	GUI:Layout_setBackGroundColorType(item_bg, 1)
	GUI:Layout_setBackGroundColor(item_bg, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(item_bg, 0)
	GUI:setTouchEnabled(item_bg, true)
	GUI:setTag(item_bg, 1397)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(img_1, "Image_1", -68.00, 5.00, "res/custom/shajuan/shajuan_1.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.50)
	GUI:setScaleX(Image_1, 0.58)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 1398)

	-- Create item_name
	local item_name = GUI:Text_Create(img_1, "item_name", 25.00, 26.00, 18, "#edf1f6", [[套装1套装1]])
	GUI:setTouchEnabled(item_name, false)
	GUI:setTag(item_name, 455)
	GUI:Text_enableOutline(item_name, "#000000", 1)

	-- Create item_price
	local item_price = GUI:Text_Create(img_1, "item_price", 230.00, 26.00, 18, "#edf1f6", [[套装1套装1价格]])
	GUI:setAnchorPoint(item_price, 0.50, 0.00)
	GUI:setTouchEnabled(item_price, false)
	GUI:setTag(item_price, 265)
	GUI:Text_enableOutline(item_price, "#000000", 1)

	-- Create item_recycle
	local item_recycle = GUI:Button_Create(img_1, "item_recycle", 26.00, 20.00, "res/private/gui_edit/Button_Normal.png")
	GUI:Button_setScale9Slice(item_recycle, 0, 0, 0, 0)
	GUI:setContentSize(item_recycle, 330, 33)
	GUI:setIgnoreContentAdaptWithSize(item_recycle, false)
	GUI:Button_setTitleText(item_recycle, "")
	GUI:Button_setTitleColor(item_recycle, "#414146")
	GUI:Button_setTitleFontSize(item_recycle, 14)
	GUI:Button_titleDisableOutLine(item_recycle)
	GUI:setOpacity(item_recycle, 0)
	GUI:setTouchEnabled(item_recycle, true)
	GUI:setTag(item_recycle, 266)

	-- Create check_recycle
	local check_recycle = GUI:CheckBox_Create(img_1, "check_recycle", 0.00, 26.00, "res/custom/Gem/cb_1_1.png", "res/custom/Gem/cb_1_2.png")
	GUI:CheckBox_setSelected(check_recycle, false)
	GUI:setTouchEnabled(check_recycle, true)
	GUI:setTag(check_recycle, 456)

	-- Create ListView_3
	local ListView_3 = GUI:ListView_Create(Hidewnd, "ListView_3", 13.00, 485.00, 430.00, 450.00, 1)
	GUI:ListView_setBackGroundColorType(ListView_3, 1)
	GUI:ListView_setBackGroundColor(ListView_3, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_3, 0)
	GUI:ListView_setGravity(ListView_3, 5)
	GUI:setAnchorPoint(ListView_3, 0.00, 1.00)
	GUI:setTouchEnabled(ListView_3, true)
	GUI:setTag(ListView_3, 452)
end
return ui