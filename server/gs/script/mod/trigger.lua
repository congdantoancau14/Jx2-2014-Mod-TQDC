
function OnTrigger()
	gt_trigger_callback();
end;

--ɱ�ִ������ص�����
function gt_trigger_callback()
	print("trigger mod gt_trigger_callback");
	CreateNpc("Da h�", "Da h�",GetTargetPos());
	-- Add Uy h� tinh hoa
	-- Add Thanh long tinh hoa
	-- Ph�ng nh�n ��ng > Ph�ng ho�ng >> add h�a ph�ng tinh hoa
end