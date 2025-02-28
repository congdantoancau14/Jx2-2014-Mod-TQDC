--=============================================
--create by baiyun 2009.10.13
--describe:越南版11月份活动 头文件
--=============================================
Include("\\script\\lib\\globalfunctions.lua");

VIET_0911_TASK_SHANGXIAN_AWORD = 2100;	--每天领取上线奖励的日期
VIET_0911_TASK_JUHUACHA_COUNT = 2075;		--使用菊花茶的次数
VIET_0911_TASK_ZHENZHU_COUNT = 2076;		--使用珍珠的次数
VIET_0911_TASK_ZHANGMEN_DATE = 2077;		--给掌门送东西的日期
VIET_0911_TASK_ZHANGMEN_COUNT = 2078;		--已经给掌门送东西的次数
VIET_0911_TASK_ZHANGMEN_TIME = 2079;		--给掌门送东西的时间，时间戳GetTime()
VIET_0911_TASK_SHIMENG_DATE = 2080;			--师门任务得到菊花的日期
VIET_0911_TASK_SHIMENG_NUM = 2089;			--师门任务得到菊花的数量
VIET_0911_TASK_YANHUO_DATE = 2098;			--使用烟火的日期
VIET_0911_TASK_YANHUO_NUM = 2099;				--今天已经使用烟火的次数
VIET_0911_TASK_LAST_USE_TIME = 2116;		--上次使用烟火的时间GetTime()
VIET_0911_TASK_TONG_AWARD_DATE = 2189;	--领取帮会冲奖的日期(%Y%W)

VIET_0911_JUHUACHA_MAX_COUNT = 2400;		--最大使用菊花茶的次数
VIET_0911_ZHENZHU_MAX_COUNT = 100;			--最大使用珍珠的次数
VIET_0911_YANHUO_MAX_COUNT = 16;				--每天最多使用的烟火的个数

VIET_0911_LOG_TITLE = "Hoat dong thang 11"

--上线奖励
tbVIET_0911_SHANGXIAN_AWORD = {
	{3000, 3999, 200000},
	{4000, 4999, 300000},
	{5000, 5999, 400000},
	{6000, 6999, 500000},
	{7000, 7999, 600000},
	{8000, 8999, 700000},
	{9000, 9999, 800000},
	{10000, 10999, 900000},
	{11000, 14999, 1000000},
	{15000, 19999, 1100000},
	{20000, 24999, 1200000},
	{25000, 0, 1300000},
};
--上线奖励给的菊花数量
tbVIET_0911_SHANGXIAN_AWARD2 = {
	[1] = 30,
	[2] = 30,
	[3] = 30,
	[4] = 40,
	[5] = 40,
	[6] = 40,
	[7] = 40,
	[8] = 50,
	[9] = 50,
	[10] = 50,
	[11] = 50,
	[12] = 50,
};

--通过师门任务获得的菊花的数量
tVIET_0911_SHIMEN_JUHUA = {
	[1] = 15,
	[2] = 15,
	[3] = 15,
	[4] = 20,
	[5] = 20,
	[6] = 20,
	[7] = 30,
	[8] = 30,
	[9] = 30,
};

--玉兔箱奖励
tbVIET_0911_YUTUXIANG = {
	{"M秐h Thi猲 th筩h", 10, {2, 2, 7, 1}, 0},
	{"Thi猲 th筩h", 10, {2, 2, 8, 1}, 0},
	{"Ti猽 Ki誴 t竛", 10, {2, 0, 141, 1}, 7 * 24 * 3600},
	{"u h錸", 4, {2, 1, 1157, 1}, 7 * 24 * 3600},
	{"Money", 37, 10000},
	{"Rep", 12, 1},
	{nil, 12},
	{"Exp", 5, 20000}
};

tbVIET_0911_JUHUACHA_AWARD = {
	{"M秐h Thi猲 th筩h", 60000, {2, 2, 7, 1}, 0},
	{"Thi猲 th筩h", 60000, {2, 2, 8, 1}, 0},
	{"M秐h B╪g th筩h", 20000, {2, 1, 148, 1},  0},
	{"B╪g th筩h", 30000, {2, 1, 149, 1}, 0},
	{"T葃 T駓 linh n", 100, {2, 0, 137, 1}, 15 * 24 * 3600},
	{"уng Ti襫 V祅g", 5000, {2, 1, 30094, 1}, 0},
	{"Tu Ch﹏ Y誹 Quy誸", 70000, {2, 0, 554, 1}, 15 * 24 * 3600},
	{"Rng B� K輕", 1000, {2, 1, 30093, 1}, 30 * 24 * 3600},
	{"u h錸", 10000, {2, 1, 1157, 1}, 15 * 24 * 3600},
	{"Th莕 N玭g Кn", 14000, {2, 1, 343, 1}, 15 * 24 * 3600},
	{"V╪ C萴 H筽", 500, {2, 1, 1100, 1}, 15 * 24 * 3600},
	{"Qu﹏ C玭g Chng", 5000, {2, 1, 9999, 1}, 15 * 24 * 3600},
	{"Th竔 H�  M藅 Qu� ", 5000, {2, 1, 387, 1}, 15 * 24 * 3600},
	{"S� m玭 t譶h nguy謓 th�", 5000, {2, 1, 1019, 1}, 15 * 24 * 3600},
	{"S� m玭 l謓h th�", 5000, {2, 1, 1016, 1}, 15 * 24 * 3600},
--	{"鑞g B玭g Gi蕐", 140999, {2, 1, 30092, 1}, 0},
	{"B秓 Rng c Bi謙", 1, {2, 1, 30091, 1}, 30 * 24 * 3600},
	{"Rng Tr蕁 Ph竔", 1000, {2, 1, 30113, 1}, 30 * 24 * 3600},
	{nil, 320000},
	{nil, 347399},
	{"Ti猽 Ki誴 t竛", 10000, {2, 0, 141, 1}, 15 * 24 * 3600},
--	{"Ng鋍 Trai", 83300, {2, 1, 30122, 1}, 15 * 24 * 3600},
	{"T� Linh Thi猲 � Ph�", 3000, {0, 107, 160, 1}, 0},
	{"T� Linh T� � Ph�", 3000, {0, 107, 161, 1}, 0},
	{"T� Linh Chi課 � Ph�", 3000, {0, 107, 159, 1}, 0},
	{"B祅 Long B輈h", 2000, {2, 1, 1000, 1}, 15 * 24 * 3600},
	{"Ti觰 nh﹏ s﹎ qu�", 20000, {2, 0, 552, 1}, 15 * 24 * 3600},
};

tbVIET_0911_JUHUACHA_AWARD_2 = {
	{"Tu Ch﹏ Y誹 Quy誸", 230000, {2, 0, 554, 1}, 15 * 24 * 3600},
	{"Rng B� K輕", 40000, {2, 1, 30093, 1}, 30 * 24 * 3600},
	{"Qu﹏ C玭g Chng", 170000, {2, 1, 9999, 1}, 15 * 24 * 3600},
	{"Rng Tr蕁 Ph竔", 20000, {2, 1, 30113, 1}, 30 * 24 * 3600},
	{"Ti猽 Ki誴 t竛", 210000, {2, 0, 141, 1}, 15 * 24 * 3600},
	{"T� Linh Thi猲 � Ph�", 40000, {0, 107, 160, 1}, 0},
	{"T� Linh T� � Ph�", 40000, {0, 107, 161, 1}, 0},
	{"T� Linh Chi課 � Ph�", 40000, {0, 107, 159, 1}, 0},
	{"B祅 Long B輈h", 210000, {2, 1, 1000, 1}, 15 * 24 * 3600},
};

tbVIET_0911_JUHUACHA_AWARD_FULL = {
	{"Thi猲 Th筩h Linh Th筩h", 7800, {2, 1, 1068, 1}, 15 * 24 * 3600},
	{"Thi猲 Th筩h Tinh Th筩h", 453000, {2, 1, 1009, 1}, 0},
	{"мnh H錸 Thi猲 Th筩h Th莕 Th筩h", 3100, {2, 1, 1067, 1}, 7 * 24 * 3600},
	{"L╪g Ba Vi B�", 31300, {0, 112, 78, 1}, 0},
	{"Huy hi謚 chi課 c玭g (Huy ho祅g)", 4700, {2, 1, 9977, 1}, 7 * 24 * 3600},
	{"M� B礽", 500100, {2, 1, 371, 1}, 30 * 24 * 3600},
}

--帮会冲奖活动，帮主奖励
tbVIET_0911_TONG_AWARD1 = {
	[1] = 
	{
		{1, "Ng� d鬾g b筩h ng鋍 th筩h", {2, 1, 1024, 15}, 7 * 24 * 3600},
		{1, "Rng Y誹 Quy誸_Cao C蕄", {2, 1, 30112, 3}, 7 * 24 * 3600},
		{1, "Bao m秐h Thi猲 Th筩h", {2, 1, 1049, 1}, 7 * 24 * 3600},
		{1, "Bao Thi猲 Th筩h", {2, 1, 1050, 1}, 7 * 24 * 3600},
		{1, "1 bao X輈h Thi誸 Tinh", {2, 1, 2651, 1}, 7 * 24 * 3600},
		{1, "Ng� H祅h M藅 t辌h", {0, 107, 155, 2}, 0},
		{1, "Thi猲 Th筩h linh th筩h", {2, 1, 1068, 1}, 7* 24 * 3600},
		{1, "N� Oa Tinh Th筩h", {2, 1, 504, 3}, 7* 24 * 3600},
		{2, "ModifyExp(10000000)", "C竎 h� thu 頲 10000000 kinh nghi謒"},
		{2, "ModifyReputation(1000, 1)", "C竎 h� thu 頲 1000 甶觤 danh v鋘g"},
	},
	[2] = 
	{
		{1, "Ng� d鬾g b筩h ng鋍 th筩h", {2, 1, 1024, 10}, 7 * 24 * 3600},
		{1, "Rng Y誹 Quy誸_Cao C蕄", {2, 1, 30112, 2}, 7 * 24 * 3600},
		{1, "Bao m秐h Thi猲 Th筩h", {2, 1, 1049, 1}, 7 * 24 * 3600},
		{1, "Bao Thi猲 Th筩h", {2, 1, 1050, 1}, 7 * 24 * 3600},
		{1, "1 bao X輈h Thi誸 Tinh", {2, 1, 2651, 1}, 7 * 24 * 3600},
		{1, "Ng� H祅h M藅 t辌h", {0, 107, 155, 1}, 0},
		{1, "N� Oa Tinh Th筩h", {2, 1, 504, 2}, 7* 24 * 3600},
		{2, "ModifyExp(7000000)", "C竎 h� thu 頲 7000000 甶觤 kinh nghi謒"},
		{2, "ModifyReputation(700, 1)", "C竎 h� thu 頲 700 danh v鋘g"},
	},
	[3] = 
	{
		{1, "Ng� d鬾g b筩h ng鋍 th筩h", {2, 1, 1024, 5}, 7 * 24 * 3600},
		{1, "Rng Y誹 Quy誸_Cao C蕄", {2, 1, 30112, 1}, 7 * 24 * 3600},
		{1, "Bao m秐h Thi猲 Th筩h", {2, 1, 1049, 1}, 7 * 24 * 3600},
		{1, "Bao Thi猲 Th筩h", {2, 1, 1050, 1}, 7 * 24 * 3600},
		{1, "1 bao X輈h Thi誸 Tinh", {2, 1, 2651, 1}, 7 * 24 * 3600},
		{1, "N� Oa Tinh Th筩h", {2, 1, 504, 1}, 7* 24 * 3600},
		{2, "ModifyExp(5000000)", "C竎 h� thu 頲 5000000 甶觤 kinh nghi謒"},
		{2, "ModifyReputation(500, 1)", "C竎 h� thu 頲 700 danh v鋘g"},
	}
};

--帮会冲奖活动，副帮主和长老奖励
tbVIET_0911_TONG_AWARD2 = {
	[1] = 
	{
		{2, "ModifyExp(7000000)", "C竎 h� thu 頲 7000000 甶觤 kinh nghi謒"},
		{2, "ModifyReputation(700, 1)", "C竎 h� thu 頲 700 danh v鋘g"},
	},
	[2] = 
	{
		{2, "ModifyExp(5000000)", "C竎 h� thu 頲 5000000 甶觤 kinh nghi謒"},
		{2, "ModifyReputation(500, 1)", "C竎 h� thu 頲 500 danh v鋘g"},
	},
	[3] =
	{
		{2, "ModifyExp(2000000)", "C竎 h� thu 頲 2000000 甶觤 kinh nghi謒"},
		{2, "ModifyReputation(200, 1)", "C竎 h� thu 頲 200 danh v鋘g"},
	},
};

--帮会冲奖活动，堂主和香主奖励
tbVIET_0911_TONG_AWARD3 = {
	[1] = 
	{
		{2, "ModifyExp(5000000)", "C竎 h� thu 頲 5000000 甶觤 kinh nghi謒"},
		{2, "ModifyReputation(500, 1)", "C竎 h� thu 頲 500 danh v鋘g"},
	},
	[2] = 
	{
		{2, "ModifyExp(2000000)", "C竎 h� thu 頲 2000000 甶觤 kinh nghi謒"},
		{2, "ModifyReputation(200, 1)", "C竎 h� thu 頲 200 danh v鋘g"},
	},
	[3] =
	{
		{2, "ModifyExp(1000000)", "C竎 h� thu 頲 1000000 甶觤 kinh nghi謒"},
		{2, "ModifyReputation(100, 1)", "C竎 h� thu 頲 100 danh v鋘g"},
	},
};

--帮会冲奖活动，普通帮众奖励
tbVIET_0911_TONG_AWARD4 = {
	[1] = 
	{
		{2, "ModifyExp(2000000)","C竎 h� thu 頲 2000000 甶觤 kinh nghi謒"},
		{2, "ModifyReputation(200, 1)", "C竎 h� thu 頲 200 danh v鋘g"},
	},
	[2] = 
	{
		{2, "ModifyExp(1000000)","C竎 h� thu 頲 1000000 甶觤 kinh nghi謒"},
		{2, "ModifyReputation(100, 1)","C竎 h� thu 頲 100 danh v鋘g"},
	},
	[3] =
	{
		{2, "ModifyExp(500000)","C竎 h� thu 頲 500000 甶觤 kinh nghi謒"},
		{2, "ModifyReputation(50, 1)","C竎 h� thu 頲 50 danh v鋘g"},
	},
};

tbVIET_0911_TANGQUASUPHU ={
	{nil, 50250},
	{"u H錸", 26000, {2, 1, 1157, 1}, 15 * 24 * 3600},
	{"M穘h Ti謙 Ho祅h Th�", 1000, {2, 0, 738, 1}, 0},
	{"Thng C� K� L﹏ Huy誸", 1000, {2, 0, 739, 1}, 0},
	{"Nguy謙 Hoa Chi Tinh", 100, {2, 1, 3219, 1}, 0},
	{"Nguy謙 Hoa", 10000, {2, 1, 2002, 1}, 0},
	{"L╪g Ba Vi B�", 100, {0, 112, 78, 1}, 0},
	{"Rng V� Kh� B筩", 5000, {2, 1, 1147, 1}, 15 * 24 * 3600},
	{"уng Ti襫 V祅g", 2000, {2, 1, 30094, 1}, 0},
	{"Th駓 Ho祅g B� Chi誹", 1000, {2, 1, 1047, 1}, 15 * 24 * 3600},
	{"L鬰 L﹎ Lang Y猲", 1000, {2, 1, 1014, 1}, 15 * 24 * 3600},
	{"Uy猲 Μng Kim Ti B筩", 1000, {2, 1, 1048, 1}, 15 * 24 * 3600},
	{"Huy hi謚 chi課 c玭g (huy ho祅g)", 250, {2, 1, 9977, 1}, 15 * 24 * 3600},
	{"Thi猲 Th筩h Tinh Th筩h", 1300, {2, 1, 1009, 1},0}
}

tbVIET_0911_TANGQUASUPHU_2 = {
	{0, 4000, 125000},
	{4001, 8000, 150000},
	{8001, 9000, 175000},
	{9001, 99999, 200000},
};

tbVIET_0911_WEAPON = {
	[2]= 	{"C� лnh",0,3,64,200},
	[3]= 	{"A La H竛 Trng",0,8,97,100},
	[4]=	 {"V筺 Nh蒼",0,0,14,220},
	[6]= 	{"M穘 Thi猲 Hoa V�",0,1,53,130},	
	[8]= 	{"H醓 Tinh",0,2,36,90},	
	[9]= 	{"Hi Nh﹏ C莔",0,10,75,140},
	[11]= {"V筺 Nh蒼",0,0,14,220},
	[12]= {"Li謙 Di謒",0,5,40,200},
	[14]= {"H醓 Tinh",0,2,36,90},	
	[15]= {"Th莕 H祅h",0,9,86,130},	
	[17]= {"Чi H祇 L玦 Thng",0,6,108,130},	
	[18]= {"Th莕 Cung",0,4,119,130},
	[20]= {"L╪g Phong",0,7,12,200},
	[21]= {"M穘h h�",0,11,12,200},
}

function get_full_skill_level()
	local nPlayerRoute = GetPlayerRoute()
	local nSkillID = TB_55_SKILL_INFO[nPlayerRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= 7 then
			return 1
		else
			return 0;
		end;
	end;
end;


-- 获得55级技能是否已经学满了
TB_55_SKILL_INFO = {
	[0] = 0,--"无门无派",
	[1] = 0,--少林
	[2] = 31,--"俗家",
	[3] = 56,--"禅僧",
	[4] = 43,--"武僧",
	[5] = 0,--"唐门",
	[6] = 73,--"唐门",
	[7] = 0,--"峨嵋",
	[8] = 88,--"峨嵋佛家",
	[9] = 101,--"峨嵋俗家",
	[10] = 0,--"丐帮",
	[11] = 112,--"丐帮净衣",
	[12] = 123,--"丐帮污衣",
	[13] = 0,--"武当",
	[14] = 145,--"武当道家",
	[15] = 158,--"武当俗家",
	[16] = 0,--"杨门",
	[17] = 731,--"杨门枪骑",
	[18] = 744,--"杨门弓骑",
	[19] = 0,--"五毒",
	[20] = 377,--"五毒邪侠",
	[21] = 363,--"五毒蛊师",
}

--领取上线奖励
function Viet0911_Give_ShangXian_Aword()
	if tonumber(date("%y%m%d")) < 091106 or tonumber(date("%y%m%d")) > 491206 then
		Talk(1, "", "Ho箃 ng  qu� h筺");
		return 0;
	end
	local nDayWeek = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	if nDayWeek == 2 or nDayWeek == 3 or nDayWeek == 4 then
		Talk(1, "", "Ch� c� th� 2, 6, 7 ch� nh藅 m韎 c� th� nh薾 ph莕 thng l猲 m筺g");
		return 0;
	end
	if nHour < 16 then
		Talk(1, "", "Th阨 gian nh薾 online nh薾 thng v祇 m鏸 ng祔 t� 16 n 24 gi�");
		return 0;
	end
	if GetLevel() < 73 or GetPlayerRoute() == 0 then
		Talk(1, "", "Th蕄 h琻 c蕄 73 v� ch璦 v祇 m玭 ph竔 th� kh玭g th� nh薾 lo筰 ph莕 thng n祔");
		return 0;
	end
	if GetTask(VIET_0911_TASK_SHANGXIAN_AWORD) >= tonumber(date("%y%m%d")) then
		Talk(1, "", "H玬 nay i hi謕  nh薾 ph莕 thng, xin h穣 i ng祔 mai");
		return 0;
	end
	local nExp = 0;
	local nRep = GetReputation();
	local nFac = GetTask(336);
	local nRepLevel = viet0911_get_aword_level(nRep, tbVIET_0911_SHANGXIAN_AWORD);
	local nFacLevel = viet0911_get_aword_level(nFac, tbVIET_0911_SHANGXIAN_AWORD);
	if nRepLevel == 0 and nFacLevel == 0 then
		Talk(1, "", "觤 danh v鋘g v� c鑞g hi課 s� m玭 kh玭g  nh薾 ph莕 thng n祔.");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then 
		return 0;
	end
	if nRepLevel ~= 0 then
		ModifyExp(tbVIET_0911_SHANGXIAN_AWORD[nRepLevel][3]);
		Msg2Player("B筺 nh薾 頲 "..tbVIET_0911_SHANGXIAN_AWORD[nRepLevel][3].." 甶觤 kinh nghi謒");
		WriteLog(GetName() .. "Nh薾 頲 "..tbVIET_0911_SHANGXIAN_AWORD[nRepLevel][3] .. "  甶觤 kinh nghi謒")
		gf_AddItemEx({2, 1, 30118, tbVIET_0911_SHANGXIAN_AWARD2[nRepLevel]}, "Hoa C骳");
	end
	if nFacLevel ~= 0 then
		ModifyExp(tbVIET_0911_SHANGXIAN_AWORD[nFacLevel][3]);
		Msg2Player("B筺 nh薾 頲 "..tbVIET_0911_SHANGXIAN_AWORD[nFacLevel][3].." 甶觤 kinh nghi謒");
		WriteLog(GetName() .. "Nh薾 頲 "..tbVIET_0911_SHANGXIAN_AWORD[nFacLevel][3] .. "  甶觤 kinh nghi謒")
		gf_AddItemEx({2, 1, 30118, tbVIET_0911_SHANGXIAN_AWARD2[nFacLevel]}, "Hoa C骳");
	end
	SetTask(VIET_0911_TASK_SHANGXIAN_AWORD, tonumber(date("%y%m%d")));
end

--判断现在的声望和师门贡献度可以获得第几级奖励
function viet0911_get_aword_level(nValue, tAword)
	for i = getn(tAword), 1, -1 do
		if tAword[i][2] == 0 then
			if nValue >= tAword[i][1] then
				return i;
			end
		else
			if nValue >= tAword[i][1] and nValue <= tAword[i][2] then
				return i;
			end
		end
	end
	return 0;
end

--做菊花茶
function Viet_0911_GetJuHuaCha()
	if GetItemCount(2, 1, 30118) < 2 or GetItemCount(2, 1, 30121) < 1 then
		Say("Чi hi謕 mang nguy猲 li謚 kh玭g  xin h穣 ki觤 tra l筰", 1, "Th藅 ng筰 qu�! Ta s� quay l筰 sau./viet_0911_nothing");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then 
		return 0;
	end
	if DelItem(2, 1, 30118, 2) == 1 and DelItem(2, 1, 30121, 1) == 1 then
		gf_SetLogCaption(VIET_0911_LOG_TITLE);
		gf_AddItemEx({2, 1, 30119, 1}, "Tr� Hoa C骳");
		WriteLogEx(VIET_0911_LOG_TITLE,"h頿 th祅h",1,"Tr� Hoa C骳")
		gf_SetLogCaption("");
	end
	SelectSay();
end

--换百花饼
function Viet0911_Give_Exchange_Baihuabing()
	if GetItemCount(2, 1, 30118) < 2 then
		Say("Чi hi謕 mang nguy猲 li謚 kh玭g  xin h穣 ki觤 tra l筰", 1, "Th藅 ng筰 qu�! Ta s� quay l筰 sau./viet_0911_nothing");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then 
		return 0;
	end
	
	if Pay(10000) == 0 then
		Talk(1, "", "Ng﹏ lng c馻 b筺 kh玭g !");
		return
	end
	if DelItem(2, 1, 30118, 2) == 1 then
		gf_SetLogCaption(VIET_0911_LOG_TITLE);
		gf_AddItemEx({2, 1, 30120, 1}, "B竛h B竎h Hoa");
		WriteLogEx(VIET_0911_LOG_TITLE,"h頿 th祅h",1,"B竛h B竎h Hoa")
		gf_SetLogCaption("");
	end
	SelectSay();
end

--领取排名前三名帮会的奖励
function get_123tong_award()
	local tb_dialog = {
		"Nh薾 ph莕 ph莕 thng bang ch�/#get_tong_award(1)",
		"Nh薾 ph莕 thng c馻 ph� bang ch� v� trng l穙/#get_tong_award(2)",
		"Nh薾 ph莕 thng c馻 阯g ch� v� hng ch�/#get_tong_award(3)",
		"Nh薾 ph莕 thng bang ch髇g/#get_tong_award(4)",
	};
	Say("<color=green>Kim S琻 chng m玭 nh﹏<color>: Th祅h vi猲 c馻 3 bang h閕 ng u u c� th� n y nh薾 thng!<enter><color=red>Ch� �: Sau 24:00 th� 7 n誹 nh� ng o kh玭g n nh薾, ph莕 thng s� b� x鉧 甶<color>", 
		getn(tb_dialog), 
		tb_dialog
	);
end

function get_tong_award(nType)
	local nCurDate = tonumber(date("%Y%W"));
	local nLastDate = GetTask(VIET_0911_TASK_TONG_AWARD_DATE);
	SetTaskTemp(105, nType);
	if nLastDate >= nCurDate then
		Talk(1, "", "<color=green>Kim S琻 chng m玭 nh﹏<color>: Tu莕 n祔 c竎 h�  nh薾 ph莕 thng bang h閕 r錳.");
		return 0;
	end
	local nLevel = IsTongMember();
	if nLevel == 0 then
		Talk(1, "", "<color=green>Kim S琻 chng m玭 nh﹏<color>: C竎 h� v蒼 ch璦 gia nh藀 bang h閕, kh玭g th� nh薾 ph莕 thng n祔.");
		return 0;
	end
	if GetLevel() < 73 then
		Talk(1, "", "<color=green>Kim S琻 chng m玭 nh﹏<color>: C蕄 b薱 ch璦  73, kh玭g th� nh薾 ph莕 thng n祔 頲");
		return 0;
	end
	if get_full_skill_level() == 0 then
		Talk(1, "", "<color=green>Kim S琻 chng m玭 nh﹏<color>: Ch璦 h鋍 y  chi猽 th鴆 55, kh玭g th� nh薾 ph莕 thng n祔 頲");
		return 0;
	end
	if viet_0911_get_join_tong_day() < 7 then
		Talk(1, "", "<color=green>Kim S琻 chng m玭 nh﹏<color>: C竎 h� gia nh藀 bang h閕 ch璦  7 ng祔, kh玭g th� nh薾 thng!")
		return 0;
	end
	if GetTongLevel() < 5 then
		Talk(1, "", "<color=green>Kim S琻 chng m玭 nh﹏<color>: Bang h閕 c竎 h� ch璦 t n c蕄 5, kh玭g th� nh薾 thng.");
		return 0;
	end
	if GetTongPopulation() < 1000000 then
		Talk(1, "", "<color=green>Kim S琻 chng m玭 nh﹏<color>: C竎 h� 產ng � bang h閕 c� nh﹏ kh� kh玭g  1000000, kh玭g th� nh薾 thng.");
		return 0;
	end
	local nTongLadder = GetTongPopuLadder();
	if nTongLadder > 3 or nTongLadder <= 0 then
		Talk(1, "", "<color=green>Kim S琻 chng m玭 nh﹏<color>: Bang h閕 c馻 c竎 h� x誴 h筺g nh﹏ kh� kh玭g ph秈 3 bang h閕 ng u, kh玭g th� nh薾 thng")
		return 0;
	end
	if gf_Judge_Room_Weight(5, 50, " ") ~= 1 then 
		return 0;
	end
	local nLevelName = {
		{1, 1, "Bang ch�"},
		{2, 2, "Ph� bang"},
		{3, 2, "Trng l穙"},
		{4, 3, "Л阯g ch�"},
		{5, 3, "Hng ch�"},
		{6, 4, "bang ch髇g ph� th玭g"},
	};
	
	local szName = "";
	if nLevelName[nLevel][2] ~= nType then
		if nType == 2 or nType == 3 then
			szName = "ph� bang ch� ho芻 trng l穙";
		elseif nType == 4 or nType == 5 then
			szName = "阯g ch� ho芻 hng ch�";
		else
			szName = nLevelName[nType][3];
		end
		Talk(1, "", "<color=green>Kim S琻 chng m玭 nh﹏<color>: мa v� trong bang h閕 c馻 i hi謕 kh玭g ph秈 l� "..szName..", kh玭g th� nh薾 ph莕 thng n祔 頲.");
		return 0;
	end
	ApplyRelayShareData("viet0911_tongmaster_award", 0, nType, VIET_0911_FILE_NAME, "get_tongmaster_award_callback");
end

function get_tongmaster_award_callback(szKey, nKey1, nKey2, nCount)
	local nType = GetTaskTemp(105);
	local nLevel = IsTongMember();
	local nLevelName = {
		{1, 1, "Bang ch�"},
		{2, 2, "Ph� bang"},
		{3, 2, "Trng l穙"},
		{4, 3, "Л阯g ch�"},
		{5, 3, "Hng ch�"},
		{6, 4, "bang ch髇g ph� th玭g"},
	};
	
	--对最大领取数量的限制
	local nNumLimit = {1, 2, 42, 261};--每个等级的人可以领取的数量
	local nMaxNum = nNumLimit[nType];--最大可以领取的数量
	local nTongLadder = GetTongPopuLadder();
	local szName = "";
	if nLevelName[nLevel][2] ~= nType then
		if nType == 2 or nType == 3 then
			szName = "ph� bang ch� ho芻 trng l穙";
		elseif nType == 4 or nType == 5 then
			szName = "阯g ch� ho芻 hng ch�";
		else
			szName = nLevelName[nType][3];
		end
		Talk(1, "", "<color=green>Kim S琻 chng m玭 nh﹏<color>: мa v� trong bang h閕 c馻 i hi謕 kh玭g ph秈 l� "..szName..", kh玭g th� nh薾 ph莕 thng n祔 頲.");
		return 0;
	end
	
	if nCount ~= 0 then
		local nDate, nNum = GetRelayShareDataByKey(szKey, nKey1, nKey2, GetTongName());
		DelRelayShareDataCopy(szKey, nKey1, nKey2);
		if not nDate then
			Say("<color=green>Kim S琻 chng m玭 nh﹏<color>: C竎 h� 產ng � bang h閕 nh﹏ kh� h筺g "..nTongLadder.." , a v� c馻 i hi謕 trong bang h閕 l� "..nLevelName[nLevel][3].."Чi hi謕 x竎 nh薾 mu鑞 nh薾 ph莕 thng n祔?",
					2,
			 		"Ta mu鑞 nh薾 thng/#confirm_get_tong_award("..nTongLadder..", "..nLevelName[nLevel][2]..","..(nMaxNum - 1)..")",
					"в ta ngh� l筰/viet_0911_nothing"
			 );
		else
			if nDate >= tonumber(date("%Y%W")) then
				if nNum <= 0 then
					Talk(1, "", "<color=green>Kim S琻 chng m玭 nh﹏<color>: Tu莕 n祔 c竎 h�  nh薾 ph莕 thng bang h閕 r錳.");
					return 0;
				else
					Say("<color=green>Kim S琻 chng m玭 nh﹏<color>: C竎 h� 產ng � bang h閕 nh﹏ kh� h筺g "..nTongLadder.." , a v� c馻 i hi謕 trong bang h閕 l� "..nLevelName[nLevel][3].."Чi hi謕 x竎 nh薾 mu鑞 nh薾 ph莕 thng n祔?",
							2,
					 		"Ta mu鑞 nh薾 thng/#confirm_get_tong_award("..nTongLadder..", "..nLevelName[nLevel][2]..","..(nNum - 1)..")",
							"в ta ngh� l筰/viet_0911_nothing"
					 );
				end
			else
				Say("<color=green>Kim S琻 chng m玭 nh﹏<color>: C竎 h� 產ng � bang h閕 nh﹏ kh� h筺g "..nTongLadder.." , a v� c馻 i hi謕 trong bang h閕 l� "..nLevelName[nLevel][3].."Чi hi謕 x竎 nh薾 mu鑞 nh薾 ph莕 thng n祔?",
						2,
				 		"Ta mu鑞 nh薾 thng/#confirm_get_tong_award("..nTongLadder..", "..nLevelName[nLevel][2]..","..(nMaxNum - 1)..")",
						"в ta ngh� l筰/viet_0911_nothing"
				 );
			end
		end
	else
		Say("<color=green>Kim S琻 chng m玭 nh﹏<color>: C竎 h� 產ng � bang h閕 nh﹏ kh� h筺g "..nTongLadder.." , a v� c馻 i hi謕 trong bang h閕 l� "..nLevelName[nLevel][3].."Чi hi謕 x竎 nh薾 mu鑞 nh薾 ph莕 thng n祔?",
				2,
		 		"Ta mu鑞 nh薾 thng/#confirm_get_tong_award("..nTongLadder..", "..nLevelName[nLevel][2]..","..(nMaxNum - 1)..")",
				"в ta ngh� l筰/viet_0911_nothing"
		 );
	end
end
	 
function confirm_get_tong_award(nTongLadder, nType, nSaveNum)
	--nTongLadder是帮会排名，nType是领取哪一级的奖励
	local tbAward;
	if nType == 1 then
		tbAward = tbVIET_0911_TONG_AWARD1[nTongLadder];
	elseif nType == 2 then
		tbAward = tbVIET_0911_TONG_AWARD2[nTongLadder];
	elseif nType == 3 then
		tbAward = tbVIET_0911_TONG_AWARD3[nTongLadder];
	else
		tbAward = tbVIET_0911_TONG_AWARD4[nTongLadder];
	end
	for i = 1, getn(tbAward) do
		if tbAward[i][1] == 1 then
			gf_SetLogCaption(VIET_0911_LOG_TITLE);
			
			for j = 1, tbAward[i][3][4] do
				local nRetCode, nIndex = gf_AddItemEx({tbAward[i][3][1], tbAward[i][3][2], tbAward[i][3][3], 1}, tbAward[i][2]);
				if nRetCode == 1 and tbAward[i][4] ~= 0 then
					SetItemExpireTime(nIndex, tbAward[i][4]);
				end
			end
			
			gf_SetLogCaption("");
		else
			dostring(tbAward[i][2]);
			Msg2Player(tbAward[i][3]);
		end
	end
	SetTask(VIET_0911_TASK_TONG_AWARD_DATE, tonumber(date("%Y%W")));
	
	--领完后把当前的日期存回共享库中
	AddRelayShareData("viet0911_tongmaster_award", 0, nType, VIET_0911_FILE_NAME, "viet_0911_nothing", 0, GetTongName(), "dd", tonumber(date("%Y%W")), nSaveNum);
end

function viet_0911_get_join_tong_day()
	local nJoinTime = GetJoinTongTime();
	if nJoinTime == 0 then	--如果没有加入帮会
		return 0;
	end;
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	return nDayCount;
end

function viet_0911_nothing()

end