--²âÊÔÓÃ½Å±¾
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\talktmp.lua");

talkTable = {};

talkTable.msg = "ChØ dïng ®Ó më danh väng, kh«ng cã t¸c dông kh¸c!";
talkTable.sel = {
	{"Më danh väng Xu MËt ViÖn", "OpenGovPop",},
	{"Më danh väng Lôc PhiÕn M«n", "OpenSixDoorPop"},
	{"Më danh väng Liªn Minh Tiªu Côc", "OpenTranUnitPop"},
	{"Më danh väng Liªn Minh Th­¬ng Héi", "OpenBusinessUnitPop"},
	{"Më danh väng Liªn Minh Tr­êng Ca M«n", "OpenLongSongPop"},
	{"Më danh väng Vâ L©m Minh", "OpenWuLinUnitPop"},
	{"TriÖu gäi script nhiÖm vô c« g¸i", "CreatePopNpc",},
	{"§ãng tÊt c¶ danh väng", "ClearAllPop",},
	{"KÕt thóc ®èi tho¹i", "nothing",}, 
};

function CreatePopNpc()
	local nNpcIdx = CreateNpc("Chñ qu¶n Háa KhÝ phßng", "Script nhiÖm vô sø gi¶", GetWorldPos());
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_createnpc.lua");
end

function OpenGovPop()
	OpenPop(0);
end

function OpenSixDoorPop()
	OpenPop(1);
end

function OpenTranUnitPop()
	OpenPop(2);
end

function OpenBusinessUnitPop()
	OpenPop(3);
end

function OpenLongSongPop()
	OpenPop(4);
end

function OpenWuLinUnitPop()
	OpenPop(5);
end

function main()
	temp_Talk(talkTable);
end