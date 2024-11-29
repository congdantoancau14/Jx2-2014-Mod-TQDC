
TB_SHOP = new(KTabFile,"\\settings\\buysell.txt");
MAX_SHOP = 0;
CUR_SHOP = 0;


function showShops()
	init();
	local tSay = {
		"show first shop/#_get_shop_number(1)",
		format("show last shop/#_get_shop_number(%d)",MAX_SHOP),
		format("show random shop/#_get_shop_number(%d)",random(MAX_SHOP)),
		"input shop index/inputShop",
		"close/nothing",
	}
	Say("",getn(tSay),tSay);
end;

function init()
	MAX_SHOP = countRows();
end;

function countRows()

	local nLines = TB_SHOP:getRow();
	local nRows = 0;
	
	for i=2,nLines do
		if checkEmptyRow(i) ~= 1 then
			nRows = nRows+1;
		end
	end
	
	return nRows;
end;

function checkEmptyRow(nRowIndex)
	local nRowLen = TB_SHOP:getCol(nRowIndex);
	local isEmpty = 1;
	for i=1,nRowLen do
		if TB_SHOP:getCell(1,i) ~= "" then
			isEmpty = 0;
			break
		end
	end
	return isEmpty;
end;

-- function getRowLen()
	-- local nRowLen = TB_SHOP:getCol(1);
	-- for i=1,nRowLen do
		-- print(TB_SHOP:getCell(1,i));
	-- end
-- end;

function inputShop()
	AskClientForNumber("_get_shop_number",1,MAX_SHOP,"Input shop index");
end;

function _get_shop_number(nShopId)
	CUR_SHOP = nShopId;
	Sale(nShopId);
	showShopNavigation();
end;

function showShopNavigation()
	local tSay = {
		"next shop/#navigateShop(1)",
		"prev shop/#navigateShop(-1)",
		format("random shop/#_get_shop_number(%d)",random(MAX_SHOP)),
		"\nback main/showShops",
		"stop here/nothing",
	}
	Say(format("Shop %d/%d",CUR_SHOP,MAX_SHOP),getn(tSay),tSay);
end;

function navigateShop(nNav)
	if nNav == -1 and CUR_SHOP == 1 then 
		Talk(1,"showShopNavigation","This is the first shop");
		return
	end
	
	if nNav == 1 and CUR_SHOP == MAX_SHOP then 
		Talk(1,"showShopNavigation","This is the last shop");
		return
	end
	CUR_SHOP = CUR_SHOP + nNav;
	Sale(CUR_SHOP);
	showShopNavigation();
end;


function getData()
	
	-- local nLenRow = TB_SHOP:getCol(1);
	-- for i=1,nLenRow do
		-- print(TB_SHOP:getCell(1,i));
	-- end
	
	local tData = {}
	
	local nCount = TB_SHOP:getRow();
	local k=0;
	for i=2,nCount do
		local nModel = TB_SHOP:getCell(i,1);
		local nType = TB_SHOP:getCell(i,2);
		
		if nModel ~= "" then
			k = k+1;
			tData[k] = {}
			tinsert(tData[k],nModel);
			tinsert(tData[k],nType);
		end
	end
	return tData;
end;

function nothing()
end;