TurnTableOBJ = {}

TurnTableOBJ.__cname = "TurnTableOBJ"

 -- 转盘角度，速度，减速度，定时器id，目标角度
 local angle = 0
 local speed = 460
 local deceleration = 12.9
 local minspeed = 1
 local timerId = nil
 local targetAngle = 0
 local x

 local rewards = {
    1,--"4元宝", 
    2, --"1灵符",
    3,--"3金条",
    4,--未抽到奖品
    5,--未抽到奖品
    6,--未抽到奖品
}

function TurnTableOBJ.main()
    local parent = GUI:Win_Create("TurnTableOBJ", 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, "B/TurnTableUI")

    TurnTableOBJ._parent = parent
    TurnTableOBJ.ui = GUI:ui_delegate(parent)

    --关闭按钮
    GUI:addOnClickEvent(TurnTableOBJ.ui.Btn_close, function ()
        GUI:Win_Close(TurnTableOBJ._parent)
    end)

    --开始抽奖
    GUI:addOnClickEvent(TurnTableOBJ.ui.Btn_start, function()
        TurnTableOBJ.RequestChujiang("客户端请求抽奖")
    end)

    --重置转盘
    GUI:addOnClickEvent(TurnTableOBJ.ui.Btn_reset, function ()
        angle = 0
        targetAngle = 0
        GUI:setRotation(TurnTableOBJ.ui.Img_turntable, 0)
    end)

    --金条
    local setData_1  = {}
    setData_1.index = 20157               -- 物品Index
    setData_1.look  = true                  -- 是否显示tips
    setData_1.bgVisible = false              -- 是否显示背景框
    local jintiao = GUI:ItemShow_Create(TurnTableOBJ.ui.Img_turntable, "0", 240, 174, setData_1)
    GUI:setRotation(jintiao, 72)
    GUI:setScale(jintiao, 1.3)
    --元宝
    local setData_2  = {}
    setData_2.index = 2    
    setData_2.look  = true                  
    setData_2.bgVisible = false             
    local yuanbao = GUI:ItemShow_Create(TurnTableOBJ.ui.Img_turntable, "1", 110, 194, setData_2)
    GUI:setRotation(yuanbao,-75 )
    --灵符
    local setData_3  = {}
    setData_3.index = 7   
    setData_3.look  = true                
    setData_3.bgVisible = false             
    local linfu = GUI:ItemShow_Create(TurnTableOBJ.ui.Img_turntable, "3", 162, 133, setData_3)
    GUI:setRotation(linfu,160 )
    GUI:setScale(linfu, 1,3)


end

--启动转盘
function TurnTableOBJ.startturn()
    speed = 375
    angle = 0
    --每帧更新转盘显示
    timerId = ssr.Schedule(TurnTableOBJ.update, 0)
    --禁止重置转盘
    GUI:Button_setGrey(TurnTableOBJ.ui.Btn_reset, true)
    GUI:Button_setBrightEx(TurnTableOBJ.ui.Btn_reset, false)
end

--转盘的更新函数
function  TurnTableOBJ.update(dt)
    local deltaAngle = speed * dt
    angle = angle + deltaAngle
    speed = speed - deceleration * dt*3
    --判断是否达到目标角度
        if angle >= targetAngle then
            --停止定时器
            ssr.UnSchedule(timerId)
            timerId = nil
            --angle = targetAngle
            TurnTableOBJ.rewardtip()
            GUI:Timeline_StopAll(TurnTableOBJ.ui.Img_turntable)
            GUI:Button_setGrey(TurnTableOBJ.ui.Btn_reset, false)
            GUI:Button_setBrightEx(TurnTableOBJ.ui.Btn_reset, true)
        end
    --更新转盘的显示
    GUI:setRotation(TurnTableOBJ.ui.Img_turntable, angle)

end

--获得奖励提示
function TurnTableOBJ.rewardtip()
    SL:Print("x得值为"..x)
    if x == rewards[1] then
        SL:ShowSystemTips("恭喜您获得4枚元宝,请到背包中查看")
    elseif x == rewards[2] then
        SL:ShowSystemTips("恭喜您获得1个灵符,请到背包中查看")
    elseif x == rewards[3] then
        SL:ShowSystemTips("恭喜您获得3只金条,请到背包中查看")
    elseif x == rewards[4] then
        SL:ShowSystemTips("很遗憾，您未抽中奖品")
    elseif x == rewards[5] then
        SL:ShowSystemTips("很遗憾，您未抽中奖品")
    elseif x == rewards[6] then
        SL:ShowSystemTips("很遗憾，您未抽中奖品")
    elseif x == rewards[7] then
        SL:ShowSystemTips("很遗憾，您未抽中奖品")
    end
end

---------------------------------------网络消息---------------------------------------------------

function TurnTableOBJ.RequestChujiang(msgData)
    ssrMessage:sendmsg(ssrNetMsgCfg.TurnTable_RequestChujiang , 0, 0, 0,msgData)  
end

--元宝足够可以抽奖
SL:RegisterLuaNetMsg(ssrNetMsgCfg.TurnTable_ChujiangRequest, function(msgID, page1, page2, page3, msgData)
    SL:Print("测试从服务端传送回来的数据"..msgID, page1, page2, page3, msgData)
    x = page3
    targetAngle = msgData + 4*360
    TurnTableOBJ.startturn()
end)

--元宝不足不能抽奖
SL:RegisterLuaNetMsg(ssrNetMsgCfg.TurnTable_NO_ChujiangRequest_1, function()
    SL:ShowSystemTips("元宝不足不能抽奖")
end)

return TurnTableOBJ

