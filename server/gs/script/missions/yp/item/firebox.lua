--Ê¥Îï
Include("\\script\\missions\\yp\\award.lua")

function main()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local m = GetWorldPos();
	if tMainMapID[nCamp] == nil or tMainMapID[nCamp][1] ~= m then
		Talk(1,"","ChØ cã ng­êi ch¬i thuéc thÕ lùc míi cã thÓ nhÆt th¸nh vËt nµy!");
		return 0;
	end 
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	SetTask(TASK_FIELD_PVP_FIREBOX_NUM,GetTask(TASK_FIELD_PVP_FIREBOX_NUM)+1);
	local nNum = GetTask(TASK_FIELD_PVP_FIREBOX_NUM);
	if nNum >= 250 then
		WriteLog(format("[NhËt ký] [Type: Th¸nh vËt pvp d· ngo¹i] [Role:%s (acc:%s)] [event: Sè lÇn nhÆt %d lÇn.]", GetName(),GetAccount(),nNum));
	end
	if nNum > 810 then
		Talk(1,"","§«i mÆt cña kiÕm ®ång A L­îng ®ang nh×n ch¨m chó vµo ng­¬i, lµm nhiÒu viÖc bÊt nghÜa tøc lµ tù s¸t!");
		return 0;
	end
	local nNpcIdx = GetTargetNpc();
	SetNpcLifeTime(nNpcIdx,0);
	SetNpcScript(nNpcIdx,"");
	yp_aw_giveAward_1();
end