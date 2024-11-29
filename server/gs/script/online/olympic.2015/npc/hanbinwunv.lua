--º®±ùÎ×Å®
Include("\\script\\lib\\sdb.lua")
Include("\\script\\online\\olympic\\oly_head.lua")

--Relay Call
function call_hanbingwunv(nRandomSeed)
	if oly_IsActivityOpen() ~= 1 then
		return 0;
	end
	local s = SDB("olympic_addfire", 0, 0);
	s:apply2(call_hanbingwunv_cb);
end

function call_hanbingwunv_cb(nCount, sdb)
	local sData = sdb["data"];
	if sData and sData[1] and tonumber(sData[1]) >= 5000 then
		if SubWorldID2Idx(301) > 0 then
			local npcIndex = CreateNpc("Phï thñy b¨ng gi¸", "Phï Thñy B¨ng Gi¸", 301, 1552, 3059);
			SetNpcDeathScript(npcIndex, "\\script\\online\\viet_event\\200912\\3\\death_binglengwushi.lua");
			SetNpcRemoveScript(npcIndex, "\\script\\online\\olympic\\npc\\hanbinwunv.lua");
			SetNpcLifeTime(npcIndex, 30*60);
		end
		AddGlobalNews("Phï Thñy B¨ng Gi¸ xuÊt hiÖn ë T©y Thµnh §« (194,192), ®ang muèn ph¸ ho¹i Th¸nh Háa, ®Ó vâ l©m ch×m trong thêi kú b¨ng gi¸! Mêi c¸c ®¹i hiÖp nhanh chãng ®i thu phôc")
		Msg2Global("Phï Thñy B¨ng Gi¸ xuÊt hiÖn ë T©y Thµnh §« (194,192), ®ang muèn ph¸ ho¹i Th¸nh Háa, ®Ó vâ l©m ch×m trong thêi kú b¨ng gi¸! Mêi c¸c ®¹i hiÖp nhanh chãng ®i thu phôc")
	end
end

function OnRemove(id)
	AddGlobalNews("Phï Thñy B¨ng Gi¸ ®· trèn tho¸t!")
	Msg2Global("Phï Thñy B¨ng Gi¸ ®· trèn tho¸t!")
end

