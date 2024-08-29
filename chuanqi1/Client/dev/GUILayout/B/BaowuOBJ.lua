BaowuOBJ = {}

BaowuOBJ.__cname = "BaowuOBJ"
BaowuOBJ.page = 1

BaowuOBJ.cfg = {}

local cfg_baowu = ssrRequireCsvCfg("cfg_baowu")

for k,v in ipairs(cfg_baowu) do
    BaowuOBJ.cfg[v.type] = BaowuOBJ.cfg[v.type] or {title = v.name1}
    BaowuOBJ.cfg[v.type][v.level] = BaowuOBJ.cfg[v.type][v.level] or {}
    BaowuOBJ.cfg[v.type][v.level] = {name=v.name,cost=v.cost,up=v.up,attribute=v.attribute,effect=v.effect}
end

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function BaowuOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)


    --关闭背景
    GUI:addOnClickEvent(self.ui.la_bg, function()
        GUI:Win_Close(self._parent)
    end)

    --关闭背景
    GUI:addOnClickEvent(self.ui.btn_close, function()
        GUI:Win_Close(self._parent)
    end)

    --升级按钮
    GUI:addOnClickEvent(self.ui.btn_up, function()
        self:RequestUp()
    end)

    self.page = nil

    for i,cfg in ipairs(self.cfg) do
        local ui_item = GUI:Clone(self.ui.template)
        GUI:addChild(self.ui.ListView_1,ui_item)
        GUI:setName(ui_item,"btn1_switch_"..i)

        ssrLabelString(ui_item, "tx_switch", SL:ChineseToVertical( cfg.title))

        local btn_switch = ssrSeekWidgetByName(ui_item, "btn_switch")

        GUI:addOnClickEvent(btn_switch, function()
            self:updatePageBtn1(i)
        end)

        --默认选择
        if i == 1 then
            self:updatePageBtn1(1)
        end
    end

    GUI:setVisible(self.ui.template,false)

    self:updateUI()
end



--更新页签1
function BaowuOBJ:updatePageBtn1(tag)
    --上一次选择按钮
    if self.page then
        local ui_item = self.ui["btn1_switch_"..self.page]
        local btn_switch = ssrSeekWidgetByName(ui_item, "btn_switch")
        GUI:setTouchEnabled(btn_switch, true)
        local tx_switch = ssrSeekWidgetByName(btn_switch, "tx_switch")
        GUI:Text_setTextColor(tx_switch,ssrConstCfg.C3B_GRAY1)
    end
    --这一次选择按钮
    local page = tag

    if page == self.page then return end

    local ui_item = self.ui["btn1_switch_"..page]
    local btn_switch = ssrSeekWidgetByName(ui_item, "btn_switch")
    GUI:setTouchEnabled(btn_switch, false)
    local tx_switch = ssrSeekWidgetByName(btn_switch, "tx_switch")
    GUI:Text_setTextColor(tx_switch,ssrConstCfg.C3B_YELLOW1)

    self.page = page

    self:updateUI()
end


function BaowuOBJ:updateUI()
    for j = 1, GUI:ListView_getItemCount(self.ui.ListView_1) do
        local item = ssrSeekWidgetByName(self.ui.ListView_1, "btn1_switch_" .. j)
        local bool = (j == self.page) and 99 or j
        GUI:setLocalZOrder(item, bool)
    end
    
    --刷新逆天改命等级
    local isfulllevel = self:isFullLevel(self.page)


    --当前属性
    local lv = self.LevelTab[self.page]
    local cfg = self.cfg[self.page]
    ssrUpdateAttrShow(cfg, lv, "attribute", self._parent, 3, "p_cur_attr_1_", "att_name_1_", "att_value_1_", 2)

    --下级属性
    if not isfulllevel then
        ssrUpdateAttrShow(cfg, lv + 1, "attribute", self._parent, 3,"p_cur_attr_2_", "att_name_2_", "att_value_2_", 2)
    else
        for i = 1 ,3 do
            GUI:setVisible(self.ui["p_cur_attr_2_"..i],false)
        end
    end

    GUI:setVisible(self.ui["img_kuang_2"],not isfulllevel)

    --消耗
    cfg = self.cfg[self.page][lv + 1]
    if isfulllevel then
        cfg = self.cfg[self.page][lv]
    end
    for i = 1, 2 do
        local rtext_str = ""
        if isfulllevel then
            if i == 2 then
                rtext_str = ssrRTextCfg.get(20002, self.cfg[self.page].title)
            else
                local p_xh_pos = self.ui["need_item_"..i]
                GUI:removeAllChildren(p_xh_pos)
            end
        else
            if not cfg.cost[i] then break end
            local idx,need_num = cfg.cost[i][1], cfg.cost[i][2]
            local has_num = SL:GetMetaValue("ITEM_COUNT", idx)
            local itemname = SL:GetMetaValue("ITEM_NAME", idx)
            if has_num >= need_num then
                rtext_str = ssrRTextCfg.get(20000, itemname,SL:GetSimpleNumber(has_num,0).."/"..SL:GetSimpleNumber(need_num,0))
            else
                rtext_str = ssrRTextCfg.get(20001, itemname,SL:GetSimpleNumber(has_num,0).."/"..SL:GetSimpleNumber(need_num,0))
            end
        end

        local p_xh_pos = self.ui["need_item_"..i]
        GUI:removeAllChildren(p_xh_pos)
        GUI:getContentSize(p_xh_pos)
        local size = GUI:getContentSize(p_xh_pos)
        local handle = GUI:RichText_Create(p_xh_pos, "nitian_txt2", size.width/2, size.height/2, rtext_str, ssrConstCfg.width)
        GUI:setAnchorPoint(handle, 0.5, 0.5)
    end
    GUI:removeChildByName(self.ui.img_di, "sfx")
    GUI:Effect_Create(self.ui.img_di, "sfx", 230, 200, 0, cfg.effect)

    local lv_layout = self.ui["level_layout"]
    local lvTab = {lv % 10,}
    if lv / 10 > 1 then
        table.insert(lvTab,1,(lv - lvTab[1]) / 10)
    end
end

function BaowuOBJ:isFullLevel(page)
    return self.LevelTab[page] == #self.cfg[page]
end
-------------------------------↓↓↓ 网络 消息 ↓↓↓---------------------------------------
--信息同步
function BaowuOBJ:SyncResponse(arg1,arg2,arg3,data)
    self.LevelTab = data
end

-- 升级
function BaowuOBJ:RequestUp()

    local callback = function()
        ssrMessage:sendmsg(ssrNetMsgCfg.Baowu_RequestUp,self.page)
    end
    local level = self.LevelTab[self.page]

    if self.cfg[self.page][level + 1] and self.cfg[self.page][level + 1].cost then
        --ssrCheckItemCostByTable(self.cfg[page][level + 1].cost, callback,ssrNetMsgCfg.Baowu)
        callback()
    else
        callback()
    end
end

function BaowuOBJ:UpResponse(idx,lv)
    self.LevelTab[idx] = lv
    if not lv then return end
    self:updateUI()
end

return BaowuOBJ
