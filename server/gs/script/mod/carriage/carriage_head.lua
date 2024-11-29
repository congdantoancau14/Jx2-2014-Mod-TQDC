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
		Say(npc_name.."Ng­¬i ®· cã mét xe råi, mét xe kh«ng ®ñ cho ng­¬i chë sao?",2,
			"Nh­ng ta lµm mÊt råi!/createCarriage",
			"Th«i vËy/nothing"
		)
	end

	return nNpcIdx;
end;

function createCarriage()
	
	local npc_name = format("<color=green>%s<color>: ",GetTargetNpcName());
	
	if Pay(51000) ~= 1 then 
		Talk(1,"",npc_name.."Kh«ng cã tiÒn mµ còng ®ßi thuª xe sao? BiÕn ®i chç kh¸c cho ta lµm ¨n");
		return 0;
	end
	if GetItemCount(2,1,29004) < 1 then 
		AddItem(2,1,29004,1);
	end
	Talk(1,"",npc_name.."Ta sÏ lÊy ng­¬i <color=gold>5 vµng<color> ®Æt cäc vµ <color=white>10 b¹c<color>. "
		.."Khi nµo ng­¬i tr¶ xe, ta sÏ tr¶ l¹i ng­¬i tiÒn ®Æt cäc. "
		.."Cßn ®©y lµ <color=yellow>ho¸n xa lÖnh<color>. Dïng nã ®Ó ®iÒu khiÓn xe cña ng­¬i."
	)
	nNpcIdx = CreateNpc("Xe vËn chuyÓn", "Xe chë ®å", GetWorldPos());
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
		Talk(1,"",npc_name.."Ng­¬i cã thuª xe bao giê ®©u mµ tr¶!")
	else
		if MAX_ITEM_COUNT > 1 then 
			Talk(1,"",npc_name.."Ng­¬i bá quªn ®å trªn xe k×a! §i ®©u mµ véi vµng thÕ?!!")
			return 0;
		end
		BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX,0);
		BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.YUNBIAO_MAP,0);
		SetNpcLifeTime(nNpcIdx,0);
		Earn(50000);
		DelItem(2,1,29004,1);
		Talk(1,"",npc_name.."TiÒn cäc cña ng­¬i ®©y!")
	end

end;

function nothing() end;