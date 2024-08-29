VIP = {}
VIP.ID = 31000

local _cfgkb =  cfg_vip
    
local _login_data = {ssrNetMsgCfg.VIP_SyncResponse, 0}
function VIP.SyncResponse(actor, logindatas)
    local viplevel = getplayvar(actor,"C_QsQVIP")
    
    if logindatas then
        _login_data[2] = viplevel
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.VIP_SyncResponse,viplevel)
    end
end

function VIP.RequestZS(actor,btn)
    --LOGPrint("服务端==VIP=="..id)
    btn = tonumber(btn)
    local viplevel = getplayvar(actor,"C_QsQVIP")
    if viplevel == #_cfgkb then
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>VIP等级已满</font>","Type":9}')
        return
    end
    if btn < (viplevel+1) then
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>你已激活'.._cfgkb[btn]["Txt"]..'</font>","Type":9}')
        return
    end
    if btn > (viplevel+1) then
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>'.._cfgkb[btn-1]["Txt"]..'未激活无法购买</font>","Type":9}')
        return
    end

    local huibi = querymoney(actor,7)
    if huibi < _cfgkb[btn]["NeedExp"] then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>灵符不足</font>","Type":9}')
        return
    end



    local gezhi = #_cfgkb[btn]["Gift"]
    local bag_num = getbagblank(actor)
    --LOGWrite("111="..bag_num)
    if gezhi > bag_num then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>背包格子不足</font>","Type":9}')
        return
    end
    
    changemoney(actor,7,"-",_cfgkb[btn]["NeedExp"],"激活VIP",true)
    for i=1,gezhi do
        if Item.isCurrency(_cfgkb[btn]["Gift"][i][1]) then  --判断是否是货币
            changemoney(actor,_cfgkb[btn]["Gift"][i][1],"+",_cfgkb[btn]["Gift"][i][2],"VIP",true)
        else
            giveitem(actor, Item.getNameByIdx(_cfgkb[btn]["Gift"][i][1]),_cfgkb[btn]["Gift"][i][2])
        end
    end
    
    local att1 = {}
    if btn == 1 then
        att1 = {}
    else
        att1 = _cfgkb[btn-1]["shuxing"]
    end
    
    local att2 = _cfgkb[btn]["shuxing"]
    Player.updateSomeAddr(actor, att1, att2)

    QaQADDtite(actor,_cfgkb[btn]["modelinfo"],"C_QsQFashiontite")
    if QaQIsPliaertite(actor,"C_QsQFashiontite") == 0 then
        QaQShowtite(actor,_cfgkb[btn]["modelinfo"],"C_QsQFashiontite")
    else
        QaQShuttite(actor,"C_QsQFashiontite")
        QaQShowtite(actor,_cfgkb[btn]["modelinfo"],"C_QsQFashiontite")
    end


    setplayvar(actor, "HUMAN","C_QsQVIP",viplevel+1,1) 
    sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>激活成功</font>","Type":9}')

------------------------------------------根据等级解锁功能
    local viplevel = getplayvar(actor,"C_QsQVIP")
    Message.sendmsg(actor, ssrNetMsgCfg.VIP_ZSResponse, btn,viplevel)
    if _cfgkb[viplevel]["DropToMap"] == 1 then
        local jl = checkspritelevel(actor,"狗哥")
        if type(jl) == "boolean" then
            if not jl then
                createsprite(actor,"狗哥")
                pickupitems(actor,0,10,500)
            end
        end
    end
    GameEvent.push(EventCfg.goVIPlvelup, actor,viplevel)
end

Message.RegisterNetMsg(ssrNetMsgCfg.VIP, VIP)  --注册

-- ----------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------


local function _playerVar(actor)
    iniplayvar(actor, "integer", "HUMAN", "C_QsQVIP")
end

local function _playeritem(actor,item)
    local item_id = getiteminfo(actor, item, ConstCfg.iteminfo.idx)
    local bag_num = Bag.getItemNumByIdx(actor, item_id)
    local viplevel = getplayvar(actor,"C_QsQVIP")
    if viplevel ~= 0 then 
        local name = getstditeminfo(item_id, ConstCfg.stditeminfo.name)
        local price = getstditeminfo(item_id, ConstCfg.stditeminfo.price)
        --LOGWrite("触发", bag_num, name)
        if price == 9999 then
            --LOGWrite("触发=="..price)
            eatitem(actor,name,bag_num)
        end
    end
end

GameEvent.add(EventCfg.goPlayerVar, _playerVar, VIP)

--登录附加属性  此优先于属性更新  --登录时会将属性表插入属性更新表中 然后执行属性更新操作
GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    local viplevel = getplayvar(actor,"C_QsQVIP")
    if viplevel == 0 then return end
    if _cfgkb[viplevel]["DropToMap"] == 1 then
        local jl = checkspritelevel(actor,"狗哥")
        if type(jl) == "boolean" then
            if not jl then
                createsprite(actor,"狗哥")
                pickupitems(actor,0,10,500)
            end
        end
    end
    

    local cfg = _cfgkb[viplevel]["shuxing"]
    if not cfg then return end 
    table.insert(loginattrs, cfg)
end, VIP)


GameEvent.add(EventCfg.onAddBag, _playeritem, VIP) ---物品进背包

GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas)
    VIP.SyncResponse(actor, logindatas)
end, VIP)


return VIP