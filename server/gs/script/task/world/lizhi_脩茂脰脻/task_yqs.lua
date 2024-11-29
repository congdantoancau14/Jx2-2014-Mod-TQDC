--Ê¹ÓÃÓëÆÞÊéÒÔºóÖ´ÐÐµÄ½Å±¾
--created by lizhi
--2005-9-1 16:14

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()
    local szMsg = {
        "H×nh nh­ ®©y lµ th­ cña L«i Th¾ng viÕt cho ng­êi yªu nh­ng sao anh ta kh«ng göi ®i, trong th­ cã nh¾c ®Õn ng­êi yªu cña L«i Th¾ng ®ang ë D­¬ng Ch©u tªn Phïng §ång Nhi. Gióp anh ta hoµn thµnh t©m nguyÖn nµy ®i!"
    }
    if GetTask(TASK_YZ_ONE) == 0 then
        TalkEx("task_00_01", szMsg);
    end;
end;

function task_00_01()
    SetTask(TASK_YZ_ONE, 1);
    Msg2Player("§em th­ cho Phïng §ång Nhi ë D­¬ng Ch©u");
    TaskTip("§em th­ cho Phïng §ång Nhi ë D­¬ng Ch©u");
end;