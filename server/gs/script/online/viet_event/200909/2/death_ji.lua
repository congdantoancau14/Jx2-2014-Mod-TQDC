--==============================================
--create by baiyun 2009.11.22
--describe:Խ�ϰ�12�·�ʥ���ڻ�������ű�
--==============================================
Include("\\script\\online\\viet_event\\200909\\event_head.lua")

function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex, 30);
	-- if random(1,100) <= 25 then
		-- AddItem(2,1,30368,2);
		-- AddItem(2,1,30369,2);
		-- AddItem(2,1,30499,2);
		-- WriteLogEx("Ho�t ��ng Th?t N��ng","nh�n",2,"nguy�n li�u m�i lo�i");
	-- end
	
	AddItem(2,1,30127,2) -- 2 chan ga
	AddItem(1,3,2,5) -- thit ga
	GiveNghichLanDauHon()
	
	if random(1,100) < 15 then
		AddItem(2,1,394,1) -- B�nh it n�p
	end
	
	local nMapID, nWx, nWy = GetNpcWorldPos(nNpcIndex)
	local nAddX = 0
	local nAddY = 0
	local nTargetNpc = 0
			
	for i = 1, 20 do
		nAddX = random(-70, 70)
		nAddY = random(-70, 70)		
		nTargetNpc = CreateNpc("M�m c�", "Th�t G� N��ng", nMapID, nWx + nAddX, nWy + nAddY)
		SetNpcLifeTime(nTargetNpc, 130)
		SetNpcScript(nTargetNpc, "\\script\\online\\viet_event\\200909\\2\\pangtuzi_baoguo.lua")
	end	
end
