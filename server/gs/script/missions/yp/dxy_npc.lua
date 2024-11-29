--±¦²ØµÄÃØÃÜ

Include("\\script\\missions\\yp\\award.lua");

tNpcName = {
	{"<color=green>§o¹n T©m Di<color>: ","Trªn ng­êi mËt th¸m cña Thiªn ¢m Gi¸o võa b¾t ®­îc, chóng t«i ph¸t hiÖn ®­îc b¶n ®å chØ n¬i ch«n kho b¸u, quèc khè cña bæn téc ®ang trèng rçng, ®¹i hiÖp cã thÓ ®­a ta ®Õn ®ã kh«ng?","§¹i hiÖp h·y mang theo Tµng B¶o §å ®Õn <color=yellow>Quúnh KÕt hoÆc H­ng Kh¸nh<color>, xem thö cã t×m ®­îc g× kh«ng!","§¹i hiÖp cã t×m ®­îc vËt phÈm quý ë <color=yellow>Quúnh KÕt hoÆc H­ng Kh¸nh<color> kh«ng?"},
	{"<color=green>§¹t T©y ¤ng T¾c<color>: ","Trªn ng­êi mËt th¸m cña Thiªn ¢m Gi¸o võa b¾t ®­îc, chóng t«i ph¸t hiÖn ®­îc b¶n ®å chØ n¬i ch«n kho b¸u, quèc khè cña bæn téc ®ang trèng rçng, ®¹i hiÖp cã thÓ ®­a bÇn t¨ng ®Õn ®ã kh«ng?","§¹i hiÖp h·y mang theo Tµng B¶o §å ®Õn <color=yellow>H­ng Kh¸nh hoÆc Thiªn Long Tù<color>, xem thö cã t×m ®­îc g× kh«ng!","§¹i hiÖp cã t×m ®­îc vËt phÈm quý ë <color=yellow>H­ng Kh¸nh hoÆc Thiªn Long Tù<color> kh«ng?"},	
	{"<color=green>Lý §øc Kh¸nh<color>: ","Trªn ng­êi mËt th¸m cña Thiªn ¢m Gi¸o võa b¾t ®­îc, chóng t«i ph¸t hiÖn ®­îc b¶n ®å chØ n¬i ch«n kho b¸u, quèc khè cña bæn téc ®ang trèng rçng, ®¹i hiÖp cã thÓ ®­a bæn t­íng qu©n ®Õn ®ã kh«ng?","§¹i hiÖp h·y mang theo Tµng B¶o §å ®Õn <color=yellow>Quúnh KÕt hoÆc Thiªn Long Tù<color>, xem thö cã t×m ®­îc g× kh«ng!","§¹i hiÖp cã t×m ®­îc vËt phÈm quý ë <color=yellow>Quúnh KÕt hoÆc Thiªn Long Tù<color> kh«ng?"},
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
		"Kho b¸u bÝ mËt (Tiªu hao 10 ®iÓm tinh lùc)/#dxy_talk_1("..nType..")",
		"Giíi thiÖu chi tiÕt/#dxy_talk_2("..nType..")",
		"Kh«ng cã viÖc g×!/nothing",
	}
	Say(g_NpcName..tNpcName[nType][2],
		getn(strtab),
		strtab)
end

function dxy_talk_1(nType)
	local g_NpcName = tNpcName[nType][1];
	local nState = GetTask(TASK_FIELD_PVP_TREASURE);
	if nState == 2 then
--		if DelItem(tPVPItemInfo[4][2],tPVPItemInfo[4][3],tPVPItemInfo[4][4],3) == 1 then
			
			--------------------------
			--¸ø½±Àø
			if yp_aw_giveAward_13() > 0 then
				SetTask(TASK_FIELD_PVP_TREASURE,0);
				Talk(1,"",g_NpcName.."§a t¹ ®¹i hiÖp! §©y lµ quµ tÆng, h·y nhËn lÊy!");
			end
			--------------------------
			
--		else
			
--		end
	elseif nState == 1 then
		Talk(1,"",g_NpcName..tNpcName[nType][4]);
	else
		if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
			return 0;
		end
		local nJlz = yp_getValue(3);
		if nJlz < 10 then
			Talk(1,"",g_NpcName.."§iÓm tinh lùc cña ®¹i hiÖp kh«ng ®ñ!");
			return 0;
		end
		yp_setValue(3,-10);
		SetTask(TASK_FIELD_PVP_TREASURE,1);
		gf_AddItemEx({tPVPItemInfo[8][2],tPVPItemInfo[8][3],tPVPItemInfo[8][4],1},tPVPItemInfo[8][1]);
		Talk(1,"",g_NpcName..tNpcName[nType][3]);
	end
end

function dxy_talk_2(nType)
	local g_NpcName = tNpcName[nType][1];
	Talk(1,"main",g_NpcName.."§¹i hiÖp cã thÓ mang theo Tµng B¶o §å ®Õn khu vùc chØ ®Þnh, c¨n cø theo chØ thÞ cña Tµng B¶o §å ®Ó t×m b¶o ®å kho¶ng c¸ch gÇn nhÊt.\n    Khi ®¹i hiÖp x¸c ®Þnh ®­îc ®Þa ®iÓm, sÏ cã thÓ ®µo kho b¸u.\n    §¹i hiÖp h·y mau ®i t×m kho b¸o ch«n d­íi lßng ®Êt nµo!")
end