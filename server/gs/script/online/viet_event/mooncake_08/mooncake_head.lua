--File name:	mooncake_head.lua
--Describe:		����head�ļ�
--Create Date:	2008-08-18
--Author:		chenbenqian

SWITCH_08_MOONCAKE_VIET	= 1;

DATE_08_MOONCAKE_VIET_START	= 2008090500;			-- ������ʼ����
DATE_08_MOONCAKE_VIET_END	= 2048100600;			-- ������������

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
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_08_MOONCAKE_VIET_START and nDate < DATE_08_MOONCAKE_VIET_END then
		return SWITCH_08_MOONCAKE_VIET;
	else
		return 0;
	end
end

function get_mooncake_info()
	Talk(1,"","Ho�t ��ng \"Truy t�m l�ng ��n may m�n\" di�n ra t� 05-09-2008 ��n 24:00 ng�y 05-10-2008. L�ng ��n s� xu�t hi�n T� 11:00 ��n 14:00 v� t� 21:00 ��n 24:00 v�o c�c ng�y Th� 6, Th� 7 v� Ch� nh�t h�ng tu�n. Trong th�i gian n�y, ng��i ch�i ��n NPC Ti�u ��ng �� nh�n �N�n v�ng�. � tr�ng th�i chi�n ��u, ng��i ch�i mang N�n V�ng ��n c�c b�n �� �� th�p s�ng L�ng ��n May M�n, s� c� c� h�i nh�n ���c ph�n th��ng �i�m kinh nghi�m v� c�c v�t ph�m c� gi� tr�.");
end;
