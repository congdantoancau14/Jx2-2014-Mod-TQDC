--=======================================================
--create by baiyun 2009.6.1
--describe:越南版7月份活动之三追寻胖兔子，胖兔子宝箱脚本
--
-----哇，今天是儿童节啊，久违的感觉啊。。。。。。。
--======================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function OnUse(nItemIdx)
	if tonumber(date("%y%m%d%H")) < 09061900 or tonumber(date("%y%m%d%H")) >= 49072700 then
		Talk(1, "", "V藅 ph萴  qu� h筺 s� d鬾g");
		return
	end
	local nRandItem = 0;
	if gf_Judge_Room_Weight(1, 50, " ") == 0 then
		return
	end
	
	if DelItemByIndex(nItemIdx, 1) == 1 then
		nRandItem = gf_GetRandItemByTable(tb_pangtuzi_aword, 1000000, 8);
		gf_SetLogCaption("Hoat dong truy tim tho map: Su dung ruong tho map");
		if tb_pangtuzi_aword[nRandItem][5] == 1 then
			local nRetCode, nItem = gf_AddItemEx(tb_pangtuzi_aword[nRandItem][3], tb_pangtuzi_aword[nRandItem][1]);
			if nRetCode == 1 then
				WriteLogEx("Hoat dong thang 6","Th� M藀",tb_pangtuzi_aword[nRandItem][3][4],tb_pangtuzi_aword[nRandItem][1]);
			end
			if nRetCode == 1 and tb_pangtuzi_aword[nRandItem][4] ~= 0 then
				SetItemExpireTime(nItem, tb_pangtuzi_aword[nRandItem][4]);
			end
		else
			Earn(tb_pangtuzi_aword[nRandItem][3] * 100 * 100);
			WriteLogEx("Hoat dong thang 6","nh薾 頲",tb_pangtuzi_aword[nRandItem][3], "v祅g");
		end
		gf_SetLogCaption("");
	end
end

function task_trigger()
	if tonumber(date("%y%m%d%H")) < 09061900 or tonumber(date("%y%m%d%H")) >= 49071924 then
		RemoveTrigger(GetRunningTrigger());
		return
	end
	gf_SetLogCaption("Hoat dong tho map");
	gf_AddItemEx({2, 1, 30095, 1}, "Rng th� m藀");
	WriteLogEx("Hoat dong thang 6","Th� M藀",1,"Rng Th� M藀");
	gf_SetLogCaption("");
	
end