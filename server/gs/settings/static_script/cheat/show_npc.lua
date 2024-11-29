
TB_NPC = new(KTabFile,"\\settings\\npcs.txt");
-- GROUPY NPC VIEW
tNpcIndexs = {}
nLastIndex = 0;
nPages = 0;
nCurPage = 0;
tFiltedNpcs = {}
nRecoredNpcID = 0;

tNpcs = {}
-- SINGLE NPC VIEW
MAX_NPC = 0;
CUR_NPC = 0;

function main_show_npc()
	tNpcs, MAX_NPC = getListFromFile();
	local tTalkNpcs, nFiltedRows = getListSpecific(tNpcs,6);
	nPages = floor(nFiltedRows/25);
	tFiltedNpcs = tTalkNpcs;
	local tSay = {
		"Input npc name/inputNpcName",
		"Show npc list/showNpcList",
		"Show single npc/showSingle",
		"Remove last npc/removeNpc",
		"Show mixed npcs/showMixedNpcs",
		"Show talking npcs/showTalkingNpcs",
		"§i Hoa S¬n/goHoaSon",
		"Remove npcs/removen",
	}
	tinsert(tSay, "Nothing/nothing");
	Say("",getn(tSay),tSay);
end;

-------------------------------------------------------------------------------
-- 								SINGLE NPC VIEW
-------------------------------------------------------------------------------
function showSingle()
	local tSay = {
		"show first npc/#_get_npc_number(1)",
		format("show last npc/#_get_npc_number(%d)",MAX_NPC),
		format("show random npc/#_get_npc_number(%d)",random(MAX_NPC)),
		"input npc index/inputNpcIndex",
		"close/nothing",
	}
	Say("",getn(tSay),tSay);
end;


-- function countRows()

	-- local nLines = TB_NPC:getRow();
	-- local nRows = 0;
	
	-- for i=9,nLines do
		-- if checkEmptyRow(i) ~= 1 then
			-- nRows = nRows+1;
		-- end
	-- end
	
	-- return nRows;
-- end;

-- function checkEmptyRow(nRowIndex)
	-- local nRowLen = TB_NPC:getCol(nRowIndex);
	-- local isEmpty = 1;
	-- for i=1,nRowLen do
		-- if TB_NPC:getCell(1,i) ~= "" then
			-- isEmpty = 0;
			-- break
		-- end
	-- end
	-- return isEmpty;
-- end;

-- function getRowLen()
	-- local nRowLen = TB_NPC:getCol(1);
	-- for i=1,nRowLen do
		-- print(TB_NPC:getCell(1,i));
	-- end
-- end;

function inputNpcIndex()
	AskClientForNumber("_get_npc_number",1,MAX_NPC,"Input npc index");
end;

function _get_npc_number(nNpcIndex)
	showNpcByIndex(nNpcIndex);
end;

function showNpcByIndex(nNpcIndex)
	CUR_NPC = nNpcIndex;
	local szNpcName = tNpcs[nNpcIndex][1];
	removeNpc();
	local m,x,y = GetWorldPos();
	nRecoredNpcID = CreateNpc(szNpcName,szNpcName,m,x-5,y);
	showNpcNavigation();
end;

function showNpcNavigation()
	local tSay = {
		"next npc/#navigatenpc(1)",
		"prev npc/#navigatenpc(-1)",
		format("random npc/#_get_npc_number(%d)",random(MAX_NPC)),
		"\nback page/showSingle",
		"stop here/nothing",
	}
	Say(format("npc %d/%d",CUR_NPC,MAX_NPC),getn(tSay),tSay);
end;

function navigatenpc(nNav)
	if nNav == -1 and CUR_NPC == 1 then 
		Talk(1,"showNpcNavigation","This is the first npc");
		return
	end
	
	if nNav == 1 and CUR_NPC == MAX_NPC then 
		Talk(1,"showNpcNavigation","This is the last npc");
		return
	end
	CUR_NPC = CUR_NPC + nNav;
	showNpcByIndex(CUR_NPC);
end;

function showNpcList(nBegin,nEnd)
	tSay = {}
	if nBegin == nil then nBegin = 1 end
	if nEnd == nil or nEnd <= nBegin then nEnd = nBegin + 39 end
	tinsert(tSay,format("next page/#showNpcList(%d)",nBegin+40));
	tinsert(tSay,format("prev page/#showNpcList(%d)",nBegin-40));
	for i = nBegin, nEnd do 
		tinsert(tSay,format("[*] %s/#showNpcByIndex(%d)",tNpcs[i][1],i));
	end
	tinsert(tSay,format("next page/#showNpcList(%d)",nBegin+40));
	tinsert(tSay,format("prev page/#showNpcList(%d)",nBegin-40));
	tinsert(tSay,"close/nothing");
	Say("",getn(tSay),tSay);
end;

function removeNpc()
	SetNpcLifeTime(nRecoredNpcID,0);
end;

function inputNpcName()
	AskClientForString("_request_npc_name_callback","Input npc name",1,64,"Npc name inputer");
end;

function _request_npc_name_callback(szNpcName)
	nRecoredNpcID = CreateNpc(szNpcName,szNpcName,GetWorldPos());
	main_show_npc();
end;
-------------------------------------------------------------------------------
-- 								GROUPY NPC VIEW
-------------------------------------------------------------------------------
function goHoaSon()
	NewWorld(502,1571,2912);
end;

function showMixedNpcs()
	Talk(1,"","This feature is under development. Please contact to the author for more detail.");
end

function showTalkingNpcs()
	local tSay = {
		"Show first page/#goPage(1)",
		"Show last page/#goPage(2)",
		"Show random page/#goPage(0)",
		"Show input page/inputPage",
		"Continue where I left on/continue",
	}
	tinsert(tSay, "Close/nothing");
	Say("",getn(tSay),tSay);
end;

function continue()
	if  nCurPage ~= 0 then
		showPage(tFiltedNpcs,nPages,nCurPage);
	else
		Talk(1,"showTalkingNpcs","No last page was record");
	end
end;

function goPage(nNav)
	if nNav == 0 then
		local nPage = random(nPages)
		while nPage == nCurPage do
			print("show_npc >> goPage >> get random page");
			nPage = random(nPages)
		end
		showPage(tFiltedNpcs,nPages,nPage);
	elseif nNav == 1 then
		showPage(tFiltedNpcs,nPages,1);
	elseif nNav == 2 then
		showPage(tFiltedNpcs,nPages,nPages+1);
	end
end;

function showNavigation()
	local tSay = {}
	if nCurPage <= nPages then
		tinsert(tSay,"Show next page/#navigate(1)")
	end
	if nCurPage > 1 then
		tinsert(tSay,"Show prev page/#navigate(-1)")
	end
	if nCurPage ~= nPages+1 then
		tinsert(tSay,"Show last page/#goPage(2)");
	end
	if nCurPage ~= 1 then 
		tinsert(tSay,"Show first page/#goPage(1)");
	end
	tinsert(tSay,"Show random page/#goPage(0)");
	tinsert(tSay,"Go back main/main_show_npc");
	tinsert(tSay, "Stop here/nothing");
	Say(format("Current Page <color=yellow>%d<color>/%d",nCurPage,nPages+1),getn(tSay),tSay);
end;

function inputPage()
	
	-- SetTaskTemp(1,nPages);
	AskClientForNumber("get_number_callback",0,nPages+1,"Input no of page");
end;

function get_number_callback(nNum)
	if nNum == nil then return end;
	if nNum == 0 then
		removeNpcs(tNpcIndexs);
	else
		showPage(tFiltedNpcs,nPages,nNum);
	end
end;

function removen()
	removeNpcs(tNpcIndexs);
end;

function showPage(tNpcs,nPages,nPage)
	nCurPage = nPage;
	removeNpcs(tNpcIndexs);
	tNpcIndexs = showNpcs(tNpcs,-1,nPage*25-24);
	showNavigation();
end;

function navigate(nNav)
	-- removeNpcs(tNpcIndexs);
	-- if nNav == 1 then
		-- tNpcIndexs, nLastIndex = showNpcs(tFiltedNpcs,-1,nLastIndex-26);
	-- elseif nNav == 2 then
		-- tNpcIndexs, nLastIndex = showNpcs(tFiltedNpcs,-1,nLastIndex+1);
	-- end
	-- showNavigation();
	showPage(tFiltedNpcs,nPages,nCurPage+nNav);
end

function ghiofghiof()
	local tNpcs = getListFromFile();
	local m,x,y = GetWorldPos();
	local k = 0;
	-- h¦Ìng ngang
	-- for p=-5,5 do
		-- k = k+1;
		-- local nNpcIndex = CreateNpc(tNpcs[k][1],tNpcs[k][1],m,x+p*5,y);
		-- SetNpcDeathScript(nNpcIndex, "\\settings\\static_script\\cheat\\npc.lua");
	-- end
	-- b¦Ìn c¨º
	-- for p=1,10 do
		-- k = k+1;
		-- local nNpcIndex = CreateNpc(tNpcs[k][1],tNpcs[k][1],m,x+p*5,y);
		-- SetNpcDeathScript(nNpcIndex, "\\settings\\static_script\\cheat\\npc.lua");
	-- end
	
	local tTalkNpcs, nNum = getListSpecific(tNpcs,6);
end;

function removeNpcs(tNpcIndexs)
	for i=1, getn(tNpcIndexs) do
		SetNpcLifeTime(tNpcIndexs[i],0);
	end
end;

function getListSpecific(tNpcs,nType)
	local list = {}
	local num = 0;
	for i=1,getn(tNpcs) do
		if tonumber(tNpcs[i][2]) == nType then
			tinsert(list,tNpcs[i]);
			num = num+1;
		end
	end
	return list, num;
end

function showNpcs(tNpcs,nType,index)
	if index == nil then index = 0 end;
	local nMax = getn(tNpcs);
	local tNpcIndexs = {};
	
	local m,x,y = GetWorldPos();
	local xBegin = x - 4*3;
	local xEnd = xBegin + 5*6;
	local yBegin = y - 3*3;
	local yEnd = yBegin + 5*6;

	
	local corX = xBegin;
	local corY = yBegin;
	
	local toggle = 0;
	local xscale = floor((xEnd - xBegin) / 6); --	(number of npcs on a row)
	local yscale = floor((yEnd - yBegin) / 6); --	(number of npcs on a col)
	-- print(xscale.." "..yscale);
	
	for i=1, xscale do
		-- print("i = "..i);
		for j=1, yscale do
			if index > nMax then
				break
			end
			
			if nType ~= -1 then
				index = search(tNpcs,nType,index,nMax);
			end
				
			local nNpcIndex = CreateNpc(tNpcs[index][1],tNpcs[index][1],m, corX, corY);
			tinsert(tNpcIndexs,nNpcIndex);
			
			index = index + 1;
	
			corX = corX + 6;
			if corX >= xEnd then
				corY = corY + 6;
				if toggle == 0 then
					corX = xBegin + 2;
					toggle = 1;
				else
					corX = xBegin;
					toggle = 0;
				end
			end
		end
	end
	
	return tNpcIndexs, index;
end;

function search(tNpcs,nType,nBegin,nEnd)
	local index = 0;
	for i=nBegin,nEnd do
		if tonumber(tNpcs[i][2]) == nType then
			index = i;
			break
		end
	end
	return index;
end;


function getListFromFile()
	-- local nLenRow = TB_NPC:getCol(1);
	-- for i=1,nLenRow do
		-- print(TB_NPC:getCell(1,i));
	-- end
	
	local tData = {}
	
	local nCount = TB_NPC:getRow();
	local k=0;
	for i=9,nCount do
		local szModel = TB_NPC:getCell(i,1);
		local nType = TB_NPC:getCell(i,2);
		
		if szModel ~= "" then
			k = k+1;
			tData[k] = {}
			tinsert(tData[k],szModel);
			tinsert(tData[k],nType);
		end
	end
	
	return tData, k;
end;
