SevenDaySigninOBJ = {}

SevenDaySigninOBJ.__cname = "SevenDaySigninOBJ"
SevenDaySigninOBJ.cfg = ssrRequireCsvCfg("cfg_qiandao")
SevenDaySigninOBJ._state = {
    no_receive      = 0,        --不可领取
    can_receive     = 1,        --可以领取
    has_receive     = 2,        --已领取
}

SevenDaySigninOBJ.page = 0
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function SevenDaySigninOBJ:main(objcfg,data,parent_ui)
    self.ui = parent_ui
    --将子页面加载进父页面nd_module容器中
    GUI:LoadExport(self.ui.nd_module, objcfg.UI_PATH)

    --居中
    local x = GUI:getPositionX(self.ui.nd_root)
    local y = GUI:getPositionY(self.ui.nd_root)
    GUI:setPosition(self.ui.Layer, -x, -y)

    self.btn_txt_color = {
        [true] = ssrConstCfg.C3B_YELLOW2,
        [false] = ssrConstCfg.C3B_GRAY1,
    }

    for i, v in ipairs(self.cfg) do
        local btnName = "btn_sgin_"..i

        GUI:addOnClickEvent(self.ui[btnName], function()
            if i == self.page then
                return
            end
            self:UpdateView(i)
        end)
        GUI:Win_SetParam(self.ui[btnName], i)

        GUI:addOnClickEvent(self.ui.btn_get, function()
            self:RequestCurReceiveGet(self.page)
        end)
        local img_icon = "img_icon_n_"..i
        local itemshow=GUI:ItemShow_Create(self.ui[img_icon], "item", -25, -25,{index=v.pet[1][1],count = v.pet[1][2]})
        if self.ui[img_icon] then
            SL:SetColorStyle(itemshow, ssrConstCfg.C3B_GRAY)
        end
        local btn_ylq = string.format("btn_sgin_%s_%s",i,i)
        local img_xz = string.format("img_xz_%s_%s",i,i)
        local img_ylq = "img_ylq_"..i
        if self.ui[btn_ylq] then
            GUI:setVisible(self.ui[btn_ylq],false)
        end
        if self.ui[img_xz] then
            GUI:setVisible(self.ui[img_xz],false)
        end
        if self.ui[img_ylq] then
            GUI:setVisible(self.ui[img_ylq],false)
        end
        local lxbtn_sgin_lx_t = "btn_sgin_lx_t_"..i
        if self.ui[lxbtn_sgin_lx_t] then
            GUI:setVisible(self.ui[lxbtn_sgin_lx_t],false)
        end
    end

    ssrListViewTemplate(self.ui.ls_pack)

    self:UpdateSignView()
end

function SevenDaySigninOBJ:UpdateSignView()
    if not self.ui then return end
    if self.sginData == nil then
        return
    end
    local img_url = string.format("res/custom/SevenDaySignin/img_desc/img_desc_%s.png", self.sginDay)
    GUI:Image_loadTexture(self.ui.img_des_di, "res/custom/SevenDaySignin/img_desc/img_desc_%s.png")
    for i = 2, self.sginDay do
        local lxbtn_sgin_lx_t = "btn_sgin_lx_t_"..i
        if self.ui[lxbtn_sgin_lx_t] then
            GUI:setVisible(self.ui[lxbtn_sgin_lx_t],true)
        end
    end
    local showIndex = self.sginDay
    for index, value in ipairs(self.sginData) do
        if value == self._state.has_receive then
        elseif value == self._state.can_receive then
            showIndex = index
        elseif value == self._state.no_receive then
        end
        self:RefreshSignBtn(index,value)
    end
    self:UpdateView(showIndex)
end
--刷新签到按钮
function SevenDaySigninOBJ:RefreshSignBtn(index,flag)
    local effect_name = "n_s_effect_"..index
    if self.ui[effect_name] then
        GUI:removeAllChildren(self.ui[effect_name])
    end
    local btn_sgin = "btn_sgin_"..index
    if flag == self._state.has_receive then
        local btn_ylq = string.format("btn_sgin_%s_%s",index,index)
        local img_ylq = "img_ylq_"..index
        if self.ui[img_ylq] then
            GUI:setVisible(self.ui[img_ylq],true)
        end
        if self.ui[btn_ylq] then
            GUI:setVisible(self.ui[btn_ylq],true)
        end
    elseif flag == self._state.can_receive then
        if self.ui[btn_sgin] then
            if self.ui[effect_name] then
                local sfx = GUI:Effect_Create(self.ui[effect_name], "sfx2",18, 55, 0, 22087)
                GUI:Effect_play(sfx, 0, 0, true)
            end
        end
    else
    end
end

function SevenDaySigninOBJ:createGiftsItem(parent,idxs,gifts)
    if idxs ~= 0 then
        gifts = SL:GetMetaValue("Box", idxs)
        if #gifts < 1 then
            gifts = SL:GetMetaValue("Box", 7)
        end
    end
    for i,itemData in ipairs(gifts) do
        local btn = GUI:Clone(self.ui.template)
        GUI:setVisible(btn,true)
        GUI:ListView_pushBackCustomItem(parent,btn)
        local item =GUI:ListView_getItemByIndex(parent,i - 1)
        GUI:setName(item,"item_" .. i)
        local idx = itemData[ssrConstCfg.box_idx]
        local count = itemData[ssrConstCfg.box_num]
        local itemshow =GUI:ItemShow_Create(item:getChildByName("itemBg"), "item", 0, 0,{index = idx, count = count, look = true})
        GUI:setScale(itemshow, 0.8)
    end
end

--添加特效
local function ssrPlaySFXAnim(parent, sfxid, x, y, name, speed,scale)
    x = x or 0
    y = y or 0
    scale = scale or 1
    name = name or "sfx_name"
    speed = speed or 1
    local sfx = GUI:Effect_Create(parent,name,x,y,0,sfxid)
    GUI:Effect_play(sfx,0,0,true,speed)
    return sfx
end
-------------------------------↓↓↓ 刷新界面 ↓↓↓-------------------------------
function SevenDaySigninOBJ:UpdateView(index)
    local last_page = self.page
    self.page = index
    local img_xz = string.format("img_xz_%s_%s",self.page,self.page)
    local img_xz_last = string.format("img_xz_%s_%s",last_page,last_page)
    if  self.ui[img_xz_last] then
        GUI:setVisible(self.ui[img_xz_last],false)
    end
    if self.ui[img_xz]  then
        self.ui[img_xz]:setVisible(true)
    end
    GUI:Image_loadTexture(self.ui.img_des_di, "res/custom/SevenDaySignin/img_desc/img_desc_%s.png")
    GUI:removeAllChildren(self.ui.ls_pack)

    self:createGiftsItem(self.ui.ls_pack, 0,self.cfg[index].pet)
    --设置layout的宽度,使控件始终居中展示
    local limit = #self.cfg[index].pet
    if limit > 6 then
        limit = 6
    end
    local w,h = limit * 60 ,75
    local layout = GUI:setContentSize(self.ui.ls_pack, w, h)
    --按钮显示
    local flag = self.rewardList[index]
    GUI:setVisible(self.ui.btn_get,true)
    self.ui.btn_get:setEnabled(true)
    GUI:removeAllChildren(self.ui.n_btn_effect)
    SL:SetColorStyle(self.ui.txt_tip_1, self.btn_txt_color[self._state.no_receive ~= flag])
    if flag == self._state.no_receive then
        GUI:Text_setString(self.ui.txt_tip_1, "不可领取")
        self.ui.btn_get:setEnabled(false)
    elseif flag == self._state.can_receive then
        GUI:Text_setString(self.ui.txt_tip_1, "领取奖励")
        local sfx= GUI:Effect_Create(self.ui.n_btn_effect,"effect_get",35,33,0,22029)
        GUI:setPosition(sfx,35,33)
        GUI:setName(sfx,"effect_get")
        GUI:Effect_play(sfx,0,0,true)
    elseif flag == self._state.has_receive then
        GUI:setVisible(self.ui.btn_get,false)
    end
    GUI:Text_setString(self.ui.txt_ch_tx,self.cfg[index].name)

    GUI:removeAllChildren(self.ui.node_eff)
    local x,y,scale = 90, -30,1
    ssrPlaySFXAnim(self.ui.node_eff, self.cfg[index].texiao, x,y, "sfx",1,scale)
end

function SevenDaySigninOBJ:setRPShow()  --设置红点显示
    ssrGameEvent:push(ssrEventCfg.SevenDaySignin, self.isRed, self.isShow)
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步信息
function SevenDaySigninOBJ:SyncResponse(arg1,arg2,arg3,data)
    self.sginData = data
    self.sginDay = arg1
    self.rewardList = data
    if arg1 < 0 then return end
    self.isRed = false
    self.isShow = false
    for _, v in ipairs(self.sginData) do
        if self._state.can_receive == v then
            self.isRed = true
        end
        if self._state.has_receive ~= v then
            self.isShow = true
        end
    end
    self:setRPShow()
    if not arg1 then return end
    self:UpdateSignView()
end

--请求领取奖励
function SevenDaySigninOBJ:RequestCurReceiveGet(idx)
    ssrMessage:sendmsg(ssrNetMsgCfg.SevenDaySignin_RequestCurReceiveGet,idx)
end

return SevenDaySigninOBJ