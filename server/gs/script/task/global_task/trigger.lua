
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\sdb.lua");
--Include("\\script\\lib\\talktmp.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\global_task\\gtask_tsdl.lua");
Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\tmp_task_id_def.lua")
----------------------------------------------------------------------------
--ÌØÊâËµ»°
--¸ÅÂÊ±í {10, 20, 30}
--¶Ô»° {{...}, {...}, {...}}
--·µ»ØÖµ{0,1,1}
function DoTSTalkTask(tRand, tTalk, tRet)
	--if type(tRand) ~= "table" and type(tTalk) ~= "table" and type(tRet) ~= "table" then
		local nMax = 0
		for i = 1, getn(tRand) do
			nMax = nMax + tRand[i]
		end
		
		local nRand = random(1, nMax);
		local nTemp = 0;
		for i = 1, getn(tRand) do
			nTemp = nTemp + tRand[i]
			if nRand <= nTemp then
				nTemp = i
				break
			end
		end
		
		if tTalk[nTemp] ~= nil then
			--local strDiag = tGtNpcMain:dialog_string_deal(tTalk[nTemp]);
			TalkEx("", tTalk[nTemp]);
		end
		
		return tRet[nTemp];
	--else
		--return -1
	--end
end

----------------------------------------------------------------------------
--ÌØÊâµôÂä Íæ¼ÒÉíÉÏËùÓÐµÄÌØÊâµôÂäÈÎÎñÁÐ±í
--·µ»ØÖµ ÁÐ±í [1] TaskID [2] TSDLIdx
function tGTaskTSDL:GetPlayerTSDLList()
	local tTaskID = tGtTask:GetAllTask();
	if getn(tTaskID) == 0 or tTaskID == nil then
		return nil 
	end
	return tGTaskTSDL:ExtractTSDLList(tTaskID);
end

--ÌØÊâµôÂä Íæ¼ÒÉíÉÏÎ´Íê³ÉµÄÌØÊâµôÂäÁÐ±í
function tGTaskTSDL:GetPlayerLiveTSDLList()
	local tTaskID = tGtTask:GetAllTask();
	if getn(tTaskID) == 0 or tTaskID == nil then
		return nil 
	end
	return tGTaskTSDL:ExtractLiveTSDLList(tTaskID)
end

--ÌØÊâµôÂä Íæ¼ÒÉíÉÏÊÇ·ñ´æÔÚÎ´Íê³ÉµÄÌØÊâµôÂä
--·µ»ØÖµ
	--1¡¢ÓÐ
	--0¡¢ÎÞ
function tGTaskTSDL:IsPlayerHaveLiveTSDL()
	local tTaskID = tGtTask:GetAllTask();
	if getn(tTaskID) == 0 or tTaskID == nil then
		return 0
	end
	return tGTaskTSDL:IsLiveTSDL(tTaskID)
end

--ÌØÊâµôÂäµÄ¹Ö
--1¡¢Íæ¼ÒÉíÉÏËùÓÐµÄÈÎÎñ
--2¡¢ÏÖÔÚ´òËÀµÄ¹ÖµÄÃû×Ö
--3¡¢µØÍ¼
--·µ»ØÖµ
	--1¡¢³É¹¦µôÂä£¬²»ÐèÒª´¦Àí´¥·¢Æ÷
	--2¡¢ÎÞÐèÒªÌØÊâµôÂäµÄÈÎÎñ£¬ÒÆ³ý´¥·¢Æ÷
	--3¡¢³É¹¦µôÂä£¬ÐèÒª´¦Àí´¥·¢Æ÷
	--4¡¢ÌØÊâµôÂä²»³É¹¦
function DoTSDLTask(szNpcName, nMapID)
	local tTaskID = tGtTask:GetAllTask();
	local nRet = 2;
	if tTaskID == nil or getn(tTaskID) == 0 then
		return nRet;
	end
	
	local tTaskIDList = {};
	local tTSDLList = {};
	tTaskIDList, tTSDLList = tGTaskTSDL:GetPlayerLiveTSDLList(tTaskID);
	
	for i = 1, getn(tTSDLList) do
		nRet = 4
		if tGTaskTSDL:IsMatch(tTSDLList[i], szNpcName, nMapID) == 1 then
			--print("TSDL:"..tTaskIDList[i]..tTSDLList[i]..szNpcName..nMapID);
			local nRand = random(1, 100);
			if nRand <= tonumber(TABLE_GT_TSDL:getCell(tTSDLList[i], 6)) then	--Ëæ»ú³É¹¦
				--¸øÓèÎïÆ·
				dostring("gf_AddItemEx({"..TABLE_GT_TSDL:getCell(tTSDLList[i], 5).."},\""..TABLE_GT_TSDL:getCell(tTSDLList[i], 4).."\")");
				
				--ÊÇ·ñÍê³ÉµôÂä
				if tGTaskTSDL:IsTSDLEnd(tTSDLList[i]) == 1 and tGTaskTSDL:IsPlayerHaveLiveTSDL() == 0 then
					return 3
				end
				return 1
			end
		end
	end
	
	return nRet
end

KILL_JZJZ_TSDL = 4001
function TSDL_Trigger()	--ÌØÊâµôÂä	
	local nNpcIdx, szNpc, szNpcName = GetTriggeringUnit();	
	--local nMapID, nMapX, nMapY = GetWorldPos();
	local _, nMapID = SubWorldIdx2ID(SubWorld);
	
	local nCreateTrigger = 1;
	if nNpcIdx ~= 0 then
		local nRet = DoTSDLTask(szNpcName, nMapID);
		if nRet == 3 or nRet == 2 then	--ÐèÒª´¦Àí´¥·¢Æ÷
			nCreateTrigger = 0
		end
	end
	
	RemoveTrigger(GetRunningTrigger());
	
	if nCreateTrigger == 1 and GetTrigger(KILL_JZJZ_TSDL) == 0 then
		CreateTrigger(0, 1245, KILL_JZJZ_TSDL, 1);
	end
end

function OnTrigger()
	gt_trigger_callback();
end

--2É±¹Ö´¥·¢Æ÷
function xiaotulang()
	local nNpcIdx = CreateNpc("Thæ Lang V­¬ng", "Thæ Lang V­¬ng", GetWorldPos());
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\global_task\\gtask_npc.lua");
	gt_trigger_callback();
end

--2É±¹Ö´¥·¢Æ÷
function xiaoqinglang()
	local nNpcIdx = CreateNpc("Thanh Lang V­¬ng", "Thanh Lang V­¬ng", GetWorldPos());
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\global_task\\gtask_npc.lua");
	gt_trigger_callback();	
end

--43 É±¹Ö´¥·¢Æ÷
function heixingxing()
	gt_trigger_callback();
	SetTask(Task_id_005,GetTask(Task_id_005)+1);
end

function dushe()
	gt_trigger_callback();
	SetTask(Task_id_005,GetTask(Task_id_005)+1);
end

function yanjingshe()
	gt_trigger_callback();
	SetTask(Task_id_005,GetTask(Task_id_005)+1);
end

function danianshou()
	gt_trigger_callback();
	SetTask(Task_id_005,GetTask(Task_id_005)+1);
end

--121
function youhun_121()
	gt_trigger_callback();
	local tbTask = {
		"§©y chÝnh lµ d­¬ng lôc cña <Quú Hoa B¶o §iÓn> sao?! Haha, cuèi cïng ®· t×m ®­îc råi.",
		"Qu¶ nhiªn lµ mét quyÓn mËt tÞch vâ c«ng thÇn bÝ, luyÖn xong cã thÓ ®¶ th«ng kú kinh b¸t m¹ch trªn ng­êi, æn vËn ch©n khÝ. Ta ph¶i luyÖn thö míi ®­îc. \n<color=green>(®äc mËt tÞch...)<color>",
		"MËt tÞch nµy qu¶ nhiªn kú diÖu \n<color=green>(luyÖn c«ng…………)<color>",
		"å!!! trong ng­êi nh­ cã mét luån ch©n khÝ d©ng trµo\n<color=green>(luyÖn c«ng…………)<color> (®ét nhiªn sau l­ng næi giã)",
		"Lµ ai?!!! \n ( C¶m gi¸c mét luång nhiÖt khÝ tõ phÝa sau Ëp tíi, ngÊt ®i,  trong lóc m¬ hå nh×n thÊy mét g· mÆc ¸o mµu ®en ®o¹t lÊy << Quú Hoa B¶o §iÓn>>  trong tay m×nh, ng­êi nµy lµ ai? nh×n th©n h×nh cã vÎ h¬i quen.)",
	}
	Talk(getn(tbTask),"youhun_121_deal",tbTask[1],tbTask[2],tbTask[3],tbTask[4],tbTask[5]);
end

function youhun_121_deal()
	NewWorld(6018,1618,2901);
	SetFightState(0);
end

function yemaoxiang()
	gt_trigger_callback();
	if GetTaskTemp(TMP_TASK_ID_TAG_101) == 1 then
		if GetItemCount(2, 0, 30056) < 1 then
			local npcIndex = CreateNpc("yunbangzhu", "V©n Bang Chñ", GetWorldPos());
			SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\yunbangzhu.lua");
			SetNpcLifeTime(npcIndex, 10*60);
		end
	end
	SetTaskTemp(TMP_TASK_ID_TAG_101, GetTaskTemp(TMP_TASK_ID_TAG_101) + 1);
end

function heixingxing_101()
	gt_trigger_callback();
	if GetTaskTemp(TMP_TASK_ID_TAG_101) == 1 then
		if GetItemCount(2, 0, 30056) < 1 then
			local npcIndex = CreateNpc("yunbangzhu", "V©n Bang Chñ", GetWorldPos());
			SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\yunbangzhu.lua");
			SetNpcLifeTime(npcIndex, 10*60);
		end
	end
	SetTaskTemp(TMP_TASK_ID_TAG_101, GetTaskTemp(TMP_TASK_ID_TAG_101) + 1);
end

function huoqilin()
	gt_trigger_callback();
	local npcIndex = CreateNpc("lubangzhu", "Lôc bang chñ", GetWorldPos());
	SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\lubangzhu.lua");
	SetNpcLifeTime(npcIndex, 10*60);
end

function ck_zhangweigang()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_shangguhuoqiling()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_yuguaitoumu()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_lili()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_funiushandawang()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_xixiajianglin()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chihuoyaofu()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_boduyingji()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chihuosengwu()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chihuozhanglao()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_axiuluo()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_mohuluojia()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_duanchengen()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chunshisanniang()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_zaxusahan()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function chihuodaoke2()
	gt_trigger_callback()
	Msg2Player("Xi Háa §ao Kh¸ch: Cøu t«i víi, xin ®¹i hiÖp h·y tha cho tiÓu nh©n, Th­¬ng ¦ng ®ang bÞ giam ë nhµ lao cña Long Nh·n §éng 1!")
end

function huofeng_task_huanghuoliujin()
	SendScript2VM("\\script\\task\\huofengtask\\kill_trigger.lua", "kill_fenghuoliujin_call_back()")
end

function dongzhengmujiangjun()
	gt_trigger_callback();
	Talk(1, "", "<sex> qu¶ nhiªn lîi h¹i, chØ tiÕc r»ng Thiªn Ma Tµ Tinh ®· bÞ §Þa HuyÒn Cung Chñ ®o¹t ®i råi, ng­êi ®· ®Õn trÔ mét b­íc.")
end

function huofeng_task_daomuren()
	gt_trigger_callback();
	if random(1,10000) <= 100 then --1%
		Talk(1, "", "Xin ®¹i hiÖp tha m¹ng,Hµn Tinh ThiÕt ®· bÞ L©m Xung L­¬ng S¬n c­íp ®i")
	end
end

function yp_call_guse()
	gt_trigger_callback();
	Talk(1,"yp_call_guse_cb","Cã dÊu vÕt cña <color=red>Cæ Xµ<color>, h·y mau ®¸nh b¹i nã!")
end

function yp_call_guse_cb()
	local nNpcIdx = CreateNpc("Cæ Xµ", "Cæ Xµ", GetWorldPos());
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\global_task\\gtask_npc.lua");
end

function reborn3task_tysmr()
	gt_trigger_callback();
	if gf_GetTeamSize() == 1 or GetCaptainName() == GetName() then
		local nNpcIdx = CreateNpc("fs_hongyinjiaozhu", "Hång Ên Gi¸o Chñ", GetWorldPos());
		SetNpcLifeTime(nNpcIdx, 3600*4);
	end
end