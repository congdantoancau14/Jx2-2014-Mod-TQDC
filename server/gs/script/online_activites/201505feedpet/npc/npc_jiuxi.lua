--¾ÆÏ¯
Include("\\script\\online_activites\\201505feedpet\\head.lua")
Include("\\script\\online_activites\\201505feedpet\\timer.lua")

SZ_NPC_NAME="M©m cç"
function main()
	if check_player_condition()~= 1 then
		return
	end
	local nTime = tonumber(date("%H%M"))
	if g_debug~=1 and (not (1900 <= nTime and nTime < 2100)) then
		Talk(1,"","Thêi gian cña ho¹t ®éng yÕn tiÖc b¾t ®Çu vµo 19:00-21:00 h»ng ngµy")
		return 0
	end
	
	local szTitle = format("%s:%s", SZ_NPC_NAME, "YÕn tiÖc ®· b¾t ®Çu råi, mêi nhËp tiÖc")
	local tbSay = {}
	tinsert(tbSay, format("%s/#do_eat(%d)", "Ta muèn uèng r­îu", 1))
	tinsert(tbSay, format("%s/#do_eat(%d)", "Ta kh«ng uèng r­îu", 0))
	tinsert(tbSay, format("%s/nothing", "Ra khái"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function do_eat(bDrink)
	local nMulti = get_task(g_tFeedPet.nTaskIdx_ExpGetMulti)
	if nMulti > 0 then
		Talk(1,"","H«m nay c¸c h¹ ®· ¨n tiÖc råi, ngµy mai h·y quay l¹i")
		return
	end
	local nExpLeftCnt = get_task(g_tFeedPet.nTaskIdx_ExpGetCnt)
	if nExpLeftCnt > 0 then
		return
	end
	local t = g_tFeedPet.tDrink
	local tt = t[2]
	if bDrink == 1 then
		local nItemCnt = GetItemCount(tt[1],tt[2], tt[3])
		local nMax = min(nItemCnt, g_tFeedPet.nMaxUseDrinkOneDay)
		if nMax > 0 then
			AskClientForNumber("_start_extra_eat", 1, nMax, "H·y nhËp sè l­îng vµo")
		else
			Talk(1,"","H×nh nh­ c¸c h¹ quªn mang theo r­îu råi, h·y kiÓm tra l¹i nµo")
		end
	else
		_start_extra_eat(0)
	end
end

function _start_extra_eat(nDrink)
	nDrink = min(nDrink,g_tFeedPet.nMaxUseDrinkOneDay)
	_start_eat(nDrink+1)
end

function _start_eat(nDrink)
	local t = g_tFeedPet.tDrink
	local tt = t[2]
	---Test---
	if nDrink <= 1 then
		Talk(1,"","H×nh nh­ c¸c h¹ quªn mang theo r­îu råi, h·y kiÓm tra l¹i nµo")
		return
	end
	---------
	if nDrink > 1 and DelItem(tt[1],tt[2], tt[3], nDrink-1) ~= 1 then
		Talk(1,"","H×nh nh­ c¸c h¹ quªn mang theo r­îu råi, h·y kiÓm tra l¹i nµo")
		return
	end
	set_task(g_tFeedPet.nTaskIdx_ExpGetCnt, g_tFeedPet.nMaxGetExpOneDay)
	set_task(g_tFeedPet.nTaskIdx_ExpGetMulti, nDrink)
	create_timer()
	local szMsg = "C¸c h¹ b¾t ®Çu nhËp tiÖc nµo, nhí r»ng ®õng rêi khái bµn tiÖc qu¸ xa nhÐ!"
	Talk(1,"",szMsg)
	Msg2Player(szMsg)
end
