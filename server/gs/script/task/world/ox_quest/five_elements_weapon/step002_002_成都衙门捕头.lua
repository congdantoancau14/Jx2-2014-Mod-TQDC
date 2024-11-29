-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- ID : 4, 4, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("B� u", "green")..":"
quest_title = cf_ox_SetColor("B総 c鉩", "yellow").."\n"
quest_detail = cf_ox_SetColor("цi tho筰 v韎 B� u � Th祅h Й", "gray").."\n\n"
quest_description_1 = quest_giver.."Ngi ch輓h l� v� Ngitrong cu閏 t� v� ch鋘 hi襫 t� h玬 ? Чi ti觰 th� b� b総 c鉩 ngi  c� c竎h g� ch璦? Ta ngh� ngi b総 c鉩 ti觰 th� l� m閠 trong m g﹜ r鑙 ."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_002_002()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	CreateTrigger(4, 5, 51)					-- 创建下一个触发器
	SetTask(101, 6)
	
	-- 以下是任务奖励部分
	ModifyExp(100)							-- 给予玩家经验奖励
	
	-- 以下是文字显示部分
	TaskTip("цi tho筰 v韎 B� u � Th祅h Й")
	Say(quest_title..quest_detail..quest_description_1, 0)
end