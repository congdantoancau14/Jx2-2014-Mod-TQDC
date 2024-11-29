--Ìå·þÖ¸Òý
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_info.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\system_switch_config.lua");
Include("\\settings\\static_script\\cheat\\list_gm.lua");
Include("\\settings\\static_script\\cheat\\kimxa.lua");

g_szTitle = "<color=green>GM: <color>"


-- Route	equip	tran phai	first skills	last skills
tSkills = {
	[2] = {3,32,21,31},
	[3] = {6,57,45,56},
	[4] = {2,44,33,43},
	[6] = {7,74,58,73},
	[8] = {4,89,75,88},
	[9] = {10,102,90,101},
	[11] = {2,113,103,112},
	[12] = {5,124,114,123},
	[14] = {4,146,125,145},
	[15] = {5,159,147,158},
	[17] = {11,732,720,731},
	[18] = {12,745,733,744},
	[20] = {13,775,364,377},
	[21] = {14,774,347,363},
	[23] = {4,1032,1017,1031},
	[25] = {3,1066,1053,1065},
	[26] = {8,1096,1083,1095},
	[27] = {14,1213,1131,1143},
	[29] = {15,1196,1165,1176},
	[30] = {16,1230,1217,1229},
	[31] = {17,1883,1872,1882},
	[32] = {4,1897,1885,1896},
}

tFactions = {
	"ThiÕu L©m",
	"Vâ §ang",
	"Nga Mi",
	"C¸i Bang",
	"§­êng M«n",
	"D­¬ng M«n",
	"Ngò §éc",
	"C«n L«n",
	"Minh Gi¸o",
	"Thóy Yªn",
}

-- [route] = {route_name,faction_belong}
tRoutes = {
	[0] = {"V« m«n ph¸i",0},
	[1] = {"ThiÕu L©m",-1},
	[2] = {"ThiÕu L©m tôc gia",1},
	[3] = {"ThiÕu L©m thiÒn t¨ng",1},
	[4] = {"ThiÕu L©m vâ t¨ng",1},
	[5] = {"§­êng M«n",-1},
	[6] = {"§­êng M«n hiÖp kh¸ch",5},
	[7] = {"Nga Mi",-1},
	[8] = {"Nga Mi phËt gia",7},
	[9] = {"Nga Mi tôc gia",7},
	[10] = {"C¸i Bang",-1},
	[11] = {"C¸i Bang t?nh y",1-1},
	[12] = {"C¸i Bang « y",1-1},
	[13] = {"Vâ §ang",-1},
	[14] = {"Vâ §ang ®¹o gia",13},
	[15] = {"Vâ §ang tôc gia",13},
	[16] = {"D­¬ng M«n",-1},
	[17] = {"D­¬ng M«n th­¬ng kÞ",16},
	[18] = {"D­¬ng M«n cung kÞ",16},
	[19] = {"Ngò §éc",-1},
	[20] = {"Ngò §éc tµ hiÖp",19},
	[21] = {"Ngò §éc cæ s­",19},
	[22] = {"C«n L«n",-1},
	[23] = {"C«n L«n thiªn s­",22},
	[24] = {"Minh Gi¸o",-1},
	[25] = {"Minh Gi¸o th¸nh chiÕn",24},
	[26] = {"Minh Gi¸o trËn binh",24},
	[27] = {"Minh Gi¸o huyÕt nh©n",24},
	[28] = {"Thóy Yªn",-1},
	[29] = {"Thóy Yªn vò tiªn",28},
	[30] = {"Thóy Yªn linh n÷",28},
	[31] = {"§­êng M«n nhËm hiÖp",5},
	[32] = {"C«n L«n kiÕm t«n",22},

}

tFengMing = {
	{"Phông Minh chñy",{0,14,32131}},
	{"Phông Minh kiÕm",{0,2,32135}},
	{"§«ng Hoµng Phông Minh chñy",{0,14,32137}},
	{"§«ng Hoµng Phông Minh kiÕm",{0,2,32141}},
	{"Phông Minh chñy 2",{0,14,32149}},
	{"Phông Minh kiÕm 2",{0,2,32153}},
	{"§«ng Hoµng Phông Minh chñy",{0,14,32155}},
	{"§«ng Hoµng Phông Minh kiÕm",{0,2,32159}},
}

tLieYu = {
	{"LiÖt Vò chñy",0,14,32119},
	{"LiÖt Vò kiÕm",0,2,32123},
	{"Quang Chiªu LiÖt Vò chñy",0,14,32125},
	{"Quang Chiªu LiÖt Vò kiÕm",0,2,32129},
}

function OnUse(nItem)	
	--print(GetPlayerRebornParam(0))
	--print(GetTranslifeCount())
	-------Chøc N¨ng Set Qu¶n TrÞ Viªn
	local nName = GetAccount();
	-- if CheckName(nName) == 0 then
		-- Talk(1,"","B¹n kh«ng ph¶i Qu¶n TrÞ Viªn");
	-- else
		Open();
	-- end
end

function Open()
	-- if 1 ~= IsExpSvrSystemOpen() then
		-- return
	-- end
	
	local tSay = {}
	local nRoute = GetPlayerRoute();
	if nRoute <= 0 then
		tSay = {
			"Gia nhËp m«n ph¸i/showFactions",
			"Gia nhËp hÖ ph¸i/JoinRoute_UpdateLevel",
		}
	else
		tSay = {
			"Reload Thiªn c¬ lÖnh/reloadFile",
			"NhËn trang bÞ /GetTB",
			"NhËn vËt phÈm kh¸c/Get_TieuDung",
			"Chøc n¨ng më réng\n\n/Get_Other",
			"NhËn 10 ®Êu hån/getDauHon",
			format("%s/getTiLi", "Håi thÓ lùc"),
			format("%s/getShaQi", "Håi s¸t khÝ"),
		}
	end
	tinsert(tSay, "\nX¶ ®å khái hµnh trang/ClearBagAllItem");
	tinsert(tSay, "Tho¸t/nothing");
	Say(g_szTitle.."Lùa chän chøc n¨ng", getn(tSay), tSay);
end

function reloadFile()
	-- dofile("\\settings\\static_script\\cheat\\thiencolenh.lua")
	LoadScript("\\settings\\static_script\\cheat\\thiencolenh.lua");
	Msg2Player("Reloaded thiencolenh");
end

function getBanhNgo()
	AddItem(1,1,1,999);
end

function getDauHon()
	AddItem(2,1,1157,10);
end


--TRANG BI THONG THUONG
function GetTB()
	local tSay = {
		g_szTitle.."Lùa chän",
		"Trang bÞ Kim xµ/showKX",
		"Trang bÞ V« Song ChiÕn ThÇn/Get_VSCT",
		"Trang bÞ H¾c B¹ch V« Song/Get_HBVS",
		"Trang bÞ V« H¹ Hµo HiÖp/Get_HHVH",
		"Trang bÞ ¢m HuyÕt/Get_AH",
		"Trang bÞ S¸t Tinh/Get_ST",
		"Trang bÞ ChiÕn Tr­êng/GetCT",
		"Trang bÞ Minh Tinh V« Cùc/Get_NgocBoi",
		"Trang bÞ Thiªn §Þa huyÒn hoµng/Get_TDHH",
		"NhËn trang bÞ Ngo¹i Trang/Get_NgoaiTrang",
		"NhËn thó c­ìi/Get_horse",
	};
	local nRoute = GetPlayerRoute();
	if nRoute == 31 or nRoute == 32 then
		tinsert(tSay,"Trang bÞ Phông Minh/getFengMing");
		tinsert(tSay,"Trang bÞ LiÖt Vò/getLieYu");
	end
	tinsert(tSay,"\nTrang tr­íc/Open");
	tinsert(tSay,"Ra khái/nothing");
	SelectSay(tSay);	
end

function showKX()
	local tSay = {
		g_szTitle.."Lùa chän",
		"NhËn Th«n NguyÖt lÖnh (KX6)/Get_KimXa",
		"Trang bÞ Kim xµ 4 (ngÉu nhiªn)/showKX4",
		"Trang bÞ Kim xµ 5 (ngÉu nhiªn)/showKX5",
		"Trang bÞ Kim xµ 6 (ngÉu nhiªn)/showKX6",
		"Trang bÞ Kim xµ 7 (ngÉu nhiªn)/showKX7",
	}
	tinsert(tSay,"Ra khái/nothing");
	SelectSay(tSay);	
end;

function Get_TDHH()
	AddItem(2,0,1055,1)
	AddItem(2,0,1056,1)
	AddItem(2,0,1057,1)
	AddItem(2,0,1058,1)
end;

function getFengMing()
	local nBody = GetBody();
	local nRoute = GetPlayerRoute();
	
	local tSay = {};
	if nRoute == 31 then
		for i=1, getn(tFengMing) do
			if mod(i,2) == 1 then
				tinsert(tSay,format("NhËn %s/#giveFengMing(%d)",tFengMing[i][1],i));
			end
		end
	elseif nRoute == 32 then
		for i=1, getn(tFengMing) do
			if mod(i,2) == 0 then
				tinsert(tSay,format("NhËn %s/#giveFengMing(%d)",tFengMing[i][1],i));
			end
		end
	end
	Say("",getn(tSay),tSay);
end;

function giveFengMing(nIndex)
	AddItem(tFengMing[nIndex][2][1],tFengMing[nIndex][2][2],tFengMing[nIndex][2][3],1);
end;

function getLieYu()
	local tSay = {};
	if nRoute == 31 then
		for i=1, getn(tLieYu) do
			if mod(i,2) == 1 then
				tinsert(tSay,format("NhËn %s/#giveLieYu(%d)",tLieYu[i][1],i));
			end
		end
	elseif nRoute == 32 then
		for i=1, getn(tLieYu) do
			if mod(i,2) == 0 then
				tinsert(tSay,format("NhËn %s/#giveLieYu(%d)",tLieYu[i][1],i));
			end
		end
	end
	Say("",getn(tSay),tSay);
end;

function giveLieYu(nIndex)
	AddItem(tLieYu[nIndex][2][1],tLieYu[nIndex][2][2],tLieYu[nIndex][2][3],1);
end;

function Get_horse()
	local szSay = {
		g_szTitle.."Lùa chän",
		"Get normal horses/Get_Normal_Horses",
		"Get strange horses/Get_Advanced_Horses",
		"\nRa khái/nothing",
	};
	SelectSay(szSay);	
end

function Get_Normal_Horses()
	AddItem(0,105,30033,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,30059,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,150,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,148,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,10107,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,10108,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,10109,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,10112,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,200,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,177,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,151,1,1,7,403,7,416,7,416,7,0);
end

function Get_Advanced_Horses()

	AddItem(0,105,30057,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,30044,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,30051,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,30052,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,30053,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,30054,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,30055,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,30056,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,30058,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,205,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,206,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,207,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,204,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,195,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,191,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,151,1,1,7,403,7,416,7,416,7,0);
	AddItem(0,105,152,1,1,7,403,7,416,7,416,7,0);
end


function Get_NgoaiTrang()
	local szSay = {
		g_szTitle.."Lùa chän trang bi.",
		"Ngo¹i trang ¢m Hån/Get_NT_AmHon",
		"Ngo¹i trang Háa Phông/Get_NT_HoaPhung",
		"Ngo¹i trang Thiªn Vò Cµ Sa/Get_NT_TVCS",
		"Ngo¹i trang VÊn Tinh/Get_NT_VanTinh",
		"Ngo¹i trang Xu©n Y/Get_NT_XuanY",
		"Ngo¹i trang Khæng T­íc/Get_NT_KhongTuoc",
		"Ngo¹i trang DiÖp Th­îng Thu/Get_NT_DiepThuongThu",
		"Ra khái/nothing",
	};
	SelectSay(szSay);
end

function Get_NT_HoaPhung()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody1 	= 10013 + GetBody() - 1;
	
	AddItem(0,108,nBody1,1,4,7,14538,7,14539,7,14540,0,0)
	AddItem(0,109,nBody1,1,4,7,14541,7,14538,7,14542,0,0)
	AddItem(0,110,nBody1,1,4,7,14539,7,496,7,14538,0,0)
	
	AddItem(0,108,nBody1,1,4,7,14542,7,13069,7,14538,0,0)
	AddItem(0,109,nBody1,1,4,7,496,7,13069,7,496,0,0)
	AddItem(0,110,nBody1,1,4,7,496,7,13308,7,496,0,0)
end

function Get_NT_AmHon()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody1 	= 680 + GetBody() - 1;
	
	AddItem(0,108,nBody1,1,4,7,14542,7,14538,7,14539,0,0)
	AddItem(0,109,nBody1,1,4,7,14541,7,13069,7,14540,0,0)
	AddItem(0,110,nBody1,1,4,7,496,7,13069,7,13355,0,0)
	
	AddItem(0,108,nBody1,1,4,7,14524,7,13069,7,13355,0,0)
	AddItem(0,109,nBody1,1,4,7,14524,7,13069,7,13355,0,0)
	AddItem(0,110,nBody1,1,4,7,14524,7,13069,7,13355,0,0)
end

function Get_NT_TVCS()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody1 	= 713 + GetBody() - 1;
	
	AddItem(0,108,nBody1,1,4,7,496,7,14542,7,14538,0,0)
	AddItem(0,109,nBody1,1,4,7,496,7,13069,7,14539,0,0)
	AddItem(0,110,nBody1,1,4,7,496,7,14541,7,145400,0)
	
	AddItem(0,108,nBody1,1,4,7,14524,7,13069,7,13355,0,0)
	AddItem(0,109,nBody1,1,4,7,14524,7,13069,7,13355,0,0)
	AddItem(0,110,nBody1,1,4,7,14524,7,13069,7,13355,0,0)
end

function Get_NT_VanTinh()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody1 	= 1009 + GetBody() - 1;
	
	AddItem(0,108,nBody1,1,4,7,14538,7,14539,7,14540,0,0)
	AddItem(0,109,nBody1,1,4,7,14541,7,14542,7,14539,0,0)
	AddItem(0,110,nBody1,1,4,7,496,7,14538,7,14539,0,0)
	
	AddItem(0,108,nBody1,1,4,7,14524,7,13069,7,13355,0,0)
	AddItem(0,109,nBody1,1,4,7,14524,7,13069,7,13355,0,0)
	AddItem(0,110,nBody1,1,4,7,14524,7,13069,7,13355,0,0)
end

function Get_NT_XuanY()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody1 	= 1005 + GetBody() - 1;
	
	AddItem(0,108,nBody1,1,4,7,496,7,13069,7,14538,0,0)
	AddItem(0,109,nBody1,1,4,7,496,7,14541,7,14539,0,0)
	AddItem(0,110,nBody1,1,4,7,496,7,14542,7,14540,0,0)
	
	AddItem(0,108,nBody1,1,4,7,14524,7,13069,7,13355,0,0)
	AddItem(0,109,nBody1,1,4,7,14524,7,13069,7,13355,0,0)
	AddItem(0,110,nBody1,1,4,7,14524,7,13069,7,13355,0,0)
end

function Get_NT_KhongTuoc()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody1 	= 929 + GetBody() - 1;
	
	AddItem(0,108,nBody1,1,4,7,496,7,13069,7,14538,0,0)
	AddItem(0,109,nBody1,1,4,7,496,7,14541,7,14539,0,0)
	AddItem(0,110,nBody1,1,4,7,496,7,4542,7,14540,0,0)
	
	AddItem(0,108,nBody1,1,4,7,14524,7,13069,7,13355,0,0)
	AddItem(0,109,nBody1,1,4,7,14524,7,13069,7,13355,0,0)
	AddItem(0,110,nBody1,1,4,7,14524,7,13069,7,13355,0,0)
end

function Get_NT_DiepThuongThu()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody1 	= 953 + GetBody() - 1;
	
	AddItem(0,108,nBody1,1,4,7,496,7,14538,7,14539,0,0)
	AddItem(0,109,nBody1,1,4,7,496,7,14540,7,14541,0,0)
	AddItem(0,110,nBody1,1,4,7,496,7,13069,7,14542,0,0)
	
	AddItem(0,108,nBody1,1,4,7,14524,7,13069,7,13355,0,0)
	AddItem(0,109,nBody1,1,4,7,14524,7,13069,7,13355,0,0)
	AddItem(0,110,nBody1,1,4,7,14540,7,13069,7,14541,0,0)
end


function Get_KimXa()
	AddItem(2, 1, 31286,3);
end

function Get_VSCT()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody 	= 30651 + GetBody() - 1;
	
	AddItem(0, 103, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 101, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 100, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
end

function Get_HBVS()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody 	= 20020 + GetBody() - 1;
	
	AddItem(0, 103, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 101, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 100, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
end

function Get_HHVH()
	AddItem(2, 1, 30947 ,1);
	AddItem(2, 1, 30948 ,1);
	AddItem(2, 1, 30949 ,1);
	AddItem(2, 1, 30977 ,2);
	AddItem(2, 1, 30976 ,1);
end

function Get_ST()
	AddItem(2, 1, 50000 ,1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(2, 1, 50001 ,1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(2, 1, 50002 ,1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(2, 1, 50004 ,2,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(2, 1, 50003 ,1,1, -1,-1,-1,-1,-1,-1,1,15);
end

function Get_AH()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody 	= 20012 + GetBody() - 1;
	
	AddItem(0, 103, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 101, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 100, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	
	AddItem(0, 102, 31414, 1,1, -1,-1,-1,-1,-1,-1,1,0);
	AddItem(0, 102, 31415, 1,1, -1,-1,-1,-1,-1,-1,1,0);
	
	local nVK = 30884;
	local ID = {
		[2] = 	{3, nVK},
		[3] = 	{8,nVK + 2},
		[4] = 	{0,nVK + 1},
		[6] = 	{1,nVK + 3},
		[8]= 	{2,nVK + 4},
		[9]= 	{10,nVK + 5},
		[11]=	{0,nVK + 6},
		[12]=	{5,nVK + 7},
		[14]=	{2,nVK + 8},
		[15]=	{9,nVK + 9},
		[17]=	{6,nVK + 10},
		[18]=	{4,nVK + 11},
		[20]=	{7,nVK + 12},
		[21]=	{11,nVK + 13},
		[23]=	{2,nVK + 14},
		[25]=	{3,nVK + 15},
		[26]=	{9,nVK + 16},
		[27]=	{11,nVK + 17},
		[29]=	{13,nVK + 18},
		[30]=	{12,nVK + 19},
		[31]=	{14,32164},
		[32]=	{2,32192},
	};
	
	for k, v in pairs(ID) do
		if nRoute == k then				
			AddItem(0, v[1], v[2], 1,1,-1,-1,-1,-1,-1,-1,1,15);
		end
	end
end

function Get_NgocBoi()
	if 1 ~= gf_Judge_Room_Weight(2, 1, g_szTitle) then
		return 0;
	end

	AddItem(0,102,31130,1,1,-1,-1,-1,-1,-1,-1,1,0)
	AddItem(0,102,31131,1,1,-1,-1,-1,-1,-1,-1,1,0)
end


--TRANG BI CHIEN TRUONG
function GetCT()
	local szSay = {
		g_szTitle.."Lùa chän",
		"NhËn trang bÞ Háa Phông/Get_CT_HP",
		"NhËn trang bÞ Thanh Long/Get_CT_TL",
		"NhËn trang bÞ Uy Hæ/Get_CT_UH",
		"\nRa khái/nothing",
	};
	SelectSay(szSay);	
end

--Trang bi UY HO
function Get_CT_UH()
	local szSay = {
		g_szTitle.."Lùa chän trang bÞ",
		"Trang phôc Uy Hæ T­íng Phe Tèng/#Get_TP_CT_UH(1,1)",
		"Trang phôc Uy Hæ So¸i Phe Tèng/#Get_TP_CT_UH(1,2)",
		"Trang phôc Uy Hæ T­íng Phe Liªu/#Get_TP_CT_UH(2,1)",
		"Trang phôc Uy Hæ So¸i Phe Liªu/#Get_TP_CT_UH(2,2)",
		"\nRa khái/nothing",
	};
	SelectSay(szSay);
end

--Trang bi THANH LONG
function Get_CT_TL()
	local szSay = {
		g_szTitle.."Lùa chän trang bÞ",
		"Trang phôc Thanh Long T­íng Phe Tèng/#Get_TP_CT_TL(1,1)",
		"Trang phôc Thanh Long So¸i Phe Tèng/#Get_TP_CT_TL(1,2)",
		"Trang phôc Thanh Long T­íng Phe Liªu/#Get_TP_CT_TL(2,1)",
		"Trang phôc Thanh Long So¸i Phe Liªu/#Get_TP_CT_TL(2,2)",
		"\nRa khái/nothing",
	};
	SelectSay(szSay);
end

--Trang bi Hoa Phung
function Get_CT_HP()
	local szSay = {
		g_szTitle.."Lùa chän trang bÞ",
		"Trang phôc Háa Phông T­íng Phe Tèng/#Get_TP_CT_HP(1,1)",
		"Trang phôc Háa Phông So¸i Phe Tèng/#Get_TP_CT_HP(1,2)",
		"Trang phôc Háa Phông T­íng Phe Liªu/#Get_TP_CT_HP(2,1)",
		"Trang phôc Háa Phông So¸i Phe Liªu/#Get_TP_CT_HP(2,2)",
		"\nRa khái/nothing",
	};
	SelectSay(szSay);
end

--GET
function Get_TP_CT_UH(nPhe, nQH)
		if nPhe == 1 and nQH == 1 then
			local ID1 = 20556 --TP
			local ID2 = 10196 --NB
			local ID3 = 20556 --VK
			GetCTEnd(ID1, ID2, ID3, nQH);
		elseif nPhe == 1 and nQH == 2 then
			local ID1 = 20620 --TP
			local ID2 = 10388 --NB
			local ID3 = 20620 --VK
			GetCTEnd(ID1, ID2, ID3, nQH);
		elseif nPhe == 2 and nQH == 1 then
			local ID1 = 20684 --TP
			local ID2 = 10644 --NB
			local ID3 = 20684 --VK
			GetCTEnd(ID1, ID2, ID3, nQH);
		elseif nPhe == 2 and nQH == 2 then
			local ID1 = 20748 --TP
			local ID2 = 10836 --NB
			local ID3 = 20748 --VK
			GetCTEnd(ID1, ID2, ID3, nQH);
		end
end

function Get_TP_CT_TL(nPhe, nQH)
	if nPhe == 1 and nQH == 1 then
		local ID1 = 20300 --TP
		local ID2 = 9300 --NB
		local ID3 = 20300 --VK
		GetCTEnd(ID1, ID2, ID3, nQH);
	elseif nPhe == 1 and nQH == 2 then
		local ID1 = 20364 --TP
		local ID2 = 9492 --NB
		local ID3 = 20364 --VK
		GetCTEnd(ID1, ID2, ID3, nQH);
	elseif nPhe ==2  and nQH == 1 then
		local ID1 = 20428 --TP
		local ID2 = 9748 --NB
		local ID3 = 20428 --VK
		GetCTEnd(ID1, ID2, ID3, nQH);
	elseif nPhe == 2 and nQH == 2 then
		local ID1 = 20492 --TP
		local ID2 = 9940 --NB
		local ID3 = 20492 --VK
		GetCTEnd(ID1, ID2, ID3, nQH);
	end
end

function Get_TP_CT_HP(nPhe, nQH)
	if nPhe == 1 and nQH == 1 then
		local ID1 = 30311 --TP
		local ID2 = 30228 --NB
		local ID3 = 30328 --VK
		GetCTEnd(ID1, ID2, ID3, nQH);
	elseif nPhe == 1 and nQH == 2 then
		local ID1 = 30375 --TP
		local ID2 = 30420 --NB
		local ID3 = 30432 --VK
		GetCTEnd(ID1, ID2, ID3, nQH);
	elseif nPhe == 2 and nQH == 1 then
		local ID1 = 30439 --TP
		local ID2 = 30676 --NB
		local ID3 = 30536 --VK
		GetCTEnd(ID1, ID2, ID3, nQH);
	elseif nPhe == 2 and nQH == 2 then
		local ID1 = 30503 --TP
		local ID2 = 30868 --NB
		local ID3 = 30640 --VK
		GetCTEnd(ID1, ID2, ID3, nQH);
	end
end

function GetCTEnd(ID1, ID2, ID3, nQH)
	local ID = {
		[2] = 	{3, ID1, ID2, ID3},
		[3] = 	{8,ID1 + 2,ID2 + 2,ID3 +2},
		[4] = 	{0,ID1 + 4,ID2 + 4,ID3 +4},
		[6] = 	{1,ID1 + 6,ID2 + 6,ID3 +6},
		[8]= 	{2,ID1 + 10,ID2 + 10,ID3 +10},
		[9]= 	{10,ID1 + 12,ID2 + 12,ID3 +12},
		[11]=	{0,ID1 + 14,ID2 + 14,ID3 +14},
		[12]=	{5,ID1 + 18,ID2 + 18,ID3 +18},
		[14]=	{2,ID1 + 22,ID2 + 22,ID3 +22},
		[15]=	{9,ID1 + 26,ID2 + 26,ID3 +26},
		[17]=	{6,ID1 + 30,ID2 + 30,ID3 +30},
		[18]=	{4,ID1 + 34,ID2 + 34,ID3 +34},
		[20]=	{7,ID1 + 38,ID2 + 38,ID3 +38},
		[21]=	{11,ID1 + 42,ID2 + 42,ID3 +42},
		[23]=	{2,ID1 + 46,ID2 + 46,ID3 +46},
		[25]=	{3,ID1 + 48,ID2 + 48,ID3 +48},
		[26]=	{9,ID1 + 52,ID2 + 52,ID3 +52},
		[27]=	{11,ID1 + 56,ID2 + 56,ID3 +56},
		[29]=	{13,ID1 + 60,ID2 + 60,ID3 +60},
		[30]=	{12,ID1 + 62,ID2 + 62,ID3 +62},
	};
	
	local nRoute = GetPlayerRoute();
	if nRoute == 8 or nRoute == 9 or nRoute == 29 or nRoute == 30 then
		nBody = GetBody() - 3;
	else
		nBody = GetBody() - 1;
	end
	
	for k, v in pairs(ID) do
		if nRoute == k then
			local nA = v[1];
			local nTP = v[2] + nBody;
			local nNB = v[3] + nBody;
			local nVK = v[4] + nBody;
			
			AddItem(0, 103, nTP, 1,1,-1,-1,-1,-1,-1,-1,1,15); --TP
			AddItem(0, 101, nTP, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			AddItem(0, 100, nTP, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			
			AddItem(0, 102, nNB, 1,1,-1,-1,-1,-1,-1,-1,1,0); -- NB
			AddItem(0, 102, nNB + 64, 1,1,-1,-1,-1,-1,-1,-1,1,0);
			AddItem(0, 102, nNB + 64 * 2, 1,1,-1,-1,-1,-1,-1,-1,1,0);
			
			if nQH == 2 then
				AddItem(0, 102, nNB + 64 * 3, 1,1,-1,-1,-1,-1,-1,-1,1,0); --NBS
			end
					
			AddItem(0, nA, nVK, 1,1,-1,-1,-1,-1,-1,-1,1,15); --VK
		end
	end
end


--TRANG BI TIEU DUNG
function Get_TieuDung()
	local nRoute = GetPlayerRoute();
	local tSay = {
		"NhËn D­îc phÈm/GetYaoPin",
		"NhËn Lac/GetLac",
		"NhËn 4000 vµng/Get_Money",
		"NhËn 999 Banh ngo/getBanhNgo",
		"NhËn 999 cöu chuyÓn håi hån ®¬n/getCuuChuyen",
		"NhËn 999 thiªn v­¬ng bæ t©m ®¬n/getThienVuong",
		"NhËn §¸ Quý/Get_Gem",
		"NhËn vËt phÈm Shop/Get_VPSHOP",
		"NhËn TMKL vµ TCL/Get_TMKL",
		"NhËn vµng bao/Get_VANGBAO1",
		"NhËn tµi liÖu c­êng hãa/Get_Enhance",
		"NhËn vßng Th¸i H­ b¸t qu¸i/getThaixu",
		"NhËn linh th¹ch/getLingShi",
		"NhËn uÈn linh ngo¹i trang/getYunLing",
		"NhËn bao Tiªu dao ngäc/getXiaoYaoYu",
		"NhËn Hoµng Kim ®¹i ng©n phiª'u/getDaYinPiao",
		"NhËn Thiªn Kiªu LÖnh/getTianJiaoLing",
		"NhËn Nguyªn LiÖu ChÕ T¹o ChiÕn Tr­êng/Get_CTItem",
	};
	if 3 == nRoute then
		tinsert(tSay, "NhËn Thiªn PhËt Ch©u vµ Ph¸ Ma Chó/Give_ZhuzhuZhouzhou")
	end
	if 6 == nRoute then
		tinsert(tSay, "NhËn ¸m KhÝ vµ C¬ Quan/Give_JiguanAnqi")
	end
	if 8 == nRoute then
		tinsert(tSay, "NhËn X¸ Lîi Kim §¬n/Give_Dandan")
	end		
	if 17 == nRoute then
		tinsert(tSay, "NhËn ChiÕn M·/Give_ZhanMa")
	end
	if 18 == nRoute then
		tinsert(tSay, "NhËn ChiÕn M· vµ Tô TiÔn/Give_Jiancu")
	end
	if 20 == nRoute then
		tinsert(tSay, "NhËn Phong Thi Phï/Give_Fengshifu")
	end
	if 21 == nRoute then
		tinsert(tSay, "NhËn Cæ/Give_GuGu")
	end
	if 30 == nRoute then
		tinsert(tSay, "NhËn §iªu/ling_nv_xiaodiao")
	end
	if 31 == nRoute then
		tinsert(tSay, "NhËn chñy thñ/getZhuiShou")
	end
	if 32 == nRoute then
		tinsert(tSay, "NhËn Linh KiÕm/Get_LK")
	end
	
	tinsert(tSay, "\nTrang tr­íc/Open");
	tinsert(tSay, "Ra khái/nothing");
	Say(g_szTitle.."Lùa chän", getn(tSay), tSay);	
end

function getYunLing()
	AddItem(2,1,30666,16);
	AddItem(2,1,30667,16);
	AddItem(2,1,30668,16);
end;

function getLingShi()
	local tSay = {
			"Linh th¹ch ngÉu nhiªn\n\n/getRandomLingshi",
			"Linh th¹ch ®Çu qu¸n/#giveLingShi(0)",
			"Linh th¹ch y phôc/#giveLingShi(1)",
			"Linh th¹ch vò khÝ/#giveLingShi(2)",
			"Linh th¹ch h¹ y/#giveLingShi(3)",
	}
	tinsert(tSay,"\nKh«ng nhËn n÷a/nothing");
	Say("",getn(tSay),tSay);
end;

function giveLingShi(nType)
	for i=1,55 do 
		while tryGetLingshi(nType,1,7) == 0 do end
	end;
end;

function tryGetLingshi(nType,nMinLevel,nMaxLevel)
	local result = 0;
	for i=1,100 do
		result = addRandomLingshi(nType,nMinLevel,nMaxLevel);
		if result == 1 then break end
	end
	return result;
end;

function addRandomLingshi(nType,nMinLevel,nMaxLevel)
	local found = 0;
	local tb = SYS_TB_LINGSHI_MINLEVEL;
	-- print(getn(SYS_TB_LINGSHI_MINLEVEL));
	local tbLSInfo = ls_GetRandomLingShi(tb,nMinLevel,nMaxLevel);
	if type(tbLSInfo) ~= "table" then
		return 0;
	end;
	local nLevel = 0;
	if tb == SYS_TB_LINGSHI_MINLEVEL then
		nLevel = random(max(tbLSInfo[2],nMinLevel),nMaxLevel);
	elseif tb == SYS_TB_LINGSHI_USELEVEL then
		nLevel = random(tbLSInfo[2],7);
	else
		return 0;
	end;
	local nID = tbLSInfo[1];
	local nUseLevel = tbLSInfo[3];
	
	-- print(getn(tbLSInfo[4]));
	-- Msg2Player(getn(tbLSInfo[4]));
	if getn(tbLSInfo[4]) >= nType then
		local nPos = nType;
		AddLingShi(nID,nPos,nLevel);
		found = 1;
	end
	return found;
end;

function getRandomLingshi()
	for i=30413,30419 do
		AddItem(2,1,i,10)
	end
end;

function getThaixu()
	for i=469,476 do
		AddItem(2,1,i,10);
	end;
end;

function Get_LK()
	if gf_Judge_Room_Weight(4, 100, " ") ~= 1 then
		return 0;
	end
	AddItem(2, 20, 2, 1);
	for i=100,104 do
		AddItem(2,20,i,1);
	end
end

function getZhuiShou()
	local nBody = GetBody();
	AddItem(0,14,31100+nBody,1);
end;

function getThienVuong()
	AddItem(1,0,31,999);
end;

function getCuuChuyen()
	AddItem(1,0,32,999);
end;

function getDaYinPiao()
	AddItem(2,1,30490,1);
end;

function getXiaoYaoYu()
	AddItem(2,1,30605,1);
end;

function GetYaoPin()
	-- for i = 30005,30011 do
		-- if i ~= 30008 then
			-- AddItem(1,0,i,999);
		-- end
	-- end
	for i = 30009,30011 do
		AddItem(1,0,i,999);
	end
end

function GetLac()
	for i = 261,265 do
		AddItem(1,0,i,999);
	end
end
function Get_VANGBAO1()
	                AddItem(2,1,539,10);
	                AddItem(2,1,30229,10);
	                PlaySound("\\sound\\sound_i016.wav");
	                SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function Get_TMKL()
	AddItem(2,1,30370,100);
	AddItem(2,95,204,100);
end
function Get_VPSHOP()
	AddItem(2,1,30499,1000);
	AddItem(2,1,30369,999);
	AddItem(2,1,30368,999);
end
function Get_CTItem()
	AddItem(2,1,30687,2000);
	AddItem(2,1,31324,50);
	AddItem(2,1,31325,500);
	AddItem(2,1,31223	,50);
	AddItem(2,1,31224	,500);
	AddItem(2,1,30769	,50);
	AddItem(2,1,30770	,500);
end
function Get_Enhance()
	local tSay = {
		"NhËn ThÇn Th¹ch §Þnh Hån/Get_Enhance_1",
		"NhËn Tinh th¹ch Thiªn Th¹ch/Get_Enhance_2",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say(g_szTitle.."T¨ng cÊp kü n¨ng sèng", getn(tSay), tSay);
end

function Get_Enhance_1()
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	gf_AddItemEx2({2, 1, 1068, 1}, "Thiªn Th¹ch linh th¹ch", "Get_Enhance_1", "NhËn ThÇn Th¹ch §Þnh Hån", 0, 1);
	gf_AddItemEx2({2, 1, 1067, 1}, "Thiªn Th¹ch linh th¹ch", "Get_Enhance_1", "NhËn ThÇn Th¹ch §Þnh Hån", 0, 1);
end

function Get_Enhance_2()
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	AddItem(2, 1, 1009, 999);
	WriteLogEx("Get_Enhance_2","NhËn Tinh th¹ch Thiªn Th¹ch", 100, "Thiªn Th¹ch Tinh Th¹ch");
end

function Life_Skill()
	local tSay = {
		"Muèn t¨ng cÊp kü n¨ng thu thËp/upgrade_gather_skill",
		"Muèn t¨ng cÊp kü n¨ng s¶n xuÊt/upgrade_compose_skill",
		"NhËn nguyªn liÖu chÕ trang bÞ Linh §å/get_lingtu_equip_material",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say(g_szTitle.."T¨ng cÊp kü n¨ng sèng", getn(tSay), tSay);
end

function upgrade_gather_skill()
	local tGather = {1, 2, 5, 6};
	local tName = {"§èn c©y", "Lµm da", "§µo kho¸ng", "KÐo t¬"};
	local str = ""
	for k, v in tName do
		str = str.."<color=gold>"..v.."<color>,"
	end
	for k, v in tGather do
		local nCur = GetLifeSkillLevel(0, v)
		local nMax = GetLifeSkillMaxLevel(0, v);
		if nMax > nCur then
			local msg = g_szTitle..format("HiÖn t¹i chØ cã thÓ th¨ng cÊp kü n¨ng %s, <color=gold>%s<color> ®ang ®¹t cÊp <color=green>%d<color>, muèn th¨ng cÊp <color=gold>%s<color> ®Õn cÊp <color=green>%d<color> kh«ng?",
				 str, tName[k], nCur, tName[k], nMax);
			Say(msg, 2, format("§ång ý/#upgrade_gather_skill_do(%d, %d)", v, nMax), "Hñy bá/nothing")
			return 0;
		end
	end
	Talk(1,"","Kh«ng cã kü n¨ng sèng cã thÓ th¨ng cÊp, h·y ®i t×m NPC ®Ó häc vµ th¨ng cÊp giíi h¹n kü n¨ng ®Õn cÊp 99")
end

function upgrade_gather_skill_do(nSkill, nMax)
	for i = GetLifeSkillLevel(0, nSkill), nMax do
		AddLifeSkillExp(0, nSkill, 9999999);		
	end
	if 79 == nMax then
		Talk(1,"","HiÖn ®· hoµn thµnh th¨ng cÊp kü n¨ng, h·y ®i t×m NPC ®Ó t¨ng cÊp giíi h¹n ®Õn 99 nµo!")
	end
	Msg2Player(format("Thµnh c«ng t¨ng cÊp kü n¨ng ®Õn cÊp %d", nMax));
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

function upgrade_compose_skill()
	local tGather = {2, 3, 4, 5, 9, 10};
	local tName = {"ChÕ t¹o binh khÝ dµi", "ChÕ t¹o binh khÝ ng¾n", "ChÕ t¹o kú m«n binh khÝ", "Lµm hé gi¸p", "H¹ trang", "§Çu qu¸n"};
	local str = ""
	for k, v in tName do
		str = str.."<color=gold>"..v.."<color>,"
	end
	for k, v in tGather do
		local nCur = GetLifeSkillLevel(1, v)
		local nMax = GetLifeSkillMaxLevel(1, v);
		if nMax > nCur then
			local msg = g_szTitle..format("HiÖn t¹i chØ cã thÓ th¨ng cÊp kü n¨ng %s, <color=gold>%s<color> ®ang ®¹t cÊp <color=green>%d<color>, muèn th¨ng cÊp <color=gold>%s<color> ®Õn cÊp <color=green>%d<color> kh«ng?",
				 str, tName[k], nCur, tName[k], nMax);
			Say(msg, 2, format("§ång ý/#upgrade_compose_skill_do(%d, %d)", v, nMax), "Hñy bá/nothing")
			return 0;
		end
	end
	Talk(1,"","Kh«ng cã kü n¨ng sèng cã thÓ th¨ng cÊp, h·y ®i t×m NPC ®Ó häc vµ th¨ng cÊp giíi h¹n kü n¨ng ®Õn cÊp 99")
end

function upgrade_compose_skill_do(nSkill, nMax)
	for i = GetLifeSkillLevel(1, nSkill), nMax do
		AddLifeSkillExp(1, nSkill, 9999999);		
	end
	if 79 == nMax then
		Talk(1,"","HiÖn ®· hoµn thµnh th¨ng cÊp kü n¨ng, h·y ®i t×m NPC ®Ó t¨ng cÊp giíi h¹n ®Õn 99 nµo!")
	end
	Msg2Player(format("Thµnh c«ng t¨ng cÊp kü n¨ng ®Õn cÊp %d", nMax));
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end




--DA Quy
function Get_Gem()
	if gf_Judge_Room_Weight(4, 100, " ") ~= 1 then
		return 0;
	end
	
	AddItem(2, 22, 101, 100);
	AddItem(2, 22, 102, 100);
	AddItem(2, 22, 103, 100);
	AddItem(2, 22, 104, 100);
	AddItem(2, 22, 107, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "HuyÕtTrÝchTh¹ch Lv7");
	AddItem(2, 22, 201, 100);
	AddItem(2, 22, 202, 100);
	AddItem(2, 22, 203, 100);
	AddItem(2, 22, 204, 100);
	AddItem(2, 22, 207, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "NguyÖtB¹chTh¹ch Lv7");
	AddItem(2, 22, 301, 100);
	AddItem(2, 22, 302, 100);
	AddItem(2, 22, 303, 100);
	AddItem(2, 22, 304, 100);
	AddItem(2, 22, 307, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "Hæ Ph¸ch Th¹ch Lv7");
	AddItem(2, 22, 401, 100);	
	AddItem(2, 22, 402, 100);	
	AddItem(2, 22, 403, 100);	
	AddItem(2, 22, 404, 100);
	AddItem(2, 22, 407, 100);	
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "H¾c DiÖu Th¹ch Lv7");
end

function Get_Money()
	Earn(40000000);
end

---Thiªn Khiªu LÖnh
function getTianJiaoLing()
	AddItem(2,97,236,999)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

---Håi thÓ lùc
function getTiLi()
	RestoreStamina()
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function getShaQi()
	SetMomentum(10);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

--Ên chuyÓn sinh
function Get_An()
	if gf_Judge_Room_Weight(4, 100, " ") ~= 1 then
		return 0;
	end
    AddItem(2, 0, 30002, 1 ,1);
	WriteLogEx("Get_An","NhËn Ên:", 100, "Long tö Ên");
	AddItem(2, 0, 30005, 1, 1);
	WriteLogEx("Get_An","NhËn Ên:", 100, "Phông tö Ên");
	AddItem(2, 0, 30003, 1, 1);
	WriteLogEx("Get_An","NhËn Ên:", 100, "Hæ tö Ên");
	AddItem(2, 0, 30006, 1, 1);	
	WriteLogEx("Get_An","NhËn Ên:", 100, "¦ng tö Ên");
    AddItem(2, 0, 30001, 1, 1);	
	WriteLogEx("Get_An","NhËn Ên:", 100, "Tö Ên");
end

--CHUC NANG KHAC
function Get_Other()
	local szSay = {
		g_szTitle.."Lùa chän",
		"ChuyÓn sinh/chuyensinh",
		"Th¨ng ChuyÓn Sinh 7 cÊp 99/UpSuper",
		"Thao t¸c MËt TÞch/Get_Book",
		"Thao t¸c Kinh M¹ch/GetJingMai",
		"Thao t¸c Thó C­ng/Pet_OP",
		"Thao t¸c Bang Héi/TongOperation",
		"Thao t¸c Vò KhÝ/PS_VK",
		"Kü n¨ng sèng/Life_Skill",
		"LuyÖn max skill trÊn ph¸i/#luyenMaxTranPhai()",
		"Thay ®æi hÖ ph¸i kh¸c/JoinRoute_UpdateLevel",
		
		"\nTrang tr­íc/Open",
		"Ra khái/nothing",
	};
	SelectSay(szSay);	
end

function chuyensinh()
	local tRebornFaction = {
		[1] = "Long tö",
		[2] = "Phông tö",
		[3] = "¦ng tö",
		[4] = "Hæ tö",
	}
	local tSay = {}
	for i=1, 4 do
		tinsert(tSay, format("ChuyÓn sinh h­íng %s/#reborn(%d)",tRebornFaction[i],i));
	end
	tinsert(tSay,"Tù phÕ c«ng lùc chuyÓn sinh/#reborn(0)");
	tinsert(tSay,"Dõng/nothing");
	Say("",getn(tSay),tSay);
end

function reborn(nType)
	if nType ~= 0 then 
		SetTask(1538,SetByte(GetTask(1538),1,GetByte(GetTask(1538),1)+1),0);
		SetTask(1538,SetByte(GetTask(1538),2,nType),0);
	else
		SetTask(1538,SetByte(GetTask(1538),1,0),0);
	end
	Msg2Player("§· chuyÓn sinh!");
	-- Say("§· chuyÓn sinh! §¨ng nhËp l¹i ®Ó cã hiÖu lùc.",1,"Tho¸t/exitgame");
end;

function exitgame()
	ExitGame();
end;

--VK
function PS_VK()
	local tEquipEffect = {
		"ThiÕt Cèt",
		"B¸ch ChiÕn",
		"Ch­íc NhËt",
		"TuÊn DËt",
		"§µo Lý",
		"Danh Tóc",
		"L¹c Hµ",
		"L¨ng Tiªu",
		"PhÇn V©n",
		"§o¹n Giao",
		"C¸i ThÕ",
		"Ph¸ Qu©n",
		"Hµo m«n",
	}

	local tSay = {}
	for i=1, getn(tEquipEffect) do
		tinsert(tSay,format("%s/#BindWeaponEffect(%s,1)",tEquipEffect[i],tEquipEffect[i]));
	end
end

--Pet
function Pet_OP()
	local tSay = {}
	if GetSkillLevel(30149) == 0 then
		tinsert(tSay, format("%s/activePet", "KÝch ho¹t phôc sinh thó c­ng"))
	end
	tinsert(tSay, format("%s/getPetEgg", "NhËn Trøng Thó C­ng"))
	tinsert(tSay, format("%s/getLingLi", "NhËn ®iÓm linh lùc"))
	tinsert(tSay, "\nRa khái/nothing");
	Say(g_szTitle.."Ng­¬i cÇn gióp ®ì g×?", getn(tSay), tSay);
end

function activePet()
	local nId = 30149
	if GetSkillLevel(nId) == 0 then
		LearnSkill(nId)
		for i = 1,4 do
			LevelUpSkill(nId)
		end
		
		Msg2Player("§· häc Gi¸ng Linh ThuËt cÊp 5");
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	end
end

function getPetEgg()
	AddItem(2,1,30601,10)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function getLingLi()
	local nAdd = 10000
	local nTask = 1535
	local nCur = GetTask(nTask) / 100
	if nCur < 1000000 then
		nCur = nCur + nAdd
		SetTask(nTask, nCur*100)
		Msg2Player(format("NhËn thµnh c«ng %d linh lùc", nAdd))
	end
end

--Gia nhËp m«n ph¸i
function showFactions()
	tSay = {}
	for i=1,getn(tFactions) do 
		tinsert(tSay,format("Gia nhËp %s/#joinFaction(%d)",tFactions[i],i));
	end
	tinsert(tSay,"Tho¸t/nothing");
	Say("",getn(tSay),tSay);
end;

function joinFaction(nFaction)
	SetPlayerFaction(nFaction);
	
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	
	if GetPlayerFaction() ~= 0 then
		Msg2Player("Gia nhËp m«n ph¸i thµnh c«ng!")
		Talk(1,"","Gia nhËp m«n ph¸i thµnh c«ng!")
	else
		Msg2Player("Gia nhËp m«n ph¸i thÊt b¹i!")
		Talk(1,"","Gia nhËp m«n ph¸i thÊt b¹i!")
	end
end

-- Gia nhËp hÖ ph¸i
function JoinRoute_UpdateLevel()
	
	local tSay = {};
	tinsert(tSay,"V« m«n ph¸i/#enter_mp(0)");
	
	for i=0, getn(tRoutes) do
		if tRoutes[i][2] == -1 then
			tinsert(tSay, format("%s/#show_lp(%d)",tRoutes[i][1],i));
		end
	end
	tinsert(tSay,"\nTrang chÝnh/Open");
	tinsert(tSay,"T¹m thêi kh«ng muèn/nothing");
	Say("Ng­¬i muèn gia nhËp m«n ph¸i nµo?", getn(tSay), tSay);
end;

function show_lp(faction)
	tSay = {};
	for i=0, getn(tRoutes) do
		if tRoutes[i][2] == tonumber(faction) then
			tinsert(tSay,format("%s /#enter_mp(%d)",tRoutes[i][1],i));
		end
	end
	tinsert(tSay,"\nTrang tr­íc/JoinRoute_UpdateLevel");
	tinsert(tSay,"T¹m thêi kh«ng muèn/nothing");
	Say("Ng­¬i muèn gia nhËp l­u ph¸i g×?",getn(tSay), tSay);
end;


function enter_mp(nRoute)
	
	--SetPlayerFaction(0);
	SetPlayerRoute(0);
	SetPlayerRoute(nRoute);						--ÉèÖÃÁ÷ÅÉ

	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	
	if nRoute == 0 then
		Msg2Player("§· hñy bá m«n ph¸i!")
		Talk(1,"","XuÊt m«n thµnh c«ng!")
		return 1;
	end
	if GetPlayerRoute() ~= 0 then
		Msg2Player("Gia nhËp m«n ph¸i thµnh c«ng!")
		Talk(1,"","Gia nhËp hÖ ph¸i thµnh c«ng!")
	else
		Msg2Player("Gia nhËp m«n ph¸i thµnh c«ng!")
		Talk(1,"","Gia nhËp hÖ ph¸i thÊt b¹i!")
	end
	
	learnSkills(nRoute);
end

function learnSkills(nRoute)
	LearnSkill(20); -- Khinh c«ng
	LearnSkill(tSkills[nRoute][1]) -- vò khÝ
	LearnSkill(tSkills[nRoute][2]) -- tran phai
	local nBegin = tSkills[nRoute][3];
	local nEnd = tSkills[nRoute][4];
	for i = nBegin, nEnd do
		LearnSkill(i);
		while LevelUpSkill(i) == 1 do
		end
	end;
	Msg2Player("§· lÜnh héi ®­îc toµn bé vâ c«ng l­u ph¸i!");
end;

function luyenMaxTranPhai(nRoute)
	if nRoute == nil then
		nRoute = GetPlayerRoute();
	end

	for i=1, 20 do
		LevelUpSkill(tSkills[nRoute][2]);
	end
	Msg2Player("§· luyÖn thµnh trÊn ph¸i vâ c«ng!")
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end;


function UpSuper()
	PlayerReborn(2, random(4));			--ChuyÓn sinh
	SetLevel(99, 1);								--CÊp
	ModifyExp(2000000000);
	ModifyReputation(1000000,0);			--Danh väng
	SetTask(336, 1000000);  --S­ M«n
	SetTask(704, 6)  --Nguyªn So¸i
	SetTask(701, 12000000); --C«ng tr¹ng
	gf_SetTaskByte(1538, 1, 5);
	ModifyJinJuan(50000,1); --	Kim PhiÕu
	ModifyYinJuan(50000,1); --	Ng©n PhiÕu
	ModifyPopur(10000) -- §iÓm LuyÖn
	
	--Hieu Bang
	AddTitle(69,1);
	AddTitle(69,2);
	AddTitle(72,10);
	
	-- Hieu CS
	AddTitle(61,5);
	AddTitle(71,1);
	AddTitle(73,1);
	AddTitle(76,1);
	
	--Hieu New
	AddTitle(70,1);
	AddTitle(74,1);
	AddTitle(74,2);
	AddTitle(74,3);
	AddTitle(75,1);
	AddTitle(75,2);
end


--Mat Tich
function Get_Book()
	local szSay = {
		g_szTitle.."NhËn L­u Ph¸i Ch©n QuyÓn vµ QuyÕt YÕu!",
		"NhËn Ch©n QuyÓn/#Get_Book_ZhenJuan()",
		"NhËn QuyÕt YÕu/Get_Book_JueYao",
		"Th¨ng cÊp mËt tÞch ®· trang bÞ/Get_Book_Update",
		"T¨ng chØ sè lªn 250%/#enhance_book(250)",
		"T¨ng chØ sè lªn 550%/#enhance_book(550)",
		"T¨ng chØ sè lªn 2500%/enhance_book(2500)",
		"\nRa khái/nothing",
	};
	SelectSay(szSay);
end

function enhance_book(nChiSo)
	CastState("state_add_book_attribute_value", nChiSo, -1, -1);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

function Get_Book_ZhenJuan(nRoute)
	
	if nRoute == nil then
		nRoute = GetPlayerRoute();
	end
	
	-- [route] = (0,107,book_id)
	tBooks = {
		[2] = 30001,
		[3] = 30003,
		[4] = 30002,
		[6] = 30004,
		[8] = 30005,
		[9] = 30006,
		[11] = 30007,
		[12] = 30008,
		[14] = 30009,
		[15] = 30010,
		[17] = 30011,
		[18] = 30012,
		[20] = 30013,
		[21] = 30014,
		[23] = 30015,
		[25] = 30035,
		[26] = 30036,
		[27] = 30037,
		[29] = 30016,
		[30] = 30017,
		[31] = 231,
		[32] = 235,

	}


	tPhoMatTich = {
		{"L¨ng ba vi bé",{0,112,78}},
		{"L¨ng ba vi bé toµn tËp",{0,112,158}},
		{"MËt tÞch tiªu dao",{0,112,224}},
	}


	AddItem(0,107,tBooks[nRoute],2);
	for i=1,getn(tPhoMatTich) do
		AddItem(tPhoMatTich[i][2][1],tPhoMatTich[i][2][2],tPhoMatTich[i][2][3],1);
	end
end;

function Get_Book_JueYao()
	
	tJue = {
		[2]		={1,10},
		[3]		={21,31},
		[4]		={11,20},
		[6]		={32,46},
		[8]		={47,59},
		[9]		={60,70},
		[11]		={71,79},
		[12]		={80,88},
		[14]		={89,108},
		[15]		={109,119},
		[17]		={120,130},
		[18]		={131,141},
		[20]		={142,154},
		[21]		={155,168},
		[23]		={169,182},
		[25]		={183,194},
		[26]		={195,206},
		[27]		={207,218},
		[29]		={219,229},
		[30]		={230,240},
	};

	local nRoute = GetPlayerRoute();
	for i = tJue[nRoute][1],tJue[nRoute][2] do
		gf_AddItemEx({2, 6, i, 1, 4}, "QuyÕt YÕu");
	end
end

function Get_Book_Update()
	for i=1,100 do LevelUpBook() end
	for i=1,100 do LevelUpBook(1) end
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end


-------------   Vat Dung Mon Phai ---------------
function Give_ZhuzhuZhouzhou()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end

	AddItem(2, 3, 4, 99);
	AddItem(2, 3, 12, 99);	
end

function Give_JiguanAnqi()
	if gf_Judge_Room_Weight(11, 1) ~= 1 then
		return 0;
	end
  for i = 1,9 do
		AddItem(2, 11, i, 2000, 4);
	end
	AddItem(2, 3, 6, 999, 4);	
end

function Give_Dandan()
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 3, 7, 999);
end

function Give_ZhanMa()
	if gf_Judge_Room_Weight(1, 10) ~= 1 then
		return 0;
	end
	AddItem(0,105,38,1,1,7,101,7,101,7,101);
end

function Give_Jiancu()
	if gf_Judge_Room_Weight(2, 100) ~= 1 then
		return 0;
	end
	AddItem(2, 15, 10, 2000);
	AddItem(0,105,38,1,1,7,101,7,101,7,101);
end

function Give_Fengshifu()
	if gf_Judge_Room_Weight(5, 1) ~= 1 then
		return 0;
	end

	AddItem(1, 6, 34,	30, 4);
	AddItem(1, 6, 46, 30, 4);
	AddItem(1, 6, 84,	30, 4);
	AddItem(1, 6, 153,30, 4);
	AddItem(1, 6, 154,30, 4);
end

function Give_GuGu()
	if gf_Judge_Room_Weight(32, 1) ~= 1 then
		return 0;
	end
  for i = 1,31 do
		AddItem(2, 17, i, 99, 4);
	end

	if 0 >= GetItemCount(2, 0, 1063) and 1 == gf_Judge_Room_Weight(1, 1) then
		AddItem(2, 0, 1063, 1);
	end
end


--Pet TYLN
function ling_nv_xiaodiao()
	local szSay = {};
	szSay[getn(szSay) + 1] = "NhËn TiÓu §iªu/Give_XiaoDiao";
	szSay[getn(szSay) + 1] = "Nu«i TiÓu §iªu/Give_XiaoDiaoFood";
	szSay[getn(szSay) + 1] = "HuÊn luyÖn TiÓu §iªu/Feed_XiaoDiao";
	szSay[getn(szSay) + 1] = "\nRa khái/nothing";
	Say(g_szTitle.."TiÓu §iªu thao t¸c.", getn(szSay), szSay)
end

function Give_XiaoDiao()
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 20, 24, 1, 4);
end

function Give_XiaoDiaoFood()
	if gf_Judge_Room_Weight(11, 1) ~= 1 then
		return 0;
	end

	for i = 6, 12 do
		if i == 11 then
			AddItem(2, 97, i, 1, 4);
		else
			AddItem(2, 97, i, 100, 4);
		end
	end
end

function Feed_XiaoDiao()
	local nPetItemIndex = GetPlayerEquipIndex(12);
	if (nPetItemIndex == nil or nPetItemIndex <=0) then
		Msg2Player("C¸c h¹ ch­a cã thó c­ng, kh«ng thÓ tiÕn hµnh huÊn luyÖn!");
		return
	end;
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
	if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil)
		or (ItemGen ~= 2 or ItemDetail ~= 20)
	then
		Msg2Player("C¸c h¹ ch­a cã thó c­ng, kh«ng thÓ tiÕn hµnh huÊn luyÖn!");
		return
	end

	for i = 1, 99 do
		LevelUpPet(nPetItemIndex)
	end
end


--Xoa Kho Do
function ClearBagAllItem(bTag)
	if not bTag or tonumber(bTag) ~= 1 then
		Say(g_szTitle.."Ng­¬i muèn thanh lý tói?", 2, "§ång ý/#ClearBagAllItem(1)", "\n\nRa khái/nothing")
		return
	end
	ClearItemInPos();
	if GetItemCount(2,1,30644) < 1 and GetFreeItemRoom() > 0 then
		AddItem(2,1,30644,1)
	end
	if GetItemCount(2,1,30045) < 1 and GetFreeItemRoom() > 0 then
		AddItem(2,1,30045,1)
	end
end


--Bang Hoi
function TongOperation()
	local szSay = {
		g_szTitle.."Thao t¸c bang héi",
		"Ta muèn nhËn vËt phÈm bang héi/TongOperation_Create",
		"Ta muèn t¹o bang héi/CreateTongDialog",
		"Ta muèn th¨ng cÊp bang héi/TongOperation_update",
		"\nRa khái/nothing",
	};
	SelectSay(szSay);
end

function TongOperation_Create()
	if IsTongMember() ~= 0 then
		Talk(1,"","Ng­¬i ®· cã bang héi");
		return
	end
	if GetItemCount(2,0,555) < 1 then
		AddItem(2,0,555,1)
	end
	if GetItemCount(2,0,125) < 1 then
		AddItem(2,0,125,1)
	 end
	if GetReputation() < 2000 then
		ModifyReputation(2000 - GetReputation(), 0)
	end
end

function TongOperation_update()
	if GetTongLevel() < 3 then
		AddTongLevel();
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	end
end


--Kinh Mach
function GetJingMai()
	local szSay = {
		g_szTitle.."Thao th¸c kinh m¹ch",
		"TÈy ®iÓm kinh m¹ch/GetJingMai_Reset",
		format("%s/getZhenqi", "NhËn ch©n khÝ"),
		format("%s/getJingMaiTongRen", "NhËn Kinh M¹ch §ång Nh©n"),
		"\nRa khái/nothing",
	};
	if MeridianGetLevel() < 6 then
		tinsert(szSay, 2, "Th¨ng cÊp c¶nh giíi Vâ Th¸nh/GetJingMai_Update")
	end
	SelectSay(szSay);
end

function getZhenqi()
	AwardGenuineQi(180000);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function getJingMaiTongRen()
	AddItem(2, 1,30730, 99)
	AddItem(2, 1,30731, 99)
	AddItem(2, 1,30732, 99)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function GetJingMai_Update()
	local nLevel = MeridianGetLevel()
	for i = nLevel + 1, 6 do
		MeridianUpdateLevel()
	end
	local nNum = 1200000 - (MeridianGetDanTian() + MeridianGetQiHai());
	if nNum > 0 then
		AwardGenuineQi(nNum);
	end
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function GetJingMai_Reset(bTag)
	if not bTag or tonumber(bTag) ~= 1 then
		Say(g_szTitle.."Thao th¸c kinh m¹ch", 2,"§ång ý/#GetJingMai_Reset(1)", "Hñy bá/nothing")
		return 0;
	end
	MeridianRestore(-1);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

