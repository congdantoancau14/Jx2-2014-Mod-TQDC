
function OnUse()
	reloadFile();
end

function reloadFile()
	-- dofile("\\settings\\static_script\\cheat\\thiencolenh.lua")
	LoadScript("\\settings\\static_script\\cheat\\thiencolenh.lua");
	Msg2Player("Reloaded thiencolenh");
end