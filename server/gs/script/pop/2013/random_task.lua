Include("\\script\\lib\\floyd.lua"); --20130326添加
Include("\\script\\task\\\\global_task\\gtask_head.lua")
Include("\\script\\lib\\define.lua")

g_tTv = {
	["Ho祅 Nhan T玭g H祅"] = TASKID_2013_RANDOM_POP_TASK_FLAG1,
	["Nhan Hi Do穘"] = TASKID_2013_RANDOM_POP_TASK_FLAG2,
}

g_tTaskInfo = {
	["Ho祅 Nhan T玭g H祅"] = {
		{1332,1,},
		{1333,2,},
		{1334,3,},
		{1335,4,},
		{1336,5,},
		{1337,6,},
		{1338,7,},
	},
	["Nhan Hi Do穘"] = {
		{1339,1,},
		{1340,2,},
		{1341,3,},
		{1342,4,},
		{1343,5,},
		{1344,6,},
		{1345,7,},
	},
}

function random_task()
	--这里是特殊需求 根据每天来随机
	local nDate = tonumber(date("%Y%m%d"));
	--特殊需求完毕
	local szNpcName = GetTargetNpcName();
	if g_tTaskInfo[szNpcName] == nil or g_tTv[szNpcName] == nil then return 0; end
	local tTaskInfo = g_tTaskInfo[szNpcName];
	local nTv = g_tTv[szNpcName]
	for k, v in tTaskInfo do
		if tGtTask:check_cur_task(v[1]) == 1 then
			Talk(1, "tGtNpcMain:npc_main", "H穣 ho祅 th祅h nhi謒 v� ng祔 trc  r錳 h穣 nh薾 nhi謒 v� ng祔 h玬 nay!");
			return 0;
		end
	end
	--把之前的任务状态清空
	for i = 1, getn(tTaskInfo) do
		if tGtCondition:check_taskid(tTaskInfo[i][1],1) then --是否完成
			tGtTask:CloseTask(tTaskInfo[i][1]);
		end
	end
	randomseed(nDate);
	--随机出n个任务
	local tRand = floyd_rm4n(getn(tTaskInfo), 3);
	for i = 1, getn(tRand) do
		gf_SetTaskBit(nTv, tTaskInfo[tRand[i]][2], 1);
	end
	
	tGtNpcMain:npc_main();
end

