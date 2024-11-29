--幸运之星Relay端触发脚本

function GameSvrConnected(GameSvr)
rolename = GetStringFromSDB("LuckyStar", 0, 0);
if (rolename ~= "") then
	NotifySDBRecordChanged("LuckyStar", 0 , 0, 1);
end;
	str = format("Server: %d li猲 k誸 l筰 Relay, ng玦 sao may m緉 %s", GameSvr,rolename)
	OutputMsg(str);
end;

function TaskShedule()
	TaskName("Ng玦 sao may m緉")
	TaskInterval(10)
	TaskCountLimit(0)
end

function TaskContent()
	randomseed(date("%d%H%M%S"));
	accname, rolename = RandomSelAOnlinePlayer()
	date = GetCurrentTime()
	success = SaveStringToSDBOw("LuckyStarLog", date, 0, rolename)
	success = SaveStringToSDBOw("LuckyStar", 0, 0, rolename)
	str = format("Xu蕋 hi謓 ng玦 sao may m緉 m韎 %s",rolename)
	OutputMsg(str);
	NotifySDBRecordChanged("LuckyStar", 0 , 0, 1);
end

