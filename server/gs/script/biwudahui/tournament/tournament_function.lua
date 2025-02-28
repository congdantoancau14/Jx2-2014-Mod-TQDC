Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")
Include("\\script\\lib\\sdb.lua")
Include("\\script\\biwudahui\\tournament\\tournament_head.lua");
--Include("\\script\\online\\spring_festival09\\spring_festival_head.lua"); --09春节活动
Include("\\script\\equip_shop\\equip_shop_head.lua");
Include("\\script\\misc\\observer\\observer_head.lua");
--Include("\\script\\misc\\soul\\soul.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\settings\\static_script\\global\\merit.lua")
Include("\\script\\lib\\define.lua")

g_ThisFile = "\\script\\biwudahui\\tournament\\tournament_function.lua";

--需要写入数据库的变量
tRelayTask = {
	TSK_CURREALRESULT,
	TSK_TOTAL_POINT,
	TSK_CURSIGNEDRESULT,
	TSK_CURWEEKMATCH,
	TSK_TOTALMATCH,
	TASK_BIWU_WIN_10,
	TSK_TOTALWIN,
	TSK_CURWEEKWIN,
	TASK_BIWU_DUIZHAN_JINGYAN,
	TASK_BIWU_LOSE_10,
	TSK_TOTALLOSE,
	TSK_CURWEEKLOSE,
	TSK_BODY_WEEK,
	TASKID_WLZB_POINT,
--	TASKID_ACH_BIWU_WIN_TOTAL,
--	TASKID_ACH_USE_NEW_ROUTE,
--	TASKID_ACH_WIN_NEW_ROUTE,
};

--蛊师的变量
tGushiTask = {
	2204,2216,2207,2222,2219,2210,2228,2213,2225,2231
};

function BWDH_SetTask(nTaskId, nTaskVal)
	return SetTask(nTaskId, nTaskVal,TASK_ACCESS_CODE_BIWUDAHUI)
end

--设置比武的两位玩家的战斗状态
function BWT_SetFightState(nState)
	local tbPlayer = {GetMissionV(MV_PLAYERINDEX1),GetMissionV(MV_PLAYERINDEX2)};
	local nOldPlayerIdx = PlayerIndex;
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		if PlayerIndex ~= 0 then
			SetFightState(nState);
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
end;
--向两位玩家Talk或者Say
function BWT_Talk(szTalk,bTalkSay)
	bTalkSay = bTalkSay or 0;
	local tbPlayer = {GetMissionV(MV_PLAYERINDEX1),GetMissionV(MV_PLAYERINDEX2)};
	local nOldPlayerIdx = PlayerIndex;
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		if PlayerIndex ~= 0 then
			if bTalkSay == 0 then
				Talk(1,"",szTalk);
			else
				Say(szTalk,0);
			end;
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
end;
--转换Mission当前状态
function BWT_ChangeMSState(nState)
	if nState == MS_STATE_IDEL then
		BWT_SetFightState(0);
		StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
		SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
	elseif nState == MS_STATE_CHECK_EQUIPMENT then
		BWT_SetFightState(0);
		SetMissionV(MV_MISSION_STATE,MS_STATE_CHECK_EQUIPMENT);	--设置Mission的状态为准备状态
		SetMissionV(MV_TIMER_LOOP,CHECK_EQUIPMENT_TIMER_COUNT);	--设置计时器总计时次数
		StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
		StartMissionTimer(MISSION_ID,TIMER_ID,CHECK_EQUIPMENT_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个计时器
	elseif nState == MS_STATE_READY then
		BWT_SetFightState(1);
		SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--设置Mission的状态为准备状态
		SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--设置计时器总计时次数
		StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
		StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个计时器
	elseif nState == MS_STATE_STARTED then
		BWT_SetFightState(1);
		SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--设置Mission的状态为开始状态
		SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);	--设置开始状态的持续时间
		StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个新的计时器
	elseif nState == MS_STATE_ENDING then
		BWT_SetFightState(0);
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
	end;
end;
--获取对手的索引。只能在擂台场地里面由玩家触发使用
function BWT_GetOpponentIndex()
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nIdx1,nIdx2 = GetMissionV(MV_PLAYERINDEX1),GetMissionV(MV_PLAYERINDEX2);
	if PlayerIndex == nIdx1 then
		return nIdx2;
	elseif PlayerIndex == nIdx2 then
		return nIdx1;
	else
		gf_ShowDebugInfor("PlayerIndex trong h祄 s� BWT_GetOpponentIndex b� l鏸");
	end;
end;
--清除临时任务变量
function BWT_ClearTempTask()
	for i=TSK_TEMP_BEGIN,TSK_TEMP_END do
		SetTaskTemp(i,0);
	end;
end;
--计算本次较艺获胜获得的积分，由获胜方调用
function BWT_CalculateWinPoint()
	local nOldPlayerIdx = PlayerIndex;
	local nRetPoint = 0;
	local nLevel = GetLevel();
	local nPoint = GetTask(TSK_CURREALRESULT);
	local nOppIdx = BWT_GetOpponentIndex();
	PlayerIndex = nOppIdx;
	local nOppLevel = GetLevel();
	local nOppPoint = GetTask(TSK_CURREALRESULT);
	PlayerIndex = nOldPlayerIdx;
	local nLevelDiff = nLevel - nOppLevel;	--等级差：胜方减负方
	local nPointDiff = nPoint - nOppPoint;
	nRetPoint = 15;
	if nPointDiff >= -100 then
		for i=1,getn(TB_POINTDIFF_RELATION) do
			if nPointDiff >= TB_POINTDIFF_RELATION[i][1] then
				nRetPoint = TB_POINTDIFF_RELATION[i][2];
				break;
			end;
		end;
	end;
	if nLevelDiff > 0 then
		for i=1,getn(TB_LEVELDIFF_RELATION) do
			if nLevelDiff >= TB_LEVELDIFF_RELATION[i][1] then
				nRetPoint = floor(nRetPoint*TB_LEVELDIFF_RELATION[i][2]/100);
				break;
			end;
		end;
	end;
	if nRetPoint >= 15 then
		WriteLog("["..LOG_ERROR_HEAD.."]:"..tostring(GetName())..", "..tostring(GetName(nOppIdx)).."nPointDiff:"..nPointDiff..",nLevelDiff:"..nLevelDiff..",error point:"..nRetPoint);
		nRetPoint = 15;
	end;
	if nRetPoint <= 0 then
		nRetPoint = 1;
	end;
	return nRetPoint;
end;
--时间到时分析两位玩家的状态，决定最终胜负关系
function BWT_GetDrawState(nPIdx1,nPIdx2)
	local tbDamageInfo1,tbDamageInfo2 = BWT_GetDamageValue(nPIdx1,nPIdx2);
	local nResult1,nResult2 = 0,0;
	nResult1 = tbDamageInfo1[1];	--对玩家1的伤害百分比
	nResult2 = tbDamageInfo2[1];	--对玩家2的伤害百分比
	if nResult1 > nResult2 then	--值大的为负方
		nState = 2;	--表示2号玩家赢
	elseif nResult1 < nResult2 then
		nState = 1;	--表示1号玩家赢
	else
		nState = 0;	--打平了
	end;
	return nState;
end;
--输入玩家1和玩家2，获取他们各自受到的伤害信息
function BWT_GetDamageValue(nPIdx1,nPIdx2)
	local nOldPIdx = PlayerIndex;
	local nDamageToP1,nDamageToP2 = 0,0;
	local nMaxLife1,nMaxLife2 = 0,0;
	local nState = 0;
	PlayerIndex = nPIdx1;
	nDamageToP2 = GetToPlayerDamage();
	nMaxLife1 = GetMaxLife();
	PlayerIndex = nPIdx2;
	nDamageToP1 = GetToPlayerDamage();
	nMaxLife2 = GetMaxLife();
	local nResult1,nResult2 = 0,0;
	nResult1 = tonumber(format("%.3f",nDamageToP1/nMaxLife1*100));	--对玩家1的伤害值
	nResult2 = tonumber(format("%.3f",nDamageToP2/nMaxLife2*100));	--对玩家2的伤害值
	PlayerIndex = nOldPIdx;
	return {nResult1,nDamageToP1,nMaxLife1},{nResult2,nDamageToP2,nMaxLife2};
end;

--处理较艺结果。nResultType1时表示打平手,非1为决出胜负。默认值为0
function BWT_ReportResult(nWinnerIdx,nLoserIdx,nResultType)
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 0 and GLB_BW_BiWuCheck() == 1 then --开启了全区全服比武后在原服不再获得奖励
		local oldPlayerIndex = PlayerIndex
		PlayerIndex = nWinnerIdx;
		Say("K� thi v遪g lo筰 Чi H閕 T� V� thi猲 h�  nh蕋 to祅 qu鑓  ch輓h th鴆 b総 u v祇 tu莕 n祔, c竎 v� i hi謕 b﹜ gi�  c� th� c飊g so t礽 v韎 c竎 cao th� kh緋 n琲 r錳! Chi ti誸 c� th� n i s� Чi H閕 T� V� h醝 xem, t� v� server s� kh玭g nh薾 頲 th猰 ph莕 thng v� t輈h 甶觤.",0);
		PlayerIndex = nLoserIdx;
		Say("K� thi v遪g lo筰 Чi H閕 T� V� thi猲 h�  nh蕋 to祅 qu鑓  ch輓h th鴆 b総 u v祇 tu莕 n祔, c竎 v� i hi謕 b﹜ gi�  c� th� c飊g so t礽 v韎 c竎 cao th� kh緋 n琲 r錳! Chi ti誸 c� th� n i s� Чi H閕 T� V� h醝 xem, t� v� server s� kh玭g nh薾 頲 th猰 ph莕 thng v� t輈h 甶觤.",0);
		PlayerIndex = oldPlayerIndex;
		return 0;
	end
	nResultType = nResultType or 0;
	local tbDamageInfo1,tbDamageInfo2 = BWT_GetDamageValue(nWinnerIdx,nLoserIdx);
	Msg2MSAll(MISSION_ID,"Th玭g tin s竧 thng: ");
	Msg2MSAll(MISSION_ID,"Ngi ch琲 "..BWT_GetName(nWinnerIdx).."  g﹜ ra:"..tbDamageInfo2[2]..",% s竧 thng:"..tbDamageInfo2[1].."%");
	Msg2MSAll(MISSION_ID,"Ngi ch琲 "..BWT_GetName(nLoserIdx).."  g﹜ ra:"..tbDamageInfo1[2]..",% s竧 thng:"..tbDamageInfo1[1].."%");
	local nOldPIdx = PlayerIndex
	if nResultType == 1 then	--打平了
		PlayerIndex = nWinnerIdx;
		Say("Hai b猲 h遖, tr� <color=yellow>1<color> 甶觤 so t礽.",0);
		Msg2Player("B筺 b� tr� 1 甶觤 so t礽");
		BWT_AddPoint(-1);
		merit_1V1(-1);
		PlayerIndex = nLoserIdx;
		Say("Hai b猲 h遖, tr� <color=yellow>1<color> 甶觤 so t礽.",0);
		Msg2Player("B筺 b� tr� 1 甶觤 so t礽");
		BWT_AddPoint(-1);
		merit_1V1(-1);
		_Write1V1PointLog(nWinnerIdx,nLoserIdx,-1,-1)
		PlayerIndex = nOldPIdx;
		Msg2MSAll(MISSION_ID,BWT_GetName(nWinnerIdx).."c飊g v韎 "..BWT_GetName(nLoserIdx).." k誸 qu� h遖 nhau");
	else
		--计算功勋和等级
		PlayerIndex = nWinnerIdx;
		local nWinMerit = _merit_GetMerit();
		local nWinLevel = GetLevel() + gf_GetPlayerRebornCount() * 10;
		PlayerIndex = nLoserIdx;
		local nLostMerit = _merit_GetMerit();
		local nLostLevel = GetLevel() + gf_GetPlayerRebornCount() * 10;
		
		--给奖励
		PlayerIndex = nWinnerIdx;
		local nWinRoute = GetPlayerRoute() --胜方流派
		local nPoint = BWT_CalculateWinPoint();	--由获胜方调用
		BWT_AddPoint(nPoint);
		merit_1V1(1, nWinMerit - nLostMerit, nWinLevel - nLostLevel, 0); --功勋和剑侠
		SetMissionV(MV_BIWU_RESULT,nWinnerIdx);
		Say("B筺  chi課 th緉g <color=yellow>"..BWT_GetName(nLoserIdx).."<color>, nh薾 頲 <color=yellow>"..nPoint.."<color> 甶觤 so t礽, 甶觤 so t礽 tu莕 n祔 l� "..GetTask(TSK_CURREALRESULT)..".",0);
		Msg2Player("B筺 nh薾 頲 "..nPoint.." 甶觤 so t礽");
		PlayerIndex = nLoserIdx;
		local nLoseRoute = GetPlayerRoute()--负方流派
		BWT_AddPoint(-nPoint);
		merit_1V1(0, nLostMerit - nWinMerit, nLostLevel - nWinLevel, 0); --功勋和剑侠
		Say("B筺  thua <color=yellow>"..BWT_GetName(nWinnerIdx).."<color>, b� gi秏 <color=yellow>"..nPoint.."<color> 甶觤 so t礽, 甶觤 so t礽 tu莕 n祔 l� "..GetTask(TSK_CURREALRESULT)..".",0);
		Msg2Player("B筺  b� gi秏 "..nPoint.." 甶觤 so t礽");
		PlayerIndex = nOldPIdx;
		Msg2MSAll(MISSION_ID,BWT_GetName(nWinnerIdx).."Chi課 th緉g r錳 "..BWT_GetName(nLoserIdx)..", gi祅h 頲 th緉g l頸.");
		
		--PK胜利统计
		local nPKStatWinKey = nWinRoute*100+nLoseRoute
		local nPKStatLoseKey = nLoseRoute * 100 + nWinRoute
		AddRuntimeStat(15,1,nPKStatWinKey,1)
		AddRuntimeStat(15,2,nPKStatWinKey,1)
		AddRuntimeStat(15,2,nPKStatLoseKey,1)
		
		_Write1V1PointLog(nWinnerIdx,nLoserIdx,nPoint,-1*nPoint)
	end;
	BWT_AddBiWuRecord(nWinnerIdx,nLoserIdx,nResultType);	--需在给予积分后调用

--	if get_spring_festival_state09() == 1 then
--		PlayerIndex = nWinnerIdx;
--		local nDate = tonumber(date("%Y%m%d"));
--		if GetTask(TASK_BIWU_JINNIU_DATE) < nDate then
--			BWDH_SetTask(TASK_BIWU_JINNIU_DATE,nDate);
--			BWDH_SetTask(TASK_BIWU_JINNIU_NUM,0);
--			BWDH_SetTask(TASK_BIWU_JINNIU_CHANG,0);
--		end
--		BWDH_SetTask(TASK_BIWU_JINNIU_CHANG,GetTask(TASK_BIWU_JINNIU_CHANG)+1);
--		if GetTask(TASK_BIWU_JINNIU_CHANG) >= 10 and GetTask(TASK_BIWU_JINNIU_NUM) == 0 then
--			AddItem(tSFItem[1][2],tSFItem[1][3],tSFItem[1][4],GET_BIWU_JINNIU_NUM);
--			Msg2Player("你今天进行了10场比武，获得"..GET_BIWU_JINNIU_NUM.."个"..tSFItem[1][1].."。");
--			BWDH_SetTask(TASK_BIWU_JINNIU_NUM,1);
--		end
--		PlayerIndex = nLoserIdx;
--		local nDate = tonumber(date("%Y%m%d"));
--		if GetTask(TASK_BIWU_JINNIU_DATE) < nDate then
--			BWDH_SetTask(TASK_BIWU_JINNIU_DATE,nDate);
--			BWDH_SetTask(TASK_BIWU_JINNIU_NUM,0);
--			BWDH_SetTask(TASK_BIWU_JINNIU_CHANG,0);
--		end
--		BWDH_SetTask(TASK_BIWU_JINNIU_CHANG,GetTask(TASK_BIWU_JINNIU_CHANG)+1);
--		if GetTask(TASK_BIWU_JINNIU_CHANG) >= 10 and GetTask(TASK_BIWU_JINNIU_NUM) == 0 then
--			AddItem(tSFItem[1][2],tSFItem[1][3],tSFItem[1][4],GET_BIWU_JINNIU_NUM);
--			Msg2Player("你今天进行了10场比武，获得"..GET_BIWU_JINNIU_NUM.."个"..tSFItem[1][1].."。");
--			BWDH_SetTask(TASK_BIWU_JINNIU_NUM,1);
--		end
--		PlayerIndex = nOldPIdx;
--	end
end;

function _Write1V1PointLog(nWinnerIdx,nLoserIdx, nWinnerPnt,nLoserPnt)
	local strAction = "1v1_match"
	local strDate = date("%Y_%m_%d")

	local hFile = openfile(format("logs/gest_convention/%s/%s.log", strDate, strAction), "a+");
	if (hFile == nil) then
		execute(format("mkdir \"%s\"", "logs/gest_convention/"));
		execute(format("mkdir \"%s\"", format("logs/gest_convention/%s/", strDate)));
		hFile = openfile(format("logs/gest_convention/%s/%s.log", strDate, strAction), "a+");
		write (hFile, "Account\tRole\tPoint\tTotalPoint\tCurZiGePoint\tDate\n")
	end
	if (hFile ~= nil) then
		local OldPlayerIndex = PlayerIndex
		PlayerIndex = nWinnerIdx
		local szMsg = format("%s\t%s\t%d\t%d\t%d\t%s\n"
			, GetAccount(), GetName(), nWinnerPnt, GetTask(TSK_CURREALRESULT), GetTask(TSK_CURLADDERVALUE), strDate)
		write (hFile, szMsg)
		PlayerIndex = nLoserIdx
		szMsg = format("%s\t%s\t%d\t%d\t%d\t%s\n"
			, GetAccount(), GetName(), nLoserPnt, GetTask(TSK_CURREALRESULT), GetTask(TSK_CURLADDERVALUE), strDate)
		write (hFile, szMsg)
		PlayerIndex = OldPlayerIndex
		closefile (hFile)
	end
end

--获得比武双方的名字
function BWT_GetFighterName(nMapID)
	nMapID = nMapID or SubWorldIdx2ID(SubWorld);
	return mf_GetMissionS(MISSION_ID,MS_PLAYERNAME1,nMapID),
		   mf_GetMissionS(MISSION_ID,MS_PLAYERNAME2,nMapID);
end;
--获取当前服务器上可用的场地数量
function BWT_GetServerIdleRoomNum()
	local nCount = 0;
	local nTotalCount = 0;
	for i,v in TB_MAPID do
		if SubWorldID2Idx(i) >= 0 then
			nCount = nCount + GetMapLoadCount(v[2]);
			nTotalCount = nTotalCount + MAX_ROOM_NUM;
		end;
	end;
	return nTotalCount - nCount;
end;
--初始化一轮比武,GMScript中执行
--获取某服务器可用场地数量，然后选出合适数量的配对玩家，开启场地，把玩家传进去
function BWT_InitOneRound()
	do
		return BWT_InitOneRoundEx();	--用最新的配对规则
	end;
	local nCount = BWT_GetServerIdleRoomNum();
	local tbPlayer = {};
	local nRetCode,nPIdx1,nPIdx2 = 0,0,0;
	local nPairCount = 0;
	for i=1,nCount do
		nRetCode,nPIdx1,nPIdx2 = BWT_SentInviteToPlayer();
		if nRetCode == -1 then	--如果没通过检查
			tinsert(tbPlayer,nPIdx1);	--加到table里面
			tinsert(tbPlayer,nPIdx2);
		elseif nRetCode == 1 then
			nPairCount = nPairCount + 1;
		end;
	end;
	local nOldPIdx = PlayerIndex;
	--BWT_SentInviteToPlayer会把玩家从列表中移除，所以下面的代码是要把玩家加回去的
	for i=1,getn(tbPlayer) do	--把玩家加回列表
		PlayerIndex = tbPlayer[i];
		if GetTask(TSK_CHECK_FAIL) == 0 then	--如果检查通过了就加回列表
			BWT_JoinGestConvention();
		end;
	end;
	PlayerIndex = nOldPIdx;
	return nPairCount;
end;
--另一个初始化比武的函数
--根据一定的规则选出n（floor(列表中的玩家数量/2)）对玩家
function BWT_InitOneRoundEx()
	-- 先检查队列 取出不符合的人
	BWT_CheckAllPlayerState();
	--
	local tbPlayer = {};
	local nRetCode,nPIdx1,nPIdx2 = 0,0,0;
	local nPairCount = 0;
	local nPair = floor(GetGestQueueSize()/2);	--取得配对的对数
	local nPIdx1,nPIdx2 = 0,0;
	for i=1,nPair do
		nRetCode,nPIdx1,nPIdx2 = BWT_GetPairGestPlayer(i);	--此函数会让玩家退出列表
		if nRetCode == 0 then
			tinsert(tbPlayer,nPIdx1);
		else
			nRetCode = BWT_SentInviteToPlayer(nPIdx1, nPIdx2);	--该函数也会让选中的玩家暂时退出列表
			if nRetCode == 0 then
				break
			elseif nRetCode == -1 then	--如果没通过检查
				tinsert(tbPlayer,nPIdx1);
				tinsert(tbPlayer,nPIdx2);
			elseif nRetCode == 1 then
				nPairCount = nPairCount + 1;
				BWT_CostOneRount(nPIdx1, nPIdx2);
			end
		end
	end

	local nOldPIdx = PlayerIndex;
	--BWT_SentInviteToPlayer会把玩家从列表中移除，所以下面的代码是要把玩家加回去的
	for i = 1, getn(tbPlayer) do	--把玩家加回列表
		PlayerIndex = tbPlayer[i];
		if GetTask(TSK_CHECK_FAIL) == 0 then	--如果检查通过了就加回列表
			BWT_JoinGestConvention();
		end
	end
	PlayerIndex = nOldPIdx;
	--AddRuntimeStat(26,1,0,2*nPairCount)--参与1V1人次
	return nPairCount;
end
--获得一对玩家。
--参数2为奇数时为最高积分的玩家配对，然后把玩家移除出列表，
--参数2为偶数时为最低积分的玩家配对，然后把玩家移除出列表，
--重复以上配对过程直到列表里面没有玩家
function BWT_GetPairGestPlayer(nOrder)
	local nQueueSize = GetGestQueueSize();
	if nQueueSize <= 1 then
		return 0,0,0;	--唯一返回配对失败的情况
	end

	local nDirection			= 0;	--1为向上匹配玩家，-1为向下匹配玩家
	local nPIdx1				= 0;	--玩家1的索引
	local nPIdx2				= 0;	--玩家2的索引
	local nLevel				= 0;	--玩家1的等级
	local nPoint				= 0;	--玩家1的当前积分
	local nResult				= 0;	--玩家1胜负数

	if mod(nOrder,2) == 1 then	--奇数
		nPIdx1 = GetPlayerByGestQueueIndex(nQueueSize - 1);
		nDirection = -1;	--向下匹配
	else	--偶数
		nPIdx1 = GetPlayerByGestQueueIndex(0);
		nDirection = 1;		--向上匹配
	end

	nLevel	= GetLevel(nPIdx1);
	nPoint	= GetTask(TSK_CURREALRESULT, nPIdx1);
	nResult	= GetTask(TASKID_BIWU_MATCH_RESULT, nPIdx1);

	local nPointRangeLv		= 0;	--积分差等级
	local nPointRangeStep		= 30;	--积分差步长
	local nPointRangeLvMax		= 3;	--积分差最大等级
	local nLevelRangeLv		= 0;	--等级差等级
	local nLevelRangeStep		= 1;	--等级差步长
	local nLevelRangeLvMax		= 99;	--等级差最大等级
	nPointRangeLv = nPointRangeLvMax;
	nLevelRangeLv = nLevelRangeLvMax;

	local nTempPIdx			= 0;				--临时玩家
	local nTempPointRangeLv	= 0;				--临时积分差等级
	local nTempLevelRangeLv	= 0;				--临时等级差等级
	local nQueueIdx			= 0;				--配对列表里面的队列索引
	local nMaxQueueIdx			= nQueueSize - 1;	--配对列表中的最大索引，由于索引是从0开始的，所以最大索引就是nQueueSize-1

	for i = 1, nMaxQueueIdx do
		local bPass = 1;
		nQueueIdx = floor((nMaxQueueIdx * (1 - nDirection) / 2) + nDirection * i);	--从头搞还是从尾搞
		nTempPIdx = GetPlayerByGestQueueIndex(nQueueIdx);

		if 1 == bPass then
			bPass = ((nTempPIdx > 0) and 1) or 0;
		end

		if 1 == bPass then
			bPass = ((nResult == GetTask(TASKID_BIWU_MATCH_RESULT, nTempPIdx)) and 1) or 0;
		end

		if 1 == bPass then
			bPass = GLB_BW_Block_Route_Check_Ex(nPIdx1, nTempPIdx);
		end

		if 1 == bPass then
			nTempPointRangeLv = floor(abs(nPoint - GetTask(TSK_CURREALRESULT, nTempPIdx)) / nPointRangeStep) + 1;
			nTempLevelRangeLv = floor(abs(nLevel - GetLevel(nTempPIdx))                   / nLevelRangeStep) + 1;

			if nTempPointRangeLv < nPointRangeLv then
				bPass = 1;
			elseif nTempPointRangeLv == nPointRangeLv then
				if nTempLevelRangeLv < nLevelRangeLv then
					bPass = 1;
				elseif nTempLevelRangeLv == nLevelRangeLv then
					bPass = random(0, 1);
				else
					bPass = 0;
				end
			else
				bPass = 0;
			end
		end

		if 1 == bPass then
			nPIdx2			= nTempPIdx;
			nPointRangeLv	= nTempPointRangeLv;
			nLevelRangeLv	= nTempLevelRangeLv;
		end
	end

	if 0 == nPIdx2 then
		return 0, nPIdx1, nPIdx2;
	end

	BWT_QuitGestConvention(nPIdx1);
	BWT_QuitGestConvention(nPIdx2);
	return 1, nPIdx1, nPIdx2;
end
--检查所有玩家的状态是否可以参加比武
function BWT_CheckAllPlayerState()
	local nQueueSize	= GetGestQueueSize();
	local tFailPlayer	= {};
	for i = 0, nQueueSize - 1 do
		local nPIdx = GetPlayerByGestQueueIndex(i);
--		if 0 == CheckXYY(nPIdx) then
--			tinsert(tFailPlayer, nPIdx);
--		end
	end

	tFailPlayer.n = nil;
	for _, nPIdx in tFailPlayer do
		BWT_QuitGestConvention(nPIdx);
		GLB_BW_LEAVE(200, nPIdx);
	end
end
--比赛一场要扣除的XX --必须都是能够成功扣除的
function BWT_CostOneRount(nPIdx1, nPIdx2)
	GLB_BW_Block_Route_Cost(nPIdx1);
	GLB_BW_Block_Route_Cost(nPIdx2);
end
--检查玩家当前状态是否可以接受邀请
function BWT_CheckPlayerState(nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx;
	local nTimeElapse = GetTime() - GetTask(TSK_LAST_INVITE_TIME);
	if nTimeElapse >= 0 and nTimeElapse <= INVITE_INTERVAL_TIME then	--如果nTimeElapse小于0,那么表示出现过跨服行为，这种情况不必限制他
		BWDH_SetTask(TSK_CHECK_FAIL,0);	--也算检查通过
		PlayerIndex = nOldPIdx;
		return 0;	--如果距离上次拒绝或比武结束时间小于INVITE_INTERVAL_TIME秒
	end;
	--PK值大于4,死亡，摆摊，不在合法地图
	if GetPKValue() >= 4 or IsPlayerDeath() == 1 or IsStalling() == 1 or BWT_CheckValidMap() == 0 then	--如果当前是死亡状态或在摆摊或不在合法地图
		BWDH_SetTask(TSK_CHECK_FAIL,1);	--这里作一个检查不通过的标记
		TaskTip("Tr筺g th竔 c馻 b筺 hi謓 kh玭g 頲 t� v�, b筺  r阨 kh醝 cu閏 thi.");
		Msg2Player("Tr筺g th竔 c馻 b筺 hi謓 kh玭g 頲 t� v�, b筺  r阨 kh醝 cu閏 thi. H穣 ki觤 tra 甶觤 PK c馻 b筺 c� ph秈 >=4, hi謓 c� ph秈 � tr筺g th竔 t� vong ho芻 產ng � g莕 Tuy襫 Ch﹗");
		PlayerIndex = nOldPIdx;
		return 0;
	end;
	BWDH_SetTask(TSK_CHECK_FAIL,0);	--检查通过标记
	PlayerIndex = nOldPIdx;
	return 1;
end;
--检查当前所处地图是不是可以接收比武邀请
function BWT_CheckValidMap(nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	local tbValidMap = {
				100,105,108,103,104,106,107,109,110,111,112,
				113,114,115,116,151,306,307,319,320,974,7100,
				};
	local nCurMapID = GetWorldPos();
	for i=1,getn(tbValidMap) do
		if nCurMapID == tbValidMap[i] then
			PlayerIndex = nOldPIdx;
			return 1;
		end;
	end;
	PlayerIndex = nOldPIdx;
	return 0;
end;
--向一对选手发送比武邀请
function BWT_SentInviteToPlayer(nPIdx1,nPIdx2)
	local nHour = tonumber(date("%H"));
	if BWT_CheckBiWuTime() == 0 then
		return 0;	--不在比武时间内
	end;
	local nOldPIdx = PlayerIndex;
	if not nPIdx1 then	--如果没有输入参数
		nPIdx1,nPIdx2 = GetPairGestPlayer();
	end;
	if nPIdx1 == 0 and nPIdx2 == 0 then	--如果没配对成功
		return 0;
	end;
	BWT_QuitGestConvention(nPIdx1);	--选出来后先退出列表
	BWT_QuitGestConvention(nPIdx2);
	if BWT_CheckPlayerState(nPIdx1) == 0 or BWT_CheckPlayerState(nPIdx2) == 0 then
		return -1,nPIdx1,nPIdx2;
	end;
	local nCurTime = GetTime();
	PlayerIndex = nPIdx1;
	BWT_SetTaskTemp(TSK_TEMP_CHOICE,0);	--清选择情况
	BWDH_SetTask(TSK_LAST_INVITE_TIME,nCurTime);
	BWDH_SetTask(TSK_OPPNAME_HASH,Hash(GetName(nPIdx2)));	--记录对手名字HASH码用于回调时的最终确认
	PlayerIndex = nPIdx2;
	BWT_SetTaskTemp(TSK_TEMP_CHOICE,0);
	BWDH_SetTask(TSK_OPPNAME_HASH,Hash(GetName(nPIdx1)));
	BWDH_SetTask(TSK_LAST_INVITE_TIME,nCurTime);
	OnWant(nPIdx1,nPIdx2);
	PlayerIndex = nOldPIdx;
	return 1;
end;
--获取临时变量的值
function BWT_GetTaskTemp(nID,nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	local nValue = GetTaskTemp(TSK_TEMP_CHOICE);
	PlayerIndex = nOldPIdx;
	return nValue;
end;
--设置临时变量
function BWT_SetTaskTemp(nID,nValue,nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	SetTaskTemp(nID,nValue);
	PlayerIndex = nOldPIdx;
end;
--获取动态比武场地ID
function BWT_GetIdleRoom()
	local nCount = 0;
	local nMapID,nMapIdx = 0,0;
	for i,v in TB_MAPID do
		if SubWorldID2Idx(i) >= 0 then
			nCount = GetMapLoadCount(v[2]);
			if nCount < MAX_ROOM_NUM then
				nMapID,nMapIdx = DynamicLoadMap(v[2]);
				return nMapID,nMapIdx,i;
			end;
		end;
	end;
	return 0,0,0;
end;
--开启一场比武
function BWT_OpenMatch(nPIdx1,nPIdx2)
	local nMapID,nMapIdx,nCityID = BWT_GetIdleRoom();
	if nMapID == 0 and nMapIdx == 0 then
		return 0;
	end;
	local nOldPIdx = PlayerIndex;
--	local nDirection,nNum = BWT_GetFieldDirection(nCityID);
--	if nDirection == 0 then
--		gf_ShowDebugInfor("BWT_GetFieldDirection返回值为0,0");
--		WriteLog("["..LOG_ERROR_HEAD.."]:BWT_GetFieldDirection返回值为0,0");
--		print("Fail2");
--		return 0;
--	end;
	if mf_OpenMission(MISSION_ID,nMapID) == 1 then
		mf_SetMissionV(MISSION_ID,MV_CITY_ID,nCityID,nMapID);
		mf_SetMissionV(MISSION_ID,MV_MAPID,nMapID,nMapID);
		mf_SetMissionV(MISSION_ID,MV_MAPIDX,nMapIdx,nMapID);
--		mf_SetMissionV(MISSION_ID,MV_FIELD_DIRECTION,nDirection,nMapID);
		mf_SetMissionV(MISSION_ID,MV_FIELD_NUM,nNum,nMapID);
		PlayerIndex = nPIdx1;
		mf_JoinMission(MISSION_ID,A_CAMP,nMapID);
		PlayerIndex = nPIdx2;
		mf_JoinMission(MISSION_ID,B_CAMP,nMapID);
--		BWT_InitOneRound();	--再初始化一轮
		WriteLog(format("[Чi H閕 T� V� b総 u] [Hai b猲 i tr薾: %s vs %s] [Th玭g tin tr薾 u: %d,%d,%d]",GetName(nPIdx1),GetName(nPIdx2),nMapID,nMapIdx,nCityID))
	end;
	PlayerIndex = nOldPIdx;
end;
--关闭比武场地
function BWT_CloseField()
	local nMapID = GetMissionV(MV_MAPID);
	local nMapIdx = GetMissionV(MV_MAPIDX);
	CloseMission(MISSION_ID);
	local nRetCode = FreeDynamicMap(nMapID,nMapIdx);	--FreeDynamicMap也会调用CloseMisssion
	if nRetCode == 0 then
		WriteLog("["..LOG_ERROR_HEAD.."]:FreeDynamicMap b� l鏸, nRetCode:"..nRetCode);
	end;
	WriteLog(format("[Чi H閕 T� V� k誸 th骳] [Th玭g tin tr薾 u: %d,%d]",nMapID,nMapIdx))
end;
--检查玩家装备是否符合比武规定，如果符合规定返回1,不符合返回0和一个table
--table里面指明了还有哪些位置的装备不符合
function BWT_CheckEquipment(nPIdx)
	do--所有装备都允许
		return 1
	end
	
--	local nOldPIdx = PlayerIndex;
--	PlayerIndex = nPIdx or PlayerIndex;
--	local nEquipIdx = 0;
--	local nCheckNum = 0;
--	local tbEquipPos = {};	--装备信息table
--	for i=1,6 do	--检查头衣裤武器首饰1首饰2
--		nEquipIdx = GetPlayerEquipIndex(i-1);
--		if nEquipIdx == 0 then	--没穿装备
--			nCheckNum = nCheckNum + 1;
--			tbEquipPos[i] = 1;
--		else
--			if BWT_CheckSuohunEquip(nEquipIdx) == 1 then
--				if BWT_CheckNormalEquip(nEquipIdx) == 1 or BWT_CheckSuitEquip(nEquipIdx) == 1 then	--套装和普通装检查成功
--					nCheckNum = nCheckNum + 1;
--					tbEquipPos[i] = 1;
--				else
--					tbEquipPos[i] = 0;
--				end;
--			else
--				tbEquipPos[i] = 0;
--			end
--		end;
--	end;
--	for i=7,12 do	--检查头衣裤武器首饰1首饰2
--		nEquipIdx = GetPlayerEquipIndex(i-1);
--		if nEquipIdx == 0 then	--没穿装备
--			nCheckNum = nCheckNum + 1;
--			tbEquipPos[i] = 1;
--		else
--			if BWT_CheckSuohunEquip(nEquipIdx) == 1 then
--				nCheckNum = nCheckNum + 1;
--				tbEquipPos[i] = 1;
--			else
--				tbEquipPos[i] = 0;
--			end
--		end;
--	end;
--	PlayerIndex = nOldPIdx;
--	if nCheckNum == 12 then	--所有装备都通过检查
--		return 1,tbEquipPos;
--	else
--		return 0,tbEquipPos;
--	end;
end;

--检查所穿装备是否是自己名字的锁魂装备
function BWT_CheckSuohunEquip(nEquipIdx)
	local nOwnName = GetItemOwner(nEquipIdx);
	local nPlayerName = GetName();
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then
		local strGbGroup,strName = GLB_BW_GetRealmName(GetName());
		nPlayerName = strName;
	end
	if nOwnName == "" or nOwnName == nPlayerName then
		return 1;
	else
		return 0;
	end
end

--检查套装
function BWT_CheckSuitEquip(nEquipIdx)
	if BWT_CheckBaGuaSuit(nEquipIdx) == 1
		or BWT_CheckRouteSuitID(nEquipIdx) == 1
		or BWT_CheckCangJianSuitID(nEquipIdx) == 1
		or BWT_ShiTuSuitID(nEquipIdx) == 1 then
		return 1;
	else
		return 0;
	end;
end;
--检查八卦装ID
function BWT_CheckBaGuaSuit(nEquipIdx)
	if GetItemMaxLingQi(nEquipIdx) > 0 then
		return 1;
	end;
	return 0;
end;
--检查师门装ID
function BWT_CheckRouteSuitID(nEquipIdx)
	local nRoute = GetPlayerRoute();
	local nSuitID = GetEquipSuitID(nEquipIdx);
	for i=1,getn(TB_ROUTE_SUIT_ID[nRoute]) do
		if nSuitID == TB_ROUTE_SUIT_ID[nRoute][i] then
			return 1;
		end;
	end;
	return 0;
end;
--检查藏剑套装ID
function BWT_CheckCangJianSuitID(nEquipIdx)
	local nRoute = GetPlayerRoute();
	local nSuitID = GetEquipSuitID(nEquipIdx);
	for i=1,getn(TB_CANGJIAN_SUIT_ID) do
		if nSuitID == TB_CANGJIAN_SUIT_ID[i] then
			return 1;
		end;
	end;
	return 0;
end;
--检查师徒装套装ID
function BWT_ShiTuSuitID(nEquipIdx)
	local nRoute = GetPlayerRoute();
	local nSuitID = GetEquipSuitID(nEquipIdx);
	for i=1,getn(TB_SHITU_SUIT_ID) do
		if nSuitID == TB_SHITU_SUIT_ID[i] then
			return 1;
		end;
	end;
	return 0;
end;
--检查普通装备
function BWT_CheckNormalEquip(nEquipIdx)
	if BWT_CheckHatID(nEquipIdx) == 1
		or BWT_CheckClothID(nEquipIdx) == 1
		or BWT_CheckTrousersID(nEquipIdx) == 1
		or BWT_CheckRingID(nEquipIdx) == 1
		or BWT_CheckWeaponID(nEquipIdx) == 1 then
		return 1;
	else
		return 0;
	end;
end;
--检查首饰ID
function BWT_CheckRingID(nEquipIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx);
	if nID1 == 0 and nID2 == 102 then
		for i=1,getn(TB_RING_ID) do
			if type(TB_RING_ID[i]) == "table" then
				if nID3 >= TB_RING_ID[i][1] and nID3 <= TB_RING_ID[i][2] then
					return 1;
				end
			else
				if nID3 == TB_RING_ID[i] then
					return 1;
				end
			end
		end;
	end;
	return 0;
end;
--检查帽子ID
function BWT_CheckHatID(nEquipIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx);
	if nID1 == 0 and nID2 == 103 then
		for i=1,getn(TB_HAT_ID) do
			if type(TB_HAT_ID[i]) == "table" then
				if nID3 >= TB_HAT_ID[i][1] and nID3 <= TB_HAT_ID[i][2] then
					return 1;
				end
			else
				if nID3 == TB_HAT_ID[i] then
					return 1;
				end
			end
		end;
	end;
	return 0;
end;
--检查衣服ID
function BWT_CheckClothID(nEquipIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx);
	if nID1 == 0 and nID2 == 100 then
		for i=1,getn(TB_CLOTH_ID) do
			if type(TB_CLOTH_ID[i]) == "table" then
				if nID3 >= TB_CLOTH_ID[i][1] and nID3 <= TB_CLOTH_ID[i][2] then
					return 1;
				end
			else
				if nID3 == TB_CLOTH_ID[i] then
					return 1;
				end
			end
		end;
	end;
	return 0;
end;
--检查裤子ID
function BWT_CheckTrousersID(nEquipIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx);
	if nID1 == 0 and nID2 == 101 then
		for i=1,getn(TB_TROUSERS_ID) do
			if type(TB_TROUSERS_ID[i]) == "table" then
				if nID3 >= TB_TROUSERS_ID[i][1] and nID3 <= TB_TROUSERS_ID[i][2] then
					return 1;
				end
			else
				if nID3 == TB_TROUSERS_ID[i] then
					return 1;
				end
			end
		end;
	end;
	return 0;
end;
--检查武器ID
function BWT_CheckWeaponID(nEquipIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx);
	for i=1,getn(TB_WEAPON_ID) do
		if nID1 == TB_WEAPON_ID[i][1] and nID2 == TB_WEAPON_ID[i][2] and nID3 == TB_WEAPON_ID[i][3] then
			return 1;
		end;
	end;
	return 0;
end;
--初始化场地NPC
function BWT_InitFieldNpc()
	local nMapID = gf_GetCurMapID();
	local nNpcIdx = CreateNpc("Rng  Trung Nguy猲","Th� kh�",nMapID,1533,3170);
	SetNpcScript(nNpcIdx,"\\script\\biwudahui\\npc\\npc_itemkeeper.lua");
	nNpcIdx = CreateNpc("Rng  Trung Nguy猲","Th� kh�",nMapID,1655,3317);
	SetNpcScript(nNpcIdx,"\\script\\biwudahui\\npc\\npc_itemkeeper.lua");
end;
--获得可用的比武场地的方向与编号
function BWT_GetFieldDirection(nCityID)
	local tbMapID = gf_GetDataTable(GetSameMaps(TB_MAPID[nCityID][2]));
	local tbFieldInfo = {};
	local nMapID = 0;
	local nDirection,nNum = 0,0;
	for i=1,getn(tbMapID) do
		nMapID = tbMapID[i];
		if nMapID ~= TB_MAPID[nCityID][2] then
			if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nMapID) ~= MS_STATE_IDEL then
				nDirection = mf_GetMissionV(MISSION_ID,MV_FIELD_DIRECTION,nMapID);
				nNum = mf_GetMissionV(MISSION_ID,MV_FIELD_NUM,nMapID);
				tinsert(tbFieldInfo,{nDirection,nNum});
			end;
		end;
	end;
	local bFound = 0;
	for i=1,4 do  --四个方向
		for j=1,8 do  --每个方向有几个场地
			bFound = 0;
			for k=1,getn(tbFieldInfo) do
				if tbFieldInfo[k][1] == i and tbFieldInfo[k][2] == j then
					bFound = 1;
				end;
			end;
			if bFound == 0 then
				return i,j;
			end;
		end;
	end;
	return 0,0;
end;
--获得某场比武的信息，包括比武双方索引，场地当前状态，是否允许观看
function BWT_GetMatchInfo(nCityID,nDirection,nNum)
	local nMapID = BWT_GetDesMapID(nCityID,nDirection,nNum);
	if nMapID == 0 then
		return 0,0,0,0;
	end;
	local szName1,szName2 = BWT_GetFighterName(nMapID);
	local nState = mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nMapID);
	local nPIdx1 = mf_GetMissionV(MISSION_ID,MV_PLAYERINDEX1,nMapID);
	local nPIdx2 = mf_GetMissionV(MISSION_ID,MV_PLAYERINDEX2,nMapID);
	if GetTask(TSK_ALLOW_AUDIENCE,nPIdx1) == 1 and GetTask(TSK_ALLOW_AUDIENCE,nPIdx2) == 1 then
		return nPIdx1,nPIdx2,nState,1;
	else
		return nPIdx1,nPIdx2,nState,0;
	end;
end;
--获得目标比武地图的地图ID，如果返回地图ID为0则表示该场地未开启
function BWT_GetDesMapID(nCityID,nDirection,nNum)
	local nFieldID = TB_MAPID[nCityID][2];
	local tbMapID = gf_GetDataTable(GetSameMaps(nFieldID));
	local nMapID = 0;
	local nFieldDirection,nFieldNum = 0,0;
	for i=1,getn(tbMapID) do
		nMapID = tbMapID[i];
		nFieldDirection = mf_GetMissionV(MISSION_ID,MV_FIELD_DIRECTION,nMapID);
		nFieldNum = mf_GetMissionV(MISSION_ID,MV_FIELD_NUM,nMapID);
		if nFieldDirection == nDirection and nFieldNum == nNum then
			return nMapID;
		end;
	end;
	return 0;
end;
--观众加入观看
function BWT_AudienceJoin(nCityID,nDirection,nNum,bAllow)
	if bAllow == 0 then
		Talk(1,"","Xin l鏸! Ngi ch琲 � T� v� trng n祔 kh玭g cho ngi kh竎 xem thi u.");
		return 0;
	end;
	local nMapID = BWT_GetDesMapID(nCityID,nDirection,nNum);
	local nState = mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nMapID);
	local nAudienceNum = mf_GetPlayerCount(MISSION_ID,AUDIENCE_CAMP,nMapID);
	if nState == MS_STATE_IDEL then
		Talk(1,"","Khu v鵦 n祔  b� ng.");
		return 0;
	end;
	if nAudienceNum >= MAX_AUDIENCE_NUM then
		Talk(1,"","S� lng ngi khu v鵦 n祔  t gi韎 h筺 t鑙 產: <color=yellow>"..MAX_AUDIENCE_NUM.."<color> ngi");
		return 0;
	end;
	mf_JoinMission(MISSION_ID,AUDIENCE_CAMP,nMapID);
end;
--处理Trap点。
--输入参数为方向。函数里面进行场地内处的判断
function BWT_ProcessTrap(nDirection)
	do
		return 0
	end
	if GetTaskTemp(TSK_TEMP_CAMP) == 0 then	--场外Trap点处理
		local selTab = {};
		local nCityID = 0;
		local nCurMapID = GetWorldPos();
		local nPIdx1,nPIdx2 = 0,0;
		local nState = 0;
		for i,v in TB_MAPID do
			if v[1] == nCurMapID then
				nCityID = i;
				break;
			end;
		end;
		for i=1,8 do
			nPIdx1,nPIdx2,nState,bAllow = BWT_GetMatchInfo(nCityID,nDirection,i);
			if nState > MS_STATE_IDEL then
				tinsert(selTab,format("Ta mu鑞 v祇"..i.." - (khu thi u)/#BWT_AudienceJoin(%d,%d,%d,%d)",nCityID,nDirection,i,bAllow));
			end;
		end;
		if getn(selTab) == 0 then
			Talk(1,"","L玦 i n祔 kh玭g c� ngi thi u");
			return 0;
		end;
		tinsert(selTab,"Kh玭g v祇 xem/nothing");
		local tbDirection = {"Hng ng","Hng nam","Hng T﹜","Hng B綾"};
		Say("B筺 mu鑞 v祇 khu v鵦 n祇 trong <color=yellow>"..tbDirection[nDirection].."<color>?",getn(selTab),selTab);
	else	--场内Trap点处理
		DelMSPlayer(MISSION_ID,AUDIENCE_CAMP);
	end;
end;

--记录胜负，nResultType为1时表示平局
function BWT_AddBiWuRecord(nWinnerIdx,nLoserIdx,nResultType)
	nResultType = nResultType or 0;
	local nOldPIdx = PlayerIndex;
	local nCurWeekWin = 0;
	local nCurXinDeNum = 0;
	local nCount = 0;
	PlayerIndex = nWinnerIdx;
	BWDH_SetTask(TASKID_BIWU_MATCH_RESULT, 1);
	BWDH_SetTask(TSK_CURWEEKMATCH,GetTask(TSK_CURWEEKMATCH)+1);
	BWDH_SetTask(TSK_TOTALMATCH,GetTask(TSK_TOTALMATCH)+1);
	if GetTask(TSK_CURWEEKMATCH) <= REQUIRE_MATCH_TIME then --记录前10场的胜场数
		BWDH_SetTask(TASK_BIWU_WIN_10,GetTask(TASK_BIWU_WIN_10)+1);
	end
	if GetTask(TSK_CURWEEKMATCH) >= REQUIRE_MATCH_TIME then --10场后强制登记
		BWDH_SetTask(TSK_CURSIGNEDRESULT,GetTask(TSK_CURREALRESULT));
		SignUpGestResult();
	end
	if nResultType ~= 1 then
		nCurWeekWin = GetTask(TSK_CURWEEKWIN);
		BWDH_SetTask(TSK_TOTALWIN,GetTask(TSK_TOTALWIN)+1);
		BWDH_SetTask(TSK_CURWEEKWIN,nCurWeekWin+1);
		--成就---------------------------------------
--		BWDH_SetTask(TASKID_ACH_BIWU_WIN_TOTAL,GetTask(TASKID_ACH_BIWU_WIN_TOTAL)+1);
--		local nRoute = GetPlayerRoute();
--		local nLoseRoute = GetPlayerRoute(nLoserIdx);
--		if nRoute == 31 or nRoute == 32 then
--			BWDH_SetTask(TASKID_ACH_USE_NEW_ROUTE,GetTask(TASKID_ACH_USE_NEW_ROUTE)+1);
--		end
--		if nLoseRoute == 31 or nLoseRoute == 32 then
--			BWDH_SetTask(TASKID_ACH_WIN_NEW_ROUTE,GetTask(TASKID_ACH_WIN_NEW_ROUTE)+1);
--		end
		----------------------------------------------
--		if GLB_BW_BiWuCheck() == 1 then	
--			if GetTask(TSK_CURWEEKWIN) <= REQUIRE_MATCH_TIME then --前10场有
--				BWDH_SetTask(TASK_BIWU_DUIZHAN_JINGYAN,GetTask(TASK_BIWU_DUIZHAN_JINGYAN)+12);
--				Msg2Player("你获得12点对战经验，每人每周可以获得120点对战经验，你已经获得了"..(GetTask(TSK_CURWEEKWIN)*12).."点对战经验");
--			end
--		end
		WLZB_AddPoint();	-- baqizhi
	end;
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 and GLB_BW_BiWuCheck() == 1 then --把变量写入数据库
		--GLB_BW_SetTask(0,0,tRelayTask);
		
		exgsvr_func_save_player_task()--向源服存盘
--		local nRoute = GetPlayerRoute();
--		if nRoute == 21 then --恶心的蛊师
--			GLB_BW_SetTask(0,1,tGushiTask);
--		end
--		GLB_BW_SetTask(0,2);--同步逍遥币
--		GLB_BW_SetTask(0,3);--同步逍遥玉
	end
	WriteLog(format("[Чi H閕 T� V鈃 [Role: %s Acc: %s  C蕄: %d  t輈h 甶觤: %d  m玭 ph竔: %d   K誸 qu�: th緉g K� hi謚 h遖: %d]", GetName(), GetAccount(), GetLevel(),GetTask(TSK_CURREALRESULT),GetPlayerRoute(),nResultType));
	PlayerIndex = nLoserIdx;
	BWDH_SetTask(TASKID_BIWU_MATCH_RESULT, 0);
	BWDH_SetTask(TSK_CURWEEKMATCH,GetTask(TSK_CURWEEKMATCH)+1);
	BWDH_SetTask(TSK_TOTALMATCH,GetTask(TSK_TOTALMATCH)+1);
	if GetTask(TSK_CURWEEKMATCH) <= REQUIRE_MATCH_TIME then --记录前10场的负场数
		BWDH_SetTask(TASK_BIWU_LOSE_10,GetTask(TASK_BIWU_LOSE_10)+1);
	end
	if GetTask(TSK_CURWEEKMATCH) >= REQUIRE_MATCH_TIME then --10场后强制登记
		BWDH_SetTask(TSK_CURSIGNEDRESULT,GetTask(TSK_CURREALRESULT));
		SignUpGestResult();
	end
	if nResultType ~= 1 then
		BWDH_SetTask(TSK_TOTALLOSE,GetTask(TSK_TOTALLOSE)+1);
		BWDH_SetTask(TSK_CURWEEKLOSE,GetTask(TSK_CURWEEKLOSE)+1);
		if GLB_BW_BiWuCheck() == 1 then
--			if GetTask(TSK_CURWEEKMATCH) <= REQUIRE_MATCH_TIME then --前10场有，已经修改为失败没有了
--				BWDH_SetTask(TASK_BIWU_DUIZHAN_JINGYAN,GetTask(TASK_BIWU_DUIZHAN_JINGYAN)+8);
--				Msg2Player("你获得8点对战经验，每周的前10场较艺可以获得对战经验。");
--			end
		end
		WLZB_DecPoint();	-- baqizhi
	end;
	if nCurGs == 1 and GLB_BW_BiWuCheck() == 1 then --把变量写入数据库
		exgsvr_func_save_player_task()--向源服存盘
--		GLB_BW_SetTask(0,0,tRelayTask);
--		local nRoute = GetPlayerRoute();
--		if nRoute == 21 then --恶心的蛊师
--			GLB_BW_SetTask(0,1,tGushiTask);
--		end
--		GLB_BW_SetTask(0,2);
--		GLB_BW_SetTask(0,3);
	end
	WriteLog(format("[Чi H閕 T� V鈃 [Role: %s Acc: %s  C蕄: %d  t輈h 甶觤: %d  m玭 ph竔: %d   K誸 qu�: b筰 K� hi謚 h遖: %d]", GetName(), GetAccount(), GetLevel(),GetTask(TSK_CURREALRESULT),GetPlayerRoute(),nResultType));
	PlayerIndex = nOldPIdx;
end;
--获得周数
function BWT_GetWeekNum()
--	local nCurTime = GetTime();
--	local nOffset = 8*3600*24+13*3600; 	--暂时我还没算明白
--	nCurTime = nCurTime - nOffset;
--	return floor(nCurTime/(7*3600*24));
	local nWeekNum = GetPlayerBwRank();
	return nWeekNum;
end;
--每周一清。记住：playerloginin里还有一份一模一样的代码
function BWT_WeeklyClear()
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then --跨服不鸟
		return 0;
	end
	local nWeekNum = BWT_GetWeekNum();
	local nBodyWeek = GetTask(TSK_BODY_WEEK);
	if nWeekNum == -1 then	--Relay挂了
		return 0;
	end;
	if nBodyWeek - nWeekNum >= 1 then	--合服后nWeekNum会从0开始
		WriteLog(format("[biwudahui] BWT_WeeklyClear [Role:%s Acc:%s Level:%d BodyWeek=%d WeekNum=%d repair BodyWeek ]", GetName(), GetAccount(), GetLevel(),nBodyWeek, nWeekNum))
		BWDH_SetTask(TSK_BODY_WEEK,nWeekNum-1);	--同步玩家身上的周数
		BWDH_SetTask(TSK_GET_AWARD_WEEK,nWeekNum-1);	--同步玩家领取奖励的周数
		nBodyWeek = nWeekNum-1;
	end;
	if nBodyWeek >= nWeekNum then
		return 0;
	end;
	BWT_PointAttenuation();
	BWDH_SetTask(TSK_CURWEEKMATCH,0);	--本周总参与场次
	BWDH_SetTask(TSK_CURWEEKWIN,0);		--本周胜利场次
	BWDH_SetTask(TSK_CURWEEKLOSE,0);		--本周失败场次
	BWDH_SetTask(TSK_CURWEEKGETXINDE,0);	--本周通过较艺获得的心得数量
	BWDH_SetTask(TSK_CURSIGNEDRESULT,0);	--登记积分清0
	BWDH_SetTask(TSK_GET_XINDE_STATE,0);	--本周获得实战心得情况清0
	BWDH_SetTask(TSK_USE_XINDE,0);		--本周使用实战心得清０
	BWDH_SetTask(TSK_BUY_HORSE,0);		--本周买马清０
	BWDH_SetTask(TSK_USE_CHUANGONG_XINDE,0);	--使用传功心得
	BWDH_SetTask(TSK_XZ_AWARD_JUNGONG,0);	--本周兑换的战场奖励次数
	BWDH_SetTask(TSK_XZ_AWARD_SHIMEN,0);		--本周兑换的师门奖励次数
	BWDH_SetTask(TSK_XZ_AWARD_LINGSHI,0);	--本周兑换的灵石奖励次数
	BWDH_SetTask(TSK_XZ_AWARD_JINGYAN,0);	--本周兑换的经验奖励次数
	BWDH_SetTask(TASK_BIWU_WIN_10,0);	--前10场的胜利场次
	BWDH_SetTask(TASK_BIWU_LOSE_10,0);	--前10场的失败场次
	BWDH_SetTask(TASK_BIWU_GET_AWARD_10,0);	--是否领取了前10场的奖励
--	BWDH_SetTask(TASKID_3F_BW_AWARD,0); --三节活动
	if GetTask(TSK_CURREALRESULT) < 200 then
		BWDH_SetTask(TSK_CURREALRESULT,200);	--低于100分的回归到100分
	end;
end;
--锁定与解锁装备
function BWT_LockEquipment(bLock)
	local tbEquipPos = {0,1,2,3,4,5,6,7,8,10,17,18,19};
	for i=1,getn(tbEquipPos) do
		ForbidEquipSolt(tbEquipPos[i],bLock);
	end
end;
--检查是否要把观众踢出场地
function BWT_CheckKickAudience()
	local nPIdx1 = mf_GetMissionV(MISSION_ID,MV_PLAYERINDEX1);
	local nPIdx2 = mf_GetMissionV(MISSION_ID,MV_PLAYERINDEX2);
	if nPIdx1 == 0 or nPIdx2 == 0 then
		return 0;
	end;
	if GetTask(TSK_ALLOW_AUDIENCE,nPIdx1) == 0 or GetTask(TSK_ALLOW_AUDIENCE,nPIdx2) == 0 then
		mf_Say2Camp(MISSION_ID,AUDIENCE_CAMP,"Tuy觧 th� thi u kh玭g mu鑞 c� ngi xem, b筺  tho竧 kh醝 khu v鵦 thi u.",0,"");
		mf_DelAllMSPlayer(MISSION_ID,AUDIENCE_CAMP);
		return 1;
	end;
	return 0;
end;

--修改较艺积分
function BWT_AddPoint(nPoint,nPIdx)
	local nOldPIdx = PlayerIndex;
	nPIdx = nPIdx or PlayerIndex;
	BWT_WeeklyClear();
	local nCurPoint = GetTask(TSK_CURREALRESULT);
	local nRegPoint = GetTask(TSK_CURSIGNEDRESULT);
	nCurPoint = nCurPoint + nPoint;
	BWDH_SetTask(TSK_CURREALRESULT,nCurPoint);
	if nPoint > 0 then
		BWDH_SetTask(TSK_TOTAL_POINT,GetTask(TSK_TOTAL_POINT)+nPoint);
	end;
	if GetTask(TSK_CURWEEKMATCH) >= REQUIRE_MATCH_TIME then --如果当前分数比之前登记的分数要低30分
		BWDH_SetTask(TSK_CURSIGNEDRESULT,nCurPoint);
--		SignUpGestResult();	--强制把分数登记上去
--		gf_ShowMsg("您当前的真实积分比登记积分低了30分或更多，所以系统进行强行登记，您现在的登记积分是<color=yellow>"..nCurPoint.."<color>。",2);
	end;
	if GetTask(TSK_JOIN_LIST) == 1 then
		QuitGestConvention();
		JoinGestConvention();
	end;
	PlayerIndex = nOldPIdx;
end;
--积分进行衰减
function BWT_PointAttenuation()
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay挂了
		return 0;
	end;
	local nBodyWeek = GetTask(TSK_BODY_WEEK);
	if nBodyWeek >= nWeekNum then
		return 0;
	end;
	local nCurPoint = GetTask(TSK_CURREALRESULT);
	local nWeekElapse = nWeekNum - nBodyWeek;
	local nAttenPoint = BWT_GetPointAttenuation(nCurPoint,nWeekElapse);
	if nCurPoint-nAttenPoint > 0 then
		Msg2Player("觤 t輈h l騳 t� v� gi秏"..(nCurPoint-nAttenPoint).." 甶觤");
	end;
	BWDH_SetTask(TSK_CURREALRESULT,nAttenPoint);
	BWDH_SetTask(TSK_BODY_WEEK,nWeekNum);	--记录衰减的周数
	BWDH_SetTask(TSK_LASTWEEKLADDER,0);	--衰减时清掉上周排名
	if nBWRank ~= -1 and nBWRank <= 10 then	--如果进入了排行榜
		BWDH_SetTask(TSK_LASTWEEKLADDER,nBWRank);
		local nBestWeekRank = GetTask(TSK_HIGHESTWEEKLADDER);
		if nBestWeekRank == 0 or nBWRank < nBestWeekRank then
			BWDH_SetTask(TSK_HIGHESTWEEKLADDER,nBWRank);	--最高周排名
		end;
	end;
	WriteLog("["..LOG_HEAD.."]:"..GetName().."觤 t輈h l騳 t� v� gi秏. Trc l骳 gi秏: "..nCurPoint..", sau khi gi秏: "..nAttenPoint);
end;
--封装的QuitGestConvention
function BWT_QuitGestConvention(nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	QuitGestConvention();
	BWDH_SetTask(TSK_JOIN_LIST,0);
--	if BWDH_DEBUG_VERSION == 1 then
--		Msg2Player("QuitGestConvention")
--	end
	PlayerIndex = nOldPIdx;
end;
--封装的JoinGestConvention
function BWT_JoinGestConvention(nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	local nLevel = GetLevel();
	if nLevel >= MIN_LEVEL then
		JoinGestConvention();
		BWDH_SetTask(TSK_JOIN_LIST,1);
	end;
--	if BWDH_DEBUG_VERSION == 1 then
--		Msg2Player("JoinGestConvention")
--	end
	PlayerIndex = nOldPIdx;
end;
--比武开始时对玩家进行的设置
function BWT_SetPlayerFightState(nCamp,nPIdx)
	local nOldPIdx = PlayerIndex;
	nPIdx = nPIdx or PlayerIndex;
	PlayerIndex = nPIdx;
	BWT_LockEquipment(1);
	UseSkillEnable(1);
	DesaltPlayer(0,0);
	Restore();
	RestoreNeili();
	ClearColdDown();	--清除所有药CD
	CastState("imme_clear_skill_interval",-1,0);	--消除所有技能的冷却时间
	PlayerIndex = nOldPIdx;
end;
--设置玩家随机位置
function BWT_SetRandomPos(nPIdx, nExcept)
	local nOldPIdx = PlayerIndex;
	nPIdx = nPIdx or PlayerIndex;
	PlayerIndex = nPIdx;
	local nRand = random(1,getn(TB_ENTRY[4]));
	if nExcept and nExcept == nRand then
		nRand = nRand + 1
		if nRand > getn(TB_ENTRY[4]) then
			nRand = 1
		end
	end
	SetPos(TB_ENTRY[4][nRand][1],TB_ENTRY[4][nRand][2]);
	Restore();
	RestoreNeili();
	PlayerIndex = nOldPIdx;
	return nRand
end;
--计算积分衰减，返回值是经过衰减后的积分（这个函数名起得很有问题啊-_-b）
function BWT_GetPointAttenuation(nPoint,nWeek)
	if nPoint <= 300 then
		return nPoint;
	end;
	for i=1,nWeek do
		if nPoint <= 300 then
			break;
		else
			nPoint = nPoint - floor((nPoint-300)/2);
		end;
	end;
	return nPoint;
end;
--获得“一周”剩余时间（单位秒）
function BWT_GetWeekTimeLeft()
	local nWeekDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nSecLeft = 60*60*24-(nHour*3600+nMin*60+nSec);
	local nTime = 0;
	if nWeekDay < 5 then
		nTime = (5-nWeekDay-1)*3600*24+nSecLeft+21*3600;
	elseif nWeekDay == 5 then
		nTime = 6*3600*24+nSecLeft+21*3600;
	else
		nTime = (11-nWeekDay)*3600*24+nSecLeft+21*3600;
	end;
	return nTime;
end;
--检查是不是在比武时间段
function BWT_CheckBiWuTime()
--	local nWeekDay = tonumber(date("%w"));
--	if nWeekDay ~= 0 and nWeekDay ~= 1 and nWeekDay ~= 6 then
--		return 0;
--	end
	if BWDH_DEBUG_VERSION and BWDH_DEBUG_VERSION == 1 then
		return 1
	end
	
	local nHour = tonumber(date("%H"));
	--19点至21点
	if nHour >= 20 and nHour < 22 then
		return 1
	else
		return 0;
	end;
end;
--==========================================================================================
--说明相关的内容，还是写在一起吧，不然改来改去太麻烦了
function know_detail()
	local selTab = {
				"Чi h閕 t� v�/know_detail_1",
				"So t礽/know_detail_2",
				"h筺g/know_detail_3",
				"觤/know_detail_4",
				--"奖励/know_detail_5",
				"T筸 th阨 kh玭g c莕/nothing",
				}
	Say(g_szInfoHead.."C竎 h� mu鑞 bi誸 phng di謓 n祇?",getn(selTab),selTab);
end;

function know_detail_1()
	Talk(1,"know_detail",g_szInfoHead.."Чi h閕 t� v鈂n    Чi h閕 t� v� l� g�? с ch輓h l� cu閏 thi do tri襲 nh t� ch鴆 nh籱 tuy觧 ch鋘 nh﹏ s� v� l﹎ 璾 t�, 頲 chia l祄 2 giai 畂筺: V遪g lo筰 v� v遪g chung k誸. N誹 b筺 mu鑞 tham gia, c莕 ph秈 n Bi謓 Kinh t譵 c S� Чi H閕 T� V�,  l� ngi 頲 tri襲 nh  c� chuy猲 ph鬰 tr竎h Чi h閕 t� v�.\n    Ch� c� ngi ch琲 chuy觧 sinh 5 c蕄 96 tr� l猲 m韎 c� th� tham gia Чi h閕 t� v� thi猲 h�  nh蕋.");
end;

function know_detail_2()
	Talk(1,"know_detail_2_2",g_szInfoHead.."T� v� \n    T� v� nh� th� n祇? Sau khi t� v� li猲 server m� ra, u ti猲 b筺 c莕 t譵 i s� Чi H閕 T� V�  n khu v鵦 t� v� li猲 server. Sau , s� c� th� � giao di謓 Чi H閕 T� V� ch鋘 t� v�.\n   Mu鑞 t� v� r蕋 n gi秐, c� t� 20:00-22:00, ch� c莕 b筺 � trong khu v鵦 t� v� li猲 server, trong giao di謓 Чi H閕 T� V� ch鋘 t� v� l� 頲 r錳, h� th鑞g s� t� ng gi髉 b筺 t譵 i th�.\n   Ch� �, ch� c莕 t譵 頲 i th�, h� th鑞g s� t� ng a b筺 l猲 l玦 i t� v�.");
end;

function know_detail_2_1()
	Talk(1,"know_detail_2_2",g_szInfoHead.."Nh薾 th玭g tin thi u � u?\n    Khu v鵦 b筺 c� th� nh薾 頲 th玭g tin thi u hi謓 c�:\n    Tuy襫 Ch﹗, T﹜ Tuy襫 Ch﹗, B綾 Tuy襫 Ch﹗, Йng H秈 H秈 T﹏ 1, Йng H秈 H秈 T﹏ 2, Long Tuy襫 th玭, V� Di s琻, Thanh  ng_1, Thanh  ng_2, Thanh Kh� ng, Lng Th駓 ng_1, Lng Th駓 ng_2, Vng M蓇 ng_1, Vng M蓇 ng_2, V﹏ M閚g Tr筩h, Giang T﹏ th玭, Phong Й, Phong Ma ng_1, Phong Ma ng_2, b猲 ngo礽 i h閕 t� v� Tuy襫 Ch﹗.");
end;

function know_detail_2_2()
	Talk(2,"know_detail",g_szInfoHead.."T� v� n猲 ch� � g�? \n     в m鋓 ngi c� th� t� v� trong m閠 m玦 trng c玭g b籲g, cho n猲 t ra m閠 s� quy t綾. Trc khi t� v� c莕 ch� � n閕 dung di y: \n1: khi a v祇 l玦 i t� v� t蕋 c� tr筺g th竔 tr猲 ngi s� b� x鉧, bao g錷 pet 甶 theo ho芻 thi th� do Ng� чc T� Hi謕 chi猽 g鋓 c騨g b� x鉧. \n2: ngo礽 danh hi謚 s� m玭 ra, c竎 danh hi謚 kh竎 u v� hi謚 trong l玦 i t� v�. \n3: Thu閏 t輓h m鏸 10 gi﹜ ph鬰 h錳 sinh l鵦 v� n閕 l鵦 tr猲 trang b� s� v� hi謚\n","\n4: kh玭g th� i trang b�, nh璶g c� th� i m藅 t辌h");
end;

function know_detail_3()
	Talk(1,"know_detail_3_1",g_szInfoHead.."X誴 h筺g \n    	x誴 h筺g th� n祇? n誹 b筺 t� v�  10 tr薾 ho芻 10 tr薾 tr� l猲 trong tu莕, h� th鑞g s� t� ng ng k� 甶觤 t輈h l騳 c馻 b筺. ng k� 甶觤 t輈h l騳 th� c� th� tham gia x誴 h筺g tu莕 nay. 11 gi� 30 ph髏 t鑙 ch� nh藅 c馻 m鏸 tu莕 s� ti課 h祅h x誴 h筺g. <color=yellow> ch� �: ph秈 m b秓 trc 11 gi� 30 ph髏 tr� v� server ngu錸.<color>");
end;
function know_detail_3_1()
	Talk(1,"know_detail",g_szInfoHead.."X誴 h筺g\n    X誴 h筺g c� t竎 d鬾g g�? n誹 x誴 h筺g c� th� 甶 v祇 top 10 c馻 l璾 ph竔, th� ngi c� th� nh薾 頲 甶觤 t� c竎h v� gi秈 thng; n誹 x誴 h筺g u c馻 l璾 ph竔, th� ch骳 m鮪g ngi, ngi  l�  nh蕋 cao th� c馻 l璾 ph竔 m譶h tu莕 nay, s� nh薾 頲 甶觤 x誴 h筺g cao nh蕋 v� gi秈 thng nhi襲 nh蕋.\n    Gamer x誴 h筺g t鑤 s� 甶 v祇 b秐g x誴 h筺g i h閕 t� v� li猲 server.n誹 ngi ch璦 v祇 top 10 c馻 l璾 ph竔 m譶h, ng n秐 l遪g, ch� c莕 t� v�  10 tr薾 trong tu莕 nay,c騨g c� th� nh薾 thng.nh薾 thng t筰 giao di謓 i h閕 t� v�,click nh薾 gi秈 thng ti課 h祅h thao t竎 tng quan.");
end;

function know_detail_4()
	Talk(1,"know_detail",g_szInfoHead.."X誴 h筺g \n    觤 l� g�? 觤 c馻 Чi H閕 T� V� c� 2 lo筰, m閠 lo筰 l� 甶觤 t輈h l騳 t� v�, m閠 lo筰 l� 甶觤 t� c竎h. \n 甶觤 t輈h l騳 t� v� l� 甶觤 t╪g v� gi秏 khi t� v� nh薾 頲, h� th鑞g ng k� xong s� x誴 h筺g theo 甶觤 n祔, n誹 甶觤 vt qua 300, m鏸 tu莕 nh鱪g 甶觤 vt qua 300  s� b� gi秏 n鯽.");
end;

--function know_detail_5()
--	Talk(1,"know_detail_5_1",g_szInfoHead.."奖励分以下几种：\n    经验：开启跨服比武大会预选赛之后，根据每周参加比武的前10场较艺结果，在本	服比武大会界面领取“实战心得”。每周从较艺中最多可以拿到20本“实战心得”。\n    积分达到120分可以在比武界面领取10本实战心得，积分达到150分可以多领取10	本实战心得，积分达到200分可以再领取10本实战心得。\n    每周最多可换取50本“实战心得”，每周可以使用100本“实战心得”。");
--end;
--
--function know_detail_5_1()
--	Talk(1,"know_detail_5_2",g_szInfoHead.."    刻板：参加跨服比武大会预选赛，根据本周的胜场数可在比武大会界面领取首饰类花	纹刻板奖励。每人每周最多可获得10场胜场奖励。\n    对战经验：参加跨服比武大会预选赛，获胜后可获得对战经验。每人每周最多可获得	10场胜场的对战经验。对战经验可在比武大会界面“兑换装备”处兑换首饰类花纹刻板。");
--end;
--
--function know_detail_5_2()
--	Talk(1,"know_detail",g_szInfoHead.."    称号：积分排名到前10就有专门的称号，第1名一档，第2、3名一档，第4至10名一档。不同档次的称号会附带一定的能力加成。\n    坐骑：只要拿到本流派的前3名，就有资格领取特定坐骑：爪黄飞电或赤兔，本流派的第1名，可以免费租用爪黄飞电或赤兔。\n    租到的神驹能够维持7天。");
--end
--===========================================================================================
--奖励的也放这里吧，不然要修改两个地方太麻烦了。
function BWT_GetAward()
	BWT_WeeklyClear();
	local strtab = {
		"Nh薾 thng t� v� tu莕 n祔/BWT_GetWeekAward",
		"Nh薾 thng x誴 h筺g tu莕 trc/BWT_GetRankAward",
--		"领取区服奖励/BWT_GetGlobalAward",
		"K誸 th骳 i tho筰/nothing"
	};
	Say(g_szInfoHead.."B筺 mu鑞 nh薾 thng lo筰 n祇?",
		getn(strtab),
		strtab)
end;

function BWT_GetWeekAward()
	local strtab = {
		"Nh薾 thng tr薾 tham gia/BWT_GetWeekAward_Win",
		--"领取比武积分的奖励/BWT_GetWeekAward_Point",
		--"领取剑侠币奖励/BWT_GetWeekAward_Gold",
		"K誸 th骳 i tho筰/nothing",
	}
	local nDate = tonumber(date("%Y%m%d"));
--	if nDate <= 20101010 then
--		tinsert(strtab,3,"领取烟火材料包/BWT_GetYanhuo");
--	end
	Say(g_szInfoHead.."B筺 mu鑞 nh薾 thng lo筰 n祇?",
		getn(strtab),
		strtab)
end

function BWT_GetWeekAward_Gold()
	if GetTask(TSK_CURWEEKWIN) < 10 then
		Talk(1,"",g_szInfoHead.."Чi H閕 T� V� tu莕 n祔 kh玭g th緉g  10 tr薾, kh玭g th� nh薾 thng.");
		return 0;
	end
	if gf_GetTaskByte(TASK_BIWU_GET_AWARD_10,2) ~= 0 then
		Talk(1,"",g_szInfoHead.."B筺  nh薾 ph莕 thng V祅g v� l﹎ c馻 tu莕 n祔.");
		return 0;
	end
	gf_SetTaskByte(TASK_BIWU_GET_AWARD_10,2,1, TASK_ACCESS_CODE_BIWUDAHUI);
	gf_SetLogCaption("Чi H閕 T� V�-Ph莕 thng V祅g v� l﹎");
	gf_Modify("Money",300000);
	gf_SetLogCaption("");
end

function BWT_GetWeekAward_Win()
	if GetTask(TSK_CURWEEKMATCH) < REQUIRE_MATCH_TIME then
		Talk(1,"",g_szInfoHead.."S� l莕 ngi tham gia so t礽 tu莕 n祔 輙 h琻 <color=yellow>"..REQUIRE_MATCH_TIME.."<color> tr薾, kh玭g th� nh薾 thng.");
		return 0;
	end
	if gf_GetTaskByte(TASK_BIWU_GET_AWARD_10,1) ~= 0 then
		Talk(1,"",g_szInfoHead.."B筺  nh薾 thng tr薾 tham gia tu莕 trc.");
		return 0;
	end
	
	local nExp = 20000000 --* GetTask(TASK_BIWU_WIN_10) / REQUIRE_MATCH_TIME
--	local nCount = GetTask(TASK_BIWU_WIN_10)*2+GetTask(TASK_BIWU_LOSE_10);
--	local nRingCount = min(GetTask(TSK_CURWEEKWIN),10)*4;  --每周最多获得10场胜利的刻板
	if nExp > 0 then
		if gf_Judge_Room_Weight(3,10,"") ~= 1 then
			return 0;
		end
		gf_SetTaskByte(TASK_BIWU_GET_AWARD_10,1,1, TASK_ACCESS_CODE_BIWUDAHUI);
		--soul_GivePoint(GetTask(TSK_CURWEEKWIN) * 10);
		gf_SetLogCaption("Чi H閕 T� V�-Ph莕 thng tr薾 tham gia")
		--gf_AddItemEx({2,1,1101,nCount},"实战心得");
		--gf_AddItemEx({2,95,1511,10,4},"斗魄令");
--		if GLB_BW_BiWuCheck() == 1 then
--			gf_AddItemEx({2,95,595,nRingCount},"1级戒指纹饰刻板");
----			EarnXYY(10);
--		end
		--gf_Modify("Pvp",2400);
		--gf_Modify("Dzjy",2400);
		gf_Modify("Exp",nExp);
		gf_AddItemEx({2,1,30499,2},"Hu﹏ chng anh h飊g");
		gf_AddItemEx({2,1,30692,10},"Rng Чi H閕 T� V�");
		AddRuntimeStat(20, 1, 0, 1)
		AddRuntimeStat(20, 4, 0, 10)
		gf_SetLogCaption("");
		--Observer:onEvent(OE_BIWU_MATCH,{GetTask(TSK_CURWEEKMATCH),GetTask(TASK_BIWU_WIN_10),GetTask(TASK_BIWU_LOSE_10)});
	end;
end

function BWT_GetYanhuo()
--	local nDate = tonumber(date("%Y%m%d"));
--	if nDate <= 20101010 then
--		local nCurAward = GetTask(TASKID_3F_BW_AWARD);
--		local nCurMatch = GetTask(TSK_CURWEEKMATCH);
--		if nCurAward < 30 then
--			local nCurCount = min(nCurMatch,30) - nCurAward
--			if nCurCount > 0 then
--				BWDH_SetTask(TASKID_3F_BW_AWARD,GetTask(TASKID_3F_BW_AWARD)+nCurCount);
--				gf_SetLogCaption("3f2010.比武大会")
--				gf_AddItemEx({2,95,738,nCurCount},"烟火材料包");
--				Msg2Player("每1场比武可获得1个烟火材料包，每周最多换取30个！");
--				gf_SetLogCaption("");
--			else
--				Talk(1,"",g_szInfoHead.."领取烟火材料包数量等于当周参加比武大会的场次数量，每周最多换取30个！目前你没有新的烟火材料包可以领取，本周你已经领取了"..nCurAward.."个烟火材料包。")
--			end
--		else
--			Talk(1,"",g_szInfoHead.."每周最多换取30个！本周你已经领取完了，下周再来吧。");
--		end
--	end
end

function BWT_GetWeekAward_Point()
	if GetTask(TSK_CURWEEKMATCH) < REQUIRE_MATCH_TIME then
		Talk(1,"",g_szInfoHead.."S� l莕 ngi tham gia so t礽 tu莕 n祔 輙 h琻 <color=yellow>"..REQUIRE_MATCH_TIME.."<color> tr薾, kh玭g th� nh薾 thng.");
		return 0;
	end
	local nRegPoint = GetTask(TSK_CURREALRESULT); --使用实际的较艺分数
	local nGetXinDeState = GetTask(TSK_GET_XINDE_STATE);
	local nCount = 0;
	if nRegPoint >= 200 and nGetXinDeState < 30 then
		BWDH_SetTask(TSK_GET_XINDE_STATE,30);
		nCount = 30 - nGetXinDeState;
	elseif nRegPoint >= 150 and nGetXinDeState < 20 then
		nCount = 20 - nGetXinDeState;
		BWDH_SetTask(TSK_GET_XINDE_STATE,20);
	elseif nRegPoint >= 120 and nGetXinDeState < 10 then
		nCount = 10 - nGetXinDeState;
		BWDH_SetTask(TSK_GET_XINDE_STATE,10);
	end;

	local szString1,szString2,szString3 = "","","";
	local nGetXinDeState = GetTask(TSK_GET_XINDE_STATE);
	if nGetXinDeState == 30 then
		szString1 = "<color=red>Х l穘h<color>";
		szString2 = "<color=red>Х l穘h<color>";
		szString3 = "<color=red>Х l穘h<color>";
	elseif nGetXinDeState == 20 then
		szString1 = "<color=red>Х l穘h<color>";
		szString2 = "<color=red>Х l穘h<color>";
		szString3 = "<color=yellow>Ch璦 l穘h<color>";
	elseif nGetXinDeState == 10 then
		szString1 = "<color=red>Х l穘h<color>";
		szString2 = "<color=yellow>Ch璦 l穘h<color>";
		szString3 = "<color=yellow>Ch璦 l穘h<color>";
	else
		szString1 = "<color=yellow>Ch璦 l穘h<color>";
		szString2 = "<color=yellow>Ch璦 l穘h<color>";
		szString3 = "<color=yellow>Ch璦 l穘h<color>";
	end;

	if nCount > 0 then
		gf_AddItemEx({2,1,1101,nCount},"Th鵦 chi課 t﹎ c");
		Talk(1,"",g_szInfoHead.."T譶h h譶h nh薾 thng nh� sau:\n觤 t輈h l騳 t 120 nh薾 頲 10 Th鵦 Chi課 T﹎ Ьc       "..szString1.."\n觤 t輈h l騳 t 150 nh薾 ti誴 10 Th鵦 Chi課 T﹎ Ьc     "..szString2.."\n觤 t輈h l騳 t 200 nh薾 th猰 10 Th鵦 Chi課 T﹎ Ьc     "..szString3);
	else
		Talk(1,"",g_szInfoHead.."T譶h h譶h nh薾 thng nh� sau:\n觤 t輈h l騳 t 120 nh薾 頲 10 Th鵦 Chi課 T﹎ Ьc       "..szString1.."\n觤 t輈h l騳 t 150 nh薾 ti誴 10 Th鵦 Chi課 T﹎ Ьc     "..szString2.."\n觤 t輈h l騳 t 200 nh薾 th猰 10 Th鵦 Chi課 T﹎ Ьc     "..szString3);
	end;
end

function BWT_GetRankAward()
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay挂了
		return 0;
	end;
	if nBWRank == -1 or nBWRank > 10 then
		Talk(1,"",g_szInfoHead.."X誴 h筺g 甶觤 t輈h l騳 tu莕 trc kh玭g n籱 trong 10 h筺g u n猲 kh玭g 頲 nh薾 ph莕 thng.");
		return 0;
	end;
	local selTab = {};
--	tinsert(selTab,"我要领取称号/BWT_GetTitleAward");
--	tinsert(selTab,"我要领取武器特效/BWT_GetWeaponEffectAward");
--	if nBWRank <= 3 then	--前３名可以买马
--		tinsert(selTab,"我要租用坐骑/BWT_GetHorseAward");
--	end;
	tinsert(selTab,format("Gi秈 thng x誴 h筺g/#BWT_GetRankAward_Exp(%d)", nBWRank));
	tinsert(selTab,"T筸 th阨 kh玭g l穘h/nothing");
	Say(g_szInfoHead.."X誴 h筺g 甶觤 t輈h l騳 tu莕 trc l� h筺g <color=yellow>"..nBWRank.."<color>, b筺 mu鑞 nh薾 ph莕 thng n祇?",getn(selTab),selTab);
	BWT_PointAttenuation();
end

function BWT_GetRankAward_Exp(nBWRank)
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if GetTask(TSK_GET_AWARD_WEEK) >= nWeekNum then
		Talk(1,"",g_szInfoHead.."B筺  nh薾 ph莕 thng.");
		return 0;
	end;
	if nBWRank >= 1 and nBWRank <= 10 then
		local nExp = 100000000--(11 - nBWRank)*10000*10000
		gf_SetLogCaption("Gi秈 thng x誴 h筺g m鏸 tu莕 Чi H閕 T� V�")
		BWDH_SetTask(TSK_GET_AWARD_WEEK,nWeekNum);
		gf_Modify("Exp",nExp);
		gf_AddItemEx({2,1,30499,6},"Hu﹏ chng anh h飊g");
		gf_AddItemEx({2,1,30692,30},"Rng Чi H閕 T� V�");
		AddRuntimeStat(20, 2, 0, 1)
		AddRuntimeStat(20, 4, 0, 30)
		
		gf_SetLogCaption("");
	end
end

function BWT_GetWeaponEffectAward()
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay挂了
		return 0;
	end;
	if nBWRank == -1 or nBWRank > 10 then
		Talk(1,"",g_szInfoHead.."X誴 h筺g 甶觤 t輈h l騳 tu莕 trc kh玭g n籱 trong 10 h筺g u n猲 kh玭g 頲 nh薾 ph莕 thng.");
		return 0;
	end;
	local nCheckRoute,nRoutePos = gf_CheckPlayerRoute();
	if nCheckRoute == 0 then
		return 0;
	end;
	if GetTask(TSK_WEAPON_EFFECT_WEEK) >= nWeekNum then
		Talk(1,"",g_szInfoHead.."B筺  nh薾 ph莕 thng.");
		return 0;
	end;
	local nWeaponIdx = GetPlayerEquipIndex(2)
	--武器装备判断
	if  nWeaponIdx == 0 then
		Talk(1,"",g_szInfoHead.."H穣 trang b� v� kh� trc r錳 n t譵 ta!")
		return 0;
	end
	local nType = 0;
	if nBWRank == 1 then	--如果是第一名
		nType = 1;
	else
		nType = 2;
	end;
	local selTab = {
				"уng �/#BWT_AddWeaponEffect("..nType..")",
				"H駓 b�/nothing",
				}
	Say(g_szInfoHead.."Nh薾 danh hi謚 i h閕 t� v� s� <color=yellow>che m蕋 danh hi謚 s� m玭 ho芻 danh hi謚 i h閕 v� l﹎ c飊g lo筰 c馻 b筺<color>, b筺 x竎 nh薾 mu鑞 nh薾 ph莕 thng danh hi謚 c馻 i h閕 t� v�?",getn(selTab),selTab);
end;

function BWT_AddWeaponEffect(nType)
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay挂了
		return 0;
	end;
	if nBWRank == -1 or nBWRank > 10 then
		Talk(1,"",g_szInfoHead.."X誴 h筺g 甶觤 t輈h l騳 tu莕 trc kh玭g n籱 trong 10 h筺g u n猲 kh玭g 頲 nh薾 ph莕 thng.");
		return 0;
	end;
	local nWeaponIdx = GetPlayerEquipIndex(2);
	--武器装备判断
	if  nWeaponIdx == 0 then
		Talk(1,"",g_szInfoHead.."H穣 trang b� v� kh� trc r錳 n t譵 ta!")
		return 0;
	end
	local tbWeaponEffect = {"Ph� Qu﹏","Tinh Di"};
	local szWeaponEffectName = tbWeaponEffect[nType];
	BWDH_SetTask(TSK_WEAPON_EFFECT_WEEK,nWeekNum);
	BindWeaponEffect(szWeaponEffectName,7*24*3600);
	Msg2Player("B筺  nh薾 hi謚 鴑g c馻 v� kh�:"..szWeaponEffectName..", th阨 gian duy tr� l� 7 ng祔.");
	WriteLog("["..LOG_HEAD.."]:"..GetName().."Х nh薾 thng hi謚 鴑g c馻 v� kh�:"..szWeaponEffectName);
end;

function BWT_GetTitleAward()
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay挂了
		return 0;
	end;
	if nBWRank == -1 or nBWRank > 10 then
		Talk(1,"",g_szInfoHead.."X誴 h筺g 甶觤 t輈h l騳 tu莕 trc kh玭g n籱 trong 10 h筺g u n猲 kh玭g 頲 nh薾 ph莕 thng.");
		return 0;
	end;
	local nCheckRoute,nRoutePos = gf_CheckPlayerRoute();
	if nCheckRoute == 0 then
		return 0;
	end;
	if GetTask(TSK_GET_AWARD_WEEK) >= nWeekNum then
		Talk(1,"",g_szInfoHead.."B筺  nh薾 ph莕 thng.");
		return 0;
	end;
	local nTitleGenre = 0;
	if nRoutePos == 2 then	--唉，由于配置表填错了，只好将错就错了
		nRoutePos = 3;
	elseif nRoutePos == 3 then
		nRoutePos = 2;
	end;
	if nBWRank == 1 then	--如果是第一名
		if nBWLevel == 0 then	--如果是新秀比武大会
			nTitleGenre = 27;
		else	--如果是天下第一比武大会
			nTitleGenre = 28;
		end;
	elseif nBWRank <= 3 then
		nTitleGenre = 26;
	elseif nBWRank <= 10 then
		nTitleGenre = 25;
	end;
	local selTab = {
				"уng �/#BWT_AddBiWuTitle("..nTitleGenre..","..nRoutePos..")",
				"H駓 b�/nothing",
				}
	Say(g_szInfoHead.."Nh薾 danh hi謚 i h閕 t� v� s� <color=yellow>che m蕋 danh hi謚 s� m玭 ho芻 danh hi謚 i h閕 v� l﹎ c飊g lo筰 c馻 b筺<color>, b筺 x竎 nh薾 mu鑞 nh薾 ph莕 thng danh hi謚 c馻 i h閕 t� v�?",getn(selTab),selTab);
end;

function BWT_AddBiWuTitle(nID1,nID2)
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay挂了
		return 0;
	end;
	if nBWRank == -1 or nBWRank > 10 then
		Talk(1,"",g_szInfoHead.."X誴 h筺g 甶觤 t輈h l騳 tu莕 trc kh玭g n籱 trong 10 h筺g u n猲 kh玭g 頲 nh薾 ph莕 thng.");
		return 0;
	end;
	local nTimeLeft = 7*24*3600;
	BWT_RemoveOtherBiWuTitle(nID2);
	AddTitle(nID1,nID2);
	SetTitleTime(nID1, nID2, GetTime() + nTimeLeft);
	SetCurTitle(nID1, nID2);
	BWDH_SetTask(TSK_GET_AWARD_WEEK,nWeekNum);
	WriteLog("["..LOG_HEAD.."]:"..GetName().."Nh薾 ph莕 thng danh hi謚 i h閕 t� v�. ID danh hi謚: "..nID1..", "..nID2);
end;

function BWT_RemoveOtherBiWuTitle(nRoutePos)
	for i=23,28 do
		if IsTitleExist(i,nRoutePos) == 1 then
			RemoveTitle(i,nRoutePos);
		end;
	end;
end;

function BWT_GetHorseAward()
	if GetTask(TSK_BUY_HORSE) ~= 0 then
		Talk(1,"","Tu莕 n祔 b筺  thu� th� ci, kh玭g th� thu� n鱝.");
		return 0;
	end;
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay挂了
		return 0;
	end;
	local selTab = {};
	if nBWLevel == 0 then
		tinsert(selTab,"Thu� X輈h K� (T鑓  30, ph� thu� 10 v祅g)/#BWT_BuyHorse(1)");
		tinsert(selTab,"Thu� Ho祅g K� (T鑓  30, ph� thu� 10 v祅g)/#BWT_BuyHorse(2)");
	else
		tinsert(selTab,"Thu� Tr秓 Ho祅g Phi 謓 (T鑓  40, ph� thu� 20 v祅g)/#BWT_BuyHorse(3)");
		tinsert(selTab,"Thu� X輈h Th� (T鑓  40, ph� thu� 20 v祅g)/#BWT_BuyHorse(4)");
	end;
	tinsert(selTab,"Kh玭g thu�/nothing");
	if nBWRank > 0 and nBWRank <= 3 then
		Say(g_szInfoHead.."X誴 h筺g t輈h l騳 tu莕 trc c馻 b筺 n籱 trong 3 h筺g u, x誴 th� <color=yellow>"..nBWRank.."<color>, b筺 c� th� thu� nh璶g lo筰 th� ci � b猲 tr猲. B筺 mu鑞 thu� lo筰 n祇? <color=red>Ch� �: H筺 s� d鬾g l� 7 ng祔, y猽 c莡 nh﹏ v藅 c蕄 80 m韎 頲 d飊g<color>. <color=yellow>N誹 b筺 h筺g 1 l璾 ph竔 th� 頲 thu� th� ci mi詎 ph�.<color>",getn(selTab),selTab);
	else
		Talk(1,"",g_szInfoHead.."Xin l鏸! Tu莕 trc b筺 kh玭g t 3 h筺g u c馻 l璾 ph竔, kh玭g th� thu� th� ci. Ch骳 b筺 may m緉.");
	end;
end;

g_tbHorseInfo =
{	--ID信息，价格，持续天数
	[1] = {{0,105,5,"X輈h K�"},10,7},
	[2] = {{0,105,6,"Ho祅g K�"},10,7},
	[3] = {{0,105,10,"Tr秓 Ho祅g Phi 謓"},20,7},
	[4] = {{0,105,12,"X輈h Th�"},20,7},
}

function BWT_BuyHorse(nType)
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay挂了
		return 0;
	end;
	if nBWRank <= 0 or nBWRank > 3 then
		Talk(1,"",g_szInfoHead.."X誴 h筺g t輈h l騳 tu莕 trc n籱 trong <color=yellow>3 h筺g u<color> m韎 c� th� thu� th� ci.");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,100,"") == 0 then
		return 0;
	end;
	local nNeedMoney = g_tbHorseInfo[nType][2];
	if nBWRank ~= 1 then	--如果不是第1名就要给钱！
		if GetCash() < nNeedMoney*10000 then
			Talk(1,"","Ng﹏ lng c馻 b筺 kh玭g , b筺 c莕 <color=yellow>"..nNeedMoney.."<color> lng m韎 頲 thu� ng鵤 n祔.");
			return 0;
		end;
		Pay(nNeedMoney*10000);
	end;
	local nItemIdx = 0;
	local nTimeLeft = 7*24*3600;
	local nID1,nID2,nID3 = g_tbHorseInfo[nType][1][1],g_tbHorseInfo[nType][1][2],g_tbHorseInfo[nType][1][3];
	local szHorseName = g_tbHorseInfo[nType][1][4];
	local nLastDay = g_tbHorseInfo[nType][3];
	_,nItemIdx = AddItem(nID1,nID2,nID3,1,1,-1,-1,-1,-1,-1,-1);
	SetItemExpireTime(nItemIdx,nLastDay*24*3600);
	Msg2Player("B筺 nh薾 頲 1 "..szHorseName..", th阨 h筺 "..nLastDay.."Thi猲");
	BWDH_SetTask(TSK_BUY_HORSE,1);
	WriteLog("["..LOG_HEAD.."]:"..GetName().."Thu� 1 con ng鵤: "..szHorseName);
end;
--获得某个玩家的职业名字
function BWT_GetPlayerRouteName(nPIdx)
	local nOldPIdx = PlayerIndex;
	local szRouteName = "";
	PlayerIndex = nPIdx;
	szRouteName = gf_GetRouteName(GetPlayerRoute());
	PlayerIndex = nOldPIdx;
	return szRouteName;
end;
--移除非法的状态
function BWT_RemoveNonlicetState()
	local tbNonlicet =
	{
		[1] = {9901,9906},
		[2] = {19801279,19801281},
	}
	for i=1,getn(tbNonlicet) do
		for j=tbNonlicet[i][1],tbNonlicet[i][2] do
			RemoveState(j);
		end;
	end;
end;
--获取玩家名字
function BWT_GetName(nPIdx)
	nPIdx = nPIdx or PlayerIndex;
	local nOldPIdx = PlayerIndex;
	local szName = "";
	PlayerIndex = nPIdx;
	if GetMaskStatus() == 1 then
		szName = "Ngi th莕 b�";
	else
		szName = GetName();
	end;
	PlayerIndex = nOldPIdx;
	return szName;
end;
function nothing()

end;

--===============以下为处理跨服比武函数======================
tGsName = {
--	{"1-1","桃花岛"},
--	{"1-2","武夷山"},
--	{"1-4","龙门镇"},
--	{"1-7","药王谷"},
--	{"1-10","云梦泽"},
--	{"1-11","冰心洞"},
--	{"1-12","清风阁"},
--	{"1-13","紫云轩"},
--	{"1-14","武林盟"},
--	{"2-1","吴越老祖"},
--	{"2-3","绿林盟主"},
--	{"2-4","枪神嬴天"},
--	{"3-1","天师秘境"},
--	{"3-3","王旗部落"},
--	{"3-7","剑门飞雪"},
--	{"3-9","剑阁蜀道"},
--	{"3-10","楼兰晓月"},
--	{"4-1","落星辰"},
};

--是否开启了跨服比武
--新服开启需要手动修改还要改上面的relay名
function GLB_BW_BiWuCheck()
	return 1;
end

tBwChangeItem = {
--	{30,{{2,95,596,1},"2级首饰纹饰包"}},
--	{5, {{2,95,839,1},"太始石"}},
--	{30,{{2,95,739,1},"比武神秘礼盒"}},
};
g_TempItemName = "Kinh nghi謒 i chi課 ";
--对战经验兑换装备
function GLB_BW_ChangeItem()
	local strtab = {};
	for i = 1,getn(tBwChangeItem) do
		tinsert(strtab,"уng �"..tBwChangeItem[i][1]..g_TempItemName.."фi"..tBwChangeItem[i][2][2].."/#GLB_BW_AskChange("..i..")");
	end
--	tinsert(strtab, "我要领取耀阳令或皓月令	/GLB_BW_Award_Ling");
--	tinsert(strtab, "我要使用耀阳令或皓月令兑换披风或徽章		/#GLB_BW_ChangeItem2(2)");
--	tinsert(strtab, "我要使用皓月碎片或耀阳碎片兑换披风或徽章	/#GLB_BW_ChangeItem2(1)");
	tinsert(strtab, "фi thng PVP	/#show_equip_shop(48)");

	tinsert(strtab,"K誸 th骳 i tho筰/nothing");
	Say("B筺 mu鑞 i ph莕 thng n祇?",
		getn(strtab),
		strtab)
end

function GLB_BW_AskChange(nType)
	if GetTask(TASK_BIWU_DUIZHAN_JINGYAN) < tBwChangeItem[nType][1] then
		Talk(1,"","  "..g_TempItemName.."Kh玭g ."..g_TempItemName.."Tham gia Чi H閕 T� V� li猲 server s� nh薾 頲.");
		return 0;
	end
	Say("Quy誸 nh d飊g <color=yellow>"..tBwChangeItem[nType][1].." 甶觤<color>"..g_TempItemName.."фi <color=yellow>"..tBwChangeItem[nType][2][2].."<color> ch�?",
		3,
		"уng �/#GLB_BW_ConfirmChange("..nType..")",
		"tr� l筰/GLB_BW_ChangeItem",
		"K誸 th骳 i tho筰/nothing")
end

function GLB_BW_ConfirmChange(nType)
	if GetTask(TASK_BIWU_DUIZHAN_JINGYAN) < tBwChangeItem[nType][1] then
		Talk(1,"","  "..g_TempItemName.."Kh玭g ."..g_TempItemName.."Tham gia Чi H閕 T� V� li猲 server s� nh薾 頲.");
		return 0;
	end
	if gf_Judge_Room_Weight(1,100,"") ~= 1 then
		return 0;
	end
	BWDH_SetTask(TASK_BIWU_DUIZHAN_JINGYAN,GetTask(TASK_BIWU_DUIZHAN_JINGYAN)-tBwChangeItem[nType][1]);
	gf_SetLogCaption(" kinh nghi謒 i chi課 i trang b� ")
	gf_AddItemEx(tBwChangeItem[nType][2][1],tBwChangeItem[nType][2][2]);
	gf_SetLogCaption("");
end

function GLB_BW_Award_Ling(bConfirm)
	bConfirm = bConfirm or 0;

	if 1 ~= bConfirm then
		Say("Trong Thi猲 M玭 Tr薾 Li猲 Server, ngi ch琲 cu鑙 c飊g nh tr髇g boss Cu錸g Tng Minh Nh藅, s� c� t� c竎h n ch� c馻 ta nh薾 1 Di謚 Dng L謓h. (Cu錸g Tng Minh Nh藅 ch� xu蕋 hi謓 trong Thi猲 M玭 Tr薾 c馻 bang h閕 c蕄 3, ng th阨 m鏸 c鬽 server li猲 th玭g ch� xu蕋 hi謓 1 con boss) Trong Thi猲 M玭 Tr薾 Li猲 Server, ngi ch琲 cu鑙 c飊g nh tr髇g boss Ng魕 Tng 竚 Nguy謙, s� c� t� c竎h n ch� c馻 ta nh薾 1 H筼 Nguy謙 L謓h.",
		2,
		"Ta mu鑞 nh薾!	/#GLB_BW_Award_Ling(1)",
		"K誸 th骳 i tho筰	/nothing");
		return
	end

	local nYYL	= gf_GetTaskByte(TASKID_TMZ_BOSS, 1);
	local nHYL	= gf_GetTaskByte(TASKID_TMZ_BOSS, 2);

	if 0 == nYYL and 0 == nHYL then
		Talk(1, "", "B筺 kh玭g th� nh薾 Di謚 Dng L謓h ho芻 H筼 Nguy謙 L謓h.");
		return 0;
	end

	if 1 ~= gf_JudgeRoomWeight(2, 100, "") then
		return 0;
	end

	if 0 < nYYL then
		gf_SetLogCaption("фi Di謚 Dng L謓h");
		gf_AddItemEx({2, 95, 742, nYYL, 1, -1, -1, -1, -1, -1, -1}, "Di謚 Dng L謓h");
		gf_SetTaskByte(TASKID_TMZ_BOSS, 1, 0);
	end
	if 0 < nHYL then
		gf_SetLogCaption("фi H筼 Nguy謙 L謓h");
		gf_AddItemEx({2, 95, 743, nHYL, 1, -1, -1, -1, -1, -1, -1}, "H筼 Nguy謙 L謓h");
		gf_SetTaskByte(TASKID_TMZ_BOSS, 2, 0);
	end
	gf_SetLogCaption("");

	return 1;
end

tBwChangeItem2 = {
	[1]	= {
		szMsg	= "D飊g 999 M秐h H筼 Nguy謙 s� i 頲 H筼 Nguy謙 Phi Phong ho芻 Huy Chng, d飊g 999 M秐h Di謚 Dng i 頲 Di謚 Dng Phi Phong ho芻 Huy Chng.",
		tInfo	= { -- 耀阳碎片、皓月碎片、耀阳令、皓月令、天门金文虎符
			{{999, 0, 0, 0, 0},	0,	{{0, 118, 3, 1, 1, -1, -1, -1, -1, -1, -1}, "Di謚 Dng H醓 V﹏ Phi Phong (Giao d辌h)"}},
			{{999, 0, 0, 0, 0},	0,	{{0, 117, 3, 1, 1, -1, -1, -1, -1, -1, -1}, "Di謚 Dng Th鑞g Ng� L謓h (Giao d辌h)"}},
			{{0, 999, 0, 0, 0},	0,	{{0, 118, 2, 1, 1, -1, -1, -1, -1, -1, -1}, "H筼 Nguy謙 C萴 筺 Phi Phong (Giao d辌h)"}},
			{{0, 999, 0, 0, 0},	0,	{{0, 117, 2, 1, 1, -1, -1, -1, -1, -1, -1}, "H筼 Nguy謙  Ngh躠 L謓h (Giao d辌h)"}},
		},
	},
	[2]	= {
		szMsg	= "	Tham gia Thi猲 M玭 Tr薾 Li猲 Server s� nh薾 頲 Di謚 Dng L謓h ho芻 H筼 Nguy謙 L謓h, d飊g v藅 ph萴   n ch� c馻 ta i Phi Phong ho芻 Huy Chng.",
		tInfo	= { -- 耀阳碎片、皓月碎片、耀阳令、皓月令、天门金文虎符
			{{0, 0, 1, 0, 800},	5000, {{0, 118, 3, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng H醓 V﹏ Phi Phong (Kh玭g th� giao d辌h)"}},
			{{0, 0, 1, 0, 800},	5000, {{0, 117, 3, 1, 4, -1, -1, -1, -1, -1, -1}, "Di謚 Dng Th鑞g Ng� L謓h (Kh玭g th� giao d辌h)"}},
			{{0, 0, 0, 1, 200},	1200, {{0, 118, 2, 1, 4, -1, -1, -1, -1, -1, -1}, "H筼 Nguy謙 C萴 筺 Phi Phong (Kh玭g th� giao d辌h)"}},
			{{0, 0, 0, 1, 200},	1200, {{0, 117, 2, 1, 4, -1, -1, -1, -1, -1, -1}, "H筼 Nguy謙  Ngh躠 L謓h (Kh玭g th� giao d辌h)"}},
		},
	},
};

g_TempItemName2 = {{"M秐h Di謚 Dng", 2, 95, 741}, {"M秐h H筼 Nguy謙", 2, 95, 740}, {"Di謚 Dng L謓h", 2, 95, 742}, {"H筼 Nguy謙 L謓h", 2, 95, 743}, {"Thi猲 M玭 Kim V╪ H� Ph�", 2, 100, 45}}

function GLB_BW_ChangeItem2(nIndex)
	if not nIndex then
		return 0;
	end

	local tChange = tBwChangeItem2[nIndex];
	if not tChange then
		return 0;
	end

	local tMenu = {};
	for nElemIdx, tElemInfo in tChange.tInfo do
		local szInfo = "D飊g th�";
		for idx, count in tElemInfo[1] do
			if 0 < count then
				szInfo = szInfo .. format("%d %s,", count, g_TempItemName2[idx][1]);
			end
		end
		if 0 < tElemInfo[2] then
			szInfo = szInfo .. format("%d v祅g,", tElemInfo[2]);
		end
		szInfo = strsub(szInfo, 1, strlen(szInfo) - 2); -- 去掉最后的“，”号 或者 “用”字
		szInfo = szInfo .. format("фi %s	/#GLB_BW_ConfirmChange2(%d, %d)", tElemInfo[3][2], nIndex, nElemIdx);
		tinsert(tMenu, szInfo);
	end

	tinsert(tMenu, "K誸 th骳 i tho筰	/nothing");

	Say(tChange.szMsg, getn(tMenu), tMenu);
end

function GLB_BW_ConfirmChange2(nIndex, nElemIdx)
	if not nIndex then
		return 0;
	end

	local tChange = tBwChangeItem2[nIndex];
	if not tChange then
		return 0;
	end

	local tElem   = tChange.tInfo[nElemIdx];
	if not tElem then
		return 0;
	end

	for idx, count in tElem[1] do
		if count > GetItemCount(g_TempItemName2[idx][2], g_TempItemName2[idx][3], g_TempItemName2[idx][4]) then
			Talk(1, "", "Mang theo tr猲 ngi" .. g_TempItemName2[idx][1] .. "Kh玭g " .. count .. ".");
			return 0;
		end
	end

	if 1 ~= gf_JudgeRoomWeight(1, 100, "") then
		return 0;
	end

	if 0 < tElem[2] and 1 ~= Pay(tElem[2] * 10000) then
		Talk(1, "", "V祅g tr猲 ngi kh玭g " .. tElem[2] .. " Kim ");
		return 0;
	end

	for idx, count in tElem[1] do
		if 0 < count then
			if 1 ~= DelItem(g_TempItemName2[idx][2], g_TempItemName2[idx][3], g_TempItemName2[idx][4], count) then
				WriteLog(format(" i %s [DeleteItem] [Failed] [Acc:%s] [Role:%s] [Item:%sx%d,%d,%d,%d]", tElem[3][2], GetAccount(), GetName(), g_TempItemName2[idx][1], count, g_TempItemName2[idx][2], g_TempItemName2[idx][3], g_TempItemName2[idx][4]));
				return 0;
			end
		end
	end

	gf_SetLogCaption("фi"..tElem[3][2]);
	gf_AddItemEx(tElem[3][1], tElem[3][2]);
	gf_SetLogCaption("");

	Msg2Global(format("Ngi ch琲 %s  i 1 %s", GetName(), tElem[3][2]));

	return 1;
end

--获取跨服玩家区服和名字
function GLB_BW_GetRealmName(strName)
	local aa,bb,strGbGroup,strGbName = strfind(strName,"(.-)*(.*)");
	return strGbGroup,strGbName;
end

tBwGlobalAward = {
	{
		{"Th� ci chuy猲 d飊g cho Чi H閕 T� V� ","GLB_BW_AddItemEx({0,105,107,1,1,-1,-1,-1,-1,-1,-1},'Ng﹏ H�',7*24*3600)"},
		{"Danh hi謚: V遪g lo筰-Gi秈 Nguy猲","GLB_BW_AddTitle(6,3,'V遪g lo筰-Gi秈 Nguy猲')"},
	},
	{
		{"Th� ci chuy猲 d飊g cho Чi H閕 T� V� ","GLB_BW_AddItemEx({0,105,107,1,1,-1,-1,-1,-1,-1,-1},'Ng﹏ H�',7*24*3600)"},
		{"Danh hi謚: V遪g lo筰-� Nguy猲","GLB_BW_AddTitle(6,4,'V遪g lo筰-� Nguy猲')"},
	},
	{
		{"Th� ci chuy猲 d飊g cho Чi H閕 T� V� ","GLB_BW_AddItemEx({0,105,107,1,1,-1,-1,-1,-1,-1,-1},'Ng﹏ H�',7*24*3600)"},
		{"Danh hi謚: V遪g lo筰-H閕 Nguy猲","GLB_BW_AddTitle(6,5,'V遪g lo筰-H閕 Nguy猲')"},
	},
};

function BWT_GetGlobalAward()
	local nWeekNum = BWT_GetWeekNum();
	if nWeekNum == -1 then	--Relay挂了
		return 0;
	end;
	local nBWRank = GetGlobalBwRank();
	if GetTask(TASK_BIWU_GET_REALM_AWARD) >= nWeekNum then
		Talk(1,"",g_szInfoHead.."B筺  nh薾 ph莕 thng.");
		return 0;
	end;
	if gf_Judge_Room_Weight(4,100,g_szInfoHead) ~= 1 then
		return 0;
	end
	local tbRank = GetBwAllRank(1); --参数1表示全服排名，参数0或不填表示本服排名。
	if tbRank == nil or getn(tbRank) == 0 then
		return 0;
	end
	local strName = GetName();
	local strGbGroup,strGbName = "","";
	local strCurGroup = GetRelayGroup();
	local nSelfRank,nBestRank = 0,0;
	local strShowName = "";
	for i=1,getn(tGsName) do
		if tGsName[i][1] == strCurGroup then
			strCurGroup = tGsName[i][2];
			break;
		end
	end
	for i=1,getn(tbRank) do
		strGbGroup,strGbName = GLB_BW_GetRealmName(tbRank[i].Name);
		if strGbName == strName then
			nSelfRank = i;
		end
		if strGbGroup == strCurGroup then
			strShowName = strShowName..","..strGbName;
			if nBestRank == 0 then
				nBestRank = i;
			end
		end
	end
	BWDH_SetTask(TASK_BIWU_GET_REALM_AWARD,nWeekNum);
	if nSelfRank ~= 0 and nSelfRank <= 3 then
		for i = 1,getn(tBwGlobalAward[nBWRank]) do
			dostring(tBwGlobalAward[nBWRank][i][2]);
		end
	end
	local tbRankAward = {{1,{2,0,109,3},"B錸g Lai Ti猲 L�"},{10,{2,0,109,2},"B錸g Lai Ti猲 L�"},{20,{2,0,109,1},"B錸g Lai Ti猲 L�"},};
	if nBestRank > 20 or nBestRank == 0 then
		Talk(1,"",g_szInfoHead.."Tu莕 trc server kh玭g c� cao th� nh薾 頲 t竛 thng c馻 tri襲 nh, mong c竎 v� h穣 ti誴 t鬰 c� g緉g.");
		return 0
	end
	for i = 1,getn(tbRankAward) do
		if nBestRank <= tbRankAward[i][1] then
			gf_AddItemEx(tbRankAward[i][2],tbRankAward[i][3]);
			Msg2Global("Do "..strShowName.."Trong Чi H閕 T� V� bi觰 hi謓 vt tr閕, ngi ch琲 trong server c� th� nh薾 ph莕 thng ["..tbRankAward[i][3].."].");
			break;
		end
	end
end

--把变量值写入共享数据库
function GLB_BW_SetTask(nkey1,nkey2,tb)
	local strGbGroup,strName = GLB_BW_GetRealmName(GetName());
	strName = "Realm_"..strName;
	local TbList = {};
	local TbListTemp = {};
	local nNum = 16;
	local nItemKey = 0;
	local strItemKey = "";
	local strFormat = "";
	if nkey1 == 0 and nkey2 == 1 then --蛊师
		local tb_gushi = {};
		for k,v in tb do
			local nValue = GetTask(v);
			strFormat = strFormat.."d";
			tinsert(tb_gushi,nValue);
		end
		AddRelayShareDataToSourceRealm(strName,nkey1,nkey2,g_ThisFile,"GLB_BW_ST_Nothing",0,"GS",strFormat,gf_UnPack(tb_gushi));
	elseif nkey1 == 0 and nkey2 == 0  then
		for i = 1,getn(tb) do
			tinsert(TbList,tb[i]);
			tinsert(TbList,GetTask(tb[i]));
		end
		nItemKey = ceil(getn(TbList)/nNum);
		for i = 1,nItemKey do
			local strFormat = ""
			TbListTemp[i] = {};
			for j = (i-1)*nNum+1,min(getn(TbList),nNum*i) do
				strFormat = strFormat.."d";
				tinsert(TbListTemp[i],TbList[j]);
			end
			strItemKey = "BW"..tostring(i);
			AddRelayShareDataToSourceRealm(strName,nkey1,nkey2,g_ThisFile,"GLB_BW_ST_Nothing",0,strItemKey,strFormat,gf_UnPack(TbListTemp[i]));
		end
--	elseif nkey1 == 0 and nkey2 == 2 then --逍遥币的消耗
--		AddRelayShareDataToSourceRealm(strName,nkey1,nkey2,g_ThisFile,"GLB_BW_ST_Nothing",0,"XYB","d",GetTask(TASKID_XOYO_CONSUME));
--	elseif nkey1 == 0 and nkey2 == 3 then --逍遥玉的消耗
--		AddRelayShareDataToSourceRealm(strName,nkey1,nkey2,g_ThisFile,"GLB_BW_ST_Nothing",0,"XYY","d",GetTask(TASKID_XOYOYU_CONSUME));
	end
end

function GLB_BW_ST_Nothing()

end

function GLB_BW_AddItemEx(tbItem,strName,nTime)
	nTime = nTime or 0;
	gf_SetLogCaption("Чi H閕 T� V�-Ph莕 thng server");
	local nRet,nIdx = gf_AddItemEx(tbItem,strName);
	if nTime ~= 0 and nIdx ~= 0 then
		SetItemExpireTime(nIdx,nTime);
	end
	gf_SetLogCaption("")
end

function GLB_BW_AddTitle(nID1,nID2,strName)
	for i=3,5 do
		RemoveTitle(6,i);
	end
	if IsTitleExist(nID1,nID2) <= 0 then
		if AddTitle(nID1,nID2) > 0 then
			SetTitleTime(nID1,nID2, GetTime() + 7*24*3600);
			SetCurTitle(nID1,nID2)
			Msg2Player("B筺 nh薾 頲 ["..strName.."] danh hi謚");
			WriteLog("[Чi H閕 T� V�-Ph莕 thng server]:"..GetName().." nh薾 頲 ["..strName.."] danh hi謚");
		end
	end
end

function GLB_BW_LEAVE(nCityID, nPIdx)
	nPIdx = nPIdx or PlayerIndex;
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx;

	local nVersion,nCurGs = GetRealmType();
	UseScrollEnable(1);	--允许使用回城符
	SetLogoutRV(0);
	UseMask(0,0);
--	if nCurGs == 0 then
--		NewWorld(nCityID,TB_EXIT[nCityID][1],TB_EXIT[nCityID][2]);
--	else
--		ChangeGroupWorld(nCityID,TB_EXIT[nCityID][1],TB_EXIT[nCityID][2],0);
--	end
	BWDH_Change_Map(nCityID,TB_EXIT_CITY[nCityID][1],TB_EXIT_CITY[nCityID][2])

	PlayerIndex = nOldPIdx;
end

function OnWant(nPIdx,nOppIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx;
	local nCheckMapCode1,nCheckMapCode2 = 0,0;
	local nCheckTag = 0;

	BWDH_SetTask(TSK_OPPNAME_HASH,0);
	BWDH_SetTask(TSK_OPPNAME_HASH,0,nOppIdx);
	nCheckMapCode1 = BWT_CheckValidMap();
	nCheckMapCode2 = BWT_CheckValidMap(nOppIdx);
	if nCheckMapCode1 == 0 then	--1号选手检查没通过
		gf_ShowMsg("Khc t� t� v� (kh玭g c� trong b秐  quy nh), tr� 2 甶觤! B筺  r阨 kh醝 so t礽.");
		BWT_AddPoint(-2)
		nCheckTag = 1;	--表示有人没通过检查
	end;
	if nCheckMapCode2 == 0 then	--2号选手检查没通过
		if nCheckTag == 0 then	--如果1号检查通过了
			gf_ShowMsg("цi th� khc t� t� v�!");	--给1号发消息
		end;
		gf_ShowMsg("Khc t� t� v� (kh玭g c� trong b秐  quy nh), tr� 2 甶觤! B筺  r阨 kh醝 so t礽.",1,nOppIdx);
		BWT_AddPoint(-2,nOppIdx)
		nCheckTag = 1;
	else	--如果2号选手检查通过
		if nCheckTag == 1 then	--2号通过，1号没通过
			gf_ShowMsg("цi th� khc t� t� v�!",1,nOppIdx);	--给2号发消息
		end;
	end;
	if nCheckTag == 1 then	--如果有人没通过检查
		PlayerIndex = nOldPIdx;
		return 0;
	end;
	if BWT_OpenMatch(PlayerIndex,nOppIdx) == 0 then
		gf_ShowMsg("T筸 th阨 kh玭g c� khu thi u d� ra");
		BWT_JoinGestConvention();
		BWT_JoinGestConvention(nOppIdx);
		gf_ShowMsg("T筸 th阨 kh玭g c� khu thi u d� ra",1,nOppIdx);
	end;
	PlayerIndex = nOldPIdx;
end

function GLB_BW_Get_Block_Route()
	local tRoute		= gf_GetRouteTable();
	local tBlockRoute	= {};

	for i, nRoute in tRoute do
		if 1 == gf_GetTaskBit(TASKID_BIWU_BLOCK_ROUTE, i) then
			tinsert(tBlockRoute, nRoute);
		end
		if MAXNUM_BLOCK_ROUTE <= getn(tBlockRoute) then
			break
		end
	end

	tBlockRoute.n = nil;

	return tBlockRoute;
end

function GLB_BW_Block_Route_Check(nRoute)
	local tRoute		= gf_GetRouteTable();
	local nRet = 1;
	for i,k in tRoute do
		if k == nRoute then
			if gf_GetTaskBit(TASKID_BIWU_BLOCK_ROUTE, i) == 1 then
				nRet = 0;
			end
			break;
		end
	end
	return nRet;
end

function GLB_BW_Block_Route_Check_Ex(nPIdx1, nPIdx2)
	local nRet		= 0;
	local nOldPIdx	= 0;
	local nRoute1	= GetPlayerRoute(nPIdx1);
	local nRoute2	= GetPlayerRoute(nPIdx2);

	if nRoute1 == nRoute2 then
		return 1;
	end

	nOldPIdx	= PlayerIndex;
	PlayerIndex	= nPIdx1;
	nRet		= GLB_BW_Block_Route_Check(nRoute2);
	PlayerIndex	= nOldPIdx;

	if 0 == nRet then
		return 0;
	end

	nOldPIdx	= PlayerIndex;
	PlayerIndex	= nPIdx2;
	nRet		= GLB_BW_Block_Route_Check(nRoute1);
	PlayerIndex	= nOldPIdx;

	return nRet;
end

function GLB_BW_Block_Route_Cost(nPIdx)
--	nPIdx1 = nPIdx1 or PlayerIndex;
--
--	local nOldPIdx	= PlayerIndex;
--	PlayerIndex		= nPIdx;
--	local tRoute	= GLB_BW_Get_Block_Route();
--	if getn(tRoute) > 0 then
--		PayXYY(TB_BW_BLOCK_ROUTE_COST[getn(tRoute)], format("BLOCK_ROUTE[%d]", getn(tRoute)));
--	end
--	PlayerIndex		= nOldPIdx;
end

function WLZB_AddPoint()
	local nData = tonumber(date("%Y%m%d"));
	if nData < 20110428 or nData > 20110519 then
		return
	end
	local s = SDB("_GL_GestConvention_Jiaoyi_w", 1, GetPlayerRoute());
	s:apply("\\script\\biwudahui\\tournament\\mission\\mission.lua", "WLZB_AddPoint_CB");
end

function WLZB_AddPoint_CB(key, n1, n2, nCount)
	local nData = tonumber(date("%Y%m%d"));
	if nData < 20110428 or nData > 20110519 then
		return
	end
	local t = SDB("_GL_GestConvention_Jiaoyi_w", n1, n2);
	local point = getBound(t, nCount) + 20;
	Msg2Player(format("B筺 nh薾 頲 %d 甶觤 V� L﹎ Tranh B�!", point));
	point = point + GetTask(TASKID_WLZB_POINT);
	BWDH_SetTask(TASKID_WLZB_POINT, point);
	--GLB_BW_SetTask(0,0,tRelayTask);
	exgsvr_func_save_player_task()--向源服存盘

	--SendGlbDBData(1, format('DELETE FROM `wlzb_auditions` WHERE `name`="%s";', name));
	--format('UPDATE `wlzb_auditions` SET `point`=%d WHERE `name`="%s";', point, name);
	SendGlbDBData(0, format('REPLACE INTO `wlzb_auditions` VALUES ("%s", "%s", %d, %d, "%s");',
		GetName(), tRouteName[GetPlayerRoute()], GetLevel(), point, GetRelayGroup()));
end

function getBound(t,nCount)
	if not t then
		return 0
	end
	local myname = GetName();
	for i = 0, min(nCount, 20) do
		local l = t[i];
		if l[1] == myname then
			return 20 - i;
		end
	end
	return 0;
end

function WLZB_DecPoint()
	local nData = tonumber(date("%Y%m%d"));
	if nData < 20110428 or nData > 20110519 then
		return
	end
	local lastPoint = GetTask(TASKID_WLZB_POINT);
	local point = min(lastPoint, max(10, floor(lastPoint * 0.03)));
	if point <= 0 then return end
	Msg2Player(format("B筺 t鎛 th蕋 %d 甶觤 V� L﹎ Tranh B�!", point));
	point = GetTask(TASKID_WLZB_POINT) - point;
	BWDH_SetTask(TASKID_WLZB_POINT, point);
	--GLB_BW_SetTask(0,0,tRelayTask);
	exgsvr_func_save_player_task()--向源服存盘

	--SendGlbDBData(1, format('DELETE FROM `wlzb_auditions` WHERE `name`="%s";', name));
	--format('UPDATE `wlzb_auditions` SET `point`=%d WHERE `name`="%s";', point, name);
	SendGlbDBData(0, format('REPLACE INTO `wlzb_auditions` VALUES ("%s", "%s", %d, %d, "%s");',
		GetName(), tRouteName[GetPlayerRoute()], GetLevel(), point, GetRelayGroup()));
end

function BWDH_Change_Map(nMapId, nMapX, nMapY, nRule)
	if nRule == nil then nRule = 1 end;
	print("tournament_function >> BWDH_Change_Map >> nMapId: "..nMapId);
	print("tournament_function >> BWDH_Change_Map >> nMapX: "..nMapX);
	print("tournament_function >> BWDH_Change_Map >> nMapY: "..nMapY);
	print("tournament_function >> BWDH_Change_Map >> nRule: "..nRule);
	if BWDH_OPEN_IN_MATCH_FIELD and BWDH_OPEN_IN_MATCH_FIELD == 1 then
		print("tournament_function >> BWDH_Change_Map >> BWDH_OPEN_IN_MATCH_FIELD = 1")
		ChangeGroupWorld(nMapId, nMapX, nMapY)
	else
		print("tournament_function >> BWDH_Change_Map >> BWDH_OPEN_IN_MATCH_FIELD ~= 1")
		NewWorld(nMapId, nMapX, nMapY)
	end
end
