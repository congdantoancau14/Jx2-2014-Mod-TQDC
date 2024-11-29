Include("\\script\\online\\snowbattle\\head.lua");
Include("\\script\\lib\\globalfunctions.lua");

CR_Head = "<color=green>Xa Phu ��u tr��ng Tuy�t: <color>Ho�t ��ng ��u Tr��ng Tuy�t 1 ng�y ti�n h�nh 3 l�n, th�i gian bao g�m 11:30, 17:30, 21:30, m�i tr�n ��u duy tr� 1 gi�; �i�u ki�n tham gia c�p 80 tr� l�n, �� gia nh�p m�n ph�i, �� k�ch ho�t c�nh gi�i kinh m�ch.";

function main()
	local CR_Menu1 = {
		"V�o Khu n�m tuy�t (Ti�u hao 10 v�ng t�ng 10 Ti�u Tuy�t C�u)/CR_DoEnter",
		"Mua ��n tuy�t c�u/CR_DoShowSaleList",
		"Gi�i th�ch ho�t ��ng/CR_Information",
		"R�i kh�i/gf_DoNothing"
	}
	local CR_Menu2 = {
		"R�i kh�i ��u tr��ng tuy�t/CR_DoExit",
		"Mua ��n tuy�t c�u/CR_DoShowSaleList",
		"Gi�i th�ch ho�t ��ng/CR_Information",
		"R�i kh�i/gf_DoNothing"
	}
	if 0 == SB_IsInSnowMap() then
		Say(CR_Head, getn(CR_Menu1), CR_Menu1);
	else
		Say(CR_Head, getn(CR_Menu2), CR_Menu2);
	end
end

function CR_DoEnter()
	local mapID = GetWorldPos();
  mapID = SB_MapMap[mapID];
	if 1 ~= SB_CheckState(mapID) then
		Talk(1, "", "R�t ti�c, ��t ho�t ��ng n�y �� k�t th�c, h�y tr� l�i l�n sau");
		return
	end
	if 1 ~= SB_CheckPlayerCount(mapID) then
		Talk(1, "", "R�t ti�c, ��u tr��ng �� ��y, vui l�ng tr� l�i l�n sau");
		return
	end
	if gf_CheckBaseCondition(SB_MIN_LEVEL) ~= 1 then
		return 
	end
	if MeridianGetLevel() < 1 then
		Talk(1,"","R�t ti�c, c�c h� ch�a khai th�ng c�nh gi�i kinh m�ch");
		return
	end
	if 1 ~= SB_CheckEquipment() then
		Talk(1, "", "Xin l�i, h�y th�o v� kh� xu�ng");
		return
	end
	if GetCash() < SB_COST then
		Talk(1,"","R�t ti�c, ng�n l��ng c�c h� mang theo kh�ng ��!");
		return
	end	
	local itemID = {2, 3, 219, 10};
	local itemName = "Ti�u tuy�t c�u";
	gf_AddItemEx2(itemID, itemName, "��nh tr�n tuy�t", "application gift");
	mf_JoinMission(SB_MISSION_ID, SB_CAMP_ID, mapID);
end

function CR_DoExit()
	DelMSPlayer(SB_MISSION_ID, SB_CAMP_ID);
end

function CR_DoShowSaleList()
	local CR_Menu3_1 = {
		"10 ��i Tuy�t C�u (30 v�ng)/#CR_DoBuy(1)",
		"10 Trung Tuy�t C�u (20 v�ng)/#CR_DoBuy(2)",
		"10 Ti�u Tuy�t C�u (10 v�ng)/#CR_DoBuy(3)",
		"Ta ch� gh� ch�i/gf_DoNothing",
	}
	Say(CR_Head, getn(CR_Menu3_1), CR_Menu3_1);
end

function CR_DoBuy(index)
	local CR_SaleList = {
		{{2, 3, 221}, "��i tuy�t c�u", 10, 300000},
		{{2, 3, 220}, "Trung tuy�t c�u", 10, 200000},
		{{2, 3, 219}, "Ti�u tuy�t c�u", 10, 100000},
	}
	local itemID = CR_SaleList[index][1];
	local itemName = CR_SaleList[index][2];
	local itemCount = CR_SaleList[index][3];
	local cost = CR_SaleList[index][4];
	if GetCash() < cost then
		Talk(1,"","H�nh trang kh�ng �� ti�n!");
		return
	end
	if 1 == gf_Judge_Room_Weight(1, itemCount, "") then
		if 1 == Pay(cost) then
			local tmpItemID = {itemID[1], itemID[2], itemID[3], itemCount};
			gf_AddItemEx2(tmpItemID, itemName, "��nh tr�n tuy�t", "Mua ��n tuy�t c�u");
		end
	end
	CR_DoShowSaleList();	
end

function CR_Information()
	Talk(1,"","Sau khi ��i hi�p v�o khu n�m tuy�t, ��i tho�i v�i Thi�n S�n Tuy�t Y�u � ch�nh gi�a, c� th� tri�u h�i Tuy�t Qu�i. Sau khi ��nh b�i t�t c� Tuy�t Qu�i s� xu�t hi�n l��t ti�p theo, t�ng c�ng c� 10 l��t. Sau khi ��nh xong 10 l��t th� ��i tho�i v�i Thi�n S�n Tuy�t Y�u, ��nh b�i BOSS s� nh�n ���c ph�n th��ng phong ph�. Trong khu n�m tuy�t, ch� c� th� d�ng k� n�ng tuy�t c�u, kh�ng th� trang b� v� kh�.")
end
