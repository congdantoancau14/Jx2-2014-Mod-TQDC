
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 酒楼老板脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\大理\\lv58\\task_main.lua");

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==12) then
		task_012_00();
		return
	end
	
	if GetTask(TASK_DL_LV55_ID) == 7 and GetItemCount(2,0,375) < 1 then
		--跟扬州酒楼老板买三套鸭              
		buy_gift_talk(2);
		return
	end
	
	Talk(1,"","Kh竎h quan n ti觰 甶誱 t譵 ru thng h筺g �? B秓 m s� 頲 h礽 l遪g!");
	
end;
