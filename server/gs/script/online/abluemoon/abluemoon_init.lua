--Ëæ»úÉú³ÉÍÃÐ¡Ñ¾NPC½Å±¾,Ë³±ã´ò¿ªÒ»¸öMISSION

tMap = {
	{"TuyÒn Ch©u", 100, 1459, 2811},
	{"BiÖn Kinh", 200, 1169, 2845},
	{"Thµnh §«", 300, 1653, 3559},
	{"T­¬ng D­¬ng", 350, 1436, 2808},
	{"D­¬ng Ch©u", 150, 1680, 3118},
	{"§¹i Lý", 400, 1485, 3018},
}

function abluemoon_init(nMapID)
	SubWorld = SubWorldID2Idx(tMap[nMapID][2]);
	local szMes = "Khoa cö kh¶o quan Thè TiÓu Nha ®· xuÊt hiÖn t¹i "..tMap[nMapID][1].." chuÈn bÞ tr­êng thi, thanh niªn nam n÷ h·y nhanh ch©n ®Õn dù thi!";
	AddGlobalNews(szMes)
	AddGlobalNews(szMes,1)
	AddLocalNews(szMes)
	Msg2Global(szMes)
	if SubWorld >= 0 then
		OpenMission(33);  
		npcIndex = CreateNpc("Thè tiÓu nha","Thè TiÓu Nha",tMap[nMapID][2],tMap[nMapID][3],tMap[nMapID][4]);
		SetNpcLifeTime(npcIndex,1*60*60);  --NPC????1??
		SetNpcScript(npcIndex,"\\script\\online\\abluemoon\\abluemoon_npc.lua");
		SetMissionV(10,npcIndex)
	end
end
