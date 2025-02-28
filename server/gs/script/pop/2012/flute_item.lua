--笛子
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua")

nItemID1 = 2;
nItemID2 = 96;

function OnUse(nItemIdx)
	local nMapId,nMapX,nMapY = GetWorldPos();
tNpcInfo = {
	[117] = {{1663,1},920,2,TASKID_SW_ITEM_FLUTE_CD,nil, --笛子 {skillId,skillLevel},任务ID，npcTypeNumber,itemUseCD
		{4,{"Li猽 Qu鑓 Th輈h Kh竎h","Li猽 Qu鑓 Th輈h Kh竎h",nMapId,nMapX,nMapY,-1,1,1,10},"\\script\\pop\\2012\\liaoguo_cike_npc.lua","\\script\\pop\\2012\\liaoguo_cike_npc.lua"},--{npcNum,{npcInfo(createNpc（） 参数)},npcScript,}
		{1,{"Li猽 Qu鑓 Th輈h Kh竎h Tinh Anh","Li猽 Qu鑓 Th輈h Kh竎h Tinh Anh",nMapId,nMapX,nMapY,-1,1},"\\script\\pop\\2012\\liaoguo_cike_npc.lua","\\script\\pop\\2012\\liaoguo_cike_npc.lua"},
		},
	[132] = {nil,0,1,TASKID_SW_ITEM_ZLSSW_CD,5077,--紫罗山圣物
		{1,{"Linh T� T�","Linh T� T�",nMapId,nMapX,nMapY,},"\\script\\pop\\2012\\flute_item.lua","\\script\\pop\\2012\\flute_item.lua",},
		},
	}	
	
	local g,d,p = GetItemInfoByIndex(nItemIdx);
	if g ~= nItemID1 or d ~= nItemID2 or not tNpcInfo[p] then
		return 0;
	end  
	local tNpc 		=  tNpcInfo[p];
	local nNumIdx = 3;
	local nNpcTabStartIdx = 6; 
	local nNpcIdx = 0;
	local nCDTime	= 120;
	local nDis = 100;
	if not tNpc[nNumIdx] or tNpc[nNumIdx] < 1 then
		return 0;
	end 
	
	if tNpc[2] and tNpc[2] > 0 then
		if tGtTask:check_cur_task(tNpc[2]) ~= 1 then
			return 0;
		end
	end
	if type(tNpc[4]) == "number" and GetTime() - GetTask(tNpc[4]) < nCDTime then
		Talk(1,"","Чo c� n祔 m鏸 2 ph髏 m韎 頲 d飊g 1 l莕!");
		return 0;
	end
	if tNpc[5] and tNpc[5] ~= nMapId then 
		Talk(1,"","H穣 v祇 V﹏ Trung  s� d鬾g v藅 ph萴 n祔.");
		return 0;
	end
--- 各种特殊处理啊
	if p == 117 and  nMapId ~= 600 and nMapId ~= 601 and nMapId ~= 602 then     
		Talk(1,"","H穣 n B� l筩 Vng K�, Чi Th秓 Nguy猲 1, Чi Th秓 Nguy猲 2 s� d鬾g v藅 ph萴 n祔!");
		return 0;
	end

	if p == 132 and abs(nMapX - 1587) < nDis and abs(nMapY - 3391) < nDis then
		Talk(1,"","H穣 � ngo筰 th祅h s� d鬾g v藅 ph萴 n祔!");
		return 0;
	end
--
	for i = nNpcTabStartIdx,getn(tNpc) do
		local nIdx = i ;
		if tNpc[nIdx] and tNpc[nIdx][1] and tNpc[nIdx][2] and tNpc[nIdx][3] then
			for ii = 1,tNpc[nIdx][1] do
				tNpc[nIdx][3] = tNpc[nIdx][3] or "";
				nNpcIdx = CreateNpc(gf_UnPack(tNpc[nIdx][2]));
				SetNpcScript(nNpcIdx,tNpc[nIdx][3]);
				if tNpc[nIdx][4] and tNpc[nIdx][4] ~= ""then
					SetNpcDeathScript(nNpcIdx,tNpc[nIdx][4]);
				end
			end
		end
	end
	
	SetTask(tNpc[4],GetTime());
	if nNpcIdx ~= 0 and type(tNpc[1]) == "table" then
		DoSkill2Target(nNpcIdx,tNpc[1][1],tNpc[1][2],PIdx2NpcIdx(PlayerIndex));
	end
end

function OnDeath(nNpcIdx)
	if GetNpcName(nNpcIdx) == "Linh T� T�" then
		gf_AddItemEx({2,96,133,1,4},"M秐h Чo c Kinh");
		RemoveNpc(nNpcIdx);
	end
end