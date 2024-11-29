--ÉÚ×Ó
Include("\\script\\online_activites\\201505feedpet\\head.lua")

function OnUse(nItemIndex)
	if check_player_condition()~= 1 then
		return
	end
	local nLevel = get_feedLevel(nItemIndex)
	if nLevel <= 0 then
		return
	end
	do_feed_pet(nLevel)
end

function do_feed_pet(nLevel, szHeadMsg)
	local ncurPoint = get_cur_point(nLevel)
	if get_award_count(nLevel) >= g_tFeedPet.nMaxFeedPetOneDay then
		Talk(1,"","Sè lÇn huÊn luyÖn thó h«m nay ®· ®¹t giíi h¹n")
		return
	end
	if get_cur_point(nLevel) == g_tFeedPet.nFeedTargetPoint then
		Talk(1,"","§· ®ñ ®é c­êng tr¸ng råi, h·y mang ®Õn chç §¹i Sø Ho¹t §éng.")
		return
	end
	local szTitle = format("§é c­êng tr¸ng lµ <color=yellow>%d<color>, h·y mau huÊn luyÖn cho ®é c­êng tr¸ng ®¹t ®Õn <color=yellow>%d<color> nµo.", ncurPoint, g_tFeedPet.nFeedTargetPoint)
	if szHeadMsg then
		szTitle = format("%s\n%s",szHeadMsg, szTitle)
		
	end
	szTitle = format("%s\n%s", szTitle, "Nguyªn liÖu huÊn luyÖn thó c­ng cã h¹n, h·y sö dông thËt tiÕt kiÖm.!")
	
	local tbSay = {}
	local t=g_tFeedPet.tFood
	for i=1,getn(t) do
		local tt = t[i]
		tinsert(tbSay, format("%s(%s)/#_do_feed_pet(%d,%d, %d)", tt[4], tt[5],nLevel, i, 0))
	end
	tinsert(tbSay, format("%s/nothing", "TiÕp tôc huÊn luyÖn sau"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function _do_feed_pet(nLevel, nType, bConfirm)
	local t = g_tFeedPet.tFood[nType]
	local ncurPoint = get_cur_point(nLevel)
	local nNewPoint = get_next_point(nLevel,nType)
	local t = g_tFeedPet.tFood[nType]
	local tt=t[3]
	if GetItemCount(tt[1],tt[2],tt[3])<1 then
		Talk(1,"",format("¤i, quªn mang theo %s råi, quay l¹i sau",t[2]))
		return
	end
	if nNewPoint==ncurPoint then
		Talk(1,"","H×nh nh­ thó c­ng kh«ng thÝch øng, cÇn thay ®æi c¸ch huÊn luyÖn kh«ng?")
		return
	end
	if bConfirm ~= 1 then
		local szTitle = format("§é c­êng tr¸ng hiÖn t¹i lµ <color=yellow>%d/%d<color>, sau khi huÊn luyÖn sÏ thay ®æi thµnh <color=yellow>%d<color>, ®ång ý kh«ng?", ncurPoint, g_tFeedPet.nFeedTargetPoint, nNewPoint)
    	local tbSay = {}
    	
    	tinsert(tbSay, format("%s/#_do_feed_pet(%d,%d,%d)", "§ång ý", nLevel, nType, 1))
    	tinsert(tbSay, format("%s/#do_feed_pet(%d)", "trë l¹i", nLevel))
    	tinsert(tbSay, format("%s/nothing", "Ra khái"))
    	
    	Say(szTitle, getn(tbSay), tbSay)
    	return
	end
	
	if DelItem(tt[1],tt[2],tt[3], 1)==1 then
		set_cur_point(nLevel, nNewPoint)
		local szMsg = format("Chóc mõng thµnh c«ng huÊn luyÖn thó c­ng!")
		--Msg2Player(szMsg)
		do_feed_pet(nLevel, szMsg)
		return
	end
end

function get_feedLevel(nItemIndex)
	local g,d,p = GetItemInfoByIndex(nItemIndex)
	local t = g_tFeedPet.tToolItem
	for i=1,getn(t) do
		local tt = t[i][3]
		if g==tt[1] and d==tt[2] and p==tt[3] then
			return i
		end
	end
	return 0
end