--Include("\\script\\lib\\string.lua");
--Include("\\script\\lib\\item.lua");

function OnUse()
	--Msg2Player("test is called!");
	printFormattedPos()
end;


function test()
	
end;

function test2()
	print(strlower("HIGOFDHIOGF"));
	print(strupper("fdhsiogifgf"));
end;

function test1()

local tSwordModels = {
	{"B�n X�"},
	{"T� �i�n"},
	{"�o�n th�y"},
	{"Tri�u D��ng ki�m"},
	{"Th�ch Duy�n ki�m"},
	{"�� H�n ki�m"},
	{"Hi�n Vi�n ki�m"},
	{"Truy T�nh ki�m"},
	{"T�ng S�t"},
}

	local m,x,y = GetWorldPos();
	--local model = "T�ng S�t"
	--CreateNpc(model,model,m,x,y);
	
	for i=1, getn(tSwordModels) do
		local x2 = x+i;
		CreateNpc(tSwordModels[i][1],tSwordModels[i][1],m,x,y);
	end

	--SummonNpc(model,model);
	--Msg2Player(GetWorldPos());
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
	Msg2Player(format("\n[ %d,%d,%d ]",m,x,y))
end;
