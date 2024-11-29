--Å®Õæ¾üÊ¿°¢²»º±
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua");

--°ÑÒ»Ğ©Êı¾İÉÏµÄ¶«Î÷¶ªµ½ÕâÀïÀ´ ·½±ã²âÊÔ
g_tGTaskId = {1328,1342};  --Éæ¼°µ½µÄÈÎÎñid ²é¿´gtask_main
g_tBossInfo = {
	{"Chu Giíi Quang",	"Chu Giíi Quang",	612,1922,4078	, nil, "\\script\\pop\\2013\\npc\\muliubai_npc.lua",	nil,	10 * 60},
	{"Thiªn ¢m Gi¸o-Chi ViÖn Sø",	"Thiªn ¢m Gi¸o-Chi ViÖn Sø",	612,1922,4071	, nil, "\\script\\pop\\2013\\npc\\muliubai_npc.lua",	nil,	10 * 60},
	{"Thiªn ¢m Gi¸o-Chi ViÖn Sø",	"Thiªn ¢m Gi¸o-Chi ViÖn Sø",	12,1926,4073	, nil, "\\script\\pop\\2013\\npc\\muliubai_npc.lua",	nil,	10 * 60},
};

g_szNpcName = "<color=green>Méc L­u B¹ch<color>: ";

g_szMsg = [[
	<color=green>Playername<color>£º<color=green>ãåÁô°×<color>¹ÃÄï£¿
	\p<color=green>ãåÁô°×<color>£º<sex>¿ÉÊÇÑÕ¹«×ÓÅÉÀ´Ñ°ÎÒµÄ£¿ÎÒÖªµÀËû»áÀ´¾ÈÎÒµÄ¡£
	\p<color=green>Playername<color>£ºÕâÊÇÔõÃ´»ØÊÂ£¿
	\p<color=green>ãåÁô°×<color>£ºÖì½ç¹âÄÇ¸ö¡­¡­£¨Éù½¥ßìÑÊ£©ÅÑÍ½£¡Ëû¼ÙÒâ½«ÎÒÓÕÎÒÈëÌìÒõ½ÌÂñ·ü£¬»¹Òª¼Óº¦ÑÕ¹«×Ó¡£
	\p<color=green>ãåÁô°×<color>£º°¡£¬ÔõÃ´°ì£¬ËûÃÇÀ´ÁË£¡
	\p<color=green>Playername<color>£ºÀ´µÃÕıºÃ£¬ÅÑÍ½×Ô¸ÃÓĞÅÑÍ½µÄÏÂ³¡¡£
]];


function create_boss()
	SetTask(TASKID_2013_NEW_TASK_PRISON, 1);
	gf_CreateNpcList(g_tBossInfo);
end

function main()
	local nNpcIdx = GetTargetNpc();
	local szNpcName = GetNpcName(nNpcIdx);
	
	local nHasTask = 0;
	for i = 1,getn(g_tGTaskId) do
		if 1 == tGtTask:check_cur_task(g_tGTaskId[i])  then
			nHasTask = 1
			break;
		end
	end
	
	if nHasTask ~= 1 then
		Talk(1, "", "<color=green>" .. szNpcName .. "<color>: TiÕc lµ ta kh«ng biÕt ®­îc bé mÆt thËt cña bän ph¶n ®å sím h¬n!");
		return 0;
	end
	
	if GetTask(TASKID_2013_NEW_TASK_PRISON) ~= 0 then
		Talk(1, "", "<color=green>" .. szNpcName .. "<color>: TiÕc lµ ta kh«ng biÕt ®­îc bé mÆt thËt cña bän ph¶n ®å sím h¬n!");
		return 0;
	end
	
	local szMsg = gsub(g_szMsg, "Playername", GetName());
	szMsg = gsub(szMsg, "<sex>", gf_GetPlayerSexName());
	suTalk("create_boss", szMsg, 1);
end

function OnDeath(nNpcIdx)
	RemoveNpc(nNpcIdx);
end