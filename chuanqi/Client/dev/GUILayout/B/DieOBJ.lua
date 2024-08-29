DieObj = {}

DieObj.__cname = "DieObj"


DieObj.cfg = ssrRequireCsvCfg("cfg_Fuhuo")

DieObj.REVIVE_TYPE = {
    FREE = 0,               --免费复活
    PAY  = 1,                --收费复活
}
--类型 -- 0：常规  1：大乱斗 2:异域大战
DieObj.revive_type = {
    routine = 0,
    dld     = 1,
    yiyu    = 2,
}

function DieObj:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, objcfg.UI_PATH ,function ()
        self.ui = GUI:ui_delegate(parent)

        GUI:Text_setTextColor(self.ui.tx_auto_revive, "#7CFC00")
        GUI:Text_setTextColor(self.ui.tx_pay_revive, "#7CFC00")
        GUI:Text_setTextColor(self.ui.tx_free, "#7CFC00")
        GUI:Text_setTextColor(self.ui.tx_can_revive_count, "#7CFC00")
    
        --隐藏付费复活倒计时
        GUI:setVisible(self.ui.nd_revive,false)
    
        --击杀者
        local killer_name = self.data[1]
        local map_id = self.data[3]
        self.isOnlyBack = false
        for i, v in ipairs(self.cfg[1].onlyBack) do
            if v == map_id then
                self.isOnlyBack =  true
                break
            end
        end
    
        local rich = GUI:RichText_Create(self.ui.nd_ricktext_pos, "txt", 0,0, string.format(self.cfg[1].Text , killer_name), ssrConstCfg.width)
        GUI:setAnchorPoint(rich, 0.50, 0.50)

        --xx秒数后自动回城复活
        local sec = self.cfg[1].Time
        SL:schedule(parent, function ()
            sec = sec - 1
            self.ui.tx_auto_revive:setString("自动复活："..sec)
            if sec <= 0 then
                GUI:stopAllActions(parent)
                self:RequestRevive(self.arg1,self.REVIVE_TYPE.FREE)
            end
        end, 1)
        self.ui.tx_auto_revive:setString("自动复活："..sec)
    
        --消耗货币
        local idx, num = self.cfg[1].Pay[1][1], self.cfg[1].Pay[1][2]
        local iteminfo = SL:GetMetaValue("ITEM_DATA", idx)
        local name = iteminfo.Name
        GUI:Text_setString(self.ui.tx_pay_revive, "消耗"..num..name)
    
    
        --可复活次数
        if self.revive_type.routine == self.arg1 then
            local count = self.data[2]
            self.ui.tx_can_revive_count:setString("可复活次数："..count)
            self.ui.tx_back_revive:setString("回城复活")
        elseif self.revive_type.dld == self.arg1 then   --大乱斗
            self.ui.tx_back_revive:setString("随机复活")
        elseif self.revive_type.yiyu == self.arg1 then  --异域大战
            self.ui.tx_back_revive:setString("随机复活")
        end

        --回城复活
        GUI:addOnClickEvent(self.ui.btn_back_revive, function()
            self:RequestRevive(self.arg1,self.REVIVE_TYPE.FREE)
        end)
    
        --原地复活
        GUI:addOnClickEvent(self.ui.btn_situ_revive, function()
            self:RequestRevive(self.arg1,self.REVIVE_TYPE.PAY)
        end)
    
        local x,y = 102,14
        if self.isOnlyBack then x = x + 62 end
        
        GUI:setVisible(self.ui.btn_situ_revive,not self.isOnlyBack)
        GUI:setVisible(self.ui.tx_pay_revive,not self.isOnlyBack)
    
        GUI:setPosition(self.ui.tx_free,x, y)
        GUI:setPosition(self.ui.btn_back_revive,x - 1, y + 26)
    end)
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--死亡打开UI
function DieObj:OpenUI(arg1,arg2,arg3,data)
    self.arg1 = arg1
    self.data = data
    ssrUIManager:CLOSE(ssrObjCfg.Die)
    ssrUIManager:OPEN(ssrObjCfg.Die)
end

--复活
function DieObj:RequestRevive(revive_type,_type)
    ssrMessage:sendmsg(ssrNetMsgCfg.Die_RequestRevive, revive_type,_type,0, {})
end

function DieObj:ReviveResponse(data)
end

SL:RegisterLUAEvent(LUA_EVENT_MAIN_PLAYER_REVIVE, "DieObj", function ()
    ssrUIManager:CLOSE(ssrObjCfg.Die)
end)

return DieObj