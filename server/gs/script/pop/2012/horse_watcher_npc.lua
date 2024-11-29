--Âí¾Ç¿´ÊØ\´óÃû¸®ÑÝÎä¹Ù
Include("\\script\\lib\\define.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\global_task\\gtask_head.lua")
function nothing()
end

function give_horse()
	local nFollowIdx = GetFollower();
	if nFollowIdx == 0 then
		Talk(1,"","§¹i hiÖp kh«ng cã ChiÕn M· Ch¹y Xa.");
		return 0;
	end
	local sName, sTemplateName = GetNpcName(nFollowIdx);
	if sName == "ChiÕn M· Ch¹y Xa" and sTemplateName == "ChiÕn M· Ch¹y Xa" then
		KillFollower();
		SetTask(TASKID_SW_USE_ANTIDOTE,GetTask(TASKID_SW_USE_ANTIDOTE) + 1);
		Talk(1,"","Ng­êi Canh Chuång: §a t¹, ®¹i hiÖp ®· gióp ta t×m ®­îc chiÕn m·.");
	else
		Talk(1,"","§¹i hiÖp kh«ng cã ChiÕn M· Ch¹y Xa.");
		return 0;
	end
end

function OnDeath()
	SetFightState(0);
	SetPos(1529,3339);
	SetTask(TASKID_SW_TASK1013,0);
	SetDeathScript("");
	return 1;
end

function go_to_exercise()
	local nRet =  NewWorld(5077,1574,3297);
	SetTask(TASKID_SW_TASK1013,1);
	if nRet == 0 then return 0; end
	SetFightState(1);
	RemvoeTempEffect();
	SetDeathScript("\\script\\pop\\2012\\horse_watcher_npc.lua");
	Restore();
	CastState("state_block_left_skill",1,7*24*60*60);
	CastState("state_block_qinggong",2,7*24*60*60);
	CastState("state_lock",3,7*24*60*60);
end

function leave_dmf()
	SetFightState(0);
	SetDeathScript("");
	SetTask(TASKID_SW_TASK1013,0);
	SetPos(1529,3339);
	RemvoeTempEffect();
end

function go_to_execution_ground()
	NewWorld(5078,1783,3324);
	RemvoeTempEffect();
	Restore();
--	LearnSkill(1781);
end

function leave_execution_ground()
	NewWorld(5078,1823,3264);
	RemvoeTempEffect();
--	RemoveSkill(1781)
end




	
tInfo = {
	["Ng­êi Canh Chuång"]			= {{945},		"Ta muèn giao nép ChiÕn M· Ch¹y Xa/give_horse",},
	["§¹i Danh Phñ DiÔn Vâ Quan"]	= {{76},	"Ta muèn tiÕn hµnh luyÖn tËp diÔn vâ!/go_to_exercise","Ta chØ tiÖn ®­êng ghÐ ngang/nothing",},
	["VÖ Binh DiÔn Vâ Tr­êng"]		= {nil,		"Ta muèn rêi khái diÔn vâ tr­êng!/leave_dmf","Ta chØ tiÖn ®­êng ghÐ ngang/nothing",},
	["V« T­¬ng T«ng-Ph¸p Tr­êng Kh¸n Thñ"] = {{78},	"Ta muèn vµo Ph¸p Tr­êng V« T­¬ng T«ng!/go_to_execution_ground","Ta chØ tiÖn ®­êng ghÐ ngang/nothing",},
	["§ao Phñ Ph¸p Tr­êng"]		= {nil,		"Ta muèn rêi khái Ph¸p Tr­êng V« T­¬ng T«ng!/leave_execution_ground","Ta chØ tiÖn ®­êng ghÐ ngang/nothing",},
--	["µÀÍ¯Ó±"]				= {{930,1014},	"ÎÒÒª½øÈë×ÏÂÞÉ½ÐÞµÀ³¡£¡/goto_ziluoshan","ÎÒÒªÀë¿ª×ÏÂÞÉ½ÐÞµÀ³¡£¡/leave_ziluoshan"},
	}

function main()
	local nNpcIdx = GetTargetNpc();
	local nNpcName = GetNpcName(nNpcIdx);
	if not tInfo[nNpcName] then
		return 0;
	end
	local bIfTask = 0;
	if type(tInfo[nNpcName][1]) == "table" then
		for i = 1,getn(tInfo[nNpcName][1]) do
			if type(tInfo[nNpcName][1][i]) == "number" and 1 == tGtTask:check_cur_task(tInfo[nNpcName][1][i]) then
				bIfTask = 1
				break;
			end
		end
	else
		bIfTask = 1;
	end
	
	if bIfTask ~= 1 then
		return 0;
	end
	
	local strtab = {}
	for i = 2,getn(tInfo[nNpcName]) do
		if type(tInfo[nNpcName][i]) == "string" then
			tinsert(strtab,tInfo[nNpcName][i])
		end
	end
	Say(nNpcName .. ":",
		getn(strtab),
		strtab)
end
