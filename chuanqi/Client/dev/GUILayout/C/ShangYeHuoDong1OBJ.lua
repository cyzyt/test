ShangYeHuoDong1OBJ = {}

ShangYeHuoDong1OBJ.__cname = "ShangYeHuoDong1OBJ"

ShangYeHuoDong1OBJ.cfg = ssrRequireCsvCfg("cfg_activity_leichong") --读表
ShangYeHuoDong1OBJ.cfg_activity = ssrRequireCsvCfg("cfg_activity")[1] --读表
ShangYeHuoDong1OBJ.tab = {}


-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShangYeHuoDong1OBJ:main(objcfg,data,parent_ui)
    self.ui = parent_ui
    --将子页面加载进父页面nd_module容器中
    GUI:LoadExport(self.ui.nd_module, objcfg.UI_PATH)

    --居中
    local x, y = GUI:getPosition(self.ui.nd_root)
    GUI:setPosition(self.ui.Layer,-x, -y)

    for i = 1, 6 do
        GUI:addOnClickEvent(self.ui["btn_zs"..i], function()
            self:RequestZS(i)  --传递参数 方便判断第几个按钮
        end)
    end
    self:PaiXv()
    self:updateUI()
end

function ShangYeHuoDong1OBJ:updateUI()   --根据参数 进行界面调整   
    local data = self.tab
    for i, cfg in ipairs(self.cfg) do
        local x,y = 79, 120
        local parent = self.ui["bg_kuang"..i]
        GUI:removeAllChildren(parent)

        for j, item in ipairs(cfg.reward or {}) do
            local itemdata = {}
            itemdata.index = item[1]
            itemdata.count = item[2]
            itemdata.look  = true
            itemdata.bgVisible = true
            itemdata.color = 255
            local hanld = GUI:ItemShow_Create(parent, "item_"..i.."_"..j, x,y, itemdata)
            GUI:setScale(hanld, 0.75)
            x = x + 55
            if j % 2 == 0 then
                x = 79
                y = y - 60
            end
        end

        local btn = self.ui["tx_btn_text"..i]
        local img_red = self.ui["img_hongdian"..i]
        if data[2][i] == 1 then
            GUI:setVisible(img_red, false)
            GUI:Text_setString(btn,"已 领 取")
            GUI:Text_setTextColor(btn, "#ffff00")
        else
            GUI:setVisible(img_red, true)
            GUI:Text_setString(btn,"可 领 取")
            GUI:Text_setTextColor(btn, "#00ff00")
        end

        local hanld = self.ui["tx_chongzhi"..i]
        if data[1][1] >= i then
            GUI:Text_setString(hanld,"("..i.."/"..i..")")
        else
            GUI:setVisible(img_red, false)
            GUI:Text_setString(hanld,"("..data[1][1].."/"..i..")")
            GUI:Text_setString(btn,"未 达 成")
            GUI:Text_setTextColor(btn, "#C0C0C0")
        end
    end
end

function ShangYeHuoDong1OBJ:PaiXv() --领取后再次打开面板时重新排序
    local tab = self.tab
    local xx = 0
    for j=1,6 do   
        if tab[2][j] == 1 then    --x +200  y=300
            local hanldviw = self.ui["P_jiemian"..j]
            xx = xx + 1
            GUI:setPositionX(hanldviw, 1000+(xx*200))
        else
            break
        end
    end
    for m=1,6 do
        local hanldviw = self.ui["P_jiemian"..m]
        local pos_x = GUI:getPositionX(hanldviw)
        GUI:setPositionX(hanldviw, pos_x-(xx*200))
    end
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------


function ShangYeHuoDong1OBJ:setTable(tab)  --设置当前等级与下层等级关系
    self.tab = tab
end

function ShangYeHuoDong1OBJ:setRPShow(tab)  --设置红点显示
    local hd = 0
    local cfg = self.cfg
    local activity_tab = self.cfg_activity
    local isshow = false
    local isshowbtn = false
    for k=1,#activity_tab do
        if activity_tab[k]["activityType"] == 1 then
            local openDay = SL:GetMetaValue("KFDAY")--获取开服天数
            if openDay >= activity_tab[k]["startTime"] and openDay <= activity_tab[k]["overTime"] then
                hd = k
                isshowbtn = true
                break
            end
        end
    end
    if hd ~= 0 then
        for i=1,#tab do
            if tab[1][1] >= i then
                if tab[2][i] >= 1 then
                    isshow =false
                else
                    isshow =true
                    break
                end
            end
        end
    end
    ssrGameEvent:push(ssrEventCfg.ShangYeHuoDong1, isshow, isshowbtn)
end

--同步数据
function ShangYeHuoDong1OBJ:SyncResponse(int1,int2,int3,tab)
    self:setTable(tab)
    self:setRPShow(tab)
    --self.tab = tab
end

--按钮触发通知服务端  param=按钮标记
function ShangYeHuoDong1OBJ:RequestZS(param)
    ssrMessage:sendmsg(ssrNetMsgCfg.ShangYeHuoDong1_RequestZS,param)
end

function ShangYeHuoDong1OBJ:ZSResponse(int1,int2,int3,tab)  --该参数由服务端PZhuanSheng.lua 定义 由
    self:setTable(tab)
    self:setRPShow(tab)
    if not tab then return end
    self:ZSResponse()    --对ui文件进行交互

    -----------------------old ui script
    -- self:updateUI()
end



-------------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------

return ShangYeHuoDong1OBJ