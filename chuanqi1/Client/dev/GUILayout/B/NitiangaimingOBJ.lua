NitiangaimingOBJ = {}

NitiangaimingOBJ.__cname = "NitiangaimingOBJ"

NitiangaimingOBJ.page = 1

NitiangaimingOBJ.cfg = {}

NitiangaimingOBJ.LevelTab = {
    0,0,0,0,0,
    0,0,0,0,0
}

--读配置
local cfg_ntgm = ssrRequireCsvCfg("cfg_ntgm")
for k,v in ipairs(cfg_ntgm) do
    NitiangaimingOBJ.cfg[v.group] = NitiangaimingOBJ.cfg[v.group] or {}
    NitiangaimingOBJ.cfg[v.group][v.level] = NitiangaimingOBJ.cfg[v.group][v.level] or {}
    NitiangaimingOBJ.cfg[v.group][v.level] = {name=v.name,cost=v.cost,up=v.up,attribute=v.attribute}
end

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function NitiangaimingOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)
    GUI:LoadExport(parent, objcfg.UI_PATH,function ()
        self._parent = parent
        self.ui = GUI:ui_delegate(parent)
    
        --关闭按钮
        GUI:addOnClickEvent(self.ui.btn_close, function()
            GUI:Win_Close(self._parent)
        end)
    
    
        --关闭背景
        GUI:addOnClickEvent(self.ui.la_bg, function()
            GUI:Win_Close(self._parent)
        end)
    
    
        --提升按钮
        GUI:addOnClickEvent(self.ui.btn_up, function()
            self:RequestUp()
        end)
    
        for i,v in ipairs(self.LevelTab) do
            GUI:addOnClickEvent(self.ui["Button_"..i], function()
                self:updateSelect(i)
            end)
        end

        self:updateUI()
    end)
end

--更新选择神物信息
function NitiangaimingOBJ:updateSelect(page)
    self.page = page
    self:updateUI()
end

function NitiangaimingOBJ:updateUI()   --根据参数 进行界面调整   
    --刷新逆天改命等级
    local isfulllevel = self:isFullLevel(self.page)

    for i,v in ipairs(self.LevelTab) do
        local parent = self.ui["Button_" .. i]
        local pos = GUI:getPosition(parent)
        local coinName = "lv."..v
        local str = "<outline size='1'><font color='#4AE74A'>%s</font></outline>"
        str = string.format(str, coinName)
        local size = GUI:getContentSize(parent)

        GUI:removeAllChildren(parent)
        local handle = GUI:RichText_Create(parent, "nitian_txt1", size.width/2, size.height/2 - 46, str,100)
        GUI:setAnchorPoint(handle,0.5,0.5)
        
        if self.page == i then
            GUI:setPosition(self.ui["img_texiao"], pos.x + 0,pos.y + 0)
        end
    end

    --当前属性
    local lv = self.LevelTab[self.page]
    local cfg = self.cfg[self.page]

    ssrUpdateAttrShow(cfg, lv, "attribute", self.ui.nd_content, 3, "p_cur_attr_1_", "att_name_1_", "att_value_1_", 2)

    --下级属性
    if not isfulllevel then
        ssrUpdateAttrShow(cfg, lv + 1, "attribute", self.ui.nd_content, 3,"p_cur_attr_2_", "att_name_2_", "att_value_2_", 2)
    else
        for i = 1 ,3 do
            GUI:setVisible(self.ui["p_cur_attr_2_"..i], false)
        end
    end

    GUI:setVisible(self.ui["img_kuang_2"], not isfulllevel)

    --消耗
    cfg = self.cfg[self.page][lv + 1]
    if isfulllevel then
        cfg = self.cfg[self.page][lv]
    end

    for i = 1, 2 do
        local rtext_str = ""
        if isfulllevel then
            if i == 2 then
                rtext_str = ssrRTextCfg.get(20002, cfg.name)
            else
                local p_xh_pos = self.ui["need_item_"..i]
                GUI:removeAllChildren(p_xh_pos)
            end
        else
            --成功几率
            GUI:Text_setString(self.ui.pro_value_1, cfg.up/100 .."%")
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
        local size = GUI:getContentSize(p_xh_pos)
        local handle = GUI:RichText_Create(p_xh_pos, "nitian_txt2", size.width/2, size.height/2, rtext_str, ssrConstCfg.width)
        GUI:setAnchorPoint(handle, 0.5, 0.5)
    end
end

function NitiangaimingOBJ:isFullLevel(page)
    return self.LevelTab[page] == #self.cfg[page]
end

-------------------------------↓↓↓ 网络 消息 ↓↓↓---------------------------------------
--打开界面
function NitiangaimingOBJ:SyncResponse(arg1,arg2,arg3,data)
    self.LevelTab = data
end

function NitiangaimingOBJ:RequestUp()
    ssrMessage:sendmsg(ssrNetMsgCfg.Nitiangaiming_RequestUp,self.page)
end

function NitiangaimingOBJ:UpResponse(idx,lv)
    self.LevelTab[idx] = lv
    if not lv then return end
    self:updateUI()
end

function NitiangaimingOBJ:ZSResponse()
   self:updateUI()
end

return NitiangaimingOBJ