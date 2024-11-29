--Ìå·þÖ¸Òý
-- LIBRARIES
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\system_switch_config.lua");

-- ±í¸ñÎÄ¼þÀàµÄÖ§³Ö
Include("\\script\\class\\ktabfile.lua");

-- ×Ö·û´®´¦Àí¹¦ÄÜ¿â
Include("\\script\\lib\\string.lua");

-- CHEAT
Include("\\script\\gmscript.lua");
Include("\\script\\²Ø½£É½×¯\\task_script\\task_head.lua");
Include("\\settings\\static_script\\cheat\\list_npcs.lua");
Include("\\settings\\static_script\\cheat\\thiencolenh_head.lua");
Include("\\settings\\static_script\\cheat\\test.lua");
Include("\\settings\\static_script\\cheat\\inputter.lua");
Include("\\settings\\static_script\\cheat\\show_npc.lua");
Include("\\settings\\static_script\\cheat\\show_shop.lua");
Include("\\reload_file.lua");
-- Manage Tasks
Include("\\script\\task\\collection\\task_head.lua");
Include("\\settings\\static_script\\cheat\\includes\\satthuduong.lua");
Include("\\settings\\static_script\\cheat\\includes\\thitnuong.lua");
Include("\\settings\\static_script\\cheat\\includes\\link_gm_item.lua");
Include("\\settings\\static_script\\cheat\\includes\\destroy_item.lua");
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
		"Reload target file/reloadTargetFile",
		"Reload all scripts/ReloadAllScript",
		
		"Run test script/runTest",
		-- "Add Items/showInputter",
		"Get Last talked NPC infomation/getNPCInfo",
		"Get this position coordinate/getPosition",
		"Manage tasks/manageTasks",
		"Gm functions\n\n/showGMFunctions",
		-- "§i Vâ L©m minh/#goToWorld(1)",
		-- "§i BiÖn Kinh/#goToWorld(2)",
		"ChuyÓn tr¹ng th¸i nh©n vËt/changeState",
		-- "\nMë r­¬ng/OpenBox",
		-- "Më t¹p hãa/#Sale(35)",
		-- "Tiªu hñy vËt phÈm/destroyItems",
		"NhËn vËt phÈm tiªu hao/getTieuHao",
		--"\nThanh lÝ hµnh trang/ClearBagAllItem",

	}

	tinsert(tSay, "\nTho¸t/nothing");
	Say(g_szTitle.."Lùa chän chøc n¨ng", getn(tSay), tSay);
end

function changeState()
	local tSay = {
		"Tr¹ng th¸i chiÕn ®Êu/#SetFightState(1)",
		"Tr¹ng th¸i hßa b×nh/#SetFightState(0)",
		-- format("%s/#restore(1)", "\nHåi sinh lùc"),
		-- format("%s/#restore(2)", "Håi néi lùc"),
		-- format("%s/#restore(3)", "Håi thÓ lùc"),
		format("%s/#restore(4)", "Håi s¸t khÝ"),
		format("%s/#restore(5)", "Håi tÊt c¶"),
	}
	tinsert(tSay, "Trang chÝnh/OpenThienCo");
	tinsert(tSay, "Tho¸t/nothing");
	Say("ChuyÓn tr¹ng th¸i", getn(tSay),tSay);
end;

function reloadFile(id)
	local tScriptPath = {
		{"thien co lenh","\\settings\\static_script\\cheat\\thiencolenh.lua"},
		{"gm item","\\settings\\static_script\\cheat\\gm_item_tifuzhiyin.lua"},
		{"tieu ngao luc","\\script\\online_activites\\xinshouzhiyin\\item\\item_xiaoaojianghulu.lua"},
		{"test","\\settings\\static_script\\cheat\\test.lua"},
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
		"T¹o trang trÝ/#createDecorators(1)",
		"HiÓn thÞ All npcs t¹i Linh B¶o S¬n/#showAllNpcs(0)",
		"HiÓn thÞ Talk npcs t¹i Linh B¶o S¬n/#showAllNpcs(1)",
		"HiÓn thÞ Fight npcs t¹i Linh B¶o S¬n/#showAllNpcs(2)",
		"Show npcs right here/main_show_npc",
		"Show shops/showShops",
		"Khëi ®éng lß n­íng/showlistLoNuong",
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
		--"TiÕn vµo Tµng KiÕm s¬n trang/goTangKiem",
		
		"\nTrang tr­íc/OpenThienCo",
		}
	tinsert(tSay, "Tho¸t/nothing")
	Say(g_szTitle.."Lùa chän chøc n¨ng", getn(tSay), tSay);
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
	for i=1, 7 do
		tinsert(tSay,format("TiÕn vµo ¶i %d/#GM_NextStageInit(1,%d)",i,i));
	end
	tinsert(tSay,"Trang tr­íc/manageTasks");
	tinsert(tSay,"Th«i khái/nothing");
	Say(szHeader,getn(tSay),tSay);
end;

function showAllNpcs(nType, tNpcs)
	if tNpcs == nil then
		tNpcs = tbNpcs;
	end
	
	local MAP = 218;

	local m,x,y = GetWorldPos();
	if m ~= MAP then
		NewWorld(218,1634,3253);
	end
	local xBegin = 1634;
	local xEnd = 1874;
	local yBegin = 3253;
	local yEnd = 3647;
	-- 1874-1634 = 240
	-- 3647-3253 = 394
	-- 340 * 394 = 133960
	
	local corX = xBegin;
	local corY = yBegin;
	local npcid = 1;
	local toggle = 0;
	local xscale = floor((xEnd - xBegin) / 4); -- = 60
	local yscale = floor((yEnd - yBegin) / 6); -- = 65
	for i=1, xscale do
		for j=1, yscale do
			if npcid > getn(tNpcs) then
				return
			end
			if nType == 0 then
				CreateNpc(tNpcs[npcid][1],tNpcs[npcid][1],MAP, corX, corY);
			elseif nType == 1 then
				if tNpcs[npcid][2] == nil then
					CreateNpc(tNpcs[npcid][1],tNpcs[npcid][1],MAP, corX, corY);
				end
			elseif nType == 2 then
				if tNpcs[npcid][2] ~= nil then
					CreateNpc(tNpcs[npcid][1],tNpcs[npcid][1],MAP, corX, corY);
				end
			end
			
			npcid = npcid + 1;
			corX = corX + 4;
			if corX >= xEnd then
				corY = corY + 6;
				if toggle == 0 then
					corX = xBegin + 2;
					toggle = 1;
				else
					corX = xBegin;
					toggle = 0;
				end
			end
		end
	end
end;

function createDecorators(page)
	tSay = {}
	tinsert(tSay, "Create a random decorator/#createDecorator(0)");
	tinsert(tSay, "\n");
	local LINE = 5;
	local nEndPoint = LINE;
	local nStartPoint = 1;
	local MAX = getn(tDecorators);
	
	if page == 1 then
		nEndPoint = LINE;
	else 
		nStartPoint = (page-1) * LINE
		nEndPoint = page * LINE;
	end
	
	if nEndPoint > MAX then
		nEndPoint = MAX;
	end
	
	for i=nStartPoint, nEndPoint do
		tinsert(tSay, "Create "..tDecorators[i][1]..format("/#createDecorator(%d)",i))
	end
	
	if nEndPoint < getn(tDecorators) then
		tinsert(tSay, format("\nTrang kÕ/#createDecorators(%d)",page+1));
	end
	if page > 1 then
		if nEndPoint < MAX then
			tinsert(tSay, format("Trang tr­íc/#createDecorators(%d)",page-1));
		else
			tinsert(tSay, format("\nTrang tr­íc/#createDecorators(%d)",page-1));
		end
	end
	
	tinsert(tSay, "\nTho¸t/nothing")
	Say("---- Danh s¸ch nh©n vËt trang trÝ ----\nPage: "..page,getn(tSay),tSay);
end;


function createDecorator(nId)
	if nId == 0 then
		local nRand = random(1,getn(tDecorators));
		CreateNpc(tDecorators[nRand][1],tDecorators[nRand][1], GetWorldPos());
	else
		CreateNpc(tDecorators[nId][1],tDecorators[nId][1], GetWorldPos());
	end
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
		Say(g_szTitle.."Ng­¬i muèn thanh lý tói?", 2, "§ång ý/#ClearBagAllItem(1)", "Ra khái/nothing")
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
	local Name = GetNpcName(nNpcIndex)
	local m,x,y = GetNpcWorldPos(nNpcIndex);
	--local IdNpc = GetNpcSettingIdx(nNpcIndex)
	local nScript = GetNpcScript(nNpcIndex)
	if isEmpty(nNpcIndex) or isEmpty(nScript) or isEmpty(Name) then
		Msg2Player("Kh«ng thÓ do th¸m th«ng tin. C¸c h¹ ch­a ®èi tho¹i víi npc nµo!")
	else
		local sMessage = "* NPC Index: "..nNpcIndex
			.."\n* NPC Name: [ "..Name.." ]"
			..format("\n* Coordinate: %d,%d,%d",m,x,y)
			.."\n* NPC Script path: "..nScript
			.."\n_________________________\n";
		Msg2Player(sMessage)
		local file = openfile("npcinfo.lua", "a+")
		write(file,sMessage)
		closefile(file)
		print(nScript);
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	end
end 


