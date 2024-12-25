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
	local img_bg = GUI:Image_Create(nd_root, "img_bg", 14.00, 320.00, "res/custom/common/00128.png")
	GUI:setContentSize(img_bg, 815, 620)
	GUI:setIgnoreContentAdaptWithSize(img_bg, false)
	GUI:setAnchorPoint(img_bg, 0.50, 1.00)
	GUI:setTouchEnabled(img_bg, true)
	GUI:setTag(img_bg, 12)

	-- Create tx_title
	local tx_title = GUI:Text_Create(img_bg, "tx_title", 117.00, 510.00, 20, "#d6c6ad", [[逆天改命]])
	GUI:setAnchorPoint(tx_title, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 73)
	GUI:Text_enableOutline(tx_title, "#000000", 2)

	-- Create btn_close
	local btn_close = GUI:Button_Create(img_bg, "btn_close", 821.00, 527.00, "res/custom/common/btn_close_1_1.png")
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
	local img_di = GUI:Image_Create(img_bg, "img_di", 273.00, 258.00, "res/custom/NTGM/img_di.jpg")
	GUI:setAnchorPoint(img_di, 0.50, 0.50)
	GUI:setTouchEnabled(img_di, true)
	GUI:setTag(img_di, -1)

	-- Create xian
	local xian = GUI:Image_Create(img_di, "xian", 473.00, 222.00, "res/custom/common/img_1.png")
	GUI:setContentSize(xian, 4, 447)
	GUI:setIgnoreContentAdaptWithSize(xian, false)
	GUI:setAnchorPoint(xian, 0.50, 0.50)
	GUI:setTouchEnabled(xian, false)
	GUI:setTag(xian, 231)

	-- Create nd_content
	local nd_content = GUI:Node_Create(img_di, "nd_content", 0.00, 0.00)
	GUI:setAnchorPoint(nd_content, 0.50, 0.50)
	GUI:setTag(nd_content, 587)

	-- Create img_kuang_1
	local img_kuang_1 = GUI:Image_Create(nd_content, "img_kuang_1", 603.00, 420.00, "res/custom/common/img_1.png")
	GUI:setAnchorPoint(img_kuang_1, 0.50, 0.50)
	GUI:setScaleX(img_kuang_1, 0.99)
	GUI:setTouchEnabled(img_kuang_1, false)
	GUI:setTag(img_kuang_1, 74)

	-- Create title_1
	local title_1 = GUI:Image_Create(img_kuang_1, "title_1", 151.00, -57.00, "res/custom/NTGM/tx_1.png")
	GUI:setAnchorPoint(title_1, 0.74, -2.34)
	GUI:setTouchEnabled(title_1, false)
	GUI:setTag(title_1, 75)

	-- Create p_cur_attr_1_1
	local p_cur_attr_1_1 = GUI:Layout_Create(img_kuang_1, "p_cur_attr_1_1", 130.00, -40.00, 210.00, 25.00, false)
	GUI:setAnchorPoint(p_cur_attr_1_1, 0.50, 0.00)
	GUI:setTouchEnabled(p_cur_attr_1_1, true)
	GUI:setTag(p_cur_attr_1_1, 78)

	-- Create Image_1_1
	local Image_1_1 = GUI:Image_Create(p_cur_attr_1_1, "Image_1_1", 138.00, 12.00, "res/custom/NTGM/img_di2.png")
	GUI:setAnchorPoint(Image_1_1, 0.50, 0.50)
	GUI:setTouchEnabled(Image_1_1, false)
	GUI:setTag(Image_1_1, 138)

	-- Create att_value_1_1
	local att_value_1_1 = GUI:Text_Create(Image_1_1, "att_value_1_1", 70.00, 10.00, 16, "#94949c", [[9999]])
	GUI:setAnchorPoint(att_value_1_1, 0.50, 0.50)
	GUI:setTouchEnabled(att_value_1_1, false)
	GUI:setTag(att_value_1_1, 152)
	GUI:Text_enableOutline(att_value_1_1, "#000000", 1)

	-- Create att_name_1_1
	local att_name_1_1 = GUI:Text_Create(p_cur_attr_1_1, "att_name_1_1", 20.00, 10.00, 16, "#94949c", [[生命值：]])
	GUI:setAnchorPoint(att_name_1_1, 0.50, 0.50)
	GUI:setTouchEnabled(att_name_1_1, false)
	GUI:setTag(att_name_1_1, 151)
	GUI:Text_enableOutline(att_name_1_1, "#000000", 1)

	-- Create p_cur_attr_1_2
	local p_cur_attr_1_2 = GUI:Layout_Create(img_kuang_1, "p_cur_attr_1_2", 130.00, -70.00, 210.00, 25.00, false)
	GUI:setAnchorPoint(p_cur_attr_1_2, 0.50, 0.00)
	GUI:setTouchEnabled(p_cur_attr_1_2, true)
	GUI:setTag(p_cur_attr_1_2, 153)

	-- Create Image_1_2
	local Image_1_2 = GUI:Image_Create(p_cur_attr_1_2, "Image_1_2", 138.00, 12.00, "res/custom/NTGM/img_di2.png")
	GUI:setAnchorPoint(Image_1_2, 0.50, 0.50)
	GUI:setTouchEnabled(Image_1_2, false)
	GUI:setTag(Image_1_2, 154)

	-- Create att_value_1_2
	local att_value_1_2 = GUI:Text_Create(Image_1_2, "att_value_1_2", 70.00, 10.00, 16, "#94949c", [[9999]])
	GUI:setAnchorPoint(att_value_1_2, 0.50, 0.50)
	GUI:setTouchEnabled(att_value_1_2, false)
	GUI:setTag(att_value_1_2, 476)
	GUI:Text_enableOutline(att_value_1_2, "#000000", 1)

	-- Create att_name_1_2
	local att_name_1_2 = GUI:Text_Create(p_cur_attr_1_2, "att_name_1_2", 20.00, 10.00, 16, "#94949c", [[生命值：]])
	GUI:setAnchorPoint(att_name_1_2, 0.50, 0.50)
	GUI:setTouchEnabled(att_name_1_2, false)
	GUI:setTag(att_name_1_2, 155)
	GUI:Text_enableOutline(att_name_1_2, "#000000", 1)

	-- Create p_cur_attr_1_3
	local p_cur_attr_1_3 = GUI:Layout_Create(img_kuang_1, "p_cur_attr_1_3", 130.00, -100.00, 210.00, 25.00, false)
	GUI:setAnchorPoint(p_cur_attr_1_3, 0.50, 0.00)
	GUI:setTouchEnabled(p_cur_attr_1_3, true)
	GUI:setTag(p_cur_attr_1_3, 157)

	-- Create Image_1_3
	local Image_1_3 = GUI:Image_Create(p_cur_attr_1_3, "Image_1_3", 138.00, 12.00, "res/custom/NTGM/img_di2.png")
	GUI:setAnchorPoint(Image_1_3, 0.50, 0.50)
	GUI:setTouchEnabled(Image_1_3, false)
	GUI:setTag(Image_1_3, 158)

	-- Create att_value_1_3
	local att_value_1_3 = GUI:Text_Create(Image_1_3, "att_value_1_3", 70.00, 10.00, 16, "#94949c", [[9999]])
	GUI:setAnchorPoint(att_value_1_3, 0.50, 0.50)
	GUI:setTouchEnabled(att_value_1_3, false)
	GUI:setTag(att_value_1_3, 477)
	GUI:Text_enableOutline(att_value_1_3, "#000000", 1)

	-- Create att_name_1_3
	local att_name_1_3 = GUI:Text_Create(p_cur_attr_1_3, "att_name_1_3", 20.00, 10.00, 16, "#94949c", [[生命值：]])
	GUI:setAnchorPoint(att_name_1_3, 0.50, 0.50)
	GUI:setTouchEnabled(att_name_1_3, false)
	GUI:setTag(att_name_1_3, 159)
	GUI:Text_enableOutline(att_name_1_3, "#000000", 1)

	-- Create img_kuang_2
	local img_kuang_2 = GUI:Image_Create(nd_content, "img_kuang_2", 603.00, 275.00, "res/custom/common/img_1.png")
	GUI:setAnchorPoint(img_kuang_2, 0.50, 0.50)
	GUI:setScaleX(img_kuang_2, 0.99)
	GUI:setTouchEnabled(img_kuang_2, false)
	GUI:setTag(img_kuang_2, 161)

	-- Create title_2
	local title_2 = GUI:Image_Create(img_kuang_2, "title_2", 150.00, -53.00, "res/custom/NTGM/tx_2.png")
	GUI:setAnchorPoint(title_2, 0.74, -2.34)
	GUI:setTouchEnabled(title_2, false)
	GUI:setTag(title_2, 162)

	-- Create p_cur_attr_2_1
	local p_cur_attr_2_1 = GUI:Layout_Create(img_kuang_2, "p_cur_attr_2_1", 130.00, -40.00, 210.00, 25.00, false)
	GUI:setAnchorPoint(p_cur_attr_2_1, 0.50, 0.00)
	GUI:setTouchEnabled(p_cur_attr_2_1, true)
	GUI:setTag(p_cur_attr_2_1, 163)

	-- Create Image_2_1
	local Image_2_1 = GUI:Image_Create(p_cur_attr_2_1, "Image_2_1", 138.00, 12.00, "res/custom/NTGM/img_di2.png")
	GUI:setAnchorPoint(Image_2_1, 0.50, 0.50)
	GUI:setTouchEnabled(Image_2_1, false)
	GUI:setTag(Image_2_1, 164)

	-- Create att_value_2_1
	local att_value_2_1 = GUI:Text_Create(Image_2_1, "att_value_2_1", 70.00, 10.00, 16, "#94949c", [[9999]])
	GUI:setAnchorPoint(att_value_2_1, 0.50, 0.50)
	GUI:setTouchEnabled(att_value_2_1, false)
	GUI:setTag(att_value_2_1, 479)
	GUI:Text_enableOutline(att_value_2_1, "#000000", 1)

	-- Create att_name_2_1
	local att_name_2_1 = GUI:Text_Create(p_cur_attr_2_1, "att_name_2_1", 20.00, 10.00, 16, "#94949c", [[生命值：]])
	GUI:setAnchorPoint(att_name_2_1, 0.50, 0.50)
	GUI:setTouchEnabled(att_name_2_1, false)
	GUI:setTag(att_name_2_1, 165)
	GUI:Text_enableOutline(att_name_2_1, "#000000", 1)

	-- Create p_cur_attr_2_2
	local p_cur_attr_2_2 = GUI:Layout_Create(img_kuang_2, "p_cur_attr_2_2", 130.00, -70.00, 210.00, 25.00, false)
	GUI:setAnchorPoint(p_cur_attr_2_2, 0.50, 0.00)
	GUI:setTouchEnabled(p_cur_attr_2_2, true)
	GUI:setTag(p_cur_attr_2_2, 167)

	-- Create Image_2_2
	local Image_2_2 = GUI:Image_Create(p_cur_attr_2_2, "Image_2_2", 138.00, 12.00, "res/custom/NTGM/img_di2.png")
	GUI:setAnchorPoint(Image_2_2, 0.50, 0.50)
	GUI:setTouchEnabled(Image_2_2, false)
	GUI:setTag(Image_2_2, 168)

	-- Create att_value_2_2
	local att_value_2_2 = GUI:Text_Create(Image_2_2, "att_value_2_2", 70.00, 10.00, 16, "#94949c", [[9999]])
	GUI:setAnchorPoint(att_value_2_2, 0.50, 0.50)
	GUI:setTouchEnabled(att_value_2_2, false)
	GUI:setTag(att_value_2_2, 480)
	GUI:Text_enableOutline(att_value_2_2, "#000000", 1)

	-- Create att_name_2_2
	local att_name_2_2 = GUI:Text_Create(p_cur_attr_2_2, "att_name_2_2", 20.00, 10.00, 16, "#94949c", [[生命值：]])
	GUI:setAnchorPoint(att_name_2_2, 0.50, 0.50)
	GUI:setTouchEnabled(att_name_2_2, false)
	GUI:setTag(att_name_2_2, 169)
	GUI:Text_enableOutline(att_name_2_2, "#000000", 1)

	-- Create p_cur_attr_2_3
	local p_cur_attr_2_3 = GUI:Layout_Create(img_kuang_2, "p_cur_attr_2_3", 130.00, -100.00, 210.00, 25.00, false)
	GUI:setAnchorPoint(p_cur_attr_2_3, 0.50, 0.00)
	GUI:setTouchEnabled(p_cur_attr_2_3, true)
	GUI:setTag(p_cur_attr_2_3, 171)

	-- Create Image_2_3
	local Image_2_3 = GUI:Image_Create(p_cur_attr_2_3, "Image_2_3", 138.00, 12.00, "res/custom/NTGM/img_di2.png")
	GUI:setAnchorPoint(Image_2_3, 0.50, 0.50)
	GUI:setTouchEnabled(Image_2_3, false)
	GUI:setTag(Image_2_3, 172)

	-- Create att_value_2_3
	local att_value_2_3 = GUI:Text_Create(Image_2_3, "att_value_2_3", 70.00, 10.00, 16, "#94949c", [[9999]])
	GUI:setAnchorPoint(att_value_2_3, 0.50, 0.50)
	GUI:setTouchEnabled(att_value_2_3, false)
	GUI:setTag(att_value_2_3, 481)
	GUI:Text_enableOutline(att_value_2_3, "#000000", 1)

	-- Create att_name_2_3
	local att_name_2_3 = GUI:Text_Create(p_cur_attr_2_3, "att_name_2_3", 20.00, 10.00, 16, "#94949c", [[生命值：]])
	GUI:setAnchorPoint(att_name_2_3, 0.50, 0.50)
	GUI:setTouchEnabled(att_name_2_3, false)
	GUI:setTag(att_name_2_3, 173)
	GUI:Text_enableOutline(att_name_2_3, "#000000", 1)

	-- Create btn_up
	local btn_up = GUI:Button_Create(nd_content, "btn_up", 603.00, 40.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(btn_up, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(btn_up, 15, 15, 11, 11)
	GUI:setContentSize(btn_up, 125, 39)
	GUI:setIgnoreContentAdaptWithSize(btn_up, false)
	GUI:Button_setTitleText(btn_up, "")
	GUI:Button_setTitleColor(btn_up, "#414146")
	GUI:Button_setTitleFontSize(btn_up, 14)
	GUI:Button_titleDisableOutLine(btn_up)
	GUI:setAnchorPoint(btn_up, 0.50, 0.50)
	GUI:setTouchEnabled(btn_up, true)
	GUI:setTag(btn_up, 98)

	-- Create Text_14
	local Text_14 = GUI:Text_Create(btn_up, "Text_14", 62.00, 18.00, 18, "#ffff00", [[浴火重生]])
	GUI:setAnchorPoint(Text_14, 0.50, 0.50)
	GUI:setTouchEnabled(Text_14, false)
	GUI:setTag(Text_14, 99)
	GUI:Text_enableOutline(Text_14, "#000000", 1)

	-- Create need_item_1
	local need_item_1 = GUI:Layout_Create(nd_content, "need_item_1", 607.00, 103.00, 229.00, 25.00, false)
	GUI:setAnchorPoint(need_item_1, 0.50, 0.00)
	GUI:setTouchEnabled(need_item_1, true)
	GUI:setTag(need_item_1, 229)

	-- Create need_item_2
	local need_item_2 = GUI:Layout_Create(nd_content, "need_item_2", 607.00, 131.00, 229.00, 25.00, false)
	GUI:setAnchorPoint(need_item_2, 0.50, 0.00)
	GUI:setTouchEnabled(need_item_2, true)
	GUI:setTag(need_item_2, 107)

	-- Create probability
	local probability = GUI:Layout_Create(nd_content, "probability", 633.00, 73.00, 150.00, 25.00, false)
	GUI:setAnchorPoint(probability, 0.50, 0.00)
	GUI:setTouchEnabled(probability, true)
	GUI:setTag(probability, 235)

	-- Create pro_name_1
	local pro_name_1 = GUI:Text_Create(probability, "pro_name_1", 47.00, 17.00, 16, "#94949c", [[成功率：]])
	GUI:setAnchorPoint(pro_name_1, 1.00, 0.66)
	GUI:setTouchEnabled(pro_name_1, false)
	GUI:setTag(pro_name_1, 236)
	GUI:Text_enableOutline(pro_name_1, "#000000", 1)

	-- Create pro_value_1
	local pro_value_1 = GUI:Text_Create(probability, "pro_value_1", 54.00, 13.00, 16, "#4ae74a", [[100%]])
	GUI:setAnchorPoint(pro_value_1, 0.00, 0.50)
	GUI:setTouchEnabled(pro_value_1, false)
	GUI:setTag(pro_value_1, 237)
	GUI:Text_enableOutline(pro_value_1, "#000000", 1)

	-- Create btn_list
	local btn_list = GUI:Node_Create(img_bg, "btn_list", 171.00, 519.00)
	GUI:setAnchorPoint(btn_list, 0.50, 0.50)
	GUI:setTag(btn_list, 198)

	-- Create img_texiao
	local img_texiao = GUI:Image_Create(btn_list, "img_texiao", 103.00, -85.00, "res/custom/NTGM/img_quan.png")
	GUI:setAnchorPoint(img_texiao, 0.50, 0.50)
	GUI:setScaleX(img_texiao, 0.90)
	GUI:setScaleY(img_texiao, 0.90)
	GUI:setTouchEnabled(img_texiao, false)
	GUI:setTag(img_texiao, 108)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(btn_list, "Button_1", 103.00, -84.00, "res/custom/NTGM/img_icon1.png")
	GUI:Button_loadTexturePressed(Button_1, "res/custom/NTGM/img_icon1.png")
	GUI:Button_loadTextureDisabled(Button_1, "res/custom/NTGM/img_icon1.png")
	GUI:Button_setScale9Slice(Button_1, 15, 15, 11, 11)
	GUI:setContentSize(Button_1, 60, 60)
	GUI:setIgnoreContentAdaptWithSize(Button_1, false)
	GUI:Button_setTitleText(Button_1, "")
	GUI:Button_setTitleColor(Button_1, "#414146")
	GUI:Button_setTitleFontSize(Button_1, 14)
	GUI:Button_titleDisableOutLine(Button_1)
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 199)

	-- Create lv_1
	local lv_1 = GUI:Layout_Create(Button_1, "lv_1", -7.00, -25.00, 70.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(lv_1, 1)
	GUI:Layout_setBackGroundColor(lv_1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(lv_1, 102)
	GUI:setOpacity(lv_1, 0)
	GUI:setTouchEnabled(lv_1, true)
	GUI:setTag(lv_1, 134)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(btn_list, "Button_2", 200.00, -117.00, "res/custom/NTGM/img_icon2.png")
	GUI:Button_loadTexturePressed(Button_2, "res/custom/NTGM/img_icon2.png")
	GUI:Button_loadTextureDisabled(Button_2, "res/custom/NTGM/img_icon2.png")
	GUI:Button_setScale9Slice(Button_2, 15, 15, 11, 11)
	GUI:setContentSize(Button_2, 62, 63)
	GUI:setIgnoreContentAdaptWithSize(Button_2, false)
	GUI:Button_setTitleText(Button_2, "")
	GUI:Button_setTitleColor(Button_2, "#414146")
	GUI:Button_setTitleFontSize(Button_2, 14)
	GUI:Button_titleDisableOutLine(Button_2)
	GUI:setAnchorPoint(Button_2, 0.50, 0.50)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 201)

	-- Create lv_2
	local lv_2 = GUI:Layout_Create(Button_2, "lv_2", -6.00, -24.00, 70.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(lv_2, 1)
	GUI:Layout_setBackGroundColor(lv_2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(lv_2, 102)
	GUI:setOpacity(lv_2, 0)
	GUI:setTouchEnabled(lv_2, true)
	GUI:setTag(lv_2, 135)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(btn_list, "Button_3", 259.00, -198.00, "res/custom/NTGM/img_icon3.png")
	GUI:Button_loadTexturePressed(Button_3, "res/custom/NTGM/img_icon3.png")
	GUI:Button_loadTextureDisabled(Button_3, "res/custom/NTGM/img_icon3.png")
	GUI:Button_setScale9Slice(Button_3, 15, 15, 11, 11)
	GUI:setContentSize(Button_3, 65, 61)
	GUI:setIgnoreContentAdaptWithSize(Button_3, false)
	GUI:Button_setTitleText(Button_3, "")
	GUI:Button_setTitleColor(Button_3, "#414146")
	GUI:Button_setTitleFontSize(Button_3, 14)
	GUI:Button_titleDisableOutLine(Button_3)
	GUI:setAnchorPoint(Button_3, 0.50, 0.50)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 203)

	-- Create lv_3
	local lv_3 = GUI:Layout_Create(Button_3, "lv_3", -5.00, -24.00, 75.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(lv_3, 1)
	GUI:Layout_setBackGroundColor(lv_3, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(lv_3, 102)
	GUI:setOpacity(lv_3, 0)
	GUI:setTouchEnabled(lv_3, true)
	GUI:setTag(lv_3, 136)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(btn_list, "Button_4", 259.00, -303.00, "res/custom/NTGM/img_icon4.png")
	GUI:Button_loadTexturePressed(Button_4, "res/custom/NTGM/img_icon4.png")
	GUI:Button_loadTextureDisabled(Button_4, "res/custom/NTGM/img_icon4.png")
	GUI:Button_setScale9Slice(Button_4, 15, 15, 11, 11)
	GUI:setContentSize(Button_4, 65, 59)
	GUI:setIgnoreContentAdaptWithSize(Button_4, false)
	GUI:Button_setTitleText(Button_4, "")
	GUI:Button_setTitleColor(Button_4, "#414146")
	GUI:Button_setTitleFontSize(Button_4, 14)
	GUI:Button_titleDisableOutLine(Button_4)
	GUI:setAnchorPoint(Button_4, 0.50, 0.50)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, 205)

	-- Create lv_4
	local lv_4 = GUI:Layout_Create(Button_4, "lv_4", -6.00, -25.00, 75.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(lv_4, 1)
	GUI:Layout_setBackGroundColor(lv_4, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(lv_4, 102)
	GUI:setOpacity(lv_4, 0)
	GUI:setTouchEnabled(lv_4, true)
	GUI:setTag(lv_4, 131)

	-- Create Button_5
	local Button_5 = GUI:Button_Create(btn_list, "Button_5", 200.00, -384.00, "res/custom/NTGM/img_icon5.png")
	GUI:Button_loadTexturePressed(Button_5, "res/custom/NTGM/img_icon5.png")
	GUI:Button_loadTextureDisabled(Button_5, "res/custom/NTGM/img_icon5.png")
	GUI:Button_setScale9Slice(Button_5, 15, 15, 11, 11)
	GUI:setContentSize(Button_5, 63, 60)
	GUI:setIgnoreContentAdaptWithSize(Button_5, false)
	GUI:Button_setTitleText(Button_5, "")
	GUI:Button_setTitleColor(Button_5, "#414146")
	GUI:Button_setTitleFontSize(Button_5, 14)
	GUI:Button_titleDisableOutLine(Button_5)
	GUI:setAnchorPoint(Button_5, 0.50, 0.50)
	GUI:setTouchEnabled(Button_5, true)
	GUI:setTag(Button_5, 207)

	-- Create lv_5
	local lv_5 = GUI:Layout_Create(Button_5, "lv_5", -6.00, -24.00, 75.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(lv_5, 1)
	GUI:Layout_setBackGroundColor(lv_5, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(lv_5, 102)
	GUI:setOpacity(lv_5, 0)
	GUI:setTouchEnabled(lv_5, true)
	GUI:setTag(lv_5, 130)

	-- Create Button_6
	local Button_6 = GUI:Button_Create(btn_list, "Button_6", 100.00, -417.00, "res/custom/NTGM/img_icon6.png")
	GUI:Button_loadTexturePressed(Button_6, "res/custom/NTGM/img_icon6.png")
	GUI:Button_loadTextureDisabled(Button_6, "res/custom/NTGM/img_icon6.png")
	GUI:Button_setScale9Slice(Button_6, 15, 15, 11, 11)
	GUI:setContentSize(Button_6, 65, 60)
	GUI:setIgnoreContentAdaptWithSize(Button_6, false)
	GUI:Button_setTitleText(Button_6, "")
	GUI:Button_setTitleColor(Button_6, "#414146")
	GUI:Button_setTitleFontSize(Button_6, 14)
	GUI:Button_titleDisableOutLine(Button_6)
	GUI:setAnchorPoint(Button_6, 0.50, 0.50)
	GUI:setTouchEnabled(Button_6, true)
	GUI:setTag(Button_6, 209)

	-- Create lv_6
	local lv_6 = GUI:Layout_Create(Button_6, "lv_6", -6.00, -23.00, 75.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(lv_6, 1)
	GUI:Layout_setBackGroundColor(lv_6, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(lv_6, 102)
	GUI:setOpacity(lv_6, 0)
	GUI:setTouchEnabled(lv_6, true)
	GUI:setTag(lv_6, 133)

	-- Create Button_7
	local Button_7 = GUI:Button_Create(btn_list, "Button_7", 4.00, -385.00, "res/custom/NTGM/img_icon7.png")
	GUI:Button_loadTexturePressed(Button_7, "res/custom/NTGM/img_icon7.png")
	GUI:Button_loadTextureDisabled(Button_7, "res/custom/NTGM/img_icon7.png")
	GUI:Button_setScale9Slice(Button_7, 15, 15, 11, 11)
	GUI:setContentSize(Button_7, 65, 60)
	GUI:setIgnoreContentAdaptWithSize(Button_7, false)
	GUI:Button_setTitleText(Button_7, "")
	GUI:Button_setTitleColor(Button_7, "#414146")
	GUI:Button_setTitleFontSize(Button_7, 14)
	GUI:Button_titleDisableOutLine(Button_7)
	GUI:setAnchorPoint(Button_7, 0.50, 0.50)
	GUI:setTouchEnabled(Button_7, true)
	GUI:setTag(Button_7, 211)

	-- Create lv_7
	local lv_7 = GUI:Layout_Create(Button_7, "lv_7", -6.00, -24.00, 75.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(lv_7, 1)
	GUI:Layout_setBackGroundColor(lv_7, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(lv_7, 102)
	GUI:setOpacity(lv_7, 0)
	GUI:setTouchEnabled(lv_7, true)
	GUI:setTag(lv_7, 137)

	-- Create Button_8
	local Button_8 = GUI:Button_Create(btn_list, "Button_8", -58.00, -304.00, "res/custom/NTGM/img_icon8.png")
	GUI:Button_loadTexturePressed(Button_8, "res/custom/NTGM/img_icon8.png")
	GUI:Button_loadTextureDisabled(Button_8, "res/custom/NTGM/img_icon8.png")
	GUI:Button_setScale9Slice(Button_8, 15, 15, 11, 11)
	GUI:setContentSize(Button_8, 65, 61)
	GUI:setIgnoreContentAdaptWithSize(Button_8, false)
	GUI:Button_setTitleText(Button_8, "")
	GUI:Button_setTitleColor(Button_8, "#414146")
	GUI:Button_setTitleFontSize(Button_8, 14)
	GUI:Button_titleDisableOutLine(Button_8)
	GUI:setAnchorPoint(Button_8, 0.50, 0.50)
	GUI:setTouchEnabled(Button_8, true)
	GUI:setTag(Button_8, 213)

	-- Create lv_8
	local lv_8 = GUI:Layout_Create(Button_8, "lv_8", -5.00, -23.00, 75.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(lv_8, 1)
	GUI:Layout_setBackGroundColor(lv_8, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(lv_8, 102)
	GUI:setOpacity(lv_8, 0)
	GUI:setTouchEnabled(lv_8, true)
	GUI:setTag(lv_8, 129)

	-- Create Button_9
	local Button_9 = GUI:Button_Create(btn_list, "Button_9", -57.00, -199.00, "res/custom/NTGM/img_icon9.png")
	GUI:Button_loadTexturePressed(Button_9, "res/custom/NTGM/img_icon9.png")
	GUI:Button_loadTextureDisabled(Button_9, "res/custom/NTGM/img_icon9.png")
	GUI:Button_setScale9Slice(Button_9, 15, 15, 11, 11)
	GUI:setContentSize(Button_9, 65, 64)
	GUI:setIgnoreContentAdaptWithSize(Button_9, false)
	GUI:Button_setTitleText(Button_9, "")
	GUI:Button_setTitleColor(Button_9, "#414146")
	GUI:Button_setTitleFontSize(Button_9, 14)
	GUI:Button_titleDisableOutLine(Button_9)
	GUI:setAnchorPoint(Button_9, 0.50, 0.50)
	GUI:setTouchEnabled(Button_9, true)
	GUI:setTag(Button_9, 215)

	-- Create lv_9
	local lv_9 = GUI:Layout_Create(Button_9, "lv_9", -6.00, -23.00, 75.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(lv_9, 1)
	GUI:Layout_setBackGroundColor(lv_9, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(lv_9, 102)
	GUI:setOpacity(lv_9, 0)
	GUI:setTouchEnabled(lv_9, true)
	GUI:setTag(lv_9, 132)

	-- Create Button_10
	local Button_10 = GUI:Button_Create(btn_list, "Button_10", 4.00, -117.00, "res/custom/NTGM/img_icon10.png")
	GUI:Button_loadTexturePressed(Button_10, "res/custom/NTGM/img_icon10.png")
	GUI:Button_loadTextureDisabled(Button_10, "res/custom/NTGM/img_icon10.png")
	GUI:Button_setScale9Slice(Button_10, 15, 15, 11, 11)
	GUI:setContentSize(Button_10, 65, 64)
	GUI:setIgnoreContentAdaptWithSize(Button_10, false)
	GUI:Button_setTitleText(Button_10, "")
	GUI:Button_setTitleColor(Button_10, "#414146")
	GUI:Button_setTitleFontSize(Button_10, 14)
	GUI:Button_titleDisableOutLine(Button_10)
	GUI:setAnchorPoint(Button_10, 0.50, 0.50)
	GUI:setTouchEnabled(Button_10, true)
	GUI:setTag(Button_10, 217)

	-- Create lv_10
	local lv_10 = GUI:Layout_Create(Button_10, "lv_10", -5.00, -24.00, 75.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(lv_10, 1)
	GUI:Layout_setBackGroundColor(lv_10, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(lv_10, 102)
	GUI:setOpacity(lv_10, 0)
	GUI:setTouchEnabled(lv_10, true)
	GUI:setTag(lv_10, 128)

	-- Create Sprite_1
	local Sprite_1 = GUI:Image_Create(Layer, "Sprite_1", 0.00, 0.00, "Default/Sprite.png")
	GUI:setOpacity(Sprite_1, 62)
	GUI:setTouchEnabled(Sprite_1, false)
	GUI:setTag(Sprite_1, 71)
	GUI:setVisible(Sprite_1, false)
end
return ui