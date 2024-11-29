--Include("\\script\\lib\\string.lua");
--Include("\\script\\lib\\item.lua");

function OnUse()
	Msg2Player("test is called!");
	test();
end;


function test()
	
end;

function test2()
	print(strlower("HIGOFDHIOGF"));
	print(strupper("fdhsiogifgf"));
end;

function test1()
	local m,x,y = GetWorldPos();
	CreateNpc("Ma Ni T¨ng","Ma Ni T¨ng",m,x,y);
	SummonNpc("Cô giµ");
	Msg2Player(GetWorldPos());
end

function test0()
	CastState("state_stamina_restore_per8f",1,0);
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
