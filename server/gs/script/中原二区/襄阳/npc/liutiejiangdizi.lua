--刘铁匠的徒弟脚本
--by vivi
--08/30/2007

--2008春节活动
Include("\\script\\online\\newyear08\\newyear08_head.lua");
--灵石头文件
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\weapon_upgrade\\upgrade_npc.lua");
--201403活动
Include("\\script\\online_activites\\2014_03\\task_camp.lua")


--临时变量
TT_BOX_TYPE = 123;

--任务变量
TASK_BUCHANG_ID = 1285;           --刘铁匠处物品补偿变量

buchang_id 	= 20071018;				--本次的补偿代号，存入补偿初始日期
buchang_start_date 	= 2007101800;			--补偿开始时间
buchang_end_date 	= 2047102600;			--补偿结束时间

THIS_FILE = "\\script\\中原二区\\襄阳\\npc\\liutiejiangdizi.lua"

tZbWz = {
	[1]={0,"u kh玦"},
	[2]={1,"Ngo筰 trang"},
	[3]={3,"H� y"}
	}

tChangeRing = {
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"Йng Phng Long Ch﹗",0,102,24},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"L祄 gi秏 n閕, ngo筰 ph遪g c馻 i phng 10%",5,444},"Hi猲 Vi猲 Chi課"},
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"T祅g Ki誱 B秓 Ch﹗",0,102,38},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"Sinh l鵦, n閕 l鵦 t鑙 產 t╪g 8%",1,481},"Hi猲 Vi猲 Chi課"},
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"C鰑 Thi猲 Huy襫 Ng鋍",0,102,129},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"S鴆 m筺h +40",7,264},"Hi猲 Vi猲 Chi課"},
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"C鰑 Thi猲 Huy襫 B閕",0,102,132},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"N閕 c玭g +40",7,267},"Hi猲 Vi猲 Chi課"},
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"C鰑 Thi猲 Huy襫 Ho祅",0,102,131},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"G﹏ c鑤 +40",7,263},"Hi猲 Vi猲 Chi課"},
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"C鰑 Thi猲 Huy襫 Цi",0,102,130},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"Th﹏ ph竝 +40",7,265},"Hi猲 Vi猲 Chi課"},
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"C鰑 Thi猲 Huy襫 Gi韎",0,102,133},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"Linh ho箃 +40",7,266},"Hi猲 Vi猲 Chi課"},
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"C鰑 Thi猲 Huy襫 Чi",0,102,134},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"T蕁 c玭g k蘭 c s竧 35",1,480},"Hi猲 Vi猲 Chi課"},
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"C鰑 Thi猲 Huy襫 Th筩h",0,102,135},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"S竧 thng t╪g 40",2,331},"Hi猲 Vi猲 Chi課"},
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"Khu蕋 Nguy猲 B閕",0,102,27},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"600 gi﹜  b襫 v� kh� h錳 ph鬰 5",5,43},"Hi猲 Vi猲 Chi課"},
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"Чi L鵦 Th莕 H筺g Li猲",0,102,28},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"T鑓  di chuy觧 t╪g 10%",1,101},"Hi猲 Vi猲 u"},
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"T祅g Ki誱 Kim 蕁",0,102,40},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"S竧 thng gi秏 10%",3,107},"Hi猲 Vi猲 u"},
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"T祅g Ki誱 K� Th筩h",0,102,39},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"T� l� xu蕋 chi猽 t╪g 3%",2,27},"Hi猲 Vi猲 u"},
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"C鰑 Thi猲 Huy襫 Ng鋍",0,102,129},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"S鴆 m筺h +40",7,264},"Hi猲 Vi猲 u"},
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"C鰑 Thi猲 Huy襫 B閕",0,102,132},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"N閕 c玭g +40",7,267},"Hi猲 Vi猲 u"},
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"C鰑 Thi猲 Huy襫 Ho祅",0,102,131},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"G﹏ c鑤 +40",7,263},"Hi猲 Vi猲 u"},
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"C鰑 Thi猲 Huy襫 Цi",0,102,130},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"Th﹏ ph竝 +40",7,265},"Hi猲 Vi猲 u"}, 
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"C鰑 Thi猲 Huy襫 Gi韎",0,102,133},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"Linh ho箃 +40",7,266},"Hi猲 Vi猲 u"},
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"C鰑 Thi猲 Huy襫 Чi",0,102,134},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"T蕁 c玭g k蘭 c s竧 35",1,480},"Hi猲 Vi猲 u"},
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"C鰑 Thi猲 Huy襫 Th筩h",0,102,135},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"S竧 thng t╪g 40",2,331},"Hi猲 Vi猲 u"},
{{"Th祅h Th� kim b秓 rng",2,0,1028,2},{"Khu蕋 Nguy猲 B閕",0,102,27},{"T鑓  thi tri觧 v� c玭g t╪g 5%",1,477,"Sinh l鵦 t鑙 產 6%",2,253,"S鴆 l鵦 t╪g 1000",1,479},"Hi猲 Vi猲 u"}
	}

tXuanyuanZhan = 
{
	[0] = {{"Hi猲 Vi猲 Chi課",0,102,8801},{"Hi猲 Vi猲 Chi課",0,102,8803},{"Hi猲 Vi猲 Chi課",0,102,8805},{"Hi猲 Vi猲 Chi課",0,102,8807},{"Hi猲 Vi猲 Chi課",0,102,8809},{"Hi猲 Vi猲 Chi課",0,102,8811},{"Hi猲 Vi猲 Chi課",0,102,8813},{"Hi猲 Vi猲 Chi課",0,102,8815},{"Hi猲 Vi猲 Chi課",0,102,8817},{"Hi猲 Vi猲 Chi課",0,102,8819},{"Hi猲 Vi猲 Chi課",0,102,8821},{"Hi猲 Vi猲 Chi課",0,102,8823},{"Hi猲 Vi猲 Chi課",0,102,8825},{"Hi猲 Vi猲 Chi課",0,102,8827}},
	[1] = {{"Hi猲 Vi猲 Chi課",0,102,8801},{"Hi猲 Vi猲 Chi課",0,102,8803},{"Hi猲 Vi猲 Chi課",0,102,8805}},
	[2] = {{"Hi猲 Vi猲 Chi課",0,102,8801}},
	[3] = {{"Hi猲 Vi猲 Chi課",0,102,8803}},
	[4] = {{"Hi猲 Vi猲 Chi課",0,102,8805}},
	[5] = {{"Hi猲 Vi猲 Chi課",0,102,8807}},
	[6] = {{"Hi猲 Vi猲 Chi課",0,102,8807}},
	[7] = {{"Hi猲 Vi猲 Chi課",0,102,8809},{"Hi猲 Vi猲 Chi課",0,102,8811}},
	[8] = {{"Hi猲 Vi猲 Chi課",0,102,8809}},
	[9] = {{"Hi猲 Vi猲 Chi課",0,102,8811}},
	[10] = {{"Hi猲 Vi猲 Chi課",0,102,8813},{"Hi猲 Vi猲 Chi課",0,102,8815}},
	[11] = {{"Hi猲 Vi猲 Chi課",0,102,8813}},
	[12] = {{"Hi猲 Vi猲 Chi課",0,102,8815}},
	[13] = {{"Hi猲 Vi猲 Chi課",0,102,8817},{"Hi猲 Vi猲 Chi課",0,102,8819}},
	[14] = {{"Hi猲 Vi猲 Chi課",0,102,8817}},
	[15] = {{"Hi猲 Vi猲 Chi課",0,102,8819}},
	[16] = {{"Hi猲 Vi猲 Chi課",0,102,8821},{"Hi猲 Vi猲 Chi課",0,102,8823}},
	[17] = {{"Hi猲 Vi猲 Chi課",0,102,8821}},
	[18] = {{"Hi猲 Vi猲 Chi課",0,102,8823}},
	[19] = {{"Hi猲 Vi猲 Chi課",0,102,8825},{"Hi猲 Vi猲 Chi課",0,102,8827}},
	[20] = {{"Hi猲 Vi猲 Chi課",0,102,8825}},
	[21] = {{"Hi猲 Vi猲 Chi課",0,102,8827}},
}
	
tXuanyuanDou = 
{
	[0] = {{"Hi猲 Vi猲 u",0,102,8802},{"Hi猲 Vi猲 u",0,102,8804},{"Hi猲 Vi猲 u",0,102,8806},{"Hi猲 Vi猲 u",0,102,8808},{"Hi猲 Vi猲 u",0,102,8810},{"Hi猲 Vi猲 u",0,102,8812},{"Hi猲 Vi猲 u",0,102,8814},{"Hi猲 Vi猲 u",0,102,8816},{"Hi猲 Vi猲 u",0,102,8818},{"Hi猲 Vi猲 u",0,102,8820},{"Hi猲 Vi猲 u",0,102,8822},{"Hi猲 Vi猲 u",0,102,8824},{"Hi猲 Vi猲 u",0,102,8826},{"Hi猲 Vi猲 u",0,102,8828}},
	[1] = {{"Hi猲 Vi猲 u",0,102,8802},{"Hi猲 Vi猲 u",0,102,8804},{"Hi猲 Vi猲 u",0,102,8806}},
	[2] = {{"Hi猲 Vi猲 u",0,102,8802}},
	[3] = {{"Hi猲 Vi猲 u",0,102,8804}},
	[4] = {{"Hi猲 Vi猲 u",0,102,8806}},
	[5] = {{"Hi猲 Vi猲 u",0,102,8808}},
	[6] = {{"Hi猲 Vi猲 u",0,102,8808}},
	[7] = {{"Hi猲 Vi猲 u",0,102,8810},{"Hi猲 Vi猲 u",0,102,8812}},
	[8] = {{"Hi猲 Vi猲 u",0,102,8810}},
	[9] = {{"Hi猲 Vi猲 u",0,102,8812}},
	[10] = {{"Hi猲 Vi猲 u",0,102,8814},{"Hi猲 Vi猲 u",0,102,8816}},
	[11] = {{"Hi猲 Vi猲 u",0,102,8814}},
	[12] = {{"Hi猲 Vi猲 u",0,102,8816}},
	[13] = {{"Hi猲 Vi猲 u",0,102,8818},{"Hi猲 Vi猲 u",0,102,8820}},
	[14] = {{"Hi猲 Vi猲 u",0,102,8818}},
	[15] = {{"Hi猲 Vi猲 u",0,102,8820}},
	[16] = {{"Hi猲 Vi猲 u",0,102,8822},{"Hi猲 Vi猲 u",0,102,8824}},
	[17] = {{"Hi猲 Vi猲 u",0,102,8822}},
	[18] = {{"Hi猲 Vi猲 u",0,102,8824}},
	[19] = {{"Hi猲 Vi猲 u",0,102,8826},{"Hi猲 Vi猲 u",0,102,8828}},
	[20] = {{"Hi猲 Vi猲 u",0,102,8826}},
	[21] = {{"Hi猲 Vi猲 u",0,102,8828}},
}

tHuangDiWeapon = 
{
	[0] = {{"Hi猲 Vi猲 To竔 V� o",0,3,8801},{"Hi猲 Vi猲 To竔 V� C玭",0,5,8802},{"Hi猲 Vi猲 C鰑 Nh� Trng",0,8,8803},{"Hi猲 Vi猲 H筼 Nhi猲 Th�",0,0,8804},{"Hi猲 Vi猲 Gi韎 T� Kim",0,1,8805},{"Hi猲 Vi猲 T� Tinh Ki誱",0,2,8806},{"Hi猲 Vi猲 Ph鬾g Ho祅g C莔",0,10,8807},{"Hi猲 Vi猲 Ng� Nh筩 Th�",0,0,8808},{"Hi猲 Vi猲 Ph� Thi猲 C玭",0,5,8809},{"Hi猲 Vi猲 H錸g Qu﹏ Ki誱",0,2,8810},{"Hi猲 Vi猲 Sinh T� B髏",0,9,8811},{"Hi猲 Vi猲 Ph� Qu﹏ Thng",0,6,8812},{"Hi猲 Vi猲 Khai Thi猲 Cung",0,4,8813},{"Hi猲 Vi猲  Dng Nh蒼",0,7,8814},{"Hi猲 Vi猲 U Minh Tr秓",0,11,8815}},
	[1] = {{"Hi猲 Vi猲 To竔 V� o",0,3,8801},{"Hi猲 Vi猲 To竔 V� C玭",0,5,8802},{"Hi猲 Vi猲 C鰑 Nh� Trng",0,8,8803},{"Hi猲 Vi猲 H筼 Nhi猲 Th�",0,0,8804}},
	[2] = {{"Hi猲 Vi猲 To竔 V� o",0,3,8801},{"Hi猲 Vi猲 To竔 V� C玭",0,5,8802}},
	[3] = {{"Hi猲 Vi猲 C鰑 Nh� Trng",0,8,8803}},
	[4] = {{"Hi猲 Vi猲 H筼 Nhi猲 Th�",0,0,8804}},
	[5] = {{"Hi猲 Vi猲 Gi韎 T� Kim",0,1,8805}},
	[6] = {{"Hi猲 Vi猲 Gi韎 T� Kim",0,1,8805}},
	[7] = {{"Hi猲 Vi猲 T� Tinh Ki誱",0,2,8806},{"Hi猲 Vi猲 Ph鬾g Ho祅g C莔",0,10,8807}},
	[8] = {{"Hi猲 Vi猲 T� Tinh Ki誱",0,2,8806}},
	[9] = {{"Hi猲 Vi猲 Ph鬾g Ho祅g C莔",0,10,8807}},
	[10] = {{"Hi猲 Vi猲 Ng� Nh筩 Th�",0,0,8808},{"Hi猲 Vi猲 Ph� Thi猲 C玭",0,5,8809}},
	[11] = {{"Hi猲 Vi猲 Ng� Nh筩 Th�",0,0,8808}},
	[12] = {{"Hi猲 Vi猲 Ph� Thi猲 C玭",0,5,8809}},
	[13] = {{"Hi猲 Vi猲 H錸g Qu﹏ Ki誱",0,2,8810},{"Hi猲 Vi猲 Sinh T� B髏",0,9,8811}},
	[14] = {{"Hi猲 Vi猲 H錸g Qu﹏ Ki誱",0,2,8810}},
	[15] = {{"Hi猲 Vi猲 Sinh T� B髏",0,9,8811}},
	[16] = {{"Hi猲 Vi猲 Ph� Qu﹏ Thng",0,6,8812},{"Hi猲 Vi猲 Khai Thi猲 Cung",0,4,8813}},
	[17] = {{"Hi猲 Vi猲 Ph� Qu﹏ Thng",0,6,8812}},
	[18] = {{"Hi猲 Vi猲 Khai Thi猲 Cung",0,4,8813}},
	[19] = {{"Hi猲 Vi猲  Dng Nh蒼",0,7,8814},{"Hi猲 Vi猲 U Minh Tr秓",0,11,8815}},
	[20] = {{"Hi猲 Vi猲  Dng Nh蒼",0,7,8814}},
	[21] = {{"Hi猲 Vi猲 U Minh Tr秓",0,11,8815}},
}
	

tChangeWp = {
	[1]={"Hi猲 Vi猲 To竔 V� o",0,3,8801},
	[2]={"Hi猲 Vi猲 To竔 V� C玭",0,5,8802},
	[3]={"Hi猲 Vi猲 C鰑 Nh� Trng",0,8,8803}, 
	[4]={"Hi猲 Vi猲 H筼 Nhi猲 Th�",0,0,8804},
	[5]={"Hi猲 Vi猲 Gi韎 T� Kim",0,1,8805},
	[6]={"Hi猲 Vi猲 T� Tinh Ki誱",0,2,8806},
	[7]={"Hi猲 Vi猲 Ph鬾g Ho祅g C莔",0,10,8807},
	[8]={"Hi猲 Vi猲 Ng� Nh筩 Th�",0,0,8808},
	[9]={"Hi猲 Vi猲 Ph� Thi猲 C玭",0,5,8809},
	[10]={"Hi猲 Vi猲 H錸g Qu﹏ Ki誱",0,2,8810},
	[11]={"Hi猲 Vi猲 Sinh T� B髏",0,9,8811},
	[12]={"Hi猲 Vi猲 Ph� Qu﹏ Thng",0,6,8812},
	[13]={"Hi猲 Vi猲 Khai Thi猲 Cung",0,4,8813},
	[14]={"Hi猲 Vi猲  Dng Nh蒼",0,7,8814},
	[15]={"Hi猲 Vi猲 U Minh Tr秓",0,11,8815}
	}

tWpChangeRing = {
	 [1]={{"Hi猲 Vi猲 Chi課",0,102,8801},{"Hi猲 Vi猲 u",0,102,8802}},
	 [2]={{"Hi猲 Vi猲 Chi課",0,102,8801},{"Hi猲 Vi猲 u",0,102,8802}},
	 [3]={{"Hi猲 Vi猲 Chi課",0,102,8803},{"Hi猲 Vi猲 u",0,102,8804}}, 
	 [4]={{"Hi猲 Vi猲 Chi課",0,102,8805},{"Hi猲 Vi猲 u",0,102,8806}},
	 [5]={{"Hi猲 Vi猲 Chi課",0,102,8807},{"Hi猲 Vi猲 u",0,102,8808}},
	 [6]={{"Hi猲 Vi猲 Chi課",0,102,8809},{"Hi猲 Vi猲 u",0,102,8810}},
	 [7]={{"Hi猲 Vi猲 Chi課",0,102,8811},{"Hi猲 Vi猲 u",0,102,8812}},
	 [8]={{"Hi猲 Vi猲 Chi課",0,102,8813},{"Hi猲 Vi猲 u",0,102,8814}},
	 [9]={{"Hi猲 Vi猲 Chi課",0,102,8815},{"Hi猲 Vi猲 u",0,102,8816}},
	[10]={{"Hi猲 Vi猲 Chi課",0,102,8817},{"Hi猲 Vi猲 u",0,102,8818}},
	[11]={{"Hi猲 Vi猲 Chi課",0,102,8819},{"Hi猲 Vi猲 u",0,102,8820}},
	[12]={{"Hi猲 Vi猲 Chi課",0,102,8821},{"Hi猲 Vi猲 u",0,102,8822}},
	[13]={{"Hi猲 Vi猲 Chi課",0,102,8823},{"Hi猲 Vi猲 u",0,102,8824}},
	[14]={{"Hi猲 Vi猲 Chi課",0,102,8825},{"Hi猲 Vi猲 u",0,102,8826}},
	[15]={{"Hi猲 Vi猲 Chi課",0,102,8827},{"Hi猲 Vi猲 u",0,102,8828}}
	}

tBaguaNum = {--第2，3，4为物品id，第5位为灵气值81-100需要的数量  第六位灵气值61-80需要的数量
	[1]={"Kh秏",2,1,471,10,10},
	[2]={"Kh玭",2,1,470,10,10},
	[3]={"Ch蕁",2,1,474,3,2},
	[4]={"T鑞",2,1,476,3,2},
	[6]={"C祅",2,1,469,10,10},
	[7]={"礽",2,1,472,10,10},
	[8]={"C蕁",2,1,475,3,3},
	[9]={"Ly",2,1,473,3,3}
	};

--八九级武器
tHighLvWp = {{"Th莕 Quy",0,0,15},{" Dng 蕁",0,0,16},{"H鋋 秐h",0,2,37},{"Nha C鰑",0,2,38},{"Ng鋍 Tr�",0,5,41},{"Th莕 Ch﹎",0,5,42},
{"Khoa Ph�",0,1,54},{"Kh玭g c�",0,1,55},{"L藆 C秐h",0,3,65},{"Ngh辌h L﹏",0,3,66},{"Чi Th竛h Di ",0,10,76},{"Kh� M閏 Long Ng﹎",0,10,77},{"Toan D�",0,9,87},
{"Th竔 H�",0,9,88},{"M鬰 Ki襫 Li猲 Trng",0,8,98},{"Dc S� trng",0,8,99},{"C鰑 Long To祅 K輈h",0,6,109},{"Thng N�",0,6,110},{"Vi猲 б",0,4,120},
{"B蕋 X� Chi X�",0,4,121},{"V� Ng蕁",0,11,13},{"Thanh Long",0,11,14},{"B輈h Th駓",0,7,13},{"Thi猲 T玭",0,7,14}}; 

--天地玄黄武器
tTiandiWp ={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17},{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39},{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43},{"Thi猲 мa Huy襫 Ho祅g Kh� ",0,1,56},{"Thi猲 мa Huy襫 Ho祅g Dao",0,3,67},{"Thi猲 мa Huy襫 Ho祅g C莔",0,10,78},{"Thi猲 мa Huy襫 Ho祅g B髏 ",0,9,89},{"Thi猲 мa Huy襫 Ho祅g Trng",0,8,100},{"Thi猲 мa Huy襫 Ho祅g Thng ",0,6,111},{"Thi猲 мa Huy襫 Ho祅g Cung ",0,4,122},{"Thi猲 мa Huy襫 Ho祅g Tr秓",0,11,15},{"Thi猲 мa Huy襫 Ho祅g Nh蒼 ",0,7,15}};

--天地玄黄装备 四个体型
tTiandiZb = {
	[1] = {{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,85},{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,86},{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,87},{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,88}},
	[2] = {{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,85},{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,86},{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,87},{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,88}},
	[4] = {{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,85},{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,86},{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,87},{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,88}},
};

tTiandi = {
	{{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,85},{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,86},{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,87},{"Thi猲 мa Huy襫 Ho祅g Kh玦",0,103,88}},
	{{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,85},{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,86},{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,87},{"Thi猲 мa Huy襫 Ho祅g Gi竝 ",0,100,88}},
	{{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,85},{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,86},{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,87},{"Thi猲 мa Huy襫 Ho祅g Trang",0,101,88}},
	{[0]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17},{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39},{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43},{"Thi猲 мa Huy襫 Ho祅g Kh� ",0,1,56},{"Thi猲 мa Huy襫 Ho祅g Dao",0,3,67},{"Thi猲 мa Huy襫 Ho祅g C莔",0,10,78},{"Thi猲 мa Huy襫 Ho祅g B髏 ",0,9,89},{"Thi猲 мa Huy襫 Ho祅g Trng",0,8,100},{"Thi猲 мa Huy襫 Ho祅g Thng ",0,6,111},{"Thi猲 мa Huy襫 Ho祅g Cung ",0,4,122},{"Thi猲 мa Huy襫 Ho祅g Tr秓",0,11,15},{"Thi猲 мa Huy襫 Ho祅g Nh蒼 ",0,7,15}},
	 [1]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17},{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43},{"Thi猲 мa Huy襫 Ho祅g Dao",0,3,67},{"Thi猲 мa Huy襫 Ho祅g Trng",0,8,100}},
	 [2]={{"Thi猲 мa Huy襫 Ho祅g Dao",0,3,67},{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43}},
	 [3]={{"Thi猲 мa Huy襫 Ho祅g Trng",0,8,100}},
	 [4]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17}},
	 [5]={{"Thi猲 мa Huy襫 Ho祅g Kh� ",0,1,56}},
	 [6]={{"Thi猲 мa Huy襫 Ho祅g Kh� ",0,1,56}},
	 [7]={{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39},{"Thi猲 мa Huy襫 Ho祅g C莔",0,10,78}},
	 [8]={{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39}},
	 [9]={{"Thi猲 мa Huy襫 Ho祅g C莔",0,10,78}},
	 [10]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17},{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43}},
	 [11]={{"Thi猲 мa Huy襫 Ho祅g Th�",0,0,17}},
	 [12]={{"Thi猲 мa Huy襫 Ho祅g C玭",0,5,43}},
	 [13]={{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39},{"Thi猲 мa Huy襫 Ho祅g B髏 ",0,9,89}},
	 [14]={{"Thi猲 мa Huy襫 Ho祅g Ki誱 ",0,2,39}},
	 [15]={{"Thi猲 мa Huy襫 Ho祅g B髏 ",0,9,89}},
	 [16]={{"Thi猲 мa Huy襫 Ho祅g Thng ",0,6,111},{"Thi猲 мa Huy襫 Ho祅g Cung ",0,4,122}},
	 [17]={{"Thi猲 мa Huy襫 Ho祅g Thng ",0,6,111}},
	 [18]={{"Thi猲 мa Huy襫 Ho祅g Cung ",0,4,122}},
	 [19]={{"Thi猲 мa Huy襫 Ho祅g Tr秓",0,11,15},{"Thi猲 мa Huy襫 Ho祅g Nh蒼 ",0,7,15}},
	 [20]={{"Thi猲 мa Huy襫 Ho祅g Nh蒼 ",0,7,15}},
	 [21]={{"Thi猲 мa Huy襫 Ho祅g Tr秓",0,11,15}}}
	};

tHuihuang = {{"Huy Ho祅g Chi Th駓",0,102,8840},{"Huy Ho祅g Chi K�",0,102,8842},{"Huy Ho祅g Qu藅 Kh雐",0,102,8844},{"Huy Ho祅g",0,102,8846}};
tRongyao = {{"Vinh D� Chi Th駓",0,102,8841},{"Vinh D� Chi K�",0	,102,8843},{"Vinh D� Qu藅 Kh雐",0,102,8845},{"Vinh D�",	0,102,8847}};
tUplevel = {{"Thi猲 Th筩h Tinh Th筩h",2,1,1009,400},{"Thi猲 Th筩h Tinh Th筩h",2,1,1009,400},{"Thi猲 Th筩h Tinh Th筩h",2,1,1009,1000}};

function main()
	local strtab = {
--		"我要提升灵气装备的等级/enhance_level",
--		"你能提升什么样的灵气装备/about_enhance",
		"Ch� t筼 v� n﹏g c蕄 trang b�/npc_upgrade_talk",
		
		"Vi猰 д/ViemDeMenu",
		"Tng Qu﹏/TuongQuanMenu",
		"Nguy猲 So竔/NguyenSoaiMenu",
		"Thi猲 H� V� Song/VoSong_Menu",
--		"Chuy觧 i trang b� T鑞g Li猽/npc_convert_talk",
		"Chuy觧 h鉧 trang b� linh kh�/lingqi_item_change",			
--		"炎黄帝装备相关/about_huangdi",
--		"我要用各种宝箱兑换月华/box_change_yuehua",
--		"天地玄黄装备相关/about_tdxh",
--		"装备灵气变化相关/add_item_lingqi",
--		"Th╪g c蕄 trang b�/item_uplevel",
--		"步非烟、月亮兔药包等黄金装备相关/about_bufeiyan",
--		"辉煌荣耀相关内容/about_hhry"
		}
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20130925 then
		tinsert(strtab,1,"R蘮 l筰 v� kh�/NangCapLevelVuKhi_Menu")
	end
	if nDate <= 20441012 then
		tinsert(strtab,1,"Trang b� L玦 H�/LoiHo_Menu")
	end
--	local nDate = tonumber(date("%Y%m%d%H"));
--	if nDate >= buchang_start_date and nDate < buchang_end_date then
--		tinsert(strtab,"Ta mu鑞 nh薾 b錳 thng/buchang_dia");
--	end;
--	local nTime = tonumber(date("%Y%m%d%H"));
--	if nTime >= 2008091108 and nTime <= 2008101207 then
--		tinsert(strtab,1,"M鮪g Tam Ti誸, mi詎 ph� th竜 r阨 trang b� B竧 Qu竔 (h誸 h筺 l骳 7h ng祔 12/10)/lingqi_item_update");
--	elseif nTime >= 2008101208 then
--		tinsert(strtab,3,"V� trang b� B竧 Qu竔/lingqi_item_update")
--	end	
	--tinsert(strtab,"Cng h鉧 may m緉/LuckyEnhance");
	--活动
	if gf_CheckEventDateEx(WN_201403_CAMPTASK_ID) == 1 then
		tinsert(strtab, WN_201403_CAMPTASK_AWARD);
	end
	--
	tinsert(strtab,"Ta ch� n th╩ c藆 th玦!/nothing")
	Say("<color=green>е t� th� r蘮 L璾<color>: Ta l�  t� gi醝 nh蕋 c馻 L璾 s� ph�. Ta c� th� gi髉 ngi th╪g c蕄 trang b� linh kh� cao c蕄. Ngo礽 ra, n誹 ngi c� trang b� thng c� th莕 kh� Ho祅g д, ta c騨g c� th� th鎖 th莕 kh� gi髉 ngi, l祄 cho trang b� ph� h頿 v韎 ngi h琻. <color=red>L璾 �, n誹 v� kh� c馻 ngi  k輈h ho箃 Linh Ph竎h, sau khi ta ti課 h祅h thao t竎, Linh Ph竎h s� b� hu�.<color>",
		getn(strtab),
		strtab);
end

function LuckyEnhance()
	Say("<color=green> е t� th� r蘮 L璾 <color>:  Cng h鉧 may m緉 c� th� gi髉 trang b� t� c蕄 7 n c蕄 8 cng h鉧 ng蓇 nhi猲 t� c蕄 8 n c蕄 11. Trang b� c蕄 7 ch璦 nh h錸 khi th蕋 b筰 quay v� 0.<color><color=red>  Trang b� nh h錸 c蕄 10 kh玭g th� s� d鬾g ch鴆 n╪g n祔.<color>"
		, 2
		, "X竎 nh cng h鉧 may m緉/TrueLuckyEnhance"
		, "Ta ch� gh� ch琲/nothing"
		);
end

function TrueLuckyEnhance()
	LuckyEnhanceEquipment();
end


function about_huangdi()
	Say("N誹 ngi c� ki誱 c� Ho祅g , ta s� gi髉 ngi truy襫 th莕 kh�,  n� ph� h頿 v韎 ngi.",
		7,
		"Ta mu鑞 t╪g tr� s� v� kh� Ho祅g /weapon_update",
		"Ta mu鑞 i trang b� Ho祅g  c� thu閏 t輓h c bi謙/change_ring",
		"L祄 th� n祇 i trang b� Ho祅g  c� thu閏 t輓h c bi謙/#how_change_ring(0)",
		"Ta mu鑞 d飊g v� kh� Ho祅g  i trang s鴆 Ho祅g /weapon_change_ring",
		"Ta mu鑞 d飊g 15 Rng Ho祅g Kim Th辬h Th�  i v� kh� Ho祅g д/box_change_weapon",
		"Ta mu鑞 d飊g 4 Rng Ho祅g Kim Th辬h Th�  i trang s鴆 Ho祅g д/jinbox_huan_ring",
		"Ch鋘 sai r錳, tr� l筰/main")
end

function enhance_level()
	if GetLevel() < 80 then
		Talk(1,"","Ta ch� l� cao th� t╪g ng c蕄 linh kh� trang b�, ngi ph秈 kh� luy謓 m閠 phen tr猲 giang h� n鱝, n <color=yellow>c蕄 80<color> h穣 n t譵 ta.");
	else
		Say("Ngi mu鑞 t╪g ng c蕄 trang b� c馻 v� tr� n祇",
			4,
			"u kh玦/#enhance_zhuangbei(0)",
			"Ngo筰 trang/#enhance_zhuangbei(1)",
			"H� y/#enhance_zhuangbei(3)",
			"ьi ta m芻 trang b� l猲 ./nothing"
			)
	end
end

function enhance_zhuangbei(nWz)
	local nTb = 3;
	if nWz ~= 3 then
		nTb = nWz+1;
	end
	local nIndex = GetPlayerEquipIndex(nWz);	
	local nPlayerLv = floor(GetLevel()/10);
	local nZhuangbeiLv = GetEquipLevel(nIndex); --获取当前装备等级
	local nLingqi = GetItemMaxLingQi(nIndex);   --获取灵气值
	if nIndex	== 0 then
		Talk(1,"","Ngi kh玭g m芻 theo "..tZbWz[nTb][2].." �?");
		return
	else 
		if nLingqi == 0 or nZhuangbeiLv < 7 then
			Talk(1,"","Ta ch� t╪g linh kh� trang b� c蕄 7 ho芻 c蕄 8, xin x竎 nh  m芻 "..tZbWz[nTb][2].."!");
			return
		end
		if nPlayerLv <= nZhuangbeiLv then
			Talk(1,"","Quy t綾 t╪g c蕄 trang b� l� ch� c� th� t╪g <color=yellow>ng c蕄 trang b� ph秈 nh� h琻 ng c蕄 c馻 ngi v� chia cho 10 (l蕐 ch絥)<color>, trang b� hi謓 t筰 c馻 ngi <color=red>kh玭g th�<color> t╪g c蕄, i trang b� kh竎 r錳 n t譵 ta!")
			return
		else
			Say("觤 linh kh� di <color=yellow>80 mi詎 ph�<color> t╪g ng c蕄 trang b�, 甶觤 linh kh� <color=yellow>80 ho芻 h琻<color> m鏸 l莕 t╪g ng c蕄 trang b� s� l蕐 <color=yellow>10 v祅g<color>. C� mu鑞 t╪g ng c蕄 linh kh� trang b� kh玭g?",
				2,
				"Л頲, ta mu鑞 t╪g"..tZbWz[nTb][2].."ng c蕄 linh kh� trang b� /#confirm_enhance("..nWz..")",
				"Ta suy ngh� l筰/nothing")
		end		
	end
end

function confirm_enhance(nWz)
	local nTb = 3;
	if nWz ~= 3 then
		nTb = nWz+1;
	end	
	local nIndex = GetPlayerEquipIndex(nWz);
	local nLingqi = GetItemMaxLingQi(nIndex);
	local nMaxLv = floor(GetLevel()/10);
	local nBaseLv = GetEquipBaseLevel(nIndex); --获取装备基础等级
	if nLingqi >= 80 then
		if GetCash() < 100000 then
			Talk(1,"","Ngi kh玭g c�  <color=yellow>10 v祅g<color> �");
			return
		end
		if Pay(100000) == 1 then
			if SetItemIncreaseLevel(nIndex,(nMaxLv-nBaseLv)) == 1 then
				Talk(1,"","Ch骳 m鮪g ngi, t╪g c蕄 trang b� <color=yellow>th祅h c玭g<color>!")
				Msg2Player("T╪g c蕄 linh kh� trang b� th祅h c玭g!");
				WriteLog("T╪g c蕄 linh kh� trang b�: Ngi ch琲 "..GetName().."T╪g"..tZbWz[nTb][2].."trang b� th祅h c玭g.");
			else
				WriteLog("T╪g c蕄 linh kh� trang b�: Ngi ch琲 "..GetName().."T╪g"..tZbWz[nTb][2].."trang b� th蕋 b筰.");
			end
		end
	else 
		if SetItemIncreaseLevel(nIndex,(nMaxLv-nBaseLv)) == 1 then
			Talk(1,"","Ch骳 m鮪g ngi, t╪g c蕄 trang b� <color=yellow>th祅h c玭g<color>!")
			Msg2Player("T╪g c蕄 linh kh� trang b� th祅h c玭g!");
			WriteLog("T╪g c蕄 linh kh� trang b�: Ngi ch琲 "..GetName().."T╪g"..tZbWz[nTb][2].."trang b� th祅h c玭g.");
		else
			WriteLog("T╪g c蕄 linh kh� trang b�: Ngi ch琲 "..GetName().."T╪g"..tZbWz[nTb][2].."trang b� th蕋 b筰.");
		end		
	end			
end

function about_enhance()
	Talk(1,"about_enhance2","Ta l� cao th� v� t╪g linh kh� trang b� cao c蕄, ta ch� t╪g c蕄 <color=yellow>n鉵, <color>thng y, <color=yellow>v�<color> h� y. Khi ngi t c蕄 80 tr� l猲, ta s� gi髉 ngi t╪g c蕄 linh kh� trang b� t� <color=yellow>c蕄 7<color> l猲 <color=yellow>c蕄 8<color>, n誹 ngi t c蕄 90 tr� l猲 th� s� gi髉 ngi t╪g c蕄 linh kh� trang b� t� <color=yellow>c蕄 7 ho芻 c蕄 8<color> l猲 <color=yellow>c蕄 9<color>.");
end

function about_enhance2()
	Talk(1,"main","觤 linh kh� di <color=yellow>80<color>, ta s� <color=yellow>mi詎 ph�<color> t╪g ng c蕄 trang b�; 甶觤 linh kh� <color=yellow>80 ho芻 h琻<color>, th� m鏸 trang b� s� thu ph� l� <color=yellow>10 v祅g<color>.");
end

function weapon_update()
	Say("<color=green>е t� th� r蘮 L璾<color>: Ngi c� th� a v� kh� Ho祅g д cho ta, ta s� gi髉 ngi thay i c竎 thu閏 t輓h c馻 v� kh� Ho祅g д mi詎 ph�, ngi c� th� thay i n khi n祇 v鮝 � th� th玦. Ngi x竎 nh薾 mu鑞 thay i? <color=red>L璾 �, trong l骳 i ph秈 trang b� v� kh� tr猲 ngi. Kh玭g gi� l筰 hi謚 qu� cng ho� v� nh h錸 c馻 v� kh�!<color>",
		2,
		"�, ta mu鑞 i./confirm_weapon_update",
		"Kh玭g, ta nh莔!/main")
end

function confirm_weapon_update()
	local nIndex = 0; --对应tChangeWp表的索引
	local nIdx = GetPlayerEquipIndex(2); --拿在手上的武器索引
	if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --锁定判断
		Talk(1,"","V藅 ph萴 n祔 l� v藅 ph萴 kh鉧, m� kh鉧 r錳 i nh�!");
		return
	end	
	for i = 1,getn(tChangeWp) do 
		local nId1,nId2,nId3 = GetPlayerEquipInfo(2);
		if nId1 == tChangeWp[i][2] and nId2 == tChangeWp[i][3] and nId3 == tChangeWp[i][4] then
			nIndex = i;
			break
		end
	end
	if nIdx == 0 or nIndex == 0 then  --没有拿武器或者拿的不是黄帝武器
		Talk(1,"","Ngi 產ng mang kh玭g ph秈 v� kh� Ho祅g , h穣 mang v� kh� Ho祅g  v祇 ngi 甶!");
		return
	else
		if DelItemByIndex(nIdx,-1) == 1 then
			if AddItem(tChangeWp[nIndex][2],tChangeWp[nIndex][3],tChangeWp[nIndex][4],1,1,-1,-1,-1,-1,-1,-1) == 1 then
				Msg2Player("Ngi  i 1 v� kh� Ho祅g  th祅h c玭g: "..tChangeWp[nIndex][1]);
			else
				WriteLog("е t� th� r蘮 L璾 t╪g c蕄 tr� s� v� kh� Ho祅g : Ngi ch琲 "..GetName().."i v� kh� Ho祅g  th蕋 b筰.");
			end
		end
	end		
end

function how_change_ring(nPage)
	local strtab = {};
	local nPageNum = 6;
	local nRemaid = getn(tChangeRing)-nPage*nPageNum;
	local nDiaNum = 6;
	if nRemaid < 6 then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,tChangeRing[nPage*nPageNum+i][1][5].."c竔"..tChangeRing[nPage*nPageNum+i][1][1].." (ho芻 1 "..tChangeRing[nPage*nPageNum+i][4]..") +1 "..tChangeRing[nPage*nPageNum+i][2][1].."--> Thu閏 t輓h c bi謙"..tChangeRing[nPage*nPageNum+i][4].."/#change_ring_detail("..(nPage*nPageNum+i)..")");
	end
	if nPage ~= 0 then
		tinsert(strtab,"Trang trc/#how_change_ring("..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"Trang k�/#how_change_ring("..(nPage+1)..")");
	end
	tinsert(strtab,"tr� l筰/main");
	Say("Ngi l蕐 <color=yellow>"..tChangeRing[1][1][5].."c竔"..tChangeRing[1][1][1].." ho芻 trang s鴆 Ho祅g  Hi猲 Vi猲 chi課 ho芻 Hi猲 Vi猲 u <color>th猰 m閠 trang s鴆 Ho祅g kim v鑞 c� cho ta, ta s� i <color=yellow>trang b� Ho祅g  Hi猲 Vi猲 chi課 ho芻 Hi猲 Vi猲 u c� thu閏 t輓h c bi謙 <color>cho ngi, quy t綾 i c� th� nh� sau, ch� �, h筺g li猲 kh竎 nhau s� i thu閏 t輓h trang b� Ho祅g  kh竎 nhau.",
		getn(strtab),
		strtab)
end

function change_ring_detail(nIndex)
	Talk(1,"#how_change_ring(0)","�"..tChangeRing[nIndex][1][5].."c竔"..tChangeRing[nIndex][1][1].." (ho芻 1 "..tChangeRing[nIndex][4]..") v� 1 "..tChangeRing[nIndex][2][1].."фi 3 thu閏 t輓h th祅h: <color=yellow>"..tChangeRing[nIndex][3][1]..","..tChangeRing[nIndex][3][4]..","..tChangeRing[nIndex][3][7].."<color> "..tChangeRing[nIndex][4]);
end

function change_ring()
	local strtab = {
		"Ta mu鑞 d飊g Rng v祅g Th辬h th� v� trang s鴆 Ho祅g kim i trang s鴆 Ho祅g  thu閏 t輓h c bi謙/#box_change_ring(0)",
		"Ta mu鑞 d飊g trang s鴆 Ho祅g  v� trang s鴆 Ho祅g kim i trang s鴆 Ho祅g  c� thu閏 t輓h c bi謙/#ring_change_ring(0)",
		"Ta kh玭g i/nothing"	
		}
	Say("Ngi mu鑞 d飊g v藅 ph萴 n祇  i? <color=red>Ch� �, trang s鴆 Ho祅g  v� trang s鴆 Ho祅g kim mu鑞 i u ph秈 mang l猲 ngi!<color>",
		getn(strtab),
		strtab)
end	

function box_change_ring(nPage)
	local strtab = {};
	local nPageNum = 7;
	local nRemaid = getn(tChangeRing)-nPage*nPageNum;
	local nDiaNum = 7;
	if nRemaid < 7 then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,tChangeRing[nPage*nPageNum+i][1][5].."c竔"..tChangeRing[nPage*nPageNum+i][1][1].." v� 1 "..tChangeRing[nPage*nPageNum+i][2][1].." i "..tChangeRing[nPage*nPageNum+i][4].."/#confirm_box_change_ring("..(nPage*nPageNum+i)..")");
	end
	if nPage ~= 0 then
		tinsert(strtab,"Trang trc/#box_change_ring("..(nPage-1)..")");
	end
	if nRemaid > 7 then
		tinsert(strtab,"Trang k�/#box_change_ring("..(nPage+1)..")");
	end
	tinsert(strtab,"ьi m閠 l竧, ta ph秈 mang trang s鴆 mu鑞 i l猲 ngi/nothing");		
	Say("Ch鋘 lo筰 ngi mu鑞 i. <color=red>Ch� �, t trang s鴆 Ho祅g kim ngi mu鑞 i v祇 v� tr� trang s鴆 u ti猲 tr猲 ngi!<color>",
		getn(strtab),
		strtab)
end

function confirm_box_change_ring(nIndex)
	Say("Ngi ch鋘 d飊g "..tChangeRing[nIndex][1][5].."c竔"..tChangeRing[nIndex][1][1].." v� 1 "..tChangeRing[nIndex][2][1].." i 3 thu閏 t輓h th祅h <color=yellow>"..tChangeRing[nIndex][3][1]..","..tChangeRing[nIndex][3][4]..","..tChangeRing[nIndex][3][7].."<color> "..tChangeRing[nIndex][4]..". X竎 nh kh玭g?",
		2,
		"уng �/#give_the_ring("..nIndex..")",
		"Ta ch鋘 nh莔 r錳./#box_change_ring(0)")
end

function give_the_ring(nIndex)
	if GetItemCount(tChangeRing[nIndex][1][2],tChangeRing[nIndex][1][3],tChangeRing[nIndex][1][4]) < 2 then
		Talk(1,"","Ngi kh玭g c�  "..tChangeRing[nIndex][1][1]);
		return
	end
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end	
	local nIdx = GetPlayerEquipIndex(4); --戴在第一个首饰位置的索引 
	if nIdx == 0 then
		Talk(1,"","Ngi kh玭g t trang s鴆 mu鑞 i v祇 v� tr� trang s鴆 u ti猲 tr猲 ngi �!");
		return
	end
	if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --锁定判断
		Talk(1,"","V藅 ph萴 ngi t � v� tr� trang s鴆 u ti猲 tr猲 ngi l� v藅 ph萴 kh鉧, m� kh鉧 r錳 i!");
		return
	end
	local nId1,nId2,nId3 = GetPlayerEquipInfo(4);
	if nId1 == tChangeRing[nIndex][2][2] and nId2 == tChangeRing[nIndex][2][3] and nId3 == tChangeRing[nIndex][2][4] then
		local nRoute = GetPlayerRoute();
		local nRand = 0;
		if nIndex < 11 then
			nRand = random(1,getn(tXuanyuanZhan[nRoute]));
		else
			nRand = random(1,getn(tXuanyuanDou[nRoute]));
		end 
		if DelItem(tChangeRing[nIndex][1][2],tChangeRing[nIndex][1][3],tChangeRing[nIndex][1][4],2) == 1 and DelItemByIndex(nIdx,-1) == 1 then
			local Add_flag = 0;
			if nIndex < 11 then
				Add_flag = AddItem(tXuanyuanZhan[nRoute][nRand][2],tXuanyuanZhan[nRoute][nRand][3],tXuanyuanZhan[nRoute][nRand][4],1,1,tChangeRing[nIndex][3][2],tChangeRing[nIndex][3][3],tChangeRing[nIndex][3][5],tChangeRing[nIndex][3][6],tChangeRing[nIndex][3][8],tChangeRing[nIndex][3][9]);
			else
				Add_flag = AddItem(tXuanyuanDou[nRoute][nRand][2],tXuanyuanDou[nRoute][nRand][3],tXuanyuanDou[nRoute][nRand][4],1,1,tChangeRing[nIndex][3][2],tChangeRing[nIndex][3][3],tChangeRing[nIndex][3][5],tChangeRing[nIndex][3][6],tChangeRing[nIndex][3][8],tChangeRing[nIndex][3][9]);
			end
			if Add_flag == 1 then
				Msg2Player("Ch骳 m鮪g ngi i trang s鴆 Ho祅g  th祅h c玭g!");
				WriteLog("е t� th� r蘮 L璾 i trang s鴆 Ho祅g : Ngi ch琲 "..GetName().."d飊g 2 "..tChangeRing[nIndex][1][1].." v�"..tChangeRing[nIndex][2][1].." i 1 trang s鴆 Ho祅g ");
			else
				WriteLog("е t� th� r蘮 L璾 i trang s鴆 Ho祅g : Ngi ch琲 "..GetName().."d飊g 2 "..tChangeRing[nIndex][1][1].." v�"..tChangeRing[nIndex][2][1].."фi trang s鴆 Ho祅g  th蕋 b筰, log: "..Add_flag);
			end
		end
	else
		Talk(1,"","� v� tr� trang s鴆 u ti猲 tr猲 ngi ngi kh玭g ph秈 "..tChangeRing[nIndex][2][1]);
		return
	end
end

function ring_change_ring(nPage)
	local strtab = {};
	local nPageNum = 7;
	local nRemaid = getn(tChangeRing)-nPage*nPageNum;
	local nDiaNum = 7;
	if nRemaid < 7 then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,"1 "..tChangeRing[nPage*nPageNum+i][4].." v� 1 "..tChangeRing[nPage*nPageNum+i][2][1].." i "..tChangeRing[nPage*nPageNum+i][4].."/#confirm_ring_change_ring("..(nPage*nPageNum+i)..")");
	end
	if nPage ~= 0 then
		tinsert(strtab,"Trang trc/#ring_change_ring("..(nPage-1)..")");
	end
	if nRemaid > 7 then
		tinsert(strtab,"Trang k�/#ring_change_ring("..(nPage+1)..")");
	end
	tinsert(strtab,"Ta kh玭g i/nothing");		
	Say("Ch鋘 lo筰 ngi mu鑞 i. <color=red>Ch� �, t trang s鴆 Ho祅g  ngi mu鑞 i v祇 v� tr� trang s鴆 u ti猲 tr猲 ngi, trang s鴆 Ho祅g kim � v� tr� trang s鴆 th� hai!<color>",
		getn(strtab),
		strtab)
end

function confirm_ring_change_ring(nIndex)
	Say("Ngi ch鋘 d飊g 1 "..tChangeRing[nIndex][4].." v� 1 "..tChangeRing[nIndex][2][1].." i 3 thu閏 t輓h th祅h <color=yellow>"..tChangeRing[nIndex][3][1]..","..tChangeRing[nIndex][3][4]..","..tChangeRing[nIndex][3][7].."<color> "..tChangeRing[nIndex][4]..". X竎 nh kh玭g?",
		2,
		"уng �/#give_the_ring2("..nIndex..")",
		"Ta ch鋘 nh莔 r錳./#ring_change_ring(0)")	
end

function give_the_ring2(nIndex)
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end
	local nIdx1 = GetPlayerEquipIndex(4); --第一个首饰索引，即黄帝首饰索引
	local nIdx2 = GetPlayerEquipIndex(5); --第二个首饰索引，即黄金首饰索引
	if nIdx1 == 0 or nIdx2 == 0 then
		Talk(1,"","t trang s鴆 Ho祅g  ngi mu鑞 i v祇 v� tr� trang s鴆 u ti猲 tr猲 ngi, trang s鴆 Ho祅g kim � v� tr� trang s鴆 th� hai!")
		return
	end
	if GetItemSpecialAttr(nIdx1,"LOCK") == 1 then --锁定判断
		Talk(1,"","V藅 ph萴 ngi t � v� tr� trang s鴆 u ti猲 tr猲 ngi l� v藅 ph萴 kh鉧, m� kh鉧 r錳 i!");
		return
	end
	if GetItemSpecialAttr(nIdx2,"LOCK") == 1 then --锁定判断
		Talk(1,"","V藅 ph萴 ngi t � v� tr� trang s鴆 th� hai tr猲 ngi l� v藅 ph萴 kh鉧, m� kh鉧 r錳 i!");
		return
	end	
	local nId1,nId2,nId3 = GetPlayerEquipInfo(4);
	local nFlag = 0;
	local nParticular = 0;
	if nIndex < 11 then
		for i=1,27,2 do	
			if nId1 == 0 and nId2 == 102 and nId3 == 8800+i then
				nFlag = 1;
				nParticular = 8800+i;
				break
			end
		end
	else
		for i=2,28,2 do	
			if nId1 == 0 and nId2 == 102 and nId3 == 8800+i then
				nFlag = 1;
				nParticular = 8800+i;
				break
			end
		end		
	end	
	if nFlag == 0 then
		Talk(1,"","� v� tr� trang s鴆 u ti猲 tr猲 ngi ngi kh玭g ph秈 "..tChangeRing[nIndex][4]);
		return
	end
	local nId4,nId5,nId6 = GetPlayerEquipInfo(5);
	if nId4 ~= tChangeRing[nIndex][2][2] or nId5 ~= tChangeRing[nIndex][2][3] or nId6 ~= tChangeRing[nIndex][2][4] then
		Talk(1,"","� v� tr� trang s鴆 th� hai tr猲 ngi ngi kh玭g ph秈 "..tChangeRing[nIndex][2][1]);
		return
	end
	local nRoute = GetPlayerRoute();
	local nRand = 0;
	if nIndex < 11 then
		nRand = random(1,getn(tXuanyuanZhan[nRoute]));
	else
		nRand = random(1,getn(tXuanyuanDou[nRoute]));
	end 
	if DelItemByIndex(nIdx1,-1) == 1 and DelItemByIndex(nIdx2,-1) == 1 then
		local Add_flag = 0;
		if nIndex < 11 then
			Add_flag = AddItem(tXuanyuanZhan[nRoute][nRand][2],tXuanyuanZhan[nRoute][nRand][3],tXuanyuanZhan[nRoute][nRand][4],1,1,tChangeRing[nIndex][3][2],tChangeRing[nIndex][3][3],tChangeRing[nIndex][3][5],tChangeRing[nIndex][3][6],tChangeRing[nIndex][3][8],tChangeRing[nIndex][3][9]);
		else
			Add_flag = AddItem(tXuanyuanDou[nRoute][nRand][2],tXuanyuanDou[nRoute][nRand][3],tXuanyuanDou[nRoute][nRand][4],1,1,tChangeRing[nIndex][3][2],tChangeRing[nIndex][3][3],tChangeRing[nIndex][3][5],tChangeRing[nIndex][3][6],tChangeRing[nIndex][3][8],tChangeRing[nIndex][3][9]);
		end
		if Add_flag == 1 then
			Msg2Player("Ch骳 m鮪g ngi i trang s鴆 Ho祅g  th祅h c玭g!");
			WriteLog("е t� th� r蘮 L璾 i trang s鴆 Ho祅g : Ngi ch琲 "..GetName().."D飊g th�"..tChangeRing[nIndex][2][1].." v�"..tChangeRing[nIndex][4].." i 1 trang s鴆 Ho祅g ");
		else
			WriteLog("е t� th� r蘮 L璾 i trang s鴆 Ho祅g : Ngi ch琲 "..GetName().."D飊g th�"..tChangeRing[nIndex][2][1].." v�"..tChangeRing[nIndex][4].."фi trang s鴆 Ho祅g  th蕋 b筰, log: "..Add_flag);
		end
	end
end

function weapon_change_ring()
	Say("N誹 ngi c� v� kh� Ho祅g  d�, n ch� ta i trang s鴆 Ho祅g  l璾 ph竔 tng 鴑g. <color=red>Ch� �, mang v� kh� Ho祅g  mu鑞 i v祇 ngi. <color> Ngi mu鑞 i trang s鴆 n祇?",
		3,
		"Ta mu鑞 l蕐 v� kh� Ho祅g  i Hi猲 Vi猲 chi課/#confirm_wp_change_ring(1)",
		"Ta mu鑞 l蕐 v� kh� Ho祅g  i Hi猲 Vi猲 u/#confirm_wp_change_ring(2)",
		"T筸 th阨 kh玭g i. /nothing")
end

function confirm_wp_change_ring(nType)
	local nIndex = 0; --对应tChangeWp表的索引
	local nIdx = GetPlayerEquipIndex(2); --拿在手上的武器索引
	for i = 1,getn(tChangeWp) do 
		local nId1,nId2,nId3 = GetPlayerEquipInfo(2);
		if nId1 == tChangeWp[i][2] and nId2 == tChangeWp[i][3] and nId3 == tChangeWp[i][4] then 
			nIndex = i;
			break
		end
	end
	if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --锁定判断
		Talk(1,"","V藅 ph萴 n祔 l� v藅 ph萴 kh鉧, m� kh鉧 r錳 i nh�!");
		return
	end
	if nIdx == 0 or nIndex == 0 then  --没有拿武器或者拿的不是黄帝武器
		Talk(1,"","Ngi 產ng mang kh玭g ph秈 v� kh� Ho祅g , h穣 mang v� kh� Ho祅g  v祇 ngi 甶!");
		return
	end
	Say("Ngi x竎 nh d飊g <color=red>"..tChangeWp[nIndex][1].."<color>i <color=yellow>"..tWpChangeRing[nIndex][nType][1].."<color> ch�?",
		2,
		"�, ta mu鑞 i./#give_change_ring("..nIndex..","..nType..")",
		"Kh玭g ph秈, ta mu鑞 x竎 nh l筰 v� kh� Ho祅g  ta mu鑞 i/nothing")
end

function give_change_ring(nIndex,nType)
	if Zgc_pub_goods_add_chk(4,200) ~= 1 then
		return
	end
	local nIdx = GetPlayerEquipIndex(2);
	if DelItemByIndex(nIdx,-1) == 1 then
		local Add_flag = AddItem(tWpChangeRing[nIndex][nType][2],tWpChangeRing[nIndex][nType][3],tWpChangeRing[nIndex][nType][4],1,1,-1,-1,-1,-1,-1,-1);
		if Add_flag == 1 then
			Msg2Player("Ch骳 m鮪g ngi d飊g "..tChangeWp[nIndex][1].."фi"..tWpChangeRing[nIndex][nType][1].." th祅h c玭g!");
			WriteLog("е t� th� r蘮 L璾-V� kh� Ho祅g  i trang s鴆 Ho祅g : Ngi ch琲"..GetName().."D飊g th�"..tChangeWp[nIndex][1].."фi"..tWpChangeRing[nIndex][nType][1].." th祅h c玭g!");
		else
			WriteLog("е t� th� r蘮 L璾-V� kh� Ho祅g  i trang s鴆 Ho祅g : Ngi ch琲"..GetName().."D飊g th�"..tChangeWp[nIndex][1].."фi"..tWpChangeRing[nIndex][nType][1].."th蕋 b筰! log: "..Add_flag);
		end
	end
end	

function box_change_yuehua()
	local strtab = {
		"Ta mu鑞 d飊g Giang S琻 thi誸 b秓 rng l蕐 1 Nguy謙 Hoa (m鏸 b秓 rng t╪g 0.1%)/#input_box_num(1)",
		"Ta mu鑞 d飊g Giang S琻 ng b秓 rng l蕐 1 Nguy謙 Hoa (m鏸 b秓 rng t╪g 0.25%)/#input_box_num(2)",
		"Ta mu鑞 d飊g Th祅h Th� ng﹏ b秓 rng l蕐 1 Nguy謙 Hoa (m鏸 b秓 rng t╪g 5%)/#input_box_num(3)",
		"Ta mu鑞 d飊g Rng v祅g Th辬h th� l蕐 1 Nguy謙 Hoa (m鏸 b秓 rng t╪g 50%)/#input_box_num(4)",
		"Ta kh玭g i/nothing"	
		}
	Say("Ta c� th� c s� b秓 rng n祔, l蕐 Nguy謙 Hoa b猲 trong ra, d鵤 v祇 <color=yellow>s� b秓 rng<color> kh竎 nhau, Nguy謙 Hoa nh薾 頲 <color=yellow>s�<color> kh竎 nhau, ngi ch鋘 甶!",
		getn(strtab),
		strtab)	 
end

function input_box_num(nType)
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then   --空间负重检测
		return
	end		
	local tProb = {10,25,500,5000};
	local tId = {1025,1026,1027,1028};
	local tBox = {"Giang S琻 thi誸 b秓 rng","Giang S琻 ng b秓 rng","Th祅h Th� ng﹏ b秓 rng","Th祅h Th� kim b秓 rng"};
	local nNum = GetItemCount(2,0,tId[nType]);
	if nNum == 0 then
		Talk(1,"","Ngi kh玭g c� <color=yellow>"..tBox[nType].."<color>.")
		return
	end
	if nNum > 10000/tProb[nType] then
		nNum = 10000/tProb[nType];
	end
	SetTaskTemp(TT_BOX_TYPE,nType);
	AskClientForNumber("confirm_change_yuehua", 1, tonumber(nNum), "Xin nh藀 "..tBox[nType].."Ch鋘");
end

function confirm_change_yuehua(nCount)
	local tProb = {0.1,0.25,5,50};
	local nType = GetTaskTemp(TT_BOX_TYPE);
	Say("Ngi c� <color=yellow>"..format("%.2f",nCount*tProb[nType]).."%<color> nh薾 頲 <color=yellow>1 Nguy謙 Hoa<color>, i th蕋 b筰 s� kh玭g c� g� c�, ngi mu鑞 i kh玭g?",
		2,
		"�, ta mu鑞 i./#give_yuehua("..nType..","..nCount..")",
		"T筸 th阨 kh玭g i/nothing")
end

function give_yuehua(nType,nCount)
	local tProb = {10,25,500,5000};
	local tId = {1025,1026,1027,1028};
	local nProb = nCount*tProb[nType];
	local nRand = random(1,10000);
	if DelItem(2,0,tId[nType],nCount) == 1 then
		if nRand <= nProb then
			AddItem(2,1,2002,1);
			Msg2Player("Ch骳 m鮪g ngi nh薾 頲 1 Nguy謙 Hoa!");
		else
			Talk(1,"","V薾 kh� c馻 ngi kh� 甧n, kh玭g i 頲, ti誴 t鬰 ki猲 tr� nh�.");
		end
	end
end

function buchang_dia()
	Say("Tr薾 trc trong b秓 rng V� L﹎ Minh ch� a ra c� gi蕌 lo筰 nguy猲 li謚 qu� hi誱 Nguy謙 Hoa n祔, nh璶g do h� gi秈 quy誸 kh玭g th醓 ng, t筼 nguy猲 li謚 th莕 kh� tr� th祅h ph� ph萴, l穘g ph� t﹎ huy誸 c馻 th� ng, v� th� h� nh� ta b錳 thng c竎 v� cao nh﹏ c馻 h� ch� t筼. T� 23:00 ng祔 18 th竛g 10 n ng祔 25 th竛g 10, ch� c莕 h� ch� t筼 v� kh� c馻 ngi, k� thu藅 ch� t筼 b蕋 k� ho芻 ch� t筼 n鉵, ch� t筼 h� gi竝, ch� t筼 h� y c蕄 70 tr� l猲, s� nh薾 m閠 ph莕 b錳 thng � ch� ta, nh璶g m鏸 ngi ch� c� th� nh薾 1 l莕, b錳 thng bao g錷 2 Nguy謙 Hoa c bi謙 (v藅 ph萴 kh鉧), 40 T� linh kho竛g (v藅 ph萴 kh鉧, th猰 gi� tr� v藅 ph萴 250), n誹 th醓 m穘 甶襲 ki謓 th� n nh薾 nh�.",
		2,
		"Nh薾 b錳 thng./get_buchang",
		"L莕 sau l筰 n/nothing")
end

function get_buchang()
	if GetTask(TASK_BUCHANG_ID) == buchang_id then
		Talk(1,"","Ngi  nh薾 1 l莕 r錳. Sao tham lam v藋 h�?");
		return
	end
	local playerlevel = GetLevel();
	if playerlevel < 10 then
		Talk(1,"","Ngi t鮪g tr秈 giang h� kh玭g nhi襲, n c蕄 <color=red>10<color> r錳 quay l筰 t譵 ta!")
		return
	end	
	if Zgc_pub_goods_add_chk(2,42) ~= 1 then   --空间负重检测
		return
	end	 
	if GetLifeSkillLevel(1,2) >= 70 or GetLifeSkillLevel(1,3) >= 70 or GetLifeSkillLevel(1,4) >= 70 or GetLifeSkillLevel(1,5) >= 70 or GetLifeSkillLevel(1,9) >= 70 or GetLifeSkillLevel(1,10) >= 70 then
		AddItem(2,1,1173,2);
		AddItem(2,1,1174,40);
		Msg2Player("Ch骳 m鮪g ngi nh薾 頲 2 Nguy謙 Hoa c bi謙 v� 40 T� linh th筩h!");
		SetTask(TASK_BUCHANG_ID,buchang_id);
	else
		Talk(1,"","H� ch� t筼 v� kh� c馻 ngi, ho芻 k� thu藅 ch� t筼 n鉵, ch� t筼 h� gi竝, ch� t筼 h� y kh玭g c� c竔 n祇 t c蕄 70 c�!");
		return
	end
end

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测
--村长 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"","<color=red>S鴆 l鵦<color> c馻 b筺 kh玭g !")
			return 0
		else 
			return 1
		end
end

function nothing()

end

function lingqi_item_update()
	local strtab = {
--			"我要提升灵气装备的灵气/update_item_lingqi",
			"Ta mu鑞 ph﹏ m秐h trang b� b竧 qu竧 c馻 ta/dasan_bagua_tixing",
			"Ta mu鑞 nh薾 thi謙 h筰 c馻 vi謈 ph﹏ m秐h trang b� b竧 qu竔./get_bagua_buchang",
			"Ta mu鑞 l蕐 linh th筩h c馻 trang b� b竧 qu竔/quchu_bagua_lingshi",
			"Ch鋘 sai r錳, tr� l筰/main",
			"Ta s� quay l筰 sau!/nothing"
			};
	Say("<color=green>е t� th� r蘮 L璾<color>: S� ta kh� th藅, s� ph� l筰 t譵 ra vi謈 cho ta l祄 n鱝 r錳. Sau n祔, n誹 ai mang 'L謓h th竜 g� mi詎 ph�' n ch� ta  th竜 r阨 trang b� B竧 Qu竔, u c� th� nh薾 ti襫 b錳 thng th竜 g�. <color=yellow>L璾 �, m鏸 l莕 nh薾 ti襫 b錳 thng s� ti猽 hao 1 l謓h th竜 g� mi詎 ph�<color>. T蕋 nhi猲 ngi c騨g c� th� n ch� ta  th竜 Linh th筩h. <color=red>Linh th筩h c� linh kh� 80 tr� l猲 c� th� quay v� v遪g Th竔 H� B竧 Qu竔.<color>",
		getn(strtab),
		strtab);
end

function update_item_lingqi()
	Say("Ch骳 m鋓 ngi n╩ m韎 v筺 s� nh� �,trang b� linh kh� c� 91 linh kh� (bao g錷 91) tr� l猲, 100 linh kh� tr� xu鑞g bao g錷 100 linh kh�, u s� nh薾 mi詎 ph� t╪g linh kh� ng蓇 nhi猲 10, 12, 14, 16, 18, 20 ng蓇 nhi猲 � ch� ta, nh璶g t╪g bao nhi猽 th� ph秈 xem v薾 may c馻 ngi. Зy l� 璾 i T誸, h穣 nhanh ch﹏ n s韒. <color=yellow>S� d鬾g 2 V� Ng蕁 Th駓 s� t╪g 20 linh kh�.<color>",
		3,
		"Ta mu鑞 t╪g linh kh� trang b� (t╪g ng蓇 nhi猲 10, 12, 14, 16, 18, 20)/#choose_item_weizhi(0)",
		"Ta mu鑞 d飊g 2 V� Ng蕁 Th駓  t╪g linh kh� trang b� (t╪g 20)/#choose_item_weizhi(1)",
		"Sau n祔 ta l筰 n t╪g/nothing")
end

function choose_item_weizhi(nAddMax)
	Say("Ngi mu鑞 t╪g linh kh� c馻 trang b� n祇, sau khi t╪g s� t苙g ngi m閠 v礽 linh kh�.",
		5,
		"u/#confirm_update_lingqi(0,"..nAddMax..")",
		"Ngo筰 trang/#confirm_update_lingqi(1,"..nAddMax..")",
		"H� y/#confirm_update_lingqi(3,"..nAddMax..")",
		"V� kh�/#confirm_update_lingqi(2,"..nAddMax..")",
		"ьi ta m芻 trang b� l猲 ./nothing")
end

function confirm_update_lingqi(nWz,nAddMax)
	local nIndex = GetPlayerEquipIndex(nWz); --获取装备索引
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --获取装备id
	local nLingqi = GetItemMaxLingQi(nIndex);   --获取灵气值
	local nXq = GetItemAttr(nIndex,1);--获取第一个魔法属性id 判断是否镶嵌了石头
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --获取装备是否定魂
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定
	local nRandSeed = GetItemRandSeed(nIndex);--随机种子
	
	
	if nIndex == 0 then 
		Talk(1,"","Tr猲 ngi ngi kh玭g c� trang b� mu鑞 t╪g linh kh�.");
		return
	end
	if nLingqi < 91 or nLingqi > 100 or nXq ~= 0 then
		Talk(1,"","Cho d� mu鑞 t╪g c騨g ph秈 mang trang b� ta c� th� t╪g n, tay ngh� ta c� h筺, ch� c� l� ch璦 kh秏, ng th阨 甶觤 linh kh� l� 91-100 m韎 c� th� t╪g linh kh�.");
		return
	end
	
	if nWz == 0 then
		if nId1 == 0 and nId2 == 103 and nId3 >= 73 then
			Talk(1,"","Ch� t筼 ph鑙 h頿 k� n╪g cu閏 s鑞g m韎 th猰 trong ho箃 ng xu﹏, trang b� c蕄 8, c蕄 9 kh玭g th� t╪g.");
			return
		end
	elseif nWz == 1 then
		if nId1 == 0 and nId2 == 100 and nId3 >= 73 then
			Talk(1,"","Ch� t筼 ph鑙 h頿 k� n╪g cu閏 s鑞g m韎 th猰 trong ho箃 ng xu﹏, trang b� c蕄 8, c蕄 9 kh玭g th� t╪g.");
			return
		end
	elseif nWz == 3 then
		if nId1 == 0 and nId2 == 101 and nId3 >= 73 then
			Talk(1,"","Ch� t筼 ph鑙 h頿 k� n╪g cu閏 s鑞g m韎 th猰 trong ho箃 ng xu﹏, trang b� c蕄 8, c蕄 9 kh玭g th� t╪g.");
			return
		end
	elseif nWz == 2 then
		for i=1,getn(tHighLvWp) do
			if nId1 == tHighLvWp[i][2] and nId2 == tHighLvWp[i][3] and nId3 == tHighLvWp[i][4] then
				Talk(1,"","Ch� t筼 ph鑙 h頿 k� n╪g cu閏 s鑞g m韎 th猰 trong ho箃 ng xu﹏, trang b� c蕄 8, c蕄 9 kh玭g th� t╪g.");
				return
			end
		end
	end				
	
	if nLock == 1 then
		Talk(1,"","Trang b� tr猲 ngi ngi  kh鉧, c莕 m� kh鉧 m韎 c� th� th╪g c蕄.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","в b秓 m t礽 s秐 an to祅, trc khi t╪g linh kh� trang b� h穣 m� kh鉧 rng ch璦  trc!");
		return
	end
	if nAddMax == 1 then
		if GetItemCount(2,1,503) < 2 then
			Talk(1,"","Ngi kh玭g c�  V� Ng蕁 Th駓.");
			return
		end
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end	
	local del_flag = DelItemByIndex(nIndex,-1);
	if del_flag == 1 then
		local tLq = {10,12,14,16,18,20};
		local nRand = random(1,getn(tLq));
		local nNewLq = nLingqi+tLq[nRand]; --提升的灵气
		if nAddMax == 1 then
			if DelItem(2,1,503,2) == 1 then
				nNewLq = nLingqi+20;
			end
		end
		local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,1,0,0,0,0,0,0,0,nQianghua,nNewLq,nRandSeed);
		if add_flag == 1 then
			SetEquipCanChouQu(nNewIndex,1);
			if nDing == 1 then
				SetItemSpecialAttr(nNewIndex,"DING7",1); --定魂
			end
			local nRand = random(1,5);
			lspf_AddLingShiInBottle(nRand,1);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nRand.." (c蕄) Linh th筩h,  頲 cho v祇 T� Linh жnh.");
			Talk(1,"","Ch骳 m鮪g ngi t╪g linh kh� trang b� th祅h c玭g!");
			WriteLog("Ho箃 ng Xu﹏-е t� th� r蘮 L璾: Ngi ch琲"..GetName().."T╪g linh kh� trang b� th祅h c玭g, id v藅 ph萴 g鑓, 甶觤 linh kh�, ng c蕄 cng h鉧, v� tr� nh h錸: "..nId1..", "..nId2..", "..nId3..", "..nLingqi..", "..nQianghua..", "..nDing..".");
		else
			WriteLog("Ho箃 ng Xu﹏-е t� th� r蘮 L璾: Ngi ch琲"..GetName().."T╪g linh kh� trang b� th蕋 b筰, id v藅 ph萴 g鑓, 甶觤 linh kh�, ng c蕄 cng h鉧, v� tr� nh h錸: "..nId1..", "..nId2..", "..nId3..", "..nLingqi..", "..nQianghua..", "..nDing..".");
		end
	else
		Talk(1,"","H穣 b秓 m ngi  mang trang b� mu鑞 t╪g tr猲 ngi!");
	end
end

function dasan_bagua_tixing()
	Say("<color=green>е t� th� r蘮 L璾<color>: L璾 � c bi謙 y! Ch� c� b� ra <color=red>10000 gi� tr�<color> m韎 c� th� m b秓 trang b� c馻 ngi kh玭g b� bi課 m蕋 trong l骳 th竜 g�, <color=yellow>c� th� mang L謓h th竜 g� mi詎 ph� n ch� ta  nh薾 l筰 s� ti襫  ti猽 hao, gi� tr� s� kh玭g 頲 ho祅 l筰.<color>",
		2,
		"M� giao di謓 c/dasan_bagua_item",
		"Kh玭g c� g�/nothing")
end

function dasan_bagua_item()
	BaguaDepose(); --重铸八卦套装界面
end

function finish_dasan_bagua(nGold)
	local nTime = tonumber(date("%Y%m%d%H"));
--	if nTime >= 2008091108 and nTime <= 2008101207 then
--		if GetTask(TASK_DASAN_NUM) < DASAN_TOTAL_NUM then
			SetTask(TASK_DASAN_NUM,GetTask(TASK_DASAN_NUM)+1);
			SetTask(TASK_BAGUA_GOLD,GetTask(TASK_BAGUA_GOLD)+nGold);
--		end
--	end
end

function get_bagua_buchang()
	local nBuchang = GetTask(TASK_DASAN_NUM)-GetTask(TASK_BAGUA_BUCHANG);
	local nGold = GetTask(TASK_BAGUA_GOLD)-GetTask(TASK_BUCHANG_GOLD);
--	if GetTask(TASK_BAGUA_BUCHANG) >= DASAN_TOTAL_NUM and nGold == 0 then
--		Talk(1,"","<color=green>刘铁匠弟子<color>：每个人可以领取"..DASAN_TOTAL_NUM.."套八卦装备被打散的补偿，你已经领完了。");
--	else
		if nBuchang == 0 or nGold == 0 then
			Talk(1,"","Hi謓 nay ngi kh玭g c� b錳 thng c� th� l穘h.");
			return
		end		
--		if GetTask(TASK_DASAN_NUM) <= DASAN_TOTAL_NUM then
			Say("<color=green>е t� th� r蘮 L璾<color>: B﹜ gi� ngi c� th� nh薾 ti襫 b錳 thng th竜 g� trang b� B竧 Qu竔<color=yellow>"..nBuchang.."<color> l莕, c莕 c� <color=yellow>L謓h th竜 g� mi詎 ph� "..nBuchang.." c竔<color>, ti襫 b錳 thng c� th� nh薾 頲 "..nGold.." уng, 頲 kh玭g?",
				2,
				"Л頲/confirm_get_buchang",
				"S� n nh薾 sau/nothing");
--		end
--	end		
end

function confirm_get_buchang()
	local nBuchang = GetTask(TASK_DASAN_NUM)-GetTask(TASK_BAGUA_BUCHANG);
	local nGold = GetTask(TASK_BAGUA_GOLD)-GetTask(TASK_BUCHANG_GOLD);
	if nBuchang == 0 or nGold == 0 then
		Talk(1,"","Hi謓 nay ngi kh玭g c� b錳 thng c� th� l穘h.");
		return
	end
	if GetItemCount(2,1,3388) < nBuchang then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: B﹜ gi� ngi c� th� th竜 g� trang b� B竧 Qu竔 <color=yellow>"..nBuchang.."<color> l莕, c莕 c� <color=yellow>L謓h th竜 g� mi詎 ph� "..nBuchang.." c竔<color>, ngi kh玭g c�  r錳.");
		return
	end		
--	if GetTask(TASK_BAGUA_BUCHANG) >= DASAN_TOTAL_NUM then
--		Talk(1,"","<color=green>刘铁匠弟子<color>：每个人可以领取"..DASAN_TOTAL_NUM.."套八卦装备被打散的补偿，你已经领完了。");
--	else
		if DelItem(2,1,3388,nBuchang) == 1 then
			SetTask(TASK_BAGUA_BUCHANG,GetTask(TASK_BAGUA_BUCHANG)+nBuchang);
			SetTask(TASK_BUCHANG_GOLD,GetTask(TASK_BUCHANG_GOLD)+nGold);
			Earn(nGold);
			Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ngi  nh薾 ti襫 b錳 thng r錳.");
			WriteLog("е t� th� r蘮 L璾: Ngi ch琲: "..GetName().."  nh薾 ti襫 b錳 thng th竜 g� B竧 Qu竔, s� ti襫: "..nGold);
		end
--	end
end

function get_bagua_lingshi(nType)
	Say("Ngi mu鑞 l蕐 linh kh� c馻 trang b� n祇 tr猲 ngi?",
		5,
		"u/#ask_quchu_lingshi(0,"..nType..")",
		"Ngo筰 trang/#ask_quchu_lingshi(1,"..nType..")",
		"H� y/#ask_quchu_lingshi(3,"..nType..")",
		"V� kh�/#ask_quchu_lingshi(2,"..nType..")",
		"ьi ta m芻 trang b� l猲 ./nothing")	
end

function ask_quchu_lingshi(nWz,nType)
	local tChouqu = {"u","Ngo筰 trang","V� kh�","H� y"}
	Say("Ngi mu鑞 l蕐  tr猲 <color=yellow>"..tChouqu[nWz+1].."<color> �?",
		3,
		"Л頲/#confirm_quchu_lingshi("..nWz..","..nType..")",
		"Ta ch鋘 nh莔 r錳./#get_bagua_lingshi("..nType..")",
		"ьi ta m芻 trang b� l猲 ./nothing")
end

function confirm_quchu_lingshi(nWz,nType)
	local nRoute = GetPlayerFaction();
	local tItem = {	
	[1] = {2,0,448,"Ph� Hi襫 X� L頸"},	--少林
	[2] = {2,0,469,"Thi猲 C� M閏"},--武当
	[3] = {2,0,457,"Kim Li猲 Hoa"},--峨嵋
	[4] = {2,0,466,"T� Kim B竧"},--丐帮
	[5] = {2,0,454,"B� чc phng"},--唐门	
	[6] = {2,0,477,"Tinh B� Ti詎 Чi"},	--杨门
	[7] = {2,0,484,"R誸 c"},--五毒
	[8] = {2,0,491,"Mai Qu� L�"},--翠烟
	[9] = {2,0,495,"Khu Ma Hng"},--昆仑
	[10] = {2,0,499,"Th竛h H醓 L謓h"}--明教
	};
	if nType == 1 then  
		if GetItemCount(2,1,533) < 1 then
			Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Mu鑞 th竜 Linh th筩h linh kh� 80 tr� xu鑞g ra kh醝 trang b� B竧 Qu竔, c莕 1 Tinh luy謓 B╪g Th筩h, ngi kh玭g c� v藅 n祔.")
			return
		end
	elseif nType == 2 then	
		if GetItemCount(2,1,504) < 1 then
			Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Mu鑞 th竜 Linh th筩h linh kh� 80 tr� l猲 ra kh醝 trang b� B竧 Qu竔, c莕 1 N� Oa Tinh Th筩h, ngi kh玭g c� v藅 n祔.");
			return
		end
	elseif nType == 3 then
		if nRoute == 0 then
			Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ngi ch璦 gia nh藀 m玭 ph竔 kh玭g th� s� d鬾g ch鴆 n╪g th竜 Linh th筩h.");
			return
		else
			if GetItemCount(tItem[nRoute][1],tItem[nRoute][2],tItem[nRoute][3]) < 100 then
				Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Mu鑞 th竜 Linh th筩h linh kh� 80 tr� l猲 ra kh醝 trang b� B竧 Qu竔 c莕 100 "..tItem[nRoute][4]..", ngi kh玭g c� v藅 n祔.")
				return
			end
		end
	elseif nType == 4 then	
		if GetItemCount(2,1,3388) < 1 then
			Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Mu鑞 th竜 Linh th筩h linh kh� 80 tr� l猲 ra kh醝 trang b� B竧 Qu竔, c莕 1 L謓h th竜 g� mi詎 ph�, ngi kh玭g c� v藅 n祔.");
			return
		end			
	end
	local nIndex = GetPlayerEquipIndex(nWz); --获取装备索引
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --获取装备id
	local nZhuangbeiLv = GetEquipLevel(nIndex); --获取当前装备等级
	local nBaseLv = GetEquipBaseLevel(nIndex); --获取装备基础等级
	local nLingqi = GetItemMaxLingQi(nIndex);   --获取灵气值
	local nMofa1,nLv1 = GetItemAttr(nIndex,1);--获取第一个魔法属性id 等级
	local nMofa2,nLv2 = GetItemAttr(nIndex,2);--获取第二个魔法属性id 等级
	local nMofa3,nLv3 = GetItemAttr(nIndex,3);--获取第三个魔法属性id 等级
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nGuawei = GetEquipBaGua(nIndex); --获取卦位
	local nJihuo = GetEquipBaGuaJiHuo(nIndex);--是否已经激活
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --获取装备是否定魂
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定	
	local nRandSeed = GetItemRandSeed(nIndex);--随机种子
	local nMofaRand1 = mod(floor(GetItemParam(nIndex,0)/2^16),2^11); --属性一的随机种子
	local nMofaRand2 = mod(floor(GetItemParam(nIndex,1)/2^16),2^11); --属性二的随机种子
	local nMofaRand3 = mod(floor(GetItemParam(nIndex,2)/2^16),2^11); --属性三的随机种子
	local nMofaJiou1 = mod(floor(GetItemParam(nIndex,0)/2^14),2^2); --属性一的阴阳，2为阳（奇数），1为阴（偶数）
	local nMofaJiou2 = mod(floor(GetItemParam(nIndex,1)/2^14),2^2); --属性二的阴阳，2为阳，1为阴
	local nMofaJiou3 = mod(floor(GetItemParam(nIndex,2)/2^14),2^2); --属性三的阴阳，2为阳，1为阴
	
	if nIndex == 0 then 
		Talk(1,"","Ngi kh玭g c� mang trang b� mu鑞 l蕐 linh kh� ra tr猲 ngi.");
		return
	end
	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","Ngi 產ng mang trang b� b竧 qu竔 �, sau khi ph﹏ m秐h n nh薾 linh th筩h.");
		return
	end
		 
	if nLingqi == 0 or nMofa1 == 0 then
		Talk(1,"","Trang b� n祔 c馻 ngi kh玭g c� kh秏  l祄 sao l蕐 頲!");
		return
	end
	if nLock == 1 then
		Talk(1,"","Trang b� tr猲 ngi ngi  kh鉧, c莕 m� kh鉧 m韎 c� th� th╪g c蕄.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","в b祇 m t礽 s秐 an to祅, trc khi l蕐 linh th筩h ngi h穣 m� kh鉧 rng ch鴄  trc!");
		return
	end	
	if Zgc_pub_goods_add_chk(6,200) ~= 1 then
		return
	end
	if nType == 1 then
		if nLingqi >= 80 then
			Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ngi ch鋘 trang b� c� linh kh� tr猲 80, xin h穣 d飊g o c� th竜 Linh th筩h tng 鴑g.")
			return
		end
		if DelItem(2,1,533,1) ~= 1 then
			return
		end
	elseif nType == 2 then
		if nLingqi < 80 then
			Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ngi ch鋘 trang b� c� linh kh� di 80, xin h穣 d飊g o c� th竜 Linh th筩h tng 鴑g.")
			return
		end		
		if DelItem(2,1,504,1) ~= 1 then
			return
		end
	elseif nType == 3 then
		if nLingqi < 80 then
			Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ngi ch鋘 trang b� c� linh kh� di 80, xin h穣 d飊g o c� th竜 Linh th筩h tng 鴑g.")
			return
		end 
		if DelItem(tItem[nRoute][1],tItem[nRoute][2],tItem[nRoute][3],100) ~= 1 then
			return
		end
	elseif nType == 4 then
		if nLingqi < 80 then
			Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ngi ch鋘 trang b� c� linh kh� di 80, xin h穣 d飊g o c� th竜 Linh th筩h tng 鴑g.")
			return
		end 
		if DelItem(2,1,3388,1) ~= 1 then
			return
		end		
	end
	local del_flag = DelItemByIndex(nIndex,-1);
	if del_flag == 1 then
		local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,1,0,0,0,0,0,0,0,nQianghua,nLingqi,nRandSeed);
		if add_flag == 1 then
			SetEquipCanChouQu(nNewIndex,1);
			SetItemIncreaseLevel(nNewIndex,nZhuangbeiLv-nBaseLv);
			if nDing == 1 then
				SetItemSpecialAttr(nNewIndex,"DING7",1); --定魂
			end
			local nLingshiLingqi1 = get_lingqi_jiou(nMofa1,nWz,nLv1,nMofaJiou1) --返回对应奇偶灵气
			AddLingShi(nMofa1,nWz,nLv1,nLingshiLingqi1,nMofaRand1);
			if nMofa2 ~= 0 then
				local nLingshiLingqi2 = get_lingqi_jiou(nMofa2,nWz,nLv2,nMofaJiou2) --返回对应奇偶灵气
				AddLingShi(nMofa2,nWz,nLv2,nLingshiLingqi2,nMofaRand2);	
			end
			if nMofa3 ~= 0 then
				local nLingshiLingqi3 = get_lingqi_jiou(nMofa3,nWz,nLv3,nMofaJiou3) --返回对应奇偶灵气
				AddLingShi(nMofa3,nWz,nLv3,nLingshiLingqi3,nMofaRand3);								
			end
			if nGuawei == 10 then   --天卦
				AddItem(2,0,1084,1);
			else	
				if nJihuo ~= 0 and nLingqi >= 80 then   --已经激活
					if nGuawei ~= 0 and nGuawei ~= 5 then
						AddItem(tBaguaNum[nGuawei][2],tBaguaNum[nGuawei][3],tBaguaNum[nGuawei][4],tBaguaNum[nGuawei][5]);
					end
				end
			end				  
			Talk(1,"","Ch骳 m鮪g ngi  l蕐 linh th筩h th祅h c玭g.");
			WriteLog("е t� th� r蘮 L璾 l蕐 linh th筩h: Ngi ch琲"..GetName().."L骳 th竜 Linh th筩h th祅h c玭g, id v藅 ph萴, Linh kh�, Cng ho�, мnh h錸, H箃 gi鑞g ng蓇 nhi猲, thu閏 t輓h Linh th筩h 1, ng c蕄, thu閏 t輓h 2, ng c蕄, thu閏 t輓h 3, ng c蕄, lo筰 Linh th筩h th竜 ra, thu閏 qu�: "..nId1..","..nId2..","..nId3..","..nLingqi..","..nQianghua..","..nDing..","..nRandSeed..","..nMofa1..","..nLv1..","..nMofa2..","..nLv2..","..nMofa3..","..nLv3..","..nType..","..nGuawei);
		else
			WriteLog("е t� th� r蘮 L璾 l蕐 linh th筩h: Ngi ch琲"..GetName().."L骳 th竜 Linh th筩h th蕋 b筰, v� tr� th蕋 b筰, id v藅 ph萴, Linh kh�, Cng ho�, мnh h錸, H箃 gi鑞g ng蓇 nhi猲, thu閏 t輓h Linh th筩h 1, ng c蕄, thu閏 t輓h 2, ng c蕄, thu閏 t輓h 3, ng c蕄, lo筰 Linh th筩h th竜 ra, thu閏 qu�: "..add_flag..","..nId1..","..nId2..","..nId3..","..nLingqi..","..nQianghua..","..nDing..","..nRandSeed..","..nMofa1..","..nLv1..","..nMofa2..","..nLv2..","..nMofa3..","..nLv3..","..nType..","..nGuawei);
		end		
	end			
end

function lingqi_item_change()
	local strtab = {
			"Ta mu鑞 chuy觧 h鉧 trang b� linh kh� c� linh kh� t� 60-79 th祅h 5 X輈h Thi誸 Tinh (gi� tr� 500)/#choose_change_wz(1)",
			"Ta mu鑞 chuy觧 linh kh� t� 80 n 120 c馻 trang b� Linh kh� th祅h 5 X輈h Thi誸 Tinh (500 gi� tr�), 1 nguy謙 hoa (x竎 su蕋 50%)/#choose_change_wz(2)",
			"Ta mu鑞 chuy觧 h鉧 trang b� b竧 qu竔 c� linh kh� t� 60-79 th祅h 5 X輈h Thi誸 Tinh (gi� tr� 500) v� 2 linh th筩h ng蓇 nhi猲 c蕄 1-5/#choose_change_wz(3)",
--			"我要把80到120灵气的八卦装备转化为赤铁精(500价值量)5个、2个1－5级随机灵石，50%概率1个月华/#choose_change_wz(4)",
			"Ch鋘 sai r錳, tr� l筰/main",
			"Ta s� quay l筰 sau!/nothing"
			};
	Say("C� m閠 s� trang b� linh kh� kh玭g d飊g, ta gi髉 ngi chuy觧 h鉧 ch髇g th祅h nguy猲 li謚, ngi c� mu鑞 th� kh玭g. <color=yellow>Ch� �, linh th筩h  kh秏 nh璶g ch璦 h譶h th祅h trang b� b竧 qu竔 th� d鵤 v祇 trang b� linh kh�  gi秈 quy誸. <color><color=red>Mang trang b� mu鑞 chuy觧 h鉧 l猲 ngi.<color>",
		getn(strtab),
		strtab);
end

function choose_change_wz(nType)
	Say("Ngi mu鑞 chuy觧 h鉧 <color=yellow>trang b� n祇<color> tr猲 ngi <color=red>Ch� �, sau khi ch鋘 trang b� s� chuy觧 h鉧 th祅h nguy猲 li謚.<color>",
		6,
		"u/#confirm_change_cailiao("..nType..",0)",
		"Ngo筰 trang/#confirm_change_cailiao("..nType..",1)",
		"H� y/#confirm_change_cailiao("..nType..",3)",
		"V� kh�/#confirm_change_cailiao("..nType..",2)",
		"Ch鋘 sai. Tr� v�/lingqi_item_change",
		"ьi ta m芻 trang b� l猲 ./nothing")		
end

function confirm_change_cailiao(nType,nWz)
	local nIndex = GetPlayerEquipIndex(nWz); --获取装备索引
	local nLingqi = GetItemMaxLingQi(nIndex);   --获取灵气值
	local nGuawei = GetEquipBaGua(nIndex); --获取卦位
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --获取装备id
	
	if nIndex == 0 then 
		Talk(1,"","Ngi kh玭g c� mang trang b� mu鑞 chuy觧 h鉧 l猲 ngi.");
		return
	end
	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","Ngi 產ng mang trang b� b竧 qu竔 �, h穣 ph﹏ m秐h r錳 n chuy觧 h鉧.");
		return
	end
	if nLingqi < 60 or nLingqi > 120 then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Trang b� chuy觧 th祅h nguy猲 li謚 甶觤 Linh kh� ph秈 � trong kho秐g 60 n 120.");
		return
	end
	if nLock > 0 then
		Talk(1,"","Trang b� c馻 ngi hi謓 產ng � tr筺g th竔 kh鉧, h穣 m� kh鉧 r錳 n chuy觧 h鉧.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","в b秓 m t礽 s秐 an to祅, trc khi chuy觧 h鉧 trang b� linh kh� ngi h穣 m� kh鉧 rng ch鴄  trc!");
		return
	end
	if nQianghua >= 5 then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Xin l鏸,  cng ho� c馻 trang b� l韓 h琻 5, kh玭g th� chuy觧 ho�.");
		return
	end
	--如果是天地玄黄装备
	if is_xuanhuang_wuqi(nId1,nId2,nId3) == 1 or is_xuanhuang_zhuangbei(nId1,nId2,nId3) == 1 then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Trang b� Thi猲 мa Huy襫 Ho祅g kh玭g th� chuy觧 ho�.");
		return
	end
	if Zgc_pub_goods_add_chk(2,10) ~= 1 then
		return
	end			
	if nType == 1 then
		if nGuawei ~= 0 then
			Talk(1,"","Зy l� trang b� b竧 qu竔 �, ngi ch鋘 sai r錳.");
		else
			if nLingqi < 60 or nLingqi >= 80  then
				Talk(1,"","觤 linh kh� kh玭g ng, ngi ch鋘 sai r錳.")
			else
				local del_flag = DelItemByIndex(nIndex,-1);
				if del_flag == 1 then
					AddItem(2,1,2652,5);
					WriteLog("е t� th� r蘮 L璾-Trang b� chuy觧 h鉧 nguy猲 li謚: Ngi ch琲"..GetName().."chuy觧 h鉧 th祅h c玭g 甶觤 linh kh� th祅h "..nLingqi.."trang b� linh kh�. Id "..nId1..","..nId2..","..nId3..". ч cng ho� "..nQianghua..".");
					Talk(1,"","Ch骳 m鮪g ngi, chuy觧 h鉧 trang b� linh kh� th祅h nguy猲 li謚 th祅h c玭g.");
				end
			end
		end
	elseif nType == 2 then
		if nGuawei ~= 0 then
			Talk(1,"","Зy l� trang b� b竧 qu竔 �, ngi ch鋘 sai r錳.");
		else
			if nLingqi < 80 or nLingqi > 120  then
				Talk(1,"","觤 linh kh� kh玭g ng, ngi ch鋘 sai r錳.")
			else
				local del_flag = DelItemByIndex(nIndex,-1);
				if del_flag == 1 then
					AddItem(2,1,2652,5);
					local nRanda = random(1,100);
					if nRanda <= 50 then
						AddItem(2,1,2002,1);
					end
					WriteLog("е t� th� r蘮 L璾-Trang b� chuy觧 h鉧 nguy猲 li謚: Ngi ch琲"..GetName().."chuy觧 h鉧 th祅h c玭g 甶觤 linh kh� th祅h "..nLingqi.."trang b� linh kh�. Id "..nId1..","..nId2..","..nId3..". ч cng ho� "..nQianghua..".");

					Talk(1,"","Ch骳 m鮪g ngi, chuy觧 h鉧 trang b� linh kh� th祅h nguy猲 li謚 th祅h c玭g.");
				end
			end
		end	
	elseif nType == 3 then
		if nGuawei == 0 then
			Talk(1,"","Зy kh玭g ph秈 l� trang b� b竧 qu竔, ngi ch鋘 sai r錳.");
		else
			if nLingqi < 60 or nLingqi >= 80  then
				Talk(1,"","觤 linh kh� kh玭g ng, ngi ch鋘 sai r錳.")
			else
				local del_flag = DelItemByIndex(nIndex,-1);
				if del_flag == 1 then
					AddItem(2,1,2652,5);
					for i = 1,2 do
						local nRand = random(1,5);
						lspf_AddLingShiInBottle(nRand,1);
						Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nRand.." (c蕄) Linh th筩h,  頲 cho v祇 T� Linh жnh.");
					end						
					WriteLog("е t� th� r蘮 L璾-Trang b� chuy觧 h鉧 nguy猲 li謚: Ngi ch琲"..GetName().."chuy觧 h鉧 th祅h c玭g 甶觤 linh kh� th祅h "..nLingqi.."trang b� B竧 Qu竔. Id "..nId1..","..nId2..","..nId3..". ч cng ho� "..nQianghua..".");

					Talk(1,"","Ch骳 m鮪g ngi, chuy觧 h鉧 trang b� linh kh� th祅h nguy猲 li謚 th祅h c玭g.");
				end
			end
		end	
	elseif nType == 4 then
		if nGuawei == 0 then
			Talk(1,"","Зy kh玭g ph秈 l� trang b� b竧 qu竔, ngi ch鋘 sai r錳.");
		else
			if nLingqi < 80 or nLingqi > 120  then
				Talk(1,"","觤 linh kh� kh玭g ng, ngi ch鋘 sai r錳.")
			else
				local del_flag = DelItemByIndex(nIndex,-1);
				if del_flag == 1 then
					AddItem(2,1,2652,5);
					local nRandb = random(1,100);
					if nRandb <= 50 then
						AddItem(2,1,2002,1);
					end
					for i = 1,2 do
						local nRand = random(1,5);
						lspf_AddLingShiInBottle(nRand,1);
						Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nRand.." (c蕄) Linh th筩h,  頲 cho v祇 T� Linh жnh.");
					end						
					WriteLog("е t� th� r蘮 L璾-Trang b� chuy觧 h鉧 nguy猲 li謚: Ngi ch琲"..GetName().."chuy觧 h鉧 th祅h c玭g 甶觤 linh kh� th祅h "..nLingqi.."trang b� B竧 Qu竔. Id "..nId1..","..nId2..","..nId3..". ч cng ho� "..nQianghua..".");
					Talk(1,"","Ch骳 m鮪g ngi, chuy觧 h鉧 trang b� linh kh� th祅h nguy猲 li謚 th祅h c玭g.");
				end
			end
		end	
	end			
end

--返回对应灵石的奇偶灵气 nNum值为：2为奇数，1为偶数
function get_lingqi_jiou(nId,nWz,nLv,nNum)
	local nMin,nMax = GetLingShiAttrRange(nId,nWz,nLv);
	local tJishu = {};
	local tOushu = {};
	local nLingqi = 0;
	
	for i=nMin,nMax do
		if mod(i,2) == 0 then
			tinsert(tOushu,i);
		else
			tinsert(tJishu,i);
		end
	end
	
	if nNum == 1 then
		local nRand = random(1,getn(tOushu));
		nLingqi = tOushu[nRand];
	elseif nNum == 2 then
		local nRand = random(1,getn(tJishu));
		nLingqi = tJishu[nRand];
	end
	return nLingqi;
end

function about_tiandiWp()
	Say("<color=green>е t� th� r蘮 L璾<color>: N誹 ngi kh玭g th輈h l鵦 c玭g k輈h c馻 v� kh� Thi猲 мa Huy襫 Ho祅g hi謓 t筰, th� c� th� n ch� ta, d飊g <color=yellow>3 B祅 Long b輈h<color>  c l筰, <color=yellow>l璾 �, l鵦 c玭g k輈h ng蓇 nhi猲. <color>S� l璾 l筰  cng ho� v� hi謚 qu� nh h錸 c馻 v� kh� Thi猲 мa Huy襫 Ho祅g. <color=yellow>V� kh�  kh秏 n筸 Linh th筩h kh玭g th� c l筰.<color>",
		2,
		"c v� kh� Thi猲 мa Huy襫 Ho祅g/give_new_tiandi",
		"Ta kh玭g c/nothing")
end

function give_new_tiandi()
	local nIndex = 0; --对应tTiandiWp表的索引
	local nIdx = GetPlayerEquipIndex(2); --拿在手上的武器索引
	local nLingqi = GetItemMaxLingQi(nIdx);   --获取灵气值
	local nQianghua = GetEquipAttr(nIdx,2);--获取物品强化等级
	local nDing = GetItemSpecialAttr(nIdx,"DING7"); --获取装备是否定魂	
	local nMofa,nLv = GetItemAttr(nIdx,1);--获取第一个魔法属性id 等级
	
	if GetItemCount(2,1,1000) < 3 then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ngi kh玭g c�  B祅 Long b輈h.");
		return
	end
	if nMofa ~= 0 then
		Talk(1,"","Trang b� n祔  kh秏 linh th筩h, kh玭g th� c l筰.");
		return
	end
	if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --锁定判断
		Talk(1,"","V藅 ph萴 n祔 l� v藅 ph萴 kh鉧, m� kh鉧 r錳 i nh�!");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","в b秓 m t礽 s秐 an to祅, trc khi c l筰 h穣 m� kh鉧 rng ch鴄  trc!");
		return
	end			
	if Zgc_pub_goods_add_chk(1,230) ~= 1 then
		return
	end
	for i = 1,getn(tTiandiWp) do 
		local nId1,nId2,nId3 = GetPlayerEquipInfo(2);
		if nId1 == tTiandiWp[i][2] and nId2 == tTiandiWp[i][3] and nId3 == tTiandiWp[i][4] then
			nIndex = i;
			break
		end
	end
	if nIdx == 0 or nIndex == 0 then  --没有拿武器或者拿的不是天地玄黄武器
		Talk(1,"","Ngi 產ng mang kh玭g ph秈 v� kh� Thi猲 мa Huy襫 Ho祅g, h穣 mang trang b� v� kh� Thi猲 мa Huy襫 Ho祅g mu鑞 c l筰 v祇 ngi!");
		return
	else
		if DelItem(2,1,1000,3) == 1 and DelItemByIndex(nIdx,-1) == 1 then
			local add_flag,add_idx = AddItem(tTiandiWp[nIndex][2],tTiandiWp[nIndex][3],tTiandiWp[nIndex][4],1,1,0,0,0,0,0,0,0,nQianghua,nLingqi);
			if add_flag == 1 then
				SetEquipCanChouQu(add_idx,1);
				if nDing == 1 then
					SetItemSpecialAttr(add_idx,"DING7",1); --定魂
				end 
				Msg2Player("Ngi  c l筰 1 v� kh� Thi猲 мa Huy襫 Ho祅g: "..tTiandiWp[nIndex][1]);
				WriteLog("е t� th� r蘮 L璾-V� kh� Thi猲 мa Huy襫 Ho祅g: Ngi ch琲"..GetName().."c l筰"..tTiandiWp[nIndex][1].."Th祅h c玭g.")
			else
				WriteLog("е t� th� r蘮 L璾-V� kh� Thi猲 мa Huy襫 Ho祅g: Ngi ch琲"..GetName().."c l筰"..tTiandiWp[nIndex][1].." th蕋 b筰.");
			end
		end
	end		
end

function about_tdxh()
		local strtab = {
			"Ta mu鑞 甶襲 ch豱h v� kh� Thi猲 мa Huy襫 Ho祅g/about_tiandiWp",
			"Ta mu鑞 thay i linh kh� c馻 trang b� Thi猲 мa Huy襫 Ho祅g/add_tiandi_lingqi",
			"Thanh уng жnh i trang b� Thi猲 мa Huy襫 Ho祅g/chang_yijiding",
			"Vi猰 Ho祅g thi誸 h錸 i trang b� Thi猲 мa Huy襫 Ho祅g/chang_yanhuangtiehun",
			"Ta ch� n xem th�/nothing"};
		Say("<color=green>е t� th� r蘮 L璾<color>: S� ph� 產ng s璾 t藀 Thanh уng жnh c蕄 1, n猲 mang h誸 trang b� Thi猲 мa Huy襫 Ho祅g ra  i. N誹 ngi c� Vi猰 Ho祅g thi誸 h錸, c騨g c� th� mang n ch� ta  i trang b� Thi猲 мa Huy襫 Ho祅g.",
			getn(strtab),
			strtab)		
end

function add_item_lingqi()
	local strtab = {
		"Ta mu鑞 d飊g V� Ng蕁 Th駓  甶襲 ch豱h linh kh� trang b�/add_lingqi_wz",
		"Ta ch� n xem th�/nothing"};
	Say("<color=green>е t� th� r蘮 L璾<color>: Ta c� th� d飊g <color=yellow>1 V� Ng蕁 Thu�<color>  <color=yellow>h� 1 甶觤 linh kh�<color> c馻 trang b�. <color=yellow>L璾 �, ch� c� trang b� ch璦 kh秏 n筸 Linh kh� m韎 c� th� h� Linh kh�. <color><color=red>N誹 l� trang b� Thi猲 мa Huy襫 Ho祅g 119 Linh kh�, c� th� d飊g c竎h kh竎  chuy觧 th祅h 120 Linh kh�. Nh璶g trang b� Thi猲 мa Huy襫 Ho祅g 118 Linh kh� kh玭g th� k輈h ho箃 b� B竧 Qu竔 Thi猲 мa Huy襫 Ho祅g.<color>",
		getn(strtab),
		strtab)
end

function add_lingqi_wz()
	local strtab = {
		"u/#add_lingqi_ask(0)",
		"Ngo筰 trang/#add_lingqi_ask(1)",
		"H� y/#add_lingqi_ask(3)",
		"V� kh�/#add_lingqi_ask(2)",
		"ьi ta m芻 trang b� l猲 ./nothing"};
	Say("Ngi mu鑞 甶襲 ch豱h linh kh� c馻 trang b� n祇 tr猲 ngi? Ch� �, ch� c� trang b� linh kh� ch璦 kh秏 m韎 c� th� 甶襲 ch豱h.",
		getn(strtab),
		strtab)
end

function add_lingqi_ask(nWz)
	local tWz = {"u","Ngo筰 trang","V� kh�","H� y"};
	Say("Ngi c� mu鑞 甶襲 ch豱h linh kh� c馻 trang b� <color=yellow>"..tWz[nWz+1].."<color> kh玭g?",
		3,
		"Ta mu鑞 甶襲 ch豱h/#add_lingqi_confirm("..nWz..")",
		"Kh玭g, ta nh莔!/add_lingqi_wz",
		"ьi ta m芻 trang b� l猲 ./nothing");
end

function add_lingqi_confirm(nWz)
	if GetItemCount(2,1,503) < 1 then
		Talk(1,"","襲 ch豱h linh kh� c莕 1 V� Ng蕁 Th駓, tr猲 ngi ngi kh玭g c�.");
		return
	end	
	local nIndex = GetPlayerEquipIndex(nWz); --获取装备索引
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --获取装备id
	local nZhuangbeiLv = GetEquipLevel(nIndex); --获取当前装备等级
	local nBaseLv = GetEquipBaseLevel(nIndex); --获取装备基础等级
	local nLingqi = GetItemMaxLingQi(nIndex);   --获取灵气值
	local nMofa1,nLv1 = GetItemAttr(nIndex,1);--获取第一个魔法属性id 等级
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --获取装备是否定魂
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定	
	local nRandSeed = GetItemRandSeed(nIndex);--随机种子
	
	if nIndex == 0 then 
		Talk(1,"","Ngi kh玭g mang trang b� mu鑞 甶襲 ch豱h linh kh� tr猲 ngi.");
		return
	end
	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","Ngi 產ng mang trang b� b竧 qu竔 �, sau khi ph﹏ m秐h r錳 n 甶誹 ch豱h linh kh�.");
		return
	end
		 
	if nLingqi == 0 or nMofa1 ~= 0 then
		Talk(1,"","Ch� c� trang b� linh kh� ch璦 kh秏 m韎 甶襲 ch豱h 頲!");
		return
	end
	if nLock == 1 then
		Talk(1,"","Trang b� c馻 ngi hi謓 產ng � tr筺g th竔 kh鉧, h穣 m� kh鉧 r錳 n 甶襲 ch豱h.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","в b秓 m t礽 s秐 an to祅, trc khi 甶襲 ch豱h linh kh� trang b� ngi h穣 m� kh鉧 rng ch鴄  trc!");
		return
	end	
	if Zgc_pub_goods_add_chk(1,200) ~= 1 then
		return
	end
	if DelItem(2,1,503,1) == 1 then
		local del_flag = DelItemByIndex(nIndex,-1);
		if del_flag == 1 then
			local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,1,0,0,0,0,0,0,0,nQianghua,nLingqi-1,nRandSeed);
			if add_flag == 1 then
				SetEquipCanChouQu(nNewIndex,1);
				SetItemIncreaseLevel(nNewIndex,nZhuangbeiLv-nBaseLv);
				if nDing == 1 then
					SetItemSpecialAttr(nNewIndex,"DING7",1); --定魂
				end			  
				Talk(1,"","Ch骳 m鮪g ngi  甶襲 ch豱h linh kh� trang b� th祅h c玭g.");
				WriteLog("е t� th� r蘮 L璾-襲 ch豱h linh kh�: Ngi ch琲 "..GetName().."甶襲 ch豱h linh kh� trang b� th祅h c玭g, id v藅 ph萴, linh kh�, cng h鉧, nh h錸, h箃 gi鑞g ng蓇 nhi猲: "..nId1..","..nId2..","..nId3..","..(nLingqi-1)..","..nQianghua..","..nDing..","..nRandSeed);
			else
				WriteLog("е t� th� r蘮 L璾-襲 ch豱h linh kh�: Ngi ch琲 "..GetName().."甶襲 ch豱h linh kh� trang b� th蕋 b筰, v� tr� th蕋 b筰, id v藅 ph萴, linh kh�, cng h鉧, nh h錸, h箃 gi鑞g ng蓇 nhi猲: "..add_flag..","..nId1..","..nId2..","..nId3..","..nLingqi..","..nQianghua..","..nDing..","..nRandSeed);
			end
		end
	end	
end

function quchu_bagua_lingshi()
	local strtab = {
		"D飊g 1 Tinh Luy謓 B╪g Th筩h  g� Linh th筩h trang b� B竧 Qu竔 t� 0-79 Linh kh�/#get_bagua_lingshi(1)",
		"D飊g 1 N� Oa Tinh Th筩h  g� Linh th筩h trang b� B竧 Qu竔 t� 80-120/#get_bagua_lingshi(2)",
		"D飊g 100 b� t輓 v藅 trang b� s� m玭 4  g� Linh th筩h trang b� B竧 Qu竔 t� 80-120/#get_bagua_lingshi(3)",
		"D飊g 1 L謓h th竜 g� mi詎 ph�  g� Linh th筩h trang b� B竧 Qu竔 t� 80-120/#get_bagua_lingshi(4)",
		"в ta suy ngh� l筰/nothing"};
	Say("<color=green>е t� th� r蘮 L璾<color>: Ngi c� th� n ch� ta, d鵤 v祇 Linh kh� trang b� B竧 Qu竔 c馻 ngi, d飊g <color=yellow>1 Tinh Luy謓 B╪g Th筩h ho芻 1 N� Oa Tinh Th筩h<color>, ho芻 <color=yellow>100<color> b� t輓 v藅 trang b� s� m玭 4  g� Linh th筩h. ч cng ho�, nh h錸 v� ng c蕄 c馻 trang b� s� 頲 gi� l筰, k輈h ho箃 trang b� Linh kh� t� 0-79, s� kh玭g quay v� v遪g Th竔 H�, trang b� Linh kh� t� 80-120, s� quay v� v遪g Th竔 H�. <color=red>L骳 g� b� trang b� Thi猲 Qu竔, s� quay v� Thi猲 Qu竔 th筩h, Linh th筩h v� trang b� kh玭g c� v� tr� qu� s� 頲 gi� l筰  cng ho�, nh h錸 v� ng c蕄, nh璶g kh玭g th� quay l筰 B竧 Qu竔 B礽.<color>",
		getn(strtab),
		strtab)
end

function add_tiandi_lingqi()
	local strtab = {
		"Ta mu鑞 c trang b� Thi猲 мa Huy襫 Ho祅g th祅h 120 linh kh�/add_tiandi_wz",
		"Ta ch� n xem th�/nothing"
	}
	Say("Ta c� th� gi髉 ngi c trang b� Thi猲 мa Huy襫 Ho祅g th祅h 120 linh kh�, ngi ch� c莕 t鑞 <color=yellow>1 N� Oa tinh th筩h<color> � ch� ta th玦.",
		getn(strtab),
		strtab)
end

function add_tiandi_wz()
	local strtab = {
		"u/#add_tiandi_ask(0)",
		"Ngo筰 trang/#add_tiandi_ask(1)",
		"H� y/#add_tiandi_ask(3)",
		"V� kh�/#add_tiandi_ask(2)",
		"ьi ta m芻 trang b� l猲 ./nothing"};
	Say("Ngi mu鑞 c linh kh� c馻 trang b� Thi猲 мa Huy襫 Ho祅g n祇 tr猲 ngi? Ch� �, ch� c� trang b� Thi猲 мa Huy襫 Ho祅g ch璦 kh秏 m韎 c 頲.",
		getn(strtab),
		strtab)	
end

function add_tiandi_ask(nWz)
	local tWz = {"u","Ngo筰 trang","V� kh�","H� y"};
	Say("Ngi mu鑞 c Thi猲 мa Huy襫 Ho祅g <color=yellow>"..tWz[nWz+1].."<color> kh玭g?",
		3,
		"Ta mu鑞 甶襲 ch豱h/#add_tiandi_confirm("..nWz..")",
		"Kh玭g, ta nh莔!/add_tiandi_wz",
		"ьi ta m芻 trang b� l猲 ./nothing");		
end

function add_tiandi_confirm(nWz)
	if GetItemCount(2,1,504) < 1 then
		Talk(1,"","襲 ch豱h linh kh� trang b� Thi猲 мa Huy襫 Ho祅g c莕 1 N� Oa tinh th筩h, tr猲 ngi ngi kh玭g c�.");
		return
	end	
	local nIndex = GetPlayerEquipIndex(nWz); --获取装备索引
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --获取装备id
	local nLingqi = GetItemMaxLingQi(nIndex);   --获取灵气值
	local nMofa1,nLv1 = GetItemAttr(nIndex,1);--获取第一个魔法属性id 等级
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --获取装备是否定魂
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定	
	local nRandSeed = GetItemRandSeed(nIndex);--随机种子
	local nBody = GetBody();
	
	if nIndex == 0 then 
		Talk(1,"","Ngi kh玭g mang trang b� Thi猲 мa Huy襫 Ho祅g mu鑞 甶襲 ch豱h linh tr� tr猲 ngi.");
		return
	end
	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","Ngi 產ng mang trang b� b竧 qu竔 �, sau khi ph﹏ m秐h r錳 n 甶誹 ch豱h linh kh�.");
		return
	end
	
	if nWz ~= 2 then		
		if nId1 ~= tTiandiZb[nWz+1][nBody][2] or nId2 ~= tTiandiZb[nWz+1][nBody][3] or nId3 ~= tTiandiZb[nWz+1][nBody][4] then
			Talk(1,"","Ngi 產ng mang kh玭g ph秈 trang b� Thi猲 мa Huy襫 Ho祅g.");
			return
		end
	else
		local nWpIdx = 0;
		for i = 1,getn(tTiandiWp) do 
			if nId1 == tTiandiWp[i][2] and nId2 == tTiandiWp[i][3] and nId3 == tTiandiWp[i][4] then
				nWpIdx = i;
				break
			end
		end
		if nWpIdx == 0 then
			Talk(1,"","Ngi 產ng mang kh玭g ph秈 trang b� Thi猲 мa Huy襫 Ho祅g.");
			return		
		end
	end
		 
	if nLingqi == 0 or nMofa1 ~= 0 then
		Talk(1,"","Ch� c� trang b� Thi猲 мa Huy襫 Ho祅g ch璦 kh秏 m韎 c� th� 甶襲 ch豱h 頲!");
		return
	end
	if nLingqi == 120 then
		Talk(1,"","Trang b� Thi猲 мa Huy襫 Ho祅g c馻 ngi  l� 120 linh kh� r錳.");
		return
	end
	if nLock == 1 then
		Talk(1,"","Trang b� c馻 ngi hi謓 產ng � tr筺g th竔 kh鉧, h穣 m� kh鉧 r錳 n 甶襲 ch豱h.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","в b秓 m t礽 s秐 an to祅, trc khi 甶襲 ch豱h linh kh� trang b� ngi h穣 m� kh鉧 rng ch鴄  trc!");
		return
	end	
	if Zgc_pub_goods_add_chk(1,200) ~= 1 then
		return
	end
	if DelItem(2,1,504,1) == 1 then
		local del_flag = DelItemByIndex(nIndex,-1);
		if del_flag == 1 then
			local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,1,0,0,0,0,0,0,0,nQianghua,120,nRandSeed);
			if add_flag == 1 then
				SetEquipCanChouQu(nNewIndex,1);
				if nDing == 1 then
					SetItemSpecialAttr(nNewIndex,"DING7",1); --定魂
				end			  
				Talk(1,"","Ch骳 m鮪g ngi  甶襲 ch豱h linh kh� c馻 trang b� Thi猲 мa Huy襫 Ho祅g th祅h c玭g.");
				WriteLog("е t� th� r蘮 L璾-Thi猲 мa Huy襫 Ho祅g: Ngi ch琲"..GetName().."襲 ch豱h linh kh� trang b� Thi猲 мa Huy襫 Ho祅g th祅h c玭g, id v藅 ph萴, cng h鉧, nh h錸, h箃 gi鑞g ng蓇 nhi猲:"..nId1..","..nId2..","..nId3..","..nQianghua..","..nDing..","..nRandSeed);
			else
				WriteLog("е t� th� r蘮 L璾-Thi猲 мa Huy襫 Ho祅g: Ngi ch琲"..GetName().."襲 ch豱h linh kh� trang b� th蕋 b筰, v� tr� th蕋 b筰, id v藅 ph萴, cng h鉧, nh h錸, h箃 gi鑞g ng蓇 nhi猲:"..add_flag..","..nId1..","..nId2..","..nId3..","..nQianghua..","..nDing..","..nRandSeed);
			end
		end
	end		
end

function item_uplevel()
	local strtab = {
		"Ta mu鑞 th╪g c蕄 trang b� B竧 Qu竔 Linh kh� 40-79 (ti猽 hao 1 Tinh Luy謓 B╪g Th筩h)/#item_uplevel_wz(1)",
		"Ta mu鑞 th╪g c蕄 trang b� B竧 Qu竔 Linh kh� 80-100 (ti猽 hao 1 V� Ng蕁 Thu�)/#item_uplevel_wz(2)",
--		"我要把101-120灵气的八卦装备提升一级（消耗一个女娲精石）/#item_uplevel_wz(3)",
--		"我要把非八卦装备提升一级（消耗一个女娲精石）/#item_uplevel_wz(4)",
		"Ta mu鑞 th╪g c蕄 trang b� n c蕄 9 (ti猽 hao 1 N� Oa Tinh Th筩h)/#item_uplevel_wz(5)",
		"Ta ch� n xem th�/nothing"
		}
	Say("<color=green>е t� th� r蘮 L璾<color>: Hi謓 nay ta nh薾 th╪g c蕄 trang b� c� thu ph�, n誹 c� nhu c莡 c� n t譵 ta, <color=red>l璾 �, m鏸 trang b� ch� c� th� th╪g c蕄 1 l莕<color>.",
		getn(strtab),
		strtab)
end

function item_uplevel_wz(nType)
	local tItem = {"1 Tinh Luy謓 B╪g Th筩h","1 V� Ng蕁 Thu�","1 N� Oa Tinh Th筩h","1 N� Oa Tinh Th筩h","1 N� Oa Tinh Th筩h"}
	local strtab = {
		"u/#confirm_item_uplevel("..nType..",0)",
		"Ngo筰 trang/#confirm_item_uplevel("..nType..",1)",
		"H� y/#confirm_item_uplevel("..nType..",3)",
		"tr� l筰/item_uplevel"
		}
	Say("<color=green>е t� th� r蘮 L璾<color>: Ngi mu鑞 th╪g c蕄 trang b� n祔, c莕 ph秈 c� <color=yellow>"..tItem[nType].."<color>, ngi mu鑞 th╪g c蕄 trang b� � v� tr� n祇?",
		getn(strtab),
		strtab)
end

function confirm_item_uplevel(nType,nWz)
	local tItem = {{"Tinh luy謓 B╪g Th筩h",2,1,533,1,40,79},
								 {"V� Ng蕁 Th駓",2,1,503,1,80,100},
								 {"N� Oa Tinh Th筩h",2,1,504,1,101,120},
								 {"N� Oa Tinh Th筩h",2,1,504,1,0,0},
								 {"N� Oa Tinh Th筩h",2,1,504,1}};
	if GetItemCount(tItem[nType][2],tItem[nType][3],tItem[nType][4]) < tItem[nType][5] then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ngi mu鑞 th╪g c蕄 trang b� n祔, c莕 ph秈 c� <color=yellow>"..tItem[nType][5].."c竔"..tItem[nType][1].."<color>, ngi kh玭g  甶襲 ki謓.");
		return
	end	
	local nIndex = GetPlayerEquipIndex(nWz);	
	local nZhuangbeiLv = GetEquipLevel(nIndex); --获取当前装备等级
	local nLingqi = GetItemMaxLingQi(nIndex);   --获取灵气值
	local nBaseLv = GetEquipBaseLevel(nIndex); --获取装备基础等级
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定	
	if nIndex == 0 then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ngi ch璦 m芻 trang b� mu鑞 th╪g c蕄 l猲 ngi.");
		return
	end
	if nZhuangbeiLv > nBaseLv then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Trang b� n祔  th╪g c蕄 r錳, kh玭g th� th╪g c蕄 th猰 n鱝.");
		return
	end
	if nZhuangbeiLv >= 9 then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Trang b�  t n c蕄 cao nh蕋, kh玭g th� th╪g c蕄 th猰 n鱝.");
		return
	end
	if nLock == 1 then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Trang b� 產ng kho�, xin h穣 m� kho� r錳 n g苝 ta sau.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: в b秓 v� an to祅 cho t礽 kho秐, xin h穣 m� rng ch鴄  trc khi i trang b�, c秏 琻!");
		return
	end	
	if nType ~= 5 then
		if nLingqi >= tItem[nType][6] and nLingqi <= tItem[nType][7] then	
			if DelItem(tItem[nType][2],tItem[nType][3],tItem[nType][4],tItem[nType][5]) == 1 then	
				SetItemIncreaseLevel(nIndex,1);
				Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: B筺  th╪g c蕄 trang b� th祅h c玭g.");
				WriteLog("[е t� th� r蘮 L璾, th╪g c蕄 trang b轢: Ngi ch琲 "..GetName().."  th╪g c蕄 trang b� th祅h c玭g, lo筰 v� v� tr�: "..nType..", "..nWz);
			end
		else
			Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Lo筰 trang b� b筺 ch鋘 kh玭g ph� h頿, c� ph秈 ch鋘 nh莔 kh玭g?")
			return
		end
	else
		if DelItem(tItem[nType][2],tItem[nType][3],tItem[nType][4],tItem[nType][5]) == 1 then	
			if nZhuangbeiLv < 9 then
				SetItemIncreaseLevel(nIndex,9-nBaseLv);
				Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: B筺  th╪g c蕄 trang b� th祅h c玭g.");
				WriteLog("[е t� th� r蘮 L璾, th╪g c蕄 trang b轢: Ngi ch琲 "..GetName().."  th╪g c蕄 trang b� th祅h c玭g, lo筰 v� v� tr�: "..nType..", "..nWz);
			end
		end 
	end
end

function about_bufeiyan()
	local strtab = {
		"Ta mu鑞 d飊g [V� kh� B� Phi Y猲]  i 2 Linh th筩h c蕄 7 ng蓇 nhi猲/#ask_bufeiyan(1)",
		"Ta mu鑞 d飊g [V� kh� B� Phi Y猲]  i 5 Linh th筩h c蕄 6 ng蓇 nhi猲/#ask_bufeiyan(2)",
		"Ta mu鑞 d飊g [Ng鋍 Th� Dc Bao] v� 500 v祅g  i 1 Linh th筩h c蕄 7/#ask_bufeiyan(3)",
		"Ta mu鑞 d飊g [Ng鋍 Th� Dc Bao] v� 500 v祅g  i 3 Linh th筩h c蕄 6/#ask_bufeiyan(4)",
		"Ta ch� n xem th�/nothing"}
	Say("<color=green>е t� th� r蘮 L璾<color>: G莕 y s� ph� mu鑞 th� n﹏g c蕄 linh kh� c馻 c竎 v� kh� qu� hi誱, cho n猲 ta 產ng s璾 t藀 c竎 trang b� Ho祅g Kim nh� B� Phi Y猲, Ng鋍 Th� Dc Bao. N誹 ngi c� th� ta c� th� d飊g Linh th筩h  i v韎 ngi.",
		getn(strtab),
		strtab)
end

function ask_bufeiyan(nType)
	if nType == 1 then
		PutinItemBox("V� kh� B� Phi Y猲 i Linh th筩h" ,1 , "Ngi mu鑞 d飊g 1 <color=yellow>v� kh� B� Phi Y猲 Ho祅g Kim<color>  i <color=yellow>2 Linh th筩h c蕄 7<color>, sau khi i Linh th筩h s� 頲 t v祇 T� Linh nh. X竎 nh薾 mu鑞 i?", THIS_FILE, 1617)
	elseif nType == 2 then
		PutinItemBox("V� kh� B� Phi Y猲 i Linh th筩h" ,1 , "Ngi mu鑞 d飊g 1 <color=yellow>v� kh� B� Phi Y猲 Ho祅g Kim<color>  i <color=yellow>5 Linh th筩h c蕄 6<color>, sau khi i Linh th筩h s� 頲 t v祇 T� Linh nh. X竎 nh薾 mu鑞 i?", THIS_FILE, 1619)
	elseif nType == 3 then
		if GetCash() < 5000000 then
			Say("<color=green>е t� th� r蘮 L璾<color>: Ngi kh玭g c�  500 v祅g, kh玭g th� i.", 0)
			return
		end
		PutinItemBox("Ng鋍 Th� Dc Bao i Linh th筩h" ,1 , "Ngi mu鑞 d飊g 1 <color=yellow>Ng鋍 Th� Dc Bao v� 500 v祅g<color>  i <color=yellow>1 Linh th筩h c蕄 7<color>, sau khi i Linh th筩h s� 頲 t v祇 T� Linh nh. X竎 nh薾 mu鑞 i?", THIS_FILE, 1621)
	elseif nType == 4 then
		if GetCash() < 5000000 then
			Say("<color=green>е t� th� r蘮 L璾<color>: Ngi kh玭g c�  500 v祅g, kh玭g th� i.", 0)
			return
		end
		PutinItemBox("Ng鋍 Th� Dc Bao i Linh th筩h" ,1 , "Ngi mu鑞 d飊g 1 <color=yellow>Ng鋍 Th� Dc Bao v� 500 v祅g<color>  i <color=yellow>3 Linh th筩h c蕄 6<color>, sau khi i Linh th筩h s� 頲 t v祇 T� Linh nh. X竎 nh薾 mu鑞 i?", THIS_FILE, 1623)
	else
		return
	end
	
	if GetTask(805) == 2 then
		OpenBox()
	end
end

function OnPutinCheck(param, idx, genre, detail, particular)
	local tItem =
	{
		["Ph� Y猲 產o"] = {0,3,6001,},
		["Ph� Y猲 c玭"] = {0,5,6002,},
		["Ph� Y猲 trng"] = {0,8,6003,},
		["H祄 Y猲 th�"] = {0,0,6004,},
		["T祅g Y猲 ch﹎"] = {0,1,6005,},
		["Phi Y猲 ki誱"] = {0,2,6006,},
		["V薾 Y猲 c莔"] = {0,10,6007,},
		["V﹏ Y猲 th�"] = {0,0,6008,},
		["L璾 Y猲 c玭"] = {0,5,6009,},
		["Huy襫 Y猲 ki誱"] = {0,2,6010,},
		["V� Y猲 b髏"] = {0,9,6011,},
		["H� Ti猰 Thng"] = {0,6,6012,},
		["H祅h Y猲 Cung"] = {0,4,6013,},
		["Tr鋍 Y猲 nh蒼"] = {0,7,6014,},
		["Y猽 Y猲 tr秓"] = {0,11,6015,},
	}
	
	-- 锁定的不让交
	if GetItemSpecialAttr(idx, "LOCK") > 0 then
		Say("<color=green>е t� th� r蘮 L璾<color>: Зy l� v藅 qu� gi�, thi誹 hi謕  kho� l筰, kh玭g th� i 頲. N誹 mu鑞 i xin h穣 m� kho� r錳 n g苝 ta.", 0)
		return 0
	end

	local allow_item = 0
	if param == 1617 or param == 1619 then
		for i, v in tItem do
			if v[1] == genre and v[2] == detail and v[3] == particular then
				allow_item = 1
				break
			end
		end
		
		if allow_item == 1 then
			return 1
		else
			Say("<color=green>е t� th� r蘮 L璾<color>: Зy kh玭g ph秈 l� v藅 ta c莕.", 0)
			return 0
		end
	elseif param == 1621 or param == 1623 then
		if GetCash() < 5000000 then
			Say("<color=green>е t� th� r蘮 L璾<color>: Ngi kh玭g c�  500 v祅g, kh玭g th� i.", 0)
			return 0
		end
		
		if genre == 0 and detail == 102 and particular == 41 then
			return 1
		else
			Say("<color=green>е t� th� r蘮 L璾<color>: Зy kh玭g ph秈 l� v藅 ta c莕.", 0)
			return 0
		end
	end
	return 0
end


function OnPutinComplete(param)
	if param ~= 1617 and param ~= 1619 and param ~= 1621 and param ~= 1623 then		-- 非法回调
		return
	end
	
	if (param == 1621 or param == 1623) and Pay(5000000) ~= 1 then
		Say("<color=green>е t� th� r蘮 L璾<color>: Ngi kh玭g c�  500 v祅g, kh玭g th� i.", 0)
		return
	end

	local t = GetPutinItem()
	if getn(t) > 1 then		-- 额外检测
		return
	end
	local ItemName = t[1][5]

	if DelItemByIndex(t[1][1], -1) == 1 then
		if param == 1617 then
			lspf_AddLingShiInBottle(7,2);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 2 Linh th筩h c蕄 7, Linh th筩h  頲 t v祇 T� Linh nh.");
			Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ch骳 m鮪g ngi  d飊g trang b� i Linh th筩h th祅h c玭g!");
			WriteLog("[е t� th� r蘮 L璾 B� Phi Y猲]: Name="..GetName().." Result=Success Event=UseBFY(7,2) Item="..t[1][2]..","..t[1][3]..","..t[1][4]);
		elseif param == 1619 then
			lspf_AddLingShiInBottle(6,5);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 5 Linh th筩h c蕄 6, Linh th筩h  頲 t v祇 T� Linh nh.");
			Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ch骳 m鮪g ngi  d飊g trang b� i Linh th筩h th祅h c玭g!");
			WriteLog("[е t� th� r蘮 L璾 B� Phi Y猲]: Name="..GetName().." Result=Success Event=UseBFY(6,5) Item="..t[1][2]..","..t[1][3]..","..t[1][4]);
		elseif param == 1621 then
			lspf_AddLingShiInBottle(7,1);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh th筩h c蕄 7, Linh th筩h  頲 t v祇 T� Linh nh.");
			Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ch骳 m鮪g ngi  d飊g trang b� i Linh th筩h th祅h c玭g!");
			WriteLog("[е t� th� r蘮 L璾 B� Phi Y猲]: Name="..GetName().." Result=Success Event=UseYLT(7,1) Item="..t[1][2]..","..t[1][3]..","..t[1][4]);
		elseif param == 1623 then
			lspf_AddLingShiInBottle(6,3);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 3 Linh th筩h c蕄 6, Linh th筩h  頲 t v祇 T� Linh nh.");
			Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ch骳 m鮪g ngi  d飊g trang b� i Linh th筩h th祅h c玭g!");
			WriteLog("[е t� th� r蘮 L璾 B� Phi Y猲]: Name="..GetName().." Result=Success Event=UseYLT(6,3) Item="..t[1][2]..","..t[1][3]..","..t[1][4]);
		else
			WriteLog("[е t� th� r蘮 L璾 B� Phi Y猲]: Name="..GetName().." Result=fail Item="..t[1][2]..","..t[1][3]..","..t[1][4]);
		end
	else
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ngi kh玭g c� <color=yellow>"..ItemName.."<color>!")
		if param == 1621 or param == 1623 then
			Earn(5000000)	-- 把扣除的钱补回来
		end
	end
end

function chang_yijiding()
	if GetItemCount(2,1,3213) < 1 then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ngi kh玭g c� Thanh уng жnh c蕄 1.");	
	else
		Say("<color=green>е t� th� r蘮 L璾<color>: Ngi mu鑞 i trang b� n祇?",
			5,
			"Thi猲 мa Huy襫 Ho祅g Kh玦/#choose_tiandi_lingqi(1,0)",
			"Thi猲 мa Huy襫 Ho祅g Gi竝 /#choose_tiandi_lingqi(2,0)",
			"Gi莥 Thi猲 мa Huy襫 Ho祅g/#choose_tiandi_lingqi(3,0)",
			"V� kh� Thi猲 мa Huy襫 Ho祅g/choose_tiandi_weapon",
			"T筸 th阨 kh玭g i. /nothing")
	end
end

function choose_tiandi_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then 
		Say("<color=green>е t� th� r蘮 L璾<color>: Ngi mu鑞 i v� kh� n祇?",
			3,
			"Thi猲 мa Huy襫 Ho祅g Dao/#choose_tiandi_lingqi(4,1)",
			"Thi猲 мa Huy襫 Ho祅g C玭/#choose_tiandi_lingqi(4,2)",
			"T筸 th阨 kh玭g i. /nothing")
	else
		choose_tiandi_lingqi(4,0);
	end
end

function choose_tiandi_lingqi(nType,nWp)
	Say("<color=green>е t� th� r蘮 L璾<color>: H穣 ch鋘 甶觤 linh kh� c馻 trang b� n祔.",
		3,
		"119 linh kh� [C祅 Kh秏 Ch蕁 C蕁]/#ask_is_duihuan("..nType..","..nWp..",119)",
		"120 linh kh� [Kh玭 礽 Ly T鑞]/#ask_is_duihuan("..nType..","..nWp..",120)",
		"T筸 th阨 kh玭g i. /nothing")
end

function ask_is_duihuan(nType,nWp,nLingqi)
	local tTiandiName = {"Thi猲 мa Huy襫 Ho祅g Kh玦","Thi猲 мa Huy襫 Ho祅g Gi竝 ","Gi莥 Thi猲 мa Huy襫 Ho祅g","V� kh� Thi猲 мa Huy襫 Ho祅g"};
	Say("<color=green>е t� th� r蘮 L璾<color>: Ngi mu鑞 d飊g Thanh уng nh c蕄 1 i linh kh� <color=yellow>"..nLingqi.."-"..tTiandiName[nType].."<color> ch�?",
		3,
		"�, ta mu鑞 i./#confirm_change_yijiding("..nType..","..nWp..","..nLingqi..")",
		"Kh玭g, ta nh莔!/chang_yijiding",
		"T筸 th阨 kh玭g i. /nothing"
		)
end

function confirm_change_yijiding(nType,nWp,nLingqi)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if GetItemCount(2,1,3213) < 1 then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ngi kh玭g c� Thanh уng жnh c蕄 1.");
		return
	end	
	if Zgc_pub_goods_add_chk(1,250) ~= 1 then
		return
	end	
	if nType == 4 then
		if nRoute == 2 then
			if DelItem(2,1,3213,1) == 1 then
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nWp][2],tTiandi[nType][nRoute][nWp][3],tTiandi[nType][nRoute][nWp][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Ch骳 m鮪g i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nWp][1]);
					Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ch骳 m鮪g ngi d飊g Thanh уng nh c蕄 1 i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nWp][1]);
					Msg2Global(GetName().."D飊g Thanh уng nh  i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nWp][1]);
					WriteLog("[е t� th� r蘮 L璾 Thi猲 мa Huy襫 Ho祅g]: Ngi ch琲 "..GetName().."D飊g Thanh уng nh  i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nWp][1]);
				else
					WriteLog("[е t� th� r蘮 L璾 Thi猲 мa Huy襫 Ho祅g]: Ngi ch琲 "..GetName().."S� d鬾g Thanh уng nh c蕄 1 th蕋 b筰, log:"..add_flag);
				end
			end
		else
			if DelItem(2,1,3213,1) == 1 then
				local nRand = random(1,getn(tTiandi[nType][nRoute]));
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nRand][2],tTiandi[nType][nRoute][nRand][3],tTiandi[nType][nRoute][nRand][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Ch骳 m鮪g i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nRand][1]);
					Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ch骳 m鮪g ngi d飊g Thanh уng nh c蕄 1 i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nRand][1]);
					Msg2Global(GetName().."D飊g Thanh уng nh  i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nRand][1]);
					WriteLog("[е t� th� r蘮 L璾 Thi猲 мa Huy襫 Ho祅g]: Ngi ch琲 "..GetName().."D飊g Thanh уng nh  i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nRand][1]);
				else
					WriteLog("[е t� th� r蘮 L璾 Thi猲 мa Huy襫 Ho祅g]: Ngi ch琲 "..GetName().."S� d鬾g Thanh уng nh c蕄 1 th蕋 b筰, log:"..add_flag);
				end	
			end				
		end
	elseif nType == 1 or nType ==2 or nType == 3 then
		if DelItem(2,1,3213,1) == 1 then
			local add_flag,add_idx = AddItem(tTiandi[nType][nBody][2],tTiandi[nType][nBody][3],tTiandi[nType][nBody][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
			if add_flag == 1 then
			  SetEquipCanChouQu(add_idx,1);
				Msg2Player("Ch骳 m鮪g i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nBody][1]);
				Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ch骳 m鮪g ngi d飊g Thanh уng nh c蕄 1 i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nBody][1]);
				Msg2Global(GetName().."D飊g Thanh уng nh  i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nBody][1]);
				WriteLog("[е t� th� r蘮 L璾 Thi猲 мa Huy襫 Ho祅g]: Ngi ch琲 "..GetName().."D飊g Thanh уng nh  i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nBody][1]);
			else
				WriteLog("[е t� th� r蘮 L璾 Thi猲 мa Huy襫 Ho祅g]: Ngi ch琲 "..GetName().."S� d鬾g Thanh уng nh c蕄 1 th蕋 b筰, log:"..add_flag);
			end	
		end
	end				
end

function chang_yanhuangtiehun()
	if GetItemCount(2,1,1146) < 1 then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ngi kh玭g c� Vi猰 Ho祅g Thi誸 H錸.");	
	else
		Say("<color=green>е t� th� r蘮 L璾<color>: Ngi mu鑞 i trang b� n祇?",
			5,
			"Thi猲 мa Huy襫 Ho祅g Kh玦/#yanhuang_tiandi_lingqi(1,0)",
			"Thi猲 мa Huy襫 Ho祅g Gi竝 /#yanhuang_tiandi_lingqi(2,0)",
			"Gi莥 Thi猲 мa Huy襫 Ho祅g/#yanhuang_tiandi_lingqi(3,0)",
			"V� kh� Thi猲 мa Huy襫 Ho祅g/yanhuang_tiandi_weapon",
			"T筸 th阨 kh玭g i. /nothing")
	end
end

function yanhuang_tiandi_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then 
		Say("<color=green>е t� th� r蘮 L璾<color>: Ngi mu鑞 i v� kh� n祇?",
			3,
			"Thi猲 мa Huy襫 Ho祅g Dao/#yanhuang_tiandi_lingqi(4,1)",
			"Thi猲 мa Huy襫 Ho祅g C玭/#yanhuang_tiandi_lingqi(4,2)",
			"T筸 th阨 kh玭g i. /nothing")
	else
		yanhuang_tiandi_lingqi(4,0);
	end
end

function yanhuang_tiandi_lingqi(nType,nWp)
	Say("<color=green>е t� th� r蘮 L璾<color>: H穣 ch鋘 甶觤 linh kh� c馻 trang b� n祔.",
		3,
		"119 linh kh� [C祅 Kh秏 Ch蕁 C蕁]/#ask_yanhuang_duihuan("..nType..","..nWp..",119)",
		"120 linh kh� [Kh玭 礽 Ly T鑞]/#ask_yanhuang_duihuan("..nType..","..nWp..",120)",
		"T筸 th阨 kh玭g i. /nothing")
end

function ask_yanhuang_duihuan(nType,nWp,nLingqi)
	local tTiandiName = {"Thi猲 мa Huy襫 Ho祅g Kh玦","Thi猲 мa Huy襫 Ho祅g Gi竝 ","Gi莥 Thi猲 мa Huy襫 Ho祅g","V� kh� Thi猲 мa Huy襫 Ho祅g"};
	Say("<color=green>е t� th� r蘮 L璾<color>: Ngi mu鑞 d飊g Vi猰 Ho祅g Thi誸 H錸 i 甶觤 linh kh� <color=yellow>"..nLingqi.."-"..tTiandiName[nType].."<color> ch�?",
		3,
		"�, ta mu鑞 i./#confirm_change_yanhuang("..nType..","..nWp..","..nLingqi..")",
		"Kh玭g, ta nh莔!/chang_yanhuang",
		"T筸 th阨 kh玭g i. /nothing"
		)
end

function confirm_change_yanhuang(nType,nWp,nLingqi)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if GetItemCount(2,1,1146) < 1 then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ngi kh玭g c� Vi猰 Ho祅g Thi誸 H錸.");
		return
	end	
	if Zgc_pub_goods_add_chk(1,250) ~= 1 then
		return
	end	
	if nType == 4 then
		if nRoute == 2 then
			if DelItem(2,1,1146,1) == 1 then
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nWp][2],tTiandi[nType][nRoute][nWp][3],tTiandi[nType][nRoute][nWp][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Ch骳 m鮪g ngi d飊g Vi猰 Ho祅g Thi誸 H錸 i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nWp][1]);
					Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ch骳 m鮪g ngi d飊g Vi猰 Ho祅g Thi誸 H錸 i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nWp][1]);
					Msg2Global(GetName().."D飊g Vi猰 Ho祅g Thi誸 H錸 i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nWp][1]);
					WriteLog("[е t� th� r蘮 L璾 Thi猲 мa Huy襫 Ho祅g]: Ngi ch琲 "..GetName().."D飊g Vi猰 Ho祅g Thi誸 H錸 i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nWp][1]);
				else
					WriteLog("[е t� th� r蘮 L璾 Thi猲 мa Huy襫 Ho祅g]: Ngi ch琲 "..GetName().."D飊g Vi猰 Ho祅g Thi誸 H錸 i th蕋 b筰, v� tr� th蕋 b筰: "..add_flag);
				end
			end
		else
			if DelItem(2,1,1146,1) == 1 then
				local nRand = random(1,getn(tTiandi[nType][nRoute]));
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nRand][2],tTiandi[nType][nRoute][nRand][3],tTiandi[nType][nRoute][nRand][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Ch骳 m鮪g ngi d飊g Vi猰 Ho祅g Thi誸 H錸 i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nRand][1]);
					Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ch骳 m鮪g ngi d飊g Vi猰 Ho祅g Thi誸 H錸 i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nRand][1]);
					Msg2Global(GetName().."D飊g Vi猰 Ho祅g Thi誸 H錸 i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nRand][1]);
					WriteLog("[е t� th� r蘮 L璾 Thi猲 мa Huy襫 Ho祅g]: Ngi ch琲 "..GetName().."D飊g Vi猰 Ho祅g Thi誸 H錸 i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nRoute][nRand][1]);
				else
					WriteLog("[е t� th� r蘮 L璾 Thi猲 мa Huy襫 Ho祅g]: Ngi ch琲 "..GetName().."D飊g Vi猰 Ho祅g Thi誸 H錸 i th蕋 b筰, v� tr� th蕋 b筰: "..add_flag);
				end	
			end				
		end
	elseif nType == 1 or nType ==2 or nType == 3 then
		if DelItem(2,1,1146,1) == 1 then
			local add_flag,add_idx = AddItem(tTiandi[nType][nBody][2],tTiandi[nType][nBody][3],tTiandi[nType][nBody][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
			if add_flag == 1 then
			  SetEquipCanChouQu(add_idx,1);
				Msg2Player("Ch骳 m鮪g ngi d飊g Vi猰 Ho祅g Thi誸 H錸 i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nBody][1]);
				Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ch骳 m鮪g ngi d飊g Vi猰 Ho祅g Thi誸 H錸 i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nBody][1]);
				Msg2Global(GetName().."D飊g Vi猰 Ho祅g Thi誸 H錸 i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nBody][1]);
				WriteLog("[е t� th� r蘮 L璾 Thi猲 мa Huy襫 Ho祅g]: Ngi ch琲 "..GetName().."D飊g Vi猰 Ho祅g Thi誸 H錸 i th祅h c玭g, nh薾 頲 "..tTiandi[nType][nBody][1]);
			else
				WriteLog("[е t� th� r蘮 L璾 Thi猲 мa Huy襫 Ho祅g]: Ngi ch琲 "..GetName().."D飊g Vi猰 Ho祅g Thi誸 H錸 i th蕋 b筰, v� tr� th蕋 b筰: "..add_flag);
			end	
		end
	end				
end

function get_bagua_lingshi_mianfei()
	Say("Ngi mu鑞 l蕐 linh kh� c馻 trang b� n祇 tr猲 ngi?",
		5,
		"u/#ask_quchu_lingshi_mianfei(0)",
		"Ngo筰 trang/#ask_quchu_lingshi_mianfei(1)",
		"H� y/#ask_quchu_lingshi_mianfei(3)",
		"V� kh�/#ask_quchu_lingshi_mianfei(2)",
		"ьi ta m芻 trang b� l猲 ./nothing")	
end

function ask_quchu_lingshi_mianfei(nWz)
	local tChouqu = {"u","Ngo筰 trang","V� kh�","H� y"}
	Say("Ngi mu鑞 l蕐  tr猲 <color=yellow>"..tChouqu[nWz+1].."<color> �?",
		3,
		"Л頲/#confirm_quchu_lingshi_mianfei("..nWz..")",
		"Ta ch鋘 nh莔 r錳./get_bagua_lingshi_mianfei",
		"ьi ta m芻 trang b� l猲 ./nothing")
end

function confirm_quchu_lingshi_mianfei(nWz)
	local nIndex = GetPlayerEquipIndex(nWz); --获取装备索引
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --获取装备id
	local nZhuangbeiLv = GetEquipLevel(nIndex); --获取当前装备等级
	local nBaseLv = GetEquipBaseLevel(nIndex); --获取装备基础等级
	local nLingqi = GetItemMaxLingQi(nIndex);   --获取灵气值
	local nMofa1,nLv1 = GetItemAttr(nIndex,1);--获取第一个魔法属性id 等级
	local nMofa2,nLv2 = GetItemAttr(nIndex,2);--获取第二个魔法属性id 等级
	local nMofa3,nLv3 = GetItemAttr(nIndex,3);--获取第三个魔法属性id 等级
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nGuawei = GetEquipBaGua(nIndex); --获取卦位
	local nJihuo = GetEquipBaGuaJiHuo(nIndex);--是否已经激活
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --获取装备是否定魂
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定	
	local nRandSeed = GetItemRandSeed(nIndex);--随机种子
	local nMofaRand1 = mod(floor(GetItemParam(nIndex,0)/2^16),2^11); --属性一的随机种子
	local nMofaRand2 = mod(floor(GetItemParam(nIndex,1)/2^16),2^11); --属性二的随机种子
	local nMofaRand3 = mod(floor(GetItemParam(nIndex,2)/2^16),2^11); --属性三的随机种子
	local nMofaJiou1 = mod(floor(GetItemParam(nIndex,0)/2^14),2^2); --属性一的阴阳，2为阳（奇数），1为阴（偶数）
	local nMofaJiou2 = mod(floor(GetItemParam(nIndex,1)/2^14),2^2); --属性二的阴阳，2为阳，1为阴
	local nMofaJiou3 = mod(floor(GetItemParam(nIndex,2)/2^14),2^2); --属性三的阴阳，2为阳，1为阴
	
	if nIndex == 0 then 
		Talk(1,"","Ngi kh玭g c� mang trang b� mu鑞 l蕐 linh kh� ra tr猲 ngi.");
		return
	end
	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","Ngi 產ng mang trang b� b竧 qu竔 �, sau khi ph﹏ m秐h n nh薾 linh th筩h.");
		return
	end
		 
	if nLingqi == 0 or nMofa1 == 0 then
		Talk(1,"","Trang b� n祔 c馻 ngi kh玭g c� kh秏  l祄 sao l蕐 頲!");
		return
	end
	if nLock == 1 then
		Talk(1,"","Trang b� tr猲 ngi ngi  kh鉧, c莕 m� kh鉧 m韎 c� th� th╪g c蕄.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","в b祇 m t礽 s秐 an to祅, trc khi l蕐 linh th筩h ngi h穣 m� kh鉧 rng ch鴄  trc!");
		return
	end	
	if Zgc_pub_goods_add_chk(4,200) ~= 1 then
		return
	end
	local del_flag = DelItemByIndex(nIndex,-1);
	if del_flag == 1 then
		local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,1,0,0,0,0,0,0,0,nQianghua,nLingqi,nRandSeed);
		if add_flag == 1 then
			SetEquipCanChouQu(nNewIndex,1);
			SetItemIncreaseLevel(nNewIndex,nZhuangbeiLv-nBaseLv);
			if nDing == 1 then
				SetItemSpecialAttr(nNewIndex,"DING7",1); --定魂
			end
			local nLingshiLingqi1 = get_lingqi_jiou(nMofa1,nWz,nLv1,nMofaJiou1) --返回对应奇偶灵气
			AddLingShi(nMofa1,nWz,nLv1,nLingshiLingqi1,nMofaRand1);
			if nMofa2 ~= 0 then
				local nLingshiLingqi2 = get_lingqi_jiou(nMofa2,nWz,nLv2,nMofaJiou2) --返回对应奇偶灵气
				AddLingShi(nMofa2,nWz,nLv2,nLingshiLingqi2,nMofaRand2);	
			end
			if nMofa3 ~= 0 then
				local nLingshiLingqi3 = get_lingqi_jiou(nMofa3,nWz,nLv3,nMofaJiou3) --返回对应奇偶灵气
				AddLingShi(nMofa3,nWz,nLv3,nLingshiLingqi3,nMofaRand3);								
			end
			if nJihuo ~= 0 and nLingqi >= 80 then   --已经激活
				if nGuawei ~= 0 and nGuawei ~= 5 then
					AddItem(tBaguaNum[nGuawei][2],tBaguaNum[nGuawei][3],tBaguaNum[nGuawei][4],tBaguaNum[nGuawei][5]);
				end
			end				  
			Talk(1,"","Ch骳 m鮪g ngi  l蕐 linh th筩h th祅h c玭g.");
			WriteLog("е t� th� r蘮 L璾 l蕐 linh th筩h: Ngi ch琲"..GetName().."Th祅h c玭g khi l蕐 linh th筩h t╪g trang b�, id v藅 ph萴, linh kh�, cng h鉧, nh h錸, h箃 gi鑞g ng蓇 nhi猲, linh th筩h thu閏 t輓h 1, ng c蕄, thu閏 t輓h 2, ng c蕄, thu閏 t輓h 3, ng c蕄:"..nId1..","..nId2..","..nId3..","..nLingqi..","..nQianghua..","..nDing..","..nRandSeed..","..nMofa1..","..nLv1..","..nMofa2..","..nLv2..","..nMofa3..","..nLv3);
		else
			WriteLog("е t� th� r蘮 L璾 l蕐 linh th筩h: Ngi ch琲"..GetName().."Th蕋 b筰 khi l蕐 linh th筩h t╪g trang b�, v� tr� th蕋 b筰, id v藅 ph萴, linh kh�, cng h鉧, nh h錸, h箃 gi鑞g ng蓇 nhi猲, linh th筩h thu閏 t輓h 1, ng c蕄, thu閏 t輓h 2, ng c蕄, thu閏 t輓h 3, ng c蕄:"..add_flag..","..nId1..","..nId2..","..nId3..","..nLingqi..","..nQianghua..","..nDing..","..nRandSeed..","..nMofa1..","..nLv1..","..nMofa2..","..nLv2..","..nMofa3..","..nLv3);
		end		
	end			
end

function box_change_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then
		Say("<color=green>е t� th� r蘮 L璾<color>: D飊g 15 Rng v祅g Th辬h Th� i 1 v� kh� Ho祅g д <color=yellow>c馻 l璾 ph竔<color> tng 鴑g. Ngi c� mu鑞 i kh玭g?",
			3,
			"Ph秈, ta mu鑞 i Hi猲 Vi猲 To竔 V� o/#confirm_box_change_weapon(1)",
			"Ph秈, ta mu鑞 i Hi猲 Vi猲 To竔 V� C玭/#confirm_box_change_weapon(2)",
			"Ch� xem th�!/nothing")		
	else
		Say("<color=green>е t� th� r蘮 L璾<color>: D飊g 15 Rng v祅g Th辬h Th� i 1 v� kh� Ho祅g д <color=yellow>c馻 l璾 ph竔<color> tng 鴑g. Ngi c� mu鑞 i kh玭g?",
			2,
			"�, ta mu鑞 i./#confirm_box_change_weapon(0)",
			"Ch� xem th�!/nothing")
	end
end

function confirm_box_change_weapon(nType)
	if GetItemCount(2,0,1028) < 15 then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ngi kh玭g c� 15 Rng v祅g Th辬h Th�.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","в b祇 m t礽 s秐 an to祅, trc khi l蕐 linh th筩h ngi h穣 m� kh鉧 rng ch鴄  trc!");
		return
	end		
	if Zgc_pub_goods_add_chk(1,50) ~= 1 then   --空间负重检测
		return
	end		
	local nRoute = GetPlayerRoute();
	if nRoute == 0 then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: H穣 v祇 m玭 ph竔 r錳 h穣 i.");
		return
	end
	if DelItem(2,0,1028,15) == 1 then
		local nRand = random(1,getn(tHuangDiWeapon[nRoute]));
		if nRoute == 2 then
			local nAddFlag = AddItem(tHuangDiWeapon[nRoute][nType][2],tHuangDiWeapon[nRoute][nType][3],tHuangDiWeapon[nRoute][nType][4],1,1,-1,-1,-1,-1,-1,-1);
			if nAddFlag == 1 then
				Msg2Player("Ch骳 m鮪g ngi nh薾 頲 1  "..tHuangDiWeapon[nRoute][nType][1]);
				WriteLog("[Rng v祅g Th辬h Th� i v� kh� Ho祅g д]: Ngi ch琲 "..GetName().."D飊g 15 Rng v祅g Th辬h Th� i 1 "..tHuangDiWeapon[nRoute][nType][1]);
			else
				WriteLog("[Rng v祅g Th辬h Th� i v� kh� Ho祅g д]: Ngi ch琲 "..GetName().."D飊g 15 Rng v祅g Th辬h Th� i 1 "..tHuangDiWeapon[nRoute][nType][1].." th蕋 b筰, k� hi謚:"..nAddFlag);
			end		
		else
			local nAddFlag = AddItem(tHuangDiWeapon[nRoute][nRand][2],tHuangDiWeapon[nRoute][nRand][3],tHuangDiWeapon[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
			if nAddFlag == 1 then
				Msg2Player("Ch骳 m鮪g ngi nh薾 頲 1  "..tHuangDiWeapon[nRoute][nRand][1]);
				WriteLog("[Rng v祅g Th辬h Th� i v� kh� Ho祅g д]: Ngi ch琲 "..GetName().."D飊g 15 Rng v祅g Th辬h Th� i 1 "..tHuangDiWeapon[nRoute][nRand][1]);
			else
				WriteLog("[Rng v祅g Th辬h Th� i v� kh� Ho祅g д]: Ngi ch琲 "..GetName().."D飊g 15 Rng v祅g Th辬h Th� i 1 "..tHuangDiWeapon[nRoute][nRand][1].." th蕋 b筰, k� hi謚:"..nAddFlag);
			end		
		end
	else
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ngi kh玭g c� 15 Rng v祅g Th辬h Th�.");
	end
end

function jinbox_huan_ring()
	Say("<color=green>е t� th� r蘮 L璾<color>: D飊g 4 Rng v祅g Th辬h Th� i trang s鴆 Ho祅g д <color=yellow> c馻 l璾 ph竔<color> tng 鴑g, ngi mu鑞 i trang s鴆 Ho祅g д n祇?",
		3,
		"Ta mu鑞 i Hi猲 Vi猲 Chi課/#choose_xuanyuan(1)",
		"Ta mu鑞 i Hi猲 Vi猲 u/#choose_xuanyuan(2)",
		"Kh玭g c� g�!/nothing")
end

function choose_xuanyuan(nType)
	local tRing = {"Hi猲 Vi猲 Chi課","Hi猲 Vi猲 u"};
	Say("<color=green>е t� th� r蘮 L璾<color>: D飊g 4 Rng v祅g Th辬h Th� i 1 <color=yellow>"..tRing[nType].."<color> ch�?",
		2,
		"�, ta mu鑞 i./#confirm_jinbox_xuanyuan("..nType..")",
		"Ta ch鋘 nh莔 r錳./jinbox_huan_ring")
end

function confirm_jinbox_xuanyuan(nType)
	if GetItemCount(2,0,1028) < 4 then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ngi kh玭g c� 4 Rng v祅g Th辬h Th�.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","в b祇 m t礽 s秐 an to祅, trc khi l蕐 linh th筩h ngi h穣 m� kh鉧 rng ch鴄  trc!");
		return
	end		
	if Zgc_pub_goods_add_chk(1,50) ~= 1 then   --空间负重检测
		return
	end		
	local nRoute = GetPlayerRoute();
	if nRoute == 0 then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: H穣 v祇 m玭 ph竔 r錳 h穣 i.");
		return
	end
	if DelItem(2,0,1028,4) == 1 then
		if nType == 1 then
			local nRand = random(1,getn(tXuanyuanZhan[nRoute]));
			local nAddFlag = AddItem(tXuanyuanZhan[nRoute][nRand][2],tXuanyuanZhan[nRoute][nRand][3],tXuanyuanZhan[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
			if nAddFlag == 1 then
				Msg2Player("Ch骳 m鮪g ngi nh薾 頲 1 "..tXuanyuanZhan[nRoute][nRand][1]);
				WriteLog("[Rng v祅g Th辬h Th� i trang s鴆 Ho祅g д]: Ngi ch琲 "..GetName().."D飊g 4 Rng v祅g Th辬h Th� i 1 "..tXuanyuanZhan[nRoute][nRand][1]);
			else
				WriteLog("[Rng v祅g Th辬h Th� i trang s鴆 Ho祅g д]: Ngi ch琲 "..GetName().."D飊g 4 Rng v祅g Th辬h Th� i 1"..tXuanyuanZhan[nRoute][nRand][1].." th蕋 b筰, k� hi謚:"..nAddFlag);
			end		
		elseif nType == 2 then
			local nRand = random(1,getn(tXuanyuanDou[nRoute]));
			local nAddFlag = AddItem(tXuanyuanDou[nRoute][nRand][2],tXuanyuanDou[nRoute][nRand][3],tXuanyuanDou[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
			if nAddFlag == 1 then
				Msg2Player("Ch骳 m鮪g ngi nh薾 頲 1 "..tXuanyuanDou[nRoute][nRand][1]);
				WriteLog("[Rng v祅g Th辬h Th� i trang s鴆 Ho祅g д]: Ngi ch琲 "..GetName().."D飊g 4 Rng v祅g Th辬h Th� i 1 "..tXuanyuanDou[nRoute][nRand][1]);
			else
				WriteLog("[Rng v祅g Th辬h Th� i trang s鴆 Ho祅g д]: Ngi ch琲 "..GetName().."D飊g 4 Rng v祅g Th辬h Th� i 1"..tXuanyuanDou[nRoute][nRand][1].." th蕋 b筰, k� hi謚:"..nAddFlag);
			end			
		end
	else
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Ngi kh玭g c� 4 Rng v祅g Th辬h Th�.");
	end		

end

function is_xuanhuang_wuqi(nIdbig,nIdmid,nIdsmall)
	for p,v in tTiandi[4] do
		for a,b in v do
			
			if b[2] == nIdbig and b[3] == nIdmid and b[4] == nIdsmall then
				return 1
			end
			
		end
	end
	return 0
end

function is_xuanhuang_zhuangbei(nIdbig,nIdmid,nIdsmall)
	for p,v in tTiandiZb do
		for a,b in v do
			
			if b[2] == nIdbig and b[3] == nIdmid and b[4] == nIdsmall then
				return 1
			end
			
		end
	end
	
	return 0
end

function about_hhry()
	local strtab = {
		"Huy Ho祅g Chi Th駓, Vinh D� Chi Th駓 th╪g c蕄 th祅h Huy Ho祅g Chi K�, Vinh D� Chi K� (400 Thi猲 Th筩h Tinh Th筩h)/#uplevel_hhry(1)",
		"Huy Ho祅g Chi K�, Vinh D� Chi K� th╪g c蕄 th祅h Huy Ho祅g Qu藅 Kh雐, Vinh D� Qu藅 Kh雐 (400 Thi猲 Th筩h Tinh Th筩h)/#uplevel_hhry(2)",
		"Huy Ho祅g Qu藅 Kh雐, Vinh D� Qu藅 Kh雐 th╪g c蕄 th祅h Huy Ho祅g, Vinh D� (1000 Thi猲 Th筩h Tinh Th筩h1000)/#uplevel_hhry(3)",
		"Xem c竎 thu閏 t輓h c蕄 c馻 huy ho祅g, vinh d� (kh玭g th� mua)/ring_Sale",
		"Kh玭g c� g�!/nothing"
		}
	Say("<color=green>е t� th� r蘮 L璾<color>: Huy ho祅g, vinh d� t鎛g c閚g c� 4 c蕄, ngi c� th� xem c竎 thu閏 t輓h c蕄 c馻 huy ho祅g, vinh d� b猲 di, n誹 mu鑞 th╪g c蕄 t譵 hi觰 n閕 dung 甶!",
		getn(strtab),
		strtab)
end

function ring_Sale()
	Sale(100,100,1);
end 

function uplevel_hhry(nType)
	Say("<color=green>е t� th� r蘮 L璾<color>: Ngi mu鑞 l蕐 <color=yellow>"..tHuihuang[nType][1].." v�"..tRongyao[nType][1].."<color> th╪g c蕄 th祅h <color=yellow>"..tHuihuang[nType+1][1].." v�"..tRongyao[nType+1][1].."<color> kh玭g? C莕 thu th藀 <color=yellow>"..tUplevel[nType][1]..tUplevel[nType][5].." <color>. <color=yellow>Ch� �, mang 2 trang s鴆 mu鑞 th╪g c蕄 l猲 ngi. <color>",
		3,
		"Л頲, ta mu鑞 th╪g c蕄 /#confirm_uplevel_hhry("..nType..")",
		"Xem c竎 thu閏 t輓h c蕄 c馻 huy ho祅g, vinh d� (kh玭g th� mua)/ring_Sale",
		"ьi ch髏, ta mang trang s鴆 l猲 ngi trc/nothing")
end

function confirm_uplevel_hhry(nType)
	if Zgc_pub_goods_add_chk(2,100) ~= 1 then
		return
	end
	local nIdx1 = GetPlayerEquipIndex(4); --第一个首饰索引
	local nIdx2 = GetPlayerEquipIndex(5); --第二个首饰索引
	
	if nIdx1 == 0 or nIdx2 == 0 then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: L蕐 trang s鴆 Huy Ho祅g ngi mu鑞 i c礽 l猲 v� tr� trang s鴆 th� nh蕋, trang s鴆 vinh d� c礽 l猲 v� tr� trang s鴆 th� hai!")
		return
	end
	if GetItemSpecialAttr(nIdx1,"LOCK") == 1 then --锁定判断
		Talk(1,"","V藅 ph萴 ngi t � v� tr� trang s鴆 u ti猲 tr猲 ngi l� v藅 ph萴 kh鉧, m� kh鉧 r錳 i!");
		return
	end
	if GetItemSpecialAttr(nIdx2,"LOCK") == 1 then --锁定判断
		Talk(1,"","V藅 ph萴 ngi t � v� tr� trang s鴆 th� hai tr猲 ngi l� v藅 ph萴 kh鉧, m� kh鉧 r錳 i!");
		return
	end		
	if IsBoxLocking() == 1 then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: в b秓 m c馻 c秈 an to祅, trc khi th╪g c蕄 trang b� h穣 m� kh鉧 rng trc, 產 t�!");
		return
	end	
	local nId1,nId2,nId3 = GetPlayerEquipInfo(4);
	if nId1 ~= tHuihuang[nType][2] or nId2 ~= tHuihuang[nType][3] or nId3 ~= tHuihuang[nType][4] then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: L蕐 trang s鴆 Huy Ho祅g mu鑞 th╪g c蕄 c礽 l猲 v� tr� trang s鴆 th� nh蕋, trang s鴆 vinh d� mu鑞 th╪g c蕄 c礽 l猲 v� tr� trang s鴆 th� hai.");
		return
	end
	local nId4,nId5,nId6 = GetPlayerEquipInfo(5);
	if nId4 ~= tRongyao[nType][2] or nId5 ~= tRongyao[nType][3] or nId6 ~= tRongyao[nType][4] then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: L蕐 trang s鴆 Huy Ho祅g mu鑞 th╪g c蕄 c礽 l猲 v� tr� trang s鴆 th� nh蕋, trang s鴆 vinh d� mu鑞 th╪g c蕄 c礽 l猲 v� tr� trang s鴆 th� hai.");
		return
	end
	if GetItemCount(tUplevel[nType][2],tUplevel[nType][3],tUplevel[nType][4]) < tUplevel[nType][5] then
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Th╪g c蕄 c莕 thu th藀 <color=yellow>"..tUplevel[nType][1]..tUplevel[nType][5].."<color> , ngi kh玭g c� .");
		return
	end
	if DelItem(tUplevel[nType][2],tUplevel[nType][3],tUplevel[nType][4],tUplevel[nType][5]) == 1 then
		if DelItemByIndex(nIdx1,-1) == 1 and DelItemByIndex(nIdx2,-1) == 1 then
			local nAddFlag = AddItem(tHuihuang[nType+1][2],tHuihuang[nType+1][3],tHuihuang[nType+1][4],1,1,-1,-1,-1,-1,-1,-1);
			if nAddFlag == 1 then
				Msg2Player("B筺 t th祅h c玭g "..tHuihuang[nType][1].."T╪g c蕄 th祅h "..tHuihuang[nType+1][1]);
				Msg2Global("Qua t玦 luy謓,"..GetName().." th祅h c玭g m� ti襪 n╪g c馻 "..tHuihuang[nType][1]..", h鉧 th祅h "..tHuihuang[nType+1][1].."!");
				WriteLog("[Huy ho祅g vinh d鵠: Ngi ch琲 "..GetName().." th祅h c玭g 甧m "..tHuihuang[nType][1].."T╪g c蕄 th祅h "..tHuihuang[nType+1][1]);
			else
				WriteLog("[Huy ho祅g vinh d鵠: Ngi ch琲 "..GetName().." 甧m "..tHuihuang[nType][1].."T╪g c蕄 th祅h "..tHuihuang[nType+1][1].." th蕋 b筰, k� hi謚:"..nAddFlag);
			end
			nAddFlag = AddItem(tRongyao[nType+1][2],tRongyao[nType+1][3],tRongyao[nType+1][4],1,1,-1,-1,-1,-1,-1,-1);
			if nAddFlag == 1 then
				Msg2Player("B筺 t th祅h c玭g "..tRongyao[nType][1].."T╪g c蕄 th祅h "..tRongyao[nType+1][1]);
				Msg2Global("Qua t玦 luy謓,"..GetName().." th祅h c玭g m� ti襪 n╪g c馻 "..tRongyao[nType][1]..", h鉧 th祅h "..tRongyao[nType+1][1].."!");
				WriteLog("[Huy ho祅g vinh d鵠: Ngi ch琲 "..GetName().." th祅h c玭g 甧m "..tRongyao[nType][1].."T╪g c蕄 th祅h "..tRongyao[nType+1][1]);
			else
				WriteLog("[Huy ho祅g vinh d鵠: Ngi ch琲 "..GetName().." 甧m "..tRongyao[nType][1].."T╪g c蕄 th祅h "..tRongyao[nType+1][1].." th蕋 b筰, k� hi謚:"..nAddFlag);
			end
		else
			WriteLog("[Huy ho祅g vinh d鵠: Ngi ch琲 "..GetName().."T╪g"..tHuihuang[nType][1]..", kh蕌 tr� trang s鴆 th蕋 b筰.");
		end		
	else
		Talk(1,"","<color=green>е t� th� r蘮 L璾<color>: Th╪g c蕄 c莕 thu th藀 <color=yellow>"..tUplevel[nType][1]..tUplevel[nType][5].."<color> , ngi kh玭g c� .");
	end
end