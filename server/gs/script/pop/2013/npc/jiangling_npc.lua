Include("\\script\\lib\\define.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

--°ÑÒ»Ğ©Êı¾İÉÏµÄ¶«Î÷¶ªµ½ÕâÀïÀ´ ·½±ã²âÊÔ
g_tGTaskId = {1322,1338};  --Éæ¼°µ½µÄÈÎÎñid ²é¿´gtask_main
--ĞèÒª¶Ô»°µÄnpc
g_tNpcName = {["Ng©n ThuËt Kh¶"] = 1, ["A Li"] = 2, ["Hoµn Nhan L©u ThÊt"] = 3,};
g_szModelName = "Hoµn Nhan T«ng Hµn";

g_tNpcMsg = {
	[[
	<color=green>ÒøÊõ¿É<color>£º×Úº²£¬ÕâÊÇÉÏ´Î×¥À´µÄÁÉ¹úÃÜÌ½£¬ÑÏĞÌ±Æ¹©£¬¿ÖÅÂÊ±ÈÕ²»¶àÁË¡£Òª²»ÒªÊ¹ÓÃµã·Ç³£ÊÖ¶Î£¿
	\p<color=green>Playername<color>£º¡­¡­¡­¡­¡­¡­
	\p<color=green>ÒøÊõ¿É<color>£º¹ş¹ş¹ş£¬·ÅĞÄ×Úº²£¬Ëû¾ÍËãÊÇËÀ£¬Ò²»á´ÓËû×ìÀïÇË³ö»°À´µÄ¡£
	]],
	[[
	<color=green>°¢Àë<color>£ººôàà¡­¡­¡­¡­¡­¡­
	\p<color=green>°¢Àë<color>£ºË­°¡¡­¡­×Úº²½«¾ü£¡
	\p<color=green>Playername<color>£º¡­¡­¡­¡­¡­¡­
	\p<color=green>°¢Àë<color>£º½«¾ü£¬½«¾ü£¡ÎÒ£¬ÎÒÖ»ÊÇÒ»Ê±£¬°¡£¬²»²»²»£¬ÏÂ´ÎÒ»¶¨²»»áÔÙ·¸ÁË¡£
	\p<color=green>Playername<color>£º¡­¡­¡­¡­¡­¡­
	\p<color=green>°¢Àë<color>£ºÎÒÃ÷°×µÄ£¬½«¾ü£¬ÂÛ¾ü·¨äÂÖ°ÕßÓ¦´¦ËÄÊ®¾ü¹÷¡£ÎÒ×ÔÈ¥¾ü·¨´¦Áì×ï¡£
	\p<color=green>Playername<color>£º¡­¡­¡­¡­¡­¡­£¨²»ÁÏÅ®Õæ´óÓª¾¹Èç´Ë¾ü¼ÍÑÏÃ÷£©
	]],
	[[
	<color=green>ÍêÑÕÂ¦ÊÒ<color>£º½«¾ü£¬²ÙÁ·ÒÑ±Ï¡£
	\p<color=green>Playername<color>£º¡­¡­¡­¡­¡­¡­
	\p<color=green>ÍêÑÕÂ¦ÊÒ<color>£º¡­¡­¡­¡­¡­¡­
	\p<color=green>Playername<color>£º¡­¡­¡­¡­¡­¡­
	\p<color=green>ÍêÑÕÂ¦ÊÒ<color>£º½«¾ü£¿
	\p<color=green>Playername<color>£º¡­¡­¡­¡­¡­¡­£¨ÍêÑÕÂ¦ÊÒ¿´À´Ò²ÊÇ¸ö³ÁÄ¬¹ÑÑÔµÄÈË£¬ÎÒ»¹ÊÇÀë¿ª°É¡££©
	\p<color=green>ÍêÑÕÂ¦ÊÒ<color>£º¹§ËÍ½«¾ü¡£
	]],
}

g_tNpcNormalMsg = {
	"<color=green>Ng©n ThuËt Kh¶<color>: Liªu Quèc øc hiÕp téc N÷ Ch©n cña ta, hiÖn t¹i chóa Liªu hoang d©m v« ®é, ®©y chİnh lµ thêi c¬ ®Ó ph¶n c«ng!",
	"<color=green>A Li<color>: Hu Hu",
	"<color=green>Hoµn Nhan L©u ThÊt<color>: ………………",
}

function main()
	local nNpcIdx = GetTargetNpc()
	local szNpcName = GetNpcName(nNpcIdx);
	if g_tNpcName[szNpcName] == nil then return 0; end
	
	local nBitFlag = g_tNpcName[szNpcName]
	
	
	--ÅĞ¶ÏÓĞÃ»ÓĞ½ÓÈÎÎñ
	local nHasTask = 0;
	for i = 1,getn(g_tGTaskId) do
		if 1 == tGtTask:check_cur_task(g_tGTaskId[i])  then
			nHasTask = 1
			break;
		end
	end
	
	if nHasTask ~= 1 then
		talk_normal(nBitFlag);
		return 0;
	end

	--ÅĞ¶ÏÊÇ²»ÊÇÒÑ¾­Ëµ¹ı»°ÁË
	local nHasTalked = gf_GetTaskBit(TASKID_2013_NEW_TASK_LURK, nBitFlag);
	if nHasTalked == 1 then
		talk_normal(nBitFlag);
		return 0;
	end
	
	--ÅĞ¶ÏÊÇ²»ÊÇ´¦ÓÚ±äÉí×´Ì¬
	local nRet, szModelName = IsChangeModel();
	print(nRet, szModelName);
	if nRet ~= 1 or szModelName ~= g_szModelName then
		talk_normal(nBitFlag)
		return 0;
	end
	
	--ÖÕÓÚ¿ÉÒÔËµ»°ÁË
	success_get_message(nBitFlag)
end

function talk_normal(nBitFlag)
	Talk(1, "", g_tNpcNormalMsg[nBitFlag]);
end

function success_get_message(nIdx)
	gf_SetTaskBit(TASKID_2013_NEW_TASK_LURK, nIdx, 1);
	local szMsg = gsub(g_tNpcMsg[nIdx], "Playername", GetName());
	suTalk("nothing", szMsg, 1);
end

function change_model_OnTimer()
	RemoveTrigger(GetTrigger(TRIGGER_TASK_GBMZ_ID));
	ChangeModel();
	UnLimitSkill(20);
end