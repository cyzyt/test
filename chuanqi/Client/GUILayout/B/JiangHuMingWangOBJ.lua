JiangHuMingWangOBJ = {}

JiangHuMingWangOBJ.__cname = "JiangHuMingWangOBJ"
JiangHuMingWangOBJ.cfg_goals = ssrRequireCsvCfg("cfg_goals")
JiangHuMingWangOBJ.cfg_xiuxian = ssrRequireCsvCfg("cfg_xiuxian")

JiangHuMingWangOBJ.cfg_Desc = cfg_Desc

JiangHuMingWangOBJ.cfg = {}
local handle
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function JiangHuMingWangOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, objcfg.UI_PATH, function ()
        self._parent = parent
        self.ui = GUI:ui_delegate(parent)
    
        --关闭按钮
        GUI:addOnClickEvent(self.ui.btn_close, function()
            GUI:Win_Close(self._parent)
        end)
    
        --关闭界面
        GUI:addOnClickEvent(self.ui.bg_close, function()
            GUI:Win_Close(self._parent)
        end)
    
        --激活
        GUI:addOnClickEvent(self.ui.btn_go, function()
            self:RequestUpgrade()
        end)

        self:updateUI()

        --初始化背景
        self:updateBgSize()
    end)
end

--更新背景
function JiangHuMingWangOBJ:updateBgSize()
    local width,heihjt = SL:GetMetaValue("SCREEN_WIDTH"),SL:GetMetaValue("SCREEN_HEIGHT")
    GUI:setContentSize(self.ui.bg_close, width,heihjt)
end

SL:RegisterLUAEvent(LUA_EVENT_WINDOW_CHANGE, "JiangHuMingWangOBJ", function ()
    if not GUI:GetWindow(nil,JiangHuMingWangOBJ.__cname) then return end
    JiangHuMingWangOBJ:updateBgSize()
end)

function JiangHuMingWangOBJ:searchesNum()
    for i,cfg in ipairs(self.cfg_xiuxian) do
        local ui_item = GUI:getChildByName(self.ui.superVip_list, "active_"..i)
        local itemUI = GUI:ui_delegate(ui_item)
        local img_url = "2"
        GUI:setVisible(itemUI.ListView_1,not (self.superVipLevel > i))
        GUI:setVisible(itemUI.ListView_3,self.superVipLevel > i)
        GUI:setVisible(itemUI.get_gift_btn,self.superVipLevel > i)
        GUI:setVisible(itemUI.pet_is_buy,self.superVipLevel > i)
        GUI:setVisible(itemUI.gifts_is_get,self._gifts_var[i] == 1)
        GUI:Text_setString(itemUI.infoTxt, [[名望任务]])
        if self.superVipLevel  < i then
            img_url = "3"
        elseif self.superVipLevel > i then
            img_url = "9"
            GUI:Text_setString(itemUI.infoTxt, [[特惠购买]])
        end
        local img_icon = ssrSeekWidgetByName(ui_item, "img_icon")
        img_url = string.format("res/custom/superVIP/bg_chjhy_0%s.png", img_url)
        GUI:Image_loadTexture(img_icon, img_url)

        for j,var in ipairs(cfg.goal[1]) do
            local ui_list =  GUI:ui_delegate(ssrSeekWidgetByName(ui_item, "list_"..j))
            if i == self.superVipLevel then
                GUI:setPosition(ui_list.info_txt,-5,7)
                GUI:setPosition(ui_list.info_bg,110,16)
                GUI:setVisible(ui_list.Gobtn,self.cfg_info[j] ~= 1)
                GUI:setVisible(ui_list.wancheng,self.cfg_info[j] == 1)
            else
                GUI:setPosition(ui_list.info_txt,29,7)
                GUI:setPosition(ui_list.info_bg,130,16)
                GUI:setVisible(ui_list.Gobtn,false)
                GUI:setVisible(ui_list.wancheng,false)
            end
        end
    end
end

function JiangHuMingWangOBJ:createGiftsItem(parent,gifts)
    GUI:removeAllChildren(parent)
    GUI:ListView_setItemsMargin(parent,5)
    for i,itemData in ipairs(gifts) do
        local idx = itemData[ssrConstCfg.box_idx]
        local count = itemData[ssrConstCfg.box_num]
        local _itemData = {index = idx, count = count, look = true ,bgVisible = true}
        GUI:ItemShow_Create(parent, "item"..i, 0 , 0, _itemData)
    end
end

function JiangHuMingWangOBJ:updateUI()
    if not self.ui then return end

    GUI:setVisible(self.ui.tempitem,false)
    GUI:setVisible(self.ui.template,false)

    -- local i = 0
    -- local createItem = function ()
    --     i = i + 1
    --     local cfg = self.cfg_xiuxian[i]
    --     if not cfg then return GUI:unSchedule(self.ui.superVip_list) end

    --     local ui_item = GUI:Clone(self.ui.template)
    --     GUI:addChild(self.ui.superVip_list, ui_item)
    --     GUI:setName(ui_item,"active_"..i)
    --     GUI:setVisible(ui_item,true)
    --     ssrLabelString(ui_item, "tx_title", cfg.Name)

    --     GUI:addOnClickEvent(ui_item, function()
    --         self.select_index = i
    --     end)

    --     if i < #self.cfg_xiuxian then
    --         local jiantou = GUI:Image_Create(ui_item,"jiantou"..i, 370 + 22, 180 + 60, "res/custom/superVIP/btn_szjm_01_1.png")
    --         GUI:setRotation(jiantou, 180)
    --     end

    --     local img_title = ssrSeekWidgetByName(ui_item, "img_title")
    --     local img_url = string.format("res/custom/superVIP/title/title_%s.png", i)
    --     GUI:Image_loadTexture(img_title, img_url)

    --     local itemUI = GUI:ui_delegate(ui_item)

    --     img_url = "2"
    --     GUI:setVisible(itemUI.ListView_1,not (self.superVipLevel > i))
    --     GUI:setVisible(itemUI.ListView_3,self.superVipLevel > i)
    --     GUI:setVisible(itemUI.get_gift_btn,self.superVipLevel > i)
    --     GUI:setVisible(itemUI.pet_is_buy,self.superVipLevel > i)
    --     GUI:setVisible(itemUI.gifts_is_get,self._gifts_var[i] == 1)
    --     GUI:Text_setString(itemUI.infoTxt, [[名望任务]])
    --     if self.superVipLevel  < i then
    --         img_url = "3"
    --     elseif self.superVipLevel > i then
    --         img_url = "9"
    --         GUI:Text_setString(itemUI.infoTxt, [[特惠购买]])
    --     end

    --     GUI:addOnClickEvent(itemUI.get_gift_btn, function()
    --         local page = i
    --         self:RequestBuyGifts(page)
    --     end)

    --     local img_icon = ssrSeekWidgetByName(ui_item, "img_icon")
    --     img_url = string.format("res/custom/superVIP/bg_chjhy_0%s.png", img_url)
    --     GUI:Image_loadTexture(img_icon, img_url)


    --     img_url = "1"
    --     if i  <= 3 then
    --         img_url = "1"
    --     elseif i > 3 and i <= 6 then
    --         img_url = "2"
    --     elseif i > 6 and i <= 9 then
    --         img_url = "3"
    --     elseif i > 9 and i <= 12 then
    --         img_url = "4"
    --     elseif i > 12 and i <= 15 then
    --         img_url = "5"
    --     elseif i > 15 and i <= 17 then
    --         img_url = "6"
    --     elseif i > 17 then
    --         img_url = "7"
    --     end

    --     img_url = string.format("res/custom/superVIP/bg_huiyd_0%s.png", img_url)
    --     GUI:Image_loadTexture(itemUI.img_liang, "res/custom/superVIP/bg_huiyd_0%s.png")

    --     self:createGiftsItem(itemUI.ListView_2, cfg.prefix)

    --     self:createGiftsItem(itemUI.ListView_3, cfg.pet)

    --     GUI:setLocalZOrder(itemUI.pet_is_buy,999)
    --     GUI:setLocalZOrder(itemUI.gifts_is_get,999)

    --     GUI:Text_setString(itemUI.get_gift_txt,cfg.jiage..[[灵符购买]])

    --     --属性tips
    --     GUI:addOnClickEvent(itemUI.show_attr_btn, function()
    --         local posM = GUI:getWorldPosition(itemUI.show_attr_btn)
    --         local data = {width = 1136, str = self.cfg_Desc[cfg.tips].desc, worldPos = {x = posM.x, y = posM.y}, anchorPoint = {x = 0, y = 1},formatWay = 1}
    --         SL:OpenCommonDescTipsPop(data)
    --     end)

    --     for j,var in ipairs(cfg.goal[1]) do
    --         local ui_list = GUI:Clone(self.ui.tempitem)
    --         GUI:setVisible(ui_list,true)
    --         GUI:addChild(itemUI.ListView_1,ui_list)
    --         GUI:setName(ui_list,"list_"..j)
    --         local info_txt = GUI:GetWindow(ui_list, "info_txt")
    --         GUI:removeAllChildren(info_txt)
    --         local size = GUI:getContentSize(info_txt)
    --         handle = GUI:RichText_Create(info_txt, "txt",size.width/2, size.height/2, "<font size='15'>"..self.cfg_goals[var].goInfo.."</font>", ssrConstCfg.width)
    --         GUI:setAnchorPoint(handle, 0.5, 0.5)
    --         local info_bg = GUI:GetWindow(ui_list, "info_bg")
    --         info_txt = GUI:GetWindow(ui_list, "info_txt")

    --         --前往
    --         local goto_handle = GUI:getChildByName(ui_list, "Gobtn")
    --         local wanc_handle = GUI:getChildByName(ui_list, "wancheng")
    --         GUI:addOnClickEvent(goto_handle, function(sender)
    --             local page = GUI:Win_GetParam(sender)
    --             self:RequestFindNpc(page)
    --         end)
    --         GUI:Win_SetParam(goto_handle, j)

    --         if i == self.superVipLevel then
    --             GUI:setPosition(info_txt,-5,7)
    --             GUI:setPosition(info_bg,110,16)
    --             GUI:setVisible(goto_handle,self.cfg_info[j] ~= 1)
    --             GUI:setVisible(wanc_handle,self.cfg_info[j] == 1)
    --         else
    --             GUI:setPosition(info_txt,29,7)
    --             GUI:setPosition(info_bg,130,16)
    --             handle = goto_handle
    --             GUI:setVisible(handle,false)
    --             handle = wanc_handle
    --             GUI:setVisible(handle,false)
    --         end
    --     end
    --     if i == #self.cfg_xiuxian then
    --         SL:scheduleOnce(self.ui.superVip_list, function ()
    --             local itemNum = self.superVipLevel - 1 > 0 and self.superVipLevel - 1 or 0
    --             if itemNum > 17 then
    --                 itemNum = 17
    --             end
    --             GUI:ListView_jumpToItem(self.ui.superVip_list, itemNum)
    --         end, 0.01)
    --     end
    -- end
    -- GUI:schedule(self.ui.superVip_list, createItem, 1/60)

    ssrPrint("#self.cfg_xiuxian",#self.cfg_xiuxian)
    local tableView = GUI:TableView_Create(self.ui.nd_content, "TABLEVIEW", 70, 40, 730, 435, 2, 410.00, 385.00, #self.cfg_xiuxian)
    -- GUI:TableView_setBackGroundColor(tableView, "#FFFFFF")
    -- GUI:TableView_setDirection(tableView, 2)
    -- 设置cell创建方法
    GUI:TableView_setCellCreateEvent(tableView, function(parent, i, ID)
        if ID == "TABLEVIEW" then
            local cfg = self.cfg_xiuxian[i]
            ssrPrint("i",i)

            local panel = GUI:Layout_Create(parent, string.format("layout_%s", i), 0, 0, 600, 40)
            local text = GUI:Text_Create(panel, "TEXT", 0, 20, 18, "#00FF00", "IDX----------------"..i)
            GUI:setAnchorPoint(text, 0, 0.5)

            local ui_item = GUI:Clone(self.ui.template)
            SL:Print("ui_item",ui_item)
            GUI:addChild(panel, ui_item)
            GUI:setName(ui_item,"active_"..i)
            GUI:setVisible(ui_item,true)
            -- ssrLabelString(ui_item, "tx_title", cfg.Name)
        end
    end)

    local function touchCellFunc(tv, cell)
        local idx = GUI:TableViewCell_getIdx(cell)
        -- local panel = GUI:getChildByID(cell, string.format("layout_%s", idx))
        -- GUI:Layout_setBackGroundColorType(panel, 1)
        -- GUI:Layout_setBackGroundColor(panel, "#00EEAA")
        -- if idx == 15 then
        --     GUI:TableView_scrollToCell(tv, 18)
        -- end
    end
    -- 添加cell点击事件
    GUI:TableView_addOnTouchedCellEvent( tableView, touchCellFunc )
    SL:ScheduleOnce(function ()
        GUI:TableView_scrollToCell(tableView, 6)
    end, 1/60)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步数据
function JiangHuMingWangOBJ:SyncResponse(arge1,arge2,arge3,data)
    self.superVipLevel = arge1 + 1
    self.cfg_info = data[1]
    self._gifts_var = data[2]
    if not arge1 then return end
    self:updateUI()
end

function JiangHuMingWangOBJ:updateJHMWInfo(arge1,arge2,arge3,data)
    self.superVipLevel = arge1 + 1
    self.cfg_info = data[1]
    self._gifts_var = data[2]
    if not GUI:GetWindow(nil,self.__cname) then return end
    self:searchesNum()
end

--请求进阶
function JiangHuMingWangOBJ:RequestUpgrade()
    ssrMessage:sendmsg(ssrNetMsgCfg.JiangHuMingWang_RequestUpgrade)
end
--响应进阶
function JiangHuMingWangOBJ:UpgradeResponse(arge1,arge2,arge3,data)
    self.superVipLevel = arge1 + 1
    self.cfg_info = data[1]
    self._gifts_var = data[2]
    if not GUI:GetWindow(nil,self.__cname) then return end
    self:searchesNum()
end

--请求购买礼包
function JiangHuMingWangOBJ:RequestBuyGifts(page)
    ssrMessage:sendmsg(ssrNetMsgCfg.JiangHuMingWang_RequestBuyGifts,page)
    -- ssrUIManager:CLOSE(ssrObjCfg.JiangHuMingWang)
    -- ssrUIManager:OPEN(ssrObjCfg.JHMWGuideWnd,self.superVipLevel)
end

--响应进阶
function JiangHuMingWangOBJ:BuyGiftsResponse(arge1,arge2,arge3,data)
    self._gifts_var[arge1] = arge2
    if not GUI:GetWindow(nil,self.__cname) then return end
    self:searchesNum()
end

function JiangHuMingWangOBJ:RequestFindNpc(page)
    ssrMessage:sendmsg(ssrNetMsgCfg.JiangHuMingWang_RequestFindNpc,page)
end

function JiangHuMingWangOBJ:OpenGuideWnd(level)
    ssrUIManager:OPEN(ssrObjCfg.JHMWGuideWnd,level)
end
-------------------------------↓↓↓ 引擎事件 ↓↓↓--------------------------------
function JiangHuMingWangOBJ:addGameEvent()

end

return JiangHuMingWangOBJ
