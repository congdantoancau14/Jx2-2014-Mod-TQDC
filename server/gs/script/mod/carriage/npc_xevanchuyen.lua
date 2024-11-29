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
	
	local szHead = format("T×nh tr¹ng hµng trªn xe: %d/%d",ITEM_COUNT,MAX_CARRIAGE_ITEMS)
	if GetTargetNpc() ~= nCarriageId then 
		szHead = "<color=red>ChÊt nhê ®å lªn xe<color>. "..szHead;
	end
	
	local tbSay = {
		"\n>> ChÊt lªn khay/putintray",
		"\n>> ChÊt ®å lªn xe/showThingsIn",
		"\n>> Dì ®å xuèng xe/showThingsOut",
		"\n>> §Ëy n¾p thïng xe/nothing",
	}
	Say(szHead,getn(tbSay),tbSay);
end;
-------------------------------------------------------------------------------
function putintray()
	PutinItemBox("§Æt ®å lªn xe", MaxPutinCount, "X¸c nhËn ®Æt ®å lªn xe", THIS_FILE, 1);
end;

function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	if GetItemSpecialAttr(idx,"LOCK") == 1 then --Ëø¶¨ÅÐ¶Ï
		Talk(1,"","VËt phÈm ®· khãa kh«ng thÓ chÊt lªn xe!");
		return 0;
	end
	if genre ~= 2 then 
		Talk(1,"","VËt nµy kh«ng phï hîp bá lªn xe");
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
		nPageIn = nPages;
		-- Talk(1,"","§· ®Õn trang cuèi");
		-- return 0;
	end
	
	-- print(nBegin,nEnd);
	
	local szHead = format("Trang <color=yellow>%d<color>/%d. "
		.."Tæng céng <color=yellow>%d<color> vËt phÈm. §ang hiÓn thÞ vËt phÈm: %d - %d"
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
		tinsert(tbSay, "Trang kÕ/#showThingsIn(1)")
	else
		tinsert(tbSay, format("Trang ®Çu/#showThingsIn(%d)",-nPages+1))
	end
	if nPageIn > 1 then 
		tinsert(tbSay, "Trang tr­íc/#showThingsIn(-1)")
	else
		tinsert(tbSay, format("Trang cuèi/#showThingsIn(%d)",nPages-nPageIn))
	end
	
	tinsert(tbSay,format("\nBá vËt phÈm ë trang nµy vµo xe/#putthispage(%d,%d)",nBegin,nEnd));
	tinsert(tbSay,format("ChÊt toµn bé lªn xe/putallin"));
	tinsert(tbSay,"Kh«ng bá g× vµo/nothing");
	Say (szHead,getn(tbSay),tbSay);
	
end;

function putthispage_original(nPage,nBegin,nEnd)
	if nEnd - nBegin > GetStoreFreeRoom(g_nStoreId,szStoreFileName) then 
		Talk(1,"","<color=red>Xe qu¸ ®Çy, kh«ng thÓ chÊt thªm nhiÒu ®å!<color>");
		return 0;
	end
	for i=nBegin, nEnd do 
		local object = g_tbInBagItems[i];
		DelItem(object[2][1],object[2][2],object[2][3],object[3]);
		insertrowtodata(object,g_nStoreId,szStoreFileName);
		Msg2Player(format("§· bá %s x%d vµo xe chë ®å",g_tbInBagItems[i][1],g_tbInBagItems[i][3]));
	end
	showThingsIn(0);
end;

function putallin_original()
	if getn(g_tbInBagItems) > GetStoreFreeRoom(g_nStoreId,szStoreFileName) then 
		Talk(1,"","<color=red>Xe qu¸ ®Çy, kh«ng thÓ chÊt thªm nhiÒu ®å!<color>");
		return 0;
	end
	DelItemsByList(g_tbInBagItems);
	inserttabletodata(g_tbInBagItems,g_nStoreId,szStoreFileName);
	Msg2Player();
end;


function putonein_original(index)
	if ITEM_COUNT == MAX_CARRIAGE_ITEMS then 
		Talk(1,"","<color=red>Xe qu¸ ®Çy, kh«ng thÓ chÊt thªm ®å!<color>");
		return 0;
	end
	local object = g_tbInBagItems[index];
	DelItem(object[2][1],object[2][2],object[2][3],object[3]);
	insertrowtodata(object,g_nStoreId,szStoreFileName);
	Msg2Player(format("§· bá %s x%d vµo xe ®å",g_tbInBagItems[index][1],g_tbInBagItems[index][3]));
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
		nPageOut = nPages;
		-- Talk(1,"","§· ®Õn trang cuèi");
		-- return 0;
	end
	
	-- print(nBegin,nEnd);
	
	local szHead = format("Trang <color=yellow>%d<color>/%d. "
		.."Tæng céng <color=yellow>%d<color> vËt phÈm. §ang hiÓn thÞ vËt phÈm: %d - %d"
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
		tinsert(tbSay, "Trang kÕ/#showThingsOut(1)")
	else
		tinsert(tbSay, format("Trang ®Çu/#showThingsOut(%d)",-nPages+1))
	end
	if nPageOut > 1 then 
		tinsert(tbSay, "Trang tr­íc/#showThingsOut(-1)")
	else
		tinsert(tbSay, format("Trang cuèi/#showThingsOut(%d)",nPages-nPageIn))
	end
	
	tinsert(tbSay,format("\nLÊy tÊt c¶ vËt phÈm ë trang nµy/#takethispage(%d,%d)",nBegin,nEnd))
	tinsert(tbSay,"LÊy tÊt c¶ ra hµnh trang/takeallout");
	tinsert(tbSay,"Kh«ng lÊy n÷a/nothing");
	Say (szHead,getn(tbSay),tbSay);
	
end;
