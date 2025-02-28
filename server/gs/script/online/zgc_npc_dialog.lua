------------------------------------------------------------------
--村长说：做游戏就像做爱，如果你不用心，-------
--到最后不爽的只会是自己。--2006-12-04
--                    ★
--              ☆◢◣☆   
--          ☆◢██◣★
--      ★◢████◣☆
--  ☆◢██████◣★
--                   █
------------------------------------------------------------------
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\zgc_public_virable.lua")
Include("\\script\\lib\\writelog.lua");

Include("\\script\\online\\newyear08\\newyear08_head.lua");--07圣诞活动

--2010年越南圣诞增加买外装对话，有时效到20100109
Include("\\script\\online_activites\\2010_12\\activites_02\\head.lua");

--======================================================帮会数据封装=================================================================================
--函数名称：帮会数据get
--功        能：按位取得帮会数据
File_name = "\\script\\online\\zgc_npc_dialog.lua"
function Zgc_pub_getconftask(id,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackGetConfTask")
end
function CallBackGetConfTask(szKey, nKey1, nKey2, nCount)
	local id = GetTaskTemp(158)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = tostring(floor(id/10)+1)
	local conf_data	= {}
	conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	if conf_data[id] == nil then
		conf_data[id] = 0 
	end
	local return_fun = "ConfDataGetReturn_"..fun_id.."("..conf_data[id]..")"
	dostring(return_fun)
end
--函数名称：帮会数据get
--功        能：按位设置帮会数据
function Zgc_pub_setconftask(id,value,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(159,value)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackSetConfTask")
end
function CallBackSetConfTask(szKey, nKey1, nKey2, nCount)
	local id = GetTaskTemp(158)
	local value = GetTaskTemp(159)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = ""
	suit_id = tostring(floor(id/10) + 1)			--计算大位置
													--取值]
	local conf_data	= {}
	conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	for i = 0, 9 do
		if conf_data[i] == nil then
			conf_data[i] = 0 
		end
	end
	local save_id = (id - (floor(id/10)*10))
	conf_data[save_id] = value
	local rtn_flag = AddRelayShareData(GetTongName(),0,0, File_name, "end_dialog", 0,suit_id, "dddddddddd", conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9])
	local return_fun = "ConfDataSetReturn_"..fun_id.."()"
	dostring(return_fun)
end
--=========================================================主函数====================================================================================
function main() 
        --by xiongyizhi 圣诞买外装对话
        if gf_CheckEventDateEx(VET_201012_02_EVENT_NUMBER) == 1 then
            VET_Buy_Xmas_Clothes()
            return 0;
        end

	local npc_index = GetTargetNpc()
	if npc_index == 0 then
		return
	end
	-----------------圣诞任务初始化
	if GetTask(960) ~= 1226 then			--数据初始化
		for j = 961,975 do
			SetTask(j,0)
		end
		SetTask(968,3456)					--奖励组成
		SetTask(960,1226)					--活动标志
	end
	-------------------结束
	-------------------NPC索引保存
	SetTaskTemp(164,npc_index)
	-------------------结束


	local npc_name = GetNpcName(npc_index)
	local i = 1
	for i = 1, getn(Npc_Dialog_Table) do
		if npc_name == Npc_Dialog_Table[i][1] then
			if getn(Npc_Dialog_Table[i]) == 2 then
				dostring(Npc_Dialog_Table[i][2])
			end
		end
	end
	local Xmas_tree_diff = GetUnitCurStates(npc_index,0)
	if Xmas_tree_diff == 1 then
		Xmas_Tree_A()
	elseif Xmas_tree_diff == 2 then
		conf_Xmas_tree(npc_index)
	end
end
--=============================================================角色删除功能=====================================================================================
function actor_deldialog()
	--do return end
	Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: Th� gi韎 giang h� c騨g c� ngi mu鑞 tung ho祅h, l筰 c騨g c� ngi mu鑞 萵 c�,"..Zgc_pub_sex_name()..", c� l� c騨g hi觰 頲 甶襲 n祔?",
	2,
	"ng v藋, ta ch竛 c秐h b玭 ba n祔 r錳!/actor_del_con_chk",
	"Ch� l� nh﹏ ti謓 gh� qua th玦!/end_dialog")
end
function actor_del_con_chk()
	if IsTongMember() == 1 or IsTongMember() == 2 or IsTongMember() == 3 then
		local conf_att = ""
		if IsTongMember() == 1 then
			conf_att = "Bang ch�"
		elseif IsTongMember() == 2 then
			conf_att = "Ph� bang"
		else
			conf_att = "Trng l穙"
		end
		Talk(1,"end_dialog","Ngi th藅 s� 頲 bang ch髇g ngng m�"..conf_att..", chuy謓 i s� nh� th� n祔 sao kh玭g c飊g bang ch髇g thng lng.  h閕 � bang ch髇g r錳 h穣 quay l筰.")
		return
	elseif (GetYinPiao(1) + GetYinPiao(2) + GetItemCount(2,1,198)) ~= 0 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: V� "..Zgc_pub_sex_name().." 甧m nhi襲 ng﹏ lng nh� th� n祔 (<color=red>Ng﹏ phi誹 l韓, Ng﹏ phi誹 nh�, b筩 l�<color>), l� n祇 kh玭g d飊g sao?",
		2,
		"Ta  c� quy誸 nh r錳/#actor_del_dem_1(3)",
		"Ta mu鑞 suy ngh� l筰/end_dialog"
		)
	elseif (GetTime() - GetCreateTime()) < 604800 and GetLevel() < 30  then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: Anh h飊g nh� ngi l筰 mau th鑙 ch� v藋 sao? C� g緉g l猲 n祇!",
		2,
		"Ta  c� quy誸 nh r錳/#actor_del_dem_1(1)",
		"Ta mu鑞 suy ngh� l筰/end_dialog")
	elseif GetReputation() >= 3000 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: Ngi, m閠 anh h飊g hi觧 h竎h nh� v藋 ch糿g l� l筰 th鑙 ch� r錳 �?",
		2,
		"Ta  c� quy誸 nh r錳/#actor_del_dem_1(3)",
		"Ta mu鑞 suy ngh� l筰/end_dialog")
	elseif GetTask(336) >= 4000 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: V� cao th� n祔  c鑞g hi課 nhi襲 cho qu� m玭 ph竔 b﹜ gi� r阨 kh醝 kh玭g th蕐 ti誧 nu鑙 g� sao?",
		2,
		"Ta  c� quy誸 nh r錳/#actor_del_dem_1(3)",
		"Ta mu鑞 suy ngh� l筰/end_dialog")		
	elseif (GetTime() - GetCreateTime()) >= 604800 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: Nh鱪g th竛g ng祔 vui bu錸 h祅h t萿 giang h� ch糿g l� c騨g ch糿g  l筰 m閠 蕁 tng n祇 khi課 ngi ph秈 l璾 luy課 sao?",
		2,
		"Ta  c� quy誸 nh r錳/#actor_del_dem_1(2)",
		"Ta mu鑞 suy ngh� l筰/end_dialog")
	elseif GetLevel() >= 30 then 
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: Ngi quy誸 nh nh� v藋 kh玭g c秏 th蕐 h鑙 h薾 �?",
		2,
		"Ta  c� quy誸 nh r錳/#actor_del_dem_1(2)",
		"Ta mu鑞 suy ngh� l筰/end_dialog")
	end
end
function actor_del_dem_1(actor_flag)
	local actor_dialog = {
		"B筺 ng � x鉧 nh﹏ v藅 n祔?",
		"Nh﹏ v藅 c馻 b筺 頲 b秓 l璾 7 ng祔 (168 gi� ). B筺 x竎 nh薾 x鉧 nh﹏ v藅 n祔 ch�?",
		"Nh﹏ v藅 c馻 b筺 頲 b秓 l璾 7 ng祔 (168 gi� ). B筺 x竎 nh薾 x鉧 nh﹏ v藅 n祔 ch�?"
	}
	Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: "..actor_dialog[actor_flag],
		2,
		"уng � x鉧/#actor_del_dem_2("..actor_flag..")",
		"Ta mu鑞 suy ngh� l筰/end_dialog"
	)	
end
function actor_del_dem_2(actor_flag)
	local actor_dialog = {
		"Th藅 ng ti誧, th� gi韎 giang h� l筰 m蕋 甶 m閠 ngi!",
		"Giang h� l筰 m蕋 甶 m閠 v� cao th�, nh璶g n閕 trong 7 ng祔 b籲g h鱱 quay l筰 v蒼 c遪 k辮!",
		"Ngi r阨 kh醝 th� gi韎 giang h� c竎 huynh  t� mu閕 u ti誧 nu鑙, n誹 mu鑞 quay l筰 n閕 trong 7 ng祔 v蒼 c遪 k辮."
	}
	actor_del(actor_flag)
	Talk(1,"end_dialog","<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: "..actor_dialog[actor_flag])
end
function actor_del(del_flag)
	if del_flag == 1 then
		--添加删除角色窗口
		EnableDeleteWaitFlag(1)
		EnableDeleteImmedFlag(1)
		ExitGame()		--t
		WriteLog(GetName().."X鉧 tr緉g.")
	else
		--增加删除角色标志
		EnableDeleteWaitFlag(1)
		ExitGame()  --t
		WriteLog(GetName().."L璾 v祇 danh s竎h x鉧.")
	end
	return
end
--========================================================圣诞活动==================================================================================
--------------------------------------------------------------主对话------------------------------------------------------
function Xmas_bishop_dialog()
	if zgc_pub_day_turn(1) >= Xmas_start_day and zgc_pub_day_turn(1) <= Xmas_end_day and IsTongMaster() ~= 1 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Gi竛g sinh vui v�!!",
		3,
		"nh薾 qu� Gi竛g sinh/get_Xmas_goods",
		"T譵 hi觰 ho箃 ng Gi竛g sinh/about_Xmas_feast",
		"K誸 th骳 i tho筰/end_dialog"
		)
		return
	elseif zgc_pub_day_turn(1) >= Xmas_start_day and zgc_pub_day_turn(1) <= Xmas_end_day and IsTongMaster() == 1 then
		conf_Xmas_tree_dialog()
	else
		if get_chrims_state() == 1 then --07年圣诞活动
			local strtab = {
				"Ta mu鑞 nh薾 Th玭g gi竛g sinh/get_chrims_tree",
				"Thuy誸 minh ho箃 ng Gi竛g Sinh Nguy猲 Цn/about_chrims_detail",
				"Th玦, ta kh玭g c莕/nothing"
				};
			Say("<color=green>"..GetNpcName(GetTaskTemp(164))..":<color>Gi竛g sinh l筰 n, ta ph鬾g m謓h thng  chu萵 b� c﹜ Gi竛g sinh n╩ nay, b筺 c� mu鑞 nh薾 kh玭g? L璾 �, trong th阨 gian t� <color=yellow>22/12/2008 n 23h 4/1/2009<color>, t� 1h s竛g n 23h m鏸 ng祔 c� th� n ch� ta  nh薾 c﹜ Gi竛g sinh, nh璶g m鏸 ng祔 ch� c� th� nh薾 1 c﹜ th玦. <color=yellow>Ngi ch琲 c蕄 99, l莕 u ti猲 nh薾 c﹜ Gi竛g sinh, c� th� nh薾 頲 th猰 1 c﹜.<color>",
				getn(strtab),
				strtab);
		else
			Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Tr阨 ph� h� cho ngi!",
				1,
				"K誸 th骳 i tho筰/end_dialog")
		end
	end
end
--****************************************个人圣诞树********************************
-------------------------------------------------------------活动物品添加----------------------------------------------
function get_Xmas_goods()
	if Zgc_pub_action_level_chk() ==0 then
		return
	end
	local get_turn = GetTask(961)
	if get_turn >= zgc_pub_day_turn(1) then
		Talk(1,"end_dialog","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Xin l鏸, h玬 nay ngi  nh薾 r錳. Ng祔 mai l筰 n nh�!")
		return
	else
		if Zgc_pub_goods_add_chk(getn(Xmas_goods),10) == 1 then
			local i = 0
			for i = 1, getn(Xmas_goods) do
				local add_flag = AddItem(Xmas_goods[i][1],Xmas_goods[i][2],Xmas_goods[i][3],Xmas_goods[i][4])
				if add_flag ==  1 then
					Msg2Player("B筺 nh薾 頲 "..Xmas_goods[i][4]..Xmas_goods[i][5]..Xmas_goods[i][6].."!")
				else
					WriteLog ("Ngi ch琲:"..GetName().."T╪g"..Xmas_goods[i][6].." th蕋 b筰, tr� quay v�:"..add_flag..".")
				end
			end
			SetTask(961,zgc_pub_day_turn(1))
			Talk(1,"end_dialog","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Xin nh薾 qu�, ch骳 m鋓 s� t鑤 l祅h!")
		else
			return
		end
	end
end
-------------------------------------------------------------圣诞活动解释----------------------------------------------
function about_Xmas_feast()
	Talk(3,"#about_Xmas_feast_1(1)",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Gi竛g sinh_ Ch骳 m鋓 ngi an b譶h vui v�!",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Ngi m鏸 ng祔 n ch� ta nh薾 m閠 <color=yellow>C﹜ Gi竛g sinh t藀 th�<color> v� 3 <color=yellow>V藅 ph萴 trang tr� <color>. Th玭g qua vi謈 tr錸g <color=yellow>C﹜ Gi竛g sinh<color> v� <color=yellow>trang tr� c﹜ Gi竛g <color>  nh薾 ph莕 thng!",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Th玭g qua l祄 c竎 nhi謒 v�: Thng h閕, S竧 Th�, Chi課 trng, s� m玭 c� th� nh薾 頲 <color=yellow>C﹜ Gi竛g sinh ki襲 di詍<color>, <color=yellow>C﹜ Gi竛g sinh l閚g l蓎<color> v� <color=yellow>V藅 ph萴 trang tr�<color>. C竎h tr錸g 2 c﹜ n祔 c騨g gi鑞g nh� c竎h tr錸g c馻 <color=yellow>C﹜ Gi竛g sinh t藀 th�<color>. Nh璶g nh� r籲g n誹 trang tr� nhi襲 qu� s� l祄 cho c﹜ <color=red>ng�<color> v� nh� th� s� kh玭g c� ph莕 thng."
	)
end
function about_Xmas_feast_1()
	Talk(2,"end_dialog",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>M鏸 ng祔 bang ch� c� th� nh薾 <color=yellow>C﹜ Gi竛g sinh bang h閕<color>, <color=yellow>C﹜ Gi竛g sinh t藀 th�<color>, <color=yellow>C﹜ Gi竛g sinh ki襲 di詍<color> ho芻 <color=yellow>C﹜ Gi竛g sinh l閚g l蓎<color> v� <color=yellow>V藅 ph萴 trang tr�<color> tng 鴑g.",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Trong th阨 gian di詎 ra ho箃 ng, m鏸 ng祔 t� <color=red>21:00<color> n <color=red>21:30<color> t筰 3 th祅h th� ch輓h bang ch� c� th� tr錸g <color=yellow>C﹜ Gi竛g sinh <color>, ng th阨 m鏸 th祅h vi猲 trong bang h閕 d飊g <color=red>khinh c玭g<color>  treo <color=yellow>v藅 ph萴 trang tr�<color>. Bang ch� ti <color=red>L� Th駓<color> <color=yellow>C﹜ Gi竛g sinh<color> mau t╪g c蕄. Khi <color=yellow>C﹜ Gi竛g sinh <color> trng th祅h s� nh薾 頲 v� s� qu�!"
	)
end
-------------------------------------------------------------圣诞树的对话----------------------------------------------
function Xmas_Tree_A()
	local Xmas_tree_index = GetTargetNpc()
	--判断是否是该玩家的树--
		local index_save = GetTask(963)
		if Xmas_tree_name_chk(Xmas_tree_index) ~= 1 then
			Msg2Player("Зy kh玭g ph秈 c﹜ Gi竛g sinh c馻 b筺!")
			return
		end
	--结束--
	local Tree_diff = GetUnitCurStates(Xmas_tree_index,4)
	local hang_time_remain = 300 - (GetTime() - GetUnitCurStates(Xmas_tree_index,1))	--300
	local tree_time_remian = 600 + hang_time_remain
	local hang_time_remain_str = "<color=yellow>"..Zgc_pub_time_sec_change(hang_time_remain,0).."<color>"
	local tree_time_remian_str = "<color=yellow>"..Zgc_pub_time_sec_change(tree_time_remian,0).."<color>"
	if hang_time_remain > 0 then
		if Zgc_pub_num_apart(Tree_diff,2) ~= 4 then
			Talk(1,"end_dialog","C﹜ Gi竛g sinh c馻 ngi ch璦  trng th祅h, c遪"..hang_time_remain_str.." m韎 c� th� trang tr�. N誹 nh� ngi "..tree_time_remian_str.."kh玭g ti誴 t鬰 ch╩ s鉩, c﹜ s� bi課 m蕋!")
			return
		else
			Talk(1,"end_dialog","C﹜ Gi竛g sinh c馻 ngi ch璦  trng th祅h, c遪"..hang_time_remain_str.." m韎 c� th� nh薾 thng, n誹 ngi"..tree_time_remian_str.."kh玭g ti誴 t鬰 ch╩ s鉩, c﹜ s� bi課 m蕋!")
			return
		end
	elseif Zgc_pub_num_apart(Tree_diff,3) == 1 then			--不需要传入数据，树的索引已经存入TaskID
		if Tree_diff < 140 then
			Say("N誹 b筺 產ng"..tree_time_remian_str.."kh玭g ti誴 t鬰 ch╩ s鉩, c﹜ s� bi課 m蕋!",
				3,
				"Ta ph秈 trang tr�/#Xmas_acc_select_A()",
				"Ta s� nh薾 thng/Xmas_prize_get",
				"R阨 kh醝/end_dialog"
			)
		else
			Say("N誹 b筺 產ng"..tree_time_remian_str.."kh玭g ti誴 t鬰 ch╩ s鉩, c﹜ s� bi課 m蕋!",
				2,
				"Ta s� nh薾 thng/Xmas_prize_get",
				"R阨 kh醝/end_dialog"
			)			
		end
	else
		if Zgc_pub_num_apart(Tree_diff,2) ~= 4 then
			Say("N誹 b筺 產ng"..tree_time_remian_str.."kh玭g ti誴 t鬰 ch╩ s鉩, c﹜ s� bi課 m蕋!",
				3,
				"Ta ph秈 trang tr�/#Xmas_acc_select(0)",
				"Ta s� nh薾 thng/Xmas_prize_get",
				"R阨 kh醝/end_dialog"
			)
		else
			Say("N誹 b筺 產ng"..tree_time_remian_str.."kh玭g ti誴 t鬰 ch╩ s鉩, c﹜ s� bi課 m蕋!",
				2,
				"Ta s� nh薾 thng/Xmas_prize_get",
				"R阨 kh醝/end_dialog"
			)
			
		end
	end

end
--------------------------------------------------------------饰物选择---------------------------------------------------
function Xmas_acc_select_A()
	local dialog_table = {}
	local goods_num = 0
		if GetItemCount(2,0,577) ~= 0 then
			Xmas_acc_hang(1,1)
		else
			Talk(1,"end_dialog","B筺 kh玭g c� v藅 ph萴 trang tr� ph� h頿!")
			return			
		end
end
-------------------------------------------------------------饰物罗列----------------------------------------------------
function Xmas_acc_select (page_num)
	local dialog_table = {}
	local goods_num = 0
	for i = 1,getn(Xmas_acc_table) do
		if GetItemCount(Xmas_acc_table[i][1],Xmas_acc_table[i][2],Xmas_acc_table[i][3]) ~= 0 then
			goods_num = goods_num +1
			dialog_table[goods_num] = Xmas_acc_table[i][4].."/#Xmas_acc_hang(0,"..i..")"
		end
	end
	if goods_num == 0 then
		Talk(1,"end_dialog","B筺 kh玭g c� v藅 ph萴 trang tr� c﹜ Gi竛g sinh")
		return
	else
		dialog_table[goods_num + 1] = "в ta ngh� xem/end_dialog"
		Say("    Treo th猰 v藅 ph萴 trang tr� s� gi髉 c﹜ Gi竛g sinh mau t╪g c蕄, <color=red>nh璶g treo nhi襲 qu� s� l祄 c﹜ b� ng�<color>. Ngi mu鑞 ch鋘 v藅 ph萴 trang tr� lo筰 n祇?",--
			getn(dialog_table),
			dialog_table
		)
	end
end
----------------------------------------------饰物删除，进入圣诞树升级函数------------------------------------
function Xmas_acc_hang(tree_flag,acc_seq)
	local del_flag = 0
	local goods_name = ""
	if tree_flag == 1 then
		del_flag = DelItem(2,0,577,1)
		goods_name = "V藅 tr.tr� th玭g GH"
	else
		del_flag = DelItem(Xmas_acc_table[acc_seq][1],Xmas_acc_table[acc_seq][2],Xmas_acc_table[acc_seq][3],1)
		goods_name = Xmas_acc_table[acc_seq][4]
	end
	if del_flag ~= 1 then
		Talk(1,"","X竎 nh薾 c�"..goods_name.."!")
		return
	else
		local Xmas_tree_index = GetTask(963)
		local tree_diff = GetUnitCurStates(Xmas_tree_index,4)
		if Zgc_pub_num_apart(tree_diff,3) == 1 then
			Xmas_tree_grow_A()
		else
			Xmas_tree_grow_other(Xmas_acc_table[acc_seq][3])
		end
	end
end
-----------------------------------------------------------圣诞A树挂饰物---------------------------------------------
function Xmas_tree_grow_A()
	local Xmas_tree_index = GetTask(963)
	local tree_grow_way = {
		{121,111,122,"C﹜ Gi竛g sinh 1c",1},
		{131,121,132,"C﹜ Gi竛g sinh 1b",2},
		{133,122,134,"C﹜ Gi竛g sinh 1b",2},
		{141,131,142,"C﹜ Gi竛g sinh 1a",3},
		{142,132,143,"C﹜ Gi竛g sinh 1a",3},
		{143,133,144,"C﹜ Gi竛g sinh 1a",3},
		{144,134,141,"C﹜ Gi竛g sinh 1a",3},
	}
	local hang_time_remain = 900 - (GetTime() - GetUnitCurStates(Xmas_tree_index,1))
	if hang_time_remain <= 0 then			--判断树是否还存在
		return
	end
	local MapID,att_X,att_Y	= GetNpcWorldPos(Xmas_tree_index)
	local Xmas_Tree_diff = GetUnitCurStates(Xmas_tree_index,4)
	SetNpcLifeTime(Xmas_tree_index,0)
	for i = 1 ,getn(tree_grow_way) do
		if Xmas_Tree_diff == tree_grow_way[i][2] then
			local random_num = random(1,2)					--随机分支
			if random_num == 2 then
				random_num = -1
			end
			local SFX_seq = Zgc_pub_num_apart(tree_grow_way[i][2+random_num],1)
			local tree_level = Zgc_pub_num_apart(tree_grow_way[i][2+random_num],2)
			
			local Xmas_tree_name = GetName().." tr錸g "..Conf_Xmas_tree_SQF_name[1][SFX_seq + 1].."-"..Conf_Xmas_tree_SQF_name[2][tree_grow_way[i][5]+1].."C﹜ th玭g gi竜 h閕"
			local new_tree_index = CreateNpc(tree_grow_way[i][4],Xmas_tree_name,MapID,att_X,att_Y,-1,1,0,0)
			SetNpcLifeTime(new_tree_index,900)
			--在此加入特效
				SetCurrentNpcSFX(new_tree_index,Xmas_tree_SFX_table[1][tree_level][SFX_seq],1,1)
			--特效结束
			SetUnitCurStates(new_tree_index,4,tree_grow_way[i][2 + random_num]) 	--写入树的类型
			SetUnitCurStates(new_tree_index,1,GetTime()) 							--写入种数的时间
			SetUnitCurStates(new_tree_index,0,1	) 									--写入种树区分
			SetUnitCurStates(new_tree_index,8,strlen(GetName())) 					--写入树的类型

			SetNpcScript(new_tree_index,"\\script\\online\\zgc_npc_dialog.lua")
			SetTask(962,GetTime())
			SetTask(963,new_tree_index)
		end
	end	
	Msg2Player("B筺  trang tr� c﹜ Gi竛g sinh th祅h c玭g!")
end
---------------------------------------------------------圣诞树BC挂饰物-------------------------------------------
function Xmas_tree_grow_other(acc_id)
	local tree_grow_way = {
		{211,212,213,214,311,312,313,314},
		{221,321,222,322,223,323,224,324,221},
		{334,234,333,233,332,331,234,232,334},
		{344,241,341,242,342,243,343,244,344},
		}
	local tree_index = GetTask(963)
	local hang_time_remain = 900 - (GetTime() - GetUnitCurStates(tree_index,1))
	if hang_time_remain <= 0 then			--判断树是否还存在
		return
	end
	SetNpcLifeTime(tree_index,0)
	if random(1,10) == 3 then				--倒树，倒树，惊起鸳鸯无数
		Talk(1,"end_dialog","Xin l鏸, v� treo nhi襲 v藅 ph萴, c﹜ gi竛g sinh c馻 b筺  b� ng�!")
		SetTask(963,0)
		SetTask(962,0)
		return
	end
	local MapID,att_X,att_Y	= GetNpcWorldPos(tree_index)
	local tree_diff = GetUnitCurStates(tree_index,4)
	local tree_level = Zgc_pub_num_apart(tree_diff,2)
	local even_flag = 0					--是否偶数判断标志
	if acc_id == floor(acc_id/2) * 2 then
		even_flag = 1
	end
	local new_tree_diff = 0
	for i = 1, 8 do
		if tree_diff == tree_grow_way[tree_level][i] then
			new_tree_diff = tree_grow_way[tree_level+1][i+even_flag]
		end
	end
	local new_tree_SFC = Zgc_pub_num_apart(new_tree_diff,1)					--特效
	local new_tree_level = Zgc_pub_num_apart(new_tree_diff,2)				--树的等级
	local new_tree_sign = Zgc_pub_num_apart(new_tree_diff,3)				--树的类型
	local Xmas_tree_name = GetName().." tr錸g "..Conf_Xmas_tree_SQF_name[1][new_tree_SFC + 1].."-"..Conf_Xmas_tree_SQF_name[2][new_tree_level].."C﹜ th玭g gi竜 h閕"
	local new_tree_index = CreateNpc(Xms_tree_npc_name[new_tree_level][new_tree_sign],Xmas_tree_name,MapID,att_X,att_Y,-1,1,0,0)
	SetNpcLifeTime(new_tree_index,900)
	--在此加入特效
	SetCurrentNpcSFX(new_tree_index,Xmas_tree_SFX_table[new_tree_sign][new_tree_level][new_tree_SFC],1,1)
	--特效结束
	SetUnitCurStates(new_tree_index,4,new_tree_diff) 
	SetUnitCurStates(new_tree_index,1,GetTime()) 			--写入种数的时间
	SetUnitCurStates(new_tree_index,0,1) 
	SetUnitCurStates(new_tree_index,8,strlen(GetName())) 					--写入树的类型
	SetNpcScript(new_tree_index,"\\script\\online\\zgc_npc_dialog.lua")
	SetTask(962,GetTime())
	SetTask(963,new_tree_index)
	Msg2Player("B筺  trang tr� c﹜ Gi竛g sinh th祅h c玭g!")
end
--------------------------------------------------------------圣诞树奖励-----------------------------------------------
function Xmas_prize_get()
	local tree_index = GetTask(963)
	SetNpcLifeTime(tree_index,0)
	local Tree_diff = GetUnitCurStates(tree_index,4)
	local Xmas_tree_prize = {
						{{1000,5000,10000,15000},{200000,300000,400000,500000}},
						{{300000,600000,900000,1000000},{200000,300000,400000,500000},"ModifyGoldenExp(","甶觤 s鴆 kh醗"},
						{{10,20,40,40,},{5,10,15,20},"ModifyReputation("," 甶觤 danh v鋘g!"},
						{2000,4000,6000,8000},					
						}
	local prize_seq_1 = Zgc_pub_num_apart(Tree_diff,3)
	local prize_seq_2 = Zgc_pub_num_apart(Tree_diff,2)
	local prize_seq_3 = Zgc_pub_num_apart(Tree_diff,1)
	if prize_seq_1 < 1 or prize_seq_1 > 4 or prize_seq_2 < 1 or prize_seq_2 > 4 or prize_seq_3 < 1 or prize_seq_3 > 4 then
		WriteLog ("Ngi ch琲:"..GetName().."Tham s� ph莕 thng l鏸:["..prize_seq_1.."]: ["..Tree_diff.."]")
		return	
	end
	--领取奖励后任务记录数据清0
	SetTask(963,0)
	SetTask(962,0)
	local num = 0
	if prize_seq_1 == 1 then			--教会圣诞树
		num = (GetLevel() - 10) * Xmas_tree_prize[1][1][prize_seq_2]
		ModifyExp(num)
		Msg2Player("B筺 nh薾 頲 "..num.." 甶觤 kinh nghi謒!")
		----------------------------------------教会圣诞树特殊奖励---------------------------------------
		local Xmas_tree_prize_A = {
			{{0,108,109,"N鉵 gi竛g sinh chu萵"},{0,108,139,"Tu� Th� qu竛"},{0,109,109,"Thng y gi竛g sinh chu萵"},{0,109,185,"Tu� Th� b祇"},{0,110,73,"H� y Gi竛g sinh chu萵"},{0,110,81,"Tu� Th� ngoa"}},  
			{{0,108,110,"N鉵 gi竛g sinh kh玦 ng�"},{0,108,140,"Ch輓h S鉩 m穙"},{0,109,110,"Gi竛g sinh kh玦 ng�"},{0,109,186,"Ch輓h S鉩 gi竝"},{0,110,74,"Trang ph鬰 gi竛g sinh kh玦 ng�"},{0,110,82,"Ch輓h S鉩 ngoa"}},
			{{0,108,112,"N鉵 gi竛g sinh g頸 c秏"},{0,108,141,"T﹏ Ch輓h k誸"},{0,109,112,"Thng y gi竛g sinh g頸 c秏"},{0,109,187,"T﹏ Ch輓h thng"},{0,110,76,"H� y gi竛g sinh n� g頸 c秏"},{0,110,83,"T﹏ Ch輓h qu莕"}},
			{{0,108,111,"N鉵 gi竛g sinh nh�"},{0,108,142,"Nguy猲 Ch輓h tr﹎"},{0,109,111,"Thng y gi竛g sinh Ki襲 n�"},{0,109,188,"Nguy猲 Ch輓h thng"},{0,110,75,"Gi竛g sinh Ki襲 n�"},{0,110,84,"Nguy猲 Ch輓h qu莕"}}	
			}
		local player_model = GetBody()
		if GetTask(968) ~= 0 and random(1,10) == 7 then
			local prize_num = GetTask(968)
			local prize_str = tostring(GetTask(968))
			local prize_num_save = 0
			local prize_seq = 0
			if strlen(prize_str) == 1 then
				prize_seq = prize_num
			else
				local ran_num = random(1,strlen(prize_str))
				prize_seq = Zgc_pub_num_apart(prize_num,ran_num)				--取出第几位的值
				ran_num = strlen(prize_str) - ran_num + 1
				prize_num_save = Zgc_pub_num_peel(prize_num,ran_num)			--把该位值剥离
				end
			local add_flag = AddItem(Xmas_tree_prize_A[player_model][prize_seq][1],Xmas_tree_prize_A[player_model][prize_seq][2],Xmas_tree_prize_A[player_model][prize_seq][3],1)
			if add_flag ==  1 then
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 "..Xmas_tree_prize_A[player_model][prize_seq][4])
			end
			SetTask(968,prize_num_save)
		end
		if GetTask(964) == 4 then				--第四棵教会圣诞树给旧版帽子
			AddItem(Xmas_tree_prize_A[player_model][1][1],Xmas_tree_prize_A[player_model][1][2],Xmas_tree_prize_A[player_model][1][3],1)
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 "..Xmas_tree_prize_A[player_model][1][4])
		end
		if GetTask(964) == 8 then				--第八棵圣诞树给新版帽子
			AddItem(Xmas_tree_prize_A[player_model][2][1],Xmas_tree_prize_A[player_model][2][2],Xmas_tree_prize_A[player_model][2][3],1)
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 "..Xmas_tree_prize_A[player_model][2][4])
		end
		if GetTask(964) == 10 and GetTask(968) ~= 0 then		--种第十次把所有未给的装备给了。
			local prize_num = GetTask(968)
			local prize_str = tostring(GetTask(968))
			for i = 1,strlen(prize_str) do
				local prize_seq = Zgc_pub_num_apart(prize_num,i)
				AddItem(Xmas_tree_prize_A[player_model][prize_seq][1],Xmas_tree_prize_A[player_model][prize_seq][2],Xmas_tree_prize_A[player_model][prize_seq][3],1)
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1"..Xmas_tree_prize_A[player_model][prize_seq][4])
			end
			SetTask(968,0)
		end
		--帮会圣诞树饰物的奖励
		if prize_seq_2 == 4 then
			AddItem(Conf_acc_table[1][1],Conf_acc_table[1][2],Conf_acc_table[1][3],1)
			Msg2Player("B筺 nh薾 頲 1"..Conf_acc_table[1][4]..", b筺 c� th� d飊g nh鱪g v藅 ph萴 n祔 trang tr� l猲 c﹜ Gi竛g sinh bang h閕 ho芻 t苙g l筰 cho ngi kh竎.")
		end
		--------------------------------------------------结束--------------------------------------------------
	else
		if prize_seq_1 == 2 then
			num = Xmas_tree_prize[prize_seq_1][1][prize_seq_2]
			if num > GetGoldenExp() then
				num = GetGoldenExp()
			end
			ModifyGoldenExp(-num)
			ModifyExp(num)
			if num ~= 0 then
				Msg2Player("B筺 d飊g"..num.."甶觤 s鴆 kh醗 i 甶觤 kinh nghi謒.")
			end
		elseif prize_seq_1 == 3 then
			num = Xmas_tree_prize[prize_seq_1][1][prize_seq_2]
			ModifyReputation(num,0)
			Talk(1,"end_dialog","B筺 nh薾 頲 "..num.." 甶觤 danh v鋘g!")
			local exp_num = (GetLevel()-10) * Xmas_tree_prize[4][prize_seq_3]
			ModifyExp(exp_num)
			Msg2Player("B筺 nh薾 頲 "..exp_num.." 甶觤 kinh nghi謒!")	
		end
		
		if prize_seq_2 == 4 then
			local conf_acc_seq_table = random(2,getn(Conf_acc_table))
			AddItem(Conf_acc_table[conf_acc_seq_table][1],Conf_acc_table[conf_acc_seq_table][2],Conf_acc_table[conf_acc_seq_table][3],1)
			Msg2Player("B筺 nh薾 頲 1"..Conf_acc_table[conf_acc_seq_table][4]..", b筺 c� th� d飊g nh鱪g v藅 ph萴 n祔 trang tr� l猲 c﹜ Gi竛g sinh bang h閕 ho芻 t苙g l筰 cho ngi kh竎.")	
		end
	end
	Xmas_SFX_prize(prize_seq_3,prize_seq_2)
end
----------------------------------------------特效的奖励--------------------------------------------
function Xmas_SFX_prize(SFX_diff,SFX_level)
	local Xmas_SFX_prize_table = {
		{200000,300000,400000,500000},
		{200000,300000,400000,500000},
		{5,10,15,20},
		{2500,3000,3500,4000}
	}
	local num = Xmas_SFX_prize_table[SFX_diff][SFX_level]
	if SFX_diff == 1 then			--经验
		ModifyExp(num)
		Msg2Player("B筺 nh薾 頲 "..num.." 甶觤 kinh nghi謒!")			
	elseif SFX_diff == 2 then		--健康经验
		ModifyGoldenExp(num)
		Msg2Player("B筺 nh薾 頲 "..num.."甶觤 s鴆 kh醗")
	elseif SFX_diff == 3 then		--修为
		ModifyReputation(num,0)
		Talk(1,"end_dialog","B筺 nh薾 頲 "..num.." 甶觤 danh v鋘g!")	
	else
		ModifyPopur(num)
		Msg2Player("B筺 nh薾 頲 "..num.." 甶觤 tu luy謓!")	
	end
end
--***************************************帮会圣诞树*********************************
----------------------------------------------------------传教士对话---------------------------------------------
function conf_Xmas_tree_dialog()
	Zgc_pub_getconftask(1,1)				--位置、函数序号
end
function ConfDataGetReturn_1(data_value)
	if data_value >= zgc_pub_day_turn(1) then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Gi竛g sinh vui v�!!",
			3,
			"nh薾 qu� Gi竛g sinh/get_Xmas_goods",
			"T譵 hi觰 ho箃 ng Gi竛g sinh/about_Xmas_feast",
			--"什么是圣诞呀？/about_Xmas",
			"R阨 kh醝/end_dialog"
		)
	else
		Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Gi竛g sinh vui v�!!",
			4,
			"Nh薾 c﹜ Gi竛g sinh bang h閕/get_conf_Xmas_tree",
			"nh薾 qu� Gi竛g sinh/get_Xmas_goods",
			"T譵 hi觰 ho箃 ng Gi竛g sinh/about_Xmas_feast",
			--"什么是圣诞呀？/about_Xmas",
			"R阨 kh醝/end_dialog"
			)
	end
end
-----------------------------------------------------帮会圣诞树给予-------------------------------------------------
function get_conf_Xmas_tree()
	if IsTongMaster() ~= 1 then
		Talk(1,"end_dialog","Ch� c� bang ch� m韎 c� th� nh薾 頲 c﹜ Gi竛g sinh bang h閕!")
		return
	elseif Zgc_pub_action_level_chk () ~= 1 then
			return
	else
		if Zgc_pub_goods_add_chk(1,10) == 1 then
			Zgc_pub_setconftask(1,zgc_pub_day_turn(1),1)		--位置、值、函数序号
		else
			return
		end
	end
end
function ConfDataSetReturn_1()
	local add_flag = AddItem(2,0,576,1)
	Msg2Player("B筺  nh薾 頲 c﹜ Gi竛g sinh bang h閕")
end
------------------------------------------------帮会圣诞树对话------------------------------------------
function conf_Xmas_tree(conf_Xmas_tree_index)
	if IsTongMember() == 0 then
		Talk(1,"end_dialog","    Gia nh藀 bang h閕 m韎 c� th� trang tr� c﹜ Gi竛g sinh.")
		return
	end
	if Conf_Xmas_tree_name_chk(conf_Xmas_tree_index) ~= 1 then
		Talk(1,"end_dialog","     Зy ch糿g ph秈 l� c﹜ Gi竛g sinh c馻 qu� bang sao?")
		return
	end
	--人物等级判断
	if Zgc_pub_action_level_chk() ~= 1 then
		return
	end
	local conf_Xmas_tree_diff = GetUnitCurStates(conf_Xmas_tree_index,4)
	local conf_tree_level =  Zgc_pub_num_apart(conf_Xmas_tree_diff,2)
	local conf_tree_build_time = GetUnitCurStates(conf_Xmas_tree_index,1)
	local conf_tree_acc_A = GetUnitCurStates(conf_Xmas_tree_index,2)
	local conf_tree_acc_B = GetUnitCurStates(conf_Xmas_tree_index,3)
	local conf_tree_acc_total = (conf_tree_acc_A + conf_tree_acc_B)

	local conf_Xmas_time_distance = GetTime() - conf_tree_build_time
	SetTaskTemp(163,conf_Xmas_tree_index)			--写入树的索引
	
	if conf_Xmas_tree_diff < 40 then
		local wt_than_max = ""					-- 是否超重的警告，只用在1-3级就可以了。
		if (conf_tree_acc_A + conf_tree_acc_B) > Conf_Xmas_acc_wt_max[conf_tree_level] then
			wt_than_max = "<color=red>V藅 ph萴 trang tr� qu� n苙g c� th� s� r琲 xu鑞g!<color>"
		end
		local conf_Xmas_tree_life_time = 600 - conf_Xmas_time_distance
		local conf_Xmas_tree_update_time = 300 - conf_Xmas_time_distance
		
		local conf_Xmas_update_dialog = ""
		if conf_Xmas_tree_update_time < 0 then
			conf_Xmas_update_dialog = "    C﹜ gi竛g sinh c馻 qu� bang  t╪g c蕄, c� th� ti誴 t鬰 trang tr� nh璶g n誹 <color=yellow>".. Zgc_pub_time_sec_change(conf_Xmas_tree_life_time,0).."<color> kh玭g t╪g c蕄 c﹜ s� bi課 m蕋."..wt_than_max
		else
			conf_Xmas_update_dialog = "    C﹜ Gi竛g sinh c馻 qu� bang c遪 ph秈 i <color=yellow>"..Zgc_pub_time_sec_change(conf_Xmas_tree_update_time,0).."<color> m韎 c� th� t╪g c蕄, c� th� ti誴 t鬰 trang tr�, n誹 nh� <color=yellow>".. Zgc_pub_time_sec_change(conf_Xmas_tree_life_time,0).."<color> kh玭g t╪g c蕄 c﹜ s� bi課 m蕋."..wt_than_max
		end
		if IsTongMaster() == 1 and (GetTime() - conf_tree_build_time) > 300 then
			Say(conf_Xmas_update_dialog,
			3,
			"Ta c莕 ph秈 gi髉 c﹜ Gi竛g sinh c馻 bang h閕 t╪g c蕄 (c莕 m閠 ph莕 L� th駓)/cong_Xmas_tree_up",
			"Ta ph秈 trang tr�/conf_Xmas_tree_hang_acc",
			"R阨 kh醝/end_dialog")
		else
			Say(conf_Xmas_update_dialog,
			2,
			"Ta ph秈 trang tr�/conf_Xmas_tree_hang_acc",
			"R阨 kh醝/end_dialog")		
		end
	else
		local conf_Xmas_tree_life_time_lv4 = 1800 - conf_Xmas_time_distance
		
		Say("C﹜ Gi竛g sinh c馻 qu� bang  t n ng c蕄 cao nh蕋, c� th� n <color=yellow>"..Zgc_pub_time_sec_change(conf_Xmas_tree_life_time_lv4,0).."<color> nh薾 ph莕 thng.",
		2,
		"Ta s� nh薾 thng/conf_Xmas_tree_get_prize",
		"R阨 kh醝/end_dialog")
	end	
end
----------------------------------------------帮会圣诞树饰物选择---------------------------------------------
function conf_Xmas_tree_hang_acc()
	local dialog_table = {}
	local acc_num = 0
	for i = 1 ,getn(Conf_acc_table) do
		if GetItemCount(Conf_acc_table[i][1],Conf_acc_table[i][2],Conf_acc_table[i][3]) ~= 0 then
			acc_num = acc_num + 1
			dialog_table[acc_num] = Conf_acc_table[i][4].."/#conf_acc_select("..Conf_acc_table[i][3]..")"
		end
	end	
	dialog_table[acc_num + 1] = "в ta ngh� xem/end_dialog"
	if acc_num == 0 then
		Talk(1,"end_dialog","B筺 kh玭g c� v藅 ph萴 trang tr� ph� h頿!")
		return
	end
	Say("Ch鋘 v藅 trang tr� cho c﹜ Gi竛g sinh c馻 bang h閕 b筺:",
		getn(dialog_table),
		dialog_table
	)
end
function conf_acc_select(acc_id)
	SetTaskTemp(162,acc_id)
	Talk(1,"end_dialog","Ngi c� th� d飊g khinh c玭g  treo v藅 trang tr� l猲 c﹜ Gi竛g sinh.")
end
--------------------------------------------帮会圣诞树升级操作------------------------------------
function cong_Xmas_tree_up()
	if IsTongMaster() ~= 1 then
		Talk(1,"end_dilog","    Ch� c� bang ch� m韎 c� th� t╪g c蕄 c﹜ Gi竛g sinh bang h閕.")
		return
	end
	local conf_tree_index = GetTaskTemp(163)
	if Conf_Xmas_tree_name_chk(conf_tree_index) ~= 1 then
		Talk(1,"end_dialog","    Зy ch糿g ph秈 l� c﹜ Gi竛g sinh c馻 qu� bang sao?")
		return
	end
	local conf_tree_build_time = GetUnitCurStates(conf_tree_index,1)
	if GetTime() - conf_tree_build_time > 600 then			--判断树是否还存在
		Talk(1,"end_dialog","    c﹜ Gi竛g sinh c馻 qu� bang  bi課 m蕋!")	
		return
	end
	--露水
	if GetItemCount(2,0,351) == 0 then
		Talk(1,"end_dialog","    T╪g c蕄 cho c﹜ Gi竛g sinh bang h閕 c莕 ph秈 c� {L� Th駓}")
		return
	end
	--露水删除
	if DelItem(2,0,351,1) ~= 1 then
		Talk(1,"end_dialog","    X竎 nh薾 trong h祅h trang c馻 b筺 c� 甧m theo {L� th駓}  t╪g c蕄 c﹜ Gi竛g sinh.")
		return	
	end
	--旧数据的读取
	local conf_tree_diff = GetUnitCurStates(conf_tree_index,4)
	local conf_tree_SQF_seq = Zgc_pub_num_apart(conf_tree_diff,1)
	local conf_tree_level = Zgc_pub_num_apart(conf_tree_diff,2)
	local conf_tree_acc_A = GetUnitCurStates(conf_tree_index,2)
	local conf_tree_acc_B = GetUnitCurStates(conf_tree_index,3)
	local conf_player_num = GetUnitCurStates(conf_tree_index,6)
	--新数据的定义
	local New_conf_tree_level = conf_tree_level + 1					--新树等级
	local New_conf_tree_SQF_seq = 0									--新树特效
	if conf_tree_acc_A >= 10 then									--A的数量必须〉10个
		local num_step_distance = 0 
		if conf_tree_acc_B >= Conf_Xmas_grow_way[New_conf_tree_level][4][3] then
			if New_conf_tree_level ~= 2 then
				num_step_distance = (4 - conf_tree_SQF_seq) * 7
			end
			if random(1,100) <= (Conf_Xmas_grow_way[New_conf_tree_level][5] - num_step_distance) then
				New_conf_tree_SQF_seq = 4
			else
				New_conf_tree_SQF_seq = 3
			end
		else
			for i = 1,4 do
				if conf_tree_acc_B >= Conf_Xmas_grow_way[New_conf_tree_level][i][2] and conf_tree_acc_B < Conf_Xmas_grow_way[New_conf_tree_level][i][3] then
					if New_conf_tree_level ~= 2 then
						num_step_distance = (i - conf_tree_SQF_seq) * 7
					end
					if random(1,100) <= (Conf_Xmas_grow_way[New_conf_tree_level][i][1] - num_step_distance) then
						New_conf_tree_SQF_seq = i
					else
						New_conf_tree_SQF_seq = i - 1
					end
					break
				end
			end
		end
	end
	local map_ID,att_X,att_Y = GetNpcWorldPos(conf_tree_index)
	local conf_Xmas_tree_name = GetTongName().." tr錸g "..Conf_Xmas_tree_SQF_name[1][New_conf_tree_SQF_seq+1].."-"..Conf_Xmas_tree_SQF_name[2][New_conf_tree_level].."C﹜ th玭g gi竜 h閕"
	local new_conf_Xmas_tree_index = CreateNpc(Xms_tree_npc_name[New_conf_tree_level][4],conf_Xmas_tree_name,map_ID,att_X,att_Y,6,1,1,0)
	SetNpcLifeTime(conf_tree_index,0)
	SetNpcScript(new_conf_Xmas_tree_index,"\\script\\online\\zgc_npc_dialog.lua")
	--四级的树只能领取奖励，应该把trap点去掉
	if New_conf_tree_level == 4 then
		for i = - Conf_Xmas_trap_att,Conf_Xmas_trap_att do
			for j = - Conf_Xmas_trap_att,Conf_Xmas_trap_att do
				AddMapTrap(map_ID,((att_X + i) * 32),((att_Y + j) * 32),0)
			end
		end
		SetNpcLifeTime(new_conf_Xmas_tree_index,1800)												--存活时间30分钟
		--帮会公告
		local map_name = Zgc_pub_mapID_name_change(map_ID,1) 
		if map_name ~= 0 then
			SendTongMessage("T筰"..map_name.."C﹜ Gi竛g sinh c馻 qu� bang  th╪g l猲 c蕄 4, c� th� nh薾 ph莕 thng.")
		end
	else
		SetNpcLifeTime(new_conf_Xmas_tree_index,600)													--存活时间10分钟
	end
	--将圣诞树的2、3位数据清空
	SetUnitCurStates(new_conf_Xmas_tree_index,2,0)
	SetUnitCurStates(new_conf_Xmas_tree_index,3,0)
	SetUnitCurStates(new_conf_Xmas_tree_index,0,2)
	SetUnitCurStates(new_conf_Xmas_tree_index,6,conf_player_num)
	SetUnitCurStates(new_conf_Xmas_tree_index,8,strlen(GetTongName()))
	--特效设置
	if New_conf_tree_SQF_seq ~= 0 then
		SetCurrentNpcSFX(new_conf_Xmas_tree_index,Xmas_tree_SFX_table[4][New_conf_tree_level][New_conf_tree_SQF_seq],1,1)
	end
	local new_conf_tree_diff = (New_conf_tree_level * 10) + New_conf_tree_SQF_seq
	SetUnitCurStates(new_conf_Xmas_tree_index,4, new_conf_tree_diff)					--写入树的类型
	SetUnitCurStates(new_conf_Xmas_tree_index,1, GetTime())								--写入种数的时间		
	WriteLog ("Bang h閕"..GetTongName().."C蕄:"..New_conf_tree_level.."Ъng c蕄 hi謚 qu� c bi謙:"..New_conf_tree_SQF_seq)
end
--------------------------------------------------------帮会圣诞树奖励获得-------------------------------------------------------------
function conf_Xmas_tree_get_prize()
	local conf_Xmas_tree_index = GetTaskTemp(163)
	if conf_Xmas_tree_index == 0 then
		return
	end
	if Conf_Xmas_tree_name_chk(conf_Xmas_tree_index) ~= 1 then
		Talk(1,"end_dialog","Зy ch糿g ph秈 l� c﹜ Gi竛g sinh c馻 qu� bang sao?")
		return
	end
	--每个人每天只能获得一次帮会奖励，注意后面要zgc_pub_day_turn(1)写入
	if GetTask(975) >= zgc_pub_day_turn(1) then					
		Talk(1,"end_dialog","H玬 nay ngi  nh薾 ph莕 thng c馻 bang h閕, ng祔 mai l筰 n nh�!")
		return
	end
	local conf_Xmas_tree_prize = {
		{1000,1000,1},
		{2000,2000,5},
		{5000,3000,8},
		{10000,5000,10},
		{20000,10000,20}
	}
	if Zgc_pub_goods_add_chk(1,10) == 0 then
		return
	end
	--今天上交的饰物个数
	local conf_Xmas_acc_up_flag = 0				
	if GetTask(973) == zgc_pub_day_turn(1) then
		conf_Xmas_acc_up_flag = 1					
	end
	local conf_Xmas_tree_diff = GetUnitCurStates(conf_Xmas_tree_index,4)
	local conf_Xmas_tree_SQF = Zgc_pub_num_apart(conf_Xmas_tree_diff,1) + 1
	local Player_level_diff = (GetLevel() - 10)
	if conf_Xmas_acc_up_flag == 1 then
		ModifyExp((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1] + conf_Xmas_tree_prize[conf_Xmas_tree_SQF][2]) * Player_level_diff)
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1] + conf_Xmas_tree_prize[conf_Xmas_tree_SQF][2])*Player_level_diff).." 甶觤 kinh nghi謒!")
		WriteLog (GetName().."ng"..((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1] + conf_Xmas_tree_prize[conf_Xmas_tree_SQF][2]) * Player_level_diff).." 甶觤 kinh nghi謒!")
	else
		ModifyExp((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1])*Player_level_diff)
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1])*Player_level_diff).." 甶觤 kinh nghi謒!")
		WriteLog (GetName().."ng"..((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1])*Player_level_diff).." 甶觤 kinh nghi謒!")
	end
	SetTask(975,zgc_pub_day_turn(1))
	if IsTongMaster() == 1 and GetUnitCurStates(conf_Xmas_tree_index,5) ~= 37 then
		local player_num = GetUnitCurStates(conf_Xmas_tree_index,6)
		local goods_num = floor((GetUnitCurStates(conf_Xmas_tree_index,6)/50) * conf_Xmas_tree_prize[conf_Xmas_tree_SQF][3]) + 1
		if goods_num > conf_Xmas_tree_prize[conf_Xmas_tree_SQF][3] then
			goods_num = conf_Xmas_tree_prize[conf_Xmas_tree_SQF][3]
		end
		SetUnitCurStates(conf_Xmas_tree_index,5,37)
		AddItem(2,0,545,goods_num)
		SendTongMessage("Nh薾 ph莕 thng c﹜ Gi竛g sinh bang h閕:"..goods_num.." Sinh Th莕 Cang!")
		WriteLog ("Bang h閕"..GetTongName().."Х nh薾 "..goods_num.." Sinh Th莕 Cang!")
	end
end
--=============================================================end=====================================================================================

--===============================07年圣诞活动==========================
function get_chrims_tree()
	local nLv = GetLevel();
	if nLv < 40 then
		Talk(1,"","<color=green>"..GetNpcName(GetTaskTemp(164))..":<color>Ъng c蕄 c馻 b筺 qu� th蕄, t� c蕄 40 tr� l猲 m韎 c� th� tham gia ho箃 ng n祔.");
		return
	end
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_GET_TREE) >= nDate then
		Talk(1,"","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color> H玬 nay ngi  nh薾 1 c﹜ Th玭g gi竛g sinh r錳, ng祔 mai h穣 n.");
		return
	end 
	if Zgc_pub_goods_add_chk(2,2) ~= 1 then
		return 
	end
	local Add_flag = AddItem(2,0,574,1); --圣诞树id
	if Add_flag == 1 then
		SetTask(TASK_GET_TREE,nDate);
		if GetTask(TASK_TAIYI_TUPU) == 0 and GetLevel() == 99 then
			SetTask(TASK_TAIYI_TUPU,1);
			AddItem(2,0,574,1);
			Talk(1,"","<color=green>"..GetNpcName(GetTaskTemp(164))..":<color> t� b筺  駈g h� V� L﹎ 2 trong th阨 gian qua. Gi竛g sinh l筰 v�, xin t苙g b筺 l� v藅 Gi竛g Sinh! B筺  nh薾 頲 th猰 m閠 <color=yellow>c﹜ Gi竛g Sinh<color> n鱝, ch骳 b筺 ch琲 vui v�!");
		else
			Talk(1,"","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color> c莔 甶, Th玭g gi竛g sinh c馻 ngi y, n誹 mu鑞 bi誸 c竎h trang tr� Th玭g gi竛g sinh, v� Th玭g gi竛g sinh c� nh鱪g ph莕 thng n祇, c� th� xem thuy誸 minh.");
		end
	else
		WriteLog("[07 ho箃 ng Gi竛g Sinh nh薾 Th玭g gi竛g sinh]"..GetName().."Nh薾 Th玭g gi竛g sinh th蕋 b筰, ti猽 ch� th蕋 b筰:"..Add_flag);
	end
end

function about_chrims_detail()
	local strtab = {			
					"Trang tr� Th玭g gi竛g sinh th� n祇/how_strew_tree",
					"Trang tr� Th玭g gi竛g sinh nh薾 頲 ph莕 thng n祇/about_tree_award",
					"T譵 hi觰 ho箃 ng b竔 s�/about_newyear08_bai",
					"Ta ch� n xem th�/nothing"
					}	
	Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color> B筺 mu鑞 t譵 hi觰 phng di謓 n祇?",
		getn(strtab),
		strtab)
end

function how_strew_tree()
	Talk(1,"how_strew_tree2","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color> c� 頲 Th玭g gi竛g sinh xong, c� th� s� d鬾g � m鋓 n琲 (nh蕄 chu閠 tr竔 s� d鬾g). C� hai l鵤 ch鋘\nM閠, t Th玭g gi竛g sinh\nHai, kh玭g, t sau\nCh鋘 t Th玭g gi竛g sinh xong, tr猲 m苩 t s� xu蕋 hi謓 Th玭g gi竛g sinh, b筺 c� th� trang tr� Th玭g gi竛g sinh v� nh薾 ph莕 thng.\nCh鋘 'Kh玭g, t sau', s� tho竧 kh醝 l鵤 ch鋘. \nM鏸 l莕 t Th玭g gi竛g sinh k衞 d礽 nhi襲 nh蕋 30 ph髏, sau 30 ph髏 t� ng thu l筰, mu鑞 trang tr� ph秈 t l筰.");
end

function how_strew_tree2()
	Talk(1,"how_strew_tree3","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color> Khi b筺 t Th玭g gi竛g sinh xong, c� th� thao t竎 tr猲 Th玭g gi竛g sinh\n C� th� t譵 ki誱 n閕 dung tr猲 Th玭g gi竛g sinh nh� sau\nM閠, trang tr� Th玭g gi竛g sinh\nHai, nh薾 ph莕 thng trang tr� Th玭g gi竛g sinh\nBa, nh薾 qu� Gi竛g Sinh\nB鑞, thu l筰 Th玭g gi竛g sinh");
end

function how_strew_tree3()
	Talk(1,"about_chrims_detail","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color> Trang tr� Th玭g gi竛g sinh c� th� l祄 Th玭g gi竛g sinh p h琻, c遪 c� th� nh薾 ph莕 thng trang tr� Th玭g gi竛g sinh, m鏸 l莕 trang tr� Th玭g gi竛g sinh xong, ph莕 thng nh薾 頲 l莕 sau s� 畊頲 nh﹏ i cho n khi ho祅 t蕋 trang tr� Th玭g gi竛g sinh. \nN誹 b筺 h礽 l遪g v韎 Th玭g gi竛g sinh m譶h trang tr� c� th� nh薾 qu� Gi竛g sinh cu鑙 c飊g, c莕 ch� �, nh薾 qu� xong, Th玭g gi竛g sinh s� bi課 m蕋. N誹 kh玭g h礽 l遪g, suy ngh� xem m譶h c� mu鑞 nh薾 qu� kh玭g. \nNgo礽 qu� trang tr� Th玭g gi竛g sinh ph� th玭g, c遪 c� m閠 s� thi謕 ch骳 do c竎 gi竜 s� l祄  t苙g cho c竎 i m玭 ph竔. B筺 c� c鑞g hi課 cho s� m玭 s� nh薾 頲 thi謕 ch骳 n祔.");	
end

function about_tree_award() --免费区为经验
	Talk(1,"about_tree_award2","<color=green>"..GetNpcName(GetTaskTemp(164))..":<color>M鏸 l莕 trang tr� c﹜ Gi竛g Sinh b筺 u c� c� h閕 nh薾 頲 ph莕 thng, v� ph莕 thng kinh nghi謒. Khi c﹜ Gi竛g Sinh c馻 b筺  t n m鴆 cao nh蕋 th� c� th� nh薾 頲 ph莕 thng cu鑙 c飊g. Ph莕 thng cu鑙 c飊g, ngo礽 甶觤 kinh nghi謒 phong ph�, c遪 c� c� h閕 nh薾 頲 Linh th筩h qu� hi誱.\nD鵤 v祇 ng c蕄 m� b筺 s� nh薾 頲 nh鱪g ph莕 thng kh竎 nhau. Ъng c蕄 c祅g cao th� ph莕 thng nh薾 頲 c祅g nhi襲.<color=yellow> L璾 �, n誹 b筺   kinh nghi謒 c馻 c蕄 99, th� s� kh玭g th� nh薾 th猰 kinh nghi謒.<color>\nNgo礽 ra, l骳 b筺 nh薾 頲 ph莕 thng cu鑙 c飊g, d鵤 v祇 tr譶h  trang tr� c﹜ Gi竛g Sinh, c遪 c� x竎 su蕋 nh薾 頲 tu莕 l閏 Gi竛g Sinh, T﹏ Nguy猲 Ngo筰 Trang v� Tri襲 Hoa Ngo筰 Trang.\nM鏸 ng祔, b筺 c遪 c� c� h閕 tr� th祅h ng玦 sao Gi竛g Sinh, nh薾 頲 g蕄 i ph莕 thng kinh nghi謒 trong l骳 nh薾 ph莕 thng cu鑙 c飊g.");
end

function about_tree_award2()
	Talk(1,"about_chrims_detail","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>3 V� l﹎ cao th� c馻 Trung Nguy猲, Thng Th莕 Doanh Thi猲, b綾 L鬰 l﹎ minh ch� v� L穘h Hng L╪g cp 頲 r蕋 nhi襲 Th玭g gi竛g sinh c馻 t輓 , ch髇g ta l� Qu� , n誹 ngi mu鑞 畂箃 l筰 Th玭g gi竛g sinh, t飝 ngi. \nNh璶g ph莕 l韓 Th玭g gi竛g sinh u kh玭g d飊g 頲. \nM鏸 ngi ch� 頲 trang tr� 2 c﹜ Th玭g gi竛g sinh m閠 ng祔.");
end

function about_newyear08_bai()
	Talk(1,"about_chrims_detail","<color=green>"..GetNpcName(GetTaskTemp(164))..":<color>N╩ m韎 l筰 n, xin ch骳 trong n╩ m韎 b筺 s� nh薾 頲 nhi襲 ni襪 vui h琻 n╩ qua. C� nh﹏ n鉯, trong ba ngi 甶 tr猲 阯g 総 c� ngi l祄 th莥 ta, v� v藋 b筺 h穣 n g苝 nh鱪g ngi m筺h h琻 m譶h  th豱h gi竜 kinh nghi謒 giang h�.\nu ti猲 b筺 h穣 t� i v韎 ngi b筺 mu鑞 th豱h gi竜, ng c蕄 c馻 i phng ph秈 cao h琻 b筺, th鵦 hi謓 ng t竎 'b竔'  th� hi謓 th祅h � c馻 b秐 th﹏, i phng s� p l筰 � nguy謓 c馻 b筺. N誹 hai ngi t﹎ u � h頿, c� th� s� nh薾 頲 ph莕 thng g蕄 i.\nL璾 �, m鏸 ng祔 m鏸 ngi ch� c� th� th豱h gi竜 kinh nghi謒 giang h� m閠 l莕, cho n猲 ph秈 ch鋘 cho m譶h l穙 s� th藅 t鑤. Ngi ch琲 c蕄 99 ph秈 t譵 ngi ch琲 c飊g ng c蕄  t� i. N誹 kinh nghi謒  y th� kh玭g th� nh薾 th猰 kinh nghi謒 n鱝.");
end
