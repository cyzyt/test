KuangBao = {}
KuangBao.ID = 30900

local _cfgkb =  cfg_kuangbao
    
function KuangBao.RequestZS(actor)
    --LOGPrint("服务端==KuangBao=="..id)
    
    local kbbiaoji = getplayvar(actor,"C_QsQkuangbao")
    if kbbiaoji == 1 then
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>你已开启狂暴之力</font>","Type":9}')
        return
    end
        
    local cfgxiaohao = _cfgkb[1]
    if cfgxiaohao.cost == nil then
        return
    end

    local name = Player.checkItemNumByTable(actor, cfgxiaohao.cost)
    if name then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>'..name..'不足</font>","Type":9}')
        return
    end
    Player.takeItemByTable(actor, cfgxiaohao.cost)
    local att1 = {}
    local att2 = cfgxiaohao.shuxing
    Player.updateSomeAddr(actor, att1, att2)
    playeffect(actor,35013,20,-15,0,0,0)
    setplayvar(actor, "HUMAN","C_QsQkuangbao",1,1) 
    sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>开启成功</font>","Type":9}')

    GameEvent.push(EventCfg.goKuangBao, actor)
end

Message.RegisterNetMsg(ssrNetMsgCfg.KuangBao, KuangBao)  --注册

-- ----------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------


local function _playerVar(actor)
    iniplayvar(actor, "integer", "HUMAN", "C_QsQkuangbao")
end

--1击杀者 2死亡者
local function _playerkillplay(actor, play)
    local mapguid = 0
    
    if not getbaseinfo(actor,-1) then return end
    if not getbaseinfo(play,-1) then return end
    local map = getbaseinfo(actor,3)
    local hournow = os.date("%H")        --获取当前时间 0-23
    hournow = tonumber(hournow)
    if hournow == 0 then --方便跨天运算
        hournow = 24
    end

    if hournow >= _cfgkb[1]["shijian"][1][1] or hournow <= _cfgkb[1]["shijian"][1][2] then
        return    --在规定时间内直接返回
    end
    
    for i=1,#_cfgkb[1]["mapid"][1] do
        if map == _cfgkb[1]["mapid"][1][i] then
            mapguid = 1
            break
        end
    end
    if getplayvar(play,"C_QsQkuangbao") == 1 then
        if mapguid == 0 then
            changemoney(actor,_cfgkb[1]["diaoluo"][1][1],"+",_cfgkb[1]["diaoluo"][1][2],"击杀拥有狂暴之力玩家",true) --奖励灵符
            setplayvar(play, "HUMAN","C_QsQkuangbao",0,1)  --死亡 取消狂暴标记
            local cfgxiaohao = _cfgkb[1]
            local att1 = cfgxiaohao.shuxing
            local att2 = {}
            Player.updateSomeAddr(play, att1, att2)  --扣除属性
            clearplayeffect(play,35013)
        end
    end
end


GameEvent.add(EventCfg.goPlayerVar, _playerVar, KuangBao)
GameEvent.add(EventCfg.onkillplay, _playerkillplay, KuangBao)


--登录附加属性  此优先于属性更新  --登录时会将属性表插入属性更新表中 然后执行属性更新操作
GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    local kbbiaoji = getplayvar(actor,"C_QsQkuangbao")
    if kbbiaoji ~= 1 then return end
    local cfg = _cfgkb[1]["shuxing"]
    if not cfg then return end 
    playeffect(actor,35013,20,-15,0,0,0)
    table.insert(loginattrs, cfg)
end, KuangBao)

-- ----------------------------↓↓↓ 外部调用 ↓↓↓---------------------------------------
--获取当前是否开启狂暴
function KuangBao.isOpenKB(actor)
    local kbbiaoji = getplayvar(actor,"C_QsQkuangbao")
    return kbbiaoji == 1
end

return KuangBao