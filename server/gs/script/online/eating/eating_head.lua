Include("\\script\\misc\\taskmanager.lua")

TE = TaskManager:Create(11,10)

TE.TASK_TIME_EATING	= 50 -- MODDED. MAYBE IT IS DUPLICATE WITH OTHERS
TE.TASK_STATE_ATE		= 51 -- MODDED. MAYBE IT IS DUPLICATE WITH OTHERS
TE.TASK_TIME_DRINK		= 52 -- MODDED. MAYBE IT IS DUPLICATE WITH OTHERS
TE.TASK_STATE_DRUNK	= 53 -- MODDED. MAYBE IT IS DUPLICATE WITH OTHERS
TE.TASK_SLEEP_START	= 54 -- MODDED. MAYBE IT IS DUPLICATE WITH OTHERS
TE.TASK_SLEEP_ENDED	= 55 -- MODDED. MAYBE IT IS DUPLICATE WITH OTHERS
TE.TASK_STATE_SLEPT	= 56 -- MODDED. MAYBE IT IS DUPLICATE WITH OTHERS
TE.TASK_EAT_VOLUME		= 57
TE.TASK_DRINK_VOLUME	= 58
TE.TASK_SLEEP_VOLUME	= 59
FULL_VOLUME = 10
FULL_VOLUME_SLEEP = 5

ET_TitleTable = 
{
	{"��i c�m", 65, 30},
	{"Kh�t n��c", 65, 31},
	{"Bu�n ng�", 65, 32},
};

ET_ItemTable = {
	{"Th�t Th�",{1,3,1},1,1},
	{"Th�t G�",{1,3,2},1,1},
	{"L� ng�",{1,3,3},2,1},
	{"Tay G�u",{1,3,4},2,1},
	{"H�ng Cao L��ng",{1,3,5},3,1},
	{"Kim Th�c ��o",{1,3,6},3,1},
	{"Men r��u",{1,3,7},3,1},
	{"Gia v�",{1,3,8},3,1},
	{"Quang Th�ng Ma",{1,3,9},4,1},
	{"Khuynh ly ��u",{1,3,10},4,1},
	{"Nhi�u minh ��u",{1,3,11},4,1},
	{"Dung tr�ch c�c",{1,3,12},4,1},
	{"M�a",{1,3,13},5,1},
	{"Di�n Tinh m�ch",{1,3,14},5,1},
	{"Thu�n h�a m�ch",{1,3,15},5,1},
	{"Du long t�c",{1,3,16},5,1},
	{"Ph�ng Qu�n T�c",{1,3,17},6,1},
	{"Dao Chi T�c",{1,3,18},6,1},
	{"M�c nh�",{1,3,19},6,1},
	{"Th�ch khu�n",{1,3,20},6,1},
	{"M�ng",{1,3,21},6,1},
	{"B�nh Ng�",{1,1,1},10,1},
	{"C�m n�m",{1,1,2},10,1},
	{"M�n th�u",{1,1,3},10,1},
	{"B�nh x�p",{1,1,4},10,1},
	{"B�nh bao th�t",{1,1,5},10,1},
	{"M�ng x�o",{1,1,6},10,1},
	{"T� Qu� ��u",{1,1,7},10,1},
	{"��u x�o",{1,1,8},10,1},
	{"C�i x�o t�i",{1,1,9},10,1},
	{"Thi�u �ao T�",{1,1,10},10,2},
	{"N� Nhi H�ng",{1,1,11},10,2},
	{"��o Hoa H��ng",{1,1,12},10,2},
	{"T�y M�ng T�u",{1,1,13},10,2},
	{"B�nh n��ng",{2,1,35},10,1},
	{"L��ng kh�",{2,1,1409},10,1},
	{"H� l�",{2,1,29009},10,2},
	{"B�u n��c",{2,1,29010},10,2},
}

TYPE_FOODS = 1
TYPE_DRINKS = 2

function ET_OnItemUse(nItemIndex)
	ET_OnTimerReset()
	local g,d,p = GetItemInfoByIndex(nItemIndex);
	local nInTableItemIndex = ET_GetItemInTableIndex(g,d,p);
	if nInTableItemIndex == nil or nInTableItemIndex == 0 then 
		return 0;
	end
	
	local nVolume = ET_ItemTable[nInTableItemIndex][3];
	local nType = ET_ItemTable[nInTableItemIndex][4];
	
	if nType == TYPE_FOODS then
		local nVolumeAte = TE:GetTask(TE.TASK_EAT_VOLUME);
		if nVolumeAte == FULL_VOLUME then
			Msg2Player("D��ng nh� l� �� �n no t� l�c n�o r�i.");
			TE:SetTask(TE.TASK_STATE_ATE,1)
			TE:SetTask(TE.TASK_EAT_VOLUME,0)
			return 0;
		end
		local nNewVolume = nVolumeAte+nVolume;
		if nNewVolume >= FULL_VOLUME then 
			TE:SetTask(TE.TASK_STATE_ATE,1)
			ET_RemoveTitle(65, 30, nItemIndex);
			TE:SetTask(TE.TASK_EAT_VOLUME,nNewVolume - FULL_VOLUME)
			TE:SetTask(TE.TASK_TIME_EATING,GetTime())
		else
			TE:SetTask(TE.TASK_EAT_VOLUME,nNewVolume)
			Msg2Player("�� �n ch�t �t m� d��ng nh� ch�a l�p c�n ��i.");
		end
	elseif nType == TYPE_DRINKS then
		local nVolumeDrunk = TE:GetTask(TE.TASK_DRINK_VOLUME);
		if nVolumeDrunk == FULL_VOLUME then
			Msg2Player("D��ng nh� l� �� u�ng �� t� l�c n�o r�i.");
			TE:SetTask(TE.TASK_STATE_DRUNK,1)
			TE:SetTask(TE.TASK_DRINK_VOLUME,0)
			return 0;
		end
		local nNewVolume = nVolumeDrunk+nVolume;
		if nNewVolume >= FULL_VOLUME then 
			TE:SetTask(TE.TASK_STATE_DRUNK,1)
			ET_RemoveTitle(65, 31, nItemIndex, nType);
			TE:SetTask(TE.TASK_DRINK_VOLUME,nNewVolume - FULL_VOLUME)
			TE:SetTask(TE.TASK_TIME_DRINK,GetTime())
		else
			TE:SetTask(TE.TASK_DRINK_VOLUME,nNewVolume)
			Msg2Player("�� u�ng ch�t �t m� d��ng nh� ch�a �� c�n kh�t.");
		end
	end
end;

function ET_OnTimerReset()
	local nVolume = 0;
	nVolume = TE:GetTask(TE.TASK_EAT_VOLUME)
	print("\nTE:GetTask(TE.TASK_EAT_VOLUME)",TE:GetTask(TE.TASK_EAT_VOLUME))
	if nVolume < FULL_VOLUME then 
		TE:SetTask(TE.TASK_STATE_ATE,0);
	end
	nVolume = TE:GetTask(TE.TASK_DRINK_VOLUME)
	print("TE:GetTask(TE.TASK_DRINK_VOLUME)",TE:GetTask(TE.TASK_DRINK_VOLUME))
	if nVolume < FULL_VOLUME then 
		TE:SetTask(TE.TASK_STATE_DRUNK,0);
	end
	nVolume = TE:GetTask(TE.TASK_SLEEP_VOLUME)
	print("TE:GetTask(TE.TASK_SLEEP_VOLUME)",TE:GetTask(TE.TASK_SLEEP_VOLUME))
	if nVolume < FULL_VOLUME_SLEEP then 
		TE:SetTask(TE.TASK_STATE_SLEPT,0);
	end
end;

function ET_GetItemInTableIndex(g,d,p)
	local t = ET_ItemTable;
	for i=1,getn(t) do 
		if (g == t[i][2][1] and d == t[i][2][2] and p == t[i][2][3]) then 
			return i;
		end
	end
	return 0;
end;

function getSleepVolume()
	local nTimeStartSleep = TE:GetTask(TE.TASK_SLEEP_START)
	local nTimeEndedSleep = TE:GetTask(TE.TASK_SLEEP_ENDED)
	if nTimeStartSleep == 0 then 
		return 0;
	end
	return (nTimeEndedSleep - nTimeStartSleep)/3600;
end;

function ET_OnSleep()
	if check_slept() == 1 then
		Talk(1,"","Kh�ng n�n ng� qu� nhi�u")
		return 0;
	end
	TE:SetTask(TE.TASK_SLEEP_START,GetTime())
	TE:SetTask(TE.TASK_SLEEP_ENDED,0)
end;

function ET_OnGetup()
	TE:SetTask(TE.TASK_SLEEP_ENDED,GetTime())
	local nVolume = getSleepVolume()
	TE:SetTask(TE.TASK_SLEEP_VOLUME,nVolume)
	TE:SetTask(TE.TASK_SLEEP_START,0)
	if nVolume >= FULL_VOLUME_SLEEP then 
		TE:SetTask(TE.TASK_STATE_SLEPT,1)
		TE:SetTask(TE.TASK_SLEEP_VOLUME,nVolume-FULL_VOLUME_SLEEP)
		local type1, type2 = 65, 32;
		RemoveTitle(type1, type2);
		Msg2Player("C�c h� �� ng� �� gi�c, c�m gi�c "..ET_GetTitleName(type1, type2).." �� tan bi�n");
	end
end;

function ET_RemoveTitle(type1, type2, nItemIdx, nActionType)	
	print("ET_RemoveTitle::called")
	if 1 == IsTitleExist(type1, type2) then
		local szName = GetItemName(nItemIdx)
		-- local g,d,p = GetItemInfoByIndex(nItemIdx);
		
		if 1 == DelItemByIndex(nItemIdx, 1) then
			RemoveTitle(type1, type2);
			Msg2Player("C�c h� �� s� d�ng "..szName..", c�m gi�c "..ET_GetTitleName(type1, type2).." �� tan bi�n");
		end
		
		if nActionType ~= nil and nActionType == TYPE_DRINKS then 
			local nRand = random(1000)
			if nRand == 1000 then 
				Msg2Player(szName.." �� b� h�ng trong qu� tr�nh s� d�ng.")
			else
				local g,d,p = GetItemInfoByIndex(nItemIdx);
				AddItem(g,d,p+2,1)
			end
		end
	else
		if type2 == 30 then 
			Msg2Player("Ch�a ��i c�m kh�ng n�n �n qu� nhi�u th�c �n.")
		end
		if type2 == 31 then 
			Msg2Player("Ch�a kh�t n��c kh�ng n�n u�ng qu� nhi�u n��c.")
		end
	end
end

function ET_AddTitle(type1, type2)
	-- Msg2Player("ET_AddTitle::add title{"..type1..", "..type2.."}")
	local name = ET_GetTitleName(type1, type2);
	if 0 ~= type1 and 0 ~= type2 then
		--WriteLog("ET_AddTitle::add title{"..type1..", "..type2.."}");	
		Msg2Player("C�c h� c�m th�y "..name..", nh�n ���c "..name.." hi�u �ng");		
		AddTitle(type1, type2);
		SetCurTitle(type1, type2);
		
		-- local curHour = tonumber(date("%H"));
		-- local curMinute = tonumber(date("%M"));
		-- local curSecond = tonumber(date("%S"));
		-- local expireTime = GetTime() + 23*3600+59*60+59 - (curHour*3600+curMinute*60+curSecond);
		-- SetTitleTime(type1, type2, expireTime);
	end
end


function ET_GetTitleName(type1, type2)
	local titleName = "";
	for i=1, getn(ET_TitleTable) do
		if ET_TitleTable[i][2] == type1 and ET_TitleTable[i][3] == type2 then
			titleName = ET_TitleTable[i][1];
			break;
		end
	end
	return titleName;
end

function ET_ResetTaskValue()
	SetTask(abc, 0);
end


function check_slept()
	return TE:GetTask(TE.TASK_STATE_SLEPT);
end;

function check_drunk()
	local nTime = TE:GetTask(TE.TASK_TIME_DRINK);
	local nNowTime = GetTime();
	local nState = TE:GetTask(TE.TASK_STATE_DRUNK);
	if (nNowTime - nTime)/3600 >= 5 and nState == 0 then 
		return 0;
	end
	return 1;
end;

function check_ate()
	local nTime = TE:GetTask(TE.TASK_TIME_EATING);
	local nNowTime = GetTime();
	local nState = TE:GetTask(TE.TASK_STATE_ATE);
	if (nNowTime - nTime)/3600 >= 5 and nState == 0 then 
		return 0;
	end
	return 1;
end;