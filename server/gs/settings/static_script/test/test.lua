--Include("\\script\\lib\\string.lua");
--Include("\\script\\lib\\item.lua");
THIS_FILE = "\\settings\\static_script\\test\\test.lua"
Include("\\script\\mod\\expand_box\\expand_box_head.lua");

function OnUse()
	--Msg2Player("test is called!");
end;


function test()
	
end;

function test2()
	print(strlower("HIGOFDHIOGF"));
	print(strupper("fdhsiogifgf"));
end;

function test1()

local tSwordModels = {
	{"Bµn Xµ"},
	{"Tö §iÖn"},
	{"§o¹n thñy"},
	{"TriÒu D­¬ng kiÕm"},
	{"Th¹ch DuyÖn kiÕm"},
	{"§é Hån kiÕm"},
	{"Hiªn Viªn kiÕm"},
	{"Truy T×nh kiÕm"},
	{"Tµng S¸t"},
}

	local m,x,y = GetWorldPos();
	--local model = "Tµng S¸t"
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

function getequipinfo()
	local MaxPutinCount = 1;
	PutinItemBox("LÊy vËt phÈm", MaxPutinCount, "B¹n muèn lÊy th«ng tin vËt phÈm ®· ®Æt vµo?", THIS_FILE, 1);
end;

function OnPutinCheck(param, idx, genre, detail, particular)
	print("param, idx, genre, detail, particular:",param, idx, genre, detail, particular)
	for i=1, 5 do
		print(GetEquipAttr(idx,i))
	end
	--if GetEquipAttr(idx,2) ~= 11 then
		--Talk(1,"","Møc c­êng h?a kh«ng hîp lÖ.")
		--return 0
	--end
	
	return 1
end


function OnPutinComplete(param)
	local tbAllowItem = {3034, 3040, 3046, 3052, 3037, 3043, 3049, 3055}
	local nCheck = 0
	local szItem = "C¸c vËt phÈm ®­îc ®æi:\n"
	local tbChangeList = GetPutinItem();
	for i=1, getn(tbChangeList) do
		if tbChangeList[i][3] == 100 and tbChangeList[i][4] == tbChangeList[1][4] then
			nCheck = nCheck + 1
		elseif tbChangeList[i][3] == 101 and tbChangeList[i][4] == tbChangeList[1][4]  then
			nCheck = nCheck + 10
		elseif tbChangeList[i][3] == 103 and tbChangeList[i][4] == tbChangeList[1][4]  then
			nCheck = nCheck + 100
		end
	end
	
	Talk(1,"","Trao ®æi thµnh c«ng, c¸c h¹ h·y kiÓm tra bé trang b? míi.")
end
