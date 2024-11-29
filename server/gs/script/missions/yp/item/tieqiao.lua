--Ã˙«¬

Include("\\script\\missions\\yp\\qmy\\head.lua")

function OnUse(nItemIndex)
	local nMapID,nPosX,nPosY = GetWorldPos();
	if nMapID ~= 6300 then
		Talk(1,"","H∑y Æ’n b∂n ÆÂ Th t Lπc Nhai mÌi Æ≠Óc sˆ dÙng XŒng nµy!");
		return 0;
	end
--	local m = this.msPosition:getMapID();
	local tTreasurePos = {};
	for i = 1,10 do
		local n = GetMissionV(i);
		if n ~= 0 then
			tinsert(tTreasurePos,i);
		end
	end
	if getn(tTreasurePos) == 0 then
		if  GetMissionV(tbSLY.mv12) == 2 then
			Talk(1,"","B∂n ÆÂ nµy kh´ng c„ kho b∏u rÂi, h∑y ÆÓi l«n tπo mÌi ti’p theo!");
			return 0;
		else
			SetMissionV(tbSLY.mv12,GetMissionV(tbSLY.mv12)+1);
			local tCopy = new(tBzPos[nMapID]);
			local tCurTreasure = floyd_rm4n(getn(tCopy),10);
			for i = 1,10 do
--				print("tCurTreasure[i]",tCurTreasure[i]);
				SetMissionV(i,tCurTreasure[i]);
			end
			for j = 1,10 do
				local n = GetMissionV(j);
				if n ~= 0 then
					tinsert(tTreasurePos,j);
				end
			end			
		end
	end
	local nDistance = -1;
	local nMv = 0;
	for i = 1,getn(tTreasurePos) do
		local n = GetMissionV(tTreasurePos[i]);
		local k = floor(sqrt((nPosX-tBzPos[nMapID][n][1])^2+(nPosY-tBzPos[nMapID][n][2])^2));
		if nDistance == -1 or nDistance > k then
			nDistance = k;
			nMv = tTreasurePos[i];
		end
	end
	if nDistance >= 0 and nDistance <= 3 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		if DelItem(2,95,927,1) == 1 then
			SetTask(TASK_FIELD_PVP_TIEQIAO_NUM,0);
			SetMissionV(nMv,0);
			local nRand = random(1,100);
			local nType = 0;
			local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
			SetCurrentNpcSFX(nPidxNpc,972,1,0); --Ãÿ–ß
			if nRand <= 50 then
				gf_AddItemEx({tPVPItemInfo[27][2],tPVPItemInfo[27][3],tPVPItemInfo[27][4],1},tPVPItemInfo[27][1]);
				nType = 27;
			elseif nRand <= 80 then
				gf_AddItemEx({tPVPItemInfo[28][2],tPVPItemInfo[28][3],tPVPItemInfo[28][4],1},tPVPItemInfo[28][1]);
				nType = 28;
			elseif nRand <= 99 then
				gf_AddItemEx({tPVPItemInfo[29][2],tPVPItemInfo[29][3],tPVPItemInfo[29][4],1},tPVPItemInfo[29][1]);
				nType = 29;
			else
				gf_AddItemEx({tPVPItemInfo[25][2],tPVPItemInfo[25][3],tPVPItemInfo[25][4],1},tPVPItemInfo[25][1]);
				nType = 25;
				Msg2Global(GetName().."Khi Æµo kho b∏u, nhÀn Æ≠Óc ["..tPVPItemInfo[25][1].."]x1!")
			end
			--Observer:onEvent(OE_FILED_PVP_DATA,{6,tPVPItemInfo[nType][1]});
		end
	else
		SetItemUseLapse(nItemIndex,5*18);	--¿‰»¥ ±º‰£∫5√Î
		Talk(1,"","Kho∂ng c∏ch g«n nh t Æ’n kho b∏u cﬂn <color=yellow>"..nDistance.." b≠Ìc<color>!");
		SetTask(TASK_FIELD_PVP_TIEQIAO_NUM,GetTask(TASK_FIELD_PVP_TIEQIAO_NUM)+1);
		Msg2Player(format("XŒng Æ∑ sˆ dÙng %d l«n, tuÊi th‰: 30 l«n!",GetTask(TASK_FIELD_PVP_TIEQIAO_NUM)));
		if GetTask(TASK_FIELD_PVP_TIEQIAO_NUM) >= 30 then
			if DelItem(2,95,927,1) == 1 then
				SetTask(TASK_FIELD_PVP_TIEQIAO_NUM,0);
				Talk(1,"","XŒng Æ∑ dÔng qu∏ 30 l«n, Æ∑ bﬁ h≠ hπi!");
			end
		end
	end
end