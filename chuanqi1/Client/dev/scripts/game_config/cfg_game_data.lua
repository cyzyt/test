local config = {
    ["AbilityCalMode"] = {
        k="AbilityCalMode",
        notice="老传奇属性模式=0 1=以前百分比叠加模式（2021年5月7号之前正式上线的版本，请设置成1，不然属性错乱，以后做版本的GM请用0以后慢慢的会取消掉这个功能统一走老传奇模式）",
        value=1,
    },
    ["BackpackGuide"] = {
        k="BackpackGuide",
        notice="背包装备佩戴按钮#背包道具分解按钮(0=关闭 1=开启)#StdMode分类#StdMode分类#",
        value="1#1#41|42|43|44",
    },
    ["BuiltinCD"] = {
        k="BuiltinCD",
        notice="内挂吃药基础时间(普通红药CD#普通蓝药CD#瞬回药CD#回城卷CD)",
        value="1000#1000#2000#2000",
    },
    ["EXPcoordinate"] = {
        k="EXPcoordinate",
        notice="经验显示坐标(PC端X坐标#PC端Y坐标|移动端X坐标#移动端Y坐标|前景色#背景色|最低经验显示)",
        value="10#450|10#300|250#0|2000",
    },
    ["Elite_Challenge_time"] = {
        k="Elite_Challenge_time",
        notice="勇士试炼次数",
        value=3,
    },
    ["Elite_DayChallenge_Starprobability"] = {
        k="Elite_DayChallenge_Starprobability",
        notice="不同星级日常精英挑战任务刷新几率",
        value="70#25#5",
    },
    ["Elite_DayChallenge_consumption"] = {
        k="Elite_DayChallenge_consumption",
        notice="刷新日常精英挑战任务消耗道具",
        value=304,
    },
    ["Elite_DayChallenge_time"] = {
        k="Elite_DayChallenge_time",
        notice="日常精英挑战次数",
        value=3,
    },
    ["Fashionexplicit"] = {
        k="Fashionexplicit",
        notice="第一次登录装外显是否自动勾选 0=不勾选 1=勾选",
        value=0,
    },
    ["Fashionfx"] = {
        k="Fashionfx",
        notice="时装裸模(0默认开启 1关闭) 后期取消这个功能,做成自定义UI的临时使用目前",
        value=1,
    },
    ["Found_Faction"] = {
        k="Found_Faction",
        notice="创建行会所需要消耗的道具#数量#商城id|创建行会所需要消耗的道具#数量#商城id",
        value="118#1#17|1#1000000#27",
    },
    ["GUILD_EXIT_CD"] = {
        k="GUILD_EXIT_CD",
        notice="主动退出行会下次申请行会的CD时间（秒）",
        value=3600,
    },
    ["GUILD_limit"] = {
        k="GUILD_limit",
        notice="限制条件ID|条件限制ID",
        value="38|42|46|50|55",
    },
    ["Hangxuan"] = {
        k="Hangxuan",
        notice="行会宣战开关 0关闭 1开启",
        value=0,
    },
    ["Heronuqitiao"] = {
        k="Heronuqitiao",
        notice="默认0=圆形怒气条 1=竖形怒气条",
        value=0,
    },
    ["Heroqiehuan"] = {
        k="Heroqiehuan",
        notice="1=战斗 2=跟随 3=休息 4=守护(最低配置三个状态)",
        value="1#2#3",
    },
    ["Heroqiehuanmoshi"] = {
        k="Heroqiehuanmoshi",
        notice="默认0拖屏模式 1=双击切换模式",
        value=0,
    },
    ["HumanPaperback"] = {
        k="HumanPaperback",
        notice="人物简装 (战士衣服#战士武器|法师衣服#法师武器|道士衣服#道士武器)",
        value="6#32|7#31|8#33",
    },
    ["Integratedfashion"] = {
        k="Integratedfashion",
        notice="(斗笠#发型) 一体时装是否斗笠和发型  0默认显示 1=不显示",
        value="1#1",
    },
    ["Maincity_limit"] = {
        k="Maincity_limit",
        notice="不同服务器阶段主城以及进入限制",
        value="6#2300001|bsr03#2300002",
    },
    ["MiniMap"] = {
        k="MiniMap",
        notice="X坐标#Y坐标#宽#高     (只针对移动端)",
        value="0#50#653#476",
    },
    ["MonsterPaperback"] = {
        k="MonsterPaperback",
        notice="怪物简装",
        value=27,
    },
    ["Monsterlevel"] = {
        k="Monsterlevel",
        notice="内挂显示职业等级，是否显示怪物等级 0=不显示 1=显示",
        value=1,
    },
    ["NewKfDay"] = {
        k="NewKfDay",
        notice="0默认为24小时算一天  1=天数模式超过00：00为第二天",
        value=1,
    },
    ["NoBJSkillID"] = {
        k="NoBJSkillID",
        notice="技能禁止暴击 多个技能#分割 (技能ID#技能ID#技能ID)",
        value=22,
    },
    ["NoShowItemDropEff"] = {
        k="NoShowItemDropEff",
        value=0,
    },
    ["OpenAuctionByP"] = {
        k="OpenAuctionByP",
        notice="关闭PC端快捷键P 1=关闭",
        value=1,
    },
    ["RankingList"] = {
        k="RankingList",
        notice="排行榜显示 (排序#显示名称 1#等级|2#战士|3#法师|4#道士)",
        value="1#等级",
    },
    ["Redtips"] = {
        k="Redtips",
        notice="界面红点提示图片位置(PC端|移动端)",
        value="res\\public\\btn_npcfh_04.png|res\\public\\btn_npcfh_03.png",
    },
    ["StallName"] = {
        k="StallName",
        notice="默认摆摊的名称",
        value="<$USERNAME>的摊位",
    },
    ["SuitCalType"] = {
        k="SuitCalType",
        notice="套装(0=老套装模式 1=新套装模式)",
        value=0,
    },
    ["SuitCalcType"] = {
        k="SuitCalcType",
        notice="0先属性点后百分 1先百分比后属性点",
        value=0,
    },
    ["alliance"] = {
        k="alliance",
        notice="结盟花费itemid#num",
        value="1#1#20000&2#1#30000&6#1#50000&12#1#80000&24#1#100000",
    },
    ["alliance_time"] = {
        k="alliance_time",
        notice="结盟时长",
        value="1#2#6#12#24",
    },
    ["announce"] = {
        k="announce",
        notice="默认公告",
        value="行会的兄弟们：\\n 1.注意完成行会任务获得金珠和\\n 元宝！\\n2.留意下攻沙时间，记得准时上\\n 线一起攻沙！\\n3.每天记得完成工资任务领金珠和\\n 红薯！",
    },
    ["attackglobalCD"] = {
        k="attackglobalCD",
        notice="客户端攻击间隔",
        value=100,
    },
    ["auto_equip_quality"] = {
        k="auto_equip_quality",
        notice="自动穿戴的装备品质(低于这个品质的都会自动穿戴，时间固定5秒)",
        value=999,
    },
    ["auto_task_time"] = {
        k="auto_task_time",
        notice="自动进行任务的时间（单位：毫秒）",
        value=500,
    },
    ["autousetimes"] = {
        k="autousetimes",
        notice="自动穿戴倒计时时间设置,单位秒",
        value=5,
    },
    ["avoid_injury"] = {
        k="avoid_injury",
        notice="战士受怪物物理免伤#战士受怪物魔法免伤#战士受战士伤害降低#战士受法师伤害降低#战士受道士伤害降低#法师受怪物物理免伤#法师受怪物魔法免伤#法师受战士伤害降低#法师受法师伤害降低#法师受道士伤害降低#道士受怪物物理免伤#道士受怪物魔法免伤#道士受战士伤害降低#道士受法师伤害降低#道士受道士伤害降低",
        value="30#5#4#0#0#3#20#0#0#15#16#16#18#15#15",
    },
    ["boxtexiao"] = {
        k="boxtexiao",
        notice="宝箱特效",
        value="15#4531#4511#4512|16#4531#4513#4514|17#4532#4515#4516|18#4533#4517#4518|18#4530#4519#4520|",
    },
    ["buttonSmall"] = {
        k="buttonSmall",
        notice="小退按钮等待时间(大于0有时间等待)",
        value=3,
    },
    ["cangbaotu_backroom_reward"] = {
        k="cangbaotu_backroom_reward",
        notice="第一档藏宝图大秘境(藏宝图ID&boxid#boxid#boxid#boxid#boxid#boxid|藏宝图ID&boxid#boxid#boxid#boxid#boxid#boxid）",
        value="248&10002#10002#10002#10002#10003#10003#10003#10003#10003#10004#10004#10005|249&10006#10006#10006#10006#10006#10007#10007#10007#10007#10007#10007#10008",
    },
    ["cangbaotu_boss_position_1"] = {
        k="cangbaotu_boss_position_1",
        notice="藏宝图地图进入坐标",
        value="14#15",
    },
    ["cangbaotu_boss_position_2"] = {
        k="cangbaotu_boss_position_2",
        notice="藏宝图副本刷怪坐标",
        value="14#15",
    },
    ["cangbaotu_boss_position_3"] = {
        k="cangbaotu_boss_position_3",
        notice="藏宝大秘籍宝箱坐标",
        value="11#11|14#11|17#11|11#14|14#14|17#14|11#17|14#17|17#17|11#20|14#20|17#20",
    },
    ["cangbaotu_caijitime"] = {
        k="cangbaotu_caijitime",
        notice="宝箱采集时间",
        value=5,
    },
    ["cangbaotu_item_Announce_1"] = {
        k="cangbaotu_item_Announce_1",
        notice="藏宝图挖到这些道具需要公告（公告id|道具id#道具id）直接拾取",
        value="380|149#150",
    },
    ["cangbaotu_item_Announce_2"] = {
        k="cangbaotu_item_Announce_2",
        notice="藏宝图挖到这些道具需要公告（公告id|道具id#道具id）刷BOSS",
        value="381|1005302",
    },
    ["cangbaotu_item_Announce_3"] = {
        k="cangbaotu_item_Announce_3",
        notice="藏宝图挖到这些道具需要公告（公告id|道具id#道具id）副本BOSS",
        value="382|1005302",
    },
    ["cangbaotu_item_Announce_4"] = {
        k="cangbaotu_item_Announce_4",
        notice="藏宝图挖到这些道具需要公告（公告id|道具id#道具id）古墓挖宝",
        value="383|1015730#1019730#1026730#1022730#1064730#1062730#1115730#1119730#1126730#1122730#1164730#1162730#1106730#1215730#1219730#1226730#1222730#1264730#1262730",
    },
    ["cangbaotu_key"] = {
        k="cangbaotu_key",
        notice="藏宝图钥匙快捷购买商城ID",
        value=30,
    },
    ["cangbaotu_mapid"] = {
        k="cangbaotu_mapid",
        notice="藏宝图随机地图id",
        value="0|3|11|4",
    },
    ["cangbaotufanwei"] = {
        k="cangbaotufanwei",
        notice="挖宝范围",
        value=5,
    },
    ["chuanyin_item"] = {
        k="chuanyin_item",
        notice="传音消耗道具",
        value=302,
    },
    ["consignments_pay_Term"] = {
        k="consignments_pay_Term",
        notice="寄售行_购买等级、转生限制；在不同的开服天数，购买所需的条件不同；（开服天数下限#等级下限#转生等级下限）（按从小到大天数依次填写，最大不能超过100）（与交易限制类似）",
        value="1#30#0;2#30#0;7#40#0;9#50#0;21#60#0;43#70#0;73#80#0",
    },
    ["consignments_pay_need"] = {
        k="consignments_pay_need",
        notice="寄售行_购买的条件",
    },
    ["consignments_putaway_LEVEL"] = {
        k="consignments_putaway_LEVEL",
        notice="寄售行_上架时角色等级限制",
        value=30,
    },
    ["consignments_putaway_need"] = {
        k="consignments_putaway_need",
        notice="寄售行_上架时条件",
        value=100020,
    },
    ["consignments_putaway_pay"] = {
        k="consignments_putaway_pay",
        notice="寄售行_上架费用 金币",
        value=10000,
    },
    ["consignments_putaway_price_floor"] = {
        k="consignments_putaway_price_floor",
        notice="寄售行_上架时设置的下限和上限（元宝）",
        value="1#100000",
    },
    ["consignments_putaway_price_gold"] = {
        k="consignments_putaway_price_gold",
        notice="寄售行_上架时设置的下限和上限（金币）",
        value="10000#100000000",
    },
    ["consignments_putaway_time"] = {
        k="consignments_putaway_time",
        notice="寄售行_上架时间（秒）",
        value=86400,
    },
    ["consignments_service_charge"] = {
        k="consignments_service_charge",
        notice="寄售行_售出后收取的手续费抽成（收取的手续费 = 售出的元宝 * 手续费抽成）向下取整（元宝）,金币的也是这个交易税，直接扣（百分比）",
        value=10,
    },
    ["consignments_service_charge_Upper"] = {
        k="consignments_service_charge_Upper",
        notice="寄售行_售出后收取的手续费抽成的上限（元宝）",
        value=99999999,
    },
    ["consignments_service_charge_floor"] = {
        k="consignments_service_charge_floor",
        notice="寄售行_售出后收取的手续费抽成的下限（元宝）",
        value=1,
    },
    ["consignments_shelves"] = {
        k="consignments_shelves",
        notice="寄售行_普通寄售栏位",
        value=8,
    },
    ["currency_shield"] = {
        k="currency_shield",
        notice="前端屏蔽货币提示消耗",
        value="10|14",
    },
    ["declareWar"] = {
        k="declareWar",
        notice="宣战花费itemid#num",
        value="2#1#100000&4#1#200000&8#1#300000&12#1#500000",
    },
    ["declareWar_time"] = {
        k="declareWar_time",
        notice="宣战时长",
        value="2#4#8#12",
    },
    ["drug_tips"] = {
        k="drug_tips",
        notice="内挂药品备注",
        value="<普通红药：/FCOLOR=255><金创药/FCOLOR=251>\\<普通蓝药：/FCOLOR=255><魔法药/FCOLOR=251>\\<瞬回药：/FCOLOR=255><万年雪霜/FCOLOR=251>",
    },
    ["exp_max"] = {
        k="exp_max",
        notice="存储经验上限",
        value=2000000000,
    },
    ["fridndnumberlimit"] = {
        k="fridndnumberlimit",
        notice="好友数量上限",
        value=100,
    },
    ["gold_guildexp"] = {
        k="gold_guildexp",
        notice="最低1000金币#可兑换1荣誉|最低1000金币#可兑换10行会建设度|每日捐献上限",
        value="1000#1|1000#10|1000000",
    },
    ["guaiwugongcheng"] = {
        k="guaiwugongcheng",
        notice="怪物攻城活动地图#怪物刷新时间（秒）",
        value="3#30",
    },
    ["guaiwugongcheng_1"] = {
        k="guaiwugongcheng_1",
        notice="怪物攻城刷怪中心坐标以及区域大小",
        value="296#335|160",
    },
    ["guaiwugongcheng_2"] = {
        k="guaiwugongcheng_2",
        notice="怪物攻城怪物ID怪物id|怪物id",
        value="蝎子王|雪蚕王|蛤蟆王|电僵王|楔蛾王|暗之触龙神|半兽勇士9|邪恶钳虫2|红野猪3|黑野猪3|蝎蛇3|幻影蜘蛛|血金刚|带刀护卫|赤血恶魔|灰血恶魔|赤月恶魔1|暴牙蜘蛛|暴牙蜘蛛0|血僵尸",
    },
    ["guild_updata"] = {
        k="guild_updata",
        notice="行会等级#行会人数上限|行会等级#行会人数上限|行会等级#行会人数上限",
        value="1#2#0|2#100#9999|3#150#99999",
    },
    ["heroLoginBtnoffset"] = {
        k="heroLoginBtnoffset",
        notice="英雄头像和召唤按钮都在左边，刘海屏幕是否按钮一起偏移 1=一起偏移 0=不偏移",
        value=0,
    },
    ["isShowAttributeTips"] = {
        k="isShowAttributeTips",
        notice="有值=显示属性变化飘字 不配置=不显示",
        value=1,
    },
    ["isSingleJob"] = {
        k="isSingleJob",
        notice=" 是否随机职业",
        value=0,
    },
    ["itemSacle"] = {
        k="itemSacle",
        notice="移动端道具Icon缩放（默认1.3）|PC端道具Icon缩放（默认1.0）",
        value="1.3|1.0",
    },
    ["jinzhusancai"] = {
        k="jinzhusancai",
        notice="苍月岛宝箱活动地图|怪物id",
        value="5|夕",
    },
    ["level_max"] = {
        k="level_max",
        notice="角色等级上限",
        value=200,
    },
    ["magicglobalCD"] = {
        k="magicglobalCD",
        notice="客户端施法间隔",
        value=200,
    },
    ["noDigMonsters"] = {
        k="noDigMonsters",
        notice="移动不提示挖肉图标的怪物ID",
    },
    ["paihangbang_title_1"] = {
        k="paihangbang_title_1",
        notice="玩家成为职业排行榜第一时的通告（战士|法师|道士）",
        value="384|385|386",
    },
    ["prompt"] = {
        k="prompt",
        notice="背包满物品如:(聚灵珠(大)提示红点(PC端#X坐标#Y坐标#缩放比例|移动端#X坐标#Y坐标#缩放比例)",
        value="res\\public\\btn_npcfh_04.png#5#1#0.6|res\\public\\btn_npcfh_04.png#10#-7#1",
    },
    ["staticSacle"] = {
        k="staticSacle",
        notice="剑甲内观缩放（移动段默认1.44，PC端1.0）  移动端|PC端",
        value="1.0|1.0",
    },
    ["team_num"] = {
        k="team_num",
        notice="组队人数上限",
        value=10,
    },
    ["transaction_limit"] = {
        k="transaction_limit",
        notice="交易限制 开服天数下限#等级下限#转生等级下限",
        value="1#1000020#0|2#1000030#0|5#1000040#0|8#0#300001",
    },
    ["union_shop_announce"] = {
        k="union_shop_announce",
        notice="行会商店出售和兑换公告条件 天数#品质下限|天数#品质下限",
        value="1#5|7#8",
    },
    ["union_shop_flsh"] = {
        k="union_shop_flsh",
        notice="行会商店数量刷新时间（整点）",
        value=0,
    },
    ["union_shop_limit"] = {
        k="union_shop_limit",
        notice="行会商店存储数量上限",
        value=300,
    },
    ["union_warehouse_time"] = {
        k="union_warehouse_time",
        notice="新加入行会使用行会仓库所需间隔时间（天#秒&天2#秒2.....）",
        value="4#180&5#240&6#360&7#1720",
    },
    ["warehouse_expansion"] = {
        k="warehouse_expansion",
        notice="道具#数量#扩充的格子数",
        value="279#1#8",
    },
    ["warehouse_max_num"] = {
        k="warehouse_max_num",
        notice="总仓库格子数(48为一页，这个基于面板固定)",
        value=240,
    },
    ["warehouse_num"] = {
        k="warehouse_num",
        notice="免费给玩家的仓库格子",
        value=24,
    },
    ["zhuizongcost"] = {
        k="zhuizongcost",
        notice="追踪仇人消耗：道具id#数量|货币id#数量",
        value="321#1|3#2",
    },
}
return config
