--±¦²Ø½±Àø
Include("\\script\\missions\\yp\\award.lua")

tItemInfo = {
	{"Kho B¸u Tr©n PhÈm",	2,95,931},
	{"Kho B¸u T× H­u",	2,95,932},
	{"Kho B¸u Di VËt",	2,95,933},
	{"Kho B¸u Kinh ThÕ",	2,95,934},
}

function OnUse(nItemIdx)
	local g,d,p = GetItemInfoByIndex(nItemIdx);
	local nType = 0;
	for i = 1,getn(tItemInfo) do
		if g == tItemInfo[i][2] and d == tItemInfo[i][3] and p == tItemInfo[i][4] then
			nType = i;
			break;
		end
	end
	if nType == 0 then
		return 0;
	end
	
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then 
		Talk(1,"","CÇn ph¶i gia nhËp thÕ lùc míi ®­îc dïng vËt phÈm nµy!");
		return 0;
	end
	if gf_Judge_Room_Weight(3,100,"") ~= 1 then
		return 0;
	end	
	if DelItem(g,d,p,1) == 1 then
		yp_aw_giveAward_19(nType);
	end
end
