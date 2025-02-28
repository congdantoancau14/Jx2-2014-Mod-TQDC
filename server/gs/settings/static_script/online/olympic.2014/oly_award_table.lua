--并数字奖励表
OLY_GUESS_AWARD_TABLE = {
	{600000,{2,1,30400,6}},
	{400000,{2,1,30400,4}},
	{320000,{2,1,30400,3}},
	{160000,{2,1,30400,2}},
	{80000,{2,1,30400,1}},
}

--点火次数累计奖励
OLY_ACCUMULATE_FIRE_AWARD_TABLE = {
	[1] = {50, 3, "oly_StarEquip_Award()", "Nh鉳 trang b� 1-3 sao", 1, 0},
	[1] = {50, 1, {2,1,30424,5,1}, "Cng h穉 quy觧 12", 1, 0},
	[2] = {100, 1, {2,1,30425,5,1}, "Cng h穉 quy觧 13", 1, 0},
	[3] = {200, 1, {2,1,30426,5,1}, "Cng h穉 quy觧 14", 1, 0},
	[4] = {400, 1, {2,1,30427,5,1}, "Cng h穉 quy觧 15", 1, 0},
	[5] = {700, 1, {2,1,30728,1}, "Tr鴑g linh th� cao", 1, 0},
	[6] = {1000, 1, {2,1,1113,1}, "Чi nh h錸", 1, 0},
	[7] = {1300, 1, {2,1,30497,300,4}, "Ma tinh", 1, 0},
	[8] = {1600, 1, {2,1,30345,1,1}, "Chuy觧 sinh n", 1, 0},
	[9] = {1800, 1, {2,1,30370,1}, "Thi猲 M玭 Kim L謓h", 0, 0},
	[10] = {2000, 1, {2,95,204,1}, "Thi猲 Cang L謓h", 0, 0},
}

--奖励1
OLY_AWARD_1_TABLE = {
	{1, 15, "Ng� Th竔 Th竛h H醓", {2, 1, 30402, 1, 4}, 0},
	{1, 5, "T骾 ti襫", {2, 1, 30367, 1}, 0},
	{1, 10, "Ng� H祅h Huy襫 Th筩h", {2, 1, 30302, 4}, 0},
	{1, 5, "M秐h Tinh Ng蕁", {2, 1, 30299, 4}, 0},
	{20, 5, 1, 1},
	{21, 5, 1, 1},
	{31, 5, "oly_XingKe_Award()", ""},
	{31, 5, "oly_ShiMeng4_Award()", ""},
};

OLY_AWARD_2_TABLE  = {
	{1, 15, "Ng� H祅h Huy襫 Th筩h", {2, 1, 30302, 8, 1}, 0},
	{1, 5, "M秐h Tinh Ng蕁", {2, 1, 30299, 8, 1}, 0},
	{1, 1, "Thi猲 Th筩h Tinh Th筩h", {2, 1, 1009, 1, 4}, 0},
	{31, 2, "oly_XingKe_Award()", ""},
	{31, 1, "oly_TianYi_Award()", ""},
	{31, 3, "oly_StarEquip_Award()", ""},
};

OLY_AWARD_3_TABLE  = {
	{1, 200, "Thi猲 th筩h", {2, 2, 8, 1}, 0},
	{1, 200, "M秐h thi猲 th筩h", {2, 2, 7, 1}, 0},
	{1, 300, "T骾 ti襫", {2, 1, 30367, 1}, 0},
	{1, 50, "Ng� H祅h Huy襫 Th筩h", {2, 1, 30302, 8, 1}, 0},
	{1, 15, "M秐h Tinh Ng蕁", {2, 1, 30299, 4}, 0},
	{1, 15, "Ch﹏ kh� h� th� c 5", {2, 150, 67, 1}, 0},
	{1, 15, "輈h th� di猲 dng c 5", {2, 150, 68, 1}, 0},
	{1, 15, "Cng th﹏ b� th� c 5", {2, 150, 69, 1}, 0},
	{1, 15, " phong th颿 c蘴 c 5", {2, 150, 70, 1}, 0},
	{1, 15, "Huy襫 v� v� song c 5", {2, 150, 71, 1}, 0},
	{1, 15, "V� h祅h v� tng c 5", {2, 150, 72, 1}, 0},
	{1, 15, "Kim linh ph� th� c 5", {2, 150, 73, 1}, 0},
	{1, 15, "M衏 linh ph� th� c 5", {2, 150, 74, 1}, 0},
	{1, 15, "Th駓 linh ph� th� c 5", {2, 150, 75, 1}, 0},
	{1, 15, "H竌 linh ph� th� c 5", {2, 150, 76, 1}, 0},
	{1, 15, "Th� linh ph� th� c 5", {2, 150, 77, 1}, 0},
	{1, 15, "Ph� kh玭g tr秏 秐h c 5", {2, 150, 78, 1}, 0},
	{1, 15, "S竧 thng gia n﹏g c 5", {2, 150, 79, 1}, 0},
	{1, 15, "Khinh linh t t藅 c 5", {2, 150, 80, 1}, 0},
	{1, 15, "V� h譶h chi c� c 5", {2, 150, 81, 1}, 0},
	{1, 200, "Thi猲 Th筩h Tinh Th筩h", {2, 1, 1009, 1}, 0},
	{1, 50, "мnh H錸 Thi猲 Th筩h Th莕 Th筩h", {2, 1, 1067, 1}, 30 * 24 * 3600, 0, 0, 1},
	{1, 50, "Thi猲 Th筩h linh th筩h", {2, 1, 1068, 1}, 30 * 24 * 3600, 0, 0, 1},
	{1, 25, "Thi猲 M玭 Kim L謓h", {2, 1, 30370, 1}, 0, 0, 0, 1},
	{1, 25, "Thi猲 Cang L謓h", {2, 95, 204, 1}, 0, 0, 0, 1},
	--{31, 50, "oly_XingKe_Award()", ""},
	--{31, 50, "oly_TianYi_Award()", ""},
	{31, 50, "oly_StarEquip_Award()", ""},
};

OLY_XINGKE_AWARD_TB  = {
	{1, 4, "Tinh Kh綾-L玦  Nang Th�", {0, 0, 8874, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Tinh Kh綾-Quy L﹏ H� Th�", {0, 0, 8875, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Tinh Kh綾- Dng Xuy猲 秐h", {0, 1, 8879, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Tinh Kh綾-T� H祅  Ki誱", {0, 2, 8884, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Tinh Kh綾-Thu莕 Phong Ki誱", {0, 2, 8885, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Tinh Kh綾-Ng� Thi猲 Phong Ki誱", {0, 2, 8886, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Tinh Kh綾-L璾 Ly Gi韎 o", {0, 3, 8892, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	--    {1, 6, "星刻之神炎天刀", {0, 3,	8893, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Tinh Kh綾-Truy M謓h Cung", {0, 4, 8897, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Tinh Kh綾-Tr蕁 Ng筼 C玭", {0, 5, 8900, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Tinh Kh綾-Ph� Qu﹏ Tr薾 Thng", {0, 6, 8903, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Tinh Kh綾-Thi謕 C鑤 Huy誸 o", {0, 7, 8906, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Tinh Kh綾-Kinh L玦 Thi襫 Trng", {0, 8, 8909, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Tinh Kh綾-Tinh u Chuy觧 B髏", {0, 9, 8913, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	--    {1, 4, "星刻之神锋判笔", {0, 9,	8914, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Tinh Kh綾-C鰑 Ho祅 B鑙 C莔", {0, 10, 8918, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Tinh Kh綾-Luy謓 H錸 Huy誸 Tr秓", {0, 11, 8922, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	--    {1, 4, "星刻之神灵咒爪", {0, 11, 8923, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Tinh Kh綾-C鰑 Ti猽 S竜", {0, 12, 8927, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Tinh Kh綾-Linh Lung Chi", {0, 13, 8930, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 6, "Tinh Kh綾-Huy襫 Th筩h Kim Ng鋍", {0, 102, 3121, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 6, "Tinh Kh綾-Ph� Th髖 Ng鋍 ыi", {0, 102, 3124, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 6, "Tinh Kh綾- Nguy謙 Hoa Th駓 B鑙", {0, 102, 3127, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 6, "Tinh Kh綾-C鰑  H醓 Gi韎", {0, 102, 3130, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 8, "Tinh Kh綾-Ng璶g Ng鋍 Th� Ho祅", {0, 102, 3133, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
};

OLY_TIANYI_AWARD_TB = {
	{1, 4, "Thi猲 Ngh躠-L玦  Nang Th�", {0,	0,	8876, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Thi猲 Ngh躠-Quy L﹏ H� Th�", {0,	0,	8877, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Thi猲 Ngh躠- Dng Xuy猲 秐h", {0,	1,	8880, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Thi猲 Ngh躠-T� H祅  Ki誱", {0,	2,	8887, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Thi猲 Ngh躠-Thu莕 Phong Ki誱", {0,	2,	8888, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Thi猲 Ngh躠-Ng� Thi猲 Phong Ki誱", {0,	2,	8889, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Thi猲 Ngh躠-L璾 Ly Gi韎 o", {0,	3,	8894, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	--		{1, 4, "天仪之神炎天刀", {0,	3,	8895, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Thi猲 Ngh躠-Truy M謓h Cung", {0,	4,	8898, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Thi猲 Ngh躠-Tr蕁 Ng筼 C玭", {0,	5,	8901, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Thi猲 Ngh躠-Ph� Qu﹏ Tr薾 Thng", {0,	6,	8904, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Thi猲 Ngh躠-Thi謕 C鑤 Huy誸 o", {0,	7,	8907, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Thi猲 Ngh躠-Kinh L玦 Thi襫 Trng", {0,	8,	8910, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Thi猲 Ngh躠-Tinh u Chuy觧 B髏", {0,	9,	8915, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	--		{1, 4, "天仪之神锋判笔", {0,	9,	8916, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Thi猲 Ngh躠-C鰑 Ho祅 B鑙 C莔", {0,	10,	8919, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Thi猲 Ngh躠-Luy謓 H錸 Huy誸 Tr秓", {0,	11,	8924, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	--		{1, 6, "天仪之神灵咒爪", {0,	11,	8925, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Thi猲 Ngh躠-C鰑 Ti猽 S竜", {0,	12,	8928, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 4, "Thi猲 Ngh躠-Linh Lung Chi", {0,	13,	8931, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 6, "Thi猲 Ngh躠- Huy襫 Th筩h Kim Ng鋍", {0, 102, 3122, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 6, "Thi猲 Ngh躠- Ph� Th髖 Ng鋍 ыi", {0, 102, 3125, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 6, "Thi猲 Ngh躠- Nguy謙 Hoa Th駓 B鑙", {0, 102, 3128, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 6, "Thi猲 Ngh躠- C鰑  H醓 Gi韎", {0, 102, 3131, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	{1, 8, "Thi猲 Ngh躠- Ng璶g Ng鋍 Th� Ho祅", {0, 102, 3134, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
};

OLY_STAREQUIP_AWARD_TB = {
		{1, 3, "Huy Chng Kim Ch� ng� h祅h", {0, 153, 4, 1, 4}, 0, 0, 0, 1},
		{1, 3, "Huy Chng M閏 Ch� ng� h祅h", {0, 153, 5, 1, 4}, 0, 0, 0, 1},
		{1, 3, "Huy Chng Th駓 Ch� ng� h祅h", {0, 153, 6, 1, 4}, 0, 0, 0, 1},
		{1, 3, "Huy Chng H醓 Ch� ng� h祅h", {0, 153, 7, 1, 4}, 0, 0, 0, 1},
		{1, 3, "Huy Chng Th� Ch� ng� h祅h", {0, 153, 8, 1, 4}, 0, 0, 0, 1},
		{1, 1, "Huy Chng  Ch� ng� h祅h", {0, 153, 9, 1, 4}, 0, 0, 0, 1},
		{1, 3, "竜 Cho祅g Ng� H祅h Kim Ch�", {0, 152, 4, 1, 4}, 0, 0, 0, 1},
		{1, 3, "竜 Cho祅g Ng� H祅h M閏 Ch�", {0, 152, 5, 1, 4}, 0, 0, 0, 1},
		{1, 3, "竜 Cho祅g Ng� H祅h Th駓 Ch�", {0, 152, 6, 1, 4}, 0, 0, 0, 1},
		{1, 3, "竜 Cho祅g Ng� H祅h H醓 Ch�", {0, 152, 7, 1, 4}, 0, 0, 0, 1},
		{1, 3, "竜 Cho祅g Ng� H祅h Th� Ch�", {0, 152, 8, 1, 4}, 0, 0, 0, 1},
		{1, 1, "竜 Cho祅g Ng� H祅h  Ch�", {0, 152, 9, 1, 4}, 0, 0, 0, 1},
		{1, 3, "Chi課 H礽 Kim Ch� ng� h祅h", {0, 154, 4, 1, 4}, 0, 0, 0, 1},
		{1, 3, "Chi課 H礽 M閏 Ch� ng� h祅h", {0, 154, 5, 1, 4}, 0, 0, 0, 1},
		{1, 3, "Chi課 H礽 Th駓 Ch� ng� h祅h", {0, 154, 6, 1, 4}, 0, 0, 0, 1},
		{1, 3, "Chi課 H礽 H醓 Ch� ng� h祅h", {0, 154, 7, 1, 4}, 0, 0, 0, 1},
		{1, 3, "Chi課 H礽 Th� Ch� ng� h祅h", {0, 154, 8, 1, 4}, 0, 0, 0, 1},
		{1, 1, "Chi課 H礽  Ch� ng� h祅h", {0, 154, 9, 1, 4}, 0, 0, 0, 1},
};
