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

	-- Create img_di
	local img_di = GUI:Image_Create(nd_root, "img_di", 87.00, -33.00, "res/custom/Gem/img_di_2.jpg")
	GUI:setAnchorPoint(img_di, 0.60, 0.50)
	GUI:setTouchEnabled(img_di, false)
	GUI:setTag(img_di, 586)

	-- Create nd_content
	local nd_content = GUI:Node_Create(img_di, "nd_content", 0.00, 0.00)
	GUI:setAnchorPoint(nd_content, 0.50, 0.50)
	GUI:setTag(nd_content, 587)

	-- Create btn_arraw_L
	local btn_arraw_L = GUI:Button_Create(nd_content, "btn_arraw_L", 40.00, 38.00, "res/custom/Gem/img_1.png")
	GUI:Button_loadTexturePressed(btn_arraw_L, "res/custom/Gem/img_1.png")
	GUI:Button_setScale9Slice(btn_arraw_L, 15, 14, 11, 11)
	GUI:setContentSize(btn_arraw_L, 30, 46)
	GUI:setIgnoreContentAdaptWithSize(btn_arraw_L, false)
	GUI:Button_setTitleText(btn_arraw_L, "")
	GUI:Button_setTitleColor(btn_arraw_L, "#414146")
	GUI:Button_setTitleFontSize(btn_arraw_L, 14)
	GUI:Button_titleDisableOutLine(btn_arraw_L)
	GUI:setAnchorPoint(btn_arraw_L, 0.50, 0.50)
	GUI:setFlippedX(btn_arraw_L, true)
	GUI:setTouchEnabled(btn_arraw_L, true)
	GUI:setTag(btn_arraw_L, 23)

	-- Create btn_arraw_R
	local btn_arraw_R = GUI:Button_Create(nd_content, "btn_arraw_R", 692.00, 39.00, "res/custom/Gem/img_1.png")
	GUI:Button_loadTexturePressed(btn_arraw_R, "res/custom/Gem/img_1.png")
	GUI:Button_setScale9Slice(btn_arraw_R, 15, 14, 11, 11)
	GUI:setContentSize(btn_arraw_R, 30, 46)
	GUI:setIgnoreContentAdaptWithSize(btn_arraw_R, false)
	GUI:Button_setTitleText(btn_arraw_R, "")
	GUI:Button_setTitleColor(btn_arraw_R, "#414146")
	GUI:Button_setTitleFontSize(btn_arraw_R, 14)
	GUI:Button_titleDisableOutLine(btn_arraw_R)
	GUI:setAnchorPoint(btn_arraw_R, 0.50, 0.50)
	GUI:setTouchEnabled(btn_arraw_R, true)
	GUI:setTag(btn_arraw_R, 24)

	-- Create nd_gems
	local nd_gems = GUI:Node_Create(nd_content, "nd_gems", 5.00, 90.00)
	GUI:setAnchorPoint(nd_gems, 0.50, 0.50)
	GUI:setTag(nd_gems, 38)

	-- Create nd_hole_1
	local nd_hole_1 = GUI:Node_Create(nd_gems, "nd_hole_1", 170.00, 298.00)
	GUI:setAnchorPoint(nd_hole_1, 0.50, 0.50)
	GUI:setTag(nd_hole_1, 39)

	-- Create img_add
	local img_add = GUI:Image_Create(nd_hole_1, "img_add", 0.00, 0.00, "res/custom/Gem/img_2.png")
	GUI:setAnchorPoint(img_add, 0.50, 0.50)
	GUI:setTouchEnabled(img_add, false)
	GUI:setTag(img_add, 41)

	-- Create nd_setgem
	local nd_setgem = GUI:Node_Create(nd_hole_1, "nd_setgem", 0.00, 0.00)
	GUI:setAnchorPoint(nd_setgem, 0.50, 0.50)
	GUI:setTag(nd_setgem, 74)

	-- Create nd_hole_2
	local nd_hole_2 = GUI:Node_Create(nd_gems, "nd_hole_2", 273.00, 298.00)
	GUI:setAnchorPoint(nd_hole_2, 0.50, 0.50)
	GUI:setTag(nd_hole_2, 42)

	-- Create img_add
	local img_add = GUI:Image_Create(nd_hole_2, "img_add", 0.00, 0.00, "res/custom/Gem/img_2.png")
	GUI:setAnchorPoint(img_add, 0.50, 0.50)
	GUI:setTouchEnabled(img_add, false)
	GUI:setTag(img_add, 43)

	-- Create nd_setgem
	local nd_setgem = GUI:Node_Create(nd_hole_2, "nd_setgem", 0.00, 0.00)
	GUI:setAnchorPoint(nd_setgem, 0.50, 0.50)
	GUI:setTag(nd_setgem, 75)

	-- Create nd_hole_3
	local nd_hole_3 = GUI:Node_Create(nd_gems, "nd_hole_3", 347.00, 224.00)
	GUI:setAnchorPoint(nd_hole_3, 0.50, 0.50)
	GUI:setTag(nd_hole_3, 44)

	-- Create img_add
	local img_add = GUI:Image_Create(nd_hole_3, "img_add", 0.00, 0.00, "res/custom/Gem/img_2.png")
	GUI:setAnchorPoint(img_add, 0.50, 0.50)
	GUI:setTouchEnabled(img_add, false)
	GUI:setTag(img_add, 45)

	-- Create nd_setgem
	local nd_setgem = GUI:Node_Create(nd_hole_3, "nd_setgem", 0.00, 0.00)
	GUI:setAnchorPoint(nd_setgem, 0.50, 0.50)
	GUI:setTag(nd_setgem, 76)

	-- Create nd_hole_4
	local nd_hole_4 = GUI:Node_Create(nd_gems, "nd_hole_4", 347.00, 119.00)
	GUI:setAnchorPoint(nd_hole_4, 0.50, 0.50)
	GUI:setTag(nd_hole_4, 46)

	-- Create img_add
	local img_add = GUI:Image_Create(nd_hole_4, "img_add", 0.00, 0.00, "res/custom/Gem/img_2.png")
	GUI:setAnchorPoint(img_add, 0.50, 0.50)
	GUI:setTouchEnabled(img_add, false)
	GUI:setTag(img_add, 47)

	-- Create nd_setgem
	local nd_setgem = GUI:Node_Create(nd_hole_4, "nd_setgem", 0.00, 0.00)
	GUI:setAnchorPoint(nd_setgem, 0.50, 0.50)
	GUI:setTag(nd_setgem, 77)

	-- Create nd_hole_5
	local nd_hole_5 = GUI:Node_Create(nd_gems, "nd_hole_5", 273.00, 45.00)
	GUI:setAnchorPoint(nd_hole_5, 0.50, 0.50)
	GUI:setTag(nd_hole_5, 48)

	-- Create img_add
	local img_add = GUI:Image_Create(nd_hole_5, "img_add", 0.00, 0.00, "res/custom/Gem/img_2.png")
	GUI:setAnchorPoint(img_add, 0.50, 0.50)
	GUI:setTouchEnabled(img_add, false)
	GUI:setTag(img_add, 49)

	-- Create nd_setgem
	local nd_setgem = GUI:Node_Create(nd_hole_5, "nd_setgem", 0.00, 0.00)
	GUI:setAnchorPoint(nd_setgem, 0.50, 0.50)
	GUI:setTag(nd_setgem, 78)

	-- Create nd_hole_6
	local nd_hole_6 = GUI:Node_Create(nd_gems, "nd_hole_6", 169.00, 45.00)
	GUI:setAnchorPoint(nd_hole_6, 0.50, 0.50)
	GUI:setTag(nd_hole_6, 50)

	-- Create img_add
	local img_add = GUI:Image_Create(nd_hole_6, "img_add", 0.00, 0.00, "res/custom/Gem/img_2.png")
	GUI:setAnchorPoint(img_add, 0.50, 0.50)
	GUI:setTouchEnabled(img_add, false)
	GUI:setTag(img_add, 51)

	-- Create nd_setgem
	local nd_setgem = GUI:Node_Create(nd_hole_6, "nd_setgem", 0.00, 0.00)
	GUI:setAnchorPoint(nd_setgem, 0.50, 0.50)
	GUI:setTag(nd_setgem, 79)

	-- Create nd_hole_7
	local nd_hole_7 = GUI:Node_Create(nd_gems, "nd_hole_7", 95.00, 119.00)
	GUI:setAnchorPoint(nd_hole_7, 0.50, 0.50)
	GUI:setTag(nd_hole_7, 52)

	-- Create img_add
	local img_add = GUI:Image_Create(nd_hole_7, "img_add", 0.00, 0.00, "res/custom/Gem/img_2.png")
	GUI:setAnchorPoint(img_add, 0.50, 0.50)
	GUI:setTouchEnabled(img_add, false)
	GUI:setTag(img_add, 53)

	-- Create nd_setgem
	local nd_setgem = GUI:Node_Create(nd_hole_7, "nd_setgem", 0.00, 0.00)
	GUI:setAnchorPoint(nd_setgem, 0.50, 0.50)
	GUI:setTag(nd_setgem, 80)

	-- Create nd_hole_8
	local nd_hole_8 = GUI:Node_Create(nd_gems, "nd_hole_8", 95.00, 223.00)
	GUI:setAnchorPoint(nd_hole_8, 0.50, 0.50)
	GUI:setTag(nd_hole_8, 54)

	-- Create img_add
	local img_add = GUI:Image_Create(nd_hole_8, "img_add", 0.00, 0.00, "res/custom/Gem/img_2.png")
	GUI:setAnchorPoint(img_add, 0.50, 0.50)
	GUI:setTouchEnabled(img_add, false)
	GUI:setTag(img_add, 55)

	-- Create nd_setgem
	local nd_setgem = GUI:Node_Create(nd_hole_8, "nd_setgem", 0.00, 0.00)
	GUI:setAnchorPoint(nd_setgem, 0.50, 0.50)
	GUI:setTag(nd_setgem, 81)

	-- Create nd_set_equip
	local nd_set_equip = GUI:Node_Create(nd_content, "nd_set_equip", 224.00, 265.00)
	GUI:setAnchorPoint(nd_set_equip, 0.50, 0.50)
	GUI:setTag(nd_set_equip, 56)

	-- Create tx_rule
	local tx_rule = GUI:Text_Create(nd_content, "tx_rule", 405.00, 429.00, 16, "#4ae74a", [[镶嵌规则]])
	GUI:setAnchorPoint(tx_rule, 0.50, 0.50)
	GUI:setTouchEnabled(tx_rule, true)
	GUI:setTag(tx_rule, 57)
	GUI:Text_enableOutline(tx_rule, "#000000", 1)

	-- Create lv_equips
	local lv_equips = GUI:ListView_Create(nd_content, "lv_equips", 76.00, 9.00, 576.00, 64.00, 2)
	GUI:ListView_setBackGroundColorType(lv_equips, 1)
	GUI:ListView_setBackGroundColor(lv_equips, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(lv_equips, 102)
	GUI:ListView_setGravity(lv_equips, 3)
	GUI:ListView_setItemsMargin(lv_equips, 10)
	GUI:setTouchEnabled(lv_equips, true)
	GUI:setTag(lv_equips, 60)

	-- Create lv_gems
	local lv_gems = GUI:ListView_Create(nd_content, "lv_gems", 455.00, 404.00, 269.00, 320.00, 1)
	GUI:ListView_setBackGroundColorType(lv_gems, 1)
	GUI:ListView_setBackGroundColor(lv_gems, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(lv_gems, 102)
	GUI:ListView_setGravity(lv_gems, 5)
	GUI:ListView_setItemsMargin(lv_gems, 10)
	GUI:setAnchorPoint(lv_gems, 0.00, 1.00)
	GUI:setTouchEnabled(lv_gems, true)
	GUI:setTag(lv_gems, 68)

	-- Create l_screen
	local l_screen = GUI:Layout_Create(nd_content, "l_screen", 455.00, 416.00, 170.00, 25.00, false)
	GUI:Layout_setBackGroundColorType(l_screen, 1)
	GUI:Layout_setBackGroundColor(l_screen, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(l_screen, 102)
	GUI:setTouchEnabled(l_screen, true)
	GUI:setTag(l_screen, 82)

	-- Create tx_screen
	local tx_screen = GUI:Text_Create(l_screen, "tx_screen", 96.00, 13.00, 16, "#c0c0c0", [[筛选可镶嵌的宝石]])
	GUI:setAnchorPoint(tx_screen, 0.50, 0.50)
	GUI:setTouchEnabled(tx_screen, false)
	GUI:setTag(tx_screen, 83)
	GUI:Text_enableOutline(tx_screen, "#000000", 1)

	-- Create cb_screen
	local cb_screen = GUI:CheckBox_Create(l_screen, "cb_screen", 14.00, 11.00, "res/custom/Gem/cb_1_1.png", "res/custom/Gem/cb_1_2.png")
	GUI:CheckBox_setSelected(cb_screen, true)
	GUI:setAnchorPoint(cb_screen, 0.50, 0.50)
	GUI:setTouchEnabled(cb_screen, true)
	GUI:setTag(cb_screen, 84)
end
return ui