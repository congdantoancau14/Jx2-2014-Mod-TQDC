
-- Include("\\script\\lib\\string.lua");
Include("\\script\\class\\ktabfile.lua");
ITEM_OTHER_FILEPATH = "\\settings\\item\\other.txt";
ITEM_QUEST_FILEPATH = "\\settings\\item\\quest.txt";
ITEM_USABL_FILEPATH = "\\settings\\item\\usable.txt";

MAX_ITEM_COUNT = 0
TB_LOADED_ITEMS = {}

-------------------------------------------------------------------------------
--								FUNCTIONS
-------------------------------------------------------------------------------

function getListOriginalItemsFromFile()
	
	local tData = {}
	
	local nCount = TB_DATA_FILE_ITEMS:getRow();
	local k=0;
	for i=2,nCount do
		local sName = TB_DATA_FILE_ITEMS:getCell(i,1);
		local nGeneral = TB_DATA_FILE_ITEMS:getCell(i,2);
		local nDetail = TB_DATA_FILE_ITEMS:getCell(i,3);
		local nPaticular = TB_DATA_FILE_ITEMS:getCell(i,4);
		local nWeight = TB_DATA_FILE_ITEMS:getCell(i,5);
		local nPrice = TB_DATA_FILE_ITEMS:getCell(i,6);
		local nStack = TB_DATA_FILE_ITEMS:getCell(i,7);
		
		nGeneral = tonumber(nGeneral);
		nDetail = tonumber(nDetail);
		nPaticular = tonumber(nPaticular);
		nWeight = tonumber(nWeight);
		nPrice = tonumber(nPrice);
		nStack = tonumber(nStack);
		
		if sName ~= "" then
			k = k+1;
			tData[k] = {}
			tinsert(tData[k],sName);
			tinsert(tData[k],nGeneral);
			tinsert(tData[k],nDetail);
			tinsert(tData[k],nPaticular);
			tinsert(tData[k],nWeight);
			tinsert(tData[k],nPrice);
			tinsert(tData[k],nStack);
		end
	end
	
	return tData, k;
end;

function item_manager_init(szFilePath)
	TB_DATA_FILE_ITEMS = new(KTabFile, szFilePath);
	TB_LOADED_ITEMS, MAX_ITEM_COUNT = getListOriginalItemsFromFile()
end

item_manager_init(ITEM_OTHER_FILEPATH);

-------------------------------------------------------------------------------

-- Distinguish item can-be-putin of all items in bag and add thouse item to a table then return them;
function GetItemsInBag()
	local tbAllItems = GetAllItem();
	local tbItemsInBag = {} -- can-be-putin items (table result to return)
	
	local tbItemsNotAllow = getNotAllowedItems(tbAllItems);
	
	for i=1,getn(tbAllItems) do 
		local idx = tbAllItems[i];
		local g,d,p = GetItemInfoByIndex(idx);
		local szName = GetItemName(idx);
		-- local nLock = GetItemSpecialAttr(idx,"LOCK");
		-- local nGenertTime = GetItemCreateTime(idx);
		-- local nExpireTime = GetItemExpireTime(idx);
		local nCount = GetItemCount(g,d,p);
		if nCount > 0 then
			local item = {szName,{g,d,p},nCount}
			local nIndexExistInBagItem = searchItemInTable(item,tbItemsInBag); -- already put in table result (exist) item
			local nIndexNotAllowedItem = searchItemInTable(item,tbItemsNotAllow);
			-- if the item is not exist in bag before (dubplicated) and be allowed so it can be added to the table tbItemsInBag
			if nIndexExistInBagItem == 0 and nIndexNotAllowedItem == 0 then 
				tinsert(tbItemsInBag,item);
			end

		end
	end
	return tbItemsInBag;
end;

-- Get items unable (can not) to be putin expand box
function getNotAllowedItems(tbItems)
	local tbItemsNotAllow = {}
	for i=1,getn(tbItems) do 
		local idx = tbItems[i];
		local g,d,p = GetItemInfoByIndex(idx);
		local szName = GetItemName(idx);
		local nLock = GetItemSpecialAttr(idx,"LOCK");
		-- local nGenertTime = GetItemCreateTime(idx);
		local nExpireTime = GetItemExpireTime(idx);
		if nLock == 1 or nExpireTime > 0 then
			-- print(szName);
			local item = {szName,{g,d,p}}
			tinsert(tbItemsNotAllow,item);
		end
	end
	-- print(getn(tbItemsNotAllow))
	return tbItemsNotAllow;
end;

-- return index of the item if the item was found
-- return 0 not found
function searchItemInTable(item,tbItems)
	for i=1,getn(tbItems) do 
		if (tbItems[i][2][1] == item[2][1]
			and tbItems[i][2][2] == item[2][2]
			and tbItems[i][2][3] == item[2][3]
			-- and tbItems[i][4] == item[4]
			-- and tbItems[i][5] == item[5]
			) then 
			return i;
		end
	end
	return 0;
end;


function removeItemsFromTable(tItemsToRemove, tItems)
	for i=1, getn(tItems) do
		for j=1, getn(tItemsToRemove) do
			if isTheSameItem(tItems[i][2],tItemsToRemove[j][2]) == 1 then
				tremove(tItems,i);
				return tItems;
			end
		end
	end
	return tItems;
end;

function countItemNeededRoom(table)
	local nCount = 0;
	for i=1, getn(table) do
		local t = table[i];
		local nStack = getItemStackFromLoadedTable(t[2][1],t[2][2],t[2][3]);
		nCount = nCount + ceil(t[3]/nStack);
	end
	return nCount;
end

function getItemWeightFromLoadedTable(g,d,p)
	local nWeight = 0;
	local nCount = getn(TB_LOADED_ITEMS);
	
	for i=1,nCount do
		local t = TB_LOADED_ITEMS[i];
		if (g == t[2] and d == t[3] and p == t[4]) then
			nWeight = tonumber(t[5]);
			break;
		end

	end
	return nWeight;
end;

function getItemStackFromLoadedTable(g,d,p)
	local nStack = 0;
	local nDataFile = 1;
	item_manager_init(ITEM_OTHER_FILEPATH);
	
	while nStack == 0 and nDataFile <= 3 do
		if nDataFile == 2 then
			item_manager_init(ITEM_QUEST_FILEPATH);
		elseif nDataFile == 3 then
			item_manager_init(ITEM_USABL_FILEPATH);
		end
		
		local nCount = getn(TB_LOADED_ITEMS);
		-- print("getItemStackFromLoadedTable:nCount:",nCount);
		for i=1,nCount do
			local t = TB_LOADED_ITEMS[i];
			-- if p > 1 and p < 9 and t[4] > 1 and t[4] < 9 then
				-- print("getItemStackFromLoadedTable",g,d,p,t[2],t[3],t[4],t[7]);
			-- end
			if (g == t[2] and d == t[3] and p == t[4]) then
				-- print("getItemStackFromLoadedTable>>matched!",g,d,p,t[2],t[3],t[4],t[7]);
				nStack = t[7];
				break;
			end

		end
		nDataFile = nDataFile + 1;
		
	end
	
	
	item_manager_init(ITEM_OTHER_FILEPATH);
	if nStack == 0 then nStack = 1; end
	return nStack;
end;




function DropItems(g,d,p,nScatterNum)
	local nMapID, nX, nY = GetWorldPos()
	local nWidthBegin = 0;
	local nWidthEnd = 200;
	DropItem(g,d,p, nMapID, nX, nY, nWidthBegin, nWidthEnd, nScatterNum)
end;

function GetFreeItemWeight()
	return GetMaxItemWeight() - GetCurItemWeight();
end;

function isTheSameItem(t1, t2)

	if t1[1] == t2[1] 
	and t1[2] == t2[2] 
	and t1[3] == t2[3]
	then return 1
	else return 0
	end
end;

-- convert a table of many item to a string
function tableofobjectstostring(table)
	local t = table;
	local string = "";
	local tab = "\t";
	local endl = "\n";
	local space = " ";
	local empty = "";
	
	if t ~= nil then 
		for i=1,getn(t) do 
			if type(t[i]) == "table" then
				for j=1,getn(t[i]) do 
					if type(t[i][j]) == "table" then
						for k=1,getn(t[i][j]) do 
							if type(t[i][j][k]) == "table" then
								string = string..oneleveltabletostring(t[i][j][k])..tab;
							else
								if t[i][j] ~= nil then
									string = string..t[i][j][k]..tab;
								else
									--string = string..empty..tab;
									string = string..space..tab;
								end
							end;
						end
					else
						if t[i][j] ~= nil then
							string = string..t[i][j]..tab;
						else
							string = string..space..tab;
						end
					end 
				end
			else
				string = string..t[i]..tab;
			end 
			string = string..endl;
			--print ("tabletostring>>string:"..string);
			if IsNummeric(string) == 1 then
				print ("IsNummeric>>tabletostring>>string:["..string.."] This is not an item!");
				print (tonumber(date("%y%m%d%H%M%S")).."-Something wrong here. String is a nummeric!!!");
			end
		end
	end
	-- print(string);
	return string;
end;

function oneleveltabletostring(table)
	local string = "";
	for i=1, getn(table) do
		string = string..table[i];
		if i < getn(table) then
			string = string.."\t";
		end
	end;
	return trim(string);
end;

function tableofobjectstostring_original(table)
	local t = table;
	local string = "";
	local tab = "\t";
	local endl = "\n";
	
	if t ~= nil then 
		for i=1,getn(t) do 
			if type(t[i]) == "table" then
				for j=1,getn(t[i]) do
					if type(t[i][j]) == "table" then
						for k=1,getn(t[i][j]) do 
							string = string..t[i][j][k]..tab;
						end
					else
						string = string..t[i][j]..tab;
					end 
				end
			else
				string = string..t[i]..tab;
			end 
			string = string..endl;
			--print ("tabletostring>>string:"..string);
			if IsNummeric(string) then
				print ("tabletostring>>string:"..string);
				print (tonumber(date("%yyyy%m%d%H%M%S")).."-Something wrong here. String is a nummeric!!!");
			end
		end
	end
	
	return string;
end;
