-----------------------------------------------------------------------
-- 剑侠情缘 II 师门任务
-- 2006/05/16
-- Created by Tony(Jizheng)
-----------------------------------------------------------------------

-- 表格文件类的支持以及地图跳转的支持
Include("\\script\\task\\random\\task_gotoworld.lua");
-- 辉煌之夜头文件
Include("\\script\\shinynight_head.lua");
Include("\\script\\lib\\lingshi_head.lua");
--2006年圣诞节活动奖励支持
Include("\\script\\online\\zgc_temp_fun.lua")
--2007年圣诞活动
Include("\\script\\online\\newyear08\\newyear08_head.lua");
--2009年6月7月活动
Include("\\script\\online\\viet_event\\200907\\event_head.lua");
--越南09年7月活动开关头文件
Include("\\script\\online\\viet_event\\200907\\eventopen.lua");
Include("\\script\\lib\\writelog.lua");
--2009年8月活动
Include("\\script\\online\\viet_event\\200908\\viet0908_head.lua");
--2009年9月活动
Include("\\script\\online\\viet_event\\200909\\event_head.lua");
--2009年11月活动
Include("\\script\\online\\viet_event\\200911\\event_head.lua");
--2009年12月活动
Include("\\script\\online\\viet_event\\200912\\event_head.lua");

--从2010年开始越南师门任务得奖励统一在下面包含这个文件里面实现，然后在本文件里面调用，不用每次都修改这个文件
Include("\\script\\online_activites\\award.lua");--for Give_Faction_Award()
Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\vng\\award\\feature_award.lua");

--========================================================================

TT_COLLECT_ITEM = 1				-- 收集一定物品并且要求上交，来源是打怪掉落
TT_KILL_MONSTER = 2				-- 杀死一定数量的特定怪物
TT_UPGRAGE_ATTR = 3				-- 升级一定数值的特定属性（比如经验，声望，等级，PK值等等）
TT_SHOWOFF_ITEM = 4				-- 收集物品，但是来源就是商店
TT_SEND_MAIL = 5				-- 与某NPC对话

-- 任务变量记录表 -----------------------------------------------------------------------------
TASKVALUE_CUR_DATE_ID = 333			-- 当前师门任务处于的时间日期 YYYYMMDD，用于清除334变量数值
TASKVALUE_FACTION_CONTRI_CUR_DAY_ID = 334	-- 当天获得的师门贡献度存放的任务变量
TASKVALUE_DIFFICULT_LEVEL_ID = 335	-- 当前选择的师门任务的难度等级
TASKVALUE_FACTION_CONTRI_ID = 336	-- 师门贡献度存放的任务变量

-- 337 - 340 师门任务链用的任务变量
-- 341 - 344 商会任务链的任务变量

LAST_USE_DATE = 85			-- 师门令书上次使用的日期
MULTI_COUNT = 86			-- 当前加成倍数

TASKVALUE_FACTION_EVENT_ID = 345	-- 师门任务大事件的任务ID存放的任务变量
TASKVALUE_CUR_DAY_TIMES_ID = 346	-- 今天做了几次师门任务的纪录
-- 347 已经被用，师门任务需要杀怪的数量

TASKVALUE_LAST_CARD_CONTRIBUTE_ID = 348			-- 上次领取师门令牌时候的师门贡献度数值记录的任务变量
TASKVALUE_LAST_GET_EVENT_DATE_ID = 349			-- 上次领取师门大事件的时间段开始日期
TASKVALUE_GET_EVENT_TIMES_ID = 350				-- 本时间段内已经尝试领取师门大事件的次数
TASKVALUE_LAST_GET_EVENT_PRIZE_DATE_ID = 351	-- 上次领取师门大事件奖励的时间段开始日期
TASKVALUE_GET_EVENT_PRIZE_TIMES_ID = 352		-- 本时间段内已经尝试领取师门大事件奖励的次数

-- 任务变量记录表 end--------------------------------------------------------------------------

TASK_ID_SHAOLIN_SUJIA = 1		-- 少林俗家，三个难度就是 1 2 3
TASK_ID_SHAOLIN_CHANSENG = 4	-- 少林禅僧，三个难度就是 4 5 6
TASK_ID_SHAOLIN_WUSENG = 7		-- 少林武僧，三个难度就是 7 8 9

TASK_ID_DEFAULT_ROUTE = 10		-- 取消任务或者其他的只需要和商会任务区别开使用的任务链ID

TASK_ID_WUDANG_DAOJIA = 12		-- 武当道家，三个难度就是 12 13 14
TASK_ID_WUDANG_SUJIA = 15		-- 武当俗家，三个难度就是 15 16 17

TASK_ID_EMEI_FOJIA = 18			-- 峨嵋佛家，三个难度就是 18 19 20
TASK_ID_EMEI_SUJIA = 21			-- 峨嵋俗家，三个难度就是 21 22 23

TASK_ID_TANGMEN = 24			-- 唐门,三个难度就是 24 25 26

TASK_ID_GAIBANG_JINGYI = 27		-- 丐帮净衣, 三个难度就是 27 28 29
TASK_ID_GAIBANG_WUYI = 30		-- 丐帮污衣, 三个难度就是 30 31 32

TASK_ID_YANGMEN_QIANGQI = 33	-- 杨门枪骑, 三个难度就是 33 34 35
TASK_ID_YANGMEN_GONGQI = 36		-- 杨门弓骑, 三个难度就是 36 37 38

TASK_ID_WUDU_XIEXIA = 39		-- 五毒邪侠, 三个难度就是 39 40 41
TASK_ID_WUDU_GUSHI = 42			-- 五毒蛊师, 三个难度就是 42 43 44

TASK_ID_KUNLUN_TIANSHI = 45		-- 昆仑天师, 三个难度就是 45 46 47

TASK_ID_CUIYAN_WUXIAN = 48		-- 翠烟舞仙, 三个难度就是 48 49 50
TASK_ID_CUIYAN_LINGNV = 51		-- 翠烟灵女, 三个难度就是 51 52 53

TASK_ID_MINGJIAO_SHENGZHAN = 54		-- 明教圣战, 三个难度就是 54 55 56
TASK_ID_MINGJIAO_XUEREN = 57		-- 明教血人, 三个难度就是 57 58 59
TASK_ID_MINGJIAO_ZHENBING = 60		-- 明教阵兵, 三个难度就是 60 61 62

--========================================================================


-- 师门任务的入口，nFactionRouteNo代表上面的玩家流派，选任务用的。
function task_main_entrance(nFactionRouteNo)
	if GetReputation() < 5 then
		Msg2Player("Ph秈 c� 甶觤 danh v鋘g t� 5 tr� l猲 m韎 c� th� nh薾 nhi謒 v� S� m玭!")
		return
	end
	local nTaskState = GetChainTaskStatus(nFactionRouteNo)
	-- 当前等级的声望限制
	local nFactionReputationLimit = 0;
	local nLevel = GetLevel()
	local nCurContriEEE = GetTask(TASKVALUE_FACTION_CONTRI_ID)	-- 当前师门贡献度
	local nCreateTime = GetCreateTime()
	
	-- 1150732800 是2006年6月20日，这个时间以前建立的角色都可以领取补偿
	if (nCreateTime < 1150732800) then
		if (nLevel < 60) then
			nFactionReputationLimit = 0
		elseif (nLevel < 70) then
			nFactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
			nFactionReputationLimit = floor(nFactionReputationLimit / 3)
		elseif (nLevel < 80) then
			nFactionReputationLimit = 1000
		else
			nFactionReputationLimit = 1500
		end
	end
	gf_WriteLogEx("Nhiem vu Su Mon", "tham gia")
	-- 还没有接过任务
	if (nTaskState == 0) then		
		if ((nCurContriEEE == 0) and (nFactionReputationLimit > 0) and GetTask(TASKVALUE_DIFFICULT_LEVEL_ID) == 0) then	-- 第一次接任务
			SetTask(TASKVALUE_FACTION_CONTRI_ID, nFactionReputationLimit)
			SetTask(TASKVALUE_LAST_CARD_CONTRIBUTE_ID, nFactionReputationLimit)
			Msg2Player("C╪ c� theo ng c蕄, ph莕 thng  c鑞g hi課 cho l莕 u l祄 nhi謒 v� s� m玭 l�"..nFactionReputationLimit.." 甶觤")
		end
		get_new_task(nFactionRouteNo)
		
	-- 已经接到任务但是还没有完成		
	elseif (nTaskState == 1) then	
		process_cur_task(nFactionRouteNo)
		
	-- 已经完成了上次接到的任务
	elseif (nTaskState == 2) then	
		get_next_task(nFactionRouteNo)
	end
end;



-- 玩家选择退出对话
function cancel_dialog()
end;



-- 选择了一个任务给玩家，已经加到身上了，玩家可以选择是做还是不做
function get_one_task(task_link_id)

	--		          年	       月	       日	       时	       分	       秒
	local nCurrTime = {date("%Y"), date("%m"), date("%d"), date("%H"), date("%M"), date("%S")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- 现在的日期
	local nLastTaskDate = GetTask(TASKVALUE_CUR_DATE_ID)					-- 上次接任务的日期
	
	if (nLastTaskDate < nCurDate) then
		SetTask(TASKVALUE_CUR_DATE_ID, nCurDate)			-- 设置新的日期
		SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, 0)		-- 清空当天获得的师门贡献度
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, 0)				-- 清空当天做了的师门任务次数
	end
	-- Modify by Trungbt
	local tbCheckType = {3, 6, 9, 12, 14, 17, 20, 23, 26, 29, 32, 35, 38, 41, 44}
	--Msg2Player("Gia tri check ID:  "..task_link_id)
	for i = 1, getn(tbCheckType) do
		if task_link_id == tbCheckType[i] then
			SetTask(TSK_CSD_ALLOW, 1)
			break
		end

	end
	------------------------

	-- 检查今天次数够了没有，够5次就不让继续做了 - Jeep tag 现在不检查了
	--local nCurDayTimes = GetTask(TASKVALUE_CUR_DAY_TIMES_ID)
	--if (nCurDayTimes >= 5) then
	--	Say("为师刚刚查看过了你做过的任务，今日你为师门奉献的贡献度已经足够。为师就不再派给你更多任务了，你还是明日再来吧！", 0)
	--	return
	--end

	-- 否则...
	-- 选取一个本流派的随机任务，并且返回任务类型
	local nTaskType = SelectRandomTask(task_link_id)
	SetTask(TASKVALUE_DIFFICULT_LEVEL_ID, task_link_id)
	
	-- 现在师门任务就是杀怪
	if (nTaskType == TT_KILL_MONSTER) then
		strAnswer = {"е t� ng �!/confirm_accept_task",
					 "е t� th鵦 l鵦 c遪 k衜,  luy謓 m閠 th阨 gian !/cancel_task"}

		-- 随机选择一个发任务的话，哈哈，策划填表会有蛮痛苦呀！ Amen.	
		local nSel = random(1, 3)
		local strTaskInfo = GetInfo(task_link_id, nSel)
		local strAnswer = {
			"е t� ng �!/confirm_accept_task",
			"е t� th鵦 l鵦 c遪 k衜,  luy謓 m閠 th阨 gian !/cancel_task",
		}
		Say(strTaskInfo, getn(strAnswer), strAnswer);
	end
end;



-- 确认接受师傅分配的任务，并且选择是否直接去任务所在地
function confirm_accept_task()
	local nMapIndex = tonumber(GetCurTaskLinkMapIndex(TASK_ID_DEFAULT_ROUTE));
	-- 在地图表中能够得到要去的地图
	if ((nMapIndex ~= 0) and (nMapIndex ~= nil)) then
		Say("Ngi nh薾 頲 1 nhi謒 v� s� m玭, mu鑞 n  kh玭g?",
			2,
			"Phi襫 s� ph� a  t� n n琲 l祄 nhi謒 v�!/#gotoWorld("..nMapIndex..")",
			" t� s� ph�! е t� s� t� 甶!/cancel_dialog");
	else
		TaskTip("B筺 nh薾 頲 1 nhi謒 v� s� m玭!");
	end
	Msg2Player("B筺 nh薾 頲 1 nhi謒 v� s� m玭!");
end;



-- 玩家确认要取消分配给自己的任务，进行扣除声望和清除任务的操作
function confirm_cancel_task()
	-- 师门贡献度足够扣就让他取消
	local nCurFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	if (nCurFactionContribute >= 5) then			
		-- 因为所有师门任务都是公用一段任务变量记录的
		-- 所以这里只要不是商会任务的11就可以了
		CleanTask(TASK_ID_DEFAULT_ROUTE)
		SetTask(TASKVALUE_FACTION_CONTRI_ID, nCurFactionContribute - 5)
		Say("Nhi謒 v�  h駓, b筺 c� th� nh薾 nhi謒 v� m韎.", 0);
		Msg2Player("B筺 b� t鎛 th蕋 5 甶觤 c鑞g hi課 do h駓 nhi謒 v�!");
		TaskTip("B筺 b� t鎛 th蕋 5 甶觤 c鑞g hi課 do h駓 nhi謒 v�!");
		SetTask(TSK_CSD_ALLOW,0)	-- Modify by Trungbt	
	-- 师门贡献度不够扣
	else
		CleanTask(TASK_ID_DEFAULT_ROUTE)
		SetTask(TASKVALUE_FACTION_CONTRI_ID, 0)
		Say("Nhi謒 v�  h駓, b筺 c� th� nh薾 nhi謒 v� m韎.", 0);
		Msg2Player("ч c鑞g hi課 gi秏 xu鑞g 0 do b筺  h駓 nhi謒 v�!");
	end
end;



-- 玩家要求取消分配给自己的任务，师傅会教育他是否愿意，因为会损失师门贡献度的
function cancel_task()
	Say("<color=yellow>H駓 b� nhi謒 v�<color> s� 秐h hng t韎 <color=yellow> c鑞g hi課 s� m玭<color>, ngi mu鑞 h駓 nhi謒 v� n祔 kh玭g?",
		2,
		"Nhi謒 v� n祔 ta kh玭g mu鑞 l祄!/confirm_cancel_task",
		"в ta suy ngh� l筰!/cancel_dialog");
end;

-- 玩家在执行任务中要求取消任务，师傅会给他再确认一次
function cancel_processing_task()
	Say("<color=yellow>H駓 b� nhi謒 v�<color> s� 秐h hng t韎 <color=yellow> c鑞g hi課 s� m玭<color>. Ngi mu鑞 h駓 b� th藅 �?",
		2,
		"Nhi謒 v� n祔 ta kh玭g mu鑞 l祄!/confirm_cancel_task",
		"Cho ta th猰 c� h閕!/cancel_dialog");
end;

-- 第一次接任务，玩家选择要做什么难度的任务
function get_new_task(nFactionRouteNo)
	task_link_id_low = nFactionRouteNo;
	task_link_id_middle = nFactionRouteNo + 1;
	task_link_id_high = nFactionRouteNo + 2;
	
	strTalk = {"Kh� l緈! в xem ngi gi髉 頲 g� cho s� m玭!",
			   "\n Nhi謒 v� s� c蕄 (Ph莕 thng kinh nghi謒 v�  c鑞g hi課)./#get_one_task("..task_link_id_low..")",
			   "\n Nhi謒 v� trung c蕄 (Ph莕 thng tu luy謓 v�  c鑞g hi課)./#get_one_task("..task_link_id_middle..")",
			   "\n Nhi謒 v� cao c蕄 (Ph莕 thng  c鑞g hi課)./#get_one_task("..task_link_id_high..")",
			   "\n е t� kh玭g th� m nh薾, c莕 ph秈 r蘮 luy謓 th猰!/cancel_dialog"}
	
	-- 按玩家的等级，能接到的任务的难度等级也有不同
	local nCurPlayerLevel = GetLevel()
	if (nCurPlayerLevel < 30) then
		Say(strTalk[1], 2, strTalk[2], strTalk[5]);
	elseif (nCurPlayerLevel < 60) then
		Say(strTalk[1], 3, strTalk[2], strTalk[3], strTalk[5]);
	else
		Say(strTalk[1], 4, strTalk[2], strTalk[3], strTalk[4], strTalk[5]);
	end
end;



-- 正在执行任务的时候和师傅对话
function process_cur_task(nFactionRouteNo)
		-- 获取该任务的地图 ID
		local nMapIndex = tonumber(GetCurTaskLinkMapIndex(TASK_ID_DEFAULT_ROUTE));
		
		local strTalk = {"Ngi l祄 xong nhi謒 v� vi s� giao ch璦?",
						 "Nh鱪g nhi謒 v� ta giao, ngi l祄 n u r錳?",
						 "Nh� s� ph� ki觤 tra s� nhi謒 v�  t�  l祄./faction_event_finish",
						 "Nhi謒 v� l藀 l筰 l莕 n祔  ho祅 th祅h!/confirm_finish_task",
						 "е t� k衜 c醝 kh玭g th� m nh薾, xin 頲 h駓 nhi謒 v�!/cancel_faction_event",
						 "е t� k衜 c醝 kh玭g th� m nh薾, xin 頲 h駓 nhi謒 v�!/cancel_processing_task",
						 "Xin s� ph� cho th猰 輙 th阨 gian, hi謓 ch璦 ho祅 th祅h/cancel_dialog"}
	
		if (GetTask(TASKVALUE_FACTION_EVENT_ID) == 0) then
			Say(strTalk[1], 3, strTalk[4], strTalk[6], strTalk[7]);
		else
			Say(strTalk[2], 5, strTalk[3], strTalk[4], strTalk[5], strTalk[6], strTalk[7]);
		end
end;



-- 师傅说你是否完成了任务，徒弟回答说已经完成了的
function confirm_finish_task()
	-- 察看是否已经完成了任务
	if GetReputation() < 5 then
		Msg2Player("Ph秈 c� 甶觤 danh v鋘g t� 5 tr� l猲 m韎 c� th� tr� nhi謒 v� S� m玭!")
		return
	end
	local nCurFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	local nCurTaskLinkID = GetTask(TASKVALUE_DIFFICULT_LEVEL_ID)	-- 当前难度等级
	local nTaskFinish = QueryTaskFinish(nCurTaskLinkID)
	local nFactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()	-- 当前等级的声望限制
	local nLevel = GetLevel();

	-- 辉煌之夜奖励翻倍的倍率
	local multiple = get_reward_multiple(SYS_MASTER_REPEATTASK)
	local nPerCent = floor(100 * multiple)				-- 奖励的百分比
	nBaseDayLimit = floor(nBaseDayLimit * multiple)
	nExtraDayLimit = floor(nExtraDayLimit * multiple)

	-- Modify by Trungbt
--	if GetTask(TSK_CSD_ALLOW) == 1 then
--		local nCSD_SuMon = mod(GetTask(TSK_CSD_COUNT_A), 1000)
--		if nCSD_SuMon < 300 and GetTask(TSK_CSD) == 1 then
--			SetTask(TSK_CSD_COUNT_A, GetTask(TSK_CSD_COUNT_A) + 1)
--		end
--		SetTask(TSK_CSD_ALLOW, 0)
--	end
	HoanThanhNhiemVuSuMon()
	------------------------------------

	local bExtra = 0;
	local nDayReputationLimit = nBaseDayLimit

	-- 检查玩家是否是高级任务难度	
	if ((nCurTaskLinkID == TASK_ID_SHAOLIN_SUJIA + 2) or
		(nCurTaskLinkID == TASK_ID_SHAOLIN_CHANSENG + 2) or
		(nCurTaskLinkID == TASK_ID_SHAOLIN_WUSENG + 2) or
		(nCurTaskLinkID == TASK_ID_WUDANG_DAOJIA + 2) or
		(nCurTaskLinkID == TASK_ID_WUDANG_SUJIA + 2) or
		(nCurTaskLinkID == TASK_ID_EMEI_FOJIA + 2) or
		(nCurTaskLinkID == TASK_ID_EMEI_SUJIA + 2) or
		(nCurTaskLinkID == TASK_ID_TANGMEN + 2) or
		(nCurTaskLinkID == TASK_ID_GAIBANG_JINGYI + 2) or
		(nCurTaskLinkID == TASK_ID_GAIBANG_WUYI + 2) or
		(nCurTaskLinkID == TASK_ID_YANGMEN_QIANGQI + 2) or
		(nCurTaskLinkID == TASK_ID_YANGMEN_GONGQI + 2) or
		(nCurTaskLinkID == TASK_ID_WUDU_XIEXIA + 2) or
		(nCurTaskLinkID == TASK_ID_WUDU_GUSHI + 2) or
		(nCurTaskLinkID == TASK_ID_KUNLUN_TIANSHI + 2) or
		(nCurTaskLinkID == TASK_ID_CUIYAN_WUXIAN + 2) or
		(nCurTaskLinkID == TASK_ID_CUIYAN_LINGNV + 2) or
		(nCurTaskLinkID == TASK_ID_MINGJIAO_SHENGZHAN + 2) or
		(nCurTaskLinkID == TASK_ID_MINGJIAO_XUEREN + 2) or
		(nCurTaskLinkID == TASK_ID_MINGJIAO_ZHENBING + 2)) then
		
		bExtra = 1
		nDayReputationLimit = nExtraDayLimit
	end

	--记录今天的时间，用来确认今天是否还可以领取师门贡献度
	--		          年	       月	       日	       时	       分	       秒
	local nCurrTime = {date("%Y"), date("%m"), date("%d"), date("%H"), date("%M"), date("%S")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- 现在的日期
	local nLastTaskDate = GetTask(TASKVALUE_CUR_DATE_ID)					-- 上次接任务的日期
	
	if (nLastTaskDate < nCurDate) then
		SetTask(TASKVALUE_CUR_DATE_ID, nCurDate)			-- 设置新的日期
		SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, 0)		-- 清空当天获得的师门贡献度
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, 0)				-- 清空当天做了的师门任务次数
	end

	if (nTaskFinish == 1) then
		local nCurDayTimes = GetTask(TASKVALUE_CUR_DAY_TIMES_ID) + 1
		if nCurDayTimes == 5 then	--第5次完成奖灵石配方
			local nPFLevel = 0;
			if nLevel < 30 then
				nPFLevel = 1
			elseif nLevel < 40 then
				nPFLevel = random(1,2);
			elseif nLevel < 50 then
				nPFLevel = random(1,3);
			elseif nLevel < 60 then
				nPFLevel = random(1,4);
			elseif nLevel < 80 then
				nPFLevel = random(1,5);
			elseif nLevel <= 100 then
				nPFLevel = random(2,5);
			end;
            if GetAntiEnthrallmentStatus() == 0 then
    			if nPFLevel ~= 0 then
    				lspf_AddPeiFangInBottle(nPFLevel,1);
    				Msg2Player("B筺 nh薾 頲 1 "..nPFLevel.."Ph鑙 ch� linh th筩h c蕄,  cho v祇 T� Linh nh");
                end;
			end;
		end;		
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, nCurDayTimes)	-- 更新今天已经做了的任务次数
		if get_chrims_state() == 1 then
			if nCurDayTimes == 1 or nCurDayTimes == 2 then
				local nRand1 = random(getn(tStrewTask)-9,getn(tStrewTask));
				local nRand2 = random(getn(tStrewTask)-9,getn(tStrewTask));
				AddItem(tStrewTask[nRand1][3],tStrewTask[nRand1][4],tStrewTask[nRand1][5],tStrewTask[nRand1][1]);
				AddItem(tStrewTask[nRand2][3],tStrewTask[nRand2][4],tStrewTask[nRand2][5],tStrewTask[nRand2][1]);
				Msg2Player("B筺 nh薾 頲 "..tStrewTask[nRand1][2].."Thi謕 ch骳 m鮪g"..tStrewTask[nRand1][1].."Trng");	
				Msg2Player("B筺 nh薾 頲 "..tStrewTask[nRand2][2].."Thi謕 ch骳 m鮪g"..tStrewTask[nRand2][1].."Trng");
			end
		end	
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, nCurDayTimes)	-- 更新今天已经做了的任务次数
	        local nFactionNum = GetTask(VET_201009_00_TASK_NUM_FACTION)
                if ((nCurTaskLinkID == TASK_ID_SHAOLIN_SUJIA) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_CHANSENG) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_WUSENG) or
		    (nCurTaskLinkID == TASK_ID_WUDANG_DAOJIA) or
                    (nCurTaskLinkID == TASK_ID_WUDANG_SUJIA) or
		    (nCurTaskLinkID == TASK_ID_EMEI_FOJIA) or
		    (nCurTaskLinkID == TASK_ID_EMEI_SUJIA) or
		    (nCurTaskLinkID == TASK_ID_TANGMEN) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_JINGYI) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_WUYI) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_QIANGQI) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_GONGQI) or
		    (nCurTaskLinkID == TASK_ID_WUDU_XIEXIA) or
		    (nCurTaskLinkID == TASK_ID_WUDU_GUSHI) or
		    (nCurTaskLinkID == TASK_ID_KUNLUN_TIANSHI) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_WUXIAN ) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_LINGNV ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_SHENGZHAN ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_XUEREN ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_ZHENBING )) then
                    if mod(nFactionNum,10) == 0 then
                        nFactionNum = nFactionNum + 1
                    end
		elseif ((nCurTaskLinkID == TASK_ID_SHAOLIN_SUJIA + 1) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_CHANSENG + 1) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_WUSENG + 1) or
		    (nCurTaskLinkID == TASK_ID_WUDANG_DAOJIA + 1) or
                    (nCurTaskLinkID == TASK_ID_WUDANG_SUJIA + 1) or
		    (nCurTaskLinkID == TASK_ID_EMEI_FOJIA + 1) or
		    (nCurTaskLinkID == TASK_ID_EMEI_SUJIA + 1) or
		    (nCurTaskLinkID == TASK_ID_TANGMEN + 1) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_JINGYI + 1) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_WUYI + 1) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_QIANGQI + 1) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_GONGQI + 1) or
		    (nCurTaskLinkID == TASK_ID_WUDU_XIEXIA + 1) or
		    (nCurTaskLinkID == TASK_ID_WUDU_GUSHI + 1) or
		    		    (nCurTaskLinkID == TASK_ID_KUNLUN_TIANSHI+1) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_WUXIAN+1 ) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_LINGNV+1 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_SHENGZHAN+1 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_XUEREN+1 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_ZHENBING+1 )) then
                    if mod(floor(nFactionNum/10),10) == 0 then
                        nFactionNum = nFactionNum + 10
                    end
                elseif ((nCurTaskLinkID == TASK_ID_SHAOLIN_SUJIA + 2) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_CHANSENG + 2) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_WUSENG + 2) or
		    (nCurTaskLinkID == TASK_ID_WUDANG_DAOJIA + 2) or
                    (nCurTaskLinkID == TASK_ID_WUDANG_SUJIA + 2) or
		    (nCurTaskLinkID == TASK_ID_EMEI_FOJIA + 2) or
		    (nCurTaskLinkID == TASK_ID_EMEI_SUJIA + 2) or
		    (nCurTaskLinkID == TASK_ID_TANGMEN + 2) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_JINGYI + 2) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_WUYI + 2) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_QIANGQI + 2) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_GONGQI + 2) or
		    (nCurTaskLinkID == TASK_ID_WUDU_XIEXIA + 2) or
		    (nCurTaskLinkID == TASK_ID_WUDU_GUSHI + 2) or
		    (nCurTaskLinkID == TASK_ID_KUNLUN_TIANSHI+2) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_WUXIAN+2 ) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_LINGNV+2 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_SHENGZHAN+2 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_XUEREN+2 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_ZHENBING+2 )) then
                    if mod(floor(nFactionNum/100),10) == 0 then
                        nFactionNum = nFactionNum + 100
                    end
	        end
                --每次活动给奖励都调用此函数，不再像以前一样每次活动都写一个函数来给奖励
                SetTask(VET_201009_00_TASK_NUM_FACTION,nFactionNum)
                Give_Faction_Award();--from "\script\online_activites\award.lua"
		
		
        if GetAntiEnthrallmentStatus() == 0 then
            FinishTaskStep(nCurTaskLinkID, 0, nPerCent)			-- 结束当前任务并且发奖
        elseif GetAntiEnthrallmentStatus() == 1 then
            FinishTaskStep(nCurTaskLinkID, 0, floor(nPerCent/2))			-- 3小时防沉迷状态给一半奖励
        else
            --5小时防沉迷状态不给奖励
        end
		-- 师徒任务 （师门）
		local nChance, nMaxChance = CustomDataRead("mp_shimen")
		if nChance ~= nil then
			nChance = nChance + 1
			if nChance < nMaxChance then
				CustomDataSave("mp_shimen", "dd", nChance, nMaxChance)
				Msg2Player("Nhi謒 v� S� - t譶h h譶h ho祅 th祅h S� m玭-:"..nChance.."/"..nMaxChance)
			else
				PrenticeCompleteTask()
			end
		end
		-- 针对限制要对获得的声望进行处理
		-- 增加后的师门贡献度
		local nFactionContributeAfter = GetTask(TASKVALUE_FACTION_CONTRI_ID)
		-- 今天已经获得的师门贡献度
		local nCurDayGainReputation = GetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID)
		
		-- 这次增加的师门贡献度
		local nAddedThisTimeContribute = nFactionContributeAfter - nCurFactionContribute
		
		-- 超过了当天能获得的声望点数，扣回去
		if (nCurDayGainReputation > nDayReputationLimit) then
			local nShouldBeMinus = nCurDayGainReputation - nDayReputationLimit
			-- 如果是做了高级任务再回来做低级任务，那么只减这次做的任务得到的师门贡献度。
			if (nFactionContributeAfter - nShouldBeMinus < nCurFactionContribute) then
				nShouldBeMinus = nFactionContributeAfter - nCurFactionContribute
			end
			SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, nCurDayGainReputation - nShouldBeMinus)
			SetTask(TASKVALUE_FACTION_CONTRI_ID, nFactionContributeAfter - nShouldBeMinus)
			nAddedThisTimeContribute = nAddedThisTimeContribute - nShouldBeMinus
			if (bExtra == 1) then
				Msg2Player("H玬 nay ngi kh玭g th� nh薾 th猰 甶觤 c鑞g hi課 s� m玭, mau 甶 r蘮 luy謓 th猰!")
			else
				Msg2Player("H玬 nay ngi kh玭g th� nh薾 th猰 甶觤 c鑞g hi課 s� m玭 nh璶g n誹 l祄 th猰 nh鱪g nhi謒 v� kh竎 c騨g 頲 甶觤.")
			end
		end
		
		nFactionContributeAfter = GetTask(TASKVALUE_FACTION_CONTRI_ID)	-- 处理后的师门贡献度
		if (nFactionContributeAfter < 0) then
			SetTask(TASKVALUE_FACTION_CONTRI_ID, 0)
			nFactionContributeAfter = 0
		end
		
		-- 超过了本等级能获得的最多师门贡献度，扣回去
		if (nFactionContributeAfter > nFactionReputationLimit) then
			local nShouldBeMinuss = nFactionContributeAfter - nFactionReputationLimit
			SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, nCurDayGainReputation - nShouldBeMinuss)
			SetTask(TASKVALUE_FACTION_CONTRI_ID, nFactionReputationLimit)
			nAddedThisTimeContribute = nAddedThisTimeContribute - nShouldBeMinuss
			Msg2Player("Ъng c蕄 hi謓 t筰 kh玭g th� nh薾 th猰 甶觤 c鑞g hi課 s� m玭, l猲 m閠 c蕄 n鱝 h穣 quay l筰.")
		end
		if GetReputation() >= 5 then
			ModifyReputation(-5, 0)
		else
			ModifyReputation(0 - GetReputation(), 0)
		end
		
		if (GetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID) < 0) then
			SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, 0)
		end
		
		-- 师门任务其他奖励：
		other_faction_prize();
		
		-- 判断是否可以接到师门的武林大事件任务，要没接到且条件满足
		local bHaveOwnFactionEvent = GetTask(TASKVALUE_FACTION_EVENT_ID)
		if ((bHaveOwnFactionEvent == 0) and (check_faction_event_condition() == 1)) then
			if (StartFactionEvent() == 1) then
				local nSel = random(1, 4)
				local strTaskInfo = QueryFactionEventInfo(nSel)
				Say(strTaskInfo, 0);
			else
				Say("Ti課 b� nhanh l緈! в Vi S� d箉 ngi th猰 ch髏 v� ngh�!", 0)
			end
		else
			Say("Ti課 b� nhanh l緈! в Vi S� d箉 ngi th猰 ch髏 v� ngh�!", 0)
		end
		
		if (nAddedThisTimeContribute < 0) then
			nAddedThisTimeContribute = 0
		end

-- ===================师门令书加成计算===================================================		
		local nLastLingshuDate = GetTask(LAST_USE_DATE)			-- 师门令书上次使用的日期
		local nMultiCount = GetTask(MULTI_COUNT)				-- 当前加成倍数
		if (nLastLingshuDate == nCurDate) then
			local nStillShouldPlus = nAddedThisTimeContribute * (nMultiCount - 1)
			local nNowFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
			nNowFactionContribute = nNowFactionContribute + nStillShouldPlus
			SetTask(TASKVALUE_FACTION_CONTRI_ID, nNowFactionContribute)
			nAddedThisTimeContribute = nAddedThisTimeContribute + nStillShouldPlus
		else
			SetTask(MULTI_COUNT, 1)
		end
-- ===================师门令书加成计算================================================end
		
		Msg2Player("Nhi謒 v� l莕 n祔 b筺 nh薾 頲  "..nAddedThisTimeContribute.." 甶觤 c鑞g hi課 s� m玭!")
	else
		Say("Nhi謒 v� d� nh� v藋 m� kh玭g l祄 頲! Ngi qu� k衜 c鈏!", 0)
		--if (nCurFactionContribute > 0) then
		--	SetTask(TASKVALUE_FACTION_CONTRI_ID, nCurFactionContribute - 1)
		--end
	end
end;


-- 处于完成了上个任务的情况下，询问玩家是否继续做
function get_next_task(nFactionRouteNo)
	local nCurDifficulty = GetTask(TASKVALUE_DIFFICULT_LEVEL_ID)
	local strTalk = {"Kh� l緈, c� mu鑞 l祄 th猰 kh玭g? Hay mu鑞 th� nhi謒 v� kh� h琻?",
					 "е t� ng �!/#get_one_task("..nCurDifficulty..")",
					 "Nhi謒 v� n祔  ho祅 th祅h, xin ki觤 tra l筰/faction_event_finish",
					 "е t� k衜 c醝 kh玭g th� m nh薾, xin 頲 h駓 nhi謒 v�!/cancel_faction_event",
					 "е t� mu鑞 nh薾 nhi謒 v� kh� h琻/#get_new_task("..nFactionRouteNo..")",
					 "е t� mu鑞 xem 觤 c鑞g hi課 s� m玭/query_faction_contribute",
					 "е t� c遪 k衜 c醝 mu鑞 r蘮 luy謓 th猰./cancel_dialog"}
	
	if (GetTask(TASKVALUE_FACTION_EVENT_ID) == 0) then
		Say(strTalk[1], 4, strTalk[2], strTalk[5], strTalk[6], strTalk[7])
	else
		Say(strTalk[1], 6, strTalk[2], strTalk[3], strTalk[4], strTalk[5], strTalk[6], strTalk[7]);
	end		 
end;

-- 查询玩家当前的师门贡献度
function query_faction_contribute()
	local nCurFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	-- 当前等级的声望限制
	local nFactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
	Say("ч c鑞g hi課 s� m玭 l� <color=yellow>"..nCurFactionContribute.."<color>, ng c蕄 hi謓 t筰 nh薾 頲 甶觤 c鑞g hi課 t鑙 產 l� <color=yellow>"..nFactionReputationLimit.."<color>, c� l猲! M� giao di謓 F3 c� th� xem  c鑞g hi課 s� m玭.", 0)
end;

-- 检查玩家是否已经完成了武林大事件任务
function faction_event_finish()
	local bFinished = FinishFactionEvent()	-- 检查是否完成了师门大事件
	if (bFinished == 1) then
		--加入空间负重判断
		if get_free_room(1) ~= 1 then
			return 0;
		end
		local nBefore = GetTask(TASKVALUE_FACTION_CONTRI_ID)
		faction_event_prize()
		local nAfter = GetTask(TASKVALUE_FACTION_CONTRI_ID)
		local nAdded = nAfter - nBefore
		
		Say("L祄 t鑤 l緈! C� l猲! Ngi m韎 nh薾 頲 <color=yellow>"..nAdded.."<color> 甶觤 c玭g hi課 S� M玭", 0)
	else
		Say("Nhi謒 v� ta giao ngi v蒼 ch璦 ho祅 th祅h", 0)
	end
end;

-- 判断是否可以接到武林大事件
function check_faction_event_condition()
	--玩家从50级可以接到该任务
	local nLevel = GetLevel()
	if (nLevel < 50) then
		return 0
	end
	
	--记录今天的时间
	--		          年	       月	       日	       时	       分	       秒
	local nCurrTime = {date("%Y"), date("%m"), date("%d"), date("%H"), date("%M"), date("%S")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- 现在的日期
	-- 上次领取师门大事件的时间段开始日期
	local nLastGetEventDate = GetTask(TASKVALUE_LAST_GET_EVENT_DATE_ID)
	-- 本时间段内已经尝试领取师门大事件的次数
	local nCurGetEventTimes = GetTask(TASKVALUE_GET_EVENT_TIMES_ID)
	
	if ((nCurDate - nLastGetEventDate) > 7) then
		SetTask(TASKVALUE_GET_EVENT_TIMES_ID, 0)
		SetTask(TASKVALUE_LAST_GET_EVENT_DATE_ID, nCurDate)
		if ((nCurGetEventTimes >= 10) and (nCurGetEventTimes < 40)) then	-- 上个阶段已经做了10次还没有领到
			return 1
		end
	end
	
	-- 本周已经接到过了
	if (nCurGetEventTimes >= 40) then
		return 0
	end
	
	--接受大事件任务的概率为恒定值,概率为3%,一周只能接受一次任务.(采用伪随机)
	local nRate = random(0, 100)
	if (nRate < 3) then
		SetTask(TASKVALUE_GET_EVENT_TIMES_ID, 40)
		return 1
	else
		SetTask(TASKVALUE_GET_EVENT_TIMES_ID, nCurGetEventTimes + 1)
		return 0
	end
end;

-- 师门任务完成以后的其他奖励
function other_faction_prize()
-- 每50点贡献度 师门令牌 一个

	-- 今天做了几次师门任务了
	local nCurDayTimes = GetTask(TASKVALUE_CUR_DAY_TIMES_ID)  
	-- 距离上次领师门令牌增加了多少师门贡献度
	local nLastGetCard = GetTask(TASKVALUE_LAST_CARD_CONTRIBUTE_ID)
	local nCurFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	if nCurFactionContribute < nLastGetCard then	--如果当前值小于上次获得令牌时的值
		SetTask(TASKVALUE_LAST_CARD_CONTRIBUTE_ID,nCurFactionContribute);
		nLastGetCard = nCurFactionContribute;
	end;
	local nContributeAdded = nCurFactionContribute - nLastGetCard
	
	if (nContributeAdded >= 50) then
		if GetAntiEnthrallmentStatus() == 0 then
			send_a_faction_card()	-- 给一个师门令牌
			SetTask(TASKVALUE_LAST_CARD_CONTRIBUTE_ID, (nLastGetCard + 50))
			local nRoute = GetPlayerRoute();
			if nRoute >= 23 then
				Msg2Player("觤 c鑞g hi課 s� m玭 c馻 ngi 頲 t輈h l騳 50 甶觤");
			else
				Msg2Player("ч c鑞g hi課 s� m玭  50 甶觤 nh薾 頲 l謓h b礽 s� m玭!")
			end
		end
	end
	
	-- 当天第一次完成师门任务
	if (nCurDayTimes == 1 or nCurDayTimes == 6) then
		local nCurLevelOfExpPrize = GetLevel()
		local nExpPrize = 0
		if (nCurFactionContribute <= 3000) then
			nExpPrize = floor(nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize * 0.4)
		else
			nExpPrize = nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize
		end
		if GetAntiEnthrallmentStatus() == 1 then
			nExpPrize = floor(nExpPrize/2)
		elseif GetAntiEnthrallmentStatus() == 2 then
			nExpPrize = 0
		end		
		ModifyExp(nExpPrize)
		Msg2Player("Ho祅 th祅h nhi謒 v� S� m玭, nh薾 頲 "..nExpPrize.." 甶觤 kinh nghi謒!")
		WriteLogEx(VIET_0911_LOG_TITLE,"s� m玭 l莕 th� "..nCurDayTimes)
	end
	
	--09年11月活动给额外奖励
	
	if  nCurDayTimes == 10 then
		local nCurLevelOfExpPrize = GetLevel()
		local nExpPrize = 0
		if (nCurFactionContribute <= 3000) then
			nExpPrize = floor(nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize * 0.4)			
		else
			nExpPrize = nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize
		end
		nExpPrize = nExpPrize + floor(nExpPrize/3)
		if GetAntiEnthrallmentStatus() == 1 then
			nExpPrize = floor(nExpPrize/2)
		elseif GetAntiEnthrallmentStatus() == 2 then
			nExpPrize = 0
		end	
		ModifyExp(nExpPrize)
		Msg2Player("H玬 nay l� l莕 "..nCurDayTimes.." ho祅 th祅h nhi謒 v� s� m玭, nh薾 頲 甶觤 kinh nghi謒 c閚g th猰."..nExpPrize.." 甶觤!")
		WriteLogEx(VIET_0911_LOG_TITLE,"s� m玭 l莕 th� "..nCurDayTimes)
	else
		local nCurLevelOfExpPrize = GetLevel()
		local nExpPrize = 0
		if (nCurFactionContribute <= 3000) then
			nExpPrize = floor(nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize * 0.4)			
		else
			nExpPrize = nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize
		end
		nExpPrize = floor(nExpPrize/7)
		if GetAntiEnthrallmentStatus() == 1 then
			nExpPrize = floor(nExpPrize/2)
		elseif GetAntiEnthrallmentStatus() == 2 then
			nExpPrize = 0
		end	
		ModifyExp(nExpPrize)
		Msg2Player("H玬 nay l� l莕 "..nCurDayTimes.." ho祅 th祅h nhi謒 v� s� m玭, nh薾 頲 甶觤 kinh nghi謒 c閚g th猰."..nExpPrize.." 甶觤!")
		WriteLogEx(VIET_0911_LOG_TITLE,"s� m玭 l莕 th� "..nCurDayTimes)
	end
	-------------圣诞节活动奖励派发-------------------
--		Xmas_prize_get(2)
	----------------------结束-------------------------------
end;

-- 师门大事件完成以后的奖励
function faction_event_prize()
	-- 给玩家经验奖励，数值是玩家等级的三次方
	local nPlayerLevelOfExp = GetLevel()
	local nShouldGiveExp = nPlayerLevelOfExp * nPlayerLevelOfExp * nPlayerLevelOfExp
	ModifyExp(nShouldGiveExp)
	Msg2Player("V�  c鑞g hi課 cho S� M玭, b筺 nh薾 頲"..nShouldGiveExp.." 甶觤 kinh nghi謒!")
	
	-- 是否获得了门派秘籍
	local bGetSuperMisteryBook = 0

	--记录今天的时间
	--		          年	       月	       日	       时	       分	       秒
	local nCurrTime = {date("%Y"), date("%m"), date("%d"), date("%H"), date("%M"), date("%S")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- 现在的日期
	local nLastTaskDate = GetTask(TASKVALUE_CUR_DATE_ID)					-- 上次接任务的日期
	
	if (nLastTaskDate < nCurDate) then
		SetTask(TASKVALUE_CUR_DATE_ID, nCurDate)			-- 设置新的日期
		SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, 0)		-- 清空当天获得的师门贡献度
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, 0)				-- 清空当天做了的师门任务次数
	end
	
	-- 上次领取师门大事件奖励的时间段开始日期
	local nLastGetSuperPrizeDate = GetTask(TASKVALUE_LAST_GET_EVENT_PRIZE_DATE_ID)
	-- 本时间段内已经尝试领取师门大事件奖励的次数
	local nCurGetSuperPrizeTimes = GetTask(TASKVALUE_GET_EVENT_PRIZE_TIMES_ID)
		
	-- 门派45级秘籍,获得概率12.5%,两个月(8周,不是物理月)一个人可以获得1本.(采用伪随机)
	if ((nCurDate - nLastGetSuperPrizeDate) >= 56) then	-- 28天以后了
		SetTask(TASKVALUE_GET_EVENT_PRIZE_TIMES_ID, 0)
		SetTask(TASKVALUE_LAST_GET_EVENT_PRIZE_DATE_ID, nCurDate)
	end
	
	local nLottos = random(0, 1000);
	if (nCurGetSuperPrizeTimes == 7) then		-- 前七次都没有领到，这次一定发
		really_get_a_super_mistery_book()
		bGetSuperMisteryBook = 1
	elseif (nCurGetSuperPrizeTimes < 7) then	-- 随机12.5%的几率可能拿到师门秘籍
		if (nLottos < 125) then
			really_get_a_super_mistery_book()
			bGetSuperMisteryBook = 1
		end
	end
	
	-- 天霞,紫霞,粘衣,修罗,五鬼,补金,补石共为87.5%,每次只可能获得一本秘籍.
	-- 要在没有获得门派秘籍的情况下拿到
	if (bGetSuperMisteryBook == 0) then
		if nLottos <= 800 then
			local nBookID = random(1, 7)
			if (nBookID == 1) then
				AddItem(0, 107, 64, 1)		-- 天霞
			elseif (nBookID == 2) then
				AddItem(0, 107, 65, 1)		-- 紫霞
			elseif (nBookID == 3) then
				AddItem(0, 107, 66, 1)		-- 粘衣
			elseif (nBookID == 4) then
				AddItem(0, 107, 60, 1)		-- 修罗
			elseif (nBookID == 5) then
				AddItem(0, 107, 63, 1)		-- 五鬼
			elseif (nBookID == 6) then
				AddItem(0, 107, 61, 1)		-- 补金
			else
				AddItem(0, 107, 62, 1)		-- 补石
			end
		else
		 local	tMijiName = {
							{"T� Linh Chi課 � Ph�",0,107,159},
							{"T� Linh Thi猲 � Ph�",0,107,160},
							{"T� Linh T� � Ph�",0,107,161}
						};	
		 local nRandtb = random(1,3);
		 AddItem(tMijiName[nRandtb][2],tMijiName[nRandtb][3],tMijiName[nRandtb][4],1);		
		end
	end
	
	-- 师门声望奖励，奖励50点
	-- 当前等级的声望限制
	local nFactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
	-- 当前的师门声望 和 今天已经获得的师门声望
	local nFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	local nCurDayGainReputation = GetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID)
	
	local nShouldAdd = 50
	nCurDayGainReputation = nShouldAdd + nCurDayGainReputation
	if (nCurDayGainReputation > nExtraDayLimit) then
		nShouldAdd = nShouldAdd - (nCurDayGainReputation - nExtraDayLimit)
		nCurDayGainReputation = nExtraDayLimit
	end
	
	SetTask(TASKVALUE_FACTION_CONTRI_ID, (nFactionContribute + nShouldAdd))
	SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, nCurDayGainReputation)
	--SetTask(TASKVALUE_CUR_DAY_TIMES_ID, 5)	-- 设置今天不用继续接师门任务了
	
	-- 滚动公告
	local strPlayerName = GetName()
	local strNews = "[Nhi謒 v� s� m玭]: Ngi ch琲 "..strPlayerName.."  Ho祅 th祅h nhi謒 v� s� m玭 nh薾 頲 quy觧 m藅 t辌h."
--	AddGlobalNews(strNews)
end;

-- 真正搞到手了一本师门45级秘籍
function really_get_a_super_mistery_book()
	SetTask(TASKVALUE_GET_EVENT_PRIZE_TIMES_ID, 4)
	
	local nFactionRoute = GetPlayerRoute()	-- 获得玩家的流派数据
	local nRate = random(0, 1)				-- 哪一本秘籍
	
	if (nFactionRoute == 2) then			-- 少林俗家
		AddItem(0, 107, (1 + nRate), 1)		-- 金刚伏魔经 or 金刚伏魔心法
	elseif (nFactionRoute == 3) then		-- 少林禅宗
		AddItem(0, 107, (5 + nRate), 1)		-- 无尘秘籍 or 无尘心法
	elseif (nFactionRoute == 4) then		-- 少林武宗
		AddItem(0, 107, (3 + nRate), 1)		-- 潜龙秘籍 or 潜龙心法
		
	elseif (nFactionRoute == 6) then		-- 唐门
		AddItem(0, 107, (7 + nRate), 1)		-- 天罗秘籍 or 天罗心法
		
	elseif (nFactionRoute == 8) then		-- 峨嵋佛家
		AddItem(0, 107, (9 + nRate), 1)		-- 如意秘籍 or 如意心法
	elseif (nFactionRoute == 9) then		-- 峨嵋俗家
		AddItem(0, 107, (11 + nRate), 1)	-- 碧海谱 or 碧海心法
		
	elseif (nFactionRoute == 11) then		-- 丐帮净衣
		AddItem(0, 107, (13 + nRate), 1)	-- 混沌秘籍 or 混沌心法
	elseif (nFactionRoute == 12) then		-- 丐帮污衣
		AddItem(0, 107, (15 + nRate), 1)	-- 揆天秘籍 or 揆天心法
		
	elseif (nFactionRoute == 14) then		-- 武当道家
		AddItem(0, 107, (17 + nRate), 1)	-- 幻影秘籍 or 幻影心法
	elseif (nFactionRoute == 15) then		-- 武当俗家
		AddItem(0, 107, (19 + nRate), 1)	-- 君子秘籍 or 君子心法
		
	elseif (nFactionRoute == 17) then		-- 杨门枪骑
		AddItem(0, 107, (21 + nRate), 1)	-- 镇军秘籍 or 镇军心法
	elseif (nFactionRoute == 18) then		-- 杨门弓骑
		AddItem(0, 107, (23 + nRate), 1)	-- 穿云秘籍 or 穿云心法
		
	elseif (nFactionRoute == 20) then		-- 五毒邪侠
		AddItem(0, 107, (25 + nRate), 1)	-- 幽冥鬼录 or 幽冥心法
	elseif (nFactionRoute == 21) then		-- 五毒蛊师
		AddItem(0, 107, (27 + nRate), 1)	-- 灵蛊秘籍 or 灵蛊心法
	elseif (nFactionRoute == 23) then		-- 昆仑天师
		AddItem(0, 107, (180 + nRate), 1)	-- 灵蛊秘籍 or 灵蛊心法
	elseif (nFactionRoute == 25) then		-- 明教圣战
		AddItem(0, 107, (182 + nRate), 1)	-- 灵蛊秘籍 or 灵蛊心法
	elseif (nFactionRoute == 26) then		-- 明教阵兵
		AddItem(0, 107, (184 + nRate), 1)	-- 灵蛊秘籍 or 灵蛊心法
	elseif (nFactionRoute == 27) then		-- 明教血人
		AddItem(0, 107, (186 + nRate), 1)	-- 灵蛊秘籍 or 灵蛊心法
	elseif (nFactionRoute == 29) then		-- 翠烟舞仙
		AddItem(0, 107, (188 + nRate), 1)	-- 灵蛊秘籍 or 灵蛊心法
	elseif (nFactionRoute == 30) then		-- 翠烟灵女
		AddItem(0, 107, (190 + nRate), 1)	-- 灵蛊秘籍 or 灵蛊心法
	end
	
	Msg2Player("B筺 nh薾 頲 1 quy觧 m藅 t辌h!")
end;

--给予师门高级秘籍，新门派要加
function get_advanced_faction_book()
	local tGaojiMiji = {
				[0] = {{"Kim Cang B竧 Nh� Kinh",0,107,166},{"V� Tr莕 B� б Kinh",0,107,168},{"Ti襪 Long T辌h Di謙 Kinh",0,107,167},{"Thi猲 La Li猲 Ch﹗ L鬰",0,107,169},{"Nh� � Kim жnh M藅 T辌h",0,107,170},{"B輈h H秈 Tuy謙  Ph�",0,107,171},{"H鏽 чn Tr蕁 Nh筩 M藅 T辌h",0,107,172},{"Qu� Thi猲 Du Long M藅 T辌h",0,107,173},{"Huy詎 秐h M� Tung M藅 T辌h",0,107,174},{"Qu﹏ T� Ti謙 Phong M藅 T辌h",0,107,175},{"Tr蕁 Qu﹏ Phi Long Thng Ph�",0,107,176},{"Xuy猲 V﹏ L筩 H錸g M藅 T辌h",0,107,177},{"U Minh Phong Ma L鬰",0,107,178},{"Linh C� Huy詎 T� L鬰",0,107,179}},
				[1] = {{"Kim Cang B竧 Nh� Kinh",0,107,166},{"V� Tr莕 B� б Kinh",0,107,168},{"Ti襪 Long T辌h Di謙 Kinh",0,107,167}},
				[2] = {{"Kim Cang B竧 Nh� Kinh",0,107,166}},
				[3] = {{"V� Tr莕 B� б Kinh",0,107,168}},
				[4] = {{"Ti襪 Long T辌h Di謙 Kinh",0,107,167}},
				[5] = {{"Thi猲 La Li猲 Ch﹗ L鬰",0,107,169}},
				[6] = {{"Thi猲 La Li猲 Ch﹗ L鬰",0,107,169}},
				[7] = {{"Nh� � Kim жnh M藅 T辌h",0,107,170},{"B輈h H秈 Tuy謙  Ph�",0,107,171}},
				[8] = {{"Nh� � Kim жnh M藅 T辌h",0,107,170}},
				[9] = {{"B輈h H秈 Tuy謙  Ph�",0,107,171}},
				[10] = {{"H鏽 чn Tr蕁 Nh筩 M藅 T辌h",0,107,172},{"Qu� Thi猲 Du Long M藅 T辌h",0,107,173}},
				[11] = {{"H鏽 чn Tr蕁 Nh筩 M藅 T辌h",0,107,172}},
				[12] = {{"Qu� Thi猲 Du Long M藅 T辌h",0,107,173}},
				[13] = {{"Huy詎 秐h M� Tung M藅 T辌h",0,107,174},{"Qu﹏ T� Ti謙 Phong M藅 T辌h",0,107,175}},
				[14] = {{"Huy詎 秐h M� Tung M藅 T辌h",0,107,174}},
				[15] = {{"Qu﹏ T� Ti謙 Phong M藅 T辌h",0,107,175}},
				[16] = {{"Tr蕁 Qu﹏ Phi Long Thng Ph�",0,107,176},{"Xuy猲 V﹏ L筩 H錸g M藅 T辌h",0,107,177}},
				[17] = {{"Tr蕁 Qu﹏ Phi Long Thng Ph�",0,107,176}},
				[18] = {{"Xuy猲 V﹏ L筩 H錸g M藅 T辌h",0,107,177}},
				[19] = {{"U Minh Phong Ma L鬰",0,107,178},{"Linh C� Huy詎 T� L鬰",0,107,179}},
				[20] = {{"U Minh Phong Ma L鬰",0,107,178}},
				[21] = {{"Linh C� Huy詎 T� L鬰",0,107,179}},
				[22] = {{"Thi觤 L玦 M藅 T辌h",0,107,198}},
				[23] = {{"Thi觤 L玦 M藅 T辌h",0,107,198}},
				[24] = {{"Tr秏 Nh藅 M藅 T辌h",0,107,199},{"H祅h Tr薾 M藅 T辌h",0,107,200},{"Phong Huy誸 M藅 T辌h",0,107,201}},
				[25] = {{"Tr秏 Nh藅 M藅 T辌h",0,107,199}},
				[26] = {{"H祅h Tr薾 M藅 T辌h",0,107,200}},
				[27] = {{"Phong Huy誸 M藅 T辌h",0,107,201}},
				[28] = {{"U M閚g Ph�",0,107,202},{"B竎h Hoa Ph�",0,107,203}},
				[29] = {{"U M閚g Ph�",0,107,202}},
				[30] = {{"B竎h Hoa Ph�",0,107,203}},
			};
	local nFactionRoute = GetPlayerRoute()	-- 获得玩家的流派数据
	local nRandom = random(1,getn(tGaojiMiji[nFactionRoute]));
	local nAdd_flag = AddItem(tGaojiMiji[nFactionRoute][nRandom][2],tGaojiMiji[nFactionRoute][nRandom][3],tGaojiMiji[nFactionRoute][nRandom][4],1);
	if nAdd_flag == 1 then
		Msg2Player("B筺 nh薾 頲 1 quy觧"..tGaojiMiji[nFactionRoute][nRandom][2]);
		WriteLog("[S� ki謓 s� m玭]: "..GetName().."Ho祅 th祅h s� ki謓 s� m玭 頲 1 "..tGaojiMiji[nFactionRoute][nRandom][1]);
	else
		WriteLog("[S� ki謓 s� m玭]: "..GetName().."Ho祅 th祅h s� ki謓 s� m玭 頲 1 "..tGaojiMiji[nFactionRoute][nRandom][1].."Th蕋 b筰: "..nAdd_flag);
	end	
end


-- 给一个师门令牌，按门派给的
function send_a_faction_card()
	local nFaction = GetPlayerFaction()		-- 得到玩家是哪个门派的

	if (nFaction == 1) then			-- 少林
		AddItem(2, 0, 205, 1)		-- 少林师门令牌
	elseif (nFaction == 2) then		-- 武当
		AddItem(2, 0, 206, 1)		-- 武当师门令牌
	elseif (nFaction == 3) then		-- 峨嵋
		AddItem(2, 0, 207, 1)		-- 峨嵋师门令牌
	elseif (nFaction == 4) then		-- 丐帮
		AddItem(2, 0, 208, 1)		-- 丐帮师门令牌
	elseif (nFaction == 5) then		-- 唐门
		AddItem(2, 0, 209, 1)		-- 唐门师门令牌
	elseif (nFaction == 6) then		-- 杨门
		AddItem(2, 0, 350, 1)		-- 杨门师门令牌
	elseif (nFaction == 7) then		-- 五毒
		AddItem(2, 0, 390, 1)		-- 五毒师门令牌
	elseif (nFaction == 8) then		-- 昆仑
--		AddItem(2,0,787, 1)		-- 昆仑师门令牌
	elseif (nFaction == 9) then		-- 明教
--		AddItem(2,0,788, 1)		-- 明教师门令牌
	elseif (nFaction == 10) then		-- 翠烟
--		AddItem(2,0,789, 1)		-- 翠烟师门令牌
	end
end;

function cancel_faction_event()
	Say("в c� m藅 t辌h m玭 ph竔 c莕 ho祅 th祅h nhi謒 v� s� m玭. Ngi c� mu鑞 ti誴 t鬰 l祄 kh玭g?",
		2,
		"Ta mu鑞 h駓 nhi謒 v� n祔/confirm_cancel_faction_event",
		"в ta ngh� l筰!/cancel_dialog")
end;

function confirm_cancel_faction_event()
	SetTask(TASKVALUE_FACTION_EVENT_ID, 0)
	Say("Ta  h駓 nhi謒 v� s� m玭 c馻 ngi, n誹 mu鑞 l祄 l筰 th� ph秈 xem c� duy猲 n鱝!", 0)
end;

function get_free_room(goods_num)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
		return 0
	else 
		return 1
	end
end
function add_0906and07_aword()
	if EventOpen0906() == 0 then
		return
	end
	if tonumber(date("%y%m%d%H")) >= 09061900 and tonumber(date("%y%m%d%H")) < 49071924 then
		local nCount = tb_shimen_aword[floor(GetLevel() / 10)][2];
		if GetTask(TASK_GET_MIBEN_DATE) < tonumber(date("%y%m%d")) then
			SetTask(TASK_GET_MIBEN_COUNT_TODAY, 0);
		end
		if GetTask(TASK_GET_MIBEN_COUNT_TODAY) < CONST_GET_MIBEN_MAX_COUNT then
			gf_SetLogCaption("Truy t譵 trng sinh ph�");
			local nRetCode = gf_AddItemEx({2, 1, 30088, nCount}, "B� Ph� C� N竧");
			WriteLogEx("Hoat dong thang 6","S� m玭"..floor(GetLevel() / 10).."x",nCount,"B� Ph� C� N竧");
			if nRetCode == 1 then
				SetTask(TASK_GET_MIBEN_DATE, tonumber(date("%y%m%d")));
				SetTask(TASK_GET_MIBEN_COUNT_TODAY, GetTask(TASK_GET_MIBEN_COUNT_TODAY) + 1);
			end
			gf_SetLogCaption("");
		end
	end
end

function add_0908_aword()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 090807 and nDate < 490907 then
		local nCount = tVIET_SHIMEN_PUTAO[floor(GetLevel() / 10)];
		if GetTask(VIET_0908_TASK_SHIMEN_GET_PUTAO_DATE) < nDate then
			SetTask(VIET_0908_TASK_SHIMEN_GET_PUTAO_COUNT, 0);
		end
		if GetTask(VIET_0908_TASK_SHIMEN_GET_PUTAO_COUNT) < VIET_0908_CONST_SHIMEN_GET_MAX then
			gf_SetLogCaption(str_VIET_0908_LOG_TITLE);
			local nRetCode = gf_AddItemEx({2, 1, 30097, nCount}, "T骾 Tr竔 C﹜");
			if nRetCode == 1 then
				SetTask(VIET_0908_TASK_SHIMEN_GET_PUTAO_DATE, tonumber(date("%y%m%d")));
				SetTask(VIET_0908_TASK_SHIMEN_GET_PUTAO_COUNT, GetTask(VIET_0908_TASK_SHIMEN_GET_PUTAO_COUNT) + 1);
				levelGrade = floor(GetLevel() / 10);
				if levelGrade <= 2 then
					WriteLogEx("Hoat dong thang 8", "Nhan tui trai cay", nCount, "Su mon 1x2x");
				else
					WriteLogEx("Hoat dong thang 8", "Nhan tui trai cay", nCount, "Su mon "..levelGrade.."x");
				end
			end
			gf_SetLogCaption("");
		end
	end
end

function add_0909_aword()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 090918 and nDate < 491026 then
		local nCount = tVIET_SHIMEN_BAIMIANBAO[floor(GetLevel() / 10)];
		if GetTask(VIET_0909_TASK_SHIMENG_DATE) < nDate then
			SetTask(VIET_0909_TASK_SHIMENG_NUM, 0);
		end
		if GetTask(VIET_0909_TASK_SHIMENG_NUM) < 10 then
			gf_SetLogCaption(VIET_0909_LOG_TITLE);
			local nRetCode = gf_AddItemEx({2, 1, 30106, nCount}, "B閠 M�");
			if nRetCode == 1 then
				local nLevel = floor(GetLevel() / 10)
				WriteLogEx("Hoat dong trung thu","S� M玭 c蕄 "..nLevel,nCount,"B閠 M�")
				SetTask(VIET_0909_TASK_SHIMENG_DATE, tonumber(date("%y%m%d")));
				SetTask(VIET_0909_TASK_SHIMENG_NUM, GetTask(VIET_0909_TASK_SHIMENG_NUM) + 1);
			end
			gf_SetLogCaption("");
		end
	end
end

function add_0911_aword()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 491206 then
		local nCount = tVIET_0911_SHIMEN_JUHUA[floor(GetLevel() / 10)];
		if GetTask(VIET_0911_TASK_SHIMENG_DATE) < nDate then
			SetTask(VIET_0911_TASK_SHIMENG_NUM, 0);
		end
		if GetTask(VIET_0911_TASK_SHIMENG_NUM) < 10 then
			gf_SetLogCaption(VIET_0911_LOG_TITLE);
			local nRetCode = gf_AddItemEx({2, 1, 30118, nCount}, "Hoa C骳");
			if nRetCode == 1 then
				SetTask(VIET_0911_TASK_SHIMENG_DATE, tonumber(date("%y%m%d")));
				SetTask(VIET_0911_TASK_SHIMENG_NUM, GetTask(VIET_0911_TASK_SHIMENG_NUM) + 1);
				WriteLogEx(VIET_0911_LOG_TITLE,"S� m玭 "..floor(GetLevel() / 10).."x",nCount,"Hoa C骳")
			end
			gf_SetLogCaption("");
		end
	end
end

function add_0912_aword()
    local szFullLog = VIET_0912_STR_EVENT_LOG_TITLE.."- L祄 nhi謒 v� s� m玭 頲 k裲 gi竛g sinh"
    gf_EventFactionAward({2, 1, 30138}, "C﹜ K裲 Gi竛g Sinh", VIET_0912_SHIMEN_SHENGDANTANGGUO, VIET_0912_SHIMEN_AWARD_MAX_COUNT, VIET_0912_TASK_SHIMENG_DATE, VIET_0912_TASK_SHIMENG_NUM, szFullLog, 091218, 100117);
end
