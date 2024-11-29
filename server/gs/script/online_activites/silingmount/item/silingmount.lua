Include("\\script\\online_activites\\silingmount\\string.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\item\\horse_head.lua")

function OnEquip(item)
	OnEquipCallBack(item,1)
	CleanInteractive();
	InteractiveEnable(0);
	return 0
end

function OnUnEquip(item)
	OnUnEquipCallBack(item,-1)
	InteractiveEnable(1);
	return 0
end

function OnUse()
	return 0;
end

function CanEquip()
	if gf_GetTaskByte(TRANSLIFE_TASK_ID, 1) == 0 then
		Talk(1,"",VET_TB_SILING_MSG[17]);
		return 1;
	end
	return 0;
end