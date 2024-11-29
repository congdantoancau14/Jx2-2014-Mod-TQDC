--Ö÷»î¶¯npc¶Ô»°Ñ¡Ïî
Include("\\script\\online_activites\\201505feedpet\\head.lua")
Include("\\script\\online_activites\\201505feedpet\\main.lua")

SZ_NPC_NAME="§¹i Sø ho¹t ®éng"
SZ_NPC_TITLE_1505="Chµo mõng tham gia ho¹t ®éng HuÊn luyÖn thó mïa hÌ"
T_MAIN_DIALOG_1505={
	format("%s/do_desc", "Giíi thiÖu ho¹t ®éng"),
	format("%s/do_get_tool", "NhËn Cßi Thó C­ng"),
	format("%s/#do_get_award(%d)", "NhËn th­ëng (HuÊn luyÖn thó c­ng th­êng)", 1),
	format("%s/#do_get_award(%d)", "NhËn th­ëng (HuÊn luyÖn thó c­ng hiÕm)", 2),
	format("%s/do_get_follower", "NhËn ®­îc 1 thó c­ng theo sau"),
}

function npc_talk_main_1505()
	if check_player_condition()~= 1 then
		return
	end
	local szTitle = format("%s:%s", SZ_NPC_NAME, "Chµo mõng tham gia ho¹t ®éng HuÊn luyÖn thó mïa hÌ")
	local tbSay = {}
	tinsert(tbSay, format("%s/do_desc", "Giíi thiÖu ho¹t ®éng"))
	tinsert(tbSay, format("%s/do_get_tool", "NhËn Cßi Thó C­ng"))
	
	tinsert(tbSay, format("%s/#do_get_award(%d)", "NhËn th­ëng (HuÊn luyÖn thó c­ng th­êng)", 1))
	tinsert(tbSay, format("%s/#do_get_award(%d)", "NhËn th­ëng (HuÊn luyÖn thó c­ng hiÕm)", 2))
	
	tinsert(tbSay, format("%s/do_get_follower", "NhËn ®­îc 1 thó c­ng theo sau"))
	tinsert(tbSay, format("%s/nothing", "Ra khái"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function do_desc()
	local szTitle = format("%s:%s", SZ_NPC_NAME, "Chµo mõng tham gia ho¹t ®éng HuÊn luyÖn thó mïa hÌ")
	local tbSay = {}
	tinsert(tbSay, format("%s/_desc1", "Giíi thiÖu huÊn luyÖn thó c­ng"))
	tinsert(tbSay, format("%s/_desc2", "Giíi thiÖu yÕn tiÖc ngoµi trêi"))
	if g_debug==1 then
		tinsert(tbSay, format("%s/on_daily_clear", "DailyReset"))
	end
	
	tinsert(tbSay, format("%s/npc_talk_main_1505", "trë l¹i"))
	tinsert(tbSay, format("%s/nothing", "Ra khái"))
	
	
	Say(szTitle, getn(tbSay), tbSay)
end

function _desc1()
	local szTitle = format("%s:%s", SZ_NPC_NAME, "Tõ 15/05 - 31/05, h»ng ngµy cã thÓ ®Õn chç cña l·o phu nhËn Cßi Thó C­ng-Th­êng, mçi ngµy cã thÓ huÊn luyÖn 5 Thó C­ng-Th­êng, khi ®é c­êng tr¸ng ®¹t 46 ®iÓm cã thÓ ®Õn chç cña ta ®Ó nhËn th­ëng. §óng råi, tói ®ùng vËt phÈm huÊn luyÖn thó c­ng ®· bÞ kÎ trém c­íp ®i, ng­¬i h·y ®Õn V­¬ng MÉu §éng 2 vµ 3, Sa M¹c Mª Cung lµ cã thÓ t×m ®­îc. NÕu ng­¬i c¶m thÊy phiÒn phøc th× cã thÓ vµo Ngù C¸c xem thö, trong ®ã cã vËt phÈm hiÕm cã ®Ó huÊn luyÖn thó c­ng, ngoµi ra Tiªn Qu¶ mµ c¸c thó c­ng yªu thÝch cã thÓ gióp b¹n mét tay.")
	local tbSay = {}
	
	tinsert(tbSay, format("%s/do_desc", "trë l¹i"))
	tinsert(tbSay, format("%s/nothing", "Ra khái"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function _desc2()
	local szTitle = format("%s:%s", SZ_NPC_NAME, "Tõ 15/05 - 31/05,  tõ 19:00-21:00 h»ng ngµy, l·o phu sÏ tæ chøc tiÖc ®Ó th­ëng cho c¸c hiÖp kh¸ch cã c«ng huÊn luyÖn thó c­ng, do sè l­îng hiÖp kh¸ch qu¸ nhiÒu nªn mçi ng­êi chØ cã 10 phót ®Ó ¨n tiÖc, tuy thêi gian kh«ng nhiÒu nh­ng còng ®õng quªn mang theo mü töu do l·o phu tÆng ®Ó nhËp tiÖc nhÐ!")
	local tbSay = {}
	
	tinsert(tbSay, format("%s/do_desc", "trë l¹i"))
	tinsert(tbSay, format("%s/nothing", "Ra khái"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function do_get_tool()
	local nAwardCnt = get_award_count(1)
	if nAwardCnt >= g_tFeedPet.nMaxFeedPetOneDay then
		Talk(1, "", format("Sè lÇn huÊn luyÖn thó c­ng cña h«m nay ®· ®¹t tèi ®a"))
		return
	end
	local t = g_tFeedPet.tToolItem[1]
	local ti = t[3]
	if BigGetItemCount(ti[1], ti[2], ti[3]) < 1 then
		AddItem(ti[1], ti[2], ti[3], 1)
	else
		Talk(1, "", format("§· cã Cßi Thó C­ng"))
	end
end

function do_get_award(nLevel)
	local nAwardCnt = get_award_count(nLevel)
	local ncurPoint = get_cur_point(nLevel)
	if nAwardCnt >= g_tFeedPet.nMaxFeedPetOneDay then
		Talk(1, "", format("Sè lÇn huÊn luyÖn thó c­ng cña h«m nay ®· ®¹t tèi ®a"))
		return
	end
	local t = g_tFeedPet.tToolItem[nLevel]
	local ti = t[3]
	if GetItemCount(ti[1], ti[2], ti[3]) < 1 then
		Talk(1, "", format("Ph¶i ch¨ng ®· quªn mang theo Cßi Thó C­ng råi?"))
		return
	end
	if ncurPoint ~=g_tFeedPet.nFeedTargetPoint then
		Talk(1, "", format("§é huÊn luyÖn hiÖn t¹i: %d/%d, ch­a hoµn thµnh", ncurPoint, g_tFeedPet.nFeedTargetPoint))
		return
	end
	
	if DelItem(ti[1], ti[2], ti[3], 1) ~= 1 then
		Talk(1, "", format("Ph¶i ch¨ng ®· quªn mang theo Cßi Thó C­ng råi?"))
		return
	end
	if gf_Judge_Room_Weight(2,100,"") ~= 1 then 
		return 0;
	end
	local tAward = g_tFeedPet.tMainAward[nLevel]
	gf_EventGiveRandAward(tAward.tRand, 10000, 1, "Ho¹t ®éng huÊn luyÖn thó", "1505activity");
	gf_EventGiveAllAward(tAward.tAll, "Ho¹t ®éng huÊn luyÖn thó", "1505activity");
	set_cur_point(nLevel, 0)
	set_award_count(nLevel, nAwardCnt + 1)
	Talk(1, "", format("§a t¹ c¸c h¹ gióp chóng t«i huÊn luyÖn thó c­ng, ®©y lµ thï lao xin h·y nhËn lÊy"))
end

function do_get_follower()
	rand_follower()
end
