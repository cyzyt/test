RongluOBJ = {}

RongluOBJ.__cname = "RongluOBJ"

RongluOBJ.cfg = {}
RongluOBJ.maxcol = 4  --最大列
RongluOBJ.isVIP = 0

RongluOBJ.cfg = {}
local cfg_ronglu = ssrRequireCsvCfg("cfg_fenjie")
local Page_Tab = {}
for i,v in ipairs(cfg_ronglu) do
    if v.type == 2 then
        local index = 0
        for j = 1, #Page_Tab do
            if Page_Tab[j] == v.leixing then
                index = j
                break
            end
        end
        if index == 0 then
            index = #Page_Tab + 1
            Page_Tab[index] = v.leixing
        end
        RongluOBJ.cfg[index] = RongluOBJ.cfg[index] or {title = v.txt}
        RongluOBJ.cfg[index][#RongluOBJ.cfg[index] + 1] = {
            idx = i,type = v.type,equipid = v.equipid,itemid = v.itemid,harvest = v.harvest,
            beizhu = v.beizhu,condition = v.condition,txt = v.txt,leixing = v.leixing,
        }
    end
end

RongluOBJ.setDataType = {
    ["mainCheck"] = 0,              --主面板勾选
    ["secondaryCheck"] = 1,         --副面版勾选
    ["allCheck"] = 3,               --副面版全选/全不选
}

RongluOBJ.cfg_Desc = cfg_Desc
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function RongluOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, objcfg.UI_PATH,function ()
        self._parent = parent
        self.ui = GUI:ui_delegate(parent)
        GUI:setVisible(self.ui.Hidewnd,false)
    
        --关闭按钮
        GUI:addOnClickEvent(self.ui.btn_close, function()
            GUI:Win_Close(self._parent)
        end)
    
        --关闭背景
        GUI:addOnClickEvent(self.ui.la_bg, function()
            GUI:Win_Close(self._parent)
        end)
    
        --熔炼按钮
        GUI:addOnClickEvent(self.ui.btn_fenjie, function()
            self:RequestRonglu(self.makeidxs)
        end)
    
        --隐藏副界面
        GUI:addOnClickEvent(self.ui.hideWnd_closeBtn, function()
            GUI:setVisible(self.ui.Hidewnd,false)
        end)
    
    
        --隐藏副界面
        GUI:addOnClickEvent(self.ui.hideWnd_close, function()
            GUI:setVisible(self.ui.Hidewnd,false)
        end)
    
        --全选
        GUI:Win_SetParam(self.ui.hideWnd_allOn,0)
        GUI:addOnClickEvent(self.ui.hideWnd_allOn, function()
            self:SelectAllChoice(self.ui.hideWnd_allOn)
        end)
    
    
        --全不选
        GUI:Win_SetParam(self.ui.hideWnd_allOff,1)
        GUI:addOnClickEvent(self.ui.hideWnd_allOff, function()
            self:SelectAllChoice(self.ui.hideWnd_allOff)
        end)
    
        --自动回收checkbox
        GUI:addOnClickEvent(self.ui.btn_auto_recycle, function()
            self:RequestAuto(1 - self.isAuto)
        end)

        if self.cfg_Desc[objcfg.ID] then
            GUI:removeAllChildren(self.ui.Desc_text)
            local size = GUI:getContentSize(self.ui.Desc_text)
            local handle = GUI:RichText_Create(self.ui.Desc_text, "txt", size.width/2, size.height/2, cfg_Desc[objcfg.ID].desc, ssrConstCfg.width)
            GUI:setAnchorPoint(handle, 0.5, 0.5)
        end

        self:updateUI()
    end)
end

function RongluOBJ:updateUI()
    self.cut_select_euqippos = nil
    self:updateMainUI()
    self:updateEquipListView()
    self:updateAutoCheckBox()
end

--更新主面板
function RongluOBJ:updateMainUI()
    GUI:removeAllChildren(self.ui.ListView_2)

    local cfg = self.cfg
    if not cfg then return end

    local max = #cfg
    local limit = 3
    local num = math.ceil(max/limit)
    for i = 1,num do
        local ui_item = GUI:Clone(self.ui.template_1)
        GUI:setVisible(ui_item,true)
        GUI:ListView_pushBackCustomItem(self.ui.ListView_2,ui_item)
        --最后一个item 隐藏不需要的按钮
        if i==num then
            local manynum = max % limit
            if manynum > 0 then
                manynum = manynum + 1
                for j = manynum, limit do
                    GUI:setVisible(GUI:getChildByName(ui_item, "img_"..j),false)
                end
            end
        end

        for j = 1,limit do
            local img = GUI:getChildByName(ui_item, "img_"..j)
            local index = (i-1) * limit + j
            GUI:setName(img,"img_"..index)
        end
    end

    local list_ui = GUI:ui_delegate(self.ui.ListView_2)
    for i,tab in ipairs(cfg) do
        local img = list_ui["img_"..i]
        --名字
        local text = GUI:getChildByName(img, "type_name")
        GUI:Text_enableUnderline(text)
        GUI:Text_setString(text, tab.title)

        local panel = GUI:getChildByName(img, "item_recycle")

        --打开副面板
        GUI:addOnClickEvent(panel, function(sender)
            self.page = GUI:Win_GetParam(sender)
            self:updateSecondaryUI()
        end)
        GUI:Win_SetParam(panel, i)

        --选择框
        local check_box = GUI:getChildByName(img, "check_recycle")
        GUI:CheckBox_setSelected(check_box,self.userData[i].ischoice == 0)
        GUI:Win_SetParam(check_box, i)
        GUI:addOnClickEvent(check_box, function(sender)
            self:setUserDataByRonglu(not GUI:CheckBox_isSelected(sender),i,nil,"主面板")
        end)
    end
end

--更新副面板
function RongluOBJ:updateSecondaryUI()
    GUI:removeAllChildren(self.ui.ListView_3)

    local cfg = self.cfg[self.page]

    if not cfg then return end
    
    local max = #cfg
    local limit = 1
    local num = math.ceil(max/limit)

    for i = 1,num do
        local ui_item = GUI:Clone(self.ui.template_3)
        GUI:setVisible(ui_item,true)
        GUI:ListView_pushBackCustomItem(self.ui.ListView_3,ui_item)

        for j = 1,limit do
            local img = ssrSeekWidgetByName(ui_item, "img_"..j)
            local index = (i-1)*limit+j
            GUI:setName(img,"img_"..index)
        end
    end

    local list_ui = GUI:ui_delegate(self.ui.ListView_3)

    for i,tab in ipairs(cfg) do
        local img = list_ui["img_"..i]

        ssrLabelString(img, "item_name", SL:GetMetaValue("ITEM_NAME", tab.equipid))

        local item_recycle = GUI:getChildByName(img, "item_recycle")
        GUI:Win_SetParam(item_recycle, i)
        GUI:addOnClickEvent(item_recycle, function(sender)
            local check_box = GUI:getChildByName(img, "check_recycle")
            local bool = not (GUI:CheckBox_isSelected(check_box))
            GUI:CheckBox_setSelected(check_box, bool)
            self:setUserDataByRonglu(bool,self.page,tab.equipid,"副面版1")
        end)

        --选择框
        local check_box = GUI:getChildByName(img, "check_recycle")
        GUI:CheckBox_setSelected(check_box, self.userData[self.page][tab.equipid] == 0)
        GUI:Win_SetParam(check_box, i)
        GUI:addOnClickEvent(check_box,function (sender)
            self:setUserDataByRonglu(not GUI:CheckBox_isSelected(sender), self.page,tab.equipid,"副面版2")
        end)
    end

    GUI:setVisible(self.ui.Hidewnd,true)
end

--详情页面的选中逻辑
function RongluOBJ:setUserDataByRonglu(selectType,page,itemidx,msg)
    local ischoice = selectType and 0 or 1
    if not itemidx then
        --主面板勾选情况
        self.userData[page].ischoice = ischoice
        self:setUserData(self.setDataType.mainCheck,{page,ischoice})
    else
        --副面板勾选情况[单体]
        self.userData[page][itemidx] = ischoice
        self:setUserData(self.setDataType.secondaryCheck,{page,itemidx,ischoice})
    end
    self:updateEquipListView()
end

--全选/全不选
function RongluOBJ:SelectAllChoice(sender)
    if not self.page then return end

    local ischoice = GUI:Win_GetParam(sender)

    local list_ui = GUI:ui_delegate(self.ui.ListView_3)

    for i, cfg in ipairs(self.cfg[self.page]) do
        if self.userData[self.page][cfg.equipid] ~= ischoice then
            self.userData[self.page][cfg.equipid] = ischoice
            local check_box = GUI:getChildByName(list_ui["img_"..i],"check_recycle")
            GUI:CheckBox_setSelected(check_box, ischoice == 0)
        end
    end

    --副面板勾选情况[整体]
    self:setUserData(self.setDataType.allCheck,{self.page,ischoice})

    self:updateEquipListView()
end

--更新装备列表
function RongluOBJ:updateEquipListView()
    GUI:ListView_removeAllItems(self.ui.ListView_1)

    local equipdatas = self:getBagAlEquipData()
    --显示背包装备
    local maxcol = self.maxcol
    local maxrow = math.ceil(#equipdatas/maxcol)         --最大行
    for row = 1, maxrow do
        local btn = GUI:Clone(self.ui.template_2)
        GUI:setVisible(btn,true)
        GUI:ListView_pushBackCustomItem(self.ui.ListView_1,btn)
    end   --创建所有格子
    --隐藏所有格子
    local ui_items=GUI:ListView_getItems(self.ui.ListView_1)
    for _, ui_item in ipairs(ui_items) do
        for col=1, maxcol do
            GUI:setVisible(GUI:getChildByName(ui_item,"img_cell_"..col),false)
        end
    end

    --创建装备

    self.makeidxs = {}
    for i = 1, #equipdatas do
        local row = math.ceil(i/maxcol)
        local col = i % maxcol
        if col == 0 then col = maxcol end

        local ui_item = ui_items[row]

        local img_cell= GUI:getChildByName(ui_item, "img_cell_"..col)

        local equipdata = equipdatas[i]

        local itemshow = GUI:ItemShow_Create(img_cell, "item", 0, 0,{index = equipdata.Index, makeindex = equipdata.MakeIndex, look = true, count = equipdata.count})

        self.makeidxs[i] = {equipdata.MakeIndex,0,img_cell}

        local img_gou = GUI:getChildByName(img_cell,"img_gou")
        GUI:setVisible(img_gou,true)
        GUI:setLocalZOrder(img_gou, 2)

        GUI:ItemShow_addReplaceClickEvent(itemshow,function ()
            self.makeidxs[i][2] = self.makeidxs[i][2] == 0 and 1 or 0
            self:updateEquipListViewGou()
        end)

        GUI:setVisible(img_cell,true)
    end

    self:updateEquipListViewGou()
end

--更新装备列表对勾显示
function RongluOBJ:updateEquipListViewGou()
    for i,v in ipairs(self.makeidxs) do
        local child = GUI:getChildByName(v[3],"img_gou")
        GUI:setVisible(child, v[2] == 0)
    end
end

function RongluOBJ:updateAutoCheckBox()
    if self.ui then
        GUI:CheckBox_setSelected(self.ui.check_autorecycle, self.isAuto == 1)
    end
end
-----------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
local function tonumberData(tab,x)
    local str_x = tostring(x)
    if tab and tab[str_x] then
        tab[x] = tab[str_x]
        tab[str_x] = nil
    end
    return tab
end

--消息同步
function RongluOBJ:SyncResponse(arg1,arg2,arg3,data)
    self.isAuto = arg1
    self.isVIP = arg2
    self.ItemIdxData = {}

    for i,value in ipairs(self.cfg) do
        for j, var in ipairs(value) do
            data[i] = tonumberData(data[i],var.equipid)
            self.ItemIdxData[var.equipid] = {var.leixing,var.equipid}
        end
    end

    self.userData = data
end

---请求开启自动回收
function RongluOBJ:RequestAuto(arg1)
    ssrMessage:sendmsg(ssrNetMsgCfg.Ronglu_RequestAuto, arg1)
end

--分解
function RongluOBJ:RequestRonglu(makeidxs)
    if not makeidxs then return end
    local equipdatas = ""
    for i,v in ipairs(makeidxs) do
        if v[2] == 0 then
            equipdatas = equipdatas .."#" ..v[1]
        end
    end
    if string.len(equipdatas) > 0 then
        ssrMessage:sendmsg(ssrNetMsgCfg.Ronglu_RequestRonglu,0,0,0,equipdatas)
    end
end

function RongluOBJ:AutoResponse(arg1)
    if not GUI:GetWindow(nil,self.__cname) then return end
    self.isAuto = arg1
    self:updateAutoCheckBox()
end

function RongluOBJ:RongluResponse()
    if not GUI:GetWindow(nil,self.__cname) then return end
    self:updateEquipListView()
end
-------------------------------↓↓↓ 逻辑处理 ↓↓↓---------------------------------------
--获取背包中所有可熔炼装备
function RongluOBJ:getBagAlEquipData()
    local equipdatas = {}
    local bagdatas = SL:GetMetaValue("BAG_DATA")
    for _,itemdata in pairs(bagdatas) do
        SL:Print("itemdata",itemdata.MakeIndex,type(itemdata.MakeIndex))
        local temp = self.ItemIdxData[itemdata.Index]
        if temp then
            local i ,j = temp[1],temp[2]
            if self.userData[i][j] == 0 and self.userData[i].ischoice == 0 then
                table.insert(equipdatas, itemdata)
            end
        end
    end
    return equipdatas
end

--存入本地勾选
function RongluOBJ:setUserData(_type,tab)
    ssrMessage:sendmsg(ssrNetMsgCfg.Ronglu_SetUserData, _type,0,0,tab)
end
-------------------------------↓↓↓ 引擎事件 ↓↓↓---------------------------------------
--背包物品变动
--opera类型: 0:初始化 1:增加 2:删除 3:改变
--operID物品数据: table
local leixing ,equipid,count,equipdatas
function RongluOBJ:OnBagOperData(data)
    if data and data.opera == 1 then
        count = SL:GetMetaValue("BAG_REMAIN_COUNT")
        if count < 5 and self.isAuto == 1 then
            equipdatas = ""
            local items = SL:GetMetaValue("BAG_DATA")
            for makeIndex,itemdata in pairs(items) do
                if self.ItemIdxData[itemdata.Index] then
                    leixing ,equipid = self.ItemIdxData[itemdata.Index][1],self.ItemIdxData[itemdata.Index][2]
                    if self.userData[leixing][equipid] == 0 and self.userData[leixing].ischoice == 0 then
                        equipdatas = equipdatas .."#" ..makeIndex
                    end
                end
            end
            if string.len(equipdatas) > 0 then
                ssrMessage:sendmsg(ssrNetMsgCfg.Ronglu_RequestRonglu,0,0,0,equipdatas)
            end
        end
    end
end
SL:RegisterLUAEvent(LUA_EVENT_BAG_ITEM_CHANGE, "RongluOBJ", function (data)
    RongluOBJ:OnBagOperData(data)
end)


return RongluOBJ