Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nItem)
	Get();
end

g_szTitleMain = "<color=green>Kim xµ 6: <color> Thuéc tÝnh tù chän vµ cao nhÊt"
function Get()
	local tSay = {
		"Trang bÞ Kim Xµ Hoan L¨ng/Get_KXHL",
		"Trang bÞ Kim Xµ §»ng Giao/Get_KXDG",
		"Trang bÞ Kim Xµ Khëi Ph­îng/Get_KXKP",
		"Tho¸t/nothing",
	};
	Say(g_szTitleMain, getn(tSay), tSay);
end

g_szTitle1 = "<color=green>Kim Xµ §»ng Giao: <color>";
function Get_KXDG()
	local tSay = {
		"Kim Xµ §»ng Giao - Phi phong/#SetKXDG_1(152)",
		"Kim Xµ §»ng Giao - Huy Ch­¬ng/#SetKXDG_1(153)",
		"Kim Xµ §»ng Giao - ChiÕn Hµi/#SetKXDG_1(154)",
		"Hñy/nothing",
	};
	
	Say(g_szTitle1, getn(tSay), tSay);
end

function SetKXDG_1(nType)
	local List = {
		[2618] = {"Søc m¹nh"},
		[2619] = {"G©n cèt"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXDG_2("..nType..", "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle1.."Lùa chän thuéc tÝnh 1", getn(tSay), tSay);
end

function SetKXDG_2(nType,ID1)
	local List = {
		[2631] = {"Néi c«ng"},
		[2632] = {"Th©n ph¸p"},
		[2633] = {"Linh ho¹t"},
		[2634] = {"§iÓm sinh lùc"},
		[2635] = {"Tû lÖ ®iÓm sinh lùc"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXDG_3("..nType..","..ID1..", "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle1.."Lùa chän thuéc tÝnh 2", getn(tSay), tSay);
end

function SetKXDG_3(nType,ID1, ID2)
	local List = {
		[2647] = {"B¹o kÝch"},
		[2648] = {"§iÓm ngo¹i c«ng"},
		[2649] = {"§iÓm néi c«ng"},
		[2650] = {"§iÓm néi ngo¹i c«ng"},
		[2651] = {"T¨ng ®iÓm sinh lùc"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXDG_4("..nType..","..ID1..", "..ID2..", "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle1.."Lùa chän thuéc tÝnh 3", getn(tSay), tSay);
end

function SetKXDG_4(nType,ID1, ID2, ID3)
	local List = {
		[2665] = {"Phßng béc"},
		[2666] = {"Gi¶m béc"},
		[2667] = {"Hé gi¸p ngo¹i phßng"},
		[2668] = {"Hé gi¸p néi phßng"},
		[2669] = {"Hé gi¸p néi ngo¹i phßng"},
		[2670] = {"§iÓm sinh lùc"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXDG_5("..nType..","..ID1..", "..ID2..", "..ID3..", "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle1.."Lùa chän thuéc tÝnh 4", getn(tSay), tSay);
end

function SetKXDG_5(nType,ID1, ID2, ID3,ID4)
	local List = {
		[2678] = {"Søc m¹nh"},
		[2679] = {"G©n cèt"},
		[2680] = {"T¨ng tû lÖ ®iÓm sinh lùc"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXDG_6("..nType..","..ID1..", "..ID2..", "..ID3..", "..ID4..", "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle1.."Lùa chän thuéc tÝnh 5", getn(tSay), tSay);
end

function SetKXDG_6(nType,ID1, ID2, ID3,ID4,ID5)
	if nType == 154 then
		List = {
			[2703] = {"Tèc ®é ch¹y"},
			[2704] = {"Ph¸t huy vâ c«ng"},
			[2705] = {"Gi¶m nöa thä th­¬ng"},
			[2706] = {"X¸c suÊt chuÈn x¸c"},
		};
	else
		List = {
			[2690] = {"Giíi h¹n cao nhÊt ngo¹i c«ng vò khÝ"},
			[2691] = {"Giíi h¹n thÊp nhÊt ngo¹i c«ng vò khÝ"},
			[2692] = {"Tû lÖ ngo¹i c«ng"},
			[2693] = {"§iÓm tæng c«ng kÝch ngo¹i c«ng"},
		};
	end
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXDG_End("..nType..","..ID1..", "..ID2..", "..ID3..", "..ID4..", "..ID5..", "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle1.."Lùa chän thuéc tÝnh 6", getn(tSay), tSay);
end

function SetKXDG_End(nType,ID1,ID2,ID3,ID4,ID5,ID6)
	local pifeng,pIndex = AddItem(0,nType,33,1,4,-1,-1,-1,-1,-1,-1,0,15)
    FeedItem(pIndex,1000000)
	SetItemFeedUpAttrs(pIndex,ID1,ID2,ID3,ID4,ID5,ID6);
	DelItem(2,1,31286,1);
end


g_szTitle2 = "<color=green>Kim Xµ Hoan L¨ng: <color>";
function Get_KXHL()
	local tSay = {
		"Kim Xµ Hoan L¨ng - Phi phong/#SetKXHL_1(152)",
		"Kim Xµ Hoan L¨ng - Huy Ch­¬ng/#SetKXHL_1(153)",
		"Kim Xµ Hoan L¨ng - ChiÕn Hµi/#SetKXHL_1(154)",
		"Hñy/nothing",
	};
	
	Say(g_szTitle2, getn(tSay), tSay);
end

function SetKXHL_1(nType)
	local List = {
		[2514] = {"Linh ho¹t"},
		[2515] = {"Th©n Ph¸p"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXHL_2("..nType..", "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle2.."Lùa chän thuéc tÝnh 1", getn(tSay), tSay);
end

function SetKXHL_2(nType,ID1)
	local List = {
		[2527] = {"Néi c«ng"},
		[2528] = {"Søc m¹nh"},
		[2529] = {"G©n cèt"},
		[2530] = {"§iÓm sinh lùc"},
		[2531] = {"Tû lÖ ®iÓm sinh lùc"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXHL_3("..nType..","..ID1..", "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle2.."Lùa chän thuéc tÝnh 2", getn(tSay), tSay);
end

function SetKXHL_3(nType,ID1, ID2)
	local List = {
		[2543] = {"B¹o kÝch"},
		[2544] = {"§iÓm ngo¹i c«ng"},
		[2545] = {"§iÓm néi c«ng"},
		[2546] = {"§iÓm néi ngo¹i c«ng"},
		[2547] = {"T¨ng ®iÓm sinh lùc"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXHL_4("..nType..","..ID1..", "..ID2..", "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle2.."Lùa chän thuéc tÝnh 3", getn(tSay), tSay);
end

function SetKXHL_4(nType,ID1, ID2, ID3)
	local List = {
		[2561] = {"Phßng béc"},
		[2562] = {"Gi¶m béc"},
		[2563] = {"Hé gi¸p ngo¹i phßng"},
		[2564] = {"Hé gi¸p néi phßng"},
		[2565] = {"Hé gi¸p néi ngo¹i phßng"},
		[2566] = {"§iÓm sinh mÖnh"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXHL_5("..nType..","..ID1..", "..ID2..", "..ID3..", "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle2.."Lùa chän thuéc tÝnh 4", getn(tSay), tSay);
end

function SetKXHL_5(nType,ID1, ID2, ID3,ID4)
	local List = {
		[2572] = {"Linh ho¹t"},
		[2573] = {"Th©n ph¸p"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXHL_6("..nType..","..ID1..", "..ID2..", "..ID3..", "..ID4..", "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle2.."Lùa chän thuéc tÝnh 5", getn(tSay), tSay);
end

function SetKXHL_6(nType,ID1, ID2, ID3,ID4,ID5)

	if nType == 154 then
		List = {
			[2608] = {"Tèc ®é ch¹y"},
			[2609] = {"Ph¸t huy Vâ c«ng"},
			[2610] = {"Gi¶m nöa chÞu th­¬ng"},
			[2611] = {"X¸c suÊt chuÈn x¸c"},
			[2612] = {"Toµn thuéc tÝnh"},
		};
	else
		List = {
			[2583] = {"T¨ng s¸t th­¬ng"},
			[2584] = {"C«ng kÝch kÌm ®éc"},
			[2585] = {"S¸t th­¬ng ®éc trïng"},
			[2586] = {"Tû lÖ kh¸ng tr¹ng th¸i bÊt th­êng"},
		};
	end
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXHL_End("..nType..","..ID1..", "..ID2..", "..ID3..", "..ID4..", "..ID5..", "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle2.."Lùa chän thuéc tÝnh 6", getn(tSay), tSay);
end

function SetKXHL_End(nType,ID1,ID2,ID3,ID4,ID5,ID6)
	local pifeng,pIndex = AddItem(0,nType,32,1,4,-1,-1,-1,-1,-1,-1,0,15)
    FeedItem(pIndex,1000000)
	SetItemFeedUpAttrs(pIndex,ID1,ID2,ID3,ID4,ID5,ID6);
	DelItem(2,1,31286,1);
end


g_szTitle3 = "<color=green>Kim Xµ Khëi Ph­îng: <color>";

function Get_KXKP()
	local tSay = {
		"Kim Xµ Khëi Ph­îng - Phi phong/#SetKXKP_1(152)",
		"Kim Xµ Khëi Ph­îng - Huy Ch­¬ng/#SetKXKP_1(153)",
		"Kim Xµ Khëi Ph­îng - ChiÕn Hµi/#SetKXKP_1(154)",
		"Hñy/nothing",
	};
	
	Say(g_szTitle3, getn(tSay), tSay);
end

function SetKXKP_1(nType)
	local List = {
		[2712] = {"Néi c«ng"},
		[2713] = {"G©n cèt"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXKP_2("..nType..", "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle3.."Lùa chän thuéc tÝnh 1", getn(tSay), tSay);
end

function SetKXKP_2(nType,ID1)
	local List = {
		[2725] = {"Søc m¹nh"},
		[2726] = {"Th©n ph¸p"},
		[2727] = {"Linh ho¹t"},
		[2728] = {"§iÓm sinh lùc"},
		[2729] =  {"Tû lÖ ®iÓm sinh lùc"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXKP_3("..nType..","..ID1..", "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle3.."Lùa chän thuéc tÝnh 2", getn(tSay), tSay);
end

function SetKXKP_3(nType,ID1, ID2)
	local List = {
		[2741] = {"B¹o kÝch"},
		[2742] = {"§iÓm ngo¹i c«ng"},
		[2743] = {"§iÓm néi c«ng"},
		[2744] = {"§iÓm néi ngo¹i c«ng"},
		[2745] = {"T¨ng ®iÓm sinh lùc"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXKP_4("..nType..","..ID1..", "..ID2..", "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle3.."Lùa chän thuéc tÝnh 3", getn(tSay), tSay);
end

function SetKXKP_4(nType,ID1, ID2, ID3)
	local List = {
		[2759] = {"Phßng béc"},
		[2760] = {"Gi¶m béc"},
		[2761] = {"Hé gi¸p ngo¹i phßng"},
		[2762] = {"Hé gi¸p néi phßng"},
		[2763] = {"Hé gi¸p néi ngo¹i phßng"},
		[2764] = {"§iÓm sinh lùc"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXKP_5("..nType..","..ID1..", "..ID2..", "..ID3..", "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle3.."Lùa chän thuéc tÝnh 4", getn(tSay), tSay);
end

function SetKXKP_5(nType,ID1, ID2, ID3,ID4)
	local List = {
		[2772] = {"Néi c«ng"},
		[2773] = {"Th©n ph¸p"},
		[2774] = {"Linh ho¹t"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXKP_6("..nType..","..ID1..", "..ID2..", "..ID3..", "..ID4..", "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle3.."Lùa chän thuéc tÝnh 5", getn(tSay), tSay);
end

function SetKXKP_6(nType,ID1, ID2, ID3,ID4,ID5)

	if nType == 154 then
		List = {
			[2803] = {"Rót ng¾n thêi gian thä th­¬ng"},
			[2799] = {"Tèc ®é ch¹y"},
			[2800] = {"Ph¸t huy vâ c«ng"},
			[2801] = {"Gi¶m nöa thä th­¬ng"},
			[2802] = {"X¸c suÊt chuÈn x¸c"},
		};
	else
		List = {
			[2784] = {"Giíi h¹n cao nhÊt néi c«ng vò khÝ"},
			[2785] = {"Giíi h¹n thÊp nhÊt néi c«ng vò khÝ"},
			[2786] = {"T¨ng néi c«ng"},
			[2787] = {"§iÓm c«ng kÝch néi c«ng"},
		};
	end
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXKP_End("..nType..","..ID1..", "..ID2..", "..ID3..", "..ID4..", "..ID5..", "..k..")");
	end
	
	tinsert(tSay,"Hñy/nothing");
	Say(g_szTitle3.."Lùa chän thuéc tÝnh 6", getn(tSay), tSay);
end

function SetKXKP_End(nType,ID1,ID2,ID3,ID4,ID5,ID6)
	local pifeng,pIndex = AddItem(0,nType,34,1,4,-1,-1,-1,-1,-1,-1,0,15)
    FeedItem(pIndex,1000000)
	SetItemFeedUpAttrs(pIndex,ID1,ID2,ID3,ID4,ID5,ID6);
	DelItem(2,1,31286,1);
end