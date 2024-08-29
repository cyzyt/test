-- require("Envir/QuestDiary/util/util")
-- UIncludes()

function beforedawn()
    --LOGPrint("1213321132")
    local t = getplayerlst()
    for _,actor in ipairs(t) do
        local beforedawndatas = {}
        GameEvent.push(EventCfg.goBeforedawn, actor, beforedawndatas)
        Message.sendmsg(actor, ssrNetMsgCfg.sync, nil, nil, nil, beforedawndatas)
    end
    local openday = grobalinfo(ConstCfg.global.openday)
    GameEvent.push(EventCfg.roBeforedawn, openday)
end

local first_day = 3  --开服第几天开始第一次攻城
local week_day = "6"   --平时周几开始攻城

local function _checkOpenDay(activityid)
    if activityid == 10 then
        local day = grobalinfo(1)
        if day == first_day then  --当天符合第一次攻城条件
            return true
        else
            if day > first_day then  --第一次攻城后时间执行
                local week = os.date("%w")
                if week == week_day then
                    return true
                else
                    return false
                end
            else
                return false
            end
        end   
    end
end



--沙城争霸
function check_today_shabak()
    if _checkOpenDay(10) then 
        addattacksabakall()
        return
    end
end

--开启异域大战
function open_yydz()
    LOGWrite("进入测试1")
    Playyydz.open()
end

--开启大乱斗
function open_dld()
    LOGWrite("进入测试2")
    Playdld.open()
end