--泉州府北to东海海滨1.lua
--GGH

--修改：yanjun 05-12-27
--修改目的：元旦夺旗比赛不让有旗子的玩家走TRAP点出地图
Include("\\script\\task\\world\\task_var_id.lua");

Include("\\script\\online\\元旦活动\\yuandan_head.lua")

function main(sel)
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		Say("B筺 產ng tham gia thi u 畂箃 c� T誸 Nguy猲 Цn, gi鱝 阯g ng r阨 kh醝 khu v鵦 thi u!",0)
		return 0
	end
    if GetTask(TASK_YZ_FOUR) >= 1 then
    	NewWorld(104,1351,2861);
    	SetFightState(1);
    else
        Msg2Player("Ph輆 trc r蕋 nguy hi觤, chi b籲g ng v祇 n鱝!");
    end;
end;
