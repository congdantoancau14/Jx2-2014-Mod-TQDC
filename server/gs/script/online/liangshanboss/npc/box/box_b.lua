--±¶œ‰bΩ≈±æ
Include("\\script\\online\\liangshanboss\\lsb_head.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\online_activites\\task_values.lua")

function main()
	if GetTime() - GetTask(Pre_Click_Time2) < Click_Space_time and GetItemCount(2,97,236) < 1 then
		Msg2Player(format("ThÍi gian CD nh p vµo B∂o R≠¨ng lµ %d gi©y",Click_Space_time));
		return 0;	
	end
	if LSB_Check_LR() == 0 and GetItemCount(2,97,236) < 1 then
			return 0;
	end
			
	
	local nNpcIndex = GetTargetNpc();
	--À˘ Ù≈–∂œ
--	local nNpcIndex = GetTargetNpc();
--	if nNpcIndex ~= GetTaskTemp(Gld_Boss_Index) then
--		return 0;
--	end
	--±≥∞¸ø’º‰≈–∂œ
	if gf_Judge_Room_Weight(2,2) ~= 1 then
		Talk(1,"","Kh´ng gian hµnh trang kh´ng ÆÒ");
    return 0;
	end
	
	if DelItem(2,97,236,1) == 1 then -- Thi™n ki™u l÷nh
		Msg2Player("ß∑ dÔng 1 Thi™n ki™u l÷nh mÎ B∂o R≠¨ng");
	end
	
	StartTimeGuage("B∂o R≠¨ng",60,0,1)
	SetTask(Pre_Click_Time2,GetTime());
	--∏¯Ω±¿¯c
	LSB_Get_Award_B();
	--»ŒŒÒ
	if tGtTask:check_cur_task(89) == 1 and GetTask(VET_LSB_GETBOX) < 1 then
		SetTask(VET_LSB_GETBOX,1);
		Msg2Player("Nh∆t ßπi B∂o R≠¨ng cÒa Boss Hoµng Kim(hoµn thµnh)");
	end
	SetNpcLifeTime(nNpcIndex,0);
end