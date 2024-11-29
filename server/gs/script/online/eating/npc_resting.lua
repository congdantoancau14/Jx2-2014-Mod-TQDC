
Include("\\script\\online\\eating\\eating_head.lua")
Include("\\script\\item\\horse_head.lua")

FIGHT_STATE = 3069 -- MODDED. MAYBE IT IS CONFLICT WITH OTHERS

function main()
	local nGoInFlag = GetTask(TSK_GOIN)
	Say("",3,"Dõng ch©n nghØ ng¬i/rest","Ta ®· nghØ ng¬i ®­îc bao l©u råi nhØ?/askSleepInfo","Rêi ®i/leave")
end;


function askSleepInfo()
	Talk(1,"",format("H×nh nh­ ta ®· nghØ ®­îc %s phót",getSleepVolume(1)));
end;

function leave()
	local nIndex = GetTargetNpc()
	local m,x,y = GetNpcWorldPos(nIndex);
	NewWorld(m,x,y+2);
	SetTask(TSK_GOIN, 0);
	ET_OnGetup()
	RestorePlayerState()
end;

function rest()
	local nIndex = GetTargetNpc()
	local m,x,y = GetNpcWorldPos(nIndex);
	NewWorld(m,x,y-2);
	SetTask(TSK_GOIN, 1);
	ET_OnSleep()
	SetPlayerState()
end;

function SetPlayerState()
	LeaveTeam();	--Àë¿ª¶ÓÎé
	-- SetLogoutRV(1);	--ÉèÖÃµÇÂ½µãÎª³ÇÊĞÖØÉúµã
	SetTask(FIGHT_STATE,GetFightState());
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
	--SetFightState(0);	--ºÍÆ½×´Ì¬
	SetFightState(GetTask(FIGHT_STATE));
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