
--Include("\\script\\lib\\string.lua");
--Include("\\script\\lib\\item.lua");
THIS_FILE = "\\settings\\static_script\\test\\test.lua";


function OnUse()
	Msg2Player("test is called!");
	--printFormattedPos();
	--Msg2Player(telex2tones("Coong cha nhuw nusi thasi sown, Nghixa mej nhuw nuwowsc trong nguoofn chary ra"))
	
	--SendScript2VM("\\script\\online_activites\\2010_11\\activity_01\\head.lua","NT_OnPlayer1stLoginToday()")
	
	--AddItem(2,1,1157,10)
	local m,x,y =GetWorldPos()
	--DropItem(2,1,1157,m,x,y,0,100,10)
	--SetMomentum(10);
	
	-- local npcIndex = CreateNpc("Th� x�m", "Th� x�m", m,x,y)
	-- SetNpcDeathScript(npcIndex,"\\script\\̫��þ�\\npc_death.lua")
	--addChristmasItems()
	
	local tThaiHuRing = {
		[1] = {[1] = {item={{gdp={2,1,469,1}, name = "V�ng Th�i H� B�t Qu�i - C�n"}}}, nRate = 35},
		[2] = {[1] = {item={{gdp={2,1,470,1}, name = "V�ng Th�i H� B�t Qu�i - Kh�n"}}}, nRate = 10},
		[3] = {[1] = {item={{gdp={2,1,471,1}, name = "V�ng Th�i H� B�t Qu�i - Kh�m"}}}, nRate = 10},
		[4] = {[1] = {item={{gdp={2,1,472,1}, name = "V�ng Th�i H� B�t Qu�i - �o�i"}}}, nRate = 10},
		[5] = {[1] = {item={{gdp={2,1,473,1}, name = "V�ng Th�i H� B�t Qu�i - Ly"}}}, nRate = 20},
		[6] = {[1] = {item={{gdp={2,1,474,1}, name = "V�ng Th�i H� B�t Qu�i - Ch�n"}}}, nRate = 8},
		[7] = {[1] = {item={{gdp={2,1,475,1}, name = "V�ng Th�i H� B�t Qu�i - C�n"}}}, nRate = 6},
		[8] = {[1] = {item={{gdp={2,1,476,1}, name = "V�ng Th�i H� B�t Qu�i - T�n"}}}, nRate = 1},
	} 
end;


function printFormattedPos()
	local m,x,y = GetWorldPos();
	print(format("\n[ %d,%d,%d ]",m,x,y))
	Msg2Player(format("\n[ %d,%d,%d ]",m,x,y))
end;

function addChristmasItems()
	local tItems = {
		{"�u�i th�",{2,1,2}},
		{"L�ng th�",{2,9,1}},
		{"L�ng s?i",{2,1,5}},
		{"H�c c�m",{2,2,21}},
		{"Chu sa",{2,2,30}},
		{"H� b� mao",{2,1,155}},
		{"Ch��ng m�c",{2,7,2}},
	}
	for i=1, getn(tItems) do
		local t = tItems[i];
		AddItem(t[2][1],t[2][2],t[2][3],10);
	end
end;