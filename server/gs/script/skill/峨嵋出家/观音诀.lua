--技能: 观音诀

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,8},{4,10},{5,12},{6,15},{16,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{4,13},{5,16},{6,20},{16,20}}},
	{"skill_effect_persist_time",{{1,2},{16,2}}},
	{"skill_display_persist_time",{{1,35},{6,75},{16,75}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,10},{6,25},{16,35}}},
	{"cost_mana_point_pk",{{1,195},{6,220},{16,320}}},
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
	{magic="state_p_attack_percent_add",
	damage_factor_z={{1,10},{3,10},{4,15},{16,15}},
	},
	{magic="state_m_attack_percent_add",
	damage_factor_z={{1,10},{3,10},{4,15},{16,15}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	{magic="imme_life_point_add",
	damage_factor_d={{1,150},{6,150},{16,180}},
	damage_factor_b={{1,120},{6,120},{16,130}},
	damage_factor_f={{1,120},{16,120}},
	damage_factor_y={{1,20},{16,20}},
	damage_factor_x={{1,150},{16,150}},
	damage_factor_z={{1,30},{5,150},{6,200},{16,240}},
	probability_factor_b={{1,20},{16,20}},
	probability_factor_x={{1,100},{16,100}},
	}
	},
}
