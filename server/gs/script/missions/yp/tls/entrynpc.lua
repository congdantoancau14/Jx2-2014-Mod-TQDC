Include("\\script\\missions\\yp\\tls\\head.lua")
Include("\\script\\lib\\define.lua")

function enter(nType)
	nType = nType or GetTask(TASK_FIELD_PVP_CAMP);
	if nType == 0 then
		nType = 5;
	end
	local nMapID = mf_GetMissionV(tbDLTLS.missionID,MV_MAP_ID,tbDLTLS.realMapID);
	if nMapID ~= 0 then
		tbDLTLS:Enter(nMapID,nType);
	else
		nMapID = tbDLTLS:Create();
		tbDLTLS:Enter(nMapID,nType);
	end
	SetDeathPunish(0)
end

function nothing()
	
end

--服务器启动创建mission
function gameStart() 
  local nMapID = mf_GetMissionV(tbDLTLS.missionID,MV_MAP_ID,tbDLTLS.realMapID);
	if not nMapID then
  	return 0;
  end
	if nMapID == 0 then
		nMapID = tbDLTLS:Create();
	end
end
