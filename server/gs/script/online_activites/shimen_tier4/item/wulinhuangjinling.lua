Include("\\script\\online_activites\\shimen_tier4\\item\\wulinhuangjinling_head.lua");

init();

function OnUse()
	inputAddItemString();
end;

function inputAddItemString()
	AskClientForString("_request_additem_string_call_back","Ten item khong dau",1,32,"Thªm vËt phÈm");
end;

function _request_additem_string_call_back(str)
	local result, nAction =  handleString(str,1);
	if nAction ~= nil and nAction == 1 then 
		if result == 1 then
			Msg2Player("Thªm vËt phÈm thµnh c«ng!");
		elseif result == 0 then
			Msg2Player("Thªm vËt phÈm thÊt b¹i!");
		end
	end
end;

function inputDelItemString()
	AskClientForString("_request_delitem_string_call_back","Ten item khong dau",1,32,"Xãa vËt phÈm");
end;

function _request_delitem_string_call_back(str)
	local result =  handleString(str,2);
	if result == 1 then
		Msg2Player("Xãa vËt phÈm thµnh c«ng!");
	elseif result == 0 then
		Msg2Player("Xãa vËt phÈm thÊt b¹i!");
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
	if tonumber(p) > 0 and nAction == 1 then
		addItem(nIndex);
	elseif tonumber(p) > 0 and nAction == 2 then
		if tonumber(q) > 0 then 
			DelItem(g,d,p,q);
			result = 1;
		else
			confirmDelItem(nIndex);
			return nil;
		end
	else
		result = 0;
	end
	-- print("handleString::react end")
	-- print("handleString::result = ",result)
	return result, nAction;
end;


function onTwoParam(t,nAction)
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
		nIndex, tDup = checkItemInTable(tItems,3,t[1],t[2]);
		if nIndex == 0 then
			Talk(1,"",format("VËt phÈm [<color=yellow>%s<color>] kh«ng tån t¹i!",t[1]));
			result = 0;
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
			end
			g = tItems[nIndex][2][1];
			d = tItems[nIndex][2][2];
			p = tItems[nIndex][2][3];
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
		if tonumber(p) == -1 then 
			g = 2;
			d = 1;
			Msg2Player("Reset to default general and detail values");
			return nil;
		elseif tonumber(p) == 0 then 
			p = temp;
			showNavigation();
			return nil;
		elseif tonumber(p) == -2 then
			inputDelItemString();
			nAction = 2;
		end
	else
		nIndex = checkItemInTable(tItems,3,t[1]);
		if nIndex == 0 and isNummeric(t[1]) == 0 then
			Talk(1,"",format("VËt phÈm [<color=yellow>%s<color>] kh«ng tån t¹i!",t[1]));
			result = 0;
		else
			g = tItems[nIndex][2][1];
			d = tItems[nIndex][2][2];
			p = tItems[nIndex][2][3];
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
		print("Can not delitem. Index may not correct")
		return 0;
	end
	local nCount = GetItemCount(tItems[nIndex][2][1],tItems[nIndex][2][2],tItems[nIndex][2][3]);
	if nCount > 1 then 
		Say(format("B¹n muèn xãa vËt phÈm <color=yellow>%s<color>?",tItems[nIndex][1]),3,
			format("§óng! NhËp sè l­îng/#getDelNum(%d)",nCount),
			format("§óng! Xãa hÕt lu«n/#_request_delitem_number_call_back(%d)",nCount),
			"Kh«ng! NhÇm th«i/nothing"
		)
	else
		Say(format("X¸c nhËn xãa %s",tItems[nIndex][1]),2,"§ång ý/#_request_delitem_number_call_back(1)","Kh«ng/nothing");
	end
end

function _request_delitem_number_call_back(nQuantity)
	local nDel = DelItem(tItems[nItemDelIndex][2][1],tItems[nItemDelIndex][2][2],tItems[nItemDelIndex][2][3],nQuantity);
	if nDel == 1 then 
		Msg2Player(format("Xãa thµnh c«ng %s x%d!",tItems[nItemDelIndex][1],nQuantity))
		return 1
	else
		Msg2Player(format("XuÊt hiÖn lçi trong khi xãa %s x%d!",tItems[nItemDelIndex][1],nQuantity))
		return 0
	end
end;

function getDelNum(nMax)
	AskClientForNumber("_request_delitem_number_call_back",1,nMax,"NhËp sè l­îng cÇn xãa")
end;

function addItem(nIndex, szName)
	if GetFreeItemRoom() < 1 then
		Msg2Player("Hµnh trang ®· ®Çy!");
		return 0;
	end
	local result = AddItem(g,d,p,q);
	local szItemCode = format("{%d,%d,%d}",g,d,p);
	Msg2Player("M· vËt phÈm: "..szItemCode);
	local file = openfile("additem_log.lua", "a+")
	if szName ~= nil and szName ~= "" then
		local szLog = format("{'%s',%s},\n",szName,szItemCode);
		write(file,szLog);
	elseif nIndex ~= 0 then
		local szLog = format("{'%s',%s},\n",tItems[nIndex][1],szItemCode);
		write(file,szLog);
	else
		write(file,szItemCode.."\n");
	end
	closefile(file)
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
	local nRand = random(MAX_ITEM_COUNT);
	g = TB_ITEMS[nRand][2];
	d = TB_ITEMS[nRand][3];
	p = TB_ITEMS[nRand][4];
	addItem(0,TB_ITEMS[nRand][1]);
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
		addItem(0);
	end
end;


function navigate(nNav)
	p = p+nNav;
	local result = addItem(0);
	if result ~= 0 then 
		showNavigation();
	end
end;

function talkErrorSyntax()
	local szRule = "Tham sè hîp lÖ lÇn l­ît lµ 1, 2, 3, 4 tham sè\n"
		.."[*] <color=green>1 tham sè<color>: Có ph¸p: [Tªn_vËt_phÈm] - NhËn 1 vËt phÈm\n"
		.."[*] <color=green>2 tham sè<color>: Có ph¸p: [Tªn_vËt_phÈm,Sè_l­îng_vËt_phÈm]\n"
		.."[*] <color=green>3 tham sè<color>: Có ph¸p: [nGeneral,nDetail,nPaticular] - NhËn 1 vËt phÈm\n"
		.."[*] <color=green>4 tham sè<color>: Có ph¸p: [nGeneral,nDetail,nPaticular, nQuantity]\n"
		.."<color=yellow>Tªn vËt phÈm kh«ng ph©n biÖt hoa th­êng, cã kh«ng kho¶ng c¸ch.\n";
	Talk(1,"",szRule);
	Msg2Player("Lçi có ph¸p nhËp vËt phÈm!")
end;

function nothing() end;