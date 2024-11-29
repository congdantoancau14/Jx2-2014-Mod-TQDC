Include("\\script\\task\\faction_back_room\\back_room_function.lua");

--Missionº¯Êý==============================================================================
--³õÊ¼»¯Mission
function MS_InitMission()
	local nMSUID = MS_CreateMSUID();	--´´½¨Ò»¸öMissionÎ¨Ò»ID
	SetMissionV(MV_MISSION_UID,nMSUID);	
	SetMissionS(MS_MISSION_NAME,MISSION_NAME..nMSUID);	--¼ÇÂ¼MissionµÄÃû×Ö
	SetMissionS(MS_MISSION_STRING,"¶i s­ m«n");
	WriteLog(LOG_HEADER.."Mission ®· b¾t ®Çu, MSUID:"..nMSUID);
end;
--Mission¿ªÊ¼
function MS_StartMission()
	BR_ChangeMSState(MS_STATE_STARTED);
end;
--Mission½áÊø
function MS_EndMission()
	BR_ChangeMSState(MS_STATE_IDEL);
	local nMSUID = GetMissionV(MV_MISSION_UID);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);	--´ÓMissionÀïÃæÉ¾³ýËùÓÐµÄÍæ¼Ò
	local nMapID = SubWorldIdx2ID(SubWorld);
	BR_ClearMapNpcSafe(nMapID);
	WriteLog(LOG_HEADER.."Mission ®· kÕt thóc, MSUID:"..nMSUID);
	mf_ClearMissionData();
end;
--Àë¿ªMission
function MS_LeaveMission()
	local nFaction = GetMissionV(MV_FACTION);
	local nDesMapID = GetMissionV(MV_ENTRY_MAPID);
	if DEBUG_VERSION == 1  then
		NewWorld(100,1456,2789);
	else
		if BR_CheckEntryMapID(nDesMapID) == 1 then
			NewWorld(nDesMapID,TB_EXIT_POS[nDesMapID][1],TB_EXIT_POS[nDesMapID][2]);
		else
			BR_SafeTransmission();	--°²È«µÄ´«ËÍ
		end;
	end;
	MS_RestorePlayerState();
end;
--¼ÓÈëMission
function MS_JoinMission(nCamp)
	CleanInteractive();
	local nFaction = GetPlayerFaction();
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nMapX = TB_ENTRY_POS[nFaction][1];
	local nMapY = TB_ENTRY_POS[nFaction][2];
	NewWorld(nMapID,nMapX,nMapY);
	AddMSPlayer(MISSION_ID,nCamp)
	MS_SetPlayerState();
end;
--´¦Àí×¼±¸½×¶ÎµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		BR_ChangeMSState(MS_STATE_STARTED);	--¸ù±¾¾Í²»ÐèÒªRunMission
		Msg2MSAll(MISSION_ID,"Thêi gian chuÈn bÞ kÕt thóc, b¾t ®Çu v­ît ¶i...");
		BR_NextStage();
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Giai ®o¹n chuÈn bÞ, thêi gian cßn "..tf_GetTimeString((nLoop*READY_TIMER_INTERVAL)*60));
	end;
end;
--´¦ÀíMission¿ªÊ¼ºóµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nCurDiff = BR_GetCurDiff();
	local nCurStage= BR_GetCurStage();
	local nPIdx = GetMissionV(MV_PLAYERINDEX);
--	if nLoop == 0 then
--		Msg2MSAll(MISSION_ID,"V­ît ¶i thÊt b¹i ......");
--		BR_UnInitStageEven(nCurDiff,nCurStage);
--		BR_ChangeMSState(MS_STATE_END_WAITING);
--		BR_CreateDisciple();
--		WriteLog(LOG_HEADER.."V­ît ¶i thÊt b¹i. §é khã: "..nCurDiff..", ¶i  "..nCurStage..". Tªn: "..GetName(nPIdx)..", cÊp:"..GetLevel(nPIdx)..","..GetMissionV(MV_ROUTE)..", nguyªn nh©n: v­ît qu¸ thêi gian cho phÐp");
--	else
		BR_ProcStageEven(nCurDiff,nCurStage);
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		if mod(nLoop,6) == 0 then
			Msg2MSAll(MISSION_ID,"§ang v­ît ¶i, thêi gian cßn "..tf_GetTimeString(60*nLoop*STARTED_TIMER_INTERVAL));
		end;
--	end;
end;
--´¦Àí¹ý¹Ø¶ÌÔÝµÈ´ýµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessShortPauseTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		Msg2MSAll(MISSION_ID,"Thêi gian chuÈn bÞ kÕt thóc, vµo ¶i kÕ tiÕp ...");
		BR_NextStage();
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		local nSec = 60*nLoop*SHORT_PAUSE_TIMER_INTERVAL;
		Msg2MSAll(MISSION_ID,"Giai ®o¹n chuÈn bÞ, thêi gian cßn "..tf_GetTimeString(nSec));
	end;
end;
--´¦ÀíµÈ´ý½áÊøµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		Msg2MSAll(MISSION_ID,", b©y giê xin mêi rêi ¶i...");
		BR_CloseStage();
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Giai ®o¹n kÕt thóc, thêi gian cßn "..tf_GetTimeString(60*nLoop*ENDING_TIMER_INTERVAL));
	end;
end;
--µÇÂ½´¥·¢Æ÷º¯Êý
function OnLogin()
	MS_RestorePlayerState();
	WriteLog(LOG_HEADER.."Ng­êi ch¬i "..GetName().." Rêi Mission kh«ng b×nh th­êng, ®ang trong qu¸ tr×nh xö lý ®¨ng nhËp.");
end;
--=====================================================================================
--´´½¨Ò»¸öMSUID£¨µ±Ç°MissionÎ¨Ò»±êÊ¶£©
function MS_CreateMSUID()
	local nMSUID = BR_GetCurMapID();	--ÓÃµØÍ¼IDÀ´±êÊ¶£¬ËäÈ»²»ÄÜ×÷Î¨Ò»±êÊ¶£¬²»¹ýÒ²¹»ÓÃÁË
	return nMSUID;
end;
--½øÈë³¡µØÊ±Í³Ò»½øÐÐµÄ²Ù×÷
function MS_SetPlayerState()
	local nWeek = tonumber(date("%y%W"));
	local nFaction = GetPlayerFaction();
	local nRoute = GetPlayerRoute();
	local nMapID = SubWorldIdx2ID(SubWorld);
	BR_ClearTempTask();	--ÁÙÊ±±äÁ¿Çå0
	BR_ClearNCTask();	--NC±äÁ¿Çå0
	BR_ClearMapTask(nMapID);	--µØÍ¼±äÁ¿Çå0
	SetTask(TSK_ATTEND_WEEK,nWeek);
	SetTask(TSK_WC_ATTEND_TIMES,GetTask(TSK_WC_ATTEND_TIMES)+1);
	SetMissionV(MV_FACTION,nFaction);
	SetMissionV(MV_ROUTE,nRoute);
	SetMissionV(MV_PLAYERINDEX,PlayerIndex);
	--===================================================================
	SetPKFlag(1,1);
	ForbidChangePK(1);
	SetFightState(1);
	SetDeathScript("\\script\\task\\faction_back_room\\death_player.lua");
	SetLogoutRV(1);
	UseScrollEnable(0);
	StallEnable(0);	--½ûÖ¹°ÚÌ¯(ÏÂÏßºó»á±»Çåµô)
	LeaveTeam();	--Àë¿ª¶ÓÎé
	SetDeathPunish(0);	--ÎÞËÀÍö³Í·£
	SetCreateTeam(1);	--¹Ø±Õ×é½¨¶ÓÎé(ÏÂÏßºó»á±»Çåµô)
	ForbitTrade(1);	--½ûÖ¹½»Ò×
	InteractiveEnable(0);	--¹Ø±Õ½»»¥	±ØÐëÔÚNewWorldÖ®ºóÖ´ÐÐ²ÅÓÐÐ§
	SetPlayerScript("");
	SetMomentumBoundSwitch(1);	--²»¿ÉÔö¼ÓÉ±ÆøÖµ
	CreateTrigger(3,LOGIN_ID,LOGIN_TRIGGER_ID);
	Msg2Player("Xin h·y b¾t ®Çu v­ît ¶i trong thêi gian quy ®Þnh.");	
	SetCampToPlayer(TB_CAMP_NAME[CAMP_PLAYER]);
	UseDummy(0,1);	--Çå³ýÌæÉí·ûÐ§¹û
	RemoveState(9900);	--Çå³ý³ÇÊÐ½±ÕÂ»»µÄ×´Ì¬
	MonitorCampRelation(TB_CAMP_NAME[CAMP_ENEMY],TB_CAMP_NAME[CAMP_EVIL]);
	MonitorCampRelation(TB_CAMP_NAME[CAMP_EVIL],TB_CAMP_NAME[CAMP_ENEMY]);
	MonitorCampRelation(TB_CAMP_NAME[CAMP_PLAYER],TB_CAMP_NAME[CAMP_EVIL]);
	MonitorCampRelation(TB_CAMP_NAME[CAMP_EVIL],TB_CAMP_NAME[CAMP_PLAYER]);
	MonitorCampRelation(TB_CAMP_NAME[CAMP_ENEMY],TB_CAMP_NAME[CAMP_PLAYER]);
	MonitorCampRelation(TB_CAMP_NAME[CAMP_PLAYER],TB_CAMP_NAME[CAMP_ENEMY]);
	gf_ForbidFactionSkill(1);	--ÆÁ±ÎÕòÅÉ
	RemvoeTempEffect();
	BR_RestorePlayer();
	BR_PauseStage();
end;
--Àë¿ª³¡µØÊ±Í³Ò»½øÐÐµÄ²Ù×÷
function MS_RestorePlayerState()
	ForbidChangePK(0);
	SetPKFlag(0,0);
	SetFightState(0);
	SetDeathScript("");
	SetLogoutRV(0);
	UseScrollEnable(1);
	StallEnable(1);	
	LeaveTeam();
	SetDeathPunish(1);
	SetCreateTeam(0);
	ForbitTrade(0);
	SetMomentumBoundSwitch(0);
	InteractiveEnable(1);
	SetPlayerScript("");
	RemoveTrigger(GetTrigger(LOGIN_TRIGGER_ID));
	SetCampToPlayer("");
	UnMonitorCampRelation(TB_CAMP_NAME[CAMP_ENEMY],TB_CAMP_NAME[CAMP_EVIL]);
	UnMonitorCampRelation(TB_CAMP_NAME[CAMP_EVIL],TB_CAMP_NAME[CAMP_ENEMY]);
	UnMonitorCampRelation(TB_CAMP_NAME[CAMP_PLAYER],TB_CAMP_NAME[CAMP_EVIL]);
	UnMonitorCampRelation(TB_CAMP_NAME[CAMP_EVIL],TB_CAMP_NAME[CAMP_PLAYER]);
	UnMonitorCampRelation(TB_CAMP_NAME[CAMP_ENEMY],TB_CAMP_NAME[CAMP_PLAYER]);
	UnMonitorCampRelation(TB_CAMP_NAME[CAMP_PLAYER],TB_CAMP_NAME[CAMP_ENEMY]);
	gf_ForbidFactionSkill(0);
	BR_ClearTempTask();
	BR_ClearNCTask();
	BR_StopTimeGuage(-2);
	BR_LockEquipment(0);
end;