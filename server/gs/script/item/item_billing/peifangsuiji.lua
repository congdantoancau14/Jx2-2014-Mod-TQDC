--天机宝录脚本（万宝阁万宝图）
--by vivi
--08/21/2007
--修改于2008/03/07

Include("\\script\\lib\\lingshi_head.lua")

function OnUse()
	Say("S� d鬾g V筺 B秓 C竎 V筺 B秓 у c� th� nh薾 頲 1 Linh Th筩h ph鑙 phng nh� sau, b筺 mu鑞 s� d鬾g kh玭g?\n 50% Linh Th筩h ph鑙 phng c蕄 4\n25% Linh Th筩h ph鑙 phng c蕄 5\n20% Linh Th筩h ph鑙 phng c蕄 6\n5% Linh Th筩h ph鑙 phng c蕄 7",
		2,
		"уng �/confirm_get",
		"Kh玭g s� d鬾g/nothing")
end

function confirm_get()	
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end 	
	if DelItem(2,1,2643,1) == 1 then
		local nRand = random(1,100);
		if nRand <= 50 then
			lspf_AddPeiFangInBottle(4,1)
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲1 Linh Th筩h ph鑙 phng c蕄 4,  nh藀 v祇 T� linh nh.");
		elseif nRand <= 75 then
			lspf_AddPeiFangInBottle(5,1)
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h ph鑙 phng c蕄 5,  nh藀 v祇 T� linh nh.");		
		elseif nRand <= 95 then
			lspf_AddPeiFangInBottle(6,1)
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h ph鑙 phng c蕄 6,  nh藀 v祇 T� linh nh.");
			Msg2Global("Ngi ch琲"..GetName().."M� V筺 B秓 C竎 V筺 B秓 у nh薾 畊頲 1 Linh Th筩h ph鑙 phng c蕄 6"); 	
			WriteLog("V筺 B秓 C竎 V筺 B秓 у: ngi ch琲 "..GetName().."M� V筺 B秓 C竎 V筺 B秓 у nh薾 畊頲 1 Linh Th筩h ph鑙 phng c蕄 6");
		else
			lspf_AddPeiFangInBottle(7,1)
			Msg2Player("Ch骳 m鮪g b筺  t 頲 1 linh th筩h ph鑙 phng c蕄 7  cho v祇 T� Linh жnh. ");
			Msg2Global("Ngi ch琲"..GetName().."M� V筺 B秓 C竎 V筺 B秓  nh薾 頲 nh薾 頲 1 Linh th筩h ph鑙 phng c蕄 7.");	
			WriteLog("V筺 B秓 C竎 V筺 B秓 у: ngi ch琲 "..GetName().."M� V筺 B秓 C竎 V筺 B秓  nh薾 頲 nh薾 頲 1 Linh th筩h ph鑙 phng c蕄 7.");		
		end
		AddItem(2,1,2641,1,1);
		Msg2Player("Ch骳 m鮪g b筺 t 頲 1 Linh th筩h ph鑙 phng r竎h");	
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

function nothing()

end