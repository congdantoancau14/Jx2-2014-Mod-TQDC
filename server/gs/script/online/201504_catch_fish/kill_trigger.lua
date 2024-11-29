--É±¹Ö
Include("\\script\\online\\201504_catch_fish\\head.lua")

function on_kill_npc()
	--print("on_kill_npc")
	if is_in_activity_date() ~= 1 then
		RemoveTrigger(GetTrigger(1374*2));
		return 0;
	end
	local nMapId,nX,nY = GetWorldPos();
	if nMapId ~= 103 then
		return 0;
	end
	local nNpcIdx,sMoban,sName = GetTriggeringUnit();
	if sName == "§«ng H¶i Thñy Téc" or sName == "§«ng H¶i Thñy Téc Binh sÜ" then
		if random(1,100) <=10 then
			AddItem(2,1,30816,1)
		end
	end
end