local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 1221)

	-- Create img_di
	local img_di = GUI:Image_Create(nd_root, "img_di", 11.00, -33.00, "res/custom/zhigou/7.jpg")
	GUI:setAnchorPoint(img_di, 0.50, 0.50)
	GUI:setTouchEnabled(img_di, false)
	GUI:setTag(img_di, 347)

	-- Create p_huodong
	local p_huodong = GUI:Layout_Create(img_di, "p_huodong", 157.85, 19.49, 200.00, 200.00, false)
	GUI:setTouchEnabled(p_huodong, true)
	GUI:setTag(p_huodong, 221)

	-- Create View_huadong
	local View_huadong = GUI:ScrollView_Create(p_huodong, "View_huadong", 7.38, 4.97, 550.00, 300.00, 2)
	GUI:ScrollView_setBounceEnabled(View_huadong, true)
	GUI:ScrollView_setInnerContainerSize(View_huadong, 1200.00, 300.00)
	GUI:setTouchEnabled(View_huadong, true)
	GUI:setTag(View_huadong, 683)

	-- Create P_jiemian1
	local P_jiemian1 = GUI:Layout_Create(View_huadong, "P_jiemian1", 0.00, 300.00, 200.00, 200.00, false)
	GUI:Layout_setBackGroundColorType(P_jiemian1, 1)
	GUI:Layout_setBackGroundColor(P_jiemian1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(P_jiemian1, 0)
	GUI:setAnchorPoint(P_jiemian1, 0.00, 1.00)
	GUI:setTouchEnabled(P_jiemian1, true)
	GUI:setTag(P_jiemian1, 684)

	-- Create btn_zs1
	local btn_zs1 = GUI:Button_Create(P_jiemian1, "btn_zs1", 108.00, -68.43, "res/custom/common/btn_2_1.png")
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
	GUI:setTag(btn_zs1, 669)

	-- Create tx_btn_text1
	local tx_btn_text1 = GUI:Text_Create(btn_zs1, "tx_btn_text1", 60.50, 19.54, 18, "#c0c0c0", [[领  取]])
	GUI:setAnchorPoint(tx_btn_text1, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_text1, false)
	GUI:setTag(tx_btn_text1, 670)
	GUI:Text_enableOutline(tx_btn_text1, "#000000", 1)

	-- Create img_hongdian1
	local img_hongdian1 = GUI:Image_Create(btn_zs1, "img_hongdian1", 112.00, 28.00, "res/custom/common/img_2.png")
	GUI:setAnchorPoint(img_hongdian1, 0.50, 0.50)
	GUI:setTouchEnabled(img_hongdian1, false)
	GUI:setTag(img_hongdian1, 342)
	GUI:setVisible(img_hongdian1, false)

	-- Create bg_kuang1
	local bg_kuang1 = GUI:Image_Create(P_jiemian1, "bg_kuang1", 0.00, 200.00, "res/custom/leichong/3.png")
	GUI:setAnchorPoint(bg_kuang1, 0.00, 1.00)
	GUI:setTouchEnabled(bg_kuang1, true)
	GUI:setTag(bg_kuang1, 735)

	-- Create tx_tian1
	local tx_tian1 = GUI:Text_Create(P_jiemian1, "tx_tian1", 88.00, 132.00, 16, "#deded6", [[第1天]])
	GUI:setAnchorPoint(tx_tian1, 0.50, 0.50)
	GUI:setTouchEnabled(tx_tian1, false)
	GUI:setTag(tx_tian1, 197)
	GUI:Text_enableOutline(tx_tian1, "#000000", 1)

	-- Create tx_chongzhi1
	local tx_chongzhi1 = GUI:Text_Create(P_jiemian1, "tx_chongzhi1", 129.00, 132.00, 16, "#44ddff", [[(0/1)]])
	GUI:setAnchorPoint(tx_chongzhi1, 0.50, 0.50)
	GUI:setTouchEnabled(tx_chongzhi1, false)
	GUI:setTag(tx_chongzhi1, 198)
	GUI:Text_enableOutline(tx_chongzhi1, "#000000", 1)

	-- Create P_jiemian2
	local P_jiemian2 = GUI:Layout_Create(View_huadong, "P_jiemian2", 200.00, 300.00, 200.00, 200.00, false)
	GUI:Layout_setBackGroundColorType(P_jiemian2, 1)
	GUI:Layout_setBackGroundColor(P_jiemian2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(P_jiemian2, 0)
	GUI:setAnchorPoint(P_jiemian2, 0.00, 1.00)
	GUI:setTouchEnabled(P_jiemian2, true)
	GUI:setTag(P_jiemian2, 57)

	-- Create btn_zs2
	local btn_zs2 = GUI:Button_Create(P_jiemian2, "btn_zs2", 108.00, -68.43, "res/custom/common/btn_2_1.png")
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
	GUI:setTag(btn_zs2, 58)

	-- Create tx_btn_text2
	local tx_btn_text2 = GUI:Text_Create(btn_zs2, "tx_btn_text2", 60.50, 19.54, 18, "#c0c0c0", [[领  取]])
	GUI:setAnchorPoint(tx_btn_text2, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_text2, false)
	GUI:setTag(tx_btn_text2, 59)
	GUI:Text_enableOutline(tx_btn_text2, "#000000", 1)

	-- Create img_hongdian2
	local img_hongdian2 = GUI:Image_Create(btn_zs2, "img_hongdian2", 112.00, 28.00, "res/custom/common/img_2.png")
	GUI:setAnchorPoint(img_hongdian2, 0.50, 0.50)
	GUI:setTouchEnabled(img_hongdian2, false)
	GUI:setTag(img_hongdian2, 343)
	GUI:setVisible(img_hongdian2, false)

	-- Create bg_kuang2
	local bg_kuang2 = GUI:Image_Create(P_jiemian2, "bg_kuang2", 0.00, 200.00, "res/custom/leichong/3.png")
	GUI:setAnchorPoint(bg_kuang2, 0.00, 1.00)
	GUI:setTouchEnabled(bg_kuang2, true)
	GUI:setTag(bg_kuang2, 60)

	-- Create tx_tian2
	local tx_tian2 = GUI:Text_Create(P_jiemian2, "tx_tian2", 88.20, 132.00, 16, "#deded6", [[第2天]])
	GUI:setAnchorPoint(tx_tian2, 0.50, 0.50)
	GUI:setTouchEnabled(tx_tian2, false)
	GUI:setTag(tx_tian2, 207)
	GUI:Text_enableOutline(tx_tian2, "#000000", 1)

	-- Create tx_chongzhi2
	local tx_chongzhi2 = GUI:Text_Create(P_jiemian2, "tx_chongzhi2", 129.20, 132.00, 16, "#44ddff", [[(0/2)]])
	GUI:setAnchorPoint(tx_chongzhi2, 0.50, 0.50)
	GUI:setTouchEnabled(tx_chongzhi2, false)
	GUI:setTag(tx_chongzhi2, 208)
	GUI:Text_enableOutline(tx_chongzhi2, "#000000", 1)

	-- Create P_jiemian3
	local P_jiemian3 = GUI:Layout_Create(View_huadong, "P_jiemian3", 400.00, 300.00, 200.00, 200.00, false)
	GUI:Layout_setBackGroundColorType(P_jiemian3, 1)
	GUI:Layout_setBackGroundColor(P_jiemian3, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(P_jiemian3, 0)
	GUI:setAnchorPoint(P_jiemian3, 0.00, 1.00)
	GUI:setTouchEnabled(P_jiemian3, true)
	GUI:setTag(P_jiemian3, 61)

	-- Create btn_zs3
	local btn_zs3 = GUI:Button_Create(P_jiemian3, "btn_zs3", 109.00, -68.43, "res/custom/common/btn_2_1.png")
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
	GUI:setTag(btn_zs3, 62)

	-- Create tx_btn_text3
	local tx_btn_text3 = GUI:Text_Create(btn_zs3, "tx_btn_text3", 60.50, 19.54, 18, "#c0c0c0", [[领  取]])
	GUI:setAnchorPoint(tx_btn_text3, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_text3, false)
	GUI:setTag(tx_btn_text3, 63)
	GUI:Text_enableOutline(tx_btn_text3, "#000000", 1)

	-- Create img_hongdian3
	local img_hongdian3 = GUI:Image_Create(btn_zs3, "img_hongdian3", 112.00, 28.00, "res/custom/common/img_2.png")
	GUI:setAnchorPoint(img_hongdian3, 0.50, 0.50)
	GUI:setTouchEnabled(img_hongdian3, false)
	GUI:setTag(img_hongdian3, 344)
	GUI:setVisible(img_hongdian3, false)

	-- Create bg_kuang3
	local bg_kuang3 = GUI:Image_Create(P_jiemian3, "bg_kuang3", 1.00, 201.00, "res/custom/leichong/3.png")
	GUI:setAnchorPoint(bg_kuang3, 0.00, 1.00)
	GUI:setTouchEnabled(bg_kuang3, true)
	GUI:setTag(bg_kuang3, 64)

	-- Create tx_tian3
	local tx_tian3 = GUI:Text_Create(P_jiemian3, "tx_tian3", 88.40, 132.00, 16, "#deded6", [[第3天]])
	GUI:setAnchorPoint(tx_tian3, 0.50, 0.50)
	GUI:setTouchEnabled(tx_tian3, false)
	GUI:setTag(tx_tian3, 209)
	GUI:Text_enableOutline(tx_tian3, "#000000", 1)

	-- Create tx_chongzhi3
	local tx_chongzhi3 = GUI:Text_Create(P_jiemian3, "tx_chongzhi3", 129.40, 132.00, 16, "#44ddff", [[(0/3)]])
	GUI:setAnchorPoint(tx_chongzhi3, 0.50, 0.50)
	GUI:setTouchEnabled(tx_chongzhi3, false)
	GUI:setTag(tx_chongzhi3, 210)
	GUI:Text_enableOutline(tx_chongzhi3, "#000000", 1)

	-- Create P_jiemian4
	local P_jiemian4 = GUI:Layout_Create(View_huadong, "P_jiemian4", 600.00, 300.00, 200.00, 200.00, false)
	GUI:Layout_setBackGroundColorType(P_jiemian4, 1)
	GUI:Layout_setBackGroundColor(P_jiemian4, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(P_jiemian4, 0)
	GUI:setAnchorPoint(P_jiemian4, 0.00, 1.00)
	GUI:setTouchEnabled(P_jiemian4, true)
	GUI:setTag(P_jiemian4, 65)

	-- Create btn_zs4
	local btn_zs4 = GUI:Button_Create(P_jiemian4, "btn_zs4", 108.00, -68.43, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(btn_zs4, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(btn_zs4, 15, 15, 11, 11)
	GUI:setContentSize(btn_zs4, 125, 39)
	GUI:setIgnoreContentAdaptWithSize(btn_zs4, false)
	GUI:Button_setTitleText(btn_zs4, "")
	GUI:Button_setTitleColor(btn_zs4, "#414146")
	GUI:Button_setTitleFontSize(btn_zs4, 14)
	GUI:Button_titleDisableOutLine(btn_zs4)
	GUI:setAnchorPoint(btn_zs4, 0.50, 0.50)
	GUI:setTouchEnabled(btn_zs4, true)
	GUI:setTag(btn_zs4, 66)

	-- Create tx_btn_text4
	local tx_btn_text4 = GUI:Text_Create(btn_zs4, "tx_btn_text4", 60.50, 19.54, 18, "#c0c0c0", [[领  取]])
	GUI:setAnchorPoint(tx_btn_text4, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_text4, false)
	GUI:setTag(tx_btn_text4, 67)
	GUI:Text_enableOutline(tx_btn_text4, "#000000", 1)

	-- Create img_hongdian4
	local img_hongdian4 = GUI:Image_Create(btn_zs4, "img_hongdian4", 112.00, 28.00, "res/custom/common/img_2.png")
	GUI:setAnchorPoint(img_hongdian4, 0.50, 0.50)
	GUI:setTouchEnabled(img_hongdian4, false)
	GUI:setTag(img_hongdian4, 345)
	GUI:setVisible(img_hongdian4, false)

	-- Create bg_kuang4
	local bg_kuang4 = GUI:Image_Create(P_jiemian4, "bg_kuang4", 0.00, 200.00, "res/custom/leichong/3.png")
	GUI:setAnchorPoint(bg_kuang4, 0.00, 1.00)
	GUI:setTouchEnabled(bg_kuang4, true)
	GUI:setTag(bg_kuang4, 68)

	-- Create tx_tian4
	local tx_tian4 = GUI:Text_Create(P_jiemian4, "tx_tian4", 88.60, 132.00, 16, "#deded6", [[第4天]])
	GUI:setAnchorPoint(tx_tian4, 0.50, 0.50)
	GUI:setTouchEnabled(tx_tian4, false)
	GUI:setTag(tx_tian4, 211)
	GUI:Text_enableOutline(tx_tian4, "#000000", 1)

	-- Create tx_chongzhi4
	local tx_chongzhi4 = GUI:Text_Create(P_jiemian4, "tx_chongzhi4", 129.60, 132.00, 16, "#44ddff", [[(0/4)]])
	GUI:setAnchorPoint(tx_chongzhi4, 0.50, 0.50)
	GUI:setTouchEnabled(tx_chongzhi4, false)
	GUI:setTag(tx_chongzhi4, 212)
	GUI:Text_enableOutline(tx_chongzhi4, "#000000", 1)

	-- Create P_jiemian5
	local P_jiemian5 = GUI:Layout_Create(View_huadong, "P_jiemian5", 800.00, 300.00, 200.00, 200.00, false)
	GUI:Layout_setBackGroundColorType(P_jiemian5, 1)
	GUI:Layout_setBackGroundColor(P_jiemian5, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(P_jiemian5, 0)
	GUI:setAnchorPoint(P_jiemian5, 0.00, 1.00)
	GUI:setTouchEnabled(P_jiemian5, true)
	GUI:setTag(P_jiemian5, 69)

	-- Create btn_zs5
	local btn_zs5 = GUI:Button_Create(P_jiemian5, "btn_zs5", 108.00, -68.43, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(btn_zs5, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(btn_zs5, 15, 15, 11, 11)
	GUI:setContentSize(btn_zs5, 125, 39)
	GUI:setIgnoreContentAdaptWithSize(btn_zs5, false)
	GUI:Button_setTitleText(btn_zs5, "")
	GUI:Button_setTitleColor(btn_zs5, "#414146")
	GUI:Button_setTitleFontSize(btn_zs5, 14)
	GUI:Button_titleDisableOutLine(btn_zs5)
	GUI:setAnchorPoint(btn_zs5, 0.50, 0.50)
	GUI:setTouchEnabled(btn_zs5, true)
	GUI:setTag(btn_zs5, 70)

	-- Create tx_btn_text5
	local tx_btn_text5 = GUI:Text_Create(btn_zs5, "tx_btn_text5", 60.50, 19.54, 18, "#c0c0c0", [[领  取]])
	GUI:setAnchorPoint(tx_btn_text5, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_text5, false)
	GUI:setTag(tx_btn_text5, 71)
	GUI:Text_enableOutline(tx_btn_text5, "#000000", 1)

	-- Create img_hongdian5
	local img_hongdian5 = GUI:Image_Create(btn_zs5, "img_hongdian5", 112.00, 28.00, "res/custom/common/img_2.png")
	GUI:setAnchorPoint(img_hongdian5, 0.50, 0.50)
	GUI:setTouchEnabled(img_hongdian5, false)
	GUI:setTag(img_hongdian5, 346)
	GUI:setVisible(img_hongdian5, false)

	-- Create bg_kuang5
	local bg_kuang5 = GUI:Image_Create(P_jiemian5, "bg_kuang5", 0.00, 200.00, "res/custom/leichong/3.png")
	GUI:setAnchorPoint(bg_kuang5, 0.00, 1.00)
	GUI:setTouchEnabled(bg_kuang5, true)
	GUI:setTag(bg_kuang5, 72)

	-- Create tx_tian5
	local tx_tian5 = GUI:Text_Create(P_jiemian5, "tx_tian5", 88.80, 132.00, 16, "#deded6", [[第5天]])
	GUI:setAnchorPoint(tx_tian5, 0.50, 0.50)
	GUI:setTouchEnabled(tx_tian5, false)
	GUI:setTag(tx_tian5, 213)
	GUI:Text_enableOutline(tx_tian5, "#000000", 1)

	-- Create tx_chongzhi5
	local tx_chongzhi5 = GUI:Text_Create(P_jiemian5, "tx_chongzhi5", 129.80, 132.00, 16, "#44ddff", [[(0/5)]])
	GUI:setAnchorPoint(tx_chongzhi5, 0.50, 0.50)
	GUI:setTouchEnabled(tx_chongzhi5, false)
	GUI:setTag(tx_chongzhi5, 214)
	GUI:Text_enableOutline(tx_chongzhi5, "#000000", 1)

	-- Create P_jiemian6
	local P_jiemian6 = GUI:Layout_Create(View_huadong, "P_jiemian6", 1000.00, 300.00, 200.00, 200.00, false)
	GUI:Layout_setBackGroundColorType(P_jiemian6, 1)
	GUI:Layout_setBackGroundColor(P_jiemian6, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(P_jiemian6, 0)
	GUI:setAnchorPoint(P_jiemian6, 0.00, 1.00)
	GUI:setTouchEnabled(P_jiemian6, true)
	GUI:setTag(P_jiemian6, 73)

	-- Create btn_zs6
	local btn_zs6 = GUI:Button_Create(P_jiemian6, "btn_zs6", 108.00, -68.43, "res/custom/common/btn_2_1.png")
	GUI:Button_loadTexturePressed(btn_zs6, "res/custom/common/btn_2_2.png")
	GUI:Button_setScale9Slice(btn_zs6, 15, 15, 11, 11)
	GUI:setContentSize(btn_zs6, 125, 39)
	GUI:setIgnoreContentAdaptWithSize(btn_zs6, false)
	GUI:Button_setTitleText(btn_zs6, "")
	GUI:Button_setTitleColor(btn_zs6, "#414146")
	GUI:Button_setTitleFontSize(btn_zs6, 14)
	GUI:Button_titleDisableOutLine(btn_zs6)
	GUI:setAnchorPoint(btn_zs6, 0.50, 0.50)
	GUI:setTouchEnabled(btn_zs6, true)
	GUI:setTag(btn_zs6, 74)

	-- Create tx_btn_text6
	local tx_btn_text6 = GUI:Text_Create(btn_zs6, "tx_btn_text6", 60.50, 19.54, 18, "#c0c0c0", [[领  取]])
	GUI:setAnchorPoint(tx_btn_text6, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_text6, false)
	GUI:setTag(tx_btn_text6, 75)
	GUI:Text_enableOutline(tx_btn_text6, "#000000", 1)

	-- Create img_hongdian6
	local img_hongdian6 = GUI:Image_Create(btn_zs6, "img_hongdian6", 112.00, 28.00, "res/custom/common/img_2.png")
	GUI:setAnchorPoint(img_hongdian6, 0.50, 0.50)
	GUI:setTouchEnabled(img_hongdian6, false)
	GUI:setTag(img_hongdian6, 347)
	GUI:setVisible(img_hongdian6, false)

	-- Create bg_kuang6
	local bg_kuang6 = GUI:Image_Create(P_jiemian6, "bg_kuang6", 0.00, 200.00, "res/custom/leichong/3.png")
	GUI:setAnchorPoint(bg_kuang6, 0.00, 1.00)
	GUI:setTouchEnabled(bg_kuang6, true)
	GUI:setTag(bg_kuang6, 76)

	-- Create tx_tian6
	local tx_tian6 = GUI:Text_Create(P_jiemian6, "tx_tian6", 89.00, 132.00, 16, "#deded6", [[第6天]])
	GUI:setAnchorPoint(tx_tian6, 0.50, 0.50)
	GUI:setTouchEnabled(tx_tian6, false)
	GUI:setTag(tx_tian6, 215)
	GUI:Text_enableOutline(tx_tian6, "#000000", 1)

	-- Create tx_chongzhi6
	local tx_chongzhi6 = GUI:Text_Create(P_jiemian6, "tx_chongzhi6", 130.00, 132.00, 16, "#44ddff", [[(0/6)]])
	GUI:setAnchorPoint(tx_chongzhi6, 0.50, 0.50)
	GUI:setTouchEnabled(tx_chongzhi6, false)
	GUI:setTag(tx_chongzhi6, 216)
	GUI:Text_enableOutline(tx_chongzhi6, "#000000", 1)

	-- Create bg_hdimg
	local bg_hdimg = GUI:Image_Create(p_huodong, "bg_hdimg", 302.27, 372.08, "res/custom/zhigou/1.png")
	GUI:setAnchorPoint(bg_hdimg, 0.50, 0.50)
	GUI:setTouchEnabled(bg_hdimg, false)
	GUI:setTag(bg_hdimg, 218)

	-- Create bg_dazhi
	local bg_dazhi = GUI:Image_Create(p_huodong, "bg_dazhi", 302.27, 372.08, "res/custom/zhigou/8.png")
	GUI:setAnchorPoint(bg_dazhi, 0.50, 0.50)
	GUI:setTouchEnabled(bg_dazhi, false)
	GUI:setTag(bg_dazhi, 217)

	-- Create bg_xiaozhi
	local bg_xiaozhi = GUI:Image_Create(p_huodong, "bg_xiaozhi", 299.90, 333.98, "res/custom/zhigou/9.png")
	GUI:setAnchorPoint(bg_xiaozhi, 0.50, 0.50)
	GUI:setTouchEnabled(bg_xiaozhi, false)
	GUI:setTag(bg_xiaozhi, 219)
end
return ui