Include("\\script\\mod\\expand_box\\expand_box_head.lua");
THIS_FILE = "\\script\\mod\\carriage\\npc_xevanchuyen.lua";
tItems = {}
nStoreId = 2;
function main()
	-- local nCarriageId = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX);
	-- "Ch�t nh� �� l�n xe"
	
	init(nStoreId);
	local tbSay = {
		"\n>> Ch�t �� l�n xe/#showThingsIn(0)",
		"\n>> D� �� xu�ng xe/#showThingsOut(0)",
		"\n>> ��y n�p th�ng xe/nothing",
	}
	Say(format("T�nh tr�ng h�ng tr�n xe: %d/%d",MAX_ITEM_COUNT,MAX_CARRIAGE_ITEMS),getn(tbSay),tbSay);
end;

nPageIn = 1;

function showThingsIn(nNav)
	if nNav == nil then
		nNav = 0;
		nPageIn = 1;
	end
	
	tItems = getAllowItems();
	-- print(getn(tItems))
	local t = tItems;
	local tbSay = {}
	local nMaxItems = getn(t);

	if nMaxItems < 1 then 
		Talk(1,"","H�nh trang kh�ng c� v�t ph�m ph� h�p b� v�o xe");
		return 0;
	end

	local nMaxinPage = 5;
	local nPages = ceil(nMaxItems/nMaxinPage);
	
	local nBegin = 0;
	
	nPageIn = nPageIn + nNav;
	
	if nPageIn == 1 then 
		nBegin = 1;
	else
		nBegin = (nPageIn-1) * nMaxinPage + 1;	
	end
	local nLastPageReached = nBegin;
	local nEnd = 0
	
	if nPageIn == nPages then
		local nOverflow = nMaxItems - nLastPageReached;
		-- print("nOverflow = nMaxItems - nLastPageReached",  nOverflow,nMaxItems, nLastPageReached)
		nEnd = nBegin + nOverflow;
	else
		nEnd = nBegin + nMaxinPage - 1;
	end
	
	if nPageIn > nPages then 
		Talk(1,"","�� ��n trang cu�i");
	end
	
	-- print(nBegin,nEnd);
	
	local szHead = format("Trang <color=yellow>%d<color>/%d. "
		.."T�ng c�ng <color=yellow>%d<color> v�t ph�m. �ang hi�n th� v�t ph�m: %d - %d"
		,nPageIn,nPages,nMaxItems,nBegin,nEnd);
	for i = nBegin, nEnd do 
		tinsert(tbSay,format("[%d] %s x%d/#putin(%d)",i,t[i][1],t[i][3],i));
	end
	

	if nPageIn < nPages then 
	tinsert(tbSay, "Trang k�/#showThingsIn(1)")
	end
	if nPageIn > 1 then 
	tinsert(tbSay, "Trang tr��c/#showThingsIn(-1)")
	end
	tinsert(tbSay,format("\nB� v�t ph�m � trang n�y v�o xe/#putthispage(%d,%d,%d)",nPageIn,nBegin,nEnd));
	tinsert(tbSay,"B� to�n b� v�o xe/putallin");
	tinsert(tbSay,"Kh�ng b� g� v�o/nothing");
	Say (szHead,getn(tbSay),tbSay);
	
end;

function putthispage(nPage,nBegin,nEnd)
	for i=nBegin, nEnd do 
		local object = tItems[i];
		DelItem(object[2][1],object[2][2],object[2][3],object[3]);
		insertrowtodata(object,nStoreId);
		Msg2Player(format("�� b� %s x%d v�o xe ch� ��",tItems[i][1],tItems[i][3]));
	end
	showThingsIn(0);
end;

function putallin()
	if getn(tItems) > GetStoreFreeRoomCarriage() then 
		Talk(1,"","<color=red>Xe qu� ��y, kh�ng th� ch�t th�m nhi�u ��!<color>");
		return 0;
	end
	DelItemsByList(tItems);
	inserttabletodata(tItems,nStoreId);
	Msg2Player("�� b� t�t c� v�o xe ch� ��");
end;


function putin(index)
	if MAX_CARRIAGE_ITEMS == getn(tItems)then 
		Talk(1,"","<color=red>Xe qu� ��y, kh�ng th� ch�t th�m ��!<color>");
		return 0;
	end
	local object = tItems[index];
	DelItem(object[2][1],object[2][2],object[2][3],object[3]);
	insertrowtodata(object,nStoreId);
	Msg2Player(format("�� b� %s x%d v�o xe ��",tItems[index][1],tItems[index][3]));
	showThingsIn(0);
end;

nPageOut = 1;

function showThingsOut(nNav)
	if nNav == nil then
		nNav = 0;
		nPageOut = 1;
	end
	
	local t = TB_ITEMS;
	local tbSay = {}
	local nMaxItems = getn(t);
	
	if nMaxItems == 0 then
		Talk(1,"","Xe tr�ng");
		return 0;
	end;

	local nMaxinPage = 5;
	local nPages = ceil(nMaxItems/nMaxinPage);
	
	local nBegin = 0;
	
	nPageOut = nPageOut + nNav;
	
	if nPageOut == 1 then 
		nBegin = 1;
	else
		nBegin = (nPageOut-1) * nMaxinPage + 1;	
	end
	local nLastPageReached = nBegin;
	local nEnd = 0
	
	if nPageOut == nPages then
		local nOverflow = nMaxItems - nLastPageReached;
		-- print("nOverflow = nMaxItems - nLastPageReached",  nOverflow,nMaxItems, nLastPageReached)
		nEnd = nBegin + nOverflow;
	else
		nEnd = nBegin + nMaxinPage - 1;
	end
	
	if nPageOut > nPages then 
		Talk(1,"","�� ��n trang cu�i");
	end
	
	-- print(nBegin,nEnd);
	
	local szHead = format("Trang <color=yellow>%d<color>/%d. "
		.."T�ng c�ng <color=yellow>%d<color> v�t ph�m. �ang hi�n th� v�t ph�m: %d - %d"
		,nPageOut,nPages,nMaxItems,nBegin,nEnd);
	for i = nBegin, nEnd do 
		tinsert(tbSay,format("[%d] %s x%d/#takeout(%d)",i,t[i][1],t[i][3],i));
	end
	
	if nMaxItems < 1 then 
		Talk(1,"","H�nh trang kh�ng c� v�t ph�m ph� h�p b� v�o xe");
	else	
		if nPageOut < nPages then 
		tinsert(tbSay, "Trang k�/#showThingsOut(1)")
		end
		if nPageOut > 1 then 
		tinsert(tbSay, "Trang tr��c/#showThingsOut(-1)")
		end
		tinsert(tbSay,format("\nL�y t�t c� v�t ph�m � trang n�y/#takethispage(%d,%d,%d)",nPageOut,nBegin,nEnd))
		tinsert(tbSay,"L�y t�t c� ra h�nh trang/takeallout");
		tinsert(tbSay,"Kh�ng l�y n�a/nothing");
		Say (szHead,getn(tbSay),tbSay);
	end
	
end;

function takethispage(nPage,nBegin,nEnd)
	if nEnd - nBegin > GetFreeItemRoom() then 
		Talk(1,"","<color=red>H�nh trang qu� ��y!<color>");
		return 0;
	end
	for i=nBegin, nEnd do 
		local object = TB_ITEMS[i];
		AddItem(object[2][1],object[2][2],object[2][3],object[3]);
		RemoveItemFromFile(object,nStoreId);
	end
	showThingsOut(0);
end;

function takeout(index)
	local object = TB_ITEMS[index];
	AddItem(object[2][1],object[2][2],object[2][3],object[3]);
	RemoveItemFromFile(object,nStoreId);
	showThingsOut(0);
end;

function takeallout()
	local nFreeRoom = GetFreeItemRoom();
	local nOverflow = 0;
	
	AddItemsByList(TB_ITEMS);
	if MAX_ITEM_COUNT > nFreeRoom then 
		nOverflow = MAX_ITEM_COUNT - nFreeRoom;
		local tMoveItems = tablesplit(TB_ITEMS, 1, nFreeRoom);
		local tDropItems = tablesplit(TB_ITEMS, nFreeRoom+1, nOverflow);
		if getn(tDropItems) > 0 then
			DropItemsByList(tDropItems);
		end
	end

	erasedata(nStoreId);
end;


function nothing()
end;