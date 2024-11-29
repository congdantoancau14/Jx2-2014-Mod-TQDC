--¸£´ü
Include("\\script\\online_activites\\201505feedpet\\head.lua")

tFuDaiCfg = {
	{1,15, "ThÞt C¸ T­¬i", {2,1,30837,1},0},
	{1,15, "§ïi Heo Th¬m Ngon", {2,1,30838,1},0},
	{1,40, "Tó CÇu", {2,1,30839,1},0},
	{1,30, "Thøc ¡n HÕt H¹n", {2,1,30840,1},0},
}
function OnUse(nItemIdx)
	if check_player_condition()~= 1 then
		return
	end
	if gf_Judge_Room_Weight(2,100,"") ~= 1 then 
		return 0;
	end
	local nUsedCnt = get_task(g_tFeedPet.nTaskIdx_FuDaiCount)
	if  nUsedCnt >= g_tFeedPet.nMaxUseFuDaiOneDay then
		Talk(1,"",format("Sè lÇn sö dông cña h«m nay ®· ®¹t giíi h¹n!"))
		return
	end
	if DelItemByIndex(nItemIdx, 1)==1 then
		gf_EventGiveRandAward(tFuDaiCfg,100,1, "feedpet201505", "feedpet201505")
		set_task(g_tFeedPet.nTaskIdx_FuDaiCount, nUsedCnt+1)
	end
end