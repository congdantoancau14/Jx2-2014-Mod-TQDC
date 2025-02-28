--技能: 月蚀曲

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,8},{7,12},{8,15},{18,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{7,18},{8,20},{18,20}}},
	{"skill_display_persist_time",{{1,14},{18,14}}},
	{"skill_effect_persist_time",{{1,1},{18,1}}}
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,8},{8,15},{18,25}}},
	{"cost_mana_per_second",{{1,2},{5,3},{8,3},{18,5}}},
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	{"missle_vanish_after_collide",{{1,1},{18,1}}},
	{"missle_damage_interval",{{1,99},{18,99}}},
	},

	--魔法属性

	--属性值:	普通攻击力 * X + (1 + 技能等级 * Y) * (力量 * A + 根骨 * B + 身法 * C + 内功 * D + 洞察 * E)
	--			+ 武器外功攻击点 * F + Z
	--			(其中,A,B,C,D,E,F,X,Y,Z为伤害因素.除Z外,其余各伤害因素为百分比数.)

	--成功几率:	(属性值 * A + (自身等级 - 对方等级) * B + 技能等级 * C) * D + X
	--			(其中,A,B,C,D,X为几率因素.除X外,其余各几率因素为百分比数.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--技能等级相关伤害魔法属性
	{
	{magic="damage_life",
	damage_factor_z={{1,380},{8,800},{18,960}},
	probability_factor_b={{1,20},{18,20}},
	probability_factor_x={{1,100},{18,100}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	{magic="state_damage_life_when_doskill",
	damage_factor_z={{1,80},{8,150},{18,150}},
	damage_factor_m={{1,150},{18,150}},
	probability_factor_b={{1,15},{18,15}},
	probability_factor_x={{1,75},{18,75}},
	},
	{magic="state_attack_speed_add",
	damage_factor_z={{1,0},{4,0},{5,50},{18,50}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
