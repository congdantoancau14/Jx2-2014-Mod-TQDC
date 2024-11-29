--Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\mod\\expand_box\\carriage\\carriage_head.lua");

tRouteMap = {}

function OnUse()
	move_carriage()
	-- SetTask(BIAOCHE_INDEX,0);
	-- SetTask(BIAOCHE_RENT_MAP,0);
	-- print("\nGetTask(BIAOCHE_INDEX)",GetTask(BIAOCHE_INDEX))
	-- print("GetTask(BIAOCHE_RENT_MAP)",GetTask(BIAOCHE_RENT_MAP))
	-- print("GetTask(BIAOCHE_RENT_TIME)",GetTask(BIAOCHE_RENT_TIME))
end;

function move_carriage()
	--print("huanbiaoling >> move_carriage called.");
	
	local nMap,nPosX,nPosY = GetWorldPos();
	local tPos = {{nPosX,nPosY},}
	
	local nCurTime = GetTime();
	
	local nOldCarIndex = GetTask(BIAOCHE_INDEX);
	--print("\n ________________________");
	--print("\n move_carriage >> nOldCarIndex",nOldCarIndex);
	local nOldMap = GetTask(BIAOCHE_LAST_MAP);
	
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nOldCarIndex);
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	
	-- print(nDistance);
	
	local nNewMap = nMap;
	
	--print(nNewMap.."-"..nOldMap);
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


