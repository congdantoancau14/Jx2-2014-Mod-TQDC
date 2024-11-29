Include("\\script\\lib\\define.lua")

function main()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= 3 then
		Msg2Player("Ng­êi ch¬i kh«ng thuéc thÕ lùc th× kh«ng thÓ vµo b¶n ®å b¶o vÖ thÕ lùc!");
		SetPos(1549,2740);
		return 0;
	end
	LeaveTeam();
	NewWorld(505,1290,3015);
	SetFightState(1);
end;