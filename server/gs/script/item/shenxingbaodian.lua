-- =========================================================
-- File: 神行宝典的脚本
-- Name: shenxingbaodian.lua
-- ID:   0, 200, 39
-- Desc: 使用后去到指定地点，同时消耗一定的耐久度
-- Creator: Tony(Jizheng)
-- Date: Nov 30th, 2006
-- =========================================================


--这是一个描述神行宝典所能到达的地点的数据结构
--可以很方便地根据这个结构来算出到达某一目的所要进行的神行宝典操作顺序，如第一页对话选第几项，第二页对话选第几项，etc
TB_DES_INFO = 
--目的地，目的地描述，消耗耐久，到目的地后地战斗状态
{
	[1] = 	--我想去练级地图
	{
		[0] = "Khu v鵦 luy謓 c蕄",
		[1] = {21,"Nh� Long s琻",3,1},
		[2] = {22,"Ki誱 M玭 quan",3,1},
		[3] = {24,"Mi猽 L躰h",3,1},
		[4] = {30,"H筺h Hoa th玭",3,1},
		[5] = {31,"Ng� чc m� cung t莕g 1",3,1},
		[6] = {32,"Ng� чc cung t莕g 2",3,1},
		[7] = {33,"D� Tr� l﹎",3,1},
		[8] = {34,"Long Tuy襫 Th玭",3,1},
		[9] = {35,"M� Tuy誸 s琻 trang",3,1},
		[10] = {36,"� M玭g B�",3,1},
		[11] = {37,"V﹏ M閚g Tr筩h",3,1},
		[12] = {38,"Linh B秓 s琻",3,1},
		[13] = {39,"Giang T﹏ Th玭",4,1},
		[14] = {40,"V� L╪g s琻",3,1},
		[15] = {41,"Ch﹏ n骾 V� L╪g",3,1},
		[16] = {42,"Thanh Kh� ng",3,1},
		[17] = {43,"Thi誹 L﹎ m藅 th蕋-1",3,1},
		[18] = {44,"Thi誹 L﹎ m藅 th蕋-2",3,1},
		[19] = {45,"Tng V﹏ ng",3,1},
		[20] = {46,"Dng Trung ng-1",3,1},
		[21] = {47,"Dng Trung ng-2",4,1},
		[22] = {48,"Dng Trung ng-3",5,1},
		[23] = {49,"B╪g T﹎ ng_1",4,1},
		[24] = {50,"B╪g T﹎ ng_2",5,1},
		[25] = {51,"Tr骳 Ty ng_1",3,1},
		[26] = {52,"Tr骳 Ty ng-2",4,1},
		[27] = {53,"Th蕋 Tinh ng-1",3,1},
		[28] = {54,"Th蕋 Tinh ng-2",4,1},
		[29] = {55,"Nh筺 M玭 quan",3,1},
		[30] = {56,"Ki誱 C竎 Th鬰 o",3,1},
		[31] = {57,"觤 Thng s琻",3,1},
		[32] = {58,"V� Di s琻",3,1},
		[33] = {59,"Ph鬰 Ng璾 s琻",3,1},
		[34] = {60,"Lng S琻 B筩",3,1},
		[35] = {61,"Lng Th駓 ng_1",4,1},
		[36] = {62,"Lng Th駓 ng_2",5,1},
		[37] = {63,"Kim Quang ng",3,1},
		[38] = {64,"Thanh Th祅h s琻",3,1},
		[39] = {65,"Phong Ma ng-1",4,1},
		[40] = {66,"Phong Ma ng-2",5,1},
		[41] = {67,"Y課 T� ng-1",3,1},
		[42] = {68,"Y課 T� ng-2",4,1},
		[43] = {69,"H綾 Phong ng",3,1},
		[44] = {70,"Long H� ng-1",3,1},
		[45] = {71,"Long H� ng-2",4,1},
		[46] = {72,"Ph鬾g Nh穘 ng",3,1},
		[47] = {73,"B筩h Th駓 ng-1",3,1},
		[48] = {74,"B筩h Th駓 ng-2",4,1},
		[49] = {75,"Йng H秈 H秈 T﹏ 1",3,1},
		[50] = {76,"Йng H秈 H秈 T﹏ 2",4,1},
		[51] = {77,"Long Nh穘 ng-1",6,1},
		[52] = {78,"Long Nh穘 ng-2",7,1},
		[53] = {79,"Thi猲 S� ng-1",5,1},
		[54] = {80,"Thi猲 S� ng-2",6,1},
		[55] = {81,"Phong Й",6,1},
		[56] = {82,"Чi Th秓 Nguy猲 1",3,1},
		[57] = {83,"Чi Th秓 Nguy猲 2",4,1},
		[58] = {84,"B� l筩 Vng K�",4,1},
		[59] = {85,"Уo Hoa o",5,1},
		[60] = {86,"Qu� M玭 H錳 Lang",7,1},
		[61] = {87,"Thanh  ng_1",5,1},
		[62] = {88,"Thanh  ng_2",6,1},
		[63] = {89,"T﹜ Song B秐 N筽 B綾 ",5,1},
		[64] = {90,"T﹜ Song B秐 N筽 Nam ",6,1},
		[65] = {91,"Thi猲 T莔 th竝_1",6,1},
		[66] = {92,"Thi猲 T莔 th竝_2",7,1},
		[67] = {93,"Thi猲 T莔 th竝_3",8,1},
		[68] = {94,"Vng M蓇 ng_1",6,1},
		[69] = {95,"Vng M蓇 ng_2",7,1},
		[70] = {96,"Vng M蓇 ng-3",8,1},
		[71] = {98,"Thi猲 s� b� c秐h",8,1},
		[72] = {99,"B綾 Ph鬾g Tng",4,1},
		[73] = {100,"Nam Ph鬾g Tng",4,1},
		[74] = {101,"Long M玭 tr蕁",5,1},
		[75] = {102,"Quang Minh nh",7,1},
		[76] = {103,"T莕 L╪g",8,1},
		[77] = {104,"Ho祅g L╪g m� th蕋 t莕g 1",9,1},
		[78] = {105,"Ho祅g L╪g m� th蕋 t莕g 2",10,1},
		[79] = {106,"C� Dng ng_1",8,1},
		[80] = {107,"C� Dng ng_2",9,1},
		[81] = {108,"Dc Vng c鑓",9,1},
		[82] = {109,"Dc Vng ng",10,1},
		[83] = {110,"M� cung sa m筩",10,1},
		[84] = {111,"Dao Ti猲 ng",4,1},
	},
	[2] = 	--我想去门派地图
	{
		[0] = "Khu v鵦 m玭 ph竔",
		[1] = {"NewWorld(204,1599,3182)","Thi誹 L﹎",5,0,1},
		[2] = {"NewWorld(312,1825,3323)","V� ng",5,0,1},
		[3] = {"NewWorld(209,1547,3183)","C竔 Bang",5,0,1},
		[4] = {"NewWorld(303,1645,3159)","Nga My",5,0,1},
		[5] = {"NewWorld(305,1598,2824)","Л阯g M玭",5,0,1},
		[6] = {"NewWorld(219,1538,3151)","Dng M玭",5,0,1},
		[7] = {"NewWorld(407,1609,3193)","Ng� чc",5,0,1},
		[8] = {"NewWorld(509,1424,3444)","C玭 L玭",5,0,1},
		[9] = {"NewWorld(404,1560,2735)","Th髖 Y猲",5,0,1},
	},
	[3] = 	--我想去功能NPC处
	{
		[0] = "Ch� NPC th祅h th�",
		[1] = 
		{
			[0] = "Bi謓 Kinh",
			[1] = {"NewWorld(200,1488,2953)","Th� kh� (Йng)",5,0},
			[2] = {"NewWorld(200,1296,2990)","Th� kh� (Nam)",5,0},
			[3] = {"NewWorld(200,1272,2774)","Th� kh� (T﹜)",5,0},
			[4] = {"NewWorld(200,1183,2826)","D� T萿",5,0},
			[5] = {"NewWorld(200,1169,2845)","Th� Ti觰 Nha",5,0},
			[6] = {"NewWorld(200,1360,2925)","Ch� thng h閕",5,0},
			[7] = {"NewWorld(200,1439,2956)","Thng nh﹏ T﹜ V鵦",5,0},
			[8] = {"NewWorld(200,1482,2764)","L� quan",5,0},
			[9] = {"NewWorld(200,1392,2659)","B� u",5,0},
			[10] = {"NewWorld(200,1150,2850)","Th莕 Du Ch﹏ Nh﹏",5,0},
			[11] = {"NewWorld(200,1228,2761)","S� gi� T祅g Ki誱",5,0},
			[12] = {"NewWorld(200,1379,2870)","Чi s� ho箃 ng cu鑙 tu莕",5,0},
			[13] = {"NewWorld(200,1401,2663)","Tri謚 Ph�",5,0},
			[14] = {"NewWorld(200,1392,2817)","Ch﹏ T� Кn",5,0},
		},
		[2] = 
		{
			[0] = "Th祅h Й",
			[1] = {"NewWorld(300,1682,3652)","Th� kh� (Nam)",5,0},
			[2] = {"NewWorld(300,1693,3460)","Th� kh� (T﹜)",5,0},
			[3] = {"NewWorld(300,1925,3473)","Th� kh� (B綾)",5,0},
			[4] = {"NewWorld(300,1634,3549)","D� T萿",5,0},
			[5] = {"NewWorld(300,1653,3559)","Th� Ti觰 Nha",5,0},
			[6] = {"NewWorld(300,1897,3492)","Ch� thng h閕",5,0},
			[7] = {"NewWorld(300,1794,3608)","Thng nh﹏ T﹜ V鵦",5,0},
			[8] = {"NewWorld(300,1787,3497)","L� quan",5,0},
			[9] = {"NewWorld(300,1779,3473)","B� u",5,0},
			[10] = {"NewWorld(300,1974,3552)","Th莕 Du Ch﹏ Nh﹏",5,0},
			[11] = {"NewWorld(300,1776,3701)","S� gi� T祅g Ki誱",5,0},
			[12] = {"NewWorld(300,1742,3549)","Чi s� c玭g th祅h",5,0},
			[13] = {"NewWorld(300,1728,3536)","Qu秐 th祅h s�",5,0},
			[14] = {"NewWorld(300,1822,3378)","Ti猽 s�",5,0},
			[15] = {"NewWorld(300,1840,3570)","Ch� l玦 i",5,0},
			[16] = {"NewWorld(300,1959,3545)","Chu Thi謓 Nh﹏",5,0},
		},
		[3] = 
		{
			[0] = "Tuy襫 Ch﹗",
			[1] = {"NewWorld(100,1554,3075)","Th� kh� (Йng)",5,0},
			[2] = {"NewWorld(100,1387,2902)","Th� kh� (T﹜)",5,0},
			[3] = {"NewWorld(100,1518,2869)","Th� kh� (B綾)",5,0},
			[4] = {"NewWorld(100,1447,2800)","D� T萿",5,0},
			[5] = {"NewWorld(100,1459,2811)","Th� Ti觰 Nha",5,0},
			[6] = {"NewWorld(100,1537,2933)","Ch� thng h閕",5,0},
			[7] = {"NewWorld(100,1499,3059)","Thng nh﹏ T﹜ V鵦",5,0},
			[8] = {"NewWorld(100,1512,2990)","L� quan",5,0},
			[9] = {"NewWorld(100,1519,2988)","B� u",5,0},
			[10] = {"NewWorld(100,1381,2857)","Th莕 Du Ch﹏ Nh﹏",5,0},
			[11] = {"NewWorld(100,1509,3107)","S� gi� T祅g Ki誱",5,0},
		},
		[4] = 
		{
			[0] = "Dng Ch﹗",
			[1] = {"NewWorld(150,1757,3178)","Th� kh� (Йng)",5,0},
			[2] = {"NewWorld(150,1614,3173)","Th� kh� (Nam)",5,0},
			[3] = {"NewWorld(150,1633,3052)","Th� kh� (T﹜)",5,0},
			[4] = {"NewWorld(150,1727,3073)","Th� kh� (B綾)",5,0},
			[5] = {"NewWorld(150,1680,3118)","Th� Ti觰 Nha",5,0},
			[6] = {"NewWorld(150,1635,3139)","Ch� thng h閕",5,0},
			[7] = {"NewWorld(150,1653,3109)","Thng nh﹏ T﹜ V鵦",5,0},
			[8] = {"NewWorld(150,1738,3158)","B� u",5,0},
			[9] = {"NewWorld(150,1744,3121)","S� gi� T祅g Ki誱",5,0},
			[10] = {"NewWorld(150,1713,3137)","Чi s� ho箃 ng cu鑙 tu莕",5,0},
			[11] = {"NewWorld(150,1680,3161)","Ch� huy s�",5,0},
			[12] = {"NewWorld(150,1650,3174)","T� Quang C竎 L穙 Nh﹏",5,0},
			[13] = {"NewWorld(150,1600,3136)","B� mai",5,0},
			[14] = {"NewWorld(150,1588,3143)","X秓 n�",5,0},
			[15] = {"NewWorld(150,1711,3046)","S� gi� h玭 l�",5,0},
			[16] = {"NewWorld(150,1701,3170)","c s� V� L﹎",5,0},
		},
		[5] = 
		{
			[0] = "Tng Dng",
			[1] = {"NewWorld(350,1387,3065)","Th� kh� (Nam)",5,0},
			[2] = {"NewWorld(350,1359,2869)","Th� kh� (T﹜)",5,0},
			[3] = {"NewWorld(350,1532,2861)","Th� kh� (B綾)",5,0},
			[4] = {"NewWorld(350,1436,2808)","Th� Ti觰 Nha",5,0},
			[5] = {"NewWorld(350,1455,2924)","Ch� thng h閕",5,0},
			[6] = {"NewWorld(350,1497,2882)","Thng nh﹏ T﹜ V鵦",5,0},
			[7] = {"NewWorld(350,1506,2997)","B� u",5,0},
			[8] = {"NewWorld(350,1394,2850)","S� gi� T祅g Ki誱",5,0},
			[9] = {"NewWorld(350,1452,2968)","Чi s� ho箃 ng cu鑙 tu莕",5,0},
			[10] = {"NewWorld(350,1503,3023)","Ch� huy s�",5,0},
			[11] = {"NewWorld(350,1415,2930)","Th� r蘮 L璾",5,0},
			[12] = {"NewWorld(350,1345,2924)","M筩 Tam",5,0},
			[13] = {"NewWorld(350,1433,2769)","Minh Ch� Kim S琻",5,0},
		},
		[6] = 
		{
			[0] = "Чi L�",
			[1] = {"NewWorld(400,1528,3111)","Th� kh� (Йng)",5,0},
			[2] = {"NewWorld(400,1455,3070)","Th� kh� (Nam)",5,0},
			[3] = {"NewWorld(400,1553,2912)","Th� kh� (B綾)",5,0},
			[4] = {"NewWorld(400,1485,3018)","Th� Ti觰 Nha",5,0},
			[5] = {"NewWorld(400,1486,2924)","Ch� thng h閕",5,0},
			[6] = {"NewWorld(400,1428,3005)","Thng nh﹏ T﹜ V鵦",5,0},
			[7] = {"NewWorld(400,1506,2847)","L� quan",5,0},
		},
		[7] = 
		{
			[0] = "Ph鬾g Tng",
			[1] = {"NewWorld(500,1795,3216)","Th� kh� (Йng)",5,0},		
			[2] = {"NewWorld(500,1656,3215)","Th� kh� (Nam)",5,0},
			[3] = {"NewWorld(500,1677,3095)","Th� kh� (T﹜)",5,0},
			[4] = {"NewWorld(500,1827,3049)","Th� kh� (B綾)",5,0},
			[5] = {"NewWorld(500,1771,3186)","Ch� thng h閕",5,0},
			[6] = {"NewWorld(500,1893,3113)","B� u",5,0},
			[7] = {"NewWorld(500,1762,3127)","Th� t鎛g qu秐",5,0},
			[8] = {"NewWorld(500,1640,3183)","Long Quang Ch﹏ Nh﹏",5,0},
		},		
	},
	[4] = 	--我想去生活采集技能师傅处
	{
		[0] = "K� n╪g thu th藀 n琲 s� ph�",
		[1] = {"NewWorld(300,1836,3430)","Th祅h Й Чi Kho竛g C玭g (o kho竛g)",3,0},
		[2] = {"NewWorld(300,1848,3493)","Th祅h Й Ho祅g Чi Th萴 (K衞 t�)",3,0},
		[3] = {"NewWorld(200,1220,2909)","Bi謓 Kinh L璾 Nh蕋 Ph� (цn g�)",3,0},
		[4] = {"NewWorld(200,1347,3029)","Bi謓 Kinh th� s╪ Trng (Thu閏 da)",3,0},
		[5] = {"NewWorld(100,1393,2969)","Tuy襫 Ch﹗ M筩 Qu﹏ Чo trng (T藀 linh)",3,0},
		[6] = {"NewWorld(100,1555,2961)","Tuy襫 Ch﹗ L﹎ Dc S� (H竔 thu鑓)",3,0},
		[7] = {"NewWorld(100,1603,2968)","Tuy襫 Ch﹗ L� Phong Thu (Canh t竎)",3,0},
	},
	[5] = 	--我想游戏功能地图
	{
		[0] = "Ch� b竜 danh ch鴆 n╪g game",
		[1] = 
			{
				[0] = "Khu v鵦 ho箃 ng c馻 S竧 Th� Л阯g",
				[1] = {97,"Ph﹏  s竧 th� 阯g",10,1},
			},
		[2] = 
			{
				[0] = "M藅 th蕋 s� m玭",
				[1] = {"NewWorld(204,1644,3270)","Thi誹 L﹎ Huy襫 Kh玭g",5,0},
				[2] = {"NewWorld(305,1674,2936)","Л阯g M玭 Л阯g T� M筩",5,0},
				[3] = {"NewWorld(303,1715,3059)","Nga My Tu� V﹏ S� Th竔",5,0},
				[4] = {"NewWorld(209,1530,3209)","C竔 Bang B祅g L� V鋘g",5,0},
				[5] = {"NewWorld(312,1871,3276)","V� ng Ti誸 V﹏ Tranh",5,0},
				[6] = {"NewWorld(219,1542,2939)","Dng M玭 Dng Di猲 Chi猽",5,0},
				[7] = {"NewWorld(407,1572,3160)","Ng� чc C﹗ S竎h",5,0},
				[8] = {"NewWorld(509,1539,3230)","C玭 L玭  Tr莕 B蕋 Vi",5,0},
				[9] = {"NewWorld(404,1539,2698)","Th髖 Y猲  L璾 Thanh Mi",5,0},
		},
		[3] = 
			{
				[0] = "Chi課 trng T鑞g Li猽",
				[1] = {"NewWorld(200,1291,2873)","Tri謚 Di猲 Ni猲 (b竜 danh Nh筺 M玭 quan-T鑞g) ",5,0},
				[2] = {"NewWorld(200,1301,2793)","Ti猽 Vi詎 L﹗ (b竜 danh Nh筺 M玭 quan-Li猽)",5,0},
				[3] = {"NewWorld(500,1830,3144)","Dng Hi謙 (Ng鋍 M玭 quan b竜 danh_T鑞g)",5,0},
				[4] = {"NewWorld(500,1710,3238)","T莕 Thi猲 T玭 (b竜 danh Ng鋍 m玭 quan-Li猽)",5,0},
				[5] = {"NewWorld(808,1645,3180)","Chi猽 m� s�-Li猽",5,0},
				[6] = {"NewWorld(808,1735,3074)","Chi猽 m� s�-T鑞g",5,0},
				[7] = {"NewWorld(806,1643,3180)","Chi猽 m� s�-Li猽",5,0},
				[8] = {"NewWorld(806,1733,3073)","Chi猽 m� s�-T鑞g",5,0},
			},
		[4] =
			{ 
				[0] = "D� th竚 T﹜ V鵦",
				[1] = {"NewWorld(500,1762,3147)","M藅 th竚 Чi T鑞g T﹜ V鵦 (m藅 th竚 T﹜ V鵦)",5,0},
				[2] = {"NewWorld(512,2052,3416)","е t� C玭 L玭 (m藅 ng C� Dng)",10,1},
				[3] = {"NewWorld(513,1595,3190)","Th� M� Nh﹏ (m藅 o Ho祅g l╪g)",10,1},
				[4] = {"NewWorld(510,1574,2867)","Dc th蕋 th� v� (Luy謓 n ng)",10,1},
				[5] = {"NewWorld(514,1725,2873)","Th� M� Tng Qu﹏ (m藅 th蕋 Ho祅g l╪g)",10,1},
				[6] = {"NewWorld(506,1316,2726)","Ng� H祅h Tr薾 S� (Ng� H祅h Tr薾)",10,1},
				[7] = {"NewWorld(506,1544,2668)","B筩h Thi猲 Th祅h (T薾 c飊g sa m筩)",10,1},
				[8] = {"NewWorld(507,1651,3304)","Ti觰 Nh� (y課 ti謈 Long M玭)",5,1},
			},
		[5] = 
			{
				[0] = "B秐  nhi謒 v�",
				[1] = {"NewWorld(502,1637,3237)","Hoa S琻",4,0},
				[2] = {"NewWorld(6016,1499,3094)","Mai Trang",4,1},
				[3] = {"NewWorld(6024,1652,3093)","Thi誸 Chng S琻 Trang",4,1},
				[4] = {"NewWorld(6025,1699,3397)","Th莕 甶謓",4,1},
			},
	},
}

FLIGHTPOSTASKID_BEGIN = 90
FLIGHTPOSTASKID_1 = 90
FLIGHTPOSTASKID_2 = 91
FLIGHTPOSTASKID_3 = 92
FLIGHTPOSTASKID_4 = 93
FLIGHTPOSTASKID_5 = 94
FLIGHTPOSTASKID_END = 94

Tb_map_caiji = {704,705,706,707,710,711,712,713,714,715,716,717,718,719,720,721,722,723,724,6024,6025}
-- 使用物品的时候，默认的入口函数
function OnUse(nIdx)
--	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--战斗状态下PK模式不可以使用
--		Talk(1,"","在战斗状态下，要先设置为练功模式才能使用神行宝典。");
--		return 0;
--	end;
	local nMapID = GetWorldPos()
	local caji_map_chk_flag = 0
	for i = 1, getn(Tb_map_caiji) do
		if nMapID == Tb_map_caiji[i] then
			caji_map_chk_flag = 1
			break
		end
	end
	if nMapID == 606 or nMapID == 101 or (nMapID >= 700 and caji_map_chk_flag == 0) then
		Talk(1,"","Khu v鵦 n祔 kh玭g th� d飊g Th莕 H祅h b秓 甶觧.");
		return 0;
	end;
	local nScrollIndex = tonumber(nIdx)		-- 被使用的神行宝典的Index
	
	local nleft = AbradeItem(nScrollIndex, 0)
	if (nleft == 0) then
		Say("ч b襫 Th莕 H祅h b秓 甶觧 c馻 b筺 l� 0, tan r� th祅h t鮪g m秐h!", 0)
		DelItemByIndex(nScrollIndex, 0)					-- 耐久为0要删除掉物品
	end
	local selTab = {};
	tinsert(selTab,"Ta mu鑞 t韎 1 v礽 n琲 m� ta 甶 g莕 y/#flight_recently("..nScrollIndex..")");
	for i=1,getn(TB_DES_INFO) do
		tinsert(selTab,"Ta mu鑞 甶 "..format(TB_DES_INFO[i][0].."/#list_destination(%d,%d)",nScrollIndex,i));
	end;
	tinsert(selTab,"T筸 th阨 ch璦 s� d鬾g!/cancel_dialog");
	Say("B筺 mu鑞 d飊g Th莕 H祅h b秓 甶觧 n u?",getn(selTab),selTab);
end;

function list_destination(nScrollIndex,...)
	local tbDes = TB_DES_INFO;
	for i=1,getn(arg) do
		tbDes = tbDes[arg[i]];
	end;
	local nArgSize = arg.n;
	local szCmdStr = "";
	if type(tbDes[1][1]) == "table" then	--还得深入一层
		local selTab = {};
		for i=1,getn(tbDes) do
			arg[nArgSize+1] = i;
			arg.n = nArgSize+1;
			szCmdStr = tbDes[i][0]..get_cmd_string("list_destination",nScrollIndex,gf_UnPack(arg));
			tinsert(selTab,szCmdStr);
		end;
		tinsert(selTab,"Quay v� trang trang i tho筰/#OnUse("..nScrollIndex..")")
		tinsert(selTab,"T筸 th阨 ch璦 s� d鬾g!/cancel_dialog");
		Say("Ngi mu鑞 甶 u?",getn(selTab),selTab);
	else
		list_page(1,nScrollIndex,gf_UnPack(arg))
	end;
end;

function gf_UnPack(tbTable,nStartIdx,nEndIdx)
	local nSize = getn(tbTable);
	nStartIdx = nStartIdx or 1;
	nEndIdx = nEndIdx or nSize;
	if tbTable[nStartIdx] and nStartIdx <= nEndIdx then
		return tbTable[nStartIdx],gf_UnPack(tbTable,nStartIdx+1,nEndIdx);
	end;
end;

MAX_SEL_PER_PAGE = 7;	--一页最多可显示数量

function list_page(nPageNum,nScrollIndex,...)
	local tbDesTab = get_destination_list(nScrollIndex,gf_UnPack(arg));
	local nRecordCount = getn(tbDesTab);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbDesTab[i]);
	end;
	local szCmdStr = "";
	if nPageNum ~= 1 then
		szCmdStr = "Trang trc"..get_cmd_string("list_page",nPageNum-1,nScrollIndex,gf_UnPack(arg));
		tinsert(selTab,szCmdStr);
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		szCmdStr = "Trang k�"..get_cmd_string("list_page",nPageNum+1,nScrollIndex,gf_UnPack(arg));
		tinsert(selTab,szCmdStr);	
	end;
	tinsert(selTab,"Quay v� trang trang i tho筰/#OnUse("..nScrollIndex..")")
	tinsert(selTab,"T筸 th阨 ch璦 s� d鬾g!/cancel_dialog");
	local nMaxPage = ceil(getn(tbDesTab)/MAX_SEL_PER_PAGE);
	Say("Ngi mu鑞 n n琲 n祇? Hi謓 l� trang <color=yellow>"..nPageNum.."<color>, t鎛g c閚g <color=yellow>"..nMaxPage.."<color> trang.",getn(selTab),selTab);
end;

function get_destination_list(nScrollIndex,...)
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		Talk(1,"","Tr筺g th竔 hi謓 t筰 kh玭g th� s� d鬾g th莕 h祅h.")
		return 0
	end
	local tSelTab = {};
	local tbDes = TB_DES_INFO;
	for i=1,getn(arg) do
		tbDes = tbDes[arg[i]];
	end;
	local nArgSize = arg.n;
	local szCmdStr = "";
	for i=1,getn(tbDes) do
		arg[nArgSize+1] = i;
		arg.n = nArgSize+1;
		szCmdStr = tbDes[i][2].."(ti猽 hao  b襫 "..tbDes[i][3].." 甶觤)"..get_cmd_string("go_to_destination",nScrollIndex,gf_UnPack(arg));
		tinsert(tSelTab,szCmdStr);
	end;
	return tSelTab;
end;

function go_to_destination(nScrollIndex,...)
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		Talk(1,"","Tr筺g th竔 hi謓 t筰 kh玭g th� s� d鬾g th莕 h祅h.")
		return 0
	end
	local tbDes = TB_DES_INFO;
	for i=1,getn(arg) do
		tbDes = tbDes[arg[i]];
	end;
	local nCost = tbDes[3];
	local nFightState = tbDes[4];
	CleanInteractive();
	if type(tbDes[1]) == "string" then
		dostring(tbDes[1]);
		AbradeItem(nScrollIndex, nCost);
		SetFightState(nFightState);
	elseif type(tbDes[1]) == "number" then
		AbradeItem(nScrollIndex, nCost);
		UseFlightList(tbDes[1],nScrollIndex,nCost);
	end;
	set_recently_pos(arg)
	Msg2Player("Ti猽 hao  b襫"..nCost.." 甶觤");
end;

-- 去最近的一些地方
function flight_recently(nScrollIndex)
	local tbPosInfo = {};
	for i=FLIGHTPOSTASKID_BEGIN,FLIGHTPOSTASKID_END do
		tinsert(tbPosInfo,GetTask(i));
	end;
	if GetTask(FLIGHTPOSTASKID_BEGIN) == 0 then
		Talk(1,"#OnUse("..nScrollIndex..")","G莕 y ngi kh玭g d飊g Th莕 h祅h b秓 甶觧 sao.");
		return 0;
	end;
	local selTab = {};
	local tbDes = {};
	local tbIndex = {};
	for i=1,getn(tbPosInfo) do
		tbIndex = get_pos_index(tbPosInfo[i]);
		local szPlaceHeader = "";
		if getn(tbIndex) >= 2 then	--旧的神行getn(tbIndex) == 1
			tbDes = TB_DES_INFO;
			for j=1,getn(tbIndex) do
				tbDes = tbDes[tbIndex[j]];
				--如果tbDes是nil，那么就有可能是任务变量的值出错了
				if tbDes ~= nil and tbDes[0] ~= nil then
					szPlaceHeader = szPlaceHeader..tbDes[0].."--";
				end;
			end;
			if tbDes ~= nil then	--如果是nil值就跳过
				szCmdStr = szPlaceHeader..tbDes[2].."(ti猽 hao  b襫 "..tbDes[3].." 甶觤)"..get_cmd_string("go_to_destination",nScrollIndex,gf_UnPack(tbIndex));
				tinsert(selTab,szCmdStr);
			end;
		end;
	end;
	tinsert(selTab,"\nTr� v� khung i tho筰 ch輓h/#OnUse("..nScrollIndex..")")
	tinsert(selTab,"T筸 th阨 ch璦 s� d鬾g!/cancel_dialog");
	Say("Xin ch鋘 a 甶觤 mu鑞 n:",getn(selTab),selTab);
end;
--根据任务变量算出位置的索引
function get_pos_index(nTaskValue)
	local tbRet = {};
	local nIndex1 = mod(nTaskValue,1000);
	local nIndex2 = floor(mod(nTaskValue,100000)/1000);
	local nIndex3 = floor(nTaskValue/100000);
	local tb = {nIndex3,nIndex2,nIndex1};
	for i=1,getn(tb) do
		if tb[i] ~= 0 then
			tinsert(tbRet,tb[i]);
		end;
	end;
	return tbRet;
end;
--计算位置信息值
function generate_pos_index_value(tbPos)
	local nRetValue = 0;
	if getn(tbPos) == 2 then
		nRetValue = tbPos[1]*1000+tbPos[2];
	else
		nRetValue = tbPos[1]*100000+tbPos[2]*1000+tbPos[3];
	end;
	return nRetValue;
end;
-- 设置最近去过的地方
function set_recently_pos(tbPos)
	local nPosTskValue = generate_pos_index_value(tbPos);
	for i=FLIGHTPOSTASKID_BEGIN,FLIGHTPOSTASKID_END do	--向后遍历处理
		if GetTask(i) == nPosTskValue then
			for j=i,FLIGHTPOSTASKID_BEGIN+1,-1 do	--向前遍历处理
				SetTask(j,GetTask(j-1));
			end;
			SetTask(FLIGHTPOSTASKID_BEGIN,nPosTskValue);
			return 1;
		end;
	end;
	for i=FLIGHTPOSTASKID_END,FLIGHTPOSTASKID_BEGIN+1,-1 do	--从后向前遍历
		SetTask(i,GetTask(i-1));
	end;
	SetTask(FLIGHTPOSTASKID_BEGIN,nPosTskValue);
	return 1;
end;

function get_cmd_string(szCallBackFunc,...)
	local szCmdStr = "";
	szCmdStr = "/#"..szCallBackFunc.."(";
	for i=1,getn(arg) do
		szCmdStr = szCmdStr.."%d,"
	end;
	szCmdStr = strsub(szCmdStr,1,strlen(szCmdStr)-1);
	szCmdStr = szCmdStr..")";	--把最后面那个逗号换成右括号
	szCmdStr = format(szCmdStr,gf_UnPack(arg));
	return szCmdStr;
end;

function cancel_dialog()
end;


