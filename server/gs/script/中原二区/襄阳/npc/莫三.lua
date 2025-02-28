-- =========================================
-- File : 中原二区，襄阳，莫三.lua
-- Name : 莫三
-- ID   : 1, 4
--2007-02-28：太虚任务增加
--增加内容：太虚任务莫三的对话、奖励
--策划人：沈洋
--代码编写人：村长
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");
Include("\\script\\task\\lifeskill\\skill_lvlup.lua");
--太虚任务增加
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\task\\lingshi_task.lua")
taixu_jwl_taskID = 998
taixu_jwl_iron_up_num = 996							--提交的铁数量
taixu_jwl_list = {
	{"Th竔 H� Huy詎 Ng鋍",29,"C鰑 Thi猲 Huy襫 Ng鋍",129},
	{"Th竔 H� Huy詎 Цi ",30,"C鰑 Thi猲 Huy襫 Цi",130},
	{"Th竔 H� Huy詎 Ho祅",31,"C鰑 Thi猲 Huy襫 Ho祅",131},
	{"Th竔 H� Huy詎 B閕",32,"C鰑 Thi猲 Huy襫 B閕",132},
	{"Th竔 H� Huy詎 Gi韎",33,"C鰑 Thi猲 Huy襫 Gi韎",133},
	{"Th竔 H� Huy詎 Чi",34,"C鰑 Thi猲 Huy襫 Чi",134},
	{"Th竔 H� Huy詎 Th筩h",35,"C鰑 Thi猲 Huy襫 Th筩h",135}
}
mystery_goods_list = {
	{"Ch﹏ th�",2,1,112},
	{"T� kh竛g Th駓",2,1,114},
	{"Ph� Thi猲 Cung",2,1,115},
	{"Xng r錸g",2,1,116},
	{"T髖 Ti猲 C骳",2,1,117},
	{"Thi Vng L芻 C鑤",2,1,118},
	{"Thi Kh� B譶h",2,1,119},
	{"Qu秐 T�",2,1,120},
	{"T骾 Phi Ng�",2,1,121},
	{"B譶h Song Tinh",2,1,122},
	{"Xng s�",2,1,124},
	{"T� H錸 nh",2,1,125},
	{"L筽 Ho祅",2,1,126},
	{"D琲 c",2,1,127},
	{"Quan m穙",2,1,128},
	{"M藅 S竧 L謓h",2,1,129},
	{"Ch蕁 Thi猲 Tuy誸",2,1,130},
	{"Di襲",2,1,132},
	{"Con r鑙",2,1,133},
	{"T祇 Ng﹏",2,1,134},
	{"Hoa Th筩h Cng",2,1,135},
	{"D莡 甧n",2,1,136},
	{"Trng Th祅h K輓h",2,1,137},
	{"B秐 ch� T蕋 Th╪g",2,1,138},
	{"Kh� S琻 ch�",2,1,140},
	{"L玦 Vi猰 Kim Sa",2,1,146},
	{"Thi猲 Y V� Phong",2,1,147}
}
taixu_jwl_up_met_table = {
	{2,1,533,"Tinh luy謓 B╪g Th筩h",2500,1000,0,100,2,1,562,"Cng h鉧 tinh kim"},
	{2,1,533,"Tinh luy謓 B╪g Th筩h",50,20,0,50,2,1,560,"Cng h鉧 tinh kim s� c蕄"},
	{2,1,560,"Cng h鉧 tinh kim s� c蕄",50,20,0,30,2,1,561,"Cng h鉧 tinh kim trung c蕄"},
	{2,1,561,"Cng h鉧 tinh kim trung c蕄",50,20,0,20,2,1,562,"Cng h鉧 tinh kim"}
}
--结束

--*****************************************定义常量及预处理*********************************
ID_LEARNLIFESKILL			= 1925
LEV_LEARNRECIPE				= 1926		-- 配方学习任务变量
LEVELTASKID49				= 517		-- 吞龙宝刀任务
TASKID_LIFESKILL_FLG		= 1932		-- 49任务组队随机数
TASK_GATHER_FLAG			= 1931		-- 任务物品采集标示
TASK49_BEGGING				= 1933		-- 49级晋级任务开始标示
FORGETMAIN_NUM				= 1940		-- 遗忘主技能次数
FORGETOHTER_NUM				= 1941		-- 遗忘主技能次数
HaveWeekend					= 1938		-- 周末配方学习任务变量
strName = "";
strTitle = "";

--*****************************************MAIN函数*****************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","Х qu� 5 gi� ch琲, h穣 ngh� ng琲  gi� g譶 s鴆 kh醗!")
	 	return
	 end
	strName = GetTargetNpcName()
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Tuy ngi c� th� theo ta h鋍 c竎h ch� t筼 trang b� c� linh kh�, nh璶g mu鑞 t譵 hi觰 trang b� B竧 Qu竔, ngi n猲 甶 t譵 ngi c馻 C玭g D� Th� Gia!");
	end;
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "

	-----------------------------------------新手任务-----------------------------------------
    if (GetTask(ID_LEARNLIFESKILL) < 15) then
		Say(strTitle.."дn <color=yellow>C蕄 10<color> c� th� n <color=yellow>Th祅h Й<color> g苝 <color=yellow>Du Phng i phu<color> t譵 hi觰 <color=yellow>k� n╪g s鑞g<color>!", 0)
		TaskTip("дn c蕄 10 c� th� n Th祅h Й t譵 Du Phng i phu.")        
		return 
    end
    
 ---------------------------------------------主对话-------------------------------------------
	--太虚任务增加
	local taixu_task_step = GetTask(taixu_jwl_taskID)
	local taixu_dia_mo3 = ""
	--结束
	if taixu_task_step == nil or taixu_task_step == 0 then
	    local strtab = {
	    	"H鋍 k� n╪g ch� t筼 K� M玭 binh kh�/luaLearnLifeSkill",
	    	"H鋍 c竎h ph鑙 ch� ho芻 l祄 nhi謒 v� ph鑙 ch�/learn_all_recipe",
	    	"Qu猲 k� n╪g ch� t筼 K� M玭 binh kh�/forget_life_skill",
--	    	"Nh鱪g 甶襲 li猲 quan v� trang b� B竧 Qu竔/bagua",
			"H鋍 c竎h l祄 v� kh� linh kh� c蕄 76/xinwuqi",
	    	"T譵 hi觰 v藅 ph� gia/Dating"
	       	}
			if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
				tinsert(strtab,"ti誴 t鬰 nhi謒 v� h鋍 t藀 Linh Th筩h B竧 Qu竔/task_new3");
			end
			if GetLifeSkillMaxLevel(1, 4) == 79 then
				tinsert(strtab, "Mu鑞 h鋍k� n╪g cao c蕄 h琻/update_max_skill_level");
			end 
			tinsert(strtab,"R阨 kh醝/SayHello");  		    	
	    Say(strTitle.."D遪g h� ta n鎖 ti課g b雐 ngh� c ki誱, ngi c� c莕 ta gi髉 g� kh玭g?",
	    	getn(strtab),
	    	strtab)
	else 
		local qijin_get_flag = BigGetItemCount(2,1,563)
		local qianghua_jin_get_flag = BigGetItemCount(2,1,562)
		if taixu_task_step == 1 then
			taixu_dia_mo3 = "Ta c莕 t╪g c蕄 trang s鴆 Th竔 H�/taixu_jwl_dia_step1"
		elseif qianghua_jin_get_flag == 0 then
			taixu_dia_mo3 = "Ta c莕 luy謓 cng h鉧 tinh kim/taixu_jwl_up_iron"
		elseif qianghua_jin_get_flag ~= 0 and qijin_get_flag == 0 then
			taixu_dia_mo3 = "Ta mu鑞 nh薾 Thi誸 ch飝/mo3_hammer_add"
		elseif qianghua_jin_get_flag ~= 0 and qijin_get_flag ~= 0 then
			taixu_dia_mo3 = "K� Kim ta  mang n r錳, b総 u luy謓 th玦./taixu_jwl_up_jwl"
		end
	  local strtab = {
	    	"H鋍 k� n╪g ch� t筼 K� M玭 binh kh�/luaLearnLifeSkill",
	    	"H鋍 c竎h ph鑙 ch� ho芻 l祄 nhi謒 v� ph鑙 ch�/learn_all_recipe",
	    	"Qu猲 k� n╪g ch� t筼 K� M玭 binh kh�/forget_life_skill",
	    	"T譵 hi觰 v藅 ph� gia/Dating",
			"H鋍 c竎h l祄 v� kh� linh kh� c蕄 76/xinwuqi",
				taixu_dia_mo3
	       }
			if GetTask(TASK_LINGSHI_ID) == 2 then
				tinsert(strtab,"ti誴 t鬰 nhi謒 v� h鋍 t藀 Linh Th筩h B竧 Qu竔/task_new3");
			end
			if GetLifeSkillMaxLevel(1, 4) == 79 then
				tinsert(strtab, "Mu鑞 h鋍k� n╪g cao c蕄 h琻/update_max_skill_level");
			end 
			tinsert(strtab,"R阨 kh醝/SayHello");  	    	  	  
	    Say(strTitle.."D遪g h� ta n鎖 ti課g b雐 ngh� c ki誱, ngi c� c莕 ta gi髉 g� kh玭g?",
	    	getn(strtab),
	    	strtab);		
	end
end;


-- 所有配方相关的事情
function learn_all_recipe()
	Say(strTitle.."Ngi mu鑞 h鋍 c竎h ph鑙 ch� ho芻 l祄 nhi謒 v� ph鑙 ch�?",
		8,
		"H鋍 c竎h ph鑙 ch� m韎/luaLearnRecipe",
		"H鋍 ph鑙 ch� trang b� Linh у/learnLtEquip",
		"H鋍 ph鑙 ch� v� kh� Th髖 Y猲/learnCyEquip",
		"H鋍 c竎h ph鑙 ch� d祅h cho ho箃 ng cu鑙 tu莕/Weekend",
		"Xem nh薾 頲 nhi謒 v� v� kh� c蕄 76 kh玭g/get_76_task",
		"H鋍 c竎h ph鑙 ch� c蕄 76/relearn_76_recipe",
		"Ph鑙 gh衟 B� H鋍 Tr秓/luaLearnRecipeZhua",
		"R阨 kh醝/SayHello")
end;


-- 接受76级配方任务
function get_76_task()
	----------------------------------------76级武器配方任务-------------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_76 = GetTask(TASK_76WEAPON)
		
	if (nSkillGenre == 1 and nSkillDetail == 4 and nSkillLevel >= 79) then
		--尚未触发配方任务
		if nTaskState_76 == 0 then
			weapon_76_001(3);
			return
		--上交武器
		elseif nTaskState_76 == 1 then
			weapon_76_002(3);
			return
		--未与五位掌门对话
		elseif nTaskState_76 == 2 then
			weapon_76_004(3);
			return
		--已经与五位掌门对话
		elseif nTaskState_76 == 3 then
			weapon_76_005(3);
			return
		--选择学习神兵的方向
		elseif nTaskState_76 == 4 then
			weapon_76_choice(3);
			return
		end 
	end
		
	--提示玩家76级武器配方任务
	if (nSkillGenre == 1 and nSkillDetail ~= 4 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillDetail)
	end
	
	Say("B筺 ch璦  甶襲 ki謓 nh薾 nhi謒 v� ph鑙 ch� c蕄 76.", 0)
end;


-- 补学76级配方
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 4)
	if (nGene == 1 and nSkillID == 4) then
		if (GetTask(1600) == 5 and nLevel >= 79) then
			if (HaveLearnRecipe(796) == 0 and 
				HaveLearnRecipe(798) == 0 and 
				HaveLearnRecipe(799) == 0 and 
				HaveLearnRecipe(802) == 0 and 
				HaveLearnRecipe(803) == 0) then
				Say("H穣 ch鋘 1 lo筰 v� kh� b筺 mu鑞 h鋍 c竎h ch� t筼:",
					6,
					"竚 kh�/learn_long_1",   
					"C莔/learn_long_2",  
					"B髏/learn_long_3",    
					"Cung/learn_long_4",
					"Tr秓/learn_long_5",
					"Ta suy ngh� l筰/SayHello")
			else
				Say("B筺  h鋍 頲 phng ph竝 ph鑙 ch� m韎!", 0)
			end
		else
			Say("B筺 v蒼 ch璦 ho祅 th祅h nhi謒 v� ch� t筼 K� M玭 binh kh�!", 0)
		end
	else
		Say("B筺 v蒼 ch璦 h鋍 k� n╪g s鑞g:<color=yellow>ch� t筼 K� M玭 binh kh�<color>!", 0)
	end
end;
-- 暗器
function learn_long_1()
	AddRecipe(796)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: M穘 Thi猲 Hoa V�")
end;
-- 琴
function learn_long_2()
	AddRecipe(798)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Hi Nh﹏ C莔")
end;
-- 笔
function learn_long_3()
	AddRecipe(799)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th莕 H祅h")
end;
-- 弓
function learn_long_4()
	AddRecipe(802)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th莕 Cung")
end;
-- 爪
function learn_long_5()
	AddRecipe(803)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: M穘h H�")
end;



-- 遗忘生活技能
function forget_life_skill()
	if (GetLifeSkillLevel(1, 4) > 0) then
		local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- 主技能
		local nShouldPay = 5000
		if (nForgetTimes == 0) then
			nShouldPay = 5
		elseif (nForgetTimes == 1) then
			nShouldPay = 50
		elseif (nForgetTimes == 2) then
			nShouldPay = 500
		end
	
		Say(strTitle.."Зy l� l莕 th� "..(nForgetTimes + 1).." l莕 b� k� n╪g s秐 xu蕋, m蕋 "..nShouldPay.." lng, ngi suy ngh� k� ch璦?",
			2,
			"Ta  quy誸 nh r錳!/forget_now",
			"Khoan ! Ch� ta suy ngh� l筰!/SayHello")
	else
		Say(strTitle.."Ngi v蒼 ch璦 h鋍 k� n╪g ch� t筼 K� M玭 binh kh�? Ta gi髉 ngi nh�!", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- 辅技能
	local nShouldPay = 5000
	if (nForgetTimes == 0) then
		nShouldPay = 5
	elseif (nForgetTimes == 1) then
		nShouldPay = 50
	elseif (nForgetTimes == 2) then
		nShouldPay = 500
	end
	local nShouldPayMoney = nShouldPay * 100
	
	if (GetLifeSkillLevel(1, 4) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
			AbandonLifeSkill(1, 4)
			SetTask(LEV_LEARNRECIPE, 0)
			SetTask(LEVELTASKID49, 0)
			SetTask(1600, 0);				--清空79级武器配方任务
			SetTask(1601, 0);				--清空79级武器配方任务
			Msg2Player("K� n╪g ch� t筼 binh kh� k� m玭 c馻 b筺  qu猲.")				
		else
			Say(strTitle.."Ngi kh玭g mang theo  ti襫! L蕐 ti襫 r錳 h穣 n nh�!", 0)
		end
	end
end;
------------------------------------------时间判定脚本----------------------------------------
 --返回星期几，0代表星期天
function GetWeekDay()
	return tonumber(date("%w"))
end;

--返回当前小时和分钟
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end;

--19 - 23点59分
function CheckTime(day)
	if WEEKEND_SWITCH == 0 then
		return 0
	end;
	if day ~= GetWeekDay() then
		return 0
	end;

	--换算19:00 - 24:00是什么区间
	local nBegin = 19 * 60;
	local nEnd = 24 * 60;
	
	local nHour, nMin = GetLocalTime();
	local nValue = nHour * 60 + nMin;
	if nValue >= nBegin and nValue <= nEnd then
		return 1
	else
		return 0
	end
end;
--**********************************************打听消息****************************************
--周末活动
function Weekend()
	if (GetLifeSkillLevel(1,4) >= 1) then
		if (GetTask(HaveWeekend) == 1) then
        	Say(strTitle.."Ngi  h鋍 h誸 c竎 k� n╪g � ch� ta r錳!", 0)
       	elseif (CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1) then
    		Say(strTitle.."Th阨 th� lo筺 l筩, trang b� cho m譶h m閠 k� n╪g c騨g kh玭g th鮝 u, ta s� gi髉 ngi!", 0)
   		  	AddRecipe(229)
   		  	Msg2Player("B筺 h鋍 頲 k� n╪g m韎_Qu﹏ D鬾g Ti詎 Nang")
   		  	SetTask(HaveWeekend,1)
		else
			Say(strTitle.."Th阨 gian ch璦 n.", 0)
		end
	else
    	Say(strTitle.."Ngi v蒼 ch璦 h鋍 ch� t筼 K� M玭 binh kh� ho芻 th阨 gian ch璦 n, ta kh玭g th� truy襫 th� k� n╪g n祔 cho ngi.", 0)
    end
end
--**********************************************技能学习部分***************************************
--技能学习选择
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
		Say(strTitle.."B筺 kh玭g  <color=yellow>c蕄 10<color> ch�?th� h鋍 k� n╪g s鑞g.", 0)
  		return
	end
 	
    if (GetLifeSkillsNum(1) == 2) then
        Say(strTitle.."B籲g h鱱  h鋍 k� n╪g s秐 xu蕋, mu鑞 h鋍 k� n╪g m韎 c莕 ph秈 b� k� n╪g c�.", 0)
    	return
	end
  
	Say(strTitle.."<color=yellow>ch� t筼 K� M玭 binh kh�<color> l� k� n╪g s秐 xu蕋 m韎, ngi c� mu鑞 h鋍 kh玭g?",
    	2,
    	"Ta mu鑞 h鋍/LearnYes",
    	"в ta suy ngh� l筰/LearnNo")
end
--学习技能
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 4, 1, 79, 1)) then
			Msg2Player("B筺 h鋍 頲 k� n╪g s秐 xu蕋: ch� t筼 K� M玭 binh kh� v� nh薾 頲 3 H綾 Kim Ph蕁.")
			AddItem(2,2,59,3)
		    
		    AddRecipe(110)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Li評 Di謕 產o")
		    AddRecipe(111)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: 筺 Trng ti猽")
		    AddRecipe(121)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng鋍 V薾 c莔")
		    AddRecipe(122)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kinh Уo c莔")
		    AddRecipe(132)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ph竛 Quan b髏")
		    AddRecipe(133)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Chi誸 Xung b髏")
		    AddRecipe(760)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tr骳 M閏 Cung")
		    AddRecipe(761)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh Щng Cung")
		    AddRecipe(771)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H綾 Thi誸 tr秓")
		    AddRecipe(772)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tinh Cang tr秓")
		    SetTask(LEV_LEARNRECIPE, 10)
		end
	else
		Say(strTitle.."B筺  h鋍 k� n╪g s鑞g, kh玭g th� h鋍 th猰 k� n╪g kh竎.", 0)
	end
end;
--取消学习技能
function LearnNo()
    Say(strTitle.."H穣 suy ngh� k� r錳 quay l筰 y nh�!", 0)
end
--**********************************************配方学习部分***************************************
--学习新的配方
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 4)
	if (nLevel >= 1) then
		if (GetTask(LEV_LEARNRECIPE) == 10 and HaveLearnRecipe(760) == 0) then
			AddRecipe(760)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tr骳 M閏 Cung")
			AddRecipe(761)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh Щng Cung")
		elseif GetTask(LEV_LEARNRECIPE)==20 and HaveLearnRecipe(760)==0 then
        	AddRecipe(760)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tr骳 M閏 Cung")
			AddRecipe(761)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh Щng Cung")
        	AddRecipe(762)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tinh Thi誸 Cung")
        	AddRecipe(763)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: L筩 Nh筺 Cung")
      	elseif GetTask(LEV_LEARNRECIPE)==30 and HaveLearnRecipe(760)==0 then
        	AddRecipe(760)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tr骳 M閏 Cung")
			AddRecipe(761)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh Щng Cung")
        	AddRecipe(762)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tinh Thi誸 Cung")
        	AddRecipe(763)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: L筩 Nh筺 Cung")
        	AddRecipe(764)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Xuy猲 T﹎ Cung")
      	elseif GetTask(LEV_LEARNRECIPE)==40 and HaveLearnRecipe(760)==0 then
        	AddRecipe(760)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tr骳 M閏 Cung")
			AddRecipe(761)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh Щng Cung")
        	AddRecipe(762)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tinh Thi誸 Cung")
        	AddRecipe(763)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: L筩 Nh筺 Cung")
        	AddRecipe(764)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Xuy猲 T﹎ Cung")
        	AddRecipe(765)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Truy Nguy謙 Cung")
        	AddRecipe(766)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Di謙 Di謒 Cung")
      	elseif GetTask(LEV_LEARNRECIPE)==50 and HaveLearnRecipe(760)==0 then
        	AddRecipe(760)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tr骳 M閏 Cung")
			AddRecipe(761)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh Щng Cung")
       		AddRecipe(762)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tinh Thi誸 Cung")
        	AddRecipe(763)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: L筩 Nh筺 Cung")
        	AddRecipe(764)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Xuy猲 T﹎ Cung")
        	AddRecipe(765)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Truy Nguy謙 Cung")
        	AddRecipe(766)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Di謙 Di謒 Cung")
        	AddRecipe(767)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T� Kim")
      	elseif GetTask(LEV_LEARNRECIPE)==60 and HaveLearnRecipe(760)==0 then
        	AddRecipe(760)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tr骳 M閏 Cung")
			AddRecipe(761)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh Щng Cung")
        	AddRecipe(762)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tinh Thi誸 Cung")
        	AddRecipe(763)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: L筩 Nh筺 Cung")
        	AddRecipe(764)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Xuy猲 T﹎ Cung")
        	AddRecipe(765)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Truy Nguy謙 Cung")
        	AddRecipe(766)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Di謙 Di謒 Cung")
        	AddRecipe(767)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T� Kim")
        	AddRecipe(768)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th莕 L鵦")
      	elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(760)==0 then
        	AddRecipe(760)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tr骳 M閏 Cung")
			AddRecipe(761)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh Щng Cung")
        	AddRecipe(762)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tinh Thi誸 Cung")
        	AddRecipe(763)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: L筩 Nh筺 Cung")
        	AddRecipe(764)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Xuy猲 T﹎ Cung")
        	AddRecipe(765)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Truy Nguy謙 Cung")
        	AddRecipe(766)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Di謙 Di謒 Cung")
        	AddRecipe(767)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T� Kim")
        	AddRecipe(768)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th莕 L鵦")
        	AddRecipe(769)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Xi Nha") 
        elseif (nLevel >= 1 and GetTask(LEV_LEARNRECIPE)== 0) then
			AddRecipe(110)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Li評 Di謕 產o")
		    AddRecipe(111)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: 筺 Trng ti猽")
		    AddRecipe(121)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng鋍 V薾 c莔")
		    AddRecipe(122)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kinh Уo c莔")
		    AddRecipe(132)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ph竛 Quan b髏")
		    AddRecipe(133)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Chi誸 Xung b髏")
		    AddRecipe(760)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tr骳 M閏 Cung")
		    AddRecipe(761)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh Щng Cung")
		    AddRecipe(771)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H綾 Thi誸 tr秓")
		    AddRecipe(772)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tinh Cang tr秓")
		    SetTask(LEV_LEARNRECIPE, 10)    			  
    	elseif nLevel>=10 and GetTask(LEV_LEARNRECIPE)==10 then
        	AddRecipe(112)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ph� Di謙 th莕 ch﹎")
        	AddRecipe(113)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T� M蓇 Ly H錸 ti詎")
        	AddRecipe(123)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B玭 L玦 c莔")
        	AddRecipe(124)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phi B閏 Li猲 ch﹗")
        	AddRecipe(134)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Xu﹏ Phong b髏")
        	AddRecipe(135)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kinh L玦 b髏")
        	AddRecipe(762)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tinh Thi誸 Cung")
        	AddRecipe(763)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: L筩 Nh筺 Cung")
        	AddRecipe(773)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C� Quan tr秓")
        	AddRecipe(774)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phi Ho祅g tr秓")
        	SetTask(LEV_LEARNRECIPE, 20)
    	elseif nLevel>=20 and GetTask(LEV_LEARNRECIPE)==20 then
        	AddRecipe(114)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H綾 Huy誸 th莕 ch﹎")
        	AddRecipe(125)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: L玦 чng v筺 v藅")
        	AddRecipe(136)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� H錳 b髏")
        	AddRecipe(764)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Xuy猲 T﹎ Cung")
        	AddRecipe(775)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: 竚 Th輈h")
        	SetTask(LEV_LEARNRECIPE, 30)
    	elseif nLevel>=30 and GetTask(LEV_LEARNRECIPE)==30 then
        	AddRecipe(115)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng鋍 Phong ch﹎")
        	AddRecipe(116)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T� L� c祅 kh玭")
        	AddRecipe(126)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Huy襫 Nhai phi b閏")
        	AddRecipe(127)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H秈 Nguy謙 thanh huy")
        	AddRecipe(137)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Truy Nguy謙 b髏")
        	AddRecipe(138)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th� H錸 b髏")
        	AddRecipe(765)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Truy Nguy謙 Cung")
        	AddRecipe(766)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Di謙 Di謒 Cung")
        	AddRecipe(776)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: R╪g s鉯")
        	AddRecipe(777)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: N� Di謒")
        	SetTask(LEV_LEARNRECIPE, 40)
    	elseif nLevel>=40 and GetTask(LEV_LEARNRECIPE)==40 then
        	AddRecipe(117)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H祄 Sa X� 秐h")
        	AddRecipe(118)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th蕋 Tinh Th蕌 C鑤 ch﹎")
        	AddRecipe(128)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C鰑 Ti猽 Ho祅 b閕")
        	AddRecipe(129)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Hi謚 Chung")
        	AddRecipe(139)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Long Thi謙")
        	AddRecipe(140)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: R╪g s鉯")
        	AddRecipe(767)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T� Kim")
        	AddRecipe(778)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V筺 Ki誴")
        	SetTask(LEV_LEARNRECIPE, 50)
    	elseif nLevel>=50 and GetTask(LEV_LEARNRECIPE)==50 then
        	AddRecipe(119)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th蕋 S竧 Thi猲 La")
        	AddRecipe(130)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: L鬰 Kh雐")
        	AddRecipe(141)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ph� Qu﹏")
        	AddRecipe(768)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th莕 L鵦")
        	AddRecipe(779)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Dng Qu﹏")
        	SetTask(LEV_LEARNRECIPE, 60)
    	elseif nLevel>=60 and GetTask(LEV_LEARNRECIPE)==60 then
        	AddRecipe(120)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Ngo筰 Phi Ti猲")
        	AddRecipe(131)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ti猽 V�")
        	AddRecipe(142)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 C�")
        	AddRecipe(769)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Xi Nha")
        	AddRecipe(780)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng璶g Sng")
        	SetTask(LEV_LEARNRECIPE, 70)
    	elseif nLevel>=70 and GetTask(LEV_LEARNRECIPE)==70 then
    	  	AddRecipe(770)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Long Kh萿")
        	AddRecipe(781)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng� T玭")
        	SetTask(LEV_LEARNRECIPE, 80)
    	else
        	Say(strTitle..": ng qu� n玭 n鉵g, kinh nghi謒 giang h� ngi c遪 k衜 l緈, c� g緉g th猰 nh�!", 0)
    	end
    end
end;

function learnLtEquip()
	local nLevel = GetLifeSkillLevel(1, 4)
	if nLevel >= 79 then
    	AddRecipe(1117)
    	Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Linh у Л阯g M玭 Ch﹎"))
    	AddRecipe(1119)
    	Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Linh у Nga My Уn"))
    	AddRecipe(1123)
    	Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Linh у V� ng B髏"))
    	AddRecipe(1125)
    	Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Linh у Dng M玭 Cung"))
    	AddRecipe(1127)
    	Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Linh у Ng� чc Tr秓"))
    	AddRecipe(1129)
    	Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Linh у Th髖 Y猲 Phi課"))
    	AddRecipe(1130)
    	Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Linh у Th髖 Y猲 мch"))
	else
    	Say(strTitle..": ng qu� n玭 n鉵g, kinh nghi謒 giang h� ngi c遪 k衜 l緈, c� g緉g th猰 nh�!",0)
	end
end

function learnCyEquip()
	local nLevel = GetLifeSkillLevel(1, 4)
	if nLevel >= 1 then
		AddRecipe(1090)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "秐 Ti猽"))
    AddRecipe(1091)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "M閏 Ti猽"))
    AddRecipe(1102)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "B筩h V�"))
    AddRecipe(1103)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Nh筺 V�"))	
  end
	if nLevel >= 10 then
		AddRecipe(1092)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Tr骳 Ti猽"))
    AddRecipe(1093)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "M鬰 Ti猽"))
    AddRecipe(1104)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "B輈h Ng鋍"))
    AddRecipe(1105)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Hoa h錸g"))    
  end
	if nLevel >= 20 then
		AddRecipe(1094)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "T蕋 Ti猽"))
    AddRecipe(1106)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Уo Chi"))  
  end  
	if nLevel >= 30 then
		AddRecipe(1095)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "уng Ti猽"))
    AddRecipe(1096)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Gi竎 Th輈h"))
    AddRecipe(1107)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Tc V�"))
    AddRecipe(1108)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Ng﹏ L╪g")) 
  end   
	if nLevel >= 40 then
		AddRecipe(1097)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Lam Linh"))
    AddRecipe(1098)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Huy襫 H錸g"))
    AddRecipe(1109)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Kim M閚g"))
    AddRecipe(1110)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Ti猽 H錸"))  
  end  
	if nLevel >= 50 then
		AddRecipe(1099)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Th髖 Ng鋍"))
    AddRecipe(1111)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Tuy誸 H錸"))  
  end  
	if nLevel >= 60 then
		AddRecipe(1100)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Ng﹏ Ti"))
    AddRecipe(1112)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "謕 Th髖"))  
  end  
	if nLevel >= 79 then
		AddRecipe(1101)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Minh B╪g"))
    AddRecipe(1113)
    Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Ng鋍 Doanh"))    
	end
end

--补学爪配方
function luaLearnRecipeZhua()
	local nLevel = GetLifeSkillLevel(1, 4);
	if (GetLifeSkillLevel(1, 4) > 1) then
    	if (GetTask(LEV_LEARNRECIPE) == 10 and HaveLearnRecipe(771) == 0) then
    		AddRecipe(771)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H綾 Thi誸 Tr秓")
      		AddRecipe(772)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tinh Cang Tr秓")
    	elseif (GetTask(LEV_LEARNRECIPE)==20 and HaveLearnRecipe(771)==0) then
      		AddRecipe(771)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H綾 Thi誸 Tr秓")
      		AddRecipe(772)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tinh Cang Tr秓")
      		AddRecipe(773)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C� Quan Tr秓")
      		AddRecipe(774)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phi Ho祅g Tr秓")
    	elseif GetTask(LEV_LEARNRECIPE)==30 and HaveLearnRecipe(771)==0 then
      		AddRecipe(771)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H綾 Thi誸 Tr秓")
      		AddRecipe(772)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tinh Cang Tr秓")
      		AddRecipe(773)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C� Quan Tr秓")
      		AddRecipe(774)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phi Ho祅g Tr秓")
      		AddRecipe(775)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: 竚 Th輈h")
      	elseif GetTask(LEV_LEARNRECIPE)==40 and HaveLearnRecipe(771)==0 then
      		AddRecipe(771)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H綾 Thi誸 Tr秓")
      		AddRecipe(772)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tinh Cang Tr秓")
      		AddRecipe(773)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C� Quan Tr秓")
      		AddRecipe(774)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phi Ho祅g Tr秓")
      		AddRecipe(775)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: 竚 Th輈h")
      		AddRecipe(776)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: R╪g s鉯")
      		AddRecipe(777)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: N� Di謒")
      	elseif GetTask(LEV_LEARNRECIPE)==50 and HaveLearnRecipe(771)==0 then
      		AddRecipe(771)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H綾 Thi誸 Tr秓")
      		AddRecipe(772)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tinh Cang Tr秓")
      		AddRecipe(773)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C� Quan Tr秓")
      		AddRecipe(774)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phi Ho祅g Tr秓")
      		AddRecipe(775)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: 竚 Th輈h")
      		AddRecipe(776)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: R╪g s鉯")
      		AddRecipe(777)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: N� Di謒")
      		AddRecipe(778)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V筺 Ki誴")
      	elseif GetTask(LEV_LEARNRECIPE)==60 and HaveLearnRecipe(771)==0 then
      		AddRecipe(771)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H綾 Thi誸 Tr秓")
      		AddRecipe(772)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tinh Cang Tr秓")
      		AddRecipe(773)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C� Quan Tr秓")
      		AddRecipe(774)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phi Ho祅g Tr秓")
      		AddRecipe(775)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: 竚 Th輈h")
      		AddRecipe(776)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: R╪g s鉯")
      		AddRecipe(777)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: N� Di謒")
      		AddRecipe(778)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V筺 Ki誴")
      		AddRecipe(779)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Dng Du﹏")
      	elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(771)==0 then
      		AddRecipe(771)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H綾 Thi誸 Tr秓")
      		AddRecipe(772)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tinh Cang Tr秓")
      		AddRecipe(773)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C� Quan Tr秓")
      		AddRecipe(774)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phi Ho祅g Tr秓")
      		AddRecipe(775)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: 竚 Th輈h")
      		AddRecipe(776)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: R╪g s鉯")
      		AddRecipe(777)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: N� Di謒")
      		AddRecipe(778)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V筺 Ki誴")
      		AddRecipe(779)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Dng Du﹏")
      		AddRecipe(780)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng璶g Sng")
      	elseif GetTask(LEV_LEARNRECIPE)==80 and HaveLearnRecipe(771)==0 then
      		AddRecipe(771)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H綾 Thi誸 Tr秓")
      		AddRecipe(772)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tinh Cang Tr秓")
      		AddRecipe(773)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C� Quan Tr秓")
      		AddRecipe(774)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phi Ho祅g Tr秓")
      		AddRecipe(775)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: 竚 Th輈h")
      		AddRecipe(776)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: R╪g s鉯")
      		AddRecipe(777)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: N� Di謒")
      		AddRecipe(778)
		    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V筺 Ki誴")
      		AddRecipe(779)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Dng Du﹏")
      		AddRecipe(780)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng璶g Sng")
      		AddRecipe(781)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng� T玭")
      	end
	end
end;
--添加物信息
function Dating()
	Talk(1, "", strTitle.."Mu鑞 ch� t筼 1 binh kh� tuy謙 th� v� song, c莕 ph秈 b� th猰 nhi襲 v藅 ph� gia, ngi h穣 th� b� th猰 1 s� v藅 li謚 t鑤, c� th� s� r蘮 頲 nh鱪g v� kh� c� m閠 kh玭g hai.")
end
--************************************************通用处理**************************************
--空函数
function SayHello()	
end
--=================================================太虚任务增加函数======================================
--******************************太虚任务对话****************************
function taixu_jwl_dia_step1()
	Talk(	4,"taixu_jwl_goods_need",
			"Mu鑞 t╪g c蕄 <color=yellow>Trang s鴆 Th竔 H�<color> �? 叜� ta xem�",
			"�..",
			"C� c竎h n祔 c� th� th� xem, nh璶g c莕 <color=yellow>1 m秐h Cng h鉧 tinh kim<color>. <color=yellow>Cng h鉧 tinh kim<color> ch� c� 頲 th玭g qua vi謈<color=yellow>tinh luy謓 B╪g Th筩h<color>, m鏸 l莕 tinh luy謓 nh� v藋 ti猽 hao m閠 s� <color=yellow>ti襫 v祅g<color> v� <color=yellow>Thi猲 th筩h<color>",
			"Nh鱪g nguy猲 li謚 sau y kh玭g th� thi誹 trong vi謈 t╪g c蕄 <color=yellow>Trang s鴆 Th竔 H�<color>. <color=yellow>ti襫 v祅g<color> t輈h t� tinh kh�, <color=yellow>Thi猲 th筩h<color> t╪g c蕄 trang b�, <color=yellow>B╪g Th筩h<color> c binh kh� th莕 binh"
		)
end
function taixu_jwl_goods_need()
	Talk(2,"taixu_jwl_up_inf_end",
		"Ngi t譵 <color=yellow>1 m秐h B╪g Th筩h<color>, <color=yellow>"..taixu_jwl_up_met_table[1][5].."   ho祅g kim <color>v�<color=yellow> "..taixu_jwl_up_met_table[1][6].."   thi猲 th筩h <color>c飊g tinh luy謓 s� thu 頲 <color=yellow>cng h鉧 tinh kim<color>. N誹 nh� b筺 kh玭g mu鑞 m蕋 nhi襲 ti襫  mua nguy猲 li謚 th� c騨g c� th� ph﹏ ra l祄 <color=yellow>3 l莕 tinh luy謓<color>, m鏸 l莕 c莕 <color=yellow>"..taixu_jwl_up_met_table[2][5].."   ho祅g kim <color>v�<color=yellow> "..taixu_jwl_up_met_table[2][6].."  thi猲 th筩h<color>. Tuy nhi猲 c竎h n祔 s� g苝 r蕋 nhi襲 nguy hi觤, c bi謙 l� c� th� tinh luy謓 th蕋 b筰.",
		"Nh鱪g g� c莕 n鉯 ta  n鉯 h誸 r錳, b﹜ gi� ch髇g ta b総 u luy謓 <color=yellow>Cng h鉧 tinh kim<color>."
	)
end
function taixu_jwl_up_inf_end()
	SetTask(taixu_jwl_taskID,2)
	TaskTip("T譵  nguy猲 li謚 Cng h鉧 tinh kim (v祅g, Thi猲 th筩h) sau  n g苝 M筩 Tam")
end
--*****************************太虚任务提炼强化精金*******************************
function taixu_jwl_up_iron()
	Say("Ngi mu鑞 luy謓 1 l莕 Cng h鉧 tinh kim hay ph﹏ th祅h nhi襲 l莕?",
	6,
	"Ta mu鑞 d飊g m秐h B╪g Th筩h luy謓 th祅h Cng h鉧 tinh kim s� c蕄 (c� kh� n╪g th蕋 b筰)/#taixu_jwl_up(2)",
	"Ta mu鑞 d飊g Cng h鉧 tinh kim s� c蕄 luy謓 th祅h Cng h鉧 tinh kim trung c蕄 (c� kh� n╪g th蕋 b筰)/#taixu_jwl_up(3)",
	"Ta mu鑞 Cng h鉧 tinh kim trung c蕄 luy謓 th祅h Cng h鉧 tinh kim (c� kh� n╪g th蕋 b筰)/#taixu_jwl_up(4)",
	"Ta mu鑞 Cng h鉧 tinh kim 1 l莕 (Th祅h c玭g 100%)/#taixu_jwl_up_one_time()",
	"Ta mu鑞 t譵 hi觰 nguy猲 li謚 d飊g  th� luy謓/taixu_jwl_up_needs",
	"в suy ngh� l筰./end_dialog"
	)
end
--*************************************提炼确认界面*********************************
function taixu_jwl_up_dtm(up_diff)
	Say("Th� luy謓"..taixu_jwl_up_met_table[up_diff][12].."C莕 <color=yellow>1<color>B╪g Th筩h tinh luy謓, <color=yellow>"..taixu_jwl_up_met_table[2][6].."<color> m秐h Thi猲 th筩h v� <color=yellow>"..taixu_jwl_up_met_table[2][6].."<color> ho祅g kim, <color=yellow>v� c騨g c� th� th蕋 b筰<color>, b筺 c� ch綾 mu鑞 tinh luy謓?",
	2,
	"Ta ng � th� luy謓"..taixu_jwl_up_met_table[up_diff][12].."/#taixu_jwl_up("..up_diff..")",
	"в ta suy ngh� l筰/end_dialog"
	)
end
function taixu_jwl_up_needs()
	Say("Ngi c� th� ch鋘 th� luy謓 1 l莕 ho芻 chia l祄 3 l莕. Th� luy謓 1 l莕 c莕 <color=yellow>"..taixu_jwl_up_met_table[1][5].."<color> ho祅g kim v� <color=yellow>"..taixu_jwl_up_met_table[1][6].."<color> m秐h Thi猲 th筩h. Th� luy謓 3 l莕 c莕 <color=yellow>"..taixu_jwl_up_met_table[2][5].."<color> ho祅g kim v� <color=yellow>"..taixu_jwl_up_met_table[2][6].."<color> Thi猲 th筩h.",
	2,
	"Ta mu鑞 th� luy謓/taixu_jwl_up_iron",
	"Tho竧/end_dialog")
end
--******************************一次性提炼****************************
function taixu_jwl_up_one_time()
	local iron_num = GetTask(taixu_jwl_iron_up_num)
	if iron_num == nil then
		Talk(1,"","Th� luy謓 Cng h鉧 tinh kim 1 l莕 c莕 <color=yellow>"..taixu_jwl_up_met_table[1][6].."<color> m秐h Thi猲 th筩h, n誹 ngi kh玭g  Thi猲 th筩h c騨g kh玭g sao, khi n祇 t譵  <color=yellow>"..taixu_jwl_up_met_table[1][6].."<color> ch髇g ta ti誴 t鬰 th� luy謓 n祇!")
		return
	elseif iron_num >= 0 and iron_num < taixu_jwl_up_met_table[1][6] then
		Say("Hi謓 c莕 <color=yellow>"..(taixu_jwl_up_met_table[1][6]-iron_num).."<color>Thi猲 th筩h m韎 c� th� th� luy謓? Ngi c� ch�?",
		2,
		"Ta c� mang theo Thi猲 th筩h y!/#up_iron("..(taixu_jwl_up_met_table[1][6]-iron_num)..")",
		"в ta suy ngh� l筰/end_dialog")
	elseif iron_num >= taixu_jwl_up_met_table[1][6] then
		taixu_jwl_up(1)
	end
	
end
--******************************陨铁提交*****************************
function up_iron(num_remain)
	local iron_num_take = GetItemCount(2,2,8)
	if iron_num_take == 0 then
		Talk(1,"","Thi猲 th筩h ngi mang theo kh玭g !")
		return
	end
	local del_flag = 0
	if iron_num_take > num_remain then
		del_flag = DelItem(2,2,8,num_remain)
		if del_flag ~= 1 then
			Talk(1,"","Thi猲 th筩h ngi mang theo kh玭g !")
			return
		else
			SetTask(taixu_jwl_iron_up_num,taixu_jwl_up_met_table[1][6])
			Say("Ngi  c�  <color=yellow>"..num_remain.."<color>Thi猲 th筩h, ng � th� luy謓 ch�?",
			2,
			"B総 u th� luy謓/#taixu_jwl_up(1)",
			"Ta v蒼 ch璦 chu萵 b�/end_dialog")
		end
	else
		del_flag = DelItem(2,2,8,iron_num_take)
		if del_flag ~= 1 then
			Talk(1,"","Thi猲 th筩h ngi mang theo kh玭g !")
			return			
		else
			SetTask(taixu_jwl_iron_up_num,(taixu_jwl_up_met_table[1][6] - num_remain + iron_num_take))
			Talk(1,"","Ngi  c�  <color=yellow>"..iron_num_take.."<color>Thi猲 th筩h, c遪 thi誹<color=yellow>"..(num_remain - iron_num_take).."<color>Thi猲 th筩h, c� th� Cng h鉧 tinh kim!")
			return
		end
	end
end
function taixu_jwl_up(up_step)
	--包裹空间检测
	if GetFreeItemRoom() < 2 then
		Talk(1,"","Kho秐g tr鑞g h祅h trang kh玭g , xin xem l筰!")
		return
	end
	--所需要的物品以及材料检测
	if taixu_jwl_up_goods_chk(up_step) == 0 then
		return
	end
	--检测结束，开始删除
	if Pay(taixu_jwl_up_met_table[up_step][5]*10000) ~= 1 then
		Talk(1,"","<color=yellow>ti襫 v祅g<color> ngi mang theo kh玭g !")
		return 0
	end
	if up_step == 1 and GetTask(taixu_jwl_iron_up_num) < taixu_jwl_up_met_table[1][6] then
		Talk(1,"","Thi猲 th筩h ngi mang kh玭g  <color=yellow>"..taixu_jwl_up_met_table[1][6].."<color>, kh玭g th� th� luy謓 Cng h鉧 tinh kim 1 l莕 頲!")
	end
	if DelItem(taixu_jwl_up_met_table[up_step][1],taixu_jwl_up_met_table[up_step][2],taixu_jwl_up_met_table[up_step][3],1) ~= 1 then
		Talk(1,"","X竎 nh薾 c� mang theo "..taixu_jwl_up_met_table[up_step][4])
		return 0
	end
	if up_step~= 1 and DelItem(2,2,8,taixu_jwl_up_met_table[up_step][6]) ~= 1  then
		Talk(1,"","<color=yellow>Thi猲 th筩h<color> ngi mang theo kh玭g <color=yellow>"..taixu_jwl_up_met_table[up_step][6].."<color>!")
		return 0
	end
	if random(1,100) <= taixu_jwl_up_met_table[up_step][8] then
		local add_flag = AddItem(taixu_jwl_up_met_table[up_step][9],taixu_jwl_up_met_table[up_step][10],taixu_jwl_up_met_table[up_step][11],1)
		if add_flag == 1 then
			if up_step == 1 or up_step == 4 then
				SetTask(taixu_jwl_taskID,3)
				SetTask(taixu_jwl_iron_up_num,0)
				Talk(7,"kill_liu_dia_start",
				"Th祅h c玭g r錳! <color=yellow>Cng h鉧 tinh kim<color>  luy謓 th祅h!",
				"S� ph�  luy謓 th祅h c玭g <color=yellow>Cng h鉧 tinh kim<color>, cho v穘 b鑙 th� th�",
				"Л頲, nh璶g i ta m閠 l竧",
				"�..",
				"�, v蒼 ch璦 頲. Phng ph竝 th� ng r錳 nh璶g huy襫 kh� v蒼 kh玭g t輈h t�. Kh玭g th祅h r錳�",
				"<color=yellow>Th� r蘮 L璾<color> � <color=yellow>Tng Dng <color>, ngi bi誸 ch�?",
				"<color=yellow>Th� r蘮 L璾<color>? Ngi n祔 n鎖 ti課g nh� v藋 ai l筰 kh玭g bi誸 ch�."
				)
			else
				Talk(1,"","Th祅h c玭g r錳!"..taixu_jwl_up_met_table[up_step][12].."Х luy謓 頲 r錳!")
				return
			end
		else
			WriteLog("Nhi謒 v� trang s鴆 Th竔 H璤Ngi ch琲:"..GetName().."Nh薾 頲"..taixu_jwl_up_met_table[up_step][12].."Th蕋 b筰, th蕋 b筰 �:"..add_flag)
		end
	else
		Talk(1,"","Цng ti誧, l莕 n祔 luy謓 kh玭g th祅h,"..taixu_jwl_up_met_table[up_step][4].."ph秈 luy謓 l筰 th玦.")
		return
	end
end
--****************************提炼所需要的物品检测*************************
function taixu_jwl_up_goods_chk(up_step)
	if GetItemCount(taixu_jwl_up_met_table[up_step][1],taixu_jwl_up_met_table[up_step][2],taixu_jwl_up_met_table[up_step][3]) == 0 then
		Talk(1,"","Ngi c� mang theo <color=yellow>"..taixu_jwl_up_met_table[up_step][4].."<color>!")
		return 0
	elseif GetCash() < (taixu_jwl_up_met_table[up_step][5]*10000) then
		Talk(1,"","<color=yellow>ti襫 v祅g<color> ngi mang theo kh玭g !")
		return 0
	elseif up_step~= 1 and GetItemCount(2,2,8) < taixu_jwl_up_met_table[up_step][6] then
		Talk(1,"","<color=yellow>Thi猲 th筩h<color> ngi mang theo kh玭g !")
		return 0
	end
	return 1
end
--*********************************杀刘铁匠的对话**************************
function kill_liu_dia_start()
	Talk(4,"kill_liu_dia_1",
	"n鉯 v� tay ngh� th� l穙 <color=yellow>Th� r蘮 L璾<color> n祔 c騨g ch� ngang h祅g c� ta. Nh璶g l穙 蕐 kh玭g h� nh薾  t�. L穙 th輈h s璾 t莔 k� kim d� th筩h, ta c騨g kh玭g c� c秏 t譶h v韎 l穙 蕐.",
	"Nghe n鉯 trc y l穙 d飊g Thi猲 th筩h B╪g Th筩h tinh luy謓 n猲 <color=yellow>K� Kim<color>. Khi luy謓 trang s鴆 c� 頲 K� Kim s� nhanh ch鉵g t輈h t� huy襫 kh�, m鴆  th祅h c玭g s� cao.",
	"�"..Zgc_pub_sex_name()..", ngi t譵 c竎h ti誴 c薾 <color=yellow>th� r蘮 L璾<color>"..Zgc_pub_sex_name().."箃 頲 m秐h K� Kim c馻 l穙 ch髇g ta s� luy謓 th祅h c玭g",
	"S� ph� n鉯 r蕋 c� l�,  ta th� xem."
	)
end
function kill_liu_dia_1()
	Talk(4,"kill_liu_dia_2",
	"<color=yellow>Th� r蘮 L璾<color> c� t輓h nghi ng�, v� v藋 m� Thi猲 Th筩h B╪g Th筩h l穙 gi蕌 � ngo礽 th祅h, c� th� � u th� kh玭g ai bi誸 頲. Nh璶g ta bi誸 m鏸 t鑙 t� <color=yellow>21:00-21:30<color> l穙 u 甶 qua <color=yellow>Linh B秓 S琻<color>."..Zgc_pub_sex_name().."Trc <color=yellow>21 gi�<color> m鏸 ng祔, ngi c莔 <color=yellow>Thi誸 ch飝<color> c馻 ta n <color=yellow>Linh B秓 S琻<color> i, nh蕋 nh s� g苝 <color=yellow>Th� r蘮 L璾<color>.",
	"L� sao, ta kh玭g hi觰!",
	"<color=yellow>Thi誸 ch飝<color> c馻 ta tr玭g b譶h thng nh璶g n� l� m閠 d� b秓. <color=yellow>Th� r蘮 L璾<color> r蕋 th輈h,  nhi襲 l莕 mua l筰 nh璶g ta kh玭g b竛. L穙 t譵 c竎h 畂箃 n� nh璶g kh玭g 頲. L莕 n祔 甧m ra d�, nh蕋 nh l穙 s� xu蕋 hi謓."..Zgc_pub_sex_name().."Ch� c莕 畂箃 頲 <color=yellow>K� Kim<color> c馻 l穙 l� 頲 r錳!",
	"Th� ra l� v藋! в ta th� xem."
	)
end
function kill_liu_dia_2()
	Talk(3,"mo3_hammer_add",
	"Ch� c莕 mang <color=yellow>Thi誸 ch飝<color> c馻 ta n <color=yellow>B秓 Linh S琻<color> d� l穙 L璾. Nh璶g"..Zgc_pub_sex_name().."v� c玭g c馻 <color=yellow>Th� r蘮 L璾<color> r蕋 l頸 h筰, ngi ph秈 c萵 tr鋘g."..Zgc_pub_sex_name().."N誹 c� 頲 ng i h� tr� th� qu� l� thng s竎h.",
	"C遪 n鱝, n誹 trc   c� ngi nh b筰 <color=yellow>Th� r蘮 L璾 <color> r錳 総 h糿 <color=yellow>l穙<color> s� kh玭g xu蕋 hi謓 ngay. Ngi ph秈 <color=yellow>lui t韎 nhi襲 l莕<color>, m鏸 l莕 ph秈 <color=yellow>i m閠 l骳<color>, m韎 c� th� g苝 頲<color=yellow>l穙 L璾<color>.",
	" t� M筩 s� ph�  ch� gi竜."
)
	TaskTip("D飊g Thi誸 Ch飝 c馻 M筩 Tam nh b筰 th� r蘮 L璾 畂箃 K� Kim.")
end
--****************************增加莫三的锤子****************
function mo3_hammer_add()
	if BigGetItemCount(2,1,564) ~= 0 then
		Talk(1,"","Thi誸 ch飝 c馻 ta c騨g ch糿g c� g� t鑤 l緈"..Zgc_pub_sex_name()..", hay c� d飊g ch飝 c馻 ngi xem.")
		return
	end
	local add_flag = AddItem(2,1,564,1)
	Talk(1,"",Zgc_pub_sex_name().."Ngi nh� m鏸 ng祔 trc <color=yellow>21:00-21:30<color> n Linh B秓 S琻, n誹 kh玭g g苝 <color=yellow>Th� r蘮 L璾<color>,"..Zgc_pub_sex_name().."C� th� n ch� ta nh薾")
	return
end
function taixu_jwl_up_jwl()
	local taixu_jwl_dia_list = {}
	for i = 1, getn(taixu_jwl_list) do
		taixu_jwl_dia_list[i] = "Ta mu鑞 th� luy謓"..taixu_jwl_list[i][1].."*/#taixu_jwl_chk("..i..")"
	end
	taixu_jwl_dia_list[getn(taixu_jwl_list)+1] = "в ta suy ngh� l筰/end_dialog"
	Say("Ngi ch鋘 lo筰 <color=yellow>Trang s鴆 Th竔 H�<color> n祇?",
	getn(taixu_jwl_dia_list),taixu_jwl_dia_list
	)
end
function taixu_jwl_chk(jwl_diff)
	--包裹空间检测
	if GetFreeItemRoom() < 2 then
		Talk(1,"","Kho秐g tr鑞g h祅h trang kh玭g , xin xem l筰!")
		return
	end
	--太虚首饰携带检测
	if GetItemCount(0,102,taixu_jwl_list[jwl_diff][2]) == 0 then
		Talk(1,"","Ngi kh玭g mang theo <color=yellow>"..taixu_jwl_list[jwl_diff][1].."<color> �!!")
		return
	end
	--强化精金携带检测
	if GetItemCount(2,1,562) == 0 then
		Talk(1,"","Ngi kh玭g mang <color=yellow>Cng h鉧 tinh kim<color> �?")
		return
	end
	--奇金携带检测
	if GetItemCount(2,1,563) == 0 then
		Talk(1,"","Ngi kh玭g c� <color=yellow>K� Kim c馻 Th� r蘮 L璾<color> �?")
		return
	end
	--奇金删除检测
	local del_flag = DelItem(2,1,563,1)
	if del_flag ~= 1 then
		Talk(1,"","Ngi kh玭g c� <color=yellow>K� Kim c馻 Th� r蘮 L璾<color> �?")
		return		
	end
	--强化精金删除检测
	del_flag = DelItem(2,1,562,1)
	if del_flag ~= 1 then
		Talk(1,"","Ngi kh玭g mang <color=yellow>Cng h鉧 tinh kim<color> �?")
		return
	end
	--太虚首饰删除检测
	del_flag = DelItem(0,102,taixu_jwl_list[jwl_diff][2],1)
	if del_flag ~= 1 then
		Talk(1,"","Ngi kh玭g mang theo <color=yellow>"..taixu_jwl_list[jwl_diff][1].."<color> �!!")
		return	
	end
	--装备增加
	local add_flag = AddItem(0,102,taixu_jwl_list[jwl_diff][4],1,1,-1,-1,-1,-1,-1,-1)
	if add_flag == 1 then
		SetTask(taixu_jwl_taskID,0)
		Msg2SubWorld("Ch骳 m鮪g:"..GetName().." Ho祅 th祅h nhi謒 v� Trang s鴆 Th竔 H�, s�"..taixu_jwl_list[jwl_diff][1].."T╪g c蕄 th祅h "..taixu_jwl_list[jwl_diff][3].."!")
		Talk(4,"",
			"Th祅h c玭g r錳!",
			"�"..Zgc_pub_sex_name()..", y m韎 ng l� <color=yellow>Trang s鴆 Th竔 H�<color>! Qu� l� tuy謙 di謚!",
			" t� M筩 ti襫 b鑙, l莕 n祔 n誹 kh玭g c� ti襫 b鑙 gi髉  th藅 kh玭g bi誸 l祄 sao.",
			"бu l� m閠 nh�"..Zgc_pub_sex_name().."kh竎h kh� l祄 g�. C莔 l蕐! Nh� ng l祄 h� !"
		)
		WriteLog("Nhi謒 v� trang s鴆 Th竔 H璤Ngi ch琲:"..GetName().."Nh薾 頲 "..taixu_jwl_list[jwl_diff][2].."!")
	else
		WriteLog("Nhi謒 v� trang s鴆 Th竔 H璤Ngi ch琲:"..GetName().."T╪g"..taixu_jwl_list[jwl_diff][2].." th蕋 b筰, k� hi謚:"..add_flag)
	end	
end
--======================================================结束=============================================

function task_new3()
	talk_IV();
end

function bagua()
	Say("<color=red>trang b� b竧 qu竔<color>l� huynh  M筩 gia ta v� l穙 L璾 � Tng Dng, C萴 Nng  to祅 l鵦 c飊g nhau nghi猲 c鴘 ra t﹎ huy誸. L祄 th� n祇 nh薾 頲 nh鱪g m鉵 c� linh th筩h ngi 甶 h醝 truy襫 nh﹏ s� r�, n誹 ngi mu鑞 t譵 hi觰 l祄 th� n祇 ch� t筼 頲 <color=yellow>trang b�<color> kh秏 linh th筩h, th� n ch� ta t譵 hi觰 nh�.",
	4,
	"L祄 sao ch� t筼 trang b� c� l� kh秏 n筸/kongzhuangbeizhizuo",
	"V藅 ph萴 th猰 v祇 c� t竎 d鬾g g�/tianjiawu",
	"L祄 sao trang b� 頲 ch� t筼 th祅h trang b� B竧 Qu竔/xiangqianzhuyi",
	"дn h醝 th╩ th玦 m�!/SayHello"
	)
end

function kongzhuangbeizhizuo()
	Talk(1,"",strTitle.."R蕋 n gi秐, qua nghi猲 c鴘 c馻 b鋘 ta, c秈 ti課 phng ph竝 ch� t筼 ta truy襫 th� cho c竎 ngi, b﹜ gi� ngi 產ng thu th藀 nguy猲 li謚 � khu v鵦 thu th藀, nh鱪g trang b� ch� t筼 ra c� m鴆 linh kh� t鑙 產 v� c� th� c� l� kh秏 n筸, nh璶g m� c騨g ch輓h v� v藋, nh鱪g trang b� c� thu閏 t輓h linh kh� kh玭g c遪 ch� t筼 頲 n鱝.")
end

function tianjiawu()
	Talk(1,"",strTitle.."V筺 v藅 tr猲 th� gian u c� gi� tr� ri猲g, gi� tr� t飝 v祇 linh kh� 輙 hay nhi襲, khi ch� t筼 trang b� t╪g v藅 ph萴 th猰 v祇, c� th� t╪g m鴆 linh kh� t鑙 產 v� t╪g s� l� kh秏 n筸 linh th筩h tr猲 trang b�. M鴆 linh kh� t鑙 產 c馻 trang b� quy誸 nh m鴆 linh kh�  kh秏 n筸 linh th筩h, v� s� l� quy誸 nh n� c� th� kh秏 bao nhi猽 linh th筩h, c� th� th祅h thu閏 t輓h b竧 qu竔 hay kh玭g, cho n猲 n誹 頲 th� c� g緉g th猰 v礽 v藅 c� gi� tr�.")
end

function xiangqianzhuyi()
	Talk(1,"",strTitle.."� tr猲  nh綾 n r錳, tr猲 trang b� c� m鴆 linh kh� t鑙 產 v� l� kh秏 n筸, 1 trang b� kh秏 <color=yellow>3 vi猲<color> linh th筩h, khi m鴆 linh kh� c馻 3 vi猲 linh th筩h b籲g v韎 m鴆 linh kh� t鑙 產 c馻 trang b�, s� h譶h th祅h trang b� thu閏 t輓h b竧 qu竔. Linh th筩h l� s� l� th� m鴆 linh kh� ﹎, Linh th筩h l� s� ch絥 th� m鴆 linh kh� dng, n誹 th� t� Linh Th筩h 頲 kh秏 kh玭g gi鑞g nhau, th� trang b� c� thu閏 t輓h b竧 qu竔 kh竎 nhau, tr猲 \'B竧 qu竔 B秓 觧\' d祅h cho h藆 du� c馻 C玭g D� Th� Gian c� ghi r蕋 r� l祄 th� n祇  ch� t筼 1 trang b� c� thu閏 t輓h b竧 qu竔 mong mu鑞, c� th阨 gian th� xem.")
end
function xinwuqi()
	local nLevel = GetLifeSkillLevel(1, 4)
	if (GetLifeSkillLevel(1, 4) > 1) then
		if (GetTask(LEV_LEARNRECIPE) == 80 and HaveLearnRecipe(1013) == 0) then
        	AddRecipe(1006)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: M穘 Thi猲 Hoa V�")
        	AddRecipe(1008)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Hi Nh﹏ C莔")
        	AddRecipe(1009)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th莕 H祅h")
        	AddRecipe(1012)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th莕 Cung")        	
        	AddRecipe(1013)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: M穘h H�")
    end
end
end

function update_max_skill_level()
	Say(strTitle..format("M� r閚g c蕄 k� n╪g s秐 xu蕋 c莕 k� n╪g thu th藀 t c蕄 79 ng th阨 ti猽 hao %d V祅g", 1000), 
		2, "уng �/update_max_skill_level_ensure", "T筰 h� ch� xem qua th玦/SayHello")
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(1, 4) < 79 then
		Talk(1,"",format("Hi謓 t筰 c蕄 k� n╪g s秐 xu蕋 ch璦 t c蕄 %d, kh玭g th� m� r閚g c蕄 gi韎 h筺 k� n╪g", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng﹏ lng kh玭g  %d v祅g", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(1, 4, 99);
	Msg2Player("Ch骳 m鮪g c蕄 gi韎 h筺 k� n╪g s秐 xu蕋  t c蕄 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end
