
-- Include("\\script\\lib\\string.lua");
Include("\\script\\class\\ktabfile.lua");
ITEM_FILEPATH = "\\settings\\item\\other.txt";
TB_DATAITEMS = new(KTabFile, ITEM_FILEPATH);

MAX_ITEM_COUNT = 0
TB_ITEMS = {}

-------------------------------------------------------------------------------
--								FUNCTIONS
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


function GetItemNameByGDP(g,d,p)
	for i=1,MAX_ITEM_COUNT do 
		local t = TB_ITEMS[i];
		if (g == tonumber(t[2]) and d == tonumber(t[3]) and p == tonumber(t[4])) then 
			return t[1];
		end
	end
	return "not found";
end;



function item_manager_init()
	TB_ITEMS, MAX_ITEM_COUNT = getListFromFile()
end


function getListFromFile()
	
	local tData = {}
	
	local nCount = TB_DATAITEMS:getRow();
	local k=0;
	for i=2,nCount do
		local sName = TB_DATAITEMS:getCell(i,1);
		local nGeneral = TB_DATAITEMS:getCell(i,2);
		local nDetail = TB_DATAITEMS:getCell(i,3);
		local nPaticular = TB_DATAITEMS:getCell(i,4);
		
		if sName ~= "" then
			k = k+1;
			tData[k] = {}
			tinsert(tData[k],sName);
			tinsert(tData[k],nGeneral);
			tinsert(tData[k],nDetail);
			tinsert(tData[k],nPaticular);
		end
	end
	
	return tData, k;
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
			if IsNummeric(string) == 1 then
				print ("IsNummeric>>tabletostring>>string:["..string.."] This is not an item!");
				print (tonumber(date("%y%m%d%H%M%S")).."-Something wrong here. String is a nummeric!!!");
			end
		end
	end
	
	return string;
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
