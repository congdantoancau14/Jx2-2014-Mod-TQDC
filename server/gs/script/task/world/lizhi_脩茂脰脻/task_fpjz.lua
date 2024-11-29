--·ÉÆÙ½ðÕë
--created by lizhi
--2005-9-1 16:39

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

function OnUse()
    local szMsg = {
        "Phi Béc Kim Ch©m h×nh nh­ lµ hung khÝ giÕt chÕt L«i Th¾ng. Ng­¬i thö ®Õn §­êng M«n t×m §­êng Xu©n hái xem!"
    };
    if GetTask(TASK_YZ_TWO) == 0 then
        TalkEx("task_00_01", szMsg);
    end;
end;

function task_00_01()
    SetTask(TASK_YZ_TWO, 1);
    Msg2Player("§Õn §­êng M«n t×m §­êng Xu©n");
    TaskTip("§Õn §­êng M«n t×m §­êng Xu©n");
end;
