
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ìú×ìÉñËã½Å±¾
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
		Talk(1,"","Nh×n c¸c h¹ Ên ®­êng ph¸t s¸ng, kh«ng cÇn tİnh còng biÕt lµ tiÒn ®å v« l­îng!");
	else
		Talk(1,"","Gi¸p th©n mïng 5 th¸ng 1, kinh trËp, trêi l¹nh, cã ng­êi d­íi quª lªn, thİch hîp c­íi hái, kş thæ méc, h­íng ®«ng nam tèt!");
	end
	-- end;
	
end;