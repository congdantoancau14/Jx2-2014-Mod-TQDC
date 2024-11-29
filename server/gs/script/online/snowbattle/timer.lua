Include("\\script\\online\\snowbattle\\head.lua");

function OnTimer()
	--WriteLog("OnTimer::called");
	SB_OnMissionTimer();
end