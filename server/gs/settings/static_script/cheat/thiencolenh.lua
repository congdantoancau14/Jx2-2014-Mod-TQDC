--Ìå·þÖ¸Òý
-- LIBRARIES
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\system_switch_config.lua");

-- ±í¸ñÎÄ¼þÀàµÄÖ§³Ö
Include("\\script\\class\\ktabfile.lua");

-- ×Ö·û´®´¦Àí¹¦ÄÜ¿â
Include("\\script\\lib\\string.lua");
Include("\\script\\lib\\item.lua");

-- CHEAT
Include("\\script\\gmscript.lua");
Include("\\script\\²Ø½£É½×¯\\task_script\\³É¶¼\\²Ø½£Ê¹Õß.lua");
Include("\\settings\\static_script\\cheat\\thiencolenh_head.lua");
-- Include("\\settings\\static_script\\cheat\\test.lua");
Include("\\settings\\static_script\\cheat\\inputter.lua");
Include("\\settings\\static_script\\cheat\\show_npc.lua");
Include("\\settings\\static_script\\cheat\\show_shop.lua");
Include("\\settings\\static_script\\cheat\\skip_task.lua");
-- Include("\\reload_file.lua");
-- Manage Tasks
Include("\\script\\task\\collection\\task_head.lua");
Include("\\settings\\static_script\\cheat\\includes\\satthuduong.lua");
Include("\\settings\\static_script\\cheat\\includes\\thitnuong.lua");
Include("\\settings\\static_script\\cheat\\includes\\link_gm_item.lua");
Include("\\settings\\static_script\\cheat\\includes\\destroy_item.lua");
Include("\\script\\online_activites\\task_values.lua");
Include("\\script\\mod\\item\\punish_bad.lua");
Include("\\script\\online\\eating\\eating_head.lua");

-- Variables Declaration
THIS_FILE = "\\settings\\static_script\\cheat\\thiencolenh.lua";
g_szTitle = "<color=green>Thiªn C¬ LÖnh: <color>"


function OnUse(nItem)	
	--print(GetPlayerRebornParam(0))
	--print(GetTranslifeCount())
	-------Chøc N¨ng Set Qu¶n TrÞ Viªn
	--local nName = GetAccount();
	--if CheckName(nName) == 0 then
	--	Talk(1,"","B¹n kh«ng ph¶i Qu¶n TrÞ Viªn");
	--else
		OpenThienCo();
	--end
end

function OpenThienCo()
	-- if 1 ~= IsExpSvrSystemOpen() then
		-- return
	-- end
	
	local tSay = {}

	tSay = {
		"Reload gm_item_tifuzhiyin/#reloadFile(2)",
		-- "Save reload_file script/#reloadFile(5)",
		-- "Reload target file/reloadTargetFile",
		"Reload all scripts/ReloadAllScript",
		
		-- "Run test script/runTest",
		-- "Add Items/showInputter",
		"Get Last talked NPC infomation/getNPCInfo",
		"Get this position coordinate/getPosition",
		"Manage tasks/manageTasks",
		"GM functions/showGMFunctions",
		-- "§i Vâ L©m minh/#goToWorld(1)",
		-- "§i BiÖn Kinh/#goToWorld(2)",
		"ChuyÓn tr¹ng th¸i nh©n vËt/changeState",
		-- "\nMë r­¬ng/OpenBox",
		-- "Më t¹p hãa/#Sale(35)",
		-- "Tiªu hñy vËt phÈm/destroyItems",
		"NhËn vËt phÈm tiªu hao/getTieuHao",
		"\nX¶ bít ®å khái hµnh trang/destroyListItems",
		--"\nThanh lÝ hµnh trang/ClearBagAllItem",

	}

	tinsert(tSay, "\Tho¸t/nothing");
	Say(g_szTitle.."Lùa chän chøc n¨ng", getn(tSay), tSay);
end


tCastState = {
	{"state_p_attack_point_add","Ngo¹i c«ng t¨ng",1000000000},
	{"state_m_attack_point_add","Néi kÝch t¨ng",1000000000},
	{"state_damage_point","S¸t th­¬ng t¨ng",1000000000},
	{"state_max_carry_point_add","Søc lùc t¨ng",100000},
}

function changeState()
	local tSay = {
		"Tr¹ng th¸i chiÕn ®Êu/#SetFightState(1)",
		"Tr¹ng th¸i hßa b×nh/#SetFightState(0)",
		-- format("%s/#restore(1)", "\nHåi sinh lùc"),
		-- format("%s/#restore(2)", "Håi néi lùc"),
		-- format("%s/#restore(3)", "Håi thÓ lùc"),
		format("%s/#restore(4)", "Håi s¸t khÝ"),
		format("%s/#restore(5)", "Håi tÊt c¶"),
		"T¨ng ngo¹i c«ng/#increase_attack(1)",
		"T¨ng néi kÝch/#increase_attack(2)",
		"T¨ng s¸t th­¬ng/#increase_attack(3)",
		"T¨ng søc lùc/#increase_attack(4)",
		"BËt hiÖu øng quang/ask_effect_number",
		"T¾t hiÖu øng quang/turn_off_effect",
		"Håi sinh t¹i vÞ/revive_player",
		"Xãa hiÖu øng ®ãi kh¸t ngñ/ET_ClearAllState",
	}
	tinsert(tSay, "\nTrang chÝnh/OpenThienCo");
	tinsert(tSay, "Tho¸t/nothing");
	Say("ChuyÓn tr¹ng th¸i", getn(tSay),tSay);
end;

function revive_player()
	RevivePlayer(0, PlayerIndex, 1)
end;

MIN_EFFECT = 901
MAX_EFFECT = 1014
nEffectId = MIN_EFFECT;
nEffectPos = 1;
function ask_effect_number()
	AskClientForNumber("_request_effect_id_callback",MIN_EFFECT,MAX_EFFECT,"NhËp m· hiÖu øng");
end;

function _request_effect_id_callback(effect_id)
	if effect_id == 0 then 
		set_effect_position(effect_id,1);
		return 0;
	end
	nEffectId = effect_id;
	turn_on_effect(effect_id);
end;

function show_effect_navigation()
	
	local tbSay = {
		"Next effect/#navigate_effect(1)",
		"Prev effect/#navigate_effect(-1)",
		"Input effect id/ask_effect_number",
		format("Change position/#set_effect_position(%d,1)",nEffectId),
		format("Add position/#set_effect_position(%d,0)",nEffectId),
		"\nClose/nothing",
	}
	Say(format("Effect navigation. The current effect id: <color=gold>%d<color>. Position: %d",nEffectId,nEffectPos),getn(tbSay),tbSay);
	
end;

function navigate_effect(nNav)
	if nNav ~= 0 then 
		nEffectId = nEffectId+nNav;
	end
	turn_on_effect(nEffectId);
end;

function set_effect_position(effect_id,change_pos)
	-- if effect_id == nil then effect_id = nEffectId end
	if change_pos == 1 then 
		turn_off_effect();
	end
	local tbSay = {
		format("Ch©n/#turn_on_effect(%d,1)",effect_id),
		format("Xung/#turn_on_effect(%d,2)",effect_id),
		format("Tr¸i/#turn_on_effect(%d,3)",effect_id),
		format("Ph¶i/#turn_on_effect(%d,4)",effect_id),
		format("§Çu/#turn_on_effect(%d,5)",effect_id),
	}
	tinsert(tbSay,"\nTh«i/nothing");
	Say("Chän vÞ trÝ",getn(tbSay),tbSay);
end;

function turn_on_effect(nEffectId,nPos)
	if nEffectId >=1 and nEffectId <= 5 then 
		nPos = nEffectId;
	end
	if nPos == nil or nPos == 0 then nPos = nEffectPos end
	nEffectPos = nPos;
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex),nEffectId,nPos,1);
	show_effect_navigation();
end;

function turn_off_effect()
	for i=1,5 do 
		SetCurrentNpcSFX(PIdx2NpcIdx(),917,i,1)
	end
end;

function increase_attack(nIndex)
	local nTime = 60*3;
	CastState(tCastState[nIndex][1],tCastState[nIndex][3],18*nTime)
	StartTimeGuage(tCastState[nIndex][2],nTime)
end;

function reloadFile(id)
	local tScriptPath = {
		{"thien co lenh","\\settings\\static_script\\cheat\\thiencolenh.lua"},
		{"gm item","\\settings\\static_script\\cheat\\gm_item_tifuzhiyin.lua"},
		{"tieu ngao luc","\\script\\online_activites\\xinshouzhiyin\\item\\item_xiaoaojianghulu.lua"},
		-- {"test","\\settings\\static_script\\cheat\\test.lua"},
	}
		
	if id == 5 then
		Msg2Player("Saved reload_file!");
		LoadScript("\\settings\\static_script\\cheat\\reload_file.lua");
		return
	end
	
	LoadScript(tScriptPath[id][2]);
	Msg2Player("Reloaded File: "..tScriptPath[id][1])
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function reloadDynamic()
	AskClientForString("_request_string_call_back_thiencolenh","Input file path...",1,32,"Input string");
end;

function _request_string_call_back_thiencolenh(str)
	reloadFileByPath(str);
end;

function reloadFileByPath(szFilePath)
	LoadScript(szFilePath);
end;

function goToWorld(nMapIndex)
	NewWorld(tMaps[nMapIndex][2],tMaps[nMapIndex][3],tMaps[nMapIndex][4]);
end;

function getTieuHao()
	local tSay = {}
	for i=1, getn(tTieuHao) do
		tinsert(tSay, format("NhËn %d %s/#addItem(%d)",tTieuHao[i][3],tTieuHao[i][1],i));
	end
	tinsert(tSay, "\nTrang tr­íc/OpenThienCo")
	tinsert(tSay, "Tho¸t/nothing")
	Say(g_szTitle.."Lùa chän chøc n¨ng", getn(tSay), tSay);
end;

function addItem(id)
	AddItem(tTieuHao[id][2][1],tTieuHao[id][2][2],tTieuHao[id][2][3],tTieuHao[id][3]);
end;

function manageTasks()
	local tSay = {
		"Show npcs/main_show_npc",
		"Show shops/showShops",
		-- "Skip tasks/main_task_skipper",
		"TiÕn vµo Tµng KiÕm s¬n trang/goTangKiem",
		"Khëi ®éng lß n­íng/showlistLoNuong",
		format("Thªm %d §µn H­¬ng méc vµo Tø Linh ®Ønh/#addTanXiangMu(%d)",50,50),
		"Khëi ®éng nhiÖm vô hµnh c­íc/createCollecEvent",
		"Khëi ®éng S¸t thñ ®­êng/startKillerHall",
		"Khëi ®éng §Êu tr­êng tuyÕt/startSnowWar",
		"Khëi ®éng C«ng thµnh chiÕn/startGongCheng",
		--"Khëi ®éng B¶o hé tµi nguyªn/conf_res_protect_info",
		"Khëi ®éng §¹i héi tû vâ TuyÒn Ch©u/biwudahuiqianzou_init",
		"Bá qua nhiÖm vô t©n thñ/skipXinShou",
		"Më khãa r­¬ng t©n thñ/unlockBox",
		"Më réng r­¬ng/expandBox",
		"Hoµn thµnh nhiÖm vô T©y B¾c/skipXiBei",
		"Hoµn thµnh nhiÖm vô kÜ n¨ng sèng/skipTaskLifeSkill",
		"Bá qua nhiÖm vô hiÖn t¹i/main_task_skipper",
		
		"\nTrang tr­íc/OpenThienCo",
		}
	tinsert(tSay, "Tho¸t/nothing")
	Say(g_szTitle.."Lùa chän chøc n¨ng", getn(tSay), tSay);
end;

function addTanXiangMu(nQuantity)
	local nNpcIndex = GetGlbValue(1032);
	local nNpcState = GetUnitCurStates(nNpcIndex,1)-1;
	AddUnitStates(nNpcIndex,1,nQuantity);
	Msg2Player("§· thªm "..nQuantity.." ®µn h­¬ng méc vµo Tø Linh ®Ønh");
end;

function expandBox()
	SetStoreBoxPageCount(5);
end;

function startSnowWar()
	SendScript2VM("\\script\\online_activites\\2010_12\\activity_05\\head.lua","SB_Start()");
end;

function startGongCheng()
	SendScript2VM("\\script\\missions\\bw\\siege\\siege_arena_mission_start.lua","start_mission()");
end;

function skipTaskLifeSkill()
	SetTask(1925,15);
	TaskTip("B¹n cã thÓ ®Õn gÆp c¸c NPC häc kü n¨ng sèng")
end;

function unlockBox()
	SetTask(805,2);
	Say("R­¬ng chøa ®å ®· lµm xong! Yªn t©m sö dông nhÐ!",1,"Tèt l¾m! Xin ®a t¹!/nothing")
	Msg2Player("R­¬ng chøa ®å ®· lµm xong! Yªn t©m sö dông nhÐ!");
end;

function skipXiBei()
	SetTask(2031,71);
end;

function skipXinShou()
	SetTask(1,25);
end;

function goTangKiem()

	local szHeader = "------- Chän ¶i -------";
	local tSay = {};
	for i=0, 9 do
		tinsert(tSay,format("TiÕn vµo ¶i %d/#GM_NextStageInit(1,%d)",i,i));
	end
	tinsert(tSay,"Trang tr­íc/manageTasks");
	tinsert(tSay,"Th«i khái/nothing");
	Say(szHeader,getn(tSay),tSay);
end;


function getPosition()
	local map_ID,att_X,att_Y = GetWorldPos();
	local szCoordinate = map_ID..","..att_X..","..att_Y;
	local sMessage = "VÞ trÝ ®ang ®øng\n"..szCoordinate
		.."\n- Map id: "..map_ID.."\n- CoorX: "..att_X.."\n- CoorY: "..att_Y
		.."\n_________________________\n";
	Msg2Player(sMessage)
	print(szCoordinate);
	local file = openfile("position.lua", "a+")
	write(file,sMessage)
	closefile(file)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function ClearBagAllItem(bTag)
	if not bTag or tonumber(bTag) ~= 1 then
		Say(g_szTitle.."Ng­¬i muèn thanh lý tói?", 2, "§ång ý/#ClearBagAllItem(1)", "\n\n\nKh«ng! NhÇm lÉn th«i/nothing")
		return
	end
	ClearItemInPos();
	if GetItemCount(2,1,1) < 1 and GetFreeItemRoom() > 0 then
		AddItem(2,1,1,1)
	end
	if GetItemCount(2,1,30045) < 1 and GetFreeItemRoom() > 0 then
		AddItem(2,1,30045,1)
	end
end

function restore(nType)
	if nType == 1 then
		Restore();
	elseif nType == 2 then
		RestoreNeili();
	elseif nType == 3 then
		RestoreStamina();
	elseif nType == 4 then
		SetMomentum(10);
	elseif nType == 5 then
		RestoreAll();
		SetMomentum(10);
	end
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function isEmpty(s)
  return s == nil or s == ''
end

function getNPCInfo()
	local nNpcIndex = GetTargetNpc()
	local name = GetNpcName(nNpcIndex)
	local m,x,y = GetNpcWorldPos(nNpcIndex);
	--local IdNpc = GetNpcSettingIdx(nNpcIndex)
	local script = GetNpcScript(nNpcIndex)
	if isEmpty(nNpcIndex) or isEmpty(script) or isEmpty(name) then
		Msg2Player("Kh«ng thÓ do th¸m th«ng tin. C¸c h¹ ch­a ®èi tho¹i víi npc nµo!")
	else
		local sMessage = "* NPC Index: "..nNpcIndex
			.."\n* NPC Name: [ "..name.." ]"
			..format("\n* Coordinate: %d,%d,%d",m,x,y)
			.."\n* NPC Script path: "..script
			.."\n_________________________\n";
		Msg2Player(sMessage)
		local file = openfile("npcinfo.lua", "a+")
		write(file,sMessage)
		closefile(file)
		print(script);
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	end
end 


