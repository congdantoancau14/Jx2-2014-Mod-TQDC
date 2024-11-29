Include("\\settings\\static_script\\online\\olympic\\oly_define.lua")
Include("\\script\\online\\olympic\\oly_head.lua")

function OnDeath(npcIndex,f,x)
		if f ~= 0 then
			return 0;
		end
		if GetTeamSize() ~= 0 then
			local OldPlayerIndex = PlayerIndex;
			for i= 1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i); 
				if GetTaskTemp(TMP_TASK_ID_OLY_MHGL_TEMP_INDEX) == tonumber(npcIndex) then
					SetTaskTemp(TMP_TASK_ID_OLY_MHGL_TEMP_INDEX,0)
					gf_SetTaskByte(VET_OLY_TASK4, 1, min(gf_GetTaskByte(VET_OLY_TASK4, 1) + 1, 255), TASK_ACCESS_CODE_OLYMPIC);
					ModifyExp(333000);
					gf_AddItemEx2({2,1,30747,1,4}, "Hép Trang TrÝ Gi¸ng Sinh", szLogTitle, "Minh Háa Quû Linh", 0, 1);
					CustomAwardGiveGroup("Fire_Killjinying", 0);
				end
			end
			PlayerIndex = OldPlayerIndex;
		else
			if GetTaskTemp(TMP_TASK_ID_OLY_MHGL_TEMP_INDEX) == tonumber(npcIndex) then
				SetTaskTemp(TMP_TASK_ID_OLY_MHGL_TEMP_INDEX,0)
				gf_SetTaskByte(VET_OLY_TASK4, 1, min(gf_GetTaskByte(VET_OLY_TASK4, 1) + 1, 255), TASK_ACCESS_CODE_OLYMPIC);
				ModifyExp(333000);
				gf_AddItemEx2({2,1,30747,1,4}, "Hép Trang TrÝ Gi¸ng Sinh", szLogTitle, "Minh Háa Quû Linh", 0, 1);
				CustomAwardGiveGroup("Fire_Killjinying", 0);
			end
		end
		
		SetNpcLifeTime(npcIndex,0);
end