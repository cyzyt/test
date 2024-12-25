local config = {
	[1] = {
		Type = 2,
		NeedNum = 5,
		TargetText = "<font size='16' color='#ff0000'>杀任意怪物 %d/%d</font>",
		TouchType = {
			[1] = 1000,
		},
	},
	[2] = {
		Type = 1,
		NeedNum = 5,
		TargetText = "<font size='16' color='#ff0000'>获取任意装备 %d/%d</font>",
		TouchType = {
			[1] = 1001,
		},
	},
	[3] = {
		Type = 2,
		NeedNum = 5,
		TargetText = "<font size='16' color='#ff0000'>杀任意怪物 %d/%d</font>",
		TouchType = {
			[1] = 1002,
		},
	},
	[4] = {
		Type = 3,
		NeedNum = 1,
		TargetText = "<font size='16' color='#ff0000'>人物转生一次 %d/%d</font>",
		TouchType = {
			[1] = 1003,
		},
	},
	[5] = {
		Type = 4,
		NeedNum = 1,
		TargetText = "<font size='16' color='#ff0000'>镶嵌宝石 %d/%d</font>",
		TouchType = {
			[1] = 1004,
		},
	},
	[6] = {
		Type = 5,
		NeedNum = 1,
		TargetText = "<font size='16' color='#ff0000'>宝物升级 %d/%d</font>",
		TouchType = {
			[1] = 1005,
		},
	},
	[7] = {
		Type = 6,
		NeedNum = 1,
		TargetText = "<font size='16' color='#ff0000'>逆天改命 %d/%d</font>",
		TouchType = {
			[1] = 1006,
		},
	},
	[8] = {
		Type = 7,
		NeedNum = 1,
		TargetText = "<font size='16' color='#ff0000'>神兽升级 %d/%d</font>",
		TouchType = {
			[1] = 1007,
		},
	},
	[9] = {
		Type = 8,
		NeedNum = 1,
		TargetText = "<font size='16' color='#ff0000'>开启狂暴 %d/%d</font>",
		TouchType = {
			[1] = 1008,
		},
	},
	[10] = {
		Type = 9,
		NeedNum = 1,
		TargetText = "<font size='16' color='#ff0000'>装备融合 %d/%d</font>",
		TouchType = {
			[1] = 1009,
		},
	},
	[11] = {
		Type = 10,
		NeedNum = 1,
		TargetText = "<font size='16' color='#ff0000'>装备进阶 %d/%d</font>",
		TouchType = {
			[1] = 1010,
		},
	},
	[100] = {
		Type = 3,
		NeedNum = 1,
		TargetText = "<font size='16' color='#ff0000'>一品堂</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 2000,
		},
	},
	[101] = {
		Type = 3,
		NeedNum = 2,
		TargetText = "<font size='16' color='#ff0000'>地下坊市</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 2001,
		},
	},
	[102] = {
		Type = 3,
		NeedNum = 3,
		TargetText = "<font size='16' color='#ff0000'>沙漠遗迹</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 2002,
		},
	},
	[103] = {
		Type = 3,
		NeedNum = 4,
		TargetText = "<font size='16' color='#ff0000'>光明顶密道</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 2003,
		},
	},
	[104] = {
		Type = 3,
		NeedNum = 5,
		TargetText = "<font size='16' color='#ff0000'>高昌</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 2004,
		},
	},
	[105] = {
		Type = 3,
		NeedNum = 6,
		TargetText = "<font size='16' color='#ff0000'>陆家庄</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 2005,
		},
	},
	[106] = {
		Type = 3,
		NeedNum = 7,
		TargetText = "<font size='16' color='#ff0000'>西皇宫</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 2006,
		},
	},
	[107] = {
		Type = 3,
		NeedNum = 8,
		TargetText = "<font size='16' color='#ff0000'>碎星谷</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 2007,
		},
	},
	[108] = {
		Type = 3,
		NeedNum = 9,
		TargetText = "<font size='16' color='#ff0000'>定天凌</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 2008,
		},
	},
	[109] = {
		Type = 3,
		NeedNum = 10,
		TargetText = "<font size='16' color='#ff0000'>血煞宫</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 2009,
		},
	},
	[110] = {
		Type = 3,
		NeedNum = 11,
		TargetText = "<font size='16' color='#ff0000'>擎雷馆</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 2010,
		},
	},
	[111] = {
		Type = 3,
		NeedNum = 12,
		TargetText = "<font size='16' color='#ff0000'>虎豹坊</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 2011,
		},
	},
	[112] = {
		Type = 3,
		NeedNum = 13,
		TargetText = "<font size='16' color='#ff0000'>榭雅轩</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 2012,
		},
	},
	[113] = {
		Type = 3,
		NeedNum = 14,
		TargetText = "<font size='16' color='#ff0000'>太虚堂</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 2013,
		},
	},
	[114] = {
		Type = 3,
		NeedNum = 15,
		TargetText = "<font size='16' color='#ff0000'>山海派</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 2014,
		},
	},
	[115] = {
		Type = 3,
		NeedNum = 16,
		TargetText = "<font size='16' color='#ff0000'>白莲教圣地</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 2015,
		},
	},
	[116] = {
		Type = 3,
		NeedNum = 17,
		TargetText = "<font size='16' color='#ff0000'>太岁书院</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 2016,
		},
	},
	[117] = {
		Type = 3,
		NeedNum = 30,
		TargetText = "<font size='16' color='#ff0000'>潇湘阁</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 2017,
		},
	},
	[200] = {
		Type = 3,
		NeedNum = 1,
		TargetText = "<font size='16' color='#ff0000'>打草谷</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 3000,
		},
	},
	[201] = {
		Type = 3,
		NeedNum = 2,
		TargetText = "<font size='16' color='#ff0000'>一品堂</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 3001,
		},
	},
	[202] = {
		Type = 3,
		NeedNum = 3,
		TargetText = "<font size='16' color='#ff0000'>地下坊市</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 3002,
		},
	},
	[203] = {
		Type = 3,
		NeedNum = 4,
		TargetText = "<font size='16' color='#ff0000'>沙漠遗迹</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 3003,
		},
	},
	[204] = {
		Type = 3,
		NeedNum = 5,
		TargetText = "<font size='16' color='#ff0000'>光明顶密道</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 3004,
		},
	},
	[205] = {
		Type = 3,
		NeedNum = 6,
		TargetText = "<font size='16' color='#ff0000'>高昌</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 3005,
		},
	},
	[206] = {
		Type = 3,
		NeedNum = 7,
		TargetText = "<font size='16' color='#ff0000'>陆家庄</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 3006,
		},
	},
	[207] = {
		Type = 3,
		NeedNum = 8,
		TargetText = "<font size='16' color='#ff0000'>西皇宫</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 3007,
		},
	},
	[208] = {
		Type = 3,
		NeedNum = 9,
		TargetText = "<font size='16' color='#ff0000'>碎星谷</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 3008,
		},
	},
	[209] = {
		Type = 3,
		NeedNum = 10,
		TargetText = "<font size='16' color='#ff0000'>定天凌</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 3009,
		},
	},
	[210] = {
		Type = 3,
		NeedNum = 11,
		TargetText = "<font size='16' color='#ff0000'>血煞宫</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 3010,
		},
	},
	[211] = {
		Type = 3,
		NeedNum = 12,
		TargetText = "<font size='16' color='#ff0000'>擎雷馆</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 3011,
		},
	},
	[212] = {
		Type = 3,
		NeedNum = 13,
		TargetText = "<font size='16' color='#ff0000'>虎豹坊</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 3012,
		},
	},
	[213] = {
		Type = 3,
		NeedNum = 14,
		TargetText = "<font size='16' color='#ff0000'>榭雅轩</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 3013,
		},
	},
	[214] = {
		Type = 3,
		NeedNum = 15,
		TargetText = "<font size='16' color='#ff0000'>太虚堂</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 3014,
		},
	},
	[215] = {
		Type = 3,
		NeedNum = 16,
		TargetText = "<font size='16' color='#ff0000'>山海派</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 3015,
		},
	},
	[216] = {
		Type = 3,
		NeedNum = 17,
		TargetText = "<font size='16' color='#ff0000'>白莲教圣地</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 3016,
		},
	},
	[217] = {
		Type = 3,
		NeedNum = 30,
		TargetText = "<font size='16' color='#ff0000'>太岁书院</font><font size='18' color='#00ff00'>点击前往</font>",
		TouchType = {
			[1] = 3017,
		},
	},
}
return config