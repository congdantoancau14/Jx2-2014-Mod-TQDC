--create date:07-04-16
--author:yanjun
--describe:单挑时间触发器
Include("\\script\\gongcheng\\gongcheng_function.lua");
FIGHT_TRIGGER_ID = 3014;							--单挑时间触发器自定义编号
function OnTimer()
	local nState = GetTaskTemp(TEMP_FIGHT_STATE);
	local nCamp = GCZ_GetPlayerCamp();
	local nDoorIdx = GetTaskTemp(TEMP_GURAD_ID);
	if nState == ROOM_STATE_IDLE then
	elseif nState == ROOM_STATE_READY then
		SetTaskTemp(TEMP_FIGHT_STATE,ROOM_STATE_FIGHT);
		SetFightState(1);
		Msg2Player("B総 u u n! Th阨 gian thi u kho秐g 7 ph髏, hai b猲 h穣 tranh th� th阨 gian");
		Talk(1,"","B﹜ gi� b総 u u n! Th阨 gian u l� <color=yellow>7 n衝 nhang (kho秐g 7 pt髏)<color>, hai b猲 h穣 tranh th� th阨 gian.");
		SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),70);	--一柱香时间
		SetTaskTemp(TEMP_FIGHT_TIMER_LOOP,1);
	elseif nState == ROOM_STATE_FIGHT then
		local nLoop = GetTaskTemp(TEMP_FIGHT_TIMER_LOOP);
		if nLoop <= 6 then
			SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),70);	--一柱香时间
			SetTaskTemp(TEMP_FIGHT_TIMER_LOOP,nLoop+1);
			Msg2Player("Th阨 gian Кn u c遪: "..(7-nLoop).." n衝 nhang");
			return 0;
		end;
		SetTaskTemp(TEMP_FIGHT_STATE,ROOM_STATE_END);
		if GetTaskTemp(TEMP_CHALLENGER) == 1 then	--当前是挑战者
			local nEnemyCamp = GCZ_GetEnemyCamp();
			local nEnemyIdx = GetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nEnemyCamp-1);
			Msg2MSAll(MISSION_ID,"Чi hi謕"..GetName().."c飊g v韎 "..GetName(nEnemyIdx).."Чi chi課 300 hi謕 b蕋 ph﹏ th緉g b筰, quy誸 nh ch鋘 ng祔 t竔 chi課");
		end;
		SetFightState(0);
		PlaySound("\\sound\\单挑平局.wav");
		Say("Tr薾 u k誸 th骳! Hai b猲 b蕋 ph﹏ th緉g b筰, 5 gi﹜ sau s� r阨 kh醝 chi課 trng......",0);
		Restore();
		RestoreNeili();
		SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),5);
		if nCamp == SHOU_ID then	--只处理守方人员
			if GetTaskTemp(TEMP_CHALLENGER) ~= 1 then	--如果不是挑战者，那平局次数就加1
				SetMissionV(MV_EAST_DOOR_DRAW+nDoorIdx-1,GetMissionV(MV_EAST_DOOR_DRAW+nDoorIdx-1)+1);
			end;
			if GetMissionV(MV_EAST_DOOR_DRAW+nDoorIdx-1) == 3 then	--连续三次平手				
				SetTaskTemp(TEMP_GURAD_ID,0);
				SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1),0);	--清空所记录的玩家索引
				SetMissionV(MV_SPIDX_EAST_DOOR+2*(nDoorIdx-1),0);
				SetMissionV(MV_DESTROY_EAST_DOOR+nDoorIdx-1,1);	--城门被摧毁
				if nDoorIdx == 1 then	--如果是东门
					GCZ_SetGraveyardStatus(MV_GRAVEYARD_B2,GONG_ID,TRUE);	--对攻方开放墓地B2
					Msg2MSAll(MISSION_ID,"Кn u di詎 ra k辌h li謙, Th祅h m玭 kh玭g th� ch辵 n鎖,  s鬾 , Th祅h m玭 ph輆 Йng  m�. 觤 t藀 k誸 ngo礽 Йng m玭  m�");
				elseif nDoorIdx == 2 then 	--如果是中门
					Msg2MSAll(MISSION_ID,"Кn u di詎 ra k辌h li謙, Th祅h m玭 kh玭g th� ch辵 n鎖,  s鬾 , Th祅h m玭 Trung khu  m�. ");
				elseif nDoorIdx == 3 then	--如果是西门
					GCZ_SetGraveyardStatus(MV_GRAVEYARD_B1,GONG_ID,TRUE);	--对攻方开放墓地B1
					Msg2MSAll(MISSION_ID,"Кn u di詎 ra k辌h li謙, Th祅h m玭 kh玭g th� ch辵 n鎖,  s鬾 , Th祅h m玭 ph輆 T﹜  m�. 觤 t藀 k誸 ngo礽 T﹜ m玭  m�");
				end;
				--SetNpcLifeTime(GetMissionV(MV_EAST_JIGUAN_INDEX+nDoorIdx-1),0);
				AddUnitStates(GetMissionV(MV_EAST_JIGUAN_INDEX+nDoorIdx-1),1,-100000000);	--将城门机关的生命设为0
			end;
		end;
	elseif nState == ROOM_STATE_END then
		Msg2Player("T� chi課 trng n u quay v� h藆 doanh!");
		if GetTaskTemp(TEMP_CHALLENGER) == 1 then	--当前是挑战者
			SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nCamp-1,0);	--清除挑战者的索引记录
			SetTaskTemp(TEMP_GURAD_ID,0);
		end;
		RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
		SetTaskTemp(TEMP_ARENA_FIGHTING,0);
		SetTaskTemp(TEMP_FIGHT_STATE,ROOM_STATE_END);
		SetTaskTemp(TEMP_CHALLENGER,0);
		SetPos(tEntrancePos[nCamp][1],tEntrancePos[nCamp][2]);	
	end;
end;

function set_fight_camp(nCamp,nRoomIndex,nPosIndex)
	local nRefugeeModel = {"N筺 d﹏ T鑞g","N筺 d﹏ Li猽"};
	if BT_GetTempData(PTT_FOLLOWER) == 1 then
		local nRefugeeIndex = CreateNpc(nRefugeeModel[nCamp],tCampNameZ[nCamp].." _n筺 d﹏",GetWorldPos());
		SetNpcScript(nRefugeeIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\refugee_talk_npc.lua");
	end;
	if IsPlayerDeath() ~= 0 then
		RevivePlayer(0);	--原地重生
	end;
	KillFollower()	--难民掉落
	BT_SetTempData(PTT_FOLLOWER,0);	--进入单挑时清掉就对啦
	BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_READY);
	SetFightState(0);
	BT_SetTempData(PTT_LOCK,1);
	BT_SetTempData(PTT_ROOMINDEX,nRoomIndex);
	CreateTrigger(1,FIGHT_TIMER_ID,FIGHT_TRIGGER_ID);
	SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),15);
	ContinueTimer(GetTrigger(FIGHT_TRIGGER_ID));
	Restore();
	RestoreNeili();
	RemvoeTempEffect();	--清除所有临时状态
	ClearColdDown();	--清除所有药CD
	CastState("imme_clear_skill_interval",-1,0);	--消除所有技能的冷却时间
	local nOffset = (nRoomIndex-1)*2+nCamp-1;
	SetMissionV(MV_FIGHTER_GROUP1_1+nOffset,PlayerIndex);
	Say("Кn u sau <color=yellow>30 gi﹜<color> s� b総 u!",0);
	Msg2Player("Кn u sau 30 gi﹜ s� b総 u, i b猲 h穣 chu萵 b�!");
	BT_SetTempData(PTT_LOCK,1);	--杀手锁定
	SetPos(tFightRoom[nRoomIndex][nPosIndex][1],tFightRoom[nRoomIndex][nPosIndex][2]);
end;