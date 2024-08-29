local ssrNetMsgCfg = {}

ssrNetMsgCfg.sync                           = 100       --ͬ������

ssrNetMsgCfg.Global                         = "Global"
ssrNetMsgCfg.Global_ClickNpcResponse        = 1000      --���ĳNpc
ssrNetMsgCfg.Global_OpenModuleRun           = 1001      --����ĳģ��
ssrNetMsgCfg.Global_SyncOpenDay             = 1002      --ͬ����������
ssrNetMsgCfg.Global_SyncCreateActor         = 1003      --ͬ��������ɫ��Ϣ
ssrNetMsgCfg.Global_SyncTotalRealRecharge   = 1004      --ͬ����ʵ���
ssrNetMsgCfg.Global_SyncTodayRealRecharge   = 1005      --ͬ������ʵ���
ssrNetMsgCfg.Global_Recharge                = 1006      --��ֵ����
ssrNetMsgCfg.Global_SyncAdmini              = 1007      --ͬ��GMȨ��
ssrNetMsgCfg.Global_RequestOpenTTSQ         = 1008      --�����996�������

------------------------------------A------------------------------------
--Demo2ת��
ssrNetMsgCfg.Demo2                         = "Demo2"
ssrNetMsgCfg.Demo2_SyncResponse            = 10000      --ͬ������
ssrNetMsgCfg.Demo2_RequestZS               = 10011      --����ת��
ssrNetMsgCfg.Demo2_ZSResponse              = 10012      --��Ӧת��

--����
ssrNetMsgCfg.Task                               = "Task"
ssrNetMsgCfg.Task_SyncResponse                  = 10100      --ͬ������
ssrNetMsgCfg.Task_updateTaskInfo                = 10101      --����������Ϣ
ssrNetMsgCfg.Task_OpenTalkNpc                   = 10102      --������Ի�����
ssrNetMsgCfg.Task_RequestTalkFinish             = 10111      --����Ի����
ssrNetMsgCfg.Task_RequestBehavior               = 10113      --������������Ϊ
ssrNetMsgCfg.Task_clearTaskBar                  = 10114      --������������Ϣ
ssrNetMsgCfg.Task_createTaskBar                 = 10115      --�����������Ϣ

--test
ssrNetMsgCfg.test                         = "test"
ssrNetMsgCfg.test_OpenUI                = 10200      --�����
ssrNetMsgCfg.test_Request               = 10211      --����
ssrNetMsgCfg.test_Response              = 10212      --��Ӧ
------------------------------------B------------------------------------
--�������
ssrNetMsgCfg.Nitiangaiming                      = "Nitiangaiming"
ssrNetMsgCfg.Nitiangaiming_SyncResponse         = 20000      --ͬ������
ssrNetMsgCfg.Nitiangaiming_RequestUp            = 20001      --�������
ssrNetMsgCfg.Nitiangaiming_UpResponse           = 20002      --��Ӧ����

--�ϳ�
ssrNetMsgCfg.Hecheng                            = "Hecheng"
ssrNetMsgCfg.Hecheng_RequestHecheng             = 20100      --����ϳ�
ssrNetMsgCfg.Hecheng_HechengResponse            = 20101      --��Ӧ�ϳ�

--�ϳ�_�ں�
ssrNetMsgCfg.HechengRonghe                         = "HechengRonghe"
ssrNetMsgCfg.HechengRonghe_RequestHecheng          = 20200      --�����ں�
ssrNetMsgCfg.HechengRonghe_HechengResponse         = 20201      --��Ӧ�ں�

--�޹��̳�
ssrNetMsgCfg.MysteryStore                       = "MysteryStore"
ssrNetMsgCfg.MysteryStore_SyncResponse          = 20300      --ͬ������
ssrNetMsgCfg.MysteryStore_RequestBuy            = 20301      --������
ssrNetMsgCfg.MysteryStore_BuyResponse           = 20302      --��Ӧ����

--�����ֽ�  
ssrNetMsgCfg.SL_Fenjie                          = "SL_Fenjie"
ssrNetMsgCfg.SL_Fenjie_RequestFenjie            = 20400      --����ֽ�
ssrNetMsgCfg.SL_Fenjie_FenjieResponse           = 20401      --��Ӧ����

--�����ʦ
ssrNetMsgCfg.Baowu                              = "Baowu"
ssrNetMsgCfg.Baowu_SyncResponse                 = 20500      --ͬ������
ssrNetMsgCfg.Baowu_RequestUp                    = 20501      --�������
ssrNetMsgCfg.Baowu_UpResponse                   = 20502      --��Ӧ����

--��������
ssrNetMsgCfg.Recycle                            = "Recycle"
ssrNetMsgCfg.Recycle_SyncResponse               = 20600      --ͬ������
ssrNetMsgCfg.Recycle_RequestEquip               = 20601      --�������װ��
ssrNetMsgCfg.Recycle_EquipResponse              = 20602      --��Ӧ����װ��
ssrNetMsgCfg.Recycle_RequestAutoEquip           = 20603      --�����Զ�����װ��
ssrNetMsgCfg.Recycle_AutoEquipResponse          = 20604      --��Ӧ�Զ�����װ��
ssrNetMsgCfg.Recycle_RequestWarehouse           = 20605      --����򿪲ֿ�
ssrNetMsgCfg.Recycle_SetUserData                = 20606      --���빴ѡ����

--����
ssrNetMsgCfg.ActivitySystem                     = "ActivitySystem"
ssrNetMsgCfg.ActivitySystem_RequestGoto         = 20700      --����ǰ���
ssrNetMsgCfg.ActivitySystem_CreatRankBtn        = 20703      --������������ť
ssrNetMsgCfg.ActivitySystem_DeletRankBtn        = 20704      --ɾ����������ť
ssrNetMsgCfg.ActivitySystem_SyncActivityState   = 20705      --ͬ�����

--�����ս
ssrNetMsgCfg.Playyydz                           = "Playyydz"
ssrNetMsgCfg.Playyydz_RequestEnter              = 20800      --�������
ssrNetMsgCfg.Playyydz_EnterResponse             = 20801      --��Ӧ����
ssrNetMsgCfg.Playyydz_RequestBack               = 20802      --����س�

--���Ҷ�
ssrNetMsgCfg.Playdld                            = "Playdld"
ssrNetMsgCfg.Playdld_RequestOpenRankWnd         = 20900      --�����ranklist
ssrNetMsgCfg.Playdld_OpenRankWndResponse        = 20901      --��Ӧ���ranklist
ssrNetMsgCfg.Playdld_RequestBack                = 20902      --����س�
ssrNetMsgCfg.Playdld_CreatRankBtn               = 20903      --������������ť
ssrNetMsgCfg.Playdld_DeletRankBtn               = 20904      --ɾ����������ť

--����
ssrNetMsgCfg.Die                                = "Die"
ssrNetMsgCfg.Die_OpenUI                         = 21000      --����򿪽���
ssrNetMsgCfg.Die_RequestRevive                  = 21001      --���󸴻�
ssrNetMsgCfg.Die_ReviveResponse                 = 21002      --��Ӧ����
ssrNetMsgCfg.Die_updateDieInfo                  = 21003      --���¸�����Ϣ

--����
ssrNetMsgCfg.EquipForge                         = "EquipForge"
ssrNetMsgCfg.EquipForge_RequestForge            = 21100      --�������
ssrNetMsgCfg.EquipForge_ForgeResponse           = 21101      --��Ӧ����

--��¯
ssrNetMsgCfg.Ronglu                             = "Ronglu"
ssrNetMsgCfg.Ronglu_SyncResponse                = 21200      --ͬ������
ssrNetMsgCfg.Ronglu_RequestRonglu               = 21201      --��������
ssrNetMsgCfg.Ronglu_RongluResponse              = 21202      --��Ӧ����
ssrNetMsgCfg.Ronglu_RequestAuto                 = 21203      --�����Զ�����
ssrNetMsgCfg.Ronglu_AutoResponse                = 21204      --��Ӧ�Զ�����
ssrNetMsgCfg.Ronglu_SetUserData                 = 21205      --���빴ѡ����


--�ϳ�_����
ssrNetMsgCfg.HechengJinjie                         = "HechengJinjie"
ssrNetMsgCfg.HechengJinjie_RequestHecheng          = 21300      --�������
ssrNetMsgCfg.HechengJinjie_HechengResponse         = 21301      --��Ӧ����

--�ϳ�_����
ssrNetMsgCfg.HechengDuanzao                         = "HechengDuanzao"
ssrNetMsgCfg.HechengDuanzao_RequestHecheng          = 21400      --�������
ssrNetMsgCfg.HechengDuanzao_HechengResponse         = 21401      --��Ӧ����

--ǿ��
ssrNetMsgCfg.Forgingstar                        = "Forgingstar"
ssrNetMsgCfg.Forgingstar_SyncResponse           = 21500      --ͬ������
ssrNetMsgCfg.Forgingstar_RequestUpgradeStar     = 21501      --��������
ssrNetMsgCfg.Forgingstar_UpgradeStarResponse    = 21502      --��Ӧ����

--��������
ssrNetMsgCfg.QuickAccess                        = "QuickAccess"
ssrNetMsgCfg.QuickAccess_RequestFindNpc         = 21600      --������npc
ssrNetMsgCfg.QuickAccess_OpenWndResponse        = 21601      --����˻������(����itemIdx)

--��������
ssrNetMsgCfg.JiangHuMingWang                           = "JiangHuMingWang"
ssrNetMsgCfg.JiangHuMingWang_SyncResponse              = 21700      --ͬ������
ssrNetMsgCfg.JiangHuMingWang_RequestUpgrade            = 21701      --�������
ssrNetMsgCfg.JiangHuMingWang_UpgradeResponse           = 21702      --��Ӧ����
ssrNetMsgCfg.JiangHuMingWang_RequestBuyGifts           = 21703      --���������
ssrNetMsgCfg.JiangHuMingWang_BuyGiftsResponse          = 21704      --��Ӧ�������
ssrNetMsgCfg.JiangHuMingWang_RequestFindNpc            = 21705      --������npc
ssrNetMsgCfg.JiangHuMingWang_OpenGuideWnd              = 21706      --����ʾ���

--����ǩ��
ssrNetMsgCfg.SevenDaySignin                            = "SevenDaySignin"
ssrNetMsgCfg.SevenDaySignin_SyncResponse               = 22700      --ͬ������
ssrNetMsgCfg.SevenDaySignin_RequestCurReceiveGet       = 22701      --������ȡ����
ssrNetMsgCfg.SevenDaySignin_ReceiveCurResponse         = 22702      --��Ӧ��ȡ����
------------------------------------C------------------------------------
--ת��
ssrNetMsgCfg.ZhuanSheng                     = "ZhuanSheng"
ssrNetMsgCfg.ZhuanSheng_SyncResponse        = 30000        --ͬ��ת������
ssrNetMsgCfg.ZhuanSheng_RequestZS           = 30001        --�ͻ��˽�������
ssrNetMsgCfg.ZhuanSheng_ZSResponse          = 30002        --����˽���ͻ���

--�׳�
ssrNetMsgCfg.ShouChong                      = "ShouChong"
ssrNetMsgCfg.ShouChong_SyncResponse         = 30100         --ͬ����Ϣ
ssrNetMsgCfg.ShouChong_SClibao              = 30101
ssrNetMsgCfg.ShouChong_LOGOUTplayr          = 30102
ssrNetMsgCfg.ShouChong_LQRequestZS          = 30103         --������ȡ�׳����
ssrNetMsgCfg.ShouChong_FirstDeath           = 30104

--����
ssrNetMsgCfg.FlipCard                       = "FlipCard"
ssrNetMsgCfg.FlipCard_SyncResponse          = 33000         --ͬ����Ϣ 
ssrNetMsgCfg.FlipCard_RequestZS           = 33002         --����ͬ����Ϣ
ssrNetMsgCfg.FlipCard_RequestFlipCard       = 33001         --������

--�ճ����
ssrNetMsgCfg.ShangYeHuoDong1                     = "ShangYeHuoDong1"
ssrNetMsgCfg.ShangYeHuoDong1_SyncResponse        = 30200     --ͬ������
ssrNetMsgCfg.ShangYeHuoDong1_RequestZS           = 30201     --������ȡ
ssrNetMsgCfg.ShangYeHuoDong1_ZSResponse          = 30202     --��Ӧ��ȡ

--��ͼ��ת
ssrNetMsgCfg.MapMove                     = "MapMove"
ssrNetMsgCfg.MapMove_SyncResponse        = 30300
ssrNetMsgCfg.MapMove_RequestZS           = 30301        --������ת

--��ʱֱ��
ssrNetMsgCfg.ShangYeHuoDong2                     = "ShangYeHuoDong2"
ssrNetMsgCfg.ShangYeHuoDong2_SyncResponse        = 30400     --ͬ������
ssrNetMsgCfg.ShangYeHuoDong2_RequestZS           = 30401     --������
ssrNetMsgCfg.ShangYeHuoDong2_ZSResponse          = 30402     --��Ӧ����

--�۳����
ssrNetMsgCfg.ShangYeHuoDong3                     = "ShangYeHuoDong3"
ssrNetMsgCfg.ShangYeHuoDong3_SyncResponse        = 30600     --ͬ������
ssrNetMsgCfg.ShangYeHuoDong3_RequestZS           = 30601     --������
ssrNetMsgCfg.ShangYeHuoDong3_ZSResponse          = 30602     --��Ӧ����

--�лᾺ�����
ssrNetMsgCfg.ShangYeHuoDong4                        = "ShangYeHuoDong4"
ssrNetMsgCfg.ShangYeHuoDong4_SyncResponse           = 30700     --ͬ������
ssrNetMsgCfg.ShangYeHuoDong4_RequestZS              = 30701     --������ȡ
ssrNetMsgCfg.ShangYeHuoDong4_ZSResponse             = 30702     --��Ӧ��ȡ
ssrNetMsgCfg.ShangYeHuoDong4_HangHuiGengXing        = 30703     --ˢ�½���

--����֮��/����
ssrNetMsgCfg.ShenShouZhiLi                     = "ShenShouZhiLi"
ssrNetMsgCfg.ShenShouZhiLi_SyncResponse        = 30800          --ͬ������
ssrNetMsgCfg.ShenShouZhiLi_RequestZS           = 30801          --�������
ssrNetMsgCfg.ShenShouZhiLi_ZSResponse          = 30802          --��Ӧ����

--��
ssrNetMsgCfg.KuangBao                        = "KuangBao"
ssrNetMsgCfg.KuangBao_SyncResponse           = 30900
ssrNetMsgCfg.KuangBao_RequestZS              = 30901             --������

--vip
ssrNetMsgCfg.VIP                        = "VIP"
ssrNetMsgCfg.VIP_SyncResponse           = 31000     --ͬ������
ssrNetMsgCfg.VIP_RequestZS              = 31001     --���󼤻�
ssrNetMsgCfg.VIP_ZSResponse             = 31002     --��Ӧ����

--ɳ��
ssrNetMsgCfg.ShaJuan                        = "ShaJuan"
ssrNetMsgCfg.ShaJuan_SyncResponse           = 31100     --ͬ������
ssrNetMsgCfg.ShaJuan_RequestZS              = 31101     --�������
ssrNetMsgCfg.ShaJuan_ZSResponse             = 31102     --��Ӧ����

--ʱװ
ssrNetMsgCfg.Fashion                        = "Fashion"
ssrNetMsgCfg.Fashion_SyncResponse           = 31300     --ͬ������
ssrNetMsgCfg.Fashion_RequestZS              = 31301     --���󴩴�
ssrNetMsgCfg.Fashion_ZSResponse             = 31302     --��Ӧ����/��ǰҳ��Ϣ
ssrNetMsgCfg.Fashion_TBRequest              = 31303     --�����ȡ��ǰҳ����Ϣ
ssrNetMsgCfg.Fashion_FashionShow            = 31304

--����/Ǯׯ
ssrNetMsgCfg.Shenlong                     = "Shenlong"
ssrNetMsgCfg.Shenlong_SyncResponse        = 31500       --ͬ������
ssrNetMsgCfg.Shenlong_RequestZS           = 31501       --������ȡ
ssrNetMsgCfg.Shenlong_ZSResponse          = 31502       --��Ӧ��ȡ

--ս����
ssrNetMsgCfg.Newranklist                        = "Newranklist"
ssrNetMsgCfg.Newranklist_SyncResponse           = 31600     --ͬ������
ssrNetMsgCfg.Newranklist_RequestZS              = 31601     --�����ȡ���������Ϣ
ssrNetMsgCfg.Newranklist_ZSResponse             = 31602     --��Ӧ��ȡ���������Ϣ

--������
ssrNetMsgCfg.Jihuoma                        = "Jihuoma"
ssrNetMsgCfg.Jihuoma_SyncResponse           = 31700
ssrNetMsgCfg.Jihuoma_RequestZS              = 31701

--�ϳ�/�Ϲ�����
ssrNetMsgCfg.Hechengshenqi                            = "Hechengshenqi"
ssrNetMsgCfg.Hechengshenqi_RequestHecheng             = 31800
ssrNetMsgCfg.Hechengshenqi_HechengResponse            = 31801

--�ױ�
ssrNetMsgCfg.ShangYeHuoDong5                      = "ShangYeHuoDong5"
ssrNetMsgCfg.ShangYeHuoDong5_SyncResponse         = 32300      --ͬ������
ssrNetMsgCfg.ShangYeHuoDong5_SyncMaxRecovery      = 32301      --ͬ��ĳ����Ʒȫ���ѻ��������Ѵﵽ���ֵ
ssrNetMsgCfg.ShangYeHuoDong5_SyncItemFirst        = 32302      --ͬ��ĳ����Ʒ�ﵽ�ױ���ȡҪ��
ssrNetMsgCfg.ShangYeHuoDong5_RequestData          = 32303      --��������
ssrNetMsgCfg.ShangYeHuoDong5_DataResponse         = 32304      --��Ӧ����
ssrNetMsgCfg.ShangYeHuoDong5_RequestReceive       = 32305      --������ȡ
ssrNetMsgCfg.ShangYeHuoDong5_RecoveryResponse     = 32306      --��Ӧ��ȡ

--ȫ������
ssrNetMsgCfg.ShangYeHuoDong6                      = "ShangYeHuoDong6"
ssrNetMsgCfg.ShangYeHuoDong6_SyncResponse         = 32400      --ͬ������
ssrNetMsgCfg.ShangYeHuoDong6_SyncMaxRecovery      = 32301      --ͬ��ĳ����Ʒȫ���ѻ��������Ѵﵽ���ֵ
ssrNetMsgCfg.ShangYeHuoDong6_SyncItemFirst        = 32402      --ͬ��ĳ����Ʒ�ﵽ�ױ���ȡҪ��
ssrNetMsgCfg.ShangYeHuoDong6_SyncItemRecycle      = 32403      --ͬ��ĳ����Ʒ���Խ��л���
ssrNetMsgCfg.ShangYeHuoDong6_RequestReceive       = 32404      --�������
ssrNetMsgCfg.ShangYeHuoDong6_RecoveryResponse     = 32405      --��Ӧ����

--��Ϸ����
ssrNetMsgCfg.Gonglue                      = "Gonglue"
ssrNetMsgCfg.Gonglue_RequestFindNpc         = 32500      --ͬ������

--ÿ�ճ�ֵ
ssrNetMsgCfg.ShangYeHuoDong7                      = "ShangYeHuoDong7"
ssrNetMsgCfg.ShangYeHuoDong7_SyncResponse         = 32600      --ͬ������
ssrNetMsgCfg.ShangYeHuoDong7_RequestGetLJGift     = 32601      --������ȡ�ۼƽ���
ssrNetMsgCfg.ShangYeHuoDong7_RequestGetMRGift     = 32602      --������ȡÿ�ս���
------------------------------------D------------------------------------
--��ʯ��Ƕ
ssrNetMsgCfg.GemInlay                         = "GemInlay"
ssrNetMsgCfg.GemInlay_SyncResponse            = 40000      --ͬ������
ssrNetMsgCfg.GemInlay_RequestSet              = 40011      --������Ƕ
ssrNetMsgCfg.GemInlay_SetResponse             = 40012      --��Ӧ��Ƕ
ssrNetMsgCfg.GemInlay_RequestDel              = 40013      --�����ж
ssrNetMsgCfg.GemInlay_DelResponse             = 40014      --��Ӧ��ж

--��ʯ�ϳ�
ssrNetMsgCfg.GemFuse                          = "GemFuse"
ssrNetMsgCfg.GemFuse_RequestHecheng           = 40101      --����ϳ�
ssrNetMsgCfg.GemFuse_HechengResponse          = 40102      --��Ӧ�ϳ�

--�齱
ssrNetMsgCfg.TurnTable                       = "TurnTable"
ssrNetMsgCfg.TurnTable_SyncResponse          = 22800
ssrNetMsgCfg.TurnTable_RequestChujiang       = 22801       --����齱
ssrNetMsgCfg.TurnTable_ChujiangRequest       = 22802       --��Ӧ�齱����
ssrNetMsgCfg.TurnTable_NO_ChujiangRequest_1     = 22803       --Ԫ�����㣬����Ӧ�齱����
ssrNetMsgCfg.TurnTable_NO_ChujiangRequest_2     = 22804       --�Ա𲻷�������Ӧ�齱����


local t = {}
for msgName,msgID in pairs(ssrNetMsgCfg) do
    t[msgName] = msgID
    t[msgID] = msgName
end
ssrNetMsgCfg = t

return ssrNetMsgCfg