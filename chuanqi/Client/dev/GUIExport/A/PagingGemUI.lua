local ui = {}
function ui.init(parent)
	-- Create Page_Layer
	local Page_Layer = GUI:Node_Create(parent, "Page_Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Page_Layer, 0.50, 0.50)
	GUI:setTag(Page_Layer, -1)

	-- Create la_bg
	local la_bg = GUI:Layout_Create(Page_Layer, "la_bg", 0.00, 0.00, 1136.00, 640.00, false)
	GUI:Layout_setBackGroundColorType(la_bg, 1)
	GUI:Layout_setBackGroundColor(la_bg, "#000000")
	GUI:Layout_setBackGroundColorOpacity(la_bg, 102)
	GUI:setTouchEnabled(la_bg, true)
	GUI:setTag(la_bg, 451)

	-- Create bg_close
	local bg_close = GUI:Image_Create(Page_Layer, "bg_close", 0.00, 0.00, "res/custom/common/bg_main_6.png")
	GUI:setContentSize(bg_close, 1136, 640)
	GUI:setIgnoreContentAdaptWithSize(bg_close, false)
	GUI:setOpacity(bg_close, 0)
	GUI:setTouchEnabled(bg_close, true)
	GUI:setTag(bg_close, 695)

	-- Create btn_template
	local btn_template = GUI:Button_Create(Page_Layer, "btn_template", 1142.00, 621.00, "res/custom/common/btn_1_1.png")
	GUI:Button_loadTexturePressed(btn_template, "res/custom/common/btn_1_1.png")
	GUI:Button_loadTextureDisabled(btn_template, "res/custom/common/btn_1_2.png")
	GUI:Button_setTitleText(btn_template, "")
	GUI:Button_setTitleColor(btn_template, "#7b7373")
	GUI:Button_setTitleFontSize(btn_template, 18)
	GUI:Button_titleEnableOutline(btn_template, "#000000", 1)
	GUI:setAnchorPoint(btn_template, 0.00, 0.50)
	GUI:setTouchEnabled(btn_template, true)
	GUI:setTag(btn_template, 704)

	-- Create img_red_point
	local img_red_point = GUI:Image_Create(btn_template, "img_red_point", 25.00, 93.00, "res/custom/common/img_2.png")
	GUI:setAnchorPoint(img_red_point, 0.50, 0.50)
	GUI:setTouchEnabled(img_red_point, false)
	GUI:setTag(img_red_point, 450)

	-- Create Text
	local Text = GUI:Text_Create(btn_template, "Text", 13.00, 60.00, 16, "#ffffff", [[文
本]])
	GUI:setAnchorPoint(Text, 0.50, 0.50)
	GUI:setTouchEnabled(Text, false)
	GUI:setTag(Text, -1)
	GUI:Text_enableOutline(Text, "#000000", 1)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Page_Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 443)

	-- Create img_bg
	local img_bg = GUI:Image_Create(nd_root, "img_bg", -76.00, -2.00, "res/custom/common/img_bg_1.png")
	GUI:setAnchorPoint(img_bg, 0.40, 0.50)
	GUI:setTouchEnabled(img_bg, true)
	GUI:setTag(img_bg, 444)

	-- Create nd_module
	local nd_module = GUI:Node_Create(img_bg, "nd_module", 435.00, 280.00)
	GUI:setAnchorPoint(nd_module, 0.50, 0.50)
	GUI:setTag(nd_module, 93)

	-- Create tx_title
	local tx_title = GUI:Text_Create(img_bg, "tx_title", 85.00, 498.00, 20, "#d6c6ad", [[标题]])
	GUI:setAnchorPoint(tx_title, 0.00, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 445)
	GUI:Text_enableOutline(tx_title, "#000000", 3)

	-- Create btn_close
	local btn_close = GUI:Button_Create(img_bg, "btn_close", 840.00, 501.00, "res/custom/common/btn_close_1_1.png")
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
	GUI:setTag(btn_close, 446)

	-- Create ListView
	local ListView = GUI:ListView_Create(img_bg, "ListView", 828.00, 28.00, 82.00, 450.00, 1)
	GUI:ListView_setBackGroundColorType(ListView, 1)
	GUI:ListView_setBackGroundColor(ListView, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView, 0)
	GUI:ListView_setGravity(ListView, 5)
	GUI:setTouchEnabled(ListView, true)
	GUI:setTag(ListView, -1)
end
return ui