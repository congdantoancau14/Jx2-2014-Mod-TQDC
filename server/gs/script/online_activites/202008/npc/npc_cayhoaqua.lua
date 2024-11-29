tFruit = {
	{"Nho",{2,1,30009}},
	{"M·ng cÇu",{2,1,30010}},
	{"M¨ng côt",{2,1,30011}},
	{"Vó s÷a",{2,1,30012}},
	{"SÇu riªng",{2,1,30013}},
	{"Nh·n",{2,1,30164}},
	{"Ch«m Ch«m",{2,1,30165}},
	{"Cam",{2,1,30166}},
	{"D?a",{2,1,30167}},
	{"M¨ng côt",{2,1,30168}},
	{"B­ëi",{2,1,30169}},
	{"D©u",{2,1,30170}},
	{"Chuèi",{2,1,30171}},
	{"Xoµi",{2,1,30172}},
	{"§µo",{2,1,30173}},
	{"MËn",{2,1,30174}},
	{"V¶i",{2,1,30175}},
	{"T¸o",{2,1,30176}},
	{"B¬",{2,1,30177}},
	{"§u §ñ",{2,1,30178}},
	{"M·ng CÇu",{2,1,30179}},
	{"Kh?m",{2,1,30180}},
	{"Lª",{2,1,30181}},
	{"Bßn Bon",{2,1,30182}},
	{"Kh?",{2,1,30183}},
	{"Nho",{2,1,30098}},
	{"M·ng cÇu",{2,1,30099}},
	{"SÇu riªng",{2,1,30100}},

}

TASK_GETFRUIT_TIMEPOINT = 2001;
TASK_GETFRUIT_TOGGLEDELAY = 2002;
TASK_GOTFRUIT_COUNT = 2003;
GET_FRUITE_DELAY_TIME = 3600; -- seconds

function main()
	
	local nCurTime = GetTime();
	local nLastTime = GetTask(TASK_GETFRUIT_TIMEPOINT);
	local nTimeLeft = nCurTime - nLastTime;
	if nTimeLeft < GET_FRUITE_DELAY_TIME then
		Talk(1,"","<color=green>"..GetName().."<color>: Toµn lµ qu¶ xanh. Th«i chõa cho nã chÝn vËy!");
		if GetTask(TASK_GETFRUIT_TOGGLEDELAY) ~= 1 then
			StartTimeGuage("H¸i qu¶",GET_FRUITE_DELAY_TIME);
			SetTask(TASK_GETFRUIT_TOGGLEDELAY,1);
		end
	else
		local nGotFruit = GetTask(TASK_GOTFRUIT_COUNT);
		if nGotFruit < 10 then
			local nRand = random(getn(tFruit));
			AddItem(tFruit[nRand][2][1],tFruit[nRand][2][2],tFruit[nRand][2][3],1);
			nGotFruit = nGotFruit + 1;
			SetTask(TASK_GOTFRUIT_COUNT,nGotFruit);
		else
			SetTask(TASK_GETFRUIT_TIMEPOINT,nCurTime);
			SetTask(TASK_GETFRUIT_TOGGLEDELAY,0);
			nGotFruit = 0;
			SetTask(TASK_GOTFRUIT_COUNT,nGotFruit);
		end
	end
end;