--ҩ����to����
Include("\\script\\missions\\yp\\mm\\entrynpc.lua")

function main()
	if GetPKValue() >= 10 then
		Msg2Player("Ng��i ch�i pk10 kh�ng th� v�o H�ng Kh�nh!");
		return 0;
	end
	if GetTeamSize() ~= 0 then
		Talk(1,"","��i hi�p h�y r�i ��i r�i quay l�i!");
		return 0;
	end
	enter();
	SetPos(1532,2552);
	SetFightState(1);
end