--女真军士阿不罕
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

--把一些数据上的东西丢到这里来 方便测试
g_tGTaskId = {1321,1337};  --涉及到的任务id 查看gtask_main
g_szNpcName = "Qu﹏ S� N� Ch﹏-A B蕋 H穘: ";

function kill_him()
	local nNpcIdx = GetTargetNpc();
	if nNpcIdx == nil then return 0; end
	ChangeNpcToFight(nNpcIdx);
	--SetNpcDeathScript(nIdx,"\\script\\pop\\2012\\hl_robber_npc.lua");
	NpcChat(nNpcIdx, "N誹  b� ngi nh譶 th蕌 th� nh gi誸 ngi di謙 kh萿 v藋.");
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
		Talk(1, "", "<color=green>" .. szNpcName .. "<color>: D筼 n祔 lo nh tr薾, kh玭g bi誸 h玬 nay tng qu﹏  gi竜 hu蕁 ch璦?");
		return 0;
	end
	
	local szPlayerName = GetName();
	local szMsg = format("<color=green>%s<color>: Nghe n鉯 t鑙 h玬 qua  th� ra 1 con H秈 Йng Thanh, ngi c� bi誸 kh玭g?\\p<color=green>%s<color>: H玬 qua ta u鑞g ru v韎 Ba у L� n猲 kh玭g  �.\\p<color=green>%s<color>: (ta s� l鮝 h緉)\\p<color=green>%s<color>: Kh玭g c莕, t鑙 h玬 qua Ba у L� lu玭 � trong l襲 c馻 ta, tr阨 s竛g m韎 r阨 kh醝.\\p<color=green>%s<color>: V藋... ta... n閜 m筺g n祇.",szPlayerName,szNpcName, szPlayerName, szPlayerName, szNpcName);

	suTalk("kill_him", szMsg, 1);
end

function OnDeath(nNpcIdx)
	--RemoveNpc(nNpcIdx);
end