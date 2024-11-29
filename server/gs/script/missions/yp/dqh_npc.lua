--ÖÇ¶á¾­Êé

Include("\\script\\missions\\yp\\award.lua")

tNpcName = {
	{"<color=green>§o¹n Khinh HÇu<color>: ","GÇn ®©y Th©n V­¬ng say mª phËt häc nh­ng s¸ch trong tµng kinh c¸c ®· bŞ mÊt hÕt, ®¹i hiÖp h·y ®Õn chç hai thÕ lùc kh¸c ®Ó m­în.","Lµm phiÒn ®¹i hiÖp ®· thay bæn v­¬ng ®Õn <color=yellow>Quúnh KÕt<color> ®o¹t vÒ 3 quyÓn Kim Cang Kinh.","§¹i hiÖp ®· ®Õn <color=yellow>Quúnh KÕt<color> ®o¹t vÒ 3 quyÓn Kim Cang Kinh ch­a?","Lµm phiÒn ®¹i hiÖp ®· thay bæn v­¬ng ®Õn <color=yellow>H­ng Kh¸nh<color> ®o¹t vÒ 3 quyÓn Kim Cang Kinh.","§¹i hiÖp ®· ®Õn <color=yellow>H­ng Kh¸nh<color> ®o¹t vÒ 3 quyÓn Kim Cang Kinh ch­a?"},
	{"<color=green>§¹t T©y ¤ng T¾c<color>: ","¤i, ba quyÓn kinh th­ quan träng trong Tµng Kinh C¸c cña bæn tù ®· kh«ng c¸nh mµ bay, theo nh­ ®Ö tö cña Thanh Méc Nhai th× rÊt cã thÓ ®· bŞ c¸c thÕ lùc kh¸c lÊy ®i, ®¹i hiÖp cã thÓ gióp ®ì bæn tù viÖc nµy kh«ng?","Lµm phiÒn ®¹i hiÖp thay bÇn t¨ng ®Õn <color=yellow>Thiªn Long Tù<color> ®o¹t vÒ 3 quyÓn Kim Cang Kinh.","§¹i hiÖp ®· ®Õn <color=yellow>Thiªn Long Tù<color> ®o¹t vÒ 3 quyÓn Kim Cang Kinh ch­a?","Lµm phiÒn ®¹i hiÖp thay bÇn t¨ng ®Õn <color=yellow>H­ng Kh¸nh<color> ®o¹t vÒ 3 quyÓn Kim Cang Kinh.","§¹i hiÖp ®· ®Õn <color=yellow>H­ng Kh¸nh<color> ®o¹t vÒ 3 quyÓn Kim Cang Kinh ch­a?"},	
	{"<color=green>Lı §øc Kh¸nh<color>: ","GÇn ®©y Lı t­íng qu©n m­în vµi quyÓn kinh th­ xem, kh«ng ngê bŞ ng­êi kh¸c lµm h­ h¹i. Ha Ha, ®¹i hiÖp cã thÓ gióp ta ®Õn chç hai thÕ lùc cßn l¹i ®Ó trém kh«ng? T¹i h¹ v« cïng c¶m kİch!","Lµm phiÒn ®¹i hiÖp thay ta ®Õn <color=yellow>Thiªn Long Tù<color> ®o¹t vÒ 3 quyÓn Kim Cang Kinh.","§¹i hiÖp ®· ®Õn <color=yellow>Thiªn Long Tù<color> ®o¹t vÒ 3 quyÓn Kim Cang Kinh ch­a?","Lµm phiÒn ®¹i hiÖp thay ta ®Õn <color=yellow>Quúnh KÕt<color> ®o¹t vÒ 3 quyÓn Kim Cang Kinh.","§¹i hiÖp ®· ®Õn <color=yellow>Quúnh KÕt<color> ®o¹t vÒ 3 quyÓn Kim Cang Kinh ch­a?"},
};

function main()
	local nMapID = GetWorldPos()
	local nType = 0;
	for i = 1, getn(tMainMapID) do
		if tMainMapID[i][1] == nMapID then
			nType = i;
			break;
		end
	end
	if nType == 0 then
		return 0;
	end
	local g_NpcName = tNpcName[nType][1];
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 or tMainMapID[nCamp][1] ~= nMapID then
		Talk(1,"",g_NpcName.."Ta gióp ®­îc g× cho ®¹i hiÖp?");
		return 0;
	end
	local strtab = {
		"Trİ ®o¹t kinh th­ (Tiªu hao 10 ®iÓm tinh lùc)/#dqh_talk_1("..nType..")",
		"Giíi thiÖu chi tiÕt/#dqh_talk_2("..nType..")",
		"Kh«ng cã viÖc g×!/nothing",
	}
	Say(g_NpcName..tNpcName[nType][2],
		getn(strtab),
		strtab)
end

function dqh_talk_1(nType)
	local g_NpcName = tNpcName[nType][1];
	local nState = GetTask(TASK_FIELD_PVP_STEAL_BOOK);
	local tMapType = {
		[1] = {6100,6200},
		[2] = {6000,6200},
		[3] = {6000,6100},
	};
	if nState ~= 0 then
		if gf_Judge_Room_Weight(3,30,"") ~= 1 then
			return 0;
		end
		local nCount = BigGetItemCount(tPVPItemInfo[4][2],tPVPItemInfo[4][3],tPVPItemInfo[4][4]);
		if nCount >= 3 then		
			if BigDelItem(tPVPItemInfo[4][2],tPVPItemInfo[4][3],tPVPItemInfo[4][4],nCount) == 1 then
				yp_aw_giveAward_6();
				SetTask(TASK_FIELD_PVP_STEAL_STEP,0);
				SetTask(TASK_FIELD_PVP_STEAL_BOOK,0);
				SetTask(TASK_FIELD_PVP_STEAL_MAP,0);
				SetTask(TASK_FIELD_PVP_STEALED,0);
				Talk(1,"",g_NpcName.."§a t¹ ®¹i hiÖp! §©y lµ quµ tÆng, h·y nhËn lÊy!");
			end
		else
			local nGoMap = GetTask(TASK_FIELD_PVP_STEAL_MAP);
			local nRandType = 0;
			if nGoMap == 0 then 
				nRandType = random(1,2);
				SetTask(TASK_FIELD_PVP_STEAL_MAP,tMapType[nType][nRandType]);			
			else
				for i = 1,getn(tMapType[nType]) do
					if tMapType[nType][i] == nGoMap then
						nRandType = i;
						break;
					end
				end
			end
			Say(g_NpcName..tNpcName[nType][(nRandType-1)*2+4],
				3,
				"\nHoµn thµnh nhiÖm vô [Trİ ®o¹t kinh th­]/#dqh_talk_1_2("..nType..")",
				"\nHñy bá nhiÖm vô [Trİ ®o¹t kinh th­]/#dqh_talk_1_1("..nType..")",
				"\nKÕt thóc ®èi tho¹i/nothing");
		end
	else
		local nJlz = yp_getValue(3);
		if nJlz < 10 then
			Talk(1,"",g_NpcName.."§iÓm tinh lùc cña ®¹i hiÖp kh«ng ®ñ!");
			return 0;
		end
		yp_setValue(3,-10);
		local tNum = floyd_rm4n(9,3); --9Ñ¡3
		local nRand = 0;
		local strNum = "";
		for i = 1,3 do
			gf_SetTaskBit(TASK_FIELD_PVP_STEAL_BOOK,tNum[i],1);
--			strNum = strNum..tostring(tNum[i]);
		end
--		Msg2Player(strNum)
		local nRandType = random(1,2);
		SetTask(TASK_FIELD_PVP_STEAL_MAP,tMapType[nType][nRandType]);
		Talk(1,"",g_NpcName..tNpcName[nType][(nRandType-1)*2+3]);
	end
end

function dqh_talk_1_2(nType)
	local g_NpcName = tNpcName[nType][1];
	local nCount = GetItemCount(tPVPItemInfo[4][2],tPVPItemInfo[4][3],tPVPItemInfo[4][4]);
	if nCount >= 3 then
		dqh_talk_1(nType);
	else
		Talk(1,"",g_NpcName.."§¹i HiÖp ch­a hoµn thµnh nhiÖm!");
	end
end

function dqh_talk_1_1(nType)
	local g_NpcName = tNpcName[nType][1];	
	SetTask(TASK_FIELD_PVP_STEAL_STEP,0);
	SetTask(TASK_FIELD_PVP_STEAL_BOOK,0);
	SetTask(TASK_FIELD_PVP_STEAL_MAP,0);
	SetTask(TASK_FIELD_PVP_STEALED,0);
	local nCount = BigGetItemCount(tPVPItemInfo[4][2],tPVPItemInfo[4][3],tPVPItemInfo[4][4]);
	if nCount ~= 0 then
		BigDelItem(tPVPItemInfo[4][2],tPVPItemInfo[4][3],tPVPItemInfo[4][4],nCount);
	end
	Talk(1,"",g_NpcName.."§· hñy bá nhiÖm vô!");	
end

function dqh_talk_2(nType)
	local g_NpcName = tNpcName[nType][1];
	Talk(1,"main",g_NpcName.."§¹i hiÖp cã thÓ ®Õn ph¹m vi cña thÕ lùc kh¸c t×m 9 <color=yellow>Ng­êi TruyÒn §¹o<color> vµo, 9 <color=yellow>Ng­êi TruyÒn §¹o<color> nµy cÊt gi÷ <color=yellow>3<color> Kim Cang Kinh. Chóc ®¹i hiÖp nhanh chãng lÊy vÒ.")
end