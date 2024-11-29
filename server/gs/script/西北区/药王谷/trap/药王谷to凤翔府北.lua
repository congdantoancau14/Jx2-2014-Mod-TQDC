--Ò©Íõ¹ÈtoÐËÇì
Include("\\script\\missions\\yp\\mm\\entrynpc.lua")

function main()
	if GetPKValue() >= 10 then
		Msg2Player("Ng­êi ch¬i pk10 kh«ng thÓ vµo H­ng Kh¸nh!");
		return 0;
	end
	if GetTeamSize() ~= 0 then
		Talk(1,"","§¹i hiÖp h·y rêi ®éi råi quay l¹i!");
		return 0;
	end
	enter();
	SetPos(1532,2552);
	SetFightState(1);
end