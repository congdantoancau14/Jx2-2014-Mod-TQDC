Include("\\script\\lib\\string.lua");
--Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\item.lua");
THIS_FILE = "\\settings\\static_script\\item\\punish_bad.lua";

function OnUse()
	showMenu()
end;

function showMenu()
	local tbSay = {
		"Khay Tiªu hñy vËt phÈm/destroyItems",
		"List Tiªu hñy vËt phÈm/destroyListItems",
		"NhËp tªn tiªu hñy vËt phÈm/inputDelItemString",
		"Thanh lÝ hµnh trang/ClearBagAllItem",
		"Tho¸t/nothing"
	}
	Say("",getn(tbSay),tbSay);
end;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

tItems = {}
nCount = 0;
nPage = 1;
nPages = 1;
ITEM_PER_PAGE = 5;
tbCurrentItems = {}
g = -1
d = -1
p = -1
q = 0

function destroyListItems()
	navigation(0);
end;

function navigation(nNav)
	tItems = GetItemsInBag();
	nCount = getn(tItems);
	-- print(nCount);
	if nCount < 1 then 
		Msg2Player("Hµnh trang ®· trèng");
		return 0;
	end
	local nRound = floor(nCount/ITEM_PER_PAGE)*ITEM_PER_PAGE;
	
	nPages = ceil(nCount/ITEM_PER_PAGE);
	nPage = nPage + nNav;
	
	if nPage >= nPages then 
		nPage = nPages;
	end
	
	local nBegin = (nPage-1) * ITEM_PER_PAGE + 1;
	local nEnd = nBegin + ITEM_PER_PAGE - 1;
	if nPage == nPages and nRound < nCount then 
		nEnd = nBegin + nCount - nRound - 1;
	end
	
	local tbSay = {}
	
	for i=nBegin,nEnd do 
		tinsert(tbSay,format("[%d] %s x%d/#ask_for_confirm_delitem(%d)",i,tItems[i][1],tItems[i][3],i))
	end
	
	if nPage < nPages then
		tinsert(tbSay, "\nTrang sau/#navigation(1)");
	else
		tinsert(tbSay, format("\nTrang ®Çu/#navigation(%d)",-nPage+1));
	end
	if nPage > 1 then 
		tinsert(tbSay, "Trang tr­íc/#navigation(-1)");
	else
		tinsert(tbSay, format("Trang cuèi/#navigation(%d)",nPages-nPage));
	end
	tinsert(tbSay,format("Xãa trang nµy/#confirm_del_this_page(%d)",nPage));
	tinsert(tbSay,"\nKh«ng xãa/nothing");
	Say(format("Tæng céng cã <color=yellow>%d<color> lo¹i item. §ang hiÓn thÞ trang <color=gold>%d<color>\/%d.",nCount,nPage,nPages),getn(tbSay),tbSay);
end;

function confirm_del_this_page(nPage)
	Say(format("X¸c nhËn xãa trang [<color=yellow>%d<color>]?",nPage),2,
		format("\n>> X¸c nhËn/#delThisPage(%d)",nPage),
		"\n>> Kh«ng/nothing"
	)
end;

function delThisPage(nPage)
	local nRound = floor(nCount/ITEM_PER_PAGE)*ITEM_PER_PAGE;
	local nBegin = (nPage-1) * ITEM_PER_PAGE + 1;
	local nEnd = nBegin + ITEM_PER_PAGE - 1;
	if nPage == nPages then 
		nEnd = nBegin + nCount - nRound - 1;
	end
	
	local nBegin = (nPage-1) * ITEM_PER_PAGE + 1;
	local nEnd = nBegin + ITEM_PER_PAGE - 1;
	if nPage == nPages and nRound < nCount then 
		nEnd = nBegin + nCount - nRound - 1;
	end
	
	-- print(nBegin,nEnd);
	for i=nBegin, nEnd do 
		local nDel = DelItem(tItems[i][2][1],tItems[i][2][2],tItems[i][2][3],tItems[i][3]);
		if nDel == 1 then 
			Msg2Player(format("§· xãa %s x%d cña trang %d.",tItems[i][1],tItems[i][3],nPage))
		else
			Msg2Player(format("X¶y ra lçi khi xãa %s x%d cña trang %d.",tItems[i][1],tItems[i][3],nPage))
			return 0;
		end
	end
	
	navigation(0);
end;

function ask_for_confirm_delitem(nIndex)
	Say(format("X¸c nhËn xãa <color=yellow>%s x%d<color> khái hµnh trang?",tItems[nIndex][1],tItems[nIndex][3]),2,
		format("\n>> X¸c nhËn/#DelItemFromBag(%d)",nIndex),
		"\n>> Kh«ng/nothing"
	)
end

function DelItemFromBag(nIndex)
	local nDel = DelItem(tItems[nIndex][2][1],tItems[nIndex][2][2],tItems[nIndex][2][3],tItems[nIndex][3]);
	if nDel == 1 then 
		Msg2Player(format("Xãa thµnh c«ng [%s] x%d",tItems[nIndex][1],tItems[nIndex][3]))
		navigation(0);
		return 1;
	else
		Msg2Player(format("Xãa thÊt b¹i [%s] x%d",tItems[nIndex][1],tItems[nIndex][3]))
		return 0;
	end
end;



-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

function destroyItems()
	local MaxPutinCount = 10;
	PutinItemBox("Tiªu hñy vËt phÈm", MaxPutinCount, "B¹n muèn tiªu hñy nh÷ng vËt phÈm ®· ®Æt vµo?", THIS_FILE, 1);
end;

function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	return 1;
end
	
function OnPutinComplete(param)
	if param ~= 1 then
		return 0;
	end
	local t = GetPutinItem()
	
	-- for i=1, getn(t) do
		-- for j=1,getn(t[i]) do
			-- print(format("t[%d][%d]",i,j)..t[i][j]);
		-- end
	-- end
	
	local nResult = 1;
	for i = 1, getn(t) do
		--local nCount = get_item_count(t, t[i][2], t[i][3], t[i][4]);
		if DelItemByIndex(t[i][1], -1) ~= 1 then
			nResult = 0;
		end
	end
	if nResult == 1 then
		Msg2Player("Tiªu hñy thµnh c«ng!");
	else
		Msg2Player("§· x¶y ra lçi trong qu¸ tr×nh tiªu hñy.");
	end
end

function get_item_count(t, id1, id2, id3)
	local nCount = 0;
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2 and t[i][4] == id3) then
			nCount = nCount + 1;
		end
	end
	return nCount;
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

function ClearBagAllItem(bTag)
	if not bTag or tonumber(bTag) ~= 1 then
		Say("X¸c nhËn thanh lý tói", 2, "§ång ý/#ClearBagAllItem(1)", "Ra khái/nothing")
		return
	end
	ClearItemInPos();
	if GetItemCount(2,1,1) < 1 and GetFreeItemRoom() > 0 then
		AddItem(2,1,1,1)
	end
	if GetItemCount(2,1,30045) < 1 and GetFreeItemRoom() > 0 then
		AddItem(2,1,30045,1)
	end
end

function nothing() end;

----------------------------------------------------------------------


function inputDelItemString()
	AskClientForString("_request_delitem_string_call_back","Ten item khong dau",1,32,"Xãa vËt phÈm");
end;

function _request_delitem_string_call_back(str)
	
	local result =  handleString(str,1);

		if result == 1 then
			Msg2Player("Xãa vËt phÈm thµnh c«ng!");
		elseif result == 0 then
			Msg2Player("Xãa vËt phÈm thÊt b¹i!");
		end

end;


function handleString(szInput)
	local result = 1;
	local t = split(szInput);
	local nTableLen = getn(t);
	-- print("nTableLen: "..nTableLen);
	tItems = GetItemsInBag();
	nCount = getn(tItems);
	local nIndex = 0;
	if nTableLen == 1 then
		result, nIndex = onOneParam(t);
	elseif nTableLen == 2 then
		result, nIndex = onTwoParam(t);
	end

	if result == 1 then 
		if nIndex ~= 0 then

			if tonumber(p) > 0 then
				if tonumber(q) > 0 then 
					--DelItem(g,d,p,q);
					tbCurrentItems = {GetItemName(g,d,p),{g,d,p},q}
					return _request_delitem_number_call_back(q);
				else
					confirmDelItem(nIndex);
					return nil;
				end
			end
		end
	end
		
	-- print("handleString::react end")
	-- print("handleString::result = ",result)
	return result;
end;


function onTwoParam(t)
	local result = 1;
	local nIndex = 0;
	if isNummeric(t[2]) == 0 then
		talkErrorSyntax();
	elseif isNummeric(t[1]) == 1 then
		g = 2;
		d = 1;
		p = t[1];
		q = t[2]
	else
		nIndex = searchItemInTables(t[1]);
		if nIndex == 0 then
			Talk(1,"",format("VËt phÈm [<color=yellow>%s<color>] kh«ng tån t¹i!",t[1]));
			--result = 0;
			return 0;
		else
			if tonumber(t[2]) >= 0 then
				q = t[2];
			elseif t[2] and tonumber(t[2]) < 0 then
				local nDupIndex = abs(t[2]);
				local nFound = getn(tDup)
				if nDupIndex > nFound then
					Talk(1,"",format("ChØ t×m thÊy <color=yellow>%d<color> vËt phÈm",nFound));
					return 0;
				end
				nIndex = tDup[nDupIndex];
				q = 1;
			else
				talkErrorSyntax();
				return 0;
			end
			g = tbCurrentItems[nIndex][2][1];
			d = tbCurrentItems[nIndex][2][2];
			p = tbCurrentItems[nIndex][2][3];
		end
	end
	return result, nIndex;
end;


function onOneParam(t)
	local result = 1;
	local nIndex = 0;
	if isNummeric(t[1]) then
		Msg2Player("Tham sè ®Çu tiªn ph¶i lµ mét chuçi kÝ tù!");
		result = 0;
	else
		
		nIndex = searchItemInTables(t[1]);
		if nIndex == 0 and isNummeric(t[1]) ~= 1 then
			Talk(1,"",format("VËt phÈm [<color=yellow>%s<color>] kh«ng tån t¹i trong hµnh trang!",t[1]));
			result = 0;
		else
			--print("punish_bad>>onOneParam>>nIndex:",nIndex);
			--print("punish_bad>>onOneParam>>tbCurrentItems[nIndex]:",tbCurrentItems[nIndex]);
			g = tbCurrentItems[nIndex][2][1];
			d = tbCurrentItems[nIndex][2][2];
			p = tbCurrentItems[nIndex][2][3];
		end
	end
	
	-- print("onOneParam::reached end")
	return result, nIndex;
end;

nItemDelIndex = 0;

function confirmDelItem(nIndex)
	nItemDelIndex = nIndex;
	if nIndex == nil or nIndex == 0 then 
		--print("Can not delitem. Index may not correct")
		Talk(1,"","Kh«ng t×m thÊy vËt phÈm cÇn xãa trong hµnh trang!");
		return 0;
	end
	local nCount = GetItemCount(tbCurrentItems[nIndex][2][1],tbCurrentItems[nIndex][2][2],tbCurrentItems[nIndex][2][3]);
	if nCount > 1 then 
		Say(format("B¹n muèn xãa vËt phÈm <color=yellow>%s<color>?",tbCurrentItems[nIndex][1]),3,
			format("§óng! NhËp sè l­îng/#getDelNum(%d)",nCount),
			format("§óng! Xãa hÕt lu«n/#_request_delitem_number_call_back(%d)",nCount),
			"Kh«ng! NhÇm th«i/nothing"
		)
	else
		Say(format("X¸c nhËn xãa %s",tbCurrentItems[nIndex][1]),2,"§ång ý/#_request_delitem_number_call_back(1)","Kh«ng/nothing");
	end
end

function _request_delitem_number_call_back(nQuantity)
	local nDel = DelItem(tbCurrentItems[nItemDelIndex][2][1],tbCurrentItems[nItemDelIndex][2][2],tbCurrentItems[nItemDelIndex][2][3],nQuantity);
	if nDel == 1 then 
		Msg2Player(format("Xãa thµnh c«ng %s x%d!",tbCurrentItems[nItemDelIndex][1],nQuantity))
		return 1
	else
		Msg2Player(format("XuÊt hiÖn lçi trong khi xãa %s x%d!",tbCurrentItems[nItemDelIndex][1],nQuantity))
		return 0
	end
end;

function getDelNum(nMax)
	AskClientForNumber("_request_delitem_number_call_back",1,nMax,"NhËp sè l­îng cÇn xãa")
end;


-------------------------------------------------------------------------------
--								FUNCTIONS
-------------------------------------------------------------------------------

function searchItemInTables(str)
	Msg2Player("§ang t×m kiÕm: '"..str.."'...");
	local nIndex, tDup = checkItemInTable(tItems,str);
	tbCurrentItems = tItems;
	
	Msg2Player("Hoµn thµnh t×m kiÕm");
	return nIndex;
end;

-- checkItemInTable(tItems,nColumn,szKeyword)
function checkItemInTable(table,str)
	local isExist = 0;
	local tDupplicates = {}; -- contains multiple result
	str = trimAndLowerString(str);
	str = unmarks(str);
	
	--local file = openfile("searching_result.txt", "w")
	--print("punish_bad>>checkItemInTable>>getn(table):",getn(table));
	--for i=1,getn(table) do
		--print(table[i])
		--print(type(table[i]))
		--print(table[i][1])
	--end
	
	for index, value in table do
		--write(file,value[1].."\n");
		--if getn(value) > 1 then
			--print(value[1]);
		--end
		if type(value) == "table" then
			
			local szTarget = trimAndLowerString(value[1]);
			szTarget = unmarks(szTarget);
			if str == szTarget then
				if getn(tDupplicates) == 0 then
					isExist = index;
					-- break -- stop when found
				end
				tinsert(tDupplicates,index); -- continue searching
			end
		else
			print("unexpected value, expected table. Current value: ",value);
		end
	end
	if isExist == 0 then -- refind with relative accuracy
		for index, value in table do
			--write(file,value[1].."\n");
			if type(value) == "table" then
				local szTarget = unmarks(value[1]);
				szTarget = trimAndLowerString(szTarget);
				if strfind(szTarget,str) ~= nil then
					if getn(tDupplicates) == 0 then
						isExist = index;
						-- break -- stop when found
					end
					tinsert(tDupplicates,index); -- continue searching
				end
			else
				print("unexpected value, expected table. Current value: ",value);
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
		return nil; -- return 0; change this might cause seriously damage of running script (script might not work correctly)
	end
end;