--���ݶ���

--szLogTitle = "���˻";
--szLogTitle = "��ȼʥ��";
szLogTitle = "Ho�t ��ng Th�nh H�a ��n"

Flame_Table = {
	{2,1,30750,1,"H�ng S�c Th�nh H�a Th�ch"},
	{2,1,30751,1,"L�c S�c Th�nh H�a Th�ch"},
	{2,1,30749,1,"Ho�ng S�c Th�nh H�a Th�ch"},
	{2,1,30752,1,"Lam S�c Th�nh H�a Th�ch"},
	{2,1,30748,1,"H�c S�c Th�nh H�a Th�ch"},
}

WuCai_Shenshi = {2,1,30403,1,"Ng� Th�i Th�n Th�ch"};
WuCai_ShenHuoZhong = {2,1,30753,1,"Ng� S�c Th�nh H�a Th�ch"}

Compose_ShengHuo_Num_1 = 5; --1��ʥ��ʯ
Compose_ShenShi_Num_1 = 1; --1�������ʯ

Compose_ShengHuo_Num_2 = 9; --9��ʥ��ʯ
Compose_Coin_Num_2 = 50; --��

OLY_IB_FIRE_MAX_NUM = 30;--��������

Guess_Flag = 99; --�¶����ֱ�ʶֵ
OLY_MAX_RAND = 100; --random���ֵ
OLY_MAX_GUESS = 5; --�������ִ���
OLY_MAX_AWARD_NUM = 3; --��������

--��¼�������Ŀ
Glb_Oly_TGL_NUM = 2016;

--��������ʱ���s
OLY_TIME_START = 21 * 3600;
OLY_TIME_MID = OLY_TIME_START + 1800;
OLY_TIME_END = OLY_TIME_START + 3600;
OLY_MAX_LUCK_NUM = 9999; --�������������

--��¼����21��relay���ɵ�������
Glb_Oly_Luck_NUM = 2017;

--Relay�������ݽṹ
OLY_SHARE_STRING = "aok"
OLY_SHARE_ITEM = "ok"
OLY_SHARE_KEY1 = "key1_201412"
OLY_SHARE_KEY2 = "key2_201412"
OLY_SHARE_KEY3 = "key3_201412"

--��¼�������������Ŀ
Oly_Record = {
	szKey = OLY_SHARE_STRING..OLY_SHARE_KEY1,
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = OLY_SHARE_ITEM..OLY_SHARE_KEY1,
}
--Relay���������������
Oly_Record2 = {
	szKey = OLY_SHARE_STRING..OLY_SHARE_KEY2,
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = OLY_SHARE_ITEM..OLY_SHARE_KEY2,
}
--��¼���������н�����
Oly_Record3 = {
	szKey = OLY_SHARE_STRING..OLY_SHARE_KEY3,
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = OLY_SHARE_ITEM..OLY_SHARE_KEY3,
}

--���Ǽ���Ŀ
MAX_WIN_NUM = 10;

--�����Ƭ�һ������
OLY_EXCHANGE_BASE = 1000;

--
OLY_EXP_2 = 666000;
OLY_EXP_3 = 999000;


