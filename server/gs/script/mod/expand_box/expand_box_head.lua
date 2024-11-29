Include("\\script\\mod\\store_box\\store_box_head.lua");
Include("\\script\\lib\\string.lua");
Include("\\script\\lib\\item.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\class\\ktabfile.lua");
-- player_rolename = GetName();
-- player_rolename = totelex(player_rolename);
-- ITEM_FILEPATH = "data/expand_box/"..player_rolename..".txt";
-- TB_DATAITEMS = new(KTabFile, ITEM_FILEPATH);

STORE_ID_EXPAND_BOX = 1;
STORE_ID_CARRIAGE = 2;

MAX_EXPAND_BOX_ITEMS = 1000;
MAX_CARRIAGE_ITEMS = 100;

ITEM_COUNT = 0
TB_ITEMS = {}

WRITE_FILE = 1;
READ_FILE = 2;

MaxPutinCount = 60;

-- [boxid],{mapcoor},[mapname]
tExpandBoxs = {
	{201,{200,1490,2951},"§«ng BiÖn Kinh"},
	{202,{200,1299,2992},"Nam BiÖn Kinh"},
	{203,{200,1268,2771},"T©y BiÖn Kinh"},
	{301,{300,1909,3609},"§«ng Thµnh §«"},
	{302,{300,1685,3650},"Nam Thµnh §«"},
	{303,{300,1692,3452},"T©y Thµnh §«"},
	{304,{300,1928,3478},"B¾c Thµnh §«"},
	{350,{350,1388,3072},"Nam T­¬ng D­¬ng"},
	{351,{350,1363,2863},"T©y T­¬ng D­¬ng"},
	{352,{350,1528,2862},"B¾c T­¬ng D­¬ng"},
	{150,{150,1735,3062},"B¾c D­¬ng Ch©u"},
	{151,{150,1632,3047},"T©y D­¬ng Ch©u"},
	{152,{150,1610,3167},"Nam D­¬ng Ch©u"},
	{153,{150,1742,3201},"§«ng D­¬ng Ch©u"},
	{100,{100,1517,2859},"B¾c TuyÒn Ch©u"},
	{101,{100,1381,2905},"T©y TuyÒn Ch©u"},
	{102,{100,1561,3082},"§«ng TuyÒn Ch©u"},
	{501,{500,1793,3211},"§«ng Phông T­êng"},
	{502,{500,1681,3099},"T©y Phông T­êng"},
	{503,{500,1659,3211},"Nam Phông T­êng"},
	{504,{500,1835,3045},"B¾c Phông T­êng"},
	{401,{400,1521,3119},"§«ng §¹i Lý"},
	{402,{400,1450,3068},"Nam §¹i Lý"},
	{403,{400,1548,2922},"B¾c §¹i Lý"},
}

tSmallExpandBoxs = {
	{201,{200,1490,2951},"§«ng BiÖn Kinh"},
	{202,{200,1299,2992},"Nam BiÖn Kinh"},
	{203,{200,1268,2771},"T©y BiÖn Kinh"},
	{301,{300,1909,3609},"§«ng Thµnh §«"},
	{302,{300,1685,3650},"Nam Thµnh §«"},
	{303,{300,1692,3452},"T©y Thµnh §«"},
	{304,{300,1928,3478},"B¾c Thµnh §«"},
	{350,{350,1388,3072},"Nam T­¬ng D­¬ng"},
	--{351,{350,1363,2863},"T©y T­¬ng D­¬ng"},	-- need to change coordinate
	{351,{350,1357,2868},"T©y T­¬ng D­¬ng"}, 
	{352,{350,1528,2862},"B¾c T­¬ng D­¬ng"},
	{150,{150,1735,3062},"B¾c D­¬ng Ch©u"},
	{151,{150,1632,3047},"T©y D­¬ng Ch©u"},
	{152,{150,1610,3167},"Nam D­¬ng Ch©u"},
	{153,{150,1742,3201},"§«ng D­¬ng Ch©u"},
	{100,{100,1517,2859},"B¾c TuyÒn Ch©u"},
	{101,{100,1381,2905},"T©y TuyÒn Ch©u"},
	{102,{100,1561,3082},"§«ng TuyÒn Ch©u"},
	{501,{500,1793,3211},"§«ng Phông T­êng"},
	{502,{500,1681,3099},"T©y Phông T­êng"},
	{503,{500,1659,3211},"Nam Phông T­êng"},
	{504,{500,1835,3045},"B¾c Phông T­êng"},
	{401,{400,1521,3119},"§«ng §¹i Lý"},
	{402,{400,1450,3068},"Nam §¹i Lý"},
	{403,{400,1548,2922},"B¾c §¹i Lý"},
}
-------------------------------------------------------------------------------
--								FUNCTIONS
-------------------------------------------------------------------------------

-- [storeid][action][function]
-- storeid: expand_box, carriage
-- action: putin, getout
-- function: show, takeone, takeall, takepage, nothing, empty
tbFunctions = {
	[1] = {		-- store box (storage)
		[1] = {
			[1] = "showThingsIn",
			[2] = "[%d] %s x%d/#putonein(%d)",
			[3] = "CÊt toµn bé vµo r­¬ng/putallin",
			[4] = "\nCÊt vËt phÈm ë trang nµy vµo r­¬ng/#putthispage(%d,%d)",
			[5] = "Kh«ng cÊt g×/nothing",
			[6] = "Hµnh trang kh«ng cã vËt phÈm phï hîp bá vµo r­¬ng",
		},
		[2] = {
			[1] = "showThingsOut",
			[2] = "[%d] %s x%d/#takeoneout(%d)",
			[3] = "LÊy tÊt c¶ ra hµnh trang/takeallout",
			[4]	= "\nLÊy tÊt c¶ vËt phÈm ë trang nµy/#takethispage(%d,%d)",
			[5] = "Kh«ng lÊy n÷a/nothing",
			[6] = "R­¬ng trèng",
		},
	},
	[2] = {		-- carriage (carrier)
		[1] = {
			[1] = "showThingsIn",
			[2] = "[%d] %s x%d/#putonein(%d)",
			[3] = "ChÊt toµn bé lªn xe/putallin",
			[4] = "\nCÊt vËt phÈm ë trang nµy vµo xe/#putthispage(%d,%d)",
			[5] = "Kh«ng cÊt g×/nothing",
			[6] = "Hµnh trang kh«ng cã vËt phÈm phï hîp bá vµo xe",
		},
		[2] = {
			[1] = "showThingsOut",
			[2] = "[%d] %s x%d/#takeoneout(%d)",
			[3] = "LÊy tÊt c¶ ra hµnh trang/takeallout",
			[4]	= "\nLÊy tÊt c¶ vËt phÈm ë trang nµy/#takethispage(%d,%d)",
			[5] = "Kh«ng lÊy n÷a/nothing",
			[6] = "Xe trèng",
		},
	},
}

DIRECT_PUTIN = 1;
DIRECT_TAKEOUT = 2;


function xb_generateNavigation(nStoreId,nPage,nNav,t,nAction)
--print("page"..nPage);
	local nMaxItems = getn(t);
	
	--------------- Empty ---------------
	if nMaxItems < 1 then 
		Talk(1,"",tbFunctions[nStoreId][nAction][6]);
		--pullKey()
		return 0;
	end
	
	--------------- Initial and calculate ---------------
	local tbSay = {}
	local nMaxinPage = 5;
	local nPages = ceil(nMaxItems/nMaxinPage);
	---------------
	local nBegin = 0;
	nPage = nPage + nNav;
	if nPage < 1 then
		nPage = 1;
	end
	if nPage == 1 then 
		nBegin = 1;
	else
		nBegin = (nPage-1) * nMaxinPage + 1;	
	end
	local nLastPageReached = nBegin;
	---------------
	local nEnd = 0
	--print(nPage.."-"..nPages.."-"..nMaxItems.."-"..nBegin.."-"..nEnd);
	if nPage == nPages then
		local nOverflow = nMaxItems - nLastPageReached;
		-- print("nOverflow = nMaxItems - nLastPageReached",  nOverflow,nMaxItems, nLastPageReached)
		nEnd = nBegin + nOverflow;
	else
		nEnd = nBegin + nMaxinPage - 1;
	end
	-- print(nBegin,nEnd);
	---------------
	if nPage > nPages then 
		nPage = nPages;
		-- Talk(1,"","§· ®Õn trang cuèi");
		-- return 0;
	end
	
	--print(nPage.."-"..nPages.."-"..nMaxItems.."-"..nBegin.."-"..nEnd);
	--------------- Create table ---------------
	local szHead = format("Trang <color=yellow>%d<color>/%d. "
		.."Tæng céng <color=yellow>%d<color> vËt phÈm. §ang hiÓn thÞ vËt phÈm: %d - %d"
		,nPage,nPages,nMaxItems,nBegin,nEnd);
	-- put/take one item
	for i = nBegin, nEnd do 
		tinsert(tbSay,format(tbFunctions[nStoreId][nAction][2],i,t[i][1],t[i][3],i));
	end
	-- insert last page empty lines
	local nEmptyLine = nMaxinPage - (nEnd - nBegin + 1);
	if nEmptyLine < nMaxinPage then 
		for i=1, nEmptyLine do 
			tinsert(tbSay," ");
		end
	end
	-- insert page navigation
	if nPage < nPages then 
		tinsert(tbSay, format("Trang kÕ/#%s(1)",tbFunctions[nStoreId][nAction][1]))
	else
		tinsert(tbSay, format("Trang ®Çu/#%s(%d)",tbFunctions[nStoreId][nAction][1],-nPages+1))
	end
	if nPage > 1 then 
		tinsert(tbSay, format("Trang tr­íc/#%s(-1)",tbFunctions[nStoreId][nAction][1]))
	else
		tinsert(tbSay, format("Trang cuèi/#%s(%d)",tbFunctions[nStoreId][nAction][1],nPages-nPage))
	end
	-- put/take one page
	tinsert(tbSay,format(tbFunctions[nStoreId][nAction][4],nBegin,nEnd));
	-- put/take all items
	tinsert(tbSay,tbFunctions[nStoreId][nAction][3])
	-- close dialog
	tinsert(tbSay,tbFunctions[nStoreId][nAction][5]);
	-- show dialog
	Say(szHead,getn(tbSay),tbSay);
	--print("page"..nPage);
	return nPage;
end;




tbMessages = {
	[1] = {
		overload = "<color=red>R­¬ng ®· ®Çy, kh«ng thÓ chøa thªm nhiÒu ®å!<color>",
		putallin = "§· cÊt tÊt c¶ vµo r­¬ng ®å!",
		putonein = "§· cÊt %s x%d vµo r­¬ng ®å!",
		putoneoverload = "<color=red>R­¬ng qu¸ ®Çy, kh«ng thÓ chøa thªm ®å!<color>",
	},
	[2] = {
		overload = "<color=red>Xe qu¸ ®Çy, kh«ng thÓ chÊt thªm nhiÒu ®å!<color>",
		putallin = "§· bá tÊt c¶ vµo xe chë ®å!",
		putonein = "§· bá %s x%d vµo xe chë ®å!",
		putoneoverload = "<color=red>Xe qu¸ ®Çy, kh«ng thÓ chÊt thªm ®å!<color>",
	}
}



function xb_puttrayin(t,nStoreId,nNpcIndex)
	if MAX_ITEM ~= nil and MAX_ITEM > 0 and getn(t) > GetStoreFreeRoom(nStoreId,nNpcIndex) then 
		Talk(1,"",tbMessages[nStoreId].overload);
		
		return 0;
	end
	
	for i = 1, getn(t) do
		local szItemName = t[i][5];
		local g,d,p = t[i][2], t[i][3], t[i][4];
		local nItemBeforeDelCount = GetItemCount(g,d,p);
		local idx = t[i][1];
		local nGenertTime = GetItemCreateTime(idx);
		local nExpireTime = GetItemExpireTime(idx);
		local nItemInTrayCount = get_item_count(t, t[i][2], t[i][3], t[i][4]);
		if DelItemByIndex(idx, -1) ~= 1 then
			print("error: Could not delete item from tray! Index = ",i)
		end
		local nItemAfterDelCount = GetItemCount(g,d,p);
		local nCount = nItemBeforeDelCount - nItemAfterDelCount;
		local object = {szItemName,{g,d,p},nCount,nGenertTime,nExpireTime};
		insertrowtodata(object,nStoreId,nNpcIndex);
		Msg2Player(format(tbMessages[nStoreId].putonein,szItemName,nCount));
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


function checkOverload(nPutinItems,nStoreId,nNpcIndex)
	if nStoreId == STORE_ID_EXPAND_BOX then 
		MAX_ITEM = MAX_EXPAND_BOX_ITEMS;
	elseif nStoreId == STORE_ID_CARRIAGE then 
		MAX_ITEM = MAX_CARRIAGE_ITEMS;
	end
	if MAX_ITEM ~= nil and MAX_ITEM > 0 and nPutinItems > GetStoreFreeRoom(nStoreId,nNpcIndex) then
		if nPutinItems == 1 then 
			Talk(1,"",tbMessages[nStoreId].putoneoverload);
		else
			Talk(1,"",tbMessages[nStoreId].overload);
		end
		return 1;
	end
	return 0;
end;

function xb_putthispage(tItems,nBegin,nEnd,nStoreId,nNpcIndex)
	local nPutinItems = nEnd - nBegin + 1;
	if checkOverload(nPutinItems,nStoreId,nNpcIndex) == 1 then 
		return 0;
	end

	if nEnd > getn(tItems) then
		nEnd = getn(tItems);
	end
	
	for i=nBegin, nEnd do 
		local object = tItems[i];
		DelItem(object[2][1],object[2][2],object[2][3],object[3]);
		insertrowtodata(object,nStoreId,nNpcIndex);
		Msg2Player(format(tbMessages[nStoreId].putonein,tItems[i][1],tItems[i][3]));
	end
	showThingsIn(0);
end;

function xb_putonein(tItems,nInTableItemIndex,nStoreId,nNpcIndex)
	if checkOverload(1,nStoreId,nNpcIndex) == 1 then 
		return 0;
	end
	local object = tItems[nInTableItemIndex];
	DelItem(object[2][1],object[2][2],object[2][3],object[3]);
	insertrowtodata(object,nStoreId,nNpcIndex);
	Msg2Player(format(tbMessages[nStoreId].putonein,object[1],object[3]));
	showThingsIn(0);
end;

function xb_putallin(tItems,nStoreId,nNpcIndex)
	if checkOverload(getn(tItems),nStoreId,nNpcIndex) == 1 then 
		
		return 0;
	end
	if  nStoreId == 1 then
		local tExceptItems = {{"Ch×a Khãa R­¬ng",{2,1,29005}}} -- only for expand_box (store-box) not for carriage
		--DelItemsByList(tItems, tExceptItems);
		--print ("getn(tExceptItems)"..getn(tExceptItems));
		--print ("xb_putallin>>getn(tItems):"..getn(tItems))
		
		tItems = removeItemsFromTable(tExceptItems, tItems)
	end
	DelItemsByList(tItems);
	inserttabletodata(tItems,nStoreId,nNpcIndex);
	Msg2Player(tbMessages[nStoreId].putallin)
	
end;


function xb_takethispage(nBegin,nEnd,nStoreId,nNpcIndex)
	if nEnd - nBegin > GetFreeItemRoom() then 
		Talk(1,"","<color=red>Hµnh trang qu¸ ®Çy!<color>");
		
		return 0;
	end
	
	local nItems = getn(TB_ITEMS);
	if nEnd > nItems then
		nEnd = nItems;
	end
	
	local nLastPageItems = 0;
	
	if nItems < 10 then
		nLastPageItems = nItems - 5;
	end
	
	for i=nBegin, nEnd do 
		
		if getn(TB_ITEMS) == nLastPageItems or getn(TB_ITEMS) == 0 then
			break;
		end
		
		if nEnd > getn(TB_ITEMS) then 
			nEnd = getn(TB_ITEMS);
			i = 1;
		end
		
		local object = TB_ITEMS[i];
		local nResult, nItemIndex = AddItem(object[2][1],object[2][2],object[2][3],object[3]);
		if  object[5] and tonumber(object[5]) ~= nil and tonumber(object[5]) > 0 then 
			SetItemExpireTime(nItemIndex,object[5]);
		end
		RemoveItemFromFile(object,nStoreId,nNpcIndex);

	end
	showThingsOut(0);
end;

function xb_takeoneout(nInTableItemIndex,nStoreId,nNpcIndex)
	local object = TB_ITEMS[nInTableItemIndex];
	local nResult, nItemIndex = AddItem(object[2][1],object[2][2],object[2][3],object[3]);
	if object[5] and tonumber(object[5]) ~= nil and tonumber(object[5]) > 0 then 
		SetItemExpireTime(nItemIndex,object[5]);
	end
	RemoveItemFromFile(object,nStoreId,nNpcIndex);
	showThingsOut(0);
end;


function xb_takeallout(nStoreId,nNpcIndex)
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

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

function getBoxId(m,x,y)
	if 350 == m and 1357 == x and 2868 == y then -- T©y T­¬ng D­¬ng
			return 351;
	end
	local t = tExpandBoxs;
	
	for i=1,getn(t) do 
		if t[i][2][1] == m and t[i][2][2] == x and t[i][2][3] == y then 
			return t[i][1];
		end
	end
	return 0;
end;

function CreateNpcList(tNpcList)
	for _, tNpc in tNpcList do
		local npc = CreateNpc(tNpc[1], tNpc[2], tNpc[3], tNpc[4], tNpc[5]);
		SetNpcScript(npc, tNpc[6] or "");
		if npc > 0 then
		else
			WriteLogEx(format("Create[%s] Npc[%s][%s] fail", tNpc[1], tNpc[2], tNpc[6] or ""))
		end
		
	end
end

function create_expand_boxs()
	local script = "\\script\\mod\\expand_box\\expand_box.lua";
	local model = "B¶o r­¬ng tµi nguyªn";
	local name = "R­¬ng lín";
	local t = tExpandBoxs;
	for i=1, getn(t) do 
		local nNpcIndex = CreateNpc(model,name,t[i][2][1],t[i][2][2],t[i][2][3])
		SetNpcScript(nNpcIndex,script);
	end
	
	create_small_expand_boxs();
end;

function create_small_expand_boxs()
	local script = "\\script\\mod\\expand_box\\expand_box.lua";
	local model = "R­¬ng tiÒn";
	local name = "R­¬ng ®å";
	local t = tSmallExpandBoxs;
	for i=1, getn(t) do 
		local nNpcIndex = CreateNpc(model,name,t[i][2][1],t[i][2][2]+3,t[i][2][3])
		SetNpcScript(nNpcIndex,script);
	end
end;

function isItemAllow(g,d,p)
	if g == 2 or g == 1 then -- g=1: vat pham thu thap/than bi/nhiem vu; g=2: vat pham sinh hoat
		return 1;
	end
	return 0;
end;

function getAllowItems()
	local tItems = GetItemsInBag();
	local tAllowItems = {}
	local t = tItems;
	for i=1, getn(t) do 
		if isItemAllow(t[i][2][1]) == 1 then
			tinsert(tAllowItems,t[i]);
		end
	end
	return tAllowItems;
end;


function AddItemsByList(tItems)
	-- print("tItems",getn(tItems));
	for i = 1,getn(tItems) do
		if gf_Judge_Room_Weight(1,100) == 1 then
			local nAddResult, nItemIndex = AddItem(tItems[i][2][1],tItems[i][2][2],tItems[i][2][3],tItems[i][3]);
			if tItems[i][5] and tonumber(tItems[i][5]) ~= nil and tonumber(tItems[i][5]) > 0 then 
				SetItemExpireTime(nItemIndex,tItems[i][5]);	
			end
		end
	end
	erasedata();
end

function DelItemsByList(tItems)
	
	local nCount = 0;
	for i=1, getn(tItems) do		
		nCount = GetItemCount(tItems[i][2][1],tItems[i][2][2],tItems[i][2][3]);
		if nCount ~= 0 then
			local nDel = DelItem(tItems[i][2][1],tItems[i][2][2],tItems[i][2][3],nCount);
			if nDel == 0 then
				print("error: expand_box_head >> DelItemByList::could not delete the item");
				return 0;
			end
		end
	end
end

function DelItemsByList(tItems, tExceptItems)
	if (tExceptItems == nil) then
		tExceptItems = {}
	end
	local nCount = 0;
	for i=1, getn(tItems) do
		if searchItemInTable(tItems[i], tExceptItems) == 0 then
			nCount = GetItemCount(tItems[i][2][1],tItems[i][2][2],tItems[i][2][3]);
			if nCount ~= 0 then
				local nDel = DelItem(tItems[i][2][1],tItems[i][2][2],tItems[i][2][3],nCount);
				if nDel == 0 then
					print("error: expand_box_head >> DelItemByList::could not delete the item");
					return 0;
				end
			end
		end
	end
end


function DropItemsByList(tItems)
	local t = tItems;
	-- print("tItems",getn(tItems));
	for i=1, getn(t) do 
		print(i,t[i][2][1],t[i][2][2],t[i][2][3],t[i][3]);
		DropItems(t[i][2][1],t[i][2][2],t[i][2][3],t[i][3]);
	end
end;

function GetItemIndexFromFile(g,d,p)
	for i=1, ITEM_COUNT do 
		if(	g == tonumber(TB_ITEMS[i][2][1])
			and d == tonumber(TB_ITEMS[i][2][2])
			and p == tonumber(TB_ITEMS[i][2][3])
		) then 
			return i;
		end
	end
	return 0;
end;

function RemoveItemFromFile(tItem,nStoreId,nNpcIndex)
	local result = 0;
	for i=1, ITEM_COUNT do 
		if (	tItem[2][1] == TB_ITEMS[i][2][1]
			and tItem[2][2] == TB_ITEMS[i][2][2]
			and tItem[2][3] == TB_ITEMS[i][2][3]
		) then 
			tremove(TB_ITEMS,i);
			result = 1;
			break
		end
	end
	overwritedata(nStoreId,nNpcIndex);
	return result;
end;


function erasedata(nStoreId,nNpcIndex)
	generateItemFilePath(WRITE_FILE,nStoreId,nNpcIndex);
	local file = openfile(ITEM_FILEPATH, "w")
	write(file,"");
	closefile(file)
	
end;

function overwritedata_original(nStoreId,nNpcIndex)
	generateItemFilePath(WRITE_FILE,nStoreId,nNpcIndex);
	local file = openfile(ITEM_FILEPATH, "w")
	for i=1,ITEM_COUNT do 
		write(file,tableofobjectstostring(TB_ITEMS[i]));
	end
	closefile(file)
	
end;

function overwritedata(nStoreId,nNpcIndex)
	generateItemFilePath(WRITE_FILE,nStoreId,nNpcIndex);
	local file = openfile(ITEM_FILEPATH, "w")
	write(file,tableofobjectstostring(TB_ITEMS));
	closefile(file)
	
end;

function inserttabletodata(table,nStoreId,nNpcIndex)
	generateItemFilePath(WRITE_FILE,nStoreId,nNpcIndex);
	local file = openfile(ITEM_FILEPATH, "a+")
	write(file,tableofobjectstostring(table));
	closefile(file)
	
end;

function insertrowtodata(object,nStoreId,nNpcIndex)
	local table = {object}
	inserttabletodata(table,nStoreId,nNpcIndex)
end;


-- nAction value: nil,0,1 is write to file, 2 is read from file
function generateItemFilePath(nAction, nStoreId, nNpcIndex)
	player_rolename = GetName();
	player_rolename = totelex(player_rolename);
	
	local file_name = player_rolename;
	if nNpcIndex ~= nil then 
		file_name = nNpcIndex;
	end
	
	if nStoreId == nil or nStoreId == 0 or nStoreId == 1 then 
		if nAction == nil or nAction == 0 or nAction == 1 then
			ITEM_FILEPATH = "data/expand_box/"..file_name..".txt";
		else
			ITEM_FILEPATH = "\\data\\expand_box\\"..file_name..".txt";
		end
	else
		if nAction == nil or nAction == 0 or nAction == 1 then
			ITEM_FILEPATH = "data/carriage/"..file_name..".txt";
		else
			ITEM_FILEPATH = "\\data\\carriage\\"..file_name..".txt";
		end
	end
	
	-- print(ITEM_FILEPATH);
end;


function GetStoreFreeRoom(nStoreId,nNpcIndex)
	generateItemFilePath(READ_FILE,nStoreId,nNpcIndex);
	return MAX_EXPAND_BOX_ITEMS - ITEM_COUNT;
end;

function getListFromFile()
	
	local tData = {}
	local nCount = TB_DATAITEMS:getRow();
	-- print("nCount",nCount);
	local k = 0;
	for i=1,nCount do
		local sName = TB_DATAITEMS:getCell(i,1);
		local nGeneral = TB_DATAITEMS:getCell(i,2);
		local nDetail = TB_DATAITEMS:getCell(i,3);
		local nPaticular = TB_DATAITEMS:getCell(i,4);
		local nQuantity = TB_DATAITEMS:getCell(i,5);
		local nCreateTime = TB_DATAITEMS:getCell(i,6);
		local nExpireTime = TB_DATAITEMS:getCell(i,7);
		if sName ~= "" then
			k = k+1;
			tData[k] = {sName,{nGeneral,nDetail,nPaticular},nQuantity,nCreateTime,nExpireTime}
		end
	end
	-- print("k",k);
	TabFile_Unload(ITEM_FILEPATH); -- THIS IS VERY IMPORTANT COMMAND !!! REMEMBER IT!!!
	return tData, k;
end;


function init(nStoreId, nNpcIndex)
	-- print("expand_box >> init >> nNpcIndex",nNpcIndex)
	generateItemFilePath(READ_FILE,nStoreId,nNpcIndex)
	-- print(nStoreId,ITEM_FILEPATH);
	TB_DATAITEMS = {}
	TB_DATAITEMS = new(KTabFile, ITEM_FILEPATH);
	TB_ITEMS, ITEM_COUNT = getListFromFile();
	-- print("ITEM_FILEPATH",ITEM_FILEPATH)
	-- print("TB_ITEMS",getn(TB_ITEMS))
	-- print("ITEM_COUNT",ITEM_COUNT)
end

function nothing() 
	--pullKey()
end;

function pullKey()
	if GetItemCount(key[1],key[2],key[3]) < 1 then
		AddItem(key[1],key[2],key[3],1)
	end
end;