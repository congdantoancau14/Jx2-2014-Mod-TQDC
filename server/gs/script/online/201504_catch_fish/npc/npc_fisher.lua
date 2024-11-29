--Óæ·ò
Include("\\script\\online\\201504_catch_fish\\head.lua")

function main()
	npc_talk_main()
end

function npc_talk_main()
	if check_player_condition()~= 1 then
		return
	end
	local szMsg = "Uy lùc cña thæ ph¸o nµy còng kh¸ lín, may lµ ch­a kinh ®éng ai c¶."
	if szBoss ~= "" then
		szMsg = format("Uy lùc cña thæ ph¸o nµy qu¸ m¹nh, h×nh nh­ ®· kinh ®éng %s d­íi long cung", g_tCatchFish.szBoss)
	end
	local szTitle = format("Ng­ Phñ: Trong Ng­ D©n Thæ Ph¸o bá cµng nhiÒu lo¹i ph¸o tèt, tû lÖ nhËn ®­îc h¶i s¶n hiÕm cã cµng cao. %s", szMsg)
	local tbSay = {}
	tinsert(tbSay, format("%s/combin_bomb", "GhÐp Ph¸o Nhá"))
	tinsert(tbSay, format("%s/nothing", "Ra khái"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function combin_bomb()
	local szTitle = format("%s\n%s", 
		"Ng­ Phñ: Trªn ng­êi ng­ qu¸i ë §«ng H¶i H¶i Binh cã §¸ §¸nh Löa, nguyªn liÖu dïng ®Ó ghÐp Ph¸o Nhá.",
		"1 Ph¸o Nhá = 10 Ngßi Ph¸o +10 èng Phãng + 10 Thuèc Næ + 10 §¸ §¸nh Löa"
		)
	local tbSay = {}
	tinsert(tbSay, format("%s/do_combin_bomb", "§ång ý ghÐp"))
	tinsert(tbSay, format("%s/npc_talk_main", "Quay l¹i "))
	tinsert(tbSay, format("%s/nothing", "Ra khái"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function do_combin_bomb()
	local szFunc = format("do_combin_bomb_sure")
	local nMax=get_max_combine_count()
	AskClientForNumber(szFunc, 1, nMax, "GhÐp bao nhiªu c¸i?");
end

function get_max_combine_count()
	local t = g_tCatchFish.tCombine
	local tr = t.tRequite
	local r = 1000
	for i=1,getn(tr) do
		local tt = tr[i]
		local nTemp = floor(GetItemCount(tt[2],tt[3],tt[4])/tt[5])
		r = min(r,nTemp)
	end
	return r
end

function do_combin_bomb_sure(nNum)
	if nNum <= 0 then
		return
	end
	if gf_Judge_Room_Weight(1, 100, "")~=1 then
		return
	end
	local nMax=get_max_combine_count()
	if nMax < nNum then
		Talk(1,"","Nguyªn liÖu thµnh c«ng")
		return
	end
	local t = g_tCatchFish.tCombine
	local tg=t.tItem
	local tr = t.tRequite
	for i=1,getn(tr) do
		local tt = tr[i]
		if DelItem(tt[2],tt[3],tt[4],tt[5]*nNum) ~= 1 then
			return
		end
	end
	AddItem(tg[2],tg[3],tg[4],nNum)
	Talk(1,"",format("GhÐp thµnh c«ng %d c¸i %s",nNum, tg[1]))
end



