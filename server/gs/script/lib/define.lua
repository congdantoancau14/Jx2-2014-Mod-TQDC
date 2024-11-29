Include("\\script\\tmp_task_id_def.lua")

--==================新任务系统新加 2740~~2820===============
TASK_GT_TASK_ID_START = 2740;
TASK_GT_TASK_ID_END = 2779;
TASK_GT_TASK_FINISH_START = 2780;
TASK_GT_TASK_FINISH_END = 2819;
TASK_GT_TASK_CANCEL_TIME = 2820; --放弃任务的时间

--===================地玄宫用到的任务变量===================
TASKID_DXG_SCORE = 3142
TASKID_DIXUANGONG_DAILY_BOSS1 = 3143
TASKID_DIXUANGONG_DAILY_BOSS2 = 3144
TASKID_DIXUANGONG_DAILY_BOSS3 = 3145

------------------------------------------------------------
ITEM_DXG_TONGTIANLING = {2, 1, 30409, "Th玭g Thi猲 L謓h"};  

--3v3==========================================================
TASKID_3V3_WIN_ROUND_DAILY		= 3146;		-- 每日胜场, 领奖时清空
TASKID_3V3_TOTAL_ROUND_DAILY	= 3147;		-- 每日总场
TASKID_3V3_TOTAL_ROUND			= 3148;		-- 总场
TASKID_3V3_BATTLE_SCORE			= 3149;		-- Rank分
TASKID_3V3_KILL_TOTAL			= 3150;		-- 总人头
TASKID_3V3_DEAD_TOTAL			= 3151;		-- 总死亡次数
TASKID_3V3_VIC_RATE				= 3152;		-- 胜率 = 总胜场 / 总场
TASKID_3V3_SCORE_DAILY			= 3153;		-- 每日积分
TASKID_3V3_SCORE_TOTAL			= 3154;		-- 赛季积分(GameDataDef.h define too)
TASKID_3V3_SCORE_LAST			= 3155;		-- 上赛季积分
TASKID_3V3_MAX_SCORE_HISTORY	= 3156;		-- 历史最高积分
TASKID_3V3_AWARD_DAILY_DATE		= 3157;		-- 每日奖励日期
TASKID_3V3_WIN_ROUND_MATCH		= 3158;		-- 赛季总胜场
TASKID_3V3_WIN_ROUND_TOTAL		= 3159;		-- 总胜场(GameDataDef.h define too)
TASKID_3V3_TOTAL_ROUND_MATCH	= 3160;		-- 赛季总场(GameDataDef.h define too)
TASKID_3V3_KILL_DAILY			= 3161;		-- 每日人头
TASKID_3V3_KILL_MATCH           = 3162;		-- 赛季人头
TASKID_3V3_DEAD_DAILY           = 3163;		-- 每日死亡
TASKID_3V3_DEAD_MATCH           = 3164;		-- 赛季死亡
TASKID_3V3_BATTLE_POWER			= 3165;		-- 战斗力 = rank分数*1.5+胜率*3000*(总场/(总场+10))+min(总胜场*1, 3000)
TASKID_3V3_ESCAPE_DAILY			= 3166;		-- 每日逃跑
TASKID_3V3_ESCAPE_MATCH			= 3167;		-- 赛季逃跑次数
TASKID_3V3_ESCAPE_TOTAL			= 3168;		-- 总逃跑
TASKID_3V3_WEEKLY_AWARD_DATE	= 3169;		-- 周奖励日期
TASKID_3V3_FIRST_DAY_BUCHANG	= 3170;		-- 补偿
TASKID_3V3_MATCH_ROUND			= 3171;		-- 赛季标记
TASKID_3V3_WIN_AWARD_COUNT		= 3172;		-- 胜场奖励标记

TASKID_NEED_SYNC_REALM_DATA		= 3173; --任务变量跨服同步标记

TASKID_3V3_LOSE_ROUND_DAILY			= 3174;
TASKID_3V3_LOSE_ROUND_MATCH			= 3175;
TASKID_3V3_LOSE_ROUND_TOTAL			= 3176;
TASKID_3V3_MATCH_PERSONAL_AWARD_TIMES_TOTAL		= 3177;
TASKID_3V3_MATCH_PERSONAL_AWARD_TIMES_USED		= 3178;
TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_TOTAL	= 3179;
TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_USED		= 3180;
TASKID_3V3_MATCH_FIGHTTEAM_SCORE 				= 3181;

TEMP_TASKID_3V3_IS_DEAD			= TMP_TASK_3V3_IS_DEAD;
TEMP_TASKID_3V3_KILLED			= TMP_TASK_3V3_KILLED;

TASKID_3V3_WEEK_FIGHT_TIMES = 3182;	--本周 高两字节表示胜场，低2字节表示败场(GameDataDef.h define too)
TASKID_3V3_LASTWEEK_FIGHT_TIMES = 3183; --上周 高两字节表示胜场，低2字节表示败场(GameDataDef.h define too)

TASKID_LAST_MATCH_RANK = 3184;	--上赛季高两位跨服排名，低两位本服排名(GameDataDef.h define too)

TASKID_3V3_AWARD_TAG = 3185; --1字节表示是否领取上周奖励，2字节表示是否领取上赛季奖励（0不可领取，1可领取，2已领取）,3字节表示角色跨赛季流程,4字节表示角色跨赛季流程

TASKID_CUR_MATCH_RANK = 3186;	--本赛季高两位跨服排名，低两位本服排名(GameDataDef.h define too)

TASKID_3V3_EVERY_MATCH_EXP = 3187; --每场经验奖励
TASKID_3V3_EVERY_MATCH_YINJUAN = 3188; --每场银卷奖励

--===========================================================================
-- GlobalValue
-- !!!添加前注意冲突
-- !!!\sword2-design\策划设计设定\任务系统\剑网2_任务_任务记录表.xls
GV_MISSION_TEMP_BEGIN = 171;
GV_MISSION_TEMP_END = 180;

--帮会信息定义到任务变量上---------------
TASKID_TONG_INFO_TRANSLATION = 3200
TASKID_TONG_INFO_PLAYER_JOINTIME = 3201
-----------------------------------------

--太一塔---------------------------------
TASKID_TAIYI_ITEM								= 3205;--太一塔记录是否拥有某物品
TASKID_TAIYI_FOREST_CONSUME			= 3206;--太一塔.梵天林消费额度
TASKID_TAIYITA_TIME							= 3207;--太一塔走进trap点的时间点
TASKID_TAIYITA_NINGBINGJUE_FORBIDDEN = 3208; --太一塔是否禁用凝冰诀
TASKID_TAIYI_LATEST_WEEK				= 3209;--太一塔最近参加的周
TASKID_TAIYI_FOREST_JOIN_IN_TIME = 3210;--普通版.梵天林 最近一周已参加次数
TASKID_TAIYI_TOWER_CONSUME			= 3211;--太一塔.太一塔消费额度
TASKID_TAIYI_TOWER_JOIN_IN_TIME = 3212;--普通版.太一塔 最近一周已参加次数
TASKID_TAIYI_LAST_PASSED_STAGE	= 3213;--太一塔.最后一次通关的stageId
TASKID_TAIYI_SHOUTUI_PRIZE			= 3214;--太一首推奖励领取时间
TASKID_TY_NORMAL_ENTER_LIMIT		= 3215;		-- 太一普通
TASKID_TY_HERO_ENTER_LIMIT			= 3216;		-- 太一英雄
TASKID_FTL_NORMAL_ENTER_LIMIT		= 3217;		-- 梵天林普通
TASKID_FTL_HERO_ENTER_LIMIT			= 3218;		-- 梵天林英雄

--==================资料片比武大会新加=====================
TASKID_BIWU_BLOCK_ROUTE_OLD		= 3227; --屏蔽的流派
TASKID_BIWU_MATCH_RESULT	= 3228; --上一场比赛结果

TSK_SEASON_ZIGE_LAST = 3224;     --存上赛季的资格分数
TSK_SEASON_GET_AWARD = 3225;      --是否领取上赛季的奖励，存入当前为第几赛季
TSK_USE_JINGWU_BAG_TIME = 3226;		--使用比武大会精武包的次数

TASK_BIWU_WIN_10 = 3219; --记录前10场的胜利场次
TASK_BIWU_LOSE_10 = 3220; --记录前10场的失败场次
TASK_BIWU_GET_AWARD_10 = 3221; --记录是否领取了前10场的奖励
TASK_BIWU_DUIZHAN_JINGYAN = 3222; --对战经验 程序界面有用到
TASK_BIWU_GET_REALM_AWARD = 3223; --是否领取了全区服奖励
--TASKID_XOYO_GOLD = 2737; --逍遥币
--TASKID_XOYO_CONSUME = 2738; --逍遥币的消耗
--TASKID_BIWU_IS_REALM = 2739; --是否跨服

--活动模板，杀怪任务
TASKID_ACTIVITY_KILLNPC_ID = 3229

--世界BOSS使用
TASKID_WORLD_BOSS_USE	=	3231

----幸运百宝箱--------
TASKID_LUCKYBOX_LOTTERY = 3244 --第一字节表示当日剩余免费抽奖次数,第二字节表示一次抽奖结果(9-13)是否IB(14-16)，第三字节记录连续抽奖的剩余次数，第4字节记录天骄令使用次数

--跨服CD
TASKID_EXCHG_SVR_TAG = 3251;
TASKID_EXCHG_SVR_TIME = 3252;

--雷劫兽
TASKID_LEIJIESHOU_TIME = 3268;

--越南收费激活武尊
TASKID_IB_ACT_WUZUN_TASK = 3269;
TASKID_IB_ACT_WUZUN_TIME = 3270;

--记录角色拥有的天骄令数目
TASKID_PLAYER_TJL_COUNT = 3273;

--声望系统
TASKID_POP_BEGIN	= 3324;
TASKID_POP_END		= 3336;

-- 野外PVP ---------------------------------------------------
TASK_FIELD_PVP_CAMP = 3286; --玩家势力阵营 程序界面有用到
TASK_FIELD_PVP_GXD = 3287; --玩家贡献度 程序界面有用到
TASK_FIELD_PVP_COUNT = 3288; --pvp点数 程序界面有用到
--TASK_FIELD_PVP_JLZ = 3289; --精力值 程序界面有用到（使用我们的精力值）
TASK_FIELD_PVP_DRINK = 3290; --使用金陵酒时间
TASK_FIELD_PVP_STEAL_BOOK = 3291; --是否接取了偷取经书任务，分bit使用
TASK_FIELD_PVP_STEAL_STEP = 3292; --偷取经书完成步骤数，第1byte表示步骤数，第2byte表示当天第几次完成此任务（每天清）
TASK_FIELD_PVP_STEALED = 3293; --是否偷过该npc的书了
TASK_FIELD_PVP_CAR_START = 3294; --是否接了镖车任务
TASK_FIELD_PVP_CAR_RAND = 3295; --记录随机的镖车号！！ 程序界面有用到
TASK_FIELD_PVP_CAR_ID = 3296;  --记录镖车ID
TASK_FIELD_PVP_CAR_LIFE = 3297; --记录镖车生命
TASK_FIELD_PVP_CAR_IDX = 3298; --记录镖车索引
TASK_FIELD_PVP_SEED_NUM = 3299; --记录种了几棵种子了
TASK_FIELD_PVP_SEED_TIME = 3300; --最后一课种子的植入时间，超过10小时则清楚上面那个变量
TASK_FIELD_PVP_SEED_STEAL = 3301; --偷取玉魄任务
TASK_FIELD_PVP_SEED_SUR = 3302;   --收获两次果实
TASK_FIELD_PVP_TREASURE = 3303;   --藏宝图任务
TASK_FIELD_PVP_TREE_IDX = 3304; --种树的idx
TASK_FIELD_PVP_TREE_TIME = 3305; --种树的时间  程序界面有用到
TASK_FIELD_PVP_TREE_AWARD_CD = 3306; --领取树的奖励CD
TASK_FIELD_PVP_JOIN_TIME = 3307;    --加入势力时间
TASK_FIELD_PVP_CLEAR_DATA = 3308;  --周数，清贡献度等
TASK_FIELD_PVP_CLEAR_TIME = 3309; --清精力值
TASK_FIELD_PVP_CAR_DOUBLE = 3310; --是否镖车双倍
TASK_FIELD_PVP_CAR_TB = 3311; --是否镖车投保
TASK_FIELD_PVP_READING_TIME = 3312; --读书时间
TASK_FIELD_PVP_READ_STAR_TIME = 3313; --读书开始时间
TASK_FIELD_PVP_READ_TYPE = 3314; --读的是哪一本书
TASK_FIELD_PVP_STEAL_MAP = 3315;  --去哪里偷经书
TASK_FIELD_PVP_CAR_TASK = 3316; --记录接取了镖车任务 --dailyclean
TASK_FIELD_PVP_REWARD_HANDED = 3317; --记录保管了多少个徽章
TASK_FIELD_PVP_REWARD_TIME1 = 3318; --记录参加了赏金哪一阶段信息
TASK_FIELD_PVP_REWARD_TIME2 = 3319; --记录赏金该阶段领了几次徽章
TASK_FIELD_PVP_REWARD_DEADNUM = 3320; --记录赏金阶段死亡次数
TASK_FIELD_PVP_CAR_LIFETIME = 3321; --镖车生存时间
TASK_FIELD_PVP_CAR_PSEUDORAND = 3322; --镖车伪随机
TASK_FIELD_PVP_CAR_BIAOLING = 3323; --每日领取的运镖令 --dailyclean
TASK_FIELD_PVP_SEED_SHOWTIME1 = 3337; --野外pvp植入第1个种子的时间，用于界面显示
TASK_FIELD_PVP_SEED_SHOWTIME2 = 3338;	--野外pvp植入第2个种子的时间，用于界面显示
TASK_FIELD_PVP_TREE_SHOWTIME = 3339;	--野外pvp种植太虚树的时间，用于界面显示
TASK_FIELD_PVP_TIEQIAO_NUM = 3340;    --铁锹使用次数
TASK_FIELD_PVP_CAR_DAILY_NUM = 3341; 	--镖车任务每日3次限制 --dailyclean
TASK_FIELD_PVP_GXD_WARD = 3342; 		--贡献度奖励只可在当周领取，下周将重新累计。--weeklyclean
TASK_FIELD_PVP_FIREBOX_NUM = 3343; --野外pvp圣物拾取数量 --dailyclean

---------------------------------------------------------
MAX_PLAYER_LEVEL = 99			--玩家最高等级
MINNUM_SKILL_APP_LEVEL	= 1;
MAXNUM_SKILL_APP_LEVEL	= 10;
MINNUM_SKILL_APP_COUNT	= 0;
MAXNUM_SKILL_APP_COUNT	= 99999;
TASKID_JNS_SPE_ACH_TASK_1		= 3346;		--技能石成功合成出1颗1级技能石
TASKID_JNS_SPE_ACH_TASK_2		= 3347;		--技能石成功合成出1颗4级技能石
TASKID_JNS_SPE_ACH_TASK_3		= 3348;		--技能石成功合成出1颗7级技能石
TASKID_JNS_SPE_ACH_TASK_4		= 3349;		--技能石成功合成出1颗9级技能石
TASKID_JNS_SPE_ACH_TASK_5		= 3350;		--技能石成功合成出1颗10级技能石
TASKID_JNS_SPE_ACH_TASK_6		= 3351;		--技能石拥有一颗任意等级的技能石
TASKID_JNS_SPE_ACH_TASK_7		= 3352;		--技能石成功拆解一次已经镶嵌的技能石
