-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 沙漠迷宫NPC袁飞云Script
-- By StarryNight
-- 2007/08/04 AM 11:59

-- 好热啊好热啊……

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local	strTalk = {};

	---------------------------------- 西北区20分支1_11兵不厌诈----------------------------------
	
	
	--已经杀死了独行老陀
	if nStep_XBTask_01 == 54 then
		strTalk = {
			"S竧 Th� Oa Oa th輈h nh蕋 K裲 H� L� c馻 Л阯g H� L� trongPh鬾g Tng ph�, ngi h穣 mua v� cho 輙 Thu鑓 m� c馻 ta v祇, b秓 m kh玭g c� s� h�.",
			}
		TalkEx("",strTalk);	
		return
	end
	
	--一般情况下的对话
	strTalk = {
		"L祄 ngh� c馻 ch髇g t玦  quen v韎 b╪g gi� v� sa m筩 r錳. Ch� c莕 b総 頲 ph筸 nh﹏ l� 頲 r錳."
		}
	
	TalkEx("",strTalk);
	return
	
end;
