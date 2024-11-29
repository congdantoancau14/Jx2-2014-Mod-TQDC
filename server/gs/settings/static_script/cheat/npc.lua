function OnDeath()
	local nNpcIndex = GetTargetNpc();
	SetNpcLifeTime(nNpcIndex,0);
end;