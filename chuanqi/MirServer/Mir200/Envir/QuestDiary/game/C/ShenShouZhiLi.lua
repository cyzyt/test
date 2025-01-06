ShenShouZhiLi = {}
ShenShouZhiLi.ID = 30800

local _cfgsixiang =  cfg_sixiang                 

local _login_data = {ssrNetMsgCfg.ShenShouZhiLi_SyncResponse, 0}
function ShenShouZhiLi.SyncResponse(actor, logindatas)
    local map = getbaseinfo(actor,3)
    local xz = 0
    if map == "3" then
        xz = 10
    end

    
    local sszl_tab = {}
    for i=1,4 do
        local sszl = getplayvar(actor,"C_QsQshenshouzhili"..i)
        local shibai = getplayvar(actor,"C_QsQshenshouzhilishibai"..i)
        sszl_tab[i]= {sszl,shibai}
    end
    --LOGPrint("MAP="..map)
    --LOGDump(sszl_tab)
    if logindatas then
        _login_data[2] = xz
        _login_data[3] = 1
        _login_data[4] = 1
        _login_data[5] = sszl_tab
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor,ssrNetMsgCfg.ShenShouZhiLi_SyncResponse,xz,2,2,sszl_tab)
    end
end


function ShenShouZhiLi.RequestZS(actor,param,param2) ----param.消耗 11=元宝 12=灵符 param2. 第几个页面
    param = tonumber(param)
    param2 = tonumber(param2)
    local sszl = getplayvar(actor,"C_QsQshenshouzhili"..param2)
    local shibai = getplayvar(actor,"C_QsQshenshouzhilishibai"..param2)
    local dq_tab = {}

    for j=1,#_cfgsixiang do
        if _cfgsixiang[j]["type"] == param2 then
            local x = _cfgsixiang[j]["level"]
            dq_tab[x] = _cfgsixiang[j]
        end
    end
   
    if sszl >= #dq_tab then
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>已满阶</font>","Type":9}') 
        return
    end
   
    local cfgx = {dq_tab[sszl+1]["cost"][param-10]}
    local name = Player.checkItemNumByTable(actor, cfgx)   --返回不足材料 name 
    
    if name then ---检查元宝不足时  进行绑定元宝判断
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>材料不足</font>","Type":9}')
        return
    end
    
    Player.takeItemByTable(actor, cfgx)  --扣除 消耗品 材料 包括货币

    local random = math.random(1, 10000)
    local jilv = dq_tab[sszl+1]["cgjl"] + 500 * shibai
    --LOGPrint("当前成功率="..jilv)
    --LOGPrint("基础成功率="..dq_tab[sszl+1]["cgjl"])
    --LOGPrint("失败成功率="..(500 * shibai))
    if random >= jilv then
        setplayvar(actor, "HUMAN","C_QsQshenshouzhilishibai"..param2,shibai+1,1)  --失败之后 记录次数 
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>进阶失败</font>","Type":9}')
        local sszls_tab = {}
        for i=1,4 do
            local sszl = getplayvar(actor,"C_QsQshenshouzhili"..i)
            local shibai = getplayvar(actor,"C_QsQshenshouzhilishibai"..i)
            sszls_tab[i]= {sszl,shibai}
        end
    
        Message.sendmsg(actor, ssrNetMsgCfg.ShenShouZhiLi_ZSResponse,1,1,param2,sszls_tab)
        return
    end
    local dqshuxing = {}
    if sszl == 0 then
        dqshuxing = {
            attribute = {
                {[1]=74,[2]=0,},
                {[1]=75,[2]=0,},
                        },
		            }
    else
        dqshuxing = dq_tab[sszl]
    end
    local nxshuxing = dq_tab[sszl+1]
    Player.updateSomeAddr(actor,  dqshuxing.attribute,  nxshuxing.attribute)   --更新属性 当前属性 新属性

    setplayvar(actor, "HUMAN","C_QsQshenshouzhili"..param2,sszl+1,1)
    setplayvar(actor, "HUMAN","C_QsQshenshouzhilishibai"..param2,0,1) 
    sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>进阶成功</font>","Type":9}')

    local sszl_tab = {}
    for i=1,4 do
        local sszl = getplayvar(actor,"C_QsQshenshouzhili"..i)
        local shibai = getplayvar(actor,"C_QsQshenshouzhilishibai"..i)
        sszl_tab[i]= {sszl,shibai}
    end
    
    Message.sendmsg(actor, ssrNetMsgCfg.ShenShouZhiLi_ZSResponse,1,1,param2,sszl_tab)

    GameEvent.push(EventCfg.goShenShou, actor)
end

Message.RegisterNetMsg(ssrNetMsgCfg.ShenShouZhiLi, ShenShouZhiLi)

-- ----------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------
--声明变量
local function _playerVar(actor)
    for i=1,4 do
        iniplayvar(actor, "integer", "HUMAN", "C_QsQshenshouzhili"..i)   --玩家神兽之力标记
        iniplayvar(actor, "integer", "HUMAN", "C_QsQshenshouzhilishibai"..i)   --玩家失败次数标记
    end
end

--登录附加属性  此优先于属性更新  --登录时会将属性表插入属性更新表中 然后执行属性更新操作
GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    for i=1,4 do
        local dq_tab = {}
        for j=1,#_cfgsixiang do
            if _cfgsixiang[j]["type"] == i then
                local x = _cfgsixiang[j]["level"]
                dq_tab[x] = _cfgsixiang[j]
            end
        end
        local sszl = getplayvar(actor,"C_QsQshenshouzhili"..i)
        if sszl > 0 then 
            table.insert(loginattrs, dq_tab[sszl]["attribute"])
        end
    end
end, ShenShouZhiLi)

GameEvent.add(EventCfg.goPlayerVar, _playerVar, ShenShouZhiLi) --声明变量

GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas) --登录同步数据
    ShenShouZhiLi.SyncResponse(actor, logindatas)
end, ShenShouZhiLi)

return ShenShouZhiLi