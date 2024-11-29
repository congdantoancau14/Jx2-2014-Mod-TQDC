--Ò»Ð©¹«¹²Êý¾Ý
Include("\\script\\lib\\floyd.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\lib\\sdb.lua")
Include("\\script\\lib\\time.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\globalvalue.lua")

g_nDebugVersion = 0;   --debug°æ±¾

FIELD_PVP_RELAY_KEY = "FIELD_PVP_CAMP_CHARM"; --ÈËÆøÖµ

--Èý¸öÊÆÁ¦µØÍ¼ID
tMainMapID = {{6000,"§¹i Lý Thiªn Long Tù"},{6100,"Thæ Phån Quúnh KÕt"},{6200,"T©y H¹ H­ng Kh¸nh"},{6300,"ThÊt L¹c Nhai"},{6400,"Thiªn ¢m Th¸nh §Þa"}};
--ÕóÓª
CampOne = "yp_dali"; 		--ÕóÓª1ÀàÐÍ£¬°üÀ¨npc
CampTwo = "yp_xx";  		--ÕóÓª2ÀàÐÍ£¬°üÀ¨npc
CampThree = "yp_tubo";	--ÕóÓª3ÀàÐÍ£¬°üÀ¨npc
CampNeutral = "yp_zhuli";		--ÖÐÁ¢npcÕóÓªÀàÐÍ
CampJiangYou = "yp_jiangyou"; --½´ÓÍÍÅ£¬¸úÒÔÉÏ¶¼ÊÇÍ¬ÃË

tAllCamp = {
	[1] = CampOne,
	[2] = CampTwo,
	[3] = CampThree,
	[4] = CampNeutral,
	[5] = CampJiangYou,
};

--ÁÙÊ±ÖØÉúµã
tTempRev = {
	[1] = {
		[6000] = {6000,1588,2772},
		[6100] = {6300,1412,3624},
		[6200] = {6300,1412,3624},
		[6300] = {6300,1412,3624},
		[6400] = {6300,1412,3624},
	},
	[2] = {
		[6000] = {6300,1176,3277},
		[6100] = {6100,1671,3668},
		[6200] = {6300,1176,3277},
		[6300] = {6300,1176,3277},
		[6400] = {6300,1176,3277},
	},
	[3] = {
		[6000] = {6300,1364,2970},
		[6100] = {6300,1364,2970},
		[6200] = {6200,1483,2644},
		[6300] = {6300,1364,2970},
		[6400] = {6300,1364,2970},
	},
	[5] = {
		[6000] = {6000,1588,2772},
		[6100] = {6100,1671,3668},
		[6200] = {6200,1483,2644},
		[6300] = {6300,1412,3624},
		[6400] = {6300,1412,3624},
	},
};

tNpcs = {
	[6000] = {
		cdz1 = {"DaLi_CDZ", "§¹i Lý TruyÒn §¹o 1", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz2 = {"DaLi_CDZ", "§¹i Lý TruyÒn §¹o 2", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz3 = {"DaLi_CDZ", "§¹i Lý TruyÒn §¹o 3", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz4 = {"DaLi_CDZ", "§¹i Lý TruyÒn §¹o 4", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz5 = {"DaLi_CDZ", "§¹i Lý TruyÒn §¹o 5", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz6 = {"DaLi_CDZ", "§¹i Lý TruyÒn §¹o 6", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz7 = {"DaLi_CDZ", "§¹i Lý TruyÒn §¹o 7", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz8 = {"DaLi_CDZ", "§¹i Lý TruyÒn §¹o 8", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz9 = {"DaLi_CDZ", "§¹i Lý TruyÒn §¹o 9", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		chd = {"§iÓm Cñi Löa", "§iÓm Cñi Löa", nil,910, CampPlayer, 0},
		army1 = {"Trô Tr× Thiªn Long Tù", "Trô Tr× Thiªn Long Tù", "\\script\\missions\\yp\\tls\\mission.lua", 900, CampOne, 0, "\\script\\missions\\yp\\tls\\mission.lua"},
		army2 = {"ChÊp Sù Thiªn Long Tù 1", "ChÊp Sù Thiªn Long Tù", "\\script\\missions\\yp\\army_npc.lua", 900, CampOne, 0},
		army3 = {"ChÊp Sù Thiªn Long Tù 2", "ChÊp Sù Thiªn Long Tù", "\\script\\missions\\yp\\army_npc.lua", 900, CampOne, 0},
				
		bt = {"Tiªu §Çu TrÊn ViÔn Tiªu Côc","Tiªu §Çu TrÊn ViÔn Tiªu Côc","\\script\\missions\\yp\\biaotou_npc.lua",nil,CampOne,0},
--		qhys = {"Çàº£ÑÎÉÌ","Çàº£ÑÎÉÌ","\\script\\missions\\yp\\qhys_npc.lua",nil,CampOne,0},
			
		tree1 = {"Th¸i H­ Cæ Thô 1", "Th¸i H­ Cæ Thô", "\\script\\missions\\yp\\tls\\tree_npc.lua", nil, CampOne, 0},
		tree2 = {"Th¸i H­ Cæ Thô 2", "Th¸i H­ Cæ Thô", "\\script\\missions\\yp\\tls\\tree_npc.lua", nil, CampOne, 0},
		tree3 = {"Th¸i H­ Cæ Thô 3", "Th¸i H­ Cæ Thô", "\\script\\missions\\yp\\tls\\tree_npc.lua", nil, CampOne, 0},
		dqh = {"§o¹n Khinh HÇu","§o¹n Khinh HÇu","\\script\\missions\\yp\\dqh_npc.lua", nil, CampOne, 0},
		dqr = {"§o¹n Khinh Nh©n", "§o¹n Khinh Nh©n", "\\script\\missions\\yp\\ldx_npc.lua", nil, CampOne, 0},
		dxy = {"§o¹n T©m Di", "§o¹n T©m Di", "\\script\\missions\\yp\\dxy_npc.lua", nil, CampOne, 0},
		db = {"§oµn BÝch", "§oµn BÝch", "\\script\\missions\\yp\\db_npc.lua", nil, CampOne, 0},
		dhf = {"§oµn Hßa Phong","§oµn Hßa Phong","\\script\\missions\\yp\\dhf_npc.lua", nil, CampOne, 0},
		db = {"§oµn BÝch", "§oµn BÝch", "\\script\\missions\\yp\\db_npc.lua", nil, CampOne, 0},
		jy1 = {"Thèng Qu©n Hoµng Téc §¹i Lý", "Thèng Qu©n Hoµng Téc §¹i Lý", nil, nil, CampOne, 0},
		jy2 = {"§oµn Ngäc Nhi", "§oµn Ngäc Nhi", nil, nil, CampOne, 0},
		cnhw = {"Hé VÖ Thiªn Long Tù", "Hé VÖ Thµnh Néi", nil, nil, CampOne, 0},
		cnhw2 = {"Hé VÖ Thiªn Long Tù", "Hé VÖ Thµnh Néi", nil, nil, CampOne, 0},
		hrhw = {"Hé VÖ Thiªn Long Tù", "Hé VÖ Thµnh Biªn", nil, nil, CampOne, 0},
		bgy = {"R­¬ng ®å Trung Nguyªn","Thñ Khè","\\script\\missions\\yp\\cf_npc.lua", nil, CampOne, 0},
		ydlb = {"Ch­ëng d­îc Trung Nguyªn","Chñ D­îc ®iÕm","\\script\\missions\\yp\\cf_npc.lua", nil, CampOne, 0},
		cf = {"Xa phu","Xa phu","\\script\\missions\\yp\\cf_npc.lua", nil, CampOne, 0},
	},
	[6100] = {
		cdz1 = {"TuBo_CDZ", "Thæ Phån TruyÒn §¹o 1", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz2 = {"TuBo_CDZ", "Thæ Phån TruyÒn §¹o 2", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz3 = {"TuBo_CDZ", "Thæ Phån TruyÒn §¹o 3", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz4 = {"TuBo_CDZ", "Thæ Phån TruyÒn §¹o 4", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz5 = {"TuBo_CDZ", "Thæ Phån TruyÒn §¹o 5", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz6 = {"TuBo_CDZ", "Thæ Phån TruyÒn §¹o 6", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz7 = {"TuBo_CDZ", "Thæ Phån TruyÒn §¹o 7", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz8 = {"TuBo_CDZ", "Thæ Phån TruyÒn §¹o 8", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz9 = {"TuBo_CDZ", "Thæ Phån TruyÒn §¹o 9", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		chd = {"§iÓm Cñi Löa", "§iÓm Cñi Löa", nil,910, CampPlayer, 0},
		army1 = {"Trô Tr× Hãa Sinh Tù", "Trô Tr× Hãa Sinh Tù", "\\script\\missions\\yp\\hss\\mission.lua", 900, CampTwo, 0, "\\script\\missions\\yp\\hss\\mission.lua"},
		army2 = {"ChÊp Sù Hãa Sinh Tù 1", "ChÊp Sù Hãa Sinh Tù", "\\script\\missions\\yp\\army_npc.lua", 900, CampTwo, 0},
		army3 = {"ChÊp Sù Hãa Sinh Tù 2", "ChÊp Sù Hãa Sinh Tù", "\\script\\missions\\yp\\army_npc.lua", 900, CampTwo, 0},
				
		bt = {"Tiªu §Çu TrÊn ViÔn Tiªu Côc","Tiªu §Çu TrÊn ViÔn Tiªu Côc","\\script\\missions\\yp\\biaotou_npc.lua",nil,CampTwo,0},
--		qhys = {"Çàº£ÑÎÉÌ","Çàº£ÑÎÉÌ","\\script\\missions\\yp\\qhys_npc.lua",nil,CampTwo,0},
			
		tree1 = {"Th¸i H­ Cæ Thô 1", "Th¸i H­ Cæ Thô", "\\script\\missions\\yp\\hss\\tree_npc.lua", nil, CampTwo, 0},
		tree2 = {"Th¸i H­ Cæ Thô 2", "Th¸i H­ Cæ Thô", "\\script\\missions\\yp\\hss\\tree_npc.lua", nil, CampTwo, 0},
		tree3 = {"Th¸i H­ Cæ Thô 3", "Th¸i H­ Cæ Thô", "\\script\\missions\\yp\\hss\\tree_npc.lua", nil, CampTwo, 0},
		dqh = {"§¹t T©y ¤ng T¾c","§¹t T©y ¤ng T¾c","\\script\\missions\\yp\\dqh_npc.lua", nil, CampTwo, 0},
		dqr = {"Côc Bæn C¸c Quý", "Côc Bæn C¸c Quý", "\\script\\missions\\yp\\ldx_npc.lua", nil, CampTwo, 0},
		dxy = {"N·i §«ng Qu¸ch NhiÕp", "N·i §«ng Qu¸ch NhiÕp", "\\script\\missions\\yp\\dxy_npc.lua", nil, CampTwo, 0},
		dhf = {"§« Tïng C¸t Ngâa","§« Tïng C¸t Ngâa","\\script\\missions\\yp\\dhf_npc.lua", nil, CampTwo, 0},
		db = {"T¸n Phæ Kham Bè", "T¸n Phæ Kham Bè", "\\script\\missions\\yp\\db_npc.lua", nil, CampTwo, 0},
		jy1 = {"Lý Nguyªn Tr©n", "Lý Nguyªn Tr©n", nil, nil, CampTwo, 0},
		jy2 = {"Sa Ca Ninh Bè", "Sa Ca Ninh Bè", nil, nil, CampTwo, 0},		
		cnhw = {"Hé VÖ Hãa Sinh Tù", "Hé VÖ Thµnh Néi", nil, nil, CampTwo, 0},
		cnhw2 = {"Hé VÖ Hãa Sinh Tù", "Hé VÖ Thµnh Néi", nil, nil, CampTwo, 0},
		hrhw = {"Hé VÖ Hãa Sinh Tù", "Hé VÖ Thµnh Biªn", nil, nil, CampTwo, 0},
		bgy = {"R­¬ng ®å Trung Nguyªn","Thñ Khè","\\script\\missions\\yp\\cf_npc.lua", nil, CampTwo, 0},
		ydlb = {"Ch­ëng d­îc Trung Nguyªn","Chñ D­îc ®iÕm","\\script\\missions\\yp\\cf_npc.lua", nil, CampTwo, 0},		
		cf = {"Xa phu","Xa phu","\\script\\missions\\yp\\cf_npc.lua", nil, CampTwo, 0},
	},	
	[6200] = {
		cdz1 = {"Mm_CDZ", "T©y H¹ TruyÒn §¹o 1", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz2 = {"Mm_CDZ", "T©y H¹ TruyÒn §¹o 2", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz3 = {"Mm_CDZ", "T©y H¹ TruyÒn §¹o 3", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz4 = {"Mm_CDZ", "T©y H¹ TruyÒn §¹o 4", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz5 = {"Mm_CDZ", "T©y H¹ TruyÒn §¹o 5", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz6 = {"Mm_CDZ", "T©y H¹ TruyÒn §¹o 6", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz7 = {"Mm_CDZ", "T©y H¹ TruyÒn §¹o 7", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz8 = {"Mm_CDZ", "T©y H¹ TruyÒn §¹o 8", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz9 = {"Mm_CDZ", "T©y H¹ TruyÒn §¹o 9", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		chd = {"§iÓm Cñi Löa", "§iÓm Cñi Löa", nil,910, CampPlayer, 0},
		army1 = {"T©y H¹ Chinh Nam T­íng Qu©n", "T©y H¹ Chinh Nam T­íng Qu©n", "\\script\\missions\\yp\\mm\\mission.lua", 900, CampThree, 0, "\\script\\missions\\yp\\mm\\mission.lua"},
		army2 = {"T©y H¹ Chinh Nam Qu©n SÜ 1", "T©y H¹ Chinh Nam Qu©n SÜ ", "\\script\\missions\\yp\\army_npc.lua", 900, CampThree, 0},
		army3 = {"T©y H¹ Chinh Nam Qu©n SÜ 2", "T©y H¹ Chinh Nam Qu©n SÜ ", "\\script\\missions\\yp\\army_npc.lua", 900, CampThree, 0},
				
		bt = {"Tiªu §Çu TrÊn ViÔn Tiªu Côc","Tiªu §Çu TrÊn ViÔn Tiªu Côc","\\script\\missions\\yp\\biaotou_npc.lua",nil,CampThree,0},
--		qhys = {"Çàº£ÑÎÉÌ","Çàº£ÑÎÉÌ","\\script\\missions\\yp\\qhys_npc.lua",nil,CampThree,0},
			
		tree1 = {"Th¸i H­ Cæ Thô 1", "Th¸i H­ Cæ Thô", "\\script\\missions\\yp\\mm\\tree_npc.lua", nil, CampThree, 0},
		tree2 = {"Th¸i H­ Cæ Thô 2", "Th¸i H­ Cæ Thô", "\\script\\missions\\yp\\mm\\tree_npc.lua", nil, CampThree, 0},
		tree3 = {"Th¸i H­ Cæ Thô 3", "Th¸i H­ Cæ Thô", "\\script\\missions\\yp\\mm\\tree_npc.lua", nil, CampThree, 0},
		dqh = {"Lý §øc Kh¸nh","Lý §øc Kh¸nh","\\script\\missions\\yp\\dqh_npc.lua", nil, CampThree, 0},
		dqr = {"Lý §øc Dôc", "Lý §øc Dôc", "\\script\\missions\\yp\\ldx_npc.lua", nil, CampThree, 0},
		dxy = {"Lý Nguyªn L­îng", "Lý Nguyªn L­îng", "\\script\\missions\\yp\\dxy_npc.lua", nil, CampThree, 0},
		dhf = {"Lý KÕ Minh","Lý KÕ Minh","\\script\\missions\\yp\\dhf_npc.lua", nil, CampThree, 0},
		db = {"Lý Nguyªn Hóc", "Lý Nguyªn Hóc", "\\script\\missions\\yp\\db_npc.lua", nil, CampThree, 0},
		jy1 = {"ThiÕu M«n Chñ", "ThiÕu M«n Chñ", nil, nil, CampThree, 0},
		cnhw = {"Vâ SÜ Minh M«n", "Hé VÖ Thµnh Néi", nil, nil, CampThree, 0},
		cnhw2 = {"Vâ SÜ Minh M«n", "Hé VÖ Thµnh Néi", nil, nil, CampThree, 0},
		hrhw = {"Vâ SÜ Minh M«n", "Hé VÖ Thµnh Biªn", nil, nil, CampThree, 0},
		bgy = {"R­¬ng ®å Trung Nguyªn","Thñ Khè","\\script\\missions\\yp\\cf_npc.lua", nil, CampThree, 0},
		ydlb = {"Ch­ëng d­îc Trung Nguyªn","Chñ D­îc ®iÕm","\\script\\missions\\yp\\cf_npc.lua", nil, CampThree, 0},					
		cf = {"Xa phu","Xa phu","\\script\\missions\\yp\\cf_npc.lua", nil, CampThree, 0},
	},
	[6300] = {
		kmds = {"Vâ L©m Minh-Kh« Méc §¹i S­","Vâ L©m Minh-Kh« Méc §¹i S­","\\script\\missions\\yp\\kmds_npc.lua",nil,CampNeutral,0},
		qhys = {"Thanh H¶i Diªm Th­¬ng","Thanh H¶i Diªm Th­¬ng","\\script\\missions\\yp\\qhys_npc.lua",nil,CampNeutral,0},
		xbr = {"TÇm B¶o Nh©n","TÇm B¶o Nh©n","\\script\\missions\\yp\\qmy\\mission.lua",nil,CampNeutral,0},
		cf = {"Xa phu","Xa phu","\\script\\missions\\yp\\cf_npc.lua", nil, CampNeutral, 0},
	},
}

tPos = {
	[6000] = {
		cdz1 = {{1380,2491}},
		cdz2 = {{1458,2537}},
		cdz3 = {{1560,2521}},
		cdz4 = {{1406,2675}},
		cdz5 = {{1495,2604}},
		cdz6 = {{1524,2740}},
		cdz7 = {{1310,2800}},
		cdz8 = {{1390,2940}},
		cdz9 = {{1519,2930}},
		bt = {{1628,2784}},
--		qhys = {{1538,3151}},
		chd = {
			{1382,2491},
			{1460,2537},
			{1562,2521},
			{1408,2675},
			{1497,2604},
			{1526,2740},
			{1312,2800},
			{1392,2940},
			{1521,2930},	
		},
		army = {{1380,2516}},	
		tree1 = {{1482,2815}},
		tree2 = {{1516,2642}},
		tree3 = {{1420,2627}},
		dqh = {{1576,2735}},
		dqr = {{1594,2795}},
		dxy = {{1570,2768}},
		dhf = {{1623,2805}},
		db = {{1592,2780}},
		jy1 = {{1555,2743}},
		jy2 = {{1613,2807}},
		cnhw = {{1569,2740}},
		cnhw2 = {{1579,2720}},
		hrhw = {{1563,2734}},
		bgy = {{1605,2821}},
		ydlb = {{1544,2753}},
		cf = {{1585,2723}},
	},
	[6100] = {
		cdz1 = {{1565,3244}},
		cdz2 = {{1781,3292}},
		cdz3 = {{1904,3316}},
		cdz4 = {{1601,3502}},
		cdz5 = {{1723,3461}},
		cdz6 = {{1902,3570}},
		cdz7 = {{1658,3799}},
		cdz8 = {{1760,3711}},
		cdz9 = {{1892,3884}},
		bt = {{1727,3629}},
--		qhys = {{1538,3151}},
		chd = {
			{1567,3244},
			{1783,3292},
			{1906,3316},
			{1603,3502},
			{1725,3461},
			{1904,3570},
			{1660,3799},
			{1762,3711},
			{1894,3884},	
		},
		army = {{1644,3191}},	
		tree1 = {{1763,3747}},
		tree2 = {{1773,3425}},
		tree3 = {{1653,3465}},
		dqh = {{1602,3657}},
		dqr = {{1695,3599}},
		dxy = {{1655,3602}},
		dhf = {{1680,3698}},
		db = {{1672,3640}},
		jy1 = {{1590,3667}},
		jy2 = {{1591,3681}},		
		cnhw = {{1603,3668}},
		cnhw2 = {{1647,3613}},
		hrhw = {{1629,3620}},
		bgy = {{1650,3668}},
		ydlb = {{1621,3698}},
		cf = {{1642,3730}},
	},		
	[6200] = {
		cdz1 = {{1167,2665}},
		cdz2 = {{1362,2727}},
		cdz3 = {{1528,2735}},
		cdz4 = {{1232,2918}},
		cdz5 = {{1360,2915}},
		cdz6 = {{1559,2920}},
		cdz7 = {{1179,3138}},
		cdz8 = {{1352,3140}},
		cdz9 = {{1424,3152}},
		bt = {{1467,2643}},
--		qhys = {{1538,3151}},
		chd = {
			{1169,2665},
			{1364,2727},
			{1530,2735},
			{1234,2918},
			{1362,2915},
			{1561,2920},
			{1181,3138},
			{1354,3140},
			{1426,3152},	
		},
		army = {{1274,3020}},	
		tree1 = {{1390,2935}},
		tree2 = {{1508,2872}},
		tree3 = {{1232,2861}},
		dqh = {{1465,2585}},
		dqr = {{1406,2645}},
		dxy = {{1523,2631}},
		dhf = {{1484,2587}},
		db = {{1417,2631}},
		jy1 = {{1160,2714}},		
		cnhw = {{1467,2694}},
		cnhw2 = {{1476,2587}},
		hrhw = {{1423,2685}},
		bgy = {{1462,2706}},
		ydlb = {{1434,2618}},
		cf = {{1486,2681}},
	},
	[6300] = {
		kmds = {{1389,3269}},
		qhys = {{1367,3271}},
		cf = {{1387,3248}},
		xbr = {{1462,3410}},
	},
} 

if g_nDebugVersion == 1 then
	tCreatTime = {--¿¾»ðÊ±¼ä
		100,200,300,400,500,600,700,800,900,1000,1100,1200,1300,1400,1500,1600,1700,1800,1900,2000,2100,2200,2300		
	};
else
	tCreatTime = {--¿¾»ðÊ±¼ä
		1100,1700,2100,
	};
end

tBzPos = { --±¦²ØµÄËæ»úµã
	[6000] = {
		{1382,2499},{1391,2530},{1402,2500},{1403,2470},{1419,2445},{1456,2454},{1492,2447},{1520,2475},{1541,2451},{1555,2513},
		{1517,2537},{1488,2513},{1445,2432},{1413,2524},{1406,2560},{1438,2575},{1478,2570},{1473,2487},{1431,2615},{1421,2652},
		{1364,2591},{1370,2629},{1408,2670},{1445,2648},{1457,2633},{1453,2678},{1435,2693},{1468,2716},{1481,2681},{1503,2692},
		{1515,2726},{1532,2711},{1522,2674},{1504,2650},{1487,2630},{1498,2604},{1525,2590},{1541,2608},{1532,2642},{1566,2628},
		{1563,2591},{1579,2614},{1559,2668},{1569,2896},{1561,2925},{1539,2947},{1518,2966},{1500,2992},{1486,3015},{1466,2984},
		{1480,2967},{1502,2950},{1505,2923},{1526,2890},{1513,2869},{1491,2881},{1477,2907},{1462,2882},{1454,2915},{1438,2946},
		{1419,2972},{1402,2957},{1386,2942},{1391,2910},{1412,2892},{1469,2861},{1448,2833},{1474,2811},{1493,2818},{1446,2806},
		{1457,2770},{1436,2770},{1435,2782},{1413,2768},{1416,2723},{1392,2716},{1370,2706},{1343,2712},{1361,2738},{1338,2756},
		{1303,2745},{1311,2786},{1307,2807},{1348,2769},{1376,2774},{1387,2810},{1354,2877},{1332,2837},{1492,2685},{1426,2685},
		{1419,2558},{1470,2501},{1516,2478},{1541,2530},{1480,2564},{1521,2633},{1555,2628},{1530,2684},{1464,2783},{1420,2831},
	},
	[6100] = {
		{1570,3243},{1600,3259},{1602,3209},{1638,3173},{1641,3228},{1677,3179},{1710,3164},{1675,3133},{1578,3329},{1615,3348},
		{1636,3302},{1669,3285},{1721,3246},{1749,3197},{1783,3210},{1791,3249},{1842,3240},{1821,3293},{1869,3299},{1895,3322},
		{1883,3366},{1893,3425},{1849,3439},{1845,3385},{1837,3339},{1813,3304},{1753,3277},{1739,3322},{1692,3326},{1653,3361},
		{1632,3399},{1595,3411},{1617,3443},{1602,3493},{1634,3523},{1616,3549},{1592,3575},{1695,3494},{1690,3440},{1669,3472},
		{1649,3478},{1634,3447},{1644,3420},{1686,3385},{1708,3408},{1730,3356},{1778,3375},{1749,3456},{1739,3529},{1731,3572},
		{1780,3593},{1817,3564},{1843,3558},{1809,3521},{1786,3500},{1769,3447},{1775,3404},{1813,3411},{1832,3443},{1845,3481},
		{1829,3512},{1858,3505},{1883,3476},{1886,3532},{1900,3571},{1854,3595},{1835,3632},{1874,3652},{1904,3661},{1899,3720},
		{1881,3761},{1890,3818},{1875,3867},{1894,3885},{1844,3876},{1835,3856},{1815,3822},{1799,3796},{1825,3777},{1791,3742},
		{1765,3709},{1792,3684},{1829,3655},{1858,3655},{1868,3692},{1839,3719},{1815,3735},{1738,3798},{1720,3773},{1723,3735},
		{1678,3781},{1751,3759},{1762,3728},{1781,3826},{1768,3293},{1750,3328},{1891,3458},{1669,3182},{1808,3341},{1842,3402},
	},
	[6200] = {
		{1413,2757},{1453,2794},{1492,2772},{1527,2736},{1546,2787},{1536,2683},{1556,2728},{1520,2820},{1530,2858},{1521,2897},
		{1549,2896},{1523,2948},{1477,2928},{1486,2862},{1510,2871},{1465,2901},{1461,2865},{1448,2982},{1471,3017},{1479,3050},
		{1428,3065},{1436,3107},{1394,3131},{1384,3176},{1423,3156},{1369,3088},{1343,3063},{1322,3106},{1342,3138},{1335,3159},
		{1307,3166},{1296,3136},{1272,3174},{1236,3179},{1210,3150},{1178,3141},{1208,3117},{1214,3083},{1248,3080},{1279,3072},
		{1267,3030},{1269,2999},{1244,2962},{1215,2966},{1254,2926},{1253,2901},{1229,2918},{1296,2894},{1313,2853},{1337,2836},
		{1358,2781},{1361,2729},{1343,2697},{1307,2730},{1281,2787},{1262,2827},{1247,2865},{1227,2829},{1239,2695},{1264,2653},
		{1292,2628},{1251,2609},{1215,2626},{1236,2653},{1168,2668},{1141,2700},{1107,2728},{1134,2748},{1171,2764},{1176,2723},
		{1196,2703},{1406,2839},{1402,2803},{1421,2801},{1427,2835},{1439,2871},{1445,2913},{1420,2950},{1417,2996},{1384,3019},
		{1378,3050},{1348,3012},{1350,2973},{1321,2957},{1281,2962},{1338,2917},{1357,2894},{1383,2898},{1401,2936},{1373,2951},
		{1269,2762},{1348,2689},{1386,2774},{1528,2734},{1465,2964},{1450,3009},{1424,3096},{1343,3059},{1290,3046},{1249,2958},
	},
	[6300] = {
		{1506,3416},{1522,3428},{1534,3391},{1549,3362},{1557,3320},{1567,3291},{1572,3272},{1525,3260},{1547,3249},{1523,3226},
		{1541,3203},{1569,3219},{1597,3244},{1538,3172},{1518,3153},{1503,3124},{1495,3079},{1492,3031},{1463,3007},{1452,2962},
		{1424,2931},{1458,2957},{1356,2939},{1355,2976},{1328,2940},{1314,2902},{1279,2894},{1251,2927},{1277,2970},{1236,2969},
		{1217,3028},{1180,3063},{1163,3106},{1218,3116},{1260,3091},{1288,3048},{1334,3025},{1390,3012},{1429,2990},{1439,3067},
		{1405,3112},{1468,3133},{1490,3193},{1497,3262},{1459,3317},{1394,3342},{1469,3398},{1444,3442},{1452,3546},{1427,3603},
		{1381,3570},{1317,3522},{1259,3503},{1237,3426},{1203,3442},{1192,3384},{1240,3346},{1244,3388},{1277,3435},{1304,3408},
		{1349,3437},{1351,3348},{1324,3320},{1467,3473},{1348,3559},{1261,3479},{1433,3219},{1386,3177},{1330,3150},{1351,3121},
		{1299,3127},{1399,3169},{1432,3103},{1462,3186},{1444,3268},{1415,3348},{1320,3390},{1275,3398},{1218,3378},{1166,3366},
		{1227,3402},{1371,3533},{1433,3548},{1485,3466},{1434,3435},{1464,3375},{1487,3181},{1420,3037},{1398,3073},{1417,3122},
		{1219,3012},{1193,3050},{1193,3159},{1240,3142},{1312,3153},{1323,3234},{1273,3234},{1308,2901},{1444,2973},{1476,3076},
	},
	[6400] = {
		{1642,3196},{1695,3201},{1731,3193},{1786,3190},{1839,3217},{1836,3262},{1891,3259},{1875,3322},{1892,3366},{1839,3413},
		{1818,3353},{1765,3298},{1709,3370},{1636,3302},{1622,3394},{1638,3489},{1636,3445},{1696,3440},{1707,3508},{1756,3501},
		{1737,3558},{1786,3534},{1800,3494},{1845,3483},{1883,3508},{1844,3535},{1812,3581},{1765,3551},{1754,3592},{1788,3606},
		{1837,3610},{1847,3577},{1871,3593},{1873,3620},{1760,3434},{1777,3404},{1742,3296},{1673,3248},{1692,3331},{1640,3525},
		{1698,3611},{1650,3587},{1683,3544},{1826,3377},{1798,3302},{1731,3241},{1790,3222},{1885,3220},{1710,3342},{1670,3417},	
	},
}

tBCRand = {48,72,88,96,100}; --ïÚ³µ¸ÅÂÊ

tBiaoChe = {
	{"Tiªu Xa 1","Tiªu Xa Th­êng"},
	{"Tiªu Xa 2","Tiªu Xa Quan Träng"},
	{"Tiªu Xa 3","Tiªu Xa Qu©n Dông"},
	{"Tiªu Xa 4","Tiªu Xa C¬ MËt"},
	{"Tiªu Xa 5","Tiªu Xa Hoµng Gia"},
};

tSeedName = { --Ê÷ÖÖ
	--Ãû×Ö id Æ·ÖÊËæ»ú·¶Î§ ½½Ë®½±Àø
	[1] = {{"V« Hoa Tö_Lo¹i 1",{2,95,908},{40,50}, "tree_bodhi1"},{"Bå §Ò Tö_Lo¹i 1",{2,95,909},{40,50}, "tree_fig1"}},
	[2] = {{"Tö §µn Tiªn Chñng_Lo¹i 2",{2,95,904},{21,35},"tree_PurpleSandalwood2"},{"Hoµng §µn Tiªn Chñng_Lo¹i 2",{2,95,905},{21,35},"tree_YellowSandalwood2"},{"Tö §»ng Tiªn Chñng_Lo¹i 2",{2,95,906},{21,35},"tree_wisteria2"},{"Ng©n H¹nh Tiªn Chñng_Lo¹i 2",{2,95,907},{21,35}, "tree_ginkgo2"}},
	[3] = {{"H¹t Gièng Anh §µo_Lo¹i 3",{2,95,900},{11,30},"tree_cherry3"},{"H¹t Gièng C©y §µo_Lo¹i 3",{2,95,901},{11,30},"tree_peach3"},{"H¹t Gièng Hoa Tiªu_Lo¹i 3",{2,95,902},{11,30}, "tree_pepper3"},{"H¹t Gièng Thñy Sam_Lo¹i 3",{2,95,903},{11,30}, "tree_metasequoia3"}},
}

tYupoName = {
	{"H­ Kh«ng Ngäc Ph¸ch_§Æc biÖt",{2,95,913},32},
	{"MÆc Tµ Ngäc Ph¸ch_NhÊt phÈm",{2,95,912},21},
	{"Tó Tr¹ch Ngäc Ph¸ch_NhÞ phÈm",{2,95,911},17},
	{"B¨ng T©m Ngäc Ph¸ch_Tam phÈm",{2,95,910},0},
}

tPlantInfo = {}; --Íæ¼ÒµÄÌ«ÐéÊ÷info»º´æ

tPVPItemInfo = {
	{"Kim L¨ng Töu",2,95,822},      --1
	{"Tµng KiÕm BÝ TruyÒn T©m Kinh",2,95,823},--2
	{"B¸ch HiÓu Sinh BÝ Ph¸p",2,95,824},	--3
	{"Kim Cang Kinh",2,95,825},			--4
	{"Vâ L©m Minh TÝn VËt",2,95,935},--5
	{"Th¸i H­ Hãa H×nh §¬n",2,95,914},	--6
	{"Phông Tinh §¬n",2,95,916},	--7
	{"Tµng B¶o §å",2,95,917},	--8
	{"TrÊn ViÔn Ho¸n Tiªu LÖnh",2,95,918}, --9	
	{"Tiªu Xa Th­êng-Tiªu Kú",2,95,919},	--10
	{"Tiªu Xa Quan Träng-Tiªu Kú",2,95,920},	--11
	{"Tiªu Xa Qu©n Dông-Tiªu Kú",2,95,921},	--12
	{"Tiªu Xa C¬ MËt-Tiªu Kú",2,95,922},	--13
	{"Tiªu Xa Hoµng Gia-Tiªu Kú",2,95,923},	--14
	{"Huy HiÖu Vâ L©m Minh",2,95,924},	--15
	{"NghÜa KhÝ Töu",2,95,925},		--16
	{"Tµng B¶o §å",	2,95,926},  --17
	{"XÎng Kho B¸u",	2,95,927},	--18
	{"Ch©u B¸u T©y H¹",	2,95,928},  --19
	{"T¬ Lôa §¹i Lý",	2,95,929},	--20
	{"Da L«ng Thæ Phån",	2,95,930},	--21
	{"Kho B¸u Tr©n PhÈm",	2,95,931},	--22
	{"Kho B¸u T× H­u",	2,95,932},	--23
	{"Kho B¸u Di VËt",	2,95,933},	--24
	{"Kho B¸u Kinh ThÕ",	2,95,934},	--25
	{"Vâ L©m Minh Th­ BiÓu D­¬ng",	2,95,936}, --26
	{"Kho B¸u Minh M«n",	2,97,33},	--27
	{"Kho B¸u Thiªn Long Tù",	2,97,34},	--28
	{"Kho B¸u Quúnh KÕt",	2,97,35},	--29	
};

tRewardTime = { --ÉÍ½ðÊ±¼ä
	{1600,1630},{2200,2230},
};

--ÉÍ½ðµÀ¾ßÐ§¹û
tRewardBox = {--Ä£°åÃû npcÃû ×´Ì¬Ãû³Æ Ð§¹ûÃèÊö Ä§·¨ÊôÐÔ×Ö·û´® ÊýÖµ ³ÖÐøÊ±¼ä
	{"Gi¸ vò khÝ_Ngoµi thµnh","Gi¸ vò khÝ",1787,3508,"Dòng M·nh","t¨ng lùc c«ng kÝch 100%, duy tr× 30 gi©y","state_p_attack_percent_add",100,30,"state_m_attack_percent_add",100,30},
	{"Gi¸ khiªn_Ngoµi thµnh","Gi¸ khiªn",1775,3411,"Hung h·n","T¨ng lùc phßng ngù 100%, duy tr× 30 gi©y","state_receive_half_damage",100,30},
	{"L¸ th¶o d­îc_Ngoµi thµnh","L¸ th¶o d­îc",1775,3666,"TrÞ th­¬ng","Mçi gi©y håi phôc 10% sinh mÖnh, duy tr× 30 gi©y","state_life_per_per8f",500,30},
	{"Giµy giã_Ngoµi thµnh","Giµy giã",1851,3527,"Ngôy bé","Èn th©n, duy tr× 30 gi©y","state_illusion_latent",0,30},
};

-----------------------------------¹«¹²º¯Êý------------------------------------------
function yp_CreateMonster(npc, pos, way, nAiType)
	local model, name = npc[1], npc[2];
	local m = this.msPosition:getMapID();
	local newnpc = 0;
	if type(pos[1]) ~= "table" then
		pos = {pos};
	end
	for i = 1, getn(pos) do
		local x, y = pos[i][1], pos[i][2];
		newnpc = CreateNpc(model, name, m, x, y);
		if npc[3] then
			SetNpcScript(newnpc, npc[3]);
		end
		if npc[4] then
			SetNpcLifeTime(newnpc, npc[4]);
		end
		if npc[5] then
			SetCampToNpc(newnpc, npc[5]);
		end
		if npc[6] then
			SetNpcDir(newnpc, npc[6]);
		end
		if npc[7] then
			SetNpcRemoveScript(newnpc, npc[7]);
		end		
		SetNpcActivator(newnpc);
		if way then
			nAiType = nAiType or AT_SM_ATTACK;
			g_NpcAI:setAI(newnpc, nAiType);
			g_NpcAI:setWayPoint(newnpc, way);
		end
	end
	return newnpc;
end

function yp_fire_OnTimer()
--	Msg2Player("yp_fire_OnTimer");
	local nTime = tonumber(date("%H%M"));
	local m,x,y = GetWorldPos();
	if m ~= 6000 and m ~= 6100 and m ~= 6200 then
		return 0;
	end
	for i = 1,getn(tCreatTime) do
		if nTime >= tCreatTime[i] and nTime < tCreatTime[i]+15 and GetMissionV(12) == i then --15·ÖÖÓÄÚ
			local nMapID,nPosX,nPosY = GetWorldPos();
			local nDistance = 0;
			if tPos[nMapID] == nil then
				return 0;
			end
			for j = 1,getn(tPos[nMapID].chd) do
				local n = abs(nPosX-tPos[nMapID].chd[j][1])+abs(nPosY-tPos[nMapID].chd[j][2]);
				if nDistance == 0 or n < nDistance then
					nDistance = n;
				end
			end
			
--			Msg2Player("nDistance:"..nDistance)
			if nDistance > 32 then
				return 0;
			end
			--ÅÐ¶ÏÊÇ·ñ´ò×ø
			local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
			local nNpcState = GetNpcBehaveStatus(nPidxNpc);
			if nNpcState ~= 13 and GetTime() - GetTask(TASK_FIELD_PVP_DRINK) > 20*60 then --´ò×ø
				return 0;
			end
			local nTeamSize = GetTeamSize();
			local nExp = floor(GetLevel()*GetLevel()*2*(1+nTeamSize/10));
			local nMpExp = 36;
			if GetTime() - GetTask(TASK_FIELD_PVP_DRINK) < 20*60 and GetTask(TASK_FIELD_PVP_DRINK) ~= 0 then --20·ÖÖÓ
				local nRand = random(1,100);
				if nRand <= 90 then
					nExp = 3*nExp;
				else
					nExp = 5*nExp;
					SetCurrentNpcSFX(nPidxNpc,972,1,0);
				end
				nMpExp = 72;
			end
--			MP_MasterAddPoint(nMpExp);
			gf_Modify("Exp",nExp);
		end
	end	
end

function yp_ChooseArmy()
	local nRand = random(1,3);
	SetGlbValue(GLV_YP_CHOOSE_ARMY,nRand);
end

--1:¹±Ï×¶È£¬2£ºpvpµãÊý£¬3£º¾«Á¦Öµ£¬4£º¶ÔÕ½¾­Ñé£¬5£ºÎäÁÖÃËÉùÍû
function yp_setValue(nType,Value)
	yp_clearPlayerData();
	local tTaskID = {TASK_FIELD_PVP_GXD, TASK_FIELD_PVP_COUNT, 12345678, TASK_BIWU_DUIZHAN_JINGYAN};
	local strMsg = {"§é cèng hiÕn thÕ lùc","§iÓm PVP","TrÞ tinh lùc","Kinh nghiÖm ®èi chiÕn ","Danh väng Vâ L©m Minh"};
	if nType == 5 then
		--³ÌÐò½Ó¿Ú
		local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
		if nCamp >=1 and nCamp <= 3 then
			AddPop(nCamp-1, Value);
		else
			print(GetName(),"yp_setValue",nType,Value,"error camp")
		end
		
	elseif nType == 3 then
		ModifyEnergy(Value, 1)
	else
		local nCurTask = tTaskID[nType];
		if nCurTask then
			if nType == 4 then
				SetTask(nCurTask,GetTask(nCurTask)+Value, 21);
			else
				SetTask(nCurTask,GetTask(nCurTask)+Value);
			end
			if Value > 0 then
				Msg2Player("Ng­¬i nhËn ®­îc ["..strMsg[nType].."]"..Value.." ®iÓm!");
			elseif Value < 0 then
				Msg2Player("Ng­¬i mÊt ®i ["..strMsg[nType].."]"..abs(Value).." ®iÓm!");
			end
		end
	end
end

function yp_getValue(nType)
	yp_clearPlayerData();
	local tTaskID = {TASK_FIELD_PVP_GXD, TASK_FIELD_PVP_COUNT, 12345678, TASK_BIWU_DUIZHAN_JINGYAN};
	if nType == 5 then
		--³ÌÐò½Ó¿Ú
		local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
		if nCamp >=1 and nCamp <= 3 then
			return GetPop(nCamp-1);
		else
			print("yp_setValue",nType,Value,"error camp")
		end
		return 0;
	elseif nType == 3 then
		local nCur, nMax = ModifyEnergy(0, 1)
		return nCur
	else
		local nCurTask = tTaskID[nType];
		if nCurTask then
			return GetTask(nCurTask);
		end
		return 0;
	end
end

function yp_clearPlayerData()
	local nCurWeek = tf_GetWeekSequence(1,0);
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_FIELD_PVP_CLEAR_TIME) < nDate then
		gf_SetTaskByte(TASK_FIELD_PVP_STEAL_STEP,2,0); --µ±ÌìÍµ¾­ÊéÈÎÎñµÄ´ÎÊý
		SetTask(TASK_FIELD_PVP_CLEAR_TIME,nDate);
	end
	if GetTask(TASK_FIELD_PVP_CLEAR_DATA) < nCurWeek then
		SetTask(TASK_FIELD_PVP_GXD,0);
		SetTask(TASK_FIELD_PVP_CLEAR_DATA,nCurWeek);
	end
end

function yp_addCharm(nType,nAddNum,nSpe)
	SetPlayerScript("\\script\\missions\\yp\\dhx_npc.lua");
	if nSpe then
		SendScript2VM("\\script\\missions\\yp\\dhx_npc.lua",format("dhx_addCharm2(%d,%d)",nType,nAddNum));		
	else
		SendScript2VM("\\script\\missions\\yp\\dhx_npc.lua",format("dhx_addCharm(%d,%d)",nType,nAddNum));		
	end
end

--ÉÍ½ðÊ±¼ä
function yp_checkRewardTime()
	local nCurTime = tonumber(date("%H%M"));
	for i = 1,getn(tRewardTime) do
		if nCurTime >= tRewardTime[i][1] and nCurTime <= tRewardTime[i][2] then
			return i;
		end
	end
	return 0;
end

--µØÍ¼´¥·¢Æ÷
g_nRectCostomerID = 3007*2;
g_nRectTriggerID = 3007;
function yp_onMapJoin()
--	print("yp_onMapJoin")
	yp_onLogin();
end

function yp_onEnterMap()
	SetPKFlag(0);
	ForbidChangePK(1);
end

function yp_onLeaveMap()
	ForbidChangePK(0);
end

--µÇÂ½´¥·¢Æ÷
g_nLoginCostomerID = 3012*2;
g_nLoginTriggerID = 3012;
function yp_onLogin()
--	print("yp_onLogin")
	local m,x,y = GetWorldPos();
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nType = 0;
	for i = 1,getn(tMainMapID) do
		if tMainMapID[i][1] == m then
			nType = i
			break;
		end
	end
	if nType == 0 then
		return 0;
	end
	local tScript = {
		"\\script\\missions\\yp\\tls\\mission.lua",
		"\\script\\missions\\yp\\hss\\mission.lua",
		"\\script\\missions\\yp\\mm\\mission.lua",
		"\\script\\missions\\yp\\qmy\\mission.lua",
		"\\script\\missions\\yp\\tysd\\mission.lua",
	}
	SetPlayerScript(tScript[nType]);
	SendScript2VM(tScript[nType],"this:onLogin("..nCamp..")");	
end

--ÊÆÁ¦½çÃæÏÔÊ¾Ïà¹Ø½éÉÜ
function yp_c2s_detail()
	local strtab = {
		"TruyÒn ®¹o thô nghiÖp/#yp_c2s_detail2(1)",
		"ThÊt L¹c Nhai-TÇm b¶o/#yp_c2s_detail2(2)",
		"ThÊt L¹c Nhai-§o¹t th­/#yp_c2s_detail2(3)",
		"ThÇn Du Ch©n Nh©n/#yp_c2s_detail2(4)",
		"Thiªn ¢m Th¸m BÝ/#yp_c2s_detail2(5)",
		"KÕt thóc ®èi tho¹i/nothing"	
	};
	Say("Trong thÕ lùc T©y Vùc, ngo¹i trõ cung cÊp nhiÖm vô thÕ lùc cña m×nh, cßn sÏ ph¸t sinh mét sè sù kiÖn ngÉu nhiªn.",
		getn(strtab),
		strtab)
end

function yp_c2s_detail2(nType)
	local strMsg = {
			"    Thêi gian truyÒn ®¹o cña thÕ lùc lµ 11:00-11:15, 17:00-17:15 vµ 21:00-21:15 h»ng ngµy, trong kho¶ng thêi gian nµy, c¸c hiÖp sÜ cã thÓ vµo thÕ lùc cña m×nh t×m Ng­êi TruyÒn §¹o, ngåi ë xung quanh nghe truyÒn ®¹o. Trong thêi gian truyÒn ®¹o, sÏ nhËn ®­îc quµ cña chñ thÕ lùc.",
			"    TÇm B¶o Nh©n ë ThÊt L¹c Nhai ®· tõ bá kÕ ho¹ch t×m kho b¸u, 17:00 vµ 21:00 h»ng ngµy, c¸c thiÕu hiÖp h·y ®Õn ThÊt L¹c Nhai t×m anh Êy lÊy c«ng cô vµ thö xem cã ph¸t hiÖn g× kh«ng.\n",
			"    V× muèn gióp ®ì c¸c hiÖp sÜ cña Vâ L©m Minh, B¸ch HiÓu Sinh ®· lÖnh cho TruyÒn Gi¸o Sø vµo lóc 06:00, 12:00, 18:00 vµ 24:00 h»ng ngµy, ®Õn ThÊt L¹c Nhai truyÒn thô kinh th­ t©m ph¸p. Tam ph¸p cã h¹n, ng­êi ®Õn tr­íc sÏ ®­îc tr­íc.",
			"    T­¬ng truyÒn r»ng 14:00 vµ 20:00 h»ng ngµy, ThÇn Du Ch©n Nh©n sÏ ®Õn ThÊt L¹c Nhai du ngo¹n. Ng­êi cã duyªn sÏ nhËn ®­îc h¹t gièng do ThÇn Du Ch©n Nh©n ban tÆng, sau khi trång sÏ nhËn ®­îc phÇn th­ëng phong phó.",
			"    Thiªn ¢m Th¸nh §Þa lµ n¬i truyÒn gi¸o cña Thiªn ¢m Gi¸o, h»ng ngµy vµo lóc 16:00-16:30 vµ 22:00-22:30 míi cã thÓ vµo. ThiÕu hiÖp cã thÓ ®i th¨m dß t×nh b¸o míi nhÊt cña Thiªn ¢m, chó ý ng­êi ®ã cã mang theo Huy HiÖu Vâ L©m Minh hay kh«ng.",
		}
	Talk(1,"yp_c2s_detail",strMsg[nType]);
end

--ÊÆÁ¦½çÃæ»ñµÃÈËÆøÖµ
function yp_c2s_getRqz()
	local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
	tbPVPCharm:reflash();
	tbPVPCharm:apply("\\script\\missions\\yp\\yp_head.lua","yp_c2s_getRqz_CallBack");	
end

function yp_c2s_getRqz_CallBack(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
	local nRqz = 0;
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= 0 then
		nRqz = tbPVPCharm[0][2+nCamp];
	end
	SendScript2Client(format("UpdateWindow('pvp',%d)",nRqz))
end

function yp_dailyClean()
	SetTask(TASK_FIELD_PVP_CAR_TASK, 0);
	SetTask(TASK_FIELD_PVP_CAR_BIAOLING, 0);
	SetTask(TASK_FIELD_PVP_CAR_DAILY_NUM, 0);
	SetTask(TASK_FIELD_PVP_FIREBOX_NUM, 0);
end

function yp_weeklyClean()
	SetTask(TASK_FIELD_PVP_GXD_WARD, 0);
end