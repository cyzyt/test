--------------------------------------------------------------
-- This file was automatically generated by Cocos Studio.
-- Do not make changes to this file.
-- All changes will be lost.
--------------------------------------------------------------

local luaExtend = require "LuaExtend"

-- using for layout to decrease count of local variables
local layout = nil
local localLuaFile = nil
local innerCSD = nil
local innerProject = nil
local localFrame = nil

local Result = {}
------------------------------------------------------------
-- function call description
-- create function caller should provide a function to 
-- get a callback function in creating scene process.
-- the returned callback function will be registered to 
-- the callback event of the control.
-- the function provider is as below :
-- Callback callBackProvider(luaFileName, node, callbackName)
-- parameter description:
-- luaFileName  : a string, lua file name
-- node         : a Node, event source
-- callbackName : a string, callback function name
-- the return value is a callback function
------------------------------------------------------------
function Result.create(callBackProvider)

local result={}
setmetatable(result, luaExtend)

--Create Node
local Node=cc.Node:create()
Node:setName("Node")

--Create main_btn
local main_btn = ccui.Button:create()
main_btn:ignoreContentAdaptWithSize(false)
main_btn:loadTextureNormal("res/custom/normal/list_btn_2.png",0)
main_btn:loadTexturePressed("res/custom/normal/list_btn_2.png",0)
main_btn:loadTextureDisabled("res/custom/normal/list_btn_1.png",0)
main_btn:setTitleFontName("fonts/font.ttf")
main_btn:setTitleFontSize(23)
main_btn:setTitleText("四大陆")
main_btn:setScale9Enabled(true)
main_btn:setCapInsets({x = 15, y = 11, width = 122, height = 21})
main_btn:setLayoutComponentEnabled(true)
main_btn:setName("main_btn")
main_btn:setTag(1120)
main_btn:setCascadeColorEnabled(true)
main_btn:setCascadeOpacityEnabled(true)
main_btn:setPosition(80.0373, -26.0253)
layout = ccui.LayoutComponent:bindLayoutComponent(main_btn)
layout:setSize({width = 152.0000, height = 43.0000})
layout:setLeftMargin(4.0373)
layout:setRightMargin(-156.0373)
layout:setTopMargin(4.5253)
layout:setBottomMargin(-47.5253)
Node:addChild(main_btn)

--Create inner_btn_view
local inner_btn_view = ccui.ListView:create()
inner_btn_view:setItemsMargin(2)
inner_btn_view:setDirection(1)
inner_btn_view:setGravity(0)
inner_btn_view:ignoreContentAdaptWithSize(false)
inner_btn_view:setClippingEnabled(true)
inner_btn_view:setBackGroundColorOpacity(102)
inner_btn_view:setLayoutComponentEnabled(true)
inner_btn_view:setName("inner_btn_view")
inner_btn_view:setTag(1122)
inner_btn_view:setCascadeColorEnabled(true)
inner_btn_view:setCascadeOpacityEnabled(true)
inner_btn_view:setAnchorPoint(0.0000, 1.0000)
inner_btn_view:setPosition(3.0000, -3.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(inner_btn_view)
layout:setPositionPercentX(0.0197)
layout:setPositionPercentY(-0.0698)
layout:setPercentWidthEnabled(true)
layout:setPercentWidth(0.9547)
layout:setPercentHeight(3.7064)
layout:setSize({width = 145.1139, height = 159.3752})
layout:setLeftMargin(3.0000)
layout:setRightMargin(3.8861)
layout:setTopMargin(46.0000)
layout:setBottomMargin(-162.3752)
main_btn:addChild(inner_btn_view)

--Create btn_1
local btn_1 = ccui.Button:create()
btn_1:ignoreContentAdaptWithSize(false)
btn_1:loadTextureNormal("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_1:loadTexturePressed("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_1:loadTextureDisabled("res/custom/zhenshihongbao/btn_zhenchong_1_1.png",0)
btn_1:setTitleFontName("fonts/font.ttf")
btn_1:setTitleFontSize(16)
btn_1:setTitleText("5 元 真 充")
btn_1:setScale9Enabled(true)
btn_1:setCapInsets({x = 15, y = 11, width = 114, height = 15})
btn_1:setLayoutComponentEnabled(true)
btn_1:setName("btn_1")
btn_1:setTag(1123)
btn_1:setCascadeColorEnabled(true)
btn_1:setCascadeOpacityEnabled(true)
btn_1:setPosition(72.0000, 369.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_1)
layout:setPositionPercentX(0.4962)
layout:setPositionPercentY(0.9523)
layout:setPercentWidth(0.9923)
layout:setPercentHeight(0.0954)
layout:setSize({width = 144.0000, height = 37.0000})
layout:setRightMargin(1.1139)
layout:setBottomMargin(351.0000)
inner_btn_view:pushBackCustomItem(btn_1)

--Create btn_2
local btn_2 = ccui.Button:create()
btn_2:ignoreContentAdaptWithSize(false)
btn_2:loadTextureNormal("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_2:loadTexturePressed("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_2:loadTextureDisabled("res/custom/zhenshihongbao/btn_zhenchong_1_1.png",0)
btn_2:setTitleFontName("fonts/font.ttf")
btn_2:setTitleFontSize(16)
btn_2:setTitleText("5 元 真 充")
btn_2:setScale9Enabled(true)
btn_2:setCapInsets({x = 15, y = 11, width = 114, height = 15})
btn_2:setLayoutComponentEnabled(true)
btn_2:setName("btn_2")
btn_2:setLocalZOrder(1)
btn_2:setTag(1125)
btn_2:setCascadeColorEnabled(true)
btn_2:setCascadeOpacityEnabled(true)
btn_2:setPosition(72.0000, 330.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_2)
layout:setPositionPercentX(0.4962)
layout:setPositionPercentY(0.8518)
layout:setPercentWidth(0.9923)
layout:setPercentHeight(0.0954)
layout:setSize({width = 144.0000, height = 37.0000})
layout:setRightMargin(1.1139)
layout:setTopMargin(39.0000)
layout:setBottomMargin(312.0000)
inner_btn_view:pushBackCustomItem(btn_2)

--Create btn_3
local btn_3 = ccui.Button:create()
btn_3:ignoreContentAdaptWithSize(false)
btn_3:loadTextureNormal("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_3:loadTexturePressed("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_3:loadTextureDisabled("res/custom/zhenshihongbao/btn_zhenchong_1_1.png",0)
btn_3:setTitleFontName("fonts/font.ttf")
btn_3:setTitleFontSize(16)
btn_3:setTitleText("5 元 真 充")
btn_3:setScale9Enabled(true)
btn_3:setCapInsets({x = 15, y = 11, width = 114, height = 15})
btn_3:setLayoutComponentEnabled(true)
btn_3:setName("btn_3")
btn_3:setLocalZOrder(2)
btn_3:setTag(1126)
btn_3:setCascadeColorEnabled(true)
btn_3:setCascadeOpacityEnabled(true)
btn_3:setPosition(72.0000, 291.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_3)
layout:setPositionPercentX(0.4962)
layout:setPositionPercentY(0.7513)
layout:setPercentWidth(0.9923)
layout:setPercentHeight(0.0954)
layout:setSize({width = 144.0000, height = 37.0000})
layout:setRightMargin(1.1139)
layout:setTopMargin(78.0000)
layout:setBottomMargin(273.0000)
inner_btn_view:pushBackCustomItem(btn_3)

--Create btn_4
local btn_4 = ccui.Button:create()
btn_4:ignoreContentAdaptWithSize(false)
btn_4:loadTextureNormal("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_4:loadTexturePressed("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_4:loadTextureDisabled("res/custom/zhenshihongbao/btn_zhenchong_1_1.png",0)
btn_4:setTitleFontName("fonts/font.ttf")
btn_4:setTitleFontSize(16)
btn_4:setTitleText("5 元 真 充")
btn_4:setScale9Enabled(true)
btn_4:setCapInsets({x = 15, y = 11, width = 114, height = 15})
btn_4:setLayoutComponentEnabled(true)
btn_4:setName("btn_4")
btn_4:setLocalZOrder(3)
btn_4:setTag(1127)
btn_4:setCascadeColorEnabled(true)
btn_4:setCascadeOpacityEnabled(true)
btn_4:setPosition(72.0000, 252.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_4)
layout:setPositionPercentX(0.4962)
layout:setPositionPercentY(0.6508)
layout:setPercentWidth(0.9923)
layout:setPercentHeight(0.0954)
layout:setSize({width = 144.0000, height = 37.0000})
layout:setRightMargin(1.1139)
layout:setTopMargin(117.0000)
layout:setBottomMargin(234.0000)
inner_btn_view:pushBackCustomItem(btn_4)

--Create btn_5
local btn_5 = ccui.Button:create()
btn_5:ignoreContentAdaptWithSize(false)
btn_5:loadTextureNormal("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_5:loadTexturePressed("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_5:loadTextureDisabled("res/custom/zhenshihongbao/btn_zhenchong_1_1.png",0)
btn_5:setTitleFontName("fonts/font.ttf")
btn_5:setTitleFontSize(16)
btn_5:setTitleText("5 元 真 充")
btn_5:setScale9Enabled(true)
btn_5:setCapInsets({x = 15, y = 11, width = 114, height = 15})
btn_5:setLayoutComponentEnabled(true)
btn_5:setName("btn_5")
btn_5:setLocalZOrder(4)
btn_5:setTag(1128)
btn_5:setCascadeColorEnabled(true)
btn_5:setCascadeOpacityEnabled(true)
btn_5:setPosition(72.0000, 213.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_5)
layout:setPositionPercentX(0.4962)
layout:setPositionPercentY(0.5503)
layout:setPercentWidth(0.9923)
layout:setPercentHeight(0.0954)
layout:setSize({width = 144.0000, height = 37.0000})
layout:setRightMargin(1.1139)
layout:setTopMargin(156.0000)
layout:setBottomMargin(195.0000)
inner_btn_view:pushBackCustomItem(btn_5)

--Create btn_6
local btn_6 = ccui.Button:create()
btn_6:ignoreContentAdaptWithSize(false)
btn_6:loadTextureNormal("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_6:loadTexturePressed("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_6:loadTextureDisabled("res/custom/zhenshihongbao/btn_zhenchong_1_1.png",0)
btn_6:setTitleFontName("fonts/font.ttf")
btn_6:setTitleFontSize(16)
btn_6:setTitleText("5 元 真 充")
btn_6:setScale9Enabled(true)
btn_6:setCapInsets({x = 15, y = 11, width = 114, height = 15})
btn_6:setLayoutComponentEnabled(true)
btn_6:setName("btn_6")
btn_6:setLocalZOrder(5)
btn_6:setTag(1129)
btn_6:setCascadeColorEnabled(true)
btn_6:setCascadeOpacityEnabled(true)
btn_6:setPosition(72.0000, 174.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_6)
layout:setPositionPercentX(0.4962)
layout:setPositionPercentY(0.4497)
layout:setPercentWidth(0.9923)
layout:setPercentHeight(0.0954)
layout:setSize({width = 144.0000, height = 37.0000})
layout:setRightMargin(1.1139)
layout:setTopMargin(195.0000)
layout:setBottomMargin(156.0000)
inner_btn_view:pushBackCustomItem(btn_6)

--Create btn_7
local btn_7 = ccui.Button:create()
btn_7:ignoreContentAdaptWithSize(false)
btn_7:loadTextureNormal("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_7:loadTexturePressed("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_7:loadTextureDisabled("res/custom/zhenshihongbao/btn_zhenchong_1_1.png",0)
btn_7:setTitleFontName("fonts/font.ttf")
btn_7:setTitleFontSize(16)
btn_7:setTitleText("5 元 真 充")
btn_7:setScale9Enabled(true)
btn_7:setCapInsets({x = 15, y = 11, width = 114, height = 15})
btn_7:setLayoutComponentEnabled(true)
btn_7:setName("btn_7")
btn_7:setLocalZOrder(6)
btn_7:setTag(1130)
btn_7:setCascadeColorEnabled(true)
btn_7:setCascadeOpacityEnabled(true)
btn_7:setPosition(72.0000, 135.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_7)
layout:setPositionPercentX(0.4962)
layout:setPositionPercentY(0.3492)
layout:setPercentWidth(0.9923)
layout:setPercentHeight(0.0954)
layout:setSize({width = 144.0000, height = 37.0000})
layout:setRightMargin(1.1139)
layout:setTopMargin(234.0000)
layout:setBottomMargin(117.0000)
inner_btn_view:pushBackCustomItem(btn_7)

--Create btn_8
local btn_8 = ccui.Button:create()
btn_8:ignoreContentAdaptWithSize(false)
btn_8:loadTextureNormal("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_8:loadTexturePressed("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_8:loadTextureDisabled("res/custom/zhenshihongbao/btn_zhenchong_1_1.png",0)
btn_8:setTitleFontName("fonts/font.ttf")
btn_8:setTitleFontSize(16)
btn_8:setTitleText("5 元 真 充")
btn_8:setScale9Enabled(true)
btn_8:setCapInsets({x = 15, y = 11, width = 114, height = 15})
btn_8:setLayoutComponentEnabled(true)
btn_8:setName("btn_8")
btn_8:setLocalZOrder(7)
btn_8:setTag(1131)
btn_8:setCascadeColorEnabled(true)
btn_8:setCascadeOpacityEnabled(true)
btn_8:setPosition(72.0000, 96.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_8)
layout:setPositionPercentX(0.4962)
layout:setPositionPercentY(0.2487)
layout:setPercentWidth(0.9923)
layout:setPercentHeight(0.0954)
layout:setSize({width = 144.0000, height = 37.0000})
layout:setRightMargin(1.1139)
layout:setTopMargin(273.0000)
layout:setBottomMargin(78.0000)
inner_btn_view:pushBackCustomItem(btn_8)

--Create btn_9
local btn_9 = ccui.Button:create()
btn_9:ignoreContentAdaptWithSize(false)
btn_9:loadTextureNormal("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_9:loadTexturePressed("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_9:loadTextureDisabled("res/custom/zhenshihongbao/btn_zhenchong_1_1.png",0)
btn_9:setTitleFontName("fonts/font.ttf")
btn_9:setTitleFontSize(16)
btn_9:setTitleText("5 元 真 充")
btn_9:setScale9Enabled(true)
btn_9:setCapInsets({x = 15, y = 11, width = 114, height = 15})
btn_9:setLayoutComponentEnabled(true)
btn_9:setName("btn_9")
btn_9:setLocalZOrder(8)
btn_9:setTag(1132)
btn_9:setCascadeColorEnabled(true)
btn_9:setCascadeOpacityEnabled(true)
btn_9:setPosition(72.0000, 57.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_9)
layout:setPositionPercentX(0.4962)
layout:setPositionPercentY(0.1482)
layout:setPercentWidth(0.9923)
layout:setPercentHeight(0.0954)
layout:setSize({width = 144.0000, height = 37.0000})
layout:setRightMargin(1.1139)
layout:setTopMargin(312.0000)
layout:setBottomMargin(39.0000)
inner_btn_view:pushBackCustomItem(btn_9)

--Create btn_10
local btn_10 = ccui.Button:create()
btn_10:ignoreContentAdaptWithSize(false)
btn_10:loadTextureNormal("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_10:loadTexturePressed("res/custom/zhenshihongbao/btn_zhenchong_1_0.png",0)
btn_10:loadTextureDisabled("res/custom/zhenshihongbao/btn_zhenchong_1_1.png",0)
btn_10:setTitleFontName("fonts/font.ttf")
btn_10:setTitleFontSize(16)
btn_10:setTitleText("5 元 真 充")
btn_10:setScale9Enabled(true)
btn_10:setCapInsets({x = 15, y = 11, width = 114, height = 15})
btn_10:setLayoutComponentEnabled(true)
btn_10:setName("btn_10")
btn_10:setLocalZOrder(9)
btn_10:setTag(1133)
btn_10:setCascadeColorEnabled(true)
btn_10:setCascadeOpacityEnabled(true)
btn_10:setPosition(72.0000, 18.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_10)
layout:setPositionPercentX(0.4962)
layout:setPositionPercentY(0.0477)
layout:setPercentWidth(0.9923)
layout:setPercentHeight(0.0954)
layout:setSize({width = 144.0000, height = 37.0000})
layout:setRightMargin(1.1139)
layout:setTopMargin(351.0000)
inner_btn_view:pushBackCustomItem(btn_10)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Node
return result;
end

return Result

