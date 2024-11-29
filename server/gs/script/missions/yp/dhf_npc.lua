--¶ÎÇáÈË

Include("\\script\\missions\\yp\\award.lua")

tNpcName = {
	{"<color=green>§oµn Hßa Phong<color>: ","Phô v­¬ng b¶o ta chuÈn bÞ cña håi m«n, nh­ng chiÕn sù liªn miªn, quèc khè trèng rçng th× lµm sao cßn lôa lµ gÊm vãc!"},
	{"<color=green>§« Tïng C¸t Ngâa<color>: ","A di ®µ phËt! C¸m ¬n c¸c vÞ, sè da nµy sÏ do bæn tù qu¶n lý gióp, thiÖn tai! ThiÖn tai!"},
	{"<color=green>Lý KÕ Minh<color>: ","Ha ha, bän khèn Thiªn ¢m Gi¸o, h·y tr¶ ch©u b¸u l¹i cho l·o tö!"},	
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
	yp_clearPlayerData();
	local strtab = {
		"NhËn phÇn th­ëng ®é cèng hiÕn (Mçi tuÇn chØ ®­îc nhËn 1 lÇn)/#dhf_talk_1("..nType..")",
		"T×m hiÓu vÒ ®é cèng hiÕn/#dhf_talk_2("..nType..")",
		"Kh«ng cã viÖc g×!/nothing",
	}
	Say(g_NpcName..tNpcName[nType][2].."§é cèng hiÕn hiÖn t¹i: <color=yellow>"..GetTask(TASK_FIELD_PVP_GXD).."<color>.",
		getn(strtab),
		strtab)
end

function dhf_talk_1(nType)
	local g_NpcName = tNpcName[nType][1];
	if GetTask(TASK_FIELD_PVP_GXD_WARD) ~= 0 then
		Talk(1,"",g_NpcName.."TuÇn nµy ®· nhËn råi, tuÇn sau h·y quay l¹i!");
		return 0;
	end
	local nNum = GetTask(TASK_FIELD_PVP_GXD);
	if nNum < 900 then
		Talk(1,"",g_NpcName.."§é cèng hiÕn tuÇn nµy cña ®¹i hiÖp kh«ng ®ñ ®Ó nhËn th­ëng, h·y tiÕp tôc cè g¾ng!");
		return 0;
	end
	if gf_Judge_Room_Weight(4,30,"") ~= 1 then
		return 0;
	end
	yp_aw_giveAward_18(nNum);	
end

function dhf_talk_2(nType)
	local g_NpcName = tNpcName[nType][1];
	Talk(1,"main",g_NpcName.."§é cèng hiÕn dïng ®Ó ®o l­êng møc ®é cèng hiÕn trong tuÇn ®èi víi thÕ lùc, chÝ cã thÓ giao nép vËt phÈm cÇn thu thËp t­¬ng øng cña thÕ lùc ®Ó n©ng cao.\n    ");
end