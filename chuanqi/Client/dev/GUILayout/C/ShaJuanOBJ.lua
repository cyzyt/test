ShaJuanOBJ={}

ShaJuanOBJ.__cname="ShaJuanOBJ"

ShaJuanOBJ.cfgsj = ssrRequireCsvCfg("cfg_sj") --读npc跳转表
ShaJuanOBJ.att_score = ssrRequireGameCfg("cfg_att_score")
ShaJuanOBJ.att_tab = {}
ShaJuanOBJ.myjc = 0
ShaJuanOBJ.dqjc = 0

function ShaJuanOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)

    GUI:addOnClickEvent(self.ui.img_bg, function()
        --ssrPrint("我是防点击穿透")
    end)

    --关闭背景
    GUI:addOnClickEvent(self.ui.bg_close, function()
        GUI:Win_Close(self._parent)
    end)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.btn_close, function()
        GUI:Win_Close(self._parent)
    end)

    for i ,cfg in ipairs(self.cfgsj or {}) do
        if self.ui["btn_tip"..i] then
            GUI:addOnClickEvent(self.ui["btn_tip"..i], function(Imagehanld)
                local posM = GUI:getWorldPosition(self.ui["btn_tip"..i])
                local data = {width = 1136, str = cfg_Desc[cfg.txt].desc, worldPos = {x = posM.x, y = posM.y}, anchorPoint = {x = 0, y = 1},formatWay = 1}
                SL:OpenCommonDescTipsPop(data)
            end)
        end

    end

    GUI:addOnClickEvent(self.ui.btn_mai, function()
        local data = {}
        data.str = "请输入要捐献的金额"
        data.btnType = 2
        data.showEdit = true
        data.callback = function(atype, param)
            if atype == 1 then
                local num = tonumber(param.editStr) or 0
                if num > 0 then
                    ShaJuanOBJ:RequestZS(num)
                end
            end
        end
        SL:OpenCommonTipsPop(data)
    end)
    self:updateUI()
end

function ShaJuanOBJ:setjuanxian(param,param2,tab)
    self.att_tab = tab
    self.myjc = param
    self.dqjc = param2
end

function ShaJuanOBJ:setNum(sender)
    local num=GUI:Text_getString(self.ui.Buy_txt2)+GUI:Win_GetParam(sender)
    if num < 1 then
        num = 1
    end
    if num > 9999 then
        num = 9999
    end
    GUI:Text_setString(self.ui.Buy_txt2, num)
    self.buyNum = num
end

function ShaJuanOBJ:updateUI()
    local att = self.att_score
    local cfgsj = self.cfgsj
    local pm_tab = self.att_tab
    local myjc = self.myjc
    local dqjc = self.dqjc

    for i=1,#pm_tab do
        if i <= 5 then
            if pm_tab[i][2] ~= 0 then
                local hanld = self.ui["tx_pmsx"..i]
                GUI:setVisible(hanld, true)
                local namehanld = self.ui["tx_pmname"..i]
                GUI:Text_setString(namehanld,pm_tab[i][1])
                local numhanld = self.ui["tx_pmnum"..i]
                GUI:Text_setString(numhanld,pm_tab[i][2])
            end
        end
    end
    local myhanld = self.ui["tx_myjcnum"]
    GUI:Text_setString(myhanld,myjc)
    local dqhanld = self.ui["tx_dqjcnum"]
    GUI:Text_setString(dqhanld,dqjc)

    local idx,num = cfgsj[1]["qian"][1][1], cfgsj[1]["qian"][1][2]
    local itemname = SL:GetMetaValue("ITEM_NAME", idx)

    local dqhanld = self.ui["tx_xvyao_lf"]
    GUI:Text_setString(dqhanld,num..itemname)
    local bf = ""
    local bfnum = 1
    local fh = "+"
    for i=1,3 do
        local dqhanld = self.ui["tx_ewainame"..i]
        GUI:Text_setString(dqhanld,att[cfgsj[1]["shuxing"][i][1]]["name"])
        local dqhanld = self.ui["tx_ewainuml"..i]
        if i == 1 then
            bf = "%"
            bfnum = 0.01
            fh = "+"
        end
        if i == 2 then
            bf = ""
            bfnum = 1
            fh = "+"
        end
        if i == 3 then
            bf = "%"
            bfnum = 1
            fh = "-"
        end
        GUI:Text_setString(dqhanld,fh..(cfgsj[1]["shuxing"][i][2]*bfnum)..bf)
    end
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ShaJuanOBJ:SXResponse()
    self:updateUI()
end
-------------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------
function ShaJuanOBJ:SyncResponse(param,param2,param3,tab)
    self:setjuanxian(param,param2,tab)
end

function ShaJuanOBJ:RequestZS(Num)  
    ssrMessage:sendmsg(ssrNetMsgCfg.ShaJuan_RequestZS,Num)
end

function ShaJuanOBJ:ZSResponse(param,param2,param3,tab)
    self:setjuanxian(param,param2,tab)
    if not param then return end
    self:SXResponse()
end

return ShaJuanOBJ
