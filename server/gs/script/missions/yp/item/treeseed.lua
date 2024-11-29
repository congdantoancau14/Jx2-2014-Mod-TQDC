--Ê÷ÖÖ
Include("\\script\\missions\\yp\\yp_head.lua");

function OnUse(nItemIndex)
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then 
		Talk(1,"","CÇn ph¶i gia nhËp thÕ lùc míi ®­îc dïng vËt phÈm nµy!");
		return 0;
	end
	if tMainMapID[nCamp][1] ~= nMapID then
		Talk(1,"","VËt phÈm nµy chØ ®­îc dïng ë b¶n ®å thÕ lùc t­¬ng øng cña ®¹i hiÖp!");
		return 0;
	end
	local nPlantTime = GetTask(TASK_FIELD_PVP_TREE_TIME);
	if nPlantTime ~= 0 and GetTime() - nPlantTime > 150*60 then
		SetTask(TASK_FIELD_PVP_TREE_IDX,0);
		SetTask(TASK_FIELD_PVP_TREE_TIME,0);
		SetTask(TASK_FIELD_PVP_TREE_SHOWTIME,0);
	end
	if GetTask(TASK_FIELD_PVP_TREE_IDX) ~= 0 or (nPlantTime ~= 0 and GetTime() - nPlantTime < 150*60) then
		Talk(1,"","Ng­¬i ®· trång 1 Th¸i H­ Cæ Thô!");
		return 0;
	end
	local tScript = {
		"\\script\\missions\\yp\\tls\\mission.lua",
		"\\script\\missions\\yp\\hss\\mission.lua",
		"\\script\\missions\\yp\\mm\\mission.lua",
	}
	SendScript2VM(tScript[nCamp],"pl_useSeed()");
end