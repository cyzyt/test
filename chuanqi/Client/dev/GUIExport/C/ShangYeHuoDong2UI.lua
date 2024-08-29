local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 1454)

	-- Create img_di
	local img_di = GUI:Image_Create(nd_root, "img_di", 11.00, -33.00, "res/custom/zhigou/7.jpg")
	GUI:setAnchorPoint(img_di, 0.50, 0.50)
	GUI:setTouchEnabled(img_di, false)
	GUI:setTag(img_di, 64)

	-- Create p_huodong
	local p_huodong = GUI:Layout_Create(img_di, "p_huodong", 157.85, 19.49, 200.00, 200.00, false)
	GUI:setTouchEnabled(p_huodong, true)
	GUI:setTag(p_huodong, 65)

	-- Create View_huadong
	local View_huadong = GUI:ScrollView_Create(p_huodong, "View_huadong", -5.00, 7.12, 580.00, 300.00, 2)
	GUI:ScrollView_setInnerContainerSize(View_huadong, 580.00, 300.00)
	GUI:setTouchEnabled(View_huadong, true)
	GUI:setTag(View_huadong, 66)

	-- Create P_jiemian1
	local P_jiemian1 = GUI:Layout_Create(View_huadong, "P_jiemian1", 0.00, 300.00, 200.00, 200.00, false)
	GUI:Layout_setBackGroundColorType(P_jiemian1, 1)
	GUI:Layout_setBackGroundColor(P_jiemian1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(P_jiemian1, 0)
	GUI:setAnchorPoint(P_jiemian1, 0.00, 1.00)
	GUI:setTouchEnabled(P_jiemian1, true)
	GUI:setTag(P_jiemian1, 67)

	-- Create btn_zs1
	local btn_zs1 = GUI:Button_Create(P_jiemian1, "btn_zs1", 108.00, -79.67, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(btn_zs1, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(btn_zs1, 15, 15, 11, 11)
	GUI:setContentSize(btn_zs1, 125, 39)
	GUI:setIgnoreContentAdaptWithSize(btn_zs1, false)
	GUI:Button_setTitleText(btn_zs1, "")
	GUI:Button_setTitleColor(btn_zs1, "#414146")
	GUI:Button_setTitleFontSize(btn_zs1, 14)
	GUI:Button_titleDisableOutLine(btn_zs1)
	GUI:setAnchorPoint(btn_zs1, 0.50, 0.50)
	GUI:setTouchEnabled(btn_zs1, true)
	GUI:setTag(btn_zs1, 68)

	-- Create tx_btn_text1
	local tx_btn_text1 = GUI:Text_Create(btn_zs1, "tx_btn_text1", 62.50, 19.54, 18, "#c0c0c0", [[49888灵符]])
	GUI:setAnchorPoint(tx_btn_text1, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_text1, false)
	GUI:setTag(tx_btn_text1, 69)
	GUI:Text_enableOutline(tx_btn_text1, "#000000", 1)

	-- Create img_hongdian1
	local img_hongdian1 = GUI:Image_Create(btn_zs1, "img_hongdian1", 112.00, 28.00, "res/custom/common/img_2.png")
	GUI:setAnchorPoint(img_hongdian1, 0.50, 0.50)
	GUI:setTouchEnabled(img_hongdian1, false)
	GUI:setTag(img_hongdian1, 212)
	GUI:setVisible(img_hongdian1, false)

	-- Create bg_kuang1
	local bg_kuang1 = GUI:Image_Create(P_jiemian1, "bg_kuang1", 0.00, 211.00, "res/custom/zhigou/2.png")
	GUI:setAnchorPoint(bg_kuang1, 0.00, 1.00)
	GUI:setTouchEnabled(bg_kuang1, true)
	GUI:setTag(bg_kuang1, 70)

	-- Create tx_tian1
	local tx_tian1 = GUI:Text_Create(P_jiemian1, "tx_tian1", 66.54, -35.41, 16, "#4ae74a", [[限购:]])
	GUI:setAnchorPoint(tx_tian1, 0.00, 0.50)
	GUI:setTouchEnabled(tx_tian1, false)
	GUI:setTag(tx_tian1, 71)
	GUI:Text_enableOutline(tx_tian1, "#000000", 1)

	-- Create tx_chongzhi1
	local tx_chongzhi1 = GUI:Text_Create(P_jiemian1, "tx_chongzhi1", 105.33, -35.41, 16, "#4ae74a", [[0/1]])
	GUI:setAnchorPoint(tx_chongzhi1, 0.00, 0.50)
	GUI:setTouchEnabled(tx_chongzhi1, false)
	GUI:setTag(tx_chongzhi1, 72)
	GUI:Text_enableOutline(tx_chongzhi1, "#000000", 1)

	-- Create img_shoukong1
	local img_shoukong1 = GUI:Image_Create(P_jiemian1, "img_shoukong1", 106.96, -80.45, "res/custom/zhigou/zhigou11.png")
	GUI:setContentSize(img_shoukong1, 112.83999633789, 44.520000457764)
	GUI:setIgnoreContentAdaptWithSize(img_shoukong1, false)
	GUI:setAnchorPoint(img_shoukong1, 0.50, 0.50)
	GUI:setTouchEnabled(img_shoukong1, false)
	GUI:setTag(img_shoukong1, 324)
	GUI:setVisible(img_shoukong1, false)

	-- Create P_jiemian2
	local P_jiemian2 = GUI:Layout_Create(View_huadong, "P_jiemian2", 185.00, 300.00, 200.00, 200.00, false)
	GUI:Layout_setBackGroundColorType(P_jiemian2, 1)
	GUI:Layout_setBackGroundColor(P_jiemian2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(P_jiemian2, 0)
	GUI:setAnchorPoint(P_jiemian2, 0.00, 1.00)
	GUI:setTouchEnabled(P_jiemian2, true)
	GUI:setTag(P_jiemian2, 73)

	-- Create btn_zs2
	local btn_zs2 = GUI:Button_Create(P_jiemian2, "btn_zs2", 108.00, -78.43, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(btn_zs2, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(btn_zs2, 15, 15, 11, 11)
	GUI:setContentSize(btn_zs2, 125, 39)
	GUI:setIgnoreContentAdaptWithSize(btn_zs2, false)
	GUI:Button_setTitleText(btn_zs2, "")
	GUI:Button_setTitleColor(btn_zs2, "#414146")
	GUI:Button_setTitleFontSize(btn_zs2, 14)
	GUI:Button_titleDisableOutLine(btn_zs2)
	GUI:setAnchorPoint(btn_zs2, 0.50, 0.50)
	GUI:setTouchEnabled(btn_zs2, true)
	GUI:setTag(btn_zs2, 74)

	-- Create tx_btn_text2
	local tx_btn_text2 = GUI:Text_Create(btn_zs2, "tx_btn_text2", 62.50, 19.54, 18, "#c0c0c0", [[149888灵符]])
	GUI:setAnchorPoint(tx_btn_text2, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_text2, false)
	GUI:setTag(tx_btn_text2, 75)
	GUI:Text_enableOutline(tx_btn_text2, "#000000", 1)

	-- Create img_hongdian2
	local img_hongdian2 = GUI:Image_Create(btn_zs2, "img_hongdian2", 112.00, 28.00, "res/custom/common/img_2.png")
	GUI:setAnchorPoint(img_hongdian2, 0.50, 0.50)
	GUI:setTouchEnabled(img_hongdian2, false)
	GUI:setTag(img_hongdian2, 213)
	GUI:setVisible(img_hongdian2, false)

	-- Create bg_kuang2
	local bg_kuang2 = GUI:Image_Create(P_jiemian2, "bg_kuang2", 0.00, 211.00, "res/custom/zhigou/2.png")
	GUI:setAnchorPoint(bg_kuang2, 0.00, 1.00)
	GUI:setTouchEnabled(bg_kuang2, true)
	GUI:setTag(bg_kuang2, 76)

	-- Create tx_tian2
	local tx_tian2 = GUI:Text_Create(P_jiemian2, "tx_tian2", 66.54, -35.41, 16, "#4ae74a", [[限购:]])
	GUI:setAnchorPoint(tx_tian2, 0.00, 0.50)
	GUI:setTouchEnabled(tx_tian2, false)
	GUI:setTag(tx_tian2, 77)
	GUI:Text_enableOutline(tx_tian2, "#000000", 1)

	-- Create tx_chongzhi2
	local tx_chongzhi2 = GUI:Text_Create(P_jiemian2, "tx_chongzhi2", 105.33, -35.41, 16, "#4ae74a", [[0/1]])
	GUI:setAnchorPoint(tx_chongzhi2, 0.00, 0.50)
	GUI:setTouchEnabled(tx_chongzhi2, false)
	GUI:setTag(tx_chongzhi2, 78)
	GUI:Text_enableOutline(tx_chongzhi2, "#000000", 1)

	-- Create img_shoukong2
	local img_shoukong2 = GUI:Image_Create(P_jiemian2, "img_shoukong2", 109.46, -80.45, "res/custom/zhigou/zhigou11.png")
	GUI:setContentSize(img_shoukong2, 112.83999633789, 44.520000457764)
	GUI:setIgnoreContentAdaptWithSize(img_shoukong2, false)
	GUI:setAnchorPoint(img_shoukong2, 0.50, 0.50)
	GUI:setTouchEnabled(img_shoukong2, false)
	GUI:setTag(img_shoukong2, 323)
	GUI:setVisible(img_shoukong2, false)

	-- Create P_jiemian3
	local P_jiemian3 = GUI:Layout_Create(View_huadong, "P_jiemian3", 375.00, 300.00, 200.00, 200.00, false)
	GUI:Layout_setBackGroundColorType(P_jiemian3, 1)
	GUI:Layout_setBackGroundColor(P_jiemian3, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(P_jiemian3, 0)
	GUI:setAnchorPoint(P_jiemian3, 0.00, 1.00)
	GUI:setTouchEnabled(P_jiemian3, true)
	GUI:setTag(P_jiemian3, 79)

	-- Create btn_zs3
	local btn_zs3 = GUI:Button_Create(P_jiemian3, "btn_zs3", 108.00, -78.43, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(btn_zs3, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(btn_zs3, 15, 15, 11, 11)
	GUI:setContentSize(btn_zs3, 125, 39)
	GUI:setIgnoreContentAdaptWithSize(btn_zs3, false)
	GUI:Button_setTitleText(btn_zs3, "")
	GUI:Button_setTitleColor(btn_zs3, "#414146")
	GUI:Button_setTitleFontSize(btn_zs3, 14)
	GUI:Button_titleDisableOutLine(btn_zs3)
	GUI:setAnchorPoint(btn_zs3, 0.50, 0.50)
	GUI:setTouchEnabled(btn_zs3, true)
	GUI:setTag(btn_zs3, 80)

	-- Create tx_btn_text3
	local tx_btn_text3 = GUI:Text_Create(btn_zs3, "tx_btn_text3", 62.50, 19.54, 18, "#c0c0c0", [[299888灵符]])
	GUI:setAnchorPoint(tx_btn_text3, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_text3, false)
	GUI:setTag(tx_btn_text3, 81)
	GUI:Text_enableOutline(tx_btn_text3, "#000000", 1)

	-- Create img_hongdian3
	local img_hongdian3 = GUI:Image_Create(btn_zs3, "img_hongdian3", 112.00, 28.00, "res/custom/common/img_2.png")
	GUI:setAnchorPoint(img_hongdian3, 0.50, 0.50)
	GUI:setTouchEnabled(img_hongdian3, false)
	GUI:setTag(img_hongdian3, 214)
	GUI:setVisible(img_hongdian3, false)

	-- Create bg_kuang3
	local bg_kuang3 = GUI:Image_Create(P_jiemian3, "bg_kuang3", 1.00, 211.00, "res/custom/zhigou/2.png")
	GUI:setAnchorPoint(bg_kuang3, 0.00, 1.00)
	GUI:setTouchEnabled(bg_kuang3, true)
	GUI:setTag(bg_kuang3, 82)

	-- Create tx_tian3
	local tx_tian3 = GUI:Text_Create(P_jiemian3, "tx_tian3", 66.54, -35.41, 16, "#4ae74a", [[限购:]])
	GUI:setAnchorPoint(tx_tian3, 0.00, 0.50)
	GUI:setTouchEnabled(tx_tian3, false)
	GUI:setTag(tx_tian3, 83)
	GUI:Text_enableOutline(tx_tian3, "#000000", 1)

	-- Create tx_chongzhi3
	local tx_chongzhi3 = GUI:Text_Create(P_jiemian3, "tx_chongzhi3", 105.33, -35.41, 16, "#4ae74a", [[0/1]])
	GUI:setAnchorPoint(tx_chongzhi3, 0.00, 0.50)
	GUI:setScaleX(tx_chongzhi3, 0.94)
	GUI:setTouchEnabled(tx_chongzhi3, false)
	GUI:setTag(tx_chongzhi3, 84)
	GUI:Text_enableOutline(tx_chongzhi3, "#000000", 1)

	-- Create img_shoukong3
	local img_shoukong3 = GUI:Image_Create(P_jiemian3, "img_shoukong3", 106.96, -80.45, "res/custom/zhigou/zhigou11.png")
	GUI:setContentSize(img_shoukong3, 112.83999633789, 44.520000457764)
	GUI:setIgnoreContentAdaptWithSize(img_shoukong3, false)
	GUI:setAnchorPoint(img_shoukong3, 0.50, 0.50)
	GUI:setTouchEnabled(img_shoukong3, false)
	GUI:setTag(img_shoukong3, 322)
	GUI:setVisible(img_shoukong3, false)

	-- Create bg_hdimg
	local bg_hdimg = GUI:Image_Create(p_huodong, "bg_hdimg", 302.27, 372.08, "res/custom/zhigou/1.png")
	GUI:setAnchorPoint(bg_hdimg, 0.50, 0.50)
	GUI:setTouchEnabled(bg_hdimg, false)
	GUI:setTag(bg_hdimg, 103)

	-- Create bg_dazhi
	local bg_dazhi = GUI:Image_Create(p_huodong, "bg_dazhi", 302.27, 372.08, "res/custom/zhigou/4.png")
	GUI:setAnchorPoint(bg_dazhi, 0.50, 0.50)
	GUI:setTouchEnabled(bg_dazhi, false)
	GUI:setTag(bg_dazhi, 104)

	-- Create bg_xiaozhi
	local bg_xiaozhi = GUI:Image_Create(p_huodong, "bg_xiaozhi", 299.90, 333.98, "res/custom/zhigou/5.png")
	GUI:setAnchorPoint(bg_xiaozhi, 0.50, 0.50)
	GUI:setTouchEnabled(bg_xiaozhi, false)
	GUI:setTag(bg_xiaozhi, 105)
end
return ui