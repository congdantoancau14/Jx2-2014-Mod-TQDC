--toÌìÁúËÂ
Include("\\script\\missions\\yp\\tls\\entrynpc.lua")

function main()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= 1 then
		Msg2Player("Ng­êi ch¬i kh«ng thuéc thÕ lùc kh«ng thÓ vµo Thiªn Long Tù!");
		return 0;
	end
	if GetPKValue() >= 10 then
		Msg2Player("Ng­êi ch¬i pk10 kh«ng thÓ vµo Thiªn Long Tù!");
		return 0;
	end
	if GetTeamSize() ~= 0 then
		Talk(1,"","§¹i hiÖp h·y rêi ®éi råi quay l¹i!");
		return 0;
	end
	enter();
	SetPos(1596,2762);
	SetFightState(0);
end