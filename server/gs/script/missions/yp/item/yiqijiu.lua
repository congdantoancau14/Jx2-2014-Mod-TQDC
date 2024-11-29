Include("\\script\\missions\\yp\\yp_head.lua")

function OnUse()
	Say("Dïng sÏ t¨ng <color=yellow>50 ®iÓm<color> th©n thiÖn víi ®éi tr­ëng, tr­íc khi dïng h·y kÕt h¶o h÷u víi ®éi tr­ëng tr­íc, b»ng kh«ng khi dïng sÏ kh«ng nhËn ®­îc hiÖu qu¶. §ång ý dïng?",
		2,
		"\n§óng/confirm_use",
		"\nKÕt thóc ®èi tho¹i/nothing")
end

function confirm_use()
	local nSize = GetTeamSize();
	if nSize < 2 then
		Talk(1,"","H·y tæ ®éi råi sö dông vËt phÈm nµy!");
		return 0;
	end
	if PlayerIndex == GetTeamMember(0) then
		Talk(1,"","Ng­¬i lµ ®éi tr­ëng, kh«ng thÓ sö dông vËt phÈm nµy!");
		return 0;
	end
	local nCount = GetItemCount(tPVPItemInfo[16][2],tPVPItemInfo[16][3],tPVPItemInfo[16][4]);
	AskClientForNumber("confirm_use_final",1,nCount,"Sö dông bao nhiªu?")
end

function confirm_use_final(nCount)
	local nNum = GetItemCount(tPVPItemInfo[16][2],tPVPItemInfo[16][3],tPVPItemInfo[16][4]);
	if nNum < nCount then
		Talk(1,"","VËt phÈm trªn ng­êi kh«ng ®ñ!");
		return 0;
	end
	local nSize = GetTeamSize();
	if nSize < 2 then
		Talk(1,"","H·y tæ ®éi råi sö dông vËt phÈm nµy!");
		return 0;
	end
	if PlayerIndex == GetTeamMember(0) then
		Talk(1,"","Ng­¬i lµ ®éi tr­ëng, kh«ng thÓ sö dông vËt phÈm nµy!");
		return 0;
	end	
	if DelItem(tPVPItemInfo[16][2],tPVPItemInfo[16][3],tPVPItemInfo[16][4],nCount) == 1 then
		ModifyFriendliness(GetName(GetTeamMember(0)),50*nCount);
	end
end