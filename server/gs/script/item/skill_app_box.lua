--½Å±¾Ãû³Æ£º
--½Å±¾¹¦ÄÜ£º
--¹¦ÄÜ²ß»®£ºÁõÁÁ
--¹¦ÄÜ¿ª·¢£ºÖìÁ¦
--¿ª·¢Ê±¼ä£º2013-03-29
--´úÂëÐÞ¸Ä¼ÇÂ¼

Include("\\script\\lib\\globalfunctions.lua");
Include("\\settings\\static_script\\lib\\item_define.lua")
Include("\\script\\lib\\message.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\global\\skill_app.lua")

g_szLogCaption		= "CÈm Nang §¸ Kü N¨ng";
g_szTitle			= "<color=green>CÈm Nang §¸ Kü N¨ng<color>";
g_tCheckOutPlayer	= {};
g_tComposePlayer	= {};
g_tDecomposePlayer	= {};
g_nComposeNeedCount	= 3;
assert(0 < g_nComposeNeedCount);

g_tAchTaskId = {
	[1] = TASKID_JNS_SPE_ACH_TASK_1,
	[4] = TASKID_JNS_SPE_ACH_TASK_2,
	[7] = TASKID_JNS_SPE_ACH_TASK_3,
	[9] = TASKID_JNS_SPE_ACH_TASK_4,
	[10] = TASKID_JNS_SPE_ACH_TASK_5,
};

function OnUse_SKillAppBox()
	local szMsg	= format("%s: §¸ Kü N¨ng cã thÓ cÊt vµo trong %s , b¹n cã thÓ ®Õn chç %s ®Ó ghÐp §¸ Kü N¨ng cÊp cao h¬n, hoÆc t¸ch §¸ Kü N¨ng cÊp cao thµnh §¸ Kü N¨ng cÊp thÊp. §ång thêi b¹n còng cã thÓ tõ CÈm Nang §¸ Kü N¨ng rót ra nh÷ng §¸ Kü N¨ng ®· cÊt vµo, ghÐp hoÆc t¸ch.", g_szTitle, g_szTitle, g_szTitle);
	local tMenu	= {
		"Bá vµo tÊt c¶ §¸ Kü N¨ng trong tói	/CheckInAllSkillApp",
		"Ta muèn rót §¸ Kü N¨ng			/CheckOutSkillAppMenu",
		"Ta muèn ghÐp §¸ Kü N¨ng			/ComposeSkillAppMenu",
		"Ta muèn t¸ch §¸ Kü N¨ng			/DecomposeSkillAppMenu",
		"Ra khái	/nothing",
	};
	suSay(szMsg, getn(tMenu), tMenu);
	return 1;
end

function CheckInAllSkillApp()
	local tItemCountList	= {};
	local tItems = GetRoomItems(pos_equiproom)
	for i, item_idx in tItems do
		local nG, nD, nP	= GetItemInfoByIndex(item_idx);
		if nG == item_other and nD == enumOD_SKILL_APP  then
			local nLevel		= GetItemLevel(item_idx);
    		if 1 == DelItemByIndex(item_idx, -1) then
    			tItemCountList[nLevel]	= tItemCountList[nLevel] or 0;
    			tItemCountList[nLevel]	= tItemCountList[nLevel] + 1;
    			
    			WriteLog(format("[%s][CheckInAllSkillApp][%s][%s][DelItem][idx:%d][gdp:%d,%d,%d][lv:%d]",
    			g_szLogCaption, GetAccount(), GetName(), item_idx, nG, nD, nP, nLevel));
    		end
		end
	end
	
	for item_lv, item_count in tItemCountList do
		if MINNUM_SKILL_APP_LEVEL <= item_lv and MAXNUM_SKILL_APP_LEVEL >= item_lv then
			AddSkillAppCount(item_lv, item_count);
			
			------------------add by wangjing--------------------
			if not (GetTask(TASKID_JNS_SPE_ACH_TASK_6) >= 1) then
				SetTask(TASKID_JNS_SPE_ACH_TASK_6, item_count);
				--OnAchEvent(2, TASKID_JNS_SPE_ACH_TASK_6);
			end
			-----------------------------------------------------
		end
	end
	
	Talk(1, "", format("%s: Chµng trai trÎ, tÊt c¶ §¸ Kü N¨ng trong tói ®· bá vµo %s.", g_szTitle, g_szTitle));
end

function CheckOutSkillAppMenu()
	local szMsg	= format("%s: §¸ Kü N¨ng cã thÓ bá vµo %s , ng­¬i cã thÓ tõ chç %s ghÐp §¸ Kü N¨ng cÊp cao h¬n, ®ång thêi cã thÓ rót nh÷ng §¸ Kü N¨ng ®· cÊt vµo vµ ghÐp.", g_szTitle, g_szTitle, g_szTitle);
	local tMenu	= {};
	local tItemCountList	= GetSkillAppCountList();
	
	for item_lv, item_count in tItemCountList do
		tinsert(tMenu, format("Rót ra §¸ Kü N¨ng CÊp %2d (Së h÷u %d c¸i)	/#CheckOutSkillApp(%d,%d)",
		item_lv, item_count, 
		item_lv, item_count));
	end
	tinsert(tMenu, "Ra khái	/nothing");
	
	suSay(szMsg, getn(tMenu), tMenu);
end

function CheckOutSkillApp(nItemLevel, nItemMaxCount)
	nItemMaxCount	= nItemMaxCount or GetSkillAppCount(nItemLevel);
	if not nItemMaxCount or 0 >= nItemMaxCount then
		Talk(1, "", format("%s: Chµng trai trÎ, kh«ng cã g× th× ®õng nhÊp lung tung.", g_szTitle));
		return
	end
	
	g_tCheckOutPlayer[GetName()] = nItemLevel;
	AskClientForNumber("CheckOutSkillAppCallBack", 0, nItemMaxCount, "Muèn rót bao nhiªu?");
end

function CheckOutSkillAppCallBack(nCount)
	if 0 >= nCount then return end
	local nItemLevel	= g_tCheckOutPlayer[GetName()];
	g_tCheckOutPlayer[GetName()] = nil;
	if not nItemLevel then return end
	if MINNUM_SKILL_APP_LEVEL > nItemLevel or MAXNUM_SKILL_APP_LEVEL < nItemLevel then return end
	if 1 ~= gf_JudgeRoomWeight(nCount, 0, g_szTitle) then return end
	
	gf_SetLogCaption(g_szLogCaption);
	if 1 == DelSkillAppCount(nItemLevel, nCount, 1) then
		gf_AddItemEx({item_other, enumOD_SKILL_APP, nItemLevel}, format("§¸ Kü N¨ng CÊp %d", nItemLevel), nCount);
	end
	gf_SetLogCaption("");
end

function ComposeSkillAppMenu()
	local szMsg	= format("%s: §¸ Kü N¨ng cã thÓ bá vµo %s , ng­¬i cã thÓ tõ chç %s ghÐp §¸ Kü N¨ng cÊp cao h¬n, ®ång thêi cã thÓ rót nh÷ng §¸ Kü N¨ng ®· cÊt vµo vµ ghÐp.", g_szTitle, g_szTitle, g_szTitle);
	local tMenu	= {};
	local tItemCountList	= GetSkillAppCountList();
	
	for item_lv, item_count in tItemCountList do
		if MAXNUM_SKILL_APP_LEVEL > item_lv then
			local nComposeCount	= floor(item_count / g_nComposeNeedCount);
			tinsert(tMenu, format("Dïng %d §¸ Kü N¨ng CÊp %2d ®Ó ghÐp thµnh §¸ Kü N¨ng CÊp %2d (Cã thÓ ghÐp %d c¸i)	/#ComposeSkillApp(%d,%d)",
			g_nComposeNeedCount, item_lv, item_lv + 1, nComposeCount,
			item_lv, nComposeCount));
		end
	end
	tinsert(tMenu, "Ra khái	/nothing");
	
	suSay(szMsg, getn(tMenu), tMenu);
end

function ComposeSkillApp(nItemSrcLevel, nComposeMaxCount)
	nComposeMaxCount = nComposeMaxCount or floor((GetSkillAppCount(nItemSrcLevel) or 0) / g_nComposeNeedCount);
	if not nComposeMaxCount or 0 >= nComposeMaxCount then
		Talk(1, "", format("%s: Chµng trai trÎ, kh«ng cã g× th× ®õng nhÊp lung tung.", g_szTitle));
		return
	end
	
	g_tComposePlayer[GetName()] = nItemSrcLevel;
	AskClientForNumber("ComposeSkillAppCallBack", 0, nComposeMaxCount, "Muèn ghÐp bao nhiªu?");
end

function ComposeSkillAppCallBack(nCount)
	if 0 >= nCount then return end
	local nItemSrcLevel = g_tComposePlayer[GetName()];
	g_tComposePlayer[GetName()] = nil;
	if not nItemSrcLevel then return end
	if MINNUM_SKILL_APP_LEVEL > nItemSrcLevel or MAXNUM_SKILL_APP_LEVEL <= nItemSrcLevel then return end
	
	gf_SetLogCaption(g_szLogCaption);
	if 1 == DelSkillAppCount(nItemSrcLevel, g_nComposeNeedCount * nCount, 1) then
		if 1 == AddSkillAppCount(nItemSrcLevel + 1, nCount) then
			Talk(1, "", format("%s: Chµng trai trÎ, ng­¬i ®· ghÐp %d c¸i §¸ Kü N¨ng CÊp %d.", g_szTitle, nCount, nItemSrcLevel + 1));
			
			------------------add by wangjing-------------------
			if not (GetTask(TASKID_JNS_SPE_ACH_TASK_6) >= 1) then
				SetTask(TASKID_JNS_SPE_ACH_TASK_6, nCount);
				OnAchEvent(2, TASKID_JNS_SPE_ACH_TASK_6);
			end
			----------------------------------------------------
			local nNewLevel = nItemSrcLevel + 1;
			if g_tAchTaskId[nNewLevel] then
				if not (GetTask(g_tAchTaskId[nNewLevel]) >= 1) then
					SetTask(g_tAchTaskId[nNewLevel], 1);
					OnAchEvent(2, g_tAchTaskId[nNewLevel]);
				end
			end
		end
	end
	gf_SetLogCaption("");
end

function DecomposeSkillAppMenu()
	local szMsg	= format("%s: Ng­¬i cã thÓ ®Õn chç %s dïng §¸ Kü N¨ng cÊp cao t¸ch thµnh §¸ Kü N¨ng thÊp h¬n 1 cÊp.", g_szTitle, g_szTitle, g_szTitle);
	local tMenu	= {};
	local tItemCountList	= GetSkillAppCountList();
	
	for item_lv, item_count in tItemCountList do
		if MAXNUM_SKILL_APP_LEVEL >= item_lv and item_lv > 1 then
			tinsert(tMenu, format("Dïng 1 §¸ Kü N¨ng CÊp %d t¸ch thµnh %d §¸ Kü N¨ng CÊp %d (§¸ Kü N¨ng cã thÓ t¸ch %d c¸i)/#DecomposeSkillApp(%d, %d)",
				item_lv, g_nComposeNeedCount, item_lv - 1, item_count, item_lv, item_count));
		end
	end
	tinsert(tMenu, "Ra khái	/nothing");
	
	suSay(szMsg, getn(tMenu), tMenu);
end

function DecomposeSkillApp(nItemSrcLevel, nItemCount)
	nItemCount = min(nItemCount, GetSkillAppCount(nItemSrcLevel));
	if nItemCount <= 0 then
		Talk(1, "", format("%s: Chµng trai trÎ, kh«ng cã g× th× ®õng nhÊp lung tung.", g_szTitle));
		return 0;
	end
	g_tDecomposePlayer[GetName()] = nItemSrcLevel;
	AskClientForNumber("DecomposeSkillAppCallBack", 0, nItemCount, "Muèn t¸ch bao nhiªu?");
end

function DecomposeSkillAppCallBack(nCount)
	if not g_tDecomposePlayer[GetName()] then
		return 0;
	end
	
	local nLevel = g_tDecomposePlayer[GetName()];
	if nLevel <= 1 then
		return 0;
	end
	local nItemCount = GetSkillAppCount(nLevel)
	if nItemCount < nCount then
		Talk(1, "", format("%s: Chµng trai trÎ, kh«ng cã g× th× ®õng nhÊp lung tung.", g_szTitle));
		return 0;
	end
	if DelSkillAppCount(nLevel, nCount) ~= 1 then
		Talk(1, "", format("%s: Chµng trai trÎ, kh«ng cã g× th× ®õng nhÊp lung tung.", g_szTitle));
		return 0;
	end
	
	if AddSkillAppCount(nLevel - 1, nCount * g_nComposeNeedCount) ~= 1 then
		WriteLog(format("[T¸ch §¸ Kü N¨ng][acc:%s role:%s][T¸ch §¸ Kü N¨ng CÊp %d x%d][Thªm §¸ Kü N¨ng CÊp %d thÊt b¹i]",
			GetAccount(), GetName(), nLevel, nCount, nLevel - 1));
		return 0;
	end
	
	WriteLog(format("[T¸ch §¸ Kü N¨ng][acc:%s role:%s][T¸ch §¸ Kü N¨ng CÊp %dx%d][Thªm §¸ Kü N¨ng CÊp %d x%d]",
		GetAccount(), GetName(), nLevel, nCount, nLevel - 1, nCount * g_nComposeNeedCount));
		
	Talk(1, "", format("%s: LÇn nµy t¸ch thµnh c«ng %d §¸ Kü N¨ng CÊp %d, nhËn ®­îc %d §¸ Kü N¨ng CÊp %d",
		g_szTitle, nCount, nLevel, nCount * g_nComposeNeedCount, nLevel - 1));
end