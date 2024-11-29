Include("\\script\\lib\\define.lua")

function main()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= 2 then
		Msg2Player("Ng­êi ch¬i kh«ng thuéc thÕ lùc th× kh«ng thÓ vµo b¶n ®å b¶o vÖ thÕ lùc!");
		SetPos(1783,3851);
		return 0;
	end
	LeaveTeam();
	NewWorld(429,1667,2872);
	SetFightState(1);
end