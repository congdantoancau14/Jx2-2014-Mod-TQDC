--����: ��ˮ��

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{3,0},{4,8},{8,12},{9,15},{19,15}}},
	{"skill_sub_skill1_factor",{{1,0},{3,0},{4,10},{8,18},{9,20},{19,20}}},
	{"skill_effect_persist_time",{{1,300},{19,300}}},
	{"skill_display_persist_time",{{1,120},{19,120}}},
	{"skill_valid_object",{{1,2},{5,2},{6,6},{19,6}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,51},{9,99},{19,99}}}
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	},

	--ħ������

	--����ֵ:	��ͨ������ * X + (1 + ���ܵȼ� * Y) * (���� * A + ���� * B + �� * C + �ڹ� * D + ���� * E)
	--			+ �����⹦������ * F + Z
	--			(����,A,B,C,D,E,F,X,Y,ZΪ�˺�����.��Z��,������˺�����Ϊ�ٷֱ���.)

	--�ɹ�����:	(����ֵ * A + (����ȼ� - �Է��ȼ�) * B + ���ܵȼ� * C) * D + X
	--			(����,A,B,C,D,XΪ��������.��X��,�������������Ϊ�ٷֱ���.)
	--damage_factor_m=���ֵ�����������Թҹ�Ч��ʱ����ֹ���Թ�������������

	SKILL_MAGIC_DAMAGE_ATTRIB =	--���ܵȼ�����˺�ħ������
	{
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_move_speed_percent_add",
	damage_factor_z={{1,30},{9,80},{19,105}},
	damage_factor_m={{1,105},{19,105}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
