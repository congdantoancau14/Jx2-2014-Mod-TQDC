Include("\\script\\online\\plant\\tree_head.lua");
--越南09年7月活动开关头文件
Include("\\script\\online\\viet_event\\200907\\eventopen.lua");
Include("\\script\\lib\\globalfunctions.lua");
--越南09年12月活动头文件
Include("\\script\\online\\viet_event\\200912\\event_head.lua");
--所有活动给种树奖励的统一头文件
Include("\\script\\online_activites\\award.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\vng\\config\\newserver.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")	
Include("\\script\\vng\\award\\feature_award.lua");

--******************************************************
--	CAY BAT NHA TO
--******************************************************
function main()
	local npcIdx,npcModel,npcName = GetTriggeringUnit();
	if npcIdx == 0 then
		WriteLog("[L鏸 ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."Khi ti nc, GetTriggeringUnit th� 1, tr� quay l筰 l� 0");
		return 0;
	end;
	local nNameLen = strlen(GetName());
	local bJudgeByName = 0;
	if GetName() == strsub(npcName,1,nNameLen) then
		bJudgeByName = 1;
	end;
	local bIsTree = 0;
	for i=1,getn(TREETYPE) do
		if npcModel == TREETYPE[i][1] then
			bIsTree = 1;
			break;
		end;
	end;
	if bIsTree == 0 then
		SetNpcScript(npcIdx,"");
		WriteLog("[L鏸 ho箃 ng tr錸g c﹜ Th竔 H璢:NPC:"..npcName.."L鏸 files g鑓");
		return 0;
	end;
	Create_Map_Trigger();
	local npcTreeIndex = GetTargetNpc();
	if npcTreeIndex == 0 then
		 WriteLog("[L鏸 ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."Khi ti nc, GetTargetNpc tr� quay l筰 l� 0");
		 return 0;
	end;
	if bJudgeByName == 0 then
		if GetTime() - GetTask(TASK_PLANTTIME) > TREELIFETIME or GetTask(TASK_PLANTTIME) == 0 or npcTreeIndex ~= GetTask(TASK_TREEINDEX) then
			Msg2Player("Зy kh玭g ph秈 l� c﹜ b筺 tr錸g");
			return 0;
		end;
	end;
	local nTreeGrow = GetTask(TASK_TREEGROW);
	local nTimePassed = GetTime() - GetTask(TASK_PLANTTIME);
	if nTreeGrow < 6 then
		if nTimePassed < TREETYPE[nTreeGrow][3] then
			Talk(1,"",TREETYPE[nTreeGrow][2].." sinh trng r蕋 t鑤, t筸 th阨 kh玭g c莕 ti nc nh璶g kh玭g n猲 甶 qu� xa, n誹 sau <color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME)).."<color> sau kh玭g ti, c﹜ s� thi誹 nc m� ch誸. Th阨 gian ti nc l莕 sau c遪 <color=yellow>"..Get_Time_String(TREETYPE[nTreeGrow][3]-nTimePassed).."<color>.");
			return 0;
		end;
	end;
	local sSaySth = "";
	local selTab = {};
	if nTreeGrow == 6 then
		if nTimePassed < TREETYPE[nTreeGrow][3] then
			Talk(1,"",TREETYPE[nTreeGrow][2].."C﹜ ph竧 tri觧, kh玭g n猲 h竔 s韒, sau <color=yellow>"..(TREETYPE[nTreeGrow][3]-nTimePassed).." gi﹜<color> h穣 h竔.");
			return 0;
		end;
		tinsert(selTab,"H穣 mau h竔  tr竛h b� cp/getfruit");
		tinsert(selTab,"Sau n祔 h穣 h竔!/nothing");
		sSaySth = "Qu� Th竔 H� B竧 Nh�  ch輓, k誸 ra 1 tr竔 Ti猲 Qu� v鮝 to v鮝 ti, b筺 mu鑞 h竔 ch�? N誹 sau <color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME)).."<color> sau kh玭g h竔 th� qu� s� ch誸!";
	else
		tinsert(selTab,"Ti nc (c莕 "..TREETYPE[nTreeGrow+1][4].." ph莕 L� Th駓)/givewater");
		tinsert(selTab,"Sau n祔 h穣 ti./nothing");
		sSaySth = TREETYPE[nTreeGrow][2].." 產ng c莕 ti L� Th駓, c� mu鑞 ti kh玭g? N誹 sau <color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME)).."<color> sau kh玭g ti qu� s� thi誹 nc m� ch誸.";
	end;
	
	Say(sSaySth,getn(selTab),selTab);
end;

function givewater()
	local nTreeGrow = GetTask(TASK_TREEGROW);
	local npcTreeIndex = GetTask(TASK_TREEINDEX);
	if npcTreeIndex == 0 then
		WriteLog("[L鏸 ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."L骳 ti nc, TASK_TREEINDEX bi課 lng nhi謒 v� l� 0");
		return 0;
	end;	
	if DelItem(2,0,351,TREETYPE[nTreeGrow+1][4]) ~= 1 then
		Talk(1,"","Kh玭g  L� Th駓!");
		return 0;
	end;
	local MapID,MapX,MapY = GetNpcWorldPos(npcTreeIndex)
	SetNpcLifeTime(npcTreeIndex,0);
	SetNpcScript(npcTreeIndex,"");
	npcTreeIndex = CreateNpc(TREETYPE[nTreeGrow+1][1],GetName().." tr錸g "..TREETYPE[nTreeGrow+1][2],MapID,MapX,MapY);
	if npcTreeIndex == 0 then
		WriteLog("[L鏸 ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."L骳 ti c﹜, tr� quay l筰 h祄 s� CreateNpc l� 0. Tham s� nh藀 CreateNpc:"..TREETYPE[nTreeGrow+1][1]..","..GetName().." tr錸g "..TREETYPE[nTreeGrow+1][2]..","..MapID..","..MapX..","..MapY);
	end;
	SetNpcLifeTime(npcTreeIndex,TREELIFETIME);
	SetNpcScript(npcTreeIndex,"\\script\\online\\plant\\tree_npc.lua")
	SetTask(TASK_TREEINDEX,npcTreeIndex);
	SetTask(TASK_TREEGROW,nTreeGrow+1);
	SetTask(TASK_PLANTTIME,GetTime());
	local nTimePassed = GetTime() - GetTask(TASK_PLANTTIME);
	local nTreeGrow = GetTask(TASK_TREEGROW);
	if nTreeGrow ==6 then
		StartTimeGuage("Thu ho筩h",TREETYPE[nTreeGrow][3]-nTimePassed,0,1)			
	else
		StartTimeGuage("Ti c﹜",TREETYPE[nTreeGrow][3]-nTimePassed,0,1)	
	end
end;

function getfruit()
	local tFruitAwardJune2010 = {
		[1] = {9880, 	30, 		30, 		30,		30, 		{2,1,30164,1}, "Nh穘"},
		[2] = {30, 		9880, 	30, 		30,	 	30,		{2,1,30165,1}, "Ch玬 Ch玬"},
		[3] = {30, 		30, 		9880, 	30, 		30,		{2,1,30166,1}, "Cam"},
		[4] = {30, 		30, 		30, 		9880, 	30,		{2,1,30167,1}, "D鮝"},
		[5] = {30, 		30, 		30, 		30, 		9880,		{2,1,30168,1}, "M╪g C魌"},
		[6] = {9880, 		30, 		30, 		30, 		30,	{2,1,30169,1}, "Bi"},
		[7] = {30, 	9880, 		30, 		30,		30, 		{2,1,30170,1}, "D﹗"},
		[8] = {30, 		30, 	9880, 		30,	 	30,		{2,1,30171,1}, "Chu鑙"},
		[9] = {30, 		30, 		30, 	9880, 		30,		{2,1,30172,1}, "Xo礽"},
		[10] = {30, 		30, 		30, 		30, 	9880,			{2,1,30173,1}, "Уo"},
		[11] = {9880, 		30, 		30, 		30, 		30,	{2,1,30174,1}, "M薾"},
		[12] = {30, 	9880, 		30, 		30,		30, 		{2,1,30175,1}, "V秈"},
		[13] = {30, 		30, 	9880, 		30,	 	30,		{2,1,30176,1}, "T竜"},
		[14] = {30, 		30, 		30, 	9880, 		30,		{2,1,30177,1}, "B�"},
		[15] = {30, 		30, 		30, 		30, 	9880,			{2,1,30178,1}, " я"},
		[16] = {9880, 		30, 		30, 		30, 		30,	{2,1,30179,1}, "M穘g C莡"},
		[17] = {30, 	9880, 		30, 		30,		30, 		{2,1,30180,1}, "Kh鉳"},
		[18] = {30, 		30, 	9880, 		30,	 	30,		{2,1,30181,1}, "L�"},
		[19] = {30, 		30, 		30, 	9880, 		30,		{2,1,30182,1}, "B遪 bon"},
		[20] = {30, 		30, 		30, 		9880, 	30,		{2,1,30183,1}, "Kh�"},
	}
	if GetTask(TASK_TREEGROW) == 6 then
		local npcTreeIndex = GetTargetNpc();
		if npcTreeIndex == 0 then
			 WriteLog("[L鏸 ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."L骳 h竔 qu�, GetTargetNpc tr� quay l筰 l� 0");
			 return 0;
		end;
		
		local nGroup = fruitcheckserver()
		if nGroup ==  0 then
			nGroup = mod(random(0,1000),20) + 1
		end
		gf_AddItemEx2({tFruitAwardJune2010[nGroup][6][1], tFruitAwardJune2010[nGroup][6][2], tFruitAwardJune2010[nGroup][6][3], 2}, tFruitAwardJune2010[nGroup][7], "Bat Nha Lon", "nh薾")

		
		--VBonus
		local nDate =  tonumber(date("%y%m%d%H"))
		Give_Fruit_Award(npcTreeIndex);
		SetNpcScript(npcTreeIndex,"");
		SetNpcLifeTime(npcTreeIndex,0);
		SetTask(TASK_TREEINDEX,0);
		SetTask(TASK_TREEGROW,0);
		SetTask(TASK_PLANTTIME,0);
		SetDeathScript("");
		WriteLogEx("Trong cay Bat Nha", "Hai qua");
   		--nhi謒 v� l祄 gi祏
   		if CFG_NhiemVuLamGiau == 1 then
		     if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 8) == 0 then
		     		gf_SetTaskBit(TSK_LAMGIAU, 8, 1, 0)
		     		TaskTip("Ho祅 th祅h nhi謒 v� l祄 gi祏: Tr錸g th祅h c玭g 01 B竧 Nh� L韓.")
		     end
		end
		-----------------------Chu鏸 nhi謒 v� уng H祅h
		if CFG_NhiemVuDongHanh == 1 then
			if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 19 then
				DongHanh_SetStatus()
			end
		end
		----------------------- Chu鏸 nhi謒 v� Chuy觧 Sinh Кn, l璾 s� th� 4 v� 5 u b猲 ph秈
		local nCSD_BNL = floor(GetTask(TSK_CSD_COUNT_C) / 1000)
		local nNumBK = mod(GetTask(TSK_CSD_COUNT_C),1000)
		if mod(nCSD_BNL, 100) < 99 and GetTask(TSK_CSD) == 1 then
			nCSD_BNL = (nCSD_BNL + 1) * 1000 + nNumBK
			SetTask(TSK_CSD_COUNT_C, nCSD_BNL)
		end
		---------------------------------
		local nRandomNum = 0;
		nRandomNum = random(1,100);
		if nRandomNum <= 100 then
			ModifyExp(200000);	--二十万经验
			Msg2Player("B筺 nh薾 頲 20 v筺 kinh nghi謒");
			WriteLog("[Ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."Nh薾 頲 20 v筺 kinh nghi謒");
		end;
		nRandomNum = random(1,100);
		if nRandomNum <= 10 then
			if AddItem(1,0,32,2) == 1 then
				Msg2Player("B筺 nh薾 頲 2 C鰑 Chuy觧 Ho祅 H錸 Кn");
				WriteLog("[Ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."Nh薾 頲 2 C鰑 Chuy觧 Ho祅 H錸 Кn");
			end;		
		end;
		nRandomNum = random(1,100);
		if nRandomNum <= 20 then
			if AddItem(2,2,8,3) == 1 then
				Msg2Player("B筺 nh薾 頲 3 Thi猲 Th筩h");
				WriteLog("[Ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."Nh薾 頲 3 m秐h Thi猲 Th筩h");
			end;		
		end;
		nRandomNum = random(1,100);
		if nRandomNum <= 5 then
			if AddItem(2,1,473,1) == 1 then
				Msg2Player("B筺 nh薾 頲 1 Th竔 H� B竧 Qu竔 B礽");
				WriteLog("[Ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."Nh薾 頲 1 Th竔 H� B竧 Qu竔 B礽-Li");
			end;		
		end;
		nRandomNum = random(1,200);
		if nRandomNum == 1 then
			if AddItem(2,1,474,1) == 1 then
				Msg2Player("B筺 nh薾 頲 1 Th竔 H� B竧 Qu竔 B礽");
				WriteLog("[Ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."nh薾 頲 1 Th竔 H� B竧 Qu竔 B礽-Ch蕁");
			end;		
		end;
		nRandomNum = random(1,10000);
		if nRandomNum <= 5 then
			if AddItem(0,107,155,1) == 1 then
				Msg2Player("B筺 nh薾 頲 1 quy觧 ".."Ng� H祅h M藅 t辌h");
				WriteLog("[Ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."Thu 頲 1 ".."Ng� H祅h M藅 t辌h");
			end;		
		end;
		
		-- Nhi謒 v� Chuy觧 Sinh 3
		 if GetTask(TRANSLIFE_MISSION_ID) == 19 and gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK4) < 64 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK4, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK4) +1)
			if gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK4) == 64 then
				TaskTip("Ho祅 th祅h y猽 c莡 c馻 Фo Ch� Уo Hoa Фo 64 l莕 tr錸g th祅h c玭g B竧 Nh� L韓")
			end
		end
		
		-- Nhi謒 v� Chuy觧 Sinh 4
		 if GetTask(TRANSLIFE_MISSION_ID) == 26 and gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK4) < 16 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK4, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK4) +1)
			if gf_GetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK4) == 10 then
				gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK4, 0)
				gf_SetTaskByte(TRANSLIFE_TASK_34_FLAG, TRANSLIFE_BYTE_TASK4, gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK4) +1)
			end
			if gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK4) == 16 then
				TaskTip("Ho祅 th祅h y猽 c莡 c馻 B筩h Ti猲 Sinh 160 l莕 tr錸g th祅h c玭g B竧 Nh� L韓")
			end
		end
		
		gf_EventGiveCustomAward(2,160000,0,"Bat Nha Lon","nh薾")

		--Give_YuanXiao_Award(2);
		
		--给09年6月7月活动陈旧密本奖励
		give_viet20090607_miben();
		--给09年8月活动水果袋奖励
		give_viet200908_shuiguodai();
		--09年8月调整，得般若证书
		give_viet200908_banruozhengshu();
		--给09年9月中秋活动白面包奖励
		give_viet200909_baimianbao();
		give_viet200911_hoacuc();
          give_viet200912_shengdantangguo()
                --所有给奖励的统一处理
          Give_DaBanRuoShu_Award();          
          ThuHoachBatNhaLon()
	end;
end;

function nothing()

end;

function Give_Fruit_Award(npcTreeIndex)
	local szNpcName = GetNpcName(npcTreeIndex)	
	local nMapID, nWx, nWy = GetNpcWorldPos(npcTreeIndex)
	local nAddX,nAddY = 0,0	
	local nTargetNpc = 0		
	for i = 1, 8 do
		nAddX = random(-5, 5)
		nAddY = random(-5, 5)
		nTargetNpc = CreateNpc("T骾 cao th�", "T骾 tr竔 c﹜", nMapID, nWx + nAddX, nWy + nAddY)
		SetNpcLifeTime(nTargetNpc, 5*60)
		SetNpcScript(nTargetNpc, "\\script\\online\\plant\\fruit_baoguo.lua")
	end
end

--给09年6月7月陈旧密本奖励
function give_viet20090607_miben()
	if EventOpen0906() == 0 then
		return
	end
	if tonumber(date("%y%m%d%H")) >= 09061900 and tonumber(date("%y%m%d%H")) < 49071924 then
		gf_SetLogCaption("Truy t譵 trng sinh ph�");
		gf_AddItemEx({2, 1, 30088, 100}, "B� Ph� C� N竧");
		WriteLogEx("Hoat dong thang 6","B竧 Nh�",100,"B� Ph� C� N竧");
		gf_SetLogCaption("");
	end
end

--给09年8月活动水果袋奖励
function give_viet200908_shuiguodai()
	if tonumber(date("%y%m%d")) >= 090807 and tonumber(date("%y%m%d")) < 490907 then
		gf_SetLogCaption("[Hoat dong thang 8]");
		nRet = gf_AddItemEx({2, 1, 30097, 100}, "T骾 Tr竔 C﹜");
		if nRet == 1 then
			WriteLogEx("Hoat dong thang 8","Nhan tui trai cay",100,"Trong cay bat nha");
		end
		gf_SetLogCaption("");
	end
end
--09年8月调整，得般若证书
function give_viet200908_banruozhengshu()
	local nRand = random(1, 100);
	local nCount = 0;
	if nRand <= 10 then
		nCount = 2;
	elseif nRand <= 95 then
		nCount = 1;
	else
		nCount = 3;
	end
	for i = 1, nCount do
		local nRetCode, nIndex = gf_AddItemEx({2, 1, 30114, 1}, "B竧 Nh� Ch鴑g Th�");
		if nRetCode == 1 then
			SetItemExpireTime(nIndex, 15 * 24 * 3600);
		end
	end
	WriteLogEx("Uy thac trong cay", "Trong cay Bat Nha", nCount, "Bat Nha Chung Thu");
end

--给09年9月中秋活动白面包奖励
function give_viet200909_baimianbao()
	if tonumber(date("%y%m%d")) >= 090918 and tonumber(date("%y%m%d")) < 491026 then
		gf_SetLogCaption("[Hoat dong trung thu 2009]");
		gf_AddItemEx({2, 1, 30106, 100}, "B閠 M�");
		WriteLogEx("Hoat dong trung thu","B竧 Nh� L韓",100,"B閠 M�");
		gf_SetLogCaption("");
	end
end

function give_viet200911_hoacuc()
	if tonumber(date("%y%m%d")) >= 091106 and tonumber(date("%y%m%d")) <= 491206 then		
		gf_AddItemEx({2, 1, 30118, 40}, "Hoa C骳");
		WriteLogEx("Hoat dong thang 11","B竧 Nh� L韓",40,"Hoa C骳");		
	end
end

--给09年12月圣诞糖果奖励
function give_viet200912_shengdantangguo()
	if tonumber(date("%y%m%d")) >= 091218 and tonumber(date("%y%m%d")) <= 400117 then
	    local szFullLog = VIET_0912_STR_EVENT_LOG_TITLE
	    gf_AddItemEx2({2, 1, 30138, 80}, "C﹜ K裲 Gi竛g Sinh", szFullLog, 0, 1, 10, 1,"B竧 Nh� l韓");
	end
end

function fruitcheckserver()
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	for i = 1, getn(tFruitAwardServerGroup) do
		for j = 1, getn(tFruitAwardServerGroup[i]) do
			if nServerID == tFruitAwardServerGroup[i][j] then
				return i
			end
		end	
	end
	return 0
end