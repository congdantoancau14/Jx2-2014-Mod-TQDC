--É±¹Ö
Include("\\script\\online_activites\\201505feedpet\\head.lua")

function on_kill_npc(szName)
	if is_in_activity_date() ~= 1 then
		RemoveTrigger(GetTrigger(1387*2));
		return 0;
	end
	local nMapId,nX,nY = GetWorldPos();
	local tMap = g_tFeedPet.tKillNpc[nMapId]
	if not tMap then
		return 0;
	end
	local nNpcIdx,sMoban,sName = GetTriggeringUnit();
	if tMap[sName] then
		if random(1,100) <=10 then
			AddItem(2,1,30835,1)--¸£´ü
		end
	end
end
