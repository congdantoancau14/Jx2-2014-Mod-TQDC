FILEPATH = "\\script\\test\\test.lua";
Include(FILEPATH);

function OnUse()
	reloadTargetFile();
end;

function reloadTargetFile()
	reloadFileByPath(FILEPATH);
	notify()
end;

function reloadFileByPath(szFilePath)
	dofile(szFilePath);
	LoadScript(szFilePath);
end;

function notify()
	Msg2Player("Reloaded "..FILEPATH);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end;