Include("\\script\\mod\\expand_box\\expand_box_head.lua");
THIS_FILE = "\\script\\mod\\carriage\\npc_xevanchuyen.lua";
tItems = {}
nStoreId = 2;
function main()
	-- local nCarriageId = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX);
	-- "ChÊt nhê ®å lªn xe"
	
	init(nStoreId);
	local tbSay = {
		"\n>> ChÊt ®å lªn xe/#showThingsIn(0)",
		"\n>> Dì ®å xuèng xe/#showThingsOut(0)",
		"\n>> §Ëy n¾p thïng xe/nothing",
	}
	Say(format("T×nh tr¹ng hµng trªn xe: %d/%d",MAX_ITEM_COUNT,MAX_CARRIAGE_ITEMS),getn(tbSay),tbSay);
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
		Talk(1,"","Hµnh trang kh«ng cã vËt phÈm phï hîp bá vµo xe");
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
		Talk(1,"","§· ®Õn trang cuèi");
	end
	
	-- print(nBegin,nEnd);
	
	local szHead = format("Trang <color=yellow>%d<color>/%d. "
		.."Tæng céng <color=yellow>%d<color> vËt phÈm. §ang hiÓn thÞ vËt phÈm: %d - %d"
		,nPageIn,nPages,nMaxItems,nBegin,nEnd);
	for i = nBegin, nEnd do 
		tinsert(tbSay,format("[%d] %s x%d/#putin(%d)",i,t[i][1],t[i][3],i));
	end
	

	if nPageIn < nPages then 
	tinsert(tbSay, "Trang kÕ/#showThingsIn(1)")
	end
	if nPageIn > 1 then 
	tinsert(tbSay, "Trang tr­íc/#showThingsIn(-1)")
	end
	tinsert(tbSay,format("\nBá vËt phÈm ë trang nµy vµo xe/#putthispage(%d,%d,%d)",nPageIn,nBegin,nEnd));
	tinsert(tbSay,"Bá toµn bé vµo xe/putallin");
	tinsert(tbSay,"Kh«ng bá g× vµo/nothing");
	Say (szHead,getn(tbSay),tbSay);
	
end;

function putthispage(nPage,nBegin,nEnd)
	for i=nBegin, nEnd do 
		local object = tItems[i];
		DelItem(object[2][1],object[2][2],object[2][3],object[3]);
		insertrowtodata(object,nStoreId);
		Msg2Player(format("§· bá %s x%d vµo xe chë ®å",tItems[i][1],tItems[i][3]));
	end
	showThingsIn(0);
end;

function putallin()
	if getn(tItems) > GetStoreFreeRoomCarriage() then 
		Talk(1,"","<color=red>Xe qu¸ ®Çy, kh«ng thÓ chÊt thªm nhiÒu ®å!<color>");
		return 0;
	end
	DelItemsByList(tItems);
	inserttabletodata(tItems,nStoreId);
	Msg2Player("§· bá tÊt c¶ vµo xe chë ®å");
end;


function putin(index)
	if MAX_CARRIAGE_ITEMS == getn(tItems)then 
		Talk(1,"","<color=red>Xe qu¸ ®Çy, kh«ng thÓ chÊt thªm ®å!<color>");
		return 0;
	end
	local object = tItems[index];
	DelItem(object[2][1],object[2][2],object[2][3],object[3]);
	insertrowtodata(object,nStoreId);
	Msg2Player(format("§· bá %s x%d vµo xe ®å",tItems[index][1],tItems[index][3]));
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
		Talk(1,"","Xe trèng");
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
		Talk(1,"","§· ®Õn trang cuèi");
	end
	
	-- print(nBegin,nEnd);
	
	local szHead = format("Trang <color=yellow>%d<color>/%d. "
		.."Tæng céng <color=yellow>%d<color> vËt phÈm. §ang hiÓn thÞ vËt phÈm: %d - %d"
		,nPageOut,nPages,nMaxItems,nBegin,nEnd);
	for i = nBegin, nEnd do 
		tinsert(tbSay,format("[%d] %s x%d/#takeout(%d)",i,t[i][1],t[i][3],i));
	end
	
	if nMaxItems < 1 then 
		Talk(1,"","Hµnh trang kh«ng cã vËt phÈm phï hîp bá vµo xe");
	else	
		if nPageOut < nPages then 
		tinsert(tbSay, "Trang kÕ/#showThingsOut(1)")
		end
		if nPageOut > 1 then 
		tinsert(tbSay, "Trang tr­íc/#showThingsOut(-1)")
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