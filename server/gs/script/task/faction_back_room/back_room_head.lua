--×÷Õß£ºÑÏ¾ü
--´´½¨ÈÕÆÚ£º07Äê11ÔÂ13ÈÕ14:50
--Ê¦ÃÅ¹Ø¿¨³£Á¿¶¨Òå½Å±¾ÎÄ¼þ
Include("\\script\\task\\faction_back_room\\stage_info.lua");
DEBUG_VERSION = 0;
IB_VERSION = 1;
UNCOMPLETED_VERSION = 0;	--²»ÍêÕû°æ±¾£¿Ö¸µÄÊÇºöÂÔÒ»Ð©³ÌÐò»úÖÆ
--==================================================================================
BACKROOM_RELAY_KEY = " backroom_timerecord";	--Êý¾Ý¿âÖ÷¹Ø¼ü×Ö
LOG_HEADER = "[S­ m«n mËt thÊt]:";
LOG_ERR_HEADER = "[S­ m«n mËt thÊt bÞ lçi]:";
MISSION_NAME = "S­ m«n mËt thÊt 080129";
--==================================================================================
LOGIN_ID = 1107;	--µÇÂ½´¥·¢Æ÷£¬´¦Àí·þÎñÆ÷å´»úµÄÇé¿ö
LOGIN_TRIGGER_ID = 3019;
--==================================================================================
MAX_DIFFICULTY_LEVEL = 9;	--×î´óÑ­»·
MAX_STAGE = 9;				--Ã¿Ñ­»·×î´ó¹Ø¿¨Êý
MAX_ATTEND_TIMES = 3;		--Ã¿ÖÜ×î´ó´³¹Ø´ÎÊý
MAX_FAILURE_TIMES = 1;		--Ã¿ÖÜ×î´óÊ§°Ü´ÎÊý
MAX_FREE_READ_RECORD_TIMES = 2;	--Ã¿ÖÜ×î´óÃâ·Ñ¶Áµµ´ÎÊý
MAX_ROOM_COUNT = 100;		--µÀ¾ßËùÄÜ¿ªÆôµÄµ¥Ì¨·þÎñÆ÷×î´ó·¿¼äÊý
MAX_ROUTE_ROOM_COUNT = 10;	--Á÷ÅÉ×î´ó·¿¼äÊý

NEED_NUM_JIEGUAN = 2;		--½Ó¹ØËùÐèµÀ¾ßÊýÁ¿
--×ÜÊ¹ÓÃ·¶Î§1121-1140==============================================================
--ÈÎÎñ±äÁ¿1121--1125================================================================
TSK_ATTEND_WEEK = 1121;			--ÉÏ´Î´³¹ØµÄÊ±¼ä£¨ÄêÖÜ£©

TSK_ENTER_TYPE = 1123;			--¼ÇÂ¼½øÈëÀàÐÍ£¬0±íÊ¾Õý³£½øÈë£¬1±íÊ¾¶Áµµ½øÈë¡£´Ë±äÁ¿ÔÚÄ³Ñ­»·µÚÒ»¹ØÊ±½«±»Çå0
TSK_TAG1 = 1124;				--±ê¼Ç1¡£ÓÃÀ´±ê¼ÇÍæ¼ÒÔÚµ÷ÕûºóµÚ1´ÎÉÏÏß
--ÈÎÎñ±äÁ¿1126--1130£¨Ã¿ÖÜÒ»Çå£©==================================================
TSK_WC_BEGIN = 1126;
TSK_WC_ATTEND_TIMES = 1126;	--±¾ÖÜ´³¹Ø×Ü´ÎÊý
TSK_WC_FAIL_TIMES = 1127;		--±¾ÖÜ´³¹ØÊ§°Ü´ÎÊý£¨Çåµµ´ÎÊý£©
TSK_WC_READ_RECORD_TIMES = 1128;	--±¾ÖÜ¶Áµµ´ÎÊý
TSK_WC_LAST_RECORD = 1129;		--¼ÇÂ¼±¾ÖÜ´³¹Ø½ø¶È¡£¸öÎ»ÓëÊ®Î»¼ÇÂ¼Ð¡¹Ø£¬°ÙÎ»ÒÔÉÏ¼ÇÂ¼ÄÑ¶È

TSK_WC_END = 1130;
--¼ÇÂ¼Ã¿Ñ­»·×î¿ìÊ±¼ä1131ÖÁ1139¹²9¸ö±äÁ¿
TSK_BEST_RECORD_BEGIN = 1131;
TSK_BEST_RECORD_END = 1139;
--ÈÎÎñ±äÁ¿1936--1940£¨ÍË³ö¹Ø¿¨Ê±Çå0£©=================================================
TSK_NC_BEGIN = 1140;
TSK_NC_END = 1140;
--ÁÙÊ±ÈÎÎñ±äÁ¿======================================================================
TTSK_BEGIN = 0;
TTSK_END = 0;
TTSK_NORMAL_ITEM_TYPE = 18;		--¶Ò»»ÎïÆ·Ê±¼ÇÂ¼Ñ¡ÔñµÄÊÇÄÄÑùÎïÆ·
--µØÍ¼±äÁ¿==========================================================================
MAP_TSK_BEGIN = 1;
MAP_TSK_END = 1;
--=========================================================================================
CAMP_ALL = 0;
CAMP_PLAYER = 1;
CAMP_ENEMY = 2;
CAMP_EVIL = 3;
TB_CAMP_NAME =
{
	[0] = "",
	[1] = "camp_player",
	[2] = "camp_enemy",
	[3] = "camp_evil",
}
--¹Ø¿¨ÎïÆ·ÐÅÏ¢
TB_ITEM = 
{
	[1] = {"S­ m«n mËt thÊt lÖnh",2,0,1048},
}
--ÏûºÄÆ·ÐÅÏ¢
TB_NORMAL_ITEM = 
{	--Ãû×Ö£¬ID1£¬ID2£¬ID3£¬ÏûºÄÎïÆ·ÊýÁ¿£¬ÏûºÄ½ð±Ò£¨µ¥Î»½ð£©
	[1] = {"PhÇn Quang ThÇn Sa",2,1,3333,15,0},
	[2] = {"Ngò Hoa Tô Nguyªn T¸n (søc m¹nh)",1,0,261,5,0},
	[3] = {"Ngò Hoa Tô Nguyªn T¸n (néi c«ng)",1,0,262,5,0},
	[4] = {"Ngò Hoa Tô Nguyªn T¸n (g©n cèt)",1,0,263,5,0},
	[5] = {"Ngò Hoa Tô Nguyªn T¸n (th©n ph¸p)",1,0,264,5,0},
	[6] = {"Ngò Hoa Tô Nguyªn T¸n (nhanh nhÑn)",1,0,265,5,0},
	[7] = {"ThÊt Hoa Tô Nguyªn T¸n (søc m¹nh, g©n cèt)",1,0,266,8,50},
	[8] = {"ThÊt Hoa Tô Nguyªn T¸n (søc m¹nh, th©n ph¸p)",1,0,267,8,50},
	[9] = {"ThÊt Hoa Tô Nguyªn T¸n (søc m¹nh, nhanh nhÑn)",1,0,268,8,50},
	[10] = {"ThÊt Hoa Tô Nguyªn T¸n (søc m¹nh, néi c«ng)",1,0,269,8,50},
	[11] = {"ThÊt Hoa Tô Nguyªn T¸n (néi c«ng, g©n cèt)",1,0,270,8,50},
	[12] = {"ThÊt Hoa Tô Nguyªn T¸n (néi c«ng, th©n ph¸p)",1,0,271,8,50},
	[13] = {"ThÊt Hoa Tô Nguyªn T¸n (néi c«ng, nhanh nhÑn)",1,0,272,8,50},
	[14] = {"ThÊt Hoa Tô Nguyªn T¸n (th©n ph¸p, g©n cèt)",1,0,273,8,50},
	[15] = {"ThÊt Hoa Tô Nguyªn T¸n (th©n ph¸p, nhanh nhÑn)",1,0,274,8,50},
	[16] = {"ThÊt Hoa Tô Nguyªn T¸n (nhanh nhÑn, g©n cèt)",1,0,275,8,50},
}
TEMP_STATE_BEGIN = 2600001;
TEMP_STATE_END = 2600020;
--===================================================================================
--MissionÏà¹Ø³£Á¿¶¨Òå======================================================================
MISSION_ID = 41;									--MissionµÄID
TIMER_ID = 70;										--¼ÆÊ±Æ÷µÄID
--=========================================================================================
FRAME_PER_SECOND = 18;								--ÓÎÏ·ÔËÐÐËÙ¶È£ºÃ¿Ãë£±£¸Ö¡
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--Ã¿·ÖÖÓÓÎÏ·Ö¡Êý
--¶¨Òå¸÷¸ö½×¶ÎµÄ³ÖÐøÊ±¼ä£¬=================================================================
READY_TIME = 5;										--×¼±¸Ê±¼ä£¬5·ÖÖÓ
STARTED_TIME = 10;									--½øÐÐÊ±¼äÊ±¼ä£¬10·ÖÖÓ
SHORT_PAUSE_TIME = 1/6;								--Ä¬ÈÏµÄ´³¹ØÊ±¼ä							
ENDING_TIME = 2;									--µÈ´ý½áÊøÊ±¼ä£¬5·ÖÖÓ
--¶¨Òå¸÷¸ö½×¶Î¼ÆÊ±Æ÷µÄ´¥·¢¼ä¸ô=============================================================
READY_TIMER_INTERVAL = 1;							--¼ÆÊ±Æ÷´¥·¢µÄÊ±¼ä¼ä¸ô£¬µ¥Î»·ÖÖÓ
READY_TIMER_COUNT = (READY_TIME/READY_TIMER_INTERVAL)-1;	
STARTED_TIMER_INTERVAL = 1/12;	--5Ãë					
STARTED_TIMER_COUNT = (STARTED_TIME/STARTED_TIMER_INTERVAL)-1;
SHORT_PAUSE_TIMER_INTERVAL = 1/12;	--5Ãë
SHORT_PAUSE_TIMER_COUNT = (SHORT_PAUSE_TIME/SHORT_PAUSE_TIMER_INTERVAL)-1;
ENDING_TIMER_INTERVAL = 1/2;
ENDING_TIMER_COUNT = (ENDING_TIME/ENDING_TIMER_INTERVAL)-1;	
--MissionS±äÁ¿=============================================================================
MS_MISSION_NAME = 1;								--¼ÇÂ¼MissionµÄÃû×Ö£¬ÓÃ×÷µØÍ¼¼ì²éµÈ
MS_MISSION_STRING = 10;								--Mission×Ö·û´®£¬Ò²ÓÃ×÷µØÍ¼¼ì²é
--MissionV±äÁ¿=============================================================================
MV_MISSION_STATE = 1;								--¼ÇÂ¼Mission×´Ì¬
MV_TIMER_LOOP = 2;									--¼ÇÂ¼¼ÆÊ±Æ÷µÄ¼ÆÊý
MV_MISSION_UID = 3;									--¼ÇÂ¼MissionµÄÎ¨Ò»ID
MV_CUR_DIFF = 4;									--µ±Ç°´¦ÓÚµÚ¼¸Ñ­»·
MV_CUR_STAGE = 5;									--µ±Ç°´¦ÓÚµÚ¼¸¹Ø
MV_TOTAL_TIME = 6;									--Í¨¹ýÄ³Ò»Ñ­»·ËùÓÃµÄ×ÜÊ±¼ä
MV_MAPID = 7;										--¼ÇÂ¼³¡µØµÄµØÍ¼ID
MV_MAPIDX = 8;										--¼ÇÂ¼³¡µØµÄµØÍ¼Ë÷Òý
MV_FACTION = 9;										--¼ÇÂ¼Õâ¸ö³¡µØÊÇÊôÓÚÄÄ¸öÃÅÅÉµÄ
MV_ROUTE = 10;										--¼ÇÂ¼Íæ¼ÒµÄÂ·Ïß
MV_PLAYERINDEX = 11;								--¼ÇÂ¼Íæ¼ÒµÄË÷Òý
MV_BEGIN_TIME = 12;									--¼ÇÂ¼Ä³Ð¡¹Ø¿ªÊ¼´³¹ØµÄÊ±¼ä
MV_ENTRY_MAPID = 13;								--¼ÇÂ¼Íæ¼Ò½øÈëÃØÊÒÊ±Ëù´¦µÄµØÍ¼ID
MV_MAP_TYPE = 14;									--¼ÇÂ¼³¡µØÀàÐÍ¡£Èç¹ûÎª0±íÊ¾¸Ã³¡µØÊÇ·þÎñÆ÷¹²ÏíÃØÊÒµØÍ¼£¬·ñÔòÕâ¸öÊýÖµ±íÊ¾¸Ã³¡µØÊÇÄÄ¸öÁ÷ÅÉµÄ
--Ã¿Ð¡¹ØÇå³ýµÄMission±äÁ¿==================================================================
MV_NSC_BEGIN = 71
MV_NSC_REMOVE_NPC_BODY = 71;						--NPCËÀµÄÊ±ºòÊÇ·ñÁ¢¿ÌÉ¾³ýÊ¬Ìå
MV_NSC_BOSS_INDEX = 72;								--¼ÇÂ¼BOSSµÄË÷Òý
MV_NSC_KILL_NPC_COUNT = 73;							--¼ÇÂ¼µ±Ç°É±NPCÊýÁ¿
MV_NSC_NEED_KILL_NUMBER = 74;						--¼ÇÂ¼ËùÐèÉ±NPCÊýÁ¿
MV_NSC_REFLASH_KILL_NUMBER = 75;					--¼ÇÂ¼Ë¢ÐÂÇ°ËùÉ±µÄNPCÊýÁ¿

MV_NSC_VALUE1 = 80;									--¹²Ïí±äÁ¿
MV_NSC_END = 80
--¼ÇÂ¼NPCË÷ÒýµÄ±äÁ¿========================================================================
MV_NPC_INDEX_BEGING = 81;							--ÓÃÀ´¼ÇÂ¼NPCË÷Òý£¬Õ¼ÓÃ£¸£°ÖÁ£±£°£°
MV_NPC_INDEX_END = 100;
--Mission×´Ì¬¼¯============================================================================
MS_STATE_IDEL = 0;									--³¡µØ¿ÕÏÐ
MS_STATE_READY = 1;									--µÈ´ý×´Ì¬£¨°üÀ¨¿ªÊ¼µÈ´ýÓë´æµµµÈ´ý£©
MS_STATE_STARTED = 2;								--´³¹Ø×´Ì¬
MS_STATE_SHORT_PAUSE = 3;							--Ð¡¹ØÓëÐ¡¹ØÖ®¼äµÄÔÝÍ£
MS_STATE_END_WAITING = 4;							--½áÊø×´Ì¬£¨µÈ´ýÀë³¡£©
--=========================================================================================
