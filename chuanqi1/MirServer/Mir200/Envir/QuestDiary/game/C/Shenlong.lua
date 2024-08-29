Shenlong = {}
Shenlong.ID = 31500


local cfg_mystery_stores =  cfg_mystery_store

local cfg = {}
local num = 1
for k,v in ipairs(cfg_mystery_stores) do
    if v.sellId == 102 then
        cfg[num] = v
        num = num + 1
    end
end
    
local var = "C_QsQshenlong"

local _login_data = {ssrNetMsgCfg.Shenlong_SyncResponse, 0}
function Shenlong.SyncResponse(actor, logindatas)
    local tian_tab = {}

    local lingqu = {}
    for i=1,6 do
        lingqu[i] = getplayvar(actor,var..i)
    end
    local daycz = getplayvar(actor,"C_QsQDayRecharge")  --日冲 shangyehuodong3声明与操作

    tian_tab[1]=lingqu

    if logindatas then
        _login_data[2] = daycz
        _login_data[3] = 1
        _login_data[4] = 1
        _login_data[5] = tian_tab
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.Shenlong_SyncResponse,daycz,2,2,tian_tab)
    end
    
    
end

function Shenlong.RequestZS(actor,param)
    local param = tonumber(param)
    
    local daycz = getplayvar(actor,"C_QsQDayRecharge")
    if getplayvar(actor,var..param) ~= 0 then
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>已领取</font>","Type":9}')
        return
    end
  
    -- local openDay = grobalinfo(1)  --获取开服天数
    -- if openDay < 15 then  --15天之后开启
    --     sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>活动暂未开启</font>","Type":9}')
    --     return
    -- end
    
    if cfg == nil then
        return
    end

    if daycz < cfg[param]["price"]  then
        GameEvent.push(EventCfg.goQuickAccess, actor,ConstCfg.money.lf)
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>今日充值不足</font>","Type":9}')
        return
    end

    local tab = cfg[param]["itemId"]
    for i=1,#tab do  
        if Item.isCurrency(tab[i][1]) then
            changemoney(actor,tab[i][1],"+",tab[i][2],"连续充值",true)
        else
            giveitem(actor, Item.getNameByIdx(tab[i][1]),tab[i][2])
        end
    end

    setplayvar(actor, "HUMAN",var..param,1,1)  --记录领取
    sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>领取成功</font>","Type":9}')       --告诉玩家领取成功    
        

    local tian_tab = {}

    local lingqu = {}
    for i=1,6 do
        lingqu[i] = getplayvar(actor,var..i)
    end
    
    tian_tab[1]=lingqu

    Message.sendmsg(actor, ssrNetMsgCfg.Shenlong_ZSResponse,daycz,2,2,tian_tab)
end

Message.RegisterNetMsg(ssrNetMsgCfg.Shenlong, Shenlong)

---------------------------离线更新属性
--声明变量
local function _playerVar(actor)
    for i=1,6 do
        iniplayvar(actor, "integer", "HUMAN", var..i)
    end
end

--变量清空
local function _playerBeforedawn()
    for i=1,6 do
        clearhumcustvar("",var..i)
    end
    local players = getplayerlst()
    for i=1,#players do
        Shenlong.SyncResponse(players[i], logindatas)
    end
end


--日冲变量在 ShangYeHuoDong3 声明与操作 C_QsQDayRecharge
local function _playerrecharge(actor, gold, productid, moneyid)--充值     (参数：actor, 充值索引, 充值金额分)
    Shenlong.SyncResponse(actor)
end


GameEvent.add(EventCfg.onRecharge,  _playerrecharge, Shenlong)  --充值
GameEvent.add(EventCfg.goPlayerVar, _playerVar, Shenlong) --声明变量
GameEvent.add(EventCfg.roBeforedawn,  _playerBeforedawn, Shenlong)  --每日凌晨触发清空玩家变量
GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas) --登录同步数据
    Shenlong.SyncResponse(actor, logindatas)
end, Shenlong)

return Shenlong