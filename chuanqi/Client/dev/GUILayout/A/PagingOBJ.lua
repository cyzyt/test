PagingObj = {}

PagingObj.__cname = "PagingObj"



function PagingObj:main(objcfg,data,subpage_layers,subpage_objcfg)
    self.OBJ_ORDER = objcfg.OBJ_ORDER
    self.OBJ_TITLE = objcfg.OBJ_TITLE
    self.module_objcfgs = {}
    self.module_rp = {}
    self.select_zorder      = 100       --被选择按钮Z轴
    self.OBJ_DESCRIBE = objcfg.OBJ_DESCRIBE
    for i,module_objcfg in ipairs(objcfg.OBJ_ORDER) do
        self.module_rp[module_objcfg] = false
        self.module_objcfgs[i] = module_objcfg
        self.module_objcfgs[module_objcfg] = i
    end

    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)
    GUI:LoadExport(parent, objcfg.UI_PATH,function ()
        self._parent = parent
        self.ui = GUI:ui_delegate(parent)
    
        --背景图关闭
        GUI:addOnClickEvent(self.ui.bg_close, function()
            GUI:Win_Close(self._parent)
        end)
    
        --关闭按钮背景板关闭
        GUI:addOnClickEvent(self.ui.btn_close, function()
            GUI:Win_Close(self._parent)
        end)
    
        --设置标题
        GUI:Text_setString(self.ui.tx_title, self.OBJ_TITLE[1])
    
        subpage_layers:main(subpage_objcfg,data,self.ui)

        --设置按钮选中状态
        self:switchBtn(subpage_objcfg)
    end)
end

--切换侧边栏按钮
function PagingObj:switchBtn(module_objcfg)
    if not GUI:GetWindow(nil,self.__cname) then return end
    self:updateBtn(module_objcfg, true)
end

--更新标题字
function PagingObj:updateTitle()
    if type(self.OBJ_TITLE) ~= "table" then return end
    local title = self.OBJ_TITLE[self.cur_open_obj_index]
    if title then GUI:Text_setString(self.ui.tx_title,title) end
end

--侧边栏按钮点击事件
function PagingObj:onSelect(btn,i)
    local objcfg = self.OBJ_ORDER[self.cur_open_obj_index]
    if self.cur_open_obj_index then
        --已打开则关闭子窗口
        GUI:removeAllChildren(self.ui.nd_module)
    end
    self.cur_open_obj_index = i
    objcfg = self.OBJ_ORDER[self.cur_open_obj_index]
    self:updateTitle()
    self:switchBtn(objcfg)
    ssrUIManager:OPEN(objcfg)
end

--更新侧边栏按钮
function PagingObj:updateBtn(def_module_objcfg, isswitch)
    if isswitch then self.cur_open_obj_index = nil end

    for i,module_objcfg in ipairs(self.module_objcfgs) do
        if module_objcfg then
            local describe = self.OBJ_DESCRIBE[i]

            local btn_name = "paging_"..i
            local btn = GUI:GetWindow(self.ui.ListView,btn_name)
            if not btn then
                btn = GUI:Clone(self.ui.btn_template)
                GUI:setName(btn,btn_name)

                local txt = GUI:getChildByName(btn,"Text")
                if txt then
                    GUI:Text_setString(txt, describe)
                else
                    GUI:Button_setTitleText(btn,describe)
                end

                GUI:setTag(btn, i)
                GUI:setVisible(GUI:GetWindow(btn,"img_red_point"),false)

                --添加到父节点
                GUI:addChild(self.ui.ListView,btn)

                --点击事件
                GUI:addOnClickEvent(btn, function()
                    self:onSelect(btn,i)
                end)
            end

            --默认选择按钮
            if not self.cur_open_obj_index then
                if def_module_objcfg then
                    if def_module_objcfg == module_objcfg then
                        self.cur_open_obj_index = i
                    end
                else
                    if i == 1 then
                        self.cur_open_obj_index = i
                    end
                end
            end
            self:setBtnSelectState(btn, self.cur_open_obj_index == i)
        end
    end
    -- self:updateRPshow()
end

--设置侧边栏按钮显示
function PagingObj:setBtnSelectState(btn, isselect)
    local txt = GUI:getChildByName(btn,"Text")
    if isselect then
        GUI:setLocalZOrder(btn,self.select_zorder)
        if txt then
            GUI:Text_setTextColor(txt, "#FFFFB7")
        else
            GUI:Button_setTitleColor(btn, "#FFFFB7")
        end
    else
        if txt then
            GUI:Text_setTextColor(txt, "#7B7373")
        else
            GUI:Button_setTitleColor(btn, "#7B7373")
        end

        GUI:setLocalZOrder(btn,GUI:getTag(btn))
    end
    GUI:Button_setBrightEx(btn, not isselect)
end

--设置红点显示状态
function PagingObj:setRPShow(module_objcfg, showstate)
    local index = self.module_objcfgs[module_objcfg]
    if not index then return end
    self.module_rp[module_objcfg] = showstate
 
    local isshow = false
    for _,_showstate in pairs(self.module_rp) do
        isshow = _showstate
        if isshow then break end
    end
    if self.ssrobjcfg.RP_EVENT then
        ssrGameEvent:push(self.ssrobjcfg.RP_EVENT, isshow)
    end

    if not self._layer then return end
    self._layer:updateRPshow()
end

return PagingObj