HORSE_CARRY = 6000;
nRidingState = 0;
nSavedG = 0;
nSavedD = 0;
nSavedP = 0;
STATE_RIDED = 1
STATE_UNRIDED = 0


szHorseModel = "thiÕt d­¬ng";
--szHorseModel = "L·nh qu©n t­îng binh m·";

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
	{"L¹c §µ","thiÕt d­¬ng"},
	{"GÊu","pet_xiongmao"},
	{"Lõa","thiÕt d­¬ng"},
	{"Hå","háa hå"},
	{"C¸o","ng©n hå"},
	{"Xe","tiªu xa tiªu côc"},
	{"Xa","tiªu xa tiªu côc"},
	{"Dª","thiÕt d­¬ng"},
	{"KiÕm","truy t×nh kiÕm"},
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
	{"Tö Ngäc","truy t×nh kiÕm"},
	{"ThiÕu D­¬ng","truy t×nh kiÕm"},
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
	{"B¹ch D­¬ng","thiÕt d­¬ng"},
	{"Long M·","§¹i long"},
	{"Bß","mao ng­u"},
	{"Thó Mét Sõng",szHorseModel},
	{"Kim Ngäc T­êng","tiÓu ¸p"},
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
		szHorse = szHorseModel;
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
		szHorse = szHorseModel;
	end

	local nIndex = GetFollower();
	KillFollower();
	local nIndex = CreateNpc(szHorse,szItemName,GetWorldPos());
	-- SetNpcScript(nIndex,szScript);
end;

function nothing()
end;