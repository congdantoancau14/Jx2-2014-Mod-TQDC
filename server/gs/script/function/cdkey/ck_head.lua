Include("\\script\\function\\cdkey\\ck_define.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\date.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\online_activites\\activity_head.lua")
Include("\\script\\online\\chuyen_sinh\\translife_head.lua")
Include("\\settings\\static_script\\cheat\\list_gm.lua")

CK_TASK_GROUP = TaskManager:Create(CK_TASK_GROUP[1], CK_TASK_GROUP[2]);
CK_TASK_GROUP.Task1 = 1 
CK_TASK_GROUP.Task2 = 2 
CK_TASK_GROUP.Task3 = 3 
CK_TASK_GROUP.Task4 = 4
CK_TASK_GROUP.Task5 = 5
CK_TASK_GROUP.Score = 6 
CK_TASK_GROUP.Award = 7

CK_NPC_NAME = "<color=green> ��i S� Ho�t ��ng: <color>";
CK_NPC_TITLE = "Tham gia <color=green>V� L�m T�n T�<color> �� nh�n ���c nh�ng ph�n th��ng c�c gi� tr�";

CK_NPC_DIALOG = {
	"K�ch ho�t danh hi�u/ck_ActTilte_1",
	"\nNhi�m v� H��ng D�n/ck_FastTask_Guide",
	"\nNhi�m v� H�ng Ng�y/ck_BaiZhanBuDai",
	"\nNhi�m v� Bang H�i/ck_FastTask_Tong",
	"\nNhi�m v� T�ng C�p/ck_ZiloTask_1",
	"\nNhi�m v� Thi�n Ki�u L�nh/ck_ZiloTask_2",
	"\n�i�m n�ng ��ng ��i ph�n th��ng/ck_ScoreAward",
	"\nKi�m tra Thi�n Ki�u L�nh/cdk_QueryUseTianJiaoLingNum",
}

function GM_Test()
	ck_AddCkScore(23000)
end

function cdk_QueryUseTianJiaoLingNum()
	if ck_CheckCondition() ~= 1 then
		return 0;
	end

	Say(CK_NPC_NAME..format("%s t�ng s� <color=green>Thi�n Ki�u L�nh<color> �� s� d�ng <color=gold>%d<color>", gf_GetPlayerSexName(), ck_GetCostIB()), 0);	
end

--CheckEvent
function ck_IsOpen()
	--return gf_CheckDuration(CK_START_TIME, CK_END_TIME);	
	return 1;
end

function ck_IsStatus()
	--local nExtPoint = GetExtPoint(EXT_CDKEY)
	--if GetBit(nExtPoint,2) == 1 or GetBit(nExtPoint,4) == 1 or GetBit(nExtPoint,6) == 1 then
	--	Talk(1, "", "Hi�n t�i kh�ng c� ho�t ��ng n�o")
	--	return 0
	--end
	return 1
end


--Reset Nhi�m V�
function ck_DailyReset()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	-----------------------------
	for i = 12, 31 do
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, i, 0);
	end
	CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Task2, 0); 
	for i = 1, 16 do
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, i, 0);
	end
	-----------------------------
	for i = 234, 238 do
		DirectDeleteTask(i)
	end
end

function ck_GetRandIndex(nMax)
	local today = Date();
	local wDay = today:week();
	if wDay == 0 then wDay = 7 end
	return mod(wDay, nMax) + 1;	
end

-- Check Danh Hi�u
function ck_GetTitleType()
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) == 1 then
		return 1;
	end
	return 0;
end

-- Get �i�m
function ck_GetCkScore()
	return CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score);
end

-- Set �i�m
function ck_AddCkScore(nAdd)
	if not nAdd or nAdd < 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Score, CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score) + nAdd);
	Msg2Player(format("�i�m n�ng ��ng t�ng %d, t�ng �i�m l� %d", nAdd, CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score)));
end

-- K�ch Ho�t Danh Hi�u (Start)
function ck_ActTilte_1()
	local nExtPoint = GetExtPoint(EXT_CDKEY)
	local nCS = GetPlayerRebornParam(0) + GetTranslifeCount()
	
	if GetBit(nExtPoint,9) == 1 then
		Talk(1,"",CK_NPC_NAME .."T�i kho�n c�c h� �� ���c k�ch ho�t r�i.")
		return 0
	end

	if ck_GetTitleType() == 1 then
		Say(CK_NPC_NAME..format("�� nh�n danh hi�u <color=gold>[%s]<color> r�i", "V� L�m T�n T�"), 0)
		return 0;
	end
	DebugOutput(GetExtPoint(1), GetExtPoint(2))
	
	if nCS == 0 and GetLevel() <= 73 then
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 1, 1);
		--Nh�n Danh Hi�u v� T�ng C�p 90
		SetLevel(90, 1);
		
		--Nh�n Set Di�u D��ng
		ahf_GetYaoYangByRouteBody(VET_YAOYANG_CAP);
		ahf_GetYaoYangByRouteBody(VET_YAOYANG_CLOTH);
		ahf_GetYaoYangByRouteBody(VET_YAOYANG_SHOE);
		ahf_GetYaoYangWeaponRand(1);
		
		AddItem(0, 102, 3185, 1, 4, -1, -1, -1, -1, -1, -1,1,0)
		AddItem(0, 102, 3186, 1, 4, -1, -1, -1, -1, -1, -1,1,0)
		AddItem(0, 102, 3187, 1, 4, -1, -1, -1, -1, -1, -1,1,0)
		AddItem(0, 102, 3188, 1, 4, -1, -1, -1, -1, -1, -1,1,0)
		AddItem(0, 102, 3189, 1, 4, -1, -1, -1, -1, -1, -1,1,0)
		
		EndKichHoat()
	else
		Talk(1,"",CK_NPC_NAME .."��ng c�p c�a b�n qu� cao, kh�ng th� tham gia t�nh n�ng n�y")
	end
end


function EndKichHoat()
	--B� 3 Th�n Ho�n
	AddItem(2,1,270,1);
	AddItem(2,1,1097,1);
	AddItem(2,1,1064,1);
	
	-- N� ao, b�t nh�, ng�i sao
	AddItem(2,0,504,1); 
	AddItem(2,1,30154,1);
	AddItem(2,1,30191,1);
	
	-- Thi�n Khi�u L�nh
	AddItem(2,95,2087,1);
	
	AddTitle(68, 1);
	gf_WriteLogEx("CDKEY", "ck_ActTilte", "AddTitle(68, 1)");
	CDKEY_SetExtBit(EXT_CDKEY,9,1)
	Say(CK_NPC_NAME.."K�ch hoat th�nh c�ng, gi� b�n c� th� tham gia c�c t�nh n�ng c�a s� ki�n. Tr��c ti�n h�y ��ng nh�p l�i.",1,"Tho�t/ExitGame");
end

function CDKEY_SetExtBit(nExtPoint, nBit, nBitValue)
	if nBit < 1 or nBit > 15 then
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "fail", 1, "Out of range")
		return 0
	end
	local nValue = GetExtPoint(nExtPoint)
	local nNewValue = SetBit(nValue, nBit, nBitValue)
	PayExtPoint(nExtPoint, GetExtPoint(nExtPoint))
	AddExtPoint(nExtPoint, nNewValue)
	if GetExtPoint(nExtPoint) == nNewValue then
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "success", 1, "From "..nValue.." to "..nNewValue)
		return 1
	else
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "fail", 1, "From "..nValue.." to "..GetExtPoint(nExtPoint))
		return 0
	end
end

--Check Is Open
function ck_CheckCondition()
	local nKind = ck_GetTitleType();
	if nKind == 0 then
		Say(CK_NPC_NAME.."V�n ch�a nh�n v� k�ch ho�t <color=gold>V� L�m Th�n H�nh<color>, kh�ng th� tham gia s� ki�n", 0);
		return 0;
	end
	if GetLevel() < 90 and gf_GetPlayerRebornCount() <= 0 then
		Say(CK_NPC_NAME..format("��ng c�p nh�n v�t kh�ng �� %d c�p, kh�ng th� tham gia nhi�m v�", 90), 0);
		return 0;
	end
	return 1;
end

--Nhi�m v� h�ng ng�y
function ck_BaiZhanBuDai()
	if ck_CheckCondition() ~= 1 then
		return 0;
	end
	local tSay = {
		"\nNhi�m v� ��nh Qu�i/ck_BZBD_Kill",
		"\nNhi�m v� Ph� B�n/ck_BZBD_Raid",
		"\nNhi�m v� PVP/ck_BZBD_PVP",
		"\nT�i ch� xem xem th�i/nothing",	
	}
	Say(CK_NPC_NAME.." Nhi�m v� <color=gold>H�ng Ng�y<color> nh�n ng�u nhi�n s� l�m m�i h�ng ng�y, nh�n ���c nhi�u kinh nghi�m v� �� n�ng ��ng!", getn(tSay), tSay);	
end

function ck_BZBD_GetType(nIndex1, nIndex2, nIndex3)
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex3) == 1 then
		return 0.8;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex2) == 1 then
		return 0.8;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex1) == 1 then
		return 0.2;
	end
	return 0;
end

function ck_BZBD_SetType(nIndex1, nIndex2, nIndex3)
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex1, 0)
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex2, 0)
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex3, 0)
	local nSize = gf_GetTeamSize();
	if nSize <= 1 then
		return 0;
	end
	--print("nSize =", nSize)
	local oldPlayerIndex = PlayerIndex;
	local nSelfType = ck_GetTitleType();
	if nSelfType == 0 then
		return 0;
	end
	if nSelfType == 1 then
		for i = 1, nSize do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= oldPlayerIndex then
				if ck_GetTitleType() == 1 then
					PlayerIndex = oldPlayerIndex
					CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex3, 1)
					return 1;
				end
			end
		end
	end
	if nSelfType == 2 then
		for i = 1, nSize do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= oldPlayerIndex then
				if ck_GetTitleType() == 3 then
					PlayerIndex = oldPlayerIndex
					CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex2, 1)
					return 1;
				end
			end
		end
	end	
	if nSelfType == 3 then
		for i = 1, nSize do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= oldPlayerIndex then
				if ck_GetTitleType() == 3 then
					PlayerIndex = oldPlayerIndex
					CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex1, 1)
				end
				if ck_GetTitleType() == 2 then
					PlayerIndex = oldPlayerIndex
					CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex2, 1)
				end
			end
		end
	end
	PlayerIndex = oldPlayerIndex;		
end

--H�ng Ng�y ��nh Qu�i
function ck_BZBD_Kill()
	local nCount = 0;
	local nTaskIndex1 = 0;
	local nTaskIndex2 = 0;
	for i = 12, 16 do
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) == 1 then
			if nTaskIndex1 == 0 then
				nTaskIndex1 = i - 11;
			elseif nTaskIndex2 == 0 then
				nTaskIndex2 = i - 11;
			end
			nCount = nCount + 1;
		end
	end
	if nCount ~= 2 then
		for i = 12, 21 do
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, i, 0)
		end
		nCount = ck_GetRandIndex(getn(CK_TASK_BZ_KILL));
		nTaskIndex1 = nCount;
		if 0 ~= mod(nCount + 3, 5) then
			nTaskIndex2 = mod(nCount + 3, 5);
		else
			nTaskIndex2 = 5;
		end
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 11 + nTaskIndex1, 1);
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 11 + nTaskIndex2, 1);
	end
	DebugOutput("nTaskIndex1, nTaskIndex2 =", nTaskIndex1, nTaskIndex2);
	--���Ի�
	local tSay = {}
	local tMsg = {"Ch�a nh�n", "Ch�a ho�n th�nh", "Ca th� giao", "�� ho�n th�nh"}
	local tTask = {nTaskIndex1, nTaskIndex2};
	for i = 1, getn(tTask) do
		local nType = 0;
		DebugOutput("tTask[i] =", tTask[i])
		local nType = 0;
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 16 + tTask[i]) == 1 then
			nType = 4;
		else
			if tGtTask:check_cur_task(CK_TASK_BZ_KILL[tTask[i]][2]) == 0 then
				nType = 1;
			else
				if DirectIsTaskFinish(CK_TASK_BZ_KILL[tTask[i]][2]) then
					nType = 3;
				else
					nType = 2;
				end
			end
		end
		if tMsg[nType] then
			tinsert(tSay, format("\n%s(%s)/#ck_BZBD_Kill_do(%d, %d)", CK_TASK_BZ_KILL[tTask[i]][1], tMsg[nType], CK_TASK_BZ_KILL[tTask[i]][2], 16 + tTask[i]));
		end
	end
	tinsert(tSay, "T�i ch� xem xem th�i/nothing");
	Say(CK_NPC_NAME.."Tr�m Tr�n Tr�m Th�ng-Nhi�m v� ��nh qu�i",getn(tSay), tSay);
end

function ck_BZBD_Kill_do(nTaskID, nTaskIndex)
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex) ~= 0 then
		Say(CK_NPC_NAME.."Nhi�m v� n�y �� ho�n th�nh!", 0);
		return 0;
	end
	if tGtTask:check_cur_task(nTaskID) == 0 then
		DirectGetGTask(nTaskID, 1)
	else
		DebugOutput(nTaskID, DirectIsTaskFinish(nTaskID))
		if DirectIsTaskFinish(nTaskID) then
			if 1 == DirectFinishGTask(nTaskID, 2) then
				CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex, 1);
				Msg2Player("�� ho�n th�nh nhi�m v�!")
			else
				Msg2Player("Nhi�m v� kh�c th��ng, kh�ng th� ho�n th�nh!");
			end
		else
			Say(CK_NPC_NAME.."Nhi�m v� v�n ch�a ho�n th�nh!", 0);
		end
	end
end

function ck_BZBD_Kill_Award()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	local nParam = ck_BZBD_GetType(8, 9, 10);
	gf_ModifyExp(floor(3000000*(1 + nParam)));
	ck_AddCkScore(floor(20 * (1 + nParam)));
end

function _ck_BZBD_Kill_Set()
	gf_TeamOperateEX(function()
		if ck_IsOpen() ~= 1 then
			return 0;
		end
		if ck_GetTitleType() == 0 then
			return 0;
		end
		local nCount = 0;
		local nTaskIndex = 0;
		for i = 12, 16 do 
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) ~= 0 then
				nCount = nCount + 1;
				nTaskIndex = i - 11;
			end
		end
		if nCount ~= 2 then
			return 0;
		end
		ck_BZBD_SetType(8, 9, 10);
	end);
end


--H�ng Ng�y Ph� B�n
function ck_BZBD_Raid()
	local nCount = 0;
	local nTaskIndex = 0;
	for i = 22, 26 do 
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) ~= 0 then
			nCount = nCount + 1;
			nTaskIndex = i - 21;
		end
	end
	if nCount ~= 1 then
		for i = 22, 31 do 
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, i, 0);
		end
		for i = 1, 10 do 
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, i, 0);
		end
		nTaskIndex = ck_GetRandIndex(getn(CK_TASK_BZ_RAID));
		
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 21 + nTaskIndex, 1);
	end
	local tMsg = {"Ch�a nh�n", "Ch�a ho�n th�nh", "C� th� giao", "�� ho�n th�nh"}
	local nType = 0;
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 26 + nTaskIndex) == 0 then
		nType = 1;
	else
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, nTaskIndex) == 0 then
			nType = 2;
		else
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 5 + nTaskIndex) == 0 then
				nType = 3;
			else
				nType = 4;
			end
		end
	end
	DebugOutput(CK_TASK_BZ_RAID[nTaskIndex], tMsg[nType], nTaskIndex)
	local tSay = {
		format("%s(%s)/#ck_BZBD_Raid_do(%d)",	CK_TASK_BZ_RAID[nTaskIndex], tMsg[nType], nTaskIndex),
		"T�i ch� xem xem th�i/nothing",
	}
	Say(CK_NPC_NAME.."Tr�m Tr�n Tr�m Th�ng-Nhi�m v� ph� b�n", getn(tSay), tSay);
end

function ck_BZBD_Raid_do(nTaskIndex)
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 26 + nTaskIndex) == 0 then
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 26 + nTaskIndex, 1);
		Say(CK_NPC_NAME..format("�� nh�n nhi�m v� <color=gold>%s<color>", CK_TASK_BZ_RAID[nTaskIndex]), 0);
	else
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, nTaskIndex) == 0 then
			Say(CK_NPC_NAME..format("Ch�a ho�n th�nh nhi�m v� <color=gold>%s<color>", CK_TASK_BZ_RAID[nTaskIndex]), 0);
		else
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 5 + nTaskIndex) == 0 then
				CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 5 + nTaskIndex, 1);
				ck_BZBD_Raid_Award();
			else
				Say(CK_NPC_NAME..format("�� ho�n th�nh nhi�m v� <color=gold>%s<color>", CK_TASK_BZ_RAID[nTaskIndex]), 0);
			end
		end
	end	
end

function ck_BZBD_Raid_Award()
	local nParam = ck_BZBD_GetType(11, 12, 13);
	gf_ModifyExp(floor(5000000*(1 + nParam)));
	ck_AddCkScore(floor(30 * (1 + nParam)));
end

function _ck_BZBD_Raid_Set(nCurIndex)
	gf_TeamOperateEX(function()
		if ck_IsOpen() ~= 1 then
			return 0;
		end
		if ck_GetTitleType() == 0 then
			return 0;
		end
		local nCount = 0;
		local nTaskIndex = 0;
		for i = 22, 26 do 
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) ~= 0 then
				nCount = nCount + 1;
				nTaskIndex = i - 21;
			end
		end
		if nCount ~= 1 then
			return 0;
		end
		if tonumber(%nCurIndex) ~= nTaskIndex then
			return 0;
		end
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, nTaskIndex) ~= 1 then
			ck_BZBD_SetType(11, 12, 13);
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, nTaskIndex, 1);
			Msg2Player(format("�� ho�n th�nh nhi�m v� %s", CK_TASK_BZ_RAID[nTaskIndex]));
		end
	end);
end


--H�ng Ng�y PVP
function ck_BZBD_PVP()
	local nCount = 0;
	local nTaskIndex = 0;
	for i = 11, 17 do 
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, i) ~= 0 then
			nCount = nCount + 1;
			nTaskIndex = i - 10;
		end
	end
	if nCount ~= 1 then
		for i = 18, 31 do 
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, i, 0);
		end
		for i = 1, 7 do 
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, i, 0);
		end
		nTaskIndex = random(7);
		----------------------
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 10 + nTaskIndex, 1);
	end
	local tMsg = {"Ch�a nh�n", "Ch�a ho�n th�nh", "C� th� giao", "�� ho�n th�nh"}
	local nType = 0;
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 17 + nTaskIndex) == 0 then
		nType = 1;
	else
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex) == 0 then
			nType = 2;
		else
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nTaskIndex) == 0 then
				nType = 3;
			else
				nType = 4;
			end
		end
	end
	local tSay = {
		format("%s(%s)/#ck_BZBD_PVP_do(%d)",	CK_TASK_BZ_PVP[nTaskIndex], tMsg[nType], nTaskIndex),
		"T�i ch� xem xem th�i/nothing",
	}
	Say(CK_NPC_NAME.."Tr�m Tr�n Tr�m Th�ng-Nhi�m v� PVP!", getn(tSay), tSay);
end

function ck_BZBD_PVP_do(nTaskIndex)
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 17 + nTaskIndex) == 0 then
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 17 + nTaskIndex, 1);
		Say(CK_NPC_NAME..format("�� nh�n <color=gold>%s<color>", CK_TASK_BZ_PVP[nTaskIndex]), 0);
	else
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex) == 0 then
			Say(CK_NPC_NAME..format("Ch�a ho�n th�nh <color=gold>%s<color>", CK_TASK_BZ_PVP[nTaskIndex]), 0);
		else
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nTaskIndex) == 0 then
				CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nTaskIndex, 1);
				--������
				ck_BZBD_PVP_Award();
			else
				Say(CK_NPC_NAME..format("�� ho�n th�nh <color=gold>%s<color>", CK_TASK_BZ_PVP[nTaskIndex]), 0);
			end
		end
	end	
	--===========
	if nTaskIndex == 1 or nTaskIndex == 2 or nTaskIndex == 7 then
		local nTaskIndex = 0;
		for i = 11, 17 do 
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, i) ~= 0 then
				nTaskIndex = i - 10;
			end
		end
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex) ~= 1 then
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex, 1);
			Msg2Player(format("�� ho�n th�nh nhi�m v� %s", CK_TASK_BZ_PVP[nTaskIndex]));
		end	
	end
	--===========
end

function ck_BZBD_PVP_Award()
	if GetGlbValue(1023) == 92 then
		if gf_GetTaskByte(TSK_NHIEMVUCDKEY,1) == 1 then
			Talk(1,"","C�c h� �� nh�n ph�n th��ng ng�y h�m nay r�i. Xin vui l�ng quay l�i ng�y h�m sau!")
			return
		end
		gf_ModifyExp(14400000);
		ck_AddCkScore(100);
	
		--Set nh�n th��ng m�i ng�y
		gf_SetTaskByte(TSK_NHIEMVUCDKEY,1,1)
		return
	end
	
	local nParam = 0.8;
	gf_ModifyExp(floor(8000000*(1 + nParam)));
	ck_AddCkScore(floor(20 * (1 + nParam)));
end

function _ck_BZBD_PVP_Set(nCurIndex)
	gf_TeamOperateEX(function()
		if ck_IsOpen() ~= 1 then
			return 0;
		end
		if ck_GetTitleType() == 0 then
			return 0;
		end
		local nCount = 0;
		local nTaskIndex = 0;
		for i = 11, 17 do 
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, i) ~= 0 then
				nCount = nCount + 1;
				nTaskIndex = i - 10;
			end
		end
		if nCount ~= 1 then
			return 0;
		end
		if tonumber(%nCurIndex) ~= nTaskIndex then
			return 0;
		end
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex) ~= 1 then
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex, 1);
			Msg2Player(format("�� ho�n th�nh nhi�m v� %s", CK_TASK_BZ_PVP[nTaskIndex]));
		end
	end);
end


--Nhi�m v� Bang H�i
function ck_FastTask_Tong()
	if ck_CheckCondition() ~= 1 then
		return 0;
	end

	local tSay = {
		"\nGia nh�p Bang H�i/ck_FastTask_Tong_1",
		"\nT�i chi�n Th�n Th�/ck_FastTask_Tong_2",
		"\nN��ng Th�t bang ph�i/ck_FastTask_Tong_3",
		"\nT�i ch� xem xem th�i/nothing",	
	}
	Say(CK_NPC_NAME.." Nhi�m v� <color=gold>Bang H�i<color> T�ng �i�m ho�n th�nh c� 3 nhi�m v� l� <color=green>1000<color>", getn(tSay), tSay);		
end

function ck_FastTask_Tong_1(nFlag)
	if not nFlag then
		local tSay = {
			"\nHo�n th�nh nhi�m v�/#ck_FastTask_Tong_1(1)",
			"\nT�i ch� xem xem th�i/nothing",	
		}
		local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i�u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d",
		"Gia nh�p bang h�i", "Gia nh�p m�t bang h�i b�t k�, tr� th�nh m�t th�nh vi�n trong bang", "Gia nh�p bang h�i, c�ng v�i th�nh vi�n kh�c c� g�ng �� gi�p bang h�i ng�y c�ng l�n m�nh", 3000000, 200);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 17) ~= 0 then
		Say(CK_NPC_NAME.."�� ho�n th�nh nhi�m v� n�y", 0);
		return 0;
	end
	if IsTongMember() <= 0 then
		Say(CK_NPC_NAME.."C� v� nh� b�n ch�a gia nh�p bang h�i", 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 17, 1);
	gf_ModifyExp(3000000);
	ck_AddCkScore(200);	
end

function ck_FastTask_Tong_2(nFlag)
	if not nFlag then
		local tSay = {
			"\nHo�n th�nh nhi�m v�/#ck_FastTask_Tong_2(1)",
			"\nT�i ch� xem xem th�i/nothing",	
		}
		local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i�u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d",
		"T�i chi�n Th�n Th�", "N�p 100 �i�m t� quang", "Tham gia T� Quang C�c ��nh b�i T� Quang Th�n Th� s� nh�n ���c �i�m t�ch l�y t� quang", 5000000, 500);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 18) ~= 0 then
		Say(CK_NPC_NAME.."�� ho�n th�nh nhi�m v� n�y!", 0);
		return 0;
	end

	local TSK_POINT = 652;
	if GetTask(TSK_POINT) < 100 then
		Say(CK_NPC_NAME..format("�i�m t� quang kh�ng �� <color=red>%d<color> �i�m", 100), 0);
		return 0;
	end
	SetTask(TSK_POINT, GetTask(TSK_POINT) - 100);
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 18, 1);

	gf_ModifyExp(5000000);
	ck_AddCkScore(500);
end

function ck_FastTask_Tong_3(nFlag)
	if not nFlag then
		local tSay = {
			"\nHo�n th�nh nhi�m v�/#ck_FastTask_Tong_3(1)",
			"\nT�i ch� xem xem th�i/nothing",	
		}
		local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i�u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d",
			"N��ng th�t bang ph�i", "Tham d� t�nh n�ng N��ng Th�t bang ph�i n�p 10 M�nh L�nh B�i Bang Ph�i", "Ho�t ��ng N��ng th�t bang ph�i v� c�ng th� v�, mau �i thu th�p M�nh L�nh B�i Bang Ph�i n�o", 8000000, 300);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 19) ~= 0 then
		Say(CK_NPC_NAME.."�� ho�n th�nh nhi�m v� n�y", 0);
		return 0;
	end

	if DelItem(2, 1, 30588, 10) ~= 1 then
		Say(CK_NPC_NAME..format("<color=red>%s<color> trong t�i kh�ng �� <color=red>%d<color> c�i", "M�nh L�nh B�i Bang H�i", 10), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 19, 1);

	gf_ModifyExp(8000000);
	ck_AddCkScore(300);
end


-- Nhi�m v� H��ng D�n
function ck_FastTask_Guide()
	if ck_CheckCondition() ~= 1 then
		return 0;
	end
	
	local tSay = {
		"\nK�ch Ho�t Th� Th�ng/ck_FastTask_Guide_1",
		"\nD�ng c�c lo�i Th�n Ho�n/ck_FastTask_Guide_2",
		"\nTr�ng C�y B�t Nh� Nh�/ck_FastTask_Guide_3",
		"\nD�ng N� Oa B�o H�p v� Ng�i Sao May M�n/ck_FastTask_Guide_4",
		"\nT�i ch� xem xem th�i/nothing",	
	}
	Say(CK_NPC_NAME.." Nhi�m v� <color=gold>H��ng D�n<color> T�ng �i�m ho�n th�nh c� 3 nhi�m v� l� <color=green>3000<color>", getn(tSay), tSay);	
end

function ck_FastTask_Guide_1(nFlag)
	if not nFlag then
		local tSay = {
			"\nHo�n th�nh nhi�m v�/#ck_FastTask_Guide_1(1)",
			"\nT�i ch� xem xem th�i/nothing",	
		}
		local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i�u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d",
			"Th� Th�ng", "K�ch ho�t th� th�ng VIP v� l�m", "K�ch ho�t th� th�ng t�i C�m Nang ��i S� Ki�n", 8000000, 1200);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 20) ~= 0 then
		Say(CK_NPC_NAME.."�� ho�n th�nh nhi�m v� n�y!", 0);
		return 0;
	end
	if IsActivatedVipCard() ~= 1 then
		Say(CK_NPC_NAME.."V�n ch�a k�ch ho�t th� th�ng, kh�ng th� ho�n th�nh nhi�m v�", 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 20, 1);

	gf_ModifyExp(8000000);
	ck_AddCkScore(1200);
end

function ck_FastTask_Guide_2(nFlag)
	if not nFlag then
		local tSay = {
			"\nHo�n th�nh nhi�m v�/#ck_FastTask_Guide_2(1)",
			"\nT�i ch� xem xem th�i/nothing",	
		}
		local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i�u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d",
			"Thu�c vi�n", "S� d�ng 1 l�n B�ch C�u Ho�n, Tam Thanh Ho�n v� L�c Th�n Ho�n", "S� d�ng c�c lo�i thu�c s� gi�p b�n m�t tay", 5000000, 300);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 24) ~= 0 then
		Say(CK_NPC_NAME.."�� ho�n th�nh nhi�m v� n�y!", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 21) ~= 1 then
		Say(CK_NPC_NAME..format("V�n ch�a s� d�ng b�t k� <color=red>%s<color>", "B�ch C�u Ho�n"), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 22) ~= 1 then
		Say(CK_NPC_NAME..format("V�n ch�a s� d�ng b�t k� <color=red>%s<color>", "Tam Thanh ho�n"), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 23) ~= 1 then
		Say(CK_NPC_NAME..format("V�n ch�a s� d�ng b�t k� <color=red>%s<color>", "L�c Th�n ho�n"), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 24, 1);

	gf_ModifyExp(5000000);
	ck_AddCkScore(300);
end

function ck_FastTask_Guide_3(nFlag)
	if not nFlag then
		local tSay = {
			"\nHo�n th�nh nhi�m v�/#ck_FastTask_Guide_3(1)",
			"\nT�i ch� xem xem th�i/nothing",	
		}
		local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i�u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d",
			"C�y B�t Nh� nh�", "Tr�ng 1 C�y B�t Nh� Nh�", "Tr�ng C�y B�t Nh� Nh�, nh�n ���c ph�n th��ng kinh nghi�m", 5000000, 600);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 26) ~= 0 then
		Say(CK_NPC_NAME.."�� ho�n th�nh nhi�m v� n�y!", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 25) ~= 1 then
		Say(CK_NPC_NAME..format("V�n ch�a tr�ng <color=red>%s<color>", "C�y B�t Nh� nh�"), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 26, 1);

	gf_ModifyExp(5000000);
	ck_AddCkScore(600);
end

function ck_FastTask_Guide_4(nFlag)
	if ck_CheckCondition() ~= 1 then
		return 0;
	end

	if not nFlag then
		local tSay = {
			"\nHo�n th�nh nhi�m v�/#ck_FastTask_Guide_4(1)",
			"\nT�i ch� xem xem th�i/nothing",	
		}
		local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i�u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d",
			"N� Oa B�o H�p v� Ng�i Sao May M�n", "S� d�ng 1 l�n N� Oa B�o H�p v� Ng�i Sao May M�n", "N� Oa B�o H�p v� Ng�i Sao May M�n l� b�o v�t, m� ra xem th� b�n trong ca ph�n th��ng kh�ng", 5000000, 900);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 29) ~= 0 then
		Say(CK_NPC_NAME.."�� ho�n th�nh nhi�m v� n�y!", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 27) ~= 1 then
		Say(CK_NPC_NAME..format("V�n ch�a s� d�ng b�t k� <color=red>%s<color>", "N� Oa B�o H�p"), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 28) ~= 1 then
		Say(CK_NPC_NAME..format("V�n ch�a s� d�ng b�t k� <color=red>%s<color>", "Ng�i sao may m�n"), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 29, 1);

	gf_ModifyExp(5000000);
	ck_AddCkScore(900);
end

function _ck_UseItemBaiJu()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 21, 1);
end

function _ck_UseItemSanQing()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 22, 1);
end

function _ck_UseItemLiuShen()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 23, 1);
end

function _ck_UseItemNvWa()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 27, 1);	
end

function _ck_UseItemLuckyStart()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 28, 1);		
end

function _ck_PlantSmallBanRuo()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 25, 1);	
end

function _ck_BZBD_Raid_Set(nCurIndex)
	gf_TeamOperateEX(function()
		if ck_IsOpen() ~= 1 then
			return 0;
		end
		if ck_GetTitleType() == 0 then
			return 0;
		end
		local nCount = 0;
		local nTaskIndex = 0;
		for i = 22, 26 do 
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) ~= 0 then
				nCount = nCount + 1;
				nTaskIndex = i - 21;
			end
		end
		if nCount ~= 1 then
			return 0;
		end
		if tonumber(%nCurIndex) ~= nTaskIndex then
			return 0;
		end
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, nTaskIndex) ~= 1 then
			ck_BZBD_SetType(11, 12, 13);
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, nTaskIndex, 1);
			Msg2Player(format("�� ho�n th�nh nhi�m v� %s", CK_TASK_BZ_RAID[nTaskIndex]));
		end
	end);
end

function _ck_SetCostIB(nNum)
	if ck_IsOpen() ~= 1 then
		--print("SetCostIB",nNum,"not open")
		return 0;
	end
	if ck_GetTitleType() == 0 then
		--print("SetCostIB",nNum,"no titile")
		return 0;
	end
	nNum = nNum or 1;
	--print("GetCostIB",ck_GetCostIB(),CK_TASK_GROUP.Task5)
	CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Task5, ck_GetCostIB() + tonumber(nNum));
end

function _ck_BZBD_PVP_Set(nCurIndex)
	gf_TeamOperateEX(function()
		if ck_IsOpen() ~= 1 then
			return 0;
		end
		if ck_GetTitleType() == 0 then
			return 0;
		end
		local nCount = 0;
		local nTaskIndex = 0;
		for i = 11, 17 do 
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, i) ~= 0 then
				nCount = nCount + 1;
				nTaskIndex = i - 10;
			end
		end
		if nCount ~= 1 then
			return 0;
		end
		if tonumber(%nCurIndex) ~= nTaskIndex then
			return 0;
		end
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex) ~= 1 then
			--ck_BZBD_SetType(14, 15, 16);
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex, 1);
			Msg2Player(format("�� ho�n th�nh nhi�m v� %s", CK_TASK_BZ_PVP[nTaskIndex]));
		end
	end);
end

function _ck_BZBD_Kill_Set()
	--print("_ck_BZBD_Kill_Set()")
	gf_TeamOperateEX(function()
		if ck_IsOpen() ~= 1 then
			return 0;
		end
		if ck_GetTitleType() == 0 then
			return 0;
		end
		local nCount = 0;
		local nTaskIndex = 0;
		for i = 12, 16 do 
			--print(i, CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i))
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) ~= 0 then
				nCount = nCount + 1;
				nTaskIndex = i - 11;
			end
		end
		--print("nCount =", nCount)
		if nCount ~= 2 then
			return 0;
		end
		ck_BZBD_SetType(8, 9, 10);
	end);
end

--Nhi�m v� T�ng C�p
function ck_ZiloTask_1(bTalk)
	if ck_CheckCondition() ~= 1 then
		return 0;
	end

	local nTaskIndex = 0;
	for i = CK_TASK_ZILON_ATRR_BEGIN, getn(CK_TASK_ZILON_ATRR) do
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task4, i) ~= 1 then
			nTaskIndex = i;
			break;
		end
	end
	if nTaskIndex == 0 then
		Say(CK_NPC_NAME..format("Ch�c m�ng %s �� ho�n th�nh to�n b� <color=gold>nhi�m v� t�ch l�y thu�c t�nh<color>!", gf_GetPlayerSexName()), 0)
		return 0;
	end
	local tCell = CK_TASK_ZILON_ATRR[nTaskIndex];
	if not tCell then  return 0; end
	if not bTalk then
		local tSay = {
			"\nTa mu�n ho�n th�nh/#ck_ZiloTask_1(1)",
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Str = format("Nh�n v�t �� ��t chuy�n sinh %d c�p %d, t�ch l�y %d �i�m danh v�ng, %d �i�m s� m�n, %d �i�m c�ng tr�ng", tCell[2][1], tCell[2][2], tCell[2][3], tCell[2][4], tCell[2][5]);
		local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i�u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d",	tCell[1], Str, "N� l�c t�ch l�y s� gi�p b�n th�n ng�y c�ng l�n m�nh", tCell[3][1], tCell[3][2]);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if gf_GetPlayerRebornCount() < tCell[2][1] then
		Say(CK_NPC_NAME..format("C�p chuy�n sinh c�a %s kh�ng �� <color=red>%d<color>", gf_GetPlayerSexName(), tCell[2][1]), 0);
		return 0;
	end
	if GetLevel() < tCell[2][2] and gf_GetPlayerRebornCount() <= tCell[2][1] then
		Say(CK_NPC_NAME..format("��ng c�p c�a %s kh�ng �� <color=red>%d<color>", gf_GetPlayerSexName(), tCell[2][2]), 0);
		return 0;
	end
	if GetReputation() < tCell[2][3] then
		Say(CK_NPC_NAME..format("�i�m t�ch l�y danh v�ng c�a %s kh�ng �� <color=red>%d<color> �i�m", gf_GetPlayerSexName(), tCell[2][3]), 0);
		return 0;
	end
	if GetTask(336) < tCell[2][4] then
		Say(CK_NPC_NAME..format("�i�m t�ch l�y s� m�n c�a %s kh�ng �� <color=red>%d<color> �i�m", gf_GetPlayerSexName(), tCell[2][4]), 0);
		return 0;
	end
	if abs(GetTask(701)) < tCell[2][5] then
		Say(CK_NPC_NAME..format("�i�m t�ch l�y c�ng tr�ng c�a %s kh�ng �� <color=red>%d<color> �i�m", gf_GetPlayerSexName(), tCell[2][5]), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task4, nTaskIndex, 1);

	gf_ModifyExp(tCell[3][1]);
	ck_AddCkScore(tCell[3][2]);

	ck_ZiloTask_1();
end


--Nhi�m V� Thi�n Ki�u L�nh
function ck_GetCostIB()
	return CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Task5);
end

function ck_ZiloTask_2(bTalk)
	if ck_CheckCondition() ~= 1 then
		return 0;
	end

	local nTaskIndex = 0;
	for i = CK_TASK_IB_COST_BEGIN, CK_TASK_IB_COST_BEGIN+getn(CK_TASK_IB_COST)-1 do
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task4, i) ~= 1 then
			nTaskIndex = i - CK_TASK_IB_COST_BEGIN + 1;
			break;
		end
	end
	if nTaskIndex == 0 then
		Say(CK_NPC_NAME..format("Ch�c m�ng %s �� ho�n th�nh to�n b� <color=gold>nhi�m v� ti�u ph�<color>!", gf_GetPlayerSexName()), 0)
		return 0;
	end
	local tCell = CK_TASK_IB_COST[nTaskIndex];
	if not tCell then  return 0; end
	if not bTalk then
		local tSay = {
			"\nTa mu�n ho�n th�nh/#ck_ZiloTask_2(1)",
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Str = format("Trong �i b�t k� c�a ��a Huy�n Cung, V�n Ki�m Tr�ng, L��ng S�n v� Th�i Nh�t Th�p t�ch l�y s� d�ng %d Thi�n Ki�u L�nh �� m� r��ng", tCell[2]);
		local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i?u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d", tCell[1], Str, "D�ng Thi�n Ki�u L�nh �� m� r��ng s� nh�n ���c ph�n th��ng phong ph�", tCell[3][1], tCell[3][2]);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if ck_GetCostIB() < tCell[2] then
		Say(CK_NPC_NAME..format("� �i hi�n t�i, s� l��ng Thi�n Ki�u L�nh do %s ti�u ph� kh�ng �� <color=red>%d<color> c�i", gf_GetPlayerSexName(), tCell[2]), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task4, CK_TASK_IB_COST_BEGIN + nTaskIndex - 1, 1);

	gf_ModifyExp(tCell[3][1]);
	ck_AddCkScore(tCell[3][2]);
	
	ck_ZiloTask_2();
end


--�i�m N�ng ��ng ��i Ph�n Th��ng
function ck_ScoreAward()
	if ck_CheckCondition() ~= 1 then
		return 0;
	end

	cd_tbRoute = {[2] = 1, [4] = 1, [3] = 1, [6] = 1, [8] = 1, [9] = 1, [11] = 1, [12] = 1, [14] = 1, [15] = 1, [17] = 1, [18] = 1, [20] = 1, [21] = 1, [23] = 1, [25] = 1, [26] = 1, [27] = 1, [29] = 1,[30] = 1,}
	local nRoute = GetPlayerRoute()
	if cd_tbRoute [nRoute] ~= 1 then
		Talk(1, "", CK_NPC_NAME.." Ch�a gia nh�p h� ph�i, kh�ng th� nh�n th��ng");
		return 0
	end
	local nScore = ck_GetCkScore();
	local tMsg = {
		[0] = "Ch�a ho�n th�nh",
		[1] = "�� ho�n th�nh",
	}
	local tSay = {};
	for i = 1, getn(CK_SCROE_AWARD_TABLE) do
		local nType = CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, i);
		tinsert(tSay, format("%d gi�i th��ng �i�m n�ng ��ng (%s)/#ck_ScoreAward_func_%d(%d, %d)", CK_SCROE_AWARD_TABLE[i], tMsg[nType], i, nScore, CK_SCROE_AWARD_TABLE[i]));
	end
	tinsert(tSay, "T�i h� ch� xem qua th�i/nothing");
	Say(CK_NPC_NAME..format("%s b�y gi� �i�m n�ng ��ng l� <color=gold>%d<color>,h�y nh�n gi�i th��ng!", gf_GetPlayerSexName(), nScore), getn(tSay), tSay);
end

--C�p Th�p
function ck_ScoreAward_func_1(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_1(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 1000000, 100, 100, 1000, 10000)..",".." �� th�ng c�nh gi�i V� Hi�n"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 1) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i", 0);
		return 0;
	end
	if GetLevel() < 90 then
		Say(CK_NPC_NAME..format("��ng c�p ng��i kh�ng �� %d c�p, kh�ng ���c nh�n th��ng", 90), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 1, 1);
	gf_Modify("Exp", 1000000);
	gf_Modify("Rep", 100);
	gf_Modify("ShiMen", 100);
	gf_Modify("JunGong", 1000);
	local nLevel = MeridianGetLevel()
	if nLevel < 1 then
		for i = nLevel + 1, 1 do
			MeridianUpdateLevel()
		end
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	else
		gf_Modify("Exp", 1000000);
	end
	gf_Modify("ZhenQi", 10000);
end

function ck_ScoreAward_func_2(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_2(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 8000000, 160, 160, 1400, 0)..",".." N�n Chi�n Cu�ng + 7"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 2) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 2, 1);
	gf_Modify("Exp", 8000000);
	gf_Modify("Rep", 160);
	gf_Modify("ShiMen", 160);
	gf_Modify("JunGong", 1400);
	ahf_GetEquipByRouteBody(VET_ZHANKUANG_CAP);
end

function ck_ScoreAward_func_3(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_3(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 8000000, 220, 220, 1800, 20000)..",".." �� th�ng c�nh gi�i V� T��ng"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 3) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	if GetLevel() < 90 then
		Say(CK_NPC_NAME..format("��ng c�p ng��i kh�ng �� %d c�p, kh�ng ���c nh�n th��ng!", 90), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 3, 1);
	gf_Modify("Exp", 8000000);
	gf_Modify("Rep", 220);
	gf_Modify("ShiMen", 220);
	gf_Modify("JunGong", 1800);
	local nLevel = MeridianGetLevel()
	if nLevel < 2 then
		for i = nLevel + 1, 2 do
			MeridianUpdateLevel()
		end
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	else
		gf_Modify("Exp", 30000000);
	end	
	gf_Modify("ZhenQi", 20000);
end

function ck_ScoreAward_func_4(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_4(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 15000000, 280, 280, 2200, 0)..",".." �o Chi�n Cu�ng + 7"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 4) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 4, 1);
	gf_Modify("Exp", 15000000);
	gf_Modify("Rep", 280);
	gf_Modify("ShiMen", 280);
	gf_Modify("JunGong", 2200);
	ahf_GetEquipByRouteBody(VET_ZHANKUANG_CLOTH);
end

function ck_ScoreAward_func_5(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_5(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 20000000, 340, 340, 2600, 30000)..",".." �� th�ng c�nh gi�i V� V��ng"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 5) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	if GetLevel() < 90 then
		Say(CK_NPC_NAME..format("��ng c�p ng��i kh�ng �� %d c�p, kh�ng ���c nh�n th��ng!", 90), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 5, 1);
	gf_Modify("Exp", 20000000);
	gf_Modify("Rep", 340);
	gf_Modify("ShiMen", 340);
	gf_Modify("JunGong", 2600);
	local nLevel = MeridianGetLevel()
	if nLevel < 3 then
		for i = nLevel + 1, 3 do
			MeridianUpdateLevel()
		end
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	else
		gf_Modify("Exp", 40000000);
	end	
	gf_Modify("ZhenQi", 30000);
end

function ck_ScoreAward_func_6(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_6(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 25000000, 400, 400, 3000, 0)..",".." Qu�n Chi�n Cu�ng + 7, Chi�n H�i Kim X� 4 + 7"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 6) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	
	local tDialog = {}
	for i = 1, getn(CK_JS_SHOE) do
		DebugOutput(CK_JS_SHOE[i][1], i)
		tinsert(tDialog, format("%s/#ck_ScoreAward_func_6_Do(%d)", CK_JS_SHOE[i][1], i));
	end
	tinsert(tDialog, "\nT�i ch� xem xem th�i/nothing");
	Say(CK_NPC_NAME.."H�y ch�n lo�i c�n:", getn(tDialog), tDialog);	
end

function  ck_ScoreAward_func_6_Do(nIndex)
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 6, 1);
	gf_Modify("Exp", 25000000);
	gf_Modify("Rep", 400);
	gf_Modify("ShiMen", 400);
	gf_Modify("JunGong", 3000);
	
	ahf_GetEquipByRouteBody(VET_ZHANKUANG_SHOE);
	AddItem(2,1,30530,5);
	AddItem(2,1,30524	,5);
	gf_AddItemEx2(CK_JS_SHOE[nIndex][2], CK_JS_SHOE[nIndex][1], "CDKEY", "CDKEY", 0, 1);
end

function ck_ScoreAward_func_7(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_7(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 28000000, 460, 460, 3400, 30000)..",".." Huy Ch��ng Kim X� 4 + 7 (T� ch�n)"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 7) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	local tDialog = {}
	for i = 1, getn(CK_JS_HUIZHANG) do
		DebugOutput(CK_JS_HUIZHANG[i][1], i)
		tinsert(tDialog, format("%s/#ck_ScoreAward_func_7_Do(%d)", CK_JS_HUIZHANG[i][1], i));
	end
	tinsert(tDialog, "\nT�i ch� xem xem th�i/nothing");
	Say(CK_NPC_NAME.."H�y ch�n lo�i c�n:", getn(tDialog), tDialog);	
end

function  ck_ScoreAward_func_7_Do(nIndex)
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 7, 1);
	gf_Modify("Exp", 28000000);
	gf_Modify("Rep", 460);
	gf_Modify("ShiMen", 460);
	gf_Modify("JunGong", 3400);
	gf_Modify("ZhenQi", 30000);
	
	AddItem(2,1,30530,5);
	AddItem(2,1,30524	,5);
	gf_AddItemEx2(CK_JS_HUIZHANG[nIndex][2], CK_JS_HUIZHANG[nIndex][1], "CDKEY", "CDKEY", 0, 1);
end

function ck_ScoreAward_func_8(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_8(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 30000000, 520, 520, 3800, 0)..",".." �o Cho�ng Kim X� 4 + 7 (T� ch�n)"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 8) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	
	local tDialog = {}
	for i = 1, getn(CK_JS_GUAIYI) do
		DebugOutput(CK_JS_GUAIYI[i][1], i)
		tinsert(tDialog, format("%s/#ck_ScoreAward_func_8_Do(%d)", CK_JS_GUAIYI[i][1], i));
	end
	tinsert(tDialog, "\nT�i ch� xem xem th�i/nothing");
	Say(CK_NPC_NAME.."H�y ch�n lo�i c�n:", getn(tDialog), tDialog);
end

function ck_ScoreAward_func_8_Do(nIndex)
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 8, 1);
	gf_Modify("Exp", 30000000);
	gf_Modify("Rep", 520);
	gf_Modify("ShiMen", 520);
	gf_Modify("JunGong", 3800);

	AddItem(2,1,30530,5);
	AddItem(2,1,30524	,5);
	gf_AddItemEx2(CK_JS_GUAIYI[nIndex][2], CK_JS_GUAIYI[nIndex][1], "CDKEY", "CDKEY", 0, 1);
end


function ck_ScoreAward_func_9(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_9(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 9000000, 580, 580, 4200, 0)..",".." Chuy�n sinh 5 c�p 90"..",".."V� Kh� Chi�n Cu�ng + 7"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 9) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	if GetPlayerRoute() == 0 then
		Talk(1, "", CK_NPC_NAME.." Ch�a gia nh�p h� ph�i, kh�ng th� nh�n th��ng.");
		return 0
	end

	if gf_GetPlayerRebornCount() < 5 or (gf_GetPlayerRebornCount() == 5 and GetLevel() < 90) then
		ck_chuyensinh()
	else
		gf_Modify("Exp", 300000000); 
	end
	
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 9, 1);
	gf_Modify("Exp", 30000000); 
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	ahf_GetEquipByRouteBody(VET_ZHANKUANG_WEAPON)
end

function ck_chuyensinh()
	local tSay = 	{
		"Tu luy�n theo h��ng Long T�!/#ck_select_translife(1)",
		"Tu luy�n theo h��ng H� T�!/#ck_select_translife(2)",
		"Tu luy�n theo h��ng Ph�ng T�!/#ck_select_translife(4)",
		"Tu luy�n theo h��ng �ng T�!/#ck_select_translife(3)",
		--"Ta suy ngh� l�i ��/nothing",
	}
	Say("H�n Nguy�n C�ng th�c ch�t ca 4 h��ng tu luy�n, ng��i mu�n theo h��ng n�o?",getn(tSay),tSay)
end

function ck_select_translife(nType)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng��i ch�i c�n s�ng m�i ���c chuy�n sinh")
		return
	end	
	local nRoute = GetPlayerRoute()
	if gf_GetPlayerRebornCount() < 5 and gf_GetPlayerRebornCount() > 0 then
		local nTransCount_1 = GetTranslifeCount()	
		RemoveTitle(ck_tb_translife_tittle[nTransCount_1][nRoute][2], ck_tb_translife_tittle[nTransCount_1][nRoute][3])
	end
	-- Set s� l�n chuy�n sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT, 5) --5 l�n chuy�n sinh
	-- Set h��ng chuy�n sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, nType)
	local nTransCount = GetTranslifeCount()	
	for i=1,4 do	
		RemoveTitle(ck_tb_translife_tittle[i][nRoute][2], ck_tb_translife_tittle[i][nRoute][3])
	end
	AddTitle(ck_tb_translife_tittle[nTransCount][nRoute][2], ck_tb_translife_tittle[nTransCount][nRoute][3])	
	SetTask(TRANSLIFE_MISSION_ID,36)
	ResetProperty()
	SetLevel(90,0)
	Msg2Player("�ang tu luy�n H�n Nguy�n C�ng chi�u th�c th� nh�t...")
	--AddGlobalNews("Tin ��n ch�n ��ng giang h�: nghe nai Cao Th� V� L�m <color=green>"..GetName().."<color> tu luy�n theo h��ng <color=yellow>"..tb_translife_seal[nType][3].."<color> �� l�nh h�i ���c 2 th�nh <color=green>H�n Nguy�n C�ng<color>!")	
	WriteLogEx("Chuyen Sinh","th�nh c�ng l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
	--========
	DoWait(15,15,10)		
end


--C�p Cao
function ck_ScoreAward_func_10(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_10(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 32000000, 580, 580, 4200, 0)..",".." N�n V� H� H�o Hi�p"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 10) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 10, 1);
	gf_Modify("Exp", 32000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);

	AddItem(2, 1, 30947 ,1);
end

function ck_ScoreAward_func_11(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_11(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 34000000, 580, 580, 4200, 0)..",".." 20 �� qu� c�c lo�i 1,2,3"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 11) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	
	if gf_Judge_Room_Weight(11, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 11, 1);
	gf_Modify("Exp", 34000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);

	AddItem(2, 22, 101, 20);
	AddItem(2, 22, 102, 20);
	AddItem(2, 22, 103, 20);
	AddItem(2, 22, 201, 20);
	AddItem(2, 22, 202, 20);
	AddItem(2, 22, 203, 20);
	AddItem(2, 22, 301, 20);
	AddItem(2, 22, 302, 20);
	AddItem(2, 22, 303, 20);
	AddItem(2, 22, 401, 20);
	AddItem(2, 22, 402, 20);
	AddItem(2, 22, 403, 20);
end


function ck_ScoreAward_func_12(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_12(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 36000000, 580, 580, 4200, 0)..",".." �o V� H� H�o Hi�p"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 12) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 12, 1);
	gf_Modify("Exp", 36000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	AddItem(2, 1, 30948 ,1);
	
end


function ck_ScoreAward_func_13(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_13(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 38000000, 580, 580, 4200, 0)..",".." 20 �� qu� c�p 4 m�i lo�i"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 13) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	
    if gf_Judge_Room_Weight(5, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 13, 1);
	gf_Modify("Exp", 38000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	
	AddItem(2, 22, 104, 20);
	AddItem(2, 22, 204, 20);
	AddItem(2, 22, 304, 20);
	AddItem(2, 22, 404, 20);
end


function ck_ScoreAward_func_14(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_14(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 40000000, 580, 580, 4200, 0)..",".." Qu�n V� H� H�o Hi�p"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 14) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 14, 1);
	gf_Modify("Exp", 40000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);

	AddItem(2, 1, 30949 ,1);
end

function ck_ScoreAward_func_15(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_15(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 42000000, 580, 580, 4200, 0)..",".."Trang s�c V� H� H�o Hi�p  (Theo ki�u h�nh, l�u ph�i)"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 15) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 15, 1);
	gf_Modify("Exp", 42000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);

	AddItem(2, 1, 30977 ,1);
end

function ck_ScoreAward_func_16(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_16(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 44000000, 580, 580, 4200, 0)..",".." Th�ng chuy�n sinh 6 c�p 90"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 16) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end

	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()			
	if nChuyenSinh < 690 then
		ck_phucsinh1()
	else
		gf_Modify("Exp", 300000000);
	end
	
	gf_Modify("Exp", 44000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 16, 1);
end

function ck_phucsinh1()
	local tSay = 	{
		"Tu luy�n theo h��ng Long T�!/#ck_select_translife_ps(1)",
		"Tu luy�n theo h��ng H� T�!/#ck_select_translife_ps(2)",
		"Tu luy�n theo h��ng Ph�ng T�!/#ck_select_translife_ps(4)",
		"Tu luy�n theo h��ng �ng T�!/#ck_select_translife_ps(3)",
		--"Ta suy ngh� l�i ��/nothing",
	}
	Say("H�n Nguy�n C�ng th�c ch�t ca 4 h��ng tu luy�n, ng��i mu�n theo h��ng n�o?",getn(tSay),tSay)
end

function ck_select_translife_ps(nType)
	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()
	local nRoute = GetPlayerRoute()
	local tbType = {"Long T�", "H� T�", "�ng T�", "Ph�ng T�"}
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	if nChuyenSinh >= 690 then -- b�t chuy�n sinh 7
		Talk(1,"","<color=green>L�c Tr�c �ng: <color>Kinh nghi�m chuy�n sinh c�a ��i hi�p qu� cao, ta kh�ng th� gi�p g� ���c c� !!!!")
		return 0	
	end

	DelItem(2,0,1083,2)
	DelItem(2,1,30345,2)

	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
	local nType_cs5 = GetTranslifeFaction()	
	local nTransCount = GetTranslifeCount()	
		for i=1, getn(tb_translife_cloth[nType_cs5][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType_cs5][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 30000 + GetBody()
			Pnew1 = 561 + GetBody()			
			Pnew2 = 565 + GetBody()		
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			BigDelItem(G,D,Pnew1,BigGetItemCount(G,D,Pnew1))			
			BigDelItem(G,D,Pnew2,BigGetItemCount(G,D,Pnew2))					
	end

	RemoveTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])	

	local tbVanSu = {"V�n S� ngo�i trang",0,108,570,188}
	local nPVanSu = tbVanSu[4]  + GetBody() - 1
	for i = 0, 2 do
		BigDelItem(0, 108 + i, nPVanSu, BigGetItemCount(0, 108 + i, nPVanSu))	
	end
	gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
	PlayerReborn(1,nType) -- Chuy�n Sinh 6 th�nh c�ng		
	SetLevel(90,0);
	AddTitle(61,5);
	SetTask(TSK_CS6_TULINH,5)	--ho�n th�nh nh�m v� chuy�n sinh
 	gf_WriteLogEx("CD KEY", "chuy�n sinh th�nh c�ng", 1, "CD KEY phan thuong 16")	
 	local nGetExp = GetExp()
	local nTime = floor(nGetExp/2000000000)
	if nTime >= 1 then
		for i = 1, nTime do
			ModifyExp(-2000000000)
		end
	end
	ModifyExp(-GetExp())

	DoWait(15,15,10)
end


function ck_ScoreAward_func_17(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_17(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 46000000, 580, 580, 4200, 0)..",".." Ng�c B�i V� H� H�o Hi�p"..",".." 3 Tr�ng Linh Th�-Cao"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 17) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 17, 1);
	gf_Modify("Exp", 46000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	gf_AddItemEx2({2, 1, 30728, 3, 4}, "Tr�ng Linh Th�-Cao", "CDKEY", "CDKEY", 0, 1)
	
	AddItem(2,1,30977,1);
end

function ck_ScoreAward_func_18(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_18(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 48000000, 580, 580, 4200, 50000)..",".." Ng�u nhi�n 10 �� qu� c�p 5~6, Th�ng c�p kinh m�ch V� T�n"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 18) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(11, 200, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 18, 1);
	gf_Modify("Exp", 48000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);

	for i = 1, 10 do
		ck_GiveRandGem456()
	end
	
	local nLevel = MeridianGetLevel()
	if nLevel < 4 then
		for i = nLevel + 1, 4 do
			MeridianUpdateLevel()
		end
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	else
		gf_Modify("Exp", 100000000);
	end	
	gf_Modify("ZhenQi", 50000);
end

function ck_ScoreAward_func_19(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_19(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 50000000, 580, 580, 4200, 0)..",".." V� Kh� V� H� H�o Hi�p"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 19) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	
	if gf_Judge_Room_Weight(1, 200, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 19, 1);
	gf_Modify("Exp", 50000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);

	AddItem(2, 1, 30976 ,1);
end

function ck_ScoreAward_func_20(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_20(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 60000000, 580, 580, 4200, 80000)..",".." Th�ng c�p kinh m�ch V� Ho�ng"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 20) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	
	if gf_Judge_Room_Weight(1, 200, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 20, 1);
	gf_Modify("Exp", 60000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);

	local nLevel = MeridianGetLevel()
	if nLevel < 5 then
		for i = nLevel + 1, 5 do
			MeridianUpdateLevel()
		end
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	else
		gf_Modify("Exp", 200000000);
	end	
	gf_Modify("ZhenQi", 80000);
end

function ck_ScoreAward_func_21(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_21(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 100000000, 580, 580, 10000, 50000)..",".."1 H�a Ph�ng Linh, 50 H�a Ph�ng Tinh Hoa, 5 Thi�n M�n Kim L�nh, 5 Thi�n Cang L�nh, 500 m�i lo�i: C� Linh Ng�c, C� Linh Th�ch, Hu�n Ch��ng Anh H�ng v� 500 Th�i Nh�t L�nh"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 21) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	
	if gf_Judge_Room_Weight(9, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 21, 1);
	gf_Modify("Exp", 100000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 10000);
	gf_Modify("ZhenQi", 50000);
	
	AddItem(2,1,30368,500); --CoLinh + HCAH
	AddItem(2,1,30369,500);
	AddItem(2,1,30499,500);
	AddItem(2,1,30687,500); --TNL
	AddItem(2,1,30769,1); --HPH
	AddItem(2,1,30770,50); --HPTH
	AddItem(2,1,30370,5); --TMKL
	AddItem(2,95,204,5);  --TCL
end

function ck_ScoreAward_func_22(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_22(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 120000000, 580, 580, 12000, 0)..",".." 5 lo�i Danh Hi�u VIP (Hi�u qu� V�nh Vi�n kh�ng c�n �eo)"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 22) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 22, 1);
	gf_Modify("Exp", 120000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 12000);
	
	AddTitle(74,1);
	AddTitle(74,2);
	AddTitle(74,3);
	AddTitle(75,1);
	AddTitle(75,2);
end

function ck_ScoreAward_func_23(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_23(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 200000000, 1000, 1000, 100000, 0)..",".." Danh Hi�u ��ng C�u (Hi�u qu� V�nh Vi�n kh�ng c�n �eo)"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 23) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 23, 1);
	gf_Modify("Exp", 200000000);
	gf_Modify("Rep", 1000);
	gf_Modify("ShiMen", 1000);
	gf_Modify("JunGong", 100000);
	
	AddTitle(72,10);
end

