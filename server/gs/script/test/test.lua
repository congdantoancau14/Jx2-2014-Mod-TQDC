--���ָ��
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\system_switch_config.lua");

g_szTitle = "<color=green>H��ng d�n:<color>"
function OnUse(nItem)
	-- if 1 ~= IsExpSvrSystemOpen() then
		-- return
	-- end	
	local szSay = {
		 g_szTitle.." Ch�o em y�u s� d�ng l�nh b�i <color=red>Ngo�i Trang T� X�<color> ch�n nh�ng d�ng <color=green>VIP<color> nh�t nh�!",
                "Nh�n ngo�i trang/showListOutfit",
		"Nh�n n�i trang/showListEquip",
                 "Ra kh�i/nothing",
	};
	SelectSay(szSay);
end

tChoosenEquip = {}

tEquipPos = {
	[100] = "�o",
	[101] = "qu�n",
	[103] = "m�o",
	[102] = "ng�c",
	[-1] = "v� kh�",
}

tOutfitPos = {
	[108] = "m�o",
	[109] = "�o",
	[110] = "qu�n",
}

tbAttributes = {
	{485,"N�i, Ngo�i c�ng 40%, t�ng s�t th��ng 350 �i�m"},
	{841,"T�c �� xu�t chi�u 35, T�t c� thu�c t�nh 35"},
	{852,"Gi�n c�ch li�n hoa = 0, Th�i gian h� tr� t�n c�ng ph�ng th� t�ng 140%"},
	{304,"N�i l�c ti�u hao gi�m 80%"},
	{495,"Ph�ng ng� n�i ngo�i c�ng t�ng 8%"},
	{405,"N�n, Y, H� Y m�i 600s ph�c h�i �� b�n 7"},
	{406,"Tr�nh tr�ng th�i ph� 70%"},
	{13066,"mi�n d�ch Lo�n, Ng�, ��nh ng� 50%"},
	{13067,"mi�n d�ch ��ng y�n, Cho�ng, ��nh lui 50%"},
	{416,"M�i n�a gi�Y h�i sinh l�c ��ng ��i 7%"},
	{13350,"C�ng k�ch n�i c�ng +44%"},
	{13351,"Ngo�i c�ng t�ng 36%"},
	{252,"B� qua ph�ng ng� 35%"},
	{13355,"T�t c� thu�c t�nh +240, N�i ngo�i ph�ng t�ng 900 �i�m"},
	{13535,"Gi�i h�n sinh l�c 50%, B�o k�ch +56, B�o k�ch c�ng th�m 190"},
	{854,"Gi�i h�n sinh l�c t�ng 12% n�i l�c t�ng 4000"},
	{853,"Gi�i h�n sinh l�c t�ng 12% m�u t�ng 4000"},
	{851,"S�t th��ng t�ng 120, kh�ng t�t c� 25"},
	{850,"N�i c�ng 36% ,kh�ng t�t c� 20"},
	{849,"Ngo�i c�ng 36%"},
	{848,"Gi�i h�n m�u 4000, Gi�m th� th��ng 12%"},
	{847,"Gi�i h�n m�u 4000 Hi�u l�c thu�c 40%"},
	{846,"Gi�m n�i ph�ng 43%"},
	{845,"Gi�m ngo�i ph�ng 43%"},
	{844,"N�i c�ng t�ng 35%"},
	{843,"M�u t�ng 45%"},
	{842,"H� tr� m�t t�ch 14%"},
	{841,"Kh�ng t�t c� 35, T�ng t�c �� xu�t chi�u 35%"},
	{838,"H� tr� th�i gian 140%, Kh�ng t�t c� 30"},
	{493,"Ph�ng ng� ngo�i c�ng 8%"},
	{494,"Ph�ng ng� n�i c�ng 8%"},
	{491,"X�c su�t xu�t chi�u t�ng 8%"},
	{63,"Ph�ng ng� ngo�i c�ng gi�m 15%"},
	{64,"Ph�ng ng� n�i c�ng gi�m 15%"},
	{14524,"Kh�ng t�t c� t�ng 280, T�c �� xu�t chi�u 92%, t� l� ch�u ��n gi�m n�a"},
	{13507,"S�t th��ng t�ng 550, Kh�ng t�t c� t�ng 30 , B�o k�ch c�ng th�m 170"},
	{13069,"C�ng k�ch t�ng 84%"},
	{13355,"S�t th��ng t�ng 700,kh�ng t�t c� 240,n�i ngo�i ph�ng t�ng 900"},
	{496,"D�ng k� n�ng kh�ng t�nh t� l� gi�n c�ch 22%"},
}

tbChoosenAttrs = {}

function showListOutfit()
	local tbSay = {
		"Ngo�i Trang qu�n/#Get_Outfits(108)",
		"Ngo�i Trang �o/#Get_Outfits(109)",
		"Ngo�i Trang qu�n/#Get_Outfits(110)",
	}
	Say("",getn(tbSay),tbSay)
end;

function showListEquip()
	local tbSay = {
		"N�i Trang �o/#getEquip(100)",
		"N�i Trang qu�n/#getEquip(101)",
		"N�i Trang m�o/#getEquip(103)",
		"Trang s�c/#getEquip(102)",
		"V� kh�/#getEquip(-1)",
	}
	Say("",getn(tbSay),tbSay)
end;

function Get_Outfits(nPos)
	tChoosenEquip[1] = 0;
	tChoosenEquip[2] = nPos;
	local szPos = tOutfitPos[nPos];
	local szSay = {
		g_szTitle.."H�y l�a ch�n ngo�i trang *a th�ch!",
		"Chuy�n Sinh "..szPos.."/#SetID(514)",
		"V�n T�nh "..szPos.."/#SetID(1009)",
		"Xu�n � "..szPos.."/#SetID(1005)",
		"X�ch Vi�n L�ng H�c "..szPos.."/#SetID(985)",
		"Ch� Th�y "..szPos.."/#SetID(833)",
		"Ti�n Long "..szPos.."/#SetID(837)",
		"Di�p Th��ng Thu Phong "..szPos.."/#SetID(953)",
		"Thi�n V� C� Sa "..szPos.."/#SetID(713)",
		"Cung Th��ng Gi�c V� "..szPos.."/#SetID(937)",
		"T� D� "..szPos.."/#SetID(825)",
		"Kh�ng T��c Minh V��ng "..szPos.."/#SetID(929)",
		"Song ��n "..szPos.."/#SetID(901)",	
		"Ph�n H�a �m S��ng(�en)[th� l�c]/#SetID(701)",
			"Ra kh�i/nothing",
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
	tinsert(tbSay,"Tho�t/nothing")
	Say("Ch�n thu�c t�nh "..nLine,getn(tbSay),tbSay);
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