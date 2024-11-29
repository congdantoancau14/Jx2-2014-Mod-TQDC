Include("\\script\\online\\snowbattle\\head.lua");

function OnDeath(npcIdx)
	SB_HandleExp(800000, 50);
	SB_HandleBothItem();
	SetNpcLifeTime(npcIdx, 0);
	SB_OnMonsterDied();
end