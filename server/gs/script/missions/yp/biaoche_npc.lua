--�ڳ�
Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\class\\ktabfile.lua");

TABLE_YunBiao = new(KTabFile,"\\settings\\task\\yunbiao.txt");

function OnDeath(nNpcIndex)
	local strName = GetNpcName(nNpcIndex);
	local index = GetNpcTempData(nNpcIndex, 1)
	local tTemp = {
		{"Ti�u Xa Th��ng",10},
		{"Ti�u Xa Quan Tr�ng",11},
		{"Ti�u Xa Qu�n D�ng",12},
		{"Ti�u Xa C� M�t",13},
		{"Ti�u Xa Ho�ng Gia",14},
	};
	if not tTemp[index] then
		print("ERROR: OnDeath index =", index)
		return
	end
	SetNpcRemoveScript(nNpcIndex,"");
	SetNpcLifeTime(nNpcIndex,0);
	local nNeedCash = tonumber(TABLE_YunBiao:getCell(index+1,2));
	Earn(floor(nNeedCash*0.8));
	if GetTask(TASK_FIELD_PVP_CAR_TASK) == 1 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end						
		SetTask(TASK_FIELD_PVP_CAR_TASK, 2)
		local nType = tTemp[index][2];
		gf_AddItemEx({tPVPItemInfo[nType][2],tPVPItemInfo[nType][3],tPVPItemInfo[nType][4],1},tPVPItemInfo[nType][1]);
	end
end

function OnRemove(nNpcIndex)
	
end

