-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 沙漠迷宫NPC幻象鬼将军Script
-- By StarryNight
-- 2007/08/07 AM 11:58

-- 不要欺负人驼背啊！

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local nNpcIndex = 0;
local t=0;

	SetNpcLifeTime(index,15);--使得尸体消失
	
	if nMemCount == 0 then -- 玩家未组队
		nNpcIndex = CreateNpc("Nguy猲 h譶h Hoan Tng","Nguy猲 h譶h Hoan Tng",nMapId, nX, nY);
		SetNpcLifeTime(nNpcIndex,1800);
		SetNpcScript(nNpcIndex,"\\script\\西北区\\沙漠迷宫\\npc\\幻象原形.lua");
		TaskTip("Ti猽 di謙 秓 秐h Qu� Tng u, nguy猲 h譶h c馻 Hoan Tng-Con trai xu蕋 hi謓!!");
		Msg2Player("Ti猽 di謙 秓 秐h Qu� Tng u, nguy猲 h譶h c馻 Hoan Tng-Con trai xu蕋 hi謓!!");
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
      if nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				TaskTip("Ti猽 di謙 秓 秐h Qu� Tng u, nguy猲 h譶h c馻 Hoan Tng-Con trai xu蕋 hi謓!!");
				Msg2Player("Ti猽 di謙 秓 秐h Qu� Tng u, nguy猲 h譶h c馻 Hoan Tng-Con trai xu蕋 hi謓!!");
				if t == 0 then
					nNpcIndex = CreateNpc("Nguy猲 h譶h Hoan Tng","Nguy猲 h譶h Hoan Tng",nMapId, nX, nY);
					SetNpcLifeTime(nNpcIndex,1800);
					SetNpcScript(nNpcIndex,"\\script\\西北区\\沙漠迷宫\\npc\\幻象原形.lua");
					t=1;
				end
			end
		end;
	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
  end;
end
