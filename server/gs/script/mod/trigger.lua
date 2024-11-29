Include("\\script\\task\\global_task\\gtask_head.lua")

function OnTrigger()
	gt_trigger_callback();
end;

--É±¹Ö´¥·¢Æ÷»Øµ÷º¯Êý
function gt_trigger_callback()
	print("trigger mod gt_trigger_callback");
	-- CreateNpc("Da hæ", "Da hæ",GetTargetPos());
	-- Add Uy hæ tinh hoa
	-- Add Thanh long tinh hoa
	-- Phông nh·n ®éng > Phông hoµng >> add háa phông tinh hoa
	local nCustomTrigger = GetTriggerCustomID(GetRunningTrigger());
	local nCount = mod(nCustomTrigger,10);
	local nTaskID = ((nCustomTrigger-nCount)-tGtTask.GT_TRIGGER_OFFSET)/10;
	local nTaskValue = 0;
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == nTaskID then
			nTaskValue = i;
			break;
		end
	end
	local nTaskValue3 = nTaskValue+(tGtTask.GLV_GT_TASK_NUM+1)*2;
	gf_SetTaskBit(nTaskValue3,nCount,1);
	RemoveTrigger(GetRunningTrigger());
	
end