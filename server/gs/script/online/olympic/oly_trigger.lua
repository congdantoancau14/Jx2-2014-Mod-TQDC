Include("\\script\\online\\olympic\\oly_head.lua")

function DropYellowSH()
	AddItem(Flame_Table[2][1],Flame_Table[2][2],Flame_Table[2][3],1);
	Msg2Player(format("B¹n nhËn ®­îc %s", Flame_Table[2][5]))
end

function YoulingEvent()
	if gf_GetTaskByte(VET_OLY_TASK4, 1) >= 5 then
		return 0;
	end
	if GetTaskTemp(TMP_TASK_ID_OLY_MHGL_TEMP_INDEX) ~= 0 then
		return 0;
	end
	local npcIndex = CreateNpc("minghuoguiling","Minh Háa Quû Linh",GetWorldPos());
	SetNpcDeathScript(npcIndex,"\\script\\online\\olympic\\npc\\minghuoguiling.lua");
	SetTaskTemp(TMP_TASK_ID_OLY_MHGL_TEMP_INDEX,npcIndex);
	SetNpcLifeTime(npcIndex,60 * 5);

end

function CaijiYaorencao()
--	if GetTaskTemp(TMP_TASK_ID_OLY_YMH_TEMP_INDEX) ~= 0 then
--		return 0;
--	end
	local npcIndex = CreateNpc("D­îc Nh©n Th¶o","U Minh Hoa",GetWorldPos());
	SetNpcDeathScript(npcIndex,"\\script\\online\\olympic\\npc\\youminghua.lua");
	SetTaskTemp(TMP_TASK_ID_OLY_YMH_TEMP_INDEX,npcIndex);
	SetNpcLifeTime(npcIndex,60 * 5);
end

TRIGGER_TABLE = {
	{DropYellowSH,10},
	{YoulingEvent,2},
	{CaijiYaorencao,10},
	{nothing,78},
}

function OLY_Trigger()
	if oly_IsActivityOpen() ~= 1 then
		RemoveTrigger(GetTrigger(1276*2));
		return 0;
	end
	local nMapId,nX,nY = GetWorldPos();
	if nMapId ~= 328 and nMapId ~= 329 then
		return 0;
	end
	local nNpcIdx,sMoban,sName = GetTriggeringUnit();
	if sName == "TiÓu Lam §ao Quû" or sName == "TiÓu Lam Xoa Quû" or sName == "HuyÕt C« L©u" then
		local nRand = gf_GetRandItemByTable(TRIGGER_TABLE,100,1);
		TRIGGER_TABLE[nRand][1]();
	end
end
