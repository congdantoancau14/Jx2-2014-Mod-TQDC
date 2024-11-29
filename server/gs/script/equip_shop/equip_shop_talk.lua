--½Å±¾¹¦ÄÜ£º
--´ú±ÒÉÌµêÈë¿Ú¶Ô»°

Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\system_switch_config.lua")

function OnOpenShopGroup1()
	local szTitle = format("H·y lùa chän ph­¬ng thøc ®æi")
	local strtab = {}
	tinsert(strtab,"\n Tô B¶o Th­¬ng Nh©n Cæ Linh Th¹ch /OnOpenShops_GuLingShi");
	tinsert(strtab,"\n Tô B¶o Th­¬ng Nh©n Cæ Linh Ngäc /OnOpenShops_GuLingYu");
	if IsTongTianHuanJingMissionSystemOpen() == 1 then
		tinsert(strtab,"\n Tô B¶o Th­¬ng Nh©n Thiªn M«n Kim LÖnh /OnOpenShops_TianMenJinLing");
	end
	tinsert(strtab,"\n rót lui/nothing");
	
	Say(szTitle, getn(strtab), strtab)
end

--¹ÅÁéÊ¯¶Ò»»
function OnOpenShops_GuLingShi()
	local szTitle = format("H·y lùa chän ph­¬ng thøc ®æi")
	local strtab = {
			"\n TiÖm t¹p hãa Cæ Linh Th¹ch /#show_equip_shop(3001)",
			"\n S­ M«n bé 4/#show_equip_shop(3)",
			"\n S­ M«n bé 5/#show_equip_shop(6)",
			"\n UÈn Linh cÊp 1 /OpenLevel1WenShiShops",
			"\n rót lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end

--Ò»¼¶ÎÆÊÎ¶Ò»»
function OpenLevel1WenShiShops()
	local szTitle = format("Vui lßng chän bé phËn VËn Linh")
	local strtab = {
			"\n UÈn Linh ®Çu qu¸n cÊp 1/#show_equip_shop(3004)",
			"\n UÈn Linh y phôc cÊp 1/#show_equip_shop(3005)",
			"\n UÈn Linh h¹ y cÊp 1/#show_equip_shop(3006)",
			"\n Ph¶n håi/OnOpenShops_GuLingShi",
			"\n rót lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end

function OnOpenShops_GuLingYu()
	local szTitle = format("H·y lùa chän ph­¬ng thøc ®æi")
	local strtab = {
			"\n TiÖm T¹p hãa Cæ Linh Ngäc/#show_equip_shop(3002)",
			"\n Trang bŞ Cæ Linh Ngäc H¹o NguyÖt/#show_equip_shop(10)",
			"\n UÈn Linh cÊp 2/OpenLevel2WenShiShops",
			"\n UÈn Linh cÊp 3/OpenLevel3WenShiShops",
			"\n rót lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end

--¶ş¼¶ÎÆÊÎ¶Ò»»
function OpenLevel2WenShiShops()
	local szTitle = format("Vui lßng chän bé phËn VËn Linh")
	local strtab = {
			"\n UÈn Linh ®Çu qu¸n cÊp 2/#show_equip_shop(3007)",
			"\n UÈn Linh y phôc cÊp 2/#show_equip_shop(3008)",
			"\n UÈn Linh h¹ y cÊp 2/#show_equip_shop(3009)",
			"\n Ph¶n håi/OnOpenShops_GuLingYu",
			"\n rót lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end

--Èı¼¶ÎÆÊÎ¶Ò»»
function OpenLevel3WenShiShops()
	local szTitle = format("Vui lßng chän bé phËn VËn Linh")
	local strtab = {
			"\n UÈn Linh ®Çu qu¸n cÊp 3/#show_equip_shop(3010)",
			"\n UÈn Linh y phôc cÊp 3/#show_equip_shop(3011)",
			"\n UÈn Linh Khè cÊp 3/#show_equip_shop(3012)",
			"\n Ph¶n håi/OnOpenShops_GuLingYu",
			"\n rót lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end

function OnOpenShops_TianMenJinLing()
	local szTitle = format("H·y lùa chän ph­¬ng thøc ®æi")
	local strtab = {
			"\nTiÖm T¹p hãa Thiªn M«m Kim LÖnh/#show_equip_shop(3003)",
			"\nTrang bŞ Th«ng Thiªn DiÖu D­¬ng/#show_equip_shop(13)",
	};
	
	--ĞÂ¾ÉÒ«Ñô£¬ğ©ÔÂ×°±¸¶Ò»»
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= 2012101200 and nDate < 2042111200 then
		tinsert(strtab, "\n§æi trang bŞ H¹o NguyÖn, DiÖu D­¬ng (tõ 12 th¸ng 10 ®Õn 11 th¸ng 11)/#show_equip_shop(3025)");
	end 
	
	tinsert(strtab, "\n rót lui/nothing");
	Say(szTitle, getn(strtab), strtab)
end

--Èı¼¶ÎÆÊÎ¶Ò»»
function OpenLeihuJingPoShops()
	local szTitle = format("Vui lßng chän bé phËn VËn Linh")
	local strtab = {
			"\n Cöa hiÖu qu©n phôc L«i Hæ/#show_equip_shop(3038)",
			"\n rót lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end

function nothing()
end

