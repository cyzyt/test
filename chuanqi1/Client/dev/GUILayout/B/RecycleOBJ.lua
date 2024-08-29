RecycleOBJ={}

RecycleOBJ.__cname="RecycleOBJ"
    RecycleOBJ.page = 1
    RecycleOBJ.datakey = "Recycle_"

function RecycleOBJ:main(objcfg)
    self.cfg={}
    self.ItemIdxData = self.ItemIdxData
    self.checkItems = {}    --回收选择框
    self.bagRecycleData = {} --背包中能回收的装备
    self.recycleAllIdx = {} --背包中所有能回收的idx
    self.recycleNum = 1
    self.select_list = {}
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    self.page = 1
    
    ssrListViewTemplate(self.ui.ListView_1,"template")
    ssrListViewTemplate(self.ui.ListView_2,"template")
    ssrListViewTemplate(self.ui.ListView_3,"template")
    GUI:setVisible(self.ui.Hidewnd, false)
   -- 关闭主界面
    GUI:addOnClickEvent(self.ui.btn_close, function ()
        GUI:Win_Close(parent)
    end)
    --关闭主界面
    GUI:addOnClickEvent(self.ui.btn_close, function ()
        GUI:Win_Close(parent)
    end)

    --隐藏/限时副界面
    GUI:addOnClickEvent(self.ui.Hidewnd_closeBtn, function ()
        GUI:setVisible(self.ui.Hidewnd, false)
    end)

    --回收按钮
    GUI:addOnClickEvent(self.ui.btn_auto_recycle, function ()
        self:RequestEquip()
    end)

    --全选
    GUI:addOnClickEvent(self.ui.Hidewnd_allon, function (sender)
        self:SelectAllChoice(sender)
    end)
    GUI:setTag(self.ui.Hidewnd_allon, 1)

    --全不选
    GUI:addOnClickEvent(self.ui.Hidewnd_alloff,function (sender)
        self:SelectAllChoice(sender)
    end)
    GUI:setTag(self.ui.Hidewnd_alloff, 0)

    --自动回收checkbox
    GUI:addOnClickEvent(self.ui.btn_auto_recycle, function ()
        RecycleOBJ:RequestAutoEquip(self.isAuto ~= 1 and 1 or 0)
    end)


    local cfg_huishou_zhuangbei = ssrRequireCsvCfg("cfg_huishou_zhuangbei")
    for i,v in ipairs(cfg_huishou_zhuangbei) do
        self.cfg[v.type] = self.cfg[v.type] or {yeqian = v.yeqian}
        self.cfg[v.type][v.type2] = self.cfg[v.type][v.type2] or {typename = v.typename}
        self.cfg[v.type][v.type2][v.type3] = {
            idx = i,itemId = v.itemId,price = v.price,txt = v.txt,
            itemid = v.itemid,gouxuan = v.gouxuan,price1 = v.price1
        }
    end
    self:getUserData()    --道具勾选缓存


    for i,cfg in ipairs(self.cfg) do
        local item = GUI:Clone(self.ui.template_1)
        GUI:ListView_pushBackCustomItem(self.ui.ListView_1, item)
        local ui_item = GUI:ListView_getItemByIndex(self.ui.ListView_1, i-1)
        GUI:setName(ui_item, "btn1_switch_"..i)

        
        ssrLabelString(ui_item, "tx_switch", SL:ChineseToVertical(cfg.yeqian))

        local btn_switch = ssrSeekWidgetByName(ui_item, "btn_switch")
        
        ssrAddTouchEventListener({
            widget = btn_switch,
            callback = handler(self, self.updatePageBtn1),
            scale = 1,
            tag = i,
        })
        --默认选择
        if i == 1 then
            self:updatePageBtn1(btn_switch)
        end
    end

    self:updateAutoCheckBox()

    


    self.isAuto = nil

    self.isVIP = 0


    self:createcustombtn()

end

--更新页签1
function RecycleOBJ:updatePageBtn1(sender)
    --上一次选择按钮
    if self.page1 then
        local ui_item = self.ui["btn1_switch_"..self.page1]
        local btn_switch = ssrSeekWidgetByName(ui_item, "btn_switch")
        GUI:setEnabled(btn_switch, true)
        local tx_switch = ssrSeekWidgetByName(btn_switch, "tx_switch")
        GUI:setTextColor(tx_switch, ssrConstCfg.C3B_GRAY1)
    end


    --这一次选择按钮
    local page1 = GUI:getTag(sender)

    if page1 == self.page1 then return end

    local ui_item = self.ui["btn1_switch_"..page1]
    local btn_switch = ssrSeekWidgetByName(ui_item, "btn_switch")
    GUI:setEnabled(btn_switch, false)
    local tx_switch = ssrSeekWidgetByName(btn_switch, "tx_switch")
    GUI:setTextColor(tx_switch, ssrConstCfg.C3B_YELLOW1)

    self.page1 = page1

    self:updateMainUI()
end

--更新主面板
function RecycleOBJ:updateMainUI()

    GUI:removeAllChildren(self.ui.ListView_2)

    local cfg = self.cfg[self.page1]
    if not cfg then return end

    local max = #cfg
    local limit = 2
    local num = math.ceil(max/limit)

    for i = 1,num do
        local item = GUI:Clone(self.ui.template_2)
        GUI:ListView_pushBackCustomItem(self.ui.ListView_2, item)
        local ui_item = GUI:ListView_getItemByIndex(self.ui.ListView_2, i-1)

        --最后一个item 隐藏不需要的按钮
        if i==num then
            local manynum = max%limit
            if manynum > 0 then
                manynum = manynum + 1
                for begin=manynum, limit do
                    GUI:setVisible(ssrSeekWidgetByName(ui_item, "img_"..begin), false)
                end
            end
        end

        for j = 1,limit do
            local img = ssrSeekWidgetByName(ui_item, "img_"..j)
            local index = (i-1)*limit+j
            GUI:setName(img, "img_"..index)
        end
    end

    for i,tab in ipairs(cfg) do

        local img = ssrSeekWidgetByName(self.ui.ListView_2, "img_"..i)
        --名字
        ssrLabelString(img, "type_name", tab.typename)
        local text = ssrSeekWidgetByName(img, "type_name")
        GUI:Text_enableUnderline(text)

        ssrAddTouchEventListener({
            widget = img,
            callback = function (sender)
                self.page2 = GUI:getTag(sender)
                self:updateSecondaryUI()
            end,
            scale = 1,
            tag = i,
        })

        --选择框
        local check_box = ssrSeekWidgetByName(img, "check_recycle")
        check_box:setSelected(self.userData[self.page1][i].ischoice == 1)
        check_box:setTag(i)
        check_box:addEventListener( function(sender)
            self:setUserDataByMainUI(sender:isSelected(),check_box:getTag())
        end)

    end

end

--详情页面的选中逻辑
function RecycleOBJ:setUserDataByMainUI(selectType,idx)
    if selectType then
        --选中，idx加入缓存
        self.userData[self.page1][idx].ischoice = 1
    else
        self.userData[self.page1][idx].ischoice = 0
    end
    --写入缓存
    RecycleOBJ:setUserData(self.page1,idx)

    for i, v in ipairs(self.cfg[self.page1][idx]) do
        local bool = self.userData[self.page1][idx].ischoice ~= 0 and (self.userData[self.page1][idx][i] ~= 0 and self.userData[self.page1][idx][i] or nil ) or nil
        local itemid = self.cfg[self.page1][idx][i].itemid
        self.ItemIdxData[itemid] = bool
    end
end

--更新副面板
function RecycleOBJ:updateSecondaryUI()
    GUI:removeAllChildren(self.ui.ListView_3)

    local cfg = self.cfg[self.page1][self.page2]

    if not cfg then return end

    local max = #cfg
    local limit = 1
    local num = math.ceil(max/limit)

    for i = 1,num do
        local item = GUI:Clone(self.ui.template_3)
        GUI:ListView_pushBackCustomItem(self.ui.ListView_3, item)
        local ui_item = GUI:ListView_getItemByIndex(self.ui.ListView_3, i-1)

        for j = 1,limit do
            local img = GUI:getChildByName(ui_item, ui_item)
            local index = (i-1)*limit+j
            GUI:setName(img, "img_"..index)
        end
    end
    for i,tab in ipairs(cfg) do
        local img = ssrSeekWidgetByName(self.ui.ListView_3, "img_"..i)

        ssrLabelString(img, "item_name", SL:GetMetaValue("ITEM_NAME", tab.itemid))

        local itemshow = GUI:ItemShow_Create(img, "img_", 0, 0, {index = tab.itemid, look=true})
        GUI:setScale(itemshow, 0.75)
        GUI:setPosition(itemshow, -40, 35)

        local price = tab.price

        if self.isVIP ~= 1 then
            price = tab.price1
        end

        local priceName = SL:GetMetaValue("ITEM_NAME",price[1][1] )
        local priceNum = price[1][2]
        if (priceNum % 10000 == 0) and (priceNum / 10000 > 1) then
            priceNum = priceNum/10000 .."万"
        end
        ssrLabelString(img, "item_price", priceName .." * "..priceNum)

        ssrAddTouchEventListener({
            widget = GUI:getChildByName(img,"item_recycle"),
            callback = function (sender)
                local idx = GUI:getTag(sender)
                local bool = self.userData[self.page1][self.page2][idx] ~= 1 and 1 or 0
                self.userData[self.page1][self.page2][idx] = bool
                local check_box = GUI:getChildByName(img, "check_recycle")
                check_box:setSelected(self.userData[self.page1][self.page2][idx] == 1)

                self:setUserDataBySecondaryUI(self.userData[self.page1][self.page2][idx] == 1,idx)
            end,
            scale = 1,
            tag = i,
        })

        --选择框
        local check_box = GUI:getChildByName(img, "check_recycle")
        check_box:setSelected(self.userData[self.page1][self.page2][i] == 1)
        check_box:setTag(i)
        check_box:addEventListener( function(sender)
            self:setUserDataBySecondaryUI(sender:isSelected(),check_box:getTag())
        end)
    end

    GUI:setVisible(self.ui.Hidewnd, true)
end

--全选/全不选
function RecycleOBJ:SelectAllChoice(sender)
    if not self.page1 then return end
    if not self.page2 then return end

    local cfg = self.cfg[self.page1][self.page2]

    if not cfg then return end

    local ischoice = GUI:getTag(sender)

    for i = 1 ,#cfg do
        local CheckBox_AllCheck = function ()
            local ListViewUI = GUI:ui_delegate(self.ui.ListView_3)
            local img = ListViewUI["img_"..i]
            local imgUI = GUI:ui_delegate(img)
            if self.userData[self.page1][self.page2][i] ~= ischoice then
                self.userData[self.page1][self.page2][i] = ischoice
                check_box = imgUI["check_recycle"]
                check_box:setSelected(ischoice == 1)
                local bool = self.userData[self.page1][self.page2].ischoice ~= 0 and (self.userData[self.page1][self.page2][i] ~= 0 and self.userData[self.page1][self.page2][i] or nil ) or nil
                local itemid = self.cfg[self.page1][self.page2][i].itemid
                self.ItemIdxData[itemid] = bool
            end
        end
        local time = 0
        -- performWithDelay(self.root, function()
            CheckBox_AllCheck()
        -- end, time)
    end
    self:setUserData(self.page1,self.page2,1,#cfg)

    --self:updateEquipListView()
end

--副面版页面的选中逻辑
function RecycleOBJ:setUserDataBySecondaryUI(selectType,idx)
    local ischoice = 0
    if selectType then
        ischoice = 1    --选中，idx加入缓存
    end

    self.userData[self.page1][self.page2][idx] = ischoice

    local bool = self.userData[self.page1][self.page2].ischoice ~= 0 and (self.userData[self.page1][self.page2][idx] ~= 0 and self.userData[self.page1][self.page2][idx] or nil ) or nil
    local itemid = self.cfg[self.page1][self.page2][idx].itemid
    self.ItemIdxData[itemid] = bool

    --写入缓存
    RecycleOBJ:setUserData(self.page1,self.page2,idx)
end

function RecycleOBJ:updateAutoCheckBox()
    self.ui.check_autorecycle:setSelected(self.isAuto == 1)
end

function RecycleOBJ:createcustombtn()


    local recycleBtn = GUI:Button_Create(nil, "item", 300.0000, 50.0000, "res/custom/common/btn_3_1.png")
    GUI:loadTexturePressed(recycleBtn, "res/custom/common/btn_3_2.png")
    GUI:ignoreContentAdaptWithSize(recycleBtn, false)
    GUI:setContentSize(recycleBtn, 60.0000, 27.0000)

    
    local Text_1 = Text_Create(recycleBtn, "text", 30, 25, 16, {r = 255, g = 255, b = 0}, "回 收")
    GUI:setAnchorPoint(Text_1, 0.5, 1)
    GUI:Text_setFontName(Text_1, "fonts/font.ttf")

    GUI:Win_FindParent({index = 7, subid = 20000, type = 1})
    GUI:Win_FindParent({index = 7, subid = 20000, content = recycleBtn})  -- 添加到背包面板
    --@回收按钮
    ssrAddTouchEventListener({
        widget = recycleBtn,
        callback = function ()
            ssrUIManager:OPEN(ssrObjCfg.Recycle)
        end,
        scale = 0.9,
    })

    local zhengliBtn = GUI:Button_Create(nil, "item", 375.0000, 50.0000, "res/custom/common/btn_3_1.png")
    GUI:loadTexturePressed(zhengliBtn, "res/custom/common/btn_3_2.png")
    GUI:ignoreContentAdaptWithSize(zhengliBtn, false)
    GUI:setContentSize(zhengliBtn, 60.0000, 27.0000)
    

    local Text_1 = Text_Create(zhengliBtn, "text", 30, 25, 16, {r = 255, g = 255, b = 0}, "整 理")
    GUI:setAnchorPoint(Text_1, 0.5, 1)
    GUI:Text_setFontName(Text_1, "fonts/font.ttf")


    GUI:Win_FindParent({index = 7, subid = 20001, type = 1})
    GUI:Win_FindParent({index = 7, subid = 20001, content = zhengliBtn})-- 添加到背包面板
    --@整理背包按钮
    ssrAddTouchEventListener({
        widget = zhengliBtn,
        callback = function ()
            --SL:RefreshBagPos() -- 背包刷新
        end,
        scale = 0.9,
    })

    local zhengliBtn = GUI:Button_Create(nil, "item", 450.0000, 50.0000, GUI:loadTextureNormal(cangkuBtn, "res/custom/common/btn_3_1.png"))
    GUI:loadTexturePressed(cangkuBtn, "res/custom/common/btn_3_2.png")
    GUI:ignoreContentAdaptWithSize(cangkuBtn, false)
    GUI:setContentSize(cangkuBtn, 60.0000, 27.0000)
    

    local Text_1 = Text_Create(cangkuBtn, "text", 30, 25, 16, {r = 255, g = 255, b = 0},"仓 库")
    GUI:setAnchorPoint(Text_1, 0.5, 1)
    GUI:Text_setFontSize(Text_1, "fonts/font.ttf")
    
    
    GUI:Win_FindParent({index = 7, subid = 20002, type = 1})
    GUI:Win_FindParent({index = 7, subid = 20002, content = cangkuBtn}) -- 添加到背包面板
    --@仓库按钮
    ssrAddTouchEventListener({
        widget = cangkuBtn,
        callback = function ()
            ssrMessage:sendmsg(ssrNetMsgCfg.Recycle_RequestWarehouse)
        end,
        scale = 1,
    })
end

--获取背包中回收勾选的道具
function RecycleOBJ:getBagAllSelectItemsData()
    local select_list = {}
    local bagdatas = SL:GetMetaValue("BAG_DATA")

    for _,itemdata in pairs(bagdatas) do
        if self.ItemIdxData[itemdata.Index] then
            table.insert(select_list, itemdata.Index)
        end
    end
    return select_list
end

--获取发送的数据
function RecycleOBJ:getSendDataList(itemData)
    --去掉背包为0的装备index
    local sendData = {}
    local recycleAllIdx = {}
    local bagData = itemData and {itemData} or SL:GetMetaValue("BAG_DATA")
    for i,v in ipairs(self.userData) do
        for k,value in pairs(bagData) do
            if v == value.Index then
                table.insert(recycleAllIdx, v)
                --去重
                local isHave = false
                for j,index in ipairs(sendData) do
                    if index == v then
                        isHave = true
                    end
                end
                if not isHave then table.insert(sendData, v) end
            end
        end
    end
    return sendData, recycleAllIdx
end
--存入本地勾选缓存
function RecycleOBJ:setUserData(i,j,n,max)
    local userData = SL:SetLocalString("recycle", UserData)
    local userkey = SL:GetMetaValue("USER_ID")

    local datakey = userkey .."_Rec33_"..i.."_"..j
    local datavar = self.userData[i][j].ischoice

    if max then
        for x = 1, max do
            local _datakey = datakey.."_"..x
            datavar = self.userData[i][j][x]
            userData:setStringForKey(datakey,datavar)
        end
        return
    end
    if n then
        datakey = datakey.."_"..n
        datavar = self.userData[i][j][n]
    end
    userData:setStringForKey(datakey,datavar)
    --self:getUserData()    --道具勾选缓存
end
--获取本地勾选缓存
function RecycleOBJ:getUserData()
    SL:Print("进来了=-===-==-=-=-adasijmimm")
    local userData = SL:SetLocalString("recycle", UserData)
    local userkey = SL:GetMetaValue("USER_ID")
    local data = {}
    local items = {}
    for i,v in ipairs(self.cfg) do
        data[i] = data[i] or {}
        for j,var in ipairs(v) do
            data[i][j] = data[i][j] or {}
            for n,value in ipairs(var) do
                local datakey = userkey .."_Rec33_"..i.."_"..j.."_"..n
                local datavar = userData:getStringForKey(datakey)
                if datavar == "" then
                    datavar = "1"
                    userData:setStringForKey(datakey,datavar)
                end

                data[i][j][n] = tonumber(datavar)

                if n == 1 then
                    datakey = userkey .."_Rec33_"..i.."_"..j
                    datavar = userData:getStringForKey(datakey)
                    if datavar == "" then
                        datavar = "0"
                        if value.gouxuan then
                            datavar = "1"
                        end
                        userData:setStringForKey(datakey,datavar)
                    end
                    data[i][j].ischoice = tonumber(datavar)
                end

                local bool = nil
        
                if data[i][j].ischoice == 1 and data[i][j][n] == 1 then
                    bool = 1
                end
                items[value.itemid] = bool
            end
        end
    end

    SL:Dump(self.userData,"-----------sasdiaonfonfoiawnfawnoiii")


    self.userData = data
    self.ItemIdxData = items
end
-------------------------------↓↓↓ 网络 消息 ↓↓↓---------------------------------------
--同步信息
function RecycleOBJ:SyncResponse(arg1,arg2,arg3,data)
    self.isAuto = arg1
    self.isVIP = arg2
end
--收回装备
function RecycleOBJ:RequestEquip()
    local select_list = self:getBagAllSelectItemsData()
    ssrMessage:sendmsg(ssrNetMsgCfg.Recycle_RequestEquip, 0,0,0,select_list)
end
function RecycleOBJ:EquipResponse(data)

end

--请求自动回收装备
function RecycleOBJ:RequestAutoEquip(arg1)
    local sendData = self:getSendDataList()
    ssrMessage:sendmsg(ssrNetMsgCfg.Recycle_RequestAutoEquip, arg1)
end

function RecycleOBJ:AutoEquipResponse(arg1)
    self.isAuto = arg1
    self:updateAutoCheckBox()
end

---请求开启自动用金
function RecycleOBJ:RequestAutoCurrency(arg1)
    self:RequestAutoCurrency(arg1)
end

-------------------------------↓↓↓ 引擎事件 ↓↓↓---------------------------------------
--背包物品变动
--opera类型: 0:初始化 1:增加 2:删除 3:改变
--operID物品数据: table
function RecycleOBJ:OnBagOperData(data)
    if data.opera == 1 and self.isAuto == 1 then
        for _,itemdata in ipairs(data.operID) do
            --ssrPrint(itemdata.item.Index,"sadijjasdi sd ")

            if self.ItemIdxData[itemdata.item.Index] and self.ItemIdxData[itemdata.item.Index] == 1 then
                self:RequestEquip()
                break
            end
        end
    end
end


--添加游戏事件
function RecycleOBJ:addGameEvent()

end

return RecycleOBJ