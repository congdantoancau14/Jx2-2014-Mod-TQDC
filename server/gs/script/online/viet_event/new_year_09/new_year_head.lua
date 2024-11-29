--File name:	new_year_head.lua
--Describe:		���ڻhead�ļ�
--Create Date:	2008-12-24
--Author:		chenbenqian


SWITCH_09_NEWYEAR_VIET	= 1;

DATE_09_NEWYEAR_VIET_START	= 2009011600;			-- ���ڻ��ʼ����
DATE_09_NEWYEAR_VIET_END	= 2049021600;			-- ���ڻ��������

PLUM_EXP_LIMIT_09_NEWYEAR_VIET = 100000000			--���ڻ÷-�һ�ɻ�õ��ܹ�����ֵ����
SEED_EXP_LIMIT_09_NEWYEAR_VIET = 20000000			--���ڻ�Ҹ����ӿɻ�õ��ܹ�����ֵ����
PICK_TIME_09_NEWYEAR_VIET = 30						--ʰȡ�Ҹ�������Ҫ��ʱ��(��λ����)
JOIN_TONG_DAY_09_NEWYEAR_VIET = 7					--��С���ʱ��(��λ����)


--���ڻʹ�õ��������
GAIN_NEW_BAG_09_NEWYEAR_VIET = 2108					--��¼���쵱���Ƿ�ͨ��ɱ���û����������
PLUM_TOTALEXP_09_NEWYEAR_VIET = 2109				--��¼���ڻ÷-�һ��õ��ܹ��ľ���
SEED_TOTALEXP_09_NEWYEAR_VIET = 2110				--��¼���ڻ�Ҹ����ӻ�õ��ܹ��ľ���
GIVE_PLUM_DATE_09_NEWYEAR_VIET = 2111				--��¼�����Ƿ�������4֦÷��
AWARD_PLUM_09_NEWYEAR_VIET = 2112					--��¼�����Ƿ�����ȡ÷������
NEW_BAG_WEEK_09_NEWYEAR_VIET = 2113					--��¼�����ǽ���ĵڼ��ܣ��������������ȡ�Ϲ���������ĸ�����
NEW_BAG_NUM_09_NEWYEAR_VIET = 2114					--��¼������ȡ�Ϲ���������ĸ���
STAGE_NUM_09_NEWYEAR_VIET = 2115					--��¼������ȡ���Ϲ��ڼ��ص�������

--���ڻʹ�õ���ʱ�������
SEED_INDEX_09_NEWYEAR_VIET = 102					--��¼�����Ҹ����ӵ�npc����


--���ڻ�������ݿ��ʶ
RELAY_DB_09_NEWYEAR_VIET = "new_year_09_veit"
--===================================================================================================

--���ڻ���ŷ���1���رշ���0
function is_new_year_09_viet_open()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_09_NEWYEAR_VIET_START and nDate < DATE_09_NEWYEAR_VIET_END then
		return SWITCH_09_NEWYEAR_VIET;
	else
		return 0;
	end
end

function get_new_year_09_info()
	Talk(1,"","M�i ng�y ng��i ch�i c� c�p 10 tr� l�n v� �� v�o m�n ph�i t�ng hoa mai cho NPC Phi Y�n Ti�n T� s� ���c ph�n th��ng c� gi� tr�: \n-T� 0:05 ��n 19:00 ng��i ch�i t�ng 4 hoa mai cho NPC Phi Y�n Ti�n T� s� ���c ph�n th��ng kinh nghi�m\n-T� 19:05 ��n 24:00, ng��i ch�i �� t�ng �� 4 hoa mai ��n ��i tho�i v�i Phi Y�n s� ���c nh�ng ph�n qu� ��c bi�t\n-Ng��i ch�i may m�n nh�t trong ng�y s� ���c 1 Ng� H�nh M�t T�ch.")
end	


