--Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\mod\\carriage\\carriage_head.lua");

tRouteMap = {}

function OnUse()
	move_carriage()
	-- BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX,0);
	-- BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.RENT_MAP,0);
	-- print("\nBIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX)",BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX))
	-- print("BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.RENT_MAP)",BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.RENT_MAP))
	-- print("BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.RENT_TIME)",BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.RENT_TIME))
end;

function move_carriage()
	--print("huanbiaoling >> move_carriage called.");
	
	local nMap,nPosX,nPosY = GetWorldPos();
	local tPos = {{nPosX,nPosY},}
	
	local nCurTime = GetTime();
	
	local nOldCarIndex = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX);
	-- print("\n ________________________");
	-- print("\n move_carriage >> nOldCarIndex",nOldCarIndex);
	local nOldMap = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.LAST_MAP);
	
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nOldCarIndex);
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	
	-- print(nDistance);
	
	local nNewMap = nMap;
	if nOldCarIndex ~= 0 then
		if nNewMap == nOldMap then
			if nDistance > MAX_DISTANCE then 
				Msg2Player(format("Kho¶ng c¸ch: [%d] Qu¸ xa. Xe kh«ng nhËn ®­îc tÝn hiÖu.",nDistance));
			end
			moveBiaoChe(nOldCarIndex,tPos);
		else
			rebornBiaoChe(nOldCarIndex,nMap,tPos);
		end
	else
		Msg2Player("Kh«ng t×m thÊy xe");
	end
end

function rebornBiaoChe(nCarIndex,nMap,tPos)
	-- print(format("SetNpcLifeTime(%d,0)",nCarIndex))
	SetNpcLifeTime(nCarIndex,0);
	createBiaoChe()
end;


function moveBiaoChe(nCarIndex,pos)
	g_NpcAI:setWayPoint(nCarIndex,pos);
end;

function createBiaoChe()
	local nCarIndex = CreateNpc("Xe vËn chuyÓn","Xe chë ®å",GetWorldPos());
	SetNpcScript(nCarIndex,"\\script\\mod\\carriage\\npc_xevanchuyen.lua");
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX, nCarIndex);
	local nMap = GetWorldPos();
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.LAST_MAP, nMap);
	if nCarIndex ~= 0 then
	
		-- local nNpcID = GetNpcID(nCarIndex);
		-- print("huancheling >> rebornBiaoChe >> nNpcID",nNpcID);
		g_NpcAI:setAI(nCarIndex,AT_SM_MOVE);
		
		--SetNpcTempData(nCarIndex, 1, nBCType)
	end
end;
