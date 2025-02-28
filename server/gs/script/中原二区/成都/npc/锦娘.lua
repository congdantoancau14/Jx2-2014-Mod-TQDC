-- =========================================
-- File : 中原二区，成都，锦娘.lua
-- Name : 锦娘
-- ID   : 1, 5
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");
Include("\\script\\task\\lingshi_task.lua")
--*****************************************定义常量及预处理***************************************
ID_LEARNLIFESKILL		= 1925		-- 配方学习任务变量
LEV_LEARNRECIPE			= 1926		-- 配方学习情况记录
LEVELTASKID49			= 518		-- 花笼百鸟裙
RECIPE_SEX				= 1935		-- 配方学习男女选择
RESET_ERROR				= 1938		-- 修复外网错误标示
TASK49_BEGGING			= 1933		-- 49级晋级任务开始标示
FORGETMAIN_NUM			= 1940		-- 遗忘主技能次数
FORGETOHTER_NUM			= 1941		-- 遗忘主技能次数
strName = "";
strTitle = "";

tNguyenLieu = { -- table nguy猲 li謚 ch? t筼 v秈 l鬭 cao c蕄
		[1] = {
			{"da h� tr緉g",{2,2,46},2, "t蕀"},
			{"da h� tr緉g",{2,2,19},2, "t蕀"},
			{"da h�",{2,2,16},2,"t蕀"},
			{"da h�",{2,1,292},5,"t蕀"},
		},
		[2] = {
			{"da vn tr緉g",{2,2,48},2,"t蕀"},
			{"da thng vi猲",{2,1,166},5,"t蕀"},
		},
		[3] = {
			{"da h醓 h�",{2,1,1404},2,"mi課g"},
		},
		[4] = {
			{"畊玦 th�",{2,1,2},10,"c竔"},
			{"l玭g th�",{2,9,1},10,"nh髆"},
		},
		[5] = {
			{"ng﹏ h� n",{2,1,167},10,"vi猲"}
		}
	}
vailua = {"v秈 l鬭 cao c蕄",{2,1,30360}}
tPrepareNL = {} -- table L璾 tr� danh m鬰 nguy猲 li謚  chu萵 b� ch� t筼 v秈 l鬭 cao c蕄

--*****************************************MAIN函数*****************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","Х qu� 5 gi� ch琲, h穣 ngh� ng琲  gi� g譶 s鴆 kh醗!")
	 	return
	 end
	strName = GetTargetNpcName()
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Mu鑞 l祄 trang b� c� linh kh� cao, nh蕋 nh ph秈 th猰 v藅 ph萴 c� gi� tr� cao v祇!");
	end;
	if random(1,10) == 2 then
		NpcChat(GetTargetNpc(),"L鬭 c馻 ta ch� ra l� l鬭 cao c蕄. N誹 甧m so v韎 l鬭 Чi Ly' c馻 c� g竔 tr� T� Quy猲 th� kh玭g bi猼 s� ra sao. Ch綾 ch緉 l� c馻 ta s� h琻 r錳. Ha ha! Nh璶g b籲g h鱱 c� th阨 jan th� h穣 n t譵 hi觰 �  n鱝. Л`ng s� bi猼 qu� nhi猔u.");
	end
	
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
	local strtab = {
		"H鋍 k� n╪g ch� t筼 h� gi竝./luaLearnLifeSkill",
		"H鋍 c竎h ph鑙 ch� ho芻 l祄 nhi謒 v� ph鑙 ch�/learn_all_recipe",
		"H駓 b� k� n╪g ch� t筼 h� gi竝./forget_life_skill",
		"Nh鱪g 甶襲 li猲 quan v� trang b� B竧 Qu竔/bagua",
		"T譵 hi觰 v藅 ph� gia/Dating",
		"Th鵦 h祅h d謙 v秈 l鬭 cao c蕄/detvai"
		}
	if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
		tinsert(strtab,"ti誴 t鬰 nhi謒 v� h鋍 t藀 Linh Th筩h B竧 Qu竔/task_new3");
	end
	if GetLifeSkillMaxLevel(1, 5) == 79 then
		tinsert(strtab, "Mu鑞 h鋍 k� n╪g cao c蕄 h琻/update_max_skill_level");
	end 
	tinsert(strtab,"R阨 kh醝/SayHello");
	Say(strTitle.."Ta ch輓h l� C萴 Nng, tinh th玭g ngh� may v�, b籲g h鱱 c莕 g� xin c� n鉯?",
		getn(strtab),
		strtab)
end;

function detvai()

	local strtab = {
		"T譵 hi觰 nguy猲 li謚 d謙 v秈/nguyenlieu",
		"Ta  chu萵 b�  nguy猲 li謚. Ta c莕 h頿 th祅h/kiemTraNL"
		}
	tinsert(strtab,"R阨 kh醝/SayHello");
	
	Say(strTitle.."V秈 l鬭 cao c蕄 �? B籲g h鱱 頲 ai ch� n y v藋? C竎h d謙 v秈 kh玭g kh�, ch� c莕 ph鑙 ch� ng nguy猲 li謚 l� th祅h.",
		getn(strtab),
		strtab)
end;

function kiemTraNL()
	
	--local tAvailableNL = {}; -- table l璾 tr� s� lng th鵦 t� t鑙 thi觰
	
	local nMax = 2000 -- con s� L璾 tr� s� t蕀 v秈 cao nh蕋 c� th� ch� t筼
	local tCountNL = {} -- table l璾 s� lng nguy猲 li謚 hi謓 c� trong h祅h trang
	
	for i=1, getn(tNguyenLieu) do -- duy謙 nguy猲 li謚 theo index
		local nNum = 0
		local nNum_old = nNum;
		
		local nMaxChoosenMaterial = 0 -- con s� l璾 tr� s� t蕀 v秈 cao nh蕋 c� th� ch� t筼 l� tng c馻 nguy猲 li謚 頲 ch鋘
		for j=1, getn(tNguyenLieu[i]) do -- duy謙 nguy猲 li謚 ch鋘 ch駈g lo筰, tr� v� nguy猲 li謚 kh� d鬾g c� s� lng nhi猔u nh蕋
			local item = {tNguyenLieu[i][j][2][1],tNguyenLieu[i][j][2][2],tNguyenLieu[i][j][2][3]}
			local nCountThucTe = GetItemCount(item[1], item[2], item[3]);
			local nCountTieuChuan = tNguyenLieu[i][j][3]
			local nDiv = floor(nCountThucTe/nCountTieuChuan)
			if nDiv >= 1 and nDiv > nNum_old then -- ki觤 tra N誹 s� lng mi課g v秈 m韎 kh� ch� nhi猔u h琻 s� lng cu~
				nNum_old = nNum
				nNum = nDiv
				tCountNL[i] = {tNguyenLieu[i][j][1],{item[1],item[2],item[3]},nCountThucTe,tNguyenLieu[i][j][4]}
				tPrepareNL[i] = {tNguyenLieu[i][j][1],{item[1],item[2],item[3]},tNguyenLieu[i][j][3],tNguyenLieu[i][j][4]}
				--tinsert(tPrepareNL, [i] = {tNguyenLieu[i][j][1],tNguyenLieu[i][j][2][1],tNguyenLieu[i][j][2][2],tNguyenLieu[i][j][2][3],tNguyenLieu[i][j][3],tNguyenLieu[i][j][4]})
			end
			
			-- if nCountThucTe >= nCountTieuChuan then
				-- tAvailableNL[i] = 1
				-- break
			-- end
		end
		nMaxChoosenMaterial = nNum
		if nNum < nMax then -- N誹 s� lng v藅 ph萴 kh� h頿 th祅h m韎 th蕄 h琻 s� lng v藅 ph萴 kh� h頿 th祅h c� th� l蕐 s� m韎
			nMax = nNum
		end
	end
	
	-- local nEcounter = 0;
	-- for i=1, getn(tAvailableNL) do
		-- if tAvailableNL[i] == 1 then
			-- nEcounter = nEcounter + 1
		-- end
	-- end
	
	if nMax == 0 then --nEcounter ~= getn(tNguyenLieu) then
		Say(strTitle.." B籲g h鱱 ch璦 chu萵 b�  nguy猲li謚 th� l祄 sao m� b総 u 頲.",1,
			"в ta chu萵 b� th猰/SayHello"
			)
	else
		local szSay = " S� nguy猲 li謚 hi謓 t筰 trong h祅h trang   ch� <color=yellow>"..nMax.."<color> t蕀 l鬭. Ph莕 d� th� ngi c蕋 甶\n"
		local tab = " "
		for i=1, getn(tCountNL) do
			szSay = szSay.."* <color=green>"..tCountNL[i][1].."<color>"..tab..tCountNL[i][3]..tab..tCountNL[i][4].."<enter>"
		end
		
		szSay = szSay.."C� mu鑞 ch� ngay kh玭g?"
		Say(strTitle..szSay,2,
			format("Л頲 y! B総 tay v祇 l祄 th玦/#hopthanh(%d)",nMax),
			"в ta chu萵 b� th猰/SayHello"
			)
	end
end;

function hopthanh(nNum)
	AskClientForNumber("_request_number_call_back",1,nNum,"Nh藀 s� lng")
end;

function _request_number_call_back(nNum)
	
	if nNum < 1 then
		return 0;
	end
	
	nDelResult = 0;
	for i=1, getn(tPrepareNL) do
		local item = tPrepareNL[i][2]	
		local nDel = tPrepareNL[i][3]*nNum
		
		local nResult = DelItem(item[1],item[2],item[3], nDel)
		if nResult then
			nDelResult = nDelResult * 10 + 1
		end
	end
	
	if nDelResult == generateNumber(getn(tNguyenLieu)) then
		AddItem(vailua[2][1],vailua[2][2],vailua[2][3],nNum)
		szMsg = "Ch骳 m璥ng c竎 h�  ch� t筼 th祅h c玭g "..nNum.." m秐h "..vailua[1]
		Talk(1,"",szMsg)
		Msg2Player(szMsg)
	else
		Msg2Player("Ch� t筼 th蕋 b筰! C� th�  b� t鎛 th蕋 m閠 s� nguy猲 li謚")
	end
	
end

function generateNumber(nNum) -- t筼 d穣 s� to祅 s� 1 g錷 c� nNum ch� s�
	local res = 0
	for i=1,nNum do
		res = res * 10 + 1
	end
	return res
end;

function nguyenlieu()
	
	local szSay = strTitle.."Nguy猲 li謚 h頿 th祅h g錷 c�: \n"
	local space = " "
	for i=1,getn(tNguyenLieu) - 1 do
		szSay = szSay.."* <color=green>"..tNguyenLieu[i][1][1].."<color> "..tNguyenLieu[i][1][3]..space..tNguyenLieu[i][1][4].."<enter>"
	end
	
	szSay = szSay.."Ngo礽 ra c莕 c� <color=green> "..tNguyenLieu[getn(tNguyenLieu)][1][1].."<color> "..tNguyenLieu[getn(tNguyenLieu)][1][3]..space..tNguyenLieu[getn(tNguyenLieu)][1][4]
	szSay = szSay.." t竛 nh� h遖 v祇 nc  ng﹎ c竎 nguy猲 li謚 trc khi s� d鬾g, ch蕋 lng s� t鑤 h琻.\n"
	szSay = szSay.."Tr猲 y l� nh鱪g nguy猲 li謚 c莕 m閠 s� k� n╪g m韎 c� th� ki誱 頲. Nh璶g n誹 kh� n╪g h筺 ch�, ngi c� th� s� d鬾g nguy猲 li謚 ph� th玭g h琻, mi詎 l� c飊g lo筰."
	Say(szSay,1,
	" t�  ch� gi竜. Ta bi猼 r錳/SayHello");
end;

-- 所有配方相关的事情
function learn_all_recipe()
	Say(strTitle.."Ngi mu鑞 h鋍 c竎h ph鑙 ch� ho芻 l祄 nhi謒 v� ph鑙 ch�?",
		7,
		"H鋍 c竎h ph鑙 ch� m韎/luaLearnRecipe",
		"H鋍 ph鑙 ch� trang b� Linh у/learnLtEquip",
		"H鋍 c竎h ph鑙 ch� d祅h cho ho箃 ng cu鑙 tu莕/Weekend",
		"Xem nh薾 頲 nhi謒 v� v� kh� c蕄 76 kh玭g/get_76_task",
		"H鋍 c竎h ph鑙 ch� c蕄 76/relearn_76_recipe",
		"H鋍 c竎h ph鑙 ch� y ph鬰 cao c蕄 s� m玭 nam kh玦 ng� C竔 Bang � y./GB_Cloth",
		"R阨 kh醝/SayHello")
end;


-- 接受76级配方任务
function get_76_task()
 ----------------------------------76级武器配方山狮精皮任务----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_shanshi = GetTask(TASK_WEAVE_SHANSHI)
		
	if (nSkillGenre == 1 and nSkillDetail == 5 and nSkillLevel >= 79) then
		--尚未触发配方任务
		if nTaskState_shanshi == 0 then
			weave_shanshi_001()
			return
		--尚未与女装店老板对话
		elseif nTaskState_shanshi == 1 or nTaskState_shanshi == 2 then
			weave_shanshi_002()
			return
		--从大理回来回复锦娘
		elseif nTaskState_shanshi == 3 then
			weave_shanshi_007()
			return
		--还未与黄大婶对话
		elseif nTaskState_shanshi == 4 then
			weave_shanshi_008()
			return
		--带回5匹乌蚕丝并学会山狮精皮配方
		elseif nTaskState_shanshi == 5 then
			weave_shanshi_011()
			return			
		end 
	end
		
	--提示玩家76级武器配方任务
	if (nSkillGenre == 1 and nSkillDetail ~= 5 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillDetail);
	end
	Say("B筺 ch璦  甶襲 ki謓 nh薾 nhi謒 v� ph鑙 ch� c蕄 76.", 0)
end;


-- 补学76级配方
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 5)
	if (nGene == 1 and nSkillID == 5) then
		if (GetTask(1604) == 6 and nLevel >= 79) then
			AddRecipe(807)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: S琻 S� Tinh B�")
		else
			Say("B筺 ch璦 l祄 nhi謒 v� ch� t筼 h� gi竝 c蕄 76", 0)
		end
	else
		Say("B筺 ch璦 h鋍 k� n╪g:<color=yellow>Ch� t筼 h� gi竝<color>!", 0)
	end
end;



-- 遗忘生活技能
function forget_life_skill()
	if (GetLifeSkillLevel(1, 5) > 0) then
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
		Say(strTitle.."Ngi ch璦 h鋍 k� n╪g ch� t筼 h� gi竝? Ta kh玭g th� gi髉 ngi!", 0)
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
	
	if (GetLifeSkillLevel(1, 5) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 5)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(518, 0)
				SetTask(RECIPE_SEX, 0)
				SetTask(1604, 0);			--清空79级武器配方任务				
				Msg2Player("B筺  b� k� n╪g ch� t筼 h� gi竝.")				
			end
		else
			Say(strTitle.."Ngi kh玭g mang theo  ti襫! L蕐 ti襫 r錳 h穣 n nh�!", 0)
		end
	end
end;



 ------------------------------------------时间判定--------------------------------------------
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
	if (WEEKEND_SWITCH == 0) then
		return 0
	end
	if (day ~= GetWeekDay()) then
		return 0
	end

	--换算19:00 - 24:00是什么区间
	local nBegin = 19 * 60
	local nEnd = 24 * 60
	
	local nHour, nMin = GetLocalTime()
	local nValue = nHour * 60 + nMin
	if (nValue >= nBegin and nValue <= nEnd) then
		return 1
	else
		return 0
	end
end;


--**********************************************技能学习部分***************************************
--技能学习选择
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
		Say(strTitle.."B筺 kh玭g  <color=yellow>c蕄 10<color> ch�?th� h鋍 k� n╪g s鑞g.", 0)
		return
	end  
	
	if (GetLifeSkillsNum(1) >= 2) then
		Say(strTitle.."B籲g h鱱  h鋍 k� n╪g s秐 xu蕋, mu鑞 h鋍 k� n╪g m韎 c莕 ph秈 b� k� n╪g c�.", 0)
    	return
	end

	Say(strTitle.."B籲g h鱱 mu鑞 h鋍 k� n╪g <color=yellow>Ch� t筼 h� gi竝<color> �?",
    	2,
    	"Ta mu鑞 h鋍/LearnAsMain",
    	"в ta suy ngh� l筰/LearnNo")
end

function LearnAsMain()
	if (2 > GetLifeSkillsNum(1)) then
		Say(strTitle.."Ch� t筼 h� gi竝 c� 2 lo筰: <color=yellow>Nam y<color> v� <color=yellow>N� y<color>, ngi mu鑞 h鋍 lo筰 n祇?",
		3,
		"Nam y./ChooseMan",
		"N� y./ChooseWomen",
		"в ta suy ngh�./LearnNo")
	end
end

function RecipeMan()
  AddRecipe(145)
  Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T� Kh﹎ B� Y")
	AddRecipe(146)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B祅 Long T�")
	AddRecipe(147)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thng Lang Y")
	AddRecipe(148)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Y觤 T﹎ Gi竝")
	AddRecipe(163)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th� u H� Ki猲")
	AddRecipe(164)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C萴 Ti C﹏")
	AddRecipe(165)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H祇 Hi謕 Y")
	AddRecipe(166)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kim Ng鋍 Tr� Sam")
			
	SetTask(LEV_LEARNRECIPE, 10)
	SetTask(RECIPE_SEX, 1)
end;

function RecipeWomen()
	AddRecipe(181)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T� Nhung Thng")
	AddRecipe(182)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T﹎ 蕁 Thng")
	AddRecipe(183)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� Luy謓 Thng")
	AddRecipe(184)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Ma Thng")
	AddRecipe(199)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T� K譶h Sam")
	AddRecipe(200)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Linh V薾 Thng")
	AddRecipe(201)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C﹏ Qu鑓 Sam")
	AddRecipe(202)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phong V� Thng")
			
  SetTask(LEV_LEARNRECIPE, 10)
  SetTask(RECIPE_SEX, 2)
end;

--学习技能
function ChooseMan()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 5, 1, 79, 1)) then
      Msg2Player("B筺  h鋍 k� n╪g s鑞g: ch� t筼 h� gi竝, nh薾 頲 3 s頸 sa tuy課.")
      AddItem(2, 2, 62, 3)
      		
      AddRecipe(145)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T� Kh﹎ B� Y")
			AddRecipe(146)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B祅 Long T�")
			AddRecipe(147)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thng Lang Y")
			AddRecipe(148)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Y觤 T﹎ Gi竝")
			AddRecipe(163)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th� u H� Ki猲")
			AddRecipe(164)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C萴 Ti C﹏")
			AddRecipe(165)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H祇 Hi謕 Y")
			AddRecipe(166)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kim Ng鋍 Tr� Sam")
			
			SetTask(LEV_LEARNRECIPE, 10)
			SetTask(RECIPE_SEX, 1)
		end
	else
		Say(strTitle.."B筺  h鋍 k� n╪g s鑞g, kh玭g th� h鋍 th猰 k� n╪g kh竎.", 0)
	end
end;

function ChooseWomen()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 5, 1, 79, 1)) then
  		Msg2Player("B筺  h鋍 k� n╪g s鑞g: ch� t筼 h� gi竝, nh薾 頲 3 s頸 sa tuy課.")
  		AddItem(2, 2, 62, 3)
    		
  		AddRecipe(181)
  		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T� Nhung Thng")
			AddRecipe(182)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T﹎ 蕁 Thng")
			AddRecipe(183)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� Luy謓 Thng")
			AddRecipe(184)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Ma Thng")
			AddRecipe(199)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T� K譶h Sam")
			AddRecipe(200)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Linh V薾 Thng")
			AddRecipe(201)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C﹏ Qu鑓 Sam")
			AddRecipe(202)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phong V� Thng")
			
	    SetTask(LEV_LEARNRECIPE, 10)
	    SetTask(RECIPE_SEX, 2)
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
--学习新的配方,分为男装学习与女装学习
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 5)
	
	if (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
		Say(strTitle.."Ch� t筼 h� gi竝 c� 2 lo筰: <color=yellow>Nam y<color> v� <color=yellow>N� y<color>, ngi mu鑞 h鋍 lo筰 n祇?",
			3,
			"Nam y./RecipeMan",
			"N� y./RecipeWomen",
			"в ta suy ngh�./LearnNo")
		return
	end
	
	if (1 == GetTask(RECIPE_SEX)) then
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(167)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: L鬰 L﹎ trang")
			AddRecipe(168)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ho祅g H� b� y")
			AddRecipe(149)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th莕 H祅h ph鬰")
			AddRecipe(150)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh Sng b祇")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(169)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th莕 Ng璾 h� gi竝")
			AddRecipe(170)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T� Thanh Sng Hoa sam")
			AddRecipe(151)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tham Lam y")
			AddRecipe(152)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: X輈h уng tr�")
			SetTask(LEV_LEARNRECIPE, 30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(171)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C� Nhi猰 kh竎h y")
			AddRecipe(172)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Nh蒼 b� trang")
			AddRecipe(153)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Nhuy詎 Kim y")
			AddRecipe(154)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thng Lan y")
			SetTask(LEV_LEARNRECIPE,40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(173)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th莕 S竎h kim gi竝")
			AddRecipe(174)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: L玦 Ng﹏ Gi竝")
			AddRecipe(155)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Lam K譶h b� gi竝")
			AddRecipe(156)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: X輈h Long b祇")
			SetTask(LEV_LEARNRECIPE,50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(175)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tinh Cang Huy襫 kim gi竝")
			AddRecipe(176)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H醓 Th� Th竛h sam")
			AddRecipe(158)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B╪g T祄 Tr� sam")
			AddRecipe(157)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Lang y")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(177)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Huy誸 H� Qu� Vng kh秈")
			AddRecipe(159)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: S琻 Qu� Huy誸 y")
			AddRecipe(178)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Long B� � kim y")
			AddRecipe(160)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Gi竛g b祇")
			SetTask(LEV_LEARNRECIPE,70)
		else
		    Say(strTitle..": ng qu� n玭 n鉵g, kinh nghi謒 giang h� ngi c遪 k衜 l緈, c� g緉g th猰 nh�!", 0)
		end
	else
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(185)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Luy謓 Gi竝 thng")
			AddRecipe(186)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C竛 Hoa thng")
			AddRecipe(203)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: M藅 V﹏ sam")
			AddRecipe(204)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� u thng")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(187)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C萴 Anh thng")
			AddRecipe(188)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: N� Ki謙 thng")
			AddRecipe(205)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 T祄 gi竝 y")
			AddRecipe(206)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kh雐 La thng")
			SetTask(LEV_LEARNRECIPE,30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(189)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh Linh thng")
			AddRecipe(190)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H錸g Ngh� thng")
			AddRecipe(207)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 C玭g u y")
			AddRecipe(208)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Linh Lung thng")
			SetTask(LEV_LEARNRECIPE, 40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(191)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: L﹏ Quang gi竝 y")
			AddRecipe(192)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H� C� v� y")
			AddRecipe(209)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th� Vng u y")
			AddRecipe(210)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th竔 Hoa thng")
			SetTask(LEV_LEARNRECIPE,50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(193)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Minh Quang gi竝 y")
			AddRecipe(194)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ngh� Thng v� y")
			AddRecipe(211)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ngh辌h V﹏ u y")
			AddRecipe(212)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C萴 V﹏ thng")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(195)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Y")
			AddRecipe(196)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phi Thi猲 th竔 thng")
			AddRecipe(213)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� Song u y")
			AddRecipe(214)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng� Th竔 ngh� thng")
			SetTask(LEV_LEARNRECIPE, 70)
		else
		    Say(strTitle..": ng qu� n玭 n鉵g, kinh nghi謒 giang h� ngi c遪 k衜 l緈, c� g緉g th猰 nh�!",0)
		end
	end
end;

function learnLtEquip()
	local nLevel = GetLifeSkillLevel(1, 5)
	if nLevel >= 79 then
    	AddRecipe(1135)
    	AddRecipe(1136)
    	AddRecipe(1137)
    	AddRecipe(1138)
    	Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Linh у Y"))
	else
    	Say(strTitle..": ng qu� n玭 n鉵g, kinh nghi謒 giang h� ngi c遪 k衜 l緈, c� g緉g th猰 nh�!",0)
	end
end

--对技能的说明信息
function Weekend()
    if (GetLifeSkillLevel(1, 5) >= 1 and 
    	(CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1)) then
    	Talk(1,"",strTitle.."Ti襫 tuy課 chi課 tranh 竎 li謙, ta c� 1 c竎h ch� t筼 h� gi竝 r蕋 c o, mu鑞 truy襫 th� cho ngi, ngi h穣 ch� t筼 chi課 gi竝 chi vi謓 cho ti襫 tuy課 gi髉  tri襲 nh!")
    	AddRecipe(230)
    	Msg2Player("B筺 h鋍 頲 ph鑙 ch�-- qu﹏ d鬾g kh玦 gi竝!")
    else
    	Talk(1,"",strTitle.."Ngi v蒼 ch璦 h鋍 k� n╪g ch� t筼 h� gi竝 ho芻 ch璦  kinh nghi謒, ta kh玭g th� truy襫 th� c竎h ph鑙 ch� n祔.")
    end
end;

--取消函数
function SayHello()
end

--添加物信息
function Dating()
	Talk(1, "", strTitle.."Mu鑞 ch� t筼 1 binh kh� tuy謙 th� v� song, c莕 ph秈 b� th猰 nhi襲 v藅 ph� gia, ngi h穣 th� b� th猰 1 s� v藅 li謚 t鑤, c� th� s� r蘮 頲 nh鱪g v� kh� c� m閠 kh玭g hai.")
end

--补学丐帮污衣衣服配方
function GB_Cloth()
	if (HaveLearnRecipe(871) > 0 and HaveLearnRecipe(873) > 0 and 
		HaveLearnRecipe(874) > 0 and HaveLearnRecipe(872) == 0) then
		AddRecipe(872)
		Msg2Player("B筺 h鋍 頲 c竎h l祄: T� Ngh躠 thng")
	end
end;

function task_new3()
	talk_IV();
end

function bagua()
	Say("<color=red>Trang b� b竧 qu竔<color> l� ta c飊g huynh  M筩 gia v� l穙 L璾 � Tng Dng,  to祅 l鵦 c飊g nhau nghi猲 c鴘 ra t﹎ huy誸. L祄 th� n祇 nh薾 頲 nh鱪g m鉵 c� linh th筩h ngi 甶 h醝 truy襫 nh﹏ s� r�, n誹 ngi mu鑞 t譵 hi觰 l祄 th� n祇 ch� t筼 頲 <color=yellow>trang b�<color> kh秏 linh th筩h, th� n ch� ta t譵 hi觰 nh�.",
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

function update_max_skill_level()
	Say(strTitle..format("M� r閚g c蕄 k� n╪g s秐 xu蕋 c莕 k� n╪g thu th藀 t c蕄 79 ng th阨 ti猽 hao %d V祅g", 1000), 
		2, "уng �/update_max_skill_level_ensure", "T筰 h� ch� xem qua th玦/SayHello")
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(1, 5) < 79 then
		Talk(1,"",format("Hi謓 t筰 c蕄 k� n╪g s秐 xu蕋 ch璦 t c蕄 %d, kh玭g th� m� r閚g c蕄 gi韎 h筺 k� n╪g", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng﹏ lng kh玭g  %d v祅g", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(1, 5, 99);
	Msg2Player("Ch骳 m鮪g c蕄 gi韎 h筺 k� n╪g s秐 xu蕋  t c蕄 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end