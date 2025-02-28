--文件名称：2008端午节头文件
--文件功能：端午节的相关公共变量和函数
--功能策划：00
--功能开发：村长
--开发时间：2008-05-14
--修改记录：
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\lib\\lingshi_head.lua")

-----------------公共变量区
--服务器区分:1、为收费服，2、为免费服
Sever_diff = 2
--活动开启、关闭时间
dragon_boat_08_start_time = 2008060423
dragon_boat_08_end_time = 2048061001
--粽子使用限制相关的信息
TaskID_aixiang_use_date_seq = 1294
TaskID_aixiang_use_num = 1295
Aixiang_use_num_day = 5
TaskID_baiyu_use_num = 1296
Baiyu_use_num_max = 15
TaskID_yupin_use_num = 1297
Yupin_use_num_max = 5
--制作数量的临时变量
chg_mertiral_TaskTempID = 168
TaskID_suit_prize = 1400 --外装奖励领取情况
TaskID_exp_get_date_seq = 1298 --奖励领取日期序数
TaskID_exp_get_times = 1299 --奖励领取次数
Tb_zongzi_use_num = {
	{"B竛h 輙 B筩h Ng鋍",TaskID_baiyu_use_num,Baiyu_use_num_max},
	{"B竛h 輙 Ng� Ph萴",TaskID_yupin_use_num,Yupin_use_num_max},
}
--艾香粽子信息（收费和免费不同）
Tb_zongzi_08_aixiang = {"50 v筺 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒",	"Nh薾 頲 100000 甶觤 kinh nghi謒",}
Tb_zongzi_aixong_exp_num = {500000,100000}
Tb_zongzi_08_yupin = {"фi 1 Vi猰 Ho祅g Thi誸 H錸 ho芻 12 vi猲 Linh th筩h c蕄 7","фi 1 Vi猰 Ho祅g Thi誸 H錸 ho芻 12 vi猲 Linh th筩h c蕄 7 ho芻 B竎h t鑓 h綾 b筩h m�"}
--粽子信息
Tb_zongzi_08 = {
	--名称-ID最后一位-合成成功率-外装几率-合成材料-粽子描述-对应奖励描述-使用对应函数--是否直接使用--使用冷却时间
	{"B竛h 輙 g筼 th琺",3359,100,	5,		{{3370,1,"u "},	{3371,1,"G筼 tr緉g"},			{3369,1,"L� g鉯 b竛h"},},"Trong v遪g 3 ph髏 ngo筰 c玭g t╪g 5%, s竧 thng t╪g 30",						"zongzi_xiangmi",	1,	(3*60*18)},
	{"b竛h 輙 ng秈 hng",1123,100,	10,	{{3359,1,"B竛h 輙 g筼 th琺"},	{3372,1,"L� ng秈"},			{3369,1,"L� g鉯 b竛h"},},"Ph莕 thng 10 v筺*b譶h phng ng c蕄/6400 甶觤 kinh nghi謒",				"zongzi_aixiang",0,	0},
	{"B竛h 輙 h箃 d�",3360,100,	20,	{{1123,1,"b竛h 輙 ng秈 hng"},	{3374,1,"H箃 d�"},			{3369,1,"L� g鉯 b竛h"},},"Ng蓇 nhi猲 nh薾 頲 1 v� th竚 hi觤 T﹜ V鵦 (4-6 秈)",	"zongzi_lizi",			0,	0},
	{"B竛h 輙 ng� hng",3361,100,	30,	{{3360,1,"B竛h 輙 h箃 d�"},	{3373,1,"J╩ b玭g"},			{3369,1,"L� g鉯 b竛h"},},"Trong v遪g 10 ph髏, sinh l鵦 t╪g 30%",							"zongzi_wuxiang",	1,	(10*60*18)},
	{"B竛h 輙 Ph� Th髖",3362,50,		50,	{{3361,1,"B竛h 輙 ng� hng"},	{3365,1,"Ph� Th髖"},					{3369,1,"L� g鉯 b竛h"},},"Trong v遪g 3 ph髏, t蕋 c� n╪g l鵦 t╪g 20%",					"zongzi_feicui",		1,	(3*60*18)},
	{"B竛h 輙 Ph� Th髖",3362,100,	100,	{{3361,1,"B竛h 輙 ng� hng"},	{3365,3,"Ph� Th髖"},					{3369,1,"L� g鉯 b竛h"},},"Trong v遪g 3 ph髏, t蕋 c� n╪g l鵦 t╪g 20%",					"zongzi_feicui",		1,	(3*60*18)},
	{"B竛h 輙 B筩h Ng鋍",3363,25,		100,	{{3362,1,"B竛h 輙 Ph� Th髖"},	{3366,1,"B筩h Ng鋍"},					{3369,1,"L� g鉯 b竛h"},},"Ng蓇 nhi猲 i 2 vi猲 Linh th筩h c蕄 7 ho芻 1 T祅g Ki誱 Ho祅g Kim trang",	"zongzi_baiyu",		0,	0},
	{"B竛h 輙 B筩h Ng鋍",3363,100,	500,	{{3362,1,"B竛h 輙 Ph� Th髖"},	{3366,5,"B筩h Ng鋍"},					{3369,1,"L� g鉯 b竛h"},},"Ng蓇 nhi猲 i 2 vi猲 Linh th筩h c蕄 7 ho芻 1 T祅g Ki誱 Ho祅g Kim trang",	"zongzi_baiyu",		0,	0},
	{"B竛h 輙 Ng� Ph萴",3364,26,		500,	{{3363,1,"B竛h 輙 B筩h Ng鋍"},	{3367,1,"M秐h b� phng ng� ch�"},	{3369,1,"L� g鉯 b竛h"},},Tb_zongzi_08_yupin[Sever_diff],						"zongzi_yupin",		0,	0},
	{"B竛h 輙 Ng� Ph萴",3364,100,	1000,	{{3363,1,"B竛h 輙 B筩h Ng鋍"},	{3367,9,"M秐h b� phng ng� ch�"},	{3369,1,"L� g鉯 b竛h"},},Tb_zongzi_08_yupin[Sever_diff],					"zongzi_yupin",		0,	0},
}
--门票信息
Tb_nw_tickets = {
	{40,2,0,1034,"T輈h Dng Tinh Hoa"},
	{80,2,0,1035,"Ng� H祅h K� Phi猲"},
	{100,2,0,1036,"La b祅"},
}
--白玉粽子奖励信息
Tb_baiyu_prize = {
	{5,
		{
			{0,103,95},
			{0,103,96},
			{0,103,97},
			{0,103,98},   
		},
	"T祅g Ki誱 T� Kim m穙"
	},
	{10, 
		{
			{0,100,95},
			{0,100,96},
			{0,100,97},
			{0,100,98},
		},
	"Kim L� Thng"
	},
	{15,
		{
			{0,101,95},
			{0,101,96},
			{0,101,97},
			{0,101,98},   
		},
	"T祅g Ki誱 � kim ph鬰"
	},
	{16,{0,102,38},"T祅g Ki誱 B秓 Ch﹗"},
	{17,{0,102,39},"T祅g Ki誱 K� Th筩h"},
	{18,{0,102,40},"T祅g Ki誱 Kim 蕁"},
}
--御品粽子奖励信息
Tb_yupin_prize = {
	{2,1,1146,"Vi猰 Ho祅g Thi誸 H錸"},
	{0,105,15,"Phi猲 V� (v躰h vi詎)"},
	{0,105,19,"Si猽 Quang (v躰h vi詎)"},
	{"12 vi猲 Linh th筩h c蕄 7"},
}
--外装信息
Tb_suit_prize = {
	{
		{"Nam B竧 B竧 u_ti猽 chu萵 ",0,108,510},
		{"Nam B竧 B竧 u_kh玦 ng�",0,108,511},
		{"N� B竧 B竧 u_g頸 c秏",0,108,513},
		{"N� B竧 B竧 u_ki襲 n�",0,108,512},
	},
	{
		{"Nam B竧 B竧 y_ti猽 chu萵",0,109,510},
		{"Nam B竧 B竧 y_kh玦 ng�",0,109,511},
		{"N� B竧 B竧 y_g頸 c秏",0,109,513},
		{"N� B竧 B竧 y_ki襲 n�",0,109,512},
	},
	{
		{"Nam B竧 B竧 kh鑏ti猽 chu萵 ",0,110,510},
		{"Nam B竧 B竧 kh鑏kh玦 ng�",0,110,511},
		{"N� B竧 B竧 kh鑏g頸 c秏",0,110,513},
		{"N� B竧 B竧 kh鑏ki襲 n�",0,110,512},
	},
}
----------------公共函数区
function dragon_boat_08_time_chk()
	local date_time = tonumber(date("%Y%m%d%H"))
	if date_time < dragon_boat_08_start_time then
		return 0
	elseif date_time >= dragon_boat_08_start_time and date_time <= dragon_boat_08_end_time then
		return 1
	else
		return 2
	end
end
--粽子使用
function OnUse(goods_index)
	--获取粽子对应序号
	local goods_id = GetItemParticular(goods_index)
	local goods_diff = 0
	for i = 1,getn(Tb_zongzi_08) do
		if Tb_zongzi_08[i][2] == goods_id then
			goods_diff = i
			break
		end
	end
	--序号合理性检测
	if goods_diff == 0 then
		return
	end
	--是否直接使用
	if Tb_zongzi_08[goods_diff][8] == 1 then
		SetItemUseLapse(goods_index,Tb_zongzi_08[goods_diff][9])
		dostring(Tb_zongzi_08[goods_diff][7].."("..goods_diff..")")
		return
	end
	--使用确认对话展开
	Say("<color=green>"..Tb_zongzi_08[goods_diff][1].."<color>: Hi謚 qu� s� d鬾g <color=yellow>"..Tb_zongzi_08[goods_diff][6].."<color>, b筺 x竎 nh薾 mu鑞 s� d鬾g ch�?",
	2,
	"фi/#"..Tb_zongzi_08[goods_diff][7].."("..goods_diff..")",
	"в ta suy ngh� l筰/end_dialog"
	)
end
--香米粽子使用
function zongzi_xiangmi(goods_diff)
	--携带删除监测
	for i = 1,2 do
		if zongzi_use_dtm(i,goods_diff) ~= 1 then
			return
		end
	end
	--效果增加
	CastState("state_p_attack_percent_add",5,180*18,1,19801279)
	CastState("state_m_attack_percent_add",5,180*18,1,19801280)
	CastState("state_damage_point",30,180*18,1,19801281)
	Msg2Player("Ch骳 m鮪g b筺 s� d鬾g ' "..Tb_zongzi_08[goods_diff][1]..", hi謚 qu� nh薾 頲:  "..Tb_zongzi_08[goods_diff][6].."!")
end
--艾香粽子
function zongzi_aixiang(goods_diff)
	--粽子携带监测
	if zongzi_use_dtm(1,goods_diff) ~= 1 then
		return 0
	end
	--使用数量限制处理
	local date_seq_save = GetTask(TaskID_aixiang_use_date_seq)
	local use_num_save = GetTask(TaskID_aixiang_use_num)
	local date_seq_now = zgc_pub_day_turn(1)
	--TaskID初始化
	if date_seq_save == nil or date_seq_save < date_seq_now then
		SetTask(TaskID_aixiang_use_date_seq,date_seq_now)
		SetTask(TaskID_aixiang_use_num,0)
	else
		if (date_seq_save == date_seq_now and use_num_save >= Aixiang_use_num_day) or date_seq_save > date_seq_now then
			Talk(1,"","<color=green>Nh綾 nh�<color>: H玬 nay b筺  s� d鬾g <color=yellow>b竛h 輙 ng秈 hng<color> t鑙 產 <color=red>"..Aixiang_use_num_day.."<color> l莕, ng祔 mai m韎 c� th� s� d鬾g ti誴!")
			return
		end
	end
	--if GetLevel() == 99 then
	--	laborday08_baoshi_prob()
	--else
		--使用粽子成功
		if Sever_diff == 2 then
			--粽子删除监测
			if zongzi_use_dtm(2,goods_diff) ~= 1 then
				return 0
			end
			ModifyExp(Tb_zongzi_aixong_exp_num[Sever_diff])
			Msg2Player("Ch骳 m鮪g b筺  d飊g 1 'B竛h 輙 ng秈 hng', nh薾 頲 "..Tb_zongzi_aixong_exp_num[Sever_diff].." 甶觤 kinh nghi謒!")
		else
			local golden_exp = GetGoldenExp()
			if  golden_exp <= 0 then
				Talk(1,"","<color=yellow>Nh綾 nh�<color>: 觤 s鴆 kh醗 hi謓 gi� c馻 b筺 l� <color=red>0<color>, kh玭g th� d飊g <color=yellow>B竛h 輙 ng秈 hng<color>!")
				return
			else	
				if golden_exp >= Tb_zongzi_aixong_exp_num[Sever_diff] then
					aixiang_exp_chg(goods_diff)
				else
					Say("<color=yellow>Nh綾 nh�<color>: <color=yellow>B竛h 輙 ng秈 hng<color> c� th� chuy觧 <color=yellow>"..Tb_zongzi_aixong_exp_num[Sever_diff].."<color> 甶觤 s鴆 kh醗 th祅h kinh nghi謒, 甶觤 s鴆 kh醗 hi謓 gi� c馻 b筺 l� <color=yellow>"..golden_exp.."<color>, b筺 x竎 nh薾 mu鑞 s� d鬾g ch�?",
						2,
						"фi/#aixiang_exp_chg("..goods_diff..")",
						"в ta suy ngh� l筰/end_dialog"
					)
				end
			end
		end
--	end
end
--栗子粽子
function zongzi_lizi(goods_diff)
	--空间负重检测
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--携带删除监测
	for i = 1,2 do
		if zongzi_use_dtm(i,goods_diff) ~= 1 then
			return
		end
	end
	local ran_num = random(1,100)
	for i = 1,getn(Tb_nw_tickets) do
		if ran_num <= Tb_nw_tickets[i][1] then
			local add_flag = AddItem(Tb_nw_tickets[i][2],Tb_nw_tickets[i][3],Tb_nw_tickets[i][4],1)
			if add_flag == 1 then
				Msg2Player("Ch骳 m鮪g b筺  d飊g 'B竛h 輙 h箃 d�' i 1 v� v祇 'C鯽 秈 T﹜ B綾' s�"..(i+3).." : "..Tb_nw_tickets[i][5].."!")
			else
				WriteLog("[T誸 an Ng� 08] ngi ch琲	"..GetName().."	T╪g"..Tb_nw_tickets[i][5].." th蕋 b筰, k� hi謚:"..add_flag)
			end
			break
		end
	end
end
--五香粽子
function zongzi_wuxiang(goods_diff)
	--携带删除监测
	for i = 1,2 do
		if zongzi_use_dtm(i,goods_diff) ~= 1 then
			return
		end
	end
	--效果增加
	CastState("state_life_max_percent_add",30,600*18,1,9901,1)
	Msg2Player("Ch骳 m鮪g b筺 s� d鬾g ' "..Tb_zongzi_08[goods_diff][1]..", hi謚 qu� nh薾 頲:  "..Tb_zongzi_08[goods_diff][6].."!")
end
--翡翠粽子
function zongzi_feicui(goods_diff)
	--携带删除监测
	for i = 1,2 do
		if zongzi_use_dtm(i,goods_diff) ~= 1 then
			return
		end
	end
	--效果增加
	CastState("state_strength_add_percent",20,300*18,1,9902,1)
	CastState("state_vitality_add_percent",20,300*18,1,9903,1)
	CastState("state_energy_add_percent",20,300*18,1,9904,1)
	CastState("state_observe_add_percent",20,300*18,1,9905,1)
	CastState("state_dexterity_add_percent",20,300*18,1,9906,1)
	Msg2Player("Ch骳 m鮪g b筺 s� d鬾g ' "..Tb_zongzi_08[goods_diff][1]..", hi謚 qu� nh薾 頲:  "..Tb_zongzi_08[goods_diff][6].."!")
end
--健康经验转经验
function aixiang_exp_chg(goods_diff)
	--粽子删除监测
	if zongzi_use_dtm(2,goods_diff) ~= 1 then
		return 0
	end
	local num_chg = min(GetGoldenExp(),Tb_zongzi_aixong_exp_num[Sever_diff])
	ModifyGoldenExp(-num_chg)
	ModifyExp(num_chg)
	local use_num_save = GetTask(TaskID_aixiang_use_num)
	SetTask(TaskID_aixiang_use_num,(use_num_save+1))
	Talk(1,"","<color=green>Nh綾 nh�<color>: Ch骳 m鮪g  b筺  d飊g 1 '<color=yellow>B竛h 輙 ng秈 hng<color>', i <color=yellow>"..num_chg.."<color> 甶觤 s鴆 kh醗 th祅h kinh nghi謒! Зy l� l莕 th� <color=yellow>"..(use_num_save+1).."<color> d飊g <color=yellow>B竛h 輙 ng秈 hng<color>, h玬 nay b筺 c遪 c� th� s� d鬾g <color=yellow>"..(Aixiang_use_num_day - (use_num_save+1)).."<color> l莕!")
end
--宝石概率增加灵石
function laborday08_baoshi_prob()
	local player_name = GetName()
	local nRand = random(1,1000);
	if nRand <= 249 then
		lspf_AddLingShiInBottle(1,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h C蕄 1, n� trong T� linh nh.")
	elseif nRand <= 479 then
		lspf_AddLingShiInBottle(2,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h c蕄 2,  nh藀 v祇 T� linh nh.");
	elseif nRand <= 709 then
		lspf_AddLingShiInBottle(3,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲1 Linh Th筩h c蕄 3,  nh藀 v祇 T� linh nh.");		
	elseif nRand <= 939 then
		lspf_AddLingShiInBottle(4,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h c蕄 4,  nh藀 v祇 T� linh nh.");		
	elseif nRand <= 989 then
		lspf_AddLingShiInBottle(5,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h c蕄 5,  nh藀 v祇 T� linh nh.");		
	elseif nRand <= 999 then
		lspf_AddLingShiInBottle(6,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h c蕄 6,  nh藀 v祇 T� linh nh.");
		Msg2Global("Ngi ch琲"..player_name.."Nh薾 頲 1 vi猲 Linh th筩h c蕄 6 trong ho箃 ng T誸 an Ng�");
		WriteLog("Ho箃 ng qu鑓 t� lao ng 08: Ngi ch琲"..player_name.."Nh薾 頲 1 vi猲 Linh th筩h c蕄 6 trong ho箃 ng T誸 an Ng�.");		
	else
		lspf_AddLingShiInBottle(7,1);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh Th筩h c蕄 7,  nh藀 v祇 T� linh nh.");		
		Msg2Global("Ngi ch琲"..player_name.."Nh薾 頲 1 vi猲 Linh th筩h c蕄 7 trong ho箃 ng T誸 an Ng�");
		WriteLog("Ho箃 ng qu鑓 t� lao ng 08: Ngi ch琲"..player_name.."Nh薾 頲 1 vi猲 Linh th筩h c蕄 7 trong ho箃 ng T誸 an Ng�.");
	end
end

