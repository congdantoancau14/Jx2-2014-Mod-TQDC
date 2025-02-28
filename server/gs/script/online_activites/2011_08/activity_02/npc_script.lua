--=============================================
--create by liubo
--describe:越南版2011年8月活动2 烘炉脚本
--related files:
--=============================================
Include("\\script\\online_activites\\2011_08\\activity_02\\baked_cakes_main.lua")
Include("\\script\\online_activites\\2011_08\\string.lua")
Include("\\script\\lib\\globalfunctions.lua")

--NPC点击响应函数
function main()
	--时间检验
	local nTime = tonumber(GetTime())
	if nTime > (VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Time_End) + 62) then
		Talk(1,"",VET_201108_TB_NPCS_LIST[7])
		return
	end
	--NPC索引检验
	local nIndexNpc = GetTargetNpc()
	if nIndexNpc ~= VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Npc_Index) then
		Talk(1,"",VET_201108_TB_NPCS_LIST[7])
		return
	end
	--触发器是否结束
	if VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Tag_CCake) == 1 then
		Say(VET_201108_TB_NPCS_LIST[2],1,VET_201108_TB_NPCS_LIST[3].."/confirm")
		return
	end
	--已经领取过上等月饼
	if VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Tag_CCake) == 2 then
		Talk(1,"",VET_201108_TB_NPCS_LIST[6])
		return
	end
	--触发器没有结束
	Talk(1,"",VET_201108_TB_NPCS_LIST[1])
end

--确认获取对话框
function confirm()
	Say(VET_201108_TB_NPCS_LIST[2],2,VET_201108_TB_NPCS_LIST[4].."/get_thing",VET_201108_TB_NPCS_LIST[5].."/do_nothing")	
end


function get_thing()
	--背包空间判断
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then 
		return
	end
	VET_201108_MIDAUTUMN_TaskGroup:SetTask(VET_201108_MIDAUTUMN_TaskGroup.Tag_CCake,2)
	local nResult,_ = AddItem(VET_201108_ITEM_LIST[3][2],VET_201108_ITEM_LIST[3][3],VET_201108_ITEM_LIST[3][4],5)
	Msg2Player("C竎 h� nh薾 頲 5 B竛h Thng H筺g")
	if nResult ~= 0 then 
		gf_WriteLogEx(VET_201108_LOG_TITLE,VET_201108_TB_LOG_ACTION_LIST[3])
	end
end

function do_nothing()
--do nothing
end