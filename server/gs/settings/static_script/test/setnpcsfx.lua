
--�����ص�����
function OnProcessCallBack(wCurProcess, wMaxProcess, wCheckCode)
	if wCheckCode ~= N_THIS_CALL_BACK_CODE_NO_ITEM and wCheckCode ~= N_THIS_CALL_BACK_CODE_HAVE_ITEM then
		return 0
	end
	--print(format("OnProcessCallBack(%d/%d) check code=%d", wCurProcess, wMaxProcess, wCheckCode))
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetCurrentNpcSFX(nPidxNpc,905,0,1); --������Ч
	SetCurrentNpcSFX(nPidxNpc,t_rand_npc_sfx[random(1,getn(t_rand_npc_sfx))],2,1); --��Ч
	if wCurProcess >= wMaxProcess then
		DoStartScriptCallBack(0, 0, 0, "", 1)--ֹͣ���
	elseif (mod(wCurProcess, N_ONE_AWARD_CALL_BACK_CNT) == 0) then
		local nState = _DoOneExpChgZhenqi(wCheckCode == N_THIS_CALL_BACK_CODE_HAVE_ITEM)
		local tFaceTable = nil
		if nState == 0 then
			Msg2Player("K�ch huy�t th�t b�i")
			SetCurrentNpcSFX(nPidxNpc, 922, 0, 0); --��Ч
			tFaceTable = t_expression[1]
		elseif nState == 1 then
			Msg2Player("K�ch huy�t th�nh c�ng")
			SetCurrentNpcSFX(nPidxNpc, 921, 0, 0); --��Ч
			tFaceTable = t_expression[2]
		else
			DoStartScriptCallBack(0, 0, 0, "", 1)--ֹͣ���
		end
		if tFaceTable then
			local nFaceIndex = random(1,getn(tFaceTable))
			local szFaceMsg = format("%s", tFaceTable[nFaceIndex])
			NpcChat(PIdx2NpcIdx(PlayerIndex), szFaceMsg, 1)
		end
	end
	
	local nExpEnough = _CheckCanStartExpExchg(1, 0)
	if 1 ~= nExpEnough then
		DoStartScriptCallBack(0, 0, 0, "", 1) --ֹͣ���
		Talk(1,"",format("Kinh nghi�m kh�ng ��, t�m d�ng k�ch huy�t ch�n khi!"))
	end
end
