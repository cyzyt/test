local config = {
	[1] = {
		Type = 1,
		Title = "<font size='18' color='#ffff00'><img src ='res/custom/Main/img_task_zhu.png'></img>初入游戏世界</font>",
		Reward = 7600005,
		CompleteText = "<font size='16' color='#00ff00'>少侠！欢迎进入游戏世界</font>",
		TalkNpc = "<font color='#00ffff'>我这有武器装备，神功秘籍赠与有缘之人！</font>",
		TalkNpcBtn = "<outline size='1'><a enableUnderline ='true' href=''><font color='#00ff00'>领 取</font></a></outline>",
	},
	[2] = {
		Type = 1,
		Title = "<font size='18' color='#ffff00'><img src ='res/custom/Main/img_task_zhu.png'></img>太湖试炼</font>",
		Target = {
			[1] = 1,
		},
		Reward = 7600006,
		AutoTouchOngoing = 1,
		CompleteText = "<font size='16' color='#00ff00'>点击领取奖励</font>",
	},
	[3] = {
		Type = 1,
		Title = "<font size='18' color='#ffff00'><img src ='res/custom/Main/img_task_zhu.png'></img>秦家寨试炼</font>",
		Target = {
			[1] = 2,
		},
		Reward = 7600010,
		AutoTouchOngoing = 1,
		CompleteText = "<font size='16' color='#00ff00'>点击领取奖励</font>",
	},
	[4] = {
		Type = 1,
		Title = "<font size='18' color='#ffff00'><img src ='res/custom/Main/img_task_zhu.png'></img>归云庄试炼</font>",
		Target = {
			[1] = 3,
		},
		Reward = 7600006,
		AutoTouchOngoing = 1,
		CompleteText = "<font size='16' color='#00ff00'>点击领取奖励</font>",
	},
	[1000] = {
		Type = 2,
		Title = "<font size='18' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>升级神兽buff</font>",
		Target = {
			[1] = 8,
		},
		Reward = 7600007,
		CompleteText = "<font size='16' color='#00ff00'>点击领取奖励</font>",
	},
	[1001] = {
		Type = 2,
		Title = "<font size='18' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>逆天改命</font>",
		Target = {
			[1] = 7,
		},
		Reward = 7600008,
		CompleteText = "<font size='16' color='#00ff00'>点击领取奖励</font>",
	},
	[1002] = {
		Type = 2,
		Title = "<font size='18' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>法宝</font>",
		Target = {
			[1] = 6,
		},
		Reward = 7600009,
		CompleteText = "<font size='16' color='#00ff00'>点击领取奖励</font>",
	},
	[1003] = {
		Type = 2,
		Title = "<font size='18' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>镶嵌</font>",
		Target = {
			[1] = 5,
		},
		Reward = 7600006,
		CompleteText = "<font size='16' color='#00ff00'>点击领取奖励</font>",
	},
	[1004] = {
		Type = 2,
		Title = "<font size='18' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>转生使者</font>",
		Target = {
			[1] = 4,
		},
		Reward = 7600006,
		CompleteText = "<font size='16' color='#00ff00'>点击领取奖励</font>",
	},
	[1005] = {
		Type = 2,
		Title = "<font size='18' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>开启狂暴</font>",
		Target = {
			[1] = 9,
		},
		Reward = 7600006,
		CompleteText = "<font size='16' color='#00ff00'>点击领取奖励</font>",
	},
	[4000] = {
		Type = 5,
		Title = "<font size='18' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>装备融合</font>",
		Target = {
			[1] = 10,
		},
		Reward = 7600006,
		CompleteText = "<font size='16' color='#00ff00'>点击领取奖励</font>",
	},
	[5000] = {
		Type = 6,
		Title = "<font size='18' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>装备进阶</font>",
		Target = {
			[1] = 11,
		},
		Reward = 7600006,
		CompleteText = "<font size='16' color='#00ff00'>点击领取奖励</font>",
	},
	[2000] = {
		Type = 3,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[极品装备]推荐地图</font>",
		Target = {
			[1] = 100,
		},
	},
	[2001] = {
		Type = 3,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[极品装备]推荐地图</font>",
		Target = {
			[1] = 101,
		},
	},
	[2002] = {
		Type = 3,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[极品装备]推荐地图</font>",
		Target = {
			[1] = 102,
		},
	},
	[2003] = {
		Type = 3,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[极品装备]推荐地图</font>",
		Target = {
			[1] = 103,
		},
	},
	[2004] = {
		Type = 3,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[极品装备]推荐地图</font>",
		Target = {
			[1] = 104,
		},
	},
	[2005] = {
		Type = 3,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[极品装备]推荐地图</font>",
		Target = {
			[1] = 105,
		},
	},
	[2006] = {
		Type = 3,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[极品装备]推荐地图</font>",
		Target = {
			[1] = 106,
		},
	},
	[2007] = {
		Type = 3,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[极品装备]推荐地图</font>",
		Target = {
			[1] = 107,
		},
	},
	[2008] = {
		Type = 3,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[极品装备]推荐地图</font>",
		Target = {
			[1] = 108,
		},
	},
	[2009] = {
		Type = 3,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[极品装备]推荐地图</font>",
		Target = {
			[1] = 109,
		},
	},
	[2010] = {
		Type = 3,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[极品装备]推荐地图</font>",
		Target = {
			[1] = 110,
		},
	},
	[2011] = {
		Type = 3,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[极品装备]推荐地图</font>",
		Target = {
			[1] = 111,
		},
	},
	[2012] = {
		Type = 3,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[极品装备]推荐地图</font>",
		Target = {
			[1] = 112,
		},
	},
	[2013] = {
		Type = 3,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[极品装备]推荐地图</font>",
		Target = {
			[1] = 113,
		},
	},
	[2014] = {
		Type = 3,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[极品装备]推荐地图</font>",
		Target = {
			[1] = 114,
		},
	},
	[2015] = {
		Type = 3,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[极品装备]推荐地图</font>",
		Target = {
			[1] = 115,
		},
	},
	[2016] = {
		Type = 3,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[极品装备]推荐地图</font>",
		Target = {
			[1] = 116,
		},
	},
	[2017] = {
		Type = 3,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[极品装备]推荐地图</font>",
		Target = {
			[1] = 117,
		},
	},
	[3000] = {
		Type = 4,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[元宝经验]推荐地图</font>",
		Target = {
			[1] = 200,
		},
	},
	[3001] = {
		Type = 4,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[元宝经验]推荐地图</font>",
		Target = {
			[1] = 201,
		},
	},
	[3002] = {
		Type = 4,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[元宝经验]推荐地图</font>",
		Target = {
			[1] = 202,
		},
	},
	[3003] = {
		Type = 4,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[元宝经验]推荐地图</font>",
		Target = {
			[1] = 203,
		},
	},
	[3004] = {
		Type = 4,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[元宝经验]推荐地图</font>",
		Target = {
			[1] = 204,
		},
	},
	[3005] = {
		Type = 4,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[元宝经验]推荐地图</font>",
		Target = {
			[1] = 205,
		},
	},
	[3006] = {
		Type = 4,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[元宝经验]推荐地图</font>",
		Target = {
			[1] = 206,
		},
	},
	[3007] = {
		Type = 4,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[元宝经验]推荐地图</font>",
		Target = {
			[1] = 207,
		},
	},
	[3008] = {
		Type = 4,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[元宝经验]推荐地图</font>",
		Target = {
			[1] = 208,
		},
	},
	[3009] = {
		Type = 4,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[元宝经验]推荐地图</font>",
		Target = {
			[1] = 209,
		},
	},
	[3010] = {
		Type = 4,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[元宝经验]推荐地图</font>",
		Target = {
			[1] = 210,
		},
	},
	[3011] = {
		Type = 4,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[元宝经验]推荐地图</font>",
		Target = {
			[1] = 211,
		},
	},
	[3012] = {
		Type = 4,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[元宝经验]推荐地图</font>",
		Target = {
			[1] = 212,
		},
	},
	[3013] = {
		Type = 4,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[元宝经验]推荐地图</font>",
		Target = {
			[1] = 213,
		},
	},
	[3014] = {
		Type = 4,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[元宝经验]推荐地图</font>",
		Target = {
			[1] = 214,
		},
	},
	[3015] = {
		Type = 4,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[元宝经验]推荐地图</font>",
		Target = {
			[1] = 215,
		},
	},
	[3016] = {
		Type = 4,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[元宝经验]推荐地图</font>",
		Target = {
			[1] = 216,
		},
	},
	[3017] = {
		Type = 4,
		Title = "<font size='16' color='#ffff00'><img src ='res/custom/Main/img_task_zhi.png'></img>[元宝经验]推荐地图</font>",
		Target = {
			[1] = 217,
		},
	},
}
return config