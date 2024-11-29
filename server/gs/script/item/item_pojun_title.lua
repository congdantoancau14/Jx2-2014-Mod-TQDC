Include("\\script\\lib\\globalfunctions.lua")
function OnUse(nItem)
	if IsTitleExist(70, 1) <= 0 then
		if DelItemByIndex(nItem, 1) ~= 1 then
			return 0;
		end
		AddTitle(70, 1)
		SetTitleTime(70, 1, GetTime() + (7 * 24 * 3600));
		Msg2Player(format("NhËn ®­îc danh hiÖu [%s]", "Ph¸ Qu©n"))
		Say(format("NhËn ®­îc danh hiÖu <color=gold>[%s]<color>", "Ph¸ Qu©n"), 0)
		gf_WriteLogEx("VIP Phong Th­ëng LÖnh (Ph¸ Qu©n)", "UseItem", "AddTitle(70, 1)");
	else
		Msg2Player("§· tån t¹i danh hiÖu!");
	end
	SetCurTitle(70, 1)
end