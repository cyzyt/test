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
	GUI:setTouchEnabled(img_bg, false)
	GUI:setTag(img_bg, 12)

	-- Create bg
	local bg = GUI:Layout_Create(img_bg, "bg", 199.00, 416.00, 505.00, 384.00, true)
	GUI:Layout_setBackGroundColorType(bg, 1)
	GUI:Layout_setBackGroundColor(bg, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(bg, 0)
	GUI:setAnchorPoint(bg, 0.00, 1.00)
	GUI:setTouchEnabled(bg, true)
	GUI:setTag(bg, 855)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(bg, "Image_1", 0.00, -75.00, "res/custom/forge/forgeBg2.jpg")
	GUI:setScaleX(Image_1, 1.02)
	GUI:setScaleY(Image_1, 1.03)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 853)

	-- Create tx_title
	local tx_title = GUI:Text_Create(img_bg, "tx_title", 79.00, 444.00, 20, "#d6c6ad", [[强星]])
	GUI:setAnchorPoint(tx_title, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 73)
	GUI:Text_enableOutline(tx_title, "#000000", 2)

	-- Create btn_close
	local btn_close = GUI:Button_Create(img_bg, "btn_close", 744.00, 455.00, "res/custom/common/btn_close_1_1.png")
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
	local img_di = GUI:Image_Create(img_bg, "img_di", 195.00, 224.00, "res/custom/common/img_line_1.png")
	GUI:setAnchorPoint(img_di, 0.50, 0.50)
	GUI:setScaleY(img_di, 0.86)
	GUI:setTouchEnabled(img_di, false)
	GUI:setTag(img_di, 586)

	-- Create template
	local template = GUI:Button_Create(nd_root, "template", -241.00, 123.50, "res/custom/common/btn_3_1.png")
	GUI:Button_loadTexturePressed(template, "res/custom/common/btn_3_2.png")
	GUI:Button_loadTextureDisabled(template, "res/custom/common/btn_3_2.png")
	GUI:Button_setScale9Slice(template, 15, 15, 11, 11)
	GUI:setContentSize(template, 150, 35)
	GUI:setIgnoreContentAdaptWithSize(template, false)
	GUI:Button_setTitleText(template, "")
	GUI:Button_setTitleColor(template, "#eef622")
	GUI:Button_setTitleFontSize(template, 14)
	GUI:Button_titleEnableOutline(template, "#000000", 1)
	GUI:setAnchorPoint(template, 0.50, 0.50)
	GUI:setTouchEnabled(template, true)
	GUI:setTag(template, 185)

	-- Create tx_switch
	local tx_switch = GUI:Text_Create(template, "tx_switch", 75.00, 17.00, 18, "#787974", [[页签1]])
	GUI:setAnchorPoint(tx_switch, 0.50, 0.50)
	GUI:setTouchEnabled(tx_switch, false)
	GUI:setTag(tx_switch, 190)
	GUI:Text_enableOutline(tx_switch, "#000000", 1)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(nd_root, "ListView_1", -316.00, 142.00, 150.00, 380.00, 1)
	GUI:ListView_setBackGroundColorType(ListView_1, 1)
	GUI:ListView_setBackGroundColor(ListView_1, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_1, 0)
	GUI:ListView_setGravity(ListView_1, 5)
	GUI:setAnchorPoint(ListView_1, 0.00, 1.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 182)

	-- Create forgeWnd
	local forgeWnd = GUI:Layout_Create(nd_root, "forgeWnd", -158.00, -237.00, 500.00, 380.00, false)
	GUI:Layout_setBackGroundColorType(forgeWnd, 1)
	GUI:Layout_setBackGroundColor(forgeWnd, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(forgeWnd, 0)
	GUI:setTouchEnabled(forgeWnd, true)
	GUI:setTag(forgeWnd, 101)

	-- Create xing_1
	local xing_1 = GUI:Image_Create(forgeWnd, "xing_1", 109.00, 219.00, "res/custom/qianghua/icon_lvse_00_0.png")
	GUI:setAnchorPoint(xing_1, 0.50, 0.50)
	GUI:setTouchEnabled(xing_1, false)
	GUI:setTag(xing_1, 1047)

	-- Create xing_2
	local xing_2 = GUI:Image_Create(forgeWnd, "xing_2", 166.00, 219.00, "res/custom/qianghua/icon_lvse_00_0.png")
	GUI:setAnchorPoint(xing_2, 0.50, 0.50)
	GUI:setTouchEnabled(xing_2, false)
	GUI:setTag(xing_2, 1048)

	-- Create xing_3
	local xing_3 = GUI:Image_Create(forgeWnd, "xing_3", 222.00, 219.00, "res/custom/qianghua/icon_lvse_00_0.png")
	GUI:setAnchorPoint(xing_3, 0.50, 0.50)
	GUI:setTouchEnabled(xing_3, false)
	GUI:setTag(xing_3, 1049)

	-- Create xing_4
	local xing_4 = GUI:Image_Create(forgeWnd, "xing_4", 279.00, 219.00, "res/custom/qianghua/icon_lvse_00_0.png")
	GUI:setAnchorPoint(xing_4, 0.50, 0.50)
	GUI:setTouchEnabled(xing_4, false)
	GUI:setTag(xing_4, 1050)

	-- Create xing_5
	local xing_5 = GUI:Image_Create(forgeWnd, "xing_5", 335.00, 219.00, "res/custom/qianghua/icon_lvse_00_0.png")
	GUI:setAnchorPoint(xing_5, 0.50, 0.50)
	GUI:setTouchEnabled(xing_5, false)
	GUI:setTag(xing_5, 1051)

	-- Create xing_6
	local xing_6 = GUI:Image_Create(forgeWnd, "xing_6", 392.00, 219.00, "res/custom/qianghua/icon_lvse_00_0.png")
	GUI:setAnchorPoint(xing_6, 0.50, 0.50)
	GUI:setTouchEnabled(xing_6, false)
	GUI:setTag(xing_6, 1052)

	-- Create img_kuang_1
	local img_kuang_1 = GUI:Image_Create(forgeWnd, "img_kuang_1", 107.00, 130.00, "res/custom/qianghua/now_bg.png")
	GUI:setContentSize(img_kuang_1, 154.80000305176, 118.80000305176)
	GUI:setIgnoreContentAdaptWithSize(img_kuang_1, false)
	GUI:setAnchorPoint(img_kuang_1, 0.50, 0.50)
	GUI:setTouchEnabled(img_kuang_1, false)
	GUI:setTag(img_kuang_1, 29)

	-- Create p_cur_attr_1_3
	local p_cur_attr_1_3 = GUI:Layout_Create(img_kuang_1, "p_cur_attr_1_3", 82.00, 3.00, 150.00, 25.00, false)
	GUI:setAnchorPoint(p_cur_attr_1_3, 0.50, 0.00)
	GUI:setTouchEnabled(p_cur_attr_1_3, true)
	GUI:setTag(p_cur_attr_1_3, 143)

	-- Create att_value_1_3
	local att_value_1_3 = GUI:Text_Create(p_cur_attr_1_3, "att_value_1_3", 113.00, 10.00, 15, "#94949c", [[9999]])
	GUI:setAnchorPoint(att_value_1_3, 0.50, 0.50)
	GUI:setTouchEnabled(att_value_1_3, false)
	GUI:setTag(att_value_1_3, 145)
	GUI:Text_enableOutline(att_value_1_3, "#000000", 1)

	-- Create att_name_1_3
	local att_name_1_3 = GUI:Text_Create(p_cur_attr_1_3, "att_name_1_3", 37.00, 10.00, 15, "#94949c", [[生命值：]])
	GUI:setAnchorPoint(att_name_1_3, 0.50, 0.50)
	GUI:setTouchEnabled(att_name_1_3, false)
	GUI:setTag(att_name_1_3, 146)
	GUI:Text_enableOutline(att_name_1_3, "#000000", 1)

	-- Create p_cur_attr_1_2
	local p_cur_attr_1_2 = GUI:Layout_Create(img_kuang_1, "p_cur_attr_1_2", 82.00, 36.00, 150.00, 25.00, false)
	GUI:setAnchorPoint(p_cur_attr_1_2, 0.50, 0.00)
	GUI:setTouchEnabled(p_cur_attr_1_2, true)
	GUI:setTag(p_cur_attr_1_2, 147)

	-- Create att_value_1_2
	local att_value_1_2 = GUI:Text_Create(p_cur_attr_1_2, "att_value_1_2", 113.00, 10.00, 15, "#94949c", [[9999]])
	GUI:setAnchorPoint(att_value_1_2, 0.50, 0.50)
	GUI:setTouchEnabled(att_value_1_2, false)
	GUI:setTag(att_value_1_2, 149)
	GUI:Text_enableOutline(att_value_1_2, "#000000", 1)

	-- Create att_name_1_2
	local att_name_1_2 = GUI:Text_Create(p_cur_attr_1_2, "att_name_1_2", 37.00, 10.00, 15, "#94949c", [[生命值：]])
	GUI:setAnchorPoint(att_name_1_2, 0.50, 0.50)
	GUI:setTouchEnabled(att_name_1_2, false)
	GUI:setTag(att_name_1_2, 150)
	GUI:Text_enableOutline(att_name_1_2, "#000000", 1)

	-- Create p_cur_attr_1_1
	local p_cur_attr_1_1 = GUI:Layout_Create(img_kuang_1, "p_cur_attr_1_1", 82.00, 70.00, 150.00, 25.00, false)
	GUI:setAnchorPoint(p_cur_attr_1_1, 0.50, 0.00)
	GUI:setTouchEnabled(p_cur_attr_1_1, true)
	GUI:setTag(p_cur_attr_1_1, 151)

	-- Create att_value_1_1
	local att_value_1_1 = GUI:Text_Create(p_cur_attr_1_1, "att_value_1_1", 113.00, 10.00, 15, "#94949c", [[9999]])
	GUI:setAnchorPoint(att_value_1_1, 0.50, 0.50)
	GUI:setTouchEnabled(att_value_1_1, false)
	GUI:setTag(att_value_1_1, 153)
	GUI:Text_enableOutline(att_value_1_1, "#000000", 1)

	-- Create att_name_1_1
	local att_name_1_1 = GUI:Text_Create(p_cur_attr_1_1, "att_name_1_1", 37.00, 10.00, 15, "#94949c", [[生命值：]])
	GUI:setAnchorPoint(att_name_1_1, 0.50, 0.50)
	GUI:setTouchEnabled(att_name_1_1, false)
	GUI:setTag(att_name_1_1, 154)
	GUI:Text_enableOutline(att_name_1_1, "#000000", 1)

	-- Create img_kuang_2
	local img_kuang_2 = GUI:Image_Create(forgeWnd, "img_kuang_2", 392.00, 130.00, "res/custom/qianghua/next_bg.png")
	GUI:setContentSize(img_kuang_2, 154.80000305176, 118.80000305176)
	GUI:setIgnoreContentAdaptWithSize(img_kuang_2, false)
	GUI:setAnchorPoint(img_kuang_2, 0.50, 0.50)
	GUI:setTouchEnabled(img_kuang_2, false)
	GUI:setTag(img_kuang_2, 170)

	-- Create p_cur_attr_2_3
	local p_cur_attr_2_3 = GUI:Layout_Create(img_kuang_2, "p_cur_attr_2_3", 79.00, 3.00, 150.00, 25.00, false)
	GUI:setAnchorPoint(p_cur_attr_2_3, 0.50, 0.00)
	GUI:setTouchEnabled(p_cur_attr_2_3, true)
	GUI:setTag(p_cur_attr_2_3, 174)

	-- Create att_value_2_3
	local att_value_2_3 = GUI:Text_Create(p_cur_attr_2_3, "att_value_2_3", 113.00, 10.00, 15, "#94949c", [[9999]])
	GUI:setAnchorPoint(att_value_2_3, 0.50, 0.50)
	GUI:setTouchEnabled(att_value_2_3, false)
	GUI:setTag(att_value_2_3, 175)
	GUI:Text_enableOutline(att_value_2_3, "#000000", 1)

	-- Create att_name_2_3
	local att_name_2_3 = GUI:Text_Create(p_cur_attr_2_3, "att_name_2_3", 37.00, 10.00, 15, "#94949c", [[生命值：]])
	GUI:setAnchorPoint(att_name_2_3, 0.50, 0.50)
	GUI:setTouchEnabled(att_name_2_3, false)
	GUI:setTag(att_name_2_3, 176)
	GUI:Text_enableOutline(att_name_2_3, "#000000", 1)

	-- Create p_cur_attr_2_2
	local p_cur_attr_2_2 = GUI:Layout_Create(img_kuang_2, "p_cur_attr_2_2", 79.00, 36.00, 150.00, 25.00, false)
	GUI:setAnchorPoint(p_cur_attr_2_2, 0.50, 0.00)
	GUI:setTouchEnabled(p_cur_attr_2_2, true)
	GUI:setTag(p_cur_attr_2_2, 177)

	-- Create att_value_2_2
	local att_value_2_2 = GUI:Text_Create(p_cur_attr_2_2, "att_value_2_2", 113.00, 10.00, 15, "#94949c", [[9999]])
	GUI:setAnchorPoint(att_value_2_2, 0.50, 0.50)
	GUI:setTouchEnabled(att_value_2_2, false)
	GUI:setTag(att_value_2_2, 178)
	GUI:Text_enableOutline(att_value_2_2, "#000000", 1)

	-- Create att_name_2_2
	local att_name_2_2 = GUI:Text_Create(p_cur_attr_2_2, "att_name_2_2", 37.00, 10.00, 15, "#94949c", [[生命值：]])
	GUI:setAnchorPoint(att_name_2_2, 0.50, 0.50)
	GUI:setTouchEnabled(att_name_2_2, false)
	GUI:setTag(att_name_2_2, 179)
	GUI:Text_enableOutline(att_name_2_2, "#000000", 1)

	-- Create p_cur_attr_2_1
	local p_cur_attr_2_1 = GUI:Layout_Create(img_kuang_2, "p_cur_attr_2_1", 79.00, 70.00, 150.00, 25.00, false)
	GUI:setAnchorPoint(p_cur_attr_2_1, 0.50, 0.00)
	GUI:setTouchEnabled(p_cur_attr_2_1, true)
	GUI:setTag(p_cur_attr_2_1, 180)

	-- Create att_value_2_1
	local att_value_2_1 = GUI:Text_Create(p_cur_attr_2_1, "att_value_2_1", 113.00, 10.00, 15, "#94949c", [[9999]])
	GUI:setAnchorPoint(att_value_2_1, 0.50, 0.50)
	GUI:setTouchEnabled(att_value_2_1, false)
	GUI:setTag(att_value_2_1, 181)
	GUI:Text_enableOutline(att_value_2_1, "#000000", 1)

	-- Create att_name_2_1
	local att_name_2_1 = GUI:Text_Create(p_cur_attr_2_1, "att_name_2_1", 37.00, 10.00, 15, "#94949c", [[生命值：]])
	GUI:setAnchorPoint(att_name_2_1, 0.50, 0.50)
	GUI:setTouchEnabled(att_name_2_1, false)
	GUI:setTag(att_name_2_1, 182)
	GUI:Text_enableOutline(att_name_2_1, "#000000", 1)

	-- Create item
	local item = GUI:Image_Create(nd_root, "item", 91.00, 41.00, "res/custom/common/img_cell_1.png")
	GUI:setAnchorPoint(item, 0.50, 0.50)
	GUI:setTouchEnabled(item, false)
	GUI:setTag(item, 73)

	-- Create itemPro
	local itemPro = GUI:Layout_Create(nd_root, "itemPro", 271.00, -221.00, 80.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(itemPro, 1)
	GUI:Layout_setBackGroundColor(itemPro, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemPro, 0)
	GUI:setAnchorPoint(itemPro, 0.50, 0.00)
	GUI:setTouchEnabled(itemPro, true)
	GUI:setTag(itemPro, 97)

	-- Create itemNeed1
	local itemNeed1 = GUI:Layout_Create(nd_root, "itemNeed1", 89.00, -192.00, 140.00, 20.00, false)
	GUI:Layout_setBackGroundImage(itemNeed1, "res/custom/NTGM/img_di2.png")
	GUI:Layout_setBackGroundColorType(itemNeed1, 1)
	GUI:Layout_setBackGroundColor(itemNeed1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(itemNeed1, 0)
	GUI:setAnchorPoint(itemNeed1, 0.50, 0.00)
	GUI:setTouchEnabled(itemNeed1, true)
	GUI:setTag(itemNeed1, 98)

	-- Create btn_go
	local btn_go = GUI:Button_Create(nd_root, "btn_go", 91.00, -214.00, "res/custom/common/btn_2_1.png")
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
	local Text_14 = GUI:Text_Create(btn_go, "Text_14", 61.00, 17.00, 18, "#c0c0c0", [[装备强星]])
	GUI:setAnchorPoint(Text_14, 0.50, 0.50)
	GUI:setTouchEnabled(Text_14, false)
	GUI:setTag(Text_14, 100)
	GUI:Text_enableOutline(Text_14, "#000000", 1)

	-- Create tx_rule
	local tx_rule = GUI:Text_Create(nd_root, "tx_rule", 305.00, 131.00, 16, "#4ae74a", [[强星规则]])
	GUI:setAnchorPoint(tx_rule, 0.50, 0.50)
	GUI:setTouchEnabled(tx_rule, true)
	GUI:setTag(tx_rule, 258)
	GUI:Text_enableOutline(tx_rule, "#000000", 1)

	-- Create check_luck_layout
	local check_luck_layout = GUI:Layout_Create(nd_root, "check_luck_layout", -137.00, -199.00, 150.00, 30.00, false)
	GUI:setAnchorPoint(check_luck_layout, 0.00, 1.00)
	GUI:setTouchEnabled(check_luck_layout, false)
	GUI:setTag(check_luck_layout, 928)

	-- Create check_luck_check
	local check_luck_check = GUI:CheckBox_Create(check_luck_layout, "check_luck_check", 12.00, 15.00, "res/custom/Gem/cb_1_1.png", "res/custom/Gem/cb_1_2.png")
	GUI:CheckBox_setSelected(check_luck_check, false)
	GUI:setAnchorPoint(check_luck_check, 0.50, 0.50)
	GUI:setTouchEnabled(check_luck_check, false)
	GUI:setTag(check_luck_check, 929)

	-- Create tx_title
	local tx_title = GUI:Text_Create(check_luck_layout, "tx_title", 33.00, 15.00, 16, "#edf1f6", [[幸运保底]])
	GUI:setAnchorPoint(tx_title, 0.00, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 930)
	GUI:Text_enableOutline(tx_title, "#000000", 1)

	-- Create btn_luck_btn
	local btn_luck_btn = GUI:Button_Create(check_luck_layout, "btn_luck_btn", 69.00, 14.00, "res/private/gui_edit/Button_Normal.png")
	GUI:Button_setScale9Slice(btn_luck_btn, 15, 16, 12, 12)
	GUI:setContentSize(btn_luck_btn, 170, 30)
	GUI:setIgnoreContentAdaptWithSize(btn_luck_btn, false)
	GUI:Button_setTitleText(btn_luck_btn, "")
	GUI:Button_setTitleColor(btn_luck_btn, "#414146")
	GUI:Button_setTitleFontSize(btn_luck_btn, 14)
	GUI:Button_titleDisableOutLine(btn_luck_btn)
	GUI:setAnchorPoint(btn_luck_btn, 0.50, 0.50)
	GUI:setOpacity(btn_luck_btn, 0)
	GUI:setTouchEnabled(btn_luck_btn, true)
	GUI:setTag(btn_luck_btn, 931)
end
return ui