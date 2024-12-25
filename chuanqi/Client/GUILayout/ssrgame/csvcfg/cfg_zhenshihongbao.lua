local config = {
	[1] = {
		main_btn = "四大陆",
		equip_level = "100|0", --所需装备等级(stdmode|等级)大于等于该等级则满足
		order = 1,       --在配置表中的序号
		inner_btn = {
			[1] = {
				btn_name = "5元真充",
				bonus_list = {
					{ idx = 2801, num = 1 },
					{ idx = 2802, num = 1 },
					{ idx = 2803, num = 1 },
					{ idx = 2804, num = 1 },
					{ idx = 2805, num = 1 },
					{ idx = 2806, num = 1 },
					{ idx = 2807, num = 1 },
				},
				monlist = {
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "六羽以上",
						name = "【实物首领]1",
						count = 2
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "七羽以上",
						name = "【实物首领]2",
						count = 3
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "八羽以上",
						name = "【实物首领]",
						count = 4
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "九羽以上",
						name = "【实物首领]",
						count = 5
					},
				}
			},
			[2] = {
				btn_name = "6元真充",
				bonus_list = {
					{ idx = 2801, num = 2 },
					{ idx = 2802, num = 2 },
					{ idx = 2803, num = 2 },
					{ idx = 2804, num = 2 },
					{ idx = 2805, num = 2 },
					{ idx = 2806, num = 2 },
					{ idx = 2807, num = 2 },
				},
				monlist = {
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "1六羽以上",
						name = "【实物2首领]",
						count = 6
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "1七羽以上",
						name = "【实物首领]",
						count = 7
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "1八羽以上",
						name = "【实物2首领]",
						count = 8
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "1九羽以上",
						name = "【实物首1领]",
						count = 9
					},
				},
			},
			-- [3] = {
			-- 	btn_name = "7元真充",
			-- 	bonus_list = {
			-- 		{ idx = 2801, num = 3 },
			-- 		{ idx = 2802, num = 3 },
			-- 		{ idx = 2803, num = 3 },
			-- 		{ idx = 2804, num = 3 },
			-- 		{ idx = 2805, num = 3 },
			-- 		{ idx = 2806, num = 3 },
			-- 		{ idx = 2807, num = 3 },
			-- 	},
			-- 	monlist = {
			-- 		{
			-- 			icon = "res/custom/zhenshihongbao/inco.png",
			-- 			type = "7六羽以上",
			-- 			name = "【实物首领]",
			-- 			count = 10
			-- 		},
			-- 		{
			-- 			icon = "res/custom/zhenshihongbao/inco.png",
			-- 			type = "7七羽以上",
			-- 			name = "【实物首领]",
			-- 			count = 11
			-- 		},
			-- 		{
			-- 			icon = "res/custom/zhenshihongbao/inco.png",
			-- 			type = "7八羽以上",
			-- 			name = "【实物首领]",
			-- 			count = 12
			-- 		},
			-- 		{
			-- 			icon = "res/custom/zhenshihongbao/inco.png",
			-- 			type = "7九羽以上",
			-- 			name = "【实物首领]",
			-- 			count = 13
			-- 		},
			-- 	}
			-- },
			-- [4] = {
			-- 	btn_name = "8元真充",
			-- 	bonus_list = {
			-- 		{ idx = 2801, num = 3 },
			-- 		{ idx = 2802, num = 3 },
			-- 		{ idx = 2803, num = 3 },
			-- 		{ idx = 2804, num = 3 },
			-- 		{ idx = 2805, num = 3 },
			-- 		{ idx = 2806, num = 3 },
			-- 		{ idx = 2807, num = 3 },
			-- 	},
			-- 	monlist = {
			-- 		{
			-- 			icon = "res/custom/zhenshihongbao/inco.png",
			-- 			type = "7六羽以上",
			-- 			name = "【实物首领]",
			-- 			count = 14
			-- 		},
			-- 		{
			-- 			icon = "res/custom/zhenshihongbao/inco.png",
			-- 			type = "7七羽以上",
			-- 			name = "【实物首领]",
			-- 			count = 15
			-- 		},
			-- 		{
			-- 			icon = "res/custom/zhenshihongbao/inco.png",
			-- 			type = "7八羽以上",
			-- 			name = "【实物首领]",
			-- 			count = 16
			-- 		},
			-- 		{
			-- 			icon = "res/custom/zhenshihongbao/inco.png",
			-- 			type = "7九羽以上",
			-- 			name = "【实物首领]",
			-- 			count = 17
			-- 		},
			-- 	}
			-- },
			-- [5] = {
			-- 	btn_name = "9元真充",
			-- 	bonus_list = {
			-- 		{ idx = 2801, num = 3 },
			-- 		{ idx = 2802, num = 3 },
			-- 		{ idx = 2803, num = 3 },
			-- 		{ idx = 2804, num = 3 },
			-- 		{ idx = 2805, num = 3 },
			-- 		{ idx = 2806, num = 3 },
			-- 		{ idx = 2807, num = 3 },
			-- 	},
			-- 	monlist = {
			-- 		{
			-- 			icon = "res/custom/zhenshihongbao/inco.png",
			-- 			type = "7六羽以上",
			-- 			name = "【实物首领]",
			-- 			count = 18
			-- 		},
			-- 		{
			-- 			icon = "res/custom/zhenshihongbao/inco.png",
			-- 			type = "7七羽以上",
			-- 			name = "【实物首领]",
			-- 			count = 19
			-- 		},
			-- 		{
			-- 			icon = "res/custom/zhenshihongbao/inco.png",
			-- 			type = "7八羽以上",
			-- 			name = "【实物首领]",
			-- 			count = 20
			-- 		},
			-- 		{
			-- 			icon = "res/custom/zhenshihongbao/inco.png",
			-- 			type = "7九羽以上",
			-- 			name = "【实物首领]",
			-- 			count = 21
			-- 		},
			-- 	}
			-- }

		},
	},
	[2] = {
		main_btn = "五大陆",
		equip_level = "100|0", 
		order = 2,
		inner_btn = {
			[1] = {
				btn_name = "15元真充",
				bonus_list = {
					{ idx = 2801, num = 21 },
					{ idx = 2802, num = 21 },
					{ idx = 2803, num = 21 },
					{ idx = 2804, num = 21 },
					{ idx = 2805, num = 21 },
					{ idx = 2806, num = 21 },
					{ idx = 2807, num = 21 },
				},
				monlist = {
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11六羽以上",
						name = "【实物首领]",
						count = 22
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11七羽以上",
						name = "【实物首领]",
						count = 23
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "八羽以上",
						name = "【实物首领]",
						count = 24
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11九羽以上",
						name = "【实物首领]",
						count = 25
					},
				}
			},
			[2] = {
				btn_name = "16元真充",
				bonus_list = {
					{ idx = 2801, num = 22 },
					{ idx = 2802, num = 22 },
					{ idx = 2803, num = 22 },
					{ idx = 2804, num = 22 },
					{ idx = 2805, num = 22 },
					{ idx = 2806, num = 22 },
					{ idx = 2807, num = 22 },
				},
				monlist = {
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11六羽以上",
						name = "【实物首领]",
						count = 26
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11七羽以上",
						name = "【实物首领]",
						count = 27
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11八羽以上",
						name = "【实物首领]",
						count = 28
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11九羽以上",
						name = "【实物首领]",
						count = 29
					},
				},

			},
			[3] = {
				btn_name = "161元真充",
				bonus_list = {
					{ idx = 2801, num = 22 },
					{ idx = 2802, num = 22 },
					{ idx = 2803, num = 22 },
					{ idx = 2804, num = 22 },
					{ idx = 2805, num = 22 },
					{ idx = 2806, num = 22 },
					{ idx = 2807, num = 22 },
				},
				monlist = {
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11六羽以上",
						name = "【实物首领]",
						count = 30
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11七羽以上",
						name = "【实物首领]",
						count = 31
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11八羽以上",
						name = "【实物首领]",
						count = 32
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11九羽以上",
						name = "【实物首领]",
						count = 33
					},
				},

			},
			[4] = {
				btn_name = "116元真充",
				bonus_list = {
					{ idx = 2801, num = 22 },
					{ idx = 2802, num = 22 },
					{ idx = 2803, num = 22 },
					{ idx = 2804, num = 22 },
					{ idx = 2805, num = 22 },
					{ idx = 2806, num = 22 },
					{ idx = 2807, num = 22 },
				},
				monlist = {
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11六羽以上",
						name = "【实物首领]",
						count = 34
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11七羽以上",
						name = "【实物首领]",
						count = 35
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11八羽以上",
						name = "【实物首领]",
						count = 36
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11九羽以上",
						name = "【实物首领]",
						count = 37
					},
				},

			},
			[5] = {
				btn_name = "1611元真充",
				bonus_list = {
					{ idx = 2801, num = 22 },
					{ idx = 2802, num = 22 },
					{ idx = 2803, num = 22 },
					{ idx = 2804, num = 22 },
					{ idx = 2805, num = 22 },
					{ idx = 2806, num = 22 },
					{ idx = 2807, num = 22 },
				},
				monlist = {
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11六羽以上",
						name = "【实物首领]",
						count = 38
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11七羽以上",
						name = "【实物首领]",
						count = 39
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11八羽以上",
						name = "【实物首领]",
						count = 40
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11九羽以上",
						name = "【实物首领]",
						count = 41
					},
				},

			}
		},
	},
	[3] = {
		main_btn = "六大陆",
		equip_level = "100|1", 
		order = 3,
		inner_btn = {
			[1] = {
				btn_name = "115元真充",
				bonus_list = {
					{ idx = 2801, num = 21 },
					{ idx = 2802, num = 21 },
					{ idx = 2803, num = 21 },
					{ idx = 2804, num = 21 },
					{ idx = 2805, num = 21 },
					{ idx = 2806, num = 21 },
					{ idx = 2807, num = 21 },
				},
				monlist = {
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "111六羽以上",
						name = "【实物首领]",
						count = 42
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "111七羽以上",
						name = "【实物首领]",
						count = 43
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "八1羽以上",
						name = "【实物首领]",
						count = 44
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "111九羽以上",
						name = "【实物首领]",
						count = 45
					},
				}
			},
			[2] = {
				btn_name = "116元真充",
				bonus_list = {
					{ idx = 2801, num = 22 },
					{ idx = 2802, num = 22 },
					{ idx = 2803, num = 22 },
					{ idx = 2804, num = 22 },
					{ idx = 2805, num = 22 },
					{ idx = 2806, num = 22 },
					{ idx = 2807, num = 22 },
				},
				monlist = {
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11六羽以上",
						name = "【实物首领]",
						count = 46
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11七羽以上",
						name = "【实物首领]",
						count = 47
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11八羽以上",
						name = "【实物首领]",
						count = 48
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11九羽以上",
						name = "【实物首领]",
						count = 49
					},
				},

			}
		},
	},
	[4] = {
		main_btn = "4大陆",
		equip_level = "100|1", 
		order = 4,
		inner_btn = {
			[1] = {
				btn_name = "115元真充",
				bonus_list = {
					{ idx = 2801, num = 21 },
					{ idx = 2802, num = 21 },
					{ idx = 2803, num = 21 },
					{ idx = 2804, num = 21 },
					{ idx = 2805, num = 21 },
					{ idx = 2806, num = 21 },
					{ idx = 2807, num = 21 },
				},
				monlist = {
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "111六羽以上",
						name = "【实物首领]",
						count = 42
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "111七羽以上",
						name = "【实物首领]",
						count = 43
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "八1羽以上",
						name = "【实物首领]",
						count = 44
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "111九羽以上",
						name = "【实物首领]",
						count = 45
					},
				}
			},
			[2] = {
				btn_name = "116元真充",
				bonus_list = {
					{ idx = 2801, num = 22 },
					{ idx = 2802, num = 22 },
					{ idx = 2803, num = 22 },
					{ idx = 2804, num = 22 },
					{ idx = 2805, num = 22 },
					{ idx = 2806, num = 22 },
					{ idx = 2807, num = 22 },
				},
				monlist = {
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11六羽以上",
						name = "【实物首领]",
						count = 46
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11七羽以上",
						name = "【实物首领]",
						count = 47
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11八羽以上",
						name = "【实物首领]",
						count = 48
					},
					{
						icon = "res/custom/zhenshihongbao/inco.png",
						type = "11九羽以上",
						name = "【实物首领]",
						count = 49
					},
				},

			}
		},
	},
}

return config
