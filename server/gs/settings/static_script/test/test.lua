
--Include("\\script\\lib\\string.lua");
--Include("\\script\\lib\\item.lua");
THIS_FILE = "\\settings\\static_script\\test\\test.lua";


function OnUse()
	Msg2Player("test is called!");
	--printFormattedPos();
	--Msg2Player(telex2tones("Coong cha nhuw nusi thasi sown, Nghixa mej nhuw nuwowsc trong nguoofn chary ra"))
	
	local npc = "V� �ang  m�n nh�n";
	CreateNpc(npc,npc,GetWorldPos())
end;


function printFormattedPos()
	local m,x,y = GetWorldPos();
	print(format("\n[ %d,%d,%d ]",m,x,y))
	Msg2Player(format("\n[ %d,%d,%d ]",m,x,y))
end;
