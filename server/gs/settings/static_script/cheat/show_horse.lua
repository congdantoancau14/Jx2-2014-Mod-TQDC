
TB_HORSE = new(KTabFile,"\\settings\\item\\horse.txt");
-- GROUPY HORSE VIEW
tHorseIndexs = {}
nLastIndex = 0;
nPages = 0;
nCurPage = 0;
tFiltedHorses = {}
nRecoredHorseID = 0;

tHorses = {}
-- SINGLE HORSE VIEW
MAX_HORSE = 0;
CUR_HORSE = 0;

function main_show_horse()
	tHorses, MAX_HORSE = getListFromFile();
	local tTalkHorses, nFiltedRows = getListSpecific(tHorses,6);
	nPages = floor(nFiltedRows/25);
	tFiltedHorses = tTalkHorses;
	local tSay = {
		"Input horse name/inputHorseName",
		"Show horse list/showHorseList",
		"Show single horse/showSingle",
		"Remove last horse/removeHorse",
		"Show mixed horses/showMixedHorses",
		"Show talking horses/showTalkingHorses",
		"§i Hoa S¬n/goHoaSon",
		"Remove horses/removen",
	}
	tinsert(tSay, "Nothing/nothing");
	Say("",getn(tSay),tSay);
end;

-------------------------------------------------------------------------------
-- 								SINGLE NPC VIEW
-------------------------------------------------------------------------------
function showSingle()
	local tSay = {
		"show first horse/#_get_horse_number(1)",
		format("show last horse/#_get_horse_number(%d)",MAX_HORSE),
		format("show random horse/#_get_horse_number(%d)",random(MAX_HORSE)),
		"input horse index/inputHorseIndex",
		"close/nothing",
	}
	Say("",getn(tSay),tSay);
end;


-- function countRows()

	-- local nLines = TB_HORSE:getRow();
	-- local nRows = 0;
	
	-- for i=9,nLines do
		-- if checkEmptyRow(i) ~= 1 then
			-- nRows = nRows+1;
		-- end
	-- end
	
	-- return nRows;
-- end;

-- function checkEmptyRow(nRowIndex)
	-- local nRowLen = TB_HORSE:getCol(nRowIndex);
	-- local isEmpty = 1;
	-- for i=1,nRowLen do
		-- if TB_HORSE:getCell(1,i) ~= "" then
			-- isEmpty = 0;
			-- break
		-- end
	-- end
	-- return isEmpty;
-- end;

-- function getRowLen()
	-- local nRowLen = TB_HORSE:getCol(1);
	-- for i=1,nRowLen do
		-- print(TB_HORSE:getCell(1,i));
	-- end
-- end;

function inputHorseIndex()
	AskClientForNumber("_get_horse_number",1,MAX_HORSE,"Input horse index");
end;

function _get_horse_number(nHorseIndex)
	showHorseByIndex(nHorseIndex);
end;

function showHorseByIndex(nHorseIndex)
	CUR_HORSE = nHorseIndex;
	local szHorseName = tHorses[nHorseIndex][1];
	removeHorse();
	local m,x,y = GetWorldPos();
	nRecoredHorseID = CreateHorse(szHorseName,szHorseName,m,x-5,y);
	showHorseNavigation();
end;

function showHorseNavigation()
	local tSay = {
		"next horse/#navigatehorse(1)",
		"prev horse/#navigatehorse(-1)",
		format("random horse/#_get_horse_number(%d)",random(MAX_HORSE)),
		"\nback page/showSingle",
		"stop here/nothing",
	}
	Say(format("horse %d/%d",CUR_HORSE,MAX_HORSE),getn(tSay),tSay);
end;

function navigatehorse(nNav)
	if nNav == -1 and CUR_HORSE == 1 then 
		Talk(1,"showHorseNavigation","This is the first horse");
		return
	end
	
	if nNav == 1 and CUR_HORSE == MAX_HORSE then 
		Talk(1,"showHorseNavigation","This is the last horse");
		return
	end
	CUR_HORSE = CUR_HORSE + nNav;
	showHorseByIndex(CUR_HORSE);
end;

function showHorseList(nBegin,nEnd)
	tSay = {}
	if nBegin == nil then nBegin = 1 end
	if nEnd == nil or nEnd <= nBegin then nEnd = nBegin + 39 end
	tinsert(tSay,format("next page/#showHorseList(%d)",nBegin+40));
	tinsert(tSay,format("prev page/#showHorseList(%d)",nBegin-40));
	for i = nBegin, nEnd do 
		tinsert(tSay,format("[*] %s/#showHorseByIndex(%d)",tHorses[i][1],i));
	end
	tinsert(tSay,format("next page/#showHorseList(%d)",nBegin+40));
	tinsert(tSay,format("prev page/#showHorseList(%d)",nBegin-40));
	tinsert(tSay,"close/nothing");
	Say("",getn(tSay),tSay);
end;

function removeHorse()
	SetHorseLifeTime(nRecoredHorseID,0);
end;

function inputHorseName()
	AskClientForString("_request_horse_name_callback","Input horse name",1,64,"Horse name inputer");
end;

function _request_horse_name_callback(szHorseName)
	nRecoredHorseID = CreateHorse(szHorseName,szHorseName,GetWorldPos());
	main_show_horse();
end;
-------------------------------------------------------------------------------
-- 								GROUPY NPC VIEW
-------------------------------------------------------------------------------


function showMixedHorses()
	Talk(1,"","This feature is under development. Please contact to the author for more detail.");
end

function showTalkingHorses()
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
		showPage(tFiltedHorses,nPages,nCurPage);
	else
		Talk(1,"showTalkingHorses","No last page was record");
	end
end;

function goPage(nNav)
	if nNav == 0 then
		local nPage = random(nPages)
		while nPage == nCurPage do
			print("show_horse >> goPage >> get random page");
			nPage = random(nPages)
		end
		showPage(tFiltedHorses,nPages,nPage);
	elseif nNav == 1 then
		showPage(tFiltedHorses,nPages,1);
	elseif nNav == 2 then
		showPage(tFiltedHorses,nPages,nPages+1);
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
	tinsert(tSay,"Go back main/main_show_horse");
	tinsert(tSay, "Stop here/nothing");
	Say(format("Current Page <color=yellow>%d<color>/%d",nCurPage,nPages+1),getn(tSay),tSay);
end;

function inputPage()
	
	-- SetTaskTemp(1,nPages);
	AskClientForNumber("get_number_callback",0,nPages+1,"Input no of page");
end;

function get_number_callback(nNum)

end;


function showPage(tHorses,nPages,nPage)
	nCurPage = nPage;
	tHorseIndexs = showHorses(tHorses,-1,nPage*25-24);
	showNavigation();
end;

function navigate(nNav)
	-- removeHorses(tHorseIndexs);
	-- if nNav == 1 then
		-- tHorseIndexs, nLastIndex = showHorses(tFiltedHorses,-1,nLastIndex-26);
	-- elseif nNav == 2 then
		-- tHorseIndexs, nLastIndex = showHorses(tFiltedHorses,-1,nLastIndex+1);
	-- end
	-- showNavigation();
	showPage(tFiltedHorses,nPages,nCurPage+nNav);
end

function showHorses(tHorses,nType,index)

end;

function getListFromFile()
	-- local nLenRow = TB_HORSE:getCol(1);
	-- for i=1,nLenRow do
		-- print(TB_HORSE:getCell(1,i));
	-- end
	
	local tData = {}
	
	local nCount = TB_HORSE:getRow();
	local k=0;
	for i=9,nCount do
		local szName = TB_HORSE:getCell(i,1);
		local nG = TB_HORSE:getCell(i,2);
		local nD = TB_HORSE:getCell(i,3);
		local nP = TB_HORSE:getCell(i,4);
		
		if szName ~= "" then
			k = k+1;
			tData[k] = {}
			tinsert(tData[k],szName);
			tinsert(tData[k],nG);
			tinsert(tData[k],nD);
			tinsert(tData[k],nP);
		end
	end
	
	return tData, k;
end;
