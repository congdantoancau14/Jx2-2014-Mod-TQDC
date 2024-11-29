--Include("\\script\\mod\\expand_box\\store_box\\store_box_head.lua");
Include("\\script\\lib\\string.lua");
Include("\\script\\lib\\item.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\class\\ktabfile.lua");
-- player_rolename = GetName();
-- player_rolename = totelex(player_rolename);
-- ITEM_FILEPATH = "data/expand_box/"..player_rolename..".txt";
-- TB_DATAITEMS = new(KTabFile, ITEM_FILEPATH);

TASK_RETURN_BOX = 3584

STORE_ID_EXPAND_BOX = 1;
STORE_ID_CARRIAGE = 2;
STORE_ID_MAIL = 3;

g_tbDirectoryName = {
	[1] = "data/expand_box/store_box/",
	[2] = "data/expand_box/carriage/",
	[3] = "data/expand_box/mail/",
}

MAX_EXPAND_BOX_ITEMS = 1000;
MAX_CARRIAGE_ITEMS = 100;

ITEM_COUNT = 0
TB_ITEMS = {}

WRITE_FILE = 1;
READ_FILE = 2;

MaxPutinCount = 60;
MAXINPAGE = 5;

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
	[3] = {		-- mail attactments
		[1] = {
			[1] = "showThingsIn",
			[2] = "[%d] %s x%d/#putonein(%d)",
			[3] = "Göi toµn bé/putallin",
			[4] = "\nGöi vËt phÈm ë trang nµy/#putthispage(%d,%d)",
			[5] = "Kh«ng göi n÷a/nothing",
			[6] = "Hµnh trang kh«ng cã vËt phÈm phï hîp bá vµo gãi ®å",
		},
		[2] = {
			[1] = "showThingsOut",
			[2] = "[%d] %s x%d/#takeoneout(%d)",
			[3] = "LÊy tÊt c¶ ra hµnh trang/takeallout",
			[4]	= "\nLÊy tÊt c¶ vËt phÈm ë trang nµy/#takethispage(%d,%d)",
			[5] = "Kh«ng lÊy n÷a/nothing",
			[6] = "Gãi hµng trèng",
		},
	},
}

DIRECT_PUTIN = 1;
DIRECT_TAKEOUT = 2;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function xb_generateNavigation(nStoreId,nPage,nNav,t,nAction)
--print("page"..nPage);
	local nMaxItems = getn(t);
	
	nPage = nPage + nNav;
	--------------- Empty ---------------
	if nMaxItems < 1 or nPage < 1 then 
		Talk(1,"",tbFunctions[nStoreId][nAction][6]);
		--pullKey()
		return 0;
	end
	
	--------------- Initial and calculate ---------------
	local tbSay = {}
	local nPages = ceil(nMaxItems/MAXINPAGE);
	---------------
	local nBegin = 0;
	
	if nPage == 1 then 
		nBegin = 1;
	else
		nBegin = (nPage-1) * MAXINPAGE + 1;	
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
		nEnd = nBegin + MAXINPAGE - 1;
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
		--print(i,nEnd)
		tinsert(tbSay,format(tbFunctions[nStoreId][nAction][2],i,t[i][1],t[i][3],i));
	end
	-- insert last page empty lines
	local nEmptyLine = MAXINPAGE - (nEnd - nBegin + 1);
	if nEmptyLine < MAXINPAGE then 
		for i=1, nEmptyLine do 
			tinsert(tbSay," ");
		end
	end
	-- insert page navigation
	if nPage < nPages then 
		tinsert(tbSay, format(">> Trang kÕ >>/#%s(1)",tbFunctions[nStoreId][nAction][1]))
	else
		tinsert(tbSay, format("<<<< Trang ®Çu <<<</#%s(%d)",tbFunctions[nStoreId][nAction][1],-nPages+1))
	end
	if nPage > 1 then 
		tinsert(tbSay, format("<< Trang tr­íc <</#%s(-1)",tbFunctions[nStoreId][nAction][1]))
	else
		tinsert(tbSay, format(">>>> Trang cuèi >>>>/#%s(%d)",tbFunctions[nStoreId][nAction][1],nPages-nPage))
	end
	-- put/take one page
	if nStoreId ~= STORE_ID_MAIL then
		tinsert(tbSay,format(tbFunctions[nStoreId][nAction][4],nBegin,nEnd));
	end
	-- put/take all items
	tinsert(tbSay,tbFunctions[nStoreId][nAction][3])
	-- close dialog
	tinsert(tbSay,tbFunctions[nStoreId][nAction][5]);
	-- show dialog
	Say(szHead,getn(tbSay),tbSay);
	--print("page"..nPage);
	return nPage;
end;

-------------------------------------------------------------------------------



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
	},
	[3] = {
		overload = "<color=red>B­u côc qu¸ t¶i, kh«ng thÓ nhËn thªm nhiÒu ®å!<color>",
		putallin = "§· bá tÊt c¶ vµo gãi ®å!",
		putonein = "§· bá %s x%d vµo gãi ®å!",
		putoneoverload = "<color=red>B­u côc qu¸ t¶i, kh«ng thÓ nhËn thªm ®å!<color>",
	}
}

-------------------------------------------------------------------------------
function xb_puttrayin(t,nStoreId,szStoreFileName)
	--print("[",MAX_ITEM ,getn(t) , GetStoreFreeRoom(nStoreId,szStoreFileName),"]")
	if MAX_ITEM ~= nil and MAX_ITEM > 0 and getn(t) > GetStoreFreeRoom(nStoreId,szStoreFileName) then 
		Talk(1,"",tbMessages[nStoreId].overload);
		
		return 0;
	end
	
	for i = 1, getn(t) do
		local object = {}
		local nCount = 0; -- ItemPutOnTray
		
		local szItemName = t[i][5];
		local g,d,p = t[i][2], t[i][3], t[i][4];
		local nItemBeforeDelCount = GetItemCount(g,d,p); -- ItemCountInBag
		local idx = t[i][1];
		local nGenertTime = GetItemCreateTime(idx);
		local nExpireTime = GetItemExpireTime(idx);
		
		
		---------------------------------------------------------------------
		--						GetEquipInfo
		---------------------------------------------------------------------
		local nItemIndex = idx;
		if IsAnEquip(g,d,p) == 1 then 
			local nEnhance = GetEquipAttr(nItemIndex,2)
			local nIsDing7 = GetItemSpecialAttr(nItemIndex,"DING7")
			local nIsDing10 = GetItemSpecialAttr(nItemIndex,"DING10")
			local nZhuangbeiLv = GetEquipLevel(nItemIndex); --»ñÈ¡µ±Ç°×°±¸µÈ¼¶
			local nLingqi = GetItemMaxLingQi(nItemIndex);   --»ñÈ¡ÁéÆøÖµ
			
			local nMofa1,nLevel1 = GetItemAttr(nItemIndex,1)
			local nMofa2,nLevel2 = GetItemAttr(nItemIndex,2)
			local nMofa3,nLevel3 = GetItemAttr(nItemIndex,3)
			-- print("nMofa",nMofa1,nMofa2,nMofa3);
			local nScrollIndex = tonumber(nItemIndex)
			local nAbrasive = AbradeItem(nScrollIndex, 0)
			
			if DelItemByIndex(idx, -1) ~= 1 then
				print("error: Could not delete item from tray! Index = ",i)
			end
			
			nCount = 1;
			object = {szItemName,{g,d,p},nCount,nGenertTime,nExpireTime,nAbrasive,
				{{nMofa1,nLevel1},{nMofa2,nLevel2},{nMofa3,nLevel3}},nEnhance,nIsDing7,nIsDing10,nLingqi
			}
		else
			--local nItemInTrayCount = getItemCountInTable(t, t[i][2], t[i][3], t[i][4]);
			if DelItemByIndex(idx, -1) ~= 1 then
				print("error: Could not delete item from tray! Index = ",i)
			end
			local nItemAfterDelCount = GetItemCount(g,d,p); -- ItemCountInBag
			nCount = nItemBeforeDelCount - nItemAfterDelCount;	-- ItemPutOnTray
			object = {szItemName,{g,d,p},nCount,nGenertTime,nExpireTime};
		end
		----------------------------------------------------------------------
		
		
		insertrowtodata(object,nStoreId,szStoreFileName);
		Msg2Player(format(tbMessages[nStoreId].putonein,szItemName,nCount));
	end
end;

function IsAnEquip(genre,detail,particular)
	genre = tonumber(genre);
	detail = tonumber(detail);
	particular = tonumber(particular);
	if genre == 0 then --and (detail >= 100 and detail <= 105) or (detail > 0 and detail <= 14) then
		return 1;
	else 
		return 0;
	end
end;

function GetEquipInfo(tItem)
	
	local nItemIndex = tItem[1];
	local g,d,p = tItem[2],tItem[3],tItem[4];
	-- print(g,d,p);
	-- local nItemIndex = GetItemIndex(g,d,p);
	local szItemName = tItem[5];
	local nEnhance = GetEquipAttr(nItemIndex,2)
	local nIsDing7 = GetItemSpecialAttr(nItemIndex,"DING7")
	local nIsDing10 = GetItemSpecialAttr(nItemIndex,"DING10")
	local nZhuangbeiLv = GetEquipLevel(nItemIndex); --»ñÈ¡µ±Ç°×°±¸µÈ¼¶
	local nLingqi = GetItemMaxLingQi(nItemIndex);   --»ñÈ¡ÁéÆøÖµ
	
	local nMofa1,nLevel1 = GetItemAttr(nItemIndex,1)
	local nMofa2,nLevel2 = GetItemAttr(nItemIndex,2)
	local nMofa3,nLevel3 = GetItemAttr(nItemIndex,3)
	-- print("nMofa",nMofa1,nMofa2,nMofa3);
	local nScrollIndex = tonumber(nItemIndex)
	local nAbrasive = AbradeItem(nScrollIndex, 0)
	
	-- local string = "\n----------- Th«ng tin trang bÞ -----------\n"
		-- ..format("Name: <color=gold>%s<color>\n",szItemName)
		-- ..format("gdp: [ %d,%d,%d ]\n",g,d,p)
		-- ..format("C­êng hãa: %d\n",nEnhance)
		-- ..format("§Þnh hån 7: %d\n",nIsDing7)
		-- ..format("§Þnh hån 10: %d\n",nIsDing10)
		-- ..format("CÊp trang bÞ: %d\n",nZhuangbeiLv)
		-- ..format("Linh khÝ: %d\n",nLingqi)
		-- ..format("Thuéc tÝnh 1/Level: %d/%d\n",nMofa1,nLevel1)
		-- ..format("Thuéc tÝnh 2/Level: %d/%d\n",nMofa2,nLevel2)
		-- ..format("Thuéc tÝnh 3/Level: %d/%d\n",nMofa3,nLevel3)
		-- ..format("§é hao mßn/Level: %d\n",nAbrasive)
		-- .."------------------------------------------";
		
	-- Talk(1,"",string);
	-- print(string);
	-- local file = openfile("equipinfo.txt","w");
	-- write(file,string);
	-- closefile(file);
	
	--local nAdd = AddItem(g,d,p,1,1,nLevel1,nMofa1,nLevel2,nMofa2,nLevel3,nMofa3,-1,15)


end;

-- the function not work because the input table might have multi items per index
function getItemCountInTable(t, id1, id2, id3)
	local nCount = 0;
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2 and t[i][4] == id3) then
			nCount = nCount + 1;
		end
	end
	return nCount;
end


function checkOverload(nPutinItems,nStoreId,szStoreFileName)
	if nStoreId == STORE_ID_EXPAND_BOX then 
		MAX_ITEM = MAX_EXPAND_BOX_ITEMS;
	elseif nStoreId == STORE_ID_CARRIAGE then 
		MAX_ITEM = MAX_CARRIAGE_ITEMS;
	end
	if MAX_ITEM ~= nil and MAX_ITEM > 0 and nPutinItems > GetStoreFreeRoom(nStoreId,szStoreFileName) then
		if nPutinItems == 1 then 
			Talk(1,"",tbMessages[nStoreId].putoneoverload);
		else
			Talk(1,"",tbMessages[nStoreId].overload);
		end
		return 1;
	end
	return 0;
end;
-------------------------------------------------------------------------------
function xb_putthispage(tItems,nBegin,nEnd,nStoreId,szStoreFileName)
	local nPutinItems = nEnd - nBegin + 1;
	if checkOverload(nPutinItems,nStoreId,szStoreFileName) == 1 then 
		return 0;
	end

	if nEnd > getn(tItems) then
		nEnd = getn(tItems);
	end
	
	for i=nBegin, nEnd do 
		local object = tItems[i];
		DelItem(object[2][1],object[2][2],object[2][3],object[3]);
		insertrowtodata(object,nStoreId,szStoreFileName);
		Msg2Player(format(tbMessages[nStoreId].putonein,tItems[i][1],tItems[i][3]));
	end
	showThingsIn(-1);
end;

function xb_putonein(tItems,nInTableItemIndex,nStoreId,szStoreFileName)
	if checkOverload(1,nStoreId,szStoreFileName) == 1 then 
		return 0;
	end
	local object = tItems[nInTableItemIndex];
	DelItem(object[2][1],object[2][2],object[2][3],object[3]);
	insertrowtodata(object,nStoreId,szStoreFileName);
	Msg2Player(format(tbMessages[nStoreId].putonein,object[1],object[3]));
	local nItems = getn(tItems);
	if nItems/MAXINPAGE ==  floor(nItems/MAXINPAGE) then
		showThingsIn(-1);
	else
		showThingsIn(0);
	end
end;

function xb_putallin(tItems,nStoreId,szStoreFileName)
	if checkOverload(getn(tItems),nStoreId,szStoreFileName) == 1 then 
		
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
	inserttabletodata(tItems,nStoreId,szStoreFileName);
	Msg2Player(tbMessages[nStoreId].putallin)
	
end;
-------------------------------------------------------------------------------

function xb_takethispage(nBegin,nEnd,nStoreId,szStoreFileName)
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
			i = nBegin;
		end
		
		if i > nEnd then
			break;
		end
		
		local tItem = TB_ITEMS[i];
		if tItem == nil then
			print(i,nEnd)
		end
		
		if GetFreeItemRoom() == 0 then
			DropItems(tItem[2][1],tItem[2][2],tItem[2][3],tItem[3])
		else
			AddItemEx(tItem);
		end
		RemoveItemFromFile(tItem,nStoreId,szStoreFileName);

	end
	showThingsOut(-1);
end;

function xb_takeoneout(nInTableItemIndex,nStoreId,szStoreFileName)
	local tItem = TB_ITEMS[nInTableItemIndex];
	local g,d,p = tItem[2][1],tItem[2][2],tItem[2][3];
	
	--print("IsAnEquip(g,d,p)",IsAnEquip(g,d,p))
	if IsAnEquip(g,d,p) == 1 then
		AddEQuip(tItem);
	else
		AddItemEx(tItem);
	end
	RemoveItemFromFile(tItem,nStoreId,szStoreFileName);
	local nItems = getn(TB_ITEMS);
	if nItems/MAXINPAGE ==  floor(nItems/MAXINPAGE) then
		showThingsOut(-1);
	else
		showThingsOut(0);
	end
end;

function AddItemEx(tItem)
	local g,d,p = tItem[2][1],tItem[2][2],tItem[2][3];
	local n = tItem[3];
	local nExpireTime = tItem[5];
	
	local nResult, nItemIndex = AddItem(g,d,p,n);
	if nExpireTime and tonumber(nExpireTime) ~= nil and tonumber(nExpireTime) > 0 then 
		SetItemExpireTime(nItemIndex,nExpireTime);
	end
end;

function AddEQuip(tItem)

	local szItemName = tItem[1];
	local g,d,p = tItem[2][1],tItem[2][2],tItem[2][3];
	local n = tItem[3];
	local nGenertTime = tItem[4];
	local nExpireTime = tItem[5];
	local nAbrasive = tItem[6];
	local nMofa1 = tItem[7][1][1];
	local nLevel1 = tItem[7][1][2];
	local nMofa2 = tItem[7][2][1];
	local nLevel2 = tItem[7][2][2];
	local nMofa3 = tItem[7][3][1];
	local nLevel3 = tItem[7][3][2];
	local nEnhance = tItem[8];
	local nIsDing7 = tItem[9];
	local nIsDing10 = tItem[10];
	local nLingqi = tItem[11];
	----------------------------
	local nAssess = 1; -- Gi¸m ®Þnh: (0: Chua giam dinh; 4: Khong the giao dich, khong the vut di)
	----------------------------
--print(g,d,p,n,nAssess,nLevel1,nMofa1,nLevel2,nMofa2,nLevel3,nMofa3,nEnhance,nLingqi)
	local nResult, nItemIndex = AddItem(g,d,p,n,nAssess,nLevel1,nMofa1,nLevel2,nMofa2,nLevel3,nMofa3,nEnhance,nLingqi);
	if nExpireTime and tonumber(nExpireTime) > 0 then 
		SetItemExpireTime(nItemIndex,nExpireTime);
	end
	
	local nScrollIndex = tonumber(nItemIndex)
	local nFullAbrasive = AbradeItem(nScrollIndex, 0)
	--print("nFullAbrasive,nAbrasive",nFullAbrasive,nAbrasive)
	AbradeItem(nScrollIndex, nFullAbrasive-nAbrasive)
	
	SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
	SetItemSpecialAttr(nAddIdx, "DING10", nIsDing10)
	
end;


function xb_takeallout(nStoreId,szStoreFileName)
	local nFreeRoom = GetFreeItemRoom();
	local nOverflow = 0;
	
	local tmove, tleft = filtetable(TB_ITEMS);
	if getn(tmove) == 0 then
		Talk(1,"","VËt phÈm trang bÞ kh«ng thÓ lÊy ra hµng lo¹t!");
		return 0;
	end;
	AddItemsByList(tmove);
	TB_ITEMS = tleft;
	
	local nCount = getn(tmove);
	if nCount > nFreeRoom then 
		nOverflow = nCount - nFreeRoom;
		local tMoveItems = gf_SplitTable(tmove, 1, nFreeRoom);
		local tDropItems = gf_SplitTable(tmove, nFreeRoom+1, nOverflow);
		if getn(tDropItems) > 0 then
			DropItemsByList(tDropItems);
		end
	end
	
	--erasedata(nStoreId,szStoreFileName);
	overwritedata(nStoreId,szStoreFileName);
	
end;

function filtetable(table)
	local tmove = {}
	local tleft = {}
	
	for i=1,getn(table) do
		if table[i] == nil then
			break;
		end
		local g,d,p = table[i][2][1],table[i][2][2],table[i][2][3];
		if IsAnEquip(g,d,p) == 0 then
			tinsert(tmove,table[i]);
			tremove(table,i);
			i = i-1;
		end
	end
	tleft = table;
	return tmove, tleft;
end

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
	local script = "\\script\\mod\\expand_box\\store_box\\npc_store_box.lua";
	local model = "B¶o r­¬ng tµi nguyªn";
	local name = "R­¬ng lín";
	local t = tExpandBoxs;
	for i=1, getn(t) do 
		local szStoreFileName = CreateNpc(model,name,t[i][2][1],t[i][2][2],t[i][2][3])
		SetNpcScript(szStoreFileName,script);
	end
	
	create_small_expand_boxs();
end;

function create_small_expand_boxs()
	local script = "\\script\\mod\\expand_box\\store_box\\npc_store_box.lua";
	local model = "R­¬ng tiÒn";
	local name = "R­¬ng ®å";
	local t = tSmallExpandBoxs;
	for i=1, getn(t) do 
		local szStoreFileName = CreateNpc(model,name,t[i][2][1],t[i][2][2]+3,t[i][2][3])
		SetNpcScript(szStoreFileName,script);
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
	--erasedata();
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
-------------------------------------------------------------------------------
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

function RemoveItemFromFile(tItem,nStoreId,szStoreFileName)
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
	overwritedata(nStoreId,szStoreFileName);
	return result;
end;

-- take all out action
function erasedata(nStoreId,szStoreFileName)
	generateItemFilePath(WRITE_FILE,nStoreId,szStoreFileName);
	print("erasedata>>ITEM_FILEPATH:",ITEM_FILEPATH)
	local file = openfile(ITEM_FILEPATH, "w")
	write(file,"");
	closefile(file)
	
	local string = tableofobjectstostring(TB_ITEMS);
	local logfile = openfile(ITEM_LOG_FILEPATH, "a+")
	local timenow = date("%y%m%d%H%M%S");
	write(logfile,"takeallout:"..timenow..":\n"..string);
	closefile(logfile);
end;

function overwritedata_original(nStoreId,szStoreFileName)
	generateItemFilePath(WRITE_FILE,nStoreId,szStoreFileName);
	local file = openfile(ITEM_FILEPATH, "w")
	for i=1,ITEM_COUNT do 
		write(file,tableofobjectstostring(TB_ITEMS[i]));
	end
	closefile(file)
end;

-- takeout action
function overwritedata(nStoreId,szStoreFileName)
	--print("overwritedata>>szStoreFileName",szStoreFileName)
	generateItemFilePath(WRITE_FILE,nStoreId,szStoreFileName);
	--print("overwritedata>>ITEM_FILEPATH",ITEM_FILEPATH)
	local file = openfile(ITEM_FILEPATH, "w");
	local string = tableofobjectstostring(TB_ITEMS);
	write(file,string);
	closefile(file)
	
	local logfile = openfile(ITEM_LOG_FILEPATH, "a+")
	if logfile then
		local timenow = date("%y%m%d%H%M%S");
		write(logfile,"putin:"..timenow..":\n"..string);
		closefile(logfile);
	end
end;

-- putin action
function inserttabletodata(table,nStoreId,szStoreFileName)
	generateItemFilePath(WRITE_FILE,nStoreId,szStoreFileName);
	local file = openfile(ITEM_FILEPATH, "a+");
	local string = tableofobjectstostring(table);
	write(file,string);
	closefile(file)
	
	local logfile = openfile(ITEM_LOG_FILEPATH, "a+")
	if logfile then
		local timenow = date("%y%m%d%H%M%S");
		write(logfile,"putin:"..timenow..":\n"..string);
		closefile(logfile);
	end
end;

function insertrowtodata(object,nStoreId,szStoreFileName)
	local table = {object}
	inserttabletodata(table,nStoreId,szStoreFileName)
end;

-------------------------------------------------------------------------------
-- nAction value: nil,0,1 is write to file, 2 is read from file
function generateItemFilePath(nAction, nStoreId, szStoreFileName)
	player_rolename = GetName();
	player_rolename = totelex(player_rolename);
	
	local file_name = player_rolename..".txt";
	if szStoreFileName ~= nil and szStoreFileName ~= 0 and szStoreFileName ~= "" then 
		file_name = szStoreFileName;
	end
	
	-- if nStoreId == nil or nStoreId == 0 or nStoreId == 1 then 
		-- if nAction == nil or nAction == 0 or nAction == 1 then		-- write to file
			-- ITEM_FILEPATH = "data/expand_box/"..file_name;
			-- ITEM_LOG_FILEPATH = "data/logs/expand_box/"..file_name;
		-- else														-- read from file
			-- ITEM_FILEPATH = "\\data\\expand_box\\"..file_name;
			-- --ITEM_LOG_FILEPATH = "\\data\\logs\\expand_box\\"..file_name;
		-- end
	-- else
		-- if nAction == nil or nAction == 0 or nAction == 1 then
			-- ITEM_FILEPATH = "data/carriage/"..file_name;
			-- ITEM_LOG_FILEPATH = "data/logs/carriage/"..file_name;
		-- else
			-- ITEM_FILEPATH = "\\data\\carriage\\"..file_name;
			-- --ITEM_LOG_FILEPATH = "\\data\\logs\\carriage\\"..file_name;
		-- end
	-- end
	
	if nStoreId == nil or nStoreId == 0 then
		nStoreId = 1;
	end
	
	-- default nAction = 1 -- write to file
	ITEM_FILEPATH = g_tbDirectoryName[nStoreId]..file_name;
	ITEM_LOG_FILEPATH = g_tbDirectoryName[nStoreId].."logs/"..file_name;
	
	--print("ITEM_FILEPATH",ITEM_FILEPATH)
	gf_MakeDirectory(g_tbDirectoryName[nStoreId],file_name)
	gf_MakeDirectory(g_tbDirectoryName[nStoreId].."logs/",file_name)
	
	
	if nAction == 2 then -- read from file
		ITEM_FILEPATH = "\\"..gsub(ITEM_FILEPATH,"/","\\");
		ITEM_LOG_FILEPATH = "\\"..gsub(ITEM_LOG_FILEPATH,"/","\\");
	end
	
	
	-- print("ITEM_FILEPATH",ITEM_FILEPATH);
	-- print("ITEM_LOG_FILEPATH",ITEM_LOG_FILEPATH);
end;


function GetStoreFreeRoom(nStoreId,szStoreFileName)
	generateItemFilePath(READ_FILE,nStoreId,szStoreFileName);
	
	if nStoreId == STORE_ID_EXPAND_BOX then 
		return MAX_EXPAND_BOX_ITEMS - ITEM_COUNT;
	elseif nStoreId == STORE_ID_CARRIAGE then
		return MAX_CARRIAGE_ITEMS - ITEM_COUNT;
	elseif nStoreId == STORE_ID_MAIL then
		return MAX_CARRIAGE_ITEMS - ITEM_COUNT;
	else
		return MAX_CARRIAGE_ITEMS - ITEM_COUNT;
	end
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
		local nParticular = TB_DATAITEMS:getCell(i,4);
		local nQuantity = TB_DATAITEMS:getCell(i,5);
		local nCreateTime = TB_DATAITEMS:getCell(i,6);
		local nExpireTime = TB_DATAITEMS:getCell(i,7);
		----------------------------------------------
		----------------- equipinfo ------------------
		local nAbrasive = TB_DATAITEMS:getCell(i,8);
		local nMofa1 = TB_DATAITEMS:getCell(i,9);
		local nLevel1 = TB_DATAITEMS:getCell(i,10);
		local nMofa2 = TB_DATAITEMS:getCell(i,11);
		local nLevel2 = TB_DATAITEMS:getCell(i,12);
		local nMofa3 = TB_DATAITEMS:getCell(i,13);
		local nLevel3 = TB_DATAITEMS:getCell(i,14);
		local nEnhance = TB_DATAITEMS:getCell(i,15);
		local nIsDing7 = TB_DATAITEMS:getCell(i,16);
		local nIsDing10 = TB_DATAITEMS:getCell(i,17);
		local nLingqi = TB_DATAITEMS:getCell(i,18);
		----------------------------------------------
		if sName ~= "" then
			k = k+1;
			--tData[k] = {sName,{nGeneral,nDetail,nPaticular},nQuantity,nCreateTime,nExpireTime}
			local szItemName = sName;
			local g,d,p = nGeneral,nDetail,nParticular;
			local nCount = nQuantity;
			local nGenertTime = nCreateTime;
			
			local object = {szItemName,{g,d,p},nCount,nGenertTime,nExpireTime,nAbrasive,
				{{nMofa1,nLevel1},{nMofa2,nLevel2},{nMofa3,nLevel3}},nEnhance,nIsDing7,nIsDing10,nLingqi
			}
			--print(object[1],object[7][1][1],object[7][1][2],object[7][2][1],object[7][2][2],object[7][3][1],object[7][3][2])
			tData[k] = object;
		end
	end
	-- print("k",k);
	TabFile_Unload(ITEM_FILEPATH); -- THIS IS VERY IMPORTANT COMMAND !!! PLEASE TAKE NOTICE THAT AND REMEMBER IT!!!
	return tData, k;
end;


function init(nStoreId, szStoreFileName)
	--print("---------- expand_box >> init >> szStoreFileName",szStoreFileName)
	generateItemFilePath(READ_FILE,nStoreId,szStoreFileName)
	TB_DATAITEMS = {}
	TB_DATAITEMS = new(KTabFile, ITEM_FILEPATH);
	TB_ITEMS, ITEM_COUNT = getListFromFile();
	-- print("nStoreId:",nStoreId);
	-- print("ITEM_FILEPATH",ITEM_FILEPATH)
	-- print("TB_ITEMS",getn(TB_ITEMS))
	-- print("ITEM_COUNT",ITEM_COUNT)
end

-------------------------------------------------------------------------------
function nothing() 
	--pullKey()
end;

function pullKey()
	if GetItemCount(key[1],key[2],key[3]) < 1 then
		AddItem(key[1],key[2],key[3],1)
	end
end;

