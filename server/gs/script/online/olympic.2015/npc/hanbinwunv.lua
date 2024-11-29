--������Ů
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
			local npcIndex = CreateNpc("Ph� th�y b�ng gi�", "Ph� Th�y B�ng Gi�", 301, 1552, 3059);
			SetNpcDeathScript(npcIndex, "\\script\\online\\viet_event\\200912\\3\\death_binglengwushi.lua");
			SetNpcRemoveScript(npcIndex, "\\script\\online\\olympic\\npc\\hanbinwunv.lua");
			SetNpcLifeTime(npcIndex, 30*60);
		end
		AddGlobalNews("Ph� Th�y B�ng Gi� xu�t hi�n � T�y Th�nh �� (194,192), �ang mu�n ph� ho�i Th�nh H�a, �� v� l�m ch�m trong th�i k� b�ng gi�! M�i c�c ��i hi�p nhanh ch�ng �i thu ph�c")
		Msg2Global("Ph� Th�y B�ng Gi� xu�t hi�n � T�y Th�nh �� (194,192), �ang mu�n ph� ho�i Th�nh H�a, �� v� l�m ch�m trong th�i k� b�ng gi�! M�i c�c ��i hi�p nhanh ch�ng �i thu ph�c")
	end
end

function OnRemove(id)
	AddGlobalNews("Ph� Th�y B�ng Gi� �� tr�n tho�t!")
	Msg2Global("Ph� Th�y B�ng Gi� �� tr�n tho�t!")
end

