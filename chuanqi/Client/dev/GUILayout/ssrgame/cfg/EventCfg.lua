local ssrEventCfg = {}

-----------------------------------�����¼�-----------------------------------
ssrEventCfg.onDisconnect                    = "onDisconnect"                    --����
ssrEventCfg.onReconnect                     = "onReconnect"                     --����
ssrEventCfg.onMapInfoChange                 = "onMapInfoChange"                 --��ͼ�ı� ��ͬ��ͼ {mapID = mapID lastMapID = lastMapID}
ssrEventCfg.onChangeScene                   = "onChangeScene"                  --�л����� ͬ��ͼ��ͬ��ͼ {mapID = mapID lastMapID = lastMapID}
ssrEventCfg.onPlayerPropertyInited          = "onPlayerPropertyInited"          --��ɫ���Գ�ʼ����ϣ�ͨ����������Ϊ������������Ϸ������ִ�������߼�
ssrEventCfg.onPlayerLevelChange             = "onPlayerLevelChange"             --��ɫ�ȼ������ı� {currlevel = currlevel lastlevel = lastlevel}
ssrEventCfg.onPlayerPropertyChange          = "onPlayerPropertyChange"          --��ɫ���Է����ı�
ssrEventCfg.onPlayerManaChange              = "onPlayerManaChange"              --��ɫhp/mp�����ı� {curHP = curHP maxHP = maxHP curMP = curMP maxMP = maxMP roleName = roleName}
ssrEventCfg.OnTargetChange                  = "OnTargetChange"                  --ѡ��Ŀ��ı� {actorID = actorID, actorName = actorName, curHP = curHP, maxHP = maxHP, level = level, type = type} type: ���� 1��� 2��
ssrEventCfg.OnRefreshTargetHP               = "OnRefreshTargetHP"               --��ѡ�е�Ŀ��Ѫ���仯 {actorID = actorID curHP = curHP maxHP = maxHP}
ssrEventCfg.onLeaveWorld                    = "onLeaveWorld"                    --�뿪��Ϸ���� С�˴���
ssrEventCfg.onRestartGame                   = "onRestartGame"                   --������Ϸ����
ssrEventCfg.onGameSuspend                   = "onGameSuspend"                   --��Ϸ��ͣ
ssrEventCfg.onGameResumed                   = "onGameResumed"                   --��Ϸ�ָ�
ssrEventCfg.OnChangePKStateSuccess          = "OnChangePKStateSuccess"          --�л�ģʽ�ɹ�
ssrEventCfg.OnPlayerNameInited              = "OnPlayerNameInited"              --��ɫ����ʼ��/�ı� {roleName = roleName}
ssrEventCfg.OnTakeOnEquip                   = "OnTakeOnEquip"                   --����װ�� {isSuccess = isSuccess} isSuccess: boolean �ɹ�/ʧ��
ssrEventCfg.OnTakeOffEquip                  = "OnTakeOffEquip"                  --�ѵ�װ�� {isSuccess = isSuccess} isSuccess: boolean �ɹ�/ʧ��
ssrEventCfg.OnBatteryValueChange            = "OnBatteryValueChange "           --�����ı� value �� �����ٷֱ�ֵ
ssrEventCfg.OnPlayerExpChange               = "OnPlayerExpChange "              --��Ҿ���ֵ�ı� {changed = changed} �� �䶯����ֵ
ssrEventCfg.OnNetStateChange                = "OnNetStateChange"                --����״̬�ı� {type = type} type: -1:δ֪ 0:wifi 1:2G 2:3G 3:4G
ssrEventCfg.OnPlayerMoneyChange             = "OnPlayerMoneyChange"             --��ɫ�������ݸı� {id = id, count = count} �� �����ı�Ļ���id������
ssrEventCfg.OnBagOperData                   = "OnBagOperData"                   --�������ݲ��� {opera = opera, operID = operID} �� opera����: 0:��ʼ�� 1:���� 2:ɾ�� 3:�ı� operID ��Ʒ����: table
ssrEventCfg.OnActionBegin                   = "OnActionBegin"                   --��·/�ܲ��������� type �� 1��· 2�ܲ� [�����]
ssrEventCfg.OnPetActionBegin                = "OnPetActionBegin"                --����ҵĳ���/������������ �� 1��· 2�ܲ�
ssrEventCfg.OnSkillAdd                      = "OnSkillAdd"                      --�������� ��������: table
ssrEventCfg.OnSkillDel                      = "OnSkillDel"                      --ɾ������ ��������: table
ssrEventCfg.OnSkillUpdate                   = "OnSkillUpdate"                   --���ܸ��� ��������: table
ssrEventCfg.OnLookPlayerDataUpdate          = "OnLookPlayerDataUpdate"          --�鿴�������ݸ��� table ����ʱtable��ItemsΪ�����δ��������װ����Ϣ����
ssrEventCfg.OnAutoFightBegin                = "OnAutoFightBegin"                --�Զ�ս����ʼ
ssrEventCfg.OnAutoFightEnd                  = "OnAutoFightEnd"                  --�Զ�ս������
ssrEventCfg.OnPlayerEquipInit               = "OnPlayerEquipInit"               --��ɫװ�����ݳ�ʼ��

-----------------------------------��Ϸ�¼�-----------------------------------
ssrEventCfg.GoClickNpc                      = "GoClickNpc"                      --���ĳnpc params��npcid
ssrEventCfg.GoClickMainBlank                = "GoClickMainBlank"                --���������հ�����
ssrEventCfg.ShouChongSClibao                = "ShouChongSClibao"                --�׳�����¼�
ssrEventCfg.GoFuhuoTimer                    = "GoFuhuoTimer"                    --�����ʱ
ssrEventCfg.GoVIPLevel                      = "GoVIPLevel"                      --VIP�ȼ������仯
ssrEventCfg.GoRecharge                      = "GoRecharge"                      --��ֵ�仯
ssrEventCfg.GoGMLevel                       = "GoGMLevel"                       --��ȡ��GMȨ�޵ȼ�
ssrEventCfg.GoOpenLayerQuickAccess          = "GoOpenLayerQuickAccess"          --�򿪿��ٻ�ȡ����

-----------------------------------����¼�-----------------------------------
ssrEventCfg.RpPagingGemstone                = "RpPagingGemstone"                --ģ�� PagingGemstone �����ʾ�¼�
ssrEventCfg.RpGemInlay                      = "RpGemInlay"                      --ģ�� GemInlay �����ʾ�¼�
ssrEventCfg.RpGemFuse                       = "RpGemFuse"                       --ģ�� GemFuse �����ʾ�¼�
ssrEventCfg.ShangYeHuoDong1                 = "ShangYeHuoDong1"                 --ģ�� ÿ�ճ�ֵ �����ʾ�¼�
ssrEventCfg.ShangYeHuoDong2                 = "ShangYeHuoDong2"                 --ģ�� ��ʱֱ�� �����ʾ�¼�
ssrEventCfg.ShangYeHuoDong3                 = "ShangYeHuoDong3"                 --ģ�� �ۼƳ�ֵ �����ʾ�¼�
ssrEventCfg.ShangYeHuoDong4                 = "ShangYeHuoDong4"                 --ģ�� �лᾺ�� �����ʾ�¼�
ssrEventCfg.RpActivity                      = "RpActivity"                      --ģ�� � �����ʾ�¼�


return ssrEventCfg