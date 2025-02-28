Include("\\script\\class\\ktabfile.lua");
Include("\\script\\online\\abluemoon\\abluemoon_head.lua")
Include("\\script\\online\\abluemoon\\abluemoon_question_head.lua")
Include("\\script\\中原二区\\成都\\npc\\镖师.lua")
gather_exp = new(KTabFile, "\\settings\\skill\\skills_gather_exp.txt");
compose_exp = new(KTabFile, "\\settings\\skill\\skills_compose_exp.txt");
tExp = new(KTabFile, "\\settings\\uplevel.txt");

THIS_FILE = "\\script\\online\\abluemoon\\abluemoon_npc.lua"
NPC_NAME = "<color=green>Th� Ti觰 Nha<color>: ";

function main()
	local tSay = {
		"Ta s� ch綾!/abluemoon_go",
		"Ta mu鑞 xem th祅h t輈h/abluemoon_jifen",
		"Ta mu鑞 xem h筺h v薾 h玬 nay/abluemoon_luck",
		"Ta mu鑞 nh薾 ph莕 thng l莕 trc/CheckHappyTimes",
		"Ta mu鑞 xem th� h筺g hi謓 t筰/abluemoon_paihang",
		"Ta mu鑞 l穘h ngo筰 trang/abluemoon_cloth",
		"N鉯 r� cho ta ch髏 quy t綾 頲 kh玭g?/abluemoon_rule",
		"Th玦 b� 甶! H玬 nay ta kh玭g 頲 kh醗/end_say"
	}
	local szSay = NPC_NAME.."Hoan ngh猲h b籲g h鱱 n v韎 cu閏 thi l莕 th� nh蕋 m颽 m閠 c馻 JianXia2. C竎 h� c� d竚 th� kh玭g?";
	Say(szSay,getn(tSay),tSay);
	
end

function abluemoon_go()
	if GetLevel() < 50 then
		Say(NPC_NAME.."Ъng c蕄 qu� th蕄. E r籲g c竎 h� kh玭g th� qua v遪g g鰅 xe. Xin h穣 v� t藀 luy謓 th猰!",0)
		return
	end
	local nDay = tonumber(date("%y%m%d"))
	if GetTask(ABLUEMOON_ANSWER_STAGE) ~= 0 then
		Say(NPC_NAME.."H譶h nh� ngi qu猲 l穘h thng,mau l穘h 甶 kh玭g l筰 thi謙 m蕋 th� kh�!",0)
		return
	end
	if GetTask(ABLUEMOON_QUEST_DATE_PAY) == nDay --?????????????
		and GetTask(ABLUEMOON_QUEST_COUNT) < GetTask(ABLUEMOON_QUEST_COUNT_MAX) --???????????
		and GetTask(ABLUEMOON_QUEST_ROUND) == 1 then  --?????????????
		Say(NPC_NAME.."Thi vi謓 l莕 trc th蕋 b筰,c� mu鑞 ti誴 t鬰 kh玭g?",2,
				"\n Ta mu鑞 ti誴 t鬰/#abluemoon_continue(1)",
				"\n в ta ngh� /end_say"
		)
	elseif GetTask(ABLUEMOON_QUEST_DATE_PAY) == nDay 
		and GetTask(ABLUEMOON_QUEST_COUNT) < GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st) --??????????????????
		and GetTask(ABLUEMOON_QUEST_ROUND) == 2 then  --?????????????
		Say(NPC_NAME.."Thi hng l莕 trc th蕋 b筰,c� mu鑞 ti誴 t鬰 kh玭g?",2,
				"\n Ta mu鑞 ti誴 t鬰/#abluemoon_continue(2)",
				"\n в ta ngh� /end_say"
		)
	elseif GetMissionV(MV_TIMER_IDEL) == 1 then
		local rest = floor((TIMER_TOTAL_TIME - GetMissionV(MV_TIMER_TIME))/60)
		Say(NPC_NAME.."C遪 <color=yellow>"..rest.."<color> ph髏 l� ta i trng thi,hi謓 t筰 d鮪g ti誴 nh薾 b竜 danh r錳!",0)
		return
	else
		local nluck = GetTask(ABLUEMOON_LUCK)
		local szluck = "Ch璦 bi誸, c遪 nguy h琻 c� qu� Чi Hung"  --???? ????
		local nDay = tonumber(date("%y%m%d"))
		if GetTask(ABLUEMOON_LUCK_DATE) == nDay then  --????? ??????
			szluck = tluck[nluck]  
		end
		Say(NPC_NAME.."???????<color=yellow>??<color>??????,??????????????????,???????????????:<color=yellow>"..szluck.."<color>",3,
				"\n ??,?????????/abluemoon_luck",
				"\n ????????/abluemoon_gogo_select",
				"\n ??,??????/end_say"
		)
	end
end

function abluemoon_continue(nRound)
	AddMSPlayer(MISSION_ID,1)  --?????MISSION
	if nRound == 1 then
		abluemoon_1st()
	else
		abluemoon_2nd_go(2)
	end
end

function abluemoon_gogo_select()
	local nDay = tonumber(date("%y%m%d"))
	if GetTask(ABLUEMOON_QUEST_DATE) == -1 and GetTask(ABLUEMOON_QUEST_DATE_PAY) == -1 then  --????????????
			Say(NPC_NAME.."????<color=yellow>??<color>???????,????????????,??????????",
					3,
					"??????????/#abluemoon_gogo(-1,1)",
					"???????????/#abluemoon_gogo(-1,2)",
					"??????/end_say"
			)		
	else
		Say(NPC_NAME.."?????????,???<color=yellow>????<color>:??????,????,????1???????<color=yellow>?????<color>:???????,???????????????",
				3,
				"????????/#abluemoon_gogo_check(1)",
				"?????????/#abluemoon_gogo_check(2)",
				"??????/end_say"
		)
	end
end

function abluemoon_gogo_check(nType)
	local nDay = tonumber(date("%y%m%d"))
	local nNeedItemAll = {1,2,3,5,5,10,10}  --????????
	local nNeedItemCount = 20;
	if nType == 1 then  --???????
		if GetTask(ABLUEMOON_QUEST_DATE) < nDay then  --??????????????
			Say(NPC_NAME.."????????<color=yellow>????<color>???,??????????",
					2,
					"????????/#abluemoon_gogo(0,1)",
					"??????/end_say"
			)	
		else
			Say(NPC_NAME.."?????????????,????????????!",0)
		end
	else                --????????
		if GetTask(ABLUEMOON_QUEST_DATE_PAY) < nDay then  --??????????????
			SetTask(ABLUEMOON_TIMES_DAILY,1)
		end
		local nTimes = GetTask(ABLUEMOON_TIMES_DAILY) --??????
		if nTimes < 8 and nNeedItemCount ~= 0 then
			nNeedItemCount = nNeedItemAll[nTimes]
		end
		if GetItemCount(2,1,1090) >= nNeedItemCount then
			Say(NPC_NAME.."??????<color=yellow>"..nTimes.."<color>????????,????<color=yellow>"..nNeedItemCount.."<color>?<color=yellow>???<color>?????????",
					2,
					"??????/#abluemoon_gogo("..nNeedItemCount..",2)",
					"??????/end_say"
			)
		else
			Say(NPC_NAME.."??????<color=yellow>"..nTimes.."<color>????????,????<color=yellow>"..nNeedItemCount.."<color>?<color=yellow>???<color>???????????????,??????!",0)
		end
	end
end

function abluemoon_gogo(nNeedItemCount,nType)
	local nDay = tonumber(date("%y%m%d"))
	if GetTask(ABLUEMOON_LUCK_DATE) < nDay then  --?????,?????
		SetTask(ABLUEMOON_LUCK,0)
	end
	if nNeedItemCount == 0 or nNeedItemCount == -1 or DelItem(2,1,1090,nNeedItemCount) == 1 then
		if GetTask(ABLUEMOON_QUEST_DATE) < nDay and GetTask(ABLUEMOON_QUEST_DATE_PAY) < nDay and nNeedItemCount ~= -1 and GetTask(ABLUEMOON_AWARD_TYPE) == 1 then  --?????????????????????
			local nJifen = floor(GetTask(ABLUEMOON_JIFEN)/6)  --?????
			if nJifen > 80 then nJifen = 80 end               --????80?
			SetTask(ABLUEMOON_JIFEN,(GetTask(ABLUEMOON_JIFEN)-nJifen))
			Talk(1,"","???????????????????????,??????<color=yellow>"..nJifen.."<color>?!")
			Msg2Player("???????????????????????,??????"..nJifen.."?!")
		end
		if nNeedItemCount > 0 then  --??????????????
			SetTask(ABLUEMOON_TIMES_DAILY,GetTask(ABLUEMOON_TIMES_DAILY)+1)
		end
		if nType == 1 then  --???????
			SetTask(ABLUEMOON_QUEST_DATE, nDay)
			SetTask(ABLUEMOON_AWARD_TYPE,1)  --??????1
		else
			if nNeedItemCount > 0 then --???????
				SetTask(ABLUEMOON_QUEST_DATE_PAY, nDay)
			elseif nNeedItemCount == -1 then --?????
				SetTask(ABLUEMOON_QUEST_DATE_PAY, 0)
			end
			SetTask(ABLUEMOON_AWARD_TYPE,2)  --??????2
			SetMissionV(MV_COUNT_PAY,GetMissionV(MV_COUNT_PAY)+1)  --??????????????
			SetMissionV(MV_COUNT_LUOBO,GetMissionV(MV_COUNT_LUOBO)+nNeedItemCount)
			--WriteLog("[????]?? "..GetName().." ????????,????"..nNeedItemCount.."?!")
		end
		SetTask(ABLUEMOON_QUEST_COUNT, 0)
		SetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st, 0)
		SetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd, 0)
		SetTask(ABLUEMOON_CAIQUAN_COUNT, 0)
		SetTask(ABLUEMOON_QUEST_COUNT_MAX, 0)
		AddMSPlayer(MISSION_ID,1)  --?????MISSION
		ApplyRelayShareData("abluemoon_count", nDay, 0, THIS_FILE, "abluemoon_gogogo")
	else
		Say(NPC_NAME.."??????????????!",0)
	end
end

function abluemoon_gogogo(szKey, nKey1, nKey2, nCount)
	local nDay = tonumber(date("%y%m%d"))
	if nCount == 0 then  --????????
		DelRelayShareDataCopy(szKey,nKey1,nKey2)
		AddRelayShareData("abluemoon_count", nDay, 0, THIS_FILE, "end_say", 0,"count", "d", 0)
		ApplyRelayShareData("abluemoon_count", nDay, 0, THIS_FILE, "abluemoon_gogogo")
		return
	end
	local count = GetRelayShareDataByKey(szKey, nKey1, nKey2,"count")
	count = count + 1
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	AddRelayShareData("abluemoon_count", nDay, 0, THIS_FILE, "end_say", 0,"count", "d", count)
	if count == 1 or mod(count,100) == 0 then  --??~
		SetTask(ABLUEMOON_QUEST_DATE, -1)
		SetTask(ABLUEMOON_QUEST_DATE_PAY, -1)
		Msg2Player("??????????????!????????!")
	end
	Say(NPC_NAME.."?????<color=yellow>"..count.."<color>??????????,??10?,???????????????,?????????????????!",2,
		"\n ????/WantCaiquan",                               --??
		"\n ????????/end_say"
	)	
end

function abluemoon_jifen()
	local jifen = GetTask(ABLUEMOON_JIFEN)
	local nTitleLevel = jifen2level(jifen)
	Say(NPC_NAME.."???????:<color=yellow>"..jifen.."<color>??",0)
	for i = 1,getn(tTitle) do --???????
		RemoveTitle(50,i)
	end
	if AddTitle(tTitle[nTitleLevel][1],tTitle[nTitleLevel][2]) == 1 then
		SetCurTitle(tTitle[nTitleLevel][1],tTitle[nTitleLevel][2]);
		Msg2Player("???�"..tTitle[nTitleLevel][3].."�???");
	end;
end

--====================================================???????=========================================================
partner_caimei  = {"????","????","???"}
function WantCaiquan()
	if GetTask(ABLUEMOON_CAIQUAN_COUNT) < 10 then 
		Say(NPC_NAME.." ???,?????????<color=yellow>"..(10-GetTask(ABLUEMOON_CAIQUAN_COUNT)).."<color>??????,?????",4,
				"\n ????\n /Caiquan_shitou",
				"\n ????\n /Caiquan_jianzi",
				"\n ???\n /Caiquan_bu",
				"\n ???????\n /Caiquan_info"
		)
	else
		Say(NPC_NAME.."????10??,??????<color=yellow>"..GetTask(ABLUEMOON_QUEST_COUNT_MAX).."<color>??????,???!",1,
				"???????/abluemoon_1st"
				)
	end
end

function Caiquan_shitou()
	SetTask(ABLUEMOON_CAIQUAN_COUNT,GetTask(ABLUEMOON_CAIQUAN_COUNT)+1)
	local i = 1;
	if random(100) > 50 then
		i = 3;
	end
	local win = random(7)
	if GetTask(ABLUEMOON_LUCK) >= win then i = 2 end
	if i ~= 2 then	
		Say(NPC_NAME.."??<color=yellow>"..partner_caimei[i].."<color>,??!???,??!",1,
				"?????,??!/WantCaiquan")
	else
		SetTask(ABLUEMOON_QUEST_COUNT_MAX,GetTask(ABLUEMOON_QUEST_COUNT_MAX)+1)
		Say(NPC_NAME.."??<color=yellow>"..partner_caimei[i].."<color>,??!????,??<color=yellow>??<color>???????????????",1,
				"???,????/WantCaiquan")
	end
end

function Caiquan_jianzi()
	SetTask(ABLUEMOON_CAIQUAN_COUNT,GetTask(ABLUEMOON_CAIQUAN_COUNT)+1)
	local i = random(1,2)
	local win = random(7)
	if GetTask(ABLUEMOON_LUCK) >= win then i = 3 end
	if i ~= 3 then
		Say(NPC_NAME.."??<color=yellow>"..partner_caimei[i].."<color>,??!???,??!",1,
				"?????,??!/WantCaiquan")
	else
		SetTask(ABLUEMOON_QUEST_COUNT_MAX,GetTask(ABLUEMOON_QUEST_COUNT_MAX)+1)
		Say(NPC_NAME.."??<color=yellow>"..partner_caimei[i].."<color>,??!????,??<color=yellow>??<color>???????????????",1,
				"???,????/WantCaiquan")
	end
end

function Caiquan_bu()
	SetTask(ABLUEMOON_CAIQUAN_COUNT,GetTask(ABLUEMOON_CAIQUAN_COUNT)+1)
	local i = random(2,3)
	local win = random(7)
	if GetTask(ABLUEMOON_LUCK) >= win then i = 1 end
	if i ~= 1 then
		Say(NPC_NAME.."??<color=yellow>"..partner_caimei[i].."<color>,??!???,??!",1,
				"?????,??!/WantCaiquan")
	else
		SetTask(ABLUEMOON_QUEST_COUNT_MAX,GetTask(ABLUEMOON_QUEST_COUNT_MAX)+1)
		Say(NPC_NAME.."??<color=yellow>"..partner_caimei[i].."<color>,??!????,??<color=yellow>??<color>???????????????",1,
				"???,????/WantCaiquan")
	end
end

function Caiquan_info()
	Say(NPC_NAME.."??????:??????????????,?????????,????????,????????????????????,?????????,???????????????,?????????",1,"?????????/WantCaiquan")
end
--=====================================================???????===============================================================

--=====================================================???????===============================================================
function abluemoon_1st()	
	local right_count_1st = GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st);
	SetTask(ABLUEMOON_QUEST_ROUND,1)
	if GetTask(ABLUEMOON_QUEST_COUNT_MAX) > GetTask(ABLUEMOON_QUEST_COUNT) then
		SetTask(ABLUEMOON_STATE,1) --????
		SetTask(ABLUEMOON_TIMER,GetGameTime()) --?????????
		show_question(1, "???<color=yellow>??<color>??<color=yellow>"..(GetTask(ABLUEMOON_QUEST_COUNT)+1).."<color>?????,???:<enter>" )
	elseif GetTask(ABLUEMOON_QUEST_COUNT_MAX) == GetTask(ABLUEMOON_QUEST_COUNT) then  --????????
--		if GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st) == GetTask(ABLUEMOON_QUEST_COUNT_MAX) then  --????
		if right_count_1st >= 5  then  --????5???
			Say(NPC_NAME.."??<color=yellow>??<color>????????,??????<color=yellow>"..right_count_1st.."<color>??,???<color=yellow>"..floor((right_count_1st/GetTask(ABLUEMOON_QUEST_COUNT)*100)).."%<color>??????<color=yellow>????<color>,?????????????<color=yellow>??<color>???<color=yellow>"..right_count_1st.."<color>?????,??!",2,
					"\n ?????????/#GetHappyTimes(1,1)",
					"\n ??????/abluemoon_2nd"
					)

		elseif right_count_1st == 0 then  --??
			DelMSPlayer(MISSION_ID,1)  --????MISSION???
			Say(NPC_NAME.."????,????????,???????!",0)
		else
			Say(NPC_NAME.."??<color=yellow>??<color>????????,??????<color=yellow>"..right_count_1st.."<color>??,???<color=yellow>"..floor((right_count_1st/GetTask(ABLUEMOON_QUEST_COUNT)*100)).."%<color>???????<color=yellow>5<color>???,???????,????!",1,
						"\n ?????????/#GetHappyTimes(1,1)")
		end
	end
end
--=====================================================???????=====================================================

--=====================================================???????=====================================================
function abluemoon_2nd()
	SetTask(ABLUEMOON_QUEST_COUNT, 0)
	SetTask(ABLUEMOON_QUEST_ROUND, 2)
--	Say(NPC_NAME.."?????,????????!????????,???????",4,
--			"\n ????/#abluemoon_2nd_go(2)",
--			"\n ????/#abluemoon_2nd_go(3)",
--			"\n ????/#abluemoon_2nd_go(4)",
--			"\n ????/#abluemoon_2nd_go(5)"
--		)
	Say(NPC_NAME.."?????,?????<color=yellow>??<color>!????????,???????",4,
			"\n ?/#abluemoon_2nd_go(2)",
			"\n ?/#abluemoon_2nd_go(3)",
			"\n ?/#abluemoon_2nd_go(4)",
			"\n ?/#abluemoon_2nd_go(5)"
		)
end

function abluemoon_2nd_go(choice)
	SetTask(ABLUEMOON_STATE,1) --????
	SetTask(ABLUEMOON_TIMER,GetGameTime()) --?????????
	local num = choice;
	if num < 2 or num > 5 then --??????????
		num = random(2,5)
	end
	show_question(num, "???<color=yellow>??<color>??<color=yellow>"..(GetTask(ABLUEMOON_QUEST_COUNT)+1).."<color>?????,???:<enter>" )		
end
--==================================================???????====================================================

--=================================================????????===================================================
function SpecialQues(choice)
	local nchoice = choice
	local options = {}
	--randomseed(GetTime())
	local num = random(1,8)  --??????????????????
	if num == 1 and GetGlbValue(151) == 0 then num = random(2,8) end
	if num == 1 then  --1.?????
		Say(NPC_NAME.."?!????????????,?????????,???????????????",6,
					"??/#SpecialAnswer(1,1,"..nchoice..")",
					"??/#SpecialAnswer(1,2,"..nchoice..")",
					"??????/#SpecialAnswer(1,3,"..nchoice..")",
					"??????/#SpecialAnswer(1,4,"..nchoice..")",
					"????/#SpecialAnswer(1,5,"..nchoice..")",
					"??/#SpecialAnswer(1,6,"..nchoice..")"
				)
	elseif num == 2 then  --2.???????
		local nShengwang = random(-500,35000)	
		for i = 2,21 do  --?????
			if nShengwang < tShengwang[i][1] then 
				options[1] = format("%s/#answer_ok(%d,%d)", tShengwang[i][2], nchoice, 6)
				options[2] = format("%s/#answer_fail(%d,%d)", tShengwang[i-1][2], nchoice, 6)
				options[3] = format("%s/#answer_fail(%d,%d)", tShengwang[i+1][2], nchoice, 6)
				options[4] = format("%s/#answer_fail(%d,%d)", tShengwang[i+2][2], nchoice, 6)
				break
			end
		end
		ReSort(options)
		Say(NPC_NAME.."?!????????????,?????????,?????<color=yellow>"..nShengwang.."<color>????????",4,
				 options[1], options[2], options[3], options[4])
	elseif num == 3 then  --3.???????
		local level = random(50,97)
		local exp = tExp:getCell((level+2),2)
		local tab_exp = {}
		for i = 1,3 do
			tab_exp[i] = random(-10000,10000)
			if tab_exp[i] == 0 then tab_exp[i] = tab_exp[i] + random(1,5) end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", exp, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[1]), nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[2]), nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[3]), nchoice, 6)		
		ReSort(options)
		Say(NPC_NAME.."?!????????????,?????????,??<color=yellow>"..level.."???"..(level+1).."?<color>???????",4,
				 options[1], options[2], options[3], options[4])
	elseif num == 4 then  --4.????????????????
		local num_max = Zgc_conf_task_num_max()
		local sinup = random(10,num_max)
		local gold = task_money_prize(sinup)
		local tab_gold = {}
		for i = 1,3 do
			tab_gold[i] = random(-1000,1000)
			if tab_gold[i] == 0 then tab_gold[i] = tab_gold[i] + random(1,5) end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", gold, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", (gold+tab_gold[1]), nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", (gold+tab_gold[2]), nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", (gold+tab_gold[3]), nchoice, 6)		
		ReSort(options)
		Say(NPC_NAME.."?!????????????,?????????,??????????????<color=yellow>"..sinup.."?<color>????????<color=yellow>?<color>????",4,
				 options[1], options[2], options[3], options[4])		
	elseif num == 5 then  --5.?????????????
		local skillID = random(1,6)
		local level = random(9,78)
		local exp = gather_exp:getCell((level+2),3)
		local tab_exp = {}
		for i = 1,3 do
			tab_exp[i] = random(-100,100)
			if tab_exp[i] == 0 then tab_exp[i] = tab_exp[i] + random(1,5) end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", exp, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[1]), nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[2]), nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[3]), nchoice, 6)		
		ReSort(options)
		Say(NPC_NAME.."?!????????????,?????????,??<color=yellow>"..tGatherSkill[skillID].."<color>?<color=yellow>"..level.."???"..(level+1).."?<color>???????",4,
				 options[1], options[2], options[3], options[4])
	elseif num == 6 then  --6.??????????????
		local skillID = random(1,9)
		local level = random(9,78)
		local exp = compose_exp:getCell((level+2),3)
		local tab_exp = {}
		for i = 1,3 do
			tab_exp[i] = random(-100,100)
			if tab_exp[i] == 0 then tab_exp[i] = tab_exp[i] + random(1,5) end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", exp, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[1]), nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[2]), nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[3]), nchoice, 6)		
		ReSort(options)
		Say(NPC_NAME.."?!????????????,?????????,??<color=yellow>"..tComposeSkill[skillID].."<color>?<color=yellow>"..level.."???"..(level+1).."?<color>???????",4,
				 options[1], options[2], options[3], options[4])	
	elseif num == 7 then  --??XX?XX,??????
		options = MoonRabbit_GetAQuestion(1)
		for i = 2,5 do 
			if i == options[6] then
				options[i] = options[i].."/#answer_ok("..nchoice..",6)"
			else
				options[i] = options[i].."/#answer_fail("..nchoice..",6)"
			end
		end
		Say(options[1],4,options[2], options[3], options[4], options[5])			
	elseif num == 8 then  --?????????-_-
		local A,B,C,D = random(100),random(10),random(100),random(10)
		local result = (A*B + C*D)*2*0.9  --?????,????1????
		local radnum = {-45,-36,-27,-18,-9,9,18,27,36,45}
		local radresult = {}
		local radtime = 0;
		for i = 1,3 do 
			radresult[i] = radnum[random(10)]
			for j = 1,i-1 do
				if radresult[j] == radresult[i] then
					radresult[i] = radnum[random(10)]
					radtime = radtime + 1;
					if radtime > 10 then
						break;
					end
					j = 1;
				end
			end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", result, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", result+radresult[1], nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", result+radresult[2], nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", result+radresult[3], nchoice, 6)
		ReSort(options)		
		Say(NPC_NAME.."??????????,??????????????????:??????<color=yellow>"..A.."<color>??,????????<color=yellow>"..B.."<color>???????<color=yellow>"..C.."<color>???,?????????<color=yellow>"..D.."<color>????????<color=yellow>2<color>???,???????????<color=yellow>????<color>???,??????????????",4,
				 options[1], options[2], options[3], options[4])	
	end
end

function SpecialAnswer(num,select,choice)  --???????????,???????
	local nchoice = choice
	if num == 1 then 
		if select == GetGlbValue(151) then
				answer_ok(nchoice,6)
		else
				answer_fail(nchoice,6)
		end
	end
end

--===================================================????????============================================

--=======================================================?????=========================================================
function abluemoon_cloth()
	if GetTask(ABLUEMOON_JIFEN) < 1000 then
		Say(NPC_NAME.." ???????????<color=yellow>??<color>,???????????????,????<color=yellow>??<color>??,??????????????",0)
		return
	end
	if floor(GetTask(ABLUEMOON_COMPENSATION)/10) == 0 then --??????????? ?????????????
		if GetFreeItemRoom() < 2 or (GetMaxItemWeight() - GetCurItemWeight()) < 10 then
			Say(NPC_NAME.." ????????????,????????!",0)
			return
		end
		local player_sex = GetBody();
		SetTask(ABLUEMOON_COMPENSATION,GetTask(ABLUEMOON_COMPENSATION)+10)
		if player_sex == 1 then
			AddItem(0,109,260,1)  --?????(?) ?????
		elseif player_sex == 2 then
			AddItem(0,109,262,1)  --?????(?) ?????
		elseif player_sex == 3 then
			AddItem(0,109,268,1)  --?????(?) ?????
		else
			AddItem(0,109,275,1)  --?????(?) ?????
		end
		Say(NPC_NAME.." ????????,????????????,?????!",0)
	else
		Say(NPC_NAME.." ???????????!?????????,????????????,???<color=yellow>??<color>???",0)
	end
end

function abluemoon_cloth()
	if GetTask(ABLUEMOON_JIFEN) < 1000 then
		Say(NPC_NAME.."Th祅h t輈h c馻 ngi v蒼 ch璦 <color=yellow>Ti課 S�<color>,v蒼 ch璦  t� c竎h  l穘h ngo筰 trang?Tuy v藋,ngi c� th� 甶 <color=yellow>Ng� c竎<color> xem xem,h譶h nh� c騨g c� c竎 lo筰 trang ph鬰 m祏 s綾?",0)
		return
	end
	if floor(GetTask(ABLUEMOON_COMPENSATION)/10) == 0 then --??????????? ?????????????
		if GetFreeItemRoom() < 2 or (GetMaxItemWeight() - GetCurItemWeight()) < 10 then
			Say(NPC_NAME.."H祅h trang c馻 ngi kh玭g mang n鎖 r錳,甶 d鋘 d裵 trc r錳 h穣 quay l筰 nha!",0)
			return
		end
		local player_sex = GetBody();
		SetTask(ABLUEMOON_COMPENSATION,GetTask(ABLUEMOON_COMPENSATION)+10)
		if player_sex == 1 then
			AddItem(0,109,260,1)  --?????(?) ?????
		elseif player_sex == 2 then
			AddItem(0,109,262,1)  --?????(?) ?????
		elseif player_sex == 3 then
			AddItem(0,109,268,1)  --?????(?) ?????
		else
			AddItem(0,109,275,1)  --?????(?) ?????
		end
		Say(NPC_NAME.."V╪ kh玦 hoa c萴 thng p nha,m芻 l猲 th� xem xem?Чi hi謕 v╪ v� song to祅,ng l� nh﹏ t礽 c馻 qu鑓 gia nha!",0)
	else
		Say(NPC_NAME.."Ngi  l蕐 l莕 trc r錳!M鏸 ngi ch� 頲 l穘h m閠 l莕,n誹 mu鑞 m祏 kh竎,c� th� n <color=yellow>Ng� c竎<color> l鵤 ch鋘?",0)
	end
end
--=====================================================????=================================================
function abluemoon_rule()
	local tSay = {
		"<enter>M鏸 ng祔<color=yellow> tr� kho秐g th阨 gian 23:00-8:00<color>, ta s� t飝 � n m閠 i th祅h th�, ti誴 nh薾 khi猽 chi課 c馻 m鋓 ngi? M鏸 ngi ch� 頲 khi猽 chi課 1 l莕 trong ng祔,m鏸 l莕 u ph秈 醤e tw� thre� v韎 ta,c╪ c� v祇 s� l莕 th緉g ta  quy誸 nh\n",
		"б m鬰 c馻  thi vi謓,p ng 5  tr� l猲 c� th� ti課 v祇 thi hng? S�  thi hng 頲 quy誸 nh b雐 s� l莕 p ng trong thi vi謓? Цp ng 5 c﹗ tr� l猲 trong thi hng th� s� 頲 nh薾 ch鴑g th�?",
		--?????????
	}
	local szSay = "Quy t綾 nh� sau:";
	for i = 1,getn(tSay) do szSay = szSay..tSay[i] end
	Say(NPC_NAME..szSay,0)
end


tShengwang = {  -- c╪ c� thanh v鋘g sai x璶g h祇
	{-500,"竎 danh chi猽 tr�"},
	{-100,"thanh danh lang t�"},
	{0,"b譶h d﹏ b竎h t輓h"},
	{50,"b蕋 danh nh蕋 v╪"},
	{150,"s� xu蕋 giang h�"},
	{300,"v� danh ti觰 b鑙"},
	{500,"m芻 m芻 v� v╪"},
	{700,"s� hi觧 phong mang"},
	{1000,"ti觰 h鱱 danh kh�"},
	{1500,"thanh danh thc kh雐"},
	{2250,"phong mang t蕋 l�"},
	{3000,"danh thanh hi觧 h竎h"},
	{4500,"c cao v鋘g tr鋘g"},
	{6000,"uy phong b竧 di謓"},
	{9000,"nh� l玦 qu竛 nh�"},
	{12000,"uy tr蕁 c鰑 ch﹗"},
	{15000,"ng筼 th� qu莕 h飊g"},
	{18000,"nh蕋 i t玭g s�"},
	{22500,"ti誹 ng筼 giang h�"},
	{27000,"c� th� v� song"},
	{31500,"ch蕁 c� thc kim"},
	{36500,"kh玭g ti襫 tuy謙 h藆"},
	{45000,"v� l﹎ th莕 tho筰"},
}

tGatherSkill = { "ph箃 m閏", "ch� b�", "thu canh", "th秈 dc", "o箃 kho竛g", "tr鮱 ti", }

tComposeSkill = { "trng binh kh� 畂竛 t筼", "畂秐 binh kh� 畂竛 t筼", "k� m玭 binh kh� 畂竛 t筼", "h� gi竝 ch鴆 t筼", "ch� dc", "phanh nh蒻", "ch� ph�", "h� trang ch鴆 t筼", "u quan ch鴆 t筼",}
