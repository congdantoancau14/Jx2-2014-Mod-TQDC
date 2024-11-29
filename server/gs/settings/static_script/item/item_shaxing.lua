Include("\\script\\lib\\globalfunctions.lua");
g_szTitle = "<color=green>S¸t Tinh LÖnh: <color>"

nVK = 20022;
ListItem = {
	[50003] = {
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
		[31]=	{14,nVK + 20},
		[32]=	{2,nVK + 21},
	},
	[50004] = 102,
	[50000] = 103,
	[50001] = 100,
	[50002] = 101,
};

ListType = {
	[50000] = 1,
	[50001] = 1,
	[50002] = 1,
	[50004] = 2,
	[50003] = 3
};

ListID = {
	[1] = { --Quan Ao
		[1] = {
			[2831] = {"§éc cæ (500)"},
			[2832] = {"S¸t th­¬ng (400)"},
			[2834] = {"Néi c«ng (30%)"},
			[2833] = {"Ngo¹i c«ng (30%)"},
			[2835] = {"Søc m¹nh (90)"},
			[2836] = {"Néi c«ng (90)"},
			[2837] = {"G©n cèt (90)"},
			[2838] = {"Th©n ph¸p (90)"},
			[2839] = {"Linh ho¹t (90)"}
		},
		[2] = {
			[2841] = {"Sinh mÖnh (45%)"},
			[2842] = {"Néi lùc (45%)"},
			[2843] = {"Tû lÖ phßng ngù Ngo¹i c«ng (6%)"},
			[2844] = {"Tû lÖ phßng ngù Néi c«ng (6%)"},
			[2845] = {"Tû lÖ phßng ngù Néi Ngo¹i c«ng (5%)"},
			[2846] = {"§iÓm hé gi¸p ngo¹i phßng (100)"},
			[2847] = {"§iÓm hé gi¸p néi phßng (100)"},
			[2848] = {"§iÓm hé gi¸p néi ngo¹i phßng (80)"},
		},
		[3] = {
			[2850] = {"NÐ tr¸nh mäi tr¹ng th¸i phô (4%)"},
			[2851] = {"Khi bÝ tÊn c«ng cã x¸c suÊt t¨ng tèc ®é di chuyÓn (40%)"},
			[2852] = {"§iÓm sinh lùc (16000)"},
			[2853] = {"Phßng thñ b¹o kÝch (35)"},
		},
	},
	[2] = { --Ngoc Boi
		[1] = {
			[2857] = {"§éc cæ (200)"},
			[2858] = {"S¸t th­¬ng (100)"},
			[2859] = {"C«ng kÝch (8%)"},
			[2860] = {"Søc m¹nh (70)"},
			[2861] = {"Néi c«ng (70)"},
			[2862] = {"G©n cèt (70)"},
			[2863] = {"Th©n ph¸p (70)"},
			[2864] = {"Linh ho¹t (70)"}
		},
		[2] = {
			[2866] = {"Sinh mÖnh (35%)"},
			[2867] = {"Néi lùc (35%)"},
			[2868] = {"Tû lÖ phßng ngù Ngo¹i c«ng (6%)"},
			[2869] = {"Tû lÖ phßng ngù Néi c«ng (6%)"},
			[2870] = {"Tû lÖ phßng ngù Néi Ngo¹i c«ng (5%)"},
			[2871] = {"§iÓm hé gi¸p ngo¹i phßng (80)"},
			[2872] = {"§iÓm hé gi¸p néi phßng (80)"},
			[2873] = {"§iÓm hé gi¸p néi ngo¹i phßng (60)"},
		},
		[3] = {
			[2875] = {"Dïng kü n¨ng kh«ng tÝnh tû lÖ gi·n c¸ch (10%)"},
			[2878] = {"S¸t th­¬ng thµnh néi lùc (10%)"},
			[2876] = {"Tû lÖ xuÊt chiªu t¨ng (6%)"},
			[2877] = {"Hç trî mËt tÝch (8%)"},
			[2880] = {"T¨ng hiÖu qu¶ th­¬ng d­îc (38%)"},
			[2879] = {"Gi¶m thêi gian thä th­¬ng (18%)"},
			[2881] = {"Néi lùc tiªu hao (40%)"},
			[2882] = {"§iÓm b¹o kÝch t¨ng (30)"},
		},
	},
	[3] = { --Vu Khi
		[1] = {
			[2903] = {"§éc cæ (800)"},
			[2904] = {"S¸t th­¬ng (400)"},
			[2905] = {"§iÓm b¹o kÝch (45)"},
		},
		[2] = {
			[2896] = {"Søc m¹nh (90)"},
			[2897] = {"Néi c«ng (90)"},
			[2898] = {"G©n cèt (90)"},
			[2899] = {"Th©n ph¸p (90)"},
			[2900] = {"Linh ho¹t (90)"},
			[2901] = {"Kh¸ng tÊt c¶ (90)"},
		},
		[3] = {
			[2907] = {"Gi¶m tû lÖ Ngo¹i phßng ®èi ph­¬ng (20%)"},
			[2908] = {"Gi¶m tû lÖ Néi phßng ®èi ph­¬ng (20%)"},
			[2909] = {"Gi¶m tû lÖ Néi Ngo¹i ®èi ph­¬ng (18%)"},
			[2910] = {"Gi¶m ®iÓm hé gi¸p Ngo¹i phßng ®èi ph­¬ng (300)"},
			[2911] = {"Gi¶m ®iÓm hé gi¸p Néi phßng ®èi ph­¬ng (300)"},
			[2912] = {"Gi¶m ®iÓm hé gi¸p Néi Ngo¹i ®èi ph­¬ng (200)"},
		},
	}
};

--ThamSo
nItem = 0;
ID1 = 0;
ID2 = 0;
ID3 = 0;
IDNB = 0;
IDVK = 0;

--Start
function OnUse(nItemIndex)
	nItem = GetItemParticular(nItemIndex)

	SetHHVH_1();
end

function SetID(nIDindex, nID)
	if nIDindex == 1 then 
		ID1 = nID;
		SetHHVH_2();
	elseif nIDindex == 2 then 
		ID2 = nID;
		SetHHVH_3();
	elseif nIDindex == 3 then 
		ID3 = nID;
		CheckItemType();
	elseif nIDindex == 102 then
		IDNB = nID;
		SetHHVH_End();
	elseif nIDindex == 0 then
		IDVK = nID;
		SetHHVH_End();
	end
end

function CheckItemType()
	if ListType[nItem] == 1 then 
		SetHHVH_End();
	end;
	if ListType[nItem] == 2 then 
		SetHHVH_NB();
	end;
	if ListType[nItem] == 3 then 
		SetHHVH_VK();
	end;
end

function SetHHVH_1()
	local tSay = {
	};
	
	for k, v in pairs(ListID[ListType[nItem]][1]) do
		tinsert(tSay,""..v[1].."/#SetID(1, "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle.."Lùa chän thuéc tÝnh 1", getn(tSay), tSay);
end

function SetHHVH_2()
	local tSay = {
	};
	
	for k, v in pairs(ListID[ListType[nItem]][2]) do
		tinsert(tSay,""..v[1].."/#SetID(2, "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle.."Lùa chän thuéc tÝnh 2", getn(tSay), tSay);
end

function SetHHVH_3()
	local tSay = {
	};
	
	for k, v in pairs(ListID[ListType[nItem]][3]) do
		tinsert(tSay,""..v[1].."/#SetID(3, "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle.."Lùa chän thuéc tÝnh 3", getn(tSay), tSay);
end

function SetHHVH_NB()
	local tSay = {
		"S¸t Tinh - Cöu Linh Háa Giíi /#SetID(102, 20004)",
		"S¸t Tinh - Ng­ng Ngäc Thæ Hoµn /#SetID(102, 20005)"
	};
	
	Say(g_szTitle.."Lùa chän lo¹i ngäc béi", getn(tSay), tSay);
end

function SetHHVH_VK()
	local tSay = {
		"HÖ ph¸i néi c«ng/#SetID(0, 1)",
		"HÖ ph¸i ngo¹i c«ng/#SetID(0, 2)",
		"HÖ ph¸i s¸t th­¬ng (Th©n Ph¸p)/#SetID(0, 3)",
		"HÖ ph¸i s¸t th­¬ng (Linh Ho¹t)/#SetID(0, 4)"
	};
	
	Say(g_szTitle.."Lùa chän hÖ ph¸i", getn(tSay), tSay);
end

function SetHHVH_End()
	if ListType[nItem] == 1 then
		local nTB = 20024 + GetBody() - 1;
		local pifeng,pIndex	=AddItem(0, ListItem[nItem], nTB ,1,1,-1,-1,-1,-1,-1,-1,0,0);
		SetItemFeedUpAttrs(pIndex,-1,-1,-1,ID1,ID2,ID3);
	elseif ListType[nItem] == 2 then 
		local pifeng,pIndex	=AddItem(0, 102, IDNB ,1,1,-1,-1,-1,-1,-1,-1,0,0);
		SetItemFeedUpAttrs(pIndex,-1,-1, -1,ID1,ID2,ID3);
	elseif ListType[nItem] ==  3 then
		for k, v in pairs(ListItem[nItem]) do
			if GetPlayerRoute() == k then
				local nA = v[1];
				local nB = v[2];
				
				if IDVK == 1 then
					local pifeng,pIndex	=AddItem(0,nA,nB,1,1,-1,-1,-1,-1,-1,-1,0,0);
					SetItemFeedUpAttrs(pIndex,2884,2894,-1,ID1,ID2,ID3);
				elseif IDVK == 2 then
					local lpifeng,pIndex	=AddItem(0,nA,nB,1,1,-1,-1,-1,-1,-1,-1,0,0);
					SetItemFeedUpAttrs(pIndex,2889,2894,-1,ID1,ID2,ID3);
				elseif IDVK == 3 then
					local pifeng,pIndex	=AddItem(0,nA,nB,1,1,-1,-1,-1,-1,-1,-1,0,0);
					SetItemFeedUpAttrs(pIndex,2891,2894,-1,ID1,ID2,ID3);
				elseif IDVK == 34then
					local ifeng,pIndex	=AddItem(0,nA,nB,1,1,-1,-1,-1,-1,-1,-1,0,0);
					SetItemFeedUpAttrs(pIndex,2892,2894,-1,ID1,ID2,ID3);
				end
			end
		end
	end

	DelItem(2,1,nItem,1);
end