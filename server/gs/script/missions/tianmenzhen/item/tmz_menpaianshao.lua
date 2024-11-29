--ÃÅÅÉ°µÉÚ

function OnUse(nItemIdx)
	if chk_can_use() == 0 then
		Say("Kh«ng thÓ sö dông vËt phÈm nµy trong b¶n ®å",0)
		return 0;
	end	
	if GetFightState() == 0 then
		Talk(1,"","Kh«ng thÓ sö dông vËt phÈm trong tr¹ng th¸i nµy");
		return 0;
	end
	
	local nFaction = GetPlayerFaction();
	local nRoute = GetPlayerRoute();
	if nRoute == 31 then -- for clkt and dmnh
		nFaction = 5;
	elseif nRoute == 32 then
		nFaction = 8;
	end
	
	if nFaction == 0 then
		return 0;
	end

	if DelItemByIndex(nItemIdx,1) == 1 then
		DoFireworks(1345,nFaction);
		Msg2Player("TriÖu gäi 6 quû t­íng.");
	end 
end

function chk_can_use()
	local nMapID = GetMapTemplate(SubWorld);
	if nMapID ~= 6006 then
		return 0;
	else
		return 1;
	end
end