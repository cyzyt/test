local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	-- GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create la_bg
	local la_bg = GUI:Layout_Create(Layer, "la_bg", 0.65, -3.36, 1136.00, 640.00, false)
	GUI:Layout_setBackGroundColorType(la_bg, 1)
	GUI:Layout_setBackGroundColor(la_bg, "#000000")
	GUI:Layout_setBackGroundColorOpacity(la_bg, 102)
	GUI:setTouchEnabled(la_bg, true)
	GUI:setTag(la_bg, 89)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 11)

	-- Create img_bg
	local img_bg = GUI:Image_Create(nd_root, "img_bg", 0.00, 56.00, "res/custom/Die/img_di.png")
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg, false)
	GUI:setTag(img_bg, 12)

	-- Create btn_back_revive
	local btn_back_revive = GUI:Button_Create(img_bg, "btn_back_revive", 165.00, 41.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(btn_back_revive, "res/custom/common/btn_2_2.png")
	GUI:Button_loadTextureDisabled(btn_back_revive, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(btn_back_revive, 15, 15, 11, 11)
	GUI:setContentSize(btn_back_revive, 122, 34)
	GUI:setIgnoreContentAdaptWithSize(btn_back_revive, false)
	GUI:Button_setTitleText(btn_back_revive, "")
	GUI:Button_setTitleColor(btn_back_revive, "#42311c")
	GUI:Button_setTitleFontSize(btn_back_revive, 19)
	GUI:Button_titleEnableOutline(btn_back_revive, "#000000", 1)
	GUI:setAnchorPoint(btn_back_revive, 0.50, 0.50)
	GUI:setTouchEnabled(btn_back_revive, true)
	GUI:setTag(btn_back_revive, 1708)

	-- Create tx_back_revive
	local tx_back_revive = GUI:Text_Create(btn_back_revive, "tx_back_revive", 61.00, 18.54, 18, "#c0c0c0", [[复活]])
	GUI:setAnchorPoint(tx_back_revive, 0.50, 0.50)
	GUI:setTouchEnabled(tx_back_revive, false)
	GUI:setTag(tx_back_revive, 42)
	GUI:Text_enableOutline(tx_back_revive, "#000000", 1)

	-- Create btn_situ_revive
	local btn_situ_revive = GUI:Button_Create(img_bg, "btn_situ_revive", 228.00, 40.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(btn_situ_revive, "res/custom/common/btn_2_2.png")
	GUI:Button_loadTextureDisabled(btn_situ_revive, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(btn_situ_revive, 15, 15, 11, 11)
	GUI:setContentSize(btn_situ_revive, 122, 34)
	GUI:setIgnoreContentAdaptWithSize(btn_situ_revive, false)
	GUI:Button_setTitleText(btn_situ_revive, "")
	GUI:Button_setTitleColor(btn_situ_revive, "#42311c")
	GUI:Button_setTitleFontSize(btn_situ_revive, 19)
	GUI:Button_titleEnableOutline(btn_situ_revive, "#000000", 1)
	GUI:setAnchorPoint(btn_situ_revive, 0.50, 0.50)
	GUI:setTouchEnabled(btn_situ_revive, true)
	GUI:setTag(btn_situ_revive, 2664)
	GUI:setVisible(btn_situ_revive, false)

	-- Create tx_situ_revive
	local tx_situ_revive = GUI:Text_Create(btn_situ_revive, "tx_situ_revive", 60.37, 17.30, 18, "#c0c0c0", [[原地复活]])
	GUI:setAnchorPoint(tx_situ_revive, 0.50, 0.50)
	GUI:setTouchEnabled(tx_situ_revive, false)
	GUI:setTag(tx_situ_revive, 316)
	GUI:Text_enableOutline(tx_situ_revive, "#000000", 1)

	-- Create nd_ricktext_pos
	local nd_ricktext_pos = GUI:Node_Create(img_bg, "nd_ricktext_pos", 162.00, 114.33)
	GUI:setAnchorPoint(nd_ricktext_pos, 0.50, 0.50)
	GUI:setTag(nd_ricktext_pos, 2665)

	-- Create tx_auto_revive
	local tx_auto_revive = GUI:Text_Create(img_bg, "tx_auto_revive", 165.00, 68.00, 16, "#ffffff", [[自动复活：11]])
	GUI:setAnchorPoint(tx_auto_revive, 0.50, 0.50)
	GUI:setTouchEnabled(tx_auto_revive, false)
	GUI:setTag(tx_auto_revive, 9)
	GUI:Text_enableOutline(tx_auto_revive, "#000000", 1)

	-- Create tx_free
	local tx_free = GUI:Text_Create(img_bg, "tx_free", 164.00, 14.00, 16, "#ffffff", [[免费]])
	GUI:setAnchorPoint(tx_free, 0.50, 0.50)
	GUI:setTouchEnabled(tx_free, false)
	GUI:setTag(tx_free, 10)
	GUI:Text_enableOutline(tx_free, "#000000", 1)

	-- Create tx_pay_revive
	local tx_pay_revive = GUI:Text_Create(img_bg, "tx_pay_revive", 233.00, 14.00, 16, "#ffffff", [[消耗200灵符]])
	GUI:setAnchorPoint(tx_pay_revive, 0.50, 0.50)
	GUI:setTouchEnabled(tx_pay_revive, false)
	GUI:setTag(tx_pay_revive, 11)
	GUI:setVisible(tx_pay_revive, false)
	GUI:Text_enableOutline(tx_pay_revive, "#000000", 1)

	-- Create tx_can_revive_count
	local tx_can_revive_count = GUI:Text_Create(img_bg, "tx_can_revive_count", 228.00, 14.00, 16, "#ffffff", [[可复活次数：1]])
	GUI:setAnchorPoint(tx_can_revive_count, 0.50, 0.50)
	GUI:setTouchEnabled(tx_can_revive_count, false)
	GUI:setTag(tx_can_revive_count, 12)
	GUI:setVisible(tx_can_revive_count, false)
	GUI:Text_enableOutline(tx_can_revive_count, "#000000", 1)

	-- Create nd_revive
	local nd_revive = GUI:Node_Create(nd_root, "nd_revive", -2.00, -131.00)
	GUI:setAnchorPoint(nd_revive, 0.50, 0.50)
	GUI:setTag(nd_revive, 156)
end
return ui