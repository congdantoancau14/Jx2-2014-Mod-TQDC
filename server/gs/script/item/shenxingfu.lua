--神行符：流水五分钟
Include("\\script\\lib\\string.lua");


function OnUse()

	--赋一个加速魔法给玩家（"魔法字符串",速度增长,持续时间）
	CastState("state_move_speed_percent_add",60,5400,1);
	DelItem(2,0,143,1,1);
	StartTimeGuage(GetItemName(2,0,143),5400/18);
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex),929,1,0,5400);
end;
