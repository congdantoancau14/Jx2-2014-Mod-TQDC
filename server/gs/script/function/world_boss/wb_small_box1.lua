--��ս����
Include("\\script\\function\\world_boss\\wb_head.lua")

function main()
	if gf_CheckBaseCondition(79) ~= 1 then
		return 0;
	end
	local npcIndex = GetTargetNpc()
	if wb_GetSmallBoxFlag1() > 0 then
		Talk(1,"",format("�� nh�n ph�n th��ng %s r�i, kh�ng th� nh�n l�i", GetNpcName(npcIndex)));
		return
	end
	local boss = wb_GetBossName()
	if not boss then
		Talk(1,"","Ch� c� ng��i ch�i tham gia ti�u di�t BOSS m�i c� th� m� b�o r��ng");
		return
	end
	if wb_SmallBoxAward() == 1 then
		wb_SetSmallBoxFlag1()
		SetNpcLifeTime(npcIndex, 0);
	end
end