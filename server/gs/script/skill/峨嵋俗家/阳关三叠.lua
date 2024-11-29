--����: ��������

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,8},{4,10},{5,12},{6,15},{16,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{4,13},{5,16},{6,20},{16,20}}},
	{"skill_display_persist_time",{{1,0},{3,0},{4,1},{16,1}}},
	{"skill_valid_object",{{1,456},{16,456}}},
	{"skill_effect_persist_time",{{1,2},{16,2}}}
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,35},{6,60},{16,80}}},
	{"cost_mana_per_second",{{1,5},{3,5},{4,10},{6,10},{16,15}}},
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_vanish_after_collide",{{1,1},{16,1}}},
	{"missle_damage_interval",{{1,99},{16,99}}},
	},

	--ħ������

	--����ֵ:	��ͨ������ * X + (1 + ���ܵȼ� * Y) * (���� * A + ���� * B + �� * C + �ڹ� * D + ���� * E)
	--			+ �����⹦������ * F + Z
	--			(����,A,B,C,D,E,F,X,Y,ZΪ�˺�����.��Z��,������˺�����Ϊ�ٷֱ���.)

	--�ɹ�����:	(����ֵ * A + (����ȼ� - �Է��ȼ�) * B + ���ܵȼ� * C) * D + X
	--			(����,A,B,C,D,XΪ��������.��X��,�������������Ϊ�ٷֱ���.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--���ܵȼ�����˺�ħ������
	{
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_magic_parmor_per_dec",
	damage_factor_z={{1,10},{6,30},{16,60}},
	damage_factor_m={{1,60},{16,60}},
	},
	{magic="state_physical_parmor_per_dec",
	damage_factor_z={{1,10},{6,30},{16,60}},
	damage_factor_m={{1,60},{16,60}},
	},
	{magic="state_confusion",
	damage_factor_z={{1,1},{16,1}},
	probability_factor_b={{1,0},{3,0},{4,1},{16,1}},
	probability_factor_x={{1,0},{3,0},{4,6},{6,10},{16,10}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
