Include("\\script\\online\\olympic\\oly_head.lua")

function main()
	if oly_Is_LevelSkill() ~= 1 then
		return 0;
	end
	if oly_IsActivityOpen() ~= 1 then
		return 0;
	end
	local tbSay = {
		"Dïng 5 lo¹i Th¸nh Háa Th¹ch ®¬n s¾c ®Ó th¾p s¸ng/free_fire",
		"Dïng Ngò S¾c Th¸nh Háa Th¹ch ®Ó th¾p s¸ng/ib_fire",
		"KiÓm tra sè lÇn th¾p s¸ng cña server/oly_GetFireCount",
		"\n rót lui/do_nothing",
	}
	local nCount = gf_GetMyTaskByte(VET_OLY_TASK2,1,2);
	local nIndex = oly_GetCountStep(nCount);
	local sTitle = ""
	if nIndex ~= 0 then
		sTitle = "Ngò S¾c Th¸nh Háa Th¹ch: B¹n ®· tÝch lòy th¾p s¸ng %d lÇn, tiÕp tôc th¾p s¸ng thªm %d lÇn sÏ nhËn ®­îc phÇn th­ëng %s";
		sTitle = format(sTitle,nCount,OLY_ACCUMULATE_FIRE_AWARD_TABLE[nIndex][1]-nCount,OLY_ACCUMULATE_FIRE_AWARD_TABLE[nIndex][4]);
	else
		sTitle = "Ngò S¾c Th¸nh Háa Th¹ch: Ng­¬i ®· th¾p s¸ng %d lÇn,®· nhËn ®­îc tÊt c¶ phÇn th­ëng.";
		sTitle = format(sTitle,nCount);
	end
	if nCount >= OLY_ACCUMULATE_FIRE_AWARD_TABLE[getn(OLY_ACCUMULATE_FIRE_AWARD_TABLE)][1] then
		tremove(tbSay, 2);
	end
	Say(sTitle,getn(tbSay),tbSay);
end

function free_fire()
	if gf_GetMyTaskBit(VET_OLY_TASK3, 26, 30) >= 3 then
		Talk(1,"",format("Thµnh Háa §µn cña mçi thµnh thÞ chØ ®­îc th¾p s¸ng %d lÇn/ngµy", 3));
		return 0;
	end
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
  		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
  		return 0;
	end
	--µÀ¾ßÆëÈ«
	local tempTb = "Kh«ng ®ñ vËt phÈm th¾p s¸ng ch­a thµnh c«ng: \n";
	local nFlag = 0;
	for i=1,getn(Flame_Table) do
		if GetItemCount(Flame_Table[i][1],Flame_Table[i][2],Flame_Table[i][3]) < 1 then
		 tempTb = tempTb..Flame_Table[i][5].." ";
		 nFlag = 1;
		end
	end
	if nFlag == 1 then
		Talk(1,"",tempTb);
		return 0;
	end	
	--É¾³ýµÀ¾ß
	nFlag = 0;
	for i=1,getn(Flame_Table) do
		if DelItem(Flame_Table[i][1],Flame_Table[i][2],Flame_Table[i][3],1) ~= 1 then
			nFlag = 1;
		end
	end
	if nFlag == 1 then
		return -1;
	end
	--±ê¼ÇÖÃ1
	gf_SetMyTaskBit(VET_OLY_TASK3, 26, 30, gf_GetMyTaskBit(VET_OLY_TASK3, 26, 30) + 1,TASK_ACCESS_CODE_OLYMPIC);
	SetCurrentNpcSFX(GetTargetNpc(),975,2,0,3);
	--µ±ÈÕµã»ð´ÎÊý
	if gf_GetTaskByte(VET_OLY_TASK,1) < 18 then
		gf_SetTaskByte(VET_OLY_TASK,1,gf_GetTaskByte(VET_OLY_TASK,1) + 1,TASK_ACCESS_CODE_OLYMPIC);
	end
	--ÀÛ¼Æµã»ð´ÎÊý
	--oly_Accumulate_FireNum();
	--¸ø½±Àø2
	--oly_GiveAward2();
	ModifyExp(666000)
	gf_AddItemEx2({2,1,30747,1,4}, "Hép Trang TrÝ Gi¸ng Sinh", "Ho¹t ®éng Th¸nh Háa", "PhÇn th­ëng th¾p s¸ng", 0, 1)
	gf_WriteLogEx("ThanhHoaDan", "Thap Sang", 1,"MienPhi ThanhCong")
	CustomAwardGiveGroup("Fire_Single", 0);
	--È«·þµã»ð´ÎÊý
	oly_AddFireCount(1);
end

function ib_fire()
	AskClientForNumber("ib_fire_Rec",1,min(OLY_IB_FIRE_MAX_NUM,GetItemCount(WuCai_ShenHuoZhong[1],WuCai_ShenHuoZhong[2],WuCai_ShenHuoZhong[3])),"H·y  nhËp sè lÇn th¾p s¸ng vµo :");
end

function ib_fire_Rec(nNum)
	if not nNum or nNum <= 0 then
		return
	end
	SetCurrentNpcSFX(GetTargetNpc(),975,2,0,3);
	local nCount = 0;
	for i=1,nNum do
		if ib_fire_do() <= 0 then
			break;
		end
		nCount = i
	end
	--È«·þµã»ð´ÎÊý
	oly_AddFireCount(nCount*3);
end

function ib_fire_do()
	if gf_Judge_Room_Weight(2,1,"") ~= 1 then
  		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
  		return 0;
	end
	if GetItemCount(WuCai_ShenHuoZhong[1],WuCai_ShenHuoZhong[2],WuCai_ShenHuoZhong[3]) < 1 then
		Talk(1,"","Kh«ng ®ñ Ngò S¾c Th¸nh Háa Th¹ch, kh«ng thÓ th¾p s¸ng.");
		return 0;
	end
	if DelItem(WuCai_ShenHuoZhong[1],WuCai_ShenHuoZhong[2],WuCai_ShenHuoZhong[3],1) ~= 1 then
		return -1;
	end
	--µ±ÈÕµã»ð´ÎÊý
	if gf_GetTaskByte(VET_OLY_TASK,1) < 18 then
		gf_SetTaskByte(VET_OLY_TASK,1,gf_GetTaskByte(VET_OLY_TASK,1) + 1,TASK_ACCESS_CODE_OLYMPIC);
	end
	--ÀÛ¼Æµã»ð´ÎÊý
	oly_Accumulate_FireNum();
	--¸ø½±Àø3
	--oly_GiveAward3();
	ModifyExp(999000)
	gf_AddItemEx2({2,1,30747,3}, "Hép Trang TrÝ Gi¸ng Sinh", "Ho¹t ®éng Th¸nh Háa", "PhÇn th­ëng th¾p s¸ng", 0, 1)
	gf_WriteLogEx("ThanhHoaDan", "Thap Sang", 1,"CoPhi ThanhCong")
	return CustomAwardGiveGroup("Fire_Five", 0);
end