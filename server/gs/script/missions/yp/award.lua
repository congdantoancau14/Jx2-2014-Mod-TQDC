--����
Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\class\\clause3.lua");
--Include("\\script\\task\\faction\\faction_item.lua");
Include("\\script\\lib\\itemfunctions.lua");

CUSTOM_AWARD_GIVE_ALL=1
--������������
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

--�����ؼ�
--function yp_aw_addBook(nType,nLock)
--	nLock = nLock or 1;
--	local tWorldBook = {
--		{"��ȭ��",{0,107,51,1}},
--		{"������",{0,107,52,1}},
--		{"��ƽ��",{0,107,53,1}},
--		{"��ɽ��",{0,107,54,1}},
--		{"������",{0,107,55,1}},
--		{"��Ҷ��",{0,107,56,1}},
--		{"��Ԫ����",{0,107,57,1}},
--		{"��ʯ����",{0,107,58,1}},
--		{"�����",{0,107,59,1}},
--		{"�����ؼ�",{0,107,60,1}},
--		{"��ϼ�ؼ�",{0,107,64,1}},
--		{"��ϼ�ؼ�",{0,107,65,1}},
--		{"մ����",{0,107,66,1}},
--	};
--	local tWorldBook2 = {
--		{"����ս����", {0,107,159,1}},
--		{"����������", {0,107,160,1}},
--		{"����������", {0,107,161,1}},
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

--������
--function yp_aw_addExp(nArg)
--	local nLv = GetLevel();
--	local nExp = floor(nLv*nLv*nArg);
--	gf_Modify("Exp",nExp);
--end

--tWSItem = {
--	[1] = {
--		{{2,95,586,1,4},"���ƿ̰塾ͷ��1����"},
--		{{2,95,589,1,4},"���ƿ̰塾�·�1����"},
--		{{2,95,592,1,4},"���ƿ̰塾��װ1����"},
--		{{2,95,595,1,4},"���ƿ̰塾����1����"},
--	},
--	[2] = {
--		{{2,95,587,1},"���ƿ̰塾ͷ��2����"},
--		{{2,95,590,1},"���ƿ̰塾�·�2����"},
--		{{2,95,593,1},"���ƿ̰塾��װ2����"},
--		{{2,95,596,1},"���ƿ̰塾����2����"},
--	},
--	[3] = {
--		{{2,95,588,1},"���ƿ̰塾ͷ��3����"},
--		{{2,95,591,1},"���ƿ̰塾�·�3����"},
--		{{2,95,594,1},"���ƿ̰塾��װ3����"},
--		{{2,95,597,1},"���ƿ̰塾����3����"},
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
--	[1] = { --ʥ�ok��
--		subclauses = {
--			{{"����";giveClause =function() yp_aw_addExp(20*2) end},7000},
--			{{"������Ϭ", {2,1,533,1},}, 200},
--			{{"�����", {2,95,822,1},}, 500},
--			{{"�ؽ��ش��ľ�", {2,95,823,1},}, 500},
--			{{"�����Ƭ", {2,95,740,1,4},}, 700},
----			{{"��ʯ��", {2,201,3,1},}, 40},
----			{{"���ľ��", {2,201,5,1},}, 40},
----			{{"�»�ˮ��", {2,201,7,1},}, 40},
----			{{"���Ļ�", {2,201,9,1},}, 40},
----			{{"��������", {2,201,11,1},},40},
--			{{"����������", {2,95,935,1},}, 1000},	
--			{{"�����˱�����", {2,95,936,1}}, 100},
--		},
--		giveClause = ClauseRandom.giveClause,
--	},
--	[2] = {--�ؽ��ش��ľ�(ok)
--		subclauses = {
--			{{"�����Ƭ", {2,95,740,5,4},}, 2500},
----			{{"��ʯ��", {2,201,3,1},}, 1500},
----			{{"���ľ��", {2,201,5,1},}, 1500},
----			{{"�»�ˮ��", {2,201,7,1},}, 1500},
----			{{"���Ļ�", {2,201,9,1},}, 1500},
----			{{"��������", {2,201,11,1},},1500},	
--			{{"�����", {2,95,822,1},}, 7500},
--		},
--		giveClause = ClauseRandom.giveClause,
--	},
--	[3] = { --�������ط�(ok)
--		maxRand = 10000,
--		subclauses = {
--			{{"�߼��ؼ�";giveClause =function() giveFactionBook(1,4) end},300},
--			{{"ʦ�����";giveClause =function() giveFactionBook(4,4) end},20},
----			{{"�����ؼ�";giveClause =function() yp_aw_addBook(1,4) end},3990},
----			{{"����������", {2,95,935,1},}, 700},	
--		},
--		giveClause = ClauseRandomAll.giveClause,
--	},
--	[4] = { --��������(ok)
--		subclauses = {
--			{{"ʦ�����";giveClause =function() giveFactionBook(4,4) end,}, 10},
--			{{"�߼��ؼ�";giveClause =function() giveFactionBook(1,4) end}, 500},
--			{{"����ս����", {0,107,159,1,4},"��ϲ$n����ȡ���ع�������ʱ�����$i��"}, 3},
--			{{"����������", {0,107,160,1,4},"��ϲ$n����ȡ���ع�������ʱ�����$i��"}, 4},
--			{{"����������", {0,107,161,1,4},"��ϲ$n����ȡ���ع�������ʱ�����$i��"}, 3},
--			{{"��ʯ��", {2,201,3,1},}, 400},
--			{{"���ľ��", {2,201,5,1},}, 400},
--			{{"�»�ˮ��", {2,201,7,1},}, 400},
--			{{"���Ļ�", {2,201,9,1},}, 400},
--			{{"��������", {2,201,11,1},},400},	
--			{{"����������", {2,95,935,1},}, 3000},	
--			{{"�����˱�����", {2,95,936,3}}, 1000},
--			{{"�ﾫ��", {2,95,916,1}}, 480},
--			{{"��ս����";giveClause =function() yp_setValue(4,20) end},1000},
--			{{"PVP����";giveClause =function() yp_setValue(2,20) end},1000},
--			{{"����������";giveClause =function() yp_setValue(5,10) end},1000},
--		},
--		giveClause = ClauseRandom.giveClause,		
--	},
--};

--ʥ�ｱ��(ok)
function yp_aw_giveAward_1()
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("preach_relic", 0)
	--���񴥷�
	Include("\\script\\global\\events.lua")
	EventOnTrigger(7, {name="Thu th�p Ng� H�nh T�m H�n ��n", category=random(5)});
end

--�ؽ��ش��ľ�(ok)
function yp_aw_giveAward_2()
	if gf_Judge_Room_Weight(3,30,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("preach_HeartSutra99", 0)
--	yp_setValue(4,10);
--	yp_aw_giveGXW(2);
--	gf_AddItemEx({2,95,925,2},"������");
--	tAllAward[2]:giveClause();
--	Observer:onEvent(OE_FILED_PVP_DATA,{5,1});
end

--�������ط�(ok)
function yp_aw_giveAward_3()
	if gf_Judge_Room_Weight(3,30,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("preach_arcane99", 0)
--	yp_setValue(2,10);
--	yp_aw_giveGXW(3);
--	gf_AddItemEx({2,95,925,2},"������");
--	tAllAward[3]:giveClause();
----	Observer:onEvent(OE_FILED_PVP_DATA,{5,2});
end

--Npc������ʧ
function yp_aw_giveAward_4()
	if gf_Judge_Room_Weight(2,10,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("npc_legion_disappear", CUSTOM_AWARD_GIVE_ALL)
--	yp_aw_addExp(80*10);
--	yp_setValue(4,20);
----	MP_MasterAddPoint(5000);
----	yp_aw_giveGXW(3);
--	gf_AddItemEx({2,95,740,2,4},"�����Ƭ");
--	gf_AddItemEx({2,95,936,10},'�����˱�����');
end

--Npc���Ű���
function yp_aw_giveAward_5()
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("npc_legion_package", CUSTOM_AWARD_GIVE_ALL)
--	local nMapID = GetWorldPos();
--	local tBossName = {[6000] = "����������ס��",[6100] = "��ެ�����³��",[6200] = "�������Ͻ���",}
--	local nRand = random(1,100);
--	if nRand <= 10 then
--		local nRoute = GetPlayerRoute();
--		local nBody = GetBody();
--		local nRet,nIDX = ef_AddShineSunEquip(nRoute,nBody,1,4);
--		if nRet == 1 then
--			local strName = GetItemName(nIDX);
--			Msg2Global(format("%s��������%s�����µ���Ʒ�����%s��",GetName(),tBossName[nMapID],strName));
--		end
--	else
--		gf_AddItemEx({tPVPItemInfo[7][2],tPVPItemInfo[7][3],tPVPItemInfo[7][4],1},tPVPItemInfo[7][1]);
--	end
--	yp_setValue(2,20);
end

--͵��������(ok)
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
	--���񴥷�
	Include("\\script\\global\\events.lua")
	EventOnTrigger(7, {name="Thu th�p N�i C�ng T�m Kinh", category=nStep+1});
end

--���ӽ�ˮ����(ok)
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

--���ǽ���
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
--			"gf_AddItemEx({2,95,936,5},'�����˱�����')",
--		},
--		[3] = {
----			"yp_aw_addExp(80*2)",
--			"giveFactionBook(1,4)",
--			"gf_AddItemEx({2,95,936,4},'�����˱�����')",
--		},
--		[4] = {
----			"yp_aw_addExp(80)",
--			"yp_aw_wenshi(1,random(1,4),1)",
--			"gf_AddItemEx({2,95,936,3},'�����˱�����')",
--		},		
--	}
--	for i = 1,getn(tTemp[nType]) do
--		dostring(tTemp[nType][i]);
--	end
end

--�����ֲ����
function yp_aw_giveAward_9()
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	SetTask(TASK_FIELD_PVP_SEED_SUR,0);
	CustomAwardGiveGroup("tree_mission", CUSTOM_AWARD_GIVE_ALL)
--	yp_aw_giveGXW(4);
--	local nRand = random(1,1000);
--	if nRand <= 500 then
--		gf_AddItemEx({2,95,925,1},"������");
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

--���͵ȡ��ʵ����(ok)
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
--		gf_AddItemEx({2,95,935,1},"����������");
--	elseif nRand <= 500 then
--		giveFactionBook(4,4);
--	else
--		ModifyPopur(200, 0);
--		Msg2Player("�������200����Ϊ��");
--	end
--	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
--	if nCamp ~= 0 then
--		yp_addCharm(nCamp,5);
--	end	
----	Observer:onEvent(OE_FILED_PVP_DATA,{4});
end

--��ֲ���˽���(ok)
function yp_aw_giveAward_11()
	if gf_Judge_Room_Weight(3,30,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("tree_mature1", 0)
--	yp_aw_addExp(80*4);
--	gf_AddItemEx({2,95,935,3},"����������");
--	gf_AddItemEx({2,95,936,10},"�����˱�����");
--	yp_setValue(2,20);
--	yp_setValue(4,20);
--	yp_setValue(5,20);
--	a[4]:giveClause();
end

--��ֲ�����˽���(ok)
function yp_aw_giveAward_12()
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("tree_mature3", 0)
--	tAllAward[4]:giveClause();
--	MP_MasterAddPoint(1000);
end

--��������(ok)
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
--		gf_AddItemEx({2,95,935,1},"����������");
--	elseif nRand <= 460 then
--		gf_AddItemEx({2,100,45,1},"���Ž��Ļ���");
--	elseif nRand <= 500 then
--		gf_AddItemEx({2,95,925,1},"������");
--	else
--		ModifyPopur(200, 0);
--		Msg2Player("�������200����Ϊ��");
--	end
--	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
--	if nCamp ~= 0 then
--		yp_addCharm(nCamp,8);
--	end	
----	ds_PVP:AddStatValue(1,11,1);
end

--���ڳɹ�(ok)
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
	--���񴥷�
	Include("\\script\\global\\events.lua")
	EventOnTrigger(7, {name="T�ng qu�"});
end

--��������(ok)
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

--Ͷ������(ok)
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

--�ͽ���(ok)
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
		--yp_setValue(5,30)--����
	end
	--���񴥷�
	Include("\\script\\global\\events.lua")
	EventOnTrigger(7, {name="Thi�n �m L�nh B�i", category=getn(tAward)-nType+1});
end

--���׶Ƚ���
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
--			"gf_AddItemEx({2,95,935,70},'����������')",
--		},		
--		[2] = {
--			"gf_AddItemEx({2,95,935,30},'����������')",
--			"gf_AddItemEx({2,95,936,5},'�����˱�����')",
--			"gf_AddItemEx({2,95,925,5},'������')",
--			"gf_AddItemEx({2,95,916,1},'�ﾫ��')",
--			"yp_setValue(2,100)",
--		},
--		[3] = {
--			"gf_AddItemEx({2,95,905,1},'���Ȼ�̴����')",
--			"gf_AddItemEx({2,95,822,1},'�����')",
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

--���ؽ���
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
--		gf_AddItemEx({2,95,740,1,4},"�����Ƭ");
--	elseif nType == 3 then
--		yp_setValue(2,5);
--	else
--		local nRand = random(1,100);
--		if nRand <= 50 then
--			local nRand2 = random(638,643);
--			local tName = {
--				[638] = "��׼������",
--				[639] = "���������",
--				[640] = "�Ըк�����",
--				[641] = "��С������",
--				[642] = "��׼����",
--				[643] = "����������",
--			};
--			AddItem(0,108,nRand2,1,5);--������װ
--			AddItem(0,109,nRand2,1,5);--������װ
--			AddItem(0,110,nRand2,1,5);--������װ
--			Msg2Global(format("%s�򿪾������ػ��%s��",GetName(),tName[nRand2]))
--			WriteLog(format("[%s] [Sucess] [AddItem] [role:%s(acc:%s)] [%s]",
--				strLog, GetName(), GetAccount(), tName[nRand2]));			
--		else
--			gf_AddItemEx({2,95,918,50,4},"��Զ������");
--		end
--	end
end

--xx����
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
--			"gf_AddItemEx({2,95,936,10},'�����˱�����')",
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