
TASK_FIREINDEX = 1000 -- Index cña ®èng löa
TASK_GETFIRECOUNT = 1002 -- §Õm sè ®èng löa ®· ®èt
TASK_BURNFIRETIME = 1003; -- Thêi ®iÓm ®èt ®èng löa Task_id 
TASK_NEWFIRELIFETIME = 1004; -- Sinh mÖnh ®èng löa sau khi thªm cñi

TASK_OVENINDEX = 1005 -- Index cña lß n­íng
TASK_HIREOVENTIME = 1006; -- Thêi ®iÓm Thuª Lß n­íng Task_id
TASK_OVENTYPE = 1007; -- K?ch cì lß n­íng

OVENLIFETIME = 1 * 60; -- Sinh mÖnh cña ®èng löa: 1 phót
FIRELIFETIME = 5 * 60; -- Sinh mÖnh cña ®èng löa: 5 phót
MAXFIRELIFETIME = 600 -- HiÖu xuÊt tèi ®a cña ®èng löa: 10 phót

tDecorators = {
	[1] = {
		["mater"] = {
			{"Cñi",{2,1,30235},100,0,{ -- Tªn_vËt_phÈm, {g,d,p}, sè_l­îng_yªu_cÇu, kh«ng_tiªu_hao, vËt_thay_thª
					{"Cñi",{2,1,30022},100},
					{"Cñi",{2,1,30264},100},
					{"Cñi kh«",{2,1,30330},100}, 
					{"Cñi kh«",{2,1,30768},100},
				}}, 
			{"§¸ löa",{2,0,170},1,0},
		},
		["npc"] = {
			{"Löa tr¹i"},
		},
		["desc"] = {
			{
				"§èng löa, cã nhiÒu t¸c dông.\n"
				.."* Duy tr× nhiÖt ®é c¬ thÓ trong kh«ng khÝ l¹nh\n"
				.."* Duy tr× cho lß n­íng\n"
				.."* T¹o ¸nh s¸ng nh©n t¹o, thay thÕ ¸nh s¸ng mÆt trêi vµo ban ®ªm\n"
				.."* Hong kh« ®å bÞ ­ít\n"
				.."X©y dùng cÇn cã cñi (khai th¸c t¹i Linh B¶o S¬n) "
				.."vµ ®¸ löa (cã ®­îc tõ Tµng KiÕm khi ®¸nh b¹i Tæng Qu¶n ngo¹i viÖn)"
			}
		}
	},
}

tOvens = {
	[1] = {"Lß n­íng nhá", "Lß n­íng nhá",20000,10}, -- tªn_m«_h×nh, tªn_hiÓn_thÞ, gi¸_tiÒn, søc_chøa (c«ng_suÊt)
	[2] = {"Lß n­íng lín", "Lß n­íng lín",200000,100},
	[3] = {"Lß n­íng b¸nh", "Lß n­íng siªu lín",600000,1000},
}

tCheBien = {
	[1] = {
		["mater"] = {
			{"Bét m×",{2,1,30233},10},
			{"Nh©n b¸nh",{2,1,30234},10},
			--{"Cñi",{2,1,30235},10},
		},
		["products"] = {
			{"B¸nh Trung Thu",{2,1,30236},1},
			{"B¸nh Trung Thu ®· n­íng chÝn",{2,1,30237},1},
			{"B¸nh Trung Thu ch­a chÝn",{2,1,30238},1},
		},
		["desc"] = {
			{"H»ng Nga du ch¬i ë TuyÒn Ch©u. Lµm b¸nh tÆng H»ng Nga th«i! "
				.."Nguyªn liÖu gåm Bét m× vµ nh©n b¸nh. CÇn cã lß n­íng ®Ó n­íng b¸nh."}
		},
		["tool"] = {
			{"Lß n­íng nhá", 10}, -- Tªn_c«ng_cô, hiÖu_suÊt
			{"Lß n­íng lín", 100},
			{"Lß n­íng siªu lín", 999},
		},
	},
	[2] = {
		["mater"] = {
			{"§­êng c¸t",{2,1,30062},10},
			{"Hép s÷a",{2,1,30063},5},
			{"Lä h­¬ng",{2,1,30064},5},
			{"GiÊy gãi kÑo",{2,1,30065},10},
		},
		["products"] = {
			{"KÑo s÷a",{2,1,30066},10},
		},
		["desc"] = {
			{"KÑo s÷a rÊt ngon vµ bæ. Kh«ng chØ trÎ con mµ ng­êi lín cu~ng thÝch ¨n.\n"
				.."Nguyªn liÖu gåm §­êng c¸t, Hép s÷a, Lä h­¬ng vµ giÊy gãi. Cu~ng cÇn cã lß n­íng ®Ó nÊu kÑo."}
		},
		["tool"] = {
			{"Lß n­íng nhá", 10}, -- Tªn_c«ng_cô, hiÖu_suÊt
			{"Lß n­íng lín", 100},
			{"Lß n­íng siªu lín", 999},
		},
	},
	[3] = {
		["mater"] = {
			{"M¨ng",{1,3,21},10},
		},
		["products"] = {
			{"M¨ng xµo",{1,1,6},2},
		},
		["desc"] = {
			{"M¨ng xµo lµ mãn dÔ ¨n, nhiÒu ng­êi th?ch. ChÕ biÕn còng kh«ng khã. Nguyªn liÖu cã thÓ ®Õn Vò Di s¬n t×m kiÕm."}
		},
		["tool"] = {
			{"Lß n­íng nhá", 10}, -- Tªn_c«ng_cô, hiÖu_suÊt
			{"Lß n­íng lín", 100},
			{"Lß n­íng siªu lín", 999},
		},
	},
	
}