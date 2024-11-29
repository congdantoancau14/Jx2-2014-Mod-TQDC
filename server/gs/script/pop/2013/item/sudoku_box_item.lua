--ÉñÃØ½õºĞ
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

--°ÑÒ»Ğ©Êı¾İÉÏµÄ¶«Î÷¶ªµ½ÕâÀïÀ´ ·½±ã²âÊÔ
g_tGTaskId = {1331,1345};  --Éæ¼°µ½µÄÈÎÎñid ²é¿´gtask_main
--´æ´¢²»Í¬Íæ¼ÒĞèÒªÊäÈëµÄÊı×Ö
g_tInputInfo = {}
--ÓÃÓÚ½»ÈÎÎñµÄÎïÆ·ÊıÁ¿
g_nTaskItemNum = 1;
--Íê³ÉÊı¶Àºó¸øµÄÎïÆ· µÚ1~g_nTaskItemNum¸öÎªÓÃÓÚ½»ÈÎÎñµÄÎïÆ·
g_tTaskItem = {
	{{2, 111, 7, 1,}, "Th­ ch­a bãc ra"},
}

g_tSudoku = {
	{
		{4, 9, 2,},
		{3, 5, 7,},
		{8, 1, 6,},
	},
	{
		{8, 3, 4,},
		{1, 5, 9,},
		{6, 7, 2,},
	},
	{
		{6, 1, 8,},
		{7, 5, 3,},
		{2, 9, 4,},
	},
	{
		{2, 7, 6,},
		{9, 5, 1,},
		{4, 3, 8,},
	},
}

function OnUse(nItemIdx)
	local nHasTask = 0;
	for i = 1,getn(g_tGTaskId) do
		if 1 == tGtTask:check_cur_task(g_tGTaskId[i])  then
			nHasTask = 1
			break;
		end
	end
	
	if nHasTask ~= 1 then
		--Talk(1, "", "<color=green>ÉñÃØ½õºĞ<color>£ºÄúÃ»ÓĞ½ÓÈ¡µ±Ç°ÈÎÎñ£¡");
		return 0;
	end
	
	
	--ÅĞ¶ÏÊÇ²»ÊÇÒÑ¾­Íê³ÉÁË
	local nHasFinished = 1;
	for i = 1, g_nTaskItemNum do
		if BigGetItemCount(g_tTaskItem[i][1][1], g_tTaskItem[i][1][2], g_tTaskItem[i][1][3]) == 0 then
			nHasFinished = 0;
			break;
		end
	end
	
	if nHasFinished == 1 then
		Talk(1, "", "Ng­¬i ®· nhËn vËt phÈm nhiÖm vô");
		return 0;
	end
	
	if gf_Judge_Room_Weight(getn(g_tTaskItem),10, "") ~= 1 then return 0; end
	
	--ÏÔÊ¾Êı¶À
	local tQuestion, tAnswer = get_sudoku_info();
	--½«´ğ°¸´æÆğÀ´
	g_tInputInfo[GetName()] = tAnswer;
	
	--ÏÔÊ¾
	local szMsg = "<color=green>Hép GÊm ThÇn Bİ: <color>Hµ ®å l¹c th­, danh bÊt h­ truyÒn. (Mçi mét dßng ®Òu thiÕu 1 ch÷ sè; A, B, C sÏ hîp thµnh 3 ch÷ sè, ®ã ch¾c lµ ®iÓm mÊu chèt ®Ó më hép gÊm.#\n";
	for i = 1, getn(tQuestion) do
		szMsg = szMsg .. [[    ]];
		for j = 1, getn(tQuestion[i]) do
			szMsg = szMsg .. tQuestion[i][j] .. [[    ]];
		end
		szMsg = szMsg .. "\n";
	end
	szMsg = szMsg .. "NhËp mËt m· cña hép gÊm: ";
	local tSel = {
		"§ång ı/input_code",
		"§ãng/close_box",
	}
	Say(szMsg, getn(tSel), tSel);
end

function close_box()
	g_tInputInfo[GetName()] = nil;
end

function input_code()
	AskClientForString("input_code_cb","", 3, 6, "NhËp mËt m· cña hép gÊm: ");
end

function input_code_cb(szValue)
	if g_tInputInfo[GetName()] == nil then
		Talk(1, "", "MËt m· nhËp vµo bŞ lçi.");
		return 0;
	end
	
	local tAnswer = g_tInputInfo[GetName()];
	g_tInputInfo[GetName()] = nil;
	
	local nCorrect = 0;
	
	for i = 1, getn(tAnswer) do
		if szValue == tAnswer[i] then
			nCorrect = 1;
			break;
		end
	end
	if nCorrect == 0 then
		Talk(1, "", "MËt m· nhËp vµo bŞ lçi.");
		return 0;
	end
	
	if gf_Judge_Room_Weight(getn(g_tTaskItem),10, "") ~= 1 then return 0; end
	
	if DelItem(2,111,6,1) ~= 1 then return 0; end
	--¿ÉÒÔ¸øÎïÆ·ÁË
	gf_SetLogCaption("Hép GÊm ThÇn Bİ");
	for i = 1, getn(g_tTaskItem) do
		gf_AddItemEx(g_tTaskItem[i][1], g_tTaskItem[i][2]);
	end
	gf_SetLogCaption("");
end

function get_sudoku_info()
	local nRand = random(1, getn(g_tSudoku));
	local tSudoku = g_tSudoku[nRand];
	local tAnswer = {"", "", ""};
	local tQuestion = {};
	local tCode = {"Gi¶", "B", "C",};
	local tChineseNum = {"mét", "hai", "ba", "bèn", "Ngò ", "s¸u", "b¶y", "t¸m", "chİn"};
	local tTChineseNum = {"1", "2", "3", "4", "5", "ê‘", "7", "8", "9"};
	for i = 1, getn(tSudoku) do
		nRand = random(1, getn(tSudoku[i]));
		tQuestion[i] = {};
		for j = 1, getn(tSudoku[i]) do
			if j == nRand then
				tQuestion[i][j] = "<color=yellow>" .. tCode[i] .. "<color>";
				tAnswer[1] = tAnswer[1] .. tostring(tSudoku[i][j]);
				tAnswer[2] = tAnswer[2] .. tChineseNum[tSudoku[i][j]];
				tAnswer[3] = tAnswer[3] .. tTChineseNum[tSudoku[i][j]];
			else
				--tQuestion[i][j] = tSudoku[i][j];
				tQuestion[i][j] = tTChineseNum[tSudoku[i][j]];
			end
		end
	end
	return tQuestion, tAnswer;
end
