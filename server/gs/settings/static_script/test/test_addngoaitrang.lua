--Ìå·þÖ¸Òý
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\system_switch_config.lua");

g_szTitle = "<color=green>H­íng dÉn:<color>"
function OnUse(nItem)
	-- if 1 ~= IsExpSvrSystemOpen() then
		-- return
	-- end	
	local szSay = {
		 g_szTitle.." Chµo em yªu sö dông lÖnh bµi <color=red>Ngo¹i Trang Tù Xö<color> chän nh÷ng dßng <color=green>VIP<color> nhÊt nhÐ!",
                "NhËn ngo¹i trang/showListOutfit",
		"NhËn néi trang/showListEquip",
                 "Ra khái/nothing",
	};
	SelectSay(szSay);
end

tChoosenEquip = {}

tEquipPos = {
	[100] = "¸o",
	[101] = "quÇn",
	[103] = "m·o",
	[102] = "ngäc",
	[-1] = "vò khÝ",
}

tOutfitPos = {
	[108] = "m·o",
	[109] = "¸o",
	[110] = "quÇn",
}

tbAttributes = {
	{485,"Néi, Ngo¹i c«ng 40%, t¨ng s¸t th­¬ng 350 ®iÓm"},
	{841,"Tèc ®é xuÊt chiªu 35, TÊt c¶ thuéc tÝnh 35"},
	{852,"Gi·n c¸ch liªn hoa = 0, Thêi gian hç trî tÊn c«ng phßng thñ t¨ng 140%"},
	{304,"Néi lùc tiªu hao gi¶m 80%"},
	{495,"Phßng ngù néi ngo¹i c«ng t¨ng 8%"},
	{405,"Nãn, Y, H¹ Y mçi 600s phôc håi ®é bÒn 7"},
	{406,"Tr¸nh tr¹ng th¸i phô 70%"},
	{13066,"miÔn dÞch Lo¹n, Ngñ, §¸nh ng· 50%"},
	{13067,"miÔn dÞch §øng yªn, Cho¸ng, §¸nh lui 50%"},
	{416,"Mçi n÷a gi©Y håi sinh lùc ®ång ®éi 7%"},
	{13350,"C«ng kÝch néi c«ng +44%"},
	{13351,"Ngo¹i c«ng t¨ng 36%"},
	{252,"Bá qua phßng ngù 35%"},
	{13355,"TÊt c¶ thuéc tÝnh +240, Néi ngo¹i phßng t¨ng 900 ®iÓm"},
	{13535,"Giíi h¹n sinh lùc 50%, B¹o kÝch +56, B¹o kÝch céng thªm 190"},
	{854,"Giíi h¹n sinh lùc t¨ng 12% néi lùc t¨ng 4000"},
	{853,"Giíi h¹n sinh lùc t¨ng 12% m¸u t¨ng 4000"},
	{851,"S¸t th­¬ng t¨ng 120, kh¸ng tÊt c¶ 25"},
	{850,"Néi c«ng 36% ,kh¸ng tÊt c¶ 20"},
	{849,"Ngo¹i c«ng 36%"},
	{848,"Giíi h¹n m¸u 4000, Gi¶m thä th­¬ng 12%"},
	{847,"Giíi h¹n m¸u 4000 HiÖu lùc thuèc 40%"},
	{846,"Gi¶m néi phßng 43%"},
	{845,"Gi¶m ngo¹i phßng 43%"},
	{844,"Néi c«ng t¨ng 35%"},
	{843,"M¸u t¨ng 45%"},
	{842,"Hç trî mËt tÞch 14%"},
	{841,"Kh¸ng tÊt c¶ 35, T¨ng tèc ®é xuÊt chiªu 35%"},
	{838,"Hç trî thêi gian 140%, Kh¸ng tÊt c¶ 30"},
	{493,"Phßng ngù ngo¹i c«ng 8%"},
	{494,"Phßng ngù néi c«ng 8%"},
	{491,"X¸c suÊt xuÊt chiªu t¨ng 8%"},
	{63,"Phßng ngù ngo¹i c«ng gi¶m 15%"},
	{64,"Phßng ngù néi c«ng gi¶m 15%"},
	{14524,"Kh¸ng tÊt c¶ t¨ng 280, Tèc ®é xuÊt chiªu 92%, tØ lÖ chÞu ®ßn gi¶m nöa"},
	{13507,"S¸t th­¬ng t¨ng 550, Kh¸ng tÊt c¶ t¨ng 30 , B¹o kÝch céng thªm 170"},
	{13069,"C«ng kÝch t¨ng 84%"},
	{13355,"S¸t th­¬ng t¨ng 700,kh¸ng tÊt c¶ 240,néi ngo¹i phßng t¨ng 900"},
	{496,"Dïng kü n¨ng kh«ng tÝnh tû lÖ gi·n c¸ch 22%"},
}

tbChoosenAttrs = {}

function showListOutfit()
	local tbSay = {
		"Ngo¹i Trang qu¸n/#Get_Outfits(108)",
		"Ngo¹i Trang ¸o/#Get_Outfits(109)",
		"Ngo¹i Trang quÇn/#Get_Outfits(110)",
	}
	Say("",getn(tbSay),tbSay)
end;

function showListEquip()
	local tbSay = {
		"Néi Trang ¸o/#getEquip(100)",
		"Néi Trang quÇn/#getEquip(101)",
		"Néi Trang m·o/#getEquip(103)",
		"Trang søc/#getEquip(102)",
		"Vò khÝ/#getEquip(-1)",
	}
	Say("",getn(tbSay),tbSay)
end;

function Get_Outfits(nPos)
	tChoosenEquip[1] = 0;
	tChoosenEquip[2] = nPos;
	local szPos = tOutfitPos[nPos];
	local szSay = {
		g_szTitle.."H·y lùa chän ngo¹i trang *a thÝch!",
		"ChuyÓn Sinh "..szPos.."/#SetID(514)",
		"VÊn T×nh "..szPos.."/#SetID(1009)",
		"Xu©n ý "..szPos.."/#SetID(1005)",
		"XÝch Viªn Léng H¹c "..szPos.."/#SetID(985)",
		"ChØ Thñy "..szPos.."/#SetID(833)",
		"TiÒn Long "..szPos.."/#SetID(837)",
		"DiÖp Th­îng Thu Phong "..szPos.."/#SetID(953)",
		"Thiªn Vò Cµ Sa "..szPos.."/#SetID(713)",
		"Cung Th­¬ng Gi¸c Vò "..szPos.."/#SetID(937)",
		"Tö D¹ "..szPos.."/#SetID(825)",
		"Khæng T­íc Minh V­¬ng "..szPos.."/#SetID(929)",
		"Song §¸n "..szPos.."/#SetID(901)",	
		"PhÇn Háa ¢m S­¬ng(®en)[thÕ lùc]/#SetID(701)",
			"Ra khái/nothing",
	};
	SelectSay(szSay);    
end


function SetID(particular)
        tChoosenEquip[3] = particular;
        showAttrList(1);
end


function showAttrList(nLine)
	local tbSay = {}
	for i=1,getn(tbAttributes) do
		if checkinChoosenList(tbAttributes[i][1]) == 0 then
			tinsert(tbSay,format("%s/#chooseAttr(%d,%d)",tbAttributes[i][2],nLine,tbAttributes[i][1]))
		end
	end
	tinsert(tbSay,"Tho¸t/nothing")
	Say("Chän thuéc tÝnh "..nLine,getn(tbSay),tbSay);
end

function checkinChoosenList(nAttr)
	for i=1,getn(tbChoosenAttrs) do 
		if tbChoosenAttrs[i] == nAttr then 
			return 1;
		end
	end
	return 0;
end;

function chooseAttr(nLine,nAttr)
	tbChoosenAttrs[nLine] = nAttr;
	if nLine == 3 then 
		get_outfits_end()
	else
		showAttrList(nLine+1);
	end
end;

function  get_outfits_end()
	local g = tChoosenEquip[1];
	local d = tChoosenEquip[2];
	local p = tChoosenEquip[3] + GetBody() - 1; 
	local nD1 = tbChoosenAttrs[1];
	local nD2 = tbChoosenAttrs[2];
	local nD3 = tbChoosenAttrs[3];
	AddItem(g,d,p, 1, 1,7,nD1,7,nD2,7,nD3,1,0);
	tbChoosenAttrs = {}
	DelItem(2,3,31302,1);	
end

function nothing() end;