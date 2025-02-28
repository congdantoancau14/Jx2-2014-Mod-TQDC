--越南版三月活动头文件
--by vivi
--2008/03/05

--任务变量
TASK_MARCH_FENHONG = 2412; --记录玩家使用粉红玫瑰的次数
TASK_MARCH_HONG = 2413;    --记录玩家使用红玫瑰的次数
TASK_MARCH_AWARD_TIME = 2414; --记录玩家兑换玫瑰的日期
TASK_MARCH_AWARD_NUM = 2415; --记录玩家兑换玫瑰的次数

MARCH_TRIGGER_ID = 111;        --触发器id
KILL_MARCH_ID = 704;         --自定义ID

FENHONG_EXP = 5000;            --粉红玫瑰经验
HONG_EXP = 15000;							 --红玫瑰经验
TOTAL_EXP = 10000000;          --每名玩家获得的最高经验（玫瑰）

--玫瑰掉落和兑换日期
function get_march_state()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20080318 and nDate <= 20480325 then
		return 1;
	else
		return 0;
	end
end

function check_rose_date()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20080318 and nDate <= 20480331 then
		return 1;
	else
		return 0;
	end	
end

--礼官对话入口
function talk_march()
	Say("<color=green>L� Quan<color>: Thu th藀 hoa h錸g n閜 cho L� Quan nh薾 ph莕 thng. D飊g 7 hoa h錸g ph蕁 + 3 hoa h錸g  + 1 l� th駓 nh薾 頲 100.000 甶觤 kinh nghi謒, m鏸 ng祔 m鏸 nh﹏ v藅 ch� c� th� i 1 l莕. L莕 th� t�, l莕 th� t竚 ngi ch琲 s� nh薾 th猰 1 b譶h B錸g Lai Ti猲 Th駓. Ch� �,  nh﹏ v藅 c蕄 40 tr� l猲 m韎 c� th� tham gia ho箃 ng n祔, B筺 ng � i kh玭g?",
		2,
		"�, ta mu鑞 i./confirm_march_change",
		"T筸 th阨, kh玭g mu鑞 i./nothing")
end

function confirm_march_change()
	local nLv = GetLevel();
	local nDate = tonumber(date("%Y%m%d"));
	
	if nLv <= 40 then
		Talk(1,"","<color=green>L� Quan<color>: Xin l鏸, ngi ch琲 c蕄 40 tr� l猲 m韎 c� th� tham gia ho箃 ng n祔.");
		return
	end
	if GetTask(TASK_MARCH_AWARD_TIME) >= nDate then
		Talk(1,"","<color=green>L� Quan<color>: M鏸 ng祔 m鏸 nh﹏ v藅 ch� c� th� i 1 l莕.");
		return
	end
	if GetItemCount(2,0,1164) < 7 or GetItemCount(2,0,1162) < 3 or GetItemCount(2,0,351) < 1 then
		Talk(1,"","<color=green>L� Quan<color>: Mu鑞 i c莕 7 hoa h錸g ph蕁 + 3 hoa h錸g  + 1 l� th駓, dng nh� v蒼 ch璦 ?");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if DelItem(2,0,1164,7) == 1 and DelItem(2,0,1162,3) == 1 and DelItem(2,0,351,1) == 1 then
		SetTask(TASK_MARCH_AWARD_TIME,nDate);
		SetTask(TASK_MARCH_AWARD_NUM,GetTask(TASK_MARCH_AWARD_NUM)+1);
		ModifyExp(100000);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 100.000 甶觤 kinh nghi謒.");
		if GetTask(TASK_MARCH_AWARD_NUM) == 4 or GetTask(TASK_MARCH_AWARD_NUM) == 8 then
			AddItem(2,1,1012,1);
		end
	end
end

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测
--村长 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"","<color=red>S鴆 l鵦<color> c馻 b筺 kh玭g !")
			return 0
		else 
			return 1
		end
end