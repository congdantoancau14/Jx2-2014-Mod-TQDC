Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");

nMAXPOINT = 1111
TOPBANGHOI_FILENAME = "topbanghoi.txt"
LIB_txtData.szPattern = "[A-Za-z0-9����������Ƣ�����E����ѣ����������������������������������������������������Ʃ���������Ѫ������������������������������������������_]"
szNpcName =  "<color=green>B�ch H�<color>: "
LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
LIB_Award.szLogAction = "nh�n"

tbCongHienBang_NguyenLieu = {
	[1] = {1, {item={{gdp={2,1,30230,1}}},nExp = 1000000}, "1 �i�m c�ng hi�n: ti�u hao 1.000.000 kinh nghi�m, 1 xu"},
	[2] = {10, {item={{gdp={2,1,30230,10}}},nExp = 10000000}, "10 �i�m c�ng hi�n: ti�u hao 10.000.000 kinh nghi�m, 10 xu"},
	[3] = {100, {item={{gdp={2,1,30230,100}}},nExp = 100000000}, "100 �i�m c�ng hi�n: ti�u hao 100.000.000 kinh nghi�m, 100 xu"},
	[4] = {1000, {item={{gdp={2,1,30230,1000}}}, nExp = 1000000000}, "1000 �i�m c�ng hi�n: ti�u hao 1.000.000.000 kinh nghi�m, 1000 xu"},
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
			tinsert(tbSay, "Ta mu�n ��ng K�/TopBangHoi_DangKy")
		else
			tinsert(tbSay, "Ta mu�n C�ng Hi�n cho Bang H�i/TopBangHoi_CongHien_Menu")
			tinsert(tbSay, "Xem �i�m C�ng Hi�n c�a Bang H�i/TopBangHoi_XemDiem")
		end
	end
	
	if nDate > TOP_TONG_END_DATE  then
		tinsert(tbSay, "Th�nh vi�n nh�n th��ng bang h�i h�ng 1,2,3/#TopBangHoi_NhanThuong(1)")
		local nTongLevel = IsTongMember()
		if nTongLevel == 1 then
			tinsert(tbSay, "Bang ch� nh�n th��ng bang h�i h�ng 1,2,3/#TopBangHoi_NhanThuong(2)")
		end
	end
	tinsert(tbSay, "Xem ph�n th��ng khi tham gia/TopBangHoi_Gif")
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say("<color=green>Bang H�i Vinh D�<color>: Ho�t ��ng �ang di�n ra v� k�t th�c v�o <color=red>24h00 14-06-2020<color>", getn(tbSay), tbSay)
end

function TopBangHoi_Gif()
	local tbTitle1 = "<color=green>Bang h�i Top 1<color><enter><enter><color=gold>Bang ch�<color>: 6 M�t t�ch 20% + 1 Set L�i H� Nguy�n So�i + 15 TMKL, TCL + 5 H�a Ph�ng H�n + 200 H�a Ph�ng Linh<enter><color=gold>Th�nh vi�n<color>: 600 Huy Ch��ng, C� Linh Ng�c, C� Linh Th�ch<enter>"
	local tbTitle2 = "<color=green>Bang h�i Top 2<color><enter><enter><color=gold>Bang ch�<color>: 5 M�t t�ch 20% + 1 Set L�i H� T��ng Qu�n + 10 TMKL, TCL + 2 H�a Ph�ng H�n + 100 H�a Ph�ng Linh<enter><color=gold>Th�nh vi�n<color>: 500 Huy Ch��ng, C� Linh Ng�c, C� Linh Th�ch<enter>"
	local tbTitle3 = "<color=green>Bang h�i Top 3<color><enter><enter><color=gold>Bang ch�<color>: 4 M�t t�ch 20% + 5 TMKL, TCL + 1 H�a Ph�ng H�n + 50 H�a Ph�ng Linh<enter><color=gold>Th�nh vi�n<color>: 400 Huy Ch��ng, C� Linh Ng�c, C� Linh Th�ch<enter>"


	Talk(3, "", tbTitle1, tbTitle2, tbTitle3)
end


function TopBangHoi_DangKy()
	--local tbMaterial = {item={{gdp={2,1,30490,10}, name="Ho�ng Kim ��i Ng�n Phi�u"}}}
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
		Talk(1,"",szNpcName.."Bang h�i c�c h� �� ��ng k� tham gia r�i. Mong ch�ng c�ng c�c th�nh vi�n t�ch l�y �i�m c�ng hi�n �i n�o.")
		return 0
	end
	
	local nLevel = GetLevel();
	if nLevel <  90 then
		Talk(1,"",szNpcName.."��ng c�p c�a c�c h� kh�ng �� 90, kh�ng th� ��ng k� tham gia!")
		return 0
	end
	if nTongLevel ~= 1 then
		Talk(1, "",szNpcName.."C�c h� kh�ng ph�i bang ch�. N�u mu�n ��ng k� tham gia, h�y m�i bang ch� c�c h� ��n g�p ta.");
		return 0
	end
	if LIB_txtData:CheckString(szTong) > 0 then
		Talk(1, "",szNpcName.."T�n bang h�i c�c h� c� nhi�u ch� l� qu�, ta kh�ng bi�t ghi l�i nh� th� n�o n�a. Hay l� ��i bang kh�c �i nh�.")
		return 0
	end

	local szLogAward = szTong.."	"..szAcc.."	"..szRole.."	0"
	local nResult = LIB_txtData:AddLine(szLogAward)
	Talk(1,"",szNpcName.."Bang h�i c�c h� b�o danh th�nh c�ng v�o cu�c �ua vinh danh bang h�i danh gi� , h�y b�o tin cho c�c th�nh vi�n t�ch c�c x�y d�ng danh ti�ng bang h�i.")
	gf_WriteLogEx(szLogTitle, "nh�n", 1, "��ng k� th�nh c�ng")
end


function TopBangHoi_CongHien_Menu()
	local tbSay = {}
	for i=1,getn(tbCongHienBang_NguyenLieu) do
		tinsert(tbSay, tbCongHienBang_NguyenLieu[i][3].."/#TopBangHoi_CongHien_Done("..i..")")
	end
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say(szNpcName.."��ng ng��i th�m s�c m�nh. Ng��i h�y c�ng hi�n cho bang h�i b�ng h�t kh� n�ng m�nh c�.", getn(tbSay), tbSay)
end


function TopBangHoi_CongHien_Done(nOption)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Tr�ng th�i hi�n t�i kh�ng th� c�ng hi�n.")
		return
	end	
	-- kiem tra Maxx Skill 55 va dang cap 81
	--local nMaxSkill = CheckMaxSkill55()
	local nLevel = GetLevel();
	if nLevel <  90 then
		Talk(1,"",szNpcName.."��ng c�p c�a c�c h� kh�ng �� 90, kh�ng th� tham gia c�ng hi�n!")
		return 0
	end
	--if nMaxSkill ~= 1 then
	--	Talk(1, "",szNpcName.."K� n�ng skill 55 c�a c�c h� ch�a ��. N�u mu�n ��ng k� tham gia, h�y n�ng c�p k� n�ng c�p 55 r�i ��n g�p ta.");
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
		Talk(1,"",szNpcName.."M�c c�ng hi�n ng��i ch�n v��t qu� s� �i�m t�i �a m�i ng�y. H�y ch�n m�c kh�c ho�c mai quay l�i nh�.")
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
		AddGlobalNews(szName.." �� c�ng hi�n 1000 �i�m cho bang ".. szTong ..". M�nh Th��ng Qu�n �� xu�t hi�n t�i bang "..szTong..".")
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
			AddGlobalNews(szName.." �� gi�p bang h�i "..LIB_txtData.tbTextData[nNewRank][1].." v��t qua bang h�i "..LIB_txtData.tbTextData[(nNewRank+1)][1]..". D��ng nh� bang "..LIB_txtData.tbTextData[(nNewRank+1)][1].." c� bi�u hi�n �u�i s�c.")
		end
	end
	Msg2Player("B�n �� c�ng hi�n "..tbCongHienBang_NguyenLieu[nOption][1].." cho bang h�i.")
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogaction, 1, "C�ng hi�n "..tbCongHienBang_NguyenLieu[nOption][1].." �i�m")
	TopBangHoi_CongHien_Menu()
end


function TopBangHoi_XemDiem()
	local tbData = {}
	
	--tinsert(tbData,szNpcName.."K�t qu� hi�n t�i:\n")
	for i=1,getn(LIB_txtData.tbTextData) do
		local nIndex = floor(i/10)+1
		if tbData[nIndex] == nil then
			tinsert(tbData, szNpcName.."K�t qu� hi�n t�i: \n")
		end
		tbData[nIndex] = tbData[nIndex] .. i.." - ".."<color=yellow>"..LIB_txtData.tbTextData[i][1].."<color>: <color=red>"..LIB_txtData.tbTextData[i][4].." �i�m<color>\n"
	end
	for i=1, getn(tbData) do
		Talk(1,"",tbData[i])
	end
end


function TopBangHoi_NhanThuong(nOption)
	local szTong = GetTongName() or ""
	if szTong == "" then
		Talk(1,"",szNpcName.."C�c h� ch�a gia nh�p bang h�i, kh�ng th� nh�n th��ng.")
		return 0
	end
	if nOption == 1 then
		if VNG_GetTaskPos(TSK_CONGHIENBANG,5,5) == 1 then
			Talk(1,"",szNpcName.."C�c h� �� nh�n th��ng, kh�ng th� nh�n th�m l�n n�a.")
			return 0
		end
	else
		if VNG_GetTaskPos(TSK_CONGHIENBANG,6,6) == 1 then
			Talk(1,"",szNpcName.."C�c h� �� nh�n th��ng, kh�ng th� nh�n th�m l�n n�a.")
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
		Talk(1,"",szNpcName.."�i�m c�ng hi�n kh�ng �� 150000 kh�ng th� nh�n th��ng �ua top.")
		return 0
	end
		
	if nOption == 1 then
		if nCheckTongName <= 3 then
			TopBangHoi_NhanThuong_ThanhVien(nCheckTongName)
		else
			Talk(1,"",szNpcName.."Bang h�i c�c h� kh�ng c� trong danh s�ch nh�n th��ng.")
		end
	else
		if nCheckTongName <= 3 then
			TopBangHoi_NhanThuong_BangChu(nCheckTongName)
		else
			Talk(1,"",szNpcName.."Bang h�i c�c h� kh�ng c� trong danh s�ch nh�n th��ng.")
		end
	end
end


function TopBangHoi_NhanThuong_ThanhVien(nRank)
	if gf_Judge_Room_Weight(15, 300) == 0 then
		Talk(1,"", szNpcName.."S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
		return 0
	end
	local nJoinTime = GetJoinTongTime();	
	local nLevel = GetLevel();
	if nLevel <  90 then
		Talk(1,"",szNpcName.."��ng c�p c�a c�c h� kh�ng �� 90, kh�ng th� nh�n th��ng!")
		return 0
	end
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	if nDayCount <=  1 then
		Talk(1,"",szNpcName.."Th�i gian gia nh�p c�a c�c h� �t h�n 1ng�y, kh�ng th� nh�n th��ng!")
		return 0
	end
	local tbAward1 = {
		item = {
			{gdp={2,1,30499,600}}, -- Hu�n ch��ng anh h�ng
			{gdp={2,1,30369,600}},
			{gdp={2,1,30368,600}},
		},
		nExp = 200000000,
	}
	local tbAward2 = {
		item = {
			{gdp={2,1,30499,500}}, -- Hu�n ch��ng anh h�ng
			{gdp={2,1,30369,500}},
			{gdp={2,1,30368,500}}
		},
		nExp = 100000000,
	}
	local tbAward3 = {
		item = {
			{gdp={2,1,30499,400}}, -- Hu�n ch��ng anh h�ng
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
	Talk(1,"",szNpcName.."Nh�n th�nh c�ng ph�n t��ng d�nh cho th�nh vi�n bang h�ng "..nRank)
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogaction, 1, "Ph�n th��ng th�nh vi�n bang h�i h�ng "..nRank)
end


function TopBangHoi_NhanThuong_BangChu(nRank)
	if gf_Judge_Room_Weight(15, 300) == 0 then
		Talk(1,"", szNpcName.."S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
		return 0
	end
	local nTongLevel = IsTongMember()
	if nTongLevel ~= 1 then
		Talk(1, "",szNpcName.."C�c h� kh�ng ph�i bang ch�. N�u mu�n nh�n th��ng, h�y m�i bang ch� c�c h� ��n g�p ta.");
		return 0
	end
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if (nNow - nLastAssignTime) < (15*24*3600)   then
		Talk(1,"",szNpcName.."Th�i gian t�i v� c�a c�c h� �t h�n 15 ng�y, kh�ng th� nh�n th��ng!")
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
	Talk(1,"",szNpcName.."Nh�n th�nh c�ng ph�n t��ng d�nh cho bang h�ng "..nRank)
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogaction, 1, "Ph�n th��ng bang ch� bang h�i h�ng "..nRank)
end
