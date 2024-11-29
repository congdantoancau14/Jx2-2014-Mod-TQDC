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
FULL_VOLUME = 10		-- Full volume of eating and drinking	Default: 10
FULL_VOLUME_SLEEP = 60	-- Full volume of sleeping (minute)		Default: 60*5

ET_TitleTable = 
{
	{"§ãi c¬m", 65, 30},
	{"Kh¸t n­íc", 65, 31},
	{"Buån ngñ", 65, 32},
};

ET_ItemTable = {
	{"ThÞt Thá",{1,3,1},1,1},
	{"ThÞt Gµ",{1,3,2},1,1},
	{"L« ng­",{1,3,3},2,1},
	{"Tay GÊu",{1,3,4},2,1},
	{"Hång Cao L­¬ng",{1,3,5},3,1},
	{"Kim Thùc §¹o",{1,3,6},3,1},
	{"Men r­îu",{1,3,7},3,1},
	{"Gia vÞ",{1,3,8},3,1},
	{"Quang Th«ng Ma",{1,3,9},4,1},
	{"Khuynh ly ®Ëu",{1,3,10},4,1},
	{"NhiÔu minh ®Ëu",{1,3,11},4,1},
	{"Dung tr¹ch cèc",{1,3,12},4,1},
	{"MÝa",{1,3,13},5,1},
	{"Diªn Tinh m¹ch",{1,3,14},5,1},
	{"ThuÇn hßa m¹ch",{1,3,15},5,1},
	{"Du long tóc",{1,3,16},5,1},
	{"Phông Qu¸n Tóc",{1,3,17},6,1},
	{"Dao Chi Tóc",{1,3,18},6,1},
	{"Méc nhÜ",{1,3,19},6,1},
	{"Th¹ch khuÈn",{1,3,20},6,1},
	{"M¨ng",{1,3,21},6,1},
	{"B¸nh Ng«",{1,1,1},1,1},
	{"C¬m n¾m",{1,1,2},6,1},
	{"Mµn thÇu",{1,1,3},6,1},
	{"B¸nh xÕp",{1,1,4},10,1},
	{"B¸nh bao thÞt",{1,1,5},10,1},
	{"M¨ng xµo",{1,1,6},10,1},
	{"Tø Quý ®Ëu",{1,1,7},10,1},
	{"§Ëu xµo",{1,1,8},10,1},
	{"C¶i xµo tái",{1,1,9},10,1},
	{"Thiªu §ao Tö",{1,1,10},10,2},
	{"N÷ Nhi Hång",{1,1,11},10,2},
	{"§¹o Hoa H­¬ng",{1,1,12},10,2},
	{"Tóy Méng Töu",{1,1,13},10,2},
	{"B¸nh n­íng",{2,1,35},1,1},
	{"L­¬ng kh«",{2,1,1409},10,1},
	{"Hå l«",{2,1,29009},10,2},
	{"BÇu n­íc",{2,1,29010},5,2},
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
	
	local nItemVolume = ET_ItemTable[nInTableItemIndex][3];
	local nType = ET_ItemTable[nInTableItemIndex][4];
	
	if nType == TYPE_FOODS then
		if 1 == DelItemByIndex(nItemIndex, 1) then
			local nVolumeAte = TE:GetTask(TE.TASK_EAT_VOLUME);
			if nVolumeAte == FULL_VOLUME then
				Msg2Player("D­êng nh­ lµ ®· ¨n no tõ lóc nµo råi.");
				TE:SetTask(TE.TASK_STATE_ATE,1)
				--TE:SetTask(TE.TASK_EAT_VOLUME,0)
				return 0;
			end
			
			local nNewVolume = nVolumeAte+nItemVolume;
			if nNewVolume >= FULL_VOLUME then 
				TE:SetTask(TE.TASK_STATE_ATE,1)
	
				ET_RemoveTitle(65, 30, nItemIndex);

				TE:SetTask(TE.TASK_EAT_VOLUME,nNewVolume - FULL_VOLUME)
				TE:SetTask(TE.TASK_TIME_EATING,GetTime())
				
			else
				TE:SetTask(TE.TASK_EAT_VOLUME,nNewVolume)
				if check_ate() ~= 1 then
					Msg2Player("§· ¨n chót Ýt mµ d­êng nh­ ch­a lÊp c¬n ®ãi.");
				else
					local g,d,p = GetItemInfoByIndex(nItemIdx);
					if g ~= 1 or d~= 1 or p ~=1 then -- B¸nh ng«
						Msg2Player("Ch­a ®ãi c¬m kh«ng nªn ¨n qu¸ nhiÒu thøc ¨n.")
					end
				end
				
			end
		else
			Msg2Player("H×nh nh­ ®å ¨n bÞ háng råi!");
		end
	elseif nType == TYPE_DRINKS then
		if 1 == DelItemByIndex(nItemIndex, 1) then
			
			if random(1000) == 1000 then 
				Msg2Player(szName.." ®· bÞ háng trong qu¸ tr×nh sö dông.")
			else
				local g,d,p = GetItemInfoByIndex(nItemIndex);
				AddItem(g,d,p+2,1)
			end
			
		
		
			local nVolumeDrunk = TE:GetTask(TE.TASK_DRINK_VOLUME);
			if nVolumeDrunk == FULL_VOLUME then
				Msg2Player("D­êng nh­ lµ ®· uèng ®· tõ lóc nµo råi.");
				TE:SetTask(TE.TASK_STATE_DRUNK,1)
				--TE:SetTask(TE.TASK_DRINK_VOLUME,0)
				return 0;
			end
			local nNewVolume = nVolumeDrunk+nItemVolume;
			if nNewVolume >= FULL_VOLUME then 
				TE:SetTask(TE.TASK_STATE_DRUNK,1)
				local check = ET_RemoveTitle(65, 31, nItemIndex, nType);
				if check == 1 then
					TE:SetTask(TE.TASK_DRINK_VOLUME,nNewVolume - FULL_VOLUME)
					TE:SetTask(TE.TASK_TIME_DRINK,GetTime())
				end
			else
				TE:SetTask(TE.TASK_DRINK_VOLUME,nNewVolume)
				if check_drunk() ~= 1 then	
					Msg2Player("§· uèng chót Ýt mµ d­êng nh­ ch­a ®· c¬n kh¸t.");
				else
					Msg2Player("Ch­a kh¸t n­íc kh«ng nªn uèng qu¸ nhiÒu n­íc.");
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
	nVolume = TE:GetTask(TE.TASK_EAT_VOLUME)
	print("\n");
	print(GetName().." TE:GetTask(TE.TASK_EAT_VOLUME)",TE:GetTask(TE.TASK_EAT_VOLUME))
	if nVolume < FULL_VOLUME then 
		TE:SetTask(TE.TASK_STATE_ATE,0);
	end
	nVolume = TE:GetTask(TE.TASK_DRINK_VOLUME)
	print(GetName().." TE:GetTask(TE.TASK_DRINK_VOLUME)",TE:GetTask(TE.TASK_DRINK_VOLUME))
	if nVolume < FULL_VOLUME then 
		TE:SetTask(TE.TASK_STATE_DRUNK,0);
	end
	nVolume = TE:GetTask(TE.TASK_SLEEP_VOLUME)
	print(GetName().." TE:GetTask(TE.TASK_SLEEP_VOLUME)",TE:GetTask(TE.TASK_SLEEP_VOLUME))
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

function getSleepVolume(bCurrent)
	local nTimeStartSleep = TE:GetTask(TE.TASK_SLEEP_START)
	local nTimeEndedSleep = TE:GetTask(TE.TASK_SLEEP_ENDED)
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
	TE:SetTask(TE.TASK_SLEEP_START,GetTime())
	TE:SetTask(TE.TASK_SLEEP_ENDED,0)
end;

function ET_OnGetup()
	TE:SetTask(TE.TASK_SLEEP_ENDED,GetTime())
	local nVolume = getSleepVolume()
	TE:SetTask(TE.TASK_SLEEP_START,0)
	if nVolume >= FULL_VOLUME_SLEEP and TE:GetTask(TE.TASK_STATE_SLEPT) == 0 then 
		TE:SetTask(TE.TASK_STATE_SLEPT,1)
		--TE:SetTask(TE.TASK_SLEEP_VOLUME,nVolume-FULL_VOLUME_SLEEP)
		TE:SetTask(TE.TASK_SLEEP_VOLUME,0)
		local type1, type2 = 65, 32;
		RemoveTitle(type1, type2);
		Msg2Player("C¸c h¹ ®· ngñ ®ñ giÊc, c¶m gi¸c "..ET_GetTitleName(type1, type2).." ®· tan biÕn");
	else
		local nLastVolume = TE:GetTask(TE.TASK_SLEEP_VOLUME);
		TE:SetTask(TE.TASK_SLEEP_VOLUME, nVolume + nLastVolume )
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