local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create nd_card
	local nd_card = GUI:Node_Create(Layer, "nd_card", 568.00, 320.00)
	GUI:setAnchorPoint(nd_card, 0.50, 0.50)
	GUI:setTag(nd_card, 831)

	-- Create img_bg
	local img_bg = GUI:Image_Create(nd_card, "img_bg", 11.00, -33.00, "res/custom/zhigou/img_bg.jpg")
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg, false)
	GUI:setTag(img_bg, 770)

	-- Create img_1
	local img_1 = GUI:Image_Create(img_bg, "img_1", 174.00, 392.00, "res/custom/zhigou/img_title.png")
	GUI:setAnchorPoint(img_1, 0.50, 0.50)
	GUI:setTouchEnabled(img_1, false)
	GUI:setTag(img_1, 253)

	-- Create template_1
	local template_1 = GUI:Layout_Create(img_bg, "template_1", 0.00, 0.00, 82.00, 100.00, false)
	GUI:setTouchEnabled(template_1, true)
	GUI:setTag(template_1, 896)
	GUI:setVisible(template_1, false)

	-- Create title_bg
	local title_bg = GUI:Image_Create(template_1, "title_bg", 41.00, 86.00, "res/custom/zhigou/11.png")
	GUI:setAnchorPoint(title_bg, 0.50, 0.50)
	GUI:setTouchEnabled(title_bg, false)
	GUI:setTag(title_bg, 898)

	-- Create tx_title
	local tx_title = GUI:Text_Create(template_1, "tx_title", 41.00, 86.00, 16, "#e1bd70", [[累计1天]])
	GUI:setAnchorPoint(tx_title, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 782)
	GUI:Text_enableOutline(tx_title, "#000000", 1)

	-- Create item_bg
	local item_bg = GUI:Image_Create(template_1, "item_bg", 41.00, 38.00, "res/custom/zhigou/3.png")
	GUI:setAnchorPoint(item_bg, 0.50, 0.50)
	GUI:setTouchEnabled(item_bg, false)
	GUI:setTag(item_bg, 254)

	-- Create img_mask
	local img_mask = GUI:Layout_Create(template_1, "img_mask", 41.00, 50.00, 82.00, 100.00, false)
	GUI:Layout_setBackGroundColorType(img_mask, 1)
	GUI:Layout_setBackGroundColor(img_mask, "#000000")
	GUI:Layout_setBackGroundColorOpacity(img_mask, 76)
	GUI:setAnchorPoint(img_mask, 0.50, 0.50)
	GUI:setOpacity(img_mask, 0)
	GUI:setTouchEnabled(img_mask, true)
	GUI:setTag(img_mask, 851)

	-- Create img_isget
	local img_isget = GUI:Image_Create(template_1, "img_isget", 41.00, 16.00, "res/custom/common/com_txt_ylq.png")
	GUI:setAnchorPoint(img_isget, 0.50, 0.50)
	GUI:setTouchEnabled(img_isget, false)
	GUI:setTag(img_isget, 849)

	-- Create img_red
	local img_red = GUI:Image_Create(template_1, "img_red", 59.00, 56.00, "res/custom/common/img_2.png")
	GUI:setAnchorPoint(img_red, 0.50, 0.50)
	GUI:setTouchEnabled(img_red, false)
	GUI:setTag(img_red, 340)

	-- Create template_2
	local template_2 = GUI:Layout_Create(img_bg, "template_2", 0.00, 280.00, 190.00, 280.00, false)
	GUI:Layout_setBackGroundColorType(template_2, 1)
	GUI:Layout_setBackGroundColor(template_2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(template_2, 0)
	GUI:setAnchorPoint(template_2, 0.00, 1.00)
	GUI:setTouchEnabled(template_2, true)
	GUI:setTag(template_2, 352)
	GUI:setVisible(template_2, false)

	-- Create bg_kuang1
	local bg_kuang1 = GUI:Image_Create(template_2, "bg_kuang1", 95.00, 161.00, "res/custom/zhigou/13.png")
	GUI:setAnchorPoint(bg_kuang1, 0.50, 0.50)
	GUI:setTouchEnabled(bg_kuang1, true)
	GUI:setTag(bg_kuang1, 356)

	-- Create title
	local title = GUI:Text_Create(template_2, "title", 95.00, 212.00, 16, "#ffffff", [[免费礼包]])
	GUI:setAnchorPoint(title, 0.50, 0.50)
	GUI:setTouchEnabled(title, false)
	GUI:setTag(title, 357)
	GUI:Text_enableOutline(title, "#000000", 1)

	-- Create item_bg_1
	local item_bg_1 = GUI:Image_Create(template_2, "item_bg_1", 62.00, 159.00, "res/custom/zhigou/16.png")
	GUI:setAnchorPoint(item_bg_1, 0.50, 0.50)
	GUI:setTouchEnabled(item_bg_1, false)
	GUI:setTag(item_bg_1, 335)

	-- Create item_bg_2
	local item_bg_2 = GUI:Image_Create(template_2, "item_bg_2", 126.00, 159.00, "res/custom/zhigou/16.png")
	GUI:setAnchorPoint(item_bg_2, 0.50, 0.50)
	GUI:setTouchEnabled(item_bg_2, false)
	GUI:setTag(item_bg_2, 336)

	-- Create item_bg_3
	local item_bg_3 = GUI:Image_Create(template_2, "item_bg_3", 62.00, 102.00, "res/custom/zhigou/16.png")
	GUI:setAnchorPoint(item_bg_3, 0.50, 0.50)
	GUI:setTouchEnabled(item_bg_3, false)
	GUI:setTag(item_bg_3, 337)

	-- Create item_bg_4
	local item_bg_4 = GUI:Image_Create(template_2, "item_bg_4", 126.00, 102.00, "res/custom/zhigou/16.png")
	GUI:setAnchorPoint(item_bg_4, 0.50, 0.50)
	GUI:setTouchEnabled(item_bg_4, false)
	GUI:setTag(item_bg_4, 338)

	-- Create btn_go
	local btn_go = GUI:Button_Create(template_2, "btn_go", 95.00, 26.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(btn_go, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(btn_go, 15, 15, 11, 11)
	GUI:setContentSize(btn_go, 110, 36)
	GUI:setIgnoreContentAdaptWithSize(btn_go, false)
	GUI:Button_setTitleText(btn_go, "")
	GUI:Button_setTitleColor(btn_go, "#414146")
	GUI:Button_setTitleFontSize(btn_go, 14)
	GUI:Button_titleDisableOutLine(btn_go)
	GUI:setAnchorPoint(btn_go, 0.50, 0.50)
	GUI:setTouchEnabled(btn_go, true)
	GUI:setTag(btn_go, 353)

	-- Create tx_btn
	local tx_btn = GUI:Text_Create(btn_go, "tx_btn", 55.00, 18.00, 18, "#ffffb7", [[立即领取]])
	GUI:setAnchorPoint(tx_btn, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn, false)
	GUI:setTag(tx_btn, 354)
	GUI:Text_enableOutline(tx_btn, "#000000", 1)

	-- Create img_red
	local img_red = GUI:Image_Create(btn_go, "img_red", 107.00, 28.00, "res/custom/common/img_2.png")
	GUI:setContentSize(img_red, 24, 25)
	GUI:setIgnoreContentAdaptWithSize(img_red, false)
	GUI:setAnchorPoint(img_red, 0.50, 0.50)
	GUI:setScaleX(img_red, 0.80)
	GUI:setScaleY(img_red, 0.80)
	GUI:setTouchEnabled(img_red, false)
	GUI:setTag(img_red, 355)

	-- Create lj_ListView
	local lj_ListView = GUI:ListView_Create(img_bg, "lj_ListView", 188.00, 392.00, 510.00, 100.00, 2)
	GUI:ListView_setGravity(lj_ListView, 5)
	GUI:ListView_setItemsMargin(lj_ListView, 2)
	GUI:setAnchorPoint(lj_ListView, 0.00, 0.50)
	GUI:setTouchEnabled(lj_ListView, true)
	GUI:setTag(lj_ListView, 773)

	-- Create mr_ListView
	local mr_ListView = GUI:ListView_Create(img_bg, "mr_ListView", 160.00, 279.00, 570.00, 280.00, 2)
	GUI:ListView_setBackGroundColorType(mr_ListView, 1)
	GUI:ListView_setBackGroundColor(mr_ListView, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(mr_ListView, 0)
	GUI:ListView_setGravity(mr_ListView, 3)
	GUI:setAnchorPoint(mr_ListView, 0.00, 1.00)
	GUI:setTouchEnabled(mr_ListView, true)
	GUI:setTag(mr_ListView, 339)

	-- Create Node_2
	local Node_2 = GUI:Node_Create(img_bg, "Node_2", 158.00, 298.00)
	GUI:setAnchorPoint(Node_2, 0.50, 0.50)
	GUI:setTag(Node_2, 1227)

	-- Create Image_22
	local Image_22 = GUI:Image_Create(Node_2, "Image_22", 100.00, 24.00, "res/custom/zhigou/img_num_bg.png")
	GUI:setAnchorPoint(Image_22, 0.50, 0.50)
	GUI:setTouchEnabled(Image_22, false)
	GUI:setTag(Image_22, 1228)

	-- Create Text_leiji_day
	local Text_leiji_day = GUI:TextAtlas_Create(Image_22, "Text_leiji_day", 24.00, 17.00, "0", "res/custom/zhigou/img_num.png", 12, 16, "0")
	GUI:setTouchEnabled(Text_leiji_day, false)
	GUI:setTag(Text_leiji_day, -1)

	-- Create LoadingBar_bg
	local LoadingBar_bg = GUI:Image_Create(Node_2, "LoadingBar_bg", 315.00, 24.00, "res/custom/zhigou/img_jindutiao.png_bg.png")
	GUI:setAnchorPoint(LoadingBar_bg, 0.50, 0.50)
	GUI:setTouchEnabled(LoadingBar_bg, false)
	GUI:setTag(LoadingBar_bg, 1224)

	-- Create LoadingBar
	local LoadingBar = GUI:LoadingBar_Create(Node_2, "LoadingBar", 315.00, 24.00, "res/custom/zhigou/img_jindutiao.png", 0)
	GUI:LoadingBar_setPercent(LoadingBar, 48)
	GUI:LoadingBar_setColor(LoadingBar, "#ffffff")
	GUI:setAnchorPoint(LoadingBar, 0.50, 0.50)
	GUI:setTouchEnabled(LoadingBar, false)
	GUI:setTag(LoadingBar, 1223)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(img_bg, "Image_1", 158.00, 276.00, "res/custom/common2/41.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.50)
	GUI:setScaleY(Image_1, 0.80)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 116)

	-- Create tx_today_billNum
	local tx_today_billNum = GUI:Text_Create(img_bg, "tx_today_billNum", 167.00, 276.00, 16, "#ffffb7", [[当日累充：10元]])
	GUI:setAnchorPoint(tx_today_billNum, 0.00, 0.50)
	GUI:setTouchEnabled(tx_today_billNum, false)
	GUI:setTag(tx_today_billNum, 115)
	GUI:Text_enableOutline(tx_today_billNum, "#000000", 1)
end
return ui