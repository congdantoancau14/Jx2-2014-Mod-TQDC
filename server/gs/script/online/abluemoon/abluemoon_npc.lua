Include("\\script\\class\\ktabfile.lua");
Include("\\script\\online\\abluemoon\\abluemoon_head.lua")
Include("\\script\\online\\abluemoon\\abluemoon_question_head.lua")
Include("\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\ïÚÊ¦.lua")
gather_exp = new(KTabFile, "\\settings\\skill\\skills_gather_exp.txt");
compose_exp = new(KTabFile, "\\settings\\skill\\skills_compose_exp.txt");
tExp = new(KTabFile, "\\settings\\uplevel.txt");

THIS_FILE = "\\script\\online\\abluemoon\\abluemoon_npc.lua"
NPC_NAME = "<color=green>Thè TiÓu Nha<color>: ";

function main()
	local tSay = {
		"Ta sî ch¾c!/abluemoon_go",
		"Ta muèn xem thµnh tÝch/abluemoon_jifen",
		"Ta muèn xem h¹nh vËn h«m nay/abluemoon_luck",
		"Ta muèn nhËn phÇn th­ëng lÇn tr­íc/CheckHappyTimes",
		"Ta muèn xem thø h¹ng hiÖn t¹i/abluemoon_paihang",
		"Ta muèn l·nh ngo¹i trang/abluemoon_cloth",
		"Nãi râ cho ta chót quy t¾c ®­îc kh«ng?/abluemoon_rule",
		"Th«i bá ®i! H«m nay ta kh«ng ®­îc kháe/end_say"
	}
	local szSay = NPC_NAME.."Hoan nghªnh b»ng h÷u ®Õn víi cuéc thi lÇn thø nhÊt mïa mét cña JianXia2. C¸c h¹ cã d¸m thö kh«ng?";
	Say(szSay,getn(tSay),tSay);
	
end

function abluemoon_go()
	if GetLevel() < 50 then
		Say(NPC_NAME.."§¼ng cÊp qu¸ thÊp. E r»ng c¸c h¹ kh«ng thÓ qua vßng göi xe. Xin h·y vÒ tËp luyÖn thªm!",0)
		return
	end
	local nDay = tonumber(date("%y%m%d"))
	if GetTask(ABLUEMOON_ANSWER_STAGE) ~= 0 then
		Say(NPC_NAME.."H×nh nh­ ng­¬i quªn l·nh th­ëng,mau l·nh ®i kh«ng l¹i thiÖt mÊt th× khæ!",0)
		return
	end
	if GetTask(ABLUEMOON_QUEST_DATE_PAY) == nDay --?????????????
		and GetTask(ABLUEMOON_QUEST_COUNT) < GetTask(ABLUEMOON_QUEST_COUNT_MAX) --???????????
		and GetTask(ABLUEMOON_QUEST_ROUND) == 1 then  --?????????????
		Say(NPC_NAME.."Thi viÖn lÇn tr­íc thÊt b¹i,cã muèn tiÕp tôc kh«ng?",2,
				"\n Ta muèn tiÕp tôc/#abluemoon_continue(1)",
				"\n §Ó ta nghÜ ®·/end_say"
		)
	elseif GetTask(ABLUEMOON_QUEST_DATE_PAY) == nDay 
		and GetTask(ABLUEMOON_QUEST_COUNT) < GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st) --??????????????????
		and GetTask(ABLUEMOON_QUEST_ROUND) == 2 then  --?????????????
		Say(NPC_NAME.."Thi h­¬ng lÇn tr­íc thÊt b¹i,cã muèn tiÕp tôc kh«ng?",2,
				"\n Ta muèn tiÕp tôc/#abluemoon_continue(2)",
				"\n §Ó ta nghÜ ®·/end_say"
		)
	elseif GetMissionV(MV_TIMER_IDEL) == 1 then
		local rest = floor((TIMER_TOTAL_TIME - GetMissionV(MV_TIMER_TIME))/60)
		Say(NPC_NAME.."Cßn <color=yellow>"..rest.."<color> phót lµ ta ®æi tr­êng thi,hiÖn t¹i dõng tiÕp nhËn b¸o danh råi!",0)
		return
	else
		local nluck = GetTask(ABLUEMOON_LUCK)
		local szluck = "Ch­a biÕt, cßn nguy h¬n c¶ quÎ §¹i Hung"  --???? ????
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
		Msg2Player("???“"..tTitle[nTitleLevel][3].."”???");
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
		Say(NPC_NAME.."Thµnh tÝch cña ng­¬i vÉn ch­a ®ç<color=yellow>TiÕn SÜ<color>,vÉn ch­a ®ñ t­ c¸ch ®Ó l·nh ngo¹i trang?Tuy vËy,ng­¬i cã thÓ ®i <color=yellow>Ngù c¸c<color> xem xem,h×nh nh­ còng cã c¸c lo¹i trang phôc mµu s¾c?",0)
		return
	end
	if floor(GetTask(ABLUEMOON_COMPENSATION)/10) == 0 then --??????????? ?????????????
		if GetFreeItemRoom() < 2 or (GetMaxItemWeight() - GetCurItemWeight()) < 10 then
			Say(NPC_NAME.."Hµnh trang cña ng­¬i kh«ng mang næi råi,®i dän dÑp tr­íc råi h·y quay l¹i nha!",0)
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
		Say(NPC_NAME.."V¨n kh«i hoa cÈm th­êng ®Ñp nha,mÆc lªn thö xem xem?§¹i hiÖp v¨n vâ song toµn,®óng lµ nh©n tµi cña quèc gia nha!",0)
	else
		Say(NPC_NAME.."Ng­¬i ®· lÊy lÇn tr­íc råi!Mçi ng­êi chØ ®­îc l·nh mét lÇn,nÕu muèn mµu kh¸c,cã thÓ ®Õn <color=yellow>Ngù c¸c<color> lùa chän?",0)
	end
end
--=====================================================????=================================================
function abluemoon_rule()
	local tSay = {
		"<enter>Mçi ngµy<color=yellow> trõ kho¶ng thêi gian 23:00-8:00<color>, ta sÏ tïy ý ®Õn mét ®¹i thµnh thÞ, tiÕp nhËn khiªu chiÕn cña mäi ng­êi? Mçi ng­êi chØ ®­îc khiªu chiÕn 1 lÇn trong ngµy,mçi lÇn ®Òu ph¶i áne twß threÌ víi ta,c¨n cø vµo sè lÇn th¾ng ta ®Ó quyÕt ®Þnh\n",
		"§Ò môc cña ®Ò thi viÖn,®¸p ®óng 5 ®Ò trë lªn cã thÓ tiÕn vµo thi h­¬ng? Sè ®Ò thi h­¬ng ®­îc quyÕt ®Þnh bëi sè lÇn ®¸p ®óng trong thi viÖn? §¸p ®óng 5 c©u trë lªn trong thi h­¬ng th× sÏ ®­îc nhËn chøng th­?",
		--?????????
	}
	local szSay = "Quy t¾c nh­ sau:";
	for i = 1,getn(tSay) do szSay = szSay..tSay[i] end
	Say(NPC_NAME..szSay,0)
end


tShengwang = {  -- c¨n c­ thanh väng sai x­ng hµo
	{-500,"¸c danh chiªu trø"},
	{-100,"thanh danh lang t¹"},
	{0,"b×nh d©n b¸ch tÝnh"},
	{50,"bÊt danh nhÊt v¨n"},
	{150,"s¬ xuÊt giang hå"},
	{300,"v« danh tiÓu bèi"},
	{500,"mÆc mÆc v« v¨n"},
	{700,"s¬ hiÓn phong mang"},
	{1000,"tiÓu h÷u danh khÝ"},
	{1500,"thanh danh th­íc khëi"},
	{2250,"phong mang tÊt lé"},
	{3000,"danh thanh hiÓn h¸ch"},
	{4500,"®øc cao väng träng"},
	{6000,"uy phong b¸t diÖn"},
	{9000,"nh­ l«i qu¸n nhÜ"},
	{12000,"uy trÊn cöu ch©u"},
	{15000,"ng¹o thÞ quÇn hïng"},
	{18000,"nhÊt ®¹i t«ng s­"},
	{22500,"tiÕu ng¹o giang hå"},
	{27000,"cö thÕ v« song"},
	{31500,"chÊn cæ th­íc kim"},
	{36500,"kh«ng tiÒn tuyÖt hËu"},
	{45000,"vò l©m thÇn tho¹i"},
}

tGatherSkill = { "ph¹t méc", "chÕ b×", "thu canh", "th¶i d­îc", "o¹t kho¸ng", "trõu ti", }

tComposeSkill = { "tr­êng binh khÝ ®o¸n t¹o", "®o¶n binh khÝ ®o¸n t¹o", "kú m«n binh khÝ ®o¸n t¹o", "hé gi¸p chøc t¹o", "chÕ d­îc", "phanh nhÉm", "chÕ phï", "h¹ trang chøc t¹o", "®Çu quan chøc t¹o",}
