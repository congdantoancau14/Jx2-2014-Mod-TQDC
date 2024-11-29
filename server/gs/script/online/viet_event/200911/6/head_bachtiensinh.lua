-- Event B¹ch Tiªn Sinh VNG
-- Created by TuanNA5

TSK_NGOCTRAI = 2542
BYTE_COUNT = 1
BYTE_FLAG = 2
TSK_THONUONG = 2543
BYTE_COUNT_COLLECT = 1
BYTE_COUNT_FINISH = 2
BYTE_DAY = 3 
BYTE_MONTH = 4
TSK_THONUONG_ACCEPT = 2544

szNpcName = "<color=green>B¹ch Tiªn Sinh<color>: "

tb_20101201_ThitNuong = 
{
	[2] = { 10000000 ,  2 },
	[3] = { 12000000 , 2 },
	[4] = { 24000000 , 2 },
	[5] = { 36000000 , 2 },
	[6] = { 48000000 , 2 },
	[7] = { 60000000 , 2 },
	[8] = { 80000000 , 4 },
	[9] = { 100000000 , 4 }	
}

tb_thonuong_award = {	
	[2] = 5555555,
	[3] = 11111111,
	[4] = 22222222,
	[5] = 33333333,
	[6] = 44444444,
	[7] = 55555555,
	[8] = 66666666,
	[9] = 77777777,
}


function get_task_thonuong(nByte)
	return GetByte(GetTask(TSK_THONUONG),nByte)
end

function set_task_thonuong(nByte,nVal)
	SetTask(TSK_THONUONG, SetByte(GetTask(TSK_THONUONG),nByte,nVal))
end
