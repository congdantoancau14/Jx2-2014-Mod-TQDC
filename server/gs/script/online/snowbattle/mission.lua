Include("\\script\\online\\snowbattle\\head.lua");

function InitMission()
	SB_Init();
end;

function RunMission()
end;

function EndMission()
	SB_End();
end;

function OnLeave(playerIndex)
	PlayerIndex = playerIndex;
	SB_Leave();
	PlayerIndex = playerIndex;	
end;

function JoinMission(playerIndex, Camp)
	PlayerIndex = playerIndex;
	SB_Join();
	PlayerIndex = playerIndex;	
end;