DebugOutput = nothing
--��ǰʹ�õ�����vip������
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

--��¼�������������������ֽڼ�¼��(VIP_CARD_ID����)
VC_DAILY_TASK = {
	[5] = 
	{
		[1] = {
			Options = "Ph� b�n" ,
			Content = {
				{"L��ng S�n B�c �i 8", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "L��ng S�n B�c �i 8", "Hu�n ch��ng anh h�ng", 60, 6000000)},
				{"��a Huy�n Cung �i 7", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "��a Huy�n Cung �i 7", "Hu�n ch��ng anh h�ng", 60, 6000000)},
				{"V�n Ki�m Tr�ng �i 4", 3, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "V�n Ki�m Tr�ng �i 4", "Hu�n ch��ng anh h�ng", 60, 6000000)},
				{"V��t qua Ph�n Thi�n L�m-Th�i Nh�t Th�p_Th��ng", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "V��t qua Ph�n Thi�n L�m-Th�i Nh�t Th�p_Th��ng", "Hu�n ch��ng anh h�ng", 60, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 2,
			AutoFinish = {2, 97, 236, 5, "Thi�n Ki�u L�nh"},
			Award = "vc_Award_2_1()",
		},	
		[2] = {
			Options = "Chi�n tr��ng" ,
			Content = {
				{"Chi�n th�ng trong Thi�n M�n Tr�n", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Chi�n th�ng trong Thi�n M�n Tr�n", "C� Linh Ng�c", 40, 6000000)},
				{"Tham gia Thi�n M�n Tr�n", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tham gia Thi�n M�n Tr�n", "C� Linh Ng�c", 40, 6000000)},
				{"Tham gia chi�n tr��ng l�n Nh�n M�n Quan v� nh�n th��ng", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tham gia chi�n tr��ng l�n Nh�n M�n Quan v� nh�n th��ng", "C� Linh Ng�c", 40, 6000000)},
				{"Tham gia chi�n tr��ng nh� b�t k� v� nh�n th��ng", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tham gia chi�n tr��ng nh� b�t k� v� nh�n th��ng", "C� Linh Ng�c", 40, 6000000)},
				{"�n O�n ��i_Gi�nh th�ng l�i v� nh�n th��ng", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tham gia �n O�n ��i gi�nh th�ng l�i v� nh�n th��ng", "C� Linh Ng�c", 40, 6000000)},
			},
			RandType = 2,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 4,
			AutoFinish = {2, 97, 236, 3, "Thi�n Ki�u L�nh"},
			Award = "vc_Award_2_2()",
		},	
		[3] = {
			Options = "T�ng th�m" ,
			Content = {
				{"T�ng c�p trang b�", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "T�ng c�p trang b�", "C� Linh Th�ch", 50, 6000000)},
				{"D��ng th�nh trang b�", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "D��ng th�nh trang b�", "C� Linh Th�ch", 50, 6000000)},
				{"Tr�ng C�y B�t Nh� Nh�", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tr�ng C�y B�t Nh� Nh�", "C� Linh Th�ch", 50, 6000000)},
				{"Tr�ng C�y B�t Nh�", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tr�ng C�y B�t Nh�", "C� Linh Th�ch", 50, 6000000)},
				{"M� T�i H�t Gi�ng", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "M� T�i H�t Gi�ng", "C� Linh Th�ch", 50, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 2,
			AutoFinish = {2, 97, 236, 2, "Thi�n Ki�u L�nh"},
			Award = "vc_Award_2_3()",
		},	
	},
}

VC_VALUE_AWARD = {
	[5] = {
		[1]  = {1000, 1, {2, 1, 30499, 200},  "Hu�n Ch��ng Anh H�ng"},
		[2]  = {2000, 1, {2, 1, 30368, 200}, "C� Linh Th�ch"},
		[3]  = {3000, 1, {2, 1, 30369, 200},  "C� Linh Ng�c"},
		[4]  = {5000, 1, {2, 1, 30687, 150},  "Th�i Nh�t L�nh"},
		[5]  = {7000, 1, {2, 1, 30370, 1},  "Thi�n M�n Kim L�nh"},
		[6]  = {9000, 1, {2, 95, 204, 1},  "Thi�n Cang L�nh"},
		[7]  = {11000, 1, {2, 1, 30499, 25},  "H�a Ph�ng Tinh Hoa"},
		[8]  = {13000, 1, {2, 1, 30370, 1},  "Thi�n M�n Kim L�nh"},
		[9]  = {15000, 1, {2, 95, 204, 1},  "Thi�n Cang L�nh"},
		[10]  = {17000, 1, {2, 1, 30498, 1,},  "H�a Ph�ng H�n"},
	},
}