Include("\\script\\item\\horse_head.lua");

function OnEquip(nItemIndex)
	
	OnEquipCallBack(nItemIndex, 1);

	return 1;
end

function OnUnEquip(nItemIndex)
	
	OnUnEquipCallBack(nItemIndex, -1);

	return 0;
end


function OnUse()
end

function CanEquip()
end
