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

function getequipinfo()
	local MaxPutinCount = 1;
	PutinItemBox("L�y v�t ph�m", MaxPutinCount, "B�n mu�n l�y th�ng tin v�t ph�m �� ��t v�o?", THIS_FILE, 1);
end;

function OnPutinCheck(param, idx, genre, detail, particular)
	print("param, idx, genre, detail, particular:",param, idx, genre, detail, particular)
	for i=1, 5 do
		print(GetEquipAttr(idx,i))
	end
	--if GetEquipAttr(idx,2) ~= 11 then
		--Talk(1,"","M�c c��ng h?a kh�ng h�p l�.")
		--return 0
	--end
	
	return 1
end


function OnPutinComplete(param)
	local tbAllowItem = {3034, 3040, 3046, 3052, 3037, 3043, 3049, 3055}
	local nCheck = 0
	local szItem = "C�c v�t ph�m ���c ��i:\n"
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
	
	Talk(1,"","Trao ��i th�nh c�ng, c�c h� h�y ki�m tra b� trang b? m�i.")
end
