Include("\\script\\online\\snowbattle\\head.lua");
--��ɽѩ��
function OnDeath(npcIdx)
	ModifyExp(80000000);
	AwardGenuineQi(5000);
	gf_AddItemEx2({2,1,30747,100}, "H�p Trang Tr� Gi�ng Sinh", "��nh tr�n tuy�t", "Thi�n S�n Tuy�t Y�u", 0, 1)
	gf_AddItemEx2({2,1,30683,50}, "L�i Vi�m Th�ch", "��nh tr�n tuy�t", "Ti�u Tuy�t Qu�i", 0, 1)
	SetNpcLifeTime(npcIdx, 0);
	SB_OnBossDied();
end