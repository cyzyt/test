local config = { 
	[1] = { 
		Idx=1,
		name="生命值",
		nbvalue="4680#14040#7020",
		type=1,
		desc="生命值",
		isshow=1,
		sort=11,
	},
	[2] = { 
		Idx=2,
		name="魔法值",
		nbvalue="11640#1838#3492",
		type=1,
		desc="魔法值",
		isshow=1,
		sort=12,
	},
	[3] = { 
		Idx=3,
		name="攻击下限",
		nbvalue="43200#1#1",
		type=1,
		desc="战士的核心属性，决定物理伤害",
		isshow=1,
		sort=3,
	},
	[4] = { 
		Idx=4,
		name="攻击上限",
		nbvalue="43200#1#1",
		type=1,
		desc="战士的核心属性，决定物理伤害",
		isshow=1,
		sort=3,
	},
	[5] = { 
		Idx=5,
		name="魔法下限",
		nbvalue="0#43200#0",
		type=1,
		desc="法师的核心属性，决定魔法伤害",
		isshow=1,
		sort=4,
	},
	[6] = { 
		Idx=6,
		name="魔法上限",
		nbvalue="0#43200#0",
		type=1,
		desc="法师的核心属性，决定魔法伤害",
		isshow=1,
		sort=4,
	},
	[7] = { 
		Idx=7,
		name="道术下限",
		nbvalue="0#0#43200",
		type=1,
		desc="道士的核心属性，决定道术伤害",
		isshow=1,
		sort=5,
	},
	[8] = { 
		Idx=8,
		name="道术上限",
		nbvalue="0#0#43200",
		type=1,
		desc="道士的核心属性，决定道术伤害",
		isshow=1,
		sort=5,
	},
	[9] = { 
		Idx=9,
		name="防御下限",
		nbvalue="13200#14400#14400",
		type=1,
		desc="抵抗受到的物理伤害",
		isshow=1,
		sort=1,
	},
	[10] = { 
		Idx=10,
		name="防御上限",
		nbvalue="19200#21600#21600",
		type=1,
		desc="抵抗受到的物理伤害",
		isshow=1,
		sort=1,
	},
	[11] = { 
		Idx=11,
		name="魔防下限",
		nbvalue="14400#14400#14400",
		type=1,
		desc="抵抗受到的魔法伤害",
		isshow=1,
		sort=2,
	},
	[12] = { 
		Idx=12,
		name="魔防上限",
		nbvalue="21600#21600#21600",
		type=1,
		desc="抵抗受到的魔法伤害",
		isshow=1,
		sort=2,
	},
	[13] = { 
		Idx=13,
		name="准确",
		nbvalue="20000#20000#20000",
		type=1,
		desc="物理攻击的命中概率",
		isshow=1,
		sort=9,
	},
	[14] = { 
		Idx=14,
		name="敏捷",
		nbvalue="20000#20000#20000",
		type=1,
		desc="闪避受到的物理攻击",
		isshow=1,
		sort=10,
	},
	[15] = { 
		Idx=15,
		name="魔法躲避",
		nbvalue="11520#11520#11520",
		type=3,
		desc="闪避受到的魔法攻击",
		isshow=2,
		sort=13,
	},
	[16] = { 
		Idx=16,
		name="毒物躲避",
		nbvalue="11520#11520#11520",
		type=3,
		desc="增加人物中毒和麻痹躲避几率",
		isshow=2,
		sort=14,
	},
	[17] = { 
		Idx=17,
		name="中毒恢复",
		nbvalue="11520#11520#11520",
		type=3,
		desc="缩减中毒时间和麻痹时间",
		isshow=2,
		sort=15,
	},
	[18] = { 
		Idx=18,
		name="体力恢复",
		nbvalue="11520#11520#11520",
		type=3,
		desc="提高人物生命值恢复效果",
		isshow=2,
		sort=16,
	},
	[19] = { 
		Idx=19,
		name="魔法恢复",
		nbvalue="11520#11520#11520",
		type=3,
		desc="提高人物魔法值恢复效果",
		isshow=2,
		sort=17,
	},
	[20] = { 
		Idx=20,
		name="攻击速度",
		nbvalue="100#100#100",
		type=1,
		desc="影响角色攻击速度(关联M2-游戏参数-游戏速度-攻速减免时间)",
		isshow=2,
		sort=6,
	},
	[21] = { 
		Idx=21,
		name="暴击几率增加",
		nbvalue="159600#159600#159600",
		type=3,
		desc="攻击时触发暴击的概率",
		isshow=2,
		scolor=254,
		sort=18,
		ys=1,
	},
	[22] = { 
		Idx=22,
		name="暴击伤害增加",
		nbvalue="15960#15960#15960",
		type=3,
		desc="暴击时的伤害",
		isshow=2,
		scolor=254,
		sort=28,
		ys=1,
	},
	[23] = { 
		Idx=23,
		name="韧性",
		nbvalue="159600#159600#159600",
		type=3,
		desc="降低被暴击概率(对方暴击几率-自己暴击抵抗=对方实际暴击几率)",
		isshow=2,
		sort=999,
	},
	[24] = { 
		Idx=24,
		name="暴击抵抗",
		nbvalue="63600#63600#63600",
		type=3,
		desc="降低受到的暴击伤害比例(关联22号暴击伤害增加，引擎默设置的倍率则不会抵抗)",
		isshow=2,
		sort=999,
	},
	[25] = { 
		Idx=25,
		name="增加攻击伤害",
		nbvalue="259200#259200#259200",
		type=3,
		desc="增加造成的伤害",
		isshow=2,
		scolor=254,
		sort=20,
		ys=1,
	},
	[26] = { 
		Idx=26,
		name="物理伤害减少",
		nbvalue="259200#259200#259200",
		type=3,
		desc="减少受到的物理伤害",
		isshow=2,
		scolor=254,
		sort=21,
		ys=1,
	},
	[27] = { 
		Idx=27,
		name="魔法伤害减少",
		nbvalue="259200#259200#259200",
		type=3,
		desc="减少受到的魔法伤害",
		isshow=2,
		scolor=254,
		sort=22,
		ys=1,
	},
	[28] = { 
		Idx=28,
		name="忽视目标防御",
		nbvalue="100#100#100",
		type=3,
		desc="攻击时几率无视对方的防御力(战士隔位技能无效gamedata参数UseNewHitDmgType配置开启)",
		isshow=2,
		scolor=254,
		sort=23,
		ys=1,
	},
	[29] = { 
		Idx=29,
		name="所有伤害反弹",
		nbvalue="100#100#100",
		type=3,
		desc="被攻击时反弹一定的伤害",
		isshow=2,
		scolor=254,
		sort=24,
		ys=1,
	},
	[30] = { 
		Idx=30,
		name="人物体力增加",
		nbvalue="100#100#100",
		type=3,
		desc="增加一定比例的生命",
		isshow=2,
		scolor=254,
		sort=26,
		ys=1,
	},
	[31] = { 
		Idx=31,
		name="人物魔力增加",
		nbvalue="100#100#100",
		type=3,
		desc="增加一定比例的魔法",
		isshow=2,
		scolor=254,
		sort=27,
		ys=1,
	},
	[32] = { 
		Idx=32,
		name="增加目标爆率",
		nbvalue="100#100#100",
		type=3,
		desc="提高击杀玩家的爆装几率",
		isshow=2,
		scolor=254,
		sort=25,
		ys=1,
	},
	[33] = { 
		Idx=33,
		name="爆率降低",
		nbvalue="100#100#100",
		type=3,
		desc="降低死亡时的爆装几率",
		isshow=2,
		sort=999,
	},
	[34] = { 
		Idx=34,
		name="吸血",
		nbvalue="100#100#100",
		type=2,
		desc="回复一定攻击比例的生命",
		isshow=2,
		sort=999,
	},
	[35] = { 
		Idx=35,
		name="攻魔道伤",
		nbvalue="100#100#100",
		type=2,
		desc="攻击/魔法/道术提升一定比例按职业增加对应属性",
		isshow=2,
		sort=999,
	},
	[36] = { 
		Idx=36,
		name="防御加成",
		nbvalue="100#100#100",
		type=2,
		desc="防御提升一定比例",
		isshow=2,
		sort=999,
	},
	[37] = { 
		Idx=37,
		name="魔防加成",
		nbvalue="100#100#100",
		type=2,
		desc="魔防提升一定比例",
		isshow=2,
		sort=999,
	},
	[38] = { 
		Idx=38,
		name="神圣",
		nbvalue="100#100#100",
		type=1,
		desc="神圣对不死系怪物每1点神圣额外打掉怪物1点血量(cfg_monster表字段Undead0=死系;1=不死系)",
		isshow=2,
		sort=8,
	},
	[39] = { 
		Idx=39,
		name="幸运",
		nbvalue="100#100#100",
		type=1,
		desc="提高攻击时发挥的最低伤害",
		isshow=2,
		sort=7,
	},
	[40] = { 
		Idx=40,
		name="无效属性",
		nbvalue="100#100#100",
		type=2,
		desc="无效属性",
		isshow=2,
		sort=999,
	},
	[41] = { 
		Idx=41,
		name="无效属性",
		nbvalue="100#100#100",
		type=2,
		desc="无效属性",
		isshow=2,
		sort=999,
	},
	[42] = { 
		Idx=42,
		name="怒气恢复增加",
		nbvalue="100#100#100",
		type=1,
		desc="英雄版本属性(关联M2-英雄设置-怒气槽每次增加值注:人物+英雄=当前加成)",
		isshow=0,
		sort=999,
	},
	[43] = { 
		Idx=43,
		name="合击威力增加",
		nbvalue="100#100#100",
		type=3,
		desc="英雄版本属性(当设置主号时主号合击伤害提升,设置英雄时英雄合击伤害提升)",
		isshow=0,
		sort=999,
	},
	[44] = { 
		Idx=44,
		name="怪物暴率",
		nbvalue="100#100#100",
		type=2,
		desc="该属性只针对新爆率cfg_boss_drop.xls生效，具体说明参考说明书",
		isshow=0,
		sort=999,
	},
	[45] = { 
		Idx=45,
		name="防止麻痹",
		nbvalue="100#100#100",
		type=2,
		isshow=0,
		sort=999,
	},
	[46] = { 
		Idx=46,
		name="防止护身",
		nbvalue="100#100#100",
		type=2,
		desc="对ChangeModeEx命令有效果",
		isshow=0,
		sort=999,
	},
	[47] = { 
		Idx=47,
		name="防止复活",
		nbvalue="100#100#100",
		type=2,
		desc="对ChangeModeEx命令有效果",
		isshow=0,
		sort=999,
	},
	[48] = { 
		Idx=48,
		name="防止全毒",
		nbvalue="100#100#100",
		type=2,
		desc="对RangeHarm命令无效",
		isshow=0,
		sort=999,
	},
	[49] = { 
		Idx=49,
		name="防止诱惑",
		nbvalue="100#100#100",
		type=2,
		desc="宝宝防止法师诱惑之光",
		isshow=0,
		sort=999,
	},
	[50] = { 
		Idx=50,
		name="防止火墙",
		nbvalue="100#100#100",
		type=2,
		desc="人物在火墙走动无伤害",
		isshow=0,
		sort=999,
	},
	[51] = { 
		Idx=51,
		name="防止冰冻",
		nbvalue="100#100#100",
		type=2,
		desc="对RangeHarm命令无效",
		isshow=0,
		sort=999,
	},
	[52] = { 
		Idx=52,
		name="防止蛛网",
		nbvalue="100#100#100",
		type=2,
		desc="对RangeHarm命令无效",
		isshow=0,
		sort=999,
	},
	[54] = { 
		Idx=54,
		name="对战增伤",
		nbvalue="100#100#100",
		type=2,
		desc="增加对战士的伤害(魔法伤害有效)",
		isshow=2,
		sort=999,
	},
	[55] = { 
		Idx=55,
		name="受战减伤",
		nbvalue="100#100#100",
		type=2,
		desc="只减少来自54号属性伤害(注:基础属性伤害无法减少)",
		isshow=2,
		sort=999,
	},
	[56] = { 
		Idx=56,
		name="对法增伤",
		nbvalue="100#100#100",
		type=2,
		desc="增加对法师的伤害(魔法伤害有效)",
		isshow=2,
		sort=999,
	},
	[57] = { 
		Idx=57,
		name="受法减伤",
		nbvalue="100#100#100",
		type=2,
		desc="只减少来自56号属性伤害(注:基础属性伤害无法减少)",
		isshow=2,
		sort=999,
	},
	[58] = { 
		Idx=58,
		name="对道增伤",
		nbvalue="100#100#100",
		type=2,
		desc="增加对道士的伤害(魔法伤害有效)",
		isshow=2,
		sort=999,
	},
	[59] = { 
		Idx=59,
		name="受道减伤",
		nbvalue="100#100#100",
		type=2,
		desc="只减少来自58号属性伤害(注:基础属性伤害无法减少)",
		isshow=2,
		sort=999,
	},
	[60] = { 
		Idx=60,
		name="生命加成",
		nbvalue="100#100#100",
		type=2,
		desc="基于等级的HP加成(注:只增加基础等级HP)",
		isshow=2,
		sort=999,
	},
	[61] = { 
		Idx=61,
		name="生命恢复",
		nbvalue="100#100#100",
		type=1,
		desc="每10秒恢复固定生命值",
		isshow=0,
		sort=999,
	},
	[62] = { 
		Idx=62,
		name="魔法恢复",
		nbvalue="100#100#100",
		type=1,
		desc="每10秒恢复固定魔法值",
		isshow=0,
		sort=999,
	},
	[63] = { 
		Idx=63,
		name="格挡概率",
		nbvalue="100#100#100",
		type=2,
		desc="受到伤害时触发格挡的概率(注:必须与64号属性配合)(战士隔位技能无效gamedata参数UseNewHitDmgType配置开启)",
		isshow=2,
		sort=999,
	},
	[64] = { 
		Idx=64,
		name="格挡伤害",
		nbvalue="100#100#100",
		type=2,
		desc="触发格挡时减免的伤害比例(注:必须与64号属性配合)(战士隔位技能无效gamedata参数UseNewHitDmgType配置开启)",
		isshow=2,
		sort=999,
	},
	[65] = { 
		Idx=65,
		name="掉落概率",
		nbvalue="100#100#100",
		type=2,
		desc="万分比怪物掉落概率与命令爆率为相加模式",
		isshow=1,
		scolor=250,
		sort=999,
	},
	[66] = { 
		Idx=66,
		name="经验倍率",
		nbvalue="100#100#100",
		type=2,
		desc="增加获取到的基础经验，基础经验*66号属性*(脚本命令杀怪经验+脚本命令地图杀怪经验)=最终经验，组队经验同步",
		isshow=0,
		sort=999,
	},
	[67] = { 
		Idx=67,
		name="基础倍攻",
		nbvalue="100#100#100",
		type=2,
		desc="提升人物攻击倍数(67号属性+脚本命令攻击倍数=最终攻击倍数)",
		isshow=0,
		sort=999,
	},
	[68] = { 
		Idx=68,
		name="对人伤害",
		nbvalue="100#100#100",
		type=1,
		desc="对玩家造成无视防御的固定伤害(战士隔位技能无效gamedata参数UseNewHitDmgType配置开启)",
		isshow=1,
		scolor=254,
		sort=999,
		ys=1,
	},
	[69] = { 
		Idx=69,
		name="冰冻概率",
		nbvalue="100#100#100",
		type=2,
		desc="攻击时触发冰冻效果的概率(战士隔位技能与魔法技能无效)",
		isshow=0,
		sort=999,
	},
	[70] = { 
		Idx=70,
		name="蛛网概率",
		nbvalue="100#100#100",
		type=2,
		desc="攻击时触发蛛网效果的概率(战士隔位技能与魔法技能无效)",
		isshow=0,
		sort=999,
	},
	[71] = { 
		Idx=71,
		name="生命恢复",
		nbvalue="100#100#100",
		type=1,
		desc="每秒恢复固定数值的血量",
		isshow=1,
		sort=999,
	},
	[72] = { 
		Idx=72,
		name="对怪暴击率",
		nbvalue="100#100#100",
		type=3,
		desc="攻击怪物时额外附加的暴击率(战士隔位技能无效gamedata参数UseNewHitDmgType配置开启)",
		isshow=2,
		sort=36,
	},
	[73] = { 
		Idx=73,
		name="攻击加成",
		nbvalue="100#100#100",
		type=2,
		desc="提升整体比例的攻击力(注:不增加道术与魔法)",
		isshow=2,
		scolor=250,
		sort=29,
	},
	[74] = { 
		Idx=74,
		name="对怪伤害",
		nbvalue="100#100#100",
		type=1,
		desc="攻击怪物时造成的固定伤害(战士隔位技能无效gamedata参数UseNewHitDmgType配置开启)",
		isshow=2,
		scolor=250,
		sort=34,
	},
	[75] = { 
		Idx=75,
		name="对怪增伤",
		nbvalue="100#100#100",
		type=2,
		desc="按比例提升对怪物的伤害(战士隔位技能无效gamedata参数UseNewHitDmgType配置开启)",
		isshow=2,
		scolor=250,
		sort=35,
	},
	[76] = { 
		Idx=76,
		name="PK增伤",
		nbvalue="100#100#100",
		type=2,
		desc="PK时按比例提升伤害",
		isshow=2,
		scolor=250,
		sort=43,
	},
	[77] = { 
		Idx=77,
		name="PK减伤",
		nbvalue="100#100#100",
		type=2,
		desc="PK时按比例减少伤害",
		isshow=2,
		scolor=250,
		sort=44,
	},
	[78] = { 
		Idx=78,
		name="穿透",
		nbvalue="100#100#100",
		type=1,
		desc="忽略对方固定防御值与魔御值(对方 200防御 200魔御   写50  相当于 对方只有150点防御魔御)",
		isshow=2,
		scolor=250,
		sort=45,
	},
	[79] = { 
		Idx=79,
		name="神圣一击",
		nbvalue="100#100#100",
		type=2,
		desc="对目标几率造成3倍伤害(战士隔位技能无效gamedata参数UseNewHitDmgType配置开启)",
		isshow=2,
		scolor=245,
		sort=60,
	},
	[80] = { 
		Idx=80,
		name="神圣伤害",
		nbvalue="100#100#100",
		type=1,
		desc="触发神圣一击时的额外伤害(计算方式:原伤害*3+80号属性数值=最终)",
		isshow=2,
		scolor=245,
		sort=61,
	},
	[81] = { 
		Idx=81,
		name="对怪吸血",
		nbvalue="100#100#100",
		type=2,
		desc="仅对怪物伤害时提升的吸血比例",
		isshow=2,
		scolor=250,
		sort=37,
	},
	[82] = { 
		Idx=82,
		name="受怪减伤",
		nbvalue="100#100#100",
		type=2,
		desc="按比例减少受到来自怪物的伤害(注:达到100%时无伤害)",
		isshow=2,
		scolor=250,
		sort=38,
	},
	[83] = { 
		Idx=83,
		name="药品恢复加成",
		nbvalue="100#100#100",
		type=2,
		desc="按比例提升药品的恢复量",
		isshow=2,
		scolor=250,
		sort=39,
	},
	[84] = { 
		Idx=84,
		name="吸血抵抗",
		nbvalue="100#100#100",
		type=2,
		desc="减少34号属性吸血比例",
		isshow=2,
		scolor=250,
		sort=46,
	},
	[85] = { 
		Idx=85,
		name="破防抵抗",
		nbvalue="100#100#100",
		type=2,
		desc="抵抗忽视防御概率(对方忽视几率-自己忽视抵抗=对方实际忽视几率例:30%-20%=10%)",
		isshow=2,
		scolor=250,
		sort=47,
	},
	[86] = { 
		Idx=86,
		name="烈火减免",
		nbvalue="100#100#100",
		type=2,
		desc="减少烈火伤害比例(注:达到100%时烈火无伤害)",
		isshow=2,
		scolor=250,
		sort=48,
	},
	[87] = { 
		Idx=87,
		name="刺杀减免",
		nbvalue="100#100#100",
		type=2,
		desc="减少刺杀伤害比例(注:达到100%时刺杀无伤害)",
		isshow=2,
		scolor=250,
		sort=49,
	},
	[88] = { 
		Idx=88,
		name="攻杀减免",
		nbvalue="100#100#100",
		type=2,
		desc="减少攻杀伤害比例(注:达到100%时攻杀无伤害)",
		isshow=2,
		scolor=250,
		sort=50,
	},
	[89] = { 
		Idx=89,
		name="HP加成",
		nbvalue="100#100#100",
		type=2,
		desc="增加人物整体血量比例",
		isshow=1,
		scolor=250,
		sort=30,
	},
	[90] = { 
		Idx=90,
		name="神圣抵抗",
		nbvalue="100#100#100",
		type=2,
		desc="被攻击时，抵抗神圣一击的几率(注:达到100%时神圣一击不触发)",
		isshow=2,
		scolor=245,
		sort=62,
	},
	[91] = { 
		Idx=91,
		name="每秒回蓝",
		nbvalue="100#100#100",
		type=1,
		desc="每秒恢复固定数值的蓝量",
		isshow=0,
		scolor=250,
		sort=999,
	},
	[100] = { 
		Idx=100,
		name="内力值",
		nbvalue="100#100#100",
		type=1,
		desc="内力值(值)",
		isshow=0,
		scolor=250,
		sort=999,
	},
	[101] = { 
		Idx=101,
		name="内功伤害增加",
		nbvalue="100#100#100",
		type=2,
		desc="按比例提升伤害(万分比)",
		isshow=0,
		scolor=250,
		sort=999,
	},
	[102] = { 
		Idx=102,
		name="内功伤害减少",
		nbvalue="100#100#100",
		type=2,
		desc="按比例减少伤害(万分比)",
		isshow=0,
		scolor=250,
		sort=999,
	},
	[103] = { 
		Idx=103,
		name="合击伤害减少",
		nbvalue="100#100#100",
		type=2,
		desc="英雄版本属性(当主号被合击时伤害减少,当英雄被合击时伤害减少)(万分比)",
		isshow=0,
		scolor=250,
		sort=999,
	},
	[104] = { 
		Idx=104,
		name="内力恢复速度",
		nbvalue="100#100#100",
		type=1,
		desc="提高人物内力值恢复速度(值越大恢复越快) //M2上恢复速度值-104号属性恢复速度值=实际速度值毫秒",
		isshow=0,
		scolor=250,
		sort=999,
	},
	[105] = { 
		Idx=105,
		name="斗转星移值",
		nbvalue="100#100#100",
		type=1,
		desc="斗转星移值(值)",
		isshow=0,
		scolor=250,
		sort=999,
	},
	[106] = { 
		Idx=106,
		name="刺术下限_无效预留",
		nbvalue="43200#1#1",
		type=1,
		desc="刺客的核心属性，决定刺术伤害",
		isshow=1,
		sort=6,
	},
	[107] = { 
		Idx=107,
		name="刺术上限_无效预留",
		nbvalue="43200#1#1",
		type=1,
		desc="刺客的核心属性，决定刺术伤害",
		isshow=1,
		sort=6,
	},
	[108] = { 
		Idx=108,
		name="职业5核心属性_下限",
		nbvalue="43200#1#1",
		type=1,
		desc="职业5的核心属性下限",
		isshow=3,
		sort=7,
	},
	[109] = { 
		Idx=109,
		name="箭术",
		nbvalue="43200#1#1",
		type=1,
		desc="职业5的核心属性上限，此属性名称为游戏中显示名称",
		isshow=3,
		sort=7,
	},
	[110] = { 
		Idx=110,
		name="职业6核心属性_下限",
		nbvalue="43200#1#1",
		type=1,
		desc="职业6的核心属性下限",
		isshow=3,
		sort=8,
	},
	[111] = { 
		Idx=111,
		name="武术",
		nbvalue="43200#1#1",
		type=1,
		desc="职业6的核心属性上限，此属性名称为游戏中显示名称",
		isshow=3,
		sort=8,
	},
	[112] = { 
		Idx=112,
		name="职业7核心属性_下限",
		nbvalue="43200#1#1",
		type=1,
		desc="职业7的核心属性下限",
		isshow=3,
		sort=9,
	},
	[113] = { 
		Idx=113,
		name="刺术",
		nbvalue="43200#1#1",
		type=1,
		desc="职业7的核心属性上限，此属性名称为游戏中显示名称",
		isshow=3,
		sort=9,
	},
	[114] = { 
		Idx=114,
		name="职业8核心属性_下限",
		nbvalue="43200#1#1",
		type=1,
		desc="职业8的核心属性下限",
		isshow=3,
		sort=10,
	},
	[115] = { 
		Idx=115,
		name="职业8核心属性",
		nbvalue="43200#1#1",
		type=1,
		desc="职业8的核心属性上限，此属性名称为游戏中显示名称",
		isshow=3,
		sort=10,
	},
	[116] = { 
		Idx=116,
		name="职业9核心属性_下限",
		nbvalue="43200#1#1",
		type=1,
		desc="职业9的核心属性下限",
		isshow=3,
		sort=11,
	},
	[117] = { 
		Idx=117,
		name="职业9核心属性",
		nbvalue="43200#1#1",
		type=1,
		desc="职业9的核心属性上限，此属性名称为游戏中显示名称",
		isshow=3,
		sort=11,
	},
	[118] = { 
		Idx=118,
		name="职业10核心属性_下限",
		nbvalue="43200#1#1",
		type=1,
		desc="职业10的核心属性下限",
		isshow=3,
		sort=12,
	},
	[119] = { 
		Idx=119,
		name="职业10核心属性",
		nbvalue="43200#1#1",
		type=1,
		desc="职业10的核心属性上限，此属性名称为游戏中显示名称",
		isshow=3,
		sort=12,
	},
	[120] = { 
		Idx=120,
		name="职业11核心属性_下限",
		nbvalue="43200#1#1",
		type=1,
		desc="职业11的核心属性下限",
		isshow=3,
		sort=13,
	},
	[121] = { 
		Idx=121,
		name="职业11核心属性",
		nbvalue="43200#1#1",
		type=1,
		desc="职业11的核心属性上限，此属性名称为游戏中显示名称",
		isshow=3,
		sort=13,
	},
	[122] = { 
		Idx=122,
		name="职业12核心属性_下限",
		nbvalue="43200#1#1",
		type=1,
		desc="职业12的核心属性下限",
		isshow=3,
		sort=14,
	},
	[123] = { 
		Idx=123,
		name="职业12核心属性",
		nbvalue="43200#1#1",
		type=1,
		desc="职业12的核心属性上限，此属性名称为游戏中显示名称",
		isshow=3,
		sort=14,
	},
	[124] = { 
		Idx=124,
		name="职业13核心属性_下限",
		nbvalue="43200#1#1",
		type=1,
		desc="职业13的核心属性下限",
		isshow=3,
		sort=15,
	},
	[125] = { 
		Idx=125,
		name="职业13核心属性",
		nbvalue="43200#1#1",
		type=1,
		desc="职业13的核心属性上限，此属性名称为游戏中显示名称",
		isshow=3,
		sort=15,
	},
	[126] = { 
		Idx=126,
		name="职业14核心属性_下限",
		nbvalue="43200#1#1",
		type=1,
		desc="职业14的核心属性下限",
		isshow=3,
		sort=16,
	},
	[127] = { 
		Idx=127,
		name="职业14核心属性",
		nbvalue="43200#1#1",
		type=1,
		desc="职业14的核心属性上限，此属性名称为游戏中显示名称",
		isshow=3,
		sort=16,
	},
	[128] = { 
		Idx=128,
		name="职业15核心属性_下限",
		nbvalue="43200#1#1",
		type=1,
		desc="职业15的核心属性下限",
		isshow=3,
		sort=17,
	},
	[129] = { 
		Idx=129,
		name="职业15核心属性",
		nbvalue="43200#1#1",
		type=1,
		desc="职业15的核心属性上限，此属性名称为游戏中显示名称",
		isshow=3,
		sort=17,
	},
	[130] = { 
		Idx=130,
		name="全毒伤害增加",
		nbvalue="100#100#100",
		type=2,
		desc="按万分比增加全毒伤害",
		isshow=2,
		sort=999,
	},
	[131] = { 
		Idx=131,
		name="全毒伤害减少",
		nbvalue="100#100#100",
		type=2,
		desc="按万分比减少加全毒伤害",
		isshow=2,
		sort=999,
	},
}
return config
