--=============================================
-- Created by TuanNA5
--=============================================

Include("\\script\\lib\\globalfunctions.lua");

tb_GoldBoss_Award = {
	{"Tu Ch�n Y�u Quy�t", 281, {2, 0, 554, 1}, 15*24*3600},
	{"Ti�u Nh�n S�m", 300, {2, 0, 552, 1}, 15*24*3600},
	{"Th�n N�ng ��n", 300, {2, 1, 343, 1}, 15*24*3600},
	{"Tr�i Tim Ph� Th�y", 300, {2, 1, 30126, 1}, 0},
	{"Nh�n S�m V�n N�m", 19, {2, 1, 30071, 1}, 0},
}

-- tb_GoldBoss_Award = {
	-- {"C� Linh Th�ch", 100, {2,1,30368,2}, 0},
	-- {"C� Linh Ng�c", 100, {2,1,30369,2}, 0},
	-- {"Hu�n Ch��ng Anh H�ng", 100, {2,1,30499,2}, 0},
	-- {"Thi�n Cang L�nh", 5, {2,95,204,1}, 0},
	-- {"Thi�n M�n Kim L�nh", 5, {2,1,30370,1}, 0},
	-- {"Th�i Nh�t L�nh", 5, {2,1,30685,10}, 0},
	-- {"Uy H� Tinh Hoa", 5, {2,1,31325,5}, 0},
	-- {"Thanh Long Tinh Hoa", 5, {2,1,31224,5}, 0},
	-- {"H�a Ph�ng Tinh Hoa", 5, {2,1,30770,5}, 0},
-- }

function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex, 30);
	ModifyExp(5000000)
	
	if gf_Judge_Room_Weight(1, 100, " ") == 0 then
		Msg2Player("H�nh trang qu� ��y, kh�ng th� nh�n th��ng!");
		return 0;
	end
	AddItem(2,1,1157,1) -- ��u h�n
	
	local nRand = GetRandByID(tb_GoldBoss_Award);
	local nRet, nItemIdx = gf_AddItemEx2(tb_GoldBoss_Award[nRand][3],tb_GoldBoss_Award[nRand][1],"Hoat dong Tet Nguyen Dan","gi�t gia c�m ho�ng kim",tb_GoldBoss_Award[nRand][4])
end