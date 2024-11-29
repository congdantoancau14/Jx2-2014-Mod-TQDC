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
	{"§ãi c¬m", 65, 30},
	{"Kh¸t n­íc", 65, 31},
	{"Buån ngñ", 65, 32},
	{"Say r­îu",65,33},
	{"Béi thùc",65,34},
	{"Phï thòng",65,35},
};

ET_ItemsTable = {
	
	{"Thiªu §ao Tö",{1,1,10},10,2},
	{"N÷ Nhi Hång",{1,1,11},11,2},
	{"§¹o Hoa H­¬ng",{1,1,12},12,2},
	{"Tóy Méng Töu",{1,1,13},13,2},
	{"Minh NguyÖt D¹",{1,1,17},17,2},
	{"Méc Lan Xu©n",{1,1,18},18,2},
	{"T©y B¾c Väng",{1,1,19},19,2},
	
	{"B¸nh n­íng",{2,1,35},2,1},
	{"Thiªu töu",{2,1,12},1,2},

	{"Hå l«",{2,1,29009},10,2,1},
	{"BÇu n­íc",{2,1,29010},5,2,1},
	{"Kim L¨ng Töu",{2,95,822},8,2},
	{"NghÜa KhÝ Töu",{2,95,925},9,2},
	{"ThÇn Nh­ìng Tóy B¸n Tiªn",{2,96,29},29,2},
	{"Minh M¹ng Chi Töu",{2,1,30587},30,2},
	{"BÇu r­îu da dª",{2,1,60},10,2},
	{"R­îu T©y Phông",{2,1,1401},14,2},
	{"R­îu hå l«",{2,1,1414},14,2},
	{"R­îu Nho",{2,1,30841},30,2},
	{"Töu B«i",{2,1,31110},3,2},
	{"V¨n S­ Töu",{2,1,30456},30,2},
	{"Vâ S­ Töu",{2,1,30457},30,2},
	
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
	elseif strfind(strlower(szItemName), "b¸nh") then
		nItemVolume = 10;
	elseif strfind(strlower(szItemName), "trµ") or strfind(strlower(szItemName), "n­íc")then
		nItemVolume = 10;
		nType = 2;
	else
		return 0;
	end
	
	
	
	if nType == TYPE_FOODS then
		if 1 == DelItemByIndex(nItemIndex, 1) then
			local nVolumeAte = GetTask(TE_TASK_EAT_VOLUME);
			if nVolumeAte == FULL_VOLUME then
				Msg2Player("D­êng nh­ lµ ®· ¨n no tõ lóc nµo råi.");
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
					Msg2Player(format("§· ¨n chót Ýt mµ d­êng nh­ ch­a lÊp c¬n ®ãi. (%d/%d)",nNewVolume,FULL_VOLUME));
				else
					local g,d,p = GetItemInfoByIndex(nItemIdx);
					if g ~= 1 or d~= 1 or p ~=1 then -- B¸nh ng«
						Msg2Player(format("Ch­a ®ãi c¬m kh«ng nªn ¨n qu¸ nhiÒu thøc ¨n. (%d/%d)",nNewVolume,FULL_VOLUME))
					end
				end
				
			end
		else
			Msg2Player("H×nh nh­ ®å ¨n bÞ háng råi!");
		end
	elseif nType == TYPE_DRINKS then
		if 1 == DelItemByIndex(nItemIndex, 1) then
			
			if nInTableItemIndex ~= nil and nInTableItemIndex ~= 0 
				and ET_ItemsTable[nInTableItemIndex][5] ~= nil 
				and ET_ItemsTable[nInTableItemIndex][5] == 1 then
				if random(1000) == 1000 then 
					Msg2Player(szName.." ®· bÞ háng trong qu¸ tr×nh sö dông.")
				else
					local g,d,p = GetItemInfoByIndex(nItemIndex);
					AddItem(g,d,p+2,1)
				end
			end
		
		
			local nVolumeDrunk = GetTask(TE_TASK_DRINK_VOLUME);
			if nVolumeDrunk == FULL_VOLUME then
				Msg2Player("D­êng nh­ lµ ®· uèng ®· tõ lóc nµo råi.");
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
					Msg2Player(format("§· uèng chót Ýt mµ d­êng nh­ ch­a ®· c¬n kh¸t. (%d/%d)",nNewVolume,FULL_VOLUME));
				else
					Msg2Player(format("Ch­a kh¸t n­íc kh«ng nªn uèng qu¸ nhiÒu n­íc. (%d/%d)",nNewVolume,FULL_VOLUME));
				end
			end
		else
			Msg2Player("H×nh nh­ n­íc uèng bÞ háng råi.");
		end
	end
end;

function ET_ClearAllState()
	
	for i=1, getn(ET_TitleTable) do
		RemoveTitle(ET_TitleTable[i][2],ET_TitleTable[i][3]);
		Msg2Player("§· xãa bá tr¹ng th¸i "..ET_TitleTable[i][1]);
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
		Talk(1,"","Kh«ng nªn ngñ qu¸ nhiÒu")
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
		Msg2Player("C¸c h¹ ®· ngñ ®ñ giÊc, c¶m gi¸c "..ET_GetTitleName(type1, type2).." ®· tan biÕn");
	else
		local nLastVolume = GetTask(TE_TASK_SLEEP_VOLUME);
		SetTask(TE_TASK_SLEEP_VOLUME, nVolume + nLastVolume )
		if check_slept() == 0 then
			Msg2Player("LÇn nµy c¸c h¹ ®· ngñ ®­îc "..nVolume.." phót. Céng thªm lÇn tr­íc "..nLastVolume
				..". Tæng thêi gian lµ: "..nVolume + nLastVolume.." phót"
				..". H·y nghØ ng¬i thªm ®Ó cã søc kháe tr¸ng kiÖn vµ tinh thÇn minh mÉn h¬n!");
		end
	end
	
end;

function ET_RemoveTitle(type1, type2, nItemIdx, nActionType)	
	--print("ET_RemoveTitle::called")
	if 1 == IsTitleExist(type1, type2) then
		local szName = GetItemName(nItemIdx)
		-- local g,d,p = GetItemInfoByIndex(nItemIdx);
		
		
		RemoveTitle(type1, type2);
		Msg2Player("C¸c h¹ ®· sö dông "..szName..", c¶m gi¸c "..ET_GetTitleName(type1, type2).." ®· tan biÕn");

		
		
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
		Msg2Player("C¸c h¹ c¶m thÊy "..name..", nhËn ®­îc "..name.." hiÖu øng");		
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