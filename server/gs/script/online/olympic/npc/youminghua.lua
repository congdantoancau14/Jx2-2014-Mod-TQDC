--Include("\\script\\tmp_task_id_def.lua")
Include("\\settings\\static_script\\online\\olympic\\oly_define.lua")

function main()
	--if GetTaskTemp(TMP_TASK_ID_OLY_YMH_TEMP_INDEX) == GetTargetNpc() then
		DoWait(32,33,3) -- Xem file global/action_bar_callback
		SetNpcLifeTime(GetTargetNpc(),0);
		
		--AddItem(Flame_Table[2][1],Flame_Table[2][2],Flame_Table[2][3],1);
		--Msg2Player(format("B¹n nhËn ®­îc %s", Flame_Table[2][5]))
		--SetTaskTemp(TMP_TASK_ID_OLY_YMH_TEMP_INDEX,0);
	--end	
end