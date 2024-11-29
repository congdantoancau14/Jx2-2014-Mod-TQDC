Include("\\script\\missions\\yp\\yp_head.lua")

function OnDeath(nKillIDX)
	if yp_checkRewardTime() == 0 then
		local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
		if nCamp == 0 then
			nCamp = 5;
		end
		local m = GetWorldPos();		
		SetTempRevPos(tTempRev[nCamp][m][1],tTempRev[nCamp][m][2]*32,tTempRev[nCamp][m][3]*32); --临时重生点
		return 0;
	end	
	local nOldPlayerIDX = PlayerIndex;
	local nCount = BigGetItemCount(tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4]);
	nCount = ceil(nCount/2);
	if nCount > 16 then
		nCount = 16;
	end
	SetTask(TASK_FIELD_PVP_REWARD_DEADNUM,GetTask(TASK_FIELD_PVP_REWARD_DEADNUM)+1);
	BigDelItem(tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4],nCount);
	PlayerIndex = NpcIdx2PIdx(nKillIDX);
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		PlayerIndex = nOldPlayerIDX;
		return 0;
	end
	AddItem(tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4],nCount);
	PlayerIndex = nOldPlayerIDX;
	yp_reborn();	
	return 1;
end

function yp_reborn()
	local nRand = 0;
	if tBzPos[6400] then
		nRand = random(1,getn(tBzPos[6400]));
	end
	SetPos(tBzPos[6400][nRand][1],tBzPos[6400][nRand][2]);
--	RevivePlayer(0);
	RestoreAll();
	ClearColdDown();	--清药效
	CastState("imme_clear_skill_interval",-1,0);	--消除所有技能的冷却时间
--	CastState("state_dispear",0,5*18);            --无敌5秒	
end