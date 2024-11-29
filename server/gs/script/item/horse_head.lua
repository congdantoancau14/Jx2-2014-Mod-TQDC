HORSE_CARRY = 6000;
nRidingState = 0;
nSavedG = 0;
nSavedD = 0;
nSavedP = 0;
STATE_RIDED = 1
STATE_UNRIDED = 0


szHorseModel = "Meng Meng";
--szHorseModel = "L�nh qu�n t��ng binh m�";
tHorseModels = {
	{"Blankly"}, -- �en
	{"Tread swallow"}, -- ��
	{"Hong xu"},	-- tr�ng
	{"Qing Feng"},	-- x�m
	{"Meng Meng"},	-- n�u
	{"Ben Cloud"},	-- v�ng
}

tSwordModels = {
	{"B�n X�"},		-- N�u
	{"T� �i�n"},	-- t?m
	{"�o�n th�y"},	--	ch�m (tr�ng)
	{"Tri�u D��ng ki�m"},	-- lam
	{"Th�ch Duy�n ki�m"},	-- x?ch ��
	{"�� H�n ki�m"},		-- x�m xanh
	{"Hi�n Vi�n ki�m"},		-- cam
	{"Truy T�nh ki�m"},		-- v�ng
	{"T�ng S�t"},			-- n�u xanh ��
}



tHorses = {
	{"Ki�u Hoa","ki�u"},
	{"Ni�n th�","ni�n th� to l�n"},
	{"L�c","thi�t d��ng"},
	{"Ng�u","mao ng�u"},
	{"H� Tr�ng","��i h�"},
	{"H� �en","��i h�"},
	{"H� V�n","��i h�"},
	{"H� V�ng","ho�ng h� v��ng"},
	{"S� T�","h�a k� l�n1"},
	{"L�c ��","L�c �� 1"},
	{"G�u","pet_xiongmao"},
	{"L�a Kh�n ��",tHorseModels[2][1]},
	{"L�a Kh�n V�ng",tHorseModels[6][1]},
	{"L�a Kh�n Lam",tHorseModels[4][1]},
	{"L�a Kh�n Xanh",tHorseModels[5][1]},
	{"H�","h�a h�"},
	{"C�o","ng�n h�"},
	{"Xe","ti�u xa ti�u c�c"},
	{"Xa","ti�u xa ti�u c�c"},
	{"D�","thi�t d��ng"},
	
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
	{"Thi�u D��ng Th�t",tSwordModels[4][1]},
	{"V�n S� Th�t",tSwordModels[1][1]},
	{"C�n H� Ng�c",tSwordModels[9][1]},
	{"Th�i Thanh V�",tSwordModels[8][1]},
	{"T� Ng�c tr��ng",tSwordModels[2][1]},
	{"Gi�ng V�n X�ch",tSwordModels[5][1]},
	{"B�ch L� Song",tSwordModels[3][1]},
	{"B�ch Y�n Ki�m",tSwordModels[6][1]},
	{"Long T��ng Ki�m",tSwordModels[8][1]},
	{"H�ng Quang Ki�m",tSwordModels[7][1]},
	{"Phong S��ng Ki�m",tSwordModels[4][1]},
	{"Ki�m",tSwordModels[random(getn(tSwordModels))][1]},
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
	{"B�ch D��ng","L�c �� 1"},
	--{"Long M�","��i long"},
	{"Long M�","Ng�a bay"},
	{"B�","mao ng�u"},
	{"Th� M�t S�ng","Hong xu"},
	{"Kim Ng�c T��ng","ti�u �p"},
	{"Tuy�t Ng�n T��ng","ti�u �p"},
}

function GetRidingState()
	return nRidingState;
end;

function SetCarry()
	CastState("state_max_carry_point_add",HORSE_CARRY,-1);
end;

function RestoreCarry()
	CastState("state_max_carry_point_add",-HORSE_CARRY,-1);
end;

function OnEquipCallBack(nItemIndex, nRidingStateAdd)
	
	if nRidingState < 1 then 
		SetCarry()
		KillFollower();
		nRidingState = 1;
	end
	
	-- print(nRidingState);
end;

function OnUnEquipCallBack(nItemIndex, nRidingStateAdd)
	
	-- nItemIndex = checkHorse()
	-- print(nItemIndex);
	
	local nG, nD, nP	= GetItemInfoByIndex(nItemIndex);
	
	--print("nRidingState:"..nRidingState);
	if nRidingState == 1 then 
		RestoreCarry()
		
		local szItemName = GetItemName(nG, nD, nP);
		local index = search(szItemName);
		--print("horse_head.lua>>OnUnEquipCallBack:"..index..szItemName);

		summonHorse(index,szItemName);
		nRidingState = nRidingState + nRidingStateAdd;
		
		nSavedG = nG;
		nSavedD = nD;
		nSavedP = nP;
		szSaveHorseName = szItemName;

	elseif nRidingState == 0 then
		KillFollower();
		nRidingState = nRidingState + nRidingStateAdd;
	else
		print("Error: horse_head.lua >> OnUnEquipCallBack get unexpected value");
	end
	
	-- print(nRidingState);
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
		szHorse = tHorseModels[random(getn(tHorseModels))][1];
	end
	--print("horse_head.lua::summonHorse>>szHorse:"..szHorse);
	SummonNpc(szHorse,szItemName);
end;

function search(name)
	local index = 0;
	for k,v in tHorses do 
		if strfind(strlower(name),strlower(v[1])) ~= nil then 
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
	
	-- print(nRidingState);
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
		szHorse = tHorseModels[random(getn(tHorseModels))][1];
	end

	local nIndex = GetFollower();
	KillFollower();
	local nIndex = CreateNpc(szHorse,szItemName,GetWorldPos());
	-- SetNpcScript(nIndex,szScript);
end;

function nothing()
end;