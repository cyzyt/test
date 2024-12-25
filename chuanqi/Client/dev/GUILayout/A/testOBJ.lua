local testOBJ = {}

testOBJ.__cname = "testOBJ"

function testOBJ:main()
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    self._parent = parent
    GUI:LoadExport(parent, "A/testUI")
    self.ui = GUI:ui_delegate(parent)

    --背景关闭
    GUI:addOnClickEvent(self.ui.CloseLayout, function()
        GUI:Win_Close(self._parent)
    end)

    local posM = GUI:getWorldPosition(self.ui.CloseLayout)
    SL:dump(posM,"世界坐标")

    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)

    self.param = 0
    --给服务端发消息
    GUI:addOnClickEvent(self.ui.Button, function()
        -- SL:SendLuaNetMsg(110,self.param, 0,0, "这是来自客户端的消息")
        ssrMessage:sendmsg(ssrNetMsgCfg.test_Request, self.param, 0,0, "这是来自客户端的消息")
    end)
    
end

-- 打开面板
function testOBJ:OpenUI()
    testOBJ:main()
end

-- 修改面板内容
function testOBJ:Response(p1, p2, p3, msgData)
    testOBJ.param = p1
    local handle = GUI:GetWindow(nil,testOBJ.__cname.."/FrameLayout/Text")
    if handle then
        GUI:Text_setString(handle, "这是第"..testOBJ.param.."次交互")
    end
end


return testOBJ