--Å®Õæ¾üÊ¿°¢²»º±
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

--°ÑÒ»Ð©Êý¾ÝÉÏµÄ¶«Î÷¶ªµ½ÕâÀïÀ´ ·½±ã²âÊÔ
g_tGTaskId = {1321,1337};  --Éæ¼°µ½µÄÈÎÎñid ²é¿´gtask_main
g_szNpcName = "Qu©n SÜ N÷ Ch©n-A BÊt H·n: ";

function kill_him()
	local nNpcIdx = GetTargetNpc();
	if nNpcIdx == nil then return 0; end
	ChangeNpcToFight(nNpcIdx);
	--SetNpcDeathScript(nIdx,"\\script\\pop\\2012\\hl_robber_npc.lua");
	NpcChat(nNpcIdx, "NÕu ®· bÞ ng­¬i nh×n thÊu th× ®µnh giÕt ng­êi diÖt khÈu vËy.");
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
		Talk(1, "", "<color=green>" .. szNpcName .. "<color>: D¹o nµy lo ®¸nh trËn, kh«ng biÕt h«m nay t­íng qu©n ®· gi¸o huÊn ch­a?");
		return 0;
	end
	
	local szPlayerName = GetName();
	local szMsg = format("<color=green>%s<color>: Nghe nãi tèi h«m qua ®· th¶ ra 1 con H¶i §«ng Thanh, ng­¬i cã biÕt kh«ng?\\p<color=green>%s<color>: H«m qua ta uèng r­îu víi Ba §å Lç nªn kh«ng ®Ó ý.\\p<color=green>%s<color>: (ta sÏ lõa h¾n)\\p<color=green>%s<color>: Kh«ng cÇn, tèi h«m qua Ba §å Lç lu«n ë trong lÒu cña ta, trêi s¸ng míi rêi khái.\\p<color=green>%s<color>: VËy... ta... nép m¹ng nµo.",szPlayerName,szNpcName, szPlayerName, szPlayerName, szNpcName);

	suTalk("kill_him", szMsg, 1);
end

function OnDeath(nNpcIdx)
	--RemoveNpc(nNpcIdx);
end