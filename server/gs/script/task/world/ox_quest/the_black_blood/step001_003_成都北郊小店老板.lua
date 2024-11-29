-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- id : 4, 102, 71

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Ch� ti謒 nh�", "green")..":"
quest_title = cf_ox_SetColor("Thanh Kh� L鬰 Minh", "yellow").."\n"
quest_detail = cf_ox_SetColor("Nh薾 頲 ph莕 thng*2 甶觤 kinh nghi謒.", "gray").."\n\n"
quest_description_1 = quest_giver.."Lo筰 tr� n祔 頲 l蕐 t� Dc Vng ng 頲 pha ch� v韎 nc t� d遪g su鑙 M閚g V﹏. U鑞g v祇 gi髉 t╪g cng sinh l鵦, tinh th玭g minh m蒼. N誹 t譵  nguy猲 li謚, ta c� th� gi髉 ngi ch� bi課."
quest_confirm = ""
quest_cancel = ""

function wq_ox_tbb_001_003()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	SetTask(121, 4)
	--CreateTrigger(0, 101, 71)

	-- 以下是任务奖励部分
	DelItem(2, 0, 15, 1)					-- 删除任务道具 小瓶子
	ModifyExp(200)							-- 经验奖励
	DoubleExpCount(GetLevel()*100)			-- 双倍经验奖励
	
	-- 以下是文字显示部分
	TaskTip("Nh薾 頲 ph莕 thng*2 甶觤 kinh nghi謒.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end