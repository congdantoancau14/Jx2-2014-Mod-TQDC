-- ÖĞÎç1µã³öÏÖµÄBOSS¶¨Ê±Æ÷

function TaskShedule()
	TaskName("BOSS buæi tr­a");	

	-- Ò»ÌìÒ»´Î
	TaskInterval(1440);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	TaskTime(13,0);
	OutputMsg(format("BOSS xuÊt hiÖn vµo lóc 13:00..."));
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0);

	-- OutputMsg("Æô¶¯×Ô¶¯¹ö¶¯¹«¸æ...");
end

function TaskContent()

    local Random1 = Random(8)
          Random2 = Random(5)
          Random3 = Random(2)
	
	  world1 = Random1+1
	  world2 = Random2+101
	  world3 = Random3+201

          msg="BOSS ®Çu tiªn xuÊt hiÖn t¹i:"..world1..",   BOSS thø 2 xuÊt hiÖn t¹i:"..world2..",   BOSS thø 3 xuÊt hiÖn t¹i:"..world3
	  OutputMsg(format(msg));

	-- Ö´ĞĞÕÙ»½BOSS½Å±¾
	GlobalExecute(format("dw createBoss(%d,%d,%d)", world1, world2, world3));
end
