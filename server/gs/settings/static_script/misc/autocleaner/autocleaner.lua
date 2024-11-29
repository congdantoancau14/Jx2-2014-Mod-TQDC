--越南版废弃脚本
-- autocleaner.lua

Include("\\script\\class\\mem.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\lib\\task_id_manage.lua")
Include("\\script\\lib\\time.lua")
Include("\\script\\pop\\daily_clear.lua");
Include("\\script\\newbattles\\head.lua")
Include("\\script\\missions\\kfyp\\online\\daily_clear.lua")

AutoCleanerBase = {
	taskList = {
		1,
	},
	interval = nil,
	taskid_LastDate = nil,
}

function AutoCleanerBase:clean(bForce)
	local nDiffDate = self:checkDate();
	if nDiffDate > 0 or bForce == 1 then
		for k, task in self.taskList do
			self:resetTask(task, nDiffDate);
		end
	end
end
function AutoCleanerBase:checkDate()
	if not self.interval or not self.taskid_LastDate then return end
	local nDate = self:getDate();
	local nLastDate = GetTask(self.taskid_LastDate);
	if nDate - nLastDate >= self.interval then
		SetTask(self.taskid_LastDate, nDate);
		return nDate - nLastDate;
	end
	return 0;
end
function AutoCleanerBase:resetTask(task, nDiffDate)
	local taskp = type(task);
	if taskp == "number" then
		SetTask(task, 0);
	elseif taskp == "function" then
		task(nDiffDate);
	elseif taskp == "table" then
		SetTask(task[1], task[2]);
	else
		print("[AutoCleanerBase:resetTask] [Error task type] [task=%s]", tostring(task));
	end
end

-------------------------------------------------------
cleaner_TaskMgr = {
	taskList = { 
		{tCamp_2011_DragonBoat, {1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,19,21,}},
		{tCamp_CallBack, {1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9,10,11,12,45,48}},
		{tCamp_GoodWine,{5,6,7}},
		{tCamp_201110,{1,2,3}},
		{tCamp_201111,{1,2,3,4,}},
		{tCamp_Oscar,	{1,2}},
		{tCamp_2012_SF,{5,8,27,28,29,30,49 ,54,56,58,59,60}},
		{tCamp_2012_0501,{3}},
		{tCamp_2012_CM, {21, }},
		{tCamp_2012_DW, {27, }},
		{tCamp_2012_SM, {27, }},
		{tCamp_2012_08, {2,}},
		{tCamp_2012_09, {1,2,4,}},
		{tCamp_2012_10, {1,}},
		{tCamp_2012_11, {2,3,4,5,6,7,10,}},
		{tCamp_2012_12,	{2,3,45,}},
		{tCamp_2013_01, {1,10,11,22,}},
		{tCamp_2013_02, {2,4,}},
		{tCamp_2013_0305, {1,}},
		{tCamp_2013_03, {2,4,7,8,9,11,19,}},
		{tCamp_2013_04, {5,26}},
		{tCamp_2013_05, {2,3,38,46}},
		{tCamp_2013_06, {32}},
		{tCamp_2013_07, {3,9,11,12,18}},
		{tCamp_2013_zlp, {30, }},
		{tCamp_2013_08, {2, 3, 5}},
		{tCamp_2013_09, {2, 4, 6, 60}},
		{tCamp_2013_10, {3, 4, 5, 6, 7, 8,}},
		{tCamp_2013_11, {2, 3, 5, 8,}},
		{tCamp_2013_12, {3, 4, 5, 6, 7, 8, 9,}},
		{tCamp_2014_01, {6,7,8,}},
		{tCamp_2014_02, {3, 4, 5, 6, 7, 8, 13, 14}},
		{tCamp_2014_03, {2, }},
		{tCamp_2014_05, {2, 3, 4, 5, 6, 7, 8, 9, 10, 11}},
		{tCamp_2014_06, {17,}},
		{tCamp_2014_07, {1,2,4,11,12,13,14,15,16,17,48,49,50,51,54,55,56,57}},
		{tCamp_2014_08, {10, 11, 12, 13}},
		{tCamp_2014_09, {1, 2, 3, 4, 5, 8, 12, 14, 16}},
		{tCamp_2014_10, {3, 4, 5, 6, 7, 8,}},
		{tCamp_treasure_legend_14_10, {25, }},
	}
}
function cleaner_TaskMgr.resetTask()
	self = cleaner_TaskMgr
	for i = 1, getn(self.taskList) do
		local camp = self.taskList[i][1];
		if camp then
			if camp:CheckCampDate() == 1 then
				local tasks = self.taskList[i][2];
				if type(tasks) == "number" then
					tasks = {tasks};
				end
				for k = 1, getn(tasks) do
					local realTask = camp:getRealTaskId(tasks[k]);
					SetTask(realTask, 0);
				end
			end
		end
	end
end
function cleaner_TaskMgr:registerCampTask(campID, campTasks)
	print("cleaner_TaskMgr:registerCampTask", campID, Val2Str(campTasks));
	if not campID then return crash() end
	if type(campTasks) ~= "table" then return crash() end
	
	tinsert(self.taskList, {campID, campTasks});
end
--活跃度
function activity_clean_daily()
	for i = TASKID_ACTIVITY_FINISH_NUM_START,TASKID_ACTIVITY_FINISH_NUM_END do
		SetTask(i,0);
	end
	SetTask(TASKID_ACTIVITY_NUM,0);
	SetTask(TASKID_GET_ACTIVITY_AWARD,0);
	SendScript2VM("\\script\\misc\\activity\\activity_skip.lua", "get_skip_point_daily()");
end

function activity_clean_weekly()

end

--武魂斗魄
function soul_clean_weekly()
	local nBuLing = 0;
	local nLastWeekValue = 180 - GetTask(TASKID_SOUL_WEEK_VALUE);
	if nLastWeekValue  > 0 then
		nBuLing = nLastWeekValue;
	end
	local nWeekNum = AutoCleanerWeekly:getDate();
	local nCurWeek = GetTask(TASKID_SOUL_BULING_WEEK);
	if nCurWeek ~= 0 then
		if nCurWeek < nWeekNum then
			local nDiff = nWeekNum - nCurWeek;
			nBuLing = (nDiff - 1)*180 + nBuLing;
		end
	end
	if nBuLing > 0 then
		SetTask(TASKID_SOUL_BU_LING,GetTask(TASKID_SOUL_BU_LING)+nBuLing);
	end
	SetTask(TASKID_SOUL_BULING_WEEK,nWeekNum);
	SetTask(TASKID_SOUL_WEEK_VALUE,0);
end
function fight_ai_weekly(nDiffWeek)
	local nPower = GetTask(TASKID_FIGHT_AI_POWER);
	if nPower > 200 then
		nPower = max(200, floor(nPower * ((3/4)^nDiffWeek)));
		SetTask(TASKID_FIGHT_AI_POWER, nPower);
	end
end
function av_checkPeriod()
		SendScript2VM("\\script\\online\\new_group_activities\\expert_mode\\alive_value.lua", "av_checkPeriod()");
end

AutoCleanerDaily = {
	interval = 1,
	taskid_LastDate = TASKID_AUTOCLEANER_LASTDATE_DAILY,
	taskList = {
		TASKID_0911_KILL_BOSS,
		TASKID_LIANGSHAN_AWARD_TIMES_DAILY,
		TASKID_WHITE_TIGER_BLESS_DAILY,
		TASKID_TIGER_BLESS_DAILY,
		TASKID_2010_PCB_DAILAY_FINISH_FLAG,
		TASKID_2010_PCB_DAILY_TASK_FLAG_1,
		TASKID_2010_PCB_DAILY_TASK_FLAG_2,
		TASKID_DIXUANGONG_DAILY_BOSS1,
		TASKID_DIXUANGONG_DAILY_BOSS2,
		TASKID_DIXUANGONG_DAILY_BOSS3,
		TASK_GT_GET_FRIENDLY_DAILY,
		TASK_MJ_OPEN_PACKAGE,
		TASKID_QIFU_TITLE_NUM,
		TASKID_WULIN_CRAFT_VOTE_DAILY,
		TASKID_WULIN_CRAFT_VOTE_TOTAL,
		TASKID_WUCAISHENGQI_TIMES,
		TASKID_2010_FIFA_FLAG_DAILY,
		TASKID_DXG_DAILY_TASK,
		TASKID_NORMAL_VOTE_DAILY,
		TASKID_QIXI_NPC_GETMEIGUI,
		TASKID_QIXI_NPC_GETDAILY,
		TASKID_QIXI_NPC_KILLBOSS,
		TASKID_QIXI_NPC_KILLAWARD,
		TASKID_3F_GET_TUZHI,
		TASKID_3F_ZQ_BOX_NUM,
		TASKID_3F_CHANGE_EXP_NUM,
		TASKID_MAIL_SEND_COUNT,
		TASK_FIELD_PVP_CAR_TASK,
		TASK_FIELD_PVP_CAR_DAILY_NUM,
		TASK_FIELD_PVP_CAR_BIAOLING,
		TASK_JZMY_DAYLY_FINISH,
		cleaner_TaskMgr.resetTask,		-- 清理任务管理器里面的变量
		OnPopDailyClear,							-- 清理声望任务
		activity_clean_daily,					-- 清理活跃度相关变量
		TASKID_NVN_WIN_TIMES_DAILY,
		TASKID_NVN_LOSS_TIMES_DAILY,
		TASKID_NVN_AWARD_DAILY1,
		TASKID_NVN_AWARD_DAILY2,
		TASKID_NVN_AWARD_DAILY3,
		TASK_FIELD_PVP_FIREBOX_NUM,
		TASKID_SF_LMJS_TITLE_EXP_COUNT,
		TASKID_ZXFC_TITLE_COUNTS,
		TASKID_PENGLAIXIANYAO_TIME,
		TASKID_TITLE_DSMS,
		TASKID_CAMP201205_DICE_USE_COUNT,
		TASKID_TITLE_CM,
		TM_CM_PROBLEM_ANSWERED,
		TASKID_CHOUJIANG_COUNT_DAILY,
		TASKID_KL_POINT_DAILY,
		TASKID_KL_TMZ_DAILY,
		TASKID_SOUL_LING_USE_NUM,
		TASKID_3V3_TOTAL_ROUND_DAILY	, -- = 3630;		-- 每日总场
		TASKID_3V3_SCORE_DAILY			, -- = 3636;		-- 每日积分
		TASKID_3V3_KILL_DAILY			, -- = 3644;		-- 每日人头
		TASKID_3V3_DEAD_DAILY           , -- = 3646;		-- 每日死亡
		TASKID_3V3_ESCAPE_DAILY			, -- = 3649;		-- 每日逃跑
		TASKID_3V3_FIGHTTEAM_WIN_DAILY	,
		TASKID_3V3_WIN_ROUND_DAILY		,
		TASKID_PTTQ_TITLE_EXP_COUNT,
		TASKID_LUCKYBOX_USED_FREE_COUNT,
		TASKID_YINQUAN_DAILY_TASK,		--银券每日任务
		TASKID_YINQUAN_JINGMAI_BUYNUM,
		TASKID_LEVEL_GUESS_USED_TICKET,
		TASKID_NST_WELFARE,
		TASKID_2013_RANDOM_POP_TASK_FLAG1,
		TASKID_2013_RANDOM_POP_TASK_FLAG2,
		TASKID_JDYY_DAILY_TIME,
		TASKID_FIGHT_AI_DAILY_COUNT,
		TASKID_GUSHISHINU_BUY_COUNT_1,
		TASKID_GUSHISHINU_BUY_COUNT_2,
		TASKID_GUSHISHINU_BUY_COUNT_3,
		TASKID_GUSHISHINU_BUY_COUNT_4,
		TASKID_GUSHISHINU_BUY_COUNT_5,
		TASKID_GUSHISHINU_BUY_COUNT_6,
		TASKID_GUSHISHINU_BUY_COUNT_7,
		TASKID_GUSHISHINU_BUY_COUNT_8,
		TASKID_JDYY_DAILY_TIME_NORMAL,
		TASKID_JDYY_DAILY_TIME_HARD,
		TASKID_JDYY_DAILY_TIME_ZUOBI,
		TASKID_JDYY_HARD_CARD_TIME_BOSS_1_DAILY,
		TASKID_JDYY_HARD_CARD_TIME_BOSS_2_DAILY,
		TASKID_JDYY_HARD_CARD_TIME_BOSS_3_DAILY,
		TASKID_JDYY_HARD_CARD_TIME_BOSS_4_DAILY,
		TASKID_JDYY_HARD_CARD_TIME_BOSS_5_DAILY,
		TASKID_JDYY_NORMAL_CARD_TIME_BOSS_1_DAILY,
		TASKID_JDYY_NORMAL_CARD_TIME_BOSS_2_DAILY,
		TASKID_JDYY_NORMAL_CARD_TIME_BOSS_3_DAILY,
		TASKID_JDYY_NORMAL_CARD_TIME_BOSS_4_DAILY,
		TASKID_JDYY_NORMAL_CARD_TIME_BOSS_5_DAILY,
		TASKID_TUIRENGGUANYUAN_0720_DAILY,
		TASKID_JZMY_ENTER_LIMIT,				-- 剑冢魔影
		TASKID_LS_ENTER_LIMIT,					-- 梁山
		TASKID_DXG_ENTER_LIMIT,					-- 地玄宫
		TASKID_TTD_ENTER_LIMIT,					-- 通天顶
		TASKID_TY_NORMAL_ENTER_LIMIT,		-- 太一普通
		TASKID_TY_HERO_ENTER_LIMIT,			-- 太一英雄
		TASKID_FTL_NORMAL_ENTER_LIMIT,		-- 梵天林普通
		TASKID_FTL_HERO_ENTER_LIMIT,		-- 梵天林英雄
		TASKID_KFYP_TONG_DAILY_AWARD,		-- 跨服野P,每日奖励
		TASKID_KFYP_TONG_DAILY_DONATE,		--
		OnXiakelingDailyClear,				-- 侠客令，每日任务
		TASKID_ACTIVITY_SKIP_BUY_COUNT,	--购买轻松点数次数
		-- 生存值
		TASKID_ALIVE_VALUE_ADDON_DAILY,
		TASKID_ALIVE_VALUE_FLAG_DAILY,
		TASKID_ALIVE_VALUE_KFYP_ADDON,
		av_checkPeriod,
		--新天门阵奖励
		TASKID_TMZ_AWARD_LEVEL_1, --天门阵获得1等奖次数
		TASKID_TMZ_AWARD_LEVEL_2, --天门阵获得2等奖次数
		TASKID_TMZ_AWARD_LEVEL_3, --天门阵获得3等奖次数
		TASKID_TMZ_AWARD_LEVEL_4, --天门阵获得4等奖次数
		TASKID_TMZ_AWARD_LEVEL_5, --天门阵获得5等奖次数
		TASKID_TMZ_RECEIVED_MERIDIAN,    --天门阵已领取的璀璨脉气数
		TASKID_TMZ_RECEIVED_SOUL_TICKET, --天门阵已领取的斗魄令数
		TASKID_TMZ_RECEIVED_SKILL_STONE, --天门阵已领取的技能石
		TASKID_TMZ_RECEIVED_MARK_POINT,  --天门阵已领取的天门阵积分
		TASKID_TMZ_RECEIVED_YINQUAN,     --天门阵已领取的银券
		TASKID_TMZ_RECEIVED_POPULARITY,  --天门阵已领取的声望
		TASKID_TMZ_RECEIVED_SYJY,        --天门阵已领取的授业点数
		TASKID_TMZ_RECEIVED_GOLD,        --天门阵已领取的金币
		TASKID_TMZ_RECEIVED_EXP,         --天门阵已领取的经验
		TASKID_TMZ_HUFU_USED_NUM,
		TASKID_TODAY_LASTLOGOUT_PALYED_TIME,
		TASKID_GET_ONLINE_AWARD_FLAG,
		TASKID_ONLINE_AWARD_VALID_TIME
	},
}
AutoCleanerDaily = inherit(AutoCleanerBase, AutoCleanerDaily)
function AutoCleanerDaily:getDate()
	return tonumber(date("%y%m%d"));
end
function AutoCleanerDaily:registerTask(tasks)
	print("AutoCleanerDaily:registerTask", Val2Str(tasks));
	for i = 1, getn(tasks) do
		tinsert(self.taskList, tasks[i]);
	end
	self.taskList.n = nil;
end
function AutoCleanerDaily:registerCallback(szScript, szCallback)
	tinsert(self.taskList, callout(SendScript2VM, szScript, szCallback));
end
-------------------------------------------------------
AutoCleanerWeekly = {
	interval = 1,
	taskid_LastDate = TASKID_AUTOCLEANER_LASTDATE_WEEKLY,
	taskList = {
		TASK_GT_WEEK_FINISH_NUM,
		TASK_FIELD_PVP_GXD_WARD,
--		activity_clean_weekly,				-- 清理活跃度相关变量
		TASKID_KL_TOTAL_POINT,
		TASKID_KL_PVP_POINT,
		TASKID_KL_PVE_POINT,
		TASKID_KL_PERSON_POINT,
		soul_clean_weekly,							--武魂斗魄
		TASKID_YINQUAN_BIWU_WIN_STATE,	--银券比武大会
		TASKID_YINQUAN_BIWU_LOSE_STATE,	--银券比武大会
		TASKID_YINQUAN_PVP_WEEK_NUM,
		TASKID_YINQUAN_PVE_WEEK_NUM,
		TASKID_YINQUAN_ZG_WEEK_NUM,
		TASKID_YINQUAN_GC_WEEK_NUM,
		TASKID_YINQUAN_CAMP_WEEK_NUM,
		TASKID_FIGHT_AI_WINNING_WEEKLY,
		TASKID_FIGHT_AI_TOTAL_WEEKLY,
		TASKID_KFYP_KILL_GUARD_AWARD_TIMES		,	--= 4051
		TASKID_KFYP_KILL_RESOURCE_AWARD_TIMES	,	--= 4052
		TASKID_KFYP_TONG_GIFT_USE_COUNT,
	},
}
AutoCleanerWeekly = inherit(AutoCleanerBase, AutoCleanerWeekly)
function AutoCleanerWeekly:getDate()
	return tf_GetWeekSequence(1,0);
end

-------------------------------------------------------
AutoCleanerMonthly = {
	interval = 1,
	taskid_LastDate = TASKID_AUTOCLEANER_LASTDATE_MONTHLY,
	taskList = {
	},
}
AutoCleanerMonthly = inherit(AutoCleanerBase, AutoCleanerMonthly)
function AutoCleanerMonthly:getDate()
	return tonumber(date("%Y%m"));
end

-------------------------------------------------------
AutoCleanerCommittee = {
	cleaners = {
		AutoCleanerDaily,
		AutoCleanerWeekly,
		AutoCleanerMonthly,
	}
}
function AutoCleanerCommittee:clean()
	for k,cleaner in self.cleaners do
		cleaner:clean();
	end
end
function AutoCleanerCommittee:forceClean()
	for k,cleaner in self.cleaners do
		cleaner:clean(1);
	end
end

-------------------------------------------------------
