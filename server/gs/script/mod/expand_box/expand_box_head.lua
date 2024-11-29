
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

MAX_ITEM_COUNT = 0
TB_ITEMS = {}

-------------------------------------------------------------------------------
--								FUNCTIONS
-------------------------------------------------------------------------------

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
			AddItem(tItems[i][2][1],tItems[i][2][2],tItems[i][2][3],tItems[i][3]);
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

function RemoveItemFromFile(tItem,nStoreId)
	for i=1, MAX_ITEM_COUNT do 
		if (tItem[2][1] == TB_ITEMS[i][2][1]
			and tItem[2][2] == TB_ITEMS[i][2][2]
			and tItem[2][3] == TB_ITEMS[i][2][3]
		) then 
			tremove(TB_ITEMS,i);
			break
		end
	end
	overwritedata(nStoreId);
end;


function erasedata(nStoreId)
	generateItemFilePath(0,nStoreId);
	local file = openfile(ITEM_FILEPATH, "w")
	write(file,"");
	closefile(file)
end;

function overwritedata(nStoreId)
	generateItemFilePath(0,nStoreId);
	local file = openfile(ITEM_FILEPATH, "w")
	for i=1,MAX_ITEM_COUNT do 
		write(file,rowtostring(TB_ITEMS[i]));
	end
	closefile(file)
end;

function inserttabletodata(table,nStoreId)
	generateItemFilePath(0,nStoreId);
	local file = openfile(ITEM_FILEPATH, "a+")
	write(file,tabletostring(table));
	closefile(file)
end;

function insertrowtodata(object,nStoreId)
	generateItemFilePath(0,nStoreId);
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
function generateItemFilePath(nAction, nStoreId)
	player_rolename = GetName();
	player_rolename = totelex(player_rolename);
	
	if nStoreId == nil or nStoreId == 0 or nStoreId == 1 then 
		if nAction == nil or nAction == 0 or nAction == 1 then
			ITEM_FILEPATH = "data/expand_box/"..player_rolename..".txt";
		else
			ITEM_FILEPATH = "\\data\\expand_box\\"..player_rolename..".txt";
		end
	else
		if nAction == nil or nAction == 0 or nAction == 1 then
			ITEM_FILEPATH = "data/carriage/"..player_rolename..".txt";
		else
			ITEM_FILEPATH = "\\data\\carriage\\"..player_rolename..".txt";
		end
	end
	
	-- print(ITEM_FILEPATH);
end;


function GetStoreFreeRoomExpandBox()
	generateItemFilePath(2, 1);
	return MAX_EXPAND_BOX_ITEMS - MAX_ITEM_COUNT;
end;

function GetStoreFreeRoomCarriage()
	generateItemFilePath(2, 2);
	return MAX_CARRIAGE_ITEMS - MAX_ITEM_COUNT;
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
		if sName ~= "" then
			k = k+1;
			tData[k] = {sName,{nGeneral,nDetail,nPaticular},nQuantity}
		end
	end
	-- print("k",k);
	TabFile_Unload(ITEM_FILEPATH); -- THIS IS VERY IMPORTANT COMMAND !!! REMEMBER IT!!!
	return tData, k;
end;


function init(nStoreId)
	generateItemFilePath(2,nStoreId)
	-- print(nStoreId,ITEM_FILEPATH);
	TB_DATAITEMS = {}
	TB_DATAITEMS = new(KTabFile, ITEM_FILEPATH);
	TB_ITEMS, MAX_ITEM_COUNT = getListFromFile();
	-- print("ITEM_FILEPATH",ITEM_FILEPATH)
	-- print("TB_ITEMS",getn(TB_ITEMS))
	-- print("MAX_ITEM_COUNT",MAX_ITEM_COUNT)
end

function nothing() end;