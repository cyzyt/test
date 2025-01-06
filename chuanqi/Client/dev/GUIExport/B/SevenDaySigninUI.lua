local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create nd_card
	local nd_card = GUI:Node_Create(Layer, "nd_card", 568.00, 320.00)
	GUI:setAnchorPoint(nd_card, 0.50, 0.50)
	GUI:setTag(nd_card, 2173)

	-- Create img_bg
	local img_bg = GUI:Image_Create(nd_card, "img_bg", 11.00, -33.00, "res/custom/zhigou/img_bg.jpg")
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg, false)
	GUI:setTag(img_bg, 284)

	-- Create Img_bg
	local Img_bg = GUI:Image_Create(img_bg, "Img_bg", 159.00, 225.00, "res/custom/SevenDaySignin/img_bg.png")
	GUI:Image_setScale9Slice(Img_bg, 30, 30, 30, 30)
	GUI:setContentSize(Img_bg, 573, 445)
	GUI:setIgnoreContentAdaptWithSize(Img_bg, false)
	GUI:setAnchorPoint(Img_bg, 0.00, 0.50)
	GUI:setTouchEnabled(Img_bg, false)
	GUI:setTag(Img_bg, 117)

	-- Create node_root
	local node_root = GUI:Node_Create(img_bg, "node_root", 367.00, 393.00)
	GUI:setAnchorPoint(node_root, 0.50, 0.50)
	GUI:setTag(node_root, 116)

	-- Create node_lx
	local node_lx = GUI:Node_Create(node_root, "node_lx", -165.00, -27.00)
	GUI:setAnchorPoint(node_lx, 0.50, 0.50)
	GUI:setTag(node_lx, 776)

	-- Create btn_sgin_lx_2
	local btn_sgin_lx_2 = GUI:Image_Create(node_lx, "btn_sgin_lx_2", 41.00, -2.00, "res/custom/SevenDaySignin/img_xian_1.png")
	GUI:setAnchorPoint(btn_sgin_lx_2, 0.50, 0.50)
	GUI:setTouchEnabled(btn_sgin_lx_2, false)
	GUI:setTag(btn_sgin_lx_2, 180)

	-- Create btn_sgin_lx_3
	local btn_sgin_lx_3 = GUI:Image_Create(node_lx, "btn_sgin_lx_3", 123.00, -2.00, "res/custom/SevenDaySignin/img_xian_1.png")
	GUI:setAnchorPoint(btn_sgin_lx_3, 0.50, 0.50)
	GUI:setTouchEnabled(btn_sgin_lx_3, false)
	GUI:setTag(btn_sgin_lx_3, 187)

	-- Create btn_sgin_lx_4
	local btn_sgin_lx_4 = GUI:Image_Create(node_lx, "btn_sgin_lx_4", 203.00, -2.00, "res/custom/SevenDaySignin/img_xian_1.png")
	GUI:setAnchorPoint(btn_sgin_lx_4, 0.50, 0.50)
	GUI:setTouchEnabled(btn_sgin_lx_4, false)
	GUI:setTag(btn_sgin_lx_4, 190)

	-- Create btn_sgin_lx_5
	local btn_sgin_lx_5 = GUI:Image_Create(node_lx, "btn_sgin_lx_5", 285.00, -2.00, "res/custom/SevenDaySignin/img_xian_1.png")
	GUI:setAnchorPoint(btn_sgin_lx_5, 0.50, 0.50)
	GUI:setTouchEnabled(btn_sgin_lx_5, false)
	GUI:setTag(btn_sgin_lx_5, 193)

	-- Create btn_sgin_lx_6
	local btn_sgin_lx_6 = GUI:Image_Create(node_lx, "btn_sgin_lx_6", 366.00, -2.00, "res/custom/SevenDaySignin/img_xian_1.png")
	GUI:setAnchorPoint(btn_sgin_lx_6, 0.50, 0.50)
	GUI:setTouchEnabled(btn_sgin_lx_6, false)
	GUI:setTag(btn_sgin_lx_6, 196)

	-- Create btn_sgin_lx_7
	local btn_sgin_lx_7 = GUI:Image_Create(node_lx, "btn_sgin_lx_7", 448.00, -2.00, "res/custom/SevenDaySignin/img_xian_1.png")
	GUI:setAnchorPoint(btn_sgin_lx_7, 0.50, 0.50)
	GUI:setTouchEnabled(btn_sgin_lx_7, false)
	GUI:setTag(btn_sgin_lx_7, 199)

	-- Create btn_sgin_lx_t_2
	local btn_sgin_lx_t_2 = GUI:Image_Create(node_lx, "btn_sgin_lx_t_2", 41.00, -2.00, "res/custom/SevenDaySignin/img_xian.png")
	GUI:setAnchorPoint(btn_sgin_lx_t_2, 0.50, 0.50)
	GUI:setTouchEnabled(btn_sgin_lx_t_2, false)
	GUI:setTag(btn_sgin_lx_t_2, 765)

	-- Create btn_sgin_lx_t_3
	local btn_sgin_lx_t_3 = GUI:Image_Create(node_lx, "btn_sgin_lx_t_3", 123.00, -2.00, "res/custom/SevenDaySignin/img_xian.png")
	GUI:setAnchorPoint(btn_sgin_lx_t_3, 0.50, 0.50)
	GUI:setTouchEnabled(btn_sgin_lx_t_3, false)
	GUI:setTag(btn_sgin_lx_t_3, 771)

	-- Create btn_sgin_lx_t_4
	local btn_sgin_lx_t_4 = GUI:Image_Create(node_lx, "btn_sgin_lx_t_4", 203.00, -2.00, "res/custom/SevenDaySignin/img_xian.png")
	GUI:setAnchorPoint(btn_sgin_lx_t_4, 0.50, 0.50)
	GUI:setTouchEnabled(btn_sgin_lx_t_4, false)
	GUI:setTag(btn_sgin_lx_t_4, 772)

	-- Create btn_sgin_lx_t_5
	local btn_sgin_lx_t_5 = GUI:Image_Create(node_lx, "btn_sgin_lx_t_5", 285.00, -2.00, "res/custom/SevenDaySignin/img_xian.png")
	GUI:setAnchorPoint(btn_sgin_lx_t_5, 0.50, 0.50)
	GUI:setTouchEnabled(btn_sgin_lx_t_5, false)
	GUI:setTag(btn_sgin_lx_t_5, 773)

	-- Create btn_sgin_lx_t_6
	local btn_sgin_lx_t_6 = GUI:Image_Create(node_lx, "btn_sgin_lx_t_6", 366.00, -2.00, "res/custom/SevenDaySignin/img_xian.png")
	GUI:setAnchorPoint(btn_sgin_lx_t_6, 0.50, 0.50)
	GUI:setTouchEnabled(btn_sgin_lx_t_6, false)
	GUI:setTag(btn_sgin_lx_t_6, 774)

	-- Create btn_sgin_lx_t_7
	local btn_sgin_lx_t_7 = GUI:Image_Create(node_lx, "btn_sgin_lx_t_7", 448.00, -2.00, "res/custom/SevenDaySignin/img_xian.png")
	GUI:setAnchorPoint(btn_sgin_lx_t_7, 0.50, 0.50)
	GUI:setTouchEnabled(btn_sgin_lx_t_7, false)
	GUI:setTag(btn_sgin_lx_t_7, 775)

	-- Create sgin_node
	local sgin_node = GUI:Node_Create(node_root, "sgin_node", -164.00, -21.00)
	GUI:setAnchorPoint(sgin_node, 0.50, 0.50)
	GUI:setTag(sgin_node, 803)

	-- Create btn_sgin_1
	local btn_sgin_1 = GUI:Button_Create(sgin_node, "btn_sgin_1", 0.00, 0.00, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_loadTexturePressed(btn_sgin_1, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_loadTextureDisabled(btn_sgin_1, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_setScale9Slice(btn_sgin_1, 15, 15, 11, 11)
	GUI:setContentSize(btn_sgin_1, 89, 90)
	GUI:setIgnoreContentAdaptWithSize(btn_sgin_1, false)
	GUI:Button_setTitleText(btn_sgin_1, "")
	GUI:Button_setTitleColor(btn_sgin_1, "#414146")
	GUI:Button_setTitleFontSize(btn_sgin_1, 14)
	GUI:Button_titleDisableOutLine(btn_sgin_1)
	GUI:setAnchorPoint(btn_sgin_1, 0.50, 0.50)
	GUI:setScaleX(btn_sgin_1, 0.80)
	GUI:setScaleY(btn_sgin_1, 0.80)
	GUI:setTouchEnabled(btn_sgin_1, true)
	GUI:setTag(btn_sgin_1, 179)

	-- Create btn_sgin_1_1
	local btn_sgin_1_1 = GUI:Image_Create(btn_sgin_1, "btn_sgin_1_1", 44.00, 45.00, "res/custom/SevenDaySignin/img_sgined_1.png")
	GUI:setAnchorPoint(btn_sgin_1_1, 0.50, 0.50)
	GUI:setTouchEnabled(btn_sgin_1_1, false)
	GUI:setTag(btn_sgin_1_1, 181)

	-- Create img_icon_1
	local img_icon_1 = GUI:Image_Create(btn_sgin_1, "img_icon_1", 44.00, 37.00, "Default/ImageFile.png")
	GUI:setAnchorPoint(img_icon_1, 0.50, 0.50)
	GUI:setOpacity(img_icon_1, 0)
	GUI:setTouchEnabled(img_icon_1, false)
	GUI:setTag(img_icon_1, 757)

	-- Create img_icon_n_1
	local img_icon_n_1 = GUI:Image_Create(img_icon_1, "img_icon_n_1", 22.00, 22.00, "res/custom/touming.png")
	GUI:setAnchorPoint(img_icon_n_1, 0.50, 0.50)
	GUI:setTouchEnabled(img_icon_n_1, false)
	GUI:setTag(img_icon_n_1, 792)

	-- Create img_icon_g_1
	local img_icon_g_1 = GUI:Image_Create(img_icon_1, "img_icon_g_1", 23.00, 23.00, "res/custom/SevenDaySignin/img_sgin_select.png")
	GUI:setAnchorPoint(img_icon_g_1, 0.50, 0.50)
	GUI:setTouchEnabled(img_icon_g_1, false)
	GUI:setTag(img_icon_g_1, 791)

	-- Create img_xz_1_1
	local img_xz_1_1 = GUI:Image_Create(btn_sgin_1, "img_xz_1_1", 44.00, 37.00, "res/custom/SevenDaySignin/img_sgin_select.png")
	GUI:setAnchorPoint(img_xz_1_1, 0.50, 0.50)
	GUI:setTouchEnabled(img_xz_1_1, false)
	GUI:setTag(img_xz_1_1, 758)

	-- Create tx_s_1
	local tx_s_1 = GUI:Text_Create(btn_sgin_1, "tx_s_1", 44.00, 103.00, 20, "#ffffff", [[第一天]])
	GUI:setAnchorPoint(tx_s_1, 0.50, 0.50)
	GUI:setTouchEnabled(tx_s_1, false)
	GUI:setTag(tx_s_1, 204)
	GUI:Text_enableOutline(tx_s_1, "#000000", 1)

	-- Create img_ylq_1
	local img_ylq_1 = GUI:Image_Create(btn_sgin_1, "img_ylq_1", 45.00, -12.00, "res/custom/SevenDaySignin/img_alarey_get.png")
	GUI:setAnchorPoint(img_ylq_1, 0.50, 0.50)
	GUI:setTouchEnabled(img_ylq_1, false)
	GUI:setTag(img_ylq_1, 756)

	-- Create n_s_effect_1
	local n_s_effect_1 = GUI:Node_Create(btn_sgin_1, "n_s_effect_1", 0.00, 0.00)
	GUI:setAnchorPoint(n_s_effect_1, 0.50, 0.50)
	GUI:setTag(n_s_effect_1, 465)

	-- Create btn_sgin_2
	local btn_sgin_2 = GUI:Button_Create(sgin_node, "btn_sgin_2", 81.00, 0.00, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_loadTexturePressed(btn_sgin_2, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_loadTextureDisabled(btn_sgin_2, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_setScale9Slice(btn_sgin_2, 15, 15, 11, 11)
	GUI:setContentSize(btn_sgin_2, 89, 90)
	GUI:setIgnoreContentAdaptWithSize(btn_sgin_2, false)
	GUI:Button_setTitleText(btn_sgin_2, "")
	GUI:Button_setTitleColor(btn_sgin_2, "#414146")
	GUI:Button_setTitleFontSize(btn_sgin_2, 14)
	GUI:Button_titleDisableOutLine(btn_sgin_2)
	GUI:setAnchorPoint(btn_sgin_2, 0.50, 0.50)
	GUI:setScaleX(btn_sgin_2, 0.80)
	GUI:setScaleY(btn_sgin_2, 0.80)
	GUI:setTouchEnabled(btn_sgin_2, true)
	GUI:setTag(btn_sgin_2, 185)

	-- Create btn_sgin_2_2
	local btn_sgin_2_2 = GUI:Image_Create(btn_sgin_2, "btn_sgin_2_2", 44.00, 45.00, "res/custom/SevenDaySignin/img_sgined_1.png")
	GUI:setAnchorPoint(btn_sgin_2_2, 0.50, 0.50)
	GUI:setTouchEnabled(btn_sgin_2_2, false)
	GUI:setTag(btn_sgin_2_2, 186)

	-- Create img_icon_2
	local img_icon_2 = GUI:Image_Create(btn_sgin_2, "img_icon_2", 44.00, 36.00, "Default/ImageFile.png")
	GUI:setAnchorPoint(img_icon_2, 0.50, 0.50)
	GUI:setOpacity(img_icon_2, 0)
	GUI:setTouchEnabled(img_icon_2, false)
	GUI:setTag(img_icon_2, 790)

	-- Create img_icon_n_2
	local img_icon_n_2 = GUI:Image_Create(img_icon_2, "img_icon_n_2", 22.00, 23.00, "res/custom/touming.png")
	GUI:setAnchorPoint(img_icon_n_2, 0.50, 0.50)
	GUI:setTouchEnabled(img_icon_n_2, false)
	GUI:setTag(img_icon_n_2, 796)

	-- Create img_icon_g_2
	local img_icon_g_2 = GUI:Image_Create(img_icon_2, "img_icon_g_2", 23.00, 24.00, "res/custom/SevenDaySignin/img_sgin_select.png")
	GUI:setAnchorPoint(img_icon_g_2, 0.50, 0.50)
	GUI:setTouchEnabled(img_icon_g_2, false)
	GUI:setTag(img_icon_g_2, 797)

	-- Create img_xz_2_2
	local img_xz_2_2 = GUI:Image_Create(btn_sgin_2, "img_xz_2_2", 44.00, 37.00, "res/custom/SevenDaySignin/img_sgin_select.png")
	GUI:setAnchorPoint(img_xz_2_2, 0.50, 0.50)
	GUI:setTouchEnabled(img_xz_2_2, false)
	GUI:setTag(img_xz_2_2, 759)

	-- Create tx_s_2
	local tx_s_2 = GUI:Text_Create(btn_sgin_2, "tx_s_2", 44.00, 103.00, 20, "#ffffff", [[第二天]])
	GUI:setAnchorPoint(tx_s_2, 0.50, 0.50)
	GUI:setTouchEnabled(tx_s_2, false)
	GUI:setTag(tx_s_2, 208)
	GUI:Text_enableOutline(tx_s_2, "#000000", 1)

	-- Create img_ylq_2
	local img_ylq_2 = GUI:Image_Create(btn_sgin_2, "img_ylq_2", 45.00, -12.00, "res/custom/SevenDaySignin/img_alarey_get.png")
	GUI:setAnchorPoint(img_ylq_2, 0.50, 0.50)
	GUI:setTouchEnabled(img_ylq_2, false)
	GUI:setTag(img_ylq_2, 813)

	-- Create n_s_effect_2
	local n_s_effect_2 = GUI:Node_Create(btn_sgin_2, "n_s_effect_2", 0.00, 0.00)
	GUI:setAnchorPoint(n_s_effect_2, 0.50, 0.50)
	GUI:setTag(n_s_effect_2, 466)

	-- Create btn_sgin_3
	local btn_sgin_3 = GUI:Button_Create(sgin_node, "btn_sgin_3", 162.00, 0.00, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_loadTexturePressed(btn_sgin_3, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_loadTextureDisabled(btn_sgin_3, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_setScale9Slice(btn_sgin_3, 15, 15, 11, 11)
	GUI:setContentSize(btn_sgin_3, 89, 90)
	GUI:setIgnoreContentAdaptWithSize(btn_sgin_3, false)
	GUI:Button_setTitleText(btn_sgin_3, "")
	GUI:Button_setTitleColor(btn_sgin_3, "#414146")
	GUI:Button_setTitleFontSize(btn_sgin_3, 14)
	GUI:Button_titleDisableOutLine(btn_sgin_3)
	GUI:setAnchorPoint(btn_sgin_3, 0.50, 0.50)
	GUI:setScaleX(btn_sgin_3, 0.80)
	GUI:setScaleY(btn_sgin_3, 0.80)
	GUI:setTouchEnabled(btn_sgin_3, true)
	GUI:setTag(btn_sgin_3, 188)

	-- Create btn_sgin_3_3
	local btn_sgin_3_3 = GUI:Image_Create(btn_sgin_3, "btn_sgin_3_3", 44.00, 45.00, "res/custom/SevenDaySignin/img_sgined_1.png")
	GUI:setAnchorPoint(btn_sgin_3_3, 0.50, 0.50)
	GUI:setTouchEnabled(btn_sgin_3_3, false)
	GUI:setTag(btn_sgin_3_3, 189)

	-- Create img_icon_3
	local img_icon_3 = GUI:Image_Create(btn_sgin_3, "img_icon_3", 45.00, 37.00, "Default/ImageFile.png")
	GUI:setAnchorPoint(img_icon_3, 0.50, 0.50)
	GUI:setOpacity(img_icon_3, 0)
	GUI:setTouchEnabled(img_icon_3, false)
	GUI:setTag(img_icon_3, 798)

	-- Create img_icon_n_3
	local img_icon_n_3 = GUI:Image_Create(img_icon_3, "img_icon_n_3", 22.00, 23.00, "res/custom/touming.png")
	GUI:setAnchorPoint(img_icon_n_3, 0.50, 0.50)
	GUI:setTouchEnabled(img_icon_n_3, false)
	GUI:setTag(img_icon_n_3, 799)

	-- Create img_icon_g_3
	local img_icon_g_3 = GUI:Image_Create(img_icon_3, "img_icon_g_3", 22.00, 23.00, "res/custom/SevenDaySignin/img_sgin_select.png")
	GUI:setAnchorPoint(img_icon_g_3, 0.50, 0.50)
	GUI:setTouchEnabled(img_icon_g_3, false)
	GUI:setTag(img_icon_g_3, 800)

	-- Create img_xz_3_3
	local img_xz_3_3 = GUI:Image_Create(btn_sgin_3, "img_xz_3_3", 44.00, 37.00, "res/custom/SevenDaySignin/img_sgin_select.png")
	GUI:setAnchorPoint(img_xz_3_3, 0.50, 0.50)
	GUI:setTouchEnabled(img_xz_3_3, false)
	GUI:setTag(img_xz_3_3, 760)

	-- Create tx_s_3
	local tx_s_3 = GUI:Text_Create(btn_sgin_3, "tx_s_3", 44.00, 103.00, 20, "#ffffff", [[第三天]])
	GUI:setAnchorPoint(tx_s_3, 0.50, 0.50)
	GUI:setTouchEnabled(tx_s_3, false)
	GUI:setTag(tx_s_3, 212)
	GUI:Text_enableOutline(tx_s_3, "#000000", 1)

	-- Create img_ylq_3
	local img_ylq_3 = GUI:Image_Create(btn_sgin_3, "img_ylq_3", 45.00, -12.00, "res/custom/SevenDaySignin/img_alarey_get.png")
	GUI:setAnchorPoint(img_ylq_3, 0.50, 0.50)
	GUI:setTouchEnabled(img_ylq_3, false)
	GUI:setTag(img_ylq_3, 814)

	-- Create n_s_effect_3
	local n_s_effect_3 = GUI:Node_Create(btn_sgin_3, "n_s_effect_3", 0.00, 0.00)
	GUI:setAnchorPoint(n_s_effect_3, 0.50, 0.50)
	GUI:setTag(n_s_effect_3, 467)

	-- Create btn_sgin_4
	local btn_sgin_4 = GUI:Button_Create(sgin_node, "btn_sgin_4", 243.00, -0.00, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_loadTexturePressed(btn_sgin_4, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_loadTextureDisabled(btn_sgin_4, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_setScale9Slice(btn_sgin_4, 15, 15, 11, 11)
	GUI:setContentSize(btn_sgin_4, 89, 90)
	GUI:setIgnoreContentAdaptWithSize(btn_sgin_4, false)
	GUI:Button_setTitleText(btn_sgin_4, "")
	GUI:Button_setTitleColor(btn_sgin_4, "#414146")
	GUI:Button_setTitleFontSize(btn_sgin_4, 14)
	GUI:Button_titleDisableOutLine(btn_sgin_4)
	GUI:setAnchorPoint(btn_sgin_4, 0.50, 0.50)
	GUI:setScaleX(btn_sgin_4, 0.80)
	GUI:setScaleY(btn_sgin_4, 0.80)
	GUI:setTouchEnabled(btn_sgin_4, true)
	GUI:setTag(btn_sgin_4, 191)

	-- Create btn_sgin_4_4
	local btn_sgin_4_4 = GUI:Image_Create(btn_sgin_4, "btn_sgin_4_4", 44.00, 45.00, "res/custom/SevenDaySignin/img_sgined_1.png")
	GUI:setAnchorPoint(btn_sgin_4_4, 0.50, 0.50)
	GUI:setTouchEnabled(btn_sgin_4_4, false)
	GUI:setTag(btn_sgin_4_4, 192)

	-- Create img_icon_4
	local img_icon_4 = GUI:Image_Create(btn_sgin_4, "img_icon_4", 45.00, 36.00, "Default/ImageFile.png")
	GUI:setAnchorPoint(img_icon_4, 0.50, 0.50)
	GUI:setOpacity(img_icon_4, 0)
	GUI:setTouchEnabled(img_icon_4, false)
	GUI:setTag(img_icon_4, 801)

	-- Create img_icon_n_4
	local img_icon_n_4 = GUI:Image_Create(img_icon_4, "img_icon_n_4", 22.00, 23.00, "res/custom/touming.png")
	GUI:setAnchorPoint(img_icon_n_4, 0.50, 0.50)
	GUI:setTouchEnabled(img_icon_n_4, false)
	GUI:setTag(img_icon_n_4, 802)

	-- Create img_icon_g_4
	local img_icon_g_4 = GUI:Image_Create(img_icon_4, "img_icon_g_4", 22.00, 24.00, "res/custom/SevenDaySignin/img_sgin_select.png")
	GUI:setAnchorPoint(img_icon_g_4, 0.50, 0.50)
	GUI:setTouchEnabled(img_icon_g_4, false)
	GUI:setTag(img_icon_g_4, 803)

	-- Create img_xz_4_4
	local img_xz_4_4 = GUI:Image_Create(btn_sgin_4, "img_xz_4_4", 44.00, 37.00, "res/custom/SevenDaySignin/img_sgin_select.png")
	GUI:setAnchorPoint(img_xz_4_4, 0.50, 0.50)
	GUI:setTouchEnabled(img_xz_4_4, false)
	GUI:setTag(img_xz_4_4, 761)

	-- Create tx_s_4
	local tx_s_4 = GUI:Text_Create(btn_sgin_4, "tx_s_4", 44.00, 103.00, 20, "#ffffff", [[第四天]])
	GUI:setAnchorPoint(tx_s_4, 0.50, 0.50)
	GUI:setTouchEnabled(tx_s_4, false)
	GUI:setTag(tx_s_4, 214)
	GUI:Text_enableOutline(tx_s_4, "#000000", 1)

	-- Create img_ylq_4
	local img_ylq_4 = GUI:Image_Create(btn_sgin_4, "img_ylq_4", 45.00, -12.00, "res/custom/SevenDaySignin/img_alarey_get.png")
	GUI:setAnchorPoint(img_ylq_4, 0.50, 0.50)
	GUI:setTouchEnabled(img_ylq_4, false)
	GUI:setTag(img_ylq_4, 815)

	-- Create n_s_effect_4
	local n_s_effect_4 = GUI:Node_Create(btn_sgin_4, "n_s_effect_4", 0.00, 0.00)
	GUI:setAnchorPoint(n_s_effect_4, 0.50, 0.50)
	GUI:setTag(n_s_effect_4, 468)

	-- Create btn_sgin_5
	local btn_sgin_5 = GUI:Button_Create(sgin_node, "btn_sgin_5", 325.00, 0.00, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_loadTexturePressed(btn_sgin_5, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_loadTextureDisabled(btn_sgin_5, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_setScale9Slice(btn_sgin_5, 15, 15, 11, 11)
	GUI:setContentSize(btn_sgin_5, 89, 90)
	GUI:setIgnoreContentAdaptWithSize(btn_sgin_5, false)
	GUI:Button_setTitleText(btn_sgin_5, "")
	GUI:Button_setTitleColor(btn_sgin_5, "#414146")
	GUI:Button_setTitleFontSize(btn_sgin_5, 14)
	GUI:Button_titleDisableOutLine(btn_sgin_5)
	GUI:setAnchorPoint(btn_sgin_5, 0.50, 0.50)
	GUI:setScaleX(btn_sgin_5, 0.80)
	GUI:setScaleY(btn_sgin_5, 0.80)
	GUI:setTouchEnabled(btn_sgin_5, true)
	GUI:setTag(btn_sgin_5, 194)

	-- Create btn_sgin_5_5
	local btn_sgin_5_5 = GUI:Image_Create(btn_sgin_5, "btn_sgin_5_5", 44.00, 45.00, "res/custom/SevenDaySignin/img_sgined_1.png")
	GUI:setAnchorPoint(btn_sgin_5_5, 0.50, 0.50)
	GUI:setTouchEnabled(btn_sgin_5_5, false)
	GUI:setTag(btn_sgin_5_5, 195)

	-- Create img_icon_5
	local img_icon_5 = GUI:Image_Create(btn_sgin_5, "img_icon_5", 46.00, 33.00, "Default/ImageFile.png")
	GUI:setAnchorPoint(img_icon_5, 0.50, 0.50)
	GUI:setOpacity(img_icon_5, 0)
	GUI:setTouchEnabled(img_icon_5, false)
	GUI:setTag(img_icon_5, 804)

	-- Create img_icon_n_5
	local img_icon_n_5 = GUI:Image_Create(img_icon_5, "img_icon_n_5", 22.00, 23.00, "res/custom/touming.png")
	GUI:setAnchorPoint(img_icon_n_5, 0.50, 0.50)
	GUI:setTouchEnabled(img_icon_n_5, false)
	GUI:setTag(img_icon_n_5, 805)

	-- Create img_icon_g_5
	local img_icon_g_5 = GUI:Image_Create(img_icon_5, "img_icon_g_5", 21.00, 27.00, "res/custom/SevenDaySignin/img_sgin_select.png")
	GUI:setAnchorPoint(img_icon_g_5, 0.50, 0.50)
	GUI:setTouchEnabled(img_icon_g_5, false)
	GUI:setTag(img_icon_g_5, 806)

	-- Create img_xz_5_5
	local img_xz_5_5 = GUI:Image_Create(btn_sgin_5, "img_xz_5_5", 44.00, 37.00, "res/custom/SevenDaySignin/img_sgin_select.png")
	GUI:setAnchorPoint(img_xz_5_5, 0.50, 0.50)
	GUI:setTouchEnabled(img_xz_5_5, false)
	GUI:setTag(img_xz_5_5, 762)

	-- Create tx_s_5
	local tx_s_5 = GUI:Text_Create(btn_sgin_5, "tx_s_5", 44.00, 103.00, 20, "#ffffff", [[第五天]])
	GUI:setAnchorPoint(tx_s_5, 0.50, 0.50)
	GUI:setTouchEnabled(tx_s_5, false)
	GUI:setTag(tx_s_5, 216)
	GUI:Text_enableOutline(tx_s_5, "#000000", 1)

	-- Create img_ylq_5
	local img_ylq_5 = GUI:Image_Create(btn_sgin_5, "img_ylq_5", 45.00, -12.00, "res/custom/SevenDaySignin/img_alarey_get.png")
	GUI:setAnchorPoint(img_ylq_5, 0.50, 0.50)
	GUI:setTouchEnabled(img_ylq_5, false)
	GUI:setTag(img_ylq_5, 816)

	-- Create n_s_effect_5
	local n_s_effect_5 = GUI:Node_Create(btn_sgin_5, "n_s_effect_5", 0.00, 0.00)
	GUI:setAnchorPoint(n_s_effect_5, 0.50, 0.50)
	GUI:setTag(n_s_effect_5, 469)

	-- Create btn_sgin_6
	local btn_sgin_6 = GUI:Button_Create(sgin_node, "btn_sgin_6", 406.00, -0.00, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_loadTexturePressed(btn_sgin_6, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_loadTextureDisabled(btn_sgin_6, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_setScale9Slice(btn_sgin_6, 15, 15, 11, 11)
	GUI:setContentSize(btn_sgin_6, 89, 90)
	GUI:setIgnoreContentAdaptWithSize(btn_sgin_6, false)
	GUI:Button_setTitleText(btn_sgin_6, "")
	GUI:Button_setTitleColor(btn_sgin_6, "#414146")
	GUI:Button_setTitleFontSize(btn_sgin_6, 14)
	GUI:Button_titleDisableOutLine(btn_sgin_6)
	GUI:setAnchorPoint(btn_sgin_6, 0.50, 0.50)
	GUI:setScaleX(btn_sgin_6, 0.80)
	GUI:setScaleY(btn_sgin_6, 0.80)
	GUI:setTouchEnabled(btn_sgin_6, true)
	GUI:setTag(btn_sgin_6, 197)

	-- Create btn_sgin_6_6
	local btn_sgin_6_6 = GUI:Image_Create(btn_sgin_6, "btn_sgin_6_6", 44.00, 45.00, "res/custom/SevenDaySignin/img_sgined_1.png")
	GUI:setAnchorPoint(btn_sgin_6_6, 0.50, 0.50)
	GUI:setTouchEnabled(btn_sgin_6_6, false)
	GUI:setTag(btn_sgin_6_6, 198)

	-- Create img_icon_6
	local img_icon_6 = GUI:Image_Create(btn_sgin_6, "img_icon_6", 45.00, 37.00, "Default/ImageFile.png")
	GUI:setAnchorPoint(img_icon_6, 0.50, 0.50)
	GUI:setOpacity(img_icon_6, 0)
	GUI:setTouchEnabled(img_icon_6, false)
	GUI:setTag(img_icon_6, 807)

	-- Create img_icon_n_6
	local img_icon_n_6 = GUI:Image_Create(img_icon_6, "img_icon_n_6", 22.00, 23.00, "res/custom/touming.png")
	GUI:setAnchorPoint(img_icon_n_6, 0.50, 0.50)
	GUI:setTouchEnabled(img_icon_n_6, false)
	GUI:setTag(img_icon_n_6, 808)

	-- Create img_icon_g_6
	local img_icon_g_6 = GUI:Image_Create(img_icon_6, "img_icon_g_6", 22.00, 23.00, "res/custom/SevenDaySignin/img_sgin_select.png")
	GUI:setAnchorPoint(img_icon_g_6, 0.50, 0.50)
	GUI:setTouchEnabled(img_icon_g_6, false)
	GUI:setTag(img_icon_g_6, 809)

	-- Create img_xz_6_6
	local img_xz_6_6 = GUI:Image_Create(btn_sgin_6, "img_xz_6_6", 44.00, 37.00, "res/custom/SevenDaySignin/img_sgin_select.png")
	GUI:setAnchorPoint(img_xz_6_6, 0.50, 0.50)
	GUI:setTouchEnabled(img_xz_6_6, false)
	GUI:setTag(img_xz_6_6, 763)

	-- Create tx_s_6
	local tx_s_6 = GUI:Text_Create(btn_sgin_6, "tx_s_6", 44.00, 103.00, 20, "#ffffff", [[第六天]])
	GUI:setAnchorPoint(tx_s_6, 0.50, 0.50)
	GUI:setTouchEnabled(tx_s_6, false)
	GUI:setTag(tx_s_6, 218)
	GUI:Text_enableOutline(tx_s_6, "#000000", 1)

	-- Create img_ylq_6
	local img_ylq_6 = GUI:Image_Create(btn_sgin_6, "img_ylq_6", 45.00, -12.00, "res/custom/SevenDaySignin/img_alarey_get.png")
	GUI:setAnchorPoint(img_ylq_6, 0.50, 0.50)
	GUI:setTouchEnabled(img_ylq_6, false)
	GUI:setTag(img_ylq_6, 817)

	-- Create n_s_effect_6
	local n_s_effect_6 = GUI:Node_Create(btn_sgin_6, "n_s_effect_6", 0.00, 0.00)
	GUI:setAnchorPoint(n_s_effect_6, 0.50, 0.50)
	GUI:setTag(n_s_effect_6, 470)

	-- Create btn_sgin_7
	local btn_sgin_7 = GUI:Button_Create(sgin_node, "btn_sgin_7", 487.00, -0.00, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_loadTexturePressed(btn_sgin_7, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_loadTextureDisabled(btn_sgin_7, "res/custom/SevenDaySignin/img_sgined.png")
	GUI:Button_setScale9Slice(btn_sgin_7, 15, 15, 11, 11)
	GUI:setContentSize(btn_sgin_7, 89, 90)
	GUI:setIgnoreContentAdaptWithSize(btn_sgin_7, false)
	GUI:Button_setTitleText(btn_sgin_7, "")
	GUI:Button_setTitleColor(btn_sgin_7, "#414146")
	GUI:Button_setTitleFontSize(btn_sgin_7, 14)
	GUI:Button_titleDisableOutLine(btn_sgin_7)
	GUI:setAnchorPoint(btn_sgin_7, 0.50, 0.50)
	GUI:setScaleX(btn_sgin_7, 0.80)
	GUI:setScaleY(btn_sgin_7, 0.80)
	GUI:setTouchEnabled(btn_sgin_7, true)
	GUI:setTag(btn_sgin_7, 200)

	-- Create btn_sgin_7_7
	local btn_sgin_7_7 = GUI:Image_Create(btn_sgin_7, "btn_sgin_7_7", 44.00, 45.00, "res/custom/SevenDaySignin/img_sgined_1.png")
	GUI:setAnchorPoint(btn_sgin_7_7, 0.50, 0.50)
	GUI:setTouchEnabled(btn_sgin_7_7, false)
	GUI:setTag(btn_sgin_7_7, 201)

	-- Create img_icon_7
	local img_icon_7 = GUI:Image_Create(btn_sgin_7, "img_icon_7", 46.00, 36.00, "Default/ImageFile.png")
	GUI:setAnchorPoint(img_icon_7, 0.50, 0.50)
	GUI:setOpacity(img_icon_7, 0)
	GUI:setTouchEnabled(img_icon_7, false)
	GUI:setTag(img_icon_7, 810)

	-- Create img_icon_n_7
	local img_icon_n_7 = GUI:Image_Create(img_icon_7, "img_icon_n_7", 22.00, 23.00, "res/custom/touming.png")
	GUI:setAnchorPoint(img_icon_n_7, 0.50, 0.50)
	GUI:setTouchEnabled(img_icon_n_7, false)
	GUI:setTag(img_icon_n_7, 811)

	-- Create img_icon_g_7
	local img_icon_g_7 = GUI:Image_Create(img_icon_7, "img_icon_g_7", 21.00, 24.00, "res/custom/SevenDaySignin/img_sgin_select.png")
	GUI:setAnchorPoint(img_icon_g_7, 0.50, 0.50)
	GUI:setTouchEnabled(img_icon_g_7, false)
	GUI:setTag(img_icon_g_7, 812)

	-- Create img_xz_7_7
	local img_xz_7_7 = GUI:Image_Create(btn_sgin_7, "img_xz_7_7", 44.00, 37.00, "res/custom/SevenDaySignin/img_sgin_select.png")
	GUI:setAnchorPoint(img_xz_7_7, 0.50, 0.50)
	GUI:setTouchEnabled(img_xz_7_7, false)
	GUI:setTag(img_xz_7_7, 764)

	-- Create tx_s_7
	local tx_s_7 = GUI:Text_Create(btn_sgin_7, "tx_s_7", 44.00, 107.00, 20, "#ffffff", [[第七天]])
	GUI:setAnchorPoint(tx_s_7, 0.53, 0.70)
	GUI:setTouchEnabled(tx_s_7, false)
	GUI:setTag(tx_s_7, 220)
	GUI:Text_enableOutline(tx_s_7, "#000000", 1)

	-- Create img_ylq_7
	local img_ylq_7 = GUI:Image_Create(btn_sgin_7, "img_ylq_7", 45.00, -12.00, "res/custom/SevenDaySignin/img_alarey_get.png")
	GUI:setAnchorPoint(img_ylq_7, 0.50, 0.50)
	GUI:setTouchEnabled(img_ylq_7, false)
	GUI:setTag(img_ylq_7, 818)

	-- Create n_s_effect_7
	local n_s_effect_7 = GUI:Node_Create(btn_sgin_7, "n_s_effect_7", 0.00, 0.00)
	GUI:setAnchorPoint(n_s_effect_7, 0.50, 0.50)
	GUI:setTag(n_s_effect_7, 471)

	-- Create img_des_5
	local img_des_5 = GUI:Image_Create(img_bg, "img_des_5", 531.00, 128.00, "res/custom/SevenDaySignin/img_reward_di.png")
	GUI:setAnchorPoint(img_des_5, 0.50, 0.50)
	GUI:setTouchEnabled(img_des_5, false)
	GUI:setTag(img_des_5, 937)

	-- Create ndoe_bottom
	local ndoe_bottom = GUI:Node_Create(img_bg, "ndoe_bottom", -103.00, -63.00)
	GUI:setAnchorPoint(ndoe_bottom, 0.50, 0.50)
	GUI:setTag(ndoe_bottom, 221)

	-- Create ls_pack
	local ls_pack = GUI:ListView_Create(ndoe_bottom, "ls_pack", 634.00, 228.00, 360.00, 75.86, 2)
	GUI:ListView_setGravity(ls_pack, 5)
	GUI:setAnchorPoint(ls_pack, 0.50, 1.00)
	GUI:setTouchEnabled(ls_pack, true)
	GUI:setTag(ls_pack, 789)

	-- Create img_des_di
	local img_des_di = GUI:Image_Create(ndoe_bottom, "img_des_di", 674.00, 290.00, "res/custom/SevenDaySignin/img_desc/img_desc_1.png")
	GUI:setAnchorPoint(img_des_di, 0.50, 0.50)
	GUI:setScaleX(img_des_di, 0.80)
	GUI:setScaleY(img_des_di, 0.80)
	GUI:setTouchEnabled(img_des_di, false)
	GUI:setTag(img_des_di, 225)

	-- Create btn_get
	local btn_get = GUI:Button_Create(ndoe_bottom, "btn_get", 634.00, 115.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(btn_get, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(btn_get, 15, 15, 11, 11)
	GUI:setContentSize(btn_get, 110, 36)
	GUI:setIgnoreContentAdaptWithSize(btn_get, false)
	GUI:Button_setTitleText(btn_get, "")
	GUI:Button_setTitleColor(btn_get, "#332820")
	GUI:Button_setTitleFontSize(btn_get, 20)
	GUI:Button_titleEnableOutline(btn_get, "#000000", 1)
	GUI:setAnchorPoint(btn_get, 0.50, 0.50)
	GUI:setTouchEnabled(btn_get, true)
	GUI:setTag(btn_get, 563)

	-- Create txt_tip_1
	local txt_tip_1 = GUI:Text_Create(btn_get, "txt_tip_1", 55.00, 18.00, 18, "#ffffb7", [[领取奖励]])
	GUI:setAnchorPoint(txt_tip_1, 0.50, 0.50)
	GUI:setTouchEnabled(txt_tip_1, false)
	GUI:setTag(txt_tip_1, 564)
	GUI:Text_enableOutline(txt_tip_1, "#000000", 1)

	-- Create n_btn_effect
	local n_btn_effect = GUI:Node_Create(btn_get, "n_btn_effect", 0.00, 0.00)
	GUI:setAnchorPoint(n_btn_effect, 0.50, 0.50)
	GUI:setTag(n_btn_effect, 173)

	-- Create img_7
	local img_7 = GUI:Image_Create(ndoe_bottom, "img_7", 385.00, 321.00, "res/custom/SevenDaySignin/img_ch_di.png")
	GUI:setAnchorPoint(img_7, 0.50, 0.50)
	GUI:setScaleX(img_7, 0.80)
	GUI:setScaleY(img_7, 0.80)
	GUI:setTouchEnabled(img_7, false)
	GUI:setTag(img_7, 128)

	-- Create txt_ch_tx
	local txt_ch_tx = GUI:Text_Create(img_7, "txt_ch_tx", 145.00, 34.00, 22, "#00d1ff", [[奖励介绍]])
	GUI:setAnchorPoint(txt_ch_tx, 0.50, 0.50)
	GUI:setTouchEnabled(txt_ch_tx, false)
	GUI:setTag(txt_ch_tx, 543)
	GUI:Text_enableOutline(txt_ch_tx, "#000000", 1)

	-- Create node_eff
	local node_eff = GUI:Node_Create(ndoe_bottom, "node_eff", 268.00, 209.00)
	GUI:setAnchorPoint(node_eff, 0.50, 0.50)
	GUI:setTag(node_eff, 472)

	-- Create template
	local template = GUI:Layout_Create(Layer, "template", 678.00, 160.00, 60.00, 60.00, false)
	GUI:Layout_setBackGroundColorType(template, 1)
	GUI:Layout_setBackGroundColor(template, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(template, 0)
	GUI:setTouchEnabled(template, true)
	GUI:setTag(template, 398)
	GUI:setVisible(template, false)

	-- Create itemBg
	local itemBg = GUI:Image_Create(template, "itemBg", 25.00, 31.00, "res/custom/common/img_cell_1.png")
	GUI:Image_setScale9Slice(itemBg, 26, 26, 26, 26)
	GUI:setContentSize(itemBg, 50, 50)
	GUI:setIgnoreContentAdaptWithSize(itemBg, false)
	GUI:setAnchorPoint(itemBg, 0.50, 0.50)
	GUI:setTouchEnabled(itemBg, false)
	GUI:setTag(itemBg, 399)
end
return ui