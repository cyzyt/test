local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 1546)

	-- Create img_di
	local img_di = GUI:Image_Create(nd_root, "img_di", 11.00, -33.00, "res/custom/zhigou/7.jpg")
	GUI:setAnchorPoint(img_di, 0.50, 0.50)
	GUI:setTouchEnabled(img_di, false)
	GUI:setTag(img_di, 296)

	-- Create p_huodong
	local p_huodong = GUI:Layout_Create(img_di, "p_huodong", 157.00, 19.00, 200.00, 200.00, false)
	GUI:setTouchEnabled(p_huodong, false)
	GUI:setTag(p_huodong, 297)

	-- Create P_kuang
	local P_kuang = GUI:Layout_Create(p_huodong, "P_kuang", 2.00, 425.00, 575.00, 50.00, true)
	GUI:Layout_setBackGroundColorType(P_kuang, 1)
	GUI:Layout_setBackGroundColor(P_kuang, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(P_kuang, 0)
	GUI:setAnchorPoint(P_kuang, 0.00, 1.00)
	GUI:setTouchEnabled(P_kuang, true)
	GUI:setTag(P_kuang, 475)

	-- Create big2_0
	local big2_0 = GUI:Image_Create(P_kuang, "big2_0", -5.00, 41.00, "res/custom/painting/img_bg_009.png")
	GUI:setAnchorPoint(big2_0, 0.00, 0.50)
	GUI:setScaleY(big2_0, 0.70)
	GUI:setTouchEnabled(big2_0, false)
	GUI:setTag(big2_0, 617)

	-- Create tx_ji1
	local tx_ji1 = GUI:Text_Create(P_kuang, "tx_ji1", 39.00, 31.00, 18, "#ffffb7", [[装  备]])
	GUI:setAnchorPoint(tx_ji1, 0.00, 0.50)
	GUI:setTouchEnabled(tx_ji1, false)
	GUI:setTag(tx_ji1, 480)
	GUI:Text_enableOutline(tx_ji1, "#000000", 2)

	-- Create tx_ji2
	local tx_ji2 = GUI:Text_Create(P_kuang, "tx_ji2", 176.00, 31.00, 18, "#ffffb7", [[奖  励]])
	GUI:setAnchorPoint(tx_ji2, 0.00, 0.50)
	GUI:setTouchEnabled(tx_ji2, false)
	GUI:setTag(tx_ji2, 618)
	GUI:Text_enableOutline(tx_ji2, "#000000", 2)

	-- Create tx_ji3
	local tx_ji3 = GUI:Text_Create(P_kuang, "tx_ji3", 336.00, 31.00, 18, "#ffffb7", [[剩  余]])
	GUI:setAnchorPoint(tx_ji3, 0.00, 0.50)
	GUI:setTouchEnabled(tx_ji3, false)
	GUI:setTag(tx_ji3, 619)
	GUI:Text_enableOutline(tx_ji3, "#000000", 2)

	-- Create tx_ji4
	local tx_ji4 = GUI:Text_Create(P_kuang, "tx_ji4", 478.00, 31.00, 18, "#ffffb7", [[领  取]])
	GUI:setAnchorPoint(tx_ji4, 0.00, 0.50)
	GUI:setTouchEnabled(tx_ji4, false)
	GUI:setTag(tx_ji4, 620)
	GUI:Text_enableOutline(tx_ji4, "#000000", 2)

	-- Create View_huadong
	local View_huadong = GUI:ListView_Create(img_di, "View_huadong", 157.00, 1.00, 580.00, 400.00, 1)
	GUI:ListView_setBackGroundColorType(View_huadong, 1)
	GUI:ListView_setBackGroundColor(View_huadong, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(View_huadong, 0)
	GUI:ListView_setGravity(View_huadong, 5)
	GUI:setTouchEnabled(View_huadong, true)
	GUI:setTag(View_huadong, -1)

	-- Create cell
	local cell = GUI:ListView_Create(nd_root, "cell", -200.00, 82.00, 580.00, 60.00, 1)
	GUI:ListView_setGravity(cell, 5)
	GUI:setTouchEnabled(cell, false)
	GUI:setTag(cell, 94)

	-- Create template
	local template = GUI:Layout_Create(cell, "template", 0.00, 60.00, 580.00, 60.00, false)
	GUI:Layout_setBackGroundColorType(template, 1)
	GUI:Layout_setBackGroundColor(template, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(template, 0)
	GUI:setAnchorPoint(template, 0.00, 1.00)
	GUI:setTouchEnabled(template, false)
	GUI:setTag(template, 95)

	-- Create Img_xian
	local Img_xian = GUI:Image_Create(template, "Img_xian", 290.00, 0.00, "res/custom/common/img_line_2.png")
	GUI:setContentSize(Img_xian, 580, 5)
	GUI:setIgnoreContentAdaptWithSize(Img_xian, false)
	GUI:setAnchorPoint(Img_xian, 0.50, 0.00)
	GUI:setTouchEnabled(Img_xian, false)
	GUI:setTag(Img_xian, 96)

	-- Create P_item
	local P_item = GUI:Layout_Create(template, "P_item", 65.00, 32.00, 0.00, 0.00, false)
	GUI:setAnchorPoint(P_item, 0.50, 0.50)
	GUI:setScaleX(P_item, 0.80)
	GUI:setScaleY(P_item, 0.80)
	GUI:setTouchEnabled(P_item, true)
	GUI:setTag(P_item, 97)

	-- Create btn_zs
	local btn_zs = GUI:Button_Create(template, "btn_zs", 506.00, 11.00, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(btn_zs, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(btn_zs, 15, 30, 11, 14)
	GUI:setContentSize(btn_zs, 125, 39)
	GUI:setIgnoreContentAdaptWithSize(btn_zs, false)
	GUI:Button_setTitleText(btn_zs, "")
	GUI:Button_setTitleColor(btn_zs, "#414146")
	GUI:Button_setTitleFontSize(btn_zs, 14)
	GUI:Button_titleDisableOutLine(btn_zs)
	GUI:setAnchorPoint(btn_zs, 0.50, 0.00)
	GUI:setTouchEnabled(btn_zs, true)
	GUI:setTag(btn_zs, 98)

	-- Create tx_btn_text
	local tx_btn_text = GUI:Text_Create(btn_zs, "tx_btn_text", 62.00, 20.00, 18, "#c0c0c0", [[未 达 成]])
	GUI:setAnchorPoint(tx_btn_text, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_text, false)
	GUI:setTag(tx_btn_text, 99)
	GUI:Text_enableOutline(tx_btn_text, "#000000", 1)

	-- Create img_get
	local img_get = GUI:Image_Create(template, "img_get", 503.00, 32.00, "res/custom/common2/356.png")
	GUI:setAnchorPoint(img_get, 0.50, 0.50)
	GUI:setScaleX(img_get, 0.70)
	GUI:setScaleY(img_get, 0.70)
	GUI:setTouchEnabled(img_get, false)
	GUI:setTag(img_get, 100)

	-- Create img_notreached
	local img_notreached = GUI:Image_Create(template, "img_notreached", 503.00, 32.00, "res/custom/common2/355.png")
	GUI:setAnchorPoint(img_notreached, 0.50, 0.50)
	GUI:setScaleX(img_notreached, 0.70)
	GUI:setScaleY(img_notreached, 0.70)
	GUI:setTouchEnabled(img_notreached, false)
	GUI:setTag(img_notreached, 101)

	-- Create tx_yb
	local tx_yb = GUI:Text_Create(template, "tx_yb", 205.00, 33.00, 15, "#ffff00", [[1000元宝]])
	GUI:setAnchorPoint(tx_yb, 0.50, 0.50)
	GUI:setTouchEnabled(tx_yb, false)
	GUI:setTag(tx_yb, 102)
	GUI:Text_enableOutline(tx_yb, "#000000", 1)

	-- Create tx_sy
	local tx_sy = GUI:Text_Create(template, "tx_sy", 366.00, 33.00, 15, "#00ff00", [[1000]])
	GUI:setAnchorPoint(tx_sy, 0.50, 0.50)
	GUI:setTouchEnabled(tx_sy, false)
	GUI:setTag(tx_sy, 103)
	GUI:Text_enableOutline(tx_sy, "#000000", 1)
end
return ui