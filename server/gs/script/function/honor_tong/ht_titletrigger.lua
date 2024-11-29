Include("\\script\\function\\honor_tong\\ht_head.lua")

function OnTimer()
	if ht_IsOpen() ~= 1 then
		RemoveTrigger(GetTrigger(1538*2));
		return 0;
	end
	local nGeren, nDetail = GetCurTitle();
	if nGeren ~= 69 or nDetail ~= 1 then
		RemoveTrigger(GetTrigger(1538*2));
		return 0;
	end
	local nStateID = 69 * 10000 + 1 * 100;
	local tPlayerList = GetNearPlayerList()
	if not tPlayerList or type(tPlayerList) ~= "table" then
		return 0;
	end
	local szTongName = GetTongName();
	local oldPlayerIndex = PlayerIndex;
	for i = 1, getn(tPlayerList) do
		PlayerIndex = tPlayerList[i]
		if oldPlayerIndex ~= PlayerIndex and GetTongName() == szTongName then
			CastState("state_move_speed_percent_add", 10, 18*15, 1, nStateID + 1);
			CastState("state_life_max_percent_add", 10, 18*15, 1, nStateID + 2);
			CastState("state_p_attack_percent_add", 5, 18*15, 1, nStateID + 3);
			CastState("state_m_attack_percent_add", 5, 18*15, 1, nStateID + 4);
		end
	end
	PlayerIndex = oldPlayerIndex;
end