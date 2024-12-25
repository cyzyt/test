ShangYeHuoDong3OBJ = {}

ShangYeHuoDong3OBJ.__cname = "ShangYeHuoDong3OBJ"

ShangYeHuoDong3OBJ.cfg_stor = ssrRequireCsvCfg("cfg_mystery_store")
ShangYeHuoDong3OBJ.cfg_role_varValue = {}
ShangYeHuoDong3OBJ.day_bill = 0
ShangYeHuoDong3OBJ.db_index = 1
ShangYeHuoDong3OBJ.cfg = {}
ShangYeHuoDong3OBJ.cfg_activity = ssrRequireCsvCfg("cfg_activity")[2]
ShangYeHuoDong3OBJ.remarks = ShangYeHuoDong3OBJ.cfg_activity.remarks[1]


-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShangYeHuoDong3OBJ:main(objcfg,data,parent_ui)
    self.ui = parent_ui
    --将子页面加载进父页面nd_module容器中
    GUI:LoadExport(self.ui.nd_module, objcfg.UI_PATH)

    --居中
    local pos = GUI:getPosition(self.ui.nd_root)
    GUI:setPosition(self.ui.Layer,-pos.x, -pos.y)

    for i=1,4 do
        GUI:addOnClickEvent(self.ui["btn_zs"..i], function()
            self:RequestZS(i)
        end)
    end

    self:updateUI()
end

function ShangYeHuoDong3OBJ:updateUI()
    local store = self.cfg_stor
    local day_bill = self.day_bill
    local _cfg = self.remarks
    local data = self.cfg_role_varValue


    for i, val in ipairs(_cfg or {}) do
        local x,y = 20,5
        local parent = self.ui["P_biaoji"..i]
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

            GUI:setScale(hanld, 0.7)
            x = x + 100
        end

        local hanldbtn = self.ui["tx_btn_text"..i]
        local hanldhd = self.ui["img_hongdian"..i]

             
        if data[i] ~= 0 then
            GUI:setVisible(hanldhd, false)
            GUI:Text_setString(hanldbtn,"已 领 取")
            GUI:Text_setTextColor(hanldbtn, "#ffff00")
        else
            GUI:setVisible(hanldhd, true)
            GUI:Text_setString(hanldbtn,"可 领 取")
            GUI:Text_setTextColor(hanldbtn, "#00ff00")
        end

        local hanld = self.ui["tx_chongzhi"..i]
        if day_bill >= cfg.price then
            GUI:Text_setString(hanld,"("..cfg.price.."/"..cfg.price..")")
        else
            GUI:setVisible(hanldhd, false)
            GUI:Text_setString(hanldbtn,"未 达 成")
            GUI:Text_setString(hanld,"("..day_bill.."/"..cfg.price..")")
            GUI:Text_setTextColor(hanldbtn, "#C0C0C0")
        end
    end
end

function ShangYeHuoDong3OBJ:setRPShow()  --设置红点显示
    local isshow = false
    local isshowbtn = true

    -- for i, var in ipairs(self.remarks or {}) do
    --     if self.day_bill >= var.price and self.cfg_role_varValue == 0 then
    --         isshow =true
    --         break
    --     end
    -- end
    ssrGameEvent:push(ssrEventCfg.ShangYeHuoDong3, isshow, isshowbtn)
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步数据
function ShangYeHuoDong3OBJ:SyncResponse(int1,int2,_,cfg_role_varValue)
    self.day_bill = int1
    self.db_index = int2
    self.cfg_role_varValue = cfg_role_varValue

    self.remarks = self.cfg_activity.remarks[self.db_index] or self.cfg_activity.remarks[1]

    self:setRPShow()
end

function ShangYeHuoDong3OBJ:RequestZS(param)
    ssrMessage:sendmsg(ssrNetMsgCfg.ShangYeHuoDong3_RequestZS,param)
end

function ShangYeHuoDong3OBJ:ZSResponse(int1,int2,_,cfg_role_varValue)
    self.day_bill = int1
    self.db_index = int2 + 1
    self.cfg_role_varValue = cfg_role_varValue

    self.remarks = self.cfg_activity.remarks[self.db_index] or self.cfg_activity.remarks[1]

    self:setRPShow()
    if not int1 then return end
    self:updateUI()
end
-------------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------
return ShangYeHuoDong3OBJ