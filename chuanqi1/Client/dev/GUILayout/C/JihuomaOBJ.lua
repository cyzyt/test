JihuomaOBJ = {}

JihuomaOBJ.__cname = "JihuomaOBJ"

JihuomaOBJ.cfg = ssrRequireCsvCfg("cfg_libao") --读表

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function JihuomaOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, objcfg.UI_PATH)

    self._parent = parent
    self.ui = GUI:ui_delegate(parent)

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

    GUI:addOnClickEvent(self.ui.Img_lq, function()
        self:JXopen()
    end)
 
    GUI:TextInput_addOnEvent(self.ui.Buy_txt1, function(_, eventType)
        if eventType == 0 then  --输入开始
            GUI:TextInput_setString(self.ui.Buy_txt2, "")
        elseif eventType == 1 then  --输入结束
            -- 不允许小数
            local num = GUI:Text_getString(self.ui.Buy_txt1) or ""
            GUI:TextInput_setString(self.ui.Buy_txt2, num)
            self.str = num
            if self.str == "" then
                GUI:TextInput_setString(self.ui.Buy_txt2, "输入激活码")
            end
            GUI:TextInput_setString(self.ui.Buy_txt1, "")
        elseif eventType == 2 then  --输入改变
            
        end
    end)
    GUI:setLocalZOrder(self.ui.Buy_txt1,-1)
    GUI:TextInput_setInputMode(self.ui.Buy_txt1, 0)

    self:updateUI()
end

function JihuomaOBJ:updateUI()
    local cfg = self.cfg

    local parent = self.ui.Pan_tx
    local hanld = GUI:Effect_Create(parent, "xqiulong", 45, -7, 0, 5110, 0, 0, 0, 1)
    GUI:setScale(hanld,1)

    local nparent = self.ui.p_item
    GUI:removeAllChildren(nparent)
    local tab = cfg[2]["items"]
    for i=1,#tab do
        local itemdata = {}
        itemdata.index = tab[i][1]
        itemdata.look  = true
        itemdata.bgVisible = true
        itemdata.count = tab[i][2]
        itemdata.color = 255
        local hand = GUI:ItemShow_Create(nparent, "item"..i, (70*i), 8, itemdata)
        GUI:setScale(hand, 0.8)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------

function JihuomaOBJ:JXopen()
    local str = self.str or ""
    self:RequestZS(str)
end

function JihuomaOBJ:RequestZS(str)
    local str_tb = {}
    str_tb[1]=str
    ssrMessage:sendmsg(ssrNetMsgCfg.Jihuoma_RequestZS,1,1,1,str_tb)
end

return JihuomaOBJ