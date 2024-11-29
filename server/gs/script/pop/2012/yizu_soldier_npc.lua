Include("\\script\\lib\\define.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

--ÁÉ¹ú¾ü¹ÙËÀÍö
function OnDeath(nNpcIdx)
	if tGtTask:check_cur_task(921) == 1 then
		Talk(1,"","SÜ Quan Liªu Quèc: §¹i hiÖp ®õng ®¸nh n÷a! Qu¶ thËt ta kh«ng biÕt t×nh h×nh cô thÓ, chØ nghe nãi r»ng cèng phÈm ®ang ®­îc ®Ö nhÊt cao thñ cña Liªu Quèc tr«ng coi! Xin ®¹i hiÖp tha m¹ng!");
		SetTask(TASKID_SW_USE_ANTIDOTE,1);
	end
	RemoveNpc(nNpcIdx);
end
