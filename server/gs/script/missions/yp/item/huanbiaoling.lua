--Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\npccmdhead.lua");

tRouteMap = {
}

TASK_BIAOCHE_INDEX = 1234;
TASK_YUNBIAO_MAP = 1235;

function OnUse()
	move()
end;

function move()
	--print("huanbiaoling >> move called.");
	local m,x,y = GetWorldPos();
	local pos = {{x,y},}
	
	local nCurTime = GetTime();
	
	local nNpcIdx = GetTask(TASK_BIAOCHE_INDEX);
	local nOldMap = GetTask(TASK_YUNBIAO_MAP);
	local nNewMap = m;
	if nNpcIdx ~= 0 then
		if nNewMap == nOldMap then
			moveBiaoChe(nNpcIdx,pos);
		else
			rebornBiaoChe(nNpcIdx,m,pos);
		end
	else
		Msg2Player("Kh«ng t×m thÊy tiªu xa");
	end
end

function rebornBiaoChe(nNpcIdx, nMap, tPos)
	SetNpcLifeTime(nNpcIdx,0);
	local nNpcIdx = CreateNpc("Tiªu xa 1", "Tiªu xa", GetWorldPos());
	SetTask(TASK_BIAOCHE_INDEX,nNpcIdx);
	local nMap = GetWorldPos();
	SetTask(TASK_YUNBIAO_MAP,nMap);
	
	if nNpcIdx ~= 0 then
	
		local nNpcID = GetNpcID(nNpcIdx);
		
		local nCamp = "camp_player";
	
		SetCampToNpc(nNpcIdx,nCamp);
		
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\yp\\biaoche_npc.lua");
		SetNpcRemoveScript(nNpcIdx,"\\script\\missions\\yp\\biaoche_npc.lua");
	
		g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
		
		--SetNpcTempData(nNpcIdx, 1, nBCType)
	end
end;


function moveBiaoChe(nNpcIdx,pos)
	print("moveBiaoChe >> nNpcIdx: "..nNpcIdx);
	g_NpcAI:setWayPoint(nNpcIdx, pos);
end;

function createBiaoChe()
	local nNpcIdx = CreateNpc("Tiªu xa 1","Tiªu xa",GetWorldPos());
	SetTask(TASK_NPC_INDEX, nNpcIdx);
	if nNpcIdx ~= 0 then
		
		local nNpcID = GetNpcID(nNpcIdx);
		
		local nCamp = "camp_player";
	
		SetCampToNpc(nNpcIdx,nCamp);
		
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\yp\\biaoche_npc.lua");
		SetNpcRemoveScript(nNpcIdx,"\\script\\missions\\yp\\biaoche_npc.lua");
	
		g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
		
		--SetNpcTempData(nNpcIdx, 1, nBCType)
	end
end;
