Include("\\script\\online\\eating\\eating_head.lua")
Include("\\script\\item\\horse_head.lua")
npc_name = "<color=green>Chñ qu¸n trä<color>: "
nGoInTime = 0; -- l­u thêi gian tiÕn vµo d×ch tr¹m

function main()

	local nGoInFlag = GetTask(TSK_GOIN)
	if nGoInFlag ~= 1 then
		Say(npc_name.."Kh¸ch quan muèn t×m chç nghØ ch©n sao? ChØ <color=white>10 l­îng b¹c<color> th«i.",3,
		"§óng vËy, h·y s¾p xÕp cho ta/gotoYiZhan",
		"Ta muèn tham quan d×ch tr¹m/canguan",
		"T¹i h¹ chØ ghĞ ngang th«i/nothing")
	else
		Say(npc_name.."Kh¸ch quan muèn rêi ®i sao?",2,
		-- "Ta nghØ ë ®©y ®­îc mÊy canh giê råi?",
		"§óng vËy, ta cã viÖc cÇn ra ngoµi/leaveYiZhan",
		"Kh«ng ph¶i. Ta vÉn muèn n¸n l¹i mét lóc/nothing")
	end
end;

function leaveYiZhan()
	NewWorld(100,1472,2865)
	SetTask(TSK_GOIN, 0);
	ET_OnGetup()
	RestorePlayerState()
end;

function gotoYiZhan()
	-- local g,d,pHorse = GetPlayerEquipInfo(10)
	-- if pHorse ~= 0 then 
		-- Talk(1,"",npc_name.."PhiÒn kh¸ch quan xuèng ngùa tr­íc.")
		-- return 0;
	-- end
	if Pay(1000) ~= 1 then
		Talk(1,"",npc_name.."Kh«ng cã tiÒn th× ®i chç kh¸c ngñ ®i. Chç ta kh«ng chøa khè r¸ch ¸o «m.")
		return 0;
	end
	NewWorld(803,1600,3200)
	SetTask(TSK_GOIN, 1);
	ET_OnSleep()
	SetPlayerState()
end;

function canguan()
	nGoInTime = GetTime()
	SetTask(TSK_GOIN, 1);
	SetPos(1474,2861)
end;

function SetPlayerState()
	LeaveTeam();	--Àë¿ª¶ÓÎé
	-- SetLogoutRV(1);	--ÉèÖÃµÇÂ½µãÎª³ÇÊĞÖØÉúµã
	SetFightState(0);	--ºÍÆ½×´Ì¬
	UseScrollEnable(0);	--½ûÖ¹Ê¹ÓÃ»Ø³Ç·û
	ForbitTrade(1);	--½ûÖ¹½»Ò×
	StallEnable(0);	--½ûÖ¹°ÚÌ¯
	OpenFriendliness(0);	--²»Ôö¼ÓºÃ¸Ğ¶È
	SetDeathPunish(0);	--ÎŞËÀÍö³Í·£
	InteractiveEnable(0);	--½ûÖ¹»¥¶¯
	UseDummy(0,1);	--Çå³ıÌæÉí·ûĞ§¹û
	ForbitLevelUp(1);	--½ûÖ¹Éı¼¶
	ForbitAddProp(1);	--½ûÖ¹²Ù×÷Ç±ÄÜµã
	ForbidChangePK(0);	--¿ÉÒÔ×ª»»PK×´Ì¬£¨Èç¹ûÓĞÈË´ËÊ±ÔÚÇĞ´è£¬ÊÇ²»ÄÜ×ª»»PK×´Ì¬µÄ£¬ËùÒÔÕâÀïÓÃÖ¸ÁîÉèÖÃÔÊĞí×ª»»PK×´Ì¬£©
	UseSkillEnable(0);	--½ûÖ¹Îä¹¦
	if GetRidingState() == 1 then 
		RestoreCarry()
	end
	UnEquipAtPosition(10);
	KillFollower();		--É¾³ı¸úËæNPC
	SetPlayerRestrictions(0,1);	--ÏŞÖÆÎïÆ·Ê¹ÓÃ
	-- SetPlayerRestrictions(1,1);	--ÏŞÖÆÎïÆ·Ê¹ÓÃ
	-- SetPlayerRestrictions(2,1);	--ÏŞÖÆÎïÆ·Ê¹ÓÃ
	ForbidChangePK(1);	--½ûÖ¹×ª»»PK×´Ì¬
	ForbidRiding(1);
	ForbidRead(1)	--²»ÄÜĞŞÊé
end;

function RestorePlayerState()
	LeaveTeam();	--Àë¿ª¶ÓÎé
	SetFightState(0);	--ºÍÆ½×´Ì¬
	SetDeathScript("");	--Çå¿ÕËÀÍö½Å±¾
	SetTempRevPos(0,0,0);	--É¾³ıÁÙÊ±ÖØÉúµã
	ForbidChangePK(0);	--¿ÉÒÔ×ª»»PK×´Ì¬
	SetPKFlag(0,0);	--ÎŞPK×´Ì¬
	local nVersion,nCurGs = GetRealmType();
	if nCurGs ~= 1 then
		ForbitTrade(0);	--ÔÊĞí½»Ò×
		StallEnable(1);	--ÔÊĞí°ÚÌ¯
	end
	OpenFriendliness(1);	--¿ÉÔö¼ÓºÃ¸Ğ¶È
	SetDeathPunish(1);	--ÓĞËÀÍö³Í·£
	InteractiveEnable(1);	--ÔÊĞí»¥¶¯
	SetLockCurTitle(1);	--¿É¸ü»»³ÆºÅ
	SetPlayerRestrictions(0,0);
	-- SetPlayerRestrictions(1,0);
	-- SetPlayerRestrictions(2,0);
	-- DesaltPlayer(0,0);
	ForbitLevelUp(0);
	ForbitAddProp(0);
	UseSkillEnable(1);
	UseScrollEnable(1);	--ÔÊĞíÊ¹ÓÃ»Ø³Ç
	ForbidRiding(0);
	ForbidRead(0)	--ÄÜĞŞÊé
end;

function nothing()
end;