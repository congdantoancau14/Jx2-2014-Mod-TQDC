--File name:	undo_common_mooncake.lua
--Describe:		未熟的特别月饼脚本
--Item ID:		2,1,30028
--Create Date:	2008-08-20
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")

--=========================================================================================
g_szLogTitle = "Ho箃 ng trung thu : ".."B竛h ch璦 ch輓 lo筰 c bi謙"		--此处分为2段只是为了不增加新的翻译
g_nVietUseMoonCakeEnd = 2048101300					--月饼的使用截止日期
g_nExpNum = 25000									--使用一个月饼获得的经验值

--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseMoonCakeEnd then
		return
	end
	if GetLevel() < 20 then
		Talk(1,"","Ch� c� ngi ch琲 t ng c蕄 t� 20 tr� l猲 m韎 c� th� s� d鬾g v藅 ph萴 n祔.")
		return
	end
	if GetTask(TOTALEXP_08_MOONCAKE_VIET) >= g_nExpTotal_MoonCakeViet then
		Msg2Player("B筺  t gi韎 h筺 甶觤 kinh nghi謒 c� th� nh薾 頲 trong ho箃 ng Trung thu l莕 n祔. "..g_nExpTotal_MoonCakeViet.." , Kh玭g th� ti誴 t鬰 s� d鬾g v藅 ph萴 n祔.");
		Talk(1,"","B筺  t gi韎 h筺 甶觤 kinh nghi謒 c� th� nh薾 頲 trong ho箃 ng Trung thu l莕 n祔. "..g_nExpTotal_MoonCakeViet.." , Kh玭g th� ti誴 t鬰 s� d鬾g v藅 ph萴 n祔.");
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		use_it()
	end
end

function use_it()
	--经验奖励部分
	local nExp = g_nExpNum
	local nExpTotal = GetTask(TOTALEXP_08_MOONCAKE_VIET)
	if nExpTotal + g_nExpNum > g_nExpTotal_MoonCakeViet then
		nExp = g_nExpTotal_MoonCakeViet - nExpTotal
	elseif nExpTotal >= g_nExpTotal_MoonCakeViet then
		nExp = 0
	end
	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( TOTALEXP_08_MOONCAKE_VIET, (nExpTotal+nExp) )
		Msg2Player("B筺 nh薾 頲  "..nExp.."  甶觤 kinh nghi謒");
		WriteLogEx(szLogTrungThuName,"nh薾",nExp,"甶觤 kinh nghi謒")		
	end
	--附加效果部分
	local nRandom = random(1,100)
	if nRandom <= 25 then
		CastState("state_vertigo", 1, 18*3)
	elseif nRandom <= 75 then
		CastState("state_confusion", 1, 18*3)
	else
		CastState("state_sleep", 1, 18*3)
	end
end



function nothing()

end
