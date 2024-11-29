--ÉñÃØÑÌ»ğ
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\lib\\npccmdhead.lua")

--Ò»¹²ĞèÒªÎå¸öÅ¶£¬Îå¸ö£¡£¡£¡£¡
TASK_ID_ESCORT_LYH	3378
TASK_ID_ESCORT_LL1	3379
TASK_ID_ESCORT_LL2	3380
TASK_ID_ESCORT_LL3	3381
TASK_ID_ESCORT_LL4	3382
TASK_ID_ESCORT_LLTM	3383
TASK_ID_ESCORT_DEATH 3384

function BeginEscort()
	if tGtCondition:check_taskid(591, 2) ~= nil then
		local nNpcIdx = CreateNpc("Hæ tr¾ng", "Tiªu S­ L©m Nguyªn H¹o", GetWorldPos());
		SetTask(TASK_ID_ESCORT_LYH, nNpcIdx);
		g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
		g_NpcAI:setWayPoint(nNpcIdx,{{1751, 3552}});
		
		--¹ÒÉÏÇøÓò´¥·¢Æ÷
		CreateTrigger(2, 1815);
	end
end

function RectTrigger()		--×ø±ê´¥·¢Æ÷
	RemoveTrigger(GetRunningTrigger());

	for i =1, 4 do
		local nIdx = CreateNpc("Hæ tr¾ng", "Thiªn ¢m Gi¸o-L©u La C­íp Tiªu", GetWorldPos());
		SetNpcScript(nIdx, "\\script\\pop\\escort.lua");
		SetTask(TASK_ID_ESCORT_LYH + i, nIdx);
	end
	
	local nIdx = CreateNpc("Hæ tr¾ng", "Thiªn ¢m C­íp Tiªu §Çu Môc", GetWorldPos());
	SetNpcScript(nIdx, "\\script\\pop\\escort.lua");
	SetTask(TASK_ID_ESCORT_LLTM, nIdx);
	
	Talk(1, "", "Nµy anh em, l¹i cã ng­êi tù nguyªn d©ng hiÕn råi! H·y cïng nhau lªn cho ta!");
end

--function DeathTrigger()		--OnDeath Ò²¿ÉÒÔ
function OnDeath()		--ÌìÒõXX
	--È«²¿ËÀ¹â
	SetTask(TASK_ID_ESCORT_DEATH, GetTask(TASK_ID_ESCORT_DEATH) + 1);
	
	if mod(GetTask(TASK_ID_ESCORT_DEATH), 5) ~= 0 then --·ÇÁã
		return;
	end
	
	--ÖØĞÂ¿ªÊ¼×ß¶¯
	local nNpcIdx = GetTask(TASK_ID_ESCORT_LYH);
	g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
	--¸ù¾İµ±Ç°µÄµã´¦ÀíÏÂÒ»²½µÄÒÆ¶¯
	local nMapID, nMapX, nMapY = GetWorldPos();
	if nMapX == 1726 and nMapY == 3472 then	-- Íê³ÉÈÎÎñ
		SetNpcLiftTime(nNpcIdx, 0);
	end
	g_NpcAI:setWayPoint(nNpcIdx,{{1726, 3472}});
end

function Fail()
	--1¡¢°Ñ¼ÇÂ¼ÁÖÔªê»NPCIDµÄÈÎÎñ±äÁ¿ÉèÎª0
		--1¡¢²¹³ä£ºÆäËûNPCIDÒ²ÊÇÖÃÎª0
	--2¡¢»¹Òª°ÑÁÖÔªê»Õâ¸öÈÎÎñÖÃÎªÎ´½Ó¡£¡£¡£ÕâÑù¾Í¿ÉÒÔÖØ½ÓÁË
	if tGtCondition:check_taskid(591, 2) ~= nil then
		for i = TASK_ID_ESCORT_LYH, TASK_ID_ESCORT_DEATH do
			SetTask(i, 0);
		end
		
		tGtTask:set_task(3, 591);	--È¡ÏûÈÎÎñ
		Talk(1, "", "NhiÖm vô hé tèng ®· thÊt b¹i, ®¹i hiÖp h·y tiÕp tôc cè g¾ng nµo!");
	end
end