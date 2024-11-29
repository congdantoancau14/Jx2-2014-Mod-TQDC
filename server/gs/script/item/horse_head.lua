HORSE_CARRY = 6000;
nState = 0;
nSavedG = 0;
nSavedD = 0;
nSavedP = 0;

tHorses = {
	{"Ki�u Hoa","ki�u"},
	{"Ni�n Th�","ni�n th� to l�n"},
	{"L�c","thi�t d��ng"},
	{"Ng�u","mao ng�u"},
	{"H� Tr�ng","��i h�"},
	{"H� �en","��i h�"},
	{"H� V�n","��i h�"},
	{"H� V�ng","ho�ng h� v��ng"},
	{"S� T�","h�a k� l�n1"},
	{"L�c ��","thi�t d��ng"},
	{"G�u","pet_xiongmao"},
	{"L�a","thi�t d��ng"},
	{"H�","h�a h�"},
	{"C�o","ng�n h�"},
	{"Xe","ti�u xa ti�u c�c"},
	{"Xa","ti�u xa ti�u c�c"},
	{"D�","thi�t d��ng"},
	{"Ki�m","truy t�nh ki�m"},
	{"B�ch Anh","b�t h�ng"},
	{"B�ch Hoa","b�t h�ng"},
	{"B�ch H�ng","b�t h�ng"},
	{"B�ch Khu�","b�t h�ng"},
	{"H�c","ti�u �p"},
	{"Ngh�","tr�n m� th�"},
	{"B�ch Chi�n","tr�n m� th�"},
	{"Lang","s�i �i�n"},
	{"T�","c� d��ng th�"},
	{"T� V�ng","th� m�p"},
	{"T� Ng�c","truy t�nh ki�m"},
	{"Thi�u D��ng","truy t�nh ki�m"},
	{"Thuy�n","ti�u t�n"},
	{"K� l�n","ni�n th� to l�n"},
	{" K� L�n","h�a k� l�n1"},
	{"M�a L�n","Wushi_Fight"},
	{"D��ng Th�","c� d��ng th�"},
	{"Mao Ng�u","mao ng�u"},
	{"B�ch H�","��i h�"},
	{"Ho�ng H�","ho�ng h� v��ng"},
	{"H�c H�","��i h�"},
	{"B�o Tr�ng","��i h�"},
	{"B�o �en","��i h�"},
	{"B�o V�ng","ho�ng h� v��ng"},
	{"��c Gi�c Th�","c� d��ng th�"},
	{"T��ng","d� mao t��ng"},
	{"Voi","d� mao t��ng"},
	{"Th�","th� m�p"},
	{"Th� �en","th� �en"},
	{"Th�","th� m�p"},
	{"L�n S�","Wushi_Fight"},
	{"Th�n Th� T�ch T�","TYT_HBixie"},
	{"Hoa","ki�m ��i"},
	{"Di�u","di�u xanh"},
	{"Kim Gi�p H�c S�n","thi�t d��ng"},
	{"B�ch D��ng","thi�t d��ng"},
	{"Long M�","��i long"},
	{"B�","mao ng�u"},
	{"Th� M�t S�ng","thi�t d��ng"},
}

function getState()
	return nState;
end;

function OnEquipCallBack(nItemIndex, nStateAdd)
	
	if nState < 1 then 
		CastState("state_max_carry_point_add",HORSE_CARRY,-1);
		KillFollower();
		nState = 1;
	end
	
	-- print(nState);
end;

function OnUnEquipCallBack(nItemIndex, nStateAdd)
	
	-- nItemIndex = checkHorse()
	-- print(nItemIndex);
	
	local nG, nD, nP	= GetItemInfoByIndex(nItemIndex);
	
	if nState == 1 then 
		CastState("state_max_carry_point_add",-HORSE_CARRY,-1);
		
		local szItemName = GetItemName(nG, nD, nP);
		local index = search(szItemName);
		summonHorse(index,szItemName);
		nState = nState + nStateAdd;
		
		nSavedG = nG;
		nSavedD = nD;
		nSavedP = nP;
		szSaveHorseName = szItemName;
	elseif nState == 0 then
		KillFollower();
		nState = nState + nStateAdd;
	else
		print("Error: horse_head.lua >> OnUnEquipCallBack get unexpected value");
	end
	
	-- print(nState);
end

function checkHorse()
	local nEquipPos = 10;
	local nEquipIDX					= GetPlayerEquipIndex(nEquipPos);
	local nEquipG, nEquipD, nEquipP	= GetPlayerEquipInfo(nEquipPos);
	local szItemName				= GetItemName(nEquipG, nEquipD, nEquipP);
	return nEquipIDX;
end;

function summonHorse(index,szItemName)
	local szHorse = "";
	if index ~= 0 then 
		szHorse = tHorses[index][2];
	else
		szHorse = "Thi�t d��ng";
	end
	SummonNpc(szHorse,szItemName);
end;

function search(name)
	local index = 0;
	for k,v in tHorses do 
		if strfind(name,v[1]) ~= nil then 
			index = k;
			break;
		end
	end
	return index;
end;

function main_horse_release()
	local tbSay = {
		"Th� ng�a �i!/askReleaseHorse",
		"Tho�t/nothing",
	}
	Say("",getn(tbSay),tbSay);
end;

function askReleaseHorse()
	if GetFightState() == 0 then
		Talk(1,"","<color=red>Quan ph� c�m th� ng�a trong th�nh!<color>");
	else
		Say("Th� �i r�t kh� t�m b�t l�i!",2,"V�n th�/confirmed_release","Kh�ng th�/nothing");
	end
end;

function confirmed_release()
	local nEquipPos = 10;
	local nEquipIDX					= GetPlayerEquipIndex(nEquipPos);
	local nEquipG, nEquipD, nEquipP	= GetPlayerEquipInfo(nEquipPos);
	local szItemName				= GetItemName(nEquipG, nEquipD, nEquipP);
	
	-- print(nState);
	-- print(nEquipG, nEquipD, nEquipP)
	
	if nEquipIDX == 0 then
		if nSavedP == 0 then 
			Talk(1,"","H�y c��i l�n ng�a tr��c r�i nh�y xu�ng �� th� ng�a �i");
			return 0;
		end
		local nCount = GetItemCount(nSavedG, nSavedD, nSavedP);
		if nCount == 0 then 
			Talk(1,"",format("Kh�ng c� m� b�i (item th� c��i) %s trong h�nh trang",szSaveHorseName));
			return 0;
		end
		local nDel = DelItem(nSavedG, nSavedD, nSavedP, 1);
		if nDel == 1 then 
			local index = search(szSaveHorseName);
			releaseHorse(index,szSaveHorseName);
		end
	else
		Talk(1,"",format("H�y nh�y xu�ng kh�i <color=yellow>%s<color> tr��c v� g� h�n n� ra �� th� n� �i",szItemName));
	end
	
	nSavedG = nEquipG;
	nSavedD = nEquipD;
	nSavedP = nEquipP;
	szSaveHorseName = szItemName;
	
end;

function releaseHorse(index,szItemName)
	local szHorse = "";
	if index ~= 0 then 
		szHorse = tHorses[index][2];
	else
		szHorse = "Thi�t d��ng";
	end

	local nIndex = GetFollower();
	KillFollower();
	local nIndex = CreateNpc(szHorse,szItemName,GetWorldPos());
	-- SetNpcScript(nIndex,szScript);
end;

function nothing()
end;