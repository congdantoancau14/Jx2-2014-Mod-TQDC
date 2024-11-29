--ÉñÐÐ·û£ºÁ÷Ë®Îå·ÖÖÓ
Include("\\script\\lib\\string.lua");
Include("\\script\\class\\ktabfile.lua");

tFileList = {
	"\\settings\\item\\other.txt",
	"\\settings\\item\\usable.txt",
	"\\settings\\item\\quest.txt",
}

g = -1
d = -1
p = 0
q = -1

ACTION_MENU 	= 0
ACTION_RESET 	= -1
ACTION_DELETE 	= -2
VALUE_ADDITEM = 1
VALUE_DELITEM = 2

MAX_ITEM_COUNT_P = 30000
MAX_ITEM_COUNT = 0
TB_ITEMS = {}


tItemShortkeys = {
	{"Cæ Linh Th¹ch",{2,1,30368},"clt"},
	{"Cæ Linh Ngäc",{2,1,30369},"cln"},
	{"Thiªn M«n Kim LÖnh",{2,1,30370},"tmkl"},
	{"Th«ng Thiªn LÖnh",{2,1,30409},"ttl"},
	{"Tô NghÜa LÖnh",{2,95,208},"tnl"},
	{"Th¸i NhÊt LÖnh",{2,1,30687},"tnl"},
	{"Thiªn Cang LÖnh",{2,95,204},"tcl"},
	{"Tiªu Dao Ngäc",{2,1,30603},"tdn"},
	
}


-------------------------------------------------------------------------------
--								FUNCTIONS
-------------------------------------------------------------------------------

-- checkItemInTable(tItems,nColumn,szKeyword)
function checkItemInTable(table,str)
	local isExist = 0;
	local tDupplicates = {}; -- contains multiple result
	str = trimAndLowerString(str);

	for index, value in table do
		local szTarget = unmarks(value[1]);
		szTarget = trimAndLowerString(szTarget);
		if str == szTarget then
			if getn(tDupplicates) == 0 then
				isExist = index;
				-- break -- stop when found
			end
			tinsert(tDupplicates,index); -- continue searching
		end
	end
	if isExist == 0 then -- refind with relative accuracy
		for index, value in table do
			local szTarget = unmarks(value[1]);
			szTarget = trimAndLowerString(szTarget);
			if strfind(szTarget,str) ~= nil then
				if getn(tDupplicates) == 0 then
					isExist = index;
					-- break -- stop when found
				end
				tinsert(tDupplicates,index); -- continue searching
			end
		end
	end
	return isExist, tDupplicates; -- isExist: first index of tDupplicates;
end

function trimAndLowerString(str)
	str = strlower(str);
	str = trim(str);
	str = replace(str," ","");
	return str;
end;

function isNummeric(str)
	if trim(str) == tostring(tonumber(str)) then
		return 1;
	else
		return 0;
	end
end;

function init()
	TB_ITEMS, MAX_ITEM_COUNT = getListFromFile()
end


function getListFromFile()
	
	local tData = {}

	local nCount = 0;
	for j=1, getn(tFileList) do
		TB_DATAITEMS = new(KTabFile, tFileList[j]);
		nCount = nCount + TB_DATAITEMS:getRow();
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
				--tinsert(tData[k],nGeneral);
				--tinsert(tData[k],nDetail);
				--tinsert(tData[k],nPaticular);
				tinsert(tData[k],{nGeneral,nDetail,nPaticular});
			end
		end
	end
	
	return tData, k;
end;

function nothing() end;