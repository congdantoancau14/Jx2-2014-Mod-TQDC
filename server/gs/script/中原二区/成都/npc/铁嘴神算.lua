
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 铁嘴神算脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");


function main()

	-- local nState = TE_GetTeachState()
	-- local nLevel = GetLevel()
	
	-- if (nState==11) then
		-- task_011();
		-- return
	-- else
	if random(3) == 1 then
		Talk(1,"","Nh譶 c竎 h� 蕁 阯g ph竧 s竛g, kh玭g c莕 t輓h c騨g bi誸 l� ti襫  v� lng!");
	else
		Talk(1,"","Gi竝 th﹏ m飊g 5 th竛g 1, kinh tr藀, tr阨 l筺h, c� ngi di qu� l猲, th輈h h頿 ci h醝, k� th� m閏, hng ng nam t鑤!");
	end
	-- end;
	
end;