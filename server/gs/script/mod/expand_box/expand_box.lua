Include("\\script\\mod\\expand_box\\expand_box_head.lua");
Include("\\script\\mod\\store_box\\store_box_head.lua");
THIS_FILE = "\\script\\mod\\expand_box\\expand_box.lua";
tItems = {}
nStoreId = 1;
function main()
	if GetItemCount(key[1],key[2],key[3]) < 1 then 
		Talk(1,"","Kh«ng cã ch×a khãa, kh«ng thÓ më r­¬ng!\n(<color=gray>Thö hái thñ khè xem sao.<color>)");
		return 0;
	end
	local nNpcIndex = GetTargetNpc();
	local m,x,y = GetNpcWorldPos(nNpcIndex);
	-- print(getBoxId(m,x,y));
	if getBoxId(m,x,y) ~= GetTask(TASK_BOX_ID) then 
		Talk(1,"","Kh«ng ®óng ch×a khãa, kh«ng thÓ më r­¬ng!");
		return 0;
	end
	
	init(1);
	local tbSay = {
		"\n>> §Æt vµo khay/putintray",
		"\n>> §Æt ®å vµo/showThingsIn",
		"\n>> LÊy ®å ra/showThingsOut",
		"\n>> §Ëy r­¬ng l¹i/nothing",
	}
	Say("",getn(tbSay),tbSay);
end;

-------------------------------------------------------------------------------
function putintray()
	local MaxPutinCount = 10;
	PutinItemBox("§Æt ®å lªn xe", MaxPutinCount, "X¸c nhËn ®Æt ®å vµo r­¬ng", THIS_FILE, 1);
end;

function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	if genre ~= 2 then 
		Talk(1,"","VËt nµy kh«ng phï hîp bá vµo r­¬ng.");
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
	-- if getn(t) > GetStoreFreeRoom(nStoreId,nNpcIndex) then 
		-- Talk(1,"","<color=red>R­¬ng qu¸ ®Çy, kh«ng thÓ chÊt thªm nhiÒu ®å!<color>");
		-- return 0;
	-- end
	
	for i = 1, getn(t) do
		if DelItemByIndex(t[i][1], -1) ~= 1 then
			print("error: Could not delete item from tray! Index = ",i)
		end
		local nCount = get_item_count(t, t[i][2], t[i][3], t[i][4]);
		local object = {t[i][5],{t[i][2],t[i][3],t[i][4]},nCount};
		insertrowtodata(object,nStoreId,nNpcIndex);
		Msg2Player(format("§· bá %s x%d vµo r­¬ng ®å",t[i][5],nCount));
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
	
	tItems = getAllowItems();
	-- print(getn(tItems))
	local t = tItems;
	local tbSay = {}
	local nMaxItems = getn(t);

	if nMaxItems < 1 then 
		Talk(1,"","Hµnh trang kh«ng cã vËt phÈm phï hîp bá vµo r­¬ng");
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
		-- Talk(1,"","§· ®Õn trang cuèi");
		-- return 0;
	end
	
	-- print(nBegin,nEnd);
	
	local szHead = format("Trang <color=yellow>%d<color>/%d. "
		.."Tæng céng <color=yellow>%d<color> vËt phÈm. §ang hiÓn thÞ vËt phÈm: %d - %d"
		,nPageIn,nPages,nMaxItems,nBegin,nEnd);
	
	for i = nBegin, nEnd do 
		tinsert(tbSay,format("[%d] %s x%d/#putin(%d)",i,t[i][1],t[i][3],i));
	end
	
	local nEmptyLine = nMaxinPage - (nEnd - nBegin + 1);
	if nEmptyLine < nMaxinPage then 
		for i=1, nEmptyLine do 
			tinsert(tbSay," ");
		end
	end
	
	if nPageIn < nPages then 
		tinsert(tbSay, "Trang kÕ/#showThingsIn(1)")
	else
		tinsert(tbSay, format("Trang ®Çu/#showThingsIn(%d)",-nPages+1))
	end
	if nPageIn > 1 then 
		tinsert(tbSay, "Trang tr­íc/#showThingsIn(-1)")
	else
		tinsert(tbSay, format("Trang cuèi/#showThingsIn(%d)",nPages-nPageIn))
	end
	tinsert(tbSay,format("\nBá vËt phÈm ë trang nµy vµo r­¬ng/#putthispage(%d,%d,%d)",nPageIn,nBegin,nEnd));
	tinsert(tbSay,"Bá toµn bé vµo r­¬ng/putallin");
	tinsert(tbSay,"Kh«ng bá g× vµo/nothing");
	Say (szHead,getn(tbSay),tbSay);
	
end;

function putthispage(nPage,nBegin,nEnd)
	for i=nBegin, nEnd do 
		local object = tItems[i];
		DelItem(object[2][1],object[2][2],object[2][3],object[3]);
		insertrowtodata(object,nStoreId);
		Msg2Player(format("§· bá %s x%d vµo r­¬ng ®å",tItems[i][1],tItems[i][3]));
	end
	showThingsIn(0);
end;

function putallin()
	-- if getn(tItems) > GetStoreFreeRoom(nStoreId) then 
		-- Talk(1,"","<color=red>R­¬ng ®· ®Çy, kh«ng thÓ chøa thªm nhiÒu ®å!<color>");
		-- return 0;
	-- end
	DelItemsByList(tItems);
	inserttabletodata(tItems,nStoreId);
	Msg2Player("§· bá tÊt c¶ vµo r­¬ng chøa ®å");
end;

function putin(index)
	local object = tItems[index];
	DelItem(object[2][1],object[2][2],object[2][3],object[3]);
	insertrowtodata(object,nStoreId);
	Msg2Player(format("§· bá %s x%d vµo r­¬ng ®å",tItems[index][1],tItems[index][3]));
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
		Talk(1,"","R­¬ng trèng");
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
		nPageIn = nPages;
		-- Talk(1,"","§· ®Õn trang cuèi");
		-- return 0;
	end
	
	-- print(nBegin,nEnd);
	
	local szHead = format("Trang <color=yellow>%d<color>/%d. "
		.."Tæng céng <color=yellow>%d<color> vËt phÈm. §ang hiÓn thÞ vËt phÈm: %d - %d"
		,nPageOut,nPages,nMaxItems,nBegin,nEnd);
	for i = nBegin, nEnd do 
		tinsert(tbSay,format("[%d] %s x%d/#takeout(%d)",i,t[i][1],t[i][3],i));
	end
	
	local nEmptyLine = nMaxinPage - (nEnd - nBegin + 1);
	if nEmptyLine < nMaxinPage then 
		for i=1, nEmptyLine do 
			tinsert(tbSay," ");
		end
	end
	
	if nMaxItems < 1 then 
		Talk(1,"","Hµnh trang kh«ng cã vËt phÈm phï hîp bá vµo r­¬ng");
	else	
		if nPageOut < nPages then 
			tinsert(tbSay, "Trang kÕ/#showThingsOut(1)")
		else
			tinsert(tbSay, format("Trang ®Çu/#showThingsOut(%d)",-nPages+1))
		end
		if nPageOut > 1 then 
			tinsert(tbSay, "Trang tr­íc/#showThingsOut(-1)")
		else
			tinsert(tbSay, format("Trang cuèi/#showThingsOut(%d)",nPages-nPageIn))
		end
		tinsert(tbSay,format("\nLÊy tÊt c¶ vËt phÈm ë trang nµy/#takethispage(%d,%d,%d)",nPageOut,nBegin,nEnd))
		tinsert(tbSay,"LÊy tÊt c¶ ra hµnh trang/takeallout");
		tinsert(tbSay,"Kh«ng lÊy n÷a/nothing");
		Say (szHead,getn(tbSay),tbSay);
	end
	
end;

function takethispage(nPage,nBegin,nEnd)
	if nEnd - nBegin > GetFreeItemRoom() then 
		Talk(1,"","<color=red>Hµnh trang qu¸ ®Çy!<color>");
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
	if ITEM_COUNT > nFreeRoom then 
		nOverflow = ITEM_COUNT - nFreeRoom;
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