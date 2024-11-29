Include("\\script\\online_activites\\201505feedpet\\head.lua")

function on_daily_clear()
	if is_in_activity_date() ~= 1 then
		return
	end
	set_award_count(1,0)
	set_award_count(2,0)
	set_task(g_tFeedPet.nTaskIdx_FuDaiCount, 0)
	set_task(g_tFeedPet.nTaskIdx_ExpGetCnt, 0)
	set_task(g_tFeedPet.nTaskIdx_ExpGetMulti, 0)
end

function on_player_login()
	if is_in_activity_date() ~= 1 then
		return
	end
	CreateTrigger(0, 1387, 1387 * 2)
end

function on_server_start()
	if is_in_activity_date() ~= 1 then
		return
	end
	CreateNpcList(g_tFeedPet.tJiuXi);
end

function CreateNpcList(tNpcList)
	for _, tNpc in tNpcList do
		local npc = CreateNpc(tNpc[1], tNpc[2], tNpc[3], tNpc[4], tNpc[5]);
		SetNpcScript(npc, tNpc[6] or "");
		if npc > 0 then
		else
			local idx = SubWorldID2Idx(tNpc[3])
			if idx and idx > 0 then
				local szMsg = format("Create[%s] Npc[%s][%s] fail", tNpc[1], tNpc[2], tNpc[6] or "")
				WriteLog(szMsg)
				print(szMsg)
			end
		end
	end
end