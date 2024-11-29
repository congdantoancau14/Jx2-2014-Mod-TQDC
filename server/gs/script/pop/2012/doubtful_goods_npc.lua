--¿ÉÒÉµÄÎïÆ·NPC
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\global_task\\gtask_head.lua")
	
tNpcInfo = {
"H¾c y nh©n: CÈn thËn! §õng ®ông vµo c¸i gãi ®ã!",
"H¾c y nh©n: ¤i, xem ra trÔ råi, ®éc tè ®· b¾t ®Çu lan ra.",
"H¾c y nh©n: H·y cÇm lÊy thuèc gi¶i nµy, ®îi sau khi ®Çu ãc tØnh t¸o h·y nhanh chãng uèng vµo, cã thÓ gi÷ l¹i tÝnh m¹ng.",
	}
function main()
	if gf_JudgeRoomWeight(1,10,"VËt phÈm kh¶ nghi") ~= 1 then
			return 0;
	end
	if tGtTask:check_cur_task(917) == 1 then
		if gf_GetTaskByte(TASKID_SW_CHECK_DOUBTFUL_GOODS,1) == 1 then return 0; end; 
		local nNpcIdx = CreateNpc("TuyÖt t×nh","H¾c y nh©n",604,1482,2831); 
		SetNpcLifeTime(nNpcIdx,15);        
		nNpcIdx = CreateNpc("TuyÖt t×nh","H¾c y nh©n",604,1481,2824);
		SetNpcLifeTime(nNpcIdx,15);
		local nNpcIdx = CreateNpc("TuyÖt t×nh","H¾c y nh©n",604,1484,2823);
		SetNpcLifeTime(nNpcIdx,15);
		CastState("state_lost_life_per18",150,18*30,0,1); --Íæ¼ÒÃ¿ÃëµôÑª10%
		gf_AddItemEx({2,96,111,1,4},"Thuèc gi¶i cña h¾c nh©n");
		gf_SetTaskByte(TASKID_SW_CHECK_DOUBTFUL_GOODS,1,1) 
		Talk(3,"",tNpcInfo[1],tNpcInfo[2],tNpcInfo[3]);
		return 0;
	end
	if tGtTask:check_cur_task(918) == 1 then
		if gf_GetTaskByte(TASKID_SW_CHECK_DOUBTFUL_GOODS,2) == 1 then return 0; end;
		gf_AddItemEx({2,96,112,1,4},"ChiÕc hép ®· bÞ më ra");
		gf_SetTaskByte(TASKID_SW_CHECK_DOUBTFUL_GOODS,2,1)
	end
end
