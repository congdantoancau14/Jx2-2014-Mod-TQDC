--·ï¾«µ¤
Include("\\script\\missions\\yp\\yp_head.lua")

function OnUse()
	yp_clearPlayerData();
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then
		Talk(1,"","H·y ®Õn Vâ L©m Minh gia nhËp thÕ lùc ®Ó sö dông vËt phÈm nµy!");
		return 0;
	end
	Say("Sö dông cã thÓ t¨ng <color=yellow>30 ®iÓm<color> tinh lùc, ®ång ý dïng kh«ng?",
		2,
		"\n§óng/confirm_use_final",
		"\nKÕt thóc ®èi tho¹i/nothing")
end

function confirm_use_final()
	if DelItem(tPVPItemInfo[7][2],tPVPItemInfo[7][3],tPVPItemInfo[7][4],1) == 1 then
		yp_setValue(3,30);
	end
end