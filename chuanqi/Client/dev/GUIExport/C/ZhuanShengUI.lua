local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create bg_close
	local bg_close = GUI:Image_Create(Layer, "bg_close", 1.00, 0.00, "res/custom/common/bg_main_6.png")
	GUI:setContentSize(bg_close, 1136, 640)
	GUI:setIgnoreContentAdaptWithSize(bg_close, false)
	GUI:setOpacity(bg_close, 0)
	GUI:setTouchEnabled(bg_close, true)
	GUI:setTag(bg_close, 333)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 1587)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(nd_root, "Image_1", 0.00, 0.00, "res/custom/zhuansheng/00128.png")
	GUI:setAnchorPoint(Image_1, 0.50, 0.50)
	GUI:setScaleX(Image_1, 1.10)
	GUI:setScaleY(Image_1, 1.17)
	GUI:setTouchEnabled(Image_1, true)
	GUI:setTag(Image_1, 332)

	-- Create Image_3
	local Image_3 = GUI:Image_Create(nd_root, "Image_3", 0.00, -46.00, "res/custom/zhuansheng/7.jpg")
	GUI:setAnchorPoint(Image_3, 0.50, 0.50)
	GUI:setTouchEnabled(Image_3, false)
	GUI:setTag(Image_3, 574)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(nd_root, "Button_4", 414.00, 202.00, "res/custom/common/btn_close_1_2.png")
	GUI:Button_loadTexturePressed(Button_4, "res/custom/common/btn_close_1_1.png")
	GUI:Button_loadTextureDisabled(Button_4, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(Button_4, 8, 8, 11, 11)
	GUI:setContentSize(Button_4, 26, 42)
	GUI:setIgnoreContentAdaptWithSize(Button_4, false)
	GUI:Button_setTitleText(Button_4, "")
	GUI:Button_setTitleColor(Button_4, "#414146")
	GUI:Button_setTitleFontSize(Button_4, 14)
	GUI:Button_titleDisableOutLine(Button_4)
	GUI:setAnchorPoint(Button_4, 0.56, 0.47)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, 301)

	-- Create xhlevel
	local xhlevel = GUI:Text_Create(nd_root, "xhlevel", 56.00, -186.00, 16, "#4ae74a", [[99级]])
	GUI:setAnchorPoint(xhlevel, 0.00, 0.50)
	GUI:setTouchEnabled(xhlevel, false)
	GUI:setTag(xhlevel, 302)
	GUI:Text_enableOutline(xhlevel, "#000000", 1)

	-- Create Text_16_0_4
	local Text_16_0_4 = GUI:Text_Create(nd_root, "Text_16_0_4", 31.00, -186.00, 16, "#c0c0c0", [[转生降]])
	GUI:setAnchorPoint(Text_16_0_4, 0.50, 0.50)
	GUI:setTouchEnabled(Text_16_0_4, false)
	GUI:setTag(Text_16_0_4, 303)
	GUI:Text_enableOutline(Text_16_0_4, "#000000", 1)

	-- Create dqlevel
	local dqlevel = GUI:Text_Create(nd_root, "dqlevel", -52.00, -186.00, 16, "#4ae74a", [[999级]])
	GUI:setAnchorPoint(dqlevel, 0.00, 0.50)
	GUI:setTouchEnabled(dqlevel, false)
	GUI:setTag(dqlevel, 304)
	GUI:Text_enableOutline(dqlevel, "#000000", 1)

	-- Create need_item_1
	local need_item_1 = GUI:Layout_Create(nd_root, "need_item_1", -1.00, -132.00, 229.00, 25.00, false)
	GUI:setAnchorPoint(need_item_1, 0.50, 0.50)
	GUI:setTouchEnabled(need_item_1, true)
	GUI:setTag(need_item_1, 221)

	-- Create need_item_2
	local need_item_2 = GUI:Layout_Create(nd_root, "need_item_2", -1.00, -161.00, 229.00, 25.00, false)
	GUI:setAnchorPoint(need_item_2, 0.50, 0.50)
	GUI:setTouchEnabled(need_item_2, true)
	GUI:setTag(need_item_2, 222)

	-- Create huobi
	local huobi = GUI:Text_Create(nd_root, "huobi", 1.00, -160.00, 18, "#4ae74a", [[元宝:0/1000]])
	GUI:setAnchorPoint(huobi, 0.50, 0.50)
	GUI:setTouchEnabled(huobi, false)
	GUI:setTag(huobi, 305)
	GUI:setVisible(huobi, false)
	GUI:Text_enableOutline(huobi, "#000000", 1)

	-- Create chailiao
	local chailiao = GUI:Text_Create(nd_root, "chailiao", 3.00, -131.00, 18, "#4ae74a", [[1转神石:0/5]])
	GUI:setAnchorPoint(chailiao, 0.50, 0.50)
	GUI:setTouchEnabled(chailiao, false)
	GUI:setTag(chailiao, 306)
	GUI:setVisible(chailiao, false)
	GUI:Text_enableOutline(chailiao, "#000000", 1)

	-- Create Text_16_0_0_0
	local Text_16_0_0_0 = GUI:Text_Create(nd_root, "Text_16_0_0_0", -71.00, -186.00, 16, "#c0c0c0", [[人物]])
	GUI:setAnchorPoint(Text_16_0_0_0, 0.50, 0.50)
	GUI:setTouchEnabled(Text_16_0_0_0, false)
	GUI:setTag(Text_16_0_0_0, 307)
	GUI:Text_enableOutline(Text_16_0_0_0, "#000000", 1)

	-- Create Text_29
	local Text_29 = GUI:Text_Create(nd_root, "Text_29", -320.00, 204.00, 20, "#d6c6ad", [[转  生]])
	GUI:setAnchorPoint(Text_29, 0.50, 0.50)
	GUI:setTouchEnabled(Text_29, false)
	GUI:setTag(Text_29, 310)
	GUI:Text_enableOutline(Text_29, "#000000", 3)

	-- Create Image_9
	local Image_9 = GUI:Image_Create(nd_root, "Image_9", -4.00, 147.00, "res/custom/zhuansheng/5.png")
	GUI:setAnchorPoint(Image_9, 0.50, 0.50)
	GUI:setTouchEnabled(Image_9, false)
	GUI:setTag(Image_9, 609)

	-- Create AtlasLabel_2
	local AtlasLabel_2 = GUI:TextAtlas_Create(Image_9, "AtlasLabel_2", 95.00, 0.00, "0", "res/custom/zhuansheng/6.png", 19, 25, "0")
	GUI:setTouchEnabled(AtlasLabel_2, false)
	GUI:setTag(AtlasLabel_2, -1)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(nd_root, "Button_3", 1.00, -223.00, "res/custom/common/btn_2_2.png")
	GUI:Button_loadTexturePressed(Button_3, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTextureDisabled(Button_3, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(Button_3, 15, 15, 11, 11)
	GUI:setContentSize(Button_3, 125, 39)
	GUI:setIgnoreContentAdaptWithSize(Button_3, false)
	GUI:Button_setTitleText(Button_3, "")
	GUI:Button_setTitleColor(Button_3, "#ffff00")
	GUI:Button_setTitleFontSize(Button_3, 14)
	GUI:Button_titleDisableOutLine(Button_3)
	GUI:setAnchorPoint(Button_3, 0.50, 0.50)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 313)

	-- Create Text_19
	local Text_19 = GUI:Text_Create(nd_root, "Text_19", 1.00, -223.00, 18, "#ffff00", [[转  生]])
	GUI:setAnchorPoint(Text_19, 0.50, 0.50)
	GUI:setTouchEnabled(Text_19, false)
	GUI:setTag(Text_19, 311)
	GUI:Text_enableOutline(Text_19, "#000000", 1)

	-- Create bg_kuang1
	local bg_kuang1 = GUI:Image_Create(nd_root, "bg_kuang1", -244.00, -24.00, "res/custom/zhuansheng/1.png")
	GUI:setAnchorPoint(bg_kuang1, 0.50, 0.50)
	GUI:setTouchEnabled(bg_kuang1, false)
	GUI:setTag(bg_kuang1, 605)

	-- Create img_dqshuxing
	local img_dqshuxing = GUI:Image_Create(bg_kuang1, "img_dqshuxing", 101.00, 117.00, "res/custom/zhuansheng/3.png")
	GUI:setAnchorPoint(img_dqshuxing, 0.50, 0.50)
	GUI:setTouchEnabled(img_dqshuxing, false)
	GUI:setTag(img_dqshuxing, 606)

	-- Create att_tiao1
	local att_tiao1 = GUI:Layout_Create(nd_root, "att_tiao1", -322.00, -19.00, 150.00, 25.00, false)
	GUI:setTouchEnabled(att_tiao1, true)
	GUI:setTag(att_tiao1, 113)

	-- Create shuxing1
	local shuxing1 = GUI:Text_Create(att_tiao1, "shuxing1", 43.00, 13.00, 16, "#c0c0c0", [[生  命:]])
	GUI:setAnchorPoint(shuxing1, 0.50, 0.50)
	GUI:setTouchEnabled(shuxing1, false)
	GUI:setTag(shuxing1, 325)
	GUI:Text_enableOutline(shuxing1, "#000000", 1)

	-- Create shuxz1
	local shuxz1 = GUI:Text_Create(att_tiao1, "shuxz1", 91.00, 13.00, 16, "#c0c0c0", [[0]])
	GUI:setAnchorPoint(shuxz1, 0.00, 0.50)
	GUI:setTouchEnabled(shuxz1, false)
	GUI:setTag(shuxz1, 322)
	GUI:Text_enableOutline(shuxz1, "#000000", 1)

	-- Create att_tiao2
	local att_tiao2 = GUI:Layout_Create(nd_root, "att_tiao2", -322.00, -53.00, 150.00, 25.00, false)
	GUI:setTouchEnabled(att_tiao2, true)
	GUI:setTag(att_tiao2, 114)

	-- Create shuxing2
	local shuxing2 = GUI:Text_Create(att_tiao2, "shuxing2", 43.00, 13.00, 16, "#c0c0c0", [[攻  击:]])
	GUI:setAnchorPoint(shuxing2, 0.50, 0.50)
	GUI:setTouchEnabled(shuxing2, false)
	GUI:setTag(shuxing2, 324)
	GUI:Text_enableOutline(shuxing2, "#000000", 1)

	-- Create shuxz2
	local shuxz2 = GUI:Text_Create(att_tiao2, "shuxz2", 91.00, 13.00, 16, "#c0c0c0", [[0]])
	GUI:setAnchorPoint(shuxz2, 0.00, 0.50)
	GUI:setTouchEnabled(shuxz2, false)
	GUI:setTag(shuxz2, 321)
	GUI:Text_enableOutline(shuxz2, "#000000", 1)

	-- Create att_tiao3
	local att_tiao3 = GUI:Layout_Create(nd_root, "att_tiao3", -322.00, -88.00, 150.00, 25.00, false)
	GUI:setTouchEnabled(att_tiao3, true)
	GUI:setTag(att_tiao3, 117)

	-- Create shuxing3
	local shuxing3 = GUI:Text_Create(att_tiao3, "shuxing3", 47.00, 13.00, 16, "#c0c0c0", [[倍  攻:]])
	GUI:setAnchorPoint(shuxing3, 0.59, 0.47)
	GUI:setTouchEnabled(shuxing3, false)
	GUI:setTag(shuxing3, 323)
	GUI:Text_enableOutline(shuxing3, "#000000", 1)

	-- Create shuxz3
	local shuxz3 = GUI:Text_Create(att_tiao3, "shuxz3", 91.00, 13.00, 16, "#c0c0c0", [[0]])
	GUI:setAnchorPoint(shuxz3, 0.00, 0.50)
	GUI:setTouchEnabled(shuxz3, false)
	GUI:setTag(shuxz3, 320)
	GUI:Text_enableOutline(shuxz3, "#000000", 1)

	-- Create bg_kuang2
	local bg_kuang2 = GUI:Image_Create(nd_root, "bg_kuang2", 233.00, -24.00, "res/custom/zhuansheng/1.png")
	GUI:setAnchorPoint(bg_kuang2, 0.50, 0.50)
	GUI:setTouchEnabled(bg_kuang2, false)
	GUI:setTag(bg_kuang2, 607)

	-- Create img_nextshuxing
	local img_nextshuxing = GUI:Image_Create(bg_kuang2, "img_nextshuxing", 101.00, 117.00, "res/custom/zhuansheng/4.png")
	GUI:setAnchorPoint(img_nextshuxing, 0.50, 0.50)
	GUI:setTouchEnabled(img_nextshuxing, false)
	GUI:setTag(img_nextshuxing, 608)

	-- Create att_ntiao1
	local att_ntiao1 = GUI:Layout_Create(nd_root, "att_ntiao1", 161.00, -19.00, 150.00, 25.00, false)
	GUI:setTouchEnabled(att_ntiao1, true)
	GUI:setTag(att_ntiao1, 120)

	-- Create xshuxing1
	local xshuxing1 = GUI:Text_Create(att_ntiao1, "xshuxing1", 45.00, 13.00, 16, "#c0c0c0", [[生  命:]])
	GUI:setAnchorPoint(xshuxing1, 0.50, 0.50)
	GUI:setScaleY(xshuxing1, 0.89)
	GUI:setTouchEnabled(xshuxing1, false)
	GUI:setTag(xshuxing1, 319)
	GUI:Text_enableOutline(xshuxing1, "#000000", 1)

	-- Create xshuxz1
	local xshuxz1 = GUI:Text_Create(att_ntiao1, "xshuxz1", 92.00, 13.00, 16, "#4ae74a", [[0]])
	GUI:setAnchorPoint(xshuxz1, 0.00, 0.50)
	GUI:setTouchEnabled(xshuxz1, false)
	GUI:setTag(xshuxz1, 316)
	GUI:Text_enableOutline(xshuxz1, "#000000", 1)

	-- Create att_ntiao2
	local att_ntiao2 = GUI:Layout_Create(nd_root, "att_ntiao2", 161.00, -53.00, 150.00, 25.00, false)
	GUI:setTouchEnabled(att_ntiao2, true)
	GUI:setTag(att_ntiao2, 127)

	-- Create xshuxing2
	local xshuxing2 = GUI:Text_Create(att_ntiao2, "xshuxing2", 45.00, 13.00, 16, "#c0c0c0", [[攻  击:]])
	GUI:setAnchorPoint(xshuxing2, 0.50, 0.50)
	GUI:setTouchEnabled(xshuxing2, false)
	GUI:setTag(xshuxing2, 318)
	GUI:Text_enableOutline(xshuxing2, "#000000", 1)

	-- Create xshuxz2
	local xshuxz2 = GUI:Text_Create(att_ntiao2, "xshuxz2", 92.00, 13.00, 16, "#4ae74a", [[0]])
	GUI:setAnchorPoint(xshuxz2, 0.00, 0.50)
	GUI:setTouchEnabled(xshuxz2, false)
	GUI:setTag(xshuxz2, 315)
	GUI:Text_enableOutline(xshuxz2, "#000000", 1)

	-- Create att_ntiao3
	local att_ntiao3 = GUI:Layout_Create(nd_root, "att_ntiao3", 161.00, -88.00, 150.00, 25.00, false)
	GUI:setTouchEnabled(att_ntiao3, true)
	GUI:setTag(att_ntiao3, 130)

	-- Create xshuxing3
	local xshuxing3 = GUI:Text_Create(att_ntiao3, "xshuxing3", 45.00, 13.00, 16, "#c0c0c0", [[倍  攻:]])
	GUI:setAnchorPoint(xshuxing3, 0.50, 0.50)
	GUI:setTouchEnabled(xshuxing3, false)
	GUI:setTag(xshuxing3, 317)
	GUI:Text_enableOutline(xshuxing3, "#000000", 1)

	-- Create xshuxz3
	local xshuxz3 = GUI:Text_Create(att_ntiao3, "xshuxz3", 92.00, 13.00, 16, "#4ae74a", [[0]])
	GUI:setAnchorPoint(xshuxz3, 0.00, 0.50)
	GUI:setTouchEnabled(xshuxz3, false)
	GUI:setTag(xshuxz3, 314)
	GUI:Text_enableOutline(xshuxz3, "#000000", 1)
end
return ui