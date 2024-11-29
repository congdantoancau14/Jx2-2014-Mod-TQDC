Include("\\script\\missions\\yp\\yp_head.lua")

function OnUse()
	Say("Sö dông nhËn ®­îc <color=yellow>10 ®iÓm<color> danh väng Vâ L©m Minh, ®ång ý dïng?",
		2,
		"\n§óng/confirm_use",
		"\nKÕt thóc ®èi tho¹i/nothing")
end

function confirm_use()
	local nCount = GetItemCount(tPVPItemInfo[26][2],tPVPItemInfo[26][3],tPVPItemInfo[26][4]);
	AskClientForNumber("confirm_use_final",1,nCount,"Sö dông bao nhiªu?")
end

function confirm_use_final(nCount)
	local nNum = GetItemCount(tPVPItemInfo[26][2],tPVPItemInfo[26][3],tPVPItemInfo[26][4]);
	if nNum < nCount then
		Talk(1,"","VËt phÈm trªn ng­êi kh«ng ®ñ!");
		return 0;
	end
	if DelItem(tPVPItemInfo[26][2],tPVPItemInfo[26][3],tPVPItemInfo[26][4],nCount) == 1 then
		yp_setValue(5,10*nCount);
	end
end