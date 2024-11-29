Include("\\settings\\static_script\\global\\regular_clear_task.lua")
Include("\\script\\task\\huofengtask\\npc_huanghuoliujin_death.lua")
Include("\\script\\task\\global_task\\gtask_head.lua");


N_MAX_HUANGHUOZHIXIN_BOSS_CALL_CNT=1
function OnUse(id)
	local tbSay = {}
	tinsert(tbSay, format("%s/call_fight_npc", "Chiªu gäi Hoang Háa L­u Kim (Ch©n th©n) "))
	tinsert(tbSay, format("%s/no", "KÕt thóc ®èi tho¹i"))
	local szMsg = format("%s:%s", "<color=green>Hoang Háa Chi T©m<color>", "Hoµn thµnh chuçi nhiÖm vô Háa Phông mçi tuÇn cã thÓ khiªu chiÕn 1 lÇn Hoang Háa L­u Kim (Ch©n th©n) ")
	Say(szMsg,getn(tbSay),tbSay)
end

function call_fight_npc()
	if check_condition(1)~=1 then return end
	
	local nMap,nX,nY = GetWorldPos()
	if nMap ~= 8011 then
		Talk(1, "", format("ChØ ®­îc chiªu gäi Hoang Háa L­u Kim (Ch©n th©n) t¹i V¹n Linh §µi"))
		return
	end
	
	if rc_GetWeeklyTask(N_MAX_HUANGHUOZHIXIN_BOSS_CALL_CNT) >= N_MAX_HUANGHUOZHIXIN_BOSS_CALL_CNT then
		Talk(1, "", format("Sè lÇn triÖu håi Hoang Háa L­u Kim (Ch©n th©n) cña tuÇn nµy ®· ®¹t giíi h¹n, tuÇn sau h·y quay l¹i!"))
		return
	end
	
	local t_need = {"Hoang Háa L­u Kim",2, 0, 30072, 1}
	if GetItemCount(t_need[2], t_need[3], t_need[4]) < t_need[5] then
		Talk(1, "", format("%s kh«ng ®ñ %d", t_need[1], t_need[5]))
		return
	end
	if DelItem(t_need[2], t_need[3], t_need[4], t_need[5]) ~= 1 then
		return
	end
	
	nX = nX + random(-5,5)
	nY = nY + random(-5,5)
	local npcIndex = CreateNpc("TYT_HHHLJ", "Hoang Háa L­u Kim (Ch©n th©n)", nMap,nX,nY)
	SetNpcTempData(npcIndex, NPC_TEMP_HUANGHUOZHIXIN_DAYE_IDX, PlayerIndex)--¼ÇÂ¼´óÒ¯µÄindex
	SetNpcLifeTime(npcIndex, 5*60*18)--5·ÖÖÓºóÏûÊ§
	SetNpcDeathScript(npcIndex, "\\script\\task\\huofengtask\\npc_huanghuoliujin_death.lua")
end

function check_condition(bNotify)
	if tGtTask:check_task_isfinish(270) ~= 1 then
		if bNotify==1 then
			Talk(1, "", "Hoµn thµnh chuçi nhiÖm vô Háa Phông míi ®­îc khiªu chiÕn!")
		end
		return 0
	end
	return 1
end
