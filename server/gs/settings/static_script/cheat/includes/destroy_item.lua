THIS_FILE = "\\settings\static_script\\cheat\\includes\\destroy_item.lua";

function destroyItems()
	local MaxPutinCount = 10;
	PutinItemBox("Ti�u h�y v�t ph�m", MaxPutinCount, "B�n mu�n ti�u h�y nh�ng v�t ph�m �� ��t v�o?", THIS_FILE, 1);
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
			-- Msg2Player(format("t[%d][%d]",i,j)..t[i][j]);
		-- end
	-- end
	
	local nResult = 1;
	for i = 1, getn(t) do
		--local nCount = get_item_count(t, t[i][2], t[i][3], t[i][4]);
		if DelItemByIndex(t[i][1], -1) ~= 1 then
			nResult = 0;
		end
	end
	if nResult == 1 then
		Msg2Player("Ti�u h�y th�nh c�ng!");
	else
		Msg2Player("�� x�y ra l�i trong qu� tr�nh ti�u h�y.");
	end
end

function get_item_count(t, id1, id2, id3)
	local nCount = 0;
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2 and t[i][4] == id3) then
			nCount = nCount + 1;
		end
	end
	return nCount;
end