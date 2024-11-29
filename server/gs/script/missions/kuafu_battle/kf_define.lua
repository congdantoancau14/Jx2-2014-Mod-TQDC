Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")
--ÅäÖÃ¿ç·þºÍÔ´·þÕâÀïÐèÒªÐÞ¸Ä-----------------
--KF_NPC_POS = {6028, 1620, 3145} --¿ç·þ±¨ÃûÈË×ø±ê£¨¿ç·þ£©
--KF_NPC_POS_SRC = {300, 1855, 3556}  --¿ç·þÕ½³¡Áì½±ÈË×ø±ê(Ô´·þ)
KF_MAP_TASK_TEMP_ID = 8899 --ÄýÔÂ¹¬µØÍ¼¼ÇÂ¼³¡´ÎÐÅÏ¢
--ÍË³öÕ½³¡µÄµã
KF_OUT_POS = {
	{8899, 1310, 2693},
	{8899, 1405, 2800},
	{8899, 1490, 2743},
	{8899, 1366, 2608},
}
---------------------------------------------
KF_CURR_OPEN_COUNT = 1; --SetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_CURR_OPEN_COUNT, x)
KF_LAST_OPEN_MAPID = 2; --SetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_LAST_OPEN_MAPID, x)

KF_EXP_EXT_RATE = min(VNG_CFG_KFB_EXP_EXT_ADD_RATE or 0, 2)--¾­Ñé½±Àø¼Ó³ÉÏµÊý
KF_JUNGONG_EXT_RATE = min(VNG_CFG_KFB_JUNGONG_EXT_ADD_RATE or 0, 2) --¾ü¹¦¼Ó³ÉÏµÊý

KF_ENTRY_FEE = 1;  --±¨Ãû·Ñ

KF_JOIN_TIMES_MAX = 2; --Ò»Ìì×î¶à²Î¼ÓµÄ´ÎÊý

KF_TEAM_SIZE_MAX = 3; --¶ÓÎé×î´óÈËÊýÏÞÖÆ

KF_REVIVE_BUFF_TIME = 15; --s

KF_LOGTITEL = "PhÇn th­ëng chiÕn tr­êng liªn ®Êu";

---¿ç·þÕ½³¡Ê¹ÓÃµÄÈÎÎñ±äÁ¿--------------------------------
---Ðè´«»ØÔ´·þÎñÆ÷µÄÈÎÎñ±äÁ¿------------------------------
KF_BATTLE_TASK = 3132; --µÚ1ÖÁ5Î»±íÊ¾¿Û½ðµÄµ¥Î»ÊýÁ¿£¬µÚ6,16¼ÇÂ¼»îÔ¾¶È£¬µÚ3×Ö½Ú¼ÇÂ¼²Î¼ÓµÄ´ÎÊý,25,26±íÊ¾ÕóÓª,27ËÀÍö»ØÑª±ê¼Ç£¬28ÊÇ·ñÊÇµ±ÌìµÚÒ»´ÎÁì½±,µÚ29-31Î»¼ÇÂ¼Õ½³¡µÄÊ¤¸º£¨1Î´¿ªÆô£¬2Ê¤Àû£¬3Ê§°Ü£¬4Æ½¾Ö£©

KF_TMULTIPLE = {
		[1] = {1, 1, {0, 0}, "NhËn th­ëng trùc tiÕp"},
		[2] = {1.5, 2, {1, 1}, "Qu©n c«ng ch­¬ng nhËn th­ëng"},
		[3] = {2, 5, {2, 1}, "Qu©n c«ng ®¹i nhËn th­ëng"},
		[4] = {2.5, 10, {3, 1}, "Qu©n c«ng huy hoµng nhËn th­ëng"},
		[5] = {3, 14, {3, 2}, "Vinh Dù Qu©n C«ng Ch­¬ng nhËn th­ëng"},
}

---MISSION----------------------------
KF_MAP_ID = 6027;
KF_MISSION_ID = 62;
KF_TIMER_ID = 92;

KF_CampOne_Name = "Qu©n Tèng";
KF_CampTwo_Name = "Qu©n Liªu";

KF_ALL_ID = 0;
KF_CampOne_ID = 1;	--ÎäÁÖÁªÃËÔÚmissionÖÐÕóÓª
KF_CampTwo_ID = 2;	--ÎäÁÖÅÑÍ½ÔÚmissionÖÐÕóÓª

KF_tCampName = {"Qu©n Tèng","Qu©n Liªu"};

KF_CampOne_Type = "camp_player"; --ÎäÁÖÁªÃËÕóÓªÀàÐÍ£¬°üÀ¨npc
KF_CampTwo_Type = "camp_enemy";  --ÎäÁÖÅÑÍ½ÕóÓªÀàÐÍ£¬°üÀ¨npc
KF_Neutral_Type = "camp_evil";		--ÖÐÁ¢npcÕóÓªÀàÐÍ

KF_tCampType = {
	[KF_ALL_ID] = "camp_evil",
	[KF_CampOne_ID] = "camp_player",
	[KF_CampTwo_ID] = "camp_enemy",
};

--ÆµµÀ
KF_BATTLE_CHANNEL = {
	[KF_ALL_ID] = {"Kªnh chiÕn tr­êng", 39},
	[KF_CampOne_ID] = {"Kªnh Tèng", 40},
	[KF_CampTwo_ID] = {"Kªnh Liªu", 41},
}

KF_PLAYER_MAX_NUM = 120; --Ò»·½×î´óÈËÊýÏÞÖÆ
KF_PLAYER_ALLOW_NUM = 10; --¿ªÆôÖÁÉÙÐèÒª¶àÉÙÈË

KF_MISSION_COUTN_MAX = 1; --Ò»¸öÊ±¼ä×î¶à¿ªÆôµÄ³¡´Î

KF_MISSION_OPEN_FAIL_FLAG = 1234; --Õ½³¡Î´¿ªÆô±êÖ¾

KF_JOIN_MISSION_POS = {
	[KF_CampOne_ID] = {1582, 3792},
	[KF_CampTwo_ID] = {1905, 3288},
}

KF_ITEM_LINGPAI = {
	[KF_CampOne_ID] = {2, 1, 30478, "Tèng Qu©n TruyÒn LÖnh Kú"},
	[KF_CampTwo_ID] = {2, 1, 30479, "Liªu Qu©n TruyÒn LÖnh Kú"},	
}

KF_PLAYER_DEATH_SCRIPT = "\\script\\missions\\kuafu_battle\\kf_player_death.lua";

KF_ZHENQI_INC = 10; --»ý·ÖÃ¿15Ãë

--==============³£Á¿£ºÕ½³¡µÄ×´Ì¬===================
KF_MS_STATE_PEACE = 0;				--µÈ´ýÈËÊý½×¶Î
KF_MS_STATE_READY = 1;				--×¼±¸×´Ì¬£¬ÈËÊýÆëµÈ´ý¿ªÕ½½×¶Î
KF_MS_STATE_FIGHT = 2;				--¿ªÕ½×´Ì¬
KF_MS_STATE_COMPLETE = 3;		--Õ½Õù½áÊø×´Ì¬

--==============¹«ÓÃmissionV±äÁ¿===================
KF_MV_BATTLE_LOAD = 1;   --ÊÇ·ñÒÑ¾­¼ÓÔØ¿ªÆô
KF_MV_BATTLE_STATE = 2;  --¼ÇÂ¼Õ½³¡µÄ×´Ì¬
KF_MV_BATTLE_MAP_ID = 3;        --±¾³¡Õ½³¡µÄMAPID
KF_MV_BATTLE_MAP_INDEX = 4;    --±¾³¡Õ½³¡µÄMAPË÷Òý
KF_MV_BATTLE_TIMER_LOOP = 5;		--¼ÆÊýtimer´ÎÊý
KF_MV_BATTLE_GAME_FRAMETIME = 6; --µ±Ç°ÓÎÏ·Ö¡Êý
KF_MV_BATTLE_SONG_SCORE = 7; --ËÎ¾ü»ý·ÖÊý
KF_MV_BATTLE_LIAO_SCORE = 8; --ÁÉ¾ü»ý·ÖÊý
KF_MV_BATTLE_WINNER = 9; --»ñÊ¤Õß(0,1,2)
KF_MV_BATTLE_FLAG_JM = 10; --ÕóÆì0ÖÐÁ¢£¬1ËÎ£¬2ÁÉ
KF_MV_BATTLE_FLAG_MM = 11; --ÕóÆì0ÖÐÁ¢£¬1ËÎ£¬2ÁÉ
KF_MV_BATTLE_FLAG_SM = 12;	--ÕóÆì0ÖÐÁ¢£¬1ËÎ£¬2ÁÉ
KF_MV_BATTLE_FLAG_SI = 13;	--ÕóÆì0ÖÐÁ¢£¬1ËÎ£¬2ÁÉ
KF_MV_BATTLE_FLAG_DA = 14;	--ÕóÆì0ÖÐÁ¢£¬1ËÎ£¬2ÁÉ
KF_MV_BATTLE_SONG_ACTIVITY = 15; --ËÎÀÛ¼Æ»îÔ¾¶È
KF_MV_BATTLE_LIAO_ACTIVITY = 16; --ÁÉÀÛ¼Æ»îÔ¾¶È
KF_MV_BATTLE_DUWEI_TAG_SONG = 17; --0ÎªÎ´ÅÉÇ²£¬1ÒÑÅÉÇ²£¬2ÒÑËÀÍö
KF_MV_BATTLE_DUWEI_DEATHTIME_SONG = 18; --¶¼Î¾ËÀÍöÊ±¼ä
KF_MV_BATTLE_XIANFENG_TAG_SONG = 19; --0ÎªÎ´ÅÉÇ²£¬1ÒÑÅÉÇ²£¬2ÒÑËÀÍö
KF_MV_BATTLE_XIANFENG_DEATHTIME_SONG = 20; --ÏÈ·æËÀÍöÊ±¼ä
KF_MV_BATTLE_DUWEI_TAG_LIAO = 21; --0ÎªÎ´ÅÉÇ²£¬1ÒÑÅÉÇ²£¬2ÒÑËÀÍö
KF_MV_BATTLE_DUWEI_DEATHTIME_LIAO = 22; --¶¼Î¾ËÀÍöÊ±¼ä
KF_MV_BATTLE_XIANFENG_TAG_LIAO = 23; --0ÎªÎ´ÅÉÇ²£¬1ÒÑÅÉÇ²£¬2ÒÑËÀÍö
KF_MV_BATTLE_XIANFENG_DEATHTIME_LIAO = 24; --ÏÈ·æËÀÍöÊ±¼ä
KF_MV_BATTLE_JIANGJUN_TAG = 25; --ÊÇ·ñË¢¹ý½«¾üÁË
KF_MV_BATTLE_IS_OPEN_SUCC = 26; --ÊÇ·ñ¿ªÆô³É¹¦±êÖ¾
KF_MV_BATTLE_TEMP_SAFE_POS_INDEX_SONG = 27; --ËÎÁÙÊ±±Ó»¤µã
KF_MV_BATTLE_TEMP_SAFE_POS_INDEX_LIAO = 28; --ÁÉÁÙÊ±±Ó»¤µã

KF_SCORE_MAX = 30; --»ý·ÖÉÏÏÞÖµ
KF_JIANGJUN_SCORE = 31; --Ê²Ã´Ê±ºò½«¾ü³öÏÖ
KF_SCORE_JIANGJUN = 32; --½«¾ü»ý·ÖÖµ
--===============missionÊ±¼ä¿ØÖÆ===================
KF_FRAME_PER_SECOND = 18;
KF_FRAME_PER_MIN = 60*KF_FRAME_PER_SECOND;

KF_PEACE_TIME = 5*KF_FRAME_PER_SECOND;--µÈ´ýÍæ¼ÒÈËÊý¿ªÆô¼ÆÊ±Æ÷µÄ±¨Ê±¼ä¸ô£¬5Ãë
KF_PEACE_TIMER_LOOP = (5*KF_FRAME_PER_MIN/KF_PEACE_TIME)-1;--µÈ´ýÍæ¼ÒÈËÊý¿ªÆô¼ÆÊ±Æ÷±¨Ê±´ÎÊý£¨5·ÖÖÓ£©
KF_READY_TIME = 5*KF_FRAME_PER_SECOND;--¿ªÕ½×¼±¸Ê±¼ä¼ÆÊ±Æ÷µÄ±¨Ê±¼ä¸ô£¬5Ãë
KF_READY_TIMER_LOOP = (1*KF_FRAME_PER_MIN/(6*KF_READY_TIME))-1;--¿ªÕ½×¼±¸Ê±¼ä¼ÆÊ±Æ÷±¨Ê±´ÎÊý£¨10s£©
KF_FIGHT_TIME = 3*KF_FRAME_PER_SECOND;			--´òÕÌÊ±¼ä¼ÆÊ±Æ÷µÄ±¨Ê±¼ä¸ô£¬3Ãë
KF_FIGHT_TIMER_LOOP = (90*KF_FRAME_PER_MIN/KF_FIGHT_TIME)-1;	--´òÕÌÊ±¼ä¼ÆÊ±Æ÷µÄ±¨Ê±´ÎÊý£¨90·ÖÖÓ£©
KF_WAITOUT_TIME = 15*KF_FRAME_PER_SECOND;		--µÈ´ý½áÊøÊ±¼ä¼ÆÊ±Æ÷µÄ±¨Ê±¼ä¸ô
KF_WAITOUT_TIMER_LOOP = (0.5*KF_FRAME_PER_MIN/KF_WAITOUT_TIME)-1; --µÈ´ý½áÊøÊ±¼ä¼ÆÊ±Æ÷µÄ±¨Ê±´ÎÊý£¨°ë·ÖÖÓ£©


--==============Npc±í===================
KF_TALK_NPC = {
	{"KFZC_songqianxian", "TiÒn tuyÕn qu©n Tèng", 1623, 3734, "\\script\\missions\\kuafu_battle\\npc\\ms_song_qxsb.lua"},
	{"KFZC_songqianxian", "TiÒn tuyÕn qu©n Tèng", 1630, 3813, "\\script\\missions\\kuafu_battle\\npc\\ms_song_qxsb.lua"},
	{"KFZC_liaoqianxian", "TiÒn tuyÕn qu©n Liªu", 1864, 3331, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_qxsb.lua"},
	{"KFZC_liaoqianxian", "TiÒn tuyÕn qu©n Liªu", 1853, 3261, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_qxsb.lua"},
	{"KFZC_songyuansuan", "Tèng Nguyªn So¸i", 1572, 3800, "\\script\\missions\\kuafu_battle\\npc\\ms_song_ys.lua"},
	{"KFZC_shenyou", "ThÇn Du Ch©n Nh©n", 1540, 3772, "\\script\\missions\\kuafu_battle\\npc\\ms_song_syzr.lua"},
	{"KFZC_songjunxu", "Tèng Qu©n Nhu Quan", 1592, 3827, "\\script\\missions\\kuafu_battle\\npc\\ms_song_jxg.lua"},
	{"KFZC_songshangren", "Tèng Th­¬ng Nh©n", 1532, 3756, "\\script\\missions\\kuafu_battle\\npc\\ms_song_sr.lua"},
	{"KFZC_songshangbing", "Tèng Th­¬ng Binh", 1644, 3765, "\\script\\missions\\kuafu_battle\\npc\\ms_song_sb.lua"},
	{"KFZC_liaoyuansuan", "Liªu Nguyªn So¸i", 1912, 3282, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_ys.lua"},
	{"KFZC_jinglun", "Kim Lu©n Ph¸p V­¬ng", 1885, 3250, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_jlfw.lua"},
	{"KFZC_liaojunxu", "Liªu Qu©n Nhu Quan", 1961, 3314, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_jxg.lua"},
	{"KFZC_liaoshangren", "Liªu Th­¬ng Nh©n", 1953, 3306, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_sr.lua"},
	{"KFZC_liaoshangbing", "Liªu Th­¬ng Binh", 1837, 3295, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_sb.lua"},
	
	
}

--°Ë¸ö·ðµÄÎ»ÖÃ
KF_tPositionFo = {
	{"Nga Mi tiÓu s­ tû 1", "Nga Mi tiÓu s­ tû ", 1582, 3711, KF_CampOne_Type},
	{"Nga Mi tiÓu s­ tû 2", "Nga Mi tiÓu s­ tû ", 1592, 3711, KF_CampOne_Type},
	{"Nga Mi tiÓu s­ tû 3", "Nga Mi tiÓu s­ tû ", 1588, 3725, KF_CampOne_Type},
	{"Nga Mi tiÓu s­ tû 4", "Nga Mi tiÓu s­ tû ", 1573, 3718, KF_CampOne_Type},
	
	{"Nga Mi tiÓu s­ tû 1", "Nga Mi tiÓu s­ tû ", 1901, 3356, KF_CampTwo_Type},
	{"Nga Mi tiÓu s­ tû 2", "Nga Mi tiÓu s­ tû ", 1910, 3350, KF_CampTwo_Type},
	{"Nga Mi tiÓu s­ tû 3", "Nga Mi tiÓu s­ tû ", 1919, 3360, KF_CampTwo_Type},
	{"Nga Mi tiÓu s­ tû 4", "Nga Mi tiÓu s­ tû ", 1907, 3371, KF_CampTwo_Type},
}

KF_MONSTER_NPC = {
	{"KFZC_yeguai1", "Thô Qu¸i", 1682, 3316},
	{"KFZC_yeguai2", "Th¹ch Nh©n", 1733, 3215},
	{"KFZC_yeguai3", "Trïng Qu¸i", 1890, 3446},
	{"KFZC_yeguai4", "Th­¬ng t­îng", 1825, 3715},
	{"KFZC_yeguai5", "KiÕm t­îng", 1760, 3731},
	{"KFZC_yeguai6", "¢m Hån", 1553, 3606},
	{"KFZC_yeguai7", "Cung t­îng", 1663, 3543},
	{"KFZC_yeguai8", "O¸n Quû", 1810, 3555},
	{"KFZC_boss1", "Cæ D­¬ng Thó", 1525, 3482},
	{"KFZC_boss2", "TrÊn Mé Thó", 1902, 3547},
}

KF_FLAG_NPC = {
	{"KFZC_jingmen", "C¶nh M«n TrËn Kú", 1606, 3309, "\\script\\missions\\kuafu_battle\\npc\\zhenqi_jinmen.lua"},
	{"KFZC_miemen", "DiÖt M«n TrËn Kú", 1827, 3370, "\\script\\missions\\kuafu_battle\\npc\\zhenqi_miemen.lua"},
	{"KFZC_shengmen", "Sinh M«n TrËn Kú", 1888, 3754, "\\script\\missions\\kuafu_battle\\npc\\zhenqi_shengmen.lua"},
	{"KFZC_simen", "Tö M«n TrËn Kú", 1656, 3676, "\\script\\missions\\kuafu_battle\\npc\\zhenqi_simen.lua"},
	{"KFZC_dazhenqi", "§¹i TrËn Kú", 1736, 3537, "\\script\\missions\\kuafu_battle\\npc\\zhenqi_da.lua"},
}

KF_FLAG_NPCLIST = {
		[1] = {
			[KF_ALL_ID] = {"KFZC_jingmen", "C¶nh M«n TrËn Kú", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_jinmen.lua", KF_MV_BATTLE_FLAG_JM},
			[KF_CampOne_ID] = {"KFZC_songjingmen", "Tèng C¶nh M«n TrËn Kú", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_jinmen.lua", KF_MV_BATTLE_FLAG_JM},
			[KF_CampTwo_ID] = {"KFZC_liaojingmen", "Liªu C¶nh M«n TrËn Kú", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_jinmen.lua", KF_MV_BATTLE_FLAG_JM},
		},
		[2] = {
			[KF_ALL_ID] = {"KFZC_miemen", "DiÖt M«n TrËn Kú", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_miemen.lua", KF_MV_BATTLE_FLAG_MM},
			[KF_CampOne_ID] = {"KFZC_songmiemen", "Tèng DiÖt M«n TrËn Kú", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_miemen.lua", KF_MV_BATTLE_FLAG_MM},
			[KF_CampTwo_ID] = {"KFZC_liaomiemen", "Liªu DiÖt M«n TrËn Kú", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_miemen.lua", KF_MV_BATTLE_FLAG_MM},
		},
		[3] = {
			[KF_ALL_ID] = {"KFZC_shengmen", "Sinh M«n TrËn Kú", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_shengmen.lua", KF_MV_BATTLE_FLAG_SM},
			[KF_CampOne_ID] = {"KFZC_songshengmen", "Tèng Sinh M«n TrËn Kú", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_shengmen.lua", KF_MV_BATTLE_FLAG_SM},
			[KF_CampTwo_ID] = {"KFZC_liaoshengmen", "Liªu Sinh M«n TrËn Kú", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_shengmen.lua", KF_MV_BATTLE_FLAG_SM},
		},
		[4] = {
			[KF_ALL_ID] = {"KFZC_simen", "Tö M«n TrËn Kú", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_simen.lua", KF_MV_BATTLE_FLAG_SI},
			[KF_CampOne_ID] = {"KFZC_songsimen", "Tèng Tö M«n TrËn Kú", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_simen.lua", KF_MV_BATTLE_FLAG_SI},
			[KF_CampTwo_ID] = {"KFZC_liaosimen", "Liªu Tö M«n TrËn Kú", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_simen.lua", KF_MV_BATTLE_FLAG_SI},
		},
		[5] = {
			[KF_ALL_ID] = {"KFZC_dazhenqi", "§¹i TrËn Kú", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_da.lua", KF_MV_BATTLE_FLAG_DA},
			[KF_CampOne_ID] = {"KFZC_songdazhenqi", "Tèng §¹i TrËn Kú", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_da.lua", KF_MV_BATTLE_FLAG_DA},
			[KF_CampTwo_ID] = {"KFZC_liaodazhenqi", "Liªu §¹i TrËn Kú", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_da.lua", KF_MV_BATTLE_FLAG_DA},
		},
	}

KF_SHIBINF_NPC = {
	[1] = {
		[KF_CampOne_ID] = {
			{"KFZC_songshibing","Tèng C¶nh M«n SÜ Binh",1602, 3313, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","Tèng C¶nh M«n SÜ Binh",1610, 3302, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","Tèng C¶nh M«n SÜ Binh",1601, 3305, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","Tèng C¶nh M«n SÜ Binh",1604, 3301, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
		},
		[KF_CampTwo_ID] = {
			{"KFZC_liaoshibing","Liªu C¶nh M«n SÜ Binh",1602, 3313, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Liªu C¶nh M«n SÜ Binh",1610, 3302, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Liªu C¶nh M«n SÜ Binh",1601, 3305, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Liªu C¶nh M«n SÜ Binh",1604, 3301, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
		},
	},
	[2] = {
		[KF_CampOne_ID] = {
			{"KFZC_songshibing","Tèng DiÖt M«n SÜ Binh",1823, 3364, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","Tèng DiÖt M«n SÜ Binh",1828, 3362, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","Tèng DiÖt M«n SÜ Binh",1831, 3368, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","Tèng DiÖt M«n SÜ Binh",1830, 3375, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
		},
		[KF_CampTwo_ID] = {
			{"KFZC_liaoshibing","Liªu DiÖt M«n SÜ Binh",1823, 3364, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Liªu DiÖt M«n SÜ Binh",1828, 3362, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Liªu DiÖt M«n SÜ Binh",1831, 3368, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Liªu DiÖt M«n SÜ Binh",1830, 3375, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
		},
	},
	[3] = {
		[KF_CampOne_ID] = {
			{"KFZC_songshibing","Tèng Sinh M«n SÜ Binh",1883, 3757, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","Tèng Sinh M«n SÜ Binh",1887, 3761, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","Tèng Sinh M«n SÜ Binh",1892, 3754, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","Tèng Sinh M«n SÜ Binh",1890, 3747, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
		},
		[KF_CampTwo_ID] = {
			{"KFZC_liaoshibing","Liªu Sinh M«n SÜ Binh",1883, 3757, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Liªu Sinh M«n SÜ Binh",1887, 3761, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Liªu Sinh M«n SÜ Binh",1892, 3754, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Liªu Sinh M«n SÜ Binh",1890, 3747, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
		},
	},
	[4] = {
		[KF_CampOne_ID] = {
			{"KFZC_songshibing","Tèng Tö M«n SÜ Binh",1659, 3680, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","Tèng Tö M«n SÜ Binh",1654, 3682, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","Tèng Tö M«n SÜ Binh",1650, 3679, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","Tèng Tö M«n SÜ Binh",1650, 3670, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
		},
		[KF_CampTwo_ID] = {
			{"KFZC_liaoshibing","Liªu Tö M«n SÜ Binh",1659, 3680, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Liªu Tö M«n SÜ Binh",1654, 3682, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Liªu Tö M«n SÜ Binh",1650, 3679, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Liªu Tö M«n SÜ Binh",1650, 3670, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
		},
	},
	[5] = {
		[KF_CampOne_ID] = {
			{"KFZC_songshibing","Tèng §¹i TrËn Kú SÜ Binh",1731, 3531, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","Tèng §¹i TrËn Kú SÜ Binh",1739, 3530, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","Tèng §¹i TrËn Kú SÜ Binh",1738, 3543, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","Tèng §¹i TrËn Kú SÜ Binh",1732, 3542, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
		},
		[KF_CampTwo_ID] = {
			{"KFZC_liaoshibing","Liªu §¹i TrËn Kú SÜ Binh",1731, 3531, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Liªu §¹i TrËn Kú SÜ Binh",1739, 3530, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Liªu §¹i TrËn Kú SÜ Binh",1738, 3543, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Liªu §¹i TrËn Kú SÜ Binh",1732, 3542, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
		},
	},
	[6] = {
		[KF_CampOne_ID] = {
			{"KFZC_songshibing","Tèng T­íng Qu©n VÖ Binh",1659, 3680, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","Tèng T­íng Qu©n VÖ Binh",1654, 3682, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","Tèng T­íng Qu©n VÖ Binh",1650, 3679, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","Tèng T­íng Qu©n VÖ Binh",1650, 3670, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
		},
		[KF_CampTwo_ID] = {
			{"KFZC_liaoshibing","Liªu T­íng Qu©n VÖ Binh",1823, 3364, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Liªu T­íng Qu©n VÖ Binh",1828, 3362, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Liªu T­íng Qu©n VÖ Binh",1831, 3368, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Liªu T­íng Qu©n VÖ Binh",1830, 3375, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
		},
	},
}

--»ý·ÖÖµ
KF_SCORE_PLAYER = 1;
KF_SCORE_SHIBING = 1;
KF_SCORE_DUWEI = 20;
KF_SCORE_XIANFENG = 40;
KF_SCORE_ZHENQI = 10;
KF_SCORE_XIAOYG = 2;
KF_SCORE_DAYG = 4;

--»îÔ¾¶È
KF_ACTIVITY_PLAYER = 3;
KF_ACTIVITY_SHIBING = 2;
KF_ACTIVITY_DUWEI = 10;
KF_ACTIVITY_XIANFENG = 20;
KF_ACTIVITY_JIANGJUN = 40;
KF_ACTIVITY_XIAOYG = 2;
KF_ACTIVITY_DAYG = 6;
KF_ACTIVITY_ZHENQI = 10;
KF_ACTIVITY_PLAYERDEATH = 1;

--½«¾üÒÔÉÏÍ·ÏÎ
KF_TITIL_JIANGJUN = 5;

--ÅÉÇ²ÏÈ·æµÄCDÊ±¼ä
KF_ORDER_XF_CD = 20 * 60; --10min
KF_ORDER_DW_CD = 10 * 60; --20min

KF_ORDER_POS = {
	[1] = {1609, 3312, "C¶nh M«n TrËn Kú"},
	[2] = {1823, 3373, "DiÖt M«n TrËn Kú"},
	[3] = {1885, 3749, "Sinh M«n TrËn Kú"},
	[4] = {1660, 3671, "Tö M«n TrËn Kú"},
	[5] = {1735, 3543, "§¹i TrËn Kú"},
}


--Ñ©ºÞBUFF
KF_XUEHEN = {--²î¾àÊý ¹¥»÷Ìá¸ßÊýÖµ ÉúÃüÉÏÏÞÌá¸ßÊýÖµ ÃâÒß¸ºÃæ´ÎÊý
	{21,150,300,15,format("TuyÕt hËn cÊp %d", 11),"C«ng kÝch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dÞch tr¹ng th¸i phô %d lÇn"},
	{19,150,300,14,format("TuyÕt hËn cÊp %d", 10),"C«ng kÝch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dÞch tr¹ng th¸i phô %d lÇn"},
	{17,135,270,14,format("TuyÕt hËn cÊp %d", 9),"C«ng kÝch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dÞch tr¹ng th¸i phô %d lÇn"},
	{15,120,240,13,format("TuyÕt hËn cÊp %d", 8),"C«ng kÝch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dÞch tr¹ng th¸i phô %d lÇn"},
	{13,105,210,13,format("TuyÕt hËn cÊp %d", 7),"C«ng kÝch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dÞch tr¹ng th¸i phô %d lÇn"},
	{11,90 ,180,12,format("TuyÕt hËn cÊp %d", 6),"C«ng kÝch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dÞch tr¹ng th¸i phô %d lÇn"},
	{9 ,75 ,150,12,format("TuyÕt hËn cÊp %d", 5),"C«ng kÝch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dÞch tr¹ng th¸i phô %d lÇn"},
	{7 ,60 ,120,10,format("TuyÕt hËn cÊp %d", 4),"C«ng kÝch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dÞch tr¹ng th¸i phô %d lÇn"},
	{5 ,45 ,90 , 5,format("TuyÕt hËn cÊp %d", 3),"C«ng kÝch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dÞch tr¹ng th¸i phô %d lÇn"},
	{3 ,30 ,60 , 3,format("TuyÕt hËn cÊp %d", 2),"C«ng kÝch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dÞch tr¹ng th¸i phô %d lÇn"},
	{1 ,15 ,30 , 1,format("TuyÕt hËn cÊp %d", 1),"C«ng kÝch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dÞch tr¹ng th¸i phô %d lÇn"},
};

KF_TSTATEMAGICATTR = {
		[1] = {
			{"state_p_attack_percent_add", 20, 5 * 60 * 18, 20101, 2, "Ngo¹i c«ng c«ng kÝch t¨ng%d%%", "BUFF1"},
			{"state_m_attack_percent_add", 20, 5 * 60 * 18, 20102, 2, "Néi c«ng c«ng kÝch t¨ng%d%%", "BUFF1"},
		},
		[2] = {
			{"state_life_max_percent_add", 50, 5 * 60 * 18, 20103, 3, "Sinh lùc t¨ng %d%%", "BUFF2"},
		},
		[3] = {
			{"state_physical_parmor_poi_add", 10, 5 * 60 * 18, 20104, 4, "Ngo¹i phßng t¨ng %d%%", "BUFF3"},
			{"state_magic_parmor_poi_add", 10, 5 * 60 * 18, 20105, 4, "Néi  phßng t¨ng %d%%", "BUFF3"},
		},
		[4] = {
			{"state_buff_resist", 5, 5 * 60 * 18, 20106, 5, "MiÔn dÞch tr¹ng th¸i phô %d lÇn", "BUFF4"},
		},
		[5] = {
			{"state_p_attack_percent_add", 40, 3 * 60 * 18, 20101, 6, "Ngo¹i c«ng c«ng kÝch t¨ng%d%%", "BUFF5"},
			{"state_m_attack_percent_add", 40, 3 * 60 * 18, 20102, 6, "Néi c«ng c«ng kÝch t¨ng%d%%", "BUFF5"},
			{"state_life_max_percent_add", 100, 3 * 60 * 18, 20103, 6, "Sinh lùc t¨ng %d%%", "BUFF5"},
			{"state_physical_parmor_poi_add", 20, 3 * 60 * 18, 20104, 6, "Ngo¹i phßng t¨ng %d%%", "BUFF5"},
			{"state_magic_parmor_poi_add", 20, 3 * 60 * 18, 20105, 6, "Néi  phßng t¨ng %d%%", "BUFF5"},
			{"state_buff_resist", 5, 3 * 60 * 18, 20106, 6, "MiÔn dÞch tr¹ng th¸i phô %d lÇn", "BUFF5"},
		},
}

---½±Àø-----------------------------------------
KF_ACTIVITY_LEVEL = {0, 1, 10, 40, 200};

KF_BATTLE_AWARD = {
		--Î´¿ªÆô
		[1] = {
			[1] = {KF_ACTIVITY_LEVEL[1], {300000, 0}, 200, {1, 1}},
			[2] = {KF_ACTIVITY_LEVEL[2], {300000, 0}, 300, {1, 1}},
			[3] = {KF_ACTIVITY_LEVEL[3], {300000, 0}, 800, {1, 1}},
			[4] = {KF_ACTIVITY_LEVEL[4], {300000, 0}, 1200, {1, 1}},
			[5] = {KF_ACTIVITY_LEVEL[5], {300000, 0}, 1600, {1, 1}},
		},
		--Ê¤Àû
		[2] = {
			[1] = {KF_ACTIVITY_LEVEL[1], {300000, 0}, 200, {1, 1}},
			[2] = {KF_ACTIVITY_LEVEL[2], {16000000, 10000}, 300, {2, 1}},
			[3] = {KF_ACTIVITY_LEVEL[3], {16000000, 10000}, 800, {2, 1}},
			[4] = {KF_ACTIVITY_LEVEL[4], {16000000, 10000}, 1200, {2, 1}},
			[5] = {KF_ACTIVITY_LEVEL[5], {36000000, 0}, 1600, {2, 1}},
		},
		--Ê§°Ü
		[3] = {
			[1] = {KF_ACTIVITY_LEVEL[1], {300000, 0}, 200, {1, 1}},
			[2] = {KF_ACTIVITY_LEVEL[2], {8000000, 10000}, 300, {1, 1}},
			[3] = {KF_ACTIVITY_LEVEL[3], {8000000, 10000}, 800, {1, 1}},
			[4] = {KF_ACTIVITY_LEVEL[4], {8000000, 10000}, 1200, {1, 1}},
			[5] = {KF_ACTIVITY_LEVEL[5], {20000000, 0}, 1600, {1, 1}},
		},
		--Æ½¾Ö
		[4] = {
			[1] = {KF_ACTIVITY_LEVEL[1], {300000, 0}, 200, {1, 1}},
			[2] = {KF_ACTIVITY_LEVEL[2], {8000000, 10000}, 300, {1, 1}},
			[3] = {KF_ACTIVITY_LEVEL[3], {8000000, 10000}, 800, {1, 1}},
			[4] = {KF_ACTIVITY_LEVEL[4], {8000000, 10000}, 1200, {1, 1}},
			[5] = {KF_ACTIVITY_LEVEL[5], {20000000, 0}, 1600, {1, 1}},
		},
}

KF_PARK_AWARD_PT = {
	{3, 100, 30000, 1},
	{3, 40, 60000, 1},
	{3, 10, 100000, 1},
	{27, 150, 300, 1},
	{27, 100, 600, 1},
	{27, 100, 1000, 1},
	{34, 75, 60, 1},
	{35, 25, 60, 1},
	{1, 150, "VÐ TiÕu Y §ång", {2, 1, 30493, 1}, 0},
	{1, 100, "VÐ TiÕu Y §ång", {2, 1, 30493, 2}, 0},
	{1, 50, "VÐ TiÕu Y §ång", {2, 1, 30493, 4}, 0},
	{1, 100, "ThiÕt Tinh cÊp 1", {2, 1, 30533, 4}, 0},
}

KF_PARK_AWARD_PT_ADD = {
	{1, "Hu©n ch­¬ng anh hïng", {2, 1, 30499, 1}, 0},
	{28, 300, 1},--ÕæÆø
}

KF_PARK_AWARD_GJ = {
	{3, 50, 100000, 1},
	{3, 20, 150000, 1},
	{3, 10, 300000, 1},	
	{27, 100, 600, 1},
	{27, 100, 1200, 1},
	{27, 100, 1500, 1},
	{34, 40, 60, 1},
	{35, 10, 60, 1},
	{1, 200, "VÐ TiÕu Y §ång", {2, 1, 30493, 2}, 0},
	{1, 100, "VÐ TiÕu Y §ång", {2, 1, 30493, 4}, 0},
	{1, 50, "VÐ TiÕu Y B¹c", {2, 1, 30492, 1}, 0},
	
	{1, 120, "ThiÕt Tinh cÊp 1", {2, 1, 30533, 4}, 0},
	{1, 100, "ThiÕt Tinh cÊp 2", {2, 1, 30534, 4}, 0},
}

KF_PARK_AWARD_GJ_ADD = {
	{1, "Hu©n ch­¬ng anh hïng", {2, 1, 30499, 2}, 0},
	{28, 400, 1},--ÕæÆø
}

KF_PARK_AWARD_JY = {
	{3, 100, 150000, 1},
	{3, 100, 300000, 1},
	{3, 10, 600000, 1},	
	{27, 100, 1500, 1},
	{27, 100, 2000, 1},
	{27, 100, 2500, 1},
	{35, 75, 60, 1},
	{36, 25, 60, 1},
	{1, 100, "VÐ TiÕu Y B¹c", {2, 1, 30493, 1}, 0},
	{1, 100, "VÐ TiÕu Y B¹c", {2, 1, 30493, 2}, 0},
	{1, 50, "VÐ TiÕu Y B¹c", {2, 1, 30492, 4}, 0},
	
	{1, 50, "ThiÕt Tinh cÊp 1", {2, 1, 30533, 4}, 0},
	{1, 50, "ThiÕt Tinh cÊp 2", {2, 1, 30534, 4}, 0},
	{1, 40, "ThiÕt Tinh cÊp 3", {2, 1, 30535, 4}, 0},
}

KF_PARK_AWARD_JY_ADD = {
	{1, "Hu©n ch­¬ng anh hïng", {2, 1, 30499, 6}, 0},
	{28, 500, 1},--ÕæÆø
}

KF_NB_WEAPON_TABLE = {
	--Á÷ÅÉ={ÎäÆ÷}
	[2] = {0,	3,	30052, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma §ao"},
	[4] = {0,	0,	30053, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma Tr­îng"},
	[3] = {0,	8,	30054, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma Thñ"},
	[6] = {0,	1,	30055, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma Ch©m"},
	[8] = {0,	2,	30056, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma KiÕm"},
	[9] = {0,	10,	30057, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma CÇm"},
	[11] = {0,	0,	30058, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma Thñ"},
	[12] = {0,	5,	30059, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma C«n"},
	[14] = {0,	2,	30060, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma KiÕm"},
	[15] = {0,	9,	30061, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma Bót"},
	[17] = {0,	6,	30062, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma Th­¬ng"},
	[18] = {0,	4,	30063, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma Cung"},
	[20] = {0,	7,	30064, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma NhÉn"},
	[21] = {0,	11,	30065, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma Tr¶o"},
	[23] = {0,	2,	30066, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma KiÕm"},
	[25] = {0,	3,	30067, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma §ao"},
	[26] = {0,	9,	30068, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma Bót"},
	[27] = {0,	11,	30069, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma Tr¶o"},
	[29] = {0,	13,	30070, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma PhiÕn"},
	[30] = {0,	12,	30071, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch©n Ma Tiªu"},
}

KF_WEAPON_EXIST_TIME = 10 * 60;

--ÁÙÊ±´«ËÍµã
KF_TEMP_SAFE_POS = {
	[KF_CampOne_ID] = {
		{1671, 3334},
		{1564, 3651},
		{1736, 3626},
	},
	[KF_CampTwo_ID] = {
		{1881, 3676},
		{1895, 3436},
		{1740, 3440},
	},	
}

--³öÏÖÁÙÊ±°²È«´«ËÍÌõ¼þ
KF_TEMP_SAFE_POS_CONDITION = 100;