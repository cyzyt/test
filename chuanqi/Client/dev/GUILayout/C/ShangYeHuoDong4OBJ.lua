ShangYeHuoDong4OBJ = {}

ShangYeHuoDong4OBJ.__cname = "ShangYeHuoDong4OBJ"

ShangYeHuoDong4OBJ.cfg_gift = ssrRequireCsvCfg("cfg_hanghuijingji") --读表

ShangYeHuoDong4OBJ.cfg_data = {}


-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShangYeHuoDong4OBJ:main(objcfg,data,parent_ui)
    self.ui = parent_ui
    --将子页面加载进父页面nd_module容器中
    GUI:LoadExport(self.ui.nd_module, objcfg.UI_PATH)

    --居中
    local pos = GUI:getPosition(self.ui.nd_root)
    GUI:setPosition(self.ui.Layer,-pos.x, -pos.y)

    for i = 1, 6 do
        GUI:addOnClickEvent(self.ui["btn_zs"..i], function()
            self:RequestZS(i)
        end)
    end

    --请求服务端消息,拿到数据之后更新界面  
    self:HangHuiGengXing()
    self:updateUI()
end

function ShangYeHuoDong4OBJ:updateUI()
    local cfg_data = self.cfg_data
    local role_num = self.role_num

    local itemdata = {}
    itemdata.look  = true
    itemdata.bgVisible = true
    itemdata.color = 255

    for i, v in ipairs(self.cfg_gift) do
        if i > 6 then return end

        local parent = self.ui["P_biaoji"..i]
        GUI:removeAllChildren(parent)

        local x,y = 15,5
        --行会成员奖励

        for j, item in ipairs(v.reward) do
            itemdata.index = item[1]
            itemdata.count = item[2]
            local hanld = GUI:ItemShow_Create(parent, "item_role_"..i.."_"..j, x,y, itemdata)
            GUI:setScale(hanld, 0.75)

            x = x + 60
        end

        x = 240

        --行会会长奖励
        for j, item in ipairs(self.cfg_gift[i + 6] and self.cfg_gift[i + 6].reward or {}) do
            itemdata.index = item[1]
            itemdata.count = item[2]
            local hanld = GUI:ItemShow_Create(parent, "item_hz_"..i.."_"..j, x,y, itemdata)
            GUI:setScale(hanld, 0.75)

            x = x + 60
        end

        local hanldbtn = self.ui["tx_btn_text"..i]
        local hanldhd = self.ui["img_hongdian"..i]


        if cfg_data[i] >= 1 then     --按钮变量
            GUI:setVisible(hanldhd, false)
            GUI:Text_setString(hanldbtn,"已 领 取")
            GUI:Text_setTextColor(hanldbtn, "#ffff00")
        else
            GUI:setVisible(hanldhd, true)
            GUI:Text_setString(hanldbtn,"可 领 取")
            GUI:Text_setTextColor(hanldbtn, "#00ff00")
        end

        local hanld = self.ui["tx_chongzhi"..i]
        if role_num >= v.goal then
            GUI:Text_setString(hanld,"("..v.goal.."/"..v.goal..")")
        else
            GUI:setVisible(hanldhd, false)
            GUI:Text_setString(hanldbtn,"未 达 成")
            GUI:Text_setString(hanld,"("..role_num.."/"..v.goal..")")
            GUI:Text_setTextColor(hanldbtn, "#C0C0C0")
        end
    end
end

function ShangYeHuoDong4OBJ:setRPShow()  --设置红点显示
    local isshowred = false
    local isshowbtn = true

    for i, v in ipairs(self.cfg_gift) do
        if self.role_num > v.goal then
            if self.cfg_data[i] == 0 then
                isshowred = true
                break
            end
        end
    end

    -- ssrGameEvent:push(ssrEventCfg.ShangYeHuoDong4, isshowred, isshowbtn)
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步数据
function ShangYeHuoDong4OBJ:SyncResponse(int1,_,_,tab)
    self.role_num = int1    --行会玩家数
    self.cfg_data = tab     --奖励领取情况

    self:setRPShow()
end

--按钮触发通知服务端
function ShangYeHuoDong4OBJ:RequestZS(param)
    ssrMessage:sendmsg(ssrNetMsgCfg.ShangYeHuoDong4_RequestZS,param)
end

--打开面板重新请求数据
function ShangYeHuoDong4OBJ:HangHuiGengXing()
    ssrMessage:sendmsg(ssrNetMsgCfg.ShangYeHuoDong4_HangHuiGengXing)
end

function ShangYeHuoDong4OBJ:ZSResponse(int1,int2,int3,tab)
    self.role_num = int1
    self.cfg_data = tab

    self:setRPShow()
    if not self.int1 then return end
    self.int1:updateUI()    --对ui文件进行交互
end
-------------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------
return ShangYeHuoDong4OBJ