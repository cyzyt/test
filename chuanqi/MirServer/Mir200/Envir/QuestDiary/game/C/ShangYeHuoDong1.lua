ShangYeHuoDong1 = {}
ShangYeHuoDong1.ID = 30200

local _cfgactivity =  cfg_activity            --开服活动表
local _cfgleichong =  cfg_activity_leichong            --开服活动表

local _login_data = {ssrNetMsgCfg.ShangYeHuoDong1_SyncResponse, 0}
function ShangYeHuoDong1.SyncResponse(actor, logindatas)
    local tian_tab = {}
    local tian = json2tbl(getplayvar(actor,"C_QsQmeiri"))
    if type(tian) ~= "table" then   --初始化表
        local timetab = {0,0} 
        setplayvar(actor, "HUMAN","C_QsQmeiri",tbl2json(timetab),1)  --每日充值累计天数
    end
    local tian = json2tbl(getplayvar(actor,"C_QsQmeiri"))
    local lingqu = {getplayvar(actor,"C_QsQmeirilq1"),getplayvar(actor,"C_QsQmeirilq2"),getplayvar(actor,"C_QsQmeirilq3"),getplayvar(actor,"C_QsQmeirilq4"),getplayvar(actor,"C_QsQmeirilq5"),getplayvar(actor,"C_QsQmeirilq6")}
    tian_tab[1]=tian
    tian_tab[2]=lingqu
   
    
    if logindatas then
        _login_data[2] = 1
        _login_data[3] = 1
        _login_data[4] = 1
        _login_data[5] = tian_tab
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.ShangYeHuoDong1_SyncResponse,2,2,2,tian_tab)
    end

end


function ShangYeHuoDong1.RequestZS(actor,param)
    local param = tonumber(param)
    local richong = getplayvar(actor,"C_QsQmeiri")
    richong = json2tbl(richong)
    local actid = 0
    
    for k=1,#_cfgactivity do
        if _cfgactivity[k]["activityType"] == 1 then
            local openDay = grobalinfo(1)  --获取开服天数
            if openDay >= _cfgactivity[k]["startTime"] and openDay <= _cfgactivity[k]["overTime"] then
                actid = _cfgactivity[k]["id"]
                break
            end
        end
    end

    if type(richong) ~= "table" then
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>无法领取</font>","Type":9}')
        return
    end
      
    if richong[1] < param then    --判断是否有充值次数大于当前领取次数
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>无法领取</font>","Type":9}')
        return
    end 

    if getplayvar(actor,"C_QsQmeirilq"..param) == 1  then    --判断当前物品是否领取
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>已领取</font>","Type":9}')
        return
    end

    for j=1,#_cfgleichong do
        if actid == _cfgleichong[j]["type"] then
            if _cfgleichong[j]["day"] == param then
                for i=1,4 do
                    if Item.isCurrency(_cfgleichong[j]["reward"][i][1]) then  --判断是否是货币
                        changemoney(actor,_cfgleichong[j]["reward"][i][1],"+",_cfgleichong[j]["reward"][i][2],"连续充值",true)
                    else
                        giveitem(actor, Item.getNameByIdx(_cfgleichong[j]["reward"][i][1]),_cfgleichong[j]["reward"][i][2],ConstCfg.binding)
                    end
                end
            end
        end
    end
    setplayvar(actor, "HUMAN","C_QsQmeirilq"..param,1,1)  --记录领取次数
    sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>领取成功</font>","Type":9}')       --告诉玩家领取成功
    
    local tian_tab = {}
    local tian = json2tbl(getplayvar(actor,"C_QsQmeiri"))
    local lingqu = {getplayvar(actor,"C_QsQmeirilq1"),getplayvar(actor,"C_QsQmeirilq2"),getplayvar(actor,"C_QsQmeirilq3"),getplayvar(actor,"C_QsQmeirilq4"),getplayvar(actor,"C_QsQmeirilq5"),getplayvar(actor,"C_QsQmeirilq6")}
    
    tian_tab[1]=tian
    tian_tab[2]=lingqu

    Message.sendmsg(actor, ssrNetMsgCfg.ShangYeHuoDong1_ZSResponse,2,2,2,tian_tab)
end

Message.RegisterNetMsg(ssrNetMsgCfg.ShangYeHuoDong1, ShangYeHuoDong1)


---------------------------离线更新属性
--声明变量
local function _playerVar(actor)
    iniplayvar(actor, "string", "HUMAN", "C_QsQmeiri")   --每日充值  此处类型为string 使用周变量规则
    iniplayvar(actor, "integer", "HUMAN", "C_QsQmeirilq1")   --每日充值 是否领取
    iniplayvar(actor, "integer", "HUMAN", "C_QsQmeirilq2")   --每日充值 是否领取
    iniplayvar(actor, "integer", "HUMAN", "C_QsQmeirilq3")   --每日充值 是否领取
    iniplayvar(actor, "integer", "HUMAN", "C_QsQmeirilq4")   --每日充值 是否领取
    iniplayvar(actor, "integer", "HUMAN", "C_QsQmeirilq5")   --每日充值 是否领取
    iniplayvar(actor, "integer", "HUMAN", "C_QsQmeirilq6")   --每日充值 是否领取
end



--变量清空
local function _playerroBeforedawn()
    local huodong = false
    for k=1,#_cfgactivity do
        if _cfgactivity[k]["activityType"] == 1 then
            local openDay = grobalinfo(1)  --获取开服天数
            if openDay >= _cfgactivity[k]["startTime"] and openDay <= _cfgactivity[k]["overTime"] then
                huodong = true
                break
            end
        end
    end
    if huodong then
        local qjtian = getsysvarex("C_QsQsyhdweek")  
        if qjtian >= 5 then  --开启循环
            clearhumcustvar("","C_QsQmeiri")
            setsysvarex("C_QsQsyhdweek",0, 1)
            for i=1, 6 do
                clearhumcustvar("","C_QsQmeirilq"..i)
            end
        else
            setsysvarex("C_QsQsyhdweek", qjtian+1, 1)
        end
    end
    local players = getplayerlst()
    for i=1,#players do
        ShangYeHuoDong1.SyncResponse(players[i],logindatas)
    end
end


--充值成功时
local function _playerrecharge(actor)
    local now = os.date("*t")           --获取当前时间
    local timenow = os.time({year=now.year, month=now.month, day=now.day})
    local xx = json2tbl(getplayvar(actor,"C_QsQmeiri"))   --反序列化
    if type(xx) ~= "table" then   --判断变量是否使用
        xx = 0
        local timetab = {(xx+1),timenow} 
        setplayvar(actor, "HUMAN","C_QsQmeiri",tbl2json(timetab),1)  --每日充值累计天数
    elseif xx[2] ~= timenow then  --判断天数是否一致
        local timetab = {(xx[1]+1),timenow} 
        setplayvar(actor, "HUMAN","C_QsQmeiri",tbl2json(timetab),1)  --每日充值累计天数
    end
    ShangYeHuoDong1.SyncResponse(actor,logindatas)
end



GameEvent.add(EventCfg.goPlayerVar, _playerVar, ShangYeHuoDong1) --声明变量
GameEvent.add(EventCfg.roBeforedawn,  _playerroBeforedawn, ShangYeHuoDong1)  --每日凌晨触发
GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas) --登录同步数据
    ShangYeHuoDong1.SyncResponse(actor, logindatas)
end, ShangYeHuoDong1)

GameEvent.add(EventCfg.onRecharge,  _playerrecharge, ShangYeHuoDong1)  --充值



return ShangYeHuoDong1