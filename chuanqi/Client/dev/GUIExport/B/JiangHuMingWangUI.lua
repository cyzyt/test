local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create bg_close
	local bg_close = GUI:Layout_Create(Layer, "bg_close", 0.00, 0.00, 1136.00, 640.00, false)
	GUI:Layout_setBackGroundColorType(bg_close, 1)
	GUI:Layout_setBackGroundColor(bg_close, "#000000")
	GUI:Layout_setBackGroundColorOpacity(bg_close, 102)
	GUI:setTouchEnabled(bg_close, true)
	GUI:setTag(bg_close, 285)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 236)

	-- Create img_bg
	local img_bg = GUI:Image_Create(nd_root, "img_bg", 6.00, 6.00, "res/custom/superVIP/1900000681_9.png")
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg, true)
	GUI:setTag(img_bg, 237)

	-- Create Image_14
	local Image_14 = GUI:Image_Create(img_bg, "Image_14", 430.00, 255.00, "res/custom/superVIP/bg_chjhy_01.png")
	GUI:setAnchorPoint(Image_14, 0.50, 0.50)
	GUI:setTouchEnabled(Image_14, false)
	GUI:setTag(Image_14, 429)

	-- Create tx_title
	local tx_title = GUI:Text_Create(img_bg, "tx_title", 139.00, 488.00, 20, "#d6c6ad", [[仙位]])
	GUI:setAnchorPoint(tx_title, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 500)
	GUI:Text_enableOutline(tx_title, "#000000", 2)

	-- Create btn_close
	local btn_close = GUI:Button_Create(img_bg, "btn_close", 809.00, 486.00, "res/custom/shouchong/z_guanbianniu.png")
	GUI:Button_loadTexturePressed(btn_close, "res/custom/shouchong/z_guanbianniu.png1.png")
	GUI:Button_setScale9Slice(btn_close, 15, 15, 11, 11)
	GUI:setContentSize(btn_close, 33, 26)
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

	-- Create superVip_list
	local superVip_list = GUI:ListView_Create(nd_content, "superVip_list", 62.00, 469.00, 735.00, 385.00, 2)
	GUI:ListView_setGravity(superVip_list, 3)
	GUI:ListView_setItemsMargin(superVip_list, 70)
	GUI:setAnchorPoint(superVip_list, 0.00, 1.00)
	GUI:setTouchEnabled(superVip_list, true)
	GUI:setTag(superVip_list, 11)

	-- Create template
	local template = GUI:Button_Create(nd_content, "template", 248.00, 260.00, "res/custom/touming.png")
	GUI:Button_loadTexturePressed(template, "res/custom/touming.png")
	GUI:Button_loadTextureDisabled(template, "res/custom/touming.png")
	GUI:Button_setScale9Slice(template, 3, 4, 3, 4)
	GUI:setContentSize(template, 410, 385)
	GUI:setIgnoreContentAdaptWithSize(template, false)
	GUI:Button_setTitleText(template, "")
	GUI:Button_setTitleColor(template, "#414146")
	GUI:Button_setTitleFontSize(template, 16)
	GUI:Button_titleDisableOutLine(template)
	GUI:setAnchorPoint(template, 0.50, 0.50)
	GUI:setTouchEnabled(template, true)
	GUI:setTag(template, 62)

	-- Create show_layout
	local show_layout = GUI:Layout_Create(template, "show_layout", 0.00, 0.00, 300.00, 200.00, false)
	GUI:Layout_setBackGroundColorType(show_layout, 1)
	GUI:Layout_setBackGroundColor(show_layout, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(show_layout, 0)
	GUI:setTouchEnabled(show_layout, true)
	GUI:setTag(show_layout, 83)

	-- Create img_liang
	local img_liang = GUI:Image_Create(show_layout, "img_liang", 9.00, -2.00, "res/custom/superVIP/bg_huiyd_01.png")
	GUI:setTouchEnabled(img_liang, false)
	GUI:setTag(img_liang, 214)

	-- Create infoTxt
	local infoTxt = GUI:Text_Create(show_layout, "infoTxt", 123.00, 292.00, 18, "#ffffff", [[名望任务]])
	GUI:setAnchorPoint(infoTxt, 0.00, 1.00)
	GUI:setTouchEnabled(infoTxt, false)
	GUI:setTag(infoTxt, 666)
	GUI:Text_enableOutline(infoTxt, "#000000", 1)

	-- Create img_title
	local img_title = GUI:Image_Create(show_layout, "img_title", 162.00, 331.00, "res/custom/superVIP/title/title_1.png")
	GUI:setAnchorPoint(img_title, 0.50, 0.50)
	GUI:setTouchEnabled(img_title, false)
	GUI:setTag(img_title, 929)

	-- Create tx_title
	local tx_title = GUI:Text_Create(show_layout, "tx_title", 160.00, 283.00, 16, "#ffffff", [[]])
	GUI:setAnchorPoint(tx_title, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 12)
	GUI:Text_enableOutline(tx_title, "#000000", 1)

	-- Create img_icon
	local img_icon = GUI:Image_Create(show_layout, "img_icon", 47.00, 324.00, "res/custom/superVIP/bg_chjhy_02.png")
	GUI:setTouchEnabled(img_icon, false)
	GUI:setTag(img_icon, 1060)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(show_layout, "ListView_1", 33.00, 258.00, 255.00, 130.00, 1)
	GUI:ListView_setBackGroundColorType(ListView_1, 1)
	GUI:ListView_setBackGroundColor(ListView_1, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_1, 0)
	GUI:ListView_setGravity(ListView_1, 5)
	GUI:setAnchorPoint(ListView_1, 0.00, 1.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 349)
	GUI:setVisible(ListView_1, false)

	-- Create ListView_2
	local ListView_2 = GUI:ListView_Create(show_layout, "ListView_2", 35.00, 118.00, 255.00, 60.00, 2)
	GUI:ListView_setBackGroundColorType(ListView_2, 1)
	GUI:ListView_setBackGroundColor(ListView_2, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_2, 0)
	GUI:ListView_setGravity(ListView_2, 3)
	GUI:setAnchorPoint(ListView_2, 0.00, 1.00)
	GUI:setTouchEnabled(ListView_2, false)
	GUI:setTag(ListView_2, 356)

	-- Create item_gift
	local item_gift = GUI:Layout_Create(ListView_2, "item_gift", 0.00, 0.00, 65.00, 60.00, false)
	GUI:Layout_setBackGroundColorType(item_gift, 1)
	GUI:Layout_setBackGroundColor(item_gift, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(item_gift, 0)
	GUI:setTouchEnabled(item_gift, true)
	GUI:setTag(item_gift, 85)

	-- Create itemBg
	local itemBg = GUI:Image_Create(item_gift, "itemBg", 0.00, 0.00, "res/custom/common/img_cell_1.png")
	GUI:setContentSize(itemBg, 55, 55)
	GUI:setIgnoreContentAdaptWithSize(itemBg, false)
	GUI:setTouchEnabled(itemBg, false)
	GUI:setTag(itemBg, 84)

	-- Create ListView_3
	local ListView_3 = GUI:ListView_Create(show_layout, "ListView_3", 35.00, 255.00, 255.00, 60.00, 2)
	GUI:ListView_setBackGroundColorType(ListView_3, 1)
	GUI:ListView_setBackGroundColor(ListView_3, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView_3, 0)
	GUI:ListView_setGravity(ListView_3, 3)
	GUI:setAnchorPoint(ListView_3, 0.00, 1.00)
	GUI:setTouchEnabled(ListView_3, false)
	GUI:setTag(ListView_3, 34)

	-- Create item_gift
	local item_gift = GUI:Layout_Create(ListView_3, "item_gift", 0.00, 0.00, 65.00, 60.00, false)
	GUI:Layout_setBackGroundColorType(item_gift, 1)
	GUI:Layout_setBackGroundColor(item_gift, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(item_gift, 0)
	GUI:setTouchEnabled(item_gift, true)
	GUI:setTag(item_gift, 35)

	-- Create itemBg
	local itemBg = GUI:Image_Create(item_gift, "itemBg", 0.00, 0.00, "res/custom/common/img_cell_1.png")
	GUI:setContentSize(itemBg, 55, 55)
	GUI:setIgnoreContentAdaptWithSize(itemBg, false)
	GUI:setTouchEnabled(itemBg, false)
	GUI:setTag(itemBg, 36)

	-- Create pet_is_buy
	local pet_is_buy = GUI:Image_Create(show_layout, "pet_is_buy", 252.00, 75.00, "res/custom/common/com_txt_ylq2.png")
	GUI:setAnchorPoint(pet_is_buy, 0.50, 0.50)
	GUI:setTouchEnabled(pet_is_buy, false)
	GUI:setTag(pet_is_buy, 39)
	GUI:setVisible(pet_is_buy, false)

	-- Create gifts_is_get
	local gifts_is_get = GUI:Image_Create(show_layout, "gifts_is_get", 252.00, 215.00, "res/custom/common/com_txt_ygm.png")
	GUI:setAnchorPoint(gifts_is_get, 0.50, 0.50)
	GUI:setTouchEnabled(gifts_is_get, false)
	GUI:setTag(gifts_is_get, 40)
	GUI:setVisible(gifts_is_get, false)

	-- Create show_attr_btn
	local show_attr_btn = GUI:Button_Create(show_layout, "show_attr_btn", 161.00, 34.00, "res/custom/common/btn_gift_1.png")
	GUI:Button_loadTexturePressed(show_attr_btn, "res/custom/common/btn_gift_2.png")
	GUI:Button_loadTextureDisabled(show_attr_btn, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(show_attr_btn, 15, 15, 11, 11)
	GUI:setContentSize(show_attr_btn, 134, 49)
	GUI:setIgnoreContentAdaptWithSize(show_attr_btn, false)
	GUI:Button_setTitleText(show_attr_btn, "")
	GUI:Button_setTitleColor(show_attr_btn, "#414146")
	GUI:Button_setTitleFontSize(show_attr_btn, 14)
	GUI:Button_titleDisableOutLine(show_attr_btn)
	GUI:setAnchorPoint(show_attr_btn, 0.50, 0.50)
	GUI:setTouchEnabled(show_attr_btn, true)
	GUI:setTag(show_attr_btn, 155)

	-- Create Text_14
	local Text_14 = GUI:Text_Create(show_attr_btn, "Text_14", 67.00, 25.00, 15, "#faebd7", [[属性加成]])
	GUI:setAnchorPoint(Text_14, 0.50, 0.50)
	GUI:setTouchEnabled(Text_14, false)
	GUI:setTag(Text_14, 156)
	GUI:Text_enableOutline(Text_14, "#000000", 1)

	-- Create get_gift_btn
	local get_gift_btn = GUI:Button_Create(show_layout, "get_gift_btn", 161.00, 159.00, "res/custom/common/btn_gift_1.png")
	GUI:Button_loadTexturePressed(get_gift_btn, "res/custom/common/btn_gift_2.png")
	GUI:Button_loadTextureDisabled(get_gift_btn, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(get_gift_btn, 15, 15, 11, 11)
	GUI:setContentSize(get_gift_btn, 134, 49)
	GUI:setIgnoreContentAdaptWithSize(get_gift_btn, false)
	GUI:Button_setTitleText(get_gift_btn, "")
	GUI:Button_setTitleColor(get_gift_btn, "#414146")
	GUI:Button_setTitleFontSize(get_gift_btn, 14)
	GUI:Button_titleDisableOutLine(get_gift_btn)
	GUI:setAnchorPoint(get_gift_btn, 0.50, 0.50)
	GUI:setTouchEnabled(get_gift_btn, true)
	GUI:setTag(get_gift_btn, 37)

	-- Create get_gift_txt
	local get_gift_txt = GUI:Text_Create(get_gift_btn, "get_gift_txt", 67.00, 25.00, 14, "#faebd7", [[立即购买]])
	GUI:setAnchorPoint(get_gift_txt, 0.50, 0.50)
	GUI:setTouchEnabled(get_gift_txt, false)
	GUI:setTag(get_gift_txt, 38)
	GUI:Text_enableOutline(get_gift_txt, "#000000", 1)

	-- Create tempitem
	local tempitem = GUI:Layout_Create(nd_content, "tempitem", 120.00, 288.00, 255.00, 30.00, false)
	GUI:Layout_setBackGroundColorType(tempitem, 1)
	GUI:Layout_setBackGroundColor(tempitem, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(tempitem, 0)
	GUI:setTouchEnabled(tempitem, true)
	GUI:setTag(tempitem, 544)

	-- Create info_bg
	local info_bg = GUI:Image_Create(tempitem, "info_bg", 130.00, 16.00, "res/custom/common/img_bg_6.png")
	GUI:setContentSize(info_bg, 200, 22)
	GUI:setIgnoreContentAdaptWithSize(info_bg, false)
	GUI:setAnchorPoint(info_bg, 0.50, 0.50)
	GUI:setTouchEnabled(info_bg, false)
	GUI:setTag(info_bg, 30)
	GUI:setVisible(info_bg, false)

	-- Create info_txt
	local info_txt = GUI:Layout_Create(tempitem, "info_txt", 29.00, 7.00, 200.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(info_txt, 1)
	GUI:Layout_setBackGroundColor(info_txt, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(info_txt, 0)
	GUI:setTouchEnabled(info_txt, true)
	GUI:setTag(info_txt, 86)

	-- Create wancheng
	local wancheng = GUI:Image_Create(tempitem, "wancheng", 219.00, 17.00, "res/custom/common/com_txt_ywc.png")
	GUI:setAnchorPoint(wancheng, 0.50, 0.50)
	GUI:setTouchEnabled(wancheng, false)
	GUI:setTag(wancheng, 29)
	GUI:setVisible(wancheng, false)

	-- Create Gobtn
	local Gobtn = GUI:Button_Create(tempitem, "Gobtn", 220.00, 15.00, "res/custom/superVIP/btn_hejhy_01.png")
	GUI:Button_loadTexturePressed(Gobtn, "res/custom/superVIP/btn_hejhy_02.png")
	GUI:Button_loadTextureDisabled(Gobtn, "Default/Button_Disable.png")
	GUI:setContentSize(Gobtn, 50, 28)
	GUI:setIgnoreContentAdaptWithSize(Gobtn, false)
	GUI:Button_setTitleText(Gobtn, "Button")
	GUI:Button_setTitleColor(Gobtn, "#414146")
	GUI:Button_setTitleFontSize(Gobtn, 14)
	GUI:Button_titleDisableOutLine(Gobtn)
	GUI:setAnchorPoint(Gobtn, 0.50, 0.50)
	GUI:setScaleX(Gobtn, 0.80)
	GUI:setScaleY(Gobtn, 0.80)
	GUI:setTouchEnabled(Gobtn, true)
	GUI:setTag(Gobtn, 756)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Gobtn, "Text_1", 25.00, 16.00, 18, "#ffdead", [[前往]])
	GUI:setAnchorPoint(Text_1, 0.50, 0.50)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 798)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create btn_go
	local btn_go = GUI:Button_Create(nd_content, "btn_go", 431.00, 58.00, "res/custom/superVIP/chara_btn_active.png")
	GUI:Button_loadTexturePressed(btn_go, "res/custom/superVIP/chara_btn_active.png")
	GUI:Button_loadTextureDisabled(btn_go, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(btn_go, 15, 15, 11, 11)
	GUI:setContentSize(btn_go, 133, 100)
	GUI:setIgnoreContentAdaptWithSize(btn_go, false)
	GUI:Button_setTitleText(btn_go, "")
	GUI:Button_setTitleColor(btn_go, "#414146")
	GUI:Button_setTitleFontSize(btn_go, 14)
	GUI:Button_titleDisableOutLine(btn_go)
	GUI:setAnchorPoint(btn_go, 0.50, 0.50)
	GUI:setTouchEnabled(btn_go, true)
	GUI:setTag(btn_go, 359)

	-- Create Text_14
	local Text_14 = GUI:Text_Create(btn_go, "Text_14", 67.00, 19.00, 17, "#ffff00", [[]])
	GUI:setAnchorPoint(Text_14, 0.50, 0.50)
	GUI:setTouchEnabled(Text_14, false)
	GUI:setTag(Text_14, 428)
	GUI:Text_enableOutline(Text_14, "#000000", 1)
end
return ui