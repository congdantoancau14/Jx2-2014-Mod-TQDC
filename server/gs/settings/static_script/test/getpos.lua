Include("\\script\\lib\\string.lua");
Include("\\script\\lib\\item.lua");

function OnUse()
	printFormattedPos();
end;

function printFormattedPos()
	local m,x,y = GetWorldPos();
	print(format("\n[ %d,%d,%d ]",m,x,y))
end;
