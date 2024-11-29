--ÑÝÎäÁîÅÆNPC
Include("\\script\\lib\\define.lua")
Include("\\script\\lib\\globalfunctions.lua")

--TASKID_SW_YWLP_WAIT_TIME
function OnUse(nItemIdx)
	
end

function get_ywlp_fail()
	local nNpcIdx = GetTask(TASKID_SW_YWLP_IDX);
	AddUnitStates(nNpcIdx, 5, -GetUnitCurStates(nNpcIdx,5)); 
end

function get_ywlp_suc()
	local nNpcIdx = GetTask(TASKID_SW_YWLP_IDX);
	local nCurLife = GetLife();
	local nMaxLife = GetMaxLife();
	local nCount = 1;
	local nValue = nCurLife/nMaxLife;
	if nCurLife == nMaxLife  then
		nCount = 5;
	elseif nValue  >= 0.8 then
		nCount = 4;
	elseif nValue >= 0.6 then
		nCount = 3;
	elseif nValue >= 0.4 then
		nCount = 2;
	end
	if gf_Judge_Room_Weight(nCount,10,"DiÔn Vâ LÖnh Bµi") ~= 1 then
		AddUnitStates(nNpcIdx, 5, -GetUnitCurStates(nNpcIdx,5)); 
		return 0;
	end
	gf_AddItemEx({2,96,121,nCount,4},"DiÔn Vâ LÖnh Bµi");
	AddUnitStates(nNpcIdx, 5, -GetUnitCurStates(nNpcIdx,5));
	Restore();
	NewWorld(5077,1574,3297);
end

function main()
	local nMap,nX,nY = GetWorldPos();
	local nNpcMap, nNpcX,nNpcY = GetNpcWorldPos(GetTargetNpc());
	if nMap ~= nNpcMap  then return 0;end
--	if  abs(nX - nNpcX) > 4 or abs(nY - nNpcY) > 4 then
--		Talk(1,"","ÁîÅÆ½üÔÚåë³ß£¬ÍùÇ°Ò»²½¼´¿ÉÊ°È¡");
--		return 0;
--	end 
	if gf_Judge_Room_Weight(1,10,"DiÔn Vâ LÖnh Bµi") ~= 1 then
		return 0;
	end
	local nNpcIdx = GetTargetNpc();
	if BigGetItemCount(2,96,121) >=  10 then
		Talk(1,"","Ng­¬i ®· nhËn ®ñ lÖnh bµi råi, mau mang ®i cho Tr¹i B¾c Song ¦ng Ngu MÆc S¬n xem thö!");
		return 0;
	end
	if GetTime() - GetUnitCurStates(nNpcIdx, 5) <= 2 then 
		Talk(1,"","DiÔn Vâ LÖnh Bµi ®· bÞ ng­êi kh¸c nhÆt råi.");
		return 0;
	end
	SetTask(TASKID_SW_YWLP_IDX,nNpcIdx);
	AddUnitStates(nNpcIdx, 5, GetTime() - GetUnitCurStates(nNpcIdx,5));
	DoWait(43,44,2); -- ¶ÁÌõÁË~~
end

function task935_do_wait()
	DoWait(45,46,5);
end


function task935_do_wait_suc()
	SetTask(TASKID_SW_TASK935_FINISH,1);
end

function task935_do_wait_fail()
end

function task929_action()
	local nValue = GetTask(TASKID_SW_PEACH_SEED_NUM);
	if nValue ~= 1 then
		SetTask(TASKID_SW_PEACH_SEED_NUM,GetTime())
	end
end

function task929_condition()
	if GetTask(TASKID_SW_PEACH_SEED_NUM) ~= 1 then
		Talk(1,"","§¹o Gia tu hµnh, kÞ nhÊt lµ l­êi biÕng hoÆc lõa dèi, b»ng kh«ng sÏ lµm h­ h¹i tÝnh c¸ch! Ta niÖm t×nh ng­¬i ph¹m lçi lÇn ®Çu, h·y lµm l¹i nµo!");
	end
end