
nNpcIdx = 0;
-- Random vßng th¸i h­ theo tû lÖ thiÕt kÕ
function RandThaiHuRing(nQty)	
	local tThaiHuRing = {
		[1] = {[1] = {item={{gdp={2,1,469,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - Cµn"}}}, nRate = 35},
		[2] = {[1] = {item={{gdp={2,1,470,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - Kh«n"}}}, nRate = 10},
		[3] = {[1] = {item={{gdp={2,1,471,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - Kh¶m"}}}, nRate = 10},
		[4] = {[1] = {item={{gdp={2,1,472,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - §oµi"}}}, nRate = 10},
		[5] = {[1] = {item={{gdp={2,1,473,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - Ly"}}}, nRate = 20},
		[6] = {[1] = {item={{gdp={2,1,474,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - ChÊn"}}}, nRate = 8},
		[7] = {[1] = {item={{gdp={2,1,475,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - CÊn"}}}, nRate = 6},
		[8] = {[1] = {item={{gdp={2,1,476,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - Tèn"}}}, nRate = 1},
	} 
	for i = 1, nQty do
		AwardByRate(tThaiHuRing)
	end
end

function OnDeath(nNpcIndex)
--print("npc_death.lua>>OnDeath::called! nNpcIndex:",nNpcIndex)
	main(nNpcIndex)
end;

function main(nNpcIndex)
--print("npc_death.lua>>main::called! nNpcIndex:",nNpcIndex)
	nNpcIdx = nNpcIndex;
	local nRand = random(10);
	print("nRand",nRand)
	if nRand == 1 then
		RandThaiHuRing(1)
	end
end;

function AwardByRate(tbItemSet)
	if tbItemSet == nil then
		return 0
	end
	local nRateTotal = 10000000
	local nRandom = random(1, nRateTotal)
	local nStep=0
	for i=1, getn(tbItemSet) do
		nStep = nStep + floor(tbItemSet[i]["nRate"] * nRateTotal/100);
		print(nRandom,nStep)
		if(nRandom <= nStep) then
			Award(tbItemSet[i])
			return 1;
		end
	end
end

function Award(tbAwardList)
--	local nResult = 0
print("Award",tbAwardList["item"],getn(tbAwardList["item"]))
	-- Award Item
	if type(tbAwardList["item"])=="table" then
		local tbItemSet = tbAwardList["item"]
		for i=1,getn(tbItemSet) do
			local tbItem = tbItemSet[i]["gdp"]
			-- Add nhieu item co han su dung hoac co dinh hon
			
				-- Add nhieu item xep chong
				
			--nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], tbItem[4])
			DropItem(tbItem[1], tbItem[2], tbItem[3],GetNpcWorldPos(nNpcIdx))
print("Award>>DropItem",tbItem[1], tbItem[2], tbItem[3])
		end
	end
	
-- Award Function
	if type(tbAwardList["fn"])=="string" then
		dostring(tbAwardList["fn"])
	end
	return 1
end
