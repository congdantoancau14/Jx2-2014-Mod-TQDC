--�����
Include("\\script\\lib\\define.lua")
Include("\\script\\online\\eating\\eating_head.lua")

nItemIndex = 0;
function OnUse(nItemIndex)
	if DelItem(2,95,822,1) == 1 then		
		SetTask(TASK_FIELD_PVP_DRINK,GetTime());
		CastState("state_life_max_percent_add", 0, 20*60*18, 1, 9915,0);
		SyncCustomState(1, 9915, 3,"Kim L�ng T�u");
		Msg2Player("B�n nh�n ���c tr�ng th�i Kim L�ng T�u, duy tr� 20 ph�t!");
		ET_OnItemUse(nItemIndex)
	end
end