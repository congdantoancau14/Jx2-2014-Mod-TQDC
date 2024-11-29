--½ðÁê¾Æ
Include("\\script\\lib\\define.lua")

function OnUse()
	if DelItem(2,95,822,1) == 1 then		
		SetTask(TASK_FIELD_PVP_DRINK,GetTime());
		CastState("state_life_max_percent_add", 0, 20*60*18, 1, 9915,0);
		SyncCustomState(1, 9915, 3,"Kim L¨ng Töu");
		Msg2Player("B¹n nhËn ®­îc tr¹ng th¸i Kim L¨ng Töu, duy tr× 20 phót!");
	end
end