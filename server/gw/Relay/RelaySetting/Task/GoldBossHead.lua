--»Æ½ğ¹ÖÎïµÄ½Å±¾Éè¶¨
--1¡¢½¨Á¢Ò»¸ö»Æ½ğ¹ÖÎïµÄ²úÉú·½°¸½Å±¾ÎÄ¼ş²¢·ÅÖÃÔÚRelay\RelaySetting\Task\Ä¿Â¼ÏÂÃæ¡£
--ÔÚ¸ÃÎÄ¼ş¿ªÍ·²¿·Ö±ØĞë°üº¬»Æ½ğ¹ÖÎïµÄÍ·ÎÄ¼ş
--ÓÃÒÔÏÂ·½·¨°üº¬
--Include("\\RelaySetting\\Task\\GoldBossHead.lua");

--2¡¢ÔÚ·Çº¯ÊıÇøÓò(È«¾Ö¶¨Òå)£¬ÌîĞ´Óë»Æ½ğ¹ÖÎïÓĞ¹ØµÄÈ«¾Ö±äÁ¿Öµ
--·Ö±ğÊÇ
--1¡¢Sid±íÊ¾²úÉúµÄBossµÄ·½°¸ºÅ£¬Ã¿¸ö·½°¸Ö»ÄÜÍ¬Ê±²úÉúÒ»¸öBoss¡£×¢ÒâBoss·½°¸ºÅ±ØĞëÊÇÎ¨Ò»µÄ£¬²»ÄÜÉè¶¨ÖØ¸´µÄSidºÅ.
--2¡¢Interval±íÊ¾²úÉúBossµÄ¼ä¸ôÊ±¼ä,µ¥Î»Îª·ÖÖÓ
--3¡¢Count ±íÊ¾´¥·¢¸Ã·½°¸µÄ´ÎÊı£¬Èç¹ûÎª0±íÊ¾ÎŞÏŞ´ÎÊı£¬Ö»Òªµ½Ê±¼ä¾Í´¥·¢±¾½Å±¾¡£
--4¡¢StartHour, StartMin±íÊ¾µÚÒ»´Î´¥·¢±¾·½°¸µÄÊ±¼ä£¬StartHour±íÊ¾Ğ¡Ê±£¬StartMin±íÊ¾·ÖÖÓ¡£
--Èç¹ûStartHourÓëStartMinµÈÓÚ-1Ê±£¬±íÊ¾RelayÒ»Æô¶¯£¬¾ÍÁ¢¼´¿ªÊ¼µÚÒ»´Î´¥·¢
--ÀıÈç:
--Sid = 4
--Interval = 30
--Count = 4
--StartHour = 3
--StartMin = 19
--ÉÏÊöÉè¶¨±íÊ¾£¬µÚ4¸ö»Æ½ğ¹ÖÎï²úÉú·½°¸£¬½«ÔÚ3µã19·Ö¿ªÊ¼µÚÒ»´Î´¥·¢£¬²¢ÇÒÒÔºóÃ¿°ëĞ¡Ê±(30·ÖÖÓ)´¥·¢Ò»´Î£¬¹²´¥·¢4´Î¡£Ò²¾ÍÊÇÔÚ3:19 3:49 4:19 4:49´¥·¢.

--3¡¢¶¨ÒåÓëÊµÏÖBossµÄ½Å±¾º¯ÊıNewBoss()
--¸Ãº¯Êı±ØĞë´æÔÚ¡£¸Ãº¯ÊıµÄ¹¦ÄÜÊÇ¾ö¶¨ÊÇ·ñÒª²úÉúBoss,BossËùÔÚµØ¡¢ÖÖÀàÓëµÈ¼¶¡£
--Òò´Ë¡¢º¯Êı×îÖÕ·µ»ØÈçÏÂ4¸ö²ÎÊı
--·Ö±ğ±íÊ¾ÊÇ·ñÒª²úÉúboss,bossËùÔÚµØÍ¼id,bossµÄNpcÄ£°åid, bossµÄµÈ¼¶¡£
--ÀıÈçÈçÏÂNewBossµÄÊµÏÖ.
--function NewBoss()
	--return 1, 20, random(100), 50 + random(50); 
--end;
--±íÊ¾£¬²úÉú¹ÖÎï£¬ËüÔÚµØÍ¼IDÎª20µÄµØÍ¼ÉÏ£¬npcÄ£°åºÅÔÚ1µ½100Ëæ»ú,µÈ¼¶ÔÚ51µ½100Ëæ»ú

--4¡¢ÔÚRelay\RelaySetting\Task\TaskList.iniÎÄ¼şÖĞÔö¼Ó±¾½Å±¾
--°Ñ[List]ÏÂµÄCountµÄÖµ¼ÓÒ»±íÊ¾ÓÖÔö¼ÓÁËÒ»¸ö¶¨Ê±´¥·¢ÈÎÎñ
--Ôö¼Ó[Task_X],°ÑXÌæ»»³É×îĞÂµÄCountÖµ.
--ÔÚ[Task_X]µÄTaskFileÉÏÌî±¾½Å±¾µÄÎÄ¼şÃû
																			--»Æ½ğ¹ÖÎïÉè¼ÆÕß:ñ¼ê»
																			--2004.2.13 16:27:08	

function GameSvrConnected(GameSvr)
bFind , key1, mapid = GetFirstRecordFromSDB("GoldBoss",Sid, 0, 1, 0);
if (bFind == 1) then 
	--Èç¹ûÖØÁ¬µÄ·şÎñÆ÷°üº¬BossµÄÊı¾İÊ±
	if (IsMapOnGameSvr(mapid, GameSvr )) then 
		bResult , npctid, npclevel, npcstate = GetCustomDataFromSDB("GoldBoss", Sid, mapid, "iii");		
		if (bResult == 1) then 
			success = SaveCustomDataToSDBOw("GoldBoss", Sid, mapid, "iii", npcid, npclevel, 0);
			NotifySDBRecordChanged("GoldBoss", Sid ,mapid ,1);		
			msg = format("Ph­¬ng ¸n boss Hoµng Kim %d, ph¸t hiÖn GameSvr%d tù ®éng kÕt nèi ®Õn Relay, gièng boss lÇn tr­íc: Khu vùc %d, Npc m« pháng %d, Npc ®¼ng cÊp %d.", Sid, GameSvr, mapid, npcid, npclevel);
			OutputMsg(msg);
		else
			success = ClearRecordOnShareDB("GoldBoss",Sid, 0,1,0);		
		end;
	end
end
end;

function TaskShedule()
	--ÉèÖÃ·½°¸Ãû³Æ
	TaskName("Boss Hoµng Kim"..Sid)
	
	--ÉèÖÃ¼ä¸ôÊ±¼ä£¬µ¥Î»Îª·ÖÖÓ
	TaskInterval(Interval)
	
	--ÉèÖÃ´¥·¢´ÎÊı£¬0±íÊ¾ÎŞÏŞ´ÎÊı
	TaskCountLimit(Count)
	
	--Éè¶¨¶¨Ê±ÆÚÆô¶¯Ê±¼ä
	if (StartHour ~= -1 and StartMin ~= -1) then 
		TaskTime(StartHour, StartMin);
	end;
	--É¾³ı´ÓÇ°µÄÊı¾İ
	success = ClearRecordOnShareDB("GoldBoss",Sid, 0,1,0);
	OutputMsg("Xãa sè liÖu céng h­ëng boss Hoµng Kim:"..Sid);
end

function TaskContent()
	bFind , key1, key2 = GetFirstRecordFromSDB("GoldBoss",Sid, 0, 1, 0);
	if (bFind == 1) then
		OutputMsg("Tõ sè liÖu céng h­ëng t×m ®­îc boss Hoµng Kim".. Sid..","..key2.."Sè liÖu ph­¬ng ¸n");
		bResult , npctid, npclevel, npcstate = GetCustomDataFromSDB("GoldBoss", Sid, key2, "iii");
		msg =	format("Ph­¬ng ¸n boss Hoµng Kim %d Sè liÖu Npc: %d §¼ng cÊp: %d Tr¹ng th¸i: %d ", Sid, npctid, npclevel, npcstate);
		OutputMsg(msg);
		if (bResult == 1) then 
			if (npctid == 0 and npcstate == 0 and npclevel == 0) or (npctid ~= 0 and npclevel ~=0 and npcstate == 0) then 
				create, mapid, npcid, npclevel = NewBoss();
				if (create == 1) then 
					msg = format("Ph­¬ng ¸n %d boss Hoµng Kim kh«ng tån t¹i hoÆc ®· chÕt, chuÈn bŞ s¶n sinh boss Hoµng Kim míi! Khu vùc %d, Npc m« pháng %d, Npc ®¼ng cÊp %d", Sid, mapid, npcid, npclevel);
					OutputMsg(msg);
					success = SaveCustomDataToSDBOw("GoldBoss",Sid, mapid, "iii", npcid, npclevel, 0);
					NotifySDBRecordChanged("GoldBoss", Sid ,mapid ,1);
				end
			end
		end
	else
		create, mapid, npcid, npclevel = NewBoss();
		msg = format("Ph­¬ng ¸n %d boss Hoµng Kim kh«ng tån t¹i, chuÈn bŞ s¶n sinh boss Hoµng Kim míi! Khu vùc %d, Npc m« pháng %d, Npc ®¼ng cÊp %d", Sid, mapid, npcid, npclevel);
		OutputMsg(msg);
		success = SaveCustomDataToSDBOw("GoldBoss",Sid, mapid, "iii", npcid, npclevel, 0);
		NotifySDBRecordChanged("GoldBoss", Sid ,mapid ,1);
	end
end
