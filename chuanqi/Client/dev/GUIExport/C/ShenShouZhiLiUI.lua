local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create bg_close
	local bg_close = GUI:Image_Create(Layer, "bg_close", -0.58, 0.58, "res/custom/common/bg_main_6.png")
	GUI:setContentSize(bg_close, 1136, 640)
	GUI:setIgnoreContentAdaptWithSize(bg_close, false)
	GUI:setOpacity(bg_close, 0)
	GUI:setTouchEnabled(bg_close, true)
	GUI:setTag(bg_close, 620)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 679)

	-- Create img_bg1
	local img_bg1 = GUI:Image_Create(nd_root, "img_bg1", 14.00, -2.00, "res/custom/shenshouzhili/sszl_1.png")
	GUI:setAnchorPoint(img_bg1, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg1, true)
	GUI:setTag(img_bg1, 680)

	-- Create Image_sszlz_1
	local Image_sszlz_1 = GUI:Image_Create(img_bg1, "Image_sszlz_1", 128.30, 242.00, "res/custom/shenshouzhili/sszl_6-1.png")
	GUI:setAnchorPoint(Image_sszlz_1, 0.50, 0.50)
	GUI:setTouchEnabled(Image_sszlz_1, false)
	GUI:setTag(Image_sszlz_1, 802)

	-- Create Image_sszlz_2
	local Image_sszlz_2 = GUI:Image_Create(img_bg1, "Image_sszlz_2", 264.86, 242.00, "res/custom/shenshouzhili/sszl_7-1.png")
	GUI:setAnchorPoint(Image_sszlz_2, 0.50, 0.50)
	GUI:setTouchEnabled(Image_sszlz_2, false)
	GUI:setTag(Image_sszlz_2, 803)

	-- Create Image_sszlz_3
	local Image_sszlz_3 = GUI:Image_Create(img_bg1, "Image_sszlz_3", 401.41, 242.00, "res/custom/shenshouzhili/sszl_8-1.png")
	GUI:setAnchorPoint(Image_sszlz_3, 0.50, 0.50)
	GUI:setTouchEnabled(Image_sszlz_3, false)
	GUI:setTag(Image_sszlz_3, 804)

	-- Create Image_sszlz_4
	local Image_sszlz_4 = GUI:Image_Create(img_bg1, "Image_sszlz_4", 535.97, 242.00, "res/custom/shenshouzhili/sszl_9-1.png")
	GUI:setAnchorPoint(Image_sszlz_4, 0.50, 0.50)
	GUI:setTouchEnabled(Image_sszlz_4, false)
	GUI:setTag(Image_sszlz_4, 805)

	-- Create tx_title
	local tx_title = GUI:Text_Create(img_bg1, "tx_title", 330.22, 411.89, 20, "#d6c6ad", [[神兽之力]])
	GUI:setAnchorPoint(tx_title, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 681)
	GUI:Text_enableOutline(tx_title, "#000000", 2)

	-- Create btn_ss_1
	local btn_ss_1 = GUI:Button_Create(img_bg1, "btn_ss_1", 125.39, 59.91, "res/custom/shenshouzhili/sszl_10.png")
	GUI:Button_loadTexturePressed(btn_ss_1, "res/custom/shenshouzhili/sszl_11.png")
	GUI:Button_setScale9Slice(btn_ss_1, 15, 15, 11, 11)
	GUI:setContentSize(btn_ss_1, 133, 56)
	GUI:setIgnoreContentAdaptWithSize(btn_ss_1, false)
	GUI:Button_setTitleText(btn_ss_1, "")
	GUI:Button_setTitleColor(btn_ss_1, "#414146")
	GUI:Button_setTitleFontSize(btn_ss_1, 14)
	GUI:Button_titleDisableOutLine(btn_ss_1)
	GUI:setAnchorPoint(btn_ss_1, 0.50, 0.50)
	GUI:setTouchEnabled(btn_ss_1, true)
	GUI:setTag(btn_ss_1, 796)

	-- Create btn_ss_2
	local btn_ss_2 = GUI:Button_Create(img_bg1, "btn_ss_2", 261.91, 59.91, "res/custom/shenshouzhili/sszl_12.png")
	GUI:Button_loadTexturePressed(btn_ss_2, "res/custom/shenshouzhili/sszl_13.png")
	GUI:Button_setScale9Slice(btn_ss_2, 15, 15, 11, 11)
	GUI:setContentSize(btn_ss_2, 133, 56)
	GUI:setIgnoreContentAdaptWithSize(btn_ss_2, false)
	GUI:Button_setTitleText(btn_ss_2, "")
	GUI:Button_setTitleColor(btn_ss_2, "#414146")
	GUI:Button_setTitleFontSize(btn_ss_2, 14)
	GUI:Button_titleDisableOutLine(btn_ss_2)
	GUI:setAnchorPoint(btn_ss_2, 0.50, 0.50)
	GUI:setTouchEnabled(btn_ss_2, true)
	GUI:setTag(btn_ss_2, 799)

	-- Create btn_ss_3
	local btn_ss_3 = GUI:Button_Create(img_bg1, "btn_ss_3", 398.43, 59.91, "res/custom/shenshouzhili/sszl_14.png")
	GUI:Button_loadTexturePressed(btn_ss_3, "res/custom/shenshouzhili/sszl_15.png")
	GUI:Button_setScale9Slice(btn_ss_3, 15, 15, 11, 11)
	GUI:setContentSize(btn_ss_3, 133, 56)
	GUI:setIgnoreContentAdaptWithSize(btn_ss_3, false)
	GUI:Button_setTitleText(btn_ss_3, "")
	GUI:Button_setTitleColor(btn_ss_3, "#414146")
	GUI:Button_setTitleFontSize(btn_ss_3, 14)
	GUI:Button_titleDisableOutLine(btn_ss_3)
	GUI:setAnchorPoint(btn_ss_3, 0.50, 0.50)
	GUI:setTouchEnabled(btn_ss_3, true)
	GUI:setTag(btn_ss_3, 800)

	-- Create btn_ss_4
	local btn_ss_4 = GUI:Button_Create(img_bg1, "btn_ss_4", 534.95, 59.91, "res/custom/shenshouzhili/sszl_16.png")
	GUI:Button_loadTexturePressed(btn_ss_4, "res/custom/shenshouzhili/sszl_17.png")
	GUI:Button_setScale9Slice(btn_ss_4, 15, 15, 11, 11)
	GUI:setContentSize(btn_ss_4, 133, 56)
	GUI:setIgnoreContentAdaptWithSize(btn_ss_4, false)
	GUI:Button_setTitleText(btn_ss_4, "")
	GUI:Button_setTitleColor(btn_ss_4, "#414146")
	GUI:Button_setTitleFontSize(btn_ss_4, 14)
	GUI:Button_titleDisableOutLine(btn_ss_4)
	GUI:setAnchorPoint(btn_ss_4, 0.50, 0.50)
	GUI:setTouchEnabled(btn_ss_4, true)
	GUI:setTag(btn_ss_4, 801)

	-- Create img_bg2
	local img_bg2 = GUI:Image_Create(nd_root, "img_bg2", 14.00, -2.00, "res/custom/shenshouzhili/sszl_2.png")
	GUI:setAnchorPoint(img_bg2, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg2, true)
	GUI:setTag(img_bg2, 806)
	GUI:setVisible(img_bg2, false)

	-- Create p_qiu
	local p_qiu = GUI:Layout_Create(img_bg2, "p_qiu", 331.00, 231.50, 662.00, 463.00, false)
	GUI:setAnchorPoint(p_qiu, 0.50, 0.50)
	GUI:setTouchEnabled(p_qiu, true)
	GUI:setTag(p_qiu, 854)

	-- Create tx_title_ss
	local tx_title_ss = GUI:Text_Create(img_bg2, "tx_title_ss", 330.22, 411.89, 20, "#d6c6ad", [[青    龙]])
	GUI:setAnchorPoint(tx_title_ss, 0.50, 0.50)
	GUI:setTouchEnabled(tx_title_ss, false)
	GUI:setTag(tx_title_ss, 811)
	GUI:Text_enableOutline(tx_title_ss, "#000000", 2)

	-- Create tx_ss_yxiaohao
	local tx_ss_yxiaohao = GUI:Text_Create(img_bg2, "tx_ss_yxiaohao", 121.71, 68.73, 16, "#d6c6ad", [[元宝：1000]])
	GUI:setAnchorPoint(tx_ss_yxiaohao, 0.50, 0.50)
	GUI:setTouchEnabled(tx_ss_yxiaohao, false)
	GUI:setTag(tx_ss_yxiaohao, 848)
	GUI:setVisible(tx_ss_yxiaohao, false)
	GUI:Text_enableOutline(tx_ss_yxiaohao, "#000000", 1)

	-- Create tx_ss_fxiaohao
	local tx_ss_fxiaohao = GUI:Text_Create(img_bg2, "tx_ss_fxiaohao", 121.71, 46.73, 16, "#d6c6ad", [[灵符：1000]])
	GUI:setAnchorPoint(tx_ss_fxiaohao, 0.50, 0.50)
	GUI:setTouchEnabled(tx_ss_fxiaohao, false)
	GUI:setTag(tx_ss_fxiaohao, 849)
	GUI:setVisible(tx_ss_fxiaohao, false)
	GUI:Text_enableOutline(tx_ss_fxiaohao, "#000000", 1)

	-- Create tx_btn_cailiao1
	local tx_btn_cailiao1 = GUI:Text_Create(img_bg2, "tx_btn_cailiao1", 261.16, 83.81, 16, "#e5e5e5", [[元宝:1000]])
	GUI:setAnchorPoint(tx_btn_cailiao1, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_cailiao1, false)
	GUI:setTag(tx_btn_cailiao1, 850)
	GUI:Text_enableOutline(tx_btn_cailiao1, "#000000", 1)

	-- Create tx_btn_cailiao2
	local tx_btn_cailiao2 = GUI:Text_Create(img_bg2, "tx_btn_cailiao2", 402.43, 83.81, 16, "#e5e5e5", [[灵符:1000]])
	GUI:setAnchorPoint(tx_btn_cailiao2, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_cailiao2, false)
	GUI:setTag(tx_btn_cailiao2, 851)
	GUI:Text_enableOutline(tx_btn_cailiao2, "#000000", 1)

	-- Create tx_btn_shibai
	local tx_btn_shibai = GUI:Text_Create(img_bg2, "tx_btn_shibai", 131.60, 57.56, 16, "#ffffff", [[失败后:+5%]])
	GUI:setAnchorPoint(tx_btn_shibai, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_shibai, false)
	GUI:setTag(tx_btn_shibai, 33)
	GUI:Text_enableOutline(tx_btn_shibai, "#ffa500", 1)

	-- Create tx_btn_jilv
	local tx_btn_jilv = GUI:Text_Create(img_bg2, "tx_btn_jilv", 531.60, 57.56, 16, "#ffffff", [[成功率:100%]])
	GUI:setAnchorPoint(tx_btn_jilv, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_jilv, false)
	GUI:setTag(tx_btn_jilv, 852)
	GUI:Text_enableOutline(tx_btn_jilv, "#ffa500", 1)

	-- Create P_btn_1
	local P_btn_1 = GUI:Layout_Create(img_bg2, "P_btn_1", 264.37, 47.72, 125.00, 39.00, false)
	GUI:Layout_setBackGroundColorType(P_btn_1, 1)
	GUI:Layout_setBackGroundColor(P_btn_1, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(P_btn_1, 0)
	GUI:setAnchorPoint(P_btn_1, 0.50, 0.50)
	GUI:setTouchEnabled(P_btn_1, true)
	GUI:setTag(P_btn_1, 31)

	-- Create P_btn_2
	local P_btn_2 = GUI:Layout_Create(img_bg2, "P_btn_2", 398.37, 47.72, 125.00, 39.00, false)
	GUI:Layout_setBackGroundColorType(P_btn_2, 1)
	GUI:Layout_setBackGroundColor(P_btn_2, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(P_btn_2, 0)
	GUI:setAnchorPoint(P_btn_2, 0.50, 0.50)
	GUI:setTouchEnabled(P_btn_2, true)
	GUI:setTag(P_btn_2, 32)

	-- Create btn_close
	local btn_close = GUI:Button_Create(nd_root, "btn_close", 289.79, 150.99, "res/custom/shouchong/z_guanbianniu.png")
	GUI:Button_loadTexturePressed(btn_close, "res/custom/shouchong/z_guanbianniu.png1.png")
	GUI:Button_setScale9Slice(btn_close, 8, 8, 11, 11)
	GUI:setContentSize(btn_close, 33, 26)
	GUI:setIgnoreContentAdaptWithSize(btn_close, false)
	GUI:Button_setTitleText(btn_close, "")
	GUI:Button_setTitleColor(btn_close, "#414146")
	GUI:Button_setTitleFontSize(btn_close, 14)
	GUI:Button_titleDisableOutLine(btn_close)
	GUI:setAnchorPoint(btn_close, 0.50, 0.50)
	GUI:setTouchEnabled(btn_close, true)
	GUI:setTag(btn_close, 682)
end
return ui