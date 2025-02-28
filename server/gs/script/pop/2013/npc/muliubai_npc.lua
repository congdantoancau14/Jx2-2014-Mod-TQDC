--女真军士阿不罕
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua");

--把一些数据上的东西丢到这里来 方便测试
g_tGTaskId = {1328,1342};  --涉及到的任务id 查看gtask_main
g_tBossInfo = {
	{"Chu Gi韎 Quang",	"Chu Gi韎 Quang",	612,1922,4078	, nil, "\\script\\pop\\2013\\npc\\muliubai_npc.lua",	nil,	10 * 60},
	{"Thi猲  Gi竜-Chi Vi謓 S�",	"Thi猲  Gi竜-Chi Vi謓 S�",	612,1922,4071	, nil, "\\script\\pop\\2013\\npc\\muliubai_npc.lua",	nil,	10 * 60},
	{"Thi猲  Gi竜-Chi Vi謓 S�",	"Thi猲  Gi竜-Chi Vi謓 S�",	12,1926,4073	, nil, "\\script\\pop\\2013\\npc\\muliubai_npc.lua",	nil,	10 * 60},
};

g_szNpcName = "<color=green>M閏 L璾 B筩h<color>: ";

g_szMsg = [[
	<color=green>Playername<color>：<color=green>沐留白<color>姑娘？
	\p<color=green>沐留白<color>：<sex>可是颜公子派来寻我的？我知道他会来救我的。
	\p<color=green>Playername<color>：这是怎么回事？
	\p<color=green>沐留白<color>：朱界光那个……（声渐哽咽）叛徒！他假意将我诱我入天阴教埋伏，还要加害颜公子。
	\p<color=green>沐留白<color>：啊，怎么办，他们来了！
	\p<color=green>Playername<color>：来得正好，叛徒自该有叛徒的下场。
]];


function create_boss()
	SetTask(TASKID_2013_NEW_TASK_PRISON, 1);
	gf_CreateNpcList(g_tBossInfo);
end

function main()
	local nNpcIdx = GetTargetNpc();
	local szNpcName = GetNpcName(nNpcIdx);
	
	local nHasTask = 0;
	for i = 1,getn(g_tGTaskId) do
		if 1 == tGtTask:check_cur_task(g_tGTaskId[i])  then
			nHasTask = 1
			break;
		end
	end
	
	if nHasTask ~= 1 then
		Talk(1, "", "<color=green>" .. szNpcName .. "<color>: Ti誧 l� ta kh玭g bi誸 頲 b� m苩 th藅 c馻 b鋘 ph秐  s韒 h琻!");
		return 0;
	end
	
	if GetTask(TASKID_2013_NEW_TASK_PRISON) ~= 0 then
		Talk(1, "", "<color=green>" .. szNpcName .. "<color>: Ti誧 l� ta kh玭g bi誸 頲 b� m苩 th藅 c馻 b鋘 ph秐  s韒 h琻!");
		return 0;
	end
	
	local szMsg = gsub(g_szMsg, "Playername", GetName());
	szMsg = gsub(szMsg, "<sex>", gf_GetPlayerSexName());
	suTalk("create_boss", szMsg, 1);
end

function OnDeath(nNpcIdx)
	RemoveNpc(nNpcIdx);
end