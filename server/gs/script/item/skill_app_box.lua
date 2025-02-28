--脚本名称：
--脚本功能：
--功能策划：刘亮
--功能开发：朱力
--开发时间：2013-03-29
--代码修改记录

Include("\\script\\lib\\globalfunctions.lua");
Include("\\settings\\static_script\\lib\\item_define.lua")
Include("\\script\\lib\\message.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\global\\skill_app.lua")

g_szLogCaption		= "C萴 Nang Ц K� N╪g";
g_szTitle			= "<color=green>C萴 Nang Ц K� N╪g<color>";
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
	local szMsg	= format("%s: Ц K� N╪g c� th� c蕋 v祇 trong %s , b筺 c� th� n ch� %s  gh衟 Ц K� N╪g c蕄 cao h琻, ho芻 t竎h Ц K� N╪g c蕄 cao th祅h Ц K� N╪g c蕄 th蕄. уng th阨 b筺 c騨g c� th� t� C萴 Nang Ц K� N╪g r髏 ra nh鱪g Ц K� N╪g  c蕋 v祇, gh衟 ho芻 t竎h.", g_szTitle, g_szTitle, g_szTitle);
	local tMenu	= {
		"B� v祇 t蕋 c� Ц K� N╪g trong t骾	/CheckInAllSkillApp",
		"Ta mu鑞 r髏 Ц K� N╪g			/CheckOutSkillAppMenu",
		"Ta mu鑞 gh衟 Ц K� N╪g			/ComposeSkillAppMenu",
		"Ta mu鑞 t竎h Ц K� N╪g			/DecomposeSkillAppMenu",
		"Ra kh醝	/nothing",
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
	
	Talk(1, "", format("%s: Ch祅g trai tr�, t蕋 c� Ц K� N╪g trong t骾  b� v祇 %s.", g_szTitle, g_szTitle));
end

function CheckOutSkillAppMenu()
	local szMsg	= format("%s: Ц K� N╪g c� th� b� v祇 %s , ngi c� th� t� ch� %s gh衟 Ц K� N╪g c蕄 cao h琻, ng th阨 c� th� r髏 nh鱪g Ц K� N╪g  c蕋 v祇 v� gh衟.", g_szTitle, g_szTitle, g_szTitle);
	local tMenu	= {};
	local tItemCountList	= GetSkillAppCountList();
	
	for item_lv, item_count in tItemCountList do
		tinsert(tMenu, format("R髏 ra Ц K� N╪g C蕄 %2d (S� h鱱 %d c竔)	/#CheckOutSkillApp(%d,%d)",
		item_lv, item_count, 
		item_lv, item_count));
	end
	tinsert(tMenu, "Ra kh醝	/nothing");
	
	suSay(szMsg, getn(tMenu), tMenu);
end

function CheckOutSkillApp(nItemLevel, nItemMaxCount)
	nItemMaxCount	= nItemMaxCount or GetSkillAppCount(nItemLevel);
	if not nItemMaxCount or 0 >= nItemMaxCount then
		Talk(1, "", format("%s: Ch祅g trai tr�, kh玭g c� g� th� ng nh蕄 lung tung.", g_szTitle));
		return
	end
	
	g_tCheckOutPlayer[GetName()] = nItemLevel;
	AskClientForNumber("CheckOutSkillAppCallBack", 0, nItemMaxCount, "Mu鑞 r髏 bao nhi猽?");
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
		gf_AddItemEx({item_other, enumOD_SKILL_APP, nItemLevel}, format("Ц K� N╪g C蕄 %d", nItemLevel), nCount);
	end
	gf_SetLogCaption("");
end

function ComposeSkillAppMenu()
	local szMsg	= format("%s: Ц K� N╪g c� th� b� v祇 %s , ngi c� th� t� ch� %s gh衟 Ц K� N╪g c蕄 cao h琻, ng th阨 c� th� r髏 nh鱪g Ц K� N╪g  c蕋 v祇 v� gh衟.", g_szTitle, g_szTitle, g_szTitle);
	local tMenu	= {};
	local tItemCountList	= GetSkillAppCountList();
	
	for item_lv, item_count in tItemCountList do
		if MAXNUM_SKILL_APP_LEVEL > item_lv then
			local nComposeCount	= floor(item_count / g_nComposeNeedCount);
			tinsert(tMenu, format("D飊g %d Ц K� N╪g C蕄 %2d  gh衟 th祅h Ц K� N╪g C蕄 %2d (C� th� gh衟 %d c竔)	/#ComposeSkillApp(%d,%d)",
			g_nComposeNeedCount, item_lv, item_lv + 1, nComposeCount,
			item_lv, nComposeCount));
		end
	end
	tinsert(tMenu, "Ra kh醝	/nothing");
	
	suSay(szMsg, getn(tMenu), tMenu);
end

function ComposeSkillApp(nItemSrcLevel, nComposeMaxCount)
	nComposeMaxCount = nComposeMaxCount or floor((GetSkillAppCount(nItemSrcLevel) or 0) / g_nComposeNeedCount);
	if not nComposeMaxCount or 0 >= nComposeMaxCount then
		Talk(1, "", format("%s: Ch祅g trai tr�, kh玭g c� g� th� ng nh蕄 lung tung.", g_szTitle));
		return
	end
	
	g_tComposePlayer[GetName()] = nItemSrcLevel;
	AskClientForNumber("ComposeSkillAppCallBack", 0, nComposeMaxCount, "Mu鑞 gh衟 bao nhi猽?");
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
			Talk(1, "", format("%s: Ch祅g trai tr�, ngi  gh衟 %d c竔 Ц K� N╪g C蕄 %d.", g_szTitle, nCount, nItemSrcLevel + 1));
			
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
	local szMsg	= format("%s: Ngi c� th� n ch� %s d飊g Ц K� N╪g c蕄 cao t竎h th祅h Ц K� N╪g th蕄 h琻 1 c蕄.", g_szTitle, g_szTitle, g_szTitle);
	local tMenu	= {};
	local tItemCountList	= GetSkillAppCountList();
	
	for item_lv, item_count in tItemCountList do
		if MAXNUM_SKILL_APP_LEVEL >= item_lv and item_lv > 1 then
			tinsert(tMenu, format("D飊g 1 Ц K� N╪g C蕄 %d t竎h th祅h %d Ц K� N╪g C蕄 %d (Ц K� N╪g c� th� t竎h %d c竔)/#DecomposeSkillApp(%d, %d)",
				item_lv, g_nComposeNeedCount, item_lv - 1, item_count, item_lv, item_count));
		end
	end
	tinsert(tMenu, "Ra kh醝	/nothing");
	
	suSay(szMsg, getn(tMenu), tMenu);
end

function DecomposeSkillApp(nItemSrcLevel, nItemCount)
	nItemCount = min(nItemCount, GetSkillAppCount(nItemSrcLevel));
	if nItemCount <= 0 then
		Talk(1, "", format("%s: Ch祅g trai tr�, kh玭g c� g� th� ng nh蕄 lung tung.", g_szTitle));
		return 0;
	end
	g_tDecomposePlayer[GetName()] = nItemSrcLevel;
	AskClientForNumber("DecomposeSkillAppCallBack", 0, nItemCount, "Mu鑞 t竎h bao nhi猽?");
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
		Talk(1, "", format("%s: Ch祅g trai tr�, kh玭g c� g� th� ng nh蕄 lung tung.", g_szTitle));
		return 0;
	end
	if DelSkillAppCount(nLevel, nCount) ~= 1 then
		Talk(1, "", format("%s: Ch祅g trai tr�, kh玭g c� g� th� ng nh蕄 lung tung.", g_szTitle));
		return 0;
	end
	
	if AddSkillAppCount(nLevel - 1, nCount * g_nComposeNeedCount) ~= 1 then
		WriteLog(format("[T竎h Ц K� N╪g][acc:%s role:%s][T竎h Ц K� N╪g C蕄 %d x%d][Th猰 Ц K� N╪g C蕄 %d th蕋 b筰]",
			GetAccount(), GetName(), nLevel, nCount, nLevel - 1));
		return 0;
	end
	
	WriteLog(format("[T竎h Ц K� N╪g][acc:%s role:%s][T竎h Ц K� N╪g C蕄 %dx%d][Th猰 Ц K� N╪g C蕄 %d x%d]",
		GetAccount(), GetName(), nLevel, nCount, nLevel - 1, nCount * g_nComposeNeedCount));
		
	Talk(1, "", format("%s: L莕 n祔 t竎h th祅h c玭g %d Ц K� N╪g C蕄 %d, nh薾 頲 %d Ц K� N╪g C蕄 %d",
		g_szTitle, nCount, nLevel, nCount * g_nComposeNeedCount, nLevel - 1));
end