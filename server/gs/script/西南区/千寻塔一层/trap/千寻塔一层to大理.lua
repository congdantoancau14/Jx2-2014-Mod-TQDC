--to������
Include("\\script\\missions\\yp\\tls\\entrynpc.lua")

function main()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= 1 then
		Msg2Player("Ng��i ch�i kh�ng thu�c th� l�c kh�ng th� v�o Thi�n Long T�!");
		return 0;
	end
	if GetPKValue() >= 10 then
		Msg2Player("Ng��i ch�i pk10 kh�ng th� v�o Thi�n Long T�!");
		return 0;
	end
	if GetTeamSize() ~= 0 then
		Talk(1,"","��i hi�p h�y r�i ��i r�i quay l�i!");
		return 0;
	end
	enter();
	SetPos(1596,2762);
	SetFightState(0);
end