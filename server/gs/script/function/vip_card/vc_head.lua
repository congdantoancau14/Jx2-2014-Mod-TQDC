Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\vip_card\\vc_define.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\date.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\date.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\settings\\static_script\\cheat\\list_gm.lua")


function vc_IsVipCardOpen()
	--return IsActivatedVipCard(VC_CURRENT_ID);
	return 1;
end

function vc_GetMainTitle()
	local szTitle = "L�nh b�i VIP V� L�m "
	local nRemainTime = GetVipCardRemainTime();
	local nState = -1;
	if nRemainTime > 0 then
		szTitle = szTitle.."("..format("C�n %d ng�y", ceil(nRemainTime / (24 * 3600)))..")";
		nState = 1;
	elseif vc_HaveValueAward() ~= 0 then
		szTitle = szTitle.."(".."Ch�a nh�n ph�n th��ng c�ng hi�n"..")";
		nState = 2;
	else
		szTitle = szTitle.."(".."Ch�a k�ch ho�t"..")";
		nState = 0;
	end
	szTitle = szTitle..format("/#vc_MainFunction(%d)", nState);
	return szTitle
end

function vc_MainFunction(nState)
	local nKind = tonumber(nState)
	if 0 == nKind then
		vc_Activating();
	elseif 1 == nKind then
		vc_JoinFunction();
	elseif 2 == nKind then
		vc_GetValueAward();
	end
end

function vc_Activating()
	local szCardName = GetVipCardName(VC_CURRENT_ID)
	local tSay = {
		format("L�p t�c k�ch ho�t %s/vc_ActivatingNow", szCardName),
		format("Xem ph�n th��ng %s/vc_LookForAward", szCardName),
		"Tho�t/nothing"
	}
	Say(format("<color=green>%s:<color> ", GetVipCardName(VC_CURRENT_ID))..format("Ng��i ch�a k�ch ho�t %s.Gamer c�p 80 tr� l�n c� th� mua th� VIP v� l�m v� ti�n h�nh k�ch ho�t.", szCardName), getn(tSay), tSay);
end

function vc_ActivatingNow(bTag)
	local szCardName = GetVipCardName(VC_CURRENT_ID);
	local nRemainTime = GetVipCardRemainTime();
	if not bTag and nRemainTime > 0 then
		Say(format("<color=green>%s:<color>", GetVipCardName(VC_CURRENT_ID))..format("%s s� m�t hi�u l�c, x�c nh�n s� k�ch ho�t kh�ng?", GetVipCardName(GetVipCardIndex())), 2, "V�n k�ch ho�t/#vc_ActivatingNow(1)", "Tho�t/nothing");
		return 0;
	end
	if vc_HaveValueAward() ~= 0 then
		Talk(1,"",format("Ch�a nh�n xong gi�i th��ng %s �� c�ng hi�n, kh�ng th� k�ch ho�t %s", GetVipCardName(GetVipCardIndex()), szCardName));
		return 0;
	end
	if GetLevel() < 73 and gf_GetPlayerRebornCount() <= 0 then
		Talk(1,"",format("��ng c�p nh�n v�t kh�ng �� c�p %d, kh�ng th� k�ch ho�t %s", 73, szCardName));
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	local nRet = ActivatingVipCard(VC_CURRENT_ID);
	if nRet ~= 1 then
		Talk(1,"",format("<color=green>%s:<color> ", GetVipCardName(VC_CURRENT_ID))..format("Trong t�i kh�ng c� %s, k�ch ho�t th�t b�i", szCardName))
		return 0;
	end
	SetTask(TASKID_VC_VALUE_FLAG, 0, TASK_ACCESS_CODE_VIP_CARD);
	vc_DailyTaskReset();
	local nRet, nIndex = AddItem(0,200,40,1,4) --�����б���
	if nRet == 1 then
		SetItemExpireTime(nIndex, 30 * 24 * 3600)
	end
	Msg2Player(msg);
	local msg = format("V� L�m VIP L�nh %s �� k�ch ho�t th�nh c�ng", szCardName);
	Talk(1,"vc_JoinFunction",format("<color=green>%s:<color> ", GetVipCardName(VC_CURRENT_ID))..msg);
end

function vc_LookForAward()
	local szCardName = GetVipCardName(VC_CURRENT_ID)
	local tSay = {};
	tSay.msg = format("<color=green>%s: <color> ", GetVipCardName(VC_CURRENT_ID))..format("Ng��i ch�i k�ch ho�t %s, s� nh�n ���c ph�n th��ng sau:\nKhi k�ch ho�t s� nh�n ���c 1 Th�n H�nh B�o �i�n, ph�n th��ng c�a L��ng S�n, ��a Huy�n Cung, V�n Ki�m Tr�ng, chi�n tr��ng l�n nh�, Thi�n M�n Tr�n, Chi�n Tr��ng Li�n Server s� ���c c�ng th�m\nPh�n th��ng �� c�ng hi�n: H�ng ng�y ho�n th�nh nhi�m v� V� L�m Treo Th��ng s� nh�n ���c �� c�ng hi�n, ��t �� c�ng hi�n nh�t ��nh s� nh�n ���c <color=green>Thi�n M�n Kim L�nh - Thi�n Cang L�nh<color> v� <color=green>H�a Ph�ng Tinh Hoa<color>", szCardName);
	tSay.sel = {
		{"Ra kh�i", "nothing"},
	};
	temp_Talk(tSay);
end

function vc_JoinFunction()
	local tMsg = {
		[0] = "Ch�a nh�n", 
		[1] = "�� nh�n",
	}
	local msg = tMsg[gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31)] or tMsg[1];
	local tSay = {
		--format("Gi�i thi�u ho�t ��ng VIP %s/vc_LookForAward", GetVipCardName(GetVipCardIndex())),
		"\nXem nhi�m v� h�m nay/vc_DailyTask",
		format("\nNh�n th� l�c m�i ng�y (%s)/vc_DailyEnergy", msg),
		"\n��i �i�m c�ng hi�n l�y ph�n th��ng/vc_GetValueAward",
		"\nTho�t/nothing"
	}
	--local nCurID = GetVipCardIndex();
	--if nCurID ~= VC_CURRENT_ID then
	--	local nDate = tonumber(date("%Y%m%d"))
	--	DebugOutput("nDate =", nDate)
	--	if nDate >= GetVipCardStartTime(VC_CURRENT_ID) and nDate <= GetVipCardEndTime(VC_CURRENT_ID) then
	--		tinsert(tSay, 1, format("K�ch ho�t %s/vc_Activating", GetVipCardName(VC_CURRENT_ID)));
	--	end
	--end
	
	local nRemainTime = GetVipCardRemainTime();
	local nDateOrther = ceil(nRemainTime / (24 * 3600))
	Say("<color=green>Th� Thi�n H�t: <color>M�i ng�y t�i �a b�n c� th� nh�n ���c <color=gold>150<color> �i�m c�ng hi�n khi l�m h�t nhi�m v� ng�y.<enter>Hi�n t�i th�i h�n th� c�n <color=gold>"..nDateOrther.."<color> ng�y", getn(tSay), tSay)
end

function vc_GetValueAward()
	local tMsg = {
		[1] = "�� nh�n",
		[2] = "Ch�a nh�n",
		[3] = "Ch�a ��t ���c",
	}
	local tSay = {};
	local nIndex = 0;
	local nValue = GetVipCardValue();
	local nCardIndex = GetVipCardIndex();
	local tAward = VC_VALUE_AWARD[nCardIndex];
	if not tAward then return 0; end
	for i = 1, getn(tAward) do
		if gf_GetTaskBit(TASKID_VC_VALUE_FLAG, i) == 1 then
			nIndex = 1;
		else
			if nValue >= tAward[i][1] then
				nIndex = 2;
			else
				nIndex = 3;
			end		
		end
		tinsert(tSay, format("Nh�n %d %s (%d) - (%s)/#vc_GetValueAwardFinish(%d, %d)", tAward[i][3][4], tAward[i][4], tAward[i][1], tMsg[nIndex], nIndex, i));
	end
	tinsert(tSay, "Ra kh�i/nothing");
	Say(format("<color=green>%s:<color> ", GetVipCardName(GetVipCardIndex()))..format("�� c�ng hi�n hi�n t�i l� <color=green>%d<color>. M�i m�c c�ng hi�n ch� ���c nh�n th��ng 1 l�n. Sau khi d�ng th� th�ng m�i s� kh�ng th� nh�n ph�n th��ng �� c�ng hi�n c�a th� th�ng c�. H�y nh�n k�p th�i", nValue), getn(tSay), tSay)
end

function vc_GetValueAwardFinish(nTag, nIndex)
	if 1 == nTag then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex())).."B�n �� nh�n ph�n th��ng n�y r�i ");
		return
	end
	if 3 == nTag then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex())).."Ch�a ��t �� c�ng hi�n, kh�ng th� nh�n ph�n th��ng n�y");
		return
	end
	local nCardIndex = GetVipCardIndex();
	local tAward = VC_VALUE_AWARD[nCardIndex];
	if not tAward then return 0; end
	local tCell = tAward[nIndex]
	if not tCell then
		return
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return
	end
	gf_SetTaskBit(TASKID_VC_VALUE_FLAG, nIndex, 1, TASK_ACCESS_CODE_VIP_CARD);
	gf_AddItemEx2(tCell[3], tCell[4], GetVipCardName(GetVipCardIndex()), "Ph�n th��ng �� c�ng hi�n", 0, 1);
end

--�жϹ��׽����Ƿ�Ϊ��ȡ
function vc_HaveValueAward()
	local nValue = GetVipCardValue();
	local nCardIndex = GetVipCardIndex();
	local tAward = VC_VALUE_AWARD[nCardIndex];
	if not tAward then return 0; end
	for i = 1, getn(tAward) do
		if nValue >= tAward[i][1] then
			if gf_GetTaskBit(TASKID_VC_VALUE_FLAG, i) ~= 1 then
				return 1;
			end
		end
	end
	return 0;
end

function vc_DailyTaskReset()
	SetTask(TASKID_VC_DAILY_TASK_FLAG, 0, TASK_ACCESS_CODE_VIP_CARD);
	SetTask(TASKID_VC_AUTO_FINISH_TIMES, 0, TASK_ACCESS_CODE_VIP_CARD);
	SetTask(TASKID_VC_DAILY_TASK_1, 0, TASK_ACCESS_CODE_VIP_CARD);
	SetTask(TASKID_VC_DAILY_TASK_2, 0, TASK_ACCESS_CODE_VIP_CARD);
	SetTask(TASKID_VC_DAILY_TASK_3, 0, TASK_ACCESS_CODE_VIP_CARD);
end

function vc_GetServerIndex(tCell)
	local today = Date();
	local wDay = today:week();
	if wDay == 0 then wDay = 7 end
	if not tCell.Content then
		return 1;
	end
	return mod(wDay, getn(tCell.Content)) + 1;
end

function vc_GetContentIndex(tCell, bGenerate)
	local nContentIndex = gf_GetTaskByte(tCell.TaskIndex, tCell.ByteIndex);
	if bGenerate then
		if nContentIndex <= 0 or nContentIndex > getn(tCell.Content) then
			if tCell.RandType == 1 then
				nContentIndex = vc_GetServerIndex(tCell);
			elseif tCell.RandType == 2 then
				nContentIndex = random(getn(tCell.Content));
			end
			gf_SetTaskByte(tCell.TaskIndex, tCell.ByteIndex, nContentIndex, TASK_ACCESS_CODE_VIP_CARD);
		end
	end
	return nContentIndex;
end

function vc_DailyTask()
	local tSay = {}
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[nCardIndex];
	if not tTaskTable then  return 0; end
	for i = 1, getn(tTaskTable) do
		local tCell = tTaskTable[i];
		DebugOutput("tCell =", tCell);
		local nFinishTimes = gf_GetTaskByte(tCell.Task, tCell.Byte);
		DebugOutput("nFinishTimes =", nFinishTimes);
		local cIndex = vc_GetContentIndex(tCell, 1);
		DebugOutput("cIndex =", cIndex);
		tinsert(tSay, format("%s (%d/%d)/#vc_DailyTaskDetail(%d, %d)", tCell.Content[cIndex][1], 
			min(nFinishTimes, tCell.Content[cIndex][2]), tCell.Content[cIndex][2], i, cIndex));
	end
	tinsert(tSay, "Ra kh�i/nothing")
	Say(format("<color=green>%s:<color> ", GetVipCardName(GetVipCardIndex())).."Nhi�m v� V� L�m Treo Th��ng kh�ng c�n nh�n, ch� c�n trong ng�y ho�n th�nh �i�u ki�n s� c� th� ho�n th�nh, nh�ng ph�n th��ng ph�i t� nh�n. C� th� n�p Thi�n Ki�u L�nh �� t� ��ng ho�n th�nh nhi�m v�, m�i l�n t� ��ng ho�n th�nh th� s� l��ng Thi�n Ki�u L�nh ti�u hao ng�y c�ng nhi�u.", getn(tSay), tSay)
end

function vc_DailyTaskDetail(nIndex, cIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[nCardIndex];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	local nFinishTimes = gf_GetTaskByte(tCell.Task, tCell.Byte); 
	local tSub = tCell.Content[cIndex];
	if not tSub then return end
	local tSay = {}
	local msg = format("<color=yellow>[%s %d l�n]<color> ", tSub[1], tSub[2])..tSub[3];
	local bIsFinish = gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, nIndex);
	if bIsFinish ~= 0 then
		msg = msg.."<color=green> (�� ho�n th�nh m�c n�y)<color>"
	else
		if nFinishTimes <= 0 then
			tinsert(tSay, format("\nNh�n nhi�m v�/#vc_DailyTaskDetail_GetTask(%d)", nIndex));
			local nName = GetAccount();
			if CheckName(nName) == 1 then
				tinsert(tSay, format("\nT� ��ng ho�n th�nh/#vc_DailyTaskDetail_AotoFinish(%d)", nIndex));
			end
		elseif nFinishTimes >= tSub[2] then
			tinsert(tSay, format("\nNh�n ph�n th��ng/#vc_DailyTaskDetail_GetTaskAward(%d)", nIndex));
		end
	end
	tinsert(tSay, "\nTho�t/nothing");
	Say(format("<color=green>%s:<color> ", GetVipCardName(GetVipCardIndex()))..msg, getn(tSay), tSay);
end

function vc_DailyTaskDetail_GetTask(nIndex)
	DebugOutput("vc_DailyTaskDetail_GetTask", nIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[nCardIndex];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	local cIndex = vc_GetContentIndex(tCell);
	local tSub = tCell.Content[cIndex];
	if not tSub then return end
	Talk(1,"",format("<color=green>%s:<color> ", GetVipCardName(GetVipCardIndex()))..format("Mau �i ho�n th�nh nhi�m v� h�ng ng�y <color=green>%s<color>!", tSub[1]));
end

function vc_DailyTaskDetail_GetTaskAward(nIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[nCardIndex];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	if gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, nIndex) ~= 0 then
		Talk(1,"",format("<color=green>%s:<color> ", GetVipCardName(GetVipCardIndex())).."M�c n�y �� ho�n th�nh (M�i ng�y ch� ���c ho�n th�nh 1 l�n");
		return
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return
	end
	gf_SetTaskBit(TASKID_VC_DAILY_TASK_FLAG, nIndex, 1, TASK_ACCESS_CODE_VIP_CARD);
	dostring(tCell.Award);
end

function vc_DailyTaskDetail_AotoFinish(nIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[nCardIndex];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	if gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, nIndex) ~= 0 then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex())).."M�c n�y �� ho�n th�nh (M�i ng�y ch� ���c ho�n th�nh 1 l�n");
		return
	end
	local nAutoFinishTimes = GetTask(TASKID_VC_AUTO_FINISH_TIMES);
	local nCostNum = (nAutoFinishTimes * 2 + 1) * tCell.AutoFinish[4];
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("H�m nay �� d�ng <color=red>%d<color> l�n t� ��ng ho�n th�nh, l�n n�y c�n ti�u hao <color=yellow>%s<color>*%d", 
		nAutoFinishTimes, tCell.AutoFinish[5], nCostNum), 2, 
		format("\nX�c nh�n/#vc_DailyTaskDetail_AotoFinish_Ensure(%d, %d, %d, %d, %d)", tCell.AutoFinish[1], tCell.AutoFinish[2], 
			tCell.AutoFinish[3], nCostNum, nIndex), "\nTho�t/nothing");
end

function vc_DailyTaskDetail_AotoFinish_Ensure(nG, nD, nP, nNum, nIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[nCardIndex];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	DebugOutput("vc_GetContentIndex(tCell) =", vc_GetContentIndex(tCell))
	local tSub = tCell.Content[vc_GetContentIndex(tCell)];
	if not tSub then return end
	if DelItem(tCell.AutoFinish[1], tCell.AutoFinish[2], tCell.AutoFinish[3], nNum) ~= 1 then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("S� l��ng %s trong t�i kh�ng �� %d c�i", tCell.AutoFinish[5], nNum));
		return
	end
--	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {tCell.AutoFinish[1], tCell.AutoFinish[2], tCell.AutoFinish[3], nNum})
	SetTask(TASKID_VC_AUTO_FINISH_TIMES, GetTask(TASKID_VC_AUTO_FINISH_TIMES) + 1, TASK_ACCESS_CODE_VIP_CARD);
	gf_SetTaskByte(tCell.Task, tCell.Byte, tSub[2], TASK_ACCESS_CODE_VIP_CARD);
	vc_DailyTaskDetail_GetTaskAward(nIndex);
end

function vc_DailyEnergy()
	local nRet = gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31);
	local tMsg = {
		[0] = "Ch�a nh�n", 
		[1] = "�� nh�n",
	}
	local msg = tMsg[nRet];
	local tMsg2 = {
		[0] = "��ng",
		[1] = "��ng �",
	}
	local tFunc = {
		[0] = "vc_DailyEnergy_do",
		[1] = "nothing",
	}
	local tSay = {
		format("%s/%s", tMsg2[nRet], tFunc[nRet]),
		"Tho�t/nothing",
	}
	Say(format("<color=green>%s:<color> ", GetVipCardName(GetVipCardIndex()))..format("H�m nay c� th� nh�n tr�c ti�p %d �i�m tinh l�c, ng��i h�m nay %s", 120, msg), getn(tSay), tSay);
end

function vc_DailyEnergy_do()
	if gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31) ~= 0 then
		return 0;
	end
	local nCur, nMax = ModifyEnergy(0,1);
	local nCanGive = nMax - nCur;
	Say(format("<color=green>%s:<color> ", GetVipCardName(GetVipCardIndex()))..format("Hi�n t�i nh�n ���c %d �i�m tinh l�c, ��ng � nh�n kh�ng?", min(nCanGive, 120)), 2, "X�c nh�n/vc_DailyEnergy_do_ensure", "H�y b�/nothing");
end

function vc_DailyEnergy_do_ensure()
	if gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31) ~= 0 then
		return 0;
	end
	local nCur, nMax = ModifyEnergy(0,1);
	local nCanGive = nMax - nCur;
	ModifyEnergy(min(nCanGive, 120), 1);
	gf_SetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31, 1, TASK_ACCESS_CODE_VIP_CARD);
	return 1;
end

--���3-4�ǻ���
function vc_Rand_3_4_JS_badge()
	local tAward = {
		{1, 50, "M�nh Thi�n M�n", {2, 1, 30410, 10}, 0, 0, 0, 1},
		{1, 50, "M�nh Thi�n Cang", {2, 1, 30390, 50}, 0, 0, 0, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, GetVipCardName(GetVipCardIndex()), "M�nh")
end

--���3-4�ǹ���
function vc_Rand_3_4_JS_cape()
	local tAward = {
		{1, 50, "M�nh Thi�n M�n", {2, 1, 30410, 10}, 0, 0, 0, 1},
		{1, 50, "M�nh Thi�n Cang", {2, 1, 30390, 50}, 0, 0, 0, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, GetVipCardName(GetVipCardIndex()), "M�nh")
end

--���3-4��Ь
function vc_Rand_3_4_JS_foot()
	local tAward = {
		{1, 50, "M�nh Thi�n M�n", {2, 1, 30410, 10}, 0, 0, 0, 1},
		{1, 50, "M�nh Thi�n Cang", {2, 1, 30390, 50}, 0, 0, 0, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, GetVipCardName(GetVipCardIndex()), "M�nh")
end

--���2-4����ʯ����
function vc_Rand_2_4_Gem(nNum)
	nNum = nNum or 1;
	local tAward = {
		{1, 6, "Huy�tTr�chTh�ch Lv5", {2, 22, 105, 1}, 0},
		{1, 6, "Nguy�tB�chTh�ch Lv5", {2, 22, 205, 1}, 0},
		{1, 6, "H� Ph�ch Th�ch C�p 5", {2, 22, 305, 1}, 0},
		{1, 6, "H�c Di�u Th�ch C�p 5", {2, 22, 405, 1}, 0},
		{1, 4, "Huy�tTr�chTh�ch Lv6", {2, 22, 106, 1}, 1},
		{1, 4, "Nguy�tB�chTh�ch Lv6", {2, 22, 206, 1}, 1},
		{1, 4, "H� Ph�ch Th�ch C�p 6", {2, 22, 306, 1}, 1},  
		{1, 4, "H�c Di�u Th�ch C�p 6", {2, 22, 406, 1}, 1},
	}
	local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
	gf_AddItemEx2({tAward[nIndex][4][1], tAward[nIndex][4][2], tAward[nIndex][4][3], tonumber(nNum), tAward[nIndex][4][5]}, tAward[nIndex][3], "VipCard", "�� qu� c�p 2-4", 0, 1);
	if tAward[nIndex][5] == 1 then
		Msg2Global(format("[%s] trong Th� VIP V� L�m ��i �i�m c�ng hi�n nh�n ���c ph�n th��ng %s (%d)", GetName(), tAward[nIndex][3], tonumber(nNum)))
	end
end

--����------------------------------------------------------
--˫�ӿ�
function vc_AwardCopy()
	AddVipCardValue(20);
	Msg2Player(format("Nh�n ���c %d �i�m [%s] c�ng hi�n", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

function vc_AwardPlant()
	AddVipCardValue(20);
	Msg2Player(format("Nh�n ���c %d �i�m [%s] c�ng hi�n", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

function vc_AwardTmz()
	AddVipCardValue(20);
	Msg2Player(format("Nh�n ���c %d �i�m [%s] c�ng hi�n", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

function vc_AwardBattle()
	AddVipCardValue(20);
	Msg2Player(format("Nh�n ���c %d �i�m [%s] c�ng hi�n", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

function vc_AwardEquip()
	AddVipCardValue(20);
	Msg2Player(format("Nh�n ���c %d �i�m [%s] c�ng hi�n", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

--��з��
--ʨ�ӿ�
--��Ů��
--��Ы��
function vc_Award_2_1()
	AddVipCardValue(60);
	Msg2Player(format("Nh�n ���c %d �i�m [%s] c�ng hi�n", 60, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
	gf_AddItemEx2({2, 1, 30499, 50}, "Hu�n ch��ng anh h�ng", "VipCard", GetVipCardName(GetVipCardIndex()), 0, 1);
end

function vc_Award_2_2()
	AddVipCardValue(50);
	Msg2Player(format("Nh�n ���c %d �i�m [%s] c�ng hi�n", 40, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
	gf_AddItemEx2({2, 1, 30369, 50}, "C� linh ng�c", "VipCard", GetVipCardName(GetVipCardIndex()), 0, 1);
end

function vc_Award_2_3()
	AddVipCardValue(50);
	Msg2Player(format("Nh�n ���c %d �i�m [%s] c�ng hi�n", 50, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
	gf_AddItemEx2({2, 1, 30368, 50}, "C� linh th�ch", "VipCard", GetVipCardName(GetVipCardIndex()), 0, 1);
end

--������ʵ�ֽӿ�---------------------------------------------
--VipCard ID��VC_DAILY_TASK������������������
function _vc_DailyTaskFinishOnce(nID, nIndex, cTag)
	--����vip�����ѹر�
	if IsActivatedVipCard(nID) ~= 1 then
		return
	end
	--��ǰ�����ID
	if GetVipCardIndex() ~= nID then
		return
	end
	--δ��������vip����
	if GetVipCardRemainTime() <= 0 then
		return
	end
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[nCardIndex];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	local cIndex = vc_GetContentIndex(tCell);
	if cTag ~= cIndex then
		return
	end
	local tSub = tCell.Content[cIndex];
	if not tSub then return end;
	local nFinishTimes = gf_GetTaskByte(tCell.Task, tCell.Byte); 
	if nFinishTimes >= tSub[2] then
		return
	end
	gf_SetTaskByte(tCell.Task, tCell.Byte, nFinishTimes + 1, TASK_ACCESS_CODE_VIP_CARD);
	Msg2Player(format("Ho�n th�nh [%s] nhi�m v� h�ng ng�y %s %d/%d", GetVipCardName(nID), tSub[1], nFinishTimes + 1, tSub[2]))
end

--��ɽͨ8��
function _vc_LS_Pass_8()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 1, 1);
end

--������ͨ7��
function _vc_DXG_Pass_7()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 1, 2);
end

--��ڣͨ4��
function _vc_WJZ_Pass_4()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 1, 3);
end

--��̫ͨһ��ȫͨ
function _vc_TYT_AllPass()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 1, 4);
end

--������ȡʤ
function _vc_TMZ_Win()
	local nId = GetVipCardIndex()
	if nId == 1 then
		_vc_DailyTaskFinishOnce(1, 3, 1);
	else
		_vc_DailyTaskFinishOnce(nId, 2, 1);
	end
end

--����������
function _vc_JoinOnceTMZ()
	local nId = GetVipCardIndex()
	if nId == 1 then
		_vc_DailyTaskFinishOnce(1, 3, 2);
	else
		_vc_DailyTaskFinishOnce(nId, 2, 2);
	end
end

--�������Źش�ս������ȡ����
function _vc_JoinBigbattle()
	local nId = GetVipCardIndex()
	if nId == 1 then
		_vc_DailyTaskFinishOnce(1, 4, 1);
	else
		_vc_DailyTaskFinishOnce(nId, 2, 3);
	end
end

--��������Сս������ȡ����
function _vc_JoinSmallBattle()
	local nId = GetVipCardIndex()
	if nId == 1 then
		_vc_DailyTaskFinishOnce(1, 4, 2);
	else
		_vc_DailyTaskFinishOnce(nId, 2, 4);
	end
end

--�μӶ�Թ̨��ȡ��ʤ��
function _vc_JoinEytBattle_Win()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 2, 5);
end

--װ��ǿ��
function _vc_EnhanceOnce(bIsSucc, enhLevel)
	local nId = GetVipCardIndex()
	if nId == 1 then
		_vc_DailyTaskFinishOnce(1, 5, 1);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 1);
	end
end

--װ������
function _vc_Equip_Evolution(bIsSucc)
	local nId = GetVipCardIndex()
	if nId == 1 then
		_vc_DailyTaskFinishOnce(1, 5, 2);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 2);
	end
end

--��ֲС������
function _vc_PlantSmallBanRuo()
	local nId = GetVipCardIndex()
	if nId == 1 then
		_vc_DailyTaskFinishOnce(1, 2, 1);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 3);
	end
end

--��ֲ������
function _vc_PlantBigBanRuo()
	local nId = GetVipCardIndex()
	if nId == 1 then
		_vc_DailyTaskFinishOnce(1, 2, 2);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 4);
	end
end

--�����Ӱ�
function _vc_OpenSeedBag()
	local nId = GetVipCardIndex()
	if nId == 1 then
		_vc_DailyTaskFinishOnce(1, 2, 3);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 5);
	end
end