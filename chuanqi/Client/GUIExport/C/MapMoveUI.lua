local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create bg_close
	local bg_close = GUI:Image_Create(Layer, "bg_close", 0.00, 0.00, "res/custom/common/bg_main_6.png")
	GUI:setContentSize(bg_close, 1136, 640)
	GUI:setIgnoreContentAdaptWithSize(bg_close, false)
	GUI:setOpacity(bg_close, 0)
	GUI:setTouchEnabled(bg_close, true)
	GUI:setTag(bg_close, 221)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 200)

	-- Create img_bg
	local img_bg = GUI:Image_Create(nd_root, "img_bg", -48.96, 10.52, "res/custom/mapmove/00313.png")
	GUI:setContentSize(img_bg, 750, 450)
	GUI:setIgnoreContentAdaptWithSize(img_bg, false)
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg, true)
	GUI:setTag(img_bg, 201)

	-- Create tx_title
	local tx_title = GUI:Text_Create(img_bg, "tx_title", 405.19, 338.77, 20, "#d6c6ad", [[地图传送]])
	GUI:setAnchorPoint(tx_title, 0.00, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 202)
	GUI:Text_enableOutline(tx_title, "#000000", 2)

	-- Create btn_close
	local btn_close = GUI:Button_Create(img_bg, "btn_close", 703.23, 313.70, "res/custom/common/btn_close_1_1.png")
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
	GUI:setTag(btn_close, 203)

	-- Create bg_di
	local bg_di = GUI:Layout_Create(img_bg, "bg_di", 246.73, 56.88, 50.00, 50.00, false)
	GUI:Layout_setBackGroundColorType(bg_di, 1)
	GUI:Layout_setBackGroundColor(bg_di, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(bg_di, 0)
	GUI:setTouchEnabled(bg_di, true)
	GUI:setTag(bg_di, 1470)

	-- Create tx_mapname
	local tx_mapname = GUI:Text_Create(bg_di, "tx_mapname", 672.39, 392.99, 18, "#c0c0c0", [[神龙秘境一层]])
	GUI:setAnchorPoint(tx_mapname, 0.50, 0.50)
	GUI:setTouchEnabled(tx_mapname, false)
	GUI:setTag(tx_mapname, 210)
	GUI:setVisible(tx_mapname, false)
	GUI:Text_enableOutline(tx_mapname, "#000000", 1)

	-- Create Image_16
	local Image_16 = GUI:Image_Create(bg_di, "Image_16", 671.41, 379.20, "res/custom/mapmove/mapmove1.png")
	GUI:setAnchorPoint(Image_16, 0.50, 0.50)
	GUI:setTouchEnabled(Image_16, false)
	GUI:setTag(Image_16, 211)
	GUI:setVisible(Image_16, false)

	-- Create tx_xiaohao
	local tx_xiaohao = GUI:Text_Create(bg_di, "tx_xiaohao", 315.22, 49.14, 18, "#ffff00", [[元宝:1000]])
	GUI:setAnchorPoint(tx_xiaohao, 0.00, 0.50)
	GUI:setTouchEnabled(tx_xiaohao, false)
	GUI:setTag(tx_xiaohao, 215)
	GUI:Text_enableOutline(tx_xiaohao, "#000000", 1)

	-- Create SlV_jieshao
	local SlV_jieshao = GUI:Layout_Create(bg_di, "SlV_jieshao", 68.62, 195.59, 300.00, 20.00, false)
	GUI:Layout_setBackGroundColorType(SlV_jieshao, 1)
	GUI:Layout_setBackGroundColor(SlV_jieshao, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(SlV_jieshao, 0)
	GUI:setAnchorPoint(SlV_jieshao, 0.00, 1.00)
	GUI:setTouchEnabled(SlV_jieshao, true)
	GUI:setTag(SlV_jieshao, 112)

	-- Create btn_chuanshong
	local btn_chuanshong = GUI:Button_Create(bg_di, "btn_chuanshong", 355.77, 7.88, "res/custom/mapmove/00014.png")
	GUI:Button_loadTexturePressed(btn_chuanshong, "res/custom/mapmove/00015.png")
	GUI:Button_loadTextureDisabled(btn_chuanshong, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(btn_chuanshong, 15, 15, 11, 11)
	GUI:setContentSize(btn_chuanshong, 108, 30)
	GUI:setIgnoreContentAdaptWithSize(btn_chuanshong, false)
	GUI:Button_setTitleText(btn_chuanshong, "")
	GUI:Button_setTitleColor(btn_chuanshong, "#414146")
	GUI:Button_setTitleFontSize(btn_chuanshong, 14)
	GUI:Button_titleDisableOutLine(btn_chuanshong)
	GUI:setAnchorPoint(btn_chuanshong, 0.50, 0.50)
	GUI:setTouchEnabled(btn_chuanshong, true)
	GUI:setTag(btn_chuanshong, 216)

	-- Create tx_btn_jieshao
	local tx_btn_jieshao = GUI:Text_Create(btn_chuanshong, "tx_btn_jieshao", 62.69, 21.00, 18, "#c0c0c0", [[]])
	GUI:setAnchorPoint(tx_btn_jieshao, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_jieshao, false)
	GUI:setTag(tx_btn_jieshao, 218)
	GUI:Text_enableOutline(tx_btn_jieshao, "#000000", 1)

	-- Create lv_item
	local lv_item = GUI:ListView_Create(bg_di, "lv_item", 19.81, 100.87, 400.00, 65.00, 2)
	GUI:ListView_setGravity(lv_item, 5)
	GUI:setAnchorPoint(lv_item, 0.00, 0.50)
	GUI:setTouchEnabled(lv_item, true)
	GUI:setTag(lv_item, 219)

	-- Create Img_yulan
	local Img_yulan = GUI:Image_Create(bg_di, "Img_yulan", 567.28, 147.82, "res/custom/mapmove/mapmove4.png")
	GUI:setAnchorPoint(Img_yulan, 0.50, 0.50)
	GUI:setTouchEnabled(Img_yulan, false)
	GUI:setTag(Img_yulan, 220)
	GUI:setVisible(Img_yulan, false)
end
return ui