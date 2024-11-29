--=============================================
-- Created by TuanNA5
--=============================================
Include("\\script\\lib\\globalfunctions.lua");

function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex, 30);
	
	tb_GoldBoss_Award = {
		{"Thi�n Cang L�nh", 80, {2,95,204,1}, 0},
		{"Thi�n M�n Kim L�nh", 80, {2,1,30370,1}, 0},
		{"Th�i Nh�t L�nh", 80, {2,1,30685,50}, 0},
		{"Uy H� H�n", 1, {2,1,31324,1}, 0},
		{"Thanh Long H�n", 1, {2,1,31223,1}, 0},
		{"H�a Ph�ng H�n", 1, {2,1,30769,1}, 0},
	}

	local nRand = GetRandByID(tb_GoldBoss_Award);
	local nRet, nItemIdx = gf_AddItemEx2(tb_GoldBoss_Award[nRand][3],tb_GoldBoss_Award[nRand][1],"Ho�t ��ng th�t n��ng","gi�t ��i Ni�n Th�",tb_GoldBoss_Award[nRand][4]);
	
	local n, id = AddItem(0,105,33,1,1,7,403); -- ni�n th�
	SetItemExpireTime(id, 3600*24*30); -- h�n s� d�ng 30 ng�y
	
	ModifyExp(10000000)
	Msg2Player("B�n nh�n ���c 10.000.000 �i�m kinh nghi�m.")
	
	local nMapID, nWx, nWy = GetNpcWorldPos(nNpcIndex)
	local nAddX = 0
	local nAddY = 0
	local nTargetNpc = 0
	
	-- xu�t hi�n 50 con ti�u ni�n th� khi ��i ni�n th� b� die
	for i = 1, 50 do
		nAddX = random(-30, 30)
		nAddY = random(-30, 30)		
		nTargetNpc = CreateNpc("Ti�u Ni�n Th�", "Ti�u Ni�n Th�", nMapID, nWx + nAddX, nWy + nAddY)
		SetNpcLifeTime(nTargetNpc, 60)	-- th�i gian t�n t�i 60 gi�y
		SetNpcScript(nTargetNpc, "\\script\\online\\viet_event\\200909\\2\\xiaoniansou_baoguo.lua")			
	end	
	
	SetNpcLifeTime(nNpcIndex, 0)	
end

--function OnDeath(nNpcIndex)
--	SetNpcLifeTime(nNpcIndex, 30);
	
--	ModifyExp(5000000)
--	Msg2Player("B�n nh�n ���c 5000000 �i�m kinh nghi�m.")
	
--	local nMapID, nWx, nWy = GetNpcWorldPos(nNpcIndex)
--	local nAddX = 0
--	local nAddY = 0
--	local nTargetNpc = 0
			
--	for i = 1, 100 do
--		nAddX = random(-70, 70)
--		nAddY = random(-70, 70)		
--		nTargetNpc = CreateNpc("Ti�u Ni�n Th�", "Ti�u K� L�n", nMapID, nWx + nAddX, nWy + nAddY)
--		SetNpcLifeTime(nTargetNpc, 120)
--		SetNpcScript(nTargetNpc, "\\script\\online\\viet_event\\200909\\2\\xiaoniansou_baoguo.lua")
--	end
	
--	if gf_Judge_Room_Weight(1, 100, " ") == 0 then
--       return 0;
--    end
    
 --   	if random(1,100) <= 50 then
--		local nRand = gf_GetRandItemByTable(tb_Niansou_Award,1000,1)
--		local nRet, nItemIdx = gf_AddItemEx2(tb_Niansou_Award[nRand][3],tb_Niansou_Award[nRand][1],"Hoat dong Tet Nguyen Dan","gi�t ��i K� L�n",tb_Niansou_Award[nRand][4])
--	end
	
--	SetNpcLifeTime(nNpcIndex, 0);
-- end