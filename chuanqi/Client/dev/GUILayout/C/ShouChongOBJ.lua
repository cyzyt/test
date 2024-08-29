ShouChongOBJ = {}

ShouChongOBJ.__cname = "ShouChongOBJ"

ShouChongOBJ.cfg = ssrRequireCsvCfg("cfg_shouchong") --读表

ShouChongOBJ.state = {
    nosatisfy = 0,      --未到时间/不可领取
    notreceive = 1,     --未领取
    received = 2,       --已领取
}

ShouChongOBJ.info = {0,0,0}

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShouChongOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)
    GUI:LoadExport(parent, objcfg.UI_PATH,function ()
        self._parent = parent
        self.ui = GUI:ui_delegate(parent)
        --背景图关闭
        GUI:addOnClickEvent(self.ui.bg_close, function()
            GUI:Win_Close(self._parent)
        end)

        --关闭按钮
        GUI:addOnClickEvent(self.ui.btn_close, function()
            GUI:Win_Close(self._parent)
        end)

        --前往充值按钮
        GUI:addOnClickEvent(self.ui.Button_1, function()
            SL:JumpTo(ssrConstCfg.StoreRecharge)
        end)

        --前往领取奖励
        GUI:addOnClickEvent(self.ui.Button_2, function()
            self:getGift()
        end)
        for i,cfg in ipairs(self.cfg) do
            GUI:addOnClickEvent(self.ui["btn_day_"..i], function()
                self:updatePageBtn(i)
            end)
        end

        self.page = nil

        --初始化页签
        self:updatePageBtn()
    end)
end

--更新页签1
function ShouChongOBJ:updatePageBtn(page)
    --这一次选择按钮
    if not page then
        for i, v in ipairs(self.info or {}) do
            if v == self.state.notreceive then
                page = i
                break
            end
        end
        page = page or 1
    end

    --上一次选择按钮
    if self.page then
        GUI:Button_setBrightEx(self.ui["btn_day_"..self.page], true)
    end

    if page == self.page then return end

    self.page = page

    GUI:Button_setBrightEx(self.ui["btn_day_"..self.page], false)

    self:updateUI()
end

--创建物品框
function ShouChongOBJ:createGiftsItem(parent,gifts)
    GUI:removeAllChildren(parent)
    for i,itemData in ipairs(gifts) do
        local setData  = {}
        setData.index = itemData[1]           -- 物品Index
        setData.count = itemData[2]           -- 物品数量
        setData.look  = true                  -- 是否显示tips
        setData.bgVisible = true              -- 是否显示背景框
        GUI:ItemShow_Create(parent, "item"..i, 0, 0, setData)
    end
end

--更新页面UI
function ShouChongOBJ:updateUI()
    local parent = self.ui.item_list

    self:createGiftsItem(parent, ShouChongOBJ.cfg[self.page].reward)

    --红点是否展示
    for i, v in ipairs(self.info) do
        GUI:setVisible(self.ui["redPonit_"..i],v == self.state.notreceive)
    end

    GUI:setVisible(self.ui.Button_1,self.info[self.page] == self.state.nosatisfy)
    GUI:setVisible(self.ui.Button_2,self.info[self.page] == self.state.notreceive)
    GUI:setVisible(self.ui.Button_3,self.info[self.page] == self.state.received)

    GUI:removeAllChildren(self.ui.texiao)
    GUI:Effect_Create(self.ui.texiao, "effect", 80, 130, 0, self.cfg[self.page].showId)
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步数据
function ShouChongOBJ:SyncResponse(arg1,arg2,arg3,data)
    self.info = data
    if not GUI:GetWindow(nil,self.__cname) then return end
    self:updateUI()
end

--首充礼包变量接收
function ShouChongOBJ:getGift()
    ssrMessage:sendmsg(ssrNetMsgCfg.ShouChong_LQRequestZS,self.page)
end

return ShouChongOBJ