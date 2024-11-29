Include("\\script\\global\\¼¼ÄÜÊ÷²Ù×÷.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

Include("\\script\\task\\faction\\faction_main_tm.lua"); -- ÌÆÃÅÊ¦ÃÅÈÎÎñµÄ½Å±¾Í·ÎÄ¼ş
--¼¼ÄÜÁĞ±í
SKILLS={
--ÌÆÃÅ
--ÌÆÃÅ°µÆ÷ (¼¼ÄÜid=58)
[1872]={
     --{¹Ø¼üµãÊı£¬Ç°Ìá¼¼ÄÜÊı£¬Ç°Ìá¼¼ÄÜ¹ØÏµ£¨Óë£º1£¬»ò£º0£©£¬Ç°Ìá¼¼ÄÜ1£¬Ç°Ìá¼¼ÄÜ1µÈ¼¶£¬...}
     levelless={3,0,0,},
     --¹Ø¼üµã£¨¼¼ÄÜµÈ¼¶£¬Íæ¼ÒµÈ¼¶£¬Íæ¼Ò¾­Ñé£¬ÃÅÅÉ¹±Ï×¶È}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--°µÆ÷ÖÆ×÷Êõ (¼¼ÄÜid=59)
[1873]={
     levelless={3,1,0,60,1},
     [1]={1,14,3000,50},
     [2]={2,16,500,50},
     [3]={9,30,0,50},
     	},
[1874]={
     levelless={3,1,0,60,1},
     [1]={1,14,3000,50},
     [2]={2,16,500,50},
     [3]={9,30,0,50},
     	},
--ĞÄÑÛ (¼¼ÄÜid=60)
[1875]={
     levelless={3,1,0,58,1},
     [1]={1,10,1000,0},
     [2]={2,13,500,0},
     [3]={7,28,0,0},
       },
--×·ĞÄ¼ı (¼¼ÄÜid=65)
[1876]={
     levelless={3,1,0,59,3},
     [1]={1,25,15000,200},
     [2]={2,28,5000,200},
     [3]={6,40,0,200},
     },
--ÇïºÁÃ÷²é (¼¼ÄÜid=66)
[1877]={
     levelless={3,1,0,63,2},
     [1]={1,27,18000,300},
     [2]={2,30,6000,300},
     [3]={6,42,0,300},
     },
--´©ĞÄ´Ì (¼¼ÄÜid=67)
[1878]={
     levelless={3,1,0,64,2},
     [1]={1,30,27000,500},
     [2]={2,33,9000,500},
     [3]={7,48,0,500},
     },
--´ã¶¾ÃØÊõ (¼¼ÄÜid=68)
[1879]={
     levelless={3,1,0,62,4},
     [1]={1,34,45000,500},
     [2]={2,38,15000,500},
     [3]={5,50,0,500},
     },
--±©ÓêÀæ»¨Õë (¼¼ÄÜid=70)
[1880]={
     levelless={3,1,0,65,4},
     [1]={1,40,90000,700},
     [2]={2,43,30000,700},
     [3]={7,58,0,700},
     },
--º¬É³ÉäÓ° (¼¼ÄÜid=71)
[1881]={
     levelless={3,1,0,68,2},
     [1]={1,45,160000,800},
     [2]={2,48,50000,800},
     [3]={6,60,0,800},
     },
--ËøÃüÕë (¼¼ÄÜid=72)
[1882]={
     levelless={3,2,0,67,5,69,3},
     [1]={1,50,280000,1000},
     [2]={2,53,90000,1000},
     [3]={7,68,0,1000},
     },
--ÂúÌì»¨Óê (¼¼ÄÜid=73)
[1883]={
     levelless={3,1,0,70,4},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--ÎüĞÇÕó (¼¼ÄÜid=74)
[74]={
     levelless={5,3,1,73,7,71,6,72,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}

function showlimit(n)	--Ê¦ÃÅËµ»°
--	if n==1 then
--		Say("<color=green>ÌÆÌìĞ¥<color>£ºÄãµÄÎä¹¦¾«½øÁË£¡",0)
	if n==2 then
		Say("Ng­¬i ch­a ®ñ ®¼ng cÊp ®Ó häc vâ c«ng míi, h·y rÌn luyÖn thªm råi h·y quay l¹i?",0)
	elseif n==3 then
		Say("Ng­¬i ch­a ®ñ kinh nghiÖm ®Ó häc vâ c«ng míi, h·y rÌn luyÖn thªm h·y quay l¹i?",0)
	elseif n==4 then
		Say("Ng­¬i ch­a ®ñ ®iÓm danh väng ®Ó häc vâ c«ng míi, h·y lµm vµi nhiÖm vô ®Ó tİch lòy ®iÓm danh väng!",0)
	elseif n==5 then
		Say("Vâ c«ng vi s­ d¹y ng­¬i ch­a luyÖn thµnh kh«ng thÓ häc vâ c«ng míi!",0)
	elseif n==6 then
		Say("Ng­¬i kh«ng mang theo tiÒn, cã ph¶i ®Ó quªn ë r­¬ng chøa ®å?",0)
	else
	end
end;

function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","§· qu¸ 5 giê ch¬i, kh«ng thÓ häc vâ c«ng n÷a, h·y nghØ ng¬i ®Ó gi÷ g×n søc kháe!")
	 	return
	 end
	local nTaskValue = FN_GetTaskState(FN_TM)
	if (nTaskValue==1) then
		task_003();
		return
	elseif (nTaskValue<8) then
		Say("Tæng qu¶n Y d­îc phßng §­êng Xu©n ®ang chÕ mét lo¹i thuèc míi. H·y ®Õn ®ã xem thö.",0);
		return
	else
		Say("§· vµo hÖ ph¸i ta th× ®õng c©u nÖ lÖ cò nhµ §­êng, cø tïy ı hµnh tÈu giang hå. <color=yellow>Chñy thñ<color> lµ vò khİ së tr­êng cña ph¸i ta. Ta cã thÓ gióp g×?",
			4,
			"§Ö tö b¸i kiÕn s­ phô!/entertangmen",
			"Häc vâ c«ng §­êng M«n/skilllearn",
			-- "Ta nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i/change_mistery_book",
			"Kh«ng cã g×/no");
	end
	-- if GetPlayerFaction() == 5 and GetPlayerRoute() == 5 then
		-- get_in_route(5, 31);
		-- return 0;
	-- end
	-- master_main(5,31);
end;

-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================end====


function tangmenskill()		--²ì¿´¼¼ÄÜ
--µ¯½çÃæ
end;

function tedian()		--²ì¿´¼¼ÄÜ
Say("§· vµo hÖ ph¸i ta th× ®õng c©u nÖ lÖ cò nhµ §­êng, cø tïy ı hµnh tÈu giang hå. <color=yellow>Chñy thñ<color> lµ vò khİ së tr­êng cña ph¸i ta.",0)
end;


function entertangmen()		--¼ÓÈëÁ÷ÅÉ
	if GetPlayerFaction() ~= 5 then	--ÃÅÅÉ¼ì²â
		Say("Ng­¬i ph¶i ®­îc L·o l·o ®ång ı míi cã thÓ gia nhËp §­êng M«n, sau ®ã míi cã thÓ ®Õn t×m ta b¸i s­ häc nghÖ.",0)
	elseif   GetPlayerRoute() == 5 then	--Î´ÈëÁ÷ÅÉµÄ±¾ÃÅµÜ×Ó 
		-- if join_route_main(31) == 0 then
			-- return
		-- end
		Say("L·o l·o ®· ®ång ı! Giê ta chİnh thøc thu nhËn ng­¬i lµm ®Ö tö vµ gióp ng­¬i ®¶ th«ng kinh m¹ch, <color=yellow>tÈy l¹i tiÒm n¨ng<color>. Vâ c«ng hÖ ph¸i xem träng <color=yellow>søc m¹nh<color>, sau nµy ng­¬i h·y cè g¾ng. Giê ng­¬i cã thÓ ®Õn t×m L·o l·o nhËn <color=yellow>NhiÖm vô m«n ph¸i<color>.",0)
		SetPlayerRoute(31)	--Ö±½ÓÉèÖÃÁ÷ÅÉ
		LearnSkill(1872)
		LearnSkill(1873)
		AddItem(0,14,1,1,1,4,65,4,66)
		ResetProperty()        --Ï´Ç±ÄÜµã
		TaskTip("B¹n ®· trë thµnh ®Ö tö §­êng M«n!")
		TaskTip("B¹n ®· ®­îc tÈy l¹i ®iÓm tiÒm n¨ng!")
		TaskTip("B¹n ®· nhËp m«n! Cã thÓ ®Õn gÆp Ch­ëng m«n nhËn nhiÖm vô")
	else
	 	Say("H·y cè g¾ng luyÖn tËp, mai sau ph¸t d­¬ng quang ®¹i bæn m«n.",0)

	end
end;

function skilllearn()		--Ñ§Ï°¼¼ÄÜ
	if GetPlayerRoute() ~= 31 then	--ÃÅÅÉ¼ì²â
		Say("Ng­¬i kh«ng ph¶i ®Ö tö cña ta! Ta kh«ng thÓ d¹y ng­¬i.",0)
	else
		Say("Gãc ph¶i phİa d­íi biÓu t­îng vâ c«ng xuÊt hiÖn dÊu {v} biÓu thŞ cã thÓ häc vâ c«ng nµy, dÊu mòi tªn biÓu thŞ cã thÓ t¨ng cÊp, nhÊp trùc tiÕp vµo ®Ó t¨ng cÊp.",0)
		AllowLearnSkill()
	end
end;


function miying()
learnskill(1872)
end;

function shayi()
learnskill(1875)
end;

function linglung()
learnskill(1873)
end;

function lingxi()
learnskill(1874)
end;

function biluo()
learnskill(1876)
end;

function jinghong()
learnskill(1877)
end;

function qifeng()
learnskill(1878)
end;

function hundun()
learnskill(1879)
end;

function suimeng()
learnskill(1880)
end;

function liuxing()
learnskill(1881)
end;

function yanwu()
learnskill(1882)
end;

function tianying()
learnskill(1883)
end;


function no()
end;

function change_mistery_book_linshi()
		Say("Kh«ng ngê th«ng qua viÖc luyÖn thøc ng­¬i cã thÓ nhËn ®­îc MËt tŞch trÊn ph¸i, thËt xøng ®¸ng lµ ®å ®Ö cña bæn m«n. Nh­ng trÊn ph¸i vâ häc nµy ta còng ph¶i lÜnh ngé mét thêi gian míi cã thÓ truyÒn thô ®­îc, ng­¬i quay l¹i sau nhĞ!",0)
end;

function beforelearnskill(id)
	if (id == 74) then	--ÎüĞÇÕó
		if (GetSkillLevel("HÊp Tinh TrËn") <= 0) then
			return "\'HÊp Tinh TrËn\' lµ <color=red>TuyÖt häc trÊn ph¸i<color>, kh«ng ph¶i ®Ö tö bæn m«n th× kh«ng thÓ n¾m ®­îc."
		end
	end
end

function afterlearnskill(id)
	if (id == 74) then	--ÎüĞÇÕó
		if (GetSkillLevel("HÊp Tinh TrËn") == 1) then
			Say("ThiÕu hiÖp qu¶ nhiªn t­ chÊt th©m s©u, ®· b­íc ®Çu lÜnh ngé ®­îc \'HÊp Tinh TrËn\', thËt ®¸ng nÓ! <enter><color=green>Ng­êi ch¬i<color>: Nh­ng...s­ phô, t¹i sao khi con thö thi triÓn \'HÊp Tinh TrËn\', néi khİ ph©n t¸n, khã mµ thi triÓn? Nghe nãi Lôc M¹ch ThÇn KiÕm ë §o¹n ThŞ, ®· ao ­íc tõ l©u, h«m nay míi thö ®­îc. <enter>\'HÊp Tinh TrËn\' rÊt lîi h¹i, cho dï cã may m¾n häc ®­îc, muèn sö dông thµnh th¹o, ®ã kh«ng ph¶i lµ chuyÖn dÔ.", 1, "§ång ı/GiveMomentum")
		elseif (GetSkillLevel("HÊp Tinh TrËn") == 5) then
			Say("ThiÕu hiÖp qu¶ nhiªn t­ chÊt th«ng minh, \'HÊp Tinh TrËn\' ®· lÜnh héi ®­îc 5 phÇn. Cßn xa míi ®¹t ®Õn c¶nh giíi cao nhÊt. Lo¹i vâ c«ng nµy gåm 20 cÊp, 5 cÊp sau cÇn thiÕu hiÖp khæ luyÖn h¬n n÷a, 10 cÊp cuèi cÇn cã mËt tİch trÊn ph¸i míi lÜnh héi ®­îc.", 0)
		end
	end
end

function GiveMomentum()
	Say("Th«i ®­îc, ®Ó ta gióp ng­¬i thi triÓn \'HÊp Tinh TrËn\'. <enter><enter>RÊt l©u....<enter><enter>§­îc råi, s¸t khİ ®· h×nh thµnh, cã thÓ thö thi triÓn \'HÊp Tinh TrËn\'. TuyÖt häc trÊn ph¸i rÊt m¹nh, dïng ®Ó trõ gian diÖt b¹o, thay trêi hµnh ®¹o, kh«ng h¹i ng­êi v« téi...", 0)
	SetMomentum(10)
	RandomTaskTipEx("NhËn ®­îc 10 ®iÓm s¸t khİ s­ phô truyÒn cho", "momentumtip")
end

