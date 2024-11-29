function OnUse()
	getTargetNpc();
end;

function getThisPos()
	local m,x,y = GetWorldPos();

	local string = format("\n[ %d,%d,%d ]",m,x,y);
	print(string)
	Msg2Player(string);
end;

function getTargetNpc()
	local nNpcIndex = GetTargetNpc()
	local name = GetNpcName(nNpcIndex);
	local m,x,y = GetNpcWorldPos(nNpcIndex);
	local script = GetNpcScript(nNpcIndex);
	
	local string = name..format(" - [ %d,%d,%d ] - ",m,x,y)..script;
	print(string)
	Msg2Player(string);

end