Include("\\script\\misc\\taskmanager.lua");
Include("\\script\\mod\\carriage\\npc_xevanchuyen.lua");

nNpcIdx = 0;
BIAOCHE_TASKGROUP =  TaskManager:Create(11,10);
BIAOCHE_TASKGROUP.BIAOCHE_INDEX = 90;
BIAOCHE_TASKGROUP.YUNBIAO_MAP = 91;

function main()
	print("carriage_head::called");
end;

function rentCarriage()
	
	local npc_name = format("<color=green>%s<color>: ",GetTargetNpcName());
	
	nNpcIdx = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX);
	
	print("rentCarriage >> nNpcIdx: "..nNpcIdx);
	if nNpcIdx == 0 then
		createCarriage()
	else
		Say(npc_name.."Ng��i �� c� m�t xe r�i, m�t xe kh�ng �� cho ng��i ch� sao?",2,
			"Nh�ng ta l�m m�t r�i!/createCarriage",
			"Th�i v�y/nothing"
		)
	end

	return nNpcIdx;
end;

function createCarriage()
	
	local npc_name = format("<color=green>%s<color>: ",GetTargetNpcName());
	
	if Pay(51000) ~= 1 then 
		Talk(1,"",npc_name.."Kh�ng c� ti�n m� c�ng ��i thu� xe sao? Bi�n �i ch� kh�c cho ta l�m �n");
		return 0;
	end
	if GetItemCount(2,1,29004) < 1 then 
		AddItem(2,1,29004,1);
	end
	Talk(1,"",npc_name.."Ta s� l�y ng��i <color=gold>5 v�ng<color> ��t c�c v� <color=white>10 b�c<color>. "
		.."Khi n�o ng��i tr� xe, ta s� tr� l�i ng��i ti�n ��t c�c. "
		.."C�n ��y l� <color=yellow>ho�n xa l�nh<color>. D�ng n� �� �i�u khi�n xe c�a ng��i."
	)
	nNpcIdx = CreateNpc("Xe v�n chuy�n", "Xe ch� ��", GetWorldPos());
	SetNpcScript(nNpcIdx,"\\script\\mod\\carriage\\npc_xevanchuyen.lua");
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX,nNpcIdx);
	local nMap = GetWorldPos();
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.YUNBIAO_MAP,nMap);
	
	if nNpcIdx ~= 0 then
	
		local nNpcID = GetNpcID(nNpcIdx);
		print("rentCarriage >> nNpcID",nNpcID);
		g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
		
		--SetNpcTempData(nNpcIdx, 1, nBCType)
	end
end;

function returnCarriage()
	init(nStoreId);
	-- print(nStoreId,MAX_ITEM_COUNT,getn(TB_ITEMS));
	
	local npc_name = format("<color=green>%s<color>: ",GetTargetNpcName());
	local nNpcIdx = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX);
	if nNpcIdx == 0 then
		Talk(1,"",npc_name.."Ng��i c� thu� xe bao gi� ��u m� tr�!")
	else
		if MAX_ITEM_COUNT > 1 then 
			Talk(1,"",npc_name.."Ng��i b� qu�n �� tr�n xe k�a! �i ��u m� v�i v�ng th�?!!")
			return 0;
		end
		BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX,0);
		BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.YUNBIAO_MAP,0);
		SetNpcLifeTime(nNpcIdx,0);
		Earn(50000);
		DelItem(2,1,29004,1);
		Talk(1,"",npc_name.."Ti�n c�c c�a ng��i ��y!")
	end

end;

function nothing() end;