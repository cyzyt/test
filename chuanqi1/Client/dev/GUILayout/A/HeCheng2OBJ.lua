local HeCheng2OBJ = {}

HeCheng2OBJ.Name = "HeCheng2OBJ"


local config = ssrRequireCsvCfg("cfg_hecheng.lua")

HeCheng2OBJ.UI_PATH = {
    "compound_item_layer/compoud_list_btn1",
    "compound_item_layer/compoud_list_btn2",
    "compound_item_layer/compoud_list_btn3",
}

HeCheng2OBJ.cfg = {}
for k,v  in ipairs(config or {}) do
    HeCheng2OBJ.cfg[v.page1] = HeCheng2OBJ.cfg[v.page1] or {name = v.page1name}
    HeCheng2OBJ.cfg[v.page1][v.page2] = HeCheng2OBJ.cfg[v.page1][v.page2] or {name = v.page2name}

    local itemName = v.page3name
    if not itemName then
        itemName = SL:GetMetaValue("ITEM_NAME", v.product[1][1])
    end
    HeCheng2OBJ.cfg[v.page1][v.page2][v.page3] = HeCheng2OBJ.cfg[v.page1][v.page2] or {name = itemName}
end

function HeCheng2OBJ:main(page1,page2,page3)
    self.page1,self.page2,self.page3 = page1 or 1,page2 or 1,page3 or 1

    self.parent = GUI:Win_Create(self.Name, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(self.parent, "compound_item_layer/compound_items_layer")

    self.ui = GUI:ui_delegate(self.parent)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.Button_close, function()
        GUI:Win_Close(self.parent)
    end)

    for i, v in ipairs(self.cfg) do
        GUI:LoadExport(self.ui.ListView_list1, "compound_item_layer/compoud_list_btn1")
        local handle = GUI:GetWindow(self.ui.ListView_list1,"Panel_1")
        GUI:setName(handle,"btn_1_"..i)
        local btn_1 = GUI:ui_delegate(handle)
        GUI:Button_setTitleText(btn_1.Button_type, v.name)

        GUI:addOnClickEvent(self.ui.Button_close, function()
            self:PageTo(1,i)
        end)
    end

end


function HeCheng2OBJ:PageTo(_type,page)

end

SL:RegisterLUAEvent(LUA_EVENT_TALKTONPC, HeCheng2OBJ.Name, function (data)
    -- HeCheng2OBJ:main()
end)

return HeCheng2OBJ