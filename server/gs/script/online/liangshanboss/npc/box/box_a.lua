--����a�ű�
Include("\\script\\online\\liangshanboss\\lsb_head.lua")

function main()
	if GetTime() - GetTask(Pre_Click_Time1) < Click_Space_time then
		--Msg2Player(format("Th�i gian CD nh�p v�o B�o R��ng l� %d gi�y",Click_Space_time));
		return 0;
	end
	if LSB_Check_LR() == 0 then
			return 0;
	end
	local nNpcIndex = GetTargetNpc();
	--�����ж�
--	local nNpcIndex = GetTargetNpc();
--	if nNpcIndex ~= GetTaskTemp(Gld_Boss_Index) then
--		return 0;
--	end
	--�����ռ��ж�
	if gf_Judge_Room_Weight(2,2) ~= 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
    return 0;
	end
	StartTimeGuage("B�o R��ng",60,0,1)
	SetTask(Pre_Click_Time1,GetTime());
	--������c
	LSB_Get_Award_A();
	SetNpcLifeTime(nNpcIndex,0);
end