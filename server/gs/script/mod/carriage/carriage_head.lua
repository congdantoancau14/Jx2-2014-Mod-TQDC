Include("\\script\\misc\\taskmanager.lua");
Include("\\script\\lib\\npccmdhead.lua");
Include("\\script\\mod\\carriage\\npc_xevanchuyen.lua");

MAX_DISTANCE = 70;
nNpcIdx = 0;
BIAOCHE_TASKGROUP =  TaskManager:Create(11,10);
BIAOCHE_TASKGROUP.BIAOCHE_INDEX = 90;
BIAOCHE_TASKGROUP.RENT_MAP = 91;
BIAOCHE_TASKGROUP.RENT_TIME = 92;
BIAOCHE_TASKGROUP.LAST_MAP = 93;

tHuanCheLing = {2,1,29004}

function main()
	print("carriage_head::called");
end;

function rentCarriage()
	
	local npc_name = format("<color=green>%s<color>: ",GetTargetNpcName());
	
	local nCurTime = GetTime();
	local nRentTime = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.RENT_TIME);
	
	local nMap,nPosX,nPosY = GetWorldPos();
	local tPos = {{nPosX,nPosY},}
	
	local nOldNpcIdx = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX);
	local nOldMap = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.RENT_MAP);
	
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nOldNpcIdx);
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	
	nNpcIdx = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX);
	
	print("rentCarriage >> nNpcIdx: "..nNpcIdx);
	if nNpcIdx == 0 then
		createCarriage()
	else
		Say(npc_name.."Theo chiÕc ho¸n tiªu lÖnh ng­¬i cÇm trªn tay th× ng­¬i ®· cã mét xe råi, mét xe kh«ng ®ñ cho ng­¬i chë sao?",2,
			"Nh­ng ta lµm mÊt råi!/#createCarriage(1)",
			"Th«i vËy/nothing"
		)
	end

	return nNpcIdx;
end;

function createCarriage(nLost)
	
	local npc_name = format("<color=green>%s<color>: ",GetTargetNpcName());
	
	local nCurTime = GetTime();
	local nRentTime = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.RENT_TIME);
	
	local nMap,nPosX,nPosY = GetWorldPos();
	local tPos = {{nPosX,nPosY},}
	
	local nOldNpcIdx = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX);
	local nOldMap = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.RENT_MAP);
	
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nOldNpcIdx);
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	
	if nLost == 1 then 

		
		-- if nNpcIdx == 0 then -- This never be trigger because of the condition in the function rentCarriage()
			-- Talk(1,"",npc_name.."§å ngèc. Ng­¬i cã thuª xe bao giê ®©u t×m?!!")
			-- return 0;
		-- end
		
		if nMap == nNpcMapID and nDistance < MAX_DISTANCE then 
			Talk(2,"",npc_name.."Ch¼ng ph¶i xe cña ng­¬i ë ngay kia ®ã sao? M¾t ng­¬i cã vÊn ®Ò µ?",
			format("<color=green>%s<color>: §ïa tÝ chót cho vui! Lµm g× mµ c¨ng thÕ! :)",GetName()));
			return 0;
		end
		
		
		if nMap == nOldMap and nMap == nNpcMapID then 
			Talk(1,"",npc_name.."§óng lµ l­êi biÕng vµ ngu ngèc. Cã c¸i xe mµ còng lµm mÊt ®­îc. T×m kÜ l¹i trong thµnh xem. C¸i xe ngùa chø cã ph¶i c©y kim ®©u.")
			return 0;
		end
		
		if nMap ~= nOldMap then 
			local nPassedDays = floor(nCurTime/86400 - nRentTime/86400);
			if nPassedDays > 0 then 
				Talk(1,"",npc_name.."Hõm, theo ngµy th¸ng ghi trªn Ho¸n tiªu lÖnh, ng­¬i ®· qu¸ h¹n tr¶ xe nhiÒu ngµy råi. TÝnh ¨n quþt cña cña ng­¬i ta ®óng kh«ng?");
				return 0;
			else
				Talk(1,"",npc_name.."Sao ng­¬i bÊt cÈn vËy? Mµ th«i, thÊy bé d¹ng ®¸ng th­¬ng cña ng­¬i th× ta còng cho ng­¬i thuª xe míi. NÕu t×m thÊy xe cò th× mang tr¶ l¹i ng­êi ta.");
			end
		else
			if Pay(1000000) == 1 then 
				Talk(1,"",npc_name.."§­îc th«i. Tr­íc hÕt ng­¬i ph¶i ®Òn ta 100 l­îng vµng. Cßn tiÒn thuª míi th× chót tÝnh tiÕp.");
			else
				Talk(1,"",npc_name.."Ng­¬i lµm mÊt råi, ®· kh«ng cã tiÒn ®Òn bï cßn ®ßi thuª n÷a µ! Ta t¹m tha cho ng­¬i. Mau cuèn xÐo ®i chç kh¸c.")
				return 0;
			end
		end
	end
	
	if Pay(51000) ~= 1 then 
		Talk(1,"",npc_name.."Kh«ng cã tiÒn mµ còng ®ßi thuª xe sao? BiÕn ®i chç kh¸c cho ta lµm ¨n");
		return 0;
	end
	if GetItemCount(tHuanCheLing[1],tHuanCheLing[2],tHuanCheLing[3]) < 1 then 
		AddItem(tHuanCheLing[1],tHuanCheLing[2],tHuanCheLing[3],1);
	end
	Talk(1,"",npc_name.."NÕu ng­¬i nghe nh÷ng ®iÒu nµy råi th× ta vÉn ph¶i nãi thªm kh«ng thõa. "
		.."Ta sÏ lÊy ng­¬i <color=gold>5 l­îng vµng<color> ®Æt cäc vµ <color=white>10 b¹c<color>. "
		.."Khi nµo ng­¬i tr¶ xe, ta sÏ tr¶ l¹i ng­¬i tiÒn ®Æt cäc. "
		.."Cßn ®©y lµ <color=yellow>Ho¸n xa lÖnh<color>. Khi ng­¬i vÉy lÖnh bµi nµy, ngùa sÏ ®i theo ng­¬i. "
		.."Dïng nã ®Ó ®iÒu khiÓn xe cña ng­¬i.\n"
		.."Cã ®iÒu ng­¬i h·y l­u ý r»ng ta chØ cho thuª xe trong 24 giê. "
		.."Ng­¬i tr¶ chËm mét ngµy ta sÏ tÝnh thªm <color=gold>5 l­îng vµng<color>. Giíi h¹n lµ 300 l­îng vµng. Ng­¬i nhí tr¶ cho ®óng k× h¹n. "
		.."Ng­¬i kh«ng thÓ gi÷ m·i xe cña ta ®­îc, ta cßn ph¶i lµm ¨n n÷a chø!"
	)
	
	SetNpcLifeTime(nOldNpcIdx,0);
	nNpcIdx = CreateNpc("Xe vËn chuyÓn", "Xe chë ®å", GetWorldPos());
	SetNpcScript(nNpcIdx,"\\script\\mod\\carriage\\npc_xevanchuyen.lua");
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX,nNpcIdx);

	local nMap = GetWorldPos();
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.RENT_MAP,nMap);
	
	local nTime = GetTime()
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.RENT_TIME,nTime);
	
	if nNpcIdx ~= 0 then
	
		local nNpcID = GetNpcID(nNpcIdx);
		print("rentCarriage >> nNpcID",nNpcID);
		g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
		
		--SetNpcTempData(nNpcIdx, 1, nBCType)
	end
end;

function returnCarriage()
	local npc_name = format("<color=green>%s<color>: ",GetTargetNpcName());
	init(nStoreId);
	-- print(nStoreId,MAX_ITEM_COUNT,getn(TB_ITEMS));
	local nCurTime = GetTime();
	local nRentTime = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.RENT_TIME);
	
	local nMap,nPosX,nPosY = GetWorldPos();
	local tPos = {{nPosX,nPosY},}

	
	local nOldNpcIdx = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX);
	local nOldMap = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.RENT_MAP);
	
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nOldNpcIdx);
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	
	local nNpcIdx = nOldNpcIdx;
	
	if nNpcIdx == 0 then
		Talk(1,"",npc_name.."Ng­¬i cã thuª xe bao giê ®©u mµ tr¶!")
		return 0;
	end
	
	if nMap ~= nNpcMapID or nDistance > MAX_DISTANCE then 
		Talk(1,"",npc_name.."Xe cña ng­¬i ®©u? Lµm mÊt råi sao?!!");
		return 0;
	end
	
	if nMap == nNpcMapID and nMap ~= nOldMap then 
		Talk(1,"",npc_name.."ChiÕc xe ngùa nµy kh«ng ph¶i lo¹i xe ë thµnh thÞ nµy. Ng­¬i thuª ë ®©u th× mau nhí l¹i råi tr¶ cho ng­êi ta. §å ngèc!");
		return 0;
	end
	
	if MAX_ITEM_COUNT > 0 then 
		print(MAX_ITEM_COUNT);
		Talk(1,"",npc_name.."Ng­¬i bá quªn ®å trªn xe k×a! §i ®©u mµ véi vµng thÕ?!!")
		return 0;
	end
	-- print(nCurTime/86400,nRentTime/86400);
	local nPassedDays = floor(nCurTime/86400 - nRentTime/86400);
	-- print(nPassedDays);
	if nPassedDays > 0 then 
		local nPay = nPassedDays * 50000;
		if Pay(nPay) ~= 1 then 
			Talk(1,"",format("Ng­¬i tr¶ xe chËm trÔ %d ngµy. Ng­¬i ch­a mang ®ñ tiÒn ®ãng ph¹t råi.",nPassedDays));
			return 0;
		else
			Talk(1,"",format("Ng­¬i tr¶ xe chËm trÔ %d ngµy. Sè tiÒn ph¶i nép ph¹t lµ %d.",nPassedDays,nPay));
		end
	end
	
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX,0);
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.RENT_MAP,0);
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.RENT_TIME,0);
	SetNpcLifeTime(nNpcIdx,0);
	Earn(50000);
	DelItem(2,1,29004,1);
	Talk(1,"",npc_name.."TiÒn cäc cña ng­¬i ®©y!")
	

end;

function nothing() end;