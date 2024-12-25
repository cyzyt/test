KapaiOBJ = {}

KapaiOBJ._cname = "KapaiOBJ"
KapaiOBJ.cfg_compound = ssrRequireCsvCfg("cfg_compound")
KapaiOBJ.cfg={}

KapaiOBJ.cfg_compound = ssrRequireCsvCfg("cfg_compound")
local Page_Tab = {}
for k,v in ipairs(KapaiOBJ.cfg_compound) do
    if v.name2 == "上古图腾" then
        local index = 0
        for i = 1, #Page_Tab do
            if Page_Tab[i] == v.page1 then
                index = i
                break
            end
        end
        if index == 0 then
            index = #Page_Tab + 1
            Page_Tab[index] = v.page1
        end
        KapaiOBJ.cfg[index] = KapaiOBJ.cfg[index] or {title = v.name2}
        KapaiOBJ.cfg[index][v.page2] = KapaiOBJ.cfg[index][v.page2] or {title = v.name}
        KapaiOBJ.cfg[index][v.page2][v.page3] = KapaiOBJ.cfg[index][v.page2][v.page3] or {title = v.name}
        KapaiOBJ.cfg[index][v.page2][v.page3] = {
            idx = k,type = v.type,page1 = v.page1,page2 = v.page2,page3 = v.page3,npcid = v.npcid,
            itemid1 = v.itemid1,product = v.product,name = v.name,probability = v.probability,type2 = v.type2,
        }
    end
end

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function KapaiOBJ:main(objcfg)
    local parent = GUI:Win_Create(self._cname, 0, 0, 0, 0, false, false, true, false)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.btn_close, function ()
        GUI:Win_Close(self._parent)
    end)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.la_bg, function ()
        GUI:Win_Close(self._parent)
    end)

    self:updateUI()

    return self
end

function KapaiOBJ:updateUI()
    local cfg = self.cfg
    local cfg = self.cfg[1]
    for i ,v in ipairs(cfg) do
        local layout = ssrSeekWidgetByName(self.ui.nd_content, "item_"..i)
        GUI:removeAllChildren(layout)
        local equippos = v[1].type2
        local equipdata = SL:GetMetaValue("EQUIP_DATA_BY_MAKEINDEX", equippos, true)
        if equipdata then
            local itemshow = GUI:ItemShow_Create(layout, "item_"..i, 0, 0, {index = equipdata.Index, look = true}):setScale(1.5):setOpacity(120)
            ssrAddChildCentrePos(layout, itemshow)
            local img = GUI:Image_Create(layout,"item_"..i,0,0,"res/custom/kapai/00"..equipdata.Looks..".png"):setScale(0.4)

            ssrAddChildCentrePos(layout, img)

            local page = self:SelectItemPage(equipdata.Index)
            img = GUI:Image_Create(layout,"item_"..i,13,70,"res/custom/baowu/"..page..".png"):setScale(0.6)
            GUI:setPosition(img,13,70)
            img = GUI:Image_Create(layout,"item_"..i,0,0,"res/custom/baowu/10.png"):setScale(0.6)
            GUI:setPosition(img,15,55)
        end
    end
end

function KapaiOBJ:SelectItemPage(index)
    local page = 0
    for k,v in ipairs(KapaiOBJ.cfg_compound) do
        if index == v.product[1][1] then
            page = v.page3
            break
        end
    end
    return page
end
-------------------------------↓↓↓ 网络 消息 ↓↓↓---------------------------------------
--打开界面
function KapaiOBJ:OpenUI()
    self:OpenLayer()
end

--添加游戏事件
function KapaiOBJ:addGameEvent()
end

return KapaiOBJ