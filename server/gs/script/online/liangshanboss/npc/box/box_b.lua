--����b�ű�
Include("\\script\\online\\liangshanboss\\lsb_head.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\online_activites\\task_values.lua")

function main()
	if GetTime() - GetTask(Pre_Click_Time2) < Click_Space_time then
		if DelItem(2,97,236,1) == 1 then -- Thi�n ki�u l�nh
			Msg2Player("�� d�ng 1 Thi�n ki�u l�nh m� B�o R��ng");
		else
			Msg2Player(format("Th�i gian CD nh�p v�o B�o R��ng l� %d gi�y",Click_Space_time));
			return 0;
		end
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
	SetTask(Pre_Click_Time2,GetTime());
	--������c
	LSB_Get_Award_B();
	--����
	if tGtTask:check_cur_task(89) == 1 and GetTask(VET_LSB_GETBOX) < 1 then
		SetTask(VET_LSB_GETBOX,1);
		Msg2Player("Nh�t ��i B�o R��ng c�a Boss Ho�ng Kim(ho�n th�nh)");
	end
	SetNpcLifeTime(nNpcIndex,0);
end