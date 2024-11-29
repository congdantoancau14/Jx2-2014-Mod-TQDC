--File name:qingming_head.lua
--Describe:ÇåÃ÷½Ú»î¶¯½Å±¾Í·ÎÄ¼ş
--Create Date:2006-3-15(315Ïû·ÑÕßµÄ½ÚÈÕ)
--Author:yanjun
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
--È«¾Ö³£Á¿
FALSE = 0;	--ÏàĞÅ¶¨ÒåÕâÑùµÄ³£Á¿»áÊ¹´úÂëÈİÒ×Àí½âÒ»µã°É
TRUE = 1;
QINGMING_SWITCH = TRUE;	--»î¶¯¿ª¹Ø¡££°Îª¹Ø£¬£±Îª¿ª
--È«¾Ö±äÁ¿ºÅ

--ÈÎÎñ±äÁ¿ºÅ
QINGMING_TASK = 1875;	--´ËÈÎÎñ±äÁ¿ÎªËÄ²¿·ÖÀ´Ê¹ÓÃ
						--1×Ö½Ú¼ÇÂ¼Íæ¼ÒÄ¿Ç°ßµ°İÁË¶àÉÙ´Î
						--2×Ö½Ú¼ÇÂ¼µ±ÌìÓĞÃ»ÓĞ°İ¹ı
						--3×Ö½Ú¼ÇÂ¼Íæ¼ÒÊÇ²»ÊÇÁ¬×Å£±£°Ìì¶¼È¥°İ¼ÀÁË
						--4×Ö½Ú
JIBAI_ITEM = 1876;	--´ËÈÎÎñ±äÁ¿ÎªËÄ²¿·ÖÀ´Ê¹ÓÃ
					--1×Ö½Ú¼ÇÂ¼Íæ¼Òµ±ÌìÓĞÃ»ÓĞÊ¹ÓÃ¹ı¼ÀÆ·ÂøÍ·
					--2×Ö½Ú¼ÇÂ¼Íæ¼Òµ±ÌìÓĞÃ»ÓĞÊ¹ÓÃ¹ı¼ÀÆ·¼¦Èâ
					--3×Ö½Ú¼ÇÂ¼Íæ¼Òµ±ÌìÓĞÃ»ÓĞÊ¹ÓÃ¹ı¼ÀÆ·ÀÏ¾Æ
					--4×Ö½Ú¼ÇÂ¼Íæ¼ÒÊ¹ÓÃ¼À°İÎïÆ·ºóÌá¸ßµÄ¸ÅÂÊ

EnterPointTab = {	--¼ÇÂ¼Èı¸öµØÍ¼µÄ½øÈë×ø±ê¡£
			[1] = {818,1636,3181},	--ÈªÖİ
			[2] = {820,1636,3181},	--ãê¾©
			[3] = {819,1636,3181},	--³É¶¼
			};
LeavePointTab = {	--¼ÇÂ¼´ÓÁêÄ¹³öÀ´Ê±µÄ×ø±ê
			[1] = {100,1453,2812},	--ÈªÖİ¡¡»ÆÏÀÚ£
			[2] = {200,1170,2834},	--ãê¾©¡¡º«ÏÀÚ£
			[3] = {300,1640,3531},	--³É¶¼¡¡ĞùÔ¯ÏÀÚ£
			};
		
--=============================================================================================
--==================================Ïà¹Øº¯Êı===================================================
--ÅĞ¶Ï½ÚÈÕÊÇ·ñ¿ª·Å
function Is_QingMing_Opened()	
	local nDate = tonumber(date("%m%d"));
	if QINGMING_SWITCH == TRUE and nDate >= 0331 and nDate <=0409 then
		return TRUE;
	else
		return FALSE;
	end;
end;

--×Ô¶¨ÒåĞ´ÈÕÖ¾º¯Êı¡£µÚÒ»¸ö²ÎÊıÎªÊÂ¼şÃû£¬µÚ¶ş¸ö²ÎÊıÎªÊÂ¼şÄÚÈİ
function Write_Log(Event,Content)	
	WriteLog("["..Event.."]:"..GetName()..Content);
end;

--µÃµ½Íæ¼ÒµÄĞÔ±ğ×Ö·û´®¡£´Ó\script\task\world\task_head.luaÀïÃæcopy¹ıÀ´µÄ¡£
--Copyright¡ò2005¡@peres
function GetPlayerSex()	
	local mySex -- ÓÃÒÔÏÔÊ¾ÈËÎïĞÔ±ğµÄ×Ö·û
	if (GetSex() == 1) then
		mySex = "ThiÕu hiÖp";
	elseif (GetSex() == 2) then
		mySex = "C« n­¬ng";
	end;
	return mySex;
end;

--ÉèÖÃÄ³ÈÎÎñ±äÁ¿µÄÄ³Ò»×Ö½ÚµÄÖµ
function Set_Task_Byte(TaskID,Byte,Value)	
	SetTask(TaskID,SetByte(GetTask(TaskID),Byte,Value));
	return GetTask(TaskID);
end;

--µÃµ½Ä³ÈÎÎñ±äÁ¿Ä³Ò»×Ö½ÚµÄÖµ
function Get_Task_Byte(TaskID,Byte)	
	return GetByte(GetTask(TaskID),Byte);
end;

function get_qingming_info()
	Talk(4,"","Ho¹t ®éng TiÕt Thanh Minh diÔn ra vµo <color=yellow>30/3 - 8/4<color>, ng­êi ch¬i <color=yellow>cÊp 11<color> cã thÓ tham gia b»ng c¸ch ®i t¶o mé c¸c ®¹i hiÖp.",
				"Cóng b¸i mé phÇn c¸c vŞ nh­ <color=yellow>Chu ®¹i hiÖp, Hµn ®¹i hiÖp, Hiªn Viªn ®¹i hiÖp<color>. Thêi gian diÔn ra ho¹t ®éng chØ cÇn cóng b¸i bÊt kú mé phÇn cña mét vŞ ®¹i hiÖp b»ng c¸ch <color=yellow>v¸i l¹y<color> lµ ®­îc.",
				"Do "..Zgc_pub_sex_name().."thµnh t©m cóng b¸i nhËn ®­îc mËt ®å nhiÖm vô cña thñ l¨ng nh©n, lµm xong ®Õn <color=yellow>thñ l¨ng nh©n<color> nhËn th­ëng.",
				"<color=green>MËt ®å Thanh Minh<color> ghi l¹i mçi ngµy chØ lµm ®­îc <color=yellow>1<color> lÇn, nh­ng cã thÓ dïng <color=yellow>giÊy cóng tÕ<color> t¨ng sè lÇn hoµn thµnh nhiÖm vô, <color=yellow>giÊy cóng tÕ<color> mçi ngµy chØ dïng ®­îc <color=yellow>2<color> lÇn!"
			);
end