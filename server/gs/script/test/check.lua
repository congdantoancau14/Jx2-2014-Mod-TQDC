function OnUse()
	local nNpcIndex = GetTargetNpc()
	local name = GetNpcName(nNpcIndex);
	local m,x,y = GetNpcWorldPos(nNpcIndex);
	local script = GetNpcScript(nNpcIndex);
	
	print(format("\n[ %d,%d,%d ]",m,x,y),script)
end;