local ui = {}
function ui.init(parent)
	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(parent, "CloseLayout", 0.00, 0.00, 1136.00, 640.00, false)
	GUI:Layout_setBackGroundColorType(CloseLayout, 1)
	GUI:Layout_setBackGroundColor(CloseLayout, "#000000")
	GUI:Layout_setBackGroundColorOpacity(CloseLayout, 76)
	GUI:setTouchEnabled(CloseLayout, true)
	GUI:setTag(CloseLayout, -1)

	-- Create FrameLayout
	local FrameLayout = GUI:Layout_Create(parent, "FrameLayout", 568.00, 320.00, 790.00, 536.00, false)
	GUI:setAnchorPoint(FrameLayout, 0.50, 0.50)
	GUI:setTouchEnabled(FrameLayout, true)
	GUI:setTag(FrameLayout, -1)

	-- Create FrameBG
	local FrameBG = GUI:Image_Create(FrameLayout, "FrameBG", 0.00, 0.00, "res/public/1900000610.png")
	GUI:setTouchEnabled(FrameBG, false)
	GUI:setTag(FrameBG, -1)

	-- Create DressIMG
	local DressIMG = GUI:Image_Create(FrameLayout, "DressIMG", -14.00, 474.00, "res/public/1900000610_1.png")
	GUI:setTouchEnabled(DressIMG, false)
	GUI:setTag(DressIMG, -1)

	-- Create TitleText
	local TitleText = GUI:Text_Create(FrameLayout, "TitleText", 36.00, 498.00, 20, "#d8c8ae", [[demo]])
	GUI:setTouchEnabled(TitleText, false)
	GUI:setTag(TitleText, -1)
	GUI:Text_enableOutline(TitleText, "#000000", 1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(FrameLayout, "CloseButton", 781.00, 493.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 10)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create AttachLayout
	local AttachLayout = GUI:Layout_Create(FrameLayout, "AttachLayout", 30.00, 40.00, 732.00, 445.00, false)
	GUI:setTouchEnabled(AttachLayout, false)
	GUI:setTag(AttachLayout, -1)

	-- Create Text
	local Text = GUI:Text_Create(FrameLayout, "Text", 283.00, 287.00, 32, "#ffffff", [[这是第一个自定义面板]])
	GUI:setAnchorPoint(Text, 0.50, 0.50)
	GUI:setTouchEnabled(Text, false)
	GUI:setTag(Text, -1)
	GUI:Text_enableOutline(Text, "#000000", 1)

	-- Create Button
	local Button = GUI:Button_Create(FrameLayout, "Button", 532.00, 267.00, "res/private/gui_edit/Button_Normal.png")
	GUI:Button_loadTexturePressed(Button, "res/private/gui_edit/Button_Press.png")
	GUI:Button_loadTextureDisabled(Button, "res/private/gui_edit/Button_Disable.png")
	GUI:setContentSize(Button, 160, 36)
	GUI:setIgnoreContentAdaptWithSize(Button, false)
	GUI:Button_setTitleText(Button, "给服务端发送101号消息")
	GUI:Button_setTitleColor(Button, "#ffffff")
	GUI:Button_setTitleFontSize(Button, 14)
	GUI:Button_titleEnableOutline(Button, "#000000", 1)
	GUI:setTouchEnabled(Button, true)
	GUI:setTag(Button, -1)

	-- Create ListView
	local ListView = GUI:ListView_Create(parent, "ListView", 0.00, 0.00, 500.00, 200.00, 1)
	GUI:ListView_setBackGroundColorType(ListView, 1)
	GUI:ListView_setBackGroundColor(ListView, "#9696ff")
	GUI:ListView_setBackGroundColorOpacity(ListView, 100)
	GUI:ListView_setGravity(ListView, 5)
	GUI:setTouchEnabled(ListView, true)
	GUI:ListView_setDirection(ListView, 2)
	GUI:setTag(ListView, -1)

	-- Create ImageView
	local ImageView = GUI:Image_Create(ListView, "ImageView", 0.00, 77.00, "res/private/gui_edit/ImageFile.png")
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create ImageView_1
	local ImageView_1 = GUI:Image_Create(ListView, "ImageView_1", 46.00, 77.00, "res/private/gui_edit/ImageFile.png")
	GUI:setTouchEnabled(ImageView_1, false)
	GUI:setTag(ImageView_1, -1)

	-- Create ImageView_2
	local ImageView_2 = GUI:Image_Create(ListView, "ImageView_2", 92.00, 77.00, "res/private/gui_edit/ImageFile.png")
	GUI:setTouchEnabled(ImageView_2, false)
	GUI:setTag(ImageView_2, -1)

	-- Create ImageView_3
	local ImageView_3 = GUI:Image_Create(ListView, "ImageView_3", 138.00, 77.00, "res/private/gui_edit/ImageFile.png")
	GUI:setTouchEnabled(ImageView_3, false)
	GUI:setTag(ImageView_3, -1)

	-- Create ImageView_4
	local ImageView_4 = GUI:Image_Create(ListView, "ImageView_4", 184.00, 77.00, "res/private/gui_edit/ImageFile.png")
	GUI:setTouchEnabled(ImageView_4, false)
	GUI:setTag(ImageView_4, -1)

	-- Create ImageView_5
	local ImageView_5 = GUI:Image_Create(ListView, "ImageView_5", 230.00, 77.00, "res/private/gui_edit/ImageFile.png")
	GUI:setTouchEnabled(ImageView_5, false)
	GUI:setTag(ImageView_5, -1)

	-- Create ImageView_6
	local ImageView_6 = GUI:Image_Create(ListView, "ImageView_6", 276.00, 77.00, "res/private/gui_edit/ImageFile.png")
	GUI:setTouchEnabled(ImageView_6, false)
	GUI:setTag(ImageView_6, -1)

	-- Create ImageView_7
	local ImageView_7 = GUI:Image_Create(ListView, "ImageView_7", 322.00, 77.00, "res/private/gui_edit/ImageFile.png")
	GUI:setTouchEnabled(ImageView_7, false)
	GUI:setTag(ImageView_7, -1)

	-- Create ImageView_8
	local ImageView_8 = GUI:Image_Create(ListView, "ImageView_8", 368.00, 77.00, "res/private/gui_edit/ImageFile.png")
	GUI:setTouchEnabled(ImageView_8, false)
	GUI:setTag(ImageView_8, -1)

	-- Create ImageView_9
	local ImageView_9 = GUI:Image_Create(ListView, "ImageView_9", 414.00, 77.00, "res/private/gui_edit/ImageFile.png")
	GUI:setTouchEnabled(ImageView_9, false)
	GUI:setTag(ImageView_9, -1)

	-- Create ImageView_10
	local ImageView_10 = GUI:Image_Create(ListView, "ImageView_10", 460.00, 77.00, "res/private/gui_edit/ImageFile.png")
	GUI:setTouchEnabled(ImageView_10, false)
	GUI:setTag(ImageView_10, -1)

	-- Create ImageView_11
	local ImageView_11 = GUI:Image_Create(ListView, "ImageView_11", 506.00, 77.00, "res/private/gui_edit/ImageFile.png")
	GUI:setTouchEnabled(ImageView_11, false)
	GUI:setTag(ImageView_11, -1)
end
return ui