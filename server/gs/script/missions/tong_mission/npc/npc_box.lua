Include("\\script\\missions\\tong_mission\\main_function.lua");

function main()
	local nNpcIdx = GetTargetNpc();
	if nNpcIdx <= 0 then
		return 0;
	end;
	if GetTaskTemp(TSK_TEMP_HELPER) == 1 then
		Talk(1,"","Vi�n tr� ngo�i bang kh�ng th� nh�t b�o r��ng.");
		return 0;
	end;
	local nCurJob = IsTongMember();
	if nCurJob <= 0 or nCurJob > 3 then
		Talk(1,"","B�o r��ng ph�i ���c m� b�i Bang chu, Ph� bang ch�, Tr��ng l�o.");
		return 0;
	end;
	local nParam2 = GetUnitCurStates(nNpcIdx,2);	
	local nStage = GetUnitCurStates(nNpcIdx,1);	
	local nNeedRoom = 2;
	if nStage == MAX_STAGE then
		nNeedRoom = 7;	--��6����Ҫ7���ռ�
	end;
	if gf_JudgeRoomWeight(nNeedRoom,50,"") == 0 then
		return 0;
	end;
	if nParam2 ~= 1 then	--���δ��ʰȡ
		TM_SetUnitCurStates(nNpcIdx,2,1);	--�����ѱ�ʰȡ
		SetNpcLifeTime(nNpcIdx,0);
		
		AddItem(2,1,30410,20)
		AddItem(2,1,30390,100);
		AddItem(2,1,30687,10);
		
		if nStage == MAX_STAGE then	--����ǵ�6�أ����ٸ�1��5�ص����Ӹ�1��
			AddItem(2,1,30770	,5);
			Msg2MSAll(MISSION_ID,GetName().." M� b�o r��ng c�a �i "..nStage..", thu ���c 5 H�a Ph�ng Tinh Hoa");
		end
		Msg2MSAll(MISSION_ID,GetName().." M� b�o r��ng c�a �i "..nStage..", thu ���c 20 M�nh Thi�n M�n, 100 M�nh Thi�n Cang, 10 Th�i Nh�t L�nh");
		SetMissionV(MV_GET_BOX,0);
		SendTongMessage(GetName().." Nh�t ���c r��ng c�a �i"..nStage..".	");
		WriteLog("[Bang h�i v��t �i]: "..GetName().." Nh�t ���c th�"..nStage..".	");
	end;
end;