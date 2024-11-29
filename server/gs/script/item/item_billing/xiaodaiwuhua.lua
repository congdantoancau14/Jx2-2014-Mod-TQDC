------------------------------------------------------------
-- 小袋五花玉露丸的脚本 xiaodaiwuhua.lua
--
-- comment: 打开后获得10个五花玉露丸
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1035
-- 五花玉露丸ID: 1,0,15
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("Trong n祔 c� th� ch鴄 10 <color=yellow>Ng� Hoa Ng鋍 L� ho祅<color>, m� ch�?",
		2,
		"Л頲/open_10_wuhuayuluwan",
		"T筸 th阨 kh玭g m�--H駓 b�/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

-- 打开小包，获得10个五花玉露丸
function open_10_wuhuayuluwan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 60) then
		Say("S鴆 l鵦 c馻 b筺 kh玭g  <color=yellow>60<color>, ch璦 th� m� <color=yellow>Ng� Hoa Ng鋍 L� ho祅-bao nh�<color>!", 0)
		return
	end

	if (DelItem(2, 1, 1035, 1) == 1) then
		if (AddItem(1, 0, 15, 10,5) == 0) then	-- 如果有错误没有给出来，补偿一个包
			AddItem(2, 1, 1035, 1)
		else
			Say("B筺 nh薾 頲 10 <color=yellow>Ng� Hoa Ng鋍 L� ho祅<color>!", 0)
			Msg2Player("B筺 nh薾 頲 10 Ng� Hoa Ng鋍 L� ho祅!")
		end
	else
		Say("B筺 kh玭g mang theo <color=yellow>Ng� Hoa Ng鋍 L� ho祅-bao nh�<color>!", 0)
	end
end;

