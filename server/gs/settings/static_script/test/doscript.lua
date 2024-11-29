function main()
	DoScriptByName(GetName(),"\\settings\\static_script\\kf_newbattles\\emplacementbattle\\trap.lua","main");
	SendScript2VM("\\script\\missions\\yp\\vn\\server_start.lua","on_server_start()");
	SendScript2VM("\\script\\online\\qianhe_tower\\qht_head.lua", format("qht_relay_create_gold_boss(%d)", tonumber(nRandomSeed)));	
end;