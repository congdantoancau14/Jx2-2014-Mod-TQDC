Include("\\script\\vng\\lib\\vnglib_award.lua");
--Include("\\script\\vng\\chitonvuonglenh\\chitonvuonglenh_head.lua");
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2_head.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
--Include("\\script\\vng\\sinhtuvonga\\sinhtuvonga_core.lua");
--Include("\\script\\vng\\weapon_upgrade\\viemde2thienchiviemde.lua");
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua");
----script KS
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\task_access_code_def.lua")
----


--Award cho  B¸t nh· nhá
function ThuHoachBatNhaNho()
	--=============== Chuçi nhiÖm vô Phôc Sinh 2 ===================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 9 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end

	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
end

function KichHoatBatNhaNho()
	ModifyReputation(1,0)
	SetTask(336,GetTask(336)+1)
	Msg2Player("B¹n nhËn ®­îc 1 ®iÓm S­ m«n !")
	local nExp = 2100000
	ModifyExp(nExp)
	Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm!")
	local nExpChanKhi = 250
	AwardGenuineQi(nExpChanKhi)
	gf_WriteLogEx("DA THONG KINH MACH", "®æi thµnh c«ng", nExpChanKhi, "®iÓm ch©n khÝ B¸t nh· nhá")			
	gf_WriteLogEx("KICH HOAT BAT NHA NHO 13/5/2013", "kick ho¹t thµnh c«ng", 1, "KÝch ho¹t  B¸t nh· nhá")
	
	-- chuçi nhiÖm vô Phôc Sinh PET
	local nActive_BNN_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10000) --lÊy sè lÇn kÝch ho¹t b¸t nh· nhá cña Pet Phôc Sinh
	if mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10) == 1 then
		if mod(nActive_BNN_PET_PS,1000) < 160 then
			nActive_BNN_PET_PS = (nActive_BNN_PET_PS + 1) * 10000 -- céng 1 khi kÝch ho¹t thµnh c«ng
			nActive_BNN_PET_PS = nActive_BNN_PET_PS + mod(GetTask(TSK_PET_PS_GIAIDOAN_A),10000) --céng vµo nguyªn task
			SetTask(TSK_PET_PS_GIAIDOAN_A, nActive_BNN_PET_PS) --set l¹i toµn bé task
			gf_WriteLogEx("PHUC SINH PET", "kick ho¹t thµnh c«ng", 1, "KÝch ho¹t  B¸t nh· nhá")
		end
	end
end

--Award cho  H¹t Gièng
function ThuHoachHatGiong()
	vaf_award_api("tPlantSeedTree") --2XU
	
	--=============== Chuçi nhiÖm vô Phôc Sinh 2 ====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 7 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end
	
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
end

function KichHoatHatGiong()
	ModifyReputation(1,0)
	SetTask(336,GetTask(336)+1)
	Msg2Player("B¹n nhËn ®­îc 1 ®iÓm S­ m«n !")
	local nExp = 1200000
	ModifyExp(nExp)
	Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm!")
	local nExpChanKhi = 300
	AwardGenuineQi(nExpChanKhi)
	gf_WriteLogEx("DA THONG KINH MACH", "®æi thµnh c«ng", nExpChanKhi, "®iÓm ch©n khÝ h¹t gièng")	
	gf_WriteLogEx("KICH HOAT HAT GIONG", "kick ho¹t thµnh c«ng", 1, "KÝch ho¹t H¹t gièng")
end

--Award cho  C©y Tø Linh
function ThuHoachCayTuLinh()
	--=============== Chuçi nhiÖm vô Phôc Sinh 2 ==========================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 13 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
end

function KichHoatCayTuLinh()
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + 10)
	else
		SetTask(701,GetTask(701) - 10)
	end
	Msg2Player("B¹n nhËn ®­îc 10 ®iÓm c«ng tr¹ng")
	SetTask(707, GetTask(707)+ 10)
	Msg2Player("B¹n nhËn ®­îc 10 ®iÓm tÝch lòy")
    	local nBonusExp = 3600000
	ModifyExp(nBonusExp)
	Msg2Player("B¹n nhËn ®­îc "..nBonusExp.." ®iÓm kinh nghiÖm!")
	ModifyReputation(2,0)
	SetTask(336,GetTask(336)+2)
	Msg2Player("B¹n nhËn ®­îc 2 ®iÓm S­ m«n !")
	local nExpChanKhi = 400
	AwardGenuineQi(nExpChanKhi)
	gf_WriteLogEx("DA THONG KINH MACH", "®æi thµnh c«ng", nExpChanKhi, "®iÓm ch©n khÝ c©y Tø Linh")		
	gf_WriteLogEx("KICH HOAT CAY TU LINH 13/5/2013", "kick ho¹t thµnh c«ng", 1, "KÝch ho¹t C©y Tø Linh")	

	
	-- chuçi nhiÖm vô Phôc Sinh PET
	local nActive_CTL_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10000000) --lÊy sè lÇn kÝch ho¹t b¸t nh· nhá cña Pet Phôc Sinh
	if mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10) == 1 then
		if mod(nActive_CTL_PET_PS,1000) < 160 then
			nActive_CTL_PET_PS = (nActive_CTL_PET_PS + 1) * 10000000 -- céng 1 khi kÝch ho¹t thµnh c«ng
			nActive_CTL_PET_PS = nActive_CTL_PET_PS + mod(GetTask(TSK_PET_PS_GIAIDOAN_A),10000000) --céng vµo nguyªn task
			SetTask(TSK_PET_PS_GIAIDOAN_A, nActive_CTL_PET_PS) --set l¹i toµn bé task
			gf_WriteLogEx("PHUC SINH PET", "kick ho¹t thµnh c«ng", 1, "KÝch ho¹t  c©y Tø Linh")
		end
	end
end

--Award cho N÷ Oa B¶o H¹p
function Use_Award_NuOa() 
  	local nExp = 1000000	--®iÓm vËn may khai b¸o bªn file gèc
  	ModifyExp(nExp)
    	local nExpChanKhi = 2
	AwardGenuineQi(nExpChanKhi)	
	local nQuanCong = 2
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + nQuanCong)
	else
		SetTask(701,GetTask(701) - nQuanCong)
	end	
	--============= Chuçi nhiÖm vô Phôc Sinh 2 =====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 40 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end
end

function Use_Award_NuOa_100()
	local tbAward = {item ={
			{gdp={2, 0, 553, 3}, name="§¹i Nh©n S©m", nExpired = 7*24*60*60},
			{gdp={2, 0, 552, 3}, name="TiÓu Nh©n S©m", nExpired = 7*24*60*60},
			{gdp={2, 0, 554, 3}, name="Tu Ch©n YÕu QuyÕt", nExpired = 7*24*60*60},},
		nGold = 300000,
		nPetExp = 20,
		nPetLinhluc = 10,
	}
	LIB_Award.szLogTitle = VET_201003_01_STR_LOG_TITLE
	LIB_Award.szLogAction = "NhËn thµnh c«ng sö dông 100"
	LIB_Award:Award(tbAward)
--	Earn(300000)
--	gf_AddItemEx2({2, 0, 553, 3}, "§¹i Nh©n S©m", VET_201003_01_STR_LOG_TITLE, "NhËn thµnh c«ng sö dông 100", 7*24*60*60)	
--	gf_AddItemEx2({2, 0, 552, 3}, "TiÓu Nh©n S©m", VET_201003_01_STR_LOG_TITLE, "NhËn thµnh c«ng sö dông 100", 7*24*60*60)		
--	gf_AddItemEx2({2, 0, 554, 3}, "Tu Ch©n YÕu QuyÕt", VET_201003_01_STR_LOG_TITLE, "NhËn thµnh c«ng sö dông 100", 7*24*60*60)		
end

--Award cho Ng«i Sao May M¾n
function Use_Award_NgoiSao() 
	local tbAward = {
		nChankhi = 20,
		nQuancong = 50,
		nPetLinhluc = 3
	}
	LIB_Award:Award(tbAward);
	--============= Chuçi nhiÖm vô Phôc Sinh 2 =====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 41 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end	
	
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
end

function Use_Award_NgoiSao_16()
	Earn(60000)
	SetTask(2501, GetTask(2501) + 60) --b¹ch cÇu hoµn
	EatSanqin(1, 60) --tam thanh hoµn
	EatLiushen(1, 60) --lôc thÇn hoµn
	SetTask(3105, GetTask(3105) + 60, 8)	--tô linh hoµn
end


-- Th­ëng tõng ¶i Th¸i H­
function ThaiHu_ThuongVuotAi()
	local tbAward1 = {
		[1] = {nCheckExp = 0, nExp = 2000000, nChankhi = 10},
		[2] = {nCheckExp = 0, nExp = 3000000, nChankhi = 20},
		[3] = {nCheckExp = 0, nExp = 3500000, nChankhi = 20},
		[4] = {nCheckExp = 0, nExp = 4000000, nChankhi = 20},
		[5] = {nCheckExp = 0, nExp = 4500000, nChankhi = 20},
		[6] = {nCheckExp = 0, nExp = 5000000, nChankhi = 30},
		[7] = {nDanhvong = 60, nSumon = 60, nChankhi = 40},
		[8] = {fn="RandThaiHuRing(8)", nExp = 7000000, nChankhi = 40},
	}
	local tbAward2 = {
		[1] = {nCheckExp = 0, nExp = 3000000, nChankhi = 15},
		[2] = {nCheckExp = 0, nExp = 4500000, nChankhi = 15},
		[3] = {nCheckExp = 0, nExp = 5250000, nChankhi = 25},
		[4] = {nCheckExp = 0, nExp = 6000000, nChankhi = 30},
		[5] = {nCheckExp = 0, nExp = 6750000, nChankhi = 30},
		[6] = {nCheckExp = 0, nExp = 7500000, nChankhi = 40},
		[7] = {nDanhvong = 90, nSumon = 90, nChankhi = 45},
		[8] = {fn="RandThaiHuRing(8)", nExp = 10500000,nChankhi = 50},
	}
	local nCountType = GetTaskTemp(104) -- Sè lÇn v­ît ¶i
	LIB_Award.szLogTitle = "Thai Hu Huyen Canh"
	LIB_Award.szLogAction = "nhËn"
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(0)
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local tbAward = tbAward1
		if mod(GetTask(TSK_THAIHU_DAY) ,100) > 1 then
			_vjw_SetTaixu()
			--===== nhiÖm vô Th¨ng TiÕn Phôc Sinh
			if TTPS_GetStatus() == 1 then
				VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH,1,6,6)
			end
			----------------------------------
			tbAward = tbAward2
		end
		if tbAward[nCountType] ~= nil then
			LIB_Award:Award(tbAward[nCountType])
		end
	end
	PlayerIndex = nOldPlayer
end


-- Random vßng th¸i h­ theo tû lÖ thiÕt kÕ
function RandThaiHuRing(nQty)	
	local tThaiHuRing = {
		[1] = {[1] = {item={{gdp={2,1,469,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - Cµn"}}}, nRate = 35},
		[2] = {[1] = {item={{gdp={2,1,470,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - Kh«n"}}}, nRate = 10},
		[3] = {[1] = {item={{gdp={2,1,471,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - Kh¶m"}}}, nRate = 10},
		[4] = {[1] = {item={{gdp={2,1,472,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - §oµi"}}}, nRate = 10},
		[5] = {[1] = {item={{gdp={2,1,473,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - Ly"}}}, nRate = 20},
		[6] = {[1] = {item={{gdp={2,1,474,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - ChÊn"}}}, nRate = 8},
		[7] = {[1] = {item={{gdp={2,1,475,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - CÊn"}}}, nRate = 6},
		[8] = {[1] = {item={{gdp={2,1,476,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - Tèn"}}}, nRate = 1},
	}
	LIB_Award.szLogTitle = "Thai Hu Huyen Canh"
	LIB_Award.szLogAction = "nhËn"
	for i = 1, nQty do
		LIB_Award:AwardByRate(tThaiHuRing)
	end
end


-- NhËn th­ëng Thiªn M«n TrËn
function ThienMonTran_NhanThuong(nType)
	------------------
	local tbBonus = {
		[0] = {item={{gdp={2,1,30340,1}, name="Méc R­¬ng"}}},
		[1] = {item={{gdp={2,1,30340,3}, name="Méc R­¬ng"}}},
		[2] = {item={{gdp={2,1,30340,6}, name="Méc R­¬ng"}}},
		[3] = {item={{gdp={2,1,30340,10}, name="Méc R­¬ng"}}},
		[4] = {item={{gdp={2,1,30340,14}, name="Méc R­¬ng"}}},
	}
	LIB_Award:Award(tbBonus[nType])
	--============= Chuçi nhiÖm vô Phôc Sinh 2 =====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 23 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
end

-- NhËn th­ëng Tµi Nguyªn ChiÕn
function TaiNguyenChien_NhanThuong(nType)
	_vjw_SetZyz()			
------------PhÇn th­ëng Hu©n Ch­¬ng Anh Hïng
	local tbHCAnhHung = 
		{
			[1] = {1},
			[2] = {2},
			[3] = {3},
			[4] = {0},
			[5] = {4},
		}
		gf_AddItemEx2({2,1,30499 ,  tbHCAnhHung[nType][1]}, "Hu©n Ch­¬ng Anh Hïng", "TAI NGUYEN CHIEN NEW LOG", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn nhËn th­ëng HCAH")
		Msg2Player("B¹n nhËn ®­îc "..tbHCAnhHung[nType][1].." Hu©n Ch­¬ng Anh Hïng")
------------
	local tbBonus = {
		[0] = {item={{gdp={2,1,30340,1}, name="Méc R­¬ng"}}},
		[1] = {item={{gdp={2,1,30340,2}, name="Méc R­¬ng"}}},
		[2] = {item={{gdp={2,1,30340,4}, name="Méc R­¬ng"}}},
		[3] = {item={{gdp={2,1,30340,6}, name="Méc R­¬ng"}}},
		[4] = {item={{gdp={2,1,30340,1}, name="Méc R­¬ng"}}}, -- Kh«ng sö dông qu©n c«ng
		[5] = {item={{gdp={2,1,30340,10}, name="Méc R­¬ng"}}}, -- VIP
	}
	LIB_Award:Award(tbBonus[nType])
	--============= Chuçi nhiÖm vô Phôc Sinh 2 =====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 24 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end

	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
end

function ThuHoachBatNhaLon()
	--============= Chuçi nhiÖm vô Phôc Sinh 2 =====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 11 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end

	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a	
end

function Use_Award_PhaoHoa()
	-----------------------Chuçi nhiÖm vô Phôc Sinh 2
	if PhucSinh2_CheckActive() == 1 then
		if PhucSinh2_GetDailyMission() == 1 and PhucSinh2_GetMissionPart() > 0 then
			PhucSinh2_SetMissionPart()
		end
	end
	
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a		
end

function TriQuocBinhThienHa_NhanThuong(nType)
	--Add nguyªn liÖu Event
	--do return 0 end
    	-----------------------NhiÖm vô hµng ngµy CTVL
    	if nType == 1 then
    		TriQuocBinhThienHa_NhanThuongCungTe()
    	elseif nType == 2 then
    		TriQuocBinhThienHa_NhanThuongTriAn()
    	elseif nType == 3 then
    		TriQuocBinhThienHa_NhanThuongThuyLoi()
    	elseif nType == 4 then
    		TriQuocBinhThienHa_NhanThuongLuyenDon()
    	end
end


function TriQuocBinhThienHa_NhanThuongCungTe()
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
end

function TriQuocBinhThienHa_NhanThuongTriAn()
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
end


function TriQuocBinhThienHa_NhanThuongThuyLoi()
	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
		STVN_SubMissionComplete(6)
	end
	
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
end

function TriQuocBinhThienHa_NhanThuongLuyenDon()
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
end


function ThitNuong_NhanThuong()
	--===== nhiÖm vô Th¨ng TiÕn Phôc Sinh
	if TTPS_GetStatus() == 1 then
		VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH,1,7,7)
	end
	----------------------------------	
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a	
end


function TongLieu_NhanThuong(nType)
	if nType == 1 then
		TongLieu_NhanThuongNongTrang()
	elseif nType == 2 then
		TongLieu_NhanThuongLuongThao()
	elseif nType == 3 then
		TongLieu_NhanThuongThanhTri()
	elseif nType == 4 then
		TongLieu_NhanThuongNhanMonQuan()
	end
	--===== nhiÖm vô Th¨ng TiÕn Phôc Sinh
	if TTPS_GetStatus() == 1 then
		VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH,1,8,8)
	end
	----------------------------------	
end


function TongLieu_NhanThuongNongTrang()

end


function TongLieu_NhanThuongLuongThao()

end


function TongLieu_NhanThuongThanhTri()

end


function TongLieu_NhanThuongNhanMonQuan()

end


function KichHoatBacDauDuongSinhThuat()

	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a

end


function HoanThanhNhiemVuLuongSonBac()
	-----------------------Chuçi nhiÖm vô §ång Hµnh
	if CFG_NhiemVuDongHanh == 1 then
		if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 26 then
			if mod(GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_1), 10) == 3 or mod(GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_2), 10) == 3  or mod(GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_3), 10) == 3  then
				if DongHanh_GetMissionPart() > 0 then
					DongHanh_SetMissionPart()
					if DongHanh_GetMissionPart() == 0 then
						DongHanh_SetStatus()
					end
				end
			end
		end
	end
end

function HoanThanhNhiemVuSuMon()
end

function VietCheckEvent()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 141107 and nDate <=141130 then
		return 1
	end
	return 0
end

--====phÇn th­ëng VBonus cho sö dông c¸c item
function VBonus_NuOa()
	if CheckVbonus() == 1 then
		ModifyExp(200000)
		Msg2Player("Tµi kho¶n cã kÝch ho¹t VBonus, ®­îc nhËn thªm 200.000 kinh nghiÖm.")
	end
end

function VBonus_BatNhaNho()
	if CheckVbonus() == 1 then
		ModifyExp(300000)
		Msg2Player("Tµi kho¶n cã kÝch ho¹t VBonus, ®­îc nhËn thªm 300.000 kinh nghiÖm.")
	end
end

function VBonus_HatGiong()
	if CheckVbonus() == 1 then
		ModifyExp(300000)
		Msg2Player("Tµi kho¶n cã kÝch ho¹t VBonus, ®­îc nhËn thªm 300.000 kinh nghiÖm.")
	end
end

function VBonus_CayTuLinh()
	if CheckVbonus() == 1 then
		ModifyExp(300000)
		Msg2Player("Tµi kho¶n cã kÝch ho¹t VBonus, ®­îc nhËn thªm 300.000 kinh nghiÖm.")
	end
end

function VBonus_LuckyStar()
	if CheckVbonus() == 1 then
		ModifyExp(250000)
		Msg2Player("Tµi kho¶n cã kÝch ho¹t VBonus, ®­îc nhËn thªm 250.000 kinh nghiÖm.")
	end
end

function VBonus_BatNhaLon()
	local tbFruite = {
		[1] = {"Nh·n" , 30164},			[2] = {"Ch«m Ch«m", 30165},		[3] = {"Cam", 30165},		[4] = {"Dõa", 30167},
		[5] = {"M¨ng Côt", 30168},		[6] = {"M·ng cÇu", 30179},			[7] = {"Khãm", 30180},	[8] = {"Lª", 30181},
		[9] = {"Bßn Bon", 30182},		 [10] = {"KhÕ", 30183},				[11] = {"B­ëi", 30169},	[12] = {"D©u", 30170},
		[13] = {"Chuèi", 30171},			[14] = {"Xoµi", 30172},				[15] = {"§µo", 30173},	[16] = {"MËn", 30174},
		[17] = {"V¶i", 30175},				[18] = {"T¸o", 30176},				[19] = {"B¬", 30177},		[20] = {"§u §ñ", 30178},
		}
	if CheckVbonus() == 1 then
		local nIndex = random(1,20)
		gf_AddItemEx2({2, 1, tbFruite[nIndex][2], 2}, tbFruite[nIndex][1], "NHAN THUONG VBONUS BK", "tr¸i c©y")
	end
end

function TTPS_GetStatus()
	local nStatus = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,1,1)
	return nStatus
end

--interface for viet----------
function _vjw_SetTaixu()
	if gf_GetPlayerRebornCount() < 6 or GetLevel() < 90 then
		return 0;
	end
	local nTimes = gf_GetMyTaskBit(TASKID_IB_ACT_WUZUN_TASK, 1, 2);
	if nTimes < 2 then
		gf_SetMyTaskBit(TASKID_IB_ACT_WUZUN_TASK, 1, 2, nTimes + 1, TASK_ACCESS_CODE_VJW);
		Msg2Player(format("NhiÖm vô kÝch ho¹t c¶nh giíi Vâ T«n: %s (%d/%d)", "Tham gia Th¸i H­ HuyÔn C¶nh", nTimes + 1, 2));
	end
end

function _vjw_SetZyz()
	if gf_GetPlayerRebornCount() < 6 or GetLevel() < 90 then
		return 0;
	end
	local nTimes = gf_GetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 5);
	if nTimes < 1 then
		gf_SetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 5, nTimes + 1, TASK_ACCESS_CODE_VJW);
		Msg2Player(format("NhiÖm vô kÝch ho¹t c¶nh giíi Vâ T«n: %s (%d/%d)", "Hoµn thµnh Tµi Nguyªn ChiÕn", nTimes + 1, 1));
	end
end
-------------------------------