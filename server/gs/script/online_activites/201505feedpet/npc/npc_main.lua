--主活动npc对话选项
Include("\\script\\online_activites\\201505feedpet\\head.lua")
Include("\\script\\online_activites\\201505feedpet\\main.lua")

SZ_NPC_NAME="Чi S� ho箃 ng"
SZ_NPC_TITLE_1505="Ch祇 m鮪g tham gia ho箃 ng Hu蕁 luy謓 th� m颽 h�"
T_MAIN_DIALOG_1505={
	format("%s/do_desc", "Gi韎 thi謚 ho箃 ng"),
	format("%s/do_get_tool", "Nh薾 C遡 Th� C璶g"),
	format("%s/#do_get_award(%d)", "Nh薾 thng (Hu蕁 luy謓 th� c璶g thng)", 1),
	format("%s/#do_get_award(%d)", "Nh薾 thng (Hu蕁 luy謓 th� c璶g hi誱)", 2),
	format("%s/do_get_follower", "Nh薾 頲 1 th� c璶g theo sau"),
}

function npc_talk_main_1505()
	if check_player_condition()~= 1 then
		return
	end
	local szTitle = format("%s:%s", SZ_NPC_NAME, "Ch祇 m鮪g tham gia ho箃 ng Hu蕁 luy謓 th� m颽 h�")
	local tbSay = {}
	tinsert(tbSay, format("%s/do_desc", "Gi韎 thi謚 ho箃 ng"))
	tinsert(tbSay, format("%s/do_get_tool", "Nh薾 C遡 Th� C璶g"))
	
	tinsert(tbSay, format("%s/#do_get_award(%d)", "Nh薾 thng (Hu蕁 luy謓 th� c璶g thng)", 1))
	tinsert(tbSay, format("%s/#do_get_award(%d)", "Nh薾 thng (Hu蕁 luy謓 th� c璶g hi誱)", 2))
	
	tinsert(tbSay, format("%s/do_get_follower", "Nh薾 頲 1 th� c璶g theo sau"))
	tinsert(tbSay, format("%s/nothing", "Ra kh醝"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function do_desc()
	local szTitle = format("%s:%s", SZ_NPC_NAME, "Ch祇 m鮪g tham gia ho箃 ng Hu蕁 luy謓 th� m颽 h�")
	local tbSay = {}
	tinsert(tbSay, format("%s/_desc1", "Gi韎 thi謚 hu蕁 luy謓 th� c璶g"))
	tinsert(tbSay, format("%s/_desc2", "Gi韎 thi謚 y課 ti謈 ngo礽 tr阨"))
	if g_debug==1 then
		tinsert(tbSay, format("%s/on_daily_clear", "DailyReset"))
	end
	
	tinsert(tbSay, format("%s/npc_talk_main_1505", "tr� l筰"))
	tinsert(tbSay, format("%s/nothing", "Ra kh醝"))
	
	
	Say(szTitle, getn(tbSay), tbSay)
end

function _desc1()
	local szTitle = format("%s:%s", SZ_NPC_NAME, "T� 15/05 - 31/05, h籲g ng祔 c� th� n ch� c馻 l穙 phu nh薾 C遡 Th� C璶g-Thng, m鏸 ng祔 c� th� hu蕁 luy謓 5 Th� C璶g-Thng, khi  cng tr竛g t 46 甶觤 c� th� n ch� c馻 ta  nh薾 thng. ng r錳, t骾 ng v藅 ph萴 hu蕁 luy謓 th� c璶g  b� k� tr閙 cp 甶, ngi h穣 n Vng M蓇 чng 2 v� 3, Sa M筩 M� Cung l� c� th� t譵 頲. N誹 ngi c秏 th蕐 phi襫 ph鴆 th� c� th� v祇 Ng� C竎 xem th�, trong  c� v藅 ph萴 hi誱 c�  hu蕁 luy謓 th� c璶g, ngo礽 ra Ti猲 Qu� m� c竎 th� c璶g y猽 th輈h c� th� gi髉 b筺 m閠 tay.")
	local tbSay = {}
	
	tinsert(tbSay, format("%s/do_desc", "tr� l筰"))
	tinsert(tbSay, format("%s/nothing", "Ra kh醝"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function _desc2()
	local szTitle = format("%s:%s", SZ_NPC_NAME, "T� 15/05 - 31/05,  t� 19:00-21:00 h籲g ng祔, l穙 phu s� t� ch鴆 ti謈  thng cho c竎 hi謕 kh竎h c� c玭g hu蕁 luy謓 th� c璶g, do s� lng hi謕 kh竎h qu� nhi襲 n猲 m鏸 ngi ch� c� 10 ph髏  ╪ ti謈, tuy th阨 gian kh玭g nhi襲 nh璶g c騨g ng qu猲 mang theo m� t鰑 do l穙 phu t苙g  nh藀 ti謈 nh�!")
	local tbSay = {}
	
	tinsert(tbSay, format("%s/do_desc", "tr� l筰"))
	tinsert(tbSay, format("%s/nothing", "Ra kh醝"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function do_get_tool()
	local nAwardCnt = get_award_count(1)
	if nAwardCnt >= g_tFeedPet.nMaxFeedPetOneDay then
		Talk(1, "", format("S� l莕 hu蕁 luy謓 th� c璶g c馻 h玬 nay  t t鑙 產"))
		return
	end
	local t = g_tFeedPet.tToolItem[1]
	local ti = t[3]
	if BigGetItemCount(ti[1], ti[2], ti[3]) < 1 then
		AddItem(ti[1], ti[2], ti[3], 1)
	else
		Talk(1, "", format("Х c� C遡 Th� C璶g"))
	end
end

function do_get_award(nLevel)
	local nAwardCnt = get_award_count(nLevel)
	local ncurPoint = get_cur_point(nLevel)
	if nAwardCnt >= g_tFeedPet.nMaxFeedPetOneDay then
		Talk(1, "", format("S� l莕 hu蕁 luy謓 th� c璶g c馻 h玬 nay  t t鑙 產"))
		return
	end
	local t = g_tFeedPet.tToolItem[nLevel]
	local ti = t[3]
	if GetItemCount(ti[1], ti[2], ti[3]) < 1 then
		Talk(1, "", format("Ph秈 ch╪g  qu猲 mang theo C遡 Th� C璶g r錳?"))
		return
	end
	if ncurPoint ~=g_tFeedPet.nFeedTargetPoint then
		Talk(1, "", format("ч hu蕁 luy謓 hi謓 t筰: %d/%d, ch璦 ho祅 th祅h", ncurPoint, g_tFeedPet.nFeedTargetPoint))
		return
	end
	
	if DelItem(ti[1], ti[2], ti[3], 1) ~= 1 then
		Talk(1, "", format("Ph秈 ch╪g  qu猲 mang theo C遡 Th� C璶g r錳?"))
		return
	end
	if gf_Judge_Room_Weight(2,100,"") ~= 1 then 
		return 0;
	end
	local tAward = g_tFeedPet.tMainAward[nLevel]
	gf_EventGiveRandAward(tAward.tRand, 10000, 1, "Ho箃 ng hu蕁 luy謓 th�", "1505activity");
	gf_EventGiveAllAward(tAward.tAll, "Ho箃 ng hu蕁 luy謓 th�", "1505activity");
	set_cur_point(nLevel, 0)
	set_award_count(nLevel, nAwardCnt + 1)
	Talk(1, "", format(" t� c竎 h� gi髉 ch髇g t玦 hu蕁 luy謓 th� c璶g, y l� th� lao xin h穣 nh薾 l蕐"))
end

function do_get_follower()
	rand_follower()
end
