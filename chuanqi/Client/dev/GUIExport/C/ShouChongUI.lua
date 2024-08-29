local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create bg_close
	local bg_close = GUI:Layout_Create(Layer, "bg_close", -0.56, -0.56, 1136.00, 640.00, false)
	GUI:Layout_setBackGroundColorType(bg_close, 1)
	GUI:Layout_setBackGroundColor(bg_close, "#000000")
	GUI:Layout_setBackGroundColorOpacity(bg_close, 102)
	GUI:setTouchEnabled(bg_close, true)
	GUI:setTag(bg_close, 2071)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 2033)

	-- Create img_bg
	local img_bg = GUI:Image_Create(nd_root, "img_bg", 0.00, 0.00, "res/custom/shouchong/img_2.png")
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg, true)
	GUI:setTag(img_bg, 461)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(img_bg, "Panel_1", 168.54, 462.42, 500.00, 90.00, true)
	GUI:Layout_setBackGroundColorType(Panel_1, 1)
	GUI:Layout_setBackGroundColor(Panel_1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(Panel_1, 0)
	GUI:setAnchorPoint(Panel_1, 0.00, 1.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 2068)

	-- Create img_title
	local img_title = GUI:Image_Create(Panel_1, "img_title", 264.72, -130.02, "res/custom/shouchong/img_1.png")
	GUI:setAnchorPoint(img_title, 0.50, 0.50)
	GUI:setTouchEnabled(img_title, false)
	GUI:setTag(img_title, 582)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(img_bg, "Panel_2", 214.91, 383.55, 400.00, 130.00, true)
	GUI:Layout_setBackGroundColorType(Panel_2, 1)
	GUI:Layout_setBackGroundColor(Panel_2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(Panel_2, 0)
	GUI:setAnchorPoint(Panel_2, 0.00, 1.00)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 2069)

	-- Create img_title
	local img_title = GUI:Image_Create(Panel_2, "img_title", 217.18, -10.83, "res/custom/shouchong/img_1.png")
	GUI:setAnchorPoint(img_title, 0.50, 0.50)
	GUI:setTouchEnabled(img_title, false)
	GUI:setTag(img_title, 2070)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(img_bg, "Button_1", 491.97, 89.00, "res/custom/shouchong/btn_shouchong_04.png")
	GUI:Button_loadTexturePressed(Button_1, "res/custom/shouchong/btn_shouchong_04_1.png")
	GUI:Button_loadTextureDisabled(Button_1, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(Button_1, 15, 15, 11, 11)
	GUI:setContentSize(Button_1, 189, 53)
	GUI:setIgnoreContentAdaptWithSize(Button_1, false)
	GUI:Button_setTitleText(Button_1, "")
	GUI:Button_setTitleColor(Button_1, "#414146")
	GUI:Button_setTitleFontSize(Button_1, 14)
	GUI:Button_titleDisableOutLine(Button_1)
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setScaleX(Button_1, 0.85)
	GUI:setScaleY(Button_1, 0.85)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 460)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(img_bg, "Button_2", 491.97, 89.21, "res/custom/shouchong/btn_shouchong_05.png")
	GUI:Button_loadTexturePressed(Button_2, "res/custom/shouchong/btn_shouchong_05_1.png")
	GUI:Button_loadTextureDisabled(Button_2, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(Button_2, 15, 15, 11, 11)
	GUI:setContentSize(Button_2, 155, 51)
	GUI:setIgnoreContentAdaptWithSize(Button_2, false)
	GUI:Button_setTitleText(Button_2, "")
	GUI:Button_setTitleColor(Button_2, "#414146")
	GUI:Button_setTitleFontSize(Button_2, 14)
	GUI:Button_titleDisableOutLine(Button_2)
	GUI:setAnchorPoint(Button_2, 0.50, 0.50)
	GUI:setScaleX(Button_2, 0.85)
	GUI:setScaleY(Button_2, 0.85)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 46)

	-- Create Button_3
	local Button_3 = GUI:Image_Create(img_bg, "Button_3", 491.97, 91.18, "res/custom/common/com_txt_ylq2.png")
	GUI:setAnchorPoint(Button_3, 0.50, 0.50)
	GUI:setTouchEnabled(Button_3, false)
	GUI:setTag(Button_3, 2175)

	-- Create btn_close
	local btn_close = GUI:Button_Create(img_bg, "btn_close", 773.47, 419.68, "res/custom/common/btn_close_1_1.png")
	GUI:Button_loadTexturePressed(btn_close, "res/custom/common/btn_close_1_2.png")
	GUI:Button_loadTextureDisabled(btn_close, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(btn_close, 11, 11, 11, 11)
	GUI:setContentSize(btn_close, 26, 42)
	GUI:setIgnoreContentAdaptWithSize(btn_close, false)
	GUI:Button_setTitleText(btn_close, "")
	GUI:Button_setTitleColor(btn_close, "#414146")
	GUI:Button_setTitleFontSize(btn_close, 14)
	GUI:Button_titleDisableOutLine(btn_close)
	GUI:setAnchorPoint(btn_close, 0.50, 0.50)
	GUI:setTouchEnabled(btn_close, true)
	GUI:setTag(btn_close, 60)

	-- Create btn_day_1
	local btn_day_1 = GUI:Button_Create(img_bg, "btn_day_1", 676.33, 353.63, "res/custom/shouchong/btn_day_1_1.png")
	GUI:Button_loadTexturePressed(btn_day_1, "res/custom/shouchong/btn_day_1_2.png")
	GUI:Button_loadTextureDisabled(btn_day_1, "res/custom/shouchong/btn_day_1_2.png")
	GUI:Button_setScale9Slice(btn_day_1, 15, 15, 11, 11)
	GUI:setContentSize(btn_day_1, 132, 46)
	GUI:setIgnoreContentAdaptWithSize(btn_day_1, false)
	GUI:Button_setTitleText(btn_day_1, "")
	GUI:Button_setTitleColor(btn_day_1, "#414146")
	GUI:Button_setTitleFontSize(btn_day_1, 14)
	GUI:Button_titleDisableOutLine(btn_day_1)
	GUI:setAnchorPoint(btn_day_1, 0.50, 0.50)
	GUI:setScaleX(btn_day_1, 0.85)
	GUI:setScaleY(btn_day_1, 0.85)
	GUI:setTouchEnabled(btn_day_1, true)
	GUI:setTag(btn_day_1, 2105)

	-- Create redPonit_1
	local redPonit_1 = GUI:Image_Create(btn_day_1, "redPonit_1", 122.76, 35.88, "res/custom/common/img_2.png")
	GUI:setContentSize(redPonit_1, 24, 25)
	GUI:setIgnoreContentAdaptWithSize(redPonit_1, false)
	GUI:setAnchorPoint(redPonit_1, 0.50, 0.50)
	GUI:setTouchEnabled(redPonit_1, false)
	GUI:setTag(redPonit_1, 2176)

	-- Create btn_day_2
	local btn_day_2 = GUI:Button_Create(img_bg, "btn_day_2", 676.33, 301.70, "res/custom/shouchong/btn_day_2_1.png")
	GUI:Button_loadTexturePressed(btn_day_2, "res/custom/shouchong/btn_day_2_2.png")
	GUI:Button_loadTextureDisabled(btn_day_2, "res/custom/shouchong/btn_day_2_2.png")
	GUI:Button_setScale9Slice(btn_day_2, 15, 15, 11, 11)
	GUI:setContentSize(btn_day_2, 132, 46)
	GUI:setIgnoreContentAdaptWithSize(btn_day_2, false)
	GUI:Button_setTitleText(btn_day_2, "")
	GUI:Button_setTitleColor(btn_day_2, "#414146")
	GUI:Button_setTitleFontSize(btn_day_2, 14)
	GUI:Button_titleDisableOutLine(btn_day_2)
	GUI:setAnchorPoint(btn_day_2, 0.50, 0.50)
	GUI:setScaleX(btn_day_2, 0.85)
	GUI:setScaleY(btn_day_2, 0.85)
	GUI:setTouchEnabled(btn_day_2, true)
	GUI:setTag(btn_day_2, 2106)

	-- Create redPonit_2
	local redPonit_2 = GUI:Image_Create(btn_day_2, "redPonit_2", 122.76, 35.88, "res/custom/common/img_2.png")
	GUI:setContentSize(redPonit_2, 24, 25)
	GUI:setIgnoreContentAdaptWithSize(redPonit_2, false)
	GUI:setAnchorPoint(redPonit_2, 0.50, 0.50)
	GUI:setTouchEnabled(redPonit_2, false)
	GUI:setTag(redPonit_2, 2177)

	-- Create btn_day_3
	local btn_day_3 = GUI:Button_Create(img_bg, "btn_day_3", 676.33, 249.77, "res/custom/shouchong/btn_day_3_1.png")
	GUI:Button_loadTexturePressed(btn_day_3, "res/custom/shouchong/btn_day_3_2.png")
	GUI:Button_loadTextureDisabled(btn_day_3, "res/custom/shouchong/btn_day_3_2.png")
	GUI:Button_setScale9Slice(btn_day_3, 15, 15, 11, 11)
	GUI:setContentSize(btn_day_3, 132, 46)
	GUI:setIgnoreContentAdaptWithSize(btn_day_3, false)
	GUI:Button_setTitleText(btn_day_3, "")
	GUI:Button_setTitleColor(btn_day_3, "#414146")
	GUI:Button_setTitleFontSize(btn_day_3, 14)
	GUI:Button_titleDisableOutLine(btn_day_3)
	GUI:setAnchorPoint(btn_day_3, 0.50, 0.50)
	GUI:setScaleX(btn_day_3, 0.85)
	GUI:setScaleY(btn_day_3, 0.85)
	GUI:setTouchEnabled(btn_day_3, true)
	GUI:setTag(btn_day_3, 2107)

	-- Create redPonit_3
	local redPonit_3 = GUI:Image_Create(btn_day_3, "redPonit_3", 122.76, 35.88, "res/custom/common/img_2.png")
	GUI:setContentSize(redPonit_3, 24, 25)
	GUI:setIgnoreContentAdaptWithSize(redPonit_3, false)
	GUI:setAnchorPoint(redPonit_3, 0.50, 0.50)
	GUI:setTouchEnabled(redPonit_3, false)
	GUI:setTag(redPonit_3, 2178)

	-- Create item_list
	local item_list = GUI:ListView_Create(img_bg, "item_list", 510.93, 206.95, 450.00, 60.00, 2)
	GUI:ListView_setBackGroundColorType(item_list, 1)
	GUI:ListView_setBackGroundColor(item_list, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(item_list, 0)
	GUI:ListView_setGravity(item_list, 3)
	GUI:setAnchorPoint(item_list, 0.50, 1.00)
	GUI:setTouchEnabled(item_list, false)
	GUI:setTag(item_list, 2102)

	-- Create template
	local template = GUI:Layout_Create(item_list, "template", 0.00, 0.00, 65.00, 60.00, false)
	GUI:Layout_setBackGroundColorType(template, 1)
	GUI:Layout_setBackGroundColor(template, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(template, 0)
	GUI:setTouchEnabled(template, true)
	GUI:setTag(template, 2103)

	-- Create itemBg
	local itemBg = GUI:Image_Create(template, "itemBg", 2.00, 2.00, "res/custom/common/img_cell_1.png")
	GUI:setContentSize(itemBg, 55, 55)
	GUI:setIgnoreContentAdaptWithSize(itemBg, false)
	GUI:setTouchEnabled(itemBg, false)
	GUI:setTag(itemBg, 2104)

	-- Create texiao
	local texiao = GUI:Layout_Create(img_bg, "texiao", 3.15, 69.31, 200.00, 400.00, false)
	GUI:Layout_setBackGroundColorType(texiao, 1)
	GUI:Layout_setBackGroundColor(texiao, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(texiao, 0)
	GUI:setTouchEnabled(texiao, true)
	GUI:setTag(texiao, 2664)
end
return ui