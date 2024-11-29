Include("\\script\\lib\\item.lua");
THIS_FILE = "\\script\\mod\\item\\punish_bad.lua";

function OnUse()
	local tbSay = {
		"Khay Ti�u h�y v�t ph�m/destroyItems",
		"List Ti�u h�y v�t ph�m/destroyListItems",
		"Thanh l� h�nh trang/ClearBagAllItem",
		"Tho�t/nothing"
	}
	Say("",getn(tbSay),tbSay);
end;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

function destroyListItems()
	RemoveItemInBag(1);
end;

tItems = {}
nPage = 1;
function RemoveItemInBag(nPage)
	tItems = GetItemsInBag();
	local nCount = getn(tItems);
	-- print(nCount);
	if nCount < 1 then 
		Msg2Player("H�nh trang �� tr�ng");
		return 0;
	end
	
	local nEnd = 30;
	
	local tbSay = {}
	if nPage == 1 then
		local nPages = 2;
		if nCount < nEnd then 
			nEnd = nCount;
			nPages = 1;
		else
			tinsert(tbSay, "Trang sau/#RemoveItemInBag(2)");
		end
		for i=1, nEnd do 
			-- print(i,tItems[i][1]);
			tinsert(tbSay,format("[%d] %s x%d/#ask_for_confirm_delitem(%d)",i,tItems[i][1],tItems[i][3],i))
		end
		if nPages > 1 then 
			tinsert(tbSay, "Trang sau/#RemoveItemInBag(2)");
		end
	else
		for i=nEnd+1, nCount do 
			tinsert(tbSay,format("[%d] %s x%d/#ask_for_confirm_delitem(%d)",i,tItems[i][1],tItems[i][3],i))
		end
		tinsert(tbSay, "Trang tr��c/#RemoveItemInBag(1)");
	end
	tinsert(tbSay,"\nKh�ng x�a/nothing");
	Say(format("T�ng c�ng c� <color=yellow>%d<color> item. Ch�n item �� x�a",nCount),getn(tbSay),tbSay);
end;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

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
			-- print(format("t[%d][%d]",i,j)..t[i][j]);
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

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

function ClearBagAllItem(bTag)
	if not bTag or tonumber(bTag) ~= 1 then
		Say("X�c nh�n thanh l� t�i", 2, "��ng �/#ClearBagAllItem(1)", "Ra kh�i/nothing")
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

function nothing() end;