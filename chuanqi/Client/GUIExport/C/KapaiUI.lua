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
	local img_bg = GUI:Image_Create(nd_root, "img_bg", 0.00, 0.00, "res/custom/role/shenqi_di.png")
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg, true)
	GUI:setTag(img_bg, 237)

	-- Create btn_close
	local btn_close = GUI:Button_Create(img_bg, "btn_close", 516.00, 356.00, "res/custom/common/btn_close_1_1.png")
	GUI:Button_loadTexturePressed(btn_close, "res/custom/common/btn_close_1_2.png")
	GUI:Button_setScale9Slice(btn_close, 11, 11, 11, 11)
	GUI:setContentSize(btn_close, 26, 42)
	GUI:setIgnoreContentAdaptWithSize(btn_close, false)
	GUI:Button_setTitleText(btn_close, "")
	GUI:Button_setTitleColor(btn_close, "#414146")
	GUI:Button_setTitleFontSize(btn_close, 14)
	GUI:Button_titleDisableOutLine(btn_close)
	GUI:setAnchorPoint(btn_close, 0.00, 1.00)
	GUI:setTouchEnabled(btn_close, true)
	GUI:setTag(btn_close, 238)

	-- Create nd_content
	local nd_content = GUI:Node_Create(img_bg, "nd_content", 0.00, 0.00)
	GUI:setAnchorPoint(nd_content, 0.50, 0.50)
	GUI:setTag(nd_content, 241)

	-- Create details_title
	local details_title = GUI:Image_Create(nd_content, "details_title", 258.00, 323.00, "res/custom/role/1233.png")
	GUI:Image_setScale9Slice(details_title, 44, 44, 3, 3)
	GUI:setContentSize(details_title, 344, 12)
	GUI:setIgnoreContentAdaptWithSize(details_title, false)
	GUI:setAnchorPoint(details_title, 0.50, 0.50)
	GUI:setTouchEnabled(details_title, false)
	GUI:setTag(details_title, 672)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(details_title, "Image_1", 173.00, 5.00, "res/custom/role/0123.png")
	GUI:setAnchorPoint(Image_1, 0.50, 0.50)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 41)

	-- Create kapai_1
	local kapai_1 = GUI:Image_Create(nd_content, "kapai_1", 66.00, 259.00, "res/custom/kapai/107283.png")
	GUI:setContentSize(kapai_1, 61.200000762939, 89.199996948242)
	GUI:setIgnoreContentAdaptWithSize(kapai_1, false)
	GUI:setAnchorPoint(kapai_1, 0.50, 0.50)
	GUI:setTouchEnabled(kapai_1, false)
	GUI:setTag(kapai_1, 138)

	-- Create item_1
	local item_1 = GUI:Layout_Create(kapai_1, "item_1", 0.00, 0.00, 61.20, 89.20, false)
	GUI:Layout_setBackGroundColorType(item_1, 1)
	GUI:Layout_setBackGroundColor(item_1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(item_1, 0)
	GUI:setTouchEnabled(item_1, true)
	GUI:setTag(item_1, 1491)

	-- Create kapai_2
	local kapai_2 = GUI:Image_Create(nd_content, "kapai_2", 194.00, 259.00, "res/custom/kapai/107284.png")
	GUI:setContentSize(kapai_2, 61.200000762939, 89.199996948242)
	GUI:setIgnoreContentAdaptWithSize(kapai_2, false)
	GUI:setAnchorPoint(kapai_2, 0.50, 0.50)
	GUI:setTouchEnabled(kapai_2, false)
	GUI:setTag(kapai_2, 140)

	-- Create item_2
	local item_2 = GUI:Layout_Create(kapai_2, "item_2", 0.00, 0.00, 61.20, 89.20, false)
	GUI:Layout_setBackGroundColorType(item_2, 1)
	GUI:Layout_setBackGroundColor(item_2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(item_2, 0)
	GUI:setTouchEnabled(item_2, true)
	GUI:setTag(item_2, 1492)

	-- Create kapai_3
	local kapai_3 = GUI:Image_Create(nd_content, "kapai_3", 322.00, 259.00, "res/custom/kapai/107285.png")
	GUI:setContentSize(kapai_3, 61.200000762939, 89.199996948242)
	GUI:setIgnoreContentAdaptWithSize(kapai_3, false)
	GUI:setAnchorPoint(kapai_3, 0.50, 0.50)
	GUI:setTouchEnabled(kapai_3, false)
	GUI:setTag(kapai_3, 142)

	-- Create item_3
	local item_3 = GUI:Layout_Create(kapai_3, "item_3", 0.00, 0.00, 61.20, 89.20, false)
	GUI:Layout_setBackGroundColorType(item_3, 1)
	GUI:Layout_setBackGroundColor(item_3, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(item_3, 0)
	GUI:setTouchEnabled(item_3, true)
	GUI:setTag(item_3, 1493)

	-- Create kapai_4
	local kapai_4 = GUI:Image_Create(nd_content, "kapai_4", 450.00, 259.00, "res/custom/kapai/107286.png")
	GUI:setContentSize(kapai_4, 61.200000762939, 89.199996948242)
	GUI:setIgnoreContentAdaptWithSize(kapai_4, false)
	GUI:setAnchorPoint(kapai_4, 0.50, 0.50)
	GUI:setTouchEnabled(kapai_4, false)
	GUI:setTag(kapai_4, 143)

	-- Create item_4
	local item_4 = GUI:Layout_Create(kapai_4, "item_4", 0.00, 0.00, 61.20, 89.20, false)
	GUI:Layout_setBackGroundColorType(item_4, 1)
	GUI:Layout_setBackGroundColor(item_4, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(item_4, 0)
	GUI:setRotation(item_4, 0.49)
	GUI:setRotationSkewX(item_4, 0.49)
	GUI:setRotationSkewY(item_4, 0.49)
	GUI:setTouchEnabled(item_4, true)
	GUI:setTag(item_4, 1494)

	-- Create kapai_5
	local kapai_5 = GUI:Image_Create(nd_content, "kapai_5", 66.00, 165.00, "res/custom/kapai/107287.png")
	GUI:setContentSize(kapai_5, 61.200000762939, 89.199996948242)
	GUI:setIgnoreContentAdaptWithSize(kapai_5, false)
	GUI:setAnchorPoint(kapai_5, 0.50, 0.50)
	GUI:setTouchEnabled(kapai_5, false)
	GUI:setTag(kapai_5, 139)

	-- Create item_5
	local item_5 = GUI:Layout_Create(kapai_5, "item_5", 0.00, 0.00, 61.20, 89.20, false)
	GUI:Layout_setBackGroundColorType(item_5, 1)
	GUI:Layout_setBackGroundColor(item_5, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(item_5, 0)
	GUI:setTouchEnabled(item_5, true)
	GUI:setTag(item_5, 1504)

	-- Create kapai_6
	local kapai_6 = GUI:Image_Create(nd_content, "kapai_6", 194.00, 165.00, "res/custom/kapai/107288.png")
	GUI:setContentSize(kapai_6, 61.200000762939, 89.199996948242)
	GUI:setIgnoreContentAdaptWithSize(kapai_6, false)
	GUI:setAnchorPoint(kapai_6, 0.50, 0.50)
	GUI:setTouchEnabled(kapai_6, false)
	GUI:setTag(kapai_6, 144)

	-- Create item_6
	local item_6 = GUI:Layout_Create(kapai_6, "item_6", 0.00, 0.00, 61.20, 89.20, false)
	GUI:Layout_setBackGroundColorType(item_6, 1)
	GUI:Layout_setBackGroundColor(item_6, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(item_6, 0)
	GUI:setTouchEnabled(item_6, true)
	GUI:setTag(item_6, 1505)

	-- Create kapai_7
	local kapai_7 = GUI:Image_Create(nd_content, "kapai_7", 322.00, 165.00, "res/custom/kapai/107289.png")
	GUI:setContentSize(kapai_7, 61.200000762939, 89.199996948242)
	GUI:setIgnoreContentAdaptWithSize(kapai_7, false)
	GUI:setAnchorPoint(kapai_7, 0.50, 0.50)
	GUI:setTouchEnabled(kapai_7, false)
	GUI:setTag(kapai_7, 145)

	-- Create item_7
	local item_7 = GUI:Layout_Create(kapai_7, "item_7", 0.00, 0.00, 61.20, 89.20, false)
	GUI:Layout_setBackGroundColorType(item_7, 1)
	GUI:Layout_setBackGroundColor(item_7, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(item_7, 0)
	GUI:setTouchEnabled(item_7, true)
	GUI:setTag(item_7, 1506)

	-- Create kapai_8
	local kapai_8 = GUI:Image_Create(nd_content, "kapai_8", 450.00, 165.00, "res/custom/kapai/107290.png")
	GUI:setContentSize(kapai_8, 61.200000762939, 89.199996948242)
	GUI:setIgnoreContentAdaptWithSize(kapai_8, false)
	GUI:setAnchorPoint(kapai_8, 0.50, 0.50)
	GUI:setTouchEnabled(kapai_8, false)
	GUI:setTag(kapai_8, 146)

	-- Create item_8
	local item_8 = GUI:Layout_Create(kapai_8, "item_8", 0.00, 0.00, 61.20, 89.20, false)
	GUI:Layout_setBackGroundColorType(item_8, 1)
	GUI:Layout_setBackGroundColor(item_8, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(item_8, 0)
	GUI:setRotation(item_8, 0.49)
	GUI:setRotationSkewX(item_8, 0.49)
	GUI:setRotationSkewY(item_8, 0.49)
	GUI:setTouchEnabled(item_8, true)
	GUI:setTag(item_8, 1507)

	-- Create kapai_9
	local kapai_9 = GUI:Image_Create(nd_content, "kapai_9", 66.00, 71.00, "res/custom/kapai/107291.png")
	GUI:setContentSize(kapai_9, 61.200000762939, 89.199996948242)
	GUI:setIgnoreContentAdaptWithSize(kapai_9, false)
	GUI:setAnchorPoint(kapai_9, 0.50, 0.50)
	GUI:setTouchEnabled(kapai_9, false)
	GUI:setTag(kapai_9, 141)

	-- Create item_9
	local item_9 = GUI:Layout_Create(kapai_9, "item_9", 0.00, 0.00, 61.20, 89.20, false)
	GUI:Layout_setBackGroundColorType(item_9, 1)
	GUI:Layout_setBackGroundColor(item_9, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(item_9, 0)
	GUI:setTouchEnabled(item_9, true)
	GUI:setTag(item_9, 1508)

	-- Create kapai_10
	local kapai_10 = GUI:Image_Create(nd_content, "kapai_10", 194.00, 71.00, "res/custom/kapai/107292.png")
	GUI:setContentSize(kapai_10, 61.200000762939, 89.199996948242)
	GUI:setIgnoreContentAdaptWithSize(kapai_10, false)
	GUI:setAnchorPoint(kapai_10, 0.50, 0.50)
	GUI:setTouchEnabled(kapai_10, false)
	GUI:setTag(kapai_10, 147)

	-- Create item_10
	local item_10 = GUI:Layout_Create(kapai_10, "item_10", 0.00, 0.00, 61.20, 89.20, false)
	GUI:Layout_setBackGroundColorType(item_10, 1)
	GUI:Layout_setBackGroundColor(item_10, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(item_10, 0)
	GUI:setTouchEnabled(item_10, true)
	GUI:setTag(item_10, 1509)

	-- Create kapai_11
	local kapai_11 = GUI:Image_Create(nd_content, "kapai_11", 322.00, 71.00, "res/custom/kapai/107293.png")
	GUI:setContentSize(kapai_11, 61.200000762939, 89.199996948242)
	GUI:setIgnoreContentAdaptWithSize(kapai_11, false)
	GUI:setAnchorPoint(kapai_11, 0.50, 0.50)
	GUI:setTouchEnabled(kapai_11, false)
	GUI:setTag(kapai_11, 148)

	-- Create item_11
	local item_11 = GUI:Layout_Create(kapai_11, "item_11", 0.00, 0.00, 61.20, 89.20, false)
	GUI:Layout_setBackGroundColorType(item_11, 1)
	GUI:Layout_setBackGroundColor(item_11, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(item_11, 0)
	GUI:setTouchEnabled(item_11, true)
	GUI:setTag(item_11, 1510)

	-- Create kapai_12
	local kapai_12 = GUI:Image_Create(nd_content, "kapai_12", 450.00, 71.00, "res/custom/kapai/107294.png")
	GUI:setContentSize(kapai_12, 61.200000762939, 89.199996948242)
	GUI:setIgnoreContentAdaptWithSize(kapai_12, false)
	GUI:setAnchorPoint(kapai_12, 0.50, 0.50)
	GUI:setTouchEnabled(kapai_12, false)
	GUI:setTag(kapai_12, 149)

	-- Create item_12
	local item_12 = GUI:Layout_Create(kapai_12, "item_12", 0.00, 0.00, 61.20, 89.20, false)
	GUI:Layout_setBackGroundColorType(item_12, 1)
	GUI:Layout_setBackGroundColor(item_12, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(item_12, 0)
	GUI:setRotation(item_12, 0.49)
	GUI:setRotationSkewX(item_12, 0.49)
	GUI:setRotationSkewY(item_12, 0.49)
	GUI:setTouchEnabled(item_12, true)
	GUI:setTag(item_12, 1511)
end
return ui