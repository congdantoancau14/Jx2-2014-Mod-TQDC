Include("\\script\\lib\\string.lua");
Include("\\script\\lib\\item.lua");

function OnUse()
	test();
end;

function test()
	CastState("state_stamina_restore_per8f",1,0);
end

function test0()
	
		local str = "Open[[item]]";
		SendScript2Client(str);
		Msg2Player(str);
		--Talk(1,"","ok");
		--PlaySound("\\sound\\sound_i016.wav");
end;


function printFormattedPos()
	local m,x,y = GetWorldPos();
	print(format("\n[ %d,%d,%d ]",m,x,y))
end;
