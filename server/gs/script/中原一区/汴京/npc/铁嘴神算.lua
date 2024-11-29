
-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ìú×ìÉñËã½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");
Include("\\script\\online\\viet_event\\top_server\\npc_top.lua");

szNpcName =  "<color=green>ThÇy Bãi<color>: "
function main()	

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	local nDate = tonumber(date("%Y%m%d"))
	local tbSay = {}	
	
	if GetGlbValue(GLB_TSK_SERVER_ID) == 92 then
		if nDate >= 20141206 and nDate <= 20141207 then
			tinsert(tbSay, "Thµnh viªn nhËn th­ëng bang héi h¹ng 1,2,3/TopBangHoi_NhanThuong_ThanhVien")
			tinsert(tbSay,"Rêi khái/gf_DoNothing")
			Say(szNpcName.."Hç trî nhËn th­ëng ®ua top bang héi \n", getn(tbSay), tbSay)
		end
		
		if nDate > 20141207 then
			if (nState==11) then
				task_011();
				return
			else
				Talk(1,"","Gi¸p th©n mïng 5 th¸ng 1, kinh trËp, trêi l¹nh, cã ng­êi d­íi quª lªn, thÝch hîp c­íi hái, kþ thæ méc, h­íng ®«ng nam tèt!");
			end	
		end
	else		
		if (nState==11) then
			task_011();
			return
		else
			Talk(1,"","Gi¸p th©n mïng 5 th¸ng 1, kinh trËp, trêi l¹nh, cã ng­êi d­íi quª lªn, thÝch hîp c­íi hái, kþ thæ méc, h­íng ®«ng nam tèt!");
		end		
	end	
end;

function TopBangHoi_NhanThuong_ThanhVien()
	local tbNhanThuong = {
		"5§écxxLoveCuång",	
		"oLove§åS¸tVNGo",	
		"SãcLäLªnDame",	
		"StzHonDaCiVic",	
		"ZzCoiSieuNhanzZ",	
		"s2BêmCßi",	
		"oS2oMóaCét9x",	
		"TiÒnLongHáaPhông",	
		"TiªnLongHáaPhông",	
		"CXaVoTinhxxx",	
		"Kh«ngBiÕt§ÆtTªn",	
		"JaVoAnhThî§iÖnZ",	
		"VoDang1102",	
		"LinhSika",	
		"CloudofTsu",	
		"ZzCoiSieuNhanzZ",	
		"GiangHoLangTu",	
		"s2BêmCßi",	
		"StzHonDaCiVic",	
		"BçngV«T×nh",	
		"zzChuBizz",	
		"NSMxYeuStingRuaZ",	
		"zTuoiDayThio",	
		"Zz¤ngTr©u",	
		"zHiImGosu",	
		"GietNguoiKia",	
		"izCßiDJxTèc§éS2i",	
		"ThiªnS¬n§ångL·o",	
	}
	
	local bFound = 0
	for i = 1, getn(tbNhanThuong) do		
		if tbNhanThuong[i] == GetName() then	
			bFound = 1
			break
		end	
	end
	
	if bFound == 0 then
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã tªn trong danh s¸ch nhËn th­ëng!")
		return
	end
	
	if VNG_GetTaskPos(TSK_CONGHIENBANG,5,5) == 1 then
		Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn th­ëng, kh«ng thÓ nhËn thªm lÇn n÷a.")
		return 0
	end
	
	if gf_Judge_Room_Weight(15, 300) == 0 then
		Talk(1,"", szNpcName.."Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
		return 0
	end
	
	local nLevel = GetLevel();
	if nLevel <  90 then
		Talk(1,"",szNpcName.."§¼ng cÊp cña c¸c h¹ kh«ng ®ñ 90, kh«ng thÓ nhËn th­ëng!")
		return 0
	end
	
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a gia nhËp m«n ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	local tbAward1 = {
		item = {
			{gdp={2,1,30499,10}}, -- Hu©n ch­¬ng anh hïng
			{gdp={2,1,30535,20,4}}, -- ThiÕt tinh cÊp 3
			{gdp={2,1,1008,4,4}, nExpired=7*24*3600}, -- B¹ch C©u Tiªn §¬n
			{gdp={0,105,30027,1,4,-1,-1,-1,-1,-1,-1,-1}}, -- H¾c Hæ
		},
		nExp = 200000000,
	}
	
	LIB_Award:Award(tbAward1)
	VNG_SetTaskPos(TSK_CONGHIENBANG, 1, 5, 5)
	Talk(1,"",szNpcName.."NhËn thµnh c«ng phÇn t­ëng dµnh cho thµnh viªn bang héi!")
	gf_WriteLogEx("NHAN THUONG DUA TOP", "NhËn", 1, "PhÇn th­ëng thµnh viªn bang héi")
end