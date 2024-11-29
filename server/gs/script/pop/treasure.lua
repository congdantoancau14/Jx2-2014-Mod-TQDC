--ÉùÍû ²Ø±¦Í¼
Include("\\script\\missions\\yp\\yp_head.lua")

TASK_ID_TREASURE = 3439;	--ÉùÍû²Ø±¦Í¼

tTreasureTable = {
	{202,1531,2949},
	{202,1463,2836},
	{202,1402,2833},
	{202,1359,2939},
	{202,1371,3054},
	{202,1399,3171},
	{202,1566,3082},
	{202,1575,2884},
	{202,1471,2736},
}

function OnUse(nItemIndex)
	if GetTask(TASK_ID_TREASURE) == 0 then
		local nRand = random(1, getn(tTreasureTable));
		SetTask(TASK_ID_TREASURE, nRand);
	end

	local nIdx = GetTask(TASK_ID_TREASURE);
	local tSet = tTreasureTable[nIdx]
	local nMapID, nMapX, nMapY = GetWorldPos();

	--ÍÚ±¦³É¹¦
	if nMapID == tSet[1] and nMapX > tSet[2] - 50 and nMapX < tSet[2] + 50 and nMapY > tSet[3] - 50 and nMapY < tSet[3] + 50 then
		if gf_Judge_Room_Weight(1, 0, "") ~= 1 then
			return
		end

		gf_AddItemEx({2, 96, 35, 1}, "Kho B¸u ThÇn BÝ");

		Talk(1, "", "H×nh nh­ ng­¬i ®µo ®­îc vËt g× ®ã, theo nh­ Tµng B¶o §å th× ®©y ch¾c lµ khi b¸u råi, mang vÒ cho Lý Gia Thµnh xem thö.");

		DelItem(2, 96, 34, 1);
		
		SetTask(TASK_ID_TREASURE, 0);
		return
	end

	--µØÍ¼´íÎó
	if nMapID ~= tTreasureTable[nIdx][1] then
		Talk(1, "", "Ng­¬i ®µo kho b¸u t¹i chç, nh­ng kh«ng t×m ®­îc g×. Theo nh­ Tµng B¶o §å th× kho b¸u cßn c¸ch rÊt xa, h·y ®Õn H¹nh Hoa Th«n t×m thö.");
		return
	end

	--¶«±ß
	if tSet[2] - nMapX > 50 and abs(tSet[2] - nMapX) > abs(tSet[3] - nMapY) then
		Talk(1, "", "Ng­¬i ®µo kho b¸u t¹i chç, nh­ng kh«ng t×m ®­îc g×. Theo nh­ Tµng B¶o §å th× kho b¸u c¸ch ®©y kh«ng xa vÒ phÝa ®«ng.");
		return
	end

	--Î÷±ß
	if nMapX - tSet[2] > 50 and abs(tSet[2] - nMapX) > abs(tSet[3] - nMapY) then
		Talk(1, "", "Ng­¬i ®µo kho b¸u t¹i chç, nh­ng kh«ng t×m ®­îc g×. Theo nh­ Tµng B¶o §å th× kho b¸u c¸ch ®©y kh«ng xa vÒ phÝa t©y.");
		return
	end

	--±±±ß
	if nMapY - tSet[3] > 50 and abs(tSet[3] - nMapY) > abs(tSet[2] - nMapX) then
		Talk(1, "", "Ng­¬i ®µo kho b¸u t¹i chç, nh­ng kh«ng t×m ®­îc g×. Theo nh­ Tµng B¶o §å th× kho b¸u c¸ch ®©y kh«ng xa vÒ phÝa b¾c.");
		return
	end

	--Î÷±ß
	if tSet[3] - nMapY > 50 and abs(tSet[3] - nMapY) > abs(tSet[2] - nMapX) then
		Talk(1, "", "Ng­¬i ®µo kho b¸u t¹i chç, nh­ng kh«ng t×m ®­îc g×. Theo nh­ Tµng B¶o §å th× kho b¸u c¸ch ®©y kh«ng xa vÒ phÝa nam.");
		return
	end
end
