--Íæ¼ÒµÄÌ«Ðé¹ÅÊ÷

Include("\\script\\missions\\yp\\award.lua");

function main() --npcÊ÷µÄ¶Ô»°
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	local nCurStep = GetUnitCurStates(nNpcIDX,0);
	local nFinish = GetUnitCurStates(nNpcIDX,5);
	local nPlantTime = GetTask(TASK_FIELD_PVP_TREE_TIME);
	if GetNpcTempData(nNpcIDX, 1) == PlayerIndex then
		if nFinish == 0 then
			Talk(1,"","Ng­¬i ®· nhËn phÇn th­ëng cña c©y nµy!");
			return 0;
		end
		if nCurStep ~= 3 then
			Talk(1,"",format("C©y nµy vÉn ch­a chÝn, c¸ch thêi gian chÝn cßn <color=yellow>%s<color>.",Get_Time_String(120*60 - (GetTime()-nPlantTime),"hms")));
		else
			Say("Chóc mõng, Th¸i H­ Cæ Thô ®· chÝn.",
				2,
				"\n NhËn phÇn th­ëng/#pl_getAward(1,"..nNpcIDX..")",
				"\nKÕt thóc ®èi tho¹i/nothing")
		end
	else
		if nCurStep ~= 3 then
			Talk(1,"","Ta lµ mét mÇm c©y nhá, mau mau tr­ëng thµnh!");
		else
			Say("Mµu xanh cña cµnh l¸ d­íi ¸nh n¾ng mÆt trêi, b¹n nhÑ nhµng ngöi mïi h­¬ng trong kh«ng khÝ. V« sè ký øc l¹i trµn vÒ trong ®Çu, h×nh d¸ng quen thuéc ®ã l¹i hiÖn ra tr­íc m¾t.",
				2,
				"\n NhËn phÇn th­ëng/#pl_getAward(2,"..nNpcIDX..")",
				"\nKÕt thóc ®èi tho¹i/nothing")			
		end
	end
end

function pl_getAward(nType,nNpcIDX)
	if nType == 1 then
		if gf_Judge_Room_Weight(2,10,"") == 1 then
--			SetNpcLifeTime(nNpcIDX,0);
			SetTask(TASK_FIELD_PVP_TREE_IDX,0);
			SetTask(TASK_FIELD_PVP_TREE_TIME,0);
			SetTask(TASK_FIELD_PVP_TREE_SHOWTIME,0);
			AddUnitStates(nNpcIDX,5,-GetUnitCurStates(nNpcIDX,5));
--			Talk(1,"","½±ÀøÎ´¼Ó£¡");
			yp_aw_giveAward_11();
			local nNum = GetUnitCurStates(nNpcIDX,6);
			local nFinish = GetUnitCurStates(nNpcIDX,5); 			
			if nNum == 0 and nFinish == 0 then
				SetNpcLifeTime(nNpcIDX,0)
			end			
		end
	elseif nType == 2 then
		local nNum = GetUnitCurStates(nNpcIDX,6);
		local nFinish = GetUnitCurStates(nNpcIDX,5); 
		if nNum <= 0 then
			Talk(1,"","§· nhËn phÇn th­ëng cña c©y nµy råi!");
			return 0;
		end
		local nLsatTime = GetTask(TASK_FIELD_PVP_TREE_AWARD_CD)
		if nLsatTime ~= 0 and GetTime() - nLsatTime < 60 then
			Talk(1,"","Gi·n c¸ch nhËn th­ëng lµ 1 phót!");
			return 0;
		end
		if gf_Judge_Room_Weight(1,10,"") == 1 then
			SetTask(TASK_FIELD_PVP_TREE_AWARD_CD,GetTime());
			AddUnitStates(nNpcIDX,6,-1);
			if nNum == 1 and nFinish == 0 then
				SetNpcLifeTime(nNpcIDX,0)
			end
--			Talk(1,"","½±ÀøÎ´¼Ó£¡");
			yp_aw_giveAward_12();
		end
	end
end
