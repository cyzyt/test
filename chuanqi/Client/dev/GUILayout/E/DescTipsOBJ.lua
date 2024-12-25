DescTipsOBJ = {}

DescTipsOBJ.__cname = "DescTipsOBJ"

DescTipsOBJ.cfg = ssrRequireCsvCfg("cfg_Desc")


-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function DescTipsOBJ:main(objcfg, data)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, objcfg.UI_PATH)

    self._parent = parent
    self.ui = GUI:ui_delegate(parent)

    if not self.cfg[data.id] then 
        ssrUIManager:CLOSE(ssrObjCfg.DescTips)
        return
    end

    --关闭背景
    GUI:setSwallowTouches(self.ui.la_bg, false)
    GUI:addOnClickEvent(self.ui.la_bg, function()
        GUI:Win_Close(self._parent)
    end)

    local desc
    if data.id then
        desc = self.cfg[data.id].desc or ""
    else
        desc = data.text
    end
    local richText = GUI:RichText_Create(self.ui.img_tips_di, "richText", 0, 0, desc, ssrConstCfg.width)

    richText:formatText()

    local richSize = GUI:getContentSize(richText)
    local layoutSize = cc.size(richSize.width + 10, richSize.height+10)
    GUI:setContentSize(self.ui.img_tips_di,layoutSize)

    GUI:setPosition(richText, 10, 5)

    if data.dir then
        local x = data.pos.x + data.dir.offset.x
        local y = data.pos.y + data.dir.offset.y
        GUI:setAnchorPoint(self.ui.img_tips_di,data.dir.anchor[1],data.dir.anchor[2])
        GUI:setPosition(self.ui.img_tips_di,x, y)
    else
        GUI:setPosition(self.ui.img_tips_di,data.pos.x-5, data.pos.y-5)
    end
end



return DescTipsOBJ