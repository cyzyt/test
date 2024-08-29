ShangYeHuoDong5OBJ = {}

ShangYeHuoDong5OBJ.__cname = "ShangYeHuoDong5OBJ"

ShangYeHuoDong5OBJ.cfg_shoubao = ssrRequireCsvCfg("cfg_shoubao")

ShangYeHuoDong5OBJ.cfgactivity = ssrRequireCsvCfg("cfg_activity") --读表

ShangYeHuoDong5OBJ.cfg = SL:CopyData(ShangYeHuoDong5OBJ.cfg_shoubao)
ShangYeHuoDong5OBJ.cfg_get_info = nil

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShangYeHuoDong5OBJ:main(objcfg,data,parent_ui)
    self.ui = parent_ui
    --将子页面加载进父页面nd_module容器中
    GUI:LoadExport(self.ui.nd_module, objcfg.UI_PATH)

    --居中
    local pos = GUI:getPosition(self.ui.nd_root)
    GUI:setPosition(self.ui.Layer,-pos.x, -pos.y)

    self:selectCfg()
    self:updateUI()

    GUI:setVisible(self.ui.template, false)
end

--数据排序
function ShangYeHuoDong5OBJ:selectCfg(idx)
    if self.cfg_get_info then

        self.cfg = SL:CopyData(self.cfg_shoubao)

        local bool = true

        local temp_top = {}
        local temp_down = {}
        for k = #self.cfg, 1, -1 do
            bool = true
            local v = self.cfg[k]
            local _v = SL:CopyData(v)

            --服务端通知该idx已领完
            if idx and v.item == idx then
                self.cfg_get_info[v.item][3] = v.num
            end

            if v.num - self.cfg_get_info[v.item][3] <= 0 and bool then
                table.remove(self.cfg,k)
                table.insert(temp_down,_v)
                bool = false
            end

            if self.cfg_get_info[v.item][2] == 1 and bool then
                table.remove(self.cfg,k)
                table.insert(temp_top,_v)
                bool = false
            elseif self.cfg_get_info[v.item][2] == 2 and bool then
                table.remove(self.cfg,k)
                table.insert(temp_down,_v)
                bool = false
            end
        end
        for _, var in ipairs(temp_top) do
            table.insert(self.cfg,1,var)
        end
        for _, var in ipairs(temp_down) do
            table.insert(self.cfg,var)
        end
    end
end

function ShangYeHuoDong5OBJ:setRPShow()  --设置红点显示
    -- if self.isOpen ~= 0 then return end --活动已关闭
    -- ssrGameEvent:push(ssrEventCfg.ShangYeHuoDong5, self.isshowRd or false, true)
end

local function setTab(tab)
    local info = {}
    for _, v in ipairs(tab) do
        info[v[1]] = v
    end
    return info
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步数据
function ShangYeHuoDong5OBJ:SyncResponse(arg1,arg2,arg3,tab)
    self.isOpen = arg1
    self.cfg_get_info = setTab(tab)
    -- if self.isOpen ~= 0 then return end --活动已关闭
    self.isshowRd = arg2 == 1 and true or false
    self:setRPShow()
    self:selectCfg()
end

--请求领取
function ShangYeHuoDong5OBJ:RequestReceive(id)
    ssrMessage:sendmsg(ssrNetMsgCfg.ShangYeHuoDong5_RequestReceive,id)
end

--响应领取
function ShangYeHuoDong5OBJ:RecoveryResponse(arg1,arg2,arg3,tab)
    self.cfg_get_info[tab[1]][2] = tab[2]
    self.cfg_get_info[tab[1]][3] = tab[3]
    self.isshowRd = arg1 == 1 and true or false
    self:setRPShow()
    self:selectCfg()
    if not arg1 then return end
    self:updateUI()
end

--首爆领取
function ShangYeHuoDong5OBJ:SyncItemFirst(arg1,arg2)
    if self.cfg_get_info and self.cfg_get_info[arg1] then
        self.cfg_get_info[arg1][2] = 1
    end
    self.isshowRd = true
    self:selectCfg()
    self:setRPShow()
    if not arg1 then return end
    self:updateUI()
end

--同步某个物品全服已回收数量已达到最大值
function ShangYeHuoDong5OBJ:SyncMaxRecovery(arg1,arg2)
    if self.cfg_get_info and self.cfg_get_info[arg1] then
        self.cfg_get_info[arg1][2] = 0
        self.cfg_get_info[arg1][3] = arg2
    end
    self.isshowRd = arg2 == 1 and true or false
    self:selectCfg(arg1)
    self:setRPShow()
    if not arg1 then return end
    self:updateUI()
end

function ShangYeHuoDong5OBJ:updateUI()
    GUI:removeAllChildren(self.ui.View_huadong)
    for i = 1, #self.cfg do
        GUI:QuickCell_Create(self.ui.View_huadong, "cell_"..i, i * 1, i * -5, 580, 60,  function(quickParent)
            local item = GUI:Clone(self.ui.template)
            GUI:setVisible(item, true)
            GUI:addChild(quickParent, item)
            local item_ui = GUI:ui_delegate(item)
            local cfg = self.cfg[i]
            if cfg then
                local itemidx,nums = cfg.gift[1][1],cfg.gift[1][2]
                local itemname = SL:GetMetaValue("ITEM_NAME", itemidx)
                ssrLabelString(item, "tx_yb", nums..itemname)
                ssrLabelString(item, "tx_sy", cfg.num)
                local item_hand = item_ui.P_item
                if item_hand then
                    GUI:Image_Create(item_hand, "item_bg", -40, -33, "res/custom/common/img_cell_1.png")
                    GUI:ItemShow_Create(item_hand, "item", -40, -33, {index = cfg.item,count = 0,look = true,itemScale = 0.5})
                    GUI:setTag(item_ui.btn_zs, cfg.item)
                    GUI:addOnClickEvent(item_ui.btn_zs, function (btn)
                        local _itemidx = GUI:getTag(btn)
                        ssrPrint("_itemidx",_itemidx)
                        self:RequestReceive(_itemidx)
                    end)
                end
            end
            local info = self.cfg_get_info and self.cfg_get_info[cfg.item]
            if info then
                GUI:Text_setString(item_ui.tx_sy, (cfg.num - info[3]) > 0 and (cfg.num - info[3]) or 0)
                GUI:setVisible(item_ui.img_get,info[2] == 2)
                GUI:setVisible(item_ui.img_notreached,info[2] == 0)
                GUI:setVisible(item_ui.btn_zs,info[2] == 1)
                if info[2] == 1 then
                    GUI:Text_setTextColor(item_ui.btn_zs,ssrConstCfg.C3B_YELLOW2)
                    GUI:Text_setString(item_ui.btn_zs, [[可 领 取]])
                end
            end
            return item
        end)
    end
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------

return ShangYeHuoDong5OBJ