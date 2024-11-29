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

tItems = {}
nCount = 0;
nPage = 1;
nPages = 1;
ITEM_PER_PAGE = 5;

function destroyListItems()
	navigation(0);
end;

function navigation(nNav)
	tItems = GetItemsInBag();
	nCount = getn(tItems);
	-- print(nCount);
	if nCount < 1 then 
		Msg2Player("H�nh trang �� tr�ng");
		return 0;
	end
	local nRound = floor(nCount/ITEM_PER_PAGE)*ITEM_PER_PAGE;
	
	nPages = ceil(nCount/ITEM_PER_PAGE);
	nPage = nPage + nNav;
	
	if nPage >= nPages then 
		nPage = nPages;
	end
	
	local nBegin = (nPage-1) * ITEM_PER_PAGE + 1;
	local nEnd = nBegin + ITEM_PER_PAGE - 1;
	if nPage == nPages and nRound < nCount then 
		nEnd = nBegin + nCount - nRound - 1;
	end
	
	local tbSay = {}
	
	for i=nBegin,nEnd do 
		tinsert(tbSay,format("[%d] %s x%d/#ask_for_confirm_delitem(%d)",i,tItems[i][1],tItems[i][3],i))
	end
	
	if nPage < nPages then
		tinsert(tbSay, "\nTrang sau/#navigation(1)");
	else
		tinsert(tbSay, format("\nTrang ��u/#navigation(%d)",-nPage+1));
	end
	if nPage > 1 then 
		tinsert(tbSay, "Trang tr��c/#navigation(-1)");
	else
		tinsert(tbSay, format("Trang cu�i/#navigation(%d)",nPages-nPage));
	end
	tinsert(tbSay,format("X�a trang n�y/#confirm_del_this_page(%d)",nPage));
	tinsert(tbSay,"\nKh�ng x�a/nothing");
	Say(format("T�ng c�ng c� <color=yellow>%d<color> lo�i item. �ang hi�n th� trang <color=gold>%d<color>\/%d.",nCount,nPage,nPages),getn(tbSay),tbSay);
end;

function confirm_del_this_page(nPage)
	Say(format("X�c nh�n x�a trang [<color=yellow>%d<color>]?",nPage),2,
		format("\n>> X�c nh�n/#delThisPage(%d)",nPage),
		"\n>> Kh�ng/nothing"
	)
end;

function delThisPage(nPage)
	local nRound = floor(nCount/ITEM_PER_PAGE)*ITEM_PER_PAGE;
	local nBegin = (nPage-1) * ITEM_PER_PAGE + 1;
	local nEnd = nBegin + ITEM_PER_PAGE - 1;
	if nPage == nPages then 
		nEnd = nBegin + nCount - nRound - 1;
	end
	
	local nBegin = (nPage-1) * ITEM_PER_PAGE + 1;
	local nEnd = nBegin + ITEM_PER_PAGE - 1;
	if nPage == nPages and nRound < nCount then 
		nEnd = nBegin + nCount - nRound - 1;
	end
	
	-- print(nBegin,nEnd);
	for i=nBegin, nEnd do 
		local nDel = DelItem(tItems[i][2][1],tItems[i][2][2],tItems[i][2][3],tItems[i][3]);
		if nDel == 1 then 
			Msg2Player(format("�� x�a %s x%d c�a trang %d.",tItems[i][1],tItems[i][3],nPage))
		else
			Msg2Player(format("X�y ra l�i khi x�a %s x%d c�a trang %d.",tItems[i][1],tItems[i][3],nPage))
			return 0;
		end
	end
	
	navigation(0);
end;

function ask_for_confirm_delitem(nIndex)
	Say(format("X�c nh�n x�a <color=yellow>%s x%d<color> kh�i h�nh trang?",tItems[nIndex][1],tItems[nIndex][3]),2,
		format("\n>> X�c nh�n/#DelItemFromBag(%d)",nIndex),
		"\n>> Kh�ng/nothing"
	)
end

function DelItemFromBag(nIndex)
	local nDel = DelItem(tItems[nIndex][2][1],tItems[nIndex][2][2],tItems[nIndex][2][3],tItems[nIndex][3]);
	if nDel == 1 then 
		Msg2Player(format("X�a th�nh c�ng [%s] x%d",tItems[nIndex][1],tItems[nIndex][3]))
		navigation(0);
		return 1;
	else
		Msg2Player(format("X�a th�t b�i [%s] x%d",tItems[nIndex][1],tItems[nIndex][3]))
		return 0;
	end
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