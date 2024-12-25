local ui = {}
function ui.init(parent)
	-- Create template
	local template = GUI:Layout_Create(parent, "template", 0.00, 0.00, 269.00, 64.00, true)
	GUI:Layout_setBackGroundColorType(template, 1)
	GUI:Layout_setBackGroundColor(template, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(template, 0)
	GUI:setTouchEnabled(template, true)
	GUI:setTag(template, 70)

	-- Create img_cell_1
	local img_cell_1 = GUI:Image_Create(template, "img_cell_1", 0.00, 32.00, "res/custom/common/img_cell_1.png")
	GUI:setAnchorPoint(img_cell_1, 0.00, 0.50)
	GUI:setTouchEnabled(img_cell_1, true)
	GUI:setTag(img_cell_1, 69)

	-- Create img_cell_2
	local img_cell_2 = GUI:Image_Create(template, "img_cell_2", 100.00, 32.00, "res/custom/common/img_cell_1.png")
	GUI:setAnchorPoint(img_cell_2, 0.50, 0.50)
	GUI:setTouchEnabled(img_cell_2, true)
	GUI:setTag(img_cell_2, 71)

	-- Create img_cell_3
	local img_cell_3 = GUI:Image_Create(template, "img_cell_3", 168.00, 32.00, "res/custom/common/img_cell_1.png")
	GUI:setAnchorPoint(img_cell_3, 0.50, 0.50)
	GUI:setTouchEnabled(img_cell_3, true)
	GUI:setTag(img_cell_3, 72)

	-- Create img_cell_4
	local img_cell_4 = GUI:Image_Create(template, "img_cell_4", 269.00, 32.00, "res/custom/common/img_cell_1.png")
	GUI:setAnchorPoint(img_cell_4, 1.00, 0.50)
	GUI:setTouchEnabled(img_cell_4, true)
	GUI:setTag(img_cell_4, 73)
end
return ui