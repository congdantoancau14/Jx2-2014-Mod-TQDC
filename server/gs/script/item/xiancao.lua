
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 仙草露使用文件
-- Edited by peres
-- 2005/08/16 AM 11:20

-- 只有晚上他们是在一起的
-- 他靠近她，拥抱她
-- 他的手指和皮肤
-- 她看着他，心里柔软而疼痛
-- 她想，她还是爱他
-- 她不想抱怨什么
-- 每天晚上他们都在做爱
-- 她不知道，除了这种接触，她的安全感和温暖，还能从哪里取得
-- 她喜欢那一瞬间。仿佛在黑暗的大海上，漂向世界的尽头

-- ======================================================

--add by lizhi
-- 前3列是物品类别,第4位是时间,第5位是速度 / 100 = 多少倍

-- 注意，初始化操作移动到 \script\global\autoexec.lua 中！
tItemInfo =
{
	{2, 1, 1012, 7200, 150, "B錸g Lai Ti猲 Th駓",1},
	{2, 0, 109, 7200, 200, "B錸g Lai Ti猲 L�",1.5},
	{2, 1, 1013, 7200, 300, "B錸g Lai Ti猲 Кn",2},
	{2, 1, 1052, 7200, 120, "B錸g Lai L� Th駓",0},
}

keepsake_date_TaskID = 1241
keepsake_num_TaskID = 1227		--2007端午，挂蓬莱信物增加
--2007七夕任务变量
TASK_FLOWER_GROW = 2391; --记录花的成长度
TASK_TOTAL_TIME = 2394; --当天累积在线时间
TASK_IS_PLANT = 2396; --是否种下了神秘的花
TASK_IS_GROW = 2397; --当天成长度是否已经加过，存入day

function OnUse(nidx)
	local nItemIndex = tonumber(nidx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	for index, value in tItemInfo do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			TestEat(index)
			break
		end
	end
end

function ConfirmEat(nItem)
	if DelItem(tItemInfo[nItem][1], tItemInfo[nItem][2], tItemInfo[nItem][3], 1) == 1 then
		local nRet = EatXcl(nItem, tItemInfo[nItem][4])
		if nRet == 1 then
			Msg2Player("B筺 nh薾 頲 "..tItemInfo[nItem][6].."*hi謚 qu�")
		end
	end
end

function TestEat(nIndex)
	local nType, nTime, nSpeed = GetExistXclInfo()
	if nTime > 0 then
		if tItemInfo[nIndex][5] < nSpeed then
			Say("B筺 nh薾 頲 hi謚 qu�"..tItemInfo[nType][6].."m筺h nh蕋, kh玭g th� s� d鬾g"..tItemInfo[nIndex][6], 0)
		elseif tItemInfo[nIndex][5] == nSpeed then
			ConfirmEat(nIndex)
		elseif tItemInfo[nIndex][5] > nSpeed then
			Say("Hi謓 b筺 b筺 c� "..tItemInfo[nType][6]..", mu鑞 i th祅h"..tItemInfo[nIndex][6].."?\n<color=red>Ch� �: Sau khi thay i th阨 gian hi謚 qu� ban u s� tr� v� 0<color>", 2, "ng/#ConfirmEat("..nIndex..")", "Sai/no_say")
		end
	else
		ConfirmEat(nIndex)
	end
end
--每分钟加一次信物
--村长
function OnTimer(nSpeed)
	local dragon_boat_flag = GetTask(keepsake_date_TaskID)
	if dragon_boat_flag ~= 0 and dragon_boat_flag ~= nil then
		for i = 1,getn(tItemInfo) do
			if nSpeed == tItemInfo[i][5] then
				SetTask(keepsake_num_TaskID,(GetTask(keepsake_num_TaskID) + tItemInfo[i][7]))
				break
			end
		end
	end
	
--2007七夕	
	if nSpeed == tItemInfo[1][5] or nSpeed == tItemInfo[2][5] or nSpeed == tItemInfo[3][5] then
		local nFlowerPlantFlog = GetTask(TASK_IS_PLANT); 
		if nFlowerPlantFlog ~= 0 and nFlowerPlantFlog ~= nil and GetTask(TASK_FLOWER_GROW) < 100 then
			local nLastDay = floor((GetTime()+28800-60)/86400); --前一分钟的日期，用于判断夸天
			local nNowDay = floor((GetTime()+28800)/86400);		 
			if nLastDay ~= nNowDay then  --夸天了，清0
				SetTask(TASK_TOTAL_TIME,0);
			end
			if GetTask(TASK_IS_GROW) < nNowDay then  --当天还没成长过
				SetTask(TASK_TOTAL_TIME,GetTask(TASK_TOTAL_TIME)+1); --累计时间，单位：分
				if GetTask(TASK_TOTAL_TIME) >= 60 then
					SetTask(TASK_FLOWER_GROW,GetTask(TASK_FLOWER_GROW)+1);
					SetTask(TASK_IS_GROW,nNowDay);
					SetTask(TASK_TOTAL_TIME,0);
				end
			end
		end	
	end	
end
function no_say()

end
