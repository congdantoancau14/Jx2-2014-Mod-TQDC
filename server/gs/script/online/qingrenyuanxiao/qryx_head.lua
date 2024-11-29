QRYX_SWITCH = 1	--情人节＆元宵节活动开关。1为开，0为关
--全局变量索引

--全局常量
DEBUG = 0 	--调试信息输出开关。1为开，0为关
ROSELIFE = 60*60	--玫瑰花的最大寿命：一个小时
--任务变量
TASK_YUANFEN = 1860	--用来记录玩家的缘分指数
TASK_GOTUSE_CHOCOLATE = 1861	--用来记录玩家当天是否已获得和已使用巧克力。第1字节表示是否获得过。第2字节表示是否使用过。
TASK_ROSE_LIFE 	 = 1862	--用来记录玫瑰花的生命力
TASK_ROSE_GROW 	 = 1863	--用来记录玫瑰花的成长度
TASK_ROSE_INDEX	 = 1864	--用来记录玩家所种的玫瑰花的索引
TASK_ROSE_TYPE 	 = 1865	--用来记录玩家所种出来的玫瑰花的类型。1为红玫瑰，2为粉玫瑰，3为黄玫瑰
TASK_TEAM_INDEX  = 1866	--用来记录队伍的索引
TASK_LOVESTORY1  = 1867	--爱情故事任务一：梁山伯与祝英台
TASK_LOVESTORY2  = 1868	--爱情故事任务二：许仙与白素贞
TASK_LOVESTORY3  = 1869	--爱情故事任务三：宁采臣与聂小倩
TASK_LOVESTORY4  = 1870	--爱情故事任务四：罗密与朱丽
TASK_USE_YUPEI	 = 1871	--用来记录玩家使用玉佩的时间
TASK_GOT_AWARD   = 1872	--用来标识玩家是不是领取过奖励
TASK_USEYUANXIAO = 1873	--用来标识玩家当天有没有吃过元宵
TASK_GOT_QRJ	 = 1874	--用来标识玩家有没有得过情人结（即有没有回答完问题）
--临时任务变量

function Is_QRYX_Activity()	--判断节日是否开放
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20080213 and nDate <= 20250215 and QRYX_SWITCH == 1 then
		return 1
	else
		return 0
	end
end

--IsLucky函数是用来判断概率是否成立的。如IsLucky(10,100)是判断10/100的概率是否成立
function IsLucky(numer,deno)	--numerator（分子），denominator（分母）
	local nRandomNum = random(1,deno)
	if nRandomNum <= numer then
		return 1
	else
		return 0
	end
end

function IsLoversTeam()	--判断当前是不是一男一女组队
	local OldPlayerIndex = PlayerIndex
	if GetTeamSize() == 2 then
		local Sex1,Sex2
		PlayerIndex = GetTeamMember(1)
		Sex1 = GetSex()
		PlayerIndex = GetTeamMember(2)
		Sex2 = GetSex()
		if Sex1 ~= Sex2 then
			PlayerIndex = OldPlayerIndex
			return 1
		else
			PlayerIndex = OldPlayerIndex
			return 0
		end
	else
		PlayerIndex = OldPlayerIndex
		return 0
	end
end

function GetLoversName()	--返回值：第一个是男玩家的名字，第二个是女玩家的名字
	local OldPlayerIndex = PlayerIndex
	if IsLoversTeam() == 1 then
		PlayerIndex = GetTeamMember(1)
		if GetSex() == 1 then
			nameMale = GetName()
			PlayerIndex = GetTeamMember(2)
			nameFemale = GetName()
		else
			nameFemale = GetName()
			PlayerIndex = GetTeamMember(2)
			nameMale = GetName()
		end
		PlayerIndex = OldPlayerIndex
		return nameMale,nameFemale
	else
		PlayerIndex = OldPlayerIndex
		return 0,0
	end
end

function GetLoversIndex()	--返回值：第一个是男玩家的索引，第二个是女玩家的索引。如果不是异性组队则返回０，０
	if IsLoversTeam() == 1 then
		local OldPlayerIndex = PlayerIndex
		PlayerIndex = GetTeamMember(1)
		if GetSex() == 1 then
			PlayerIndex = OldPlayerIndex
			return GetTeamMember(1),GetTeamMember(2)
		else
			PlayerIndex = OldPlayerIndex
			return GetTeamMember(2),GetTeamMember(1)
		end
	else
		return 0,0
	end
end

function DebugOutput(message)	--调试时输出信息用的
	if DEBUG == 1 then
		Msg2Player(message)
	end
end

function CreateTeamIndex(maleIdx,femaleIdx)	--用来产生一个男女组队的队伍索引，唯一标识一个队伍
	if IsLoversTeam() == 1 then
		return maleIdx * 10000 + femaleIdx
	else
		return 0
	end
end

function CanAcceptTask(TASKID,step)	--判断是否可以接受任务
	local OldPlayerIndex = PlayerIndex
	if IsLoversTeam() == 1 then
		local OldPlayerIndex = PlayerIndex
		local teamIndex1,teamIndex2
		local Player1Step,Player2Step2
		local PlayerIndex1,PlayerIndex2 = GetLoversIndex()
		local PlayerLevel1,PlayerLevel2
		PlayerIndex = PlayerIndex1
		teamIndex1 = GetTask(TASK_TEAM_INDEX)
		Player1Step = GetTask(TASKID)
		Player1Level = GetLevel()
		PlayerIndex = PlayerIndex2
		teamIndex2 = GetTask(TASK_TEAM_INDEX)
		Player2Step = GetTask(TASKID)
		Player2Level = GetLevel()
		if Player1Level >= 10 and Player2Level >= 10 and teamIndex1 == teamIndex2 and Player1Step == Player2Step and Player1Step == step then
			PlayerIndex = OldPlayerIndex	
			return 1
		else
			PlayerIndex = OldPlayerIndex
			return 0
		end
	else
		PlayerIndex = OldPlayerIndex
		return 0
	end
end

function GetLoversDropRate()	--得到情侣队伍的掉落率系数，如返回50表示掉落率系数为0.5。
	local nFriendliness
	local DropRate,DropRate1,DropRate2
	local YFIndex1,YFIndex2
	local OldPlayerIndex = PlayerIndex
	if IsLoversTeam() == 1 then
		PlayerIndex = GetTeamMember(1)
		nFriendliness = GetMemberFriendliness(2)	
		--以下计算由好感度决定的掉落率
		if nFriendliness >= 2000 then	--如果好感度大于200
			DropRate1 = 100	--掉落率为100％
		else
			DropRate1 = floor(nFriendliness*99/2000 + 1)	--0到99
		end
		--以下计算由缘分指数决定的掉落率
		PlayerIndex = GetTeamMember(1)
		YFIndex1 = GetTask(TASK_YUANFEN)
		PlayerIndex = GetTeamMember(2)
		YFIndex2 = GetTask(TASK_YUANFEN)
		DropRate2 = floor(100 - abs(YFIndex1 - YFIndex2) * 1.5)
		--两掉落率取其大者
		if DropRate1 >= DropRate2 then
			DropRate = DropRate1
		else
			DropRate = DropRate2
		end
		PlayerIndex = OldPlayerIndex
		return DropRate
	else 
		PlayerIndex = OldPlayerIndex
		return 0
	end
end

function AllTaskComplete()	--用来判断是否全成了所有四个爱情任务
	if GetTask(TASK_LOVESTORY1) == 9 and GetTask(TASK_LOVESTORY2) == 9 and GetTask(TASK_LOVESTORY3) == 7 and GetTask(TASK_LOVESTORY4) == 9 then
		return 1
	else
		return 0
	end
end

function NoTaskBegin() --用来判断是否还没开始任何一个任务
	if GetTask(TASK_LOVESTORY1) == 1 and GetTask(TASK_LOVESTORY2) == 1 and GetTask(TASK_LOVESTORY3) == 1 and GetTask(TASK_LOVESTORY4) == 1 then
		return 1
	else
		return 0
	end
end

function qryx_give_a_chocolate()
	if Is_QRYX_Activity() ~= 1 then
		return
	end
	if GetSex() ~= 2 then
		return
	end
	if GetFreeItemRoom() < 2 then
		Msg2Player("H祅h trang ho芻 s鴆 v竎 n苙g kh玭g , chocola nh薾 頲 l莕 n祔 m蕋 r錳. Xin h穣 s緋 x誴 l筰 nh?");
		return
	end
	if AddItem(2,0,361,1) == 1 then
		Msg2Player("B筺 nh薾 頲 1 th醝 S玞玪a")
		WriteLog("[Ho箃 ng l?t譶h nh﹏ v?T誸 Nguy猲 Ti猽]"..GetName().."B筺  l祄 10 l莕 nhi謒 v?Thng H閕 xin nh薾 l蕐 1 thanh chocola.")
	end
end
