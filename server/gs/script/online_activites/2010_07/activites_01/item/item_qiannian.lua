--=============================================
--create by zhangming 2010.6.18
--describe:越南版2010年7月活动1 纪念升龙一千年脚本文件
--=============================================

Include("\\script\\online_activites\\2010_07\\activites_01\\head.lua");--活动头文件
Include("\\script\\online\\viet_event\\vng_task_control.lua");

g_szItemSayHead = gf_FixColor(VET_201007_01_TB_ITEM_LIST[15][1], 2, 1);

tb_list_1000_chat = 
{
	[1] = "Ch� c遪 %d ng祔 n鱝 l� n k� ni謒 1000 n╩ Th╪g Long r錳!",
	[2] = "Чi L� m鮪g 1000 n╩ Th╪g Long c遪 %d ng祔 n鱝 s� di詎 ra!",
	[3] = "%d ng祔 n鱝 l� Чi L� 1000 n╩ Th╪g Long, c飊g t ph竜 hoa n祇!",
	[4] = "C遪 %d ng祔 n鱝 th玦, ch� i l� h筺h ph骳!",
	[5] = "Ch骳 c竎 b筺 1 ng祔 l� vui v�!",
	[6] = "K� ni謒 1000 n╩ Th╪g Long ch髇g ta 甶 ch琲 n祇!",
	[7] = "Ch骳 m鮪g Чi L� k� ni謒 1000 n╩ Th╪g Long!",
}

function OnUse(nItemIdx)
	if tonumber(date("%y%m%d")) > 401024 then
		return
	end
	if GetLevel() < 77 or GetPlayerFaction() == 0 or gf_Check55FullSkill() == 0 then
            Talk(1,"","Ch� c� nh﹏ v藅 ng c蕄 77 tr� l猲,  gia nh藀 m玭 ph竔 v� th玭g th筼 k� n╪g c蕄 55 m韎 c� th� s� d鬾g v藅 ph萴 n祔!")
            return
     end
--	X竎 nh ng祔 th竛g s� d鬾g v� s� l莕 s� d鬾g item
    local nCount = mod(GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM), 100)
--    local nReceive = mod(floor(GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM) / 100), 100)
    local nUseDate = floor(GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM) / 10000)
    
    local nCurDate = tonumber(date("%m%d"))
    if nCurDate ~= nUseDate then
    		SetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM, nCurDate * 10000)
    end
    if nCount >= 40 then
        Talk(1,"","M鏸 ng祔 ch� c� th� s� d鬾g t鑙 產 40 l莕!")
        return
    end
    local nDelay = 30 - (GetTime() - GetTask(VET_1000_THANGLONG_TIME))
    if nDelay >= 0 then
    	   Talk(1,"",format("C遪 %d gi﹜ n鱝 m韎 c� th� ti誴 t鬰 s� d鬾g", nDelay))
        return
    end
    local nHour = tonumber(date("%H%M"))
    if (nHour >= 0900 and nHour <= 1000) or (nHour >= 1530 and nHour <= 1630) or (nHour >= 2030 and nHour <= 2130) then  
	    if DelItemByIndex(nItemIdx, 1) == 1 then
	        DoFireworks(871, 1)
	    	   local nExp = 200000
	        SetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM,GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM)+1)
	        if tonumber(date("%y%m%d")) == 401010 then
	        		nExp = 400000
	        end
	        if tonumber(date("%y%m%d")) < 401010 then
	        local nDes = 10
	        	if tonumber(date("%m")) == 9 then
	        		nDes = nDes + 30
	        	end
	        	local nDay = nDes - tonumber(date("%d"))
	        	NpcChat(PIdx2NpcIdx(), format(tb_list_1000_chat[random(1,4)], nDay))
	        else
	        	NpcChat(PIdx2NpcIdx(), tb_list_1000_chat[random(5,7)])
	        end
	        nExp = VET_201007_01_get_exp(nExp)
	        Msg2Player("Nh薾 頲 "..nExp.." 甶觤 kinh nghi謒.")
	        SetTask(VET_1000_THANGLONG_TIME, GetTime())
	        StartTimeGuage("1000 n╩ Th╪g Long", 30,0,1)
	        gf_WriteLogEx("Hoat dong thang 9 nam 2010", "S� d鬾g 1000 n╩ Th╪g Long nh薾 "..nExp.." 甶觤 kinh nghi謒")
	    end
	else
		Talk(1,"","Ch� c� th� s� d鬾g v藅 ph萴 n祔 trong kho秐g th阨 gian t� 9 gi� n 10 gi�, 15 gi� 30 n 16 gi� 30, 20 gi� 30 n 21 gi� 30.")
		return
	end
end

function get_1000_tl()
    local nUseDate = floor(GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM) / 10000)
    local nCurDate = tonumber(date("%m%d"))
    if nCurDate ~= nUseDate then
    		SetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM, nCurDate * 10000)
    end
    if gf_Judge_Room_Weight(2, 2," ") ~= 1 then
        	return
    end
    local nReceive = floor(mod(GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM), 1000)/100)
    if GetLevel() < 77 or GetPlayerFaction() == 0 or gf_Check55FullSkill() == 0 then
            Talk(1,"","Ch� c� nh﹏ v藅 ng c蕄 77 tr� l猲,  gia nh藀 m玭 ph竔 v� th玭g th筼 k� n╪g c蕄 55 m韎 c� th� nh薾 v藅 ph萴 n祔!")
            return
     end
    if nReceive >= 1 then
    	   Talk(1,"","M鏸 ng祔 ch� c� th� nh薾 v藅 ph萴 n祔 1 l莕!")
        return
    end
    gf_AddItemEx2({2,1,30219,40}, "K� Ni謒 1000 n╩ Th╪g Long", "Hoat dong thang 9 nam 2010", "nh薾")
    SetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM, GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM) + 100)
end