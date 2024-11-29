Include("\\script\\missions\\yp\\mm\\head.lua")
Include("\\script\\lib\\define.lua")

function enter(nType)
	nType = nType or GetTask(TASK_FIELD_PVP_CAMP);
	if nType == 0 then
		nType = 5;
	end	
	local nMapID = mf_GetMissionV(tbXXMM.missionID,MV_MAP_ID,tbXXMM.realMapID);
	if nMapID ~= 0 then
		tbXXMM:Enter(nMapID,nType);
	else
		nMapID = tbXXMM:Create();
		tbXXMM:Enter(nMapID,nType);
	end
	SetDeathPunish(0)
end

function nothing()
	
end

--服务器启动创建mission
function gameStart() 
  local nMapID = mf_GetMissionV(tbXXMM.missionID,MV_MAP_ID,tbXXMM.realMapID);
	if not nMapID then
  	return 0;
  end
	if nMapID == 0 then
		nMapID = tbXXMM:Create();
	end
end