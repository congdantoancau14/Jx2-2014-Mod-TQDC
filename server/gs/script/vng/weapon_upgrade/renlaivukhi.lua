Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>Häc trß thî rÌn L­u: <color>"
tbVuKhiNangCap = {
	[0] = {
		[0] = {
			[14] = {86,"ThÇn Quy", 0,0,15},
			[15] = {96,"¢m D­¬ng ¢n", 0,0,16},
		},
		[1] = {
			[53] = {86,"Khoa Phô", 0,1,54},
			[54] = {96,"Kh«ng Cã", 0,1,55},
		},
		[2] = {
			[36] = {86,"Häa ¶nh", 0,2,37},
			[37] = {96,"Nha Cöu", 0,2,38},
		},
		[3] = {
			[64] = {86,"LËu C¶nh", 0,3,65},
			[65] = {96,"NghÞch L©n", 0,3,66},
		},
		[4] = {
			[119] = {86,"Viªn §Ò", 0,4,120},
			[120] = {96,"B¸t X¹ Chi X¹", 0,4,121},
		},
		[5] = {
			[40] = {86,"Ngäc Trô", 0,5,41},
			[41] = {96,"ThÇn Ch©m", 0,5,42},
		},
		[6] = {
			[108] = {86,"Cöu Long Toµn KÝch", 0,6,109},
			[109] = {96,"Th­¬ng N«", 0,6,110},
		},
		[7] = {
			[12] = {86,"BÝch Thñy", 0,7,13},
			[13] = {96,"Thiªn T«n", 0,7,14},
		},
		[8] = {
			[97] = {86,"Môc KiÒn Liªn Tr­îng", 0,8,98},
			[98] = {96,"D­îc S­ Tr­îng", 0,8,99},
		},
		[9] = {
			[86] = {86,"Toan D­", 0,9,87},
			[87] = {96,"Th¸i H­", 0,9,88},
		},
		[10] = {
			[75] = {86,"§¹i Th¸nh Di ¢m", 0,10,76},
			[76] = {96,"Kh« Méc Long Ng©m", 0,10,77},
		},
		[11] = {
			[12] = {86,"V« NgÊn", 0,11,13},
			[13] = {96,"Thanh Long", 0,11,14},
		},
		[12] = {
			[12] = {86,"XÝch Tiªu", 0,12,13},
			[13] = {96,"UÈn H­¬ng", 0,12,14},
		},
		[13] = {
			[12] = {86,"Di T©m", 0,13,13},
			[13] = {96,"Hoan Linh", 0,13,14},
		},
	},
}

function OnPutinCheck(param, idx, genre, detail, particular)
	--local tbCheckList = GetPutinItem();
	if tbVuKhiNangCap[genre] == nil then
		Talk(1,"",szNpcName .. "Ta kh«ng nhËn rÌn lo¹i trang bÞ nµy, h·y ®­a ®óng lo¹i yªu cÇu nhÐ.")
		return 0
	end
	if tbVuKhiNangCap[genre][detail] == nil then
		Talk(1,"",szNpcName .. "Ta kh«ng nhËn rÌn lo¹i trang bÞ nµy, h·y ®­a ®óng lo¹i yªu cÇu nhÐ.")
		return 0
	end
	if tbVuKhiNangCap[genre][detail][particular] == nil then
		Talk(1,"",szNpcName .. "Ta kh«ng nhËn rÌn lo¹i trang bÞ nµy, h·y ®­a ®óng lo¹i yªu cÇu nhÐ.")
		return 0
	end
	if tbVuKhiNangCap[genre][detail][particular][1] == 86 then
		if GetEquipAttr(idx,2) < 7 then
			Talk(1,"",szNpcName .. "Trang bÞ ph¶i ®­îc c­êng hãa 7 trë lªn.")
			return 0
		end	
	elseif tbVuKhiNangCap[genre][detail][particular][1] == 96 then
		if GetEquipAttr(idx,2) < 10 then
			Talk(1,"",szNpcName .. "Trang bÞ ph¶i ®­îc c­êng hãa 10 trë lªn.")
			return 0
		end	
	end	
--	if GetEquipAttr(idx,2) < 11 then
--		Talk(1,"",szNpcName .. "Trang bÞ ph¶i ®­îc c­êng hãa 11 trë lªn.")
--		return 0
--	end
	return 1
end


function OnPutinComplete(param)
	if gf_JudgeRoomWeight(2,500) == 0 then
		Talk(1,"",szNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, ng­¬i h·y s¾p xÕp l¹i nhÐ!");
		return 0
	end
	local tbUpgradeList = GetPutinItem();
	local nG, nD, nP = tbUpgradeList[1][2], tbUpgradeList[1][3], tbUpgradeList[1][4]
	if tbVuKhiNangCap[nG][nD][nP] == nil then
		Msg2Player("Ta kh«ng cã vò khÝ thÝch hîp ®Ó ®æi cho c¸c h¹.")
		return 0
	end
	
	-------------------- Get option ID -------------------------------
	local nOp1, nLv1 = GetItemAttr(tbUpgradeList[1][1],1)
	local nOp2, nLv2 = GetItemAttr(tbUpgradeList[1][1],2)
	local nOp3, nLv3 = GetItemAttr(tbUpgradeList[1][1],3)
	
	-------------------- Check material ----------------------------
	local nNuOaTinhThach, nCuuThienVC = 3, 1
	if  tbVuKhiNangCap[nG][nD][nP][1] ~= 86 then
		nNuOaTinhThach, nCuuThienVC = 6, 2
	end
	if GetItemCount(2,1,504) < nNuOaTinhThach then
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã ®ñ "..nNuOaTinhThach.." N÷ Oa Tinh Th¹ch ta cÇn.")
		return 0
	end
	if GetItemCount(2,1,1006) < nCuuThienVC then
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã ®ñ "..nCuuThienVC.." Cöu Thiªn V« Cùc §¬n ta cÇn.")
		return 0
	end

--	Talk(1,"","Item ID: "..tbUpgradeList[1][1].."\nOption ID:\n" .. nOp1 .. " - " .. nLv1 .. "\n" .. nOp2 .. " - " .. nLv2 .. "\n" .. nOp3 .. " - " .. nLv3)

	LIB_Award.szLogTitle = "NANG CAP CAP DO VU KHI"
	LIB_Award.szLogAction = "thµnh c«ng"
	local tbNewItem = {item={{
			gdp={tbVuKhiNangCap[nG][nD][nP][3],tbVuKhiNangCap[nG][nD][nP][4],tbVuKhiNangCap[nG][nD][nP][5],1,1,nLv1, nOp1, nLv2, nOp2, nLv3, nOp3, -1, 7}, 
			name = tbVuKhiNangCap[nG][nD][nP][2]}}
		}
	if DelItem(2,1,504,nNuOaTinhThach) == 1 and DelItem(2,1,1006,nCuuThienVC) == 1 then
		DelItemByIndex(tbUpgradeList[1][1],-1)
		LIB_Award:Award(tbNewItem)
		Talk(1,"",szNpcName.."N©ng cÊp thµnh c«ng, h·y nhËn lÊy " .. tbVuKhiNangCap[nG][nD][nP][2] .. " cña ng­¬i.")
	else
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng ®ñ vËt phÈm yªu cÇu, kh«ng thÓ tiÕn hµnh n©ng cÊp.")
	end
	return 1
end
