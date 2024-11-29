Include("\\script\\online\\eating\\eating_head.lua")

function main()
	ET_OnTimerReset()
	if 	check_ate() == 0 then 
		print("\ncheck_ate = 0");
		ET_AddTitle(ET_TitleTable[1][2],ET_TitleTable[1][3])
	end
	if check_drunk() == 0 then
		print("check_drunk = 0");
		ET_AddTitle(ET_TitleTable[2][2],ET_TitleTable[2][3])
	end;
	if check_slept() == 0 then
		print("check_slept = 0");
		ET_AddTitle(ET_TitleTable[3][2],ET_TitleTable[3][3])
	end;
end;
