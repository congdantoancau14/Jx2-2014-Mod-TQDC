--随机生成兔小丫NPC脚本,顺便打开一个MISSION

tMap = {
	{"Tuy襫 Ch﹗", 100, 1459, 2811},
	{"Bi謓 Kinh", 200, 1169, 2845},
	{"Th祅h Й", 300, 1653, 3559},
	{"Tng Dng", 350, 1436, 2808},
	{"Dng Ch﹗", 150, 1680, 3118},
	{"Чi L�", 400, 1485, 3018},
}

function abluemoon_init(nMapID)
	SubWorld = SubWorldID2Idx(tMap[nMapID][2]);
	local szMes = "Khoa c� kh秓 quan Th� Ti觰 Nha  xu蕋 hi謓 t筰 "..tMap[nMapID][1].." chu萵 b� trng thi, thanh ni猲 nam n� h穣 nhanh ch﹏ n d� thi!";
	AddGlobalNews(szMes)
	AddGlobalNews(szMes,1)
	AddLocalNews(szMes)
	Msg2Global(szMes)
	if SubWorld >= 0 then
		OpenMission(33);  
		npcIndex = CreateNpc("Th� ti觰 nha","Th� Ti觰 Nha",tMap[nMapID][2],tMap[nMapID][3],tMap[nMapID][4]);
		SetNpcLifeTime(npcIndex,1*60*60);  --NPC????1??
		SetNpcScript(npcIndex,"\\script\\online\\abluemoon\\abluemoon_npc.lua");
		SetMissionV(10,npcIndex)
	end
end
