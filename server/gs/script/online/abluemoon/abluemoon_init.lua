--���������СѾNPC�ű�,˳���һ��MISSION

tMap = {
	{"Tuy�n Ch�u", 100, 1459, 2811},
	{"Bi�n Kinh", 200, 1169, 2845},
	{"Th�nh ��", 300, 1653, 3559},
	{"T��ng D��ng", 350, 1436, 2808},
	{"D��ng Ch�u", 150, 1680, 3118},
	{"��i L�", 400, 1485, 3018},
}

function abluemoon_init(nMapID)
	SubWorld = SubWorldID2Idx(tMap[nMapID][2]);
	local szMes = "Khoa c� kh�o quan Th� Ti�u Nha �� xu�t hi�n t�i "..tMap[nMapID][1].." chu�n b� tr��ng thi, thanh ni�n nam n� h�y nhanh ch�n ��n d� thi!";
	AddGlobalNews(szMes)
	AddGlobalNews(szMes,1)
	AddLocalNews(szMes)
	Msg2Global(szMes)
	if SubWorld >= 0 then
		OpenMission(33);  
		npcIndex = CreateNpc("Th� ti�u nha","Th� Ti�u Nha",tMap[nMapID][2],tMap[nMapID][3],tMap[nMapID][4]);
		SetNpcLifeTime(npcIndex,1*60*60);  --NPC????1??
		SetNpcScript(npcIndex,"\\script\\online\\abluemoon\\abluemoon_npc.lua");
		SetMissionV(10,npcIndex)
	end
end
