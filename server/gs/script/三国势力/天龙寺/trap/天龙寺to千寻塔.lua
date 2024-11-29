Include("\\script\\lib\\define.lua")

function main()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= 1 then
		Msg2Player("Ng­êi ch¬i kh«ng thuéc thÕ lùc th× kh«ng thÓ vµo b¶n ®å b¶o vÖ thÕ lùc!");
		SetPos(1522,2842);
		SetFightState(1);
		return 0;
	end
	LeaveTeam();
	NewWorld(409,1550,3247);
	SetFightState(1);
end