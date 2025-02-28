
-- Creator : lizhi
-- 攻城战擂台 2007-3-29 10:43
-- 注意: 所有擂台和报名地点都必须在同一台服务器,否则就完蛋

Include("\\script\\lib\\writelog.lua");
CHEAT_MODE = 1;

-- 城市
CITY_ID_CD = 300		-- 成都
CITY_ID_QZ = 100		-- 泉州
CITY_ID_XY = 350		-- 襄阳

--服务器全局变量，记录此次参与攻城战资格竞争的类型：1，攻城擂台 2，竞投挑战令
CITY_GLB_VALUE_TYPE = 1019;

--随机一种获得攻城战权限的方法
tSignMethod = {
	"L玦 i C玭g th祅h chi課",
	"u gi� khi猽 chi課 l謓h",
};

tSignUpCityName =
{
	[100] = "Tuy襫 Ch﹗",
	[300] = "Th祅h Й",
	[200] = "Bi謓 Kinh",
}

tFightCityName =
{
	[CITY_ID_CD] = "Th祅h Й",
	[CITY_ID_QZ] = "Tuy襫 Ch﹗",
	[CITY_ID_XY] = "Tng Dng",
}

-- 报名的地图ID
CITY_SIGNUP_MAP_ID = 300

-- 对应城市擂台地图ID
tArenaMapID =
{
	[CITY_ID_CD] = {839, 840, 841, 842},
	[CITY_ID_QZ] = {839, 840, 841, 842},
	[CITY_ID_XY] = {839, 840, 841, 842},
}

-- 传送进擂台的坐标
tArenaMapPos =
{
	[839] = {1600, 3238},
	[840] = {1600, 3238},
	[841] = {1600, 3238},
	[842] = {1600, 3238},
}

-- 出场的坐标
tLeavePos = {CITY_SIGNUP_MAP_ID, 1857, 3555}

-- 对应时间开启擂台表
tHourCity = 
{
	[19] = CITY_ID_CD,
	[20] = CITY_ID_QZ,
	[21] = CITY_ID_XY,
}

-- mission ID
RECORD_MISSION_ID = 37
ARENA_MISSION_ID = 38

-- timer
TIMER_ID = 66
TIME_SEC = 10
ARENA_TIME_SEC = 5
TIMER_INTERVAL = TIME_SEC * 18
ARENA_TIME_INTERVAL = ARENA_TIME_SEC * 18

RECORD_SIGNUP_TIME = 10 * 60 * 18			-- 10分钟报名时间
RECORD_RAND_TIME = 	TIMER_INTERVAL			-- 1 tick随机分配队伍时间(发呆时间)
ARENA_PREPARE_TIME = 3 * 60 * 18			-- 3分钟准备时间
ARENA_FIGHT_TIME = 7 * 60 * 18				-- 7分钟开打时间

RECORD_SIGNUP_TIME_INTERVAL = floor(RECORD_SIGNUP_TIME / TIMER_INTERVAL)	-- 报名时间结束
RECORD_RAND_TIME_INTERVAL = floor(RECORD_RAND_TIME / TIMER_INTERVAL)			-- 随机分配队伍时间结束
ARENA_PREPARE_TIME_INTERVAL = floor(ARENA_PREPARE_TIME / TIMER_INTERVAL)		-- 开打准备时间
ARENA_FIGHT_TIME_INTERVAL = floor(ARENA_FIGHT_TIME / TIMER_INTERVAL)			-- 开打时间

SUB_ARENA_PREPARE_TIME_END = floor(ARENA_PREPARE_TIME / ARENA_TIME_INTERVAL)		-- 开打准备的结束时间
SUB_ARENA_FIGHT_TIME_END = floor(ARENA_FIGHT_TIME / ARENA_TIME_INTERVAL)			-- 开打的结束时间

MAX_TEAM_COUNT = 8							-- 最多一次能报名的队伍数

-- RECORD MISSION STATE
NO_START = 0
SIGNUP_TIME = 1
VIEW_TIME = 2
PREPARE_TIME = 3
FIGHT_TIME = 4

-- CAMP ID
CAMP_FIGHT1 = 1
CAMP_FIGHT2 = 2
CAMP_VIEWER = 3

MAX_VIEWER = 20

SKILLENABLE = 1906		--是否能够使用武功

-- LOG
LOG_SIEGE_ERROR = 1

function LOG_SIEGE(nLogGenre, szMsg)
	if nLogGenre == LOG_SIEGE_ERROR then
		local szErrorMsg = "C玭g th祅h chi課-L玦 i-L鏸 : "..szMsg
		print(szErrorMsg)
		WriteLog(szErrorMsg)
	end
end
