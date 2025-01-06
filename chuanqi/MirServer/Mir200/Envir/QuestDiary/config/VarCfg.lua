VarCfg = {}

--引擎G变量
VarCfg.G_Hefu_Activity_ID                  = "G0"                 --合服狂欢活动id
--引擎A变量

--引擎U变量
VarCfg.U_create_actor_time                  = "U0"                --创建角色时间戳
VarCfg.U_create_actor_openday               = "U1"                --创建角色时已开服的天数
VarCfg.U_real_recharge_cent                 = "U2"                --实际充值金额RMB
VarCfg.U_today_real_recharge_cent           = "U3"                --今日实际充值金额RMB
VarCfg.U_actor_hefu_num                     = "U4"                --合服参数,若当前合服次数与角色存储值不一,则重置变量用
VarCfg.U_virtual_recharge_cent              = "U5"                --虚拟充值分        1人民币=100分
VarCfg.U_today_virtual_recharge_cent        = "U6"                --今日虚拟充值分        1人民币=100分

VarCfg.U_Bag_OpenNum                        = "U200"           --背包拓展格子数
VarCfg.U_Warehouse_OpenNum                  = "U201"           --仓库拓展格子数

VarCfg.vip_level                            = "U241"              --当前vip等级

VarCfg.B_Hecheng_Mabi                       = "B_Hecheng_Mabi"          --麻痹合成标识
VarCfg.B_Hecheng_Fuhuo                      = "B_Hecheng_Fuhuo"         --复活合成标识
-- VarCfg.B_Bag_OpenNum                        = "B_Bag_OpenNum"           --背包拓展格子数

VarCfg.C_QsQVIP                             = "C_QsQVIP"            --vip等级
VarCfg.C_QsQshouchong                       = "C_QsQshouchong"      --首充标记
VarCfg.C_QsQfirstdeath                      = "C_QsQfirstdeath"     --首充死亡标记

--引擎T变量
VarCfg.T_daily_date                         = "T0"                --格式 20211103 年月日，  每日凌晨更新，如果凌晨不在线每日第一次登陆更新

--引擎变量 S
VarCfg.S_cur_mapid                          = "S99"                 --当前所在地图id，切换地图时候获取上一次的地图id

--临时自定义变量
VarCfg.Die_Flag                             = "N$B死掉了"               --死亡触发之前处理 0 没死 1死掉了
VarCfg.Die_Drop_item                        = "S$B死亡掉装备"           --死亡爆出的装备
VarCfg.Recharge_Temp                        = "N$B充值记录"             --充值临时记录
VarCfg.Hide_Attr_Miss                       = "N$B闪避记录"             --闪避临时记录

--自定义个人变量
VarCfg.NB_Caiji_Num                          = "NB_Playcaiji_dayNum"        --今日采集次数变量名
VarCfg.NB_Shouling_Num                       = "NB_Playshouling_dayNum"     --今日首领击杀变量名
VarCfg.NB_Mowang_Num                         = "NB_Playmowang_dayNum"       --今日魔王击杀变量名

VarCfg.NB_JHMW_Lv                           = "NB_JiangHuMingWang_Lv"       --江湖名望/免费vip等级

VarCfg.NB_QD_useNum                         = "NB_SevenDay_gifgUseNum"       --虚充红包每日使用数量

--隐藏变量名                                                            --属性名字                  说明	            数值类型1固值 2万分比 3 百分比 
VarCfg.NB_hide_att_204                       = "NB_att_hide_204"	   --麻痹概率               麻痹对象的概率	                    2
VarCfg.NB_hide_att_205                       = "NB_att_hide_205"	   --复活冷却时间(秒)	     复活冷却时间（秒）	                 1
VarCfg.NB_hide_att_206                       = "NB_att_hide_206"	   --复活血量和蓝	        复活后恢复的血量	                 2
VarCfg.NB_hide_att_207                       = "NB_att_hide_207"	   --无视概率	            概率触发无视攻击	                 2
VarCfg.NB_hide_att_208                       = "NB_att_hide_208"	   --无视攻击	            概率闪避对方攻击	                 2
VarCfg.NB_hide_att_209                       = "NB_att_hide_209"	   --无视概率时间(秒）	    概率闪避对方攻击	                  1
VarCfg.NB_hide_att_210                       = "NB_att_hide_210"	   --护身系数	            万分比减伤，所受的伤害减扣在MP上	   2
VarCfg.NB_hide_att_211                       = "NB_att_hide_211"	   --抵抗吸血概率		                                        2
VarCfg.NB_hide_att_212                       = "NB_att_hide_212"	   --抵抗吸血		                                            1
VarCfg.NB_hide_att_213                       = "NB_att_hide_213"	   --抵抗吸血持续时间	单位：秒	                             1
VarCfg.NB_hide_att_214                       = "NB_att_hide_214"	   --抵抗吸血冷却时间	单位：秒	                             1


--引擎N变量
VarCfg.N_cur_level                          = "N$A_当前等级"       --当前等级(为了升级触发获取到上一次是多少级)



return VarCfg