--08五一活动轩辕赌徒脚本
--by vivi
--2008/04/11

Include("\\script\\online\\laborday08\\mah_jong_head.lua");
Include("\\script\\lib\\lingshi_head.lua");	

--==========================公共变量定义区域=============================
	start_seq = {
		{630,638}, --1筒和9筒的详细类id
		{639,647}, --条
		{648,656}, --万
		{657,663}  --杂
		}

tMJaward = { --筒、条、万、大四喜、牌神
	{{5,1},{"Nh蕋 Thi觤 Y猽 Ho祅g",2,1,3330,5},{50,51},{"T骾 b� ki誴 s� m玭",0,0,0,"Rng Thi猲 мa Huy襫 Ho祅g Trang",2,0,1057}},
	{{5,2},{"Nh蕋 Thi觤 Y猽 Ho祅g",2,1,3330,10},{50,55,58},{"Ng� H祅h M藅 t辌h",0,107,155,"Rng Thi猲 мa Huy襫 Ho祅g Trang",2,0,1057,"Rng Thi猲 мa Huy襫 Ho祅g Gi竝",2,0,1056}},
	{{6,1},{"Tam Di謚 Long Hi",2,1,3331,5},{50,70,90,110},{"L╪g Ba Vi B�",0	,112,78,"Rng Thi猲 мa Huy襫 Ho祅g Trang",2,0,1057,"Rng Thi猲 мa Huy襫 Ho祅g Gi竝",2,0,1056,"Rng Thi猲 мa Huy襫 Ho祅g Qu竛",2,0,1055}},
	{{7,1},{"Tam Di謚 Long Hi",2,1,3331,15},{150,200,250,300},{"Rng Thi猲 мa Huy襫 Ho祅g v� kh�",2,0,1058,"Rng Thi猲 мa Huy襫 Ho祅g Trang",2,0,1057,"Rng Thi猲 мa Huy襫 Ho祅g Gi竝",2,0,1056,"Rng Thi猲 мa Huy襫 Ho祅g Qu竛",2,0,1055}},
	{{7,2},{" Thanh уng nh c蕄 1",2,1,3213,1}}
}

	tJueYaoBao = {
	{"T骾 b� ki誴 Thi誹 L﹎",2,0,607},
	{"T骾 b� ki誴 V� ng",2,0,611},
	{"T骾 b� ki誴 Nga My",2,0,609},
	{"T骾 b� ki誴 C竔 Bang",2,0,610},
	{"T骾 b� ki誴 Л阯g M玭",2,0,608},
	{"T骾 b� ki誴 Dng M玭",2,0,612},
	{"T骾 b� ki誴 Ng� чc",2,0,613}
	}
	
tTiandi = {
	{{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,85},{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,86},{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,87},{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,88}},
	{{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,85},{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,86},{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,87},{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,88}},
	{{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,85},{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,86},{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,87},{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,88}},
	{[0]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17},{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39},{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43},{"Thi猲 мa Huy襫 Ho祅g Kh� ",0,1,56},{"Thi猲 мa Huy襫 Ho祅g Dao",0,3,67},{"Thi猲 мa Huy襫 Ho祅g C莔",0,10,78},{"Thi猲 мa Huy襫 Ho祅g B髏 ",0,9,89},{"Thi猲 мa Huy襫 Ho祅g Trng",0,8,100},{"Thi猲 мa Huy襫 Ho祅g Thng ",0,6,111},{"Thi猲 мa Huy襫 Ho祅g Cung ",0,4,122},{"Thi猲 мa Huy襫 Ho祅g Tr秓",0,11,15},{"Thi猲 мa Huy襫 Ho祅g Nh蒼 ",0,7,15}},
	 [1]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17},{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43},{"Thi猲 мa Huy襫 Ho祅g Dao",0,3,67},{"Thi猲 мa Huy襫 Ho祅g Trng",0,8,100}},
	 [2]={{"Thi猲 мa Huy襫 Ho祅g Dao",0,3,67},{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43}},
	 [3]={{"Thi猲 мa Huy襫 Ho祅g Trng",0,8,100}},
	 [4]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17}},
	 [5]={{"Thi猲 мa Huy襫 Ho祅g Kh� ",0,1,56}},
	 [6]={{"Thi猲 мa Huy襫 Ho祅g Kh� ",0,1,56}},
	 [7]={{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39},{"Thi猲 мa Huy襫 Ho祅g C莔",0,10,78}},
	 [8]={{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39}},
	 [9]={{"Thi猲 мa Huy襫 Ho祅g C莔",0,10,78}},
	 [10]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17},{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43}},
	 [11]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17}},
	 [12]={{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43}},
	 [13]={{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39},{"Thi猲 мa Huy襫 Ho祅g B髏 ",0,9,89}},
	 [14]={{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39}},
	 [15]={{"Thi猲 мa Huy襫 Ho祅g B髏 ",0,9,89}},
	 [16]={{"Thi猲 мa Huy襫 Ho祅g Thng ",0,6,111},{"Thi猲 мa Huy襫 Ho祅g Cung ",0,4,122}},
	 [17]={{"Thi猲 мa Huy襫 Ho祅g Thng ",0,6,111}},
	 [18]={{"Thi猲 мa Huy襫 Ho祅g Cung ",0,4,122}},
	 [19]={{"Thi猲 мa Huy襫 Ho祅g Tr秓",0,11,15},{"Thi猲 мa Huy襫 Ho祅g Nh蒼 ",0,7,15}},
	 [20]={{"Thi猲 мa Huy襫 Ho祅g Nh蒼 ",0,7,15}},
	 [21]={{"Thi猲 мa Huy襫 Ho祅g Tr秓",0,11,15}}}
	};	


	Npc_name = {"<color=green>Hi猲 Vi猲 L�<color>:","<color=green>Hi猲 Vi猲 Trung<color>:","<color=green>Hi猲 Vi猲 Nh﹏<color>:"}
--==============================主逻辑区域===============================
function main(npc_index)
	local map_ID = GetWorldPos()				--记录NPC名称
	if get_laborday08_award_state() == 1 then
		local npc_dia = {
			"Hay l緈! Xem ta ra tay y!/mah_jong_suc_list",
			"Цnh theo quy t綾 n祇 v藋? L祄 sao t輓h th緉g?/mah_jong_suc_inf",
			"Kh玭g bi誸 M箃 chc l� c竔 g�?/what_is_mah_jong",
			"Cu閏 thi х th莕 tranh b� l� g�?/mah_jong_task_inf",
			"Ta mu鑞 nh薾 Hng d蒼 ho箃 ng 1-5/#get_something(1)",
			"Ta mu鑞 nh薾 1 'rng M箃 chc'/#get_something(2)",
			"Ta c遪 ph秈 h祅h hi謕 c鴘 ngi, kh玭g r秐h  nh M箃 chc!/end_dialog",
		}
		Say(Npc_name[floor(map_ID/100)].."Ta l�  t� c馻 Hi猲 Vi猲 m玭, g莕 y b鎛 m玭 c� t� ch鴆 1 cu閏 thi <color=yellow>х Th莕 tranh b�<color>, sao b籲g h鱱 kh玭g n  th� xem. Ch� � th阨 gian ho箃 ng t� <color=yellow>28-4 n 23-5<color>, th阨 gian nh薾 thng l� <color=yellow>28-4 n 23 gi� 12-5<color>.",
			getn(npc_dia),
			npc_dia
		)
	elseif get_laborday08_award_state() == 0 then
		Talk(1,"",Npc_name[floor(map_ID/100)].."Cu閏 thi х th莕 tranh b� s� di詎 ra t� 28-4 n 5-5, 12-5 s� k誸 th骳 nh薾 ph莕 thng.");		 
	else
		Talk(1,"",Npc_name[floor(map_ID/100)].."Ch骳 m鮪g ph竧 t礽! Cu閏 thi х th莕 tranh b�  k誸 th骳.");
	end
end
--*********************************胡牌规则说明**************************
function mah_jong_suc_inf()
	local map_ID = GetWorldPos()
	Say(Npc_name[floor(map_ID/100)].."Di y l� quy t綾 th緉g, b筺 mu鑞 ch琲 theo c竎h n祇?",
	7,
	"Ta mu鑞 bi誸 quy t綾 h遖 v� ph莕 thng/#mah_jong_rule_dia(1)",
	"Ta mu鑞 bi誸 quy t綾 v� ph莕 thng c馻 Thanh Nh蕋 S綾 уng/#mah_jong_rule_dia(2)",
	"Ta mu鑞 bi誸 quy t綾 v� ph莕 thng c馻 Thanh Nh蕋 S綾 襲/#mah_jong_rule_dia(3)",
	"Ta mu鑞 bi誸 quy t綾 v� ph莕 thng c馻 Thanh Nh蕋 S綾 V筺/#mah_jong_rule_dia(4)",
	"Ta mu鑞 bi誸 quy t綾 v� ph莕 thng c馻 Чi T� H�/#mah_jong_rule_dia(5)",
	"Ta mu鑞 bi誸 quy t綾 v� ph莕 thng c馻 B礽 Th莕/#mah_jong_rule_dia(6)",
	"Tho竧/end_dialog"
	)
end
function mah_jong_rule_dia(suc_way)
	local map_ID = GetWorldPos()
	local tb_mah_jong_suc_rule = {
		"<color=yellow>Quy t綾 B譶h H�<color>:\nC莕 <color=yellow>ng蓇 nhi猲 14<color> t蕀 b礽 t鴆 c� th� b鉩 b礽!\nPh莕 thng: <color=yellow>觤 kinh nghi謒 v� 3 vi猲 Linh th筩h c蕄 1-7, ngi ch琲 c蕄 99 nh薾 ng蓇 nhi猲 15 vi猲 Linh th筩h c蕄 1-7<color>!",
		"<color=yellow>Quy t綾 Thanh Nh蕋 S綾 (уng)<color>:\nC莕 Nh蕋 уng n C鰑 уng <color=yellow>m鏸 lo筰 1 t蕀<color>,  уng kh竎 <color=yellow>ng蓇 nhi猲<color> 5 t蕀!\nPh莕 thng: <color=yellow>Nh薾 頲 5 nguy猲 li謚 hi謚 qu� 竛h s竛g c蕄 1 v� 1 vi猲 Linh th筩h c蕄 5, c� th� nh薾 頲 t骾 b� ki誴 l璾 ph竔 hi謓 t筰 v� trang b� Thi猲 мa Huy襫 Ho祅g<color>!", 
		"<color=yellow>Quy t綾 Thanh Nh蕋 S綾 (襲) <color>:\nC莕 Nh蕋 襲 n C鰑 襲 <color=yellow>m鏸 lo筰 1 t蕀<color>, <color=yellow>ng蓇 nhi猲<color> 5 t蕀 襲 kh竎!\nPh莕 thng: <color=yellow>Nh薾 頲 10 nguy猲 li謚 hi謚 qu� 竛h s竛g c蕄 1 v� 2 vi猲 Linh th筩h c蕄 5, c� th� nh薾 頲 Ng� h祅h m藅 t辌h v� trang b� Thi猲 мa Huy襫 Ho祅g<color>!", 
		"<color=yellow>Quy t綾 Thanh Nh蕋 S綾 V筺<color>:\nC莕 Nh蕋 V筺 n C鰑 V筺 <color=yellow>m鏸 lo筰 1 t蕀<color>, ngo礽 ra c� <color=yellow>ng蓇 nhi猲<color> 5 t蕀 V筺!\nPh莕 thng: <color=yellow>Nh薾 頲 Nguy猲 li謚 hi謚 qu� 竛h s竛g c蕄 3 v� 1 vi猲 Linh th筩h c蕄 6, c� th� nh薾 頲 b� ki誴 L╪g Ba Vi B� v� trang b� Thi猲 мa Huy襫 Ho祅g<color>!", 
		"<color=yellow>Quy t綾 Чi T� H�<color>:\nC莕 Йng Phong, Nam Phong, T﹜ Phong, B綾 Phong <color=yellow>m鏸 lo筰 3 t蕀<color>, ngo礽 H錸g Trung, Ph竧 T礽, B筩h Bi謓 <color=yellow>ng蓇 nhi猲 1 c苝<color>!\n<color=yellow>Ph莕 thng<color>: <color=red>Nh薾 頲 15 nguy猲 li謚 hi謚 qu� 竛h s竛g c蕄 3 v� 1 Linh th筩h c蕄 7, c� th� nh薾 頲 trang b� Thi猲 мa Huy襫 Ho祅g<color>!",
		"<color=yellow>Quy t綾 Th莕 b礽<color>:\nC莕 <color=yellow>ng蓇 nhi猲<color> <color=yellow>777<color> t蕀 M箃 chc!\n<color=yellow>Ph莕 thng<color>: <color=red>2 Linh th筩h c蕄 7 v� 1 Thanh уng кnh c蕄 1<color>!"
	}
	Talk(1,"mah_jong_suc_inf",Npc_name[floor(map_ID/100)].."\n"..tb_mah_jong_suc_rule[suc_way])
end
--**********************************麻将来历******************************
function what_is_mah_jong()
	local map_ID = GetWorldPos()
	Talk(1,"what_is_mah_jong_1",Npc_name[floor(map_ID/100)].."<color=yellow>M箃 Chc<color> v鑞 c� t猲 l� <color=yellow>M箃 Tng<color>, M箃 l� <color=yellow>108<color> v� h秓 h竛 c馻 Th駓 H� truy謓. c� ngi t猲 <color=green>V筺 B豱h 襲<color> r蕋 s飊g b竔 h秓 h竛 Lng S琻 B筩,  ph竧 minh ra c� <color=yellow>M箃 Chc<color>, 甧m 108 Anh h飊g h鉧 th﹏ v祇 tr� ch琲. M箃 Chc c� t鎛g c閚g <color=yellow>108<color> qu﹏ b礽, v� nh� <color=yellow>108<color> v� h秓 h竛. Trong b礽 c� <color=yellow>C鰑 襲<color> v� nh� <color=green>C鰑 襲 Long S� Ti課<color>, <color=yellow>Nh� 襲<color> v� nh� <color=green>Song Ti猲 H� Di猲 Chc<color>, <color=yellow>Nh蕋 B輓h<color> v� nh� <color=green>H綾 Ti襫 Phong L� Qu�<color>.")
end
function what_is_mah_jong_1()
	local map_ID = GetWorldPos()
	Talk(1,"what_is_mah_jong_2",Npc_name[floor(map_ID/100)].."T鎛g c閚g chia l祄 3 lo筰 <color=yellow>V筺, B輓h, 襲<color>, l蕐 h礽 ﹎ c馻 m鏸 ngi. M鏸 lo筰 c� 5 t蕀 t� 1 n 9 v鮝 ng <color=yellow>108<color> t蕀. <color=yellow>108<color> v� h秓 h竛 t� 4 phng t竚 hng t� t� v� Lng S琻 cho n猲 th猰 <color=yellow>Йng, T﹜, Nam, B綾, Trung<color> 5 hng m鏸 hng th猰 4 t蕀 t鎛g c閚g <color=yellow>20<color> t蕀. C竎 v� h秓 h竛 xu蕋 th﹏ t� nhi襲 t莕g l韕 kh竎 nhau n猲 l筰 th猰 <color=yellow>Ph竧, B筩h<color> tng tr璶g cho gi祏 ngh蘯, c閚g th猰 8 t蕀 n祔 t蕋 c� c� <color=yellow>136<color> t蕀.")
end
function what_is_mah_jong_2()
	local map_ID = GetWorldPos()
	Talk(1,"main",Npc_name[floor(map_ID/100)].."Sau  l筰 c閚g th猰 4 lo筰 Hoa b礽 t鎛g c閚g  c� <color=yellow>144<color> qu﹏ b礽. Цnh M箃 Chc d飊g b祅 c� 4 hng Йng T﹜ Nam B綾, c騨g l� ch� 4 m颽 xu﹏ h� thu ng, m鏸 ngi <color=yellow>13 qu﹏ b礽<color> b雐 v� m鏸 qu� c� <color=yellow>13 tu莕 <color>. 4 m颽 h頿 l筰 l� <color=yellow>52<color> tu莕, t鎛g c閚g <color=yellow>364 ng祔<color>, c閚g th猰 <color=yellow>1 qu﹏ b礽<color> gi� d�, t鎛g c閚g c� <color=yellow>365 ng祔<color>, v鮝 ng 1 n╩. ")
end
--**********************************活动简述******************************
function mah_jong_task_inf()
	local map_ID = GetWorldPos()
	Talk(1,"main",Npc_name[floor(map_ID/100)].."<color=yellow>Hi猲 Vi猲 m玭<color> ta v鑞 l� t� ch鴆 t藀 h頿 nhi襲 con b筩 s飊g b竔 <color=green>Hi猲 Vi猲 i hi謕<color>, m鏸 n╩ u t� ch鴆 cu閏 thi ф Th莕  tng nh� <color=green>Hi猲 Vi猲 i hi謕<color>. B籲g h鱱 c� th阨 gian c� th� t譵 1 qu﹏ b礽 t鑤 n ch� ta, ta s� c╪ c� s� qu﹏ b礽 thu th藀 頲  t苙g <color=yellow>ph莕 thng<color> tng 鴑g.")
end
--**********************************胡牌对话******************************
function mah_jong_suc_list()
	local map_ID = GetWorldPos()
	local nState = get_laborday08_state();
	if nState == 0 then				--活动时间判断
		Talk(1,"mah_jong_task_inf",Npc_name[floor(map_ID/100)].."Cu閏 thi ф Th莕 tranh b� v蒼 ch璦 ch輓h th鴆 b総 u. b籲g h鱱 c� th� xem thuy誸 minh li猲 quan ho箃 ng")
		return
	elseif nState == 1 then			--胡牌列表
		Say(Npc_name[floor(map_ID/100)].."Kh玭g bi誸 thi誹 hi謕 c� b礽 n祇?",
			7,
			"Ta mu鑞 ch鋘 B譶h H�/#mah_jong_suc_dtm(1)",
			"Ta mu鑞 ch鋘 Thanh Nh蕋 S綾 уng/#mah_jong_suc_dtm(2)",
			"Ta mu鑞 ch鋘 Thanh Nh蕋 S綾 襲/#mah_jong_suc_dtm(3)",
			"Ta mu鑞 ch鋘 Thanh Nh蕋 S綾 V筺/#mah_jong_suc_dtm(4)",
			"Ta mu鑞 ch鋘 Чi T� H�/#mah_jong_suc_dtm(5)",
			"Ta mu鑞 ch鋘 B礽 Th莕/#mah_jong_suc_dtm(6)",
			"Ta v蒼 ch璦 chu萵 b�/end_dialog"
		)
	else
		Say(Npc_name[floor(map_ID/100)].."<color=yellow>Cu閏 thi х Th莕 tranh b� <color><color=red> k誸 th骳<color> nh璶g ph莕 thng v蒼 c� th� i b譶h thng, b籲g h鱱 mu鑞 i thng <color=red>h穣 nhanh l猲<color> k蝟 h誸 c� h閕.",
			7,
			"Ta mu鑞 ch鋘 B譶h H�/#mah_jong_suc_dtm(1)",
			"Ta mu鑞 ch鋘 Thanh Nh蕋 S綾 уng/#mah_jong_suc_dtm(2)",
			"Ta mu鑞 ch鋘 Thanh Nh蕋 S綾 襲/#mah_jong_suc_dtm(3)",
			"Ta mu鑞 ch鋘 Thanh Nh蕋 S綾 V筺/#mah_jong_suc_dtm(4)",
			"Ta mu鑞 ch鋘 Чi T� H�/#mah_jong_suc_dtm(5)",
			"Ta mu鑞 ch鋘 B礽 Th莕/#mah_jong_suc_dtm(6)",
			"Ta v蒼 ch璦 chu萵 b�/end_dialog"
		)
	end
end
--********************************胡牌确认********************************
function mah_jong_suc_dtm(suc_seq)
	local map_ID = GetWorldPos()
	local mah_jong_suc_dia = {
		Npc_name[floor(map_ID/100)].."<color=yellow>B譶h H�<color> ch� c莕 c� <color=yellow>14 t蕀 b礽<color> ng蓇 nhi猲 l� c� th� i, ph莕 thng l�: <color=yellow>甶觤 kinh nghi謒 v� 3 vi猲 Linh th筩h c蕄 1-7, ngi ch琲 c蕄 99 nh薾 頲 15 Linh th筩h c蕄 1-7<color>. B筺 c� t蕀 b礽 n祇 kh玭g mu鑞 n閜 t� m譶h c蕋 n� trc 甶!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Thanh Nh蕋 S綾 (уng)<color> C莕 Nh蕋 уng n C鰑 уng <color=yellow>m鏸 lo筰 1 t蕀<color>, lo筰 kh竎 <color=yellow>ng蓇 nhi猲<color> 5 t蕀, t鎛g c閚g <color=yellow>14<color> t蕀 уng!\n    Ph莕 thng: <color=yellow>5 nguy猲 li謚 hi謚 qu� 竛h s竛g c蕄 1 v� 1 Linh th筩h c蕄 5, c� th� nh薾 頲 t骾 b� ki誴 l璾 ph竔 hi謓 t筰 v� trang b� Thi猲 мa Huy襫 Ho祅g<color>. B筺 c� t蕀 b礽 n祇 kh玭g mu鑞 n閜 t� m譶h c蕋 n� trc 甶!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Thanh Nh蕋 S綾 (襲)<color> C莕 Nh蕋 襲 n C鰑 襲 <color=yellow>m鏸 lo筰 1 t蕀<color>, <color=yellow>ng蓇 nhi猲<color> 5 t蕀 襲 kh竎!\nPh莕 thng: <color=yellow>Nh薾 頲 10 nguy猲 li謚 hi謚 qu� 竛h s竛g c蕄 1 v� 2 vi猲 Linh th筩h c蕄 5, c� th� nh薾 頲 Ng� h祅h m藅 t辌h v� trang b� Thi猲 мa Huy襫 Ho祅g<color>! B筺 c� t蕀 b礽 n祇 kh玭g mu鑞 n閜 t� m譶h c蕋 n� trc 甶!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Thanh Nh蕋 S綾 V筺<color> c莕 Nh蕋 V筺 n C鰑 V筺 <color=yellow>m鏸 lo筰 1 t蕀<color>, ngo礽 ra c� <color=yellow>ng蓇 nhi猲<color> 5 t蕀 V筺!\nPh莕 thng: <color=yellow>Nh薾 頲 Nguy猲 li謚 hi謚 qu� 竛h s竛g c蕄 3 v� 1 vi猲 Linh th筩h c蕄 6, c� th� nh薾 頲 b� ki誴 L╪g Ba Vi B� v� trang b� Thi猲 мa Huy襫 Ho祅g<color>! B筺 c� t蕀 b礽 n祇 kh玭g mu鑞 n閜 t� m譶h c蕋 n� trc 甶!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Чi T� H�<color> c莕 Йng Phong, Nam Phong, T﹜ Phong, B綾 Phong <color=yellow>m鏸 lo筰 3 t蕀<color>, ngo礽 H錸g Trung, Ph竧 T礽, B筩h Bi謓 <color=yellow>ng蓇 nhi猲 1 c苝<color>!\nPh莕 thng: <color=red>Nh薾 頲 15 nguy猲 li謚 hi謚 qu� 竛h s竛g c蕄 3 v� 1 Linh th筩h c蕄 7, c� th� nh薾 頲 trang b� Thi猲 мa Huy襫 Ho祅g<color>! B筺 c� t蕀 b礽 n祇 kh玭g mu鑞 n閜 t� m譶h c蕋 n� trc 甶!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Th莕 b礽<color> C莕 <color=yellow>ng蓇 nhi猲<color> <color=yellow>777<color> t蕀 M箃 chc!\nPh莕 thng: <color=red>2 Linh th筩h c蕄 7 v� 1 Thanh уng кnh c蕄 1<color>!",
	}
	Say(mah_jong_suc_dia[suc_seq],
	2,
	"Ta mu鑞 i ph莕 thng/#mah_jong_num_chk("..(suc_seq-1)..")",		--进入数量检测
	"в ta chu萵 b� th猰/end_dialog"
	)
end
--********************************麻将检测*****************************
function mah_jong_num_chk(color_diff)
--数据准备
	local map_ID = GetWorldPos()
	local npc_name = Npc_name[floor(map_ID/100)]
--------------------------------------兑换检测--------------------------------------
	local tTotalNum = {PIHU_TOTAl_NUM,TONG_TOTAL_NUM,TIAO_TOTAL_NUM,WAN_TOTAL_NUM,SIXI_TOTAL_NUM};
	local tMjTask	= {TASK_MJ_PIHU_RPIZE,TASK_MJ_TONG_RPIZE,TASK_MJ_TIAO_RPIZE,TASK_MJ_WAN_RPIZE,TASK_MJ_SIXI_RPIZE};
	if color_diff ~= 5 then
		if GetTask(tMjTask[color_diff+1]) >= tTotalNum[color_diff+1] then
			Talk(1,"",npc_name.."Quy t綾 h� b礽 n祔 t鑙 產 c� th� i "..tTotalNum[color_diff+1].." l莕, b筺  i xong.");
			return
		end
	end
--------------------------------------数量检测--------------------------------------
	local mah_jong_id_start = 0
	local mah_jong_id_end = 0
	if color_diff == 0 or color_diff == 5 then			--定义麻将数量的开始计算ID和结束计算ID
		mah_jong_id_start = start_seq[1][1]
		mah_jong_id_end = start_seq[4][2]
	else
		mah_jong_id_start = start_seq[color_diff][1]
		mah_jong_id_end = start_seq[color_diff][2]
	end
	local mah_jong_count = 0		--定义总的麻将数
	for i = mah_jong_id_start,mah_jong_id_end do
		mah_jong_count = mah_jong_count + GetItemCount(2,0,i)
	end
	--数量检测
	if (color_diff ~= 5 and mah_jong_count < 14) or (color_diff == 5 and mah_jong_count < 777) then
		Talk(1,"",npc_name.."B筺 h穣 x竎 nh薾 trong t骾 c� <color=yellow> s� lng M箃 chc<color> ph� h頿 quy t綾!")
		return
	end
--------------------------------------规则检测--------------------------------------
	--开始检测
	if color_diff ~= 0 and color_diff ~= 5 then		--平胡和牌神不需要规则检测
		if color_diff ~= 4 then						--检测同种花色1-9各一张
			for i = start_seq[color_diff][1],start_seq[color_diff][2] do
				if GetItemCount(2,0,i) < 1 then
					Talk(1,"",npc_name.."H穣 x竎 nh薾 trong t骾 c� <color=yellow>1 t蕀<color> b礽 i x鴑g 1 n 9!")
					return
				end
			end
		else
			for i = start_seq[4][1],(start_seq[4][1]+3) do	--检测四风各三张
				if GetItemCount(2,0,i) < 3 then
					Talk(1,"",npc_name.."H穣 x竎 nh薾 trong t骾 b筺 c� Йng Phong, Nam Phong, T﹜ Phong v� B綾 Phong m鏸 lo筰 <color=yellow>3 t蕀<color>!")
					return
				end
			end
			local double_chk = 0 							--对子检测标志
			for i = (start_seq[4][1]+4),start_seq[4][2] do
				if GetItemCount(2,0,i) >= 2 then
					double_chk = 1
					break
				end
			end
			if double_chk == 0 then
				Talk(1,"",npc_name.."H穣 x竎 nh薾 trong t骾 b筺 c� <color=yellow>1 c苝<color> H錸g Trung, Ph竧 T礽 ho芻 B筩h Bi謓!")
				return
			end
		end
	end
-------------------------------------包裹空间检测--------------------------------
	if Zgc_pub_goods_add_chk(3,3) ~= 1 then
		return
	end
--------------------------------------删除检测--------------------------------------
	local del_chk = 0
	local del_remain_num = 14		--需要删除14张麻将
	if color_diff == 0 or color_diff == 5 then
		if color_diff == 5 then
			del_remain_num = 777
		end
		for i = mah_jong_id_start,mah_jong_id_end do
			local mah_jong_num = GetItemCount(2,0,i)
			if mah_jong_num ~= 0 then
				local del_num = min(mah_jong_num,del_remain_num)
				if DelItem(2,0,i,del_num) == 1 then
					del_remain_num = del_remain_num - del_num
				end
			end
			if del_remain_num <= 0 then
				break
			end
		end
	elseif color_diff >= 1 and color_diff <= 3 then
		del_remain_num = 5						--除一到九万另外需要删除5张
		for i = start_seq[color_diff][1],start_seq[color_diff][2] do		--逻辑比较复杂
			local mah_jong_num = GetItemCount(2,0,i)
			local del_num = min(mah_jong_num,(del_remain_num + 1))
			if DelItem(2,0,i,del_num) ~= 1 then
				break
			end
			del_remain_num = del_remain_num - (del_num - 1)
		end
	elseif color_diff == 4 then
		del_remain_num = 5
		for i = start_seq[4][1],(start_seq[4][1]+3) do	--删除四风各三张
			if DelItem(2,0,i,3) ~= 1 then
				break
			end
			del_remain_num = del_remain_num - 1
		end
		for i = (start_seq[4][1]+4),start_seq[4][2] do	--删除对子
			if GetItemCount(2,0,i) >= 2 then
				if DelItem(2,0,i,2) == 1 then
					del_remain_num = del_remain_num - 1
					break
				end
			end
		end
	end
	if del_remain_num > 0 then			--删除失败
		Talk(1,"",npc_name.."H穣 x竎 nh薾 trong t骾 b筺 c� M箃 chc ph� h頿 v韎 y猽 c莡!")
		return
	end
--------------------------------------- 奖励给于-------------------------------------
	if color_diff == 0 then
		local nLv = GetLevel();
		local nExp = floor(nLv*nLv*140);
		SetTask(tMjTask[color_diff+1],GetTask(tMjTask[color_diff+1])+1);
		if nLv ~= 99 then	
			ModifyExp(nExp);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nExp.." kinh nghi謒.");
			for i=1,3 do	
				laborday08_baoshi_prob("B譶h H�");
			end
		else
			for i=1,15 do
				laborday08_baoshi_prob("B譶h H�");
			end
		end
		Talk(1,"",npc_name.."B筺  i h� b礽 <color=red>"..GetTask(tMjTask[color_diff+1]).."<color> l莕, b筺 c遪 頲 i <color=red>"..(tTotalNum[color_diff+1]-GetTask(tMjTask[color_diff+1])).."<color> l莕.");		
	else
		lspf_AddLingShiInBottle(tMJaward[color_diff][1][1],tMJaward[color_diff][1][2]);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..tMJaward[color_diff][1][1].."Linh th筩h"..tMJaward[color_diff][1][2].." vi猲, n�  頲 c蕋 v祇 T� Linh nh.");
		AddItem(tMJaward[color_diff][2][2],tMJaward[color_diff][2][3],tMJaward[color_diff][2][4],tMJaward[color_diff][2][5]);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..tMJaward[color_diff][2][1]..tMJaward[color_diff][2][5].."c竔");
		local tHuName = {"Thanh Nh蕋 S綾 (уng)","Thanh Nh蕋 S綾 (襲)","Thanh Nh蕋 S綾 (V筺)","Чi T� H�","Th莕 b礽"}
		if color_diff ~= 5 then
			SetTask(tMjTask[color_diff+1],GetTask(tMjTask[color_diff+1])+1);
			Talk(1,"",npc_name.."B筺  i h� b礽 <color=red>"..GetTask(tMjTask[color_diff+1]).."<color> l莕, b筺 c遪 頲 i <color=red>"..(tTotalNum[color_diff+1]-GetTask(tMjTask[color_diff+1])).."<color> l莕.");
			local nRand = random(1,1000);
			for i=1,getn(tMJaward[color_diff][3]) do
				if nRand <= tMJaward[color_diff][3][i] then
					if color_diff == 1 and i == 1 then
						local nFaction = GetPlayerFaction();
						if nFaction ~= 0 then
							AddItem(tJueYaoBao[nFaction][2],tJueYaoBao[nFaction][3],tJueYaoBao[nFaction][4],1);
							Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..tJueYaoBao[nFaction][1]);
							Msg2Global("Ngi ch琲"..GetName().."Trong cu閏 thi Th莕 b礽"..tHuName[color_diff].."Nh薾 頲"..tJueYaoBao[nFaction][1]);
							WriteLog("Ho箃 ng qu鑓 t� lao ng 08: Ngi ch琲"..GetName().."Trong cu閏 thi Th莕 b礽"..tHuName[color_diff].."Nh薾 頲"..tJueYaoBao[nFaction][1]);
						else
							local nIdx = random(1,7);
							AddItem(tJueYaoBao[nIdx][2],tJueYaoBao[nIdx][3],tJueYaoBao[nIdx][4],1);
							Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..tJueYaoBao[nIdx][1]);
							Msg2Global("Ngi ch琲"..GetName().."Trong cu閏 thi Th莕 b礽"..tHuName[color_diff].."Nh薾 頲"..tJueYaoBao[nIdx][1]);
							WriteLog("Ho箃 ng qu鑓 t� lao ng 08: Ngi ch琲"..GetName().."Trong cu閏 thi Th莕 b礽"..tHuName[color_diff].."Nh薾 頲"..tJueYaoBao[nIdx][1]);
						end
					else
						local nId = 4*(i-1)+1; --定位id
						AddItem(tMJaward[color_diff][4][nId+1],tMJaward[color_diff][4][nId+2],tMJaward[color_diff][4][nId+3],1);
						Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..tMJaward[color_diff][4][nId]);
						Msg2Global("Ngi ch琲"..GetName().."Trong cu閏 thi Th莕 b礽"..tHuName[color_diff].."Nh薾 頲"..tMJaward[color_diff][4][nId]);
						WriteLog("Ho箃 ng qu鑓 t� lao ng 08: Ngi ch琲"..GetName().."Trong cu閏 thi Th莕 b礽"..tHuName[color_diff].."Nh薾 頲"..tMJaward[color_diff][4][nId]);
					end	
					break
				end
			end
		else
			Msg2Global("Ngi ch琲"..GetName().."Trong cu閏 thi Th莕 b礽"..tHuName[color_diff].."Nh薾 頲"..tMJaward[color_diff][1][1].."Linh th筩h"..tMJaward[color_diff][1][2].." ");
			Msg2Global("Ngi ch琲"..GetName().."Trong cu閏 thi Th莕 b礽"..tHuName[color_diff].."Nh薾 頲"..tMJaward[color_diff][2][1]);
			WriteLog("Ho箃 ng qu鑓 t� lao ng 08: Ngi ch琲"..GetName().."Trong cu閏 thi Th莕 b礽"..tHuName[color_diff].."Nh薾 頲"..tMJaward[color_diff][1][1].."Linh th筩h"..tMJaward[color_diff][1][2].." vi猲 v� "..tMJaward[color_diff][2][1]);
		end
	end				
end

function get_something(nType)
	local tSomething = {{2,1,1114},{2,0,1059}};
	local map_ID = GetWorldPos()				--记录NPC名称
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if BigGetItemCount(tSomething[nType][1],tSomething[nType][2],tSomething[nType][3]) >= 1 then
		Talk(1,"",Npc_name[floor(map_ID/100)].."Kh玭g ph秈  c� r錳 sao?");
		return
	end
	AddItem(tSomething[nType][1],tSomething[nType][2],tSomething[nType][3],1);
end

function end_dialog()
end;