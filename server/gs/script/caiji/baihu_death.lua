function main()
	local nCurNpcIndex = GetTargetNpc()
	local m,x,y = GetNpcWorldPos(nCurNpcIndex)
	local nNpcIdx = CreateNpc("Da b¹ch hæ","Da b¹ch hæ",m,x,y);
	SetNpcScript(nNpcIdx,"\\script\\caiji\\Ò»À¦°×»¢Ö®Æ¤.lua");
end;