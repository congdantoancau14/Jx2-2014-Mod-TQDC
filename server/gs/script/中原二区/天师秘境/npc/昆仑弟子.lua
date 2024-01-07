-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 天师秘境NPC昆仑弟子Script
-- By StarryNight
-- 2007/08/07 PM 11:46

-- 贩卖你的感情吧，但它一文不值。

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\2014_03\\task_yinxin.lua")
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main()
	if g_akct_GetTaskStep(bTag) then
		return
	end
	
	--活动
	if gf_CheckEventDateEx(WN_201403_ACTIVITY_ID) == 1 then
		local nRet = WN_201403_Talk3()
		if nRet == 1 then
			return
		end
	end	
	
	--------------
	
	local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);

	---------------------------------- 西北区25分支2_2秘境骷髅----------------------------------
	
	--与天师秘境中受伤的昆仑弟子对话获得解封的咒语
	if nStep_XBTask_02 == 7 then
		task_025_02_0();
		return
	end
	
	--尚未消灭骷髅王
	if nStep_XBTask_02 == 8 then
		task_025_02_1();
		return
	end
	
	--消灭骷髅王后
	if nStep_XBTask_02 == 9 then
		task_025_03_0();
		return
	end
	
	--尚未告知叶子秋骷髅王一事
	if nStep_XBTask_02 == 10 then
		task_025_03_1();
		return
	end
	
	--一般情况下的对话
	local strTalk = {
		"Thi猲 S� m藅 c秐h th藅 vui, qu� nhi猲 c� nhi襲 em nh� v藋~~!? (*^_^*) hihi厖",
		}
	
	TalkEx("",strTalk);
	return
	
end;
