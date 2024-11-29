Include("\\RelaySetting\\Task\\GoldBossHead.lua");
Sid = 512
Interval = 30;
Count = 0;
StartHour=-1;
StartMin=-1;

function NewBoss()
	return 1, 20, 512, random(90,100);
end;



