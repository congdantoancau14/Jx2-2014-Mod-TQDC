
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��ʦ�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03
--Changed by joker(zhaoguichun)
--2006/09/04
--Changed point: add random boss

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua")
Include("\\script\\lib\\npccmdhead.lua");

TASK_BIAOCHE_INDEX = 1234;
TASK_YUNBIAO_MAP = 1235;
function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==13) then
		task_013_00()
		return
	end
	
	local szSay = "M�i ng��i h�y mau ��n <color=yellow>Th�nh ��<color> ��t mua Sinh Th�n Cang!";
	local tSay = {
		"Ta ��n chuy�n Sinh Th�n Cang v�o cung/escort",
		}
	tinsert(tSay, "Ch�o t�ng ti�u ��u! L�u r�i kh�ng g�p/nothing");
	Say(szSay,getn(tSay),tSay);
end

function escort()
	local nNpcIdx = GetTask(TASK_BIAOCHE_INDEX);
	print("escort >> nNpcIdx: "..nNpcIdx);
	
	nNpcIdx = 0;
	if nNpcIdx == 0 then
		nNpcIdx = CreateNpc("Ti�u xa 1", "Ti�u xa", GetWorldPos());
		SetTask(TASK_BIAOCHE_INDEX,nNpcIdx);
		local nMap = GetWorldPos();
		SetTask(TASK_YUNBIAO_MAP,nMap);
		
		if nNpcIdx ~= 0 then
		
			local nNpcID = GetNpcID(nNpcIdx);
			
			local nCamp = "camp_player";
		
			SetCampToNpc(nNpcIdx,nCamp);
			
			SetNpcDeathScript(nNpcIdx,"\\script\\missions\\yp\\biaoche_npc.lua");
			SetNpcRemoveScript(nNpcIdx,"\\script\\missions\\yp\\biaoche_npc.lua");
		
			g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
			
			--SetNpcTempData(nNpcIdx, 1, nBCType)
		end
	else
		Talk(1,"",GetTargetNpcName()..": Ng��i �� c� m�t xe r�i!")
	end

	return nNpcIdx;
end;

function nothing()
end;