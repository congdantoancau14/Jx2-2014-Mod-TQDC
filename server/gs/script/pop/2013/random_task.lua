Include("\\script\\lib\\floyd.lua"); --20130326Ìí¼Ó
Include("\\script\\task\\\\global_task\\gtask_head.lua")
Include("\\script\\lib\\define.lua")

g_tTv = {
	["Hoµn Nhan T«ng Hµn"] = TASKID_2013_RANDOM_POP_TASK_FLAG1,
	["Nhan Hi Do·n"] = TASKID_2013_RANDOM_POP_TASK_FLAG2,
}

g_tTaskInfo = {
	["Hoµn Nhan T«ng Hµn"] = {
		{1332,1,},
		{1333,2,},
		{1334,3,},
		{1335,4,},
		{1336,5,},
		{1337,6,},
		{1338,7,},
	},
	["Nhan Hi Do·n"] = {
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
	--ÕâÀïÊÇÌØÊâĞèÇó ¸ù¾İÃ¿ÌìÀ´Ëæ»ú
	local nDate = tonumber(date("%Y%m%d"));
	--ÌØÊâĞèÇóÍê±Ï
	local szNpcName = GetTargetNpcName();
	if g_tTaskInfo[szNpcName] == nil or g_tTv[szNpcName] == nil then return 0; end
	local tTaskInfo = g_tTaskInfo[szNpcName];
	local nTv = g_tTv[szNpcName]
	for k, v in tTaskInfo do
		if tGtTask:check_cur_task(v[1]) == 1 then
			Talk(1, "tGtNpcMain:npc_main", "H·y hoµn thµnh nhiÖm vô ngµy tr­íc ®ã råi h·y nhËn nhiÖm vô ngµy h«m nay!");
			return 0;
		end
	end
	--°ÑÖ®Ç°µÄÈÎÎñ×´Ì¬Çå¿Õ
	for i = 1, getn(tTaskInfo) do
		if tGtCondition:check_taskid(tTaskInfo[i][1],1) then --ÊÇ·ñÍê³É
			tGtTask:CloseTask(tTaskInfo[i][1]);
		end
	end
	randomseed(nDate);
	--Ëæ»ú³ön¸öÈÎÎñ
	local tRand = floyd_rm4n(getn(tTaskInfo), 3);
	for i = 1, getn(tRand) do
		gf_SetTaskBit(nTv, tTaskInfo[tRand[i]][2], 1);
	end
	
	tGtNpcMain:npc_main();
end

