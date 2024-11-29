--×÷Õß£ºÑÏ¾ü
--´´½¨ÈÕÆÚ£º07Äê11ÔÂ13ÈÕ14:50
--Ê¦ÃÅ¹Ø¿¨¹«¹²º¯Êı½Å±¾ÎÄ¼ş
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\faction_back_room\\back_room_head.lua");
Include("\\script\\task\\faction_back_room\\route_function.lua");
--»ñµÃÃØÊÒµØÍ¼ID¡¢Ë÷ÒıÓë¼ÓÔØ´ÎÊı£¬Ã»ÓĞ¶àÓàµØÍ¼Ê±·µ»Ø0,0,0
function BR_FindIdleRoom_test(nFaction)
	return TB_BACKROOM[nFaction],0,0;
end;
function BR_FindIdleRoom(nFaction,nType)
	if UNCOMPLETED_VERSION == 1 then
		return BR_FindIdleRoom_test(nFaction);
	end;
	local nCount = 0;
	local nMaxRoomNum = 0;
	if nType == 1 then
		nCount = BR_GetRouteDynamicMapCount(nFaction);
		nMaxRoomNum = MAX_ROUTE_ROOM_COUNT;
	elseif nType == 2 then
		nCount = BR_GetShareDynamicMapCount();
		nMaxRoomNum = MAX_ROOM_COUNT;
	end;
	if nCount >= nMaxRoomNum then
		return 0,0,0;
	end;
	local nMapID,nMapIdx = DynamicLoadMap(TB_BACKROOM[nFaction]);
	return nMapID,nMapIdx,nCount;
end;
--»ñµÃµ±Ç°·şÎñÆ÷ÒÑ¾­¶¯Ì¬¼ÓÔØÁË¶àÉÙÕÅÊ¦ÃÅ¹Ø¿¨µÄµØÍ¼
function BR_GetDynamicMapCount()
	local nCount = 0;
	for i=1,getn(TB_BACKROOM) do
		nCount = nCount + GetMapLoadCount(TB_BACKROOM[i]);
	end;
	return nCount;
end;
--»ñÈ¡Ä³¸öÁ÷ÅÉµ±Ç°ÒÑÓÃµØÍ¼ÊıÁ¿
function BR_GetRouteDynamicMapCount(nFaction,nRoute)
	local tbMapID = gf_GetDataTable(GetSameMaps(TB_BACKROOM[nFaction]));
	local nCount = 0;
	local nMapID = 0;
	for i=1,getn(tbMapID) do
		nMapID = tbMapID[i];
		if mf_GetMissionV(MISSION_ID,MV_MAP_TYPE,nMapID) == nRoute then
			nCount = nCount + 1;
		end;
	end;
	return nCount;
end;
--»ñÈ¡¹²ÏíµØÍ¼ÒÑÊ¹ÓÃÊıÁ¿
function BR_GetShareDynamicMapCount()
	local nCount = 0;
	for i=1,7 do	--7¸öÃÅÅÉ
		nCount = BR_GetRouteDynamicMapCount(i,0) + nCount;
	end;
	return nCount;
end;
--É¾³ıÄ³Ò»ÃÅÅÉµÄÁîÅÆ
function BR_DelLingPai(nFaction,nCount)
	return DelItem(TB_LINGPAI[nFaction][1],TB_LINGPAI[nFaction][2],TB_LINGPAI[nFaction][3],nCount);
end;
--ÁÙÊ±±äÁ¿³õÊ¼»¯
function BR_ClearTempTask()
	for i=TTSK_BEGIN,TTSK_END do
		SetTaskTemp(i,0);
	end;
end;
--ÈÎÎñ±äÁ¿Çå0
function BR_ClearNCTask()
	for i=TSK_NC_BEGIN,TSK_NC_END do
		SetTask(i,0);
	end;
end;
--µØÍ¼±äÁ¿Çå0
function BR_ClearMapTask(nMapID)
	for i=MAP_TSK_BEGIN,MAP_TSK_END do
		SetMapTaskTemp(nMapID,i,0);
	end;
end;
--¿ªÊ¼ÏÂÒ»¹Ø
function BR_NextStage()
	local nMapID = BR_GetCurMapID();
	BR_ClearMapNpcSafe(nMapID);
	local nCurDiff,nCurStage = 0,0;
	nCurDiff = BR_GetCurDiff();
	nCurStage = BR_GetCurStage();
	local nPIdx = GetMissionV(MV_PLAYERINDEX);
--	if nCurStage == 1 or nCurStage == 5 or nCurStage == 9 then
--		if BR_EnterNextStageCheck(nCurDiff,nCurStage,nPIdx) == 0 then
--			Say2SomeOne(nPIdx,"B¹n hiÖn kh«ng ®ñ ®iÒu kiÖn ®Ó vµo ¶i, xin h·y kiÓm tra giíi h¹n v­ît ¶i ë TiÕp dÉn mËt thÊt s­ m«n.",0);
--			Msg2MSAll(MISSION_ID,"B¹n hiÖn kh«ng ®ñ ®iÒu kiÖn ®Ó vµo ¶i, xin h·y kiÓm tra giíi h¹n v­ît ¶i ë TiÕp dÉn mËt thÊt s­ m«n.");
--			BR_ChangeMSState(MS_STATE_END_WAITING);
--			BR_CreateDisciple();
--			return 0;
--		end;
--	end;
	BR_InitStage(nCurDiff,nCurStage);
	BR_RestorePlayer();
	local nPIdx = GetMissionV(MV_PLAYERINDEX);
	if nCurStage == 1 then	--Èç¹ûÊÇµÚÒ»¹Ø
		SetTask(TSK_ENTER_TYPE,0, 0, nPIdx);	--½øÈëÀàĞÍÇåÎª0
		SetMissionV(MV_TOTAL_TIME,0);	--ÀÛ¼ÆÊ±¼äÇå0
	end;
	Msg2MSAll(MISSION_ID,""..TB_DIFF_NAME[nCurDiff].."§é khã ¶i "..nCurStage.." b¾t ®Çu");
	if DEBUG_VERSION == 1 then
		BR_CreateDisciple();
	end;
end;
--ÔİÍ£¹Ø¿¨
function BR_PauseStage()
	BR_ChangeMSState(MS_STATE_READY);
	BR_CreateDisciple();
end;
--½áÊøÄ³Ò»¹Ø¡¢¹ı¹Ø
function BR_EndStage()
	BR_UnInitStageEven(nCurDiff,nCurStage);
	local nCurDiff,nCurStage = 0,0;
	local nPIdx = GetMissionV(MV_PLAYERINDEX);
	nCurDiff = BR_GetCurDiff();
	nCurStage = BR_GetCurStage();
	local nNextDiff,nNextStage = nCurDiff,nCurStage+1;
	local nUseTime = GetTime() - GetMissionV(MV_BEGIN_TIME) + GetMissionV(MV_TOTAL_TIME); --¼ÆËã±¾Ñ­»·×ÜÓÃÊ±
	SetMissionV(MV_TOTAL_TIME,nUseTime);
	local nEnterType = GetTask(TSK_ENTER_TYPE,nPIdx);
	if nEnterType == 1 then
		Msg2MSAll(MISSION_ID,"B¹n ®· v­ît qua "..TB_DIFF_NAME[nCurDiff].."¶i "..nCurStage..", ®ang ®äc d÷ liÖu, ®é khã nµy kh«ng ghi l¹i thêi gian ");
	else
		Msg2MSAll(MISSION_ID,"B¹n ®· v­ît qua "..TB_DIFF_NAME[nCurDiff].."¶i "..nCurStage..", thêi gian: "..tf_GetTimeString(nUseTime)..".");
	end;
	if nCurStage == MAX_STAGE then	--Èç¹ûÊÇÑ­»·ÄÚ×îºóÒ»¹Ø
		nNextDiff = nCurDiff + 1;	--½øÈëÏÂÒ»Ñ­»·
		nNextStage = 1;				--»Ø¹éµÚ1¹Ø
		if nBeginTime ~= 0 then
			if nEnterType == 1 then
				Msg2MSAll(MISSION_ID,"Chóc mõng b¹n ®· v­ît qua ¶i "..TB_DIFF_NAME[nCurDiff]..", ®ang ®äc d÷ liÖu, ®é khã nµy kh«ng ghi l¹i thêi gian");
				WriteLog(LOG_HEADER..", ®é khã: "..nCurDiff..", ¶i  "..nCurStage..". Tªn: "..GetName(nPIdx)..", cÊp:"..GetLevel(nPIdx)..","..GetMissionV(MV_ROUTE)..", thêi gian: §ang ®äc sè liÖu, kh«ng ghi l¹i thêi gian");			
			else
				Msg2MSAll(MISSION_ID,"Chóc mõng b¹n ®· v­ît qua ¶i "..TB_DIFF_NAME[nCurDiff]..", thêi gian: "..tf_GetTimeString(nUseTime));
				if BR_UpDateTimeRecord(nCurDiff,nUseTime,nPIdx) == 1 then		--Ìá½»Ê±¼ä
					Msg2MSAll(MISSION_ID,"Chóc mõng b¹n ®· chiÕn th¾ng b¶n th©n "..TB_DIFF_NAME[nCurDiff].."V­ît ¶i víi thµnh tİch nhanh nhÊt");
				end;
				WriteLog(LOG_HEADER..", ®é khã: "..nCurDiff..", ¶i  "..nCurStage..". Tªn: "..GetName(nPIdx)..", cÊp:"..GetLevel(nPIdx)..","..GetMissionV(MV_ROUTE)..", thêi gian: "..nUseTime);			
			end;
		end;
	end;
	if nCurStage == 4 or nCurStage == 8 or nCurStage == 9 then
		BR_CreateAwardBox(nCurDiff,nCurStage,nPIdx);	--´´½¨±¦Ïä
		if GetTask(TSK_WC_FAIL_TIMES,nPIdx) >= MAX_FAILURE_TIMES then	--Ê§°Ü³¬¹ıÒ»¶¨´ÎÊıºó×Ô¶¯´æµµ
			BR_SaveRecord(nNextDiff,nNextStage,nPIdx);
		end;
	end;
	BR_SetCurDiff(nNextDiff);	--ÉèÖÃÏÂÒ»¹Ø
	BR_SetCurStage(nNextStage);	--ÉèÖÃÏÂÒ»¹Ø
	if nCurDiff == MAX_DIFFICULTY_LEVEL and nCurStage == MAX_STAGE then	--Èç¹ûÊÇ×îºóÑ­»·×îºó¹Ø¿¨
		local szFactionName = gf_GetFactionName(GetMissionV(MV_FACTION));
		Msg2MSAll(MISSION_ID,"Chóc mõng b¹n ®· v­ît qua toµn bé kh¶o nghiÖm, xøng ®¸ng lµ ®Ö tö xuÊt s¾c cña "..szFactionName..", xin h·y ®îi mét l¸t, sÏ lËp tøc chuyÓn b¹n ra ngoµi")
		BR_FinalEndStage();
		return 0;
	end;
	if nCurStage == MAX_STAGE or nCurStage == floor(MAX_STAGE/2) or nCurStage == MAX_STAGE-1 then	--´òÍê4,8,9¹Øºó
		BR_PauseStage();	--²¹¸ø½×¶Î
	else	--½øÈë¶ÌÔİĞİÏ¢ÆÚ
		--ÒÔ½áÊøÄ³Ò»¹Ø¿¨×÷Îª¹Ø¿¨Ö®¼äµÄ·Ö½çµã
		BR_ChangeMSState(MS_STATE_SHORT_PAUSE);
	end;
end;
--Í¨È«¹Ø
function BR_FinalEndStage()
	BR_ChangeMSState(MS_STATE_END_WAITING);
	BR_CreateDisciple();
end;
--´´½¨½ÓÒıµÜ×Ó
function BR_CreateDisciple()
	local nFaction = GetMissionV(MV_FACTION);
	local nMapID = BR_GetCurMapID();
	local nMapX = TB_ENTRY_POS[nFaction][1];
	local nMapY = TB_ENTRY_POS[nFaction][2];
	local nNpcIdx = CreateNpc("V­¬ng An Th¹ch","TiÕp dÉn ®Ö tö ",nMapID,nMapX,nMapY);
	SetNpcScript(nNpcIdx,"\\script\\task\\faction_back_room\\npc_disciple.lua");
end;
--´´½¨¹Ø¿¨NPC
function BR_CreateStageNpc(nDiff,nStage)
	local nRoute = GetMissionV(MV_ROUTE);
	local nFaction = GetMissionV(MV_FACTION);
	local nNpcModelName = TB_STAGE_INFO[nRoute][0][1][1]..nDiff;
	local nNpcName = TB_STAGE_INFO[nRoute][0][1][2];
	local nNpcCount = TB_STAGE_INFO[nRoute][nDiff][1][nStage];
	local nMapID = BR_GetCurMapID();
	local nMapX,nMapY = 0,0;
	local nNpcIdx = 0;
	local nPosSize = getn(TB_NPC_POS[nFaction]);
	local nPosIdx = 0;
	for i=1,nNpcCount do
		nPosIdx = mod(i-1,nPosSize)+1;
		nMapX,nMapY = TB_NPC_POS[nFaction][nPosIdx][1],TB_NPC_POS[nFaction][nPosIdx][2];
		nNpcIdx = BR_CreateNpc(nNpcModelName,nNpcName,nMapID,nMapX,nMapY);
		SetNpcDeathScript(nNpcIdx,"\\script\\task\\faction_back_room\\death_npc.lua");
		SetMissionV(MV_NPC_INDEX_BEGING+i-1,nNpcIdx);
	end;
end;
--´´½¨BOSS
function BR_CreateBoss(nDiff)
	local nRoute = GetMissionV(MV_ROUTE);
	local nFaction = GetMissionV(MV_FACTION);
	local nNpcModelName = TB_STAGE_INFO[nRoute][0][2][1]..nDiff;
	local nNpcName = TB_STAGE_INFO[nRoute][0][2][2];
	local nMapID = BR_GetCurMapID();
	local nMapX,nMapY = TB_BOSS_POS[nFaction][1],TB_BOSS_POS[nFaction][2];
	local nNpcIdx = BR_CreateNpc(nNpcModelName,nNpcName,nMapID,nMapX,nMapY);
	SetMissionV(MV_NSC_BOSS_INDEX,nNpcIdx);
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\faction_back_room\\death_npc.lua");	
end;
--¼ì²éµ±Ç°×´¿öÊÇ·ñ¹ı¹Ø
function BR_CheckWinCondition(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nCurKillCount = GetMissionV(MV_NSC_KILL_NPC_COUNT);
	local nNeedKillCount = GetMissionV(MV_NSC_NEED_KILL_NUMBER);
--	if nCurKillCount >= nNeedKillCount then
	if nCurKillCount >= 15 then
		return 1;
	else
		return 0;
	end;
end;
--Ò»ÖÜÒ»Çå
function BR_WeeklyClear()
	local nWeek = tonumber(date("%y%W"));
	if GetTask(TSK_ATTEND_WEEK) < nWeek then
		for i=TSK_WC_BEGIN,TSK_WC_END do
			SetTask(i,0);
		end;
	end;
end;
--°ÑÊ±¼ä£¨µ¥Î»Ãë£©×ª»»ÎªÑ­»·´ÎÊı
function BR_TransformTime2Loop(nState,nSec)
	local nLoop = 0;
	if nState == MS_STATE_READY then
		nLoop = floor((nSec/60)/READY_TIMER_INTERVAL)-1;
	elseif nState == MS_STATE_STARTED then
		nLoop = floor((nSec/60)/STARTED_TIMER_INTERVAL)-1;
	elseif nState == MS_STATE_SHORT_PAUSE then
		nLoop = floor((nSec/60)/SHORT_PAUSE_TIMER_COUNT)-1;
	elseif nState == MS_STATE_END_WAITING then
		nLoop = floor((nSec/60)/ENDING_TIMER_INTERVAL)-1;
	elseif nState == MS_STATE_IDEL then
		nLoop = 0;
	end;
	return nLoop;
end;
--ÉèÖÃÑ­»·×ÜÊı
function BR_SetStageTimerLoop(nLoop)
	SetMissionV(MV_TIMER_LOOP,nLoop);
end;
--»ñÈ¡µ±Ç°Ñ­»·×ÜÊı
function BR_GetStageTimerLoop()
	return GetMissionV(MV_TIMER_LOOP);
end;
--»ñÈ¡µ±Ç°ÄÑ¶È
function BR_GetCurDiff()
	return GetMissionV(MV_CUR_DIFF);
end;
--ÉèÖÃµ±Ç°ÄÑ¶È
function BR_SetCurDiff(nDiff)
	SetMissionV(MV_CUR_DIFF,nDiff);
end;
--»ñÈ¡µ±Ç°ÊÇµÚ¼¸¹Ø
function BR_GetCurStage()
	return GetMissionV(MV_CUR_STAGE);
end;
--ÉèÖÃµ±Ç°ÊÇµÚ¼¸¹Ø
function BR_SetCurStage(nStage)
	SetMissionV(MV_CUR_STAGE,nStage);
end;
--»ñÈ¡Missionµ±Ç°×´Ì¬
function BR_GetMSCurState()
	return GetMissionV(MV_MISSION_STATE);
end;
--»ñÈ¡¼ÆÊ±Æ÷µ±Ç°×´Ì¬
function BR_GetTimerState()
	return GetMissionV(MV_MISSION_STATE);
end;
--ÉèÖÃ¼ÆÊ±Æ÷µ±Ç°×´Ì¬
function BR_SetTimerState(nState)
	SetMissionV(MV_MISSION_STATE,nState);
end;
--¼ì²éµ±Ç°µØÍ¼IDÊÇ·ñºÏ·¨
function BR_CheckMap()
	return 1;
end;
--»ñµÃÄ³¹ØĞÅÏ¢
function BR_GetStageInfo(nDiff,nStage)
	local nRoute = GetMissionV(MV_ROUTE);
	if DEBUG_VERSION == 1 then
		if nStage == MAX_STAGE then
			return 180,1;
		else
			return 180,nDiff;
		end;
	end;
	if nStage == MAX_STAGE then	
		return TB_STAGE_INFO[nRoute][0][3][1],TB_STAGE_INFO[nRoute][0][3][2];	--×ÜÊ±¼ä£¬ÒªÉ±NPCÊıÁ¿
	else
		return TB_STAGE_INFO[nRoute][nDiff][2][nStage],TB_STAGE_INFO[nRoute][nDiff][3][nStage];	--×ÜÊ±¼ä£¬ÒªÉ±NPCÊıÁ¿
	end;
end;
--Ìá½»Ê±¼äµ½Êı¾İ¿â
function BR_UpDateTimeRecord(nDiff,nTime,nPIdx)
	local nRoute = GetMissionV(MV_ROUTE);
	local nTaskID = TSK_BEST_RECORD_BEGIN+nDiff-1;
	local nBestRecord = GetTask(nTaskID,nPIdx);
	if nBestRecord == 0 then
		nBestRecord = nTime;
	end;
	SetMissionV(MV_TOTAL_TIME,0);
	if nTime <= nBestRecord then
		SetTask(nTaskID,nTime, 0, nPIdx);
		AddRelayShareData(BACKROOM_RELAY_KEY,nRoute,nDiff,"","",1,GetName(nPIdx),"d",nTime);
		return 1;
	else
		return 0;
	end;
end;
--³õÊ¼»¯¹Ø¿¨
function BR_InitStage(nDiff,nStage)
	local nCurTime = GetTime();
	SetMissionV(MV_BEGIN_TIME,nCurTime);	--¿ªÊ¼¼ÆÊ±
	SetMissionV(MV_NSC_KILL_NPC_COUNT,0);
	if nDiff == 8 or nDiff == 9 then --20080825 ¼ÓÈë8¡¢9Ñ­»·²»ÄÜ¸ü»»×°±¸ÏŞÖÆ
		BR_LockEquipment(1);
	end
	if nStage == MAX_STAGE then
		BR_CreateBoss(nDiff);
	else
		BR_CreateStageNpc(nDiff,nStage);	
	end;
	BR_ChangeMSState(MS_STATE_STARTED);
	local nTime,nNpcCount = BR_GetStageInfo(nDiff,nStage);
	local nLoop = BR_TransformTime2Loop(MS_STATE_STARTED,nTime);
	BR_SetStageTimerLoop(nLoop);
	BR_InitStageEven(nDiff,nStage);
	BR_StartTimeGuage("Thêi gian",nTime,0,0);
	SetMissionV(MV_NSC_NEED_KILL_NUMBER,nNpcCount);
--	Msg2MSAll(MISSION_ID,"Thêi h¹n: "..tf_GetTimeString(nTime)..". Sè thñ vÖ cÇn ph¶i ®¸nh b¹i ®Ó qua cöa: "..nNpcCount);
	Msg2MSAll(MISSION_ID,"Thêi h¹n: "..tf_GetTimeString(nTime)..". Sè thñ vÖ cÇn ph¶i ®¸nh b¹i ®Ó qua cöa: 15 ");

end;
--×ª»»Missionµ±Ç°×´Ì¬
function BR_ChangeMSState(nState)
	SetMissionV(MV_MISSION_STATE,nState);
	if nState == MS_STATE_IDEL then
		StopMissionTimer(MISSION_ID,TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
	elseif nState == MS_STATE_READY then
		SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--ÉèÖÃ¼ÆÊ±Æ÷×Ü¼ÆÊ±´ÎÊı
		StopMissionTimer(MISSION_ID,TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
		StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--¿ªÊ¼Ò»¸ö¼ÆÊ±Æ÷	
	elseif nState == MS_STATE_STARTED then
		SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);	--ÉèÖÃ¿ªÊ¼×´Ì¬µÄ³ÖĞøÊ±¼ä
		StopMissionTimer(MISSION_ID,TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--¿ªÊ¼Ò»¸öĞÂµÄ¼ÆÊ±Æ÷
	elseif nState == MS_STATE_SHORT_PAUSE then
		SetMissionV(MV_TIMER_LOOP,SHORT_PAUSE_TIMER_COUNT);	--ÉèÖÃ¿ªÊ¼×´Ì¬µÄ³ÖĞøÊ±¼ä
		StopMissionTimer(MISSION_ID,TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
		StartMissionTimer(MISSION_ID,TIMER_ID,SHORT_PAUSE_TIMER_INTERVAL*FRAME_PER_MIN);	--¿ªÊ¼Ò»¸öĞÂµÄ¼ÆÊ±Æ÷
	elseif nState == MS_STATE_END_WAITING then
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
	end;
end;
--»Ö¸´Íæ¼Ò×´Ì¬
function BR_RestorePlayer()
	local nOldPIdx = PlayerIndex;
	PlayerIndex = GetMissionV(MV_PLAYERINDEX);
	Restore();
	RestoreNeili();
	ClearColdDown();	--Çå³ıËùÓĞÒ©CD
	CastState("imme_clear_skill_interval",-1,0);	--Ïû³ıËùÓĞ¼¼ÄÜµÄÀäÈ´Ê±¼ä
	PlayerIndex = nOldPIdx;
end;
--´´½¨±¦Ïä
function BR_CreateAwardBox(nDiff,nStage,nPIdx)
	local nFaction = GetMissionV(MV_FACTION);
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	local nMapID,nMapX,nMapY = GetWorldPos();
	local nNpcIdx = CreateNpc("R­¬ng tiÒn",""..TB_DIFF_NAME[nDiff].." ¶i "..nStage.." ",nMapID,nMapX,nMapY);
	gf_SetUnitCurState(nNpcIdx,1,nDiff);
	gf_SetUnitCurState(nNpcIdx,2,nStage);
	gf_SetUnitCurState(nNpcIdx,3,0);	--ÉèÖÃÎªÎ´Ê°È¡
	SetNpcScript(nNpcIdx,"\\script\\task\\faction_back_room\\npc_box.lua");
	PlayerIndex = nOldPIdx;
end;
--³õÊ¼»¯¹Ø¿¨ÉèÖÃ¡£Í³Ò»Èë¿Úº¯Êı
function BR_InitStageEven(nDiff,nStage)
	local nRoute = GetMissionV(MV_ROUTE);
	if TB_INIT_STAGE_FUN[nRoute] ~= nil then
		TB_INIT_STAGE_FUN[nRoute](nDiff,nStage);
	end;
end;
--Ö´ĞĞ¹Ø¿¨ÊÂ¼ş¡£Í³Ò»Èë¿Úº¯Êı
function BR_ProcStageEven(nDiff,nStage)
	local nRoute = GetMissionV(MV_ROUTE);
	if TB_PROC_STAGE_EVEN_FUN[nRoute] ~= nil then
		TB_PROC_STAGE_EVEN_FUN[nRoute](nDiff,nStage);
	end;
end;
--·´³õÊ¼»¯¹Ø¿¨ÉèÖÃ¡£Í³Ò»Èë¿Úº¯Êı
function BR_UnInitStageEven(nDiff,nStage)
	local nRoute = GetMissionV(MV_ROUTE);
	if TB_UNINIT_STAGE_FUN[nRoute] ~= nil then
		TB_UNINIT_STAGE_FUN[nRoute](nDiff,nStage);
	end;
	BR_CastPlayerState("");
	BR_ClearNSCValue();
	local nMapID = BR_GetCurMapID();
	BR_ClearMapNpcSafe(nMapID);
	BR_StopTimeGuage(-2);
	if DEBUG_VERSION == 1 then
		BR_CreateDisciple();
	end;
end;
--¼ì²éMS_STATE_STARTED½×¶Î¼ÆÊ±Æ÷µ±Ç°Î»ÖÃ
--²ÎÊı1±íÊ¾Ê±¼ä£¬²ÎÊı2Îª0Ê±±íÊ¾ÅĞ¶Ïµ±Ç°¼ÆÊ±Æ÷ÊÇ·ñÔÚ²ÎÊı1ËùÌîµÄÊ±¼äµãÉÏ
--²ÎÊı2Îª1Ê±±íÊ¾µ±Ç°¼ÆÊ±Æ÷ÊÇ·ñÔÚÒÔ²ÎÊı1Îª¼ä¸ôµÄÊ±¼äµãÉÏ£¬²ÎÊı2Ä¬ÈÏÖµÎª1
--ÈçÊäÈë²ÎÊıÎª10,0Ê±£¬ÔòÔÚ¼ÆÊ±Æ÷Ê±¼äÎª10ÃëÊ±º¯Êı·µ»Ø1,ÆäËüÊ±¼ä·µ»Ø0£»
--ÈçÊäÈë²ÎÊıÎª10,1Ê±£¬Ôò¼ÆÊ±Æ÷Ê±¼äÎª10,20,30,40......Ê±·µ»Ø1,ÆäËüÊ±¼ä·µ»Ø0
--Èç¹û²ÎÊı1µÄÊıÖµ²»ÊÇ¼ÆÊ±Æ÷Ê±¼ä¼ä¸ôµÄÕûÊı±¶£¬ÔòÏòÏÂ¶ÔÆë
function BR_CheckTimerPosition(nStartTime,nTime,bInterval)
	bInterval = bInterval or 1;
	local nLoop = floor(nTime/(STARTED_TIMER_INTERVAL*60));
	local nStartLoop = floor(nStartTime/(STARTED_TIMER_INTERVAL*60));
	local nCurLoop = BR_GetStageTimerLoop();
	local nDiff = BR_GetCurDiff();
	local nStage = BR_GetCurStage();
	local nTime = BR_GetStageInfo(nDiff,nStage);
	local nTotalLoop = BR_TransformTime2Loop(MS_STATE_STARTED,nTime);
	if nTotalLoop - nCurLoop < nStartLoop then
		return 0;
	end;
	nCurLoop = nCurLoop + nStartLoop;
	if bInterval == 1 then
		if mod(nTotalLoop - nCurLoop + 1,nLoop) == 0 then
			return 1;
		else
			return 0;
		end;
	else
		if nTotalLoop - nCurLoop + 1 == nLoop then
			return 1;
		else
			return 0;
		end;
	end;
end;
--¸øÍæ¼Ò¼Ó×´Ì¬£¬Èç¹û²ÎÊı£±Îª""ÔòÒÆ³ıÍæ¼ÒÉíÉÏËùÓĞÁÙÊ±×´Ì¬
function BR_CastPlayerState(szState,nValue,nTime,bForceInstead,nID)
	local nOldPIdx = PlayerIndex
	nValue = nValue or 0;
	nTime = nTime or -1;
	bForceInstead = bForceInstead or 1;
	nID = nID or 0;
	PlayerIndex = GetMissionV(MV_PLAYERINDEX);
	if szState == "" then
		gf_RemoveTempState();
	else
		CastState(szState,nValue,nTime*18,bForceInstead,TEMP_STATE_BEGIN+nID);
	end;
	PlayerIndex = nOldPIdx;
end;
--»ñµÃµ±Ç°µØÍ¼ID
function BR_GetCurMapID()
	return SubWorldIdx2ID(SubWorld);
end;
--»ñµÃ³¡µØµÄMSUID
function BR_GetMSUID()
	return GetMissionV(MV_MISSION_UID);
end;
--Çå³ıÓÃÀ´¼ÇÂ¼NPCË÷ÒıµÄMission±äÁ¿
function BR_ClearNpcIndex()
	for i=MV_NPC_INDEX_BEGING,MV_NPC_INDEX_END do
		SetMissionV(i,0);
	end;
end;
--ÓÃÀ´Çå³ıNSC(New-Stage-Clear)±äÁ¿,°üÀ¨¼ÇNPCË÷ÒıµÄ±äÁ¿
function BR_ClearNSCValue()
	for i=MV_NSC_BEGIN,MV_NSC_END do
		SetMissionV(i,0);
	end;
	BR_ClearNpcIndex();
end;
--ÒÆ³ıÒ»¸öNPCË÷Òı
function BR_RemoveNpcIndex(nNpcIdx)
	nNpcIdx = tonumber(nNpcIdx);
	for i=MV_NPC_INDEX_BEGING,MV_NPC_INDEX_END do
		if GetMissionV(i) == nNpcIdx then
			SetMissionV(i,0);
			return 1;
		end;
	end;
	gf_ShowDebugInfor("BR_RemoveNpcIndex nhËn nNpcIdx kh«ng ë biÕn l­îng kû lôc trong Mission");
	WriteLog(LOG_ERR_HEADER.."BR_RemoveNpcIndex nhËn nNpcIdx kh«ng ë biÕn l­îng kû lôc trong Mission");
	return 0;
end;
--»ñµÃÒ»¸ö¿ÉÓÃµÄMissionV±äÁ¿£¬Õâ¸ö±äÁ¿ÓÃÀ´¼ÇÂ¼NPCË÷Òı
function BR_GetNPCMissionV()
	for i=MV_NPC_INDEX_BEGING,MV_NPC_INDEX_END do
		if GetMissionV(i) == 0 then
			return i;
		end;
	end;
	return 0;
end;
--´´½¨Ò»×éNPC£¬Ëæ»úÎ»ÖÃ£¬¿ÉÖ¸¶¨ÕóÓª£¬¿ÉÉèÖÃÉú´æÊ±¼ä
function BR_CreateFellow(szModelName,szNpcName,nCount,nCamp,tbPos,nLifeTime)
	local nNpcIdx = 0;
	local nMapID = BR_GetCurMapID();
	local nPosIdx = 0;
	local nPosSize = getn(tbPos);
	local tbTemp = gf_CopyTable(tbPos);	--¸´ÖÆÒ»¸öĞÂµÄtable
	local tbNpcIdx = {};
	for i=1,nCount do
		nPosIdx = random(1,getn(tbTemp));
		nMapX = tbTemp[nPosIdx][1];
		nMapY = tbTemp[nPosIdx][2];
		nNpcIdx = BR_CreateNpc(szModelName,szNpcName,nMapID,nMapX,nMapY,nCamp);
		tinsert(tbNpcIdx,nNpcIdx);
		if nLifeTime ~= nil then
			SetNpcLifeTime(nNpcIdx,nLifeTime);
		end;
		tremove(tbTemp,nPosIdx);
	end;
	return tbNpcIdx;
end;
--±£´æ½ø¶È
function BR_SaveRecord(nDiff,nStage,nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex
	if nDiff > MAX_DIFFICULTY_LEVEL then	--Èç¹ûÊÇ×îºóÑ­»·×îºó¹Ø¿¨¾Í²»´æµµÁË
		SetTask(TSK_WC_LAST_RECORD,0);	--Í¨È«¹ØºóÇåµµ
		SetTask(TSK_WC_FAIL_TIMES,GetTask(TSK_WC_FAIL_TIMES)+1);
		Msg2MSAll(MISSION_ID,"§· xo¸ d÷ liÖu, ®©y lµ lÇn xo¸ thø "..GetTask(TSK_WC_FAIL_TIMES).." trong tuÇn cña b¹n ");
		return 0;
	end;
	local nRecord = nDiff*100+nStage;
	SetTask(TSK_WC_LAST_RECORD,nRecord);
	Msg2MSAll(MISSION_ID,"TiÕn ®é ®· l­u: "..TB_DIFF_NAME[nDiff].."§é khã ¶i "..nStage..".");
	PlayerIndex = nOldPIdx;
end;
--»ñµÃ½ø¶È±£´æĞÅÏ¢
function BR_GetSaveRecord()
	local nRecord = GetTask(TSK_WC_LAST_RECORD);
	local nDiff = floor(nRecord/100);
	local nStage = mod(nRecord,100);
	return nDiff,nStage;
end;
--¹Ø±Õ¹Ø¿¨
function BR_CloseStage()
	local nMapID = GetMissionV(MV_MAPID);
	local nMapIdx = GetMissionV(MV_MAPIDX);
	CloseMission(MISSION_ID);
	if UNCOMPLETED_VERSION ~= 1 then
		local nRetCode = FreeDynamicMap(nMapID,nMapIdx);	--FreeDynamicMapÒ²»áµ÷ÓÃCloseMisssion
		if nRetCode ~= 0 then
			WriteLog(LOG_ERR_HEADER.."FreeDynamicMap ph¸t sinh lçi, nRetCode:"..nRetCode);
		end;
	end;
end;
--ĞŞ¸ÄNPCÑªÁ¿£¬²ÎÊı1£ºNPCË÷Òı£¬²ÎÊı2£ºÑªÁ¿Öµ£¬²ÎÊı3£ºÔöÁ¿Öµ»¹ÊÇ¾ø¶ÔÖµ£¨1ÎªÔö£¬0Îª¾ø£©£¬²ÎÊı4£ºÊÇ·ñÎª°Ù·Ö±È£¬1±íÊ¾ÊÇ£¬0±íÊ¾²»ÊÇ£¨Ä¬ÈÏÊÇ1£©
function BR_ModifyNpcLife(nNpcIdx,nValue,nFlag,bPercent)
	bPercent = bPercent or 1;
	if bPercent == 0 then	--Èç¹û²»ÊÇ°Ù·Ö±È
		ModifyNpcData(nNpcIdx,0,nValue,nFlag);
		return 0;
	end;
	local nNpcMaxLife = GetUnitCurStates(nNpcIdx,1);	
	local nDamage = floor(nNpcMaxLife*nValue/100);	--¸ù¾İ°Ù·Ö±ÈÀ´¼ÆËã¸Ä±äµÄÑªÁ¿
	ModifyNpcData(nNpcIdx,0,nDamage,nFlag);
end;
--¼ì²éµØÍ¼ÊÇ²»ÊÇÕıÈ·µÄ
function BR_CheckMissionName()
	local nMSUID = BR_GetMSUID();
	if GetMissionS(MS_MISSION_NAME) == MISSION_NAME..nMSUID then
		return 1;
	else
		return 0;
	end;
end;
--·â×°µÄCreateNpc
function BR_CreateNpc(szModelName,szName,nMapID,nMapX,nMapY,nCamp)
	nCamp = nCamp or CAMP_ENEMY;	--Ä¬ÈÏÎªµĞ¶ÔÕóÓª
	local nNpcIdx = CreateNpc(szModelName,szName,nMapID,nMapX,nMapY);	
	SetCampToNpc(nNpcIdx,TB_CAMP_NAME[nCamp]);
	return nNpcIdx;
end;
--°²È«É¾³ıµØÍ¼ÉÏµÄËùÓĞNPC
function BR_ClearMapNpcSafe(nMapID)
	if BR_CheckMissionName() == 1 then
		ClearMapNpc(nMapID);
		return 1;
	else
		WriteLog(LOG_ERR_HEADER.."Hµm sè BR_ClearMapNpcSafe ph¸t sinh lçi khi kiÓm tra b¶n ®å");
		return 0;
	end;
end;
--¿ªÆôÊ±¼ä½ø¶ÈÌõ
function BR_StartTimeGuage(szInfo,Duration,bRepeat,nCustomID)
	local nOldPIdx = PlayerIndex
	PlayerIndex = GetMissionV(MV_PLAYERINDEX);
	StartTimeGuage(szInfo,Duration,bRepeat,nCustomID);
	PlayerIndex = nOldPIdx;
end;
--Í£Ö¹Ê±¼ä½ø¶ÈÌõ
function BR_StopTimeGuage(nCustomID)
	local nOldPIdx = PlayerIndex
	PlayerIndex = GetMissionV(MV_PLAYERINDEX);
	StopTimeGuage(nCustomID);
	PlayerIndex = nOldPIdx;
end;

--¼ì²éµØÍ¼ÊÇ·ñÎªºÏ·¨µÄ¿É½øÈëÃØÊÒµÄµØÍ¼
function BR_CheckEntryMapID(nMapID)
	for i,v in TB_EXIT_POS do
		if i == nMapID then
			return 1;
		end;
	end;
	return 0;
end;
--¼ì²éµ±Ç°µØÍ¼ÊÇ²»ÊÇ³ÇÊĞµØÍ¼
function BR_CheckCityMapID()
	local nMapID = GetWorldPos();
	local tb = {100,150,200,300,350,400,500};	--Æß´ó³ÇÊĞ¡£Ó¦¸Ã²»»áÔÙÔö¼ÓÁË°É£¿
	for i=1,getn(tb) do
		if nMapID == tb[i] then
			return 1;
		end;
	end;
	return 0;
end;
--°²È«¿É¿¿µÄ´«ËÍ
function BR_SafeTransmission()
	for i,v in TB_EXIT_POS do
		if SubWorldID2Idx(i) ~= -1 then	--Èç¹ûÕâÕÅµØÍ¼ÔÚµ±Ç°·şÎñÆ÷ÓĞ±»¼ÓÔØ
			NewWorld(i,TB_EXIT_POS[i][1],TB_EXIT_POS[i][2]);
		end;
	end;
end;
--Ê°È¡±¦Ïä»ñµÃ½±Àø
function BR_GetBoxAward(nDiff,nStage)
	local tbDropInfo = TB_DROP_INFO[nDiff][nStage];
	local nFaction = GetPlayerFaction();
	for i=1,getn(tbDropInfo) do
		local nCount = tbDropInfo[i];
		local nRand = 0;
		if nCount > 0 then
			if nCount >= 2 then	--ÊıÖµ´óÓÚµÈÓÚ2µÄÎïÆ·µôÂäÓĞ30%¼¸ÂÊµôÂäÊıÁ¿¼õ1£¬ÓĞ30%¼¸ÂÊµôÂäÊıÁ¿¼Ó1£¬Áí40%¼¸ÂÊ²»±ä
				nRand = random(1,100);
				if nRand <= 30 then
					nCount = nCount - 1;
				elseif nRand <= 60 then
					nCount = nCount + 1;
				end;
			end;
			AddItem(TB_TOTEM_INFO[nFaction][i][1],TB_TOTEM_INFO[nFaction][i][2],TB_TOTEM_INFO[nFaction][i][3],nCount);
			Msg2Player("B¹n nhËn ®­îc "..nCount.."c¸i"..TB_TOTEM_INFO[nFaction][i][4]);
		end;
	end;
	local nExp = 0;
	local nGongXian = 0;
	if IB_VERSION == 1 then	--Ãâ·ÑÇø
		nExp = 160000;
		nGongXian = 25;
	else	--ÊÕ·ÑÇø
		nExp = 250000;
		nGongXian = 40;	
	end;
	ModifyExp(nExp);
	Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
	local nCurGongXian = GetTask(336);
	if nCurGongXian > 12500 then
		Msg2Player("HiÖn t¹i ®iÓm cèng hiÕn s­ m«n cña b¹n ®· v­ît qu¸ 12500 ®iÓm, kh«ng thÓ nhËn ®­îc phÇn th­ëng ®iÓm cèng hiÕn ë mËt thÊt s­ m«n n÷a");
	else
		SetTask(336,nCurGongXian+nGongXian);
		Msg2Player("B¹n nhËn ®­îc "..nGongXian.." ®iÓm cèng hiÕn S­ M«n ");
	end;
	Msg2Player("B¹n ®· nhËn råi"..TB_DIFF_NAME[nDiff].."§é khã ¶i "..nStage.."R­¬ng cña ¶i");
	WriteLog(LOG_HEADER..GetName().." nhËn ®é khã"..nDiff.."thø"..nStage..".	");
end;
--½øÈëÃ¿¹ØÇ°µÄ¼ì²â
function BR_EnterNextStageCheck(nDiff,nStage,nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	if PlayerIndex == 0 then
		return 0;
	end;
	if BR_CheckLevel(nDiff,nStage) == 0 then
		PlayerIndex = nOldPIdx;
		return 0;
	end;
	if BR_CheckTitle(nDiff,nStage) == 1 then
		PlayerIndex = nOldPIdx;
		return 1;
	end;
	if BR_CheckEquipment(nDiff,nStage) == 1 then
		PlayerIndex = nOldPIdx;
		return 1;
	end;
	if BR_CheckRouteFeature(nDiff,nStage) == 1 then
		PlayerIndex = nOldPIdx;
		return 1;
	end;
	PlayerIndex = nOldPIdx;
	return 0;
end;
function BR_CheckLevel(nDiff,nStage)
	local nLevel = GetLevel();
	local tbLevelNeed = {50,50,50,50,50,70,70,85,85};
	if nLevel < tbLevelNeed[nDiff] then
		return 0;
	end;
end;
--¼ì²â³ÆºÅ
function BR_CheckTitle(nDiff,nStage)
	local nTitleID1,nTitleID2 = GetCurTitle();
	if nDiff <= 5 then
		return 1;
	end;
	if nDiff == 8 or nDiff == 9 then  --8¡¢9ÄÑ¶È²»ÅĞ¶Ï
		return 0;
	end;
	local tbTitleNeed = 	--¶¨ÒåËùÓĞ³ÆºÅĞÅÏ¢
	{
		[1] = {{30,11},{30,5}},	--½«¾ü
		[2] = {{30,12},{30,6}},	--ÔªË§
		[3] = {{51,1},{51,2},{51,5},{51,6},{51,9},{51,10}},	--³ÇÖ÷
		[4] = {{51,3},{51,7},{51,11}},	--¾üÊ¦
		[5] = {{51,4},{51,8},{51,12}},	--Ãû²¶
		[6] = {{30,4},{30,10}},	--ÏÈ·æ
		[7] = {{30,3},{30,9}},	--¶¼Í³
	}
	local tbCheck = 	--¶¨Òå¸÷ÄÑ¶ÈËùÒª¼ì²éµÄ³ÆºÅÀàĞÍ
	{
		[1] = nil,
		[2] = nil,
		[3] = nil,
		[4] = nil,
		[5] = nil,
		[6] = {1,2,3,4,5,6,7},
		[7] = {1,2,3,4,5,6,7},
		[8] = {1,2,3},
		[9] = {1,2,3},
	}
	local tbTitleInfo = tbCheck[nDiff];
	if tbTitleInfo == nil then
		return 1;
	end;
	local nTitleType = 0;
	for i=1,getn(tbTitleInfo) do
		nTitleType = tbTitleInfo[i];
		for j=1,getn(tbTitleNeed[nTitleType]) do
			if nTitleID1 == tbTitleNeed[nTitleType][j][1] and nTitleID2 == tbTitleNeed[nTitleType][j][2] then
				return 1;
			end;
		end;	
	end;
	return 0;
end;
--¼ì²â×°±¸
function BR_CheckEquipment(nDiff,nStage)
	if nDiff <= 5 then
		return 1;
	end;
	if (BR_CheckYanDiEquip() == 1 or BR_CheckHuangDiEquip() == 1 or BR_CheckTDXHEquip() == 1) and nDiff ~= 8 and nDiff ~= 9 then --8¡¢9¹ØÖ»ÄÜ´©Ê¦ÃÅµÚ4Ì×
		return 1;
	end;
	if nDiff == 6 or nDiff == 7 then
		if BR_CheckFactionEquip(3,2) == 1 or BR_CheckFactionEquip(4,2) == 1 or BR_CheckFactionEquip(5,3) == 1 then
			return 1;
		end;
	end;
	if nDiff == 8 or nDiff == 9 then
		if BR_CheckFactionEquip(4,6) == 1 then
			return 1;
		end;	
	end;
	return 0;
end;
--¼ì²éÑ×µÛ×°
function BR_CheckYanDiEquip()
	local nSuitID1 = GetEquipSuitID(GetPlayerEquipIndex(0));
	local nSuitID2 = GetEquipSuitID(GetPlayerEquipIndex(1));
	local nSuitID3 = GetEquipSuitID(GetPlayerEquipIndex(3));
	local nBody = GetBody();
	if (nSuitID1 == nSuitID2 and nSuitID1 == nSuitID3 and nSuitID1 == 80000+nBody) or (nSuitID1 == nSuitID2 and nSuitID1 == nSuitID3 and nSuitID1 == 80064+nBody) then
		return 1;
	else
		return 0;
	end;
end;
--¼ì²é»ÆµÛ
function BR_CheckHuangDiEquip()
	local nRoute = GetPlayerRoute();
	local nSuitID1 = GetEquipSuitID(GetPlayerEquipIndex(2));
	local nSuitID2 = GetEquipSuitID(GetPlayerEquipIndex(4));
	local nSuitID3 = GetEquipSuitID(GetPlayerEquipIndex(5));
	local nCheckRetCode,nRoutePos = gf_CheckPlayerRoute();
	if nCheckRetCode ~= 1 then
		return 0;
	end;
	if nSuitID1 == nSuitID2 and nSuitID1 == nSuitID3 and nSuitID1 == 88000+nRoutePos then
		return 1;
	else
		return 0;
	end;
end;
--¼ì²éÌìµØĞş»Æ
function BR_CheckTDXHEquip()
	local nEquipIdx1 = GetPlayerEquipIndex(0);	--Í·
	local nEquipIdx2 = GetPlayerEquipIndex(1);	--ÒÂ
	local nEquipIdx3 = GetPlayerEquipIndex(2);	--ÎäÆ÷
	local nEquipIdx4 = GetPlayerEquipIndex(3);	--¿ã×Ó
	local nID1,nID2,nID3 = 0,0,0;
	local nBody = GetBody();
	local tbTDXHWeapon = 
	{
		{0,3,67},{0,8,100},{0,0,17},{0,1,56},{0,2,39},{0,10,78},{0,0,17},
		{0,5,43},{0,2,39},{0,9,89},{0,6,111},{0,4,122},{0,11,15},{0,7,15},
	}
	nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx1);	--Í·
	if nID1 ~= 0 or nID2 ~= 103 or nID3 ~= 85+nBody-1 then
		return 0;
	end;
	nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx2);--ÒÂ
	if nID1 ~= 0 or nID2 ~= 100 or nID3 ~= 85+nBody-1 then
		return 0;
	end;
	nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx3);--ÎäÆ÷
	local bWeaponCheck = 0;
	for i=1,getn(tbTDXHWeapon) do
		if nID1 == tbTDXHWeapon[i][1] and nID2 == tbTDXHWeapon[i][2] and nID3 == tbTDXHWeapon[i][3] then
			bWeaponCheck = 1;
		end;
	end;
	if bWeaponCheck == 0 then
		return 0;
	end;
	nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx4);--¿ã×Ó
	if nID1 ~= 0 or nID2 ~= 101 or nID3 ~= 85+nBody-1 then
		return 0;
	end;
	return 1;
end;
--¼ì²éÊ¦ÃÅ×°±¸,²ÎÊınGen±íÊ¾µÚ¼¸Ì×£¬nNumÊÇ×îµÍ¼ì²é¼şÊı
function BR_CheckFactionEquip(nGen,nNum)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nFaction = GetPlayerFaction();
	local nSuitID = nRoute*1000+(nGen-1)*10+nBody;
	if nFaction == 3 then	--Èç¹ûÊÇ¶ëáÒ
		nSuitID = nSuitID - 2;
	end;
	local nCheckNum = 0;
	local nEquipIdx = 0;
	for i=1,6 do	--¼ì²éÍ·ÒÂ¿ãÎäÆ÷Ê×ÊÎ1Ê×ÊÎ2
		nEquipIdx = GetPlayerEquipIndex(i-1);
		if GetEquipSuitID(nEquipIdx) == nSuitID then
			nCheckNum = nCheckNum + 1;
		end;
	end;
	if nCheckNum >= nNum then
		return 1;
	else
		return 0;
	end;
end;
--¼ì²éÁ÷ÅÉÌØÉ«
function BR_CheckRouteFeature(nDiff,nStage)
	if gf_CheckPlayerRoute() == 0 then
		return 0;
	end;
	local nRoute = GetPlayerRoute();
	if nDiff <= 5 then
		return 1;
	end;
	if nDiff == 8 or nDiff == 9 then  --8¡¢9ÄÑ¶È²»ÅĞ¶Ï
		return 0;
	end;	
	local nLL = GetAllStrength() - GetStrength();		--Á¦Á¿1
	local nSF = GetAllDexterity() - GetDexterity();		--Éí·¨2
	local nNG = GetAllEnergy() - GetEnergy();			--ÄÚ¹¦3
	local nDC = GetAllObserve() - GetObserve();			--¶´²ì4
	local nGG = GetAllVitality() - GetVitality();		--¸ù¹Ç5
	local tbPro = {nLL,nSF,nNG,nDC,nGG};
	local tbRouteFeature = 
	{	--{{ÊôĞÔ1,ÊôĞÔ2},{45Ñ­»·ÏŞÖÆÊıÖµ,67Ñ­»·ÏŞÖÆÊıÖµ,89Ñ­»·ÏŞÖÆÊıÖµ}}
		 [0] = {},
		 [1] = {},	
		 [2] = {{{1,5},{225,275,400}}},	--ÉÙÁÖË×¼Ò
		 [3] = {{{3,5},{210,255,380}}},	--ÉÙÁÖìøÉ®
		 [4] = {{{3,5},{200,245,370}}},	--ÉÙÁÖÎäÉ®
		 [5] = {},			--ÌÆÃÅ
		 [6] = {{{1,2},{180,225,350}},{{2,3},{160,215,340}}},	--ÌÆÃÅ
		 [7] = {},			--¶ëáÒ
		 [8] = {{{3,5},{200,245,370}}},	--¶ëáÒ·ğ¼Ò
		 [9] = {{{2,3},{165,215,340}},{{3,5},{185,230,350}}},	--¶ëáÒË×¼Ò
		[10] = {},			--Ø¤°ï
		[11] = {{{1,5},{220,265,390}}},--Ø¤°ï¾»ÒÂ
		[12] = {{{2,4},{110,155,280}},{{1,2},{160,205,330}}},--Ø¤°ïÎÛÒÂ
		[13] = {},			--Îäµ±
		[14] = {{{3,4},{170,215,340}},{{2,3},{150,195,320}}},--Îäµ±µÀ¼Ò
		[15] = {{{2,4},{110,155,280}},{{1,4},{160,205,330}}},--Îäµ±Ë×¼Ò
		[16] = {},			--ÑîÃÅ
		[17] = {{{1,5},{220,265,390}}},--ÑîÃÅÇ¹Æï
		[18] = {{{1,2},{180,225,370}}},--ÑîÃÅ¹­Æï
		[19] = {},			--Îå¶¾
		[20] = {{{1,2},{180,225,370}}},--Îå¶¾Ğ°ÏÀ
		[21] = {{{3,4},{160,205,330}},{{4,5},{150,195,320}}},--Îå¶¾¹ÆÊ¦
	}
	local nIndex = 0;
	if nDiff == 4 or nDiff == 5 then
		nIndex = 1;
	elseif nDiff == 6 or nDiff == 7 then	--080505ĞŞ¸Ä£º67ÄÑ¶È¸ÄÎªÓë45ÄÑ¶ÈÒ»Ñù
		nIndex = 1;
	elseif nDiff == 8 or nDiff == 9 then
		nIndex = 3;
	end;
	local tbInfo = {};
	for i=1,getn(tbRouteFeature[nRoute]) do
		tbInfo = tbRouteFeature[nRoute][i];
		if tbPro[tbInfo[1][1]]+tbPro[tbInfo[1][2]] >= tbInfo[2][nIndex] then
			return 1;
		end;
	end;
	return 0; 
end;
--¸øNPC²¥·ÅÌØĞ§
function BR_SetCurrentNpcSFX(nNpcIdx,nEffectID,nPos,bRepeat)
	nPos = nPos or 2;	--Ä¬ÈÏÔÚÍ·²¿²¥
	bRepeat = bRepeat or 0;	--Ä¬ÈÏ²»Ñ­»·
	if IsNpcDeath(nNpcIdx) == 0 then	--Èç¹ûNPC»¹»î×Å¾Í²¥·ÅÌØĞ§
		SetCurrentNpcSFX(nNpcIdx,nEffectID,nPos,bRepeat);
	end;
end;
--¸øÍæ¼Ò²¥·ÅÌØĞ§
function BR_SetCurrentPlayerSFX(nEffectID,nPos,bRepeat)
	local nPIdx = GetMissionV(MV_PLAYERINDEX);
	if nPIdx == 0 then
		return 0;
	end;
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx;
	local nNpcIdx = PIdx2NpcIdx(nPIdx);	--´ËÖ¸ÁîÒªÔÚPlayerIndexÓĞĞ§µÄÇé¿öÏÂ²ÅÄÜÆğ×÷ÓÃ
	BR_SetCurrentNpcSFX(nNpcIdx,nEffectID,nPos,bRepeat);
	PlayerIndex = nOldPIdx;
	return 1;
end;
--Ëø¶¨Óë½âËø×°±¸
function BR_LockEquipment(bLock)
	local tbEquipPos = {0,1,2,3,4,5};
	for i=1,getn(tbEquipPos) do
		ForbidEquipSolt(tbEquipPos[i],bLock);
	end;
end;
--===================================================================================
function BR_KnowLimit()
	local selTab = {
			". 6, 7 tuÇn hoµn (®Õn cÊp 70)/backroom_know_limit_2",
			". 8, 9 tuÇn hoµn (®Õn cÊp 85)/backroom_know_limit_3",
			"* Quay l¹i/main",
			". KÕt thóc ®èi tho¹i/nothing",
			}
	Say(g_szInforHeader.."1, 2, 3, 4, 5 tuÇn hoµn, ®Õn cÊp 50 cã thÓ tham gia.",getn(selTab),selTab);
end;

function backroom_know_limit_2()
	Talk(2,"backroom_know_limit_2_1","Ph¶i ®ñ t­ c¸ch 1 trong nh÷ng ®iÒu kiÖn bªn d­íi: \nDanh hiÖu: mét trong bÊt kú danh hiÖu t­íng qu©n, nguyªn so¸i, tiªn phong, ®« thèng, thµnh chñ qu©n s­, danh bé\nTrang bŞ: mét trong bÊt kú ®ñ bé viªm ®Õ,  thien chi viªm ®Õ, hoµng ®Õ, thiªn ®Şa huyÒn hoµng, 2 mãn s­ m«n bé 3 trë lªn, 2 mãn s­ m«n bé 4 trë lªn\n    ThiÕu L©m tôc gia: trang bŞ, tr¹ng th¸i cïng víi hÖ ph¸i cã tÊt c¶ c¸c trŞ sè søc m¹nh g©n cèt céng l¹i h¬n 225\n    ThiÕu L©m vâ t¨ng:  trang bŞ, tr¹ng th¸i cïng  c¸c thuéc tİnh tæng néi c«ng vµ g©n cèt céng l¹i ph¶i h¬n 200 ®iÓm","    ThiÕu L©m thiÒn t¨ng: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng g©n cèt, néi c«ng tæng céng h¬n 210 ®iÓm\n    §­êng M«n: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng th©n ph¸p, søc m¹nh tæng céng h¬n 180 ®iÓm hoÆc t¨ng th©n ph¸p, néi c«ng tæng céng h¬n 160 ®iÓm\n    Nga My phËt gia: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng g©n cèt, néi c«ng tæng céng h¬n 200 ®iÓm\n    Nga My tôc gia: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng th©n ph¸p, néi c«ng tæng céng h¬n 165 ®iÓm hoÆc t¨ng g©n cèt, néi c«ng tæng céng h¬n 185 ®iÓm");

end;

function backroom_know_limit_2_1()
	Talk(2,"BR_KnowLimit","    C¸i Bang tŞnh y: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng g©n cèt, søc m¹nh tæng céng h¬n 220 ®iÓm\n    C¸i Bang « y: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng th©n ph¸p, nhanh nhÑn tæng céng h¬n 110 ®iÓm hoÆc t¨ng th©n ph¸p, søc m¹nh tæng céng h¬n 160 ®iÓm\n    Vâ §ang ®¹o gia: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng néi c«ng, nhanh nhÑn tæng céng h¬n 170 ®iÓm hoÆc t¨ng néi c«ng, th©n ph¸p tæng céng h¬n 150 ®iÓm\n    Vâ §ang tôc gia: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng nhanh nhÑn, th©n ph¸p tæng céng h¬n 110 ®iÓm hoÆc t¨ng nhanh nhÑn, søc m¹nh tæng céng h¬n 160 ®iÓm","    D­¬ng M«n th­¬ng kş: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng søc m¹nh, g©n cèt tæng céng h¬n 220 ®iÓm\n    D­¬ng M«n cung kş: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng th©n ph¸p, søc m¹nh tæng céng h¬n 180 ®iÓm\n    Ngò §éc tµ hiÖp: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng th©n ph¸p, søc m¹nh tæng céng h¬n 180 ®iÓm\n    Ngò §éc cæ s­: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng nhanh nhÑn, néi c«ng tæng céng h¬n 160 ®iÓm hoÆc nhanh nhÑn, g©n cèt tæng céng h¬n 150 ®iÓm");
end;

function backroom_know_limit_3()
--	Talk(2,"backroom_know_limit_3_1","ÒÔÏÂËùÓĞÌõ¼şÂú×ãÈÎºÎÒ»ÖÖ¼´¿É£º\n³ÆºÅ£ºÏÖ³ö½«¾ü£¬ÔªË§£¬¶¼Í³£¬ÏÈ·æ£¬³ÇÖ÷£¬¾üÊ¦£¬Ãû²¶ÈÎºÎÒ»ÖÖ\n×°±¸£º´©´÷Ñ×µÛÈ«Ì×£¬»ÆµÛÈ«Ì×£¬ÌìµØĞş»ÆÈ«Ì×£¬Ê¦ÃÅµÚ3Ì×4¼ş¼«ÆäÒÔÉÏ£¬Ê¦ÃÅµÚ4Ì×4¼ş¼«ÆäÒÔÉÏÈÎºÎÒ»ÖÖ\n    ÉÙÁÖË×¼Ò£º×°±¸,×´Ì¬ÒÔ¼°Á÷ÅÉ¶îÍâÊôĞÔ¼Ó³ÉËù¼ÓµÄÁ¦Á¿¸ù¹Ç×ÜÖµ´óÓÚ400µã","    ÉÙÁÖÎäÉ®£º×°±¸£¬×´Ì¬ÒÔ¼°Á÷ÅÉ¶îÍâÊôĞÔ¼Ó³ÉµÄÄÚ¹¦¸ù¹Ç×ÜÖµ´óÓÚ370µã\n    ÉÙÁÖìøÉ®£º×°±¸£¬×´Ì¬ÒÔ¼°Á÷ÅÉ¶îÍâÊôĞÔ¼Ó³ÉµÄÄÚ¹¦¸ù¹Ç×ÜÖµ´óÓÚ380µã\n    ÌÆÃÅ£º×°±¸£¬×´Ì¬ÒÔ¼°Á÷ÅÉ¶îÍâÊôĞÔ¼Ó³ÉµÄÉí·¨Á¦Á¿×ÜÖµ´óÓÚ350µã»òÕßÉí·¨ÄÚ¹¦×ÜÖµ´óÓÚ340µã\n    ¶ëáÒ·ğ¼Ò£º×°±¸£¬×´Ì¬ÒÔ¼°Á÷ÅÉ¶îÍâÊôĞÔ¼Ó³ÉµÄÄÚ¹¦¸ù¹Ç×ÜÖµ´óÓÚ370µã\n    ¶ëáÒË×¼Ò£º×°±¸£¬×´Ì¬ÒÔ¼°Á÷ÅÉ¶îÍâÊôĞÔ¼Ó³ÉµÄÄÚ¹¦Éí·¨×ÜÖµ´óÓÚ340µã»òÕßÄÚ¹¦¸ù¹Ç×ÜÖµ´óÓÚ350µã");
	Talk(1,"BR_KnowLimit","8, 9 tuÇn hoµn, chØ cã thÓ mÆc bé trang bŞ s­ m«n 4, trong qu¸ tr×nh v­ît ¶i kh«ng ®­îc thay ®æi trang bŞ.")
end;

function backroom_know_limit_3_1()
	Talk(2,"BR_KnowLimit","    C¸i Bang tŞnh y: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng søc m¹nh, g©n cèt tæng céng h¬n 390 ®iÓm\n    C¸i Bang « y: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng th©n ph¸p, nhanh nhÑn tæng céng h¬n 280 ®iÓm hoÆc t¨ng th©n ph¸p, søc m¹nh tæng céng h¬n 330 ®iÓm\n    Vâ §ang ®¹o gia: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng néi c«ng, nhanh nhÑn tæng céng h¬n 340 ®iÓm hoÆc néi c«ng, th©n ph¸p tæng céng h¬n 320 ®iÓm\n    Vâ §ang tôc gia: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng nhanh nhÑn, th©n ph¸p tæng céng h¬n 280 ®iÓm hoÆc t¨ng nhanh nhÑn, søc m¹nh tæng céng h¬n 330 ®iÓm","    D­¬ng M«n th­¬ng kş: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng søc m¹nh, g©n cèt tæng céng h¬n 390 ®iÓm\n    D­¬ng M«n cung kş: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng th©n ph¸p, søc m¹nh tæng céng h¬n 370 ®iÓm\n    Ngò §éc tµ hiÖp: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng th©n ph¸p, søc m¹nh tæng céng h¬n 370 ®iÓm\n    Ngò §éc cæ s­: trang bŞ, tr¹ng th¸i, thuéc tİnh l­u ph¸i t¨ng nhanh nhÑn, néi c«ng tæng céng h¬n 330 ®iÓm hoÆc t¨ng nhanh nhÑn, g©n cèt tæng céng h¬n 320 ®iÓm");
end;

function nothing()

end;