Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");
function OnUse()

CampOne_Type = "camp_player"; 
CampTwo_Type = "camp_enemy"; 

local nNpcIndex = 0
local nMap,nX,nY = GetWorldPos();

		SetCampToPlayer(CampOne_Type);

		for i = 1,4 do
		nNpcIndex = CreateNpc(tPositionFo[i][1],tPositionFo[i][2],  nMap, nX + random(1,4), nY + random(1,4));
		SetCampToNpc(nNpcIndex,CampOne_Type);
--		SetCampToNpc(nNpcIndex,CampTwo_Type);
		end

end

tPositionFo = {
	{"Nga Mi tiÓu s­ tû 1","Nga Mi tiÓu s­ tû ",1907,3367,1645,3666},
	{"Nga Mi tiÓu s­ tû 2","Nga Mi tiÓu s­ tû ",1913,3367,1652,3665},
	{"Nga Mi tiÓu s­ tû 3","Nga Mi tiÓu s­ tû ",1908,3390,1652,3689},
	{"Nga Mi tiÓu s­ tû 4","Nga Mi tiÓu s­ tû ",1914,3389,1642,3687}
}
