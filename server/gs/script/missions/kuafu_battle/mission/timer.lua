Include("\\script\\missions\\kuafu_battle\\kf_head.lua")
Include("\\script\\missions\\kuafu_battle\\runtime_data_stat.lua")

function OnTimer()
	SetMissionV(KF_MV_BATTLE_GAME_FRAMETIME,GetGameLoop());
	local nState = GetMissionV(KF_MV_BATTLE_STATE);
	if nState == KF_MS_STATE_FIGHT then
		KF_FloatMsg2PlayerToAll();
	end
	local tFunc = {
		[KF_MS_STATE_PEACE] = "kf_state_peace()",
		[KF_MS_STATE_READY] = "kf_state_ready()",
		[KF_MS_STATE_FIGHT] = "kf_state_fight()",
		[KF_MS_STATE_COMPLETE] = "kf_state_complete()",
	}
	if tFunc[nState] then
		dostring(tFunc[nState]);
	end
end

function kf_state_peace()
	local nLoop = GetMissionV(KF_MV_BATTLE_TIMER_LOOP);
	local nPlayerOne = GetMSPlayerCount(KF_MISSION_ID,KF_CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(KF_MISSION_ID,KF_CampTwo_ID);
	if nLoop == 0 then
		if nPlayerOne >= KF_PLAYER_ALLOW_NUM and nPlayerTwo >= KF_PLAYER_ALLOW_NUM then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_READY_TIME);
			SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_READY_TIMER_LOOP);
			SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_READY);
			Msg2MSAll(KF_MISSION_ID,format("ChiÕn tr­êng liªn ®Êu sÏ b¾t ®Çu sau %ds, chiÕm lÜnh trËn kú lµ ®iÓm mÊu chèt ®Ó giµnh chiÕn th¾ng, c¸c vÞ anh hïng h·y chuÈn bÞ.", (KF_READY_TIME * (KF_READY_TIMER_LOOP + 1))/KF_FRAME_PER_SECOND));
		else
			--Ã»ÓÐ¿ªÆô
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_WAITOUT_TIME);
			SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_WAITOUT_TIMER_LOOP);
			SetMissionV(KF_MV_BATTLE_WINNER, KF_ALL_ID);
			SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_COMPLETE);
			SetMissionV(KF_MV_BATTLE_IS_OPEN_SUCC, KF_MISSION_OPEN_FAIL_FLAG);
			Msg2MSAll(KF_MISSION_ID,"Do sè ng­êi 2 bªn tham gia kh«ng ®ñ, chiÕn tr­êng liªn ®Êu ch­a thÓ khëi ®éng.");
			WriteLog("[ChiÕn tr­êng liªn ®Êu b¾t ®Çu]: "..tostring(date()).."Ch­a thÓ khëi ®éng thµnh c«ng");
			
			_stat_on_misson_none_start()
		end 
	else
		SetMissionV(KF_MV_BATTLE_TIMER_LOOP, nLoop-1);
		if mod(nLoop, 6) == 0 then --30Ãë²¥·ÅÒ»´Î
			Msg2MSAll(KF_MISSION_ID, "TiÕn ®é thêi gian: ["..(KF_PEACE_TIMER_LOOP-nLoop+1)..":"..(KF_PEACE_TIMER_LOOP+1).."]");
			local nTime = (nLoop - 1) * KF_PEACE_TIME / KF_FRAME_PER_SECOND
			local szMsg = format("Sè ng­êi hai bªn hiªn t¹i: %s[%d]:%s[%d], %ds, chiÕn ®Êu b¾t ®Çu.", KF_CampOne_Name, nPlayerOne, KF_CampTwo_Name, nPlayerTwo, nTime)
			Msg2MSAll(KF_MISSION_ID, szMsg);
		end
		if nPlayerOne >= KF_PLAYER_MAX_NUM and nPlayerTwo >= KF_PLAYER_MAX_NUM then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_READY_TIME);
			SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_READY_TIMER_LOOP);
			SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_READY);
			Msg2MSAll(KF_MISSION_ID,format("ChiÕn tr­êng liªn ®Êu sÏ b¾t ®Çu sau %d phót, chiÕm lÜnh trËn kú lµ ®iÓm mÊu chèt ®Ó giµnh chiÕn th¾ng, c¸c vÞ anh hïng h·y chuÈn bÞ.", 1));
		end
	end
end

t_player_num_to_score ={
	--min,max,score
	{-2100000000,19,0},
	{20,39,2000},
	{40,79,4000},
	{80,159,6000},
	{160,240,8000},
	{241,2100000000,8000},
}
--Ê¤¸º»ý·Ö
function kf_initial_top_socre(nTotalPlayerCount)
	if nTotalPlayerCount >=0 and nTotalPlayerCount < 2100000000 then
		for i=1,getn(t_player_num_to_score) do
			local t = t_player_num_to_score[i]
			if nTotalPlayerCount >= t[1] and nTotalPlayerCount <= t[2] then
				SetMissionV(KF_SCORE_MAX, t[3])
				SetMissionV(KF_JIANGJUN_SCORE, floor(t[3] / 2))
				SetMissionV(KF_SCORE_JIANGJUN, floor(t[3] * 20 / 100))
			end
		end
	end
end

function kf_state_ready()
	local nLoop = GetMissionV(KF_MV_BATTLE_TIMER_LOOP);
	local nPlayerOne = GetMSPlayerCount(KF_MISSION_ID,KF_CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(KF_MISSION_ID,KF_CampTwo_ID);	
	if nLoop == 0 then
		--ÅÐ¶ÏÏÂÈËÊý
		StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
		RunMission(KF_MISSION_ID);
		kf_initial_top_socre(nPlayerOne+nPlayerTwo)
		WriteLog("[ChiÕn tr­êng liªn ®Êu b¾t ®Çu]: Thêi gian lµ"..tostring(date()).."ChiÕn tr­êng liªn ®Êu ®· b¾t ®Çu, sè ng­êi hiÖn t¹i: ["..nPlayerOne.."]:["..nPlayerTwo.."], tæng sè ng­êi lµ: "..(nPlayerOne+nPlayerTwo));
		
		_stat_on_misson_start(KF_MISSION_ID)
	else
		SetMissionV(KF_MV_BATTLE_TIMER_LOOP, nLoop-1);
		Msg2MSAll(KF_MISSION_ID," cßn "..tostring(KF_READY_TIME/18*nLoop).."s, chiÕn tr­êng liªn ®Êu chÝnh thøc b¾t ®Çu. Sè ng­êi hiÖn t¹i lµ: "..KF_CampOne_Name.."["..nPlayerOne.."]:"..KF_CampTwo_Name.."["..nPlayerTwo.."]");
	end;
end

function kf_state_fight()
	local nLoop = GetMissionV(KF_MV_BATTLE_TIMER_LOOP);
	local nPlayerAll = GetMSPlayerCount(KF_MISSION_ID, KF_ALL_ID);
	local nPlayerOne = GetMSPlayerCount(KF_MISSION_ID, KF_CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(KF_MISSION_ID, KF_CampTwo_ID);	
	if nLoop == 0 then
		StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
		StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_WAITOUT_TIME);
		SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_WAITOUT_TIMER_LOOP);
		SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_COMPLETE);
		--ÅÐ¶Ï·ÖÊý
		local nSongScore = GetMissionV(KF_MV_BATTLE_SONG_SCORE);
		local nLiaoScore = GetMissionV(KF_MV_BATTLE_LIAO_SCORE);
		if nSongScore > nLiaoScore then
			SetMissionV(KF_MV_BATTLE_WINNER, KF_CampOne_ID);
			KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampOne_ID}, KF_ALL_ID);
			if nSongScore >= GetMissionV(KF_SCORE_MAX) then
				Msg2MSAll(KF_MISSION_ID, format("Phe %s ®iÓm tÝch lòy ®Æt tr­íc %d,®· giµnh chiÕn th¾ng trËn liªn ®Êu chiÕn tr­êng nµy.", KF_CampOne_Name, GetMissionV(KF_SCORE_MAX)));	
			else
				Msg2MSAll(KF_MISSION_ID, format("§iÓm tÝch lòy phe %s cao h¬n phe %s, %s giµnh chiÕn th¾ng!", KF_CampOne_Name, KF_CampTwo_Name, KF_CampOne_Name));	
			end
			
			_stat_on_misson_end(KF_MISSION_ID, 1)
			return 0;		
		elseif nSongScore < nLiaoScore then
			SetMissionV(KF_MV_BATTLE_WINNER, KF_CampTwo_ID);
			KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampTwo_ID}, KF_ALL_ID);
			if nSongScore >= GetMissionV(KF_SCORE_MAX) then
				Msg2MSAll(KF_MISSION_ID, format("Phe %s ®iÓm tÝch lòy ®Æt tr­íc %d,®· giµnh chiÕn th¾ng trËn liªn ®Êu chiÕn tr­êng nµy.", KF_CampTwo_Name, GetMissionV(KF_SCORE_MAX)));
			else
				Msg2MSAll(KF_MISSION_ID, format("§iÓm tÝch lòy phe %s cao h¬n phe %s, %s giµnh chiÕn th¾ng!", KF_CampTwo_Name, KF_CampOne_Name, KF_CampTwo_Name));	
			end
			
			_stat_on_misson_end(KF_MISSION_ID, 2)
			return 0;
		else
			local nSongActivity = GetMissionV(KF_MV_BATTLE_SONG_ACTIVITY);
			local nLiaoActivity = GetMissionV(KF_MV_BATTLE_LIAO_ACTIVITY);
			if nSongActivity > nLiaoActivity then
				SetMissionV(KF_MV_BATTLE_WINNER, KF_CampOne_ID);
				KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampOne_ID}, KF_ALL_ID);
				Msg2MSAll(KF_MISSION_ID, format("§é tÝch cùc [%s:%d]:[%s:%d], %s giµnh ®­îc chiÕn th¾ng chiÕn tr­êng liªn ®Êu lÇn nµy.",KF_CampOne_Name, nSongActivity, KF_CampTwo_Name, nLiaoActivity, KF_CampOne_Name));
				
				_stat_on_misson_end(KF_MISSION_ID, 1)
				return 0;
			elseif nSongActivity < nLiaoActivity then
				SetMissionV(KF_MV_BATTLE_WINNER, KF_CampTwo_ID);
				KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampTwo_ID}, KF_ALL_ID);
				Msg2MSAll(KF_MISSION_ID, format("§é tÝch cùc [%s:%d]:[%s:%d], %s giµnh ®­îc chiÕn th¾ng chiÕn tr­êng liªn ®Êu lÇn nµy.",KF_CampOne_Name, nSongActivity, KF_CampTwo_Name, nLiaoActivity, KF_CampTwo_Name));
				
				_stat_on_misson_end(KF_MISSION_ID, 2)
				return 0;
			else
				SetMissionV(KF_MV_BATTLE_WINNER, KF_ALL_ID);
				KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_ALL_ID}, KF_ALL_ID);
				Msg2MSAll(KF_MISSION_ID, format("§é tÝch cùc [%s:%d]:[%s:%d], trËn chiÕn tr­êng liªn ®Êu lÇn nµy bÊt ph©n th¾ng b¹i.",KF_CampOne_Name, nSongActivity, KF_CampTwo_Name, nLiaoActivity));
				
				_stat_on_misson_end(KF_MISSION_ID, 0)
				return 0;
			end
		end
	else
		SetMissionV(KF_MV_BATTLE_TIMER_LOOP, nLoop-1)
		--Ã¿¹ý15Ãë¾Í¼ì²éË«·½µÄÕóÆì
		if mod(nLoop, 5) == 0 then
			local tMissionV = {
				KF_MV_BATTLE_FLAG_JM,
				KF_MV_BATTLE_FLAG_MM,
				KF_MV_BATTLE_FLAG_SM,
				KF_MV_BATTLE_FLAG_SI,
				KF_MV_BATTLE_FLAG_DA,
			}
			for i = 1, getn(tMissionV) do
				local nTag = GetMissionV(tMissionV[i]);
				KF_AddScore(KF_ZHENQI_INC, nTag);
			end
		end
		--ÅÐ¶Ï·ÖÊý
		local nSongScore = GetMissionV(KF_MV_BATTLE_SONG_SCORE);
		local nLiaoScore = GetMissionV(KF_MV_BATTLE_LIAO_SCORE);
		--¼ì²é±È·Ö
		if nSongScore >= GetMissionV(KF_SCORE_MAX) and nLiaoScore >= GetMissionV(KF_SCORE_MAX) then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_WAITOUT_TIME);
			SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_WAITOUT_TIMER_LOOP);
			SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_COMPLETE);
			--ÅÐ¶Ï·ÖÊý			
			local nSongActivity = GetMissionV(KF_MV_BATTLE_SONG_ACTIVITY);
			local nLiaoActivity = GetMissionV(KF_MV_BATTLE_LIAO_ACTIVITY);
			if nSongActivity > nLiaoActivity then
				SetMissionV(KF_MV_BATTLE_WINNER, KF_CampOne_ID);
				KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampOne_ID}, KF_ALL_ID);
				Msg2MSAll(KF_MISSION_ID, format("§é tÝch cùc [%s:%d]:[%s:%d], %s giµnh ®­îc chiÕn th¾ng chiÕn tr­êng liªn ®Êu lÇn nµy.",KF_CampOne_Name, nSongActivity, KF_CampTwo_Name, nLiaoActivity, KF_CampOne_Name));
				
				_stat_on_misson_end(KF_MISSION_ID, 1)
				return 0;
			elseif nSongActivity < nLiaoActivity then
				SetMissionV(KF_MV_BATTLE_WINNER, KF_CampTwo_ID);
				KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampTwo_ID}, KF_ALL_ID);
				Msg2MSAll(KF_MISSION_ID, format("§é tÝch cùc [%s:%d]:[%s:%d], %s giµnh ®­îc chiÕn th¾ng chiÕn tr­êng liªn ®Êu lÇn nµy.",KF_CampOne_Name, nSongActivity, KF_CampTwo_Name, nLiaoActivity, KF_CampTwo_Name));
				
				_stat_on_misson_end(KF_MISSION_ID, 2)
				return 0;
			else
				SetMissionV(KF_MV_BATTLE_WINNER, KF_ALL_ID);
				KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_ALL_ID}, KF_ALL_ID);
				Msg2MSAll(KF_MISSION_ID, format("§é tÝch cùc [%s:%d]:[%s:%d], trËn chiÕn tr­êng liªn ®Êu lÇn nµy bÊt ph©n th¾ng b¹i.",KF_CampOne_Name, nSongActivity, KF_CampTwo_Name, nLiaoActivity));
				
				_stat_on_misson_end(KF_MISSION_ID, 0)
				return 0;
			end
			return 0;								
		end		
		if nSongScore >= GetMissionV(KF_SCORE_MAX) then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_WAITOUT_TIME);
			SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_WAITOUT_TIMER_LOOP);
			SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_COMPLETE);
			SetMissionV(KF_MV_BATTLE_WINNER, KF_CampOne_ID);
			Msg2MSAll(KF_MISSION_ID, format("Phe %s ®iÓm tÝch lòy ®Æt tr­íc %d,®· giµnh chiÕn th¾ng trËn liªn ®Êu chiÕn tr­êng nµy.", KF_CampOne_Name, GetMissionV(KF_SCORE_MAX)));
			KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampOne_ID}, KF_ALL_ID);	
			
			_stat_on_misson_end(KF_MISSION_ID, 1)
			return 0;			
		end
		if nLiaoScore >= GetMissionV(KF_SCORE_MAX) then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_WAITOUT_TIME);
			SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_WAITOUT_TIMER_LOOP);
			SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_COMPLETE);
			SetMissionV(KF_MV_BATTLE_WINNER, KF_CampTwo_ID);
			Msg2MSAll(KF_MISSION_ID, format("Phe %s ®iÓm tÝch lòy ®Æt tr­íc %d,®· giµnh chiÕn th¾ng trËn liªn ®Êu chiÕn tr­êng nµy.", KF_CampTwo_Name, GetMissionV(KF_SCORE_MAX)));
			KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampTwo_ID}, KF_ALL_ID);		
			
			_stat_on_misson_end(KF_MISSION_ID, 2)
			return 0;
		end
		if nPlayerOne == 0 and nPlayerTwo ~= 0 then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_WAITOUT_TIME);
			SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_WAITOUT_TIMER_LOOP);
			SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_COMPLETE);
			SetMissionV(KF_MV_BATTLE_WINNER, KF_CampTwo_ID);
			Msg2MSAll(KF_MISSION_ID, format("Sè ng­êi phe %s kh«ng ®ñ, %s ®· giµnh chiÕn th¾ng trËn liªn ®Êu lÇn nµy.", KF_CampOne_Name, KF_CampTwo_Name));
			KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampTwo_ID}, KF_ALL_ID);	
			
			_stat_on_misson_end(KF_MISSION_ID, 2)
			return 0;
		end
		if nPlayerTwo == 0 and nPlayerOne ~= 0 then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_WAITOUT_TIME);
			SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_WAITOUT_TIMER_LOOP);
			SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_COMPLETE);
			SetMissionV(KF_MV_BATTLE_WINNER, KF_CampOne_ID);
			Msg2MSAll(KF_MISSION_ID, format("Sè ng­êi phe %s kh«ng ®ñ, %s ®· giµnh chiÕn th¾ng trËn liªn ®Êu lÇn nµy.", KF_CampTwo_Name, KF_CampOne_Name));
			KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampOne_ID}, KF_ALL_ID);	
			
			_stat_on_misson_end(KF_MISSION_ID, 1)
			return 0;
		end
		if mod(nLoop, 10) == 0 then
			Msg2MSAll(KF_MISSION_ID,"TiÕn ®é thêi gian: ["..(KF_FIGHT_TIMER_LOOP-nLoop+1)..":"..(KF_FIGHT_TIMER_LOOP+1).."]");
			Msg2MSAll(KF_MISSION_ID,"§iÓm tÝch lòy 2 phe hiÖn t¹i lµ: "..KF_CampOne_Name.."["..nSongScore.."]:"..KF_CampTwo_Name.."["..nLiaoScore.."]")
			KF_OperateAllPlayer(KF_KickSleep, {}, KF_ALL_ID); --Ë¯ÃßµÄÇ¿ÐÐÌß³öÕ½³¡
		end		
		if mod(nLoop, 20) == 0 then
			Msg2MSAll(KF_MISSION_ID,format("Sè ng­êi 2 phe hiÖn t¹i lµ: %s[%d]:%s[%d]", KF_CampOne_Name, nPlayerOne, KF_CampTwo_Name, nPlayerTwo));
		end;
		KF_OperateAllPlayer(KF_KickDeather, {}, KF_ALL_ID); --ËÀÍöµÄÇ¿ÐÐÌß³öÕ½³¡
		if GetMissionV(KF_MV_BATTLE_JIANGJUN_TAG) == 0 and (nSongScore >= GetMissionV(KF_JIANGJUN_SCORE) or nLiaoScore >= GetMissionV(KF_JIANGJUN_SCORE)) then
			KF_CreateJiangJun(); --½«¾ü³öÏÖ
		end
		if mod(nLoop, 15) == 0 then
			SetMissionV(KF_MV_BATTLE_TEMP_SAFE_POS_INDEX_SONG, random(3));
			SetMissionV(KF_MV_BATTLE_TEMP_SAFE_POS_INDEX_LIAO, random(3));
		end
	end
	--¹ã²¥ÕóÆìÇé¿ö
	if mod(nLoop, 10) == 0 then
		KF_MsgZhenQiState();
	end
end

function kf_state_complete()
	local nLoop = GetMissionV(KF_MV_BATTLE_TIMER_LOOP);
	if nLoop == 0 then
		if GetMissionV(KF_MV_BATTLE_IS_OPEN_SUCC) ~= KF_MISSION_OPEN_FAIL_FLAG then
			KF_KillPaiMing();
		end
		StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
		CloseMission(KF_MISSION_ID);
	else
		SetMissionV(KF_MV_BATTLE_TIMER_LOOP, nLoop-1);
	end;
end