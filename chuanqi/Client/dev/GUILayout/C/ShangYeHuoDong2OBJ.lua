ShangYeHuoDong2OBJ = {}

ShangYeHuoDong2OBJ.__cname = "ShangYeHuoDong2OBJ"

ShangYeHuoDong2OBJ.cfg_store = ssrRequireCsvCfg("cfg_mystery_store") --读表
ShangYeHuoDong2OBJ.cfg_activity = ssrRequireCsvCfg("cfg_activity")[3] --读表

ShangYeHuoDong2OBJ.tab = {}

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShangYeHuoDong2OBJ:main(objcfg,data,parent_ui)
    self.ui = parent_ui
    --将子页面加载进父页面nd_module容器中
    GUI:LoadExport(self.ui.nd_module, objcfg.UI_PATH)

    --居中
    --local x, y = self.ui.nd_root:getPosition()
    local x=GUI:getPositionX(self.ui.nd_root)
    local y=GUI:getPositionY(self.ui.nd_root)
    --self.ui.Layer:setPosition(-x, -y)
    GUI:setPosition(self.ui.Layer,-x, -y)

    self.remarks = self.cfg_activity.remarks[1]

    for i=1,3 do
        --客户端按钮挂载事件
        GUI:addOnClickEvent(self.ui["btn_zs"..i], function()
            self:RequestZS(i)  --传递参数 方便判断第几个按钮
        end)
    end
    self:updateUI()
end


--设置红点显示
function ShangYeHuoDong2OBJ:setRPShow()
    local isshow = false
    local isshowbtn = true
    for i, val in ipairs(self.tab or {}) do
        if val < 1 then
            isshow =true
            break
        end
    end
    ssrGameEvent:push(ssrEventCfg.ShangYeHuoDong2, isshow, isshowbtn)
end

function ShangYeHuoDong2OBJ:updateUI()   --根据参数 进行界面调整
    local data = self.tab
    local store = self.cfg_store

    local _cfg = self.remarks
    for i, val in ipairs(_cfg or {}) do
        local x,y = 50 + 27, 115
        local parent = self.ui["bg_kuang"..i]
        GUI:removeAllChildren(parent)

        local cfg = store[val]
        for j, item in ipairs(cfg and cfg.itemId or {}) do
            local itemdata = {}
            itemdata.index = item[1]
            itemdata.count = item[2]
            itemdata.look  = true
            itemdata.bgVisible = true
            itemdata.color = 255
            local hanld = GUI:ItemShow_Create(parent, "item_"..i.."_"..j, x,y, itemdata)
            
            if j == 1 then
                GUI:setScale(hanld, 1)
                x = 50
                y = y - 75
            else
                GUI:setScale(hanld, 0.6)
                x = x + 42
            end
        end

        ---充值文字展示
        local hanldbtxtn = self.ui["tx_btn_text"..i]
        local hanld = self.ui["tx_chongzhi"..i]
        local hanldbtn = self.ui["btn_zs"..i]
        local hanldimgsk = self.ui["img_shoukong"..i]

        if data[i] >= 1 then
            GUI:setVisible(hanldimgsk, true)
            GUI:setVisible(hanldbtn, false)
            GUI:Text_setString(hanld,"0/1")
        else
            GUI:setVisible(hanldimgsk, false)
            GUI:setVisible(hanldbtn, true)
            local itemname = SL:GetMetaValue("ITEM_NAME", cfg.price[1][1])
            GUI:Text_setString(hanldbtxtn,cfg.price[1][2]..itemname)
            GUI:Text_setString(hanld,"1/1")
        end
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步数据
function ShangYeHuoDong2OBJ:SyncResponse(db_idx,_,_,tab)
    self.remarks = self.cfg_activity.remarks[db_idx] or self.cfg_activity.remarks[1]
    self.tab = tab
    self:setRPShow()
end

--向服务端发起按钮点击事件
function ShangYeHuoDong2OBJ:RequestZS(param)
    ssrMessage:sendmsg(ssrNetMsgCfg.ShangYeHuoDong2_RequestZS,param)
end

--服务端响应点击事件
function ShangYeHuoDong2OBJ:ZSResponse(db_idx,_,_,tab)
    self.remarks = self.cfg_activity.remarks[db_idx] or self.cfg_activity.remarks[1]
    self.tab = tab
    self:setRPShow()
    if not self.db_idx then return end
    self.db_idx:updateUI()    --对ui文件进行交互
end
-------------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------

return ShangYeHuoDong2OBJ