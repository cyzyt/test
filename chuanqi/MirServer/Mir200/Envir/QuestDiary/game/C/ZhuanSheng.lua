ZhuanSheng = {}
ZhuanSheng.ID = 30000


local _cfgrein = cfg_rein

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步数据
local _login_data = {ssrNetMsgCfg.ZhuanSheng_SyncResponse, 0}
function ZhuanSheng.SyncResponse(actor, logindatas)
   
    local zslevel = getbaseinfo(actor, ConstCfg.gbase.renew_level)  --转生等级(常量)
    --LOGPrint("服务端=="..type(zslevel))
    --LOGPrint("服务端=="..zslevel)
    if logindatas then
        _login_data[2] = zslevel
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.ZhuanSheng_SyncResponse, zslevel)
    end
end


function ZhuanSheng.RequestZS(actor)
    --LOGPrint("11")
    local orhuobi = 0
    local zslevel = getbaseinfo(actor, ConstCfg.gbase.renew_level)  --获取转生等级(常量) 
    local next_zslevel = zslevel + 1   --当前转生等级+1成为下一转生等级  方便判断
    local cfg = _cfgrein[zslevel]           --获取当前转生等级的表
    local next_cfg = _cfgrein[next_zslevel] --获取下一转生等级的表

---------------进入条件判断阶段

    --检查满转
    if not next_cfg then    --当没有下一转生等级表时  表示满层了
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>无法继续转生</font>","Type":9}')
        return
    end

    --检查等级
    local level = getbaseinfo(actor, ConstCfg.gbase.level)  --获取人物等级
    if level < cfg.Level then       --判断人物等级是否满足条件
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>当前等级不足</font>","Type":9}')
        return
    end

    -- 检查材料
    local name = Player.checkItemNumByTable(actor, cfg.Consume)   --返回不足材料 name 
    if name then ---检查元宝不足时  进行绑定元宝判断
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>材料不足</font>","Type":9}')
        return
    end
---------------进入动作执行阶段
    Player.takeItemByTable(actor, cfg.Consume)  --材料 包括货币
    changelevel(actor, "-", cfg.DelLv)          --等级
    setbaseinfo(actor, ConstCfg.gbase.renew_level, next_zslevel)  --转生常量
    Player.updateSomeAddr(actor, cfg.Attribute0, next_cfg.Attribute0)   --更新属性 当前属性 新属性
    --计算方式为  统计表1 减去表1中的属性值  再加上表2中的值

---------------进入游戏展示阶段
    ---通知客户端更新数据

    Message.sendmsg(actor, ssrNetMsgCfg.ZhuanSheng_ZSResponse, next_zslevel)

    --派发转生数据
    GameEvent.push(EventCfg.goZSLevelChange, actor, next_zslevel, zslevel)
    
    --LOGPrint("mainend")
end

Message.RegisterNetMsg(ssrNetMsgCfg.ZhuanSheng, ZhuanSheng)  --注册

-- ----------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------
--登录附加属性  此优先于属性更新  --登录时会将属性表插入属性更新表中 然后执行属性更新操作
GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    local zslevel = getbaseinfo(actor, ConstCfg.gbase.renew_level)
    --LOGWrite(zslevel, type(zslevel))
    if zslevel <= 0 then return end    --没转生
    local cfg = _cfgrein[zslevel]
    if not cfg then return end  --当前转生表不存在  终止 

    table.insert(loginattrs, cfg.Attribute0)
end, ZhuanSheng)



--登录完成
GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas)
    ZhuanSheng.SyncResponse(actor, logindatas)
end, ZhuanSheng)

---------------------------离线更新属性



return ZhuanSheng

