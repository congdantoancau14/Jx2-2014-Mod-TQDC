Include("\\script\\online_activites\\2011_04\\liberation\\strings.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\misc\\taskmanager.lua");
Include("\\script\\online\\viet_event\\firework_10\\head.lua");

VET_201104_LIBERATION_ACTIVITY_ID = 33;
VET_201104_LIBERATION_FIREWORK_USE_MAX = 4000

--物品和奖励相关的头关键字
VET_201104_LIBERATION_INI_KEY="201104Liberation"
--TaskGroup
VET_201104_LIBERATION_TaskGroup = TaskManager:Create(3,16)
VET_201104_LIBERATION_TaskGroup.OpenFireworkDiff = 1
VET_201104_LIBERATION_TaskGroup.OpenFireWorkTimes = 2
VET_201104_LIBERATION_TaskGroup.GetFinalPrize = 3

--时间锦囊
function VET_201104_Liberation_JingNangDaShiJiangDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201104_LIBERATION_ACTIVITY_ID) == 1 then
		tinsert(tbSayDialog,gf_VnGetChangeSaySel("201104LiberationChg1").."/#VET201104CHG(1)")
		tinsert(tbSayDialog,gf_VnGetChangeSaySel("201104LiberationChg2").."/#VET201104CHG(2)")
		tinsert(tbSayDialog,VET_STR_201104_LIBERATION_OPERATING_DLG[1])
		tinsert(tbSayDialog,VET_STR_201104_LIBERATION_OPERATING_DLG[2])
		tinsert(tbSayDialog,gf_VnGetChangeSaySel("201104LiberationChg3").."/#VET201104CHG(3)")
		szSayHead = VET_STR_201104_LIBERATION_OPERATING_DLG[4]
	end
	return tbSayDialog,szSayHead
end
--道具兑换处理
function VET201104CHG(nChgSeq)
	gf_VnItemChgDeal(VET_201104_LIBERATION_INI_KEY.."Chg"..nChgSeq)
end

function VET_201104_304_MassExchange()
	AskClientForNumber("VET_201104_304_ConfirmMassExchange", 1, 999, "S� B� Hoa?")
end

function VET_201104_304_ConfirmMassExchange(nCount)
    if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        return 0;
    end
    
    if GetItemCount(2, 1, 30295) < 5 * nCount or GetItemCount(2, 1, 30230) < 2 * nCount then
        Talk(1, "", "Kh玭g  nguy猲 li謚  i, xin vui l遪g ki觤 tra l筰 h祅h trang!");
        return 0
    elseif DelItem(2, 1, 30295, 5 * nCount) == 1 and DelItem(2, 1, 30230, 2 * nCount) == 1 then 
        gf_AddItemEx2({2,1,30296, nCount}, VET_TB_201104_LIBERATION_ITEM_TITLE[2], VET_STR_201104_LIBERATION_LOG_TITLE, "i B� Hoa Chi課 Th緉g b籲g Xu", 0, 1)
    end
    SelectSay()
end

--领奖模式处理
function VET_201104_PRIZE_MODEL()
	Say(VET_STR_201104_LIBERATION_OPERATING_DLG[7],
		3,
		VET_STR_201104_LIBERATION_OPERATING_DLG[5],
		VET_STR_201104_LIBERATION_OPERATING_DLG[6],
		VET_STR_201104_LIBERATION_OPERATING_DLG[8]
	)
end
--设置处理
function VET_201104_PRIZE_DIFF(nPrizeDiff)
	VET_201104_LIBERATION_TaskGroup:SetTask(VET_201104_LIBERATION_TaskGroup.OpenFireworkDiff,nPrizeDiff)
	Talk(1, "", format(VET_STR_201104_LIBERATION_OPERATING_DLG[15][nPrizeDiff],VET_TB_201104_LIBERATION_ITEM_TITLE[2],50000));
end
--礼花的使用
function VET_201104_Liberation_Firework(nItemIndex)
	--次数检测
	local nUseTimes = VET_201104_LIBERATION_TaskGroup:GetTask(VET_201104_LIBERATION_TaskGroup.OpenFireWorkTimes)
	if nUseTimes >= VET_201104_LIBERATION_FIREWORK_USE_MAX then
		Talk(1,"",format(VET_STR_201104_LIBERATION_OPERATING_DLG[9],VET_201104_LIBERATION_FIREWORK_USE_MAX))
		return
	end
	--兑换规则是否设定检测
	local nPrizeDiff = VET_201104_LIBERATION_TaskGroup:GetTask(VET_201104_LIBERATION_TaskGroup.OpenFireworkDiff)
	if nPrizeDiff ~= 1 and nPrizeDiff ~= 2 then
		VET_201104_PRIZE_MODEL()
		return
	end
	
	--空间负重判断
	if gf_Judge_Room_Weight(1, 10 , "") ~= 1 then
		return 0
	end
	--物品删除
	if DelItemByIndex(nItemIndex,1) ~= 1 then
		return
	else
		VET_201104_LIBERATION_TaskGroup:SetTask(VET_201104_LIBERATION_TaskGroup.OpenFireWorkTimes,(nUseTimes + 1))
		--每20次的奖励
		if nPrizeDiff == 1 then
			ModifyExp(250000)
			Msg2Player("B筺 nh薾 頲 250000 甶觤 kinh nghi謒.")
		else
			ModifyExp(200000)
			Msg2Player("B筺 nh薾 頲 200000 甶觤 kinh nghi謒.")
			if mod((nUseTimes + 1),20) == 0 then
				gf_EventGiveRandAward(VET_TB_201104_LIBERATION_SUC_FIREWORK_PRIZE_20, 10000, 1, VET_STR_201104_LIBERATION_LOG_TITLE,format(VET_TB_201104_LIBERATION_LOG_ACTION_LIST[5],(nUseTimes + 1),VET_TB_201104_LIBERATION_ITEM_TITLE[2]));				
			else
				gf_EventGiveRandAward(VET_TB_201104_LIBERATION_SUC_FIREWORK_PRIZE, 1000, 1, VET_STR_201104_LIBERATION_LOG_TITLE,format(VET_TB_201104_LIBERATION_LOG_ACTION_LIST[4],VET_TB_201104_LIBERATION_ITEM_TITLE[2]))
			end
		end
		--Talk(1,"",format(VET_STR_201104_LIBERATION_OPERATING_DLG[12],(nUseTimes + 1),VET_201104_LIBERATION_FIREWORK_USE_MAX))
	end
end
--鞭炮的使用
function VET_201104_Liberation_Firecracker(nItemIndex)
	--物品删除
	use_firework(nItemIndex)
end
--领取终极奖励
function VET_201104_GET_FINAL_PRIZE()
	--礼花次数判断
	local nUseTimes = VET_201104_LIBERATION_TaskGroup:GetTask(VET_201104_LIBERATION_TaskGroup.OpenFireWorkTimes)
	if nUseTimes < 2000 then
		Talk(1,"",format(VET_STR_201104_LIBERATION_OPERATING_DLG[12],nUseTimes,VET_201104_LIBERATION_FIREWORK_USE_MAX))
		return
	end
	--是否已经领取判断
	if VET_201104_LIBERATION_TaskGroup:GetTask(VET_201104_LIBERATION_TaskGroup.GetFinalPrize) == 1 then
		Talk(1,"",VET_STR_201104_LIBERATION_OPERATING_DLG[13])
		return
	end
	--空间负重判断
	if gf_Judge_Room_Weight(1, 100 , "") ~= 1 then
		return 0
	end
	--开始处理
	Say(VET_STR_201104_LIBERATION_OPERATING_DLG[14][1],getn(VET_STR_201104_LIBERATION_OPERATING_DLG[14][2]),VET_STR_201104_LIBERATION_OPERATING_DLG[14][2])
end
--终极奖励获取处理
function VET_201104_GET_FINAL_PRIZE_DTM(nPrizeDiff)
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	--礼花次数判断
	local nUseTimes = VET_201104_LIBERATION_TaskGroup:GetTask(VET_201104_LIBERATION_TaskGroup.OpenFireWorkTimes)
	if nUseTimes < 2000 then
		Talk(1,"",format(VET_STR_201104_LIBERATION_OPERATING_DLG[12],nUseTimes,VET_201104_LIBERATION_FIREWORK_USE_MAX))
		return
	end
	--是否已经领取判断
	if VET_201104_LIBERATION_TaskGroup:GetTask(VET_201104_LIBERATION_TaskGroup.GetFinalPrize) == 1 then
		Talk(1,"",VET_STR_201104_LIBERATION_OPERATING_DLG[13])
		return
	end
	
	if nPrizeDiff == 1 then
		ModifyExp(20000000)
	elseif nPrizeDiff == 2 then
		--TODO add pet grow award here 
		if nCurPetLevel < 1 then
			Talk(1,"","Чi hi謕 ch璦 c� B筺 уng H祅h, kh玭g th� nh薾 ph莕 thng n祔!")			
			return 0
	     end
   	     SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (20 * 100))
	     Msg2Player("B筺 nh薾 頲 20 觤 N﹏g C蕄 B筺 уng H祅h")
	elseif nPrizeDiff == 3 then
		--TODO add pet mp award here 
		if nCurPetLevel < 2 then
			Talk(1,"","B筺 уng H祅h ng c蕄 2 tr� l猲 m韎 c� th� nh薾 ph莕 thng n祔!")
			return 0
	     end
	     Pet_AddGP(1)
	     Msg2Player("B筺 nh薾 頲 1 觤 Linh L鵦 B筺 уng H祅h")
	end
	VET_201104_LIBERATION_TaskGroup:SetTask(VET_201104_LIBERATION_TaskGroup.GetFinalPrize,1)
	gf_EventGiveRandAward(VET_TB_201104_LIBERATION_SUC_FIREWORK_PRIZE_MAX, 10000, 1, VET_STR_201104_LIBERATION_LOG_TITLE,VET_TB_201104_LIBERATION_LOG_ACTION_LIST[3])
end
--其它奖励处理
function VET_201104_Liberation_GetShimenWeaponAward()
	gf_EventGiveRandAward(VET_TB_201104_LIBERATION_FACTION_WEAPON, 1000, 1, VET_STR_201104_LIBERATION_LOG_TITLE,VET_TB_201104_LIBERATION_LOG_ACTION_LIST[3])
end
function VET_201104_Liberation_GetShimenEquipAward()
	gf_EventGiveRandAward(VET_TB_201104_LIBERATION_FACTION_CLOTH, 1000, 1, VET_STR_201104_LIBERATION_LOG_TITLE,VET_TB_201104_LIBERATION_LOG_ACTION_LIST[3])
end
function VET_201104_Liberation_GetBufeiyanEquipAward()
	gf_EventGiveRandAward(VET_TB_201104_LIBERATION_FY_WEAPON, 10000, 1, VET_STR_201104_LIBERATION_LOG_TITLE,VET_TB_201104_LIBERATION_LOG_ACTION_LIST[3])
end
--活动资源获取
	--小树
function  VET_201104_Liberation_PlantSmallTreeAward()
	if gf_CheckEventDateEx(VET_201104_LIBERATION_ACTIVITY_ID) == 0 then
		return 0;
	end
	gf_GivePlantSmallTreeAward({2,1,30295,30},VET_TB_201104_LIBERATION_ITEM_TITLE[1],VET_STR_201104_LIBERATION_LOG_TITLE)
	return 1
end
	--大树
function VET_201104_Liberation_PlantBigTreeAward()
	if gf_CheckEventDateEx(VET_201104_LIBERATION_ACTIVITY_ID) == 0 then
		return 0;
	end
	gf_GivePlantBigTreeAward({2,1,30295,40},VET_TB_201104_LIBERATION_ITEM_TITLE[1],VET_STR_201104_LIBERATION_LOG_TITLE)
	return 1
end
	--种子袋
function VET_201104_Liberation_SeedbagAward()
	if gf_CheckEventDateEx(VET_201104_LIBERATION_ACTIVITY_ID) == 0 then
		return 0;
	end
	gf_GiveSeedBagAward({2,1,30295,100},VET_TB_201104_LIBERATION_ITEM_TITLE[1],VET_STR_201104_LIBERATION_LOG_TITLE)
	return 1
end
	--武林使者任务
function VET_201104_Liberation_WulishizheAward()
	if gf_CheckEventDateEx(VET_201104_LIBERATION_ACTIVITY_ID) == 0 then
		return 0;
	end
	gf_GivePlantBigTreeAward({2,1,30295,30},VET_TB_201104_LIBERATION_ITEM_TITLE[1],VET_STR_201104_LIBERATION_LOG_TITLE)
end

function VET_201104_Give_FireCracker()
	local nUsedDate = floor(GetTask(TSK_DAHONGBAO_201101) / 1000)
	local nDate = tonumber(date("%y%m%d"))
	
	if GetLevel() < 77 then
		Talk(1, "", "Ъng c蕄 77 tr� l猲 m韎 c� th� s� d鬾g ph竜 hoa!")
		return
	end
	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "Ph秈 c� k� n╪g c蕄 55 m韎 c� th� tham gia ho箃 ng n祔!")
		return
	end
	
	if nDate > 110529 then
		Talk(1,"","Х h誸 th阨 h筺 s� ki謓!")
		return
	end
	
	if nUsedDate ~= nDate then
		SetTask ( TSK_DAHONGBAO_201101, nDate * 1000 )
		SetTask ( TSK_DAHONGBAO_201101_TIME, 0 )
	end
	
	local nCount = floor(mod(GetTask(TSK_DAHONGBAO_201101), 1000) / 100)
	if nCount >= 1 then
		Talk(1,"","M鏸 ng祔 ch� c� th� nh薾 ph竜 hoa 1 l莕 m� th玦!")
		return
	end
	
	gf_AddItemEx2({2, 1, 30297, 40, 4}, "Ph竜 chi課 th緉g", VET_STR_201104_LIBERATION_LOG_TITLE, "nh薾 Ph竜 chi課 th緉g")

	Msg2Player("Nh薾 頲 40 Ph竜 chi課 th緉g!")
	SetTask(TSK_DAHONGBAO_201101, GetTask(TSK_DAHONGBAO_201101) + 100)
end

function VET_201104_give_Winflower()
	local nUsedDate = floor(GetTask(TSK_GIVE_EVENT_ITEM) / 100)
	local nDate = tonumber(date("%y%m%d"))
	
	if nDate < 110520 or nDate > 110616 then
		Talk(1,"","Х h誸 th阨 h筺 s� ki謓!")
		return
	end
	
	if nUsedDate ~= nDate then
		SetTask(TSK_GIVE_EVENT_ITEM, nDate * 100)
	end
	
	local nCount = mod(GetTask(TSK_GIVE_EVENT_ITEM), 100)
	if nCount >= 4 then
		Talk(1,"","M鏸 ng祔 ch� c� th� n閜 Hoa chi課 th緉g t鑙 產 4 l莕 m� th玦!")
		return
	end
	if GetItemCount(2, 1, 30296) < 10 then
		Talk(1,"","Чi hi謕 kh玭g mang  10 Hoa chi課 th緉g r錳!")
		return
	end
	if DelItem(2, 1, 30296, 10) == 1 then
		ModifyExp(2500000)
		Msg2Player("Nh薾 頲 2500000 甶觤 kinh nghi謒")
		gf_WriteLogEx(VET_STR_201104_LIBERATION_LOG_TITLE, "n閜 Hoa chi課 th緉g nh薾 2500000 exp")
		SetTask(TSK_GIVE_EVENT_ITEM, GetTask(TSK_GIVE_EVENT_ITEM) + 1)
	end
end