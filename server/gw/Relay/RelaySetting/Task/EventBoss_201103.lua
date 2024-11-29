Include("\\RelaySetting\\Task\\EventBoss_201103_string.lua")

local _GetNexStartTime = function(nStartHour, nStartMinute, nInterval)
	local nNextHour = nStartHour
	local nNextMinute = nInterval * ceil(nStartMinute / nInterval)
	
	if nNextMinute >= 60 then
		nNextHour = nNextHour + floor(nNextMinute / 60)
		nNextMinute = mod(nNextMinute, 60) 
	end
	
	if (nNextHour >= 24) then
		nNextHour = mod(nNextHour, 24);
	end
	return nNextHour, nNextMinute
end

function TaskShedule()
	TaskName(VET_TB_201103_EVENTBOSS_TSK_NAME);	
	-- 60分钟一次
	local  nInterval = 60
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute, nInterval)

	TaskInterval(nInterval);
	-- 设置触发时间
	TaskTime(nNextHour, nNextMinute);
        -- 执行无限次
	TaskCountLimit(0);
	
	OutputMsg(format("%s Shedule Will Be Start At %d:%d, Interval is %d Minutes", VET_TB_201103_EVENTBOSS_TSK_NAME, nNextHour, nNextMinute, nInterval))
end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d"));
	local nTime = tonumber(date("%H%M"));

	if (nDate < 20110412 and nDate > 20110429) then
		return
	end

	if ((1100 <= nTime and nTime < 1200) or (1800 <= nTime and nTime < 1900) or (2300 <= nTime and nTime < 2400)) then
		OutputMsg(format(VET_TB_201103_EVENTBOSS_DLG[2],VET_TB_201103_EVENTBOSS_DLG[3],VET_TB_201103_EVENTBOSS_DLG[4]))
		GlobalExecute(format("dw AddGlobalNews([[%s]])", format(VET_TB_201103_EVENTBOSS_DLG[2],VET_TB_201103_EVENTBOSS_DLG[3],VET_TB_201103_EVENTBOSS_DLG[4])))
		for i=1,3 do
			local nPosIndex = random(1,getn(VET_TB_201103_EVENTBOSS_POS));
			GlobalExecute(format("dw GS_VET_201103_EventBoss_SpawnBoss(%d,%d,%d)",VET_TB_201103_EVENTBOSS_POS[nPosIndex][1],VET_TB_201103_EVENTBOSS_POS[nPosIndex][2],VET_TB_201103_EVENTBOSS_POS[nPosIndex][3]));
			OutputMsg(format("Spawn 201103 Event Boss At (%d,%d,%d)", VET_TB_201103_EVENTBOSS_POS[nPosIndex][1],VET_TB_201103_EVENTBOSS_POS[nPosIndex][2],VET_TB_201103_EVENTBOSS_POS[nPosIndex][3]));
		end
	end
end
