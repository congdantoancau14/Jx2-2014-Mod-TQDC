nGoInTime = 0; -- l�u th�i gian ti�'n v�o d�ch tr�m

function main()

	local nGoInFlag = GetTask(TSK_GOIN)
	if nGoInFlag ~= 1 then
		Say("Kh�ch quan mu�n t�m ch� ngh� ch�n sao?",3,
		"��ng v�y/gotoYiZhan",
		"Ta mu�n tham quan d�ch tr�m/canquan",
		"Ta ch� ghe' ngang th�i/nothing")
	else
		Say("Kh�ch quan mu�n r�i �i sao?",2,
		"��ng v�y, ta co' vi�c c�n ra ngo�i/leaveYiZhan",
		"Kh�ng ph�i. Ta v�n mu�n tham quan th�m/nothing")
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