--±¦²Ø½±Àø
Include("\\script\\missions\\yp\\award.lua")

tItemInfo = {
	{"Kho B¸u Minh M«n",	2,97,33},
	{"Kho B¸u Thiªn Long Tù",	2,97,34},
	{"Kho B¸u Quúnh KÕt",	2,97,35},
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
	if gf_Judge_Room_Weight(1,100,"") ~= 1 then
		return 0;
	end	
	if DelItem(g,d,p,1) == 1 then
		yp_aw_giveAward_20(nType);
	end
end
