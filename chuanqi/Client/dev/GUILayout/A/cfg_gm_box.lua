local config = {
    --//系统
    {page = 1, index = 1,  Command = "@gm_getsysvar 变量名", title = "获取系统变量",pageName = "系统"},
    {page = 1, index = 2,  Command = "@gm_setsysvar 变量名 变量值 变量值类型", title = "设置系统变量", default = "4#integer", selectList = "4#integer^string#数字型^字符型"},
    {page = 1, index = 3,  Command = "@gm_inisysvarex 变量名 变量类型", title = "声明系统自定义变量",default = "3#integer", selectList = "3#integer^string#数字型^字符型"},
    {page = 1, index = 4,  Command = "@gm_getsysvarex 变量名", title = "获取系统自定义变量"},
    {page = 1, index = 5,  Command = "@gm_setsysvarex 变量名 变量值 变量值类型 是否保存数据库", title = "设置系统自定义变量", default = "4#integer|5#1", selectList = "4#integer^string#数字型^字符型|5#0^1#不保存^保存"},
    {page = 1, index = 6,  Command = "@gm_sendluamsg 消息id 参数1(int) 参数2(int) 参数3(int) 参数4(str)", title = "请求一条来自服务端的消息", default = "2#996|3#1|4#2|5#3|6#发送消息给客户端",RegisterNetMsg = 2},

    --//玩家
    {page = 2, index = 1,  Command = "@gm_getplayvar 玩家名 变量名", title = "获取玩家变量",pageName = "玩家", default = "2##USER_NAME"},
    {page = 2, index = 2,  Command = "@gm_setplayvar 玩家名 变量名 变量值 变量值类型", title = "设置玩家变量",default = "2##USER_NAME|5#integer", selectList = "5#integer^string#数字型^字符型"},
    {page = 2, index = 3,  Command = "@gm_getplayvarex 玩家名 变量名", title = "获取玩家自定义变量", default = "2##USER_NAME"},
    {page = 2, index = 4,  Command = "@gm_setplayvarex 玩家名 变量名 变量值 变量值类型 是否保存数据库", title = "设置玩家自定义变量", default = "2##USER_NAME|5#integer|6#1", selectList = "5#integer^string#数字型^字符型|6#0^1#不保存^保存"},
    {page = 2, index = 5,  Command = "@gm_jumptoplay 玩家名", title = "跳转到玩家附近"},
    {page = 2, index = 6,  Command = "@gm_bringplay 玩家名", title = "拉玩家到身边"},
    {page = 2, index = 7,  Command = "@gm_giveitem 玩家名 物品名 数量 规则", title = "发送背包道具", default = "2##USER_NAME|4#1|5#0"},
    {page = 2, index = 8,  Command = "@gm_finditem 玩家名 物品名", title = "查找背包道具", default="2##USER_NAME"},
    {page = 2, index = 9,  Command = "@gm_checktitle 玩家名 称号名称", title = "检测玩家称号", default="2##USER_NAME"},
    {page = 2, index = 10, Command = "@gm_addtitle 玩家名 称号名称 是否激活", title = "添加玩家称号", default="2##USER_NAME|4#1",selectList = "4#0^1#不激活^开启激活"},
    {page = 2, index = 11, Command = "@gm_deltitle 玩家名 称号名称", title = "删除玩家称号", default="2##USER_NAME"},
    {page = 2, index = 12, Command = "@gm_checkbuff 玩家名 buffID", title = "检测玩家BUFF", default="2##USER_NAME"},
    {page = 2, index = 13, Command = "@gm_addbuff 玩家名 buffID 时间", title = "添加玩家BUFF1", default="2##USER_NAME"},
    {page = 2, index = 14, Command = "@gm_addbuffex 玩家名 buffID 时间 层数 释放者 额外属性[1#10|4#20]", title = "添加玩家BUFF2", default="2##USER_NAME|5#1|6##USER_NAME"},
    {page = 2, index = 15, Command = "@gm_delbuff 玩家名 buffID", title = "删除玩家BUFF", default="2##USER_NAME"},

    --//地图
    {page = 3, index = 1,  Command = "@gm_mapmove 地图号 X*(非必填) Y*(非必填)", title = "跳转地图",pageName = "地图"},
    {page = 3, index = 2,  Command = "@gm_killmon1 怪物名(*:全清) 是否掉落", title = "全屏清怪(10*10)", default="2#*|3#1",selectList = "3#0^1#不掉落^掉落"},
    {page = 3, index = 3,  Command = "@gm_killmon2 怪物名(*:全清) 是否掉落", title = "地图清怪", default="2#*|3#1",selectList = "3#0^1#不掉落^掉落"},
    {page = 3, index = 4,  Command = "@gm_selectmon 怪物名称", title = "查询当前地图怪物"},
    {page = 3, index = 5,  Command = "@gm_selectplay 玩家名", title = "查询当前地图玩家"},
    {page = 3, index = 6,  Command = "@gm_moveplayers 目标地图号 X Y", title = "转移当前地图玩家(所有)"},

    --//道具
    {page = 4, index = 1,  Command = "@gm_giveitem 玩家名 物品名 数量 规则", title = "发送背包道具", default = "2##USER_NAME|4#1|5#0",pageName = "道具"},
    {page = 4, index = 2,  Command = "@gm_finditem 玩家名 物品名", title = "查找背包道具", default="2##USER_NAME"},
    {page = 4, index = 3,  Command = "@ClearBag 玩家名", title = "清空背包", default="2##USER_NAME"},

    --//NPC
    {page = 5, index = 1,  Command = "@gm_createnpc 地图号 X Y npcID npc名称 外形[appr] 脚本路径[script]", title = "创建临时NPC",pageName = "NPC", default = "2##MAP_ID|3##X|4##Y"},

    --//怪物
    {page = 6, index = 1,  Command = "@gm_genmon 地图号 X Y 怪物名称 范围 数量 颜色", title = "刷怪",pageName = "怪物", default = "2##MAP_ID|3##X|4##Y|6#5|7#1|8#255"},

    --//行会
    {page = 7, index = 1,  Command = "@gm_addguild 玩家名 行会名称", title = "加入行会", pageName = "行会", default="2##USER_NAME"},
    {page = 7, index = 2,  Command = "@gm_delguild 玩家名", title = "退出行会", default="2##USER_NAME"},
    {page = 7, index = 2,  Command = "@gm_setguildlv 玩家名 职务", title = "设置行会职务", default="2##USER_NAME|3#1", selectList = "3#1^2^3^4^5#会长^副会长^行会成员1^行会成员2^行会成员3"},

    --//沙巴克
    {page = 8, index = 1,  Command = "@gm_castleinfo 信息索引", title = "获取沙巴克基本信息",pageName = "沙巴克", default="2#1", selectList = "2#1^2^3^4^5^6#沙城名称^沙城行会名称^沙城行会会长名字^占领天数^当前是否在攻沙^行会副会长列表"},

    --//普通命令[M2]
    {page = 9, index = 1,  Command = "@Date",title = "查看当前服务器日期时间",pageName = "普通命令[M2]"},
    {page = 9, index = 2,  Command = "@PrvMsg",title = "禁止指定人物发的私聊信息"},
    {page = 9, index = 3,  Command = "@AllowMsg",title = "禁止别人向自己发私聊信息"},
    {page = 9, index = 4,  Command = "@LetShout",title = "禁止接收组队聊天信息"},
    {page = 9, index = 5,  Command = "@LetTrade",title = "禁止交易交易物品"},
    {page = 9, index = 6,  Command = "@LetGuild",title = "允许加入行会"},
    {page = 9, index = 7,  Command = "@EndGuild", title = "退出当前所加入的行会"},
    {page = 9, index = 8,  Command = "@BanGuildChat", title = "禁止接收行会聊天信息"},
    {page = 9, index = 9,  Command = "@AuthAlly", title = "许行会进入联盟"},
    {page = 9, index = 10, Command = "@联盟", title = "开始进行行会联盟"},
    {page = 9, index = 11, Command = "@取消联盟", title = "取消行会联盟关系"},
    {page = 9, index = 12, Command = "@Diary", title = "未使用命令"},
    {page = 9, index = 13, Command = "@UserMove", title = "移动地图指定座标需要戴传送装备"},
    {page = 9, index = 14, Command = "@Searching", title = "探测人物所在位置(需要戴传送装备)"},
    {page = 9, index = 15, Command = "@AllowGroupRecall", title = "允许记忆传送命令"},
    {page = 9, index = 16, Command = "@传", title = "千里传音命令格式"},
    {page = 9, index = 17, Command = "@GroupRecall", title = "将组队人员传送到身边(需要戴记忆全套装备)"},
    {page = 9, index = 18, Command = "@AllowGuildRecall", title = "允许行会传送"},
    {page = 9, index = 19, Command = "@GuildRecall", title = "将行会成员传送身边(需要戴行会传送装备)"},
    {page = 9, index = 20, Command = "@UnLockStorage", title = "开启仓库密码锁"},
    {page = 9, index = 21, Command = "@UnLock", title = "开启登录密码锁"},
    {page = 9, index = 22, Command = "@Lock", title = "将仓库密码锁上"},
    {page = 9, index = 23, Command = "@SetPassword", title = "设置仓库密码"},
    {page = 9, index = 24, Command = "@ChgPassword", title = "修改仓库密码"},
    {page = 9, index = 25, Command = "@UnPassword", title = "清除密码(先开锁再清除密码)"},
    {page = 9, index = 26, Command = "@Dear", title = "查询夫妻位置"},
    {page = 9, index = 27, Command = "@AllowDearRecall", title = "允许夫妻传送"},
    {page = 9, index = 28, Command = "@DearRecall", title = "夫妻将对方传送到身边"},
    {page = 9, index = 29, Command = "@Master", title = "查询师徒位置"},
    {page = 9, index = 30, Command = "@AllowMasterRecall", title = "允许师徒传送"},
    {page = 9, index = 31, Command = "@MasterRecall", title = "师父将徒弟召唤到身边"},
    {page = 9, index = 32, Command = "@AttackMode", title = "更换攻击模式(此命令不要修改)"},
    {page = 9, index = 33, Command = "@Rest", title = "宝宝攻击状态(此命令不要修改)"},
    {page = 9, index = 34, Command = "@骑马", title = "带马牌后骑上马"},
    {page = 9, index = 35, Command = "@下马", title = "从马上下来"},
    {page = 9, index = 36, Command = "@LockLogin", title = "开启/关闭登录锁"},
    {page = 9, index = 37, Command = "@SetKfTime", title = "修改开服时间"},
    {page = 9, index = 38, Command = "@Time", title = "显示系统时间"},
    {page = 9, index = 39, Command = "@SetSysVar", title = "修改个人变量"},
    --//管理命令[M2]
    {page = 10, index = 1,  Command = "@ClrPassword", title = "清除人物仓库/登录密码",pageName = "管理命令[M2]"},
    {page = 10, index = 2,  Command = "@Who", title = "查看当前服务器在线人数"},
    {page = 10, index = 3,  Command = "@Total", title = "查看所有服务器在线人数"},
    {page = 10, index = 4,  Command = "@GameMaster", title = "进入/退出管理员模式(进入模式后不会受到任何角色攻击)"},
    {page = 10, index = 5,  Command = "@Observer", title = "进入/退出隐身模式(进入模式后别人看不到自己)"},
    {page = 10, index = 6,  Command = "@Superman", title = "进入/退出无敌模式(进入模式后人物不会死亡)"},
    {page = 10, index = 7,  Command = "@Make", title = "制造指定物品(支持权限分配，小于最大权限受允许、禁止制造列表限制)"},
    {page = 10, index = 8,  Command = "@Supermake", title = "调整自己身上的物品属性"},
    {page = 10, index = 9,  Command = "@ChangeMoney", title = "调整自己身上的货币数量"},
    {page = 10, index = 10, Command = "@SetMissID", title = "设置任务ID"},
    {page = 10, index = 11, Command = "@Move", title = "移动到指定地图(支持权限分配，小于最大权限受受禁止传送地图列表限制)"},
    {page = 10, index = 12, Command = "@PositionMove", title = "移动到指定地图(支持权限分配，小于最大权限受受禁止传送地图列表限制)"},
    {page = 10, index = 13, Command = "@Recall", title = "将指定人物召唤到身边"},
    {page = 10, index = 14, Command = "@ReGoto", title = "跟踪指定人物"},
    {page = 10, index = 15, Command = "@Ting", title = "将指定人物随机传送"},
    {page = 10, index = 16, Command = "@SuperTing", title = "将指定人物身边指定范围内的人物随机传送"},
    {page = 10, index = 17, Command = "@MapMove 源地图号 目标地图号", title = "将整个地图中的人物移动到其它地图中"},
    {page = 10, index = 18, Command = "@Info 人物名称", title = "看人物信息", default = "2##USER_NAME"},
    {page = 10, index = 19, Command = "@HumanLocal 地图号", title = "查询人物IP所在地区(需加载IP地区查询插件)"},
    {page = 10, index = 20, Command = "@ViewWhisper 人物名称", title = "查看指定人物的私聊信息"},
    {page = 10, index = 21, Command = "@MobLevel", title = "查看身边角色信息"},
    {page = 10, index = 22, Command = "@MobCount 地图号", title = "查看地图中怪物数量"},
    {page = 10, index = 23, Command = "@HumanCount", title = "查看身边人数"},
    {page = 10, index = 24, Command = "@Map", title = "显示当前所在地图相关信息"},
    {page = 10, index = 25, Command = "@Level", title = "调整自己的等级"},
    {page = 10, index = 26, Command = "@Kick 人物名称", title = "将指定人物踢下线"},
    {page = 10, index = 27, Command = "@ReAlive 人物名称", title = "将指定人物复活"},
    {page = 10, index = 28, Command = "@Kill 人物名称", title = "将指定人物或怪物杀死(杀怪物时需面对怪物)"},
    {page = 10, index = 29, Command = "@ChangeJob 人物名称 职业类型", title = "调整人物的职业", selectList = "3#Warr^Wizard^Taos#战士^法师^道士"},
    {page = 10, index = 30, Command = "@FreePK 人物名称", title = "清除指定人物的Pk值"},
    {page = 10, index = 31, Command = "@PKpoint 人物名称", title = "查看指定人物的PK值"},
    {page = 10, index = 32, Command = "@IncPkPoint 人物名称 点数", title = "增加指定人物的Pk值"},
    {page = 10, index = 33, Command = "@ChangeGender 人物名称 性别", title = "调整人物的性别", selectList = "3#男^女#男^女"},
    {page = 10, index = 34, Command = "@BonusPoint 人物名称 属性点数", title = "调整人物的属性点数"},
    {page = 10, index = 35, Command = "@DelBonusPoint 人物名称", title = "删除人物的属性点数"},
    {page = 10, index = 36, Command = "@RestBonusPoint 人物名称", title = "将人物的属性点数重新分"},
    {page = 10, index = 37, Command = "@权限 人物名称 权限等级(0-10)", title = "调整人物的权限等级，可以将普通人物升为G权限"},
    {page = 10, index = 38, Command = "@ReNewLevel 人物名称 点数(为空则查看)", title = "调整查看人物的转生等级"},
    {page = 10, index = 39, Command = "@RefineWeapon 攻击力 魔法力 道术 准确度", title = "调整身上武器属性"},
    {page = 10, index = 40, Command = "@AdjustLevel 人物名称 等级", title = "调整指定人物的等级"},
    {page = 10, index = 41, Command = "@AdjustExp 人物名称 经验值", title = "调整指定人物的经验值"},
    {page = 10, index = 42, Command = "@DearName 人物名称 配偶名称如果为(空则清除)", title = "更改指定人物的配偶名称"},
    {page = 10, index = 43, Command = "@MasterName 人物名称 师徒名称(空则清除)", title = "更改指定人物的师徒名称"},
    {page = 10, index = 44, Command = "@RecallMob 怪物名称 数量 召唤等级", title = "召唤指定怪物为宝宝"},
    {page = 10, index = 45, Command = "@Training 人物名称 技能名称 修炼等级(0-3)", title = "调整人物的技能修炼等级"},
    {page = 10, index = 46, Command = "@s 人物名称 技能名称 修炼等级(0-3)", title = "给指定人物增加技能"},
    {page = 10, index = 47, Command = "@DeleteSkill 人物名称 技能名称(All)", title = "删除人物的技能"},
    {page = 10, index = 48, Command = "@DeleteItem 人物名称 物品名称 数量", title = "删除人物身上指定的物品"},
    {page = 10, index = 49, Command = "@ClearMission 人物名称", title = "清除人物的任务标志"},
    {page = 10, index = 50, Command = "@AddGuild 行会名称 掌门人", title = "新建一个行会"},
    {page = 10, index = 51, Command = "@DelGuild 行会名称", title = "删除一个行会"},
    {page = 10, index = 52, Command = "@ChangeSabukLord 行会名称", title = "更改城堡所属行会"},
    {page = 10, index = 53, Command = "@ForcedWallconquestWar", title = "强行开始/停止攻城战"},
    {page = 10, index = 54, Command = "@ContestPoint 行会名称", title = "查看行会争霸赛得分情况"},
    {page = 10, index = 55, Command = "@StartContest", title = "开始行会争霸赛"},
    {page = 10, index = 56, Command = "@EndContest", title = "结束行会争霸赛"},
    {page = 10, index = 57, Command = "@Mob 怪物名称 数量", title = "在身边放置指定类型数量的怪物"},
    {page = 10, index = 58, Command = "@Mission X Y", title = "设置怪物的集中点(举行怪物攻城用)"},
    {page = 10, index = 59, Command = "@MobPlace Y Y 怪物名称 怪物数量", title = "在当前地图指定XY放置怪物"},
    {page = 10, index = 60, Command = "@ClearMon 地图号(`*`为所有) 怪物名称(`*`为所有) 掉物品(0,1)", default="2#*|3#*|4#0", title = "清除地图中的怪物"},
    {page = 10, index = 61, Command = "@DisableSendMsg 人物名称", title = "将指定人物加入发言过滤列表"},
    {page = 10, index = 62, Command = "@EnableSendMsg 人物名称", title = "将指定人物从发言过滤列表中移除"},
    {page = 10, index = 63, Command = "@DisableSendMsgList", title = "查看发言过滤列表中的内容"},
    {page = 10, index = 64, Command = "@Shutup 人物名称", title = "将指定人物禁言"},
    {page = 10, index = 65, Command = "@ReleaseShutup 人物名称", title = "将指定人物从禁言列表中删除"},
    {page = 10, index = 66, Command = "@ShutupList", title = "查看禁言列表中的内容"},
    {page = 10, index = 67, Command = "@SabukWallGold", title = "查看城堡金币数"},
    {page = 10, index = 68, Command = "StartQuest 问答名称", title = "开始提问功能"},
    {page = 10, index = 69, Command = "@DenyIPLogon IP地址 是否永久封(0,1)", title = "将指定IP地址加入禁止登录列表"},
    {page = 10, index = 70, Command = "@DenyAccountLogon 登录帐号 是否永久封(0,1)", title = "将指定登录帐号加入禁止登录列表"},
    {page = 10, index = 71, Command = "@DenyCharNameLogon 人物名称 是否永久封(0,1)", title = "将指定人物名称加入禁止登录列表"},
    {page = 10, index = 72, Command = "@DelDenyIPLogon", title = "将指定IP地址从禁止登录列表中删除"},
    {page = 10, index = 73, Command = "@DelDenyAccountLogon", title = "将指定登录帐号从禁止登录列表中删除"},
    {page = 10, index = 74, Command = "@DelDenyCharNameLogon", title = "将指定人物名称从禁止登录列表中删除"},
    {page = 10, index = 75, Command = "@ShowDenyIPLogon", title = "显示禁止列表中的IP"},
    {page = 10, index = 76, Command = "@ShowDenyAccountLogon", title = "显示禁止列表中的登录帐号"},
    {page = 10, index = 77, Command = "@ShowDenyCharNameLogon", title = "显示禁止列表中的人物名称"},
    {page = 10, index = 78, Command = "@SetMapMode", title = "设置地图模式"},
    {page = 10, index = 79, Command = "@ShowMapMode", title = "显示地图模式"},
    --//调试命令[M2]
    {page = 11, index = 1,  Command = "@ReloadAdmin", title = "重新加载管理员列表",pageName = "调试命令[M2]"},
    {page = 11, index = 2,  Command = "@ReloadNpc", title = "重新加载NPC脚本"},
    {page = 11, index = 3,  Command = "@ReloadManage", title = "重新加载登录脚本(无参数加载QManage,任意参数加载QFunction)"},
    {page = 11, index = 4,  Command = "@ReloadRobotManage", title = "重新加载机器人配置"},
    {page = 11, index = 5,  Command = "@ReloadRobot", title = "重新加载机器人脚本"},
    {page = 11, index = 6,  Command = "@ReloadMonItems", title = "重新加载怪物爆率配置"},
    {page = 11, index = 7,  Command = "@ReloadItemDB", title = "重新加载物品数据库"},
    {page = 11, index = 8,  Command = "@ReloadMonsterDB", title = "重新加载怪物数据库"},
    {page = 11, index = 9,  Command = "@ReLoadMinMap", title = "重新加载小地图配置"},
    {page = 11, index = 10, Command = "@ClearBag", title = "清除背包全部物品(选参数 人物名称 如果为空是表示自己)"},
    {page = 11, index = 11, Command = "@ReloadLineNotice", title = "重新加载游戏公告信息"},
    {page = 11, index = 12, Command = "@ReloadNotice", title = "重新加载欢迎公告信息"},
    {page = 11, index = 13, Command = "@ReloadAbuse", title = "重新加载脏话过滤配置"},
    {page = 11, index = 14, Command = "Backstep 人物名称 步数", title = "让指定人物,后退指定步数"},
    {page = 11, index = 15, Command = "@Reconnection", title = "将指定人物重新切换网络连接"},
    {page = 11, index = 16, Command = "@DisableFilter", title = "禁用脏话过滤功能"},
    {page = 11, index = 17, Command = "@MapInfo", title = "显示地图信息"},
}
return config