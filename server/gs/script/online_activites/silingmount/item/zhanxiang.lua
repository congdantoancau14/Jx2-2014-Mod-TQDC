Include("\\script\\online_activites\\silingmount\\string.lua")
Include("\\script\\item\\horse_head.lua");

function OnEquip(nItemIndex)	
	OnEquipCallBack(nItemIndex, 1);
	CleanInteractive();
	InteractiveEnable(0);
	return 0
end

function OnUnEquip(nItemIndex)
	OnUnEquipCallBack(nItemIndex, -1);
	InteractiveEnable(1);
	return 0
end

function OnUse()
	return 0;
end

function CanEquip()
	local jugong = GetTask(701); -- 宋方是正数, 辽方是负数
	local nRank = GetTask(704);
	
	if ( (jugong <= -250000 and nRank == -6) or (jugong >= 250000 and nRank == 6) ) then
		return 0;
	end
	Talk(1,"",format(VET_TB_SILING_MSG[16],250000,VET_TB_SILING_MSG[18]));
	return 1;
end