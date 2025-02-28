--技能: 毒蛊(陷阱)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_effect_persist_time",{{1,90},{5,90},{6,60},{17,60}}},
	{"skill_display_persist_time",{{1,0},{5,0},{6,0},{7,1},{17,1}}},
	{"skill_cast_interval",{{1,54},{5,54},{6,270},{7,540},{17,540}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,20},{5,40},{6,50},{17,50}}},
	{"cost_goods_id",{{1,1114114},{5,1114114},{6,1114115},{7,1114116},{17,1114116}}},
	{"cost_goods_num",{{1,1},{17,1}}},
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	{"skill_missle_num",{{1,3},{17,3}}},
	{"missle_param2",{{1,50},{17,50}}},
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
	{magic="state_gu_poison_damage",
	damage_factor_c={{1,33},{5,45},{6,90},{7,60},{17,72}},
	damage_factor_e={{1,36},{5,60},{6,150},{7,90},{17,108}},
	damage_factor_z={{1,60},{5,180},{6,300},{7,240},{17,288}},
	probability_factor_b={{1,20},{17,20}},
	probability_factor_x={{1,100},{17,100}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
