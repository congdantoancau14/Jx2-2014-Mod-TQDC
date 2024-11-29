--ÍêÑÕ°¢¹Ç´ò
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

--°ÑÒ»Ğ©Êı¾İÉÏµÄ¶«Î÷¶ªµ½ÕâÀïÀ´ ·½±ã²âÊÔ
g_tGTaskId = {1319, 1335};  --Éæ¼°µ½µÄÈÎÎñid ²é¿´gtask_main
g_szNpcName = "<color=green>Hoµn Nhan A Cèt §¶<color>: ";

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
		Talk(1, "", szNpcName .. ": D¹o nµy lo ®¸nh trËn, kh«ng biÕt h«m nay t­íng qu©n ®· gi¸o huÊn ch­a?");
		return 0;
	end
	
	--ÅĞ¶ÏÎïÆ·
	if GetItemCount(2,111,2) < 1 then
		Talk(1, "", szNpcName .. ": D¹o nµy lo ®¸nh trËn, kh«ng biÕt h«m nay t­íng qu©n ®· gi¸o huÊn ch­a?");
		return 0;
	end
	if gf_Judge_Room_Weight(1,10, "") ~= 1 then return 0; end
	
	if DelItem(2,111,2,1) ~= 1 then return 0; end
	
	gf_AddItemEx({2,111,11,1}, "Th­ göi cho Hoµn Nhan T«ng Hµn");
	
	local szPlayerName = GetName();
	local szMsg = format("%s “Liªu chñ thÊt ®øc, trong ngoµi li t©m. TriÒu H­ng S­ ta ®¹i nghiÖp s¾p thµnh råi.” Ha Ha, Qu¶ nhiªn T«ng Hµn rÊt hiÓu lßng ta, ng­¬i h·y giao bøc th­ nµy cho h¾n, h¾n sÏ hiÓu t©m ı cña ta.", g_szNpcName);

	Talk(1, "", szMsg);
end

function OnDeath(nNpcIdx)
	--RemoveNpc(nNpcIdx);
end