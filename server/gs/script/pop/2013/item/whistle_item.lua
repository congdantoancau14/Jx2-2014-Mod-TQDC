--³õÌ½ÖØÃ÷
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

--ĞèÒªÈ¥µÄµã
sOtherMapMsg = "H¶i §«ng Thanh nghe thÊy tiÕng huıt sao liÒn h­íng vÒ ng­¬i ra hiÖu, khu vùc nµy kh«ng cã t×nh b¸o, b¶o ng­¬i ®Õn <color=red>Ngäa Long §éng 1<color>, <color=red>Ngäa Long §éng 2<color>, <color=red>Ngäa Long §éng 3<color> t×m thö."
sAllMapFindMsg = "TÊt c¶ t×nh b¸o ®Òu bŞ ph¸t hiÖn.";
g_tMapName = {" <color=red>Ngäa Long §éng 1<color> "," <color=red>Ngäa Long §éng 2<color> "," <color=red>Ngäa Long §éng 3<color> "};

g_tGTaskId = {1325,1339};  --Éæ¼°µ½µÄÈÎÎñid ²é¿´gtask_main

g_nMapId1 = 610;
g_nMapId2 = 611;
g_nMapId3 = 612;

tTreasureTable = {
	[g_nMapId1] = {			--ÎÔÁú¶´Ò»²ãÇé±¨
		{610,2163,4244,},
		{610,2169,4204,},
		{610,2244,4354,},
		{610,1835,4317,},
		{610,2074,4065,},
	},
	[g_nMapId2] = {			--ÎÔÁú¶´¶ş²ãÇé±¨
		{611,2163,4244,},
		{611,2169,4204,},
		{611,2244,4354,},
		{611,1835,4317,},
		{611,2074,4065,},
	},
	[g_nMapId3] = {			--ÎÔÁú¶´Èı²ãÇé±¨
		{612,2163,4244,},
		{612,2169,4204,},
		{612,2244,4354,},
		{612,1835,4317,},
		{612,2074,4065,},
	},
}
	
tBitIdx = {
	[g_nMapId1] = 1, [g_nMapId2] = 2,[g_nMapId3] = 3,
	}	
	
tAward = {
	[g_nMapId1] = {"T×nh B¸o Ngäa Long §éng 1", {2, 111,3,1}, },
	[g_nMapId2] = {"T×nh B¸o Ngäa Long §éng 2", {2, 111,4,1}, },
	[g_nMapId3] = {"T×nh B¸o Ngäa Long §éng 3", {2, 111,5,1}, },
};

--TASKID_2013_NEW_TASK_SEARCH  bit_1 bit_2 bit_3 ¼ÇÂ¼3¸öµØÍ¼µÄ±¦²ØÊÇ·ñÕÒµ½£¬byte_2 ¼ÇÂ¼Ëæµ½µÄµØÍ¼×ø±êµÄIdx
function OnUse(nItemIndex)
		--ÅĞ¶ÏÓĞÃ»ÓĞ½ÓÈÎÎñ
	local nHasTask = 0;
	for i = 1,getn(g_tGTaskId) do
		if 1 == tGtTask:check_cur_task(g_tGTaskId[i])  then
			nHasTask = 1
			break;
		end
	end
	if nHasTask ~= 1 then
		Talk(1, "", "<color=green>Nhan ThŞ Tİn Tiªu<color>: Ng­¬i ch­a nhËn nhiÖm vô!");
		return 0;
	end
	local nMapID, nMapX, nMapY = GetWorldPos();
	--µØÍ¼´íÎó
	local nIdx1 = gf_GetTaskByte(TASKID_2013_NEW_TASK_SEARCH,2);
	if nIdx1 == 0 then 
			nIdx1 = random(1,getn(tTreasureTable[g_nMapId1]));
			gf_SetTaskByte(TASKID_2013_NEW_TASK_SEARCH,2,nIdx1);
	end	
	if not tTreasureTable[nMapID] then
		Talk(1,"",sOtherMapMsg);
		return 0;
	end
	local sMapMsg = "H¶i §«ng Thanh nghe thÊy tiÕng huıt sao liÒn h­íng vÒ ng­¬i ra hiÖu, khu vùc nµy kh«ng cã t×nh b¸o, b¶o ng­¬i ®Õn ";
--	local tMapNum = {"ÕÒÑ°¡£","ÕÒÑ°¡£"};
	if  gf_GetTaskBit(TASKID_2013_NEW_TASK_SEARCH,tBitIdx[nMapID]) == 1 then --Õâ¸öµØÍ¼µÄÇé±¨ÒÑ¾­±»·¢ÏÖÁË¡£
		local nUnfindMap = 0;
		for i = 1,3 do
			if gf_GetTaskBit(TASKID_2013_NEW_TASK_SEARCH,i) == 0 then
				nUnfindMap = nUnfindMap + 1;
				sMapMsg = sMapMsg .. g_tMapName[i];
			end
		end
		if nUnfindMap == 0 then
			Talk(1,"",sAllMapFindMsg);
			return 0;
		else
			sMapMsg = sMapMsg .. " t×m thö.";
			Talk(1,"",sMapMsg);
			return 0;
		end
	end

	local tSet = tTreasureTable[nMapID][nIdx1];
	--ÍÚ±¦³É¹¦
	if nMapID == tSet[1] and nMapX > tSet[2] - 50 and nMapX < tSet[2] + 50 and nMapY > tSet[3] - 50 and nMapY < tSet[3] + 50 then
		if gf_Judge_Room_Weight(1, 0, "") ~= 1 then
			return
		end
		gf_AddItemEx(tAward[nMapID][2], tAward[nMapID][1]);
		gf_SetTaskBit(TASKID_2013_NEW_TASK_SEARCH,tBitIdx[nMapID],1);
		Talk(1, "", "H¶i §«ng Thanh nghe thÊy tiÕng huıt sao liÒn h­íng vÒ ng­¬i ra hiÖu, vËt nµy ch¾c lµ t×nh b¸o råi.");
		return 0;
	end

	--¶«±ß
	if tSet[2] - nMapX > 50 and abs(tSet[2] - nMapX) > abs(tSet[3] - nMapY) then
		Talk(1, "", "H¶i §«ng Thanh nghe thÊy tiÕng huıt sao liÒn h­íng vÒ ng­¬i ra hiÖu, ch¾c lµ t×nh b¸o ë phİa ®«ng c¸ch ng­¬i kh«ng xa.");
		return
	end

	--Î÷±ß
	if nMapX - tSet[2] > 50 and abs(tSet[2] - nMapX) > abs(tSet[3] - nMapY) then
		Talk(1, "", "H¶i §«ng Thanh nghe thÊy tiÕng huıt sao liÒn h­íng vÒ ng­¬i ra hiÖu, ch¾c lµ t×nh b¸o ë phİa t©y c¸ch ng­¬i kh«ng xa.");
		return
	end

	--±±±ß
	if nMapY - tSet[3] > 50 and abs(tSet[3] - nMapY) > abs(tSet[2] - nMapX) then
		Talk(1, "", "H¶i §«ng Thanh nghe thÊy tiÕng huıt sao liÒn h­íng vÒ ng­¬i ra hiÖu, ch¾c lµ t×nh b¸o ë phİa b¾c c¸ch ng­¬i kh«ng xa.");
		return
	end

	--Î÷±ß
	if tSet[3] - nMapY > 50 and abs(tSet[3] - nMapY) > abs(tSet[2] - nMapX) then
		Talk(1, "", "H¶i §«ng Thanh nghe thÊy tiÕng huıt sao liÒn h­íng vÒ ng­¬i ra hiÖu, ch¾c lµ t×nh b¸o ë phİa nam c¸ch ng­¬i kh«ng xa.");
		return
	end
end
