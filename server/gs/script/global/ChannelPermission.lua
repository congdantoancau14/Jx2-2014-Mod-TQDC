Include("\\script\\lib\\get_managed_viet_string.lua")
-- 检测在频道中是否能说话

t_chat_consume=
{	--[nChannelType] = {item{name,g,d,p,n}, money}
	[2] = {{"Thi猲 L� Truy襫  Ph�", 2,1,3508,5},50000,},	--公聊
	[8] = {{"Thi猲 L� Truy襫  Ph�", 2,1,3508,1},1000,},	--派聊
}

function OnCheck(nChannelType)
	if nChannelType == 2 or nChannelType == 8 then	-- 公聊和派聊
		local nMapID = GetWorldPos()
		if nMapID == 701 then
			Msg2Player("Trong i lao kh玭g 頲 d飊g k猲h chat c玭g c閚g v� k猲h m玭 ph竔")
			return 0
		end
	end
	
	local t = t_chat_consume[nChannelType]
	if t then
		local g,d,p,n = t[1][2], t[1][3], t[1][4], t[1][5]
		if DelItem(g,d,p,n) == 1 then
			return 1
		end
		local money = t[2]
		local ok = Pay(money)
		if ok and ok == 1 then
			return 1
		else
			local gold = floor(money / 10000)
			Msg2Player(format(getManagedVietString(VIET_STR_ID_MONEY_NOT_ENOUGH), gold))
			return 0
		end
	end
	return 1
end