Include("\\script\\missions\\yp\\tysd\\head.lua")
Include("\\script\\lib\\define.lua")

function enter(nType)
	nType = nType or GetTask(TASK_FIELD_PVP_CAMP);
	if nType == 0 then
		nType = 5;
	end	
	local nMapID = mf_GetMissionV(tbTYSD.missionID,MV_MAP_ID,tbTYSD.realMapID);
	if nMapID ~= 0 then
		tbTYSD:Enter(nMapID,nType);
	else
		nMapID = tbTYSD:Create();
		tbTYSD:Enter(nMapID,nType);
	end
	SetDeathPunish(0)
end

--服务器启动创建mission
function gameStart() 
  local nMapID = mf_GetMissionV(tbTYSD.missionID,MV_MAP_ID,tbTYSD.realMapID);
	if not nMapID then
  	return 0;
  end
	if nMapID == 0 then
		nMapID = tbTYSD:Create();
	end
end