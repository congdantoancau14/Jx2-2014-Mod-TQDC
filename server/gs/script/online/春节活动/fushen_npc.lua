
--修改：1、村长20070123修改本脚本，增加华山竞技相关内容
Include("\\script\\online\\春节活动\\newyear_head.lua")	
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
--==========================公共变量定义区域=============================
	huashan_in_num_per_minit_max = 10				--每分钟可进入数量为10人
	huashan_in_minit_seq = 0
	huashan_in_num_per_minit = 0
--==============================主逻辑区域===============================
function fushen_main(npc_index)
	SetTaskTemp(164,npc_index)				--写入福神的索引
	--加上等级判断
	--if spring_2007_date_chk() == 1 then
		local selTab = {
					"Ta mu鑞 nh薾 h閜 qu� n╩ m韎./get_present",
					"Ta ph秈 n Hoa S琻 tham gia l� H閕 Hoa S琻./goto_huashan",
					"S緋 x誴 th阨 gian ho箃 ng n╩ m韎/time_plan",
					"T譵 hi觰 n閕 dung ho箃 ng n╩ m韎/spring_info_choice",
					"Nh薾 m閠 quy觧 Ch� nam ho箃 ng xu﹏/spr_book_add",
					" t� Ph骳 Th莕!/nothing"
					}
		Say("Nh﹏ d辮 n╩ m韎 ta c� ch髏 qu� t苙g m鋓 ngi, ch骳 m鋓 ngi n╩ m韎 vui v�!",getn(selTab),selTab)
	-- else
		-- Say("Xu﹏  v�, m鋓 ngi h﹏ hoan ch祇 n, kh緋 m鋓 n琲 th藅 l� nh閚 nh辮!",0)
	-- end
end

function get_present()
	if gf_JudgeRoomWeight(1,10) ~= 1 then
		Talk(1,"","Kho秐g tr鑞g trong h祅h trang kh玭g !");
		return 0;
	end;
	local nDate = tonumber(date("%Y%m%d"))
	if Check_Date() == -1 then 	--春节活动还没开始
		Say("H穣 an t﹎, m鋓 ngi u c� qu�!",0)
		return 0		
	end
	if Check_Date() == 1 then	--春节活动结束
		Say("T誸  qua, h閜 qu� n╩ m韎  b� ngi ch琲 l蕐 h誸 r錳. Th藅 竬 n竬, n╩ sau ta nh蕋 nh mang nhi襲 qu� h琻!",0)
		return 0
	end
	if GetLevel() < 10 then
		Say("Ngi ch璦 t n c蕄 10, kh玭g th� nh薾 h閜 qu� n╩ m韎!",0)
		return 0
	end
	if GetTask(TASK_GOT_PRESENT) ~= GetCurDate() then	--新的一天，已领取礼物标记清0
		SetTask(TASK_GOT_PRESENT,0)
	end
	if GetTask(TASK_GOT_PRESENT) ~= 0 then	--如果今天已经领取过新年礼物
		Say("H玬 nay ngi  nh薾 qu�, ng祔 mai quay l筰 nh�!",0)
		return 0
	end
	local nHour = GetLocalTime()
	if GetGlbValue(GLB_PRESENT_NUM) == 0 then	--礼物发完了
		local strSex = gf_GetPlayerSexName();
		Say("H閜 qu� n╩ m韎  b� l蕐 h誸 r錳,"..strSex.."Th阨 gian ph竧 qu�: <color=yellow>10, 14 v� 20 gi�<color>. S� lng qu� c� h筺, nh� n s韒 nh�!",0)
		return 0
	end
	if AddItem(2,0,628,1) == 1 then
		WriteLog("[Ho箃 ng m颽 xu﹏ Ph骳 Th莕]:"..GetName().."T筰"..g_sPlace.."Nh薾 頲 qu� may m緉 c馻 Ph骳 Th莕")
		SetTask(TASK_GOT_PRESENT,GetCurDate())
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 h閜 qu� n╩ m韎!")
		local present_left = GetGlbValue(GLB_PRESENT_NUM) - 1
		if present_left < 0 then
			SetGlbValue(GLB_PRESENT_NUM,0)
		end
		SetGlbValue(GLB_PRESENT_NUM,present_left)
		if present_left == 0 then	--没有礼物剩余了，快发活动结束的公告吧
			Msg2Global("Ho箃 ng"..g_sPlace.."Th藅 ng ti誧, Ph骳 Th莕  ph竧 h誸 qu�. L莕 sau nh� n s韒 nh�!")
			return 1
		end
		if mod(present_left,10) == 0 then	--只公告10次
			Msg2Global(g_sPlace.." c遪 "..present_left.." ph莕 qu� n╩ m韎 i ngi ch琲 n nh薾")
		end
	end
end

function know_detail()
	Say("T� ng祔 9 n ng祔 25 th竛g 2, m鏸 ng祔 (<color=yellow>10 gi�, 14 gi� v� 20 gi�<color>) n ch� ta nh薾 qu� may m緉!",0)
end
--==========================华山竞技相关==========================
--***************************传送到华山***************************
function goto_huashan()
	if GetPlayerRoute() == 0 then
		Talk(1,"","Ch璦 gia nh藀 m玭 ph竔 kh玭g th� tham gia ho箃 ng Hoa S琻 C秐h K�!")
		return
	else
		local time_distance = 64800 - Zgc_pub_today_sec_num_rtn()
		if time_distance < 0 then
			local player_in_time_distance =  GetTime() - GetTask(991)
			if player_in_time_distance < 600 then
				Talk(1,"","V祇 Hoa S琻 c竎h nhau 10 ph髏, ngi c遪"..Zgc_pub_time_sec_change((600-player_in_time_distance),0).." m韎 c� th� v祇")
				return
			end
		else
			Talk(1,"","Ho箃 ng Hoa S琻 ch璦 m�, xin ch�"..Zgc_pub_time_sec_change(time_distance,0).."_c� th� v祇!")
			return
		end
		local minit_seq_now = floor(GetTime()/60)
		if minit_seq_now < huashan_in_minit_seq or (huashan_in_minit_seq == minit_seq_now and huashan_in_num_per_minit > huashan_in_num_per_minit_max) then
			Talk(1,"","S� ngi tham gia  , xin i"..(((minit_seq_now+1)*60) - GetTime()).." gi﹜!")
			return
		elseif huashan_in_minit_seq > minit_seq_now then
			huashan_in_num_per_minit = 0
		end
		huashan_in_minit_seq = minit_seq_now
		huashan_in_num_per_minit = huashan_in_num_per_minit + 1
		SetDeathPunish(0)
		Msg2Player("B筺  i sang tr筺g th竔 PK!")
		SetFightState(1)
		NewWorld(969,1633,3263)
	end	
end
--*************************华山活动详情***************************
function huashan_fight_inf()
	
end
function nothing()

end
--************************活动说明******************************
function time_plan()

	local str_talk = "Cung h� ph竧 t礽! Th阨 gian ho箃 ng t﹏ ni猲 t� <color=yellow>09-02-2007<color> n <color=yellow>25-02<color>, c� th� nh� sau: \n 10:00: Ph骳 Th莕 ph竧 h錸g bao \n 12:00: m骯 l﹏ \n 14:00: Ph骳 Th莕 ph竧 h錸g bao \n 16:00: M骯 l﹏ \n 18:00: 箃 b秓 rng \n 20h:00: Ph骳 Th莕 ph竧 h錸g bao \n 22:00: M骯 l﹏"

	 Talk(1,"",str_talk)

end

function spring_info_choice()

	local selTab = {
			"Online t苙g qu�/#spring_info(1)",
			"Ph骳 Th莕 ph竧 h錸g bao/#spring_info(2)",
			"M骯 l﹏/#spring_info(3)",
			"箃 b秓 rng/#spring_info(4)",
			"Heo v祅g 甧m n c竧 tng/#spring_info(5)",
			"Ch骳 t誸/#spring_info(6)",
			"N╩ m韎 m芻  m韎./#spring_info(7)",
			"Ni猲 th� l祄 th� ci/#spring_info(8)",
			"R阨 kh醝/nothing"
			}
	
	Say("N╩ m韎 n r錳! M鋓 ngi chu萵 b� th藅 nhi襲 qu�, nh蕄 v祇 t猲 ho箃 ng tng 鴑g  xem chi ti誸.",getn(selTab),selTab);

end


function spring_info(nType)

local selTab = {
	{
	"    Ngi ch琲 c蕄 10 tr� l猲, m鏸 ng祔 c� th� n g苝 L� Quan � Bi謓 Kinh  nh薾 t骾 Ti觰 ph骳 Kim Tr�. M鏸 ng祔 ch� nh薾 頲 1 l莕.",
		},
	
	{
	"    Ngi ch琲 t� c蕄 10 tr� l猲 v祇 l骳 10:00, 14:00, 20:00 n Ph骳 Th莕  nh薾 Ti觰 H錸g Bao. M鏸 ng祔 Ph骳 Th莕 ch� ph竧 100 c竔, 璾 ti猲 cho nh鱪g ngi n trc (m鏸 ng祔 ch� nh薾 頲 1 l莕 )",
		},
		
	{
	"    Ho箃 ng m骯 l﹏ s� xu蕋 hi謓 b猲 ngo礽 � 3 th祅h th� ch輓h. Ngi ch琲 n誹 nh b筰 頲 Ni猲 Th� s� g鋓 頲 20 ti觰 Ni猲 Th� kh竎, nh蕄 v祇 ti觰 Ni猲 Th� s� nh薾 頲 Чi H錸g Bao. (Ch� d祅h cho ngi ch琲 c蕄 10 tr� l猲)",
		},
		
	{
	"    M鏸 ng祔 t� 18:00 tr猲 nh Hoa S琻 s� xu蕋 hi謓 m閠 b秓 rng. Ngi ch琲 ( gia nh藀 m玭 ph竔) n g苝 Ph骳 Th莕, s� 頲 Ph骳 Th莕 a v祇 Hoa S琻 ho芻 c� th� mua Hoa S琻 Th莕 ph�. Khi v祇 Hoa S琻 tr薾 a, b筺 s� t� ng chuy觧 sang tr筺g th竔 PK v�  s竧. Trong th阨 gian 10 ph髏 b筺 d飊g h誸 kh� n╪g h� i phng  畂箃 b秓 rng.",
		},
		
	{
	"    Kim Tr� mang n may m緉: Trong ph莕 thng ho箃 ng t﹏ ni猲, may m緉 b筺 c騨g c� th� nh薾 頲 Tr� b秓 b秓. S� d鬾g b筺 s� g鋓 頲 m閠 ch� heo xinh x緉 v� m閠 quy觧  B秓 觧.",
		},
	
	{
	"    Ch骳 t誸: Hai ngi ch琲 ng trong m閠 ph筸 vi nh蕋 nh. Ngi c蕄 nh� cung k輓h ch骳 t誸 ngi c蕄 cao th� s� nh薾 頲 m閠 trong 3 ph莕 thng sau: 觤 s鴆 kh醗, 甶觤 kinh nghi謒 ho芻 t� 10 n 20 甶觤 danh v鋘g. Ph莕 thng n祔 ph� thu閏 v祇 ng c蕄 c馻 2 b猲. M鏸 ng祔 ngi ch琲 c蕄 nh� c� th� ch骳 t誸 ngi c蕄 cao t鑙 產 3 l莕, nh璶g ngi c蕄 cao th� kh玭g b� gi韎 h筺 b雐 s� l莕 頲 ch骳 t誸. (Ho箃 ng n祔 ch� d祅h cho ngi ch琲 t� c蕄 10 tr� l猲)",
		},
		
	{
	"    Khi m� qu� Kim Tr� ( Kim Tr� ti觰 ph骳, Kim Tr� ti觰 h錸g bao, Kim Tr� i h錸g bao), s� nh薾 頲 ph莕 thng trang ph鬰 Ngo筰 trang tng 鴑g.",
		},
	{
	"    Khi m� qu� Kim Tr� (Kim Tr� ti觰 ph骳, Kim Tr� ti觰 h錸g bao, Kim Tr� i h錸g bao) s� c� c� may nh薾 頲 ni猲 th�. [Ch� �: ni猲 th� ch� s� d鬾g trong 1 ng祔 ( k� t� khi ng錳 l猲). H誸 th阨 gian ni猲 th� s� bi課 m蕋!]",
		},

	};

	Say("N╩ m韎  n, c� r蕋 nhi襲 ho箃 ng  nh薾 qu�. Nh蕄 chu閠 v祇 t猲 ho箃 ng  xem chi ti誧! \n"..selTab[nType][1],2,	"tr� l筰/spring_info_choice",
	"R阨 kh醝/nothing");

end
function spr_book_add()
	AddItem(2,0,614,1)
end
