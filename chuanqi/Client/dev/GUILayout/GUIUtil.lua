local function init()
    --全局方法
    SL:Require("GUILayout/ssrgame/util/logger",true)
    SL:Require("GUILayout/ssrgame/util/uiEx",true)
    SL:Require("GUILayout/ssrgame/util/util",true)
    --配置
    ssrConstCfg = SL:Require("GUILayout/ssrgame/cfg/ConstCfg",true)
    ssrRTextCfg = SL:Require("GUILayout/ssrgame/cfg/RTextCfg",true)
    --事件
    ssrEventCfg = SL:Require("GUILayout/ssrgame/cfg/EventCfg",true)
    ssrGameEvent = SL:Require("GUILayout/ssrgame/ui/GameEvent",true)

    --网络
    ssrNetMsgCfg = SL:Require("GUILayout/ssrgame/net/NetMsgCfg",true)
    ssrMessage = SL:Require("GUILayout/ssrgame/net/Message",true):Register()

    --数据
    ssrDataPlayer = SL:Require("GUILayout/ssrgame/ui/DataPlayer",true)

    ssrObjCfg = SL:Require("GUILayout/ssrgame/cfg/ObjCfg",true)
    ssrDescCfg = SL:Require("GUILayout/ssrgame/cfg/DescCfg",true)
    ssrUIManager = SL:Require("GUILayout/ssrgame/ui/UIManager",true)

    cfg_Desc = ssrRequireCsvCfg("cfg_Desc")

    --加载功能模块
    ssrUIManager:INIT()
end

init()
-- -- --------------------------↓↓↓ 引擎事件 ↓↓↓--------------------------
--点击npc触发
local cfg_npc_open = ssrRequireCsvCfg("cfg_npc_open")
SL:RegisterLUAEvent(LUA_EVENT_TALKTONPC, "GUIUtil", function (data)
    local open_cfg = cfg_npc_open[data.index]
    if open_cfg then
        local _,objcfg = ssrUIManager:GETBYID(open_cfg.moduleid)
        if objcfg then
            ssrUIManager:OPEN(objcfg)
        end
    end
end)

--小退释放
SL:RegisterLUAEvent(LUA_EVENT_LEAVE_WORLD, "GUIUtil", function ()
    SL:Print("-小退释放缓存-")
    for k,_ in pairs(package.loaded) do
        if string.find(k,"GUILayout") then
            package.loaded[k] = nil
            _G[k] = nil
        end
    end
end)

--快捷键重载
GUI:addKeyboardEvent({"KEY_CTRL","KEY_TAB"}, function()
    SL:Print("-GUIUtil重载-")
    ssrMessage:sendmsg(ssrNetMsgCfg.sync)
    GUI:Win_CloseAll()
    for k,_ in pairs(package.loaded) do
        if string.find(k, "^ssr/ssrgame/") or string.find(k, "GUILayout") then
            package.loaded[k] = nil
            _G[k] = nil
        end
    end
    --重新启动
    SL:Require("GUILayout/GUIUtil",true)
end)