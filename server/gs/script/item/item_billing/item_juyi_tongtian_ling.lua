--神行符：流水五分钟
Include("\\script\\lib\\string.lua");
Include("\\settings\\static_script\\item\\tongtianling.lua");

function OnUse()

--赋一个加速魔法给玩家（"魔法字符串",速度增长,持续时间）
-- CastState("state_move_speed_percent_add",60,5400,1);
-- DelItem(2,0,143,1,1);

	goNewWorld()

end;

function nothing()
end;