Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\function\\honor_tong\\ht_define.lua")
Include("\\script\\lib\\date.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\sdb.lua")
Include("\\script\\system_switch_config.lua")

function ht_IsOpen()
	return IsHonorTongOpen();
end

function ht_CheckCondition()
	if ht_IsOpen() ~= 1 then
		return 0;
	end
	if gf_CheckBaseCondition(90) ~= 1 then
		return 0;
	end
	
	if gf_Check55HaveSkill() ~= 1 then
		Talk(1,"",HT_NPC.."C¸c h¹ ch­a häc skill 55!")
		return 0;
	end
	local nJoinTime = GetJoinTongTime();
	if nJoinTime <= 0 or GetTime() - nJoinTime < 7 * 24 * 3600 then
		Talk(1,"",HT_NPC..format("%s ch­a gia nhËp bang héi hoÆc thêi gian gia nhËp kh«ng ®ñ %d ngµy", gf_GetPlayerSexName(), 7));
		return 0;
	end
	return 1;
end

function ht_GetTimeFunc()
	local today = Date();
	local wDay = today:week();
	if wDay == 0 then
		return 0
	end
	
	if wDay == 6 then
		local hour = tonumber(date("%H%M"));
		if hour >= 2000 and hour < 2030 then
			--ÕûÀíÅÅÃûÊ±¼ä
			return 2;
		end
		if hour >= 2030 and hour < 2330 then
			--ÁìÈ¡ÅÅÃû½±ÀøÊ±¼ä
			return 3;
		end
	end
	--µÇ¼Ç»òÉÏ½»Ê±¼ä
	return 1;
end

function ht_WeeklyReset()
	gf_SetTaskByte(HT_TASK_1, 1, 0, TASK_ACCESS_CODE_HONOR_TONG);
	gf_SetTaskByte(HT_TASK_1, 3, 0, TASK_ACCESS_CODE_HONOR_TONG);
end

function ht_SignTong()
	local s = SDB(HT_TONG_VALUE_RANK, 0, 0);
	s:apply2(_ht_SignTong);
end

function _ht_SignTong(nCount, sdb)
	local bNeedSign = 1;
	local szTongName = GetTongName();
	local nWeekly = gf_GetWeekly();
	for i = 1, nCount do
		local sData = sdb[i-1];
		if sData and getn(sData) == HT_DATA_COL_NUM and tostring(sData[1]) == szTongName and
			tonumber(sData[2]) == nWeekly and tonumber(sData[3]) ~= 0 then
			bNeedSign = nil;
		end
	end
	if bNeedSign then
		if Pay(HT_COST_GOLD*10000) ~= 1 then
			return 0;
		end
		local s = SDB(HT_TONG_VALUE_RANK, 0, 0);
		s[szTongName] = {"dddddd", nWeekly, 1, 0, 0, 0, GetTime()};
		Talk(1,"",HT_NPC.."§¨ng ký tham gia Bang Héi Vinh Danh thµnh c«ng!");
		Msg2Player("§¨ng ký tham gia Bang Héi Vinh Danh thµnh c«ng!");
		Msg2Tong("Bang chñ ®¨ng ký tham gia Bang Héi Vinh Danh thµnh c«ng, c¸c thµnh viªn h·y nhanh chãng ®i t×m §¹i Sø Ho¹t §éng ®Ó tham gia nµo!");
		return 1;
	end
	Talk(1,"",HT_NPC.."B¹n ®· ®¨ng ký råi! <color=red>Kh«ng cÇn ph¶i ®¨ng ký l¹i<color>");
	return 0;
end

function ht_buildTong_AskforClient()
	local nItemCount = floor(GetItemCount(2,1,30588)/HT_HAND_ITEM_1);
	local nXuCount = floor(GetItemCount(2,1,30230)/HT_HAND_ITEM_1);
	local nMaxCount = floor(2000000000/HT_AWARD_EXP);
	AskClientForNumber("ht_buildTong", 0, min(min(nItemCount, nXuCount),nMaxCount), "H·y nhËp vµo sè lÇn", "")
end

function ht_buildTong(nNum)
	if nNum <= 0 then
		return 0;
	end
	local s = SDB(HT_TONG_VALUE_RANK, 0, 0);
	s:apply2(callout(_ht_buildTong, nNum));
end

function _ht_buildTong(nNum, nCount, sdb)
	local szTongName = GetTongName();
	local nWeekly = gf_GetWeekly();
	for i = 1, nCount do
		local sData = sdb[i-1];
		if sData and getn(sData) == HT_DATA_COL_NUM and tostring(sData[1]) == szTongName then
			if tonumber(sData[2]) ~= nWeekly then
				Talk(1,"",HT_NPC..format("Bang héi cña %s <color=red>tuÇn nµy<color> ch­a ®¨ng ký tham gia Bang Héi Vinh Danh!", gf_GetPlayerSexName()));
				return 0;
			end
			if tonumber(sData[3]) == 0 then
				Talk(1,"",HT_NPC..format("Bang héi cña %s vÉn ch­a ®¨ng ký tham gia Bang Héi Vinh Danh!", gf_GetPlayerSexName()));
				return 0;
			end
			if DelItem(2, 1, 30588, nNum) ~= 1 or DelItem(2, 1, 30230, nNum) ~= 1 then
				Talk(1,"",HT_NPC.."Nguyªn liÖu kh«ng ®ñ, cèng hiÕn x©y dùng bang héi thÊt b¹i!");
				return 0;
			end
			local nPlayerCount = 0;
			if gf_GetTaskByte(HT_TASK_1, 1) == 0 then
				nPlayerCount = 1;
				gf_SetTaskByte(HT_TASK_1, 1, 1, TASK_ACCESS_CODE_HONOR_TONG);
			end
			local nTime = GetTime();
			if tonumber(sData[4]) >= HT_TONG_VALUE_LIMIT then
				nTime = tonumber(sData[7]);
			end
			local s = SDB(HT_TONG_VALUE_RANK, 0, 0);
			s[szTongName] = {"dddddd", nWeekly, 1, tonumber(sData[4]) + nNum, tonumber(sData[5]) + nPlayerCount, tonumber(sData[6]), nTime}; 
			gf_ModifyExp(HT_AWARD_EXP * nNum);
			Msg2Tong(format("[%s] cèng hiÕn x©y dùng bang héi thµnh c«ng %d lÇn!", GetName(), nNum));
			Talk(1,"",HT_NPC..format("Chóc mõng %s cèng hiÕn x©y dùng bang héi thµnh c«ng %d lÇn", gf_GetPlayerSexName(), nNum));
			return 1;
		end
	end
	Talk(1,"",HT_NPC..format("Bang héi cña %s vÉn ch­a ®¨ng ký tham gia Bang Héi Vinh Danh!", gf_GetPlayerSexName()));
	return 0;
end

function ht_TongRank_Show()
	local s = SDB(HT_TONG_VALUE_RANK, 0, 0);
	s:apply2(_ht_TongRank_Show);
end

function _ht_TongRank_Show(nCount, sdb)
	if nCount <= 0 then
		Talk(1,"",HT_NPC.."HiÖn t¹i vÉn ch­a cã th«ng tin xÕp h¹ng cña Bang Héi Vinh Danh!");
		return 0;
	end
	local tSortRank = ht_GetRankTable(nCount, sdb);
	local nRank = 0;
	local nValue = 0;
	local nPlayerCount = 0;
	local szTongName = GetTongName();
	local tTongInfo = ht_FindTongRankInfo(szTongName, tSortRank);
	if tTongInfo then
		nRank = tTongInfo[1];
		nValue = tTongInfo[2];
		nPlayerCount = tTongInfo[3];
	end
	local title = "Quý bang ch­a cã th«ng tin xÕp h¹ng!";
	if nRank > 0 and nValue > 0 and nPlayerCount > 0 then
		title = format("HiÖn t¹i quý bang xÕp h¹ng %d, tæng ®iÓm cèng hiÕn lµ %d, tæng sè ng­êi cèng hiÕn lµ %d!", nRank, nValue, nPlayerCount);
	end
	local tSay = {};
	for i = 1, getn(tSortRank) do
		tinsert(tSay, format("H¹ng %d [%s], cèng hiÕn %d ®iÓm, sè l­îng cèng hiÕn %d ng­êi", tSortRank[i][1], tSortRank[i][4], tSortRank[i][2], tSortRank[i][3]));
	end
	tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing");
	Say(HT_NPC..title, getn(tSay), tSay);
end

function ht_GetRankAward()
	local s = SDB(HT_TONG_VALUE_RANK, 0, 0);
	s:apply2(_ht_GetRankAward);
end

function _ht_GetRankAward(nCount, sdb)
	if nCount <= 0 then
		Talk(1,"",HT_NPC.."T¹m thêi kh«ng thÓ nhËn phÇn th­ëng xÕp h¹ng!");
		return 0;
	end
	local tSortRank = ht_GetRankTable(nCount, sdb);
	local szTongName = GetTongName();
	local tTongInfo = ht_FindTongRankInfo(szTongName, tSortRank);
	if not tTongInfo then
		Talk(1,"",HT_NPC.."Kh«ng t×m ®­îc th«ng tin xÕp h¹ng cña quý bang!");
		return 0;
	end
	if tTongInfo[2] < HT_TONG_VALUE_LIMIT then
		Talk(1,"",HT_NPC..format("§iÓm cèng hiÕn cña quý bang lµ %d, ch­a ®¹t yªu cÇu %d ®iÓm, kh«ng thÓ nhËn phÇn th­ëng xÕp h¹ng!", tTongInfo[2], HT_TONG_VALUE_LIMIT));
		return 0;
	end
	if gf_GetTaskByte(HT_TASK_1, 4) ~= mod(gf_GetWeekly(), 255) + 1 then
		gf_SetTaskByte(HT_TASK_1, 2, 0, TASK_ACCESS_CODE_HONOR_TONG);
	end
	if gf_GetTaskByte(HT_TASK_1, 2) ~= 0 then
		Talk(1,"",HT_NPC..format("%s ®· nhËn phÇn th­ëng xÕp h¹ng, kh«ng thÓ nhËn l¹i!", gf_GetPlayerSexName()));
		return 0;
	end
	local nTongDuty = GetTongDuty();
	if nTongDuty ~= 1 then
		--°ïÖÚ
		gf_SetTaskByte(HT_TASK_1, 2, min(tTongInfo[1],255), TASK_ACCESS_CODE_HONOR_TONG);
		gf_SetTaskByte(HT_TASK_1, 4, mod(gf_GetWeekly(), 255) + 1, TASK_ACCESS_CODE_HONOR_TONG);
		gf_ModifyExp(tTongInfo[3]*1000000);
		if tTongInfo[1] == 1 then
			--¸øÈÙÓþ°ïÅÉ³ÆºÅ
			RemoveTitle(69, 2);
			AddTitle(69, 2);
			SetTitleTime(69, 2, GetTime() + 7*24*3600 - 40*60);
			Msg2Player(format("Chóc mõng %s nhËn ®­îc danh hiÖu %q", gf_GetPlayerSexName(), "Bang Héi Vinh Danh"));
		end
	else
		--°ïÖ÷
		if gf_Judge_Room_Weight(1, 10,1) ~= 1 then
			return 0;
		end
		if tTongInfo[5] ~= 0 then
			Talk(1,"",HT_NPC..format("Bang nµy ®· nhËn phÇn th­ëng xÕp h¹ng bang chñ, kh«ng thÓ nhËn l¹i!"));
			return 0;
		end
		--ÒÑÁìÈ¡±ê¼Ç
		local s = SDB(HT_TONG_VALUE_RANK, 0, 0);
		s[szTongName] = {"dddddd", gf_GetWeekly(), 1, tTongInfo[2], tTongInfo[3], 1, tTongInfo[6]};
		gf_SetTaskByte(HT_TASK_1, 2, min(tTongInfo[1],255), TASK_ACCESS_CODE_HONOR_TONG);
		gf_SetTaskByte(HT_TASK_1, 4, mod(gf_GetWeekly(), 255) + 1, TASK_ACCESS_CODE_HONOR_TONG);
		--¸ø½±Àø
		gf_ModifyExp(tTongInfo[3]*1000000);
		gf_AddItemEx2({2,1,30760,1,4}, "Vâ L©m TriÖu TËp LÖnh", "Bang Héi Vinh Danh", "Gi¶i th­ëng xÕp h¹ng", 6*24*3600, 1);
		if tTongInfo[1] == 1 then
			--¸øÈÙÓþ°ïÖ÷³ÆºÅ
			RemoveTitle(69, 1);
			AddTitle(69, 1);
			SetTitleTime(69, 1, GetTime() + 7*24*3600 - 40*60);
			local msg = format("Chóc mõng bang [%s] xÕp h¹ng 1 trong Bang Héi Vinh Danh, bang chñ [%s] vinh dù nhËn ®­îc danh hiÖu %q!", szTongName, GetName(), "Bang Chñ Vinh Dù");
			Msg2Global(msg);
			AddLocalNews(msg);
			Msg2Tong(msg)
		end		
	end
end

function ht_GetRankTable(nCount, sdb)
	local tSortRank = {}; --{Value, PlayerCount, TongName, IsGetTongMasterAward, time};
	local nWeekly = gf_GetWeekly();
	for i = 1, nCount do
		local sData = sdb[i-1];
		if sData and getn(sData) == HT_DATA_COL_NUM and 
		tonumber(sData[2]) == nWeekly and 
		tonumber(sData[3]) ~= 0 and
		tonumber(sData[4]) > 0 and 
		tonumber(sData[5]) > 0 then
			tinsert(tSortRank, {tonumber(sData[4]), tonumber(sData[5]), tostring(sData[1]), tonumber(sData[6]), tonumber(sData[7])});
		end
	end
	--for i = 1, getn(tSortRank) do
	--	print(tSortRank[i][1],tSortRank[i][2],tSortRank[i][3],tSortRank[i][4])
	--end
	local sortComp = function (a, b)
		if a[1] ~= b[1] then
			return a[1] > b[1];
		elseif a[2] ~= b[2] then
			return a[2] > b[2];
		else
			return a[5] < b[5];
		end
	end
	sort(tSortRank, sortComp);
	--print("--------------")
	--for i = 1, getn(tSortRank) do
	--	print(tSortRank[i][1],tSortRank[i][2],tSortRank[i][3],tSortRank[i][4])
	--end
	local tRezultRank = {}; --{nRank, Value, PlayerCount, TongName, IsGetTongMasterAward, time}
	local nRank = 0;
	--local nLastValue = 0;
	--local nLastPlayerCount = 0;
	for i = 1, getn(tSortRank) do
		--if nLastValue ~= tSortRank[i][1] or nLastPlayerCount ~= tSortRank[i][2] then
			nRank = nRank + 1;
			--nLastValue = tSortRank[i][1];
			--nLastPlayerCount = tSortRank[i][2];
		--end
		tinsert(tRezultRank, {nRank, tSortRank[i][1], tSortRank[i][2], tSortRank[i][3], tSortRank[i][4], tSortRank[i][5]});
		if nRank >= HT_SHOW_RANK_LIMIT then
			break;
		end
	end
	return tRezultRank;
end

function ht_FindTongRankInfo(szTongName, tRank)
	for i = 1, getn(tRank) do
		if szTongName == tRank[i][4] then
			return tRank[i];
		end
	end
	return nil;
end

function ht_GetTongChip(nProp, nNum)
	if ht_IsOpen() ~= 1 then
		return 0;
	end
	if gf_CheckBaseCondition(90) ~= 1 then
		return 0;
	end
	local nJoinTime = GetJoinTongTime();
	if nJoinTime <= 0 or GetTime() - nJoinTime < 7 * 24 * 3600 then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10,1) ~= 1 then
		return 0;
	end
	if random(100) > nProp then
		return 0;
	end
	gf_AddItemEx2({2,1,30588,nNum}, "M¶nh LÖnh Bµi Bang Héi", "Bang Héi Vinh Danh", "TÝnh n¨ng sinh ra", 0, 1);	
end

