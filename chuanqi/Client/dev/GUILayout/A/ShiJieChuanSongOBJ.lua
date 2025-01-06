local ShiJieChuanSongObj = {}

ShiJieChuanSongObj.__cname = "ShiJieChuanSongObj"

ShiJieChuanSongObj.cfg = ssrRequireCsvCfg("DaLuChuanSong_cfg")

function ShiJieChuanSongObj:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false,true,objcfg.npcid)
    GUI:LoadExport(parent, objcfg.UI_PATH,function ()
        self._parent = parent
        self.ui = GUI:ui_delegate(parent)
        GUI:Layout_setBackGroundColorType(self.ui.lv_btn, 0)
        --关闭按钮
        GUI:addOnClickEvent(self.ui.btn_close, function()
            GUI:Win_Close(self._parent)
        end)

        for index,cfg in ipairs(self.cfg) do
            local btn = self.ui["btn_"..index]
            local bool = checkbool(ssrDataPlayer:conditions(cfg.condition))
            local img_suo = GUI:getChildByName(btn, "img_suo")  --锁
            GUI:setVisible(img_suo,bool)
            GUI:addOnClickEvent(btn, function()
                self:RequestEnter(index)
            end)
        end
    end)
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ShiJieChuanSongObj:SyncOpenUI()
    ssrUIManager:OPEN(ssrObjCfg.ShiJieChuanSong)
end

function ShiJieChuanSongObj:RequestEnter(index)
    ssrMessage:sendmsg(ssrNetMsgCfg.ShiJieChuanSong_RequestEnter, index)
end

function ShiJieChuanSongObj:EnterResponse()
    ssrUIManager:CLOSE(ssrObjCfg.ShiJieChuanSong)
end

return ShiJieChuanSongObj