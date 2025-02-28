--=============================================
--create by baiyun 2009.8.24
--describe:越南版9月份中秋活动百宝箱_黄脚本
--=============================================
Include("\\script\\online\\viet_event\\200909\\event_head.lua")

function OnUse(nItemIdx)
	--do return end
	if GetLevel() < 70 then
		Talk(1, "", "Ngi ch琲 ph秈 c� c蕄 70 tr� l猲 m韎 c� th� m� B竎h B秓 Rng");
		return 0;
	end
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(VIET_0909_TASK_OPEN_BOX_DATE) < nDate then
		SetTask(VIET_0909_TASK_OPEN_BOX_COUNT, 0);
	end
	if GetTask(VIET_0909_TASK_OPEN_BOX_COUNT) >= 8 then
		Talk(1, "", "H玬 nay c竎 h�  m� 8 B竎h B秓 Rng r錳, kh玭g th� m� th猰 頲.");
		return 0;
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		local nRand = gf_GetRandItemByTable(tbVIET_0909_BAIBAOXIANG, 1000000, 1);
		gf_SetLogCaption(VIET_0909_LOG_TITLE);
		if type(tbVIET_0909_BAIBAOXIANG[nRand][3]) == "table" then
			local nRetCode, nIndex = gf_AddItemEx(tbVIET_0909_BAIBAOXIANG[nRand][3], tbVIET_0909_BAIBAOXIANG[nRand][1]);
			if nRetCode == 1 then
				if tbVIET_0909_BAIBAOXIANG[nRand][4] ~= 0 then
					SetItemExpireTime(nIndex, tbVIET_0909_BAIBAOXIANG[nRand][4]);
				end
			end
		else
			dostring(format(tbVIET_0909_BAIBAOXIANG[nRand][3], tbVIET_0909_BAIBAOXIANG[nRand][4]));
			Msg2Player("B筺 nh薾 頲 "..tbVIET_0909_BAIBAOXIANG[nRand][1]);
		end
		gf_SetLogCaption("");
		SetTask(VIET_0909_TASK_OPEN_BOX_DATE, nDate);
		SetTask(VIET_0909_TASK_OPEN_BOX_COUNT, GetTask(VIET_0909_TASK_OPEN_BOX_COUNT) + 1);
	end
end