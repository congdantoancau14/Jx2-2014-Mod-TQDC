-- Event �ua top
-- Created by TuanNA5
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\newserver\\topbanghoi.lua");
Include("\\script\\vng\\newserver\\hoatdong.lua");

strNpcName = "<color=green>H�a Ph�ng<color>: "
szLogTitle = "Top B�ch H�"
szStartDate = "01-01-2020"
szEndDate = "01-06-2020"
szServerName = "B�ch H�"

function main()
	local nDate = tonumber(date("%Y%m%d"))
	
--	if GetCreateTime() <= TOP_CREATED_ROLE then
--		Talk(1,"",strNpcName.."Th�i gian t�o t�i kho�n kh�ng h�p l� n�n kh�ng th� nh�n th��ng!")
--		return
--	end

	--if GetGlbValue(GLB_TSK_SERVER_ID) ~= TOP_SERVER_ID or GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR) ~= TOP_SERVER_ID then
		--Talk(1,"",strNpcName.."Ng��i kh�ng ph�i th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		--return
	--end
	local tSay = {}
	if nDate >= TOP_START_DATE and nDate <= TOP_END_DATE then
		tinsert(tSay,"Nh�n ph�n th��ng 3 nh�n s� ��u ti�n m�i phe ��t 860.000 c�ng tr�ng (Set L�i H� T��ng Qu�n + 1 B�ch Khu�)/confirm_get_top_Hornor_award");
		tinsert(tSay,"Nh�n th��ng cao th� ��u ti�n ��t 1.400.000 �i�m c�ng tr�ng  (Set L�i H� Nguy�n So�i + 1 Chi�n T��ng)/confirm_get_1mil_Hornor_award");
		tinsert(tSay,"Nh�n ph�n th��ng cao th� TOP 1 m�i H� Ph�i (Set Thi�n H� V� Song + C�p Huy Ho�ng Vinh D� + H�c Chi�n Ngh�)/get_top_faction_award");
		tinsert(tSay,"\n�ua TOP Bang H�i/TopBangHoi_Menu")
	end
	tinsert(tSay,"\nXem t�nh h�nh nh�n th��ng TOP 1 H� Ph�i/get_top_faction_info")
	tinsert(tSay,"Xem t�nh h�nh nh�n th��ng TOP 3 C�ng Tr�ng/get_top_nation_info")
	--tinsert(tSay,"Ph�t th��ng bang h�i/PhatThuongBangHoi")
	tinsert(tSay,"Ta bi�t r�i/dlgover")	
	
	if nDate >= TOP_START_DATE then
		local strSay = strNpcName.."Ho�t ��ng <color=yellow>�ua TOP<color> �ang di�n ra ��n <color=red> 24:00 "..szEndDate.."<color>. Trong th�i gian n�y, qu� ��ng ��o c� th� ��n g�p ta �� nh�n c�c ph�n th��ng h�p d�n."
		Say(strSay,getn(tSay),tSay)
	end
end

---- Nh�n th��ng top chuy�n sinh theo m�n ph�i  ----------
function get_top_faction_award()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= TOP_START_DATE and nDate <= TOP_END_DATE then	
		Say(strNpcName.."Nh�n ph�n th��ng cao th� ho�n th�nh <color=red>Chuy�n sinh 7 c�p 96<color> ��u ti�n trong H� Ph�i",
			2,
			"Ta mu�n nh�n/confirm_get_top_faction_award",
			"�� ta suy ngh� l�i./dlgover");
	else
		Talk(1,"",strNpcName.."Ho�t ��ng �� k�t th�c!")
	end
end

--- Nh�n th��ng top 1 h� ph�i ----
function confirm_get_top_faction_award()
	-- Dieu kien nhan thuong
	local nMonPhai = GetPlayerRoute()
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = abs(GetTask(701));
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) + GetPlayerRebornParam(0)
	local tbRoute = {[2]=1,[3]=1,[4]=1,[6]=1,[8]=1,[9]=1,[11]=1,[12]=1,[14]=1,[15]=1,[17]=1,[18]=1,[20]=1,[21]=1,[23]=1,[25]=1,[26]=1,[27]=1,[29]=1,[30]=1}
	
	LIB_txtData:Init("top_route.txt")
	LIB_txtData:LoadData()
	local nFactionRank = LIB_txtData.tbTextData[tonumber(nMonPhai)]
	if nFactionRank >= 1 then
		Talk(1, "", strNpcName.."Ph�n th��ng n�y �� c� ch� nh�n");
		return	
	end

	if nNationality ~= nNation then
		Talk(1, "", strNpcName .. "C�c h� kh�ng ph�i l� th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return 0
	end
	
	if tbRoute[nMonPhai] ~= 1 then
		Talk(1,"",strNpcName .. "C�c h� ch�a ch�n h� ph�i n�n kh�ng th� nh�n th��ng.")
		return 0
	end
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_TRANSLIFE1) == 1 then
		Talk(1, "", strNpcName.."C�c h� �� nh�n ph�n th��ng TOP 1 theo h� ph�i r�i.");
		return 0
	end
	
	if nChuyenSinh < 7 then
		Talk(1,"",strNpcName .. "Hi�n t�i C�c h� ch�a ho�n Ph�c sinh 2")
		return 0
	end
	
	if GetLevel() < 96 then
		Talk(1, "", strNpcName .. "C�c h� h�y ph�n ��u l�n c�p �� 96 r�i quay l�i nh�.");
		return 0
	end
	
	if nRep < 20000 or nFaction < 20000 or nHor < 500000  then
		Talk(1, "", strNpcName.."C�c h� ch�a �� �i�u ki�n nh�n th��ng. Vui l�ng ki�m tra �i�u ki�n 20.000 danh v�ng, 20.000 s� m�n, 500.000 c�ng tr�ng.");
		return 0
	end

	if GetItemCount(2,1,30230) < 5000 then
		Talk(1,"",strNpcName .. "C�c h� kh�ng �em �� 5000 xu v�t ph�m.")
		return 0
	end

	if gf_Judge_Room_Weight(8, 300, strNpcName) == 0 then
		Talk(1,"",strNpcName .. "H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang.")
		return
	end
	
	
	if LIB_txtData:AddValue(tonumber(nMonPhai),1,5) == 1 then
		LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
		LIB_Award.szLogAction = "nh�n"
		-- Bit 1 nh�n ph�n th��ng chuy�n sinh 1
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_TRANSLIFE1,1)
		local nItemLevel = 0
		DelItem(2,1,30230,5000)
--		if nFactionRank == 0 then
			local tbAward = {
				item = {
						{gdp={0,102,30037,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "Huy Ho�ng"}, 
						{gdp={0,102,30038,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "Vinh D�"}, 
						{gdp={0,105,203,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "Kim Gi�c Chi�n Ngh�"}}
			}
			
			local nBodyVSCT 	= 30207 + GetBody() - 1;
			AddItem(0, 103, nBodyVSCT, 1,1, -1,-1,-1,-1,-1,-1,1,0);
			AddItem(0, 101, nBodyVSCT, 1,1, -1,-1,-1,-1,-1,-1,1,0);
			AddItem(0, 100, nBodyVSCT, 1,1, -1,-1,-1,-1,-1,-1,1,0);
			
			TraoMatTichCaoCap20(3, nMonPhai);
			
			LIB_Award:Award(tbAward)
--		end
		Talk(1,"","Nh�n th�nh c�ng ph�n th��ng h�ng "..(nFactionRank+1).." m�n ph�i "..tb_Route_Name[tonumber(nMonPhai)] .. ".")
	end
end


-- Nh�n th��ng top c�ng tr�ng
function confirm_get_top_Hornor_award()
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = GetTask(701);
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	
	local nTongLieu = 1
	if nHor < 0 then
		nTongLieu = 2
	end
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	
	if nNationality ~= nNation then
		Talk(1, "", strNpcName.."C�c h� kh�ng ph�i l� th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return 0
	end
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_HORNOR) == 1 then
		Talk(1, "", strNpcName.."C�c h� �� nh�n ph�n th��ng TOP 3 c�ng tr�ng chi�n tr��ng r�i.");
		return	
	end
	
	LIB_txtData:Init("top_nation.txt")
	LIB_txtData:LoadData()
	local nNationRank = LIB_txtData.tbTextData[tonumber(nTongLieu)]
	if nNationRank >= 3 then
		Talk(1, "", strNpcName.."Ph�n th��ng 3 cao th� ��u ti�n c�ng tr�ng ��t 860.000 �� c� ch� nh�n");
		return	
	end
	
	if nPhucSinh < 1 or GetLevel() < 96 then
		Talk(1, "", strNpcName.."C�c h� ch�a �� �i�u ki�n  <color=red>Chuy�n sinh 6 c�p 96<color>")
		return 0
	end
	
	if nRep < 15000 or nFaction < 15000 or abs(nHor) < 860000  then
		Talk(1, "", strNpcName.."C�c h� ch�a �� �i�u ki�n nh�n th��ng. Vui l�ng ki�m tra �i�u ki�n 15.000 danh v�ng, 15.000 s� m�n, 860.000 c�ng tr�ng.");
		return 0
	end
	
	if abs(GetTask(704)) < 5 then
		Talk(1,"",strNpcName.."C�c h� ch�a �� �i�u ki�n nh�n thu�ng. Qu�n H�m c�n <color=red>T��ng Qu�n<color>");
		return
	end
	
	if GetItemCount(2,1,30230) < 5000 then
		Talk(1,"", strNpcName.."C�c h� kh�ng �em �� <color=red>5000<color> xu v�t ph�m")
		return
	end
	
	if gf_Judge_Room_Weight(15, 300, strNpcName) == 0 then
		Talk(1,"", strNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang.")
		return
	end
	
	if LIB_txtData:AddValue(tonumber(nTongLieu),1,3) == 1 then
		DelItem(2,1,30230,5000)
		LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
		LIB_Award.szLogAction = "nh�n"
		--Bit 1 nh�n ph�n th��ng top c�ng tr�ng
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_HORNOR,1)
		TraoLoiHoTuongQuan(0);
		AddItem(0,105,191,1,1,-1,-1,-1,-1,-1,-1,1,0);
		Talk(1,"","Nh�n th�nh c�ng ph�n th��ng h�ng "..(nNationRank+1).." c�ng tr�ng phe "..tb_Nation_Name[tonumber(nTongLieu)]..".")
	end
end


-- Nh�n th��ng top 1.400.000 c�ng tr�ng
function confirm_get_1mil_Hornor_award()
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = GetTask(701);
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	
	local nTongLieu = 1
	if nHor < 0 then
		nTongLieu = 2
	end
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	
	if nNationality ~= nNation then
		Talk(1, "", strNpcName.."C�c h� kh�ng ph�i l� th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return 0
	end
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_1MIL_HORNOR) == 1 then
		Talk(1, "", strNpcName.."C�c h� �� nh�n ph�n th��ng 1.400.000  c�ng tr�ng chi�n tr��ng r�i.");
		return	
	end
	
	LIB_txtData:Init("top_1milhornor.txt")
	LIB_txtData:LoadData()
	
	local nNationRank = 0
	for i = 1, 2 do
		nNationRank = LIB_txtData.tbTextData[tonumber(i)]
		if nNationRank == 1 then
			break
		end
	end
	
	if nNationRank >= 1 then
		Talk(1, "", strNpcName.."Ph�n th��ng n�y �� c� ch� nh�n!");
		return	
	end
	
	if nPhucSinh < 1 or GetLevel() < 99 then
		Talk(1, "", strNpcName.."C�c h� ch�a ��t Chuy�n sinh 6 c�p 99, h�y c� g�ng th�m.");
		return 0
	end
	
	if nRep < 20000 or nFaction < 20000 or abs(nHor) < 1400000  then
		Talk(1, "", strNpcName.."C�c h� ch�a �� �i�u ki�n nh�n th��ng. Vui l�ng ki�m tra �i�u ki�n 20.000 danh v�ng, 20.000 s� m�n, 1.400.000 c�ng tr�ng.");
		return 0
	end
	
	if abs(GetTask(704)) < 6 then
		Talk(1,"",strNpcName.."C�c h�, ph�n th��ng n�y ch� ���c trao t�ng cho Nguy�n So�i, C�c h� h�y c� g�ng th�m nh�...");
		return 0
	end
	
	if GetItemCount(2,1,30230) < 10000 then
		Talk(1,"", strNpcName.."C�c h� kh�ng �em �� 10.000 xu v�t ph�m, hay l� �� �� qu�n trong r��ng?")
		return 0
	end
	
	if gf_Judge_Room_Weight(15, 300, strNpcName) == 0 then
		Talk(1,"", strNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang.")
		return
	end
	
	if LIB_txtData:AddValue(tonumber(nTongLieu),1,1) == 1 then
		DelItem(2,1,30230,10000)
		LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
		LIB_Award.szLogAction = "nh�n"
		-- Bit 1 nh�n ph�n th��ng top c�ng tr�ng
		local tbChienTuong = {item = {{gdp={0,105,30033,1,4,-1,-1,-1,-1,-1,-1,-1}, name = "Chi�n T��ng Nguy�n So�i"}}}
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_1MIL_HORNOR,1)
		TraoLoiHoNguyenSoai(0)
		LIB_Award:Award(tbChienTuong)
		Talk(1,"","Nh�n th�nh c�ng ph�n th��ng 1.400.000 c�ng tr�ng")
	end
end

-- Xem th�ng tin top m�n ph�i
function get_top_faction_info()
	LIB_txtData:Init("top_route.txt")
	LIB_txtData:LoadData()
	local tSay = {}
	local szList = "Th�ng tin ph�n th��ng TOP <color=green>1<color> h� ph�i �� nh�n:"	
	local i = 0
	for i=1, getn(LIB_txtData.tbTextData) do
		if tb_Route_Name[i] ~= "" then
			tinsert(tSay, "Cao th� - "..tb_Route_Name[i]..": "..LIB_txtData.tbTextData[i])
		end
	end
	Say(szList,getn(tSay),tSay)
end

-- Xem th�ng tin top qu�n c�ng
function get_top_nation_info()
	LIB_txtData:Init("top_nation.txt")
	LIB_txtData:LoadData()
	--for i=1,getn(LIB_txtData.tbTextData) do
		--print(LIB_txtData.tbTextData[i])
	--end
	local szList = "Th�ng tin ph�n th��ng top 3 Vinh D� chi�n tr��ng: \n"	
	local i = 0
	for i=1, getn(LIB_txtData.tbTextData) do		
		szList = szList.."Cao th� phe <color=green>"..tb_Nation_Name[i].."<color>: "..LIB_txtData.tbTextData[i].."\n"
	end
	Talk(1,"",szList)	
end

function dlgover()
end

function PhatThuongBangHoi()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20130519 then
		Talk(1,"","Ch�a ��n ng�y trao th��ng, phi�n C�c h� ��i ��n 19-05-2013 nh�.")
		return 0
	end
	
	local nTongMember = IsTongMember();
	if nTongMember == 0 then
		Talk(1,"","Ph�n th��ng n�y ch� d�nh cho bang h�i, C�c h� h�y gia nh�p bang h�i tr��c �� nh�.")
		return 0
	end
		
	local nJoinTime = GetJoinTongTime();	
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	if nDayCount <  15 then
		Talk(1,"","Th�i gian gia nh�p c�a c�c h� �t h�n 15 ng�y, kh�ng th� nh�n th��ng n�y!")
		return 0
	end
	
	if gf_GetTaskBit(TSK_TOP_LEVEL, 21) == 1 then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng n�y r�i.")
		return 0
	end
	
	if gf_Judge_Room_Weight(25,2100) ~=1 then
		Talk(1,"","C�c h� c�n chu�n b� 25 � h�nh trang v� 2100 s�c l�c �� nh�n th��ng.")
		return 0
	end
	
	local szTongName = GetTongName()
	LIB_txtData:Init("banghoinhanthuong.txt")
	LIB_txtData:LoadMultiColumn();
	tbTenBang = LIB_txtData.tbTextData
	if tbTenBang[1] ~= nil and tbTenBang[1][1] ~= nil then
		if tbTenBang[1][1] ~= szTongName then
			Talk(1,"","Ph�n th��ng n�y �� trao cho bang ".. tbTenBang[1][1])
			return 0
		end
	else
		if GetTongPopuLadder() ~= 1 then
			Talk(1,"","Ph�n th��ng n�y ch� trao cho bang h�i x�p h�ng 1 nh�n kh�.")
			return 0
		end
		LIB_txtData:AddLine(szTongName)
	end
	
	LIB_Award.szLogTitle = "TOP BANG HOI "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	gf_SetTaskBit(TSK_TOP_LEVEL, 21, 1)
	local tbThuongBangHoi = {item = {
		{gdp={2,0,189,2003,1}, name = "Qu� Hoa T�u"},
		{gdp={2,1,1208,2,1}, name = "P_th��ng C�ng Th�nh (th�ng)"},
		{gdp={2,1,1210,20,1}, name = "B�o r��ng T�i nguy�n"},
		{gdp={0,105,33,1,4,-1,-1,-1,-1,-1,-1,-1}, name = "Ni�n Th�", nExpired = 90*24*60*60}
	}}
	LIB_Award:Award(tbThuongBangHoi)
end

--��ng K� Nh�n 100 CS
function CS_TopAward(nOption)
	local tbOps = {
		[1] = {nCS = 1, nBit = 22},
		[2] = {nCS = 2, nBit = 23},
		[3] = {nCS = 3, nBit = 24},
	}
	local nTongLieu = 0
	if GetTask(701) > 0 then
		nTongLieu = 1
	elseif  GetTask(701) < 0 then
		nTongLieu = 2
	end
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	if nChuyenSinh ~= tbOps[nOption]["nCS"] or GetLevel() < 99 then
		Talk(1,"",strNpcName.."�i�u ki�n chuy�n sinh ho�c ��ng c�p ch�a ��ng, kh�ng th� ��ng k� nh�n m�t t�ch.")
		return 0
	end
	
	if gf_GetTaskBit(TSK_TOP_LEVEL, tbOps[nOption]["nBit"]) == 1 then
		Talk(1,"","C�c h� �� ��ng k� nh�n ph�n th��ng n�y r�i.")
		return 0
	end
	
	LIB_txtData:Init("soluongphanthuong.txt")
	LIB_txtData:LoadData()
	local nAward = LIB_txtData.tbTextData[tonumber(nOption)]
	if nAward >= 100 then
		Talk(1, "", strNpcName.."�� c� �� 100 cao th� ��ng k� nh�n ph�n th��ng n�y, c�c h� h�y c� g�ng chi�m ph�n th��ng kh�c nh�!");
		return 0
	end
	
	if LIB_txtData:AddValue(tonumber(nOption),1,100) == 1 then
		gf_SetTaskBit(TSK_TOP_LEVEL, tbOps[nOption]["nBit"], 1)
		LIB_txtData:Init("danhsachnhanthuong.txt")
		local szLogAward = GetAccount().."	"..GetName().."	"..GetPlayerRoute().."	"..nTongLieu.."	"..nChuyenSinh.."	TOPCS"..nOption.."	"..date("%Y-%m-%d %H:%M:%S")
		LIB_txtData:AddLine(szLogAward)
		Talk(1,"","C�c h� l� ng��i th� "..(nAward+1).." ��ng k� nh�n m�t t�ch th�nh c�ng.")
	end
end

