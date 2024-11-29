-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- id : 4, 107, 72

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("a b� ng thng", "green")..":"
quest_title = cf_ox_SetColor("M竨 甧n", "yellow").."\n"
quest_detail = cf_ox_SetColor("дn Nga My h醝 th╩ v� v誸 m竨 甧n", "gray").."\n\n"
quest_description_1 = quest_giver.."Nghe n鉯 Dng Nguy謙 s� � Nga My tinh th玭g y thu藅, nh� b籲g h鱱 n  h醝 xem c竎h tr� li謚."
quest_confirm = ""
quest_cancel = ""

function wq_ox_tbb_002_002()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	SetTask(122, 5)
	--CreateTrigger(0, 101, 71)

	-- 以下是任务奖励部分
	ModifyExp(200)							-- 经验奖励
	AddItem(2, 0, 16, 1)					-- 任务道具 黑色的血
	
	-- 以下是文字显示部分
	TaskTip("дn Nga My h醝 th╩ v� v誸 m竨 甧n")
	Say(quest_title..quest_detail..quest_description_1, 0)
end