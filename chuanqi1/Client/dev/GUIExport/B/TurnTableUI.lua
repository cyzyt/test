local ui = {}
function ui.init(parent)
	-- Create Node
	local Node = GUI:Node_Create(parent, "Node", 0.00, 0.00)
	GUI:setTag(Node, -1)

	-- Create Layout
	local Layout = GUI:Layout_Create(Node, "Layout", 1.00, -0.00, 1136.00, 640.00, false)
	GUI:Layout_setBackGroundColorType(Layout, 1)
	GUI:Layout_setBackGroundColor(Layout, "#000000")
	GUI:Layout_setBackGroundColorOpacity(Layout, 73)
	GUI:setOpacity(Layout, 114)
	GUI:setTouchEnabled(Layout, false)
	GUI:setTag(Layout, -1)

	-- Create Nd_turntable
	local Nd_turntable = GUI:Node_Create(Node, "Nd_turntable", 0.00, 0.00)
	GUI:setTag(Nd_turntable, -1)

	-- Create Img_turntable
	local Img_turntable = GUI:Image_Create(Nd_turntable, "Img_turntable", 559.00, 301.00, "res/private/login/icon/45.png")
	GUI:setAnchorPoint(Img_turntable, 0.50, 0.50)
	GUI:setTouchEnabled(Img_turntable, false)
	GUI:setTag(Img_turntable, -1)

	-- Create Img_sprround
	local Img_sprround = GUI:Image_Create(Nd_turntable, "Img_sprround", 499.00, 247.00, "res/private/login/icon/111.png")
	GUI:setContentSize(Img_sprround, 115, 135)
	GUI:setIgnoreContentAdaptWithSize(Img_sprround, false)
	GUI:setTouchEnabled(Img_sprround, false)
	GUI:setTag(Img_sprround, -1)

	-- Create Btn_close
	local Btn_close = GUI:Button_Create(Nd_turntable, "Btn_close", 671.00, 442.00, "res/private/login/icon/234.png")
	GUI:Button_loadTexturePressed(Btn_close, "res/private/login/icon/105 (2).png")
	GUI:setContentSize(Btn_close, 60, 60)
	GUI:setIgnoreContentAdaptWithSize(Btn_close, false)
	GUI:Button_setTitleText(Btn_close, "")
	GUI:Button_setTitleColor(Btn_close, "#ffffff")
	GUI:Button_setTitleFontSize(Btn_close, 14)
	GUI:Button_titleEnableOutline(Btn_close, "#000000", 1)
	GUI:setTouchEnabled(Btn_close, true)
	GUI:setTag(Btn_close, -1)

	-- Create Btn_reset
	local Btn_reset = GUI:Button_Create(Nd_turntable, "Btn_reset", 730.00, 353.00, "res/private/login/icon/324.png")
	GUI:Button_setTitleText(Btn_reset, "")
	GUI:Button_setTitleColor(Btn_reset, "#ffffff")
	GUI:Button_setTitleFontSize(Btn_reset, 14)
	GUI:Button_titleEnableOutline(Btn_reset, "#000000", 1)
	GUI:setTouchEnabled(Btn_reset, true)
	GUI:setTag(Btn_reset, -1)

	-- Create Btn_start
	local Btn_start = GUI:Button_Create(Nd_turntable, "Btn_start", 523.00, 267.00, "res/private/login/icon/69.png")
	GUI:setContentSize(Btn_start, 70, 70)
	GUI:setIgnoreContentAdaptWithSize(Btn_start, false)
	GUI:Button_setTitleText(Btn_start, "")
	GUI:Button_setTitleColor(Btn_start, "#ffffff")
	GUI:Button_setTitleFontSize(Btn_start, 14)
	GUI:Button_titleEnableOutline(Btn_start, "#000000", 1)
	GUI:setTouchEnabled(Btn_start, true)
	GUI:setTag(Btn_start, -1)
end
return ui