local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 1490)

	-- Create img_di
	local img_di = GUI:Image_Create(nd_root, "img_di", 11.00, -33.00, "res/custom/zhigou/7.jpg")
	GUI:setAnchorPoint(img_di, 0.50, 0.50)
	GUI:setTouchEnabled(img_di, false)
	GUI:setTag(img_di, 256)

	-- Create p_huodong
	local p_huodong = GUI:Layout_Create(img_di, "p_huodong", 157.85, 19.49, 200.00, 200.00, false)
	GUI:setTouchEnabled(p_huodong, true)
	GUI:setTag(p_huodong, 257)

	-- Create View_huadong
	local View_huadong = GUI:ScrollView_Create(p_huodong, "View_huadong", 1.23, 310.00, 580.00, 300.00, 1)
	GUI:ScrollView_setBounceEnabled(View_huadong, true)
	GUI:ScrollView_setInnerContainerSize(View_huadong, 580.00, 430.00)
	GUI:setAnchorPoint(View_huadong, 0.00, 1.00)
	GUI:setTouchEnabled(View_huadong, true)
	GUI:setTag(View_huadong, 258)

	-- Create P_jiemian1
	local P_jiemian1 = GUI:Layout_Create(View_huadong, "P_jiemian1", 0.00, 429.49, 580.00, 90.00, false)
	GUI:Layout_setBackGroundColorType(P_jiemian1, 1)
	GUI:Layout_setBackGroundColor(P_jiemian1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(P_jiemian1, 0)
	GUI:setAnchorPoint(P_jiemian1, 0.00, 1.00)
	GUI:setTouchEnabled(P_jiemian1, true)
	GUI:setTag(P_jiemian1, 259)

	-- Create P_biaoji1
	local P_biaoji1 = GUI:Layout_Create(P_jiemian1, "P_biaoji1", 0.00, 0.00, 580.00, 90.00, false)
	GUI:setTouchEnabled(P_biaoji1, true)
	GUI:setTag(P_biaoji1, 349)

	-- Create btn_zs1
	local btn_zs1 = GUI:Button_Create(P_jiemian1, "btn_zs1", 500.00, 30.00, "res/custom/common/btn_2_1.png")
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
	GUI:setTag(btn_zs1, 260)

	-- Create tx_btn_text1
	local tx_btn_text1 = GUI:Text_Create(btn_zs1, "tx_btn_text1", 60.50, 19.54, 18, "#c0c0c0", [[未 达 成]])
	GUI:setAnchorPoint(tx_btn_text1, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_text1, false)
	GUI:setTag(tx_btn_text1, 261)
	GUI:Text_enableOutline(tx_btn_text1, "#000000", 1)

	-- Create img_hongdian1
	local img_hongdian1 = GUI:Image_Create(btn_zs1, "img_hongdian1", 112.00, 28.00, "res/custom/common/img_2.png")
	GUI:setAnchorPoint(img_hongdian1, 0.50, 0.50)
	GUI:setTouchEnabled(img_hongdian1, false)
	GUI:setTag(img_hongdian1, 105)
	GUI:setVisible(img_hongdian1, false)

	-- Create tx_tian1
	local tx_tian1 = GUI:Text_Create(P_jiemian1, "tx_tian1", 13.53, 73.00, 16, "#c0c0c0", [[累计充值金额达到]])
	GUI:setAnchorPoint(tx_tian1, 0.00, 0.50)
	GUI:setTouchEnabled(tx_tian1, false)
	GUI:setTag(tx_tian1, 263)
	GUI:Text_enableOutline(tx_tian1, "#000000", 1)

	-- Create tx_chongzhi1
	local tx_chongzhi1 = GUI:Text_Create(P_jiemian1, "tx_chongzhi1", 143.06, 74.00, 16, "#44ddff", [[(0/28)]])
	GUI:setAnchorPoint(tx_chongzhi1, 0.00, 0.50)
	GUI:setTouchEnabled(tx_chongzhi1, false)
	GUI:setTag(tx_chongzhi1, 264)
	GUI:Text_enableOutline(tx_chongzhi1, "#000000", 1)

	-- Create P_jiemian2
	local P_jiemian2 = GUI:Layout_Create(View_huadong, "P_jiemian2", 0.00, 329.49, 580.00, 90.00, false)
	GUI:Layout_setBackGroundColorType(P_jiemian2, 1)
	GUI:Layout_setBackGroundColor(P_jiemian2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(P_jiemian2, 0)
	GUI:setAnchorPoint(P_jiemian2, 0.00, 1.00)
	GUI:setTouchEnabled(P_jiemian2, true)
	GUI:setTag(P_jiemian2, 281)

	-- Create P_biaoji2
	local P_biaoji2 = GUI:Layout_Create(P_jiemian2, "P_biaoji2", 0.00, 0.00, 580.00, 90.00, false)
	GUI:setTouchEnabled(P_biaoji2, true)
	GUI:setTag(P_biaoji2, 350)

	-- Create btn_zs2
	local btn_zs2 = GUI:Button_Create(P_jiemian2, "btn_zs2", 500.00, 30.00, "res/custom/common/btn_2_1.png")
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
	GUI:setTag(btn_zs2, 282)

	-- Create tx_btn_text2
	local tx_btn_text2 = GUI:Text_Create(btn_zs2, "tx_btn_text2", 60.50, 19.54, 18, "#c0c0c0", [[未 达 成]])
	GUI:setAnchorPoint(tx_btn_text2, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_text2, false)
	GUI:setTag(tx_btn_text2, 283)
	GUI:Text_enableOutline(tx_btn_text2, "#000000", 1)

	-- Create img_hongdian2
	local img_hongdian2 = GUI:Image_Create(btn_zs2, "img_hongdian2", 112.00, 28.00, "res/custom/common/img_2.png")
	GUI:setAnchorPoint(img_hongdian2, 0.50, 0.50)
	GUI:setTouchEnabled(img_hongdian2, false)
	GUI:setTag(img_hongdian2, 106)
	GUI:setVisible(img_hongdian2, false)

	-- Create tx_tian2
	local tx_tian2 = GUI:Text_Create(P_jiemian2, "tx_tian2", 13.53, 73.00, 16, "#c0c0c0", [[累计充值金额达到]])
	GUI:setAnchorPoint(tx_tian2, 0.00, 0.50)
	GUI:setTouchEnabled(tx_tian2, false)
	GUI:setTag(tx_tian2, 284)
	GUI:Text_enableOutline(tx_tian2, "#000000", 1)

	-- Create tx_chongzhi2
	local tx_chongzhi2 = GUI:Text_Create(P_jiemian2, "tx_chongzhi2", 143.06, 74.00, 16, "#44ddff", [[(0/98)]])
	GUI:setAnchorPoint(tx_chongzhi2, 0.00, 0.50)
	GUI:setTouchEnabled(tx_chongzhi2, false)
	GUI:setTag(tx_chongzhi2, 285)
	GUI:Text_enableOutline(tx_chongzhi2, "#000000", 1)

	-- Create P_jiemian3
	local P_jiemian3 = GUI:Layout_Create(View_huadong, "P_jiemian3", 0.00, 231.96, 580.00, 90.00, false)
	GUI:Layout_setBackGroundColorType(P_jiemian3, 1)
	GUI:Layout_setBackGroundColor(P_jiemian3, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(P_jiemian3, 0)
	GUI:setAnchorPoint(P_jiemian3, 0.00, 1.00)
	GUI:setTouchEnabled(P_jiemian3, true)
	GUI:setTag(P_jiemian3, 286)

	-- Create P_biaoji3
	local P_biaoji3 = GUI:Layout_Create(P_jiemian3, "P_biaoji3", 0.00, 0.00, 580.00, 90.00, false)
	GUI:setTouchEnabled(P_biaoji3, true)
	GUI:setTag(P_biaoji3, 351)

	-- Create btn_zs3
	local btn_zs3 = GUI:Button_Create(P_jiemian3, "btn_zs3", 500.00, 30.00, "res/custom/common/btn_2_1.png")
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
	GUI:setTag(btn_zs3, 287)

	-- Create tx_btn_text3
	local tx_btn_text3 = GUI:Text_Create(btn_zs3, "tx_btn_text3", 60.50, 19.54, 18, "#c0c0c0", [[未 达 成]])
	GUI:setAnchorPoint(tx_btn_text3, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_text3, false)
	GUI:setTag(tx_btn_text3, 288)
	GUI:Text_enableOutline(tx_btn_text3, "#000000", 1)

	-- Create img_hongdian3
	local img_hongdian3 = GUI:Image_Create(btn_zs3, "img_hongdian3", 112.00, 28.00, "res/custom/common/img_2.png")
	GUI:setAnchorPoint(img_hongdian3, 0.50, 0.50)
	GUI:setTouchEnabled(img_hongdian3, false)
	GUI:setTag(img_hongdian3, 107)
	GUI:setVisible(img_hongdian3, false)

	-- Create tx_tian3
	local tx_tian3 = GUI:Text_Create(P_jiemian3, "tx_tian3", 13.53, 73.00, 16, "#c0c0c0", [[累计充值金额达到]])
	GUI:setAnchorPoint(tx_tian3, 0.00, 0.50)
	GUI:setTouchEnabled(tx_tian3, false)
	GUI:setTag(tx_tian3, 289)
	GUI:Text_enableOutline(tx_tian3, "#000000", 1)

	-- Create tx_chongzhi3
	local tx_chongzhi3 = GUI:Text_Create(P_jiemian3, "tx_chongzhi3", 143.06, 74.00, 16, "#44ddff", [[(0/298)]])
	GUI:setAnchorPoint(tx_chongzhi3, 0.00, 0.50)
	GUI:setTouchEnabled(tx_chongzhi3, false)
	GUI:setTag(tx_chongzhi3, 290)
	GUI:Text_enableOutline(tx_chongzhi3, "#000000", 1)

	-- Create P_jiemian4
	local P_jiemian4 = GUI:Layout_Create(View_huadong, "P_jiemian4", 0.00, 129.49, 580.00, 90.00, false)
	GUI:Layout_setBackGroundColorType(P_jiemian4, 1)
	GUI:Layout_setBackGroundColor(P_jiemian4, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(P_jiemian4, 0)
	GUI:setAnchorPoint(P_jiemian4, 0.00, 1.00)
	GUI:setTouchEnabled(P_jiemian4, true)
	GUI:setTag(P_jiemian4, 291)

	-- Create P_biaoji4
	local P_biaoji4 = GUI:Layout_Create(P_jiemian4, "P_biaoji4", 0.00, 0.00, 580.00, 90.00, false)
	GUI:setTouchEnabled(P_biaoji4, true)
	GUI:setTag(P_biaoji4, 352)

	-- Create btn_zs4
	local btn_zs4 = GUI:Button_Create(P_jiemian4, "btn_zs4", 500.00, 30.00, "res/custom/common/btn_2_1.png")
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
	GUI:setTag(btn_zs4, 292)

	-- Create tx_btn_text4
	local tx_btn_text4 = GUI:Text_Create(btn_zs4, "tx_btn_text4", 60.50, 19.54, 18, "#c0c0c0", [[未 达 成]])
	GUI:setAnchorPoint(tx_btn_text4, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_text4, false)
	GUI:setTag(tx_btn_text4, 293)
	GUI:Text_enableOutline(tx_btn_text4, "#000000", 1)

	-- Create img_hongdian4
	local img_hongdian4 = GUI:Image_Create(btn_zs4, "img_hongdian4", 112.00, 28.00, "res/custom/common/img_2.png")
	GUI:setAnchorPoint(img_hongdian4, 0.50, 0.50)
	GUI:setTouchEnabled(img_hongdian4, false)
	GUI:setTag(img_hongdian4, 108)
	GUI:setVisible(img_hongdian4, false)

	-- Create tx_tian4
	local tx_tian4 = GUI:Text_Create(P_jiemian4, "tx_tian4", 13.53, 73.00, 16, "#c0c0c0", [[累计充值金额达到]])
	GUI:setAnchorPoint(tx_tian4, 0.00, 0.50)
	GUI:setTouchEnabled(tx_tian4, false)
	GUI:setTag(tx_tian4, 294)
	GUI:Text_enableOutline(tx_tian4, "#000000", 1)

	-- Create tx_chongzhi4
	local tx_chongzhi4 = GUI:Text_Create(P_jiemian4, "tx_chongzhi4", 143.06, 74.00, 16, "#44ddff", [[(0/998)]])
	GUI:setAnchorPoint(tx_chongzhi4, 0.00, 0.50)
	GUI:setTouchEnabled(tx_chongzhi4, false)
	GUI:setTag(tx_chongzhi4, 295)
	GUI:Text_enableOutline(tx_chongzhi4, "#000000", 1)

	-- Create bg_hdimg
	local bg_hdimg = GUI:Image_Create(p_huodong, "bg_hdimg", 302.27, 372.08, "res/custom/zhigou/1.png")
	GUI:setAnchorPoint(bg_hdimg, 0.50, 0.50)
	GUI:setTouchEnabled(bg_hdimg, false)
	GUI:setTag(bg_hdimg, 277)

	-- Create bg_dazhi
	local bg_dazhi = GUI:Image_Create(p_huodong, "bg_dazhi", 302.27, 372.08, "res/custom/zhigou/4.png")
	GUI:setAnchorPoint(bg_dazhi, 0.50, 0.50)
	GUI:setTouchEnabled(bg_dazhi, false)
	GUI:setTag(bg_dazhi, 278)

	-- Create bg_xiaozhi
	local bg_xiaozhi = GUI:Image_Create(p_huodong, "bg_xiaozhi", 299.90, 333.98, "res/custom/zhigou/5.png")
	GUI:setAnchorPoint(bg_xiaozhi, 0.50, 0.50)
	GUI:setTouchEnabled(bg_xiaozhi, false)
	GUI:setTag(bg_xiaozhi, 279)
end
return ui