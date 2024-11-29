--Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\mod\\carriage\\carriage_head.lua");

tRouteMap = {
}


function OnUse()
	move()
end;

function move()
	--print("huanbiaoling >> move called.");
	
	
	local nMap,nPosX,nPosY = GetWorldPos();
	local tPos = {{nPosX,nPosY},}
	
	local nCurTime = GetTime();
	
	local nOldNpcIdx = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX);
	local nOldMap = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.LAST_MAP);
	
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nOldNpcIdx);
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	
	-- print(nDistance);
	
	local nNewMap = nMap;
	if nOldNpcIdx ~= 0 then
		if nNewMap == nOldMap then
			if nDistance > MAX_DISTANCE then 
				Msg2Player(format("Kho¶ng c¸ch: [%d] Qu¸ xa. Xe kh«ng nhËn ®­îc tÝn hiÖu.",nDistance));
			end
			moveBiaoChe(nOldNpcIdx,tPos);
		else
			rebornBiaoChe(nOldNpcIdx,nMap,tPos);
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
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.LAST_MAP,nMap);
	if nNpcIdx ~= 0 then
	
		local nNpcID = GetNpcID(nNpcIdx);
		print("huancheling >> rebornBiaoChe >> nNpcID",nNpcID);
		g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
		
		--SetNpcTempData(nNpcIdx, 1, nBCType)
	end
end;
