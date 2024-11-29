Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");

nMAXPOINT = 1111
TOPBANGHOI_FILENAME = "topbanghoi.txt"
LIB_txtData.szPattern = "[A-Za-z0-9¸µ¶·¹¡¾»¼½Æ¢ÊÇÈÉËEÐÌÎÏÑ£ÕÒÓÔÖãßáâä¤èåæçé¥íêëìîóïñòô¦øõö÷ùÝ×ØÜÞýúûüþ§¸µ¶·¹¨¾»¼½Æ©ÊÇÈÉËÐÌÎÏÑªÕÒÓÔÖãßáâä«èåæçé¬íêëìîóïñòô­øõö÷ùÝ×ØÜÞýúûüþ®_]"
szNpcName =  "<color=green>B¹ch Hæ<color>: "
LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
LIB_Award.szLogAction = "nhËn"

tbCongHienBang_NguyenLieu = {
	[1] = {1, {item={{gdp={2,1,30230,1}}},nExp = 1000000}, "1 ®iÓm cèng hiÕn: tiªu hao 1.000.000 kinh nghiÖm, 1 xu"},
	[2] = {10, {item={{gdp={2,1,30230,10}}},nExp = 10000000}, "10 ®iÓm cèng hiÕn: tiªu hao 10.000.000 kinh nghiÖm, 10 xu"},
	[3] = {100, {item={{gdp={2,1,30230,100}}},nExp = 100000000}, "100 ®iÓm cèng hiÕn: tiªu hao 100.000.000 kinh nghiÖm, 100 xu"},
	[4] = {1000, {item={{gdp={2,1,30230,1000}}}, nExp = 1000000000}, "1000 ®iÓm cèng hiÕn: tiªu hao 1.000.000.000 kinh nghiÖm, 1000 xu"},
}

function Check_Tong()
	local szTong = GetTongName()
	
	LIB_txtData:Init(TOPBANGHOI_FILENAME)
	LIB_txtData:LoadMultiColumn()
	local nCheckTongName = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheckTongName = i
			break
		end
	end
	if nCheckTongName > 0 then
		return 1
	else
		return 0
	end
end

function TopBangHoi_Menu()
	local nDate = tonumber(date("%Y%m%d"))
	local tbSay = {}
	
	if nDate < TOP_TONG_END_DATE  then
		if Check_Tong() == 0 then
			tinsert(tbSay, "Ta muèn §¨ng Ký/TopBangHoi_DangKy")
		else
			tinsert(tbSay, "Ta muèn Cèng HiÕn cho Bang Héi/TopBangHoi_CongHien_Menu")
			tinsert(tbSay, "Xem ®iÓm Cèng HiÕn cña Bang Héi/TopBangHoi_XemDiem")
		end
	end
	
	if nDate > TOP_TONG_END_DATE  then
		tinsert(tbSay, "Thµnh viªn nhËn th­ëng bang héi h¹ng 1,2,3/#TopBangHoi_NhanThuong(1)")
		local nTongLevel = IsTongMember()
		if nTongLevel == 1 then
			tinsert(tbSay, "Bang chñ nhËn th­ëng bang héi h¹ng 1,2,3/#TopBangHoi_NhanThuong(2)")
		end
	end
	tinsert(tbSay, "Xem phÇn th­ëng khi tham gia/TopBangHoi_Gif")
	tinsert(tbSay, "Ta chØ ghÐ xem/gf_DoNothing")
	Say("<color=green>Bang Héi Vinh Dù<color>: Ho¹t ®éng ®ang diÔn ra vµ kÕt thóc vµo <color=red>24h00 14-06-2020<color>", getn(tbSay), tbSay)
end

function TopBangHoi_Gif()
	local tbTitle1 = "<color=green>Bang héi Top 1<color><enter><enter><color=gold>Bang chñ<color>: 6 MËt tÞch 20% + 1 Set L«i Hæ Nguyªn So¸i + 15 TMKL, TCL + 5 Háa Phông Hån + 200 Háa Phông Linh<enter><color=gold>Thµnh viªn<color>: 600 Huy Ch­¬ng, Cæ Linh Ngäc, Cæ Linh Th¹ch<enter>"
	local tbTitle2 = "<color=green>Bang héi Top 2<color><enter><enter><color=gold>Bang chñ<color>: 5 MËt tÞch 20% + 1 Set L«i Hæ T­íng Qu©n + 10 TMKL, TCL + 2 Háa Phông Hån + 100 Háa Phông Linh<enter><color=gold>Thµnh viªn<color>: 500 Huy Ch­¬ng, Cæ Linh Ngäc, Cæ Linh Th¹ch<enter>"
	local tbTitle3 = "<color=green>Bang héi Top 3<color><enter><enter><color=gold>Bang chñ<color>: 4 MËt tÞch 20% + 5 TMKL, TCL + 1 Háa Phông Hån + 50 Háa Phông Linh<enter><color=gold>Thµnh viªn<color>: 400 Huy Ch­¬ng, Cæ Linh Ngäc, Cæ Linh Th¹ch<enter>"


	Talk(3, "", tbTitle1, tbTitle2, tbTitle3)
end


function TopBangHoi_DangKy()
	--local tbMaterial = {item={{gdp={2,1,30490,10}, name="Hoµng Kim §¹i Ng©n PhiÕu"}}}
	local szTong = GetTongName()
	local szAcc = GetAccount()
	local nTongLevel = IsTongMember()
	local szRole = GetName()
	-- kiem tra Maxx Skill 55 va dang cap 81
	--local nMaxSkill = CheckMaxSkill55()
	
	LIB_txtData:Init(TOPBANGHOI_FILENAME)
	LIB_txtData:LoadMultiColumn()
	local nCheckTongName = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheckTongName = i
			break
		end
	end
	if nCheckTongName > 0 then
		Talk(1,"",szNpcName.."Bang héi c¸c h¹ ®· ®¨ng ký tham gia råi. Mong chãng cïng c¸c thµnh viªn tÝch lòy ®iÓm c«ng hiÕn ®i nµo.")
		return 0
	end
	
	local nLevel = GetLevel();
	if nLevel <  90 then
		Talk(1,"",szNpcName.."§¼ng cÊp cña c¸c h¹ kh«ng ®ñ 90, kh«ng thÓ ®¨ng ký tham gia!")
		return 0
	end
	if nTongLevel ~= 1 then
		Talk(1, "",szNpcName.."C¸c h¹ kh«ng ph¶i bang chñ. NÕu muèn ®¨ng ký tham gia, h·y mêi bang chñ c¸c h¹ ®Õn gÆp ta.");
		return 0
	end
	if LIB_txtData:CheckString(szTong) > 0 then
		Talk(1, "",szNpcName.."Tªn bang héi c¸c h¹ cã nhiÒu ch÷ l¹ qu¸, ta kh«ng biÕt ghi l¹i nh­ thÕ nµo n÷a. Hay lµ ®æi bang kh¸c ®i nhÐ.")
		return 0
	end

	local szLogAward = szTong.."	"..szAcc.."	"..szRole.."	0"
	local nResult = LIB_txtData:AddLine(szLogAward)
	Talk(1,"",szNpcName.."Bang héi c¸c h¹ b¸o danh thµnh c«ng vµo cuéc ®ua vinh danh bang héi danh gi¸ , h·y b¸o tin cho c¸c thµnh viªn tÝch cùc x©y dùng danh tiÕng bang héi.")
	gf_WriteLogEx(szLogTitle, "nhËn", 1, "§¨ng ký thµnh c«ng")
end


function TopBangHoi_CongHien_Menu()
	local tbSay = {}
	for i=1,getn(tbCongHienBang_NguyenLieu) do
		tinsert(tbSay, tbCongHienBang_NguyenLieu[i][3].."/#TopBangHoi_CongHien_Done("..i..")")
	end
	tinsert(tbSay, "Ta chØ ghÐ xem/gf_DoNothing")
	Say(szNpcName.."§«ng ng­êi thªm søc m¹nh. Ng­¬i h·y cèng hiÕn cho bang héi b»ng hÕt kh¶ n¨ng m×nh cã.", getn(tbSay), tbSay)
end


function TopBangHoi_CongHien_Done(nOption)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Tr¹ng th¸i hiÖn t¹i kh«ng thÓ cèng hiÕn.")
		return
	end	
	-- kiem tra Maxx Skill 55 va dang cap 81
	--local nMaxSkill = CheckMaxSkill55()
	local nLevel = GetLevel();
	if nLevel <  90 then
		Talk(1,"",szNpcName.."§¼ng cÊp cña c¸c h¹ kh«ng ®ñ 90, kh«ng thÓ tham gia cèng hiÕn!")
		return 0
	end
	--if nMaxSkill ~= 1 then
	--	Talk(1, "",szNpcName.."Kû n¨ng skill 55 cña c¸c h¹ ch­a ®ñ. NÕu muèn ®¨ng ký tham gia, h·y n©ng cÊp kû n¨ng cÊp 55 råi ®Õn gÆp ta.");
	--	return 0
	--end
	local szName = GetName()
	local szTong = GetTongName() or ""
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbCongHienBang_NguyenLieu[nOption][2])
	if nCheck == 0 then
		return 0
	end
	local nPoint = VNG_GetTaskPos(TSK_CONGHIENBANG, 4,1)
	if (nPoint + tbCongHienBang_NguyenLieu[nOption][1]) > nMAXPOINT then
		Talk(1,"",szNpcName.."Møc cèng hiÕn ng­¬i chän v­ît qu¸ sè ®iÓm tèi ®a mçi ngµy. H·y chän møc kh¸c hoÆc mai quay l¹i nhÐ.")
		return 0
	end
	LIB_txtData:Init(TOPBANGHOI_FILENAME)
	LIB_txtData:LoadMultiColumn()
	local nBang = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nBang = i
			break
		end
	end
	if nBang == 0 then
		return 0
	end
	LIB_Award:PayMaterial(tbCongHienBang_NguyenLieu[nOption][2])
	VNG_SetTaskPos(TSK_CONGHIENBANG, (nPoint + tbCongHienBang_NguyenLieu[nOption][1]), 4, 1)
	LIB_txtData.tbTextData[nBang][4] = LIB_txtData.tbTextData[nBang][4] + tbCongHienBang_NguyenLieu[nOption][1]
	sort(LIB_txtData.tbTextData, function(x,y) return tonumber(x[4]) > tonumber(y[4]) end)
	LIB_txtData:SaveMultiColumn()
	if tbCongHienBang_NguyenLieu[nOption][1] == 1000 then
		AddGlobalNews(szName.." ®· cèng hiÕn 1000 ®iÓm cho bang ".. szTong ..". M¹nh Th­êng Qu©n ®· xuÊt hiÖn t¹i bang "..szTong..".")
	end
	local nNewRank = 10000
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nNewRank = i
			break
		end
	end
	if nBang >= nNewRank then
		if LIB_txtData.tbTextData[(nNewRank+1)] ~= nil then
			AddGlobalNews(szName.." ®· gióp bang héi "..LIB_txtData.tbTextData[nNewRank][1].." v­ît qua bang héi "..LIB_txtData.tbTextData[(nNewRank+1)][1]..". D­êng nh­ bang "..LIB_txtData.tbTextData[(nNewRank+1)][1].." cã biÓu hiÖn ®uèi søc.")
		end
	end
	Msg2Player("B¹n ®· cèng hiÕn "..tbCongHienBang_NguyenLieu[nOption][1].." cho bang héi.")
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogaction, 1, "Cèng hiÕn "..tbCongHienBang_NguyenLieu[nOption][1].." ®iÓm")
	TopBangHoi_CongHien_Menu()
end


function TopBangHoi_XemDiem()
	local tbData = {}
	
	--tinsert(tbData,szNpcName.."KÕt qu¶ hiÖn t¹i:\n")
	for i=1,getn(LIB_txtData.tbTextData) do
		local nIndex = floor(i/10)+1
		if tbData[nIndex] == nil then
			tinsert(tbData, szNpcName.."KÕt qu¶ hiÖn t¹i: \n")
		end
		tbData[nIndex] = tbData[nIndex] .. i.." - ".."<color=yellow>"..LIB_txtData.tbTextData[i][1].."<color>: <color=red>"..LIB_txtData.tbTextData[i][4].." ®iÓm<color>\n"
	end
	for i=1, getn(tbData) do
		Talk(1,"",tbData[i])
	end
end


function TopBangHoi_NhanThuong(nOption)
	local szTong = GetTongName() or ""
	if szTong == "" then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a gia nhËp bang héi, kh«ng thÓ nhËn th­ëng.")
		return 0
	end
	if nOption == 1 then
		if VNG_GetTaskPos(TSK_CONGHIENBANG,5,5) == 1 then
			Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn th­ëng, kh«ng thÓ nhËn thªm lÇn n÷a.")
			return 0
		end
	else
		if VNG_GetTaskPos(TSK_CONGHIENBANG,6,6) == 1 then
			Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn th­ëng, kh«ng thÓ nhËn thªm lÇn n÷a.")
			return 0
		end
	end
	LIB_txtData:Init(TOPBANGHOI_FILENAME)
	LIB_txtData:LoadMultiColumn()
	local nCheckTongName = 10000
	local nDiemCongHien = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheckTongName = i
			nDiemCongHien =  LIB_txtData.tbTextData[i][4]
			break
		end
	
	end

	if tonumber(nDiemCongHien) < 150000 then
		Talk(1,"",szNpcName.."§iÓm cèng hiÕn kh«ng ®ñ 150000 kh«ng thÓ nhËn th­ëng ®ua top.")
		return 0
	end
		
	if nOption == 1 then
		if nCheckTongName <= 3 then
			TopBangHoi_NhanThuong_ThanhVien(nCheckTongName)
		else
			Talk(1,"",szNpcName.."Bang héi c¸c h¹ kh«ng cã trong danh s¸ch nhËn th­ëng.")
		end
	else
		if nCheckTongName <= 3 then
			TopBangHoi_NhanThuong_BangChu(nCheckTongName)
		else
			Talk(1,"",szNpcName.."Bang héi c¸c h¹ kh«ng cã trong danh s¸ch nhËn th­ëng.")
		end
	end
end


function TopBangHoi_NhanThuong_ThanhVien(nRank)
	if gf_Judge_Room_Weight(15, 300) == 0 then
		Talk(1,"", szNpcName.."Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
		return 0
	end
	local nJoinTime = GetJoinTongTime();	
	local nLevel = GetLevel();
	if nLevel <  90 then
		Talk(1,"",szNpcName.."§¼ng cÊp cña c¸c h¹ kh«ng ®ñ 90, kh«ng thÓ nhËn th­ëng!")
		return 0
	end
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	if nDayCount <=  1 then
		Talk(1,"",szNpcName.."Thêi gian gia nhËp cña c¸c h¹ Ýt h¬n 1ngµy, kh«ng thÓ nhËn th­ëng!")
		return 0
	end
	local tbAward1 = {
		item = {
			{gdp={2,1,30499,600}}, -- Hu©n ch­¬ng anh hïng
			{gdp={2,1,30369,600}},
			{gdp={2,1,30368,600}},
		},
		nExp = 200000000,
	}
	local tbAward2 = {
		item = {
			{gdp={2,1,30499,500}}, -- Hu©n ch­¬ng anh hïng
			{gdp={2,1,30369,500}},
			{gdp={2,1,30368,500}}
		},
		nExp = 100000000,
	}
	local tbAward3 = {
		item = {
			{gdp={2,1,30499,400}}, -- Hu©n ch­¬ng anh hïng
			{gdp={2,1,30369,400}},
			{gdp={2,1,30368,400}}
		},
		nExp = 80000000,
	}
	tbAward = {
		[1] = tbAward1,
		[2] = tbAward2,
		[3] = tbAward3,
	}
	
	if nRank == 1 then
		AddTitle(69,2);
	end
	
	LIB_Award:Award(tbAward[nRank])
	VNG_SetTaskPos(TSK_CONGHIENBANG, 1, 5, 5)
	Talk(1,"",szNpcName.."NhËn thµnh c«ng phÇn t­ëng dµnh cho thµnh viªn bang h¹ng "..nRank)
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogaction, 1, "PhÇn th­ëng thµnh viªn bang héi h¹ng "..nRank)
end


function TopBangHoi_NhanThuong_BangChu(nRank)
	if gf_Judge_Room_Weight(15, 300) == 0 then
		Talk(1,"", szNpcName.."Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
		return 0
	end
	local nTongLevel = IsTongMember()
	if nTongLevel ~= 1 then
		Talk(1, "",szNpcName.."C¸c h¹ kh«ng ph¶i bang chñ. NÕu muèn nhËn th­ëng, h·y mêi bang chñ c¸c h¹ ®Õn gÆp ta.");
		return 0
	end
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if (nNow - nLastAssignTime) < (15*24*3600)   then
		Talk(1,"",szNpcName.."Thêi gian t¹i vÞ cña c¸c h¹ Ýt h¬n 15 ngµy, kh«ng thÓ nhËn th­ëng!")
		return 0
	end
	if nRank == 1 then
		TraoLoiHoNguyenSoai(0);
		TraoMatTichCaoCap20(6);
		AddItem(2,1,30370,15);
		AddItem(2,95,204,15);
		AddItem(2,1,30769	,5);
		AddItem(2,1,30770	,200);
		
		AddTitle(69,1);
		
		AddItem(0,105, 30056,1,1,-1,-1,-1,-1,-1,-1,1,0);
		--local tbAward = {item={{gdp={0,105,30026,1,4,-1,-1,-1,-1,-1,-1,-1}}}}
		--LIB_Award:Award(tbAward)
	elseif nRank == 2 then
		TraoLoiHoTuongQuan(0);
		TraoMatTichCaoCap20(5);
		AddItem(2,1,30370,10);
		AddItem(2,95,204,10);
		AddItem(2,1,30769	,2);
		AddItem(2,1,30770	,100);
		AddItem(0,105, 204,1,1,-1,-1,-1,-1,-1,-1,1,0);
		--local tbAward = {item={{gdp={0,105,30030,1,4,-1,-1,-1,-1,-1,-1,-1}}}}
		--LIB_Award:Award(tbAward)
	elseif nRank == 3 then
		AddItem(2,1,30370,5);
		AddItem(2,95,204,5);
		AddItem(2,1,30769	,1);
		AddItem(2,1,30770	,50);
		TraoMatTichCaoCap20(4);
		--local tbAward = {item={{gdp={0,112,78,2}}}}
		--LIB_Award:Award(tbAward)
	end
	VNG_SetTaskPos(TSK_CONGHIENBANG, 1, 6, 6)
	Talk(1,"",szNpcName.."NhËn thµnh c«ng phÇn t­ëng dµnh cho bang h¹ng "..nRank)
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogaction, 1, "PhÇn th­ëng bang chñ bang héi h¹ng "..nRank)
end
