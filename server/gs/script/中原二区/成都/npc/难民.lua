--任务
--地点： 任务：
--策划：樊万松  2004.03.
Include("\\script\\task\\world\\task_award.lua");


function main()
	UWorld1402 = GetTask(1402)
	if UWorld1402 == 100 then
		UWorld1402 = 0
	end
	if ( UWorld1402 == 0 and GetLevel() >= 40 )  then
			Talk(4,"","G莕 y sao c� nhi襲 n筺 d﹏ th�?","L祄 琻 cho t玦 <color=red>2 c竔 b竛h ng�<color>! M蕐 ng祔 nay t玦 ch糿g c� g�  ╪.","C竎 ngi t� u n?","L祄 琻 cho t玦 <color=red>2 c竔 b竛h ng�<color>! M蕐 ng祔 nay t玦 ch糿g c� g�  ╪.")
			SetTask(1402,5)
	elseif ( UWorld1402 == 5 and GetItemCount(1,1,1) > 1  )  then
			Talk(2,"","Xin 產 t�! Ch髇g t玦 u l� ngi c馻 <color=red>Giang T﹏ th玭<color>, n琲  t nhi猲 xu蕋 hi謓 nhi襲 y猽 ma qu� qu竔, mong i hi謕 ra tay gi髉 ! C� v� i hi謕 t猲 l� <color=red>Trng ёnh<color> 產ng chi課 di謙 tr� b鋘 y猽 qu竔 � , c� vi謈 g� c� h醝 y.","Л頲! в ta n  m閠 chuy課 xem sao.")
			if  DelItem(1,1,1,2) == 1 then 
				 SetTask(1402,10)
				 --AddItem(0,0,0)
				 Earn(500)
				 GivePlayerExp(SkeyFDGC,"fengduguicheng1")		--丰都鬼城1
				 ModifyReputation(5,0)
				 --AddNote("主线剧情——鬼域任务，启动！去江津村问问张霆具体情况。")
				 TaskTip("Nhi謒 v� Ho祅g Kim--nhi謒 v� Qu� Th祅h, b総 u! дn Giang T﹏ th玭 h醝 Trng ёnh t譶h h譶h c� th�.")
			else
			 Talk(1,"","Chuy觧 giao v藅 ph萴 kh玭g th祅h c玭g")
			end
	elseif ( UWorld1402 == 5 and GetItemCount(1,1,1) < 2 and GetItemCount(1,1,1) >= 0 )  then
			Talk(1,"","L祄 琻 cho t玦 <color=red>2 c竔 b竛h ng�<color>! M蕐 ng祔 nay t玦 ch糿g c� g�  ╪.")
	elseif ( UWorld1402 == 10 )  then
			Talk(1,"","<color=red>Giang T﹏ th玭<color> c� v� i hi謕 t猲 <color=red>Trng ёnh<color> 產ng di謙 tr� ma qu竔, c� vi謈 g� c� h醝 y.")
	elseif ( GetLevel() <40 ) then
			Talk(1,"","ьi n l骳 v� c玭g c馻 Чi hi謕 ti課 b� th猰 h穣 n <color=red>Giang T﹏ th玭<color> gi髉 b鋘 t玦!")
	else
			Talk(1,"","L祄 琻 cho ti觰 nh﹏ xin 2 c竔 b竛h ng� ╪ 甶!")
	end
end;
