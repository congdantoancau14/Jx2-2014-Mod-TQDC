--±ùÀäÖ®ÐÄ
Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nItem)
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	
	CustomAwardGiveGroup("WinterBoss_Heart", 0);	
end