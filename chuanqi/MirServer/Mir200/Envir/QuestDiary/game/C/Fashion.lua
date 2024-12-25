Fashion = {}
Fashion.ID = 31300

local _cfgch =  cfg_zhanshi


-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步数据
local _login_data = {ssrNetMsgCfg.Fashion_SyncResponse, 0}
function Fashion.SyncResponse(actor, logindatas)
    local tab = {}
    local fashion = getbaseinfo(actor, ConstCfg.gbase.fashion)


    if logindatas then
        _login_data[2] = fashion
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.Fashion_SyncResponse,fashion)
    end
end

function Fashion.RequestZS(actor,btn,btns,gou)
    btn = tonumber(btn)
    btns = tonumber(btns)
    local biao = ""
    if btn == 1 then
        biao = "C_QsQFashiontite"
    elseif btn == 2 then
        biao = "C_QsQFashionweapon"
    elseif btn == 3 then
        biao = "C_QsQFashionfoot"
    end
    local dqch = QaQIsPliaertite(actor,biao) --不存在时返回0 否则返回当前称号id
    if dqch ~= 0 then  --当前佩戴称号时
        QaQShuttite(actor,biao) --卸下称号时自行判断时装等属性问题  
        if dqch ~= btns then  --佩戴称号与点击称号不一样时切换
            QaQShowtite(actor,btns,biao)  --展示称号 1actor 2称号id
        end
    else
        QaQShowtite(actor,btns,biao)
    end


    local tabs = {}
    local tite_tab = json2tbl(getplayvar(actor,biao))
    
    if biao == "C_QsQFashionweapon" then
        Fashion.FashionShow(actor,gou)
    end

    if tite_tab ~= nil then
        for k, v in pairs(tite_tab) do
            table.insert(tabs,{k,v})
        end
    else
        tabs = nil
    end

    Message.sendmsg(actor, ssrNetMsgCfg.Fashion_ZSResponse,btn,2,2,tabs)
end

function Fashion.TBRequest(actor,btn)  --按钮1 为称号vip 2时装 3足迹
    btn = tonumber(btn)
    local biao = ""
    if btn == 1 then
        biao = "C_QsQFashiontite"
    elseif btn == 2 then
        biao = "C_QsQFashionweapon"
    elseif btn == 3 then
        biao = "C_QsQFashionfoot"
    end
    local tabs = {}
    local tite_tab = json2tbl(getplayvar(actor,biao))
    if tite_tab ~= nil then
        for k, v in pairs(tite_tab) do
            table.insert(tabs,{k,v})
        end
    else
        tabs = nil
    end
    Message.sendmsg(actor,ssrNetMsgCfg.Fashion_ZSResponse,btn,2,2,tabs)
end

function Fashion.FashionShow(actor,gou)  --是否展示时装

    local tite_tab = json2tbl(getplayvar(actor,"C_QsQFashionweapon"))
    
    if gou == 1 then  --显示指令
        if tite_tab ~= nil then
            if tite_tab[0] == 0 then  --但是时装为空时
                setbaseinfo(actor, ConstCfg.sbase.fashion,0)
            else    --时装不为空时  显示时装
                setbaseinfo(actor, ConstCfg.sbase.fashion,1)
            end
        end
    else   --不显示指令时
        setbaseinfo(actor, ConstCfg.sbase.fashion,0)
    end

    setbaseinfo(actor, ConstCfg.sbase.hair,0)

end

Message.RegisterNetMsg(ssrNetMsgCfg.Fashion,Fashion)  --注册

-- ----------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------
--"C_QsQFashiontite",    类型存储,   1,3    --1未添加成功时即时添加属性 3只为展示作用无实际作用
--"C_QsQFashionweapon",  类型存储,   2      --2废弃(穿上加属性脱下取消属性) 现在与称号一样获得时添加属性 让玩家可随意选择外观
--"C_QsQFashionfoot",    类型存储,   4      --4足迹根据时间再地面生产一个单次特效 添加属性与称号一致即时生效

-- QaQADDtite(actor,1,C_QsQFashiontite) 序列id 1 类型为3  传入称号表
-- QaQADDtite(actor,id,biao)    1.guid 2.序列id 3.变量表 描述 添加自定义称号，时装足迹等特效

-- QaQDeltite(actor,id,biao)    1.guid 2.序列id 3.变量表 描述 删除称号等特效

-- QaQShowtite(actor,id,biao)   1.guid 2.序列id 3.变量表 描述 展示称号等特效 与QaQShuttite作替换作用

-- QaQShuttite(actor,biao)      1.guid 2.变量表 描述 取消当前表中 已经展示的称号 等特效

-- QaQIsPliaertite(actor,biao)  1.guid 2.变量表 描述 获取 表中展示的称号 等特效 返回值 类型:num 序列id 不存在返回 0

--足迹触发关联 QF中run walk 函数 

local function _playerVar(actor)  --多表防止客户端压力过大
    iniplayvar(actor, "string", "HUMAN", "C_QsQFashiontite")    --称号表 与vip表一起展示
    iniplayvar(actor, "string", "HUMAN", "C_QsQFashionweapon")  --时装表
    iniplayvar(actor, "string", "HUMAN", "C_QsQFashionfoot")    --足迹表
end

local function _playerADDtite(actor,id,biao)
    
    local btn = 0
    if biao == "C_QsQFashiontite" then
        btn = 1
    elseif biao == "C_QsQFashionweapon" then
        btn = 2
    elseif biao == "C_QsQFashionfoot" then
        btn = 3
    end

    local tabs = {}
    local tite_tab = json2tbl(getplayvar(actor,biao))
    if tite_tab ~= nil then
        for k, v in pairs(tite_tab) do
            table.insert(tabs,{k,v})
        end
    else
        tabs = nil
    end
    Message.sendmsg(actor,ssrNetMsgCfg.Fashion_ZSResponse,btn,2,2,tabs)
end


GameEvent.add(EventCfg.goPlayerVar, _playerVar, Fashion)

GameEvent.add(EventCfg.goADDFashion, _playerADDtite, Fashion)


--登录附加属性  此优先于属性更新  --登录时会将属性表插入属性更新表中 然后执行属性更新操作
GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    
    local biao_tab = {"C_QsQFashiontite","C_QsQFashionweapon","C_QsQFashionfoot"}
    for i=1,3 do
        local tite_tab = json2tbl(getplayvar(actor,biao_tab[i]))
        --LOGDump(tite_tab)
        if type(tite_tab) == "table" then 
            for k, v in pairs(tite_tab or {}) do
                if k ~= 0 then
                    if _cfgch[k]["leixing"] ~= 3 then
                        local cfg = _cfgch[k]["shuxing"]
                        table.insert(loginattrs, cfg)
                    end
                else
                    if v ~= 0 then
                        QaQShuttite(actor,biao_tab[i])
                        QaQShowtite(actor,v,biao_tab[i])
                    end
                end
            end
        end
    end

end, Fashion)

GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas)
    Fashion.SyncResponse(actor, logindatas)
end, Fashion)

return Fashion