
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 武器店老板脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

--*****************************************定义常量及预处理*********************************
Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\lifeskill\\skill_lvlup.lua")
LEVELTASKID49=517  --金刀重现任务
TASK_GATHER_FLAG=1931 --任务物品采集标示

strName = "";
strTitle = "";

--*****************************************MAIN函数*****************************************
function main()

	strName = GetTargetNpcName();
	if strName=="" or strName==nil then return end;
	strTitle = "<color=green>"..strName.."<color>: ";
	
	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	local strTitle = "<color=yellow>Ch� ti謒 v� kh�: <color>"
	local a =  goto_takelifeskill_task()
	
----------------------------------------------主对话-----------------------------------------------
	if (nState==1) then	
		task_001_00();
		return	
	end
	
	-- local tSay = {
		-- "Mua v� kh�/_buy_sale_equip",
		-- "Trang b� t竎h/_equip_recycle",
		-- "T筰 h� ch� xem qua th玦/nothing",
	-- }
	-- Say("<color=green>Ch� Ti謒 V� Kh�:<color> V� kh� � ch� c馻 ta v蒼 l� m苩 h祅g ph� bi課, kh玭g bi誸 m鉵 v� kh� c� thu閏 qu� s� nh� th� n祇!", getn(tSay), tSay);
	Sale(33)
end;		

function _buy_sale_equip()
	Sale(33);
end

function _equip_recycle()
	SendScript2Client("Open[[EquipRecycle]]");
end

function nothing()
	--do nothing
end
		
--  强化武器任务
--  樊万松
--  2004.01.17
--Include("\\script\\global\\itemhead.lua")
	
	
-- UTask_world1502 = GetTask(1502)
--	if (UTask_world1502 == 0) and (GetLevel() > 7) then 		--任务启动
--		Talk(2,"W1502_get","铁匠：这位小侠想必也在江湖上混了一些时日了，怎么没把精良的兵刃阿？。","<color=green>玩家<color>：那请问这位师傅可以帮忙么？")
--	elseif (UTask_world1502 == 5) then
--		if (GetItemCount("XXXX") >= N) and (GetItemCount("XXXX") >= N) then		-- 任务完成
--			SetTask(1502,10)
--				for i=1,N do
--							DelItem("XXX")
--							DelItem("XXXX")
--				end
--			Talk(1,"","铁匠：好，材料全了！咱这就为小侠打造一把强力的兵刃。")
--			AddNote("将XXX和XXXX交给铁匠，任务完成。")
--			TaskTip("将XXX和XXXX交给铁匠，任务完成。")
--			p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
--			if(GetSex() == 0) then
--				AddItem(0, 9, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
--				TaskTip("得到绿蚰玉佩。")
--			else
--				AddItem(0, 9, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
--				TaskTip("得到熏衣香囊。")
--			end
--			AddRepute(8)
--			TaskTip("你的江湖声望提升了8点")
--			AddItem(0)
--		else
--			Talk(1,"","铁匠：怎么样？材料找齐了么吗？")
--		end
--	elseif (UTask_world1502 == 10) then		-- 任务已经完成
--		EnchaseItem() --打开精炼界面，但是这个是镶嵌的脚本
--	else
--		Talk(1,"","铁匠：打造各种江湖利刃！")
--	end

		
		
--		Talk(1, "", "已经说过话老！")
--	end
--end;
-- Vaiable States
--	Task(2) = 6/7

-- Start of Sub Function
function W1502_get()
	Say("Ta c� th� gi髉 ngi s鯽 v� kh� nh璶g c莕 2 lo筰 nguy猲 li謚 XXX v� XXXX m鏸 lo筰 N ph莕, ngi h穣 ra ngo礽 Bi謓 Kinh ph� t譵 ch髇g!",2,"Ta 甶 ngay!/W1502_get_yes","Sau n祔 h穣 t輓h/W1502_get_no")
end

function W1502_get_yes()
	SetTask(1502,5)
	Talk(1,"","T鑤 l緈! Ta 甶 t譵 ngay y!")
	AddNote("Nh薾 nhi謒 v�: 甶 t譵 xxx v� xxxx, n Th� r蘮 gi髉 n﹏g c蕄 v� kh�.")
	TaskTip("Nh薾 nhi謒 v�: 甶 t譵 xxx v� xxxx, n Th� r蘮 gi髉 n﹏g c蕄 v� kh�.")
end

function W1502_get_no()
end

