local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create la_bg
	local la_bg = GUI:Layout_Create(Layer, "la_bg", 0.00, 0.00, 1136.00, 640.00, false)
	GUI:setTouchEnabled(la_bg, true)
	GUI:setTag(la_bg, 19)

	-- Create img_tips_di
	local img_tips_di = GUI:Image_Create(la_bg, "img_tips_di", 487.08, 293.22, "res/custom/common/img_bg_2.png")
	GUI:Image_setScale9Slice(img_tips_di, 21, 21, 33, 33)
	GUI:setContentSize(img_tips_di, 65, 100)
	GUI:setIgnoreContentAdaptWithSize(img_tips_di, false)
	GUI:setAnchorPoint(img_tips_di, 0.50, 0.50)
	GUI:setTouchEnabled(img_tips_di, false)
	GUI:setTag(img_tips_di, 160)
end
return ui