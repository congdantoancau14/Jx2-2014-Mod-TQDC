Include("\\script\\online_activites\\silingmount\\string.lua")
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
	return 0;
end