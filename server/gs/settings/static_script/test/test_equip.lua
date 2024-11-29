
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\npccmdhead.lua");

-- Include("\\script\\online_activites\\zodiac_lottery\\trigger.lua");
TASK_NPC_INDEX = 1234;

CallBack_Script = "\\test.lua";

function runTest()
		
		
end;

function LSB_Item_Roll(tbItem,targetNpc)
	if type(tbItem) ~= "table" then return end
	local diceId = ApplyItemDice(1, 100, 60, CallBack_Script, "LSB_CallBack_Roll", GetTeamSize(),targetNpc);
	AddDiceItemInfo(diceId, gf_UnPack(tbItem))
	local nPlayerOld = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if IsPlayerDeath() == 0 then
			RollItem(diceId);
		end
	end
	PlayerIndex = nPlayerOld;
end

function old()
	AddGlobalNews("opghfidopshgio dfisghifodpgh9iosfpg",1);
end;

function test_equip()
-- 检查物品限制
	local tEquipInfo		= {};
	local nEquipPos			= 0;
	local nEquipIDX			= 0;
	local nEquipEnhance		= 0;
	local nEquipEnhanceFail = 0;
	local nEquipLingqi		= 0;
	local nEquipDing5		= 0;
	local nEquipDing7		= 0;
	local nEquipDing10		= 0;
	
	local nFreeRoom			= GetFreeItemRoom();
	local nFreeWeight		= GetMaxItemWeight() - GetCurItemWeight();
	
	tEquipInfo = {0,105,198};

	local tAttrSave = nil

		nEquipPos						= 10;
		nEquipIDX						= GetPlayerEquipIndex(nEquipPos);
		local szItemName				= GetItemName(tEquipInfo[1], tEquipInfo[2], tEquipInfo[3]);
		local nEquipG, nEquipD, nEquipP	= GetPlayerEquipInfo(nEquipPos);
		print(nEquipG, nEquipD, nEquipP)
		if nEquipG ~= tEquipInfo[1] or nEquipD ~= tEquipInfo[2] or nEquipP ~= tEquipInfo[3] then
			Talk(1, "", format("H穣 mang [%s] tr猲 ngi. N誹 l?v藅 trang s鴆 h穣 t t筰 ?trang s鴆 th?nh蕋.", szItemName));
			return 0
		end
		if tEquipInfo[5] and tEquipInfo[5] > 0 and  GetItemLevel(nEquipIDX) < tEquipInfo[5] then
			Talk(1, "", format("N﹏g c蕄 c莕 %d c蕄 [%s]", tEquipInfo[5], szItemName));
			return 0
		end
		
		

		tremove(tExchangeInfo.CostItem, 1);
		tExchangeInfo.CostItem.n = nil;

end;