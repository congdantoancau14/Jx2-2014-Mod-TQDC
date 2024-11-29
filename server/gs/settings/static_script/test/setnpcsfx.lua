
--步进回调函数
function OnProcessCallBack(wCurProcess, wMaxProcess, wCheckCode)
	if wCheckCode ~= N_THIS_CALL_BACK_CODE_NO_ITEM and wCheckCode ~= N_THIS_CALL_BACK_CODE_HAVE_ITEM then
		return 0
	end
	--print(format("OnProcessCallBack(%d/%d) check code=%d", wCurProcess, wMaxProcess, wCheckCode))
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetCurrentNpcSFX(nPidxNpc,905,0,1); --地面特效
	SetCurrentNpcSFX(nPidxNpc,t_rand_npc_sfx[random(1,getn(t_rand_npc_sfx))],2,1); --特效
	if wCurProcess >= wMaxProcess then
		DoStartScriptCallBack(0, 0, 0, "", 1)--停止冲击
	elseif (mod(wCurProcess, N_ONE_AWARD_CALL_BACK_CNT) == 0) then
		local nState = _DoOneExpChgZhenqi(wCheckCode == N_THIS_CALL_BACK_CODE_HAVE_ITEM)
		local tFaceTable = nil
		if nState == 0 then
			Msg2Player("K輈h huy謙 th蕋 b筰")
			SetCurrentNpcSFX(nPidxNpc, 922, 0, 0); --特效
			tFaceTable = t_expression[1]
		elseif nState == 1 then
			Msg2Player("K輈h huy謙 th祅h c玭g")
			SetCurrentNpcSFX(nPidxNpc, 921, 0, 0); --特效
			tFaceTable = t_expression[2]
		else
			DoStartScriptCallBack(0, 0, 0, "", 1)--停止冲击
		end
		if tFaceTable then
			local nFaceIndex = random(1,getn(tFaceTable))
			local szFaceMsg = format("%s", tFaceTable[nFaceIndex])
			NpcChat(PIdx2NpcIdx(PlayerIndex), szFaceMsg, 1)
		end
	end
	
	local nExpEnough = _CheckCanStartExpExchg(1, 0)
	if 1 ~= nExpEnough then
		DoStartScriptCallBack(0, 0, 0, "", 1) --停止冲击
		Talk(1,"",format("Kinh nghi謒 kh玭g , t筸 d鮪g k輈h huy謙 ch﹏ khi!"))
	end
end
