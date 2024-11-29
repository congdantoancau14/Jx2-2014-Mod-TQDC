-- ÁúÖÛ±ÈÈü¶¨Ê±Æ÷

-- INTERVAL_TIME = 120	-- Ã¿Ğ¡Ê±´¥·¢
INTERVAL_TIME = 90	-- Ã¿Ğ¡Ê±´¥·¢

function GetNextTime()
    -- local hour = tonumber(date("%H"));
    -- if (hour == 23) then
    -- 	hour = 0;
    -- else
    -- 	hour = hour + 1;
    -- end
    -- return hour, 0;
    local hour = tonumber(date("%H"));
    local min = tonumber(date("%M"));
    local add = 10;
    if (min + add >= 60) then
        min = min + add - 60
        hour = hour + 1
        if (hour >= 24) then
            hour = 0
        end
    else
        min = min + add
    end
    return hour, min;
end

function TaskShedule()
	TaskName("Thi ®Êu thuyÒn rång");	

	-- 60·ÖÖÓÒ»´Î
	TaskInterval(INTERVAL_TIME);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg(format("NhiÖm vô thu thËp vËt phÈm b¾t ®Çu vµo lóc %d:%d...", h, m));
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0);

	-- OutputMsg("Æô¶¯×Ô¶¯¹ö¶¯¹«¸æ...");
end

function TaskContent()

    local nRandomSeed = tonumber(date("%y")..date("%m")..date("%d")..date("%H")..date("%M")..date("%S"));

	OutputMsg("NhiÖm vô thu thËp vËt phÈm b¾t ®Çu ...");
	-- ´¥·¢GameServerÉÏµÄ½Å±¾
	-- GlobalExecute("dw LoadScript([[\\settings\\trigger_collectionstart.lua]])");
	-- GlobalExecute(format("dw CollectionTaskStart(%d, %d, %d, %d)", 100, 100, 100, 100));
	
	-- Ö´ĞĞ¿ªÊ¼ÊÕ¼¯ÈÎÎñ½Å±¾
	GlobalExecute(format("dw createDataCall(%d)", nRandomSeed));
end
