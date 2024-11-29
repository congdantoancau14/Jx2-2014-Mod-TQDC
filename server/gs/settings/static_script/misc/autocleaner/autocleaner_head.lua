--Ô½ÄÏ°æ·ÏÆú½Å±¾
_AutoCleaner_Script = "\\script\\misc\\autocleaner\\autocleaner.lua";
function autoclean()
	SendScript2VM(_AutoCleaner_Script, "AutoCleanerCommittee:clean()");
end

function RegisterDailyTasks(tTasks)
	SendScript2VM(_AutoCleaner_Script, format("AutoCleanerDaily:registerTask(%s)", Val2Str(tTasks)));
end

function RegisterDailyCampTasks(camp, tasks)
	SendScript2VM(_AutoCleaner_Script, format("cleaner_TaskMgr:registerCampTask(%s, %s)", camp, Val2Str(tasks)));
end

function RegisterDailyCleanCallback(szScript, szCallback)
	SendScript2VM(_AutoCleaner_Script, 
		format("AutoCleanerDaily:registerCallback('%s','%s')", szScript, szCallback));
end
