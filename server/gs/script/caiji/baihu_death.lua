function main()
	local nCurNpcIndex = GetTargetNpc()
	local m,x,y = GetNpcWorldPos(nCurNpcIndex)
	local nNpcIdx = CreateNpc("Da b�ch h�","Da b�ch h�",m,x,y);
	SetNpcScript(nNpcIdx,"\\script\\caiji\\һ���׻�֮Ƥ.lua");
end;