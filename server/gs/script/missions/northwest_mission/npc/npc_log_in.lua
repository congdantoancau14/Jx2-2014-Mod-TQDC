--脚本名称：西北区关卡进入NPC对话
--脚本功能：进入NPC的整合脚本，负责相关的对话以及关卡的开启等相关功能
--策划人：陈公子
--代码开发人：村长
--代码开发时间：2002-08-30
--代码修改记录：
--2008-06-12：增加城市传送NPC相关修改！
--关卡信息
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\missions\\northwest_mission\\mission\\mission_head.lua")
-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\2014_02\\shazhongjin.lua")
--主对话
function main()
	--if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) == 2 then
	--	VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 3);
	--	Say("B秓 ki誱 l﹗ l緈 kh玭g s� d鬾g, h穣 gi髉 ta m礽 ki誱, cho n khi n祇 V祅g trong Ki誱 t醓 竛h h祇 quang ng�.\n<color=gold> ti猽 di謙 333 Sa M筩 H祅h Nh﹏ \n ti猽 di謙 555 T莔 B秓 Nh﹏ <color>", 0);
	--	TaskTip("Ti猽 di謙 333 Sa M筩 H祅h Nh﹏ ");
	--	TaskTip("Ti猽 di謙 555 T莔 B秓 Nh﹏");
	--	return 
	--end
	--if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) == 4 then
	--	VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 5);
	--	Say("B鋘 ngi c﹜ l祄 ta ng鴄 m総, h穣 ti猽 di謙 ch髇g, ta c秏 th蕐 vui ta s� truy襫 b� thu藅. \n<color=gold>ti猽 di謙 99 ngi c﹜<color>", 0);
	--	TaskTip("Ti猽 di謙 99 ngi c﹜");
	--	return 
	--end
	local npc_name = GetTargetNpcName()
	local stage_seq = 0
	for i = 1,Stage_count do
		if npc_name == Tb_stage_npc_name[i] then
			stage_seq = i
			break
		end
	end
	if stage_seq == 0 then
		local tb_dialog_city_main = {
			"Ta mu鑞 n T﹜ V鵦 th莕 b�/stge_main_city",
			"Mua v藅 ph萴 th莕 b�/#Sale(99)",
			"Li猲 quan T﹜ V鵦 th莕 b�/about_mis",
			"R阨 kh醝/end_dialog",
		}
		Say(Npc_name_city.."Theo 甶襲 tra c馻 nhi襲 hi謕 s�, ph竧 hi謓 T﹜ V鵦 c� nhi襲 ng ch鴄 nhi襲 Kim th筩h c� th� th猰 <color=yellow>Linh t輓h<color> cho binh kh�. Tri襲 nh c騨g 產ng b総 u coi tr鋘g s竎h lc l蕐 v� c鴘 qu鑓 n猲 ph竔 ch髇g t玦 n  h� tr� c竎 hi謕 s�. Ngo礽 ra tr猲 tay ta  thu th藀 y  v藅 ph萴  c竎 v� hi謕 s� s� d鬾g tr猲 阯g kh竚 ph� T﹜ V鵦.",
			getn(tb_dialog_city_main),tb_dialog_city_main
		)
	else
		local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
		--将法器送给白天成
		if nStep_XBTask_01 == 65 and npc_name == "B筩h Thi猲 Th祅h" then
			task_023_03_0()
			return
		end
		--玩家关卡区分
		local stage_diff = stage_diff_chk(stage_seq)
		SetTask(Task_ID_stage_diff,stage_diff)
		if stage_diff == 0 then
			Talk(1,"",Stage_info[stage_seq].no_task_dialog)
			return
		end
		SetTask(TaskID_miss_login_diff,1)
		SetTask(Task_ID_stage_seq,stage_seq)		--将对应的关卡信息保存，在此NPC处的所有
			--对话
		Say(Stage_info[stage_seq].main_dialog[stage_diff],
			4,
			Stage_info[stage_seq].log_in_dialog[stage_diff].."/search_ground",
			"襲 ki謓 vt 秈/stage_condition",
			Stage_info[stage_seq].stage_name.."B鑙 c秐h/stage_backgroud",
			"R阨 kh醝/end_dialog"
		)
	end
end
--城市关卡选择主对话
function stge_main_city()
	local stage_name = {}
	for i = 1, Stage_count do
		tinsert(stage_name,Stage_info[i].stage_name.."/#city_stage_sel("..i..")")
	end
	tinsert(stage_name,"tr� l筰/main")
	tinsert(stage_name,"R阨 kh醝/end_dialog")
	Say(Npc_name_city.."V礽 n琲 � T﹜ V鵦  ph竧 hi謓 <color=yellow>Kim th筩h<color>, b筺 mu鑞 n u  t譵 hi觰?",
		getn(stage_name),stage_name
	)
end
--城市关卡选定
function city_stage_sel(stage_seq)
	SetTask(TaskID_miss_login_diff,2)
	SetTask(Task_ID_stage_diff,2)
	SetTask(Task_ID_stage_seq,stage_seq)
	search_ground()
end
--城市关卡信息
function about_mis()
	Say(Npc_name_city.."Nhi襲 hi謕 s� Чi T鑞g ph竧 hi謓 <color=yellow>Kim th筩h<color> � v飊g t th莕 b� T﹜ V鵦, 頲 bi誸 <color=green>Long Quang Ch﹏ Nh﹏<color> c� th� s� d鬾g Kim th筩h  l祄 to竧 l猲 <color=yellow>H祇 quang<color> c馻 binh kh�, th薽 ch� c� g鋓 ra <color=yellow>Linh t輓h<color> c馻 binh kh�. V� l﹎ nh﹏ s� 飊 飊 k衞 n T﹜ V鵦  kh竚 ph� l筰 th猰 vi謈 T﹜ H� kh玭g ch辵 ngh� h遖 bao phen x﹎ ph筸 bi猲 gi韎 nc ta, tri襲 nh ph竔 ta mang tin t鴆 n gi髉  c竎 v� hi謕 s�.",
		2,
		"tr� l筰/main",
		"R阨 kh醝/end_dialog"
	)
end
--可用场地对话
function search_ground()
	--对话生成
	local stage_diff = GetTask(Task_ID_stage_diff)
	local stage_seq = GetTask(Task_ID_stage_seq)
	local login_diff = GetTask(TaskID_miss_login_diff)
	local tb_dialog = {}
	local team_total = 0
	local map_total = getn(Stage_info[stage_seq].map[login_diff])
	for i = 1, map_total do
		if mf_GetMissionV(MS_ID,MS_STATE_ID,Stage_info[stage_seq].map[login_diff][i]) == 0 then
			tinsert(tb_dialog,Stage_info[stage_seq].stage_name.."["..i.."(Tr筺g th竔: Tr鑞g)/#log_stageg("..Stage_info[stage_seq].map[login_diff][i]..")")
		else
			tinsert(tb_dialog,Stage_info[stage_seq].stage_name.."["..i.."(Tr筺g th竔: Chi誱 d鬾g)/cannot_log")
			team_total = team_total + 1
		end
	end
	if team_total < map_total then
		local dialog_main = Stage_info[stage_seq].ground_sel_dialog[stage_diff][1]
		if login_diff == 2 then
			dialog_main = Stage_info.city_mis_dia_main[stage_seq]
			tinsert(tb_dialog,"Kh竚 ph�"..Stage_info[stage_seq].stage_name.."襲 ki謓/stage_condition")
			tinsert(tb_dialog,"Kh竚 ph�"..Stage_info[stage_seq].stage_name.."nh綾 nh�/stage_login_clew")
		end	
		tinsert(tb_dialog,"tr� l筰/main")
		tinsert(tb_dialog,"R阨 kh醝/end_dialog")
		Say(dialog_main.."(<color=yellow>Nh綾 nh�: khi v祇 tr薾 s� v鴗 b� th� c璶g tr猲 ngi c馻 nh﹏ v藅<color>)",
			getn(tb_dialog),
			tb_dialog
			)
	else
		local dialog_main = Stage_info[stage_seq].ground_sel_dialog[stage_diff][2]
		if login_diff == 2 then
			dialog_main = Npc_name_city.."Х c� h祇 ki謙 kh竎 產ng vt 秈, h穣 quay l筰 sau!"
		end	
		Talk(1,"",Stage_info[stage_seq].ground_sel_dialog[stage_diff][2])
	end
end
--登录关卡的操作
function log_stageg(map_id)
	local stage_seq = GetTask(Task_ID_stage_seq)
	local stage_diff = GetTask(Task_ID_stage_diff)
	local login_diff = GetTask(TaskID_miss_login_diff)
	
	local npc_name = Stage_info[stage_seq].npc_name
	if login_diff == 2 then
		npc_name = Npc_name_city
	end
	--登录条件检测
	--组队检测
	if Mission_team_chk(1,1,5) ~= 1 then
		local dialog_main = Stage_info[stage_seq].cannot_log_reason[stage_diff][1]
		if login_diff == 2 then
			dialog_main = Stage_info[stage_seq].cannot_log_reason[3][1]
		end		
		Talk(1,"",dialog_main)
		return
	end
	--队伍成员任务步骤检测
	if stage_diff ~= 2 then
		local unlogin_player = team_mission_step_chk() 
		if unlogin_player ~= "none" then
			local dialog_main = Stage_info[stage_seq].cannot_log_reason[stage_diff][3]
			if login_diff == 2 then
				dialog_main = Stage_info[stage_seq].cannot_log_reason[3][3]
			end	
			Talk(1,"",dialog_main.."\n    T� i kh玭g ph� h頿 甶襲 ki謓 nhi謒 v�: <color=yellow>"..unlogin_player.."<color>")
			Zgc_pub_mission_team_msg(unlogin_player.."Ch璦 n bc nhi謒 v� k� ti誴, kh玭g th� v祇 秈!")
			return
		end
	end
	--职业重复检测
	if mission_route_chk() ~= 1 then
		local dialog_main = Stage_info[stage_seq].cannot_log_reason[stage_diff][4]
		if login_diff == 2 then
			dialog_main =Stage_info[stage_seq].cannot_log_reason[3][4]
		end	
		Talk(1,"",dialog_main)
		return
	end
	--PK值的检测
	local pk_chk_player = mission_pk_chk()
	if pk_chk_player ~= "none" then
		Talk(1,"",npc_name.."Trong i c� th祅h vi猲 c� tr� PK l韓 h琻 <color=yellow>"..Mission_PK_max.."<color>, h穣 x鉧 tr� PK r錳 quay l筰 vt 秈.\n    T� i kh玭g  甶襲 ki謓: <color=yellow>"..pk_chk_player.."<color>")
		Zgc_pub_mission_team_msg(pk_chk_player.."PK vt qu� "..Mission_PK_max..", kh玭g th� vt 秈!")
		return
	end
	--完成次数检测
	local week_login_chk = misssion_week_times_chk()
	if week_login_chk ~= "none" then
		Talk(1,"",npc_name.."Trong i c� th祅h vi猲 vt qu� gi韎 h筺 <color=yellow>"..Mission_login_times_per_week.."<color> l莕 vt 秈 c馻 tu莕.\n    T� i kh玭g  甶襲 ki謓: <color=yellow>"..week_login_chk.."<color>")
		Zgc_pub_mission_team_msg(week_login_chk.."S� l莕 vt 秈 tu莕 n祔 vt qu�"..Mission_login_times_per_week..", kh玭g th� vt 秈!")
		return
	end
	--是否在同一地图检测
	if Zgc_pub_missio_same_map_chk() ~= 1 then
		Talk(1,"",npc_name.."Mu鑞 a i v� m譶h c飊g v祇 ph秈 a i c馻 ngi n ch� ta!")
		return
	end
	--玩家等级检测
	local level_chk_player = player_level_chk()
	if  level_chk_player ~= "none" then
		local dialog_main = Stage_info[stage_seq].cannot_log_reason[stage_diff][1]
		if login_diff == 2 then
			dialog_main = Stage_info[stage_seq].cannot_log_reason[3][1]
		end		
		Talk(1,"",dialog_main.."\n    T� i kh玭g ph� h頿 甶襲 ki謓: <color=yellow>"..level_chk_player.."<color>")
		Zgc_pub_mission_team_msg(level_chk_player.."Ch璦 t c蕄 "..Stage_player_level_min..", kh玭g th� v祇 秈!")
		return
	end
	--关卡是否被占用检测
	if mf_GetMissionV(MS_ID,MS_STATE_ID,map_id) == 1 then
		cannot_log()
		return
	end
	--队伍中完成关卡的玩家进行门票检测
	if mission_goods_chk() ~= 1 then
		local dialog_main = Stage_info[stage_seq].cannot_log_reason[stage_diff][2]
		if login_diff == 2 then
			dialog_main =Stage_info[stage_seq].cannot_log_reason[3][2]
		end	
		Talk(1,"",dialog_main)
		return
	end
	--stage关卡
	if mf_OpenMission(MS_ID,map_id) ~= 1 then
		cannot_log()
		return
	end
	--mission相关操作
	mf_SetMissionV(MS_ID,MS_PLAYER_NUM,GetTeamSize(),map_id)				--设置关卡初始的进入人数
	mf_SetMissionV(MS_ID,MS_STATE_DIFF_ID,stage_seq,map_id)					--当前关卡是第几关
	if stage_seq == 5 then
		mf_SetMissionV(MS_ID,MS_BOSS_KILL_NUM,0,map_id)
	end
	mf_SetMissionV(MS_ID,MS_STATE_ID,MS_state_wait_start,map_id)			--关卡状态设置为等待开始
	mf_SetMissionV(MS_ID,MS_DIFF,stage_diff,map_id)										--关卡类型：1为简单，2为复杂
	--设置登录地点
	local player_route_str = ""
	for i = 1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		player_route_str = player_route_str..GetPlayerRoute().."	"
	end
	SetMapTaskTemp(map_id,1,(GetMapTaskTemp(map_id,1) +1))
	local mission_count = GetMapTaskTemp(map_id,1)
	WriteLog("[秈 T﹜ B綾]Th鑞g k� ng nh藀: ID 秈	"..stage_seq..":"..map_id..":"..mission_count.."	S� ngi ch琲	"..GetTeamSize().."	T猲 i trng: 	"..GetName().."	M� h� ph竔 ngi ch琲	"..player_route_str.."")
	--关卡开始函数
	for i = 1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		SetFightState(1)
		SetTask(Task_ID_stage_diff,stage_diff)
		SetTask(Task_ID_stage_seq,stage_seq)
		SetTask(TaskID_miss_login_diff,login_diff)
		mf_JoinMission(MS_ID,0,map_id)
		NewWorld(map_id,Stage_info[stage_seq].in_coordinate[1],Stage_info[stage_seq].in_coordinate[2])
		WriteLogEx("Vuot ai Tay Vuc", "tham gia")
	end
	PlayerIndex = player_index_save
end
--关卡繁忙状态的对话
function cannot_log()
	local stage_seq = GetTask(Task_ID_stage_seq)
	
	local login_diff = GetTask(TaskID_miss_login_diff)
	local npc_name = Stage_info[stage_seq].npc_name
	if login_diff == 2 then
		npc_name = Npc_name_city
	end
	Talk(1,"search_ground",npc_name.."Л阯g n祔  c� h祇 ki謙 甶, sao kh玭g ch鋘 con 阯g kh竎?")
end
--闯关条件
function stage_condition()
	local stage_seq = GetTask(Task_ID_stage_seq)
	local stage_diff = GetTask(Task_ID_stage_diff)
	
	local login_diff = GetTask(TaskID_miss_login_diff)
	local dialog_main = Stage_info[stage_seq].stage_condition[stage_diff]

	--闯关条件生成
	if stage_diff ~= 1 then
		dialog_main = "\n    . Do <color=yellow> i trng d蒼 u t� i 3-5 ngi<color> n, t蕋 c� th祅h vi猲 ph秈 t n c蕄 <color=yellow>"..Stage_player_level_min.."<color> c蕄."
		local npc_name = Stage_info[stage_seq].npc_name
		if login_diff == 2 then
			npc_name = Npc_name_city
		end
		dialog_main = npc_name..Stage_info.stage_condition_main_dialog[stage_seq]..dialog_main
		if getn(Stage_info[stage_seq].task_goods[2] ) ~= 0 then
			local task_goods_need = "\n    . чi trng ph秈 mang theo <color=yellow>"
			for i = 1,getn(Stage_info[stage_seq].task_goods[2]) do
				if i > 1 then
					task_goods_need = task_goods_need..","
				end
				task_goods_need = task_goods_need..Stage_info[stage_seq].task_goods[2][i][5]
			end
			dialog_main = dialog_main..task_goods_need.."<color>"
		end
		dialog_main = dialog_main.."\n    . Trong i <color=yellow>kh玭g 頲 c� ngi v� c玭g l璾 ph竔 gi鑞g nhau<color>."
		dialog_main = dialog_main.."\n    . Trong t� i m鏸 tu莕 m鏸 ngi vt 秈 kh玭g th� vt qu� <color=yellow>"..Mission_login_times_per_week.."<color> l莕."
		dialog_main = dialog_main.."\n    . Th祅h vi猲 trong i <color=yellow>tr� PK<color> kh玭g th� vt qu� <color=yellow>"..Mission_PK_max.."<color>."
	end
	Talk(1,"search_ground",dialog_main)
end
--关卡背景介绍
function stage_backgroud()
	local stage_diff = GetTask(Task_ID_stage_diff)
	local stage_seq = GetTask(Task_ID_stage_seq)
	Say(Stage_info[stage_seq].stage_background[stage_diff],
	2,
	"tr� l筰/main",
	"R阨 kh醝/end_dialog"
	)	
end
--闯关提示
function stage_login_clew()
	local login_diff = GetTask(TaskID_miss_login_diff)
	local stage_seq = GetTask(Task_ID_stage_seq)
	local npc_name = Stage_info[stage_seq].npc_name
	if login_diff == 2 then
		npc_name = Npc_name_city
	end
	Talk(1,"search_ground",npc_name..Stage_info.stage_login_clew[stage_seq])
end
--=============公共函数定义区
--玩家任务步骤检测
function stage_diff_chk(stage_seq)
	if GetTask(Stage_info[stage_seq].task_ID[1]) == Stage_info[stage_seq].task_ID[2] then
		return 1
	else
		return 2
	end
end
--检测是否开启普通关卡还是复杂关卡
function team_mission_step_chk()			--暂时定为只开始普通关卡
	local stage_seq = GetTask(Task_ID_stage_seq)
	local stage_diff  = GetTask(Task_ID_stage_diff)
	local player_index_save = PlayerIndex
	local chk_flag = 2
	local player_stage_diff = 0
	local player_unlogin_name = ""
	--队内成员判断
	for i = 1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if stage_diff == 1 and GetTask(Stage_info[stage_seq].task_ID[1]) <  Stage_info[stage_seq].task_ID[2] then
			player_unlogin_name = player_unlogin_name.." "..GetName()
			Talk(1,"","<color=green>Nh綾 nh�<color>: B筺 ch璦 ho祅 th祅h nhi謒 v� trc, kh玭g th� v祇 秈!")
		end
	end
	PlayerIndex = player_index_save
	if player_unlogin_name == "" then
		return "none"
	else
		return player_unlogin_name
	end
end
--检测关卡所需要的任务物品
function mission_goods_chk()
	local stage_seq = GetTask(Task_ID_stage_seq)
	local stage_diff = GetTask(Task_ID_stage_diff)
	local task_goods_num = getn(Stage_info[stage_seq].task_goods[stage_diff])
	if task_goods_num == 0 then
		return 1
	else
		for i = 1,task_goods_num do
			if GetItemCount(Stage_info[stage_seq].task_goods[stage_diff][i][1],Stage_info[stage_seq].task_goods[stage_diff][i][2],Stage_info[stage_seq].task_goods[stage_diff][i][3]) < Stage_info[stage_seq].task_goods[stage_diff][i][4] then
				return 0
			end
		end
		if stage_diff == 2 then
			local del_flag = 1
			for i = 1,task_goods_num do
				del_flag = del_flag * DelItem(Stage_info[stage_seq].task_goods[stage_diff][i][1],Stage_info[stage_seq].task_goods[stage_diff][i][2],Stage_info[stage_seq].task_goods[stage_diff][i][3],Stage_info[stage_seq].task_goods[stage_diff][i][4])
			end
			return del_flag
		else
			return 1
		end
	end
end
--队伍任务检测
function Mission_team_chk(captain_flag,member_min,memeber_max)
	--队伍成员数量检测
	local team_member = GetTeamSize()

	if team_member < member_min or team_member > memeber_max then
		return 0
	end
	--队长检测
	if captain_flag == 1 and GetTeamMember(0) ~= PlayerIndex then
		return 0
	end
	return 1
end
--职业重复检测
function mission_route_chk()
	local tb_palyer_route = {}
	local player_route = 0
	local player_index_save = PlayerIndex
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		player_route = GetPlayerRoute()
		if getn(tb_palyer_route) ~= 0 then
			for i = 1,getn(tb_palyer_route) do
				if player_route == tb_palyer_route[i] then
					PlayerIndex = player_index_save
					return 0
				end
			end
		end
		tinsert(tb_palyer_route,player_route)
	end
	PlayerIndex = player_index_save
	return 1
end
--PK值检测
function mission_pk_chk()
	local player_index_save = PlayerIndex
	local pk_chk_name = ""
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetPKValue() > Mission_PK_max then
			pk_chk_name = pk_chk_name.." "..GetName()
			Talk(1,"","<color=green>Nh綾 nh�<color>: Tr� PK c馻 b筺 vt qu� <color=yellow>"..Mission_PK_max.."<color>, kh玭g th� v祇 秈!")
		end
	end
	PlayerIndex = player_index_save
	if pk_chk_name == "" then
		return "none"
	else
		return pk_chk_name
	end
end
--每周进入关卡的次数限制
function misssion_week_times_chk()
	local player_index_save = PlayerIndex
	local mis_times_name = ""
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetTask(Mission_week_seq_TaskID) ==Zgc_pub_week_seq()  and GetTask(Mission_login_times_TaskID) >= Mission_login_times_per_week then
			mis_times_name = mis_times_name.." "..GetName()
			Talk(1,"","<color=green>Nh綾 nh�<color>: B筺  vt 秈 <color=yellow>"..Mission_login_times_per_week.."<color> l莕, vt qu� s� l莕 t鑙 產!")
		end
	end
	PlayerIndex = player_index_save
	if mis_times_name == "" then
		return "none"
	else
		return mis_times_name
	end
end
--玩家等级限制
function player_level_chk()
	local player_index_save = PlayerIndex
	local mis_level_name = ""
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetLevel() < Stage_player_level_min  then
			mis_level_name = mis_level_name.." "..GetName()
			Talk(1,"","<color=green>Nh綾 nh�<color>: Ъng c蕄 nh� h琻 <color=yellow>"..Stage_player_level_min.."<color>, kh玭g th� v祇 秈!")
		end
	end
	PlayerIndex = player_index_save
	if mis_level_name == "" then
		return "none"
	else
		return mis_level_name
	end	
end
--城市进入关卡时的相关提示修改
function dialog_main_sub(sub_str,stage_seq)
	return Npc_name_city..(strsub(sub_str,(strlen(Stage_info[stage_seq].npc_name)+1),strlen(sub_str)))
end
