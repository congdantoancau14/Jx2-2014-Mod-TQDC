nGoInTime = 0; -- l­u thêi gian tiª'n vµo d×ch tr¹m

function main()

	local nGoInFlag = GetTask(TSK_GOIN)
	if nGoInFlag ~= 1 then
		Say("Kh¸ch quan muèn t×m chç nghØ ch©n sao?",3,
		"§óng vËy/gotoYiZhan",
		"Ta muèn tham quan d×ch tr¹m/canquan",
		"Ta chØ ghe' ngang th«i/nothing")
	else
		Say("Kh¸ch quan muèn rêi ®i sao?",2,
		"§óng vËy, ta co' viÖc cÇn ra ngoµi/leaveYiZhan",
		"Kh«ng ph¶i. Ta vÉn muèn tham quan thªm/nothing")
	end
end;

function leaveYiZhan()
	SetTask(TSK_GOIN, 0);
	NewWorld(100,1472,2865)
end;

function gotoYiZhan()
	--NewWorld(7102,1500,3000)
	if not NewWorld(803,1500,3000) then
		NewWorld(6009,1500,3000)
	end
end;

function canquan()
	nGoInTime = GetTime()
	SetTask(TSK_GOIN, 1);
	NewWorld(100,1474,2861)
end;

function nothing()
end;