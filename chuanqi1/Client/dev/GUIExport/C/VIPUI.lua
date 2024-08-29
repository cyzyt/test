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
	GUI:setTag(bg_close, 30)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 22)

	-- Create img_bg
	local img_bg = GUI:Image_Create(nd_root, "img_bg", 14.00, 0.00, "res/custom/common/00129.png")
	GUI:setContentSize(img_bg, 741, 540)
	GUI:setIgnoreContentAdaptWithSize(img_bg, false)
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg, true)
	GUI:setTag(img_bg, 23)

	-- Create tx_title
	local tx_title = GUI:Text_Create(img_bg, "tx_title", 84.00, 442.94, 20, "#d6c6ad", [[V I P]])
	GUI:setAnchorPoint(tx_title, 0.00, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 24)
	GUI:Text_enableOutline(tx_title, "#000000", 2)

	-- Create btn_close
	local btn_close = GUI:Button_Create(img_bg, "btn_close", 745.73, 454.32, "res/custom/common/btn_close_1_1.png")
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
	GUI:setTag(btn_close, 25)

	-- Create bg_di
	local bg_di = GUI:Image_Create(img_bg, "bg_di", 370.44, 218.42, "res/custom/vip/vip_1.jpg")
	GUI:setContentSize(bg_di, 660, 400)
	GUI:setIgnoreContentAdaptWithSize(bg_di, false)
	GUI:setAnchorPoint(bg_di, 0.50, 0.50)
	GUI:setTouchEnabled(bg_di, false)
	GUI:setTag(bg_di, 26)

	-- Create p_fu_tx
	local p_fu_tx = GUI:Layout_Create(bg_di, "p_fu_tx", 107.99, 310.35, 550.00, 300.00, false)
	GUI:setAnchorPoint(p_fu_tx, 0.00, 1.00)
	GUI:setTouchEnabled(p_fu_tx, true)
	GUI:setTag(p_fu_tx, 27)

	-- Create btn_vip_level1
	local btn_vip_level1 = GUI:Button_Create(bg_di, "btn_vip_level1", 54.79, 290.60, "res/custom/vip/vip_8.png")
	GUI:Button_loadTexturePressed(btn_vip_level1, "res/custom/vip/vip_8.png")
	GUI:Button_loadTextureDisabled(btn_vip_level1, "res/custom/vip/vip_7.png")
	GUI:Button_setScale9Slice(btn_vip_level1, 15, 15, 11, 11)
	GUI:setContentSize(btn_vip_level1, 105, 34)
	GUI:setIgnoreContentAdaptWithSize(btn_vip_level1, false)
	GUI:Button_setTitleText(btn_vip_level1, "")
	GUI:Button_setTitleColor(btn_vip_level1, "#414146")
	GUI:Button_setTitleFontSize(btn_vip_level1, 14)
	GUI:Button_titleDisableOutLine(btn_vip_level1)
	GUI:setAnchorPoint(btn_vip_level1, 0.50, 0.50)
	GUI:setTouchEnabled(btn_vip_level1, true)
	GUI:setTag(btn_vip_level1, 31)

	-- Create tx_btn_level1
	local tx_btn_level1 = GUI:Text_Create(btn_vip_level1, "tx_btn_level1", 18.00, 18.00, 16, "#d6c6ad", [[荣耀会员]])
	GUI:setAnchorPoint(tx_btn_level1, 0.00, 0.50)
	GUI:setTouchEnabled(tx_btn_level1, false)
	GUI:setTag(tx_btn_level1, 57)
	GUI:Text_enableOutline(tx_btn_level1, "#000000", 1)

	-- Create btn_vip_level2
	local btn_vip_level2 = GUI:Button_Create(bg_di, "btn_vip_level2", 54.79, 252.26, "res/custom/vip/vip_8.png")
	GUI:Button_loadTexturePressed(btn_vip_level2, "res/custom/vip/vip_8.png")
	GUI:Button_loadTextureDisabled(btn_vip_level2, "res/custom/vip/vip_7.png")
	GUI:Button_setScale9Slice(btn_vip_level2, 15, 15, 11, 11)
	GUI:setContentSize(btn_vip_level2, 105, 34)
	GUI:setIgnoreContentAdaptWithSize(btn_vip_level2, false)
	GUI:Button_setTitleText(btn_vip_level2, "")
	GUI:Button_setTitleColor(btn_vip_level2, "#414146")
	GUI:Button_setTitleFontSize(btn_vip_level2, 14)
	GUI:Button_titleDisableOutLine(btn_vip_level2)
	GUI:setAnchorPoint(btn_vip_level2, 0.50, 0.50)
	GUI:setTouchEnabled(btn_vip_level2, true)
	GUI:setTag(btn_vip_level2, 32)

	-- Create tx_btn_level2
	local tx_btn_level2 = GUI:Text_Create(btn_vip_level2, "tx_btn_level2", 18.00, 18.00, 16, "#d6c6ad", [[神圣会员]])
	GUI:setAnchorPoint(tx_btn_level2, 0.00, 0.50)
	GUI:setTouchEnabled(tx_btn_level2, false)
	GUI:setTag(tx_btn_level2, 58)
	GUI:Text_enableOutline(tx_btn_level2, "#000000", 1)

	-- Create btn_vip_level3
	local btn_vip_level3 = GUI:Button_Create(bg_di, "btn_vip_level3", 54.79, 213.93, "res/custom/vip/vip_8.png")
	GUI:Button_loadTexturePressed(btn_vip_level3, "res/custom/vip/vip_8.png")
	GUI:Button_loadTextureDisabled(btn_vip_level3, "res/custom/vip/vip_7.png")
	GUI:Button_setScale9Slice(btn_vip_level3, 15, 15, 11, 11)
	GUI:setContentSize(btn_vip_level3, 105, 34)
	GUI:setIgnoreContentAdaptWithSize(btn_vip_level3, false)
	GUI:Button_setTitleText(btn_vip_level3, "")
	GUI:Button_setTitleColor(btn_vip_level3, "#414146")
	GUI:Button_setTitleFontSize(btn_vip_level3, 14)
	GUI:Button_titleDisableOutLine(btn_vip_level3)
	GUI:setAnchorPoint(btn_vip_level3, 0.50, 0.50)
	GUI:setTouchEnabled(btn_vip_level3, true)
	GUI:setTag(btn_vip_level3, 33)

	-- Create tx_btn_level3
	local tx_btn_level3 = GUI:Text_Create(btn_vip_level3, "tx_btn_level3", 18.00, 18.00, 16, "#d6c6ad", [[永恒会员]])
	GUI:setAnchorPoint(tx_btn_level3, 0.00, 0.50)
	GUI:setTouchEnabled(tx_btn_level3, false)
	GUI:setTag(tx_btn_level3, 59)
	GUI:Text_enableOutline(tx_btn_level3, "#000000", 1)

	-- Create btn_vip_level4
	local btn_vip_level4 = GUI:Button_Create(bg_di, "btn_vip_level4", 54.79, 175.60, "res/custom/vip/vip_8.png")
	GUI:Button_loadTexturePressed(btn_vip_level4, "res/custom/vip/vip_8.png")
	GUI:Button_loadTextureDisabled(btn_vip_level4, "res/custom/vip/vip_7.png")
	GUI:Button_setScale9Slice(btn_vip_level4, 15, 15, 11, 11)
	GUI:setContentSize(btn_vip_level4, 105, 34)
	GUI:setIgnoreContentAdaptWithSize(btn_vip_level4, false)
	GUI:Button_setTitleText(btn_vip_level4, "")
	GUI:Button_setTitleColor(btn_vip_level4, "#414146")
	GUI:Button_setTitleFontSize(btn_vip_level4, 14)
	GUI:Button_titleDisableOutLine(btn_vip_level4)
	GUI:setAnchorPoint(btn_vip_level4, 0.50, 0.50)
	GUI:setTouchEnabled(btn_vip_level4, true)
	GUI:setTag(btn_vip_level4, 34)

	-- Create tx_btn_level4
	local tx_btn_level4 = GUI:Text_Create(btn_vip_level4, "tx_btn_level4", 18.00, 18.00, 16, "#d6c6ad", [[至尊会员]])
	GUI:setAnchorPoint(tx_btn_level4, 0.00, 0.50)
	GUI:setTouchEnabled(tx_btn_level4, false)
	GUI:setTag(tx_btn_level4, 60)
	GUI:Text_enableOutline(tx_btn_level4, "#000000", 1)

	-- Create Img_hetiao
	local Img_hetiao = GUI:Image_Create(bg_di, "Img_hetiao", 364.59, 336.79, "res/custom/vip/vip_3.png")
	GUI:setContentSize(Img_hetiao, 370, 13)
	GUI:setIgnoreContentAdaptWithSize(Img_hetiao, false)
	GUI:setAnchorPoint(Img_hetiao, 0.50, 0.50)
	GUI:setTouchEnabled(Img_hetiao, false)
	GUI:setTag(Img_hetiao, 65)

	-- Create LoadingBar
	local LoadingBar = GUI:LoadingBar_Create(bg_di, "LoadingBar", 364.59, 336.79, "res/custom/vip/vip_2.png", 0)
	GUI:setContentSize(LoadingBar, 370, 13)
	GUI:setIgnoreContentAdaptWithSize(LoadingBar, false)
	GUI:LoadingBar_setPercent(LoadingBar, 100)
	GUI:LoadingBar_setColor(LoadingBar, "#ffffff")
	GUI:setAnchorPoint(LoadingBar, 0.50, 0.50)
	GUI:setTouchEnabled(LoadingBar, false)
	GUI:setTag(LoadingBar, 63)

	-- Create Img_dtiao
	local Img_dtiao = GUI:Image_Create(bg_di, "Img_dtiao", 364.59, 335.79, "res/custom/vip/vip_4.png")
	GUI:setAnchorPoint(Img_dtiao, 0.50, 0.50)
	GUI:setTouchEnabled(Img_dtiao, false)
	GUI:setTag(Img_dtiao, 64)

	-- Create tx_bftiao
	local tx_bftiao = GUI:Text_Create(Img_dtiao, "tx_bftiao", 214.51, 13.00, 16, "#ffffff", [[1000/1000]])
	GUI:setAnchorPoint(tx_bftiao, 0.50, 0.50)
	GUI:setTouchEnabled(tx_bftiao, false)
	GUI:setTag(tx_bftiao, 67)
	GUI:Text_enableOutline(tx_bftiao, "#000000", 1)

	-- Create btn_mai
	local btn_mai = GUI:Button_Create(bg_di, "btn_mai", 374.91, 27.44, "res/custom/vip/vip_5.png")
	GUI:Button_loadTexturePressed(btn_mai, "res/custom/vip/vip_6.png")
	GUI:Button_loadTextureDisabled(btn_mai, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(btn_mai, 15, 15, 11, 11)
	GUI:setContentSize(btn_mai, 105, 41)
	GUI:setIgnoreContentAdaptWithSize(btn_mai, false)
	GUI:Button_setTitleText(btn_mai, "")
	GUI:Button_setTitleColor(btn_mai, "#414146")
	GUI:Button_setTitleFontSize(btn_mai, 14)
	GUI:Button_titleDisableOutLine(btn_mai)
	GUI:setAnchorPoint(btn_mai, 0.50, 0.50)
	GUI:setTouchEnabled(btn_mai, true)
	GUI:setTag(btn_mai, 250)

	-- Create tx_btn_mai
	local tx_btn_mai = GUI:Text_Create(btn_mai, "tx_btn_mai", 52.37, 21.41, 18, "#ffffff", [[激    活]])
	GUI:setAnchorPoint(tx_btn_mai, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_mai, false)
	GUI:setTag(tx_btn_mai, 251)
	GUI:Text_enableOutline(tx_btn_mai, "#000000", 1)

	-- Create btn_chongzhi
	local btn_chongzhi = GUI:Button_Create(img_bg, "btn_chongzhi", 642.27, 390.33, "res/custom/vip/vip_5.png")
	GUI:Button_loadTexturePressed(btn_chongzhi, "res/custom/vip/vip_6.png")
	GUI:Button_loadTextureDisabled(btn_chongzhi, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(btn_chongzhi, 15, 15, 11, 11)
	GUI:setContentSize(btn_chongzhi, 105, 41)
	GUI:setIgnoreContentAdaptWithSize(btn_chongzhi, false)
	GUI:Button_setTitleText(btn_chongzhi, "")
	GUI:Button_setTitleColor(btn_chongzhi, "#414146")
	GUI:Button_setTitleFontSize(btn_chongzhi, 14)
	GUI:Button_titleDisableOutLine(btn_chongzhi)
	GUI:setAnchorPoint(btn_chongzhi, 0.50, 0.50)
	GUI:setTouchEnabled(btn_chongzhi, true)
	GUI:setTag(btn_chongzhi, 68)

	-- Create tx_btn_cz
	local tx_btn_cz = GUI:Text_Create(btn_chongzhi, "tx_btn_cz", 52.37, 21.41, 18, "#ffffff", [[立即充值]])
	GUI:setAnchorPoint(tx_btn_cz, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_cz, false)
	GUI:setTag(tx_btn_cz, 69)
	GUI:Text_enableOutline(tx_btn_cz, "#000000", 1)

	-- Create tx_xvyao
	local tx_xvyao = GUI:Text_Create(img_bg, "tx_xvyao", 245.62, 393.34, 16, "#ffffff", [[需要]])
	GUI:setAnchorPoint(tx_xvyao, 0.50, 0.50)
	GUI:setTouchEnabled(tx_xvyao, false)
	GUI:setTag(tx_xvyao, 71)
	GUI:Text_enableOutline(tx_xvyao, "#000000", 1)

	-- Create tx_xvyao_lf
	local tx_xvyao_lf = GUI:Text_Create(tx_xvyao, "tx_xvyao_lf", 33.00, 12.35, 16, "#4ae74a", [[1000000灵符]])
	GUI:setAnchorPoint(tx_xvyao_lf, 0.00, 0.50)
	GUI:setTouchEnabled(tx_xvyao_lf, false)
	GUI:setTag(tx_xvyao_lf, 72)
	GUI:Text_enableOutline(tx_xvyao_lf, "#000000", 1)

	-- Create tx_goumai
	local tx_goumai = GUI:Text_Create(img_bg, "tx_goumai", 398.04, 393.34, 16, "#ffffff", [[即可激活]])
	GUI:setAnchorPoint(tx_goumai, 0.50, 0.50)
	GUI:setTouchEnabled(tx_goumai, false)
	GUI:setTag(tx_goumai, 153)
	GUI:Text_enableOutline(tx_goumai, "#000000", 1)

	-- Create p_tq
	local p_tq = GUI:Layout_Create(img_bg, "p_tq", 263.76, 237.59, 220.00, 180.00, false)
	GUI:setAnchorPoint(p_tq, 0.50, 0.50)
	GUI:setTouchEnabled(p_tq, true)
	GUI:setTag(p_tq, 218)

	-- Create Img_tequan
	local Img_tequan = GUI:Image_Create(p_tq, "Img_tequan", 110.00, 90.00, "res/custom/vip/vip_9.png")
	GUI:setContentSize(Img_tequan, 220, 180)
	GUI:setIgnoreContentAdaptWithSize(Img_tequan, false)
	GUI:setAnchorPoint(Img_tequan, 0.50, 0.50)
	GUI:setOpacity(Img_tequan, 178)
	GUI:setTouchEnabled(Img_tequan, false)
	GUI:setTag(Img_tequan, 175)

	-- Create tx_tq
	local tx_tq = GUI:Text_Create(p_tq, "tx_tq", 9.67, 163.89, 20, "#ffffff", [[特  权]])
	GUI:setAnchorPoint(tx_tq, 0.00, 0.50)
	GUI:setTouchEnabled(tx_tq, false)
	GUI:setTag(tx_tq, 188)
	GUI:Text_enableOutline(tx_tq, "#ffa500", 1)

	-- Create img_kuang1
	local img_kuang1 = GUI:Image_Create(p_tq, "img_kuang1", 132.20, 154.52, "res/custom/zhigou/1.png")
	GUI:setContentSize(img_kuang1, 180, 30)
	GUI:setIgnoreContentAdaptWithSize(img_kuang1, false)
	GUI:setAnchorPoint(img_kuang1, 0.50, 0.50)
	GUI:setOpacity(img_kuang1, 127)
	GUI:setTouchEnabled(img_kuang1, false)
	GUI:setTag(img_kuang1, 214)

	-- Create img_kuang2
	local img_kuang2 = GUI:Image_Create(p_tq, "img_kuang2", 132.20, 115.42, "res/custom/zhigou/1.png")
	GUI:setContentSize(img_kuang2, 180, 30)
	GUI:setIgnoreContentAdaptWithSize(img_kuang2, false)
	GUI:setAnchorPoint(img_kuang2, 0.50, 0.50)
	GUI:setOpacity(img_kuang2, 127)
	GUI:setTouchEnabled(img_kuang2, false)
	GUI:setTag(img_kuang2, 215)

	-- Create img_kuang3
	local img_kuang3 = GUI:Image_Create(p_tq, "img_kuang3", 132.20, 76.32, "res/custom/zhigou/1.png")
	GUI:setContentSize(img_kuang3, 180, 30)
	GUI:setIgnoreContentAdaptWithSize(img_kuang3, false)
	GUI:setAnchorPoint(img_kuang3, 0.50, 0.50)
	GUI:setOpacity(img_kuang3, 127)
	GUI:setTouchEnabled(img_kuang3, false)
	GUI:setTag(img_kuang3, 216)

	-- Create img_kuang4
	local img_kuang4 = GUI:Image_Create(p_tq, "img_kuang4", 132.20, 37.22, "res/custom/zhigou/1.png")
	GUI:setContentSize(img_kuang4, 180, 30)
	GUI:setIgnoreContentAdaptWithSize(img_kuang4, false)
	GUI:setAnchorPoint(img_kuang4, 0.50, 0.50)
	GUI:setOpacity(img_kuang4, 127)
	GUI:setTouchEnabled(img_kuang4, false)
	GUI:setTag(img_kuang4, 217)

	-- Create tx_vip_jiesuo1
	local tx_vip_jiesuo1 = GUI:Text_Create(p_tq, "tx_vip_jiesuo1", 74.20, 154.52, 16, "#ffff00", [[解锁：打金特权]])
	GUI:setAnchorPoint(tx_vip_jiesuo1, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_jiesuo1, false)
	GUI:setTag(tx_vip_jiesuo1, 176)
	GUI:Text_enableOutline(tx_vip_jiesuo1, "#000000", 1)

	-- Create tx_vip_jiesuo2
	local tx_vip_jiesuo2 = GUI:Text_Create(p_tq, "tx_vip_jiesuo2", 75.20, 115.25, 16, "#d6c6ad", [[锁定：拾取使用]])
	GUI:setAnchorPoint(tx_vip_jiesuo2, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_jiesuo2, false)
	GUI:setTag(tx_vip_jiesuo2, 177)
	GUI:Text_enableOutline(tx_vip_jiesuo2, "#000000", 1)

	-- Create tx_vip_jiesuo3
	local tx_vip_jiesuo3 = GUI:Text_Create(p_tq, "tx_vip_jiesuo3", 74.20, 75.99, 16, "#d6c6ad", [[锁定：自动回收]])
	GUI:setAnchorPoint(tx_vip_jiesuo3, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_jiesuo3, false)
	GUI:setTag(tx_vip_jiesuo3, 178)
	GUI:Text_enableOutline(tx_vip_jiesuo3, "#000000", 1)

	-- Create tx_vip_jiesuo4
	local tx_vip_jiesuo4 = GUI:Text_Create(p_tq, "tx_vip_jiesuo4", 74.20, 36.72, 16, "#d6c6ad", [[锁定：一键拾取]])
	GUI:setAnchorPoint(tx_vip_jiesuo4, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_jiesuo4, false)
	GUI:setTag(tx_vip_jiesuo4, 179)
	GUI:Text_enableOutline(tx_vip_jiesuo4, "#000000", 1)

	-- Create p_sx
	local p_sx = GUI:Layout_Create(img_bg, "p_sx", 537.59, 237.59, 320.00, 180.00, false)
	GUI:setAnchorPoint(p_sx, 0.50, 0.50)
	GUI:setTouchEnabled(p_sx, true)
	GUI:setTag(p_sx, 219)

	-- Create Img_shuxing
	local Img_shuxing = GUI:Image_Create(p_sx, "Img_shuxing", 161.20, 90.00, "res/custom/vip/vip_9.png")
	GUI:setContentSize(Img_shuxing, 320, 180)
	GUI:setIgnoreContentAdaptWithSize(Img_shuxing, false)
	GUI:setAnchorPoint(Img_shuxing, 0.50, 0.50)
	GUI:setOpacity(Img_shuxing, 178)
	GUI:setTouchEnabled(Img_shuxing, false)
	GUI:setTag(Img_shuxing, 220)

	-- Create tx_tq
	local tx_tq = GUI:Text_Create(p_sx, "tx_tq", 9.67, 163.89, 20, "#ffffff", [[属  性]])
	GUI:setAnchorPoint(tx_tq, 0.00, 0.50)
	GUI:setTouchEnabled(tx_tq, false)
	GUI:setTag(tx_tq, 221)
	GUI:Text_enableOutline(tx_tq, "#ffa500", 1)

	-- Create img_kuang1
	local img_kuang1 = GUI:Image_Create(p_sx, "img_kuang1", 183.83, 154.52, "res/custom/zhigou/1.png")
	GUI:setContentSize(img_kuang1, 300, 30)
	GUI:setIgnoreContentAdaptWithSize(img_kuang1, false)
	GUI:setAnchorPoint(img_kuang1, 0.50, 0.50)
	GUI:setOpacity(img_kuang1, 127)
	GUI:setTouchEnabled(img_kuang1, false)
	GUI:setTag(img_kuang1, 222)

	-- Create img_kuang2
	local img_kuang2 = GUI:Image_Create(p_sx, "img_kuang2", 183.83, 115.42, "res/custom/zhigou/1.png")
	GUI:setContentSize(img_kuang2, 300, 30)
	GUI:setIgnoreContentAdaptWithSize(img_kuang2, false)
	GUI:setAnchorPoint(img_kuang2, 0.50, 0.50)
	GUI:setOpacity(img_kuang2, 127)
	GUI:setTouchEnabled(img_kuang2, false)
	GUI:setTag(img_kuang2, 223)

	-- Create img_kuang3
	local img_kuang3 = GUI:Image_Create(p_sx, "img_kuang3", 183.83, 76.32, "res/custom/zhigou/1.png")
	GUI:setContentSize(img_kuang3, 300, 30)
	GUI:setIgnoreContentAdaptWithSize(img_kuang3, false)
	GUI:setAnchorPoint(img_kuang3, 0.50, 0.50)
	GUI:setOpacity(img_kuang3, 127)
	GUI:setTouchEnabled(img_kuang3, false)
	GUI:setTag(img_kuang3, 224)

	-- Create img_kuang4
	local img_kuang4 = GUI:Image_Create(p_sx, "img_kuang4", 183.84, 37.22, "res/custom/zhigou/1.png")
	GUI:setContentSize(img_kuang4, 300, 30)
	GUI:setIgnoreContentAdaptWithSize(img_kuang4, false)
	GUI:setAnchorPoint(img_kuang4, 0.50, 0.50)
	GUI:setOpacity(img_kuang4, 127)
	GUI:setTouchEnabled(img_kuang4, false)
	GUI:setTag(img_kuang4, 225)

	-- Create tx_vip_sx1
	local tx_vip_sx1 = GUI:Text_Create(p_sx, "tx_vip_sx1", 74.77, 154.02, 15, "#d6c6ad", [[怪物减伤 +]])
	GUI:setAnchorPoint(tx_vip_sx1, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_sx1, false)
	GUI:setTag(tx_vip_sx1, 156)
	GUI:Text_enableOutline(tx_vip_sx1, "#000000", 1)

	-- Create tx_vip_vaul1
	local tx_vip_vaul1 = GUI:Text_Create(tx_vip_sx1, "tx_vip_vaul1", 73.00, 12.00, 15, "#4ae74a", [[3000]])
	GUI:setAnchorPoint(tx_vip_vaul1, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_vaul1, false)
	GUI:setTag(tx_vip_vaul1, 233)
	GUI:Text_enableOutline(tx_vip_vaul1, "#000000", 1)

	-- Create tx_vip_sx2
	local tx_vip_sx2 = GUI:Text_Create(p_sx, "tx_vip_sx2", 74.77, 114.75, 15, "#d6c6ad", [[对怪固伤 +]])
	GUI:setAnchorPoint(tx_vip_sx2, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_sx2, false)
	GUI:setTag(tx_vip_sx2, 165)
	GUI:Text_enableOutline(tx_vip_sx2, "#000000", 1)

	-- Create tx_vip_vaul2
	local tx_vip_vaul2 = GUI:Text_Create(tx_vip_sx2, "tx_vip_vaul2", 73.00, 12.00, 15, "#4ae74a", [[20000]])
	GUI:setAnchorPoint(tx_vip_vaul2, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_vaul2, false)
	GUI:setTag(tx_vip_vaul2, 241)
	GUI:Text_enableOutline(tx_vip_vaul2, "#000000", 1)

	-- Create tx_vip_sx3
	local tx_vip_sx3 = GUI:Text_Create(p_sx, "tx_vip_sx3", 74.77, 75.49, 15, "#d6c6ad", [[爆率加成 +]])
	GUI:setAnchorPoint(tx_vip_sx3, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_sx3, false)
	GUI:setTag(tx_vip_sx3, 166)
	GUI:Text_enableOutline(tx_vip_sx3, "#000000", 1)

	-- Create tx_vip_vaul3
	local tx_vip_vaul3 = GUI:Text_Create(tx_vip_sx3, "tx_vip_vaul3", 73.00, 12.00, 15, "#4ae74a", [[80%]])
	GUI:setAnchorPoint(tx_vip_vaul3, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_vaul3, false)
	GUI:setTag(tx_vip_vaul3, 242)
	GUI:Text_enableOutline(tx_vip_vaul3, "#000000", 1)

	-- Create tx_vip_sx4
	local tx_vip_sx4 = GUI:Text_Create(p_sx, "tx_vip_sx4", 196.89, 154.02, 15, "#d6c6ad", [[对怪伤害 +]])
	GUI:setAnchorPoint(tx_vip_sx4, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_sx4, false)
	GUI:setTag(tx_vip_sx4, 169)
	GUI:Text_enableOutline(tx_vip_sx4, "#000000", 1)

	-- Create tx_vip_vaul4
	local tx_vip_vaul4 = GUI:Text_Create(tx_vip_sx4, "tx_vip_vaul4", 73.00, 12.00, 15, "#4ae74a", [[50%]])
	GUI:setAnchorPoint(tx_vip_vaul4, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_vaul4, false)
	GUI:setTag(tx_vip_vaul4, 244)
	GUI:Text_enableOutline(tx_vip_vaul4, "#000000", 1)

	-- Create tx_vip_sx5
	local tx_vip_sx5 = GUI:Text_Create(p_sx, "tx_vip_sx5", 196.89, 114.75, 15, "#d6c6ad", [[生命上限 +]])
	GUI:setAnchorPoint(tx_vip_sx5, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_sx5, false)
	GUI:setTag(tx_vip_sx5, 170)
	GUI:Text_enableOutline(tx_vip_sx5, "#000000", 1)

	-- Create tx_vip_vaul5
	local tx_vip_vaul5 = GUI:Text_Create(tx_vip_sx5, "tx_vip_vaul5", 73.00, 12.00, 15, "#4ae74a", [[50%]])
	GUI:setAnchorPoint(tx_vip_vaul5, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_vaul5, false)
	GUI:setTag(tx_vip_vaul5, 245)
	GUI:Text_enableOutline(tx_vip_vaul5, "#000000", 1)

	-- Create tx_vip_sx6
	local tx_vip_sx6 = GUI:Text_Create(p_sx, "tx_vip_sx6", 196.89, 75.49, 15, "#d6c6ad", [[P  K 增伤 +]])
	GUI:setAnchorPoint(tx_vip_sx6, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_sx6, false)
	GUI:setTag(tx_vip_sx6, 171)
	GUI:Text_enableOutline(tx_vip_sx6, "#000000", 1)

	-- Create tx_vip_vaul6
	local tx_vip_vaul6 = GUI:Text_Create(tx_vip_sx6, "tx_vip_vaul6", 73.00, 12.00, 15, "#4ae74a", [[30%]])
	GUI:setAnchorPoint(tx_vip_vaul6, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_vaul6, false)
	GUI:setTag(tx_vip_vaul6, 246)
	GUI:Text_enableOutline(tx_vip_vaul6, "#000000", 1)

	-- Create tx_vip_sx7
	local tx_vip_sx7 = GUI:Text_Create(p_sx, "tx_vip_sx7", 196.89, 36.22, 15, "#d6c6ad", [[剑甲爆率 +]])
	GUI:setAnchorPoint(tx_vip_sx7, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_sx7, false)
	GUI:setTag(tx_vip_sx7, 248)
	GUI:Text_enableOutline(tx_vip_sx7, "#000000", 1)

	-- Create tx_vip_vaul7
	local tx_vip_vaul7 = GUI:Text_Create(tx_vip_sx7, "tx_vip_vaul7", 73.00, 12.00, 15, "#4ae74a", [[100%]])
	GUI:setAnchorPoint(tx_vip_vaul7, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_vaul7, false)
	GUI:setTag(tx_vip_vaul7, 249)
	GUI:Text_enableOutline(tx_vip_vaul7, "#000000", 1)

	-- Create tx_vip_sx8
	local tx_vip_sx8 = GUI:Text_Create(p_sx, "tx_vip_sx8", 74.77, 36.22, 15, "#d6c6ad", [[回收加成 +]])
	GUI:setAnchorPoint(tx_vip_sx8, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_sx8, false)
	GUI:setTag(tx_vip_sx8, 167)
	GUI:Text_enableOutline(tx_vip_sx8, "#000000", 1)

	-- Create tx_vip_vaul8
	local tx_vip_vaul8 = GUI:Text_Create(tx_vip_sx8, "tx_vip_vaul8", 73.00, 12.00, 15, "#4ae74a", [[80%]])
	GUI:setAnchorPoint(tx_vip_vaul8, 0.00, 0.50)
	GUI:setTouchEnabled(tx_vip_vaul8, false)
	GUI:setTag(tx_vip_vaul8, 243)
	GUI:Text_enableOutline(tx_vip_vaul8, "#000000", 1)
end
return ui