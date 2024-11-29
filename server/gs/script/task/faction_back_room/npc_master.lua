--×÷Õß£ºÑÏ¾ü
--´´½¨ÈÕÆÚ£º07Äê11ÔÂ13ÈÕ14:50
--Ê¦¸µ½Å±¾
Include("\\script\\task\\faction_back_room\\back_room_function.lua");
Include("\\script\\task\\faction\\faction_equipment.lua");
g_szThisFile = "\\script\\task\\faction_back_room\\npc_master.lua";	--Ä¬ÈÏÖµ
g_szInforHeader = "";	--Ä¬ÈÏÖµ
g_nBackRoomEntryType = 1;	--Èë¿ÚÀàÐÍ£¬·ÖÁ½ÖÖ¡£1±íÊ¾´ÓÊ¦¸µ´¦½øÈë£¬2±íÊ¾´ÓµÀ¾ß´¦½øÈë

function main()
--	do return end
--	backroom_main();
backroom_main_entry()
end;

function backroom_main()
	do return end
	Talk(1,"backroom_main_entry","    S­ m«n mËt thÊt hiÖn ®· khai më, c¸c ph¸i ®Òu ®· göi triÖu tËp lÖnh, kªu gäi ®Ö tö ®Õn chç TiÕp dÉn s­ m«n ®Ó tiÕn hµnh khiªu chiÕn v­ît ¶i. Cã thÓ nhËn ®­îc trang bÞ s­ m«n 4. VÞ trÝ TiÕp dÉn s­ m«n ë c¸c ph¸i:\n    ThiÕu L©m: HuyÒn Kh«ng (205/204)     §­êng M«n: §­êng T« M¹c (209/183)\n    Nga My: TuÖ V©n S­ Th¸i (214/191) C¸i Bang: Bµng L· Väng (191/200)\n    Vâ §ang: TiÕt V©n Tranh (233/204)   D­¬ng M«n: D­¬ng Diªn Chiªu (192/183)\n    Ngò §éc: C©u S¸ch (196/197)");
end;

g_tbDialog = 
{
	[0] = {[0] = "",[1] = "",[2] = "",[3] = ""},
	[1] = 
		{	--ÉÙÁÖ
			[0] = "<color=green>HuyÒn Kh«ng<color>:",
			[1] = "La H¸n §­êng ®· tu söa xong, thËp b¸t La H¸n ®· quay vÒ. Chóng ®Ö tö cã thÓ vµo trong tu tËp, tham thiÒn, luyÖn vâ.",	
			[2] = "Tõ khi ThiÕu L©m tù ®­îc s¸ng lËp, §¹t Ma viÖn, La H¸n ®­êng ®­îc dùng lªn ®Õn nay, vâ nghÖ ThiÕu L©m b¾t ®Çu danh trÊn thiªn h¹. La H¸n ®­êng lµ n¬i c­ ngô cña c¸c hé tù vâ t¨ng. Hé tù vâ t¨ng ®­îc tuyÓn lùa kh¾t khe tõ c¸c tù viÖn, vâ nghÖ cao th©m, cã tr¸ch nhiÖm canh gi÷ an toµn cho ThiÕu L©m tù. B©y giê viÖc tu söa ®· xong, hä kiªm thªm viÖc ë S­ m«n mËt thÊt, gióp chóng ®Ö tö rÌn luyÖn vâ nghÖ.",
			[3] = "MËt thÊt cña bæn ph¸i lµ La H¸n ®­êng, chØ cho phÐp ®Ö tö bæn ph¸i vµo trong tu luyÖn. Trong ®­êng cã rÊt nhiÒu cao thñ, cÇn ph¶i hÕt søc cÈn thËn ®ã!",
		},	
	[2] = 
		{	--Îäµ±
			[0] = "<color=green>TiÕt V©n Tranh<color>:",
			[1] = "MËt thÊt cña bæn ph¸i lµ HuyÒn Vò Phong, chØ cho phÐp ®Ö tö cña bæn ph¸i vµo, chØ cÇn thi triÓn ThÕ V©n Tung th× cã thÓ lªn nói tu luyÖn.",	
			[2] = "Trong b¶y m­¬i hai ®Ønh nói ë Vâ §ang s¬n, chØ cã HuyÒn Vò Phong m©y phñ tø bÒ, ®Ñp nh­ tiªn c¶nh. Cã rÊt nhiÒu cao sü trong ph¸i l¸nh xa câi ®êi tôc luþ, Èn th©n tu luyÖn t¹i HuyÒn Vò Phong, ©m thÇm b¶o vÖ an toµn cho t«ng ph¸i. NÕu c¸c ®Ö tö cã g× ch­a râ trong lóc luyÖn vâ, hoÆc muèn kiÓm tra thùc lùc cña m×nh, ®Òu cã thÓ ®Õn HuyÒn Vò Phong thö mét phen.",
			[3] = "HuyÒn Vò Phong thanh tÞnh yªn b×nh, Èn hiÖn trong m©y, lµ n¬i c¸c ch©n nh©n trong ph¸i l¸nh ®êi luyÖn vâ, chóng ®Ö tö cã thÓ ®Õn ®Ó nhËn chØ gi¸o!",
		},	
	[3] = 
		{	--¶ëáÒ
			[0] = "<color=green>TuÖ V©n S­ Th¸i<color>:",
			[1] = "S­ m«n mËt thÊt cña bæn ph¸i ë V« T­íng Gian, chØ cã ®Ö tö bæn ph¸i míi ®­îc phÐp ®Õn ®ã ®Ó nhËn chØ gi¸o cña tiÒn bèi.",	
			[2] = "PhËt ph¸p rêi xa thËp t­íng, kh«ng ng· t­íng, kh«ng chóng sinh t­íng, ®ã gäi lµ v« t­íng. V« T­íng Gian ®· ®­îc kiÕn t¹o tõ lóc bæn ph¸i khai s¬n lËp ph¸i. Ph¸i ta nhËp PhËt ®¹o, ®· tõng gÆp biÕt bao nhiªu th¨ng trÇm, cho nªn vâ c«ng cña Nga My ph¸i ngoµi viÖc c­êng th©n hé thÓ, cßn dïng ®Ó cøu nh©n ®é thÕ. Trong V« T­íng Gian cã rÊt nhiÒu tiÒn bèi cña bæn ph¸i, lµ nh÷ng ng­êi tµi n¨ng xuÊt chóng trong s­ m«n, chóng ®Ö tö cã thÓ ®Õn ®ã tham thiÒn ngé PhËt, tu luyÖn vâ nghÖ.",
			[3] = "V« T­íng Gian lµ n¬i tu luyÖn cña c¸c bËc tiÒn bèi trong ph¸i, chóng ®Ö tö cã thÓ ®Õn ®ã ®Ó nhËn kh¶o nghiÖm, kiÓm tra tr×nh ®é vâ häc cña b¶n th©n!",
		},	
	[4] = 
		{	--Ø¤°ï
			[0] = "<color=green>Bµng L· Väng<color>:",
			[1] = "Hµo Tung Cèc lµ S­ m«n mËt thÊt cña bæn bang, chØ cã ®Ö tö bæn bang míi cã thÓ ®Õn ®ã ®Ó rÌn luyÖn!",	
			[2] = "N¨m ®ã bang chóng ta tô nghÜa ë Hµo Tung Cèc, thËt lµ rÇm ré ch­a tõng thÊy, ®· ®Æt nÒn mãng cho C¸i Bang ta trë thµnh Thiªn h¹ ®Ö nhÊt bang! Trong bang quyÕt ®Þnh chän Hµo Tung Cèc lµm s­ m«n tu luyÖn tr­êng, cho tËp hîp truyÒn c«ng tr­ëng l·o, thiÕt kÕ ra nhiÒu c¬ quan, ®Ó chóng ®Ö tö cã chèn tu luyÖn, nhí l¹i sù anh dòng cña c¸c tiÒn bèi, thóc giôc chóng ®Ö tö siªng n¨ng tu luyÖn vâ c«ng, lËp danh trªn chèn giang hå!",
			[3] = "Ta lµ ng­êi truyÒn c«ng cña bæn bang, Hµo Tung Cèc lµ tu luyÖn tr­êng cña s­ m«n, chóng ®Ö tö cã thÓ vµo ®©y ®Ó nhËn kh¶o nghiÖm, tu luyÖn ngµy mét tiÕn bé!",
		},	
	[5] = 
		{ 	--ÌÆÃÅ	
			[0] = "<color=green>§­êng T« M¹c<color>:",
			[1] = "§­êng M«n mËt thÊt Tróc H¶i, chØ cho phÐp ®Ö tö cña bæn m«n vµo, trong mËt thÊt toµn lµ cao thñ tiÒn bèi cña bæn m«n, ph¶i hÕt søc cÈn thËn ®ã!",	
			[2] = "Tróc H¶i kh«ng thuéc bæn m«n tø ®¹i phßng, cã quy t¾c ®éc lËp. C¸c cao thñ tiÒn bèi cña tø ®¹i phßng ®Òu tËp trung ë Tróc H¶i, b¾t ®Çu nghiªn cøu c¹m bÉy, ¸m khÝ vµ ho¶ khÝ míi, nÕu ch­a n¾m râ vâ c«ng t©m ph¸p cña bæn m«n th× chí bÐn m¶ng ®Õn n¬i nµy. Nh­ng nÕu chóng ®Ö tö cã lßng tin, th× nhÊt ®Þnh sÏ ®­îc më réng tÇm m¾t.",
			[3] = "MËt thÊt Tróc H¶i lµ n¬i tËp trung c¸c cao thñ tiÒn bèi ë tø ®¹i phßng cña bæn m«n, ®Ö tö nµo ®ñ can ®¶m, h·y ®Õn ®Ó so tµi!",
		},	
	[6] = 
		{	--ÑîÃÅ
			[0] = "<color=green>D­¬ng Diªn Chiªu<color>:",
			[1] = "Trung Vâ HiÖu Tr­êng lµ n¬i tu luyÖn cña c¸c ®Ö tö D­¬ng M«n ta. NhÊt ®Þnh mäi ng­êi ph¶i hÕt søc nç lùc, mang vinh quang vÒ cho D­¬ng Gia!",	
			[2] = "Gia phô D­¬ng NghiÖp nhËn thô phong cña triÒu ®×nh, mét lßng b¸o quèc, trÊn thñ thiªn m«n trËn. Con ch¸u D­¬ng gia ph¶i cÇn mÉn luyÖn vâ, b¸o ¬n triÒu ®×nh, lµm r¹ng uy danh D­¬ng.Gia qu©n.",
			[3] = "D­¬ng Gia qu©n uy chÊn thiªn h¹, D­¬ng Gia Trung Vâ HiÖu Tr­êng lµ thao tr­êng kh¾c nghiÖt nhÊt thiªn h¹, kh«ng hÒ thua kÐm cÊm qu©n, ph¶i hÕt søc cÈn thËn ®ã!",
		},	
	[7] = 
		{	--Îå¶¾
			[0] = "<color=green>C©u S¸ch<color>:",
			[1] = "Ngò §éc mËt thÊt ë U Nan QuËt, chØ cho phÐp ®Ö tö bæn gi¸o vµo ®Ó luyÖn thi cæ, nh­ng sèng chÕt do trêi ®Þnh, ta ph¶i c¶nh b¸o ch­ vÞ ®iÒu ®ã!",	
			[2] = "Bæn gi¸o tõ lóc Thi Th­¬ng, Cæ Th­¬ng s¸ng lËp, vÉn th­êng gÆp ph¶i mét sè hung thÇn ¸c thi vµ thiªn niªn ®éc cæ rÊt khã thu phôc. Nh­ng ®ã míi lµ c¬ së cÇn thiÕt ®Ó cho vâ c«ng cña bæn m«n ngµy mét ph¸t triÓn. Cho nªn ®· cho thu thËp nh÷ng thi cæ hiÕm thÊy, tµng tr÷ ë U Nan QuËt, ®ång thêi ph¸i nh÷ng cao thñ tiÒn bèi trong gi¸o ph¸i ®Õn nghiªn cøu. DÇn dµ, nh÷ng tiÒn bèi nµy ®Òu bÞ mÊt hÕt trÝ nhí. §Ö tö bæn gi¸o cã thÓ ®Õn ®©y ®Ó tu luyÖn. Nh­ng sèng chÕt do trêi ®Þnh, nÕu kh«ng thÓ trë ra, th× còng ®õng tr¸ch s­ m«n kh«ng b¸o tr­íc, hoÆc lµ thÊy chÕt mµ kh«ng cøu!",
			[3] = "U Nan QuËt kh«ng gièng Thi Th­¬ng vµ Cæ Th­¬ng, lµ mËt thÊt cña s­ m«n, chøa ®Çy nguy c¬, nÕu kh«ng ra ®­îc còng ®õng tr¸ch s­ m«n v« t×nh ®ã!",
		},	
}

function backroom_main_entry()
	local nFaction = 0;
	if g_nBackRoomEntryType == 2 then
		nFaction = GetPlayerFaction();
	else
		nFaction = backroom_get_faction();
	end;
	local szInforHeader = backroom_get_infoheader();
	BR_WeeklyClear();
	local selTab = {
				". Khiªu chiÕn S­ m«n mËt thÊt/backroom_challenge",
				". Giíi thiÖu S­ m«n mËt thÊt/backroom_know_detail",
				". Xem giíi h¹n khiªu chiÕn/BR_KnowLimit",
				". T¨ng sè lÇn nhËn phÇn th­ëng/backroom_reset_award_num",
				". Bèi c¶nh S­ m«n mËt thÊt/backroom_know_background",
				". Tra b¶ng xÕp h¹ng/backroom_see_all_faction_rank",
				". §æi phÇn th­ëng/backroom_get_reward",
				". NhËn S­ m«n mËt thÊt truyÒn tèng lÖnh/backroom_get_smmscsl",
				"Ta chØ tiÖn ®­êng hái ch¬i!/nothing",
				}
	if g_nBackRoomEntryType == 2 then
		tremove(selTab,5);	--È¥µôÊ¦ÃÅÃØÊÒ±³¾°
		tremove(selTab,5);	--È¥µô²é¿´ÅÅÐÐ°ñ
		tremove(selTab,5);	--È¥µô»»È¡½±Àø
	end;
	local szDialog = "";
	if nFaction == 0 then
		szDialog = "S­ m«n mËt thÊt lµ n¬i tu luyÖn dµnh cho ®Ö tö bæn ph¸i, mçi lÇn tu luyÖn xong ng­¬i sÏ c¶m thÊy th©n thÓ ®æi kh¸c, c«ng lùc t¨ng cao!";
	else
		szDialog = g_tbDialog[nFaction][1];
	end;
	Say(szInforHeader..szDialog.."<color=yellow>HiÖn t¹i mËt thÊt chØ cã 7 ®é khã<color>.",getn(selTab),selTab);
end;

function backroom_get_smmscsl()
	local szInforHeader = backroom_get_infoheader();
	if GetItemCount(2,0,1054,1) >= 1 then
		Talk(1,"",szInforHeader.."B¹n ®· cã 1 S­ m«n mËt thÊt truyÒn tèng lÖnh trong hµnh trang.");
		return 0;
	end;
	AddItem(2,0,1054,1);
	Msg2Player("B¹n nhËn ®­îc 1 S­ m«n mËt thÊt truyÒn tèng lÖnh");
end;

function backroom_know_background()
	local szInforHeader = backroom_get_infoheader();
	local nFaction = backroom_get_faction();
	local szDialog = "";
	szDialog = g_tbDialog[nFaction][2]
	Talk(1,"backroom_main_entry",szInforHeader..szDialog);
end;

function backroom_see_all_faction_rank()
	local szInforHeader = backroom_get_infoheader();
	local nFaction = backroom_get_faction();
	if nFaction == 0 then
		nFaction = GetPlayerFaction();
	end;
	if g_nBackRoomEntryType == 1 then	--Èç¹ûÊÇ´ÓÊ¦¸µ´¦½øÈë
		backroom_see_faction_rank(nFaction);
		return 0;
	end;
	--ÏÂÃæÊÇ´¦Àí´ÓµÀ¾ß´¦½øÈë£¬´ÓµÀ¾ß´¦½øÈë¿ÉÒÔ²é¿´ÈÎÒâÁ÷ÅÉµÄÅÅÐÐ°ñ
	local selTab = {};
	for i=1,getn(TB_FACTION_NAME) do
		tinsert(selTab,TB_FACTION_NAME[i].."/#backroom_see_faction_rank("..i..")");
	end;
	tinsert(selTab,"Hñy bá/nothing");
	Say(szInforHeader.."B¹n muèn kiÓm tra th«ng tin xÕp h¹ng cña l­u ph¸i nµo?",getn(selTab),selTab);
end;

function backroom_reset_award_num()
	local szInforHeader = backroom_get_infoheader();
	if GetTask(TSK_WC_FAIL_TIMES) < MAX_FAILURE_TIMES then
		Talk(1,"",szInforHeader.."Xo¸ d÷ liÖu 1 tuÇn <color=yellow>"..MAX_FAILURE_TIMES.."<color> lÇn trë lªn míi cã thÓ sö dông.");
		return 0;
	end;
	local selTab = {
				"§ång ý/backroom_reset_award_num_confirm",
				"Kh«ng dïng /nothing",
				}
	Say(szInforHeader.."Xo¸ d÷ liÖu 1 tuÇn <color=yellow>"..MAX_FAILURE_TIMES.."<color> lÇn trë lªn míi cã thÓ sö dông, mçi lÇn tiªu hao <color=yellow>"..TB_ITEM[1][1].." 50<color> c¸i, sau khi sö dông, b¹n cã thÓ nhËn ®­îc b¶o r­¬ng ë mËt thÊt mét lÇn n÷a. <color=yellow>T¨ng sè lÇn nhËn phÇn th­ëng, sÏ tù ®éng xo¸ d÷ liÖu<color>. B¹n x¸c nhËn muèn sö dông?",getn(selTab),selTab);
end;

function backroom_reset_award_num_confirm()
	local szInforHeader = backroom_get_infoheader();
	if DelItem(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4],50) == 1 then
		SetTask(TSK_WC_FAIL_TIMES,0);
		SetTask(TSK_WC_LAST_RECORD,0);
		Say(szInforHeader.."§· t¨ng sè lÇn nhËn phÇn th­ëng thµnh c«ng, tuÇn nµy b¹n cã thÓ vµo mËt thÊt nhËn b¶o r­¬ng thªm mét lÇn n÷a.",0);
		Msg2Player("§· t¨ng sè lÇn nhËn phÇn th­ëng thµnh c«ng, tuÇn nµy b¹n cã thÓ vµo mËt thÊt nhËn b¶o r­¬ng thªm mét lÇn n÷a");
		WriteLog(LOG_HEADER..GetName().."Sö dông S­ m«n mËt lÖnh ®Ó t¨ng sè lÇn nhËn phÇn th­ëng");
	else
		Talk(1,"",szInforHeader.."B¹n cÇn cã <color=yellow>50 c¸i "..TB_ITEM[1][1].."<color>.");
	end;
end;

function backroom_challenge()
	local szInforHeader = backroom_get_infoheader();
	if GetPKValue() >= 4 then
		Talk(1,"",szInforHeader.."TrÞ PK cña b¹n <color=yellow>lín h¬n hoÆc b»ng 4<color>, kh«ng thÓ vµo mËt thÊt.");
		return 0;
	end;
	local nPlayerFaction = GetPlayerFaction();
	local nFaction = backroom_get_faction();
	if nPlayerFaction ~= nFaction and nFaction ~= 0 and g_nBackRoomEntryType == 1 then
		Talk(1,"",szInforHeader.."B¹n kh«ng ph¶i lµ ®Ö tö bæn ph¸i, xin h·y quay vÒ ®i!");
		return 0;
	end;
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"backroom_main_entry",szInforHeader.."B¹n h·y t×m mét s­ phô häc vµi chiªu råi h·y vµo mËt thÊt tu luyÖn.");
		return 0;
	end;
	local selTab = {
				"\n. B¾t ®Çu khiªu chiÕn tõ lÇn t¹m dõng tr­íc/backroom_continue_last_record",
				". Chän ®é khã, hoµn thµnh khiªu chiÕn/backroom_select_difficulty",
				"\n. Quay l¹i/backroom_main_entry",
				". KÕt thóc ®èi tho¹i/nothing",
				}
	if GetTask(TSK_WC_LAST_RECORD) == 0 then
		tremove(selTab,1);	--Èç¹ûÉÏ´ÎÃ»ÓÐ±£´æ¼ÇÂ¼
	else
		tremove(selTab,2);	--Èç¹ûÉÏ´ÎÓÐ±£´æ¼ÇÂ¼
		tinsert(selTab,2,"\n. Ta muèn xo¸ d÷ liÖu/backroom_clear_record");
	end;
	if g_nBackRoomEntryType == 2 then
		nFaction = nPlayerFaction;
	end;
	Say(szInforHeader..g_tbDialog[nFaction][3].."TuÇn nµy b¹n ®· vµo ¶i <color=yellow>"..GetTask(TSK_WC_ATTEND_TIMES).."<color> lÇn, xãa d÷ liÖu <color=yellow>"..GetTask(TSK_WC_FAIL_TIMES).."<color> lÇn. Chó ý, khi sè lÇn xãa d÷ liÖu tuÇn v­ît qu¸ <color=yellow>"..MAX_FAILURE_TIMES.."<color> lÇn sÏ kh«ng thÓ lÊy b¶o r­¬ng trong mËt thÊt.",getn(selTab),selTab);
end;

function backroom_clear_record()
	local szInforHeader = backroom_get_infoheader();
	local selTab = {
				"Ph¶i, ta muèn xãa d÷ liÖu/backroom_clear_record_confirm",
				"Kh«ng cÇn/nothing",
				}
	local nLastDiff,nLastStage = BR_GetSaveRecord();
	Say(szInforHeader.."TiÕn ®é lÇn tr­íc b¹n l­u lµ <color=yellow>"..TB_DIFF_NAME[nLastDiff].."<color> ®é khã ¶i <color=yellow>"..nLastStage.."<color>, b¹n muèn xãa d÷ liÖu nµy kh«ng? Chó ý, sè lÇn xãa d÷ liÖu tuÇn v­ît qu¸ <color=yellow>"..MAX_FAILURE_TIMES.."<color> lÇn sÏ kh«ng thÓ lÊy b¶o r­¬ng trong mËt thÊt. TuÇn nµy b¹n ®· xãa d÷ liÖu <color=yellow>"..GetTask(TSK_WC_FAIL_TIMES).."<color> lÇn.",getn(selTab),selTab);
end;

function backroom_clear_record_confirm()
	local szInforHeader = backroom_get_infoheader();
	SetTask(TSK_WC_LAST_RECORD,0);
	SetTask(TSK_WC_FAIL_TIMES,GetTask(TSK_WC_FAIL_TIMES)+1);
	Talk(1,"",szInforHeader.."D÷ liÖu cña b¹n ®· xãa, trong tuÇn nµy ®©y lµ lÇn thø "..GetTask(TSK_WC_FAIL_TIMES).." xãa d÷ liÖu, ng­¬i cã thÓ chän l¹i ®é ®é khã ®Ó v­ît ¶i.");
end;

function backroom_select_difficulty()
	local szInforHeader = backroom_get_infoheader();
	local nLevel = GetLevel();
	if nLevel < 50 then
		Talk(1,"",szInforHeader.."§¼ng cÊp cña ng­¬i qu¸ thÊp, kh«ng thÓ vµo mËt thÊt.");
		return 0;
	end;
	local selTab = {};
	if DEBUG_VERSION == 0 then
		selTab = {
--				"[1]"..TB_DIFF_NAME[1].."/#backroom_enter_back_room(1)",
--				"[2]"..TB_DIFF_NAME[2].."/#backroom_enter_back_room(2)",
--				"[3]"..TB_DIFF_NAME[3].."/#backroom_enter_back_room(3)",
				"[ ¶i 4]"..TB_DIFF_NAME[4].."/#backroom_enter_back_room(4)",
				}
	else
		for i=1,getn(TB_DIFF_NAME) do
			tinsert(selTab,"["..i.."]"..TB_DIFF_NAME[i].."/#backroom_enter_back_room("..i..")");
		end;
	end;
	tinsert(selTab,"\n§Ó ta suy nghÜ l¹i/nothing");
	if nLevel >= 50 and nLevel < 70 then
		tremove(selTab,2);
		tremove(selTab,2);
		tremove(selTab,2);
	elseif nLevel >= 70 and nLevel < 80 then
		tremove(selTab,3);
		tremove(selTab,3);		
	elseif nLevel >= 80 and nLevel < 90 then
		tremove(selTab,4);	
	end;
	Say(szInforHeader.."H·y chän ®é khã: ",getn(selTab),selTab);
end;

function backroom_continue_last_record()
	local szInforHeader = backroom_get_infoheader();
	local nLastDiff,nLastStage = BR_GetSaveRecord();
	if nLastDiff <= 0 then
		Talk(1,"backroom_challenge",szInforHeader.."LÇn tr­íc b¹n kh«ng l­u tiÕn ®é.");
		return 0;
	end;
	local selTab = {
				format("§­îc/#backroom_enter_back_room(%d,%d)",nLastDiff,nLastStage),
				"Ta suy nghÜ mét l¸t/nothing",
				}
	local nReadRecordTimes = GetTask(TSK_WC_READ_RECORD_TIMES)+1;
	local nNeedItemNum = 0;
	if nReadRecordTimes > MAX_FREE_READ_RECORD_TIMES then
		nNeedItemNum = 3;
	end;
	Say(szInforHeader.."TiÕn ®é lÇn tr­íc b¹n l­u lµ <color=yellow>"..TB_DIFF_NAME[nLastDiff].."<color> ®é khã ¶i <color=yellow>"..nLastStage.."<color> ¶i, ®äc tiÕn ®é kh«ng nhËn n÷a"..TB_ITEM[1][1]..". Trong tuÇn nµy ®©y lµ lÇn ®äc tiÕn ®é thø <color=yellow>"..nReadRecordTimes.."<color>. B©y giê ng­¬i muèn vµo ¶i nµy ®Ó luyÖn ph¶i kh«ng?",getn(selTab),selTab);
end;

function backroom_enter_back_room(nDiff,nStage)
	local szInforHeader = backroom_get_infoheader();
	local nNeedToken = 0;
	if BR_EnterNextStageCheck(nDiff,nStage) == 0 then
		Say(szInforHeader.."B¹n hiÖn kh«ng ®ñ ®iÒu kiÖn ®Ó vµo ¶i, xin h·y kiÓm tra giíi h¹n v­ît ¶i ë TiÕp dÉn mËt thÊt s­ m«n.",0);
		Msg2Player("B¹n hiÖn kh«ng ®ñ ®iÒu kiÖn ®Ó vµo ¶i, xin h·y kiÓm tra giíi h¹n v­ît ¶i ë TiÕp dÉn mËt thÊt s­ m«n.");
		return 0;
	end;
	local selTab = {};
	if nStage == nil then
		nNeedToken = 1;	--Èç¹û²»ÊÇ¶Áµµ½øµÄ£¬ÐèÒª1¸öÊ¦ÃÅÁîÅÆ
		nStage = 1;
		tinsert(selTab,"§ång ý/#backroom_enter_back_room_confirm("..nDiff..")");	
	else
		tinsert(selTab,"§ång ý/#backroom_enter_back_room_confirm("..nDiff..","..nStage..")");
	end;
	local nReadRecordTimes = GetTask(TSK_WC_READ_RECORD_TIMES)+1;
	local nNeedItemNum = 0;
--	if nReadRecordTimes > MAX_FREE_READ_RECORD_TIMES then
--		nNeedItemNum = 3;
--	end;
	local szInfo = "";
	local nNeedItemNumEx = 0;
	local szItemName = TB_ITEM[1][1];
	if g_nBackRoomEntryType == 2 then
		nNeedItemNumEx = 2;
		szInfo = "<color=yellow> dïng håi phï mËt thÊt vµo ¶i cÇn tèn "..szItemName..nNeedItemNumEx.." <color>.";
	end;
	local nTotalNeedNum = nNeedItemNum+nNeedItemNumEx;
	tinsert(selTab,"T¹m thêi kh«ng vµo/nothing");
	Say(szInforHeader.."Ng­¬i cã muèn vµo ¶i <color=yellow>"..TB_DIFF_NAME[nDiff].."<color> ¶i <color=yellow>"..nStage.."<color> kh«ng?"..szInfo.."Tæng céng ng­¬i ph¶i tèn <color=yellow> "..nNeedToken.."<color> lÖnh bµi s­ m«n vµ <color=yellow>"..szItemName..nTotalNeedNum.."<color>.",getn(selTab),selTab);
end;

function backroom_enter_back_room_confirm(nDiff,nStage)	--param1:difficulty£¬´ÓÖÐ¶Ï´¦½øÊ±£¬nStage²»Îªnil
	local szInforHeader = backroom_get_infoheader();
	local nReadRecordTimes = GetTask(TSK_WC_READ_RECORD_TIMES)+1;
	local nNeedItemNum = 0;
	local nNeedItemNumEx = 0;
--	if nReadRecordTimes > MAX_FREE_READ_RECORD_TIMES then
--		nNeedItemNum = 3
--	end;
	local szItemName = TB_ITEM[1][1];
	local szInfo = "";
	if g_nBackRoomEntryType == 2 then
		nNeedItemNumEx = 2;
		szInfo = "<color=yellow> dïng håi phï mËt thÊt vµo ¶i cÇn tèn "..szItemName..nNeedItemNumEx.." <color>,";
	end;
	local nTotalNeedNum = nNeedItemNum + nNeedItemNumEx;
	if nStage ~= nil then	--Èç¹ûÊÇ¶Áµµ½øµÄ
		if GetItemCount(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4]) < nTotalNeedNum then
			Talk(1,"",szInforHeader.."TuÇn nµy ng­¬i ®· ®æi <color=yellow>"..nReadRecordTimes.."<color> lÇn ®äc tiÕn ®é, cÇn <color=yellow>"..nNeedItemNum.."<color> c¸i"..szItemName.."."..szInfo.."Sè l­îng "..szItemName.."Sè l­îng kh«ng ®ñ, tæng céng cÇn "..nTotalNeedNum.."c¸i"..szItemName..".");
			return 0;
		end;
	else
		if GetItemCount(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4]) < nNeedItemNumEx then
			Talk(1,"",szInforHeader..szInfo.."Sè l­îng "..szItemName.."Sè l­îng kh«ng ®ñ.");
			return 0;
		end;
	end;
	local nFaction = GetPlayerFaction();
	local nRoute = GetPlayerRoute();
	local nCurMapID = GetWorldPos();
	local nRoomID,nRoomIdx,nRoomCount = BR_FindIdleRoom(nFaction,g_nBackRoomEntryType);
	if nRoomID == 0 then
		Talk(1,"",szInforHeader.."T¹m thêi kh«ng cã khu thi ®Êu ®Ó luyÖn, vµo sau nhÐ.");
		return 0;
	end;
	if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nRoomID) == MS_STATE_IDEL then
		if nStage == nil then	--Èç¹û²»ÊÇ¶Áµµ½øµÄ¾ÍÒªÊÕÊ¦ÃÅÁîÅÆ
			if BR_DelLingPai(nFaction,1) ~= 1 then
				Talk(1,"",szInforHeader.."Ng­¬i cÇn ph¶i cã lÖnh bµi s­ m«n míi cã thÓ vµo mËt thÊt.");
				return 0;
			end;
		end;
		if mf_OpenMission(MISSION_ID,nRoomID) == 1 then
			DelItem(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4],nTotalNeedNum);
			if nStage == nil then
				nStage = 1;
				SetTask(TSK_ENTER_TYPE,0);	--·Ç¶Áµµ½øµÄ
			else	--ÓÃÕâ¸öÀ´ÅÐ¶ÏÊÇ²»ÊÇ´ÓÖÐ¶Ï´¦½øµÄ
				SetTask(TSK_WC_READ_RECORD_TIMES,nReadRecordTimes);
				SetTask(TSK_ENTER_TYPE,1);	--¶Áµµ½øµÄ
			end;
			if g_nBackRoomEntryType == 1 then	--´ÓÃÅÅÉ´¦½ø
				mf_SetMissionV(MISSION_ID,MV_MAP_TYPE,nRoute,nRoomID);
			else	--´ÓµÀ¾ß´¦½ø
				mf_SetMissionV(MISSION_ID,MV_MAP_TYPE,0,nRoomID);
			end;
			mf_SetMissionV(MISSION_ID,MV_CUR_DIFF,nDiff,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_CUR_STAGE,nStage,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_MAPID,nRoomID,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_MAPIDX,nRoomIdx,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_ENTRY_MAPID,nCurMapID,nRoomID);
			mf_JoinMission(MISSION_ID,0,nRoomID);
		end;
	end;
end;

function backroom_know_detail()
	local szInforHeader = backroom_get_infoheader();
	Talk(2,"backroom_know_detail_2",szInforHeader.."\n    MËt thÊt s­ m«n mçi 9 ¶i lµ mét tuÇn hoµn, 9 tuÇn hoµn tæng céng lµ 81 ¶i. §é khã t¨ng dÇn, khiªu chiÕn chiÕn th¾ng th× cã thÓ v­ît qua ¶i.\n    Quy ®Þnh vµo: Mçi lÇn khiªu chiÕn cÇn tèn 1 lÖnh bµi s­ m«n cña m«n ph¸i t­¬ng øng, mçi tuÇn cã thÓ vµo khiªu chiÕn v« h¹n, nh­ng chØ cã "..MAX_FAILURE_TIMES.." vßng khiªu chiÕn qua ¶i tr­íc ®ã hoÆc sè lÇn xãa d÷ liÖu nhá h¬n "..MAX_FAILURE_TIMES.." lÇn míi nhËn ®­îc phÇn th­ëng (v­ît ¶i sÏ tù ®éng xãa d÷ liÖu). Cã thÓ t¨ng, nhËn sè lÇn phÇn th­ëng, mçi lÇn tiªu hao 50 mËt thÊt s­ m«n. Ngoµi ra khi b¾t ®Çu mçi ¶i sÏ hñy tr¹ng th¸i ThÕ Th©n phï vµ ®iÓm s¸t khÝ cña nh©n vËt. TÊt c¶ d­îc hiÖu vµ kü n¨g CD xãa thµnh 0, sinh lùc néi lùc bæ sung tèi ®a.","    H¹n chÕ v­ît ¶i: §¼ng cÊp cña ng­êi ch¬i, thuéc tÝnh nh­ trang bÞ danh hiÖu sÏ ¶nh h­ëng ®Õn ®é khã lín nhÊt cã thÓ tiÕn hµnh v­ît ¶i, khi vµo ¶i sÏ kiÓm tra nÕu ch­a ®¹t yªu cÇu th× ®­a ra khái mËt thÊt s­ m«n, tr­íc khi vµo ¶i h·y x¸c nhËn kÕt qu¶ kiÓm tra. Chi tiÕt h¹n chÕ h·y xem chi tiÕt h¹n chÕ khiªu chiÕn. \n    §iÒu kiÖn thÊt b¹i: Tö vong, quy ph¹m ¶i ®Æc biÖt, khi v­ît ¶i giíi h¹n ®¹t ®­îc sÏ ¶nh h­ëng ®Õn sù thÊt b¹i cña khiªu chiÕn. \n    Bµng xÕp h¹ng: Ng­êi ch¬i tõ ¶i thø nhÊt cña mçi tuÇn hoµn ®Õn ¶i cuèi cïng cña tuÇn hoµn nµy, mçi lÇn v­ît ¶i sÏ ®­îc ghi l¹i thêi gian vµ ®­a sè liÖu vµo b¶ng danh s¸ch. Rêi khái nöa chõng, thÊt b¹i sÏ kh«ng ghi l¹i thêi gian. Mçi l­u ph¸i mçi tuÇn hoµn ®Òu cã 1 danh s¸ch. ");
end;

function backroom_know_detail_2()
	local szInforHeader = backroom_get_infoheader();
	Talk(2,"backroom_main_entry",szInforHeader.."\n    L­u d÷ liÖu: Ng­êi ch¬i th«ng qua ¶i 4, 8, 9 vµ sau khi nhËn phÇn th­ëng d÷ liÖu sÏ tù ®éng ®­îc l­u vµo ¶i hiÖn t¹i. D÷ liÖu sÏ kh«ng ®­îc xãa tù ®éng, nh­ng cã thÓ xãa thñ c«ng. Khi cã d÷ liÖu, cã thÓ nhÊn b¾t ®Çu v­ît ¶i tõ d÷ liÖu."..MAX_FREE_READ_RECORD_TIMES.."LÇn tr­íc nhÊn b¾t ®Çu khiªu chiÕn tõ file lµ miÔn phÝ, sau ®ã mçi lÇn ®äc file vµo sÏ cÇn 3 MËt thÊt s­ m«n lÖnh. \n    Nh¶y ¶i: Theo ®¼ng cÊp cña ng­¬i ng­¬i cã thÓ chän trùc tiÕp tõ ®é khã nµo ®ã ®Ó b¾t ®Çu khiªu chiÕn. \n    CÊp 50-69   kh«ng thÓ nh¶y ¶i\n    CÊp 70-79 b¾t ®Çu tõ tiÓu thÝ ng­u ®ao\n    CÊp 80-89 b¾t ®Çu tõ tiÓu thµnh s¬ diÔn\n    CÊp 90 trë lªn b¾t ®Çu tõ thi kuyÖn vâ nghÖ","    Thêi gian nghØ ng¬i: Thêi gian nghØ ng¬i chØ cã 5 phót, ®Õn giê vÉn ch­a v­ît ¶i sÏ bÞ ®­a vµo ¶i kÕ, ch­a vµo ¶i h¹n chÕ ®Æc biÖt sÏ bÞ ®­a ra khái ¶i. \n    NhËn ¶i: Trong khi v­ît ¶i v× tö vong dÉn ®Õn v­ît ¶i thÊt väng th× cã thÓ nhËn ¶i, sÏ trùc tiÕp khiªu chiÕn ¶i nµy, sÏ kh«ng bÞ ®­a ra mËt thÊt s­ m«n. Mçi lÇn tèn 2 MËt thÊt s­ m«n lÖnh.");
end;

function backroom_see_faction_rank(nFaction)
	local szInforHeader = backroom_get_infoheader();
	local selTab = {};
	for i=1,getn(TB_FACTION_ROUTE[nFaction]) do
		selTab[i] = TB_FACTION_ROUTE[nFaction][i][2].."/#backroom_see_route_rank("..TB_FACTION_ROUTE[nFaction][i][1]..")";
	end;
	tinsert(selTab,"\nKÕt thóc ®èi tho¹i/nothing");
	Say(szInforHeader.."Ng­¬i muèn xem th«ng tin danh s¸ch hÖ ph¸i nµo?",getn(selTab),selTab);
end;

function backroom_see_route_rank(nRoute)
	local szInforHeader = backroom_get_infoheader();
	local selTab = {}
	for i=1,getn(TB_DIFF_NAME) do
		tinsert(selTab,"Xem ["..i.."]"..TB_DIFF_NAME[i].." Danh s¸ch ®é khã/#backroom_get_rank("..nRoute..","..i..")");
	end;
	tinsert(selTab,"Quay l¹i ®èi tho¹i trªn/backroom_see_all_faction_rank");
	tinsert(selTab,"KÕt thóc ®èi tho¹i/nothing");
	for i=1,9 do
		DelRelayShareDataCopy(BACKROOM_RELAY_KEY,nRoute,i);
	end;
	Say(szInforHeader.."Ng­¬i muèn xem"..gf_GetRouteName(nRoute).." th«ng tin danh s¸ch ®é khã nµo?",getn(selTab),selTab);
end;

function backroom_get_rank(nRoute,nDiff)
	ApplyRelayShareData(BACKROOM_RELAY_KEY,nRoute,nDiff,g_szThisFile,"backroom_callback_get_rank");
end;

function backroom_callback_get_rank(szKey,nKey1,nKey2,nRecordCount)
	local szInforHeader = backroom_get_infoheader();
	if nRecordCount == 0 then
		Talk(1,"backroom_see_all_faction_rank",szInforHeader.."HiÖn t¹m thêi kh«ng cã th«ng tin danh s¸ch liªn quan");
		return 0;
	end;
	local szString = "";
	if nRecordCount > 8 then
		nRecordCount = 8;	--Ö»ÅÅÇ°8Ãû
	end;
	local szName = "";
	local nTime = 0;
	local szFormatTime = "";
	for i=1,nRecordCount do
		szName,nTime = GetRelayShareDataByIndex(szKey,nKey1,nKey2,i-1);
		szFormatTime = tf_GetTimeString(nTime);
		szString = szString..gf_FormatStringLength(i,6);
		szString = szString..gf_FormatStringLength(szName,18);
		szString = szString..gf_FormatStringLength(szFormatTime,20);
		szString = szString.."\n";
	end;
	Talk(1,"#backroom_see_route_rank("..nKey1..")",gf_GetRouteName(nKey1).."MËt thÊt s­ m«n ["..nKey2.."]"..TB_DIFF_NAME[nKey2].." 8 ng­êi dÉn ®Çu ®é khã: \n"..gf_FormatStringLength("H¹ng",6)..gf_FormatStringLength("Tªn",18)..gf_FormatStringLength("Tæng thêi gian",20).."\n"..szString);
end;

function backroom_get_reward()
	local szInforHeader = backroom_get_infoheader();
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",szInforHeader.."Ng­¬i ph¶i gia nhËp l­u ph¸i tr­íc míi cã thÓ ®æi phÇn th­ëng.");
		return 0;
	end;
	local selTab = {
				". §æi vËt phÈm tiªu hao/backroom_exchange_normal_item",
				". §æi MËt tÞch s­ m«n, T©m ph¸p vµ QuyÕt yÕu/backroom_exchange_faction_item",
				". §æi trang bÞ s­ m«n míi/backroom_equip_reward",
				". VËt phÈm cao cÊp ®æi vËt phÈm cÊp 1/backroom_exchange_totem",
				". §æi m¶nh MËt tÝch trÊn ph¸i/backroom_exchange_zhenpai",
				". §iÒu chØnh lùc ®¸nh cña vò khÝ s­ m«n/backroom_exchange_attack",
				"Quay l¹i ®èi tho¹i trªn/backroom_main_entry",
				"Kh«ng cã g×/nothing",
				}
	Say(szInforHeader.."Ng­¬i muèn ®æi phÇn th­ëng nµo?",getn(selTab),selTab);
end;

function backroom_exchange_totem()
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."Ng­¬i ph¶i gia nhËp l­u ph¸i tr­íc míi cã thÓ ®æi trang bÞ s­ m«n.");
		return 0;
	end;
	local szInforHeader = backroom_get_infoheader();
	local selTab = {
			". VËt phÈm cÊp 2 ®æi vËt phÈm cÊp 1 (tû lÖ ®åi 1:1)/#backroom_exchange_totem_type(2)",
			". VËt phÈm cÊp 3 ®æi vËt phÈm cÊp 1 (tû lÖ ®æi 1:2)/#backroom_exchange_totem_type(3)",
			"Quay l¹i ®èi tho¹i trªn/backroom_get_reward",
			"Kh«ng ®æi/nothing",
			};
	Say(szInforHeader.."Ng­¬i cã thÓ lÊy vËt phÈm cao cÊp cña mËt thÊt s­ m«n d­ ®æi thµnh vËt phÈm cÊp 1 dïng ®Ó §æi vËt phÈm tiªu hao s­ m«n.",getn(selTab),selTab);
end;

function backroom_exchange_totem_type(nType)
	local szInforHeader = backroom_get_infoheader();
	local nFaction = GetPlayerFaction();
	local nID1 = TB_TOTEM_INFO[nFaction][nType][1];
	local nID2 = TB_TOTEM_INFO[nFaction][nType][2];
	local nID3 = TB_TOTEM_INFO[nFaction][nType][3];
	local szTotemName = TB_TOTEM_INFO[nFaction][nType][4];
	local nTotemCount = GetItemCount(nID1,nID2,nID3);
	if nTotemCount <= 0 then
		Talk(1,"backroom_exchange_totem",szInforHeader.."Ng­¬i kh«ng cã <color=yellow>"..szTotemName.."<color> µ!!");
		return 0;
	end;
	SetTaskTemp(TTSK_NORMAL_ITEM_TYPE,nType);
	AskClientForNumber("backroom_exchange_totem_confirm",1,min(nTotemCount,100),"Ng­¬i muèn dïng bao nhiªu ®Ó ®æi?");	--£±´Î×î¶à»»£±£°£°¸ö
end;

function backroom_exchange_totem_confirm(nCount)
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."Ng­¬i ph¶i gia nhËp l­u ph¸i míi cã thÓ ®æi.");
		return 0;
	end;
	local nFaction = GetPlayerFaction();
	local nType = GetTaskTemp(TTSK_NORMAL_ITEM_TYPE);
	local nID1 = TB_TOTEM_INFO[nFaction][nType][1];
	local nID2 = TB_TOTEM_INFO[nFaction][nType][2];
	local nID3 = TB_TOTEM_INFO[nFaction][nType][3];
	local szTotemName = TB_TOTEM_INFO[nFaction][nType][4];
	local nTotemCount = GetItemCount(nID1,nID2,nID3);
	if nTotemCount < nCount then
		Talk(1,"backroom_exchange_totem",szInforHeader.."Ng­¬i ®· ®æi <color=yellow>"..szTotemName.."<color> kh«ng ®ñ <color=yellow>"..nCount.."<color> µ!!");
		return 0;
	end;
	local nLV1ID1 = TB_TOTEM_INFO[nFaction][1][1];
	local nLV1ID2 = TB_TOTEM_INFO[nFaction][1][2];
	local nLV1ID3 = TB_TOTEM_INFO[nFaction][1][3];
	local szLV1TotemName = 	TB_TOTEM_INFO[nFaction][1][4];
	local nLV1TotemCount = 0;
	if nType == 2 then
		nLV1TotemCount = nCount;	--±ÈÂÊ1£º1
	else
		nLV1TotemCount = 2*nCount;	--±ÈÂÊ1£º2
	end;
	if gf_JudgeRoomWeight(2,nLV1TotemCount*5,"") == 0 then
		return 0;
	end;
	if DelItem(nID1,nID2,nID3,nCount) == 1 then
		AddItem(nLV1ID1,nLV1ID2,nLV1ID3,nLV1TotemCount);
		Msg2Player("B¹n ®æi "..nCount.."c¸i"..szTotemName.." råi"..nLV1TotemCount.."c¸i"..szLV1TotemName);
		WriteLog(LOG_HEADER..GetName().."(m«n ph¸i:"..nFaction..") dïng "..nCount.."c¸i"..szTotemName.." råi"..nLV1TotemCount.."c¸i"..szLV1TotemName);
	end;
end;

function backroom_exchange_normal_item()
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."Ng­¬i ph¶i gia nhËp l­u ph¸i míi cã thÓ ®æi phÇn th­ëng.");
		return 0;
	end;
	backroom_list_normal_item(1,getn(TB_NORMAL_ITEM));
end;

function backroom_list_normal_item(nPageNum,nCount)
	local szInforHeader = backroom_get_infoheader();
	local tMedList = backroom_get_normal_item_list();
	local selTab = {};
	local nItemPerPage = 5;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--Õâ¸öº¯ÊýÊÇÓÃÀ´»ñµÃµ±Ç°Ò³ÊýµÄ×î´óÏÔÊ¾ÏîÄ¿ÊýµÄ
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nCount);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("Trang tr­íc \n /#backroom_list_normal_item(%d,%d)",nPageNum-1,nCount));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tMedList[i]);
	end;
	if nPageNum ~= ceil(nCount/nItemPerPage) then
		tinsert(selTab,format("\n Trang sau/#backroom_list_normal_item(%d,%d)",nPageNum+1,nCount));	
	end;
	tinsert(selTab,"§Ó ta nghÜ l¹i/nothing");
	Say(szInforHeader.."Ng­¬i muèn ®æi lo¹i vËt phÈm tiªu hao nµo?",getn(selTab),selTab);
end;

function backroom_get_normal_item(nType)
	local szInforHeader = backroom_get_infoheader();
	local nFaction = GetPlayerFaction();
	local nTotemCount = GetItemCount(TB_TOTEM_INFO[nFaction][1][1],TB_TOTEM_INFO[nFaction][1][2],TB_TOTEM_INFO[nFaction][1][3]);
	local nNeedNum = TB_NORMAL_ITEM[nType][5];
	local nMedCount = floor(nTotemCount/nNeedNum);
	if nMedCount <= 0 then
		Talk(1,"backroom_exchange_normal_item",szInforHeader.."Sè l­îng huy hiÖu cña ng­¬i kh«ng ®ñ, x¸c nhËn trªn ng­êi ng­¬i Ýt nhÊt cã <color=yellow>"..nNeedNum.."c¸i"..TB_TOTEM_INFO[nFaction][1][4].."<color>.");
		return 0;
	end;
	SetTaskTemp(TTSK_NORMAL_ITEM_TYPE,nType);
	AskClientForNumber("backroom_get_normal_item_confirm",1,min(nMedCount,100),"B¹n muèn ®æi bao nhiªu?");	--£±´Î×î¶à»»£±£°£°¸ö
end;

function backroom_get_normal_item_list()
	local nFaction = GetPlayerFaction();
	local tSelTab = {};
	for i=1,getn(TB_NORMAL_ITEM) do
		tinsert(tSelTab,format(TB_NORMAL_ITEM[i][1].."("..TB_NORMAL_ITEM[i][5].."c¸i"..TB_TOTEM_INFO[nFaction][1][4].." céng "..TB_NORMAL_ITEM[i][6].." vµng ®æi 1 )/#backroom_get_normal_item(%d)",i));
	end;
	return tSelTab;
end;

function backroom_get_normal_item_confirm(nCount)
	local szInforHeader = backroom_get_infoheader();
	if nCount <= 0 then
		return 0;
	end;
	local nFaction = GetPlayerFaction();
	local nType = GetTaskTemp(TTSK_NORMAL_ITEM_TYPE);
	local nNeedMoney = TB_NORMAL_ITEM[nType][6]*nCount;
	local nNeedNum = TB_NORMAL_ITEM[nType][5]*nCount;
	local nTotemID1 = TB_TOTEM_INFO[nFaction][1][1];
	local nTotemID2 = TB_TOTEM_INFO[nFaction][1][2];
	local nTotemID3 = TB_TOTEM_INFO[nFaction][1][3];
	if GetItemCount(nTotemID1,nTotemID2,nTotemID3) < nNeedNum then
		Talk(1,"backroom_exchange_normal_item",szInforHeader.."Sè l­îng huy hiÖu cña ng­¬i kh«ng ®ñ, x¸c nhËn trªn ng­êi ng­¬i Ýt nhÊt cã <color=yellow>"..nNeedNum.."c¸i"..TB_TOTEM_INFO[nFaction][1][4].."<color>.")	
		return 0;
	end;
	if GetCash() < nNeedMoney*10000 then
		Talk(1,"",szInforHeader.."Vµng kh«ng ®ñ, x¸c nhËn Ýt nhÊt ng­¬i cã <color=yellow>"..(nNeedMoney).."vµng<color>.");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,nCount*5,"") == 0 then
		return 0;
	end;
	local szItemName = TB_NORMAL_ITEM[nType][1];
	local nItemID1 = TB_NORMAL_ITEM[nType][2];
	local nItemID2 = TB_NORMAL_ITEM[nType][3];
	local nItemID3 = TB_NORMAL_ITEM[nType][4];
	Pay(nNeedMoney*10000);
	if DelItem(nTotemID1,nTotemID2,nTotemID3,nNeedNum) == 1 then
		AddItem(nItemID1,nItemID2,nItemID3,nCount);
		Msg2Player("Ng­¬i ®· ®æi "..nCount.."c¸i"..szItemName);
		WriteLog(LOG_HEADER..GetName().."(m«n ph¸i:"..nFaction..") råi"..nCount.."c¸i"..szItemName);
	end;
end;

backroom_tbNeedTotem = 
{
	[4] = 
	{
		[1] = {0,110,0},	--Ê¦ÃÅµÚ4Ì×Ã±×Ó
		[2] = {0,130,0},	--Ê¦ÃÅµÚ4Ì×ÒÂ·þ
		[3] = {0,110,0},	--Ê¦ÃÅµÚ4Ì×¿ã×Ó
		[4] = {0,150,0},	--Ê¦ÃÅµÚ4Ì×Ê×ÊÎ1
		[5] = {0,150,0},	--Ê¦ÃÅµÚ4Ì×Ê×ÊÎ2
		[6] = {0,240,0},	--Ê¦ÃÅµÚ4Ì×ÎäÆ÷
	},
	[5] = 
	{
		[1] = {0,0,240},	--Ê¦ÃÅµÚ5Ì×Ã±×Ó
		[2] = {0,0,360},	--Ê¦ÃÅµÚ5Ì×ÒÂ·þ
		[3] = {0,0,240},	--Ê¦ÃÅµÚ5Ì×¿ã×Ó
		[4] = {0,0,480},	--Ê¦ÃÅµÚ5Ì×Ê×ÊÎ1
		[5] = {0,0,480},	--Ê¦ÃÅµÚ5Ì×Ê×ÊÎ2
		[6] = {0,0,720},	--Ê¦ÃÅµÚ5Ì×ÎäÆ÷
	},
}

function backroom_equip_reward()
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."Ng­¬i ph¶i gia nhËp l­u ph¸i tr­íc míi cã thÓ ®æi trang bÞ s­ m«n.");
		return 0;
	end;
	local selTab = {
				"Xem thuéc tÝnh trang bÞ míi/backroom_see_equip_info",
				"§æi trang bÞ s­ m«n míi/backroom_exchange_equip",
				"Quay l¹i ®èi tho¹i trªn/backroom_get_reward",
				"Kh«ng ®æi/nothing",
				}
	Say(szInforHeader.."Ng­¬i muèn ®æi trang bÞ s­ m«n kh«ng?",getn(selTab),selTab);
end;

function backroom_see_equip_info()
	local nFaction = backroom_get_faction();
	local szInforHeader = backroom_get_infoheader();
	local tb = {90,94,92,93,91,95,96};
	if nFaction == 0 then
		Talk(1,"",szInforHeader.."ë ®©y kh«ng thÓ xem thuéc tÝnh trang bÞ míi.");
		return 0;
	end;
	Sale(tb[nFaction],100,1);
end;

function backroom_exchange_equip()
	local szInforHeader = backroom_get_infoheader();
	local nPlayerFaction = GetPlayerFaction();
	local nFaction = backroom_get_faction();
	if nPlayerFaction ~= nFaction and nFaction ~= 0 and g_nBackRoomEntryType == 1 then
		Talk(1,"",szInforHeader.."Ng­¬i kh«ng ph¶i ®Ö tö bæn ph¸i, kh«ng thÓ ®æi trang bÞ s­ m«n!");
		return 0;
	end;
	local selTab = {
				"Trang bÞ s­ m«n 4/#backroom_get_equip_reward(4)",
				"Trang bÞ s­ m«n 5/#backroom_get_equip_reward(5)",
				"Quay l¹i ®èi tho¹i trªn/backroom_equip_reward",
				"Kh«ng ®æi/nothing",
				}
	Say(szInforHeader.."Ng­¬i muèn ®æi trang bÞ s­ m«n nµo?",getn(selTab),selTab);
end;

function backroom_get_equip_reward(nGeneration)
	local szInforHeader = backroom_get_infoheader();
	local nRoute = GetPlayerRoute();
	local selTab = {
				backroom_get_equip_name(nRoute,nGeneration,1).."/#backroom_get_equip("..nGeneration..",1)",
				backroom_get_equip_name(nRoute,nGeneration,2).."/#backroom_get_equip("..nGeneration..",2)",
				backroom_get_equip_name(nRoute,nGeneration,3).."/#backroom_get_equip("..nGeneration..",3)",
				backroom_get_equip_name(nRoute,nGeneration,4).."/#backroom_get_equip("..nGeneration..",4)",
				backroom_get_equip_name(nRoute,nGeneration,5).."/#backroom_get_equip("..nGeneration..",5)",
				backroom_get_equip_name(nRoute,nGeneration,6).."/#backroom_get_equip("..nGeneration..",6)",
				"Quay l¹i ®èi tho¹i trªn/backroom_exchange_equip",
				"Kh«ng ®æi/nothing",
				}
	Say(szInforHeader.."Ng­¬i muèn ®æi trang bÞ nµo d­íi ®©y?",getn(selTab),selTab);
end;

function backroom_get_equip(nGeneration,nType)
	local szInforHeader = backroom_get_infoheader();
	local nRoute = GetPlayerRoute();
	local nFaction = GetPlayerFaction();
	local szEquipName = backroom_get_equip_name(nRoute,nGeneration,nType);
	local selTab = {};
	local nTotemNum = 0;
	local szTotemName = "";
	for i=1,3 do
		nTotemNum = backroom_tbNeedTotem[nGeneration][nType][i];
		if nTotemNum > 0 then
			szTotemName = TB_TOTEM_INFO[nFaction][i][4];
			tinsert(selTab,"X¸c nhËn ®æi (tiªu hao "..nTotemNum.."c¸i"..szTotemName..")/#backroom_get_equip_confirm("..nGeneration..","..nType..","..i..")");
		end;
	end;
	tinsert(selTab,"Quay l¹i ®èi tho¹i trªn/#backroom_get_equip_reward("..nGeneration..")");
	tinsert(selTab,"Kh«ng ®æi/nothing");
	Say(szInforHeader.."Ng­¬i muèn ®æi <color=yellow>"..szEquipName.."<color> chø?",getn(selTab),selTab);
end;

function backroom_get_equip_name(nRoute,nGeneration,nType)
	local szName = fe_tbFactionEquipExName[nRoute][nGeneration][nType];
	return szName;
end;

function backroom_get_equip_confirm(nGeneration,nType,nTotemType)
	local szInforHeader = backroom_get_infoheader();
	if gf_JudgeRoomWeight(3,500,"") ~= 1 then
		return 0;
	end;
	local nFaction = GetPlayerFaction();
	local tb = TB_TOTEM_INFO[nFaction][nTotemType];
	local nNeedTotemNum = backroom_tbNeedTotem[nGeneration][nType][nTotemType];
	local szTotemName = tb[4];
	if GetItemCount(tb[1],tb[2],tb[3]) < nNeedTotemNum then
		Talk(1,"#backroom_get_equip_reward("..nGeneration..")",szInforHeader.."<color=yellow>"..szTotemName.."<color> kh«ng ®ñ.")	
		return 0;	   
	end;
	DelItem(tb[1],tb[2],tb[3],nNeedTotemNum);
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	fe_AddFactionEquipmentEx(nRoute,nBody,nGeneration,nType);
	local szEquipName = backroom_get_equip_name(nRoute,nGeneration,nType);
	Msg2Player("B¹n nhËn ®­îc "..szEquipName);
	WriteLog(LOG_HEADER..GetName().."NhËn ®­îc 1 trang bÞ s­ m«n:"..szEquipName..",nGeneration:"..nGeneration..",nType:"..nType);
end;
--¸ù¾Ýµ±Ç°µØÍ¼À´ÅÐ¶ÏÕâ¸öÊ¦¸µÊÇÄÄ¸öÃÅÅÉµÄ
function backroom_get_faction()
	local nMapID = GetWorldPos();
	local tbFactionMapID = {204,312,303,209,305,219,407};
	for i=1,getn(tbFactionMapID) do
		if nMapID == tbFactionMapID[i] then
			return i;
		end;
	end;
	return 0;
end;

function backroom_get_infoheader()
	if g_nBackRoomEntryType == 2 then	--Èç¹ûÊÇ´ÓµÀ¾ß´¦´ò¿ª
		return "";
	end;
	local nFaction = backroom_get_faction();
	local szInfoHeader = g_tbDialog[nFaction][0];
	return szInfoHeader;
end;

function backroom_exchange_faction_item()
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",szInforHeader.."Ng­êi v« m«n v« ph¸i kh«ng ®­îc ®æi vËt phÈm nµy.");
		return 0;
	end;
	local szTotemName = TB_TOTEM_INFO[nFaction][1][4];	
	local selTab = {
				". §æi MËt tÞch s­ m«n (cÇn"..szTotemName..TB_FACTION_ITEM[1][0][2].." )/#backroom_exchange_faction_item_type(1)",
				". §æi T©m ph¸p s­ m«n (cÇn "..szTotemName..TB_FACTION_ITEM[2][0][2].." )/#backroom_exchange_faction_item_type(2)",
				". §æi Tói QuyÕt yÕu bang ph¸i m×nh ("..gf_GetFactionName(nFaction).." ) (cÇn "..szTotemName..TB_FACTION_ITEM[3][0][2].." )/#backroom_exchange_faction_item_type(3)",
				". §æi MËt tÞch cao cÊp s­ m«n (cÇn "..TB_TOTEM_INFO[nFaction][3][4]..TB_FACTION_ITEM[4][0][2].." )/#backroom_exchange_faction_item_type(4)",
				". §æi MËt tÞch cao cÊp s­ m«n (cÇn "..TB_TOTEM_INFO[nFaction][3][4].."120 c¸i vµ 2000 vµng)/#backroom_exchange_book(1,4)",
				"Quay l¹i ®èi tho¹i trªn/backroom_get_reward",
				"Kh«ng ®æi/nothing",
				}
	local szInforHeader = backroom_get_infoheader();
	Say(szInforHeader.."Ng­¬i muèn ®æi vËt phÈm g×?",getn(selTab),selTab);
end;

function backroom_exchange_faction_item_type(nItemType)
	local nFaction = GetPlayerFaction();
	if nItemType == 3 then	--Èç¹ûÊÇ¾÷Òª°ü
		backroom_get_faction_item(nItemType,nFaction);
	else
		backroom_list_faction_item(1,nItemType);
	end;
end;

function backroom_list_faction_item(nPageNum,nItemType)
	local szInforHeader = backroom_get_infoheader();
	local tbList = backroom_get_faction_item_list(nItemType);
	local selTab = {};
	local nItemNum = getn(tbList);
	local nItemPerPage = 5;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--Õâ¸öº¯ÊýÊÇÓÃÀ´»ñµÃµ±Ç°Ò³ÊýµÄ×î´óÏÔÊ¾ÏîÄ¿ÊýµÄ
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nItemNum);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("Trang tr­íc \n /#backroom_list_faction_item(%d,%d)",nPageNum-1,nItemType));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbList[i]);
	end;
	if nPageNum ~= ceil(nItemNum/nItemPerPage) then
		tinsert(selTab,format("\n Trang sau/#backroom_list_faction_item(%d,%d)",nPageNum+1,nItemType));	
	end;
	tinsert(selTab,"\n §Ó ta suy nghÜ/nothing");
	Say(szInforHeader.."Ng­¬i muèn ®æi vËt phÈm nµo d­íi ®©y?",getn(selTab),selTab);
end;

function backroom_get_faction_item_list(nItemType)
	local tbItem = TB_FACTION_ITEM[nItemType];
	local tbRetTb = {};
	for i=1,getn(tbItem) do
		tinsert(tbRetTb,tbItem[i][1].."/#backroom_get_faction_item("..nItemType..","..i..")");
	end;
	return tbRetTb;
end;

function backroom_get_faction_item(nItemType,nItemIdx)
	local szInforHeader = backroom_get_infoheader();
	local tbItem = TB_FACTION_ITEM[nItemType];
	local szItemName = tbItem[nItemIdx][1];
	local nFaction = GetPlayerFaction();
	local nNeedItemNum = tbItem[0][2];
	local nTotemType = tbItem[0][1];
	local szNeedItemName = TB_TOTEM_INFO[nFaction][nTotemType][4];
	local selTab = {
				"§ång ý/#backroom_get_faction_item_confirm("..nItemType..","..nItemIdx..")",
				"Hñy bá/nothing",
				}
	Say(szInforHeader.."Ng­¬i muèn ®æi <color=yellow>"..szItemName.."<color>? CÇn ph¶i cã <color=yellow>"..nNeedItemNum.."c¸i"..szNeedItemName.."<color>.",getn(selTab),selTab);
end;

function backroom_get_faction_item_confirm(nItemType,nItemIdx)
	local szInforHeader = backroom_get_infoheader();
	local tbItem = TB_FACTION_ITEM[nItemType];
	local nNeedItemNum = tbItem[0][2];
	local nTotemType = tbItem[0][1];
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",szInforHeader.."Ng­êi v« m«n v« ph¸i kh«ng ®­îc ®æi vËt phÈm nµy.");
		return 0;
	end;
	local szNeedItemName = TB_TOTEM_INFO[nFaction][nTotemType][4];
	local nID1 = TB_TOTEM_INFO[nFaction][nTotemType][1];
	local nID2 = TB_TOTEM_INFO[nFaction][nTotemType][2];
	local nID3 = TB_TOTEM_INFO[nFaction][nTotemType][3];
	local nCurItemNum = GetItemCount(nID1,nID2,nID3);
	if nCurItemNum < nNeedItemNum then
		Talk(1,"",szInforHeader.."Ng­¬i cÇn <color=yellow>"..nNeedItemNum.."c¸i"..szNeedItemName.."<color> míi cã thÓ ®æi vËt phÈm nµy.");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,15,szInforHeader) == 0 then
		return 0;
	end;
	local szItemName = tbItem[nItemIdx][1];
	local nItemID1 = tbItem[nItemIdx][2];
	local nItemID2 = tbItem[nItemIdx][3];
	local nItemID3 = tbItem[nItemIdx][4];
	if DelItem(nID1,nID2,nID3,nNeedItemNum) == 1 then
		AddItem(nItemID1,nItemID2,nItemID3,1);
		Msg2Player("B¹n ®æi "..nNeedItemNum.."c¸i"..szNeedItemName.."®æi "..szItemName);
		WriteLog(LOG_HEADER..GetName().."(m«n ph¸i:"..nFaction..") dïng "..nNeedItemNum.."c¸i"..szNeedItemName.." råi"..szItemName);
	end;
end;

function backroom_exchange_zhenpai()
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."Ng­¬i ph¶i gia nhËp l­u ph¸i tr­íc míi cã thÓ ®æi MËt tÞch trÊn ph¸i.");
		return 0;
	end;
	local nRoute = GetPlayerRoute();
	local nFaction = GetPlayerFaction();
	local nIdx = 0;
	local strtab = {};
	nIdx = TB_BOOK_REQUIRE[1][1];			
	tinsert(strtab,"@ "..TB_BOOK_LIST[nRoute][1][1].."(cÇn "..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[1][2].." )/#backroom_exchange_zhenpai_ask(1)");
	nIdx = TB_BOOK_REQUIRE[2][1];
	tinsert(strtab,"@ "..TB_BOOK_LIST[nRoute][2][1].."(cÇn "..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[2][2].." )/#backroom_exchange_zhenpai_ask(2)");
	nIdx = TB_BOOK_REQUIRE[3][1];
	tinsert(strtab,"@ "..TB_BOOK_LIST[nRoute][3][1].."(cÇn "..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[3][2].." )/#backroom_exchange_zhenpai_ask(3)");
	tinsert(strtab,"Kh«ng ®æi/nothing");
	Say(szInforHeader.."Ng­¬i muèn ®æi cuèn nµo?",getn(strtab),strtab);	
end

function backroom_exchange_zhenpai_ask(nType)
	local szInforHeader = backroom_get_infoheader();
	local nRoute = GetPlayerRoute();
	local nFaction = GetPlayerFaction();
	local nIdx = TB_BOOK_REQUIRE[nType][1];
	if GetItemCount(TB_TOTEM_INFO[nFaction][nIdx][1],TB_TOTEM_INFO[nFaction][nIdx][2],TB_TOTEM_INFO[nFaction][nIdx][3]) < TB_BOOK_REQUIRE[nType][2] then
		Talk(1,"",szInforHeader.."§æi"..TB_BOOK_LIST[nRoute][nType][1].."CÇn"..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[nType][2].." , trªn ng­êi ng­¬i kh«ng ®ñ.");
		return 0;
	end	
	Say(szInforHeader.."Ng­¬i dïng <color=yellow>"..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[nType][2].." <color> ®æi <color=yellow>"..TB_BOOK_LIST[nRoute][nType][1].."<color> chø?",
			3,
			"§­îc/#backroom_exchange_zhenpai_confirm("..nType..")",
			"Kh«ng, ta nhÇm!/backroom_exchange_zhenpai",
			"Kh«ng ®æi/nothing")	
end

function backroom_exchange_zhenpai_confirm(nType)
	local szInforHeader = backroom_get_infoheader();
	local nRoute = GetPlayerRoute();
	local nFaction = GetPlayerFaction();
	local nIdx = TB_BOOK_REQUIRE[nType][1];
	if GetItemCount(TB_TOTEM_INFO[nFaction][nIdx][1],TB_TOTEM_INFO[nFaction][nIdx][2],TB_TOTEM_INFO[nFaction][nIdx][3]) < TB_BOOK_REQUIRE[nType][2] then
		Talk(1,"",szInforHeader.."§æi"..TB_BOOK_LIST[nRoute][nType][1].."CÇn"..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[nType][2].." , trªn ng­êi ng­¬i kh«ng ®ñ.");
		return 0;
	end	
	if gf_JudgeRoomWeight(1,50,szInforHeader) == 0 then
		return 0;
	end;  
	if DelItem(TB_TOTEM_INFO[nFaction][nIdx][1],TB_TOTEM_INFO[nFaction][nIdx][2],TB_TOTEM_INFO[nFaction][nIdx][3],TB_BOOK_REQUIRE[nType][2]) == 1 then
		AddItem(TB_BOOK_LIST[nRoute][nType][2],TB_BOOK_LIST[nRoute][nType][3],TB_BOOK_LIST[nRoute][nType][4],1);
		Msg2Player("B¹n nhËn ®­îc "..TB_BOOK_LIST[nRoute][nType][1]);
		WriteLog(LOG_HEADER..GetName().."(m«n ph¸i:"..nFaction..") dïng "..TB_BOOK_REQUIRE[nType][2].."c¸i"..TB_TOTEM_INFO[nFaction][nIdx][4].." råi"..TB_BOOK_LIST[nRoute][nType][1]);
	end
end

function backroom_exchange_book(nPageNum,nItemType)
	local szInforHeader = backroom_get_infoheader();
	local tbList = backroom_exchange_book_list(nItemType);
	local selTab = {};
	local nItemNum = getn(tbList);
	local nItemPerPage = 5;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--Õâ¸öº¯ÊýÊÇÓÃÀ´»ñµÃµ±Ç°Ò³ÊýµÄ×î´óÏÔÊ¾ÏîÄ¿ÊýµÄ
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nItemNum);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("Trang tr­íc \n /#backroom_exchange_book(%d,%d)",nPageNum-1,nItemType));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbList[i]);
	end;
	if nPageNum ~= ceil(nItemNum/nItemPerPage) then
		tinsert(selTab,format("\n Trang sau/#backroom_exchange_book(%d,%d)",nPageNum+1,nItemType));	
	end;
	tinsert(selTab,"\n §Ó ta suy nghÜ/nothing");
	Say(szInforHeader.."Ng­¬i muèn ®æi vËt phÈm nµo d­íi ®©y?",getn(selTab),selTab);
end;

function backroom_exchange_book_list(nItemType)
	local tbItem = TB_FACTION_ITEM[nItemType];
	local tbRetTb = {};
	for i=1,getn(tbItem) do
		tinsert(tbRetTb,tbItem[i][1].."/#backroom_exchange_book_item("..nItemType..","..i..")");
	end;
	return tbRetTb;
end;

function backroom_exchange_book_item(nItemType,nItemIdx)
	local szInforHeader = backroom_get_infoheader();
	local tbItem = TB_FACTION_ITEM[nItemType];
	local szItemName = tbItem[nItemIdx][1];
	local nFaction = GetPlayerFaction();
	local nNeedItemNum = 120;
	local nTotemType = tbItem[0][1];
	local szNeedItemName = TB_TOTEM_INFO[nFaction][nTotemType][4];
	local selTab = {
				"§ång ý/#backroom_exchange_book_item_confirm("..nItemType..","..nItemIdx..")",
				"Hñy bá/nothing",
				}
	Say(szInforHeader.."Ng­¬i muèn ®æi <color=yellow>"..szItemName.."<color>? CÇn ph¶i cã <color=yellow>"..nNeedItemNum.."c¸i"..szNeedItemName.." vµ 2000 vµng<color>.",getn(selTab),selTab);
end;

function backroom_exchange_book_item_confirm(nItemType,nItemIdx)
	local szInforHeader = backroom_get_infoheader();
	local tbItem = TB_FACTION_ITEM[nItemType];
	local nNeedItemNum = 120;
	local nTotemType = tbItem[0][1];
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",szInforHeader.."Ng­êi v« m«n v« ph¸i kh«ng ®­îc ®æi vËt phÈm nµy.");
		return 0;
	end;
	local szNeedItemName = TB_TOTEM_INFO[nFaction][nTotemType][4];
	local nID1 = TB_TOTEM_INFO[nFaction][nTotemType][1];
	local nID2 = TB_TOTEM_INFO[nFaction][nTotemType][2];
	local nID3 = TB_TOTEM_INFO[nFaction][nTotemType][3];
	local nCurItemNum = GetItemCount(nID1,nID2,nID3);
	if nCurItemNum < nNeedItemNum then
		Talk(1,"",szInforHeader.."Ng­¬i cÇn <color=yellow>"..nNeedItemNum.."c¸i"..szNeedItemName.."<color> míi cã thÓ ®æi vËt phÈm nµy.");
		return 0;
	end;
	if GetCash() < 20000000 then
		Talk(1,"",szInforHeader.."Ng­¬i ph¶i cã <color=yellow>2000 vµng<color> míi cã thÓ ®æi vËt phÈm nµy.");
		return 0;
	end
	if gf_JudgeRoomWeight(1,15,szInforHeader) == 0 then
		return 0;
	end;
	local szItemName = tbItem[nItemIdx][1];
	local nItemID1 = tbItem[nItemIdx][2];
	local nItemID2 = tbItem[nItemIdx][3];
	local nItemID3 = tbItem[nItemIdx][4];
	if DelItem(nID1,nID2,nID3,nNeedItemNum) == 1 and Pay(20000000) == 1 then
		AddItem(nItemID1,nItemID2,nItemID3,1);
		Msg2Player("B¹n ®æi "..nNeedItemNum.."c¸i"..szNeedItemName.." vµ 2000 vµng ®æi "..szItemName);
		WriteLog(LOG_HEADER..GetName().."(m«n ph¸i:"..nFaction..") dïng "..nNeedItemNum.."c¸i"..szNeedItemName.." vµ 2000 vµng ®æi "..szItemName);
	end;
end;

function backroom_exchange_attack()
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."Ng­¬i ph¶i gia nhËp l­u ph¸i tr­íc míi cã thÓ ®iÒu chØnh lùc ®¸nh vò khÝ s­ m«n.");
		return 0;
	end;	
	local strtab = {
			". Ta muèn ®iÒu chØnh vò khÝ trang bÞ s­ m«n 4/#backroom_exchange_attack_ask(4)",
			". Ta muèn ®iÒu chØnh vò khÝ trang bÞ s­ m«n 5/#backroom_exchange_attack_ask(5)",
			"§Ó ta nghÜ l¹i/nothing"
	};
	Say(szInforHeader.."Ng­¬i muèn dïng 1 Tinh LuyÖn B¨ng Th¹ch ®Ó ®iÒu chØnh lùc ®¸nh cña vò khÝ trang bÞ s­ m«n 4, 5 kh«ng? Sau khi ®iÒu chØnh gi÷ l¹i ®é c­êng hãa cña vò khÝ, §Þnh Hån, lùc ®¸nh cña vò khÝ sÏ ngÉu nhiªn. Chó ý, vò khÝ khãa hoÆc khãa hån kh«ng thÓ ®iÒu chØnh, khi ®iÒu chØnh cÇn ph¶i mang trang bÞ vò khÝ lªn ng­êi.",getn(strtab),strtab);
end

function backroom_exchange_attack_ask(nType)
	local szInforHeader = backroom_get_infoheader();
	if GetItemCount(2,1,533) < 1 then
		Talk(1,"",szInforHeader.."§iÒu chØnh lùc ®¸nh cña vò khÝ cÊn 1 Tinh LuyÖn B¨ng Th¹ch, trªn ng­êi ng­¬i kh«ng cã.");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nID2,nID3 = 0,0;
	local tbWeaponID2 = {nil,5,8,0,nil,1,nil,2,10,nil,0,5,nil,2,9,nil,6,4,nil,7,11};
	nID2 = tbWeaponID2[nRoute];
	if nRoute == 8 or nRoute == 9 then	--¶ëáÒÌØÊâ´¦Àí
		nID3 = nRoute*100+(nType-1)*10+nBody-2;
	else
		nID3 = nRoute*100+(nType-1)*10+nBody;
	end;
	local nIndex = GetPlayerEquipIndex(2);
	local nQianghua = GetEquipAttr(nIndex,2);--»ñÈ¡ÎïÆ·Ç¿»¯µÈ¼¶
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --»ñÈ¡×°±¸ÊÇ·ñ¶¨»ê
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --»ñÈ¡ÊÇ·ñËø¶¨	
	local nEquipId1,nEquipId2,nEquipId3 = GetPlayerEquipInfo(2); --»ñÈ¡×°±¸id	
	if nRoute == 2 then	--¸ÃËÀµÄÉÙÁÖË×¼Ò
		if nEquipId1 ~= 0 or (nEquipId2 ~= 3 and nEquipId2 ~= 5) or nEquipId3 ~= nID3 then
			if nType == 4 then
				Talk(1,"","Ng­¬i chän ®iÒu chØnh lùc ®¸nh vò khÝ trang bÞ s­ m«n 4, trªn ng­êi ng­¬i hiÖn kh«ng ph¶i.");
				return 0;
			elseif nType == 5 then
				Talk(1,"","Ng­¬i chän ®iÒu chØnh lùc ®¸nh vò khÝ trang bÞ s­ m«n 5, trªn ng­êi ng­¬i hiÖn kh«ng ph¶i.");
				return 0;				
			end
		end
	else
		if nEquipId1 ~= 0 or nEquipId2 ~= nID2 or nEquipId3 ~= nID3 then
			if nType == 4 then
				Talk(1,"","Ng­¬i chän ®iÒu chØnh lùc ®¸nh vò khÝ trang bÞ s­ m«n 4, trªn ng­êi ng­¬i hiÖn kh«ng ph¶i.");
				return 0;
			elseif nType == 5 then
				Talk(1,"","Ng­¬i chän ®iÒu chØnh lùc ®¸nh vò khÝ trang bÞ s­ m«n 5, trªn ng­êi ng­¬i hiÖn kh«ng ph¶i.");
				return 0;				
			end
		end
	end
	if nLock == 1 then
		Talk(1,"","Trang bÞ trªn ng­êi ng­¬i ®· khãa, cÇn më khãa míi cã thÓ th¨ng cÊp.");
		return
	end
	local nItemName = GetItemName(nIndex);
	Say(szInforHeader.."Ng­¬i sö dông 1 Tinh LuyÖn B¨ng Th¹ch ®Ó ®iÒu chØnh lùc ®¸nh cña <color=yellow>"..nItemName.."<color> ph¶i kh«ng?",
		3,
		"§­îc/#backroom_exchange_attack_confirm("..nType..")",
		"Kh«ng, ta nhÇm!/backroom_exchange_attack",
		"§Ó ta nghÜ l¹i/nothing")	
end

function backroom_exchange_attack_confirm(nType)
	local szInforHeader = backroom_get_infoheader();
	if GetItemCount(2,1,533) < 1 then
		Talk(1,"",szInforHeader.."§iÒu chØnh lùc ®¸nh cña vò khÝ cÊn 1 Tinh LuyÖn B¨ng Th¹ch, trªn ng­êi ng­¬i kh«ng cã.");
		return 0;
	end
	if gf_JudgeRoomWeight(1,200,szInforHeader) == 0 then
		return 0;
	end;	
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nID2,nID3 = 0,0;
	local tbWeaponID2 = {nil,5,8,0,nil,1,nil,2,10,nil,0,5,nil,2,9,nil,6,4,nil,7,11};
	nID2 = tbWeaponID2[nRoute];
	if nRoute == 8 or nRoute == 9 then	--¶ëáÒÌØÊâ´¦Àí
		nID3 = nRoute*100+(nType-1)*10+nBody-2;
	else
		nID3 = nRoute*100+(nType-1)*10+nBody;
	end;		
	local nIndex = GetPlayerEquipIndex(2);
	local nQianghua = GetEquipAttr(nIndex,2);--»ñÈ¡ÎïÆ·Ç¿»¯µÈ¼¶
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --»ñÈ¡×°±¸ÊÇ·ñ¶¨»ê
	local nEquipId1,nEquipId2,nEquipId3 = GetPlayerEquipInfo(2); --»ñÈ¡×°±¸id	
	if DelItemByIndex(nIndex,-1) == 1 and DelItem(2,1,533,1) == 1 then
		local nAddFlag,nItemIdx = AddItem(nEquipId1,nEquipId2,nEquipId3,1,1,-1,-1,-1,-1,-1,-1,0,nQianghua);
		if nDing == 1 then
			SetItemSpecialAttr(nItemIdx,"DING7",1); --¶¨»ê
		end
		Msg2Player("Lùc ®¸nh cña vò khÝ ®· ®iÒu chØnh.");
	end
end

TB_FACTION_ITEM = 
{
	[1] = --Ê¦ÃÅÃØ¼®
	{
		[0] = {1,60},	--ËùÐèÎïÆ·µÈ¼¶ºÍÊýÁ¿
		[1] = {"Kim Cang Phôc Ma kinh (ThiÕu L©m tôc gia)",0,107,1},	
		[2] = {"V« TrÇn MËt tÞch (ThiÕu L©m thiÒn t¨ng)",0,107,5},	
		[3] = {"TiÒm Long MËt tÞch (ThiÕu L©m vâ t¨ng)",0,107,3},	
		[4] = {"Thiªn La MËt TÞch (§­êng M«n)",0,107,7},	
		[5] = {"Nh­ ý MËt TÞch (Nga My phËt gia)",0,107,9},	
		[6] = {"BÝch H¶i Phæ (Nga My tôc gia)",0,107,11},
		[7] = {"Hçn §én MËt tÞch (C¸i Bang tÞnh y)",0,107,13},	
		[8] = {"Quý Thiªn MËt tÞch (C¸i Bang « y)",0,107,15},	
		[9] = {"HuyÒn ¶nh MËt tÞch (Vâ §ang ®¹o gia)",0,107,17},	
		[10] = {"Qu©n Tö MËt tÞch (Vâ §ang tôc gia)",0,107,19},	
		[11] = {"TrÊn Qu©n MËt tÞch (D­¬ng M«n th­¬ng kþ)",0,107,21},	
		[12] = {"Xuyªn V©n MËt tÞch (D­¬ng M«n cung kþ)",0,107,23},	
		[13] = {"U Minh Quû Lôc (Ngò §éc tµ hiÖp)",0,107,25},	
		[14] = {"Linh Cæ MËt tÞch (Ngò §éc cæ s­)",0,107,27},
	},
 	[2] = 	--Ê¦ÃÅÐÄ·¨
	{
		[0] = {1,60},
		[1] = {"Kim Cang Phôc Ma T©m Ph¸p (ThiÕu L©m tôc gia)",0,107,2},	
		[2] = {"V« TrÇn T©m Ph¸p (ThiÕu L©m thiÒn t¨ng)",0,107,6},	
		[3] = {"TiÒm Long T©m Ph¸p (ThiÕu L©m vâ t¨ng)",0,107,4},
		[4] = {"Thiªn La T©m Ph¸p (§­êng M«n)",0,107,8},	
		[5] = {"Nh­ ý T©m Ph¸p (Nga My phËt gia)",0,107,10},
		[6] = {"BÝch H¶i T©m Ph¸p (Nga My tôc gia)",0,107,12},
		[7] = {"Hçn §én T©m Ph¸p (C¸i Bang tÞnh y)",0,107,14},
		[8] = {"Quý Thiªn T©m Ph¸p (C¸i Bang « y)",0,107,16},		
		[9] = {"HuyÒn ¶nh T©m Ph¸p (Vâ §ang ®¹o gia)",0,107,18},	
		[10] = {"Qu©n Tö T©m Ph¸p (Vâ §ang tôc gia)",0,107,20},
		[11] = {"TrÊn Qu©n T©m Ph¸p (D­¬ng M«n th­¬ng kþ)",0,107,22},	
		[12] = {"Xuyªn V©n T©m Ph¸p (D­¬ng M«n cung kþ)",0,107,24},	
		[13] = {"U Minh T©m Ph¸p (Ngò §éc tµ hiÖp)",0,107,26},
		[14] = {"Linh Cæ T©m Ph¸p (Ngò §éc cæ s­)",0,107,28},	
	},
	[3] = 	--ÃÅÅÉ¾÷Òª°ü
	{
		[0] = {1,80},
		[1] = {"Tói bÝ kiÕp ThiÕu L©m",2,0,607},	
		[2] = {"Tói bÝ kiÕp Vâ §ang",2,0,611},
		[3] = {"Tói bÝ kiÕp Nga My",2,0,609},	
		[4] = {"Tói bÝ kiÕp C¸i Bang",2,0,610},	
		[5] = {"Tói bÝ kiÕp §­êng M«n",2,0,608},		
		[6] = {"Tói bÝ kiÕp D­¬ng M«n",2,0,612},	
		[7] = {"Tói bÝ kiÕp Ngò §éc",2,0,613},	
	},
	[4] = --¸ß¼¶Ê¦ÃÅÃØ¼®
	{
		[0] = {3,600},
		[1] = {"Kim Cang Ban Nh· Kinh (ThiÕu L©m tôc gia)",0,107,166},
		[2] = {"V« TrÇn Bå §Ò Kinh (ThiÕu L©m thiÒn t¨ng)",0,107,168},	
		[3] = {"TiÒm Long TÞch DiÖt Kinh (ThiÕu L©m vâ t¨ng)",0,107,167},
		[4] = {"Thiªn La Liªn Ch©u Lôc (§­êng M«n)",0,107,169},	
		[5] = {"Nh­ ý Kim §Ønh MËt TÞch (Nga My phËt gia)",0,107,170},
		[6] = {"BÝch H¶i TuyÖt ¢m Phæ (Nga My tôc gia)",0,107,171},
		[7] = {"Hçn §én TrÊn Nh¹c MËt TÞch (C¸i Bang tÞnh y)",0,107,172},
		[8] = {"Quý Thiªn Du Long MËt TÞch (C¸i Bang « y)",0,107,173},		
		[9] = {"HuyÒn ¶nh Mª Tung MËt TÞch (Vâ §ang ®¹o gia)",0,107,174},	
		[10] = {"Qu©n Tö TiÖt Phong MËt TÞch (Vâ §ang tôc gia)",0,107,175},
		[11] = {"TrÊn Qu©n Phi Long Th­¬ng Phæ (D­¬ng M«n th­¬ng kþ)",0,107,176},	
		[12] = {"Xuyªn V©n L¹c Hång MËt TÞch (D­¬ng M«n cung kþ)",0,107,177},	
		[13] = {"U Minh Phong Ma Lôc (Ngò §éc tµ hiÖp)",0,107,178},
		[14] = {"Linh Cæ HuyÒn Tµ Lôc (Ngò §éc cæ s­)",0,107,179},			
	},
}