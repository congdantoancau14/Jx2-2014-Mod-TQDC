--08春节头文件脚本
--by vivi
--2007/11/12

--任务变量
TASK_IS_PLANT = 1450; --记录是否放下圣诞树
TASK_PLANT_TIME = 1451; --记录放下圣诞树的时间
TASK_CHRIMS_TREE_IDX = 1452; --记录圣诞树的索引
TASK_IS_STREW = 1453; --是否接受了装饰任务
TASK_TREE_NUM = 1454; --完成装饰圣诞树的任务次数，0为没有接任务
TASK_TABLE_IDX = 1455; --记录对应tStrewTask表的索引
TASK_STEP_AWARD = 1456;--分10字节使用 记录是否领取现阶段任务圣诞树的礼品
TASK_FINAL_AWARD = 1457;--记录是否换取了最终奖励
TASK_GET_TREE = 1458; --传教士处是否领取了圣诞树
TASK_SHARP_IDX = 1459;--记录模板名，对应tTreeNpc表
TASK_PLANT_NUM = 1460; --记录一天种了几棵树，格式为：2007122400 后两位为棵数
TASK_BAI_DATE = 1461; --记录拜师的日期，每天拜一次
TASK_TAIYI_TUPU = 584; --99级给予太乙图谱一本

--春节活动
TASK_WIND_ID = 1462; --是否接受了风媒任务
TASK_WIND_FINISH = 1463; --完成标志
TASK_WIND_POS = 1464; --风媒任务所在地点
TASK_WIND_STEP = 1465; --风媒任务进行的步骤
TASK_WIND_RAND = 1466; --排名是否记录过
TASK_WIND_DATE = 1467; --每天只能做一次风媒任务
TASK_BATTLE_AWARD = 1468; --记录当天是否领取过大战场的奖励
TASK_WIND_TABLE_IDX = 1469; --记录当前要找的npc（tWindNpc表的索引）
TASK_WIND_NUM = 1470;   --记录完成过多少次拜年任务，用于拜年贴补领
TASK_DASAN_NUM = 1471;  --记录刘铁匠弟子处打散八卦装备的次数
TASK_BAGUA_GOLD = 1472; --记录刘铁匠弟子处打散八卦装备花费的金钱 单位：铜
TASK_BAGUA_BUCHANG = 1473; --刘铁匠弟子处领取的补偿次数
TASK_BUCHANG_GOLD = 1474; --记录刘铁匠弟子处领取了多少补偿
TASK_TONGQI_AWARD = 1475; --一级铜器碎片换取奖励的次数限制
TASK_QTD_AWARD = 1476; --四级青铜鼎换取奖励的次数限制
TASK_HONGBAO_DATE = 1478; --记录当天是否领取过红包
TASK_CHUWUXIANG_JIAYE = 1479;--记录是否免费加过储物箱页数

--TASK_GET_DRINK = 1467; --记录当天是否领取过英雄酒
--TASK_HERO_DRINK = 1468; --记录当天是否喝过英雄酒
--TASK_DRINK_TIME = 1469; --记录当天喝酒的时间
--TASK_HERO_IDX = 1470; --记录队长的索引
--TASK_DRINK_IDX = 1471; --记录酒席NPC的索引

--地图变量
MAP_WIND_TIME = 4; --记录风媒任务
MAP_WIND_RAND = 5; --风媒任务排行榜
MAP_HONGBAO_NUM = 6; --记录大红包数量

--触发器ID
WIND_TRIGGER_ID = 700; --风媒对话npc触发器
QUANBEI_ENTER_TRIGGER_ID = 701; --泉北pk触发器
QUANBEI_LEAVE_TRIGGER_ID =702;
DIAOLUO_QINGTONG_ID = 703;--掉落青铜ID触发器
ENTER_RECT_ID = 200; --表里id
LEAVE_RECT_ID = 201; 
QINGTONG_KILL_ID = 110;
--HERO_TRIGGER_TIME_ONE = 701; --英雄酒时间触发器
--HERO_TRIGGER_TIME_TWO = 702; --出现武林前辈时间触发器

--HERO_TIME_ID = 500; --time表里id 30s触发一次转经验（实际是28s）
--HERO_NPC_ID = 501; --time表里id 每五分钟有50%概率触发npc出现（实际是294s）

--全局常量
PLANT_LIFE_TIME = 1800; --圣诞树npc存在时间 单位：s
STREW_TREE_TOTAL = 10; --装饰圣诞树最多次数
PLANT_TREE_NUM = 2; --一天能种多少棵树
WIND_STEP_TOTAL = 15; --风媒任务总的对话次数
DASAN_TOTAL_NUM = 3; --免费打散的次数
HONGBAO_TOTAL_NUM = 50; --大红包总的数量

--DRINK_LIFE_TIME = 720; --酒席存在时间，单位：s
--DRINK_NPC_TIME = 120; --武林前辈存在时间，单位：s
--DRINK_GIVE_EXP = 100000; --触发一次转经验的系数（免费区为直接给予）

tTreeNpc = {--模板名 npc名 索引1表示没有装饰的时候
	[1] = {{"C﹜ Gi竛g sinh 1d","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 2d","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 1d","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 4d","C﹜ th玭g gi竜 h閕"}},
	[2] = {{"C﹜ Gi竛g sinh 1d","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 2d","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 1d","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 4d","C﹜ th玭g gi竜 h閕"}},
	[3] = {{"C﹜ Gi竛g sinh 1d","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 2d","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 1d","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 4d","C﹜ th玭g gi竜 h閕"}},
	[4] = {{"C﹜ Gi竛g sinh 1d","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 2d","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 1d","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 4d","C﹜ th玭g gi竜 h閕"}},
	[5] = {{"C﹜ Gi竛g sinh 1c","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 2c","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 1c","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 4c","C﹜ th玭g gi竜 h閕"}},
	[6] = {{"C﹜ Gi竛g sinh 1c","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 2c","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 1c","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 4c","C﹜ th玭g gi竜 h閕"}},
	[7] = {{"C﹜ Gi竛g sinh 1c","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 2c","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 1c","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 4c","C﹜ th玭g gi竜 h閕"}},
	[8] = {{"C﹜ Gi竛g sinh 1b","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 2b","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 1b","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 4b","C﹜ th玭g gi竜 h閕"}},
	[9] = {{"C﹜ Gi竛g sinh 1b","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 2b","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 1b","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 4b","C﹜ th玭g gi竜 h閕"}},
	[10] = {{"C﹜ Gi竛g sinh 1b","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 2b","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 1b","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 4b","C﹜ th玭g gi竜 h閕"}},
	[11] = {{"C﹜ Gi竛g sinh 1a","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 2a","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 1a","C﹜ th玭g gi竜 h閕"},{"C﹜ Gi竛g sinh 4a","C﹜ th玭g gi竜 h閕"}}
	}; 

--装饰任务 
tStrewTask = { --需要数量 物品名 物品id 地图名 怪物名
{20,"玦 th�",2,1,2," ngo筰 th祅h","Th� r鮪g"},
{20,"M蓇 Кn",2,1,76,"H綾 Phong ng","H綾 Phong Ki誱 Kh竎h"},
{20,"Di謓 Sa",2,1,1400,"B綾 Ph鬾g Tng","Y猽 c� Ba T�"},
{20,"Da H醓 H�",2,1,1404,"C� Dng ng_2","X輈h Luy謓 H醓 H�"},
{20,"Thi誸 Ban Ch�",2,1,10,"Л阯g M玭","B竎h Nh藅 Ti詎"},
{20,"V蕁 L� th筩h",2,1,9,"C竔 Bang ho芻 D� Tr� Th玭","Tr閙 v苩"},
{20,"H莡 Nhi Qu�",2,1,16,"Nga My","M� H莡"},
{20,"L玭g c竜",2,1,155,"Long Tuy襫 Th玭","H� Ly"}, 
{20,"Huy誸 Nha v�",2,1,285,"B筩h Th駓 ng-2","竎 L�"},
{20,"H� v�",2,1,19,"Thi誹 L﹎ ho芻 Linh B秓 S琻","H�"},
{20,"蕋 M閏 B礽",2,1,33,"� M玭g B�","Thi誹 n� � M玭g B�, � M玭g T閏 Nh﹏"},
{20,"Thi誸 Xoa",2,1,47,"Linh B秓 s琻","Li謕 H�"},
{20,"G蕀 lam",2,1,15,"Nga Mi ho芻 Tr骳 T� чng","N� Ki誱 Kh竎h, N� Ki誱 Hi謕"},
{20,"B秓 B譶h",2,1,29,"M� Tuy誸 S琻 Trang ho芻Th蕋 Tinh ng t莕g 1","M� Tuy誸 Thng Kh竎, Danh Thng hi謕"},
{20,"Tr鴑g chim",2,1,28,"Th蕋 Tinh ng t莕g 1 ho芻 Thanh th祅h S琻 ho芻 Giang T﹏ Th玭","Qu� n"},
{20,"Ly Tr飊g L﹏ Phi課",2,1,1416,"C� Dng ng_2","Li謙 Nhan Li Long"},
{20,"Thanh Long V╪ K輓h",2,1,1407,"Ho祅g L╪g m� th蕋 t莕g 1","уng tng"}, 
{20,"Gi竝 M閏 B礽",2,1,25,"B╪g T﹎ ng_1","Linh H�"},
{20,"H閜 trang s鴆",2,1,57,"Th蕋 Tinh ng-2","N� Ki誱 h祇"},
{20,"Kim Thoa",2,1,41,"Ki誱 C竎 Th鬰 o","o Tuy謙"},
{20,"Mi課g ng",2,1,42,"Thi誹 L﹎ m藅 th蕋-2","уng nh﹏"},
{20,"Mao Ng璾 b�",2,1,287,"Mi猽 L躰h","Mao Ng璾"},
{20,"T鰑 B玦",2,1,44,"Dng Trung ng-3","o Vng"},
{20,"Di T綾 Chung",2,1,53,"Kim Quang ng","Huy襫 V� o"},
{20,"D� T閏 Qu秈 Li猲",2,1,164,"V﹏ M閚g Tr筩h","Xi H醓 o Kh竎h"},
{20,"B輓h M閏 B礽",2,1,46,"Nh� Long s琻","Cung Li謕"},
{20,"Ng﹏ H� n",2,1,167,"V� Di s琻","Ng﹏ H�"},
{20,"Ho祅g Kim Ban Ch�",2,1,69,"Ph鬰 Ng璾 S琻, Nh筺 M玭 quan ","Li猽 ti詎 binh"},
{20,"D� M閏 B礽",2,1,66,"Nh筺 M玭 quan","T鑞g n� binh"},
{20,"L鬰 Ph竎h",2,1,62,"Tr骳 Ty ng-2","Thi猲 S竧"},
{20,"M藆 M閏 B礽",2,1,64,"Nh筺 M玭 quan ho芻 Ki誱 M玭 Quan ho芻 Lng S琻 B筩","T鑞g qu﹏ t� s�"},
{20,"da Thng Vi猲",2,1,166,"V� Di s琻","Thng Vi猲"},
{20,"T� Ph藅 Ban Ch�",2,1,94,"Ph鬰 Ng璾 s琻","T� T╪g"},
{20,"Tuy誸 Ph竎h",2,1,45,"B╪g T﹎ ng_2","B╪g Qu竔"},
{1,"nh M閏 B礽",2,1,59,"Thi誹 L﹎ m藅 th蕋-1","C� quan M閏 nh﹏"},
{20,"Kh╪ tay",2,1,289,"Y課 T� ng t莕g 1 ho芻 Y課 T� ng t莕g 2","Mi猽 L躰h Phu nh﹏"},
{20,"B筩h Ng� L﹏",2,1,170,"Йng H秈 H秈 T﹏ 1","Йng H秈 Th駓 T閏"},
{20,"V� nhung",2,1,291,"Ph鬾g Nh穘 ng","B筩h u 猽"},
{20,"Qu� M閏 B礽",2,1,85,"Thi猲 S� ng-1","Th� Qu竔"},
{20,"Da h�",2,1,292,"Ph鬾g Nh穘 ng","T� D� H�"},
{20,"M蓇 Кn",2,1,76,"H綾 Phong ng","H綾 Phong Ki誱 Kh竎h"},
{20,"Ch� Nam Ng�",2,1,96,"Long H� ng-1","L璾 Kh蕌"},
{1,"Th� gi竛g sinh-H筺h ph骳",2,1,3390,"M鏸 ng祔 l祄 "," nhi謒 v� s� m玭 v遪g 2"},
{1,"Th� gi竛g sinh-Vui m鮪g",2,1,3391,"M鏸 ng祔 l祄 "," nhi謒 v� s� m玭 v遪g 2"},
{1,"Th� gi竛g sinh-Vui v�",2,1,3392,"M鏸 ng祔 l祄 "," nhi謒 v� s� m玭 v遪g 2"},
{1,"Th� gi竛g sinh-B筺 b�",2,1,3393,"M鏸 ng祔 l祄 "," nhi謒 v� s� m玭 v遪g 2"},
{1,"Th� gi竛g sinh-May m緉",2,1,3394,"M鏸 ng祔 l祄 "," nhi謒 v� s� m玭 v遪g 2"},
{1,"Th� gi竛g sinh-Nh� �",2,1,3395,"M鏸 ng祔 l祄 "," nhi謒 v� s� m玭 v遪g 2"},
{1,"Th� gi竛g sinh-Thanh v﹏",2,1,3396,"M鏸 ng祔 l祄 "," nhi謒 v� s� m玭 v遪g 2"},
{1,"Th� gi竛g sinh-Th莕 t礽",2,1,3397,"M鏸 ng祔 l祄 "," nhi謒 v� s� m玭 v遪g 2"},
{1,"Th� gi竛g sinh-Kh醗 m筺h",2,1,3398,"M鏸 ng祔 l祄 "," nhi謒 v� s� m玭 v遪g 2"},
{1,"Th� gi竛g sinh-C� nh�",2,1,3399,"M鏸 ng祔 l祄 "," nhi謒 v� s� m玭 v遪g 2"}
};
	
tWindNpc = {--泉州 扬州 汴京 成都 襄阳 大理
	[100]={"Tuy襫 Ch﹗",{"D� T萿","Ch� Ti謒 v� kh�","Ch� Dc 甶誱","Ch� T筽 h鉧","Ch� Ti謒 Nam ph鬰","Ch� Ti謒 N� ph鬰","Ch� Kim ho祅","Ch� ti襫 trang","Th� kh�","Xa phu","Qu秐 l� c鯽 hi謚","L﹎ Dc S�","L� Phong Thu","Ch� l玦 i","Ch� huy s�","S� gi� bang ph竔","L� quan","B� u","H祅h Cc Thng Nh﹏","S� gi� T祅g Ki誱","Ch� thng h閕","V� s�","Ti觰 ng","Чi Ch� Cng","Th竔 th� ","V� binh th祅h m玭","La Sa","Vng Nghi謕 V�","Ti猽 s�","Nha d辌h","Uy Nh� T鑞","H� Ki謙","Chung Ph鉵g","Ch� t鰑 l莡","B竎h Hi觰 Sinh","Chu B﹏ C�"},
								{2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2018,2019,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,}},
	[150]={"Dng Ch﹗",{"Ch� Ti謒 v� kh�","Ch� Dc 甶誱","Ch� T筽 h鉧","Ch� Ti謒 Nam ph鬰","Ch� Ti謒 N� ph鬰","Ch� Kim ho祅","Ch� ti襫 trang","Th� kh�","Xa phu","Ch� thng h閕","Ch﹏ T� Кn","Ch� huy s�","B� u","S� gi� T祅g Ki誱","Ch� l玦 i","H祅h Cc Thng Nh﹏","L� Ti課 D騨g","H� H莡 C莔","Trng B� H竛","Thu Dung","Ch� t鰑 l莡","H� H莡 Anh","H� H莡 Li猲","L璾 Huy襫 Thanh","M穘h Nham ","Ph飊g уng Nhi","Tr莕 M蒼","Tng Duy"},
								{2041,2042,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068}},
	[200]={"Bi謓 Kinh",{"D� T萿","Ch� Ti謒 v� kh�","Ch� Dc 甶誱","Ch� T筽 h鉧","Ch� Ti謒 Nam ph鬰","Ch� Ti謒 N� ph鬰","Ch� Kim ho祅","Ch� ti襫 trang","Th� kh�","Xa phu","Qu秐 l� c鯽 hi謚","M筩 Чi","V﹏ Du Чo Nh﹏","Ng� Tr�","L璾 Nh蕋 Ph�","Th� s╪ Trng","B� u","L� quan","Ch� thng h閕","H祅h Cc Thng Nh﹏","Ch﹏ T� Кn","S� gi� T祅g Ki誱","Tri謚 Di猲 Ni猲","Ti猽 Vi詎 L﹗","S� gi� bang ph竔","V� binh th祅h m玭","T祇 B﹏","Binh B� Th� Lang","Binh B� Th� v�","Tri謚 Ph�","Th� V� Tng ph�","C蕀 qu﹏","Kh蕌 Chu萵","C蕀 qu﹏","Ch� t鰑 l莡","Ti觰 nh�","Nh﹏ s� giang h�","T祇 Чi L鵦","Gi竜 s�","V� s�","H祅g x鉳 H祅 Tr� Nhng","Ti猽 s�","V� Nng","Th莥 b鉯","Quan vi猲 tho竔 nhi謒","Ti觰 ng","B竎h Hi觰 Sinh","L� S� S�","Ngi b竛 ng鵤"},
								{2071,2072,2073,2074,2075,2076,2077,2078,2079,2080,2081,2082,2083,2084,2085,2086,2087,2088,2089,2090,2093,2094,2095,2096,2097,2098,2099,2100,2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2111,2112,2113,2114,2115,2116,2117,2118,2119,2120,2121}},
	[300]={"Th祅h Й",{"D� T萿","Ch� Ti謒 v� kh�","Ch� Dc 甶誱","Ch� T筽 h鉧","Ch� Ti謒 Nam ph鬰","Ch� Ti謒 N� ph鬰","Ch� Kim ho祅","Ch� ti襫 trang","Th� kh�","Xa phu","Qu秐 l� c鯽 hi謚","M筩 Nh�","C萴 nng","Du Phng i phu","Чi Kho竛g C玭g","Ho祅g Чi Th萴","B� u","L� quan","Ch� thng h閕","S� gi� T祅g Ki誱","H祅h Cc Thng Nh﹏","S� gi� bang ph竔","V� Nng","N筺 d﹏_B輓h","N筺 d﹏_nh","N筺 d﹏_Gi竝","N筺 d﹏ 蕋","N筺 d﹏","Chu Thi謓 Nh﹏","A Th辬h","Chu U蕋 Ly","Th竔 th� ","Ch� l玦 i","Nha d辌h","Nha d辌h","V� binh th祅h m玭","V� s�","Th莥 b鉯","Quan vi猲 tho竔 nhi謒","Ch� t鰑 l莡","Vng C萵","B竎h Hi觰 Sinh","Ti猽 s�","Gi竜 s�","Ti觰 ng","Ti猽 s�"},
								{2131,2132,2133,2134,2135,2136,2137,2138,2139,2140,2141,2142,2143,2144,2145,2146,2147,2148,2149,2150,2151,2153,2155,2156,2157,2158,2159,2160,2161,2162,2163,2164,2165,2166,2167,2168,2169,2170,2171,2172,2173,2174,2175,2176,2177,2178}},
	[350]={"Tng Dng",{"Ch� Ti謒 v� kh�","Ch� Dc 甶誱","Ch� T筽 h鉧","Ch� Ti謒 Nam ph鬰","Ch� Ti謒 N� ph鬰","Ch� Kim ho祅","Th� kh�","Xa phu","B� u","Tr竎 Thi猲 H祅h","Ch� l玦 i","Minh Ch� Kim S琻","Ch﹏ T� Кn","Ch� huy s�","Ch� thng h閕","Th� r蘮 L璾","M筩 Tam","H祅h Cc Thng Nh﹏","S� gi� T祅g Ki誱","Th竔 th�","Ch� t鰑 l莡","Phng Khanh","Vu D莕","T鎛g binh","Trng 秐h","M筩 H鱱 Vi","Ti猽 s�","T� M� T蕁 Nguy猲","H祅 Ngh躠","C� M芻","Thi猲 T骳 Minh","C� L穙 Ta","Ph� Nghi"},
								{2181,2182,2183,2184,2185,2186,2187,2188,2189,2190,2191,2192,2193,2194,2195,2196,2197,2198,2199,2200,2201,2202,2203,2204,2205,2206,2207,2208,2209,2210,2211,2212,2213}},
	[400]={"Чi L�",{"Ch� Ti謒 v� kh�","Ch� Dc 甶誱","Ch� T筽 h鉧","Ch� Ti謒 Nam ph鬰","Ch� Ti謒 N� ph鬰","Ch� Kim ho祅","Th� kh�","Xa phu","Ch� thng h閕","L� quan","Ch� t鰑 l莡","Tr辬h Qu竛 Chi","фng Gi� La","Tr莕 L藀 H祅h","L璾 觧","Cao Th╪g Tuy襫"},
								{2221,2222,2223,2224,2225,2226,2227,2228,2229,2230,2231,2233,2234,2235,2236,2237}}
	};
	
--圣诞树经验 	 11为最终奖励经验
tChrimsExp = {3000,6000,12000,24000,48000,96000,192000,384000,768000,1536000,3072000};

--圣诞树99级获得灵石等级范围 数量 11为不装饰直接给予的灵石 12为99级不装饰直接给予的灵石 13为最终奖励
tChrimsLingshi = {{1,4,1},{1,4,1},{1,4,1},{1,4,1},{1,4,1},{1,4,1},{1,5,1},{1,5,1},{1,5,1},{5,7,1},{1,4,2},{1,4,2},{5,7,2}};

--圣诞外装
tNewCloth = {--男标，男魁，女性感，女娇小
						--外装名，id，概率
	{{"T﹏ Nguy猲 ngo筰 trang",0,109,495,10},{"Tri襲 Hoa ngo筰 trang",0,109,499,1}},
	{{"T﹏ Nguy猲 ngo筰 trang",0,109,496,10},{"Tri襲 Hoa ngo筰 trang",0,109,500,1}},
	{{"T﹏ Nguy猲 ngo筰 trang",0,109,497,10},{"Tri襲 Hoa ngo筰 trang",0,109,501,1}},
	{{"T﹏ Nguy猲 ngo筰 trang",0,109,498,10},{"Tri襲 Hoa ngo筰 trang",0,109,502,1}}	
	}

--风媒任务经验
tWindExp = {100,200,400,800,1600,3200,6400,12800,25600,51200,102400,204800,409600,819200,1638400,3276800};

--青铜鼎合成规则
tTingTong = {--需求物品名 数量 ID 合成后物品名 数量 ID 成功概率
	{"M秐h ng c蕄 2",5,2	,1,3212,"M秐h ng c蕄 1",1,2,1,3211,100},
	{"M秐h ng c蕄 1",5,2,1,3211,"Ph鑙 ki謓 Thanh уng nh c蕄 4",5,2,1,3223,"Thanh уng nh c蕄 4",1,2,1,3216,50},
	{"Thanh уng nh c蕄 4",1,2,1,3216,"Ph鑙 ki謓 Thanh уng nh c蕄 3",5,2,1,3222,"Thanh уng nh c蕄 3",1,2,1,3215,50},
	{"Thanh уng nh c蕄 3",1,2,1,3215,"Ph鑙 ki謓 Thanh уng nh c蕄 2",2,2,1,3221,"Thanh уng nh c蕄 2",1,2,1,3214,30},
	{"Thanh уng nh c蕄 2",1,2,1,3214,"Ph鑙 ki謓 Thanh уng nh c蕄 1",2,2,1,3220," Thanh уng nh c蕄 1",1,2,1,3213,20}
	}

tSanjiAward = {
	{"Nguy謙 Hoa ",2,1,2002},
	{"Thi猲 � Ph� (s� d鬾g c蕄 79 may H� Gi竝 gi韎 h筺 t╪g n c蕄 99)",2,1,3000},
	{"Ch鴆 N� Kinh (s� d鬾g c蕄 79 may n鉵 gi韎 h筺 t╪g n c蕄 99)",2,1,3050},
	{"Luy T� T祄 Kinh (s� d鬾g c蕄 79 may h� y gi韎 h筺 t╪g n c蕄 99)",2,1,3051},
	{" D� T髖 Ch� Kinh (s� d鬾g c蕄 79 ch� t筼 v� kh� ng緉 gi韎 h筺 t╪g n c蕄 99)",2,1,3001},
	{"Can Tng Ch� Kinh (s� d鬾g c蕄 79 ch� t筼 binh kh� d礽 gi韎 h筺 t╪g n c蕄 99)",2,1,3002},
	{"M筩 T� Ch� Kinh (s� d鬾g c蕄 79 ch� t筼 binh kh� k� m玭 gi韎 h筺 t╪g n c蕄 99)",2,1,3003},
	{"V筺 M閏 у (s� d鬾g k� n╪g n g� c蕄 79 gi韎 h筺 t╪g n c蕄 99)",2,1,3007},
	{"V筺 Th� Ph� (s� d鬾g c蕄 79 k� n╪g Thu閏 da gi韎 h筺 t╪g n ca61p)",2,1,3008},
	{"Ng� T祅g S琻 Kinh (s� d鬾g c蕄 79 k� n╪g o kho竛g gi韎 h筺 t╪g n c蕄 99)",2,1,3011},
	{"M� M蓇 T祄 Kinh (s� d鬾g c蕄 79 k� n╪g k衞 t� gi韎 h筺 t╪g n c蕄 99)",2,1,3012}};


tErjiAward = {
	{"Nguy謙 Hoa Chi Tinh",2,1,3219},
	{"Th莕 Quy у Ph� (Y猽 c莡: c蕄 80 v� ch� t筼 binh kh� ng緉)",2,1,3013},
	{" Dng 蕁 у Ph� (Y猽 c莡: c蕄 90 v� ch� t筼 binh kh� ng緉)",2,1,3014},
	{"H鋋 秐h у Ph� (Y猽 c莡: c蕄 80 v� ch� t筼 binh kh� ng緉)",2,1,3015},        
	{"Nha C鰑 у Ph� (Y猽 c莡: c蕄 90 v� ch� t筼 binh kh� ng緉)",2,1,3016},        
	{"Ng鋍 tr� у Ph� (Y猽 c莡: c蕄 80 v� ch� t筼 binh kh� d礽)",2,1,3017},        
	{"Th莕 Ch﹎ у Ph� (Y猽 c莡: c蕄 90 v� ch� t筼 binh kh� d礽)",2,1,3018},        
	{"Khoa Ph� у Ph� (Y猽 c莡: c蕄 80 v� ch� t筼 binh kh� k� m玭)",2,1,3019},      
	{"M閠 V� у Ph� (Y猽 c莡: c蕄 90 v� ch� t筼 binh kh� k� m玭 )",2,1,3020},      
	{"L藆 C秐h у Ph� (Y猽 c莡: c蕄 80 v� ch� t筼 binh kh� ng緉)",2,1,3021},        
	{"Ngh辌h L﹏ у Ph� (Y猽 c莡: c蕄 90 v� ch� t筼 binh kh� ng緉)",2,1,3022},        
	{"Чi Th竛h D�  у Ph� (Y猽 c莡: c蕄 80 v� ch� t筼 binh kh� K� m玭)",2,1,3023},  
	{"Kh� M閏 Long Ng﹎ у Ph� (Y猽 c莡: c蕄 90 v� ch� t筼 v� binh kh� k� m玭)",2,1,3024},  
	{"Toan D� у Ph� (Y猽 c莡: c蕄 80 v� ch� t筼 v� binh kh� k� m玭)",2,1,3025},      
	{"Th竔 H� у Ph� (Y猽 c莡: c蕄 90 v� ch� t筼 v� binh kh� k� m玭)",2,1,3026},      
	{"M鬰 Ki襫 Li猲 Trngу Ph� ( Y猽 c莡: c蕄 80 v� ch� t筼 v� binh kh� d礽)",2,1,3027},    
	{"Dc S� Trng у Ph� (Y猽 c莡: c蕄 90 v� ch� t筼 v� binh kh� d礽)",2,1,3028},      
	{"C鰑 Long To祅 K輈h у Ph� (Y猽 c莡: c蕄 80 v� ch� t筼 v� binh kh� d礽)",2,1,3029},    
	{"Thng N� у Ph� (Y猽 c莡: c蕄 90 v� ch� t筼 v� binh kh� d礽)",2,1,3030},        
	{"Vi猲 б у Ph� (Y猽 c莡: c蕄 80 v� ch� t筼 v� binh kh� k� m玭)",2,1,3031},      
	{"B蕋 X� chi X� у Ph� (Y猽 c莡: c蕄 90 v� ch� t筼 v� binh kh� k� m玭)",2,1,3032},  
	{"V� Ng蕁 у Ph� (Y猽 c莡: c蕄 80 v� ch� t筼 v� binh kh� k� m玭)",2,1,3033},      
	{"Thanh Long у Ph� (Y猽 c莡: c蕄 90 v� ch� t筼 v� binh kh� k� m玭)",2,1,3034},      
	{"B輈h Th駓 у Ph� (Y猽 c莡: c蕄 80 v� ch� t筼 v� binh kh� ng緉)",2,1,3035},        
	{"Thi猲 T玭 у Ph� (Y猽 c莡: c蕄 90 v� ch� t筼 v� binh kh� ng緉)",2,1,3036},        
	{"Qu竛 ph鑙 phng c蕄 8 (Y猽 c莡: c蕄 80 v� k� n╪g may n鉵)",2,1,3044},  
	{"Thng y ph鑙 phng c蕄 8 (Y猽 c莡: c蕄 80 v� k� n╪g may H� Gi竝)",2,1,3045},  
	{"H� y ph鑙 phng c蕄 8 (Y猽 c莡: c蕄 80 v� k� n╪g may h� y)",2,1,3046},  
	{"Qu竛 ph鑙 phng c蕄 9 (Y猽 c莡: c蕄 90 v� k� n╪g may n鉵)",2,1,3047},  
	{"Thng y ph鑙 phng c蕄 9 (Y猽 c莡: c蕄 90 v� k� n╪g may H�)",2,1,3048},  
	{"H� y ph鑙 phng c蕄 9 (Y猽 c莡: c蕄 90 v� k� n╪g may h� y)",2,1,3049}}; 

tTiandi = {
	{{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,85},{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,86},{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,87},{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,88}},
	{{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,85},{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,86},{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,87},{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,88}},
	{{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,85},{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,86},{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,87},{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,88}},
	{[0]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17},{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39},{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43},{"Thi猲 мa Huy襫 Ho祅g Kh� ",0,1,56},{"Thi猲 мa Huy襫 Ho祅g Dao",0,3,67},{"Thi猲 мa Huy襫 Ho祅g C莔",0,10,78},{"Thi猲 мa Huy襫 Ho祅g B髏 ",0,9,89},{"Thi猲 мa Huy襫 Ho祅g Trng",0,8,100},{"Thi猲 мa Huy襫 Ho祅g Thng ",0,6,111},{"Thi猲 мa Huy襫 Ho祅g Cung ",0,4,122},{"Thi猲 мa Huy襫 Ho祅g Tr秓",0,11,15},{"Thi猲 мa Huy襫 Ho祅g Nh蒼 ",0,7,15}},
	 [1]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17},{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43},{"Thi猲 мa Huy襫 Ho祅g Dao",0,3,67},{"Thi猲 мa Huy襫 Ho祅g Trng",0,8,100}},
	 [2]={{"Thi猲 мa Huy襫 Ho祅g Dao",0,3,67},{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43}},
	 [3]={{"Thi猲 мa Huy襫 Ho祅g Trng",0,8,100}},
	 [4]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17}},
	 [5]={{"Thi猲 мa Huy襫 Ho祅g Kh� ",0,1,56}},
	 [6]={{"Thi猲 мa Huy襫 Ho祅g Kh� ",0,1,56}},
	 [7]={{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39},{"Thi猲 мa Huy襫 Ho祅g C莔",0,10,78}},
	 [8]={{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39}},
	 [9]={{"Thi猲 мa Huy襫 Ho祅g C莔",0,10,78}},
	 [10]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17},{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43}},
	 [11]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17}},
	 [12]={{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43}},
	 [13]={{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39},{"Thi猲 мa Huy襫 Ho祅g B髏 ",0,9,89}},
	 [14]={{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39}},
	 [15]={{"Thi猲 мa Huy襫 Ho祅g B髏 ",0,9,89}},
	 [16]={{"Thi猲 мa Huy襫 Ho祅g Thng ",0,6,111},{"Thi猲 мa Huy襫 Ho祅g Cung ",0,4,122}},
	 [17]={{"Thi猲 мa Huy襫 Ho祅g Thng ",0,6,111}},
	 [18]={{"Thi猲 мa Huy襫 Ho祅g Cung ",0,4,122}},
	 [19]={{"Thi猲 мa Huy襫 Ho祅g Tr秓",0,11,15},{"Thi猲 мa Huy襫 Ho祅g Nh蒼 ",0,7,15}},
	 [20]={{"Thi猲 мa Huy襫 Ho祅g Nh蒼 ",0,7,15}},
	 [21]={{"Thi猲 мa Huy襫 Ho祅g Tr秓",0,11,15}}}
	};

function get_chrims_state()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20081222 and nDate <= 20490104 then
		return 1;
	else
	 	return 0;
	end
end

--春节活动标志
function get_spring_festival_state()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20080128 and nDate <= 20480218 then
		return 1;
	else
	 	return 0;
	end	
end

function getwindstate()
	local nState,nActionStep = 0,0;
	local nDate = tonumber(date("%H%M"));
	local tTime = {{900,930},{930,1000},{1000,1030},{1030,1100},{1100,1130},{1130,1200},{1200,1230},{1230,1300},{1300,1330},{1330,1400},{1400,1430},{1430,1500},{1500,1530},{1530,1600},{1600,1630},{1630,1700},{1700,1730},{1730,1800},{1800,1830},{1830,1900},{1900,1930},{1930,2000},{2000,2030},{2030,2100},{2100,2130},{2130,2200},{2200,2230},{2230,2300}};
	for i = 1,getn(tTime) do
		if nDate < tTime[i][2] and nDate >= tTime[i][1] then
			nState = 1;
			local nDay = tonumber(date("%Y%m%d%H"));
			local nNd = floor(nDay/100)*100;
			nActionStep = nNd+i;
			break
		end
	end
	return nState,nActionStep
end

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测
--村长 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"","<color=red>S鴆 l鵦<color> c馻 b筺 kh玭g !")
			return 0
		else 
			return 1
		end
end

--健康经验转换为经验 yanjun
function gf_GoldenExp2Exp(nGoldenExp)
	local nCurrGoldenExp = GetGoldenExp();
	if nCurrGoldenExp < nGoldenExp then
		nGoldenExp = nCurrGoldenExp
	end;
	ModifyGoldenExp(-nGoldenExp);
	ModifyExp(nGoldenExp)
	Msg2Player(nGoldenExp.."甶觤 s鴆 kh醗  i th祅h"..nGoldenExp.." 甶觤 kinh nghi謒");
	return nGoldenExp;
end;

function nothing()

end