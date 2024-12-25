--[[
    ObjCfg字段说明：
    ID                              界面唯一ID
    UI_ORIGIN                       界面原点

    OBJ_PATH                        xxOBJ文件路径
    UI_PATH                         xxUI文件路径
]]

local ssrObjCfg = {}


ssrObjCfg.test = {
    ID                              = 10200,

    OBJ_PATH                        = "GUILayout/A/testOBJ",
    UI_PATH                         = "A/testUI",

    NET_MESSAGE                     = ssrNetMsgCfg.test,
}

--世界传送
ssrObjCfg.ShiJieChuanSong = {
    ID                              = 10200,
    UI_TYPE                         = ssrConstCfg.UI_NORMAL,
    NET_MESSAGE                     = ssrNetMsgCfg.ShiJieChuanSong,
    OBJ_PATH                        = "GUILayout/A/ShiJieChuanSongOBJ",
    UI_PATH                         = "A/ShiJieChuanSongUI",
}

ssrObjCfg.Nitiangaiming = {
    ID                              = 20000,

    OBJ_PATH                        = "GUILayout/B/NitiangaimingOBJ",
    UI_PATH                         = "B/NitiangaimingUI",

    NET_MESSAGE                     = ssrNetMsgCfg.Nitiangaiming,
}

ssrObjCfg.Hecheng = {
    ID                              = 20100,

    OBJ_PATH                        = "GUILayout/B/HechengOBJ",
    UI_PATH                         = "B/HechengUI",

    NET_MESSAGE                     = ssrNetMsgCfg.Hecheng,
}

ssrObjCfg.HechengRonghe = {
    ID                              = 20200,

    OBJ_PATH                        = "GUILayout/B/HechengRongheOBJ",
    UI_PATH                         = "B/HechengRongheUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HechengRonghe,
}

ssrObjCfg.Baowu = {
    ID                              = 20500,

OBJ_PATH                            = "GUILayout/B/BaowuOBJ",
    UI_PATH                         = "B/BaowuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.Baowu,
}

ssrObjCfg.Recycle = {
    ID                              = 20600,

    OBJ_PATH                        = "GUILayout/B/RecycleOBJ",
    UI_PATH                         = "B/RecycleUI",

    NET_MESSAGE                     = ssrNetMsgCfg.Recycle,
}

ssrObjCfg.ActivitySystem = {
    ID                              = 20700,

    OBJ_PATH                        = "GUILayout/B/ActivitySystemOBJ",
    UI_PATH                         = "B/ActivitySystemUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ActivitySystem,
}

--复活
ssrObjCfg.Die = {
    ID                               = 21000,
    UI_TYPE                          = ssrConstCfg.UI_NORMAL,

    OBJ_PATH                         = "GUILayout/B/DieOBJ",
    UI_PATH                          = "B/DieUI",

    NET_MESSAGE                      = ssrNetMsgCfg.Die,
}


ssrObjCfg.EquipForge = {
    ID                              = 21100,

    OBJ_PATH                        = "GUILayout/B/EquipForgeOBJ",
    UI_PATH                         = "B/EquipForgeUI",

    NET_MESSAGE                     = ssrNetMsgCfg.EquipForge,
}

ssrObjCfg.Ronglu = {
    ID              = 21200,

    UI_TYPE         = ssrConstCfg.UI_NORMAL,

    OBJ_PATH                        = "GUILayout/B/RongluOBJ",
    UI_PATH                         = "B/RongluUI",

    NET_MESSAGE     = ssrNetMsgCfg.Ronglu,
}

ssrObjCfg.HechengJinjie = {
    ID                              = 21300,

    OBJ_PATH                        = "GUILayout/B/HechengJinjieOBJ",
    UI_PATH                         = "B/HechengJinjieUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HechengJinjie,
}

ssrObjCfg.HechengDuanzao = {
    ID                              = 21400,

    OBJ_PATH                        = "GUILayout/B/HechengDuanzaoOBJ",
    UI_PATH                         = "B/HechengDuanzaoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HechengDuanzao,
}

ssrObjCfg.Forgingstar = {
    ID                              = 21500,

    OBJ_PATH                        = "GUILayout/B/ForgingstarOBJ",
    UI_PATH                         = "B/ForgingstarUI",

    NET_MESSAGE                     = ssrNetMsgCfg.Forgingstar,
}

ssrObjCfg.JiangHuMingWang = {
    ID                              = 21700,

    OBJ_PATH                        = "GUILayout/B/JiangHuMingWangOBJ",
    UI_PATH                         = "B/JiangHuMingWangUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JiangHuMingWang,
}

ssrObjCfg.SevenDaySignin = {
    ID                              = 22700,
    RP_EVENT                        = ssrEventCfg.SevenDaySignin,

    OBJ_PATH                        = "GUILayout/B/SevenDaySigninOBJ",
    UI_PATH                         = "B/SevenDaySigninUI",

    NET_MESSAGE                     = ssrNetMsgCfg.SevenDaySignin,
}

ssrObjCfg.ZhuanSheng = {
    ID                              = 30000,

    OBJ_PATH                        = "GUILayout/C/ZhuanShengOBJ",
    UI_PATH                         = "C/ZhuanShengUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ZhuanSheng,
}


ssrObjCfg.ShouChong = {
    ID                              = 30100,

    OBJ_PATH                        = "GUILayout/C/ShouChongOBJ",
    UI_PATH                         = "C/ShouChongUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShouChong,
}

ssrObjCfg.ShangYeHuoDong1 = {
    ID                              = 30200,
    RP_EVENT                        = ssrEventCfg.ShangYeHuoDong1,

    OBJ_PATH                        = "GUILayout/C/ShangYeHuoDong1OBJ",
    UI_PATH                         = "C/ShangYeHuoDong1UI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShangYeHuoDong1,
}

ssrObjCfg.MapMove = {
    ID                              = 30300,

    OBJ_PATH                        = "GUILayout/C/MapMoveOBJ",
    UI_PATH                         = "C/MapMoveUI",

    NET_MESSAGE                     = ssrNetMsgCfg.MapMove,
}

ssrObjCfg.ShangYeHuoDong2 = {
    ID                              = 30400,
    RP_EVENT                        = ssrEventCfg.ShangYeHuoDong2,

    OBJ_PATH                        = "GUILayout/C/ShangYeHuoDong2OBJ",
    UI_PATH                         = "C/ShangYeHuoDong2UI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShangYeHuoDong2,
}

ssrObjCfg.ShangYeHuoDong3 = {
    ID                              = 30600,
    RP_EVENT                        = ssrEventCfg.ShangYeHuoDong3,

    OBJ_PATH                        = "GUILayout/C/ShangYeHuoDong3OBJ",
    UI_PATH                         = "C/ShangYeHuoDong3UI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShangYeHuoDong3,
}

ssrObjCfg.ShangYeHuoDong4 = {
    ID                              = 30700,
    RP_EVENT                        = ssrEventCfg.ShangYeHuoDong4,

    OBJ_PATH                        = "GUILayout/C/ShangYeHuoDong4OBJ",
    UI_PATH                         = "C/ShangYeHuoDong4UI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShangYeHuoDong4,
}


ssrObjCfg.ShenShouZhiLi = {
    ID                              = 30800,

    OBJ_PATH                        = "GUILayout/C/ShenShouZhiLiOBJ",
    UI_PATH                         = "C/ShenShouZhiLiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShenShouZhiLi,
}

ssrObjCfg.KuangBao = {
    ID                              = 30900,

    OBJ_PATH                        = "GUILayout/C/KuangBaoOBJ",
    UI_PATH                         = "C/KuangBaoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.KuangBao,
}

ssrObjCfg.VIP = {
    ID                              = 31000,

    OBJ_PATH                        = "GUILayout/C/VIPOBJ",
    UI_PATH                         = "C/VIPUI",

    NET_MESSAGE                     = ssrNetMsgCfg.VIP,
}

ssrObjCfg.ShaJuan = {
    ID                              = 31100,

    OBJ_PATH                        = "GUILayout/C/ShaJuanOBJ",
    UI_PATH                         = "C/ShaJuanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShaJuan,
}

ssrObjCfg.Jihuoma = {
    ID                              = 31700,

    OBJ_PATH                        = "GUILayout/C/JihuomaOBJ",
    UI_PATH                         = "C/JihuomaUI",

    NET_MESSAGE                     = ssrNetMsgCfg.Jihuoma,
}

ssrObjCfg.Hechengshenqi = {
    ID                              = 31800,

    OBJ_PATH                        = "GUILayout/C/HechengshenqiOBJ",
    UI_PATH                         = "C/HechengshenqiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.Hechengshenqi,
}

ssrObjCfg.ShangYeHuoDong5 = {
    ID                              = 32300,
    RP_EVENT                        = ssrEventCfg.ShangYeHuoDong5,

    OBJ_PATH                        = "GUILayout/C/ShangYeHuoDong5OBJ",
    UI_PATH                         = "C/ShangYeHuoDong5UI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShangYeHuoDong5,
}

ssrObjCfg.ShangYeHuoDong6 = {
    ID                              = 32400,
    RP_EVENT                        = ssrEventCfg.ShangYeHuoDong6,

    OBJ_PATH                        = "GUILayout/C/ShangYeHuoDong6OBJ",
    UI_PATH                         = "C/ShangYeHuoDong6UI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShangYeHuoDong6,
}

ssrObjCfg.Gonglue = {
    ID                              = 32500,

    OBJ_PATH                        = "GUILayout/C/GonglueOBJ",
    UI_PATH                         = "C/GonglueUI",

    NET_MESSAGE                     = ssrNetMsgCfg.Gonglue,
}

ssrObjCfg.ShangYeHuoDong7 = {
    ID                              = 32600,
    RP_EVENT                        = ssrEventCfg.ShangYeHuoDong7,

    OBJ_PATH                        = "GUILayout/C/ShangYeHuoDong7OBJ",
    UI_PATH                         = "C/ShangYeHuoDong7UI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShangYeHuoDong7,
}

ssrObjCfg.GemInlay = {
    ID                              = 40000,

    OBJ_PATH                        = "GUILayout/D/GemInlayOBJ",
    UI_PATH                         = "D/GemInlayUI",

    NET_MESSAGE                     = ssrNetMsgCfg.GemInlay,
}

ssrObjCfg.GemFuse = {
    ID                              = 40101,

    OBJ_PATH                        = "GUILayout/D/GemFuseOBJ",
    UI_PATH                         = "D/GemFuseUI",

    NET_MESSAGE                     = ssrNetMsgCfg.GemFuse,
}



--功能描述
ssrObjCfg.DescTips = {
    ID                              = 40200,

    OBJ_PATH                        = "GUILayout/E/DescTipsOBJ",
    UI_PATH                         = "E/DescTipsUI",
}

------------------------分页配置都要放在最下面------------------------------------------------
--宝石分页界面
ssrObjCfg.DemoPagingGemstoneObj = {
    ID                              = 90000,
    OBJ_ORDER                       = {ssrObjCfg.GemInlay, ssrObjCfg.GemFuse},
    OBJ_DESCRIBE                    = {"镶\n嵌", "合\n成"},
    OBJ_TITLE                       = {"宝石系统"},
    RP_EVENT                        = ssrEventCfg.RpPagingGemstone,

    OBJ_PATH                        = "GUILayout/A/PagingOBJ",
    UI_PATH                         = "A/PagingGemUI",
}

--开服活动分页界面
ssrObjCfg.SYHDPagingGemstoneObj = {
    ID                              = 90100,
    OBJ_ORDER                       = {ssrObjCfg.ShangYeHuoDong7, ssrObjCfg.SevenDaySignin,ssrObjCfg.ShangYeHuoDong2, ssrObjCfg.ShangYeHuoDong3, ssrObjCfg.ShangYeHuoDong4, ssrObjCfg.ShangYeHuoDong5, ssrObjCfg.ShangYeHuoDong6,},
    OBJ_DESCRIBE                    = {"每日充值","七日登陆", "限时直购", "累计充值", "行会竞技", "首爆奖励" ,"全服回收",},
    OBJ_TITLE                       = {"开服活动"},
    RP_EVENT                        = ssrEventCfg.RpPagingGemstone,

    OBJ_PATH                        = "GUILayout/A/PagingOBJ",
    UI_PATH                         = "A/PagingUI",
}

--赋值 PAGING_OBJ 字段
for _,objcfg in pairs(ssrObjCfg) do
    if objcfg.OBJ_ORDER then
        for _,module_objcfg in ipairs(objcfg.OBJ_ORDER) do
            module_objcfg.PAGING_OBJ = objcfg
        end
    end
end


return ssrObjCfg