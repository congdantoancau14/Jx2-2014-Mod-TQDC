
--====Edit by PhucNG 28-01-2015=======

--Include("\\script\\online\\viet_event\\longhu\\head.lua");
Include("\\script\\online\\viet_event\\longhu\\prize.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 
Include("\\script\\vng\\lib\\vnglib_award.lua") 
Include("\\script\\online\\viet_event\\vng_task_control.lua") 
Include("\\script\\online\\chuyen_sinh\\translife_head.lua") 
szNPCName = "<color=green>Long Hæ Sø<color>: "
TASKTEMP_BHTA9 = 118

tbBangHoiTA13 = {
	[9] = {"*Mª*"},
	[24] = {"-NgùLong"},
	[62] = {"Huynh*§Ö"},
	[14] = {"•…†razy…"},
	[26] = {"s2T×nhCê"},
	[39] = {"°…BMT…°"},
	[50] = {"-§¹i ¦ng"},
	[1] = {"ÄTri•KØ"},
	[2] = {"§¹i§oµnÄ"},
	[22] = {"Holywar"},
}

tbVoteItems = {
	--PhucNG [1]=ID Item, [2]= Item Name, [3]= Vote Point, [4] = EXP
	[1] = {{2,1,30809,1}, "Ph¸o Hoa ChiÕn Th¾ng", 2, 0 },
	[2] = {{2,1,30810,1}, "Ph¸o Hoa Huy Hoµng", 2, 0 },
}

tbCCHH = {
	{1,800,"Ngò Hoa Tô Nguyªn T¸n(søc m¹nh)",{1,0,261,1},0},
	{1,800,"Ngò Hoa Tô Nguyªn T¸n (néi c«ng)",{1,0,262,1},0},
	{1,800,"Ngò Hoa Tô Nguyªn T¸n (g©n cèt)",{1,0,263,1},0},
	{1,800,"Ngò Hoa Tô Nguyªn T¸n (th©n ph¸p)",{1,0,264,1},0},
	{1,800,"Ngò Hoa Tô Nguyªn T¸n (nhanh nhÑn)",{1,0,265,1},0},
	{1,600,"ThÊt Hoa Tô Nguyªn T¸n (lùc c¨n)",{1,0,266,1},0},
	{1,600,"ThÊt Hoa Tô Nguyªn T¸n (lùc th©n)",{1,0,267,1},0},
	{1,500,"ThÊt Hoa Tô Nguyªn T¸n (lùc ®æng)",{1,0,268,1},0},
	{1,500,"ThÊt Hoa Tô Nguyªn T¸n (lùc néi)",{1,0,269,1},0},
	{1,500,"ThÊt Hoa Tô Nguyªn T¸n (néi c¨n)",{1,0,270,1},0},
	{1,500,"ThÊt Hoa Tô Nguyªn T¸n (néi th©n)",{1,0,271,1},0},
	{1,500,"ThÊt Hoa Tô Nguyªn T¸n (néi ®æng)",{1,0,272,1},0},
	{1,500,"ThÊt Hoa Tô Nguyªn T¸n (th©n c¨n)",{1,0,273,1},0},
	{1,500,"ThÊt Hoa Tô Nguyªn T¸n (th©n ®æng)",{1,0,274,1},0},
	{1,300,"B¸nh Ýt B¸t B¶o",{2,1,1123,1},0},
	{1,300,"B¸nh Ýt ch©n gµ",{2,1,1124,1},0},
	{1,300,"B¸nh Ýt H­¬ng Ng·i",{2,1,1125,1},0},	
	{1,200,"TÈy Tñy Linh §¬n",{2,0,137,1},30 * 24 *3600},
	{1,200,"B¸t B¶o TÈy Tñy §¬n",{2,0,138,1},30 * 24 *3600},
}


function jybh_check_skill_level()
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= 7 then
			return 1
		else
			return 0;
		end;
	end;
end;


function main()
	local nDate = tonumber(date("%Y%m%d"));
	local serverID = GetGlbValue(1023)
--	if nDate > 120415 then
--		Talk(1,"","<color=green>Long Hæ Sø<color>: Ho¹t ®éng Bang Héi Tinh Anh ®· kÕt thóc.");
--		return
--	end

--	if beadroll.tongName == "" then
--		beadroll:load()
--	end
	
	local tSel = {}
	-- if nDate <= 20140905 then
 		-- tinsert(tSel, "Nh¸nh miÒn B¾c - §¨ng ký thi ®Êu Long Tranh Hæ §Êu 3/FormDangKyTeamHN")
		-- tinsert(tSel, "Nh¸nh miÒn Nam - §¨ng ký thi ®Êu Long Tranh Hæ §Êu 3/FormDangKyTeamHCM")
 	-- end
-- 	if nDate <= 20140815 then
-- 		tinsert(tSel, "Ta muèn ®¨ng ký tranh tµi Long Tranh Hæ §Êu/ThiDauOffLine_DangKy_Form")
-- 	end
	-- if nDate == 20130605 then
		-- tinsert(tSel, "NhËn th­ëng kinh nghiÖm Bang Héi Tinh Anh/ExpBonusBHTA9")
	-- end
	
	--========== Nép Tinh Anh LÖnh Kú ==========--
	if nDate >= 20150510 and nDate <= 20150512 then
--		tinsert(tSel, "T×m hiÓu th«ng tin ®¨ng ký gi¶i ®Êu Bang Héi Tinh Anh	/#about(1)")
--		tinsert(tSel, "NhËn Tinh Anh LÖnh Kú/getFlags")
		tinsert(tSel, "Nép Tinh Anh LÖnh Kú/#giveFlag(1)")
		tinsert(tSel, "Nép Tinh Anh LÖnh Kú(Nguyªn so¸i)/#giveFlag(2)")
		tinsert(tSel, "Xem danh s¸ch ®¨ng ký thi ®Êu/viewList")
--		tinsert(tSel, "ÎÒÏëÁìÈ¡xxxx½±Àø/getAward")
	end
	
	--========== B×nh chän BHTA ==============--
	if nDate >= 20150423 and nDate <= 20150426 then
		tinsert(tSel,"B×nh chän Bang Héi Tinh Anh 13/BinhChonBHTA_CC_Form")
		tinsert(tSel,"Xem sè l­ît b×nh chän bang héi/ViewVote")
		-- tinsert(tSel,"B×nh chän bang héi gi¶i Siªu CÊp/BinhChonBHTA_SC_Form")
	end
--================ §¨ng ký BHTA
	if nDate >= 20150417 and nDate <= 20150420 then		
		tinsert(tSel,"§¨ng ký tham gia Bang Héi Tinh Anh 13/DangKyThamGiaBHTA_Form")
		tinsert(tSel,"Ta muèn xem t×nh h×nh b¸o danh Bang Héi Tinh Anh 13/DangKyThamGiaBHTA_view")		
	end
	
	tinsert(tSel, "Ta chØ ghÐ th¨m th«i!/nothing")

	Say("<color=green>Long Hæ Sø<color>: Ta chuyªn phô tr¸ch gi¶i ®Êu Bang Héi Tinh Anh 13, c¸c h¹ cÇn hái ta viÖc g×?", getn(tSel), tSel);

end


function DangKyThamGiaBHTA_Form()
	local szTong = GetTongName()
	local szTongLevel = GetTongLevel()
	local szAcc = GetAccount()
	local szRole = GetName()
	local nPhucSinh = GetPlayerRebornParam(0)
	local nPhe = "Tong"
	-- local tbAcc = {"mylinh1015","chipvitbietkhoc1990"}
	if GetTask(701) < 0 then
		nPhe = "Lieu"
	end
		
	if GetPlayerRoute() == 0 then
		Talk(1,"",szNPCName.."C¸c h¹ ch­a gia nhËp hÖ ph¸i.")
		return 0
	end
	
	if gf_CheckLevel(6,1) ~= 1 then
		Talk(1,"",szNPCName.."C¸c h¹ cÇn ®¹t Ýt nhÊt chuyÓn sinh 6 ®Ó ®¨ng ký tham gia Bang Héi Tinh Anh!")
		return
	end
	
	-- local nCheck = 0
	-- for i =1,2 do
		-- if szAcc == tbAcc[i] then
			-- nCheck = 1
		-- end
	-- end
	
	-- if nCheck == 0 then
		-- Talk(1,"",szNPCName.."C¸c h¹ kh«ng n»m trong danh s¸ch ®¨ng ký tham gia Tinh Anh Kú Héi!")
		-- return
	-- end	

	local nTongLevel = IsTongMember()
	if nTongLevel ~= 1 then
		Talk(1, "",szNPCName.."C¸c h¹ kh«ng ph¶i bang chñ. NÕu muèn ®¨ng ký tham gia, h·y mêi bang chñ c¸c h¹ ®Õn gÆp ta.");
		return 0
	end
	
	-- if GetTongLevel() < 5 then
		-- Talk(1,"",szNPCName.."Bang héi c¸c h¹ ch­a ®¹t ®Õn cÊp 5, kh«ng thÓ ®¨ng ký.")
		-- return 0
	-- end
	
	if gf_GetTaskByte(2280,1) ~= GetGlbValue(1023) then
		Talk(1,"",szNPCName.."C¸c h¹ kh«ng ph¶i thÇn d©n bæn quèc, kh«ng ®­îc ®¨ng ký tham gia.")
		return 0
	end
	
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if (nNow - nLastAssignTime) < 43200   then
		Talk(1,"",szNPCName.."Thêi gian t¹i vÞ cña c¸c h¹ Ýt h¬n 1 ngµy, kh«ng thÓ ®¹i diÖn bang héi ®¨ng ký.")
		return 0
	end
	
	LIB_txtData:Init("danhsachbhta13.txt")
	LIB_txtData:LoadMultiColumn()
	local nCheck = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheck = 1
			break
		end
	end
	
	if nCheck == 1 then
		Talk(1,"",szNPCName.."Bang héi c¸c h¹ ®· ®¨ng ký thµnh c«ng, kh«ng ®­îc ®¨ng ký thªm lÇn n÷a.")
		return 0
	end

	-- local szLogAward = szTong.."	"..szAcc.."	"..szRole.."	"..GetLevel().."	"..nPhucSinh.."	"..nPhe.."	"..date("%Y-%m-%d %H:%M:%S")
	-- local nResult = LIB_txtData:AddLine(szLogAward)
	-- Talk(1,"",szNPCName.."Bang héi c¸c h¹ b¸o danh Bang Héi Tinh Anh 13 thµnh c«ng, xin chóc mõng!")
	
	local tbSay = {}
	tinsert(tbSay, "Ta muèn b¸o danh tham gia vßng server/DangKyThamGiaBHTA_Confirm")
	tinsert(tbSay, "Ta muèn suy nghÜ thªm/gf_DoNothing")
	Say(szNPCName.."Gi¶i ®Êu Bang Héi Tinh Anh s¾p b¾t ®Çu khëi tranh, ®¹i hiÖp h·y nhanh chãng ®Õn b¸o danh cho bang héi cña m×nh !!!!", getn(tbSay), tbSay);
end


function DangKyThamGiaBHTA_Confirm()

	local szTong = GetTongName()
	local szTongLevel = GetTongLevel()
	local szAcc = GetAccount()
	local szRole = GetName()
	local nPhucSinh = GetPlayerRebornParam(0)
	local nPhe = "Tong"
	if GetTask(701) < 0 then
		nPhe = "Lieu"
	end
	-- if nOption > 1 then
		-- szGiai = "SIEUCAP"
	-- end
	
	if szTong == "" or szTong == nil then
		return 0
	end
	
	local tbMaterial = {
		[1] = {item={{gdp={2,1,539,10}, name="§¹i hång bao hoµng kim"}}},
		-- [2] = {item={{gdp={2,1,539,48}, name="§¹i hång bao hoµng kim"}}},
	}
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbMaterial[1])
	if nCheck == 0 then
		return 0
	end
	
	LIB_txtData:Init("danhsachbhta13.txt")
	LIB_txtData:LoadMultiColumn()
	local nCheck = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheck = 1
			break
		end
	end
	
	if nCheck == 1 then
		Talk(1,"",szNPCName.."Bang héi c¸c h¹ ®· ®¨ng ký thµnh c«ng, kh«ng ®­îc ®¨ng ký thªm lÇn n÷a.")
		return 0
	end
	LIB_Award:PayMaterial(tbMaterial[1])
	local szLogAward = szTong.."	"..szAcc.."	"..szRole.."	"..GetLevel().."	"..nPhucSinh.."	"..nPhe.."	"..date("%Y-%m-%d %H:%M:%S")
	local nResult = LIB_txtData:AddLine(szLogAward)
	Talk(1,"",szNPCName.."Bang héi c¸c h¹ b¸o danh BHTA 13 thµnh c«ng, xin chóc mõng.")
	AddGlobalNews("Chóc mõng bang héi "..szTong.." b¸o danh thµnh c«ng Bang Héi Tinh Anh 13.")
end


function DangKyThamGiaBHTA_view()
	local nTongLevel = IsTongMember() or 0
	local szTong = GetTongName()
	local nTongRegisgter = getn(LIB_txtData.tbTextData) or 0
	local tbSayDialog = szNPCName .. "HiÖn t¹i cã " .. nTongRegisgter .. " bang héi ®¨ng ký tham gia Bang Héi Tinh Anh 13 \n"
	if nTongLevel < 1 then
		Talk(1, "",szNPCName.."C¸c h¹ ch­a gia nhËp bang héi, kh«ng thÓ xem t×nh h×nh ®¨ng ký.");
		return 0
	end	
	
	LIB_txtData:Init("danhsachbhta13.txt")
	LIB_txtData:LoadMultiColumn()
	
	if (nTongRegisgter == nil or nTongRegisgter == 0) then
		Talk(1,"","HiÖn t¹i ch­a cã bang héi nµo ®¨ng ký tham gia")
	else
		for i = 1, nTongRegisgter do
			tbSayDialog = tbSayDialog .. LIB_txtData.tbTextData[i][1] .. ", "
		end
		Talk(1,"",tbSayDialog)
	end	

end


function show()
	local tSel = {}
	tinsert(tSel, "Xem kÕt qu¶ b×nh chän gi¶i Siªu CÊp/#show_list7(1)")
	tinsert(tSel, "Xem kÕt qu¶ b×nh chän gi¶i Cao CÊp/#show_list7(2)")

	Say("<color=green>Long Hæ Sø<color>: Ta chuyªn phô tr¸ch gi¶i ®Êu Bang Héi Tinh Anh, c¸c h¹ cÇn hái ta viÖc g×?", getn(tSel), tSel);	
end


function about(page)
	local msgs = {
		{
		"<color=green>Long Hæ Sø<color>: Tõ <color=yellow>20-10-2014 ®Õn hÕt 22-10-2014<color>, c¸c bang chñ cña bang héi ®¹i diÖn cho mçi côm m¸y chñ cã thÓ ®Õn gÆp Long Sø ®Ó nhËn 42 <color=red>Tinh Anh LÖnh Kú<color>.\n",
		"Bang chñ cã tr¸ch nhiÖm ph©n ph¸t <color=red>Tinh Anh LÖnh Kú<color>cho c¸c thµnh viªn tham gia gi¶i ®Êu Bang Héi Tinh Anh. C¸c thµnh viªn cña bang héi khi ®¨ng ký ph¶i cã Ýt nhÊt 1 <color=red>Tinh Anh LÖnh Kú<color> trong hµnh trang cña m×nh, vµ ph¶i gia nhËp Bang Ýt nhÊt 3 ngµy.\n",   
		},
		{
		"Chó ý: \n",
		" - ChØ cã bang chñ cña bang héi ®¹i diÖn cho mçi m¸y chñ míi cã thÓ nhËn Tinh Anh LÖnh Kú \n",                         
		" - Mçi bang héi chØ cã thÓ nhËn tèi ®a 42 Tinh Anh LÖnh Kú tõ Long Hæ Sø.\n",
		},                         
		{
		" - Mçi Tinh Anh LÖnh Kú lµ 1 tÊm vÐ ®Ó ®¨ng ký tham gia gi¶i ®Êu Bang Héi Tinh Anh. V× vËy, bang chñ ph¶i cã tr¸ch nhiÖm khi ph©n ph¸t Tinh Anh LÖnh Kú cho c¸c thµnh viªn tham gia thi ®Êu gi¶i\n",         
		" - Khi nép thµnh c«ng 1 Tinh Anh LÖnh Kú cho Long Hæ Sø, hÖ thèng sÏ tù ®éng ghi nhËn c¸c th«ng tin cña nh©n vËt\n",                
		" - Danh s¸ch nh©n vËt nép Tinh Anh LÖnh Kú lµ danh s¸ch ®¹i diÖn cho m¸y chñ tham gia thi ®Êu gi¶i Bang Héi Tinh Anh\n",                
		" - Mçi nh©n vËt chØ cã thÓ nép tèi ®a 1 Tinh Anh LÖnh Kú cho Long Hæ Sø.\n",                        
		},
	}
	local tCallback = {"#about(2)","#about(3)", "main"};
	local msg = "";
	for k,v in msgs[page] do
		msg = msg .. v;
	end
	Talk(1, tCallback[page], msg);
end

function getFlags()
	local szName = GetTongName() or ""
	local szAcc = GetAccount()
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	if tbBangHoiTA13[nServerID] == nil or tbBangHoiTA13[nServerID][1] ~= szName then
		Talk(1,"", szNPCName.."C¸c h¹ kh«ng thuéc danh s¸ch bang héi tham gia thi ®Êu!")
		Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn.")
		return 0
	end
	
	-- local tbAcc = {"mylinh1015","chipvitbietkhoc1990"}
	-- local nCheck = 0
	-- for i =1,2 do
		-- if szAcc == tbAcc[i] then
			-- nCheck = 1
		-- end
	-- end
	
	-- if nCheck == 0 then
		-- Talk(1,"",szNPCName.."C¸c h¹ kh«ng n»m trong danh s¸ch ®¨ng ký tham gia Tinh Anh Kú Héi!")
		-- return
	-- end	
	
	--Cã cïng quèc tÞch víi server?
	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= nServerID then
		Talk(1, "", szNPCName.."Bang chñ ph¶i cã cïng quèc tÞch server míi cã thÓ nhËn <color=red>Tinh Anh LÖnh Kú<color>")
		return
	end
	
	local nTongMember = IsTongMember()
	if nTongMember ~= 1 then
		Talk(1, "", szNPCName.."ChØ cã bang chñ cña bang héi ®¹i diÖn cho m¸y chñ míi cã thÓ nhËn <color=red>Tinh Anh LÖnh Kú<color>");
		Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn.")
		return 0
	end
	
	if gf_Judge_Room_Weight(2,300," ") ~= 1 then
		Talk(1,"",szNPCName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang!")
   		return 0
	end
	local nJoinTime = GetJoinTongTime();	
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	if nDayCount <  3 then
		Talk(1,"",szNPCName.."Thêi gian t¹i vÞ cña c¸c h¹ Ýt h¬n 3 ngµy, kh«ng thÓ nhËn Tinh Anh LÖnh Kú!")
		return 0
	end
	-- local nLastAssignTime = GetLastAssignTime()
	-- local nNow = GetTime()
	-- if (nNow - nLastAssignTime) < 604800   then
		-- Talk(1,"",szNPCName.."Thêi gian t¹i vÞ cña c¸c h¹ Ýt h¬n 7 ngµy, kh«ng thÓ nhËn Tinh Anh LÖnh Kú!")
		-- return 0
	-- end
	
	local nCountTALK = gf_GetTaskByte(TASK_BHTA6, BYTE_BHTA6_GET_TALK)
	if nCountTALK >= 42 then
		Talk(1,"",szNPCName.."Quý bang ®· nhËn ®ñ 42 Tinh Anh LÖnh Kú!")
		return 0
	end	
	
	gf_AddItemEx2({2,0,30000,1}, "Tinh Anh LÖnh Kú", "BHTA13", "nhËn", 3 * 24 * 3600)
	gf_SetTaskByte(TASK_BHTA6, BYTE_BHTA6_GET_TALK, nCountTALK + 1)
	main()
end

function giveFlag(nChoice)

	local szName = GetTongName() or ""
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	local szPhe = "Tong"
	
	if gf_CheckLevel(5,96) ~= 1 then
		Talk(1,"",szNPCName.."C¸c h¹ kh«ng ®ñ chuyÓn sinh 5 cÊp 96 ®Ó nép tinh anh lÖnh kú!")
		return
	end
	
	--Cã cïng quèc tÞch víi server?
	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= nServerID then
		Talk(1, "", szNPCName.."ChØ cã ng­êi cïng quèc tÞch míi cã thÓ nép <color=red>Tinh Anh LÖnh Kú<color>")
		return
	end
	
	--ë trong bang héi Ýt nhÊt 1 ngµy
	-- local nJoinTime = GetJoinTongTime();	
	-- local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	-- if nDayCount <  1 then
		-- Talk(1,"",szNPCName.."Thêi gian gia nhËp cña c¸c h¹ Ýt h¬n 1 ngµy, kh«ng thÓ nhËn Tinh Anh LÖnh Kú!")
		-- return 0
	-- end	
	
	--Get Phe Tong Lieu
	if GetTask(701) < 0 then
		szPhe = "Lieu"
	end
	--Check ®· ®¨ng ký ch­a
	if gf_GetTaskByte(TASK_BHTA6, 3) == 1 then
		Talk(1,"",szNPCName.."C¸c h¹ ®· ®¨ng ký råi, kh«ng thÓ ®¨ng ký thªm n÷a.")
		return 0
	end
	--Cã tinh anh lÖnh kú kh«ng?
	if GetItemCount(2,0,30000) == 0 then
		Talk(1,"",szNPCName.."C¸c h¹ lµ ai? Trong tay kh«ng cã Tinh Anh LÖnh Kú, chØ ®Õn xem n¸o nhiÖt ­?")
		return 0
	end
	--Cã trong danh s¸ch bang héi tham gia kh«ng?
	if tbBangHoiTA13[nServerID] == nil or tbBangHoiTA13[nServerID][1] ~= szName then
		Talk(1,"", szNPCName.."C¸c h¹ kh«ng thuéc danh s¸ch bang héi tham gia thi ®Êu!")
		return 0
	end
	
	-- local tbTongName = {"-NgùLong","S¸tThñ"}
	-- local nCheck = 0
	-- for i =1,2 do
		-- if szName == tbTongName[i] then
			-- nCheck = 1
		-- end
	-- end
	
	-- if nCheck == 0 then
		-- Talk(1,"", szNPCName.."C¸c h¹ kh«ng thuéc danh s¸ch bang héi tham gia thi ®Êu!")
		-- return
	-- end	
	
	-------------
	-- if jybh_check_skill_level() ~= 1 then
		-- Talk(1,"","<color=green>Long Hæ Sø<color>: C¸c h¹ ch­a ®ñ c¸c ®iÒu kiÖn cÇn thiÕt ®Ó tham gia gi¶i ®Êu Bang Héi Tinh Anh");
		-- return
	-- end	
	-------------
	
	--Check ®¨ng ký vµ sè l­îng ®· ®¨ng ký
	LIB_txtData:Init("BaoDanhBHTA13.txt")
	LIB_txtData:LoadMultiColumn()
	local nMember = 0
	local nRegCheck = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		nMember = nMember + 1
		if LIB_txtData.tbTextData[i][1] == GetAccount() then
			nRegCheck = 1
		end
	end
	if nRegCheck == 1 then
		Talk(1,"",szNPCName.."C¸c h¹ ®· cã tªn trong danh s¸ch thi ®Êu, kh«ng cÇn ®¨ng ký n÷a nhÐ.")
		return 0
	end
	if nMember >= 42 then
		Talk(1,"",szNPCName.."Ta ®· cã trong tay danh s¸ch 42 ng­êi tham dù, rÊt tiÕc c¸c h¹ ®· ®Õn trÔ...")
		return 0
	end
	
	--Check Sè l­îng hÖ ph¸i ®· ®¨ng ký
	local nHePhai = GetPlayerRoute()
	LIB_txtData:Init("CheckRouteBHTA13.txt")
	LIB_txtData:LoadData()
	local nRouteCount = LIB_txtData.tbTextData[tonumber(nHePhai )]
	if nRouteCount >= 5 then
		Talk(1, "", szNPCName.."§· ®ñ 5 cao thñ thuéc hÖ ph¸i nh­ c¸c h¹, kh«ng thÓ ®¨ng ký thªm!");
		return 0
	end
	
	--Check ®¨ng ký dµnh cho Nguyªn So¸i
	local nTeamSize = GetTeamSize()
	local nCountNguyenSoai = 0
	LIB_txtData:Init("BaoDanhBHTA13.txt")
	LIB_txtData:LoadMultiColumn()
	if nChoice == 2 then
----		Check so luong Nguyen Soai ®· ®¨ng ký
		for i = 1, getn(LIB_txtData.tbTextData) do
			if LIB_txtData.tbTextData[i][6] == "NguyenSoai" then
				nCountNguyenSoai = nCountNguyenSoai + 1
			end
		end
		
		if nCountNguyenSoai >= 2 then
			Talk(1,"",szNPCName.."Bang héi c¸c h¹ ®· ®¨ng ký ®ñ 2 Nguyªn So¸i.")
			return 0
		end
		
----		Check tæ ®éi víi bang chñ khi ®¨ng ký
		if nTeamSize > 3 then
			Talk(1,"",szNPCName.."Tæ ®éi chØ ®­îc tèi ®a 3 ng­êi víi tèi ®a 2 ng­êi së h÷u trang bÞ Nguyªn So¸i")
			return 0
		else
			if IsTongMaster() == 0 then
				local nOldIndex = PlayerIndex
				local nTongMaster = 0
				for i = 1, nTeamSize do
					PlayerIndex = GetTeamMember(i)
					if IsTongMaster() == 1 then
						nTongMaster = 1
						break
					end
				end
				PlayerIndex = nOldIndex
				
				if nTongMaster == 0 then
					Talk(1,"",szNPCName.."C¸c h¹ cÇn tæ ®éi víi bang chñ")
					return 0
				end		
			end
		end
	end	
	
	----------------------------------
	if DelItem(2,0,30000,1) == 1 then
		gf_SetTaskByte(TASK_BHTA6, 3, 1) -- Set ®· ®¨ng ký
		LIB_txtData:Init("CheckRouteBHTA13.txt")
		LIB_txtData:LoadData()
		LIB_txtData:AddValue(tonumber(nHePhai),1) -- Write log sè l­îng c¸c hÖ ph¸i
		
		LIB_txtData:Init("BaoDanhBHTA13.txt")
		LIB_txtData:LoadMultiColumn()
		
		local szData
		if nChoice == 1 then
			szData = GetTongName().."	".. GetAccount() .. "	" .. GetName() .. "	" .. GetPlayerRoute() .. "	" ..GetLevel().."	"..gf_GetPlayerRebornCount().."	".. szPhe .. "	".."Thuong"
		else
			szData = GetTongName().."	".. GetAccount() .. "	" .. GetName() .. "	" .. GetPlayerRoute() .. "	" ..GetLevel().."	"..gf_GetPlayerRebornCount().."	".. szPhe .. "	".."NguyenSoai"
		end
		
		LIB_txtData:AddLine(szData)
		local nRet, nItem = gf_AddItemEx({2,0,30001,1,1},"Vâ l©m thËp nhÞ sø");
		gf_SetItemExpireTime(nItem, 2015,06,06,24);		
		gf_WriteLogEx("BHTA13","nhan",1,"VolamThapNhiSu")
		Talk(1, "", szNPCName.."Chóc mõng ®¹i hiÖp ®· b¸o danh Bang Héi Tinh Anh lÇn 13 thµnh c«ng. H·y cè g¾ng lªn nhÐ!");
		Msg2Global("Chóc mõng ®¹i hiÖp "..GetName().." ®· b¸o danh Bang Héi Tinh Anh lÇn 13 thµnh c«ng.")
		AddGlobalNews("Chóc mõng ®¹i hiÖp <color=yellow>"..GetName().."<color> ®· b¸o danh <color=yellow>Bang Héi Tinh Anh lÇn 13<color> thµnh c«ng.")
	end
end

function viewList()
	local szTong = GetTongName()

	LIB_txtData:Init("BaoDanhBHTA13.txt")
	LIB_txtData:LoadMultiColumn()
	local szList = ""
	local nCount = 0
	for i=1, getn(LIB_txtData.tbTextData) do
			szList = szList .. LIB_txtData.tbTextData[i][3] .. ", "
			nCount = nCount + 1
	end
	Talk(1,"", szNPCName.."Bang héi <color=yellow>"..szTong.."<color> ®· ®¨ng ký <color=yellow>"..nCount.."<color> thµnh viªn gåm: "..szList)
end

--======================== Binh chon giai cao cap ========================
function BinhChonBHTA_CC_Form()
	local nW, nX, nY = GetWorldPos()
	if nW ~= 300 then
		Talk(1,"", szNPCName.."C¸c h¹ vui lßng ®Õn Thµnh §« b×nh chän nhÐ!")
		return 0
	end
	if GetLevel() < 79 then
		Talk(1,"", szNPCName.."CÊp ®é 79 míi ®­îc quyÒn b×nh chän, c¸c h¹ h·y phÊn ®Êu thªm nhÐ.")
		return 0
	end
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	local tbSay = {}
		
	tbSay[0] = szNPCName.."C¸c h¹ h·y b×nh chän bang héi ®¹i diÖn quèc gia tham gia thi ®Êu."
	if tbBangHoiTA13[nServerID] ~= nil then		
		tinsert(tbSay,"B×nh chän cho bang "..tbBangHoiTA13[nServerID][1].."/BinhChonBHTA_CC_Step2")		
	else
		tinsert(tbSay,"Kh«ng cã bang héi nµo ®¨ng ký tham gia/gf_DoNothing")
	end	
	
	gf_PageSay(tbSay, 1, 6);
end

function ViewVote()
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)

	LIB_txtData:Init("binhchonbhta13.txt")
	LIB_txtData:LoadMultiColumn()
	
	local nCount = LIB_txtData.tbTextData[1][2] or 0
	
	if tbBangHoiTA13[nServerID] ~= nil then
		Talk(1,"", szNPCName.."Bang héi "..tbBangHoiTA13[nServerID][1].." ®· cã "..nCount.." ®iÓm tÝch lòy ")
	else	
		Talk(1,"","Ch­a cã bang héi nµo ®­îc b×nh chän")
	end	
end

function BinhChonBHTA_CC_Step2()
	local nW, nX, nY = GetWorldPos()
	if nW ~= 300 then
		Talk(1,"", szNPCName.."C¸c h¹ vui lßng ®Õn Thµnh §« b×nh chän nhÐ!")
		return 0
	end
	
	local nServerID = GetGlbValue(1023)
	local tbSay = {}
	tinsert(tbSay, "Ph¸o Hoa ChiÕn Th¾ng: 2 ®iÓm/#BinhChonBHTA_Step3(1)")
	tinsert(tbSay, "Ph¸o Hoa Huy Hoµng: 2 ®iÓm/#BinhChonBHTA_Step3(2)")
	tinsert(tbSay, "Ta chØ ghÐ xem/gf_DoNothing")
	Say(szNPCName.."C¸c h¹ muèn b×nh chän cho bang "..tbBangHoiTA13[nServerID][1].." b»ng h×nh thøc nµo?", getn(tbSay), tbSay)
end

function BinhChonBHTA_Step3(nOption)
	local nItem = GetItemCount(tbVoteItems[nOption][1][1], tbVoteItems[nOption][1][2], tbVoteItems[nOption][1][3])
	local nMax = min(nItem, 100)
	if nMax > 0 then
		local szFunc = format("BinhChonBHTA_Step3_01_%d", nOption)
		AskClientForNumber(szFunc, 1, nMax, "Muèn bá vµo bao nhiªu c¸i?");
	else
		Talk(1,"",format("Kh«ng ®ñ %s ®Ó bá vµo", tbVoteItems[nOption][2]))
	end
end

function BinhChonBHTA_Step3_01_1(nNum)
	return BinhChonBHTA_Step3_Final(1,nNum)
end

function BinhChonBHTA_Step3_01_2(nNum)
	return BinhChonBHTA_Step3_Final(2,nNum)
end


function BinhChonBHTA_Step3_Final(nOption,nNum)
	local nVoteBHTA = GetTask(TSK_CUOCCHIENHOAHONG)
	if nVoteBHTA >= 1000 then
		Talk(1,"",szNPCName.."C¸c h¹ ®· b×nh chän ®ñ sè l­îng cña ngµy h«m nay. Xin vui lßng quay l¹i ngµy h«m sau ®Ó b×nh chän tiÕp")
		return 0
	end
	
	if (nVoteBHTA + nNum) > 1000 then
		Talk(1,"",szNPCName.."C¸c h¹ kh«ng thÓ nép qu¸ sè l­îng tèi ®a lµ 1000!")
		return
	end
	
	local nW, nX, nY = GetWorldPos()
	if nW ~= 300 then
		Talk(1,"", szNPCName.."C¸c h¹ vui lßng ®Õn Thµnh §« b×nh chän nhÐ!")
		return 0
	end

	local nServerID = GetGlbValue(1023)
	
	if type(tbVoteItems[nOption][1]) == "table" then
		if GetItemCount(tbVoteItems[nOption][1][1], tbVoteItems[nOption][1][2], tbVoteItems[nOption][1][3]) < (tbVoteItems[nOption][1][4] * nNum) then
			Talk(1,"",szNPCName.."C¸c h¹ kh«ng cã "..tbVoteItems[nOption][1][4].." "..tbVoteItems[nOption][2]..", h·y chuÈn bÞ ®ñ råi ®Õn ®©y nhÐ.")
			return 0
		end
--	elseif type(tbVoteItems[nOption][1]) == "number" then
--		if GetCash() < tbVoteItems[nOption][1]*10000 then
--			Talk(1,"",szNPCName.."C¸c h¹ kh«ng cã "..tbVoteItems[nOption][1].." vµng, h·y chuÈn bÞ ®ñ råi ®Õn ®©y nhÐ.")
--			return 0
--		end
	end
	
	if gf_Judge_Room_Weight(3,200," ") ~= 1 then
		Talk(1,"",szNPCName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang ®Ó tiÕp tôc b×nh chän!")
   		return 0
	end

	LIB_txtData:Init("binhchonbhta13.txt")
	if LIB_txtData:AddValue(1,tbVoteItems[nOption][3] * nNum) == 1 then
		if type(tbVoteItems[nOption][1]) == "table" then
			DelItem(tbVoteItems[nOption][1][1], tbVoteItems[nOption][1][2], tbVoteItems[nOption][1][3], tbVoteItems[nOption][1][4] * nNum)
			
			--Cuoc Chien Hoa Hong			
			local nTaskCCHH = GetTask(TSK_CUOCCHIENHOAHONG)
			for i = 1,nNum do
				SetTask(TSK_CUOCCHIENHOAHONG, GetTask(TSK_CUOCCHIENHOAHONG) + 1)
				nTaskCCHH = GetTask(TSK_CUOCCHIENHOAHONG)
				if mod(nTaskCCHH,10) == 0 then
					gf_EventGiveRandAward(tbCCHH,10000,7,"BinhChonBHTA13","NhanThuong")
				end
			end
			Msg2Player("Sè lÇn nép vËt phÈm lµ: "..nTaskCCHH)
--		else
--			Pay(tbVoteItems[nOption][1]*10000)
		ModifyExp(1000000 * nNum)
		Msg2Player("Bang héi "..tbBangHoiTA13[nServerID][1].." nhËn ®­îc "..(tbVoteItems[nOption][3] * nNum).." ®iÓm b×nh chän .")
		end	
	end
	
	BinhChonBHTA_CC_Step2(1)
end


function ExpBonusBHTA9()
	if GetExtPoint(2) == 0 then
		Talk(1,"",szNPCName .."C¸c h¹ kh«ng cã trong danh s¸ch nhËn th­ëng hoÆc ®· nhËn th­ëng råi.")
		return 0
	end
	local nExpBonus = tbExpBonusBHTA9[GetExtPoint(2)] or 0
	if nExpBonus > 0 then
		local tbAward = {nCheckExp = 0, nExp = nExpBonus}
		LIB_Award:Award(tbAward )
		PayExtPoint(2, GetExtPoint(2))
		gf_WriteLogEx("NHAN THUONG BHTA9", "nhËn thµnh c«ng", 1, "NhËn th­ëng BHTA9")
	end
end


function CheckRule()
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 3 then
		Talk(1,"","Tæ ®éi ph¶i cã ®óng 3 thµnh viªn, kh«ng h¬n kh«ng kÐm.")
		return 0
	end
	if GetItemCount(2,1,539) < 3 then
		Talk(1,"","Kh«ng cã ®ñ 3 Hoµng Kim §¹i Hång Bao.");
		return 0
	end
	local tbMember = {[1] = {}, [2] = {}, [3] = {}, [4]={}, [5]={}}
	local tbRoute = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	nOldPlayerIndex = PlayerIndex
	for i=1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		tbMember[i]["name"] = GetName()
		tbMember[i]["route"] = GetPlayerRoute()
		tbMember[i]["task"] = GetTask(TASK_LHTH)
		tbMember[i]["chuyensinh"] = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
		tbMember[i]["level"] = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT)*100 + GetLevel()
		tbRoute[GetPlayerRoute()] = tbRoute[GetPlayerRoute()] + 1
	end
	PlayerIndex = nOldPlayerIndex
	
	-- Check cac dieu kien dang ky
	for i=1, getn(tbRoute) do
		if tbRoute[i] > 1 then
			Talk(1,"","Tæ ®éi ph¶i cã 3 hÖ ph¸i kh¸c nhau míi ®­îc ®¨ng ký.");
			return 0
		end
	end

	for i=1, 3 do
		if tbMember[i]["route"] == 0 then
			Talk(1,"","Thµnh viªn " .. tbMember[i]["name"] .. " ch­a gia nhËp hÖ ph¸i.")
			return 0
		end
--		if tbMember[i]["task"] == 1 then
--			Talk(1,"","Thµnh viªn " .. tbMember[i]["name"] .. " ®· ®¨ng ký thi ®Êu råi.")
--			return 0
--		end
		if tbMember[i]["level"] < 396 then
			Talk(1,"","Thµnh viªn " .. tbMember[i]["name"] .. " kh«ng ®ñ ®iÒu kiÖn chuyÓn sinh vµ ®¼ng cÊp.")
			return 0
		end
--		if tbMember[i]["chuyensinh"] < 3  then
--			Talk(1,"","Thµnh viªn " .. tbMember[i]["name"] .. " kh«ng ®ñ ®iÒu kiÖn chuyÓn sinh.")
--			return 0
--		end
	end
	
	return 1
end


function  FormDangKyTeamHN()
	if GetName() ~= GetCaptainName() then
		Talk(1,"","ChØ ®éi tr­ëng míi ®­îc phÐp ®¨ng ký.")
		return 0
	end
	LIB_txtData:Init("longhotranhhung3all.txt")
	LIB_txtData:LoadMultiColumn()
	
	local nTeam = GetTeamSize()
	local nCheckMsg = 0
	local nJoint = 0
	local nOldPlayer = PlayerIndex
	for i=1, nTeam do
			PlayerIndex = GetTeamMember(i)
			local szAccount = GetAccount()
			for j = 1, getn(LIB_txtData.tbTextData) do
				if tostring(szAccount) == tostring(LIB_txtData.tbTextData[j][4]) or tostring(szAccount) == tostring(LIB_txtData.tbTextData[j][8]) or tostring(szAccount) == tostring(LIB_txtData.tbTextData[j][12]) then
					nCheckMsg = 1
				end
			end
			local tRoute = {[2] = 1, [4] = 1, [3] = 1, [6] = 1, [8] = 1, [9] = 1, [11] = 1, [12] = 1, [14] = 1, [15] = 1, [17] = 1, [18] = 1, [20] = 1, [21] = 1, [23] = 1, [29] = 1,[30] = 1,}
			local nRoute = GetPlayerRoute()
			if tRoute[nRoute] ~= 1 then
				nJoint = 1
			end
	end
	PlayerIndex = nOldPlayer
	if nCheckMsg == 1 then
		Talk(1, "", "Trong tæ ®éi cã thµnh viªn ®· ®¨ng ký tham gia råi")
		return 0
	end	
	if nJoint == 1 then
		Talk(1, "", "Trong tæ ®éi cã thµnh viªn ch­a gia nhËp hÖ ph¸i")
		return 0
	end	
	-- Dang ky
	if CheckRule() == 1 then
		AskClientForString("KiemTraDangKyHN","Tªn ®éi.",2,32,"Tªn ®éi: (2-32 ký tù)");
	end
end


function KiemTraDangKyHN(szTeamName)

	if LIB_txtData:CheckString(szTeamName) > 0 then
		Talk(1,"","Tªn ®éi chØ ®­îc chøa c¸c ký tù tõ A ®Õn Z (®­îc phÐp c¶ ch÷ hoa & ch÷ th­êng) vµ ch÷ sè tõ 0 ®Õn 9.")
		return 0
	end
	
	LIB_txtData:Init("longhotranhhung3all.txt")
	LIB_txtData:LoadMultiColumn()
	
	for i = 1, getn(LIB_txtData.tbTextData) do
		if tostring(szTeamName) == tostring(LIB_txtData.tbTextData[i][2]) then
			Talk(1,"","Tªn ®éi " .. szTeamName .. " ®· cã ng­êi ®¨ng ký.")
			return 0
		end
	end

	local szLocation = "HN"
	if CheckRule() == 1 then
		if DelItem(2,1,539,3) ~= 1 then
			Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ 3 Hoµng Kim §¹i Hång Bao !!!")
			return 0
		end
		local szData = GetGlbValue(1023) .. "	" .. szTeamName .. "	" .. date("%Y%m%d%H%M%S") .. "	"
		local nTeam = GetTeamSize()
		nOldPlayer = PlayerIndex
		for i=1, nTeam do
			PlayerIndex = GetTeamMember(i)
--			SetTask(TASK_LHTH,1)
			szData = szData .. GetAccount() .. "	" .. GetName() .. "	" .. GetPlayerRoute() .. "	" .. szLocation .. "	"
			Talk(1,"","§¨ng ký nh¸nh MiÒn B¾c thµnh c«ng, c¸c h¹ ®· lµ thµnh viªn cña ®éi " .. szTeamName)
		end
		PlayerIndex = nOldPlayer
		LIB_txtData:AddLine(szData)
	end
end

function  FormDangKyTeamHCM()
	if GetName() ~= GetCaptainName() then
		Talk(1,"","ChØ ®éi tr­ëng míi ®­îc phÐp ®¨ng ký.")
		return 0
	end
	LIB_txtData:Init("longhotranhhung3all.txt")
	LIB_txtData:LoadMultiColumn()
	
	local nTeam = GetTeamSize()
	local nCheckMsg = 0
	local nJoint = 0
	local nOldPlayer = PlayerIndex
	for i=1, nTeam do
			PlayerIndex = GetTeamMember(i)
			local szAccount = GetAccount()
			for j = 1, getn(LIB_txtData.tbTextData) do
				if tostring(szAccount) == tostring(LIB_txtData.tbTextData[j][4]) or tostring(szAccount) == tostring(LIB_txtData.tbTextData[j][8]) or tostring(szAccount) == tostring(LIB_txtData.tbTextData[j][12]) then
					nCheckMsg = 1
				end
			end
			local tRoute = {[2] = 1, [4] = 1, [3] = 1, [6] = 1, [8] = 1, [9] = 1, [11] = 1, [12] = 1, [14] = 1, [15] = 1, [17] = 1, [18] = 1, [20] = 1, [21] = 1, [23] = 1, [29] = 1,[30] = 1,}
			local nRoute = GetPlayerRoute()
			if tRoute[nRoute] ~= 1 then
				nJoint = 1
			end	
	end
	PlayerIndex = nOldPlayer	
	if nCheckMsg == 1 then
		Talk(1, "", "Trong tæ ®éi cã thµnh viªn ®· ®¨ng ký tham gia råi")
		return 0
	end	
	if nJoint == 1 then
		Talk(1, "", "Trong tæ ®éi cã thµnh viªn ch­a gia nhËp hÖ ph¸i")
		return 0
	end	
	-- Dang ky
	if CheckRule() == 1 then
		AskClientForString("KiemTraDangKyHCM","Tªn ®éi.",2,32,"Tªn ®éi: (2-32 ký tù)");
	end
end


function KiemTraDangKyHCM(szTeamName)
	if LIB_txtData:CheckString(szTeamName) > 0 then
		Talk(1,"","Tªn ®éi chØ ®­îc chøa c¸c ký tù tõ A ®Õn Z (®­îc phÐp c¶ ch÷ hoa & ch÷ th­êng) vµ ch÷ sè tõ 0 ®Õn 9.")
		return 0
	end
	
	LIB_txtData:Init("longhotranhhung3all.txt")
	LIB_txtData:LoadMultiColumn()
	
	for i = 1, getn(LIB_txtData.tbTextData) do
		if tostring(szTeamName) == tostring(LIB_txtData.tbTextData[i][2]) then
			Talk(1,"","Tªn ®éi " .. szTeamName .. " ®· cã ng­êi ®¨ng ký.")
			return 0
		end
	end

	local szLocation = "HCM"
	if CheckRule() == 1 then
		if DelItem(2,1,539,3) ~= 1 then
			Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ 3 Hoµng Kim §¹i Hång Bao !!!")
			return 0
		end
		local szData = GetGlbValue(1023) .. "	" .. szTeamName .. "	" .. date("%Y%m%d%H%M%S") .. "	"
		local nTeam = GetTeamSize()
		nOldPlayer = PlayerIndex
		for i=1, nTeam do
			PlayerIndex = GetTeamMember(i)
--			SetTask(TASK_LHTH,1)
			szData = szData .. GetAccount() .. "	" .. GetName() .. "	" .. GetPlayerRoute() .. "	" .. szLocation .. "	"
			Talk(1,"","§¨ng ký nh¸nh MiÒn Nam thµnh c«ng, c¸c h¹ ®· lµ thµnh viªn cña ®éi " .. szTeamName)
		end
		PlayerIndex = nOldPlayer
		LIB_txtData:AddLine(szData)
	end
end

function ThiDauOffLine_DangKy_Form()
	local tbSay = {}
	tinsert(tbSay, "Ta muèn ®¨ng ký ®Êu t¹i Hµ Néi/#ThiDauOffLine_DangKy(1)")
	tinsert(tbSay, "Ta muèn ®¨ng ký ®Êu t¹i thµnh phè Hå ChÝ Minh/#ThiDauOffLine_DangKy(2)")
	tinsert(tbSay, "Ta chØ ghÐ xem/gf_DoNothing")
	Say(szNPCName.."Gi¶i ®Êu lÇn nµy chia lµm 2 khu vùc Hµ Néi vµ Thµnh phè Hå ChÝ Minh. C¸c h¹ h·y chän ®Þa ®iÓm phï hîp víi c¸c h¹.", getn(tbSay), tbSay)
end

function ThiDauOffLine_DangKy(nOption)
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) + GetPlayerRebornParam(0);
	local nLevel = nChuyenSinh*100 + GetLevel()
	local nRoute = GetPlayerRoute()
	local szAccount = GetAccount()
	local szLocation = "HN"
	if nOption ~= 1 then
		szLocation = "HCM"
	end
--	if nRoute ~= 23 then
--		Talk(1,"",szNPCName.."Ta rÊt tiÕc, gi¶i ®Êu nµy chØ dµnh riªng cho hÖ ph¸i C«n L«n Thiªn S­.")
--		return 0
--	end
	if nLevel < 93 then
		Talk(1,"",szNPCName.."C¸c h¹ ch­a ®ñ cÊp ®é trïng sinh hoÆc ®¼ng cÊp, h·y cè g¾ng thªm.")
		return 0
	end
	if GetItemCount(2,1,30230) < 3000 then
		Talk(1,"",szNPCName.."Ta cÇn 3000 xu vËt phÈm lµm tin, c¸c h¹ h·y chuÈn bÞ ®ñ nhÐ.")
		return 0
	end
	LIB_txtData:Init("offlineconlon.txt")
	LIB_txtData:LoadMultiColumn()
	for i = 1, getn(LIB_txtData.tbTextData) do
		if tostring(szAccount) == tostring(LIB_txtData.tbTextData[i][1]) then
			Talk(1,"","C¸c h¹ ®· cã tªn trong danh s¸ch, kh«ng cÇn ®¨ng ký n÷a.")
			return 0
		end
	end
	if DelItem(2,1,30230,3000) == 1 then
		local szData = szAccount .. "	" .. GetName() .. "	" .. GetGlbValue(1023) .. "	" .. GetLevel().."	" .. nChuyenSinh.."	" .. date("%Y%m%d%H%M%S").."	"..szLocation
		LIB_txtData:AddLine(szData)
		Talk(1,"",szNPCName.."§¨ng ký thµnh c«ng, c¸c h¹ vui lßng chê th«ng b¸o kÕt qu¶.")
	end
end

function nothing()
end
