--Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\npccmdhead.lua");
Include("\\script\\mod\\carriage\\carriage_head.lua");

tRouteMap = {
}


function OnUse()
	move()
end;

function move()
	--print("huanbiaoling >> move called.");
	local m,x,y = GetWorldPos();
	local pos = {{x,y},}
	
	local nCurTime = GetTime();
	
	local nNpcIdx = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX);
	local nOldMap = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.YUNBIAO_MAP);
	local nNewMap = m;
	if nNpcIdx ~= 0 then
		if nNewMap == nOldMap then
			moveBiaoChe(nNpcIdx,pos);
		else
			rebornBiaoChe(nNpcIdx,m,pos);
		end
	else
		Msg2Player("Kh«ng t×m thÊy xe");
	end
end

function rebornBiaoChe(nNpcIdx, nMap, tPos)
	SetNpcLifeTime(nNpcIdx,0);
	createBiaoChe()
end;


function moveBiaoChe(nNpcIdx,pos)
	g_NpcAI:setWayPoint(nNpcIdx, pos);
end;

function createBiaoChe()
	local nNpcIdx = CreateNpc("Xe vËn chuyÓn","Xe chë ®å",GetWorldPos());
	SetNpcScript(nNpcIdx,"\\script\\mod\\carriage\\npc_xevanchuyen.lua");
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX, nNpcIdx);
	local nMap = GetWorldPos();
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.YUNBIAO_MAP,nMap);
	if nNpcIdx ~= 0 then
	
		local nNpcID = GetNpcID(nNpcIdx);
		print("huancheling >> rebornBiaoChe >> nNpcID",nNpcID);
		g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
		
		--SetNpcTempData(nNpcIdx, 1, nBCType)
	end
end;
