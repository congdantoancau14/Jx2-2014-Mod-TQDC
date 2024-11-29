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
		Say(npc_name.."Theo chiÕc Ho¸n xa lÖnh cña ng­¬i th× ng­¬i ®· cã mét xe råi, mét xe kh«ng ®ñ cho ng­¬i chë sao?",2,
			"Nh­ng ta lµm mÊt råi!/#createCarriage(1)",
			"Th«i vËy/nothing"
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
			local nPassedDays = get_rent_carriage_days();
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
	local nNpcIdx = CreateNpc("Xe vËn chuyÓn", "Xe chë ®å", GetWorldPos());
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
		Talk(1,"",npc_name.."Ng­¬i cã thuª xe bao giê ®©u mµ tr¶!")
		return 0;
	end
	
	if nMap ~= nNpcMapID or nDistance > MAX_DISTANCE then 
		Say(npc_name.."Xe cña ng­¬i ®©u? Lµm mÊt råi sao?!!",2,
			"Ta lì lµm mÊt Ho¸n Xa lÖnh råi/lost_lingpai",
			"Kh«ng, chê mét l¸t ®Ó ta ®i rong tíi ®©y!/nothing"
		);
		return 0;
	end
	print("nOldMap",nOldMap);
	local nPayHelpReturn = 0;
	if nMap == nNpcMapID and nMap ~= nOldMap then
		if nForce ~= 1 then
			Say(npc_name.."ChiÕc xe ngùa nµy kh«ng ph¶i lo¹i xe ë thµnh thÞ nµy. Ng­¬i thuª ë ®©u th× mau nhí l¹i råi tr¶ cho ng­êi ta. §å ngèc!",2,
				"Ta thùc sù kh«ng nhí ë ®©u, nhê ng­¬i gióp tr¶ l¹i/#returnCarriage(1)",
				"Ta chØ ®·ng trÝ chót th«i, sao nÆng lêi qu¸ vËy?!!/nothing"
			);
			return 0;
		else
			Talk(1,"",npc_name.."Th«i ®­îc, ta sÏ tr¶ xe gióp ng­¬i. Chi phÝ tr¶ xe t¨ng thªm <color=gold>10 l­îng vµng<color>. Cßn nh÷ng kho¶n tr¶ trÔ ch­a tÝnh.");
			nPayHelpReturn = 100000;
		end
	end
	
	if MAX_ITEM_COUNT > 0 then 
		print(MAX_ITEM_COUNT);
		Talk(1,"",npc_name.."Ng­¬i bá quªn ®å trªn xe k×a! §i ®©u mµ véi vµng thÕ?!!")
		return 0;
	end
	local nPassedDays = get_rent_carriage_days();
	if nPassedDays > 0 then 
		local nPay = nPassedDays * 50000;
		if nPayHelpReturn ~= 0 then 
			nPay = nPay + nPayHelpReturn;
		end
		if Pay(nPay) ~= 1 then 
			Talk(1,"",format(npc_name.."Ng­¬i tr¶ xe chËm trÔ [<color=red>%d<color>] ngµy. Ng­¬i ch­a mang ®ñ tiÒn ®ãng ph¹t råi.",nPassedDays));
			return 0;
		else
			Talk(1,"",format(npc_name.."Ng­¬i tr¶ xe chËm trÔ %d ngµy. Sè tiÒn ph¶i nép ph¹t lµ %d ®ång.",nPassedDays,nPay));
		end
	end
	
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX,0);
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.RENT_MAP,0);
	BIAOCHE_TASKGROUP:SetTask(BIAOCHE_TASKGROUP.RENT_TIME,0);
	SetNpcLifeTime(nNpcIdx,0);
	Earn(50000);
	DelItem(tHuanCheLing[1],tHuanCheLing[2],tHuanCheLing[3],1);
	Talk(1,"",npc_name.."TiÒn cäc cña ngµi ®©y! LÇn sau l¹i tíi nhÐ! ;)")
	
	return 1;
end;

function lost_lingpai()
	Talk(1,"",npc_name.."Giang hå nhiÒu chuyÖn hçn lo¹n, lµm mÊt vËt nä vËt kia còng lµ chuyÖn dÔ hiÓu. Ta cã thÓ th«ng c¶m cho ng­¬i. Nh­ng phÝ cÊp l¹i lµ <color=gray>10 l­îng b¹c<color>");
	if Pay(1000) ~= 1 then 
		Talk(1,"",npc_name.."Ng­¬i mÊt xe råi mÊt c¶ tiÒn sao? GÆp c­íp ch¨ng? Khèn n¹n nhØ!")
		return 0;
	else
		Talk(1,"",npc_name.."Cña ng­¬i ®©y, nhí gi÷ cÈn thËn nhÐ!")
		AddItem(tHuanCheLing[1],tHuanCheLing[2],tHuanCheLing[3],1);
	end
end;

function nothing() end;