ActivitySystemOBJ = {}

ActivitySystemOBJ.__cname = "ActivitySystemOBJ"


ActivitySystemOBJ.cfg = ssrRequireCsvCfg("cfg_gameactive")
ActivitySystemOBJ.activity_states = {}
ActivitySystemOBJ.red_point = {}
ActivitySystemOBJ.ui = nil
ActivitySystemOBJ.goActivityAnim = nil

ActivitySystemOBJ.select_index = 1


-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ActivitySystemOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, objcfg.UI_PATH)

    self._parent = parent
    self.ui = GUI:ui_delegate(parent)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.btn_close, function()
        GUI:Win_Close(self._parent)
    end)

    --关闭界面
    GUI:addOnClickEvent(self.ui.la_bg, function()
        GUI:Win_Close(self._parent)
    end)

    --大乱斗积分奖励
    GUI:addOnClickEvent(self.ui.jifen_btn, function()
        self:opendldwnd(1)
    end)

    --大乱斗排行奖励
    GUI:addOnClickEvent(self.ui.paihang_btn, function()
        self:opendldwnd(2)
    end)

    --沙城争霸奖励
    GUI:addOnClickEvent(self.ui.jifen_btn_2, function()
        self:opendldwnd(100)
    end)


    for i, v in ipairs(self.cfg) do
        self.red_point[i] = 0
    end


    local details_title = "<font colorStyleID='1038'>活动说明</font>"
    GUI:RichText_Create(self.ui.tx_details_title, "txt", -33 , -5, details_title,80)

    self:addAnim()

    for i,cfg in ipairs(self.cfg) do
        local item = GUI:Clone(self.ui.template)
        GUI:ListView_pushBackCustomItem(self.ui.active_list, item)
        local ui_item = GUI:ListView_getItemByIndex(self.ui.active_list, i-1)
        GUI:setName(ui_item, "active_"..i)
        
        ssrLabelString(ui_item, "tx_title", cfg.Name)

        --关闭界面
        GUI:addOnClickEvent(ui_item, function(sender)
            self.select_index = GUI:Win_GetParam(sender)
            self:updateDetailsUI()
            self:updateRPshow(self.select_index)
        end)
        GUI:Win_SetParam(ui_item, i)


        local img_liang = ssrSeekWidgetByName(ui_item, "img_icon")
        local _icon = i
        if cfg.iconid then
            _icon = cfg.iconid
        end
        local img_url = string.format("res/custom/activitySystem/img_%s.png", _icon)
        GUI:Image_loadTexture(img_liang, img_url)

        local timeStr = string.gsub(cfg.BTime, "%$", ":") .. "-" .. string.gsub(cfg.OTime, "%$", ":")
        ssrLabelString(ui_item, "tx_time", "开启时间："..timeStr)

        local startTxt = self:getActivityIsOpen(i)

        local effect = ssrSeekWidgetByName(ui_item, "effect")

        local handle = GUI:Effect_Create(img_liang, "jinengshu", -11, 74, 0, 3022, 0, 0, 0, 1):hide()
        GUI:setScale(handle,1.1)

        --奖励预览
        local Diaoluo = cfg.Gift
        if Diaoluo then
            local x,y = 300 + 12,70
            for _,vause in ipairs(Diaoluo) do
                GUI:ItemShow_Create(ui_item, "itemshow", x, y, {index=vause[1], count = vause[2], look=true})
                x = x + 40
            end
        else
            local txt = ssrSeekWidgetByName(ui_item, "tx_Gift_title")
            GUI:setVisible(txt, false)
        end
    end

    --前往活动
    GUI:addOnClickEvent(self.ui.btn_go_activity, function()
        self:RequestGoto(self.select_index)
        GUI:Win_Close(self._parent)
    end)

    self:updateRPshow(self.select_index)
    self:updateDetailsUI()
end

function ActivitySystemOBJ:getActivityIsOpen(idx)
    local cfg = self.cfg[idx]
    local weekTime = tonumber(os.date("%w", os.time()))
    if weekTime == 0 then
        weekTime = 7
    end
    local todaynum = {
        "一", "二", "三", "四", "五", "六", "日", 
    }
    local ui_item = ssrSeekWidgetByName(self.ui.active_list, "active_"..idx)

    local istoday = true
    if cfg.Time1 then
        if type(cfg.Time1) == "number" and todaynum[cfg.Time1] then
            istoday = cfg.Time1 == weekTime
            ssrLabelString(ui_item, "tx_time_2", "每周星期"..todaynum[cfg.Time1].."开启!")
        end
        if type(cfg.Time1) == "table" then
            local isall = #cfg.Time1 == 7 and true or false
            if isall then
                istoday = true
                ssrLabelString(ui_item, "tx_time_2", "每日开启!")
            else
                timeStr = "每周"
                for j,day in ipairs(cfg.Time1) do
                    timeStr = timeStr .."星期"..todaynum[day]
                    if day == weekTime then
                        istoday = true
                    end
                    if j ~= #cfg.Time1 then
                        timeStr = timeStr .."、"
                    end
                end
                timeStr = timeStr .."开启!"
                ssrLabelString(ui_item, "tx_time_2",timeStr)
            end
        end
    end

    local function getTodayTimeStamp(hour,min,sec)
        local cDateCurrectTime = os.date("*t")
        local cDateTodayTime = os.time({year=cDateCurrectTime.year, month=cDateCurrectTime.month, day=cDateCurrectTime.day, hour=hour,min=min,sec=sec})
        return cDateTodayTime
    end
    
    local state_str = cfg.Activitystart
    local state = "res/custom/huodong/bg_riczy_00.png"
    local state_x ,state_y = 390,20
    if istoday then
        local now = os.time()
        local BTime = SL:Split(cfg.BTime,"$")
        local OTime = SL:Split(cfg.OTime,"$")
        if now >= getTodayTimeStamp(BTime[1],BTime[2],0) and now < getTodayTimeStamp(OTime[1],OTime[2],0) then
            state_str = cfg.Activityinprogress
            state = nil
        elseif now >= getTodayTimeStamp(OTime[1],OTime[2],0) then
            state_str = cfg.Endofactivity
            state_x ,state_y = 137 + 62,73
            state = "res/custom/huodong/bg_riczy_02.png"
        end
    end

    local parent = GUI:getChildByName(ui_item, "img_liang")
    GUI:removeAllChildren(parent)

    if state then
        local progressBG = GUI:Image_Create(parent, "img", state_x ,state_y, state)
        GUI:setName(progressBG,"icon")
        GUI:setAnchorPoint(progressBG,0.5, 0.5)
    end
end

function ActivitySystemOBJ:opendldwnd(tag)
    local page = tag
    self:RequestOpenDldWnd(page)
end

function ActivitySystemOBJ:addAnim()
    local sfx = GUI:Effect_Create(self.ui.btn_go_activity,"effect", 35, 33, 0, 22029)
    GUI:setName(sfx, "clickAnim")
    GUI:setPosition(sfx,35,33)
    self.goActivityAnim = sfx
    sfx:Play(0, 0, true)
end

--奖励预览
function ActivitySystemOBJ:updateDetailsUI()
    local cfg = self.cfg[self.select_index]
    if not cfg then return end
    local lv = cfg.Text
    local richtext_lv = GUI:RichText_Create(self.ui.tx_info, "text", 0, -240, lv, 210)

    GUI:setVisible(self.ui.jifen_btn, cfg.Name == "大乱斗")
    GUI:setVisible(self.ui.paihang_btn, cfg.Name == "大乱斗")
    GUI:setVisible(self.ui.jifen_btn_2, cfg.Name == "沙城争霸")

    for i,cfg in ipairs(self.cfg) do
        local ui_item = ssrSeekWidgetByName(self.ui.active_list, "active_"..i)
        local effect = ssrSeekWidgetByName(ui_item, "jinengshu")
        GUI:setVisible(effect, i == self.select_index)
    end
end

--更新红点显示
function ActivitySystemOBJ:updateRPshow(index)
    if index then
        self.red_point[index] = 0
        local btn = GUI:getChildByTag(self.ui.active_list, index)
        if btn then
            local target = GUI:getChildByName(target, "img_red_point")
            GUI:setVisible(target, self.red_point[index] == 1)
        end
        local bool = false
        for i, v in ipairs(self.red_point) do
            if v == 1 then
                bool = true
                break
            end
        end
        if not bool then
            ssrGameEvent:push(ssrEventCfg.RpActivity,bool)
        end
    else
        for idx,showstate in ipairs(self.red_point) do
            local btn = self.ui.active_list:getChildByTag(idx)
            if btn then
                local target = GUI:getChildByName(btn, "img_red_point")
                GUI:setVisible(target, showstate == 1)
            end
        end
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步数据
function ActivitySystemOBJ:SyncResponse(data)
    self.activity_states = data
end

--同步活动状态
function ActivitySystemOBJ:SyncActivityState(data)
    for index,vause in ipairs(self.activity_states) do
        if vause[1] == data.arg1 then
            self.activity_states[index][1] = data.arg1
            self.activity_states[index][2] = data.arg2
            if not data then return end
            self:pushActiveState()
        end
    end
end

-- --同步红点
-- function ActivitySystemOBJ:SyncActivityState(idx,isopening)
--     if self.red_point[idx] then
--         self.red_point[idx] = isopening
--     end
--     ssrGameEvent:push(ssrEventCfg.RpActivity,true)
--     if not self._layer then return end
--     self._layer:updateRPshow()
-- end

--请求前往活动
function ActivitySystemOBJ:RequestGoto(idx)
    ssrMessage:sendmsg(ssrNetMsgCfg.ActivitySystem_RequestGoto,idx)
end

--大乱斗信息面板
function ActivitySystemOBJ:RequestOpenDldWnd(idx)
    ssrMessage:sendmsg(ssrNetMsgCfg.Playdld_RequestOpenRankWnd,idx)
end

--创建按钮
function ActivitySystemOBJ:CreatRankBtn()
    local btn_exit = GUI:Button_Create()
    GUI:Button_loadTextureNormal(btn_exit, "res/custom/Main/1900013018.png")
    GUI:Button_loadTextureNormal(btn_exit, "res/custom/Main/1900013018.png")
    GUI:setAnchorPoint(btn_exit,0, 0)
    GUI:setPosition(btn_exit,235, 130)
    btn_exit:setScale9Enabled(true)
    GUI:setScaleX(btn_exit,0.9000)
    GUI:setScaleY(btn_exit,0.9000)
    GUI:Win_FindParent({index = 110, subid = 20110, content = btn_exit})
    --@退出按钮
    GUI:addOnClickEvent(self.ui.btn_exit, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.Playyydz_RequestBack)
    end)
end
--移除按钮
function ActivitySystemOBJ:DeletRankBtn()
    GUI:Win_FindParent({index = 110, subid = 20110, type = 1})
end



-------------------------------↓↓↓ 引擎事件 ↓↓↓--------------------------------
function ActivitySystemOBJ:addGameEvent()

end

return ActivitySystemOBJ