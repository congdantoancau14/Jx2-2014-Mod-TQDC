--����: ʨ�Ӻ�

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{2,8},{3,10},{4,12},{5,15},{15,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,10},{3,13},{4,16},{5,20},{15,20}}},
	{"skill_sub_skill2_probability",{{1,0},{4,0},{5,5},{15,5}}},
	{"skill_sub_skill2_factor",{{1,0},{4,0},{5,12},{15,12}}},
	{"skill_effect_persist_time",{{1,2},{15,2}}}
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,110},{5,150},{15,200}}}
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_vanish_after_collide",{{1,1},{15,1}}},
	{"missle_damage_interval",{{1,99},{15,99}}},
	},

	--ħ������

	--����ֵ:	��ͨ������ * X + (1 + ���ܵȼ� * Y) * (���� * A + ���� * B + �� * C + �ڹ� * D + ���� * E)
	--			+ �����⹦������ * F + Z
	--			(����,A,B,C,D,E,F,X,Y,ZΪ�˺�����.��Z��,������˺�����Ϊ�ٷֱ���.)

	--�ɹ�����:	(����ֵ * A + (����ȼ� - �Է��ȼ�) * B + ���ܵȼ� * C) * D + X
	--			(����,A,B,C,D,XΪ��������.��X��,�������������Ϊ�ٷֱ���.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--���ܵȼ�����˺�ħ������
	{
	{magic="damage_life",
	damage_factor_x={{1,50},{4,80},{5,100},{15,120}},
	damage_factor_z={{1,200},{4,560},{5,700},{15,840}},
	}
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_vertigo",
	damage_factor_z={{1,1},{15,1}},
	probability_factor_b={{1,10},{15,10}},
	probability_factor_x={{1,45},{5,75},{15,75}},
	}
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
