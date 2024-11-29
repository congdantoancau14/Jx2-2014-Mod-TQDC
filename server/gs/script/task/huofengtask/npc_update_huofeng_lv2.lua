Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	npc_talk_main()
end

function npc_talk_main()
	local tbSay = {}
	tinsert(tbSay, format("%s/about_update_lv2", "Néi dung cÇn chó ı khi n©ng cÊp"))
	tinsert(tbSay, format("%s/iwant_update_lv2", "Ta muèn n©ng cÊp"))
	tinsert(tbSay, format("%s/no", "KÕt thóc ®èi tho¹i"))
	local szMsg = format("%s:%s", "<color=green>Háa Long §Ønh<color>", "Muèn n©ng cÊp vò khİ Háa Phông cÊp 1, b¹n chuÈn bŞ ®ñ nguyªn liÖu ch­a?")
	Say(szMsg,getn(tbSay),tbSay)
end

function about_update_lv2()
	local tbSay = {}
	tinsert(tbSay, format("%s/npc_talk_main", "trë l¹i"))
	tinsert(tbSay, format("%s/no", "KÕt thóc ®èi tho¹i"))
	local szMsg = format("%s:%s", "<color=green>Háa Long §Ønh<color>", "N©ng cÊp vò khİ Háa Phông cÊp 1 thµnh vò khİ Háa Phông cÊp 2,cÇn trang bŞ vò khİ Háa Phông +7 trë lªn cÊp 1 trªn ng­êi, mang theo Háa DiÖm Th¹ch.")
	Say(szMsg,getn(tbSay),tbSay)
end

function iwant_update_lv2()
	if check_condition()~=1 then return end
	
	local tbSay = {}
	tinsert(tbSay, format("%s/confirm_update_lv2", "Ta muèn n©ng cÊp"))
	tinsert(tbSay, format("%s/npc_talk_main", "trë l¹i"))
	tinsert(tbSay, format("%s/no", "KÕt thóc ®èi tho¹i"))
	local szMsg = format("%s:%s", "<color=green>Háa Long §Ønh<color>", "N©ng cÊp vò khİ Háa Phông cÊp 1 lªn cÊp 2, cÇn trang bŞ vò khİ Háa Phông cÊp 1 trªn ng­êi, mang theo Háa DiÖm Th¹ch, cßn cÇn nép 6 Hµn Tinh ThiÕt, 6 Thiªn Ma Tµ Tinh, 10 Thiªn Cang LÖnh, 20 Thiªn M«n Kim LÖnh.")
	Say(szMsg,getn(tbSay),tbSay)
end

function confirm_update_lv2()
	--print("confirm_update_lv2")
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", 3052, "N©ng cÊp vò khİ Háa Phông cÊp 1"))
end

function check_condition()
	if tGtTask:check_cur_task(264) ~= 1 and tGtTask:check_task_isfinish(264) ~= 1 then
		Talk(1,"","HiÖn t¹i kh«ng thÓ n©ng cÊp vò khİ Háa Phông cÊp 2!")
		return 0
	end
	return 1
end
