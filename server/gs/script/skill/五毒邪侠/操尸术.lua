--����: ��ʬ��

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,86400},{16,86400}}},
	{"skill_display_persist_time",{{1,86400},{16,86400}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,7},{6,12},{16,17}}},
	{"cost_spirit",{{1,200},{16,200}}}
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

	SKILL_MAGIC_DAMAGE_ATTRIB =	--���ܵȼ�����˺�ħ������
	{
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	{magic="imme_npc_corpse_revival",
	probability_factor_b={{1,20},{16,20}},
	probability_factor_x={{1,100},{16,100}},
	},
	{magic="imme_summon_life_add",
	damage_factor_a={{1,200},{6,200},{16,300}},
	damage_factor_c={{1,300},{6,300},{16,400}},
	damage_factor_z={{1,100},{6,600},{16,1600}},
	},
	{magic="imme_summon_attack_add",
	damage_factor_a={{1,120},{6,120},{16,144}},
	damage_factor_c={{1,180},{6,180},{16,270}},
	damage_factor_z={{1,100},{6,500},{16,600}},
	damage_factor_f={{1,100},{16,100}},
	},
	{magic="imme_summon_attack_rate_add",
	damage_factor_a={{1,100},{6,100},{16,140}},
	damage_factor_c={{1,120},{6,120},{16,192}},
	damage_factor_z={{1,100},{6,200},{16,700}},
	},
	{magic="imme_summon_dodge_add",
	damage_factor_a={{1,60},{6,60},{16,72}},
	damage_factor_c={{1,80},{6,80},{16,112}},
	damage_factor_z={{1,25},{6,100},{16,300}},
	},
	{magic="imme_summon_physical_defence_add",
	damage_factor_a={{1,20},{16,20}},
	damage_factor_c={{1,30},{16,30}},
	damage_factor_z={{1,100},{6,200},{16,200}},
	},
	{magic="imme_summon_magic_defence_add",
	damage_factor_a={{1,20},{16,20}},
	damage_factor_c={{1,30},{16,30}},
	damage_factor_z={{1,100},{6,200},{16,200}},
	},
	},
}
