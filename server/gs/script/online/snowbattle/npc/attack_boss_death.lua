Include("\\script\\online\\snowbattle\\head.lua");
--ÌìÉ½Ñ©Ñı
function OnDeath(npcIdx)
	ModifyExp(80000000);
	AwardGenuineQi(5000);
	gf_AddItemEx2({2,1,30747,100}, "Hép Trang Trİ Gi¸ng Sinh", "§¸nh trËn tuyÕt", "Thiªn S¬n TuyÕt Yªu", 0, 1)
	gf_AddItemEx2({2,1,30683,50}, "L«i Viªm Th¹ch", "§¸nh trËn tuyÕt", "TiÓu TuyÕt Qu¸i", 0, 1)
	SetNpcLifeTime(npcIdx, 0);
	SB_OnBossDied();
end