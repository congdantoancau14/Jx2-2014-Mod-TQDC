--×÷Õß£ºÑÏ¾ü
--´´½¨ÈÕÆÚ£º07Äê11ÔÂ21ÈÕ11:44
--NPCËÀÍö½Å±¾
--×¢Òâ£º¿¼ÂÇµ½Òò²»Ã÷Ô­ÒòÔì³ÉNPCË¢ÔÚ¹Ø¿¨ÒÔÍâµÄµØÍ¼£¬Ğè¶ÔNPCËÀÍöÊ±Ëù´¦µÄµØÍ¼×÷ÅĞ¶Ï
Include("\\script\\task\\faction_back_room\\back_room_function.lua");
function OnDeath(nNpcIdx)
--	if GetMissionV(MV_NSC_REMOVE_NPC_BODY) == 1 then
--		BR_RemoveNpcIndex(nNpcIdx);
--		SetNpcLifeTime(nNpcIdx,0);
--	end;
	local nNeedKillCount = GetMissionV(MV_NSC_NEED_KILL_NUMBER);
	local nCurKillCount = GetMissionV(MV_NSC_KILL_NPC_COUNT);
	SetMissionV(MV_NSC_KILL_NPC_COUNT,nCurKillCount+1);
	SetMissionV(MV_NSC_REFLASH_KILL_NUMBER,GetMissionV(MV_NSC_REFLASH_KILL_NUMBER)+1);
	if BR_CheckWinCondition() == 1 then	--¼ì²éÊÇ·ñ´ïµ½¹ı¹ØÒªÇó
--		if GetMissionV(MV_MISSION_STATE) ~= MS_STATE_STARTED then
--			return 0;
--		end;
		BR_EndStage();
	else
--		Msg2MSAll(MISSION_ID,"Sè l­îng thñ vÖ cßn l¹i: "..(nNeedKillCount-nCurKillCount-1));
		Msg2MSAll(MISSION_ID,"Sè l­îng thñ vÖ cßn l¹i: "..(15-nCurKillCount-1));
	end;
end;