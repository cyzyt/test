ForgingstarOBJ = {}

ForgingstarOBJ.__cname = "ForgingstarOBJ"

ForgingstarOBJ.cfg = {}
ForgingstarOBJ.site_tab = {1,0,3,4,5,6,7,8,10,11} --装备位置表

local itemtitle = {

}

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ForgingstarOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, objcfg.UI_PATH)

    self._parent = parent
    self.ui = GUI:ui_delegate(parent)

    self.page1 = nil

    self.starLevelTab = {}

    local cfg_qianghua = ssrRequireCsvCfg("cfg_qianghua")


    self.site_name_tab = {"武器","衣服","项链","头盔","右手镯","左手镯","右戒指","左戒指","腰带","鞋子"} --装备位置表

    for i, site in ipairs(self.site_tab) do
        self.cfg[site] = {}
        self.starLevelTab[i] = 0
    end
    for k,v in ipairs(cfg_qianghua) do
        if self.cfg[v.weizhi] then
            self.cfg[v.weizhi][v.level] = self.cfg[v.weizhi][v.level] or {}
            self.cfg[v.weizhi][v.level] = 
            {
                weizhi=v.weizhi,shuxingjiacheng=v.shuxingjiacheng,xiaohao=v.xiaohao,chenggonglv=v.chenggonglv,
                shuxing = v.shuxing,jianji = v.jianji,item=v.item
            }
        end
    end

    self:getUserData()    --道具勾选缓存

    --关闭按钮
    GUI:addOnClickEvent(self.ui.btn_close, function()
        GUI:Win_Close(self._parent)
    end)

    --关闭背景
    GUI:addOnClickEvent(self.ui.la_bg, function()
        GUI:Win_Close(self._parent)
    end)

    --强星按钮
    GUI:addOnClickEvent(self.ui.btn_go, function()
        self:RequestUpgradeStar()
    end)

    --幸运保底
    GUI:addOnClickEvent(self.ui.btn_luck_btn, function()
        self.isLuck = self.isLuck ~= 1 and 1 or 0
        self:setUserData()
        self:updateAutoCheckBox()
    end)

    --镶嵌规则
    GUI:Text_enableUnderline(self.ui.tx_rule)
    GUI:addOnClickEvent(self.ui.tx_rule, function(sender)
        local posM = GUI:getWorldPosition(self.ui.tx_rule)
        local data = {width = 1136, str = cfg_Desc[objcfg.ID].desc, worldPos = {x = posM.x, y = posM.y}, anchorPoint = {x = 0, y = 1},formatWay = 1}
        SL:OpenCommonDescTipsPop(data)
    end)

    for i,cfg in ipairs(self.site_tab) do
        local item = GUI:Clone(self.ui.template)
        GUI:ListView_pushBackCustomItem(self.ui.ListView_1, item)
        local ui_item = GUI:ListView_getItemByIndex(self.ui.ListView_1, i-1)
        GUI:setName(ui_item, "btn1_switch_"..i)

        ssrLabelString(ui_item, "tx_switch", self.site_name_tab[i])

        GUI:addOnClickEvent(ui_item, function()
            self:updatePageBtn1(ui_item)
        end)
        GUI:Win_SetParam(ui_item, i)


        if i == 1  then
            self:updatePageBtn1(ui_item)
        end
    end

    self:updateAutoCheckBox()
end

function ForgingstarOBJ:updateAutoCheckBox()
    --self.ui.check_luck_check:setSelected(self.isLuck == 1)
    -- GUI:CheckBox_Create(check_luck_layout, "check_luck_check", 12, 15, "res/custom/Gem/cb_1_1.png", "res/custom/Gem/cb_1_2.png")
end

--更新页签1
function ForgingstarOBJ:updatePageBtn1(sender)
    --上一次选择按钮
    if self.page1 then
        local btn_switch = self.ui["btn1_switch_"..self.page1]
        --btn_switch:setEnabled(true)
        GUI:setTouchEnabled(btn_switch, true)
        local tx_switch = ssrSeekWidgetByName(btn_switch, "tx_switch")
        GUI:Text_setTextColor(tx_switch, ssrConstCfg.C3B_GRAY1)
    end
    --这一次选择按钮
    local page1 = GUI:Win_GetParam(sender)

    if page1 == self.page1 then return end

    local btn_switch = self.ui["btn1_switch_"..page1]
    --btn_switch:setEnabled(false)
    GUI:setTouchEnabled(btn_switch, false)
    local tx_switch = ssrSeekWidgetByName(btn_switch, "tx_switch")
    GUI:Text_setTextColor(tx_switch, ssrConstCfg.C3B_YELLOW1)

    self.page1 = page1

    self:updateUI()
end

function ForgingstarOBJ:searchesNum()
    local cfg = self.cfg[self.page1][self.page2]
    for i,tab in ipairs(cfg) do

        local img = ssrSeekWidgetByName(self.ui.ListView_2, "img_"..i)
        for j,items in ipairs(tab.itemid1) do
            local need_str = ""
            local idx,need_num = items[1], items[2]
            local have_num = SL:GetMetaValue("ITEM_COUNT", idx)
            local itemname = SL:GetMetaValue("ITEM_NAME", idx)
            if idx <= 100 then
                if have_num >= 10000 then
                    need_str = math.floor(have_num/10000) .."万"
                else
                    need_str = have_num
                end
                need_str = need_str.."/"
                if need_num >= 10000 then
                    need_str = need_str..math.floor(need_num/10000) .."万"
                else
                    need_str = need_str..need_num
                end
            else
                need_str = need_num
            end
            if have_num >= need_num then
                need_str = ssrRTextCfg.get(20003, itemname,need_str)
            else
                need_str = ssrRTextCfg.get(20004, itemname,need_str)
            end
            local items_layout = ssrSeekWidgetByName(img, "itemNeed"..j)
            GUI:removeAllChildren(items_layout)
            local size = GUI:getContentSize(items_layout)
            GUI:RichText_Create(items_layout, "txt", size.width/2, size.height/2, need_str, ssrConstCfg.width)
        end
    end
end

function ForgingstarOBJ:updateUI()
    local weizhi = self.site_tab[self.page1]
    local equipdata = SL:GetMetaValue("EQUIP_DATA", weizhi)
    GUI:removeAllChildren(self.ui.item)
    SL:dump(equipdata,"equipdata")
    if equipdata then
        GUI:ItemShow_Create(self.ui.item, "item", 0, 0, {index = equipdata.Index, look = true})
    end

    -- local num = 0

    -- --判断是否满星
    -- local isfulllevel = self:isFullLevel(self.page1)

    -- local level = self.starLevelTab[self.page1] or 0

    -- --ssrDump(self.starLevelTab,"self.starLevelTab")
    -- local next_level = level + 1
    -- if isfulllevel then
    --     next_level = level
    -- end
    -- local max = level
    -- local _color = "#DCDCDC"
    -- if level > 6 and level <= 12 then
    --     num = 1
    --     max = level - 6
    --     _color = "#76EE00"
    -- elseif level > 12 and level <= 18 then
    --     num = 2
    --     max = level - 12
    --     _color = "#FF00FF"
    -- end
    -- for i = 1, 6 do
    --     local star_img = "res/custom/qianghua/icon_lvse_0%s_%s.png"
    --     local temp = i > max and 0 or 1
    --     self.ui["xing_"..i]:loadTexture(string.format(star_img, num,temp),0)
    -- end

    -- local star_bg_img = "res/custom/qianghua/icon_star_0%s_1.png"
    -- local img_bg = GUI:Image_Create(self.ui.item, "img", 0, 23, star_bg_img)
    -- GUI:setName(img_bg,"star_bg")
    -- GUI:Image_loadTexture(img_bg, star_bg_img)
    -- GUI:setAnchorPoint(img_bg,0, 0)

    -- local star_img = "res/custom/qianghua/icon_star_0%s.png"
    -- local img_bg = GUI:Image_Create(self.ui.item, "img", 0, 30, star_img)
    -- GUI:setName(img_bg,"star")
    -- GUI:Image_loadTexture(img_bg, star_img)
    -- GUI:setAnchorPoint(img_bg,0, 0)

    -- local size = GUI:getContentSize(img_bg)
    -- local star_txt = "<font color='".._color.."' size='14'>"..level .."</font>"
    -- GUI:RichText_Create(img_bg, "num", size.width/2, size.height/2 + 16, star_txt, ssrConstCfg.width)

    -- local cfg = self.cfg[weizhi][next_level]

    -- --成功概率
    -- local pro_str = ""
    -- pro_str = "<font color='#4AE74A' size='15'>成功率："..cfg.chenggonglv/100 .."%</font>"
    -- local items_layout = self.ui.itemPro
    -- GUI:removeAllChildren(items_layout)
    -- local size = GUI:getContentSize(items_layout)
    -- GUI:RichText_Create(items_layout, "txt", size.width/2, size.height/2, pro_str, ssrConstCfg.width)

    -- --进阶消耗
    -- local items_layout = self.ui["itemNeed1"]
    -- GUI:removeAllChildren(items_layout)
    -- if not isfulllevel then
    --     local idx,need_num = cfg.xiaohao[1][1], cfg.xiaohao[1][2]
    --     local have_num = SL:GetMetaValue("ITEM_COUNT", idx)
    --     local itemname = SL:GetMetaValue("ITEM_NAME", idx)
    --     local size = GUI:getContentSize(items_layout)
    --     local need_str = have_num .. "/" .. need_num
    --     if have_num >= need_num then
    --         need_str = ssrRTextCfg.get(20003, itemname,need_str)
    --     else
    --         need_str = ssrRTextCfg.get(20004, itemname,need_str)
    --     end
    --     GUI:RichText_Create(items_layout, "txt", size.width/2, size.height/2, need_str, ssrConstCfg.width)
    -- end


    -- --当前属性
    -- ssrUpdateAttrShow(self.cfg[weizhi], level, "shuxing", self._parent, 3, "p_cur_attr_1_", "att_name_1_", "att_value_1_", 2)
    -- --下级属性
    -- if not isfulllevel then
    --     ssrUpdateAttrShow(self.cfg[weizhi], next_level, "shuxing", self._parent, 3,"p_cur_attr_2_", "att_name_2_", "att_value_2_", 2)
    -- else
    --     for i = 1 ,3 do
    --         self.ui["p_cur_attr_2_"..i]:setVisible(false)
    --     end
    -- end
    --self:searchesNum()
end

-------------------------------↓↓↓ 外部调用 ↓↓↓---------------------------------------

function ForgingstarOBJ:getForgingStarLevels(where)
    local cfg = nil
    local lv = 0
    for i, val in ipairs(self.site_tab) do
        if val == where then
            lv = self.starLevelTab[i]
            cfg = self.cfg[where][lv]
            break
        end
    end
    return lv,cfg
end

-------------------------------↓↓↓ 网络 消息 ↓↓↓---------------------------------------
function ForgingstarOBJ:SyncResponse(arg1,arg2,arg3,data)
    self.starLevelTab = data
end
--打开界面
function ForgingstarOBJ:OpenUI()
    self:OpenLayer()
end

--强星
function ForgingstarOBJ:RequestUpgradeStar()
    local weizhi = self.site_tab[self.page1]
    local lv = self:getForgingStarLevels(weizhi) + 1
    local cfg = clone(self.cfg[weizhi][lv])
    local callback = function()
        ssrMessage:sendmsg(ssrNetMsgCfg.Forgingstar_RequestUpgradeStar,weizhi,self.isLuck)
    end
    if cfg then
        local cost = cfg.xiaohao
        if self.isLuck == 1 then
            table.insert(cost,cfg.item[1])
        end
        -- ssrCheckItemCostByTable(cost, callback,ssrNetMsgCfg.Forgingstar)
        callback()
    else
        callback()
    end
end

function ForgingstarOBJ:UpgradeStarResponse(weizhi,lv)
    for i, _weizhi in ipairs(self.site_tab) do
        if _weizhi == weizhi then
            self.starLevelTab[i] = lv
            break
        end
    end
    if not weizhi then return end
    self:updateUI()
end
function ForgingstarOBJ:isFullLevel(page)
    return self.starLevelTab[page] == #self.cfg[self.site_tab[page]]
end

--存入本地勾选缓存
function ForgingstarOBJ:setUserData()
    local userkey = SL:GetMetaValue("USER_ID")
    local datakey = userkey.."_"..self.__cname
    local datavar = self.isLuck

    SL:SetLocalString(datakey,datavar)
end

--获取本地勾选缓存
function ForgingstarOBJ:getUserData()
    local userkey = SL:GetMetaValue("USER_ID")
    local datakey = userkey.."_"..self.__cname
    local datavar = SL:GetLocalString(datakey)
    if datavar == "" then
        datavar = "0"
        SL:SetLocalString(datakey,datavar)
    end

    self.isLuck = tonumber(datavar)
end

-------------------------------↓↓↓ 游戏 事件 ↓↓↓---------------------------------------
--添加游戏事件
function ForgingstarOBJ:addGameEvent()
end

return ForgingstarOBJ