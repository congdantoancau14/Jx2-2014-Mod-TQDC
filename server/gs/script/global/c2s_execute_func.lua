-- ¿Í»§¶ËÒªÇóÖ´ÐÐµÄ½Å±¾

TRADE_EXPORT_LOCK_ID = 825
AUTO_LOCK_TIME_ID = 827

Include("\\script\\global\\get_offline_point.lua")
--Include("\\script\\global\\wuxing.lua")
--Include("\\script\\lib\\define.lua")
--Include("\\script\\lib\\task_id_manage.lua")
Include("\\script\\task\\global_task\\gtask_data.lua");
function main(dwParam)
        if dwParam >= 65536 then
                code = floor(dwParam / 65536);
                dwParam = mod(dwParam, 65536);
                return dostring(format("func_%d(%d)",dwParam, code))
        end
        dostring("func_"..dwParam.."(0)")
end

function cancel()
end

--ÀëÏßÊ±¼ä¶Ò»»½±Àø
function func_5()
	offline_exchange_talk_main();
end
function func_1()
	MPUpdate("\\script\\master_prentice\\some_op.lua", "create_task_r2s", 1)
end

function func_9()
	SetPlayerScript("\\script\\missions\\yp\\biaotou_npc.lua");
	SendScript2VM("\\script\\missions\\yp\\biaotou_npc.lua", "bt_Talk_2_1()")
end

function func_10()
	SetPlayerScript("\\script\\missions\\yp\\biaotou_npc.lua");
	SendScript2VM("\\script\\missions\\yp\\biaotou_npc.lua", "bt_Talk_2_2()")
end
function func_11(id)
	if not id or id < 0 or id > 16 then return end
	SetPlayerScript("\\settings\\static_script\\misc\\missionaward.lua");
	SendScript2VM("\\settings\\static_script\\misc\\missionaward.lua", format("MA_OnOpen(%d)",id));
end

function func_12()
	SetPlayerScript("\\script\\missions\\yp\\yp_head.lua");
	SendScript2VM("\\script\\missions\\yp\\yp_head.lua", "yp_c2s_detail()")
end

function func_13()
	SetPlayerScript("\\script\\missions\\yp\\yp_head.lua");
	SendScript2VM("\\script\\missions\\yp\\yp_head.lua", "yp_c2s_getRqz()")
end
function func_32() 	-- Áì½±
	tCampManage:ClearCampTaskID();
	SendScript2VM("\\script\\biwudahui\\wlzb_award.lua","exchange()");
end
function func_34()	-- ²ÎÕ½
	SendScript2VM("\\script\\biwudahui\\wlzb.lua",format("OnWant(%d,1)",PlayerIndex));
end
function func_35()	-- ¹ÛÕ½
	SendScript2VM("\\script\\biwudahui\\wlzb.lua",format("OnView(%d)",PlayerIndex));
end
-- Ëø¶¨½»Ò×³õÊ¼¶Ô»°
function func_2()
	Say("Khãa giao dÞch: B¹n cã thÓ chän thêi gian khãa ®Ó khãa giao dÞch hoÆc chän chøc n¨ng tù ®éng khãa giao dÞch, giíi thiÖu cô thÓ sau phÇn chän chøc n¨ng cã giíi thiÖu chi tiÕt. KhuyÕn khÝch sö dông chøc n¨ng khãa giao dÞch tù ®éng cã thÓ b¶o ®¶m an toµn cho tµi kho¶n cña b¹n!",
	    4,
	    "Ta muèn khãa giao dÞch d­íi 24 tiÕng/func_2_manual_24",
	    "Ta muèn khãa giao dÞch tõ 24 ®Õn 48 tiÕng/func_2_manual_48",
	    "Ta muèn thiÕt lËp chøc n¨ng khãa tù ®éng/func_2_auto",
	    "T¹m thêi kh«ng thÓ khãa/cancel");
end

-- ×Ô¶¯Ëø¶¨ÉèÖÃ
function func_2_auto()
	local nSec = GetTask(AUTO_LOCK_TIME_ID)
	if (nSec <= 0) then
		Say("Khãa giao dÞch: B¹n cã thÓ chän dßng thiÕt lËp tù ®éng khãa ®Ó tiÕn hµnh khãa giao dÞch tù ®éng. Tõ lÇn ®¨ng nhËp sau nÕu kh«ng cã thiÕt lËp thêi gian khãa giao dÞch hoÆc thêi gian khãa giao dÞch nhá h¬n thêi gian dù kiÕn khãa giao dÞch th× IP m¸y sÏ thay ®æi. Lóc nµy c¨n cø vµo dßng chän tù ®éng khãa ®Ó khãa giao dÞch trong 1 kho¶ng thêi gian.",
		    5,
		    "Sau khi online tù ®éng khãa 5 phót/#auto_lock_confirm(5)",
		    "Sau khi online tù ®éng khãa 15 phót/#auto_lock_confirm(15)",
		    "Sau khi online tù ®éng khãa 30 phót/#auto_lock_confirm(30)",
		    "Sau khi online tù ®éng khãa 60 phót/#auto_lock_confirm(60)",
		    "T¹m thêi kh«ng thÓ khãa/cancel")
	else
		local nAutoMin = floor(nSec / 60)
		Say("Khãa giao dÞch: B¹n ®· chän khãa tù ®éng "..nAutoMin.." phót. B¹n cã thÓ chän söa thêi gian khãa tù ®éng còng cã thÓ t¹m thêi hñy chøc n¨ng khãa tù ®éng: ",
		    6,
		    "Sau khi online tù ®éng khãa 5 phót/#auto_lock_confirm(5)",
		    "Sau khi online tù ®éng khãa 15 phót/#auto_lock_confirm(15)",
		    "Sau khi online tù ®éng khãa 30 phót/#auto_lock_confirm(30)",
		    "Sau khi online tù ®éng khãa 60 phót/#auto_lock_confirm(60)",
		    "Xãa chøc n¨ng khãa tù ®éng/#auto_lock_confirm(0)",
		    "T¹m thêi kh«ng söa thêi gian khãa/cancel")
	end
end

-- È·ÈÏ×Ô¶¯Ëø¶¨µÄÊ±¼ä
function auto_lock_confirm(nParam)
	if (nParam <= 0) then
		Say("Khãa giao dÞch: B¹n ®· hñy chøc n¨ng khãa giao dÞch, cã thÓ g©y nguy hiÓm cho tµi kho¶n cña b¹n, b¹n x¸c nhËn muèn hñy?",
			2,
			"X¸c nhËn/#auto_lock_confirm_2(0)",
			"T¹m thêi kh«ng söa thêi gian khãa/cancel")
	else
		Say("Khãa giao dÞch: B¹n chän khãa giao dÞch tù ®éng "..nParam.." phót, sau khi b¹n ®¨ng nhËp, nÕu kh«ng cã khãa giao dÞch sÏ tù ®éng khãa giao dÞch "..nParam.." phót. Khi b¹n ®¨ng nhËp nÕu thêi gian khãa giao dÞch cña b¹n nhá h¬n "..nParam.." phót còng sÏ tù ®éng khãa giao dÞch "..nParam.." phót. B¹n muèn më chøc n¨ng khãa tù ®éng?",
			2,
			"§óng vËy/#auto_lock_confirm_2("..nParam..")",
			"T¹m thêi kh«ng thÓ khãa/cancel")
	end
end

function auto_lock_confirm_2(nParam)
	local nSec = nParam * 60
	SetTask(AUTO_LOCK_TIME_ID, nSec)
	local nLastip, nCurip = GetLoginIP()
	
	WriteLog("[Khãa giao dÞch]"..GetName().."ThiÕt lËp khãa giao dÞch, thêi gian khãa lµ "..nParam.." phót, IP ®¨ng nhËp "..nCurip..".");
	if (nParam <= 0) then
		Talk(1,"","Khãa giao dÞch: B¹n ®· hñy chøc n¨ng khãa giao dÞch!");
	else
		Talk(1,"","Khãa giao dÞch: B¹n ®· chän thiÕt lËp thêi gian khãa giao dÞch tù ®éng <color=red>"..nParam.." phót<color>!");
	end
end

-- ÊÖ¶¯Ëø¶¨½»Ò×Ê±¼ä£¨24Ð¡Ê±ÒÔÏÂ£©
function func_2_manual_24()
	local nSec = GetTask(TRADE_EXPORT_LOCK_ID)
	if (nSec <= 0) then
		Say("Khãa giao dÞch: B¹n chän dßng thêi gian khãa ®Ó thiÕt lËp khãa giao dÞch. Sau khi khãa, <color=red>tõ lóc b¾t ®Çu khãa ®Õn khi kÕt thóc khãa giao dÞch<color>, khi b¹n ®¨ng nhËp l¹i sÏ kh«ng thÓ giao dÞch c¸c vËt phÈm nh­ <color=red>ng©n l­îng, ng©n phiÕu vµ tÊt c¶ c¸c vËt phÈm<color> víi ng­êi kh¸c, còng kh«ng thÓ vøt bá nh­ng vÉn cã thÓ nhËn giao dÞch tõ ng­êi kh¸c.",
			8,
			"Ta muèn khãa giao dÞch 2h/#confirm_1_time(2)",
			"Ta muèn khãa giao dÞch 4h/#confirm_1_time(4)",
			"Ta muèn khãa giao dÞch 8h/#confirm_1_time(8)",
			"Ta muèn khãa giao dÞch12h/#confirm_1_time(12)",
			"Ta muèn khãa giao dÞch 16h/#confirm_1_time(16)",
			"Ta muèn khãa giao dÞch 20h/#confirm_1_time(20)",
			"Ta muèn khãa giao dÞch 24h/#confirm_1_time(24)",
			"T¹m thêi kh«ng thÓ khãa/cancel");
	else
		local nLeftHour = floor(nSec / 3600)
		local nLeftMin = floor((nSec - nLeftHour * 3600) / 60)
		Say("Khãa giao dÞch: B¹n ®· khãa giao dÞch. HiÖn t¹i cßn d­ <color=red>"..nLeftHour.."h "..nLeftMin.." phót<color>. Sau khi b¹n ®¨ng nhËp l¹i sÏ kh«ng thÓ giao dÞch <color=red>ng©n l­îng, ng©n phiÕu vµ tÊt c¶ vËt phÈm<color> víi ng­êi kh¸c còng kh«ng thÓ vøt bá. B¹n cã muèn thiÕt lËp l¹i thao t¸c khãa? H·y chó ý <color=red>Thêi gian khãa giao dÞch míi chØ cã thÓ lín h¬n thêi gian khãa giao dÞch cßn l¹i!<color>",
			8,
			"Ta muèn khãa giao dÞch 2h/#confirm_1_time(2)",
			"Ta muèn khãa giao dÞch 4h/#confirm_1_time(4)",
			"Ta muèn khãa giao dÞch 8h/#confirm_1_time(8)",
			"Ta muèn khãa giao dÞch12h/#confirm_1_time(12)",
			"Ta muèn khãa giao dÞch 16h/#confirm_1_time(16)",
			"Ta muèn khãa giao dÞch 20h/#confirm_1_time(20)",
			"Ta muèn khãa giao dÞch 24h/#confirm_1_time(24)",
			"T¹m thêi kh«ng thÓ khãa/cancel");		
	end
end

-- ÊÖ¶¯Ëø¶¨½»Ò×Ê±¼ä£¨24Ð¡Ê± - 48Ð¡Ê±£©
function func_2_manual_48()
	local nSec = GetTask(TRADE_EXPORT_LOCK_ID)
	if (nSec <= 0) then
		Say("Khãa giao dÞch: B¹n chän dßng thêi gian khãa ®Ó thiÕt lËp khãa giao dÞch. Sau khi khãa, <color=red>tõ lóc b¾t ®Çu khãa ®Õn khi kÕt thóc khãa giao dÞch<color>, khi b¹n ®¨ng nhËp l¹i sÏ kh«ng thÓ giao dÞch c¸c vËt phÈm nh­ <color=red>ng©n l­îng, ng©n phiÕu vµ tÊt c¶ c¸c vËt phÈm<color> víi ng­êi kh¸c, còng kh«ng thÓ vøt bá nh­ng vÉn cã thÓ nhËn giao dÞch tõ ng­êi kh¸c.",
			8,
			"Ta muèn khãa giao dÞch 1 ngµy 2h/#confirm_1_time(26)",
			"Ta muèn khãa giao dÞch 1 ngµy 4h/#confirm_1_time(28)",
			"Ta muèn khãa giao dÞch 1 ngµy 8h/#confirm_1_time(32)",
			"Ta muèn khãa giao dÞch 1 ngµy 12h/#confirm_1_time(36)",
			"Ta muèn khãa giao dÞch 1 ngµy 16h/#confirm_1_time(40)",
			"Ta muèn khãa giao dÞch 1 ngµy 20h/#confirm_1_time(44)",
			"Ta muèn khãa giao dÞch 1 ngµy 24h/#confirm_1_time(48)",
			"T¹m thêi kh«ng thÓ khãa/cancel");
	else
		local nLeftHour = floor(nSec / 3600)
		local nLeftMin = floor((nSec - nLeftHour * 3600) / 60)
		Say("Khãa giao dÞch: B¹n ®· khãa giao dÞch. HiÖn t¹i cßn d­ <color=red>"..nLeftHour.."h "..nLeftMin.." phót<color>. Sau khi b¹n ®¨ng nhËp l¹i sÏ kh«ng thÓ giao dÞch <color=red>ng©n l­îng, ng©n phiÕu vµ tÊt c¶ vËt phÈm<color> víi ng­êi kh¸c còng kh«ng thÓ vøt bá. B¹n cã muèn thiÕt lËp l¹i thao t¸c khãa? H·y chó ý <color=red>Thêi gian khãa giao dÞch míi chØ cã thÓ lín h¬n thêi gian khãa giao dÞch cßn l¹i!<color>",
			8,
			"Ta muèn khãa giao dÞch 1 ngµy 2h/#confirm_1_time(26)",
			"Ta muèn khãa giao dÞch 1 ngµy 4h/#confirm_1_time(28)",
			"Ta muèn khãa giao dÞch 1 ngµy 8h/#confirm_1_time(32)",
			"Ta muèn khãa giao dÞch 1 ngµy 12h/#confirm_1_time(36)",
			"Ta muèn khãa giao dÞch 1 ngµy 16h/#confirm_1_time(40)",
			"Ta muèn khãa giao dÞch 1 ngµy 20h/#confirm_1_time(44)",
			"Ta muèn khãa giao dÞch 1 ngµy 24h/#confirm_1_time(48)",
			"T¹m thêi kh«ng thÓ khãa/cancel");		
	end
end

function confirm_1_time(nParam)

	local nSec = GetTask(TRADE_EXPORT_LOCK_ID)
	local nDesSec = nParam * 3600
	if (nDesSec < nSec) then
		Talk(1,"","Khãa giao dÞch: Xin lçi! Thêi gian b¹n chän khãa giao dÞch nhá h¬n thêi gian cßn l¹i. V× thÕ kh«ng thÓ tiÕn hµnh thao t¸c khãa l¹i.");
		return
	end

	local month = tonumber(date("%m"))
	local day = tonumber(date("%d"))
	local hour = tonumber(date("%H"))
	local minute = tonumber(date("%M"))

	local month1 = month
	local day1 = day
	local hour1 = hour + nParam
	
	if (hour1 >= 24) then
		hour1 = hour1 - 24
		day1 = day1 + 1
		
		if (hour1 >= 24) then
			hour1 = hour1 - 24
			day1 = day1 + 1
		end
		
		if (day1 > 31 and (month1 == 1 or month1 == 3 or month1 == 5 or month1 == 7 or month1 == 8 or month1 == 10)) then
			day1 = day1 - 31
			month1 = month1 + 1
		end
		if (month1 == 12 and day1 > 31) then
			day1 = day1 - 31
			month1 = 1
		end
		if (month1 == 2 and day1 > 28) then
			day1 = day1 - 28
			month1 = 3
		end
		if (day1 > 30 and (month1 == 4 or month1 == 6 or month1 == 9 or month1 == 11)) then
			day1 = day1 - 30
			month1 = month1 + 1
		end
	end

	Say("Khãa giao dÞch: B¹n chän khãa giao dÞch <color=red>"..nParam.."<color> giê, tõ <color=red>"..month.."NguyÖt"..day.."NhËt"..hour.." ®iÓm"..minute.." phót ®Õn "..month1.."NguyÖt"..day1.."NhËt"..hour1.." ®iÓm"..minute.." phót<color>, b¹n x¸c nhËn muèn khãa?",
		2,
		"\nX¸c nhËn/#confirm_2_time("..nParam..")",
		"\nKh«ng cÇn/cancel");
end

function confirm_2_time(nParam)
	Say("Khãa giao dÞch: B¹n chän khãa giao dÞch <color=red>"..nParam.."<color> giê, b¹n x¸c nhËn muèn khãa?",
		2,
		"\nX¸c nhËn/#confirm_final_time("..nParam..")",
		"\nKh«ng cÇn/cancel");
end

function confirm_final_time(nParam)
	local nSec = nParam * 3600
	SetTask(TRADE_EXPORT_LOCK_ID, nSec)
	local nLastip, nCurip = GetLoginIP()
	
	WriteLog("[Khãa giao dÞch]"..GetName().."®· khãa giao dÞch, thêi gian khãa lµ "..nParam.." giê, IP ®¨ng nhËp lµ "..nCurip..".");
	Talk(1,"","Khãa giao dÞch: B¹n chän khãa giao dÞch <color=red>"..nParam.." giê<color> thµnh c«ng!");
end
function func_40()
	local nRet = OpenGTask();
end

function func_41()
	local nRet = FinishGTask();
end

function func_42(nTaskID)
	if not nTaskID or nTaskID == 0 then return end
	SetPlayerScript("\\script\\task\\global_task\\gtask_head.lua");
	SendScript2VM("\\script\\task\\global_task\\gtask_head.lua", format("tGtNpcMain:cancel_main(%d)",nTaskID));	
end

function func_43()
	SetPlayerScript("\\settings\\static_script\\vip_feedback_system\\vfs_main.lua");
	SendScript2VM("\\settings\\static_script\\vip_feedback_system\\vfs_main.lua", "vfs_open_JJ_shop()");	
end

function func_44()
	SetPlayerScript("\\settings\\static_script\\vip_feedback_system\\vfs_main.lua");
	SendScript2VM("\\settings\\static_script\\vip_feedback_system\\vfs_main.lua", "vfs_open_YJ_shop()");	
end

function func_45()
	SetPlayerScript("\\script\\missions\\nvn\\3v3\\3v3award.lua");
	SendScript2VM("\\script\\missions\\nvn\\3v3\\3v3award.lua", "get_3v3_last_week_award()");
end

function func_46()
	SetPlayerScript("\\script\\missions\\nvn\\3v3\\3v3award.lua");
	SendScript2VM("\\script\\missions\\nvn\\3v3\\3v3award.lua", "get_3v3_last_season_award()");
end

function func_47(nLotteryType)
	SetPlayerScript("\\script\\function\\lucky_box\\lb_head.lua");
	SendScript2VM("\\script\\function\\lucky_box\\lb_head.lua", format("_lb_DoAward(%d)", nLotteryType));
end

function func_48()
	SetPlayerScript("\\script\\function\\lucky_box\\lb_head.lua");
	SendScript2VM("\\script\\function\\lucky_box\\lb_head.lua", "_lb_UIChange_Clean()");
end

function func_61()
	SetPlayerScript("\\script\\global\\skill_app.lua");
	SendScript2VM("\\script\\global\\skill_app.lua", "unequip_all_skill_app()")
end
