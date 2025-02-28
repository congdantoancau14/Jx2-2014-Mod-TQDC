Include("\\settings\\static_script\\cheat\\list_npcs.lua");
TB_NPC = new(KTabFile,"\\settings\\npcs.txt");
TB_TRAINING_NPC = new(KTabFile,"\\settings\\npc\\npc_replace_name_new.txt");
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

tTrainingNpcs = {}
nTrainingNpcCount = 0;

function main_show_npc()
	init_npclist();
	init_training_npc_list();
	local tSays = {
		"Input npc name/inputNpcName",
		"Show npc list/showNpcList",
		"Show single npc/showSingle",
		"Remove last npc/removeNpc",
		"Show mixed npcs/showMixedNpcs",
		"Show talking npcs/showTalkingNpcs",
		"Show fighting npcs/showFightingNpcs",
		"T�o trang tr�/createDecorators",
		"Create training monsters/createTrainingNpcs",
		"Hi�n th� All npcs t�i Linh B�o S�n/#showAllNpcs(0)",
		"Hi�n th� Talk npcs t�i Linh B�o S�n/#showAllNpcs(1)",
		"Hi�n th� Fight npcs t�i Linh B�o S�n/#showAllNpcs(2)",
		"�i Map r�ng/gotoWideMap",
		"Remove npcs/removen",
	}
	tinsert(tSays, "\nTho�t/nothing");
	Say("",getn(tSays),tSays);
end;


-------------------------------------------------------------------------------
-- 								NPC VIEW
-------------------------------------------------------------------------------

szDisplayName = ""
szModelName = ""

function createTrainingNpcs()
	AskClientForString("_request_training_npc_name_callback","Monster name",1,64,"Nh�p t�n monster");
end;

function _request_training_npc_name_callback(string)
	szDisplayName = string
	if szDisplayName == nil or szDisplayName == "" then 
		return 0;
	end
	szModelName = getModelName(szDisplayName);
	print("\nszDisplayName",szDisplayName);
	print("szModelName",szModelName);
	if szModelName ~= "" then 
		AskClientForNumber("_request_training_npc_number_callback",1,1000,"Nh�p s� l��ng monster");
	end
end;

function _request_training_npc_number_callback(number)
	if number == 0 then 
		return 0;
	end
	for i=1,number do 
		CreateNpc(szModelName,szDisplayName,GetWorldPos())
	end
end;

function getModelName(szDisplayName)
	for i=1,nTrainingNpcCount do 
		if szDisplayName == tTrainingNpcs[i][1] then
			return tTrainingNpcs[i][2];
		end
	end
	return "";
end;

function init_training_npc_list()
	tTrainingNpcs, nTrainingNpcCount = getListTrainingNpcFromFile();
end;

function showAllNpcs(nType, tNpcs)
	if tNpcs == nil then
		tNpcs = tbNpcs;
	end
	
	local MAP = 218;

	local m,x,y = GetWorldPos();
	if m ~= MAP then
		NewWorld(218,1634,3253);
	end
	local xBegin = 1634;
	local xEnd = 1874;
	local yBegin = 3253;
	local yEnd = 3647;
	-- 1874-1634 = 240
	-- 3647-3253 = 394
	-- 340 * 394 = 133960
	
	local corX = xBegin;
	local corY = yBegin;
	local npcid = 1;
	local toggle = 0;
	local xscale = floor((xEnd - xBegin) / 4); -- = 60
	local yscale = floor((yEnd - yBegin) / 6); -- = 65
	for i=1, xscale do
		for j=1, yscale do
			if npcid > getn(tNpcs) then
				return
			end
			if nType == 0 then
				CreateNpc(tNpcs[npcid][1],tNpcs[npcid][1],MAP, corX, corY);
			elseif nType == 1 then
				if tNpcs[npcid][2] == nil then
					CreateNpc(tNpcs[npcid][1],tNpcs[npcid][1],MAP, corX, corY);
				end
			elseif nType == 2 then
				if tNpcs[npcid][2] ~= nil then
					CreateNpc(tNpcs[npcid][1],tNpcs[npcid][1],MAP, corX, corY);
				end
			end
			
			npcid = npcid + 1;
			corX = corX + 4;
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
end;

function createDecorators(page)
	if page == nil then page = 1 end
	tSays = {}
	local LINE = 5;
	local nEndPoint = LINE;
	local nStartPoint = 1;
	local LAST = getn(tDecorators);
	local last_page = floor(LAST/LINE);
	
	if page == 1 then
		nEndPoint = LINE;
	else 
		nStartPoint = (page-1) * LINE + 1
		nEndPoint = page * LINE;
	end
	
	if nEndPoint > LAST then
		nEndPoint = LAST;
	end
	
	for i=nStartPoint, nEndPoint do
		tinsert(tSays, "Create "..tDecorators[i][1]..format("/#createDecorator(%d)",i))
	end
	
	if nEndPoint < LAST then
		tinsert(tSays, format("\nTrang k�/#createDecorators(%d)",page+1));
		tinsert(tSays, format("Trang cu�i/#createDecorators(%d)",last_page));
	end
	if page > 1 then
		if nEndPoint < LAST then
			tinsert(tSays, format("Trang tr��c/#createDecorators(%d)",page-1));
		else
			tinsert(tSays, format("\nTrang tr��c/#createDecorators(%d)",page-1));
		end
		tinsert(tSays, format("Trang ��u/#createDecorators(%d)",1));
	end
	
	tinsert(tSays, "Create a random decorator/#createDecorator(0)");
	
	tinsert(tSays, "\nTho�t/nothing")
	Say(format("---- Danh s�ch nh�n v�t trang tr� ----\nPage %d/%d.",page,last_page),getn(tSays),tSays);
end;


function createDecorator(nId)
	if nId == 0 then
		local nId = random(1,getn(tDecorators));
	end
	CreateNpc(tDecorators[nId][1],tDecorators[nId][1], GetWorldPos());
end;


-------------------------------------------------------------------------------
-- 								SINGLE NPC VIEW
-------------------------------------------------------------------------------
function init_npclist()
	tNpcs, MAX_NPC = getListFromFile();
end;

function showSingle()
	local tSays = {
		"show first npc/#_get_npc_number(1)",
		format("show last npc/#_get_npc_number(%d)",MAX_NPC),
		format("show random npc/#_get_npc_number(%d)",random(MAX_NPC)),
		"input npc index/inputNpcIndex",
		"close/nothing",
	}
	Say("",getn(tSays),tSays);
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
	local tSays = {
		"next npc/#navigatenpc(1)",
		"prev npc/#navigatenpc(-1)",
		format("random npc/#_get_npc_number(%d)",random(MAX_NPC)),
		"\nback page/showSingle",
		"stop here/nothing",
	}
	Say(format("npc %d/%d",CUR_NPC,MAX_NPC),getn(tSays),tSays);
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
	tSays = {}
	if nBegin == nil then nBegin = 1 end
	if nEnd == nil or nEnd <= nBegin then nEnd = nBegin + 39 end
	tinsert(tSays,format("next page/#showNpcList(%d)",nBegin+40));
	tinsert(tSays,format("prev page/#showNpcList(%d)",nBegin-40));
	for i = nBegin, nEnd do 
		tinsert(tSays,format("[%d] %s/#showNpcByIndex(%d)",i,tNpcs[i][1],i));
	end
	tinsert(tSays,format("next page/#showNpcList(%d)",nBegin+40));
	tinsert(tSays,format("prev page/#showNpcList(%d)",nBegin-40));
	tinsert(tSays,"close/nothing");
	Say("",getn(tSays),tSays);
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
function gotoWideMap()
	local tMaps = {
		{"Hoa S�n",{502,1571,2912}},
		{"Luy�n binh tr��ng",{817,1502,2999}},
		{"V� tr��ng li�n ��u",{6028,1620,3184}},
		{"L�m gian tuy�t nguy�n",{8900,1778,3508}},
	}
	local tSays = {}
	for i=1, getn(tMaps) do
		tinsert(tSays,format("%s/#goto(%d,%d,%d)",tMaps[i][1],tMaps[i][2][1],tMaps[i][2][2],tMaps[i][2][3]))
	end
	tinsert(tSays,"\nTho�t/nothing")
	Say("",getn(tSays),tSays)
	--NewWorld(502,1571,2912);
end;

function goto(m,x,y)
	NewWorld(m,x,y)
	main_show_npc()
end;

function showMixedNpcs()
	-- Talk(1,"","This feature is under development. Please contact to the author for more detail.");
	tFiltedNpcs = tNpcs;
	-- nFiltedRows = getn(tNpcs);
	nFiltedRows = MAX_NPC;
	nPages = floor(nFiltedRows/25);
	show_group_main();
end

function showFightingNpcs()
	local tFightNpcs, nFiltedRows = getListSpecific(tNpcs,0);
	nPages = floor(nFiltedRows/25);
	tFiltedNpcs = tFightNpcs;
	show_group_main();
end;

function showTalkingNpcs()
	local tTalkNpcs, nFiltedRows = getListSpecific(tNpcs,6);
	nPages = floor(nFiltedRows/25);
	tFiltedNpcs = tTalkNpcs;
	show_group_main();
end;

function show_group_main()
	
	local tSays = {
		"Show first page/#goPage(1)",
		"Show last page/#goPage(2)",
		"Show random page/#goPage(0)",
		"Show input page/inputPage",
		"Continue where I left on/continue",
	}
	tinsert(tSays, "Close/nothing");
	Say("",getn(tSays),tSays);
end;

function continue()
	if  nCurPage ~= 0 then
		showPage(tFiltedNpcs,nPages,nCurPage);
	else
		Talk(1,"show_group_main","No last page was record");
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
	local tSays = {}
	if nCurPage <= nPages then
		tinsert(tSays,"Show next page/#navigate(1)")
	end
	if nCurPage > 1 then
		tinsert(tSays,"Show prev page/#navigate(-1)")
	end
	if nCurPage ~= nPages+1 then
		tinsert(tSays,"Show last page/#goPage(2)");
	end
	if nCurPage ~= 1 then 
		tinsert(tSays,"Show first page/#goPage(1)");
	end
	tinsert(tSays,"Show random page/#goPage(0)");
	tinsert(tSays,"Go back main/main_show_npc");
	tinsert(tSays, "Stop here/nothing");
	Say(format("Current Page <color=yellow>%d<color>/%d",nCurPage,nPages+1),getn(tSays),tSays);
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
	-- h��ng ngang
	-- for p=-5,5 do
		-- k = k+1;
		-- local nNpcIndex = CreateNpc(tNpcs[k][1],tNpcs[k][1],m,x+p*5,y);
		-- SetNpcDeathScript(nNpcIndex, "\\settings\\static_script\\cheat\\npc.lua");
	-- end
	-- b��n c��
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

function getListTrainingNpcFromFile()
	local tData = {}
	
	local nCount = TB_TRAINING_NPC:getRow();
	local k=0;
	for i=2,nCount do
		local szName = TB_TRAINING_NPC:getCell(i,1);
		local szModel = TB_TRAINING_NPC:getCell(i,2);
		
		if szName ~= "" then
			k = k+1;
			tData[k] = {}
			tinsert(tData[k],szName);
			tinsert(tData[k],szModel);
		end
	end
	
	return tData, k;
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
