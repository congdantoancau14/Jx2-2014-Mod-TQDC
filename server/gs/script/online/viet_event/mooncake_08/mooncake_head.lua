--File name:	mooncake_head.lua
--Describe:		����head�ļ�
--Create Date:	2008-08-18
--Author:		chenbenqian

SWITCH_08_MOONCAKE_VIET	= 1;

DATE_08_MOONCAKE_VIET_START	= 09;			-- ������ʼ����
DATE_08_MOONCAKE_VIET_END	= 10;			-- ������������

TOTALEXP_08_MOONCAKE_VIET = 2455					--��¼ʹ���±���õ��ܹ��ľ���
FIRE_TIME_08_MOONCAKE_VIET = 2456					--��¼���(���ɻ�¯)��ʱ��
CAKE_TYPE_08_MOONCAKE_VIET = 2457					--��¼�տ��±�������
BURNER_IDX_08_MOONCAKE_VIET = 2458					--��¼��¯npc������
WOOD_NUM_08_MOONCAKE_VIET = 2459					--��¼�ɹ���ľ�ĵĸ���
OBTAIN_CAKE_08_MOONCAKE_VIET = 2460					--��¼�Ƿ���ȡ���±�
LUCKY_DATE_08_MOONCAKE_VIET = 2461					--��¼����������˵���������
LUCKY_TIMES_08_MOONCAKE_VIET = 2462					--��¼����������˵����Ĵ���
WOOD_TIME_08_MOONCAKE_VIET = 2463					--��¼��ľ���ʱ��
CAKE_DATE_08_MOONCAKE_VIET = 2464					--��¼���±�������

RELAY_DB_08_MOONCAKE_VIET = "mooncake_event_08_viet"		--�������ݿ��ַ�����ʶ

g_nExpTotal_MoonCakeViet = 50000000					--����ʹ���±��ɻ�õ��ܹ�����ֵ
g_nTime_MoonCakeViet = 300							--�տ��±���Ҫ��ʱ��(��λ����)
Include("\\script\\lib\\writelog.lua")
szLogTrungThuName = "Hoat Dong Trung Thu"

--�������ŷ���1���رշ���0
function is_mooncake_viet_open()
	local nDate = tonumber(date("%m"));
	if nDate >= DATE_08_MOONCAKE_VIET_START and nDate < DATE_08_MOONCAKE_VIET_END then
		return SWITCH_08_MOONCAKE_VIET;
	else
		return 0;
	end
end

function search_lantern()
	Talk(1,"","Ho�t ��ng \"Truy t�m l�ng ��n may m�n\" di�n ra t� 05-09-2008 ��n 24:00 ng�y 05-10-2008. L�ng ��n s� xu�t hi�n T� 11:00 ��n 14:00 v� t� 21:00 ��n 24:00 v�o c�c ng�y Th� 6, Th� 7 v� Ch� nh�t h�ng tu�n. Trong th�i gian n�y, ng��i ch�i ��n NPC Ti�u ��ng �� nh�n �N�n v�ng�. � tr�ng th�i chi�n ��u, ng��i ch�i mang N�n V�ng ��n c�c b�n �� �� th�p s�ng L�ng ��n May M�n, s� c� c� h�i nh�n ���c ph�n th��ng �i�m kinh nghi�m v� c�c v�t ph�m c� gi� tr�.");
end;

function give_cake()
	Talk(1,"","Ho�t ��ng �T�ng B�nh Trung Thu� di�n ra h�ng ng�y t� 05-09-2008 ��n 24:00 ng�y 05-10-2008. H�ng ng�y t� 7:00 ��n 19:00, ng��i ch�i mang 4 b�nh trung thu b�nh th��ng ho�c 4 b�nh trung thu ��c bi�t ��n t�ng cho NPC Phi Y�n Ti�n T� �� nh�n l�y 1 �i�u ��c. T� 20:00 ��n 06:00 s�ng h�m sau, ng��i ch�i ��n NPC Phi Y�n T� T� �� nh�n ph�n th��ng t� �i�u ��c c�a m�nh.\nCh� �: Sau th�i gian quy ��nh m� ng��i ch�i kh�ng ��n nh�n th��ng th� ph�n th��ng s� b� h�y b�.");
end;

function collect_materials()
	Talk(1,"","T� 05-09-2008 ��n 24:00 ng�y 05-10-2008, ng��i ch�i c� th� ��nh qu�i �� thu th�p nguy�n li�u l�m b�nh trung thu (xem chi ti�t tr�n trang ch�).")
end;

function make_cake()
	Talk(1,"","Ho�t ��ng l�m B�nh Trung Thu di�n ra t� ng�y 05-09-2008 ��n 24:00 ng�y 05-10-2008. Trong th�i gian n�y, ng��i ch�i tham gia c�c ho�t ��ng trong tr� ch�i �� thu th�p c�c T�i Nguy�n Li�u, b�n trong c� ch�a c�c nguy�n li�u c�n thi�t �� l�m B�nh Trung Thu. Ngo�i ra, ng��i ch�i c� th� l�m ra nh�ng chi�c b�nh trung thu ��c bi�t khi mua g�i Gia V� t� Ng� C�c. S� d�ng c�c lo�i B�nh Trung Thu s� ���c �i�m kinh nghi�m v� v�t ph�m c� gi� tr�.")
end;
	
function get_mooncake_08_info()
	local tbSay = {
		"Ho�t ��ng Thu th�p nguy�n li�u/collect_materials",
		"Ho�t ��ng L�m b�nh Trung Thu/make_cake",
		"Ho�t ��ng Truy t�m l�ng ��n may m�n/search_lantern",
		"Ho�t ��ng T�ng b�nh Trung Thu/give_cake",
	}
	Say("Danh s�ch c�c ho�t ��ng Trung Thu 2008",getn(tbSay),tbSay)
end;