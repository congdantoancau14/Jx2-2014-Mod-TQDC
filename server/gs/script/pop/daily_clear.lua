Include("\\script\\task\\global_task\\gtask_head.lua");

function OnPopDailyClear(npc)
	local tTaskID = {
		849,850,851,852,853,854,855,856,857,908,
		944,945,946,947,948,949,1010,1011,1012,
	};

	for i = 1, getn(tTaskID) do
		if tGtCondition:check_taskid(tTaskID[i],1) then --是否完成
			tGtTask:CloseTask(tTaskID[i])
		end
	end
	
	--几个变量 只有吴小小
	SetTask(TASK_WXX_DAILY_TIME, 0);
--	SetTask(3376, 0);									--武林盟重复任务记录（每天最多20个）,该任务取消，变量已注销。
	SetTask(TASK_POP_ZHECHONG_OOXX,0); --2012资料片折冲社声望任务记录（每天最多20个）
end