Include("\\script\\lib\\globalfunctions.lua")
--²âÊÔ
DebugOutput = nothing

--»î¶¯¿ªÆôÊ±¼ä
IC_START_TIME = {2015,07,04,0,0,0};
IC_END_TIME = {2015,08,21,0,0,0};

--»î¶¯ÈÎÎñ±äÁ¿×é
IC_TASK_GROUP = {8, 13};

--¼¤»îÂëÑÎ
IC_INVITE_CODE_SALT = "8kNPNKe4QS0FkBAw0K05GSWp0YWpAWZJ"

--Ê¹ÓÃµÄÊý¾Ý¿â±íÃû³Æ
IC_MYSQL_TABLE_NAME = "invite_code_1507"

--Êý¾ÝÐÐÎªÀàÐÍ
IC_QUERY_TYPE_REG = 1; --×¢²á
IC_QUERY_TYPE_QRY	= 2; --²éÑ¯
IC_QUERY_TYPE_MDY = 3; --ÐÞ¸Ä

--²Ù×÷¼ä¸ôÊ±¼äs
IC_CLICK_TIME = 15;

--ÊÜÑûÕß½±ÀøÀàÐÍ
IC_FINISH_INVITE_TYPE1 = 1; --5×ª90¼¶
IC_FINISH_INVITE_TYPE2 = 2; --6×ª90¼¶
IC_FINISH_INVITE_TYPE3 = 3; --¼¤»îÔÂ¿¨
IC_FINISH_INVITE_TYPE4 = 4; --Óù½ÖÏû·Ñ2000XU
IC_FINISH_INVITE_TYPE5 = 5; --Óù½ÖÏû·Ñ5000XU

IC_FINISH_INVITE_TYPE6 = 6; --Íê³ÉÈÎÒâ3¸öÈÎÎñ
IC_FINISH_INVITE_TYPE7 = 7; --Íê³ÉÈÎÒâ4¸öÈÎÎñ
IC_FINISH_INVITE_TYPE8 = 8; --Íê³ÉÈÎÒâ5¸öÈÎÎñ

function ck_GiveRandGem456()
	--Faction Cloth 9
	local VET_RandGem456 = {
        {1,9, "HuyÕtTrÝchTh¹ch Lv4", {2,22,104,1},nil,nil,nil,nil},
        {1,9, "NguyÖtB¹chTh¹ch Lv4", {2,22,204,1},nil,nil,nil,nil},
        {1,9, "Hæ Ph¸ch Th¹ch CÊp 4", {2,22,304,1},nil,nil,nil,nil},
        {1,9, "H¾c DiÖu Th¹ch CÊp 4", {2,22,404,1},nil,nil,nil,nil},
        {1,8, "HuyÕtTrÝchTh¹ch Lv5", {2,22,105,1},nil,nil,nil,1},
        {1,8, "NguyÖtB¹chTh¹ch Lv5", {2,22,205,1},nil,nil,nil,1},
        {1,8, "Hæ Ph¸ch Th¹ch CÊp 5", {2,22,305,1},nil,nil,nil,1},
        {1,8, "H¾c DiÖu Th¹ch CÊp 5", {2,22,405,1},nil,nil,nil,1},
        {1,8, "HuyÕtTrÝchTh¹ch Lv6", {2,22,106,1},nil,nil,nil,1},
        {1,8, "NguyÖtB¹chTh¹ch Lv6", {2,22,206,1},nil,nil,nil,1},
        {1,8, "Hæ Ph¸ch Th¹ch CÊp 6", {2,22,306,1},nil,nil,nil,1},
        {1,8, "H¾c DiÖu Th¹ch CÊp 6", {2,22,406,1},nil,nil,nil,1},
	} 
	gf_EventGiveRandAward(VET_RandGem456,100,1, "CDKEY", "CDKEY")
end

function ck_GiveRandGem345()
	--Faction Cloth 9
	local VET_RandGem345 = {
        {1,8, "HuyÕtTrÝchTh¹ch Lv3", {2,22,103,1},nil,nil,nil,nil},
        {1,8, "NguyÖtB¹chTh¹ch Lv3", {2,22,203,1},nil,nil,nil,nil},
        {1,8, "Hæ Ph¸ch Th¹ch CÊp 3", {2,22,303,1},nil,nil,nil,nil},
        {1,8, "H¾c DiÖu Th¹ch CÊp 3", {2,22,403,1},nil,nil,nil,nil},
        {1,9, "HuyÕtTrÝchTh¹ch Lv4", {2,22,104,1},nil,nil,nil,nil},
        {1,9, "NguyÖtB¹chTh¹ch Lv4", {2,22,204,1},nil,nil,nil,nil},
        {1,9, "Hæ Ph¸ch Th¹ch CÊp 4", {2,22,304,1},nil,nil,nil,nil},
        {1,9, "H¾c DiÖu Th¹ch CÊp 4", {2,22,404,1},nil,nil,nil,nil},
        {1,8, "HuyÕtTrÝchTh¹ch Lv5", {2,22,105,1},nil,nil,nil,1},
        {1,8, "NguyÖtB¹chTh¹ch Lv5", {2,22,205,1},nil,nil,nil,1},
        {1,8, "Hæ Ph¸ch Th¹ch CÊp 5", {2,22,305,1},nil,nil,nil,1},
        {1,8, "H¾c DiÖu Th¹ch CÊp 5", {2,22,405,1},nil,nil,nil,1},
	} 
	gf_EventGiveRandAward(VET_RandGem345,100,1, "CDKEY", "CDKEY")
end

function ck_GiveRandGem56()
	--Faction Cloth 9
	local VET_RandGem456 = {
        {1,13, "HuyÕtTrÝchTh¹ch Lv5", {2,22,105,1},nil,nil,nil,1},
        {1,13, "NguyÖtB¹chTh¹ch Lv5", {2,22,205,1},nil,nil,nil,1},
        {1,13, "Hæ Ph¸ch Th¹ch CÊp 5", {2,22,305,1},nil,nil,nil,1},
        {1,13, "H¾c DiÖu Th¹ch CÊp 5", {2,22,405,1},nil,nil,nil,1},
        {1,12, "HuyÕtTrÝchTh¹ch Lv6", {2,22,106,1},nil,nil,nil,1},
        {1,12, "NguyÖtB¹chTh¹ch Lv6", {2,22,206,1},nil,nil,nil,1},
        {1,12, "Hæ Ph¸ch Th¹ch CÊp 6", {2,22,306,1},nil,nil,nil,1},
        {1,12, "H¾c DiÖu Th¹ch CÊp 6", {2,22,406,1},nil,nil,nil,1},
	} 
	gf_EventGiveRandAward(VET_RandGem456,100,1, "CDKEY", "CDKEY")
end

IC_T_YUNLING5 = {
    {1, 2, "H-LiÖt Nham-Lv5", {0, 148, 69},nil,nil,nil,nil},
    {1, 2, "H-Ph¸ Kh«ng-Lv5", {0, 148, 70},nil,nil,nil,nil},
    {1, 2, "H-Tóy KiÕm-Lv5", {0, 148, 71},nil,nil,nil,nil},
    {1, 2, "H-TËt Phong-Lv5", {0, 148, 72},nil,nil,nil,nil},
    {1, 2, "H-TÊn Vò-Lv5", {0, 148, 73},nil,nil,nil,nil},
    {1, 2, "H-¦ng TËp-Lv5", {0, 148, 74},nil,nil,nil,nil},
    {1, 2, "H-Linh T©m-Lv5", {0, 148, 75},nil,nil,nil,nil},
    {1, 2, "H-ThÇn Lùc-Lv5", {0, 148, 76},nil,nil,nil,nil},
    {1, 2, "H-Ng­ng ThÇn-Lv5", {0, 148, 77},nil,nil,nil,nil},
    {1, 2, "H-V« Gian-Lv5", {0, 148, 78},nil,nil,nil,nil},
    {1, 2, "H-V« Cùc-Lv5", {0, 148, 79},nil,nil,nil,nil},
    {1, 2, "H-Cuång NhÉn-Lv5", {0, 148, 80},nil,nil,nil,nil},
    {1, 2, "H-L¨ng NhuÖ-Lv5", {0, 148, 81},nil,nil,nil,nil},
    {1, 2, "H-Linh Viªn-Lv5", {0, 148, 82},nil,nil,nil,nil},
    {1, 2, "H-H¶i VËn-Lv5", {0, 148, 83},nil,nil,nil,nil},
    {1, 2, "H-H¶i T©m-Lv5", {0, 148, 84},nil,nil,nil,nil},
    {1, 2, "C-LiÖt Nham-Lv5", {0, 149, 70},nil,nil,nil,nil},
    {1, 2, "C-Ph¸ Kh«ng-Lv5", {0, 149, 71},nil,nil,nil,nil},
    {1, 2, "C-Tóy KiÕm-Lv5", {0, 149, 72},nil,nil,nil,nil},
    {1, 2, "C-TËt Phong-Lv5", {0, 149, 73},nil,nil,nil,nil},
    {1, 2, "C-TÊn Vò-Lv5", {0, 149, 74},nil,nil,nil,nil},
    {1, 2, "C-Qu¸n Th¹ch-Lv5", {0, 149, 75},nil,nil,nil,nil},
    {1, 2, "C-Né Ng©m-Lv5", {0, 149, 76},nil,nil,nil,nil},
    {1, 2, "C-Xuyªn V©n-Lv5", {0, 149, 77},nil,nil,nil,nil},
    {1, 2, "C-ThÇn Lùc-Lv5", {0, 149, 78},nil,nil,nil,nil},
    {1, 2, "C-Ng­ng ThÇn-Lv5", {0, 149, 79},nil,nil,nil,nil},
    {1, 2, "C-V« Gian-Lv5", {0, 149, 80},nil,nil,nil,nil},
    {1, 2, "C-V« Cùc-Lv5", {0, 149, 81},nil,nil,nil,nil},
    {1, 2, "C-Cuång NhÉn-Lv5", {0, 149, 82},nil,nil,nil,nil},
    {1, 2, "C-L¨ng NhuÖ-Lv5", {0, 149, 83},nil,nil,nil,nil},
    {1, 2, "C-Linh Viªn-Lv5", {0, 149, 84},nil,nil,nil,nil},
    {1, 2, "C-H¶i VËn-Lv5", {0, 149, 85},nil,nil,nil,nil},
    {1, 2, "C-H¶i T©m-Lv5", {0, 149, 86},nil,nil,nil,nil},
    {1, 2, "T-LiÖt Nham-Lv5", {0, 150, 69},nil,nil,nil,nil},
    {1, 2, "T-Ph¸ Kh«ng-Lv5", {0, 150, 70},nil,nil,nil,nil},
    {1, 2, "T-Tóy KiÕm-Lv5", {0, 150, 71},nil,nil,nil,nil},
    {1, 2, "T-TËt Phong-Lv5", {0, 150, 72},nil,nil,nil,nil},
    {1, 2, "T-TÊn Vò-Lv5", {0, 150, 73},nil,nil,nil,nil},
    {1, 2, "T-V« L­îng-Lv5", {0, 150, 74},nil,nil,nil,nil},
    {1, 2, "T-Môc Minh-Lv5", {0, 150, 75},nil,nil,nil,nil},
    {1, 2, "T-ThÇn Lùc-Lv5", {0, 150, 76},nil,nil,nil,nil},
    {1, 2, "T-Ng­ng ThÇn-Lv5", {0, 150, 77},nil,nil,nil,nil},
    {1, 2, "T-V« Gian-Lv5", {0, 150, 78},nil,nil,nil,nil},
    {1, 2, "T-V« Cùc-Lv5", {0, 150, 79},nil,nil,nil,nil},
    {1, 2, "T-Cuång NhÉn-Lv5", {0, 150, 80},nil,nil,nil,nil},
    {1, 2, "T-L¨ng NhuÖ-Lv5", {0, 150, 81},nil,nil,nil,nil},
    {1, 2, "T-Linh Viªn-Lv5", {0, 150, 82},nil,nil,nil,nil},
    {1, 3, "T-H¶i VËn-Lv5", {0, 150, 83},nil,nil,nil,nil},
    {1, 3, "T-H¶i T©m-Lv5", {0, 150, 84},nil,nil,nil,nil},
}

IC_T_YUNLING6 = {
    {1, 2, "H-LiÖt Nham-Lv6", {0, 148, 85},nil,nil,nil,nil},
    {1, 2, "H-Ph¸ Kh«ng-Lv6", {0, 148, 86},nil,nil,nil,nil},
    {1, 2, "H-Tóy KiÕm-Lv6", {0, 148, 87},nil,nil,nil,nil},
    {1, 2, "H-TËt Phong-Lv6", {0, 148, 88},nil,nil,nil,nil},
    {1, 2, "H-TÊn Vò-Lv6", {0, 148, 89},nil,nil,nil,nil},
    {1, 2, "H-¦ng TËp-Lv6", {0, 148, 90},nil,nil,nil,nil},
    {1, 2, "H-Linh T©m-Lv6", {0, 148, 91},nil,nil,nil,nil},
    {1, 2, "H-ThÇn Lùc-Lv6", {0, 148, 92},nil,nil,nil,nil},
    {1, 2, "H-Ng­ng ThÇn-Lv6", {0, 148, 93},nil,nil,nil,nil},
    {1, 2, "H-V« Gian-Lv6", {0, 148, 94},nil,nil,nil,nil},
    {1, 2, "H-V« Cùc-Lv6", {0, 148, 95},nil,nil,nil,nil},
    {1, 2, "H-Cuång NhÉn-Lv6", {0, 148, 96},nil,nil,nil,nil},
    {1, 2, "H-L¨ng NhuÖ-Lv6", {0, 148, 97},nil,nil,nil,nil},
    {1, 2, "H-Linh Viªn-Lv6", {0, 148, 98},nil,nil,nil,nil},
    {1, 2, "H-H¶i VËn-Lv6", {0, 148, 99},nil,nil,nil,nil},
    {1, 2, "H-H¶i T©m-Lv6", {0, 148, 100},nil,nil,nil,nil},
    {1, 2, "C-LiÖt Nham-Lv6", {0, 149, 87},nil,nil,nil,nil},
    {1, 2, "C-Ph¸ Kh«ng-Lv6", {0, 149, 88},nil,nil,nil,nil},
    {1, 2, "C-Tóy KiÕm-Lv6", {0, 149, 89},nil,nil,nil,nil},
    {1, 2, "C-TËt Phong-Lv6", {0, 149, 90},nil,nil,nil,nil},
    {1, 2, "C-TÊn Vò-Lv6", {0, 149, 91},nil,nil,nil,nil},
    {1, 2, "C-Qu¸n Th¹ch-Lv6", {0, 149, 92},nil,nil,nil,nil},
    {1, 2, "C-Né Ng©m-Lv6", {0, 149, 93},nil,nil,nil,nil},
    {1, 2, "C-Xuyªn V©n-Lv6", {0, 149, 94},nil,nil,nil,nil},
    {1, 2, "C-ThÇn Lùc-Lv6", {0, 149, 95},nil,nil,nil,nil},
    {1, 2, "C-Ng­ng ThÇn-Lv6", {0, 149, 96},nil,nil,nil,nil},
    {1, 2, "C-V« Gian-Lv6", {0, 149, 97},nil,nil,nil,nil},
    {1, 2, "C-V« Cùc-Lv6", {0, 149, 98},nil,nil,nil,nil},
    {1, 2, "C-Cuång NhÉn-Lv6", {0, 149, 99},nil,nil,nil,nil},
    {1, 2, "C-L¨ng NhuÖ-Lv6", {0, 149, 100},nil,nil,nil,nil},
    {1, 2, "C-Linh Viªn-Lv6", {0, 149, 101},nil,nil,nil,nil},
    {1, 2, "C-H¶i VËn-Lv6", {0, 149, 102},nil,nil,nil,nil},
    {1, 2, "C-H¶i T©m-Lv6", {0, 149, 103},nil,nil,nil,nil},
    {1, 2, "T-LiÖt Nham-Lv6", {0, 150, 85},nil,nil,nil,nil},
    {1, 2, "T-Ph¸ Kh«ng-Lv6", {0, 150, 86},nil,nil,nil,nil},
    {1, 2, "T-Tóy KiÕm-Lv6", {0, 150, 87},nil,nil,nil,nil},
    {1, 2, "T-TËt Phong-Lv6", {0, 150, 88},nil,nil,nil,nil},
    {1, 2, "T-TÊn Vò-Lv6", {0, 150, 89},nil,nil,nil,nil},
    {1, 2, "T-V« L­îng-Lv6", {0, 150, 90},nil,nil,nil,nil},
    {1, 2, "T-Môc Minh-Lv6", {0, 150, 91},nil,nil,nil,nil},
    {1, 2, "T-ThÇn Lùc-Lv6", {0, 150, 92},nil,nil,nil,nil},
    {1, 2, "T-Ng­ng ThÇn-Lv6", {0, 150, 93},nil,nil,nil,nil},
    {1, 2, "T-V« Gian-Lv6", {0, 150, 94},nil,nil,nil,nil},
    {1, 2, "T-V« Cùc-Lv6", {0, 150, 95},nil,nil,nil,nil},
    {1, 2, "T-Cuång NhÉn-Lv6", {0, 150, 96},nil,nil,nil,nil},
    {1, 2, "T-L¨ng NhuÖ-Lv6", {0, 150, 97},nil,nil,nil,nil},
    {1, 2, "T-Linh Viªn-Lv6", {0, 150, 98},nil,nil,nil,nil},
    {1, 3, "T-H¶i VËn-Lv6", {0, 150, 99},nil,nil,nil,nil},
    {1, 3, "T-H¶i T©m-Lv6", {0, 150, 100},nil,nil,nil,nil},
}

function giveYunLing5()
	gf_EventGiveRandAward(IC_T_YUNLING5,100,1, "CDKEY", "CDKEY")
end

function giveYunLing6()
	gf_EventGiveRandAward(IC_T_YUNLING6,100,1, "CDKEY", "CDKEY")
end

--ÑûÇëÕß½±Àø
IC_YAOQING_AWARD = {
	[1] = {"item",		1, 	"Hu©n ch­¬ng anh hïng", {2,1,30499,4}},
	[2] = {"item", 		6, 	"ThiÕt tinh cÊp 4", 	{2,1,30612,10,4}},
	[3] = {"func", 		12, "Thó C­ìi: L¹c §µ X¸m", {0,105,149,1,4}, 30 * 24 * 3600},
	[4] = {"item", 		24, "Thiªn Th¹ch linh th¹ch", {2,1,1068,1,4}},
	[5] = {"func", 		36, "§¸ Quý CÊp 3-5 (NgÉu nhiªn)", ck_GiveRandGem345},
	[6] = {"item", 		50, "Thiªn Cang LÖnh", {2,95,204,1}},
	[7] = {"item", 		60, "Hßa ThÞ BÝch", {2,1,1001,1,4}},
	[8] = {"func", 		80, "UÈn Linh CÊp 6", giveYunLing6},
}

--½±Àø
IC_YAOYANG_JIEZI_1 = {
	{"DiÖu D­¬ng-¤ L©n B¶o Giíi", {0, 102, 3176, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng-Tö Giao Ngäc Béi", {0, 102, 3178, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng-V©n Hæ LÖnh", {0, 102, 3180, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng-XÝch T­íc Hoµn", {0, 102, 3182, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng-BÝch Quy Liªn", {0, 102, 3184, 1, 4, -1, -1, -1, -1, -1, -1}},
}

IC_YAOYANG_JIEZI_2 = {
	{"DiÖu D­¬ng To¸i Hoµng-¤ L©n B¶o Giíi", {0, 102, 3185, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng To¸i Hoµng-Tö Giao Ngäc Béi", {0, 102, 3186, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng To¸i Hoµng-V©n Hæ LÖnh", {0, 102, 3187, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng To¸i Hoµng-XÝch T­íc Hoµn", {0, 102, 3188, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng To¸i Hoµng-BÝch Quy Liªn", {0, 102, 3189, 1, 4, -1, -1, -1, -1, -1, -1}},
}
