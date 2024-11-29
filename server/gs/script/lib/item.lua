
-- Include("\\script\\lib\\string.lua");
Include("\\script\\class\\ktabfile.lua");
ITEM_FILEPATH = "\\settings\\item\\other.txt";
TB_DATAITEMS = new(KTabFile, ITEM_FILEPATH);

MAX_ITEM_COUNT = 0
TB_ITEMS = {}

-------------------------------------------------------------------------------
--								FUNCTIONS
-------------------------------------------------------------------------------

function GetItemsInBag()
	local tbItems = GetAllItem();
	local tbItemsInBag = {}
	
	local tbItemsNotAllow = getnerateNotAllowedItems(tbItems);
	
	for i=1,getn(tbItems) do 
		local idx = tbItems[i];
		local g,d,p = GetItemInfoByIndex(idx);
		local szName = GetItemName(idx);
		-- local nLock = GetItemSpecialAttr(idx,"LOCK");
		-- local nGenertTime = GetItemCreateTime(idx);
		-- local nExpireTime = GetItemExpireTime(idx);
		local nCount = GetItemCount(g,d,p);
		if nCount > 0 then
			local item = {szName,{g,d,p},nCount}
			local nExistItemIndex = CheckExistItem(tbItemsInBag,item);
			local nNotAllowdItem = CheckExistItem(tbItemsNotAllow,item);

			if nExistItemIndex == 0 and nNotAllowdItem == 0 then
				tinsert(tbItemsInBag,item);
			end

		end
	end
	return tbItemsInBag;
end;

function getnerateNotAllowedItems(tbItems)
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

-- return 1 is duplicated
function CheckExistItem(tbItems,item)
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


function GetItemNameByGDP(g,d,p)
	for i=1,MAX_ITEM_COUNT do 
		local t = TB_ITEMS[i];
		if (g == tonumber(t[2]) and d == tonumber(t[3]) and p == tonumber(t[4])) then 
			return t[1];
		end
	end
	return "not found";
end;


function IsNummeric(str)
	if trim(str) == tostring(tonumber(str)) then
		return 1;
	else
		return 0;
	end
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
