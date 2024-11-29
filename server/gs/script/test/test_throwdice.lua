--¨ª-¡À|??2
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\taiyi\\tyfunctions.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

function main()
	local tAward = {
		{5, {"T? Linh Quy Nguyan ¡ì?n",{2, 1, 30352, 1, 4}}},
		{10, {"B?i Nguyan ¡ì?n",{2,	1, 30351, 1, 4}}},
		{10, {"Truy¨°n C?ng ¡ì?n",{2,	1, 30313, 1, 4}}},
		{5, {"M?nh Tu Ch?n Y?u Quy?t",{2,	1, 30315, 1, 4}}},
		{20, {"Thi?t Tinh c¨ºp 1",{2,	1, 30533, 1, 4}}},
		{15, {"Thi?t Tinh c¨ºp 2",{2,	1, 30534, 1, 4}}},
		{15, {"Thi?t Tinh c¨ºp 3",{2,	1, 30535, 1, 4}}},
		{5, {"Viam Linh Ti",{2,	1,	30671, 1}}},
		{5, {"Da Ma Lang",{2,	1,	30672, 1}}},
		{5, {"Da ¡ìTa Long",{2,	1,	30673, 1}}},
		{5, {"V¨¢ G-?m C¨°", {2,	1,	30694, 1}}},
	}
	local tItem = gf_RandRate(tAward)[2];
	gf_ThrowDice(tItem[2], nil, nil, nil, nil, GetTargetNpc());
	SetNpcLifeTime(GetTargetNpc(), 0);
	SetNpcScript(GetTargetNpc(), "");	
	if tItem[1] == "Viam Linh Ti" then
		AddRuntimeStat(18, 44, 0, 1);
	elseif tItem[1] == "Da Ma Lang" then
		AddRuntimeStat(18, 45, 0, 1);
	elseif tItem[1] == "Da ¡ìTa Long" then
		AddRuntimeStat(18, 46, 0, 1);
	end
	
	gf_TeamOperateEX(vaf_award_api, "tTYTTongBox")
end