VIPOBJ = {}

VIPOBJ.__cname = "VIPOBJ"
VIPOBJ.cfgvip = ssrRequireCsvCfg("cfg_vip") --读npc跳转表
VIPOBJ.att_tab = ssrRequireGameCfg("cfg_att_score")
VIPOBJ.zhanshi = ssrRequireCsvCfg("cfg_zhanshi")

VIPOBJ.cfg = {}

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function VIPOBJ:main(objcfg)

    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, objcfg.UI_PATH)

    self._parent = parent
    self.ui = GUI:ui_delegate(parent)

    --防点击穿透
    GUI:addOnClickEvent(self.ui.img_bg, function()

    end)

    --关闭背景
    GUI:addOnClickEvent(self.ui.bg_close, function()
        GUI:Win_Close(self._parent)
    end)
    
    --关闭按钮
    GUI:addOnClickEvent(self.ui.btn_close, function()
        GUI:Win_Close(self._parent)
    end)

    --充值按钮
    GUI:addOnClickEvent(self.ui.btn_chongzhi, function()
        GUI:Win_Close(self._parent)
        ssrUIManager:OPEN(ssrConstCfg.StoreRecharge)
    end)

    for i=1,4 do
        GUI:addOnClickEvent(self.ui["btn_vip_level"..i], function ()
            self:SXResponse(i)
        end)
    end

    --激活按钮
    GUI:addOnClickEvent(self.ui.btn_mai, function()
        self:RequestZS()
    end)

    self:updateUI()
    self:SXResponse()
end

function VIPOBJ:updateUI()
    local cfgvip = self.cfgvip
    for i=1,#cfgvip do
        local hanld = self.ui["tx_btn_level"..i]
        GUI:Text_setString(hanld,cfgvip[i]["Txt"])
    end
end

local handle
function VIPOBJ:PshuaxingUI(param)
    self.btn = param
    local cfgvip = self.cfgvip
    local zhanshi = self.zhanshi
    local level = self.dqviplevel
    for i=1,#cfgvip do
        if i == param then
            local hanld = self.ui["btn_vip_level"..i]
            GUI:Button_setBright(hanld, false)
        else
            local hanld = self.ui["btn_vip_level"..i]
            GUI:Button_setBright(hanld, true)
        end
    end

    local tx_main = self.ui.tx_btn_mai
    if level >= param then
        GUI:Text_setString(tx_main,"已 激 活")
        GUI:Text_setTextColor(tx_main, "#C0C0C0")
    else
        GUI:Text_setString(tx_main,"激    活")
        GUI:Text_setTextColor(tx_main, "#FFFFFF")
    end

    local dqhuobi = SL:GetMetaValue("MONEY", 7)

    local parent = self.ui.p_fu_tx
    GUI:removeAllChildren(parent)

    handle = self.ui.tx_xvyao_lf
    GUI:Text_setString(handle,cfgvip[param]["NeedExp"].."灵符")

    handle = self.ui.tx_bftiao
    GUI:Text_setString(handle,dqhuobi.."/"..(cfgvip[param]["NeedExp"]))

    local bf = dqhuobi/(cfgvip[param]["NeedExp"])
    handle = self.ui.LoadingBar 
    GUI:LoadingBar_setPercent(handle, bf*100)

    local chhanld = self.ui.tx_goumai 
    GUI:removeAllChildren(chhanld)
    GUI:Effect_Create(chhanld, "chenghao", 150, 0, 0, zhanshi[cfgvip[param]["modelinfo"]]["id"], 0, 0, 0, 1)

    if param >= 1 then
        handle = self.ui.tx_vip_jiesuo2
        GUI:Text_setString(handle,"解锁：拾取使用")

        GUI:Text_setTextColor(handle, "#FFFF00")
    else
        handle = self.ui.tx_vip_jiesuo2
        GUI:Text_setString(handle,"锁定：拾取使用")

        GUI:Text_setTextColor(handle, "#D6C6AD")
    end

    if param >= 2 then
        handle = self.ui.tx_vip_jiesuo3
        GUI:Text_setString(handle,"解锁：自动回收")

        GUI:Text_setTextColor(handle, "#FFFF00")
    else
        handle = self.ui.tx_vip_jiesuo3
        GUI:Text_setString(handle,"锁定：自动回收")

        GUI:Text_setTextColor(handle, "#D6C6AD")
    end

    if param >= 3 then
        handle = self.ui.tx_vip_jiesuo4
        GUI:Text_setString(handle,"解锁：一键拾取")

        GUI:Text_setTextColor(handle, "#FFFF00")
    else
        handle = self.ui.tx_vip_jiesuo4
        GUI:Text_setString(handle,"锁定：一键拾取")

        GUI:Text_setTextColor(handle, "#D6C6AD")
    end

    local bfhao = ""
    local vaul = 0

    local shuxing_tab = cfgvip[param]["shuxing"]
    local att = self.att_tab

    for i = 1,#shuxing_tab do
        handle = self.ui["tx_vip_sx"..i]
        GUI:setVisible(handle, true)
        if #shuxing_tab <= 3 then
            GUI:setPositionX(handle, 120)

            GUI:setVisible(self.ui["tx_vip_sx"..(i+3)], false)

            GUI:setVisible(self.ui["tx_vip_sx8"], true)
            GUI:setPositionX(self.ui["tx_vip_sx8"], 120)
            GUI:setVisible(self.ui["tx_vip_sx7"], false)
        else
            if i<=3 then
                GUI:setPositionX(handle, 74.77)
                GUI:setVisible(self.ui["tx_vip_sx8"], true)
                GUI:setPositionX(self.ui["tx_vip_sx8"], 74.77)
            end
            if #shuxing_tab >= 7 then
                GUI:setVisible(self.ui["tx_vip_sx7"], true)
                GUI:setVisible(self.ui["tx_vip_sx6"], true)
            else
                GUI:setVisible(self.ui["tx_vip_sx7"], false)
                GUI:setVisible(self.ui["tx_vip_sx6"], false)
            end
        end

        local attr_idx = shuxing_tab[i][1]
        local attr_name = self.att_tab[attr_idx] and self.att_tab[attr_idx].name or "IDX-"..attr_idx
        GUI:Text_setString(handle,attr_name.." + ")
        vaul = shuxing_tab[i][2]

        if i >= 3 then
            bfhao = "%"
            if i == 3 then
                vaul = vaul*0.01
            end
        end
		if i == 4 then
            vaul = vaul*0.01
        end

        if i == 6 then
            vaul = vaul*0.01
        end

        GUI:Text_setString(self.ui["tx_vip_vaul"..i],vaul..bfhao)
    end

    GUI:Text_setString(self.ui["tx_vip_vaul8"],(cfgvip[param]["Recovery"]*0.01).."%")

    local item_tab = cfgvip[param]["Gift"]
    for i=1,#item_tab do
        local data = {}
        data.index = item_tab[i][1]
        data.look  = true
        data.bgVisible = true
        data.count = item_tab[i][2]
        data.color = 255
        local itemhanld = GUI:ItemShow_Create(parent, "item_"..i, (70*i) - 25, 55, data)
        GUI:setScale(itemhanld, 0.8)
    end

end

function VIPOBJ:setlevel(int)
    self.dqviplevel = tonumber(int)
    ssrGameEvent:push(ssrEventCfg.GoVIPLevel, int)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------

function VIPOBJ:SXResponse(param) --刷新页面  param=刷新 几号页面
    param = param or 1
    self:PshuaxingUI(param)
end

function VIPOBJ:RequestZS()   --转生按钮进入
    ssrMessage:sendmsg(ssrNetMsgCfg.VIP_RequestZS,self.btn)
end

function VIPOBJ:SyncResponse(int) --登录时
    self:setlevel(int)
end

function VIPOBJ:ZSResponse(param,int)  --param=刷新几号页面
    self:setlevel(int)
    if not self.param then return end
    self:SXResponse(param)
end

return VIPOBJ