--=============================================
--create by yanjun 2005.12.12
--describe:威尔逊教主(职能NPC)脚本
--=============================================
Include("\\script\\online\\圣诞节活动\\christmas_head.lua")

tItems = {
	{"Ch� t�",{2,2,62}},
	{"Ng鋍 n� thoa",{0,200,21}},
	{"L玭g th�",{2,9,1}},
	{"玦 th�",{2,1,2}},
	{"H綾 c萴",{2,2,21}},
	{"L玭g s鉯",{2,1,5}},
	{"Chu sa",{2,2,30}},
	{"H� b� mao",{2,1,155}},
}

function main()
	if GetTrigger(3000) == 0 then
		local nTemp = random(3);
		local tSay = {
			"S� gi竜 h鉧 c馻 ch骯 khi課 ta n y,s� ch� d蒼 c馻 ch骯 khi課 ngi n y?",
			"Ch骯 s� ban phc l祅h cho ngi.",
			"Th藅 ra t猲 c馻 ta l� Wilson.",
		}
		Say(tSay[nTemp],0);
		return 0
	end
	SelTab = {
		"Х thu th藀  v藅 li謚 c莕 thi誸, ta mu鑞 i l蕐 qu� Gi竛g Sinh./get_hat_box",
		"Ta mu鑞 t譵 hi觰 ho箃 ng Gi竛g Sinh./know_detail",
		"Merry Christmas, Gi竛g Sinh vui v�!/no",
		}
	Say("Ch骳 b筺 Gi竛g Sinh vui v�, Merry Christmas!",3,SelTab);
--	local nTemp = random(1,2)
--	if nTemp == 1 then
--		Say("<color=green>威尔逊教主<color>：神的教化让我来到你这里，神的指引让你来到我这里。",0)
--	else
--		Say("<color=green>威尔逊教主<color>：其实我的英文名字叫做“wilson”。",0)
--	end
end

function know_detail()
	Talk(8,"","L� Gi竛g Sinh b総 ngu錸 t� Phng T﹜, sau  頲 truy襫 n Trung Nguy猲.","Gi竜 h閕 ch髇g t玦 � Nam Bi謓 Kinh, Nam Th祅h Й, B綾 Tuy襫 Ch﹗ tr猲 nh鱪g c﹜ th玭g c� treo qu� gi竛g sinh, m鏸 ng祔 ng 21h v� 23h s� ph﹏ ph竧, m鏸 c﹜ th玭g s� ph竧 100 ph莕 qu�, t鎛g c閚g l� 600 ph莕 qu� gi竛g sinh, m鏸 ng祔 m鏸 ngi ch� nh薾 1 ph莕.","Trong th阨 gian di詎 ra ho箃 ng l� Gi竛g Sinh, n筽 th� s� c� c� h閕 nh薾 頲 1 trong 3 m鉵 ngo筰 trang Gi竛g Sinh.","Ti謒 Nam ph鬰, n� trang c� b竛 ngo筰 trang Gi竛g Sinh.","Ti謒 Kim ho祅 c� b竛 thi謕 ch骳 Gi竛g Sinh, s� d鬾g s� nh薾 頲 danh hi謚 Gi竛g Sinh vui v� MERRY CHRISTMAS.","B筺 thu th藀  v藅 li謚 c� th� quay l筰 y i l蕐 qu� Gi竛g Sinh, l莕 u c� th� nh薾 頲 n鉵 Gi竛g Sinh, nh鱪g l莕 sau s� nh薾 頲 h閜 qu� Gi竛g Sinh.","Trong qu� tr譶h nh qu竔 c� th� nh薾 頲 v� Gi竛g Sinh d飊g  i l� ph萴.","Th阨 gian ho箃 ng c馻 L� Gi竛g Sinh l� t� ng祔 23/12 n 28/12")
end

function get_hat_box()
	if CHRISTMAS_SWITCH == 0 then
		Say("Ho箃 ng Gi竛g Sinh v蒼 ch璦 b総 u m�!",0)
		return 0
	end
	if GetLevel() < 10 then
		Say("Xin l鏸! Qu� kh竎h ch璦 t n c蕄 <color=red>10<color> ch璦 th� nh薾 qu�.",0)
		return 0
	end
	
	
	if GetItemCount(2,2,62) >= 10 and GetItemCount(0,200,21) >= 1 and GetItemCount(2,9,1) >= 10 
		and GetItemCount(2,1,2) >= 10 and GetItemCount(2,2,21) >= 10 and GetItemCount(2,1,5) >= 10 
		and GetItemCount(2,2,30) >= 10 and GetItemCount(2,1,155) >= 10 then
		
		if GetTask(TASK_GOT_HAT) == 1 and GetItemCount(2,1,208) < 10 then --如果领取过帽子且身上圣诞帽少于10个
			Say("Ph秈 l蕐 <color=yellow>10 i v� Gi竛g Sinh<color> m韎 i 頲 h閜 qu� Gi竛g Sinh.",0)
			return 0
		end
		
		if DelItem(2,2,62,10) == 1 and DelItem(0,200,21,1) == 1 and DelItem(2,9,1,10) == 1
			and DelItem(2,1,2,10) == 1 and DelItem(2,2,21,10) == 1 and DelItem(2,1,5,10) == 1
			and DelItem(2,2,30,10) == 1 and DelItem(2,1,155,10) == 1 then
			local nBody = GetBody()
			if nBody == 1 then
				if GetTask(TASK_GOT_HAT) == 0 then --没有领过圣诞帽
					nRetCode = AddItem(0,108,109,1,1)--标准圣诞帽
					SetTask(TASK_GOT_HAT,1)
					strPresent = "1 c竔 n鉵 gi竛g sinh"
				elseif GetItemCount(2,1,208) >= 10 and GetTask(TASK_GOT_HAT) == 1 then
					if DelItem(2,1,208,10) == 1 then 
						nRetCode = AddItem(2,1,209,1,1)
					end
					strPresent = "1 h閜 qu� gi竛g sinh"
				end
			elseif nBody == 2 then
				if GetTask(TASK_GOT_HAT) == 0 then 
					nRetCode = AddItem(0,108,110,1,1)--魁梧圣诞帽
					SetTask(TASK_GOT_HAT,1)
					strPresent = "1 c竔 n鉵 gi竛g sinh"
				elseif GetItemCount(2,1,208) >= 10 and GetTask(TASK_GOT_HAT) == 1 then
					if DelItem(2,1,208,10) == 1 then
						nRetCode = AddItem(2,1,209,1,1)
					end
					strPresent = "1 h閜 qu� gi竛g sinh"
				end
			elseif nBody == 3 then
				if GetTask(TASK_GOT_HAT) == 0 then 
					nRetCode = AddItem(0,108,112,1,1)--性感圣诞帽
					SetTask(TASK_GOT_HAT,1)
					strPresent = "1 c竔 n鉵 gi竛g sinh"
				elseif GetItemCount(2,1,208) >= 10 and GetTask(TASK_GOT_HAT) == 1 then
					if DelItem(2,1,208,10) == 1 then
						nRetCode = AddItem(2,1,209,1,1)
					end
					strPresent = " 1 h閜 qu� gi竛g sinh"
				end
			elseif nBody == 4 then
				if GetTask(TASK_GOT_HAT) == 0 then 
					nRetCode = AddItem(0,108,111,1,1)--娇小圣诞帽
					SetTask(TASK_GOT_HAT,1)
					strPresent = "1 c竔 n鉵 gi竛g sinh"
				elseif GetItemCount(2,1,208) >= 10 and GetTask(TASK_GOT_HAT) == 1 then
					if DelItem(2,1,208,10) == 1 then
						nRetCode = AddItem(2,1,209,1,1)
					end
					strPresent = " 1 h閜 qu� gi竛g sinh"
				end
			end
			
			if nRetCode == 0 then
				--Say("背包里的空间不够，请整理一下背包里面的东西再来领取。")
				Say("Nh薾 v藅 ph萴 th蕋 b筰!",0)
				return 0
			else
				Msg2Player("B筺 nh薾 頲 "..strPresent..".")
			end
		end
	else
		local strSex
		local nSex = GetSex()
		if nSex == 1 then
			strSex = "Qu� 玭g"
		elseif nSex == 2 then
			strSex = "Qu� B�"
		else
			strSex = "g/B�"
		end
		Say("Xin l鏸, h譶h nh� "..strSex.." v蒼 ch璦  nguy猲 li謚 l祄 qu� Gi竛g Sinh. C莕 c�: <color=red>10<color> <color=yellow>s頸 ny l玭g<color>, <color=red>1<color> <color=yellow>Ng鋍 n� thoa<color>, <color=red>10<color> <color=yellow>L玭g th�<color>, <color=red>10<color> <color=yellow>玦 th�<color>, <color=red>10<color> <color=yellow>V秈 甧n<color>, <color=red>10<color> <color=yellow>L玭g s鉯<color>, <color=red>10<color> <color=yellow>Chu sa<color>, <color=red>10<color> <color=yellow>H� b� mao<color>.",0)
	end		
end

function countNeedItems()
	
end;

function no()

end

