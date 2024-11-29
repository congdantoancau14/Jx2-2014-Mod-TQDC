--=============================================
-- Created by TuanNA5
--=============================================

Include("\\script\\lib\\globalfunctions.lua");

tb_GoldBoss_Award = {
	{"Tu Ch©n YÕu QuyÕt", 281, {2, 0, 554, 1}, 15*24*3600},
	{"TiÓu Nh©n S©m", 300, {2, 0, 552, 1}, 15*24*3600},
	{"ThÇn N«ng §¬n", 300, {2, 1, 343, 1}, 15*24*3600},
	{"Tr¸i Tim Phï Thñy", 300, {2, 1, 30126, 1}, 0},
	{"Nh©n S©m V¹n N¨m", 19, {2, 1, 30071, 1}, 0},
}

-- tb_GoldBoss_Award = {
	-- {"Cæ Linh Th¹ch", 100, {2,1,30368,2}, 0},
	-- {"Cæ Linh Ngäc", 100, {2,1,30369,2}, 0},
	-- {"Hu©n Ch­¬ng Anh Hïng", 100, {2,1,30499,2}, 0},
	-- {"Thiªn Cang LÖnh", 5, {2,95,204,1}, 0},
	-- {"Thiªn M«n Kim LÖnh", 5, {2,1,30370,1}, 0},
	-- {"Th¸i NhÊt LÖnh", 5, {2,1,30685,10}, 0},
	-- {"Uy Hæ Tinh Hoa", 5, {2,1,31325,5}, 0},
	-- {"Thanh Long Tinh Hoa", 5, {2,1,31224,5}, 0},
	-- {"Háa Phông Tinh Hoa", 5, {2,1,30770,5}, 0},
-- }

function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex, 30);
	ModifyExp(5000000)
	
	if gf_Judge_Room_Weight(1, 100, " ") == 0 then
		Msg2Player("Hµnh trang qu¸ ®Çy, kh«ng thÓ nhËn th­ëng!");
		return 0;
	end
	AddItem(2,1,1157,1) -- §Êu hån
	
	local nRand = GetRandByID(tb_GoldBoss_Award);
	local nRet, nItemIdx = gf_AddItemEx2(tb_GoldBoss_Award[nRand][3],tb_GoldBoss_Award[nRand][1],"Hoat dong Tet Nguyen Dan","giÕt gia cÇm hoµng kim",tb_GoldBoss_Award[nRand][4])
end