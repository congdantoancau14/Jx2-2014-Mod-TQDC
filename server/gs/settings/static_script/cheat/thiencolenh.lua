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
Include("\\script\\�ؽ�ɽׯ\\task_script\\�ɶ�\\�ؽ�ʹ��.lua");
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
		"Gm functions/showGMFunctions",
		-- "�i V� L�m minh/#goToWorld(1)",
		-- "�i Bi�n Kinh/#goToWorld(2)",
		"Chuy�n tr�ng th�i nh�n v�t/changeState",
		-- "\nM� r��ng/OpenBox",
		-- "M� t�p h�a/#Sale(35)",
		-- "Ti�u h�y v�t ph�m/destroyItems",
		"Nh�n v�t ph�m ti�u hao/getTieuHao",
		--"\nThanh l� h�nh trang/ClearBagAllItem",

	}

	tinsert(tSay, "\Tho�t/nothing");
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
		"Show npcs/main_show_npc",
		"Show shops/showShops",
		"Ti�n v�o T�ng Ki�m s�n trang/goTangKiem",
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
	for i=0, 9 do
		tinsert(tSay,format("Ti�n v�o �i %d/#GM_NextStageInit(1,%d)",i,i));
	end
	tinsert(tSay,"Trang tr��c/manageTasks");
	tinsert(tSay,"Th�i kh�i/nothing");
	Say(szHeader,getn(tSay),tSay);
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
		Say(g_szTitle.."Ng��i mu�n thanh l� t�i?", 2, "��ng �/#ClearBagAllItem(1)", "\n\n\nKh�ng! Nh�m l�n th�i/nothing")
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


