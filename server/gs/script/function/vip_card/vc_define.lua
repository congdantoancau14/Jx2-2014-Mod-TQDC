DebugOutput = nothing
--µ±Ç°Ê¹ÓÃµÄÎäÁÖvip¿¨Ë÷Òý
--\settings\vip_card.txt
--VC_CURRENT_ID = 1;
--VC_CURRENT_ID = 2;
--VC_CURRENT_ID = 3;
--VC_CURRENT_ID = 4;
VC_CURRENT_ID = 5;
TASKID_VC_VALUE_FLAG = 3239;
TASKID_VC_AUTO_FINISH_TIMES = 3241;
TASKID_VC_DAILY_TASK_FLAG = 3240;
TASKID_VC_DAILY_TASK_1 = 3242;
TASKID_VC_DAILY_TASK_2 = 3243;
TASKID_VC_DAILY_TASK_3 = 3253;

--¼ÇÂ¼¾ßÌåÈÎÎñÍê³ÉÇé¿ö£¨°´×Ö½Ú¼ÇÂ¼£©(VIP_CARD_IDË÷Òý)
VC_DAILY_TASK = {
	[5] = 
	{
		[1] = {
			Options = "Phã b¶n" ,
			Content = {
				{"L­¬ng S¬n B¹c ¶i 8", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "L­¬ng S¬n B¹c ¶i 8", "Hu©n ch­¬ng anh hïng", 60, 6000000)},
				{"§Þa HuyÒn Cung ¶i 7", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "§Þa HuyÒn Cung ¶i 7", "Hu©n ch­¬ng anh hïng", 60, 6000000)},
				{"V¹n KiÕm Tròng ¶i 4", 3, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "V¹n KiÕm Tròng ¶i 4", "Hu©n ch­¬ng anh hïng", 60, 6000000)},
				{"V­ît qua PhÇn Thiªn L©m-Th¸i NhÊt Th¸p_Th­êng", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "V­ît qua PhÇn Thiªn L©m-Th¸i NhÊt Th¸p_Th­êng", "Hu©n ch­¬ng anh hïng", 60, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 2,
			AutoFinish = {2, 97, 236, 5, "Thiªn Kiªu LÖnh"},
			Award = "vc_Award_2_1()",
		},	
		[2] = {
			Options = "ChiÕn tr­êng" ,
			Content = {
				{"ChiÕn th¾ng trong Thiªn M«n TrËn", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "ChiÕn th¾ng trong Thiªn M«n TrËn", "Cæ Linh Ngäc", 40, 6000000)},
				{"Tham gia Thiªn M«n TrËn", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Tham gia Thiªn M«n TrËn", "Cæ Linh Ngäc", 40, 6000000)},
				{"Tham gia chiÕn tr­êng lín Nh¹n M«n Quan vµ nhËn th­ëng", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Tham gia chiÕn tr­êng lín Nh¹n M«n Quan vµ nhËn th­ëng", "Cæ Linh Ngäc", 40, 6000000)},
				{"Tham gia chiÕn tr­êng nhá bÊt kú vµ nhËn th­ëng", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Tham gia chiÕn tr­êng nhá bÊt kú vµ nhËn th­ëng", "Cæ Linh Ngäc", 40, 6000000)},
				{"¢n O¸n §µi_Giµnh th¾ng lîi vµ nhËn th­ëng", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Tham gia ¢n O¸n §µi giµnh th¾ng lîi vµ nhËn th­ëng", "Cæ Linh Ngäc", 40, 6000000)},
			},
			RandType = 2,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 4,
			AutoFinish = {2, 97, 236, 3, "Thiªn Kiªu LÖnh"},
			Award = "vc_Award_2_2()",
		},	
		[3] = {
			Options = "T¨ng thªm" ,
			Content = {
				{"T¨ng cÊp trang bÞ", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "T¨ng cÊp trang bÞ", "Cæ Linh Th¹ch", 50, 6000000)},
				{"D­ìng thµnh trang bÞ", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "D­ìng thµnh trang bÞ", "Cæ Linh Th¹ch", 50, 6000000)},
				{"Trång C©y B¸t Nh· Nhá", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Trång C©y B¸t Nh· Nhá", "Cæ Linh Th¹ch", 50, 6000000)},
				{"Trång C©y B¸t Nh·", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Trång C©y B¸t Nh·", "Cæ Linh Th¹ch", 50, 6000000)},
				{"Më Tói H¹t Gièng", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Më Tói H¹t Gièng", "Cæ Linh Th¹ch", 50, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 2,
			AutoFinish = {2, 97, 236, 2, "Thiªn Kiªu LÖnh"},
			Award = "vc_Award_2_3()",
		},	
	},
}

VC_VALUE_AWARD = {
	[5] = {
		[1]  = {1000, 1, {2, 1, 30499, 200},  "Hu©n Ch­¬ng Anh Hïng"},
		[2]  = {2000, 1, {2, 1, 30368, 200}, "Cæ Linh Th¹ch"},
		[3]  = {3000, 1, {2, 1, 30369, 200},  "Cæ Linh Ngäc"},
		[4]  = {5000, 1, {2, 1, 30687, 150},  "Th¸i NhÊt LÖnh"},
		[5]  = {7000, 1, {2, 1, 30370, 1},  "Thiªn M«n Kim LÖnh"},
		[6]  = {9000, 1, {2, 95, 204, 1},  "Thiªn Cang LÖnh"},
		[7]  = {11000, 1, {2, 1, 30499, 25},  "Háa Phông Tinh Hoa"},
		[8]  = {13000, 1, {2, 1, 30370, 1},  "Thiªn M«n Kim LÖnh"},
		[9]  = {15000, 1, {2, 95, 204, 1},  "Thiªn Cang LÖnh"},
		[10]  = {17000, 1, {2, 1, 30498, 1,},  "Háa Phông Hån"},
	},
}