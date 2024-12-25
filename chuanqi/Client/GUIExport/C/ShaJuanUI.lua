local ui = {}
function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setAnchorPoint(Layer, 0.50, 0.50)
	GUI:setTag(Layer, -1)

	-- Create bg_close
	local bg_close = GUI:Image_Create(Layer, "bg_close", -1.00, 0.00, "res/custom/common/bg_main_6.png")
	GUI:setContentSize(bg_close, 1136, 640)
	GUI:setIgnoreContentAdaptWithSize(bg_close, false)
	GUI:setOpacity(bg_close, 0)
	GUI:setTouchEnabled(bg_close, true)
	GUI:setTag(bg_close, 221)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 196)

	-- Create img_bg
	local img_bg = GUI:Image_Create(nd_root, "img_bg", 14.00, 0.00, "res/custom/common/00129.png")
	GUI:setContentSize(img_bg, 741, 540)
	GUI:setIgnoreContentAdaptWithSize(img_bg, false)
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg, true)
	GUI:setTag(img_bg, 197)

	-- Create tx_title
	local tx_title = GUI:Text_Create(img_bg, "tx_title", 84.00, 442.94, 20, "#d6c6ad", [[沙城捐献]])
	GUI:setAnchorPoint(tx_title, 0.00, 0.50)
	GUI:setTouchEnabled(tx_title, false)
	GUI:setTag(tx_title, 198)
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
	GUI:setTag(btn_close, 199)

	-- Create bg_di
	local bg_di = GUI:Image_Create(img_bg, "bg_di", 370.44, 218.42, "res/custom/shajuan/shajuan_2.jpg")
	GUI:setContentSize(bg_di, 660, 400)
	GUI:setIgnoreContentAdaptWithSize(bg_di, false)
	GUI:setAnchorPoint(bg_di, 0.50, 0.50)
	GUI:setTouchEnabled(bg_di, false)
	GUI:setTag(bg_di, 200)

	-- Create btn_mai
	local btn_mai = GUI:Button_Create(bg_di, "btn_mai", 330.28, 28.91, "res/custom/vip/vip_5.png")
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
	GUI:setTag(btn_mai, 214)

	-- Create tx_btn_mai
	local tx_btn_mai = GUI:Text_Create(btn_mai, "tx_btn_mai", 52.37, 21.41, 18, "#ffffff", [[捐    献]])
	GUI:setAnchorPoint(tx_btn_mai, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_mai, false)
	GUI:setTag(tx_btn_mai, 215)
	GUI:Text_enableOutline(tx_btn_mai, "#000000", 1)

	-- Create tx_xvyao
	local tx_xvyao = GUI:Text_Create(img_bg, "tx_xvyao", 70.11, 391.20, 16, "#ffffff", [[需要]])
	GUI:setAnchorPoint(tx_xvyao, 0.50, 0.50)
	GUI:setTouchEnabled(tx_xvyao, false)
	GUI:setTag(tx_xvyao, 218)
	GUI:Text_enableOutline(tx_xvyao, "#000000", 1)

	-- Create tx_xvyao_lf
	local tx_xvyao_lf = GUI:Text_Create(tx_xvyao, "tx_xvyao_lf", 33.00, 12.35, 16, "#4ae74a", [[10000灵符]])
	GUI:setAnchorPoint(tx_xvyao_lf, 0.00, 0.50)
	GUI:setTouchEnabled(tx_xvyao_lf, false)
	GUI:setTag(tx_xvyao_lf, 219)
	GUI:Text_enableOutline(tx_xvyao_lf, "#000000", 1)

	-- Create tx_goumai
	local tx_goumai = GUI:Text_Create(img_bg, "tx_goumai", 165.74, 391.86, 16, "#ffffff", [[获得]])
	GUI:setAnchorPoint(tx_goumai, 0.00, 0.50)
	GUI:setTouchEnabled(tx_goumai, false)
	GUI:setTag(tx_goumai, 220)
	GUI:Text_enableOutline(tx_goumai, "#000000", 1)

	-- Create tx_ewainame1
	local tx_ewainame1 = GUI:Text_Create(tx_goumai, "tx_ewainame1", 34.11, 11.69, 16, "#ff0000", [[怪物爆率]])
	GUI:setAnchorPoint(tx_ewainame1, 0.00, 0.50)
	GUI:setTouchEnabled(tx_ewainame1, false)
	GUI:setTag(tx_ewainame1, 223)
	GUI:Text_enableOutline(tx_ewainame1, "#000000", 1)

	-- Create tx_ewainuml1
	local tx_ewainuml1 = GUI:Text_Create(tx_ewainame1, "tx_ewainuml1", 64.86, 11.69, 16, "#ff0000", [[+20%]])
	GUI:setAnchorPoint(tx_ewainuml1, 0.00, 0.50)
	GUI:setTouchEnabled(tx_ewainuml1, false)
	GUI:setTag(tx_ewainuml1, 222)
	GUI:Text_enableOutline(tx_ewainuml1, "#000000", 1)

	-- Create tx_ewainame2
	local tx_ewainame2 = GUI:Text_Create(tx_goumai, "tx_ewainame2", 152.12, 11.69, 16, "#ff0000", [[怪物爆率]])
	GUI:setAnchorPoint(tx_ewainame2, 0.00, 0.50)
	GUI:setTouchEnabled(tx_ewainame2, false)
	GUI:setTag(tx_ewainame2, 224)
	GUI:Text_enableOutline(tx_ewainame2, "#000000", 1)

	-- Create tx_ewainuml2
	local tx_ewainuml2 = GUI:Text_Create(tx_ewainame2, "tx_ewainuml2", 64.86, 11.69, 16, "#ff0000", [[+20%]])
	GUI:setAnchorPoint(tx_ewainuml2, 0.00, 0.50)
	GUI:setTouchEnabled(tx_ewainuml2, false)
	GUI:setTag(tx_ewainuml2, 225)
	GUI:Text_enableOutline(tx_ewainuml2, "#000000", 1)

	-- Create tx_ewainame3
	local tx_ewainame3 = GUI:Text_Create(tx_goumai, "tx_ewainame3", 270.12, 11.69, 16, "#ff0000", [[怪物爆率]])
	GUI:setAnchorPoint(tx_ewainame3, 0.00, 0.50)
	GUI:setTouchEnabled(tx_ewainame3, false)
	GUI:setTag(tx_ewainame3, 226)
	GUI:Text_enableOutline(tx_ewainame3, "#000000", 1)

	-- Create tx_ewainuml3
	local tx_ewainuml3 = GUI:Text_Create(tx_ewainame3, "tx_ewainuml3", 64.86, 11.69, 16, "#ff0000", [[+20%]])
	GUI:setAnchorPoint(tx_ewainuml3, 0.00, 0.50)
	GUI:setTouchEnabled(tx_ewainuml3, false)
	GUI:setTag(tx_ewainuml3, 227)
	GUI:Text_enableOutline(tx_ewainuml3, "#000000", 1)

	-- Create tx_buchong
	local tx_buchong = GUI:Text_Create(img_bg, "tx_buchong", 548.59, 391.86, 16, "#ffffff", [[(与排行榜属性叠加)]])
	GUI:setAnchorPoint(tx_buchong, 0.00, 0.50)
	GUI:setTouchEnabled(tx_buchong, false)
	GUI:setTag(tx_buchong, 228)
	GUI:Text_enableOutline(tx_buchong, "#000000", 1)

	-- Create tx_pmsx1
	local tx_pmsx1 = GUI:Text_Create(img_bg, "tx_pmsx1", 105.35, 306.01, 16, "#ff0000", [[NO.1]])
	GUI:setAnchorPoint(tx_pmsx1, 0.00, 0.50)
	GUI:setTouchEnabled(tx_pmsx1, false)
	GUI:setTag(tx_pmsx1, 235)
	GUI:setVisible(tx_pmsx1, false)
	GUI:Text_enableOutline(tx_pmsx1, "#000000", 1)

	-- Create tx_pmname1
	local tx_pmname1 = GUI:Text_Create(tx_pmsx1, "tx_pmname1", 169.27, 11.21, 16, "#ff0000", [[少先队员]])
	GUI:setAnchorPoint(tx_pmname1, 0.50, 0.50)
	GUI:setTouchEnabled(tx_pmname1, false)
	GUI:setTag(tx_pmname1, 236)
	GUI:Text_enableOutline(tx_pmname1, "#000000", 1)

	-- Create tx_pmnum1
	local tx_pmnum1 = GUI:Text_Create(tx_pmsx1, "tx_pmnum1", 311.95, 11.21, 16, "#ff0000", [[1000]])
	GUI:setAnchorPoint(tx_pmnum1, 0.50, 0.50)
	GUI:setTouchEnabled(tx_pmnum1, false)
	GUI:setTag(tx_pmnum1, 238)
	GUI:Text_enableOutline(tx_pmnum1, "#000000", 1)

	-- Create btn_tip1
	local btn_tip1 = GUI:Button_Create(tx_pmsx1, "btn_tip1", 508.40, 10.22, "res/custom/shajuan/shajuan_3.png")
	GUI:Button_loadTexturePressed(btn_tip1, "res/custom/shajuan/shajuan_3.png")
	GUI:Button_loadTextureDisabled(btn_tip1, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(btn_tip1, 15, 15, 11, 11)
	GUI:setContentSize(btn_tip1, 167, 35)
	GUI:setIgnoreContentAdaptWithSize(btn_tip1, false)
	GUI:Button_setTitleText(btn_tip1, "")
	GUI:Button_setTitleColor(btn_tip1, "#414146")
	GUI:Button_setTitleFontSize(btn_tip1, 14)
	GUI:Button_titleDisableOutLine(btn_tip1)
	GUI:setAnchorPoint(btn_tip1, 0.50, 0.50)
	GUI:setTouchEnabled(btn_tip1, true)
	GUI:setTag(btn_tip1, 243)

	-- Create tx_btn_tip1
	local tx_btn_tip1 = GUI:Text_Create(btn_tip1, "tx_btn_tip1", 56.00, 17.00, 18, "#ff0000", [[属    性]])
	GUI:setAnchorPoint(tx_btn_tip1, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_tip1, false)
	GUI:setTag(tx_btn_tip1, 244)
	GUI:Text_enableOutline(tx_btn_tip1, "#000000", 1)

	-- Create tx_pmsx2
	local tx_pmsx2 = GUI:Text_Create(img_bg, "tx_pmsx2", 105.35, 255.01, 16, "#ffa500", [[NO.2]])
	GUI:setAnchorPoint(tx_pmsx2, 0.00, 0.50)
	GUI:setTouchEnabled(tx_pmsx2, false)
	GUI:setTag(tx_pmsx2, 245)
	GUI:setVisible(tx_pmsx2, false)
	GUI:Text_enableOutline(tx_pmsx2, "#000000", 1)

	-- Create tx_pmname2
	local tx_pmname2 = GUI:Text_Create(tx_pmsx2, "tx_pmname2", 169.27, 11.21, 16, "#ffa500", [[少先队员]])
	GUI:setAnchorPoint(tx_pmname2, 0.50, 0.50)
	GUI:setTouchEnabled(tx_pmname2, false)
	GUI:setTag(tx_pmname2, 246)
	GUI:Text_enableOutline(tx_pmname2, "#000000", 1)

	-- Create tx_pmnum2
	local tx_pmnum2 = GUI:Text_Create(tx_pmsx2, "tx_pmnum2", 311.95, 11.21, 16, "#ffa500", [[1000]])
	GUI:setAnchorPoint(tx_pmnum2, 0.50, 0.50)
	GUI:setTouchEnabled(tx_pmnum2, false)
	GUI:setTag(tx_pmnum2, 247)
	GUI:Text_enableOutline(tx_pmnum2, "#000000", 1)

	-- Create btn_tip2
	local btn_tip2 = GUI:Button_Create(tx_pmsx2, "btn_tip2", 508.40, 10.22, "res/custom/shajuan/shajuan_3.png")
	GUI:Button_loadTexturePressed(btn_tip2, "res/custom/shajuan/shajuan_3.png")
	GUI:Button_loadTextureDisabled(btn_tip2, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(btn_tip2, 15, 15, 11, 11)
	GUI:setContentSize(btn_tip2, 167, 35)
	GUI:setIgnoreContentAdaptWithSize(btn_tip2, false)
	GUI:Button_setTitleText(btn_tip2, "")
	GUI:Button_setTitleColor(btn_tip2, "#414146")
	GUI:Button_setTitleFontSize(btn_tip2, 14)
	GUI:Button_titleDisableOutLine(btn_tip2)
	GUI:setAnchorPoint(btn_tip2, 0.50, 0.50)
	GUI:setTouchEnabled(btn_tip2, true)
	GUI:setTag(btn_tip2, 248)

	-- Create tx_btn_tip2
	local tx_btn_tip2 = GUI:Text_Create(btn_tip2, "tx_btn_tip2", 56.00, 17.00, 18, "#ffa500", [[属    性]])
	GUI:setAnchorPoint(tx_btn_tip2, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_tip2, false)
	GUI:setTag(tx_btn_tip2, 249)
	GUI:Text_enableOutline(tx_btn_tip2, "#000000", 1)

	-- Create tx_pmsx3
	local tx_pmsx3 = GUI:Text_Create(img_bg, "tx_pmsx3", 105.35, 204.01, 16, "#ffff00", [[NO.3]])
	GUI:setAnchorPoint(tx_pmsx3, 0.00, 0.50)
	GUI:setTouchEnabled(tx_pmsx3, false)
	GUI:setTag(tx_pmsx3, 250)
	GUI:setVisible(tx_pmsx3, false)
	GUI:Text_enableOutline(tx_pmsx3, "#000000", 1)

	-- Create tx_pmname3
	local tx_pmname3 = GUI:Text_Create(tx_pmsx3, "tx_pmname3", 169.27, 11.21, 16, "#ffff00", [[少先队员]])
	GUI:setAnchorPoint(tx_pmname3, 0.50, 0.50)
	GUI:setTouchEnabled(tx_pmname3, false)
	GUI:setTag(tx_pmname3, 251)
	GUI:Text_enableOutline(tx_pmname3, "#000000", 1)

	-- Create tx_pmnum3
	local tx_pmnum3 = GUI:Text_Create(tx_pmsx3, "tx_pmnum3", 311.95, 11.21, 16, "#ffff00", [[1000]])
	GUI:setAnchorPoint(tx_pmnum3, 0.50, 0.50)
	GUI:setTouchEnabled(tx_pmnum3, false)
	GUI:setTag(tx_pmnum3, 252)
	GUI:Text_enableOutline(tx_pmnum3, "#000000", 1)

	-- Create btn_tip3
	local btn_tip3 = GUI:Button_Create(tx_pmsx3, "btn_tip3", 508.40, 10.22, "res/custom/shajuan/shajuan_3.png")
	GUI:Button_loadTexturePressed(btn_tip3, "res/custom/shajuan/shajuan_3.png")
	GUI:Button_loadTextureDisabled(btn_tip3, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(btn_tip3, 15, 15, 11, 11)
	GUI:setContentSize(btn_tip3, 167, 35)
	GUI:setIgnoreContentAdaptWithSize(btn_tip3, false)
	GUI:Button_setTitleText(btn_tip3, "")
	GUI:Button_setTitleColor(btn_tip3, "#414146")
	GUI:Button_setTitleFontSize(btn_tip3, 14)
	GUI:Button_titleDisableOutLine(btn_tip3)
	GUI:setAnchorPoint(btn_tip3, 0.50, 0.50)
	GUI:setTouchEnabled(btn_tip3, true)
	GUI:setTag(btn_tip3, 253)

	-- Create tx_btn_tip3
	local tx_btn_tip3 = GUI:Text_Create(btn_tip3, "tx_btn_tip3", 56.00, 17.00, 18, "#ffff00", [[属    性]])
	GUI:setAnchorPoint(tx_btn_tip3, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_tip3, false)
	GUI:setTag(tx_btn_tip3, 254)
	GUI:Text_enableOutline(tx_btn_tip3, "#000000", 1)

	-- Create tx_pmsx4
	local tx_pmsx4 = GUI:Text_Create(img_bg, "tx_pmsx4", 105.35, 153.01, 16, "#ff00ff", [[NO.4]])
	GUI:setAnchorPoint(tx_pmsx4, 0.00, 0.50)
	GUI:setTouchEnabled(tx_pmsx4, false)
	GUI:setTag(tx_pmsx4, 255)
	GUI:setVisible(tx_pmsx4, false)
	GUI:Text_enableOutline(tx_pmsx4, "#000000", 1)

	-- Create tx_pmname4
	local tx_pmname4 = GUI:Text_Create(tx_pmsx4, "tx_pmname4", 169.27, 11.21, 16, "#ff00ff", [[少先队员]])
	GUI:setAnchorPoint(tx_pmname4, 0.50, 0.50)
	GUI:setTouchEnabled(tx_pmname4, false)
	GUI:setTag(tx_pmname4, 256)
	GUI:Text_enableOutline(tx_pmname4, "#000000", 1)

	-- Create tx_pmnum4
	local tx_pmnum4 = GUI:Text_Create(tx_pmsx4, "tx_pmnum4", 311.95, 11.21, 16, "#ff00ff", [[1000]])
	GUI:setAnchorPoint(tx_pmnum4, 0.50, 0.50)
	GUI:setTouchEnabled(tx_pmnum4, false)
	GUI:setTag(tx_pmnum4, 257)
	GUI:Text_enableOutline(tx_pmnum4, "#000000", 1)

	-- Create btn_tip4
	local btn_tip4 = GUI:Button_Create(tx_pmsx4, "btn_tip4", 508.40, 10.22, "res/custom/shajuan/shajuan_3.png")
	GUI:Button_loadTexturePressed(btn_tip4, "res/custom/shajuan/shajuan_3.png")
	GUI:Button_loadTextureDisabled(btn_tip4, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(btn_tip4, 15, 15, 11, 11)
	GUI:setContentSize(btn_tip4, 167, 35)
	GUI:setIgnoreContentAdaptWithSize(btn_tip4, false)
	GUI:Button_setTitleText(btn_tip4, "")
	GUI:Button_setTitleColor(btn_tip4, "#414146")
	GUI:Button_setTitleFontSize(btn_tip4, 14)
	GUI:Button_titleDisableOutLine(btn_tip4)
	GUI:setAnchorPoint(btn_tip4, 0.50, 0.50)
	GUI:setTouchEnabled(btn_tip4, true)
	GUI:setTag(btn_tip4, 258)

	-- Create tx_btn_tip4
	local tx_btn_tip4 = GUI:Text_Create(btn_tip4, "tx_btn_tip4", 56.00, 17.00, 18, "#ff00ff", [[属    性]])
	GUI:setAnchorPoint(tx_btn_tip4, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_tip4, false)
	GUI:setTag(tx_btn_tip4, 259)
	GUI:Text_enableOutline(tx_btn_tip4, "#000000", 1)

	-- Create tx_pmsx5
	local tx_pmsx5 = GUI:Text_Create(img_bg, "tx_pmsx5", 105.35, 102.01, 16, "#90ee90", [[NO.5]])
	GUI:setAnchorPoint(tx_pmsx5, 0.00, 0.50)
	GUI:setTouchEnabled(tx_pmsx5, false)
	GUI:setTag(tx_pmsx5, 260)
	GUI:setVisible(tx_pmsx5, false)
	GUI:Text_enableOutline(tx_pmsx5, "#000000", 1)

	-- Create tx_pmname5
	local tx_pmname5 = GUI:Text_Create(tx_pmsx5, "tx_pmname5", 169.27, 11.21, 16, "#90ee90", [[少先队员]])
	GUI:setAnchorPoint(tx_pmname5, 0.50, 0.50)
	GUI:setTouchEnabled(tx_pmname5, false)
	GUI:setTag(tx_pmname5, 261)
	GUI:Text_enableOutline(tx_pmname5, "#000000", 1)

	-- Create tx_pmnum5
	local tx_pmnum5 = GUI:Text_Create(tx_pmsx5, "tx_pmnum5", 311.95, 11.21, 16, "#90ee90", [[1000]])
	GUI:setAnchorPoint(tx_pmnum5, 0.50, 0.50)
	GUI:setTouchEnabled(tx_pmnum5, false)
	GUI:setTag(tx_pmnum5, 262)
	GUI:Text_enableOutline(tx_pmnum5, "#000000", 1)

	-- Create btn_tip5
	local btn_tip5 = GUI:Button_Create(tx_pmsx5, "btn_tip5", 508.40, 10.22, "res/custom/shajuan/shajuan_3.png")
	GUI:Button_loadTexturePressed(btn_tip5, "res/custom/shajuan/shajuan_3.png")
	GUI:Button_loadTextureDisabled(btn_tip5, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(btn_tip5, 15, 15, 11, 11)
	GUI:setContentSize(btn_tip5, 167, 35)
	GUI:setIgnoreContentAdaptWithSize(btn_tip5, false)
	GUI:Button_setTitleText(btn_tip5, "")
	GUI:Button_setTitleColor(btn_tip5, "#414146")
	GUI:Button_setTitleFontSize(btn_tip5, 14)
	GUI:Button_titleDisableOutLine(btn_tip5)
	GUI:setAnchorPoint(btn_tip5, 0.50, 0.50)
	GUI:setTouchEnabled(btn_tip5, true)
	GUI:setTag(btn_tip5, 263)

	-- Create tx_btn_tip5
	local tx_btn_tip5 = GUI:Text_Create(btn_tip5, "tx_btn_tip5", 56.00, 17.00, 18, "#90ee90", [[属    性]])
	GUI:setAnchorPoint(tx_btn_tip5, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_tip5, false)
	GUI:setTag(tx_btn_tip5, 264)
	GUI:Text_enableOutline(tx_btn_tip5, "#000000", 1)

	-- Create tx_dqjc
	local tx_dqjc = GUI:Text_Create(img_bg, "tx_dqjc", 52.50, 59.24, 16, "#ffffff", [[当前奖池：]])
	GUI:setAnchorPoint(tx_dqjc, 0.00, 0.50)
	GUI:setTouchEnabled(tx_dqjc, false)
	GUI:setTag(tx_dqjc, 270)
	GUI:Text_enableOutline(tx_dqjc, "#000000", 1)

	-- Create tx_dqjcnum
	local tx_dqjcnum = GUI:Text_Create(tx_dqjc, "tx_dqjcnum", 77.00, 11.00, 16, "#44ddff", [[999999]])
	GUI:setAnchorPoint(tx_dqjcnum, 0.00, 0.50)
	GUI:setTouchEnabled(tx_dqjcnum, false)
	GUI:setTag(tx_dqjcnum, 271)
	GUI:Text_enableOutline(tx_dqjcnum, "#000000", 1)

	-- Create tx_myjc
	local tx_myjc = GUI:Text_Create(img_bg, "tx_myjc", 52.50, 32.91, 16, "#ffffff", [[我的捐献：]])
	GUI:setAnchorPoint(tx_myjc, 0.00, 0.50)
	GUI:setTouchEnabled(tx_myjc, false)
	GUI:setTag(tx_myjc, 321)
	GUI:Text_enableOutline(tx_myjc, "#000000", 1)

	-- Create tx_myjcnum
	local tx_myjcnum = GUI:Text_Create(tx_myjc, "tx_myjcnum", 77.00, 11.00, 16, "#44ddff", [[999999]])
	GUI:setAnchorPoint(tx_myjcnum, 0.00, 0.50)
	GUI:setTouchEnabled(tx_myjcnum, false)
	GUI:setTag(tx_myjcnum, 322)
	GUI:Text_enableOutline(tx_myjcnum, "#000000", 1)

	-- Create tx_jieshao
	local tx_jieshao = GUI:Text_Create(img_bg, "tx_jieshao", 512.50, 47.91, 16, "#ffff00", [[捐献的60%计入攻沙奖励]])
	GUI:setAnchorPoint(tx_jieshao, 0.00, 0.50)
	GUI:setTouchEnabled(tx_jieshao, false)
	GUI:setTag(tx_jieshao, 115)
	GUI:Text_enableOutline(tx_jieshao, "#000000", 1)

	-- Create Img_xian4
	local Img_xian4 = GUI:Image_Create(nd_root, "Img_xian4", 14.96, -147.61, "res/custom/shajuan/shajuan_1.png")
	GUI:setContentSize(Img_xian4, 660, 2)
	GUI:setIgnoreContentAdaptWithSize(Img_xian4, false)
	GUI:setAnchorPoint(Img_xian4, 0.50, 0.50)
	GUI:setTouchEnabled(Img_xian4, false)
	GUI:setTag(Img_xian4, 328)

	-- Create Img_xian3
	local Img_xian3 = GUI:Image_Create(nd_root, "Img_xian3", 14.96, -93.25, "res/custom/shajuan/shajuan_1.png")
	GUI:setContentSize(Img_xian3, 660, 2)
	GUI:setIgnoreContentAdaptWithSize(Img_xian3, false)
	GUI:setAnchorPoint(Img_xian3, 0.50, 0.50)
	GUI:setTouchEnabled(Img_xian3, false)
	GUI:setTag(Img_xian3, 327)

	-- Create Img_xian2
	local Img_xian2 = GUI:Image_Create(nd_root, "Img_xian2", 14.96, -38.90, "res/custom/shajuan/shajuan_1.png")
	GUI:setContentSize(Img_xian2, 660, 2)
	GUI:setIgnoreContentAdaptWithSize(Img_xian2, false)
	GUI:setAnchorPoint(Img_xian2, 0.50, 0.50)
	GUI:setTouchEnabled(Img_xian2, false)
	GUI:setTag(Img_xian2, 326)

	-- Create Img_xian1
	local Img_xian1 = GUI:Image_Create(nd_root, "Img_xian1", 14.96, 15.46, "res/custom/shajuan/shajuan_1.png")
	GUI:setContentSize(Img_xian1, 660, 2)
	GUI:setIgnoreContentAdaptWithSize(Img_xian1, false)
	GUI:setAnchorPoint(Img_xian1, 0.50, 0.50)
	GUI:setTouchEnabled(Img_xian1, false)
	GUI:setTag(Img_xian1, 325)

	-- Create BuyLayout
	local BuyLayout = GUI:Layout_Create(nd_root, "BuyLayout", -355.99, -247.32, 860.00, 440.00, false)
	GUI:Layout_setBackGroundColorType(BuyLayout, 1)
	GUI:Layout_setBackGroundColor(BuyLayout, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(BuyLayout, 0)
	GUI:setScaleX(BuyLayout, 0.85)
	GUI:setScaleY(BuyLayout, 0.85)
	GUI:setTouchEnabled(BuyLayout, false)
	GUI:setTag(BuyLayout, 431)
	GUI:setVisible(BuyLayout, false)

	-- Create Buy_img0
	local Buy_img0 = GUI:Image_Create(BuyLayout, "Buy_img0", 432.31, 218.05, "res/custom/hecheng/img_bg_3.png")
	GUI:setAnchorPoint(Buy_img0, 0.50, 0.50)
	GUI:setTouchEnabled(Buy_img0, false)
	GUI:setTag(Buy_img0, 432)

	-- Create Buy_closeBtn
	local Buy_closeBtn = GUI:Button_Create(BuyLayout, "Buy_closeBtn", 598.25, 437.73, "res/custom/common/btn_close_1_1.png")
	GUI:Button_loadTexturePressed(Buy_closeBtn, "res/custom/common/btn_close_1_2.png")
	GUI:Button_loadTextureDisabled(Buy_closeBtn, "res/custom/common/btn_close_1_2.png")
	GUI:Button_setScale9Slice(Buy_closeBtn, 8, 8, 11, 11)
	GUI:setContentSize(Buy_closeBtn, 26, 42)
	GUI:setIgnoreContentAdaptWithSize(Buy_closeBtn, false)
	GUI:Button_setTitleText(Buy_closeBtn, "")
	GUI:Button_setTitleColor(Buy_closeBtn, "#414146")
	GUI:Button_setTitleFontSize(Buy_closeBtn, 14)
	GUI:Button_titleDisableOutLine(Buy_closeBtn)
	GUI:setAnchorPoint(Buy_closeBtn, 0.00, 1.00)
	GUI:setTouchEnabled(Buy_closeBtn, true)
	GUI:setTag(Buy_closeBtn, 433)

	-- Create Buy_OkBtn
	local Buy_OkBtn = GUI:Button_Create(BuyLayout, "Buy_OkBtn", 438.00, 64.51, "res/custom/vip/vip_5.png")
	GUI:Button_loadTexturePressed(Buy_OkBtn, "res/custom/vip/vip_6.png")
	GUI:Button_loadTextureDisabled(Buy_OkBtn, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(Buy_OkBtn, 15, 15, 11, 11)
	GUI:setContentSize(Buy_OkBtn, 105, 41)
	GUI:setIgnoreContentAdaptWithSize(Buy_OkBtn, false)
	GUI:Button_setTitleText(Buy_OkBtn, "")
	GUI:Button_setTitleColor(Buy_OkBtn, "#414146")
	GUI:Button_setTitleFontSize(Buy_OkBtn, 14)
	GUI:Button_titleDisableOutLine(Buy_OkBtn)
	GUI:setAnchorPoint(Buy_OkBtn, 0.50, 0.50)
	GUI:setTouchEnabled(Buy_OkBtn, true)
	GUI:setTag(Buy_OkBtn, 444)

	-- Create tx_btn_mai
	local tx_btn_mai = GUI:Text_Create(Buy_OkBtn, "tx_btn_mai", 52.37, 21.41, 18, "#ffffff", [[捐    献]])
	GUI:setAnchorPoint(tx_btn_mai, 0.50, 0.50)
	GUI:setTouchEnabled(tx_btn_mai, false)
	GUI:setTag(tx_btn_mai, 445)
	GUI:Text_enableOutline(tx_btn_mai, "#000000", 1)

	-- Create Buy_addbtn
	local Buy_addbtn = GUI:Button_Create(BuyLayout, "Buy_addbtn", 539.00, 211.75, "res/custom/hecheng/btn_add_1.jpg")
	GUI:Button_loadTexturePressed(Buy_addbtn, "res/custom/hecheng/btn_add_2.jpg")
	GUI:Button_loadTextureDisabled(Buy_addbtn, "res/custom/hecheng/btn_add_2.jpg")
	GUI:Button_setScale9Slice(Buy_addbtn, 15, 15, 11, 11)
	GUI:setContentSize(Buy_addbtn, 42, 40)
	GUI:setIgnoreContentAdaptWithSize(Buy_addbtn, false)
	GUI:Button_setTitleText(Buy_addbtn, "")
	GUI:Button_setTitleColor(Buy_addbtn, "#414146")
	GUI:Button_setTitleFontSize(Buy_addbtn, 14)
	GUI:Button_titleDisableOutLine(Buy_addbtn)
	GUI:setAnchorPoint(Buy_addbtn, 0.50, 0.50)
	GUI:setTouchEnabled(Buy_addbtn, true)
	GUI:setTag(Buy_addbtn, 439)

	-- Create Buy_delbtn
	local Buy_delbtn = GUI:Button_Create(BuyLayout, "Buy_delbtn", 320.00, 211.75, "res/custom/hecheng/btn_del_1.jpg")
	GUI:Button_loadTexturePressed(Buy_delbtn, "res/custom/hecheng/btn_del_2.jpg")
	GUI:Button_loadTextureDisabled(Buy_delbtn, "res/custom/hecheng/btn_del_2.jpg")
	GUI:Button_setScale9Slice(Buy_delbtn, 15, 15, 11, 11)
	GUI:setContentSize(Buy_delbtn, 40, 40)
	GUI:setIgnoreContentAdaptWithSize(Buy_delbtn, false)
	GUI:Button_setTitleText(Buy_delbtn, "")
	GUI:Button_setTitleColor(Buy_delbtn, "#414146")
	GUI:Button_setTitleFontSize(Buy_delbtn, 14)
	GUI:Button_titleDisableOutLine(Buy_delbtn)
	GUI:setAnchorPoint(Buy_delbtn, 0.50, 0.50)
	GUI:setTouchEnabled(Buy_delbtn, true)
	GUI:setTag(Buy_delbtn, 440)

	-- Create Buy_img2
	local Buy_img2 = GUI:Image_Create(BuyLayout, "Buy_img2", 429.00, 212.02, "res/custom/hecheng/img_bg_2.png")
	GUI:setAnchorPoint(Buy_img2, 0.50, 0.50)
	GUI:setTouchEnabled(Buy_img2, false)
	GUI:setTag(Buy_img2, 441)

	-- Create Buy_txt3
	local Buy_txt3 = GUI:Text_Create(Buy_img2, "Buy_txt3", 111.65, 12.95, 18, "#ffffff", [[千灵符]])
	GUI:setAnchorPoint(Buy_txt3, 0.50, 0.50)
	GUI:setTouchEnabled(Buy_txt3, false)
	GUI:setTag(Buy_txt3, 446)
	GUI:Text_enableOutline(Buy_txt3, "#000000", 1)

	-- Create Buy_txt2
	local Buy_txt2 = GUI:Text_Create(Buy_img2, "Buy_txt2", 81.16, 12.86, 18, "#ffffff", [[0]])
	GUI:setAnchorPoint(Buy_txt2, 1.00, 0.50)
	GUI:setTouchEnabled(Buy_txt2, false)
	GUI:setTag(Buy_txt2, 442)
	GUI:Text_enableOutline(Buy_txt2, "#000000", 1)

	-- Create Buy_txt1
	local Buy_txt1 = GUI:TextInput_Create(Buy_img2, "Buy_txt1", 44.67, 11.91, 80.00, 20.00, 20)
	GUI:TextInput_setString(Buy_txt1, "")
	GUI:TextInput_setFontColor(Buy_txt1, "#ffffff")
	GUI:TextInput_setMaxLength(Buy_txt1, 4)
	GUI:setAnchorPoint(Buy_txt1, 0.50, 0.50)
	GUI:setTouchEnabled(Buy_txt1, true)
	GUI:setTag(Buy_txt1, 443)
end
return ui