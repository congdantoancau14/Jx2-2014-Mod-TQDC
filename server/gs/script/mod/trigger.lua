
function OnTrigger()
	gt_trigger_callback();
end;

--É±¹Ö´¥·¢Æ÷»Øµ÷º¯Êý
function gt_trigger_callback()
	print("trigger mod gt_trigger_callback");
	CreateNpc("Da hæ", "Da hæ",GetTargetPos());
	-- Add Uy hæ tinh hoa
	-- Add Thanh long tinh hoa
	-- Phông nh·n ®éng > Phông hoµng >> add háa phông tinh hoa
end