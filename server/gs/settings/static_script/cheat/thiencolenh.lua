--���ָ��
-- LIBRARIES
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\system_switch_config.lua");

-- ����ļ����֧��
Include("\\script\\class\\ktabfile.lua");

-- �ַ��������ܿ�
Include("\\script\\lib\\string.lua");

-- CHEAT
Include("\\script\\gmscript.lua");
Include("\\script\\�ؽ�ɽׯ\\task_script\\task_head.lua");
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
g_szTitle = "<color=green>Thi�n C� L�nh: <color>"


function OnUse(nItem)	
	--print(GetPlayerRebornParam(0))
	--print(GetTranslifeCount())
	-------Ch�c N�ng Set Qu�n Tr� Vi�n
	--local nName = GetAccount();
	--if CheckName(nName) == 0 then
	--	Talk(1,"","B�n kh�ng ph�i Qu�n Tr� Vi�n");
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
		-- "�i V� L�m minh/#goToWorld(1)",
		-- "�i Bi�n Kinh/#goToWorld(2)",
		"Chuy�n tr�ng th�i nh�n v�t/changeState",
		-- "\nM� r��ng/OpenBox",
		-- "M� t�p h�a/#Sale(35)",
		-- "Ti�u h�y v�t ph�m/destroyItems",
		"Nh�n v�t ph�m ti�u hao/getTieuHao",
		--"\nThanh l� h�nh trang/ClearBagAllItem",

	}

	tinsert(tSay, "\nTho�t/nothing");
	Say(g_szTitle.."L�a ch�n ch�c n�ng", getn(tSay), tSay);
end

function changeState()
	local tSay = {
		"Tr�ng th�i chi�n ��u/#SetFightState(1)",
		"Tr�ng th�i h�a b�nh/#SetFightState(0)",
		-- format("%s/#restore(1)", "\nH�i sinh l�c"),
		-- format("%s/#restore(2)", "H�i n�i l�c"),
		-- format("%s/#restore(3)", "H�i th� l�c"),
		format("%s/#restore(4)", "H�i s�t kh�"),
		format("%s/#restore(5)", "H�i t�t c�"),
	}
	tinsert(tSay, "Trang ch�nh/OpenThienCo");
	tinsert(tSay, "Tho�t/nothing");
	Say("Chuy�n tr�ng th�i", getn(tSay),tSay);
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
		tinsert(tSay, format("Nh�n %d %s/#addItem(%d)",tTieuHao[i][3],tTieuHao[i][1],i));
	end
	tinsert(tSay, "\nTrang tr��c/OpenThienCo")
	tinsert(tSay, "Tho�t/nothing")
	Say(g_szTitle.."L�a ch�n ch�c n�ng", getn(tSay), tSay);
end;

function addItem(id)
	AddItem(tTieuHao[id][2][1],tTieuHao[id][2][2],tTieuHao[id][2][3],tTieuHao[id][3]);
end;

function manageTasks()
	local tSay = {
		"T�o trang tr�/#createDecorators(1)",
		"Hi�n th� All npcs t�i Linh B�o S�n/#showAllNpcs(0)",
		"Hi�n th� Talk npcs t�i Linh B�o S�n/#showAllNpcs(1)",
		"Hi�n th� Fight npcs t�i Linh B�o S�n/#showAllNpcs(2)",
		"Show npcs right here/main_show_npc",
		"Show shops/showShops",
		"Kh�i ��ng l� n��ng/showlistLoNuong",
		"Kh�i ��ng nhi�m v� h�nh c��c/createCollecEvent",
		"Kh�i ��ng S�t th� ���ng/startKillerHall",
		"Kh�i ��ng ��u tr��ng tuy�t/startSnowWar",
		"Kh�i ��ng C�ng th�nh chi�n/startGongCheng",
		--"Kh�i ��ng B�o h� t�i nguy�n/conf_res_protect_info",
		"Kh�i ��ng ��i h�i t� v� Tuy�n Ch�u/biwudahuiqianzou_init",
		"B� qua nhi�m v� t�n th�/skipXinShou",
		"M� kh�a r��ng t�n th�/unlockBox",
		"M� r�ng r��ng/expandBox",
		"Ho�n th�nh nhi�m v� T�y B�c/skipXiBei",
		"Ho�n th�nh nhi�m v� k� n�ng s�ng/skipTaskLifeSkill",
		--"Ti�n v�o T�ng Ki�m s�n trang/goTangKiem",
		
		"\nTrang tr��c/OpenThienCo",
		}
	tinsert(tSay, "Tho�t/nothing")
	Say(g_szTitle.."L�a ch�n ch�c n�ng", getn(tSay), tSay);
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
	TaskTip("B�n c� th� ��n g�p c�c NPC h�c k� n�ng s�ng")
end;

function unlockBox()
	SetTask(805,2);
	Say("R��ng ch�a �� �� l�m xong! Y�n t�m s� d�ng nh�!",1,"T�t l�m! Xin �a t�!/nothing")
	Msg2Player("R��ng ch�a �� �� l�m xong! Y�n t�m s� d�ng nh�!");
end;

function skipXiBei()
	SetTask(2031,71);
end;

function skipXinShou()
	SetTask(1,25);
end;

function goTangKiem()

	local szHeader = "------- Ch�n �i -------";
	local tSay = {};
	for i=1, 7 do
		tinsert(tSay,format("Ti�n v�o �i %d/#GM_NextStageInit(1,%d)",i,i));
	end
	tinsert(tSay,"Trang tr��c/manageTasks");
	tinsert(tSay,"Th�i kh�i/nothing");
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
		tinsert(tSay, format("\nTrang k�/#createDecorators(%d)",page+1));
	end
	if page > 1 then
		if nEndPoint < MAX then
			tinsert(tSay, format("Trang tr��c/#createDecorators(%d)",page-1));
		else
			tinsert(tSay, format("\nTrang tr��c/#createDecorators(%d)",page-1));
		end
	end
	
	tinsert(tSay, "\nTho�t/nothing")
	Say("---- Danh s�ch nh�n v�t trang tr� ----\nPage: "..page,getn(tSay),tSay);
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
	local sMessage = "V� tr� �ang ��ng\n"..szCoordinate
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
		Say(g_szTitle.."Ng��i mu�n thanh l� t�i?", 2, "��ng �/#ClearBagAllItem(1)", "Ra kh�i/nothing")
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
		Msg2Player("Kh�ng th� do th�m th�ng tin. C�c h� ch�a ��i tho�i v�i npc n�o!")
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


