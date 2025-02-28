Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\vng\\config\\newserver.lua");

ITEM_SATIN 			= {2, 1, 15}		-- 行缎
COUNT_SATIN 		= 10				-- 行缎数目
COUNT_MEIJIN		= 100				-- 金币金数量

CALLBACK_FILE		= "\\script\\结婚\\npc\\媒婆.lua"		-- 回调文件名
FUTURE_DAY_COUNT	= 7					-- 可预定未来日期的天数

STATUS_IDLE			= 0					-- 场地状态：空闲
STATUS_BIDUP		= 1					-- 场地状态：正在竞投
STATUS_OVER			= 2					-- 场地状态：买断
--==================东西的价格==============================================================================
HIRE_CLOTH_COST = 1;	--租衣服所需金子
HIRE_CLOTH2_COST = 1;	--租主婚人所需金子
BUY_DOOLY_COST = 1;	--租轿子所需金子
BUY_RING_COST = 520;		--买戒指所需金子
BUY_QINGTIE_PACKET = 99	--买请帖包所需金子
CANCEL_MARRIAGE_COST = 500	--取消婚约所需的金子
ANNOUCE_FRIENDS_BEGIN_COST = 20	--通知玩家婚庆将要开始所需的金子 
ANNOUNCE_INVITAION_COST = 20	--
ANNOUNCE_ALL_PLAYER_COST = 20
--==========================================================================================================
g_InfoHeader = "<color=green>B� mai<color>:";
--这个结构的具体内容是：map_fields = 日期{时段{场地类型{具体信息}}}
map_fields = {}

-- 纳徵需要的物品和数量
map_item_nazheng = {
	{1, 1, 12, 36},		-- 稻花香
	{1, 1, 15, 36},		-- 黄金糕
	{2, 1, 54, 36},		-- 绣缎
	{2, 9,  3, 36},		-- 五色丝
	{2, 1, 39,  1}		-- 夜明珠
}

-- 纳采：女方流程
function process_nacai_girl()
	Talk(1, "",g_InfoHeader.."B猲 nam t� i v韎 b猲 n� r錳 n g苝 ta.")
end

-- 纳采：男方交媒金和礼品
function process_nacai_boy_gift()
	if (GetCash() < COUNT_MEIJIN*10000 or
		GetItemCount(ITEM_SATIN[1], ITEM_SATIN[2], ITEM_SATIN[3]) < COUNT_SATIN) then
		Talk(1, "",g_InfoHeader.."L� v藅 ci h醝 nh蕋 nh kh玭g th� thi誹, t蕋 c� g錷: <color=red>100<color> ti襫 v祅g v� <color=red>10<color>c﹜ v秈 g蕀, mau 甶 chu萵 b�.")
	else
		-- 扣除媒金和礼品
		DelItem(ITEM_SATIN[1], ITEM_SATIN[2], ITEM_SATIN[3], COUNT_SATIN)
		Pay(COUNT_MEIJIN*10000)
		-- 设置任务变量
		set_wedding_step(2)
		Talk(1, "",g_InfoHeader.."Ti襫 mai m鑙 v� l� v藅 u nh薾 c� r錳 c遪 kh玭g mau t� i v韎 � trung nh﹏ n y g苝 ta.")
		hint_step(3)
		WriteLog("[K誸 h玭]:"..GetName().."Giao ti襫 mai m鑙 v� l� v藅")
	end
end

-- 纳采：男方流程
function process_nacai_boy()
	if (GetLevel() < 15) then
		Talk(1, "",g_InfoHeader.."Ngi t� ch蕋 c騨g kh玭g t� th秓 n祇 s韒 t譵 頲 � trung nh﹏, nh璶g h玭 nh﹏ l� chuy謓 i s�. Theo lu藅, ngi ch璦 n c蕄 <color=red>15<color> th� kh玭g th� k誸 h玭. Ngi c� g緉g luy謓 th猰 m閠 th阨 gian n鱝 r錳 quay l筰 nh�!")
	elseif (GetPlayerFaction() == 0) then
		Talk(1, "",g_InfoHeader.."Ngi ph秈 gia nh藀 m玭 ph竔 xin � ki課 c馻 chng m玭 r錳 m韎 頲 k誸 h玭.")
	elseif (GetTask(TASK_FACTION_OUT) == 0) then
		Talk(1, "",g_InfoHeader.."Ngi"..map_faction[GetPlayerFaction()][1].." n猲 b竜 cho chng m玭"..map_faction[GetPlayerFaction()][2].."H穣 <color=yellow>xu蕋 s�<color> r錳 n g苝 ta!")
	else
		set_wedding_step(1)
		hint_step(2)
		Say(g_InfoHeader.."Th� n祔 甶, ngi h穣 chu萵 b� (<color=red>100<color> lng v祅g) v� (<color=red>10<color> cu閚 g蕀 v鉩) l祄 l� v藅, ta s� ch th﹏ gi髉 ngi l祄 l� g筸 h醝. C竎 i trai g竔 quanh y u do m閠 tay ta mai m鑙, ch� c莕 c� th祅h �, b秓 m ngi s� ci 頲 v� hi襫. <color=yellow>N誹 nh蕋 th阨 t譵 kh玭g 頲 th� ngi c� th� n Ng� c竎 mua K誸 h玭 l� bao, nh鱪g g� c莕 cho l� h醝 u c� trong K誸 h玭 l� bao<color>.",
			2,
			"Ta  chu萵 b� ti襫 mai m鑙 v� l� v藅 r錳/process_nacai_boy_gift",
			"Ta s� chu萵 b�/cancel")
	end
end

-- 纳采
function process_nacai()
	if (GetSex() == 1) then
		Say(g_InfoHeader.."Xem ngi h祇 ki謙 tu蕁 t� nh� v藋  c� � trung nh﹏ ch璦? N誹 c� r錳 th� chuy謓 h玭 s�  ta lo li謚. Nh璶g ta ch� gi髉 cho nh鱪g ngi c th﹏ th玦 y nh�!",
			2,
			"Ta  c� � trung nh﹏, ta mu鑞 k誸 h玭./process_nacai_boy",
			"� trung nh﹏ sao?!/cancel")
	elseif (get_lover_code(PlayerIndex) == 0) then
		Talk(1, "",g_InfoHeader.."C� nng  c� ngi t﹎ u � h頿 ch璦? C莕 ta gi髉 kh玭g?")
	else
		Say(g_InfoHeader.."C� nng y猲 t﹎, m鋓 vi謈 c�  b� mai n祔 lo li謚.",
			2,
			--"是否要清空Relay数据？/clear_data",
			"Ta mu鑞 suy ngh� l筰 chuy謓 h玭 s�./cancel_engagement",
			"V藋 ta i ngi./cancel")
	end
end
-- 解除婚约对话，女方
function cancel_engagement()
	local selTab = {
				"уng �/disengage_girl",
				"в ta suy ngh� l筰/cancel",
				}
	Say(g_InfoHeader.."Sao th�? Kh玭g mu鑞 k誸 h玭 �? N誹 ngi h駓 h玭 c ph秈 n閜 b錳 thng <color=yellow>"..CANCEL_MARRIAGE_COST.." L� kim<color>, suy ngh� k� nh�!",getn(selTab),selTab)
end;

function disengage_girl()	--女方取消婚约
	if Pay(CANCEL_MARRIAGE_COST*10000) == 1 then
		clear_task();
		Talk(1,"",g_InfoHeader.."Ta  gi髉 ngi h駓 h玭 c. Hy v鋘g l莕 sau kh玭g ph秈 nh� v藋 n鱝 nh�, h玭 nh﹏ kh玭g ph秈 tr� a u.")
		Msg2Player("B筺  h駓 h玭 c");
		WriteLog("[K誸 h玭]:"..GetName().."H玭 c  b� h駓");
	else
		Talk(1,"",g_InfoHeader.."Ti襫 v祅g mang theo kh玭g , kh玭g th� h駓 h玭 c.");
	end;
end;
-- 解除婚约对话，男方
function disengage_talk()
	Say(g_InfoHeader.."Ngi mu鑞 h駓 h玭 c �? Nh� v藋 nh鱪g n� l鵦 c馻 ngi xem nh� c玭g c鑓, l� v藅 ngi giao c騨g kh玭g th� l蕐 l筰. Ngi ngh� k� 甶.",
		2,
		"уng �/disengage_boy",
		"в ta suy ngh� l筰/cancel")
end

-- 取消婚约
function disengage_boy()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	if (sub_date ~= 0 and map_fields[sub_date] ~= nil) then
		local param2 = GetTask(TASK_WEDDING_FIELD)
		local sub_year, sub_mon, sub_day = decode_date(sub_date)
		local sub_period, sub_type = decode_param2(param2)
		local field_inf = map_fields[sub_date][sub_period][sub_type]
		if (field_inf[ITEMKEY_ROLE] == GetName()) then
			local caption = format(g_InfoHeader.."B筺 t v祇 <color=red>th竛g %d ng祔 %d %s<color>-<color=red>%s<color>, v韎 gi� l� <color=red>%d<color> l� kim, 產ng x誴 th� 1 kh玭g th� h駓 b� h玭 nh﹏. ",
				sub_mon,
				sub_day,
				map_period[sub_period][5],
				map_fieldinfo[sub_type][1],
				GetTask(TASK_WEDDING_COST))
			Talk(1, "main", caption)
			return
		end
	end
	clear_task();
	Talk(1,"",g_InfoHeader.."Ta  gi髉 ngi h駓 h玭 c. Hy v鋘g l莕 sau kh玭g ph秈 nh� v藋 n鱝 nh�, h玭 nh﹏ kh玭g ph秈 tr� a u.");
	Msg2Player("B筺  h駓 h玭 c");
	WriteLog("[K誸 h玭]:"..GetName().."H玭 c  b� h駓");
end

-- 问名
function process_wenming()
	if GetTeamSize() < 2 then
		Talk(1, "",g_InfoHeader.."Ti襫 mai m鑙 v� l� v藅  nh薾, t� i v韎 � trung nh﹏ n g苝 ta.")
	elseif GetTeamSize() > 2 then
		Talk(1, "",g_InfoHeader.."H玭 nh﹏ l� chuy謓 i s�, kh玭g  ngi kh竎 can thi謕 v祇.")
	elseif GetSex() == 2 then
		Say(g_InfoHeader.."C� nng y猲 t﹎, m鋓 vi謈 c�  b� mai n祔 lo li謚.",
			2,
			--"是否要请空Relay数据？/clear_data",
			"Ta mu鑞 suy ngh� l筰 chuy謓 h玭 s�./cancel_engagement",
			"V藋 ta i ngi./cancel")
	elseif GetCaptainName() ~= GetName() then
		Talk(1,"",g_InfoHeader.."V韎 cng v� l� i trng n ho祅 t蕋 c竎 bc quan tr鋘g.");
	else
		local lover = get_team_lover(PlayerIndex)
		Say(g_InfoHeader.."Ngi n祔 s� l� <color=yellow>" .. GetName(lover) .. "<color> th� t� c馻 ngi �? Th藅 l� p ngi p n誸. C竎 ngi ng k� k誸 h玭 lu玭 ch�?",
			2,
			"ng v藋, ta mu鑞 th祅h th﹏./process_wenming_confirm",
			"в ta suy ngh� l筰!/cancel")
	end
end

-- 检查双方是否没有婚约
function check_empty_contract(bridegroom, bride)
	if (get_lover_code(bridegroom) ~= 0) then
		Talk(1, "",g_InfoHeader.."Ngi  l� ngi nh h玭, kh玭g th� ng k� th猰 l莕 n鱝.")
		return 0
	elseif (get_lover_code(bride) ~= 0) then
		Talk(1, "",g_InfoHeader.."C� nng   nh h玭, kh玭g th� th祅h th﹏ v韎 ngi.")
		return 0
	else
		return 1
	end
end

-- 检查双方是否互相有婚约
function check_eachother_contract(bridegroom, bride)
	local selTab = {
			"Ta mu鑞 suy ngh� l筰 chuy謓 h玭 s�./disengage_talk",
			"Bi誸 r錳!/cancel",
			}
	--新郎＝新娘，新娘～＝新郎
	if (get_lover_code(bridegroom) == Hash(GetName(bride))) and (get_lover_code(bride) ~= Hash(GetName(bridegroom))) then
		if get_lover_code(bride) == 0 then
			Say(g_InfoHeader.."C� nng n祔  nh h玭, n誹 mu鑞 th祅h th﹏ v韎 ngi c� 蕐 ph秈 h駓 b� h玭 c trc .",getn(selTab),selTab)
		else
			Say(g_InfoHeader.."C� nng   nh h玭, kh玭g th� th祅h th﹏ v韎 ngi.",getn(selTab),selTab);
		end;
		return 0
	--新郎～＝新娘
	elseif (get_lover_code(bride) ~= Hash(GetName(bridegroom))) then
		Say(g_InfoHeader.."Ngi  l� ngi nh h玭, kh玭g th� ng k� th猰 l莕 n鱝.",getn(selTab),selTab);
		return 0
	else
		return 1
	end
end

-- 检查结婚条件，这个函数只能由男方调用
function check_marriage_condition(check)
	-- 必须男方做队长
	if (GetTeamSize() ~= 2 or GetCaptainName() ~= GetName()) then	
		local msg = {
			"C飊g t� i v韎 � trung nh﹏ n g苝 ta.",
			"Hai ngi c飊g t� i do b猲 nam l祄 i trng n g苝 ta.",
		}
		Talk(1, "",g_InfoHeader..msg[GetSex()])	--这里应该有问题
		return 0
	end
	
	local lover = get_team_lover(PlayerIndex)
	if (GetSex(lover) == 1) then
		Talk(1, "",g_InfoHeader.."� trung nh﹏ c馻 ngi y sao? Xem 2 ngi h筺h ph骳 qu�!")
	elseif (GetLevel(lover) < 13) then
		Talk(1, "",g_InfoHeader.."C� nng n祔 c遪 qu� tr�. Theo lu藅 thi誹 n� ch璦 n c蕄 <color=red>13<color> th� kh玭g th� k誸 h玭. Ngi c� th� i v� c飊g c� 蕐 luy謓 th猰 nh�!")
	elseif (is_married(lover) == 1) then
		Talk(1, "",g_InfoHeader.."C� nng n祔  k誸 h玭 v韎 m閠 ngi kh竎, nh蕋 nh kh玭g th� c飊g ngi th祅h th﹏.")
	elseif (GetPlayerFaction(PlayerIndex) == 0) then
		Talk(1, "",g_InfoHeader.."Ngi ph秈 gia nh藀 m玭 ph竔 xin � ki課 c馻 chng m玭 r錳 m韎 頲 k誸 h玭.")
	elseif (GetPlayerFaction(lover) == 0) then
		Talk(1, "",g_InfoHeader.."C� nng n祔 v蒼 ch璦 c� ngi ch鴑g gi竚 �? H玭 s� nh� v莥 kh玭g th� g鋓 l� danh ch輓h ng玭 thu薾 頲. H穣 gia nh藀 m玭 ph竔 頲 s� ng � c馻 chng m玭 sau  n g苝 ta.")
	elseif (GetTask(TASK_FACTION_OUT, PlayerIndex) == 0) then
		Talk(1, "",g_InfoHeader.."Ngi"..map_faction[GetPlayerFaction()][1].." n猲 b竜 cho chng m玭"..map_faction[GetPlayerFaction()][2].."Ngi ph秈 xu蕋 s� r錳 m韎 頲 k誸 h玭.")
	elseif (GetTask(TASK_FACTION_OUT, lover) == 0) then
		Talk(1, "",g_InfoHeader.."C� nng ph秈 xu蕋 s� r錳 m韎 頲 k誸 h玭.")
	elseif (check(PlayerIndex, lover) == 1) then
		return 1
	end
	return 0
end

-- 问名：确定要结婚
function process_wenming_confirm()
	if (check_marriage_condition(check_empty_contract) == 1) then
		local lover = get_team_lover(PlayerIndex)
		local myself = PlayerIndex
		local name = GetName()
		Say(g_InfoHeader.."ng n鉵g v閕, ch� c莕 c� nng 蕐 ng � ta s� cho 2 ngi k誸 h玭.",
			2,
			"Thay ta d� th╩ � c馻 c� 蕐/ask_engage",
			"в ta suy ngh� l筰/cancel")
	end
end

function ask_engage()
	if (check_marriage_condition(check_empty_contract) == 1) then
		local lover = get_team_lover(PlayerIndex)
		SetPlayerScript(CALLBACK_FILE, lover)
		Say2SomeOne(lover,
			g_InfoHeader.."Ngi ch輓h l�" .. GetName(lover) .. " c� nng, <color=yellow>" .. GetName() .. "<color>  nhi襲 l莕 mu鑞 c飊g c� nh h玭, thi誹 hi謕  y猽 thng c� th藅 l遪g. Ta  l祄 mai cho nhi襲 ngi nh璶g ch璦 th蕐 ai t鑤 nh� v藋. Thi誹 hi謕 蕐 c遪 s緈 c� s輓h l�, ch� c莕 ch� s� ng � c馻 c�.",
			2,
			"уng �/agree_engage",
			"Kh玭g ng �/disagree_engage")
	end
end

-- 女方拒绝订婚
function disagree_engage()
	if (GetTeamSize() == 2) then
		local lover = get_team_lover(PlayerIndex)
		if (lover ~= 0 and GetSex(lover) == 1) then
			SetPlayerScript(CALLBACK_FILE, lover)		
			Talk2SomeOne(lover,
				1,
				"",
				g_InfoHeader.."Xin l鏸, c� nng 蕐 ch璦 hi觰 g� v� ngi n猲  t� ch鑙. Ngi n猲 t筼 c� h閕  c� 蕐 hi觰 th猰 v� ngi.")
			Msg2Player(format("B筺 quy誸 nh c飊g v韎 %s k誸 h玭", GetName(lover)))
		end
	end
end

-- 女方同意订婚
function agree_engage()
	-- DEBUG
	gf_ShowDebugInfor("agree_engage")
	if (GetTeamSize() == 2) then
		local lover = get_team_lover(PlayerIndex)
		if (lover ~= 0 and GetSex(lover) == 1) then
			local caption = format(g_InfoHeader.."B猲 nam <color=yellow>%s<color> (Ъng c蕄 %d) c莡 h玭 c飊g <color=yellow>%s<color> (Ъng c蕄%d). Hai b猲  quy誸 nh ti課 t韎 h玭 nh﹏. Ta s� gi髉 c竎 ngi trao i danh thi誴, 2 ngi ch輓h th鴆 nh h玭.",
				GetName(lover),
				GetLevel(lover),
				GetName(PlayerIndex),
				GetLevel(PlayerIndex))
			SetPlayerScript(CALLBACK_FILE, lover)		
			Say2SomeOne(lover,
				caption,
				2,
				"Kh玭g c� v蕁  g�/process_wenming_confirm2",
				"Ta s� quay l筰 sau!/cancel")
			Msg2Player(format("Ta ng � c飊g %s k誸 h玭", GetName(lover)))
		end
	end
end

function process_wenming_confirm2()
	if (check_marriage_condition(check_empty_contract) == 1) then
		local lover = get_team_lover(PlayerIndex)
		local myself = PlayerIndex
		set_lover_code(lover, Hash(GetName(myself)))
		set_lover_code(myself, Hash(GetName(lover)))
		-- 设置任务变量
		set_wedding_step(3)
		Talk(1, "", g_InfoHeader.."Ta  gi髉 c竎 ngi trao i danh thi誴, b﹜ gi� b猲 nam s� t苙g qu� cho b猲 n�.")
		SaveNow();
		PlayerIndex = lover;
		Talk(1, "", g_InfoHeader.."Ta  gi髉 c竎 ngi trao i danh thi誴, b﹜ gi� b猲 nam s� t苙g qu� cho b猲 n�.")
		SaveNow();
		PlayerIndex = myself;
		WriteLog("[K誸 h玭]:"..GetName(myself).."c飊g v韎 "..GetName(lover).."Ki課 l藀 h玭 c");
	end
end

-- 纳吉
function process_naji()
	hint_step(4)
	Say(g_InfoHeader.."Х t苙g qu� ch璦? Ti誴 theo ngi ph秈 chu萵 b� l� h醝 g錷 <color=red>Чo Hoa Hng 36 b譶h<color>, <color=red>B竛h B閠 v祅g 36 h閜<color>, <color=red>G蕀 v祅g 36 x蕄<color>, <color=red>T� ng� s綾 36 cu閚<color>, <color=red>D� Minh Ch﹗ 5 vi猲<color>. Chu萵 b�  r錳 c飊g t� i v韎 th� t� c馻 ngi n g苝 ta.",
		3,
		"Ta  chu萵 b� xong r錳/process_naji_confirm",
		"Ta mu鑞 suy ngh� l筰 chuy謓 h玭 s�./disengage_talk",
		"Ta v蒼 ch璦 chu萵 b� xong/cancel")
end

-- 纳徵：确认
function process_naji_confirm()
	-- 必须男方做队长
	local msg = g_InfoHeader.."B猲 nam a � trung nh﹏ n g苝 ta"
	if (GetTeamSize() ~= 2 or GetCaptainName() ~= GetName()) then
		Talk(1, "", msg)
		return
	end
	
	local lover = get_team_lover(PlayerIndex)
	if (GetSex(lover) == 1) then
		Talk(1, "", g_InfoHeader.."N祔, l莕 trc ngi a n m閠 c� nng sao l莕 n祔 l筰 l� g� n祔 h�?")
		return
	elseif (get_lover_code(PlayerIndex) ~= Hash(GetName(lover))) then
		Talk(1, "", g_InfoHeader.."C� nng l莕 trc ngi a n kh玭g ph秈 l� ngi n祔.")
		return
	end
	
	local item_count = getn(map_item_nazheng)
	for i = 1, item_count do
		local item = map_item_nazheng[i]
		if (GetItemCount(item[1], item[2], item[3]) < item[4]) then
			Talk(1, "", g_InfoHeader.."Chu萵 b� xong l� h醝 c飊g t� i v韎 � trung nh﹏ n g苝 ta. L� h醝 g錷: <color=red>Чo Hoa Hng 36 b譶h<color>, <color=red>B竛h B閠 v祅g 36 h閜<color>, <color=red>G蕀 v祅g 36 x蕄<color>, <color=red>T� ng� s綾 36 cu閚<color>, <color=red>D� Minh Ch﹗ 1 vi猲<color>.")
			return
		end
	end
	
	for i = 1, item_count do
		local item = map_item_nazheng[i]
		DelItem(item[1], item[2], item[3], item[4])
	end
	
	-- 设置任务变量
	set_wedding_step(4)
	process_qingqi()
	WriteLog("[K誸 h玭]:"..GetName().."Giao l� v藅");
end
--判断预订的场地是否过期
function is_field_timeout()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	local sub_period, sub_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local cur_date = curr_date()
	local cur_time = curr_time()
	if get_wedding_stat() == 1 then
		if sub_date > cur_date then	--当前日期小于场地日期
			return 0
		elseif sub_date == cur_date then	--同一天
			if tonumber(date("%H")) > map_period[sub_period][3]	then--比较小时
				return 1
			else
				return 0;
			end;
		else
			return 1;
		end;
	else
		return 0;	
	end;
end;
-- 婚礼场地预订状态，返回值0：没有预订，1：预订成功，2：预订失败，3：预订领先，4：预订落后，-1：预订过期
function get_sub_stat()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	local sub_period, sub_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local cur_date = curr_date()
	local cur_time = curr_time()
	if (sub_date == 0) then
		return 0		-- 没有预订
	elseif (map_fields[sub_date] == nil) then	--map_fields被重新初始化了，所以就为nil了
		return -1		-- 预订过期
	else	--如果map_fields没被初始化就靠下面的来判断是否过期了
		local sub_time = encode_time(map_period[sub_period][3], map_period[sub_period][4], 0)
		if (cmp_datetime(sub_date, sub_time, cur_date, cur_time) <= 0) then
			return -1	-- 预订过期
		end
	end
	
	local field = map_fields[sub_date][sub_period][sub_type]
	local name = GetName()
	local field_stat = field[ITEMKEY_STAT]
	if (field_stat == STATUS_OVER or
		cmp_datetime(field[ITEMKEY_CLOSEDATE], field[ITEMKEY_CLOSETIME], cur_date, cur_time) <= 0) then
		if (name == field[ITEMKEY_ROLE]) then
			return 1	-- 预订成功
		else
			return 2	-- 预订失败
		end
	else
		if (name == field[ITEMKEY_ROLE]) then
			return 3	-- 预订领先
		else
			return 4	-- 预订落后
		end
	end
end

-- 请期
function process_qingqi()
	-- 婚礼场地预订状态，返回值0：没有预订，1：预订成功，2：预订失败，3：预订领先，4：预订落后，-1：预订过期
	local sub_stat = get_sub_stat()
	-- DEBUG
	gf_ShowDebugInfor(format("process_qingqi: sub_stat==%d", sub_stat))
	local talk = {
		"в ta xem s﹏ kh蕌 h玭 l� � u/process_qingqi_selectfield",
		"Ta mu鑞 xem b猲 trong s﹏ kh蕌/preview_fields",
--		"Л頲! Ta t� ch鴆 h玭 l� m� kh玭g c莕 s﹏ kh蕌/process_qingqi_nofield",
		"Ta mu鑞 suy ngh� l筰 chuy謓 h玭 s�./disengage_talk",
		"в ta suy ngh� l筰/cancel"
	}
	local caption = g_InfoHeader.."L� h醝  chu萵 b� xong, b﹜ gi� n <color=yellow>Th豱h k�<color>. Ta c� v礽 ch� n祔 ngi th� n  xem sao."

	local sub_year, sub_mon, sub_day = decode_date(GetTask(TASK_WEDDING_DATE))
	local sub_period, sub_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	if get_wedding_stat() == 1 and sub_stat ~= 0 then	--如果预定成功后还在请期阶段，那么就是没领取请帖包
		caption = format(g_InfoHeader.."B筺 t v祇 th祅h c玭g <color=red>th竛g %d ng祔 %d %s<color> - <color=red>%s<color>. Зy l� b秐 ch� d蒼 c竎h s� d鬾g s﹏ kh蕌 h玭 l�,  c� g� ch璦 r� ngi c� n t譵 ta. ",
			sub_mon,
			sub_day,
			map_period[sub_period][5],
			map_fieldinfo[sub_type][1])
		Say(caption, 2,
			format("Nh薾 thi謕 m阨 v� k誸 h玭 l� bao/#take_invitation(%d)", map_fieldinfo[sub_type][4]),
			"в ta ngh� l筰/cancel")		
		return 0;
	end;
	if (sub_stat == -1) then	--过期了
		caption = format(g_InfoHeader.."B筺 t <color=red>th竛g %d ng祔 %d %s<color> - <color=red>%s<color>  qu� h筺,  kh玭g th� l蕐 l筰 ti襫 u gi�. H穣 ch鋘 l筰 khu v鵦 h玭 l�.",
			sub_mon,
			sub_day,
			map_period[sub_period][5],
			map_fieldinfo[sub_type][1])
		clear_subs();
		Say(caption, getn(talk), talk)
	elseif (sub_stat == 0) then	--没有预订
		if (get_wedding_stat() == 1) then
			hint_step(5)
			Say(g_InfoHeader.."N誹 kh玭g k誸 h玭 � s﹏ kh蕌 h玭 l� c竎 ngi c� th� t� i v韎 nhau n <color=red>Th髖 Y猲<color> g苝 <color=red>Nguy謙 L穙<color>.",
				2,
				"Ta mu鑞 suy ngh� l筰 chuy謓 h玭 s�./disengage_talk",
				"V藋 ch髇g ta s� n g苝 Nguy謙 L穙/cancel")
		elseif (check_marriage_condition(check_eachother_contract) ~= 0 or get_sub_stat() ~= 0) then
			Say(caption, getn(talk), talk)
		end
	elseif (sub_stat == 1) then
		if (get_wedding_stat() == 0) then
			on_sub_success()
		else
			hint_step(5)
			Say(g_InfoHeader.."Ngi  t s﹏ kh蕌  k誸 h玭, nh蕋 nh ph秈 ng gi�. K誸 h玭 � y, th玭g qua c竎 nghi th鴆 c竎 ngi s� tr� th祅h phu th�. N誹 mu鑞 n gi秐 h琻 ngi c騨g c� th� n Th髖 Y猲 g苝 Nguy謙 L穙.",
				1,
				"Ta bi誸 r錳/main")
		end
		--set_wedding_step(5);	--接下来就到亲迎啦
	elseif (sub_stat == 2) then	--预订失败
		Say(g_InfoHeader.."Ngi  kh玭g t 頲 s﹏ kh蕌 h玭 l�.",
			getn(talk), talk)
	elseif (sub_stat == 3 or	--3：预订领先
			sub_stat == 4) then	--4：预订落后
		Say(caption, 2,
			"в ch髇g ta xem l筰/process_qingqi_selectfield",
			--"我想重新考虑一下我的婚事/disengage_talk",
			"в ta suy ngh� l筰/cancel")
	end
end

function preview_fields()
	local selTab = {
			"Y誸 chi ti觰 tr骳/#preview_fields_confirm(1)",
			"C� o/#preview_fields_confirm(2)",
			"чng ph遪g hoa ch骳/#preview_fields_confirm(3)",
			"V﹏ S琻 nh/#preview_fields_confirm(4)",
			"Kh玭g c莕 u/cancel",
			}
	Say(g_InfoHeader.."S﹏ kh蕌 � y l� p nh蕋, c� mu鑞 tham quan kh玭g?",getn(selTab),selTab);
end;

function preview_fields_confirm(nType)
	local nOldPlayerIndex = PlayerIndex;
	local nFellowIndex = GetInteractivePlayerIndex();
	local nMyName = GetName();
	if nFellowIndex ~= 0 then
		if GetTask(TASK_WEDDING_LOVER,nFellowIndex) ~= Hash(nMyName) then	--如果对方与自己没婚约
			CleanInteractive();
		end;
	end;
	local tField = {
			[1] = {855,1543, 3220},
			[2] = {856,1603, 3276},
			[3] = {857,1544, 3213},
			[4] = {858,1603, 3326},
			}
	NewWorld(tField[nType][1],tField[nType][2],tField[nType][3]);
end

-- 向Relay请求场地预订信息
function process_qingqi_selectfield()
	set_wedding_stat(0);	--表示未竞标成功
	show_subs()
end

-- 检查某天是否有空闲场地
function check_idle_date(fields)
	for i = 1, getn(fields) do
		if (check_idle_period(fields[i]) == 0) then
			return 0
		end
	end
	return 1
end

-- 检查某时段是否有空闲场地
function check_idle_period(fields)
	local date = curr_date()
	local time = curr_time()
	for i = 1, getn(map_fieldinfo) do
		local stat = fields[i][ITEMKEY_STAT]
		if (stat == STATUS_IDLE) then
			-- 空闲
			return 1
		elseif (stat == STATUS_BIDUP and
			cmp_datetime(fields[i][ITEMKEY_CLOSEDATE], fields[i][ITEMKEY_CLOSETIME], date, time) > 0) then
			-- 竞投中，未到期
			return 1						
		end
	end
	return 0
end

-- 显示场地预订信息
function show_subs()
	local future = future_days(2, FUTURE_DAY_COUNT)
	local talk = {}
	local count = getn(future)
	
	for i = 1, count do
		local date = future[i]
		local year, mon, day = decode_date(date)
		if (map_fields[date] == nil) then
			-- DEBUG
			gf_ShowDebugInfor(format("show_subs: init map_fields[%d]", date))
			map_fields[date] = init_date_field()
		end
		
		if (check_idle_date(map_fields[date]) == 1) then
			talk[i] = format("th竛g %d ng祔 %d/#show_subs_date(%d,%d,%d)", mon, day, year, mon, day)
		else
			talk[i] = format("th竛g %d ng祔 %d (T蕋 c� c竎 s﹏ kh蕌 u tr鑞g)/cancel", mon, day)
		end	
	end	
	
	--talk[count + 1] = "我的投标情况/show_mysubs"
	--talk[count + 2] = "我要取回竞投的礼金/withdraw"
	talk[count + 1] = "Quay l筰 i tho筰 trc/main"
	talk[count + 2] = "S� quay l筰 sau/cancel"
	Say(g_InfoHeader.."Xin ch鋘 ng祔", getn(talk), talk)
end

function withdraw()
	if gf_JudgeRoomWeight(11,50) ~= 1 then
		Talk(1,"",g_InfoHeader.."Ngi c莕 s緋 x誴 l筰 h祅h l�, kho秐g tr鑞g kh玭g .");
		return 0;
	end;
	local task_cost = GetTask(TASK_WEDDING_COST)
	if (task_cost == 0) then
		Talk(1, "main", g_InfoHeader.."Ch璦 t l阨")
		return
	end
	
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local year, mon, day = decode_date(task_date)
	local this_date = curr_date()
	local this_time = curr_time()
	if (task_date < curr_date()) then
		local caption = format(g_InfoHeader.."B筺 t v祇 <color=red>th竛g %d ng祔 %d %s<color>-<color=red>%s<color>, v韎 gi� l� <color=red>%d<color> l� kim. Х qu� h筺,  kh玭g th� l蕐 l筰 ti襫 t c鋍 ",
			mon,
			day,
			map_period[task_time][5],
			map_fieldinfo[task_type][1],
			task_cost)
		Talk(1, "main", caption)
		return
	else
		local field = map_fields[task_date][task_time][task_type]
		if (field[ITEMKEY_ROLE] == GetName()) then
			local close_date = field[ITEMKEY_CLOSEDATE]
			local close_time = field[ITEMKEY_CLOSETIME]
			local caption = nil
			if (field[ITEMKEY_STAT] == STATUS_OVER or
				cmp_datetime(close_date, close_time, this_date, this_time) <= 0) then
				caption = format(g_InfoHeader.."B筺 t v祇 <color=red>th竛g %d ng祔 %d %s<color>-<color=red>%s<color>,  gi� ti襫 l�<color=red>%d<color>. B筺 t ti襫 th祅h c玭g.",
					mon,
					day,
					map_period[task_time][5],
					map_fieldinfo[task_type][1],
					task_cost)
			else
				caption = format(g_InfoHeader.."B筺 t v祇 <color=red>th竛g %d ng祔 %d %s<color>-<color=red>%s<color>,  gi� ti襫 l�<color=red>%d<color>. B筺 產ng x誴 th� 1, kh玭g th� r髏 l筰 ti襫  t.",
					mon,
					day,
					map_period[task_time][5],
					map_fieldinfo[task_type][1],
					task_cost)
			end
			Talk(1, "main", caption)
			return
		end
	end
	AddItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], task_cost)
	clear_subs()
	Msg2Player(format("Ngi  t %d L� kim.", task_cost))
	WriteLog("[K誸 h玭]:"..GetName().."Do m閠 s� nguy猲 nh﹏  r髏 l筰"..task_cost.." L� kim, t筰 h祄 s� withdraw")
end

function diff_time(time1, time2)
	local hour1, min1, sec1 = decode_time(time1)
	local hour2, min2, sec2 = decode_time(time2)
	local t1 = hour1 * 3600 + min1 * 60 + sec1
	local t2 = hour2 * 3600 + min2 * 60 + sec2
	if (t1 < t2) then
		t1 = t1 + 24 * 3600
	end
	return t1 - t2
end

-- 投标成功
function on_sub_success()
	local wedding_stat = get_wedding_stat()
	local year, mon, day = decode_date(GetTask(TASK_WEDDING_DATE))
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	if (wedding_stat == 1) then
		local task_cost = GetTask(TASK_WEDDING_COST)
		local caption = format(g_InfoHeader.."B筺 t <color=red>th竛g %d ng祔 %d %s<color>-<color=red>%s,  v韎 gi� l� <color=red>%d<color> l� kim. Phi猲 u gi�  k誸 th骳,  b筺  u gi� th祅h c玭g v� nh薾 頲 quy襫 s� d鬾g khu v鵦 h玭 l�.",
			mon,
			day,
			map_period[task_time][5],
			map_fieldinfo[task_type][1],
			task_cost)
		Talk(1, "", caption)
	else
		local caption = format(g_InfoHeader.."B筺  d� nh th祅h c玭g <color=red>th竛g %d ng祔 %d %s<color> - <color=red>%s<color>. Зy l� b秐 ch� d蒼 c竎h s� d鬾g s﹏ kh蕌 h玭 l�,  c� g� ch璦 r� ngi c� n t譵 ta. ",
			mon,
			day,
			map_period[task_time][5],
			map_fieldinfo[task_type][1])
		Say(caption, 2,
			format("Nh薾 thi謕 m阨 v� k誸 h玭 l� bao/#take_invitation(%d)", map_fieldinfo[task_type][4]),
			"в ta ngh� l筰/cancel")
	end
	set_wedding_stat(1)		--表示竞标场地成功
	WriteLog("[K誸 h玭]:"..GetName().."t 頲 s﹏ kh蕌, th阨 gian:"..GetTask(TASK_WEDDING_DATE)..", th阨 gian v� lo筰:"..GetTask(TASK_WEDDING_FIELD));
end

-- 接收请帖
function take_invitation(count)
	if GetTask(TASK_GOT_INVITATION) == 1 then
		Talk(1,"",g_InfoHeader.."B筺  nh薾 thi謕 m阨 v� K誸 h玭 l� bao");
		return 0;
	end
	if gf_JudgeRoomWeight(15,50) == 0 then
		Talk(1,"",g_InfoHeader.."Kho秐g tr鑞g trong h祅h trang c馻 b筺 kh玭g ");
		return 0;
	end;
	SetTask(TASK_GOT_INVITATION,1)
	local wedding_stat = get_wedding_stat()
	-- 设置请帖属性
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_para = GetTask(TASK_WEDDING_FIELD)
	add_invitation(count, task_date, task_para)
	local _,nFieldType = decode_param2(task_para)
	AddItem(ITEM_MARRIAGE_PACKET[nFieldType][1],ITEM_MARRIAGE_PACKET[nFieldType][2],ITEM_MARRIAGE_PACKET[nFieldType][3],1)
	Msg2Player("B筺 nh薾 頲 "..ITEM_MARRIAGE_PACKET[nFieldType][4]);
	set_wedding_step(5);	--接下来就到亲迎啦
	WriteLog("[K誸 h玭]:"..GetName().."thi謕 m阨 v� K誸 h玭 l� bao"..nFieldType);
end

-- 我的投标情况
function show_mysubs()
	local cost = GetTask(TASK_WEDDING_COST)
	local date = GetTask(TASK_WEDDING_DATE)
	local period, type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local year, mon, day = decode_date(date)
	-- 婚礼场地预订状态，返回值0：没有预订，1：预订成功，2：预订失败，3：预订领先，4：预订落后，-1：预订过期
	local sub_stat = get_sub_stat()
	if (sub_stat == -1) then
		local caption = format(g_InfoHeader.."B筺 t <color=red>th竛g %d ng祔 %d %s<color>-<color=red>%s,  v韎 gi� l� <color=red>%d<color> l� kim. Phi猲 u gi�  h誸 h筺.",
			mon,
			day,
			map_period[period][5],
			map_fieldinfo[type][1],
			cost)
		Talk(1, "", caption)
	elseif (sub_stat == 0) then
		Talk(1, "main", g_InfoHeader.."Ch璦 t l阨")
	elseif (sub_stat == 1) then
		on_sub_success()
	elseif (sub_stat == 2) then
		local field = map_fields[date][period][type]
		caption = format(g_InfoHeader.."B筺 t <color=red>th竛g %d ng祔 %d %s<color>-<color=red>%s,  v韎 gi� l� <color=red>%d<color> l� kim. Phi猲 u gi�  k誸 th骳,  b筺 u gi� th蕋 b筰,  kh玭g nh薾 頲 quy襫 s� d鬾g khu v鵦 h玭 l�.",
			mon,
			day,
			map_period[period][5],
			map_fieldinfo[type][1],
			cost,
			field[ITEMKEY_COST])
		Talk(1, "", caption)
	else
		local field = map_fields[date][period][type]
		local left_sec = diff_time(field[ITEMKEY_CLOSETIME], curr_time())
		local left_hour = floor(left_sec / 3600)
		local left_min = floor(mod(left_sec, 3600) / 60) 
		if (sub_stat == 3) then	-- 投标领先
			keep_ahead(year, mon, day, period, type, left_hour, left_min)
		else
			drop_behind(field, year, mon, day, period, type, left_hour, left_min)
		end
	end
end

-- 显示某一天的预订情况
function show_subs_date(year, mon, day)
	year = tonumber(year)
	mon = tonumber(mon)
	day = tonumber(day)
	
	local date = encode_date(year, mon, day)
	local talk = {}
	if (map_fields[date] == nil) then
		-- DEBUG
		gf_ShowDebugInfor(format("show_subs_date: init map_fields[%d]", date))
		map_fields[date] = init_date_field()
	end
	
	local fields = map_fields[date]
	local count = getn(fields)
	for i = 1, count do
		if (check_idle_period(fields[i]) == 0) then
			talk[i] = format("%s (T蕋 c� c竎 s﹏ kh蕌 u tr鑞g)/cancel",
				map_period[i][5])
		else
			talk[i] = format("%s/#show_subs_period(%d,%d,%d,%d)",
				map_period[i][5],
				year,
				mon,
				day,
				i)
		end
	end
	--talk[count + 1] = "我的投标情况/show_mysubs"
	talk[count + 1] = "Ch鋘 l筰 ng祔 kh竎/show_subs"
	talk[count + 2] = "S� quay l筰 sau/cancel"
	Say(format(g_InfoHeader.."Th阨 gian s﹏ kh蕌 c遪 tr鑞g: n╩ %d th竛g %d ng祔 %d. Xin ch鋘 ng祔: ",year, mon, day), getn(talk), talk)
end

function show_subs_period(year, mon, day, period)
	year = tonumber(year)
	mon = tonumber(mon)
	day = tonumber(day)
	period = tonumber(period)
	
	local date = encode_date(year, mon, day)
	local fields = map_fields[date][period]
	local count = getn(fields)
	local talk = {}
	for i = 1, count do
		local stat = fields[i][ITEMKEY_STAT]
		local cost = fields[i][ITEMKEY_COST]
		if (stat == STATUS_IDLE) then
			talk[i] = format("%s: gi� %d/#select_field(%d,%d,%d,%d,%d)",
				map_fieldinfo[i][1], map_fieldinfo[i][2], year, mon, day, period, i)
		elseif (stat == STATUS_OVER or cost >= map_fieldinfo[i][3]) then
			local role = fields[i][ITEMKEY_ROLE]
			talk[i] = format("%s: Х c� %s t v韎 gi� l� %d L� kim/cancel",
				map_fieldinfo[i][1], role, cost)
		else
			if (cmp_datetime(fields[i][ITEMKEY_CLOSEDATE], fields[i][ITEMKEY_CLOSETIME], curr_date(), curr_time()) <= 0) then
				talk[i] = format("%s: t xong, gi� %d/cancel",
					map_fieldinfo[i][1], fields[i][ITEMKEY_COST])
			else
				local close_date = fields[i][ITEMKEY_CLOSEDATE]
				local close_time = fields[i][ITEMKEY_CLOSETIME]			
				local this_date = curr_date()
				local this_time = curr_time()
			
				local diff = diff_time(close_time, this_time)
				local left_hour = floor(diff / 3600)
				local left_min = (diff - left_hour * 3600) / 60
				-- talk[i] = format("%s：有人投标，现价%d个礼金，每次加价%d个礼金，距离投标结束还有%d小时%d分/#select_field(%d,%d,%d,%d,%d)",
				talk[i] = format("%s: Gi� ti謓 t筰 %d L� kim, m鏸 l莕 t╪g %d L� kim. Th阨 gian ng k� c遪 %d gi� %d ph髏/#select_field(%d,%d,%d,%d,%d)",
					map_fieldinfo[i][1],
					fields[i][ITEMKEY_COST],
					map_fieldinfo[i][6],
					left_hour,
					left_min,
					year, mon, day, period, i)
			end
		end
	end
	
	talk[count + 1] = format("Ch鋘 l筰 th阨 gian kh竎/#show_subs_date(%d,%d,%d)",year, mon, day);
	talk[count + 2] = "S� quay l筰 sau/cancel"
	local caption = format(g_InfoHeader.."T譶h h譶h s﹏ kh蕌 n╩ %d th竛g %d ng祔%d %s, ch鋘 s﹏ kh蕌 b筺 c莕.",
			year,
			mon,
			day,
			map_period[period][5])
	Say(caption, getn(talk), talk)
end

-- 投标，领先
function keep_ahead(year, mon, day, period, type, left_hour, left_min)
	local nCurrLost = GetTask(TASK_WEDDING_COST);
	local nMaxPrice = map_fieldinfo[type][3];
	local caption = format(g_InfoHeader.."B筺 t <color=red>th竛g %d ng祔 %d gi� %s<color>-%s,  gi� l� <color=red>%d<color> l� kim. Hi謓 c遪 %d gi� %d ph髏 k誸 th骳 u gi�. Gi� cu鑙 c飊g l� <color=yellow> "..nMaxPrice.."<color> L� kim, b筺 ph秈 ra gi� <color=yellow>"..(nMaxPrice-nCurrLost).."<color> m韎 c� th� mua t s﹏ kh蕌 n祔. уng � kh玭g?",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		GetTask(TASK_WEDDING_COST),
		left_hour,
		left_min)
	local talk = {}
	talk[1] = format("Ta mua t s﹏ kh蕌 n祔!/#buy(%d,%d,%d,%d,%d)", year, mon, day, period, type)
	talk[2] = "в ta suy ngh� l筰/cancel"
	Say(caption, getn(talk), talk)
end

-- 投标，被别人超过
function drop_behind(field, year, mon, day, period, type, left_hour, left_min)
	-- DEBUG
	gf_ShowDebugInfor(format("\ndrop_behind(%d,%d,%d,%d,%d,%d,%d)", year, mon, day, period, type, left_hour, left_min))
	
	local last_bidup = GetTask(TASK_WEDDING_COST)
	local curr_price = field[ITEMKEY_COST]
	local base_price = map_fieldinfo[type][6]	--加价
	local need_money = curr_price + base_price - last_bidup
	
	caption = format(g_InfoHeader.."B筺 t <color=red>th竛g %d ng祔 %d %s<color>-%s,  gi� b筺 a ra l� <color=red>%d<color> l� kim,   c� ngi kh竎 ra gi� cao h琻. Gi� hi謓 t筰 l� <color=red>%d<color> L� kim. Th阨 gian u gi� c遪 <color=red>%d gi� %d ph髏<color>. N誹 mu鑞 ti誴 t鬰 u gi� b筺 ph秈 t╪g th猰 <color=red>%d<color> L� kim.",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		last_bidup,
		curr_price,
		left_hour,
		left_min,
		need_money)
	talk = {}
	talk[1] = format("Mu鑞 u v韎 ta �? Л頲! T╪g th猰 %d L� kim, t鎛g c閚g l� %d L� kim!/#bidup(%d,%d,%d,%d,%d)",
		need_money,
		need_money + last_bidup,
		year,
		mon,
		day,
		period,
		type)
	talk[2] = format("S﹏ kh蕌 n祔 i gia ta mua t r錳, gi� %d L� kim!/#buy(%d,%d,%d,%d,%d)",
		map_fieldinfo[type][3], year, mon, day, period, type)
	talk[3] = "Ta mu鑞 thu h錳 l筰 s� ti襫  b� ra � s﹏ kh蕌 n祔/rollback"
	talk[4] = format("Ch鋘 s﹏ kh蕌 kh竎/#show_subs_period(%d,%d,%d,%d)",
		year, mon, day, period)
	talk[5] = "S� quay l筰 sau/cancel"
	Say(caption, getn(talk), talk)
end

-- 投标是否失败
function is_bidup_failed(field, role)
	if (field[ITEMKEY_ROLE] == role) then
		return 0
	elseif (field[ITEMKEY_STAT] == STATUS_OVER) then
		return 1
	elseif (cmp_datetime(field[ITEMKEY_CLOSEDATE], field[ITEMKEY_CLOSETIME], curr_date(), curr_time()) <= 0) then
		return 1
	else
		return 0
	end
end

-- 选择某个时段的某个场地
function select_field(year, mon, day, period, type)
	year = tonumber(year)
	mon = tonumber(mon)
	day = tonumber(day)
	period = tonumber(period)
	type = tonumber(type)
	
	-- DEBUG
	gf_ShowDebugInfor(format("\nselect_field(%d, %d, %d, %d, %d)", year, mon, day, period, type))
	
	local subs_date = encode_date(year, mon, day)
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local myself = GetName()
	
	-- 已经竞投过
	if ((task_date ~= 0 and task_date ~= subs_date) or
		(task_time ~= 0 and task_time ~= period) or
		(task_type ~= 0 and task_type ~= type)) then
		-- 如果上次竞投失败，则允许重新竞投
		if (map_fields[task_date] ~= nil) then
			local field = map_fields[task_date][task_time][task_type]
			if (is_bidup_failed(field, myself) == 0) then
				local task_year, task_mon, task_day = decode_date(task_date)
				Talk(1, "", format(g_InfoHeader.."B筺  t n╩ <color=red>%d<color> th竛g <color=red>%d<color> ng祔 <color=red>%d<color> - <color=red>%s<color>  color=red>%s<color>",
					task_year,
					task_mon,
					task_day,
					map_period[task_time][5],
					map_fieldinfo[task_type][1]))
				return
			end
		end
	end

	local caption = ""
	local talk = {}
	local date = encode_date(year, mon, day)
	local field = map_fields[date][period][type]
	local curr_cost = field[ITEMKEY_COST]	-- 当前的竞标价格
	
	-- 以前没有投标或者上次投标失败
	if (GetTask(TASK_WEDDING_COST) == 0 or
		map_fields[task_date] == nil or
		is_bidup_failed(map_fields[task_date][task_time][task_type], myself) == 1) then
		caption = format(g_InfoHeader.."B筺  ch鋘: n╩ %d th竛g %d ng祔 %d %s - %s,  quy誸 nh t ch�?",
			year,
			mon,
			day,
			map_period[period][5],
			map_fieldinfo[type][1])
--		if curr_cost == 0 then	--如果之前没有人竞标
--			talk[1] = format("我要竞标，我出%d个礼金/#bidup(%d,%d,%d,%d,%d)",map_fieldinfo[type][2], year, mon, day, period, type)
--		else
--			talk[1] = format("我要竞标，我多出%d个礼金，一共是%d个礼金/#bidup(%d,%d,%d,%d,%d)",map_fieldinfo[type][6],curr_cost+map_fieldinfo[type][6], year, mon, day, period, type)
--		end;
			
		talk[1] = format("уng �, gi� %d L� kim!/#buy(%d,%d,%d,%d,%d)",
			map_fieldinfo[type][2], year, mon, day, period, type)
		talk[2] = format("Hay l� ch鋘 s﹏ kh蕌 kh竎/#show_subs_period(%d,%d,%d,%d)",
			year, mon, day, period)
		talk[3] = "S� quay l筰 sau/cancel"
		Say(caption, getn(talk), talk)
	else
		local diff = diff_time(field[ITEMKEY_CLOSETIME], curr_time())
		local left_hour = floor(diff / 3600)
		local left_min = (diff - left_hour * 3600) / 60
		if (field[ITEMKEY_ROLE] == GetName()) then	-- 已经投过标未超过
			keep_ahead(year, mon, day, period, type, left_hour, left_min)
		else										-- 已经投过标被超过
			drop_behind(field, year, mon, day, period, type, left_hour, left_min)
		end
	end
end

function callback_adddata(result)
	gf_ShowDebugInfor("callback_adddata")
	WriteLog("[K誸 h玭]: File g鑓 thay i c竎 th玭g s� li猲 quan n k誸 h玭 th祅h c玭g");
	-- TODO: here
end

-- 修改整型共享数据
function update_sharedata_int(param1, param2, key, data)
	AddRelayShareData(KEY_WEDDING,
		param1,
		param2,
		CALLBACK_FILE,
		"callback_adddata",		-- TODO: 回调函数
		0,
		key,
		"d",
		data)
	-- DEBUG
	gf_ShowDebugInfor(format("update_sharedata_int(%d, %d, %s, %d)", param1, param2, key, data))
	DelRelayShareDataCopy(KEY_WEDDING,param1,param2);
	WriteLog("[K誸 h玭]: File g鑓 thay i c竎 th玭g s� li猲 quan n s﹏ kh蕌 k誸 h玭. Lo筰: ng th糿g");
end

-- 修改字符串型共享数据
function update_sharedata_str(param1, param2, key, data)
	AddRelayShareData(KEY_WEDDING,
		param1,
		param2,
		CALLBACK_FILE,
		"callback_adddata",		-- TODO: 回调函数
		0,
		key,
		"s",
		data)
	-- DEBUG
	gf_ShowDebugInfor(format("update_sharedata_str(%d, %d, %s, %s)", param1, param2, key, data))
	DelRelayShareDataCopy(KEY_WEDDING,param1,param2);
	WriteLog("[K誸 h玭]: File g鑓 thay i c竎 th玭g s� li猲 quan n s﹏ kh蕌 k誸 h玭. Lo筰: Chu鏸 k� t�");
end

-- 竞投提示
function bidup_hint(mon, day, period, type, cost)
	local caption = format("u gi� th竛g %d ng祔 %d_ %s %s, gi� %d L� kim.",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		cost)
	Msg2Player(caption)
	caption = g_InfoHeader..caption;
	Talk(1, "", caption)
end

function global_msg(mon, day, period, type, cost)
	local sMsg = "";
	if type == 1 then
		sMsg = ""
	elseif type == 2 then
	
	elseif type == 3 then
	
	else
	
	end;
	AddGlobalNews(sMsg)
	Msg2Global(sMsg)
end;

-- 买断提示
function buy_hint(mon, day, period, type, cost)
	local caption = format("d� nh th竛g %d ng祔 %d_ %s %s, gi� %d L� kim.",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		cost)
	Msg2Player(caption)
	caption = g_InfoHeader..caption;
	Talk(1, "", caption)
	local sMsg = "";
	local sMsg1 = "";
	local lover = get_team_lover(PlayerIndex);
	local sBoyName = GetName();
	local sGirlName = GetName(lover);
	local nHour = map_period[period][1];
	if type == 1 then
		sMsg = "Hi謕 s� giang h� <color=yellow>"..sBoyName.."<color> t� <color=red>"..mon.."Nguy謙"..day.."Ng祔 <color> l骳 <color=red>"..nHour.."<color> t筰 <color=yellow>Y誸 Chi ti觰 tr骳<color> c飊g v韎 <color=yellow>"..sGirlName.."<color> c� nng k誸 h玭. S� c� m苩 c馻 c竎 v� b籲g h鱱 l� ni襪 vinh h筺h cho t﹏ nh﹏!";
		sMsg1 = "Hi謕 s� giang h�"..sBoyName.."Vu"..mon.."Nguy謙"..day.."Ng祔"..nHour.." gi� t筰 Y猲 Chi ti觰 tr骳 c飊g v韎"..sGirlName.." k誸 h玭. S� c� m苩 c馻 b籲g h鱱 l� ni襪 vinh h筺h cho t﹏ nh﹏";
	elseif type == 2 then
		sMsg = "<color=yellow>"..sBoyName.."<color> v� <color=yellow>"..sGirlName.."<color> l骳 <color=red>"..mon.."Nguy謙"..day.."Ng祔 <color> l骳 <color=red>"..nHour.."<color> s� k誸 h玭 t筰 C� Фo, m鋓 ngi n  ch骳 m鮪g!";
		sMsg1 = "Gia nh﹏"..sBoyName.."c飊g v韎 "..sGirlName.."l骳"..mon.."Nguy謙"..day.."Ng祔"..nHour.." gi� k誸 h玭 t筰 C� o, m阨 c竎 anh h飊g k� n� n ch骳 m鮪g!";
	elseif type == 3 then
		sMsg = "Cao th� <color=yellow>"..sBoyName.."<color> k誸 h玭 c飊g <color=red>"..mon.."Nguy謙"..day.."Ng祔 <color> l骳 <color=red>"..nHour.."<color> giai nh﹏ <color=yellow>"..sGirlName.."<color>, c竎 v� ng o V� l﹎ n ch骳 m鮪g";
		sMsg1 = "Cao th�"..sBoyName.."k誸 h玭 c飊g"..mon.."Nguy謙"..day.."Ng祔"..nHour.."Gia nh﹏"..sGirlName..", c竎 v� ng o n ch骳 m鮪g";
	else
		sMsg = "Nam cao th� <color=yellow>"..sBoyName.."<color> s竛h duy猲 c飊g giai nh﹏ <color=red>"..mon.."Nguy謙"..day.."Ng祔 <color> l骳 <color=red>"..nHour.."<color> t筰 <color=yellow>"..sGirlName.."<color>, ch骳 hai ngi b竎h ni猲 giai l穙!";
		sMsg1 = "Nam cao th�"..sBoyName.."s竛h duy猲 c飊g n� giai nh﹏"..mon.."Nguy謙"..day.."Ng祔"..nHour.."t筰"..sGirlName..". Ch骳 2 ngi b竎h ni猲 giai l穙!";
	end;
	AddGlobalNews(sMsg);
	Msg2Global(sMsg1);
end

-- 竞标
function bidup(year, mon, day, period, type)
	if (check_marriage_condition(check_eachother_contract) == 0) then
		return
	end
	
	local subs_date = encode_date(year, mon, day)
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))	
	
	if ((task_date ~= 0 and task_date ~= subs_date) or
		(task_time ~= 0 and task_time ~= period) or
		(task_type ~= 0 and task_type ~= type)) then
		local task_year, task_mon, task_day = decode_date(task_date)
		-- 如果上次竞投失败，则允许重新竞投
		if (map_fields[task_date] ~= nil and
			is_bidup_failed(map_fields[task_date][task_time][task_type], myself) == 0) then
			Talk(1, "", format(g_InfoHeader.."B筺 ch鋘: n╩ %d th竛g %d ng祔 %d_ %s %s",
				task_year,
				task_mon,
				task_day,
				map_period[task_time][5],
				map_fieldinfo[task_type][1]))
			return
		end
	end
	
	local date = encode_date(year, mon, day)
	if (map_fields[subs_date] == nil) then
		-- DEBUG
		gf_ShowDebugInfor(format("bidup: init map_fields[%d]", subs_date))
		map_fields[subs_date] = init_date_field()
	end
	local field = map_fields[subs_date][period][type]
	
	-- 检查是否已经被买断
	if (field[ITEMKEY_STAT] == STATUS_OVER) then
		Talk(1, "", format(g_InfoHeader.."S﹏ kh蕌 n祔  頲 %s t", field[ITEMKEY_ROLE]))
		return
	end
	
	-- 检查身上礼金是否足够
	local last_price = GetTask(TASK_WEDDING_COST)								-- 上次竞投的价格
	local curr_money = GetItemCount(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3])	-- 身上的礼金个数
	local base_price = map_fieldinfo[type][2]									-- 场地起标价
	local curr_price = field[ITEMKEY_COST]										-- 当前竞投最高价
	local add_price  = map_fieldinfo[type][6]									-- 每次的加价值
	local need_money = curr_price + add_price - last_price						-- 加价的礼金个数
	if (curr_money < need_money) then
		Talk(1, "", g_InfoHeader.."Ti襫 v祅g c馻 b筺 kh玭g  ")
		return
	end
	
	local wife = get_team_lover(PlayerIndex)
	-- 检查竞投是否结束
	local param2 = encode_param2(period, type)
	if (field[ITEMKEY_STAT] == STATUS_BIDUP) then
		local close_date = field[ITEMKEY_CLOSEDATE]
		local close_time = field[ITEMKEY_CLOSETIME]
		if (curr_price >= map_fieldinfo[type][3] or
			cmp_datetime(close_date, close_time, curr_date(), curr_time()) <= 0) then
			-- 竞投结束
			Talk(1, "", format(g_InfoHeader.."u gi� k誸 th骳, s﹏ kh蕌 頲 %s mua v韎 gi� %d L� kim",
				field[ITEMKEY_ROLE], curr_price))
			return
		else
			-- 竞投进行中
			if DelItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], need_money) ~= 1 then
				Talk(1, "", g_InfoHeader.."Ti襫 v祅g c馻 b筺 kh玭g  ")
				return			
			end;
			if (last_price == 0) then
				SetTask(TASK_WEDDING_DATE, subs_date)
				SetTask(TASK_WEDDING_FIELD, param2)
			end
			local pay = last_price + need_money
			SetTask(TASK_WEDDING_COST, pay)
			
			local husband_name = GetName(PlayerIndex)
			local wife_name = GetName(wife)
			
			field[ITEMKEY_WIFE] = wife_name
			field[ITEMKEY_ROLE] = husband_name
			field[ITEMKEY_COST] = pay
			
			update_sharedata_str(subs_date, param2, ITEMKEY_WIFE, wife_name)
			update_sharedata_str(subs_date, param2, ITEMKEY_ROLE, husband_name)
			update_sharedata_int(subs_date, param2, ITEMKEY_COST, pay)
			
			bidup_hint(mon, day, period, type, pay)
			return
		end
	end
	
	if DelItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], base_price) ~= 1 then
		Talk(1, "", g_InfoHeader.."Ti襫 v祅g c馻 b筺 kh玭g  ")
		return
	end;
	-- 设定截至日期为24小时以后
	local close_date = next_date(curr_date())
	local close_time = curr_time()
	field[ITEMKEY_CLOSEDATE] = close_date
	field[ITEMKEY_CLOSETIME] = close_time
	update_sharedata_int(date, param2, ITEMKEY_CLOSEDATE, close_date)
	update_sharedata_int(date, param2, ITEMKEY_CLOSETIME, close_time)
	
	local husband_name = GetName(PlayerIndex)
	local wife_name = GetName(wife)
	
	field[ITEMKEY_WIFE] = wife_name
	field[ITEMKEY_ROLE] = husband_name
	field[ITEMKEY_COST] = base_price
	field[ITEMKEY_STAT] = STATUS_BIDUP
	
	update_sharedata_str(date, param2, ITEMKEY_WIFE, wife_name)
	update_sharedata_str(date, param2, ITEMKEY_ROLE, husband_name)
	update_sharedata_int(date, param2, ITEMKEY_COST, base_price)
	update_sharedata_int(date, param2, ITEMKEY_STAT, STATUS_BIDUP)
	
	-- 记录竞投的日期时间和场地
	SetTask(TASK_WEDDING_COST, base_price)
	SetTask(TASK_WEDDING_DATE, subs_date)
	SetTask(TASK_WEDDING_FIELD, param2)
	
	bidup_hint(mon, day, period, type, base_price)
	WriteLog("[K誸 h玭]:"..GetName().."u gi� s﹏ kh蕌, t鑞"..base_price.." L� kim, th玭g tin:"..subs_date..","..param2);
end

-- 取回竞投的礼金
function rollback()
	if gf_JudgeRoomWeight(11,50) ~= 1 then
		Talk(1,"",g_InfoHeader.."Ngi c莕 s緋 x誴 l筰 h祅h l�, kho秐g tr鑞g kh玭g .");
		return 0;
	end;
	local cost = GetTask(TASK_WEDDING_COST)
	if (cost == 0) then
		return
	end
	local date = GetTask(TASK_WEDDING_DATE)
	local time, type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	if (cost > map_fieldinfo[type][3]) then
		cost = map_fieldinfo[type][3]
	end

	-- 如果是竞投领先，则不能取回竞投的礼金
	local fields = map_fields[date]
	if (fields ~= nil) then
		local times = map_fields[date][time]
		if (times ~= nil) then
			local types = times[type]
			if (types ~= nil and types[ITEMKEY_ROLE] == GetName()) then
				Talk(1,"",g_InfoHeader.."u gi� c馻 b筺 th蕄 h琻, kh玭g th� l蕐 l筰 L� kim!");
				return
			end
		end
	end
	-- 返还礼金
	AddItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], cost)
	clear_subs()
	Msg2Player(format("Ngi  t %d L� kim.", cost));
	-- TODO: 日志
	WriteLog("[K誸 h玭]:"..GetName().."Х c� ngi b� phi誹 cao h琻, nh薾"..cost.." L� kim");
end

-- 买断
function buy(year, mon, day, period, type)
	-- DEBUG
	gf_ShowDebugInfor(format("buy(%d,%d,%d,%d,%d)", year, mon, day, period, type))

	local subs_date = encode_date(year, mon, day)
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	
	if (check_marriage_condition(check_eachother_contract) == 0) then
		-- DEBUG
		gf_ShowDebugInfor("buy: check_marriage_condition fail")
		return
	end
		
	if ((task_date ~= 0 and task_date ~= subs_date) or
		(task_time ~= 0 and task_time ~= period) or
		(task_type ~= 0 and task_type ~= type)) then
		local task_year, task_mon, task_day = decode_date(task_date)
		Talk(1, "", format(g_InfoHeader.."B筺  t th竛g %d ng祔 %d_ %s %s",
			task_mon,
			task_day,
			map_period[task_time][5],
			map_fieldinfo[task_type][1]))
		return
	end

	-- 检查身上礼金是否足够
	local lost_count = GetTask(TASK_WEDDING_COST)
	local curr_count = GetItemCount(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3])
	local over_count = map_fieldinfo[type][2]	-- 买断价格
	local nPrice = map_fieldinfo[type][2]	--起标价
	if (lost_count + curr_count < over_count) then
		Talk(1, "", g_InfoHeader.."L� kim c馻 b筺 kh玭g  ")
		return
	end

	local field = map_fields[subs_date][period][type]
	-- 检查是否已经被买断
	if (field[ITEMKEY_STAT] == STATUS_OVER) then
		Talk(1, "", format(g_InfoHeader.."S﹏ kh蕌 n祔  頲 %s t", field[ITEMKEY_ROLE]))
		return
	end
	
	-- 检查竞投是否结束
	if (field[ITEMKEY_STAT] == STATUS_BIDUP) then
		if (cmp_datetime(field[ITEMKEY_CLOSEDATE], field[ITEMKEY_CLOSETIME], curr_date(), curr_time()) <= 0) then
			-- 竞投已经结束
			Talk(1, "", format(g_InfoHeader.."u gi� k誸 th骳, s﹏ kh蕌 頲 %s mua v韎 gi� %d L� kim",
				field[ITEMKEY_ROLE], field[ITEMKEY_COST]))
			return
		end
	end
	
	if (lost_count < over_count) then
		if DelItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], over_count - lost_count) ~= 1 then
			Talk(1, "", g_InfoHeader.."L� kim c馻 b筺 kh玭g  ")
			return 0;
		end;
	end

	local wife = get_team_lover(PlayerIndex)
	local param2 = encode_param2(period, type)
	local husband_name = GetName(PlayerIndex)
	local wife_name = GetName(wife)

	field[ITEMKEY_STAT] = STATUS_OVER
	field[ITEMKEY_WIFE] = wife_name
	field[ITEMKEY_ROLE] = husband_name
	field[ITEMKEY_COST] = over_count
	
	update_sharedata_int(subs_date, param2, ITEMKEY_STAT, STATUS_OVER)
	update_sharedata_str(subs_date, param2, ITEMKEY_WIFE, wife_name)
	update_sharedata_str(subs_date, param2, ITEMKEY_ROLE, husband_name)
	update_sharedata_int(subs_date, param2, ITEMKEY_COST, over_count)

	SetTask(TASK_WEDDING_COST, over_count)
	SetTask(TASK_WEDDING_DATE, subs_date)
	SetTask(TASK_WEDDING_FIELD, param2)
	
	buy_hint(mon, day, period, type, over_count)
	set_wedding_stat(1)		--表示竞标场地成功
	WriteLog("[K誸 h玭]:"..GetName().."D飊g th�"..(over_count - lost_count).." L� kim mua t s﹏ kh蕌,"..subs_date..","..encode_param2(period, type));
	SaveNow();
end

function process_qingqi_nofield()
	Say(g_InfoHeader.."Hai v� kh玭g mu鑞 t s﹏ kh蕌 n鱝 sao? Sau n祔 kh玭g th� n <color=red>thu�<color> n鱝.",
		2,
		"ng v藋, kh玭g thu� n鱝!/process_qingqi_nofield_confirm",
		"в ta suy ngh� l筰/cancel")
end

function process_qingqi_nofield_confirm()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	local sub_year, sub_mon, sub_day = decode_date(sub_date)
	local sub_period, sub_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	
	if (map_fields[sub_date] ~= nil) then	--如果之前没有订过场地，那么map_fields[0]就是nil
		local field = map_fields[sub_date][sub_period][sub_type]
		if (field[ITEMKEY_ROLE] == GetName()) then	--订了场地后还可以选择不用场地结婚吗？可以，过期了就可以重新选择了
			local caption = nil
			if (field[ITEMKEY_STAT] == STATUS_OVER) then	--买断后过期了
				caption = format(g_InfoHeader.."B筺  t <color=red>n╩ %d th竛g %d ng祔 %d<color>_<color=red>%s %s<color>, kh玭g th� h駓 b�",
					sub_year,
					sub_mon,
					sub_day,
					map_period[sub_period][5],
					map_fieldinfo[sub_type][1])
			else	--处于领取的情况下过期了
				caption = format(g_InfoHeader.."B筺  t <color=red>n╩ %d th竛g %d ng祔 %d_ %s<color> <color=red>%s<color>, kh玭g th� h駓 b�",
					sub_year,
					sub_mon,
					sub_day,
					map_period[sub_period][5],
					map_fieldinfo[sub_type][1])
			end
			Talk(1, "", caption)
			return
		end
	end
	
	-- 清除预定信息
	clear_subs()
	set_wedding_stat(1)
	Talk(1, "",g_InfoHeader.."Hai v� kh玭g k誸 h玭 � S﹏ kh蕌 c騨g kh玭g sao. Hai ngi c飊g t� i n <color=red>Th髖 Y猲<color> nh� <color=red>Nguy謙 L穙<color> ch鴑g gi竚 cho 2 ngi.")
	WriteLog("[K誸 h玭]:"..GetName().."Kh玭g d飊g s﹏ kh蕌 k誸 h玭.")
end

-- 显示我的婚礼场地情况
function show_myfield()
	local year, mon, day = decode_date(GetTask(TASK_WEDDING_DATE))
	local period, type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local this_year, this_mon, this_day = decode_date(curr_date())
	local this_hour, this_min, this_sec = decode_time(curr_time())
	local caption = format(g_InfoHeader.."B筺 t v祇 <color=red>th竛g %d ng祔 %d %s<color>-<color=red>%s<color>. B﹜ gi� l� <color=red>th竛g %d ng祔 %d %d gi� %d ph髏<color>! ",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		this_mon,
		this_day,
		this_hour,
		this_min)
	Talk(1, "", caption)
end

-- 亲迎
function process_qinying()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	local sub_period, sub_field = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local sub_hour = map_period[sub_period][1]
	local sub_min = map_period[sub_period][2]
	local sub_close_hour = map_period[sub_period][3]
	local sub_close_min	= map_period[sub_period][4]
	local sub_time = encode_time(sub_hour, sub_min, 0)	
	local sub_close_time = encode_time(sub_close_hour,sub_close_min,0);
	local nDesMapID = map_fieldpos[sub_field][1];
	if cmp_datetime(sub_date,sub_close_time,curr_date(), curr_time()) <= 0 then	--如果过期了还没结婚
		clear_subs();			--清除所有预定信息
		set_wedding_stat(0);	--表示未竞标成功
		set_wedding_step(4);	--回到请期阶段
		local selTab = {
				"Ta mu鑞 ch鋘 l筰 s﹏ kh蕌/process_qingqi_selectfield",
				"Ta mu鑞 h駓 h玭 c/disengage_talk",
				"Kh玭g c� g�/cancel",
				}
		Say(g_InfoHeader.."S﹏ kh蕌 k誸 h玭  qu� h筺",getn(selTab),selTab);
		return 0
	end;
	--如果时间到了并且结婚场地开了
	if (cmp_datetime(sub_date, sub_time, curr_date(), curr_time()) <= 0) and mf_GetMissionV(MISSION_ID,MV_FIELD_STATE,nDesMapID) ~= MS_STATE_IDEL then
		Say(g_InfoHeader.."Ch骳 m鮪g hai v�! дn g苝 <color=yellow>Ngi d蒼 chng tr譶h<color> sau  v祇 s﹏ kh蕌  c� h祅h h玭 l�. N誹 c莕 thu� trang ph鬰 hay trang s鴆 xin g苝 <color=yellow>H� Nng<color>",
			4,
			"Xem s﹏ kh蕌 h玭 l�/show_myfield",
			"Ta mu鑞 mua m閠 輙 v藅 ph萴/buy_thing",
			"Ta c莕 th玭g b竜 cho b籲g h鱱, h玭 l� b総 u/#global_annouce(1)",
			"Kh玭g mua/cancel")
	else
		talk = {
			"Ta mu鑞 mua thi謕 m阨 (T鑞"..BUY_QINGTIE_PACKET.." ti襫 v祅g)/talk_buy_invitation",
			"Ta c莕 th玭g b竜 cho b籲g h鱱 n nh薾 thi謕/#global_annouce(2)",
			"Ta mu鑞 th玭g b竜 cho to祅 th� ngi ch琲 th阨 gian k誸 h玭/#global_annouce(3)",						
			"Xem s﹏ kh蕌 h玭 l�/show_myfield",
			"в ta ngh� l筰/cancel"
		}
		Say(g_InfoHeader.."S﹏ kh蕌 k誸 h玭 c竎 ngi  t xong, m鋓 vi謈 li猲 quan n h玭 s� n誹 c莕 g� c� n t譵 ta.",
			getn(talk),
			talk)
	end
end

tAnnouce = {
	[1] = {20,"Th玭g b竜 cho t蕋 c� th﹏ thu閏 b籲g h鱱 bi誸 th阨 gian c� h祅h h玭 l� t鑞 <color=yellow>"..ANNOUCE_FRIENDS_BEGIN_COST.."<color> ti襫 v祅g, ngi ng � ch�?","L� th祅h h玭 c馻 T﹏ lang <color=red>%s<color> v� t﹏ nng <color=red>%s<color> b総 u. Nh鱪g ai mang theo thi謕 xin m阨 v祇 s﹏ kh蕌.","L� th祅h h玭 c馻 T﹏ lang %s v� T﹏ nng %s b総 u, nh鱪g ai mang theo thi謕 xin m阨 v祇 s﹏ kh蕌."},
	[2] = {20,"Th玭g b竜 cho b籲g h鱱 n nh薾 thi謕 c莕<color=yellow>"..ANNOUNCE_INVITAION_COST.."<color> ti襫 v祅g, ngi ng � ch�?","M阨 b籲g h鱱 c馻 T﹏ lang <color=red>%s<color> v� t﹏ nng <color=red>%s<color> n Dng Ch﹗ g苝 b� mai nh薾 <color=yellow>thi謕 m阨<color>","M阨 b籲g h鱱 c馻 T﹏ lang %s v� t﹏ nng %s n Dng Ch﹗ g苝 b� mai nh薾 thi謕 m阨 "},
	[3] = {20,"Th玭g b竜 cho to祅 th� V� l﹎ bi誸 r籲g b筺 s緋 th祅h h玭, c莕 <color=yellow>"..ANNOUNCE_ALL_PLAYER_COST.."<color> ti襫 v祅g, ngi ng � ch�?","T﹏ lang <color=red>%s<color> v� t﹏ nng <color=red>%s<color> s� c� h祅h h玭 l� v祇 n╩ <color=yellow>%d<color> th竛g <color=yellow>%d<color> ng祔 <color=yellow>%d<color> <color=yellow>%d<color> gi�!","T﹏ lang %s v� t﹏ nng %s s� c� h祅h h玭 l� v祇 %d-%d-%d! l骳 %d gi�."},
	}

function global_annouce(nType)
	Say(g_InfoHeader..tAnnouce[nType][2],
		2,
		format("уng �/#global_annouce_confirm(%d)",nType),
		"H駓 b�/cancel")	
end;

function global_annouce_confirm(nType)
	if Pay(tAnnouce[nType][1]*10000) == 1 then
		local nYear,nMonth,nDay = decode_date(GetTask(TASK_WEDDING_DATE));
		local nPeriod = decode_param2(GetTask(TASK_WEDDING_FIELD))
		local caption = format(tAnnouce[nType][3],
			GetName(), 
			GetMateName(),
			nYear,
			nMonth,
			nDay,
			map_period[nPeriod][1])
		local caption1 = format(tAnnouce[nType][4],
			GetName(), 
			GetMateName(),
			nYear,
			nMonth,
			nDay,
			map_period[nPeriod][1])
		AddGlobalNews(caption)
		Msg2Global(caption1);
	else
		Talk(1,"",g_InfoHeader.."Ngi kh玭g  ti襫 v祅g");
	end;
end;

function buy_thing()
	local selTab = {
				"Thu� y ph鬰 h玭 l�/buy_cloth",
				"Thu� y ph鬰 cho ch� h玭/buy_cloth2",
				"Thu� ki謚 hoa/buy_dooly",
				"Mua nh蒼 ci/buy_ring",
				"Ta mu鑞 mua thi謕 m阨 (T鑞"..BUY_QINGTIE_PACKET.." ti襫 v祅g)/talk_buy_invitation",
				"Kh玭g mua/process_qinying",
				};
	Say(g_InfoHeader.."V藅 ph萴  ph鬰 v� h玭 l� ch� ta kh玭g thi誹, ngi c莕 g�?",getn(selTab),selTab);
end;

function buy_cloth()
	local selTab = {
			"Ta mu鑞 thu� 1 b� l� ph鬰 (c莕"..HIRE_CLOTH_COST.."lng ti襫 v祅g)/buy_cloth_confirm",
			"Ta mu鑞 thu� 1 b� l� ph鬰 cho t﹏ nng ( c莕"..HIRE_CLOTH_COST.."lng ti襫 v祅g)/buy_bride_cloth_confirm",
			"в ta xem/buy_thing",
			"Kh玭g c莕 u/cancel",
			}
	Say(g_InfoHeader.."Thu� l� ph鬰 n閕 trong 24 gi� ph秈 ho祅 tr�. N誹 c莕 thu� l� ph鬰 cho t﹏ nng th� 2 ngi t� i n y g苝 ta",getn(selTab),selTab);
end;

function buy_cloth2()
	local selTab = {
			"Ta mu鑞 thu� 1 b� y ph鬰 cho ch� h玭 (c莕"..HIRE_CLOTH2_COST.."lng ti襫 v祅g)/buy_cloth2_confirm",
			"в ta xem/buy_thing",
			"Kh玭g c莕 u/cancel",
			}
	Say(g_InfoHeader.."Thu� y ph鬰 cho ch� h玭, n閕 trong 24 gi� ph秈 ho祅 tr�.",getn(selTab),selTab);
end;
--衣服编号与门派的对应关系
tCloth_Faction = {--头饰，衣服
		{131,173},
		{143,189},
		{147,193},
		{151,197},
		{155,201},
		{159,205},
		{163,209},
		{550,550},
		{554,554},
		{558,558},
		};
function buy_bride_cloth_confirm()
	if GetTeamSize() ~= 2 then
		Talk(1,"",g_InfoHeader.."T� i v韎 t﹏ nng c飊g n thu� l� ph鬰 nh�!");
		return 0;
	end;
	local nOldPlayerIndex = PlayerIndex;
	local nBrideIndex = get_team_lover(PlayerIndex);
	if get_lover_code(nBrideIndex) ~= Hash(GetName()) then
		Talk(1,"",g_InfoHeader.."Ngi ta ch糿g c� h玭 c g� v韎 ngi");
		return 0;
	end;
	PlayerIndex = nBrideIndex;
	if gf_JudgeRoomWeight(3,50) ~= 1 then
		PlayerIndex = nOldPlayerIndex
		Talk(1,"",g_InfoHeader.."Kho秐g tr鑞g trong h祅h trang kh玭g ");
		return 0;
	end;
	local nRetCode,nItemIdx = 0,0;
	local nFaction = GetPlayerFaction();
	local nBody = GetBody();
	PlayerIndex = nOldPlayerIndex;
	if Pay(HIRE_CLOTH_COST*10000) == 1 then
		PlayerIndex = nBrideIndex;
		nRetCode = AddItem(0,108,tCloth_Faction[nFaction][1]+nBody-1,1)
		local nCreateTime = GetTime();
		if nRetCode ~= 0 then
			Msg2SomeOne(nOldPlayerIndex,"Th祅h c玭g: "..GetName().." 1 c竔 n鉵")
			Msg2Player(GetName(nOldPlayerIndex).."Cho ngi thu� 1 c竔 n鉵");
			WriteLog("[K誸 h玭]:"..GetName(nOldPlayerIndex).."Cho "..GetName(nBrideIndex).."Thu� 頲 1 c竔 n鉵, nRetCode:"..nRetCode);
		end;
		nRetCode = AddItem(0,109,tCloth_Faction[nFaction][2]+nBody-1,1)
		if nRetCode ~= 0 then
			Msg2SomeOne(nOldPlayerIndex,"Th祅h c玭g: "..GetName().."Thu� 頲 1 b� l� ph鬰")
			Msg2Player(GetName(nOldPlayerIndex).."Cho ngi th� 1 b� l� ph鬰");
			WriteLog("[K誸 h玭]:"..GetName(nOldPlayerIndex).."Cho "..GetName(nBrideIndex).."Thu� 頲 1 c竔 n鉵, nRetCode:"..nRetCode);
		end;
	else
		Talk(1,"",g_InfoHeader.."Ti襫 v祅g c馻 b筺 kh玭g , c莕 <color=yellow>"..HIRE_CLOTH_COST.."<color> ti襫 v祅g.");
	end;
	PlayerIndex = nOldPlayerIndex;
end;
function buy_cloth_confirm()
	if gf_JudgeRoomWeight(3,50) ~= 1 then
		Talk(1,"",g_InfoHeader.."Kho秐g tr鑞g trong t骾 h祅h trang kh玭g ");
		return 0;
	end;
	local nRetCode,nItemIdx = 0,0;
	local nFaction = GetPlayerFaction();
	local nBody = GetBody();
	if Pay(HIRE_CLOTH_COST*10000) == 1 then
		nRetCode = AddItem(0,108,tCloth_Faction[nFaction][1]+nBody-1,1)
		local nCreateTime = GetTime();
		if nRetCode ~= 0 then
			Msg2Player("B筺 thu� 頲 1 c竔 n鉵");
			WriteLog("[K誸 h玭]:"..GetName().."Thu� 頲 1 c竔 n鉵, nRetCode:"..nRetCode);
		end;
		nRetCode = AddItem(0,109,tCloth_Faction[nFaction][2]+nBody-1,1)
		if nRetCode ~= 0 then
			Msg2Player("B筺 thu� 頲 1 b� l� ph鬰");
			WriteLog("[K誸 h玭]:"..GetName().."B筺 thu� 頲 1 b� l� ph鬰, nRetCode:"..nRetCode);
		end;
	else
		Talk(1,"",g_InfoHeader.."Ti襫 v祅g c馻 b筺 kh玭g , c莕 <color=yellow>"..HIRE_CLOTH_COST.."<color> ti襫 v祅g.");
	end;
end;

function buy_cloth2_confirm()
	local selTab = {
				"Nam ti猽 chu萵/#buy_cloth2_confirm2(1)",
				"Nam kh玦 ng�/#buy_cloth2_confirm2(2)",
				"N� g頸 c秏/#buy_cloth2_confirm2(3)",
				"Ki襲 n�/#buy_cloth2_confirm2(4)",
				"в ta xem/buy_thing",
				}
	Say(g_InfoHeader.."Xin ch鋘 size:",getn(selTab),selTab);
end;

function buy_cloth2_confirm2(nBody)
	if gf_JudgeRoomWeight(2,50) ~= 1 then
		Talk(1,"",g_InfoHeader.."Kho秐g tr鑞g trong t骾 h祅h trang kh玭g ");
		return 0;
	end;
	if Pay(HIRE_CLOTH2_COST*10000) == 1 then
		local nRetCode = AddItem(0,109,177+nBody-1,1)
		if nRetCode ~= 0 then
			Msg2Player("B筺 thu� 頲 1 b� l� ph鬰 cho ch� h玭.");
			WriteLog("[K誸 h玭]:"..GetName().."B筺 thu� 頲 1 b� l� ph鬰 cho ch� h玭, size:"..nBody)
		end;
	else
		Talk(1,"",g_InfoHeader.."Ti襫 v祅g c馻 b筺 kh玭g , c莕 <color=yellow>"..HIRE_CLOTH2_COST.."<color> ti襫 v祅g.");
	end;	
end;

function buy_dooly()
	local selTab = {
				"уng �/buy_dooly_confirm",
				"в ta xem/buy_thing",
				"Kh玭g c莕 u/cancel",
				}
	Say(g_InfoHeader.."Ngi c� mu鑞 thu� <color=yellow>Ki謚 hoa<color> kh玭g? T鑞 <color=yellow>"..BUY_DOOLY_COST.."<color> ti襫 v祅g",getn(selTab),selTab);
end;

function buy_dooly_confirm()
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"",g_InfoHeader.."Kho秐g tr鑞g trong t骾 h祅h trang kh玭g ");
		return 0;
	end;
	if Pay(BUY_DOOLY_COST*10000) == 1 then
		if AddItem(ITEM_DOOLY[1],ITEM_DOOLY[2],ITEM_DOOLY[3],1) ~= 0 then
			Msg2Player("B筺 thu� 頲 1 ki謚 hoa");
			WriteLog("[K誸 h玭]:"..GetName().."B筺 thu� 頲 1 ki謚 hoa")
		end;
	else
		Talk(1,"",g_InfoHeader.."Ti襫 v祅g c馻 b筺 kh玭g , c莕 <color=yellow>"..BUY_DOOLY_COST.."<color> ti襫 v祅g.");
	end;
end;

function buy_ring()
	local selTab = {
				"Ta mu鑞 mua nh蒼 nam/#buy_ring_confirm(1)",
				"Ta mu鑞 mua nh蒼 n�/#buy_ring_confirm(2)",
				"в ta xem/buy_thing",
				"Kh玭g c莕 u/cancel",
				}
	Say(g_InfoHeader.."Ngi mu鑞 mua <color=yellow>nh蒼<color> kh玭g? C莕 <color=yellow>"..BUY_RING_COST.."<color> ti襫 v祅g.",getn(selTab),selTab);
end;

function buy_ring_confirm(nType)
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"",g_InfoHeader.."Kho秐g tr鑞g trong t骾 h祅h trang kh玭g ");
		return 0;
	end;
	local nBuyRingInfo = GetTask(TASK_BUY_RING);
	if nType == 1 then
		if mod(nBuyRingInfo,10) ~= 0 then
			Talk(1,"",g_InfoHeader.."Ngi  mua nh蒼 nam, kh玭g th� mua ti誴.");
			return 0;
		end;
	else
		if floor(nBuyRingInfo/10) ~= 0 then
			Talk(1,"",g_InfoHeader.."Ngi  mua nh蒼 n�, kh玭g th� mua ti誴.");
			return 0;
		end;
	end;
	if Pay(BUY_RING_COST*10000) == 1 then
		if AddItem(0,102,103+nType,1) ~= 0 then
			if nType == 1 then
				SetTask(TASK_BUY_RING,nBuyRingInfo+1);	--把个位变成1
			else
				SetTask(TASK_BUY_RING,nBuyRingInfo+10);	--把十位变成1
			end;
			Msg2Player("B筺 mua 頲 1 chi誧 nh蒼");
			WriteLog("[K誸 h玭]:"..GetName().."Mua 頲 1 chi誧 nh蒼, lo筰:"..nType)
		end;
	else
		Talk(1,"",g_InfoHeader.."Ti襫 v祅g c馻 b筺 kh玭g , c莕 <color=yellow>"..BUY_RING_COST.." <color> ti襫 v祅g.");
	end;
end;

-- 购买请帖对话
function talk_buy_invitation()
	local nRetCode,nItemIdx = 0,0;
	if Pay(BUY_QINGTIE_PACKET*10000) == 1 then
		add_qingtie_packet(1)
	else
		Talk(1,"",g_InfoHeader.."Ti襫 v祅g c馻 b筺 kh玭g ");
	end;
end

map_process = {
	[0] = process_nacai,	-- 纳采
	[1] = process_nacai_boy,-- 纳采2
	[2] = process_wenming,	-- 问名
	[3] = process_naji,		-- 纳吉
	[4] = process_qingqi,	-- 请期
	[5] = process_qinying,	-- 亲迎
}
--初始化所有时段所有场地的信息
function init_date_field()
	local fields = {}
	-- 时段
	for j = 1, getn(map_period) do
		fields[j] = {}
		-- 场地
		for k = 1, getn(map_fieldinfo) do
			fields[j][k] = {
				[ITEMKEY_STAT] = STATUS_IDLE,
				[ITEMKEY_COST] = 0
			}
		end
	end
	return fields
end

apply_count = 0
recv_count 	= 0
inited 		= 0		-- 是否已经初始化

function main()
	local nDate = tonumber(date("%Y%m%d"))
	if tbGioiHanKetHon[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
		if nDate < tbGioiHanKetHon[GetGlbValue(GLB_TSK_SERVER_ID)] then
			Talk(1,"",g_InfoHeader.."Ch璦 n th阨 gian ng k� k誸 h玭, ngi h穣 quay l筰 sau nh�!!!");		
		do	return	end
		end
	end
	AddRelayShareData("wojiubuxinhuichongming_yj",0,0,CALLBACK_FILE,"callback_main",0,"key","d",0);
end;

function callback_main()	
	if GetGlbValue(GLB_CLOSE_MARRIAGE) == 1 then
		Talk(1,"",g_InfoHeader.."H玭 l�  k誸 th骳, xin h醝 ngi ph鬰 v�.");
		return 0;
	end;
	if (GetTask(TASK_WEDDING_DATE) == 0 and GetMateName() ~= "") or --选择不用场地结婚后
		(is_field_timeout() == 1 and GetMateName() ~= "") or --场地过期结婚后
		(GetSex() == 2 and GetMateName() ~= "") then	--女方结婚后
		local selTab= {
				" t�!/cancel",
				}
		Say(g_InfoHeader.."дn c秏 琻 ta �? Ch骳 c竎 ngi h筺h ph骳!",getn(selTab),selTab);
		return 0;
	end;
	if (inited == 0) then
		init()
		return
	end
	
	local step = get_wedding_step()
	-- DEBUG
	gf_ShowDebugInfor(format("main step:%d", step))
	local process = map_process[step]
	if (process) then
		process()
	end
end


function init()
	apply_count = 0
	recv_count = 0
	local days = future_days(0, FUTURE_DAY_COUNT + 2)
	for i = 1, getn(days) do
		-- 日期
		local date = days[i]
		-- 先把场地预订信息全部设为空闲
		map_fields[date] = init_date_field()
	
		-- 向relay请求场地预订信息
		for j = 1, getn(map_period) do
			for k = 1, getn(map_fieldinfo) do
				local param2 = encode_param2(j, k)
				ApplyRelayShareData(KEY_WEDDING, date, param2, CALLBACK_FILE, "hook_recvsubs")
				apply_count = apply_count + 1
			end
		end
	end
	WriteLog("[K誸 h玭]: S﹏ kh蕌 k誸 h玭");
end

-- DEBUG
-- 回调函数：读取场地预订信息
function hook_clearsubs(...)
	-- Do nothig	
end

-- 回调函数：读取场地预订信息
function hook_recvsubs(key, param1, param2, count)
	-- 该场地该时段空闲
	if (count ~= 0) then
		-- DEBUG
		gf_ShowDebugInfor(format("\nhook_recvsubs(%d,%d,%d)", param1, param2, count))
		local date = param1
		local period, type = decode_param2(param2)	
		local stat, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_STAT)
		local wife, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_WIFE)
		local role, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_ROLE)
		local cost, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_COST)
		local close_date, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_CLOSEDATE)
		local close_time, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_CLOSETIME)
		
		if (map_fields[date] == nil) then
			-- DEBUG
			gf_ShowDebugInfor(format("\nhook_recvsubs: init map_fields[%d]", date))
			map_fields[date] = {}
		end
		if (map_fields[date][period] == nil) then
			map_fields[date][period] = {}
		end
		if (map_fields[date][period][type] == nil) then
			map_fields[date][period][type] = {}
		end
		
		local field = map_fields[date][period][type]	--field相当于全局变量map_fields[date][period][type]的一个引用
		field[ITEMKEY_STAT] = stat
		field[ITEMKEY_WIFE] = wife
		field[ITEMKEY_ROLE] = role
		field[ITEMKEY_COST] = cost
		if (stat ~= STATUS_OVER) then
			field[ITEMKEY_CLOSEDATE] = close_date
			field[ITEMKEY_CLOSETIME] = close_time
		end
	end
	recv_count = recv_count + 1
	if (recv_count == apply_count) then
		inited = 1
		main()
	end
	WriteLog("[K誸 h玭]: S﹏ kh蕌 k誸 h玭 k誸 th骳");
end
