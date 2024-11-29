Include("\\script\\mod\\expand_box\\expand_box_head.lua");
THIS_FILE = "\\script\\mod\\carriage\\npc_xevanchuyen.lua";
tbInBagItems = {}
nStoreId = 2;
nNpcIndex = nil;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function main()
	nNpcIndex = GetTargetNpc();  -- Disable this will store items with rolename
	local nCarriageId = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX);
	-- print(nNpcIndex,nCarriageId);
	
	-- init(nStoreId);	-- Store items with player rolename as filename
	init(nStoreId,nNpcIndex); -- Store items with npcindex as filename
	
	local szHead = format("T�nh tr�ng h�ng tr�n xe: %d/%d",ITEM_COUNT,MAX_CARRIAGE_ITEMS)
	if nNpcIndex ~= nCarriageId then 
		szHead = "<color=red>Ch�t nh� �� l�n xe<color>. "..szHead;
	end
	
	local tbSay = {
		"\n>> Ch�t l�n khay/putintray",
		"\n>> Ch�t �� l�n xe/#showThingsIn(0)",
		"\n>> D� �� xu�ng xe/#showThingsOut(0)",
		"\n>> ��y n�p th�ng xe/nothing",
	}
	Say(szHead,getn(tbSay),tbSay);
end;
-------------------------------------------------------------------------------
function putintray()
	local MaxPutinCount = 10;
	PutinItemBox("��t �� l�n xe", MaxPutinCount, "X�c nh�n ��t �� l�n xe", THIS_FILE, 1);
end;

function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	if genre ~= 2 then 
		Talk(1,"","V�t n�y kh�ng ph� h�p b� l�n xe");
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
	
	puttrayin(t);
	
end


function puttrayin(t)
	if getn(t) > GetStoreFreeRoom(nStoreId,nNpcIndex) then 
		Talk(1,"","<color=red>Xe qu� ��y, kh�ng th� ch�t th�m nhi�u ��!<color>");
		return 0;
	end
	
	for i = 1, getn(t) do
		if DelItemByIndex(t[i][1], -1) ~= 1 then
			print("error: Could not delete item from tray! Index = ",i)
		end
		local nCount = get_item_count(t, t[i][2], t[i][3], t[i][4]);
		local object = {t[i][5],{t[i][2],t[i][3],t[i][4]},nCount};
		insertrowtodata(object,nStoreId,nNpcIndex);
		Msg2Player(format("�� b� %s x%d v�o xe ch� ��",t[i][5],nCount));
	end
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

-------------------------------------------------------------------------------

nPageIn = 1;

function showThingsIn(nNav)
	if nNav == nil then
		nNav = 0;
		nPageIn = 1;
	end
	
	tbInBagItems = getAllowItems();
	-- print(getn(tbInBagItems))
	local t = tbInBagItems;
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
		tinsert(tbSay,format("[%d] %s x%d/#putonein(%d)",i,t[i][1],t[i][3],i));
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
	if nEnd - nBegin > GetStoreFreeRoom(nStoreId,nNpcIndex) then 
		Talk(1,"","<color=red>Xe qu� ��y, kh�ng th� ch�t th�m nhi�u ��!<color>");
		return 0;
	end
	for i=nBegin, nEnd do 
		local object = tbInBagItems[i];
		DelItem(object[2][1],object[2][2],object[2][3],object[3]);
		insertrowtodata(object,nStoreId,nNpcIndex);
		Msg2Player(format("�� b� %s x%d v�o xe ch� ��",tbInBagItems[i][1],tbInBagItems[i][3]));
	end
	showThingsIn(0);
end;

function putallin()
	if getn(tbInBagItems) > GetStoreFreeRoom(nStoreId,nNpcIndex) then 
		Talk(1,"","<color=red>Xe qu� ��y, kh�ng th� ch�t th�m nhi�u ��!<color>");
		return 0;
	end
	DelItemsByList(tbInBagItems);
	inserttabletodata(tbInBagItems,nStoreId,nNpcIndex);
	Msg2Player("�� b� t�t c� v�o xe ch� ��");
end;


function putonein(index)
	if ITEM_COUNT == MAX_CARRIAGE_ITEMS then 
		Talk(1,"","<color=red>Xe qu� ��y, kh�ng th� ch�t th�m ��!<color>");
		return 0;
	end
	local object = tbInBagItems[index];
	DelItem(object[2][1],object[2][2],object[2][3],object[3]);
	insertrowtodata(object,nStoreId,nNpcIndex);
	Msg2Player(format("�� b� %s x%d v�o xe ��",tbInBagItems[index][1],tbInBagItems[index][3]));
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
		tinsert(tbSay,format("[%d] %s x%d/#takeoneout(%d)",i,t[i][1],t[i][3],i));
	end
	

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
	
end;

function takethispage(nPage,nBegin,nEnd)
	if nEnd - nBegin > GetFreeItemRoom() then 
		Talk(1,"","<color=red>H�nh trang qu� ��y!<color>");
		return 0;
	end
	for i=nBegin, nEnd do 
		local object = TB_ITEMS[i];
		AddItem(object[2][1],object[2][2],object[2][3],object[3]);
		RemoveItemFromFile(object,nStoreId,nNpcIndex);
	end
	showThingsOut(0);
end;

function takeoneout(index)
	local object = TB_ITEMS[index];
	AddItem(object[2][1],object[2][2],object[2][3],object[3]);
	RemoveItemFromFile(object,nStoreId,nNpcIndex);
	showThingsOut(0);
end;

function takeallout()
	local nFreeRoom = GetFreeItemRoom();
	local nOverflow = 0;
	
	AddItemsByList(TB_ITEMS);
	if ITEM_COUNT > nFreeRoom then 
		nOverflow = ITEM_COUNT - nFreeRoom;
		local tMoveItems = tablesplit(TB_ITEMS, 1, nFreeRoom);
		local tDropItems = tablesplit(TB_ITEMS, nFreeRoom+1, nOverflow);
		if getn(tDropItems) > 0 then
			DropItemsByList(tDropItems);
		end
	end

	erasedata(nStoreId,nNpcIndex);
end;


function nothing()
end;