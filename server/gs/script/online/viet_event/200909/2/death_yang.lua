--=============================================
--create by baiyun 2009.11.22
--describe:Ô½ÄÏ°æ12ÔÂ·İÊ¥µ®½Ú»î¶¯ÑòËÀÍö½Å±¾
--=============================================
Include("\\script\\online\\viet_event\\200909\\event_head.lua")

function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex, 30);
	-- if random(1,100) <= 25 then
		-- AddItem(2,1,30368,2);
		-- AddItem(2,1,30369,2);
		-- AddItem(2,1,30499,2);
		-- WriteLogEx("Ho¹t §éng Th?t N­íng","nhËn",2,"nguyªn liÖu mçi lo¹i");
	-- end

	AddItem(2,1,30129,4) -- 4 mi?ng th?t dª
	GiveNghichLanDauHon()
	
	if random(1,100) < 15 then
		AddItem(2,1,394,1) -- B¸nh ?t n?p
	end
	
	local nMapID, nWx, nWy = GetNpcWorldPos(nNpcIndex)
	local nAddX = 0
	local nAddY = 0
	local nTargetNpc = 0
			
	for i = 1, 20 do
		nAddX = random(-70, 70)
		nAddY = random(-70, 70)		
		nTargetNpc = CreateNpc("M©m cç", "ThŞt Dª N­íng", nMapID, nWx + nAddX, nWy + nAddY)
		SetNpcLifeTime(nTargetNpc, 130)
		SetNpcScript(nTargetNpc, "\\script\\online\\viet_event\\200909\\2\\pangtuzi_baoguo.lua")
	end	
end
