------------------------------------------------------------
-- 大包白云散的脚本 dabaobaiyunsan.lua
--
-- comment: 打开后获得250个白云散
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,486
-- 白云散ID: 1,0,4
------------------------------------------------------------
TSK_USE_PLB_DATE = 596
TSK_USE_HSB_DATE = 597
TSK_USE_PLB = 598
TSK_USE_HSB = 599

-- 脚本被程序默认调用的入口函数
function OnUse()
	-- Say("B筺 c� mu鑞 l蕐 <color=yellow>H遖 Th� B輈h<color> i th祅h ti襫 game kh玭g? C� th� i 頲 <color=yellow>2000<color>.",
		-- 2,
		-- "Л頲/open_panlongbi",
		-- "T筸 th阨 kh玭g m�/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

function open_panlongbi()
	local nDate = tonumber(date("%Y%m%d"));
	local nLimitTime = get_limit_time();
	if GetTask(TSK_USE_HSB_DATE) < nDate then
		SetTask(TSK_USE_HSB,0);
	end;
	if nLimitTime == -1 then
		Talk(1,"","Ъng c蕄 qu� th蕄, kh玭g th� d飊g H遖 Th� B輈h. C蕄 50 tr� l猲 m韎 c� th� d飊g H遖 Th� B輈h. ");
		return 0;
	end; 
	local nCurUseTime = GetTask(TSK_USE_HSB);
	if nCurUseTime >= nLimitTime and nLimitTime ~= 0 then
		Talk(1,"","D鵤 v祇 ng c蕄 hi謓 t筰, h玬 nay b筺 ch� c� th� d飊g <color=yellow>"..nLimitTime.."<color> H遖 Th� B輈h.");
		return 0;
	end;
	if (DelItem(2, 1, 1001, 1) == 1) then
		Earn(20000000);
		SetTask(TSK_USE_HSB_DATE,nDate);
		SetTask(TSK_USE_HSB,nCurUseTime+1);
		if nLimitTime == 0 then
			Say("B筺 nh薾 頲 <color=yellow>2000 ti襫 game<color>!",0);
		else
			Say("B筺 nh薾 頲 <color=yellow>2000 ti襫 game<color>! H玬 nay b筺  d飊g H遖 Th� B輈h l莕 th� <color=yellow>"..(nCurUseTime+1).."<color>. D鵤 v祇 ng c蕄 hi謓 t筰, h玬 nay b筺 c� th� d飊g <color=yellow>"..nLimitTime.."<color> H遖 Th� B輈h.", 0)
			Msg2Player("H玬 nay b筺 ng th�"..(nCurUseTime+1).." l莕");
		end;
		WriteLog("[H遖 Th� B輈h]:"..GetName().."H玬  l莕 "..(nCurUseTime+1).." l莕");
	else
		Say("Ngi kh玭g h� c� <color=yellow>H遖 Th� B輈h<color>", 0)
	end
end;

function get_limit_time()
	local nLevel = GetLevel();
	local nLimitTime = 0;
	if nLevel <= 50 then
		nLimitTime = -1;
	elseif nLevel <= 75 then
		nLimitTime = 1;
	else
		nLimitTime = 0;
	end;
	return nLimitTime;
end;

