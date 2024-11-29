Include("\\script\\missions\\yp\\qmy\\head.lua")

function enter(nType)
	nType = nType or GetTask(TASK_FIELD_PVP_CAMP);
	if nType == 0 then
		nType = 5;
	end			
	local nMapID = mf_GetMissionV(tbSLY.missionID,MV_MAP_ID,tbSLY.realMapID);
	if nMapID ~= 0 then
		tbSLY:Enter(nMapID,nType);
	else
		nMapID = tbSLY:Create();
		tbSLY:Enter(nMapID,nType);
	end
	SetDeathPunish(0)
end

--服务器启动创建mission
function gameStart() 
  local nMapID = mf_GetMissionV(tbSLY.missionID,MV_MAP_ID,tbSLY.realMapID);
	if not nMapID then
  	return 0;
  end
	if nMapID == 0 then
		nMapID = tbSLY:Create();
	end
end

