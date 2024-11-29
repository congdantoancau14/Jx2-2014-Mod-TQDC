Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nItem)
	Get();
end

g_szTitleMain = "<color=green>Kim x� 6: <color> Thu�c t�nh t� ch�n v� cao nh�t"
function Get()
	local tSay = {
		"Trang b� Kim X� Hoan L�ng/Get_KXHL",
		"Trang b� Kim X� ��ng Giao/Get_KXDG",
		"Trang b� Kim X� Kh�i Ph��ng/Get_KXKP",
		"Tho�t/nothing",
	};
	Say(g_szTitleMain, getn(tSay), tSay);
end

g_szTitle1 = "<color=green>Kim X� ��ng Giao: <color>";
function Get_KXDG()
	local tSay = {
		"Kim X� ��ng Giao - Phi phong/#SetKXDG_1(152)",
		"Kim X� ��ng Giao - Huy Ch��ng/#SetKXDG_1(153)",
		"Kim X� ��ng Giao - Chi�n H�i/#SetKXDG_1(154)",
		"H�y/nothing",
	};
	
	Say(g_szTitle1, getn(tSay), tSay);
end

function SetKXDG_1(nType)
	local List = {
		[2618] = {"S�c m�nh"},
		[2619] = {"G�n c�t"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXDG_2("..nType..", "..k..")");
	end
	
	tinsert(tSay,"H�y/nothing");
	Say(g_szTitle1.."L�a ch�n thu�c t�nh 1", getn(tSay), tSay);
end

function SetKXDG_2(nType,ID1)
	local List = {
		[2631] = {"N�i c�ng"},
		[2632] = {"Th�n ph�p"},
		[2633] = {"Linh ho�t"},
		[2634] = {"�i�m sinh l�c"},
		[2635] = {"T� l� �i�m sinh l�c"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXDG_3("..nType..","..ID1..", "..k..")");
	end
	
	tinsert(tSay,"H�y/nothing");
	Say(g_szTitle1.."L�a ch�n thu�c t�nh 2", getn(tSay), tSay);
end

function SetKXDG_3(nType,ID1, ID2)
	local List = {
		[2647] = {"B�o k�ch"},
		[2648] = {"�i�m ngo�i c�ng"},
		[2649] = {"�i�m n�i c�ng"},
		[2650] = {"�i�m n�i ngo�i c�ng"},
		[2651] = {"T�ng �i�m sinh l�c"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXDG_4("..nType..","..ID1..", "..ID2..", "..k..")");
	end
	
	tinsert(tSay,"H�y/nothing");
	Say(g_szTitle1.."L�a ch�n thu�c t�nh 3", getn(tSay), tSay);
end

function SetKXDG_4(nType,ID1, ID2, ID3)
	local List = {
		[2665] = {"Ph�ng b�c"},
		[2666] = {"Gi�m b�c"},
		[2667] = {"H� gi�p ngo�i ph�ng"},
		[2668] = {"H� gi�p n�i ph�ng"},
		[2669] = {"H� gi�p n�i ngo�i ph�ng"},
		[2670] = {"�i�m sinh l�c"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXDG_5("..nType..","..ID1..", "..ID2..", "..ID3..", "..k..")");
	end
	
	tinsert(tSay,"H�y/nothing");
	Say(g_szTitle1.."L�a ch�n thu�c t�nh 4", getn(tSay), tSay);
end

function SetKXDG_5(nType,ID1, ID2, ID3,ID4)
	local List = {
		[2678] = {"S�c m�nh"},
		[2679] = {"G�n c�t"},
		[2680] = {"T�ng t� l� �i�m sinh l�c"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXDG_6("..nType..","..ID1..", "..ID2..", "..ID3..", "..ID4..", "..k..")");
	end
	
	tinsert(tSay,"H�y/nothing");
	Say(g_szTitle1.."L�a ch�n thu�c t�nh 5", getn(tSay), tSay);
end

function SetKXDG_6(nType,ID1, ID2, ID3,ID4,ID5)
	if nType == 154 then
		List = {
			[2703] = {"T�c �� ch�y"},
			[2704] = {"Ph�t huy v� c�ng"},
			[2705] = {"Gi�m n�a th� th��ng"},
			[2706] = {"X�c su�t chu�n x�c"},
		};
	else
		List = {
			[2690] = {"Gi�i h�n cao nh�t ngo�i c�ng v� kh�"},
			[2691] = {"Gi�i h�n th�p nh�t ngo�i c�ng v� kh�"},
			[2692] = {"T� l� ngo�i c�ng"},
			[2693] = {"�i�m t�ng c�ng k�ch ngo�i c�ng"},
		};
	end
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXDG_End("..nType..","..ID1..", "..ID2..", "..ID3..", "..ID4..", "..ID5..", "..k..")");
	end
	
	tinsert(tSay,"H�y/nothing");
	Say(g_szTitle1.."L�a ch�n thu�c t�nh 6", getn(tSay), tSay);
end

function SetKXDG_End(nType,ID1,ID2,ID3,ID4,ID5,ID6)
	local pifeng,pIndex = AddItem(0,nType,33,1,4,-1,-1,-1,-1,-1,-1,0,15)
    FeedItem(pIndex,1000000)
	SetItemFeedUpAttrs(pIndex,ID1,ID2,ID3,ID4,ID5,ID6);
	DelItem(2,1,31286,1);
end


g_szTitle2 = "<color=green>Kim X� Hoan L�ng: <color>";
function Get_KXHL()
	local tSay = {
		"Kim X� Hoan L�ng - Phi phong/#SetKXHL_1(152)",
		"Kim X� Hoan L�ng - Huy Ch��ng/#SetKXHL_1(153)",
		"Kim X� Hoan L�ng - Chi�n H�i/#SetKXHL_1(154)",
		"H�y/nothing",
	};
	
	Say(g_szTitle2, getn(tSay), tSay);
end

function SetKXHL_1(nType)
	local List = {
		[2514] = {"Linh ho�t"},
		[2515] = {"Th�n Ph�p"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXHL_2("..nType..", "..k..")");
	end
	
	tinsert(tSay,"H�y/nothing");
	Say(g_szTitle2.."L�a ch�n thu�c t�nh 1", getn(tSay), tSay);
end

function SetKXHL_2(nType,ID1)
	local List = {
		[2527] = {"N�i c�ng"},
		[2528] = {"S�c m�nh"},
		[2529] = {"G�n c�t"},
		[2530] = {"�i�m sinh l�c"},
		[2531] = {"T� l� �i�m sinh l�c"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXHL_3("..nType..","..ID1..", "..k..")");
	end
	
	tinsert(tSay,"H�y/nothing");
	Say(g_szTitle2.."L�a ch�n thu�c t�nh 2", getn(tSay), tSay);
end

function SetKXHL_3(nType,ID1, ID2)
	local List = {
		[2543] = {"B�o k�ch"},
		[2544] = {"�i�m ngo�i c�ng"},
		[2545] = {"�i�m n�i c�ng"},
		[2546] = {"�i�m n�i ngo�i c�ng"},
		[2547] = {"T�ng �i�m sinh l�c"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXHL_4("..nType..","..ID1..", "..ID2..", "..k..")");
	end
	
	tinsert(tSay,"H�y/nothing");
	Say(g_szTitle2.."L�a ch�n thu�c t�nh 3", getn(tSay), tSay);
end

function SetKXHL_4(nType,ID1, ID2, ID3)
	local List = {
		[2561] = {"Ph�ng b�c"},
		[2562] = {"Gi�m b�c"},
		[2563] = {"H� gi�p ngo�i ph�ng"},
		[2564] = {"H� gi�p n�i ph�ng"},
		[2565] = {"H� gi�p n�i ngo�i ph�ng"},
		[2566] = {"�i�m sinh m�nh"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXHL_5("..nType..","..ID1..", "..ID2..", "..ID3..", "..k..")");
	end
	
	tinsert(tSay,"H�y/nothing");
	Say(g_szTitle2.."L�a ch�n thu�c t�nh 4", getn(tSay), tSay);
end

function SetKXHL_5(nType,ID1, ID2, ID3,ID4)
	local List = {
		[2572] = {"Linh ho�t"},
		[2573] = {"Th�n ph�p"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXHL_6("..nType..","..ID1..", "..ID2..", "..ID3..", "..ID4..", "..k..")");
	end
	
	tinsert(tSay,"H�y/nothing");
	Say(g_szTitle2.."L�a ch�n thu�c t�nh 5", getn(tSay), tSay);
end

function SetKXHL_6(nType,ID1, ID2, ID3,ID4,ID5)

	if nType == 154 then
		List = {
			[2608] = {"T�c �� ch�y"},
			[2609] = {"Ph�t huy V� c�ng"},
			[2610] = {"Gi�m n�a ch�u th��ng"},
			[2611] = {"X�c su�t chu�n x�c"},
			[2612] = {"To�n thu�c t�nh"},
		};
	else
		List = {
			[2583] = {"T�ng s�t th��ng"},
			[2584] = {"C�ng k�ch k�m ��c"},
			[2585] = {"S�t th��ng ��c tr�ng"},
			[2586] = {"T� l� kh�ng tr�ng th�i b�t th��ng"},
		};
	end
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXHL_End("..nType..","..ID1..", "..ID2..", "..ID3..", "..ID4..", "..ID5..", "..k..")");
	end
	
	tinsert(tSay,"H�y/nothing");
	Say(g_szTitle2.."L�a ch�n thu�c t�nh 6", getn(tSay), tSay);
end

function SetKXHL_End(nType,ID1,ID2,ID3,ID4,ID5,ID6)
	local pifeng,pIndex = AddItem(0,nType,32,1,4,-1,-1,-1,-1,-1,-1,0,15)
    FeedItem(pIndex,1000000)
	SetItemFeedUpAttrs(pIndex,ID1,ID2,ID3,ID4,ID5,ID6);
	DelItem(2,1,31286,1);
end


g_szTitle3 = "<color=green>Kim X� Kh�i Ph��ng: <color>";

function Get_KXKP()
	local tSay = {
		"Kim X� Kh�i Ph��ng - Phi phong/#SetKXKP_1(152)",
		"Kim X� Kh�i Ph��ng - Huy Ch��ng/#SetKXKP_1(153)",
		"Kim X� Kh�i Ph��ng - Chi�n H�i/#SetKXKP_1(154)",
		"H�y/nothing",
	};
	
	Say(g_szTitle3, getn(tSay), tSay);
end

function SetKXKP_1(nType)
	local List = {
		[2712] = {"N�i c�ng"},
		[2713] = {"G�n c�t"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXKP_2("..nType..", "..k..")");
	end
	
	tinsert(tSay,"H�y/nothing");
	Say(g_szTitle3.."L�a ch�n thu�c t�nh 1", getn(tSay), tSay);
end

function SetKXKP_2(nType,ID1)
	local List = {
		[2725] = {"S�c m�nh"},
		[2726] = {"Th�n ph�p"},
		[2727] = {"Linh ho�t"},
		[2728] = {"�i�m sinh l�c"},
		[2729] =  {"T� l� �i�m sinh l�c"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXKP_3("..nType..","..ID1..", "..k..")");
	end
	
	tinsert(tSay,"H�y/nothing");
	Say(g_szTitle3.."L�a ch�n thu�c t�nh 2", getn(tSay), tSay);
end

function SetKXKP_3(nType,ID1, ID2)
	local List = {
		[2741] = {"B�o k�ch"},
		[2742] = {"�i�m ngo�i c�ng"},
		[2743] = {"�i�m n�i c�ng"},
		[2744] = {"�i�m n�i ngo�i c�ng"},
		[2745] = {"T�ng �i�m sinh l�c"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXKP_4("..nType..","..ID1..", "..ID2..", "..k..")");
	end
	
	tinsert(tSay,"H�y/nothing");
	Say(g_szTitle3.."L�a ch�n thu�c t�nh 3", getn(tSay), tSay);
end

function SetKXKP_4(nType,ID1, ID2, ID3)
	local List = {
		[2759] = {"Ph�ng b�c"},
		[2760] = {"Gi�m b�c"},
		[2761] = {"H� gi�p ngo�i ph�ng"},
		[2762] = {"H� gi�p n�i ph�ng"},
		[2763] = {"H� gi�p n�i ngo�i ph�ng"},
		[2764] = {"�i�m sinh l�c"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXKP_5("..nType..","..ID1..", "..ID2..", "..ID3..", "..k..")");
	end
	
	tinsert(tSay,"H�y/nothing");
	Say(g_szTitle3.."L�a ch�n thu�c t�nh 4", getn(tSay), tSay);
end

function SetKXKP_5(nType,ID1, ID2, ID3,ID4)
	local List = {
		[2772] = {"N�i c�ng"},
		[2773] = {"Th�n ph�p"},
		[2774] = {"Linh ho�t"},
	};
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXKP_6("..nType..","..ID1..", "..ID2..", "..ID3..", "..ID4..", "..k..")");
	end
	
	tinsert(tSay,"H�y/nothing");
	Say(g_szTitle3.."L�a ch�n thu�c t�nh 5", getn(tSay), tSay);
end

function SetKXKP_6(nType,ID1, ID2, ID3,ID4,ID5)

	if nType == 154 then
		List = {
			[2803] = {"R�t ng�n th�i gian th� th��ng"},
			[2799] = {"T�c �� ch�y"},
			[2800] = {"Ph�t huy v� c�ng"},
			[2801] = {"Gi�m n�a th� th��ng"},
			[2802] = {"X�c su�t chu�n x�c"},
		};
	else
		List = {
			[2784] = {"Gi�i h�n cao nh�t n�i c�ng v� kh�"},
			[2785] = {"Gi�i h�n th�p nh�t n�i c�ng v� kh�"},
			[2786] = {"T�ng n�i c�ng"},
			[2787] = {"�i�m c�ng k�ch n�i c�ng"},
		};
	end
	
	local tSay = {};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[1].."/#SetKXKP_End("..nType..","..ID1..", "..ID2..", "..ID3..", "..ID4..", "..ID5..", "..k..")");
	end
	
	tinsert(tSay,"H�y/nothing");
	Say(g_szTitle3.."L�a ch�n thu�c t�nh 6", getn(tSay), tSay);
end

function SetKXKP_End(nType,ID1,ID2,ID3,ID4,ID5,ID6)
	local pifeng,pIndex = AddItem(0,nType,34,1,4,-1,-1,-1,-1,-1,-1,0,15)
    FeedItem(pIndex,1000000)
	SetItemFeedUpAttrs(pIndex,ID1,ID2,ID3,ID4,ID5,ID6);
	DelItem(2,1,31286,1);
end