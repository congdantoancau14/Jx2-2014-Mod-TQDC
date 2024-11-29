
RELAYGLB_SYSTEM			= 1			-- RelayÈ«¾Ö±äÁ¿£ºÏµÍ³
RELAYGLB_MULTIPLE 		= 2			-- RelayÈ«¾Ö±äÁ¿£º±¶ÂÊ
RELAYGLB_SHINYNIGHT		= 3			-- RelayÈ«¾Ö±äÁ¿£º»Ô»ÍÖ®Ò¹ÊÇ·ñ½øĞĞÖĞ£¬1Îª½øĞĞÖĞ£¬0ÎªÎ´½øĞĞ

SYS_BATTLE				= 1			-- Õ½³¡µÄÕ½¹¦
SYS_COC			 	 	= 2			-- ÉÌ»áµÄ½±Àø
SYS_MASTER_RANDOMTASK	= 3			-- Ê¦ÃÅËæ»úÈÎÎñ½±Àø
SYS_MASTER_REPEATTASK	= 4			-- Ê¦ÃÅÖØ¸´ÈÎÎñ½±Àø
SYS_KILLER_TASK			= 5			-- É±ÊÖÈÎÎñ½±Àø
SYS_DRAGONBOAT			= 6			-- ÁúÖÛ»ı·Ö½±Àø

TIME_START				= 19		-- »Ô»ÍÖ®Ò¹Æô¶¯Ê±¼ä
TIME_CLOSE				= 23		-- »Ô»ÍÖ®Ò¹¹Ø±ÕÊ±¼ä

map_multiple = {
	SYS_BATTLE,						-- Õ½³¡µÄÕ½¹¦
	SYS_COC,						-- ÉÌ»áµÄ½±Àø
	SYS_MASTER_RANDOMTASK,			-- Ê¦ÃÅËæ»úÈÎÎñ½±Àø
	SYS_MASTER_REPEATTASK,			-- Ê¦ÃÅÖØ¸´ÈÎÎñ½±Àø
	SYS_KILLER_TASK,				-- É±ÊÖÈÎÎñ½±Àø
	SYS_DRAGONBOAT					-- ÁúÖÛ»ı·Ö½±Àø
}

-- ÖÜÎå¡¢Áù¡¢ÈÕÃ»ÓĞÉ±ÊÖÈÎÎñ
map_multiple_holiday = {
	SYS_BATTLE,						-- Õ½³¡µÄÕ½¹¦
	SYS_COC,						-- ÉÌ»áµÄ½±Àø
	SYS_MASTER_RANDOMTASK,			-- Ê¦ÃÅËæ»úÈÎÎñ½±Àø
	SYS_MASTER_REPEATTASK,			-- Ê¦ÃÅÖØ¸´ÈÎÎñ½±Àø
	SYS_DRAGONBOAT					-- ÁúÖÛ»ı·Ö½±Àø
}

map_week_systems = {
	[0] = map_multiple_holiday,		-- ÖÜÈÕ
	[1] = map_multiple,				-- ÖÜÒ»
	[2] = map_multiple,				-- ÖÜ¶ş
	[3] = map_multiple,				-- ÖÜÈı
	[4] = map_multiple,				-- ÖÜËÄ
	[5] = map_multiple_holiday,		-- ÖÜÎå
	[6] = map_multiple_holiday		-- ÖÜÁù
}

map_sysnames = {
	{"ChiÕn tr­êng", 			"ChiÕn c«ng",		0},
	{"Th­¬ng héi",			"",			0},
	{"NhiÖm vô s­ m«n - ngÉu nhiªn",	"",			0},
	{"NhiÖm vô s­ m«n tuÇn hoµn",	"§iÓm tİch lòy",		0},
	{"NhiÖm vô s¸t thñ",		"Kinh nghiÖm",		0},
	{"ThuyÒn rång",			"§iÓm tİch lòy",		0}
}

-- Ò»ÖÜÄÚµÄ±¶ÂÊÅÅÁĞ£¨ĞèÒª³ıÒÔ100£©
map_week_multiples = {
	[0] = 200,	-- ÖÜÈÕ
	[1] = 150,	-- ÖÜÒ»
	[2] = 150,	-- ÖÜ¶ş
	[3] = 150,	-- ÖÜÈı
	[4] = 150,	-- ÖÜËÄ
	[5] = 150,	-- ÖÜÎå
	[6] = 200	-- ÖÜÁù
}

-- Ëæ»úÑ¡ÔñÒ»¸öÏµÍ³
function get_random_system()
	local wday = tonumber(date("%w"))
	local map = map_week_systems[wday]

	local yday = tonumber(date("%j"))
	local hour = tonumber(date("%H"))
	local min = tonumber(date("%M"))
	local sec = tonumber(date("%S"))
	local seed = yday * 86400 + hour * 3600 + min * 60 + sec
	randomseed(seed)
	for i=1,yday do
		random(1, 6)
	end

	--local system = random(1, getn(map))	-- ÔİÊ±ÆÁ±ÎÕ½³¡£¬Jeep tag
	local system = random(2, getn(map))
	return map[system]
end

-- Ñ¡Ôñ±¶ÂÊ
function get_multiple()
	local wday = tonumber(date("%w"))
	return map_week_multiples[wday]
end
