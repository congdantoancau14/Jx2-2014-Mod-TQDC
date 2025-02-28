-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 龙门镇NPC店小二Script
-- By StarryNight
-- 2007/06/07 PM 4:00

-- 旅游了，一点感觉都无……

--村长2007-12-19增加西北区关卡第七关
-- ======================================================
-- 引用剧情任务头文件
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
	Npc_name = "<color=green>Ti觰 Nh�<color>: "
function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- 西北任务02情困客栈----------------------------------
	
	--与店小二对话索取醒酒药
	if nStep_XBTask == 6 then
		task_002_02_0();
		return
	end
	
	--与店小二对话取得或未取得醒酒药
	if nStep_XBTask == 7 then
		task_002_03_0();
		return
	end
	
	--取得醒酒药后未与孙二琏对话
	if nStep_XBTask == 8 then
		task_002_03_1();
		return
	end
	
	--询问店小二醒酒药无效之事
	if nStep_XBTask == 9 then
		task_002_05_0();
		return
	end
	
	--尚未与欧阳画对话
	if nStep_XBTask == 10 then
		task_002_05_1();
		return
	end
	
	---------------------------------- 西北任务03春十三娘----------------------------------
	
	--询问春十三娘去向
	if nStep_XBTask == 11 then
		task_003_02_0();
		return
	end
	
	--未取得肚兜前对话
	if nStep_XBTask == 12 then
		task_003_02_1();
		return
	end
	
	---------------------------------- 西北区29枭雄之宴------------------------------------------
	--取得龙门宴请柬
	if nStep_XBTask_01 == 70 then
		task_29_03_0();
		return
	end
	--还未击败李元庆
	Msg2Player("Is_stage_sign_time([1]): "..Is_stage_sign_time(Tb_stage7_map_list[1]));
	
	if nStep_XBTask_01 >= 71 and Is_stage_sign_time(Tb_stage7_map_list[1]) ~= 0 and GetTask(Tb_stage7_sign_task_info[1]) >= Tb_stage7_sign_task_info[2] then
		local tb_stage7_dia_main ={
			"Ta mu鑞 d� ti謈/ground_log_in",
			"襲 ki謓 d� ti謈/stage_condition",
			"Nh綾 nh�/stage_clew",
			"Gi韎 thi謚 y課 ti謈 Long M玭/stage_backgroud",
			"R阨 kh醝/end_dilog",
		--	"关卡开启/lishi",
			}
		Say(Npc_name..Npc_name.."Ngi mu鑞 t� ch鴆 y課 ti謈  chi猽 i cao th� Trung Nguy猲, g� n 玭g m� b� ch� ta ch� i cu鑙 c飊g c騨g  xu蕋 hi謓!",
		getn(tb_stage7_dia_main),
		tb_stage7_dia_main
		)
	else
		Talk(1,"",Npc_name.."Kh竎h quan mu鑞 t譵 ch� tr�? Qu竛 tr� c馻 ch髇g t玦 c� th� xem l� t鑤 nh蕋 � Long M玭 tr蕁 n祔, b雐 v� trong tr╩ d苖 quanh y ch� c� duy nh蕋 qu竛 tr� c馻 ch髇g t玦 th玦.")
	end
end;
--**************************以下为西北区关卡处理****************************
--关卡信息
Include("\\script\\lib\\missionfunctions.lua")
--Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\missions\\northwest_mission\\dragon_door_feast\\mission_head.lua")
--场地选择
function ground_log_in()
	--PK值限定
	if GetPKValue() > 3 then
		Talk(1,"",Npc_name.."C竎 h� s竧 kh� qu� n苙g, h穣 gi秏 <color=yellow>甶觤 PK<3<color> h穣 n d� ti謈!")
		return
	end
	--已经进入过的玩家直接进入
	if GetTask(Stage7_date_seq) == zgc_pub_day_turn(1)  then
		local map_saved = GetTask(Stage7_map_id)
		if Is_stage_sign_time(map_saved) ~= 0 then
			log_stage7_deal(map_saved)
		else
			Talk(1,"",Npc_name.."<color=yellow>y課 ti謈 Long M玭<color>  k誸 th骳, <color=green>L� Nguy猲 Kh竛h<color> ch璦 bi誸 ng祔 n祇 s� t� ch鴆 l筰, l莕 sau h穣 n nh�!")
		end
		return
	end
	--请帖携带判断
	if GetItemCount(2,0,1037) == 0 then
		Talk(1,"",Npc_name.."Kh竎h quan n d� y課 ti謈? Xin cho xem thi謕 m阨, ngi 頲 <color=green>L� Nguy猲 Kh竛h<color> m阨 u c� <color=yellow>thi謕 m阨 Long M玭<color>! ")
		return
	end
	--获得空闲地图
	local free_map_id  = free_map_chk()
	if free_map_id == 0 then
		Talk(1,"",Npc_name.."Ti觰 甶誱 ng l�  chi猽 i kh玭g chu o! Kh竎h d� y課 ti謈  n , m阨 kh竎h quan l莕 sau h穣 n, xin lng th�!")
		return
	else
		local log_in_num = mf_GetMissionV(FEAST_MS_ID,MS_PLAYER_NUM,free_map_id)
		Say(Npc_name.."B筺 頲 chuy觧 n <color=yellow>y課 ti謈 Long M玭"..(free_map_id - 1105).."<color>, s� ngi d� ti謈 hi謓 l� <color=yellow>"..log_in_num.."<color>, kh竎h quan mu鑞 v祇 kh玭g?",
		2,
		"Ta mu鑞 v祇/#stage7_login("..free_map_id..")",
		"в ta suy ngh� l筰/end_dialog"
		)
	end
end
--场地进入
function stage7_login(map_id)
	--小白不得参加
	if GetPlayerFaction() == 0 then
		Talk(1,"",Npc_name.."Ch� c� nh﹏ v藅  v祇 <color=yellow>l璾 ph竔<color> m韎 c� th� d� ti謈, ng c蕄 c竎 h� ch璦 ! (Nh綾 nh�: Ch� c� nh﹏ v藅  v祇 l璾 ph竔 m韎 c� th� b竜 danh).")
		return
	end
	--如果是进入关卡出来的则直接进入
	local player_num = mf_GetMissionV(FEAST_MS_ID,MS_PLAYER_NUM,map_id) 
	--判断关卡是否已经结束
	local mis_state = mf_GetMissionV(FEAST_MS_ID,MS_STATE_ID,map_id) 
	if Is_stage_sign_time(map_id) ~= 1 then
			Talk(1,"",Npc_name.."<color=green>L� Nguy猲 Kh竛h<color> i nh﹏ n鉯: 'Ngi l� m� l玦 th玦 kh玭g th� l� h祇 ki謙', bu鎖 ti謈  b総 u, kh竎h quan l莕 sau h穣 n!")
			return
	end
	--人数判断
	if tonumber(date("%w")) == 5 then
		Stage7_player_num_max = 100
	else
		Stage7_player_num_max = 50
	end
	if  player_num >= Stage7_player_num_max then
		Talk(1,"main",Npc_name.."Xui qu�! L莕 n祔 ta h琲 do d�, ngi xem gi髉 bu鎖 ti謈 kh竎 c遪 ch� tr鑞g n祇 kh玭g!")
		return
	end
	--请帖携带判断
	if GetItemCount(2,0,1037) == 0 then
		Talk(1,"",Npc_name.."Kh竎h quan n d� y課 ti謈? Xin cho xem thi謕 m阨, ngi 頲 <color=green>L� Nguy猲 Kh竛h<color> m阨 u c� <color=yellow>thi謕 m阨 Long M玭<color>! ")
		return
	end
	if DelItem(2,0,1037,1) ~= 1 then
		Talk(1,"",Npc_name.."Kh竎h quan n d� y課 ti謈? Xin cho xem thi謕 m阨, ngi 頲 <color=green>L� Nguy猲 Kh竛h<color> m阨 u c� <color=yellow>thi謕 m阨 Long M玭<color>! ")
		return
	end
	mf_SetMissionV(FEAST_MS_ID,MS_PLAYER_NUM,(player_num +1),map_id)				--设置关卡初始的进入人数
	SetTask(TaskID_feast_prize_step,0)
	SetTask(Stage7_date_seq,zgc_pub_day_turn(1))
	SetTask(Stage7_map_id,map_id)
	WriteLogEx("Yen tiec Long Mon", "tham gia")
	log_stage7_deal(map_id)
end
--进入关卡
function log_stage7_deal(map_id)
	--进入关卡的处理
	CleanInteractive()
	if NewWorld(map_id,1625,3182) == 1 then
		mf_JoinMission(FEAST_MS_ID,0,map_id)
	end	
end
--闯关条件
function stage_condition()
	Talk(1,"main",Npc_name.."<color=green>L� Nguy猲 Kh竛h<color> i nh﹏ chi猽 i cao th� thi猲 h� t筰 ti觰 甶誱, n誹 c竎 h� c� hi觰 l莔 v韎 <color=green>L� Nguy猲 Kh竛h<color> h穣 甧m <color=green>thi謕 m阨 Long M玭<color> c馻 <color=yellow>L� i nh﹏<color> ph竧 n d� ti謈! (Ch� �: <color=green>L� Nguy猲 Kh竛h<color> m鏸 tu莕 i ti謈 � Long M玭 1 l莕, h穣 mang theo <color=yellow>thi謕 m阨 Long M玭<color> n d� v祇 m鏸 <color=yellow>16:30-16:40 m鏸 th� 6 v� th� 7<color>)")
end
--闯关提示
function stage_clew()
	Talk(1,"",Npc_name.."Ch� b� sung")
end
--背景介绍
function stage_backgroud()
	Talk(1,"main",Npc_name.."<color=green>L� Nguy猲 Kh竛h<color> ngi n 玭g b� ch� ch髇g t玦 ch� i cu鑙 c飊g c騨g xu蕋 hi謓, m芻 d� vi謈 giang h� ch髇g t玦 c騨g 輙 h醝 t韎 nh璶g <color=green>L� Nguy猲 Kh竛h<color> l莕 n祔 chi猽 i c竎 cao th� Trung Nguy猲 nh� mu鑞 h遖 gi秈 chuy謓 Nh蕋 Ph萴 Л阯g  g﹜ ra � Ph鬾g Tng, cho n猲 <color=green>L� Nguy猲 Kh竛h<color>  ph竧 thi謕 m阨 kh緋 thi猲 h�, ngi nh薾 頲 thi謕 n祔 n猲 tranh th� th阨 gian n d� ti謈!")
end
--第七关报名时间判断
function Is_stage_sign_time(map_id)
	Msg2Player("FEAST_MS_ID: "..FEAST_MS_ID);
	Msg2Player("MS_STATE_ID: "..MS_STATE_ID);
	Msg2Player("map_id: "..map_id);
	Msg2Player("mf_GetMissionV: "..mf_GetMissionV(FEAST_MS_ID,MS_STATE_ID,map_id));
	local ms_state = mf_GetMissionV(FEAST_MS_ID,MS_STATE_ID,map_id)
	if ms_state == 0 or ms_state == nil then
		return 0
	else
		if mf_GetMissionV(FEAST_MS_ID,MS_TIMMER_LOOP_ID,map_id) < 3060 then
			return 2
		else
			return 1
		end
	end	
end
--空闲场地判断
function free_map_chk()
	local free_map_id = 0
	for i = 1,getn(Tb_stage7_map_list) do
		local ms_state = mf_GetMissionV(FEAST_MS_ID,MS_STATE_ID,Tb_stage7_map_list[i])
		if ms_state ~= 0 and ms_state ~= nil then
			if mf_GetMissionV(FEAST_MS_ID,MS_PLAYER_NUM,Tb_stage7_map_list[i]) < Stage7_player_num_max then
				free_map_id = Tb_stage7_map_list[i]
				break
			end
		end
	end
	return free_map_id
end
