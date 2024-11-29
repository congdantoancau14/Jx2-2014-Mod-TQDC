
function on_server_start()
	local nNpcIndex;
	--¶Ô»°NPC´´½¨
	nNpcIndex = CreateNpc("C«n L«n T©n Phã Ch­ëng M«n","Háa Phông Tö",100,1451,2821);
	SetNpcScript(nNpcIndex,"\\script\\½­ÄÏÇø\\ÈªÖÝ\\npc\\»ð·ï×Ó.lua")
	
	nNpcIndex = CreateNpc("Lß n­íng b¸nh","Háa Long §Ønh",329,1753,3438);
	SetNpcScript(nNpcIndex,"\\script\\task\\huofengtask\\npc_update_huofeng_lv2.lua");
	
--	nNpcIndex = CreateNpc("»Ä»ðöÌ½ðÕæÉí","TYT_HHHLJ",0,0,0);
--	SetNpcScript(nNpcIndex,"");
	
	nNpcIndex = CreateNpc("C«n L«n T©n Phã Ch­ëng M«n","Háa Phông Tö",8011,1552,3211);
	SetNpcScript(nNpcIndex,"\\script\\task\\huofengtask\\npc_update_huofeng_lv3.lua")
end
	