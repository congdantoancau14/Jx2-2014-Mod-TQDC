--=============================================
--create by zhoulimei 2009-12-28
--describe:越南版转生同伴系统字符串文件
--为避免与其它文件中的变量重名，本文件中以VET_201003_TONGBAN开头
--=============================================


VET_201003_TONGBAN_STR_LOGTITLE = "Ban Dong Hanh";

VET_201003_TONGBAN_STR_MODE_NAME =  --同伴NPC模板名
{
    [1] = {"Th� tr緉g", "Th� x竚", "Th� 甧n"},
    [2] = {"Ti觰 D� tr�", "Ong v祅g","чc Gi竝 Tr飊g","D琲","H� Ly","B� c筽 nc"},
    [3] = {"S鉯 甶猲","Qu� n","C� s蕌1","C鉩1","D琲 h髏 m竨","B� c筽","Ng﹏ H�","Thng Vi猲","Th� Qu竔1","G蕌 x竚","Ong c","Kim Gi竝"},
    [4] = {"S鉯 甶猲","Qu� n","C� s蕌1","C鉩1","D琲 h髏 m竨","B� c筽","Ng﹏ H�","Thng Vi猲","Th� Qu竔1","G蕌 x竚","Ong c","Kim Gi竝", "H錸g B祇 S� Gi�3","T﹜ B綾 Tr竛g H竛","Nh蕋 Ph萴 Л阯g M藅 S�","Xi H醓 Trng L穙","Oa Kh蕌1","Ti猲 N�1","N� Ti猽 Ti猲","Tr� M﹗ H� V�"},
};

tPetInfo = {
	[1] 	= {"Th�",{"c","C竔"}},
	[2] 	= {"Th�",{"c","C竔"}},
	[3] 	= {"Th�",{"c","C竔"}},
	[4] 	= {"Ngi",{"Nam","N�"}},
	[5] 	= {"Ngi",{"Nam","N�"}},
	[6] 	= {"Ngi",{"Nam","N�"}},
	[7] 	= {"Linh Th�",{"Dng",""}},
	[8] 	= {"Linh Th�",{"Dng",""}},
	[9] 	= {"Linh Th�",{"Dng",""}},
	[10] 	= {"Linh Th�",{"Dng",""}},	
}

tRouteSkillInfo =
{
				[0] = 0,
				[1] = 0,
				[2] = 31,
				[3] = 56,
				[4] = 43,
				[5] = 0,
				[6] = 73,
				[7] = 0,
				[8] = 88,
				[9] = 101,
				[10] = 0,
				[11] = 112,
				[12] = 123,
				[13] = 0,
				[14] = 145,
				[15] = 158,
				[16] = 0,
				[17] = 731,
				[18] = 744,
				[19] = 0,
				[20] = 377,
				[21] = 363,
				[23] = 1030,
				[25] = 1065 ,
				[26] = 1095,
				[27] = 1143,
				[29] = 1176,
				[30] = 1229,
}

-- 觤 n﹏g c蕄, 甶觤 luy謓, v祅g, th竔 d辌h, 甶觤 linh l鵦 c莕, 甶觤 linh l鵦 t鑙 產, s� l莕 luy謓 linh l鵦 1 ng祔
tRequireElement =
{
				[1] = {0, 7000, 1000000, 10, 0, 0,0},
				[2] = {300, 7000, 1000000, 20, 0, 200, 5},
				[3] = {600, 7000, 1000000, 30, 200, 600, 5},
				[4] = {1200, 7000, 1000000, 40, 600, 1500, 5},
}

tGP_Daily = {4,4,3,2,2}

VET_201003_TONGBAN_STR_LOG_ACTION =            
{
    [1] = "nh薾 頲 ph莕 thng b筺 ng h祅h thng ng祔 - ph莕 thng qu﹏ c玭g:",
    [2] = "D筺g t猲 NPC b筺 ng h祅h l鏸",
    [3] = "L鏸 ng c蕄 b筺 ng h祅h",
    [4] = "Kh竛g t蕋 c� +5",
    [5] = "Kh竛g t蕋 c� +10",
    [6] = "Kh竛g t蕋 c� +20",
    [7] = "Ho祅 th祅h nhi謒 v� b筺 ng h祅h thng ng祔, giao n閜",
    [8] = "S� d鬾g t骾 th鵦 ph萴",
}

VET_201003_TONGBAN_STR_SHOW_MASSAGE = 
{
    [1] = "Nh藀 t猲 c馻 b筺 ng h祅h:",
    [2] = "Th阨 gian t錸 t筰 c馻 b筺 ng h祅h l� 24 gi� (bao g錷 th阨 gian r阨 m筺g), sau 24 gi� s� t� ng bi課 m蕋. N誹 nh� kh玭g mu鑞 nh譶 th蕐 n� c� th� tri謚 h錳 b筺 ng h祅h m韎.",
    [3] = "Чi hi謕  nh薾 nhi謒 v�, h穣 ho祅 th祅h nhi謒 v� hi謓 t筰 r錳 m韎 nh薾 nhi謒 v� m韎",
    [4] = "B筺 ng h祅h c馻 c竎 h� c� c蕄 %d.",
    [5] = "觤 s鴆 kh醗 c馻 b筺 ng h祅h  t n <color=yellow>300<color> 甶觤, kh玭g th� ti誴 t鬰 cho ╪!",
    [6] = "S� d鬾g t骾 th鴆 ╪ th祅h c玭g, 甶觤 s鴆 kh醗 c馻 b筺 ng h祅h hi謓 t筰 l� %d.",
    [7] = "Nh薾 頲 tr筺g th竔 kh竛g t蕋 c� t╪g %d.",
    [8] = "M鏸 ng祔 i hi謕 c� th� nh薾 頲 <color=yellow>4<color> l莕 nhi謒 v� b筺 ng h祅h, ch� c莕 trong v遪g 1 ng祔 ho祅 th祅h <color=yellow>4<color> l莕 nhi謒 v� th� c� th� nh薾 頲 ph莕 thng th藅 phong ph�. Hi謓 t筰 c� th� nh薾 頲 <color=yellow>%d<color> l莕 nhi謒 v�. Gi穘 c竎h 2 l莕 nh薾 nhi謒 v� l� <color=yellow>30<color> ph髏.",
    [9] = "Mau 甶 t譵 <color=yellow>%d<color> <color=yellow>%s<color>! Trong 1 ng祔 ho祅 th祅h <color=yellow>4<color> l莕 nhi謒 v� s� 頲 ph莕 thng th藅 phong ph�. Trc m総  ho祅 th祅h <color=yellow>%d<color> l莕 nhi謒 v�!",
    [10] = "Х nh薾 頲 tr筺g th竔 h� tr�!",
    [11] = "觤 s鴆 kh醗 hi謓 t筰 c馻 b筺 ng h祅h l�: <color=yellow>%d<color>. 觤 n﹏g c蕄 l�: <color=yellow>%d<color>.",
    [12] = "B筺 ng h祅h c莕 c� s鴆 kh醗 th藅 t鑤  trng th祅h, 甶觤 s鴆 kh醗 cao nh蕋 l� <color=yellow>300<color>, b筺 ng h祅h d鵤 v祇 甶觤 s鴆 kh醗  l猲 c蕄. \n<color=yellow>C竎h n﹏g c蕄: <color> 甶觤 s鴆 kh醗 c馻 b筺 ng h祅h s� t� ng gi秏, m鏸 l莕 gi秏 <color=yellow>10<color> 甶觤 s鴆 kh醗 v� t╪g <color=yellow>1<color> 甶觤 n﹏g c蕄. B筺 ng h祅h d鵤 v祇 甶觤 n﹏g c蕄  l猲 c蕄. C蕄 1  l猲 c蕄 2 c莕 <color=yellow>600<color> 甶觤 n﹏g c蕄 v� <color=yellow>1<color> long huy誸 ho祅.",
    [13] = "H穣 mau t譵 <color=yellow>%d<color> <color=yellow>%s<color> !",
    [14] = "C蕄 2 l猲 c蕄 3 c莕 <color=yellow>3600<color> 甶觤 n﹏g c蕄 v� <color=yellow>1<color> long huy誸 ho祅, <color=yellow>1<color> ph鬾g huy誸 ho祅g, <color=yellow>1<color> k� l﹏ ho祅, <color=yellow>1<color> chi課 th莕 ho祅. M鏸 l莕 n﹏g c蕄 xong h� th鑞g s� t� ng t 甶觤 n﹏g c蕄 th祅h <color=yellow>0<color>. \n<color=yellow>C竎h n﹏g c蕄: <color> c� th� s� d鬾g <color=yellow>t骾 th鵦 ph萴 <color>  t╪g 甶觤 s鴆 kh醗. B筺 ng h祅h c� c蕄 c祅g cao s� nh薾 頲 tr筺g th竔 h� tr� c祅g cao !",
    [15] = "Trang k�",
    [16] = "Trang trc",
    [17] = "tr� l筰",
    [18] = "Giao n筽 nhi謒 v� b筺 ng h祅h thng ng祔 th祅h c玭g!",
    [19] = "N﹏g c蕄 th祅h c玭g, b筺 ng h祅h c� c蕄 l� <color=yellow>2<color>!",
    [20] = "N﹏g c蕄 th祅h c玭g, b筺 ng h祅h c� c蕄 l� <color=yellow>3<color>!",
    [21] = "Hi謓 t筰 ng c蕄 c馻 b筺 ng h祅h <color=yellow>%d<color>, 甶觤 s鴆 kh醗 <color=yellow>%d<color>, 甶觤 n﹏g c蕄 <color=yellow>%d<color>.",
    [22] = "Nh薾 頲 %d 甶觤 qu﹏ c玭g",
    [23] = "H玬 nay i hi謕  ho祅 th祅h <color=yellow>%d<color> nhi謒 v�, c遪 c� th� ho祅 th祅h <color=yellow>%d<color> nhi謒 v�.",
}

VET_201003_TONGBAN_STR_YIN_DIALOG =             --门会印使用对话
{
    "Tri謚 h錳 b筺 ng h祅h" .. "/vet_201003_tongban_call_partner",
    "Nhi謒 v� b筺 ng h祅h thng ng祔" .. "/vet_201003_tongban_daily_task",
    "N﹏g c蕄 b筺 ng h祅h" .. "/vet_201003_tongban_upgrade_partner",
    "Nh薾 tr筺g th竔 h� tr�" .. "/vet_201003_tongban_get_assist",
    "R阨 kh醝" .. "/vet_201003_tongban_end_dialog",
}



VET_201003_TONGBAN_STR_DAILY_TASK =             --同伴日常任务接受交纳
{
    {"Nh薾 nhi謒 v� c蕄 1" .. "/vet_201003_tongban_get_task", "N閕 nhi謒 v� c蕄 1" .. "/vet_201003_tongban_hand_task","Hi觧 th� nhi謒 v�" .. "/vet_201003_tongban_show_task", "Hng d蒼 nhi謒 v� thng ng祔" .. "/vet_201003_tongban_task_explain", "Tr� l筰 trang trc" .. "/vet_201003_tongban_menghuiyin_in", "R阨 kh醝" .. "/vet_201003_tongban_end_dialog",},
    {"Nh薾 nhi謒 v� c蕄 2" .. "/vet_201003_tongban_get_task", "N閜 nhi謒 v� c蕄 2" .. "/vet_201003_tongban_hand_task","Hi觧 th� nhi謒 v�" .. "/vet_201003_tongban_show_task", "Hng d蒼 nhi謒 v� thng ng祔" .. "/vet_201003_tongban_task_explain", "Tr� l筰 trang trc" .. "/vet_201003_tongban_menghuiyin_in", "R阨 kh醝" .. "/vet_201003_tongban_end_dialog",},
    {"Nh薾 nhi謒 v� c蕄 3" .. "/vet_201003_tongban_get_task", "N閜 nhi謒 v� c蕄 3" .. "/vet_201003_tongban_hand_task","Hi觧 th� nhi謒 v�" .. "/vet_201003_tongban_show_task", "Hng d蒼 nhi謒 v� thng ng祔" .. "/vet_201003_tongban_task_explain", "Tr� l筰 trang trc" .. "/vet_201003_tongban_menghuiyin_in", "R阨 kh醝" .. "/vet_201003_tongban_end_dialog",},
}

VET_201003_TONGBAN_STR_UPGRADE_PARTNER = 
{
    [1] = "N﹏g c蕄 b筺 ng h祅h l猲 c蕄 2" .. "/#vet_201003_tongban_upgrade_partner_to(2)",
    [2] = "N﹏g c蕄 b筺 ng h祅h l猲 c蕄 3" .. "/#vet_201003_tongban_upgrade_partner_to(3)",
    [3] = "Xem 甶觤 n﹏g c蕄 v� 甶觤 s鴆 kh醗 b筺 ng h祅h" .. "/vet_201003_tongban_view_point",
    [4] = "襲 ki謓 n﹏g c蕄" .. "/vet_201003_tongban_upgrade_condition",
    [5] = "Tr� l筰 trang trc" .. "/vet_201003_tongban_menghuiyin_in",
    [6] = "R阨 kh醝" .. "/vet_201003_tongban_end_dialog",
}

VET_201003_TONGBAN_STR_DAILY_TASK_ERROR =        --同伴日常任务错误提示
{
    [1] = "V蒼 ch璦 nh薾 nhi謒 v�!",
    [2] = "V蒼 ch璦 ho祅 th祅h nhi謒 v�, h穣 甶 thu th藀 v藅 ph萴 nh�!",
    [3] = "V蒼 c遪 thi誹 <color=yellow>%d<color> 甶觤 n﹏g c蕄 m韎 c� th� l猲 c蕄 <color=yellow>%d<color>!",
    [4] = "B筺 ng h祅h  l猲 c蕄 <color=yellow>2<color>!",
    [5] = "B筺 ng h祅h  l猲 c蕄 <color=yellow>3<color>!",
    [6] = "Trc ti猲 ph秈 n﹏g c蕄 l猲 b筺 ng h祅h c蕄 <color=yellow>2<color> !",
    [7] = "H玬 nay  nh薾 <color=yellow>4<color> l莕 nhi謒 v�, ng祔 mai l筰 t韎 nh�!",
    [8] = "Gi穘 c竎h nh薾 nhi謒 v� thng ng祔 l� <color=yellow>30<color> ph髏, c遪 ph秈 i th猰 <color=yellow>%d<color> ph髏!",
    [9] = "V蒼 ch璦 ho祅 th祅h nhi謒 v� m�!",
    [10] = "N閜 nhi謒 v� th祅h c玭g,",
    [11] = "C竎 h� kh玭g ph秈 l� th祅h vi猲 c馻 long t� h閕, kh玭g th� s� d鬾g long t� 蕁!",
    [12] = "C竎 h� kh玭g ph秈 l� th祅h vi猲 c馻 ph鬾g t� h閕, kh玭g th� s� d鬾g ph鬾g t� 蕁!",
    [13] = "C竎 h� kh玭g ph秈 l� th祅h vi猲 c馻 h� t� h閕, kh玭g th� s� d鬾g h� t� 蕁!",
    [14] = "C竎 h� kh玭g ph秈 l� th祅h vi猲 c馻 璶g t� h閕, kh玭g th� s� d鬾g 璶g t� 蕁!",
    [15] = "C竎 h� v蒼 ch璦 chuy觧 sinh!",
    [16] = "Xin l鏸, tr猲 h祅h trang c竎 h� kh玭g c� long huy誸 ho祅, nhanh ch鉵g thu th藀 v藅 ph萴 nh�!",
    [17] = "Tr猲 h祅h trang kh玭g  long huy誸 ho祅, ph鬾g huy誸 ho祅, k� l﹏ ho祅, chi課 th莕 ho祅. Thu th藀 r錳 h絥g l祄 l筰 nh�!",
    [18] = "Чi hi謕 v蒼 ch璦 k輈h ho箃 t輓h n╪g b筺 ng h祅h!",
    [19] = "Чi hi謕 v蒼 ch璦 c� b筺 ng h祅h, h穣 nhanh ch鉵g k輈h ho箃 nh�!",
}


                         
VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK =        --越南同伴系统  日常任务
{
    {"B筩h C﹗ Ho祅",30, {2, 1, 270, 1}},
    {"L鬰 Th莕 ho祅",30, {2, 1, 1064, 1}},
    {"Tam Thanh ho祅",30, {2, 1, 1097, 1}},
    {"Qu﹏ C玭g Chng",10, {2, 1, 9999, 1}},
}

VET_201003_TONGBAN_TB_PARTNER_UPGRADE =           --越南同伴系统  同伴升级物品
{
    {"Long Huy誸 ho祅", {2, 1, 1002, 1}},
    {"Ph鬾g Huy誸 ho祅", {2, 1, 1004, 1}},
    {"K� L﹏ ho祅", {2, 1, 1003, 1}},
    {"Chi課 Th莕 ho祅", {2, 1, 1005, 1}},
}

PET_CHANGE_MALE_DLG =
{
	"Ch祇 c藆 ch�! H玬 nay m譶h l祄 g� y?",
	"Ch祇 c藆 ch�! Nghe n鉯 � Bi謓 Kinh c� nh nhau k譨! ",
	"Ch祇 c藆 ch�! M蕐 ngi kia nh譶 m譶h th蕐 gh衪 qu�!",
	"Ch祇 c藆 ch�! M譶h b藅 PK l猲 ch� ?",
	"Ch祇 c藆 ch�! M譶h ra T﹜ Th祅h Й ch琲 甶!",
	"Ch祇 c藆 ch�! M譶h 甶 tr錸g B竧 Nh� 甶!",
	"Ch祇 c藆 ch�! Ch� kia d� thng qu� k譨!",
	"Ch祇 c藆 ch�! M譶h ra B綾 Tuy襫 Ch﹗ ch琲 甶!",
	"Ch祇 c藆 ch�! Ch琲 Game nh� gi� g譶 s鴆 kh醗 nha!",
	"Ch祇 c藆 ch�! M譶h 甶 thu th藀 T鑞g Li猽 t礽 nguy猲 甶!",
}

PET_CHANGE_FEMALE_DLG =
{
	"Ch祇 c� ch�! H玬 nay m譶h l祄 g� y?",
	"Ch祇 c� ch�! Nghe n鉯 � Bi謓 Kinh c� nh nhau k譨! ",
	"Ch祇 c� ch�! M蕐 ngi kia nh譶 m譶h th蕐 gh衪 qu�!",
	"Ch祇 c� ch�! M譶h b藅 PK l猲 ch� ?",
	"Ch祇 c� ch�! M譶h ra T﹜ Th祅h Й ch琲 甶!",
	"Ch祇 c� ch�! M譶h 甶 tr錸g B竧 Nh� 甶!",
	"Ch祇 c� ch�! Anh kia p trai qu� k譨!",
	"Ch祇 c� ch�! M譶h ra B綾 Tuy襫 Ch﹗ ch琲 甶!",
	"Ch祇 c� ch�! Ch琲 Game nh� gi� g譶 s鴆 kh醗 nha!",
	"Ch祇 c� ch�! M譶h 甶 thu th藀 T鑞g Li猽 t礽 nguy猲 甶!",
}

PET_RANDOM_CHAT_DLG =
{
	"C竔 n祔 th� c遪 t飝! M� ch綾 c騨g s緋 r錳.",
	"C遪 ch璦  tu鎖  h醝 c﹗ n祔 u, ng li襲!",
	"N鉯 chung l� ng r錳! ng ngh� g� n鱝.",
	"аp m� sao h醝 kh� qu� dz藋 ?",
	"Th藅 v藋 sao? Ngh� k� c騨g ng .",
	"C騨g 頲! nh璶g n m颽 鎖 n╩ sau ch綾 m韎 頲.",
	"T﹎ tr筺g kh玭g vui, l竧 b� tr� l阨!",
	"H醝 th� th� sao b� tr� l阨!",
	"Chu萵 kh玭g c莕 ch豱h!",
	"B� c遪 th輈h n鱝 n鉯 chi l� ai!",
}

PET_BUFF_TYPE =
{
	[4] = {"Kh竛g t蕋 c� +3", 1, {"state_add_allability", 3}},
}