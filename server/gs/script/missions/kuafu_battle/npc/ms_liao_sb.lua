Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function main()
	local tSay = {
		"\nSao cã thÓ ®­îc, ta sÏ chiÕn ®Êu ®Õn cïng./nothing",
		"\nRêi khái chiÕn tr­êng/leave_battle",	
	}
	Say("<color=green>Liªu Th­¬ng Binh<color>:".."C¸c h¹ muèn rêi khái chiÕn tr­êng sao? ThËt ®¸ng tiÕc.", getn(tSay), tSay);
end

function leave_battle()
	local tSay = {
		"\n§Ó ta suy nghÜ l¹i/nothing",
	}
	if GetMissionV(KF_MV_BATTLE_STATE) ~= KF_MS_STATE_PEACE and
	GetMissionV(KF_MV_BATTLE_STATE) ~= KF_MS_STATE_READY then
		tinsert(tSay, 1, "\nX¸c nhËn/sure");
	end
	Say("<color=green>Liªu Th­¬ng Binh<color>:".."C¸c h¹ x¸c ®Þnh muèn rêi khái chiÕn tr­êng?", getn(tSay), tSay);
end

function sure()
	local nCamp = KF_GetCamp();
	DelMSPlayer(KF_MISSION_ID, nCamp);
end