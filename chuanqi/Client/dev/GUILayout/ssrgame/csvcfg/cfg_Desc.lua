local config = {
	[10100] = {
		desc = "<font colorStyleID='1039'>赞助说明：</font><br/><font colorStyleID='1038'>1.赞助升级时立即获得对应属性和特权</font><br/><font colorStyleID='1038'>2.升级赞助等级奖励的道具需要手动领取</font>",
	},
	[40000] = {
		desc = "<font colorStyleID='1040'>宝石镶嵌：</font><br/><font colorStyleID='1038'>1.镶嵌宝石可以提升大量属性。</font><br/><font colorStyleID='1038'>2.每种类型的宝石在同一个部位只能镶嵌一颗。</font>",
	},
	[3] = {
		desc = "<font colorStyleID='16101'>1.多倍爆率每次只会触发其中一个倍数；</font><br/><font colorStyleID='16101'>2.双倍：总爆率小于或等于</font><font colorStyleID='16202'>100%</font><font colorStyleID='16101'>时，可触发</font><font colorStyleID='16202'>双倍爆率</font><br/><font colorStyleID='16101'>3.三倍：总爆率大于或等于</font><font colorStyleID='16202'>200%</font><font colorStyleID='16101'>时，可触发</font><font colorStyleID='16202'>三倍爆率</font><br/><font colorStyleID='16101'>4.四倍：总爆率大于或等于</font><font colorStyleID='16202'>300%</font><font colorStyleID='16101'>时，可触发</font><font colorStyleID='16202'>四倍爆率</font><br/><font colorStyleID='16101'>5.五倍：总爆率大于300%时，可触发五倍爆率</font>",
	},
	[4] = {
		desc = "<font colorStyleID='1040'>强化说明：</font><br/><font colorStyleID='1038'>1.强化的对象是装备部位，当更换装备的时候，强化属性不会消失</font><br/><font colorStyleID='1038'>2.强化获得的属性只有在装备穿戴后才会获得属性加成</font><br/><font colorStyleID='1038'>3.强化成功率随着强化等级降低，强化消耗随着等级提升而提升</font>",
	},
	[5] = {
		desc = "<font colorStyleID='1038'>玄武可增加角色的</font><font colorStyleID='1040'>生命</font><br/><font colorStyleID='1038'>消耗</font><font colorStyleID='1039'>玄武精魂</font><font colorStyleID='1038'>可升级四象等级获得更高属性</font><br/><font colorStyleID='1039'>玄武精魂</font><font colorStyleID='1038'>通过</font><font colorStyleID='1039'>击败BOSS</font><font colorStyleID='1038'>掉落</font>",
	},
	[6] = {
		desc = "<font colorStyleID='1038'>白虎可增加角色的</font><font colorStyleID='1040'>攻击，百分比攻击，对怪增伤</font><br/><font colorStyleID='1038'>消耗</font><font colorStyleID='1039'>白虎精魂</font><font colorStyleID='1038'>可升级四象等级获得更高属性</font><br/><font colorStyleID='1039'>白虎精魂</font><font colorStyleID='1038'>通过</font><font colorStyleID='1039'>击败BOSS</font><font colorStyleID='1038'>掉落</font>",
	},
	[7] = {
		desc = "<font colorStyleID='1038'>朱雀翼可增加角色的</font><font colorStyleID='1040'>防御，受怪减伤</font><br/><font colorStyleID='1038'>消耗</font><font colorStyleID='1039'>朱雀精魂</font><font colorStyleID='1038'>可升级四象等级获得更高属性</font><br/><font colorStyleID='1039'>朱雀精魂</font><font colorStyleID='1038'>通过</font><font colorStyleID='1039'>日常任务和活动</font><font colorStyleID='1038'>获得</font>",
	},
	[8] = {
		desc = "<font colorStyleID='1038'>青龙胆可增加角色的</font><font colorStyleID='1040'>攻击，暴击率，对怪暴击率</font><br/><font colorStyleID='1038'>消耗</font><font colorStyleID='1039'>青龙精魂</font><font colorStyleID='1038'>可升级四象等级获得更高属性</font><br/><font colorStyleID='1039'>青龙精魂</font><font colorStyleID='1038'>通过</font><font colorStyleID='1039'>活动</font><font colorStyleID='1038'>获得</font>",
	},
	[9] = {
		desc = "<font colorStyleID='1038'>宝玉说明</font><br/><font colorStyleID='1038'>1.</font><font colorStyleID='1038'>消耗一定数量的玉髓可升级宝玉</font><br/><font colorStyleID='1038'>2.集齐</font><font colorStyleID='1039'>12件</font><font colorStyleID='1038'>宝玉可以进入宝玉地图</font><br/><font colorStyleID='1038'>3.宝玉的套装效果可以向下兼容</font>",
	},
	[10] = {
		desc = "<font colorStyleID='1039'>无双装备说明：</font><br/><font colorStyleID='1038'>1.无双装备通过击杀神将一定概率掉落获取</font><br/><font colorStyleID='1038'>2.无双装备分解后获得对应等级数量的无双神石</font>",
	},
	[11] = {
		desc = "<font colorStyleID='16202'>侍女说明：</font><br/><font colorStyleID='16101'>1.打BOSS就能爆侍女石。</font><br/><font colorStyleID='16101'>2.侍女石可召集侍女助战</font><br/><font colorStyleID='16101'>3.最多可同时出场三名侍女。</font>",
	},
	[12] = {
		desc = "<font colorStyleID='16101'>充值玉币：&<ITEMCOUNT/2>&</font><br/><font colorStyleID='16101'>玉币：&<ITEMCOUNT/4>&</font><br/><font colorStyleID='16101'>特别说明：玉币可以通过玉币红包等游戏内途径获得。充值玉币可通过充值获得。</font>",
	},
	[13] = {
		desc = "<font colorStyleID='16101'>金条：&<ITEMCOUNT/3>&</font><br/><font colorStyleID='16101'>获取方式：BOSS掉落，活动奖励等方式获得</font>",
	},
	[14] = {
		desc = "<font colorStyleID='16202'>合成说明：</font><br/><font colorStyleID='16101'>1.部分合成物品随等级解锁。</font><br/><font colorStyleID='16101'>2.合成物品消耗元宝以及其它道具。</font>",
	},
	[15] = {
		desc = "<font colorStyleID='1040'>升星说明：</font><br/><font colorStyleID='1038'>1.升星的对象是装备部位，当更换装备的时候，升星属性不会消失</font><br/><font colorStyleID='1038'>2.升星获得的属性只有在装备穿戴后才会获得属性加成</font><br/><font colorStyleID='1038'>3.升星成功率随着升星等级降低，升星消耗随着等级提升而提升</font>",
	},
	[16] = {
		desc = "<font colorStyleID='1040'>升阶说明：</font><br/><font colorStyleID='1038'>1.升阶后该装备可以被用于激活同阶套装上</font><br/><font colorStyleID='1038'>2.装备锻造升阶后将不可回溯</font>",
	},
	[17] = {
		desc = "<font colorStyleID='1040'>升阶说明：</font><br/><font colorStyleID='1038'>1.升阶后将会获得永久属性加成</font><br/><font colorStyleID='1038'>2.升阶后将谱会额外提升名将图鉴内已获得的武将的属性</font>",
	},
	[20400] = {
		desc = "<font colorStyleID='1040'>分解说明：</font><br/><font colorStyleID='1038'>11阶以上神装可分解，分解后可随机获得世界币</font>",
	},
	[18] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：800</font><br><font color='#FFFF00'>对怪增伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[19] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：1600</font><br><font color='#FFFF00'>对怪增伤：2%</font><br><font color='#FFFF00'>爆率加成：2%</font>",
	},
	[20] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：2400</font><br><font color='#FFFF00'>对怪增伤：3%</font><br><font color='#FFFF00'>爆率加成：3%</font>",
	},
	[21] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：3200</font><br><font color='#FFFF00'>对怪增伤：4%</font><br><font color='#FFFF00'>爆率加成：4%</font>",
	},
	[22] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：4000</font><br><font color='#FFFF00'>对怪增伤：5%</font><br><font color='#FFFF00'>爆率加成：5%</font>",
	},
	[23] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：4800</font><br><font color='#FFFF00'>对怪增伤：6%</font><br><font color='#FFFF00'>爆率加成：6%</font>",
	},
	[24] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：5600</font><br><font color='#FFFF00'>对怪增伤：7%</font><br><font color='#FFFF00'>爆率加成：7%</font>",
	},
	[25] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：6400</font><br><font color='#FFFF00'>对怪增伤：8%</font><br><font color='#FFFF00'>爆率加成：8%</font>",
	},
	[26] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：8000</font><br><font color='#FFFF00'>对怪增伤：9%</font><br><font color='#FFFF00'>爆率加成：9%</font>",
	},
	[27] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：9600</font><br><font color='#FFFF00'>对怪增伤：10%</font><br><font color='#FFFF00'>爆率加成：10%</font>",
	},
	[28] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：11200</font><br><font color='#FFFF00'>对怪增伤：11%</font><br><font color='#FFFF00'>爆率加成：11%</font>",
	},
	[29] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：12800</font><br><font color='#FFFF00'>对怪增伤：12%</font><br><font color='#FFFF00'>爆率加成：12%</font>",
	},
	[30] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：14400</font><br><font color='#FFFF00'>对怪增伤：13%</font><br><font color='#FFFF00'>爆率加成：14%</font>",
	},
	[31] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：16000</font><br><font color='#FFFF00'>对怪增伤：15%</font><br><font color='#FFFF00'>爆率加成：16%</font>",
	},
	[32] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：18400</font><br><font color='#FFFF00'>对怪增伤：17%</font><br><font color='#FFFF00'>爆率加成：18%</font>",
	},
	[33] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：20800</font><br><font color='#FFFF00'>对怪增伤：19%</font><br><font color='#FFFF00'>爆率加成：20%</font>",
	},
	[34] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：23200</font><br><font color='#FFFF00'>对怪增伤：21%</font><br><font color='#FFFF00'>爆率加成：22%</font>",
	},
	[35] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：25600</font><br><font color='#FFFF00'>对怪增伤：23%</font><br><font color='#FFFF00'>爆率加成：24%</font>",
	},
	[36] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：28000</font><br><font color='#FFFF00'>对怪增伤：25%</font><br><font color='#FFFF00'>爆率加成：26%</font>",
	},
	[37] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：30400</font><br><font color='#FFFF00'>对怪增伤：28%</font><br><font color='#FFFF00'>爆率加成：28%</font>",
	},
	[38] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：32800</font><br><font color='#FFFF00'>对怪增伤：31%</font><br><font color='#FFFF00'>爆率加成：30%</font>",
	},
	[39] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：35200</font><br><font color='#FFFF00'>对怪增伤：34%</font><br><font color='#FFFF00'>爆率加成：32%</font>",
	},
	[40] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：37600</font><br><font color='#FFFF00'>对怪增伤：37%</font><br><font color='#FFFF00'>爆率加成：34%</font>",
	},
	[41] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：40000</font><br><font color='#FFFF00'>对怪增伤：40%</font><br><font color='#FFFF00'>爆率加成：36%</font>",
	},
	[42] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[43] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：1600</font><br><font color='#FFFF00'>受怪减伤：2%</font><br><font color='#FFFF00'>爆率加成：2%</font>",
	},
	[44] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：2400</font><br><font color='#FFFF00'>受怪减伤：3%</font><br><font color='#FFFF00'>爆率加成：3%</font>",
	},
	[45] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：3200</font><br><font color='#FFFF00'>受怪减伤：4%</font><br><font color='#FFFF00'>爆率加成：4%</font>",
	},
	[46] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：4000</font><br><font color='#FFFF00'>受怪减伤：5%</font><br><font color='#FFFF00'>爆率加成：5%</font>",
	},
	[47] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：4800</font><br><font color='#FFFF00'>受怪减伤：6%</font><br><font color='#FFFF00'>爆率加成：6%</font>",
	},
	[48] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：5600</font><br><font color='#FFFF00'>受怪减伤：7%</font><br><font color='#FFFF00'>爆率加成：7%</font>",
	},
	[49] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：6400</font><br><font color='#FFFF00'>受怪减伤：8%</font><br><font color='#FFFF00'>爆率加成：8%</font>",
	},
	[50] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：8000</font><br><font color='#FFFF00'>受怪减伤：9%</font><br><font color='#FFFF00'>爆率加成：9%</font>",
	},
	[51] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：9600</font><br><font color='#FFFF00'>受怪减伤：10%</font><br><font color='#FFFF00'>爆率加成：10%</font>",
	},
	[52] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：11200</font><br><font color='#FFFF00'>受怪减伤：11%</font><br><font color='#FFFF00'>爆率加成：11%</font>",
	},
	[53] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：12800</font><br><font color='#FFFF00'>受怪减伤：12%</font><br><font color='#FFFF00'>爆率加成：12%</font>",
	},
	[54] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：14400</font><br><font color='#FFFF00'>受怪减伤：13%</font><br><font color='#FFFF00'>爆率加成：14%</font>",
	},
	[55] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：16000</font><br><font color='#FFFF00'>受怪减伤：15%</font><br><font color='#FFFF00'>爆率加成：16%</font>",
	},
	[56] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：18400</font><br><font color='#FFFF00'>受怪减伤：17%</font><br><font color='#FFFF00'>爆率加成：18%</font>",
	},
	[57] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：20800</font><br><font color='#FFFF00'>受怪减伤：19%</font><br><font color='#FFFF00'>爆率加成：20%</font>",
	},
	[58] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：23200</font><br><font color='#FFFF00'>受怪减伤：21%</font><br><font color='#FFFF00'>爆率加成：22%</font>",
	},
	[59] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：25600</font><br><font color='#FFFF00'>受怪减伤：23%</font><br><font color='#FFFF00'>爆率加成：24%</font>",
	},
	[60] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：28000</font><br><font color='#FFFF00'>受怪减伤：25%</font><br><font color='#FFFF00'>爆率加成：26%</font>",
	},
	[61] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：30400</font><br><font color='#FFFF00'>受怪减伤：28%</font><br><font color='#FFFF00'>爆率加成：28%</font>",
	},
	[62] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：32800</font><br><font color='#FFFF00'>受怪减伤：31%</font><br><font color='#FFFF00'>爆率加成：30%</font>",
	},
	[63] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：35200</font><br><font color='#FFFF00'>受怪减伤：34%</font><br><font color='#FFFF00'>爆率加成：32%</font>",
	},
	[64] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：37600</font><br><font color='#FFFF00'>受怪减伤：37%</font><br><font color='#FFFF00'>爆率加成：34%</font>",
	},
	[65] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：40000</font><br><font color='#FFFF00'>受怪减伤：40%</font><br><font color='#FFFF00'>爆率加成：36%</font>",
	},
	[66] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[67] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：800-800</font><br><font color='#FFFF00'>防御加成：4%</font><br><font color='#FFFF00'>闪避：2%</font>",
	},
	[68] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：1200-1200</font><br><font color='#FFFF00'>防御加成：6%</font><br><font color='#FFFF00'>闪避：3%</font>",
	},
	[69] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：1600-1600</font><br><font color='#FFFF00'>防御加成：8%</font><br><font color='#FFFF00'>闪避：4%</font>",
	},
	[70] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：2000-2000</font><br><font color='#FFFF00'>防御加成：10%</font><br><font color='#FFFF00'>闪避：5%</font>",
	},
	[71] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：2400-2400</font><br><font color='#FFFF00'>防御加成：12%</font><br><font color='#FFFF00'>闪避：6%</font>",
	},
	[72] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：2800-2800</font><br><font color='#FFFF00'>防御加成：14%</font><br><font color='#FFFF00'>闪避：7%</font>",
	},
	[73] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：3200-3200</font><br><font color='#FFFF00'>防御加成：16%</font><br><font color='#FFFF00'>闪避：8%</font>",
	},
	[74] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：3600-3600</font><br><font color='#FFFF00'>防御加成：18%</font><br><font color='#FFFF00'>闪避：9%</font>",
	},
	[75] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：4000-4000</font><br><font color='#FFFF00'>防御加成：20%</font><br><font color='#FFFF00'>闪避：10%</font>",
	},
	[76] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：4600-4600</font><br><font color='#FFFF00'>防御加成：22%</font><br><font color='#FFFF00'>闪避：11%</font>",
	},
	[77] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：5200-5200</font><br><font color='#FFFF00'>防御加成：24%</font><br><font color='#FFFF00'>闪避：12%</font>",
	},
	[78] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：5800-5800</font><br><font color='#FFFF00'>防御加成：26%</font><br><font color='#FFFF00'>闪避：13%</font>",
	},
	[79] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：6400-6400</font><br><font color='#FFFF00'>防御加成：28%</font><br><font color='#FFFF00'>闪避：14%</font>",
	},
	[80] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：7000-7000</font><br><font color='#FFFF00'>防御加成：30%</font><br><font color='#FFFF00'>闪避：15%</font>",
	},
	[81] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：7600-7600</font><br><font color='#FFFF00'>防御加成：32%</font><br><font color='#FFFF00'>闪避：16%</font>",
	},
	[82] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：8200-8200</font><br><font color='#FFFF00'>防御加成：34%</font><br><font color='#FFFF00'>闪避：17%</font>",
	},
	[83] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：8800-8800</font><br><font color='#FFFF00'>防御加成：36%</font><br><font color='#FFFF00'>闪避：18%</font>",
	},
	[84] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：9400-9400</font><br><font color='#FFFF00'>防御加成：38%</font><br><font color='#FFFF00'>闪避：19%</font>",
	},
	[85] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：10000-10000</font><br><font color='#FFFF00'>防御加成：40%</font><br><font color='#FFFF00'>闪避：20%</font>",
	},
	[86] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：10800-10800</font><br><font color='#FFFF00'>防御加成：42%</font><br><font color='#FFFF00'>闪避：21%</font>",
	},
	[87] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：11600-11600</font><br><font color='#FFFF00'>防御加成：44%</font><br><font color='#FFFF00'>闪避：22%</font>",
	},
	[88] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：12400-12400</font><br><font color='#FFFF00'>防御加成：46%</font><br><font color='#FFFF00'>闪避：23%</font>",
	},
	[89] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：13200-13200</font><br><font color='#FFFF00'>防御加成：48%</font><br><font color='#FFFF00'>闪避：24%</font>",
	},
	[90] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：14000-14000</font><br><font color='#FFFF00'>防御加成：50%</font><br><font color='#FFFF00'>闪避：25%</font>",
	},
	[91] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：14800-14800</font><br><font color='#FFFF00'>防御加成：52%</font><br><font color='#FFFF00'>闪避：26%</font>",
	},
	[92] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：15600-15600</font><br><font color='#FFFF00'>防御加成：54%</font><br><font color='#FFFF00'>闪避：27%</font>",
	},
	[93] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：16400-16400</font><br><font color='#FFFF00'>防御加成：56%</font><br><font color='#FFFF00'>闪避：28%</font>",
	},
	[94] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：17200-17200</font><br><font color='#FFFF00'>防御加成：58%</font><br><font color='#FFFF00'>闪避：29%</font>",
	},
	[95] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：18000-18000</font><br><font color='#FFFF00'>防御加成：60%</font><br><font color='#FFFF00'>闪避：30%</font>",
	},
	[96] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：19000-19000</font><br><font color='#FFFF00'>防御加成：62%</font><br><font color='#FFFF00'>闪避：31%</font>",
	},
	[97] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：20000-20000</font><br><font color='#FFFF00'>防御加成：64%</font><br><font color='#FFFF00'>闪避：32%</font>",
	},
	[98] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：21000-21000</font><br><font color='#FFFF00'>防御加成：66%</font><br><font color='#FFFF00'>闪避：33%</font>",
	},
	[99] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：22000-22000</font><br><font color='#FFFF00'>防御加成：68%</font><br><font color='#FFFF00'>闪避：34%</font>",
	},
	[100] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：23000-23000</font><br><font color='#FFFF00'>防御加成：70%</font><br><font color='#FFFF00'>闪避：35%</font>",
	},
	[101] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：24000-24000</font><br><font color='#FFFF00'>防御加成：72%</font><br><font color='#FFFF00'>闪避：36%</font>",
	},
	[102] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：25000-25000</font><br><font color='#FFFF00'>防御加成：74%</font><br><font color='#FFFF00'>闪避：37%</font>",
	},
	[103] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：26000-26000</font><br><font color='#FFFF00'>防御加成：76%</font><br><font color='#FFFF00'>闪避：38%</font>",
	},
	[104] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：27000-27000</font><br><font color='#FFFF00'>防御加成：78%</font><br><font color='#FFFF00'>闪避：39%</font>",
	},
	[105] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：28000-28000</font><br><font color='#FFFF00'>防御加成：80%</font><br><font color='#FFFF00'>闪避：40%</font>",
	},
	[106] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：29200-29200</font><br><font color='#FFFF00'>防御加成：82%</font><br><font color='#FFFF00'>闪避：41%</font>",
	},
	[107] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：30400-30400</font><br><font color='#FFFF00'>防御加成：84%</font><br><font color='#FFFF00'>闪避：42%</font>",
	},
	[108] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：31600-31600</font><br><font color='#FFFF00'>防御加成：86%</font><br><font color='#FFFF00'>闪避：43%</font>",
	},
	[109] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：32800-32800</font><br><font color='#FFFF00'>防御加成：88%</font><br><font color='#FFFF00'>闪避：44%</font>",
	},
	[110] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：34000-34000</font><br><font color='#FFFF00'>防御加成：90%</font><br><font color='#FFFF00'>闪避：45%</font>",
	},
	[111] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：35200-35200</font><br><font color='#FFFF00'>防御加成：92%</font><br><font color='#FFFF00'>闪避：46%</font>",
	},
	[112] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：36400-36400</font><br><font color='#FFFF00'>防御加成：94%</font><br><font color='#FFFF00'>闪避：47%</font>",
	},
	[113] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：40000-40000</font><br><font color='#FFFF00'>防御加成：100%</font><br><font color='#FFFF00'>闪避：50%</font>",
	},
	[114] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：8000</font><br><font color='#FFFF00'>生命加成：2%</font><br><font color='#FFFF00'>格挡率：5%</font><br><font color='#FFFF00'>格挡免伤：5%</font>",
	},
	[115] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[116] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：24000</font><br><font color='#FFFF00'>生命加成：6%</font><br><font color='#FFFF00'>格挡率：7%</font><br><font color='#FFFF00'>格挡免伤：7%</font>",
	},
	[117] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：32000</font><br><font color='#FFFF00'>生命加成：8%</font><br><font color='#FFFF00'>格挡率：8%</font><br><font color='#FFFF00'>格挡免伤：8%</font>",
	},
	[118] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：40000</font><br><font color='#FFFF00'>生命加成：10%</font><br><font color='#FFFF00'>格挡率：9%</font><br><font color='#FFFF00'>格挡免伤：9%</font>",
	},
	[119] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：48000</font><br><font color='#FFFF00'>生命加成：12%</font><br><font color='#FFFF00'>格挡率：10%</font><br><font color='#FFFF00'>格挡免伤：10%</font>",
	},
	[120] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：56000</font><br><font color='#FFFF00'>生命加成：14%</font><br><font color='#FFFF00'>格挡率：11%</font><br><font color='#FFFF00'>格挡免伤：11%</font>",
	},
	[121] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：64000</font><br><font color='#FFFF00'>生命加成：16%</font><br><font color='#FFFF00'>格挡率：12%</font><br><font color='#FFFF00'>格挡免伤：12%</font>",
	},
	[122] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：72000</font><br><font color='#FFFF00'>生命加成：18%</font><br><font color='#FFFF00'>格挡率：13%</font><br><font color='#FFFF00'>格挡免伤：13%</font>",
	},
	[123] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：80000</font><br><font color='#FFFF00'>生命加成：20%</font><br><font color='#FFFF00'>格挡率：14%</font><br><font color='#FFFF00'>格挡免伤：14%</font>",
	},
	[124] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：92000</font><br><font color='#FFFF00'>生命加成：22%</font><br><font color='#FFFF00'>格挡率：15%</font><br><font color='#FFFF00'>格挡免伤：15%</font>",
	},
	[125] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：104000</font><br><font color='#FFFF00'>生命加成：24%</font><br><font color='#FFFF00'>格挡率：16%</font><br><font color='#FFFF00'>格挡免伤：16%</font>",
	},
	[126] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：116000</font><br><font color='#FFFF00'>生命加成：26%</font><br><font color='#FFFF00'>格挡率：17%</font><br><font color='#FFFF00'>格挡免伤：17%</font>",
	},
	[127] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：128000</font><br><font color='#FFFF00'>生命加成：28%</font><br><font color='#FFFF00'>格挡率：18%</font><br><font color='#FFFF00'>格挡免伤：18%</font>",
	},
	[128] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：140000</font><br><font color='#FFFF00'>生命加成：30%</font><br><font color='#FFFF00'>格挡率：19%</font><br><font color='#FFFF00'>格挡免伤：19%</font>",
	},
	[129] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：152000</font><br><font color='#FFFF00'>生命加成：32%</font><br><font color='#FFFF00'>格挡率：20%</font><br><font color='#FFFF00'>格挡免伤：20%</font>",
	},
	[130] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：164000</font><br><font color='#FFFF00'>生命加成：34%</font><br><font color='#FFFF00'>格挡率：21%</font><br><font color='#FFFF00'>格挡免伤：21%</font>",
	},
	[131] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：176000</font><br><font color='#FFFF00'>生命加成：36%</font><br><font color='#FFFF00'>格挡率：22%</font><br><font color='#FFFF00'>格挡免伤：22%</font>",
	},
	[132] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：188000</font><br><font color='#FFFF00'>生命加成：38%</font><br><font color='#FFFF00'>格挡率：23%</font><br><font color='#FFFF00'>格挡免伤：23%</font>",
	},
	[133] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：200000</font><br><font color='#FFFF00'>生命加成：40%</font><br><font color='#FFFF00'>格挡率：24%</font><br><font color='#FFFF00'>格挡免伤：24%</font>",
	},
	[134] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：216000</font><br><font color='#FFFF00'>生命加成：42%</font><br><font color='#FFFF00'>格挡率：25%</font><br><font color='#FFFF00'>格挡免伤：25%</font>",
	},
	[135] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：232000</font><br><font color='#FFFF00'>生命加成：44%</font><br><font color='#FFFF00'>格挡率：26%</font><br><font color='#FFFF00'>格挡免伤：26%</font>",
	},
	[136] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：248000</font><br><font color='#FFFF00'>生命加成：46%</font><br><font color='#FFFF00'>格挡率：27%</font><br><font color='#FFFF00'>格挡免伤：27%</font>",
	},
	[137] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：264000</font><br><font color='#FFFF00'>生命加成：48%</font><br><font color='#FFFF00'>格挡率：28%</font><br><font color='#FFFF00'>格挡免伤：28%</font>",
	},
	[138] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：280000</font><br><font color='#FFFF00'>生命加成：50%</font><br><font color='#FFFF00'>格挡率：29%</font><br><font color='#FFFF00'>格挡免伤：29%</font>",
	},
	[139] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：296000</font><br><font color='#FFFF00'>生命加成：52%</font><br><font color='#FFFF00'>格挡率：30%</font><br><font color='#FFFF00'>格挡免伤：30%</font>",
	},
	[140] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：312000</font><br><font color='#FFFF00'>生命加成：54%</font><br><font color='#FFFF00'>格挡率：31%</font><br><font color='#FFFF00'>格挡免伤：31%</font>",
	},
	[141] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：328000</font><br><font color='#FFFF00'>生命加成：56%</font><br><font color='#FFFF00'>格挡率：32%</font><br><font color='#FFFF00'>格挡免伤：32%</font>",
	},
	[142] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：344000</font><br><font color='#FFFF00'>生命加成：58%</font><br><font color='#FFFF00'>格挡率：33%</font><br><font color='#FFFF00'>格挡免伤：33%</font>",
	},
	[143] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：360000</font><br><font color='#FFFF00'>生命加成：60%</font><br><font color='#FFFF00'>格挡率：34%</font><br><font color='#FFFF00'>格挡免伤：34%</font>",
	},
	[144] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：380000</font><br><font color='#FFFF00'>生命加成：62%</font><br><font color='#FFFF00'>格挡率：35%</font><br><font color='#FFFF00'>格挡免伤：35%</font>",
	},
	[145] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：400000</font><br><font color='#FFFF00'>生命加成：64%</font><br><font color='#FFFF00'>格挡率：36%</font><br><font color='#FFFF00'>格挡免伤：36%</font>",
	},
	[146] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：420000</font><br><font color='#FFFF00'>生命加成：66%</font><br><font color='#FFFF00'>格挡率：37%</font><br><font color='#FFFF00'>格挡免伤：37%</font>",
	},
	[147] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：440000</font><br><font color='#FFFF00'>生命加成：68%</font><br><font color='#FFFF00'>格挡率：38%</font><br><font color='#FFFF00'>格挡免伤：38%</font>",
	},
	[148] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：460000</font><br><font color='#FFFF00'>生命加成：70%</font><br><font color='#FFFF00'>格挡率：39%</font><br><font color='#FFFF00'>格挡免伤：39%</font>",
	},
	[149] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：480000</font><br><font color='#FFFF00'>生命加成：72%</font><br><font color='#FFFF00'>格挡率：40%</font><br><font color='#FFFF00'>格挡免伤：40%</font>",
	},
	[150] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：500000</font><br><font color='#FFFF00'>生命加成：74%</font><br><font color='#FFFF00'>格挡率：41%</font><br><font color='#FFFF00'>格挡免伤：41%</font>",
	},
	[151] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：520000</font><br><font color='#FFFF00'>生命加成：76%</font><br><font color='#FFFF00'>格挡率：42%</font><br><font color='#FFFF00'>格挡免伤：42%</font>",
	},
	[152] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：540000</font><br><font color='#FFFF00'>生命加成：78%</font><br><font color='#FFFF00'>格挡率：43%</font><br><font color='#FFFF00'>格挡免伤：43%</font>",
	},
	[153] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：560000</font><br><font color='#FFFF00'>生命加成：80%</font><br><font color='#FFFF00'>格挡率：44%</font><br><font color='#FFFF00'>格挡免伤：44%</font>",
	},
	[154] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：584000</font><br><font color='#FFFF00'>生命加成：82%</font><br><font color='#FFFF00'>格挡率：45%</font><br><font color='#FFFF00'>格挡免伤：45%</font>",
	},
	[155] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：608000</font><br><font color='#FFFF00'>生命加成：84%</font><br><font color='#FFFF00'>格挡率：46%</font><br><font color='#FFFF00'>格挡免伤：46%</font>",
	},
	[156] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：632000</font><br><font color='#FFFF00'>生命加成：86%</font><br><font color='#FFFF00'>格挡率：47%</font><br><font color='#FFFF00'>格挡免伤：47%</font>",
	},
	[157] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：656000</font><br><font color='#FFFF00'>生命加成：88%</font><br><font color='#FFFF00'>格挡率：48%</font><br><font color='#FFFF00'>格挡免伤：48%</font>",
	},
	[158] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：680000</font><br><font color='#FFFF00'>生命加成：90%</font><br><font color='#FFFF00'>格挡率：49%</font><br><font color='#FFFF00'>格挡免伤：49%</font>",
	},
	[159] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：704000</font><br><font color='#FFFF00'>生命加成：92%</font><br><font color='#FFFF00'>格挡率：50%</font><br><font color='#FFFF00'>格挡免伤：50%</font>",
	},
	[160] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：744000</font><br><font color='#FFFF00'>生命加成：96%</font><br><font color='#FFFF00'>格挡率：51%</font><br><font color='#FFFF00'>格挡免伤：51%</font>",
	},
	[161] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：800000</font><br><font color='#FFFF00'>生命加成：100%</font><br><font color='#FFFF00'>格挡率：54%</font><br><font color='#FFFF00'>格挡免伤：54%</font>",
	},
	[162] = {
		desc = "<font color='#FF0000'>攻击加成：20%    防御加成：40%<br>生命加成：40%    对怪增伤：20%<br>怪物爆率：20%    神装爆率：25%</font>",
	},
	[163] = {
		desc = "<font color='#FF6600'>攻击加成：15%    防御加成：30%<br>生命加成：30%    对怪增伤：15%<br>怪物爆率：15%</font>",
	},
	[164] = {
		desc = "<font color='#FFFF00'>攻击加成：10%    防御加成：20%<br>生命加成：20%    对怪增伤：10%<br>怪物爆率：10%</font>",
	},
	[165] = {
		desc = "<font color='#FF00FF'>攻击加成：8%      防御加成：16%<br>生命加成：16%    对怪增伤：8%</font>",
	},
	[166] = {
		desc = "<font color='#66FF99'>攻击加成：6%      防御加成：12%<br>生命加成：12%    对怪增伤：6%</font>",
	},
	[21200] = {
		desc = "<font colorStyleID='1040'>熔炼说明：</font><br/><font colorStyleID='1038'>熔炼装备几率获得强化石！！！</font>",
	},
	[20200] = {
		desc = "若融合失败辅材会破损消失！！",
	},
	[21300] = {
		desc = "若进阶失败会破损一个装备！！",
	},
	[21400] = {
		desc = "若融合失败辅材会破损消失！！",
	},
	[21500] = {
		desc = "<font colorStyleID='1040'>装备强星：</font><br/><font colorStyleID='1038'>1.装备强星可以提升大量属性。</font><br/><font colorStyleID='1038'>2.强星失败装备将降一个星级</font><br/><font colorStyleID='1038'>3.商城购买幸运石可保护装备强星失败不降星。</font>",
	},
	[167] = {
		desc = "<font color='0x01d1ff'>打宝概率提升 2%<br>装备回收比例提升5%<br>对怪每秒伤害提升960</font>",
	},
	[168] = {
		desc = "<font color='0x01d1ff'>打宝概率提升4%<br>装备回收比例提升10%<br>对怪每秒伤害提升2400</font>",
	},
	[169] = {
		desc = "<font color='0x01d1ff'>打宝概率提升6%<br>装备回收比例提升15%<br>对怪每秒伤害提升6400</font>",
	},
	[170] = {
		desc = "<font color='0x01d1ff'>打宝概率提升8%<br>装备回收比例提升20%<br>对怪每秒伤害提升9600</font>",
	},
	[171] = {
		desc = "<font color='0x01d1ff'>打宝概率提升10%<br>装备回收比例提升25%<br>对怪每秒伤害提升12800</font>",
	},
	[172] = {
		desc = "<font color='0x01d1ff'>打宝概率提升12%<br>装备回收比例提升30%<br>对怪每秒伤害提升19200</font>",
	},
	[173] = {
		desc = "<font color='0x01d1ff'>打宝概率提升14%<br>装备回收比例提升35%<br>对怪每秒伤害提升25600</font>",
	},
	[174] = {
		desc = "<font color='0x01d1ff'>打宝概率提升16%<br>装备回收比例提升40%<br>对怪每秒伤害提升32000</font>",
	},
	[175] = {
		desc = "<font color='0x01d1ff'>打宝概率提升18%<br>装备回收比例提升45%<br>对怪每秒伤害提升38400</font>",
	},
	[176] = {
		desc = "<font color='0x01d1ff'>打宝概率提升20%<br>装备回收比例提升50%<br>对怪每秒伤害提升44800</font>",
	},
	[177] = {
		desc = "<font color='0x01d1ff'>打宝概率提升22%<br>装备回收比例提升55%<br>对怪每秒伤害提升51200</font>",
	},
	[178] = {
		desc = "<font color='0x01d1ff'>打宝概率提升24%<br>装备回收比例提升60%<br>对怪每秒伤害提升64000</font>",
	},
	[179] = {
		desc = "<font color='0x01f801'>打宝概率提升 26%<br>装备回收比例提升 65%<br>对怪每秒伤害提升76800</font>",
	},
	[180] = {
		desc = "<font color='0x01f801'>打宝概率提升 28%<br>装备回收比例提升 70%<br>对怪每秒伤害提升 89600</font>",
	},
	[181] = {
		desc = "<font color='0x01f801'>打宝概率提升 30%<br>装备回收比例提升 75%<br>对怪每秒伤害提升 102400</font>",
	},
	[182] = {
		desc = "<font color='0x01f801'>打宝概率提升 32%<br>装备回收比例提升 80%<br>对怪每秒伤害提升 115200</font>",
	},
	[183] = {
		desc = "<font color='0x01f801'>打宝概率提升 34%<br>装备回收比例提升 85%<br>对怪每秒伤害提升 128000</font>",
	},
	[184] = {
		desc = "<font color='0x01f801'>打宝概率提升 36%<br>装备回收比例提升 90%<br>对怪每秒伤害提升 140800</font>",
	},
}
return config