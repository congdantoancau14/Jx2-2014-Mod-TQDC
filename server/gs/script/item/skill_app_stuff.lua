--½Å±¾Ãû³Æ£º
--½Å±¾¹¦ÄÜ£º
--¹¦ÄÜ²ß»®£ºÁõÁÁ
--¹¦ÄÜ¿ª·¢£ºÖìÁ¦
--¿ª·¢Ê±¼ä£º2013-03-29
--´úÂëÐÞ¸Ä¼ÇÂ¼

Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\item_define.lua");
Include("\\script\\lib\\message.lua");
Include("\\script\\global\\skill_app.lua");
Include("\\script\\misc\\observer\\observer_head.lua");

g_szLogCaption				= "M¶nh §¸ Kü N¨ng";
g_szTitle					= "<color=green>M¶nh §¸ Kü N¨ng<color>";
g_tComposeStuff				= {2, 1, 10011};
g_nComposeNeedCount			= 100;
g_nComposeLevel				= 1;
g_nComposeIncreaseTimes		= 10;
g_nComposeIncreaseBeginTime	= MkTime(2013,7,17);
assert(0 < g_nComposeNeedCount);

g_tTaskIDs = {
	[1] = TASKID_JNS_SPE_ACH_TASK_1,
	[4] = TASKID_JNS_SPE_ACH_TASK_2,
	[7] = TASKID_JNS_SPE_ACH_TASK_3,
	[9] = TASKID_JNS_SPE_ACH_TASK_4,
	[10] = TASKID_JNS_SPE_ACH_TASK_5,
};
	
function OnUse()
	local nMaxStuffCount	= GetItemCount(g_tComposeStuff[1], g_tComposeStuff[2], g_tComposeStuff[3]);
	local nMaxComposeCount	= floor(nMaxStuffCount / g_nComposeNeedCount);
	local nHasComposeTimes	= GetTask(TASKID_COMPOSE_SKILL_APP_TIMES);
	local nCanComposeTimes	= GetCanComposeTimes();
	local szMsg	= format("%s: Dïng %d m¶nh ghÐp thµnh 1 §¸ Kü N¨ng CÊp %d vµ trùc tiÕp bá vµo CÈm Nang §¸ Kü N¨ng.\nHiÖn t¹i cã %d m¶nh, cã thÓ ghÐp ®­îc %d §¸ Kü N¨ng CÊp %d.\nSè lÇn ghÐp cßn l¹i lµ %d lÇn.",
	g_szTitle, g_nComposeNeedCount, g_nComposeLevel, nMaxStuffCount, nMaxComposeCount, g_nComposeLevel, nCanComposeTimes - nHasComposeTimes);
	local tMenu	= {
		"Ta muèn ghÐp §¸ Kü N¨ng			/ComposeSkillApp",
		"Ra khái	/nothing",
	};
	suSay(szMsg, getn(tMenu), tMenu);
	return 1;
end

function ComposeSkillApp()
	local nMaxStuffCount	= GetItemCount(g_tComposeStuff[1], g_tComposeStuff[2], g_tComposeStuff[3]);
	local nMaxComposeCount	= floor(nMaxStuffCount / g_nComposeNeedCount);
	
	if 0 >= nMaxComposeCount then
		Talk(1, "", format("%s: Chµng trai trÎ, kh«ng cã g× th× ®õng nhÊp lung tung.", g_szTitle));
		return
	end
	
	local nHasComposeTimes	= GetTask(TASKID_COMPOSE_SKILL_APP_TIMES);
	local nCanComposeTimes	= GetCanComposeTimes();
	
	if nHasComposeTimes >= nCanComposeTimes then
		Talk(1, "", format("%s: Chµng trai trÎ, h«m nay ®· dïng hÕt sè lÇn ghÐp, ngµy mai h·y quay l¹i nhÐ.", g_szTitle));
		return
	end
	
	nMaxComposeCount		= min(nMaxComposeCount, nCanComposeTimes - nHasComposeTimes);
	
	AskClientForNumber("ComposeSkillAppCallBack", 0, nMaxComposeCount, "Muèn ghÐp bao nhiªu?");
end

function OnAchivement(nCount)
	if g_tTaskIDs[g_nComposeLevel] then
		SetTask(g_tTaskIDs[g_nComposeLevel], 1);
		OnAchEvent(2, g_tTaskIDs[g_nComposeLevel]);
	end
	
	if not (GetTask(TASKID_JNS_SPE_ACH_TASK_6) >= 1) then
		SetTask(TASKID_JNS_SPE_ACH_TASK_6, nCount);
		OnAchEvent(2, TASKID_JNS_SPE_ACH_TASK_6);
	end
end

function ComposeSkillAppCallBack(nCount)
	if 0 >= nCount then return end
	
	local nHasComposeTimes	= GetTask(TASKID_COMPOSE_SKILL_APP_TIMES);
	local nCanComposeTimes	= GetCanComposeTimes();
		
	if nHasComposeTimes >= nCanComposeTimes then
		Talk(1, "", format("%s: Chµng trai trÎ, h«m nay ®· dïng hÕt sè lÇn ghÐp, ngµy mai h·y quay l¹i nhÐ.", g_szTitle));
		return
	end
	
	nCount		= min(nCount, nCanComposeTimes - nHasComposeTimes);
	
	gf_SetLogCaption(g_szLogCaption);
	if 1 == DelItem(g_tComposeStuff[1], g_tComposeStuff[2], g_tComposeStuff[3], nCount * g_nComposeNeedCount) then
		if 1 == AddSkillAppCount(g_nComposeLevel, nCount) then
			nHasComposeTimes = nHasComposeTimes + nCount;
			SetTask(TASKID_COMPOSE_SKILL_APP_TIMES, nHasComposeTimes);
			Talk(1, "", format("%s: Chµng trai trÎ ®· ghÐp %d §¸ Kü N¨ng CÊp %d.\n          Ng­¬i cßn ®­îc ghÐp %d lÇn.", g_szTitle, nCount, g_nComposeLevel, nCanComposeTimes - nHasComposeTimes));
			---------------add by wangjign--------------
			OnAchivement(nCount);
			--------------------------------------------
			---------------add by suzengwei--------------
			for i = 1, nCount do
				Observer:onEvent(OE_COMPOSE_SKILL_STONE, {1});
			end
			--------------------------------------------
		end
	end
	gf_SetLogCaption("");
end

function GetCanComposeTimes()
	local nCurTime		= MkTime(date("%Y"),date("%m"),date("%d"));
	local nBaseTimes	= ((nCurTime - g_nComposeIncreaseBeginTime) / (24 * 60 * 60)) * g_nComposeIncreaseTimes;
	local nAwardTimes	= GetTask(TASKID_COMPOSE_SKILL_APP_TIMES_AWARD);
	return nBaseTimes + nAwardTimes;
end
