--ÌÒÊ÷ÖÖ×Ó
Include("\\script\\lib\\define.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
tTask = {
	{928,TASKID_SW_PEACH_SEED_NUM,},
	{947,TASKID_SW_PEACH_SEED_NUM,},} 
		
function OnUse(nItemIdx)
	local nTask = 0;
	for i = 1,getn(tTask) do
		if 1 == tGtTask:check_cur_task(tTask[i][1]) then
			nTask = tTask[i][2];
			break;
		end
	end
	if nTask == 0 then
		return 0;
	end
	if DelItem(2,96,130,1) ~= 1 then  return 0 end;
	local nMapId,nX,nY = GetWorldPos();
	
	local nNpcIdx = CreateNpc("§µo Hoa thô",GetName() .. "C©y ®µo ®· gieo trång",nMapId,nX,nY);
	SetNpcLifeTime(nNpcIdx,15);
	SetTask(nTask,GetTask(nTask) + 1);
end