KuangBaoOBJ = {}

KuangBaoOBJ.__cname = "KuangBaoOBJ"

KuangBaoOBJ.cfg = ssrRequireCsvCfg("cfg_kuangbao") --读表

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function KuangBaoOBJ:main(objcfg)
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

    --关闭按钮
    GUI:addOnClickEvent(self.ui.btn_chuanshong, function()
        self:SJRequestZS()
    end)

    self:updateUI()
end

function KuangBaoOBJ:updateUI() 
    local parenttx = self.ui.p_texiao
    GUI:removeAllChildren(parenttx)
    local hanld1 = GUI:Effect_Create(parenttx, "qiulong", 150,150, 0, 5108, 0, 0, 0, 1)
    GUI:setScale(hanld1, 1)

    local parent = self.ui.p_fu_tx
    GUI:removeAllChildren(parent)

    local str = self.cfg[1].desce
    local richhanld = GUI:RichText_Create(parent, "p_xh_pos", 50, 285, str, ssrConstCfg.width)
    GUI:setAnchorPoint(richhanld, 0, 1)
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function KuangBaoOBJ:SJRequestZS()
    ssrMessage:sendmsg(ssrNetMsgCfg.KuangBao_RequestZS)
end

return KuangBaoOBJ
