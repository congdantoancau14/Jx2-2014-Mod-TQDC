Include("\\script\\missions\\yp\\tysd\\entrynpc.lua")

function main()
    local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
    if nCamp == 0 then
    	Msg2Player("Ph›a tr≠Ìc r t nguy hi”m, Æπi hi÷p h∑y gia nhÀp th’ l˘c rÂi quay lπi sau!");
    	SetPos(1499,3029);
    	return 0;
    end	
    enter();
    SetPos(1620,3256);
    SetFightState(1);
end