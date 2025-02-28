
Include("\\RelaySetting\\Task\\shinynight_head.lua");

INTERVAL_TIME = 5	-- 每5分钟触发

function TaskShedule()
	TaskName("B総 u tu莕 ho祅 kinh nghi謒 nh﹏ i Иm Huy Ho祅g");	

	TaskInterval(INTERVAL_TIME);
	-- 设置触发时间
  	local hour = tonumber(date("%H"));
    local min = tonumber(date("%M"));
 	TaskTime(hour, min);
	OutputMsg(format("Nhi謒 v� tu莕 ho祅 kinh nghi謒 nh﹏ i Иm Huy Ho祅g b総 u v祇 l骳 %d:%d...", hour, min));
	-- 执行无限次
	TaskCountLimit(0);
end

function TaskContent()
	OutputMsg("ShinyNight loop......")
	
	if (GetGlbInt(RELAYGLB_SHINYNIGHT) == 1) then
		return
	end

  	local hour = tonumber(date("%H"))
    local min = tonumber(date("%M"));
    -- min >= 2才继续执行，保证shinynight_loop和shinynight_start不冲突。 
 	if (hour < TIME_START or hour >= TIME_CLOSE or min < 2) then
  		return
  	end
  	
	-- 选择倍率	
	local multiple = GetGlbInt(RELAYGLB_MULTIPLE)
	if (multiple == 0) then
		multiple = get_multiple()
	end
	
	-- 设置今天晚上辉煌之夜的内容
	local system = GetShiningChoice()
	if (system == 0) then
		-- 获取保存的系统索引
		system = GetGlbInt(RELAYGLB_SYSTEM)
		if (system == 0) then
			system = get_random_system()
		end
	end

	-- 获得最NB的投票人的名字
	local szVoteName = GetVoteName()

	SetGlbInt(RELAYGLB_SHINYNIGHT, 1)
	GlobalExecute(format("dw ShinyNight_Start(%d,%d,%s)", system, multiple, szVoteName))
	
	-- 清除relay中的记忆
	ClearShiningNight()
end
