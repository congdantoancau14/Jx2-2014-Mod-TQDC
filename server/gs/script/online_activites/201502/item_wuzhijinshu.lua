Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\activity_head.lua")

function OnUse(nItem)
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	local tSay = {
		"Sö dông 999 V« Tù Kinh Th­ sÏ nhËn ®­îc 01 MËt TÞch Cao CÊp 15% (NgÉu nhiªn)/wzjs_exchange_1",
		"Sö dông 999 V« Tù Kinh Th­, tiªu hao 100 Xu ®¹o cô nhËn ®­îc 01 MËt TÞch Cao CÊp 15% (Theo l­u ph¸i cña ng­êi ch¬i)/wzjs_exchange_2",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say("C¸ch sö dông:", getn(tSay), tSay);
end

function wzjs_exchange_1()
	if GetItemCount(2,1,30785) < 999 then
		Talk(1,"",format("Trong hµnh trang %s sè l­îng kh«ng ®ñ %d", "V« Tù Kinh Th­", 999))
		return 0;
	end
	if DelItem(2,1,30785,999) ~= 1 then
		return 0;
	end
	ahf_GetGaojiZhenjuan(0, 1, 1, 2)
end

function wzjs_exchange_2()
	if GetItemCount(2,1,30785) < 999 then
		Talk(1,"",format("Trong hµnh trang %s sè l­îng kh«ng ®ñ %d", "V« Tù Kinh Th­", 999))
		return 0;
	end
	if GetItemCount(2,1,30230) < 100 then
		Talk(1,"",format("Trong hµnh trang %s sè l­îng kh«ng ®ñ %d", "XU", 100))
		return 0;
	end
	if DelItem(2,1,30785,999) ~= 1 or DelItem(2,1,30230,100) ~= 1 then
		return 0;
	end
	ahf_GetGaojiZhenjuan(1, 1, 1, 2)
end