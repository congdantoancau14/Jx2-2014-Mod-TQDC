-- =====================================================
-- 定时把门派boss任务的大怪boss放到随机位置的脚本
-- Tony(Jizheng)
-- Dec 20th, 2006
-- =====================================================

-- 定时设定
function TaskShedule()
	-- 任务名字
	TaskName("Nhi謒 v� BOSS m玭 ph竔")
	-- 24个小时一次
	TaskInterval(1440)
	
	-- 设置触发时间
	local nHour = 21
	local nMinute = 0
	TaskTime(nHour, nMinute)
	-- 重复执行无限次数
	TaskCountLimit(0)
	
	local msg = "NCP nhi謒 v� boss m玭 ph竔 t飝 l骳�"..nHour.." gi� "..nMinute.."ph髏 xu蕋 hi謓!"
	OutputMsg(format(msg))
end;

-- 定时执行的内容
function TaskContent()

	--    boss名字：
	local strBossName = 	{"Thanh Th�", "Huy襫 Ch﹏", "Dng Di猲 c", "Л阯g H�", "Ho祅g Ch輓h Nh蕋", "C� M芻", "Tu� Minh"}
	
	local szPos = {1, 2, 3, 4, 5, 6, 7}
	local nPos1 = 0
	local nPos2 = 0
	local nPos3 = 0
	
	-- 在7个boss中间随机选择3个
	local nSel = random(1, 7)
	nPos1 = szPos[nSel]				-- 第一个
	szPos[nSel] = szPos[7]
	
	nSel = random(1, 6)
	nPos2 = szPos[nSel]				-- 第二个
	szPos[nSel] = szPos[6]
	
	nSel = random(1, 5)
	nPos3 = szPos[nSel]				-- 第三个
	
	local msg="Boss m玭 ph竔 s� xu蕋 hi謓 �:"..strBossName[nPos1]..", "..strBossName[nPos2]..", "..strBossName[nPos3].."!"
	OutputMsg(format(msg))
	
	-- 发给服务器让他们招boss
	GlobalExecute(format("dw call_faction_bt_boss(%d,%d,%d)", nPos1, nPos2, nPos3))
end;

