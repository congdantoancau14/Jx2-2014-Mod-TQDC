--=============================================
--create by baiyun 2009.12.21
--describe:Ô½ÄÏ°æÎäÁÖÊ¹ÕßÈÕ³£ÈÎÎñ relay´¥·¢ÈÎÎñÎÄ¼þ
--=============================================

--¸öÈËÈÕ³£ÈÎÎñÁÐ±í
DALIY_TASK_0912_PERSONAL_TASK_LIST = {
    {"Thu phôc  Ph­îng Hoµng t¹i Th¸i H­ ¶o c¶nh", 10, {"Kinh nghiÖm Phông hoµng", "LuyÖn Phông Hoµng", "B¶o Th¹ch Phông hoµng", "Trang bÞ Phông hoµng"}},
    {"Thu phôc Thùc Nh©n Th¶o t¹i Th¸i H­ ¶o c¶nh", 20, {"Kinh nghiÖm Thùc nh©n th¶o", "LuyÖn Thùc Nh©n Hoa", "B¶o Th¹ch Thùc Nh©n hoa", "Trang bÞ Thùc nh©n th¶o"}},
    {"Thu phôc Thá t¹i Th¸i H­ ¶o c¶nh", 20, {"Kinh nghiÖm Thá", "LuyÖn Thè tö", "B¶o Th¹ch Thè", "Trang bÞ Thá"}},
    {"Thu phôc Háa Kú L©n t¹i Th¸i H­ ¶o c¶nh", 10, {"Kinh nghiÖm Háa Kú L©n", "LuyÖn Háa Kú L©n", "B¶o Th¹ch Háa Kú L©n", "Trang bÞ Háa Kú L©n"}},
    {"Thu phôc Bß T©y T¹ng t¹i Th¸i H­ ¶o c¶nh", 20, {"Kinh nghiÖm Bß T©y T¹ng", "LuyÖn Mao Ng­u", "B¶o Th¹ch Bß T©y T¹ng", "Trang bÞ Bß T©y T¹ng"}},
    {"Thu phôc CÇm Tiªn Tö t¹i Th¸i H­ ¶o c¶nh", 20, {"Kinh nghiÖm CÇm Tiªn Tö", "LuyÖn CÇm Tiªn Tö", "B¶o Th¹ch CÇm Tiªn Tö", "Trang bÞ CÇm Tiªn Tö"}},
}

--ÍÅ¶ÓÈÕ³£ÈÎÎñÁÐ±í
DALIY_TASK_0912_TEAM_TASK_LIST = {
    {"Truy t×m B¾c Lôc L©m LÖnh", 10, "B¾c Lôc L©m lÖnh"},
    {"Truy t×m Trôc ¶nh th­¬ng", 20, "Trôc ¶nh Th­¬ng"},
    {"Truy t×m TuyÖt T×nh Th¹ch", 20, "TuyÖt T×nh Th¹ch"},
    {"Truy t×m LÖnh Bµi Tæng Qu¶n ngo¹i viÖn", 5, "LÖnh bµi tæng qu¶n ngo¹i viÖn"},
    {"Truy t×m LÖnh Bµi Tæng qu¶n néi viÖn", 5, "LÖnh bµi tæng qu¶n néi viÖn"},
    {"Truy t×m ViÖt N÷ KiÕm", 5, "ViÖt N÷ kiÕm"},
    {"Truy t×m Trang Chñ Kim Ên", 15, "Trang chñ kim Ên"},
    {"Truy t×m Tr­ëng L·o chØ hoµn", 20, "Tr­ëng L·o ChØ Hoµn"},
}

---- ¶¨Ê±Éè¶¨
function TaskShedule()
	-- ÈÎÎñÃû×Ö
	TaskName("nhiÖm vô th­êng nhËt c¸ nh©n".."nhiÖm vô th­êng nhËt tæ ®éi")
	
	-- 24Ð¡Ê±Ò»´Î
	TaskInterval(24 * 60)
	
	TaskTime(0, 0)
	
	-- ÖØ¸´Ö´ÐÐÎÞÏÞ´ÎÊý
	TaskCountLimit(0)
	
	--local msg = "É±ÊÖÌÃ»î¶¯ÓÚ"..nHour.."Ê±"..nMinute.."·Ö¿ªÊ¼£¡"
	--OutputMsg(format(msg))
end

-- ¶¨Ê±Ö´ÐÐµÄÄÚÈÝ
function TaskContent()
    local nPersonalTask = get_rand_item_by_table(DALIY_TASK_0912_PERSONAL_TASK_LIST, 100, 2);
    local nTeamTask = get_rand_item_by_table(DALIY_TASK_0912_TEAM_TASK_LIST, 100, 3);
    GlobalExecute(format("dw InitDaliyTask(%d, %d)", nPersonalTask, nTeamTask));
end

function get_rand_item_by_table(ITEM_PARAM, nMax, nDefault)
	local nPos = 0;
	local nRand = random(1, nMax);
	for i = 1, getn(ITEM_PARAM) do
		if nRand > nPos and nRand <= nPos + ITEM_PARAM[i][2] then
			return i;
		end
		nPos = nPos + ITEM_PARAM[i][2];
	end
	return nDefault;
end

