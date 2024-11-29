--*************
-- Hat giong --
--*************

--=============================================
--create by baiyun 2009.5.30
--describe:越南版7月份活动头文件
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua");

EVENT_DATE_START = 09061900;
EVENT_DATE_END = {49071924, 49080224, 49113024};
EXT_POINT = 0;

TASK_TREE_INDEX       = 2056;				--记录玩家种的树的NPC索引
TASK_TREE_GROW        = 2057;				--记录树的生成程度
TASK_WATER_TREE_TIME  = 2058;				--记录给树浇水的时间点，刚种下还未浇水时即为种下的时间
TASK_PLANT_TREE_COUNT = 2059;		    --记录玩家当天种树的次数
TASK_PLANT_TREE_DATE  = 2060;				--记录玩家种下树的日期
TASK_PLANT_TREE_TIME  = 2061;				--记录玩家上次种树的时间,(每次种下树后都要更新此值,用来限制两次连继种树)
TASK_PLANT_TREE_TYPE  = 2062;				--种下树的类型 1 - 5

TASK_LAST_USE_DATE = 2063 --上次使用烟花的时间
TASK_TODAY_USE_COUNT = 2064 --今天已经使用的烟花的个数
TASK_LAST_GET_DATE = 2065 --上次领取烟花的时间
TASK_TODAY_GET_COUNT = 2066 --今天已经领取烟花的个数

TASK_GET_FUZHU_DATE = 2067--上次获得辅助效果的日期

TASK_USE_CHANGSHENGPU_EXP = 2068--使用长生普已经获得的经验
TASK_GET_MIBEN_DATE = 2069--玩家上次在师门任务中获得陈旧秘本的日期
TASK_GET_MIBEN_COUNT_TODAY = 2070--玩家今天在师门任务中获得陈旧秘本的数量

TASK_USE_YANHUA_TIME = 2071--使用烟花的时间

TASK_WUHUCANGLONG_GET = 2072--是否领取卧虎藏龙奖励

TASK_YINGXIONG_GET = 2073--争夺英雄之位奖励是否领取过

CONST_USE_YANHUA_INTERVAL = 5 * 60--使用烟花的时间间隔

-- *****************
PLANT_TREE_LIMIT = 24;					--每天种树的最大数量     20101122
-- *****************

PLANT_TREE_INTERVAL = 2 * 60;		--两次连续种树的间隔
PLANT_TREE_ROLE_LEVEL_LIMIT = 10;					--可以种树的角色等级限制
PLANT_TREE_REWARD_ITEM_TIME_LIMIT = 7 * 24 * 60 * 60; --奖励物品的使用期限
PLANT_TREE_REWARD_ITEM_TIME_LIMIT1 = 30 * 24 * 60 * 60;--奖励物品的使用期限二


CONST_MAX_USE_COUNT = 8						--每天最多使用的烟花数量
CONST_MAX_GET_COUNT = 8						--每天最多领取的烟花的数量
CONST_USE_GIVE_EXP = 100000				--使用烟火所给的经验数量
CONST_USE_INTERVAL = 5 * 60				--使用间隔5分钟

CONST_USE_CHANGSHENGPU_EACH_EXP = 125000		--玩家使用长生普每次获得的经验数量
CONST_USE_CHANGSHENGPU_MAX_EXP = 200000000	--玩家使用长生普最多获得的经验上限

CONST_GET_MIBEN_MAX_COUNT = 10--玩家每天在师门任务中最多获得的陈旧秘本的次数

--内功辅助功能,属性字符串，出现概率，要修改的属性值，说明
tb_InBuff = {
					{"T╪g 5% sinh l鵦", 20, {{"state_life_max_percent_add", 5}}},
					{"T╪g 5% n閕 l鵦", 20, {{"state_neili_max_percent_add", 5}}},
					{"T╪g 5% s竧 thng n閕 c玭g", 20, {{"state_m_attack_percent_add", 5}}},
					{"T╪g 5% ph遪g th� n閕 c玭g", 20, {{"state_magic_parmor_per_add", 5}}},
					{"Kh竛g t蕋 c� +20", 10, {{"state_add_dexterity", 20},{"state_add_energy", 20},{"state_add_observe", 20},{"state_add_strength",20},{"state_add_vitality", 20}}},
					{"T╪g s竧 thng n閕 c玭g v� ph遪g th� n閕 c玭g 5%", 10, {{"state_m_attack_percent_add", 5}, {"state_magic_parmor_per_add", 5}}}
};

--外功辅助功能
tb_OutBuff = {
					{"T╪g 5% sinh l鵦", 20, {{"state_life_max_percent_add", 5}}},
					{"T╪g 5% n閕 l鵦", 20, {{"state_neili_max_percent_add", 5}}},
					{"T╪g 5% s竧 thng ngo筰 c玭g", 20, {{"state_p_attack_percent_add", 5}}},
					{"T╪g 5% ph遪g th� ngo筰 c玭g", 20, {{"state_physical_parmor_per_add", 5}}},
					{"Kh竛g t蕋 c� +20", 10, {{"state_add_dexterity", 20},{"state_add_energy", 20},{"state_add_observe", 20},{"state_add_strength",20},{"state_add_vitality", 20}}},
					{"T╪g s竧 thng ngo筰 c玭g v� ph遪g th� ngo筰 c玭g 5%", 10, {{"state_p_attack_percent_add", 5}, {"state_physical_parmor_per_add", 5}}}
};

--特效宝箱奖励列表,随机基数是10000
tb_texiaobaoxiang_aword = {
				{--特效宝箱奖励列表,随机基数是10000,标准男
					{"T祅g Ki誱 Kim 蕁", 1, 0, 102, 40, 1},
					{"T祅g Ki誱 K� Th筩h", 1, 0, 102, 39, 1},
					{"T祅g Ki誱 T� Kim m穙", 1, 0, 103, 95, 1},
					{"T祅g Ki誱 B秓 Ch﹗", 2000, 0, 102, 38, 1},
					{"Kim L� Thng", 2000, 0, 100, 95, 1},
					{"T祅g Ki誱 � kim ph鬰", 2000, 0, 101, 95, 1},
					{"Trng L穙 Ch� Ho祅", 3997, 0, 102, 37, 1}
				},
				
				{--特效宝箱奖励列表,随机基数是10000,槐梧男
					{"T祅g Ki誱 Kim 蕁", 1, 0, 102, 40, 1},
					{"T祅g Ki誱 K� Th筩h", 1, 0, 102, 39, 1},
					{"T祅g Ki誱 T� Kim m穙", 1, 0, 103, 96, 1},
					{"T祅g Ki誱 B秓 Ch﹗", 2000, 0, 102, 38, 1},
					{"Kim L� Thng", 2000, 0, 100, 96, 1},
					{"T祅g Ki誱 � kim ph鬰", 2000, 0, 101, 96, 1},
					{"Trng L穙 Ch� Ho祅", 3997, 0, 102, 37, 1}
				},
				
				{--特效宝箱奖励列表,随机基数是10000,性感女
					{"T祅g Ki誱 Kim 蕁", 1, 0, 102, 40, 1},
					{"T祅g Ki誱 K� Th筩h", 1, 0, 102, 39, 1},
					{"T祅g Ki誱 T� Kim m穙", 1, 0, 103, 97, 1},
					{"T祅g Ki誱 B秓 Ch﹗", 2000, 0, 102, 38, 1},
					{"Kim L� Thng", 2000, 0, 100, 97, 1},
					{"T祅g Ki誱 � kim ph鬰", 2000, 0, 101, 97, 1},
					{"Trng L穙 Ch� Ho祅", 3997, 0, 102, 37, 1}
				},
				
				{--特效宝箱奖励列表,随机基数是10000,娇小女
					{"T祅g Ki誱 Kim 蕁", 1, 0, 102, 40, 1},
					{"T祅g Ki誱 K� Th筩h", 1, 0, 102, 39, 1},
					{"T祅g Ki誱 T� Kim m穙", 1, 0, 103, 98, 1},
					{"T祅g Ki誱 B秓 Ch﹗", 2000, 0, 102, 38, 1},
					{"Kim L� Thng", 2000, 0, 100, 98, 1},
					{"T祅g Ki誱 � kim ph鬰", 2000, 0, 101, 98, 1},
					{"Trng L穙 Ch� Ho祅", 3997, 0, 102, 37, 1}
				},
};

--使用长生普获得的奖励列表，随机基数是1000000000
--物品名，出现概率 / 1000000000 , 大类型，副类型，详细类型，使用期限, 发放数量
tb_changshengpu_aword = {
					{"M秐h Thi猲 th筩h", 17500000, 2, 2, 7, 0, 1},
					{"Thi猲 th筩h", 20000000, 2, 2, 8, 0, 1},
					{"M秐h B╪g th筩h", 20000000, 2, 1, 148, 0, 1},
					{"B╪g th筩h", 20000000, 2, 1, 149, 0, 1},
					{"T祅g Ki誱 anh h飊g thi誴", 15000000, 2, 0, 31, 30 * 24 * 60 * 60, 1},
					{"Th� Th﹏ ph�", 15000000, 2, 0, 556, 30 * 24 * 60 * 60, 1},
					{"Ti猽 Ki誴 t竛", 10000000, 2, 0, 141, 30 * 24 * 60 * 60, 1},
					{"T葃 T駓 n", 4688, 2, 0, 136, 30 * 24 * 60 * 60, 1},
					{"Thi猲 H� M藅 t辌h", 750000, 0, 107, 64, 0, 1},
					{"T� H� M藅 t辌h", 750000, 0, 107, 65, 0, 1},
					{"Chi猰 Y Ph�", 375000, 0, 107, 66, 0, 1},
					{"B秓 rng T祅g Ki誱 u qu竛", 20000, 2, 1, 1059, 7 * 24 * 60 * 60, 1},
					{"B秓 rng T祅g Ki誱 y gi竝", 20000, 2, 1, 1060, 7 * 24 * 60 * 60, 1},
					{"B秓 rng T祅g Ki誱 hoa kh�", 20000, 2, 1, 1061, 7 * 24 * 60 * 60, 1},
					{"B秓 rng T祅g Ki誱 trang s鴆", 10000, 2, 1, 1062, 7 * 24 * 60 * 60, 1},
					{"B秓 rng T祅g Ki誱 v� kh�", 10000, 2, 1, 1063, 7 * 24 * 60 * 60, 1},
					{"Phong thng l謓h_Li猽(Ti猲 Phong)", 20000, 2, 1, 9985, 7 * 24 * 60 * 60, 1},
					{"Phong thng l謓h_T鑞g(Ti猲 Phong)", 20000, 2, 1, 9986, 7 * 24 * 60 * 60, 1},
					{"Rng B� K輕", 416667, 2, 1, 30093, 30 * 24 * 60 * 60, 1},
					{"B秐 v� c t筼 th莕 kh�", 304688, 2, 1, 1086, 0, 1},
					{"B秓 Rng c Bi謙", 4688, 2, 1, 30091, 30 * 24 * 60 * 60, 1},
					{"уng Ti襫 V祅g", 20000000, 2, 1, 30094, 0, 1},
					{"L� th駓", 630004688, 2, 0, 351, 0, 1},
					{"Tranh S綾 Y猲 Hoa", 69769583, 2, 1, 189, 0, 1},
					{"Lam S綾 Y猲 Hoa", 80000000, 2, 1, 190, 0, 1},
					{"鑞g B玭g Gi蕐", 80000000, 2, 1, 30092, 30 * 24 * 60 * 60, 1},
};

--使用秘籍箱获得的奖励列表，随机基数是1000
tb_mijixiang_aword={
				{"Kim Cang Ph鬰 Ma kinh", 40, 0, 107, 1, 1},
				{"Ti襪 Long M藅 t辌h", 40, 0, 107, 3, 1},
				{"V� Tr莕 M藅 t辌h", 35, 0, 107, 5, 1},
				{"Thi猲 La M藅 T辌h", 35, 0, 107, 7, 1},
				{"Nh� � M藅 T辌h", 35, 0, 107, 9, 1},
				{"B輈h H秈 Ph�", 35, 0, 107, 11, 1},
				{"H鏽 чn M藅 t辌h", 35, 0, 107, 13, 1},
				{"Qu� Thi猲 M藅 t辌h", 35, 0, 107, 15, 1},
				{"Huy襫 秐h M藅 t辌h", 35, 0, 107, 17, 1},
				{"Qu﹏ T� M藅 t辌h", 35, 0, 107, 19, 1},
				{"Tr蕁 Qu﹏ M藅 t辌h", 35, 0, 107, 21, 1},
				{"Xuy猲 V﹏ M藅 t辌h", 35, 0, 107, 23, 1},
				{"U Minh Qu� L鬰", 35, 0, 107, 25, 1},
				{"Linh C� M藅 t辌h", 35, 0, 107, 27, 1},
				{"Kim Cang Ph鬰 Ma T﹎ Ph竝", 40, 0, 107, 2, 1},
				{"Ti襪 Long T﹎ Ph竝", 40, 0, 107, 4, 1},
				{"V� Tr莕 T﹎ Ph竝", 35, 0, 107, 6, 1},
				{"Thi猲 La T﹎ Ph竝", 35, 0, 107, 8, 1},
				{"Nh� � T﹎ Ph竝", 35, 0, 107, 10, 1},
				{"B輈h H秈 T﹎ Ph竝", 35, 0, 107, 12, 1},
				{"H鏽 чn T﹎ Ph竝", 35, 0, 107, 14, 1},
				{"Qu� Thi猲 T﹎ Ph竝", 35, 0, 107, 16, 1},
				{"Huy襫 秐h T﹎ Ph竝", 35, 0, 107, 18, 1},
				{"Qu﹏ T� T﹎ Ph竝", 35, 0, 107, 20, 1},
				{"Tr蕁 Qu﹏ T﹎ Ph竝", 35, 0, 107, 22, 1},
				{"Xuy猲 V﹏ T﹎ Ph竝", 35, 0, 107, 24, 1},
				{"U Minh T﹎ Ph竝", 35, 0, 107, 26, 1},
				{"Linh C� T﹎ Ph竝", 35, 0, 107, 28, 1}
};

--使用胖兔子宝箱获得的奖励列表，随机基数是1000000
--物品名，概率，添加参数，存在时间, 物品类型,1普通物品，2金子
tb_pangtuzi_aword = {
				{"T� Kim H錸g Bao", 1160, {2, 1, 536, 1}, 7 * 24 * 60 * 60, 1},
				{"Чi h錸g bao ho祅g kim", 580, {2, 1, 538, 1}, 7 * 24 * 60 * 60, 1},
				{"B秓 rng T祅g Ki誱 u qu竛", 1740, {2, 1, 1059, 1}, 7 * 24 * 60 * 60, 1},
				{"B秓 rng T祅g Ki誱 y gi竝", 2310, {2, 1, 1060, 1}, 7 * 24 * 60 * 60, 1},
				{"B秓 rng T祅g Ki誱 hoa kh�", 1740, {2, 1, 1061, 1}, 7 * 24 * 60 * 60, 1},
				{"B秓 rng T祅g Ki誱 trang s鴆", 1160, {2, 1, 1062, 1}, 7 * 24 * 60 * 60, 1},
				{"B秓 rng T祅g Ki誱 v� kh�", 1740, {2, 1, 1063, 1}, 7 * 24 * 60 * 60, 1},
				{"1 v祅g", 848580, 1, 0, 2},
				{"100 v祅g", 1000, 100, 0, 2},
				{"1000 v祅g", 1, 1000, 0, 2},
				{"B� Ph� C� N竧", 10000, {2, 1, 30088, 50}, 0, 1},
				{"M秐h Thi猲 th筩h", 3000, {2, 2, 7, 1}, 0, 1},
				{"Thi猲 th筩h", 1000, {2, 2, 8, 1}, 0, 1}
};

--师门任务中角色获得陈旧秘本数量
--角色等级，每次获得陈旧秘本的数量
tb_shimen_aword = {
					{1, 0},
					{2, 0},
					{3, 0},
					{4, 0},
					{5, 30},
					{6, 40},
					{7, 50},
					{8, 60},
					{9, 80},
		};

--夜草NPC处兑换的奖励,名字、添加参数、需金铜钱数量、存在期限
tb_yecao_aword = {
					{"Чi B筩h C﹗ ho祅", {2, 1, 1007, 1}, 1, 30 * 24 * 60 * 60},
					{"Cng Tam Thanh ho祅", {2, 1, 1098, 1}, 1, 30 * 24 * 60 * 60},
					{"Cng L鬰 Th莕 ho祅", {2, 1, 1065, 1}, 1, 30 * 24 * 60 * 60},
					{"C鰑 chuy觧 h錳 h錸 n", {1, 0, 32, 1}, 1, 30 * 24 * 60 * 60},
					{"Thi猲 Hng C萴 T鬰-t骾 nh�", {2, 1, 1031, 1}, 1, 30 * 24 * 60 * 60},
					{"Nh蕋 Nguy猲 Ph鬰 Th駓 Кn (ti觰)", {2, 1, 1033, 1}, 1, 30 * 24 * 60 * 60},
					{"Ng� Hoa Ng鋍 L� ho祅-t骾 nh�", {2, 1, 1035, 1}, 1, 30 * 24 * 60 * 60},
					{"B錸g Lai Ti猲 Кn", {2, 1, 1013, 1}, 2, 30 * 24 * 60 * 60},
					{"V筺 V藅 Quy Nguy猲 Кn (ti觰)", {2, 1, 495, 1}, 2, 30 * 24 * 60 * 60},
					{"Ti觰 Th莕 Th玭g Ph�", {2, 1, 497, 1}, 2, 0},
					{"Ti觰 Ni猲 Th� Th莕 Ph�", {2, 1, 498, 1}, 3, 0},
					{"H綾 Ng鋍 筺 T鬰 Cao (ti觰)", {2, 1, 489, 1}, 3, 30 * 24 * 60 * 60},
					{"B筩h C﹗ Ti猲 n", {2, 1, 1008, 1}, 4, 30 * 24 * 60 * 60},
					{"Tam Thanh Ti猲 n", {2, 1, 1099, 1}, 4, 30 * 24 * 60 * 60},
					{"L鬰 Th莕 Ti猲 n", {2, 1, 1066, 1}, 4, 30 * 24 * 60 * 60},
					{"Sinh Sinh H鉧 T竛 (ti觰)", {2, 1, 483, 1}, 4, 30 * 24 * 60 * 60},
					{"L鬰 L﹎ Lang Y猲", {2, 1, 1014, 1}, 5, 30 * 24 * 60 * 60},
					{"Th駓 Ho祅g B� Chi誹", {2, 1, 1047, 1}, 5, 30 * 24 * 60 * 60},
					{"Uy猲 Μng Kim Ti B筩", {2, 1, 1048, 1}, 7, 30 * 24 * 60 * 60},
					{"S� tay s鑞g", {2, 19, 1, 1}, 20, 30 * 24 * 60 * 60},
					{"Th莕 h祅h b秓 甶觧", {0, 200, 40, 1}, 25, 30 * 24 * 60 * 60},
					{"Qu﹏ C玭g Huy Ho祅g", {2, 1, 9977, 1}, 50, 30 * 24 * 60 * 60},
					{"T葃 T駓 linh n", {2, 0, 137, 1}, 80, 30 * 24 * 60 * 60},
					{"B竧 B秓 T葃 T駓 Ti猲 Кn", {2, 0, 138, 1}, 100, 30 * 24 * 60 * 60},
					{"Phi猽 V�", {0, 105, 15, 1, 1, -1, -1, -1, -1, -1, -1}, 250, 30 * 24 * 60 * 60}
};

--争夺英雄之位奖励,标准男-槐梧男-性感女-娇小女
tb_yingxiong_aword = {
				{{"Vi猰 д kh玦",0,103,8001},{"Vi猰 д kh玦",0,103,8002},{"Vi猰 д kh玦",0,103,8003},{"Vi猰 д kh玦",0,103,8004}},
				{{"Vi猰 д gi竝",0,100,8001},{"Vi猰 д gi竝",0,100,8002},{"Vi猰 д gi竝",0,100,8003},{"Vi猰 д gi竝",0,100,8004}},
				{{"Vi猰 д trang",0,101,8001},{"Vi猰 д trang",0,101,8002},{"Vi猰 д trang",0,101,8003},{"Vi猰 д trang",0,101,8004}}
};

--卧虎藏龙奖励，等级-需要声望-师门贡献度-军功
tb_wohucanglong_aword = {
				[73] = {0, 0, 0},
				[74] = {0, 0, 0},
				[75] = {6000, 6000, 15000},
				[76] = {6000, 6000, 50000},
				[77] = {7000, 7000, 50000},
				[78] = {7000, 7000, 50000},
				[79] = {8000, 8000, 60000},
				[80] = {8000, 8000, 60000},
				[81] = {9000, 9000, 70000},
				[82] = {9000, 9000, 70000},
				[83] = {10000, 10000, 80000},
				[84] = {10000, 10000, 80000}
};
--卧虎藏龙物品奖励：物品名，添加参数,这个奖励对只奖励一个物品而且不分体形和流派的
tb_wohucanglong_item_aword = {
				[73] = {"Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}},
				[76] = {"T骾 H祅h Trang", {2, 1, 30072, 1}},
				[77] = {"Rng B� K輕", {2, 1, 30093, 1}},
				[80] = {"T骾 H祅h Trang", {2, 1, 30072, 1}},
				[84] = {"Thi猲 Th筩h linh th筩h", {2, 1, 1068, 1}}
};
--卧虎藏龙74级奖励
tb_wohucanglong_item_aword_74 = {
				{"Trang Ch� m穙", {0, 103, 91, 1,1,-1,-1,-1,-1,-1,-1}},
				{"Trang Ch� m穙", {0, 103, 92, 1,1,-1,-1,-1,-1,-1,-1}},
				{"Trang Ch� m穙", {0, 103, 93, 1,1,-1,-1,-1,-1,-1,-1}},
				{"Trang Ch� m穙", {0, 103, 94, 1,1,-1,-1,-1,-1,-1,-1}}
};
--卧虎藏龙75级奖励
tb_wohucanglong_item_aword_75 = {
	[2] = {{"Chi課 � kh秈 gi竝", {0, 100, 221, 1,1,-1,-1,-1,-1,-1,-1}}, {"Chi課 � kh秈 gi竝", {0, 100, 222, 1,1,-1,-1,-1,-1,-1,-1}}},
	[3] = {{"Thi襫 T辬h b祇", {0, 100, 321, 1,1,-1,-1,-1,-1,-1,-1}}, {"Thi襫 T辬h b祇", {0, 100, 322, 1,1,-1,-1,-1,-1,-1,-1}}},
	[4] = {{"u Kh� Chi課 y", {0, 100, 421, 1,1,-1,-1,-1,-1,-1,-1}}, {"u Kh� Chi課 y", {0, 100, 422, 1,1,-1,-1,-1,-1,-1,-1}}},
	[6] = {{"B� чc y", {0, 100, 621, 1,1,-1,-1,-1,-1,-1,-1}}, {"B� чc y", {0, 100, 622, 1,1,-1,-1,-1,-1,-1,-1}}, {"B� чc y", {0, 100, 623, 1,1,-1,-1,-1,-1,-1,-1}}, {"B� чc y", {0, 100, 624, 1,1,-1,-1,-1,-1,-1,-1}}},
	[8] = {{}, {}, {"Ph竝 V﹏ y", {0, 100, 821, 1,1,-1,-1,-1,-1,-1,-1}}, {"Ph竝 V﹏ y", {0, 100, 822, 1,1,-1,-1,-1,-1,-1,-1}}},
	[9] = {{}, {}, {"Ph竝  y", {0, 100, 921, 1,1,-1,-1,-1,-1,-1,-1}}, {"Ph竝  y", {0, 100, 922, 1,1,-1,-1,-1,-1,-1,-1}}},
	[11] = {{"T� H秈 y", {0, 100, 1121, 1,1,-1,-1,-1,-1,-1,-1}}, {"T� H秈 y", {0, 100, 1122, 1,1,-1,-1,-1,-1,-1,-1}}, {"T� H秈 y", {0, 100, 1123, 1,1,-1,-1,-1,-1,-1,-1}}, {"T� H秈 y", {0, 100, 1124, 1,1,-1,-1,-1,-1,-1,-1}}},
	[12] = {{"T� Ngh躠 Thng", {0, 100, 1221, 1,1,-1,-1,-1,-1,-1,-1}}, {"T� Ngh躠 Thng", {0, 100, 1222, 1,1,-1,-1,-1,-1,-1,-1}}, {"T� Ngh躠 Thng", {0, 100, 1223, 1,1,-1,-1,-1,-1,-1,-1}}, {"T� Ngh躠 Thng", {0, 100, 1224, 1,1,-1,-1,-1,-1,-1,-1}}},
	[14] = {{"T� Tng ph竝 b祇", {0, 100, 1421, 1,1,-1,-1,-1,-1,-1,-1}}, {"T� Tng ph竝 b祇", {0, 100, 1422, 1,1,-1,-1,-1,-1,-1,-1}}, {"T� Tng ph竝 b祇", {0, 100, 1423, 1,1,-1,-1,-1,-1,-1,-1}}, {"T� Tng ph竝 b祇", {0, 100, 1424, 1,1,-1,-1,-1,-1,-1,-1}}},
	[15] = {{"Linh Phong ph鬰", {0, 100, 1521, 1,1,-1,-1,-1,-1,-1,-1}}, {"Linh Phong ph鬰", {0, 100, 1522, 1,1,-1,-1,-1,-1,-1,-1}}, {"Linh Phong ph鬰", {0, 100, 1523, 1,1,-1,-1,-1,-1,-1,-1}}, {"Linh Phong ph鬰", {0, 100, 1524, 1,1,-1,-1,-1,-1,-1,-1}}},
	[17] = {{"Tinh Kh秈 gi竝", {0, 100, 1721, 1,1,-1,-1,-1,-1,-1,-1}}, {"Tinh Kh秈 gi竝", {0, 100, 1722, 1,1,-1,-1,-1,-1,-1,-1}}, {"Tinh Kh秈 gi竝", {0, 100, 1723, 1,1,-1,-1,-1,-1,-1,-1}}, {"Tinh Kh秈 gi竝", {0, 100, 1724, 1,1,-1,-1,-1,-1,-1,-1}}},
	[18] = {{"Ph蕁 Uy Tng Qu﹏ kh秈 gi竝", {0, 100, 1821, 1,1,-1,-1,-1,-1,-1,-1}}, {"Ph蕁 Uy Tng Qu﹏ kh秈 gi竝", {0, 100, 1822, 1,1,-1,-1,-1,-1,-1,-1}}, {"Ph蕁 Uy Tng Qu﹏ kh秈 gi竝", {0, 100, 1823, 1,1,-1,-1,-1,-1,-1,-1}}, {"Ph蕁 Uy Tng Qu﹏ kh秈 gi竝", {0, 100, 1824, 1,1,-1,-1,-1,-1,-1,-1}}},
	[20] = {{"H綾 V� Thng M穘h чc y", {0, 100, 2021, 1,1,-1,-1,-1,-1,-1,-1}}, {"H綾 V� Thng M穘h чc y", {0, 100, 2022, 1,1,-1,-1,-1,-1,-1,-1}}, {"H綾 V� Thng M穘h чc y", {0, 100, 2023, 1,1,-1,-1,-1,-1,-1,-1}}, {"H綾 V� Thng M穘h чc y", {0, 100, 2024, 1,1,-1,-1,-1,-1,-1,-1}}},
	[21] = {{"B筩h V� Thng Ng魕 чc Y", {0, 100, 2121, 1,1,-1,-1,-1,-1,-1,-1}}, {"B筩h V� Thng Ng魕 чc Y", {0, 100, 2122, 1,1,-1,-1,-1,-1,-1,-1}}, {"B筩h V� Thng Ng魕 чc Y", {0, 100, 2123, 1,1,-1,-1,-1,-1,-1,-1}}, {"B筩h V� Thng Ng魕 чc Y", {0, 100, 2124, 1,1,-1,-1,-1,-1,-1,-1}}}
};

--卧虎藏龙78级奖励
tb_wohucanglong_item_aword_78 = {
	[2] = {"T骾 b� ki誴 Thi誹 L﹎", {2, 0, 607, 1}},
	[3] = {"T骾 b� ki誴 Thi誹 L﹎", {2, 0, 607, 1}},
	[4] = {"T骾 b� ki誴 Thi誹 L﹎", {2, 0, 607, 1}},
	[6] = {"T骾 b� ki誴 Л阯g M玭", {2, 0, 608, 1}},
	[8] = {"T骾 b� ki誴 Nga My", {2, 0, 609, 1}},
	[9] = {"T骾 b� ki誴 Nga My", {2, 0, 609, 1}},
	[11] = {"T骾 b� ki誴 C竔 Bang", {2, 0, 610, 1}},
	[12] = {"T骾 b� ki誴 C竔 Bang", {2, 0, 610, 1}},
	[14] = {"T骾 b� ki誴 V� ng", {2, 0, 611, 1}},
	[15] = {"T骾 b� ki誴 V� ng", {2, 0, 611, 1}},
	[17] = {"T骾 b� ki誴 Dng M玭", {2, 0, 612, 1}},
	[18] = {"T骾 b� ki誴 Dng M玭", {2, 0, 612, 1}},
	[20] = {"T骾 b� ki誴 Ng� чc", {2, 0, 613, 1}},
	[21] = {"T骾 b� ki誴 Ng� чc", {2, 0, 613, 1}}
};

--卧虎藏龙79级奖励
tb_wohucanglong_item_aword_79 = {
	{"Th竔 H� Huy詎 Ng鋍 (s鴆 m筺h)", 15, {0, 102, 29, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"Th竔 H� Huy詎 Цi (th﹏ ph竝)", 15, {0, 102, 30, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"Th竔 H� Huy詎 Ho祅 (g﹏ c鑤)", 14, {0, 102, 31, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"Th竔 H� Huy詎 B閕 (n閕 c玭g)", 14, {0, 102, 32, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"Th竔 H� Huy詎 Gi韎 (Linh ho箃)", 14, {0, 102, 33, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"Th竔 H� Huy詎 Чi (c)", 14, {0, 102, 34, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"Th竔 H� Huy詎 Th筩h (s竧 thng)", 14, {0, 102, 35, 1, 1, -1, -1, -1, -1, -1, -1}}
};

--卧虎藏龙81级奖励
tb_wohucanglong_item_aword_81 = {
	{"T祅g Ki誱 � kim ph鬰", {0, 101, 95, 1,1,-1,-1,-1,-1,-1,-1}},
	{"T祅g Ki誱 � kim ph鬰", {0, 101, 96, 1,1,-1,-1,-1,-1,-1,-1}},
	{"T祅g Ki誱 � kim ph鬰", {0, 101, 97, 1,1,-1,-1,-1,-1,-1,-1}},
	{"T祅g Ki誱 � kim ph鬰", {0, 101, 98, 1,1,-1,-1,-1,-1,-1,-1}}
};

--卧虎藏龙82级奖励
tb_wohucanglong_item_aword_82_1 = {
				{"D辌h C﹏ Kinh-thng", {2, 1, 916, 1}},
				{"Nh� Lai Th莕 Chng-thng", {2, 1, 919, 1}},
				{"T葃 T駓 Kinh-thng", {2, 1, 922, 1}},
				{"H蕄 Tinh Tr薾-thng", {2, 1, 925, 1}},
				{"V筺 Tng Th莕 C玭g-thng", {2, 1, 928, 1}},
				{"Thi猲  Tr蕁 H錸 Kh骳-thng", {2, 1, 931, 1}},
				{"Gi竛g Long Th藀 B竧 Chng-thng", {2, 1, 934, 1}},
				{"Ф C萿 C玭 Tr薾-thng", {2, 1, 937, 1}},
				{"V� Thng Th竔 C鵦 Ki誱-thng", {2, 1, 940, 1}},
				{"Th竔 C鵦 Th莕 C玭g-thng", {2, 1, 943, 1}},
				{"Li猲 Ho祅 To祅 Long Thng-thng", {2, 1, 946, 1}},
				{"B� Vng Tng Ph鬾g Ti詎-thng", {2, 1, 949, 1}},
				{"V� 秐h Ma C�-thng", {2, 1, 952, 1}},
				{"V� Thi猲 Ma C玭g-thng", {2, 1, 955, 1}}
	
};

tb_wohucanglong_item_aword_82_2 = {
				{"D辌h C﹏ Kinh-trung", {2, 1, 917, 1}},
				{"Nh� Lai Th莕 Chng-trung", {2, 1, 920, 1}},
				{"T葃 T駓 Kinh-trung", {2, 1, 923, 1}},
				{"H蕄 Tinh Tr薾-trung", {2, 1, 926, 1}},
				{"V筺 Tng Th莕 C玭g-trung", {2, 1, 929, 1}},
				{"Thi猲  Tr蕁 H錸 Kh骳-trung", {2, 1, 932, 1}},
				{"Gi竛g Long Th藀 B竧 Chng-trung", {2, 1, 935, 1}},
				{"Ф C萿 C玭 Tr薾-trung", {2, 1, 938, 1}},
				{"V� Thng Th竔 C鵦 Ki誱-trung", {2, 1, 941, 1}},
				{"Th竔 C鵦 Th莕 C玭g-trung", {2, 1, 944, 1}},
				{"Li猲 Ho祅 To祅 Long Thng-trung", {2, 1, 947, 1}},
				{"B� Vng Tng Ph鬾g Ti詎-trung", {2, 1, 950, 1}},
				{"V� 秐h Ma C�-trung", {2, 1, 953, 1}},
				{"V� Thi猲 Ma C玭g-trung", {2, 1, 956, 1}}
};

tb_wohucanglong_item_aword_82_3 = {
				{"D辌h C﹏ Kinh-h� ", {2, 1, 918, 1}},
				{"Nh� Lai Th莕 Chng-h� ", {2, 1, 921, 1}},
				{"T葃 T駓 Kinh-h� ", {2, 1, 924, 1}},
				{"H蕄 Tinh Tr薾-h� ", {2, 1, 927, 1}},
				{"V筺 Tng Th莕 C玭g-h� ", {2, 1, 930, 1}},
				{"Thi猲  Tr蕁 H錸 Kh骳-h� ", {2, 1, 933, 1}},
				{"Gi竛g Long Th藀 B竧 Chng-h� ", {2, 1, 936, 1}},
				{"Ф C萿 C玭 Tr薾-h� ", {2, 1, 939, 1}},
				{"V� Thng Th竔 C鵦 Ki誱-h� ", {2, 1, 942, 1}},
				{"Th竔 C鵦 Th莕 C玭g-h� ", {2, 1, 945, 1}},
				{"Li猲 Ho祅 To祅 Long Thng-h� ", {2, 1, 948, 1}},
				{"B� Vng Tng Ph鬾g Ti詎-h� ", {2, 1, 951, 1}},
				{"V� 秐h Ma C�-h� ", {2, 1, 954, 1}},
				{"V� Thi猲 Ma C玭g-h� ", {2, 1, 957, 1}}
};

--卧虎藏龙83级奖励
tb_wohucanglong_item_aword_83 = {
	[2]  = {"Ph� Y猲 產o", {0, 3, 6001, 1,1,-1,-1,-1,-1,-1,-1}},
	[3]  = {"Ph� Y猲 trng",{0,8,6003, 1,1,-1,-1,-1,-1,-1,-1}},
	[4]  = {"H祄 Y猲 th�",{0,0,6004, 1,1,-1,-1,-1,-1,-1,-1}},
	[6]  = {"T祅g Y猲 ch﹎",{0,1,6005, 1,1,-1,-1,-1,-1,-1,-1}},
	[8]  = {"Phi Y猲 ki誱",{0,2,6006, 1,1,-1,-1,-1,-1,-1,-1}},
	[9]  = {"V薾 Y猲 c莔",{0,10,6007, 1,1,-1,-1,-1,-1,-1,-1}},
	[11] = {"V﹏ Y猲 th�",{0,0,6008, 1,1,-1,-1,-1,-1,-1,-1}},
	[12] = {"L璾 Y猲 c玭",{0,5,6009, 1,1,-1,-1,-1,-1,-1,-1}},
	[14] = {"Huy襫 Y猲 ki誱",{0,2,6010, 1,1,-1,-1,-1,-1,-1,-1}},
	[15] = {"V� Y猲 b髏",{0,9,6011, 1,1,-1,-1,-1,-1,-1,-1}},
	[17] = {"H� Ti猰 Thng",{0,6,6012, 1,1,-1,-1,-1,-1,-1,-1}},
	[18] = {"H祅h Y猲 Cung",{0,4,6013, 1,1,-1,-1,-1,-1,-1,-1}},
	[20] = {"Tr鋍 Y猲 nh蒼",{0,7,6014, 1,1,-1,-1,-1,-1,-1,-1}},
	[21] = {"Y猽 Y猲 tr秓",{0,11,6015, 1,1,-1,-1,-1,-1,-1,-1}},
};

--10 陈旧秘本 + 1 复原术合成长生普
function GetChangshengpu()
	if GetItemCount(2, 1, 30088) < 10 or GetItemCount(2, 1, 30089) == 0 then
		Talk(1, "", "Nguy猲 li謚 tr猲 h祅h trang kh玭g  i 1 Trng Sinh Ph�, hay l� qu猲 t筰 h適  r錳?");
		return
	end
	if gf_Judge_Room_Weight(1, 10, " ") == 0 then
		return
	end
	if DelItem(2, 1, 30088, 10) == 1 and DelItem(2, 1, 30089, 1) == 1 then
		gf_SetLogCaption("Truy t譵 trng sinh ph�");
		gf_AddItemEx({2, 1, 30090, 1}, "Trng Sinh Ph� ");
		gf_SetLogCaption("");
	end
end

function VerifyDate(nType)
	local nCurDate = tonumber(date("%y%m%d%H"))
	local nRet = 0		
	if EVENT_DATE_START <= nCurDate and nCurDate <= EVENT_DATE_END[nType] then
		nRet = 1
	end	
	return nRet
end

