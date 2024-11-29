Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\task\\global_task\\task_id.lua")

NPC_TYSMR = "<color=green>Thiªn ¢m Gi¸o Thñ M«n Nh©n<color>:"

function main()
	local mapID = GetWorldPos();
	local tFunc = {
		["425"] = EnterTysmd,
		["8012"] = LeaveTysmd,
	};
	tFunc[tostring(mapID)]();
end

function EnterTysmd()
	Say(NPC_TYSMR..format("Ta chØ biÕt Thiªn ¢m LÖnh Bµi, kh«ng biÕt ng­êi nµo", gf_GetPlayerSexName()),
		3,
		"ThÕ nµo míi ®­îc ®i vµo Thiªn ¢m ThÇn BÝ C¬ §Þa/EnterTysmdHow",
		"§i vµo Thiªn ¢m ThÇn BÝ C¬ §Þa/EnterTysmdEnsure",
		"T¹i h¹ chØ xem qua th«i/nothing");	
end

function EnterTysmdHow()
	Say(NPC_TYSMR.."Nh©n vËt tham gia nhiÖm vô phôc sinh 3 vµ thu tËp 10 Thiªn ¢m LÖnh Bµi míi ®­îc ®i vµo Thiªn ¢m ThÇn BÝ C¬ §Þa.LÇn ®Çu ®i vµo cÇn nép 10 Thiªn ¢m LÖnh Bµi, lÇn sau ®i vµo kh«ng cÇn nép thªm.",
		2,
		"trë l¹i/EnterTysmd",
		"KÕt thóc ®èi tho¹i/nothing")
end

function EnterTysmdEnsure()
	--ÒÑÍê³É337»òÕßÃ»ÓÐÍê³É335ÈÎÎñµÄ¶¼²»ÄÜ½øÈë
	if tGtTask:check_task_isfinish(337) == 1 or tGtTask:check_task_isfinish(335) ~= 1 then
		Talk(1,"",NPC_TYSMR.."§­êng ®i phÝa tr­íc kh«ng th«ng!");
		return 0;
	end
	if GetTeamSize() > 1 then
		Talk(1,"","Thiªn ¢m ThÇn BÝ C¬ §Þa kh«ng thÓ tæ ®éi ®i vµo ");
		return 0;
	end
	if GetTask(Task_id_018) == 0 then
		if BigGetItemCount(2, 1, 30861) < 10 then
			Talk(1,"","");
			return 0;
		end
		if BigDelItem(2, 1, 30861, BigGetItemCount(2, 1, 30861)) ~= 1 then
			return 0;
		end
		SetTask(Task_id_018, 1);
	end
	NewWorld(8012,1593,3222);
	SetFightState(1);
end

function LeaveTysmd()
	Say(NPC_TYSMR..format("%s cã muèn rêi khái Thiªn ¢m ThÇn BÝ C¬ §Þa kh«ng?", gf_GetPlayerSexName()),
		2,
		"Rêi khái/LeaveTysmdEnsure",
		"T¹i h¹ chØ xem qua th«i/nothing");	
end

function LeaveTysmdEnsure()
	NewWorld(425,1802,3378);
end
	