Include("\\script\\class\\ktabfile.lua");
Include("\\script\\online\\abluemoon\\abluemoon_head.lua")
Include("\\script\\online\\abluemoon\\abluemoon_question_head.lua")
Include("\\script\\��ԭ����\\�ɶ�\\npc\\��ʦ.lua")
gather_exp = new(KTabFile, "\\settings\\skill\\skills_gather_exp.txt");
compose_exp = new(KTabFile, "\\settings\\skill\\skills_compose_exp.txt");
tExp = new(KTabFile, "\\settings\\uplevel.txt");

THIS_FILE = "\\script\\online\\abluemoon\\abluemoon_npc.lua"
NPC_NAME = "<color=green>Th� Ti�u Nha<color>: ";

function main()
	local tSay = {
		"Ta s� ch�c!/abluemoon_go",
		"Ta mu�n xem th�nh t�ch/abluemoon_jifen",
		"Ta mu�n xem h�nh v�n h�m nay/abluemoon_luck",
		"Ta mu�n nh�n ph�n th��ng l�n tr��c/CheckHappyTimes",
		"Ta mu�n xem th� h�ng hi�n t�i/abluemoon_paihang",
		"Ta mu�n l�nh ngo�i trang/abluemoon_cloth",
		"N�i r� cho ta ch�t quy t�c ���c kh�ng?/abluemoon_rule",
		"Th�i b� �i! H�m nay ta kh�ng ���c kh�e/end_say"
	}
	local szSay = NPC_NAME.."Hoan ngh�nh b�ng h�u ��n v�i cu�c thi l�n th� nh�t m�a m�t c�a JianXia2. C�c h� c� d�m th� kh�ng?";
	Say(szSay,getn(tSay),tSay);
	
end

function abluemoon_go()
	if GetLevel() < 50 then
		Say(NPC_NAME.."��ng c�p qu� th�p. E r�ng c�c h� kh�ng th� qua v�ng g�i xe. Xin h�y v� t�p luy�n th�m!",0)
		return
	end
	local nDay = tonumber(date("%y%m%d"))
	if GetTask(ABLUEMOON_ANSWER_STAGE) ~= 0 then
		Say(NPC_NAME.."H�nh nh� ng��i qu�n l�nh th��ng,mau l�nh �i kh�ng l�i thi�t m�t th� kh�!",0)
		return
	end
	if GetTask(ABLUEMOON_QUEST_DATE_PAY) == nDay --?????????????
		and GetTask(ABLUEMOON_QUEST_COUNT) < GetTask(ABLUEMOON_QUEST_COUNT_MAX) --???????????
		and GetTask(ABLUEMOON_QUEST_ROUND) == 1 then  --?????????????
		Say(NPC_NAME.."Thi vi�n l�n tr��c th�t b�i,c� mu�n ti�p t�c kh�ng?",2,
				"\n Ta mu�n ti�p t�c/#abluemoon_continue(1)",
				"\n �� ta ngh� ��/end_say"
		)
	elseif GetTask(ABLUEMOON_QUEST_DATE_PAY) == nDay 
		and GetTask(ABLUEMOON_QUEST_COUNT) < GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st) --??????????????????
		and GetTask(ABLUEMOON_QUEST_ROUND) == 2 then  --?????????????
		Say(NPC_NAME.."Thi h��ng l�n tr��c th�t b�i,c� mu�n ti�p t�c kh�ng?",2,
				"\n Ta mu�n ti�p t�c/#abluemoon_continue(2)",
				"\n �� ta ngh� ��/end_say"
		)
	elseif GetMissionV(MV_TIMER_IDEL) == 1 then
		local rest = floor((TIMER_TOTAL_TIME - GetMissionV(MV_TIMER_TIME))/60)
		Say(NPC_NAME.."C�n <color=yellow>"..rest.."<color> ph�t l� ta ��i tr��ng thi,hi�n t�i d�ng ti�p nh�n b�o danh r�i!",0)
		return
	else
		local nluck = GetTask(ABLUEMOON_LUCK)
		local szluck = "Ch�a bi�t, c�n nguy h�n c� qu� ��i Hung"  --???? ????
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
		Say(NPC_NAME.."Th�nh t�ch c�a ng��i v�n ch�a ��<color=yellow>Ti�n S�<color>,v�n ch�a �� t� c�ch �� l�nh ngo�i trang?Tuy v�y,ng��i c� th� �i <color=yellow>Ng� c�c<color> xem xem,h�nh nh� c�ng c� c�c lo�i trang ph�c m�u s�c?",0)
		return
	end
	if floor(GetTask(ABLUEMOON_COMPENSATION)/10) == 0 then --??????????? ?????????????
		if GetFreeItemRoom() < 2 or (GetMaxItemWeight() - GetCurItemWeight()) < 10 then
			Say(NPC_NAME.."H�nh trang c�a ng��i kh�ng mang n�i r�i,�i d�n d�p tr��c r�i h�y quay l�i nha!",0)
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
		Say(NPC_NAME.."V�n kh�i hoa c�m th��ng ��p nha,m�c l�n th� xem xem?��i hi�p v�n v� song to�n,��ng l� nh�n t�i c�a qu�c gia nha!",0)
	else
		Say(NPC_NAME.."Ng��i �� l�y l�n tr��c r�i!M�i ng��i ch� ���c l�nh m�t l�n,n�u mu�n m�u kh�c,c� th� ��n <color=yellow>Ng� c�c<color> l�a ch�n?",0)
	end
end
--=====================================================????=================================================
function abluemoon_rule()
	local tSay = {
		"<enter>M�i ng�y<color=yellow> tr� kho�ng th�i gian 23:00-8:00<color>, ta s� t�y � ��n m�t ��i th�nh th�, ti�p nh�n khi�u chi�n c�a m�i ng��i? M�i ng��i ch� ���c khi�u chi�n 1 l�n trong ng�y,m�i l�n ��u ph�i �ne tw� thre� v�i ta,c�n c� v�o s� l�n th�ng ta �� quy�t ��nh\n",
		"�� m�c c�a �� thi vi�n,��p ��ng 5 �� tr� l�n c� th� ti�n v�o thi h��ng? S� �� thi h��ng ���c quy�t ��nh b�i s� l�n ��p ��ng trong thi vi�n? ��p ��ng 5 c�u tr� l�n trong thi h��ng th� s� ���c nh�n ch�ng th�?",
		--?????????
	}
	local szSay = "Quy t�c nh� sau:";
	for i = 1,getn(tSay) do szSay = szSay..tSay[i] end
	Say(NPC_NAME..szSay,0)
end


tShengwang = {  -- c�n c� thanh v�ng sai x�ng h�o
	{-500,"�c danh chi�u tr�"},
	{-100,"thanh danh lang t�"},
	{0,"b�nh d�n b�ch t�nh"},
	{50,"b�t danh nh�t v�n"},
	{150,"s� xu�t giang h�"},
	{300,"v� danh ti�u b�i"},
	{500,"m�c m�c v� v�n"},
	{700,"s� hi�n phong mang"},
	{1000,"ti�u h�u danh kh�"},
	{1500,"thanh danh th��c kh�i"},
	{2250,"phong mang t�t l�"},
	{3000,"danh thanh hi�n h�ch"},
	{4500,"��c cao v�ng tr�ng"},
	{6000,"uy phong b�t di�n"},
	{9000,"nh� l�i qu�n nh�"},
	{12000,"uy tr�n c�u ch�u"},
	{15000,"ng�o th� qu�n h�ng"},
	{18000,"nh�t ��i t�ng s�"},
	{22500,"ti�u ng�o giang h�"},
	{27000,"c� th� v� song"},
	{31500,"ch�n c� th��c kim"},
	{36500,"kh�ng ti�n tuy�t h�u"},
	{45000,"v� l�m th�n tho�i"},
}

tGatherSkill = { "ph�t m�c", "ch� b�", "thu canh", "th�i d��c", "o�t kho�ng", "tr�u ti", }

tComposeSkill = { "tr��ng binh kh� �o�n t�o", "�o�n binh kh� �o�n t�o", "k� m�n binh kh� �o�n t�o", "h� gi�p ch�c t�o", "ch� d��c", "phanh nh�m", "ch� ph�", "h� trang ch�c t�o", "��u quan ch�c t�o",}
