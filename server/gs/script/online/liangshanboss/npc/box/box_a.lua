--����a�ű�
Include("\\script\\online\\liangshanboss\\lsb_head.lua")

function main()
	if GetTime() - GetTask(Pre_Click_Time2) < Click_Space_time and GetItemCount(2,97,236) < 1 then		
		Msg2Player(format("Th�i gian CD nh�p v�o B�o R��ng l� %d gi�y",Click_Space_time));
		return 0;
	end
	if LSB_Check_LR() == 0 and GetItemCount(2,97,236) < 1 then
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
	
	if DelItem(2,97,236,1) == 1 then -- Thi�n ki�u l�nh
		Msg2Player("�� d�ng 1 Thi�n ki�u l�nh m� B�o R��ng");
	end
	
	StartTimeGuage("B�o R��ng",60,0,1)
	SetTask(Pre_Click_Time1,GetTime());
	--������c
	LSB_Get_Award_A();
	SetNpcLifeTime(nNpcIndex,0);
end