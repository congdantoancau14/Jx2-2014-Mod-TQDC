--====================================================
--create by baiyun 2009.6.3
--describe:越南版7月份活动之七争夺英雄之位，逍遥使者脚本
--ps:该活动只举行在新服，前十名由人工选出来，此脚本目前只实现发奖
--====================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function main()
	--do return end
	get_aword();
end

function get_aword()
	if GetTask(TASK_YINGXIONG_GET) == 1 then
		Talk(1, "", "<color=green>Ti猽 Dao S� Gi�<color>: Чi hi謕  nh薾 ph莕 thng r錳, kh玭g th� nh薾 ti誴 頲 n鱝.");
		return
	end
	if GetExtPoint(1) < 2 then
		Talk(1, "", "<color=green>Ti猽 Dao S� Gi�<color>: G箃 ta �? Ngi m� c騨g l� cao th� sao?");
		return
	end
	--判断玩家是否有资格
		--这里添加判断的代码
	--判断完成
	local nBody = GetBody();
	if gf_Judge_Room_Weight(3, 400, " ") == 0 then
		return
	end
	if GetExtPoint(1) == 2 then
		if PayExtPoint(1,2) == 1 then			
			for i = 1, 3 do
				local nRet = AddItem(tb_yingxiong_aword[i][nBody][2], tb_yingxiong_aword[i][nBody][3], tb_yingxiong_aword[i][nBody][4], 1,1,-1,-1,-1,-1,-1,-1)
				if nRet == 1 then
					Msg2Player("B筺 nh薾 頲 1 ".. tb_yingxiong_aword[i][nBody][1])
					WriteLogEx("Hoat dong thang 6","Ti猽 Giao S� Gi�",1, tb_yingxiong_aword[i][nBody][1])
				else
					WriteLogEx("Hoat dong thang 6","add item th蕋 b筰",1, tb_yingxiong_aword[i][nBody][1])
				end
			end			
			SetTask(TASK_YINGXIONG_GET, 1);
		end
	end
end

function nothing()
end