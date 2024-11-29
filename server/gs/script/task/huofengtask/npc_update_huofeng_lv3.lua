Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function main()
	npc_talk_main()
end

function npc_talk_main()
	local tbSay = {}
	if check_condition(0)==1 then 
		--tinsert(tbSay, format("%s/call_fight_npc", "ÕÙ»½öÌ½ğ±¾Ìå"))
		tinsert(tbSay, format("%s/update_lv3", "Th¨ng cÊp vò khİ")) 
	end
	tinsert(tbSay, format("%s/iwant_leave", "Rêi khái V¹n Linh §µi"))
	tinsert(tbSay, format("%s/no", "KÕt thóc ®èi tho¹i"))
	local szMsg = format("%s:%s", "<color=green>Háa Phông Tö<color>", "Chµo mõng ®Õn víi V¹n Linh §µi. Chóc b¹n n©ng cÊp vò khİ thµnh c«ng.")
	Say(szMsg,getn(tbSay),tbSay)
end

T_NEED_ITEM = {
	{"Thiªn Kiªu LÖnh",2,97,236,1},
}

function update_lv3()
	local tbSay = {}
	tinsert(tbSay, format("%s/about_update_lv3", "Néi dung cÇn chó ı khi n©ng cÊp"))
	tinsert(tbSay, format("%s/about_huanghuozhixin", "Nguån gèc cña Hoang Háa Chi T©m"))
	tinsert(tbSay, format("%s/about_huanghuoliujin", "Nguån gèc cña Hoang Háa L­u Kim"))
	tinsert(tbSay, format("%s/iwant_update_lv2", "Ta muèn n©ng cÊp vò khİ Háa Phông cÊp 2 "))
	tinsert(tbSay, format("%s/iwant_update_lv3", "Ta muèn n©ng cÊp vò khİ Háa Phông cÊp 3 "))
	tinsert(tbSay, format("%s/no", "KÕt thóc ®èi tho¹i"))
	local szMsg = format("%s:%s", "<color=green>Háa Phông Tö<color>", "Chµo mõng ®Õn víi V¹n Linh §µi. Chóc b¹n n©ng cÊp vò khİ thµnh c«ng.")
	Say(szMsg,getn(tbSay),tbSay)
end

function about_update_lv3()
	local tbSay = {}
	tinsert(tbSay, format("%s/npc_talk_main", "trë l¹i"))
	tinsert(tbSay, format("%s/no", "KÕt thóc ®èi tho¹i"))
	local szTemp = "N©ng cÊp vò khİ Háa Phông cÊp 2 thµnh vò khİ Háa Phông cÊp 3,cÇn trang bŞ vò khİ Háa Phông +7 trë lªn cÊp 2 trªn ng­êi"
	--szTemp = format("%s\n%s", szTemp, "½«¾üÎäÆ÷£ºÏûºÄ10Ììî¸Áî£¬20ÌìÃÅ½ğÁî£¬200À×»¢¾«ÆÇ£¬3»Ä»ğÖ®ĞÄ")
	--szTemp = format("%s\n%s", szTemp, "ÔªË§ÎäÆ÷£ºÏûºÄ30Ììî¸Áî£¬60ÌìÃÅ½ğÁî£¬600À×»¢¾«ÆÇ£¬9»Ä»ğÖ®ĞÄ")
	local szMsg = format("%s:%s", "<color=green>Háa Phông Tö<color>", szTemp)
	Say(szMsg,getn(tbSay),tbSay)
end

function iwant_leave()
	local tbSay = {}
	tinsert(tbSay, format("%s/sure_leave", "Rêi khái"))
	tinsert(tbSay, format("%s/npc_talk_main", "trë l¹i"))
	tinsert(tbSay, format("%s/no", "KÕt thóc ®èi tho¹i"))
	local szTemp = "X¸c nhËn rêi khái V¹n Linh §µi quay vÒ C«n L«n kh«ng??"
	local szMsg = format("%s:%s", "<color=green>Háa Phông Tö<color>", szTemp)
	Say(szMsg,getn(tbSay),tbSay)
end

function sure_leave()
	if GetTeamSize() > 1 then
    	if GetName() ~= GetCaptainName() then
    		Talk(1,"",g_NpcName.."ChØ cã ®éi tr­ëng míi ®­îc thao t¸c");
    		return 0;
    	end
	end
	gf_TeamOperateEX(do_leave)
end

function do_leave()
	NewWorld(509, 1586, 3117)
	SetFightState(0)
end

function about_huanghuozhixin()
	local tbSay = {}
	tinsert(tbSay, format("%s/npc_talk_main", "trë l¹i"))
	tinsert(tbSay, format("%s/no", "KÕt thóc ®èi tho¹i"))
	local szTemp = "Mçi nh©n vËt cÇn hoµn thµnh nhiÖm vô sö thi vò khİ Háa Phông tr­íc, sao ®ã vµo V¹n Linh §µi sö dông ®¹o cô Hoang Háa L­u Kim, triÖu håi boss Hoang Háa L­u Kim (Ch©n th©n). Sau khi ®¸nh b¹i Hoang Háa L­u Kim (Ch©n th©n), sÏ nhËn ®­îc 1 Hoang Háa Chi T©m. Mçi nh©n vËt trong vßng 1 tuÇn tiªu diÖt Hoang Háa L­u Kim (Ch©n th©n) sÏ nhËn ®­îc 1 Hoang Háa Chi T©m, tuÇn ®ã sÏ kh«ng thÓ nhËn ®­îc Hoang Háa Chi T©m n÷a."
	local szMsg = format("%s:%s", "<color=green>Háa Phông Tö<color>", szTemp)
	Say(szMsg,getn(tbSay),tbSay)
end

function about_huanghuoliujin()
	local tbSay = {}
	tinsert(tbSay, format("%s/npc_talk_main", "trë l¹i"))
	tinsert(tbSay, format("%s/no", "KÕt thóc ®èi tho¹i"))
	local szTemp = "Tham gia Th¸i NhÊt Th¸p-Th­êng hoÆc Anh Hïng, tiªu diÖt boss Hoang Háa L­u Kim sÏ cã c¬ héi nhËn ®­îc ®¹o cô Hoang Háa L­u Kim."
	local szMsg = format("%s:%s", "<color=green>Háa Phông Tö<color>", szTemp)
	Say(szMsg,getn(tbSay),tbSay)
end

function iwant_update_lv2()
	if check_condition(1)~=1 then return end
	
	local tbSay = {}
	tinsert(tbSay, format("%s/confirm_update_lv2", "Ta muèn n©ng cÊp"))
	tinsert(tbSay, format("%s/npc_talk_main", "trë l¹i"))
	tinsert(tbSay, format("%s/no", "KÕt thóc ®èi tho¹i"))
	local szMsg = format("%s:%s", "<color=green>Háa Phông Tö<color>", "N©ng cÊp vò khİ háa phông cÊp 1 thµnh vò khİ háa phông cÊp 2, cÇn trang bŞ vò khİ háa phông cÊp 1 trªn ng­êi.")
	Say(szMsg,getn(tbSay),tbSay)
end

function confirm_update_lv2()
	--print("confirm_update_lv2")
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", 3054, "N©ng cÊp vò khİ Háa Phông cÊp 1"))
end

function iwant_update_lv3()
	if check_condition(1)~=1 then return end
	local tbSay = {}
	tinsert(tbSay, format("%s/confirm_update_lv3", "Ta muèn n©ng cÊp"))
	tinsert(tbSay, format("%s/npc_talk_main", "trë l¹i"))
	tinsert(tbSay, format("%s/no", "KÕt thóc ®èi tho¹i"))
	local szMsg = format("%s:%s", "<color=green>Háa Phông Tö<color>", "Chóc b¹n chÕ t¹o vò khİ thµnh c«ng.")
	Say(szMsg,getn(tbSay),tbSay)
end

function confirm_update_lv3()
	--print("confirm_update_lv3")
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", 3053, "N©ng cÊp vò khİ Háa Phông cÊp 2"))
end

function check_condition(bNotify)
	if tGtTask:check_task_isfinish(270) ~= 1 then
		if bNotify==1 then
			Talk(1,"","Hoµn thµnh chuçi nhiÖm vô Háa Phông míi ®­îc n©ng cÊp!")
		end
		return 0
	end
	return 1
end
