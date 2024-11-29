
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\npccmdhead.lua");

-- Include("\\script\\online_activites\\zodiac_lottery\\trigger.lua");
TASK_NPC_INDEX = 1234;


function runTest()

end;



-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

function old()
	--createBiaoChe();
	
	--local npc = GetTargetNpc();
	--move()
	--OnTimer();
	-- SummonNpc("pet_lanxiongmao","GÊu l­ng xanh");
	
	-- addExpireItem()
	-- local r,i=AddItem(2,1,3,1);SetItemExpireTime(i,3600*24*7);
end;


function addExpireItem()
	
	local nAdd,nIdx = 0,0;
	local nYears,nMonths,nDays = GmTime(GetTime()+3600*24*3);

	nAdd,nIdx = AddItem(2,0,556,1) -- Th? th?n ph?
	Msg2Player(nAdd);
	gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
	-- nAdd,nIdx = AddItem(2,0,141,1) -- Tiau ki?p t?n
	-- gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
end;


function getReward()
	Earn(350000);
	local nRand = random(9,12);
	while nRand == 10 do nRand = random(9,12); end
	AddItem(0,105,nRand,1,1,6,101);
	DelItem(2,1,XXXXX,1);
end;

function move()
	local m,x,y = GetWorldPos();
	local pos = {{x,y},}
	local nNpcIndex = GetTask(TASK_NPC_INDEX);
	local nCurTime = GetTime();
	
	moveBiaoChe(nNpcIndex,pos);
end

function sleep(n)  -- seconds
  local t0 = clock()
  while clock() - t0 <= n do end
end

function moveBiaoChe(nNpcIndex,pos)
	g_NpcAI:setWayPoint(nNpcIndex, pos);
end;

function createBiaoChe()
	local nNpcIndex = CreateNpc("Tiªu xa 1","Tiªu xa",GetWorldPos());
	SetTask(TASK_NPC_INDEX, nNpcIndex);
	if nNpcIndex ~= 0 then
		
		local nindex = Getindex(nNpcIndex);
		
		local nCamp = "camp_player";
	
		SetCampToNpc(nNpcIndex,nCamp);
		
		SetNpcDeathScript(nNpcIndex,"\\script\\missions\\yp\\biaoche_npc.lua");
		SetNpcRemoveScript(nNpcIndex,"\\script\\missions\\yp\\biaoche_npc.lua");
	
		g_NpcAI:setAI(nNpcIndex,AT_SM_MOVE);
		
		
		
		--SetNpcTempData(nNpcIndex, 1, nBCType)
	end
	
	
end;


function _master_transfer(szRoleName)
	local tInfo = GetMPBaseInfo()
	if tInfo["prentice"] == nil then
		Say(szRoleName.." kh«ng ph¶i ®Ö tö b¹n, kh«ng thÓ truyÒn tèng", 0)
		return
	end
	local isExist = 0
	for index, value in tInfo["prentice"] do
		if value == szRoleName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then
		Say(szRoleName.." kh«ng ph¶i ®Ö tö b¹n, kh«ng thÓ truyÒn tèng", 0)
		return
	end
	
	if IsStalling() ~= 0 then
		Say("Trong lóc bµy b¸n kh«ng thÓ truyÒn tèng", 0)
		return
	end
	
	if IsReading() ~= 0 then
		Say("Trong qu¸ tr×nh MËt TÞch kh«ng thÓ truyÒn tèng", 0)
		return
	end
	
	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--Õ½¶·×´Ì¬ÏÂPKÄ£Ê½²»¿ÉÒÔÊ¹ÓÃ
		Say("ë d¹ng PK ngoµi thµnh kh«ng thÓ ®­a ®i.", 0)
		return
	end

	GetPlayerPosition(szRoleName, "\\script\\master_prentice\\some_op.lua", "_tansfer_yes", 0)
end

function goi_tieu()

local ten = format("%s - Tiau Xa Ho¦Ìng Gia",GetName());
local vantieu = SummonNpc("Tiªu Xa 5", ten)
ChangeNpcToFight(vantieu, 3,0);

end


function nothing()
end;