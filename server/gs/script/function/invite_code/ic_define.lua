Include("\\script\\lib\\globalfunctions.lua")
--����
DebugOutput = nothing

--�����ʱ��
IC_START_TIME = {2015,07,04,0,0,0};
IC_END_TIME = {2015,08,21,0,0,0};

--����������
IC_TASK_GROUP = {8, 13};

--��������
IC_INVITE_CODE_SALT = "8kNPNKe4QS0FkBAw0K05GSWp0YWpAWZJ"

--ʹ�õ����ݿ������
IC_MYSQL_TABLE_NAME = "invite_code_1507"

--������Ϊ����
IC_QUERY_TYPE_REG = 1; --ע��
IC_QUERY_TYPE_QRY	= 2; --��ѯ
IC_QUERY_TYPE_MDY = 3; --�޸�

--�������ʱ��s
IC_CLICK_TIME = 15;

--�����߽�������
IC_FINISH_INVITE_TYPE1 = 1; --5ת90��
IC_FINISH_INVITE_TYPE2 = 2; --6ת90��
IC_FINISH_INVITE_TYPE3 = 3; --�����¿�
IC_FINISH_INVITE_TYPE4 = 4; --��������2000XU
IC_FINISH_INVITE_TYPE5 = 5; --��������5000XU

IC_FINISH_INVITE_TYPE6 = 6; --�������3������
IC_FINISH_INVITE_TYPE7 = 7; --�������4������
IC_FINISH_INVITE_TYPE8 = 8; --�������5������

function ck_GiveRandGem456()
	--Faction Cloth 9
	local VET_RandGem456 = {
        {1,9, "Huy�tTr�chTh�ch Lv4", {2,22,104,1},nil,nil,nil,nil},
        {1,9, "Nguy�tB�chTh�ch Lv4", {2,22,204,1},nil,nil,nil,nil},
        {1,9, "H� Ph�ch Th�ch C�p 4", {2,22,304,1},nil,nil,nil,nil},
        {1,9, "H�c Di�u Th�ch C�p 4", {2,22,404,1},nil,nil,nil,nil},
        {1,8, "Huy�tTr�chTh�ch Lv5", {2,22,105,1},nil,nil,nil,1},
        {1,8, "Nguy�tB�chTh�ch Lv5", {2,22,205,1},nil,nil,nil,1},
        {1,8, "H� Ph�ch Th�ch C�p 5", {2,22,305,1},nil,nil,nil,1},
        {1,8, "H�c Di�u Th�ch C�p 5", {2,22,405,1},nil,nil,nil,1},
        {1,8, "Huy�tTr�chTh�ch Lv6", {2,22,106,1},nil,nil,nil,1},
        {1,8, "Nguy�tB�chTh�ch Lv6", {2,22,206,1},nil,nil,nil,1},
        {1,8, "H� Ph�ch Th�ch C�p 6", {2,22,306,1},nil,nil,nil,1},
        {1,8, "H�c Di�u Th�ch C�p 6", {2,22,406,1},nil,nil,nil,1},
	} 
	gf_EventGiveRandAward(VET_RandGem456,100,1, "CDKEY", "CDKEY")
end

function ck_GiveRandGem345()
	--Faction Cloth 9
	local VET_RandGem345 = {
        {1,8, "Huy�tTr�chTh�ch Lv3", {2,22,103,1},nil,nil,nil,nil},
        {1,8, "Nguy�tB�chTh�ch Lv3", {2,22,203,1},nil,nil,nil,nil},
        {1,8, "H� Ph�ch Th�ch C�p 3", {2,22,303,1},nil,nil,nil,nil},
        {1,8, "H�c Di�u Th�ch C�p 3", {2,22,403,1},nil,nil,nil,nil},
        {1,9, "Huy�tTr�chTh�ch Lv4", {2,22,104,1},nil,nil,nil,nil},
        {1,9, "Nguy�tB�chTh�ch Lv4", {2,22,204,1},nil,nil,nil,nil},
        {1,9, "H� Ph�ch Th�ch C�p 4", {2,22,304,1},nil,nil,nil,nil},
        {1,9, "H�c Di�u Th�ch C�p 4", {2,22,404,1},nil,nil,nil,nil},
        {1,8, "Huy�tTr�chTh�ch Lv5", {2,22,105,1},nil,nil,nil,1},
        {1,8, "Nguy�tB�chTh�ch Lv5", {2,22,205,1},nil,nil,nil,1},
        {1,8, "H� Ph�ch Th�ch C�p 5", {2,22,305,1},nil,nil,nil,1},
        {1,8, "H�c Di�u Th�ch C�p 5", {2,22,405,1},nil,nil,nil,1},
	} 
	gf_EventGiveRandAward(VET_RandGem345,100,1, "CDKEY", "CDKEY")
end

function ck_GiveRandGem56()
	--Faction Cloth 9
	local VET_RandGem456 = {
        {1,13, "Huy�tTr�chTh�ch Lv5", {2,22,105,1},nil,nil,nil,1},
        {1,13, "Nguy�tB�chTh�ch Lv5", {2,22,205,1},nil,nil,nil,1},
        {1,13, "H� Ph�ch Th�ch C�p 5", {2,22,305,1},nil,nil,nil,1},
        {1,13, "H�c Di�u Th�ch C�p 5", {2,22,405,1},nil,nil,nil,1},
        {1,12, "Huy�tTr�chTh�ch Lv6", {2,22,106,1},nil,nil,nil,1},
        {1,12, "Nguy�tB�chTh�ch Lv6", {2,22,206,1},nil,nil,nil,1},
        {1,12, "H� Ph�ch Th�ch C�p 6", {2,22,306,1},nil,nil,nil,1},
        {1,12, "H�c Di�u Th�ch C�p 6", {2,22,406,1},nil,nil,nil,1},
	} 
	gf_EventGiveRandAward(VET_RandGem456,100,1, "CDKEY", "CDKEY")
end

IC_T_YUNLING5 = {
    {1, 2, "H-Li�t Nham-Lv5", {0, 148, 69},nil,nil,nil,nil},
    {1, 2, "H-Ph� Kh�ng-Lv5", {0, 148, 70},nil,nil,nil,nil},
    {1, 2, "H-T�y Ki�m-Lv5", {0, 148, 71},nil,nil,nil,nil},
    {1, 2, "H-T�t Phong-Lv5", {0, 148, 72},nil,nil,nil,nil},
    {1, 2, "H-T�n V�-Lv5", {0, 148, 73},nil,nil,nil,nil},
    {1, 2, "H-�ng T�p-Lv5", {0, 148, 74},nil,nil,nil,nil},
    {1, 2, "H-Linh T�m-Lv5", {0, 148, 75},nil,nil,nil,nil},
    {1, 2, "H-Th�n L�c-Lv5", {0, 148, 76},nil,nil,nil,nil},
    {1, 2, "H-Ng�ng Th�n-Lv5", {0, 148, 77},nil,nil,nil,nil},
    {1, 2, "H-V� Gian-Lv5", {0, 148, 78},nil,nil,nil,nil},
    {1, 2, "H-V� C�c-Lv5", {0, 148, 79},nil,nil,nil,nil},
    {1, 2, "H-Cu�ng Nh�n-Lv5", {0, 148, 80},nil,nil,nil,nil},
    {1, 2, "H-L�ng Nhu�-Lv5", {0, 148, 81},nil,nil,nil,nil},
    {1, 2, "H-Linh Vi�n-Lv5", {0, 148, 82},nil,nil,nil,nil},
    {1, 2, "H-H�i V�n-Lv5", {0, 148, 83},nil,nil,nil,nil},
    {1, 2, "H-H�i T�m-Lv5", {0, 148, 84},nil,nil,nil,nil},
    {1, 2, "C-Li�t Nham-Lv5", {0, 149, 70},nil,nil,nil,nil},
    {1, 2, "C-Ph� Kh�ng-Lv5", {0, 149, 71},nil,nil,nil,nil},
    {1, 2, "C-T�y Ki�m-Lv5", {0, 149, 72},nil,nil,nil,nil},
    {1, 2, "C-T�t Phong-Lv5", {0, 149, 73},nil,nil,nil,nil},
    {1, 2, "C-T�n V�-Lv5", {0, 149, 74},nil,nil,nil,nil},
    {1, 2, "C-Qu�n Th�ch-Lv5", {0, 149, 75},nil,nil,nil,nil},
    {1, 2, "C-N� Ng�m-Lv5", {0, 149, 76},nil,nil,nil,nil},
    {1, 2, "C-Xuy�n V�n-Lv5", {0, 149, 77},nil,nil,nil,nil},
    {1, 2, "C-Th�n L�c-Lv5", {0, 149, 78},nil,nil,nil,nil},
    {1, 2, "C-Ng�ng Th�n-Lv5", {0, 149, 79},nil,nil,nil,nil},
    {1, 2, "C-V� Gian-Lv5", {0, 149, 80},nil,nil,nil,nil},
    {1, 2, "C-V� C�c-Lv5", {0, 149, 81},nil,nil,nil,nil},
    {1, 2, "C-Cu�ng Nh�n-Lv5", {0, 149, 82},nil,nil,nil,nil},
    {1, 2, "C-L�ng Nhu�-Lv5", {0, 149, 83},nil,nil,nil,nil},
    {1, 2, "C-Linh Vi�n-Lv5", {0, 149, 84},nil,nil,nil,nil},
    {1, 2, "C-H�i V�n-Lv5", {0, 149, 85},nil,nil,nil,nil},
    {1, 2, "C-H�i T�m-Lv5", {0, 149, 86},nil,nil,nil,nil},
    {1, 2, "T-Li�t Nham-Lv5", {0, 150, 69},nil,nil,nil,nil},
    {1, 2, "T-Ph� Kh�ng-Lv5", {0, 150, 70},nil,nil,nil,nil},
    {1, 2, "T-T�y Ki�m-Lv5", {0, 150, 71},nil,nil,nil,nil},
    {1, 2, "T-T�t Phong-Lv5", {0, 150, 72},nil,nil,nil,nil},
    {1, 2, "T-T�n V�-Lv5", {0, 150, 73},nil,nil,nil,nil},
    {1, 2, "T-V� L��ng-Lv5", {0, 150, 74},nil,nil,nil,nil},
    {1, 2, "T-M�c Minh-Lv5", {0, 150, 75},nil,nil,nil,nil},
    {1, 2, "T-Th�n L�c-Lv5", {0, 150, 76},nil,nil,nil,nil},
    {1, 2, "T-Ng�ng Th�n-Lv5", {0, 150, 77},nil,nil,nil,nil},
    {1, 2, "T-V� Gian-Lv5", {0, 150, 78},nil,nil,nil,nil},
    {1, 2, "T-V� C�c-Lv5", {0, 150, 79},nil,nil,nil,nil},
    {1, 2, "T-Cu�ng Nh�n-Lv5", {0, 150, 80},nil,nil,nil,nil},
    {1, 2, "T-L�ng Nhu�-Lv5", {0, 150, 81},nil,nil,nil,nil},
    {1, 2, "T-Linh Vi�n-Lv5", {0, 150, 82},nil,nil,nil,nil},
    {1, 3, "T-H�i V�n-Lv5", {0, 150, 83},nil,nil,nil,nil},
    {1, 3, "T-H�i T�m-Lv5", {0, 150, 84},nil,nil,nil,nil},
}

IC_T_YUNLING6 = {
    {1, 2, "H-Li�t Nham-Lv6", {0, 148, 85},nil,nil,nil,nil},
    {1, 2, "H-Ph� Kh�ng-Lv6", {0, 148, 86},nil,nil,nil,nil},
    {1, 2, "H-T�y Ki�m-Lv6", {0, 148, 87},nil,nil,nil,nil},
    {1, 2, "H-T�t Phong-Lv6", {0, 148, 88},nil,nil,nil,nil},
    {1, 2, "H-T�n V�-Lv6", {0, 148, 89},nil,nil,nil,nil},
    {1, 2, "H-�ng T�p-Lv6", {0, 148, 90},nil,nil,nil,nil},
    {1, 2, "H-Linh T�m-Lv6", {0, 148, 91},nil,nil,nil,nil},
    {1, 2, "H-Th�n L�c-Lv6", {0, 148, 92},nil,nil,nil,nil},
    {1, 2, "H-Ng�ng Th�n-Lv6", {0, 148, 93},nil,nil,nil,nil},
    {1, 2, "H-V� Gian-Lv6", {0, 148, 94},nil,nil,nil,nil},
    {1, 2, "H-V� C�c-Lv6", {0, 148, 95},nil,nil,nil,nil},
    {1, 2, "H-Cu�ng Nh�n-Lv6", {0, 148, 96},nil,nil,nil,nil},
    {1, 2, "H-L�ng Nhu�-Lv6", {0, 148, 97},nil,nil,nil,nil},
    {1, 2, "H-Linh Vi�n-Lv6", {0, 148, 98},nil,nil,nil,nil},
    {1, 2, "H-H�i V�n-Lv6", {0, 148, 99},nil,nil,nil,nil},
    {1, 2, "H-H�i T�m-Lv6", {0, 148, 100},nil,nil,nil,nil},
    {1, 2, "C-Li�t Nham-Lv6", {0, 149, 87},nil,nil,nil,nil},
    {1, 2, "C-Ph� Kh�ng-Lv6", {0, 149, 88},nil,nil,nil,nil},
    {1, 2, "C-T�y Ki�m-Lv6", {0, 149, 89},nil,nil,nil,nil},
    {1, 2, "C-T�t Phong-Lv6", {0, 149, 90},nil,nil,nil,nil},
    {1, 2, "C-T�n V�-Lv6", {0, 149, 91},nil,nil,nil,nil},
    {1, 2, "C-Qu�n Th�ch-Lv6", {0, 149, 92},nil,nil,nil,nil},
    {1, 2, "C-N� Ng�m-Lv6", {0, 149, 93},nil,nil,nil,nil},
    {1, 2, "C-Xuy�n V�n-Lv6", {0, 149, 94},nil,nil,nil,nil},
    {1, 2, "C-Th�n L�c-Lv6", {0, 149, 95},nil,nil,nil,nil},
    {1, 2, "C-Ng�ng Th�n-Lv6", {0, 149, 96},nil,nil,nil,nil},
    {1, 2, "C-V� Gian-Lv6", {0, 149, 97},nil,nil,nil,nil},
    {1, 2, "C-V� C�c-Lv6", {0, 149, 98},nil,nil,nil,nil},
    {1, 2, "C-Cu�ng Nh�n-Lv6", {0, 149, 99},nil,nil,nil,nil},
    {1, 2, "C-L�ng Nhu�-Lv6", {0, 149, 100},nil,nil,nil,nil},
    {1, 2, "C-Linh Vi�n-Lv6", {0, 149, 101},nil,nil,nil,nil},
    {1, 2, "C-H�i V�n-Lv6", {0, 149, 102},nil,nil,nil,nil},
    {1, 2, "C-H�i T�m-Lv6", {0, 149, 103},nil,nil,nil,nil},
    {1, 2, "T-Li�t Nham-Lv6", {0, 150, 85},nil,nil,nil,nil},
    {1, 2, "T-Ph� Kh�ng-Lv6", {0, 150, 86},nil,nil,nil,nil},
    {1, 2, "T-T�y Ki�m-Lv6", {0, 150, 87},nil,nil,nil,nil},
    {1, 2, "T-T�t Phong-Lv6", {0, 150, 88},nil,nil,nil,nil},
    {1, 2, "T-T�n V�-Lv6", {0, 150, 89},nil,nil,nil,nil},
    {1, 2, "T-V� L��ng-Lv6", {0, 150, 90},nil,nil,nil,nil},
    {1, 2, "T-M�c Minh-Lv6", {0, 150, 91},nil,nil,nil,nil},
    {1, 2, "T-Th�n L�c-Lv6", {0, 150, 92},nil,nil,nil,nil},
    {1, 2, "T-Ng�ng Th�n-Lv6", {0, 150, 93},nil,nil,nil,nil},
    {1, 2, "T-V� Gian-Lv6", {0, 150, 94},nil,nil,nil,nil},
    {1, 2, "T-V� C�c-Lv6", {0, 150, 95},nil,nil,nil,nil},
    {1, 2, "T-Cu�ng Nh�n-Lv6", {0, 150, 96},nil,nil,nil,nil},
    {1, 2, "T-L�ng Nhu�-Lv6", {0, 150, 97},nil,nil,nil,nil},
    {1, 2, "T-Linh Vi�n-Lv6", {0, 150, 98},nil,nil,nil,nil},
    {1, 3, "T-H�i V�n-Lv6", {0, 150, 99},nil,nil,nil,nil},
    {1, 3, "T-H�i T�m-Lv6", {0, 150, 100},nil,nil,nil,nil},
}

function giveYunLing5()
	gf_EventGiveRandAward(IC_T_YUNLING5,100,1, "CDKEY", "CDKEY")
end

function giveYunLing6()
	gf_EventGiveRandAward(IC_T_YUNLING6,100,1, "CDKEY", "CDKEY")
end

--�����߽���
IC_YAOQING_AWARD = {
	[1] = {"item",		1, 	"Hu�n ch��ng anh h�ng", {2,1,30499,4}},
	[2] = {"item", 		6, 	"Thi�t tinh c�p 4", 	{2,1,30612,10,4}},
	[3] = {"func", 		12, "Th� C��i: L�c �� X�m", {0,105,149,1,4}, 30 * 24 * 3600},
	[4] = {"item", 		24, "Thi�n Th�ch linh th�ch", {2,1,1068,1,4}},
	[5] = {"func", 		36, "�� Qu� C�p 3-5 (Ng�u nhi�n)", ck_GiveRandGem345},
	[6] = {"item", 		50, "Thi�n Cang L�nh", {2,95,204,1}},
	[7] = {"item", 		60, "H�a Th� B�ch", {2,1,1001,1,4}},
	[8] = {"func", 		80, "U�n Linh C�p 6", giveYunLing6},
}

--����
IC_YAOYANG_JIEZI_1 = {
	{"Di�u D��ng-� L�n B�o Gi�i", {0, 102, 3176, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-T� Giao Ng�c B�i", {0, 102, 3178, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-V�n H� L�nh", {0, 102, 3180, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-X�ch T��c Ho�n", {0, 102, 3182, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-B�ch Quy Li�n", {0, 102, 3184, 1, 4, -1, -1, -1, -1, -1, -1}},
}

IC_YAOYANG_JIEZI_2 = {
	{"Di�u D��ng To�i Ho�ng-� L�n B�o Gi�i", {0, 102, 3185, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng To�i Ho�ng-T� Giao Ng�c B�i", {0, 102, 3186, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng To�i Ho�ng-V�n H� L�nh", {0, 102, 3187, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng To�i Ho�ng-X�ch T��c Ho�n", {0, 102, 3188, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng To�i Ho�ng-B�ch Quy Li�n", {0, 102, 3189, 1, 4, -1, -1, -1, -1, -1, -1}},
}
