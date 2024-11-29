Include("\\script\\lib\\globalvalue.lua")
Include("\\script\\missions\\yp\\hss\\head.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\script\\missions\\yp\\award.lua")
Include("\\script\\lib\\npccmdhead.lua")

---------------------------------------------------------
stageFight = {
	name = "tbTBHSS",
	frequency = 18*2,
	maxsecond = firePhases.maxsecond,
	actionsType = "second",	
}

function stageFight:createSomeNpc()
	local m = this.msPosition:getMapID();
	yp_CreateMonster(tNpcs[m].cdz1,tPos[m].cdz1);
	yp_CreateMonster(tNpcs[m].cdz2,tPos[m].cdz2);
	yp_CreateMonster(tNpcs[m].cdz3,tPos[m].cdz3);
	yp_CreateMonster(tNpcs[m].cdz4,tPos[m].cdz4);
	yp_CreateMonster(tNpcs[m].cdz5,tPos[m].cdz5);
	yp_CreateMonster(tNpcs[m].cdz6,tPos[m].cdz6);
	yp_CreateMonster(tNpcs[m].cdz7,tPos[m].cdz7);
	yp_CreateMonster(tNpcs[m].cdz8,tPos[m].cdz8);
	yp_CreateMonster(tNpcs[m].cdz9,tPos[m].cdz9);
	yp_CreateMonster(tNpcs[m].bt,tPos[m].bt);
--	yp_CreateMonster(tNpcs[m].qhys,tPos[m].qhys);
	local nNpcIdx = yp_CreateMonster(tNpcs[m].tree1,tPos[m].tree1);
	if nNpcIdx ~= 0 then
		SetCurrentNpcSFX(nNpcIdx,948,1,1);
	end
	nNpcIdx = yp_CreateMonster(tNpcs[m].tree2,tPos[m].tree2);
	if nNpcIdx ~= 0 then
		SetCurrentNpcSFX(nNpcIdx,948,1,1);
	end	
	nNpcIdx = yp_CreateMonster(tNpcs[m].tree3,tPos[m].tree3);
	if nNpcIdx ~= 0 then
		SetCurrentNpcSFX(nNpcIdx,948,1,1);
	end		
	yp_CreateMonster(tNpcs[m].dqh,tPos[m].dqh);
	yp_CreateMonster(tNpcs[m].dqr,tPos[m].dqr);
	yp_CreateMonster(tNpcs[m].dxy,tPos[m].dxy);
	yp_CreateMonster(tNpcs[m].db,tPos[m].db);
	yp_CreateMonster(tNpcs[m].dhf,tPos[m].dhf);
	yp_CreateMonster(tNpcs[m].jy1,tPos[m].jy1);
	yp_CreateMonster(tNpcs[m].jy2,tPos[m].jy2);
	local tHwPos = {
		[6000] = {
			[1] = {{1620,2790},{1600,2811},{1550,2754},{1569,2740}},
			[2] = {{1500,2671},{1461,2720},{1431,2756},{1432,2793},{1480,2862},{1523,2837},{1586,2770},{1563,2734}},
			[3] = {{1546,2758},{1606,2816},{1640,2780},{1629,2768},{1605,2793},{1569,2756},{1589,2731},{1579,2720}},
		},
		[6100] = {
			[1] = {{1664,3613},{1704,3650},{1647,3711},{1603,3668}},
			[2] = {{1636,3623},{1621,3609},{1606,3576},{1647,3526},{1689,3499},{1778,3607},{1837,3603},{1774,3796},{1748,3729},{1696,3669},{1673,3624},{1649,3619},{1629,3620}},
			[3] = {{1630,3623},{1603,3667},{1633,3703},{1671,3696},{1701,3665},{1702,3618},{1682,3597},{1640,3621}},
		},
		[6200] = {
			[1] = {{1413,2646},{1469,2588},{1514,2629},{1467,2694}},
			[2] = {{1402,2709},{1392,2732},{1410,2765},{1459,2805},{1495,2798},{1562,2794},{1553,2768},{1560,2738},{1551,2718},{1481,2647},{1423,2685}},
			[3] = {{1406,2653},{1421,2666},{1450,2636},{1472,2657},{1444,2685},{1466,2703},{1516,2638},{1476,2587}},
		},		
	};
	yp_CreateMonster(tNpcs[m].cnhw,tPos[m].cnhw,tHwPos[m][1],AT_SM_PATROL);
	yp_CreateMonster(tNpcs[m].cnhw2,tPos[m].cnhw2,tHwPos[m][3],AT_SM_PATROL);
	yp_CreateMonster(tNpcs[m].hrhw,tPos[m].hrhw,tHwPos[m][2],AT_SM_PATROL);
	
	yp_CreateMonster(tNpcs[m].bgy,tPos[m].bgy);
	yp_CreateMonster(tNpcs[m].ydlb,tPos[m].ydlb);
	yp_CreateMonster(tNpcs[m].cf,tPos[m].cf);
end

function stageFight.init()
	self = stageFight;
--	this:Msg2MSAll("³õÊ¼»¯µØÍ¼NPC...");
	self:createSomeNpc();
end

function stageFight.createFireNpc()
	self = stageFight;
	local m = this.msPosition:getMapID();
	local nTime = tonumber(date("%H%M"));
	local nDate = tonumber(date("%Y%m%d"));
	if GetMissionV(this.mv13) < nDate then
		SetMissionV(this.mv12,0);
		SetMissionV(this.mv13,nDate);
	end	
	for i=1,getn(tCreatTime) do
		if nTime == tCreatTime[i] and GetMissionV(this.mv12) ~= i then
			yp_CreateMonster(tNpcs[m].chd,tPos[m].chd);
			Msg2Global("§· ®Õn thêi gian truyÒn ®¹o cña T©y Vùc, c¸c vÞ ®¹i hiÖp h·y ®Õn thÕ lùc cña m×nh ®Ó nghe ®¹o sÜ truyÒn ®¹o!");
			SetMissionV(this.mv12,i);
			--¼ÓÉÏÌØÐ§--------------------------------
			local tNpcs = GetMapNpcIdx(m);
			for j = 1, getn(tNpcs) do
				local nNpcIDX = tNpcs[j];
				if GetNpcName(nNpcIDX) == "§iÓm Cñi Löa" then
					SetCurrentNpcSFX(nNpcIDX,910,2,1)
				end
			end
			--¼ÓÉÏÌØÐ§--------------------------------			
			break;
		end
	end
end

function stageFight.createFireBox()
	self = stageFight;
	local nTime = tonumber(date("%H%M"));
	local nDate = tonumber(date("%Y%m%d"));
	if GetMissionV(this.mv13) < nDate then
		SetMissionV(this.mv12,0);
		SetMissionV(this.mv13,nDate);
	end	
	for i=1,getn(tCreatTime) do
		if nTime >= tCreatTime[i] and nTime < tCreatTime[i]+15 and GetMissionV(this.mv12) == i then --15·ÖÖÓÄÚ
			local m = this.msPosition:getMapID();
			local nNpcIdx = 0;
			for k = 1,getn(tPos[m].chd) do
				for j = 1,5 do
					nNpcIdx = CreateNpc("Vâ L©m Minh Th¸nh VËt","Vâ L©m Minh Th¸nh VËt",m, tPos[m].chd[k][1], tPos[m].chd[k][2],-1,1,1,150);
					SetNpcScript(nNpcIdx,"\\script\\missions\\yp\\item\\firebox.lua");
					SetNpcLifeTime(nNpcIdx,3*60);
				end
			end
		end
	end
end

function stageFight.moveBiaoche()
	if GetTask(TASK_FIELD_PVP_CAR_START) ~= 1 then
		return 0;
	end
	local nNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nNpcID = GetTask(TASK_FIELD_PVP_CAR_ID);
	local nCurNpcID = GetNpcID(nNpcIdx);
--	print("nNpcID,nCurNpcID",nNpcID,nCurNpcID);
	if nNpcIdx == 0 or nNpcID ~= nCurNpcID then
		Msg2Player("Tiªu Xa cña ng­¬i bÞ ph¸ hñy hoÆc qu¸ thêi gian vËn tiªu vÉn ch­a ®Õn ®Ých, vËn tiªu thÊt b¹i!");
		Talk(1,"","Tiªu Xa cña ng­¬i bÞ ph¸ hñy hoÆc qu¸ thêi gian vËn tiªu vÉn ch­a ®Õn ®Ých, vËn tiªu thÊt b¹i!");
		SetTask(TASK_FIELD_PVP_CAR_START,0);
		SetTask(TASK_FIELD_PVP_CAR_IDX,0);
		SetTask(TASK_FIELD_PVP_CAR_ID,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFE,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFETIME,0);
		return 0;
	end
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nNpcIdx);
	local sMapName = GetMapName(nNpcMapID);
	if nMapID ~= nNpcMapID then --²»ÔÚÍ¬Ò»ÕÅÍ¼
		if sMapName then
			Msg2Player(format("Tiªu Xa cña ng­¬i ®ang dõng ë (%s[%d,%d]), h·y nhanh chãng ®i t×m Tiªu Xa!",sMapName,floor(nNpcPosX/8),floor(nNpcPosY/16)));
		else
			Msg2Player("Ng­¬i c¸ch Tiªu Xa qu¸ xa, h·y nhanh chãng ®i t×m Tiªu Xa nµo!");
		end		
		return 0;
	end
	local nMaxLife,nCurLife = GetUnitCurStates(nNpcIdx,1);
	local nMarkLife = GetTask(TASK_FIELD_PVP_CAR_LIFE);
	if nCurLife < nMarkLife then
		Msg2Player("Tiªu Xa cña ng­¬i ®ang bÞ tÊn c«ng, h·y nhanh chãng ®i hé tiªu nµo!");
		SetTask(TASK_FIELD_PVP_CAR_LIFE,nCurLife);
	end
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
--	print("nDistance",nDistance);
	if nDistance <= 30 then
		g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
		g_NpcAI:setWayPoint(nNpcIdx,{{nPosX,nPosY}});
	else
		if sMapName then
			Msg2Player(format("Tiªu Xa cña ng­¬i ®ang dõng ë (%s[%d,%d]), h·y nhanh chãng ®i t×m Tiªu Xa!",sMapName,floor(nNpcPosX/8),floor(nNpcPosY/16)));
		else
			Msg2Player("Ng­¬i c¸ch Tiªu Xa qu¸ xa, h·y nhanh chãng ®i t×m Tiªu Xa nµo!");
		end
	end
end

function stageFight.checkBiaoche()
	self = stageFight;
	this.msCamp:turnPlayer(0,stageFight.moveBiaoche);
end

function stageFight.callArmy()
	self = stageFight;
	local m = this.msPosition:getMapID();
	local nDate = tonumber(date("%Y%m%d"));
	local nTime = tonumber(date("%H%M"));
	local nType = 0;
	for i = 1,getn(tMainMapID) do
		if tMainMapID[i][1] == m then
			nType = i;
			break;
		end
	end
--	for i=1,getn(tCreatTime) do
		if nTime >= 2115 and nTime < 2200 and GetGlbValue(GLV_YP_CHOOSE_ARMY) == nType and GetGlbValue(GLV_YP_CALL_ARMY) < nDate then
			SetGlbValue(GLV_YP_CALL_ARMY,nDate);
			local tArmyMove = {
				[6000] = {
						{1421,2551},{1449,2549},{1476,2545},{1509,2499},{1528,2464},{1468,2446},{1426,2439},{1412,2486},{1380,2516},
					},
				[6100] = {
						{1685,3196},{1715,3239},{1758,3219},{1822,3297},{1721,3385},{1685,3345},{1653,3285},{1653,3260},{1664,3218},{1644,3191},
					},
				[6200] = {
						{1271,3025},{1242,2956},{1274,2881},{1306,2917},{1327,2964},{1367,2995},{1368,3049},{1363,3065},{1372,3088},{1334,3081},{1295,3142},{1219,3101},
					},
			};
			yp_CreateMonster(tNpcs[m].army1,tPos[m].army,tArmyMove[m],AT_SM_PATROL);
			yp_CreateMonster(tNpcs[m].army2,tPos[m].army,tArmyMove[m],AT_SM_PATROL);
			yp_CreateMonster(tNpcs[m].army3,tPos[m].army,tArmyMove[m],AT_SM_PATROL);
			local strMsg = {
				"Trô tr× §¹i Lý Thiªn Long Tù ®ang truyÒn ®¹o ë Thiªn Long Tù, c¸c hiÖp sÜ phôc vô cho §¹i Lý h·y ®i nghe d¹y b¶o!",
				"XÝch Ba Thæ Phån Hãa Sinh Tù ®ang truyÒn ®¹o ë Quúnh KÕt, c¸c hiÖp sÜ phôc vô cho Thæ Phån h·y ®i nghe d¹y b¶o!",
				"T©y H¹ Chinh Nam T­íng Qu©n ®ang tuÇn tra ë H­ng Kh¸nh, c¸c hiÖp sÜ phôc vô cho T©y H¹ h·y ®i nghe d¹y b¶o!",
			}
			Msg2Global(strMsg[nType]);
			--¼ÇÏÂlog
			WriteLog(format("[T¹o qu©n ®oµn] [Sucess] [Type:%d,Time:%d]",nType,nTime));
		end
--	end
end

function stageFight.createTreasure()
	self = stageFight;
	local m = this.msPosition:getMapID();
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	if nHour >= 7 and nHour <= 23 then
		if nMin == 30 then
			if tBzPos[m] == nil then
				return 0;
			end
			local tCopy = new(tBzPos[m]);
			local tCurTreasure = floyd_rm4n(getn(tCopy),10);
			for i = 1,10 do
--				print("tCurTreasure[i]",tCurTreasure[i]);
				SetMissionV(i,tCurTreasure[i]);
			end
			this:Msg2MSAll("§· t¹o míi ®iÓm kho b¸u cña thÕ lùc!");
		end
	end
end

function pl_useSeed()
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then 
		Talk(1,"","CÇn ph¶i gia nhËp thÕ lùc míi ®­îc dïng vËt phÈm nµy!");
		return 0;
	end
	if tMainMapID[nCamp][1] ~= nMapID then
		Talk(1,"","VËt phÈm nµy chØ ®­îc dïng ë b¶n ®å thÕ lùc t­¬ng øng cña ®¹i hiÖp!");
		return 0;
	end
	local nPlantTime = GetTask(TASK_FIELD_PVP_TREE_TIME);
	if GetTask(TASK_FIELD_PVP_TREE_IDX) ~= 0 or (nPlantTime ~= 0 and GetTime() - nPlantTime < 150) then
		Talk(1,"","Ng­¬i ®· trång 1 Th¸i H­ Cæ Thô!");
		return 0;
	end
	local nDistance = 0;
	local tTemp = {};
	tinsert(tTemp,tPos[nMapID].tree1[1]);
	tinsert(tTemp,tPos[nMapID].tree2[1]);
	tinsert(tTemp,tPos[nMapID].tree3[1]);
	for k = 1,getn(tTemp) do
		local d = abs(nPosX-tTemp[k][1])+abs(nPosY-tTemp[k][2])
		if nDistance == 0 or nDistance > d then
			nDistance = d;
		end
	end
	if nDistance > 40 then
		Talk(1,"","VËt phÈm nµy chØ ®­îc dïng ë xung quanh Th¸i H­ Cæ Thô!");
		return 0;
	end
	if DelItem(2,95,914,1) == 1 then	
		local nIdx = CreateNpc("TxTree_Init",GetName().."-Th¸i H­ Cæ Thô",nMapID,nPosX,nPosY);
		local nCurTime = GetTime();
		if nIdx ~= 0 then
			SetNpcScript(nIdx,"\\script\\missions\\yp\\tls\\plant_npc.lua");
			SetNpcLifeTime(nIdx,150*60);
			SetNpcTempData(nIdx, 1, PlayerIndex)
			AddUnitStates(nIdx,0,1-GetUnitCurStates(nIdx,0));
			SetTask(TASK_FIELD_PVP_TREE_IDX,nIdx);
			SetTask(TASK_FIELD_PVP_TREE_TIME,nCurTime);
			local nTime = tonumber(date("%H%M%S"));
			SetTask(TASK_FIELD_PVP_TREE_SHOWTIME,nTime);		
			tinsert(tPlantInfo,{nIdx,GetName(),GetTime(),1}); --Ë÷Òý Íæ¼ÒÃû ÖÖÖ²Ê±¼ä ½×¶Î
			tPlantInfo.n = nil;
		end
	end
end

g_nGrownTime = 60*60;
g_nFinishTime = 120*60;
g_nKillTime = 150*60;

function stageFight.checkPlant()
	local nNum = getn(tPlantInfo);
	if nNum == 0 then
		return 0;
	end
	
	local nCurTime = GetTime();
	for k,v in tPlantInfo do --Ê±¼ä¹ýÁËÇåµô
		local nDisTime = nCurTime - tPlantInfo[k][3];
		if nDisTime > g_nKillTime then
			tPlantInfo[k] = nil;
		end
	end
	nNum = getn(tPlantInfo);
	if nNum == 0 then
		return 0;
	end
	
	for i,v in tPlantInfo do
		local nDisTime = nCurTime - tPlantInfo[i][3];
		local nNewIdx = 0;
		local nMapID,nPosX,nPosY = GetNpcWorldPos(tPlantInfo[i][1]);
		local nCamp = 0;
		for j = 1,getn(tMainMapID) do
			if tMainMapID[j][1] == nMapID then
				nCamp = j;
				break;
			end
		end
		if nDisTime > g_nGrownTime and tPlantInfo[i][4] == 1 then
			SetNpcLifeTime(tPlantInfo[i][1],0);
			nNewIdx = CreateNpc("TxTree_Group",tPlantInfo[i][2].."-Th¸i H­ Cæ Thô",nMapID,nPosX,nPosY);
			if nNewIdx ~= 0 then
				SetNpcScript(nNewIdx,"\\script\\missions\\yp\\tls\\plant_npc.lua");
				SetNpcLifeTime(nNewIdx,90*60);
				SetNpcTempData(nNewIdx, 1, PlayerIndex)
				AddUnitStates(nIdx,0,2-GetUnitCurStates(nIdx,0));
				tPlantInfo[i][1] = nNewIdx;
				tPlantInfo[i][4] = 2;
			end
		elseif nDisTime == g_nFinishTime - 30 or nDisTime == g_nFinishTime - 29 then
			if nCamp ~= 0 then
				Msg2Global(tMainMapID[nCamp][2].."ThÕ lùc-"..tPlantInfo[i][2].."Th¸i H­ Cæ Thô s¾p chÝn råi, c¸c vÞ ®¹i hiÖp h·y nhanh chãng ®i nhËn th­ëng nµo!");
			end
		elseif nDisTime > g_nFinishTime and tPlantInfo[i][4] == 2 then
			SetNpcLifeTime(tPlantInfo[i][1],0);
			nNewIdx = CreateNpc("TxTree_Final",tPlantInfo[i][2].."-Th¸i H­ Cæ Thô",nMapID,nPosX,nPosY);
			if nNewIdx ~= 0 then
				SetNpcScript(nNewIdx,"\\script\\missions\\yp\\tls\\plant_npc.lua");
				SetNpcLifeTime(nNewIdx,30*60);
				SetNpcTempData(nNewIdx, 1, PlayerIndex)
				AddUnitStates(nNewIdx,0,3-GetUnitCurStates(nIdx,0));
				AddUnitStates(nNewIdx,6,30-GetUnitCurStates(nIdx,6));
				tPlantInfo[i][1] = nNewIdx;
				tPlantInfo[i][4] = 3;
			end			
		end
	end
end

tPackage = {
	[6000] = {"Tói Thiªn Long Tù","Tói cã ®­îc tõ trªn ng­êi cña trô tr×","Tói do trô tr× ®Ó l¹i","Trô tr× §¹i Lý Thiªn Long Tù",2,3,1},
	[6100] = {"Tói Hãa Sinh Tù","Tói cã ®­îc tõ trªn ng­êi cña XÝch Ba","Tói do XÝch Ba ®Ó l¹i","Thæ Phån Hãa Sinh Tù-XÝch Ba",1,3,2},
	[6200] = {"R­¬ng Qu©n Nhu T©y H¹","R­¬ng cã ®­îc tõ trªn ng­êi cña t­íng qu©n","R­¬ng do t­íng qu©n ®Ó l¹i","T©y H¹ Chinh Nam T­íng Qu©n",1,2,3},	
};	

function stageFight:onNpcDeath(event, data)
	self = stageFight;
--	print("stageFight:onNpcDeath",event, data)	
--	gf_PrintTable(data,2)
	local sNpcName = GetNpcName(data[1]); --±»»÷ÆÆnpcµÄÃû×Ö
	local m = this.msPosition:getMapID();
	if sNpcName == tNpcs[m].army1[2] then
		local nMapID,nPosx,nPosy = GetNpcWorldPos(data[1]);
		local nNewIdx = 0;
		SetNpcRemoveScript(data[1],"");
		SetNpcLifeTime(data[1],0);
		if not tPackage[nMapID] then
			print("Qu©n ®oµn tö v× phi mÖnh!");
			return 0;
		end
		for j = 1,10 do
			nNewIdx = CreateNpc(tPackage[nMapID][1],tPackage[nMapID][2],nMapID,nPosx,nPosy,-1,1,1,200);
			SetNpcScript(nNewIdx,thisFile);
			SetNpcLifeTime(nNewIdx,5*60);
		end
		this.msCamp:turnPlayer(tPackage[nMapID][5],yp_aw_giveAward_4);
		yp_addCharm(tPackage[nMapID][5],50);
		this.msCamp:turnPlayer(tPackage[nMapID][6],yp_aw_giveAward_4);
		yp_addCharm(tPackage[nMapID][6],50,1);
		this:Msg2MSAll(format("%s bÞ tiªu diÖt, tÊt c¶ ng­êi ch¬i kh«ng thuéc thÕ lùc phe ta nhËn ®­îc phÇn th­ëng!",tPackage[nMapID][4]));		 
--		ds_PVP:AddStatValue(1,7,1);
	end
end

function stageFight:onNpcRemove(event, data)
	self = stageFight;
--	print("stageFight:onNpcRemove",event, data)	
	local sNpcName = GetNpcName(data); --±»»÷ÆÆnpcµÄÃû×Ö
	local m = this.msPosition:getMapID();
	if sNpcName == tNpcs[m].army1[2] then		
		local nMapID,nPosx,nPosy = GetNpcWorldPos(data);
		local nNewIdx = 0;
		if not tPackage[nMapID] then
			print("Qu©n ®oµn tö v× phi mÖnh!");
			return 0;
		end
		for j = 1,10 do
			nNewIdx = CreateNpc(tPackage[nMapID][1],tPackage[nMapID][3],nMapID,nPosx,nPosy,-1,1,1,200);
			SetNpcScript(nNewIdx,thisFile);
			SetNpcLifeTime(nNewIdx,5*60);
		end
		this.msCamp:turnPlayer(tPackage[nMapID][7],yp_aw_giveAward_4);
		this:Msg2MSAll(format("%s ch­a bÞ tiªu diÖt, tÊt c¶ thuéc thÕ lùc phe ta nhËn ®­îc phÇn th­ëng!",tPackage[nMapID][4]));		 
	end
end

function stageFight:onTalk()
	local nNpcIdx = GetTargetNpc();
	local strNpcName = GetTargetNpcName();
	local m = this.msPosition:getMapID();
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if strNpcName == tPackage[m][2] then
		if nCamp == tPackage[m][7] then
			Talk(1,"","ThÕ lùc cña ng­¬i kh«ng thÓ nhÆt r­¬ng nµy!");
			return 0;
		end
		SetNpcScript(nNpcIdx,"");
		SetNpcLifeTime(nNpcIdx,0);
		yp_aw_giveAward_5();
	elseif strNpcName == tPackage[m][3] then
		if nCamp == tPackage[m][5] or nCamp == tPackage[m][6] then
			Talk(1,"","ThÕ lùc cña ng­¬i kh«ng thÓ nhÆt r­¬ng nµy!");
			return 0;
		end
		SetNpcScript(nNpcIdx,"");
		SetNpcLifeTime(nNpcIdx,0);
		yp_aw_giveAward_5();	
	end
end

----------------------------------------------------------------------
stageFight = inherit(cycPhase, stageFight);

stageFight.actions = {
	[2] = stageFight.init,
--	[50] = stageFight.warn,
}
stageFight.cycActions = {
	[2] = { --2Ãë¼ì²âÒ»ÏÂïÚ³µ
		[0] = {stageFight.checkBiaoche,stageFight.checkPlant},
	},
	[10] = {--10s
		[0] = stageFight.createFireNpc,
	},
	[55] = {--55s
		[0] = stageFight.createTreasure,
	},
	[180] = { --3·ÖÖÓ
		[0] = stageFight.createFireBox,
	},
	[200] = {
		[0] = stageFight.callArmy,
	}
}
stageFight.triggers = {
	NpcDeath = { 
		{action = stageFight.onNpcDeath},
	},
	NpcRemove = {
		{action = stageFight.onNpcRemove},
	},
	Talk = {
		{action = stageFight.onTalk},
	},
};
----------------------------------------------------------------------
firePhases.phases = {stageFight};

function firePhases:onTimeout()
	Msg2MSAll(this.missionID, "KÕt thóc ¶i!");
	CloseMission(this.missionID);
end

----------------------------------------------------------------------
tbTBHSS = gf_CopyInherit(missionBase, tbTBHSS);

tbTBHSS.msOption.bForbitTeam = 0; --¿ÉÒÔ×é¶Ó
tbTBHSS.msOption.nInitFightState = nil; --Õ½¶·×´Ì¬
tbTBHSS.msOption.nRestoreFightState = nil; --Õ½¶·×´Ì¬
tbTBHSS.msOption.bRestoreTempEffect = 0; --ÊÇ·ñÇå³ýÁÙÊ±×´Ì¬
tbTBHSS.msOption.szInitDeahScript = "\\script\\missions\\yp\\player_death.lua";
tbTBHSS.msCamp.campType = tAllCamp;

tbTBHSS.msPhases[1] = firePhases;

tbTBHSS.msPosition.entryPos = {
	{1671,3668},
};
tbTBHSS.msPosition.exitPos = {425,1746,3197};

--function tbTBHSS:onInit()
--	print("tbTBHSS:onInit")
--	firePhases:onInit();
--	missionBase.onInit(self);
--end

function tbTBHSS:onLeave()
--	print("tbTBHSS:onLeave")
	SetMissionV(MV_MISSION_STATUS,1); --²»Àë¿ª¶ÓÎé
	SetLogoutRV(0);	--ÉèÖÃµÇÂ½µãÎªÏÂÏß×ø±ê
	self.msOption:restoreState();
end

function tbTBHSS:onLogin(nCamp)
--	print("tbTBHSS:onLogin")
	nCamp = nCamp or GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then
		nCamp = 5;
	end	
	this.msOption:setState(nCamp);
	this.msCamp:addPlayer(this.missionID, nCamp);	
--	SetFightState(1);	
end

tbTBHSS.msOption.OnPlayerJoin = function(self, nCamp)
	nCamp = nCamp or GetTask(TASK_FIELD_PVP_CAMP);
	if GetTask(TASK_FIELD_PVP_CAMP) == 0 or nCamp == 5 then
		ForbidChangePK(0);
		SetPKFlag(0,0);
		ForbidChangePK(1);
	else
		ForbidChangePK(0);
		SetPKFlag(1,nCamp-1);
		ForbidChangePK(1);	
	end
	local m = GetWorldPos();
	SetTempRevPos(tTempRev[nCamp][m][1],tTempRev[nCamp][m][2]*32,tTempRev[nCamp][m][3]*32); --ÁÙÊ±ÖØÉúµã
	if nCamp == 2 then
--		print("tbTBHSS.msOption.OnPlayerJoin")
		local n = CreateTrigger(1,this.timerTriggerID,this.costomerID);
		ContinueTimer(n);
		if this.tMapTrigger then
			local nMax = getn(this.tMapTrigger);
			for i = this.tMapTrigger[1],this.tMapTrigger[nMax] do
				if GetTrigger(i) == 0 then
					CreateTrigger(2,i,i);
				end
			end
		end	
	end
	if GetTrigger(g_nLoginCostomerID) == 0 then
		CreateTrigger(3,g_nLoginTriggerID,g_nLoginCostomerID);
	end	
	if GetTrigger(g_nRectCostomerID) == 0 then
		CreateTrigger(2,g_nRectTriggerID,g_nRectCostomerID);
	end		
end

tbTBHSS.msOption.OnPlayerLeave = function(self, nCamp)
--	print("tbTBHSS.msOption.OnPlayerLeave")
	if GetTrigger(this.costomerID) ~= 0 then
		RemoveTrigger(GetTrigger(this.costomerID));
	end
end

this = tbTBHSS;
