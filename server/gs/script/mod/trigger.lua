Include("\\script\\task\\global_task\\gtask_head.lua")

function OnTrigger()
	gt_trigger_callback();
end;

--ɱ�ִ������ص�����
function gt_trigger_callback()
	print("trigger mod gt_trigger_callback");
	-- CreateNpc("Da h�", "Da h�",GetTargetPos());
	-- Add Uy h� tinh hoa
	-- Add Thanh long tinh hoa
	-- Ph�ng nh�n ��ng > Ph�ng ho�ng >> add h�a ph�ng tinh hoa
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