Include("\\script\\mod\\store_box\\store_box_head.lua");
Include("\\script\\lib\\string.lua");
Include("\\script\\lib\\item.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\class\\ktabfile.lua");
-- player_rolename = GetName();
-- player_rolename = totelex(player_rolename);
-- ITEM_FILEPATH = "data/expand_box/"..player_rolename..".txt";
-- TB_DATAITEMS = new(KTabFile, ITEM_FILEPATH);

MAX_EXPAND_BOX_ITEMS = 1000;
MAX_CARRIAGE_ITEMS = 100;

ITEM_COUNT = 0
TB_ITEMS = {}

WRITE_FILE = 1;
READ_FILE = 2;

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
-------------------------------------------------------------------------------
--								FUNCTIONS
-------------------------------------------------------------------------------

function getBoxId(m,x,y)
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
	local name = "R­¬ng ®å";
	local t = tExpandBoxs;
	for i=1, getn(t) do 
		local nNpcIndex = CreateNpc(model,name,t[i][2][1],t[i][2][2],t[i][2][3])
		SetNpcScript(nNpcIndex,script);
	end
end;

function isItemAllow(g,d,p)
	if g == 2 then 
		return 1;
	end
	return 0;
end;

function getAllowItems()
	local tItems = GetItemsInBag();
	-- print(getn(tItems));
	local tAllowItems = {}
	local t = tItems;
	for i=1, getn(t) do 
		if (t[i][2][1] == 2) then 
			tinsert(tAllowItems,t[i]);
		end
	end
	-- print(getn(tAllowItems))
	return tAllowItems;
end;


function AddItemsByList(tItems)
	-- print("tItems",getn(tItems));
	for i = 1,getn(tItems) do
		if gf_Judge_Room_Weight(1,100) == 1 then
			local nItemIndex = AddItem(tItems[i][2][1],tItems[i][2][2],tItems[i][2][3],tItems[i][3]);
			if tItems[i][4] ~= nil then 
				SetItemExpireTime(nItemIndex,tItems[i][4]);
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
	generateItemFilePath(0,nStoreId,nNpcIndex);
	local file = openfile(ITEM_FILEPATH, "w")
	write(file,"");
	closefile(file)
end;

function overwritedata(nStoreId,nNpcIndex)
	generateItemFilePath(0,nStoreId,nNpcIndex);
	local file = openfile(ITEM_FILEPATH, "w")
	for i=1,ITEM_COUNT do 
		write(file,rowtostring(TB_ITEMS[i]));
	end
	closefile(file)
end;

function inserttabletodata(table,nStoreId,nNpcIndex)
	generateItemFilePath(0,nStoreId,nNpcIndex);
	local file = openfile(ITEM_FILEPATH, "a+")
	write(file,tabletostring(table));
	closefile(file)
end;

function insertrowtodata(object,nStoreId,nNpcIndex)
	generateItemFilePath(0,nStoreId,nNpcIndex);
	local file = openfile(ITEM_FILEPATH, "a+")
	write(file,rowtostring(object))
	closefile(file)
end;

function rowtostring(table)
	local t = table;
	local string = "";
	local tab = "\t";
	local endl = "\n";
	
	if t ~= nil then 
		string = string..t[1]..tab;
		if type(t[2]) == "table" then 
			string = string..t[2][1]..tab..t[2][2]..tab..t[2][3]..tab;
		end
		string = string..t[3]..endl;
	end
	return string;
end;

function tabletostring(table)
	local t = table;
	local string = "";
	local tab = "\t";
	local endl = "\n";
	for i=1, getn(t) do 
		string = string..t[i][1]..tab;
		if type(t[i][2]) == "table" then 
			string = string..t[i][2][1]..tab..t[i][2][2]..tab..t[i][2][3]..tab;
		end
		string = string..t[i][3]..endl;
	end	
	return string;
end;


function isNummeric(str)
	if trim(str) == tostring(tonumber(str)) then
		return 1;
	else
		return 0;
	end
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
		local nExpireTime = TB_DATAITEMS:getCell(i,6);
		if sName ~= "" then
			k = k+1;
			tData[k] = {sName,{nGeneral,nDetail,nPaticular},nQuantity,nExpireTime}
		end
	end
	-- print("k",k);
	TabFile_Unload(ITEM_FILEPATH); -- THIS IS VERY IMPORTANT COMMAND !!! REMEMBER IT!!!
	return tData, k;
end;


function init(nStoreId, nNpcIndex)
	-- print("expand_box >> init >> nNpcIndex",nNpcIndex)
	generateItemFilePath(2,nStoreId,nNpcIndex)
	-- print(nStoreId,ITEM_FILEPATH);
	TB_DATAITEMS = {}
	TB_DATAITEMS = new(KTabFile, ITEM_FILEPATH);
	TB_ITEMS, ITEM_COUNT = getListFromFile();
	-- print("ITEM_FILEPATH",ITEM_FILEPATH)
	-- print("TB_ITEMS",getn(TB_ITEMS))
	-- print("ITEM_COUNT",ITEM_COUNT)
end

function nothing() end;