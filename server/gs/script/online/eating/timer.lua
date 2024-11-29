Include("\\script\\online\\eating\\eating_head.lua")

function main()
	ET_OnTimerReset()
	local nTime = tonumber(date("%H"));
	if nTime == 12 or nTime == 0 then
		ET_OnTimerResetSleep()
	end
	if 	check_ate() == 0 then 
		print("\neating>>timer>>check_ate = 0");
		ET_AddTitle(ET_TitleTable[1][2],ET_TitleTable[1][3])
	end
	if check_drunk() == 0 then
		print("eating>>timer>>check_drunk = 0");
		ET_AddTitle(ET_TitleTable[2][2],ET_TitleTable[2][3])
	end;
	if check_slept() == 0 then
		print("eating>>timer>>check_slept = 0");
		ET_AddTitle(ET_TitleTable[3][2],ET_TitleTable[3][3])
	end;
end;
