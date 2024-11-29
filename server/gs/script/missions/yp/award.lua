--½±Àø
Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\class\\clause3.lua");
--Include("\\script\\task\\faction\\faction_item.lua");
Include("\\script\\lib\\itemfunctions.lua");

CUSTOM_AWARD_GIVE_ALL=1
--¸øÊÆÁ¦¹±Ï×Îï
--function yp_aw_giveGXW(nNum)
--	nNum = nNum or 1;
--	local nType = GetTask(TASK_FIELD_PVP_CAMP);
--	if nType == 0 then
--		return 0;
--	end
--	local nTbIDX = 0;
--	if nType == 1 then
--		nTbIDX = 20;
--	elseif nType == 2 then
--		nTbIDX = 21;
--	elseif nType == 3 then
--		nTbIDX = 19;
--	end
--	if nTbIDX ~= 0 then
--		gf_AddItemEx({tPVPItemInfo[nTbIDX][2],tPVPItemInfo[nTbIDX][3],tPVPItemInfo[nTbIDX][4],nNum},tPVPItemInfo[nTbIDX][1])
--	end
--end

--ÊÀ½çÃØ¼®
--function yp_aw_addBook(nType,nLock)
--	nLock = nLock or 1;
--	local tWorldBook = {
--		{"³¤È­Æ×",{0,107,51,1}},
--		{"ÏóĞÎÆ×",{0,107,52,1}},
--		{"ÖĞÆ½Æ×",{0,107,53,1}},
--		{"¿ªÉ½Æ×",{0,107,54,1}},
--		{"ÆøÁÆÊõ",{0,107,55,1}},
--		{"ËéÒ¶Æ×",{0,107,56,1}},
--		{"¾ÛÔª¹¦Æ×",{0,107,57,1}},
--		{"ĞşÊ¯¹¦Æ×",{0,107,58,1}},
--		{"½ğ²õÆ×",{0,107,59,1}},
--		{"ĞŞÂŞÃØ¼®",{0,107,60,1}},
--		{"ÌìÏ¼ÃØ¼®",{0,107,64,1}},
--		{"×ÏÏ¼ÃØ¼®",{0,107,65,1}},
--		{"Õ´ÒÂÆ×",{0,107,66,1}},
--	};
--	local tWorldBook2 = {
--		{"ËÄÁéÕ½ÒâÆ×", {0,107,159,1}},
--		{"ËÄÁéÌìÒÂÆ×", {0,107,160,1}},
--		{"ËÄÁé×ÏÒÂÆ×", {0,107,161,1}},
--	};
--	local tBookTemp = {};
--	if nType == 1 then
--		tBookTemp = tWorldBook;
--	else
--		tBookTemp = tWorldBook2;
--	end
--	local nRand = random(1,getn(tBookTemp));
--	gf_AddItemEx({tBookTemp[nRand][2][1],tBookTemp[nRand][2][2],tBookTemp[nRand][2][3],1,nLock},tBookTemp[nRand][1]);
--end

--¸ø¾­Ñé
--function yp_aw_addExp(nArg)
--	local nLv = GetLevel();
--	local nExp = floor(nLv*nLv*nArg);
--	gf_Modify("Exp",nExp);
--end

--tWSItem = {
--	[1] = {
--		{{2,95,586,1,4},"ÁúÎÆ¿Ì°å¡¾Í·²¿1¼¶¡¿"},
--		{{2,95,589,1,4},"·ïÎÆ¿Ì°å¡¾ÒÂ·ş1¼¶¡¿"},
--		{{2,95,592,1,4},"»¢ÎÆ¿Ì°å¡¾ÏÂ×°1¼¶¡¿"},
--		{{2,95,595,1,4},"»¨ÎÆ¿Ì°å¡¾Ê×ÊÎ1¼¶¡¿"},
--	},
--	[2] = {
--		{{2,95,587,1},"ÁúÎÆ¿Ì°å¡¾Í·²¿2¼¶¡¿"},
--		{{2,95,590,1},"·ïÎÆ¿Ì°å¡¾ÒÂ·ş2¼¶¡¿"},
--		{{2,95,593,1},"»¢ÎÆ¿Ì°å¡¾ÏÂ×°2¼¶¡¿"},
--		{{2,95,596,1},"»¨ÎÆ¿Ì°å¡¾Ê×ÊÎ2¼¶¡¿"},
--	},
--	[3] = {
--		{{2,95,588,1},"ÁúÎÆ¿Ì°å¡¾Í·²¿3¼¶¡¿"},
--		{{2,95,591,1},"·ïÎÆ¿Ì°å¡¾ÒÂ·ş3¼¶¡¿"},
--		{{2,95,594,1},"»¢ÎÆ¿Ì°å¡¾ÏÂ×°3¼¶¡¿"},
--		{{2,95,597,1},"»¨ÎÆ¿Ì°å¡¾Ê×ÊÎ3¼¶¡¿"},
--	},	
--}
--
--function yp_aw_wenshi(nItemLv,nRand,nNum,strType)
--	strType = strType or "";
--	gf_SetLogCaption("fieldPVP");
--	gf_AddItemEx(tWSItem[nItemLv][nRand][1],tWSItem[nItemLv][nRand][2],nNum);
--	gf_SetLogCaption("");
--end

--tAllAward = {
--	[1] = { --Ê¥Îï£¨ok£©
--		subclauses = {
--			{{"¾­Ñé";giveClause =function() yp_aw_addExp(20*2) end},7000},
--			{{"¾«Á¶½ğÏ¬", {2,1,533,1},}, 200},
--			{{"½ğÁê¾Æ", {2,95,822,1},}, 500},
--			{{"²Ø½£ÃØ´«ĞÄ¾­", {2,95,823,1},}, 500},
--			{{"ğ©ÔÂËéÆ¬", {2,95,740,1,4},}, 700},
----			{{"ĞşÊ¯½ğ¾«", {2,201,3,1},}, 40},
----			{{"ôä´äÄ¾¾«", {2,201,5,1},}, 40},
----			{{"ÔÂ»ªË®¾«", {2,201,7,1},}, 40},
----			{{"¾ÅÓÄ»ğ¾«", {2,201,9,1},}, 40},
----			{{"ÄıÓñÍÁ¾«", {2,201,11,1},},40},
--			{{"ÎäÁÖÃËĞÅÎï", {2,95,935,1},}, 1000},	
--			{{"ÎäÁÖÃË±íÕÃĞÅ", {2,95,936,1}}, 100},
--		},
--		giveClause = ClauseRandom.giveClause,
--	},
--	[2] = {--²Ø½£ÃØ´«ĞÄ¾­(ok)
--		subclauses = {
--			{{"ğ©ÔÂËéÆ¬", {2,95,740,5,4},}, 2500},
----			{{"ĞşÊ¯½ğ¾«", {2,201,3,1},}, 1500},
----			{{"ôä´äÄ¾¾«", {2,201,5,1},}, 1500},
----			{{"ÔÂ»ªË®¾«", {2,201,7,1},}, 1500},
----			{{"¾ÅÓÄ»ğ¾«", {2,201,9,1},}, 1500},
----			{{"ÄıÓñÍÁ¾«", {2,201,11,1},},1500},	
--			{{"½ğÁê¾Æ", {2,95,822,1},}, 7500},
--		},
--		giveClause = ClauseRandom.giveClause,
--	},
--	[3] = { --°ÙÏşÉúÃØ·¨(ok)
--		maxRand = 10000,
--		subclauses = {
--			{{"¸ß¼¶ÃØ¼®";giveClause =function() giveFactionBook(1,4) end},300},
--			{{"Ê¦ÃÅÕæ¾í";giveClause =function() giveFactionBook(4,4) end},20},
----			{{"ÊÀ½çÃØ¼®";giveClause =function() yp_aw_addBook(1,4) end},3990},
----			{{"ÎäÁÖÃËĞÅÎï", {2,95,935,1},}, 700},	
--		},
--		giveClause = ClauseRandomAll.giveClause,
--	},
--	[4] = { --ÉñÃØÊ÷ÖÖ(ok)
--		subclauses = {
--			{{"Ê¦ÃÅÕæ¾í";giveClause =function() giveFactionBook(4,4) end,}, 10},
--			{{"¸ß¼¶ÃØ¼®";giveClause =function() giveFactionBook(1,4) end}, 500},
--			{{"ËÄÁéÕ½ÒâÆ×", {0,107,159,1,4},"¹§Ï²$nÔÚÁìÈ¡ÉñÃØ¹ÅÊ÷½±ÀøÊ±£¬»ñµÃ$i£¡"}, 3},
--			{{"ËÄÁéÌìÒÂÆ×", {0,107,160,1,4},"¹§Ï²$nÔÚÁìÈ¡ÉñÃØ¹ÅÊ÷½±ÀøÊ±£¬»ñµÃ$i£¡"}, 4},
--			{{"ËÄÁé×ÏÒÂÆ×", {0,107,161,1,4},"¹§Ï²$nÔÚÁìÈ¡ÉñÃØ¹ÅÊ÷½±ÀøÊ±£¬»ñµÃ$i£¡"}, 3},
--			{{"ĞşÊ¯½ğ¾«", {2,201,3,1},}, 400},
--			{{"ôä´äÄ¾¾«", {2,201,5,1},}, 400},
--			{{"ÔÂ»ªË®¾«", {2,201,7,1},}, 400},
--			{{"¾ÅÓÄ»ğ¾«", {2,201,9,1},}, 400},
--			{{"ÄıÓñÍÁ¾«", {2,201,11,1},},400},	
--			{{"ÎäÁÖÃËĞÅÎï", {2,95,935,1},}, 3000},	
--			{{"ÎäÁÖÃË±íÕÃĞÅ", {2,95,936,3}}, 1000},
--			{{"·ï¾«µ¤", {2,95,916,1}}, 480},
--			{{"¶ÔÕ½¾­Ñé";giveClause =function() yp_setValue(4,20) end},1000},
--			{{"PVPµãÊı";giveClause =function() yp_setValue(2,20) end},1000},
--			{{"ÎäÁÖÃËÉùÍû";giveClause =function() yp_setValue(5,10) end},1000},
--		},
--		giveClause = ClauseRandom.giveClause,		
--	},
--};

--Ê¥Îï½±Àø(ok)
function yp_aw_giveAward_1()
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("preach_relic", 0)
	--ÈÎÎñ´¥·¢
	Include("\\script\\global\\events.lua")
	EventOnTrigger(7, {name="Thu thËp Ngò Hµnh T©m Hån §¬n", category=random(5)});
end

--²Ø½£ÃØ´«ĞÄ¾­(ok)
function yp_aw_giveAward_2()
	if gf_Judge_Room_Weight(3,30,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("preach_HeartSutra99", 0)
--	yp_setValue(4,10);
--	yp_aw_giveGXW(2);
--	gf_AddItemEx({2,95,925,2},"ÒåÆø¾Æ");
--	tAllAward[2]:giveClause();
--	Observer:onEvent(OE_FILED_PVP_DATA,{5,1});
end

--°ÙÏşÉúÃØ·¨(ok)
function yp_aw_giveAward_3()
	if gf_Judge_Room_Weight(3,30,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("preach_arcane99", 0)
--	yp_setValue(2,10);
--	yp_aw_giveGXW(3);
--	gf_AddItemEx({2,95,925,2},"ÒåÆø¾Æ");
--	tAllAward[3]:giveClause();
----	Observer:onEvent(OE_FILED_PVP_DATA,{5,2});
end

--Npc¾üÍÅÏûÊ§
function yp_aw_giveAward_4()
	if gf_Judge_Room_Weight(2,10,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("npc_legion_disappear", CUSTOM_AWARD_GIVE_ALL)
--	yp_aw_addExp(80*10);
--	yp_setValue(4,20);
----	MP_MasterAddPoint(5000);
----	yp_aw_giveGXW(3);
--	gf_AddItemEx({2,95,740,2,4},"ğ©ÔÂËéÆ¬");
--	gf_AddItemEx({2,95,936,10},'ÎäÁÖÃË±íÕÃĞÅ');
end

--Npc¾üÍÅ°ü¹ü
function yp_aw_giveAward_5()
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("npc_legion_package", CUSTOM_AWARD_GIVE_ALL)
--	local nMapID = GetWorldPos();
--	local tBossName = {[6000] = "´óÀíÌìÁúËÂ×¡³Ö",[6100] = "ÍÂŞ¬»¯ÉúËÂ³à°Í",[6200] = "Î÷ÏÄÕ÷ÄÏ½«¾ü",}
--	local nRand = random(1,100);
--	if nRand <= 10 then
--		local nRoute = GetPlayerRoute();
--		local nBody = GetBody();
--		local nRet,nIDX = ef_AddShineSunEquip(nRoute,nBody,1,4);
--		if nRet == 1 then
--			local strName = GetItemName(nIDX);
--			Msg2Global(format("%s¿ªÆô»÷°Ü%sºóÁôÏÂµÄÎïÆ·£¬»ñµÃ%s£¡",GetName(),tBossName[nMapID],strName));
--		end
--	else
--		gf_AddItemEx({tPVPItemInfo[7][2],tPVPItemInfo[7][3],tPVPItemInfo[7][4],1},tPVPItemInfo[7][1]);
--	end
--	yp_setValue(2,20);
end

--Íµ¾­ÊéÈÎÎñ(ok)
function yp_aw_giveAward_6()
	if gf_Judge_Room_Weight(3,30,"") ~= 1 then
		return 0;
	end
	local nStep = gf_GetTaskByte(TASK_FIELD_PVP_STEAL_STEP,1);
	local nFinish = gf_GetTaskByte(TASK_FIELD_PVP_STEAL_STEP,2);
	if nStep < 0 or nStep > 6 then
		nStep = 6;
	end
	local tAward = {
		"StealingBooks_a",
    "StealingBooks_b",
    "StealingBooks_c",
    "StealingBooks_d",
    "StealingBooks_e",
    "StealingBooks_f",
    "StealingBooks_g",
	}
	local szAward = tAward[nStep+1]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
	gf_SetTaskByte(TASK_FIELD_PVP_STEAL_STEP,2,nFinish+1);	
	--ÈÎÎñ´¥·¢
	Include("\\script\\global\\events.lua")
	EventOnTrigger(7, {name="Thu thËp Néi C«ng T©m Kinh", category=nStep+1});
end

--ÖÖ×Ó½½Ë®½±Àø(ok)
function yp_aw_giveAward_7(nLevel, nIdx)
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	if not tSeedName[nLevel] or not tSeedName[nLevel][nIdx] then
		return 0
	end
	local szAward = tSeedName[nLevel][nIdx][4]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
end

--ÓñÆÇ½±Àø
function yp_aw_giveAward_8(nType)
	if gf_Judge_Room_Weight(2,10,"") ~= 1 then
		return 0;
	end
	if nType > 4 or nType <= 0 then 
		return 0;
	end	
	local tAward = {
		"JadeSoul0",
        "JadeSoul1",
        "JadeSoul2",
        "JadeSoul3",
	}
	local szAward = tAward[nType]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
--	local tTemp = {
--		[1] = {
----			"yp_aw_addExp(80*5)",
----			"yp_aw_addBook(2,4)",
--		},
--		[2] = {
----			"yp_aw_addExp(80*3)",
--			"gf_AddItemEx({2,95,936,5},'ÎäÁÖÃË±íÕÃĞÅ')",
--		},
--		[3] = {
----			"yp_aw_addExp(80*2)",
--			"giveFactionBook(1,4)",
--			"gf_AddItemEx({2,95,936,4},'ÎäÁÖÃË±íÕÃĞÅ')",
--		},
--		[4] = {
----			"yp_aw_addExp(80)",
--			"yp_aw_wenshi(1,random(1,4),1)",
--			"gf_AddItemEx({2,95,936,3},'ÎäÁÖÃË±íÕÃĞÅ')",
--		},		
--	}
--	for i = 1,getn(tTemp[nType]) do
--		dostring(tTemp[nType][i]);
--	end
end

--Íê³ÉÖÖÖ²ÈÎÎñ
function yp_aw_giveAward_9()
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	SetTask(TASK_FIELD_PVP_SEED_SUR,0);
	CustomAwardGiveGroup("tree_mission", CUSTOM_AWARD_GIVE_ALL)
--	yp_aw_giveGXW(4);
--	local nRand = random(1,1000);
--	if nRand <= 500 then
--		gf_AddItemEx({2,95,925,1},"ÒåÆø¾Æ");
--	end
--	yp_setValue(5,10);
----	MP_MasterAddPoint(500);
--	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
--	if nCamp ~= 0 then
--		yp_addCharm(nCamp,5);
--	end	
--	Observer:onEvent(OE_FILED_PVP_DATA,{3});
--	ds_PVP:AddStatValue(1,8,1);
end

--Íê³ÉÍµÈ¡¹ûÊµÈÎÎñ(ok)
function yp_aw_giveAward_10()
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	SetTask(TASK_FIELD_PVP_SEED_STEAL,0);
	CustomAwardGiveGroup("tree_steal", CUSTOM_AWARD_GIVE_ALL)
	
--	yp_aw_addExp(40);
--	yp_setValue(2,20);
--	yp_aw_giveGXW(4);
----	MP_MasterAddPoint(500);
--	yp_setValue(5,10);
--	local nRand = random(1,1000);
--	if nRand <= 499 then
--		gf_AddItemEx({2,95,935,1},"ÎäÁÖÃËĞÅÎï");
--	elseif nRand <= 500 then
--		giveFactionBook(4,4);
--	else
--		ModifyPopur(200, 0);
--		Msg2Player("Äú»ñµÃÁË200µãĞŞÎª£¡");
--	end
--	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
--	if nCamp ~= 0 then
--		yp_addCharm(nCamp,5);
--	end	
----	Observer:onEvent(OE_FILED_PVP_DATA,{4});
end

--ÖÖÖ²±¾ÈË½±Àø(ok)
function yp_aw_giveAward_11()
	if gf_Judge_Room_Weight(3,30,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("tree_mature1", 0)
--	yp_aw_addExp(80*4);
--	gf_AddItemEx({2,95,935,3},"ÎäÁÖÃËĞÅÎï");
--	gf_AddItemEx({2,95,936,10},"ÎäÁÖÃË±íÕÃĞÅ");
--	yp_setValue(2,20);
--	yp_setValue(4,20);
--	yp_setValue(5,20);
--	a[4]:giveClause();
end

--ÖÖÖ²ÆäËüÈË½±Àø(ok)
function yp_aw_giveAward_12()
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("tree_mature3", 0)
--	tAllAward[4]:giveClause();
--	MP_MasterAddPoint(1000);
end

--±¦²ØÈÎÎñ(ok)
function yp_aw_giveAward_13()
	if gf_Judge_Room_Weight(5,200,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("treasure_mission1", CUSTOM_AWARD_GIVE_ALL)
	return 1
	
--	yp_aw_addExp(40*2);
--	yp_setValue(2,20);
--	yp_setValue(5,10);
--	yp_aw_giveGXW(3);
----	MP_MasterAddPoint(500);
--	local nRand = random(1,1000);
--	if nRand <= 450 then
--		gf_AddItemEx({2,95,935,1},"ÎäÁÖÃËĞÅÎï");
--	elseif nRand <= 460 then
--		gf_AddItemEx({2,100,45,1},"ÌìÃÅ½ğÎÄ»¢·û");
--	elseif nRand <= 500 then
--		gf_AddItemEx({2,95,925,1},"ÒåÆø¾Æ");
--	else
--		ModifyPopur(200, 0);
--		Msg2Player("Äú»ñµÃÁË200µãĞŞÎª£¡");
--	end
--	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
--	if nCamp ~= 0 then
--		yp_addCharm(nCamp,8);
--	end	
----	ds_PVP:AddStatValue(1,11,1);
end

--ÔËïÚ³É¹¦(ok)
function yp_aw_giveAward_14(nType,nDouble)
	nDouble = nDouble or 1;
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	local tAward = {
		"ChargeDart_a",
        "ChargeDart_b",
        "ChargeDart_c",
        "ChargeDart_d",
        "ChargeDart_e",
	}
	local szAward = tAward[nType]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
	--ÈÎÎñ´¥·¢
	Include("\\script\\global\\events.lua")
	EventOnTrigger(7, {name="TÆng quµ"});
end

--ÇÀïÚÈÎÎñ(ok)
function yp_aw_giveAward_15(nType)
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end	
	local tAward = {
		"robbery_a",
        "robbery_b",
        "robbery_c",
        "robbery_d",
        "robbery_e",
	}
	local szAward = tAward[nType]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
end

--Í¶±£·µ»Ø(ok)
function yp_aw_giveAward_16(nType)
--	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
--		return 0;
--	end	
--	local tExpArg = {63,84,105,147,210};
--	local tMoney = {8800,9200,9600,10000,10400};
--	local nExp = tExpArg[nType];
--	local nMoney = tMoney[nType];
--	yp_aw_addExp(nExp);
--	Earn(nMoney);
--	ds_PVP:AddStatValue(1,18,1);
end

--ÉÍ½ğ½±Àø(ok)
function yp_aw_giveAward_17(nNum)
	if gf_Judge_Room_Weight(4,40,"") ~= 1 then
		return 0;
	end
	local nType = 0;
	local tNum = {17,9,1,0};
	for i = 1,getn(tNum) do
		if nNum >= tNum[i] then
			nType = i;
			break;
		end
	end
	local tAward = {
		"hunter_a",
        "hunter_b",
        "hunter_c",
        "hunter_d",
	}
	local szAward = tAward[getn(tAward)-nType+1]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
		--yp_setValue(5,30)--ÉùÍû
	end
	--ÈÎÎñ´¥·¢
	Include("\\script\\global\\events.lua")
	EventOnTrigger(7, {name="Thiªn ¢m LÖnh Bµi", category=getn(tAward)-nType+1});
end

--¹±Ï×¶È½±Àø
function yp_aw_giveAward_18(nNum)
	if gf_Judge_Room_Weight(4,30,"") ~= 1 then
		return 0;
	end
	local nType = 0;
	local tNum = {5000,2100,1500,1200,900};
	local tAward = {
		"Contribute_Point_5000",
		"Contribute_Point_2100",
		"Contribute_Point_1500",
		"Contribute_Point_1200",
		"Contribute_Point_900",
	}
	for i = 1,getn(tNum) do
		if nNum >= tNum[i] then
			nType = i;
			break;
		end
	end
	if nType == 0 then
		return 0;
	end
--	local tTemp = {
--		[1] = {
--			"gf_AddItemEx({2,95,935,70},'ÎäÁÖÃËĞÅÎï')",
--		},		
--		[2] = {
--			"gf_AddItemEx({2,95,935,30},'ÎäÁÖÃËĞÅÎï')",
--			"gf_AddItemEx({2,95,936,5},'ÎäÁÖÃË±íÕÃĞÅ')",
--			"gf_AddItemEx({2,95,925,5},'ÒåÆø¾Æ')",
--			"gf_AddItemEx({2,95,916,1},'·ï¾«µ¤')",
--			"yp_setValue(2,100)",
--		},
--		[3] = {
--			"gf_AddItemEx({2,95,905,1},'¶şµÈ»ÆÌ´ÏÉÖÖ')",
--			"gf_AddItemEx({2,95,822,1},'½ğÁê¾Æ')",
--		},
--		[4] = {
--			"gf_Modify('Popur', 500)",
--		},
--		[5] = {
--			"yp_aw_addExp(80*10)",
--		},		
--	}
	local szAward = tAward[nType]
	if CustomAwardCheckCondition(szAward) == 1 then
		SetTask(TASK_FIELD_PVP_GXD_WARD,1);
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
end

--±¦²Ø½±Àø
function yp_aw_giveAward_19(nType)
	if gf_Judge_Room_Weight(3,100,"") ~= 1 then
		return 0;
	end
	local tAward = {
		"treasure_d",
        "treasure_e",
        "treasure_f",
        "treasure_g",
	}
	local szAward = tAward[nType]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
--	if nType == 1 then
--			Earn(1000);
--	elseif nType == 2 then
--		gf_AddItemEx({2,95,740,1,4},"ğ©ÔÂËéÆ¬");
--	elseif nType == 3 then
--		yp_setValue(2,5);
--	else
--		local nRand = random(1,100);
--		if nRand <= 50 then
--			local nRand2 = random(638,643);
--			local tName = {
--				[638] = "±ê×¼ºÀ½ÜÌ×",
--				[639] = "¿ıÎàºÀ½ÜÌ×",
--				[640] = "ĞÔ¸ĞºÀ½ÜÌ×",
--				[641] = "½¿Ğ¡ºÀ½ÜÌ×",
--				[642] = "±ê×¼´ò»¢Ì×",
--				[643] = "¿ıÎàÁúÏèÌ×",
--			};
--			AddItem(0,108,nRand2,1,5);--»»³ÉÍâ×°
--			AddItem(0,109,nRand2,1,5);--»»³ÉÍâ×°
--			AddItem(0,110,nRand2,1,5);--»»³ÉÍâ×°
--			Msg2Global(format("%s´ò¿ª¾ªÊÀ±¦²Ø»ñµÃ%s£¡",GetName(),tName[nRand2]))
--			WriteLog(format("[%s] [Sucess] [AddItem] [role:%s(acc:%s)] [%s]",
--				strLog, GetName(), GetAccount(), tName[nRand2]));			
--		else
--			gf_AddItemEx({2,95,918,50,4},"ÕòÔ¶»»ïÚÁî");
--		end
--	end
end

--xx±¦²Ø
function yp_aw_giveAward_20(nType)
	if gf_Judge_Room_Weight(1,30,"") ~= 1 then
		return 0;
	end
	if nType <= 0 or nType > 3 then
		return 0;
	end
	local tAward = {
		"treasure_a",
        "treasure_b",
        "treasure_c",
	}
	local szAward = tAward[nType]
	if szAward then
		CustomAwardGiveGroup(szAward, CUSTOM_AWARD_GIVE_ALL)
	end
--	local tTemp = {
--		[1] = {
----			"MP_MasterAddPoint(500)",
--			"yp_setValue(4,200)",
--		},		
--		[2] = {
--			"gf_AddItemEx({2,95,936,10},'ÎäÁÖÃË±íÕÃĞÅ')",
----			"MP_MasterAddPoint(500)",
--		},
--		[3] = {
----			"MP_MasterAddPoint(500)",
--			"yp_setValue(2,200)",
--		}		
--	}
--	for i = 1,getn(tTemp[nType]) do
--		dostring(tTemp[nType][i]);
--	end
end