Include("\\script\\online_activites\\chuhunguanzhan\\head.lua");

function main()
	Say("<color=white>B¹ch V« Th­êng<color>: C¸c h¹ cã viÖc g×!",2,
		"Nhê ®¹i thÇn gióp thu hån/shouhun",
		"Kh«ng cã viÖc g×/nothing");
end;

function shouhun()
	if GetTask(TASK_SKILLDISABLE) == 1 then
		UseSkillEnable(1);
		Talk(1,"","§· thu hån!");
		Msg2Player("KÜ n¨ng chiÕn ®Êu ®· håi phôc");
		SetTask(TASK_SKILLDISABLE,0);
	else
		Talk(1,"","3 hån 7 vÝa ng­¬i ®Òu cã ®ñ. Muèn thu g× n÷a?!");
	end
	
end;