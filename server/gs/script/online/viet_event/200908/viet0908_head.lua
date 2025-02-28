--=============================================
--create by baiyun 2009.7.16
--describe:越南版8月份活动头文件
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua");

VIET_0908_TASK_KILL_HALL_EXP_DATE = 2081;			--杀手堂经验获得日期(只定义做记录用)
VIET_0908_TASK_KILL_HALL_EXP = 2082;					--杀手堂获得的经验数(只定义做记录用)
VIET_0908_TASK_SHIMEN_GET_PUTAO_DATE = 2083;	--通过师门任务获得葡萄的日期
VIET_0908_TASK_SHIMEN_GET_PUTAO_COUNT = 2084;	--通过师门任务获得葡萄的次数
VIET_0908_TASK_ALREADY_GET_EXP = 2085;				--已经获得的经验数量
VIET_0908_TASK_SHANGXIAN_AWORD = 2086;				--获得上线奖励的日期
VIET_0908_TASK_GET_SHAQI_DATE = 2087;					--获得杀气值的日期
VIET_0908_TASK_GET_SHAQI_COUNT = 2088;				--获得杀气值的数量


VIET_0908_CONST_SHIMEN_GET_MAX = 10;					--每天最多十次获得师门任务葡萄奖励
VIET_0908_CONST_MAX_EXP = 200000000;					--使用各种糖最多获得的经验

--通过师门任务获得的葡萄的数量
tVIET_SHIMEN_PUTAO = {
	[1] = 10,
	[2] = 10,
	[3] = 10,
	[4] = 10,
	[5] = 50,
	[6] = 60,
	[7] = 70,
	[8] = 70,
	[9] = 80,
};

tVIET_0908_HECHENG = {
	{{{"Nho", 4, 2, 1, 30098}, {"T骾 Hng Li謚", 1, 2, 1, 30101}}, {"K裲 Nho", {2, 1, 30102, 1}, "Keo Nho"}},
	{{{"M穘g c莡", 4, 2, 1, 30099}, {"T骾 Hng Li謚", 1, 2, 1, 30101}}, {"K裲 M穘g C莡", {2, 1, 30103, 1}, "Keo Mang Cau"}},
	{{{"S莡 ri猲g", 4, 2, 1, 30100}, {"T骾 Hng Li謚", 1, 2, 1, 30101}}, {"K裲 S莡 Ri猲g", {2, 1, 30104, 1}, "Keo Sau Rieng"}},
};

str_VIET_0908_LOG_TITLE = "[Hoat dong thang 8]";

--上线奖励
tVIET_0908_SHANGXIAN_AWORD = {
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
--镇派技能ID
tbViet_0908_SkillID = 
	{
		[0] = 0,
		[1] = 0,	
		[2] = 32,	--少林俗家,易筋经
		[3] = 57,	--少林禅僧,洗髓经
		[4] = 44,	--少林武僧,如来神掌
		[5] = 0,			--唐门
		[6] = 74,	--唐门,吸星阵
		[7] = 0,			--峨嵋
		[8] = 89,	--峨嵋佛家,万相神功
		[9] = 102,	--峨嵋俗家,天音镇魂曲
		[10] = 0,			--丐帮
		[11] = 113,--丐帮净衣,降龙十八掌
		[12] = 124,--丐帮污衣,打狗棍阵
		[13] = 0,			--武当
		[14] = 146,--武当道家,无上太极剑
		[15] = 159,--武当俗家,太极神功
		[16] = 0,			--杨门
		[17] = 732,--杨门枪骑,连环钻龙枪
		[18] = 745,--杨门弓骑,霸王翔凤箭
		[19] = 0,			--五毒
		[20] = 775,--五毒邪侠,无天魔功
		[21] = 774,--五毒蛊师,无影魔蛊
};
	
tVIET_0908_MIJI = {
	{"T� Linh Thi猲 � Ph�", 30, {0, 107, 160, 1}},
	{"T� Linh T� � Ph�", 30, {0, 107, 161, 1}},
	{"T� Linh Chi課 � Ph�", 30, {0, 107, 159, 1}},
	{"B竎h Th秓 m藅 t辌h", 10, {0, 107, 156, 1}},
};

tVIET_0908_MIJI_EXCHANGE = {
	{{0, 107, 64, 4}, {2, 1, 30105, 1}},
	{{0, 107, 65, 4}, {2, 1, 30105, 1}},
	{{0, 107, 66, 2}, {2, 1, 30105, 1}},
};

--糖奖励
--概率基数10000000
--物品：物品名字，概率，ID表，类型，消失时间
--命令：命令种类，概率，命令表达式，命令参数，0
--类型>0命令，=0物品
tVIET_0908_TANG_AWARD = {
	{"B祅 Long b輈h", 625000, {2, 1, 1000, 1}, 0, 7 * 24 * 3600},
	{"M秐h Thi猲 th筩h", 1250000, {2, 2, 7, 1}, 0, 0},
	{"Thi猲 th筩h", 1250000, {2, 2, 8, 1}, 0, 0},
	{"M秐h B╪g th筩h", 2187500, {2, 1, 148, 1}, 0, 0},
	{"B╪g th筩h", 2187500, {2, 1, 149, 1}, 0, 0},
	{"T葃 T駓 n", 125000, {2, 0, 136, 1}, 0, 7 * 24 * 60 * 60},
	{"B竧 B秓 T葃 T駓 Ti猲 Кn", 630, {2, 0, 138, 1}, 0, 7 * 24 * 60 * 60},
	{"Ti猽 Ki誴 t竛", 1250000, {2, 0, 141, 1}, 0, 7 * 24 * 60 * 60},
	{"T祅g Ki誱 anh h飊g thi誴", 1250000, {2, 0, 31, 1}, 0, 7 * 24 * 60 * 60},
	{"B秓 rng T祅g Ki誱 u qu竛", 12500, {2, 1, 1059, 1}, 0, 30 * 24 * 60 * 60},
	{"B秓 rng T祅g Ki誱 y gi竝", 12500, {2, 1, 1060, 1}, 0, 30 * 24 * 60 * 60},
	{"B秓 rng T祅g Ki誱 hoa kh�", 12500, {2, 1, 1061, 1}, 0, 30 * 24 * 60 * 60},
	{"B秓 rng T祅g Ki誱 trang s鴆", 12500, {2, 1, 1062, 1}, 0, 30 * 24 * 60 * 60},
	{"B秓 rng T祅g Ki誱 v� kh�", 12500, {2, 1, 1063, 1}, 0, 30 * 24 * 60 * 60},
	{"B玭 Ti猽", 100, {0, 105, 16, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 30 * 24 * 60 * 60},
	{"Phi猽 V�", 100, {0, 105, 15, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 30 * 24 * 60 * 60},
	{"Щng V�", 100, {0, 105, 20, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 30 * 24 * 60 * 60},
	{"Si猽 Quang", 100, {0, 105, 19, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 30 * 24 * 60 * 60},
	{"уng Ti襫 V祅g", 625000, {2, 1, 30094, 1}, 0, 0},
	{"L� th駓", 17822712, {2, 0, 351, 1}, 0, 0},
	{"Danh v鋘g", 625000, "ModifyReputation(%d, 1)", 10, 0},
	{"Danh v鋘g", 1250000, "ModifyReputation(%d, 1)", 5, 0},
	{"Danh v鋘g", 2500000, "ModifyReputation(%d, 1)", 3, 0},
	{"Danh v鋘g", 3125000, "ModifyReputation(%d, 1)", 2, 0},
	{"Danh v鋘g", 28765160, "ModifyReputation(%d, 1)", 1, 0},
	{"觤 s� m玭", 21379660, "SetTask(336, GetTask(336) + %d)", 1, 0},
	{"觤 s� m玭", 3125000, "SetTask(336, GetTask(336) + %d)", 3, 0},
	{"觤 s� m玭", 1875000, "SetTask(336, GetTask(336) + %d)", 5, 0},
	{"Thi猲 H� M藅 t辌h", 1000000, {0, 107, 64, 1}, 0, 0},
	{"T� H� M藅 t辌h", 1000000, {0, 107, 65, 1}, 0, 0},
	{"Chi猰 Y Ph�", 31250, {0, 107, 66, 1}, 0, 0},
	{"Ti觰 Nh﹏ s﹎ qu�", 1000000, {2, 0, 552, 1}, 0, 7 * 24 * 60 * 60},
	{"Linh X� Huy誸", 125000, {2, 1, 30105, 1}, 0, 0},
	{"Rng B� K輕", 62500, {2, 1, 30093, 1}, 0, 30 * 24 * 60 * 60},
	{"B秓 Rng c Bi謙", 188, {2, 1, 30091, 1}, 0, 30 * 24 * 60 * 60},
	{"Tu Ch﹏ Y誹 Quy誸", 5000000, {2, 0, 554, 1}, 0, 7 * 24 * 60 * 60},
	{"Th莕 N玭g Кn", 500000, {2, 1, 343, 1}, 0, 7 * 24 * 60 * 60}
};



function Viet0908_HeCheng(nType)
	local nCount = 0;
	local nId1 = 0;
	local nId2 = 0;
	local nId3 = 0;
	local nNeedKind = getn(tVIET_0908_HECHENG[nType][1]);
	for i = 1, nNeedKind do
		nCount = tVIET_0908_HECHENG[nType][1][i][2];
		nId1 = tVIET_0908_HECHENG[nType][1][i][3];
		nId2 = tVIET_0908_HECHENG[nType][1][i][4];
		nId3 = tVIET_0908_HECHENG[nType][1][i][5];
		if GetItemCount(nId1, nId2, nId3) < nCount then
			Talk(1, "regainDialog", "Чi hi謕 mang theo nguy猲 li謚 kh玭g .");
			return
		end
	end
	for i = 1, nNeedKind do
		nCount = tVIET_0908_HECHENG[nType][1][i][2];
		nId1 = tVIET_0908_HECHENG[nType][1][i][3];
		nId2 = tVIET_0908_HECHENG[nType][1][i][4];
		nId3 = tVIET_0908_HECHENG[nType][1][i][5];
		if DelItem(nId1, nId2, nId3, nCount) == 0 then 
			regainDialog();
			return
		end
	end
	gf_SetLogCaption(str_VIET_0908_LOG_TITLE);
	if gf_AddItemEx(tVIET_0908_HECHENG[nType][2][2], tVIET_0908_HECHENG[nType][2][1]) == 1 then
		WriteLogEx("Hoat dong thang 8", "Hop thanh keo trai cay", 1, tVIET_0908_HECHENG[nType][2][3]);
	end
	gf_SetLogCaption("");
	regainDialog();
end

--领取上线奖励
function Viet0908_Give_ShangXian_Aword()
	if (tonumber(date("%y%m%d")) < 090911 or tonumber(date("%y%m%d")) > 490914) then
		Talk(1, "", "Ho箃 ng  qu� h筺");
		return 0;
	end
	local nDate = tonumber(date("%m%d"));
	local nDayWeek = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	
	local nIndependenceEvent = 0;
	if nDate == 0901 or nDate == 0902 then
		nIndependenceEvent = 1;
	end
	
	if (nDayWeek == 2 or nDayWeek == 3 or nDayWeek == 4) and nIndependenceEvent == 0 then
		Talk(1, "", "Ch� c� th� 2, 6, 7 ch� nh藅 m韎 c� th� nh薾 ph莕 thng l猲 m筺g");
		return 0;
	elseif  nHour < 16 and nIndependenceEvent == 0  then
			Talk(1, "", "Ch� nh薾 ph莕 thng l猲 m筺g t� 16:00 n 24:00");
			return 0;
	end
	if GetLevel() < 73 or GetPlayerRoute() == 0 then
		Talk(1, "", "Th蕄 h琻 c蕄 73 v� ch璦 v祇 m玭 ph竔 th� kh玭g th� nh薾 lo筰 ph莕 thng n祔");
		return 0;
	end
	if GetTask(VIET_0908_TASK_SHANGXIAN_AWORD) >= tonumber(date("%y%m%d")) then
		Talk(1, "", "H玬 nay i hi謕  nh薾 ph莕 thng, xin h穣 i ng祔 mai");
		return 0;
	end
	local nExp = 0;
	local nRep = GetReputation();
	local nFac = GetTask(336);
	local nRepLevel = viet0908_get_aword_level(nRep, tVIET_0908_SHANGXIAN_AWORD);
	local nFacLevel = viet0908_get_aword_level(nFac, tVIET_0908_SHANGXIAN_AWORD);
	if nRepLevel == 0 and nFacLevel == 0  and nIndependenceEvent == 0 then
		Talk(1, "", "觤 danh v鋘g v� c鑞g hi課 s� m玭 kh玭g  nh薾 ph莕 thng n祔.");
		return 0;
	end
	if nRepLevel ~= 0 then
		ModifyExp(tVIET_0908_SHANGXIAN_AWORD[nRepLevel][3]);
		Msg2Player("B筺 nh薾 頲 "..tVIET_0908_SHANGXIAN_AWORD[nRepLevel][3].." 甶觤 kinh nghi謒");
		WriteLog(GetName() .. "get "..tVIET_0908_SHANGXIAN_AWORD[nRepLevel][3] .. "  甶觤 kinh nghi謒")
		WriteLogEx("Hoat dong thang 8", "Online nhan thuong");
	end
	if nFacLevel ~= 0 then
		ModifyExp(tVIET_0908_SHANGXIAN_AWORD[nFacLevel][3]);
		Msg2Player("B筺 nh薾 頲 "..tVIET_0908_SHANGXIAN_AWORD[nFacLevel][3].." 甶觤 kinh nghi謒");
		WriteLog(GetName() .. "get "..tVIET_0908_SHANGXIAN_AWORD[nFacLevel][3] .. "  甶觤 kinh nghi謒")
		WriteLogEx("Hoat dong thang 8", "Online nhan thuong");
	end
	if nIndependenceEvent == 1 and (nDayWeek == 2 or nDayWeek == 3)  then
		ModifyExp(2919450);
		Msg2Player("B筺 nh薾 頲 2919450 甶觤 kinh nghi謒");
		WriteLog(GetName() .. "get 2919450 甶觤 kinh nghi謒")
		WriteLogEx("Hoat dong thang 8", "Online nhan thuong Quoc khanh");
	end
	SetTask(VIET_0908_TASK_SHANGXIAN_AWORD, tonumber(date("%y%m%d")));
end

--判断现在的声望和师门贡献度可以获得第几级奖励
function viet0908_get_aword_level(nValue, tAword)
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

--增加一点杀气值
function Viet0908_Add_ShaQi()
	if (tonumber(date("%y%m%d")) >= 491001) then
		Talk(1, "", "Ho箃 ng  qu� h筺");
		return 0;
	end
	local nDayWeek = tonumber(date("%w"));
	if nDayWeek == 2 or nDayWeek == 3 or nDayWeek == 4 then
		Talk(1, "", "Ch� t筰 th� 2, 6, 7 ch� nh藅 m韎 c� th� nh薾 頲 tr� s竧 kh�");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	if tbViet_0908_SkillID[nRoute] == 0 or GetSkillLevel(tbViet_0908_SkillID[nRoute]) == 0 then
		Talk(1, "", "Чi hi謕 v蒼 ch璦 h鋍 k� n╪g tr蕁 ph竔, v� v藋 kh玭g th� t╪g tr� s竧 kh� 頲.");
		return 0;
	end
	if GetMomentum() >= 10 then
		Talk(1, "", "Tr� s竧 kh� hi謓 t筰  y, kh玭g th� t╪g th猰 甶觤 s竧 kh� 頲.");
		return 0;
	end
	if GetTask(VIET_0908_TASK_GET_SHAQI_DATE) < tonumber(date("%y%m%d")) then
		SetTask(VIET_0908_TASK_GET_SHAQI_COUNT, 0);
	end
	if GetTask(VIET_0908_TASK_GET_SHAQI_COUNT) >= 10 then
		Talk(1, "", "H玬 nay c竎 h�  nh薾 tr� s竧 kh� 10 l莕 r錳, kh玭g th� nh薾 th猰 頲 n鱝.");
		return 0;
	end
	SetMomentum(GetMomentum() + 5);
	SetTask(VIET_0908_TASK_GET_SHAQI_COUNT, GetTask(VIET_0908_TASK_GET_SHAQI_COUNT) + 1);
	SetTask(VIET_0908_TASK_GET_SHAQI_DATE, tonumber(date("%y%m%d")));
	Msg2Player("Nh薾 頲 5 甶觤 s竧 kh�");
	WriteLogEx("Hoat dong thang 8", "Tran phai Than Khi");
end

--灵蛇血换秘籍
function Viet0908_LingSheXie_Miji()
	if tonumber(date("%y%m%d")) < 090807 or tonumber(date("%y%m%d")) >= 490907 then
		Talk(1, "", "Ho箃 ng  qu� h筺");
		return 0;
	end
	if GetLevel() < 30 then
		Talk(1,"", "C竎 h� ch璦  ng c蕄 c莕 thi誸");
	 	return 0;
	end
	
	nType = 1;
	nRand = random(1, 100);
	if  nRand <= 34 then
		nType = 1;
	elseif nRand > 34 and nRand <= 68 then
		nType = 2;
	elseif nRand > 68 then
		nType = 3;
	end
	
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then return end
	local nId11 = tVIET_0908_MIJI_EXCHANGE[nType][1][1];
	local nId12 = tVIET_0908_MIJI_EXCHANGE[nType][1][2];
	local nId13 = tVIET_0908_MIJI_EXCHANGE[nType][1][3];
	local nCount1 = tVIET_0908_MIJI_EXCHANGE[nType][1][4]
	local nId21 = tVIET_0908_MIJI_EXCHANGE[nType][2][1];
	local nId22 = tVIET_0908_MIJI_EXCHANGE[nType][2][2];
	local nId23 = tVIET_0908_MIJI_EXCHANGE[nType][2][3];
	local nCount2 = tVIET_0908_MIJI_EXCHANGE[nType][2][4]
	if GetItemCount(nId21, nId22, nId23) < nCount2 or GetCash() < 1000000 then
		Say("C竎 h� kh玭g mang theo  nh鱪g th� ta c莕.", 0);
		return 0;
	end
	if DelItem(nId21, nId22, nId23, nCount2) == 1 and Pay(1000000) == 1 then
		--给物品奖励
		local nRand = gf_GetRandItemByTable(tVIET_0908_MIJI, 100, 1);
		gf_SetLogCaption(str_VIET_0908_LOG_TITLE);
		if gf_AddItemEx(tVIET_0908_MIJI[nRand][3], tVIET_0908_MIJI[nRand][1]) == 1 then
			WriteLogEx("Hoat dong thang 8", "Doi Mat Tich", 1, tVIET_0908_MIJI[nRand][1]);
		end
		gf_SetLogCaption("");
	end
end

function regainDialog()
	local nDate = tonumber(date("%y%m%d%H"));
	----检查活动时间
	if nDate < 09080700 or nDate >= 49090700 then
		Talk(1, "", "Ho箃 ng  qu� h筺 th阨 gian r錳");
		return 0;
	end
	
	Say(
			"S� ki謓 th竛g 8 di詎 ra t� ng祔 07-08-2009 n h誸 24 gi� ng祔 06-09-2009. Chi ti誸 s� ki謓 ng o c� th� tham kh秓 tr猲 trang ch�: http://volam2.zing.vn",
			7,
			"H頿 th祅h K裲 Nho (c莕 4 Nho Ti v� 1 T骾 Hng Li謚)/#Viet0908_HeCheng(1)",
			"H頿 th祅h K裲 M穘g C莡 (c莕 4 M穘g C莡 v� 1 T骾 Hng Li謚)/#Viet0908_HeCheng(2)",
			"H頿 th祅h K裲 S莡 Ri猲g (c莕 4 S莡 Ri猲g v� 1 T骾 Hng Li謚)/#Viet0908_HeCheng(3)",
			"Ta mu鑞 nh薾 ph莕 thng 甶觤 kinh nghi謒./Viet0908_Give_ShangXian_Aword",
			"T╪g 5 tr� s竧 kh�./Viet0908_Add_ShaQi",
			"Mua 1 L� Th駓 (1 L� Th駓 = 10 b筩)/BuyWater",
			"K誸 th骳 i tho筰/dialog_over"
		);
end

--购买露水
function BuyWater()
	if gf_Judge_Room_Weight(1, 10, " ") == 0 then
		return
	end
	if Pay(1000) == 0 then
		Talk(1, "", "Ng﹏ lng c馻 b筺 kh玭g !");
		return
	end
	gf_AddItemEx({2, 0, 351, 1}, "L� th駓");
end

function dialog_over()
end