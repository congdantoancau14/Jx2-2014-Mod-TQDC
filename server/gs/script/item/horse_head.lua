HORSE_CARRY = 6000;
nRidingState = 0;
nSavedG = 0;
nSavedD = 0;
nSavedP = 0;
STATE_RIDED = 1
STATE_UNRIDED = 0


szHorseModel = "Meng Meng";
--szHorseModel = "L·nh qu©n t­îng binh m·";
tHorseModels = {
	{"Blankly"}, -- ®en
	{"Tread swallow"}, -- ®á
	{"Hong xu"},	-- tr¾ng
	{"Qing Feng"},	-- x¸m
	{"Meng Meng"},	-- n©u
	{"Ben Cloud"},	-- vµng
}

tSwordModels = {
	{"Bµn Xµ"},		-- N©u
	{"Tö §iÖn"},	-- t?m
	{"§o¹n thñy"},	--	chµm (tr¾ng)
	{"TriÒu D­¬ng kiÕm"},	-- lam
	{"Th¹ch DuyÖn kiÕm"},	-- x?ch ®á
	{"§é Hån kiÕm"},		-- x¸m xanh
	{"Hiªn Viªn kiÕm"},		-- cam
	{"Truy T×nh kiÕm"},		-- vµng
	{"Tµng S¸t"},			-- n©u xanh ®á
}



tHorses = {
	{"KiÖu Hoa","kiÖu"},
	{"Niªn thó","niªn thó to lín"},
	{"Léc","thiÕt d­¬ng"},
	{"Ng­u","mao ng­u"},
	{"Hæ Tr¾ng","§¹i hæ"},
	{"Hæ §en","§¹i hæ"},
	{"Hæ V»n","§¹i hæ"},
	{"Hæ Vµng","hoµng hæ v­¬ng"},
	{"S­ Tö","háa kú l©n1"},
	{"L¹c §µ","L¹c §µ 1"},
	{"GÊu","pet_xiongmao"},
	{"Lõa Kh¨n §á",tHorseModels[2][1]},
	{"Lõa Kh¨n Vµng",tHorseModels[6][1]},
	{"Lõa Kh¨n Lam",tHorseModels[4][1]},
	{"Lõa Kh¨n Xanh",tHorseModels[5][1]},
	{"Hå","háa hå"},
	{"C¸o","ng©n hå"},
	{"Xe","tiªu xa tiªu côc"},
	{"Xa","tiªu xa tiªu côc"},
	{"Dª","thiÕt d­¬ng"},
	
	{"B¹ch Anh","b¸t hïng"},
	{"B¹ch Hoa","b¸t hïng"},
	{"B¹ch Hång","b¸t hïng"},
	{"B¹ch Khuª","b¸t hïng"},
	{"H¹c","tiÓu ¸p"},
	{"Nghª","trÊn mé thó"},
	{"B¸ch ChiÕn","trÊn mé thó"},
	{"Lang","sãi ®iªn"},
	{"Tª","cæ d­¬ng thó"},
	{"T¬ Vµng","thá mËp"},
	{"ThiÕu D­¬ng ThÊt",tSwordModels[4][1]},
	{"V¨n Sö ThÊt",tSwordModels[1][1]},
	{"C«n H­ Ngäc",tSwordModels[9][1]},
	{"Th¸i Thanh V«",tSwordModels[8][1]},
	{"Tö Ngäc tr­êng",tSwordModels[2][1]},
	{"Gi¸ng V©n XÝch",tSwordModels[5][1]},
	{"B¹ch Lé Song",tSwordModels[3][1]},
	{"BÝch Yªn KiÕm",tSwordModels[6][1]},
	{"Long T­êng KiÕm",tSwordModels[8][1]},
	{"Hång Quang KiÕm",tSwordModels[7][1]},
	{"Phong S­¬ng KiÕm",tSwordModels[4][1]},
	{"KiÕm",tSwordModels[random(getn(tSwordModels))][1]},
	{"ThuyÒn","tiªu tÇn"},
	{"Kú l©n","niªn thó to lín"},
	{" Kú L©n","háa kú l©n1"},
	{"Móa L©n","Wushi_Fight"},
	{"D­¬ng Thó","cæ d­¬ng thó"},
	{"Mao Ng­u","mao ng­u"},
	{"B¹ch Hæ","§¹i hæ"},
	{"Hoµng Hæ","hoµng hæ v­¬ng"},
	{"H¾c Hæ","§¹i hæ"},
	{"B¸o Tr¾ng","§¹i hæ"},
	{"B¸o §en","§¹i hæ"},
	{"B¸o Vµng","hoµng hæ v­¬ng"},
	{"§éc Gi¸c Thó","cæ d­¬ng thó"},
	{"T­îng","d· mao t­îng"},
	{"Voi","d· mao t­îng"},
	{"Thè","thá mËp"},
	{"Thá ®en","thá ®en"},
	{"Thá","thá mËp"},
	{"L©n S­","Wushi_Fight"},
	{"ThÇn Thó TÞch Tµ","TYT_HBixie"},
	{"Hoa","kiÕm ®µi"},
	{"DiÒu","diÒu xanh"},
	{"Kim Gi¸p H¾c S¬n","thiÕt d­¬ng"},
	{"B¹ch D­¬ng","L¹c §µ 1"},
	--{"Long M·","§¹i long"},
	{"Long M·","Ngùa bay"},
	{"Bß","mao ng­u"},
	{"Thó Mét Sõng","Hong xu"},
	{"Kim Ngäc T­êng","tiÓu ¸p"},
	{"TuyÕt Ng©n T­êng","tiÓu ¸p"},
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
		"Th¶ ngùa ®i!/askReleaseHorse",
		"Tho¸t/nothing",
	}
	Say("",getn(tbSay),tbSay);
end;

function askReleaseHorse()
	if GetFightState() == 0 then
		Talk(1,"","<color=red>Quan phñ cÊm th¶ ngùa trong thµnh!<color>");
	else
		Say("Th¶ ®i rÊt khã t×m b¾t l¹i!",2,"VÉn th¶/confirmed_release","Kh«ng th¶/nothing");
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
			Talk(1,"","H·y c­ìi lªn ngùa tr­íc råi nh¶y xuèng ®Ó th¶ ngùa ®i");
			return 0;
		end
		local nCount = GetItemCount(nSavedG, nSavedD, nSavedP);
		if nCount == 0 then 
			Talk(1,"",format("Kh«ng cã m· bµi (item thó c­ìi) %s trong hµnh trang",szSaveHorseName));
			return 0;
		end
		local nDel = DelItem(nSavedG, nSavedD, nSavedP, 1);
		if nDel == 1 then 
			local index = search(szSaveHorseName);
			releaseHorse(index,szSaveHorseName);
		end
	else
		Talk(1,"",format("H·y nh¶y xuèng khái <color=yellow>%s<color> tr­íc vµ gì h¼n nã ra ®Ó th¶ nã ®i",szItemName));
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