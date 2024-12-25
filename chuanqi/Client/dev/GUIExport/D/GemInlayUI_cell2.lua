local ui = {}
function ui.init(parent)
	-- Create template
	local template = GUI:Image_Create(parent, "template", 32.00, 32.00, "res/custom/common/img_cell_1.png")
	GUI:setAnchorPoint(template, 0.50, 0.50)
	GUI:setTouchEnabled(template, true)
	GUI:setTag(template, 61)

	-- Create img_gou
	local img_gou = GUI:Image_Create(template, "img_gou", 0.00, 0.00, "res/custom/common/img_cell_2.png")
	GUI:Image_setScale9Slice(img_gou, 21, 21, 21, 21)
	GUI:setContentSize(img_gou, 64, 64)
	GUI:setIgnoreContentAdaptWithSize(img_gou, false)
	GUI:setTouchEnabled(img_gou, false)
	GUI:setTag(img_gou, 208)

	-- Create img_red_point
	local img_red_point = GUI:Image_Create(template, "img_red_point", 64.00, 64.00, "res/custom/common/img_2.png")
	GUI:setAnchorPoint(img_red_point, 1.00, 1.00)
	GUI:setScaleX(img_red_point, 0.80)
	GUI:setScaleY(img_red_point, 0.80)
	GUI:setTouchEnabled(img_red_point, false)
	GUI:setTag(img_red_point, 85)
end
return ui