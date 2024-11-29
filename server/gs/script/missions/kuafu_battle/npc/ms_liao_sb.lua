Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function main()
	local tSay = {
		"\nSao c� th� ���c, ta s� chi�n ��u ��n c�ng./nothing",
		"\nR�i kh�i chi�n tr��ng/leave_battle",	
	}
	Say("<color=green>Li�u Th��ng Binh<color>:".."C�c h� mu�n r�i kh�i chi�n tr��ng sao? Th�t ��ng ti�c.", getn(tSay), tSay);
end

function leave_battle()
	local tSay = {
		"\n�� ta suy ngh� l�i/nothing",
	}
	if GetMissionV(KF_MV_BATTLE_STATE) ~= KF_MS_STATE_PEACE and
	GetMissionV(KF_MV_BATTLE_STATE) ~= KF_MS_STATE_READY then
		tinsert(tSay, 1, "\nX�c nh�n/sure");
	end
	Say("<color=green>Li�u Th��ng Binh<color>:".."C�c h� x�c ��nh mu�n r�i kh�i chi�n tr��ng?", getn(tSay), tSay);
end

function sure()
	local nCamp = KF_GetCamp();
	DelMSPlayer(KF_MISSION_ID, nCamp);
end