------------------------------------------------------------
-- 大包生生造化散的脚本 dabaoshengshengzaohuasan.lua
--
-- comment: 打开后获得250个生生造化散
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,484
-- 生生造化散ID: 1,0,16
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("Ngi mu鑞 m� tay n秈 l蕐 250 b譶h <color=yellow>Sinh Sinh H鉧 T竛<color> ch�? Xin x竎 nh薾  kho秐g tr鑞g v� s鴆 l鵦 trong h祅h trang k蝟 nh r琲 dc ph萴!",
		2,
		"Л頲/open_250_shengshengzaohuasan",
		"T筸 th阨 kh玭g m�--H駓 b�/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

-- 打开大包，获得250个生生造化散
function open_250_shengshengzaohuasan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 1750) then
		Say("S鴆 l鵦 c馻 b筺 kh玭g  <color=yellow>1750<color>, kh玭g m� 頲 <color=yellow>Sinh Sinh H鉧 T竛 (i)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 484, 1) == 1) then
		if (AddItem(1, 0, 16, 250) == 0) then	-- 如果有错误没有给出来，补偿一个包
			AddItem(2, 1, 484, 1)
		else
			Say("B筺 nh薾 頲 250 b譶h <color=yellow>Sinh Sinh H鉧 T竛<color>!", 0)
			Msg2Player("B筺 nh薾 頲 250 b譶h Sinh Sinh H鉧 T竛!")
		end
	else
		Say("B筺 kh玭g mang theo <color=yellow>Sinh Sinh H鉧 T竛 (i)<color>!", 0)
	end
end;

