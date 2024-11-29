Include("\\script\\misc\\taskmanager.lua")

--TE = TaskManager:Create(11,10)

TE_TASK_TIME_EATING	= 3070 -- MODDED. MAYBE IT IS DUPLICATE WITH OTHERS
TE_TASK_STATE_ATE		= 3071 -- MODDED. MAYBE IT IS DUPLICATE WITH OTHERS
TE_TASK_TIME_DRINK		= 3072 -- MODDED. MAYBE IT IS DUPLICATE WITH OTHERS
TE_TASK_STATE_DRUNK	= 3073 -- MODDED. MAYBE IT IS DUPLICATE WITH OTHERS
TE_TASK_SLEEP_START	= 3074 -- MODDED. MAYBE IT IS DUPLICATE WITH OTHERS
TE_TASK_SLEEP_ENDED	= 3075 -- MODDED. MAYBE IT IS DUPLICATE WITH OTHERS
TE_TASK_STATE_SLEPT	= 3067 -- MODDED. MAYBE IT IS DUPLICATE WITH OTHERS
TE_TASK_EAT_VOLUME		= 3077
TE_TASK_DRINK_VOLUME	= 3078
TE_TASK_SLEEP_VOLUME	= 3079
FULL_VOLUME = 30		-- Full volume of eating and drinking	Default: 10
FULL_VOLUME_SLEEP = 60	-- Full volume of sleeping (minute)		Default: 60*5

ET_TitleTable = 
{
	{"��i c�m", 65, 30},
	{"Kh�t n��c", 65, 31},
	{"Bu�n ng�", 65, 32},
	{"Say r��u",65,33},
	{"B�i th�c",65,34},
	{"Ph� th�ng",65,35},
};

ET_ItemsTable = {
	
	{"Thi�u �ao T�",{1,1,10},10,2},
	{"N� Nhi H�ng",{1,1,11},11,2},
	{"��o Hoa H��ng",{1,1,12},12,2},
	{"T�y M�ng T�u",{1,1,13},13,2},
	{"Minh Nguy�t D�",{1,1,17},17,2},
	{"M�c Lan Xu�n",{1,1,18},18,2},
	{"T�y B�c V�ng",{1,1,19},19,2},
	
	{"B�nh n��ng",{2,1,35},2,1},
	{"Thi�u t�u",{2,1,12},1,2},

	{"H� l�",{2,1,29009},10,2,1},
	{"B�u n��c",{2,1,29010},5,2,1},
	{"Kim L�ng T�u",{2,95,822},8,2},
	{"Ngh�a Kh� T�u",{2,95,925},9,2},
	{"Th�n Nh��ng T�y B�n Ti�n",{2,96,29},29,2},
	{"Minh M�ng Chi T�u",{2,1,30587},30,2},
	{"B�u r��u da d�",{2,1,60},10,2},
	{"R��u T�y Ph�ng",{2,1,1401},14,2},
	{"R��u h� l�",{2,1,1414},14,2},
	{"R��u Nho",{2,1,30841},30,2},
	{"T�u B�i",{2,1,31110},3,2},
	{"V�n S� T�u",{2,1,30456},30,2},
	{"V� S� T�u",{2,1,30457},30,2},
	
}

TYPE_FOODS = 1
TYPE_DRINKS = 2

function ET_OnItemUse(nItemIndex)
--print("eating_head.lua>>ET_OnItemUse is called!");
	ET_OnTimerReset()

	local g,d,p = GetItemInfoByIndex(nItemIndex);
	local szItemName = GetItemInfoByIndex(g,d,p);
	local nInTableItemIndex = ET_GetItemInTableIndex(g,d,p);
	local nItemVolume = 0;
	local nType = 1;
	
	if nInTableItemIndex ~= nil and nInTableItemIndex ~= 0 then 
		nItemVolume = ET_ItemsTable[nInTableItemIndex][3];
		nType = ET_ItemsTable[nInTableItemIndex][4];
	elseif g == 1 and (d == 1 or d == 3) then
		nItemVolume = p;
	elseif strfind(strlower(szItemName), "b�nh") then
		nItemVolume = 10;
	elseif strfind(strlower(szItemName), "tr�") or strfind(strlower(szItemName), "n��c")then
		nItemVolume = 10;
		nType = 2;
	else
		return 0;
	end
	
	
	
	if nType == TYPE_FOODS then
		if 1 == DelItemByIndex(nItemIndex, 1) then
			local nVolumeAte = GetTask(TE_TASK_EAT_VOLUME);
			if nVolumeAte == FULL_VOLUME then
				Msg2Player("D��ng nh� l� �� �n no t� l�c n�o r�i.");
				SetTask(TE_TASK_STATE_ATE,1)
				--SetTask(TE_TASK_EAT_VOLUME,0)
				return 0;
			end
			
			local nNewVolume = nVolumeAte+nItemVolume;
			if nNewVolume >= FULL_VOLUME then 
				SetTask(TE_TASK_STATE_ATE,1)
	
				ET_RemoveTitle(65, 30, nItemIndex);

				SetTask(TE_TASK_EAT_VOLUME,nNewVolume - FULL_VOLUME)
				SetTask(TE_TASK_TIME_EATING,GetTime())
				
			else
				SetTask(TE_TASK_EAT_VOLUME,nNewVolume)
				if check_ate() ~= 1 then
					Msg2Player(format("�� �n ch�t �t m� d��ng nh� ch�a l�p c�n ��i. (%d/%d)",nNewVolume,FULL_VOLUME));
				else
					local g,d,p = GetItemInfoByIndex(nItemIdx);
					if g ~= 1 or d~= 1 or p ~=1 then -- B�nh ng�
						Msg2Player(format("Ch�a ��i c�m kh�ng n�n �n qu� nhi�u th�c �n. (%d/%d)",nNewVolume,FULL_VOLUME))
					end
				end
				
			end
		else
			Msg2Player("H�nh nh� �� �n b� h�ng r�i!");
		end
	elseif nType == TYPE_DRINKS then
		if 1 == DelItemByIndex(nItemIndex, 1) then
			
			if nInTableItemIndex ~= nil and nInTableItemIndex ~= 0 
				and ET_ItemsTable[nInTableItemIndex][5] ~= nil 
				and ET_ItemsTable[nInTableItemIndex][5] == 1 then
				if random(1000) == 1000 then 
					Msg2Player(szName.." �� b� h�ng trong qu� tr�nh s� d�ng.")
				else
					local g,d,p = GetItemInfoByIndex(nItemIndex);
					AddItem(g,d,p+2,1)
				end
			end
		
		
			local nVolumeDrunk = GetTask(TE_TASK_DRINK_VOLUME);
			if nVolumeDrunk == FULL_VOLUME then
				Msg2Player("D��ng nh� l� �� u�ng �� t� l�c n�o r�i.");
				SetTask(TE_TASK_STATE_DRUNK,1)
				--SetTask(TE_TASK_DRINK_VOLUME,0)
				return 0;
			end
			local nNewVolume = nVolumeDrunk+nItemVolume;
			if nNewVolume >= FULL_VOLUME then 
				SetTask(TE_TASK_STATE_DRUNK,1)
				local check = ET_RemoveTitle(65, 31, nItemIndex, nType);
				if check == 1 then
					SetTask(TE_TASK_DRINK_VOLUME,nNewVolume - FULL_VOLUME)
					SetTask(TE_TASK_TIME_DRINK,GetTime())
				end
			else
				SetTask(TE_TASK_DRINK_VOLUME,nNewVolume)
				if check_drunk() ~= 1 then	
					Msg2Player(format("�� u�ng ch�t �t m� d��ng nh� ch�a �� c�n kh�t. (%d/%d)",nNewVolume,FULL_VOLUME));
				else
					Msg2Player(format("Ch�a kh�t n��c kh�ng n�n u�ng qu� nhi�u n��c. (%d/%d)",nNewVolume,FULL_VOLUME));
				end
			end
		else
			Msg2Player("H�nh nh� n��c u�ng b� h�ng r�i.");
		end
	end
end;

function ET_ClearAllState()
	
	for i=1, getn(ET_TitleTable) do
		RemoveTitle(ET_TitleTable[i][2],ET_TitleTable[i][3]);
		Msg2Player("�� x�a b� tr�ng th�i "..ET_TitleTable[i][1]);
	end
end;

function ET_OnTimerReset()
	local nVolume = 0;
	nVolume = GetTask(TE_TASK_EAT_VOLUME)
	print("\n");
	print(GetName().." GetTask(TE_TASK_EAT_VOLUME)",GetTask(TE_TASK_EAT_VOLUME))
	if nVolume < FULL_VOLUME then 
		SetTask(TE_TASK_STATE_ATE,0);
	end
	nVolume = GetTask(TE_TASK_DRINK_VOLUME)
	print(GetName().." GetTask(TE_TASK_DRINK_VOLUME)",GetTask(TE_TASK_DRINK_VOLUME))
	if nVolume < FULL_VOLUME then 
		SetTask(TE_TASK_STATE_DRUNK,0);
	end
	nVolume = GetTask(TE_TASK_SLEEP_VOLUME)
	print(GetName().." GetTask(TE_TASK_SLEEP_VOLUME)",GetTask(TE_TASK_SLEEP_VOLUME))
	if nVolume < FULL_VOLUME_SLEEP then 
		SetTask(TE_TASK_STATE_SLEPT,0);
	end
end;

function ET_GetItemInTableIndex(g,d,p)
	local t = ET_ItemsTable;
	for i=1,getn(t) do 
		if (g == t[i][2][1] and d == t[i][2][2] and p == t[i][2][3]) then 
			return i;
		end
	end
	return 0;
end;

function getSleepVolume(bCurrent)
	local nTimeStartSleep = GetTask(TE_TASK_SLEEP_START)
	local nTimeEndedSleep = GetTask(TE_TASK_SLEEP_ENDED)
	if bCurrent == 1 then
		nTimeEndedSleep = GetTime();
	end

	if nTimeStartSleep == 0 then 
		return 0;
	end

	return (nTimeEndedSleep - nTimeStartSleep)/60; -- sleep time unit. Default: /3600 (hours)
end;

function ET_OnSleep()
	if check_slept() == 1 then
		Talk(1,"","Kh�ng n�n ng� qu� nhi�u")
		return 0;
	end
	SetTask(TE_TASK_SLEEP_START,GetTime())
	SetTask(TE_TASK_SLEEP_ENDED,0)
end;

function ET_OnGetup()
	SetTask(TE_TASK_SLEEP_ENDED,GetTime())
	local nVolume = getSleepVolume()
	SetTask(TE_TASK_SLEEP_START,0)
	if nVolume >= FULL_VOLUME_SLEEP and GetTask(TE_TASK_STATE_SLEPT) == 0 then 
		SetTask(TE_TASK_STATE_SLEPT,1)
		--SetTask(TE_TASK_SLEEP_VOLUME,nVolume-FULL_VOLUME_SLEEP)
		SetTask(TE_TASK_SLEEP_VOLUME,0)
		local type1, type2 = 65, 32;
		RemoveTitle(type1, type2);
		Msg2Player("C�c h� �� ng� �� gi�c, c�m gi�c "..ET_GetTitleName(type1, type2).." �� tan bi�n");
	else
		local nLastVolume = GetTask(TE_TASK_SLEEP_VOLUME);
		SetTask(TE_TASK_SLEEP_VOLUME, nVolume + nLastVolume )
		if check_slept() == 0 then
			Msg2Player("L�n n�y c�c h� �� ng� ���c "..nVolume.." ph�t. C�ng th�m l�n tr��c "..nLastVolume
				..". T�ng th�i gian l�: "..nVolume + nLastVolume.." ph�t"
				..". H�y ngh� ng�i th�m �� c� s�c kh�e tr�ng ki�n v� tinh th�n minh m�n h�n!");
		end
	end
	
end;

function ET_RemoveTitle(type1, type2, nItemIdx, nActionType)	
	--print("ET_RemoveTitle::called")
	if 1 == IsTitleExist(type1, type2) then
		local szName = GetItemName(nItemIdx)
		-- local g,d,p = GetItemInfoByIndex(nItemIdx);
		
		
		RemoveTitle(type1, type2);
		Msg2Player("C�c h� �� s� d�ng "..szName..", c�m gi�c "..ET_GetTitleName(type1, type2).." �� tan bi�n");

		
		
		return 1;
	else
		
		return 0
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
	return GetTask(TE_TASK_STATE_SLEPT);
end;

function check_drunk()
	local nTime = GetTask(TE_TASK_TIME_DRINK);
	local nNowTime = GetTime();
	local nState = GetTask(TE_TASK_STATE_DRUNK);
	if (nNowTime - nTime)/3600 >= 5 and nState == 0 then 
		return 0;
	end
	return 1;
end;

function check_ate()
	local nTime = GetTask(TE_TASK_TIME_EATING);
	local nNowTime = GetTime();
	local nState = GetTask(TE_TASK_STATE_ATE);
	if (nNowTime - nTime)/3600 >= 5 and nState == 0 then 
		return 0;
	end
	return 1;
end;