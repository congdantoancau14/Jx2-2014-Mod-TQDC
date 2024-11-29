Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\task\\global_task\\gtask_head.lua")

g_NpcName = "<color=green>Ph¸ Hån §ao L©m Phong<color>: ";

TMAIN = {};
TMAIN_Action = {};
TMAIN_Death = {};

TMAIN.msg = g_NpcName.."Rèt cuéc ng­¬i lµ ai?";
TMAIN.sel = {
	{"Ta chØ ®i ngang qua ®©y th«i... ....", "nothing"},
};

TMAIN_Action.msg = g_NpcName.."ThiÕu hiÖp ®ang lµm g× thÕ?";
TMAIN_Action.sel = {
	{"H·y nép m¹ng nµo!", "Action"},
};

TMAIN_Death.msg = g_NpcName.."Rèt cuéc ng­¬i lµ ai? Sao l¹i muèn h¹ s¸t ta?";
TMAIN_Death.sel = {
	{"H·y cho h¾n uèng tóy b¸n tiªn", "GiveKG"},
};

function CheckTaskAction()
	if tGtCondition:check_taskid(481, 2) ~= nil or tGtCondition:check_taskid(850, 2) ~= nil then
		if BigGetItemCount(2, 96, 26) == 0 then
			return 1
		end
	end

	return 0
end

function main()
	if CheckTaskAction() == 1 then
		temp_Talk(TMAIN_Action);
	else
		temp_Talk(TMAIN);
	end
end

--×ª±äÎªÕ½¶·npc
function Action()
	local nNpcIdx = GetTargetNpc();
	ChangeNpcToFight(nNpcIdx);

	SetNpcLifeTime(nNpcIdx, 5 * 60);
end

function OnDeath(npc)
	if CheckTaskAction() == 1 then
		temp_Talk(TMAIN_Death);
	end

	SetNpcLifeTime(tonumber(npc), 10);
end

function OnRemove(nRemoveIdx)
	SetNpcRemoveScript(nRemoveIdx,"");
	local nNpcIdx = CreateNpc("Ph¸ Hån §ao L©m Phong", "Ph¸ Hån §ao L©m Phong", 6300, 1358, 3385);
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_linfeng.lua");
	SetNpcRemoveScript(nNpcIdx, "\\script\\pop\\npc_linfeng.lua");
	ChangeNpcToFight(nNpcIdx, 0, 6);
end

function GiveKG()
	Msg2Player("NhËn ®­îc khÈu cung");
	Talk(1, "", "NhËn ®­îc khÈu cung");
	gf_AddItemEx({2, 96, 26, 1}, "KhÈu cung cña L©m Phong");  --»ñµÃ¿Ú¹©
end
