--神行符：流水五分钟
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
	{"C� Linh Th筩h",{2,1,30368},"clt"},
	{"C� Linh Ng鋍",{2,1,30369},"cln"},
	{"Thi猲 M玭 Kim L謓h",{2,1,30370},"tmkl"},
	{"Th玭g Thi猲 L謓h",{2,1,30409},"ttl"},
	{"T� Ngh躠 L謓h",{2,95,208},"tnl"},
	{"Th竔 Nh蕋 L謓h",{2,1,30687},"tnl"},
	{"Thi猲 Cang L謓h",{2,95,204},"tcl"},
	{"Ti猽 Dao Ng鋍",{2,1,30603},"tdn"},
	
}


-------------------------------------------------------------------------------
--								FUNCTIONS
-------------------------------------------------------------------------------

function searchItemInTables(str)
	Msg2Player("ng t譵 ki誱: '"..str.."'...");
	local nIndex = 0
	for i = 1, getn(tbListofTables) do
		nIndex, tDup = checkItemInTable(tbListofTables[i],str);
		if nIndex ~= 0 then 
			tbCurrentListItems = tbListofTables[i];
			break; 
		end
	end
	Msg2Player("Ho祅 th祅h t譵 ki誱");
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
	AskClientForString("_request_additem_string_call_back","Ten item khong dau",1,32,"Th猰 v藅 ph萴");
end;

function _request_additem_string_call_back(str)
	
	local result, nAction =  handleString(str,1);
	if nAction ~= nil and nAction == 1 then 
		if result == 1 then
			Msg2Player("Th猰 v藅 ph萴 th祅h c玭g!");
		elseif result == 0 then
			Msg2Player("Th猰 v藅 ph萴 th蕋 b筰!");
		end
	elseif nAction ~= nil and nAction == 2 then 
		if result == 1 then
			Msg2Player("X鉧 v藅 ph萴 th祅h c玭g!");
		elseif result == 0 then
			Msg2Player("X鉧 v藅 ph萴 th蕋 b筰!");
		end
	end
end;

function inputDelItemString()
	AskClientForString("_request_delitem_string_call_back","Ten item khong dau",1,32,"X鉧 v藅 ph萴");
end;

function _request_delitem_string_call_back(str)
	local result =  handleString(str,2);
	if result == 1 then
		Msg2Player("X鉧 v藅 ph萴 th祅h c玭g!");
	elseif result == 0 then
		Msg2Player("X鉧 v藅 ph萴 th蕋 b筰!");
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
			Talk(1,"",format("V藅 ph萴 [<color=yellow>%s<color>] kh玭g t錸 t筰!",t[1]));
			result = 0;
		else
			if tonumber(t[2]) >= 0 then
				q = t[2];
			elseif t[2] and tonumber(t[2]) < 0 then
				local nDupIndex = abs(t[2]);
				local nFound = getn(tDup)
				if nDupIndex > nFound then
					Talk(1,"",format("Ch� t譵 th蕐 <color=yellow>%d<color> v藅 ph萴",nFound));
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
				Talk(1,"",format("V藅 ph萴 [<color=yellow>%s<color>] kh玭g t錸 t筰!",t[1]));
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
		Talk(1,"","Kh玭g t譵 th蕐 v藅 ph萴 c莕 x鉧 trong h祅h trang!");
		return 0;
	end
	local nCount = GetItemCount(tbCurrentListItems[nIndex][2][1],tbCurrentListItems[nIndex][2][2],tbCurrentListItems[nIndex][2][3]);
	if nCount > 1 then 
		Say(format("B筺 mu鑞 x鉧 v藅 ph萴 <color=yellow>%s<color>?",tbCurrentListItems[nIndex][1]),3,
			format("ng! Nh藀 s� lng/#getDelNum(%d)",nCount),
			format("ng! X鉧 h誸 lu玭/#_request_delitem_number_call_back(%d)",nCount),
			"Kh玭g! Nh莔 th玦/nothing"
		)
	else
		Say(format("X竎 nh薾 x鉧 %s",tbCurrentListItems[nIndex][1]),2,"уng �/#_request_delitem_number_call_back(1)","Kh玭g/nothing");
	end
end

function _request_delitem_number_call_back(nQuantity)
	local nDel = DelItem(tbCurrentListItems[nItemDelIndex][2][1],tbCurrentListItems[nItemDelIndex][2][2],tbCurrentListItems[nItemDelIndex][2][3],nQuantity);
	if nDel == 1 then 
		Msg2Player(format("X鉧 th祅h c玭g %s x%d!",tbCurrentListItems[nItemDelIndex][1],nQuantity))
		return 1
	else
		Msg2Player(format("Xu蕋 hi謓 l鏸 trong khi x鉧 %s x%d!",tbCurrentListItems[nItemDelIndex][1],nQuantity))
		return 0
	end
end;

function getDelNum(nMax)
	AskClientForNumber("_request_delitem_number_call_back",1,nMax,"Nh藀 s� lng c莕 x鉧")
end;

function addItemAndLog(nIndex, szName)
	if GetFreeItemRoom() < 1 then
		Msg2Player("H祅h trang  y!");
		return 0;
	end
	local result = AddItem(g,d,p,q);
	local szItemCode = format("{%d,%d,%d}",g,d,p);
	if szName == nil or szName == "" then
		szName = GetItemName(g,d,p);
	end
	Msg2Player("T猲 v藅 ph萴: "..szName.."\nM� v藅 ph萴: "..szItemCode);
	
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
	local szRule = "Tham s� h頿 l� l莕 lt l� 1, 2, 3, 4 tham s鑌n"
		.."[*] <color=green>1 tham s�<color>: C� ph竝: [T猲_v藅_ph萴] - Nh薾 1 v藅 ph萴\n"
		.."[*] <color=green>1 tham s�<color>: C� ph竝: [MenuAction] = 0: M� menu\n"
		.."[*] <color=green>1 tham s�<color>: C� ph竝: [MenuAction] = -1: Reset search\n"
		.."[*] <color=green>1 tham s�<color>: C� ph竝: [MenuAction] = -2: x鉧 items\n"
		.."[*] <color=green>2 tham s�<color>: C� ph竝: [T猲_v藅_ph萴,S鑏lng_v藅_ph萴]\n"
		.."[*] <color=green>3 tham s�<color>: C� ph竝: [nGeneral,nDetail,nPaticular] - Nh薾 1 v藅 ph萴\n"
		.."[*] <color=green>4 tham s�<color>: C� ph竝: [nGeneral,nDetail,nPaticular, nQuantity]\n"
		.."<color=yellow>T猲 v藅 ph萴 kh玭g ph﹏ bi謙 hoa thng, c� kh玭g kho秐g c竎h.\n";
	Talk(1,"",szRule);
	Msg2Player("L鏸 c� ph竝 nh藀 v藅 ph萴!")
end;

function nothing() end;

