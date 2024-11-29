--���з�����ˮ�����
Include("\\script\\lib\\string.lua");
Include("\\script\\class\\ktabfile.lua");

tFileList = {
	"\\settings\\item\\other.txt",
	"\\settings\\item\\quest.txt",
	"\\settings\\item\\usable.txt",
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
MAX_USABLEITEM_COUNT = 0
MAX_QUESTITEM_COUNT = 0
TB_ITEMS = {}
TB_USABLEITEMS = {}
TB_QUESTITEMS = {}

tbListofTables = {}
tbCurrentListItems = {}

tItemShortkeys = {
	{"C� Linh Th�ch",{2,1,30368},"clt"},
	{"C� Linh Ng�c",{2,1,30369},"cln"},
	{"Thi�n M�n Kim L�nh",{2,1,30370},"tmkl"},
	{"Th�ng Thi�n L�nh",{2,1,30409},"ttl"},
	{"T� Ngh�a L�nh",{2,95,208},"tnl"},
	{"Th�i Nh�t L�nh",{2,1,30687},"tnl"},
	{"Thi�n Cang L�nh",{2,95,204},"tcl"},
	{"Ti�u Dao Ng�c",{2,1,30603},"tdn"},
	
}


-------------------------------------------------------------------------------
--								FUNCTIONS
-------------------------------------------------------------------------------

function searchItemInTables(str)
	Msg2Player("�ang t�m ki�m: '"..str.."'...");
	local nIndex = 0
	for i = 1, getn(tbListofTables) do
		nIndex, tDup = checkItemInTable(tbListofTables[i],str);
		if nIndex ~= 0 then 
			tbCurrentListItems = tbListofTables[i];
			break; 
		end
	end
	Msg2Player("Ho�n th�nh t�m ki�m");
	return nIndex;
end;

-- checkItemInTable(tItems,nColumn,szKeyword)
function checkItemInTable(table,str)
	local isExist = 0;
	local tDupplicates = {}; -- contains multiple result
	str = trimAndLowerString(str);
	str = unmarks(str);
	
	--local file = openfile("searching_result.txt", "w")
	--print("getn(table):",getn(table));
	
	for index, value in table do
		--write(file,value[1].."\n");
		local szTarget = trimAndLowerString(value[1]);
		szTarget = unmarks(szTarget);
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
		--write(file,value[1].."\n");
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
	--closefile(file)
	
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
		return nil;
	end
end;

function init()

	TB_ITEMS, MAX_ITEM_COUNT = getListFromFile(tFileList[1])
	TB_USABLEITEMS, MAX_USABLEITEM_COUNT = getListFromFile(tFileList[2])
	TB_QUESTITEMS, MAX_QUESTITEM_COUNT = getListFromFile(tFileList[3])

	tinsert(tbListofTables,TB_ITEMS);
	tinsert(tbListofTables,TB_USABLEITEMS);
	tinsert(tbListofTables,TB_QUESTITEMS);
	--print("remun_good>>init() is called!");
	tbCurrentListItems = tbListofTables[1];
end


function getListFromFile(fileName)
	
	local tData = {}
local file = openfile("loadingdata_result.txt", "w")
	local nCount = 0;
	
	TB_DATAITEMS = new(KTabFile, fileName);
	nCount = nCount + TB_DATAITEMS:getRow();
	local k=0;
	for i=2,TB_DATAITEMS:getRow() do
		local sName = TB_DATAITEMS:getCell(i,1);
		local nGeneral = TB_DATAITEMS:getCell(i,2);
		local nDetail = TB_DATAITEMS:getCell(i,3);
		local nPaticular = TB_DATAITEMS:getCell(i,4);
		
		if sName ~= "" then
		write(file,sName.."\n");
			k = k+1;
			tData[k] = {}
			tinsert(tData[k],sName);
			--tinsert(tData[k],nGeneral);
			--tinsert(tData[k],nDetail);
			--tinsert(tData[k],nPaticular);
			tinsert(tData[k],{nGeneral,nDetail,nPaticular});
		end
	end
	

	closefile(file);
	--print("remun_good.lua>>getListFromFile>>load end! Number of item:",nCount);
	return tData, k;
end;
-----------------------------------------------------------------------------------------
--								Begin of using item script
-----------------------------------------------------------------------------------------
init();

function OnUse()
	inputAddItemString();
end;

function inputAddItemString()
	AskClientForString("_request_additem_string_call_back","Ten item khong dau",1,32,"Th�m v�t ph�m");
end;

function _request_additem_string_call_back(str)
	
	local result, nAction =  handleString(str,1);
	if nAction ~= nil and nAction == 1 then 
		if result == 1 then
			Msg2Player("Th�m v�t ph�m th�nh c�ng!");
		elseif result == 0 then
			Msg2Player("Th�m v�t ph�m th�t b�i!");
		end
	elseif nAction ~= nil and nAction == 2 then 
		if result == 1 then
			Msg2Player("X�a v�t ph�m th�nh c�ng!");
		elseif result == 0 then
			Msg2Player("X�a v�t ph�m th�t b�i!");
		end
	end
end;

function inputDelItemString()
	AskClientForString("_request_delitem_string_call_back","Ten item khong dau",1,32,"X�a v�t ph�m");
end;

function _request_delitem_string_call_back(str)
	local result =  handleString(str,2);
	if result == 1 then
		Msg2Player("X�a v�t ph�m th�nh c�ng!");
	elseif result == 0 then
		Msg2Player("X�a v�t ph�m th�t b�i!");
	end
end;

function handleString(szInput,nAction)
	local result = 1;
	local t = split(szInput);
	local nTableLen = getn(t);
	-- print("nTableLen: "..nTableLen);
	
	local nIndex = 0;
	if nTableLen == 1 then
		result, nIndex, nAction = onOneParam(t, nAction);
	elseif nTableLen == 2 then
		-- result, nIndex, nAction = onTwoParam(t, nAction);
		result, nIndex = onTwoParam(t);
	elseif nTableLen == 3 then
		result = onThreeParam(t);
	elseif nTableLen == 4 then
		result = onFourParam(t);
	else
		talkErrorSyntax();
		result = 0;
	end
	
	-- print("handleString::nAction",nAction)
	--print("result,nIndex,nAction",result,nIndex,nAction);
	if result == 1 then 
		if nIndex ~= 0 then
			if tonumber(p) > 0 and nAction == VALUE_ADDITEM then
				addItemAndLog(nIndex);
			elseif tonumber(p) > 0 and nAction == VALUE_DELITEM then
				if tonumber(q) > 0 then 
					--DelItem(g,d,p,q);
					tbCurrentListItems = {GetItemName(g,d,p),{g,d,p},q}
					return _request_delitem_number_call_back(q);
				else
					confirmDelItem(nIndex);
					return nil;
				end
			end
		else
			addItemAndLog(0);
		end
	end
		
	-- print("handleString::react end")
	-- print("handleString::result = ",result)
	return result, nAction;
end;


function onTwoParam(t,nAction)
	local result = 1;
	local nIndex = 0;
	if isNummeric(t[2]) ~= 1 then
		talkErrorSyntax();
	elseif isNummeric(t[1]) == 1 then
		g = 2;
		d = 1;
		p = t[1];
		q = t[2]
	else
		nIndex = searchItemInTables(t[1]);
		if nIndex == 0 then
			Talk(1,"",format("V�t ph�m [<color=yellow>%s<color>] kh�ng t�n t�i!",t[1]));
			result = 0;
		else
			if tonumber(t[2]) >= 0 then
				q = t[2];
			elseif t[2] and tonumber(t[2]) < 0 then
				local nDupIndex = abs(t[2]);
				local nFound = getn(tDup)
				if nDupIndex > nFound then
					Talk(1,"",format("Ch� t�m th�y <color=yellow>%d<color> v�t ph�m",nFound));
					return 0;
				end
				nIndex = tDup[nDupIndex];
				q = 1;
			else
				talkErrorSyntax();
			end
			g = tbCurrentListItems[nIndex][2][1];
			d = tbCurrentListItems[nIndex][2][2];
			p = tbCurrentListItems[nIndex][2][3];
		end
	end
	return result, nIndex, nAction;
end;


function onOneParam(t, nAction)
	local result = 1;
	local nIndex = 0;
	if isNummeric(t[1]) == 1 then
		if g == -1 then g = 2 end
		if d == -1 then d = 1 end
		local temp = p;
		p = t[1];
		if tonumber(p) == ACTION_RESET then 
			g = 2;
			d = 1;
			Msg2Player("Reset the memory of earlier search to the default general and detail values (2,1,X).");
			return nil;
		elseif tonumber(p) == ACTION_MENU then 
			p = temp;
			showNavigation();
			return nil;
		elseif tonumber(p) == ACTION_DELETE then
			inputDelItemString();
			nAction = VALUE_DELITEM;
		elseif tonumber(p) < -2 then
			return 0;
		end
	else
		if t[1] == "?" or t[1] == "/" then
			talkErrorSyntax();
			return 0;
		end
		if strfind(t[1],"-") then
			local tbMulti = split(t[1],"-");
			if getn(tbMulti) == 2 and isNummeric(tbMulti[1]) and isNummeric(tbMulti[2]) then
				g = 2;
				d = 1;
				p = tbMulti[1];
				q = tonumber(tbMulti[2]) - tonumber(tbMulti[1]);
			end
			return 1;
		else
			nIndex = searchItemInTables(t[1]);
			if nIndex == 0 and isNummeric(t[1]) ~= 1 then
				Talk(1,"",format("V�t ph�m [<color=yellow>%s<color>] kh�ng t�n t�i!",t[1]));
				result = 0;
			else
				--print("remun_good.lua>>onOneParam>>nIndex:"..nIndex);
				g = tbCurrentListItems[nIndex][2][1];
				d = tbCurrentListItems[nIndex][2][2];
				p = tbCurrentListItems[nIndex][2][3];
			end
		end
	end
	-- print("onOneParam::react end")
	return result, nIndex, nAction;
end;

function onFourParam(t)
	if isNummeric(t[1]) == 1
	and isNummeric(t[2]) == 1
	and isNummeric(t[3]) == 1
	and isNummeric(t[4]) == 1
	then
		g = t[1];
		d = t[2];
		p = t[3];
		q = t[4];
	else
		talkErrorSyntax();
		return 0;
	end
	return 1;
end;

function onThreeParam(t)
	if isNummeric(t[1]) == 1
	and isNummeric(t[2]) == 1
	and isNummeric(t[3]) == 1
	then
		g = t[1];
		d = t[2];
		p = t[3];
	else
		talkErrorSyntax()
		return 0;
	end
	return 1;
end;


nItemDelIndex = 0;

function confirmDelItem(nIndex)
	nItemDelIndex = nIndex;
	if nIndex == nil or nIndex == 0 then 
		--print("Can not delitem. Index may not correct")
		Talk(1,"","Kh�ng t�m th�y v�t ph�m c�n x�a trong h�nh trang!");
		return 0;
	end
	local nCount = GetItemCount(tbCurrentListItems[nIndex][2][1],tbCurrentListItems[nIndex][2][2],tbCurrentListItems[nIndex][2][3]);
	if nCount > 1 then 
		Say(format("B�n mu�n x�a v�t ph�m <color=yellow>%s<color>?",tbCurrentListItems[nIndex][1]),3,
			format("��ng! Nh�p s� l��ng/#getDelNum(%d)",nCount),
			format("��ng! X�a h�t lu�n/#_request_delitem_number_call_back(%d)",nCount),
			"Kh�ng! Nh�m th�i/nothing"
		)
	else
		Say(format("X�c nh�n x�a %s",tbCurrentListItems[nIndex][1]),2,"��ng �/#_request_delitem_number_call_back(1)","Kh�ng/nothing");
	end
end

function _request_delitem_number_call_back(nQuantity)
	local nDel = DelItem(tbCurrentListItems[nItemDelIndex][2][1],tbCurrentListItems[nItemDelIndex][2][2],tbCurrentListItems[nItemDelIndex][2][3],nQuantity);
	if nDel == 1 then 
		Msg2Player(format("X�a th�nh c�ng %s x%d!",tbCurrentListItems[nItemDelIndex][1],nQuantity))
		return 1
	else
		Msg2Player(format("Xu�t hi�n l�i trong khi x�a %s x%d!",tbCurrentListItems[nItemDelIndex][1],nQuantity))
		return 0
	end
end;

function getDelNum(nMax)
	AskClientForNumber("_request_delitem_number_call_back",1,nMax,"Nh�p s� l��ng c�n x�a")
end;

function addItemAndLog(nIndex, szName)
	if GetFreeItemRoom() < 1 then
		Msg2Player("H�nh trang �� ��y!");
		return 0;
	end
	local result = AddItem(g,d,p,q);
	local szItemCode = format("{%d,%d,%d}",g,d,p);
	if szName == nil or szName == "" then
		szName = GetItemName(g,d,p);
	end
	Msg2Player("T�n v�t ph�m: "..szName.."\nM� v�t ph�m: "..szItemCode);
	
	local file = openfile("additem_log.lua", "a+")
	if nIndex ~= 0 then
		local szLog = format("{'%s',%s},\n",tbCurrentListItems[nIndex][1],szItemCode);
		write(file,szLog);
	else
		local szLog = format("{'%s',%s},\n",szName,szItemCode);
		write(file,szLog);
		--write(file,szItemCode.."\n");
	end
	closefile(file)
	q = -1; -- No save quantity
	return result;
end;

function showNavigation()
	local tbSay = {
		"Next item/#navigate(1)",
		"Prev item/#navigate(-1)",
		"Next 10 items/#addMultiItems(10)",
		"Add random item/#addRandomItem(1)",
		"Add random 10 items/#addRandomMultiItems(10)",
		"Add random 50 items/#addRandomMultiItems(50)",
	}
	tinsert(tbSay,"\nClose/nothing");
	Say("",getn(tbSay),tbSay);
end;

function addRandomItem(nShowNav)
	init();
	local nRand = random(MAX_ITEM_COUNT);
	print("addRandomItem",MAX_ITEM_COUNT,nRand,getn(tbCurrentListItems));
	g = tbCurrentListItems[nRand][2][1];
	d = tbCurrentListItems[nRand][2][2];
	p = tbCurrentListItems[nRand][2][3];
	addItemAndLog(0,tbCurrentListItems[nRand][1]);
	if nShowNav == 1 then 
		showNavigation();
	end
end;

function addRandomMultiItems(nQuantity)
	for i = 1, nQuantity do 
		addRandomItem(0);
	end
end;

function addMultiItems(nQuantity)
	for i = 1, nQuantity do 
		p = p+1;
		addItemAndLog(0);
	end
end;


function navigate(nNav)
	p = p+nNav;
	local result = addItemAndLog(0);
	if result ~= 0 then 
		showNavigation();
	end
end;

function talkErrorSyntax()
	local szRule = "Tham s� h�p l� l�n l��t l� 1, 2, 3, 4 tham s�\n"
		.."[*] <color=green>1 tham s�<color>: C� ph�p: [T�n_v�t_ph�m] - Nh�n 1 v�t ph�m\n"
		.."[*] <color=green>1 tham s�<color>: C� ph�p: [MenuAction] = 0: M� menu\n"
		.."[*] <color=green>1 tham s�<color>: C� ph�p: [MenuAction] = -1: Reset search\n"
		.."[*] <color=green>1 tham s�<color>: C� ph�p: [MenuAction] = -2: x�a items\n"
		.."[*] <color=green>2 tham s�<color>: C� ph�p: [T�n_v�t_ph�m,S�_l��ng_v�t_ph�m]\n"
		.."[*] <color=green>3 tham s�<color>: C� ph�p: [nGeneral,nDetail,nPaticular] - Nh�n 1 v�t ph�m\n"
		.."[*] <color=green>4 tham s�<color>: C� ph�p: [nGeneral,nDetail,nPaticular, nQuantity]\n"
		.."<color=yellow>T�n v�t ph�m kh�ng ph�n bi�t hoa th��ng, c� kh�ng kho�ng c�ch.\n";
	Talk(1,"",szRule);
	Msg2Player("L�i c� ph�p nh�p v�t ph�m!")
end;

function nothing() end;

