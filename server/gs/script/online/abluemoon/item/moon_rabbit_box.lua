--½Å±¾Ãû³Æ£º¡°ÔÂÁÁÍÃÌú±¦Ïä¡±Ê¹ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£ºÊ¹ÓÃ¡°ÔÂÁÁÍÃÌú±¦Ïä¡±µÄ½±ÀøÔö¼Ó
--´úÂë±àĞ´ÈË£º´å³¤
--´úÂë±àĞ´Ê±¼ä£º2007-01-28
--ĞŞ¸Ä¼ÇÂ¼£ºĞ¡À¶´ò²¹¶¡
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
--============================¹«¹²±äÁ¿¶¨ÒåÇø============================
	moon_rabbit_box_prize_list = {
	--½±Àø¸ÅÂÊ--½±ÀøÀàĞÍ--½±Àøº¯Êı
	{353,2,"jue_bag_add()"},						--¾÷Òª°ü
	{250,2,"shimen_book()"},					--Ê¦ÃÅÃØ¼®
	{100,1,"Ngò Hµnh MËt TŞch",0,107,155},				--ÎåĞĞÃØ¼®
	{60,2,"labor_head_add()"},					--ÎåÒ»Í·
	{60,2,"labor_trouers_add()"},				--ÎåÒ»¿ã×Ó
	{60,2,"labor_weapon_add()"},					--ÎåÒ»ÎäÆ÷
	{40,1,"T­íng qu©n giíi chØ",0,102,21},					--½«¾ü½ä
	{20,1,"Ngùa 60%",0,105,12},					--ºöÀ×²µ
	{20,1,"Ngäc Thè D­îc Bao",0,102,41},				--ÔÂÁÁÍÃÒ©°ü				
	{15,1,"KhuÊt nguyÖt béi",0,102,27},				--ÇüÔ­ÓñÅå
	{5,1,"Bé C¶nh",0,105,13},					--²¼¾°
	{5,1,"§¹i lùc thÇn h¹ng liªn",0,102,28},				--´óÁ¦Éñ
	{4,1,"H»ng Nga NguyÖt Vò §ai",0,102,42},				--æÏ¶ğÎè´ø
	{4,1,"§«ng Ph­¬ng Long Ch©u",0,102,24},				--¶«·½ÁúÖé
	{4,1,"HËu nghÖ l¹c nhËt hoµn",0,102,43}				--ºóôàÂäÈÕ»·
	}
--=============================½Å±¾Ö÷Âß¼­Çø=============================


function OnUse(goods_index)
	Say("R­¬ng chøa ®ùng nhiÒu b¶o vËt thÊt truyÒn chèn vâ l©m",
	2,
	"Më r­¬ng/moon_rabbit_box_use",
	--"ÎÒÏë¿´¿´Ã¿ÖÖ±¦ÎïµÄ³öÏÖ¸ÅÂÊ/show_all",
	"KÕt thóc/end_dialog")
end


--****************************Ïä×ÓÈ·ÈÏÊ¹ÓÃº¯Êı**************************
function moon_rabbit_box_use()
	if Zgc_pub_goods_add_chk(1,300) ~= 1 then		--¿Õ¼ä/¸ºÖØÅĞ¶Ï
		Talk(1,"","Chóc mõng b¹n")
		return
	end
	if GetItemCount(2,0,606) == 0 then					--ÎïÆ·ÅĞ¶Ï
		Talk(1,"","Xui qu¸ nhËn l¹i th«i")
		return
	end
	if DelItem(2,0,606,1) ~= 1 then					--É¾³ıÎïÆ·ÅĞ¶Ï
		Talk(1,"","Ch¸n qu¸")
		return
	end
	local num_count = 0
	for i = 1,getn(moon_rabbit_box_prize_list) do
		num_count = num_count + moon_rabbit_box_prize_list[i][1]
	end
	local ran_num = random(1,num_count)
	for i = 1 ,getn(moon_rabbit_box_prize_list) do
		if ran_num <= moon_rabbit_box_prize_list[i][1] then
			if getn(moon_rabbit_box_prize_list[i]) > 3 then
				local add_flag = AddItem(moon_rabbit_box_prize_list[i][4],moon_rabbit_box_prize_list[i][5],moon_rabbit_box_prize_list[i][6],moon_rabbit_box_prize_list[i][2],1,-1,-1,-1,-1,-1,-1)
				--if add_flag == 1 then
					--Msg2Player("B¹n nhËn ®­îc"..moon_rabbit_box_prize_list[i][3].. "nhĞ")
					--Msg2SubWorld(GetName().."B¹n nhËn ®­îc"..moon_rabbit_box_prize_list[i][3].. "nhĞ")
					--WriteLog("[abluemoon]"..GetName().."B¹n nhËn ®­îc"..moon_rabbit_box_prize_list[i][3].."nhĞ")
				--else
					--WriteLog("[abluemoon]B¹n nhËn ®­îc["..GetName().."]May m¾n nhËn ®­îc"..moon_rabbit_box_prize_list[i][3].. "nhĞ"..add_flag)
				--end	
				break
			else
				dostring(moon_rabbit_box_prize_list[i][3])
				break
			end
		else
			ran_num = ran_num - moon_rabbit_box_prize_list[i][1]
		end
	end
end
--*******************************¾÷Òª°üÔö¼Ó********************************
function jue_bag_add()
	local jue_id = {{607,"Tói bİ kİp thiÕu l©m"},
					{608,"Tói bİ kİp §­êng m«n"},
					{609,"Tói bİ kİp Nga My"},
					{610,"Tói bİ kİp C¸i Bang"},
					{611,"Tói bİ kİp Vâ §ang"},
					{612,"Tói bİ kİp D­¬ng M«n"},
					{613,"Tói bİ kİp Ngò §éc"}}
	local bag_diff = random(1,getn(jue_id))
	local add_flag = AddItem(2,0,jue_id[bag_diff][1],1)
	--if add_flag == 1 then
		--Msg2Player("B¹n nhËn ®­îc"..jue_id[bag_diff][2].. "nhĞ")
		--Msg2SubWorld(GetName().."B¹n nhËn ®­îc"..jue_id[bag_diff][2].. "nhĞ")
		--WriteLog("[abluemoon]"..GetName().."B¹n nhËn ®­îc"..jue_id[bag_diff][2].. "nhĞ")		
	--else
		--WriteLog("[abluemoon]B¹n nhËn ®­îc["..GetName().."]May m¾n nhËn ®­îc"..jue_id[bag_diff][2].. "nhĞ"..add_flag)
	--end	

end
--*****************************ÎåÒ»Í·Ôö¼Ó*********************************
function labor_head_add()
	local HatTab = {
		{0,103,17},	
		{0,103,18},
		{0,103,35},
		{0,103,36},
		{0,103,53},
		{0,103,54},
		{0,103,71},
		{0,103,72}
		}
	local nRandomNum = random(1,getn(HatTab))
	local add_flag = AddItem(HatTab[nRandomNum][1],HatTab[nRandomNum][2],HatTab[nRandomNum][3],1,1,2,random(131,132),2,102,-1,-1)
	--if add_flag  == 1 then
		--Msg2Player("B¹n nhËn ®­îc")
		--Msg2SubWorld(GetName().."B¹n nhËn ®­îc")
		--WriteLog("[abluemoon]"..GetName().."B¹n nhËn ®­îc 0,103,"..HatTab[nRandomNum][3].."nhĞ")
	--else
		--WriteLog("[abluemoon]B¹n nhËn ®­îc["..GetName().."]may m¾n nhËn ®­îc"..add_flag)
	--end
end
--****************************ÎåÒ»¿ã×ÓÔö¼Ó*******************************
function labor_trouers_add()
	local TrousersTab = {
		{0,101,17},
		{0,101,18},
		{0,101,35},
		{0,101,36},
		{0,101,53},
		{0,101,54},
		{0,101,71},
		{0,101,72},
		}
	local nRandomNum = random(1,getn(TrousersTab))
	local add_flag = AddItem(TrousersTab[nRandomNum][1],TrousersTab[nRandomNum][2],TrousersTab[nRandomNum][3],1,1,3,random(131,132),2,102,-1,-1)
	--if add_flag  == 1 then
		--Msg2Player("¹§Ï²Äã»ñµÃÁËÒ»¼şÎåÒ»¿ã£¡")
		--Msg2SubWorld(GetName().."Ê¹ÓÃÔÂÁÁÍÃÌú±¦Ïä»ñµÃÁËÒ»ÌõÎåÒ»¿ã£¡")	
		--WriteLog("[abluemoon]"..GetName().."Ê¹ÓÃÔÂÁÁÍÃÌú±¦Ïä»ñµÃÁËÒ»¼ş±àºÅ0,101,"..TrousersTab[nRandomNum][3].."ÎåÒ»¿ã£¡")
	--else
		--WriteLog("[abluemoon]ÔÂÁÁÍÃÌú±¦ÏäÊ¹ÓÃ£ºÍæ¼Ò["..GetName().."]Ê¹ÓÃÔÂÁÁÍÃÌú±¦Ïä»ñµÃÎåÒ»¿ãÊ§°Ü£¡Ê§°Ü±êÖ¾£º"..add_flag)
	--end
end
--****************************ÎåÒ»ÎäÆ÷Ôö¼Ó*******************************
function labor_weapon_add()
	local WeaponTab = {
		{0,0,13},	--1ÊÖ
		{0,2,26},	--2½£
		{0,5,39},	--3¹÷
		{0,1,52},	--4°µÆ÷
		{0,3,63},	--5µ¥µ¶
		{0,10,74},	--6ÇÙ
		{0,9,85},	--7±Ê
		{0,8,96},	--8ÕÈ
		{0,6,107},	--9Ç¹
		{0,4,118},	--10¹­
		{0,11,11},	--11×¦
		{0,7,11},	--12Ë«µ¶
		}
	local nRandomNum = random(1,getn(WeaponTab))
	
	if nRandomNum == 3 or nRandomNum == 4 or nRandomNum == 5 or nRandomNum == 7 or nRandomNum == 9 or nRandomNum == 10 or nRandomNum == 12 then
		nAttribute = 131	--¹÷,°µÆ÷,µ¥µ¶,±Ê,Ç¹,¹­,Ë«µ¶
	elseif nRandomNum == 2 or nRandomNum == 6 or nRandomNum == 8 or nRandomNum == 11 then
		nAttribute = 132	--½£,ÇÙ,ÕÈ,×¦
	else	--ÊÖ
		nAttribute = random(131,132)
	end

	local add_flag = AddItem(WeaponTab[nRandomNum][1],WeaponTab[nRandomNum][2],WeaponTab[nRandomNum][3],1,1,3,nAttribute,3,102,2,251)

	--if add_flag  == 1 then
		--Msg2Player("¹§Ï²Äã»ñµÃÁËÒ»¼şÎäÆ÷£¡")
		--Msg2SubWorld(GetName().."Ê¹ÓÃÔÂÁÁÍÃÌú±¦Ïä»ñµÃÁËÒ»°ÑÎåÒ»ÎäÆ÷£¡")	
		--WriteLog("[abluemoon]"..GetName().."Ê¹ÓÃÔÂÁÁÍÃÌú±¦Ïä»ñµÃÁËÒ»¼ş±àºÅ"..WeaponTab[nRandomNum][1]..","..WeaponTab[nRandomNum][2]..","..WeaponTab[nRandomNum][3].."ÎåÒ»ÎäÆ÷£¡")
	--else
		--WriteLog("[abluemoon]ÔÂÁÁÍÃÌú±¦ÏäÊ¹ÓÃ£ºÍæ¼Ò["..GetName().."]Ê¹ÓÃÔÂÁÁÍÃÌú±¦Ïä»ñµÃÎåÒ»ÎäÆ÷Ê§°Ü£¡Ê§°Ü±êÖ¾£º"..add_flag)
	--end
end
--***************************Ê¦ÃÅÃØ¼®Ôö¼Ó*********************************
function shimen_book()
	local book_name = {"½ğ¸Õ·üÄ§¾­","Ç±ÁúÃØ¼®","ÎŞ³¾ÃØ¼®","ÌìÂŞÃØ¼®","ÈçÒâÃØ¼®","±Ìº£Æ×","»ìãçÃØ¼®",
					"ŞñÌìÃØ¼®","»ÃÓ°ÃØ¼®","¾ı×ÓÃØ¼®","Õò¾üÃØ¼®","´©ÔÆÃØ¼®","ÓÄÚ¤¹íÂ¼","Áé¹ÆÃØ¼®"}
	local book_seq = random(1,getn(book_name))
	local book_id = ((book_seq - 1) * 2) + 1
	local add_flag = AddItem(0,107,book_id,1)
	--if add_flag == 1 then
		--Msg2Player("¹§Ï²Äú»ñµÃ¡°"..book_name[book_seq].."¡±£¡")
		--Msg2SubWorld(GetName().."Ê¹ÓÃÔÂÁÁÍÃÌú±¦Ïä»ñµÃÁËÒ»±¾¡°"..book_name[book_seq].."¡±£¡")	
		--WriteLog("[abluemoon]".."Ê¹ÓÃÔÂÁÁÍÃÌú±¦Ïä»ñµÃÁËÒ»±¾¡°"..book_name[book_seq].."¡±£¡")
	--else		--test
		--WriteLog("[abluemoon]ÔÂÁÁÍÃÌú±¦ÏäÊ¹ÓÃ£ºÍæ¼Ò£º"..GetName().."Ôö¼Ó"..book_name[book_seq].."Ê§°Ü£¬Ê§°Ü±êÖ¾£º"..add_flag)
	--end
end


