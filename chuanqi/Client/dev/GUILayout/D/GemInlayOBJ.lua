GemInlayOBJ = {}

GemInlayOBJ.__cname = "GemInlayOBJ"

GemInlayOBJ.cfg = ssrRequireCsvCfg("cfg_baoshi")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function GemInlayOBJ:main(objcfg,data,parent_ui)
    --将子页面加载进父页面nd_module容器中
    GUI:LoadExport(parent_ui.nd_module, objcfg.UI_PATH,function ()
        self.ui = GUI:ui_delegate(parent_ui.nd_module)

        --居中
        local pos = GUI:getPosition(parent_ui.nd_root)
        GUI:setPosition(self.ui.Layer,-pos.x, -pos.y)

        self.cut_select_euqippos = nil      --当前选择装备位置

        GUI:Layout_setBackGroundColorType(self.ui.lv_equips, 0)
        GUI:Layout_setBackGroundColorType(self.ui.lv_gems, 0)
        GUI:Layout_setBackGroundColorType(self.ui.l_screen, 0)


        --镶嵌规则
        GUI:Text_enableUnderline(self.ui.tx_rule)

        GUI:addOnClickEvent(self.ui.tx_rule, function(sender)
            local posM = GUI:getWorldPosition(sender)
            local _data = {width = 1136, str = cfg_Desc[objcfg.ID].desc, worldPos = {x = posM.x, y = posM.y}, anchorPoint = {x = 0, y = 1},formatWay = 1}
            SL:OpenCommonDescTipsPop(_data)
        end)

        --筛选可镶嵌宝石
        GUI:addOnClickEvent(self.ui.l_screen, function(sender)
            local state = not GUI:CheckBox_isSelected(self.ui.cb_screen)
            self:updateGemListView()
            local str = state and "1" or ""
            SL:SetLocalString(self.__cname, str)
        end)

        --向左
        GUI:addOnClickEvent(self.ui.btn_arraw_L, function(sender)
            self:PageBtn(sender)
        end)
        GUI:Win_SetParam(self.ui.btn_arraw_L, -1)
        
        --向右
        GUI:addOnClickEvent(self.ui.btn_arraw_R, function(sender)
            self:PageBtn(sender)
        end)
        GUI:Win_SetParam(self.ui.btn_arraw_R, 1)

        local userData = SL:GetLocalString(self.__cname)
        local state = userData ~="" and true or false
        GUI:CheckBox_setSelected(self.ui.cb_screen, state)
        self:updateEquipListView()
    end)
end

function GemInlayOBJ:PageBtn(sender)
    local page = GUI:Win_GetParam(sender) + self.cut_select_euqippos
    if page < 1  then
        page = 1
    elseif page > #ssrConstCfg.common_equip_pos then
        page = #ssrConstCfg.common_equip_pos
    end
    if page ~= self.cut_select_euqippos then
        self.cut_select_euqippos = page
        self:updateSelectEquipUI(ssrConstCfg.common_equip_pos[self.cut_select_euqippos])
        self:updateGemListView()
        self:updateEquipListViewGou()
    end
end

--更新选择装备UI
function GemInlayOBJ:updateSelectEquipUI(equippos)
    local equipdata = SL:GetMetaValue("EQUIP_DATA", equippos)
    --选择装备显示
    GUI:removeAllChildren(self.ui.nd_set_equip)
    if equipdata then
        GUI:ItemShow_Create(self.ui.nd_set_equip,"item",-28,-28,{itemData=equipdata, look=true})  --中间装备
    end

    --显示装备镶嵌宝石
    local Sockets = self.gemLevelTab[self.cut_select_euqippos]
    for hole=1, 8 do
        local nd_hole = GUI:getChildByName(self.ui.nd_gems,"nd_hole_"..hole)
        if nd_hole then
            local nd_setgem = GUI:getChildByName(nd_hole,"nd_setgem")
            GUI:removeAllChildren(nd_setgem)
            GUI:setVisible(GUI:getChildByName(nd_hole,"img_add"),true)
            if Sockets then      --有孔位信息
                local gemidx = Sockets[hole]
                if gemidx > 0 then  --有镶嵌宝石
                    local itemshow = GUI:ItemShow_Create(nd_setgem,"item",-30,-30,{index=gemidx, look=true})   --左宝石
                    GUI:setVisible(GUI:getChildByName(nd_hole,"img_add"), false)
                    GUI:ItemShow_addDoubleEvent(itemshow, function ()
                        self:RequestDel(hole)
                    end)
                end
            end
        end
    end
end

--更新装备列表对勾显示
function GemInlayOBJ:updateEquipListViewGou()
    local ui_items = GUI:ListView_getItems(self.ui.lv_equips)
    for _,ui_item in ipairs(ui_items) do
        local flag = self.cut_select_euqippos == ui_item.equipsite
        GUI:setVisible(GUI:getChildByName(ui_item,"img_gou"),flag)
    end

    if self.cut_select_euqippos > 8 then
        GUI:ListView_jumpToItem(self.ui.lv_equips,self.cut_select_euqippos - 7)
    end
end

--更新装备列表
function GemInlayOBJ:updateEquipListView()
    GUI:ListView_removeAllItems(self.ui.lv_equips)

    local gemdatas = self:getBagAllGemData()
    for i, equippos in ipairs(ssrConstCfg.common_equip_pos) do
        local equipdata = SL:GetMetaValue("EQUIP_DATA", equippos)
        GUI:LoadExport(self.ui.lv_equips, "D/GemInlayUI_cell2",function ()
            local ui_items = GUI:ListView_getItems(self.ui.lv_equips)
            local ui_item = ui_items[#ui_items]
            ui_item.equippos = equippos
            ui_item.equipsite = i
            GUI:setName(ui_item,"ItemLayer_"..i)
    
            GUI:setLocalZOrder(GUI:getChildByName(ui_item,"img_gou"),2)
            GUI:setLocalZOrder(GUI:getChildByName(ui_item,"img_red_point"),3)
            local isshowrp = self:checkSetEquipPos(i, gemdatas)      --红点显示
            GUI:setVisible(GUI:getChildByName(ui_item,"img_red_point"),isshowrp)
    
            if equipdata then
                local itemshow = GUI:ItemShow_Create(ui_item, "item", 4, 4, {itemData=equipdata, look=true})   --装备
                GUI:ItemShow_addReplaceClickEvent(itemshow, function ()
                    self.cut_select_euqippos = i
                    self:updateSelectEquipUI(ssrConstCfg.common_equip_pos[self.cut_select_euqippos])
                    self:updateGemListView()
                    self:updateEquipListViewGou()
                end)
                if not self.cut_select_euqippos then
                    --默认选择装备
                    self.cut_select_euqippos = i
                    self:updateSelectEquipUI(ssrConstCfg.common_equip_pos[self.cut_select_euqippos])
                    self:updateGemListView()
                 end
            else
                GUI:addOnClickEvent(ui_item, function(sender)
                    self:CheckEquip(sender)
                end)
    
                GUI:Win_SetParam(ui_item, i)
    
                local size = GUI:getContentSize(ui_item)
                local name = ssrConstCfg.common_equip_posName[i]
                GUI:RichText_Create(ui_item, "itemname", (size.width - size.width * #name / 12) / 2 , size.height/3, name, ssrConstCfg.width)
    
                if not self.cut_select_euqippos then self:CheckEquip(ui_item) end    --默认选择装备
            end
        end)
    end
    self:updateEquipListViewGou()
end

function GemInlayOBJ:CheckEquip(sender)
    self.cut_select_euqippos = GUI:Win_GetParam(sender)
    self:updateSelectEquipUI(ssrConstCfg.common_equip_pos[self.cut_select_euqippos])
    self:updateGemListView()
    self:updateEquipListViewGou()
end

--更新宝石列表
function GemInlayOBJ:updateGemListView()
    GUI:ListView_removeAllItems(self.ui.lv_gems)

    local gemdatas = {}

    --获取背包中所有宝石数据
    local bagdata = SL:GetMetaValue("BAG_DATA")
    for _,itemdata in pairs(bagdata) do
        local gemcfg = self.cfg[itemdata.Index]
        if gemcfg then
            SL:dump(itemdata,"itemdata",1)
            local count = itemdata.OverLap~=0 and itemdata.OverLap or 1
            table.insert(gemdatas, {index=itemdata.Index, makeindex=itemdata.MakeIndex, count=count, hole=gemcfg.StdMode, level=gemcfg.dengji, yes=true})
        end
    end

    --区分可镶嵌与不可镶嵌宝石
    local Sockets = self.gemLevelTab[self.cut_select_euqippos]

    if Sockets then
        for _,gemdata in ipairs(gemdatas) do
            local hole = gemdata.hole               --hole宝石镶嵌孔位
            local gemIdx = Sockets[hole]            --当前已镶嵌的宝石Idx
            local setgemcfg = self.cfg[gemIdx]       --当前已镶嵌宝石配置
            if setgemcfg then
                gemdata.yes = gemdata.level > setgemcfg.dengji
            end
        end

        --清理不可镶嵌宝石
        if GUI:CheckBox_isSelected(self.ui.cb_screen) then
            local temp_gemdatas = gemdatas
            gemdatas = {}
            for _,gemdata in ipairs(temp_gemdatas) do
                if gemdata.yes then
                    table.insert(gemdatas, gemdata)
                end
            end
        end
    end;
    local gemnum = #gemdatas;
    if gemnum == 0 then return end;

    --排序宝石数据
    if gemnum > 1 then
        table.sort(gemdatas, function (a, b)
            if a.hole == b.hole then
                return a.level > b.level
            else
                return a.hole < b.hole
            end
        end)
    end
    local max = gemnum
    local limit = 4
    local num = math.ceil(max/limit)

    for i = 1,num do
        GUI:LoadExport(self.ui.lv_gems, "D/GemInlayUI_cell1",function ()
            local ui_index = GUI:ListView_getItemCount(self.ui.lv_gems) - 1
            local ui_item = GUI:ListView_getItemByIndex(self.ui.lv_gems, ui_index)
            GUI:setName(ui_item,"ItemLayer_"..i)
    
            --最后一个item 隐藏不需要的按钮
            if i==num then
                local manynum = max%limit
                if manynum > 0 then
                    manynum = manynum + 1
                    for j = 1, limit do
                        local handle = GUI:getChildByName(ui_item, "img_cell_"..j)
                        GUI:setVisible(handle,false)
                    end
                end
            end
            for j = 1,limit do
                local img = ssrSeekWidgetByName(ui_item, "img_cell_"..j)
                local index = (i-1)*limit+j
                GUI:setName(img,"img_cell_"..index)
            end
        end)
    end
    for i = 1, gemnum do
        local img = ssrSeekWidgetByName(self.ui.lv_gems, "img_cell_"..i)
        local gemdata = gemdatas[i]
        gemdata.yes = self.cut_select_euqippos and gemdata.yes or false     --未选择装备不显示箭头
        local itemshow = GUI:ItemShow_Create(img,"item", 0, 0, {index=gemdata.index, look=true, count=gemdata.count})

        if gemdata.yes then ssrAddItemShowArrow(itemshow) end
        GUI:ItemShow_addDoubleEvent(itemshow,function ()     --双击镶嵌宝石
            self:RequestSet(self.cut_select_euqippos, gemdata.makeindex)
        end)
    end
end

-- -------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步数据
function GemInlayOBJ:SyncResponse(arg1,arg2,arg3,data)
    self.gemLevelTab = data
end

function GemInlayOBJ:SetResponse(equip_pos,hole,gem_idx)
    self.gemLevelTab[equip_pos][hole] = gem_idx
    if not GUI:GetWindow(nil,self.paging) then return end
    if self.cut_select_euqippos ~= equip_pos then return end        --当出现网络延时， 收到回复消息时， 可能已选择了其他装备
    self:updateSelectEquipUI(ssrConstCfg.common_equip_pos[self.cut_select_euqippos])
    self:updateGemListView()
    self:updateEquipListView()
end

function GemInlayOBJ:DelResponse(equip_pos,hole,gem_idx)
    self.gemLevelTab[equip_pos][hole] = gem_idx
    if not GUI:GetWindow(nil,self.paging) then return end
    if self.cut_select_euqippos ~= equip_pos then return end        --当出现网络延时， 收到回复消息时， 可能已选择了其他装备
    self:updateSelectEquipUI(ssrConstCfg.common_equip_pos[self.cut_select_euqippos])
    self:updateGemListView()
    self:updateEquipListView()
end
--镶嵌
function GemInlayOBJ:RequestSet(equip_pos, gem_makeid)
    ssrMessage:sendmsg(ssrNetMsgCfg.GemInlay_RequestSet, equip_pos, gem_makeid)
end

--拆卸
function GemInlayOBJ:RequestDel(hole)
    ssrMessage:sendmsg(ssrNetMsgCfg.GemInlay_RequestDel, self.cut_select_euqippos, hole)
end
-- -------------------------------↓↓↓ 事件 ↓↓↓---------------------------------------
-- --背包物品变动
-- --opera类型: 0:初始化 1:增加 2:删除 3:改变
-- --operID物品数据: table
-- function GemInlayOBJ:OnBagOperData(data)
--     if data.opera == 0 then
--         self:setRPShow()
--     else
--         for _,itemdata in ipairs(data.operID) do
--             if self.cfg[itemdata.item.Index] then
--                 self:setRPShow()
--                 self:updateGemListView()            --这里要注意服务端  更新镶嵌装备属性 与 拿走或给予宝石的循序
--                 self:updateEquipListView()
--                 break
--             end
--         end
--     end
-- end

-- -------------------------------↓↓↓ 逻辑处理 ↓↓↓---------------------------------------
--获取背包中所有宝石数据
function GemInlayOBJ:getBagAllGemData()
    local gemdatas = {}
    local bagdatas = SL:GetMetaValue("BAG_DATA")
    for _,itemdata in pairs(bagdatas) do
        if self.cfg[itemdata.Index] then
            table.insert(gemdatas, itemdata)
        end
    end
    return gemdatas
end

--检查装备位置是否可以镶嵌宝石
function GemInlayOBJ:checkSetEquipPos(equippos, baggemdatas)
    --背包中没有宝石
    if #baggemdatas == 0 then return false end
    --获取该部位镶嵌数据
    local Sockets =  self.gemLevelTab[equippos]
    for hole = 1, 8 do
        local gemidx = Sockets[hole]
        local gemcfg = self.cfg[gemidx]
        for _,baggemdata in ipairs(baggemdatas) do
            local baggemcfg = self.cfg[baggemdata.Index]
            if baggemcfg.StdMode == hole then
                if gemcfg then
                    if gemcfg.dengji < baggemcfg.dengji then
                        return true
                    end
                else
                    return true
                end
            end
        end
    end

    return false
end

-- -------------------------------↓↓↓ 引擎事件 ↓↓↓---------------------------------------
-- --设置红点显示
-- function GemInlayOBJ:setRPShow()
--     -- local isShowRP = false

--     -- --获取背包中所有宝石
--     -- local gemdatas = self:getBagAllGemData()
--     -- if #gemdatas == 0 then
--     --     ssrGameEvent:push(self.ssrobjcfg.RP_EVENT, isShowRP)
--     --     return
--     -- end

--     -- --有穿戴装备
--     -- for i,equippos in ipairs(ssrConstCfg.common_equip_pos) do
--     --     isShowRP = self:checkSetEquipPos(i, gemdatas)
--     --     -- ssrPrint("["..i.."]"..tostring(isShowRP))
--     --     if isShowRP then
--     --         ssrGameEvent:push(self.ssrobjcfg.RP_EVENT, isShowRP)
--     --         return
--     --     end
--     -- end

--     -- ssrGameEvent:push(self.ssrobjcfg.RP_EVENT, isShowRP)
-- end

-- -------------------------------↓↓↓ 外部调用 ↓↓↓---------------------------------------

-- --获取该部位镶嵌宝石数据
-- function GemInlayOBJ:getEquipPosGemData(equal_pos)
--     local equip_site = table.indexof(ssrConstCfg.common_equip_pos, equal_pos)
--     if equip_site then
--         return self.gemLevelTab[equip_site]
--     end
-- end

return GemInlayOBJ
