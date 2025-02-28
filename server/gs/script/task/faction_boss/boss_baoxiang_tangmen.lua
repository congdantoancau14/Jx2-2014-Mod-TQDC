-- =============================================================
-- FileName : boss_baoxiang_tangmen.lua
-- Desc     : 唐门boss宝箱的脚本，门派boss任务中掉落的宝箱，点取可以获得好多good东西的功能
-- Date     : Dec 19 2006
-- Creator  : Tony(Jizheng)
-- =============================================================
Include("\\script\\lib\\writelog.lua")

TASK_ID_LAST_GET_DATE = 88			-- 上次领取任务的时间，任务变量ID
TASK_ID_HAVE_GOT_TODAY = 89			-- 今天是否已经领取了任务,任务变量ID

tGaojiMiji = {
	[0] = {{"Kim Cang B竧 Nh� Kinh",0,107,166},{"V� Tr莕 B� б Kinh",0,107,168},{"Ti襪 Long T辌h Di謙 Kinh",0,107,167},{"Thi猲 La Li猲 Ch﹗ L鬰",0,107,169},{"Nh� � Kim жnh M藅 T辌h",0,107,170},{"B輈h H秈 Tuy謙  Ph�",0,107,171},{"H鏽 чn Tr蕁 Nh筩 M藅 T辌h",0,107,172},{"Qu� Thi猲 Du Long M藅 T辌h",0,107,173},{"Huy詎 秐h M� Tung M藅 T辌h",0,107,174},{"Qu﹏ T� Ti謙 Phong M藅 T辌h",0,107,175},{"Tr蕁 Qu﹏ Phi Long Thng Ph�",0,107,176},{"Xuy猲 V﹏ L筩 H錸g M藅 T辌h",0,107,177},{"U Minh Phong Ma L鬰",0,107,178},{"Linh C� Huy詎 T� L鬰",0,107,179}},
	[1] = {{"Kim Cang B竧 Nh� Kinh",0,107,166},{"V� Tr莕 B� б Kinh",0,107,168},{"Ti襪 Long T辌h Di謙 Kinh",0,107,167}},
	[2] = {{"Kim Cang B竧 Nh� Kinh",0,107,166}},
	[3] = {{"V� Tr莕 B� б Kinh",0,107,168}},
	[4] = {{"Ti襪 Long T辌h Di謙 Kinh",0,107,167}},
	[5] = {{"Thi猲 La Li猲 Ch﹗ L鬰",0,107,169}},
	[6] = {{"Thi猲 La Li猲 Ch﹗ L鬰",0,107,169}},
	[7] = {{"Nh� � Kim жnh M藅 T辌h",0,107,170},{"B輈h H秈 Tuy謙  Ph�",0,107,171}},
	[8] = {{"Nh� � Kim жnh M藅 T辌h",0,107,170}},
	[9] = {{"B輈h H秈 Tuy謙  Ph�",0,107,171}},
	[10] = {{"H鏽 чn Tr蕁 Nh筩 M藅 T辌h",0,107,172},{"Qu� Thi猲 Du Long M藅 T辌h",0,107,173}},
	[11] = {{"H鏽 чn Tr蕁 Nh筩 M藅 T辌h",0,107,172}},
	[12] = {{"Qu� Thi猲 Du Long M藅 T辌h",0,107,173}},
	[13] = {{"Huy詎 秐h M� Tung M藅 T辌h",0,107,174},{"Qu﹏ T� Ti謙 Phong M藅 T辌h",0,107,175}},
	[14] = {{"Huy詎 秐h M� Tung M藅 T辌h",0,107,174}},
	[15] = {{"Qu﹏ T� Ti謙 Phong M藅 T辌h",0,107,175}},
	[16] = {{"Tr蕁 Qu﹏ Phi Long Thng Ph�",0,107,176},{"Xuy猲 V﹏ L筩 H錸g M藅 T辌h",0,107,177}},
	[17] = {{"Tr蕁 Qu﹏ Phi Long Thng Ph�",0,107,176}},
	[18] = {{"Xuy猲 V﹏ L筩 H錸g M藅 T辌h",0,107,177}},
	[19] = {{"U Minh Phong Ma L鬰",0,107,178},{"Linh C� Huy詎 T� L鬰",0,107,179}},
	[20] = {{"U Minh Phong Ma L鬰",0,107,178}},
	[21] = {{"Linh C� Huy詎 T� L鬰",0,107,179}}
};

-- 初始对话入口
function main()
	local nLastGetTaskDate = GetTask(TASK_ID_LAST_GET_DATE)		-- 上次接任务是什么时候
	local nCurrTime = {date("%y"), date("%m"), date("%d")}
	local nCurDay = tonumber(nCurrTime[1]..nCurrTime[2]..nCurrTime[3])
	
	local nCurNpcIndex = GetTargetNpc()
	local nCurLevel = GetUnitCurStates(nCurNpcIndex, 0)
	if (nCurLevel == 99) then
		return
	end
	AddUnitStates(nCurNpcIndex, 0, 100)		-- 此段防刷
	
	
	if (nLastGetTaskDate < nCurDay) and GetItemCount(2,1,29000) < 1  then	-- 今天还没有领取任务
		Say("B筺 v蒼 ch璦 b竜 danh tham gia cao th� th� th� luy謓, t骾 qu� n祔 kh玭g th� nh薾.", 0)
		AddUnitStates(nCurNpcIndex, 0, -100)		-- 此段防刷
		return
	end
	
	-- 没有入流派就不能开箱子
	local nPlayerRoute = GetPlayerRoute()
	if (nPlayerRoute == 0 or nPlayerRoute == 1 or nPlayerRoute == 5 or nPlayerRoute == 7 or
		nPlayerRoute == 10 or nPlayerRoute == 13 or nPlayerRoute == 16 or nPlayerRoute == 19) then
		Say("B筺 v蒼 ch璦 b竔 s� h鋍 v�, t骾 qu� n祔 kh玭g th� nh薾!", 0)
		AddUnitStates(nCurNpcIndex, 0, -100)		-- 此段防刷
		return
	end
	
	-- 今天已经拣取了一个
	local nCanGotBox = GetTask(TASK_ID_HAVE_GOT_TODAY)
	if (nCanGotBox == 0) and GetItemCount(2,1,29000) < 1 then
		Say("Xin l鏸, h玬 nay b筺  nh薾 qu� r錳 kh玭g th� nh薾 th猰.", 0)
		AddUnitStates(nCurNpcIndex, 0, -100)		-- 此段防刷
		return
	end
	
	local nRand = random(1,1000);
	if nRand <= 20 then
		local nRandIdx = random(1,getn(tGaojiMiji[5]));
		AddItem(tGaojiMiji[5][nRandIdx][2],tGaojiMiji[5][nRandIdx][3],tGaojiMiji[5][nRandIdx][4],1);
		Msg2Player("Thi誹 hi謕 m� b秓 rng nh薾 頲 "..tGaojiMiji[5][nRandIdx][1]);
	else
		local nSel = random(1, 1000)	-- 宝箱出东西的概率
		
		if (nSel <= 478) then			-- 47.8%的概率，得到100w经验
			ModifyExp(1000000)
			Msg2Player("B筺  m� 頲 b秓 rng, nh薾 頲 1000000 甶觤 kinh nghi謒.")
		elseif (nSel <= 956) then		-- 47.8%的概率，得到未开封的76级武器
			get_76_weapon()
			ModifyExp(500000)
		Msg2Player("B筺 m� 頲 b秓 rng, nh薾 頲 m閠 v� kh� c蕄 76 v� 500000 甶觤 kinh nghi謒!")
		elseif (nSel <= 966) then		-- 1%   的概率，得到师门卷本上
			get_faction_misbook(0)
		elseif (nSel <= 971) then		-- 0.5% 的概率，得到师门卷本中
			get_faction_misbook(1)
		elseif (nSel <= 973) then		-- 0.2% 的概率，得到师门卷本下
			get_faction_misbook(2)
		elseif (nSel <= 989) then		-- 1.6% 的概率，得到师门套装二裤子
			get_suit_2_shoe()
			ModifyExp(500000)
			Msg2Player("B筺  m� 頲 b秓 rng, nh薾 頲 trang ph鬰 c馻 s� m玭 v� 500000 甶觤 kinh nghi謒!")
		elseif (nSel <= 992) then		-- 0.3% 的概率，得到师门套装三头
			get_suit_3_head()
			Msg2Player("B筺 m� 頲 b秓 rng, nh薾 頲 trang ph鬰 c馻 s� m玭.")
		elseif (nSel <= 997) then		-- 0.5% 的概率，得到师门套装三首饰
			get_suit_3_deco()
			Msg2Player("B筺 m� 頲 b秓 rng, nh薾 頲 v藅 ph萴 trang s鴆 c馻 s� m玭.")
		elseif (nSel <= 1000) then		-- 0.3% 的概率，得到大匠师手书
			AddItem(2, 0, 397, 1)
			Msg2Player("B筺 m� 頲 b秓 rng, nh薾 頲 1 quy觧 m藅 t辌h.")
		end
	end
	Msg2SubWorld("Ngi ch琲"..GetName().."Цnh b筰 Л阯g H�, nh薾 頲 T骾 t飝 th﹏");
	-- 把自己删除
	local nSelfIndex = GetTargetNpc()
	SetNpcLifeTime(nSelfIndex, 0)
	SetTask(TASK_ID_HAVE_GOT_TODAY, 0)
	WriteLogEx("Boss su mon","nh苩 t骾 Л阯g M玭")
end;

-- 得到师门套装三头
function get_suit_3_head()
	local nBodyType = GetBody()
	local nItemDetail = 0
	-- 标准男 - 1
	-- 魁梧男 - 2
	-- 性感女 - 3
	-- 娇小女 - 4

	local nSel = random(1, 100)
	
	if (nSel <= 4) then			-- 少林俗家
		if (nBodyType <= 2) then
			nItemDetail = 220 + nBodyType
		else
			nItemDetail = 220 + random(1, 2)
		end
	elseif (nSel <= 8) then		-- 少林武僧
		if (nBodyType <= 2) then
			nItemDetail = 320 + nBodyType
		else
			nItemDetail = 320 + random(1, 2)
		end
	elseif (nSel <= 12) then		-- 少林禅僧
		if (nBodyType <= 2) then
			nItemDetail = 420 + nBodyType
		else
			nItemDetail = 420 + random(1, 2)
		end
	elseif (nSel <= 60) then		-- 唐门自己的概率比较高		
		nItemDetail = 620 + nBodyType
	elseif (nSel <= 64) then		-- 峨嵋佛家
		if (nBodyType > 2) then
			nItemDetail = 820 + (nBodyType - 2)
		else
			nItemDetail = 820 + random(1, 2)
		end
	elseif (nSel <= 68) then		-- 峨嵋俗家
		if (nBodyType > 2) then
			nItemDetail = 920 + (nBodyType - 2)
		else
			nItemDetail = 920 + random(1, 2)
		end
	elseif (nSel <= 72) then		-- 丐帮净衣
		nItemDetail = 1120 + nBodyType
	elseif (nSel <= 76) then		-- 丐帮污衣
		nItemDetail = 1220 + nBodyType
	elseif (nSel <= 80) then		-- 武当道家
		nItemDetail = 1420 + nBodyType
	elseif (nSel <= 84) then		-- 武当俗家
		nItemDetail = 1520 + nBodyType
	elseif (nSel <= 86) then		-- 杨门枪骑
		nItemDetail = 1720 + nBodyType
	elseif (nSel <= 92) then		-- 杨门弓骑
		nItemDetail = 1820 + nBodyType
	elseif (nSel <= 96) then		-- 五毒蛊师
		nItemDetail = 2020 + nBodyType
	elseif (nSel <= 100) then		-- 五毒邪侠
		nItemDetail = 2120 + nBodyType
	end
	
	AddItem(0, 103, nItemDetail, 1, 1, -1, -1, -1, -1, -1, -1)
	WriteLogEx("Boss su mon","m� m玭 ph竔",1,"","G:0,D:103,P:"..nItemDetail)
end;

-- 得到师门套装三首饰
function get_suit_3_deco()
	local nBodyType = GetBody()
	local nItemDetail = 0
	-- 标准男 - 1
	-- 魁梧男 - 2
	-- 性感女 - 3
	-- 娇小女 - 4

	local nSel = random(1, 100)
	
	if (nSel <= 4) then			-- 少林俗家
		if (nBodyType <= 2) then
			nItemDetail = 220 + nBodyType
		else
			nItemDetail = 220 + random(1, 2)
		end
	elseif (nSel <= 8) then		-- 少林武僧
		if (nBodyType <= 2) then
			nItemDetail = 320 + nBodyType
		else
			nItemDetail = 320 + random(1, 2)
		end
	elseif (nSel <= 12) then		-- 少林禅僧
		if (nBodyType <= 2) then
			nItemDetail = 420 + nBodyType
		else
			nItemDetail = 420 + random(1, 2)
		end
	elseif (nSel <= 60) then		-- 唐门自己的概率比较高		
		nItemDetail = 620 + nBodyType
	elseif (nSel <= 64) then		-- 峨嵋佛家
		if (nBodyType > 2) then
			nItemDetail = 820 + (nBodyType - 2)
		else
			nItemDetail = 820 + random(1, 2)
		end
	elseif (nSel <= 68) then		-- 峨嵋俗家
		if (nBodyType > 2) then
			nItemDetail = 920 + (nBodyType - 2)
		else
			nItemDetail = 920 + random(1, 2)
		end
	elseif (nSel <= 72) then		-- 丐帮净衣
		nItemDetail = 1120 + nBodyType
	elseif (nSel <= 76) then		-- 丐帮污衣
		nItemDetail = 1220 + nBodyType
	elseif (nSel <= 80) then		-- 武当道家
		nItemDetail = 1420 + nBodyType
	elseif (nSel <= 84) then		-- 武当俗家
		nItemDetail = 1520 + nBodyType
	elseif (nSel <= 86) then		-- 杨门枪骑
		nItemDetail = 1720 + nBodyType
	elseif (nSel <= 92) then		-- 杨门弓骑
		nItemDetail = 1820 + nBodyType
	elseif (nSel <= 96) then		-- 五毒蛊师
		nItemDetail = 2020 + nBodyType
	elseif (nSel <= 100) then		-- 五毒邪侠
		nItemDetail = 2120 + nBodyType
	end
	
	AddItem(0, 102, nItemDetail, 1, 1, -1, -1, -1, -1, -1, -1)
	WriteLogEx("Boss su mon","trang s鴆 m玭 ph竔",1,"","G:0,D:102,P:"..nItemDetail)
end;

-- 得到师门套装二裤子
function get_suit_2_shoe()
	local nBodyType = GetBody()
	local nItemDetail = 0
	-- 标准男 - 1
	-- 魁梧男 - 2
	-- 性感女 - 3
	-- 娇小女 - 4

	local nSel = random(1, 100)
	
	if (nSel <= 4) then			-- 少林俗家
		if (nBodyType <= 2) then
			nItemDetail = 210 + nBodyType
		else
			nItemDetail = 210 + random(1, 2)
		end
	elseif (nSel <= 8) then		-- 少林武僧
		if (nBodyType <= 2) then
			nItemDetail = 310 + nBodyType
		else
			nItemDetail = 310 + random(1, 2)
		end
	elseif (nSel <= 12) then		-- 少林禅僧
		if (nBodyType <= 2) then
			nItemDetail = 410 + nBodyType
		else
			nItemDetail = 410 + random(1, 2)
		end
	elseif (nSel <= 60) then		-- 唐门自己的概率比较高		
		nItemDetail = 610 + nBodyType
	elseif (nSel <= 64) then		-- 峨嵋佛家
		if (nBodyType > 2) then
			nItemDetail = 810 + (nBodyType - 2)
		else
			nItemDetail = 810 + random(1, 2)
		end
	elseif (nSel <= 68) then		-- 峨嵋俗家
		if (nBodyType > 2) then
			nItemDetail = 910 + (nBodyType - 2)
		else
			nItemDetail = 910 + random(1, 2)
		end
	elseif (nSel <= 72) then		-- 丐帮净衣
		nItemDetail = 1110 + nBodyType
	elseif (nSel <= 76) then		-- 丐帮污衣
		nItemDetail = 1210 + nBodyType
	elseif (nSel <= 80) then		-- 武当道家
		nItemDetail = 1410 + nBodyType
	elseif (nSel <= 84) then		-- 武当俗家
		nItemDetail = 1510 + nBodyType
	elseif (nSel <= 86) then		-- 杨门枪骑
		nItemDetail = 1710 + nBodyType
	elseif (nSel <= 92) then		-- 杨门弓骑
		nItemDetail = 1810 + nBodyType
	elseif (nSel <= 96) then		-- 五毒蛊师
		nItemDetail = 2010 + nBodyType
	elseif (nSel <= 100) then		-- 五毒邪侠
		nItemDetail = 2110 + nBodyType
	end
	
	AddItem(0, 101, nItemDetail, 1, 1, -1, -1, -1, -1, -1, -1)
	WriteLogEx("Boss su mon","h� y m玭 ph竔",1,"","G:0,D:101,P:"..nItemDetail)
end;

-- 根据开箱子的人的流派，获得76级未开封的武器
function get_76_weapon()
	local nPlayerRoute = GetPlayerRoute()

	if (nPlayerRoute == 2) then				-- 少林俗家
		if (random(1, 2) == 1) then
			AddItem(2, 1, 377, 1)
		else
			AddItem(2, 1, 379, 1)
		end
	elseif (nPlayerRoute == 3) then			-- 少林禅宗
		AddItem(2, 1, 382, 1)
	elseif (nPlayerRoute == 4) then			-- 少林武宗
		AddItem(2, 1, 375, 1)
	elseif (nPlayerRoute == 6) then			-- 唐门
		AddItem(2, 1, 378, 1)
	elseif (nPlayerRoute == 8) then			-- 峨嵋佛家
		AddItem(2, 1, 376, 1)
	elseif (nPlayerRoute == 9) then			-- 峨嵋俗家
		AddItem(2, 1, 380, 1)
	elseif (nPlayerRoute == 11) then		-- 丐帮净衣
		AddItem(2, 1, 375, 1)
	elseif (nPlayerRoute == 12) then		-- 丐帮污衣
		AddItem(2, 1, 377, 1)
	elseif (nPlayerRoute == 14) then		-- 武当道家
		AddItem(2, 1, 376, 1)
	elseif (nPlayerRoute == 15) then		-- 武当俗家
		AddItem(2, 1, 381, 1)
	elseif (nPlayerRoute == 17) then		-- 杨门枪骑
		AddItem(2, 1, 383, 1)
	elseif (nPlayerRoute == 18) then		-- 杨门弓骑
		AddItem(2, 1, 384, 1)
	elseif (nPlayerRoute == 20) then		-- 五毒邪侠
		AddItem(2, 1, 386, 1)
	elseif (nPlayerRoute == 21) then		-- 五毒蛊师
		AddItem(2, 1, 385, 1)
	end
	WriteLogEx("Boss su mon","v� kh� ch璦 gi竚 nh",1)
end;

-- 获得师门秘籍卷本一个，nType = 0/1/2 表示 上卷/中卷/下卷
function get_faction_misbook(nType)
	local strTab = {"[thng]", "[trung]", "[h筣"}
	
	local nBookType = tonumber(nType)
	local nBase = 0
	local nSel = random(1, 100)
	
	if (nSel <= 4) then			-- 少林俗家
		nBase = 916
		Msg2Player("B筺 m� b秓 rng, nh薾 頲 m閠 ph莕 c馻 quy觧 m藅 t辌h Thi誹 L﹎ T鬰 gia."..strTab[nBookType + 1])
	elseif (nSel <= 8) then		-- 少林武僧
		nBase = 919
		Msg2Player("B筺 m� b秓 rng, nh薾 頲 m閠 ph莕 c馻 quy觧 m藅 t辌h Thi誹 L﹎ V� t╪g"..strTab[nBookType + 1])
	elseif (nSel <= 12) then		-- 少林禅僧
		nBase = 922
		Msg2Player("B筺 m� b秓 rng, nh薾 頲 m閠 ph莕 c馻 quy觧 m藅 t辌h Thi誹 L﹎ Thi襫 t╪g"..strTab[nBookType + 1])
	elseif (nSel <= 60) then		-- 唐门自己的概率比较高			
		nBase = 925
		Msg2Player("B筺 m� b秓 rng, nh薾 頲 m閠 ph莕 c馻 quy觧 m藅 t辌h Л阯g M玭"..strTab[nBookType + 1])
	elseif (nSel <= 64) then		-- 峨嵋佛家
		nBase = 928
		Msg2Player("B筺 m� b秓 rng, nh薾 頲 m閠 ph莕 c馻 quy觧 m藅 t辌h Nga My Ph藅 gia"..strTab[nBookType + 1])
	elseif (nSel <= 68) then		-- 峨嵋俗家
		nBase = 931
		Msg2Player("B筺 m� b秓 rng, nh薾 頲 m閠 ph莕 c馻 quy觧 m藅 t辌h Nga My T鬰 gia"..strTab[nBookType + 1])
	elseif (nSel <= 72) then		-- 丐帮净衣
		nBase = 934
		Msg2Player("B筺 m� b秓 rng, nh薾 頲 m閠 ph莕 c馻 quy觧 m藅 t辌h C竔 Bang T躰h y"..strTab[nBookType + 1])
	elseif (nSel <= 76) then		-- 丐帮污衣
		nBase = 937
		Msg2Player("B筺 m� b秓 rng, nh薾 頲 m閠 ph莕 c馻 quy觧 m藅 t辌h C竔 Bang � y"..strTab[nBookType + 1])
	elseif (nSel <= 80) then		-- 武当道家
		nBase = 940
		Msg2Player("B筺 m� b秓 rng, nh薾 頲 m閠 ph莕 c馻 quy觧 m藅 t辌h V� ng Чo gia"..strTab[nBookType + 1])
	elseif (nSel <= 84) then		-- 武当俗家
		nBase = 943
		Msg2Player("B筺 m� b秓 rng, nh薾 頲 m閠 ph莕 c馻 quy觧 m藅 t辌h V� ng T鬰 gia"..strTab[nBookType + 1])
	elseif (nSel <= 86) then		-- 杨门枪骑
		nBase = 946
		Msg2Player("B筺 m� b秓 rng, nh薾 頲 m閠 ph莕 c馻 quy觧 m藅 t辌h Dng M玭 Thng k�"..strTab[nBookType + 1])
	elseif (nSel <= 92) then		-- 杨门弓骑
		nBase = 949
		Msg2Player("B筺 m� b秓 rng, nh薾 頲 m閠 ph莕 c馻 quy觧 m藅 t辌h Dng M玭 Cung k�"..strTab[nBookType + 1])
	elseif (nSel <= 96) then		-- 五毒蛊师
		nBase = 952
		Msg2Player("B筺 m� b秓 rng, nh薾 頲 m閠 ph莕 c馻 quy觧 m藅 t辌h Ng� чc C� s�"..strTab[nBookType + 1])
	elseif (nSel <= 100) then		-- 五毒邪侠
		nBase = 955
		Msg2Player("B筺 m� b秓 rng, nh薾 頲 m閠 ph莕 c馻 quy觧 m藅 t辌h Ng� чc T� hi謕"..strTab[nBookType + 1])
	end
	
	AddItem(2, 1, nBase + nBookType, 1)
	WriteLogEx("Boss su mon","m藅 t辌h tr蕁 ph竔",1,"","G:2,D:1,P:"..(nBase + nBookType))
end;

