--����: ���ǹ�ķ�

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
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
	{magic="state_attack_speed_add",
	damage_factor_z={{1,10},{10,35},{20,35}},
	},
	{magic="state_magic_parmor_poi_add",
	damage_factor_z={{1,0},{2,1},{10,5},{20,5}},
	},
	{magic="state_life_restore_per10s",
	damage_factor_z={{1,20},{9,100},{10,120},{20,120}},
	},
	{magic="state_physicalwound_per_add",
	damage_factor_z={{1,0},{2,0},{3,5},{9,20},{10,25},{20,25}},
	},
	{magic="state_weapon_limit",
	damage_factor_z={{1,64},{20,64}},
	},
	{magic="state_physical_parmor_per_dec_no_ignore",
	damage_factor_z={{1,5},{20,5}},
	},
	{magic="state_magic_parmor_per_dec_no_ignore",
	damage_factor_z={{1,10},{20,10}},
	},
	{magic="state_energy_neili_per_add",
	damage_factor_z={{1,100},{20,100}},
	},
	{magic="state_mounting_speed_add",
	damage_factor_z={{1,100},{3,160},{4,200},{6,260},{7,300},{9,360},{10,400},{20,400}},
	},
	{magic="state_abrade_attack_interval",
	damage_factor_z={{1,2},{20,2}},
	},
	{magic="state_perfect_dodge_rate",
	damage_factor_z={{1,1},{20,1}},
	},
	{magic="state_level_2_max_life_rate",
	damage_factor_z={{1,360},{20,360}},
	},	
	{magic="state_trans_2_max_life_rate",
	damage_factor_z={{1,3600},{20,3600}},
	},
	{magic="state_life_max_point_add",
	damage_factor_z={{1,0},{10,0},{11,1000},{20,10000}}
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
