--����: ���

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,2},{17,2}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,12},{7,18},{17,18}}},
	{"cost_goods_id",{{1,1114113},{17,1114113}}},
	{"cost_goods_num",{{1,1},{17,1}}},
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_speed",{{1,12},{7,18},{17,18}}}
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
	{magic="state_lost_life_per18",
	damage_factor_x={{1,30},{7,60},{17,72}},
	damage_factor_e={{1,30},{7,60},{17,72}},
	damage_factor_z={{1,60},{7,240},{17,288}},
	probability_factor_b={{1,20},{17,20}},
	probability_factor_x={{1,100},{17,100}},
	},
	{magic="state_bleeding",
	probability_factor_b={{1,20},{17,20}},
	probability_factor_x={{1,70},{17,100}},
	},
	{magic="state_lost_life_per18_monster",
	damage_factor_x={{1,60},{7,120},{17,144}},
	damage_factor_e={{1,60},{7,120},{17,144}},
	damage_factor_z={{1,120},{7,480},{17,576}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
