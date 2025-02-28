Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\collect_card\\cc_define.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\misc\\taskmanager.lua")

--活动时间
--acitivity time
CC_START_TIME = 2013060500
CC_END_TIME = 2043063000

CC_ACTIVITY_TASK_GROUP = TaskManager:Create(6,13);
CC_ACTIVITY_TASK_GROUP.DAYSEQ = 1; --跨天清理标记
CC_ACTIVITY_TASK_GROUP.ANSWER_TIMES = 2; --答题次数标记
CC_ACTIVITY_TASK_GROUP.QUESTION1 = 3;
CC_ACTIVITY_TASK_GROUP.QUESTION2 = 4;
CC_ACTIVITY_TASK_GROUP.QUESTION3 = 5;
CC_ACTIVITY_TASK_GROUP.CARD3_TIMES = 6;--上交第三种卡次数
CC_ACTIVITY_TASK_GROUP.FLAG_BIT = 7; --按位标记
CC_ACTIVITY_TASK_GROUP.BOSS_BOX_1 = 1; --开箱标记
CC_ACTIVITY_TASK_GROUP.BOSS_BOX_2 = 2;
CC_ACTIVITY_TASK_GROUP.BOSS_BOX_3 = 3;
CC_ACTIVITY_TASK_GROUP.BOSS_BOX_4 = 4;
CC_ACTIVITY_TASK_GROUP.CON_TAG = 5;  --连续答对标记
CC_ACTIVITY_TASK_GROUP.BOX_AWARD_CARD = 8; --最多领取灵猫卡数量
CC_ACTIVITY_TASK_GROUP.CARD2_TIMES = 9; --上交第二种卡次数
CC_ACTIVITY_TASK_GROUP.ZLPPARK_COUNT = 10; --资料片礼包获得次数

--活动是否开启
function cc_activity_isopen()
	return gf_CheckEventDateEx2(CC_START_TIME, CC_END_TIME);
end

function cc_daily_clear()
	if cc_activity_isopen() ~= 1 then
		return 0;
	end
	--跨天清理
	if CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.DAYSEQ) ~= zgc_pub_day_turn() then
		for i = 1, 10 do
			CC_ACTIVITY_TASK_GROUP:SetTask(i, 0);
		end
		CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.DAYSEQ, zgc_pub_day_turn());
	end
end

function cc_answer_question()
	--活动时间
	if cc_activity_isopen() ~= 1 then
		Talk(1,"","Event v蒼 ch璦 kh雐 ng");
		return 0;
	end
	--参与条件
	if gf_CheckBaseCondition(CC_PLAYER_LEVEL_MIN) ~= 1 then
		return 0;
	end
	--背包空间
	if GetFreeItemRoom() < 5 then
		Talk(1,"","Kh玭g gian h祅h trang kh玭g ");
		return 0;
	end
	if gf_Judge_Room_Weight(5, 50, "") ~= 1 then
		Talk(1,"","H祅h trang ho芻 s鴆 l鵦 kh玭g , vui l遪g s緋 x誴 l筰.")
		return 0;
	end	
	local tTemp = {
		CC_ACTIVITY_TASK_GROUP.QUESTION1,
		CC_ACTIVITY_TASK_GROUP.QUESTION2,
		CC_ACTIVITY_TASK_GROUP.QUESTION3,
	}
	--跨天清理
	cc_daily_clear();
	--是否是超过3题了
	--题目的索引
	local nIndex = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.ANSWER_TIMES) + 1;
	if nIndex > CC_ANSWER_TIMES then 
		Talk(1,"","S� l莕 tr� l阨 c﹗ h醝 h玬 nay  s� d鬾g h誸, ng祔 mai h穣 ti誴 t鬰.")
		return 0;
	end
	--随机出三个题目
	if nIndex == 1 then
		local tRand = gf_Random(1, getn(CC_QUESTION_LIB), getn(tTemp));
		for i = 1, getn(tRand) do
			CC_ACTIVITY_TASK_GROUP:SetTask(i + CC_ACTIVITY_TASK_GROUP.QUESTION1 - 1, tRand[i]);
		end
	end
	--出题目
	local nTableIndex = CC_ACTIVITY_TASK_GROUP:GetTask(tTemp[nIndex]);
	local tSay = {};
	local tSubTable = CC_QUESTION_LIB[nTableIndex];
	if not tSubTable or getn(tSubTable) ~= 3 then  return 0; end
	for i = 1, getn(tSubTable[2]) do
		if i == tSubTable[3] then
			tinsert(tSay, tSubTable[2][i].."/cc_answer_question_succ")
		else
			tinsert(tSay, tSubTable[2][i].."/cc_answer_question_fail")
		end
	end
	tinsert(tSay, "\n r髏 lui/nothing");
	Say(CC_NPC..tSubTable[1]..format("<color=red> ( hi謓 t筰 產ng tr� l阨 l莕 th� %d) <color>", nIndex), getn(tSay), tSay);
end

function cc_answer_question_succ()
	local nAnswerTimes = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.ANSWER_TIMES) + 1;
	CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.ANSWER_TIMES, nAnswerTimes);
	local tAward = {
		[1] = 10000,
		[2] = 15000,
		[3] = 20000,	
	}
	if nAnswerTimes > 1 and nAnswerTimes <= getn(tAward) then 
		if CC_ACTIVITY_TASK_GROUP:GetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.CON_TAG) == 0 then
			--连续答对奖励
			gf_Modify("Exp", tAward[nAnswerTimes]);
			cc_answer_item_award(nAnswerTimes);
		else
			--答对奖励
			gf_Modify("Exp", tAward[1]);
			cc_answer_item_award(1);
		end
	elseif nAnswerTimes == 1 then
		gf_Modify("Exp", tAward[1]);
		cc_answer_item_award(1);
	end
	--答对了
	CC_ACTIVITY_TASK_GROUP:SetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.CON_TAG, 0);
	--继续答题
	cc_answer_continue(nAnswerTimes);
end

function cc_answer_question_fail()
	local nAnswerTimes = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.ANSWER_TIMES) + 1;
	CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.ANSWER_TIMES, nAnswerTimes);
	--答错了
	CC_ACTIVITY_TASK_GROUP:SetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.CON_TAG, 1);
	--失败奖励
	gf_Modify("Exp", 2500);
	--继续答题
	Say(CC_NPC.."<color=red> th藅 ng ti誧, ngi tr� l阨 sai r錳 ! <color>", 2, "Ti誴 t鬰 tr� l阨/#cc_answer_continue("..nAnswerTimes..")", "ьi m閠 l竧 r錳 n鉯 nh�/nothing");
end

function cc_answer_continue(nAnswerTimes)
	if nAnswerTimes < CC_ANSWER_TIMES then
		cc_answer_question();
	else
		Talk(1, "", "S� l莕 tr� l阨 c﹗ h醝 h玬 nay  s� d鬾g h誸, ng祔 mai h穣 ti誴 t鬰.");	
	end
end

function cc_answer_item_award(nKind)
	local tAward = {
		[1] = {
			{1, 85, "L玦 T�", {2, 1, 30505, 1}, 0},
			{1, 15, "L筩 Hoa Quy誸", {2, 1, 30506, 1}, 0},
		},	
		[2] = {
			{1, 75, "L玦 T�", {2, 1, 30505, 1}, 0},
			{1, 25, "L筩 Hoa Quy誸", {2, 1, 30506, 1}, 0},
		},	
		[3] = {
			{1, 70, "L玦 T�", {2, 1, 30505, 1}, 0},
			{1, 25, "L筩 Hoa Quy誸", {2, 1, 30506, 1}, 0},
			{1, 5, "Linh Mi猽 V薾", {2, 1, 30507, 1}, 0},
		},
	}
	cc_card_award_func({tAward, nKind, nKind, "Ki課 th鴆 v蕁 p"});
end

function cc_get_award(nKind)
	--活动时间
	if cc_activity_isopen() ~= 1 then
		Talk(1,"","Event v蒼 ch璦 kh雐 ng");
		return 0;
	end
	--参数错误
	if nKind < 1 and nKind > 3 then return 0; end
	--参与条件
	if gf_CheckBaseCondition(CC_PLAYER_LEVEL_MIN) ~= 1 then
		return 0;
	end
	--背包空间
	if GetFreeItemRoom() < 5 then
		Talk(1,"","Kh玭g gian h祅h trang kh玭g ");
		return 0;
	end
	if gf_Judge_Room_Weight(5, 50, "") ~= 1 then
		Talk(1,"","H祅h trang ho芻 s鴆 l鵦 kh玭g , vui l遪g s緋 x誴 l筰.")
		return 0;
	end
	--扣除物品
	local tItemDel = {
		[1] = {
			{2,	1, 30505, 1, "L玦 T�"},	
		},
		[2] = {
			{2,	1, 30505, 1, "L玦 T�"},
			{2,	1, 30506, 1, "L筩 Hoa Quy誸"},
		},
		[3] = {
			{2,	1, 30505, 1, "L玦 T�"},
			{2,	1, 30507, 1, "Linh Mi猽 V薾"},
		},
	}
	for i = 1, getn(tItemDel[nKind]) do 
		if GetItemCount(tItemDel[nKind][i][1], tItemDel[nKind][i][2], tItemDel[nKind][i][3]) < tItemDel[nKind][i][4] then
			Talk(1,"",format("Trong h祅h trang kh玭g c�  %s", tItemDel[nKind][i][5]));
			return 0;
		end
	end
	for i = 1, getn(tItemDel[nKind]) do
		if DelItem(tItemDel[nKind][i][1], tItemDel[nKind][i][2], tItemDel[nKind][i][3], tItemDel[nKind][i][4]) ~= 1 then
			return 0;
		end
	end
	--给经验奖励
	local tExpAward = {
		[1] = 10000,
		[2] = 150000,
		[3] = 300000,	
	}
	gf_Modify("Exp", tExpAward[nKind]);
	--上交次数
	if nKind == 2 then
		local nCard2Times = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.CARD2_TIMES) + 1;
		if nCard2Times > CC_CARD2_MAX then
			return 0;
		end
		CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.CARD2_TIMES, nCard2Times)
		--给一个资料礼包
		local nCount = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.ZLPPARK_COUNT);
		if mod(nCard2Times, 100) == 0 and nCount < CC_ZLP_PARK_MAX then
			gf_AddItemEx2({2, 1, 30540, 1}, "L� Bao Phi猲 B秐 M韎", CC_LOG_TITLE, "Giao n閜 Th� L玦 T� + Th� L筩 Hoa Quy誸 nh薾 thng ", 0, 1);
			CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.ZLPPARK_COUNT, nCount+1);
		end
		 gf_WriteLogEx(CC_LOG_TITLE, "n閜 th祅h c玭g", 1, "N閜 L玦 T� + Hoa Quy誸 l莕 th� "..nCard2Times)
	end
	if nKind == 3 then
		local nCard3Times = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.CARD3_TIMES) + 1;
		CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.CARD3_TIMES, nCard3Times)
		--给一个新资料片礼包
		if mod(nCard3Times, 100) == 0 then
			gf_AddItemEx2({2, 1, 30540, 1}, "L� Bao Phi猲 B秐 M韎", CC_LOG_TITLE, "Giao n閜 Th� L玦 T� + Th� Linh Mi猽 V薾 nh薾 thng", 0, 1);
		end
		--给一个天罡礼包
		if mod(nCard3Times, 100) == 0 and mod(nCard3Times / 100, 2) == 0 then
			gf_AddItemEx2({2, 1, 30508, 1}, "L� bao Thi猲 Cang L謓h", CC_LOG_TITLE, "Giao n閜 Th� L玦 T� + Th� Linh Mi猽 V薾 nh薾 thng", 0, 1);
		end
		--给一个天门金令礼包
		if mod(nCard3Times, 100) == 0 and mod(nCard3Times / 100, 3) == 0 then
			gf_AddItemEx2({2, 1, 30509, 1}, "L� bao Thi猲 M玭 Kim L謓h", CC_LOG_TITLE, "Giao n閜 Th� L玦 T� + Th� Linh Mi猽 V薾 nh薾 thng", 0, 1);
		end
		gf_WriteLogEx(CC_LOG_TITLE, "n閜 th祅h c玭g", 1, "N閜 L玦 T� + Linh Mi猽 l莕 th� "..nCard3Times)
	end
	local tAwardTable = CC_CARD_AWARD[nKind];
	if tAwardTable then 
		gf_EventGiveRandAward(tAwardTable, gf_SumRandBase(tAwardTable), 1, CC_LOG_TITLE, "Giao n閜 Th� B礽 nh薾 thng",nil,1);
	end
end
---------------------------------------------------
function cc_tmz_award_succ()
	local tAward = {
		[1] = {
			{1, 80, "L玦 T�", {2, 1, 30505, 1}, 0},
			{1, 15, "L筩 Hoa Quy誸", {2, 1, 30506, 1}, 0},
			{1, 5, "Linh Mi猽 V薾", {2, 1, 30507, 1}, 0},
		},
	}
	cc_card_award_func({tAward, 1, 3, "Thi猲 M玭 tr薾"});
end


function cc_tmz_award_fail()
	local tAward = {
		[1] = {
			{1, 80, "L玦 T�", {2, 1, 30505, 1}, 0},
			{1, 20, "L筩 Hoa Quy誸", {2, 1, 30506, 1}, 0},
		},
	}
	cc_card_award_func({tAward, 1, 1, "Thi猲 M玭 tr薾"});
end

function cc_wjz_award(nStep)
	local tTemp = {1,1,2,3};
	if not tTemp or not tTemp[nStep] then return 0; end
	cc_card_award_func({CC_COPY_AWARD[1], nStep, tTemp[nStep], "V筺 Ki誱 Tr騨g"});
end

function cc_ttd_award(nStep)
	local tTemp = {1,1,2,2,3,3,4};
	if not tTemp or not tTemp[nStep] then return 0; end
	cc_card_award_func({CC_COPY_AWARD[2], nStep, tTemp[nStep], "Th玭g Thi猲 Huy詎 C秐h"});
end

function cc_ls_award(nStep)
	local tTemp = {1,1,1,1,1,1};
	if not tTemp or not tTemp[nStep] then return 0; end
	cc_card_award_func({CC_COPY_AWARD[3], nStep, tTemp[nStep], "C鯽 秈 Lng S琻 "});
end
-------------------------------------------------------
--Relay刷怪
function cc_relay_call_boss(nRandomSeed)
	if cc_activity_isopen() ~= 1 then
		return 0;
	end
	if not nRandomSeed then return 0; end
	randomseed(nRandomSeed);
	local nNpcIndex = random(getn(CC_BOSS_INFO));
	local nMapIndex = random(getn(CC_MAP_ID));
	if not CC_MAP_ID[nMapIndex] then  return 0; end
	local tRandPos = CC_RAND_POS[CC_MAP_ID[nMapIndex][1]];
	if not tRandPos then return 0; end
	local nRandPos = random(getn(tRandPos));
	--广播
	local strMsg = format("BOSS mang Ho祅g Kim B秓 B鑙 %s xu蕋 hi謓 t筰 %s, c竎 v� anh h飊g nhanh ch鉵g 甶 khi猽 chi課!", CC_BOSS_INFO[nNpcIndex][2], CC_MAP_ID[nMapIndex][2]);
	Msg2Global(strMsg);
	AddLocalNews(strMsg);
	--这个地图不在这个服务器就不刷
	if SubWorldID2Idx(CC_MAP_ID[nMapIndex][1]) == -1 then
		return 0;
	end
	--刷NPC
	local npcIdx = CreateNpc(CC_BOSS_INFO[nNpcIndex][1], CC_BOSS_INFO[nNpcIndex][2], CC_MAP_ID[nMapIndex][1], tRandPos[nRandPos][1], tRandPos[nRandPos][2]);
	if npcIdx > 0 then
		SetNpcDeathScript(npcIdx, "\\script\\online\\collect_card\\cc_boss_death.lua");
		SetNpcLifeTime(npcIdx, 60*30);
	end
end

function cc_get_allow_tag()
	--跨天清理
	cc_daily_clear();
	local strTime = tonumber(date("%H%M"));
	if strTime >= 0830 and strTime < 1230 then
		return CC_ACTIVITY_TASK_GROUP:GetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_1);
	elseif strTime >= 1230 and strTime < 1730 then
		return CC_ACTIVITY_TASK_GROUP:GetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_2);
	elseif strTime >= 1730 and strTime < 2230 then
		return CC_ACTIVITY_TASK_GROUP:GetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_3);
	elseif strTime > 2230 and strTime < 2359 then
		return CC_ACTIVITY_TASK_GROUP:GetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_4);
	end  
end

function cc_set_allow_tag()
	--跨天清理
	cc_daily_clear();
	local strTime = tonumber(date("%H%M"));
	if strTime >= 0830 and strTime < 1230 then
		CC_ACTIVITY_TASK_GROUP:SetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_1, 1);
	elseif strTime >= 1230 and strTime < 1730 then
		CC_ACTIVITY_TASK_GROUP:SetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_2, 1);
	elseif strTime >= 1730 and strTime < 2230 then
		CC_ACTIVITY_TASK_GROUP:SetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_3, 1);
	elseif strTime > 2230 and strTime < 2359 then
		CC_ACTIVITY_TASK_GROUP:SetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_4, 1);
	end
end

function cc_box_award()
	--活动时间
	if cc_activity_isopen() ~= 1 then
		Talk(1,"","Event v蒼 ch璦 kh雐 ng");
		return 0;
	end
	--参与条件
	if gf_CheckBaseCondition(CC_PLAYER_LEVEL_MIN) ~= 1 then
		return 0;
	end
	--背包空间
	if GetFreeItemRoom() < 5 then
		Talk(1,"","Kh玭g gian h祅h trang kh玭g ");
		return 0;
	end
	if gf_Judge_Room_Weight(5, 50, "") ~= 1 then
		Talk(1,"","H祅h trang ho芻 s鴆 l鵦 kh玭g , vui l遪g s緋 x誴 l筰.")
		return 0;
	end	
	if cc_get_allow_tag() ~= 1 then
		cc_set_allow_tag();
		--Exp
		gf_Modify("Exp", 100000);
		--Item
		local nIndex = gf_GetRandItemByTable(CC_BOX_AWARD, gf_SumRandBase(CC_BOX_AWARD), 1);
		if tostring(CC_BOX_AWARD[nIndex][3]) == "Linh Mi猽 V薾" then
			local nTimes= CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.BOX_AWARD_CARD);
			if nTimes >= CC_BOX_MAX_LM_CARD then
				nIndex = random(1, max(1, nIndex-1));
			else
				CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.BOX_AWARD_CARD, nTimes + CC_BOX_AWARD[nIndex][4][4]);
			end
		end
		gf_EventGiveRandAward(CC_BOX_AWARD, gf_SumRandBase(CC_BOX_AWARD), 1, CC_LOG_TITLE, "Ho祅g Kim B秓 B鑙", nIndex);
	else
		Talk(1,"","Ngi  nh薾 ph莕 thng r錳, kh玭g th� nh薾 th猰 n鱝.");	
	end
end

function cc_card_award_func(t)
	if cc_activity_isopen() ~= 1 then
		return 0;
	end
	--t = {tAward, nKind, nCount, log_title};
	if not t or type(t) ~= "table" or getn(t) ~= 4 then
		return 0;
	end
	if gf_CheckBaseCondition(80,1) ~= 1 then
		return 0;
	end
	local tAward = t[1];
	local tAwardSub = tAward[t[2]];
	if not tAwardSub then  return 0; end
	for i = 1, t[3] do
		if GetFreeItemRoom() < 1 then
			Msg2Player("Kh玭g gian kh玭g  kh玭g th� nh薾 l蕐 Th� T�");
			return 0;
		end
		if gf_Judge_Room_Weight(5, 50, "") ~= 1 then
			Msg2Player("Kh玭g gian kh玭g  kh玭g th� nh薾 l蕐 Th� T�");
			return 0;
		end	
		
		local nIndex = gf_GetRandItemByTable(tAwardSub, gf_SumRandBase(tAwardSub), 1);
		if tostring(tAwardSub[nIndex][3]) == "Linh Mi猽 V薾" then
			local nTimes= CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.BOX_AWARD_CARD);
			if nTimes >= CC_BOX_MAX_LM_CARD then
				nIndex = random(1, max(1, nIndex - 1));
			else
				CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.BOX_AWARD_CARD, nTimes + tAwardSub[nIndex][4][4]);
			end
		end
		gf_EventGiveRandAward(tAwardSub, gf_SumRandBase(tAwardSub), 1, CC_LOG_TITLE, t[4], nIndex);
	end
end


