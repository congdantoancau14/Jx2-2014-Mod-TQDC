--技能: 混元一气功

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	},

	--魔法属性

	--属性值:	普通攻击力 * X + (1 + 技能等级 * Y) * (力量 * A + 根骨 * B + 身法 * C + 内功 * D + 洞察 * E)
	--			+ 武器外功攻击点 * F + Z
	--			(其中,A,B,C,D,E,F,X,Y,Z为伤害因素.除Z外,其余各伤害因素为百分比数.)

	--成功几率:	(属性值 * A + (自身等级 - 对方等级) * B + 技能等级 * C) * D + X
	--			(其中,A,B,C,D,X为几率因素.除X外,其余各几率因素为百分比数.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--技能等级相关伤害魔法属性
	{
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	{magic="state_life_restore_per10s",
	damage_factor_z={{1,20},{9,100},{10,120},{20,120}},
	},
	{magic="state_physicalwound_per_add",
	damage_factor_z={{1,0},{2,0},{3,5},{9,20},{10,25},{20,25}},
	},
	{magic="state_weapon_limit",
	damage_factor_z={{1,40},{20,40}},
	},
	{magic="state_physical_armor_add",
	damage_factor_z={{1,80},{20,80}},
	},
	{magic="state_magic_parmor_per_dec_no_ignore",
	damage_factor_z={{1,20},{20,20}},
	},
	{magic="state_perfect_dodge_rate",
	damage_factor_z={{1,4},{20,4}},
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

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
