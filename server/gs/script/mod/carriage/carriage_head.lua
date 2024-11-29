Include("\\script\\misc\\taskmanager.lua");
Include("\\script\\lib\\npccmdhead.lua");
Include("\\script\\mod\\carriage\\npc_xevanchuyen.lua");

MAX_DISTANCE = 70;
BIAOCHE_TASKGROUP =  TaskManager:Create(11,10);
BIAOCHE_TASKGROUP.BIAOCHE_INDEX = 41;
BIAOCHE_TASKGROUP.RENT_MAP = 42;
BIAOCHE_TASKGROUP.RENT_TIME = 43;
BIAOCHE_TASKGROUP.LAST_MAP = 44;

tHuanCheLing = {2,1,29004}
npc_name = "";

function main()
	print("carriage_head::called");
end;

function rentCarriage()
	
	local npc_name = format("<color=green>%s<color>: ",GetTargetNpcName());

	local nNpcIdx = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX);
	print("\nrentCarriage >> GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX): "..nNpcIdx);
	
	if nNpcIdx == 0 then
		createCarriage()
	else
		Say(npc_name.."Theo chi�c Ho�n xa l�nh c�a ng��i th� ng��i �� c� m�t xe r�i, m�t xe kh�ng �� cho ng��i ch� sao?",2,
			"Nh�ng ta l�m m�t r�i!/#createCarriage(1)",
			"Th�i v�y/nothing"
		)
	end

	return nNpcIdx;
end;

function is_rent_carriage_outtime()
	local nNpcIdx = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX);
	if nNpcIdx ~= 0 and get_rent_carriage_days() > 1 then 
		return 1;
	end
	return 0;
end;

function get_rent_carriage_days()
	local nCurTime = GetTime();
	local nRentTime = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.RENT_TIME);
	if nRentTime == 0 then 
		return 0;
	end
	return floor(nCurTime/86400 - nRentTime/86400);
end;

function createCarriage(nLost)
	
	local npc_name = format("<color=green>%s<color>: ",GetTargetNpcName());
	
	local nMap,nPosX,nPosY = GetWorldPos();
	local tPos = {{nPosX,nPosY},}
	
	local nOldNpcIdx = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX);
	local nOldMap = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.RENT_MAP);
	
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nOldNpcIdx);
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	
	if nLost == 1 then 

		
		-- if nNpcIdx == 0 then -- This never be trigger because of the condition in the function rentCarriage()
			-- Talk(1,"",npc_name.."�� ng�c. Ng��i c� thu� xe bao gi� ��u t�m?!!")
			-- return 0;
		-- end
		
		if nMap == nNpcMapID and nDistance < MAX_DISTANCE then 
			Talk(2,"",npc_name.."Ch�ng ph�i xe c�a ng��i � ngay kia �� sao? M�t ng��i c� v�n �� �?",
			format("<color=green>%s<color>: ��a t� ch�t cho vui! L�m g� m� c�ng th�! :)",GetName()));
			return 0;
		end
		
		
		if nMap == nOldMap and nMap == nNpcMapID then 
			Talk(1,"",npc_name.."��ng l� l��i bi�ng v� ngu ng�c. C� c�i xe m� c�ng l�m m�t ���c. T�m k� l�i trong th�nh xem. C�i xe ng�a ch� c� ph�i c�y kim ��u.")
			return 0;
		end
		
		if nMap ~= nOldMap then 
			local nPassedDays = get_rent_carriage_days();
			if nPassedDays > 0 then 
				Talk(1,"",npc_name.."H�m, theo ng�y th�ng ghi tr�n Ho�n ti�u l�nh, ng��i �� qu� h�n tr� xe nhi�u ng�y r�i. T�nh �n qu�t c�a c�a ng��i ta ��ng kh�ng?");
				return 0;
			else
				Talk(1,"",npc_name.."Sao ng��i b�t c�n v�y? M� th�i, th�y b� d�ng ��ng th��ng c�a ng��i th� ta c�ng cho ng��i thu� xe m�i. N�u t�m th�y xe c� th� mang tr� l�i ng��i ta.");
			end
		else
			if Pay(1000000) == 1 then 
				Talk(1,"",npc_name.."���c th�i. Tr��c h�t ng��i ph�i ��n ta 100 l��ng v�ng. C�n ti�n thu� m�i th� ch�t t�nh ti�p.");
			else
				Talk(1,"",npc_name.."Ng��i l�m m�t r�i, �� kh�ng c� ti�n ��n b� c�n ��i thu� n�a �! Ta t�m tha cho ng��i. Mau cu�n x�o �i ch� kh�c.")
				return 0;
			end
		end
	end
	
	if Pay(51000) ~= 1 then 
		Talk(1,"",npc_name.."Kh�ng c� ti�n m� c�ng ��i thu� xe sao? Bi�n �i ch� kh�c cho ta l�m �n");
		return 0;
	end
	if GetItemCount(tHuanCheLing[1],tHuanCheLing[2],tHuanCheLing[3]) < 1 then 
		AddItem(tHuanCheLing[1],tHuanCheLing[2],tHuanCheLing[3],1);
	end
	Talk(1,"",npc_name.."N�u ng��i nghe nh�ng �i�u n�y r�i th� ta v�n ph�i n�i th�m kh�ng th�a. "
		.."Ta s� l�y ng��i <color=gold>5 l��ng v�ng<color> ��t c�c v� <color=white>10 b�c<color>. "
		.."Khi n�o ng��i tr� xe, ta s� tr� l�i ng��i ti�n ��t c�c. "
		.."C�n ��y l� <color=yellow>Ho�n xa l�nh<color>. Khi ng��i v�y l�nh b�i n�y, ng�a s� �i theo ng��i. "
		.."D�ng n� �� �i�u khi�n xe c�a ng��i.\n"
		.."C� �i�u ng��i h�y l�u � r�ng ta ch� cho thu� xe trong 24 gi�. "
		.."Ng��i tr� ch�m m�t ng�y ta s� t�nh th�m <color=gold>5 l��ng v�ng<color>. Gi�i h�n l� 300 l��ng v�ng. Ng��i nh� tr� cho ��ng k� h�n. "
		.."Ng��i kh�ng th� gi� m�i xe c�a ta ���c, ta c�n ph�i l�m �n n�a ch�!"
	)
	
	SetNpcLifeTime(nOldNpcIdx,0);
	local nNpcIdx = CreateNpc("Xe v�n chuy�n", "Xe ch� ��", GetWorldPos());
	SetNpcScript(nNpcIdx,"\\script\\mod\\carriage\\npc_xevanchuyen.lua");
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX,nNpcIdx);

	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.RENT_MAP,nMap);
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.LAST_MAP,nMap);
	
	local nTime = GetTime()
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.RENT_TIME,nTime);
	
	if nNpcIdx ~= 0 then
	
		-- local nNpcID = GetNpcID(nNpcIdx);
		-- print("rentCarriage >> nNpcID",nNpcID);
		g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
		
		--SetNpcTempData(nNpcIdx, 1, nBCType)
	end
end;

function returnCarriage(nForce)
	npc_name = format("<color=green>%s<color>: ",GetTargetNpcName());
	init(nStoreId);
	-- print(nStoreId,MAX_ITEM_COUNT,getn(TB_ITEMS));
	
	local nMap,nPosX,nPosY = GetWorldPos();
	local tPos = {{nPosX,nPosY},}

	
	local nOldNpcIdx = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX);
	local nOldMap = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.RENT_MAP);
	
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nOldNpcIdx);
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	
	local nNpcIdx = nOldNpcIdx;
	
	if nNpcIdx == 0 then
		Talk(1,"",npc_name.."Ng��i c� thu� xe bao gi� ��u m� tr�!")
		return 0;
	end
	
	if nMap ~= nNpcMapID or nDistance > MAX_DISTANCE then 
		Say(npc_name.."Xe c�a ng��i ��u? L�m m�t r�i sao?!!",2,
			"Ta l� l�m m�t Ho�n Xa l�nh r�i/lost_lingpai",
			"Kh�ng, ch� m�t l�t �� ta �i rong t�i ��y!/nothing"
		);
		return 0;
	end
	print("nOldMap",nOldMap);
	local nPayHelpReturn = 0;
	if nMap == nNpcMapID and nMap ~= nOldMap then
		if nForce ~= 1 then
			Say(npc_name.."Chi�c xe ng�a n�y kh�ng ph�i lo�i xe � th�nh th� n�y. Ng��i thu� � ��u th� mau nh� l�i r�i tr� cho ng��i ta. �� ng�c!",2,
				"Ta th�c s� kh�ng nh� � ��u, nh� ng��i gi�p tr� l�i/#returnCarriage(1)",
				"Ta ch� ��ng tr� ch�t th�i, sao n�ng l�i qu� v�y?!!/nothing"
			);
			return 0;
		else
			Talk(1,"",npc_name.."Th�i ���c, ta s� tr� xe gi�p ng��i. Chi ph� tr� xe t�ng th�m <color=gold>10 l��ng v�ng<color>. C�n nh�ng kho�n tr� tr� ch�a t�nh.");
			nPayHelpReturn = 100000;
		end
	end
	
	if MAX_ITEM_COUNT > 0 then 
		print(MAX_ITEM_COUNT);
		Talk(1,"",npc_name.."Ng��i b� qu�n �� tr�n xe k�a! �i ��u m� v�i v�ng th�?!!")
		return 0;
	end
	local nPassedDays = get_rent_carriage_days();
	if nPassedDays > 0 then 
		local nPay = nPassedDays * 50000;
		if nPayHelpReturn ~= 0 then 
			nPay = nPay + nPayHelpReturn;
		end
		if Pay(nPay) ~= 1 then 
			Talk(1,"",format(npc_name.."Ng��i tr� xe ch�m tr� [<color=red>%d<color>] ng�y. Ng��i ch�a mang �� ti�n ��ng ph�t r�i.",nPassedDays));
			return 0;
		else
			Talk(1,"",format(npc_name.."Ng��i tr� xe ch�m tr� %d ng�y. S� ti�n ph�i n�p ph�t l� %d ��ng.",nPassedDays,nPay));
		end
	end
	
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX,0);
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.RENT_MAP,0);
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.RENT_TIME,0);
	SetNpcLifeTime(nNpcIdx,0);
	Earn(50000);
	DelItem(tHuanCheLing[1],tHuanCheLing[2],tHuanCheLing[3],1);
	Talk(1,"",npc_name.."Ti�n c�c c�a ng�i ��y! L�n sau l�i t�i nh�! ;)")
	
	return 1;
end;

function lost_lingpai()
	Talk(1,"",npc_name.."Giang h� nhi�u chuy�n h�n lo�n, l�m m�t v�t n� v�t kia c�ng l� chuy�n d� hi�u. Ta c� th� th�ng c�m cho ng��i. Nh�ng ph� c�p l�i l� <color=gray>10 l��ng b�c<color>");
	if Pay(1000) ~= 1 then 
		Talk(1,"",npc_name.."Ng��i m�t xe r�i m�t c� ti�n sao? G�p c��p ch�ng? Kh�n n�n nh�!")
		return 0;
	else
		Talk(1,"",npc_name.."C�a ng��i ��y, nh� gi� c�n th�n nh�!")
		AddItem(tHuanCheLing[1],tHuanCheLing[2],tHuanCheLing[3],1);
	end
end;

function nothing() end;