--技能: 妖蛊

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_effect_persist_time",{{1,300},{5,300},{6,30},{17,360}}},
	{"skill_display_persist_time",{{1,0},{5,0},{6,0},{17,1}}},
	{"skill_cast_interval",{{1,1620},{5,1620},{6,540},{17,540}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,42},{5,50},{6,60},{17,60}}},
	{"cost_goods_id",{{1,1114126},{5,1114126},{6,1114127},{7,1114128},{17,1114128}}},
	{"cost_goods_num",{{1,1},{17,1}}},
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
	{magic="state_buff_resist",
	damage_factor_z={{1,1},{4,4},{5,6},{6,8},{7,9},{8,9},{9,10},{10,10},{11,11},{12,11},{13,12},{14,12},{15,13},{16,13},{17,14}},
	damage_factor_m={{1,14},{17,14}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
