--技能: 尸裂魔功(招2)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_display_persist_time",{{1,60},{17,60}}},
	{"skill_effect_persist_time",{{1,60},{17,60}}},
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
	{magic="state_p_attack_percent_add",
	damage_factor_z={{1,5},{7,20},{17,30}},
	},
	{magic="state_m_attack_percent_add",
	damage_factor_z={{1,5},{7,20},{17,30}},
	},
	{magic="state_physical_parmor_per_add",
	damage_factor_z={{1,5},{7,20},{17,30}},
	},
	{magic="state_magic_parmor_per_add",
	damage_factor_z={{1,5},{7,20},{17,30}},
	},
	{magic="state_move_speed_percent_add",
	damage_factor_z={{1,5},{7,20},{17,30}},
	},
	{magic="state_death_skill",
	damage_factor_z={{1,11075585},{2,11075585},{3,11075586},{4,11075586},{5,11075587},{6,11075588},{7,11075589},{17,11075599}},
	},
	{magic="state_confusion_immune",
	damage_factor_z={{1,50},{17,50}},
	},
	{magic="state_sleep_immune",
	damage_factor_z={{1,50},{17,50}},
	},
	{magic="state_vertigo_immune",
	damage_factor_z={{1,50},{17,50}},
	},
	{magic="state_fast_recovery",
	damage_factor_z={{1,75},{17,75}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
