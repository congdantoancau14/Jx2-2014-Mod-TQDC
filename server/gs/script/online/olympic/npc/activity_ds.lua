--°ÂÔË»î¶¯´óÊ¹
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\settings\\static_script\\global\\regular_clear_task.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 
Include("\\script\\vng\\lib\\vnglib_award.lua") 

tbSay_201207 = {
	"Giíi thiÖu ho¹t ®éng/introduce_201207",
	"GhÐp Ngò S¾c Th¸nh Háa Th¹ch/combining_flame_201207",
	"§o¸n sè tróng Lam S¾c Th¸nh Háa Th¹ch/guess_flame_201207",
	"§Õn Háa Vùc Cöu Ch©u thu thËp Th¸nh Háa Th¹ch/goto_caji_map_201207",
	"§Õn Thiªn S­ BÝ C¶nh thu thËp Th¸nh Háa Th¹ch/goto_tianshimijing",
	"Rót th­ëng H¹nh VËn/oly_lucky_star_201207",
	"§æi Ngò Th¸i Th¸nh Háa sang Ngò S¾c Th¸nh Háa Th¹ch/ExchangeItem",
}

sTitle_201207 = "Chµo mõng phiªn b¶n míi, th¾p s¸ng Th¸nh Háa §µn ®Ó nhËn phÇn th­ëng tèt. Ng­êi ch¬i ®¹t cÊp 80, ®· gia nhËp l­u ph¸i vµ häc hÕt kü n¨ng cÊp 55 cã thÓ tham gia.";

Activity_Ds_Name = "<color=green>§¹i Sø ho¹t ®éng: <color>";

sTitle_201207_1 = "T¹i mçi thµnh ThuyÒn Ch©u (165/192), Thµnh §« (180/179), §¹i Lý ( 231/222), T­¬ng D­¬ng (221/195), Ph­îng T­êng (221/195), BiÖn Kinh ( 183/173) ®Òu cã mét Th¸nh Háa §µn";

function introduce_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	local tbSay = {
		"Nguån gèc vµ chñng lo¹i Th¸nh Háa/source_201207",
		"PhÇn th­ëng vµ sè lÇn sö dông 5 lo¹i Th¸nh Háa ®Ó th¾p s¸ng/danse_award_201207",
		"PhÇn th­ëng vµ sè lÇn sö dông Ngò Th¸i Th¸nh Háa ®Ó th¾p s¸ng/wucai_award_201207",
		"Rót th­ëng H¹nh VËn Tinh mçi ngµy/lucky_star_201207",
		"H»ng ngµy th¾p löa gäi BOSS/lucky_call_boss",
		"\n rót lui/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1,getn(tbSay),tbSay);
end

function source_201207()
	local tbBody = "  \n H¾c S¾c Th¸nh Háa——R¬i ra tõ Boss ¶i L­¬ng S¬n, V¹n KiÕm Tròng;  \n Hoµng S¾c Th¸nh Háa——NhËn ®­îc khi giÕt qu¸i ë Quû M«n Håi Lang;  \n Hång S¾c Th¸nh Háa——R¬i ra tõ Thiªn M«n TrËn;  \n Lôc S¾c Th¸nh Háa——Thu thËp U Minh Hoa ë Quû M«n Håi Lang (cã x¸c suÊt sinh ra khi giÕt chÕt qu¸i vËt);   \n Lam S¾c Th¸nh Háa——NhËn ®­îc khi tham gia ®o¸n sè;  \n Ngò Th¸i Th¸nh Háa——GhÐp ë §¹i Sø ho¹t ®éng hoÆc cã thÓ nhËn ®­îc khi giÕt qu¸i chiªu dô Minh Háa Quû Linh";
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name..tbBody;
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function danse_award_201207()
	local tbBody = format("Sè lÇn: Th¸nh Háa §µn ë mçi thµnh thÞ ®­îc th¾p s¸ng 3 lÇn/ngµy. PhÇn th­ëng:\n   Sè lÇn th¾p s¸ng +1;\n   Sè lÇn th¾p s¸ng trong ngµy cña server +1;\n   exp <color=green>%d<color>;\n   Hép Trang TrÝ Gi¸ng Sinh;\n   hoÆc 1 ®¹o cô ngÉu nhiªn.", OLY_EXP_2);
	local tbSay = {
		"Sè lÇn th¾p s¸ng céng dån cã lîi Ých g× kh«ng?/fire_used_201207",
		"\n trë vÒ tÇng tr­íc/introduce_201207",
		"Tho¸t/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1..tbBody,getn(tbSay),tbSay);
end

function wucai_award_201207()
	local tbBody = format("Sè lÇn: Cã thÓ th¾p s¸ng Th¸nh Háa §µn tèi ®a 2000 lÇn. PhÇn th­ëng:\n   Sè lÇn th¾p s¸ng +1;\n   Sè lÇn th¾p s¸ng trong ngµy cña server +3;\n   exp <color=green>%d<color>;\n   Hép Trang TrÝ Gi¸ng Sinh*3;\n   hoÆc 1 ®¹o cô ngÉu nhiªn.", OLY_EXP_3);
	local tbSay = {
		"Sè lÇn th¾p s¸ng céng dån cã lîi Ých g× kh«ng?/fire_used_201207",
		"\n trë vÒ tÇng tr­íc/introduce_201207",
		"Tho¸t/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1..tbBody,getn(tbSay),tbSay);
end

function fire_used_201207()
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name.."Sè lÇn th¾p s¸ng ®¹t ®Õn c¸c mèc kh¸c nhau sÏ nhËn ®­îc nh÷ng phÇn th­ëng sau:\n";
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function combining_flame_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	local tbSay = {
		"GhÐp b»ng Ngò Th¸i ThÇn Th¹ch (b¸n ë Ngù C¸c)/combining_1_201207",
		--"GhÐp Th¸nh Háa vµ Vµng/combining_2_201207",
		"\n rót lui/nothing",
	}
	Say(Activity_Ds_Name.."C¸c h¹ muèn chän c¸ch thøc nµo ®Ó ghÐp Ngò Th¸i Th¸nh Háa vËy?",getn(tbSay),tbSay);
end

function combining_1_201207()
	local tbSay = {
		format("GhÐp %d Hång S¾c Th¸nh Háa+%d Ngò Th¸i ThÇn Th¹ch/#begin_combining_1(1)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("GhÐp %d Lôc S¾c Th¸nh Háa+%d Ngò Th¸i ThÇn Th¹ch/#begin_combining_1(2)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("GhÐp %d Hoµng S¾c Th¸nh Háa+%d Ngò Th¸i ThÇn Th¹ch/#begin_combining_1(3)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("GhÐp %d Lam S¾c Th¸nh Háa+%d Ngò Th¸i ThÇn Th¹ch/#begin_combining_1(4)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("GhÐp %d H¾c S¾c Th¸nh Háa+%d Ngò Th¸i ThÇn Th¹ch/#begin_combining_1(5)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		"\n trë vÒ tÇng tr­íc/combining_flame_201207",
		"Tho¸t/nothing",
	}
	Say(Activity_Ds_Name.."5 Th¸nh Háa Th¹ch ®¬n s¾c bÊt kú + 1 Ngò S¾c ThÇn Th¹ch (Mua trong Ngù C¸c) = 1 Ngò S¾c Th¸nh Háa Th¹ch",getn(tbSay),tbSay);
end

function combining_2_201207()
	local tbSay = {
		format("GhÐp %d Hång S¾c Th¸nh Háa+%d Vµng/#begin_combining_2(1)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("GhÐp %d Lôc S¾c Th¸nh Háa+%d Vµng/#begin_combining_2(2)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("GhÐp %d Hoµng S¾c Th¸nh Háa+%d Vµng/#begin_combining_2(3)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("GhÐp %d Lam S¾c Th¸nh Háa+%d Vµng /#begin_combining_2(4)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("GhÐp %d H¾c S¾c Th¸nh Háa+%d Vµng/#begin_combining_2(5)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		"\n trë vÒ tÇng tr­íc/combining_flame_201207",
		"Tho¸t/nothing",
	}
	Say(Activity_Ds_Name.."9 Th¸nh Háa Th¹ch ®¬n s¾c bÊt kú + 30 vµng = 1 Ngò S¾c Th¸nh Háa Th¹ch",getn(tbSay),tbSay);
end

function guess_flame_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	local tbBody = "T¹i h¹ ra 1 ch÷ sè (tõ 1-100) ®Ó c¸c h¹ ®o¸n 5 lÇn, sè lÇn ®o¸n tróng cµng Ýt th× phÇn th­ëng cµng lín. Sè lÇn tham gia trß ch¬i mçi ngµy lµ tïy ý, nh­ng chØ ®­îc nhËn th­ëng 3 lÇn.";
	local tbSay = {
		"H·y b¾t ®Çu ®i /oly_begin_guess",
		"NhËn phÇn th­ëng lÇn tr­íc/oly_get_last_guess_award",
		"\n rót lui/nothing",
	}
	Say(Activity_Ds_Name..tbBody,getn(tbSay),tbSay);
end

function lucky_star_201207()
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name.."Sè lÇn th¾p s¸ng ®¹t 6 lÇn/ngµy, sÏ cã thÓ tham gia ho¹t ®éng Rót Th¨m May M¾n:\n   C¸ch thøc: NhËp 1 con sè trong kho¶ng 1-9999;\n   Quy tr×nh nhËn th­ëng: 21:00 h»ng ngµy më th­ëng, tõ 21:00-21:30 ng­êi ch¬i tróng th­ëng ph¶i ®Õn chç cña ta ®Ó ®¨ng ký tróng th­ëng, 10 ng­êi ch¬i ®Çu tiªn ®¨ng ký cã thÓ chia ®Òu phÇn th­ëng. Sau 21:30 cã thÓ nhËn th­ëng, ®Õn 22:00 th× kÕt thóc nhËn th­ëng, qu¸ giê sÏ kh«ng thÓ nhËn.\n   PhÇn th­ëng: Mçi ngµy 50 Thiªn Kiªu LÖnh, trong ngµy kh«ng ai tróng th­ëng (nhËn th­ëng), th× phÇn th­ëng sÏ tÝch lòy cho ®Õn khi cã ng­êi tróng th­ëng hoÆc ho¹t ®éng kÕt thóc.\n   Chó ý: Con sè may m¾n chØ cã hiÖu lùc trong ngµy.";
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function lucky_call_boss()
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name.."Sau khi sè lÇn th¾p s¸ng trong ngµy cña server ®¹t 5000 lÇn, vµo lóc 20:00 ë T©y Thµnh §« sÏ xuÊt hiÖn Phï Thñy B¨ng Gi¸, sau khi tiªu diÖt sÏ r¬i ra nhiÒu phÇn th­ëng. Dïng Th¸nh Háa Th¹ch th­êng ®Ó th¾p s¸ng, sè lÇn th¾p s¸ng +1, nÕu dïng Ngò S¾c Th¸nh Háa Th¹ch ®Ó th¾p s¸ng, sè lÇn th¾p s¸ng +3.";
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function oly_lucky_star_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	CheckAndDoRegularClear(EM_REGULAR_CLEAR_TYPE_DAILY);
	local tbBody = "Sè lÇn th¾p s¸ng ®¹t 6 lÇn/ngµy, sÏ cã thÓ tham gia ho¹t ®éng Rót Th¨m May M¾n.\n    PhÇn th­ëng tÝch lòy hiÖn t¹i lµ: <color=green>%d Thiªn Kiªu LÖnh<color>;\n    Con sè may m¾n h«m nay lµ: <color=green>%s<color>;\n    Con sè may m¾n cña b¹n lµ: <color=green>%d<color>;\n    PhÇn th­ëng: Mçi ngµy 50 Thiªn Kiªu LÖnh, trong ngµy kh«ng ai tróng th­ëng (nhËn th­ëng), th× phÇn th­ëng sÏ tÝch lòy cho ®Õn khi cã ng­êi tróng th­ëng hoÆc ho¹t ®éng kÕt thóc.";
	local tbSay = oly_CreateDlgTable();
	local nTglNum,strNum,nMyluckNum = oly_GetBaseInfo();	
	tinsert(tbSay,"Tho¸t/nothing");
	Say(Activity_Ds_Name..format(tbBody,nTglNum,strNum,nMyluckNum),getn(tbSay),tbSay);
end

function input_luck_num_201207()
	if gf_GetMyTaskByte(VET_OLY_TASK1,2,3) == 0 then
		AskClientForNumber("input_luck_num_cb_201207",1,OLY_MAX_LUCK_NUM,"NhËp ch÷ sè may m¾n cña c¸c h¹");
	end
end

function input_luck_num_cb_201207(nNum)
	local nDayTime = oly_GetDayCurrTime(); --µ±ÌìÊ±¼ä
	if nDayTime >= 0 and nDayTime < OLY_TIME_START then
		gf_SetMyTaskByte(VET_OLY_TASK1,2,3,nNum,TASK_ACCESS_CODE_OLYMPIC);
		Msg2Player(format("Ch÷ sè may m¾n cña c¸c h¹ lµ %d",nNum));
	else
		Msg2Player("B©y giê kh«ng thÓ nhËp ch÷ sè may m¾n , h·y quay l¹i vµo ngµy mai.");
	end
end

function goto_caji_map_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	local tbSay = {
		"§ång ý/sure_201207",
		"Tho¸t/nothing",
	}
	Say(Activity_Ds_Name.."§ång ý ®Õn b¶n ®å thu thËp ®Ó t×m Lôc S¾c Th¸nh Háa Th¹ch?",getn(tbSay),tbSay);
end

function sure_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	if oly_Is_LevelSkill()	~= 1 then
		return 0;
	end
	NewWorld(328,1628,3981);
	SetFightState(1);
end

function goto_tianshimijing()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	local tbSay = {
		"§ång ý/sure_goto_tianshimijing",
		"Ra khái/nothing",
	}
	Say(Activity_Ds_Name.."§ång ý ®Õn b¶n ®å thu thËp ®Ó t×m Lôc S¾c Th¸nh Háa Th¹ch?",getn(tbSay),tbSay);
end

function sure_goto_tianshimijing()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	if oly_Is_LevelSkill()	~= 1 then
		return 0;
	end
	NewWorld(329, 1734, 3428);
	SetFightState(1);
end

--µÇ¼Ç
function register_mylucknum_201207()
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_Rigister");
end

--Áì½±
function get_lucknum_award_201207()
	if gf_GetTaskByte(VET_OLY_TASK1,4) == 0 then
		Talk(1,"","C¸c h¹ ch­a ®¨ng ký kh«ng thÓ nhËn phÇn th­ëng");
	end
	--Áì½±
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckPersonNum");
end

function ExchangeItem()
	nItem = GetItemCount(2,1,30402)
	
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"",Activity_Ds_Name.."Tr¹ng th¸i hiÖn t¹i kh«ng thÓ ®æi vËt phÈm!")
		return
	end	
	
	if gf_Judge_Room_Weight(2, 200) == 0 then
		Talk(1,"", Activity_Ds_Name.."Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
		return 
	end

	if nItem < 1 then
		Talk(1,"",Activity_Ds_Name.."C¸c h¹ kh«ng cã Ngò Th¸i Th¸nh Háa trong ng­êi!")
		return
	end
	
	if DelItem(2,1,30402,nItem) == 1 then
		gf_AddItemEx2({2,1,30753,nItem}, "Ngò Th¸i Th¸nh Háa", "§æi Item Ngò Th¸i Th¸nh Háa", "nhËn")
		Talk(1,"",Activity_Ds_Name.."C¸c h¹ ®· ®æi thµnh c«ng <color=yellow>"..nItem.."<color> Ngò Th¸i Th¸nh Háa sang Ngò S¾c Th¸nh Háa th¹ch")
	end
end