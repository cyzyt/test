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

local first_day = 3  --�����ڼ��쿪ʼ��һ�ι���
local week_day = "6"   --ƽʱ�ܼ���ʼ����

local function _checkOpenDay(activityid)
    if activityid == 10 then
        local day = grobalinfo(1)
        if day == first_day then  --������ϵ�һ�ι�������
            return true
        else
            if day > first_day then  --��һ�ι��Ǻ�ʱ��ִ��
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



--ɳ������
function check_today_shabak()
    if _checkOpenDay(10) then 
        addattacksabakall()
        return
    end
end

--���������ս
function open_yydz()
    LOGWrite("�������1")
    Playyydz.open()
end

--�������Ҷ�
function open_dld()
    LOGWrite("�������2")
    Playdld.open()
end