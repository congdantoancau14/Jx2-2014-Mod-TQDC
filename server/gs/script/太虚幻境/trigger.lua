Include("\\script\\online\\viet_event\\pet_instance\\head.lua");
Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")
Include("\\script\\太虚幻境\\head.lua")
--越南09年7月活动开关头文件
Include("\\script\\online\\viet_event\\200907\\eventopen.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua");
--越南09年12月活动头文件
Include("\\script\\online\\viet_event\\200912\\event_head.lua")
--日常任务头文件
Include("\\script\\task\\richangrenwu\\head.lua");
Include("\\script\\online_activites\\task_values.lua");--任务变量头文件
Include("\\script\\online_activites\\award.lua");--活动太虚相关奖励（包括杀死一个怪给奖励和通过太虚给奖励）
Include("\\script\\online\\award_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

function OnTimer()
	print("thai hu huyen canh >> trigger >> OnTimer");
	local nMap = GetWorldPos()
	if nMap == 1010 or nMap == 2010 then
		local nSteps = GetTaskTemp(TAIXU_STEPS)
--		local nMapID = GetTaskTemp(TAIXU_MAP_ID)
		local nZone = GetTaskTemp(TAIXU_ZONE_INDEX)
		local nStage = GetTaskTemp(TAIXU_STEP_CONTROL)
		SetTaskTemp(TAIXU_STEPS, nSteps + 1)
		SetMapTaskTemp(nMap, 1, nZone)
		SetMapTaskTemp(nMap, 2, nStage)
		
		local nRemainCount = CountGroupUnit(GROUP_MOB)
		local nRemainPet = CountPet()
		if GetMapTaskTemp(nMap, 4) >= 1 then
			if (nRemainCount > 0 and nSteps == 41) or nRemainPet == 0 then
				local nRealStage = nStage - 1
				Msg2Team("Th藅 ng ti誧, t� i v� b筺 ng h祅h  kh玭g vt qua 頲 th� th竎h, k誸 qu�  vt qua t韎 秈 th� "..nZone.." t莕g "..nRealStage)
			--	L璾 l筰 k� l鬰 s� 秈  vt qua
				local OldPlayer = PlayerIndex
				for i=1, GetTeamSize() do
	        			PlayerIndex = GetTeamMember(i)
	        			pet_save_history()
	    			end
	    			PlayerIndex = OldPlayer
				PetGameOver(1)
			end
			
			if nRemainCount == 0 and nSteps > 1 and nSteps < 41 then
				if nStage < 10 then
					SetTaskTemp(TAIXU_STEP_CONTROL, nStage + 1)
				else
					SetTaskTemp(TAIXU_ZONE_INDEX, nZone + 1)
					if mod(nZone + 1, 5) == 0 then
						AddGlobalNews("Ch骳 m鮪g t� i c馻 "..GetName().."  xu蕋 s綾 c飊g b筺 ng h祅h  vt qua 頲 秈 th� "..nZone.." c馻 Th竔 H� Huy詎 C秐h.")
					end
					PetCreateTreasureChest(nZone)
					SetTaskTemp(TAIXU_STEP_CONTROL, 2)
				end
				local OldPlayer = PlayerIndex
				for i=1, GetTeamSize() do
	        			PlayerIndex = GetTeamMember(i)
	        			local nZone1 = GetMapTaskTemp(nMap, 1)
	        			local nStage1 = GetMapTaskTemp(nMap, 2)
	        			local nExp = tMobType[nZone1][3] * nStage1
	    				ModifyExp(nExp)
	    				Msg2Player("B筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒!")
	    				WriteLogEx("Thai Hu Huyen Canh Ban Dong Hanh", "nh薾 exp qua 秈")
	    				if GetTaskTemp(TAIXU_PET_USEFOOD) < tLimitPetFoodUsed[nZone1] then
	    					SetTaskTemp(TAIXU_PET_USEFOOD, GetTaskTemp(TAIXU_PET_USEFOOD) + 1)
	    				end
	    				StopTimeGuage(nMap)
	    			end
	    			PlayerIndex = OldPlayer
				SetTaskTemp(TAIXU_STEPS, 0)
			end
		end

		if nSteps == 1 and nRemainCount == 0 then
			local nRealState = nStage - 1
			Msg2Team("B総 u 秈 th� "..nZone.." t莕g "..nRealState)
			PetCreateMonster(nZone, nStage)
			local OldPlayer = PlayerIndex
			for i=1, GetTeamSize() do
        			PlayerIndex = GetTeamMember(i)
        			local nZone1 = GetMapTaskTemp(nMap, 1)
        			local nStage1 = GetMapTaskTemp(nMap, 2) - 1
        			if nZone1 == 1 and nStage1 == 1 then
        				CreatePet(i, nMap)
        				SetMapTaskTemp(nMap, 4, 1)
        			end
        			pet_save_history()		
				WriteLogEx("Thai Hu Huyen Canh Ban Dong Hanh", "Vt 秈 "..nZone1.." t莕g "..nStage1)
				StartTimeGuage("Vt 秈 "..nZone1.." t莕g "..nStage1, 600, 0, nMap)
    			end
    			PlayerIndex = OldPlayer
		end
		if GetMapTaskTemp(nMap, 3) == 1 then
			if nZone > 3 then
				Msg2Team("Xin ch骳 m鮪g, t� i c飊g b筺 ng h祅h  vt qua th� th竎h c馻 Th竔 H� Huy詎 C秐h,  c� th� tham gia c竎 th� th竎h kh竎 kh� kh╪ h琻 ph秈 s� d鬾g Th竔 H�  M藅 Qu�!")
				PetGameOver(1)
			end
		end
		if nZone > 17 then
			Msg2Team("Xin ch骳 m鮪g, t� i c飊g b筺 ng h祅h  vt qua 頲 to祅 b� th� th竎h c馻 Th竔 H� Huy詎 C秐h, h裯 g苝 l筰 � nh鱪g th� th竎h kh竎 kh� kh╪ h琻!")
			AddGlobalNews("Ch骳 m鮪g t� i c馻 "..GetName().."  xu蕋 s綾 c飊g b筺 ng h祅h vt qua 頲 to祅 b� th� th竎h c馻 Th竔 H� Huy詎 C秐h.")
			local OldPlayer = PlayerIndex
			for i=1, GetTeamSize() do
	        		PlayerIndex = GetTeamMember(i)
	        		pet_save_history()
	    		end
	    		PlayerIndex = OldPlayer
			PetGameOver(1)
		end
	else	
		local nSteps = GetTaskTemp(TAIXU_STEPS)
		local nMapid = GetTaskTemp(TAIXU_MAP_ID)
		local nZone = GetTaskTemp(TAIXU_ZONE_INDEX)
		local nStepControl = GetTaskTemp(TAIXU_STEP_CONTROL)
		-- 记录该ZONE进行的时间
		SetMapTaskTemp(nMapid, nZone + 4, nSteps * 14)
		SetTaskTemp(TAIXU_STEPS, nSteps + 1)
		
		BroadCast(nSteps)		-- 广播进度
	
		if nSteps == nStepControl then		--刷怪
			if GetTaskTemp(TAIXU_RINGS) >= 4 then		-- 第5关以后可能刷出装备怪
				CreateMonster(GetTaskTemp(TAIXU_ZONE_INDEX), 1)
			else
				CreateMonster(GetTaskTemp(TAIXU_ZONE_INDEX), 0)
			end
			SetTaskTemp(TAIXU_RINGS, GetTaskTemp(TAIXU_RINGS) + 1)
			--队伍所有的人都开启OnKill
			gf_TeamOperateEX(function () 
				SetTaskTemp(TMP_TASK_TAIXU_TAG, 0);
			end);
		end
	end
end

function BroadCast(nSteps)
	-- 广播时间进度，大约1分钟一次
	if mod(nSteps, 4) == 0 and nSteps < 129 then
		Msg2Team("Trong th阨 gian  qua---["..nSteps.." / 129]")
	end
	
	if nSteps == 0 then			-- 刚开始进入
		Msg2Team("чi ng�  v祇 Th竔 H� Huy詎 C秐h,  M藅 qu� b総 u ph竧 huy t竎 d鬾g")
	elseif nSteps == 21 or nSteps == 42 or nSteps == 64 then	-- 5, 10, 15分钟
		Msg2Team("T竎 d鬾g  M藅 qu� c祅g l骳 c祅g m筺h")
	elseif nSteps == 86 then
		Msg2Team("H譶h nh� c� c琻 gi� m竧 th鎖 qua")
	elseif nSteps == 107 then
		Msg2Team("C琻 gi� m筺h th鎖 qua l祄 m鋓 ngi b鮪g t豱h")
	elseif nSteps == 120 then
		Msg2Team("Th竔 H� Huy詎 C秐h ph竧 huy s鴆 m筺h m鋓 ngi u t豱h gi蔯")
	elseif nSteps == 129 then
		Msg2Team(" M藅 qu� m蕋 t竎 d鬾g m鋓 ngi b� a v� th祅h")
		GameOver(1)
	elseif nSteps == 200 + RINGS_INTERVAL then
		GameOver(1)
	end
end

function OnKill()
	if GetTaskTemp(TMP_TASK_TAIXU_TAG) ~= 0 then
		return
	end
	local TT_TARGET_Index, TT_TARGET_ModID, TT_TARGET_Name = GetTriggeringUnit()
	
	local nMonsterType = 0
	local nRingMax = 0
	local nZone = 0

	--是否完成个人日常任务
	if DAILY_TASK_0912_SWITCH == 1 then
		is_he_finish_the_personal_task(TT_TARGET_Name);
	end

	--越南09年7月活动打死怪有１０％的概率掉1个陈旧秘本
	give_viet20090607_miben();
	--越南09年8月活动打死怪有１０％的概率掉1个水果袋
	give_viet200908_shuiguodai();
	--越南2009	春节活动
	if is_new_year_09_viet_open() == 1 then
		local nRandom = random(1,100)
		if nRandom <= 30 then
			add_bag_new_year_09_viet(1, "Th竔 H� Huy詎 C秐h")
		end
	end
	
	local nOldIndex = PlayerIndex
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex > 0 then
		nMonsterType = GetTaskTemp(TAIXU_MONSTER_TYPE)
		nRingMax = GetTaskTemp(TAIXU_RINGS_MAX)
		nZone = GetTaskTemp(TAIXU_ZONE_INDEX)
	end
	PlayerIndex = nOldIndex
	
	SetNpcDeathScript(TT_TARGET_Index, "")
	DelGroupUnit(nZone + GROUP_OFFSET, TT_TARGET_Index)
	SetNpcLifeTime(TT_TARGET_Index, 10)
	
	local nRemainCount = CountGroupUnit(nZone + GROUP_OFFSET)
	local nKilledCount = FILE_ROW_COUNT - 2 - nRemainCount
	
	local szType = ""
	local nExp = 0
	
	if nMonsterType == 1 then	--经验
		szType = "Kinh nghi謒"
		nExp = ONE_MONSTER_EXP
	elseif nMonsterType == 2 then	--修为
		szType = "Luy謓"
		nExp = ONE_MONSTER_POPUR
	end
	
	
	if szType ~= "" and (nKilledCount == 1 or mod(nKilledCount, 8) == 0) then
		Msg2Team("чi ng� hi謓 t筰 nh薾 頲"..szType.."l� ("..(nExp * nKilledCount * nRingMax)..")")
	end
	
	-- 检查是否杀完了一批里面所有怪物
	-- 是的话
	nOldIndex = PlayerIndex
	if nRemainCount == 0 then
		PlayerIndex = GetTeamMember(0)

		if PlayerIndex > 0 then
			-- 杀完了一批怪物，发奖励
			local nRingCount = GetTaskTemp(TAIXU_RINGS_MAX)
			local nCurRing = GetTaskTemp(TAIXU_RINGS)
			GiveAward(nMonsterType)	

			-- 是否杀完所有的太虚幻像
			--过关后给奖励在这里添加
			if nCurRing == nRingCount then
				SetTaskTemp(TAIXU_STEPS, 200)
				--设置屏蔽功能（修复刷过关奖励的BUG）
				--队伍所有的人都关闭OnKill
				gf_TeamOperateEX(function () 
					SetTaskTemp(TMP_TASK_TAIXU_TAG, 1);
				end)
				Msg2Team("Ch骳 m鮪g! чi ng�  tr秈 qua 秓 gi竎 th祅h c玭g!")
				--其他过关奖励汇总
				gf_TeamOperateEX(aw_taixu_award, nCurRing);
				Observer:onTeamEvent(SYSEVENT_TAIXU_STAGE_FINISH, nCurRing)
				return
			end
			-- 设置下次刷怪的时间为30秒后
			SetTaskTemp(TAIXU_STEP_CONTROL, GetTaskTemp(TAIXU_STEPS) + RINGS_INTERVAL)
			--设置屏蔽功能（修复刷过关奖励的BUG）
			--队伍所有的人都关闭OnKill
			gf_TeamOperateEX(function () 
				SetTaskTemp(TMP_TASK_TAIXU_TAG, 1);
			end)
			Msg2Team("Ch骳 m鮪g i ng�  qua 頲 秓 gi竎 th� "..nCurRing..", 秓 gi竎 th� "..(nCurRing + 1))
			Msg2Team("H� 秐h 30 gi﹜ sau s� xu蕋 hi謓, xin chu萵 b� th藅 t鑤! 秓 gi竎 m� i ng� nh譶 頲 t鎛g c閚g "..nRingCount)
			--其他过关奖励汇总
			gf_TeamOperateEX(aw_taixu_award, nCurRing);
			Observer:onTeamEvent(SYSEVENT_TAIXU_STAGE_FINISH, nCurRing)
		end
	end
	PlayerIndex = nOldIndex
end

function Leave_Map()
	local nMap = GetTaskTemp(TAIXU_MAP_ID)
	if IsCaptain() == 1 then
		if nMap == 1010 or nMap == 2010 then
			PetGameOver(1)
		else
			GameOver(1)
		end
	else
		if nMap == 1010 or nMap == 2010 then
			PetGameOver(0)
		else
			GameOver(0)
		end
	end
end

function OnLogin()
	RemoveTrigger(GetTrigger(TRIGGER_TIMER))
	RemoveTrigger(GetTrigger(TRIGGER_KILL))
	RemoveTrigger(GetTrigger(TRIGGER_RECT))
	RemoveTrigger(GetRunningTrigger())
	
	SetFightState(0)					-- 设置为可战斗
	SetCreateTeam(0)					-- 关闭组队功能
  InteractiveEnable(1)				-- 交互开关，0关闭，1打开
  StallEnable(1)		   				-- 摆摊开关
	ForbitTrade(0)						-- 禁止交易
	OpenFriendliness(1)					-- 提升好感
end

--给09年6月7月陈旧密本奖励
function give_viet20090607_miben()
	if EventOpen0906() == 0 then
		return
	end
	if tonumber(date("%y%m%d%H")) >= 09061900 and tonumber(date("%y%m%d%H")) < 49071924 then
		local nRand = random(1, 100);
		if nRand <= 10 then
			gf_SetLogCaption("Truy t譵 trng sinh ph�");
			gf_AddItemEx({2, 1, 30088, 1}, "B� Ph� C� N竧");
			WriteLogEx("Hoat dong thang 6","Th竔 H�",1,"B� Ph� C� N竧");
			gf_SetLogCaption("");
		end
	end
end


--给09年8月活动水果袋奖励
function give_viet200908_shuiguodai()
	if tonumber(date("%y%m%d")) >= 090807 and tonumber(date("%y%m%d")) < 490907 then
		local nRand = random(1, 100);
		if nRand <= 10 then
			gf_SetLogCaption("[Hoat dong thang 8]");
			nRet = gf_AddItemEx({2, 1, 30097, 1}, "T骾 Tr竔 C﹜");
			if nRet == 1 then
				WriteLogEx("Hoat dong thang 8","Nhan tui trai cay",1,"Danh quai Thai Hu");
			end;
			gf_SetLogCaption("");
		end
	end
end

--给09年12月活动圣诞糖果
function give_viet200912_shengdantangguo()
    local nDate = tonumber(date("%y%m%d"));
    if nDate >= 091218 and nDate < 400117 then
        local szFullLog = VIET_0912_STR_EVENT_LOG_TITLE.."- Vt 秈 th竔 h� thu 頲 k裲 gi竛g sinh"
        gf_AddItemEx2({2, 1, 30138, 10}, "C﹜ K裲 Gi竛g Sinh", szFullLog, 0, 1, 10, 1);
    end
end

function pet_save_history()
	local nMap = GetWorldPos()
	local nZone1 = GetMapTaskTemp(nMap, 1)
	local nStage1 = GetMapTaskTemp(nMap, 2)
	local nSavedStage = mod(GetTask(TSK_PET_TAIXU_POINT), 10) + 1
	local nSavedZone = floor(mod(GetTask(TSK_PET_TAIXU_POINT), 1000) / 10)
	if nSavedZone < nZone1 then
		SetTask(TSK_PET_TAIXU_POINT, GetTask(TSK_PET_TAIXU_POINT) + (nZone1 - nSavedZone) * 10)
		SetTask(TSK_PET_TAIXU_POINT, GetTask(TSK_PET_TAIXU_POINT) - nSavedStage + nStage1 - 1)
	elseif nSavedZone == nZone1 and nSavedStage < nStage1 then
		SetTask(TSK_PET_TAIXU_POINT, GetTask(TSK_PET_TAIXU_POINT) - nSavedStage + nStage1 - 1)
	end
end