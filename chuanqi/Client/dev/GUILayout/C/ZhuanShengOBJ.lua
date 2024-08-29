ZhuanShengOBJ = {}

ZhuanShengOBJ.__cname = "ZhuanShengOBJ"

ZhuanShengOBJ.cfg = ssrRequireCsvCfg("cfg_rein") --读表
ZhuanShengOBJ.zslevel = 0                    --当前转生等级
ZhuanShengOBJ.next_zslevel = 0               --下层转生等级

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ZhuanShengOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, objcfg.UI_PATH)

    self._parent = parent
    self.ui = GUI:ui_delegate(parent)

    --背景图关闭
    GUI:addOnClickEvent(self.ui.Button_4, function()
        GUI:Win_Close(self._parent)
    end)

    --关闭按钮背景板关闭
    GUI:addOnClickEvent(self.ui.Image_1, function()    --防止背景被点击穿透 图片 要选交互性  精灵不可用

    end)

    --关闭按钮背景板关闭
    GUI:addOnClickEvent(self.ui.bg_close, function()
        GUI:Win_Close(self._parent)
    end)

    --转生按钮
    GUI:addOnClickEvent(self.ui.Button_3, function()   --客户端按钮挂载事件   由ui跳转obj进行逻辑判断
        self:RequestZS()
    end)

    self:updateUI()
end

function ZhuanShengOBJ:updateUI()   --根据参数 进行界面调整   
    local zslevel = self.zslevel
    local next_zslevel = zslevel + 1
    local cfg = self.cfg[zslevel]
    local nxtcfg = self.cfg[next_zslevel]
    local isfulllevel = self:isFullLevel()   ---在obj中取表长  也就时最大转生
    local dqhuobi = SL:GetSimpleNumber(SL:GetMetaValue("ITEM_COUNT", 4), 0)
    ------------------------------------------------进入显示阶段
    GUI:Text_setString(self.ui.AtlasLabel_2,self.zslevel.."")    --根据转生等级设置艺术字显示 控件id AtlasLabel_2
   -----------------------属性
    ssrUpdateAttrShow(self.cfg, zslevel, "Attribute0", self._parent, 3, "att_tiao", "shuxing", "shuxz", 1)
    ssrUpdateAttrShow(self.cfg, next_zslevel, "Attribute0", self._parent, 3, "att_ntiao", "xshuxing", "xshuxz", 1)
   -----------------------货币与材料
   for i=1, 2 do
        if isfulllevel then    --满级判断
            local hanld = self.ui.chailiao   --材料id
            GUI:Text_setString(hanld,"已满级")
            local hanld = self.ui.huobi   --元宝id
            GUI:Text_setString(hanld,"元宝:"..dqhuobi.."/99999")   
        else
            if not cfg.Consume[i] then break end
            local idx,num = cfg.Consume[i][1], cfg.Consume[i][2]   --取表中物品idx 与数量
            local bag_num = SL:GetMetaValue("ITEM_COUNT", idx)     --获取人物背包中数量
            local itemname = SL:GetMetaValue("ITEM_NAME", idx)    --获取个名字
            local rtext_str = ""
            if bag_num >= tonumber(num) then
                rtext_str = ssrRTextCfg.get(20000, itemname,SL:GetSimpleNumber(bag_num,0).."/"..SL:GetSimpleNumber(num,0))
            else
                rtext_str = ssrRTextCfg.get(20001, itemname,SL:GetSimpleNumber(bag_num,0).."/"..SL:GetSimpleNumber(num,0))
            end

            local p_xh_pos = self.ui["need_item_"..i]
            GUI:removeAllChildren(p_xh_pos)
            local size = GUI:getContentSize(p_xh_pos)
            local text = GUI:RichText_Create(p_xh_pos, "text", size.width/2, size.height/2, rtext_str, ssrConstCfg.width)
            GUI:setAnchorPoint(text, 0.5, 0)
            GUI:setPosition(text, size.width/2, size.height/2)
        end   
    end

   -----------------------等级与降级
    if isfulllevel then    --满级判断
        local hanld = self.ui.dqlevel   --限制等级id
        GUI:Text_setString(hanld,"9999级")
        local hanld = self.ui.xhlevel   --消耗等级id
        GUI:Text_setString(hanld,"9999级")
    else
        local hanld = self.ui.dqlevel   --材料id
        GUI:Text_setString(hanld,cfg.Level.."级")
        local hanld = self.ui.xhlevel   --元宝id
        GUI:Text_setString(hanld,cfg.DelLv.."级")
    end
    
    if  isfulllevel then
        local hanld = self.ui.huobi
        GUI:setVisible(hanld, false)
        local hanld = self.ui.dqlevel
        GUI:setVisible(hanld, false)
        local hanld = self.ui.xhlevel
        GUI:setVisible(hanld, false)
        local hanld = self.ui.Text_16_0_0_0
        GUI:setVisible(hanld, false)
        local hanld = self.ui.Text_16_0_4
        GUI:setVisible(hanld, false)
    end
end

function ZhuanShengOBJ:setZSLevel(zslevel)  --设置当前等级与下层等级关系
    self.zslevel = zslevel
    self.next_zslevel = zslevel+1
end


function ZhuanShengOBJ:isFullLevel()  --在ui界面调用最大转生
    return self.zslevel == #self.cfg
end

-----------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------

--同步数据
function ZhuanShengOBJ:SyncResponse(zslevel)
    self:setZSLevel(zslevel)        --客户端直接使用关系  （继承）
end

--转生
function ZhuanShengOBJ:RequestZS()   --转生对服务端交互
    ssrMessage:sendmsg(ssrNetMsgCfg.ZhuanSheng_RequestZS)
end


function ZhuanShengOBJ:ZSResponse(zslevel)  --该参数由服务端PZhuanSheng.lua 定义 由
    self:setZSLevel(zslevel)
    if not zslevel then return end
    self:updateUI()
end

--逻辑关系
--1服务端同步 通知客户端一起更新 SyncResponse  在游戏登录时触发
--2 addGameEvent 添加游戏事件  通知ui打开
--3 ui打开为按钮注册逻辑事件 与界面二次调整
--4  ui按钮跳转obj文件进行对服务端进行交互 主要进行逻辑判断  RequestZS
--5  服务端判断完成之后 通知进入 客户端 obj ZSResponse
--6 obj ZSResponse 简单处理 判断结果之后  跳转ui ZSResponse 刷新界面

return ZhuanShengOBJ
