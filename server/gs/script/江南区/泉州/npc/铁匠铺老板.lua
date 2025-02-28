-- -----------------------------------------
-- Newbie Quest Lua Scripts / Danexx 2005.02
-- -----------------------------------------
-- Include Files
Include( "\\script\\中原一区\\汴京\\npc\\init_新手任务.lua" )

-- Variable

-- Start of Main Function
function main()
--  新手任务相关
	NewbieTaskStrings =	 {"    Ha ha! C鯽 hi謚 ta chuy猲 b竛 v� kh� t鑤 nh蕋. Trang b� b猲 m譶h <color=red>V� kh�<color> ta b竛, ngi s� v鱪g ch� phi猽 b箃 giang h�. Ta t苙g ngi thanh v� kh� ph遪g th﹏, sau n祔 c莕 mua g� c� n t譵 ta!",
						  "    Khi d飊g v藅 li謚 c� b秐 nh� <color=green>kim lo筰<color> v� <color=green>g�<color>, c� th� ph鑙 gh衟 theo t� l� kh竎 nhau  ch� t筼 c竎 lo筰 v� kh�. N誹 th猰 v祇 <color=green>chi課 linh<color> ho芻 v礽 <color=green>v藅 ph萴 th莕 b�<color> s� gh衟 頲 v� kh� c祅g t鑤 h琻!"}

--  每个任务可以得到的奖励
	TaskExp		= 	 	 {15,30}
	TaskReward	=	 	 {0,0}
	TaskItem	=		{{0,2,1},
						 {0,0,0}}
						 
--  拜山任务所用的变量 Task(101) 将用5个Bit来记录任务完成情况，没个Bit分别表示 武器店/服装店/杂货店/药店/接到此任务
    if ( GetBit(GetTask(101), 1) == 1 ) and (GetBit(GetTask(101), 5) == 0) then
		Talk(1, "", NewbieTaskStrings[1])
		SetTask(101, SetBit(GetTask(101), 5, 1))
		ModifyExp(TaskExp[1])
		AddItem(TaskItem[1][1], TaskItem[1][2], TaskItem[1][3])
		if ( GetTask(101) == 31 ) then		--  拜山任务完成，这里可以做出处理
			SetTask(100, (GetTask(100) + 1))
			Msg2Player("Quest Lv.2 Finished.")
		end
		
--  生活技能任务所用的变量 Task(106) 将用4个Bit来记录任务完成情况，每个Bit分别表示 衣甲/兵器/炼丹/接到此任务
--  只出现在泉州		
	elseif ( GetBit(GetTask(106), 1) == 1 ) and (GetBit(GetTask(106), 3) == 0) then
		Talk(1, "", NewbieTaskStrings[2])
		SetTask(106, SetBit(GetTask(106), 3, 1))
		ModifyExp(TaskExp[2])
		if ( GetTask(106) == 15 ) then		--  生活技能任务完成，这里可以做出处理
			SetTask(100, (GetTask(100) + 1))
			Msg2Player("Quest Lv.7 Finished.")
		end

--	elseif ( GetTask(8) ~= 1 ) and ( GetItemCount(2, 2, 1) >= 2 ) then
--		SetTask(8, 1)
--		Talk(1, "", NewbieString[13])
--		ModifyExp(NewbieExp[8])
--		Earn(2*200)
--	    DelItem(2, 2, 1)
--	    DelItem(2, 2, 1)
--		--AddItem(0, 2, 15) 任务奖励(等待处理五行)
	else
		Sale(12)
	end
end;




--新手指引
--lijinyong


--function main()
--	Say("铁匠铺老板：买东西还是镶嵌？",2,"买东西/buy","镶嵌/xiangqian")

--end;


--function buy()
--		i=random(1,2)
--		if i==1 then
--			Sale(12)
--		else
--			Sale(13)
--		end
--end;


--function xiangqian()
--	EnchaseItem()
--end;





--	Uworld1 = GetTask(1)
--	if Uworld1 == 8  then
--		Say("铁匠铺老板：哪里的话？我几天前就已经还给他儿子了啊。不好，肯定是他的败家儿子又拿了银子去逛窑，没有跟他讲。哎，看来此事又要我亲自走一趟了。小兄弟，害你白跑一趟，实在不好意思，我老张一辈子打铁，没什么好补偿的，就给你讲讲兵器的知识吧。",2,"要/yes","不用了/no")
--	SetTask(1,9)
--	else
--		i=random(1,2)
--		if i==1 then
--			Sale(7)
--		else
--			sale(8)
--		end
--		Talk(1,"","铁匠铺老板：客官是买卖兵器还是学打铁？买卖兵器找我就好了，学打铁就跟我徒弟去抡锤子吧。")
--		Sale(1)
--	end
--end;


--function yes()
--	Talk(1,"no","铁匠铺老板：兵器一般分为短兵、长兵和奇门三类，江湖中十大门派，也各自有自己称手的兵器类型，人们常说十八般兵器，但真正常用的并没有这么多。一般来说，越是短兵，攻击速度越快，但攻击力越低。至于兵器的来源，除了野外掉落，铁匠铺买，玩家还可以请高手打造，不过代价肯定不菲。")
	
--end

--function no()
--	Talk(1,"","铁匠铺老板：江湖凶险，小侠就随便检一把兵器傍身吧。")
--	AddGoldItem(0,2);
--end




