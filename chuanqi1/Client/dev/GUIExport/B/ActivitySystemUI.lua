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
	GUI:setTag(la_bg, 285)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 236)

	-- Create img_bg
	local img_bg = GUI:Image_Create(nd_root, "img_bg", 31.00, -9.00, "res/custom/common/00128.png")
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg, true)
	GUI:setTag(img_bg, 237)

	-- Create tx_title
	local tx_title = GUI:Text_Create(img_bg, "tx_title", 84.00, 442.00, 20, "#d6c6ad", [[活动]])
	GUI:setAnchorPoint(tx_title, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 500)
	GUI:Text_enableOutline(tx_title, "#000000", 2)

	-- Create btn_close
	local btn_close = GUI:Button_Create(img_bg, "btn_close", 745.00, 454.00, "res/custom/common/btn_close_1_1.png")
	GUI:Button_loadTexturePressed(btn_close, "res/custom/common/btn_close_1_2.png")
	GUI:Button_setScale9Slice(btn_close, 11, 11, 11, 11)
	GUI:setContentSize(btn_close, 26, 42)
	GUI:setIgnoreContentAdaptWithSize(btn_close, false)
	GUI:Button_setTitleText(btn_close, "")
	GUI:Button_setTitleColor(btn_close, "#414146")
	GUI:Button_setTitleFontSize(btn_close, 14)
	GUI:Button_titleDisableOutLine(btn_close)
	GUI:setAnchorPoint(btn_close, 0.50, 0.50)
	GUI:setTouchEnabled(btn_close, true)
	GUI:setTag(btn_close, 238)

	-- Create nd_content
	local nd_content = GUI:Node_Create(img_bg, "nd_content", 0.00, 0.00)
	GUI:setAnchorPoint(nd_content, 0.50, 0.50)
	GUI:setTag(nd_content, 241)

	-- Create template
	local template = GUI:Button_Create(nd_content, "template", 259.00, 357.00, "res/custom/activitySystem/bg_riczy_01.jpg")
	GUI:Button_setScale9Slice(template, 202, 202, 50, 50)
	GUI:setContentSize(template, 440, 120)
	GUI:setIgnoreContentAdaptWithSize(template, false)
	GUI:Button_setTitleText(template, "")
	GUI:Button_setTitleColor(template, "#414146")
	GUI:Button_setTitleFontSize(template, 16)
	GUI:Button_titleDisableOutLine(template)
	GUI:setAnchorPoint(template, 0.50, 0.50)
	GUI:setTouchEnabled(template, true)
	GUI:setTag(template, 62)

	-- Create img_liang
	local img_liang = GUI:Image_Create(template, "img_liang", 0.00, 6.00, "res/custom/activitySystem/bg_riczy_01.jpg")
	GUI:setContentSize(img_liang, 440, 110)
	GUI:setIgnoreContentAdaptWithSize(img_liang, false)
	GUI:setTouchEnabled(img_liang, false)
	GUI:setTag(img_liang, 214)

	-- Create tx_title
	local tx_title = GUI:Text_Create(template, "tx_title", 115.00, 105.00, 16, "#ffffff", [[]])
	GUI:setAnchorPoint(tx_title, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 12)
	GUI:Text_enableOutline(tx_title, "#000000", 1)

	-- Create tx_time
	local tx_time = GUI:Text_Create(template, "tx_time", 84.00, 71.00, 16, "#ffffff", [[开启时间：2022-04.01]])
	GUI:setAnchorPoint(tx_time, 0.00, 1.00)
	GUI:setTouchEnabled(tx_time, false)
	GUI:setTag(tx_time, 666)
	GUI:Text_enableOutline(tx_time, "#000000", 1)

	-- Create tx_time_3
	local tx_time_3 = GUI:Text_Create(template, "tx_time_3", 85.00, 84.00, 16, "#ffffff", [[未开始]])
	GUI:setAnchorPoint(tx_time_3, 0.00, 1.00)
	GUI:setTouchEnabled(tx_time_3, false)
	GUI:setTag(tx_time_3, 96)
	GUI:setVisible(tx_time_3, false)
	GUI:Text_enableOutline(tx_time_3, "#000000", 1)

	-- Create tx_time_2
	local tx_time_2 = GUI:Text_Create(template, "tx_time_2", 85.00, 30.00, 16, "#44c14c", [[每天开启!]])
	GUI:setAnchorPoint(tx_time_2, 0.00, 1.00)
	GUI:setTouchEnabled(tx_time_2, false)
	GUI:setTag(tx_time_2, 1116)
	GUI:Text_enableOutline(tx_time_2, "#000000", 1)

	-- Create icon_state
	local icon_state = GUI:Layout_Create(template, "icon_state", 337.00, 6.00, 100.00, 70.00, true)
	GUI:Layout_setBackGroundColorType(icon_state, 1)
	GUI:Layout_setBackGroundColor(icon_state, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(icon_state, 0)
	GUI:setTouchEnabled(icon_state, true)
	GUI:setTag(icon_state, 250)

	-- Create tx_Gift_title
	local tx_Gift_title = GUI:Text_Create(template, "tx_Gift_title", 331.00, 106.00, 15, "#e1e876", [[奖励预览：]])
	GUI:setAnchorPoint(tx_Gift_title, 0.50, 0.50)
	GUI:setTouchEnabled(tx_Gift_title, false)
	GUI:setTag(tx_Gift_title, 1115)
	GUI:Text_enableOutline(tx_Gift_title, "#000000", 1)

	-- Create img_icon
	local img_icon = GUI:Image_Create(template, "img_icon", 9.00, 24.00, "res/custom/activitySystem/img_1.png")
	GUI:setTouchEnabled(img_icon, false)
	GUI:setTag(img_icon, 1060)

	-- Create img_red_point
	local img_red_point = GUI:Image_Create(template, "img_red_point", 433.00, 110.00, "res/custom/common/img_2.png")
	GUI:setAnchorPoint(img_red_point, 0.50, 0.50)
	GUI:setScaleX(img_red_point, 0.60)
	GUI:setScaleY(img_red_point, 0.60)
	GUI:setTouchEnabled(img_red_point, false)
	GUI:setTag(img_red_point, 391)
	GUI:setVisible(img_red_point, false)

	-- Create active_list
	local active_list = GUI:ListView_Create(nd_content, "active_list", 37.00, 417.00, 440.00, 385.00, 1)
	GUI:ListView_setGravity(active_list, 5)
	GUI:setAnchorPoint(active_list, 0.00, 1.00)
	GUI:setTouchEnabled(active_list, true)
	GUI:setTag(active_list, 11)

	-- Create Image_6
	local Image_6 = GUI:Image_Create(nd_content, "Image_6", 480.00, 33.00, "res/custom/common/img_line_1.png")
	GUI:setContentSize(Image_6, 4, 383)
	GUI:setIgnoreContentAdaptWithSize(Image_6, false)
	GUI:setAnchorPoint(Image_6, 0.50, 0.00)
	GUI:setTouchEnabled(Image_6, false)
	GUI:setTag(Image_6, 145)

	-- Create details_title
	local details_title = GUI:Image_Create(nd_content, "details_title", 590.00, 400.00, "res/custom/common/img_1.png")
	GUI:Image_setScale9Slice(details_title, 44, 44, 3, 3)
	GUI:setContentSize(details_title, 220, 12)
	GUI:setIgnoreContentAdaptWithSize(details_title, false)
	GUI:setAnchorPoint(details_title, 0.50, 0.50)
	GUI:setTouchEnabled(details_title, false)
	GUI:setTag(details_title, 672)

	-- Create tx_details_title
	local tx_details_title = GUI:Text_Create(details_title, "tx_details_title", 110.00, 7.00, 16, "#ffffff", [[]])
	GUI:setAnchorPoint(tx_details_title, 0.50, 0.50)
	GUI:setTouchEnabled(tx_details_title, false)
	GUI:setTag(tx_details_title, 673)
	GUI:Text_enableOutline(tx_details_title, "#000000", 1)

	-- Create tx_info
	local tx_info = GUI:Text_Create(details_title, "tx_info", 8.00, -10.00, 16, "#ffffff", [[]])
	GUI:setAnchorPoint(tx_info, 0.00, 1.00)
	GUI:setTouchEnabled(tx_info, false)
	GUI:setTag(tx_info, 674)
	GUI:Text_enableOutline(tx_info, "#000000", 1)

	-- Create btn_go_activity
	local btn_go_activity = GUI:Button_Create(nd_content, "btn_go_activity", 592.00, 70.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(btn_go_activity, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(btn_go_activity, 15, 15, 11, 11)
	GUI:setContentSize(btn_go_activity, 122, 34)
	GUI:setIgnoreContentAdaptWithSize(btn_go_activity, false)
	GUI:Button_setTitleText(btn_go_activity, "")
	GUI:Button_setTitleColor(btn_go_activity, "#42311c")
	GUI:Button_setTitleFontSize(btn_go_activity, 18)
	GUI:Button_titleDisableOutLine(btn_go_activity)
	GUI:setAnchorPoint(btn_go_activity, 0.50, 0.50)
	GUI:setTouchEnabled(btn_go_activity, true)
	GUI:setTag(btn_go_activity, 216)

	-- Create Text_14
	local Text_14 = GUI:Text_Create(btn_go_activity, "Text_14", 61.00, 18.00, 18, "#ffff00", [[前往活动]])
	GUI:setAnchorPoint(Text_14, 0.50, 0.50)
	GUI:setTouchEnabled(Text_14, false)
	GUI:setTag(Text_14, 547)
	GUI:Text_enableOutline(Text_14, "#000000", 1)

	-- Create jifen_btn_2
	local jifen_btn_2 = GUI:Button_Create(nd_root, "jifen_btn_2", 254.00, -150.00, "res/custom/activitySystem/5.png")
	GUI:Button_loadTexturePressed(jifen_btn_2, "res/custom/activitySystem/5.png")
	GUI:Button_loadTextureDisabled(jifen_btn_2, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(jifen_btn_2, 15, 15, 11, 11)
	GUI:setContentSize(jifen_btn_2, 62, 62)
	GUI:setIgnoreContentAdaptWithSize(jifen_btn_2, false)
	GUI:Button_setTitleText(jifen_btn_2, "")
	GUI:Button_setTitleColor(jifen_btn_2, "#414146")
	GUI:Button_setTitleFontSize(jifen_btn_2, 14)
	GUI:Button_titleDisableOutLine(jifen_btn_2)
	GUI:setAnchorPoint(jifen_btn_2, 0.50, 0.50)
	GUI:setScaleX(jifen_btn_2, 0.90)
	GUI:setScaleY(jifen_btn_2, 0.90)
	GUI:setTouchEnabled(jifen_btn_2, true)
	GUI:setTag(jifen_btn_2, 51)

	-- Create paihang_btn
	local paihang_btn = GUI:Button_Create(nd_root, "paihang_btn", 311.00, -150.00, "res/custom/activitySystem/3.png")
	GUI:Button_loadTexturePressed(paihang_btn, "res/custom/activitySystem/3.png")
	GUI:Button_loadTextureDisabled(paihang_btn, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(paihang_btn, 15, 15, 11, 11)
	GUI:setContentSize(paihang_btn, 58, 58)
	GUI:setIgnoreContentAdaptWithSize(paihang_btn, false)
	GUI:Button_setTitleText(paihang_btn, "")
	GUI:Button_setTitleColor(paihang_btn, "#414146")
	GUI:Button_setTitleFontSize(paihang_btn, 14)
	GUI:Button_titleDisableOutLine(paihang_btn)
	GUI:setAnchorPoint(paihang_btn, 0.50, 0.50)
	GUI:setScaleX(paihang_btn, 0.90)
	GUI:setScaleY(paihang_btn, 0.90)
	GUI:setTouchEnabled(paihang_btn, true)
	GUI:setTag(paihang_btn, 98)

	-- Create jifen_btn
	local jifen_btn = GUI:Button_Create(nd_root, "jifen_btn", 195.00, -150.00, "res/custom/activitySystem/5.png")
	GUI:Button_loadTexturePressed(jifen_btn, "res/custom/activitySystem/5.png")
	GUI:Button_loadTextureDisabled(jifen_btn, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(jifen_btn, 15, 15, 11, 11)
	GUI:setContentSize(jifen_btn, 62, 62)
	GUI:setIgnoreContentAdaptWithSize(jifen_btn, false)
	GUI:Button_setTitleText(jifen_btn, "")
	GUI:Button_setTitleColor(jifen_btn, "#414146")
	GUI:Button_setTitleFontSize(jifen_btn, 14)
	GUI:Button_titleDisableOutLine(jifen_btn)
	GUI:setAnchorPoint(jifen_btn, 0.50, 0.50)
	GUI:setScaleX(jifen_btn, 0.90)
	GUI:setScaleY(jifen_btn, 0.90)
	GUI:setTouchEnabled(jifen_btn, true)
	GUI:setTag(jifen_btn, 97)
end
return ui