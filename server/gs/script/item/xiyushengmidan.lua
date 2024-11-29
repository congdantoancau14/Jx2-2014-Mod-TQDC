Include("\\script\\lib\\globalfunctions.lua");
--Include("\\script\\task\\global_task\\gtask_head.lua")

function OnUse(nItem)
	if gf_CheckVeitPetTaskFinish() ~= 1 then
		Say(format("%s ch­a hoµn thµnh nhiÖm vô phôc sinh ®ång hµnh, t¹m thêi kh«ng thÓ më!", gf_GetPlayerSexName()), 0);
		return 0;
	end
	if GetPetCount() >= 5 then
		Msg2Player("Sè l­îng b¹n ®ång hµnh hiÖn t¹i v­ît qu¸ 5");
		return 0;
	end
	if DelItemByIndex(nItem, 1)==1 then
		AddPet(37)
		Talk(1,"","Chóc mõng b¹n nhËn ®­îc 1 thó c­ng TiÓu Ho¸n Hïng")
	end
	
--	local nRet = CustomAwardSelectOne("dijidan")
--	if nRet > 0 then
--		if DelItemByIndex(nItem, 1) == 1 then
--			CustomAwardGiveOne(nRet);
--		end
--	end
end