Include("\\script\\online\\201504_catch_fish\\head.lua")

function main()
	npc_talk_main()
end

function npc_talk_main()
	if check_player_condition()~= 1 then
		return
	end
	local szTitle = format("Th­¬ng Nh©n H¶i S¶n: GÇn ®©y §¹i V­¬ng Ba T­ bÞ nghiÖn mãn h¶i s¶n, nªn ®· dïng b¸u vËt trong cung ®Ó ®æi h¶i s¶n. C¸c b¹n h·y nhanh chãng ®Õn ®ã v× khÈu vÞ cña §¹i V­¬ng Ba T­ thay ®æi rÊt nhanh.")
	local tbSay = {}
	tinsert(tbSay, format("%s/npc_talk_desc", "Lµm sao nhËn ®­îc h¶i s¶n"))
	tinsert(tbSay, format("%s/npc_talk_open_shop", "Ta cã h¶i s¶n, ta muèn ®æi"))
	tinsert(tbSay, format("%s/nothing", "Ra khái"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function npc_talk_desc()
	local szTitle = format("Th­¬ng Nh©n H¶i S¶n: Ta ®· mêi mét ng­êi Ng­ Phñ gióp ta ®¸nh b¾t h¶i s¶n, nh­ng chØ mét ng­êi e r»ng lµm kh«ng xuÓ, ng­¬i cã thÓ ®Õn §«ng H¶i H¶i Binh 1 (227, 209) t×m thö. Ng­ phñ ®· lµm ra rÊt nhiÒu Ng­ D©n Thæ Ph¸o, chØ cÇn bá c¸c lo¹i ph¸o vµo trong th× cã thÓ b¾t ®Çu næ c¸.")
	local tbSay = {}
	tinsert(tbSay, format("%s/npc_talk_main", "trë l¹i"))
	tinsert(tbSay, format("%s/nothing", "Ra khái"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function npc_talk_open_shop()
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", 3064, "TiÖm H¶i S¶n"));
end
