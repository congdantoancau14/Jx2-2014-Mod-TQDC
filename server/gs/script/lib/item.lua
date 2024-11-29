
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
	local tItems = GetAllItem();
	local tItemsInBag = {}
	for i=1,getn(tItems) do 
		local g,d,p = GetItemInfoByIndex(tItems[i]);
		local szName = GetItemName(tItems[i]);
		local nCount = GetItemCount(g,d,p);
		if nCount > 0 then
			local tItem = {szName,{g,d,p},nCount}
			if CheckExistItem(tItemsInBag,tItem) == 0 then 
				tinsert(tItemsInBag,tItem);
			end
		end
	end
	return tItemsInBag;
end;

-- return 1 is duplicated
function CheckExistItem(tItems,tItem)
	for i=1,getn(tItems) do 
		if (tItems[i][2][1] == tItem[2][1]
			and tItems[i][2][2] == tItem[2][2]
			and tItems[i][2][3] == tItem[2][3]
			) then 
			return 1;
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

