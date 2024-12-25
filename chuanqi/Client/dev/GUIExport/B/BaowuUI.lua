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
	local img_bg = GUI:Image_Create(nd_root, "img_bg", 14.00, 303.00, "res/custom/common/00128.png")
	GUI:setContentSize(img_bg, 815, 620)
	GUI:setIgnoreContentAdaptWithSize(img_bg, false)
	GUI:setAnchorPoint(img_bg, 0.50, 1.00)
	GUI:setTouchEnabled(img_bg, true)
	GUI:setTag(img_bg, 12)

	-- Create tx_title
	local tx_title = GUI:Text_Create(img_bg, "tx_title", 101.00, 510.00, 20, "#d6c6ad", [[法宝使者]])
	GUI:setAnchorPoint(tx_title, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 73)
	GUI:Text_enableOutline(tx_title, "#000000", 2)

	-- Create btn_close
	local btn_close = GUI:Button_Create(img_bg, "btn_close", 820.00, 524.00, "res/custom/common/btn_close_1_1.png")
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
	local img_di = GUI:Image_Create(img_bg, "img_di", 42.00, 256.00, "res/custom/baowu/img_1.jpg")
	GUI:setAnchorPoint(img_di, 0.00, 0.50)
	GUI:setTouchEnabled(img_di, false)
	GUI:setTag(img_di, 586)

	-- Create nd_content
	local nd_content = GUI:Node_Create(img_di, "nd_content", 0.00, 0.00)
	GUI:setAnchorPoint(nd_content, 0.50, 0.50)
	GUI:setTag(nd_content, 587)

	-- Create img_kuang_1
	local img_kuang_1 = GUI:Image_Create(nd_content, "img_kuang_1", 598.00, 420.00, "res/custom/common/img_1.png")
	GUI:setAnchorPoint(img_kuang_1, 0.50, 0.50)
	GUI:setScaleX(img_kuang_1, 0.99)
	GUI:setTouchEnabled(img_kuang_1, false)
	GUI:setTag(img_kuang_1, 74)

	-- Create p_cur_attr_1_1
	local p_cur_attr_1_1 = GUI:Layout_Create(img_kuang_1, "p_cur_attr_1_1", 130.00, -40.00, 210.00, 25.00, false)
	GUI:setAnchorPoint(p_cur_attr_1_1, 0.50, 0.00)
	GUI:setTouchEnabled(p_cur_attr_1_1, true)
	GUI:setTag(p_cur_attr_1_1, 78)

	-- Create Image_1_1
	local Image_1_1 = GUI:Image_Create(p_cur_attr_1_1, "Image_1_1", 167.00, 12.00, "res/custom/NTGM/img_di2.png")
	GUI:setContentSize(Image_1_1, 90, 20)
	GUI:setIgnoreContentAdaptWithSize(Image_1_1, false)
	GUI:setAnchorPoint(Image_1_1, 0.50, 0.50)
	GUI:setTouchEnabled(Image_1_1, false)
	GUI:setTag(Image_1_1, 138)

	-- Create att_value_1_1
	local att_value_1_1 = GUI:Text_Create(Image_1_1, "att_value_1_1", 46.00, 10.00, 16, "#94949c", [[9999]])
	GUI:setAnchorPoint(att_value_1_1, 0.50, 0.50)
	GUI:setTouchEnabled(att_value_1_1, false)
	GUI:setTag(att_value_1_1, 152)
	GUI:Text_enableOutline(att_value_1_1, "#000000", 1)

	-- Create att_name_1_1
	local att_name_1_1 = GUI:Text_Create(p_cur_attr_1_1, "att_name_1_1", 47.00, 10.00, 16, "#94949c", [[生命值：]])
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
	local Image_1_2 = GUI:Image_Create(p_cur_attr_1_2, "Image_1_2", 167.00, 12.00, "res/custom/NTGM/img_di2.png")
	GUI:setContentSize(Image_1_2, 90, 20)
	GUI:setIgnoreContentAdaptWithSize(Image_1_2, false)
	GUI:setAnchorPoint(Image_1_2, 0.50, 0.50)
	GUI:setTouchEnabled(Image_1_2, false)
	GUI:setTag(Image_1_2, 154)

	-- Create att_value_1_2
	local att_value_1_2 = GUI:Text_Create(Image_1_2, "att_value_1_2", 46.00, 10.00, 16, "#94949c", [[9999]])
	GUI:setAnchorPoint(att_value_1_2, 0.50, 0.50)
	GUI:setTouchEnabled(att_value_1_2, false)
	GUI:setTag(att_value_1_2, 476)
	GUI:Text_enableOutline(att_value_1_2, "#000000", 1)

	-- Create att_name_1_2
	local att_name_1_2 = GUI:Text_Create(p_cur_attr_1_2, "att_name_1_2", 47.00, 10.00, 16, "#94949c", [[生命值：]])
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
	local Image_1_3 = GUI:Image_Create(p_cur_attr_1_3, "Image_1_3", 167.00, 12.00, "res/custom/NTGM/img_di2.png")
	GUI:setContentSize(Image_1_3, 90, 20)
	GUI:setIgnoreContentAdaptWithSize(Image_1_3, false)
	GUI:setAnchorPoint(Image_1_3, 0.50, 0.50)
	GUI:setTouchEnabled(Image_1_3, false)
	GUI:setTag(Image_1_3, 158)

	-- Create att_value_1_3
	local att_value_1_3 = GUI:Text_Create(Image_1_3, "att_value_1_3", 46.00, 10.00, 16, "#94949c", [[9999]])
	GUI:setAnchorPoint(att_value_1_3, 0.50, 0.50)
	GUI:setTouchEnabled(att_value_1_3, false)
	GUI:setTag(att_value_1_3, 477)
	GUI:Text_enableOutline(att_value_1_3, "#000000", 1)

	-- Create att_name_1_3
	local att_name_1_3 = GUI:Text_Create(p_cur_attr_1_3, "att_name_1_3", 47.00, 10.00, 16, "#94949c", [[生命值：]])
	GUI:setAnchorPoint(att_name_1_3, 0.50, 0.50)
	GUI:setTouchEnabled(att_name_1_3, false)
	GUI:setTag(att_name_1_3, 159)
	GUI:Text_enableOutline(att_name_1_3, "#000000", 1)

	-- Create img_kuang_2
	local img_kuang_2 = GUI:Image_Create(nd_content, "img_kuang_2", 598.00, 250.00, "res/custom/common/img_1.png")
	GUI:setAnchorPoint(img_kuang_2, 0.50, 0.50)
	GUI:setScaleX(img_kuang_2, 0.99)
	GUI:setTouchEnabled(img_kuang_2, false)
	GUI:setTag(img_kuang_2, 161)

	-- Create p_cur_attr_2_1
	local p_cur_attr_2_1 = GUI:Layout_Create(img_kuang_2, "p_cur_attr_2_1", 130.00, -40.00, 210.00, 25.00, false)
	GUI:setAnchorPoint(p_cur_attr_2_1, 0.50, 0.00)
	GUI:setTouchEnabled(p_cur_attr_2_1, true)
	GUI:setTag(p_cur_attr_2_1, 163)

	-- Create Image_2_1
	local Image_2_1 = GUI:Image_Create(p_cur_attr_2_1, "Image_2_1", 167.00, 12.00, "res/custom/NTGM/img_di2.png")
	GUI:setContentSize(Image_2_1, 90, 20)
	GUI:setIgnoreContentAdaptWithSize(Image_2_1, false)
	GUI:setAnchorPoint(Image_2_1, 0.50, 0.50)
	GUI:setTouchEnabled(Image_2_1, false)
	GUI:setTag(Image_2_1, 164)

	-- Create att_value_2_1
	local att_value_2_1 = GUI:Text_Create(Image_2_1, "att_value_2_1", 46.00, 10.00, 16, "#94949c", [[9999]])
	GUI:setAnchorPoint(att_value_2_1, 0.50, 0.50)
	GUI:setTouchEnabled(att_value_2_1, false)
	GUI:setTag(att_value_2_1, 479)
	GUI:Text_enableOutline(att_value_2_1, "#000000", 1)

	-- Create att_name_2_1
	local att_name_2_1 = GUI:Text_Create(p_cur_attr_2_1, "att_name_2_1", 47.00, 10.00, 16, "#94949c", [[生命值：]])
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
	local Image_2_2 = GUI:Image_Create(p_cur_attr_2_2, "Image_2_2", 167.00, 12.00, "res/custom/NTGM/img_di2.png")
	GUI:setContentSize(Image_2_2, 90, 20)
	GUI:setIgnoreContentAdaptWithSize(Image_2_2, false)
	GUI:setAnchorPoint(Image_2_2, 0.50, 0.50)
	GUI:setTouchEnabled(Image_2_2, false)
	GUI:setTag(Image_2_2, 168)

	-- Create att_value_2_2
	local att_value_2_2 = GUI:Text_Create(Image_2_2, "att_value_2_2", 46.00, 10.00, 16, "#94949c", [[9999]])
	GUI:setAnchorPoint(att_value_2_2, 0.50, 0.50)
	GUI:setTouchEnabled(att_value_2_2, false)
	GUI:setTag(att_value_2_2, 480)
	GUI:Text_enableOutline(att_value_2_2, "#000000", 1)

	-- Create att_name_2_2
	local att_name_2_2 = GUI:Text_Create(p_cur_attr_2_2, "att_name_2_2", 47.00, 10.00, 16, "#94949c", [[生命值：]])
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
	local Image_2_3 = GUI:Image_Create(p_cur_attr_2_3, "Image_2_3", 167.00, 12.00, "res/custom/NTGM/img_di2.png")
	GUI:setContentSize(Image_2_3, 90, 20)
	GUI:setIgnoreContentAdaptWithSize(Image_2_3, false)
	GUI:setAnchorPoint(Image_2_3, 0.50, 0.50)
	GUI:setTouchEnabled(Image_2_3, false)
	GUI:setTag(Image_2_3, 172)

	-- Create att_value_2_3
	local att_value_2_3 = GUI:Text_Create(Image_2_3, "att_value_2_3", 46.00, 10.00, 16, "#94949c", [[9999]])
	GUI:setAnchorPoint(att_value_2_3, 0.50, 0.50)
	GUI:setTouchEnabled(att_value_2_3, false)
	GUI:setTag(att_value_2_3, 481)
	GUI:Text_enableOutline(att_value_2_3, "#000000", 1)

	-- Create att_name_2_3
	local att_name_2_3 = GUI:Text_Create(p_cur_attr_2_3, "att_name_2_3", 47.00, 10.00, 16, "#94949c", [[生命值：]])
	GUI:setAnchorPoint(att_name_2_3, 0.50, 0.50)
	GUI:setTouchEnabled(att_name_2_3, false)
	GUI:setTag(att_name_2_3, 173)
	GUI:Text_enableOutline(att_name_2_3, "#000000", 1)

	-- Create btn_up
	local btn_up = GUI:Button_Create(nd_content, "btn_up", 601.00, 24.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(btn_up, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(btn_up, 15, 15, 11, 11)
	GUI:setContentSize(btn_up, 125, 39)
	GUI:setIgnoreContentAdaptWithSize(btn_up, false)
	GUI:Button_setTitleText(btn_up, "")
	GUI:Button_setTitleColor(btn_up, "#414146")
	GUI:Button_setTitleFontSize(btn_up, 14)
	GUI:Button_titleEnableOutline(btn_up, "#000000", 1)
	GUI:setAnchorPoint(btn_up, 0.50, 0.50)
	GUI:setTouchEnabled(btn_up, true)
	GUI:setTag(btn_up, 98)

	-- Create Text_14
	local Text_14 = GUI:Text_Create(btn_up, "Text_14", 62.00, 18.00, 18, "#ffff00", [[升  级]])
	GUI:setAnchorPoint(Text_14, 0.50, 0.50)
	GUI:setTouchEnabled(Text_14, false)
	GUI:setTag(Text_14, 99)
	GUI:Text_enableOutline(Text_14, "#000000", 1)

	-- Create need_item_1
	local need_item_1 = GUI:Layout_Create(nd_content, "need_item_1", 602.00, 70.00, 229.00, 25.00, false)
	GUI:setAnchorPoint(need_item_1, 0.50, 0.00)
	GUI:setTouchEnabled(need_item_1, true)
	GUI:setTag(need_item_1, 229)

	-- Create need_item_2
	local need_item_2 = GUI:Layout_Create(nd_content, "need_item_2", 602.00, 48.00, 229.00, 25.00, false)
	GUI:setAnchorPoint(need_item_2, 0.50, 0.00)
	GUI:setTouchEnabled(need_item_2, true)
	GUI:setTag(need_item_2, 107)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(img_bg, "ListView_1", 785.00, 38.00, 40.00, 450.00, 1)
	GUI:ListView_setBackGroundColorType(ListView_1, 1)
	GUI:ListView_setBackGroundColor(ListView_1, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_1, 0)
	GUI:ListView_setGravity(ListView_1, 5)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 1216)

	-- Create template
	local template = GUI:Layout_Create(img_bg, "template", 0.00, 380.00, 40.00, 70.00, false)
	GUI:Layout_setBackGroundColorType(template, 1)
	GUI:Layout_setBackGroundColor(template, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(template, 0)
	GUI:setTouchEnabled(template, true)
	GUI:setTag(template, 1217)

	-- Create btn_switch
	local btn_switch = GUI:Button_Create(template, "btn_switch", 18.00, 21.00, "res/custom/common/btn_1_1.png")
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
	GUI:setTag(btn_switch, 1218)

	-- Create tx_switch
	local tx_switch = GUI:Text_Create(btn_switch, "tx_switch", 12.00, 61.00, 16, "#747071", [[页
签]])
	GUI:setAnchorPoint(tx_switch, 0.50, 0.50)
	GUI:setTouchEnabled(tx_switch, false)
	GUI:setTag(tx_switch, 1219)
	GUI:Text_enableOutline(tx_switch, "#000000", 1)

	-- Create level_layout
	local level_layout = GUI:Layout_Create(img_bg, "level_layout", 54.00, 415.00, 100.00, 50.00, false)
	GUI:Layout_setBackGroundColorType(level_layout, 1)
	GUI:Layout_setBackGroundColor(level_layout, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(level_layout, 0)
	GUI:setTouchEnabled(level_layout, true)
	GUI:setTag(level_layout, 44)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(level_layout, "Image_1", 35.00, 26.00, "res/custom/baowu/0.png")
	GUI:setAnchorPoint(Image_1, 0.50, 0.50)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 45)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(level_layout, "Image_2", 60.00, 26.00, "res/custom/baowu/10.png")
	GUI:setAnchorPoint(Image_2, 0.50, 0.50)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 46)

	local Text_leiji_day = GUI:TextAtlas_Create(level_layout, "Image_3", 0.00, 0.00, "0", "res/custom/zhigou/img_num.png", 12, 16, "0")
	GUI:setTag(Text_leiji_day, 48)

	-- Create Sprite_1
	local Sprite_1 = GUI:Image_Create(Layer, "Sprite_1", 0.00, 0.00, "res/private/gui_edit/ImageFile.png")
	GUI:setOpacity(Sprite_1, 62)
	GUI:setTouchEnabled(Sprite_1, false)
	GUI:setTag(Sprite_1, 71)
	GUI:setVisible(Sprite_1, false)
end
return ui