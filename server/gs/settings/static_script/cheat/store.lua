THIS_FILE = "\\settings\\static_script\\cheat\\store.lua";

function OnUse()
	
	local tSay = {	
		"Më r­¬ng/OpenBox",
		"Më t¹p hãa/openShop",
		"Tiªu hñy vËt phÈm/destroyItems",
		"\nThanh lÝ hµnh trang/ClearBagAllItem",
	}

	tinsert(tSay, "Tho¸t/nothing");
	Say(" --- Kho di ®éng --- ", getn(tSay), tSay);
end;

function nothing()
end;

function openShop()
	local state = GetFightState();
	local map = GetWorldPos();
	SetTask("FIGHT_STATE",state);
	SetTask("FIGHT_STATE_MAP",map);
	Sale(35);
	SetFightState(0);
end;

function OnCancel()
	local map = GetWorldPos();
	if map == GetTask("FIGHT_STATE_MAP") then
		local state = GetTask("FIGHT_STATE");
		if state == 1 then
			SetFightState(state);
			Msg2Player("SetFightState: ",state);
		end
	end
end

function destroyItems()
	local MaxPutinCount = 10;
	PutinItemBox("Tiªu hñy vËt phÈm", MaxPutinCount, "B¹n muèn tiªu hñy nh÷ng vËt phÈm ®· ®Æt vµo?", THIS_FILE, 1);
end;

function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	return 1;
end
	
function OnPutinComplete(param)
	if param ~= 1 then
		return 0;
	end
	local t = GetPutinItem()
	
	-- for i=1, getn(t) do
		-- for j=1,getn(t[i]) do
			-- print(format("t[%d][%d] = ",i,j)..t[i][j]);
		-- end
	-- end
	destroy(t);
	
end

function destroy(t)
	local nResult = 1;
	for i = 1, getn(t) do
		--local nCount = get_item_count(t, t[i][2], t[i][3], t[i][4]);
		if DelItemByIndex(t[i][1], -1) ~= 1 then
			nResult = 0;
		end
	end
	if nResult == 1 then
		Msg2Player("Tiªu hñy thµnh c«ng!");
	else
		Msg2Player("§· x¶y ra lçi trong qu¸ tr×nh tiªu hñy.");
	end
	return nResult;
end;

function get_item_count(t, id1, id2, id3)
	local nCount = 0;
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2 and t[i][4] == id3) then
			nCount = nCount + 1;
		end
	end
	return nCount;
end

function ClearBagAllItem(bTag)
	if not bTag or tonumber(bTag) ~= 1 then
		Say("X¸c nhËn thanh lý tói", 2, "§ång ý/#ClearBagAllItem(1)", "Ra khái/nothing")
		return
	end
	ClearItemInPos();
	if GetItemCount(2,1,1) < 1 and GetFreeItemRoom() > 0 then
		AddItem(2,1,1,1)
	end
	if GetItemCount(2,1,30045) < 1 and GetFreeItemRoom() > 0 then
		AddItem(2,1,30045,1)
	end
end