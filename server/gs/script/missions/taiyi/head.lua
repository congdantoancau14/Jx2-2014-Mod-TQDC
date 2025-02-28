Include("\\settings\\static_script\\missions\\base\\phasebase.lua");
Include("\\settings\\static_script\\missions\\base\\mission_head.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\time.lua");
Include("\\script\\lib\\message.lua");
Include("\\script\\missions\\taiyi\\box\\boxes.lua")

thisFile ="\\script\\missions\\taiyi\\mission.lua";

TYT_IB_ITEM = {"Thi猲 Ki猽 L謓h",2, 97, 236};  --代币

DebugOutput = nothing

TOTAL_STAGE = 6;	--关键stage数量[策划玩法中的stage数量]
LEVEL_RANGE = TOTAL_STAGE + 3*3 + 3;	--当nStageId <= LEVEL_RANGE时为梵天林

--Difficulty Type
eDifType = {
	NORMAL = 1,
	HARD = 2,
};

eMSName = {
	FOREST = 1,
	TOWER = 2,
};

tGlbValue = {
	[eMSName.FOREST] = {
		[eDifType.NORMAL] = {GV_TY_FOREST_NORMAL_MAX_MAP, 30, "Ph筺 Thi猲 L﹎"},	--开场计数，开场上限
		[eDifType.HARD] = {GV_TY_FOREST_HARD_MAX_MAP, 30, "Ph筺 Thi猲 L﹎"},
	},
	[eMSName.TOWER] = {
		[eDifType.NORMAL] = {GV_TY_TOWER_NORMAL_MAX_MAP, 30, "Th竔 Nh蕋 Th竝"},
		[eDifType.HARD] = {GV_TY_TOWER_HARD_MAX_MAP, 30, "Th竔 Nh蕋 Th竝"},
	},
};

tOptions = {
	[eMSName.FOREST] = {
		[eDifType.NORMAL] = {
			["MemberNum"] = {1, 8},
			["MemberHaveRoute"] = 1,
			["MemberLevel"] = {90, 999},
			["PKValue"] = {0, 9},
		},
		[eDifType.HARD] = {
			["MemberNum"] = {4, 8},
			["MemberRouteNum"] = {4, 8},
			["MemberLevel"] = {90, 999},
			["MemberHaveRoute"] = 1,
			["RoomWeight"] = {1, 10},
			["PKValue"] = {0, 9},
		},
	},
	[eMSName.TOWER] = {
		[eDifType.NORMAL] = {
			["MemberNum"] = {1, 8},
			["MemberHaveRoute"] = 1,
			["MemberLevel"] = {90, 999},
			["PKValue"] = {0, 9},
		},
		[eDifType.HARD] = {
			["MemberNum"] = {4, 8},
			["MemberRouteNum"] = {4, 8},
			["MemberLevel"] = {90, 999},
			["MemberHaveRoute"] = 1,
			["RoomWeight"] = {1, 10},
			["PKValue"] = {0, 9},
		},
	},
};


--经验倍数
tExpMul = {
	[eDifType.NORMAL] = {
		[1] = 0.6,
		[2] = 0.8,
		[3] = 0.9,
		[4] = 1.0,
		[5] = 1.2,
		[6] = 1.4,
		[7] = 1.6,
		[8] = 2.0,
	},
	[eDifType.HARD] = {
		[4] = 1.0,
		[5] = 1.2,
		[6] = 1.4,
		[7] = 1.6,
		[8] = 2.0,
	},
};

tGodStates	= {
	tInfo	= {"Ch﹏ Thi猲 Th莕 h� ph祄", 5},
	tState	= {
		[1] = {9920, "state_life_max_percent_add",	1000,	"Sinh l鵦 t╪g t鑙 產 10 l莕"},
		[2] = {9921, "state_p_attack_percent_add",		100,	"T蕁 c玭g ngo筰 c玭g +100%"},	
		[3] = {9922, "state_m_attack_percent_add",		100,	"T蕁 c玭g n閕 c玭g +100%"},
		[4] = {9923, "state_immune",				100,	"Tr筺g th竔 mi詎 d辌h  "},
	},
}

--6关对应的nStageId
tMainLevelID = {
	[TOTAL_STAGE + 1*3 + 2] = 1,
	[TOTAL_STAGE + 2*3 + 2] = 2,
	[TOTAL_STAGE + 3*3 + 2] = 3,
	[TOTAL_STAGE + 4*3 + 2] = 4,
	[TOTAL_STAGE + 5*3 + 2] = 5,
	[TOTAL_STAGE + 6*3 + 2] = 6,
};

tTY = {
	name ="Th竔 Nh蕋 Th竝",
	missionID = 66,
	realMapID = 6075,
	dynamicMap = 1,
	
	----------------------
	mv_01 = 1,	--1:梵天林 2:太一塔
	mv_02 = 2,	--1:普通版 2:英雄版
	mv_03 = 3,	--1:作弊模式 0:非作弊
	mv_04 = 4,	--翻牌前的队长索引
	
	mv_20 = 20,	--当前是哪段对话
	mv_21 = 21,	--当前段对话的第几句
	mv_22 = 22,
	mv_23 = 23,
	mv_24 = 24,
	mv_25 = 25,
	mv_26 = 26,
	mv_27 = 27,
	mv_28 = 28,
	mv_29 = 29,
	mv_30 = 30,
	mv_31 = 31,
	mv_32 = 32,
	mv_33 = 33,
	mv_34 = 34,
	mv_35 = 35,		--记录谁开的箱子
	mv_36 = 36,		--记录奖励loot
	----------------------
	ms20 = 20,
};

tTY = gf_CopyInherit(missionHead, tTY);

tTY_msOption = {
	bSetPkFlag = 0, --练功模式
	bSetPkCamp = 0,
	szInitDeahScript = thisFile,
}

--地图上已经创建出的NPC缓存
tExistNpcList = {
--	[nMapIdx] = {
--		{szName, nNpcIdx},
--	},
};

--时间驱动器
tPhaseDriver = {
	timerID = 96,
	maxsecond = 120*60,
};
tPhaseDriver = gf_CopyInherit(phaseBase, tPhaseDriver);

tNpcs = {
	mgy_1 = {"TYT_XianfengMGY","M閏 Qu� Anh", thisFile, CampPlayer},
	mgy_2 = {"TYT_TaiyiBSMGY","M閏 Qu� Anh", thisFile, CampPlayer},
	mgy_3 = {"TYT_HtaiyiMGY","M閏 Qu� Anh", thisFile, CampEnemy},
	mgy_3_1 = {"TYT_NtaiyiMGY", "M閏 Qu� Anh", thisFile, CampEnemy},
	
	yzb_1 = {"TYT_XianfengYZB","Dng T玭 B秓", thisFile, CampPlayer},
	yzb_2 = {"TYT_TaiyiBSYZB","Dng T玭 B秓", thisFile, CampPlayer},
	yzb_3 = {"TYT_HtaiyiYZB","Dng T玭 B秓", thisFile, CampEnemy},
	yzb_3_1 = {"TYT_NtaiyiYZB", "Dng T玭 B秓", thisFile, CampEnemy},
	xy = {"TYT_HyuxiuluoXY","Ng鋍 Tu La Ti猽 D辌h", thisFile, CampEnemy},
	xy_1 = {"TYT_NyuxiuluoXY","Ng鋍 Tu La Ti猽 D辌h", thisFile, CampEnemy},
	xlsy = {"TYT_HXYsuiying","Tu La To竔 秐h", thisFile, CampEnemy},
	xlsy_1 = {"TYT_NXYsuiying","Tu La To竔 秐h", thisFile, CampEnemy},
	jltys1 = {"TYT_HjingleiTYS","C鰑 Long Th玭 V﹏ Th�", thisFile, CampEnemy},
	jltys1_1 = {"TYT_NjingleiTYS","C鰑 Long Th玭 V﹏ Th�", thisFile, CampEnemy},
	jltys2 = {"TYT_HyehuoTYS","C鰑 Long Th玭 V﹏ Th�", thisFile, CampEnemy},
	jltys2_1 = {"TYT_NyehuoTYS","C鰑 Long Th玭 V﹏ Th�", thisFile, CampEnemy},
	bx = {"TYT_HBixie","Th莕 Th� T辌h T�", thisFile, CampEnemy},
	bx_1 = {"TYT_NBixie","Th莕 Th� T辌h T�", thisFile, CampEnemy},
	hhlj = {"TYT_HHHLJ","Hoang H醓 L璾 Kim", thisFile, CampEnemy},
	hhlj_1 = {"TYT_NHHLJ","Hoang H醓 L璾 Kim", thisFile, CampEnemy},
	ljfb = {"TYT_LJFB","L璾 Kin Phong B筼", thisFile, CampEnemy},
	ljfb_1 = {"TYT_LJFB","L璾 Kin Phong B筼", thisFile, CampEnemy},
	ylfh = {"TYT_HYLFH","Gia Lu藅 Phi H錸g", thisFile, CampEnemy},
	ylfh_1 = {"TYT_NYLFH","Gia Lu藅 Phi H錸g", thisFile, CampEnemy},
	jjg = {"TYT_Jingjing","Thanh Thanh C� Nng", "\\script\\missions\\taiyi\\jjg_npc.lua", CampPlayer},
	tbjh = {"TYT_HSongsoul", "Thi猲 Ba Tinh Ph竎h", thisFile, CampEnemy},
	tbjh_1 = {"TYT_NSongsoul", "Thi猲 Ba Tinh Ph竎h", thisFile, CampEnemy},
	dsyh = {"TYT_HSongsoul", "Чi T鑞g Anh H錸", thisFile, CampEnemy},
	dsyh_1 = {"TYT_NSongsoul", "Чi T鑞g Anh H錸", thisFile, CampEnemy},
	yy = {"Dng Nghi謕", "Dng Nghi謕", thisFile, CampPlayer},
};

tNpcPos = {
	--穆桂英
	mgy = {
		[0] = {{1321, 2836},},	--梵天林准备区
		[1] = {{1453, 2908}, {1463, 2856}},	--第一关 开始位置，结束位置
		[2] = {{1611, 2915}, {1636, 2858}},
		[3] = {{1638, 3189}, {1639, 3187}},
		[4] = {{1212, 3491},},	--太一塔准备区
		[5] = {{1224, 3472}, {1249, 3439}},
		[6] = {{1443, 3529}, {1443, 3466}},
		[7] = {{1649, 3495}, {1661, 3478}}, 
	},
	yzb = {
		[0] = {{1325, 2834},},
		[1] = {{1446, 2904}, {1469, 2861}},
		[2] = {{1618, 2919}, {1642, 2857}},
		[3] = {{1632, 3183}, {1634, 3182}},
		[4] = {{1208, 3505},},	--太一塔准备区
		[5] = {{1229, 3478}, {1254, 3445}},
		[6] = {{1454, 3529}, {1456, 3468}},
		[7] = {{1654, 3502}, {1671, 3487}},
	},
	jjg = {
		[0] = {{1416, 3120},},
	},
	--萧奕
	xy = {
		[1] = {{1456, 2880},},
	},
	xlsy = {
		[1] = {{1456, 2880},},
	},
	jltys1 = {
		[2] = {{1627, 2891},},
	},
	mm = {
		[3] = {
			{1591, 3187},{1597, 3192},{1593, 3198},{1597, 3199},
			{1598, 3207},{1602, 3205},{1605, 3202},{1609, 3205},
			{1607, 3206},{1601, 3212},{1601, 3219},{1604, 3219},
			{1607, 3215},{1609, 3213},{1612, 3209},{1616, 3208},
			{1617, 3212},{1614, 3216},{1612, 3218},{1615, 3226},
			{1618, 3231},{1621, 3226},{1622, 3223},{1625, 3221},
			{1628, 3224},{1628, 3229},{1626, 3237},{1632, 3236},
			{1637, 3235},{1639, 3240},{1642, 3238},{1635, 3236},
		},
	},
	bx = {
		[5] = {
			{1241, 3461},
		},
	},
	mashroom = {
		[5] = {
			{1245, 3495},{1237, 3422},{1280, 3465},{1209, 3460}, 
			{1211, 3492},{1259, 3440},{1261, 3487},{1213, 3444},
		},
	},
	hhlj = {
		[6] = {
			{1451, 3495},
		},
	},
	ylfh = {
		[7] = {
			{1663, 3487}, {1658, 3493},
		},
	},
	yy = {
		[7] = {
			{1675, 3468},
		},
	},
	tbjh = {
		[7] = {
			{1628, 3476}, {1605, 3497}, {1614, 3518}, {1627, 3531},
			{1650, 3544}, {1670, 3526}, {1687, 3510},
		},
	},
};

tMovePos = {
	mgy = {
		[1] = {{{1456, 2880}}},
	},
};

tExitPos = {
	[100] = {1440, 2800},
	[200] = {1383, 3069},
	[300] = {1805, 3362},
	[350] = {1407, 2860},
};

--玩家闯关失败位置
tFailedPos = {
	{},
};

--玩家闯关成功刷新位置
tResetPos = {
	[1] = {1456, 2880},
};

tDeathPos = {1420, 3137};

tPlayerPos = {
	[0] = {{1320, 2853}, },
	[1] = {{1452, 2909}, {1460, 2864}},
	[2] = {{1617, 2915}, {1640, 2871}},
	[3] = {{1629, 3191}, {1630, 3192}},
	[4] = {{1212, 3491}, {1248, 3450}},
	[5] = {{1449, 3538}, {1449, 3473}},
	[6] = {{1645, 3506}, {1663, 3487}},
};

tList = {
	[2 ] = "Thi誹 L﹎ t鬰 gia",
	[3 ] = "Thi誹 L﹎ thi襫 t╪g",
	[4 ] = "Thi誹 L﹎ v� t╪g",
	[6 ] = "Л阯g M玭",
	[8 ] = "Nga My Ph藅 gia",
	[9 ] = "Nga My t鬰 gia",
	[11] = "C竔 Bang T躰h y",
	[12] = "C竔 Bang � Y",
	[14] = "V� ng o gia",
	[15] = "V� ng t鬰 gia",
	[17] = "Dng M玭 thng K�",
	[18] = "Dng M玭 Cung K�",
	[20] = "Hi謕 чc",
	[21] = "T� чc",
	[23] = "C玭 L玭 Thi猲 S�",
	--[25] = "明教圣战",
	--[26] = "明教阵兵",
	--[27] = "明教血人",
	[29] = "Th髖 Y猲 V� Ti猲",
	[30] = "Th髖 Y猲 Linh N�",
	--[31] = "唐门任侠",
	--[32] = "昆仑剑尊",
};

tRouteList = {
	[2] = {0, {260, 260},},
	[3] = {1, {0  , 200},},
	[4] = {1, {170,	170},},
	[6] = {0, {210, 210},},
	[8] = {1, {260,	260},},
	[9] = {1, {260, 260},},
	[11] ={0, {195,	195},},
	[12] ={0, {260, 260},},
	[14] ={1, {0  ,	0  },},
	[15] ={0, {230, 230},},
	[17] ={0, {195,	195},},
	[18] ={0, {110, 110},},
	[20] ={1, {390,	390},},
	[21] ={1, {260, 260},},
	[23] ={1, {0  ,	0  },},
	--[25] ={0, {130, 130},},
	--[26] ={0, {195,	195},},
	--[27] ={1, {130, 130},},
	[29] ={0, {0  ,	0  },},
	[30] ={0, {110, 110},},
	--[31] ={0, {100, 100},},
	--[32] ={0, {100, 100},},
};

--流派个数加成
TYT_EXP_ROUTE_COUNT_ADD = {
	[0] = 0,
	[1] = 0,
	[2] = 0,
	[3] = 0,
	[4] = 0,
	[5] = 0.2,
	[6] = 0.4,
	[7] = 0.6,
	[8] = 1,	
}

--过关经验表
TYT_EXP_AWARD = {
	[eMSName.FOREST] = {
		[eDifType.NORMAL] = {
			[1] = 2000000,
			[2] = 2200000,
			[3] = 3000000,
		},
		[eDifType.HARD] 	= {
			[1] = 6000000,
			[2] = 7000000,
			[3] = 9000000,
		},
	},
	[eMSName.TOWER] = {
		[eDifType.NORMAL] = {
			[1] = 3300000,
			[2] = 3600000,
			[3] = 4000000,
		},
		[eDifType.HARD] 	= {
			[1] = 9000000,
			[2] = 10000000,
			[3] = 12000000,
		},
	},
}

--过关掉箱子
TYT_DROP_BOX_AWARD = {
	[eMSName.FOREST] = {
		[eDifType.NORMAL] = {
--			[1] = {
--				{"tongbaoxiang", "铜宝箱", 1, "\\script\\missions\\taiyi\\box\\tong_box_1.lua"},
--				{"yinbaoxiang", "银宝箱", 4, "\\script\\missions\\taiyi\\box\\yin_box_1.lua"},
--			},
--			[2] = {
--				{"tongbaoxiang", "铜宝箱", 1, "\\script\\missions\\taiyi\\box\\tong_box_2.lua"},
--				{"yinbaoxiang", "银宝箱", 4, "\\script\\missions\\taiyi\\box\\yin_box_1.lua"},
--			},
--			[3] = {
--				{"jinbaoxiang", "金宝箱", 1, "\\script\\missions\\taiyi\\box\\jin_box_1.lua"},
--			},
			[1] = {
				{4, 1}, --box_id,num
				{12, 4},
				},
			[2] = {
				{5, 1},
				{12, 4},
				},
			[3] = {
				{23, 1},
				},
		},
		[eDifType.HARD] 	= {
			[1] = {
				{1, 1}, --box_id,num
				{11, 4},
				},
			[2] = {
				{2, 1},
				{11, 4},
				},
			[3] = {
				{21, 1},
				},
		},
	},
	[eMSName.TOWER] = {
		[eDifType.NORMAL] = {
			[1] = {
				{6, 1},
				{12, 4},
				},
			[2] = {
				{6, 1},
				{12, 4},
				},
			[3] = {
				{24, 1},
				},
--			[1] = {
--				{"tongbaoxiang", "铜宝箱", 1, "\\script\\missions\\taiyi\\box\\tong_box_3.lua"},
--				{"yinbaoxiang", "银宝箱", 4, "\\script\\missions\\taiyi\\box\\yin_box_1.lua"},
--			},
--			[2] = {
--				{"tongbaoxiang", "铜宝箱", 1, "\\script\\missions\\taiyi\\box\\tong_box_3.lua"},
--				{"yinbaoxiang", "银宝箱", 4, "\\script\\missions\\taiyi\\box\\yin_box_1.lua"},
--			},
--			[3] = {
--				{"jinbaoxiang", "金宝箱", 1, "\\script\\missions\\taiyi\\box\\jin_box_2.lua"},
--			},
		},
		[eDifType.HARD] 	= {
			[1] = {
				{3, 1},
				{11, 4},
				},
			[2] = {
				{3, 1},
				{11, 4},
				},
			[3] = {
				{22, 1},
				},
		},
	},
}

TYT_PRICE = {
	[1] = {	--梵天林
		[1] = {		--免费翻牌
			[1] = {	--NORMAL
				{"C﹜ B竧 Nh� nh�"			,{2,0,504,1,4},5000, 0, 7},
				{"C﹜ B竧 Nh�"				,{2,0,398,1,4},4000, 0, 7},
				{"C﹜ T� Linh"					,{2,1,30269,1,4},5000, 0, 7},
				{"Truy襫 C玭g Кn"					,{2,1,30313,1,4},5000, 0, 7},
				{"Tu Ch﹏ Y誹 Quy誸"				,{2,0,554,1,4},5000, 0, 7},
				{"Thi猲 L� Truy襫  Ph� Ch�"		,{2,1,3508,1,4},3000},
				{"T� Linh Quy Nguy猲 Кn"			,{2,1,30352,1,4},4000, 0, 7},
				{"B錳 Nguy猲 Кn"					,{2,1,30351,1,4},4000, 0, 7},
				{"B╪g Tinh Th筩h"					,{2,1,30554,1,4},4000},
				{"B筩h C﹗ Ho祅"					,{2,1,270,1,4},4000, 0, 7},
				{"T葃 T﹎ Th筩h Kho竛g"				,{2,1,30536,1},3000},
				{"Luy謓 L� Thi誸 Kho竛g"				,{2,1,30537,1},3000},
				{"V� Gm C�"			,{2,1,30694,1,4},4000},
				{"Thi誸 Tinh c蕄 1"				,{2,1,30533,1,4},4000},
				{"Thi誸 Tinh c蕄 2"				,{2,1,30534,1,4},4000},
				{"Thi誸 Tinh c蕄 3"				,{2,1,30535,1,4},3000},
				{"Vi猰 Linh Ti"					,{2,1,30671,1},10000},
				{"Da Ma Lang"					,{2,1,30672,1},10000},
				{"Da мa Long"					,{2,1,30673,1},10000},
				{"Nh鉳 u Linh у (Ng蓇 nhi猲)"		,{gf_RandLingTu, 1, 0},2000},
				{"Nh鉳 竜 Linh у (Ng蓇 nhi猲)"		,{gf_RandLingTu, 2, 0},2000},
				{"Nh鉳 qu莕 Linh у (Ng蓇 nhi猲)"		,{gf_RandLingTu, 3, 0},2000},
			},
			[2] = {	--HARD
			},
		},
		[2] = {		--付费翻牌
			[1] = {	--NORMAL
				{"C﹜ B竧 Nh� nh�"			,{2,0,504,1},5000, 0, 7},
				{"C﹜ B竧 Nh�"				,{2,0,398,1},5000, 0, 7},
				{"C﹜ T� Linh"					,{2,1,30269,1},5000, 0, 7},
				{"B筩h C﹗ Ho祅"					,{2,1,270,1},8000, 0, 7},
				{"Чi B筩h C﹗ ho祅"				,{2,1,1007,1},6000, 0, 7},
				{"B筩h C﹗ Ti猲 n"				,{2,1,1008,1},5000, 0, 7},
				{"Чi Nh﹏ s﹎"				,{2,0,553,1},5000, 0, 7},
				{"Hu﹏ chng anh h飊g"				,{2,1,30499,1,4},20000},
				{"Hu﹏ chng anh h飊g"				,{2,1,30499,2,4},7000},
				{"Hu﹏ chng anh h飊g"				,{2,1,30499,4,4},800},
				{"Hu﹏ chng anh h飊g"				,{2,1,30499,10,4},200},
				{"Th竔 Nh蕋 L謓h"					,{2,1,30687,1,4},0, 1},
				{"Th竔 Nh蕋 L謓h"					,{2,1,30687,2,4},0, 1},
				{"Th竔 Nh蕋 L謓h"					,{2,1,30687,4,4},0, 1},
				{"Vi猰 Linh Ti"					,{2,1,30671,1},10000},
				{"Da Ma Lang"					,{2,1,30672,1},10000},
				{"Da мa Long"					,{2,1,30673,1},10000},
				{"Nh鉳 u Linh у (Ch� nh)"		,{gf_RandLingTu, 1, 1},1000},
				{"Nh鉳 竜 Linh у (Ch� nh)"		,{gf_RandLingTu, 2, 1},1000},
				{"Nh鉳 qu莕 Linh у (Ch� nh)"		,{gf_RandLingTu, 3, 1},1000},
			},
			[2] = {	--HARD
			},
		},
	},
	[2] = {	--太一塔
		[1] = {		--免费翻牌
			[1] = {	--NORMAL
				{"C﹜ B竧 Nh� nh�"			,{2,0,504,1,4},5000, 0, 7},
				{"C﹜ B竧 Nh�"				,{2,0,398,1,4},4000, 0, 7},
				{"C﹜ T� Linh"					,{2,1,30269,1,4},5000, 0, 7},
				{"Truy襫 C玭g Кn"					,{2,1,30313,1,4},5000, 0, 7},
				{"Tu Ch﹏ Y誹 Quy誸"				,{2,0,554,1,4},5000, 0, 7},
				{"Thi猲 L� Truy襫  Ph� Ch�"		,{2,1,3508,1,4},3000},
				{"T� Linh Quy Nguy猲 Кn"			,{2,1,30352,1,4},4000, 0, 7},
				{"B錳 Nguy猲 Кn"					,{2,1,30351,1,4},4000, 0, 7},
				{"B╪g Tinh Th筩h"					,{2,1,30554,1,4},4000},
				{"B筩h C﹗ Ho祅"					,{2,1,270,1,4},4000, 0, 7},
				{"T葃 T﹎ Th筩h Kho竛g"				,{2,1,30536,1},3000},
				{"Luy謓 L� Thi誸 Kho竛g"				,{2,1,30537,1},3000},
				{"V� Gm C�"			,{2,1,30694,1,4},4000},
				{"Thi誸 Tinh c蕄 1"				,{2,1,30533,1,4},4000},
				{"Thi誸 Tinh c蕄 2"				,{2,1,30534,1,4},4000},
				{"Thi誸 Tinh c蕄 3"				,{2,1,30535,1,4},3000},
				{"Vi猰 Linh Ti"					,{2,1,30671,1},10000},
				{"Da Ma Lang"					,{2,1,30672,1},10000},
				{"Da мa Long"					,{2,1,30673,1},10000},
				{"Nh鉳 u Linh у (Ng蓇 nhi猲)"		,{gf_RandLingTu, 1, 0},2000},
				{"Nh鉳 竜 Linh у (Ng蓇 nhi猲)"		,{gf_RandLingTu, 2, 0},2000},
				{"Nh鉳 qu莕 Linh у (Ng蓇 nhi猲)"		,{gf_RandLingTu, 3, 0},2000},
			},
			[2] = {	--HARD
			},
		},
		[2] = {		--付费翻牌
			[1] = {	--NORMAL
				{"C﹜ B竧 Nh� nh�"			,{2,0,504,1},5000, 0, 7},
				{"C﹜ B竧 Nh�"				,{2,0,398,1},5000, 0, 7},
				{"C﹜ T� Linh"					,{2,1,30269,1},5000, 0, 7},
				{"B筩h C﹗ Ho祅"					,{2,1,270,1},8000, 0, 7},
				{"Чi B筩h C﹗ ho祅"				,{2,1,1007,1},6000, 0, 7},
				{"B筩h C﹗ Ti猲 n"				,{2,1,1008,1},5000, 0, 7},
				{"Чi Nh﹏ s﹎"				,{2,0,553,1},5000, 0, 7},
				{"Hu﹏ chng anh h飊g"				,{2,1,30499,1,4},20000},
				{"Hu﹏ chng anh h飊g"				,{2,1,30499,2,4},7000},
				{"Hu﹏ chng anh h飊g"				,{2,1,30499,4,4},800},
				{"Hu﹏ chng anh h飊g"				,{2,1,30499,10,4},200},
				{"Th竔 Nh蕋 L謓h"					,{2,1,30687,1,4},0, 1},
				{"Th竔 Nh蕋 L謓h"					,{2,1,30687,2,4},0, 1},
				{"Th竔 Nh蕋 L謓h"					,{2,1,30687,4,4},0, 1},
				{"Vi猰 Linh Ti"					,{2,1,30671,1},10000},
				{"Da Ma Lang"					,{2,1,30672,1},10000},
				{"Da мa Long"					,{2,1,30673,1},10000},
				{"Nh鉳 u Linh у (Ch� nh)"		,{gf_RandLingTu, 1, 1},1000},
				{"Nh鉳 竜 Linh у (Ch� nh)"		,{gf_RandLingTu, 2, 1},1000},
				{"Nh鉳 qu莕 Linh у (Ch� nh)"		,{gf_RandLingTu, 3, 1},1000},
			},
			[2] = {	--HARD
			},
		},
	},
};


tTaskID = {
	["ConsumeTaskID"] = {
		[eMSName.FOREST] = TASKID_TAIYI_FOREST_CONSUME,
		[eMSName.TOWER] = TASKID_TAIYI_TOWER_CONSUME,
	},
	["JoinInTime"] = {
		[eMSName.FOREST] = TASKID_TAIYI_FOREST_JOIN_IN_TIME,
		[eMSName.TOWER] = TASKID_TAIYI_TOWER_JOIN_IN_TIME,
	},
};

tFriendNpcPos = {
	[1] = {{1448, 2904}, {1448, 2895}, {1459, 2901}, {1459, 2907}, {1450, 2888}, {1457, 2888}, {1447, 2885}},
	[2] = {{1617, 2904}, {1612, 2898}, {1620, 2910}, {1621, 2912}, {1615, 2906}, {1611, 2920}, {1621, 2908}},
	[3] = {{1640, 3209}, {1637, 3194}, {1632, 3187}, {1627, 3190}, {1621, 3191}, {1627, 3195}, {1631, 3188}},
	[4] = {{1231, 3483}, {1227, 3475}, {1218, 3479}, {1225, 3479}, {1236, 3479}, {1227, 3478}, {1223, 3461}},
	[5] = {{1447, 3537}, {1442, 3534}, {1450, 3531}, {1455, 3534}, {1453, 3522}, {1448, 3525}, {1444, 3521}},
	[6] = {{1645, 3506}, {1641, 3500}, {1648, 3506}, {1643, 3506}, {1638, 3501}, {1645, 3508}, {1652, 3508}},
};

tFriendNpcList = {
	{"Thi誹 L﹎ V� T╪g Th� T鋋", "Thi誹 L﹎ V� T╪g Th� T鋋"},
	{"Thi誹 L﹎ Thi襫 T╪g Th� T鋋", "Thi誹 L﹎ Thi襫 T╪g Th� T鋋"},
	{"Thi誹 L﹎ T鬰 Gia Th� T鋋", "Thi誹 L﹎ T鬰 Gia Th� T鋋"},
	{"V� ng Чo Gia Th� T鋋", "V� ng Чo Gia Th� T鋋"},
	{"V� ng T鬰 Gia Th� T鋋", "V� ng T鬰 Gia Th� T鋋"},
	{"Л阯g M玭 Th� T鋋", "Л阯g M玭 Th� T鋋"},
	{"C竔 Bang T辬h Y Th� T鋋", "C竔 Bang T辬h Y Th� T鋋"},
	{"C竔 Bang � Y Th� T鋋", "C竔 Bang � Y Th� T鋋"},
	{"Nga My T鬰 Gia Th� T鋋", "Nga My T鬰 Gia Th� T鋋"},
	{"Ng� чc C� S� Th� T鋋", "Ng� чc C� S� Th� T鋋"},
	{"Minh Gi竜 Huy誸 Nh﹏ Th� T鋋", "Minh Gi竜 Huy誸 Nh﹏ Th� T鋋"},
	{"Minh Gi竜 Tr薾 Binh Th� T鋋", "Minh Gi竜 Tr薾 Binh Th� T鋋"},
	{"Minh Gi竜 Th竛h Chi課 Th� T鋋", "Minh Gi竜 Th竛h Chi課 Th� T鋋"},
	{"C玭 L玭 Thi猲 S� Th� T鋋", "C玭 L玭 Thi猲 S� Th� T鋋"},
	{"Th髖 Y猲 V� Ti猲 Th� T鋋", "Th髖 Y猲 V� Ti猲 Th� T鋋"},
};

--进入关卡次数限制
TYT_JOIN_TIMES_FOREST_NOMARL	= 99999
TYT_JOIN_TIMES_FOREST_HARD		=	99999
TYT_JOIN_TIMES_TOWER_NOMARL		= 99999
TYT_JOIN_TIMES_TOWER_HARD			= 99999	

--进入关卡需要消耗的精力
TYT_JOIN_COST_JINGLI = {
	[eMSName.FOREST] = {
		[eDifType.NORMAL] = 20,
		[eDifType.HARD] 	= 20,
	},
	[eMSName.TOWER] = {
		[eDifType.NORMAL] = 100000,
		[eDifType.HARD] 	= 100000,
	},
};

--太一塔进入要消耗的道具(收费模式)
TYT_JOIN_COST_ITEM = {
	[eMSName.FOREST] = {
		[eDifType.NORMAL] = {{2, 97, 236, 4},"Thi猲 Ki猽 L謓h"},
		[eDifType.HARD] 	= {{2, 97, 236, 4},"Thi猲 Ki猽 L謓h"},
	},
	[eMSName.TOWER] = {
		[eDifType.NORMAL] = {{2, 97, 236, 10000},"Thi猲 Ki猽 L謓h"},
		[eDifType.HARD] 	= {{2, 97, 236, 10000},"Thi猲 Ki猽 L謓h"},
	},	
}