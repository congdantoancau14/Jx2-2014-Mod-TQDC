-- =========================================
-- File : 中原一区，汴京，御厨.lua
-- Name : 御厨
-- ID   : 1, 7
-- =========================================
Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");
Include("\\script\\task\\lifeskill\\skill_lvlup.lua")
Include("\\script\\online_activites\\202007\\head.lua")

--*****************************************定义常量及预处理***************************************
ID_LEARNLIFESKILL		= 1925		
LEV_LEARNRECIPE			= 1926		-- 配方学习任务变量
LEVELTASKID49			= 516		-- 当归炖蛇汤
TASKID_LIFESKILL_FLG	= 1932		-- 49任务组队随机数
TASK_GATHER_FLAG		= 1931 		-- 任务物品采集标示
FORGETMAIN_NUM			= 1940		-- 遗忘主技能次数
FORGETOHTER_NUM			= 1941		-- 遗忘辅技能次数
strName = "";
strTitle = "";

--*****************************************MAIN函数*****************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","Х qu� 5 gi� ch琲, h穣 ngh� ng琲  gi� g譶 s鴆 kh醗!")
	 	return
	 end
	strName = GetTargetNpcName()
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
	Say (strTitle.."Ta l� u b誴 n鎖 ti課g trong thi猲 h�, ngi b筺 tr� c莕 gi髉 g� kh玭g?",
	5,
	"H鋍 k� n╪g n蕌 nng/luaLearnLifeSkill",
	"H鋍 c竎h ph鑙 ch� ho芻 l祄 nhi謒 v� ph鑙 ch�/learn_all_recipe",
	"B� k� n╪g n蕌 nng/forget_life_skill",
	"Ta mu鑞 thu� m閠 l� nng/rent_oven",
	"R阨 kh醝/SayHello11")
end;


-- 所有配方相关的事情
function learn_all_recipe()
	Say(strTitle.."Ngi mu鑞 h鋍 c竎h ph鑙 ch� ho芻 l祄 nhi謒 v� ph鑙 ch�?",
		6,
		"H鋍 c竎h ph鑙 ch� m韎/luaLearnRecipe",
		"H鋍 c竎h ph鑙 ch� d祅h cho ho箃 ng cu鑙 tu莕/Weekend",
		"Xem nh薾 頲 nhi謒 v� v� kh� c蕄 76 kh玭g/get_76_task",
		"H鋍 c竎h ph鑙 ch� c蕄 76/relearn_76_recipe",
		"H鋍 s鯽 ph鑙 ch�/Reset_Learn",
		"R阨 kh醝/SayHello11")
end;


-- 接受76级配方任务
function get_76_task()
	----------------------------------76级武器配方铁扇精木任务----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail);
	local nTaskState_tieshan = GetTask(TASK_COOKING_TIESHAN)
		
	if nSkillGenre == 1 and nSkillDetail == 7 and nSkillLevel >= 79 then
		--尚未触发配方任务
		if nTaskState_tieshan == 0 then
			cooking_tieshan_001()
			return
		--上交酒菜
		elseif nTaskState_tieshan == 1 then
			cooking_tieshan_002()
			return
		--未与刘一斧对话
		elseif nTaskState_tieshan == 2 then
			cooking_tieshan_004()
			return
		--上交率然原皮和铁扇木学会铁扇精木配方
		elseif nTaskState_tieshan == 4 then
			cooking_tieshan_008()
			return
		end 
	end
		
	--提示玩家76级武器配方任务
	if (nSkillGenre == 1 and nSkillDetail ~= 7 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillDetail);
	end	
	
	Say("B筺 ch璦  甶襲 ki謓 nh薾 nhi謒 v� ph鑙 ch� c蕄 76.", 0)
end;



-- 补学76级配方
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 7)
	if (nGene == 1 and nSkillID == 7) then
		if (GetTask(1603) == 5 and nLevel >= 79) then
			AddRecipe(806)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi誸 Phi課 Tinh M閏")
		else
			Say("B筺 ch璦 l祄 nhi謒 v� ph鑙 ch� n蕌 nng c蕄 76!", 0)
		end
	else
		Say("B筺 ch璦 h鋍 k� n╪g <color=yellow>N蕌 nng<color>!", 0)
	end
end;

-- 遗忘生活技能
function forget_life_skill()
	local nGene, nSkillID = GetMainLifeSkill()
	if (nGene == 1 and nSkillID == 7) then
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
		Say(strTitle.."Ngi ch璦 h鋍 k� n╪g n蕌 nng? Ta kh玭g th� gi髉 ngi!", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- 主技能
	local nShouldPay = 5000
	if (nForgetTimes == 0) then
		nShouldPay = 5
	elseif (nForgetTimes == 1) then
		nShouldPay = 50
	elseif (nForgetTimes == 2) then
		nShouldPay = 500
	end
	local nShouldPayMoney = nShouldPay * 100
	
	local nGene, nSkillID = GetMainLifeSkill()
	if (nGene == 1 and nSkillID == 7) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 7)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(LEVELTASKID49, 0)
        		SetTask(RESET_ERROR,0)
        		SetTask(1603,0);					--清空79级武器配方任务
				Msg2Player("B筺  b� k� n╪g n蕌 nng")				
			end
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
	end;
end;   


--**********************************************打听消息****************************************
function Dating()
    Say (strTitle.."B筺 tr�! N蕌 nng kh玭g d� ch髏 n祇 u!",0)
end


--**********************************************技能学习部分***************************************
--技能学习选择
function luaLearnLifeSkill()
	local nGene,nSKIllId = GetMainLifeSkill()
	if (GetLevel() < 10) then
		Say (strTitle.."B筺 kh玭g  <color=yellow>c蕄 10<color> ch�?th� h鋍 k� n╪g s鑞g.", 0)
		return
	end

    if (GetLifeSkillsNum(1) == 2) then
		Say (strTitle.."B籲g h鱱  h鋍 k� n╪g s秐 xu蕋, mu鑞 h鋍 k� n╪g m韎 c莕 ph秈 b� k� n╪g c�.", 0)
    	return
    end
   
	Say(strTitle.."B籲g h鱱 mu鑞 h鋍 k� n╪g <color=yellow>N蕌 nng<color> ch�?",
    	2,
    	"Ta mu鑞 h鋍/LearnYes",
    	"в ta suy ngh� l筰/LearnNo")
end
--学习技能
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
		if LearnLifeSkill(1, 7, 1, 79, 1) then
			Msg2Player("B筺 h鋍 頲 k� n╪g n蕌 nng, nh薾 頲 nguy猲 li謚 s� c蕄.")
			AddItem(1, 3, 19, 9)
			AddItem(1, 3, 9, 6)
	    end
	    
	    AddRecipe(18)
	    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C琺 n緈")
	    AddRecipe(25)
	    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猽 o t�")
	    SetTask(LEV_LEARNRECIPE, 10)
	    
	else
		Say(strTitle.."B筺  h鋍 k� n╪g s鑞g, kh玭g th� h鋍 th猰 k� n╪g kh竎.", 0)
	end
end
--取消学习技能
function LearnNo()
    Say (strTitle.."H穣 suy ngh� k� r錳 quay l筰 y nh�!",0)
end



--**********************************************配方学习部分***************************************
--学习新的配方
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 7)
	if (nLevel >= 1) then 
		if (GetTask(LEV_LEARNRECIPE) >= 20 and HaveLearnRecipe(215) == 0) then
			AddRecipe(215)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: M╪g x祇")
        elseif (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
        	AddRecipe(18)
	    	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C琺 n緈")
	    	AddRecipe(25)
	    	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猽 o t�")
	    	SetTask(LEV_LEARNRECIPE, 10)
    	elseif (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
        	AddRecipe(19)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: M祅 th莡")
        	AddRecipe(26)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: N� Nhi h錸g")
        	AddRecipe(215)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: M╪g x祇")
        	SetTask(LEV_LEARNRECIPE, 20)
    	elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
        	AddRecipe(22)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T� Qu� u")
        	SetTask(LEV_LEARNRECIPE, 30)
    	elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
        	AddRecipe(20)
        	Msg2Player("B筺 h鋍 頲 phng ph竝 l祄 B竛h x誴")
        	AddRecipe(27)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Чo Hoa hng")
        	SetTask(LEV_LEARNRECIPE, 40)
    	elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
        	AddRecipe(23)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: u x祇")
        	SetTask(LEV_LEARNRECIPE, 50)
    	elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
        	AddRecipe(21)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B竛h bao th辴")
        	AddRecipe(28)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T髖 M閚g t鰑")
        	SetTask(LEV_LEARNRECIPE, 60)
        elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
        	AddRecipe(24)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C秈 x祇 t醝")
        	SetTask(LEV_LEARNRECIPE, 70)
        elseif (nLevel >= 70 and GetTask(LEV_LEARNRECIPE) == 70) then
    	  	AddRecipe(218)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C琺 chi猲 tr鴑g")
        	SetTask(LEV_LEARNRECIPE, 80)
        else 
        	Say(strTitle..": ng qu� n玭 n鉵g, kinh nghi謒 giang h� ngi c遪 k衜 l緈, c� g緉g th猰 nh�!",0)
    	end
    end
end;

--修复配方
function Reset_Learn()
	if (GetLifeSkillLevel(1, 7) >= 1) then
		SetTask(LEV_LEARNRECIPE, 0)
		Talk(1, "", strTitle.."Ph鑙 ch� c馻 ngi  頲 tu s鯽, m鏸 10 c蕄 c� th� h鋍 c竎h ph鑙 ch� m韎.")
		return	
	else
		Talk(1, "", strTitle.."ng h遪g g箃 ta!")
	end
end

--周末活动
function Weekend()
	if (GetLifeSkillLevel(1,7) >= 1 and 
		(CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1)) then
    	Say(strTitle.."D飊g phng ph竝 ph鑙 ch� c bi謙 c馻 ta c� th� l祄 頲 nhi襲 lng th鵦 cung c蕄 cho ti襫 tuy課!", 0)
    	AddRecipe(233)
    	Msg2Player("B筺 h鋍 頲 c竎h ph鑙 ch� m韎 - Lng th鵦 qu﹏ d鬾g!")
    else
    	Say(strTitle.."Ngi ch璦 h鋍 k� n╪g n蕌 nng ho芻 ch璦 n gi�, ta kh玭g th� truy襫 th�.", 0)
    end
end

--************************************************通用处理**************************************
--空函数
function SayHello()	
end
