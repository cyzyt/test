local ssrNetMsgCfg = {}

ssrNetMsgCfg.sync                           = 100       --同步数据

ssrNetMsgCfg.Global                         = "Global"
ssrNetMsgCfg.Global_ClickNpcResponse        = 1000      --点击某Npc
ssrNetMsgCfg.Global_OpenModuleRun           = 1001      --开启某模块
ssrNetMsgCfg.Global_SyncOpenDay             = 1002      --同步开服天数
ssrNetMsgCfg.Global_SyncCreateActor         = 1003      --同步创建角色信息
ssrNetMsgCfg.Global_SyncTotalRealRecharge   = 1004      --同步总实冲分
ssrNetMsgCfg.Global_SyncTodayRealRecharge   = 1005      --同步今日实冲分
ssrNetMsgCfg.Global_Recharge                = 1006      --充值触发
ssrNetMsgCfg.Global_SyncAdmini              = 1007      --同步GM权限
ssrNetMsgCfg.Global_RequestOpenTTSQ         = 1008      --请求打开996盒子礼包

------------------------------------A------------------------------------
--Demo2转生
ssrNetMsgCfg.Demo2                         = "Demo2"
ssrNetMsgCfg.Demo2_SyncResponse            = 10000      --同步数据
ssrNetMsgCfg.Demo2_RequestZS               = 10011      --请求转生
ssrNetMsgCfg.Demo2_ZSResponse              = 10012      --响应转生

--任务
ssrNetMsgCfg.Task                               = "Task"
ssrNetMsgCfg.Task_SyncResponse                  = 10100      --同步数据
ssrNetMsgCfg.Task_updateTaskInfo                = 10101      --更新任务信息
ssrNetMsgCfg.Task_OpenTalkNpc                   = 10102      --打开任务对话界面
ssrNetMsgCfg.Task_RequestTalkFinish             = 10111      --请求对话完成
ssrNetMsgCfg.Task_RequestBehavior               = 10113      --请求点击任务行为
ssrNetMsgCfg.Task_clearTaskBar                  = 10114      --清理任务栏信息
ssrNetMsgCfg.Task_createTaskBar                 = 10115      --添加任务栏信息

--test
ssrNetMsgCfg.test                         = "test"
ssrNetMsgCfg.test_OpenUI                = 10200      --打开面板
ssrNetMsgCfg.test_Request               = 10211      --请求
ssrNetMsgCfg.test_Response              = 10212      --响应
------------------------------------B------------------------------------
--逆天改命
ssrNetMsgCfg.Nitiangaiming                      = "Nitiangaiming"
ssrNetMsgCfg.Nitiangaiming_SyncResponse         = 20000      --同步数据
ssrNetMsgCfg.Nitiangaiming_RequestUp            = 20001      --请求进阶
ssrNetMsgCfg.Nitiangaiming_UpResponse           = 20002      --响应进阶

--合成
ssrNetMsgCfg.Hecheng                            = "Hecheng"
ssrNetMsgCfg.Hecheng_RequestHecheng             = 20100      --请求合成
ssrNetMsgCfg.Hecheng_HechengResponse            = 20101      --响应合成

--合成_融合
ssrNetMsgCfg.HechengRonghe                         = "HechengRonghe"
ssrNetMsgCfg.HechengRonghe_RequestHecheng          = 20200      --请求融合
ssrNetMsgCfg.HechengRonghe_HechengResponse         = 20201      --响应融合

--限购商城
ssrNetMsgCfg.MysteryStore                       = "MysteryStore"
ssrNetMsgCfg.MysteryStore_SyncResponse          = 20300      --同步数据
ssrNetMsgCfg.MysteryStore_RequestBuy            = 20301      --请求购买
ssrNetMsgCfg.MysteryStore_BuyResponse           = 20302      --响应购买

--神龙分解  
ssrNetMsgCfg.SL_Fenjie                          = "SL_Fenjie"
ssrNetMsgCfg.SL_Fenjie_RequestFenjie            = 20400      --请求分解
ssrNetMsgCfg.SL_Fenjie_FenjieResponse           = 20401      --响应购买

--宝物大师
ssrNetMsgCfg.Baowu                              = "Baowu"
ssrNetMsgCfg.Baowu_SyncResponse                 = 20500      --同步数据
ssrNetMsgCfg.Baowu_RequestUp                    = 20501      --请求进阶
ssrNetMsgCfg.Baowu_UpResponse                   = 20502      --响应进阶

--背包回收
ssrNetMsgCfg.Recycle                            = "Recycle"
ssrNetMsgCfg.Recycle_SyncResponse               = 20600      --同步数据
ssrNetMsgCfg.Recycle_RequestEquip               = 20601      --请求回收装备
ssrNetMsgCfg.Recycle_EquipResponse              = 20602      --响应回收装备
ssrNetMsgCfg.Recycle_RequestAutoEquip           = 20603      --请求自动回收装备
ssrNetMsgCfg.Recycle_AutoEquipResponse          = 20604      --响应自动回收装备
ssrNetMsgCfg.Recycle_RequestWarehouse           = 20605      --请求打开仓库
ssrNetMsgCfg.Recycle_SetUserData                = 20606      --存入勾选缓存

--活动面板
ssrNetMsgCfg.ActivitySystem                     = "ActivitySystem"
ssrNetMsgCfg.ActivitySystem_RequestGoto         = 20700      --请求前往活动
ssrNetMsgCfg.ActivitySystem_CreatRankBtn        = 20703      --创建任务栏按钮
ssrNetMsgCfg.ActivitySystem_DeletRankBtn        = 20704      --删除任务栏按钮
ssrNetMsgCfg.ActivitySystem_SyncActivityState   = 20705      --同步红点

--异域大战
ssrNetMsgCfg.Playyydz                           = "Playyydz"
ssrNetMsgCfg.Playyydz_RequestEnter              = 20800      --请求进入
ssrNetMsgCfg.Playyydz_EnterResponse             = 20801      --响应进入
ssrNetMsgCfg.Playyydz_RequestBack               = 20802      --请求回城

--大乱斗
ssrNetMsgCfg.Playdld                            = "Playdld"
ssrNetMsgCfg.Playdld_RequestOpenRankWnd         = 20900      --请求打开ranklist
ssrNetMsgCfg.Playdld_OpenRankWndResponse        = 20901      --响应请打开ranklist
ssrNetMsgCfg.Playdld_RequestBack                = 20902      --请求回城
ssrNetMsgCfg.Playdld_CreatRankBtn               = 20903      --创建任务栏按钮
ssrNetMsgCfg.Playdld_DeletRankBtn               = 20904      --删除任务栏按钮

--复活
ssrNetMsgCfg.Die                                = "Die"
ssrNetMsgCfg.Die_OpenUI                         = 21000      --请求打开界面
ssrNetMsgCfg.Die_RequestRevive                  = 21001      --请求复活
ssrNetMsgCfg.Die_ReviveResponse                 = 21002      --响应复活
ssrNetMsgCfg.Die_updateDieInfo                  = 21003      --更新复活信息

--锻造
ssrNetMsgCfg.EquipForge                         = "EquipForge"
ssrNetMsgCfg.EquipForge_RequestForge            = 21100      --请求锻造
ssrNetMsgCfg.EquipForge_ForgeResponse           = 21101      --响应锻造

--熔炉
ssrNetMsgCfg.Ronglu                             = "Ronglu"
ssrNetMsgCfg.Ronglu_SyncResponse                = 21200      --同步数据
ssrNetMsgCfg.Ronglu_RequestRonglu               = 21201      --请求熔炼
ssrNetMsgCfg.Ronglu_RongluResponse              = 21202      --响应熔炼
ssrNetMsgCfg.Ronglu_RequestAuto                 = 21203      --请求自动熔炼
ssrNetMsgCfg.Ronglu_AutoResponse                = 21204      --响应自动熔炼
ssrNetMsgCfg.Ronglu_SetUserData                 = 21205      --存入勾选缓存


--合成_进阶
ssrNetMsgCfg.HechengJinjie                         = "HechengJinjie"
ssrNetMsgCfg.HechengJinjie_RequestHecheng          = 21300      --请求进阶
ssrNetMsgCfg.HechengJinjie_HechengResponse         = 21301      --响应进阶

--合成_锻造
ssrNetMsgCfg.HechengDuanzao                         = "HechengDuanzao"
ssrNetMsgCfg.HechengDuanzao_RequestHecheng          = 21400      --请求锻造
ssrNetMsgCfg.HechengDuanzao_HechengResponse         = 21401      --响应锻造

--强星
ssrNetMsgCfg.Forgingstar                        = "Forgingstar"
ssrNetMsgCfg.Forgingstar_SyncResponse           = 21500      --同步数据
ssrNetMsgCfg.Forgingstar_RequestUpgradeStar     = 21501      --请求升星
ssrNetMsgCfg.Forgingstar_UpgradeStarResponse    = 21502      --响应升星

--材料引导
ssrNetMsgCfg.QuickAccess                        = "QuickAccess"
ssrNetMsgCfg.QuickAccess_RequestFindNpc         = 21600      --请求点击npc
ssrNetMsgCfg.QuickAccess_OpenWndResponse        = 21601      --服务端唤起面板(传输itemIdx)

--江湖名望
ssrNetMsgCfg.JiangHuMingWang                           = "JiangHuMingWang"
ssrNetMsgCfg.JiangHuMingWang_SyncResponse              = 21700      --同步数据
ssrNetMsgCfg.JiangHuMingWang_RequestUpgrade            = 21701      --请求进阶
ssrNetMsgCfg.JiangHuMingWang_UpgradeResponse           = 21702      --响应进阶
ssrNetMsgCfg.JiangHuMingWang_RequestBuyGifts           = 21703      --请求购买礼包
ssrNetMsgCfg.JiangHuMingWang_BuyGiftsResponse          = 21704      --响应购买礼包
ssrNetMsgCfg.JiangHuMingWang_RequestFindNpc            = 21705      --请求点击npc
ssrNetMsgCfg.JiangHuMingWang_OpenGuideWnd              = 21706      --打开提示面板

--七日签到
ssrNetMsgCfg.SevenDaySignin                            = "SevenDaySignin"
ssrNetMsgCfg.SevenDaySignin_SyncResponse               = 22700      --同步数据
ssrNetMsgCfg.SevenDaySignin_RequestCurReceiveGet       = 22701      --请求领取奖励
ssrNetMsgCfg.SevenDaySignin_ReceiveCurResponse         = 22702      --响应领取奖励
------------------------------------C------------------------------------
--转生
ssrNetMsgCfg.ZhuanSheng                     = "ZhuanSheng"
ssrNetMsgCfg.ZhuanSheng_SyncResponse        = 30000        --同步转生数据
ssrNetMsgCfg.ZhuanSheng_RequestZS           = 30001        --客户端进入服务端
ssrNetMsgCfg.ZhuanSheng_ZSResponse          = 30002        --服务端进入客户端

--首充
ssrNetMsgCfg.ShouChong                      = "ShouChong"
ssrNetMsgCfg.ShouChong_SyncResponse         = 30100         --同步消息
ssrNetMsgCfg.ShouChong_SClibao              = 30101
ssrNetMsgCfg.ShouChong_LOGOUTplayr          = 30102
ssrNetMsgCfg.ShouChong_LQRequestZS          = 30103         --请求领取首充礼包
ssrNetMsgCfg.ShouChong_FirstDeath           = 30104

--翻牌
ssrNetMsgCfg.FlipCard                       = "FlipCard"
ssrNetMsgCfg.FlipCard_SyncResponse          = 33000         --同步消息 
ssrNetMsgCfg.FlipCard_RequestZS           = 33002         --请求同步消息
ssrNetMsgCfg.FlipCard_RequestFlipCard       = 33001         --请求翻牌

--日充礼包
ssrNetMsgCfg.ShangYeHuoDong1                     = "ShangYeHuoDong1"
ssrNetMsgCfg.ShangYeHuoDong1_SyncResponse        = 30200     --同步数据
ssrNetMsgCfg.ShangYeHuoDong1_RequestZS           = 30201     --请求领取
ssrNetMsgCfg.ShangYeHuoDong1_ZSResponse          = 30202     --响应领取

--地图跳转
ssrNetMsgCfg.MapMove                     = "MapMove"
ssrNetMsgCfg.MapMove_SyncResponse        = 30300
ssrNetMsgCfg.MapMove_RequestZS           = 30301        --请求跳转

--限时直购
ssrNetMsgCfg.ShangYeHuoDong2                     = "ShangYeHuoDong2"
ssrNetMsgCfg.ShangYeHuoDong2_SyncResponse        = 30400     --同步数据
ssrNetMsgCfg.ShangYeHuoDong2_RequestZS           = 30401     --请求购买
ssrNetMsgCfg.ShangYeHuoDong2_ZSResponse          = 30402     --响应购买

--累充礼包
ssrNetMsgCfg.ShangYeHuoDong3                     = "ShangYeHuoDong3"
ssrNetMsgCfg.ShangYeHuoDong3_SyncResponse        = 30600     --同步数据
ssrNetMsgCfg.ShangYeHuoDong3_RequestZS           = 30601     --请求购买
ssrNetMsgCfg.ShangYeHuoDong3_ZSResponse          = 30602     --响应购买

--行会竞技礼包
ssrNetMsgCfg.ShangYeHuoDong4                        = "ShangYeHuoDong4"
ssrNetMsgCfg.ShangYeHuoDong4_SyncResponse           = 30700     --同步数据
ssrNetMsgCfg.ShangYeHuoDong4_RequestZS              = 30701     --请求领取
ssrNetMsgCfg.ShangYeHuoDong4_ZSResponse             = 30702     --响应领取
ssrNetMsgCfg.ShangYeHuoDong4_HangHuiGengXing        = 30703     --刷新界面

--神兽之力/四象
ssrNetMsgCfg.ShenShouZhiLi                     = "ShenShouZhiLi"
ssrNetMsgCfg.ShenShouZhiLi_SyncResponse        = 30800          --同步数据
ssrNetMsgCfg.ShenShouZhiLi_RequestZS           = 30801          --请求进阶
ssrNetMsgCfg.ShenShouZhiLi_ZSResponse          = 30802          --响应购买

--狂暴
ssrNetMsgCfg.KuangBao                        = "KuangBao"
ssrNetMsgCfg.KuangBao_SyncResponse           = 30900
ssrNetMsgCfg.KuangBao_RequestZS              = 30901             --请求开启

--vip
ssrNetMsgCfg.VIP                        = "VIP"
ssrNetMsgCfg.VIP_SyncResponse           = 31000     --同步数据
ssrNetMsgCfg.VIP_RequestZS              = 31001     --请求激活
ssrNetMsgCfg.VIP_ZSResponse             = 31002     --响应激活

--沙捐
ssrNetMsgCfg.ShaJuan                        = "ShaJuan"
ssrNetMsgCfg.ShaJuan_SyncResponse           = 31100     --同步数据
ssrNetMsgCfg.ShaJuan_RequestZS              = 31101     --请求捐献
ssrNetMsgCfg.ShaJuan_ZSResponse             = 31102     --响应捐献

--时装
ssrNetMsgCfg.Fashion                        = "Fashion"
ssrNetMsgCfg.Fashion_SyncResponse           = 31300     --同步数据
ssrNetMsgCfg.Fashion_RequestZS              = 31301     --请求穿戴
ssrNetMsgCfg.Fashion_ZSResponse             = 31302     --响应穿戴/当前页信息
ssrNetMsgCfg.Fashion_TBRequest              = 31303     --请求获取当前页面信息
ssrNetMsgCfg.Fashion_FashionShow            = 31304

--神龙/钱庄
ssrNetMsgCfg.Shenlong                     = "Shenlong"
ssrNetMsgCfg.Shenlong_SyncResponse        = 31500       --同步数据
ssrNetMsgCfg.Shenlong_RequestZS           = 31501       --请求领取
ssrNetMsgCfg.Shenlong_ZSResponse          = 31502       --响应领取

--战力榜
ssrNetMsgCfg.Newranklist                        = "Newranklist"
ssrNetMsgCfg.Newranklist_SyncResponse           = 31600     --同步数据
ssrNetMsgCfg.Newranklist_RequestZS              = 31601     --请求获取玩家自身信息
ssrNetMsgCfg.Newranklist_ZSResponse             = 31602     --响应获取玩家自身信息

--激活码
ssrNetMsgCfg.Jihuoma                        = "Jihuoma"
ssrNetMsgCfg.Jihuoma_SyncResponse           = 31700
ssrNetMsgCfg.Jihuoma_RequestZS              = 31701

--合成/上古神器
ssrNetMsgCfg.Hechengshenqi                            = "Hechengshenqi"
ssrNetMsgCfg.Hechengshenqi_RequestHecheng             = 31800
ssrNetMsgCfg.Hechengshenqi_HechengResponse            = 31801

--首爆
ssrNetMsgCfg.ShangYeHuoDong5                      = "ShangYeHuoDong5"
ssrNetMsgCfg.ShangYeHuoDong5_SyncResponse         = 32300      --同步数据
ssrNetMsgCfg.ShangYeHuoDong5_SyncMaxRecovery      = 32301      --同步某个物品全服已回收数量已达到最大值
ssrNetMsgCfg.ShangYeHuoDong5_SyncItemFirst        = 32302      --同步某个物品达到首爆领取要求
ssrNetMsgCfg.ShangYeHuoDong5_RequestData          = 32303      --请求数据
ssrNetMsgCfg.ShangYeHuoDong5_DataResponse         = 32304      --响应数据
ssrNetMsgCfg.ShangYeHuoDong5_RequestReceive       = 32305      --请求领取
ssrNetMsgCfg.ShangYeHuoDong5_RecoveryResponse     = 32306      --响应领取

--全服回收
ssrNetMsgCfg.ShangYeHuoDong6                      = "ShangYeHuoDong6"
ssrNetMsgCfg.ShangYeHuoDong6_SyncResponse         = 32400      --同步数据
ssrNetMsgCfg.ShangYeHuoDong6_SyncMaxRecovery      = 32301      --同步某个物品全服已回收数量已达到最大值
ssrNetMsgCfg.ShangYeHuoDong6_SyncItemFirst        = 32402      --同步某个物品达到首爆领取要求
ssrNetMsgCfg.ShangYeHuoDong6_SyncItemRecycle      = 32403      --同步某个物品可以进行回收
ssrNetMsgCfg.ShangYeHuoDong6_RequestReceive       = 32404      --请求回收
ssrNetMsgCfg.ShangYeHuoDong6_RecoveryResponse     = 32405      --响应回收

--游戏攻略
ssrNetMsgCfg.Gonglue                      = "Gonglue"
ssrNetMsgCfg.Gonglue_RequestFindNpc         = 32500      --同步数据

--每日充值
ssrNetMsgCfg.ShangYeHuoDong7                      = "ShangYeHuoDong7"
ssrNetMsgCfg.ShangYeHuoDong7_SyncResponse         = 32600      --同步数据
ssrNetMsgCfg.ShangYeHuoDong7_RequestGetLJGift     = 32601      --请求领取累计奖励
ssrNetMsgCfg.ShangYeHuoDong7_RequestGetMRGift     = 32602      --请求领取每日奖励
------------------------------------D------------------------------------
--宝石镶嵌
ssrNetMsgCfg.GemInlay                         = "GemInlay"
ssrNetMsgCfg.GemInlay_SyncResponse            = 40000      --同步数据
ssrNetMsgCfg.GemInlay_RequestSet              = 40011      --请求镶嵌
ssrNetMsgCfg.GemInlay_SetResponse             = 40012      --响应镶嵌
ssrNetMsgCfg.GemInlay_RequestDel              = 40013      --请求拆卸
ssrNetMsgCfg.GemInlay_DelResponse             = 40014      --响应拆卸

--宝石合成
ssrNetMsgCfg.GemFuse                          = "GemFuse"
ssrNetMsgCfg.GemFuse_RequestHecheng           = 40101      --请求合成
ssrNetMsgCfg.GemFuse_HechengResponse          = 40102      --响应合成

--抽奖
ssrNetMsgCfg.TurnTable                       = "TurnTable"
ssrNetMsgCfg.TurnTable_SyncResponse          = 22800
ssrNetMsgCfg.TurnTable_RequestChujiang       = 22801       --请求抽奖
ssrNetMsgCfg.TurnTable_ChujiangRequest       = 22802       --响应抽奖请求
ssrNetMsgCfg.TurnTable_NO_ChujiangRequest_1     = 22803       --元宝不足，不响应抽奖请求
ssrNetMsgCfg.TurnTable_NO_ChujiangRequest_2     = 22804       --性别不符，不响应抽奖请求


local t = {}
for msgName,msgID in pairs(ssrNetMsgCfg) do
    t[msgName] = msgID
    t[msgID] = msgName
end
ssrNetMsgCfg = t

return ssrNetMsgCfg