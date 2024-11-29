--²âÊÔÓÃ½Å±¾
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\pop\\fire.lua");

talkTable = {};

talkTable.msg = "ChØ dïng ®Ó chän NPC, kh«ng cã t¸c dông kh¸c!";
talkTable.sel = {
	{"Linh TÒ KiÕm DiÖc Kh¶ L¨ng", "nxj_ykl",},
	{"Ph¸ Hån §ao L©m Phong", "phd_lf"},
	{"Quû ¶nh Bót Lý ChÝ KiÖt", "gyb_lzj"},
	{"V« T×nh Tr¶o Tiªu Thanh", "wqz_xq"},
	{"Sö dông ph¸o hoa", "OnUse"},
	{"KÕt thóc ®èi tho¹i", "nothing",}, 
};

function nxj_ykl()
	local nNpcIdx = CreateNpc("Chñ qu¶n Háa KhÝ phßng", "Linh TÒ KiÕm DiÖc Kh¶ L¨ng", GetWorldPos());
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_yikelin.lua");
end

function phd_lf()
	local nNpcIdx = CreateNpc("Chñ qu¶n Háa KhÝ phßng", "Ph¸ Hån §ao L©m Phong", GetWorldPos());
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_linfeng.lua");
end	

function gyb_lzj()
	local nNpcIdx = CreateNpc("Chñ qu¶n Háa KhÝ phßng", "Quû ¶nh Bót Lý ChÝ KiÖt", GetWorldPos());
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_lizhijie.lua");
end

function wqz_xq()
	local nNpcIdx = CreateNpc("Chñ qu¶n Háa KhÝ phßng", "V« T×nh Tr¶o Tiªu Thanh", GetWorldPos());
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_xiaoqin.lua");
end

function main()
	temp_Talk(talkTable);
end