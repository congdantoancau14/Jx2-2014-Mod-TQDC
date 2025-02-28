--filename:泉州福神.lua
--create date:2006-01-12
--author:yanjun
--describe:泉州福神脚本

--修改：1、村长20070123修改本脚本，增加华山竞技相关内容

Include("\\script\\online\\春节活动\\newyear_head.lua")	
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
--==========================公共变量定义区域=============================
	--筒起始ID为：590
	circle_start_id = 613
	--条起始ID为：599
	bamboo_start_id = 622
	--万起始ID为：608
	ten_kilo_start_id = 631
	--字起始ID为：617
	char_start_id = 647
	--所有麻将初始化
	mah_jong = {
		"Nh蕋 ng","Nh� ng","Tam ng","T� ng","Ng� ng","L鬰 ng","Th蕋 ng","B竧 ng","C鰑 ng",
		"M閠","Nh� 甶襲","Ba","B鑞","Ng� 甶襲","L鬰 甶襲","Th蕋 甶襲","B竧 甶襲","C鰑 甶襲",
		"Nh蕋 v筺","Nh� v筺","Tam v筺","T� v筺","Ng� v筺","L鬰 v筺","Th蕋 v筺","B竧 v筺","C鰑 v筺",
		"Йng phong","Nam phong","T﹜ phong","B綾 phong","H錸g trung","ph竧 t礽","B筩h ban"
	}
	mah_jong_prize_bag = {{650,"Con b礽 甧m cc"},{651,"Con b礽 2 甧m cc"},{652,"Con b礽 3 甧m cc"},{653,"Con b礽 4 甧m cc"}} --到 630
	--麻将和法定义
	mah_jong_suc_way = {
		--和牌名称-------------------张数---------检查函数-------------------------------奖励等级--------描述
		{"Чi T� H�",		14,	"big_4_hap_chk()",			1,	"Чi T� H� v� quy t綾 b礽: <color=red>Йng, Nam, B綾<color> t蕋 c� <color=red>3<color> t蕀, ngo礽 ra <color=red>b礽 Nh� �<color> 1 c苝, t鎛g c閚g 14 t蕀."},	--四个四张东南西北风+其它一对
		{"T� Kh綾 T�",		14,	"four_hide_4_chk()",		2,	"Quy t綾 c馻 T� kh綾 v� H遖 b礽: 4 ph� 4 t蕀 l� 1 c苝, t蕋 c� l� 14 t蕀."},			--四个四张+其它一对
		{"C鰑 Li猲 B秓 Жng",	14,	"from_1_to_9_chk()",		1,	"Quy t綾 C鰑 li猲 b秓 ng: уng hoa ng s綾 3 t蕀 l� 1, nh� tam t� ng� l鬰 th蕋 b竧 ng hoa s綾 l� 1, t鎛g c閚g 14 t蕀"},	--同色1112345678999+任意一张同色
		{"Th藀 Tham Y猽",		14,	"thrteen_1_or_9()",			1,	"Quy t綾 Th藀 tam y猽: M鏸 s綾 hoa (уng t�, 襲 t�, V筺 t�) 1 v� 9. 7 ch� tr猲 t蕀 b礽 (Йng phong, Nam phong, T﹜ phong, B綾 phong, H錸g trung, Ph竧 t礽, B筩h b秐) t鎛g c閚g 14 t蕀."},		--三中花色的幺九+东南西北中发白
		{"Li猲 Th蕋 цi",		14,	"connect_7_double()",		2,	"Quy t綾 Li猲 Th蕋 цi: D鵤 theo s� th� t� 7 c苝 li猲 ti誴 c馻 nh鱪g t蕀 ng hoa s綾. T鎛g c閚g c� 14 t蕀."},	--同色连起来的七对
		{"Thanh Th蕋 цi",		14,	"sam_color_7_double()",		3,	"Quy t綾 thanh long i: 7 c苝 c馻 nh鱪g t蕀 ng hoa s綾, t鎛g c閚g 14 t蕀"},
		{"Th蕋 Tinh B蕋 Kh竜",	14,	"seven_star()",				3,	"Quy t綾 Th蕋 tinh b蕋 kh竜: Chon t蕋 c� 14 t蕀 trong  nh蕋 nh ph秈 c� 7 t蕀 trong Йng, T﹜, Nam, B綾 th猰 3 t蕀 hoa s綾 v� ch鋘 nh鱪g t蕀 trong tr飊g c竎 s� 147, 258, 369�"},
		{"Th鑙 b蕋 o",		14,	"cannot_push()",			2, 	"Quy t綾 Th玦 B蕋 Фo D鵤 theo c竎 h譶h v� tr猲 t蕀 b礽 kh竎 nhau  x誴 th祅h 1 nh鉳 g錷: 123456789 b輓h, 245689 甶襲, b筩h 甶襲. T鎛g c閚g 14 t蕀."},
		{"Чi Tam Nguy猲",		14,	"big_3_yuan()",				3,	"Quy t綾 Чi Tam Nguy猲 (<color=red>quy t綾 b蕋 ch輓h<color>): Ch鋘 14 t蕀 trong c竎 lo筰 H錸g trung, Ph竧 t礽, B筩h b秐, c遪 l筰 <color=red>t飝 �<color>."},
		{"Thanh Y猽 C鰑",		14,	"all_1_or_9()",				3,	"Quy t綾 Thanh Y猽 C鰑: (<color=red>Quy t綾 b蕋 ch輓h<color>: ch鋘 14 t蕀 trong t蕋 c� c竎 lo筰."},
		{"Nh蕋 S綾 T� уng Thu薾",	14,	"one_color_four_seq()",		2,	"Quy t綾 Nh蕋 S綾 T� уng Thu薾 (<color=red>Quy t綾 b蕋 ch輓h<color>): Ch鋘 14 t蕀 theo c竎 s� th� t� (nh�: 1 v筺, 2 v筺, 3 v筺), c遪 l筰 ch鋘 <color=red>c飊g s綾 t飝 �<color>"},
		{"Nh蕋 S綾 T� Ti誸 Cao",	14,	"one_color_four_cont()",	2,	"Quy t綾 уng S綾 T� Ti誸 Cao (<color=red>quy t綾 b蕋 ch輓h<color>): Ch鋘 14 t蕀 theo c竎 s� th� t� t╪g d莕 (1 v筺, 2 v筺, 3 v筺, 4 v筺 ) v� 2 t蕀 <color=red>ng s綾 t飝 �<color>."},
		{"T� Nh蕋 S綾",		14,	"all_char()",				3,	"Quy t綾 Ch� Nh蕋 S綾 (<color=red>Quy t綾 b蕋 ch輓h<color>): ch鋘 t蕋 c� 14 t蕀 <color=red>t飝 �<color> trong c竎 ch� (Йng phong, T﹜ phong, Nam phong, B綾 phong, H錸g Trung, Ph竧 t礽, B筩h b秐)"},
		{"Thanh Nh蕋 S綾",		14,	"all_sam_color()",			4,	"Quy t綾 Thanh Nh蕋 S綾 (<color=red>quy t綾 b蕋 ch輓h<color>): Ch鋘 t飝 � 14 t蕀 trong nh鱪g t蕀 <color=red>ng s綾<color>, (уng t�, 襲 t�, V筺 t�)."},
		{"To祅 i",		14,	"all_big()",				4,	"Quy t綾 To祅 Чi (<color=red>quy t綾 b蕋 ch輓h<color>: Ch鋘 14 t蕀 t飝 � trong c竎 t蕀 <color=red>hoa s綾<color> ho芻 trong t� h頿 s� th� t� <color=red>7, 8, 9<color>"},
		{"To祅 trung",		14,	"all_normal()",				4,	"Quy t綾 to祅 trung (<color=red>quy t綾 b蕋 ch輓h<color>): Ch鋘 14 t蕀 t飝 � trong c竎 t蕀 <color=red>hoa s綾<color> ho芻 trong t� h頿 s� th� t� <color=red>4, 5, 6<color>"},
		{"To祅 ti觰",		14,	"all_small()",				4,	"Quy t綾 to祅 ti觰 (<color=red>quy t綾 b蕋 ch輓h<color>): Ch鋘 14 t蕀 t飝 � trong c竎 t蕀 <color=red>hoa s綾<color> c遪 l筰 trong t� h頿 s� th� t� <color=red>1, 2, 3<color>."},
		{"Thanh Long",		14,	"sam_color_dragon()",		3,	"Quy t綾 Thanh Long (<color=red>quy t綾 b蕋 ch輓h<color>): ch鋘 14 t蕀 b礽 c� s� th� t� ng nh蕋 s綾 t� 1-9, c遪 l筰 ch鋘 <color=red>hoa s綾 t飝 �<color>."},
		{"Tam Kh綾 T�",		14,	"three_hide_num_3()",		4,	"Quy t綾 Tam Kh綾 T� (<color=red>quy t綾 b蕋 ch輓h<color>): C� th� ch鋘 14 t蕀 trong nh鱪g c苝 tng ng c遪 l筰 l� <color=red>hoa s綾 t飝 �<color>."},
		{"Th� H�",		14, "just_14()",				5,	"Quy t綾 T� H� (<color=red>quy t綾 b蕋 ch輓h<color>): C� th� ch鋘 14 t蕀 <color=red>t飝 �<color>."},
	}
--==============================主逻辑区域===============================
function main(npc_index)
	SetTaskTemp(164,npc_index)				--写入福神的索引
	--加上等级判断
	if spring_2007_date_chk() == 1 then
		local selTab = {
					"Ta mu鑞 nh薾 h閜 qu� n╩ m韎./get_present",
					"襲 ki謓 nh薾 h閜 qu� n╩ m韎./know_detail",
					"Ta ph秈 n Hoa S琻 tham gia l� H閕 Hoa S琻./goto_huashan",
					"Ta mu鑞 t譵 hi觰 ho箃 ng Hoa S琻 C秐h K�/huashan_fight_inf",
					"Ta mu鑞 giao nh鱪g t蕀 m筩 chc thu 頲/mah_jong_collect_dia",
					"Ta mu鑞 t譵 hi觰 ho箃 ng thu th藀 m筩 chc/mah_jong_collect_inf",
					" t� Ph骳 Th莕!/nothing"
					}
		Say("Nh﹏ d辮 n╩ m韎 ta c� ch髏 qu� t苙g m鋓 ngi, ch骳 m鋓 ngi n╩ m韎 vui v�!",getn(selTab),selTab)
	else
		Say("Xu﹏  v�, m鋓 ngi h﹏ hoan ch祇 n, kh緋 m鋓 n琲 th藅 l� nh閚 nh辮!",0)
	end
end

function get_present()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20260120 then 	--春节活动还没开始，福神忘记带礼物了-_-b
		Say("H穣 an t﹎, m鋓 ngi u c� qu�!",0)
		return 0		
	end
	if nDate > 20260205 then	--春节活动结束咯，没礼物发咯，福神要回家咯
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
	if GetGlbValue(GLB_PRESENT_NUM_QZ) == 0 then	--礼物发完了
		local strSex = ""
		if GetSex() == 1 then
			strSex = "Thi誹 hi謕"
		elseif GetSex() == 2 then
			strSex = "C� nng"
		else
			strSex = "Thi誹 hi謕/N� hi謕"
		end
		Say("H閜 qu� n╩ m韎  b� l蕐 h誸 r錳,"..strSex.."ьi l莕 sau nh�!",0)
		return 0
	end
	if AddItem(2,1,213,1) == 1 then
		WriteLog("[Ho箃 ng m颽 xu﹏ Ph骳 Th莕]:"..GetName().."Nh薾 頲 1 h閜 qu� n╩ m韎 t� Ph骳 Th莕 � Tuy襫 Ch﹗")
		SetTask(TASK_GOT_PRESENT,GetCurDate())
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 h閜 qu� n╩ m韎!")
		local present_left = GetGlbValue(GLB_PRESENT_NUM_QZ) - 1
		if present_left < 0 then
			SetGlbValue(GLB_PRESENT_NUM_QZ,0)
		end
		SetGlbValue(GLB_PRESENT_NUM_QZ,present_left)
		if present_left == 0 then	--没有礼物剩余了，快发活动结束的公告吧
			AddGlobalNews("H閜 qu� n╩ m韎 � Tuy襫 Ch﹗  b� l蕐 h誸, ngi ch琲 n祇 h玬 nay ch璦 nh薾 頲 qu�, h穣 i c� h閕 l莕 sau.")
			Msg2SubWorld("H閜 qu� n╩ m韎 � Tuy襫 Ch﹗  b� l蕐 h誸, ngi ch琲 n祇 h玬 nay ch璦 nh薾 頲 qu�, h穣 i c� h閕 l莕 sau.")
			return 1
		end
		if mod(present_left,10) == 0 then	--只公告10次
			Msg2SubWorld("Tuy襫 Ch﹗ v蒼 c遪"..present_left.." ph莕 qu� n╩ m韎 i ngi ch琲 n nh薾")
		end
	end
end

function know_detail()
	Say("T� 20/01 n 05/02, ch� c莕 ngi ch琲 t� c蕄 10 tr� l猲, m鏸 ng祔 theo gi� quy nh n ch� ta nh薾 h閜 qu� n╩ m韎.",0)
end
--==========================华山竞技相关==========================
--***************************传送到华山***************************
function goto_huashan()
	if GetPlayerGenre() == 0 then
		Talk(1,"","Ch璦 gia nh藀 m玭 ph竔 kh玭g th� tham gia ho箃 ng Hoa S琻 C秐h K�!")
		return
	else
		if Zgc_pub_today_sec_num_rtn() > 57600 then
			local time_distance =  GetTime() - GetTask(991)
			if time_distance < 600 then
				Talk(1,"","V祇 Hoa S琻 c竎h nhau 10 ph髏, ngi c遪"..Zgc_pub_time_sec_change(time_distance,0).." m韎 c� th� v祇")
				return
			end
		end
		NewWorld(969,1633,3263)
		SetTask(991,GetTime())
	end	
end
--*************************华山活动详情***************************
function huashan_fight_inf()
	
end
function nothing()

end
--============================麻将收集相关函数==============================
--**************************麻将收集活动对话****************************
function mah_jong_collect_dia()
	local mah_jong_seq_ran = spring_2007_mahj_suc_seq_rtn()			--获得当前胡法的随机数
	Msg2Player(mah_jong_seq_ran)		--test
	local mah_jong_collect_dia_main = ""
	local mah_jong_collect_dia = {}
	if mah_jong_seq_ran ~= 0 and mah_jong_seq_ran <=(getn(mah_jong_suc_way) -1) then
		mah_jong_collect_dia_main = "Th阨 gian thu th藀 m筩 chc:"
		mah_jong_collect_dia[1] = mah_jong_suc_way[mah_jong_seq_ran][1].."/#mah_jong_collect_prize("..mah_jong_seq_ran..")" 
		mah_jong_collect_dia[2] = "Ta mu鑞 t譵 hi觰"..mah_jong_suc_way[mah_jong_seq_ran][1].."quy t綾/#mah_jong_suc_inf("..mah_jong_seq_ran..")"
		mah_jong_collect_dia[3] = "Th� H�/#mah_jong_collect_prize(20)"
		mah_jong_collect_dia[4] = "T譵 hi觰 quy t綾 t� h�/#mah_jong_suc_inf(20)"
		mah_jong_collect_dia[5] = "Ta ch� n xem th�/end_dialog"
	else
		mah_jong_collect_dia_main = "Th阨 gian thu th藀 m筩 chc:"
		mah_jong_collect_dia[1] = "Th� H�/#mah_jong_collect_prize(20)"
		mah_jong_collect_dia[2] = "T譵 hi觰 quy t綾 t� h�/#mah_jong_suc_inf(20)"
		mah_jong_collect_dia[3] = "Ta ch� n xem th�/end_dialog"		
	end
	Say(mah_jong_collect_dia_main,getn(mah_jong_collect_dia),mah_jong_collect_dia)
end
--**************************麻将收集活动详情****************************
function mah_jong_collect_inf()
	
end
--***************************上交麻将奖励函数***************************
function mah_jong_collect_prize(suc_way)
	--次数限制检测
	if suc_way == 20 then
		if spring_2007_mahj_num_chk(2) == 0 then			--屁胡次数检查
			return
		end
	else
		if spring_2007_mahj_num_chk(1) == 0 then			--大胡次数检查
			return
		end
	end
	--麻将胡法检查
	if dostring(mah_jong_suc_way[suc_way][3]) == 0 then		
		return
	end
	--背包空间和负重检测
	if suc_way ~= 20 then
		if Zgc_pub_goods_add_chk(1,100) ~= 1 then			
			return
		end
	end
	--麻将删除检查
	if mah_jong_del_all(14) ~= 0 then						
		return
	end
	--奖励给予
	if suc_way == 20 then
		local exp_num = GetLevel()
		exp_num = exp_num * exp_num * 250
		ModifyExp(exp_num)
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..exp_num.." 甶觤 kinh nghi謒!")
	else
		local add_flag = AddItem(2,0,mah_jong_prize_bag[mah_jong_collect_prize(mah_jong_suc_way[suc_way][4])][1],1)
		if add_flag == 1 then
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..mah_jong_prize_bag[mah_jong_collect_prize(mah_jong_suc_way[suc_way][4])][2].."!")
			if mah_jong_suc_way[suc_way][4] == 1 or mah_jong_suc_way[suc_way][4] == 2 then
				Msg2SubWorld("Ngi ch琲:"..GetName().."S� m筩 chc l莕 n祔 thu th藀 頲"..mah_jong_suc_way[suc_way][1].."! Л頲 r錳"..mah_jong_prize_bag[mah_jong_collect_prize(mah_jong_suc_way[suc_way][4])][2].."!")
			end
		else
			WriteLog("Ho箃 ng M筩 Chc, Ngi ch琲:"..GetName().."Nh薾 ph莕 thng th蕋 b筰, t筰:"..add_flag)
		end
	end
end
--****************************麻将胡法详情******************************
function mah_jong_suc_inf(mahj_suc_diff)
	Talk(1,"end_dialog","<color=green>Ph骳 Th莕<color>:"..mah_jong_suc_way[mahj_suc_diff][5])
end
--******************************大四喜**********************************
function big_4_hap_chk()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	end
	if (GetItemCount(2,0,char_start_id) * GetItemCount(2,0,(char_start_id+1)) * GetItemCount(2,0,(char_start_id+2)) * GetItemCount(2,0,(char_start_id+3))) ~= 81 then
		Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
		return 0
	else
		local chk_flag = 0 
		for i = circle_start_id,(char_start_id - 1) do
			if GetItemCount(2,0,i) ~= 0 and GetItemCount(2,0,i) == 2 then
				chk_flag = 1
			end
		end
		for i =(char_start_id + 4),(char_start_id + 6) do
			if GetItemCount(2,0,i) ~= 0 and GetItemCount(2,0,i) == 2 then
				chk_flag = 1
			end
		end
	end
	if chk_flag == 0 then
		Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
		return 0
	end
	return 1
end
--******************************四暗刻***********************************
function four_hide_4_chk()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	end
	local four_chk = 0
	local double_chk = 0
	for i = circle_start_id,(char_start_id + 6) do
		if GetItemCount(2,0,i) == 3 then
			four_chk =four_chk + 1
		elseif GetItemCount(2,0,i) == 2 then 
			double_chk = double_chk + 1
		end
	end
	if four_chk == 4 and double_chk == 1 then
		return 1
	else
		Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
		return 0
	end
end
--******************************九莲宝灯*********************************
function from_1_to_9_chk()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	end
	local mah_jong_color = mah_jong_same_color_chk()
	if mah_jong_color ~= 1 or mah_jong_color ~= 2 or mah_jong_color ~= 3 then
		local chk_flag = 1
		if GetItemCount(2,0,circle_start_id + ( (mah_jong_color-1) * 9)) < 3 and GetItemCount(2,0,circle_start_id + ( (mah_jong_color * 9) - 1)) < 3 then
			Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
			return 0
		end
		for i = (circle_start_id + 1 +( (mah_jong_color-1) * 9)) ,(circle_start_id + ( (mah_jong_color * 9) - 2)) do
			if GetItemCount(2,0,i) == 0 then
				Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
				return 0
			end
		end
	else
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 c� con b礽 <color=red>c飊g m祏<color>!")
		return 0	
	end
	return 1
end
--******************************连七对***********************************
function connect_7_double()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	end
	local mah_jong_color = mah_jong_same_color_chk()
	if mah_jong_color ~= 1 or mah_jong_color ~= 2 or mah_jong_color ~= 3 then
		--3\4\5\6\7必须成对。
		for i = (circle_start_id + 2 +( (mah_jong_color-1) * 9)) ,(circle_start_id + ( (mah_jong_color * 9) - 3)) do
			if GetItemCount(2,0,i) ~= 2 then
				Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
				return 0
			end
		end
		if (GetItemCount(2,0,(circle_start_id +((mah_jong_color-1) * 9))) == 2 and GetItemCount(2,0,(circle_start_id + 1 +((mah_jong_color-1) * 9))) == 2)
		or (GetItemCount(2,0,(circle_start_id + ((mah_jong_color * 9) - 1))) == 2 and GetItemCount(2,0,(circle_start_id + ((mah_jong_color * 9) - 2))) == 2)
		or (GetItemCount(2,0,(circle_start_id + 1 +((mah_jong_color-1) * 9))) == 2 and GetItemCount(2,0,(circle_start_id + ((mah_jong_color * 9) - 1))) == 2)
		then
			return 1
		else
			Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
			return 0
		end
	else
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 c� con b礽 <color=red>c飊g m祏<color>!")
		return 0	
	end
end
--******************************13幺*************************************
function thrteen_1_or_9()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	end
	local maho_jong_13_1_or_9 = {circle_start_id,(bamboo_start_id - 1),bamboo_start_id,ten_kilo_start_id,(ten_kilo_start_id - 1),}
	local double_chk = 0
	for i = 1,getn(maho_jong_13_1_or_9) do
		if GetItemCount(2,0,maho_jong_13_1_or_9[i]) == 0 then
			if GetItemCount(2,0,i) == 0 then
				Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
				return 0
			elseif 	GetItemCount(2,0,maho_jong_13_1_or_9[i]) == 2 then
				double_chk = 1
			end
		end
	end
	for i = char_start_id , (char_start_id + 6) do
		if GetItemCount(2,0,i) == 0 then
			Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
			return 0
		elseif 	GetItemCount(2,0,i) == 2 then
			double_chk = 1
		end
	end
	if double_chk ~= 1 then
		Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
		return 0		
	else
		return 1
	end
end
--******************************大三元***********************************
function big_3_yuan()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	end
	for i = (char_start_id + 4),(char_start_id + 6) do
		if GetItemCount(2,0,i) < 3 then
			Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
			return 0
		end
	end
	return 1
end
--*******************************七星不靠********************************
function seven_star()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	end
	for i = char_start_id , (char_start_id + 6) do
		if GetItemCount(2,0,i) ~= 1 then
			Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
			return 0
		end
	end
	local maho_jong_id_start = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	local chk_flag = 0
	local chk_diff_flag = 0
	for i = 1,3 do
		for j = maho_jong_id_start[i],(maho_jong_id_start[i] + 2) do
			if GetItemCount(2,0,j) == 1 and GetItemCount(2,0,(j + 3)) == 1 and GetItemCount(2,0,(j + 6)) == 1then
				chk_flag = (chk_flag + j)
				if j ~= 2 then
					chk_diff_flag = 1
				end
			end
		end
	end
	if chk_flag ~= 6 or chk_diff_flag ~= 1 then
		Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
		return 0
	else
		return 1
	end
end
--********************************推不倒*********************************
function cannot_push()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	end
	local cannot_push_id = {circle_start_id,(circle_start_id+1),(circle_start_id+2),(circle_start_id+3),(circle_start_id+4),(circle_start_id+7),(circle_start_id+8),(bamboo_start_id+1),(bamboo_start_id+3),(bamboo_start_id+4),(bamboo_start_id+5),(bamboo_start_id+7),(bamboo_start_id+8),(char_start_id+6)}
	for i = 1, getn(cannot_push_id) do
		if GetItemCount(2,0,cannot_push_id[i]) ~= 1 then
			Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
			return 0
		end
	end
	return 1
end
--********************************清七对*********************************
function sam_color_7_double()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	end
	local maho_jong_color_id = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	local maho_jong_color = mah_jong_same_color_chk()
	if maho_jong_color == 0 or maho_jong_color == 4 then
		Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
		return 0		
	end
	local double_num = 0
	for i = maho_jong_color_id[maho_jong_color],(maho_jong_color_id[maho_jong_color] + 6) do
		if GetItemCount(2,0,i) == 2 then
			double_num = double_num + 1
		end
	end
	if double_num ~= 7 then
		Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
		return 0
	else
		return 1
	end
end
--********************************清幺九*********************************
function all_1_or_9()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	end	
	local num_1_or_9 = 0
	local id_1_or_9 = {circle_start_id,(bamboo_start_id-1),bamboo_start_id,(ten_kilo_start_id-1),ten_kilo_start_id,(char_start_id-1)}
	for i = 1,getn(id_1_or_9) do
		num_1_or_9 = GetItemCount(2,0,i) + num_1_or_9
	end
	if num_1_or_9 ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
		return 0		
	else
		return 1
	end
end
--*****************************一色四同顺********************************
function one_color_four_seq()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	end
	local maho_jong_id_start = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	local chk_flag = 0
	local mah_jong_color = mah_jong_same_color_chk()
	if mah_jong_color == 0 or mah_jong_color == 4 then
		Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
		return 0	
	else
		for i = maho_jong_id_start[mah_jong_color],(maho_jong_id_start[mah_jong_color] + 8) do
			if GetItemCount(2,0,i) >= 4 and GetItemCount(2,0,(i+1)) >= 4 and GetItemCount(2,0,(i+2)) >= 4 then
				chk_flag = 1
				break
			end
		end
	end
	if chk_flag == 1 then
		return 1
	else
		Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
		return 0	
	end
end
--*****************************一色四节高********************************
function one_color_four_cont()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	end
	local maho_jong_id_start = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	local chk_flag = 0
	local mah_jong_color = mah_jong_same_color_chk()
	if mah_jong_color == 0 or mah_jong_color == 4 then
		Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
		return 0	
	else
		for i = maho_jong_id_start[mah_jong_color],(maho_jong_id_start[mah_jong_color] + 8) do
			if GetItemCount(2,0,i) >= 3 and GetItemCount(2,0,(i+1)) >= 3 and GetItemCount(2,0,(i+2)) >= 3 and GetItemCount(2,0,(i+3)) >= 3 then
				chk_flag = 1
				break
			end
		end
	end
	if chk_flag == 1 then
		return 1
	else
		Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
		return 0	
	end
end
--*******************************字一色**********************************
function all_char()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	end
	if mah_jong_same_color_chk() ~= 4 then
		Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
		return 0
	end
	return 1
end
--*******************************字一色**********************************
function all_sam_color()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	end
	if mah_jong_same_color_chk() == 0 or mah_jong_same_color_chk() == 4 then
		Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
		return 0
	end
	return 1
end
--*******************************全大************************************
function all_big()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	end
	local fit_num = 0 
	local color_start_id = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	for i = 1,3 do
		for j = 4,6 do
			fit_num = fit_num + GetItemCount(2,0,(color_start_id[i]+j))
		end
	end
	if fit_num ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
		return 0
	end
	return 1
end
--*******************************全中************************************
function all_normal()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	end
	local fit_num = 0 
	local color_start_id = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	for i = 1,3 do
		for j = 3,5 do
			fit_num = fit_num + GetItemCount(2,0,(color_start_id[i]+j))
		end
	end
	if fit_num ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
		return 0
	end
	return 1
end
--*******************************全小************************************
function all_small()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	end
	local fit_num = 0 
	local color_start_id = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	for i = 1,3 do
		for j = 0,2 do
			fit_num = fit_num + GetItemCount(2,0,(color_start_id[i]+j))
		end
	end
	if fit_num ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
		return 0
	end
	return 1
end
--*******************************清龙************************************
function sam_color_dragon()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	end
	local color_start_id = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	local chk_flag = 0
	for i = 1, 3 do
		if GetItemCount(2,0,color_start_id[i]) ~= 0 and GetItemCount(2,0,(color_start_id[i] + 1)) ~= 0 and 
		GetItemCount(2,0,color_start_id[i + 2]) ~= 0 and GetItemCount(2,0,(color_start_id[i] + 3)) ~= 0 and 
		GetItemCount(2,0,color_start_id[i + 4]) ~= 0 and GetItemCount(2,0,(color_start_id[i] + 5)) ~= 0 and 
		GetItemCount(2,0,color_start_id[i + 6]) ~= 0 and GetItemCount(2,0,(color_start_id[i] + 7)) ~= 0 and 
		GetItemCount(2,0,color_start_id[i + 8]) ~= 0 then
			return 1
		end	
	end
	Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
	return 0
end
--******************************三暗刻***********************************
function three_hide_num_3()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	end
	local chk_flag = 0
	for i = 0,33 do 
		if GetItemCount(2,0,(circle_start_id+i)) >= 3 then
			chk_flag = chk_flag + 1
		end
	end
	if chk_flag >= 3 then
		return 1
	else
		Talk(1,"end_dialog","X竎 nh薾 trongh祅h trang c馻 b筺 c� con b礽 ph� h頿!")
		return 0
	end
end
--********************************屁胡***********************************
function just_14()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c馻 b筺 <color=red>ch� c�<color> <color=red>14<color> con b礽!")
		return 0
	else
		return 1
	end
end
--===============================公共函数================================
--****************************麻将纯色检查*******************************
--返回玩家身上牌是否是纯色：0为：不是纯色、1为筒、2为条、3为万、4为字
function mah_jong_same_color_chk()
	local mah_jong_seq = 0		--检测到第一张牌的ID
	for i = circle_start_id,(char_start_id + 6) do
		if GetItemCount(2,0,i) ~= 0 and mah_jong_seq == 0 then
			mah_jong_seq = (floor((i - circle_start_id) / 9) + 1)
		elseif GetItemCount(2,0,i) ~= 0 and mah_jong_seq ~= 0 then
			if (floor((i-circle_start_id)/9) + 1) ~= mah_jong_seq then
				mah_jong_seq = 0
				break
			end
		end
	end
	return mah_jong_seq
end
--***************************麻将数量统计函数****************************
function mah_jong_cout()
	local num_trn = 0
	for i = circle_start_id,(char_start_id + 6) do
		num_trn = GetItemCount(2,0,i) + num_trn
	end
	return num_trn
end
--************************麻将全部删除函数******************************
function mah_jong_del_all(del_num)
	for i = circle_start_id,(char_start_id + 6) do
		local mah_num = GetItemCount(2,0,i)
		if mah_num ~= 0 then
			if DelItem(2,0,i,mah_num) == 1 then
				del_num = del_num - mah_num
			end
		end
	end
	return del_num
end
