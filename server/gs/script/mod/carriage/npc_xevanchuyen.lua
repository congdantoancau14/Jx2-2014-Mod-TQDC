Include("\\script\\mod\\expand_box\\expand_box_head.lua");
THIS_FILE = "\\script\\mod\\carriage\\npc_xevanchuyen.lua";
MAX_ITEM = MAX_CARRIAGE_ITEMS;
g_tbInBagItems = {}
g_nStoreId = STORE_ID_CARRIAGE;
nNpcIndex = nil;
szStoreFileName = "unknown";
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function main()
	nNpcIndex = GetTargetNpc(); 
	local nCarriageName = GetNpcName(nNpcIndex);
	szStoreFileName = nCarriageName;
	local nCarriageId = GetTask(BIAOCHE_INDEX);
	-- print(nNpcIndex,nCarriageId);
	
	-- init(g_nStoreId);	-- Store items with player rolename as filename
	init(g_nStoreId,nCarriageName); -- Store items with npcindex as filename
	--init(g_nStoreId,0); -- Store items with playername n?p?c?i?n?d?e?x? as filename
	
	local szHead = format("T�nh tr�ng h�ng tr�n xe: %d/%d",ITEM_COUNT,MAX_CARRIAGE_ITEMS)
	if GetTargetNpc() ~= nCarriageId then 
		szHead = "<color=red>Ch�t nh� �� l�n xe<color>. "..szHead;
	end
	
	local tbSay = {
		"\n>> Ch�t l�n khay/putintray",
		"\n>> Ch�t �� l�n xe/showThingsIn",
		"\n>> D� �� xu�ng xe/showThingsOut",
		"\n>> ��y n�p th�ng xe/nothing",
	}
	Say(szHead,getn(tbSay),tbSay);
end;
-------------------------------------------------------------------------------
function putintray()
	PutinItemBox("��t �� l�n xe", MaxPutinCount, "X�c nh�n ��t �� l�n xe", THIS_FILE, 1);
end;

function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	if GetItemSpecialAttr(idx,"LOCK") == 1 then --�����ж�
		Talk(1,"","V�t ph�m �� kh�a kh�ng th� ch�t l�n xe!");
		return 0;
	end
	if genre ~= 2 then 
		Talk(1,"","V�t n�y kh�ng ph� h�p b� l�n xe");
		return 0;
	end
	
	local nCount = GetItemParam(idx, 1) -- Get from archive_box.lua, seem not to work
	local nItemMapID = GetItemParam(idx, 0)
	
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
	
	xb_puttrayin(t,g_nStoreId,szStoreFileName);
	
end

-------------------------------------------------------------------------------

nPageIn = 1;

function showThingsIn(nNav)
	if nNav == nil then
		nNav = 0;
		nPageIn = 1;
	end
	--print(nPageIn.."-"..nNav);
	g_tbInBagItems = getAllowItems();
	--print(getn(g_tbInBagItems))
	local t = g_tbInBagItems;

	nPageIn = xb_generateNavigation(g_nStoreId,nPageIn,nNav,t,DIRECT_PUTIN);
end;



nPageOut = 1;


function showThingsOut(nNav)
	if nNav == nil then
		nNav = 0;
		nPageOut = 1;
	end
	
	local t = TB_ITEMS;
	nPageOut = xb_generateNavigation(g_nStoreId,nPageOut,nNav,t,DIRECT_TAKEOUT);
end;


function putthispage(nBegin,nEnd)
	xb_putthispage(g_tbInBagItems,nBegin,nEnd,g_nStoreId,szStoreFileName)
end;

function putonein(nInTableItemIndex)
	xb_putonein(g_tbInBagItems,nInTableItemIndex,g_nStoreId,szStoreFileName)
end;

function putallin()
	xb_putallin(g_tbInBagItems,g_nStoreId,szStoreFileName)
end;

function takethispage(nBegin,nEnd)
	xb_takethispage(nBegin,nEnd,g_nStoreId,szStoreFileName)
end;

function takeoneout(nInTableItemIndex)
	xb_takeoneout(nInTableItemIndex,g_nStoreId,szStoreFileName)
end;

function takeallout()
	xb_takeallout(g_nStoreId,szStoreFileName)
end;

function nothing()
end;




-------------------------------------------------------------

function showThingsIn_original(nNav)
	if nNav == nil then
		nNav = 0;
		nPageIn = 1;
	end
	
	g_tbInBagItems = getAllowItems();
	--print(getn(g_tbInBagItems))
	local t = g_tbInBagItems;
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
		nPageIn = nPages;
		-- Talk(1,"","�� ��n trang cu�i");
		-- return 0;
	end
	
	-- print(nBegin,nEnd);
	
	local szHead = format("Trang <color=yellow>%d<color>/%d. "
		.."T�ng c�ng <color=yellow>%d<color> v�t ph�m. �ang hi�n th� v�t ph�m: %d - %d"
		,nPageIn,nPages,nMaxItems,nBegin,nEnd);
	for i = nBegin, nEnd do 
		tinsert(tbSay,format("[%d] %s x%d/#putonein(%d)",i,t[i][1],t[i][3],i));
	end
	
	local nEmptyLine = nMaxinPage - (nEnd - nBegin + 1);
	if nEmptyLine < nMaxinPage then 
		for i=1, nEmptyLine do 
			tinsert(tbSay," ");
		end
	end
	
	if nPageIn < nPages then 
		tinsert(tbSay, "Trang k�/#showThingsIn(1)")
	else
		tinsert(tbSay, format("Trang ��u/#showThingsIn(%d)",-nPages+1))
	end
	if nPageIn > 1 then 
		tinsert(tbSay, "Trang tr��c/#showThingsIn(-1)")
	else
		tinsert(tbSay, format("Trang cu�i/#showThingsIn(%d)",nPages-nPageIn))
	end
	
	tinsert(tbSay,format("\nB� v�t ph�m � trang n�y v�o xe/#putthispage(%d,%d)",nBegin,nEnd));
	tinsert(tbSay,format("Ch�t to�n b� l�n xe/putallin"));
	tinsert(tbSay,"Kh�ng b� g� v�o/nothing");
	Say (szHead,getn(tbSay),tbSay);
	
end;

function putthispage_original(nPage,nBegin,nEnd)
	if nEnd - nBegin > GetStoreFreeRoom(g_nStoreId,szStoreFileName) then 
		Talk(1,"","<color=red>Xe qu� ��y, kh�ng th� ch�t th�m nhi�u ��!<color>");
		return 0;
	end
	for i=nBegin, nEnd do 
		local object = g_tbInBagItems[i];
		DelItem(object[2][1],object[2][2],object[2][3],object[3]);
		insertrowtodata(object,g_nStoreId,szStoreFileName);
		Msg2Player(format("�� b� %s x%d v�o xe ch� ��",g_tbInBagItems[i][1],g_tbInBagItems[i][3]));
	end
	showThingsIn(0);
end;

function putallin_original()
	if getn(g_tbInBagItems) > GetStoreFreeRoom(g_nStoreId,szStoreFileName) then 
		Talk(1,"","<color=red>Xe qu� ��y, kh�ng th� ch�t th�m nhi�u ��!<color>");
		return 0;
	end
	DelItemsByList(g_tbInBagItems);
	inserttabletodata(g_tbInBagItems,g_nStoreId,szStoreFileName);
	Msg2Player();
end;


function putonein_original(index)
	if ITEM_COUNT == MAX_CARRIAGE_ITEMS then 
		Talk(1,"","<color=red>Xe qu� ��y, kh�ng th� ch�t th�m ��!<color>");
		return 0;
	end
	local object = g_tbInBagItems[index];
	DelItem(object[2][1],object[2][2],object[2][3],object[3]);
	insertrowtodata(object,g_nStoreId,szStoreFileName);
	Msg2Player(format("�� b� %s x%d v�o xe ��",g_tbInBagItems[index][1],g_tbInBagItems[index][3]));
	showThingsIn(0);
end;

function showThingsOut_original(nNav)
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
		nPageOut = nPages;
		-- Talk(1,"","�� ��n trang cu�i");
		-- return 0;
	end
	
	-- print(nBegin,nEnd);
	
	local szHead = format("Trang <color=yellow>%d<color>/%d. "
		.."T�ng c�ng <color=yellow>%d<color> v�t ph�m. �ang hi�n th� v�t ph�m: %d - %d"
		,nPageOut,nPages,nMaxItems,nBegin,nEnd);
	for i = nBegin, nEnd do 
		tinsert(tbSay,format("[%d] %s x%d/#takeoneout(%d)",i,t[i][1],t[i][3],i));
	end
	
	local nEmptyLine = nMaxinPage - (nEnd - nBegin + 1);
	if nEmptyLine < nMaxinPage then 
		for i=1, nEmptyLine do 
			tinsert(tbSay," ");
		end
	end

	if nPageOut < nPages then 
		tinsert(tbSay, "Trang k�/#showThingsOut(1)")
	else
		tinsert(tbSay, format("Trang ��u/#showThingsOut(%d)",-nPages+1))
	end
	if nPageOut > 1 then 
		tinsert(tbSay, "Trang tr��c/#showThingsOut(-1)")
	else
		tinsert(tbSay, format("Trang cu�i/#showThingsOut(%d)",nPages-nPageIn))
	end
	
	tinsert(tbSay,format("\nL�y t�t c� v�t ph�m � trang n�y/#takethispage(%d,%d)",nBegin,nEnd))
	tinsert(tbSay,"L�y t�t c� ra h�nh trang/takeallout");
	tinsert(tbSay,"Kh�ng l�y n�a/nothing");
	Say (szHead,getn(tbSay),tbSay);
	
end;
