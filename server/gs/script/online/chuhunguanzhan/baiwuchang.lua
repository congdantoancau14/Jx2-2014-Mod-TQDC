Include("\\script\\online_activites\\chuhunguanzhan\\head.lua");

function main()
	Say("<color=white>B�ch V� Th��ng<color>: C�c h� c� vi�c g�!",2,
		"Nh� ��i th�n gi�p thu h�n/shouhun",
		"Kh�ng c� vi�c g�/nothing");
end;

function shouhun()
	if GetTask(TASK_SKILLDISABLE) == 1 then
		UseSkillEnable(1);
		Talk(1,"","�� thu h�n!");
		Msg2Player("K� n�ng chi�n ��u �� h�i ph�c");
		SetTask(TASK_SKILLDISABLE,0);
	else
		Talk(1,"","3 h�n 7 v�a ng��i ��u c� ��. Mu�n thu g� n�a?!");
	end
	
end;