Include("\\script\\online\\snowbattle\\head.lua");

function OnDeath(npcIdx)
	SB_HandleExp(400000, 25);
	SB_HandleRandItem();
	SetNpcLifeTime(npcIdx, 0);
	SB_OnMonsterDied();
end