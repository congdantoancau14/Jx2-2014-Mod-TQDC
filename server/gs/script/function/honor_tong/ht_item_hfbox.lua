Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	local tSay = {
		format("Më r­¬ng/#get_huofengling(%d)", nItem),
		"\n vÒ sau xem l¹i/nothing",
	}
	Say("ChØ cã bang chñ míi ®­îc më R­¬ng Háa Phông, cã thÓ ph©n phèi cho ®ång ®éi vµ thµnh viªn kh¸c.", getn(tSay), tSay);
end

function get_huofengling(nItem)
	if GetTongDuty() ~= 1 then
		Say("ChØ cã bang chñ míi ®­îc sö dông r­¬ng nµy!", 0);
		return 0;
	end
	local tSay = {};
	local oldPlayerIndex = PlayerIndex;
	for i = 1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i);
		if PlayerIndex ~= oldPlayerIndex then
			tinsert(tSay, format("Ph©n phèi cho %s/#assign_to_member(%d, %d)", GetName(), nItem, PlayerIndex));
		else
			tinsert(tSay, format("Ph©n phèi cho %s/#assign_to_member(%d, %d)", "Ta", nItem, PlayerIndex));
		end
	end
	PlayerIndex = oldPlayerIndex;
	tinsert(tSay, "\n vÒ sau xem l¹i/nothing");
	Say("B¹n muèn ph©n phèi <color=gold>Háa Phông Linh*1<color> cho ai?", getn(tSay), tSay);	
end

function assign_to_member(nItem, playerIndex)
	local oldPlayerIndex = PlayerIndex
	-- check free room
	PlayerIndex = playerIndex;
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		PlayerIndex = oldPlayerIndex;
		return 0
	end
	-- del box
	PlayerIndex = oldPlayerIndex
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	-- add item
	PlayerIndex = playerIndex
	local szName = GetName();
	gf_AddItemEx2({2, 1, 30769, 1, 4}, "Háa Phông Linh", "Bang Héi Vinh Danh", "R­¬ng Háa Phông", 0, 1);
	-- extra msg
	if PlayerIndex ~= oldPlayerIndex then
		PlayerIndex = oldPlayerIndex;
		Msg2Player(format("Ta muèn ph©n phèi [Háa Phông Linh*1] cho [%s]", szName));
	end
end