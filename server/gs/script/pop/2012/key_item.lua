--»ú¹ØÔ¿³×
Include("\\script\\lib\\define.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

nItemId1 = 2;
nItemId2 = 96;
tItem = {
	[137] = {5077,1797,3211,"§«ng b¾c",1},
	[140] = {5077,1687,3545,"T©y nam",2},
	[138] = {5077,1626,3177,"T©y b¾c",3},
	[139] = {5077,1876,3563,"§«ng nam",4},
	}
tInfo ={
	{936,TASKID_SW_USE_KEY,},
	{1012,TASKID_SW_USE_KEY},
	}
tNpcInfo = {
		["Thiªn ¢m C¬ Quan TrËn Ph¸p (T©y)"]=1,
		["Thiªn ¢m C¬ Quan TrËn Ph¸p (Nam)"]=2,
		["Thiªn ¢m C¬ Quan TrËn Ph¸p (B¾c)"]=3,
		["Thiªn ¢m C¬ Quan TrËn Ph¸p (§«ng)"]=4,
	}
function OnUse(nItemIdx)
	local g,d,p = GetItemInfoByIndex(nItemIdx)
	if g ~= nItemId1 or d ~= nItemId2  or not tItem[p] then
		return 0;
	end
	local nTask = 0;
	for i = 1,getn(tInfo) do
		if tGtTask:check_cur_task(tInfo[i][1]) == 1 then
			nTask = tInfo[i][2];
			break;
		end
	end
	if nTask == 0 then
		return 0;
	end
	local nMapId,nX,nY = GetWorldPos();
	if nMapId ~= tItem[p][1] or abs(nX - tItem[p][2]) >= 40 or abs(nY - tItem[p][3]) >= 40 then
		Talk(1,"",tItem[p][4] .. "Ch×a Khãa C¬ Quan: H·y ®Õn C¬ Quan TrËn Ph¸p t­¬ng øng ®Ó dïng ch×a khãa.");
		return 0;
	end	
	if abs(nX - tItem[p][2]) <= 5 and abs(nY - tItem[p][3]) <= 5 then
		Talk(1,"",tItem[p][4] .. "Ch×a Khãa C¬ Quan: Ng­¬i ®· ®ãng thµnh c«ng trËn ph¸p phßng thñ phÝa t©y cña Thiªn ¢m Gi¸o.");
	else
		Talk(1,"",tItem[p][4].. "C¬ Quan TrËn Ph¸p: H·y ®Õn gÇn c¬ quan h¬n n÷a.");
		return 0;
	end
	gf_SetTaskBit(nTask,tItem[p][5],1);
end


function OnDeath(nNpcIdx)
	local sName = GetNpcName(nNpcIdx);
	if tNpcInfo[sName] == nil then return 0; end
	local nTask = 0;
	for i = 1,getn(tInfo) do
		if tGtTask:check_cur_task(tInfo[i][1]) == 1 then
			nTask = tInfo[i][2];
			break;
		end
	end
	if nTask == 0 then
		return 0;
	end
	local nBit = tNpcInfo[sName];
	gf_SetTaskBit(nTask,nBit,1);
end
