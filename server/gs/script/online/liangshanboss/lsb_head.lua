--梁山boss活动头文件
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\liangshanboss\\lsb_npc_table.lua")
Include("\\script\\online\\liangshanboss\\lsb_define.lua")
Include("\\script\\online\\liangshanboss\\lsb_award_table.lua")
Include("\\settings\\static_script\\cheat\\event\\event_init.lua")

LSB_START_TIME = {2012,6,15,0,0,0};
LSB_END_TIME = {2030,7,6,0,0,0};

--回调路径
CallBack_Script = "\\script\\online\\liangshanboss\\lsb_head.lua";

--tbMap允许的地图表
--nMapId当前地图
--return 1为真0为假
function LSB_IsAllowMap(tbMap,nMapId)
	for i=1,getn(tbMap) do
		if tbMap[i] == nMapId then
			return 1;
		end
	end
	return 0;
end

--活动时间判断
function LSB_IsActivityOpen()
--	if nActivityId == nil or nActivityId <= 0 then return 0; end
--	if gf_CheckEventDateEx(nActivityId) ~= 1 then
--		return 0;
--	end
--	return 1;
	local nStartTime = MkTime(LSB_START_TIME[1],LSB_START_TIME[2],LSB_START_TIME[3],LSB_START_TIME[4],LSB_START_TIME[5],LSB_START_TIME[6]);
	local nEndTime = MkTime(LSB_END_TIME[1],LSB_END_TIME[2],LSB_END_TIME[3],LSB_END_TIME[4],LSB_END_TIME[5],LSB_END_TIME[6]);
	local nCurrTime = GetTime();
	if nStartTime >= nEndTime then
		print("ERROR:\script\online\liangshanboss\lsb_head.lua LSB_IsActivityOpen LSB_IsActivityOpen nStartTime > nEndTime");
		return 0;
	end
	if nCurrTime >= nStartTime and nCurrTime <= nEndTime then
		return 1;
	end
	return 0;
end

--梁山信物当天使用次数
function LSB_MailUseTimes()
	--是否跨天
	LSB_Check_Day_Seq();
	return gf_GetTaskByte(VET_LSB_MAIL_NUM,1);
end

--是否跨天
--所有跨天清理的都在这里处理
function LSB_Check_Day_Seq()
	if GetTask(VET_LSB_DAY_SEQ) ~= zgc_pub_day_turn() then
		SetTask(VET_LSB_DAY_SEQ,zgc_pub_day_turn());
		gf_SetTaskByte(VET_LSB_MAIL_NUM,1,0);
	end
end

--全局数据清理回调
function LSB_Glb_CallFunc(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("LSB_Glb_CallFunc")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- 没有记录
		AddRelayShareData(szKey, nKey1, nKey2, CallBack_Script, "do_nothing", Lsb_Record3.nSortType, Lsb_Record3.itemkey,"d",0)
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Lsb_Record3.itemkey)
	nFlag = nFlag or 0;
	local nCurrTime = tonumber(GetTime()) - TIME_ZOOM_DIFF;
--	print(type(nFlag),nFlag);
--	print(nCurrTime);
--	print(nCurrTime - nFlag);
	if nCurrTime - nFlag >= 60 * 60 * 24 then
		local nDayTime  = mod(nCurrTime,3600 * 24);
		nCurrTime = nCurrTime - nDayTime;
		AddRelayShareData(szKey, nKey1, nKey2, CallBack_Script, "do_nothing", Lsb_Record3.nSortType, Lsb_Record3.itemkey,"d",nCurrTime + 6 * 3600);
		--执行全局清理
		LSB_Glb_Clear();
	end
	--执行过回调
	SetGlbValue(GS_GLOBAL_VALUE4, GetTime());
	--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

function LSB_GetGlbTimeDis()
	return GetTime() - GetGlbValue(GS_GLOBAL_VALUE4);
end

--全局数据清理
function LSB_Glb_Clear()
	if LSB_IsActivityOpen() ~= 1 then
		return 0;
	end
--	print("LSB_Glb_Clear()")
	--天罡令和轩辕
	SetGlbValue(GS_GLOBAL_VALUE1,0);
	SetGlbValue(GS_GLOBAL_VALUE2,0);
	--boss位置
	SetGlbValue(GS_GLOBAL_VALUE3,0);
	--boss存在
	ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_DelDataRecord");
	--玩家可招数目
	ApplyRelayShareData(Lsb_Record2.szKey,Lsb_Record2.nKey1,Lsb_Record2.nKey2,CallBack_Script,"LSB_DelDataRecord2");
end

function LSB_Exec_CleanData()
	if LSB_IsActivityOpen() ~= 1 then
		return 0;
	end
	--boss位置
	SetGlbValue(GS_GLOBAL_VALUE3,0);
	--boss存在
	ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_DelDataRecord");
end

--检查当前地图boss数量
function LSB_GetCurrMapBossNum(nMapId)
	if nMapId == nil or nMapId <= 0 then return 65536; end
	return GetMapTaskTemp(nMapId,LSB_MAP_TASK_TEMP);
end

--创建BOSS
function LSB_CreateBoss(nFlag)
	local n = gf_GetRandItemByTable(LSB_NPC_SELECT, 1000, 3);
--	print("LSB_CreateBoss--n",n)
	if nFlag == 1 then
	--黄金boss存在
		if n == 1 then
			n = random(2,3);
		end
		dostring(LSB_NPC_SELECT[n][1]);
	elseif nFlag == 0 then
	--黄金boss不存在
		if LSB_Allow_GlodBoss() ~= 1 then
		--时间不容许
			--print("时间不容许")
			if n == 1 then
				n = random(2,3);
			end
			dostring(LSB_NPC_SELECT[n][1]);
			return 0;
		end
		ApplyRelayShareData(Lsb_Record2.szKey,Lsb_Record2.nKey1,Lsb_Record2.nKey2,CallBack_Script,"LSB_Is_Num_Allow");
	end
end

--玩家一天最多招两次
function LSB_Is_Num_Allow(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- 没有记录
		AddRelayShareData(szKey, nKey1, nKey2, CallBack_Script, "do_nothing", Lsb_Record2.nSortType, Lsb_Record2.itemkey,"d",0)
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Lsb_Record2.itemkey)
	nFlag = nFlag or 0;
	local n = gf_GetRandItemByTable(LSB_NPC_SELECT, 1000, 3);
--	print("nFlag2",nFlag);
--	print("n2",n);
	if nFlag >= 2 then
	--no
		if n == 1 then
			n = random(2,3);
		end
		dostring(LSB_NPC_SELECT[n][1]);
	else
	--yes
		if n == 1 then
			AddRelayShareData(szKey, nKey1, nKey2, CallBack_Script, "do_nothing", Lsb_Record2.nSortType, Lsb_Record2.itemkey,"d",nFlag + 1);
		end
		dostring(LSB_NPC_SELECT[n][1]);
	end
	--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--添加黄金boss存在记录
function LSB_AddDataRecord(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("LSB_AddDataRecord")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	AddRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"do_nothing",Lsb_Record.nSortType, Lsb_Record.itemkey,"d",1);
	--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--删除黄金boss存在记录
function LSB_DelDataRecord(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("LSB_DelDataRecord")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	AddRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"do_nothing",Lsb_Record.nSortType, Lsb_Record.itemkey,"d",0);
	--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--删除黄金boss数量记录
function LSB_DelDataRecord2(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("LSB_DelDataRecord2")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	AddRelayShareData(Lsb_Record2.szKey,Lsb_Record2.nKey1,Lsb_Record2.nKey2,CallBack_Script,"do_nothing",Lsb_Record2.nSortType, Lsb_Record2.itemkey,"d",0);
	--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--入口
--找boss数据库回调
function LSB_Is_Allow_BOSS(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- 没有记录
		AddRelayShareData(szKey, nKey1, nKey2, CallBack_Script, "do_nothing", Lsb_Record.nSortType, Lsb_Record.itemkey,"d",0)
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Lsb_Record.itemkey)
	nFlag = nFlag or 0;
	--boss是否存在
--	print("nFlag",nFlag);
--	print("GetGlbValue(GS_GLOBAL_VALUE3)",GetGlbValue(GS_GLOBAL_VALUE3))
	if GetGlbValue(GS_GLOBAL_VALUE3) ~= 0 then
--		print("nFlag or 1 =",nFlag or 1)
		nFlag = nFlag or 1;
	end
	LSB_CreateBoss(nFlag);
	
	--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--Relay请求callboss
function LSB_CallBoos_Relay_LM(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- 没有记录
		AddRelayShareData(szKey, nKey1, nKey2, CallBack_Script, "do_nothing", Lsb_Record.nSortType, Lsb_Record.itemkey,"d",0)
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Lsb_Record.itemkey)
	nFlag = nFlag or 0;
	--只有boss不存在直接调用
	if nFlag == 0 or nFlag == nil then
		--print("Relay创建黄金大BOSS")
		LSB_Create_Gold_Boss(1,1);
	else
		--print("不能创建黄金大BOSS")
	end
	--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--Relay请求callboss1
function LSB_CallBoos_Relay_FB(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- 没有记录
		AddRelayShareData(szKey, nKey1, nKey2, CallBack_Script, "do_nothing", Lsb_Record.nSortType, Lsb_Record.itemkey,"d",0)
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Lsb_Record.itemkey)
	nFlag = nFlag or 0;
	--只有boss不存在直接调用
	if nFlag == 0 or nFlag == nil then
		--print("Relay创建黄金大BOSS")
		LSB_Create_Gold_Boss(1,2);
	else
		--print("不能创建黄金大BOSS")
	end
	--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--Relay请求callboss
function LSB_CallBoos_Relay_FN(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- 没有记录
		AddRelayShareData(szKey, nKey1, nKey2, CallBack_Script, "do_nothing", Lsb_Record.nSortType, Lsb_Record.itemkey,"d",0)
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Lsb_Record.itemkey)
	nFlag = nFlag or 0;
	--只有boss不存在直接调用
	if nFlag == 0 or nFlag == nil then
		--print("Relay创建黄金大BOSS")
		LSB_Create_Gold_Boss(1,3);
	else
		--print("不能创建黄金大BOSS")
	end
	--这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--黄金boss
function LSB_Create_Gold_Boss(nFlag,nRelayMap)
--	print("LSB_Create_Gold_Boss",nFlag,nRelayMap)
	nFlag = nFlag or 0;
	--开工
	local n = gf_GetRandItemByTable(LSB_NPC_GOLD_BOSS, 1000, 1) or 1;
	
	--地图
	local nIndex = 0;
	if nFlag == 1 and nRelayMap ~= nil then
		nIndex = nRelayMap or 1;--Relay
--		print("nIndex1",nIndex);
	else
--		print("nIndex2",nIndex);
		--创建宝箱
		local nMap,nX,nY = GetWorldPos();	
		nIndex = LSB_Check_MapIndex(nMap) --玩家
		if nIndex > 0 and nIndex <= 3 then
			local nNpcIdx = CreateNpc("B秓 rng T礽 nguy猲", format("B秓 Rng Ho祅g Kim c馻 %s",GetName()), nMap, nX + 2, nY + 2);
			SetNpcLifeTime(nNpcIdx, 3 * 60);
			--记录index
			SetTaskTemp(Gld_Boss_Index,nNpcIdx);
			SetNpcScript(nNpcIdx, Box_E_Script);
			Msg2Player(format("Boss Чi Ho祅g Kim Boss%s nh r琲 khi tr鑞 tho竧",LSB_NPC_GOLD_BOSS[n][3]));
		else
			return 0;
		end
	end
	
	SetGlbValue(GS_GLOBAL_VALUE3,nIndex);
	local nNpcIndex = CreateNpc(LSB_NPC_GOLD_BOSS[n][1],LSB_NPC_GOLD_BOSS[n][3],LSB_GOLD_BOSS_LOCATION[nIndex][1],LSB_GOLD_BOSS_LOCATION[nIndex][2],LSB_GOLD_BOSS_LOCATION[nIndex][3]);
--	print("nNpcIndex =",nNpcIndex)
--	print("通告")
	--标记
	if nNpcIndex ~= 0 then
		SetNpcLifeTime(nNpcIndex,LSB_NPC_GOLD_BOSS[n][4]);
		SetNpcDeathScript(nNpcIndex,Gld_Boss_Death_Script);
		SetNpcRemoveScript(nNpcIndex,Gld_Boss_Remove_Script);
--		print("AddRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,do_nothing,Lsb_Record.nSortType, Lsb_Record.itemkey,d,1);")
		--添加黄金boss存在记录
		--ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_AddDataRecord");
		AddRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"do_nothing",Lsb_Record.nSortType, Lsb_Record.itemkey,"d",1);
		--通告
		local strMsg; 
		if nFlag == 0 or nFlag == nil then
			strMsg = format("%s R蕋 may m緉 g鋓 頲 %s Boss Чi Ho祅g Kim, b蕋 c萵  n� tr鑞 tho竧 ra b秐  %s, c竎 h� h穣 mau 甶 t譵  nh b筰 nh薾 thng.",GetName(), LSB_NPC_GOLD_BOSS[n][3], LSB_Get_Map_Name(LSB_GOLD_BOSS_LOCATION[nIndex][1]));
		else
			strMsg = format("T筰 b秐  %s (X:%d, Y:%d) c� ngi ph竧 hi謓 tung t輈h c馻 Boss%s Ho祅g Kim, c竎 v� i hi謕 mau 甶 nh b筰  nh薾 thng.",LSB_Get_Map_Name(LSB_GOLD_BOSS_LOCATION[nIndex][1]),LSB_GOLD_BOSS_XY[nIndex][1],LSB_GOLD_BOSS_XY[nIndex][2],LSB_NPC_GOLD_BOSS[n][3]);
		end
		AddGlobalNews(strMsg);
		Msg2Global(strMsg);
	end
end

--中boss
function LSB_Create_Mid_Boss()
	local n = gf_GetRandItemByTable(LSB_NPC_MID_BOSS, 1000, 1) or 1;
	local nMapId,nX,nY = GetWorldPos();
	local nNpcIndex = CreateNpc(LSB_NPC_MID_BOSS[n][1],LSB_NPC_MID_BOSS[n][3],nMapId,nX,nY,0,1,1,3);
	SetNpcLifeTime(nNpcIndex,LSB_NPC_MID_BOSS[n][4]);
	--记录boss的index
	SetTaskTemp(Mid_Boss_Index,nNpcIndex);
	SetNpcDeathScript(nNpcIndex,Mid_Boss_Death_Script);
	SetNpcRemoveScript(nNpcIndex,Mid_Boss_Remove_Script);
	Msg2Player(format("C竎 h� r蕋 may m緉 tri謚 g鋓 th祅h c玭g Boss Trung%s",LSB_NPC_MID_BOSS[n][3]));
	return 2,nMapId,nNpcIndex;
end

--小boss
function LSB_Create_Sma_Boss()
	local n = gf_GetRandItemByTable(LSB_NPC_SMA_BOSS, 10000, 1) or 1;
	local nMapId,nX,nY = GetWorldPos();
	local nNpcIndex = CreateNpc(LSB_NPC_SMA_BOSS[n][1],LSB_NPC_SMA_BOSS[n][3],nMapId,nX,nY,0,1,1,3);
	SetNpcLifeTime(nNpcIndex,LSB_NPC_SMA_BOSS[n][4]);
	--记录boss的index
	SetTaskTemp(Sma_Boss_Index,nNpcIndex);
	SetNpcDeathScript(nNpcIndex,Sma_Boss_Death_Script);
	SetNpcRemoveScript(nNpcIndex,Sma_Boss_Remove_Script);
	Msg2Player(format("C竎 h�  may m緉 tri謚 g鋓 th祅h c玭g Ti觰 Boss %s",LSB_NPC_SMA_BOSS[n][3]));
	return 3,nMapId,nNpcIndex;
end

--获取时间
function LSB_GetHourTime()
	return floor(mod(GetTime() - TIME_ZOOM_DIFF, 24 * 3600) / 3600);
end


--黄金boss允许刷出时间
function LSB_Allow_GlodBoss()
	local nTime = LSB_GetHourTime();
--	print("nTime,",nTime)
	if nTime >= 2 and nTime < 10 then
		return 0;
	end
	return 1;
end


--给奖励A
function LSB_Get_Award_A()
	gf_Modify("Exp",5000000);
	EventAddPhoBan(100);
	gf_AddItemEx2(Box_Num_A,  "Lng S琻 M藅 B秓 Rng", LSB_szLogTitle, "M� B秓 Rng A", 0, 1);
	gf_EventGiveRandAward(LSB_AWARD_A_TB, 100, 1, LSB_szLogTitle, "M� B秓 Rng A");
end

--给奖励B
function LSB_Get_Award_B()
	gf_Modify("Exp",10000000);
	EventAddPhoBan(100);
	gf_AddItemEx2(Box_Num_B,  "Lng S琻 M藅 B秓 Rng", LSB_szLogTitle, "M� B秓 Rng B", 0, 1);
	gf_EventGiveRandAward(LSB_AWARD_B_TB, 100, 1, LSB_szLogTitle, "M� B秓 Rng B");
end

--给固定奖励C
function LSB_Get_Award_Fix_C()
	gf_Modify("Exp",15000000);
	EventAddPhoBan(100);
	gf_AddItemEx2(Box_Num_C,  "Lng S琻 M藅 B秓 Rng", LSB_szLogTitle, "M� B秓 Rng C", 0, 1);
end

--Roll奖励C
function LSB_Get_Award_C(nNum,nFlag,targetNpc)
--	print("LSB_Get_Award_C",nNum,nFlag);
	nNum = nNum or 1;
	nFlag = nFlag or 0;
--	print("天罡令",GetGlbValue(GS_GLOBAL_VALUE1))
--	print("轩辕",GetGlbValue(GS_GLOBAL_VALUE2))
	for i=1,nNum do
		local n = gf_GetRandItemByTable(LSB_AWARD_C_TB, 100, 1);
		--天罡令
--		print("before-n",n)
		if n == 1 then
			if GetGlbValue(GS_GLOBAL_VALUE1) ~= 0 then
				n = random(2,6);
			else
				SetGlbValue(GS_GLOBAL_VALUE1,1);
			end
		end
		--轩辕
		if n == 7 then
			if GetGlbValue(GS_GLOBAL_VALUE2) ~= 0 then
				n = random(2,6);
			else
				SetGlbValue(GS_GLOBAL_VALUE2,1);
			end
		end
--		print("roll-n",n)
		--直接给
		if nFlag == 1 then
			if n == 5 then
				LSB_XingKe_Award();
			elseif n == 6 then
				LSB_TianYi_Award();
			elseif n == 7 then
				local nRand = LSB_XuanYuan_Award();
				--print("nRand",nRand);
				Msg2Global(format("Ngi ch琲 %s tham gia ho箃 ng khi猽 chi課 Boss Чi Ho祅g Kim  may m緉 nh薾 頲 ph莕 thng %s",GetName(),LSB_XUANYUAN_AWARD_TB[nRand][3]));
			else
				--print("gf_UnPack(LSB_AWARD_C_TB[n][4])",gf_UnPack(LSB_AWARD_C_TB[n][4]));
				gf_AddItemEx2(LSB_AWARD_C_TB[n][4], LSB_AWARD_C_TB[n][3], LSB_szLogTitle, LSB_szLogTitle, 0, 1);
				if n == 1 then
					Msg2Global(format("Ngi ch琲 %s tham gia ho箃 ng khi猽 chi課 Boss Чi Ho祅g Kim  may m緉 nh薾 頲 ph莕 thng %s",GetName(),LSB_AWARD_C_TB[n][3]));
				end
			end
		else
		--开始roll
			if n == 5 then
				LSB_Item_Roll(gf_RandRate(LSB_XINGKE_AWARD_TB,100,2)[4],targetNpc);
			elseif n == 6 then
				LSB_Item_Roll(gf_RandRate(LSB_TIANYI_AWARD_TB,100,2)[4],targetNpc);
			elseif n == 7 then
				LSB_Item_Roll(gf_RandRate(LSB_XUANYUAN_AWARD_TB,100,2)[4],targetNpc);
			else
				LSB_Item_Roll(LSB_AWARD_C_TB[n][4],targetNpc);
			end
		end
	end
end

--roll界面
function LSB_Item_Roll(tbItem,targetNpc)
	if type(tbItem) ~= "table" then return end
	local diceId = ApplyItemDice(1, 100, 60, CallBack_Script, "LSB_CallBack_Roll", GetTeamSize(),targetNpc);
	AddDiceItemInfo(diceId, gf_UnPack(tbItem))
	local nPlayerOld = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if IsPlayerDeath() == 0 then
			RollItem(diceId);
		end
	end
	PlayerIndex = nPlayerOld;
end

--roll回调
function LSB_CallBack_Roll(dwID)
--	print("LSB_CallBack_Roll")
	local t, nSize, szItem = GetItemDiceRollInfo(dwID)
	local bNotice = LSB_Is_Notice(szItem);
	local bAllGiveUp = 1;
	local tbTemp = {};
	if type(t) ~= "table" then return end
	for index, value in t do
		bFlag = 0;
		local str = value[1].."N衜"..value[2].." 甶觤"
		if value[3] == 0 then
			str = value[1].."Ph鉵g"
		elseif value[3] == 1 then
			str = str.." (Tuy誸 c莡)"
			if value[4] == 1 then
				str = str.." -Х nh苩 頲"..szItem
				tbTemp[value[1]] = szItem;
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.." (Tham lam)"
			if value[4] == 1 then
				str = str.." -Х nh苩 頲"..szItem
				tbTemp[value[1]] = szItem;
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	if bNotice == 1 then
		for index, value in tbTemp do
			if GetName() == index then
				Msg2Global(format("Ngi ch琲 %s tham gia ho箃 ng khi猽 chi課 Boss Чi Ho祅g Kim  may m緉 nh薾 頲 ph莕 thng %s",index,value));
			end
		end
	end
	if bAllGiveUp == 1 then
		Msg2Player("T蕋 c� ngi ch琲  b� cu閏")
	elseif nSize ~= getn(t) then
		Msg2Player("Nh鱪g ngi ch琲 kh竎  vt qu� th阨 gian, xem nh� b� cu閏")
	end
end

--判断是否要公告
function LSB_Is_Notice(strTab)
	if strTab == LSB_AWARD_C_TB[1][3] then
		return 1;
	end 
	for i = 1,getn(LSB_XUANYUAN_AWARD_TB) do 
		if strTab == LSB_XUANYUAN_AWARD_TB[i][3] then
			return 1;
		end
	end
	return 0;
end

--随机星刻
function LSB_XingKe_Award()
	 return gf_EventGiveRandAward(LSB_XINGKE_AWARD_TB, 100, 1);
end

--随机天仪
function LSB_TianYi_Award()
	return gf_EventGiveRandAward(LSB_TIANYI_AWARD_TB, 100, 1);
end

--随机轩辕
function LSB_XuanYuan_Award()
	return gf_EventGiveRandAward(LSB_XUANYUAN_AWARD_TB, 100, 1);
end

--获取黄金大boss出现的地图
function LSB_Get_Map_Name(nMapId)
	local tbMap = {
		[507] = "Long M玭 tr蕁",
		[504] = "B綾 Ph鬾g Tng",
		[501] = "Nam Ph鬾g Tng",
	}
	return tbMap[nMapId];
end

function do_nothing()
--do nothing
end

--等级流派判断
function LSB_Check_LR()
	if GetLevel() < Min_Level  then
		Talk(1,"",format("C竎 h� ch璦 t c蕄  <color=red>%d<color>",Min_Level));
		return 0;
	end
	if GetPlayerFaction() == 0 then
		Talk(1,"","C竎 h� ch璦 c� h� ph竔");
		return 0;
	end
	return 1;
end

--检查boss和箱子是否存在
function LSB_Check_NpcName()
	local nIndex_Sma = GetTaskTemp(Sma_Boss_Index);
	local sBoxName = format("%s B秓 Rng",GetName());
	local sNpcName = GetNpcName(nIndex_Sma);
	if sNpcName == sBoxName then
		return 0;
	end 
	for i=1,getn(LSB_NPC_SMA_BOSS) do 
		if sNpcName == LSB_NPC_SMA_BOSS[i][3] then
			return 0;
		end
	end
	local nIndex_Mid = GetTaskTemp(Mid_Boss_Index);
	local sBoxName2 = format("Чi B秓 Rng c馻 %s",GetName());
	local sNpcName2 = GetNpcName(nIndex_Mid);
	if sNpcName2 == sBoxName2 then
		return 0;
	end 
	for i=1,getn(LSB_NPC_MID_BOSS) do 
		if sNpcName2 == LSB_NPC_MID_BOSS[i][3] then
			return 0;
		end
	end
	return 1;
end

--返回地图table index
function LSB_Check_MapIndex(nMapId)
 for i=1,getn(LSB_GOLD_BOSS_LOCATION) do
 	if nMapId == LSB_GOLD_BOSS_LOCATION[i][1] then
 		return i;
 	end
 end
 return 1;
end