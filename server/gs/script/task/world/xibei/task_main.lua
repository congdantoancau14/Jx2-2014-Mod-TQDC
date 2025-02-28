-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北区任务过程处理文件
-- By StarryNight
-- 2007/06/06 AM 10:51

-- 我们只有沉默的存在，没有可以贩卖的未来

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\xibei\\xibei_task_award.lua");

Include("\\script\\lib\\globalfunctions.lua");

--解除骷髅王封印的咒语
KULOUWANG_CURSE = {
	[1] = "Nh蕋 vi誸 thi猲 chi, nh� vi誸 a chi, tam vi誸 nh﹏ chi; t� phng thng h�, t� h鱱 ti襫 h藆, xu蕋 y觰 y觰, nh藀 minh minh, h� th莕 b蕋 ph鬰, h� qu� c秏 琻g.",
	[2] = "Nh蕋 vi誸 trng m鬰, nh� vi誸 phi nh�, tam vi誸 th� minh; thi猲 l� chi ngo筰, 萵 vi chi trung, thi猲 o t蕋, nh藅 nguy謙 c﹗, ti猲 s竧 竎 qu�, h藆 tr秏 d� quang.",
	[3] = "Nh蕋 vi誸 m鬰 minh, nh� vi誸 nh� th玭g, tam vi誸 t﹎ tr�; t� ph� l鬰 gi竝, h鱱 v� l鬰 甶nh, thng thi猲 qu�, h� a s竧, gian t� h鉧 kh�, qu� t芻 ti猽 vong."
	}

--封印幻象原型的咒语
HUANXIANG_CURSE = {
	[1] = "Dng ng nhi h祅h, ﹎ ch� nhi t祅g; d� dng ng gi�, c tng sinh d�.  dng chi l鵦 i kh�, b蕋 c c鰑 nh.",
	[2] = "Dng ng nhi xu蕋, ﹎ 萵 nhi nh藀; d� ﹎ t辬h gi�, h譶h tng th祅h d�. D� ﹎ dng th� chi, ch� chi d� xu蕋 nh藀.",
	[3] = "Dng vi詎 chung ﹎, ﹎ c鵦 ph秐 dng; d� dng c莡 ﹎, b祇 d� c d�. D� ﹎ k誸 dng, thi d� l鵦 thu chi."
	}

--西北任务称号
--[对应的配置表副类id] = {"称号名称",对应变量,对应变量值
YIPINGTANG_TITLE = {
	[1] = {"Nh蕋 Ph萴 Л阯g-T﹏ B�",2030,17},
	[2] = {"Nh蕋 Ph萴 Л阯g-Th輈h Kh竎h",2030,34},
	[3] = {"Nh蕋 Ph萴 Л阯g-Phi H�",2031,9},
	[4] = {"Nh蕋 Ph萴 Л阯g-H� D鵦",2031,23},
	[5] = {"Nh蕋 Ph萴 Л阯g-V� V�",2031,52},
	[6] = {"Nh蕋 Ph萴 Л阯g-Gian T�",2031,61},
	[7] = {"謕 秐h k� hi謕",2031,68},
	}

---------------------------------- 西北区01西夏暗涌----------------------------------

--到寇准处领取“西北区01西夏暗涌”任务
function task_001_01_0()

local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
		npc.."G莕 y ta nh薾 頲 tin b竜, T﹜ H� 產ng li猲 h� m藅 thi誸 v韎 nc Li猽. T﹜ H� nh� s竎h lc v╪ tr� v� c玭g c馻 L� Nguy猲 H筼 ng祔 m閠 l韓 m筺h, tuy ngo礽 m苩 th莕 ph鬰 i T鑞g, nh璶g s� th藅  ba nc T鑞g, Li猽, T﹜ H�  h譶h th祅h th� ki襫g ba ch﹏. T﹜ H� trc nay h祅h s� c萵 tr鋘g, l莕 n祔 d竚 c玭g nhi猲 li猲 h� v韎 nc Li猽, e s� b蕋 l頸 cho i T鑞g ta.",
		plr.."T﹜ H� d適 ng� giang s琻 i T鑞g chuy謓  ai c騨g bi誸, nh璶g ng th阨 c騨g r蕋 nghi ng筰 nc Li猽. N誹 b総 tay nhau th� T﹜ H� 頲 l頸 g� ch�?",
		npc.."T﹜ H� c騨g hi觰 r� o l� m玦 h� r╪g l筺h, n猲  ﹎ th莔 甶襲 ng th祅h vi猲 Nh蕋 Ph萴 Л阯g � Trung Nguy猲 i ph� v韎 i T鑞g. N誹 chi誱 頲 Trung Nguy猲 l祄 c╪ c�, T﹜ H� s�  s鴆 i kh竛g v韎 nc Li猽.",
		plr.."N鉯 v藋, T﹜ H� mu鑞 mn tay nc Li猽  chi誱 l穘h th� i T鑞g?",
		}

	TalkEx("task_001_01_0_1",strTalk);

end;

--续对话
function task_001_01_0_1()

local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."R蕋 c� th�. � T﹜ H� ph輆 t﹜ H� T﹜ T萿 Lang l� v飊g hoang m筩 r閚g l韓, n猲 ch髇g r蕋 th蘭 mu鑞 c竎 m秐h t m祏 m�. Qu﹏ i i T鑞g hi謓 產ng t藀 trung chi課 l鵦 � Nh筺 M玭 Quan nh qu﹏ Li猽, mai n祔 総 s� r琲 v祇 th� g鋘g k譵, hai m苩 gi竝 ch.",
	plr.."H祅h ng c馻 T﹜ H� th藅 hi觤 竎, T﹜ H� v鑞 quen h祅h ng ng莔, nay l筰  th玭g tin b� r� r� th� th藅 ng nghi. Kh蕌 i nh﹏, kh玭g bi誸 ta c� th� gi髉 頲 g� cho 玭g?",
	npc.."<sex> trung qu﹏ 竔 qu鑓, l� rng c閠 c馻 i T鑞g ta. Nh璶g ch� v韎 s鴆 c馻 m閠 m譶h <sex>, e l� kh玭g  v� c騨g r蕋 nguy hi觤. Trng Ca M玭 総  n緈 th玭g tin v� ng th竔 c馻 T﹜ H�, ngi h穣 t韎 g苝 B竎h Hi觰 Sinh � Bi謓 Kinh, h醝 xem Trng Ca M玭 c� ng � gi髉 甶襲 tra vi謈 n祔. S� vi謈 li猲 quan n an nguy c馻 i T鑞g, ngi h穣 kh雐 h祅h ngay.",
	plr.."C� s� tr� gi髉 c馻 Trng Ca M玭, ta 総 s� 甶襲 ra r� ng鋘 ng祅h."
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,1);
	TaskTip("Nh薾 駓 th竎 c馻 Kh蕌 Chu萵, n Bi謓 Kinh t譵 B竎h Hi觰 Sinh nh� gi髉 .");
	Msg2Player("Nh薾 駓 th竎 c馻 Kh蕌 Chu萵, n Bi謓 Kinh t譵 B竎h Hi觰 Sinh nh� gi髉 .");

end

--找百晓生之前与寇准对话
function task_001_01_1()

local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."<sex> trung qu﹏ 竔 qu鑓, l� rng c閠 c馻 i T鑞g ta. Nh璶g ch� v韎 s鴆 c馻 m閠 m譶h <sex>, e l� kh玭g  v� c騨g r蕋 nguy hi觤. Trng Ca M玭 総  n緈 th玭g tin v� ng th竔 c馻 T﹜ H�, ngi h穣 t韎 g苝 B竎h Hi觰 Sinh � Bi謓 Kinh, h醝 xem Trng Ca M玭 c� ng � gi髉 甶襲 tra vi謈 n祔. S� vi謈 li猲 quan n an nguy c馻 i T鑞g, ngi h穣 kh雐 h祅h ngay.",
	plr.."C� s� tr� gi髉 c馻 Trng Ca M玭, ta 総 s� 甶襲 ra r� ng鋘 ng祅h."
	}

	TalkEx("",strTalk);

end

--与百晓生对话
function task_001_02_0()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."<sex> 竛h m総 ho秐g h鑤... kh玭g bi誸 c� chuy謓 g�?",
	plr.."T筰 h� bi誸 頲 th玭g tin t� Kh蕌 Chu萵, T﹜ H� g莕 y nhi襲 l莕 b� m藅 li猲 h� v韎 Li猽 Qu鑓, h譶h nh� d� nh li猲 minh x﹎ lc T鑞g, n誹 l� th藅 th� Чi T鑞g s� b� t蕁 c玭g t� hai ph輆, giang s琻 s� g苝 nguy c� trong m閠 s韒 m閠 chi襲.",
	npc.."Chuy謓 n祔 Trng Ca M玭 ta c騨g c� nghe qua, v� � Ph鬾g Tng d� th竚 頲 c� ngi T﹜ H� 產ng 萵 n蕄, T﹜ H� h祅h s� b� m藅 th薾 tr鋘g, nh璶g ta c騨g kh玭g 畂竛 頲 ch髇g l筰 ﹎ m璾 v韎 Li猽 Qu鑓, c� �  qu蕐 r鑙.",
	plr.."T﹜ H� l莕 n祔 nghi ng� b� tr�, t筰 h� s� m譶h c� th� kh玭g th� 鴑g ph�. Kh玭g bi誸 Trng Ca M玭 c� th� gi髉  甶襲 tra kh玭g?",
	npc.."Чi T鑞g g苝 n筺, Trng Ca M玭 ta l� n祇 l筰 ng錳 y猲 sao? <sex> l遪g y nhi謙 huy誸, anh h飊g thi誹 n猲, b竎h Hi觰 Sinh ta r蕋 ngng m�, thi誹 hi謕 an t﹎, Trng Ca M玭 ta nh蕋 nh s� gi髉.  Dng H鋋 產ng � Ph鬾g Tng, <sex> mang ch� th� c馻 ta n ch� 玭g ta,   Dng H鋋 l藀 t鴆 b総 u 甶襲 tra chuy謓 n祔, s� kh玭g c� sai s鉻.",
	plr.." t� B竎h Hi觰 Sinh ti襫 b鑙, t筰 h� l猲 阯g y."
	}

	SetTask(TASK_XB_ID,2);
	TalkEx("",strTalk);
	TaskTip("B竎h Hi觰 Sinh nh� b筺 mang ch� th� c馻 Trng Ca M玭 n cho  Dng H鋋 � Ph鬾g Tng.");
	Msg2Player("B竎h Hi觰 Sinh nh� b筺 mang ch� th� c馻 Trng Ca M玭 n cho  Dng H鋋 � Ph鬾g Tng.");
	GivePlayerAward("Award_XB_01","Easy");
	GivePlayerExp(SkeyXibei,"xixiafengbo")
end

--与欧阳画对话前与百晓生对话
function task_001_02_1()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.." Dng H鋋 產ng � Ph鬾g Tng, mau 甶 t譵 玭g ta."
	}

	TalkEx("",strTalk);

end

--与欧阳画对话帮忙取女装衣服
function task_001_03_0()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."Xem tranh m� n� c馻 ta. <sex> c� th蕐 tuy謙 v阨 kh玭g, c� th� l� si猽 ph萴 kh玭g?",
	plr.."Ph秈卲h秈卼h藅 l� p�.",
	npc.."Ha ha ha, tuy謙 tuy謙, xem ra <sex> l� ngi hi觰 tranh,  Dng H鋋 ta b譶h sinh gh衪 nh蕋 l� ngi kh玭g hi觰 tranh! Ta lu玭 a thi誹 n� T鑞g v祇 tranh, thi誹 n� Чi T鑞g nh� nh緉 d辵 d祅g, v祇 trong tranh l筰 c祅g quy課 r�",
	plr.." Dng ti襫 b鑙 n鉯 c� l�.(H鉧 ra 玭g ta ch輓h l�  Dng H鋋�.) ng r錳 ti襫 b鑙�.",
	npc.."Kh玭g sai kh玭g sai, l莕 n祔 ta n T﹜ V鵦, mu鑞 t譵 hi觰 v� phong t譶h c馻 m� n� T﹜ V鵦. Nghe n鉯 thi誹 n� T﹜ V鵦 t輓h kh� n鉵g n秠, n誹 a h� v祇 tranh, e r籲g c騨g kh玭g t 頲 � mu鑞. Nh璶g v� kh玭g th� hi謓 頲, th� kh玭g ph秈 ng ti誧 sao?",
	plr.."( Dng H鋋�.ng l� k� danh th輈h v�) ti襫 b鑙�..",
	}


	SetTask(TASK_XB_ID,3);
	TalkEx("task_001_03_0_1",strTalk);
	TaskTip("дn B綾 Ph鬾g Tng l蕐 m閠 b� y ph鬰 t� ngi n b� T﹜ V鵦 v� ngi p Ba T�. ");
	Msg2Player("дn B綾 Ph鬾g Tng l蕐 m閠 b� y ph鬰 t� ngi n b� T﹜ V鵦 v� ngi p Ba T�. ");
	CreateTrigger(0,1220,KILL_XB_BOSIYAOJI);
	CreateTrigger(0,1221,KILL_XB_XIYUHANFU);
	GivePlayerExp(SkeyXibei,"fengxiang")
end

-- 续对话
function task_001_03_0_1()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."�, c� c竎h r錳. Hi謓 gi� tuy kh玭g c� ngi th藅, nh璶g ph鬰 s鴆 c馻 thi誹 n� T﹜ V鵦 di猰 d骯 phong t譶h, m祏 s綾 c o, 頲 xem m閠 l莕 th� phong c竎h t� nhi猲 s� 頲 l錸g v祇 tranh, v藋 c騨g th醓 l遪g.",
	plr.."Nh璶g ti襫 b鑙�..",
	npc.."<sex> l� ngi hi觰 tranh, ph秈 bi誸 r籲g c秏 x骳 lu玭 d﹏g tr祇. Ch髇g ta chia nhau l祄, ta 甶 m礽 m鵦, ngi n ph輆 B綾 th祅h l蕐 b� y ph鬰 c馻 ngi p Ba T� v� ngi n b� T﹜ V鵦, ta s� v� n猲 b鴆 tranh giai nh﹏ tuy謙 p. ",
	plr.."V藋厖",
	npc.."Mau 甶 甶, c秏 x骳 s� tan bi課 m蕋, c� th� a thi誹 n� T﹜ V鵦 v祇 tranh l� m閠 ni襪 vui i v韎 ta.",
	plr.."� (xem ra ch� c莕 th醓 m穘 ni襪 ao c c馻 玭g ta , r錳 t輓h sau)",
	}

	TalkEx("",strTalk);

end

--带回或未带回女装给欧阳画
function task_001_04_0()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {};

	--带回女装
	if GetItemCount(2,0,686) >= 1 and GetItemCount(2,0,687) >= 1 then
		strTalk = {
			plr.." Dng ti襫 b鑙, y l�  玭g c莕.",
			npc.."Tuy謙, thi誹 n� T﹜ V鵦 qu� nhi猲 l� kh竎 v韎 thi誹 n� Trung nguy猲, th� hi謓 頲 v� p, c� � ngh躠 c� � ngh躠. �, ng r錳, <sex> t譵 ta c� vi謈 g�?",
			plr.."(Cu鑙 c飊g c騨g nh� n ta) Ti襫 b鑙 c� ph秈 l� ngi c馻 Trng Ca M玭? C� ph竧 hi謓 h祅h tung g莕 y c馻 T﹜ H� kh玭g?",
			npc.."Kh玭g sai, ta l�  Dng H鋋 m閠 trong nh鱪g c莔, k�, thi, h鋋 c馻 Trng Ca M玭, <sex> l祄 sao bi誸 頲? G莕 y ta c騨g ph竧 hi謓 s� xu蕋 hi謓 c馻 ngi T﹜ H� � Long M玭 tr蕁 ng祔 c祅g nhi襲.",
			plr.."Qu� nhi猲 l� v藋. T玦 c遪 bi誸 T﹜ H� b� m藅 li猲 h� v韎 Li猽 Qu鑓, s� qu蕐 r鑙 n Чi T鑞g ta, B竎h Hi觰 Sinh ti襫 b鑙 nh� 玭g 甶襲 tra chuy謓 n祔, y l� th� ch� th� c馻 qu� m玭 ph竔.",
			npc.."(xem xong th�) 竔 d�, chuy謓 i s� n祔 li猲 quan n giang s琻 x� t綾 c馻 Чi T鑞g, sao ngi kh玭g n鉯 s韒?",
			plr.."�.V穘 b鑙 mu鑞 n鉯 s韒, nh璶g ti襫 b鑙 l筰 g蕄 r髏 v� tranh.",
			}
		TalkEx("task_001_04_0_1",strTalk);

	--没有带回女装；补发任务触发器
	else
		strTalk = {
			"Ngi p Ba T� v� ngi n b� T﹜ V鵦 � B綾 Ph鬾g Tng, gi髉 ta l蕐 b� y ph鬰 c馻 h�, ta 甶 m礽 m鵦."
			}
		if	GetTrigger(KILL_XB_BOSIYAOJI) == 0 or GetTrigger(KILL_XB_XIYUHANFU) == 0 then
			CreateTrigger(0,1220,KILL_XB_BOSIYAOJI);
			CreateTrigger(0,1221,KILL_XB_XIYUHANFU);
			TaskTip("дn B綾 Ph鬾g Tng l蕐 m閠 b� y ph鬰 t� ngi n b� T﹜ V鵦 v� ngi p Ba T�. ");
			Msg2Player("дn B綾 Ph鬾g Tng l蕐 m閠 b� y ph鬰 t� ngi n b� T﹜ V鵦 v� ngi p Ba T�. ");
		end

		TalkEx("",strTalk);
	end
end

-- 续对话
function task_001_04_0_1()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."Chuy謓 g蕄 v藋, c遪 v� tranh �? <sex> g竎 v� tranh qua m閠 b猲, i l祄 xong chuy謓 n祔 , ta s� c飊g v韎 ngi thng l穖. ",
	plr.."Ph秈, ph秈卼heo l阨 ti襫 b鑙, h譶h nh� ngi T﹜ H� t� t藀 � g莕 Long M玭 tr蕁?",
	npc.."Kh玭g sai, g莕 Long M玭 tr蕁 g莕 y c� s� xu蕋 hi謓 c馻 ngi T﹜ H�, ta nghi ng� l� Nh蕋 Ph萴 Л阯g M藅 S� 產ng ho箃 ng. T﹜ H� h祅h s� r蕋 b� m藅, Nh蕋 Ph萴 Л阯g c祅g  h蘮 qu竔 n, b蕋 ng� xu蕋 hi謓 � Long M玭 tr蕁, nh蕋 nh l� c� ﹎ m璾.",
	plr.."Ch輓h x竎 l� v藋, tuy T﹜ H� l莕 n祔 h祅h ng v韎 t竎 phong h綾 o, nh璶g ﹎ m璾 li猲 k誸 v韎 Li猽 Qu鑓  b� l�, qu� th藅 khi課 ngi ta ph秈 lo ngh�. T玦 mu鑞 甶 Long M玭 tr蕁 th╩ d� m閠 chuy課. Ti襫 b鑙 c� th� cho t玦 bi誸 Long M玭 tr蕁 � u kh玭g?",
	npc.."L遪g y猽 nc c馻 <sex> v� l遪g y猽 h閕 h鋋 c馻 ta l� nh� nhau, tuy謙 l緈. Long M玭 tr蕁 l� m閠 th� tr蕁 nh� � ph輆 T﹜, ra kh醝 T﹜ th祅h l� th蕐, ph秈 c萵 th薾, ta i tin nh�!",
	}

	TalkEx("",strTalk);
	DelItem(2,0,686,1);
	DelItem(2,0,687,1);
	RemoveTrigger(GetTrigger(KILL_XB_BOSIYAOJI));
	RemoveTrigger(GetTrigger(KILL_XB_XIYUHANFU));
	SetTask(TASK_XB_ID,4);
	CreateTrigger(0,1222,KILL_XB_YIPINTANGMISHI);
	TaskTip("дn Long M玭 tr蕁 甶襲 tra xem c� h祅h tung c馻 nh﹏ s� Nh蕋 Ph萴 Л阯g kh玭g, xem c� th� thu 頲 ch鴑g c� n祇 kh玭g.");
	Msg2Player("дn Long M玭 tr蕁 甶襲 tra xem c� h祅h tung c馻 nh﹏ s� Nh蕋 Ph萴 Л阯g kh玭g, xem c� th� thu 頲 ch鴑g c� n祇 kh玭g.");
	GivePlayerAward("Award_XB_02","Easy");
	GivePlayerExp(SkeyXibei,"bosihua")
end

--带回或未带回一品堂令牌给欧阳画
function task_001_05_0()

local strTalk = {};
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
	--带回一品堂令牌
	if GetItemCount(2,0,688) >= 1 then
		strTalk = {
			plr.."Ho祅g Sa c騨g c� th� i 頲 v祅g, ti襫 b鑙, t筰 h�  t譵 頲 Nh蕋 Ph萴 Л阯g l謓h b礽 tr猲 ngi h�.",
			npc.."Kh玭g ngo礽 d� ki課, qu� th鵦 l� ngi c馻 T﹜ H� Nh蕋 Ph萴 Л阯g, Nh蕋 Ph萴 Л阯g M藅 S� chuy猲 thu th藀 t譶h b竜 trong ﹎ th莔. T﹜ H� th� 畂筺 gian x秓, h祅h tung b� 萵, l莕 n祔 l筰 甶襲 ng Nh蕋 Ph萴 Л阯g tr� tr閚 Long M玭 tr蕁, ngo礽 l衝 g苝 Li猽 Qu鑓 ra ch� e c遪 c� 萵 t譶h kh竎.",
			plr.."� ti襫 b鑙 T﹜ H� l衝 g苝 Li猽 Qu鑓 ch� l� c竔 c�? Trong  c遪 c� ﹎ m璾 kh竎?",
			npc.."с ch� l� d� 畂竛 ban u, Nh蕋 Ph萴 Л阯g v蒼 l� c� c蕌 gi竛 甶謕 c bi謙 c馻 T﹜ H�, trc   tr� tr閚 v祇 Чi T鑞g 竚 s竧 nh﹏ s� v� l﹎ v� mua chu閏 quan li猽 Чi T鑞g, nguy h筰 kh玭g th� t輓h h誸. L衝 g苝 Li猽 Qu鑓 e c騨g l� s� th藅.",
			plr.."T﹜ H� Nh蕋 Ph萴 Л阯g g﹜ h鋋 v� l﹎, t� l﹗  l� i ch c馻 v� l﹎. Ch糿g hay Nh蕋 Ph萴 Л阯g M藅 S�  d� th竚 頲 g� ch璦?",
			npc.."Ta c騨g mu鑞 t譵 hi觰 r�, r鑤 cu閏 Nh蕋 Ph萴 Л阯g b祔 nghi binh l� c� � g�. ng r錳, m藅 th竚 T玭 Nh� Li詎 ta ph竔 甶 hi謓 � Long M玭 tr蕁, kh玭g bi誸 h緉 c� ph竧 hi謓 g� m韎 kh玭g?",
			plr.."V藋  t筰 h� 甶 Long M玭 tr蕁 m閠 chuy課, hy v鋘g c� th� thu th藀 th猰 tin t鴆.",
			}
		TalkEx("",strTalk);
		DelItem(2,0,688,1);
		SetTask(TASK_XB_ID,5);
		TaskTip(" Dng H鋋 nh� b筺 n Long M玭 tr蕁 t譵 m藅 th竚 T玭 Nh� Li詎 t譵 hi觰 h祅h ng Nh蕋 Ph萴 Л阯g.");
		Msg2Player(" Dng H鋋 nh� b筺 n Long M玭 tr蕁 t譵 m藅 th竚 T玭 Nh� Li詎 t譵 hi觰 h祅h ng Nh蕋 Ph萴 Л阯g.");
	 	RemoveTrigger(GetTrigger(KILL_XB_YIPINTANGMISHI));
	 	GivePlayerAward("Award_XB_03","Easy");
	 	GivePlayerExp(SkeyXibei,"yipintang")
	--没有带回一品堂令牌；补发任务触发器
	else
		strTalk = {
			"Ta ng� r籲g ho箃 ng g莕 y � Long M玭 tr蕁 l� Nh蕋 Ph萴 Л阯g M藅 S�, ngi 甶 thu th藀 v礽 ch鴑g c�, ra kh醝 T﹜ V鵦 l� c� th� th蕐 Long M玭 tr蕁, <sex> h穣 c萵 th薾."
			}
		if	GetTrigger(KILL_XB_YIPINTANGMISHI) == 0 then
			CreateTrigger(0,1222,KILL_XB_YIPINTANGMISHI);
			TaskTip("дn Long M玭 tr蕁 甶襲 tra xem c� h祅h tung c馻 nh﹏ s� Nh蕋 Ph萴 Л阯g kh玭g, xem c� th� thu 頲 ch鴑g c� n祇 kh玭g.");
			Msg2Player("дn Long M玭 tr蕁 甶襲 tra xem c� h祅h tung c馻 nh﹏ s� Nh蕋 Ph萴 Л阯g kh玭g, xem c� th� thu 頲 ch鴑g c� n祇 kh玭g.");
		end

		TalkEx("",strTalk);
	end

end

--未找孙二琏与欧阳画对话
function task_001_05_1()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."T玭 Nh� Li詎 頲 ph竔 n qu竛 tr� Long M玭 � Long M玭 tr蕁  thu th藀 t譶h b竜, h緉 nh蕋 nh c� th猰 th玭g tin."
	}

	TalkEx("",strTalk);

end

---------------------------------- 西北区02情困客栈----------------------------------

--与孙二琏对话开始任务
function task_002_01_0()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	plr.."Зy c� ph秈 l� T玭 Nh� Li猲 ti猲 sinh kh玭g?",
	npc.."(H琲 ru n錸g n芻) N祔厖匱譶h l� g� m� khi課 l遪g ngi 甶猲 o..., ti觰 nh�, mang th猰 m閠 b譶h n� nhi h錸g厖厖",
	plr.."Th璦 ti猲 sinh?",
	npc.."(b蕋 t豱h nh﹏ s�)厖厖",
	plr.."厖 (ph秈 t譵 c竎h nh th鴆 玭g ta d藋, kh竎h s筺 l� n琲 u鑞g ru, kh竎h say x豱 l� chuy謓 b譶h thng, ti觰 nh� h穣 a Thu鑓 t豱h ru)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,6);
	TaskTip("T譵 ti觰 nh� mua thu鑓 t豱h ru cho T玭 Nh� Li猲 u鑞g  t豱h ru.");
	Msg2Player("T譵 ti觰 nh� mua thu鑓 t豱h ru cho T玭 Nh� Li猲 u鑞g  t豱h ru.");
	GivePlayerExp(SkeyXibei,"longmenkezhan")
end

--未与店小二对话
function task_002_01_1()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."(say n b蕋 t豱h nh﹏ s�)厖�",
	plr.."(Kh竎h s筺 l� n琲 u鑞g ru, kh竎h say x豱 l� chuy謓 b譶h thng, Ti觰 nh� h穣 a Thu鑓 t豱h ru)"
	}

	TalkEx("",strTalk);

end

--与店小二对话索取醒酒药
function task_002_02_0()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."Kh竎h quan ngh� tr� hay ╪ c琺?",
	plr.."Ta mu鑞 h醝 ngi c� Thu鑓 t豱h ru kh玭g?",
	npc.."C�, nh璶g th藅 kh玭g may, m蕐 h玬 trc  b竛 cho T﹜ B綾 tr竛g s� r錳, n鉯 r籲g mu鑞 thi u鑞g ru.",
	plr.."C� chuy謓 n祔 �? Ngi c� bi誸 ngi say ru kia kh玭g? g ta say bao l﹗ r錳?",
	npc.."V� kh竎h quan  �? D� nhi猲 l� bi誸, � y 頲 m蕐 ng祔 r錳, u鑞g r錳 ng�, ng� r錳 u鑞g, l莕 n祔 v鮝 m韎 say, B筺 mua Thu鑓 t豱h ru  l祄 玭g ta t豱h �? T玦 th蕐 Thu鑓 t豱h ru c騨g ph秈 t╪g th猰 lng, kho秐g 10 甶觤.",
	plr.."Nh璶g b﹜ gi� ngi kh玭g c� h祅g, c� 甶 t譵 c騨g m蕋 th阨 gian. V� T﹜ B綾 tr竛g s� kia 甶 v� hng n祇?",
	npc.."N鉯 l� t藀 h頿 t筰 nam Ph鬾g Tng ph�. T玦 th蕐 nh鱪g tr竛g s�  th﹏ h譶h v筸 v�, s綾 kh� ng ng, n誹 kh竎h quanh mu鑞 mua thu鑓, h穣 n t譵 � n琲 kh竎, ng ch鋍 gi薾 h�.",
	plr.." t� ti觰 nh� ca quan t﹎, nh璶g ta ph秈 xin h� 輙 thu鑓, kh玭g ch鋍 h� gi薾 u.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,7);
	CreateTrigger(0,1223,KILL_XB_XIBEIZHUANGHAN);
	TaskTip("дn ph� nam t譵 T﹜ B綾 tr竛g s� l蕐 10 甶觤 thu鑓 t豱h ru a cho ti觰 nh�,  anh ta l祄 T玭 Nh� Li猲 t豱h l筰.");
	Msg2Player("дn ph� nam t譵 T﹜ B綾 tr竛g s� l蕐 10 甶觤 thu鑓 t豱h ru a cho ti觰 nh�,  anh ta l祄 T玭 Nh� Li猲 t豱h l筰.");
	GivePlayerExp(SkeyXibei,"mizui")
end

--取得或未取得醒酒药与店小二对话
function task_002_03_0()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {};

	--带回醒酒药
	if GetItemCount(2,0,689) >= 10 then
		strTalk = {
			plr.."ng l�, c� � y say x豱, n誹 say n tr╩ n╩ nh� ngi x璦, khi t豱h d藋  b� l� m鋓 chuy謓! Ti觰 nh� ca, h穣 cho anh ta u鑞g thu鑓 甶.",
			npc.."Л頲, u鑞g bao nhi猽 y ch綾 s� t豱h.",
			"厖厖"
			}
		TalkEx("",strTalk);
		DelItem(2,0,689,10);
		SetTask(TASK_XB_ID,8);
		TaskTip("Х sai ti觰 nh� cho T玭 Nh� Li猲 u鑞g thu鑓 t豱h ru, h穣 xem anh ta t豱h ch璦.");
		Msg2Player("Х sai ti觰 nh� cho T玭 Nh� Li猲 u鑞g thu鑓 t豱h ru, h穣 xem anh ta t豱h ch璦.");
	 	RemoveTrigger(GetTrigger(KILL_XB_XIBEIZHUANGHAN));
	 	GivePlayerAward("Award_XB_04","Easy");
	 	GivePlayerExp(SkeyXibei,"xingjiuyao")
	--没有带回醒酒药；补发任务触发器
	else
		strTalk = {
			"T﹜ B綾 tr竛g s� kia t藀 h頿 t筰 nam Ph鬾g Tng ph�, kh竎h quan g苝 h� ph秈 c萵 th薾."
			}
		if	GetTrigger(KILL_XB_XIBEIZHUANGHAN) == 0 then
			CreateTrigger(0,1223,KILL_XB_XIBEIZHUANGHAN);
			TaskTip("T譵 ti觰 nh� mua thu鑓 t豱h ru cho T玭 Nh� Li猲 u鑞g  t豱h ru.");
			Msg2Player("T譵 ti觰 nh� mua thu鑓 t豱h ru cho T玭 Nh� Li猲 u鑞g  t豱h ru.");
		end

		TalkEx("",strTalk);
	end

end

--送服醒酒药后尚未与孙二琏对话
function task_002_03_1()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."T筰 h�  cho T玭 Nh� gia u鑞g thu鑓 t豱h ru, ch綾 c騨g  t豱h l筰 r錳, <sex> h穣 甶 g苝 anh ta.",
	plr.."V蕋 v� cho ti觰 nh� ca qu�.",
	}

	TalkEx("",strTalk);

end

--送服醒酒药后与孙二琏对话
function task_002_04_0()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."厖厖 N� nhi h錸g, n� nhi p, n� nhi d辵 d祅g nh� Th藀 Tam Mu閕厖 Th藀 Tam Mu閕, Th藀 Tam Mu閕, sao l筰 tuy謙 t譶h, khi課 ta 產u l遪g厖",
	plr.."(c� v� t豱h d藋 l筰 l萵 th萵 h琻, Th藀 Tam Mu閕 l� ai?)",
	npc.."Th藀 Tam Mu閚厖",
	plr.."(Xem ra  m綾 b謓h tng t� r錳,  v藋 l筰 c遪 u鑞g ru, c� u鑞g thu鑓 t豱h ru c騨g v� 輈h)",
	npc.."Th藀 Tam Mu閕, nh譶 ta 甶, c� ph秈 ch誸 v� n祅g ta c騨g cam l遪g厖 Th藀 Tam Mu閕 厖 Nc ch秠 hoa tr玦, n祅g b猲 t﹜ ta b猲 ng厖",
	plr.."(N鉯 c﹗ n祔 kh玭g bi誸 bao nhi猽 l莕, h穣 h醝 Ti觰 nh� xem sao)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,9);
	TaskTip("H穣 h醝 ti觰 nh� xem T玭 Nh� Li猲 b� g�.");
	Msg2Player("H穣 h醝 ti觰 nh� xem T玭 Nh� Li猲 b� g�.");
end

--送服醒酒药后未取得肚兜前与孙二琏对话
function task_002_04_1()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."Th藀 Tam Mu閕, tim ta厖",
	plr.."(N鉯 c﹗ n祔 kh玭g bi誸 bao nhi猽 l莕, h穣 h醝 Ti觰 nh� xem sao)",
	}

	TalkEx("",strTalk);

end

--与店小二对话询问十三娘一事
function task_002_05_0()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."V� T玭 kh竎h quan kia  t豱h r錳 �?",
	plr.."T豱h ch髏 nh, nh璶g kh玭g t豱h h糿, c� l秏 nh秏 kh玭g bi誸 bao nhi猽 l莕, 玦 d祇, thu鑓 kia kh玭g c� t竎 d鬾g r錳. Ngi n鉯 xem anh ta  ngi ra l﹗ r錳, su鑤 ng祔 say x豱, l� v� chuy謓 g�? Th藀 Tam Mu閕  anh ta n鉯 n l� ai?",
	npc.."Kh竎h quan kh玭g bi誸 r錳. Th藀 Tam Mu閕 anh ta n鉯 n l� Xu﹏ Th藀 Tam Nng ch� qu竛 n祔, n祅g 蕐 l� i m� nh﹏ n鎖 ti課g t筰 Long M玭 tr蕁, r蕋 xinh p, b鋘 n 玭g trong tr蕁 nh譶 th蕐 n祅g kh玭g ai kh玭g h錸 si猽 ph竎h l筩, ch秠 nc d穒 r遪g r遪g.",
	plr.."Ch糿g tr竎h anh h飊g nh魌 ch�, th� ra l� g苝 m� nh﹏.",
	npc.."ng v藋, T玭 kh竎h quan c遪 kh� h琻, v鮝 th蕐 n� ch� qu竛 ch髇g t玦  m蕋 h錸, su鑤 ng祔 l秈 nh秈 揟h藀 Tam Mu閕 � lu玭 mi謓g, ti誧 l� n祅g 蕐 kh玭g  m総 n anh ta.",
	}

	TalkEx("task_002_05_0_1",strTalk);

end

-- 续对话
function task_002_05_0_1()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	plr..", h錸g nhan g﹜ h鋋. Nh� v藋 xem ra anh ta  m� Xu﹏ Th藀 Tam Nng n m� ngi r錳.",
	npc.."ng v藋, t� khi g苝 n� ch� qu竛 c馻 ch髇g t玦, anh ta ng祔 n祇 c騨g n u鑞g ru, say r錳 ng�, t豱h d藋 l筰 u鑞g, mi謓g l骳 n祇 c騨g l秏 nh秏, kh玭g ng﹎ th� c騨g g鋓 t猲 n� ch� qu竛 c馻 ch髇g t玦.",
	plr..", ru tng t� d� u鑞g kh玭g d� t豱h, ti觰 nh� ca, d飊g th猰 thu鑓 t豱h ru n鱝 頲 kh玭g?",
	npc.."Kh玭g 頲, kh玭g 頲, thu鑓 n祔 kh玭g 頲 u鑞g nhi襲, t� anh t豱h l筰 m韎 頲.",
	plr.."匳藋 th� th玦, 產 t� ti觰 nh� ca. ",
	plr.."(Anh ta g鋓 t猲 Xu﹏ Th藀 Tam Nng kh玭g th玦, xem ra l� y猽 n phng r錳, ch綾 ph秈 quay v� t譵  Dng ti襫 b鑙 thng lng)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,10);
	TaskTip(" h醝  Dng H鋋, b謓h tng t� c馻 T玭 Nh� Li猲 ph秈 ch鱝 th� n祇.");
	Msg2Player(" h醝  Dng H鋋, b謓h tng t� c馻 T玭 Nh� Li猲 ph秈 ch鱝 th� n祇.");
	GivePlayerAward("Award_XB_05","Easy");
	GivePlayerExp(SkeyXibei,"wujikeshi")
end

--未与欧阳画对话前与店小二对话
function task_002_05_1()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	plr.."Thu鑓 n祔 kh玭g 頲 u鑞g nhi襲, kh玭g 頲 u鑞g n鱝, h穣  anh ta t� t豱h l筰.",
	plr.."(Anh ta g鋓 t猲 Xu﹏ Th藀 Tam Nng kh玭g th玦, xem ra l� y猽 n phng r錳, ch綾 ph秈 quay v� t譵  Dng ti襫 b鑙 thng lng)",
	}

	TalkEx("",strTalk);

end

---------------------------------- 西北区03春十三娘----------------------------------
--与欧阳画对话询问如何医治孙二琏的相思病
function task_003_01_0()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."<sex> v� r錳, c� t譵 頲 T玭 Nh� Li猲 kh玭g?",
	plr.."T譵 頲 T玭 Nh� Li猲 r錳, nh璶g anh ta say ru ch璦 t豱h l筰, nghe n鉯 anh ta  m� Xu﹏ Th藀 Tam Nng � qu竛 tr� Long m玭, nh璶g ngi ta kh玭g m x豠 g� n anh ta. Anh ta  m綾 b謓h tng t�, su鑤 ng祔 mn ru gi秈 s莡 t筰 kh竎h s筺. L骳 ta t譵 th蕐, anh ta  b蕋 t豱h nh﹏ s�, u鑞g thu鑓 t豱h ru r錳 nh璶g c騨g v� 輈h.",
	npc.."Ai da, tham t鰑 s綾, l祄 sao kh玭g l� vi謈 cho 頲! V韎 m� nh﹏, ch� 頲 nh譶 xa kh玭g 頲 nh譶 g莕. T玭 Nh� Li猲 n祔  r琲 v祇 li t譶h, ru kh玭g say m� l� say ngi, l祄 g� c� thu鑓 l祄 cho t豱h l筰?",
	plr.."ng v藋, c� c竎h n祇 l祄 anh ta t豱h l筰 kh玭g?",
	npc.."Tr� b謓h ph秈 t譵 ra g鑓 b謓h, g鑓 b謓h c馻 T玭 Nh� Li猲 l� Xu﹏ Th藀 Tam Nng, y猽 m� kh玭g 頲 p l筰. M綾 b謓h tng t� n祔 l祄 sao kh玭g h錸 si猽 ph竎h l筩 cho 頲! Ch� c� th� b総 u t� ngi 頲 y猽, ngi bi誸 Xu﹏ Th藀 Tam Nng b﹜ gi� � u kh玭g?",
	plr.."Ti襫 b鑙 n鉯 ch� ph秈, n誹 t譵 頲 Th藀 Tam Nng, n鉯 n祅g ta g苝 T玭 Nh� Li猲 c� 頲 kh玭g?",
	}

	TalkEx("task_003_01_0_1",strTalk);

end

-- 续对话
function task_003_01_0_1()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."Nh璶g nh� l阨 ngi n鉯, d� c� t譵 頲 Xu﹏ Th藀 Tam Nng, e r籲g n祅g ta c騨g kh玭g mu鑞 g苝 T玭 Nh� Li猲, n祅g ta v鑞 kh玭g 璦 T玭 Nh� Li猲, t譵 n祅g ta c騨g ch糿g 輈h g�.",
	plr.."Kh玭g sai, chuy謓 t譶h c秏 kh玭g th� mi詎 cng. V藋 n誹 c� c竎h l祄 cho T玭 Nh� Li猲 c秏 th蕐 Xu﹏ Th藀 Tam Nng quan t﹎ n anh ta, kh玭g ch鮪g anh ta s� t豱h l筰.",
	npc.."ng, ng, tuy kh玭g m阨 頲 Xu﹏ Th藀 Tam Nng, n誹 l蕐 頲 輙  c馻 n祅g ta, r錳 a cho T玭 Nh� Li猲, ch綾 ch緉 anh ta s� cho r籲g Xu﹏ Th藀 Tam Nng quan t﹎ n m譶h, anh ta s� ph蕁 ch蕁, kh玭g c遪 s莡 kh� n鱝, ch綾 s� t豱h ru.",
	plr.."Nh璶g l蕐  c馻 con g竔 nh� ngi ta li謚 c� th蕋 l� kh玭g?",
	npc.."H�, giang h� nhi n� kh玭g quan t﹎ chuy謓 nh� nh苩, l祄 sao  � chuy謓 n祔? \'x璦 nay h錸g nhan thng g﹜ h鋋, x璦 nay anh h飊g kh鑙 ngi ph秈 l魕 m譶h.� Nh璶g h錸g nhan p nh� tranh qu� l� thng ph萴, ng ti誧, ng ti誧.",
	}

	SetTask(TASK_XB_ID,11);
	TaskTip("Quay l筰 Long M玭 Tr蕁 t譵 ti觰 nh� h醝 t玭g t輈h c馻 b� ch� qu竛.");
	Msg2Player("Quay l筰 Long M玭 Tr蕁 t譵 ti觰 nh� h醝 t玭g t輈h c馻 b� ch� qu竛.");
	TalkEx("",strTalk);
end

--未取得肚兜前与欧阳画对话
function task_003_01_1()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."H穣 n Long M玭 Tr蕁 h醝 Ti觰 nh� n� ch� qu竛 甶 u. T譵 頲 Xu﹏ Th藀 Tam Nng, l蕐 m閠 v藅 tr猲 ngi n祅g ta a cho T玭 Nh� Li猲, c� l� anh ta s� t豱h l筰.",
	}

	TalkEx("",strTalk);

end

--询问店小二春十三娘去向
function task_003_02_0()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	plr.."Ti觰 nh� ca, ch� nh﹏ c馻 ngi u?",
	npc.."N� ch� qu竛  n ph輆 n b綾 Long M玭 Tr蕁 mua h祅g, kh竎h quan t譵 n祅g 蕐 l祄 g�? N誹 l� v� v� kh竎h quan say ru kia, ti觰 nh﹏ s� r籲g B筺 ph秈  u鎛g c玭g, v� ch� nh﹏ t玦 r蕋 gh衪 anh ta, ch綾 ch緉 s� kh玭g nghe B筺 u.",
	plr.."Ta c騨g ngh� v藋, v藋 ta c� th� xin Th藀 Tam Nng 輙  cho anh ta  anh ta t豱h l筰 頲 kh玭g?",
	npc.."Ai da, v藋 kh竎h quan ph秈 c萵 th薾, ch� nh﹏ ch髇g t玦 v鮝 p l筰 c遪 gi醝 v�, nh鱪g k� h竜 s綾 � Long M玭 Tr蕁  n祔 u kh玭g d竚 ch鋍 gi薾 n祅g. N祅g ta r蕋 n鉵g t輓h, e r籲g kh竎h quan mu鑞 xin  s� ph秈 ch辵 kh�.",
	plr.."H�, m� nh﹏ ng nh l� chuy謓 b譶h thng, khi n祇 ch� nh﹏ ngi v�, h穣 n鉯 gi髉 ta.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,12);
	TaskTip("дn ph輆 ng b綾 Long M玭 Tr蕁 t譵 Xu﹏ Th藀 Tam Nng xin .");
	Msg2Player("дn ph輆 ng b綾 Long M玭 Tr蕁 t譵 Xu﹏ Th藀 Tam Nng xin .");
	GivePlayerExp(SkeyXibei,"laobanniang")
end

--未取得肚兜前与店小二对话
function task_003_02_1()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."Xu﹏ Th藀 Tam Nng 產ng mua h祅g t筰 ph輆 ng b綾 Long M玭 Tr蕁, n祅g ta r蕋 n鉵g t輓h, v� c玭g cao cng, ph秈 c萵 th薾 kh玭g n猲 c t閕 v韎 n祅g 蕐."
	}

	TalkEx("",strTalk);

end

---------------------------------- 西北区04招兵买马----------------------------------

--取得肚兜后与孙二琏对话
function task_004_01_0()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."叅i卼rong m� ta v� giai nh﹏ c馻 ta s� 叅i? Th藀 Tam Nng? Зy l� m飅 hng c馻 Th藀 Tam Nng!......Th藀 Tam Nng, n祅g v� r錳 �!? (th莕 ch� ch顃 t豱h, nh鎚 d藋 t譵 xung quanh).",
	plr.."Kh玭g ph秈, Th藀 Tam Nng c遪 產ng l祄 vi謈, nh璶g ngi xem y c� ph秈 l� y誱 c馻 n祅g 蕐?",
	npc.."C竔 g�? Лa ta xem n祇, m飅 hng c馻 Th藀 Tam Nng! Зy l� t骾 c馻 Th藀 Tam Nng! N鉯 mau, ngi  l祄 g� v韎 Th藀 Tam Nng? C竔  d﹎ t芻 nh� ngi kia! N鉯 mau!? (th莕 ch� t豱h h糿, t� v� hung h穘).",
	plr.."Ai da, T玭 ti猲 sinh ngi hi觰 l莔 r錳! Зy l�  Th藀 Tam Nng cho ta, b秓 ta chuy觧 cho ngi, n祅g 蕐 n鉯 ngi si t譶h nh� v藋, r蕋 ng  l祄 b筺. L筰 nghe n鉯 ngi su鑤 ng祔 u鑞g ru t筰 kh竎h s筺, mn ru gi秈 s莡,  d苙 ta 甧m v藅 n祔 v� cho ngi, mong ngi ng l祄 chuy謓 h筰 th﹏ n鱝. у n祔 ngi c� gi� l蕐, khi n祇 n祅g 蕐 v� h穣 tr� l筰, ti謓 th� n鉯 r� v韎 ngi ta.",
	npc.."� Th� ra l� v藋, th� l鏸 l骳 n穣厖 Th藅 m筼 ph筸, <sex> b� qua cho! Ph秈 r錳, l骳 n穣 ngi n鉯 Th藀 Tam Nng h錳 t﹎ chuy觧 � r錳 ph秈 kh玭g? Ha ha ha, ta bi誸 tr阨 kh玭g ph� l遪g ngi, kh玭g u鎛g c玭g ta, cu鑙 c飊g  c� 頲 m� nh﹏! T鑤 t鑤. ph秈 r錳, kh玭g bi誸 <sex> t譵 ta c� chuy謓 g�?",
	plr.."(Ngi n祔 dng nh�  t豱h l筰) g莕 y T﹜ H� 產ng l祄 m璦 l祄 gi�, dng nh� mu鑞 g﹜ r鑙 Чi T鑞g, ta xin Trng Ca M玭 gi髉 甶襲 tra chuy謓 n祔,  Dng ti襫 b鑙  ph竔 ta n t譵 ngi.",
	}

	TalkEx("task_004_01_0_1",strTalk);

end

-- 续对话
function task_004_01_0_1()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {

	npc.."�, th� ra  Dng ti猲 sinh sai ngi n.. <sex> y猲 t﹎, ngi  mang cho ta tin t鑤 nh� v藋, ta kh玭g bi誸 th� th玦, bi誸 th� ph秈 l祄 n c飊g. H祅h ng c馻 T﹜ H� l莕 n祔 r蕋 l韓, kh玭g c莕 ph秈 n鉯, ﹎ m璾 trong  tuy che 頲 m総 c馻 nh﹏ s� v� l﹎ b譶h thng, nh璶g Trng Ca M玭 ta  c秐h gi竎.",
	plr.."T玭 ti猲 sinh dng nh� bi誸 chuy謓, kh玭g bi誸  t譵 頲 th玭g tin g�?? Long M玭 Tr蕁  g莕 y c� g� kh竎 thng kh玭g?",
	npc.."Nh蕋 c� nh蕋 ng c馻 Long M玭 Tr蕁  l祄 sau che 頲 m総 ta? V飊g Long M玭 Tr蕁  n祔 c竎h xa ho祅g , gi祔 quan ph� kh玭g n 頲, thng c� t� nh﹏ tr鑞 ch箉, t譶h c秐h r鑙 ren, tng truy襫 c遪 c� nhi襲 cao th� v� l﹏ 萵 c�. Theo ta Nh蕋 ph萴 阯g 產ng  � n v飊g t kh玭g ai coi qu秐 t藀 trung nhi襲 k� vong m筺g n祔, b� tr� n閕 鴑g, gi� th� 畂筺 chi猽 binh m穒 m�. ",
	plr.."N鉯 nh� v藋 T﹜ H� kh玭g nh鱪g m璾  t蕁 c玭g T鑞g, m� c遪 甶襲 ng nh﹏ t礽 c馻 Nh蕋 ph萴 阯g t筰 Long M玭 Tr蕁  sai khi課, M藅 s� Nh蕋 ph萴 阯g ho箃 ng li猲 t鬰, th� ra 產ng thu th藀 tin t譶h b竜 c馻 nh﹏ t礽.",
	npc.."ng v藋, M藅 s� Nh蕋 ph萴 阯g g莕 y b薾 t譵 ki誱 nh﹏ t礽. Kh玭g mua chu閏 vong m謓h chi  竚 s竧 tr閙 cp, th� l� gi藅 d﹜, ng l�  c 竎.",
	}

	TalkEx("task_004_01_0_2",strTalk);

end

-- 续对话
function task_004_01_0_2()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	plr.."Kh玭g sai, b鋘 r緉 c n祔 kh玭g t� th� 畂筺, ng l� tai h鋋 c馻 v� l﹎ Trung Nguy猲 ta, l莕 n祔 n誹 Nh蕋 ph萴 阯g th祅h c玭g, ch綾 s� h� m璦 g鋓 gi�, ch髇g ta ph秈 ra s鴆 ng╪ c秐.",
	npc..", v蕁  l� ta kh玭g bi誸 頲 h祅h tung c馻 ch髇g. Mu鑞 ch苩 t k� ho筩h c馻 ch髇g, ph秈 t譵 ra k� ch� m璾 l� ai",
	plr.."Kh玭g c� u m鑙 �? Coi nh� k� ch� m璾 mai danh 萵 t輈h, nh璶g l莕 n祔 Nh蕋 ph萴 阯g chi猽 binh m穒 m� quy m� l韓, ch綾 s� kh玭g 萵 n竨 qu� s﹗. S� qua l筰 c馻 ch髇g ch綾 c� th� l莕 ra d蕌 v誸.",
	npc.."ng ng, ngi kh玭g n鉯 ta c騨g kh玭g ngh� ra, g莕 y Cao th� quan ngo筰 qua l筰 t筰 Long M玭 Tr蕁  c� h祅h tung kh� nghi, dng nh� c� ti誴 x骳 b� m藅 v韎 Nh蕋 ph萴 阯g, nh璶g ta v蒼 n竛 l筰 kh竎h s筺 ch璦 th� truy t譵, qu� th鵦 r蕋 x蕌 h�.",
	plr.."Ti猲 sinh ch� x蕌 h�, ngi  cung c蕄 cho ta tin t鴆 quan tr鋘g, Cao th� quan ngo筰 kia r蕋 c� th�  g苝 k� ch� m璾, ta ph秈 甶 th╩ d� m閠 chuy課.",
	}

	TalkEx("",strTalk);
	DelItem(2,0,690,1);--删去肚兜
	CreateTrigger(0,1241,KILL_XB_GUANWAIGAOSHOU);--关外高手杀怪触发器
	SetTask(TASK_XB_ID,14);
	TaskTip(" n Long M玭 Tr蕁, 甶襲 tra cao th� quan ngo筰 xem c� manh m鑙 v� Nh蕋 ph萴 阯g kh玭g.");
	Msg2Player(" n Long M玭 Tr蕁, 甶襲 tra cao th� quan ngo筰 xem c� manh m鑙 v� Nh蕋 ph萴 阯g kh玭g.");
	GivePlayerAward("Award_XB_06","Easy");
	GivePlayerExp(SkeyXibei,"dudou")
end


--带回或未带回一品堂邀请函与孙二琏对话
function task_004_02_0()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {};

	--带回一品堂邀请函
	if GetItemCount(2,0,691) >= 1 then
		strTalk = {
			plr.."Nh鱪g Cao th� quan ngo筰 qu� nhi猲 l頸 h筰, ta  l蕐 頲 Th� m阨 c馻 Nh蕋 ph萴 阯g tr猲 ngi ch髇g.",
			npc.."(Xem th� m阨) kh玭g 頲, ngi ch辵 tr竎h nhi謒 ch輓h trong l莕 chi猽 binh m穒 m� n祔 c馻 Nh蕋 ph萴 阯g l� L� Nguy猲 Kh竛h! Chuy謓 n祔 kh玭g gi鑞g b譶h thng. Nh鱪g k� qua l筰 v韎 cao th� u l� nh鱪g k� xu蕋 ch髇g, ng th阨 Nh蕋 ph萴 阯g th藀 i kim cang c騨g  ra m苩. Чi s�, chuy謓 i s� s緋 x秠 ra.",
			plr.."T猲 L� Nguy猲 Kh竛h n祔 l� ai? Th藀 i kim cang l� nh鱪g k� n祇?",
			npc.."Xa Lu﹏ B� Vng n祔 l� k� ch� m璾 c馻 h祅h ng l莕 n祔, l骳 n祔 產ng � Long M玭 Tr蕁. Th玭g tin v� suy 畂竛 c馻 ta ch� c� th�, <sex> h穣 甶 t譵  Dng ti猲 sinh, 玭g ta c� th� gi秈 t醓 nghi v蕁 cho ngi. Ha ha, c遪 ph秈 產 t� <sex>  mang tin t鑤 v� cho ta.",
			plr.."ng kh竎h s竜, ta xin c竜 t�.",
			}

		RemoveTrigger(GetTrigger(KILL_XB_GUANWAIGAOSHOU));
		TalkEx("",strTalk);
		SetTask(TASK_XB_ID,15);
		TaskTip("Bi誸 Nh蕋 ph萴 阯g s緋 c� ﹎ m璾 l韓, h穣 mau v� Ph鬾g Tng b竜 cho  Dng H鋋 bi誸.");
		Msg2Player("Bi誸 Nh蕋 ph萴 阯g s緋 c� ﹎ m璾 l韓, h穣 mau v� Ph鬾g Tng b竜 cho  Dng H鋋 bi誸.");
		GivePlayerAward("Award_XB_07","Easy");
		GivePlayerExp(SkeyXibei,"yipintangzhuangda")
	--没有带回一品堂邀请函and补发任务触发器
	else
		strTalk = {
			"C竎 cao th� quan ngo筰 qua l筰 Long M玭 Tr蕁  c� h祅h tung kh� nghi, dng nh� c� ti誴 x骳 b� m藅 v韎 Nh蕋 ph萴 阯g. Nh璶g ta v蒼 n竛 l筰 kh竎h s筺 ch璦 甶 甶襲 tra, th藅 x蕌 h�"
			}
		if	GetTrigger(KILL_XB_GUANWAIGAOSHOU) == 0 then
			CreateTrigger(0,1241,KILL_XB_GUANWAIGAOSHOU);
			TaskTip(" n Long M玭 Tr蕁, 甶襲 tra cao th� quan ngo筰 xem c� manh m鑙 v� Nh蕋 ph萴 阯g kh玭g.");
			Msg2Player(" n Long M玭 Tr蕁, 甶襲 tra cao th� quan ngo筰 xem c� manh m鑙 v� Nh蕋 ph萴 阯g kh玭g.");
		end

		TalkEx("",strTalk);
	end
end


--未与欧阳画对话前与孙二琏对话
function task_004_02_1()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."Ngi h穣 n Ph鬾g Tng t譵  Dng H鋋 ti猲 sinh."
	}

	TalkEx("",strTalk);

end

--与欧阳画对话准备加入一品堂做卧底
function task_004_03_0()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."<sex>  v� r錳 �! T玭 Nh� Li猲  t豱h r錳 ch�?",
	plr.."T玭 ti猲 sinh  t豱h l筰 r錳, 玭g ta c遪 th竚 th輓h 頲 Nh蕋 Ph萴 Л阯g 產ng chi猽 binh m穒 m� � Long M玭 tr蕁, M藅 s� Nh蕋 Ph萴 Л阯g 產ng � g莕  t譵 ki誱 nh﹏ t礽. C遪 y l� Th� m阨 Nh蕋 Ph萴 Л阯g. Xin ti襫 b鑙 xem qua.",
	npc.."(Xem xong th� m阨) Х 甶襲 ng L� Nguy猲 Kh竛h v� Th藀 Чi Kim Cang, h祅h ng l莕 n祔 c馻 Nh蕋 Ph萴 Л阯g qu� th藅 kh玭g ph秈 chuy謓 nh�, xem ra ch髇g r蕋 xem tr鋘g t chi猽 binh m穒 m� l莕 n祔, L� Nguy猲 Kh竛h c騨g xu蕋 hi謓, ch� s� b猲 trong c遪 c� ﹎ m璾 g� l韓 h琻.",
	plr.."L� Nguy猲 Kh竛h l� ai?",
	npc.."L� Nguy猲 Kh竛h l� cao th� th� 3 c馻 T﹜ H� Nh蕋 Ph萴 Л阯g, ngi n祔 tr� d騨g song to祅 v� c� a v� r蕋 cao trong Nh蕋 Ph萴 Л阯g. Kh玭g ph秈 vi謈 h� tr鋘g y s� kh玭g xu蕋 hi謓, vi謈 c馻 Nh蕋 Ph萴 Л阯g ch� c莕 y ph� tr竎h th� ch綾 ch緉 s� th祅h c玭g, t� l骳 tr� y  c� th� ng錳 v祇 ch鴆 v� cao th� th� 3 c� th� th蕐 t礽 ngh� c馻 y cao th﹎ kh� lng.",
	plr.."Th� ra l� v藋! Nh蕋 Ph萴 Л阯g  L� Nguy猲 Kh竛h ph� tr竎h vi謈 chi猽 binh m穒 m� l莕 n祔 nh蕋 nh s� th祅h c玭g. C遪 Th藀 Чi Kim Cang?",
	npc.."Th藀 Чi Kim Cang l� tinh anh Nh蕋 Ph萴 Л阯g ph� tr竎h h祅h s� v� truy襫 ch� l謓h. Mi ngi n祔 c� ngo筰 h譶h k� l� nh璶g u l� cao th�, l莕 n祔 ngi n Long M玭 tr蕁 n Xa Lu﹏ B� Vng  ch輓h l� m閠 trong mi ngi .",

	}

	TalkEx("task_004_03_0_1",strTalk);

end;

-- 续对话
function task_004_03_0_1()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	plr.."L莕 n祔 c竎 cao th� c馻 Nh蕋 Ph萴 Л阯g l莕 lt xu蕋 hi謓, kh玭g bi誸 t筰 sao h� l筰 coi tr鋘g t chi猽 binh m穒 m� n祔?",
	npc.."Theo ta 畂竛, T﹜ H� mu鑞 x﹎ chi誱 l穘h th� Чi T鑞g, mu鑞 li猲 k誸 v韎 nc Li猽  x﹎ chi誱 Чi T鑞g, l莕 h祅h ng n祔 Nh蕋 Ph萴 Л阯g mu鑞 m� r閚g th� l鵦 � Trung Nguy猲, l祄 y誹 甶 s鴆 m筺h c馻 Trung Nguy猲. Nh蕋 Ph萴 Л阯g kh玭g ch� 竚 s竧 c竎 cao th� v� l﹎ m� c遪 mua chu閏 c竎 qu﹏ th莕 trong tri襲  l蕐 th玭g tin c� m藅 c馻 Чi T鑞g.",
	plr.."Ch糿g tr竎h Nh蕋 Ph萴 Л阯g coi tr鋘g h祅h ng l莕 n祔, ch髇g l� m鑙 nguy h筰 v韎 v� l﹎ Trung Nguy猲, ta ph秈 ng╪ ch苙 h祅h ng l莕 n祔 c馻 b鋘 ch髇g.",
	npc.."Kh玭g sai! Nh璶g mu鑞 ph� ho筰 h祅h ng c馻 b鋘 ch髇g th� ta ph秈 bi誸 hng h祅h ng c馻 ch髇g. 祬�<sex> i hi謕, ta c� chuy謓 mu鑞 nh� ngi.",
	plr.."Kh玭g d竚! G鉷 s鴆 cho nc nh� l� tr竎h nhi謒 c馻 v穘 b鑙. Ti襫 b鑙 xin c� n鉯!",
	npc.."H祅h ng l莕 n祔 c馻 Nh蕋 Ph萴 Л阯g n誹 th祅h c玭g s� l� i h鋋 cho v� l﹎. Cho n猲 ta mu鑞 <sex> th﹎ nh藀 Nh蕋 Ph萴 Л阯g 甶襲 tra ﹎ m璾 c馻 ch髇g,  th鮝 c� ng╪ ch苙 h祅h ng l莕 n祔.",
	}

	TalkEx("task_004_03_0_2",strTalk);

end

-- 续对话
function task_004_03_0_2()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	plr.."Ti襫 b鑙 mu鑞 t筰 h� tr� tr閚 v祇 Nh蕋 Ph萴 Л阯g?",
	npc.."V韎 c� tr� c馻 <sex>, vi謈 n祔 ch� c� th� tr玭g ch� v祇 <sex>. Nh蕋 Ph萴 Л阯g h祅h ng kh� 畂竛, <sex> l� ngi c� th� tin c藋, ta m韎 d竚 m� mi謓g nh� v�.",
	plr.."Xem ra y c騨g l� bi謓 ph竝 t鑤, mu鑞 ph� ho筰 h祅h ng c馻 ch髇g ph秈 tr� tr閚 v祇 Nh蕋 Ph萴 Л阯g m韎 c� th� l蕐 頲 tin t鴆 quan tr鋘g.",
	npc.."<sex> i hi謕, n誹 vi謈 n祔 th祅h c玭g, <sex> xem nh�  t筼 ph骳 cho b� t竛h, h祅h ng l莕 n祔 v� c飊g nguy hi觤, ngi h穣 t飝 c� h祅h s�, n誹 g苝 kh� kh╪ g� h穣 n t譵 ta, Trng Ca M玭 ta s� 駈g h� ngi h誸 m譶h.",
	plr.."V穘 b鑙 xin ghi nh�! Nh蕋 nh s� kh玭g ph� l遪g ngi.",
	npc.."Ngi ng u t chi猽 binh m穒 m� l莕 n祔 l� Xa Lu﹏ B� Vng , ngi c� th� 甧m Th� m阨 Nh蕋 Ph萴 Л阯g n Long M玭 tr蕁 th� xem. M鋓 chuy謓 h穣 c萵 th薾.",
	}

	SetTask(TASK_XB_ID,16);
	TaskTip(" Dng H鋋 b秓 b筺 甶 t譵 Xa Lu﹏ B� Vng!");
	Msg2Player(" Dng H鋋 b秓 b筺 甶 t譵 Xa Lu﹏ B� Vng!");
	GivePlayerAward("Award_XB_08","Easy");
	GivePlayerExp(SkeyXibei,"qianru")
	TalkEx("",strTalk);
end

--尚未与车轮霸王对话前与欧阳画对话
function task_004_03_1()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."<sex> v� nc kh玭g ti誧 th﹏ m譶h, th藅 khi課 ngi ngi k輓h ph鬰.",
	}

	TalkEx("",strTalk);

end


---------------------------------- 西北区05陈仓暗度----------------------------------
--与车轮霸王对话开始”西北区05陈仓暗度“任务
function task_005_01_0()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {};

	--大于67方能接任务
	if GetLevel() >= 67 then
		strTalk = {
			plr.."(Ta ph秈 gi� trang th祅h t閕 ph筸 c馻 Чi T鑞g  l蕐 chi誱 頲 s� t輓 nhi謒 c馻 Xa Lu﹏ B� Vng)",
			plr.."Ngi l� Xa Lu﹏ B� Vng ? Ta v� m璾 s竧 k� th� ph筸 ph秈 t閕 t�. L鬰 Phi課 M玭 truy 畊鎖 t玦 n y, thi誸 ngh� Чi T鑞g  kh玭g c遪 ch�  t玦 dung th﹏, y l� Th� m阨 Nh蕋 Ph萴 Л阯g, kh玭g bi誸 Nh蕋 Ph萴 Л阯g c� th� th﹗ nh薾 ta kh玭g?",
			npc.."Xem ra <sex> l� nh﹏ t礽 c馻 M藅 s� Nh蕋 Ph萴 Л阯g. Nh蕋 Ph萴 Л阯g v鑞 tr鋘g anh h飊g, kh玭g c莕 bi誸 xu蕋 x�, cho d� ngi ph筸 ph竝 c騨g kh玭g sao, ch� c莕 l� ngi c� n╪g l鵦 l� 頲.",
			plr.."T筰 h�  nghe danh Nh蕋 Ph萴 Л阯g xem tr鋘g nh﹏ t礽 t� l﹗, t筰 h� 產ng b� b鋘 L鬰 Phi課 M玭 ng gh衪 truy 畊鎖 r竜 ri誸, kh玭g bi誸 Nh蕋 Ph萴 Л阯g c� th� th﹗ nh薾 ta kh玭g?",
			npc.."Ha ha! Ngi y猲 t﹎, � Nh蕋 Ph萴 Л阯g s� g� b鋘 L鬰 Phi課 M玭? Cho d� Ho祅g cung i n閕 b鋘 ta c遪 ch璦 xem ra g�.",
			}

		TalkEx("task_005_01_0_1",strTalk);

	else
		strTalk = {
			"(Ta ph秈 gi� trang th祅h t閕 ph筸 c馻 Чi T鑞g  l蕐 chi誱 頲 s� t輓 nhi謒 c馻 Xa Lu﹏ B� Vng)",
			"Ngi l� Xa Lu﹏ B� Vng ? Ta v� m璾 s竧 k� th� ph筸 ph秈 t閕 t�. L鬰 Phi課 M玭 truy 畊鎖 t玦 n y, thi誸 ngh� Чi T鑞g  kh玭g c遪 ch�  t玦 dung th﹏, y l� Th� m阨 Nh蕋 Ph萴 Л阯g, kh玭g bi誸 Nh蕋 Ph萴 Л阯g c� th� th﹗ nh薾 ta kh玭g?",
			"Xem ra <sex> l� nh﹏ t礽 c馻 M藅 s� Nh蕋 Ph萴 Л阯g. Nh璶g h玬 nay xem ra <sex> v蒼 ch璦  n╪g l鵦 m� b鋘 ta y猽 c莡, ch� ngi t c蕄 80 h穣 n t譵 ta.",
			}
		TalkEx("",strTalk);
	end
end

-- 续对话
function task_005_01_0_1()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
				plr.."Ch� c莕 Nh蕋 Ph萴 Л阯g gi髉 ta tho竧 kh醝 ki誴 n筺 n祔, ta s� t薾 l鵦 ph鬾g s� cho Nh蕋 Ph萴 Л阯g.",
				npc.."Nh蕋 Ph萴 Л阯g ta coi anh h飊g, kh玭g th輈h th﹗ nh薾 k� b蕋 t礽, th� m阨 M藅 s� cho ngi ch� l� bc s祅g l鋍 th玦, mu鑞 v祇 Nh蕋 Ph萴 Л阯g ph秈 qua s� th� th竎h  ch鴑g minh n╪g l鵦 c馻 ngi. Nh藀 m玭 ph秈 qua 3 th� th竎h.",
				plr.."V祅g th藅 kh玭g s� l鯽, i nh﹏ xin c� n鉯!",
				npc.."<sex> th藅 s秐g kho竔. Ngi b� L鬰 Phi課 M玭 truy 畊鎖 n y, thi誸 ngh� ngi c騨g c╩ th� L鬰 Phi課 M玭 n t薾 xng, g莕 y m閠 trong Th藀 Чi Kim Cang l� S竧 th� Oa Oa ch糿g may b� L鬰 Phi課 M玭 b総 gi�, ta th蕐 ngi h祇 kh� h琻 ngi, c� d竚 n L鬰 Phi課 M玭 c鴘 ngi kh玭g?",
				}

	TalkEx("task_005_01_0_2",strTalk);

end

-- 续对话
function task_005_01_0_2()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
			plr.."V藋 ta kh玭g ph秈 t� chui u v祇 li sao? Ta 產ng b� L鬰 Phi課 M玭 truy 畊鎖, bi誸 tr猲 n骾 c� h� d� ch糿g l� c� leo l猲 sao?",
			npc.."Kh玭g v祇 hang c鋚 sao b総 頲 c鋚? Nh蕋 Ph萴 Л阯g kh玭g hoan ngh猲h nh鱪g k� nh竧 gan, ph秈 vt qua kh� kh╪ m韎 l� b薱 anh h飊g. <sex> n誹 kh玭g  can m th� th玦 v藋,, nh璶g ngi  c� � nh藀 m玭, l筰 l� T﹏ b� Nh蕋 Ph萴 Л阯g, sau n祔 ch� c莕 a ra k� hi謚 n祔 v韎 ngi trong 阯g  ch鴑g nh薾 th﹏ ph薾.",
			plr.."Ha ha! Чi nh﹏ h穣 ch� tin c馻 t筰 h�.",
			plr.."(K� n祔 ki猽 c╪g nh璶g l筰 c萵 tr鋘g, r� r祅g ta  t� khai m譶h 產ng b� L鬰 Phi課 M玭 truy n�, c遪 b総 ta m筼 hi觤, th藅 gi秓 ho箃. C� 甶襲 nh� lao L鬰 Phi課 M玭 � u m韎 頲? Ch綾 ph秈 n h醝  Dng H鋋 ti襫 b鑙 th玦.)",
	}

	DelItem(2,0,691,1);--删去邀请函
	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,17);
	TaskTip("V� Ph鬾g Tng t譵  Dng H鋋 h醝 v� tr� nh� lao L鬰 Phi課 M玭.");
	Msg2Player("V� Ph鬾g Tng t譵  Dng H鋋 h醝 v� tr� nh� lao L鬰 Phi課 M玭.");
	add_xb_title(1);--称号：一品堂新备
	GivePlayerExp(SkeyXibei,"jiaoruyipintang")
end

--尚未与欧阳画对话
function task_005_01_1()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	"Th� th竎h th� 1: n nh� lao gi秈 c鴘 S竧 th� Oa Oa  ch鴑g t� l遪g can m.",
	plr.."(K� n祔 ki猽 c╪g nh璶g l筰 c萵 tr鋘g, r� r祅g ta  t� khai m譶h 產ng b� L鬰 Phi課 M玭 truy n�, c遪 b総 ta m筼 hi觤, th藅 gi秓 ho箃. C� 甶襲 nh� lao L鬰 Phi課 M玭 � u m韎 頲? Ch綾 ph秈 n h醝  Dng H鋋 ti襫 b鑙 th玦.)",
	}

	TalkEx("",strTalk);

end

--尚未救出娃娃杀手前对话
function task_005_01_2()

local strTalk = {
	"Th� th竎h th� 1: n nh� lao gi秈 c鴘 S竧 th� Oa Oa  ch鴑g t� l遪g can m.",
	}

	TalkEx("",strTalk);

end

--与欧阳画对话询问监牢位置
function task_005_02_0()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."S� vi謈 n u r錳?",
	plr.."Xa Lu﹏ B� Vng  r蕋 c萵 th薾, n鉯 l� gia nh藀 Nh蕋 Ph萴 Л阯g ph秈 th玭g qua 3 th� th竎h. Ta b秓 gi� m譶h 產ng l� t閕 ph筸 b� truy n� � Чi T鑞g, nh璶g h緉 l筰 bu閏 ta ph秈 t韎 L鬰 Phi課 M玭 c鴘 ngi, ch綾 l� mu鑞 th╩ d� ta y.",
	npc.."ng l� gian x秓. Xem ra vi謈 n祔 ph秈 nh� n L鬰 Phi課 M玭 r錳. Ngi h穣 n Bi謓 Kinh t譵 B竎h Hi觰 Sinh, 玭g ta quen bi誸 v韎 L鬰 Phi課 M玭, ch綾 s� gi髉 頲 ngi y. Ta s� d飊g b� c﹗ a th�  k� r� s� t譶h.",
	plr.."Л頲, 產 t� s� gi髉  c馻 ti襫 b鑙.",
	}

	SetTask(TASK_XB_ID,18);
	TalkEx("",strTalk);
	TaskTip("дn Bi謓 Kinh, t譵 B竎h Hi觰 Sinh nh� gi髉 .");
	Msg2Player("дn Bi謓 Kinh, t譵 B竎h Hi觰 Sinh nh� gi髉 .");
	GivePlayerExp(SkeyXibei,"citanjimi")
end;

--尚未与百晓生对话
function task_005_02_1()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local strTalk = {
	npc.."Gi� ngi h穣 n Bi謓 Kinh t譵 B竎h Hi觰 Sinh, ta  d飊g b� c﹗ a th� n鉯 r� s� t譶h v韎 玭g ta r錳.",
	plr.."Л頲, v穘 b鑙 s� 甶 ngay."
	}

	TalkEx("",strTalk);

end

--与百晓生对话获得袁飞云坐标
function task_005_03_0()
local npc = gf_FixColor(GetNpcName(GetTargetNpc()),2)..": ";
local plr = gf_FixColor(GetName(),2)..": ";
local nMapName,nXpos,nYpos = SelectMapData(1);
local strTalk = {
	npc.."<sex> n r錳 �, ta  nh薾 頲 th� c馻  Dng H鋋, chuy謓 c馻 L鬰 Phi課 M玭 ngi c� y猲 t﹎, ta  nh� B� kho竔 Vi猲 V﹏ Phi gi髉 , h緉 l� 1 trong l鬰 i danh b� c馻 i T鑞g, l� tr� c閠 c馻 L鬰 Phi課 M玭, c� s� gi髉  c馻 h緉, vi謈 s� u v祇 y c�.",
	plr.."H祅h tung c馻 B� kho竔 L鬰 Phi課 M玭 l� c� m藅, l祄 sao ta t譵 Vi猲 Phi V﹏ 頲 ch�?",
	npc.."Ta  vi誸 th� cho L鬰 Phi課 M玭, gi� h緉 產ng � "..nMapName..", ngi ch� c莕 n "..(nXpos..", "..nYpos).." d飊g Ph竜 hi謚 L鬰 Phi課 m玭 n祔, Vi猲 Phi V﹏ t� kh綾 xu蕋 hi謓.",
	plr.." t� ti襫 b鑙, c� nhi襲 s� gi髉  nh� v藋, ta nh蕋 nh s� ho祅 th祅h t鑤 nhi謒 v�.",
	npc.."<sex> ng kh竎h s竜, c遪 tr� m�  x� th﹏ v� giang s琻 i T鑞g, h祅h ng 蕐 th藅 v� i. <sex> ph秈 th藅 c萵 tr鋘g, n誹 g苝 v蕁  g�, ch� c莕 trong ph筸 vi n╪g l鵦 c馻 Trng Ca M玭, ta 総 d鑓 to祅 l鵦 tr� gi髉.",
	}

	AddItem(2,0,692,1,1);--获得六扇门烟火
	SetTask(TASK_XB_ID,19);
	TalkEx("",strTalk);
	TaskTip("дn "..nMapName.."("..nXpos..", "..nYpos..") d飊g Ph竜 hi謚 L鬰 Phi課 m玭  g苝 Vi猲 Phi V﹏.");
	Msg2Player("дn "..nMapName.."("..nXpos..", "..nYpos..") d飊g Ph竜 hi謚 L鬰 Phi課 m玭  g苝 Vi猲 Phi V﹏.");
	GivePlayerExp(SkeyXibei,"bukuaiyuanyunfei")
end

--选取目标地图和坐标点
--参数nType：1,2,3为与袁飞云对话所需随机地点
function SelectMapData(nType)

local i = 0;
local Map_Data_Index = {};
local nMapName = "";
local nMapDataID,nMapID,nXpos,nYpos = 0,0,0,0;

	if nType == 1 or nType == 2 or nType == 3 then

		nMapDataID = random(1,getn(Map_Data));
		SetTask(YUANFEIYUN_MAP_DATA_ID,nMapDataID);
		nMapName = Map_Data[nMapDataID][1];
		nXpos = Map_Data[nMapDataID][5];
		nYpos = Map_Data[nMapDataID][6];

		return nMapName,nXpos,nYpos

	end

end

--尚未使用烟火与袁飞云会面时与百晓生对话
function task_005_03_1()

local nMapDataID = GetTask(YUANFEIYUN_MAP_DATA_ID);
local nMapName,nXpos,nYpos = Map_Data[nMapDataID][1],Map_Data[nMapDataID][5],Map_Data[nMapDataID][6];
local strTalk = {
	"Ta  vi誸 th� cho L鬰 Phi課 M玭, gi� h緉 產ng � "..nMapName..", ngi ch� c莕 n "..(nXpos..", "..nYpos).." d飊g Ph竜 hi謚 L鬰 Phi課 m玭 n祔, Vi猲 Phi V﹏ t� kh綾 xu蕋 hi謓.",
	" t� ti襫 b鑙, c� nhi襲 s� gi髉  nh� v藋, ta nh蕋 nh s� ho祅 th祅h t鑤 nhi謒 v�.",
	"<sex> ng kh竎h s竜, c遪 tr� m�  x� th﹏ v� giang s琻 i T鑞g, h祅h ng 蕐 th藅 v� i. <sex> ph秈 th藅 c萵 tr鋘g, n誹 g苝 v蕁  g�, ch� c莕 trong ph筸 vi n╪g l鵦 c馻 Trng Ca M玭, ta 総 d鑓 to祅 l鵦 tr� gi髉.",
	}

	TalkEx("",strTalk);

	--补发烟火
	if GetItemCount(2,0,692) <= 0 then
		AddItem(2,0,692,1,1);--获得六扇门烟火
	end

end

--与袁飞云对话取得路线图
function task_005_04_0()

local nMapName,nXpos,nYpos = SelectMapData(1);
local strTalk = {
	"Ta  頲 nghe B竎h Hi觰 Sinh nh綾 n <sex>. L蕐 qu鑓 gia x� t綾 l祄 tr鋘g, g箃 b� l頸 輈h c� nh﹏, ng l� anh h飊g xu蕋 thi誹 ni猲! ",
	"Ta ch� mu鑞 l祄 ch髏 g�  cho nc nh�, Vi猲 B� kho竔 tr� gian di謙 竎, danh ch蕁 v� l﹎, 頲 B� kho竔 tr� gi髉 ta th蕐 t� tin h琻 nhi襲.",
	"<sex> ng kh竎h s竜, chuy謓 kh玭g th� ch薽 tr�, ta h穣 mau v筩h k� ho筩h 鴑g ph�. X玭g v祇 nh� lao L鬰 Phi課 M玭 e l� kh玭g 鎛 l緈, v� nh� lao 頲 canh ph遪g c萵 m藅, c� quan tr飊g tr飊g, cho d� <sex> cp ng鬰 th祅h c玭g, c騨g ph秈 g竛h l蕐 t閕 danh su鑤 i.",
	"Xa Lu﹏ B� Vng giao nhi謒 v� n祔, r� r祅g l� mu鑞 y l� v祇 ng� c魌, gi誸 ngi nay l筰 th猰 t閕 cp ng鬰 ch綾 ch緉 ta s� kh玭g c遪 c� h閕 l祄 l筰 cu閏 i, nh璶g n誹 kh玭g c鴘 頲 S竧 th� Oa Oa th� kh玭g th� c� 頲 l遪g tin c馻 h緉. Ch糿g l� kh玭g c遪 c竎h n祇 kh竎 sao?",
	"ng lo l緉g qu�, ta  suy ngh� r蕋 l﹗, n誹 kh玭g th� c玭g khai cp ng鬰, th� h穣 c飊g nhau ng 1 v� k辌h qua m総 thi猲 h� v藋. S緋 t韎 ta s� 竝 t秈 S竧 th� Oa Oa 甶 ngang "..nMapName.."("..nXpos..", "..nYpos..", ngi h穣 t韎 cp ng鬰, ta v� b� thng v� ngi nh﹏ c� h閕 c鴘 S竧 th� Oa Oa. Зy l� b秐  l� tr譶h 竝 t秈, ngi ch� vi謈 甶 theo hng d蒼 tr猲 .",
	}

	TalkEx("task_005_04_0_1",strTalk);

end

-- 续对话
function task_005_04_0_1()

local strTalk = {
	"C竎h n祔 gi髉 gi秏 b韙 nhi襲 kh� kh╪ trong l骳 cp ng鬰, ng l� di謚 k�. Nh璶g kh玭g bi誸 c竎h n祔 c� th� qua m総 頲 c竎 nha d辌h c飊g 畂祅 v� S竧 th� Oa Oa kh玭g?",
	"T韎 l骳  ta s� ch th﹏ 竝 t秈 S竧 th� Oa Oa,  l鮝 頲 h緉, ngi v� ta u ph秈 d鑓 h誸 s鴆 cho cu閏 chi課, kh玭g 頲 m襪 l遪g nng tay. C遪 n鱝, ngi c� th� n Ph鬾g Tng ph� t譵 Di謕 l穙 mua 輙 n kh鉯, n� s� gi髉 輈h cho vi謈 c鴘 ngi y.",
	"Nh� v藋 ch糿g ph秈 Vi猲 B� kho竔 ph秈 nh薾 l穘h tr竎h nhi謒 hay sao? Ngi h誸 s鴆 gi髉  ta, nh璶g ta khi課 ngi mang t閕, l筰 c遪 b� thng, ta kh玭g th� l祄 v藋 頲.",
	"Ngi l祄 i s� kh玭g c﹗ n� ti觰 ti誸. V� i c鬰, ch髏 l頸 輈h c� nh﹏ n祇 c� ng g�! <sex> v� ta b蘯 nc tng ph飊g, nh璶g x璦 c� c﹗ k� s� c� th� ch誸 v� tri k� kia m�. ng n 畂 n鱝, <sex> ng  Vi猲 m� ph秈 th蕋 v鋘g.",
	"K� s� c� th� ch誸 v� tri k�, hay l緈, n誹 ta c遪 ch莕 ch�, th� h鉧 ra m譶h qu� nhu nhc r錳. ",
	"V藋 m韎 ng l� con d﹏ c馻 i T鑞g ch�. Ta 甶 chu萵 b� m鋓 th� y. Xin c竜 t�.",
	}

	AddItem(2,0,693,1,1);--获得押送路线路
	SetTask(TASK_XB_ID,20);
	TalkEx("task_005_04_1",strTalk);
	TaskTip("дn Ph鬾g Tng t譵 thng nh﹏ Di謕 l穙 mua n kh鉯 d飊g cho vi謈 cp ng鬰.");
	Msg2Player("дn Ph鬾g Tng t譵 thng nh﹏ Di謕 l穙 mua n kh鉯 d飊g cho vi謈 cp ng鬰.");
	GivePlayerAward("Award_XB_09","Easy");
	GivePlayerExp(SkeyXibei,"haoxi")
end

--与袁飞云对话取得路线图后Npc消失
function task_005_04_1()

	SetNpcLifeTime(GetTask(YUANFEIYUN_NPCINDEX),0);--让Npc消失
	SetNpcScript(GetTask(YUANFEIYUN_NPCINDEX),"");--脚本置空
end

--与凤翔叶老对话
function task_005_05_0()

local strTalk = {
	"Xin h醝 玭g c� ph秈 Di謕 L穙 kh玭g? T玦 mu鑞 mua Y猲 M筩 Чn.",
	"ng r錳. Ta thng giao d辌h v韎 l竔 bu玭 T﹜ V鵦, Y猲 M筩 Чn n祔 l� t苙g th猰, kh玭g ng bao nhi猽, n誹 <sex> mu鑞 ta c� th� t苙g ngi. Nh璶g ta c� vi謈 mu鑞 nh� <sex> gi髉 頲 kh玭g?",
	"g c� n鉯 ng ng筰, ch� c莕 t玦  s鴆, t筰 h� s� gi髉 玭g.",
	"Ha ha, <sex> th藅 t鑤 b鬾g, ch� l� chuy謓 nh� th玦, con trai ta n C玭 L玭 ph竔 tu luy謓, m韎 y  ba n╩ kh玭g v�, ta r蕋 nh� n�, kh玭g bi誸 n� s鑞g ra sao, s鴆 ta  gi� y誹 kh玭g th� l猲 n骾, ngi c� th� gi髉 ta g鰅 ch髏  cho n� kh玭g?",
	"Л頲 th玦, kh玭g bi誸 con trai 玭g t猲 g�?",
	"N� t猲 Di謕 T� Thu, tu luy謓 � C玭 L玭 ph竔, phi襫 ngi gi髉 ta g鰅 b鴆 Th� nh� v� G鉯  n祔 cho n�, hy v鋘g n� kh醗. <sex> th藅 t鑤 b鬾g, c竚 琻 nhi襲.",
	"g c� y猲 t﹎, t筰 h� s� chuy課 n .",
	}

	AddItem(2,0,747,1,1);--得到带给叶子秋的包裹和书信
	AddItem(2,0,748,1,1);
	SetTask(TASK_XB_ID,21);
	TalkEx("",strTalk);
	TaskTip("Mang th� v� g鉯  cho Di謕 T� Thu con trai Di謕 L穙 產ng tu luy謓 tr猲 C玭 L玭 ph竔.");
	Msg2Player("Mang th� v� g鉯  cho Di謕 T� Thu con trai Di謕 L穙 產ng tu luy謓 tr猲 C玭 L玭 ph竔.");

end

--尚未带去家书和包裹与叶老对话（补发任务物品）
function task_005_05_1()

local strTalk = {
	"Con trai ta t猲 Di謕 T� Thu l�  t� C玭 L玭 ph竔, phi襫 ngi gi髉 ta chuy觧 n . C竚 琻 <sex> nhi襲."
	}

	if GetItemCount(2,0,747) <= 0 then
		AddItem(2,0,747,1,1);
	end

	if GetItemCount(2,0,748) <= 0 then
		AddItem(2,0,748,1,1);
	end

	TalkEx("",strTalk);

end

--给叶子秋带去家书和包裹对话
function task_005_06_0()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"\'Nguy謓 h誸 l遪g tu o thu藅  h祅g ma di謙 y猽, c� nh� v藋 thi猲 h� m韎 th竔 b譶h.\' S�  t譵 ta c� vi謈 �?",
			"T玦 mang 輙  cho i s� huynh, Di謕 L穙 g鰅 cho huynh Th� nh� v� G鉯 , 玭g 蕐 r蕋 nh� huynh, hy v鋘g huynh c� th阨 gian 甶 th╩ 玭g.",
			"Phi襫 s�  r錳. Ta  xa nh� n C玭 L玭 tu luy謓 m韎 y  ba n╩, b� cha gi� c� n m閠 m譶h � nh�, 玭g v蒼 kh醗 ch�?",
			}
	else
		strTalk = {
			"\'Nguy謓 h誸 l遪g tu o thu藅  h祅g ma di謙 y猽, c� nh� v藋 thi猲 h� m韎 th竔 b譶h.\' <sex> t譵 ta c� vi謈 �?",
			"Thi誹 hi謕 c� ph秈 l� con c馻 Di謕 L穙, Di謕 T� Thu?",
			"ng, sao ngi bi誸 gia ph�? Ph秈 ch╪g gia ph� x秠 ra chuy謓?",
			"Kh玭g ph秈, Di謕 L穙 � Ph鬾g Tng v蒼 kh醗, thi誹 hi謕 kh玭g c莕 lo l緉g. Ta n a  th玦, Di謕 L穙 g鰅 Th� nh� v� G鉯 , 玭g r蕋 nh� ngi, hy v鋘g ngi c� th阨 gian 甶 th╩ 玭g.",
			}
	end

	TalkEx("task_005_06_0_1",strTalk);

end

-- 续对话
function task_005_06_0_1()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
	 	strTalk = {
			"Huynh tuy h誸 l遪g tu h祅h tr� ma, nh璶g c騨g c莕 nh� n ngi th﹏ m韎 ph秈. Di謕 L穙 r蕋 kh醗, huynh y猲 t﹎. g c� n m閠 m譶h � Ph鬾g Tng , mu鑞 l猲 n骾 th╩ nh璶g tu鎖 gi� s鴆 y誹 kh玭g th� 甶 頲. Tuy c竎h xa ng祅 d苖 nh璶g v蒼 lo l緉g cho huynh.",
			"S�  n鉯 ph秈, ta qu� b蕋 hi誹. S�  c� th� gi髉 ta b竜 cho gia ph� kh玭g? Ta r蕋 kh醗, ch� l祄 xong nhi謒 v� s� ph� giao cho s� v� th╩ 玭g.",
			"Л頲, mong huynh mau ch鉵g v� nh�."
			}
	else
		strTalk = {
			"Phi襫 <sex> r錳. Ta  r阨 nh� n C玭 L玭 tu luy謓 m韎 y  ba n╩, b� cha gi� c� n m閠 m譶h � nh�, 玭g v蒼 kh醗 ch�?",
			"Ngi tuy h誸 l遪g tu h祅h tr� ma, nh璶g c騨g c莕 nh� n ngi th﹏ m韎 ph秈. Di謕 L穙 r蕋 kh醗, ngi y猲 t﹎. g c� n m閠 m譶h � Ph鬾g Tng, mu鑞 l猲 n骾 th╩ nh璶g tu鎖 gi� s鴆 y誹 kh玭g th� 甶 頲. Tuy c竎h xa ng祅 d苖 nh璶g v蒼 lo l緉g cho ngi.",
			"Qu� th鵦 ta b蕋 hi誹. <sex> c� th� gi髉 ta b竜 cho gia ph� kh玭g? Ta r蕋 kh醗, ch� l祄 xong nhi謒 v� s� ph� giao cho s� v� th╩ 玭g.",
			"Л頲, mong huynh mau ch鉵g v� nh�.",
			}
	end

	TalkEx("",strTalk);
	DelItem(2,0,747,1);--删去包裹和书信
	DelItem(2,0,748,1);
	SetTask(TASK_XB_ID,22);
	TaskTip("Gi髉 Di謕 T� Thu b竜 cho Di謕 L穙, ch� l祄 xong vi謈 s� v� nh� m閠 chuy課.");
	Msg2Player("Gi髉 Di謕 T� Thu b竜 cho Di謕 L穙, ch� l祄 xong vi謈 s� v� nh� m閠 chuy課.");
	GivePlayerAward("Award_XB_10","Easy");
	GivePlayerExp(SkeyXibei,"jiashu")
end

--未带回话给叶老与叶子秋对话
function task_005_06_1()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			" t� s�  gi髉 , phi襫 chuy觧 l阨 cho gia ph�, khi l祄 xong vi謈 s� v� th╩ 玭g."
			}
	else
		strTalk = {
			" t� <sex>, phi襫 chuy觧 l阨 cho gia ph�, khi l祄 xong vi謈 s� v� th╩ 玭g."
			}
	end

	TalkEx("",strTalk);

end

--带话给叶老取得烟幕弹对话
function task_005_07_0()

SelectMapData(2);

local nTriggerID = Map_Data[GetTask(YUANFEIYUN_MAP_DATA_ID)][7];
local strTalk = {
	"<sex> g苝 con trai ta kh玭g? N� kh醗 kh玭g?",
	"Di謕 L穙 y猲 t﹎, huynh 蕐 r蕋 kh醗, huynh 蕐 c遪 n鉯 khi n祇 l祄 xong vi謈 s� ph� giao s� v� th╩ 玭g.",
	"�, v藋 t鑤 r錳, ch� c莕 n� kh醗 l� ta y猲 t﹎. T苙g ngi Y猲 M筩 Чn, c秏 琻 <sex>  gi髉 .",
	"Chuy謓 nh� th玦.",
	}

	AddItem(2,0,694,1,1);--得到烟幕弹
	--补发路线图
	if GetItemCount(2,0,693) <= 0 then
		AddItem(2,0,693,1,1)
	end
	SetTask(TASK_XB_ID,23);
	TalkEx("",strTalk);
	CreateTrigger(2,nTriggerID,RECT_XB_YUANFEIYUN);
	TaskTip("Х nh薾 Y猲 M筩 Чn, theo b秐  m� Vi猲 B� u giao cho 甶 cp ng鬰.");
	Msg2Player("Х nh薾 Y猲 M筩 Чn, theo b秐  m� Vi猲 B� u giao cho 甶 cp ng鬰.");
	GivePlayerExp(SkeyXibei,"yanwudan")
end

--未完成劫囚任务与叶老对话（补发触发器与任务物品）
function task_005_07_1()

local nTriggerID = Map_Data[GetTask(YUANFEIYUN_MAP_DATA_ID)][7];
local strTalk = {
	"C竚 琻 <sex> gi髉 , <sex> qu� l� t鑤 b鬾g."
	}

	TalkEx("",strTalk);

	if GetItemCount(2,0,693) <= 0 or GetItemCount(2,0,693) <= 0 or GetTrigger(RECT_XB_YUANFEIYUN) == 0 then

		if GetItemCount(2,0,694) <= 0 then--补发烟雾弹
			AddItem(2,0,694,1,1)
		end

		if GetItemCount(2,0,693) <= 0 then--补发路线图
			AddItem(2,0,693,1,1)
		end

		if GetTrigger(RECT_XB_YUANFEIYUN) == 0 then--补发触发器
			CreateTrigger(2,nTriggerID,RECT_XB_YUANFEIYUN);
		end

		TaskTip("Х nh薾 Y猲 M筩 Чn, theo b秐  m� Vi猲 B� u giao cho 甶 cp ng鬰.");
		Msg2Player("Х nh薾 Y猲 M筩 Чn, theo b秐  m� Vi猲 B� u giao cho 甶 cp ng鬰.");

	end

end

--与袁飞云对话准备劫囚
function task_005_08_0(nNpcIndex)

local strSay = {};
local strTalk = {};

	--判断是否为当前玩家召唤出来的Npc
	if GetTask(YUANFEIYUN_NPCINDEX) == nNpcIndex and GetTask(TASK_XB_ID) == 23 then
		if GetFollower() == 0 then
			strSay = {
				"Ai y? X璶g t猲 甶! D竚 ngang nhi猲 cp ng鬰, ch鑞g i quan ph�, xem L鬰 Phi課 M玭 ta kh玭g ra g� �? Ti誴 chi猽!",
				"ng nhi襲 l阨, h穣 mau th� ngi cho ta!/#task_005_08_1("..nNpcIndex..")",
				"Ch� l� qua 阯g th玦./Task_Exit",
				}
		else
			strSay = {
				"Ai y? X璶g t猲 甶! D竚 ngang nhi猲 cp ng鬰, ch鑞g i quan ph�, xem L鬰 Phi課 M玭 ta kh玭g ra g� �? Ti誴 chi猽!",
				"ng nhi襲 l阨, h穣 mau th� ngi cho ta!/#task_005_08_2("..nNpcIndex..")",
				"Ch� l� qua 阯g th玦./Task_Exit",
				}
		end
		SelectSay(strSay);
	elseif GetTask(TASK_XB_ID) == 23 then
		strTalk = {
			"Dng nh� t譵 nh籱 ngi r錳, h穣 n "..Map_Data[GetTask(YUANFEIYUN_MAP_DATA_ID)][1].."("..Map_Data[GetTask(YUANFEIYUN_MAP_DATA_ID)][5]..", "..Map_Data[GetTask(YUANFEIYUN_MAP_DATA_ID)][6].." t譵 th�."
			}
		TalkEx("",strTalk);
	else
		strTalk = {
			"Dng nh� nh莔 ngi."
			}
		TalkEx("",strTalk);
	end

end

--提示删掉宠物跟班
function task_005_08_1(nNpcIndex)

local strSay = {
	"Nh綾 nh�: Khi cp S竧 Th� Oa Oa th祅h c玭g, s� h駓 b� th� c璶g hi謓 mang theo, ti誴 t鬰 cp ng鬰 kh玭g?",
	"уng �/#task_005_08_2("..nNpcIndex..")",
	"H駓 b�/Task_Exit"
	}

	SelectSay(strSay);

end

--选择劫囚
function task_005_08_2(nNpcIndex)

local strTalk = {};

	if GetItemCount(2,0,694) <= 0 then
		strTalk = {
			"... (n kh鉯 ch� l� m蕋 r錳, hay l� t譵 Di謕 L穙 t譵 l筰.)",
			"Xin l鏸, nh薾 nh籱 ngi.",
			"(T猲 n祔 產ng l祄 tr� g� v藋, c遪 kh玭g mau d飊g n kh鉯 cp ng鬰...)"
			}
		TalkEx("",strTalk)
	else
		--加入烟幕弹特效
		strTalk = {
			"A?! L� n kh鉯! C� ngi cp ng鬰!",
			"(Mau ch鉵g nh b筰 Vi猲 B� u, c鴘 S竧 Th� Oa Oa.)"
			}
		TalkEx("",strTalk)
		ChangeNpcToFight(nNpcIndex);
	end
end

--击败袁飞云后对话
function task_005_08_3()

local strTalk = {
	"Ngi l� qu� th莕 phng n祇? Kh玭g quen kh玭g bi誸, sao l筰 c鴘 ta? B竜 cho ngi bi誸 l� n誹 ta mu鑞 r阨 kh醝 y c騨g kh玭g c莕 ngi gi髉 s鴆 u! ng l� phi襫 ph鴆!",
	}

	TalkEx("task_005_08_3_1",strTalk);

end

-- 续对话
function task_005_08_3_1()

local strTalk = {
	"V藋..? (l� n祇 ta c鴘 nh莔 ngi?) C竎 h� c� ph秈 l� m閠 trong Th藀 i kim cang Nh蕋 Ph萴 Л阯g, S竧 Th� Oa Oa kh玭g? Ta ph鬾g m謓h Xa Lu﹏ B� Vng , gi秈 c鴘 c竎 h�.",
	"�, th� ra l穙 Xa Lu﹏ ph竔 ngi n, kh玭g sai, ta ch輓h l� S竧 Th� Oa Oa, ngi l� ngi c馻 Nh蕋 Ph萴 Л阯g? L祄 sao ngi bi誸 ta s� qua l鑙 n祔? N誹 ta kh玭g b� b総 th� l祄 sao c鴘 頲?",
	"T玦 v蒼 ch璦 gia nh藀 Nh蕋 Ph萴 Л阯g, c鴘叺 kh玭g叜鉵 c竎 h� v� l� m閠 b礽 th� th竎h c馻 t玦. T玦 萵 n竨 � L鬰 Phi課 M玭 nhi襲 ng祔, th竚 th輓h 頲 Vi猲 Phi V﹏ s� 竝 gi秈 c竎 h� qua ch� n祔, n猲 � y ch� i.",
	"Kh� l緈, v� b竜 v韎 Xa Lu﹏ r籲g, ta ch� mu鑞 v祇 Nh� lao b�   ch琲 v礽 ng祔 th玦, ch� kh玭g ph秈 ta kh玭g ho祅 th祅h nhi謒 v�. L鬰 Phi課 M玭 ta  xem l� g� ch�?",
	}

	SummonNpc("S竧 Th� Oa Oa","S竧 Th� Oa Oa");
	TalkEx("task_005_08_3_2",strTalk);
	SetTask(TASK_XB_ID,24);

end

-- 续对话
function task_005_08_3_2()

local strTalk = {
	"(Ngi n祔 ng l� m閠 trong Th藀 i kim cang Nh蕋 Ph萴 Л阯g kh玭g? Th藀 i kim cang l� nh鱪g nh﹏ v藅 g� nh�? Ngi n祔 nh譶 qu� tr� con, r� r祅g b� b総 m� c遪 s� di謓. Th玦, v� t譵 Xa Lu﹏ B� Vng  r錳 t輓h ti誴.)",
	"N鉯 v藋, c竎 h� c� r蕋 nhi襲 b� m藅 t譶h b竜? Chi b籲g ch髇g ta v� g苝 Xa Lu﹏ B� Vng r錳 t輓h ti誴.",
	"Ha ha, ti觰 t� kh� l緈, sau n祔 Nh蕋 Ph萴 Л阯g s� c� nhi襲 t d鬾g v�, c� theo l阨 ngi v藋. L� n祇 l� v藋, t猲 h� Vi猲 d竚 cp K裲 H� L� c馻 ta, th藅 l� phi襫 qu竻",
	}

	TalkEx("",strTalk);
	TaskTip("Х c鴘 S竧 Th� Oa Oa, t譵 Xa Lu﹏ B� Vng ph鬰 m謓h.");
	Msg2Player("Х c鴘 S竧 Th� Oa Oa, t譵 Xa Lu﹏ B� Vng ph鬰 m謓h.");
end

--与车轮霸王对话完成交予的第一个任务，领取第二个任务
--领取任务对话
function task_005_09_0()

	if GetTask(TASK_GET_AWARD) == 1 then
		task_005_09_0_3()
		return 0;
	end

local strTalk = {
	"S竧 Th� Oa Oa  v�.",
	"Ta ch� l� n nh� lao  d筼 m閠 v遪g, ti謓 th� th竚 th輓h t譶h h譶h, kh玭g ph秈 l� b� b総. Phi襫 Xa Lu﹏ ph竔 ti觰 t� n祔 n n ta r錳. Th﹏ th� ti觰 t� n祔 r蕋 kh�, ch� l� h琲 non t� th玦.",
	"Ha ha ha, <sex> kh玭g ph秈 t莔 thng. S竧 Th� Oa Oa n鉯 ngi kh� th� ch綾 ngi kh玭g n n鏸 n祇. Nh璶g L鬰 Phi課 M玭 s� kh玭g  y猲 cho ngi u.",
	"C� th� v� Nh蕋 Ph萴 Л阯g, th� t� chuy謓 phi襫 ph鴆 c� ng l� g� ch�! Ngo礽 L鬰 Phi課 M玭 ra th� m鋓 chuy謓 u t鑤 p. Nh蕋 Ph萴 Л阯g s� cho t玦 n琲 nng nh�, kh玭g ch� n chuy謓 L鬰 Phi課 M玭 kh玭g bu玭g tha.",
	"(Dng nh� qua 秈 r錳, may m� kh玭g ph� k� v鋘g c馻 Vi猲 B� Kho竔.)",
	"Ti觰 t� n祔 l祄 vi謈 chu o,  nh b筰 Vi猲 Phi V﹏. Th鵦 ra Vi猲 Phi V﹏ l祄 sao c� th� l� i th� c馻 ta, ta ch� l� nhng cho ti觰 t�  m閠 c� h閕 bi觰 hi謓.",
	}

	TalkEx("task_005_09_0_1",strTalk);

end

-- 续对话
function task_005_09_0_1()

local strTalk = {
	"Ha ha ha, qu� l� anh h飊g xu蕋 thi誹 ni猲, ta gi� n n琲 r錳. Ti觰 Oa l莕 sau ng n nh� lao  ch琲 n鱝, ta s� kh玭g ph竔 ngi n ngi n鱝 u.",
	"Xa Lu﹏ b韙 d礽 d遪g, h� Vi猲 d竚 i u v韎 Nh蕋 Ph萴 Л阯g ch髇g ta, ngay c� ti觰 t� n祔 c遪 i ph� kh玭g 頲, sao d竚 b総 ta? C遪 cp K裲 H� L珔ta mu鑞 l閠 da r髏 g﹏ c馻 h緉. Ti觰 t�, l莕 sau ch髇g ta c飊g nhau h� h緉, xong chuy謓 ta m阨 ngi K裲 H� L�.",
	"(S竧 Th� Oa Oa qu� danh b蕋 h� truy襫, h譶h d竛g nh� con n輙, t﹎ nh� s竧 th�, sau n祔 ph秈 c萵 th薾 i ph�.)",
	"C� th� c鴘 ngi t� tay Vi猲 Phi V﹏ c馻 L鬰 Phi課 M玭, <sex> qu� l� kh� lng! Ngi c騨g m謙 r錳, ngh� ng琲 甶, l莕 kh秓 nghi謒 n祔 m韎 g� l� m鉵 khai v� th玦, m鉵 ngon c遪 � ph輆 sau .",
	"Kh玭g d竚. Xin d苙 d�, t筰 h� s� h誸 s鴆 m� l祄.",
	}

	--TalkEx("task_005_09_0_2",strTalk);
	TalkEx("task_005_09_0_3",strTalk);
end

--发奖励
function task_005_09_0_2()
	--give_wp_award(11);

end

--成功领取奖励后执行
function task_005_09_0_3()

	SetTask(TASK_GET_AWARD,0);
	SetTask(TASK_XB_ID,25);
	GivePlayerAward("Award_XB_11","Easy");
	GivePlayerExp(SkeyXibei,"jieqiu")
	TaskTip("Sau khi ngh� ng琲, Xa Lu﹏ giao nhi謒 v� th� hai.");
	Msg2Player("Sau khi ngh� ng琲, Xa Lu﹏ giao nhi謒 v� th� hai.");
	task_005_09_1()

end;

--删去娃娃杀手
function task_005_09_1()

local nFollowerName = GetNpcName(GetFollower());

	if nFollowerName == "S竧 Th� Oa Oa" then
		KillFollower();
	end

end

---------------------------------- 西北区06不死金丹----------------------------------
--领取第二个考验
function task_006_01_0()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"N骾 C玭 L玭 l� ng鋘 n骾 tr祅 y ti猲 kh�, tng truy襫 ngi C玭 L玭 ph竔 ngo礽 tinh th玭g c竎h h祅g y猽 di謙 ma, c遪 n緈 gi� b� thu藅 luy謓 Trng Sinh B蕋 L穙 n, nhi襲 n╩ trc T﹜ H� Vng T閏 ta n c莡 c竎h ch� luy謓, nh璶g b� chng m玭 C玭 L玭 ph竔 Chu B蕋 Ho芻 t� ch鑙.",
			"C玭 L玭 ph竔 c� b� thu藅  sao?? (Thu鑓 c馻 C玭 L玭 ph竔 ta bi課 th祅h Trng Sinh B蕋 L穙 n khi n祇 nh�?)",
			"Зy l� b� m藅  頲 c玭g khai, ch� l� chng m玭 C玭 L玭 ph竔 kh玭g nh薾 m� th玦. T﹜ H� Vng T閏 ta d飊g l� i i, kh玭g ng� C玭 L玭 ph竔 kh玭g th鴆 th阨 nh� v藋, s� c� m閠 ng祔 Nh蕋 Ph萴 Л阯g ta l祄 c� C玭 L玭 ph竔.",
			"Trng Sinh B蕋 L穙 n qu� l祄 thi猲 h� kinh ho祅g, n誹 C玭 L玭 th鮝 nh薾 h� c� c竎h luy謓 n  th� kh玭g ph秈 l� t� chu鑓 h鋋 v祇 th﹏ sao?",
			}
	else
		strTalk = {
			"N骾 C玭 L玭 l� ng鋘 n骾 tr祅 y ti猲 kh�, tng truy襫 ngi C玭 L玭 ph竔 ngo礽 tinh th玭g c竎h h祅g y猽 di謙 ma, c遪 n緈 gi� b� thu藅 luy謓 Trng Sinh B蕋 L穙 n, nhi襲 n╩ trc T﹜ H� Vng T閏 ta n c莡 c竎h ch� luy謓, nh璶g b� chng m玭 C玭 L玭 ph竔 Chu B蕋 Ho芻 t� ch鑙.",
			"C玭 L玭 ph竔 c� b� thu藅  sao?",
			"Зy l� b� m藅  頲 c玭g khai, ch� l� chng m玭 C玭 L玭 ph竔 kh玭g nh薾 m� th玦. T﹜ H� Vng T閏 ta d飊g l� i i, kh玭g ng� C玭 L玭 ph竔 kh玭g th鴆 th阨 nh� v藋, s� c� m閠 ng祔 Nh蕋 Ph萴 Л阯g ta l祄 c� C玭 L玭 ph竔.",
			"Trng Sinh B蕋 L穙 n qu� l祄 thi猲 h� kinh ho祅g, n誹 C玭 L玭 th鮝 nh薾 h� c� c竎h luy謓 n  th� kh玭g ph秈 l� t� chu鑓 h鋋 v祇 th﹏ sao?",
			}
	end

	TalkEx("task_006_01_0_1",strTalk);

end

-- 续对话
function task_006_01_0_1()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ngi n鉯 c騨g c� l�, d� r籲g C玭 L玭 ph竔 th藅 s� c� c竎h luy謓 Trng Sinh B蕋 L穙 n th� c騨g kh玭g d� d祅g ti誸 l�. L遪g gan d� s竛g su鑤 c馻 ngi ta nh薾 th蕐 r錳, nh璶g kh玭g bi誸 kh� n╪g d� th竚 t譶h h譶h th� n祇, m�  l筰 l� m閠 k� n╪g m� ngi trong Nh蕋 Ph萴 Л阯g ai c騨g tinh th玭g, ngi 甶 C玭 L玭 d� th竚 m閠 chuy課, xong vi謈 l� qua kh秓 nghi謒 th� hai.",
			"Chuy謓 n祔 u c� g� kh�! H穣 ch� tin c馻 t筰 h�.",
			"(Trng Sinh B蕋 L穙 n?  n鉯 v� v萵. Nghe ng� kh� c馻 h緉 dng nh� c� ﹎ m璾 v韎 C玭 L玭 ta, c莕 ph秈 l璾 �. S� huynh Di謕 T� Thu tinh th玭g thu藅 luy謓 n, chi b籲g 甶 h醝 huynh 蕐)",
			}
	else
		strTalk = {
			"Ngi n鉯 c騨g c� l�, d� r籲g C玭 L玭 ph竔 th藅 s� c� c竎h luy謓 Trng Sinh B蕋 L穙 n th� c騨g kh玭g d� d祅g ti誸 l�. L遪g gan d� s竛g su鑤 c馻 ngi ta nh薾 th蕐 r錳, nh璶g kh玭g bi誸 kh� n╪g d� th竚 t譶h h譶h th� n祇, m�  l筰 l� m閠 k� n╪g m� ngi trong Nh蕋 Ph萴 Л阯g ai c騨g tinh th玭g, ngi 甶 C玭 L玭 d� th竚 m閠 chuy課, xong vi謈 l� qua kh秓 nghi謒 th� hai.",
			"Chuy謓 n祔 u c� g� kh�! H穣 ch� tin c馻 t筰 h�.",
			"(Th竔  ngi n祔 i v韎 ta c� v� 玭 h遖 h琻 r錳. Trng Sinh B蕋 L穙 n? An n鉯 v� v萵. Nh璶g thu藅 luy謓 n C玭 L玭 ph竔 danh tr蕁 giang h�, ng r錳 n t譵 Di謕 T� Thu h醝 th�.)",
			}
	end

	SetTask(TASK_XB_ID,26);
	TalkEx("",strTalk);
	TaskTip("T譵 Di謕 T� Thu th竚 th輓h t譶h h譶h Trng Sinh B蕋 L穙 n.");
	Msg2Player("T譵 Di謕 T� Thu th竚 th輓h t譶h h譶h Trng Sinh B蕋 L穙 n.");

end

--未与叶子秋打听长生不老丹事情
function task_006_01_1()

local strTalk = {
	"Kho秐g nghi謒 l莕 hai: n C玭 L玭 ph竔 d� th竚 b� thu藅 luy謓 Trng Sinh B蕋 L穙 n  ch鴑g minh n╪g l鵦 d� th竚."
	}

	TalkEx("",strTalk);

end

--向叶子秋打听长生不老丹
function task_006_02_0()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"\'B� t竛h c� n筺, thi猲 h� r鑙 lo筺. Ta d鑓 l遪g tu luy謓  tr� y猽 ma, tr� l筰 s� thanh b譶h cho thi猲 h�.\' Sao s�  l筰 quay v� y? Ph秈 ch╪g th﹏ ph� ta c� vi謈 g�?",
			"Di謕 l穙 v蒼 kh醗, nghe n鉯 s� huynh s� v� th╩ nh�, l穙 r蕋 vui. N誹 Di謕 l穙 bi誸 s� huynh quan t﹎ m譶h nh� v藋, h糿 c遪 vui h琻.",
			" dng d鬰 c馻 th﹏ ph�, ta n祇 d竚 qu猲? Bi誸 ngi v蒼 kh醗 m筺h l� ta y猲 t﹎ r錳. S�  t譵 ta c� vi謈 g�?",
			}
	else
		strTalk = {
			"\'B� t竛h c� n筺, thi猲 h� r鑙 lo筺. Ta d鑓 l遪g tu luy謓  tr� y猽 ma, tr� l筰 s� thanh b譶h cho thi猲 h�.\' Sao <sex> l筰 quay v� y? Ph秈 ch╪g th﹏ ph� ta c� chuy謓 g�?",
			"Kh玭g, Di謕 l穙 v蒼 kh醗, bi誸 huynh s� v� th╩, Di謕 l穙 r蕋 vui. N誹 bi誸 huynh quan t﹎ m譶h nh� th�, h糿 Di謕 l穙 s� c遪 vui h琻.",
			" dng d鬰 c馻 th﹏ ph�, ta n祇 d竚 qu猲? Bi誸 ngi v蒼 kh醗 m筺h l� ta y猲 t﹎ r錳. <sex> n y c� vi謈 g� kh玭g?",
			"Ta t� nh�  l緈 b謓h t藅, ph秈 s鑞g nh� n dc, n猲  l藀 ch� theo h鋍 Luy謓 n chi ph竝, c鴘 nh﹏  th�. Nghe n thu藅 luy謓 n c馻 C玭 L玭 ph竔 thi猲 h� v� song, kh玭g bi誸 ta c� th� nh藀 m玭 b竔 s�, h鋍 k� n╪g luy謓 n?",
			"<sex> kh玭g nh鱪g nhi謙 t譶h m� c遪 c� t蕀 l遪g hi謕 ngh躠, T� Thu xin b竔 ph鬰. Ta c遪 產ng ph﹏ v﹏ kh玭g bi誸 ph秈 l祄 th� n祇 b竜 p c玭g lao c馻 <sex>, nay 頲 bi誸 <sex> c� � gia nh藀 C玭 L玭 ph竔, v藋 th� c遪 g� b籲g. Ta s� a ngi n g苝 chng m玭.",
			}
	end

	TalkEx("task_006_02_0_1",strTalk);

end

-- 续对话
function task_006_02_0_1()

local strTalk = {}

	if GetPlayerRoute() == 100 then
		strTalk = {
			"Л頲 bi誸 s� huynh  頲 b� thu藅 luy謓 n ch﹏ truy襫 c馻 s� ph�,  c� v礽 v蕁  mu鑞 頲 th豱h gi竜.",
			"Ta 產ng ph﹏ v﹏ kh玭g bi誸 ph秈 b竜 p c玭g lao c馻 s�  th� n祇, s�  ham h鋍 h醝 nh� v藋, s� huynh ta 琻g nhi猲 ph秈 gi髉  h誸 m譶h. Nh璶g gi� y ta c遪 ph秈 甶 th鵦 hi謓 nhi謒 v� kh萵 c蕄 m� s� ph� v鮝 giao, e kh玭g th� gi秈 quy誸 ngay cho s�  頲. Hay l� h穣 i ta v� r錳 b祅 ti誴 v藋.",
			"Di謕 s� huynh c� y猲 t﹎ 甶 l祄 nhi謒 v� s� ph� giao ph�, v蕁  c馻  kh玭g quan tr鋘g,  t譵 Tri謚 s� hu⺪h c騨g 頲 m�.",
			}
		TaskTip("T譵 Tri謚 T� B譶h s� huynh t譵 hi觰 v� vi謈 luy謓 ch� n dc.");
		Msg2Player("T譵 Tri謚 T� B譶h s� huynh t譵 hi觰 v� vi謈 luy謓 ch� n dc.");
	else
		strTalk = {
			" t� s� gi髉  c馻 thi誹 hi謕, kh玭g bi誸 hi謓 t筰 ta c� th� nh藀 ph竔 ch璦?",
			"C玭 L玭 ph竔 lu玭 ch祇 n hi謕 s�, nh璶g hi謓 gi� ta ph秈 甶 l祄 nhi謒 v� kh萵 cho s� ph�, e l� s� vi謈 ph秈 ho穘 l筰. N誹 <sex> mu鑞 nh藀 m玭 ngay b﹜ gi�, c� th� n t譵 s�  c馻 ta Tri謚 T� B譶h,  蕐 s� ngi n g苝 chng m玭. C遪 n誹 kh玭g v閕, c� th� i ta tr� v� r錳 m韎 甶, sao h�?",
			"(N誹 ta i huynh 蕐 tr� v�, vi謈 c馻 Xa Lu﹏ B� Vng  bi誸 gi秈 quy誸 sao y? Hay c� 甶 g苝 s�  c馻 huynh 蕐 v藋.)",
			"Thi誹 hi謕 c� y猲 t﹎ 甶 l祄 nhi謒 v� cho s� ph�, ng  vi謈 c馻 ta l祄 l� i s�, ta s� 甶 t譵 s�  c馻 thi誹 hi謕. ",
			"V藋 c騨g 頲, i ta tr� v� th� ch髇g ta  l� ng m玭, 琻 hi謕 ngh躠 c馻 <sex> ta s� b竜 p sau.",
			"Ch髏 vi謈 nh� ng n猲 b薾 t﹎, <sex> ph秈 c萵 th薾 h祅h s�.",
			}
		TaskTip("T譵 Tri謚 T� B譶h h醝 v� vi謈 gia nh藀 C玭 L玭 ph竔 v� vi謈 ch� luy謓 n dc.");
		Msg2Player("T譵 Tri謚 T� B譶h h醝 v� vi謈 gia nh藀 C玭 L玭 ph竔 v� vi謈 ch� luy謓 n dc.");
	end
	GivePlayerExp(SkeyXibei,"diergekaoyan")
	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,27);
end

--未与赵子平对话
function task_006_02_1()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Tri謚 T� B譶h s� huynh s� gi秈 p 頲 th綾 m綾 c馻 ngi, h穣 n h醝 huynh 蕐."
			}
	else
		strTalk = {
			"S�  Tri謚 T� B譶h s� thay ta gi韎 thi謚 ngi v韎 chng m玭, ta xin c竜 t�."
			}
	end

	TalkEx("",strTalk);

end

--与赵子平对话领取去古阳洞收集硫磺的任务
function task_006_03_0()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Tri謚 s� huynh,  c� kh骳 m綾 v� vi謈 luy謓 n. Xin huynh ch� gi竜.",
			"Thu藅 luy謓 n? S�  say m� nghi猲 c鴘 k� n╪g c馻 ph竔 ta nh� v藋, s� huynh 琻g nhi猲 kh玭g th� t� ch鑙. Nh璶g gi� ta 產ng ph� tr竎h canh gi� ph遪g luy謓 n, kh玭g th� gi秈 p th綾 m綾 cho s�  頲. S� ph� c� d苙 c莕 luy謓 Kim n, mu鑞 luy謓 n dc, quan tr鋘g nh蕋 l� kh鑞g ch� h醓 h莡, n誹 l鯽 luy謓 n kh玭g ng th� n dc s� kh玭g th祅h, ta kh玭g g竛h n鎖 tr竎h nhi謒 u.",
			"Ra luy謓 n c騨g c莕 n h醓 h莡. Kh玭g bi誸 n dc bao gi� m韎 ho祅 th祅h,  s� huynh gi秈 p cho ?",

			}
	else
		strTalk = {
			"C� ph秈 Tri謚 T� B譶h thi誹 hi謕 kh玭g? T� l﹗  nghe danh C玭 L玭 ph竔 c� thu藅 luy謓 n cao si猽, mu鑞 gia nh藀 C玭 L玭 ph竔 h鋍 ngh�, Di謕 T� Thu thi誹 hi謕 n鉯 ta c� th� nh� ngi a ta t韎 g苝 chng m玭. Xin thi誹 hi謕 gi髉 .",
			"Ngi 頲 Di謕 s� huynh ti課 c�, h糿 l� hi謕 s� ch輓h ngh躠 r錳, 甶 g苝 chng m玭 l� chuy謓 nh�, ta 琻g nhi猲 s� gi髉.",
			"Hay qu�, 產 t� Tri謚 thi誹 hi謕.",
			"Nh璶g gi� ta 產ng ph� tr竎h canh gi� ph遪g luy謓 n, kh玭g th� t� � r阨 b� cng v�, s� ph� c� d苙 hi謓 gi� c莕 ph秈 luy謓 Kim n, khi luy謓 n, quan tr鋘g nh蕋 l� ph秈 kh鑞g ch� h醓 h莡, n誹 l鯽 luy謓 n kh玭g ng th� n dc s� kh玭g th祅h, ta kh玭g g竛h n鎖 tr竎h nhi謒 u.",
			"Ra luy謓 n c騨g c莕 n h醓 h莡. Kh玭g bi誸 n dc bao gi� m韎 ho祅 th祅h,  thi誹 hi謕 gi秈 p th綾 m綾 cho ta?",

			}
	end

	TalkEx("task_006_03_0_1",strTalk);


end

-- 续对话
function task_006_03_0_1()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Kh玭g n鉯 ch綾 頲, c� th� ch� m蕐 canh gi�, c騨g c� th� m蕋 m蕐 ng祔 m蕐 m. N誹 s�  mu鑞 頲 gi秈 p nhanh, c� th� gi髉 ta t譵 輙 l璾 hu鷑h v� l祄 dc d蒼, l璾 hu鷑h t輈h t� dc kh�, gi髉 r髏 ng緉 th阨 gian luy謓 n.",
			"Л頲, kh玭g th祅h v蕁 . Nh璶g kh玭g bi誸 � u c� l璾 hu鷑h?",
			"T莕g 1 C� Dng ng � b猲 ngo礽 Long M玭 tr蕁 c� nhi襲 kim th筩h, nh璶g b鋘  Nh藅 S� c chi誱 vi謈 khai th竎 l璾 hu鷑h, n誹 s�  mu鑞 l蕐 l璾 hu鷑h, th� ph秈 ngh� c竎h i ph� v韎 ch髇g.",
			}
	else
		strTalk = {
			"Kh玭g n鉯 ch綾 頲, c� th� ch� m蕋 v礽 canh gi�, c騨g c� th� m蕋 m蕐 ng祔 m蕐 m. Dng nh� <sex> r蕋 n鉵g l遪g mu鑞 g苝 chng m玭? Ta c� m閠 c竎h r髏 ng緉 th阨 gian luy謓 n, m閠 khi n dc luy謓 th祅h, ta c� th� a ngi 甶 g苝 chng m玭 ngay. уng � kh玭g?",
			"(T猲 n祔 th藅 ng gh衪, d竚 uy hi誴 c� ta. M� th玦, ngi l祄 i s� kh玭g c﹗ n� ti觰 ti誸.)",
			"Luy謓 n c騨g c� nhi襲 b� ki誴 v藋 sao? C祅g ng祔 ta c祅g th輈h th� v韎 thu藅 luy謓 n n祔 y. Kh玭g bi誸  l� c竎h g�?",
			"N誹 mu鑞 t╪g t鑓  luy謓 n, c� th� d飊g l璾 hu鷑h l祄 dc d蒼, l璾 hu鷑h t輈h t� dc kh�, gi髉 r髏 ng緉 th阨 gian ch� luy謓, ti誧 l� ph遪g luy謓 n  h誸 m鉵 n祔.",
			}
	end

	TalkEx("task_006_03_0_2",strTalk);

end

-- 续对话
function task_006_03_0_2()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Chuy謓 n祔 c� g� kh�? C� n xin m閠 輙 v� y l� 頲 ch� g�.",
			"(Ti觰 t� n祔 ng鑓 th藅, n誹 xin 頲 ta  xin t� l﹗, u c莕 ng錳 y ph� l阨 v韎 h緉.)",
			"ng v藋 ng v藋, h穣 甶 xin m閠 輙 v� y, 10 ph莕 l� . Nh� ng v祇 qu� s﹗ trong ng, tng truy襫 C� Dng ng c� C� Dng th� tr蕁 gi�, 甶 v祇 qu� s﹗ s� b� d� th� t蕁 c玭g.",
			}
	else
		strTalk = {
			"Ra l� v藋. Huynh c� th� cho ta bi誸 � u c� l璾 hu鷑h, ta s� mang v� cho huynh.",
			"<sex> th藅 t鑤 b鬾g. T莕g 1 C� Dng ng � b猲 ngo礽 Long M玭 tr蕁 c� nhi襲 kim th筩h, nh璶g b鋘  Nh藅 S�  c chi誱 vi謈 khai th竎 l璾 hu鷑h, n誹 mu鑞 c� 頲 l璾 hu鷑h, c莕 ph秈 t譵 c竎h i ph� v韎 ch髇g.",
			"C騨g u kh�, ta c� n xin m閠 輙 l� 頲 ch� g�.",
			"(Ti觰 t� n祔 ng鑓 th藅, n誹 xin 頲 ta  xin t� l﹗, u c莕 ng錳 y ph� l阨 v韎 h緉.)",
			"ng v藋 ng v藋, h穣 甶 xin m閠 輙 v� y, 10 ph莕 l� . Nh� ng v祇 qu� s﹗ trong ng, tng truy襫 C� Dng ng c� C� Dng th� tr蕁 gi�, 甶 v祇 qu� s﹗ s� b� d� th� t蕁 c玭g.",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,28);
	CreateTrigger(0,1224,KILL_XB_ANRISHI);--杀怪触发器
	TaskTip("дn T莕g 1 C� Dng ng, l蕐 10 l璾 hu鷑h t� tay  Nh藅 S�.");
	Msg2Player("дn T莕g 1 C� Dng ng, l蕐 10 l璾 hu鷑h t� tay  Nh藅 S�.");
	GivePlayerExp(SkeyXibei,"jiazhuangrumen")
end

--带回或未带回10份硫磺
function task_006_04_0()

local strTalk = {};

	--带回10份硫磺
	if GetItemCount(2,0,695) >= 10 then

		--昆仑派弟子对话
		if GetPlayerRoute() == 100 then
			strTalk = {
				"10 l璾 hu鷑h t譵  ch璦? B鋘  Nh藅 S� ch綾 kh玭g d� i ph� h�?",
				"Х t譵  r錳,  Nh藅 S� ng l� kh玭g d� i ph�. Ch綾 ch糿g bao l﹗ n dc s� ho祅 th祅h ph秈 kh玭g?",
				"(Ha ha, ta c� 頲 l璾 hu鷑h m� ch糿g m蕋 ch髏 c玭g s鴆.  Nh藅 S� � ngi ng th� m筺h, c chi誱 l璾 hu鷑h, xem ta ti觰 t� n祔 c騨g c� ch髏 b秐 l躰h, vi謈 thu th藀 Ti猽 th筩h ch綾 c騨g giao cho h緉 lu玭 v藋.)",
				"Х c� l璾 hu鷑h l祄 dc d蒼, qu� tr譶h luy謓 n s� r髏 ng緉 頲 v礽 canh gi�, nh璶g n誹 ngi mu鑞 nhanh h琻 n鱝, th� h穣 t譵 th猰 輙 Ti猽 th筩h v� y.",
				}
		else
			strTalk = {
				"10 l璾 hu鷑h t譵  ch璦? B鋘  Nh藅 S� ch綾 kh玭g d� i ph� h�?",
				"Х t譵  r錳,  Nh藅 S� ng l� kh玭g d� i ph�. Ch綾 ch糿g bao l﹗ n dc s� ho祅 th祅h ph秈 kh玭g?",
				"(Ta c� 頲 l璾 hu鷑h m� ch糿g m蕋 ch髏 c玭g s鴆.  Nh藅 S� � ngi ng th� m筺h, c chi誱 l璾 hu鷑h, xem ta ti觰 t� n祔 c騨g c� ch髏 b秐 l躰h, vi謈 thu th藀 Ti猽 th筩h ch綾 c騨g giao cho h緉 lu玭 v藋.)",
				}
		end

		TalkEx("task_006_04_0_1",strTalk);

	--没有带回物品and补发任务触发器
	else
		--昆仑派弟子对话
		if GetPlayerRoute() == 100 then
			strTalk = {
				" Nh藅 S� � t莕g 1 C� Dng ng c chi誱 vi謈 khai th竎 l璾 hu鷑h, ngi h穣 甶 l蕐 10 ph莕 v� y, nh璶g nh� ng v祇 s﹗ trong ng,  tr竛h b� d� th� t蕁 c玭g."
				}
		else
			strTalk = {
				" Nh藅 S� � t莕g 1 C� Dng ng c chi誱 vi謈 khai th竎 l璾 hu鷑h, ngi h穣 甶 l蕐 10 ph莕 v� y, nh璶g nh� ng v祇 s﹗ trong ng,  tr竛h b� d� th� t蕁 c玭g."
				}
		end

		if	GetTrigger(KILL_XB_ANRISHI) == 0 then
			CreateTrigger(0,1224,KILL_XB_ANRISHI);
			TaskTip("дn T莕g 1 C� Dng ng, t譵 Minh Nguy謙 S� l蕐 10 l璾 hu鷑h.");
			Msg2Player("дn T莕g 1 C� Dng ng, t譵 Minh Nguy謙 S� l蕐 10 l璾 hu鷑h.");
		end

		TalkEx("",strTalk);
	end
end

-- 续对话
function task_006_04_0_1()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"馻? Ti猽 th筩h c騨g c� th� l祄 dc d蒼 頲 sao?",
			"Ti猽 th筩h tuy kh玭g th� l祄 dc d蒼, nh璶g c� t竎 d鬾g t╪g h醓 th�. N誹 cho 輙 Ti猽 th筩h v祇 ng鋘 l鯽, l鯽 s� m筺h h琻, t鑓  luy謓 n c騨g s� 頲 y nhanh.",
			"ra v藋. Ti猽 th筩h ph秈 ch╪g c騨g � t莕g 1 C� Dng ng?",
			"S�  th藅 th玭g minh. Minh Nguy謙 S� v�  Nh藅 S� � t莕g 1 C� Dng ng c蕌 k誸 v韎 nhau, c chi誱 h誸 vi謈 khai th竎 kim th筩h � , Minh Nguy謙 S� n緈 gi� Ti猽 th筩h, n誹 <sex>  c� th� l蕐 頲 l璾 hu鷑h, Ti猽 th筩h ch綾 c騨g kh玭g th祅h v蕁 . Tng t� ch� c莕 10 ph莕 l� .",
			}
	else
		strTalk = {
			"Х c� l璾 hu鷑h l祄 dc d蒼, qu� tr譶h luy謓 n s� r髏 ng緉 頲 v礽 canh gi�, nh璶g n誹 ngi mu鑞 nhanh h琻 n鱝, th� ta c騨g c� c竎h. Kh玭g bi誸 <sex> mu鑞 ti誴 t鬰 i, hay l� nghe � ki課 c馻 ta?",
			"C遪 c� c竎h nhanh h琻 n鱝 �? Л琻g nhi猲 l� c祅g nhanh c祅g t鑤 r錳. Xin c� n鉯.",
			"Mu鑞 t╪g t鑓  luy謓 n ngo礽 vi謈 s� d鬾g dc d蒼, c遪 c� th� t╪g th猰 h醓 th�. Ti猽 th筩h l� m閠 trong c竎 lo筰 h醓 th筩h, n誹 cho Ti猽 th筩h v祇 l鯽, th� l鯽 s� m筺h l猲, vi謈 luy謓 n s� nhanh h琻.",
			"Ra v藋, ch糿g l� Ti猽 th筩h c騨g � t莕g 1 C� Dng ng?",
			}
	end

	TalkEx("task_006_04_0_2",strTalk);

end

-- 续对话
function task_006_04_0_2()

local strTalk = {}

	--昆仑派弟子对话
		if GetPlayerRoute() == 100 then
			strTalk = {
				"(Qu� nhi猲 l筰 ph秈 n C� Dng ng,  Nh藅 S�  kh� i ph�, e Minh Nguy謙 S� c騨g kh玭g d� x�. Ta nghi ng� h緉 mu鑞 c� kim th筩h nh璶g l筰 ng筰 i ph� b鋘 kia, n猲 b総 ta l祄 vi謈 cho h緉. Th玦 th� ta c� gi� ng﹜ xem sao.)",
				"Tri謚 i ca qu� nhi猲 d祔 d筺 kinh nghi謒,  c遪 ph秈 th豱h gi竜 nhi襲.",
				"Qu� khen qu� khen. Nh� ng v祇 s﹗ trong ng.",
				}
		else
			strTalk = {
				"<sex> th玭g minh l緈. Minh Nguy謙 S� v�  Nh藅 S� � t莕g 1 C� Dng ng c蕌 k誸 v韎 nhau, c chi誱 h誸 vi謈 khai th竎 kim th筩h � , Minh Nguy謙 S� n緈 gi� Ti猽 th筩h, n誹 <sex>  c� th� l蕐 頲 l璾 hu鷑h, Ti猽 th筩h i v韎 <sex> ch綾 c騨g kh玭g th祅h v蕁 . Tng t� ch� c莕 10 ph莕 l� .",
				"(T猲 n祔 頲 nc l祄 t韎,  Nh藅 S�  kh� i ph�, e Minh Nguy謙 S� c騨g kh玭g d� x�. Ta nghi ng� h緉 mu鑞 c� kim th筩h nh璶g l筰 ng筰 i ph� b鋘 kia, n猲 b総 ta l祄 vi謈 cho h緉. Th玦 th� ta c� gi� ng﹜ xem sao.)",
				"Ta l� nc l� c竔, ch糿g bi誸 g� c�, c騨g may  c� Tri謚 i ca hng d蒼, ta r蕋 bi誸 琻. Tri謚 i ca d祔 d筺 kinh nghi謒 nh� v藋, sau n祔 ta ph秈 th豱h gi竜 nhi襲.",
				"Qu� khen qu� khen. Nh� ng v祇 s﹗ trong ng.",
				}
		end

	TalkEx("",strTalk);
	DelItem(2,0,695,10);
	RemoveTrigger(GetTrigger(KILL_XB_ANRISHI));
	SetTask(TASK_XB_ID,29);
	CreateTrigger(0,1225,KILL_XB_MINGYUESHI);
	TaskTip("дn t莕g 1 C� Dng ng, l蕐 10 Ti猽 th筩h t� tay Minh Nguy謙 S�.");
	Msg2Player("дn t莕g 1 C� Dng ng, l蕐 10 Ti猽 th筩h t� tay Minh Nguy謙 S�.");
	GivePlayerAward("Award_XB_12","Easy");
	GivePlayerExp(SkeyXibei,"anrishi")
end

--带回或未带回10份硝石
function task_006_05_0()

local strTalk = {};

	--带回10份硝石
	if GetItemCount(2,0,696) >= 10 then

		--昆仑派弟子对话
		if GetPlayerRoute() == 100 then
			strTalk = {
				"Зy l� 10 Ti猽 th筩h, Tri謚 s� huynh c遪 d苙 d� g� kh玭g?",
				"(Qu� nhi猲 l筰 th祅h c玭g r錳. ьi ta 甧m l璾 hu鷑h v� Ti猽 th筩h ch� luy謓 th猰, l筰 c� 頲 nhi襲 n dc. H�,  Nh藅 S� v� Minh Nguy謙 S� gi祅h h誸 kim th筩h c馻 ta, khi課 ta kh玭g th� luy謓 Ng� Th筩h t竛 甧m b竛, ch糿g kh竎 n祇 ch苩 t ngu錸 l頸 c馻 ta. Ti觰 t� n祔 kh� kh筼, b秓 g� l祄 n蕐, sau n祔 c� th� sai b秓 頲 y.)",
				"B蕐 nhi猽 l�  r錳, c� th� r髏 ng緉 頲 nhi襲 canh gi� l緈. Ch糿g ph秈 ngi c� th綾 m綾 g� sao? H醝 甶.",
				"Tri謚 s� huynh 頲 giao canh gi� ph遪g luy謓 n, qu� nhi猲 tinh th玭g n thu藅, kh玭g bi誸 ph竔 ta c� nh鱪g n dc g� c� c玭g hi謚 k衞 d礽 tu鎖 th� hay kh玭g?",
				"Л琻g� 琻g nhi猲 l� c�, hi謓 s� ph� 產ng c莕 ch� luy謓 H祅h V﹏ n, c莕 luy謓 12 canh gi� m韎 xong, nh璶g hi謓 nay  c� l璾 hu鷑h l祄 dc d蒼, c� Ti猽 th筩h t╪g h醓 th�, h琻 4 canh gi� n鱝 l� ho祅 th祅h r錳. 鮩... n n祔 c騨g c� c玭g hi謚 k衞 d礽 tu鎖 th� .",
				}
		else
			strTalk = {
				"Зy l� 10 Ti猽 th筩h, Tri謚 i ca c遪 d苙 d� g� kh玭g?",
				"(Qu� nhi猲 l筰 th祅h c玭g r錳. ьi ta 甧m l璾 hu鷑h v� Ti猽 th筩h ch� luy謓 th猰, l筰 c� 頲 nhi襲 n dc. H�,  Nh藅 S� v� Minh Nguy謙 S� gi祅h h誸 kim th筩h c馻 ta, khi課 ta kh玭g th� luy謓 Ng� Th筩h t竛 甧m b竛, ch糿g kh竎 n祇 ch苩 t ngu錸 l頸 c馻 ta. Ti觰 t� n祔 kh� kh筼, b秓 g� l祄 n蕐, mai n祔 gia nh藀 m玭 ph竔, ta l筰 c� th猰 m閠 tay sai c l鵦 r錳.)",
				"B蕐 nhi猽 l�  r錳, c� th� r髏 ng緉 頲 nhi襲 canh gi� l緈. Sau khi n dc ho祅 th祅h, ta s� a ngi n g苝 chng m玭, kh玭g qu猲 n鉯 t鑤 cho ngi m蕐 l阨.",
				"Ta c� th� nh藀 m玭 r錳 sao? T� l﹗ ta  ngng m� thu藅 luy謓 n c馻 C玭 L玭, dng nh� Tri謚 i ca r蕋 c� kinh nghi謒, sau n祔 nh藀 m玭, nh蕋 nh ta s� c遪 t韎 th豱h gi竜.",
				"Thu藅 luy謓 n c馻 C玭 L玭 ph竔 n鎖 ti課g kh緋 thi猲 h�, v� c玭g h祅g y猽 ph鬰 ma l筰 c祅g cao si猽 h琻, <sex> gia nh藀 C玭 L玭,  l� c竔 ph骳 c馻 b� t竛h.",
				}
		end

		TalkEx("task_006_05_0_1",strTalk);


	--没有带回物品and补发任务触发器
	else
		--昆仑派弟子对话
		if GetPlayerRoute() == 100 then
			strTalk = {
				"Minh Nguy謙 S� � t莕g 1 C� Dng ngc chi誱 vi謈 khai th竎 Ti猽 th筩h, ngi h穣 c� g緉g l蕐 頲 10 ph莕, nh� l� ng v祇 qu� s﹗,  ph遪g d� th� t蕁 c玭g."
				}
		else
			strTalk = {
				"Minh Nguy謙 S� � t莕g 1 C� Dng ngc chi誱 vi謈 khai th竎 Ti猽 th筩h, ngi h穣 c� g緉g l蕐 頲 10 ph莕, nh� l� ng v祇 qu� s﹗,  ph遪g d� th� t蕁 c玭g."
				}
		end

		if	GetTrigger(KILL_XB_MINGYUESHI) == 0 then
			CreateTrigger(0,1225,KILL_XB_MINGYUESHI);
			TaskTip("дn t莕g 1 C� Dng ng, l蕐 10 Ti猽 th筩h t� tay Minh Nguy謙 S�.");
			Msg2Player("дn t莕g 1 C� Dng ng, l蕐 10 Ti猽 th筩h t� tay Minh Nguy謙 S�.");
		end

		TalkEx("",strTalk);
	end
end

--续对话
function task_006_05_0_1()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"(Цng gh衪, s� ph� ch� truy襫 c竎h luy謓 n cho Di謕 T� Thu, c遪 ta th輈h luy謓 n nh� v藋 th� ch� 頲 chng qu秐 l� luy謓 n, s� ph� qu� ki猲g d� ta, kh玭g bi誸 c� th� qua m苩 頲 t猲 ti觰 t� n祔 kh玭g.)",
			"�, k� thu藅 c馻 ph竔 ta ng l� xu蕋 th莕 nh藀 h鉧, kh玭g bi誸 s� huynh c� bi誸 c竎h luy謓 n kh玭g?",
			"Sao? C竔 n祔� trc ti猲 d飊g l璾 hu鷑h l祄 dc d蒼, sau � sau  cho th猰 c竎 th秓 dc qu� nh� nh﹏ s﹎, h� th� �, quan tr鋘g l� ph秈 kh鑞g ch� h醓 h莡, m閠 khi luy謓 th祅h, kh玭g nh鱪g c� c玭g hi謚 k衞 d礽 tu鎖 th�, n誹 d飊g l﹗ c遪 c� th� trng sinh b蕋 l穙.",
			"(C� trng sinh b蕋 l穙 c騨g d竚 ph轪 ra, ch綾 ch緉 l� n鉯 d鑙 r錳. Trc y ta t鮪g nghe n鉯, d飊g l璾 hu鷑h Ti猽 th筩h l祄 thu鑓 l� c竎h ch� Ng� Th筩h t竛 l璾 truy襫 t� th阨 nh� Л阯g, ╪ v祇 kh玭g tr髇g c ch誸 l� may l緈 r錳, c遪 mu鑞 l鮝 ta sao! M� khoan, m芻 k� n� th藅 hay gi�, ta ch� c莕 chuy觧 l阨 n Xa Lu﹏ B� Vng, th� coi nh� ho祅 th祅h nhi謒 v� c遪 g�?)",
			}
	else
		strTalk = {
			"Kh玭g bi誸 Tri謚 i ca 產ng luy謓 lo筰 n g�? C玭 L玭 ph竔 c� n dc n祇 gi髉 k衞 d礽 tu鎖 th� kh玭g?",
			"�, y l� H祅h V﹏ n m� s� ph� d苙 ta luy謓 ch�, c莕 12 canh gi� m韎 xong, nh璶g gi� c� th猰 l璾 hu鷑h l祄 dc d蒼, l筰 c� Ti猽 th筩h tr� h醓, kho秐g 4 canh gi� n鱝 l� ho祅 th祅h. 鮩... thu鑓 n祔 c騨g c� c玭g hi謚 k衞 d礽 tu鎖 th�.",
			"(Цng gh衪, s� ph� ch� truy襫 c竎h luy謓 n cho Di謕 T� Thu, c遪 ta th輈h luy謓 n nh� v藋 th� ch� 頲 chng qu秐 l� luy謓 n, s� ph� qu� ki猲g d� ta, kh玭g bi誸 c� th� qua m苩 頲 t猲 ti觰 t� n祔 kh玭g.) ",
			"V韎 th莕 n n祔, khi ch� luy謓 c� b� ki誴 n祇 kh玭g?",
			"Sao? C竔 n祔� trc ti猲 d飊g l璾 hu鷑h l祄 dc d蒼, sau � sau  cho th猰 c竎 th秓 dc qu� nh� nh﹏ s﹎, h� th� �, quan tr鋘g l� ph秈 kh鑞g ch� h醓 h莡, m閠 khi luy謓 th祅h, kh玭g nh鱪g c� c玭g hi謚 k衞 d礽 tu鎖 th�, n誹 d飊g l﹗ c遪 c� th� trng sinh b蕋 l穙.",
			}
	end

	TalkEx("task_006_05_0_2",strTalk)

end

--续对话
function task_006_05_0_2()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Tri謚 s� huynh qu� nhi猲 tinh th玭g n thu藅, mong s� huynh ch� b秓 th猰.",
			"S�  kh竎h s竜 qu�, ta c遪 ph秈 tr� v� ph遪g luy謓 n, sau n祔 c� v蕁  g� c� n t譵 ta, ta s� gi髉 cho.? (T猲 n祔 th藅 ng鑓, ta n鉯 v藋 m� h緉 c騨g tin.)",
			"Л頲,  xin c竜 t�.",
			"(Tri謚 s� huynh n祔 dng nh� ch� hi觰 bi誸 s� v� thu藅 luy謓 n, khi g苝 Xa Lu﹏ B� Vng  ta ph秈 n鉯 khoa trng m閠 ch髏 m韎 頲.)",
			}
	else
		strTalk = {
			"(C� trng sinh b蕋 l穙 c騨g d竚 ph轪 ra, ch綾 ch緉 l� n鉯 d鑙 r錳. Trc y ta t鮪g nghe n鉯, d飊g l璾 hu鷑h Ti猽 th筩h l祄 thu鑓 l� c竎h ch� Ng� Th筩h t竛 l璾 truy襫 t� th阨 nh� Л阯g, ╪ v祇 kh玭g tr髇g c ch誸 l� may l緈 r錳, c遪 mu鑞 l鮝 ta sao! M� khoan, m芻 k� n� th藅 hay gi�, ta ch� c莕 chuy觧 l阨 n Xa Lu﹏ B� Vng, th� coi nh� ho祅 th祅h nhi謒 v� c遪 g�?)",
			"(Thu藅 luy謓 n c馻 C玭 L玭 ph竔 ng l� xu蕋 qu� nh藀 th莕, danh b蕋 h� truy襫!",
			"Л琻g nhi猲 r錳. Ngi mau chu萵 b� 甶, m蕐 canh gi� n鱝, khi n dc luy謓 th祅h, ch髇g ta s� t韎 g苝 chng m玭.",
			"Л頲.  c馻 Tri謚 i ca, mai n祔 ta nh蕋 nh s� b竜 p.",
			"(B﹜ gi� ch輓h l� th阨 c� t鑤 nh蕋  ta chu錸 y. Khi n ch� Xa Lu﹏ B� Vng, ta ph秈 khoa trng v� thu藅 luy謓 Trng sinh b蕋 t� n v韎 h緉 m韎 頲.)",
			}
	end

	TalkEx("",strTalk);
	DelItem(2,0,696,10);
	RemoveTrigger(GetTrigger(KILL_XB_MINGYUESHI));
	SetTask(TASK_XB_ID,30);
	TaskTip("дn b竜 v韎 Xa Lu﹏ B� Vng v� Trng sinh b蕋 t� n.");
	Msg2Player("дn b竜 v韎 Xa Lu﹏ B� Vng v� Trng sinh b蕋 t� n.");
	GivePlayerAward("Award_XB_13","Easy");
	GivePlayerExp(SkeyXibei,"mingyueshi")
end



--还没和车轮霸王对话
function task_006_05_1()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ngi h穣 i th猰 1 l竧, khi n dc luy謓 th祅h, ta s� c飊g ngi n g苝 chng m玭.",
			"(B﹜ gi� ch輓h l� th阨 c� t鑤 nh蕋  ta chu錸 y. Khi n ch� Xa Lu﹏ B� Vng, ta ph秈 khoa trng v� thu藅 luy謓 Trng sinh b蕋 t� n v韎 h緉 m韎 頲.)",
			}
	else
		strTalk = {
			"Sau n祔 s�  c� v蕁  g� c� n t譵 ta, ta s� gi髉 cho.",
			"(Tri謚 s� huynh n祔 dng nh� ch� hi觰 bi誸 s� v� thu藅 luy謓 n, khi g苝 Xa Lu﹏ B� Vng  ta ph秈 n鉯 khoa trng m閠 ch髏 m韎 頲.)",
			}
	end

	TalkEx("",strTalk);

end

--与车轮霸王对话完成第二个考验
function task_006_06_0()

local strTalk = {
	"Sao r錳? L莕 甶 C玭 L玭 ph竔 n祔 c� thu ho筩h g� kh玭g?",
	"Tr阨 kh玭g ph� l遪g ngi, sau nhi襲 n╩ 萵 m譶h t筰 ph遪g luy謓 n c馻 C玭 L玭 ph竔, ta  bi誸 頲 b� phng v� nguy猲 li謚  luy謓 Trng sinh b蕋 t� n.",
	"Ha ha, c� th� t� do ra v祇 ph遪g luy謓 n c馻 C玭 L玭 ph竔, <sex> qu� nhi猲 th﹏ th� b蕋 ph祄! Ngi  t譵 ra b� m藅 g�?",
	"(Chuy謓 v� ph遪g luy謓 n c馻 C玭 L玭 qu� nhi猲 thu h髏 頲 s� ch� � c馻 h緉, ta ph秈 甧m l阨 n鉯 c馻 Tri謚 T� B譶h ph鉵g i, th猽 d謙 th猰 m韎 頲.)",
	"Trng sinh b蕋 t� n c� nguy猲 li謚 ch輓h l� Ng� kim, b竧 th筩h, Tam ho祅g, k誸 h頿 v韎 c竎 th秓 dc qu� nh� Nh﹏ s﹎ ng祅 n╩, h� th� �, d飊g Kim th筩h 頲 C� Dng th� tr蕁 gi� trong C� Dng ng l祄 dc d蒼, d飊g chi誧 Th竔 Thanh c� nh t筰 nh n骾 C玭 L玭,  h蕄 th� tinh hoa tr阨 t l祄 chi誧 nh luy謓 n, nung b籲g ng鋘 l鯽 thu莕 dng, h鉧 gi秈 kh� ng祅 n╩ trong su鑤 7 ng祔, t藀 h頿 S琻 tr筩h chi b秓, 49 ng祔 m韎 th祅h c玭g.",
	}

	TalkEx("task_006_06_0_1",strTalk);

end

--续对话
function task_006_06_0_1()

local strTalk = {
	"Thu藅 luy謓 n c馻 C玭 L玭 qu� nhi猲 cao th﹎. уn r籲g C� Dng th� trong C� Dng ng tr蕁 gi� d� b秓, ch糿g l� chuy謓 c� th藅 sao?",
	"ng v藋, ta t鮪g n C� Dng ng xem x衪, nh鱪g n琲 c� C� Dng th� lai v穘g, u c� l璾 quang, 総 c� d� b秓. C遪 n鱝, khi luy謓 n c莕 ph秈 l猲 nh n骾 C玭 L玭 n琲 t� h頿 linh kh�, d飊g Th竔 Thanh nh ch� luy謓 ng 49 ng祔, c� ti猲 duy猲 th� s� luy謓 th祅h. M閠 khi  luy謓 th祅h c玭g, d飊g n n祔 s� th� nh� Kim ng鋍, b蕋 l穙 b蕋 t�.",
	"H鉧 ra n琲 luy謓 n kh玭g ph秈 � C玭 L玭, ch� tr竎h Vng t閏 T﹜ H� nhi襲 l莕 n y c莡 thu藅 u tay tr緉g tr� v�. T鑤 l緈, Ha ha, t譶h b竜 c馻 ngi r蕋 c� gi� tr�, ta s� b萴 b竜 l筰 v韎 Vng t閏 T﹜ H�. L莕 th� th竎h th� 2 n祔 coi nh� ngi th玭g qua r錳. Kh玭g ng� n╪g l鵦 t譶h b竜 c馻 ngi l筰 xu蕋 s綾 nh� v藋, Nh蕋 Ph萴 Л阯g r蕋 th輈h nh鱪g nh﹏ t礽 nh� th�. Ngi h穣 ngh� ng琲 甶, i sau khi ho祅 th祅h th� th竎h cu鑙 c飊g, ngi s� 頲 x誴 v祇 h祅g ng� c馻 Nh蕋 Ph萴 Л阯g.",
	"(Cu鑙 c飊g c騨g gi祅h 頲 l遪g tin c馻 h緉. Ha ha, i khi Vng t閏 T﹜ H� c馻 c竎 ngi t譵 th蕐 Th竔 Thanh nh � n骾 C玭 L玭 r閚g l韓, ch綾 h糿 Nh蕋 Ph萴 Л阯g  b� san th祅h b譶h a r錳.)",
	"Ch綾 ch緉 r錳, ta ch� mong c� ch� y猲 th﹏ th玦.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,31);
	TaskTip("Sau khi ngh� ng琲 Xa Lu﹏ B� Vng s� giao nhi謒 v� th� th竎h cu鑙 c飊g  頲 nh薾 v祇 Nh蕋 Ph萴 Л阯g.");
	Msg2Player("Sau khi ngh� ng琲 Xa Lu﹏ B� Vng s� giao nhi謒 v� th� th竎h cu鑙 c飊g  頲 nh薾 v祇 Nh蕋 Ph萴 Л阯g.");
	GivePlayerAward("Award_XB_14","Easy");
	GivePlayerExp(SkeyXibei,"busidan")
end

---------------------------------- 西北区07男儿铮骨----------------------------------
--领取一品堂第三个考验
function task_007_01_0()

local strTalk = {
	"Vi謈 gi秈 tho竧 S竧 th� Oa Oa ngi  l祄 r蕋 t鑤, th╩ d� thu藅 luy謓 n c馻 C玭 L玭 c騨g r蕋 xu蕋 s綾, ch璦 nh藀 Л阯g m�  l藀 頲 2 c玭g tr筺g, Nh蕋 Ph萴 Л阯g c� 頲 nh﹏ t礽 nh� ngi, c遪 s� Чi T鑞g hay sao? Nh璶g Nh蕋 Ph萴 Л阯g x璦 nay ch� nh薾 ngi t礽, v� lu玭 tu﹏ th� quy t綾 o nhc l璾 cng.",
	"Уo nhc l璾 cng l� sao?",
	"Hi謓 nay c� r蕋 nhi襲 h祇 ki謙 v� l﹎ mu鑞 n v韎 Nh蕋 Ph萴 Л阯g, 琻g nhi猲 Nh蕋 Ph萴 Л阯g ta c騨g ph秈 ch鋘 l鵦 k� c祅g. Nay c� m閠 o ph筸 c馻 Чi T鑞g l� Di Tu i h竛 c騨g 產ng nh薾 th� th竎h nh藀 Л阯g,  頲 ph竔 n Quang Minh nh 甶襲 tra ng t躰h c馻 Minh gi竜. Ngi v� h緉, b鋘 ta ch� ch鋘 l蕐 1, trong c竎 ngi ch綾 ch緉 ph秈 c� m閠 ngi b� m筺g.",
	"Sao l筰 ph秈 c� m閠 ngi b� m筺g? Ta v� h緉 kh玭g th� c飊g nhau gia nh藀 Nh蕋 Ph萴 Л阯g sao?",
	}

	TalkEx("task_007_01_0_1",strTalk);

end

--续对话
function task_007_01_0_1()

local strTalk = {
	"N鵦 ci, Nh蕋 Ph萴 Л阯g u ph秈 l� n琲 t� n筺, ngi ng th� c� 輈h g� ch�? Gi鱝 ngi v� h緉 ph秈 tranh nhau danh hi謚 u Danh Tr筺g, n誹 ngi kh玭g gi誸 h緉, th� nh ng錳 i h緉 t韎 gi誸 ngi. Nh蕋 Ph萴 Л阯g x璦 nay kh玭g ch祇 n k� b筩 nhc, n誹 h緉 kh玭g b籲g ngi th� gi� l筰 l祄 g�? Ngc l筰, v韎 ngi c騨g v藋.",
	"Ra c� m閠 ngi ph秈 b� m筺g l� ch� cu閏 t祅 s竧 gi鱝 ta v� h緉, phng ph竝 o nhc l璾 cng n祔 qu� cao minh, nh璶g c騨g qu� t祅 nh蒼. Ta hi觰 r錳, 玭g c� i tin c馻 ta.",
	"Ha ha, t鑤, <sex> qu� nhi猲 s秐g kho竔, y s� l� th� th竎h cu鑙 c飊g c馻 ngi, Nh蕋 Ph萴 Л阯g 產ng r閚g c鯽 ch� n ngi .",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,32);
	TaskTip("Di Tu i h竛 產ng � Quang Minh nh, h穣 n  nh b筰 h緉  c� c竎h gia nh藀 Nh蕋 Ph萴 Л阯g.");
	Msg2Player("Di Tu i h竛 產ng � Quang Minh nh, h穣 n  nh b筰 h緉  c� c竎h gia nh藀 Nh蕋 Ph萴 Л阯g.");
end

--未打败虬须大汉对话
function task_007_01_1()

local strTalk = {
	"C� T� i h竛 hi謓 產ng � Quang Minh nh 甶襲 tra chuy謓 Minh gi竜, h穣 甧m th� c蕄 c馻 h緉 n g苝 ta, ngi s� l� th祅h vi猲 c馻 Nh蕋 Ph萴 Л阯g.",
	}

	TalkEx("",strTalk);

end

--完成第三个考验，与车轮对话加入一品堂
function task_007_02_0()

local strTalk = {
	"Di Tu i h竛  b� di謙, y l� th� c蕄 c馻 h緉, ta c� th� gia nh藀 Nh蕋 Ph萴 Л阯g r錳 ch�?",
	"Ha ha, th緉g r錳 �? <sex> qu� nhi猲 n╪g l鵦 si猽 ph祄. Ba th� th竎h  qua, kh玭g ng� tu鎖 tr� m� t礽 cao n v藋.? (Nh蕋 Ph萴 Л阯g hoan ngh猲h s� gia nh藀 c馻 ngi, gi� ngi l� th輈h kh竎h c馻 Nh蕋 Ph萴 Л阯g. Nh蕋 Ph萴 Л阯g t� ch鴆 nghi猰 minh, v� c莕 ph秈 th藅 c萵 tr鋘g khi h祅h s�. Ngi trong Nh蕋 ph萴 ng g苝 竚 hi謚 n祔, 総 s� t韎 gi髉 .)",
	"Ta nguy謓 c鑞g hi課 h誸 s鴆 m譶h.",
	"Ngi b� L鬰 Phi課 M玭 truy n�  l﹗, nh璶g ch� m閠 L鬰 Phi課 M玭 c醤 con v蒼 ch璦 x鴑g l� i th� c馻 b鋘 ta, sau n祔 ngi c� y猲 t﹎, gia nh藀 Nh蕋 Ph萴 Л阯g r錳 th� L鬰 Phi課 M玭 s� kh玭g th� l祄 phi襫 ngi n鱝. Ch� c莕 ngi t薾 trung v韎 Nh蕋 Ph萴 Л阯g, mai n祔 ph� qu� danh l頸 u trong t莔 tay. H穣 ngh� ng琲 , c� nhi謒 v� m韎 ta s� t譵 ngi.",
	"Л頲. Xin c竜 t�.",
	"(M蕋 kh玭g 輙 c玭g s鴆 m韎 v祇 頲 Nh蕋 Ph萴 Л阯g, ta ph秈 b竜 l筰 v韎  Dng ti襫 b鑙 m韎 頲. Kh玭g bi誸 thng t輈h c馻 Vi猲 B� kho竔 th� n祇 r錳, ta c騨g lo qu�, hay l� n nha m玭 trc v藋.)",
	}

	DelItem(2,0,697,1);--删去虬须大汉人头
	SetTask(TASK_XB_ID,34);
	TalkEx("",strTalk);
	TaskTip("дn nha m玭 ph� Ph鬾g Tng h醝 th╩ thng t輈h c馻 Vi猲 B� kho竔.");
	Msg2Player("дn nha m玭 ph� Ph鬾g Tng h醝 th╩ thng t輈h c馻 Vi猲 B� kho竔.");
	GivePlayerAward("Award_XB_15","Easy");
	GivePlayerExp(SkeyXibei,"disanjianshi")
	add_xb_title(2);--获得一品堂刺客称号
end

--未与凤翔捕头对话
function task_007_02_1()

local strTalk = {
	"Ngi  l� th祅h vi猲 c馻 b鎛 Л阯g, h穣 lui xu鑞g ngh� ng琲, l竧 sau s� c� nhi謒 v� m韎.",
	"(Kh玭g bi誸 thng t輈h c馻 Vi猲 B� kho竔 th� n祇 r錳, ta th藅 lo qu�, hay l� c� n nha m玭 m閠 chuy課.)",
	}

	TalkEx("",strTalk);

end

--与凤翔捕头对话询问袁飞云去向
function task_007_03_0()

local strTalk = {
	"V� b� u n祔 c� quen bi誸 Vi猲 Phi V﹏ Vi猲 B� kho竔 kh玭g?",
	"Vi猲 B� kho竔 l� tr� c閠 c馻 ph� nha n祔, b� u nha d辌h nh� b鋘 ta u r蕋 k輓h tr鋘g ngi, sao l筰 kh玭g bi誸 danh Vi猲 B� kho竔 ch�? <sex> n t譵 c� vi謈 g� kh玭g?",
	"Ta c� duy猲 k誸 giao v韎 Vi猲 b� u, 頲 bi誸 g莕 y huynh 蕐 b� thng, ta r蕋 lo, kh玭g bi誸 hi謓 gi� huynh 蕐 產ng � u?",
	"Vi猲 B� kho竔 th玭g minh, t礽 tr�, x璦 nay h祅h s� u r蕋 c萵 tr鋘g qu� 畂竛, kh玭g hi觰 sao l莕 n祔 l筰 s� �  ph筸 nh﹏ ch箉 tho竧, b秐 th﹏ c遪 b� thng. Nha m玭 v鑞 l� n琲 th� phi, nhi襲 k� ti觰 nh﹏ v鑞 kh玭g ph鬰 Vi猲 B� kho竔   d莡 v祇 l鯽, t﹗ v韎 tri襲 nh v� s� th蕋 tr竎h c馻 ngi, khi課 uy danh c馻 Vi猲 B� kho竔 gi秏 s髏 h糿.",
	}

	TalkEx("task_007_03_0_1",strTalk);

end

--续对话
function task_007_03_0_1()

local nMapName,nXpos,nYpos = SelectMapData(3);
local nTriggerID = Map_Data[GetTask(YUANFEIYUN_MAP_DATA_ID)][7];
local strTalk = {
	"Kh玭g ng� s� vi謈 l筰 l祄 kh� Vi猲 B� kho竔 n v藋.",
	"(C騨g t筰 ta,  l祄 li猲 l魕 Vi猲 B� kho竔, c遪  huynh 蕐 ch辵 t閕 th蕋 tr竎h. Vi猲 B� kho竔 v� ta b蘯 nc tng ph飊g, nh璶g l筰 ch﹏ th祅h gi髉  ta, kh玭g t輓h to竛 thi謙 h琻, ng l� m閠 ngi t鑤 hi誱 c�.)",
	"ng v藋, b鋘 ta c騨g tng Vi猲 B� kho竔 s� an t﹎ t辬h dng m閠 th阨 gian, kh玭g ng� ch� v礽 ng祔 sau, ngi  l猲 阯g n "..nMapName.."("..nXpos..", "..nYpos..") b総 t閕 ph筸, nha m玭 tr猲 di u t� h祇 v� ngi. N誹 <sex> nh 甶 t譵 Vi猲 B� kho竔, phi襫 a gi髉 chai L鬰 Phi課 M玭 thng dc n祔 cho ngi, b鋘 ta u r蕋 lo l緉g cho thng t輈h c馻 Vi猲 B� kho竔.",
	"ng kh竎h s竜, ta nh蕋 nh s� a thu鑓 n祔 n tay Vi猲 V﹏ Phi. C竜 t�.",
	}

	TalkEx("",strTalk);
	AddItem(2,0,749,1,1);--得到六扇门伤药
	SetTask(TASK_XB_ID,35);
	CreateTrigger(2,nTriggerID,RECT_XB_YUANFEIYUN);--地图触发器
	TaskTip("дn "..nMapName.."("..nXpos..", "..nYpos..") a thu鑓 c馻 L鬰 Phi課 M玭 cho Vi猲 V﹏ Phi.");
	Msg2Player("дn "..nMapName.."("..nXpos..", "..nYpos..") a thu鑓 c馻 L鬰 Phi課 M玭 cho Vi猲 V﹏ Phi.");

end

--尚未与袁飞云对话（补发触发器）
function task_007_03_1()

local nMapDataID = GetTask(YUANFEIYUN_MAP_DATA_ID);
local nMapName = Map_Data[nMapDataID][1];
local nXpos,nYpos = Map_Data[nMapDataID][5],Map_Data[nMapDataID][6];
local nTriggerID = Map_Data[nMapDataID][7];
local strTalk = {
	"Vi猲 B� kho竔  t韎 "..nMapName.."("..nXpos..", "..nYpos..") l祄 vi謈, n誹 ngi 甶 t譵 ngi. Xin 甧m L鬰 Phi課 M玭 thng dc n祔 theo, y l� t蕀 l遪g c馻 c竎 huynh  trong nha m玭.",
	}

	TalkEx("",strTalk);

	if GetItemCount(2,0,749) < 1 then
		AddItem(2,0,749,1,1);--得到六扇门伤药
	end

	if GetTrigger(RECT_XB_YUANFEIYUN) == 0 then
		CreateTrigger(2,nTriggerID,RECT_XB_YUANFEIYUN);
		TaskTip("дn "..nMapName.."("..nXpos..", "..nYpos..") a thu鑓 c馻 L鬰 Phi課 M玭 cho Vi猲 V﹏ Phi.");
		Msg2Player("дn "..nMapName.."("..nXpos..", "..nYpos..") a thu鑓 c馻 L鬰 Phi課 M玭 cho Vi猲 V﹏ Phi.");
	end

end

--与袁飞云对话送与伤药
function task_007_07_0()

local strTalk = {
	"дn nha m玭 頲 bi誸 Vi猲 B� kho竔 thng t輈h ch璦 l祅h,  b玭 ba c玭g vi謈, trong l遪g r蕋 lo l緉g, n猲 n th╩, c竎 b� u trong nha m玭 c騨g nh� ta mang thu鑓 tr� thng cho ngi. Vi猲 B� kho竔 h誸 l遪g gi髉 , nh璶g ta l筰 l祄 li猲 l魕 n ngi, th藅 竬 n竬.",
	"<sex> c遪 nh� ta t鮪g b秓, mong 頲 c飊g nhau u鑞g ru t﹎ s�? Kh玭g ti誧 b籲g h鱱 n ca, ch� ti誧 tri ﹎ 輙 醝, sinh t� l� chuy謓 nh�, ch� 產u v� tri k� kh� c莡. Huynh v� ta b蘯 nc tng ph飊g, nh璶g l筰 th﹏ thi誸 nh� c� nh﹏. Gi髉  b籲g h鱱 l� ni襪 vui c馻 ta, huynh kh玭g c莕 竬 n竬 l祄 g�.",
	"Nh璶g chung quy ta v蒼 khi課 huynh b� tr鋘g thng, c遪 ph秈 ch辵 oan 鴆. Vi猲 huynh i x� v韎 ta ch﹏ th祅h, nh璶g ta ch璦 h糿  b竜 p 頲 t蕀 l遪g, ta th蕐 r蕋 kh� x�.",
	"V誸 thng v苩 n祔 c� ng g�. Nam nhi n ch誸 tim v蒼 nh� s総 , ung dung th秐 nhi猲, ch髏 thng t輈h c� l� g�. H琻 n鱝 chuy謓 nc nh�, trc nay ch� ph﹏ bi謙 ng l祄 v� kh玭g ng l祄, n祇 c� ph﹏ th藅 gi� ng sai? Ta ch� l祄 nh鱪g vi謈 ta cho l� x鴑g ng, v� d鑓 h誸 s鴆 v� n�. L阨 n鉯 d蘭 pha b鉵g gi�, 蕐 l� h祅h ng c馻 ti觰 nh﹏, ng n猲 b薾 t﹎. Huynh c騨g ng n猲  b鬾g, ngi l祄 i s� kh玭g c﹗ n� ti觰 ti誸.",
	"Vi猲 B� kho竔 t蕀 l遪g bao dung r閚g m�, th藅 khi課 ngi ta kh﹎ ph鬰, ch� tr竎h Vi猲 B� kho竔 l筰 頲 giang h� t玭 tr鋘g n v藋. Mong r籲g s� vi謈 kh玭g g﹜ 秐h hng l韓 n danh ti課g c馻 ngi.",
	}

	TalkEx("task_007_07_0_1",strTalk);

end

--续对话
function task_007_07_0_1()

local strTalk = {
	"Sao <sex> l筰 n鉯 v藋? Hai ta u lo l緉g cho v薾 m謓h nc nh�, <sex> v� c鴘 b� t竛h m� cam t﹎ d蕁 th﹏ v祇 long m huy謙 h�, b� ngo礽 tai nh鱪g l阨 m緉g nhi誧 ph秐 qu鑓 ngh辌h th莕. Xin ng qu� b薾 t﹎ v� vi謈 n祔.",
	"N╩ x璦 ta c騨g t鮪g l祄 n閕 gi竛 cho ph� nha, bi誸 r� l祄 n閕 gi竛 n誹 kh玭g c� d騨g kh� v� � ch� ki猲 nh th� kh玭g th� duy tr� n ph髏 cu鑙. Kh玭g nh鱪g ph秈 t� nh綾 nh� kh糿g nh l藀 trng c馻 m譶h, c遪 ph秈 r閚g lng b蕋 ch蕄 nh鱪g l阨 d蘭 pha, c祅g ph秈 i m苩 v韎 nhi襲 quy誸 nh kh� kh╪, ti課 tho竔 lng nan. <sex> c莕 h誸 s鴆 th薾 tr鋘g, n緈 甶觤 y誹  d� d祅g i ph� v韎 k� th�.",
	"Ngay t� u ta  nh薾 th鴆 gi竛 甶謕 l� m閠 th� th竎h r蕋 l韓. Tuy c騨g lo s鴆 ta kh玭g  g竛h v竎, nh璶g sau khi nghe l阨 t﹎ s� c馻 Vi猲 B� kho竔, ta quy誸 d鑓 h誸 s鴆 m譶h,  kh玭g th裯 v韎 l遪g.  t� nh鱪g l阨 v祅g ng鋍 c馻 Vi猲 B� kho竔, ta xin kh綾 ghi trong l遪g.",
	"V藋 l� t鑤 r錳, ta tin tng nh薾 x衪 c馻 Trng Ca m玭, v� c騨g tin v祇 con m総 c馻 ch輓h m譶h, <sex> s� l祄 n猲 i nghi謕. Sau n祔 n誹 c莕 g�, ta s� gi髉  h誸 m譶h. Nay ta c遪 nhi襲 c玭g v�. Xin c竜 t�.",
	"(Vi猲 B� kho竔 t韎 lui nh� gi�, b玭 ba v� chuy謓 thi猲 h�, ng l� thi誸 huy誸 產n t﹎. C� th� k誸 giao v韎 m閠 lng s� 輈h h鱱 nh� th�, ng l� kh玭g u鎛g cu閏 i. C� l� ta n猲 tr� v� ch� Xa Lu﹏ B� Vng,  xem nhi謒 v� m韎 l� g�.)",
	}

	DelItem(2,0,749,1);--删除六扇门伤药;
	TalkEx("task_007_07_1",strTalk);
	SetTask(TASK_XB_ID,36);
	TaskTip("дn ch� Xa Lu﹏ B� Vng, b総 u h祅h ng gi竛 甶謕 c馻 m譶h t筰 Nh蕋 Ph萴 Л阯g!");
	Msg2Player("дn ch� Xa Lu﹏ B� Vng, b総 u h祅h ng gi竛 甶謕 c馻 m譶h t筰 Nh蕋 Ph萴 Л阯g!");
	GivePlayerAward("Award_XB_16","Easy");
	GivePlayerExp(SkeyXibei,"tiexueernv")
end



--与袁飞云对话回调删除Npc
function task_007_07_1()

	SetNpcLifeTime(GetTask(YUANFEIYUN_NPCINDEX),0);--让Npc消失
	SetNpcScript(GetTask(YUANFEIYUN_NPCINDEX),"");--脚本置空

end

---------------------------------- 西北区08棋逢敌手----------------------------------
--与车轮霸王对话领取一品堂任务
function task_008_01_0()

local strTalk = {
	"L� th祅h vi猲 c馻 Nh蕋 Ph萴 Л阯g, ngi ph秈 lu玭 ghi nh� Л阯g quy, ph鬰 t飊g m謓h l謓h thng c蕄, tuy謙 i kh玭g 頲 ph筸 thng, m鋓 vi謈 ph秈 t l頸 輈h c馻 b鎛 Л阯g l猲 u, th� t薾 trung v韎 b鎛 Л阯g. N誹 ngi c� � ph秐 ngh辌h, k誸 c鬰 ch� c� m閠 con 阯g ch誸, r� ch璦?",
	"Ta hi觰, Nh蕋 Ph萴 Л阯g  cho ta m閠 ch鑞 dung th﹏, ta quy誸 d鑓 s鴆 ph鬾g s� b鎛 Л阯g!",
	"T鑤, v韎 t礽 tr� v� th﹏ th� c馻 ngi, tin r籲g s� kh玭g ph� k� v鋘g c馻 ta. T閏 T﹜ H� chu閚g v�, Nh蕋 Ph萴 Л阯g ta l� th竛h a v� h鋍, ngay c� T﹜ H� е nh蕋 d騨g s� c騨g � trong h祅g ng� c馻 Nh蕋 Ph萴 Л阯g, ngi n祔 l� Th竎 B箃 Ho籲g, v� c玭g si猽 vi謙, v� ch T﹜ H� nhi襲 n╩ li襫, l� m穘h tng 頲 ch th﹏ L� Nguy猲 Kh竛h i nh﹏ chi猽 m�.",
	"L� Nguy猲 Kh竛h i nh﹏ ph秈 ch╪g ch輓h l� ngi t鎛g ph� tr竎h  頲 nh綾 t韎 trong m藅 h祄? L莕 n祔 玭g ta c騨g t韎 Ph鬾g Tng ph� �?",
	}

	TalkEx("task_008_01_0_1",strTalk);

end

--续对话
function task_008_01_0_1()

local strTalk = {
	"ng v藋, l莕 n祔 c� L� i nh﹏ ch� tr� i c鬰, ngi c� y猲 t﹎ h祅h s�. Nh璶g nh鱪g vi謈 kh玭g n猲 h醝 th� t鑤 nh蕋 ngi ng l緈 甶襲. Hi謓 nay Th竎 B箃 Ho籲g ph鬾g l謓h 甶襲 tra chuy謓 Quang Minh nh c馻 Minh gi竜, Minh gi竜 m蕐 n╩ trc v蒼 r蕋 bi誸 甶襲, thng h頿 t竎 v韎 b鎛 Л阯g, nh璶g nay th� kh竎 r錳, c� d蕌 hi謚 ch鑞g i ta. Ngi h穣 t韎 Ph鬾g Tng ph� t譵 Th竎 B箃 Ho籲g, xem h緉 c� sai b秓 g� kh玭g.",
	"Nh璶g Th竎 B箃 Ho籲g ph� tr竎h 甶襲 tra Quang Minh nh, sao gi� l筰 xu蕋 hi謓 � Ph鬾g Tng?",
	"H�, Th竎 B箃 Ho籲g v� c玭g tuy謙 nh, tuy l� ngi c馻 Nh蕋 Ph萴 Л阯g, nh璶g l筰 kh玭g t薾 t﹎ cho nc nh�, ch� th輈h t譵 ki誱 i th� so t礽 v� ngh�, n誹 h緉 kh玭g 甶猲 kh飊g nh� v藋, ch綾 gi�  leo n v� tr� th鑞g l躰h Nh蕋 Ph萴 Л阯g r錳. Ch綾 � Ph鬾g Tng h緉 l筰 g苝 m閠 cao th� g� , khi課 b� b� c� nhi謒 v�.",
	"Ra v藋, ngh� l筰 c竎 cao nh﹏ u t輓h t譶h k� qu竔, ngi ngo礽 kh玭g th� 畂竛 bi誸 頲. Ta xin c竜 t�.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,37);
	TaskTip("дn Ph鬾g Tng, h醝 Th竎 B箃 Ho籲g v� ti課 tri觧 nhi謒 v� 甶襲 tra � Quang Minh nh.");
	Msg2Player("дn Ph鬾g Tng, h醝 Th竎 B箃 Ho籲g v� ti課 tri觧 nhi謒 v� 甶襲 tra � Quang Minh nh.");

end

--尚未与拓拔弘对话
function task_008_01_1()

local strTalk = {
	"Th竎 B箃 Ho籲g hi謓 產ng � Ph鬾g Tng ph�, ngi n t譵 h緉, xem h緉 c� c莕 gi髉  kh玭g.",
	}

	TalkEx("",strTalk);

end

--与拓拔弘对话得到一品堂秘药
function task_008_02_0()

local strTalk = {
	"Chi猽 th鴆 c馻 h緉 tho箃 nh譶 c� v� nh箃 nh蟧, nh璶g chi猽 th鴆 h頿 v韎 t﹎ tr筺g ngi c莔 ki誱, bi課 h鉧 產 d筺g l筰 th鑞g nh蕋, bi誸 ph� gi秈 nh� th� n祇 y?",
	"C竎 h� c� ph秈 Th竎 B箃 Ho籲g ti襫 b鑙? Xa Lu﹏ B� Vng sai t筰 h� n y t譵 玭g!",
	"� � ng v藋. Ra l� ngi c馻 b鎛 Л阯g, Xa Lu﹏ B� Vng ph竔 ngi t韎 sao? L筰 h鑙 th骳 v� nhi謒 v� � Quang Minh nh ch� g�? Ngi v� b竜 l筰 v韎 Xa Lu﹏, ta bi誸 ph秈 l祄 g�, kh玭g c莕 h緉 h鑙 th骳 ch� o. Kh鬰... kh鬰�",
	"Xa Lu﹏ B� Vng kh玭g c� � h鑙 th骳 B筺, 玭g 蕐 b秓 t筰 h� n tr� gi髉 B筺 c飊g 甶襲 tra Quang Minh nh. Nh璶g ti襫 b鑙 dng nh� 產ng b� thng th� ph秈? Ti襫 b鑙 v� c玭g c竔 th�, ch糿g l� l� b� nh l衝?",
	"(C� v� nh� 玭g ta r蕋 ch竛 gh衪 nhi謒 v� m� Nh蕋 Ph萴 Л阯g giao cho, c遪 Nh蕋 Ph萴 Л阯g c騨g c� v� h誸 nh蒼 n筰 v韎 h緉.)",
	"Ha ha, <sex> n鉯 v藋 l� sai r錳. Ngi h鋍 v� kh玭g c� c竔 thuy誸 c竔 th� si猽 ph祄, v� h鋍 c騨g kh玭g ph﹏ chia m筺h y誹, k� m筺h ng th阨 c騨g bao h祄 m閠 tr竔 tim y誹 畊鑙, b� l筰 k� y誹 l筰 thng c� c� th� m筺h m�. C竔 s� trong thi猲 h�, b総 u t� u s� k誸 th骳 t筰 . s� cao th蕄 trong v� h鋍 n鉯 ng h琻 ch輓h l� s� cao th蕄 c馻 c竔 t﹎ ngi h鋍 v�.",
	}

	TalkEx("task_008_02_0_1",strTalk);

end

--续对话
function task_008_02_0_1()

local strTalk = {
	"L阨 n鉯 c馻 ti襫 b鑙 � ngh躠 s﹗ xa, c� th� gi秈 th輈h v� s� m筺h y誹 c馻 v� h鋍 nh� th�, ng l� m閠 l� lu薾 uy猲 th﹎.",
	"�? Ngi hi觰 ta mu鑞 n鉯 g� th藅 sao?",
	"Ngi ch琲: C� g� kh� u ch�. C騨g v� nh� c竎 chi猽 th鴆 v� c玭g, kh� ph竧 ra th� hi謓 trong c竎 chi猽 th鴆, nh璶g b秐 th﹏ chi猽 th鴆 kh玭g chia m筺h y誹, cao th� xu蕋 chi猽 c� v� nh� kh玭g c� s� h�,甶觤 m筺h nh蕋 v� 甶觤 y誹 nh蕋 thng 頲 t chung v韎 nhau, cao th� ch� c� gi蕌 甶觤 y誹 chi猽 th鴆. Do  trc khi bi課 h鉧 xu蕋 chi猽, ch綾 ch緉 s�  l� s� h�, ch輓h s� h� n祔 s� quy誸 nh s� cao th蕄",
	"Ha ha, c� l� c� l�, v� ngh� v� chi猽 th鴆 v鑞 c飊g m閠 g鑓, kh玭g ng� ki課 th鴆 v� h鋍 c馻 <sex> c騨g kh玭g t錳, l筰 c� thi猲 ph�. N祇, ch髇g ta so t礽 m閠 phen. Kh鬰 kh鬰�",
	"T筰 h� ch� xu玦 theo l� lu薾 c馻 ti襫 b鑙 m� n鉯 b鮝 v藋 th玦, ch� v� h鋍 c馻 t筰 h� ch� m韎 giai 畂筺 nh藀 m玭, u d竚 so t礽 c飊g ti襫 b鑙. H琻 n鱝 ti襫 b鑙 產ng b� thng, t筰 h� ph秈 gi髉 ngi tr� thng trc m韎 ph秈.",
	}

	TalkEx("task_008_02_0_2",strTalk);

end

--续对话
function task_008_02_0_2()

local strTalk = {
	"Ngi kh竎h s竜 qu�. Nh璶g sau n祔 ta s� c遪 nhi襲 c� h閕 so t礽 v韎 nhau. V誸 thng c馻 ta kh玭g ng ng筰, do h玬 trc t� th� m閠 ng祔 m閠 m v韎 T� M� Minh Phongn猲 m韎 v藋. T� ng祔 xu蕋 o n nay, ta ch璦 t鮪g 頲 nh m閠 tr薾 s秐g kho竔 n v藋, h琻 n鱝 c遪 b蕋 ph﹏ th緉g b筰. Ta ngh� ch綾 h緉 c騨g  b� thng, <sex> c� v� nh� l� ngi T鑞g, h穣 gi髉 ta a Nh蕋 Ph萴 Л阯g M藅 dc n祔 cho h緉, v� dng nh� h緉 h琲 ph秐 c秏 v韎 ngi T﹜ H�.",
	"Theo nh� l阨 ti襫 b鑙, T� M� Minh Phong l� m閠 ngi H竛, kh玭g bi誸 gi� h緉 產ng � u?",
	"H緉 v蒼 c遪 � trong Ph鬾g Tng ph�, ta v� h緉 v蒼 ch璦 ph﹏ th緉g b筰, ch� l� t筸 th阨 ngh� ng琲, sao c� th� b� 甶 頲? M閠 i th� c﹏ s鴆 nh� th� u ph秈 d� g苝. Ngi mau a thu鑓 t韎 cho h緉, ng th阨 gi髉 ta h裯 ng祔 giao u ti誴.  mau 甶, ta c遪 ph秈 suy ngh� c竎h ph� gi秈 chi猽 th鴆 c馻 h緉, bi課 h鉧 c馻 chi猽 th鴆 ph秈 k誸 h頿 頲 甶觤 m筺h nh蕋 v� y誹 nh蕋, ch� l� khi bi課 h鉧 c騨g l� l骳  l� s� h�...",
	"厖厖�.",
	"(Xem ra Th竎 B箃 Ho籲g  b� ngo礽 tai nhi謒 v� c馻 Nh蕋 Ph萴 Л阯g r錳. T� M� Minh Phong kia l� th莕 th竛h phng n祇? N誹 h緉 l� ngi T鑞g, m閠 cao nh﹏ nh� th� sao giang h� l筰 kh玭g nghe danh t竛h v藋?)",
	}

	TalkEx("",strTalk);
	AddItem(2,0,698,1,1);--一品堂秘药
	SetTask(TASK_XB_ID,38);
	TaskTip("Gi髉 Th竎 B箃 Ho籲g 甧m M藅 dc Nh蕋 Ph萴 Л阯g n cho T� M� Minh Phong, ng th阨 chi猰 ngng phong th竔 c馻 v� i hi謕 n祔.");
	Msg2Player("Gi髉 Th竎 B箃 Ho籲g 甧m M藅 dc Nh蕋 Ph萴 Л阯g n cho T� M� Minh Phong, ng th阨 chi猰 ngng phong th竔 c馻 v� i hi謕 n祔.");
	GivePlayerExp(SkeyXibei,"xixiayongshi")
end

--尚未与司马鸣风对话
function task_008_02_1()

local strTalk = {
	"Ta 畂竛 T� M� Minh Phong c騨g  b� thng, gi� ch綾 h緉 v蒼 c遪 � trong Ph鬾g Tng ph�. H穣 gi髉 ta a Nh蕋 Ph萴 Л阯g M藅 dc n祔 cho h緉, ng th阨 gi髉 ta h裯 ng祔 giao u ti誴. mau 甶, ta c遪 ph秈 suy ngh� c竎h ph� gi秈 chi猽 th鴆 c馻 h緉, bi課 h鉧 c馻 chi猽 th鴆 ph秈 k誸 h頿 頲 甶觤 m筺h nh蕋 v� y誹 nh蕋, ch� l� khi bi課 h鉧 c騨g l� l骳  l� s� h�...",
	}

	TalkEx("",strTalk);

end

--与司马鸣风对话删去一品堂秘药
function task_008_03_0()

local strTalk = {
	"Ti襫 b鑙 c� ph秈 l� T� M� Minh Phong?",
	"T筰 h� ch輓h l� T� M� Minh Phong, sao <sex> l筰 bi誸 t筰 h�?",
	"Th竎 B箃 Ho籲g ti襫 b鑙  n鉯 v韎 t筰 h�, hai ngi so t礽 su鑤 m閠 ng祔 m閠 m, e l� ti襫 b鑙 c騨g  b� thng, y l� Nh蕋 Ph萴 Л阯g M藅 dc m� 玭g 蕐 nh� t筰 h� 甧m n t苙g.",
	"Giang h� phi猽 b箃, thuy襫 nan ngc xu玦, ai bi誸 u l� thi猲 阯g? T筰 h� nhi襲 n╩ kh玭g h祅h t萿 giang h�, kh玭g ng� l筰 thay i nhi襲 n v藋, h鉧 ra T﹜ H� c騨g l� n琲 ng鋋 h� t祅g long, g苝 m閠 i th� nh� Th竎 B箃 Ho籲g ta ch糿g c遪 g�  h鑙 ti誧. Kh玭g ng� h緉 h祅h s� l鏸 l筩, c遪 cho th� h� n t苙g thu鑓, ng l� m閠 t猲 h秓 h竛, ch� ng ti誧 l筰 l� ngi c馻 Nh蕋 Ph萴 Л阯g.",
	}

	TalkEx("task_008_03_0_1",strTalk);

end

--续对话
function task_008_03_0_1()

local strTalk = {
	"Th竎 B箃 ti襫 b鑙 c騨g h誸 l阨 khen ng頸 v� ngh� c馻 T� M� ti襫 b鑙, n鉯 ngi l� i th� c﹏ s鴆 nh蕋 t� trc n nay, ng th阨 c遪 d苙 t筰 h� h裯 th阨 gian so t礽 l莕 t韎.",
	"Ha ha, y c騨g ch輓h l� mong mu鑞 c馻 t筰 h�. Ta v鑞 kh玭g thi謓 c秏 v韎 ngi T﹜ H�, nh璶g g苝 頲 Th竎 B箃 Ho籲g  khi課 ta thay i suy ngh� v� T﹜ H� Nh蕋 Ph萴 Л阯g. <sex> l� ngi T鑞g, sao l筰 ph鬾g s� cho Nh蕋 Ph萴 Л阯g? Nh璶g y l� chuy謓 ri猲g t� c馻 c竎 h�, ta c騨g kh玭g ti謓 h醝.  t� thng dc c馻 c竎 h�. Xin chuy觧 l阨 n Th竎 B箃 Ho籲g, ta s� n ng h裯.",
	"Kh玭g l祄 phi襫 ti襫 b鑙 tr� thng n鱝, ta s� chuy觧 l阨 n Th竎 B箃 ti襫 b鑙. Xin c竜 t�.",
	"(, l阨 nh綾 nh� c馻 Vi猲 V﹏ Phi qu� nhi猲  鴑g nghi謒, ta c莕 ph秈 c� d騨g kh�  i m苩 v韎 s� hi觰 l莔 c馻 ngi i. T� M� Minh Phong ╪ n鉯 nh c, n╩ x璦 h糿 l� m閠 nh﹏ v藅 l頸 h筰, c� l� n猲 甶 t譵  Dng H鋋 ti襫 b鑙  h醝 cho r�.)",
	}

	TalkEx("",strTalk);
	DelItem(2,0,698,1);--一品堂秘药
	SetTask(TASK_XB_ID,39);
	CreateTrigger(4,210,TALK_XB_OUYANGHUA);
	TaskTip("Chuy觧 l阨 n Th竎 B箃 Ho籲g, ng th阨 甶 t譵  Dng H鋋 ti襫 b鑙 h醝 th╩ v� T� M� Minh Phong.");
	Msg2Player("Chuy觧 l阨 n Th竎 B箃 Ho籲g, ng th阨 甶 t譵  Dng H鋋 ti襫 b鑙 h醝 th╩ v� T� M� Minh Phong.");
	GivePlayerAward("Award_XB_17","Easy");
	GivePlayerExp(SkeyXibei,"dishou")
end

--尚未与欧阳画或拓拔弘对话
function task_008_03_1()

local strTalk = {};

	--未与欧阳画对话
	if GetTask(TASK_XB_ID_01) ~= 0 then
		strTalk = {
			"(T� M� Minh Phong ╪ n鉯 nh c, n╩ x璦 h糿 l� m閠 nh﹏ v藅 l頸 h筰, ta n猲 甶 t譵  Dng H鋋 ti襫 b鑙  h醝 cho r�.)"
				}
		--补发欧阳画对话触发器
		if GetTrigger(TALK_XB_OUYANGHUA) == 0 then
			CreateTrigger(4,210,TALK_XB_OUYANGHUA);
			TaskTip("T譵  Dng H鋋 h醝 v� T� M� Minh Phong.");
			Msg2Player("T譵  Dng H鋋 h醝 v� T� M� Minh Phong.");
		end
		TalkEx("",strTalk);
	--未与拓拔弘对话
	elseif GetTask(TASK_XB_ID_02) ~= 0 then
		strTalk = {
			" t� thng dc c馻 c竎 h�. Xin chuy觧 l阨 n Th竎 B箃 Ho籲g, ta s� n ng h裯.",
				}
		TalkEx("",strTalk);
	--未与欧阳画&未与拓拔弘对话
	else
		 strTalk = {
		 	" t� thng dc c馻 c竎 h�. Xin chuy觧 l阨 n Th竎 B箃 Ho籲g, ta s� n ng h裯.",
			"(T� M� Minh Phong ╪ n鉯 nh c, h糿 l� m閠 nh﹏ v藅 l頸 h筰, ta n猲 甶 t譵  Dng H鋋 ti襫 b鑙  h醝 cho r�.)",
			}
		--补发欧阳画对话触发器
		if GetTrigger(TALK_XB_OUYANGHUA) == 0 then
			CreateTrigger(4,210,TALK_XB_OUYANGHUA);
			TaskTip("T譵  Dng H鋋 h醝 v� T� M� Minh Phong.");
			Msg2Player("T譵  Dng H鋋 h醝 v� T� M� Minh Phong.");
		end
	end

	TalkEx("",strTalk);

end

-----------------------------------------分支1开始----------------------------------------------------------------
---------------------------------- 西北区09分支1_1光明左使----------------------------------
--代司马鸣风转告拓拔弘伤药已收到
function task_009_01_0()

local strTalk = {
	"Ti襫 b鑙, ta  n g苝 T� M� Minh Phong, v誸 thng c馻 玭g 蕐 kh玭g ng ng筰, 玭g 蕐 c騨g r蕋 mong 頲 c飊g ti襫 b鑙 so t礽 l莕 n鱝, i khi c� hai  l祅h h糿, 玭g 蕐 s� n ng h裯.",
	"Ta kh玭g nh譶 l莔 T� M� Minh Phong, h緉 c騨g l� m閠 ngi c� tinh th莕 v� h鋍.  t� <sex>  gi髉 ra x� l� vi謈 ri猲g, ngi c馻 Nh蕋 Ph萴 Л阯g u c� b秐 ch蕋 t� t� t� l頸, th輈h tranh gi祅h quy襫 l鵦, nh鱪g ngi nhi謙 t譶h gi髉  ngi kh竎 nh� ngi qu� l� r蕋 hi誱.",
	"Ti襫 b鑙 qu� l阨. Ti襫 b鑙 v� T� M� Minh Phong d飊g v� k誸 giao, v� lo l緉g cho thng t輈h c馻 b籲g h鱱 m� 甧m t苙g thu鑓 qu�, t筰 h� ch� gi髉  i ch髏, ti襫 b鑙 xin ng kh竎h s竜.",
	"Ha ha, kh玭g gi蕌 g� ngi, ta v� T� M� Minh Phong kh玭g ph秈 b籲g h鱱, c騨g ch糿g ph秈 i ch, h緉 l� nh﹏ t礽 m� Nh蕋 Ph萴 Л阯g 產ng mu鑞 chi猽 m�. Nh璶g dng nh� h緉 kh玭g th輈h ngi T﹜ H�, m韎 nghe n鉯 ta n t� T﹜ H� Nh蕋 Ph萴 Л阯g, mu鑞 chi猽 m� h緉,  t� � kh� ch辵 r錳 c� hai quy誸 u b蕋 ph﹏ th緉g b筰. Quy nh c馻 Nh蕋 Ph萴 Л阯g l� n誹 kh玭g chi猽 m� 頲, th� ph秈 tr� kh� 甶. T� M� Minh Phong kh玭g mu鑞 gia nh藀, n猲 h緉 kh玭g nh鱪g kh玭g ph秈 l� b籲g h鱱, m� c遪 l� k� ch.",
	}

	TalkEx("task_009_01_0_1",strTalk);

end

--续对话
function task_009_01_0_1()

local strTalk = {
	"Ra l� v藋, nh璶g ti襫 b鑙 kh玭g nh鱪g kh玭g tr� kh� h緉, tr竔 l筰 c遪 t苙g thu鑓 tr� thng. Ch糿g l� ti襫 b鑙 kh玭g s� Nh蕋 Ph萴 Л阯g tr竎h t閕 sao?",
	"<sex> v� ta c� duy猲, � ngi c� lu錸g ch輓h kh� kh竎 h糿 v韎 m鋓 ngi, n猲 ta b蕋 gi竎 th� l� nhi襲 甶襲. Th藅 ra vi謈 ta gia nh藀 Nh蕋 Ph萴 Л阯g c騨g kh� d礽 d遪g, v韎 ta, cu閏 i ng緉 ng駃, � ngh躠 cu閏 i ch輓h l� t譵 頲 i th� so t礽 v� ngh�. Hu鑞g h� s鴆 ta c騨g kh玭g th� ti猽 di謙 頲 h緉, v藋 th� c� t閕 g� ch�? C遪 n誹 L� Nguy猲 Kh竛h mu鑞 tr竎h t閕, th� c�  h緉 甶 t譵 cao th� kh竎 v藋.",
	"Ti襫 b鑙 ng l� k� l�, h祅h s� ph鉵g t髇g l筰 th糿g th緉 kho竛g t, kh玭g c﹗ n� chuy謓 頲 m蕋.",
	"(Quan h� gi鱝 Th竎 B箃 Ho籲g v� L� Nguy猲 Kh竛h dng nh� kh玭g 頲 b譶h thng, a v� c馻 h緉 cao h琻 c� Th藀 i Kim cang, tr鵦 ti誴 nghe l謓h c馻 L� Nguy猲 Kh竛h, nh璶g l筰 l� k� si v�, d飊g v� ngh� k誸 giao b籲g h鱱 l筰 t� ra quang minh l鏸 l筩, ng l� b薱 anh h祇 hi誱 c� trong Nh蕋 Ph萴 Л阯g.)",
	}

	TalkEx("task_009_01_0_2",strTalk);

end

--续对话
function task_009_01_0_2()

local strTalk = {
	"Ha ha, k� nh﹏ th� kh玭g d竚, ch糿g qua l� t猲 qu竔 nh﹏ kh玭g nh譶 th蕌 v� o, l筰 th輈h ki誱 chuy謓 nh nhau th玦. Tuy ta thng ph韙 l� nhi謒 v�, nh璶g i v韎 k� m韎 gia nh藀 m玭 ph竔 nh� ngi, ho祅 th祅h nhi謒 v� kh玭g nh鱪g gi髉 ngi tr� v鱪g trong Л阯g, c遪 l� c� h閕 th╪g ti課. L莕 n祔 Minh gi竜 tr飊g h璶g Quang Minh nh, L� Nguy猲 Kh竛h  s韒 c� s� nghi ng�, c秏 th蕐 Minh gi竜 c遪 ﹎ m璾 n祇 kh竎. Nh璶g ta l筰 kh玭g h鴑g th� v韎 vi謈 n祔, n誹 kh玭g v� h緉 nh� v�, ta c騨g ch糿g th蘭 nh髇g tay v祇.",
	"T鎛g n Minh gi竜 dng nh� 頲 t � Tuy襫 Ch﹗, t筰 sao l筰 ng祅 d苖 xa x玦 n v飊g hoang v緉g n祔  x﹜ d鵱g c╪ c�?",
	"Зy ch輓h l� m鬰 ch c馻 nhi謒 v� l莕 n祔. G莕 y ta ch譵 m trong chuy謓 T� M� Minh Phong, l祄 nhi謒 v� n祔 b� g竎 l筰. дn nay ch� bi誸 頲 ngi ph� tr竎h x﹜ d鵱g l� Quang Minh t� s�  Minh c馻 Minh gi竜. V藋 甶, ngi thay ta n Quang Minh nh, coi nh� y l� nhi謒 v� u ti猲 sau khi nh藀 Л阯g. Nghe n鉯  Minh h秓 ru, ngi h穣 b総 tay t� y, c� th� s� t譵 ra manh m鑙 n祇 .",
	"T筰 h� s� gi髉 ti襫 b鑙 x� l� vi謈 n祔, ti襫 b鑙 c� y猲 t﹎ 鴑g chi課.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,1);
	--if GetTask(TASK_XB_ID_02) == 1 then
		SetTask(TASK_XB_ID,40);--关闭08任务面板
	--end
	TaskTip("дn Quang Minh nh th╩ d� ng t躰h Minh gi竜 t� ngu錸 Quang Minh t� s� -  Minh.");
	Msg2Player("дn Quang Minh nh th╩ d� ng t躰h Minh gi竜 t� ngu錸 Quang Minh t� s� -  Minh.");
	GivePlayerExp(SkeyXibei,"mingjiao")
end

--未与殷铭对话
function task_009_01_1()

local strTalk = {
	"Ngi ph� tr竎h tr飊g tu Quang Minh nh l� Quang Minh t� s�  Minh c馻 Minh gi竜.  Minh h秓 ru, ngi c� th� khai th竎 甶觤 n祔 c馻 h緉  thu th藀 th玭g tin. Gi� y  Minh 產ng c� m苩 tr猲 Quang Minh nh.",
	}

	TalkEx("",strTalk);

end

--与殷铭对话帮收集波斯葡萄酒
function task_009_02_0()

local strTalk = {
	" Kh竔 琻g d� khang, 璾 t� nan vong, h� d� gi秈 璾, duy h鱱  khang. Thi猲 h� anh h飊g h祇 kh�, th飝 d� c閚g 萴 ng xng?",
	"T筰 h� 甶 ngang Quang Minh nh, th蕐  t� Minh gi竜 ra v祇 ngc xu玦, l筰 nghe c竎 h� u鑞g ru ng﹎ nga, dng nh� c� n鏸 bu錸 man m竎. T� l﹗ nghe danh Minh gi竜 Quang Minh t� s�  Minh t鰑 ki誱 song tuy謙, ch� t鰑 l猲 x誴 tr猲 u, ph秈 ch╪g c竎 h� y ch輓h l� Quang Minh t� s�  Minh?",
	"<sex> 畂竛 hay l緈, ta ch輓h l�  Minh. Khi n穣 ch� l� do h琲 men, n鏸 bu錸 b蕋 gi竎 tr祇 d﹏g, n猲 m韎 ng﹎ nga m蕐 c﹗, mong <sex> ng ci ch�.",
	"T� c� ru v祇 l阨 ra, ngi m� ri l筰 c祅g ph鉵g kho竛g tho竧 t鬰, ti猲 sinh c秏 kh竔 mu玭 v祅, l筰 c遪 ng﹎ th� gi髉 vui, t筰 h� n祇 d竚 ci ch�?",
	}

	TalkEx("task_009_02_0_1",strTalk);

end

--续对话
function task_009_02_0_1()

local strTalk = {
	"<sex> dng nh� c騨g c� nhi襲 ki課 gi秈 c o v� ru, ng l� b籲g h鱱 tri k�. Ta chu du kh緋 i giang nam b綾, ph竧 hi謓 ru c馻 Trung Nguy猲 n誹 kh玭g ph秈 qu� m筺h th� l� qu� nh箃, r蕋 hi誱 c� nh鱪g lo筰 ru n錸g 蕀 ch璶g c蕋 l﹗ n╩. Ru sinh h祇 kh�, nay kh玭g t譵 th蕐 ru ngon, n鏸 bu錸 b蕋 gi竎 d﹏g tr祇, kh玭g sao c莔 頲.",
	"Ru Trung Nguy猲 c騨g c� lo筰 n錸g n祅 d� v� nh� Tam Oa u, N� Nhi H錸g, c遪 c竎 lo筰 B竎h Th秓, H莡 Nhi l筰 l� c竎 lo筰 ru thu鑓 thanh li謙 s秐g kho竔, sao l筰 n鉯 l� kh玭g c� ru ngon?",
	"Hay, hay l緈, <sex> qu� nhi猲 l� ngi s祅h ru,  ch th鵦 l� nh鱪g lo筰 ru ngon nh蕋 Trung Nguy猲, ch� ti誧 Ph鬾g Tng ph� � n琲 h蝟 l竛h, ru c騨g ngh蘯 n祅. Song Ph鬾g Tng do gi竝 ranh T﹜ V鵦, n猲 l筰 c� b竛 lo筰 T﹜ V鵦 M� T鰑 m� Trung Nguy猲 kh玭g c�, hng v� tuy謙 di謚. ",
	"Ta l祄 sao d竚 so s竛h v韎 c竎 h�, kh玭g bi誸 l� lo筰 ru ngon n祇 l筰 頲 l遪g c竎 h� n v藋?",
	}

	TalkEx("task_009_02_0_2",strTalk);

end

--续对话
function task_009_02_0_2()

local strTalk = {
	"Kh� h藆 T﹜ V鵦 Ba T� c� hai m颽 tr竔 ngc, m颽 h� n緉g l鯽, m颽 ng gi� r衪, cho n猲 b� o � y c騨g r蕋 c bi謙, m祏  nh� m竨, th琺 d辵 d祅g, kh玭g cay kh玭g nh箃, d� c� u鑞g ng祅 ly c騨g kh玭g say, ng l� c鵦 ph萴.",
	"Ru nho Ba T� 頲 ti猲 sinh khen ng頸 nh� v藋, sao kh玭g th蕐 ti猲 sinh u鑞g?",
	"Ru nho Ba T� n祔 ch� c� � Ph鬾g Tng ph� ch� thng nh﹏ Ba T�, m鏸 l莕 ch� c� lng h筺 ch�, nh璶g ta v� k裻 c玭g v� n猲 kh玭g th� t韎 , nh ng錳 y nh譶 ru than th�, u鑞g ru gi秈 s莡.",
	"Ta s� gi髉 ti猲 sinh 頲 to筰 nguy謓, gi� ta s� t韎 Ph鬾g Tng ph�, t譵 ru ngon cho ti猲 sinh.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,2);
	TaskTip("T韎 Ph鬾g Tng ph� t譵 thng nh﹏ Ba T� mua ru B� Уo cho  Minh.");
	Msg2Player("T韎 Ph鬾g Tng ph� t譵 thng nh﹏ Ba T� mua ru B� Уo cho  Minh.");
	GivePlayerAward("Award_XB_18","Easy");
	GivePlayerExp(SkeyXibei,"putaomeijiu")
end

--未与波斯商人对话
function task_009_02_1()

local strTalk = {
	"Ru nho Ba T� ch� c� � Ph鬾g Tng ph� ch� thng nh﹏ Ba T�, m鏸 l莕 ch� c� lng h筺 ch�, nh璶g ta v� k裻 c玭g v� n猲 kh玭g th� t韎 , nh ng錳 y nh譶 ru than th�, u鑞g ru gi秈 s莡.",
	}

	TalkEx("",strTalk);

end

--与波斯商人对话得知葡萄酒被西北烟汉抢去
function task_009_03_0()

local strTalk = {
	"<sex>, � y ta c� m閠 t h祅g qu� hi誱 n t� Ba T�, n誹 ch鋘 頲 c竔 璶g �, gi� ti襫 c� th� thng lng.",
	"Nghe n � y c� b竛 ru B� Уo c馻 Ba T�, c� ph秈 kh玭g?",
	"<sex> th藅 s祅h s醝, ru B� Уo c馻 ta l� lo筰 ru ngon  c蕋 h琻 12 n╩, s� lng kh玭g nhi襲, ch� ti誧 ngi  ch薽 1 bc, ru  b� T﹜ B綾 Y猲 H竛 mua h誸 v韎 gi� cao, ch糿g c遪 s鉻 l筰 b譶h n祇.",
	"(Sao n 玭g � Ph鬾g Tng ph� n祔 u h秓 ru h誸 v藋? L莕 trc s� thu鑓 gi� ru c騨g b� mua h誸 s筩h. Cho h醝 bao gi� th� 玭g m韎 c� h祅g m韎?",
	}

	TalkEx("task_009_03_0_1",strTalk);

end

--续对话
function task_009_03_0_1()

local strTalk = {
	"Ta m韎 n y kh玭g l﹗, ph秈 i ki誱  v鑞 c馻 chuy課 h祅g n祔 m韎 v� Ba T� 頲, cho n猲 c騨g kh玭g th� n鉯 ch綾 l� bao gi�. Chuy課 h祅g l莕 sau c� l� s� kh玭g b籲g b﹜ gi�, nh璶g c騨g l� lo筰 ru c蕋 頲 10 n╩, l莕 sau <sex> nh� n s韒.",
	"Th藅 ng l� ru ngon kh� t譵, kh玭g bi誸 T﹜ B綾 Y猲 H竛 c� ch辵 nhng l筰? g c� bi誸 h� 甶 v� hng n祇 kh玭g?",
	"<sex> ng l� ngi h秓 ru, ch糿g kh竎 n祇 T﹜ B綾 Y猲 H竛, nh璶g cho d� c� 畊鎖 k辮 h� c騨g ch璦 ch綾 ch辵 nhng l筰 u. Ta nh� h�  甶 v� ph輆 nam Ph鬾g Tng ph�, c� n  xem th�.",
	" t�, ta ph秈 t韎 xem li謚 h� c� th� nhng 10 ru B� Уo, nh� v藋 th� p c� i ng.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,3);
	CreateTrigger(0,1226,KILL_XB_XIBEIYANHAN);--杀怪触发器
	TaskTip("дn ph輆 Nam Ph鬾g Tng ph� t譵 T﹜ B綾 Y猲 H竛 mua 10 ru B� Уo.");
	Msg2Player("дn ph輆 Nam Ph鬾g Tng ph� t譵 T﹜ B綾 Y猲 H竛 mua 10 ru B� Уo.");
end

--未取得10份葡萄酒与波斯商人对话and补发触发器
function task_009_03_1()

local strTalk = {
			"T﹜ B綾 Y猲 H竛  甶 v� ph輆 nam Ph鬾g Tng ph�, h� qu� ru h琻 c� sinh m筺g, e kh玭g d� d祅g nhng l筰 cho ngi u.",
			}
	if	GetTrigger(KILL_XB_XIBEIYANHAN) == 0 then
		CreateTrigger(0,1226,KILL_XB_XIBEIYANHAN);--杀怪触发器
		TaskTip("дn ph輆 Nam Ph鬾g Tng ph� t譵 T﹜ B綾 Y猲 H竛 mua 10 ru B� Уo.");
		Msg2Player("дn ph輆 Nam Ph鬾g Tng ph� t譵 T﹜ B綾 Y猲 H竛 mua 10 ru B� Уo.");
	end

	TalkEx("",strTalk);

end

---------------------------------- 西北区10分支1_2未雨绸缪----------------------------------
--取得葡萄酒后与殷铭对话
function task_010_01_0()

local strTalk = {};

	if GetItemCount(2,0,708) >= 10 then
		--明教弟子对话
		if GetPlayerRoute() == 100 then
			strTalk = {
				"<sex> b� hng th琺 c馻 ru l玦 cu鑞 n y ph秈 ch╪g v蒼 l璾 luy課 hng v� Ru nho Ba T�?",
				"Ru v蒼 c遪 trong b譶h m�  T� S� v蒼 ng鰅 th蕐 sao? Ru nho Ba T� ph秈 t苙g ngi bi誸 thng th鴆 nh�  T� S� y.",
				"Ha ha, cho d� c� ch玭 di t v蒼 kh玭g th� gi蕌 頲 m飅 ru. Ch髇g ta u l� b筺 b� t筸 th阨 h穣 b� qua nh鱪g l� ngh躠 thng ng祔 m� c飊g nhau u鑞g m閠 b鱝 cho no say. Ru nho n祔 m飅 v� qu� l� r蕋 kh竎 thng, ngon kh玭g ch� v祇 u 頲.",
				"Ru n祔 sau 3 l莕 ch璶g c蕋 th� v� chua  v琲 甶 nhi襲, n誹 ch璶g c蕋 th猰 1 l莕 th� ch綾 l� s� kh� h誸 v� chua.",
				"Ngi n鉯 r蕋 ng qu� l� ngi bi誸 thng th鴆, nh璶g v� chua n祔 l筰 l� tinh t髖 c馻 ru nho, tr祅 y d� ﹎. S� i c騨g th� n誹 nh� m鋓 vi謈 u b譶h thng th� u h鴑g th� g�.",
				}
		else
			strTalk = {
				"<sex> b� hng th琺 c馻 ru l玦 cu鑞 n y ph秈 ch╪g v蒼 l璾 luy課 hng v� Ru nho Ba T�?",
				"Ru v蒼 c遪 trong b譶h m�  T� S� v蒼 ng鰅 th蕐 sao? Ru nho Ba T� ph秈 t苙g ngi bi誸 thng th鴆 nh�  T� S� y.",
				"Ha ha, cho d� c� ch玭 di t v蒼 kh玭g th� gi蕌 頲 m飅 ru. Ch髇g ta u l� b筺 b� t筸 th阨 h穣 b� qua nh鱪g l� ngh躠 thng ng祔 m� c飊g nhau u鑞g m閠 b鱝 cho no say. Ru nho n祔 m飅 v� qu� l� r蕋 kh竎 thng, ngon kh玭g ch� v祇 u 頲.",
				"Ru n祔 sau 3 l莕 ch璶g c蕋 th� v� chua  v琲 甶 nhi襲, n誹 ch璶g c蕋 th猰 1 l莕 th� ch綾 l� s� kh� h誸 v� chua.",
				"<sex> n鉯 r蕋 ng qu� l� ngi bi誸 thng th鴆, nh璶g v� chua n祔 l筰 l� tinh t髖 c馻 ru nho, tr祅 y d� ﹎. S� i c騨g th� n誹 nh� m鋓 vi謈 u b譶h thng th� u h鴑g th� g�.",
				}
		end

		TalkEx("task_010_01_0_1",strTalk);

	--没有带回物品
	else
		strTalk = {
			"Ru nho Ba T� ch� c� � Ph鬾g Tng ph� ch� thng nh﹏ Ba T�, m鏸 l莕 ch� c� lng h筺 ch�, nh璶g ta v� k裻 c玭g v� n猲 kh玭g th� t韎 , nh ng錳 y nh譶 ru than th�, u鑞g ru gi秈 s莡.",
			}
		TalkEx("",strTalk);

	end

end

--续对话
function task_010_01_0_1()

local strTalk = {}

	--明教弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			" T� S� ph秈 ch╪g 產ng c� chuy謓 phi襫 mu閚?",
			"Ngi  t鮪g nghe Si H醓 gi竜? Si H醓 gi竜 l� gi竜 ph竔 th莕 b� � trung nguy猲, v� mu鑞 畂箃 B秐  S琻 H� X� T綾 n猲 l祄 lo筺 trung nguy猲. Si H醓 gi竜 v� B秐 gi竜 tng nh� d� l蒼 l閚 nh璶g th藅 ra l� kh竎 bi謙 r蕋 xa. Nh璶g c� l� v� gi竜 ch髇g kh玭g c﹗ n� l� ngh躠 trung nguy猲 n猲 ngi trong v� l﹎ u c� th祅h ki課 v� 甧m l遪g th� ch.",
			"Thu閏 h� c騨g c� nghe n鉯 Si H醓 gi竜 l祄 lo筺 trung nguy猲 nh璶g sao l筰 k誸 o竛 v韎 ta?",
			"Si H醓 gi竜 v鑞 kh玭g thi謓 ch� v韎 v� l﹎ trung nguy猲, chuy謓 ch輓h quy襫 Чi L� r鑙 lo筺 l� do Si H醓 gi竜 g﹜ n猲 nh璶g Minh gi竜 c騨g b� v� l﹜ v� cho l� ng b鋘 c馻 Si H醓 gi竜. V� th� m� ta  nhi襲 l莕 quy誸 u v韎 Si H醓 gi竜 nh璶g u b蕋 ph﹏ th緉g b筰. Sau nhi襲 l莕 giao tranh 頲 bi誸 Si H醓 gi竜  nh c緋 Th竛h H醓 L謓h n猲 m鑙 th� c祅g s﹗ h琻. Chuy謓 Minh gi竜 tr飊g tu Quang Minh nh v鑞 c� m藅 nh璶g l筰 b� l�, e r籲g s� g﹜ s� ch� � c馻 Nh蕋 Ph萴 阯g.",
			}
	else
		strTalk = {
			" T� S� ph秈 ch╪g 產ng c� chuy謓 phi襫 mu閚?",
			"<sex>  t鮪g nghe Si H醓 gi竜? Si H醓 gi竜 l� gi竜 ph竔 th莕 b� � trung nguy猲, v� mu鑞 畂箃 B秐  S琻 H� X� T綾 n猲 l祄 lo筺 trung nguy猲. Si H醓 gi竜 v� B秐 gi竜 tng nh� d� l蒼 l閚 nh璶g th藅 ra l� kh竎 bi謙 r蕋 xa. Nh璶g c� l� v� gi竜 ch髇g kh玭g c﹗ n� l� ngh躠 trung nguy猲 n猲 ngi trong v� l﹎ u c� th祅h ki課 v� 甧m l遪g th� ch.",
			"Chuy謓 Si H醓 gi竜 l祄 lo筺 trung nguy猲 v蒼 ch璦 y猲 sao ch髇g l筰 k誸 o竛 v韎 Minh gi竜?",
			"Si H醓 gi竜 v鑞 kh玭g thi謓 ch� v韎 v� l﹎ trung nguy猲, chuy謓 ch輓h quy襫 Чi L� r鑙 lo筺 l� do Si H醓 gi竜 g﹜ n猲 nh璶g Minh gi竜 c騨g b� v� l﹜ v� cho l� ng b鋘 c馻 Si H醓 gi竜. V� th� m� ta  nhi襲 l莕 quy誸 u v韎 Si H醓 gi竜 nh璶g u b蕋 ph﹏ th緉g b筰. Sau nhi襲 l莕 giao tranh 頲 bi誸 Si H醓 gi竜  nh c緋 Th竛h H醓 L謓h n猲 m鑙 th� c祅g s﹗ h琻. Chuy謓 Minh gi竜 tr飊g tu Quang Minh nh v鑞 c� m藅 nh璶g l筰 b� l�, e r籲g s� g﹜ s� ch� � c馻 Nh蕋 Ph萴 阯g.",
			}
	end

	TalkEx("task_010_01_0_2",strTalk);

end

--续对话
function task_010_01_0_2()

local strTalk = {}

	--明教弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Th� ra l� v藋 ch糿g tr竎h  T� S� lo l緉g th�, chuy謓 n祔 sao l筰 li猲 quan n Nh蕋 Ph萴 阯g?",
			"Ngi v鮝 gia nh藀 gi竜 kh玭g bi誸 b秐 gi竜 v� Nh蕋 Ph萴 阯g  t鮪g h頿 t竎, nh璶g   l� qu� kh�. Ta th蕐 ngi c馻 Nh蕋 Ph萴 阯g nhi襲 l莕 ra v祇 Quang Minh nh, c� l� Nh蕋 Ph萴 阯g  nghi ng�. Gi� ta d竚 kh糿g nh trong gi竜 c� Gian t�, kh玭g ch� � T鎛g  m� c竎  t� tr猲 Quang Minh nh u c� gian t� 萵 n蕄.",
			"Theo l阨  T� S� th� gian t� kh玭g ch� ho箃 ng � Quang Minh nh e r籲g � t鎛g  c騨g c� kh玭g 輙.",
			"Kh玭g sai, ta v� ngi v鮝 g苝 nh�  quen ng l� ph秈 u鑞g cho say nh璶g ta c遪 ph秈 gi竚 s竧 vi謈 tr飊g tu Quang Minh nh v� tr� v� t鎛g  h錳 b祇 tin t鴆, ngi c� th� gi髉 ta 甶襲 traе t� Minh gi竜 tr猲 Quang Minh nh xem c� manh m鑙 c馻 gian t� kh玭g.",
			" T� S� ch� kh竎h s竜 h穣 i tin t鑤 c馻 ta.",
			}
	else
		strTalk = {
			"(Quang Minh T� S� qu� kh玭g t莔 thng, ta tng h緉 ch� l� t猲 b頼 ru, mong r籲g h緉 s� kh玭g ph竧 hi謓 th﹏ ph薾 Nh蕋 Ph萴 阯g c馻 ta.)",
			"Theo l阨  T� S� th� gian t� kh玭g ch� ho箃 ng � Quang Minh nh e r籲g � t鎛g  c騨g c� kh玭g 輙.",
			"Kh玭g gi蕌 g� ngi Minh gi竜 v� Nh蕋 Ph萴 阯g  t鮪g h頿 t竎, nh璶g   l� qu� kh�. Ta th蕐 ngi c馻 Nh蕋 Ph萴 阯g nhi襲 l莕 ra v祇 Quang Minh nh, c� l� Nh蕋 Ph萴 阯g  nghi ng�. Gi� ta d竚 kh糿g nh trong gi竜 c� Gian t�, kh玭g ch� � T鎛g  m� c竎  t� tr猲 Quang Minh nh u c� gian t� 萵 n蕄.",
			"Theo l阨  T� S� th� gian t� kh玭g ch� ho箃 ng � Quang Minh nh e r籲g � t鎛g  c騨g c� kh玭g 輙.",
			"Kh玭g sai, ta v� ngi v鮝 g苝 nh�  quen ng l� ph秈 u鑞g cho say nh璶g ta c遪 ph秈 gi竚 s竧 vi謈 tr飊g tu Quang Minh nh v� tr� v� t鎛g  h錳 b祇 tin t鴆, ngi c� th� gi髉 ta 甶襲 traе t� Minh gi竜 tr猲 Quang Minh nh xem c� manh m鑙 c馻 gian t� kh玭g.",
			" T� S� ch� kh竎h s竜 h穣 i tin t鑤 c馻 ta.",
			}
	end

	TalkEx("",strTalk);
	DelItem(2,0,708,10);
	RemoveTrigger(GetTrigger(KILL_XB_XIBEIYANHAN));
	SetTask(TASK_XB_ID_01,4);
	CreateTrigger(0,1227,KILL_XB_MINGJIAOJIANXI);--杀怪触发器
	TaskTip("襲 tra gian t� Minh gi竜 xem c� tin t鴆 li猲 quan n Si H醓 gi竜 kh玭g.");
	Msg2Player("襲 tra gian t� Minh gi竜 xem c� tin t鴆 li猲 quan n Si H醓 gi竜 kh玭g.");
	GivePlayerAward("Award_XB_19","Easy");
	GivePlayerExp(SkeyXibei,"xibeiyanhan")
end

--带回或未带回蚩火教令牌
function task_010_02_0()

local strTalk = {};

	--带回蚩火教令牌
	if GetItemCount(2,0,709) >= 1 then
		--明教弟子对话
		if GetPlayerRoute() == 100 then
			strTalk = {
				"Kh玭g ngo礽 d� 畂竛 c馻  T� S�, n琲 n祔 c� gian t� c馻 Si H醓 gi竜 萵 n蕄, y l� L謓h b礽 ta t譵 頲.",
				"Ra l� Si H醓 gi竜 產ng g﹜ chuy謓, n琲 n祔 c竎h t鎛g  r蕋 xa m� gian t� Si H醓 gi竜  l蝞 v祇 trong khi nh鱪g ngi ch� ch鑤 trong gi竜 ch璦 c�, e r籲g th鵦 l鵦 kh玭g   i ph� khi gi竜 ch髇g t筼 ph秐. N誹 Si H醓 gi竜 x骾 gi鬰  t� t筼 ph秐 kh玭g nh鱪g s� ph� h駓 Quang Minh nh c遪 l�  k輈h cho b鎛 gi竜, chuy謓 n祔 th藅 ng lo.",
				"C竎h t鑤 nh蕋 l� trc khi Si H醓 gi竜 x骾 gi鬰  t� t筼 ph秐 th� ph秈 t譵 ra t猲 ph秐 ,  T� S� c� ph竧 hi謓 g莕 y Quang Minh nh c� g� kh竎 thng?",
				"Ta  kh糿g nh m閠 s�  t� c� � t筼 ph秐, ta c莕 鎛 nh l遪g qu﹏ trong ph﹏ , ngi h穣 gi髉 ta t譵 е t� Minh gi竜 tr猲 Quang Minh nh v� ti猽 di謙 30 t猲  ng╪ ch苙 h祅h ng c馻 ch髇g, ta 甶 b総 tay v祇 ph遪g b�.",
				"Thu閏 h� tu﹏ l謓h,  T� S� h穣 mau 甶 ph遪g b�.",
				}
		else
			strTalk = {
				"Kh玭g ngo礽 d� 畂竛 c馻  T� S�, n琲 n祔 c� Gian t� c馻 Si H醓 gi竜 萵 n蕄, y l� L謓h b礽 ta t譵 頲.",
				"Ra l� Si H醓 gi竜 產ng g﹜ chuy謓, n琲 n祔 c竎h t鎛g  r蕋 xa m� gian t� Si H醓 gi竜  l蝞 v祇 trong khi nh鱪g ngi ch� ch鑤 trong gi竜 ch璦 c�, e r籲g th鵦 l鵦 kh玭g   i ph� khi gi竜 ch髇g t筼 ph秐. N誹 Si H醓 gi竜 x骾 gi鬰  t� t筼 ph秐 kh玭g nh鱪g s� ph� h駓 Quang Minh nh c遪 l�  k輈h cho b鎛 gi竜, chuy謓 n祔 th藅 ng lo.",
				"C竎h t鑤 nh蕋 l� trc khi Si H醓 gi竜 x骾 gi鬰  t� t筼 ph秐 th� ph秈 t譵 ra t猲 ph秐 ,  T� S� c� ph竧 hi謓 g莕 y Quang Minh nh c� g� kh竎 thng?",
				"Ta  kh糿g nh m閠 s�  t� c� � t筼 ph秐, ta c莕 鎛 nh l遪g qu﹏ trong ph﹏ , <sex> h穣 gi髉 ta t譵 е t� Minh gi竜 tr猲 Quang Minh nh v� ti猽 di謙 30 t猲  ng╪ ch苙 h祅h ng c馻 ch髇g, ta 甶 b総 tay v祇 ph遪g b�.",
				"Ra s鴆 v� b筺 m� sao kh竎h kh� th�,  T� S� h穣 mau 甶 ph遪g b�.",
				}
		end
		DelItem(2,0,709,1);
		RemoveTrigger(GetTrigger(KILL_XB_MINGJIAOJIANXI));
		TalkEx("",strTalk);
		SetTask(TASK_XB_ID_01,5);
		CreateTrigger(0,1228,KILL_XB_MINGJIAOPANTU);
		TaskTip("Ti猽 di謙 30 е t� Minh gi竜  ng╪ ch苙 k� ho筩h uy hi誴 Quang Minh nh.");
		Msg2Player("Ti猽 di謙 30 е t� Minh gi竜  ng╪ ch苙 k� ho筩h uy hi誴 Quang Minh nh.");
		GivePlayerAward("Award_XB_20","Easy");
		GivePlayerExp(SkeyXibei,"mingjiaojianxi")
	--没有带回令牌and补发任务触发器
	else
		strTalk = {
			"E l� е t� Minh gi竜 tr猲 Quang Minh nh c� gian t�, ta 產ng c� vi謈 ngi c� th� gi髉 ta di襲 tra kh玭g?",
			}
		if	GetTrigger(KILL_XB_MINGJIAOJIANXI) == 0 then
			CreateTrigger(0,1227,KILL_XB_MINGJIAOJIANXI);
			TaskTip(" T� S�  h誸 c竎h, nh� b筺 甶襲 tra xem c� tin t鴆 c馻 gian t� Si H醓 gi竜 trong Quang Minh nh.");
			Msg2Player(" T� S�  h誸 c竎h, nh� b筺 甶襲 tra xem c� tin t鴆 c馻 gian t� Si H醓 gi竜 trong Quang Minh nh.");
		end

		TalkEx("",strTalk);
	end
end

--还未杀死30叛徒and补发触发器
function task_010_02_1()

local strTalk = {
	"Ta  kh糿g nh m閠 s�  t� c� � t筼 ph秐, ta c莕 鎛 nh l遪g qu﹏ trong ph﹏ , <sex> h穣 gi髉 ta t譵 е t� Minh gi竜 tr猲 Quang Minh nh v� ti猽 di謙 30 t猲  ng╪ ch苙 h祅h ng c馻 ch髇g, ta 甶 b総 tay v祇 ph遪g b�.",
	};

	if	GetTrigger(KILL_XB_MINGJIAOPANTU) == 0 then
			CreateTrigger(0,1228,KILL_XB_MINGJIAOPANTU);
			TaskTip("Ti猽 di謙 30 е t� Minh gi竜  ng╪ ch苙 k� ho筩h uy hi誴 Quang Minh nh.");
			Msg2Player("Ti猽 di謙 30 е t� Minh gi竜  ng╪ ch苙 k� ho筩h uy hi誴 Quang Minh nh.");
	end

	TalkEx("",strTalk);

end

--杀了杀30叛徒
function task_010_03_0()

local strTalk = {};

	--明教弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ta  ti猽 di謙 30 е t� Minh gi竜, h祅h ng c馻 ch髇g v� th� m� b� c秐 tr�.",
			"T鑤 r錳, nh� v藋 ta c� nhi襲 th阨 gian chi猽 m� ngi t礽  ti猽 di謙 s� ph秐  c遪 l筰. Ngi  l藀 c玭g l韓 cho Minh gi竜 ta nh蕋 nh s� b竜 l筰 v韎 t鎛g  thng cho ngi.",
			" T� S� qu� l阨, ng tr竎h thu閏 h� nhi襲 chuy謓, b鎛 gi竜 thi誸 l藀 Ph﹏  � m閠 n琲 hoang v緉g nh� th� s� b� ph﹏ t竛 l鵦 lng v� d� b� k� th� nh l衝, Minh gi竜 kh玭g s� t鎛 th蕋 sao?",
			}
	else
		strTalk = {
			"Ta  ti猽 di謙 30 е t� Minh gi竜, h祅h ng c馻 ch髇g v� th� m� b� c秐 tr�.",
			"T鑤 r錳, nh� v藋 ta c� nhi襲 th阨 gian chi猽 m� ngi t礽  ti猽 di謙 s� ph秐  c遪 l筰. <sex>  l藀 c玭g l韓 cho Minh gi竜 ta nh蕋 nh s� b竜 l筰 v韎 t鎛g  thng cho ngi.",
			" T� S� kh竎h s竜 r錳. Xin th� t閕 nhi襲 chuy謓. Minh gi竜 thi誸 l藀 Ph﹏  � m閠 n琲 hoang v緉g nh� th� s� b� ph﹏ t竛 l鵦 lng v� d� b� k� th� nh l衝, Minh gi竜 kh玭g s� t鎛 th蕋 sao?",
			}
	end

	TalkEx("task_010_03_0_1",strTalk);

end

--续对话
function task_010_03_0_1()

local strTalk = {}

	--明教弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			" lo c馻 ngi c騨g gi鑞g nh� c馻 ta. Nh璶g b鎛 gi竜 kh� 頲 trung nguy猲 ch蕄 nh薾 v� thua xa k� ch Si H醓 gi竜, n閕 b� trong gi竜 l筰 m蕋 畂祅 k誸 n猲 kh玭g th� kh玭g m筼 hi觤 l藀 ph﹏  t筰 y  b秓 to祅 b� ph薾 l鵦 lng. D� Minh gi竜 c� b� t蕁 c玭g c騨g kh玭g n n鏸 m蕋 h誸 l鵦 lng, kh玭g ng� tin t鴆 b� l� khi課 k� ch th鮝 c�, s� r籲g c竎 ph竔 kh竎 l筰 nghi ng�.",
			"N誹 vi謈 n祔 m筼 hi觤 qu� l韓 th� sao ph秈 ti課 h祅h? Chuy謓 gian t�  g﹜ n猲 s鉵g gi� n誹 v� hi觰 l莔 m� t蕁 c玭g th� l鵦 lng c馻 ta s� t鎛 th蕋 n苙g n�.",
			"Ta c騨g bi誸 vi謈 n祔 r蕋 kh� nh璶g l筰 c� l頸 v� sau, b鎛 gi竜 kh玭g mu鑞 xung t v韎 c竎 ph竔, nh璶g n誹 v� l﹎ kh玭g cho ph衟 th� Minh gi竜 s� kh玭g khoanh tay ch辵 tr鉯 m� gi� v鱪g l藀 trng c馻 m譶h.",
			}
	else
		strTalk = {
			" lo c馻 <sex> c騨g gi鑞g nh� c馻 ta. Nh璶g b鎛 gi竜 kh� 頲 trung nguy猲 ch蕄 nh薾 v� thua xa k� ch Si H醓 gi竜, n閕 b� trong gi竜 l筰 m蕋 畂祅 k誸 n猲 kh玭g th� kh玭g m筼 hi觤 l藀 ph﹏  t筰 y  b秓 to祅 b� ph薾 l鵦 lng. D� Minh gi竜 c� b� t蕁 c玭g c騨g kh玭g n n鏸 m蕋 h誸 l鵦 lng, kh玭g ng� tin t鴆 b� l� khi課 k� ch th鮝 c�, s� r籲g c竎 ph竔 kh竎 l筰 nghi ng�.",
			"N誹 vi謈 n祔 m筼 hi觤 qu� l韓 th� sao ph秈 ti課 h祅h? Chuy謓 gian t�  g﹜ n猲 s鉵g gi� n誹 v� hi觰 l莔 m� t蕁 c玭g th� l鵦 lng c馻 Minh gi竜 s� t鎛 th蕋 n苙g n�.",
			"Ta c騨g bi誸 vi謈 n祔 r蕋 kh� nh璶g l筰 c� l頸 v� sau, b鎛 gi竜 kh玭g mu鑞 xung t v韎 c竎 ph竔, nh璶g n誹 v� l﹎ kh玭g cho ph衟 th� Minh gi竜 s� kh玭g khoanh tay ch辵 tr鉯 m� gi� v鱪g l藀 trng c馻 m譶h.",
			}
	end

	TalkEx("task_010_03_0_2",strTalk);

end

--续对话
function task_010_03_0_2()

local strTalk = {}

	--明教弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ra l� th�, t蕋 c� u t筰 v� l﹎ c� th祅h ki課 qu� s﹗ v韎 ch竛h t� khi課 cho m閠 s� m玭 ph竔 甶 kh醝 trung nguy猲, ng l� t� chu鑓 l蕐 kh�.",
			"L莕 n祔 ngi l藀 頲 c玭g l韓, c鴘 b鎛 gi竜 tho竧 kh醝 nguy hi觤, khi n祇 r秐h ta s� u鑞g v韎 ngi.",
			" t�, kh玭g qu蕐 r莥  T� S� l祄 vi謈, sau n祔 ta s� mang ru nho Ba T� n th╩ vi課g.",
			"(Th� ra Minh gi竜 g莥 d鵱g c�  � Quang Minh nh v� nguy猲 do n祔, tr� v� t譵 Th竎 B箃 Ho籲g   th玭g b竜 t譶h h譶h.)",
			}
	else
		strTalk = {
			"Ra l� th�, t蕋 c� u t筰 v� l﹎ c� th祅h ki課 qu� s﹗ v韎 ch竛h t� khi課 cho m閠 s� m玭 ph竔 甶 kh醝 trung nguy猲, ng l� t� chu鑓 l蕐 kh�. Quen 頲  T� S� ng l� vinh h筺h.",
			"Sao kh竎h sao th�?  Minh thay m苩 Minh gi竜 產 t� <sex> ra tay gi髉  Minh gi竜 tho竧 kh醝 nguy hi觤, khi n祇 r秐h ta s� u鑞g v韎 ngi.",
			"Ta c騨g c� � , kh玭g qu蕐 r莥  T� S� l祄 vi謈, sau n祔 ta s� mang Ru nho Ba T� n th╩ vi課g.",
			"(Th� ra Minh gi竜 g莥 d鵱g c�  � Quang Minh nh v� nguy猲 do n祔, tr� v� t譵 Th竎 B箃 Ho籲g   th玭g b竜 t譶h h譶h.)",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,7);
	TaskTip("V� g苝 Th竎 B箃 Ho籲g b竜 c竜 t譶h h譶h v� Minh gi竜.");
	Msg2Player("V� g苝 Th竎 B箃 Ho籲g b竜 c竜 t譶h h譶h v� Minh gi竜.");
	GivePlayerAward("Award_XB_21","Easy");
	GivePlayerExp(SkeyXibei,"mingjiaopanduan")
end

--尚未与拓拔弘对话
function task_010_03_1()

local strTalk = {};

	if GetPlayerRoute() == 100 then
		strTalk = {
			"L莕 n祔 ngi l藀 頲 c玭g l韓, c鴘 b鎛 gi竜 tho竧 kh醝 nguy hi觤, khi n祇 r秐h ta s� u鑞g v韎 ngi.",
			" t�, kh玭g qu蕐 r莥  T� S� l祄 vi謈, sau n祔 ta s� mang ru nho Ba T� n th╩ vi課g.",
			"(Th� ra Minh gi竜 g莥 d鵱g c�  � Quang Minh nh v� nguy猲 do n祔, tr� v� t譵 Th竎 B箃 Ho籲g   th玭g b竜 t譶h h譶h.)",
			}
	else
		strTalk = {
			" Minh thay m苩 Minh gi竜 產 t� <sex> ra tay gi髉  Minh gi竜 tho竧 kh醝 nguy hi觤, khi n祇 r秐h ta s� u鑞g v韎 ngi.",
			"Ta c騨g c� � , kh玭g qu蕐 r莥  T� S� l祄 vi謈, sau n祔 ta s� mang Ru nho Ba T� n th╩ vi課g.",
			"(Th� ra Minh gi竜 g莥 d鵱g c�  � Quang Minh nh v� nguy猲 do n祔, tr� v� t譵 Th竎 B箃 Ho籲g   th玭g b竜 t譶h h譶h.)",
			}
	end

	TalkEx("",strTalk);

end

---------------------------------- 西北区11分支1_3帝王之墓----------------------------------
--明教一事结束后与拓拔弘对话
function task_011_01_0()

local strTalk = {
	"<sex>, chuy課 甶 Quang Minh nh c� thu ho筩h kh玭g?",
	"Kh玭g ph� l遪g tin c馻 ti襫 b鑙, chuy謓 Minh gi竜 g莥 d鵱g c�  t筰 Quang Minh nh ch�  t� v�. V� kh玭g 頲 v� l﹎ trung nguy猲 ti誴 nh薾 n猲 V� V� Tr� M藆 m韎 l藀 ph﹏   gi� l鵦 lng ch� kh玭g c� m璾  v� c祅g kh玭g d輓h l輚 n Nh蕋 Ph萴 阯g.",
	"T鑤, nh� th� chuy謓 c馻 Minh gi竜 xem nh� k誸 th骳. Ngi c� th� n b竜 cho Xa Lu﹏ B� Vng . Ta c騨g r髏 kh醝 chuy謓 n祔  chu萵 b� cu閏 chi課 v韎 T� M� Minh Phong. B秐 l躰h c馻 ngi c騨g kh玭g t錳, i sau khi ta ph﹏ cao th蕄 v韎 T� M� Minh Phong nh蕋 nh s� so t礽 v韎 ngi.",
	"B秐 l躰h c馻 ta sau s竛h 頲 v韎 ti襫 b鑙? Ta 甶 t譵 Xa Lu﹏ B� Vng  b竜 c竜 vi謈 n祔. C竜 t�!",
	}

	SetTask(TASK_XB_ID_01,8);
	TalkEx("",strTalk);
	TaskTip("B竜 v韎 Xa Lu﹏ B� Vng chuy謓 li猲 quan n Minh gi竜");
	Msg2Player("B竜 v韎 Xa Lu﹏ B� Vng chuy謓 li猲 quan n Minh gi竜");
	GivePlayerAward("Award_XB_22","Easy");
	GivePlayerExp(SkeyXibei,"qianyinhouguo")
end

--还没见车轮霸王与拓拔弘对话
function task_011_01_1()

local strTalk = {
	"N誹 ngi  t譵 ra ch﹏ tng th� tr鵦 ti誴 b竜 cho Xa Lu﹏ B� Vng . Ta c騨g r髏 kh醝 chuy謓 n祔  chu萵 b� cu閏 chi課 v韎 T� M� Minh Phong.",
	}

	TalkEx("",strTalk);

end

--与车轮霸王对话
function task_011_02_0()

local strTalk = {
	"Ngi c� g苝 Th竎 B箃 Ho籲g kh玭g? Vi謈 Minh gi竜 g莥 d鵱g c�  t筰 Quang Minh nh c� manh m鑙 r錳 ch╪g??",
	"Ta  g苝 ti襫 b鑙 Th竎 B箃 Ho籲g, chuy謓 Quang Minh nh  甶襲 tra r�. Th� ra Minh gi竜 v�  t� b� v� l﹎ t葃 chay, l筰 k誸 o竛 v韎 Si H醓 gi竜, Minh gi竜 th蕐 chuy謓 ch糿g l祅h n猲 V� V� Tr� M藆  l藀 Ph﹏  t筰 Quang Minh nh  b秓 v� l鵦 lng, kh玭g c� � nh i ph� Nh蕋 Ph萴 阯g.",
	"Th� ra l� v藋, m藅 th竚 c騨g  h錳 b竜 Minh gi竜 kh玭g c� h祅h ng x﹎ ph筸 Nh蕋 Ph萴 阯g. Nh� th� c騨g t鑤 c� th� g竎 l筰 chuy謓 i ph� Minh gi竜. Tin n祔 ph秈 Th竎 B箃 Ho籲g n鉯 ngi bi誸 kh玭g?",
	"L� Th竎 B箃 ti襫 b鑙 sai ta n Quang Minh nh 甶襲 tra s� th藅. g ta hi謓 gi� � Ph鬾g Tng  b薾 i ph� v韎 T� M� Minh Phong.",
	}

	TalkEx("task_011_02_0_1",strTalk);

end

--续对话
function task_011_02_0_1()

local strTalk = {
	"Qu� kh玭g sai, h緉 l祄 sao ho祅 th祅h nhi謒 v� nhanh th� 頲. T猲 T� M� Minh Phong ti猽 di謙 hay kh玭g c騨g th� th玦, sao Th竎 B箃 Ho籲g  l筰 g﹜ th猰 r綾 r鑙 l祄 t鑞 th阨 gian. Th竎 B箃 Ho籲g � c� L� Nguy猲 Kh竛h i nh﹏ l祄 h藆 thu蒼 m� xem nh� nhi謒 v�, ch綾 l筰 b� T� M� Minh Phong h髏 l蕐 r錳. Ngi n祔 ch糿g 頲 t輈h s� g� c� nh璶g L� i nh﹏ l筰 kh玭g nghe l阨 khuy猲 c馻 ta. Ngi v鮝 gia nh藀  l藀 c玭g l韓 tng lai s� r蕋 s竛g l筺.",
	"L祄 vi謈 cho Nh蕋 Ph萴 阯g l� b鎛 ph薾 c馻 ta, nh蕋 nh ph秈 ho祅 th祅h nhi謒 v� 頲 giao.",
	"N誹 ngi h誸 l遪g l祄 vi謈 sau n祔 Nh蕋 Ph萴 阯g s� c� th� h� gi� g鋓 m璦. Th鵦 ra Phi H� c馻 ta 產ng ph� tr竎h m閠 chuy謓 c� m藅 nh璶g ti課 tri觧 kh玭g thu薾 l頸. B秐 l躰h c馻 ngi gi醝 v� l祄 vi謈 c萵 th薾 v藋, ta s� th╪g ch鴆 ngi l� Nh蕋 Ph萴 阯g Phi H�  甶襲 tra vi謈 n祔, c� gan th� kh玭g?",
	"C� vi謈 d苙 d�, sao l筰 c� chuy謓 kh玭g d竚 th�.",
	}

	TalkEx("task_011_02_0_2",strTalk);

end

--续对话
function task_011_02_0_2()

local strTalk = {
	"Ph輆 Йng c馻 B綾 Ph鬾g Tng l� T莕 L╪g n琲 ch玭 c蕋 c馻 T莕 Th駓 Ho祅g. Trc y 玭g ta x璶g b� thi猲 h�, tng truy襫 trong m� c� Kho b竨 n猲  g﹜ s� ch� � c馻 Ngi tr閙 m�, tr猲 ngi h� c� mang 1 lo筰 v藅 ph萴 l� M苩 n� t� v祅g. Ngi h穣 t譵 c竎h mang v� 10 m苩 n� t� v祅g, ta s� s緋 x誴 h祅h ng ti誴 theo. Vi謈 n祔 v� c飊g quan tr鋘g, ngi ch� n猲 h醝 nhi襲 v� c騨g ng ti誸 l� ra ngo礽, 甶 r錳 v� mau.",
	"Ta bi誸 n猲 l祄 g� r錳, ngi h穣 i tin t鑤 c馻 ta.",
	"(Xem ra Nh蕋 Ph萴 阯g l筰 c� ﹎ m璾, nh璶g kh玭g bi誸 li猲 quan g� n T莕 L╪g, chi b籲g v� h醝  Dng ti襫 b鑙 th� xem.)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,9);
	TaskTip("Th豱h gi竜  Dng H鋋 chuy謓 li猲 quan n T莕 L╪g.");
	Msg2Player("Th豱h gi竜  Dng H鋋 chuy謓 li猲 quan n T莕 L╪g.");
	add_xb_title(3);--获得一品堂飞护称号
end



--还没与欧阳画对话
function task_011_02_1()

local strTalk = {
	"Ph輆 Йng c馻 B綾 Ph鬾g Tng l� T莕 L╪g n琲 ch玭 c蕋 c馻 T莕 Th駓 Ho祅g. Trc y 玭g ta x璶g b� thi猲 h�, tng truy襫 trong m� c� Kho b竨 n猲  g﹜ s� ch� � c馻 Ngi tr閙 m�, tr猲 ngi h� c� mang 1 lo筰 v藅 ph萴 l� M苩 n� t� v祅g. Ngi h穣 t譵 c竎h mang v� 10 m苩 n� t� v祅g, ta s� s緋 x誴 h祅h ng ti誴 theo. ",
	"(Xem ra Nh蕋 Ph萴 阯g l筰 c� ﹎ m璾, nh璶g kh玭g bi誸 li猲 quan g� n T莕 L╪g, chi b籲g v� h醝  Dng ti襫 b鑙 th� xem.)",
	}

	TalkEx("",strTalk);

end

--与欧阳画对话前往皇陵外截杀一品堂暗杀使
function task_011_03_0()

local strTalk = {
	"Х l﹗ kh玭g g苝  Dng ti襫 b鑙 v蒼 kh醗 ch�? H藆 b鑙 c� vi謈 mu鑞 h醝.",
	"Sau l莕 trc chia ly, ta lu玭 lo cho s� an nguy c馻 ngi, nay th蕐 ngi an to祅 tr� l筰 y ta m韎 y猲 l遪g. <sex> c� vi謈 g� c� n鉯.",
	"Ti襫 b鑙 ng lo, ta lu玭 c萵 th薾 khi l祄 vi謈. Ti襫 b鑙  nghe qua Kho b竨 trong T莕 L╪g? Xa Lu﹏ B� Vng  sai ta 甶 thu th藀 M苩 n� t� v祅g.",
	"Th� ra li猲 quan n T莕 L╪g, ta  s韒 bi誸 Nh蕋 Ph萴 阯g s� kh玭g d� d祅g b� qua chuy謓 n祔, xem ra Nh蕋 Ph萴 阯g  b� m藅 h祅h ng, Th竚 t� m� ch髇g ta ph竔 甶 th╩ d� T莕 L╪g  m蕋 t輈h, e r籲g do ch髇g  ph� r錳. Nh璶g M苩 n� t� v祅g th� ta ch璦 t鮪g nghe qua, n� c� t竎 d鬾g g�.",
	}

	TalkEx("task_011_03_0_1",strTalk);

end

--续对话
function task_011_03_0_1()

local strTalk = {
	"Xa Lu﹏ B� Vngn鉯 ch髇g c� 1 h祅h ng c� m藅  tri觧 khai � T莕 L╪g, r鑤 cu閏 l� chuy謓 g� y?",
	"Nh蕋 Ph萴 阯g  h祅h ng r錳? <sex> c� bi誸 T莕 L╪g l� n琲 c蕋 gi� b� m藅 v� B秐  S琻 H� X� T綾? H蘮 chi th竚 t� u m蕋 t輈h, Nh蕋 Ph萴 阯g s� b� h韙 tay tr猲. n誹  Nh蕋 Ph萴 阯g c� 頲 B秐  S琻 H� X� T綾 th� thi猲 h� s� g苝 n筺 chuy謓 n祔 v� c飊g quan tr鋘g. N誹 Nh蕋 Ph萴 阯g s韒 c� h祅h ng th� e r籲g th竚 t� b� 竚 s竧 b雐 竚 s竧 S� c馻 Nh蕋 Ph萴 阯g, ngi h穣 甶 T莕 L╪g 甶襲 tra h祅h tung 竚 s竧 S� c馻 Nh蕋 Ph萴 阯g xem sao.",
	"Kh玭g ng� b� m藅 l筰 l� B秐  S琻 H� X� T綾, n誹 b� Nh蕋 Ph萴 阯g l蕐 頲 th� nguy to. Ta s� n T莕 L╪g m閠 chuy課.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,10);
	CreateTrigger(0,1229,KILL_XB_YIPINTANGANSHASHI);--杀怪触发器
	TaskTip("дn Ho祅g l╪g ti猽 di謙 竚 s竧 S� c馻 Nh蕋 Ph萴 阯g.");
	Msg2Player("дn Ho祅g l╪g ti猽 di謙 竚 s竧 S� c馻 Nh蕋 Ph萴 阯g.");
	GivePlayerAward("Award_XB_23","Easy");
	GivePlayerExp(SkeyXibei,"huangling")
end

--还未杀死30暗杀使and补发触发器
function task_011_03_1()

local strTalk = {
	"N誹 Nh蕋 Ph萴 阯g s韒 c� h祅h ng th� e r籲g th竚 t� b� 竚 s竧 b雐 竚 s竧 S� c馻 Nh蕋 Ph萴 阯g, ngi h穣 甶 T莕 L╪g 甶襲 tra h祅h tung 竚 s竧 S� c馻 Nh蕋 Ph萴 阯g xem sao.",
	};

	if	GetTrigger(KILL_XB_YIPINTANGANSHASHI) == 0 then
			CreateTrigger(0,1229,KILL_XB_YIPINTANGANSHASHI);
			TaskTip("дn Ho祅g l╪g ti猽 di謙 竚 s竧 S� c馻 Nh蕋 Ph萴 阯g.");
			Msg2Player("дn Ho祅g l╪g ti猽 di謙 竚 s竧 S� c馻 Nh蕋 Ph萴 阯g.");
	end

	TalkEx("",strTalk);

end

--已经杀死30个一品堂暗杀使并获得大宋密函与欧阳话对话
function task_011_04_0()

local strTalk = {
	"Xung quanh T莕 L╪g u l� 竚 s竧 S� c馻 Nh蕋 Ph萴 阯g, t譵 頲 Th� h祄 m藅 th竚 Чi T鑞g tr猲 ngi ch髇g.",
	"Th� 畂筺 c馻 Nh蕋 Ph萴 阯g qu� l� c 竎, m藅 th竚 c馻 ta e l� l祅h 輙 d� nhi襲. Trong Th� h祄 n祔 n鉯 Nh蕋 Ph萴 阯g  n緈 頲 manh m鑙 c馻 B秐  S琻 H� X� T綾 trong l╪g, trong l╪g kh鉯 c m� m辴 c莕 c� M苩 n� t� v祅g  ph遪g tr竛h, v� l筰 trong l╪g c� Tng binh m� bi誸 di chuy觧. Ch糿g l�  l� s鴆 m筺h c馻 B秐  S琻 H� X� T綾?",
	"N誹 th� th� ng l� trong T莕 L╪g c� B秐  S琻 H� X� T綾, hay l� ta v祇 trong  d� la xem sao?",
	"L╪g m� th阨 x璦 C� quan tr飊g tr飊g hu鑞g chi y l� linh c鰑 c馻 Ho祅g , t nh藀 v祇 m� u ph秈 chuy謓 d�. Hay l� ta 甶 h醝 Cao nh﹏ o tr閙 m�, ngi h穣 甶 l祄 vi謈 do Xa Lu﹏ B� Vng  giao cho, l蕐 M苩 n� t� v祅g  d飊g khi v祇 m� nh璶g ch� c� l蕐 nhi襲 tr竛h cho ch髇g nghi ng�. Nhi謒 v� ng╪ ch苙 Nh蕋 Ph萴 阯g 畂箃 B秐  S琻 H� X� T綾 giao cho <sex>, v蕋 v� cho ngi r錳.",
	"Ti襫 b鑙 kh竎h kh� th�. Ta n T莕 L╪g t譵 10 M苩 n� t� v祅g  th╩ d� h祅h ng ti誴 theo c馻 Xa Lu﹏ B� Vng  y.",
	}

	DelItem(2,0,711,1);--删去大宋密探书函
	SetTask(TASK_XB_ID_01,12);
	TalkEx("",strTalk);
	CreateTrigger(0,1230,KILL_XB_DAOMUREN);--盗墓人杀怪触发器
	TaskTip("дn T莕 L╪g ti猽 di謙 ngi tr閙 m�  thu th藀 10 M苩 n� t� v祅g.");
	Msg2Player("дn T莕 L╪g ti猽 di謙 ngi tr閙 m�  thu th藀 10 M苩 n� t� v祅g.");
	GivePlayerAward("Award_XB_24","Easy");
	GivePlayerExp(SkeyXibei,"daomu")
end

--还没取得10个金丝面罩与欧阳画对话and补发触发器
function task_011_04_1()

local strTalk = {
	"L╪g m� th阨 x璦 C� quan tr飊g tr飊g hu鑞g chi y l� linh c鰑 c馻 Ho祅g , t nh藀 v祇 m� u ph秈 chuy謓 d�. Hay l� ta 甶 h醝 Cao nh﹏ o tr閙 m�, ngi h穣 甶 l祄 vi謈 do Xa Lu﹏ B� Vng  giao cho, l蕐 M苩 n� t� v祅g  d飊g khi v祇 m�.",
	}

	TalkEx("",strTalk);

	if GetTrigger(KILL_XB_DAOMUREN) == 0 then
		CreateTrigger(0,1230,KILL_XB_DAOMUREN);--盗墓人杀怪触发器
		TaskTip("дn T莕 L╪g ti猽 di謙 ngi tr閙 m�  thu th藀 10 M苩 n� t� v祅g.");
		Msg2Player("дn T莕 L╪g ti猽 di謙 ngi tr閙 m�  thu th藀 10 M苩 n� t� v祅g.");
	end

end

---------------------------------- 西北区12分支1_4断臂残腿----------------------------------

--已取得10个金丝面罩交给车轮霸王
function task_012_01_0()

local strTalk = {};

	--已取得10个金丝面罩
	if GetItemCount(2,0,710) >= 10 then
		DelItem(2,0,710,8);
		strTalk = {
			"Зy l� 10 M苩 n� t� v祅g, bc ti誴 theo l� g� n祇.",
			"R蕋 t鑤. Theo th竚 t� h錳 b竜 trong l╪g m� tr祅 y kh� c, M苩 n� t� v祅g n祔 d飊g khi v祇 trong m�. Trong m� qu� nguy hi觤 n猲 ph秈 giao cho 筺 T髖 v� T祅 Tho竔 trong s� Th藀 i Kim Cang 甶 l祄, ngi h穣 quay l筰 T莕 L╪g 甧m 2 M苩 n� t� v祅g cho ch髇g, ch髇g  i ngo礽 l╪g m� r錳.",
			"Tu﹏ l謓h!",
			"(N誹 nh� Th藀 i Kim Cang v祇 m� th� nh蕋 nh l蕐 頲 b秐 .B秐  S琻 H� X� T綾 li猲 quan s� an nguy c馻 thi猲 h� n誹 r琲 v祇 tay Nh蕋 Ph萴 阯g th� s� h筰 nc h筰 d﹏. Chi b籲g nh l鮝 筺 T髖 T祅 Tho竔 r錳 ti猽 di謙 ch髇g. Th藀 i Kim Cang b韙 甶 1 ngi s� y誹 甶 ph莕 n祇.)",
			"(Nh� th� s� d蒼 n s� nghi ng� c馻 Xa Lu﹏ B� Vng, hay l� n鉯 r籲g ch髇g kh玭g ch辵 甧o M苩 n� t� v祅g v祇 m� n猲 b� tr髇g c, n鉯 kho竎 r籲g kh� c trong m� v蒼 c遪 h鮪g h鵦 n猲 d阨 l筰 th阨 h筺 v祇 m�.)",
			};
		TalkEx("",strTalk);
		RemoveTrigger(GetTrigger(KILL_XB_DAOMUREN));
		SetTask(TASK_XB_ID_01,13);
		--清除先前用的变量
		SetTask(DUANBI_DEAD_STATE,0);
		SetTask(CANTUI_DEAD_STATE,0);
		TaskTip("Ti猽 di謙 筺 T髖 v� T祅 Tho竔 b猲 ngo礽 Ho祅g l╪g.");
		Msg2Player("Ti猽 di謙 筺 T髖 v� T祅 Tho竔 b猲 ngo礽 Ho祅g l╪g.");
		GivePlayerAward("Award_XB_25","Easy");
		GivePlayerExp(SkeyXibei,"jinsimianzhao")
	else
		strTalk = {
			"Ph輆 Йng c馻 B綾 Ph鬾g Tng l� T莕 L╪g n琲 ch玭 c蕋 c馻 T莕 Th駓 Ho祅g. Trc y 玭g ta x璶g b� thi猲 h�, tng truy襫 trong m� c� Kho b竨 n猲  g﹜ s� ch� � c馻 Ngi tr閙 m�, tr猲 ngi h� c� mang 1 lo筰 v藅 ph萴 l� M苩 n� t� v祅g. Ngi h穣 t譵 c竎h mang v� 10 m苩 n� t� v祅g, ta s� s緋 x誴 h祅h ng ti誴 theo. ",
			};
		TalkEx("",strTalk);
	end

end

--还没杀死断臂残腿与车轮霸王对话and补发金丝面罩
function task_012_02_1()

local strTalk = {
	"M苩 n� t� v祅g d飊g khi 甶 v祇 m�. Ngi 甧m 2 M苩 n� t� v祅g n T莕 L╪g giao cho 筺 T髖 v� T祅 Tho竔, ch髇g  i � ngo礽 m�.",
	"(N誹 nh� Th藀 i Kim Cang v祇 m� th� nh蕋 nh l蕐 頲 b秐 .B秐  S琻 H� X� T綾 li猲 quan s� an nguy c馻 thi猲 h� n誹 r琲 v祇 tay Nh蕋 Ph萴 阯g th� s� h筰 nc h筰 d﹏. Chi b籲g nh l鮝 筺 T髖 T祅 Tho竔 r錳 ti猽 di謙 ch髇g. Th藀 i Kim Cang b韙 甶 1 ngi s� y誹 甶 ph莕 n祇.)",
	"(Nh� th� s� d蒼 n s� nghi ng� c馻 Xa Lu﹏ B� Vng, hay l� n鉯 r籲g ch髇g kh玭g ch辵 甧o M苩 n� t� v祅g v祇 m� n猲 b� tr髇g c, n鉯 kho竎 r籲g kh� c trong m� v蒼 c遪 h鮪g h鵦 n猲 d阨 l筰 th阨 h筺 v祇 m�.)",
	};

	if GetItemCount(2,0,710) < 2 then
		AddItem(2,0,710,2,1);
		TalkEx("",strTalk);
		TaskTip("Ti猽 di謙 筺 T髖 v� T祅 Tho竔 b猲 ngo礽 Ho祅g l╪g.");
		Msg2Player("Ti猽 di謙 筺 T髖 v� T祅 Tho竔 b猲 ngo礽 Ho祅g l╪g.");
	end

	TalkEx("",strTalk);

end

--已经杀死断臂残腿与车轮霸王对话
function task_012_03_0()

local strTalk = {
	"Kh玭g xong r錳, 筺 T髖 v� T祅 Tho竔 u m蕋 m筺g. S� vi謈 qu� b蕋 ng� ta ch� t譵 頲 Nh蕋 Ph萴 Kim Cang L謓h tr猲 ngi ch髇g v� ph鬰 m謓h.",
	"Х x秠 ra chuy謓 g� v藋? V韎 b秐 l躰h c馻 筺 T髖 T祅 Tho竔 sao l筰 c� th� c飊g nhau b� m筺g? Ngi h穣 n鉯 r� h琻 ngi n祇  ra tay?",
	"Ta theo l阨 d苙 c馻 玭g 甧m M苩 n� t� v祅g n trc l╪g m� giao cho h� nh璶g l骳 n n琲  kh玭g th蕐 h�. Nh璶g l筰 nghe th蕐 ti課g c穒 nhau t� b猲 trong m�, n鉯 l� Xa Lu﹏ qu� c萵 th薾 r錳, c� kh� c g� u? V� c玭g c馻 ngi thua ta xa h穣 ngoan ngo穘 � y i M苩 n� t� v祅g 甶. c遪 n鉯 l� Ngi mu鑞 v祇 m� gi祅h b竨 v藅 trc ta sao? ng h遪g, m苩 n�  l� Xa Lu﹏ chu萵 b� cho ngi .",
	}

	TalkEx("task_012_03_0_1",strTalk);

end

--续对话
function task_012_03_0_1()

local strTalk = {
	"Sao? Ch髇g kh玭g 甧o m苩 n� m� v祇 m�? Цng ch誸, ta  d苙 l� ph秈 甧o m苩 n� m韎 v祇 m� kh玭g ng� ch髇g v蒼 ch鴑g n祇 t藅 n蕐, anh em v韎 nhau m� tranh c玭g 畂箃 l頸. Kim Cang L謓h l� t輓 v藅 t飝 th﹏ c馻 Th藀 i Kim Cang, ch髇g  b� m筺g trong m� ra sao?",
	"ng th�, ta � ngo礽 nghe th蕐 v� c飊g s鑤 ru閠 nh璶g kh玭g d竚 v祇 trong, ngh� r籲g 筺 T髖 T祅 Tho竔 l� Th藀 i Kim Cang c� th� tr� ra an to祅. Sau m閠 h錳 v蒼 ch璦 th蕐 ai tr� ra, ta  甧o m苩 n� v祇 trong m� xem th� ch� th蕐 x竎 c馻 ch髇g ngo礽 ra kh玭g th蕐 ai kh竎, s綾 m苩 t竔 甧n e l� do tr髇g c m� ch誸.",
	"M� д Vng kh� c m� m辴, ngay c� Th藀 i Kim Cang c騨g kh玭g tr竛h kh醝. Xem ra chuy謓 v祇 m� ph秈 suy t輓h l筰, gi� ch� c� th� giao vi謈 n祔 cho Th竎 B箃 Ho籲g. Ngi h穣 甶 xem h緉 u v� xong ch璦 sau  n鉯 r� m鋓 vi謈 r錳 a M苩 n� t� v祅g cho h緉  s緋 x誴 vi謈 v祇 m�.",
	}

	TalkEx("task_012_03_0_2",strTalk);

end

--续对话
function task_012_03_0_2()

local strTalk = {
	"L莕 n祔 ta kh玭g l祄 tr遪 b鎛 ph薾, c� th�  ta v祇 m� 甶襲 tra  l蕐 c玭g chu閏 t閕 kh玭g? Ta nh蕋 nh c� g緉g h誸 s鴆  ho祅 th祅h nhi謒 v�.",
	"Ngi ch� co t� tr竎h m譶h, ch� t筰 筺 T髖 T祅 Tho竔 kh玭g nghe l阨 khuy猲 n猲 t� rc h鋋 v祇 th﹏. Ta bi誸 ngi n鉵g l遪g mu鑞 l藀 c玭g nh璶g Th藀 i Kim Cang v鮝 m蕋 甶 2 ngi, t譶h h譶h trong m� l筰 kh玭g r� t鑤 nh蕋 ngi kh玭g n猲 manh ng, h穣  vi謈 n祇 cho Th竎 B箃 Ho籲g.",
	"T鑤 nh蕋 n猲 c萵 th薾 h祅h s�, ta 甶 t譵 Th竎 B箃 Ho籲g ti襫 b鑙 y. C竜 t�.",
	"T猲 n祔 qu� l� c萵 tr鋘g, b� ngo礽 i c� ch﹏ th祅h v韎 ta th鵦 ch蕋 c遪 nghi ng� th﹏ ph薾 ngi T鑞g. Vi謈 n祔 kh糿g nh? (Nh蕋 Ph萴 阯g  n緈 頲 b� m藅 c馻 B秐  S琻 H� X� T綾 ta ph秈 t譵 c竎h ng╪ c秐.)",
	}

	TalkEx("task_012_03_0_3",strTalk);

end

--发奖励
function task_012_03_0_3()

	give_zb_award(26);

	if GetTask(TASK_GET_AWARD) == 1 then
		SetTask(TASK_GET_AWARD,0);
		DelItem(2,0,750,1);--删去一品金刚令之断臂
		DelItem(2,0,751,1);--删去一品金刚令之残腿
		SetTask(TASK_XB_ID_01,15);
		--补发金丝面罩
		if GetItemCount(2,0,710) < 2 then
			AddItem(2,0,710,2,1);
		end
		TaskTip("Giao M苩 n� t� v祅g giao Th竎 B箃 Ho籲g.");
		Msg2Player("Giao M苩 n� t� v祅g giao Th竎 B箃 Ho籲g.");
		GivePlayerAward("Award_XB_26","Easy");
		GivePlayerExp(SkeyXibei,"huanglingwai")
	end
end

--还没前往与拓拔弘对话
function task_012_03_1()

local strTalk = {
	"Ngi ch� co t� tr竎h m譶h, ch� t筰 筺 T髖 T祅 Tho竔 kh玭g nghe l阨 khuy猲 n猲 t� rc h鋋 v祇 th﹏. Ta bi誸 ngi n鉵g l遪g mu鑞 l藀 c玭g nh璶g Th藀 i Kim Cang v鮝 m蕋 甶 2 ngi, t譶h h譶h trong m� l筰 kh玭g r� t鑤 nh蕋 ngi kh玭g n猲 manh ng, h穣  vi謈 n祇 cho Th竎 B箃 Ho籲g.",
	"T鑤 nh蕋 n猲 c萵 th薾 h祅h s�, ta 甶 t譵 Th竎 B箃 Ho籲g ti襫 b鑙 y. C竜 t�.",
	"T猲 n祔 qu� l� c萵 tr鋘g, b� ngo礽 i c� ch﹏ th祅h v韎 ta th鵦 ch蕋 c遪 nghi ng� th﹏ ph薾 ngi T鑞g. Vi謈 n祔 kh糿g nh? (Nh蕋 Ph萴 阯g  n緈 頲 b� m藅 c馻 B秐  S琻 H� X� T綾 ta ph秈 t譵 c竎h ng╪ c秐.)",
	}

	TalkEx("",strTalk);

end

---------------------------------- 西北区13分支1_5音绝古墓----------------------------------

--与拓拔弘对话交给其金丝面罩
function task_013_01_0()

local strTalk = {
	"Th竎 B箃 ti襫 b鑙, 玭g  quy誸 u v韎 T� M� ti襫 b鑙 ch璦??",
	"Ngi n th藅 ng l骳 ta 產ng c� chuy謓 bu錸 phi襫. D筼 trc ta quy誸 u v韎 T� M� Minh Phong ph竧 hi謓 r籲g 玭g ta xu蕋 chi猽 ch薽 h琻 x璦 r蕋 nhi襲 khi課 ta r蕋 ch竛 n秐.",
	"Hai ngi v蒼 ch璦 ph﹏ th緉g b筰 sao? N誹 kh玭g c� � ch� chi課 u th� 阯g ki誱 c騨g s� nh竛 nh蒻 th玦. T� M� ti襫 b鑙 ch綾 產ng c� chuy謓 phi襫 n穙.",
	"Ngi n鉯 kh玭g sai t� n祇, ki誱 � c馻 T� M� Minh Phong mang suy ngh�, th� m� ta c� tng 玭g ta kh玭g mu鑞 quy誸 u 甶襲 n祔 khi課 ta lo l緉g. T� M� Minh Phong lu玭 � Ph鬾g Tng ph� kh玭g mu鑞 甶 u th� ra l� v� mu鑞 n T莕 L╪g xem th�, l﹗ nay v蒼 ch璦 頲 to筰 nguy謓 n猲 lu玭 l筺h nh箃 i v韎 s� i. L莕 u ta v� h緉 quy誸 u l� do t譶h c� n猲 m韎 k輈h th輈h � ch� c馻 玭g ta m� th玦.",
	}

	TalkEx("task_013_01_0_1",strTalk);

end

--续对话
function task_013_01_0_1()

local strTalk = {
	"Ra l� v藋 ti襫 b鑙 ch璦 th� quy誸 u n c飊g ch� tr竎h s蕌 n穙. T筰 sao T� M� ti襫 b鑙 mu鑞 v祇 T莕 L╪g? Th藅 tr飊g h頿, Xa Lu﹏ B� Vng mu鑞 玭g ti誴 nh薾 vi謈 v祇 m�, y l� M苩 n� t� v祅g d飊g  v祇 m�.",
	"Chuy謓 c馻 T莕 L╪g v蒼 ch璦 c� k誸 qu� sao? Vi謈 n祔 qu� l� t鑞 nhi襲 th阨 gian, gi� l筰 c遪 n t譵 ta n鱝. C騨g may T� M� Minh Phong 產ng mu鑞 v祇 m�, tuy ta kh玭g bi誸 m鬰 ch c馻 玭g ta nh璶g ch� c莕 h緉 tr髏 b� t﹎ s� m� quy誸 u v韎 ta th�  r錳. Ngi h穣 甧m M苩 n� t� v祅g giao cho 玭g ta.",
	"H�? Ha ha� Th竎 B箃 ti猲 b鑙 l筰 l祄 theo � m譶h r錳, l莕 n祔 Xa Lu﹏ B� Vng l筰 t鴆 gi薾 cho m� xem.",
	}

	TalkEx("task_013_01_0_2",strTalk);

end

--续对话
function task_013_01_0_2()

local strTalk = {
	"C�  h緉 t鴆 gi薾 甶, ta s� ch辵 m鋓 tr竎h nhi謒. N誹  l� m蕋 i th� nh� th� th�  c遪 ng ti誧 h琻 chuy謓 c馻 T莕 L╪g n鱝. V� l筰 v蒼 c遪 1 c竔 m苩 n� ta c� th� ph竔 ngi kh竎 v祇 m� 甶襲 tra.",
	"Л頲 r錳 ta 甶 t譵 T� M� Minh Phong y.",
	"(T� M� ti猲 b鑙 c騨g t韎 T莕 L╪g, ch糿g l� 玭g ta bi誸 tin t鴆 c馻 B秐  S琻 H� X� T綾? M譶h ta 甧o m苩 n� v祇 m� c騨g kh� m筼 hi觤 chi b籲g 甶 t譵 T� M� ti襫 b鑙 d� h醝 � c馻 玭g ta.)",
	}

	TalkEx("",strTalk);
		--处理金丝面罩
	if GetItemCount(2,0,710) >= 1 then
		DelItem(2,0,710,GetItemCount(2,0,710));
		AddItem(2,0,710,1,1);
	else
		AddItem(2,0,710,1,1);
	end

	SetTask(TASK_XB_ID_01,16);
	TaskTip("Giao 1 M苩 n� t� v祅g cho T� M� Minh Phong.");
	Msg2Player("Giao 1 M苩 n� t� v祅g cho T� M� Minh Phong.");

end

--还未给司马鸣风带去金丝面罩and补发面罩（没有面罩不能进皇陵一层）
function task_013_01_1()

local strTalk = {
	"Kh玭g bi誸 t筰 sao T� M� Minh Phong c� canh c竛h trong l遪g v� T莕 L╪g, ngi h穣 giao 1 M苩 n� t� v祅g cho h緉  h緉 gi秈 quy誸 xong t﹎ nguy謓 m� s韒 quy誸 u v韎 ta.",
	};

	--丢失了面罩补发
	if GetItemCount(2,0,710) < 1 then
		AddItem(2,0,710,1,1);
		strTalk = {};
	end

	TalkEx("",strTalk);

end

--将金丝面罩交给司马鸣风
function task_013_02_0()

local strTalk = {
	"T� M� ti襫 b鑙 v蒼 kh醗 ch�? Nghe Th竎 B箃 Ho籲g ti襫 b鑙 n鉯 玭g c� chuy謓 phi襫 mu閚 n猲 kh玭g th� t藀 trung u v�?",
	"Ta  t鮪g th� c r籲g s� kh玭g ng th� v韎 ai, kh玭g ng� l筰 g苝 ph秈 Th竎 B箃 Ho籲g n猲 nh蕋 th阨 b� 玭g ta kh猽 kh輈h. Ta tng h緉 h裯 ta quy誸 u l� mu鑞 l玦 k衞 ta v祇 Nh蕋 Ph萴 阯g, th鵦 ra h緉 ch� mu鑞 so t礽 n猲 khi課 ta m蕋 h誸 � ch� chi課 u, s� r籲g n� s� l祄 h緉 th蕋 v鋘g.",
	"Th竎 B箃 ti襫 b鑙 ng l� h琲 th蕋 v鋘g nh璶g bi誸 T� M� ti襫 b鑙 lo l緉g chuy謓 T莕 L╪g, m� g莕 y ta 甶襲 tra 頲 tin t鴆 li猲 quan n T莕 L╪g n猲 sai ta n t譵 T� M� ti襫 b鑙  gi髉 玭g gi秈 t醓 n鏸 lo. g t鮪g nghe trong m� c� Kh� c kh玭g?",
	"Kh玭g gi蕌 g� ngi, ta lu玭 mu鑞 v祇 trong T莕 L╪g xem th� nh璶g lu玭 b� Kh� c trong m� l祄 ta ch飊 bc. T莕 L╪g kh玭g h� danh l� M� д Vng, Kh� c r蕋 nhi襲, ta  th� d飊g ch﹏ kh� to祅 th﹏ ng╪ c秐 kh� c  v祇 m� nh璶g v蒼 kh玭g ch辵 n鎖 n鯽 canh gi�. <sex> dng nh� r蕋 am hi觰 T莕 L╪g kh玭g bi誸 c� cao ki課 g�?",
	}

	TalkEx("task_013_02_0_1",strTalk);

end

--续对话
function task_013_02_0_1()

local strTalk = {
	"Ti襫 b鑙 kh竎h s竜 r錳, ta ch� t譶h c� bi誸 頲 m閠 s� th玭g tin trong l骳 l祄 nhi謒 v�, n誹 玭g mu鑞 v祇 trong th� c騨g 頲, nh璶g kh� c trong m� r蕋 m筺h v祇 trong  r錳 kh玭g bi誸 s鑞g ch誸 ra sao, 玭g h穣 suy ngh� cho k�.",
	"Ngi c� c竎h v祇 m� sao? T﹎ nguy謓 l﹗ nay c馻 ta ch� mu鑞 V祇 m� xem th�, v鑞  kh玭g m祅g n chuy謓 s鑞g ch誸. Nh璶g n誹 chuy謓 li猲 quan n b� m藅 c馻 Nh蕋 Ph萴 阯g th� ta c騨g kh玭g 衟 ngi, nh璶g c� th� gi髉 ta l祄 r� m閠 vi謈 kh玭g? Ta s� n p c玭g 琻 c馻 c竎 h�.",
	"Ta c� bi誸 s� v� c竎h v祇 m� nh璶g kh玭g ch綾 l� s� th祅h c玭g, ti猲 b鑙 h穣 cho ta bi誸 nguy猲 nh﹏ 玭g v祇 m�? Ta nh蕋 nh s� gi髉  玭g.",
	"Chuy謓 c竎h nay  18 n╩ r錳, l骳 tr� ta  qu� 產m m� v� thu藅 m� t筼 n猲 nghi謕 chng, T� Qu﹏ v� ta  c trong m閠 s� ghi ch衟 c� bi誸 頲 T莕 L╪g c� ch鴄 M藅 b秓 th莕 binh vi誸 M芻 u l� B閕 Ki誱  theo T莕 Vng chinh chi課 nhi襲 n╩. Th﹏ ki誱 甧n nh� m鵦, 頲 r蘮 t� s総 ng祅 n╩ tuy nh� nh璶g s綾 b衝, c� th� ph竧 huy h誸 uy l鵦 ki誱 ph竝 c馻 ta. T� Qu﹏ th鮝 l骳 ta n Hoa S琻 lu薾 ki誱  m閠 m譶h v祇 m�, n nay  18 n╩.",
	}

	TalkEx("task_013_02_0_2",strTalk);

end

--续对话
function task_013_02_0_2()

local strTalk = {
	"Th� ra l� th� n猲 ti襫 b鑙  mai danh 萵 t輈h.",
	"T� Qu﹏ v蒼 ch璦 r� s鑞g ch誸, n誹 kh玭g t譵 頲 thi th� ta s� kh玭g cam l遪g. V� c玭g thi猲 h�  nh蕋 th� sao ch�? Ngay c� ngi con g竔 m譶h y猽 qu� c騨g kh玭g gi� 頲. N誹 <sex> c� th� v祇 m� ta ch� nh� ngi 甶襲 tra tin c馻 v� ta T� Qu﹏, d� s鑞g hay ch誸 c騨g b竜 cho ta bi誸.",
	"Ti襫 b鑙 n苙g t譶h th� sao ta c� th� kh玭g gi髉? g c� y猲 t﹎, v� ch錸g 玭g t譶h s﹗ ngh躠 n苙g nh蕋 nh s� g苝 l筰 nhau. Xin c竜 t�.",
	"(Kh玭g c遪 c竎h n祇 hay h琻 l� l頸 d鬾g t譶h ngh躠 c馻 T� M� ti襫 b鑙  v祇 m�, nh ph秈 v鮝 truy t譵 B秐  S琻 H� X� T綾 v鮝 gi髉 玭g ta ho祅 th祅h t﹎ nguy謓. Ph秈 r錳  Dng H鋋  t鮪g d苙 trc khi v祇 m� h穣 n t譵 玭g ta.)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,17);
	TaskTip("H醝  Dng H鋋 chuy謓 v祇 m�.");
	Msg2Player("H醝  Dng H鋋 chuy謓 v祇 m�.");
	GivePlayerAward("Award_XB_27","Easy");
	GivePlayerExp(SkeyXibei,"lianggemianzhao")
end

--尚未询问欧阳画入墓情况
function task_013_02_1()

local strTalk = {
	"V� c玭g thi猲 h�  nh蕋 th� sao ch�? Ngay c� ngi con g竔 m譶h y猽 qu� c騨g kh玭g gi� 頲. N誹 <sex> c� th� v祇 m� ta ch� nh� ngi 甶襲 tra tin c馻 v� ta T� Qu﹏, d� s鑞g hay ch誸 c騨g b竜 cho ta bi誸.",
	"(Kh玭g c遪 c竎h n祇 hay h琻 l� l頸 d鬾g t譶h ngh躠 c馻 T� M� ti襫 b鑙  v祇 m�, nh ph秈 v鮝 truy t譵 B秐  S琻 H� X� T綾 v鮝 gi髉 玭g ta ho祅 th祅h t﹎ nguy謓. Ph秈 r錳  Dng H鋋  t鮪g d苙 trc khi v祇 m� h穣 n t譵 玭g ta.)",
	}

	TalkEx("",strTalk);

end

--询问欧阳画入墓情况
function task_013_03_0()

local strTalk = {
	"Ti襫 b鑙 t譵 頲 Cao nh薾 o tr閙 m� ch璦? Ta c莕 v祇 m� m閠 chuy課.",
	"T鑤 l緈, chuy謓 v祇 m� v� c飊g c蕄 b竎h, Tng binh m� trong m�  s鑞g l筰, ch綾 y l� s鴆 m筺h c馻 B秐  S琻 H� X� T綾 nh蕋 nh kh玭g th�  B秐  S琻 H� X� T綾 r琲 v祇 tay ngi T﹜ H�. T譶h h譶h trong m� ta c騨g kh玭g r�, e r籲g v韎 M苩 n� t� v祅g c騨g s� c� tr� ng筰, M� д Vng kh玭g th� xem thng. Ta t譵 頲 truy襫 nh﹏ c馻 Cp m� t猲 l� Li評 T飊g V﹏ .",
	"T鑤 r錳, ngi n祔 � u? Ta s� 甶 t譵 h緉.",
	"Ngi n祔 h祅h ngh� Tr閙 m� � Ph鬾g Tng ph�, tinh th玭g C竎h t筼 c� quan r蕋 am hi觰 v� T莕 L╪g. Ngi h穣 甶 d� h醝 t譶h h譶h trong m�, ta ph秈 v祇 m� trc ngi T﹜ H�, c祅g ph秈 c萵 th薾 v韎 tng binh m� v� c� quan trong m�.",
	" t� ti襫 b鑙!",
	}

	SetTask(TASK_XB_ID_01,18);
	TalkEx("",strTalk);
	TaskTip("H醝 Li評 T飊g V﹏ c竎h  v祇 Ho祅g L╪g m� th蕋.");
	Msg2Player("H醝 Li評 T飊g V﹏ c竎h  v祇 Ho祅g L╪g m� th蕋.");
	GivePlayerExp(SkeyXibei,"daomushijia")
end

--还未询问柳纵云入墓情况
function task_013_03_1()

local strTalk = {
	"Ph鬾g Tng ph� c� truy襫 nh﹏ c馻 Cp m� t猲 l� Li評 T飊g V﹏ , ngi n祔 tinh th玭g C竎h t筼 c� quan, ngi c� th� t譵 h緉  h醝 t譶h h譶h trong  ta ph秈 v祇 m� trc ngi T﹜ H�.",
	}

	TalkEx("",strTalk);

end

--询问柳纵云入墓情况启动杀怪触发器
--需要30分钟才能重新补发触发器防止刷Boss，需记录时间
function task_013_04_0()

local strTalk = {
	"Зy c� ph秈 l� Li評 T飊g V﹏? Nghe n鉯 c竎 h� l� ngi tr閙 m� n猲 mu鑞 th豱h gi竜 v礽 甶襲 v� c� m�.",
	"ng r錳. Th� ra <sex> c騨g h鴑g th� v韎 c� m� sao? C� m� v� c� quan trong  c� r蕋 nhi襲 d筺g, m� m鏸 lo筰 c� quan c� c竎h ph� gi秈 kh竎 nhau, <sex> mu鑞 bi誸 c蕌 t筼 c馻 l╪g m� n祇?",
	"g  t鮪g v祇 T莕 L╪g ch璦? C� bi誸 t譶h h譶h b猲 trong kh玭g?",
	"Sao? Ngi n鉯 T莕 L╪g? Зy� y kh玭g ph秈 n琲 ai c騨g v祇 頲. C� i ta t鮪g v祇 nhi襲 ng玦 m� nh璶g ch璦 g苝 c竔 n祇 k� l� nh� th�. Tuy l� M� д Vng nh璶g c騨g l� v藅  ch誸 v藋 m� Tng binh m� trong m� si猽 vi謙 n n鏸 g苝 ngi l� gi誸.",
	"V藋 l� chuy謓 tng binh m� s鑞g l筰 l� c� th藅, s鴆 m筺h c馻 B秐  S琻 H� X� T綾 qu� kh玭g th� 畂竛.",
	}

	--85级方能继续任务
	if GetLevel() >= 72 then
		TalkEx("task_013_04_0_1",strTalk);
	else
		strTalk = {
			"Зy c� ph秈 l� Li評 T飊g V﹏? Nghe n鉯 c竎 h� l� ngi tr閙 m� n猲 mu鑞 th豱h gi竜 v礽 甶襲 v� c� m�.",
			"ng r錳. Th� ra <sex> c騨g h鴑g th� v韎 c� m� sao? C� m� v� c� quan trong  c� r蕋 nhi襲 d筺g, m� m鏸 lo筰 c� quan c� c竎h ph� gi秈 kh竎 nhau, <sex> mu鑞 bi誸 c蕌 t筼 c馻 l╪g m� n祇?",
			"g  t鮪g v祇 T莕 L╪g ch璦? C� bi誸 t譶h h譶h b猲 trong kh玭g?",
			"Sao? Ngi n鉯 T莕 L╪g? Зy� y kh玭g ph秈 n琲 ai c騨g v祇 頲. C� i ta t鮪g v祇 nhi襲 ng玦 m� nh璶g ch璦 g苝 c竔 n祇 k� l� nh� th�. Tuy l� M� д Vng nh璶g c騨g l� v藅  ch誸 v藋 m� Tng binh m� trong m� si猽 vi謙 n n鏸 g苝 ngi l� gi誸.",
		}
		TalkEx("task_013_04_0_2",strTalk);
	end

end

--续对话
function task_013_04_0_1()

local strTalk = {
	"B秐  S琻 H� X� T綾 l� b竨 v藅 g� th�? C� li猲 quan n tng binh m� sao? Л頲 th玦 ta  quy誸 nh kh玭g n  n鱝 th� c騨g kh玭g ng筰 n鉯 ngi bi誸. T莕 L╪g r蕋 to l韓 v� chia l祄 2 t莕g. m鏸 t莕g u c� Tng binh m� tr蕁 gi�, l骳 ta t nh藀 v祇 th� b� ch髇g t蕁 c玭g n誹 ta kh玭g nhanh ch﹏ ch箉 tr鑞 b籲g m藅 o th� e l�  ph秈 b� m筺g r錳.",
	"N誹 v藋 玭g c� th� cho ta bi誸 phng ph竝  v祇 m� kh玭g?",
	"Huy謙 m� nguy hi觤 nh� c� g� hay ho ch�? n蕌 ngi c� kh╪g kh╪g mu鑞 甶 th� ph秈 c萵 th薾. M藅 o L╪g m� t莕g 1quanh co v� tr鑞g kh玭g, thi誸 ngh� b竨 v藅 頲 gi蕌 � t莕g 2. C� quan � t莕g 1 r蕋 輙 ch� c莕 M苩 n� t� v祅g l� . Nh璶g c鎛g v祇 L╪g m� t莕g 2 do Th鑞g l躰h tng binh m� tr蕁 gi�, c莕 nh b筰 25 v� v� tng binh m� v� 25 h� v� tng binh m� th� th鑞g l躰h m韎 xu蕋 hi謓. ng r錳, M� Kim ph� v藅 gia truy襫 c馻 ta b� Th鑞g l躰h tng binh m� cp m蕋, n誹 ngi nh b筰 th鑞g l躰h c� th� gi髉 ta l蕐 l筰 n� kh玭g? Khi tr� v� y ta s� d箉 ngi c竎h  v祇 t莕g 2.",
	" t� ti猲 sinh ch� gi竜, n誹 kh玭g th� nh b筰 Th鑞g l躰h tng binh m� m� l猲 t莕g 2 ch輓h l� t� t譵 ch� ch誸. g h穣 i tin t鴆 c馻 ta.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,19);
	SetTask(TASK_BINGMAYONGTONGLING_TIME,GetTime());--记录时间
	CreateTrigger(0,1231,KILL_XB_KONGSHOUBINGMAYONG);--杀怪触发器
	CreateTrigger(0,1232,KILL_XB_CHINUBINGMAYONG);--杀怪触发器
	--清空先前使用变量状态
	SetTask(KONGSHOU25_STATE,0);
	SetTask(CHINU25_STATE,0);
	TaskTip("дn l╪g m� t莕g 1 ti猽 di謙 25 V� v� tng binh m� v� H� v� tng binh m�.");
	Msg2Player("дn l╪g m� t莕g 1 ti猽 di謙 25 V� v� tng binh m� v� H� v� tng binh m�, sau  ti猽 di謙 Th鑞g l躰h tng binh m� l蕐 M� Kim Ph� v� cho Li評 T飊g V﹏.");
end

--续对话
function task_013_04_0_2()

local strTalk = {
	"V藋 l� chuy謓 tng binh m� s鑞g l筰 l� c� th藅, s鴆 m筺h c馻 B秐  S琻 H� X� T綾 qu� kh玭g th� 畂竛.",
	"B秐  S琻 H� X� T綾 l� b竨 v藅 g� th�? C� li猲 quan n tng binh m� sao? Л頲 th玦 ta  quy誸 nh kh玭g n  n鱝 th� c騨g kh玭g ng筰 n鉯 ngi bi誸. T莕 L╪g r蕋 to l韓 v� chia l祄 2 t莕g. m鏸 t莕g u c� Tng binh m� tr蕁 gi�, l骳 ta t nh藀 v祇 th� b� ch髇g t蕁 c玭g n誹 ta kh玭g nhanh ch﹏ ch箉 tr鑞 b籲g m藅 o th� e l�  ph秈 b� m筺g r錳.",
	"N誹 v藋 玭g c� th� cho ta bi誸 phng ph竝  v祇 m� kh玭g?",
	"Li評 T鑞g V﹏: theo ta th蕐, th鵦 l鵦 hi謓 t筰 c馻 <sex>, v祇 L╪g C� m� ch� e l� m閠 甶 kh玭g tr� l筰, h穣 quay v� luy謓 th猰 1 th阨 gian 甶, t c蕄 72 h穣 n t譵 ta",
	" t� ti襫 b鑙."
	}

	TalkEx("",strTalk);
end


--尚未取回摸金符and需要30分钟才能重新补发触发器防止刷Boss
function task_013_04_1()

local strTalk = {};

	--完成任务但没有杀死统领
	if GetTask(KONGSHOU25_STATE) == 1 and GetTask(CHINU25_STATE) == 1 then
		if (GetTime() - GetTask(TASK_BINGMAYONGTONGLING_TIME)) < 1800 then -- 判断时间限制
			strTalk = {
				"C鎛g v祇 L╪g m� t莕g 2 do Th鑞g l躰h tng binh m� tr蕁 gi�, c莕 nh b筰 25 v� v� tng binh m� v� 25 h� v� tng binh m� th� th鑞g l躰h m韎 xu蕋 hi謓. ng r錳, M� Kim ph� v藅 gia truy襫 c馻 ta b� Th鑞g l躰h tng binh m� cp m蕋, n誹 ngi nh b筰 th鑞g l躰h c� th� gi髉 ta l蕐 l筰 n� kh玭g? Khi tr� v� y ta s� ch� ngi c竎h  v祇 t莕g 2.",
				};
		else --重新发布任务
			CreateTrigger(0,1231,KILL_XB_KONGSHOUBINGMAYONG);--杀怪触发器
			CreateTrigger(0,1232,KILL_XB_CHINUBINGMAYONG);--杀怪触发器
			SetTask(KONGSHOU25_STATE,0);
			SetTask(CHINU25_STATE,0);
			strTalk = {
				"C鎛g v祇 L╪g m� t莕g 2 do Th鑞g l躰h tng binh m� tr蕁 gi�, c莕 nh b筰 25 v� v� tng binh m� v� 25 h� v� tng binh m� th� th鑞g l躰h m韎 xu蕋 hi謓. ng r錳, M� Kim ph� v藅 gia truy襫 c馻 ta b� Th鑞g l躰h tng binh m� cp m蕋, n誹 ngi nh b筰 th鑞g l躰h c� th� gi髉 ta l蕐 l筰 n� kh玭g? Khi tr� v� y ta s� ch� ngi c竎h  v祇 t莕g 2.",
				};
			TaskTip("дn l╪g m� t莕g 1 ti猽 di謙 25 V� v� tng binh m� v� H� v� tng binh m�.");
			Msg2Player("o m苩 n� t� v祅g r錳 v祇 l╪g m� t莕g 1, ti猽 di謙 25 v� v� tng binh m� v� 25 h� v� tng binh m�, sau  nh b筰 Th鑞g l躰h tng binh m� 畂箃 l筰 M� Kim ph� cho Li評 T飊g V﹏.");
		end
	--尚未完成任务补发触发器
	else
		if GetTrigger(KILL_XB_KONGSHOUBINGMAYONG) == 0 and GetTask(KONGSHOU25_STATE) == 0 then
			CreateTrigger(0,1231,KILL_XB_KONGSHOUBINGMAYONG);--杀怪触发器
			TaskTip("дn l╪g m� t莕g 1 ti猽 di謙 25 V� v� tng binh m� v� H� v� tng binh m�.");
			Msg2Player("o m苩 n� t� v祅g r錳 v祇 l╪g m� t莕g 1, ti猽 di謙 25 v� v� tng binh m� v� 25 h� v� tng binh m�, sau  nh b筰 Th鑞g l躰h tng binh m� 畂箃 l筰 M� Kim ph� cho Li評 T飊g V﹏.");
		elseif GetTrigger(KILL_XB_CHINUBINGMAYONG) == 0 and GetTask(CHINU25_STATE) == 0 then
			CreateTrigger(0,1232,KILL_XB_CHINUBINGMAYONG);--杀怪触发器
			TaskTip("дn l╪g m� t莕g 1 ti猽 di謙 25 V� v� tng binh m� v� H� v� tng binh m�.");
			Msg2Player("o m苩 n� t� v祅g r錳 v祇 l╪g m� t莕g 1, ti猽 di謙 25 v� v� tng binh m� v� 25 h� v� tng binh m�, sau  nh b筰 Th鑞g l躰h tng binh m� 畂箃 l筰 M� Kim ph� cho Li評 T飊g V﹏.");
		else--正常任务中
			strTalk = {
				"C鎛g v祇 L╪g m� t莕g 2 do Th鑞g l躰h tng binh m� tr蕁 gi�, c莕 nh b筰 25 v� v� tng binh m� v� 25 h� v� tng binh m� th� th鑞g l躰h m韎 xu蕋 hi謓. ng r錳, M� Kim ph� v藅 gia truy襫 c馻 ta b� Th鑞g l躰h tng binh m� cp m蕋, n誹 ngi nh b筰 th鑞g l躰h c� th� gi髉 ta l蕐 l筰 n� kh玭g? Khi tr� v� y ta s� ch� ngi c竎h  v祇 t莕g 2.",
				};
		end
	end

	TalkEx("",strTalk);

end

--刷出兵马俑统领
function CreateBingMaYongTongLing()

local nMapPosIndex = random(1,getn(BingMaYongTongLing_MapData));
local nNpcIndex = 0;

	Msg2Player("Th鑞g l躰h tng binh m� xu蕋 hi謓 r錳!")
	nNpcIndex = CreateNpc("L穘h qu﹏ tng binh m�","Th鑞g l躰h tng binh m�",513,BingMaYongTongLing_MapData[nMapPosIndex][1],BingMaYongTongLing_MapData[nMapPosIndex][2]);
	SetNpcScript(nNpcIndex,"\\script\\西北区\\皇陵墓室一层\\npc\\兵马俑统领.lua");
	SetNpcLifeTime(nNpcIndex,1500);
	Msg2Player("Th鑞g l躰h tng binh m� xu蕋 hi謓 t筰  "..BingMaYongTongLing_MapData[nMapPosIndex][3]..", "..BingMaYongTongLing_MapData[nMapPosIndex][4].."  mau 甶 ti猽 di謙  l蕐 M� Kim Ph�.")
	TaskTip("Th鑞g l躰h tng binh m� xu蕋 hi謓 t筰 "..BingMaYongTongLing_MapData[nMapPosIndex][3]..", "..BingMaYongTongLing_MapData[nMapPosIndex][4].." mau 甶 ti猽 di謙  l蕐 M� Kim Ph�.");
end


---------------------------------- 西北区14分支1_6入墓之争----------------------------------
--杀死兵马俑统领取得摸金符后与柳纵云对话
function task_014_01_0()

local strTalk = {
	"g xem th� y c� ph秈 l� M� Kim ph� kh玭g? Ta  nh b筰 l穘h qu﹏ tng binh m�, c鎛g v祇 l╪g m� t莕g 2  xu蕋 hi謓 nh璶g kh玭g th� 甶 v祇, l祄 th� n祇  v祇 頲 y?",
	"T鑤, ng l� M� Kim ph� r錳. <sex> th藅 l� t礽 c� th� nh b筰 s� tng binh m� . N誹 mu鑞 v祇 b猲 trong c� m� th� ph秈 c� c竎h,  l� c� m� u c� d� th�, c� quan ho芻 x竎 ngi l祄tr蕁 m� linh v藅 M� д Vng c騨g th�.",
	"Nh璶g ta kh玭g th蕐 trong l╪g m� t莕g 1 c� linh v藅 g�, ch� th蕐 r蕋 nhi襲 tng binh m�.",
	"Л琻g nhi猲 r錳, m� c馻 T莕 Vng sao d� d祅g  ngi ngo礽 qu蕐 nhi評? Huy謙 m� n祔 kh玭g ch� c� Linh v藅 r蕋 m筺h tr蕁 gi� c祅g l筰 c� phong th駓 tr薾. n誹 kh玭g ph� 頲 n� e r籲g h譶h d竛g c馻 Linh v藅 c騨g kh玭g th蕐 頲. Tuy c竎h b� tr� c馻 c竎 m� th蕋 u kh玭g gi鑞g nhau nh璶g c騨g kh玭g n籱 ngo礽 甶觤 chung, ngi c莕 筺 Th駓 Ch� v� La Canh  ph� n�.",
	"Ph� phong th駓 tr薾 c莕 筺 Th駓 Ch� v� La Canh ta c� th� t譵 ch髇g � u?",
	}

	TalkEx("task_014_01_0_1",strTalk);

end

--续对话
function task_014_01_0_1()

local strTalk = {
	"La Canh  t譵 huy謙 phong th駓, 筺 Th駓 Ch�  ng v祇 huy謙 phong th駓, ch� khi ph� 頲 4 甶觤 phong th駓 m韎 v祇 頲 m藅 o c馻 tr蕁 m� linh v藅, ph� v� tr蕁 m� linh v藅 m韎 v祇 頲 t莕g 2. Hai th� n祔 v鑞 d� ta u c� nh璶g l莕 trc khi n m� cung sa m筩 t譵 b竨 v藅 c� gh� qua Dc Vng C鑓, b� Ngi T﹜ H� �  cp m蕋 r錳.",
	"Sao? B� Ngi T﹜ H� cp 甶 r錳 sao?",
	"K� ra c騨g l� Ngi T﹜ H� sao l筰 甶 cp th� kh玭g c� t竎 d鬾g g� ngo礽 vi謈 tr閙 m� th� ch�. S� ngi qua l筰 � Dc Vng C鑓 l� do v� s� T﹜ H� v� d騨g s� T﹜ H� gi� d筺g.",
	"Kh玭g xong r錳, c秏 琻 ti猲 sinh, ta 甶 t譵 筺 Th駓 Ch� v� La Canh v� y.",
	"(Ngi T﹜ H�  t藀 h頿 t� l骳 n祇 th�? T筸 g竎 l筰 chuy謓 n祔, mau n Dc Vng C鑓 l蕐 4 筺 Th駓 Ch� v� La Canh.)",
	}

	TalkEx("",strTalk);
	DelItem(2,0,712,1);--删去摸金符
	SetTask(TASK_XB_ID_01,21);
	CreateTrigger(0,1233,KILL_XB_XIXIAWUSHI);--杀怪触发器
	CreateTrigger(0,1234,KILL_XB_XIXIAYONGSHI);--杀怪触发器
	SetTask(FENGSHUIXUE_ID,0);--对风水穴相关变量清零
	SetTask(FENGSHUIXUE_STATE,0);--对风水穴相关变量清零
	SetTask(TASK_BINGMAYONGTONGLING_TIME,0);--对统领刷新时间变量清零
	TaskTip("дn Dc Vng C鑓 thu th藀 4 筺 Th駓 Ch� v� 1 La Canh t� v� s� T﹜ H� v� d騨g s� T﹜ H�.");
	Msg2Player("дn Dc Vng C鑓 thu th藀 4 筺 Th駓 Ch� v� 1 La Canh t� v� s� T﹜ H� v� d騨g s� T﹜ H�.");
	GivePlayerAward("Award_XB_28","Easy");
	GivePlayerExp(SkeyXibei,"mojinfu")
end

--取得或未取得断水杵与罗庚
function task_014_02_0()

local strTalk = {};

	--带回断水杵与罗庚
	if GetItemCount(2,0,713) >= 4 and GetItemCount(2,0,714) >= 1 then
		strTalk = {
			"Li評 ti猲 sinh xem th� y c� ph秈 筺 Th駓 Ch� v� La Canh kh玭g, nh鱪g th� n祔 l祄 sao s� d鬾g?",
			"ng r錳 nh璶g th藅 c� l鏸 v韎 <sex>, nh鱪g th� n祔 e r籲g ch璦 th� ph� phong th駓 tr薾. V� ch� c� Ph� Phong Ch飝 m韎 c� th� ng 筺 Th駓 Ch� v祇 huy謙 phong th駓, v鮝 m韎 c� ngi t� x璶g l� Nh蕋 Ph萴 阯g kim cang tr秓 vng n h醝 ta l蕐 Ph� Phong Ch飝. N� l� m藅 b秓 tr閙 m� gia truy襫 c馻 nh� ta v鑞 nh cho ngi mn th� sao ta a cho h緉? Th� l� h緉 ra tay cp ch飝 c馻 ta v� k誸 qu� ch飝  b� h緉 cp 甶.",
			"Sao? H緉 t� x璶g l� Nh蕋 Ph萴 阯g kim cang sao?",
			}

		TalkEx("task_014_02_0_1",strTalk);

	--没有带回物品and补发任务触发器
	else
		strTalk = {
			"筺 Th駓 Ch� v� La Canh v鑞 d� ta u c� nh璶g l莕 trc khi n m� cung sa m筩 t譵 b竨 v藅 c� gh� qua Dc Vng C鑓, b� Ngi T﹜ H� �  cp m蕋 r錳. Sao ch髇g l筰 cp d鬾g c� tr閙 m� c馻 ta th藅 k� l�.",
			}
		if	GetTrigger(KILL_XB_XIXIAWUSHI) == 0 or GetTrigger(KILL_XB_XIXIAYONGSHI) == 0 then
			if GetTrigger(KILL_XB_XIXIAWUSHI) == 0 then
				CreateTrigger(0,1233,KILL_XB_XIXIAWUSHI);--杀怪触发器
			end
			if GetTrigger(KILL_XB_XIXIAYONGSHI) == 0 then
				CreateTrigger(0,1234,KILL_XB_XIXIAYONGSHI);--杀怪触发器
			end
			TaskTip("дn Dc Vng C鑓 thu th藀 4 筺 Th駓 Ch� v� 1 La Canh t� v� s� T﹜ H� v� d騨g s� T﹜ H�.");
			Msg2Player("дn Dc Vng C鑓 thu th藀 4 筺 Th駓 Ch� v� 1 La Canh t� v� s� T﹜ H� v� d騨g s� T﹜ H�.");
		end
		TalkEx("",strTalk);
	end

end

--续对话
function task_014_02_0_1()

local strTalk = {
	"ng r錳,  l� do Ngi T﹜ H� gi� d筺g. Ch糿g l� Ngi T﹜ H� l筰 mu鑞 甶 tr閙 m�, sao ch髇g l筰 cp d鬾g c� tr閙 m� c馻 ta? Ngi ph秈 d飊g La Canh t譵 huy謙 phong th駓 sau  d飊g Ph� Phong Ch飝  ng 筺 Th駓 Ch� v祇, th� c� th� ph� phong th駓 tr薾 m� m藅 o c馻 tr蕁 m� linh v藅, C� quan th� m� nh﹏ � c鎛g v祇 t莕g 2 s� d蒼 ngi v祇 trong.",
	"Chuy謓 kh玭g hay r錳.  t� ti猲 sinh ch� gi竜, ta ph秈 n l╪g m� m閠 chuy課, c竜 t�.",
	"(Ch糿g l� Nh蕋 Ph萴 阯g  t譵 頲 c竎h v祇 m�? H誸 cp La Canh v� 筺 Th駓 Ch� l筰 畂箃 Ph� Phong Ch飝, Th藀 i Kim Cang c騨g h祅h ng r錳 th� nguy cho B秐  S琻 H� X� T綾. Kh玭g th�  Ngi T﹜ H� t 頲 m鬰 ch, hay l� ta tr� v� h醝 Th竎 B箃 Ho籲g  xem sao.)",
	}

	RemoveTrigger(GetTrigger(KILL_XB_XIXIAWUSHI));
	RemoveTrigger(GetTrigger(KILL_XB_XIXIAYONGSHI));
	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,22);
	TaskTip("T譵 Th竎 B箃 Ho籲g 甶襲 tra v� tr秓 vng.");
	Msg2Player("T譵 Th竎 B箃 Ho籲g 甶襲 tra v� tr秓 vng.");
	GivePlayerAward("Award_XB_30","Easy");
	GivePlayerExp(SkeyXibei,"rumujiguan")
end

--尚未与拓拔弘对话(补发断水杵与罗庚)
function task_014_02_1()

local strSay = {
	"<sex> sao l筰 quay v� r錳?",
	"T筰 h� l祄 m蕋 筺 Th駓 Ch� v� La Canh r錳/task_014_02_2",
	"Kh玭g c� g�/task_014_02_3",
	}

	SelectSay(strSay);

end

--补发断水杵与罗庚
function task_014_02_2()

local strTalk = {};

	--身上带有4个断水杵与罗庚
	if GetItemCount(2,0,713) >= 4 and GetItemCount(2,0,714) >= 1 then
		strTalk = {
			"<sex> t譵 k� l筰 xem, ta v鮝 th蕐 4 筺 Th駓 Ch� v� La Canh trong ba l� c馻 ngi, s� � nh� th� sao m� v祇 trong l╪g m� ch�?",
			"L阨 c馻 ti襫 b鑙 n鉯 ch� ph秈, l莕 sau ta s� c萵 th薾 h琻.",
			};
		TalkEx("",strTalk);
		return
	end

	if GetItemCount(2,0,713) < 4 then
		AddItem(2,0,713,(4-GetItemCount(2,0,713)),1);
	end

	if GetItemCount(2,0,714) < 1 then
		AddItem(2,0,714,1,1);
	end

	strTalk = {
		"T猲 Nh蕋 Ph萴 阯g kim cang tr秓 vng n祇   cp Ph� Phong Ch飝 c馻 ta. Kh玭g c� Ph� Phong Ch飝 th� kh玭g th� ph� phong th駓 tr薾 trong m� c騨g kh玭g th� m� m藅 o c馻 tr蕁 m� linh v藅.",
		"(Ch糿g l� Nh蕋 Ph萴 阯g  t譵 頲 c竎h v祇 m�? Nguy cho B秐  S琻 H� X� T綾 r錳, kh玭g th�  Ngi T﹜ H� t 頲 m鬰 ch, hay l� ta tr� v� h醝 Th竎 B箃 Ho籲g  xem sao.)",
		};
	TalkEx("",strTalk);
end

--还没与拓拔弘对话
function task_014_02_3()

local strTalk = {
	"T猲 Nh蕋 Ph萴 阯g kim cang tr秓 vng n祇   cp Ph� Phong Ch飝 c馻 ta. Kh玭g c� Ph� Phong Ch飝 th� kh玭g th� ph� phong th駓 tr薾 trong m� c騨g kh玭g th� m� m藅 o c馻 tr蕁 m� linh v藅.",
	"(Ch糿g l� Nh蕋 Ph萴 阯g  t譵 頲 c竎h v祇 m�? Nguy cho B秐  S琻 H� X� T綾 r錳, kh玭g th�  Ngi T﹜ H� t 頲 m鬰 ch, hay l� ta tr� v� h醝 Th竎 B箃 Ho籲g  xem sao.)",
	};

	TalkEx("",strTalk);

end

---------------------------------- 西北区15分支1_6古墓风云----------------------------------
--与拓拔弘对话得知爪王已经取得破风槌进入陵墓
function task_015_01_0()

local strTalk = {
	"Cu鑙 c飊g ngi  quay v� r錳 �, T� M� Minh Phong ch綾  nh薾 頲 Kim Ti Di謓 Tr竜 r錳 ch�?",
	"(Vi謈 T� M� ti襫 b鑙 ch璦 v祇 m� hay l� kh玭g n猲 ti誸 l� s� t鑤 h琻,  tr竛h phi襫 ph鴆 b猲 ngo礽.)",
	"T� M� ti襫 b鑙  nh薾 頲 Kim Ti Di謓 Tr竜, th� ra 玭g ta v祇 m� l� mu鑞 t譵 ngi v�  ly t竛 18 n╩, kh� n鏸 ch璦 ngh� ra c竎h gi秈 kh� c trong m�, cho n猲 v蒼 ch璦 to筰 nguy謓. L莕 n祔 c� th� v祇 m�, xem nh� c騨g th醓 頲 t﹎ nguy謓.",
	"T鑤 l緈, i t﹎ nguy謓 c馻 玭g ta ho祅 th祅h, ta s� h裯 玭g ta u m閠 tr薾. H蘮 chi l莕 trc  s鴆 c飊g ta 玭g ta c� v� lo ra, th� ra 產ng lo l緉g cho v�, kh� tr竛h vi謈 玭g ta l璾 l筩 18 n╩ � Ph鬾g Tng, n誹 玭g ta c� th� t譵 頲 tung t輈h c馻 v� m譶h, r錳 m韎 c飊g ta thi th� m閠 tr薾, nh� th� ch糿g ph秈 v裯 c� i 阯g sao?",
	"g kh玭g c遪 mu鑞 chi猽 m� T� M� ti襫 b鑙 n鱝 �?",
	"�.Ngi tr鋘g t譶h tr鋘g ngh躠 t筰 Nh蕋 ph萴 阯g ch� c� th� l� ngi ch璦 g苝 th阨, th猰 v祇 v� c玭g cao cng, kh玭g ph秈 l� ta d� d祅g n nh薾, chuy謓 chi猽 m� nh蕋 nh kh玭g th� mi詎 cng r錳. Chi b籲g c� theo c秏 h鴑g, t薾 t譶h lu薾 v�, tr猲 i n祔 c� chuy謓 g� vui th輈h h琻 vi謈 trau d錳 v� h鋍? l祄 sao c� th� b� qua i th� ng g阭 n祔? 蕐...Hay l� trong khi ch� i anh ta c総 t t﹎ s�, ch髇g ta so t礽 m閠 ch髏?",
	}

	TalkEx("task_015_01_0_1",strTalk);

end

--续对话
function task_015_01_0_1()

local strTalk = {
	"V穘 b鑙 kh玭g d竚, hay l�  v穘 b鑙 chia s� b韙 m閠 v礽 vi謈 gi髉 ti襫 b鑙. Ti襫 b鑙 c� 甶襲 chi c╪ d苙?",
	"T鑤, thi誹 ni猲 tr� tu鎖 th� n猲 r蘮 luy謓 nhi襲. Nh璶g ta  giao vi謈 v祇 Ho祅g L╪g cho Tr秓 Vng m閠 trong Th藀 i kim cang. N誹 kh玭g c� g� thay i th� v藅 ph萴 m� ta nh薾 頲 nh蕋 nh s� � trong rng � L╪g m� t莕g 2. Sau khi th╩ d� th� ngi gi� rng ch輓h l� Qu� tng qu﹏, ta s� r籲g vi謈 n祔 qu� kh�, ngi kh玭g  s鴆, cho n猲  giao cho Tr秓 Vng l祄. Ngi ng lo, c� luy謓 t藀 cho gi醝, sau n祔 s� c遪 nhi襲 c� h閕 th� s鴆.",
	"(Kh玭g 頲 r錳, Tr秓 Vng qu� nhi猲  b総 u h祅h ng, Nh蕋 Ph萴 Л阯g  c� t譶h b竜 ch輓h x竎 nh� th�, n誹 kh玭g v﹜ nh Tr秓 Vng th� e r籲g b筰 s� 総 th祅h, kh玭g c遪 阯g r髏 lui.)",
	"M芻 d� ta kh玭g giao cho ngi vi謈 n祔, nh璶g ngi v蒼 c� h誸 s鴆 m� kh玭g than v穘, th藅 l� ng khen. Ta s� th╪g ch鴆 cho ngi th祅h Nh蕋 Ph萴 Л阯g H� D鵦, k� t� h玬 nay, h� Nh蕋 Ph萴 Л阯g kim cang nh譶 th蕐 danh hi謚 n祔, th� s� s絥 s祅g h頿 t竎 c飊g ngi.",
	" t� ti襫 b鑙  quan t﹎  b箃, t筰 h� xin c竜 t�."
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,23);
	TaskTip("дn Ho祅g l╪g m� t莕g 1 gi誸 ch誸 Tr秓 Vng l蕐 Ph� phong ch飝 m� th玭g o t莕g 2.");
	Msg2Player("дn Ho祅g l╪g m� t莕g 1 gi誸 ch誸 Tr秓 Vng l蕐 Ph� phong ch飝 m� th玭g o t莕g 2.");
	add_xb_title(4);
	GivePlayerExp(SkeyXibei,"pofengchui")
end

--尚未杀死爪王与拓拔弘对话
function task_015_01_1()

local strTalk = {
	"N誹 kh玭g c� g� thay i th� v藅 ph萴 m� ta nh薾 頲 nh蕋 nh s� � trong rng � L╪g m� t莕g 2. Sau khi th╩ d� th� ngi gi� rng ch輓h l� Qu� tng qu﹏, ta s� r籲g vi謈 n祔 qu� kh�, ngi kh玭g  s鴆, cho n猲  giao cho Tr秓 Vng l祄. Ngi ng lo, c� luy謓 t藀 cho gi醝, sau n祔 s� c遪 nhi襲 c� h閕 th� s鴆.",
	"(Kh玭g 頲 r錳, Tr秓 Vng qu� nhi猲  b総 u h祅h ng, Nh蕋 Ph萴 Л阯g  c� t譶h b竜 ch輓h x竎 nh� th�, n誹 kh玭g v﹜ nh Tr秓 Vng th� e r籲g b筰 s� 総 th祅h, kh玭g c遪 阯g r髏 lui.)"
	}

	TalkEx("",strTalk);

end

--已经破坏一层四个风水穴和守墓人对话
function task_015_02_0()

local strTalk = {};
local nMapDataIndex = random(1,getn(Zhenmushou_MapData));
local xWPos,yWPos,xPos,yPos = Zhenmushou_MapData[nMapDataIndex][1],Zhenmushou_MapData[nMapDataIndex][2],Zhenmushou_MapData[nMapDataIndex][3],Zhenmushou_MapData[nMapDataIndex][4]
local nNpcIndex = 0;

	--玩家若任务失败需要过30分钟才能重新刷处镇墓兽
	if GetTime()-GetTask(CREAT_ZHENMUSHOU_TIME)	>= 1800 then

		strTalk = {
			"Th� m� nh﹏: Tr蕁 m� linh th�  xu蕋 hi謓, mau ti猽 di謙!",
			"Tr蕁 m� linh th�: G� g�!!!",
			"B筺 nh譶 th蕐 m閠 con v藅 th藅 l韓 xu蕋 hi謓 � ("..xPos..", "..yPos.."), ch綾 l� Tr蕁 m� th� m� Li評 ti襫 b鑙  n鉯, mau ti謚 di謙 n�!"
			}

		SetTask(CREAT_ZHENMUSHOU_TIME,GetTime());--记录镇墓兽刷新时间
		nNpcIndex = CreateNpc("Tr蕁 M� Th�","Tr蕁 M� Th�",513,xWPos,yWPos);
		SetNpcScript(nNpcIndex,"\\script\\西北区\\皇陵墓室一层\\npc\\镇墓兽.lua");
		SetNpcLifeTime(nNpcIndex,1500);
		TaskTip("Tr蕁 m� th� xu蕋 hi謓 �  "..xPos..", "..yPos.." , mau n t蕁 c玭g n�.")
		Msg2Player("Tr蕁 m� th� xu蕋 hi謓 �  "..xPos..", "..yPos.." , mau n nh b筰 n� v� m� th玭g o v祇 l╪g m� t莕g 2.");
		GivePlayerExp(SkeyXibei,"fengshuixue")
	else
		strTalk = {
			"Th� m� nh﹏: 厖",
			"H譶h nh� ch糿g c� ph秐 鴑g g� c�, c� c竎h 30 ph髏 l� Tr蕁 m� th� xu蕋 hi謓, h穣 i m閠 l骳 r錳 th� l筰 sau!"
			}

	end

	TalkEx("",strTalk);

end

--已经领取任务但还未破坏风水穴与守墓人对话
function task_015_02_1()

local strTalk = {
	"Th� m� nh﹏: 厖",
	"Theo l阨 Li評 ti襫 b鑙, c莕 d飊g 筺 th駓 ch� v� Ph� phong ch飝, sau  nh� s� gi髉  c馻 La Canh t譵 4 c竔 Phong th駓 huy謙 ph� h駓 ch髇g th� c� th� d� 頲 Tr蕁 m� linh th� � t莕g 2."
	};

	TalkEx("",strTalk);

end

--没有领取任务与守墓人对话
function task_015_02_2()

local strTalk = {
	"Th� m� nh﹏: 厖",
	};

	TalkEx("",strTalk);

end

--已经打倒四个镇墓将军和守墓将军对话
function task_015_03_0()

local strTalk = {};
local nMapDataIndex = random(1,getn(GuiJiangJun_MapData));
local xWPos,yWPos,xPos,yPos = GuiJiangJun_MapData[nMapDataIndex][1],GuiJiangJun_MapData[nMapDataIndex][2],GuiJiangJun_MapData[nMapDataIndex][3],GuiJiangJun_MapData[nMapDataIndex][4]
local nNpcIndex = 0;

	--玩家若任务失败需要过30分钟才能重新刷出鬼将军
	if GetTime()-GetTask(CREAT_GUIJIANGJUN_TIME)	>= 1800 then

		strTalk = {
			"Th� m� tng qu﹏: Qu� tng qu﹏  xu蕋 hi謓, mau nh!",
			"Qu� tng qu﹏: G� g�!!!",
			"B筺 nh譶 th蕐 m閠 con v藅 th藅 l韓 xu蕋 hi謓 � ("..xPos..", "..yPos.."), ch綾 l� Qu� tng qu﹏ trong b鴆 th� T﹜ H�  nh綾 n, mau nh b筰 n� v� l蕐 v藅 ph萴 trong b秓 rng!"
			}

		SetTask(CREAT_GUIJIANGJUN_TIME,GetTime());--记录鬼将军刷新时间
		nNpcIndex = CreateNpc("T﹜ B綾 Qu� Tng u","Qu� Tng Qu﹏",514,xWPos,yWPos);
		SetNpcScript(nNpcIndex,"\\script\\西北区\\皇陵墓室二层\\npc\\鬼将军.lua");
		SetNpcLifeTime(nNpcIndex,1500);
		Msg2Player("Qu� tng qu﹏ xu蕋 hi謓 �  "..xPos..", "..yPos.."  , mau nh b筰 n� v� l蕐 v藅 ph萴 trong b秓 rng.")
		TaskTip("Qu� tng qu﹏ xu蕋 hi謓 �  "..xPos..", "..yPos.."  , mau nh b筰 n� v� l蕐 v藅 ph萴 trong b秓 rng.");

	else

		strTalk = {
			"Th� m� tng qu﹏: 厖",
			"H譶h nh� ch糿g c� ph秐 鴑g g� c�, c� c竎h 30 ph髏 l� Qu� tng qu﹏ xu蕋 hi謓, h穣 i m閠 l骳 r錳 th� l筰 sau!"
			}

	end

	TalkEx("",strTalk);

end

--已经领取任务但还未破坏风水穴与守墓人对话
function task_015_03_1()

local strTalk = {
	"Th� m� tng qu﹏: 厖",
	"Theo nh� trong b鴆 th� T﹜ H�, n誹 nh b筰 4 v� Tr蕁 m� tng qu﹏ Йng Nam T﹜ B綾 th� c� th� nh th鴆 Qu� tng qu﹏ 產ng gi� b秓 rng."
	};

	TalkEx("",strTalk);

end

--没有领取任务与守墓将军对话
function task_015_03_2()

local strTalk = {
	"Th� m� tng qu﹏: 厖",
	};

	TalkEx("",strTalk);

end

--打败鬼将军后与司马鸣风对话
function task_015_04_0()

local strTalk = {
	"T� M� ti襫 b鑙, t筰 h�  t譵 頲 Ng鋍 b閕 v� M芻 u ki誱, ti襫 b鑙 c� nh薾 ra v藅 n祔 kh玭g?",
	"Зy l� �..Minh phong qu鷑h ng鋍 y猲 h祅, h錸g nhan tng t� nan ho祅. T� Qu﹏  甧o ng鋍 n祔, v� kh玭g h� th竜 xu鑞g bao gi�, l� n祇�.l� n祇�.T� Qu﹏�..",
	"Ti襫 b鑙�.xin h穣 n衝 產u thng, t筰 h� kh玭g t譵 th蕐 thi th� trong m�, kh玭g ch鮪g hi襫 th� c馻 玭g v蒼 c遪 s鑞g.",
	"厖..",
	"厖�",
	"Trong l╪g hi觤 竎 tr飊g tr飊g, T� Qu﹏ e l� l祅h 輙 d� nhi襲, 產 t� <sex>  an 駃, ta c騨g kh玭g c莕 ph秈 t� l鮝 d鑙 m譶h, kh玭g t譵 頲 thi th� c馻 T� Qu﹏ trong l遪g ra c騨g  ngh� ra 頲 t譶h hu鑞g x蕌 nh蕋. Chuy觧 ch骳 phi猽 linh nh蕋 m閚g qui, i nguy謙 tr� i kh玭g th� th駓, thi猲 � b蕋 l﹏ c竛h tri猰 y, tr莕 t輈h nan t莔 t骳 nguy謓 vi. M芻 u ki誱 n祔 c莕  l祄 g� n鱝 ch�?",
	"Ti襫 b鑙厖�",
	}

	TalkEx("task_015_04_0_1",strTalk);

end

--续对话
function task_015_04_0_1()

local strTalk = {
	"L� m閠 th莕 binh th� sao ch�? S鑞g � th� gian n祔 ch� g﹜ h筰 cho nh﹏ gian, chi b籲g ch誸 甶 cho xong. V� c玭g thi猲 h�  nh蕋 l� c竔 g� c� ch�? Cu鑙 c飊g th� c騨g r琲 xu鑞g h� s﹗ nghi謙 ng�, kh玭g th� c飊g nhau n ch﹏ tr阨 g鑓 b�, gi� nh� nc ch秠 ng t﹜.",
	"Ti襫 b鑙 ng qu� 產u l遪g, l謓h th� bi誸 頲 trong l╪g m� c� Th莕 binh, 琻g nhi猲 l� ph秈 bi誸 c竎h v祇 m�, v� th鮝 bi誸 r籲g s� nguy hi觤 nh� th� n祇, nh璶g c� ta b� qua t蕋 c�, m閠 l遪g v� ti襫 b鑙 hng n nh 甶觤 c馻 V� o. C� ta hi觰 頲 t蕀 l遪g c馻 玭g, c� l� tr猲 th� gian n祔 ch� c� c� ta m韎 hi觰 頲 甶襲 . Ti襫 b鑙 kh玭g n猲 v� qu� 產u l遪g m� t� b� t蕋 c�.",
	"厖�",
	"C� l� ngi ng, T� Qu﹏ th玭g minh lanh l頸 nh� th�, l� n祇 kh玭g bi誸 頲 l莕 甶 n祔 kh� c� 阯g quay v�? K� v鋘g c馻 c� ta e r籲g l筰 l� b� kh� cho ta, v� e r籲g ch� c� k� v鋘g c馻 c� ta m韎 c� th� gi秈 tho竧 頲 b� kh� cho ta. Ngi l� ngi t鑤 ta r蕋 l蕐 l祄 c秏 k輈h.",
	"Ti襫 b鑙 kh玭g c莕 kh竎h s竜 th�, tr猲 th� gian n祔 v蒼 c遪 m閠 ngi c� th� hi觰 頲 ti襫 b鑙,  ch輓h l� Th竎 B箃 Ho籲g  ti襫 b鑙.",
	}

	TalkEx("task_015_04_0_2",strTalk);

end

--续对话
function task_015_04_0_2()

local strTalk = {
	"Th竎 B箃 Ho籲g? C� th� ngi n鉯 ng. L莕 u g苝 m苩, 玭g ta  mu鑞 th� s鴆 c飊g ta, sau n祔 m韎 bi誸 th� ra 玭g ta mu鑞 chi猽 m� ta gia nh藀 Nh蕋 Ph萴 Л阯g, nh璶g ta th蕐 trong l╪g T莕 Th駓 Ho祅g thng c� ngi T﹜ H� quanh qu萵, m� hi襫 th� c馻 ta m蕋 t輈h � l╪g T莕 Th駓 Ho祅g, cho n猲 kh� tr竛h kh醝 vi謈 nghi ng� b鋘 T﹜ H� c 竎. Hu鑞g h� Nh蕋 Ph萴 Л阯g l筰 l� k� th� ng g阭 c馻 v� l﹎ Чi T鑞g, ta sao c� th� ph秐 l筰 qu﹏ m譶h? Ta c遪 tng r籲g 玭g ta h裯 ra khi猽 chi課 v� l� do kh玭g h祅g th� gi誸, nh璶g kh玭g ng� nh 頲 v礽 chi猽 th� m韎 bi誸 r籲g  ch� l� mu鑞 th� s鴆, ch� kh玭g c遪 � mu鑞 chi猽 n筽 n鱝.",
	"Th藅 ra Th竎 B箃 ti襫 b鑙 c騨g gi鑞g nh� 玭g v藋, nghi猲 c鴘 v� o, am hi觰 tinh th玭g, u kh玭g mu鑞 m祅g n th� s�. Chuy謓 v� chi猽 m� e r籲g Th竎 B箃 ti襫 b鑙  kh玭g  trong l遪g n鱝. g ta ch� mu鑞 th� s鴆 c飊g 玭g m� th玦.",
	"цi th� t鑤 nh� th� sao c� th� b� l� 頲? Ngi h穣 n鉯 v韎 Th竎 B箃 Ho籲g , 3 ng祔 sau ta s� vi課g th╩. ng r錳, <sex> ng tr竎h ta n鉯 th糿g, Nh蕋 Ph萴 Л阯g l� m閠 t� ch鴆 th蕄 h蘮 nh� th�, th藅 s� kh玭g ph� h頿 nh鱪g ngi c� ph萴 ch蕋 cao sang nh� Th竎 B箃 Ho籲g v� ngi. <sex> l� con d﹏ Чi T鑞g, nh譶 th蕐 thi猲 h� lo筺 l筩 nh� hi謓 nay, th� giang s琻 c騨g kh� m� y猲 鎛, ngi giang h錸 n猲 v� qu鑓 gia m� g鉷 s鴆, sao l筰 mu鑞 b竛 ng qu鑓 gia nh� th�? Ta ngh� 玭g ta n猲 s韒 r阨 kh醝 Nh蕋 Ph萴 Л阯g,  tr竛h ph秈 h鑙 ti誧 v� sau.",
	"Ti襫 b鑙�.l阨 c馻 玭g n鉯 t玦 s� ghi kh綾 trong l遪g, t筰 h� xin ph衟 c竜 t�, chuy觧 t﹎ � c馻 玭g n Th竎 B箃 ti襫 b鑙.",
	"(�.kh玭g bi誸 t譶h h譶h sai d辌h c馻 Vi猲 Phi V﹏ nh� th� n祇 r錳, c� th� kh緋 trong thi猲 h� ch� c� anh ta hi觰 頲 c秏 nh薾 c馻 ta l骳 n祔, nh璶g s� vi謈 v蒼 ch璦 頲 ho祅 th祅h, c莕 ph秈 nh蒼 n筰 nhi襲 h琻, nh鱪g s� hi觰 l莔 nh xem nh� l� ng l鵦 m� th玦.)"
	}

	TalkEx("task_015_04_0_3",strTalk);

end

--发奖励
function task_015_04_0_3()

	give_zb_award(34);

	if GetTask(TASK_GET_AWARD) == 1 then
		SetTask(TASK_GET_AWARD,0);
		SetTask(TASK_XB_ID_01,29);
		DelItem(2,0,718,1);--删去墨斗
		DelItem(2,0,719,1);--删去玉佩
		DelItem(2,0,710,1);--删去金丝面罩
		DelItem(2,0,716,1);--删去西夏法王密函
		TaskTip("H錳 b竜 Th竎 B箃 Ho籲g v� vi謈 T� M� Minh Phong  ng � t� v�.");
		Msg2Player("H錳 b竜 Th竎 B箃 Ho籲g v� vi謈 T� M� Minh Phong  ng � t� v�.");
		GivePlayerAward("Award_XB_34","Easy");
		GivePlayerExp(SkeyXibei,"guijiangjun")
	end
end

--尚未汇报拓拔弘
function task_015_04_1()

local strTalk = {
	"Ngi h穣 n鉯 v韎 Th竎 B箃 Ho籲g , 3 ng祔 sau ta s� vi課g th╩. <sex> ng tr竎h ta n鉯 th糿g, <sex> l� con d﹏ Чi T鑞g, nh譶 th蕐 thi猲 h� lo筺 l筩 nh� hi謓 nay, th� giang s琻 c騨g kh� m� y猲 鎛, ngi giang h錸 n猲 v� qu鑓 gia m� g鉷 s鴆, sao l筰 mu鑞 b竛 ng qu鑓 gia nh� th�? Ta ngh� 玭g ta n猲 s韒 r阨 kh醝 Nh蕋 Ph萴 Л阯g,  tr竛h ph秈 h鑙 ti誧 v� sau."
	}

	TalkEx("",strTalk);

end

---------------------------------- 西北区16分支1_7药人惊现----------------------------------
--将墨斗和玉佩交给鸣风后与拓拔弘对话
function task_016_01_0()

local strTalk = {
	"Х m閠 th阨 gian r錳, Tr秓 Vng c� th� v祇 頲 l╪g m� hay kh玭g, c騨g ph秈 h錳 b竜 m閠 ti課g ch�. B猲 Xa Lu﹏ l筰 ph竔 ngi n c th骳, vi謈 r綾 r鑙 n祔 th藅 khi課 ta nh鴆 u.",
	"(Kh玭g 頲, Tr秓 Vng  ch誸, vi謈 n祔 ph秈 b祅 giao nh� th� n祇 y? Th玦, Nh蕋 Ph萴 Л阯g n nay v蒼 ch璦 v祇 m�, c� th� che d蕌 頲 bao nhi猽 th� d蕌 v藋, ph秈 c萵 th薾 ch祇 h醝 th� m韎 頲.)",
	"Th竎 B箃 ti襫 b鑙 kh玭g c莕 ph秈 lo l緉g, t莕g 2 l╪g m� l� m閠 n琲 r蕋 nguy hi觤, i th猰 v礽 ng祔 n鱝 xem sao. ng r錳, T� M� ti襫 b鑙 b秓 t玦 nh緉 l阨 v韎 玭g, t﹎ s� c馻 玭g ta  頲 gi秈 quy誸, m芻 d� kh玭g th� t譵 頲 hi襫 th�, th� nh g竎 qua m閠 b猲 v藋, 玭g ta h裯 玭g ba h玬 sau s� u.",
	"C� th藅 nh� th� kh玭g? Qu� t鑤, qu� t鑤, Ha ha�, T� M� Minh Phong th藅 s� khi課 ta r蕋 s鑤 ru閠. Chi猽 th鴆 c馻 玭g ta, ta v蒼 ch璦 ph� gi秈 h誸, ch� i l莕 n祔 thi th�, ta s� c� th� thng th鴆 to祅 b� chi猽 th鴆 r錳.",
	}

	TalkEx("task_016_01_0_1",strTalk);

end

--续对话
function task_016_01_0_1()

local strTalk = {
	"Th竎 B箃 ti襫 b鑙 v鮝 n鉯 n chi猽 th鴆, v鮝 l� n衪 phi襫 n穙, nh璶g sinh kh� l筰 d錳 d祇. N誹 kh玭g ph秈 v� vi謈 玭g chi猽 m� T� M� ti襫 b鑙 v祇 阯g m� c� th� so t礽 v韎 m閠 i th� ngang t莔, th� e r籲g ti襫 b鑙 c騨g kh� m� ch辵 頲 c秏 gi竎 c� n c馻 m閠 ngi c cao v鋘g tr鋘g.",
	"C� n c馻 m閠 ngi c cao v鋘g tr鋘g th� h琲 qu�, nh璶g thng l� c秏 gi竎 c� qu筺h. Ta b譶h sinh nghi猲 c鴘 v� o, c� i c� c玭g theo 畊鎖, r� bi誸 thi猲 h� r蕋 r閚g l韓, kh� t譵 頲 ngi v� ch. Cho n猲 ta m韎 n T﹜ H�, mu鑞 t譵 i th� th� s鴆 m閠 phen. V� sau c� g苝 L� Nguy猲 Kh竛h, 玭g ta n鉯 v� h鋍 T﹜ H� kh玭g th﹎ s﹗ uy猲 b竎 nh� Чi T鑞g. Ngi T﹜ H� y猽 th輈h v�, ngi Чi T鑞g l筰 tinh th玭g v�, b秓 ta gia nh藀 Nh蕋 Ph萴 Л阯g  tr鵦 ti誴 nghe l謓h c馻 玭g ta, 玭g ta c� th� gi髉 ta t譵 頲 cao th� Чi T鑞g, gi髉 ta ho祅 th祅h t﹎ nguy謓 c馻 m譶h.",
	"Th� ra l� v藋, T� M� Minh Phong ch輓h l� cao th� m� 玭g ta gi髉 玭g t譵 �?",
	}

	TalkEx("task_016_01_0_2",strTalk);

end

--续对话
function task_016_01_0_2()

local strTalk = {
	"鍏m芻 d� n鉯 l� t譵 cao th� Чi T鑞g, nh璶g thng nhi謒 v� c�  tr猲 vai ta, b譶h thng c騨g c� r蕋 nhi襲 vi謈 kh� gi秈 quy誸 c莕 ta x� l�, r蕋 phi襫 ph鴆. Nh璶g L� Nguy猲 Kh竛h xem ra c騨g gi� l阨 h鴄 y, t譵 gi髉 ta r蕋 nhi襲 cao th�, l莕 n祔 c� th� g苝 頲 T� M� Minh Phong, xem ra L� Nguy猲 Kh竛h  l祄 m閠 vi謈 kh菡n ta to筰 nguy謓. Nhi謒 v� th� c� xem nh� ta b竜 p 琻 c馻 玭g 蕐 v藋. Nh璶g nhi謒 v� l莕 n祔 th藅 k� l�, kh� kh╪ v� c飊g. Ngi 甶 n鉯 v韎 Xa Lu﹏ B� Vng , vi謈 v祇 m� kh� c� ti課 tri觧, b秓 玭g 蕐 i th猰 m閠 th阨 gian.",
	"Л頲, ti襫 b鑙 ng lo l緉g, c� chu萵 b�  s鴆 c飊g T� M� Minh Phong. M鋓 vi謈 c�  t筰 h� x� l�.",
	"(Th竎 B箃 Ho籲g  xem ra c祅g l骳 c祅g ch竛 Nh蕋 Ph萴 Л阯g, 玭g ta l� T﹜ H�  nh蕋 d騨g s�, Nh蕋 Ph萴 Л阯g l韓 m筺h l� nh� 玭g ta, m� Th竎 B箃 Ho籲g l� m閠 k� Чo v� ch輓h c鑞g, b秐 ch蕋 c騨g kh玭g ph秈 th蕄 h蘮 nh� Nh蕋 Ph萴 Л阯g. N誹 c� th� c竎h ly quan h� c馻 玭g ta v� Nh蕋 Ph萴 Л阯g, kh玭g ch鮪g c� th� g� b� 頲 s� r祅g bu閏 cho 玭g ta, m� c遪 c� th� l祄 lung lay th鵦 l鵦 c馻 Nh蕋 Ph萴 Л阯g. Ph秈 ngh� c竎h m韎 頲.)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,30);
	TaskTip("Quay v� h錳 b竜 Xa Lu﹏ B� Vng v� t譶h h譶h l╪g m�.");
	Msg2Player("Quay v� h錳 b竜 Xa Lu﹏ B� Vng v� t譶h h譶h l╪g m�.");

end

--未与车轮汇报关于陵墓的情况
function task_016_01_1()

local strTalk = {
	"Nhi謒 v� l莕 n祔 th藅 k� l�, kh� kh╪ mu玭 tr飊g. Ngi 甶 b竜 v韎 Xa Lu﹏ B� Vng , vi謈 v祇 m� kh� m� ti課 tri觧 頲, b秓 玭g ta i th猰 m閠 th阨 gian n鱝.",
	}

	TalkEx("",strTalk);

end

--与车轮汇报关于陵墓的情况
function task_016_02_0()

local strTalk = {
	"Th� n祇? Th竎 B箃 Ho籲g  ho祅 th祅h vi謈 v祇 m� ch璦?",
	"Th竎 B箃 ti襫 b鑙  giao vi謈  cho Tr秓 Vng x� l�, e r籲g trong m� C� quan tr飊g tr飊g, kh� m� th鵦 hi謓, 玭g ta b秓 玭g ch� th猰 m閠 th阨 gian n鱝, hi謓 gi� 玭g ta 產ng chu萵 b� cho vi謈 chi猽 m� T� M� Minh Phong.",
	"C竔 g�? L筰 l� T� M� Minh Phong? N誹 chi猽 m� kh玭g 頲, th� gi誸 qu竎h 甶 kh玭g hay h琻 �? Th竎 B箃 Ho籲g  c祅g l骳 c祅g l祄 nh鱪g vi謈 kh玭g u. Vi謈 v祇 m� n猲 ch th﹏ 甶 l祄 th� l筰, t筰 sao l筰  cho Tr秓 Vng l祄 ch�? E r籲g vi謈 T� M� Minh Phong c騨g kh玭g ph秈 l祄 v� nhi謒 v�, 玭g ta mu鑞 tho竧 kh醝 vi謈 n祔,  t� v� v� v萵 g� .",
	"Th竎 B箃 ti襫 b鑙 th輈h s� t� do, nghi猲 c鴘 v� o, e r籲g vi謈 l祄 nhi謒 v� kh玭g ph秈 l� � mu鑞 c馻 玭g ta, c� mi詎 cng c騨g v� 輈h, n誹 l祄 玭g ta n鎖 gi薾, r阨 kh醝 Nh蕋 Ph萴 Л阯g th� l� t鎛 th蕋 cho ch髇g ta r錳.",
	}

	TalkEx("task_016_02_0_1",strTalk);

end

--续对话
function task_016_02_0_1()

local strTalk = {
	"H鮩, Nh蕋 Ph萴 Л阯g l� ch� 玭g ta n鉯 n l� n n鉯 甶 l� 甶 sao? Ngi c馻 Nh蕋 Ph萴 Л阯g th� ph秈 v� l頸 輈h c馻 Nh蕋 Ph萴 Л阯g, L� Nguy猲 Kh竛h i nh﹏ th藅 l� qu� dung t髇g cho 玭g ta r錳. Th玦 甶, th玦 甶, ngi n祔 m芻 d� v� c玭g cao th﹎, nh璶g r蕋 kh� 甶襲 khi觧. �, ngi tr� th祅h Л阯g H� D鵦 c馻 ta l骳 n祇? Ch綾 l� do Th竎 B箃 Ho籲g th╪g ch鴆 cho ngi ng kh玭g? T鑤, Th竎 B箃 Ho籲g l祄 vi謈 kh玭g t錳, t莔 nh譶 r蕋 t鑤. Л阯g H� D鵦 c� th� h頿 t竎 l祄 vi謈 v韎 Th藀 Чi Kim Cang v� Ph竝 Vng, v� ph秈 kh玭g ng鮪g r蘮 luy謓!",
	"Th� th� t鑤 qu�, t筰 h� nh蕋 nh kh玭g ph� l遪g mong m醝. Xin c� c╪ d苙.",
	"Vi謈 Ho祅g l╪g c�  Tr秓 Vng l祄 甶, ki猲 nh蒼 i tin t鴆 l� 頲 r錳. L莕 n祔 Nh蕋 Ph萴 Л阯g n Ph鬾g Tng , l� v� mu鑞 t╪g th猰 th鵦 l鵦 qu﹏ i T﹜ H�, m鬰 ti猽 d� nhi猲 ch輓h l� Чi T鑞g. Ngi ch綾 bi誸 Ph鬾g Tng ph� b綾 c� c竔 Dc Vng чng ch�? N琲 n祔 l蕐 t猲 l� Dc Vng, l� do m閠 ngi 產m m� dc m蕐 n╩ trc b� hoang tng c馻 sa m筩,  t譵 n s琻 ng th莕 b� n祔, trong ng ch鴄 y c竎 lo筰 k� hoa d� th秓, l� nh鱪g dc li謚 hi誱 th蕐 tr猲 th� gian. Ngi n祔 gi鑞g nh� l� b総 頲 v祅g, n gi� v蒼 kh玭g mu鑞 r阨 s琻 ng n鯽 bc, t� nh薾 l� Dc Vng, c騨g ch輓h l� t猲 c馻 ng n祔.",
	"T玦  n qua Dc Vng ng, �  c� r蕋 nhi襲 ngi T﹜ H�, c� vi謈 g� th�?",
	}

	TalkEx("task_016_02_0_2",strTalk);

end

--续对话
function task_016_02_0_2()

local strTalk = {
	"Ngi c馻 ta  th╩ d� 頲 Dc Vng g莕 y  nghi猲 c鴘 頲 B蕋 t� Dc nh﹏, Ph竝 Vng c馻 ta  thng lng c飊g v韎 Dc Vng, mu鑞 d飊g pha ch� Dc nh﹏, c� th� t╪g cng th鵦 l鵦 c馻 qu﹏ i.",
	"B蕋 t� Dc nh﹏ l� v藅 g� v藋? R鑤 cu閏 l� n� c� s鴆 m筺h nh� th� n祇?",
	"Л琻g nhi猲, Dc nh﹏ ch輓h l� B蕋 t� nh﹏ do Dc Vng kh� c玭g nghi猲 c鴘 th祅h, ch綾 l� d飊g nh鱪g dc li謚 c bi謙  t筼 th祅h, c� th� r蕋 cng tr竛g, m筺h m� v� c飊g, v� kh玭g bi誸 產u n l� g� c�, n誹 b� thng th� s� t� ng ph鬰 h錳. L� m閠 k� binh m穘h tng x玭g pha chi課 tr薾. Th醓 thu薾 c馻 Ph竝 Vng c騨g s緋 ho祅 th祅h r錳, ngi h穣 n Dc Vng c鑓 hi謕 tr� c飊g 玭g ta x� l� vi謈 n祔.",
	"Qu� nhi猲 c� lo筰 Dc nh﹏ k� d� n祔 �, v藋 th� t玦 s� 甶 t譵 Ph竝 Vng ngay.",
	"(Kh玭g 頲, Nh蕋 Ph萴 Л阯g ﹎ m璾 qu� k� th藅 kh� lng, chuy謓 Dc nh﹏ r鑤 cu閏 l� nh� th� n祇 nh�? N誹 th藅 nh� Xa Lu﹏ B� Vng  n鉯, th� qu﹏ i T﹜ H� qu� l� hi觤 h鋋 l韓 cho Чi T鑞g, ph秈 t譵  Dng H鋋 ti襫 b鑙  thng lng.)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,31);
	TaskTip("T譵  Dng H鋋 ti襫 b鑙 thng lng v� vi謈 Dc nh﹏.");
	Msg2Player("T譵  Dng H鋋 ti襫 b鑙 thng lng v� vi謈 Dc nh﹏.");
	GivePlayerAward("Award_XB_35","Easy");
	GivePlayerExp(SkeyXibei,"yaowang")
end

--还未与欧阳画汇报药人一事
function task_016_02_1()

local strTalk = {
	"T﹜ H� Ph竝 Vng  b総 u th醓 thu薾 v韎 Dc Vng, l骳 n祔 ch綾 產ng � [Dc Vng c鑓. N誹 c� 頲 c竎h pha ch� Dc nh﹏, th� th鵦 l鵦 c馻 qu﹏ ta s� t╪g d� d閕.",
	}

	TalkEx("",strTalk);

end

--与欧阳画汇报关于药人一事
function task_016_03_0()

local strTalk = {
	" Dng ti襫 b鑙, c� vi謈 kh玭g l祅h r錳, t筰 h� bi誸 頲 m閠 ﹎ m璾 kh竎 c馻 Nh蕋 Ph萴 Л阯g. T﹜ H�  c蕌 k誸 v韎 Dc Vng, nh l頸 d鬾g Dc nh﹏  t╪g cng s鴆 m筺h qu﹏ i, v� i th阨 c�  x﹎ chi誱 T鑞g. Ngo礽 ra L╪g T莕 Th駓 Ho祅g kh玭g c� manh m鑙 v� b秐  S琻 H� X� T綾 nh� ch髇g ta d� ki課, c� quan trong m� r蕋 m筺h, ch綾 ch緉 l� c� r蕋 nhi襲 Ho箃 nh﹏ d騨g.",
	"Dc Vng? M筺g li t譶h b竜 c馻 Nh蕋 Ph萴 Л阯g qu� nhi猲 danh b蕋 h� truy襫, ngi b� 萵 nh� th� m� c騨g c� th� 畂筺 鴑g ph�. Dc Vng t輓h t譶h qu竔 n, th輈h nghi猲 c鴘 nh鱪g lo筰 dc th秓 k� d�, nghe n鉯 Dc nh﹏ l� nghi猲 c鴘 t﹎ c nh蕋 c馻 玭g ta, B蕋 th鑞g b蕋 t�, Dc Vng n誹 ti誴 tay v韎 T﹜ H�, th� qu﹏ i T﹜ H� s� m芻 s鴆 tung ho祅h thi猲 h�.",
	"Dc nh﹏ e r籲g  xu蕋 hi謓 trong Dc Vng ng, hay l�  t筰 h� 甶 th竚 th輓h m閠 chuy課.",
	"Nh� th� c祅g t鑤, n誹 trong l╪g T莕 Th駓 Ho祅g kh玭g c� b秐  S琻 H� X� T綾, th� t筸 d鮪g vi謈 n祔 l筰. N誹 ngi T﹜ H� c� 頲 Dc nh﹏ th� h藆 qu� s� kh� lng. Ngi h穣 n Dc Vng ng trc ti猽 di謙 s� Dc nh﹏   tr� ho穘 k� ho筩h c馻 ngi T﹜ H�, khi ti猽 di謙 b鋘 Dc nh﹏ nh� kh玭g 頲 b鴗 d﹜ ng r鮪g, tr竛h  cho Ph竝 Vng T﹜ H� ph竧 gi竎.",
	"T筰 h� s� c� g緉g c萵 th薾, khi n祇 c� v蕁  g� kh竎 t筰 h� s� quay v� h錳 b竜 ti襫 b鑙.",
	}

	SetTask(TASK_XB_ID_01,32);
	TalkEx("",strTalk);
	CreateTrigger(0,1235,KILL_XB_YAOREN);--药人杀怪触发器
	TaskTip("дn Dc Vng ng, ti猽 di謙 30 t猲 Dc nh﹏.");
	Msg2Player("дn Dc Vng ng, ti猽 di謙 30 t猲 Dc nh﹏.");

end

--还未杀死30药人
function task_016_03_1()

local strTalk = {
	"Ngi n Dc Vng ng ti猽 di謙 Dc nh﹏ tr� ho穘 k� ho筩h c馻 ngi T﹜ H�, khi ti猽 di謙 Dc nh﹏ nh� kh玭g 頲 b鴗 d﹜ ng r鮪g, tr竛h  Ph竝 Vng T﹜ H� ph竧 hi謓.",
	}

	if	GetTrigger(KILL_XB_YAOREN) == 0 then
		CreateTrigger(0,1235,KILL_XB_YAOREN);--药人杀怪触发器
		TaskTip("дn Dc Vng ng, ti猽 di謙 30 t猲 Dc nh﹏.");
		Msg2Player("дn Dc Vng ng, ti猽 di謙 30 t猲 Dc nh﹏.");
	end

	TalkEx("",strTalk);

end

--消灭30药人后向欧阳画汇报情况
function task_016_04_0()

local strTalk = {
	"Ti襫 b鑙, t筰 h�  ti猽 di謙 m閠 s� Dc nh﹏, Dc nh﹏ qu� nhi猲 r蕋 kh� i ph�, kh玭g nh鱪g cng tr竛g kh醗 m筺h, m� l筰 kh玭g ng鮪g h錳 sinh, nhi襲 v� s� k�.",
	"Nguy to, ch� s� Dc Vng  ng � ch� t筼 Dc nh﹏ cho ngi T﹜ H�, cho n猲 m韎 s秐 sinh ra s� lng l韓 nh� th�. B鋘 Dc nh﹏  kh玭g th� d飊g c竎h th玭g thng m� i ph� 頲. Mu鑞 gi誸 Dc nh﹏ th� ph秈 bi誸 頲 phng ph竝 ch� t筼 c馻 n�, n誹 kh玭g th� c騨g u鎛g ph� c玭g s鴆 m� th玦.",
	"Dc nh﹏ l� m閠 nghi猲 c鴘 t﹎ c nh蕋 c馻 Dc Vng, kh玭g d� g� bi誸 頲, hay l� tr鵦 ti誴 t譵 Dc Vng?",
	"Kh玭g 鎛, kh玭g bi誸 th鵦 h� nh� th� n祇 kh玭g n猲 阯g t h祅h ng kh玭g ch鮪g m綾 k�. V� l筰 hi謓 gi� Ph竝 Vng T﹜ H� v� Dc Vng 產ng thng th秓 v韎 nhau, n誹 g苝 ph秈 h�, ngi s� m蕋 甶 c� h閕 h祅h ng. Hay l� ngi n g莕 khu Dc Vng c鑓 th竚 th輓h xem c� ai bi誸 頲 t譶h h譶h Dc Vng ng, t譵 h�  t譵 hi觰 t譶h h譶h, bi誸 ngi bi誸 ta tr╩ tr薾 tr╩ th緉g, kh玭g ch鮪g s� bi誸 頲 m閠 v礽 tin t鴆 v� Dc nh﹏.",
	"Ti襫 b鑙 n鉯 r蕋 ph秈, n猲 nh v祇 nhc 甶觤 c馻 k� ch th� m韎 c� hi謚 qu� 頲,  t筰 h� 甶 th竚 th輓h th� xem c� ai hi觰 r� n閕 t譶h b猲 trong kh玭g, c� v蕁  g� t筰 h� s� quay v� c飊g b竛 t輓h v韎 ti襫 b鑙.",
	}

	SetTask(TASK_XB_ID_01,34);
	TalkEx("",strTalk);
	TaskTip("T譵  Dng H鋋 ti襫 b鑙 thng lng v� vi謈 Dc nh﹏.");
	Msg2Player("T譵  Dng H鋋 ti襫 b鑙 thng lng v� vi謈 Dc nh﹏.");
	GivePlayerAward("Award_XB_36","Easy");
	GivePlayerExp(SkeyXibei,"yaoren")
end

--还未与刘三对话前与欧阳画对话
function task_016_04_1()

local strTalk = {
	"Hay l� ngi n g莕 khu Dc Vng c鑓 th竚 th輓h xem c� ai bi誸 頲 t譶h h譶h Dc Vng ng, t譵 h�  t譵 hi觰 t譶h h譶h, bi誸 ngi bi誸 ta tr╩ tr薾 tr╩ th緉g, kh玭g ch鮪g s� bi誸 頲 m閠 v礽 tin t鴆 v� Dc nh﹏.",
	}

	TalkEx("",strTalk);

end

---------------------------------- 西北区17分支1_8奇异之草----------------------------------
--与刘三对话答应帮他收集20千年乌木
function task_017_01_0()

local strTalk = {
	"B筺 tr�, n猲 x璶g h� nh� th� n祇 y? Sao l筰 ng � y? Dc Vng c鑓 nguy hi觤 tr飊g tr飊g, n誹 kh玭g c� vi謈 g�, th� mau r阨 kh醝 y 甶.",
	"<sex> c秏 琻 ngi  quan t﹎, ta l� L璾 Tam. Ta bi誸 n琲 n祔 nguy hi觤, ng � y ta c騨g r蕋 lo s�. Nh璶g v� ngi T﹜ H� ra v祇 Dc Vng ng, thng mang ra m閠 輙 � M閏  b竛 cho ta, s� � m閏 n祔 c� th� b竛 ki誱 m閠 輙 ti襫, cho n猲 ta m韎 ng y i. N誹 kh玭g v� mi課g ╪ th� ta  r阨 kh醝 t� l﹗ r錳.",
	"Ta ch� nghe n鉯 Dc Vng ng c� r蕋 nhi襲 k� hoa d� th秓, kh玭g ng� c遪 c� g� n鱝 礹? Sao ngi c� th� bi誸 頲 t譶h h譶h trong ng?",
	"�, ta n g� m璾 sinh. Nh璶g Ph鬾g Tng  m蕐 n╩ g莕 y b穙 c竧 qu� nhi襲, h莡 nh� ti猽 h飝 h誸 c﹜ c鑙. H玬 n� ta v� t譶h 甶 qua y, ph竧 hi謓 g莕 c鯽 hang Dc Vng ng c� m閠 s� � M閏 ng祅 n╩ r蕋 qu� gi�, ta li襫 nh苩 甧m b竛. Sau  mu鑞 v祇 ng t譵 xem c遪 g� n鱝 kh玭g, kh玭g ng� su齮 ch髏 th� kh玭g c遪 m筺g quay v�.",
	}

	TalkEx("task_017_01_0_1",strTalk);

end

--续对话
function task_017_01_0_1()

local strTalk = {
	"Ngi  v祇 ng r錳 �, nghe n鉯 Dc nh﹏ trong ng d騨g m筺h v� c飊g, sao ngi c� th� tho竧 頲?",
	" da, nh綾 n b鋘 Dc nh﹏ th藅 ng s�, c� i ta c騨g ch璦 nh譶 th蕋 v藅 g� gh� g韒 nh� th�. L骳  ta ch� mu鑞 tr閙 m閠 輙 g� tr猲 ngi Th� nh﹏, kh玭g ng� b� Dc nh﹏ ph竧 hi謓, li襫 n b総 ta, ta l祄 sao ch鑞g n鎖 h緉, cho n猲 nh ph秈 ngoan ngo穘  h緉 b総 v� ch� Dc Vng, Dc Vng nh譶 th蕐 ngi s鑞g nh� b総 頲 v祅g, nh 甧m ta l祄 th祅h Dc nh﹏. Ta ngh� l骳  c騨g kh� s鑞g s鉻, nh﹏ l骳 c� m蕐 ngi T﹜ H� n, Dc Vng b薾 ti誴 ki課 h�, ta li襫 b� tr鑞.",
	"Ngi n鉯 Dc Vng mu鑞 甧m ngi l祄 th祅h Dc nh﹏ �? Ngi c� th� n鉯 r� cho ta v� chuy謓 Dc nh﹏ kh玭g?",
	"Nh鱪g t猲 Dc nh﹏ ng s�  kh玭g bi誸 l� ngi hay l� qu�, <sex> sao l筰 c� h鴑g th� th�? Nh璶g <sex> l� ngi trong v� l﹎, n誹 <sex> ng � gi髉 ta v祇 ng m閠 chuy課, l蕐 h� ta � M閏 ng祅 n╩ tr猲 ngi Th� nh﹏, th� ta s� k� cho nghe chuy謓 Dc nh﹏.",
	"Ch� l� vi謈 nh�, ta c遪 產ng lo l緉g kh玭g bi誸 n猲 b竜 p cho ngi th� n祇 y.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,35);
	CreateTrigger(0,1236,KILL_XB_QIANNIANSHUREN);--千年树人杀怪触发器
	TaskTip("Gi髉 L璾 Tam n Dc Vng ng thu th藀 20 c﹜ � M閏 ng祅 n╩ tr猲 ngi Th� nh﹏.");
	Msg2Player("Gi髉 L璾 Tam n Dc Vng ng thu th藀 20 c﹜ � M閏 ng祅 n╩ tr猲 ngi Th� nh﹏.");

end

--带回或未带回20千年乌木物品
function task_017_02_0()

local strTalk = {};

	--带回20千年乌木物品
	if GetItemCount(2,0,720) >= 20 then
		strTalk = {
			"Anh b筺 nh�, ngi xem c� ph秈 y l� � M閏 m� ngi c莕 kh玭g?",
			"竔 ch�, th藅 c秏 琻 ngi, nhi襲 nh� th� �, ta c� th� s鑞g m閠 th阨 gian m� kh玭g c莕 n n琲 qu� qu竔 n祔 r錳. ng, <sex> bi誸 trong Dc Vng ng c� Dc nh﹏, v� bi誸 頲 ch� 萵 n竨 c馻 Dc Vng kh玭g?",
			"Ta c騨g c� nghe n鉯, Dc Vng l� m閠 ngi qu竔 d�, ngi  nh譶 th蕐 h緉, ch綾 c騨g ph秈 bi誸 h緉 ch� t筼 Dc nh﹏ nh� th� n祇 ch�?",
			"Trong Dc Vng ng c� r蕋 nhi襲 k� hoa d� th秓, lo筰 Dc Nh﹏ Th秓 l� nhi襲 nh蕋. Dc Vng tr鑞 trong m閠 M藅 ng trong Dc Vng ng kh玭g r阨 n鯽 bc, b鋘 Dc nh﹏ ch輓h l� y t� c馻 h緉 ta. Ai v祇 ng s� b� b総 n M藅 ng   ch� dc nh﹏, ta nh譶 th蕐 r蕋 nhi襲 si猽 thu鑓 trong M藅 ng, ng﹎ r蕋 nhi襲 dc nh﹏ ch璦 th祅h h譶h, c秐h tng 蕐 r蕋 kinh ho祅g.",
			}

		TalkEx("task_017_02_0_1",strTalk);

	--没有带回20千年乌木and补发任务触发器
	else
		strTalk = {
			"<sex> l� ngi trong v� l﹎, n誹 <sex> ng � gi髉 ta v祇 ng m閠 chuy課, l蕐 h� ta � M閏 ng祅 n╩ tr猲 ngi Th� nh﹏, th� ta s� k� cho nghe chuy謓 Dc nh﹏.",
			}
		if	GetTrigger(KILL_XB_QIANNIANSHUREN) == 0 then
			CreateTrigger(0,1236,KILL_XB_QIANNIANSHUREN);--千年树人杀怪触发器
			TaskTip("Gi髉 L璾 Tam n Dc Vng ng thu th藀 20 c﹜ � M閏 ng祅 n╩ tr猲 ngi Th� nh﹏.");
			Msg2Player("Gi髉 L璾 Tam n Dc Vng ng thu th藀 20 c﹜ � M閏 ng祅 n╩ tr猲 ngi Th� nh﹏.");
		end

		TalkEx("",strTalk);
	end
end

--续对话
function task_017_02_0_1()

local strTalk = {
	"Dc nh﹏ kh� i ph� nh� th�, ch綾 ch緉 l� c� li猲 quan n dc th秓 trong ng, Dc Nh﹏ Th秓 th藅 ra l� c竔 g�?",
	"ng r錳, l莕 trc trong l骳 ho秐g lo筺 ta v� t譶h ng総 頲 m閠 c﹜, <sex>  l蕐 cho ta nhi襲 g� nh� th�, c﹜ Dc Nh﹏ Th秓 n祔 t苙g cho <sex>, hy v鋘g c� 輈h cho ngi.",
	"Th藅 t鑤 qu�, ta v鮝 nh v祇 ng t譵 m閠 輙 Dc Nh﹏ Th秓, nh ti猽 h駓 nh鱪g th� qu竔 d� n祔.",
	"ng v藋, lo筰 Dc Nh﹏ Th秓 n祔 t錸 t筰 ch� g﹜ h筰 ch� kh玭g c� l頸, <sex> c� xem nh� v� d﹏ tr� h筰. Nh鱪g hoa kh竎 trong ng kh玭g c� g� b蕋 thng, ch� c� s� Dc Nh﹏ Th秓  頲 b秓 v� b雐 b鋘 ngi Чi dc nh﹏ c遪 d騨g m穘h h琻 c� dc nh﹏, <sex> m芻 d� ngi t礽 ngh� cao cng, nh璶g c騨g ph秈 c萵 th薾 y.",
	"Th� ra Dc nh﹏ c騨g c� nhi襲 lo筰, c秏 琻 ngi  cho ta bi誸 nhi襲 chuy謓 n th�, anh b筺 nh� h穣 b秓 tr鋘g nh�, h裯 g苝 l筰.",
	}

	TalkEx("",strTalk);
	DelItem(2,0,720,20);
	AddItem(2,0,721,1,1);--得到一株药人草
	RemoveTrigger(GetTrigger(KILL_XB_QIANNIANSHUREN));
	SetTask(TASK_XB_ID_01,36);
	TaskTip("дn Dc Vng ng, th� ti猽 di謙 m閠 s� Dc Nh﹏ Th秓.");
	Msg2Player("дn Dc Vng ng, th� ti猽 di謙 m閠 s� Dc Nh﹏ Th秓.");
	GivePlayerAward("Award_XB_37","Easy");
	GivePlayerExp(SkeyXibei,"yaowanggu")
end

--还没拔去一株药人草
function task_017_02_1()

local strTalk = {
	"ng v藋, lo筰 Dc Nh﹏ Th秓 n祔 t錸 t筰 ch� g﹜ h筰 ch� kh玭g c� l頸, <sex> c� xem nh� v� d﹏ tr� h筰. Nh鱪g hoa kh竎 trong ng kh玭g c� g� b蕋 thng, ch� c� s� Dc Nh﹏ Th秓  頲 b秓 v� b雐 b鋘 ngi Чi dc nh﹏ c遪 d騨g m穘h h琻 c� dc nh﹏, <sex> m芻 d� ngi t礽 ngh� cao cng, nh璶g c騨g ph秈 c萵 th薾 y.",
	}

	TalkEx("",strTalk);

end

--与药人草对话
function task_017_03_0()

local nNpcIndex = GetTargetNpc();
local strSay = {
	"Lo筰 n祔 c� v� gi鑞g v韎 lo筰 m� L璾 Tam  giao, ch綾 ch輓h l� Dc Nh﹏ Th秓.",
	"Nh� Dc Nh﹏ Th秓!/#task_017_03_1("..nNpcIndex..")",
	"Lo筰 c﹜ n祔 tr玭g c� v� p, t鑤 nh蕋 kh玭g n猲 l祄 h� n�/Task_Exit",
		}

	if nNpcIndex == nil then
		return
	end

	SelectSay(strSay)

end

--选择拔掉药人草
function task_017_03_1(nNpcIndex)

local strTalk = {
	"Dc Nh﹏ Th秓 ng l� k� qu竔 kh竎 thng, kh玭g d� g� ph� h駓 頲. Lo筰 c﹜ n祔 sinh t錸 r蕋 m筺h, kh� m� ti猽 di謙. Hay l� n h醝  Dng H鋋  ti襫 b鑙 xem sao.",
	}

	SetNpcLifeTime(nNpcIndex,0);
	nNpcIndex = CreateNpc("Dc Nh﹏ Th秓","Dc Nh﹏ Th秓",GetWorldPos());--原地重生一颗要人草
	SetNpcScript(nNpcIndex,"\\script\\西北区\\药王洞\\npc\\药人草.lua");
	SetNpcLifeTime(nNpcIndex,300);
	SetTask(TASK_XB_ID_01,37);
	TalkEx("",strTalk);
	TaskTip("m Dc Nh﹏ Th秓 m� L璾 Tam giao n cho  Dng ti襫 b鑙 xem, sau  m韎 quy誸 nh n猲 l祄 th� n祇.");
	Msg2Player("m Dc Nh﹏ Th秓 m� L璾 Tam giao n cho  Dng ti襫 b鑙 xem, sau  m韎 quy誸 nh n猲 l祄 th� n祇.");

end

--还没将药人草带给欧阳前辈
function task_017_03_2()

local strTalk = {
	"Xem ra lo筰 Dc Nh﹏ Th秓 n祔 r蕋 kh� ti猽 di謙, hay l� quay v� thng lng c飊g  Dng ti襫 b鑙 xem sao.",
	}

	TalkEx("",strTalk);

end

---------------------------------- 西北区18分支1_9芷寒烈阳----------------------------------
--告诉欧阳画药人草难以消灭一事
function task_018_01_0()

local strTalk = {
	" Dng ti襫 b鑙, t筰 h�  t譵 頲 m閠 輙 Dc Nh﹏ Th秓 � Dc Vng ng, nghe n鉯 d飊g  ch� t筼 Dc nh﹏. T筰 h� nh ti猽 h駓 h誸 lo筰 n祔 trong Dc Vng ng, nh璶g kh玭g ng� kh玭g th� ti猽 di謙 頲, v鮝 h駓 c竔 n祔 n� l筰 s秐 sinh c竔 kh竎.",
	"C� lo筰 c﹜ k� d�  �? Dc Vng c� th� t薾 d鬾g 頲 th秓 dc n m鴆 n祔, qu� nhi猲 khi課 ngi ta ph秈 kh﹎ ph鬰. Khi ngi ra ngo礽 th竚 th輓h ta c騨g  t譵 頲 m閠 ngi r蕋 hi觰 v� th秓 dc, c� th� s� gi髉 ta gi秈 頲 b� m藅 n祔.",
	"T鑤 qu�, ti襫 b鑙 qu� nhi猲 suy ngh� chu o, v�  l� cao nh﹏ phng n祇?",
	"Ngi  t猲 l� T玭 Phng Nh﹏, l� h藆 nh﹏ c馻 T玭 T� M筩, r蕋 n鎖 danh v韎 Thi猲 Kim Y誹 Phng, 頲 g鋓 l� \'Th莕 Y\' tr猲 giang h�. 'Thi猲 Kim Y誹 Phng' l� s� t藀 trung c馻 ph莕 l韓 y thu藅, ghi l筰 h琻 m閠 ng祅 phng thu鑓, i v韎 lo筰 dc ph萴 k� d� n祔 玭g ta ch綾 ch緉 ph秈 c� nghi猲 c鴘. T玭 Phng Nh﹏ hi謓 nay 產ng � Ph鬾g Tng ph�, ngi h穣 th� 甶 h醝 xem 玭g ta c� c竎h kh綾 ch� lo筰 dc th秓 n祔 kh玭g.",
	"Th� th� t鑤 qu�, ti襫 b鑙 nhi謙 t譶h gi髉  nh� th�, khi課 v穘 b鑙 c秏 k輈h v� c飊g.",
	}

	SetTask(TASK_XB_ID_01,38);
	TalkEx("",strTalk);
	TaskTip("T譵 T玭 Phng Nh﹏ h醝 v� c竎h ti猽 di謙 Dc Nh﹏ Th秓.");
	Msg2Player("T譵 T玭 Phng Nh﹏ h醝 v� c竎h ti猽 di謙 Dc Nh﹏ Th秓.");
	GivePlayerAward("Award_XB_38","Easy");
	GivePlayerExp(SkeyXibei,"yaorencao")
end

--还没找到孙方仁请教药人草一事
function task_018_01_1()

local strTalk = {
	"<sex> kh玭g c莕 kh竎h s竜, h藆 nh﹏ T玭 T� M筩 T玭 Phng Nh﹏ hi謓 nay 產ng � Ph鬾g Tng ph�. C� th� 玭g ta s� c� c竎h gi秈 頲 Dc Nh﹏ Th秓, ngi h穣 mau 甶 t譵.",
	}

	TalkEx("",strTalk);

end

--向孙方仁请教消灭药人草一事
function task_018_02_0()

local strTalk = {
	"V� n祔 ch綾 ch輓h l� Th莕 Y T玭 Phng Nh﹏ T玭 ti猲 sinh ch�? Nghe n鉯 T玭 ti猲 sinh r蕋 tinh th玭g v� dc th秓, ki課 th鴆 uy猲 b竎 th﹎ s﹗, kh玭g bi誸 ti猲 sinh  th蕐 qua lo筰 Dc Nh﹏ Th秓 n祔 ch璦?",
	"T筰 h� ch輓h l� T玭 Phng Nh﹏, th莕 y ta kh玭g d竚 nh薾, lng y nh� ph� m蓇 l� l阨 gi竜 hu蕁 c馻 t� ti猲. <sex> dc th秓 trong tay h譶h nh� c� c, h譶h d筺g k� l�, t筰 h�  t鮪g th蕐 trong 'Thi猲 Kim Y誹 Phng' t� ti猲  l筰.",
	"T玭 ti猲 sinh qu� th藅  th蕐 qua r錳 sao? Kh玭g bi誸 lo筰 dc th秓 n祔 c� c t輓h g�? C� c竎h g� tr� ch髇g kh玭g?",
	"Ha ha. <sex> ch糿g vi謈 g� ph秈 lo l緉g, lo筰 c� l� n祔 ta c騨g m韎 th蕐 l莕 u, dc t輓h c馻 n� th� n祇 ta v蒼 ch璦 r�. в ta xem , <sex> ch� m閠 ch髏.",
	}

	TalkEx("task_018_02_0_1",strTalk);

end

--续对话
function task_018_02_0_1()

local strTalk = {
	"C� y, <sex> lo筰 c� ngi c莔 t猲 l� Ch� H祅 Th秓, kh玭g ph秈 l� Dc Nh﹏ Th秓. Theo 'Thi猲 Kim Phng' ghi l筰, Ch� H祅 Th秓 c� v� cay, t輓h h祅, dc t輓h r蕋 c bi謙, sinh trng nhanh v� kh� di謙 t薾 g鑓. N誹 d飊g Kim Dc th� ch鱝 l祅h v誸 thng r蕋 nhanh, song c t輓h c騨g c鵦 m筺h, kh玭g th� b祇 ch� thu鑓.",
	"H鉧 ra lo筰 c th秓 n祔 l筰 c� t竎 d鬾g l祄 li襫 da th辴, nh璶g l筰 r蕋 c, ng l� t筼 h鉧 tr猽 ngi. Kh玭g bi誸 'Thi猲 Kim Y誹 Phng' c� ghi l筰 c竎h di謙 n� kh玭g?",
	"<sex> ng l� r蕋 k� l�, v筺 v藅 sinh ra u c� c竔 l� c馻 n�, c t� c馻 lo筰 dc th秓 n祔 kh玭g cp 甶 sinh m筺g, ch� l祄 ngi ta m蕋 tr� h鉧 甶猲. C� sao <sex> l筰 c� ch蕄 mu鑞 di謙 tr� ch髇g? Tr阨 t ﹎ dng 甶襲 h遖, ch髇g ta ch� l� ph祄 phu t鬰 t� l祄 sao t飝 � thay i?",
	"T玭 ti猲 sinh l� lang trung 琻g nhi猲 l遪g d� lng thi謓. Nh璶g m� th� gian lu玭 c� k� b� 鎖 mu鑞 ra oai, nh鱪g k� mu m� b蕋 ch輓h l頸 d鬾g lo筰 c� n祔 l祄 c� th� kh玭g b� t鎛 thng, nh鱪g dc nh﹏ kh玭g bi誸 產u s� gieo r綾 t筰 h鋋 n祔. Cho n猲 c� n祔 kh玭g di謙 綾 s� c� th猰 nhi襲 n筺 nh﹏.",
	}

	TalkEx("task_018_02_0_2",strTalk);

end

--续对话
function task_018_02_0_2()

local strTalk = {
	"C竔 g�? C� ngi c 竎 n th� sao, d飊g c th秓 l猲 c� th� ngi? L祄 chuy謓 t竛 t薾 lng t﹎, th秓 n祇 <sex> h醝 c苙g k� nh� v藋. Ch� ti誧 l� 'Thi猲 Kim Y誹 Phng' ch� ghi l筰 dc l� c馻 n�, c遪 c竎h di謙 th� kh玭g c�. Nh璶g t� ti猲 c遪 truy襫 l筰 'Thi猲 Kim D鵦 Phng' c� b� sung th猰 c竎h gi秈 c dc, ch綾 c� ghi ch衟 l筰.",
	"T玭 ti猲 sinh y thu藅 uy猲 th﹎, kh玭g bi誸 c� th� gi髉 ta tra c鴘 li襫 頲 kh玭g?",
	"Quy觧 'Thi猲 Kim D鵦 Phng' c馻 ta mang theo khi h竔 thu鑓  bi誸 r� dc t輓h. Kh玭g may l莕 trc ta 甶 sa m筩 h竔 thu鑓 b� h祅h gi� trong sa m筩 tr閙 m蕋, n nay v蒼 ch璦 t譵 v� 頲. Cho n猲 kh玭g th� gi髉 ngay 頲 <sex> l藅, l藅.",
	"Зu c� th� 頲, t猲 H祅h gi� sa m筩  � u? Ta s� gi髉 玭g i cu鑞 s竎h v�.",
	" <sex> xem ra v� c玭g c騨g kh�, c� th� ng ng筰. H祅h gi� sa m筩 萵 n髉 trong M� cung sa m筩, Thi猲 Kim D鵦 Phng c� 10 T祅 Quy觧, ngi 甧m10 T祅 Quy觧 v� y, c� th� s� t譵 ra c竎h di謙.",
	}

	TalkEx("",strTalk);
	DelItem(2,0,721,1);--删去药人草
	SetTask(TASK_XB_ID_01,39);
	CreateTrigger(0,1237,KILL_XB_SHAMOXINGZHE);--沙漠行者杀怪触发器
	TaskTip("L蕐 10 t祅 quy觧 'Thi猲 Kim D鵦 Phng' tr猲 ngi H祅h gi� sa m筩 � M� cung sa m筩 甧m v� y.");
	Msg2Player("L蕐 10 t祅 quy觧 'Thi猲 Kim D鵦 Phng' tr猲 ngi H祅h gi� sa m筩 � M� cung sa m筩 甧m v� y.");

end

--带回或未带回10篇《千金翼方》残卷
function task_018_03_0()

local strTalk = {};

	--带回10篇《千金翼方》残卷
	if GetItemCount(2,0,722) >= 10 then
		strTalk = {
		"T玭 ti猲 sinh, xin xem y c� ph秈 l� Thi猲 Kim D鵦 Phng t祅 quy觧 kh玭g?",
		"ng v藋, y ng l� Thi猲 Kim D鵦 Phng. <sex> l祄 vi謈 t鑤 l緈, ch� m蕋 m閠 l骳 ngi  甧m 頲 s竎h v�, ta v� c飊g c秏 k輈h. <sex> ch� m閠 ch髏,  ta tra l筰.",
		"Ch� H祅 Th秓 m鋍 � ng  H祅, v� m玦 trng s鑞g kh� kh綾 nghi謙, cho n猲 ch� c莕 Ch� H祅 Th秓 c� m閠 c� h閕 s鑞g s� sinh s玦 n秠 n�. V� m鋍 � n琲 ﹎ h祅 n猲 c� v� cay t輓h h祅, tuy c t輓h kh玭g g﹜ ch誸 ngi nh璶g t﹎ tr� m� mu閕, n誹 v祇 c� th� qu� l﹗ s� khi課 m筩h m竨 t� li謙, l祄 m蕋 l� tr�, v� c騨g c� t竎 d鬾g ch鱝 l祅h v誸 thng r蕋 nhanh, nh璶g c� th� dc nh﹏ kh玭g kh竎 g� ngi ch誸.",
		"Tri謚 ch鴑g ti猲 sinh m� t� qu� l� gi鑞g v韎 Dc nh﹏, c� c竎h di謙 dc th秓 n祔 kh玭g?",
		}

		TalkEx("task_018_03_0_1",strTalk);


	--没有带回《千金翼方》残卷and补发任务触发器
	else
		strTalk = {
			" <sex> xem ra v� c玭g c騨g kh�, c� th� ng ng筰. H祅h gi� sa m筩 萵 n髉 trong M� cung sa m筩, Thi猲 Kim D鵦 Phng c� 10 T祅 Quy觧, ngi 甧m10 T祅 Quy觧 v� y, c� th� s� t譵 ra c竎h di謙.",
			}
		if	GetTrigger(KILL_XB_SHAMOXINGZHE) == 0 then
			CreateTrigger(0,1237,KILL_XB_SHAMOXINGZHE);--沙漠行者杀怪触发器
			TaskTip("L蕐 10 t祅 quy觧 'Thi猲 Kim D鵦 Phng' tr猲 ngi H祅h gi� sa m筩 � M� cung sa m筩 甧m v� y.");
			Msg2Player("L蕐 10 t祅 quy觧 'Thi猲 Kim D鵦 Phng' tr猲 ngi H祅h gi� sa m筩 � M� cung sa m筩 甧m v� y.");
		end

		TalkEx("",strTalk);
	end
end

--续对话
function task_018_03_0_1()

local strTalk = {
	"Dc th秓 n祔 qu� l� r蕋 c. Tuy c� n祔 s鑞g dai nh璶g v筺 v藅 trong tr阨 t u tng sinh tng kh綾, c� n祔 c鵦 h祅, n誹 g苝 dc th秓 c鵦 nhi謙 s� h衞, l骳  kh� n╪g s鑞g s� kh玭g c遪.D鵦 Phng c� ghi, � s﹗ trong sa m筩 c� m閠 lo筰 T輈h Dng C╪, tr猲 h髏 m苩 tr阨 r鵦 l鯽, di h蕄 th� c竔 n鉵g h鮪g h鵦 c馻 c竧, c騨g m鋍 � n琲 kh綾 nghi謙, s鴆 s鑞g m穘h li謙. C� kh竎 l� dc t輓h thu閏 nhi謙, n誹 g苝 Ch� H祅 Th秓 th� hai tng kh綾 nhau, c飊g h駓 di謙.",
	"M閠 v藅 kh綾 m閠 v藅, th祅h v遪g tu莕 ho祅 t� nhi猲. Ti猲 sinh bi誸 ch� n祇 c� T輈h Dng C╪ kh玭g?",
	"N鉯 ra c騨g th藅 tr飊g h頿, l莕 trc ta 甶 h竔 thu鑓 � M� cung sa m筩, t譶h c� nh譶 th蕐 T輈h Dng C╪. D飊g n� b祇 ch� thu鑓 c� r蕋 nhi襲 c玭g d鬾g, nh璶g kh玭g h竔 v�. Theo D鵦 Phng ghi l筰, h竔 v� b祇 ch� thu鑓 T輈h Dng C╪ r蕋 rm r�. T輈h Dng C╪ c� 3 m祏 xanh l�, v祅g, . C﹜ m祏 xanh c nh蕋, l蕐 li li襪 c総 t� ph莕 th﹏; c﹜ m祏 v祅g r鏽g nh蕋, d飊g cu鑓 c萵 th薾 o t quanh c﹜ r錳 l蕐 l猲; c﹜ m祏  m筺h nh蕋, d飊g Ch駓 th� r鋍 l韕 ngo礽  l蕐 ch蕋 d辌h. C遪 ph莕 kh竎 u kh玭g th� d飊g.",
	"Kh玭g bi誸 ti猲 sinh c莕 bao nhi猽 m韎 c� th� b祇 ch� thu鑓?",
	"C竎h b祇 ch� thu鑓 kh� rm r�, v� kh� � ch� ph秈  ph遪g c t輓h c馻 n�. T筸 th阨 ngi 甶 h竔 10 T輈h Dng C╪ 甧m v� y, y l� m閠 v礽 d鬾g c� h竔 thu鑓 c馻 ta, ngi l蕐 n� m� d飊g, ta ti誴 t鬰 nghi猲 c鴘 c竎h b祇 ch� thu鑓.",
	"C竎h b祇 ch� thu鑓 kh� rm r�, v� kh� � ch� ph秈  ph遪g c t輓h c馻 n�. T筸 th阨 ngi 甶 h竔 10 T輈h Dng C╪ 甧m v� y, y l� m閠 v礽 d鬾g c� h竔 thu鑓 c馻 ta, ngi l蕐 n� m� d飊g, ta ti誴 t鬰 nghi猲 c鴘 c竎h b祇 ch� thu鑓.",
	}

	TalkEx("",strTalk);
	AddItem(2,0,724,1,1);--得到孙方仁的采药包裹
	DelItem(2,0,722,10);
	RemoveTrigger(GetTrigger(KILL_XB_SHAMOXINGZHE));
	SetTask(TASK_XB_ID_01,40);
	TaskTip("дn M� cung sa m筩, thu th藀 10 T輈h Dng C╪");
	Msg2Player("дn M� cung sa m筩, thu th藀 10 T輈h Dng C╪");
	GivePlayerAward("Award_XB_39","Easy");
	GivePlayerExp(SkeyXibei,"qianjinyifang")
end

--还没带回烈阳根给孙方仁
function task_018_03_1()

local strTalk = {
	"C竎h b祇 ch� thu鑓 kh� rm r�, v� kh� � ch� ph秈  ph遪g c t輓h c馻 n�. T筸 th阨 ngi 甶 h竔 10 T輈h Dng C╪ 甧m v� y, theo D鵦 Phng ghi l筰, h竔 v� b祇 ch� thu鑓 T輈h Dng C╪ r蕋 rm r�. T輈h Dng C╪ c� 3 m祏 xanh l�, v祅g, . C﹜ m祏 xanh c nh蕋, l蕐 li li襪 c総 t� ph莕 th﹏; c﹜ m祏 v祅g r鏽g nh蕋, d飊g cu鑓 c萵 th薾 o t quanh c﹜ r錳 l蕐 l猲; c﹜ m祏  m筺h nh蕋, d飊g Ch駓 th� r鋍 l韕 ngo礽  l蕐 ch蕋 d辌h. C遪 ph莕 kh竎 u kh玭g th� d飊g. Ta ti誴 t鬰 nghi猲 c鴘 c竎h b祇 ch� thu鑓.",
	}

	TalkEx("",strTalk);

	--补发采药包裹
	if GetItemCount(2,0,724) < 1 then
		AddItem(2,0,724,1,1);
	end

end

--与灰烈阳根对话采集
function task_018_04_0()

local strSay = {
	"Ch綾 ch緉 y l� T輈h Dng C╪ T玭 ti襫 b鑙  n鉯,  ta xem d飊g c竔 g�  h竔 ch髇g y.",
	"Li li襪/#task_018_05_0(1)",
	"Cu鑓/#task_018_05_0(0)",
	"Ch駓 th�/#task_018_05_0(0)",
	"Lo筰 c﹜ n祔 tr玭g c� v� p, t鑤 nh蕋 kh玭g n猲 l祄 h� n�/Task_Exit",
		}

	SelectSay(strSay)

end

--与黄烈阳根对话采集
function task_018_04_1()

local strSay = {
	"Ch綾 ch緉 y l� T輈h Dng C╪ T玭 ti襫 b鑙  n鉯,  ta xem d飊g c竔 g�  h竔 ch髇g y.",
	"Li li襪/#task_018_05_0(0)",
	"Cu鑓/#task_018_05_0(1)",
	"Ch駓 th�/#task_018_05_0(0)",
	"Lo筰 c﹜ n祔 tr玭g c� v� p, t鑤 nh蕋 kh玭g n猲 l祄 h� n�/Task_Exit",
		}

	SelectSay(strSay)

end

--与红烈阳根对话采集
function task_018_04_2()

local strSay = {
	"Ch綾 ch緉 y l� T輈h Dng C╪ T玭 ti襫 b鑙  n鉯,  ta xem d飊g c竔 g�  h竔 ch髇g y.",
	"Li li襪/#task_018_05_0(0)",
	"Cu鑓/#task_018_05_0(0)",
	"Ch駓 th�/#task_018_05_0(1)",
	"Lo筰 c﹜ n祔 tr玭g c� v� p, t鑤 nh蕋 kh玭g n猲 l祄 h� n�/Task_Exit",
		}

	SelectSay(strSay)

end

--采集烈阳根
function task_018_05_0(nType)

local nNpcIndex = GetTargetNpc();
local strTalk = {};

	if nNpcIndex == nil then
		return
	end

	SetNpcLifeTime(nNpcIndex,0);

	if nType == 1 then

		AddItem(2,0,723,1,1);--获得一颗烈阳根

		if GetItemCount(2,0,723) >= 10 then
			strTalk = {
				"H竔 頲 10 T輈h Dng C╪, c遪 kh玭g mau a cho T玭 Phng Nh﹏  b祇 ch� c竎h kh綾 ch� Dc Nh﹏ Th秓."
				}
		else
			strTalk = {
				"B筺  h竔 th祅h c玭g 1 T輈h Dng C╪ h鱱 d鬾g."
				}
		end

	else

		strTalk = {
			"H譶h nh� b筺 s� d鬾g kh玭g ng d鬾g c� h竔 thu鑓, h竔 T輈h Dng C╪ kh玭g th祅h c玭g.",
			"T玭 ti襫 b鑙 t鮪g n鉯 r籲g h竔 v� b祇 ch� thu鑓 T輈h Dng C╪ r蕋 rm r�. T輈h Dng C╪ c� 3 m祏 xanh l�, v祅g, . C﹜ m祏 xanh c nh蕋, l蕐 li li襪 c総 t� ph莕 th﹏; c﹜ m祏 v祅g r鏽g nh蕋, d飊g cu鑓 c萵 th薾 o t quanh c﹜ r錳 l蕐 l猲; c﹜ m祏  m筺h nh蕋, d飊g Ch駓 th� r鋍 l韕 ngo礽  l蕐 ch蕋 d辌h. C遪 ph莕 kh竎 u kh玭g th� d飊g.",
			"C莕 ph秈 ch� � m祏 s綾 c馻 T輈h Dng C╪, s� d鬾g ng d鬾g c� h竔 m韎 c� th� th祅h c玭g.",
			}

	end


	TalkEx("",strTalk);

end

--已经收集或未收集6棵烈阳根和孙方仁对话
function task_018_06_0()

local strTalk = {};

	--带回烈阳根物品
	if GetItemCount(2,0,723) >= 10 then
		strTalk = {
			"T玭 ti猲 sinh, xin xem y c� ph秈 l� T輈h Dng C╪ kh玭g?",
			"ng r錳, y l� T輈h Dng C╪ dc t輓h c鵦 h祅, ta  hi觰 r� c竎h b祇 ch� thu鑓 t� T輈h Dng C╪, ch� ta.",
			"M閠 l骳 sau�",
			"Зy l� T輈h Dng Th駓, l� tinh hoa c馻 T輈h Dng C╪, ph琲 T輈h Dng Th駓 tr猲 c� Dc vng, kh玭g l﹗ sau th﹏ v� r� c馻 n� s� b� t鎛 thng, l骳  s� di謙 tr� t薾 g鑓 dc th秓 n祔. Ngi c莔 甶, c秏 t� ngi gi髉 ta t譵 l筰 Thi猲 Kim D鵦 Phng.",
			" t� T玭 ti猲 sinh, may m� 頲 T玭 ti猲 sinh tng tr�, cu鑙 c飊g  di謙 tr� 頲 c th秓 n祔.",
			}

		DelItem(2,0,723,10);
		DelItem(2,0,724,1);--采药包裹
		AddItem(2,0,725,1);--获得烈阳水
		TalkEx("",strTalk);
		SetTask(TASK_XB_ID_01,41);
		SetTask(KILL_YAORENBOSS_NUM,0);
		TaskTip("C莔 T輈h Dng Th駓 do T玭 Phng Nh﹏ pha ch� n Dc Vng ng ti猽 di謙 5 c﹜ Dc Nh﹏ Th秓.");
		Msg2Player("C莔 T輈h Dng Th駓 do T玭 Phng Nh﹏ pha ch� n Dc Vng ng ti猽 di謙 5 c﹜ Dc Nh﹏ Th秓.");
		GivePlayerAward("Award_XB_40","Easy");
		GivePlayerExp(SkeyXibei,"lieyanggen")
	--没有带回烈阳根
	else
		strTalk = {
			"C竎h b祇 ch� thu鑓 kh� rm r�, v� kh� � ch� ph秈  ph遪g c t輓h c馻 n�. C莕 T輈h Dng C╪ xanh, v祅g,  m鏸 lo筰 2 c﹜, ngi 甧m 10 T輈h Dng C╪ v� y, Theo D鵦 Phng ghi l筰, h竔 v� b祇 ch� thu鑓 T輈h Dng C╪ r蕋 rm r�. T輈h Dng C╪ c� 3 m祏 xanh l�, v祅g, . C﹜ m祏 xanh c nh蕋, l蕐 li li襪 c総 t� ph莕 th﹏; c﹜ m祏 v祅g r鏽g nh蕋, d飊g cu鑓 c萵 th薾 o t quanh c﹜ r錳 l蕐 l猲; c﹜ m祏  m筺h nh蕋, d飊g Ch駓 th� r鋍 l韕 ngo礽  l蕐 ch蕋 d辌h. C遪 ph莕 kh竎 u kh玭g th� d飊g. Ta ti誴 t鬰 nghi猲 c鴘 c竎h b祇 ch� thu鑓.",
			}
		TalkEx("",strTalk);
	end
end

--还没消灭药人草与孙方仁对话
function task_018_06_1()

local strTalk = {
	"Ph琲 T輈h Dng Th駓 tr猲 c� Dc vng, kh玭g l﹗ sau th﹏ v� r� c馻 n� s� b� t鎛 thng, l骳  s� di謙 tr� t薾 g鑓 dc th秓 n祔. Ngi c莔 甶, c秏 t� ngi gi髉 ta t譵 l筰 Thi猲 Kim D鵦 Phng.",
	}
	--补发烈阳水
	if GetItemCount(2,0,725) < 1 then
		AddItem(2,0,725,1);--获得烈阳水
	end
	TalkEx("",strTalk);

end

--带上烈阳水与药人草对话
function task_018_07_0()

local strSay = {
	"Ngi mu鑞 l祄 g�?",
	"D飊g T輈h Dng Th駓 ti猽 di謙 1 Dc Nh﹏ Th秓/task_018_07_1",
	"Kh玭g mu鑞 l祄/Task_Exit"
	};

	SelectSay(strSay);

end

--带上烈阳水消灭药人草
function task_018_07_1()

local strTalk = {};
local nNpcIndex = GetTargetNpc();

	if GetTargetNpc() == nil then
		return
	end

	if GetItemCount(2,0,725) < 1 then
	 	strTalk = {
	 		"N誹 kh玭g c� T輈h Dng Th駓, th� th� kh玭g c� c竎h n祇 di謙 Dc Nh﹏ Th秓."
	 		}
	 	TalkEx("",strTalk);
	 	return
	end

	strTalk = {
		"H鮩�",
		"N誹 c� Dc nh﹏ chuy猲 canh gi� Dc Nh﹏ Th秓, th� th� ch糿g c遪 c竎h n祇 nh ph秈 tr� kh� ch髇g m韎 c� th� di謙 lo筰 c� n祔."
		}

	SetNpcLifeTime(nNpcIndex,0);
	nNpcIndex = CreateNpc("Th� l躰h Dc nh﹏","Dc nh﹏ vng",GetWorldPos());
	SetNpcScript(nNpcIndex,"\\script\\西北区\\药王洞\\npc\\药人首领.lua");
	SetNpcLifeTime(nNpcIndex,600);
	TalkEx("",strTalk);

end

---------------------------------- 西北区19分支1_10付诸东流----------------------------------

--成功消灭五株药人草，回去与欧阳对话
function task_019_01_0()

local strTalk = {
	" Dng ti襫 b鑙, T玭 ti猲 sinh qu� nhi猲 cao minh, 玭g  t譵 ra c竎h di謙 Dc Nh﹏ Th秓, ta  v祇 Dc Vng ng di謙 Dc Nh﹏ Th秓, Dc vng kh玭g c遪 l頸 d鬾g lo筰 dc th秓 n祔  l祄 ra Dc nh﹏ 頲 n鱝.",
	"Qu� t鑤, <sex>  l祄 vi謈 t鑤 cho b� t竛h.Dc vng qu� 秓 tng v� tinh ch� th秓 dc, Dc Nh﹏ Th秓 trong Dc Vng ng tuy  di謙 h誸, nh璶g v韎 nh鱪g hi觰 bi誸 v� dc th秓 h緉 s� t譵 lo筰 dc th秓 kh竎 thay th�.",
	"Trong Dc Vng ng c� 1 M藅 ng n琲 Dc vng 萵 n竨, ra v祇 r蕋 kh�, trong m藅 ng c遪 r蕋 nhi襲 Dc nh﹏ ch璦 h譶h th祅h, s� r籲g trong M藅 ng v蒼 c遪 c蕋 gi蕌 Dc vng th秓. Dc vng th秓 d� m鋍, tr錸g l筰 n� d� nh� tr� b祅 tay.",
	"Dc vng l� m鑙 tai h鋋 kh玭 lng, b﹜ gi� b� T﹜ H� mua v� th� c祅g c鵦 k� nguy hi觤. B﹜ gi� b鋘 ch髇g 產ng ch� t筼 r蕋 nhi襲 Dc nh﹏, ch� c遪 c竎h di謙 tr� t薾 g鑓 th玦.",
	}

	TalkEx("task_019_01_0_1",strTalk);

end

--续对话
function task_019_01_0_1()

local strTalk = {
	"N誹  nh� v藋, kh玭g s� kinh ng n ngi T﹜ H� sao?",
	"C莕 ph秈 c萵 tr鋘g, ngi bi誸 Dc vng m藅 ng � u kh玭g?",
	"Ta  t鮪g 頲 1 ngi ch� 甶觤 c竎h v祇 Dc vng m藅 ng, Dc vng 萵 n竨 trong ng do Canh gi� Dc nh﹏ canh g竎, ngo礽 Dc vng ra kh玭g ai 頲 v祇. Canh gi� Dc nh﹏ m閠 khi ph竧 hi謓 c� ngi t� ti謓 x玭g v祇 m藅 ng, t鴆 kh綾 s� tri謚 t藀 t蕋 c� Dc nh﹏ trong ng c飊g c玭g k輈h.",
	"N鉯 nh� v藋 th� ngi T﹜ H� c騨g kh玭g th� v祇 M藅 ng, c竎h t鑤 nh蕋 l� 竚 s竧 Dc vng 竚 s竧 � trong M藅 ng. Canh gi� Dc nh﹏ ch� nh薾 ra Dc vng, ch髇g ta ph秈 l頸 d鬾g 觤 n祔,  ngi c秈 trang th祅h Dc vng tr� tr閚 v祇 M藅 ng. Ngi ch璦 t鮪g g苝 Dc vng ng kh玭g? Nh璶g  c� ngi t鮪g g苝 h緉?",
	}

	TalkEx("task_019_01_0_2",strTalk);

end

--续对话
function task_019_01_0_2()

local strTalk = {
	"A, ta c� quen 1 ngi  t鮪g th蕐 m苩 Dc vng, t猲 h緉 l� L璾 Tam, ta 甶 h醝 h緉 dung m筼 Dc vng.",
	"T鑤 qu�, ngi nh� h緉 gi髉 ngi m� t� dung m筼 Dc vng, sau  quay l筰 y ta gi髉 ngi v� 1 b鴆 ch﹏ dung Dc vng. Ta c� quen m閠 cao th� c秈 trang � Ph鬾g Tng ph�, s� trng c馻 h緉 l� ch� t筼 m苩 n� da ngi, n誹 c� m苩 n� s� l鮝 頲 Canh gi� Dc nh﹏, l蝞 v祇 trong m藅 ng.",
	"K� n祔 qu� r蕋 hay, th莕 tr� c馻 Canh gi� Dc nh﹏ b� Dc vng th秓 h駓 ho筰, ch髇g kh玭g th� ph﹏ bi謙 頲 dung m筼, ta 甶 t譵 L璾 Tam h醝 h緉 dung m筼 Dc vng.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,43);
	TaskTip("дn Dc vng c鑓 t譵 L璾 Tam h醝 th╩ dung m筼 c竎h ╪ m芻 c馻 Dc vng.");
	Msg2Player("дn Dc vng c鑓 t譵 L璾 Tam h醝 th╩ dung m筼 c竎h ╪ m芻 c馻 Dc vng.");
	GivePlayerAward("Award_XB_41","Easy");
	GivePlayerExp(SkeyXibei,"qingchuyaorencao")
end

--尚未与刘三对话
function task_019_01_1()

local strTalk = {
	"Ngi mau 甶 t譵 L璾 Tam nh� h緉 m� t� dung m筼 Dc vng, sau  quay l筰 y ta gi髉 ngi v� 1 b鴆 ch﹏ dung Dc vng."
	}

	TalkEx("",strTalk);

end

--与刘三对话询问药王衣着容貌
function task_019_02_0()

local strTalk = {
	"Nh譶 th蕐 <sex> b譶h an v� s�, ta c騨g y猲 t﹎ ph莕 n祇. B﹜ gi� ta c� th� y猲 t﹎ r阨 kh醝 y.",
	"Ch糿g l� t赜u ca ng � y i ta xu蕋 ng? в t赜u ca lo l緉g ta th藅 竬 n竬. N琲 n祔 kh玭g th� � l﹗, t赜u ca mau r阨 kh醝 n琲 n祔. T赜u ca  t鮪g th蕐 dung m筼 Dc vng, c� th� m� t� l筰 gi髉 ta 頲 kh玭g?",
	"<sex> ph秈 n Dc Vng ng sao? Ngi ph秈 c萵 th薾 Dc vng, tuy h緉 r﹗ t鉩 b筩 tr緉g nh璶g v� c飊g kh醗. u h緉 gi鑞g nh� b竜, r﹗ t鉩 d礽 b筩 tr緉g v� r薽, da d� kh玭g kh竎 g� ngi tr� tu鎖. Sau l璶g 甧o 1 b譶h dc h� l� l韓, l骳  kh萵 c蕄 kh玭g th� nh譶 r� nh璶g dung m筼 c馻 h緉 r蕋 d� nh�.",
	"Ti觰 ca m� t� h譶h d竛g Dc vng c騨g kh� chi ti誸. B籲g h鱱 h穣 mau r阨 kh醝 n琲 n祔, t譵 n琲 kh竎 m璾 sinh.  t� b籲g h鱱, ta xin c竜 t�.",
	"<sex> qu� kh竎h s竜 r錳, ta ph秈 c竚 琻 m韎 ng, <sex> h祅h t萿 gian h�, m鋓 vi謈 ph秈 c萵 tr鋘g.",
	}

	SetTask(TASK_XB_ID_01,44);
	TalkEx("",strTalk);
	TaskTip("Х bi誸 頲 tng m筼 c馻 Dc vng, mau quay v� b竜  Dng H鋋 ti襫 b鑙.");
	Msg2Player("Х bi誸 頲 tng m筼 c馻 Dc vng, mau quay v� b竜  Dng H鋋 ti襫 b鑙.");

end

--未回报欧阳画药王的容貌
function task_019_02_1()

local strTalk = {
	"<sex> nh蕋 nh ph秈 c萵 th薾 v韎 Dc vng, tuy h緉 r﹗ t鉩 b筩 tr緉g nh璶g v� c飊g kh醗. u h緉 gi鑞g nh� b竜, r﹗ t鉩 d礽 b筩 tr緉g v� r薽, sau l璶g 甧o 1 l� dc h� l�, l骳  kh萵 c蕄 ta kh玭g nh譶 r� nh璶g dung m筼 c馻 h緉 r蕋 d� nh�."
	}

	TalkEx("",strTalk);

end

--向欧阳画描述药王衣着容貌
function task_019_03_0()

local strTalk = {
	"Ta  chu萵 b� xong b髏 m鵦, ngi  h醝 k� dung m筼 Dc vng ch璦?",
	"Ta  h醝 dung m筼 c馻 Dc vng. Dc vng r﹗ t鉩 b筩 tr緉g,  c� tu鎖. u h緉 gi鑞g nh� b竜, r﹗ t鉩 d礽 b筩 tr緉g v� r薽. da d� kh玭g kh竎 g� ngi tr� tu鎖. Sau l璶g 甧o 1 b譶h dc h� l� l韓, ti襫 b鑙 c� th� d鵤 theo  v� 頲 kh玭g?",
	"Tuy kh玭g r� r祅g l緈, nh璶g nh鱪g chi ti誸 m� t� kh� c tr璶g. Theo m� t� c馻 ngi th蕐 c騨g c� v礽 n衪 gi鑞g Trng Phi th阨 Tam Qu鑓, ngi ch� ta 1 ti課g, ta 甶 v� 1 b鴆 tranh gi鑞g nh� th藅.",
	" 1 gi� sau厖",
	}

	TalkEx("task_019_03_0_1",strTalk);

end

--续对话
function task_019_03_0_1()

local strTalk = {
	"Vi謈 l韓  xong, ngi 甧m ch﹏ dung Dc vng 甶 t譵 Л阯g Thi猲 Thi猲, c� ta s� l祄  c秈 trang gi鑞g nh� th藅 cho ngi.",
	"Л阯g Thi猲 Thi猲 產ng � Ph鬾g Tng ph�? Ch糿g ph秈 Л阯g m玭 � T� Xuy猲 sao?",
	"Ph� th﹏ c馻 Л阯g Thi猲 Thi猲 v� ta c� th﹎ t譶h v韎 nhau, ti誧 l� kh玭g may ch誸 y觰, trc l骳 l﹎ chung d苙 d� ta ch╩ s鉩 c� ta. Thi猲 Thi猲 v鑞 thu閏 Л阯g m玭, c� ta ch� th輈h thu藅 c秈 trang, nh璶g ngi c馻 Л阯g m玭 t� trc n nay lu玭 xem thng thu藅 c秈 trang. Sau khi ph� th﹏ c馻 Thi猲 Thi猲 m蕋, c� ta b� Л阯g m玭 lo筰 tr�, cu鑙 c飊g ta khuy猲 c� ta n nh c� t筰 Ph鬾g Tng , tr竛h xa n琲 phi襫 ph鴆, l筰 c� th� ph竧 huy s� trng.",
	"H鉧 ra l� v藋, ta 甶 t譵 Л阯g c� nng y. Ti襫 b鑙, c竜 t�!",
	}

	TalkEx("",strTalk);
	AddItem(2,0,752,1,1);--得到药王画像
	SetTask(TASK_XB_ID_01,45);
	TaskTip("T譵 Л阯g Thi猲 Thi猲 � Ph鬾g Tng nh� ch� t筼 v藅 d鬾g  c秈 trang theo ch﹏ dung Dc vng.");
	Msg2Player("T譵 Л阯g Thi猲 Thi猲 � Ph鬾g Tng nh� ch� t筼 v藅 d鬾g  c秈 trang theo ch﹏ dung Dc vng.");
	GivePlayerAward("Award_XB_42","Easy");
	GivePlayerExp(SkeyXibei,"yaowanghuaxiang")
end

--未与唐芊芊对话请求制作易容装
function task_019_03_1()

local strTalk = {
	"Ngi 甧m b鴆 'ch﹏ dung Dc vng' ta v� a cho Л阯g Thi猲 Thi猲, nh� c� ta ch� t筼  c秈 trang, nh� v藋 vi謈 h� th� Dc vng d� nh� tr� b祅 tay."
	}

	TalkEx("",strTalk);

end

--与唐芊芊对话请求帮忙制作易容装
function task_019_04_0()

	local strTalk = {
	"C� nng l� Л阯g Thi猲 Thi猲?  Dng H鋋 ti襫 b鑙 n鉯 v韎 ta c� r蕋 tinh th玭g thu藅 c秈 trang, c� th� gi髉 ta ch� t筼 1 t蕀 m苩 n� da ngi?",
	"Ta ch輓h l� Л阯g Thi猲 Thi猲. H鉧 ra l� b籲g h鱱 c馻  Dng b� b�, l祄 1 b�  c秈 trang th� qu� d�. Ch� c莕 c竎 h� a ch﹏ dung c馻 ngi mu鑞 gi� d筺g cho ta, b秓 m th藅 gi� kh� ph﹏ bi謙 頲.",
	" t� c� nng, nh� c� nng l祄 m苩 n� d鵤 v祇 b鴆 h譶h n祔.",
	"Th� ra l� 1 玭g gi�, r﹗ t鉩 u b筩 tr緉g, da d� th� l筰 b鉵g lng. S� r籲g ta kh玭g c�  thu鑓 nhu閙. C竎 h� t譵 gi髉 ta 100 L穘h tr飊g t� v� 100 Da s� t�. Ch� c� 2 lo筰 nguy猲 li謚 n祔 m韎 ph� h頿 v韎 lo筰 t鉩 v� m祏 da n祔.",
	"Л琻g nhi猲 kh玭g c� v蕁  g�, c� nng ch� ta ch鑓 l竧, ta l藀 t鴆 甶 thu th藀 nguy猲 li謚.",
	}

	DelItem(2,0,752,1);--删去药王画像
	SetTask(TASK_XB_ID_01,46);
	TalkEx("",strTalk);
	TaskTip("Thu th藀 100 L穘h tr飊g t� v� 100 Da s� t� giao cho Л阯g Thi猲 Thi猲 ch� t筼  c秈 trang Dc vng.");
	Msg2Player("Thu th藀 100 L穘h tr飊g t� v� 100 Da s� t� giao cho Л阯g Thi猲 Thi猲 ch� t筼  c秈 trang Dc vng.");

end

--带回或没有带回冷虫丝等物品给唐芊芊
function task_019_05_0()

local strTalk = {};

	--带回物品
	if GetItemCount(2,9,4) >= 100 and GetItemCount(2,2,47) >= 100 then
		strTalk = {
			"Зy l� nguy猲 li謚 c� nng c莕, c遪 c莕 th� g� n鱝 kh玭g?",
			"B蕐 nhi猽  r錳, m鋓 th�   kho秐g n鱝 gi� sau s� l祄 xong m苩 n�, <sex> ch� ch髏.",
			"M閠 l骳 sau�",
			"M苩 n� v�  c秈 trang  l祄 xong, c竎 h� th� xem c� v鮝 � ch璦?",
			"Л阯g c� nng tr� tu� h琻 ngi, b祅 tay l筰 kh衞 l衞, c秈 trang r蕋 kh� ph﹏ bi謙 th藅 gi�. Thu藅 c秈 trang c馻 Л阯g c� nng th藅 cao si猽.T筰 h� c遪 vi謈 quan tr鋘g c莕 l祄, c秏 t� c� nng trng ngh躠 tng tr�.",
			}
		AddItem(2,0,760,1,1);--药王易容装
		DelItem(2,9,4,100);
		DelItem(2,2,47,100);
		TalkEx("",strTalk);
		SetTask(TASK_XB_ID_01,47);
		TaskTip("у c秈 trang Dc vng  c� , c� th� l鮝 頲 ngi canh g竎 trong Dc Vng ng.");
		Msg2Player("у c秈 trang Dc vng  c� , c� th� l鮝 頲 ngi canh g竎 trong Dc Vng ng.");
		GivePlayerAward("Award_XB_43","Easy");
		GivePlayerExp(SkeyXibei,"yaowangyirongzhuang")
	--没有带回物品
	else
		strTalk = {
			"Th� ra l� 1 玭g gi�, r﹗ t鉩 u b筩 tr緉g, da d� th� l筰 b鉵g lng. S� r籲g ta kh玭g c�  thu鑓 nhu閙. C竎 h� t譵 gi髉 ta 100 L穘h tr飊g t� v� 100 Da s� t�. Ch� c� 2 lo筰 nguy猲 li謚 n祔 m韎 ph� h頿 v韎 lo筰 t鉩 v� m祏 da n祔."
			}

		TalkEx("",strTalk);
	end

end

--已经取得易容装(补发易容装)
function task_019_05_1()

local strTalk = {
	"M苩 n� v�  c秈 trang  l祄 xong, c竎 h� th� xem c� v鮝 � ch璦?"
	}

	TalkEx("",strTalk);

	if GetItemCount(2,0,760) < 1 then
		AddItem(2,0,760,1,1);--药王易容装
	end

end

--与取得易容装与药王秘洞看守人对话
function task_019_06_0()

local strTalk = {};
local nMapDataIndex = random(1,getn(YaoWang_MapData));
local xWPos,yWPos,xPos,yPos = YaoWang_MapData[nMapDataIndex][1],YaoWang_MapData[nMapDataIndex][2],YaoWang_MapData[nMapDataIndex][3],YaoWang_MapData[nMapDataIndex][4]
local nNpcIndex = 0;

	--玩家若任务失败需要过30分钟才能重新刷出药王
	if GetTime()-GetTask(CREAT_YAOWANG_TIME)	>= 1800 then

		strTalk = {
			"Ngi l� ai?",
			"Ta l� Dc vng, kh玭g nh薾 ra ta sao?",
			"Ai l祄 錸 b猲 ngo礽 !?",
			"Чi s� kh玭g hay r錳, kh玭g th� nh l鮝 頲 n鱝, kh玭g c遪 c竎h n祇 kh竎, nh ph秈 x玭g l猲, tr� kh� Dc vng.",
			}

		SetTask(CREAT_YAOWANG_TIME,GetTime());--记录药王刷新时间
		nNpcIndex = CreateNpc("Dc Vng","Dc Vng",510,xWPos,yWPos);
		SetNpcScript(nNpcIndex,"\\script\\西北区\\药王洞\\npc\\药王.lua");
		SetNpcLifeTime(nNpcIndex,1500);
		Msg2Player("Dc vng xu蕋 hi謓 �  "..xPos..", "..yPos.." , h穣 mau 甶 ti猽 di謙 h緉.")
		TaskTip("Dc vng xu蕋 hi謓 �  "..xPos..", "..yPos.." , h穣 mau 甶 ti猽 di謙 h緉.");

	else

		strTalk = {
			"厖",
			"Dng nh� kh玭g c� ph秐 鴑g g�, c竎h 30 ph髏 Dc vng m韎 xu蕋 hi謓, ch� c� h閕 th� ti誴!"
			}

	end

	TalkEx("",strTalk);

end

--已经领取任务但还未取得易容装与看守人对话
function task_019_06_1()

local strTalk = {
	"厖",
	"Kh玭g c�  c秈 trang ch� t� ti謓 h祅h ng, b籲g kh玭g kinh ng n Dc vng h藆 qu� kh� lng.",
	};

	TalkEx("",strTalk);

end

--没有领取任务与药室看守人对话
function task_019_06_2()

local strTalk = {
	"厖",
	};

	TalkEx("",strTalk);

end

--已经杀死药王和欧阳画对话
function task_019_07_0()

local strTalk = {
	" Dng ti襫 b鑙, may m� ch髇g ta 甶 trc m閠 bc ti猽 di謙 Dc vng, Dc vng  ng � ch� t筼 Dc nh﹏ cho qu﹏ i T﹜ H�, ngi h穣 xem m藅 th� n祔, Dc vng c遪 chu萵 b� Phng thu鑓 Dc nh﹏ cho T﹜ H�.",
	"L骳 u ta c� tng T﹜ H� mu鑞 Dc vng ch� t筼 s� lng l韓 Dc nh﹏  s� d鬾g, kh玭g ng� T﹜ H� v蒼 mu鑞 tr鵦 ti誴 s� d鬾g qu﹏ i c馻 m譶h, ngi T﹜ H� qu� th藅 th� 畂筺 c 竎. May m�  di謙 Dc Nh﹏ Th秓, k� ho筩h c馻 b鋘 ch髇g r錳 s� nh� d� tr祅g xe c竧.",
	"S� r籲g ngi T﹜ H� kh玭g tin tng th莕 d﹏ Чi T鑞g, th� hy sinh ngi c馻 m譶h ch� quy誸 kh玭g d飊g ngi T鑞g trong qu﹏ i. цi th� l� Чi T鑞g, T﹜ H� quy誸 kh玭g l� l�.",
	"N誹 T﹜ H� c� 頲 phng thu鑓 n祔, ch髇g ta ch鑞g  kh玭g n鎖, ph秈 h駓 phng thu鑓 n祔  tr竛h g﹜ h鋋 cho ngi d﹏. Nh璶g n誹 Nh蕋 ph萴 阯g ph竧 hi謓 ra kh玭g th蕐 tung t輈h c馻 phng thu鑓 u, nh蕋 nh s� nghi ng�. C� r錳, ngi 甶 t譵 T玭 Phng Nh﹏ , a phng thu鑓 th藅 cho 玭g ta nghi猲 c鴘, l祄 1 phng thu鑓 gi� cho Nh蕋 ph萴 阯g, l祄 nh� th� v鮝 gi蕌 頲 chuy謓 Dc vng b� ti猽 di謙 v� c� th� ch� t筼 Dc nh﹏ gi� tr� tr閚 v祇 qu﹏ i T﹜ H�.",
	"Tuy謙 k�,  Dng ti襫 b鑙 kh玭g h� danh l� b� n穙 c馻 Trng Ca M玭. C竔 n祔 g鋓 l� gieo nh﹏ n祇 g苝 qu� n蕐.",
	}

	TalkEx("task_019_07_0_1",strTalk);

end

--发奖励
function task_019_07_0_1()

	give_zb_award(44);

	if GetTask(TASK_GET_AWARD) == 1 then
		SetTask(TASK_GET_AWARD,0);
		DelItem(2,0,727,1);--删去法王书信
		SetTask(TASK_XB_ID_01,49);
		TaskTip("T譵 T玭 Phng Nh﹏ h醝 xem Phng thu鑓 Dc nh﹏ c� th� l祄 gi� hay kh玭g.");
		Msg2Player("T譵 T玭 Phng Nh﹏ h醝 xem Phng thu鑓 Dc nh﹏ c� th� l祄 gi� hay kh玭g.");
		GivePlayerAward("Award_XB_44","Easy");
		GivePlayerExp(SkeyXibei,"yaowang")
	end
end

--还未与孙方仁对话
function task_019_07_1()

local strTalk = {
	"Ngi 甶 t譵 T玭 Phng Nh﹏ , a phng thu鑓 th藅 cho 玭g ta nghi猲 c鴘, l祄 1 phng thu鑓 gi� cho Nh蕋 ph萴 阯g, l祄 nh� th� v鮝 gi蕌 頲 chuy謓 Dc vng b� ti猽 di謙 v� c� th� ch� t筼 Dc nh﹏ gi� tr� tr閚 v祇 qu﹏ i T﹜ H�. ",
	}

	TalkEx("",strTalk);

end

--与孙方仁对话让其帮忙伪造药人药方
function task_019_08_0()

local strTalk = {
	"<sex> c� di謙 g莕 h誸 Dc Nh﹏ Th秓 h筰 ngi  kh玭g?",
	"May c� T輈h Dng Th駓 c馻 T玭 ti猲 sinh ch� ra, Dc Nh﹏ Th秓 g苝 nc b� bi課 ch蕋,  ti猽 di謙 t薾 g鑓. Ti猲 sinh c遪 nh� l莕 trc ta nh綾 n c� ngi c 竎 mu鑞 d飊g Dc Nh﹏ Th秓 l猲 c� th� ngi kh玭g? Ta  c� 頲 phng thu鑓 Dc nh﹏.",
	"Чo cao 1 thc, ma cao 1 trng, tuy n鉯 ngi nghi猲 c鴘 ra phng thu鑓 n祔 t﹎ a c 竎, nh璶g kh玭g th� kh玭g kh﹎ ph鬰 t礽 tr� tinh th玭g, ki課 th鴆 s﹗ r閚g c馻 h緉 i v韎 th秓 dc. Ph秈 dung thu鑓 ng li襲, th藅 ng kh﹎ ph鬰.",
	"Kh玭g bi誸 T玭 ti猲 sinh c� th� ch� ra 1 phng thu鑓 gi� m筼, ch� c� h譶h d筺g b猲 ngo礽 c馻 Dc nh﹏ nh璶g l筰 kh玭g gi鑞g Dc nh﹏?",
	}

	TalkEx("task_019_08_0_1",strTalk);

end

--续对话
function task_019_08_0_1()

local strTalk = {
	"Kh� qu�, trong ch鑓 l竧 kh玭g th� l祄 ra phng thu鑓 n祔, nh璶g <sex> mu鑞 phng ph竝 ch� t筼 gi鑞g m� l筰 kh玭g gi鑞g Dc nh﹏? Th� th� ph秈 nghi猲 c鴘 li襲 lng v� t竎 d鬾g l蒼 nhau gi鱝 c竎 lo筰 thu鑓 v� c莕 s� d鬾g m閠 li襲 nh� Dc Nh﹏ Th秓.",
	"N誹 ti猲 sinh c� th� ch� t筼 phng thu鑓 gi鑞g nh璶g kh玭g ph秈 l� Phng thu鑓 Dc nh﹏ th� qu� t鑤 r錳, m閠 s� Dc Nh﹏ Th秓 ch誸 kh� kh玭g bi誸 c遪 d飊g 頲 kh玭g?",
	"Dc Nh﹏ Th秓 b� h衞 c� b祇 ch� thu鑓 頲 hay kh玭g c莕 ph秈 c﹏ nh綾, m閠 l竧 ngi h穣 quay l筰 ch� vi謈 n祔 trong ph髏 ch鑓 kh玭g th� n玭 n鉵g 頲, i ta nghi猲 c鴘 .",
	" t� T玭 ti猲 sinh, n誹 ti猲 sinh c� ti課 tri觧 g� m韎 xin b竜 l筰 cho  Dng H鋋 ti襫 b鑙, v穘 b鑙 s� l藀 t鴆 n l蕐. Kh玭g qu蕐 r莥 T玭 ti猲 sinh n鱝, c竜 t�.",
	}

	TalkEx("",strTalk);
	DelItem(2,0,726,1);--删去药人药方
	SetTask(TASK_XB_ID_01,50);
	TaskTip("T玭 Phng Nh﹏  ngi i m閠 th阨 gian m韎 n l蕐 Phng thu鑓 Dc nh﹏ gi�.");
	Msg2Player("T玭 Phng Nh﹏  ngi i m閠 th阨 gian m韎 n l蕐 Phng thu鑓 Dc nh﹏ gi�.");
	GivePlayerAward("Award_XB_45","Easy");
	GivePlayerExp(SkeyXibei,"zhuanyan")
end

--并行支线未结束未取得伪造药人药方
function task_019_08_1()

local strTalk = {
	"Ngi i m閠 th阨 gian r錳 h絥 n, ch� vi謈 n祔 trong ph髏 ch鑓 kh玭g th� n玭 n鉵g 頲, i ta nghi猲 c鴘 .",
	}

	TalkEx("",strTalk);

end


---------------------------------- 西北区20分支1_11兵不厌诈----------------------------------
--并行支线结束，汇总，取得伪造药人药方
function task_020_01_0()

local strTalk = {
	"T玭 ti猲 sinh  ch� t筼 ra 1 phng thu鑓 gi� r錳 ph秈 kh玭g?",
	"Phng thu鑓 n祔 ph秈 t輓h to竛 t� m� ch駈g lo筰 v� li襲 lng, n誹 kh玭 t輓h to竛 ch輓h x竎 e r籲g thu鑓 n祔 kh� th祅h. M蕐 ng祔 nay ta kh玭g ng鮪g th� thu鑓, cu鑙 c飊g  ch� th祅h, n誹 s� d鬾g l猲 c� th� ngi, t筸 th阨 xu蕋 hi謓 d竛g v� b猲 ngo礽 c馻 Dc nh﹏, nh璶g kh玭g c� s鴆 m筺h c馻 Dc nh﹏, qua 2 canh gi� s� h錳 ph鬰 l筰 nh� c�, tuy c� m閠 輙 c t輓h nh璶g kh玭g c� tr� ng筰 g� l韓.",
	"T玭 ti猲 sinh qu� nhi猲 l頸 h筰, l祄 nh� v藋 c� th� khi課 k� gian 竎 r琲 v祇 b蓎. Khi b鋘 ch髇g tng r籲g c� th� ph竧 huy uy l鵦 c馻 Dc nh﹏ c騨g l� l骳 di謙 vong. V蕋 v� cho T玭 ti猲 sinh qu�.",
	}

	TalkEx("task_020_01_0_1",strTalk);

end

--续对话
function task_020_01_0_1()

local strTalk = {
	"<sex> kh玭g c莕 kh竎h s竜, tuy bi誸 r蕋 t祅 竎 nh璶g 頲 nh譶 th蕐 phng thu鑓 n祔 nh� 頲 m� r閚g t莔 m総, nh� b� y thu藅 l玦 cu鑞 h琻. Phng thu鑓 th藅 c莕 ph秈 h駓, n誹 r琲 v祇 tay ngi thi謓 th� t鑤 c遪 ch� r琲 v祇 tay k� 竎 l� h鋋, gi� l筰 qu� l� tai h鋋.",
	"T玭 ti猲 sinh n鉯 r蕋 ng, v藅 h筰 ngi nh� v藋 l祄 sao c� th� gi� l筰? B﹜ gi� H駓 甶.  t� T玭 ti猲 sinh tng tr�, ti猲 sinh b秓 tr鋘g, ta xin c竜 t�.",
	"(Dc Nh﹏ Th秓, Phng thu鑓 Dc nh﹏, Dc vng u  tr� s筩h, cu鑙 c飊g  p tan ﹎ m璾 t祅 竎 c馻 T﹜ H�, b﹜ gi� ph秈 c萵 th薾 giao phng thu鑓 gi� cho Xa Lu﹏ B� Vng.)",
	}

	TalkEx("",strTalk);
	AddItem(2,0,728,1,1);--得到伪造的药人药方
	SetTask(TASK_XB_ID_01,51);
	TaskTip("Giao Phng thu鑓 Dc nh﹏ gi� cho Xa Lu﹏ B� Vng .");
	Msg2Player("Giao Phng thu鑓 Dc nh﹏ gi� cho Xa Lu﹏ B� Vng .");

end

--还未将伪造药方交给车轮霸王
function task_020_01_1()

local strTalk = {
	"H鋍 thu藅 v� dc th秓 qu� nhi猲 uy猲 th﹎, xem ra ta v蒼 ch璦 hi觰 h誸 v� Thi猲 Kim Y誹 Phng, t� b﹜ gi� ph秈 ch╩ ch� nghi猲 c鴘 ti誴 t鬰 ch� nguy謓 c馻 ti猲 t�.",
	"(Dc Nh﹏ Th秓, Phng thu鑓 Dc nh﹏, Dc vng u  tr� s筩h, cu鑙 c飊g  p tan ﹎ m璾 t祅 竎 c馻 T﹜ H�, b﹜ gi� ph秈 c萵 th薾 giao phng thu鑓 gi� cho Xa Lu﹏ B� Vng.)",
	}

	TalkEx("",strTalk);
	--补发药方
	if GetItemCount(2,0,728) < 1 then
		AddItem(2,0,728,1,1);--得到伪造的药人药方
		TaskTip("Giao Phng thu鑓 Dc nh﹏ gi� cho Xa Lu﹏ B� Vng .");
		Msg2Player("Giao Phng thu鑓 Dc nh﹏ gi� cho Xa Lu﹏ B� Vng .");
	end

end

--将伪造药方交给车轮霸王
function task_020_02_0()

local strTalk = {
	"Ngi  甶 m閠 th阨 gian d礽, chuy謓 Dc vng ti課 tri觧 sao r錳?",
	"May m� kh玭g ph� l遪g 駓 th竎 c馻 B筺, Ph竝 vng  l玦 k衞 頲 Dc vng, Dc vng ng � ch� t筼 Dc nh﹏ cho T﹜ H� , c遪 d﹏g Phng thu鑓 Dc nh﹏  qu﹏ T﹜ H� d飊g.",
	"Ha ha, t鑤 qu�, nghe n鉯 Dc vng r蕋 x秓 tr� qu竔 n, l骳 u ta c� lo kh玭g th� thuy誸 ph鬰 頲 h緉. Ngi l蕐 頲 phng thu鑓 r錳 ph秈 kh玭g? Лa cho ta xem.",
	"Зy l� Phng thu鑓 Dc nh﹏, theo c竎h pha ch� ghi � y ch� t筼 Dc nh﹏, t� r祔 v� sau T﹜ H� s� v� ch thi猲 h�.",
	}

	TalkEx("task_020_02_0_1",strTalk);

end

--续对话
function task_020_02_0_1()

local strTalk = {
	"Ha ha, n鉯 ng l緈, s韒 mu閚 g� Trung Nguy猲 c騨g thu閏 v� T﹜ H� ch髇g ta. N誹 vi謈 n祔 gi秈 quy誸 s韒, c玭g c馻 ngi kh玭g nh�, t輓h ra ngi c騨g  l藀 kh玭g 輙 c玭g lao, cho ngi nh薾 ch鴆 V� V� 阯g n閕. V� V� tr鵦 ti誴 nghe l謓h c馻 Th藀 i kim cang, gi� y Th藀 i kim cang b� thng nghi猰 tr鋘g, nguy猲 kh� b� t鎛 thng, ngi l藀 頲 c玭g lao s� 頲 ng錳 v祇 ch鴆 v� c遪 tr鑞g, g鋓 l� Kim cang Nh蕋 ph萴 阯g n閕.",
	"Kh玭g d竚, t筰 h� l祄 h誸 s鴆 m譶h l� vi謈 n猲 l祄.",
	"Th蕐 ngi kh玭g ham danh l頸. Ta giao cho ngi 1 nhi謒 v�. Khi ngi d� la v� b� m藅 c馻 Trng Sinh B蕋 L穙 n dc cho Nh蕋 ph萴 阯g, c� nh綾 n kim n tr蕁 gi� d� th� trong C� Dng ng, ch髇g ta  cho ngi 甶 甶襲 tra, trong C� Dng ng qu� nhi猲 c� d� th�, nh璶g ng苩 n鏸 l骳  kh玭g c� c竎h thu ph� d� th�, kh� m� l蕐 頲 kim n c馻 n�. May m� b鋘 ta g苝 1 v� 萵 n髉 trong ng t� x璶g l� C玭 L玭 l穙 o Phi Thng Чo Nh﹏. Ngi n祔 c� c竎h thu ph鬰 d� th�.",
	"(Kh玭g hay r錳, Phi Thng Чo Nh﹏  b� ta gi誸,  ng ch筸 v韎 Nh蕋 ph萴 阯g. Ph秈 b譶h t躰h l筰, nghe xem Nh蕋 ph萴 阯g c� h祅h ng g�.)",
	}

	TalkEx("task_020_02_0_2",strTalk);

end

--续对话
function task_020_02_0_2()

local strTalk = {
	"�, khi n C玭 L玭 th╩ d� tin t鴆 頲 bi誸 Phi Thng Чo Nh﹏  b� 畊鎖 ra kh醝 n骾, 萵 n髉 � C� Dng ng, nh璶g kh玭 ngh� r籲g 玭g ta bi誸 c竎h thu ph鬰 C� Dng th�.",
	"ng v藋, Ph竝 vng  giao thi謕 v韎 玭g ta 1 l莕, l穙 o  ng � thu ph鬰 C� Dng th� gi髉 ch髇g ta v� ng � nghi猲 c鴘 thu鑓 Trng sinh b蕋 l穙. Ta  ph竔 S竧 th� Oa Oa 甶 b祅 b筩, nh� 玭g ta thu ph鬰 C� Dng th�, nh璶g n gi� v蒼 ch璦 c� tin t鴆, ngi  t鮪g n C� Dng ng, th玭g thu閏 a h譶h, ngi 甶 m閠 chuy課 ph鑙 h頿 v韎 S竧 th� Oa Oa, c飊g tr� gi髉 Phi Thng Чo Nh﹏ thu ph鬰 d� th�, gi� y ngi  l� V� V�, tr鵦 ti誴 ph鑙 h頿 v韎 S竧 th� Oa Oa, c飊g tr� gi髉 Phi Thng Чo Nh﹏ thu ph鬰 d� th�.",
	"Tu﹏ l謓h.",
	"(Ti猽 r錳, n誹 S竧 th� Oa Oa n C� Dng ng nh璶g kh玭g th蕐 b鉵g d竛g c馻 C� Dng th� u v� ph竧 hi謓 thi th� c馻 Phi Thng Чo Nh﹏, Nh蕋 ph萴 阯g u bi誸 ch� c� ta ch筸 tr竛 Phi Thng Чo Nh﹏, th﹏ ph薾 gi竛 甶謕 b� b筰 l� th� m鋓 n� l鵦 c馻 ta s� ti猽 tan. Chi b籲g tr� kh� S竧 th� Oa Oa, xem nh� l� tr� h筰 cho d﹏, nh璶g ngi n祔 kh玭g d� i ph�, ph秈 l祄 sao y? ng r錳, Vi猲 B� kho竔 t鮪g b総 h緉 chi b籲g h醝 h緉 c� k� s竎h g�. Kh玭g bi誸 Vi猲 B� kho竔 c� � nha m玭 Ph鬾g Tng kh玭g.)",
	}

	TalkEx("",strTalk);
	DelItem(2,0,728,1);--删去伪造药方
	SetTask(TASK_XB_ID_01,52);
	TaskTip("дn nha m玭 Ph鬾g Tng 甶襲 tra h祅h tung c馻 Vi猲 Phi V﹏  d� h醝 vi謈 gi誸 S竧 th� Oa Oa.");
	Msg2Player("дn nha m玭 Ph鬾g Tng 甶襲 tra h祅h tung c馻 Vi猲 Phi V﹏  d� h醝 vi謈 gi誸 S竧 th� Oa Oa.");
	GivePlayerAward("Award_XB_46","Easy");
	GivePlayerExp(SkeyXibei,"wawashashou")
	add_xb_title(5);--一品堂羽卫称号

end

--还未与捕快对话
function task_020_02_1()

local strTalk = {
	"S竧 th� Oa Oa n C� Dng ng b祅 b筩 v韎 Phi Thng Чo Nh﹏, nh� 玭g ta thu ph鬰 C� Dng th�, nh璶g n gi� v蒼 ch璦 c� tin t鴆, ngi  t鮪g n C� Dng ng, th玭g thu閏 a h譶h, ngi 甶 m閠 chuy課 ph鑙 h頿 v韎 S竧 th� Oa Oa, c飊g tr� gi髉 Phi Thng Чo Nh﹏ thu ph鬰 d� th�.",
	"(Ti猽 r錳, S竧 th� Oa Oa n C� Dng ng th﹏ ph薾 gi竛 甶謕 m� b� b筰 l� th� m鋓 n� l鵦 c馻 ta s� ti猽 tan. Chi b籲g tr� kh� S竧 th� Oa Oa, xem nh� l� tr� h筰 cho d﹏, nh璶g ngi n祔 kh玭g d� i ph�, ph秈 l祄 sao y? ng r錳, Vi猲 B� kho竔 t鮪g b総 h緉 chi b籲g h醝 h緉 c� k� s竎h g�. Kh玭g bi誸 Vi猲 B� kho竔 c� � nha m玭 Ph鬾g Tng kh玭g.)",
	}

	TalkEx("",strTalk);

end

--与凤翔捕快对话询问袁飞云行踪
function task_020_03_0()

local strTalk = {
	"<sex> l筰 l� ngi, n t譵 Vi猲 B� kho竔 n鱝 h�?",
	"B� u i ca c� tr� nh� r蕋 t鑤, kh玭g bi誸 Vi猲 B� kho竔 c� � nha m玭 kh玭g?",
	"Vi猲 B� kho竔 kh玭g c� l骳 n祇 r秐h, kh玭g b総 ph筸 nh﹏ v� quy 竛 th� c騨g b� thng, 輙 khi n祇 xu蕋 hi謓 � nha m玭, � nha m玭 tr猲 di u kh﹎ ph鬰 t竎 phong c馻 Vi猲 B� kho竔 v� l蕐  l祄 gng, x� 竛 kh玭g d竚 khinh su蕋. L莕 n祔 Vi猲 B� kho竔 n M� cung sa m筩 th� l� 竛.",
	"M� cung sa m筩 l� n琲 kh玭g m閠 b鉵g ngi, c騨g x秠 ra v� 竛 n祇 sao?",
	"Чi o c h祅h l穙 У tr鑞 tr竛h s� truy b総 c馻 Vi猲 B� kho竔, n猲 tr鑞 v祇 M� cung sa m筩. Nh璶g Vi猲 B� kho竔 d� g� tha cho h緉, c騨g v祇 sa m筩 truy b総. чc h祅h l穙 У t礽 ngh� cao cng, to祅 s� d鬾g binh kh� k� qu竔, n誹 ngi mu鑞 t譵 Vi猲 B� kho竔 th� ph秈 c萵 th薾 t猲 o t芻 n祔.",
	"Ta 甶 t譵 Vi猲 B� kho竔, 產 t� b� u i ca ch� gi竜.",
	}

	SetTask(TASK_XB_ID_01,53);
	TalkEx("",strTalk);
	TaskTip("дn M� cung sa m筩, t譵 頲 чc h祅h l穙 У th� s� t譵 頲 Vi猲 b� u.");
	Msg2Player("дn M� cung sa m筩, t譵 頲 чc h祅h l穙 У th� s� t譵 頲 Vi猲 b� u.");

end

--还未杀死独行老陀和捕快对话
function task_020_03_1()

local strTalk = {
	"Giang Nam Чi o c h祅h l穙 У tr鑞 tr竛h s� truy l飊g c馻 Vi猲 B� kho竔 n猲 tr鑞 v祇 M� cung sa m筩. Vi猲 B� kho竔 c騨g v祇 sa m筩 truy b総.",
	}

	TalkEx("",strTalk);

end

--与唐葫芦对话买糖葫芦
function task_020_04_0()

local strTalk = {
	"B籲g h鱱 c� b竛 k裲 h� l� kh玭g?",
	"<sex> bi誸 xem h祅g y, k裲 h� l� c馻 ta chua ng鋞 h遖 quy謓 v祇 nhau, ╪ v祇 gi秈 kh竧 l筰 no b鬾g. L� s� 1 c馻 Чi T鑞g . Nh璶g <sex> n kh玭g ng l骳, ta  b竛 h誸 k裲 h� l� l祄 h玬 nay cho ngi t譵 kho b竨 sa m筩, b鋘 h� n y mua nh k�, y l� m鉵 ╪ v鮝 gi秈 kh竧 v鮝 l鉻 d� tuy謙 nh蕋 � sa m筩. ng l骳 h玬 nay b鋘 h� xu蕋 ph竧. N誹 <sex> mu鑞 mua th� ph秈 i n mai, ta s� l祄 c竔 m韎 cho.",
	"N誹 i n mai qu� th鵦 kh玭g 鎛. Цm ngi t譵 kho b竨 甶 sa m筩 r錳 �? g bi誸 b鋘 h�  甶 頲 m蕐 gi� r錳?",
	"B鋘 h� 甶 v蒼 ch璦 l﹗, u l� nh鱪g kh竎h quen, 甶 t譵 kho b竨 sa m筩r錳, ch綾 l� v蒼 ch璦 甶 xa, ch璦 v祇 s﹗ trong sa m筩 u.",
	"B鱝 kh竎 ta t韎 mua k裲 h� l� c馻 b籲g h鱱, c竜 t�.",
	}

	SetTask(TASK_XB_ID_01,55);
	TalkEx("",strTalk);
	CreateTrigger(0,1238,KILL_XB_XUNBAOREN);--杀怪触发器
	TaskTip("дn M� cung sa m筩 c� th� t譵 th蕐 10 x﹗ k裲 h� l� tr猲 ngi t譵 kho b竨.");
	Msg2Player("дn M� cung sa m筩 c� th� t譵 th蕐 10 x﹗ k裲 h� l� tr猲 ngi t譵 kho b竨.");

end

--未取得10个冰糖葫芦
function task_020_04_1()

local strTalk = {
	"B鋘 h� 甶 v蒼 ch璦 l﹗, u l� nh鱪g kh竎h quen, 甶 t譵 kho b竨 sa m筩r錳, ch綾 l� v蒼 ch璦 甶 xa, ch璦 v祇 s﹗ trong sa m筩 u.",
	}

	if	GetTrigger(KILL_XB_XUNBAOREN) == 0 then
		CreateTrigger(0,1238,KILL_XB_XUNBAOREN);
		TaskTip("дn M� cung sa m筩 c� th� t譵 th蕐 10 x﹗ k裲 h� l� tr猲 ngi t譵 kho b竨.");
		Msg2Player("дn M� cung sa m筩 c� th� t譵 th蕐 10 x﹗ k裲 h� l� tr猲 ngi t譵 kho b竨.");
	end

	TalkEx("",strTalk);

end

---------------------------------- 西北区21分支1_12剑拔弩张----------------------------------
--杀死娃娃杀手后回见车轮霸王
function task_021_01_0()

local strTalk = {
	"Vi謈 l韓 kh玭g hay r錳, C� Dng th�  xu蕋 hi謓, uy l鵦 vt qu� s鴆 tng tng c馻 ch髇g ta. Phi Thng Чo Nh﹏ t� cho r籲g c竎h thu ph鬰 C� Dng th� c� th� l祄 t╪g uy l鵦 c馻 n�, 玭g ta mu鑞 chi誱 l蕐 C� Dng th�.S竧 th� Oa Oa s� r籲g d� nhi襲 l祅h 輙. Ta v祇 trong ng b� C� Dng th� t蕁 c玭g. C騨g may tho竧 頲, C� Dng ng gi� y r蕋 nguy hi觤.",
	"C竔 g�? R鑤 cu閏 l� c� chuy謓 g�? Phi Thng Чo Nh﹏ th� v韎 ta r籲g b秓 m c竎h thu ph鬰 C� Dng th� tuy謙 i kh玭g x秠 ra sai s鉻, gi� y l筰 th蕋 th� b� m筺g c祅g l祄 li猲 l魕 n Th藀 i kim cang. S竧 th� Oa Oa b� b� m筺g trong ng, ngi t薾 m総 ch鴑g ki課 C� Dng th� t蕁 c玭g S竧 th� Oa Oa ng kh玭g?",
	"L骳 ta v祇 trong ng  kh玭g th蕐 Phi Thng Чo Nh﹏ v� S竧 th� Oa Oa u c�, ch� t譵 th蕐 1 l謓h b礽. C� Dng th� th藅 hung d�, c� s鴆 m筺h gh� g韒, s� r籲g  l� H醓 luy謓 kim n c馻 Phi Thng Чo Nh﹏ luy謓 ra. N誹 kh玭g th� cao th� nh� S竧 th� Oa Oa, ngo礽 C� Dng th� b� cng h鉧 ra th� kh玭g c遪 ai i u n鎖?",
	"S竧 th� Oa Oa tuy h譶h d竛g nh� tr� con, nh璶g v� v� c玭g ch� ng sau Th竎 B箃 Ho籲g . L莕 n祔 th蕋 b筰, ch� s� h緉 tr� tay kh玭g k辮, vi謈 n祔 t筸 th阨 d鮪g l筰, ta s� cho ngi v祇 ng 甶襲 tra. C� Dng th� xu蕋 hi謓 C� Dng ng c祅g nguy hi觤 h琻, Trng Sinh B蕋 L穙 n c莕 b祅 b筩 k� h琻. Nh蕋 ph萴 阯g l筰 m蕋 甶 m閠 tr� th�, Th藀 i kim cang  thng vong h琻 m閠 n鱝, h祅h ng l莕 n祔 xem nh� l� 頲 m閠 m蕋 mi. H祅h ng l莕 n祔  l祄 suy gi秏 th鵦 l鵦 t輈h l騳  nhi襲 n╩ c馻 Nh蕋 ph萴 阯g, t鎛 thng nguy猲 kh�.",
	}

	if GetTask(TASK_GET_AWARD) == 1 then
		task_021_01_0_4()
		return 0;
	end

	TalkEx("task_021_01_0_1",strTalk);

end

--续对话
function task_021_01_0_1()

local strTalk = {
	"Nh蕋 ph萴 阯g c� nhi襲 nh﹏ t礽, l筰 th猰 cao th� s� m閠 T﹜ H� l� Th竎 B箃 Ho籲g , s鴆 m筺h kh玭g lng 頲.",
	"Ta kh玭g mu鑞 l祄 m蕋 uy phong c馻 m譶h, vi謈  n nc n祔. C遪 Th竎 B箃 Ho籲g  t� cho r籲g c� L� Nguy猲 Kh竛h i nh﹏ n﹏g  th� coi nh� nhi謒 v�. Ta c� nghe Th竎 B箃 Ho籲g  mua chu閏 T� M� Minh Phong kh玭g th祅h, nh璶g l筰 b� T� M� Minh Phong d飊g t� y猽 m� ho芻, mu鑞 ph秐 b閕 l筰 Nh蕋 ph萴 阯g. L� Nguy猲 Kh竛h i nh﹏   � n chuy謓 n祔. Th竎 B箃 Ho籲g  l莕 n祔 l� t� t筼 nghi謙.",
	"C� chuy謓 n祔 sao? Th竎 B箃 Ho籲g  nh薾 l謓h mua chu閏 T� M� Minh Phong, sao l筰 b� h緉 x骾 gi鬰 r錳?",
	}

	TalkEx("task_021_01_0_2",strTalk);

end

--续对话
function task_021_01_0_2()

local strTalk = {
	"Ta c騨g kh玭g r� n鱝. T鉳 l筰 l� Th竎 B箃 Ho籲g   c� � ph秐 b閕 Nh蕋 Ph萴 阯g n猲 t閕 kh玭g th� tha. Ngi h穣 甧m Thu鑓 dc nh﹏ cho h緉 u鑞g.",
	"Ta 甶 t譵 Th竎 B箃 Ho籲g y.",
	"(Thu鑓 dc nh﹏ n祔 kh玭g c� t竎 d鬾g, quan h� c馻 Th竎 B箃 ti襫 b鑙 v� Nh蕋 Ph萴 阯g  n h錳 gay c蕁. N誹 Xa Lu﹏ B� Vng ph竔 ngi n C� Dng ng 甶襲 tra s� l� th� th﹏ ph薾 gi竛 甶謕 c馻 ta s� b� l�. Hay l� 甶 甶襲 tra xem xu hng hi謓 t筰 c馻 Nh蕋 Ph萴 阯g.)",
	}

	--TalkEx("task_021_01_0_3",strTalk);
	TalkEx("task_021_01_0_4",strTalk);
end

--发奖励
function task_021_01_0_3()

	give_wp_award(49);

end

--成功领取奖励后执行
function task_021_01_0_4()

	DelItem(2,0,754,1);--删去娃娃令牌
	AddItem(2,0,731,1,1);--得到药人药
	SetTask(TASK_XB_ID_01,57);
	GivePlayerAward("Award_XB_49","Easy");
	GivePlayerExp(SkeyXibei,"jisha")
	TaskTip("T譵 Th竎 B箃 Ho籲g, t譵 c竎h che gi蕌 th﹏ ph薾 gi竛 甶謕  d� la th猰 tin t鴆 c馻 Nh蕋 Ph萴 阯g.");
	Msg2Player("T譵 Th竎 B箃 Ho籲g, t譵 c竎h che gi蕌 th﹏ ph薾 gi竛 甶謕  d� la th猰 tin t鴆 c馻 Nh蕋 Ph萴 阯g.");

end;

--未与拓拔弘对话
function task_021_01_1()

local strTalk = {
	"Th竎 B箃 Ho籲g   c� � ph秐 b閕 Nh蕋 Ph萴 阯g n猲 t閕 kh玭g th� tha. Ngi h穣 甧m Thu鑓 dc nh﹏ cho h緉 u鑞g.",
	}

	TalkEx("",strTalk);

end

--与拓拔弘对话
function task_021_02_0()

local strTalk = {
	"Th� ra l� ngi, Xa Lu﹏ B� Vng sai ngi n  thu ph鬰 ta, ti誧 l� ta kh玭g th� c飊g ngi nh m閠 tr薾 cho .",
	"Trong Nh蕋 Ph萴 阯g ch� c� ti襫 b鑙 l� ng k輓h, sao ta l筰 c� th訁",
	"� ta  quy誸 ngi ch� nhi襲 l阨. Ta v� T� M� Minh Phong quy誸 u 3 ng祔 3 m tr猲 nh Hoa S琻 t�   th鴆 t豱h. Ta t鮪g ngh� r籲g gia nh藀 Nh蕋 Ph萴 阯g s� g苝 頲 cao th�  頲 th醓 l遪g.",
	"Ch糿g ph秈 Th竎 B箃 ti襫 b鑙  n鉯, Nh蕋 Ph萴 Л阯g  gi髉 ngi t譵 頲 r蕋 nhi襲 cao th� hay sao?",
	"с ch� l� c竔 c�  b祅h trng th� l鵦 c馻 Nh蕋 Л阯g th玦. B譶h sinh ta lu玭 k輓h tr鋘g nh鱪g ngi c� ch� h鋍 v�, c遪 Nh蕋 Ph萴 Л阯g ch� mu鑞 c� 頲 v� l鵦 c馻 h�, sau khi chi猽 m� v祇 Л阯g th� giao cho c竎 nhi謒 v� 竚 s竧, ho芻 x骾 gi鬰 l玦 k衞, ho芻 ph� ho筰, ch� to祅 c竎 h祅h ng b鴆 h筰 c 竎. Ta c秏 th蕐 t閕 l鏸 v�  k衞 nh鱪g cao th� v� l﹎ n祔 v祇 th� gi韎 甧n t鑙 c馻 Nh蕋 Ph萴 Л阯g.",
	}

	TalkEx("task_021_02_0_1",strTalk);

end

--续对话
function task_021_02_0_1()

local strTalk = {
	"Th竎 B箃 ti襫 b鑙 xin ng t� tr竎h m譶h, m鋓 vi謈 u do Nh蕋 Ph萴 Л阯g�",
	"Trong s� c竎 cao th� c騨g kh玭g 輙 ngi c� th� tr� th祅h tri k� nh� T� M� Minh Phong, nh璶g u ph秐 b閕 ho芻 b� tr� kh�. M韎 y L� Nguy猲 Kh竛h  t韎 t譵 ta, mu鑞 ta th玦 u v韎 T� M� Minh Phong, b雐 h緉  kh玭g c遪 nh蒼 n筰 頲 n鱝. T� M� Minh Phong  kh玭g c遪 頒 Nh蕋 Ph萴 Л阯g ch蕄 nh薾, n誹 c� T� M� Minh Phong c騨g b� h筰, th� thi猲 h� c遪 ai hi觰 頲 Th竎 B箃 Ho籲g? M鬰 ch ban u c馻 ta  b� l謈h hng, L� Nguy猲 Kh竛h c騨g kh玭g c遪 v� n� 琻 x璦, ta h� t蕋 ph秈 bi課 m譶h th祅h con c� trong tay k� kh竎? Ta  n鉯 h誸 l阨, 頲 ch誸 di tay ngi c騨g l� m閠 s� may m緉, ra tay 甶.",
	"Xem ra Th竎 B箃 ti襫 b鑙  h� quy誸 t﹎, v藋 th� t鑤 qu�. T� ng祔 k誸 giao v韎 ti襫 b鑙 n nay, ta u th蕐 ti誧 cho ngi, m閠 n琲 x蕌 xa 甧n t鑙 nh� Nh蕋 Ph萴 Л阯g l祄 sao x鴑g ng v韎 m閠 ng anh h祇 nh� th�? Nh璶g gi� th� ta  hi觰 r� ng鋘 ng祅h. Ti襫 b鑙 y猲 t﹎, ta kh玭g c� � h筰 ngi u, h琻 n鱝 dc nh﹏ dc n祔 l� do ta phng thu鑓 gi�  t筼 ra.",
	"...Ch� tr竎h g莕 y Nh蕋 Ph萴 Л阯g lu玭 g苝 tr� ng筰, ra u do <sex> c�. Ta kh﹎ ph鬰 t礽 tr� v� d騨g kh� c馻 ngi, ta tng ch鮪g  bu玭g xu玦 kh玭g ng� l筰 g苝 頲 m閠 tri k� nh� ngi.",
	"Sao ti襫 b鑙 l筰 n鉯 v藋? V誸 thng c馻 ti襫 b鑙 sau v礽 ng祔 s� kh醝, r髏 kh醝 Nh蕋 Ph萴 阯g th� th藅 l� ti誧.",
	}

	TalkEx("task_021_02_0_2",strTalk);

end

--续对话
function task_021_02_0_2()

local strTalk = {
	"Ngi c� 甶襲 kh玭g bi誸 r錳, kh玭g ai ph秐 b閕 Nh蕋 Ph萴 阯g m� c� th� s鑞g s鉻, ch髇g l藀 n猲 Ng� h祅h s� l�  ti猽 di謙 ph秐 . Chuy謓 ta k誸 ngh躠 v韎 T� M� Minh Phong  b� L� Nguy猲 Kh竛h bi誸 頲, h緉  ra l謓h l蕐 m筺g c馻 ta, l莕 n祔 ta ch誸 ch綾 r錳.",
	"Ng� h祅h tr薾 l� g� m� v韎 s鴆 c馻 ti襫 b鑙 c騨g kh玭g ph� 頲?",
	"Ng� h祅h tr薾 chuy猲  thanh l� m玭 h� sao c� th� d� d祅g ph� 頲? D� ta c� 甶 hay kh玭g c騨g ph秈 ch辵 ch誸. Ngi ph秈 c萵 th薾 kh玭g  l� th﹏ ph薾 n誹 kh玭g ch髇g s� i ph� ngi.",
	"Ti襫 b鑙, tr阨 kh玭g tuy謙 阯g s鑞g c馻 ngi, Ng� h祅h tr薾 n祔 s韒 mu閚 ta c騨g ph秈 i di謓, chi b籲g b﹜ gi� 甶 ti猽 di謙 n�  ti襫 b鑙 c� th� h誸 l遪g v韎 v� thu藅, th� kh玭g t鑤 sao?",
	"Ng� h祅h tr薾 kh玭g th� ph� b雐 s鴆 c馻 1 ngi nh璶g ngi c� th� t譵 b筺 ng h祅h. Ng� h祅h tr薾 � trong sa m筩 khi th蕐 L謓h b礽 c馻 ta th� Ng� h祅h tr薾 s� s� d蒼 ngi v祇 trong Ng� h祅h tr薾, trong  c� 5 ngi, ngi ph秈 c萵 th薾. Ngi nh蕋 nh ph秈 gi� m筺g  tr� v� u v韎 ta 1 tr薾.",
	"Ti襫 b鑙  d苙 sao d竚 kh玭g nghe?",
	}

	TalkEx("",strTalk);
	DelItem(2,0,731,1);--删去药人药
	SetTask(TASK_XB_ID_01,58);
	AddItem(2,0,755,1,1);--一品拓拔令
	TaskTip("дn m� cung sa m筩 t譵 Ng� h祅h tr薾 s� xu蕋 tr譶h l謓h b礽  d蒼 Ng� h祅h s� ra.");
	Msg2Player("дn m� cung sa m筩 t譵 Ng� h祅h tr薾 s� xu蕋 tr譶h l謓h b礽  d蒼 Ng� h祅h s� ra.");
	GivePlayerAward("Award_XB_50","Easy");
	GivePlayerExp(SkeyXibei,"panzhe")
end

--未杀死五行使对话
function task_021_02_1()

local strTalk = {
	"Ng� h祅h tr薾 kh玭g th� ph� b雐 s鴆 c馻 1 ngi nh璶g ngi c� th� t譵 b筺 ng h祅h. Ng� h祅h tr薾 � trong sa m筩 khi th蕐 L謓h b礽 c馻 ta th� Ng� h祅h tr薾 s� s� d蒼 ngi v祇 trong Ng� h祅h tr薾, trong  c� 5 ngi, ngi ph秈 c萵 th薾. Ngi nh蕋 nh ph秈 gi� m筺g  tr� v� u v韎 ta 1 tr薾.",
	}

	TalkEx("",strTalk);

	--补发拓拔令任务物品
	if GetItemCount(2,0,755) < 1 then
		AddItem(2,0,755,1,1);--一品拓拔令
		TaskTip("дn m� cung sa m筩 t譵 Ng� h祅h tr薾 s� xu蕋 tr譶h l謓h b礽  d蒼 Ng� h祅h s� ra.");
		Msg2Player("дn m� cung sa m筩 t譵 Ng� h祅h tr薾 s� xu蕋 tr譶h l謓h b礽  d蒼 Ng� h祅h s� ra.");
	end

end

--已经领取任务但还未取得拓拔令对话
function task_021_03_0()

local strTalk = {};
local nMapDataIndex = random(1,getn(WuXingShi_MapData));
local xWPos,yWPos,xPos,yPos = WuXingShi_MapData[nMapDataIndex][1],WuXingShi_MapData[nMapDataIndex][2],WuXingShi_MapData[nMapDataIndex][3],WuXingShi_MapData[nMapDataIndex][4]
local nNpcIndex1,nNpcIndex2,nNpcIndex3,nNpcIndex4,nNpcIndex5 = 0,0,0,0,0;

	--玩家若任务失败需要过30分钟才能重新刷出五行使
	if GetTime()-GetTask(CREAT_YAOWANG_TIME)	>= 1800 then

		strTalk = {
			"Ngi l� ai?",
			"Ta l� ngi khi猽 chi課, th� c騨g kh玭g nh薾 ra sao?",
			"Qu� l� gan d�!",
			}

		DelItem(2,0,755,1);--删除一品拓拔令
		SetTask(CREAT_WUXINGSHI_TIME,GetTime());--记录五行使刷新时间
		nNpcIndex1 = CreateNpc("Ng� H祅h S� Kim","Ng� H祅h S� Kim",506,xWPos,yWPos,-1,1,1,70);
		nNpcIndex2 = CreateNpc("Ng� H祅h S� M閏","Ng� H祅h S� M閏",506,xWPos,yWPos,-1,1,1,70);
		nNpcIndex3 = CreateNpc("Ng� H祅h S� Th駓","Ng� H祅h S� Th駓",506,xWPos,yWPos,-1,1,1,70);
		nNpcIndex4 = CreateNpc("Ng� H祅h S� H醓","Ng� H祅h S� H醓",506,xWPos,yWPos,-1,1,1,70);
		nNpcIndex5 = CreateNpc("Ng� H祅h S� Th�","Ng� H祅h S� Th�",506,xWPos,yWPos,-1,1,1,70);
		SetNpcScript(nNpcIndex1,"\\script\\西北区\\沙漠迷宫\\npc\\五行使金.lua");
		SetNpcScript(nNpcIndex2,"\\script\\西北区\\沙漠迷宫\\npc\\五行使木.lua");
		SetNpcScript(nNpcIndex3,"\\script\\西北区\\沙漠迷宫\\npc\\五行使水.lua");
		SetNpcScript(nNpcIndex4,"\\script\\西北区\\沙漠迷宫\\npc\\五行使火.lua");
		SetNpcScript(nNpcIndex5,"\\script\\西北区\\沙漠迷宫\\npc\\五行使土.lua");
		SetNpcLifeTime(nNpcIndex1,1500);
		SetNpcLifeTime(nNpcIndex2,1500);
		SetNpcLifeTime(nNpcIndex3,1500);
		SetNpcLifeTime(nNpcIndex4,1500);
		SetNpcLifeTime(nNpcIndex5,1500);

		Msg2Player("Ng� h祅h s� xu蕋 hi謓 �  "..xPos..", "..yPos.." , h穣 mau 甶 ti猽 di謙 h緉.")
		TaskTip("Ng� h祅h s� xu蕋 hi謓 �  "..xPos..", "..yPos.." , h穣 mau 甶 ti猽 di謙 h緉.");

	else

		strTalk = {
			"�",
			"Th阨 gian Ng� h祅h s� xu蕋 hi謓 c竎h nhau 30 ph髏, h穣 i ch髏 甶!"
			}

	end

	TalkEx("",strTalk);

end

--已经领取任务但还未取得拓拔令对话
function task_021_03_1()

local strTalk = {
	"�",
	"�",
	};

	TalkEx("",strTalk);

end

--已经杀死五行使，关卡接口开启
function task_021_03_2()

local strTalk = {
	"V� c玭g c馻 c竎 h� qu� l� tuy謙 v阨.",
	};

	TalkEx("",strTalk);

end


--已经打败五行使与拓拔弘对话
function task_021_04_0()

local strTalk = {
	"G苝 <sex> quay v�, bi誸 ngi  ph� 頲 Ng� h祅h tr薾, Ng� H祅h S� kh玭g ph秈 l� i th� c馻 ngi, ta r蕋 mu鑞 頲 giao u v韎 ngi. Ngi  c鴘 m筺g Th竎 B箃 Ho籲g, 琻 n祔 kh玭g bi誸 ph秈 tr� th� n祇.",
	"Ti襫 b鑙  coi ta l� ngi quen, kh玭g c莕 ph秈 c秏 琻. Khi n祇 ti襫 b鑙 Th竎 B箃 kh醗 l筰, s� n th豱h gi竜 B筺.",
	"Ha ha, ng kh竎h s竜. L﹗ r錳 ta kh玭g 頲 tho秈 m竔 nh� h玬 nay, kh玭g b� r祅g bu閏, l� o t� nhi猲, l� o v� h鋍, r蕋 t鑤. Nh璶g T﹜ H� Ph竝 Vng s緋 n sa m筩, l莕 n祔 ch綾 c� chuy謓, ngi ph秈 th薾 tr鋘g.",
	}

	TalkEx("task_021_04_0_1",strTalk);

end

--续对话
function task_021_04_0_1()

local strTalk = {
	"鮩. Ti襫 b鑙 c� tin c馻 Nh蕋 Ph萴 阯g g莕 y kh玭g?",
	"L﹗ nay ta c秏 th蕐 Nh蕋 Ph萴 阯g kh玭g c遪 tin ta n鱝, nhi襲 b� m藅 產ng 頲 gi� k輓. Chuy謓 B秐  S琻 H� X� T綾 ch璦 c� k誸 qu�, c遪 phng thu鑓 c馻 h� c騨g l� gi�. L莕 n祔 h祅h ng c馻 Ph鬾g Tng ph� mi ph莕 c� n t竚 ch輓 ph莕  x玦 h醤g b醤g kh玭g. N誹 Xa Lu﹏ B� Vng  bi誸 ngi l� gi竛 甶謕, e r籲g to祅 b� cao th� Trung Nguy猲 thu nh薾 l莕 n祔 c騨g ch糿g l祄 頲 g�. Nh� v藋 ti課g t╩ c馻 h緉 s� b� Nh蕋 Ph萴 阯g h� th蕄 v� s� b� ph秐 c玭g. Ngi ph秈 lo筰 b� 甶襲 n祔 trc khi h緉 ra tay.",
	"Xa Lu﹏ B� Vng l莕 n祔 ch綾 ch緉 s� ch辵 kh玭g 輙 tr竎h nhi謒 cho l莕 th蕋 tr竎h n祔. Kh玭g bi誸 c遪 c� ﹎ m璾 g� sau l璶g h緉 kh玭g, ta c騨g c秏 th蕐 Xa Lu﹏ B� Vng s� b竜 th� Nh蕋 Ph萴 阯g, th薽 ch� g﹜ h鋋 cho c� trung nguy猲.  t� ti襫 b鑙 Th竎 B箃  nh綾 nh�, Xa Lu﹏ B� Vng ch綾 s� tr� 頲 n� v� quay v�.",
	}

	TalkEx("",strTalk);
	DelItem(2,0,743,1);--删去拓拔令
	SetTask(TASK_XB_ID_01,60);
	TaskTip("K� l祄 n閕 鴑g ch綾  b� v筩h tr莕,  n l骳 quy誸 chi課 m閠 tr薾 v韎 Xa Lu﹏ B� Vng.");
	Msg2Player("K� l祄 n閕 鴑g ch綾  b� v筩h tr莕,  n l骳 quy誸 chi課 m閠 tr薾 v韎 Xa Lu﹏ B� Vng.");
	GivePlayerAward("Award_XB_51","Easy");
	GivePlayerExp(SkeyXibei,"wuxingzhen")
end

--未打败车轮霸王
function task_021_04_1()

local strTalk = {
	"H祅h ng l祅 n祔 c馻 Xa Lu﹏ B� Vng  t筰 Ph鬾g Tng ph� mi ph莕 c� n t竚 ch輓 ph莕  b� ngi ph� h醤g, ch綾 s� kh玭g d� ch辵 thua, ngi ph秈 ra tay trc khi h緉 h祅h ng.",
	}

	TalkEx("",strTalk);

end

---------------------------------- 西北区22分支1_13大漠幻象----------------------------------
--与车轮霸王对话并与其战斗
function task_022_01_0()

local nNpcIndex = GetTargetNpc();
local strTalk = {
	"Ha ha ha, ng l� thu鑓 gi�, ng l� mn dao gi誸 ngi. Ngi c遪 d竚 quay v� g苝 ta �? Ngi ch誸 甶.",
	}

	if nNpcIndex == nil then
		return
	end

	TalkEx("#task_022_01_1("..nNpcIndex..")",strTalk);
	TaskTip("H穣 quy誸 chi課 m閠 tr薾 v韎 Xa Lu﹏ B� Vng.");
	Msg2Player("H穣 quy誸 chi課 m閠 tr薾 v韎 Xa Lu﹏ B� Vng.");

end

--转换车轮霸王战斗状态
function task_022_01_1(nNpcIndex)

	ChangeNpcToFight(nNpcIndex);

end

--打败车轮霸王后与其对话
function task_022_01_2()

local strTalk = {
	"Ng祔 t祅 c馻 T鑞g tri襲 kh玭g c遪 xa, Trung nguy猲 s韒 mu閚 g� c騨g l� thi猲 h� c馻 T﹜ H�. Ha ha ha.",
	}

	TalkEx("",strTalk);

end



--汇报欧阳画沙漠幻象一事
function task_022_02_0()

local strTalk = {
	"Ti襫 b鑙, Nh蕋 Ph萴 阯g  bi誸 r� th﹏ ph薾 ta, th鵦 l鵦 c馻 Nh蕋 Ph萴 阯g g莕 nh�  ti猽 hao h誸. Xa Lu﹏ B� Vng c騨g b� ta nh b筰, nh璶g h緉 lu玭 mi謓g n鉯 c祅, n祇 l� 秓 gi竎 sa m筩 s緋 th玭 t輓h Чi T鑞g, Чi T鑞g s緋 di謙 vong.",
	"秓 gi竎 sa m筩? Ta ch璦 t鮪g nghe qua, nh璶g y l� 甶襲 nh鱪g nh� bu玭 甶 qua sa m筩 ho芻 ngi n sa m筩 t譵 b竨 v藅 n鉯. 秓 gi竎 l� chuy謓 c� th藅, nh璶g ngi l筰 n鉯 ch璦 t鮪g nghe n. Th﹏ ph薾 ngi  b� Nh蕋 Ph萴 阯g bi誸 r�, c� l� ngi 產ng g苝 nguy hi觤?",
	"Ng� h祅h s�, ngi b� Nh蕋 Ph萴 阯g truy s竧 c騨g  b� tr� kh�, ch綾 kh玭g qu� nguy hi觤. Nh璶g 秓 gi竎 sa m筩 dng nh� 萵 ch鴄 nhi襲 b� m藅. T﹜ H� Ph竝 Vng dng nh� 產ng thao t髇g ph輆 sau.",
	"Ngi r髏 lui ta th藅 y猲 t﹎. T﹜ H� Ph竝 Vng kh玭g th� coi thng, 秓 gi竎 sa m筩 l� th� v� h譶h, n誹 頲 T﹜ H� Ph竝 Vng d飊g, h藆 qu� s� kh� lng. H穣 甶 h醝 ngi c馻 C玭 L玭 ph竔, c� l� h� bi誸 頲 b� m藅.",
	"е T� C玭 L玭 c� l� bi誸 頲 b� m藅. H穣 h醝 玭g ta. Ta xin c竜 t�.",
	}

	SetTask(TASK_XB_ID_01,62);
	TalkEx("",strTalk);
	TaskTip("H穣 n C玭 L玭 h醝 Di謕 T� Thu v� 秓 gi竎 sa m筩.");
	Msg2Player("H穣 n C玭 L玭 h醝 Di謕 T� Thu v� 秓 gi竎 sa m筩.");
	GivePlayerAward("Award_XB_52","Easy");
	GivePlayerExp(SkeyXibei,"poxiangzhifa")
end

--还未询问叶子秋关于沙漠幻象一事
function task_022_02_1()

local strTalk = {
	"Ngi c馻 C玭 L玭 ph竔 c� l� bi誸 b� m藅 c馻 秓 gi竎 sa m筩, ngi h穣 n  h醝.",
	"е T� C玭 L玭 c� l� bi誸 頲 b� m藅. H穣 h醝 玭g ta. Ta xin c竜 t�.",
	}

	TalkEx("",strTalk);

end

---------------------------------- 西北区23分支1_14黄沙落幕----------------------------------
--询问叶子秋关于沙漠幻象的事情
function task_023_01_0()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"\'B� t竛h c� n筺, i o b蕋 h璶g, i ngh躠 quy 萵, th� h誸 l遪g tu o thu藅, tr� � u�, gi竛g y猽 ma, thi猲 h� th竔 b譶h\'. Ngi c� chuy謓 chi c莕 g苝 ta?",
			"Di謕 thi誹 hi謕 v蒼 sung s鴆 nh� x璦. C� 甶襲 n祔 mu鑞 h醝, thi誹 hi謕 c� bi誸 trong sa m筩 c� 秓 gi竎 kh玭g? Kh玭g bi誸 秓 gi竎 sa m筩 n祔 l� g�?",
			"Ngi n鉯 n Ch蕁 l莡 trong sa m筩 �? Nh璶g ngu錸 g鑓 kh玭g r� r祅g, c騨g kh玭g c� s鴆 m筺h. Nh璶g n誹 b� kh鑞g ch�, s� g鋓 頲 Ch蕁 trong truy襫 thuy誸 xa x璦. 秓 gi竎 m� Ch蕁 t筼 ra c� th� bi課 ra nhi襲 h譶h d筺g kh竎 nhau, c� th� th玭 t輓h tr阨 t. N誹 l莕 n祔 n� xu蕋 hi謓, s� kh� thu ph鬰, v� h譶h d筺g th藅 c馻 ch髇g kh� t譵, c� th� g﹜ i h鋋.",
			"Qu� ng Xa Lu﹏ B� Vng  kh玭g phao tin gi藅 g﹏. Di謕 thi誹 hi謕, Nh蕋 Ph萴 阯g  ph竔 T﹜ H� Ph竝 Vng 甶 kh鑞g ch� 秓 gi竎, c遪 khoe khoang mu鑞 d飊g 秓 gi竎 th玭 t輓h Trung Nguy猲, g﹜ h鋋 chi課 tranh.",
			}
	else
		strTalk = {
			"\'B� t竛h c� n筺, i o b蕋 h璶g, i ngh躠 quy 萵, th� h誸 l遪g tu o thu藅, tr� � u�, gi竛g y猽 ma, thi猲 h� 頲 th竔 b譶h. \' <sex> c� kh醗 kh玭g?",
			"Di謕 thi誹 hi謕 v蒼 sung s鴆 nh� x璦. C� 甶襲 n祔 mu鑞 h醝, thi誹 hi謕 c� bi誸 chuy謓 trong sa m筩 c� 祇 gi竎 kh玭g? Kh玭g bi誸 秓 gi竎 sa m筩 n祔 l� g�?",
			" <sex> n鉯 n Ch蕁 l莡 trong sa m筩 �? N� c� ngu錸 g鑓 kh玭g r� r祅g, c騨g kh玭g c� s鴆 m筺h. Nh璶g n誹 b� kh鑞g ch�, s� g鋓 頲 Ch蕁 trong truy襫 thuy誸 xa x璦. 秓 gi竎 m� Ch蕁 t筼 ra c� th� bi課 th祅h nhi襲 h譶h d筺g kh竎 nhau, c� th� th玭 t輓h tr阨 t. N誹 n� xu蕋 hi謓, s� kh� thu ph鬰, v� h譶h d筺g th藅 c馻 n� kh� t譵, c� th� g﹜ i h鋋.",
			"Qu� ng Xa Lu﹏ B� Vng  kh玭g phao tin gi藅 g﹏. Di謕 thi誹 hi謕, Nh蕋 Ph萴 阯g  ph竔 T﹜ H� Ph竝 Vng 甶 kh鑞g ch� 秓 gi竎, c遪 khoe khoang mu鑞 d飊g 秓 gi竎 th玭 t輓h Trung Nguy猲, g﹜ h鋋 chi課 tranh.",
			}
	end

	TalkEx("task_023_01_0_1",strTalk);

end

--续对话
function task_023_01_0_1()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"秓 gi竎 sa m筩 tuy m筺h, nh璶g kh玭g th� th玭 t輓h 頲 c� tr阨 t n祔. Nh璶g th玭 t輓h c� sa m筩, m� ho芻 l遪g ngi, u c qu﹏ i qu� l� d� s鴆. Mu鑞 i ph� v韎 Ch蕁  b� kh鑞g ch�, ph秈 t譵 頲 nguy猲 h譶h c馻 n�. Nguy猲 h譶h c馻 Ch蕁 kh玭g hi謓 ra s� kh� i ph�, tr� phi t譵 頲 ph竝 kh� phong 蕁 c馻 ngi kh鑞g ch� Ch蕁.",
			"Ph竝 kh� phong 蕁 n祔 ch綾 l� c馻 T﹜ H� Ph竝 Vng. Ph秈 i ph� th� n祇?",
			"秓 gi竎 sa m筩 kh玭g d� i ph�, n誹 c� Ph竝 kh� phong 蕁, 秓 gi竎 s� bi課 ra nhi襲 h譶h d筺g, n誹 ngi nh b筰, n� s� hi謓 hi猲 nguy猲 h譶h Ch蕁, mu鑞 nh b筰 Ch蕁, ph秈 s� d鬾g Phong y猽 th竝 n祔 ni謒 L阨 nguy襫棗 thu ph鬰 n�, n誹 kh玭g n� s� l蒼 tr鑞 m蕋 t╩. Mu鑞 i ph� v韎 n� c騨g kh玭g c遪 c� h閕 n鱝.",
			"D竚 h醝 L阨 nguy襫 phong 蕁 n祔 l� g� v藋?",
			}
	else
		strTalk = {
			"秓 gi竎 sa m筩 tuy m筺h, nh璶g kh玭g th� th玭 t輓h 頲 c� tr阨 t n祔. Nh璶g th玭 t輓h c� sa m筩, m� ho芻 l遪g ngi, u c qu﹏ i qu� l� d� s鴆. Mu鑞 i ph� v韎 Ch蕁  b� kh鑞g ch�, ph秈 t譵 頲 nguy猲 h譶h c馻 n�. Nguy猲 h譶h c馻 Ch蕁 kh玭g hi謓 ra s� kh� i ph�, tr� phi t譵 頲 ph竝 kh� phong 蕁 c馻 ngi kh鑞g ch� Ch蕁.",
			"Ph竝 kh� phong 蕁 n祔 ch綾 l� c馻 T﹜ H� Ph竝 Vng. Ph秈 i ph� th� n祇?",
			"秓 gi竎 sa m筩 b� kh鑞g ch� kh玭g d� i ph�, n誹 c� Ph竝 kh� phong 蕁, 秓 gi竎 s� bi課 th祅h nhi襲 h譶h d筺g, n誹 ngi nh b筰, n� s� hi謓 hi猲 nguy猲 h譶h Ch蕁, nh b筰 Ch蕁, ph秈 s� d鬾g phong y猽 th竝 n祔 ni謒 l阨 nguy襫棗 thu ph鬰 n�, n誹 kh玭g n� s� l蒼 tr鑞 m蕋 t╩. Mu鑞 i ph� v韎 n� c騨g kh玭g c遪 c� h閕 n鱝.",
			"D竚 h醝 L阨 nguy襫 phong 蕁 n祔 l� g� v藋?",
			}
	end

	TalkEx("task_023_01_0_2",strTalk);

end

--续对话
function task_023_01_0_2()

local nCruseIndex = random(1,getn(HUANXIANG_CURSE));
local strTalk = {}

	SetTask(HUANGXIANG_CURSE_ID,nCruseIndex);

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ngi ph秈 nh� "..HUANXIANG_CURSE[nCruseIndex].." , y l� l阨 nguy襫 phong 蕁, kh玭g 頲 nh� sai, n誹 kh玭g s� ph� c玭g nh鋍 s鴆!",
			"Th� ra l� v藋, 秓 gi竎 sa m筩 l筰 kh� i ph� nh� v藋, kh玭g bi誸 秓 gi竎 thng xu蕋 hi謓 n琲 n祇?",
			"Cu鑙 sa m筩 thng c� 秓 gi竎 xu蕋 hi謓, nh璶g kh玭g c� hng  t譵 Sa m筩, kh� nh薾 ra 阯g  甶 n cu鑙, nh璶g ta t譶h c� quen v韎 B筩h Thi猲 Th祅h, ngi t譵 b竨 v藅 � sa m筩, 玭g ta n╩ n祇 c騨g n sa m筩, bi誸 r� sa m筩 nh� l遪g b祅 tay, ngi h穣 甶 t譵 玭g ta, 玭g ta c� th� s� d蒼 ngi n cu鑙 sa m筩.",
			"Th� ra l� v藋, 產 t� i s� huynh. Ta s� 甶 t譵 ph竝 kh� phong 蕁, kh玭g  cho 秓 gi竎 sa m筩 h筰 i.",
			}
	else
		strTalk = {
			"Ngi ph秈 nh� "..HUANXIANG_CURSE[nCruseIndex].." , y l� l阨 nguy襫 phong 蕁, kh玭g 頲 nh� sai, n誹 kh玭g s� ph� c玭g nh鋍 s鴆!",
			"Th� ra l� v藋, 秓 gi竎 sa m筩 l筰 kh� i ph� nh� v藋, kh玭g bi誸 秓 gi竎 thng xu蕋 hi謓 n琲 n祇?",
			"Cu鑙 sa m筩 thng c� 秓 gi竎 xu蕋 hi謓, nh璶g kh玭g c� hng 甶 n Sa m筩, kh� nh薾 ra 阯g  甶 n cu鑙, nh璶g ta t譶h c� quen v韎 B筩h Thi猲 Th祅h, ngi t譵 b竨 v藅 � sa m筩, 玭g ta n╩ n祇 c騨g n sa m筩, bi誸 r� sa m筩 nh� l遪g b祅 tay, ngi h穣 甶 t譵 玭g ta, 玭g ta s� d蒼 ngi n cu鑙 sa m筩.",
			"Th� ra l� v藋, 產 t� Di謕 thi誹 hi謕  cho ta bi誸 nhi襲 tin c� 輈h nh� v藋. Ta s� 甶 t譵 ph竝 kh� phong 蕁, kh玭g  cho 秓 gi竎 sa m筩 h筰 i.",
			}
	end

	TalkEx("",strTalk);
	AddItem(2,0,732,1,1);--得到封妖塔
	SetTask(TASK_XB_ID_01,63);
	TaskTip("дn Dc Vng C鑓 nh b筰 T﹜ H� Ph竝 Vng at ph竝 kh� phong 蕁.");
	Msg2Player("дn Dc Vng C鑓 nh b筰 T﹜ H� Ph竝 Vng at ph竝 kh� phong 蕁.");

end

--还未打败西夏法王
function task_023_01_1()

local strTalk = {}
local nCruseIndex = GetTask(HUANGXIANG_CURSE_ID);

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Mu鑞 i ph� v韎 秓 gi竎 sa m筩 ph秈 t譵 頲 Ph竝 kh� phong 蕁, c遪 ph秈 t譵 B筩h Thi猲 Th祅h, ngi t譵 b竨 v藅 � sa m筩 d蒼 ngi n cu鑙 sa m筩, m韎 th蕐 頲 秓 gi竎.",
			"Ngi ph秈 nh� "..HUANXIANG_CURSE[nCruseIndex].." , y l� l阨 nguy襫 phong 蕁, kh玭g 頲 nh� sai, n誹 kh玭g s� ph� c玭g nh鋍 s鴆!",
			}
	else
		strTalk = {
			"Mu鑞 i ph� v韎 秓 gi竎 sa m筩 ph秈 t譵 頲 Ph竝 kh� phong 蕁, c遪 ph秈 t譵 B筩h Thi猲 Th祅h, ngi t譵 b竨 v藅 � sa m筩 d蒼 ngi n cu鑙 sa m筩, m韎 th蕐 頲 秓 gi竎.",
			"Ngi ph秈 nh� "..HUANXIANG_CURSE[nCruseIndex].." , y l� l阨 nguy襫 phong 蕁, kh玭g 頲 nh� sai, n誹 kh玭g s� ph� c玭g nh鋍 s鴆!",
			}
	end

	--补领锁妖塔
	if GetItemCount(2,0,732) < 1 then
		AddItem(2,0,732,1,1);--得到封妖塔
	end

	TalkEx("",strTalk);

end

--还未打败幻象之前与叶子秋对话补领封妖塔
function task_023_01_2()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Mu鑞 i ph� v韎 秓 gi竎 sa m筩 ph秈 t譵 頲 Ph竝 kh� phong 蕁, c遪 ph秈 t譵 B筩h Thi猲 Th祅h, ngi t譵 b竨 v藅 � sa m筩 d蒼 ngi n cu鑙 sa m筩, m韎 th蕐 頲 秓 gi竎.",
			}
	else
		strTalk = {
			"Mu鑞 i ph� v韎 秓 gi竎 sa m筩 ph秈 t譵 頲 Ph竝 kh� phong 蕁, c遪 ph秈 t譵 B筩h Thi猲 Th祅h, ngi t譵 b竨 v藅 � sa m筩 d蒼 ngi n cu鑙 sa m筩, m韎 th蕐 頲 秓 gi竎.",
			}
	end

	--补领锁妖塔
	if GetItemCount(2,0,732) < 1 then
		AddItem(2,0,732,1,1);--得到封妖塔
	end

	TalkEx("",strTalk);

end

--杀死法王后与白天成对话刷出幻象
function task_023_02_0()

local strTalk = {};

	--玩家若任务失败需要过30分钟才能重新刷出五行使
	if GetTime()-GetTask(CREAT_HUANGXIANG_TIME)	>= 1800 then

		strTalk = {
			"V� n祔 l� B筩h Thi猲 Th祅h �? Nghe n鉯 B筩h ti猲 sinh thng t譵 b秓 v藅 � sa m筩, ch綾 bi誸 r� hng sa m筩. Kh玭g bi誸 B筩h ti猲 sinh c� th� a ta n cu鑙 sa m筩 頲 kh玭g?",
			"B筩h Thi猲 Th祅h Cu鑙 sa m筩 ch糿g ph秈 l� n琲 th� v� g�, ta khuy猲 <sex> ng 甶 chuy課 n祔. Cu鑙 sa m筩 kh� nh薾 ra hng 甶, h琻 n鱝 nguy hi觤 lu玭 r譶h r藀, l筰 c遪 c� 秓 gi竎 m� ho芻 l遪g ngi, n誹 kh玭g l� chuy謓 l韓 th� n猲 tr竛h. H琻 n鱝 ta ch� t譵 nh鱪g th� c� gi� tr� m� th玦, cu鑙 sa m筩 ch糿g c� g� hay, 甶 l祄 g� c� ch�?",
			"Nh璶g B筩h ti猲 sinh, 秓 gi竎 cu鑙 sa m筩  b� nh th鴆, n誹 kh玭g s韒 i ph�, ch� e s� g﹜ h鋋 cho d﹏, hu鑞g chi sau n祔 n cu鑙 sa m筩 t譵 b竨 v藅 ch糿g l� c竎 h� c騨g mu鑞 khi誴 s� n鱝 sao?",
			"秓 gi竎 sa m筩 l祄 ngi ta b� thng �? Trc kia 甶 qua , ta kh玭g th蕐 秓 gi竎 l祄 ngi ta b� thng? Nh璶g 秓 gi竎 c� b� 萵 g�?",
			}
		TalkEx("task_023_02_0_1",strTalk);
	else

		strTalk = {
			"秓 gi竎 n祔 tho総 萵 tho総 hi謓, <sex> i ch髏 n鱝 h穣 n, l骳 n祔 ta c騨g kh玭g l祄 g� 頲.",
			}
		TalkEx("",strTalk);
	end
end

--续对话
function task_023_02_0_1()

local nMapDataIndex = random(1,getn(HuangXiang_MapData));
local xWPos,yWPos,xPos,yPos = HuangXiang_MapData[nMapDataIndex][1],HuangXiang_MapData[nMapDataIndex][2],HuangXiang_MapData[nMapDataIndex][3],HuangXiang_MapData[nMapDataIndex][4]
local nNpcIndex = 0;
local strTalk = {
	"ng v藋, k� c 竎 mu鑞 kh鑞g ch� 秓 gi竎, l莕 n祔 ta n cu鑙 sa m筩 l�  phong 蕁 秓 gi竎. Xem n祔, y l� Ph竝 kh� phong 蕁 d飊g  kh鑞g ch� 秓 gi竎, b筩h ti猲 sinh a ta 甶 頲 kh玭g?",
	"�? Ph竝 kh� n祔 l� m鉵  kh玭g t錳. V莥 甶, ta s� d蒼 ngi n cu鑙 sa m5c, nh璶g ngi ph秈 t苙g ph竝 kh� n祔 cho ta, th� n祇? ",
	"Ngi t譵 b竨 v藅 qu� nhi猲 u tham b竨 v藅, th玦, ph竝 khi n祔 d飊g  g鋓 nguy猲 h譶h c馻 Ch蕁, sau khi thu Ch蕁 v祇 phong y猽 th竝 c騨g h誸 t竎 d鬾g, t苙g cho 玭g ta c騨g kh玭g sao.)",
	"Л頲, n誹 B筩h ti猲 sinh th輈h v藅 n祔, i ta phong 蕁 秓 gi竎 xong, s� t苙g n� cho 玭g  c秏 t�.",
	"Ta nh� l莕 trc � "..xPos..", "..yPos.."  g苝 qua秓 gi竎, <sex> h穣 甶 ki觤 tra xem sao.",
	}

	TalkEx("",strTalk);
	SetTask(CREAT_HUANGXIANG_TIME,GetTime());--记录幻象刷新时间
	nNpcIndex = CreateNpc("Hoan Tng (Tng l躰h tng)","秓 gi竎 th鑞g l躰h",506,xWPos,yWPos,-1,1,1,70);
	SetNpcScript(nNpcIndex,"\\script\\西北区\\沙漠迷宫\\npc\\幻象统领.lua");
	SetNpcLifeTime(nNpcIndex,1800);
	Msg2Player("дn  "..xPos..", "..yPos.." , t譵 v� ti猽 di謙 秓 gi竎.")
	TaskTip("дn  "..xPos..", "..yPos.." , t譵 v� ti猽 di謙 秓 gi竎.");

end

--尚未达成打败幻象的条件
function task_023_02_1()

local strTalk = {
	"Зy l� sa m筩 ng s�, kh玭g th薾 tr鋘g s� m蕋 m筺g nh� ch琲.",
	};

	TalkEx("",strTalk);

end

--已经杀死幻象，关卡接口开启
function task_023_02_2()

local strTalk = {
	"C竎 h� c� b竨 v藅 qu� g� th�?",
	};

	TalkEx("",strTalk);

end

--已经封印幻象，将法器送给白天成
function task_023_03_0()

local strTalk = {
	"<sex> v� r錳 �? C� phong 蕁 秓 gi竎 sa m筩 kh玭g?",
	"Kh玭g sai, 秓 gi竎 n祔 qu� l� kh玭g d� i ph�, nh璶g sau n祔 甶 v祇 sa m筩 t譵 b竨 v藅 s� d� d祅g h琻. Зy l� ph竝 kh�, 產 t� B筩h ti猲 sinh  d蒼 阯g.",
	"<sex> ch� kh竎h kh�, ta m韎 l� ngi ph秈 產 t� ngi, sau n祔 n誹 mu鑞 n cu鑙 sa m筩 c� n t譵 ta, ta s� d蒼 阯g cho ngi.",
	}

	DelItem(2,0,733,1);--删去法器
	SetTask(TASK_XB_ID_01,66);
	TalkEx("",strTalk);
	TaskTip("Mang phong y猽 th竝 v� C玭 L玭 cho Di謕 T� Thu.");
	Msg2Player("Mang phong y猽 th竝 v� C玭 L玭 cho Di謕 T� Thu.");
	GivePlayerAward("Award_XB_54","Easy");
	GivePlayerExp(SkeyXibei,"fengyao")
end

--将封妖塔带给叶子秋
function task_023_04_0()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"th蕐 <sex> b譶h y猲 quay v�, nh璶g c� phong 蕁 秓 gi竎 sa m筩 頲 kh玭g?",
			"Nh� Di謕 thi誹 hi謕 ch� gi竜, n猲  phong 蕁 秓 gi竎 sa m筩 t筰 Phong y猽 th竝 n祔, nh� v藋, Ch蕁 c騨g kh玭g c遪 h筰 d﹏ 頲 n鱝.",
			"T鑤, ngi  l祄 m閠 vi謈 l韓 cho v� l﹎, i s� huynh th藅 t� h祇 v� ngi.",
			"Di謕 thi誹 hi謕 qu� l阨 r錳. H誸 l遪g v� v� l﹎, l� tr竎h nhi謒 c馻 ta. Ta c遪 ph秈 甶 th猰 chuy課 n鱝, n鉯 s� t譶h cho  Dng H鋋  ti襫 b鑙 bi誸. Xin c竜 t�.",
			}
	else
		strTalk = {
			"Th蕐 <sex> b譶h y猲 quay v�, nh璶g c� phong 蕁 秓 gi竎 sa m筩 頲 kh玭g?",
			"Nh� Di謕 thi誹 hi謕 ch� gi竜,  phong 蕁 秓 gi竎 sa m筩 t筰 Phong y猽 th竝 n祔, nh� v藋, Ch蕁 c騨g kh玭g c遪 h筰 d﹏ 頲 n鱝.",
			"T鑤, <sex> l筰 l祄 m閠 vi謈 l韓 cho v� l﹎, t筰 h� th藅 b竔 ph鬰.",
			"Di謕 thi誹 hi謕 qu� l阨 r錳. H誸 l遪g v� v� l﹎, l� tr竎h nhi謒 c馻 ta. Ta c遪 ph秈 甶 th猰 chuy課 n鱝, n鉯 s� t譶h cho  Dng H鋋  ti襫 b鑙 bi誸, sau n祔 s� v� th╩.",
			}
	end

	DelItem(2,0,732,1);--删去封妖塔
	SetTask(TASK_XB_ID_01,67);
	TalkEx("",strTalk);
	TaskTip("N鉯 cho  Dng H鋋 bi誸 chuy謓 phong 蕁 秓 gi竎.");
	Msg2Player("N鉯 cho  Dng H鋋 bi誸 chuy謓 phong 蕁 秓 gi竎.");

end

--还未汇报欧阳画
function task_023_04_1()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ngi v� d﹏ tr� h筰, th藅 khi課 i s� huynh b竔 ph鬰.",
			"Di謕 thi誹 hi謕 qu� l阨 r錳. H誸 l遪g v� v� l﹎, l� tr竎h nhi謒 c馻 ta. Ta c遪 ph秈 甶 th猰 chuy課 n鱝, n鉯 s� t譶h cho  Dng H鋋  ti襫 b鑙 bi誸. Xin c竜 t�."
			}
	else
		strTalk = {
			"<sex> v� d﹏ tr� h筰, th藅 khi課 t筰 h� b竔 ph鬰.",
			"Di謕 thi誹 hi謕 qu� l阨 r錳. H誸 l遪g v� v� l﹎, l� tr竎h nhi謒 c馻 ta. Ta c遪 ph秈 甶 th猰 chuy課 n鱝, n鉯 s� t譶h cho  Dng H鋋  ti襫 b鑙 bi誸, sau n祔 s� v� th╩.",
			}
	end

	TalkEx("",strTalk);

end

--将事情告知欧阳画
function task_023_05_0()

local strTalk = {
	" Dng ti襫 b鑙, 秓 gi竎 sa m筩 qu� nhi猲 l� chi猽 l頸 h筰 nh蕋 c馻 Nh蕋 Ph萴 阯g, may l�, ch髇g ta  phong 蕁 秓 gi竎 sa m筩 trc khi h緉 h祅h ng.",
	"T鑤, t鑤, nh鱪g g� v� l﹎ l祄 l莕 n祔 ng l� t筼 ph骳 cho thi猲 h�. Th鵦 l鵦 c馻 Nh蕋 Ph萴 阯g phen n祔 ch綾 s� b� nh b筰. Nh鱪g ngi vong m謓h t筰 Ph鬾g Tng ph� ch� e ch糿g 輈h g�; B秐 у S琻 H� X� T綾 c騨g s� t� ng m蕋 甶; k� ho筩h mu鑞 d飊g dc nh﹏ x﹎ ph筸 Чi T鑞g c騨g  tan th祅h m﹜ kh鉯, T﹜ H� ch綾 s� kh玭g d竚 ra giang h� m閠 th阨 gian. Nh璶g ta c騨g lo L� Nguy猲 Kh竛h s� kh玭g ch辵  y猲, e r籲g s� ph秐 c玭g, th� nh璶g, ta r蕋 y猲 t﹎, ngi nh cho Nh蕋 Ph萴 阯g th蕋 甶猲 b竧 o, ch髇g c騨g kh玭g d竚 b竜 th� ngi, Trng ca m玭 nh﹏ c馻 ta s� h誸 s鴆 b秓 v� <sex>. ",
	"N誹 Nh蕋 Ph萴 阯g n b竜 th�, ta c騨g kh玭g lo, ta s� qu猲 m譶h  tr� h筰 cho d﹏. Ta  k誸 頲 nhi襲 b筺 t鑤, cu鑙 c飊g ta  t譵 頲 ngi g髉 ta.  Dng ti襫 b鑙, 產 t�  ra k� s竎h.",
	}

	TalkEx("task_023_05_0_1",strTalk);

end

--续对话
function task_023_05_0_1()

local strTalk = {
	"Ha ha ha, b﹜ gi� nh� l筰 m鑙 lo c馻 ngi, m韎  ngi  c鴘 Чi T鑞g tho竧 kh醝 d莡 s玦 l鯽 b醤g.  n祔 th藅 kh� qu猲.  m璾 qu� k� c馻 Nh蕋 Ph萴 阯g tuy  b� ph�, Th藀 i kim cang c騨g  t鎛 th蕋 nghi猰 tr鋘g, b﹜ gi� ch� lo Nh蕋 Ph萴 阯g s� t� b� chi課 lc Thao Quang Dng H鑙, t蕁 c玭g t﹜ b綾 v� l﹎, ch� e l骳  <sex> v蒼 ph秈 n gi髉 .",
	"Зy l� tr竎h nhi謒 c馻 ta, kh玭g th� ch鑙 t�.",
	"Nh譶 th蕐 <sex> y nhi謙 huy誸 nh� v藋, ta th藅 vui m鮪g. Tuy Чi T鑞g s緋 di謙 vong, nh璶g l骳 n祇 c騨g tr祅 y hy v鋘g v祇 ngi. Ph錸 hoa l筩 m筩, chung h鱱 h錸g tr莕 tam thi猲, kh竚 ch髇g sinh th� gian, giai th� t譶h duy猲. <sex> v蕋 v� qu�.",
	}

	--TalkEx("task_023_05_0_2",strTalk);--关闭最终奖励兑换
	TalkEx("task_029_01_0",strTalk);
	SetTask(TASK_XB_ID_01,68);
	GivePlayerAward("Award_XB_55","Easy");
	GivePlayerExp(SkeyXibei,"qixia")
	AddItem(0,107,156,1,1);
	--删去一品堂称号
	for i=1,6 do
		RemoveTitle(60,i);
	end
	add_xb_title(7);--获得谍影奇侠称号
end

function task_023_05_0_2()

local strTalk = {
	"Nh譶 th蕐 <sex> y nhi謙 huy誸 nh� v藋, ta th藅 vui m鮪g. Tuy Чi T鑞g s緋 di謙 vong, nh璶g l骳 n祇 c騨g tr祅 y hy v鋘g v祇 ngi. Ph錸 hoa l筩 m筩, chung h鱱 h錸g tr莕 tam thi猲, kh竚 ch髇g sinh th� gian, giai th� t譶h duy猲. <sex> v蕋 v� qu�.",
	}

	TalkEx("",strTalk);
	AddTitle(60,7);--获得大宋英雄称号

end

------------------------------------------分支2待改---------------------------------------------------------------
---------------------------------- 西北区24分支2_1鬼门冤魂----------------------------------
--与欧阳画对话查探关于昆仑入世的事情
function task_024_01_0()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			" Dng ti襫 b鑙, ta  th﹎ nh藀 Nh蕋 Ph萴 阯g 頲 r錳. ng r錳, ta c遪 m閠 chuy謓 mu鑞 h醝.",
			"T鑤, t鑤, th﹎ nh藀 頲 v祇 Nh蕋 Ph萴 阯g c騨g l� bc 頲 bc u ti猲, kh� kh╪ ngi s緋 i m苩 kh玭g th� coi thng, n猲 th薾 tr鋘g, g苝 r綾 r鑙 c� n t譵 ta, ta s� c� g緉g gi髉 ngi. Chuy謓 g� n鉯 甶.",
			"Ti襫 b鑙 v蒼 nhi謙 t譶h nh� v藋, ta xin 產 t�. Ti襫 b鑙 l� kh竎h giang h�, l� ngi t鮪g tr秈, kh玭g bi誸 ti襫 b鑙 c� t鮪g nghe n T� M� Minh Phong? Ngi n祔 dng nh� l� cao th� v� l﹎.",
			"C� ph秈 ngi n鉯 n Ki誱 th莕 T� M� Minh Phong? Xem ra, T� M� Minh Phong th藅 n鎖 danh. 18 n╩ trc lu薾 ki誱 � Hoa S琻, nh Hoa S琻 t藀 trung c竎 cao th� trong thi猲 h�, l筰 n鉯 Nh蕋 Ni猲 Thanh ki誱 kh竎h d鋍 ngang Hoa S琻 nh� th莕, kh玭g ai ti誴 n鎖 20 chi猽 c馻 玭g ta. Nh� , danh ti課g 玭g vang kh緋 thi猲 h�. Ngi n祔 ch輓h l� T� M� Minh Phong.",
			"Th� ra l� nh﹏ v藅 v� l﹎ g﹜ ch蕁 ng nh� v藋, sao l筰 kh玭g nghe ti課g trong giang h�?",
			}
	else
		strTalk = {
			" Dng ti襫 b鑙, ta  th﹎ nh藀 Nh蕋 Ph萴 阯g 頲 r錳. ng r錳, ta c遪 m閠 chuy謓 mu鑞 h醝.",
			"T鑤, t鑤, th﹎ nh藀 頲 v祇 Nh蕋 Ph萴 阯g c騨g l� bc 頲 bc u ti猲, kh� kh╪ ngi s緋 i m苩 kh玭g th� coi thng, n猲 th薾 tr鋘g, g苝 r綾 r鑙 c� n t譵 ta, ta s� c� g緉g gi髉 ngi. Chuy謓 g� n鉯 甶.",
			"Ti襫 b鑙 v蒼 nhi謙 t譶h nh� v藋, ta xin 產 t�. Ti襫 b鑙 l� kh竎h giang h�, l� ngi t鮪g tr秈, kh玭g bi誸 ti襫 b鑙 c� t鮪g nghe n T� M� Minh Phong? Ngi n祔 dng nh� l� cao th� v� l﹎.",
			"C� ph秈 ngi n鉯 n Ki誱 th莕 T� M� Minh Phong? Xem ra, T� M� Minh Phong th藅 n鎖 danh. 18 n╩ trc lu薾 ki誱 � Hoa S琻, nh Hoa S琻 t藀 trung c竎 cao th� trong thi猲 h�, l筰 n鉯 Nh蕋 Ni猲 Thanh ki誱 kh竎h d鋍 ngang Hoa S琻 nh� th莕, kh玭g ai ti誴 n鎖 20 chi猽 c馻 玭g ta. Nh� , danh ti課g 玭g vang kh緋 thi猲 h�. Ngi n祔 ch輓h l� T� M� Minh Phong.",
			"Th� ra l� nh﹏ v藅 v� l﹎ g﹜ ch蕁 ng nh� v藋, sao l筰 kh玭g nghe ti課g trong giang h�?",
			}
	end

	TalkEx("task_024_01_0_1",strTalk);

end

--续对话
function task_024_01_0_1()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ha ha, g鋓 玭g ta l� ki誱 th莕, l� v� 玭g r髏 kh醝 giang h� sau khi th� hi謓 ki誱 ph竝 v� song, nhi襲 n╩ trc ngi tr猲 n骾 Hoa S琻 nh綾 n ki誱 ph竝 th莕 k� kia, c遪 T� M� Minh Phong b� 萵 bi課 m蕋, c騨g 頲 bi誸 n l� K菡m th莕 h� ph祄, xu蕋 qu� nh藀 th莕. Цnh tr薾 g﹜ ch蕁 ng thi猲 h�, nh璶g sau  l筰 bi課 m蕋, nh� v藋 c� truy襫 k� kh玭g ch�? Chuy謓 n祔 頲 truy襫 t� l﹗ trong giang h�, ngi i c騨g d莕 qu猲. N╩  ta may m緉 頲 th蕐 ki誱 ph竝 c馻 玭g ta tr猲 nh Hoa S琻, ng l� tuy謙 k�.",
			"Kh玭g ng� T� M� Minh Phong l筰 c� lai l辌h l韓 nh� v藋, ch糿g tr竎h е nh蕋 d騨g s� T﹜ H� kh玭g ch n鎖 玭g ta. Ti襫 b鑙 bi誸 ngi n祔 � Ph鬾g Tng, c遪 ngi c馻 Nh蕋 Ph萴 阯g dng nh� 產ng ti誴 x骳 v韎 玭g ta.",
			"�? T鮪g nghe 玭g ta 甶 kh緋 b鑞 bi觧, ho芻 � Giao Ch�, ho芻 � Li猽 Th�, nh璶g ch璦 nghe n鉯 玭g ta � Ph鬾g Tng ph�. Nh蕋 Ph萴 阯g e r籲g 產ng truy t譵 t玭g t輈h c馻 玭g t筰 Ph鬾g Tng , mu鑞 m阨 玭g nh藀 阯g. N誹 ngi  g苝 玭g ta, n猲 l璾 �, n誹 玭g ta th藅 s� gia nh藀 Nh蕋 Ph萴 阯g, Nh蕋 Ph萴 阯g s� kh� i ph� h琻.",
			"Ta hi觰 r錳.",
			}
	else
		strTalk = {
			"Ha ha, g鋓 玭g ta l� ki誱 th莕, l� v� 玭g r髏 kh醝 giang h� sau khi th� hi謓 ki誱 ph竝 v� song, nhi襲 n╩ trc ngi tr猲 n骾 Hoa S琻 nh綾 n ki誱 ph竝 th莕 k� kia, c遪 T� M� Minh Phong b� 萵 bi課 m蕋, c騨g 頲 bi誸 n l� K菡m th莕 h� ph祄, xu蕋 qu� nh藀 th莕. Цnh tr薾 g﹜ ch蕁 ng thi猲 h�, nh璶g sau  l筰 bi課 m蕋, nh� v藋 c� truy襫 k� kh玭g ch�? Chuy謓 n祔 頲 truy襫 t� l﹗ trong giang h�, ngi i c騨g d莕 qu猲. N╩  ta may m緉 頲 th蕐 ki誱 ph竝 c馻 玭g ta tr猲 nh Hoa S琻, ng l� tuy謙 k�.",
			"Kh玭g ng� T� M� Minh Phong l筰 c� lai l辌h l韓 nh� v藋, ch糿g tr竎h е nh蕋 d騨g s� T﹜ H� kh玭g ch n鎖 玭g ta. Ti襫 b鑙 bi誸 ngi n祔 � Ph鬾g Tng, c遪 ngi c馻 Nh蕋 Ph萴 阯g dng nh� 產ng ti誴 x骳 v韎 玭g ta.",
			"�? T鮪g nghe 玭g ta 甶 kh緋 b鑞 bi觧, ho芻 � Giao Ch�, ho芻 � Li猽 Th�, nh璶g ch璦 nghe n鉯 玭g ta � Ph鬾g Tng ph�. Nh蕋 Ph萴 阯g e r籲g 產ng truy t譵 t玭g t輈h c馻 玭g t筰 Ph鬾g Tng , mu鑞 m阨 玭g nh藀 阯g. N誹 ngi  g苝 玭g ta, n猲 l璾 �, n誹 玭g ta th藅 s� gia nh藀 Nh蕋 Ph萴 阯g, Nh蕋 Ph萴 阯g s� kh� i ph� h琻. ",
			}
	end

	TalkEx("task_024_01_0_2",strTalk);

end

--续对话
function task_024_01_0_2()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"C遪 m閠 chuy謓 nh� n ngi. Chim b� c﹗ a th� c馻 B竎h Hi誹 Sinh n b竜, g莕 y Trung Nguy猲 thng xu蕋 hi謓  t� C玭 L玭 ph竔,  g﹜ nghi ng� cho c竎 i m玭 ph竔, v� s� an nguy c馻 Trung Nguy猲, v� l﹎ Trung Nguy猲 x璦 nay lu玭 gi� th竔  th薾 tr鋘g v韎 c竎 m玭 ph竔 ngo筰 lai. C竎 m玭 ph竔 kh玭g hi觰 m鬰 ch nh藀 th� c馻 C玭 L玭 ph竔, e r籲g s� g﹜ ph﹏ tranh. Ngi l� е T� C玭 L玭, n猲 g竛h l蕐 tr竎h nhi謒 n祔, gi� l� l骳 c竎 ph竔 ph秈 畂祅 k誸 l筰, n鉯 r� ch� hng c馻 c竎 ngi cho c竎 ph竔 bi誸, h鉧 gi秈 ph﹏ tranh kh玭g c莕 thi誸, m韎 l� 甶襲 quan tr鋘g nh蕋.",
			"Ph竔 ta kh玭g ph秈 輙 ra giang h�, ch� l� x璦 nay ho箃 ng n琲 n骾 r鮪g, v韎 m鬰 ch gi竛g y猽 tr� ma. Ta s� v� h醝 i s� huynh Di謕 T� Thu nguy猲 nh﹏ n Trung Nguy猲 l莕 n祔,  Dng ti襫 b鑙 ng qu� lo l緉g.",
			"H鉧 gi秈 ph﹏ tranh, kh玭g t� ra y誹 k衜, ng l� b薱 k� t礽, <sex> th藅 bao dung. Qu� M玭 H錳 Lang t藀 h頿 nhi襲 е T� C玭 L玭, dng nh�  x秠 ra chuy謓 g� r錳, ngi h穣 甶 xem th� n祇.",
			"Ta nh蕋 nh s� cho ti襫 b鑙 bi誸 m鬰 ch nh藀 th� c馻 ph竔 ta, Qu� M玭 H錳 Lang l� n琲 oan h錸 t藀 h頿, ch綾  x秠 ra chuy謓 g� r錳, ta xin c竜 t�.  t� ti襫 b�  cho ta bi誸 tin v� T� M� Minh Phong.",
			}
	else
		strTalk = {
			"Ta hi觰 r錳.",
			"C遪 m閠 chuy謓 nh� n ngi. Chim b� c﹗ a th� c馻 B竎h Hi誹 Sinh n b竜, g莕 y Trung Nguy猲 nhi襲 l莕 xu蕋 hi謓  t� C玭 L玭 ph竔, V� l﹎ Trung Nguy猲 x璦 nay c秐h gi竎 v韎 chuy� m玭 ph竔 nh藀 th�, C玭 L玭 ph竔 r蕋 輙 quan t﹎ n th� s�, l莕 n祔 nhi襲 е T� C玭 L玭 ra giang h�, c竎 ph竔 v� l﹎ nghi ng� m鬰 ch c馻 h�. <sex> c� th� t譵 hi觰 m鬰 ch nh藀 th� c馻 C玭 L玭 ph竔 頲 kh玭g? C� nhi襲 е T� C玭 L玭 t藀 trung t筰 Qu� M玭 H錳 Lang, ngi h穣 甶 d� la xem sao.",
			"C玭 L玭 ph竔 tuy 輙 ra giang h�, nh璶g ch� hng kh玭g gi鑞g gian t�, nh�  ph遪g b蕋 tr綾, c騨g n猲 甶 t譵 hi觰 m閠 l莕,  Dng ti襫 b鑙 xin c竜 t�.  t� B筺  cho ta bi誸 tin v� T� M� Minh Phong.",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_02,1);
	if GetTask(TASK_XB_ID_01) == 1 then
		SetTask(TASK_XB_ID,40);--关闭08任务面板
	end
	TaskTip("H穣 n Qu� M玭 H錳 Lang 甶襲 tra chuy謓 е T� C玭 L玭 n Trung Nguy猲.");
	Msg2Player("H穣 n Qu� M玭 H錳 Lang 甶襲 tra chuy謓 е T� C玭 L玭 n Trung Nguy猲.");

end

--与鬼门回廊中受伤的昆仑弟子对话
function task_024_02_0()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"馻? V� s� huynh n祔 sao b� thng v藋?",
			"V誸 thng c馻 ta kh玭g n苙g l緈, ch� l� t筸 th阨 kh玭g h祅h ng 頲, oan h錸 t筰 Qu� M玭 H錳 Lang dng nh� 產ng m筺h l猲, ta t筸 th阨 b� qua i �. Sao ngi l筰 n y?",
			"Nghe n鉯 n琲 y  t藀 h頿 頲 m閠 s�  t� ph竔 ta, ta li襫 n xem c� chuy謓 g� x秠 ra. V誸 thng c馻 B筺 dng nh� kh玭g nh�, c� c莕 gi髉 g� kh玭g?",
			"Th� ra l� v藋, ta v鮝 thu Oan h錸 v祇 trong B譶h ng h錸 n祔, ph竝 l鵦 c馻 b譶h ng h錸 產ng y誹 d莕, ch� s� s緋 kh玭g ch鴄 頲 oan h錸. V誸 thng c馻 ta do oan h錸 l鵦 g﹜ ra, t筸 th阨 kh� h祅h ng, nh璶g kh玭g h筰 n t輓h m筺g. Ngi h穣 mau mang b譶h n祔 n ch� Чi s� huynh 頲 kh玭g? g ta s� t� bi誸 n閕 dung ta mu鑞 h錳 b竜.",
			"Л頲, c竎 h� h穣 t辬h dng, s絥 y xin h醝 i thi誹 hi謕 ch鱝 v誸 thng cho c竎 h� nh� th� n祇?",
			}
	else
		strTalk = {
			"馻? Nh譶h c竎h ╪ m芻 c馻 c竎 h� gi鑞g v韎  t� C玭 L玭 ph竔, sao l筰 b� thng v藋?",
			"V誸 thng c馻 ta kh玭g n苙g l緈, ch� l� t筸 th阨 kh玭g h祅h ng 頲, Oan h錸 t筰 Qu� M玭 H錳 Lang dng nh�  m筺h l猲, ta t筸 th阨 b� qua i �. Sao ngi nh薾 ra c竎h ╪ m芻 c馻 C玭 L玭 ph竔 ch髇g ta?",
			"Ta v� i  t� Di謕 T� Thu c馻 C玭 L玭 ph竔 c� duy猲 v韎 nhau, n猲 bi誸 頲 c竎h ╪ m芻 c馻 c竎 h�. V誸 thng c馻 c竎 h� c� v� kh玭g nh�, c� c莕 gi髉 g� kh玭g?",
			"Th� ra ngi bi誸 Di謕 s� huynh, t鑤, ta v鮝 thu Oan h錸 v祇 trong B譶h ng h錸 n祔, ph竝 l鵦 c馻 b譶h ng h錸 產ng y誹 d莕, ch� s� s緋 kh玭g ch鴄 頲 oan h錸. V誸 thng c馻 ta do oan h錸 l鵦 g﹜ ra, t筸 th阨 kh� h祅h ng, nh璶g kh玭g h筰 n t輓h m筺g. Ngi h穣 mau mang b譶h n祔 n ch� Di謕 s� huynh 頲 kh玭g? g ta s� t� bi誸 n閕 dung ta mu鑞 h錳 b竜.",
			"Л頲, c竎 h� h穣 t辬h dng, s絥 y xin h醝 Di謕 thi誹 hi謕 ch鱝 v誸 thng cho c竎 h� nh� th� n祇?",
			}
	end

	SetTask(TASK_XB_ID_02,2);
	AddItem(2,0,699,1,1);--锁魂樽
	TalkEx("",strTalk);
	TaskTip("H穣 mang b譶h ng h錸 v� C玭 L玭 giao cho Di謕 T� Thu");
	Msg2Player("H穣 mang b譶h ng h錸 v� C玭 L玭 giao cho Di謕 T� Thu");

end

--尚未将锁魂樽送返昆仑与受伤昆仑弟子对话
function task_024_02_1()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Th� ra l� v藋, ta v鮝 thu Oan h錸 v祇 trong B譶h ng h錸 n祔, ta b� thng n猲 t筸 th阨 kh玭g 甶 頲, ngi h穣 mau mang chi誧 b譶h n祔 n ch� Чi s� huynh 頲 kh玭g?",
			}
	else
		strTalk = {
			"Th� ra ngi quen Di謕 s� huynh, nh� v藋 th藅 t鑤, ta v鮝 thu Oan h錸 v祇 trong B譶h ng oan h錸 n祔, ta b� thng n猲 t筸 th阨 kh玭g 甶 頲, ngi h穣 mau mang chi誧 b譶h n祔 n ch� Di謕 s� huynh 頲 kh玭g?",
			}
	end

	TalkEx("",strTalk);

end

--与叶子秋对话交给他锁魂樽
function task_024_03_0()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Di謕 s� huynh, ta g苝 ngi c馻 ph竔 ta t筰 Qu� M玭 H錳 Lang, 玭g ta b� thng do thu ph鬰 Oan h錸 n猲 kh玭g th� h祅h ng, n猲 nh� ta mang B譶h ng h錸 n祔 v� cho B筺, B筺 xem c� g� kh竎 thng kh玭g.",
			"Sao? C� ngi b� thng �? C� n苙g kh玭g? C� ph秈 b� thng do Oan h錸 kh� b猲 trong Qu� M玭 H錳 Lang kh玭g?",
			"Nghe 玭g ta n鉯 c� v� nh� kh玭g tr� ng筰 l緈, ch� l� t筸 th阨 kh玭g h祅h ng 頲. g ta n鉯 v� s鴆 m筺h c馻 Oan h錸 t筰 Qu� M玭 H錳 Lang b鏽g d璶g t╪g l猲, t筸 th阨 b� qua v誸 thng. Ta nh ch鱝 cho 玭g ta, nh璶g 玭g ta l筰 b秓 ta mau v� ph鬰 m謓h.",
			"Th� ra l� v藋, may l� kh玭g b� thng n苙g, Qu� M玭 H錳 Lang g莕 y li猲 t鬰 c� chuy謓 b蕋 thng, oan h錸 trong  c騨g b� c秏 h鉧, r鬰h r辌h ng鉩 u d藋. S� ph� t鮪g n鉯 Trung Nguy猲 c� ma, ho祅h h祅h kh緋 n琲, xem ra l� th藅.",
			}
	else
		strTalk = {
			"Di謕 s� huynh, ta g苝 ngi c馻 ph竔 ta t筰 Qu� M玭 H錳 Lang, 玭g ta b� thng do thu ph鬰 Oan h錸 n猲 kh玭g th� h祅h ng, n猲 nh� ta mang B譶h ng h錸 n祔 v�, xin xem th�!",
			"Sao? C� ngi b� thng �? C� n苙g kh玭g? C� ph秈 b� thng do Oan h錸 kh� b猲 trong Qu� M玭 H錳 Lang kh玭g?",
			"Ngi ch琲 Nghe 玭g ta n鉯 c� v� nh� kh玭g tr� ng筰 l緈, ch� l� t筸 th阨 kh玭g h祅h ng 頲. g ta n鉯 v� s鴆 m筺h c馻 Oan h錸 t筰 Qu� M玭 H錳 Lang b鏽g d璶g t╪g l猲, t筸 th阨 b� qua v誸 thng.",
			"Th� ra l� v藋, may m� b� thng kh玭g n苙g, Qu� M玭 H錳 Lang g莕 y li猲 t鬰 c� chuy謓 b蕋 thng, oan h錸 trong  c騨g b� c秏 h鉧, r鬰h r辌h ng鉩 u d藋. S� ph� t鮪g n鉯 Trung Nguy猲 c� ma, ho祅h h祅h kh緋 n琲, xem ra l� th藅.",
			}
	end

	TalkEx("task_024_03_0_1",strTalk);

end

--续对话
function task_024_03_0_1()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"S� huynh thng n鉯 ph竔 c馻 ta h� thi猲 a, tr� y猽 ma, nh璶g 輙 khi h醝 chuy謓 Trung Nguy猲, b﹜ gi� l筰 n Trung Nguy猲, c� ph秈 v� vi謈 n祔?",
			"Kh玭g sai, t� khi m� n骾 l藀 ph竔, C玭 L玭 chuy猲 tr� y猽 di謙 ma, k� n╪g tinh tng. Y猽 ma tr鑞 trong r鮪g s﹗ n骾 hi觤,  t� ph竔 ta c騨g thng qua l筰 n琲 n祔, kh玭g ng� Trung Nguy猲 Giang T﹏ th玭 thng xuy猲 c� qu� h筰 ngi, ch髇g ta l祄 sao c� th�  cho gian t� h筰 d﹏? N猲 m韎 n Trung Nguy猲. C� 甶襲 ph秈 甶 v遪g qua n骾 r鮪g, l祄 cho c竎 ph竔 Trung Nguy猲 kinh ng筩, th薽 ch� c遪 g﹜ nghi ng�, n誹 c� hi觰 l莔, th� n猲 h鉧 gi秈.",
			"Th� ra l� v藋, ph竔 ta chuy猲 tr� ma, b秓 v� thi猲 a, n琲 n祇 c� t� ma, n琲  c� C玭 L玭. C竎 ph竔 Trung Nguy猲 x璦 nay nghi k� v韎 c竎 ph竔 kh竎, v� s� an to祅 c馻 Trung Nguy猲, kh玭g c� 竎 �. H鉧 gi秈 ph﹏ tranh m韎 cho th蕐 kh� kh竔 c馻 ph竔 ta, ta s� n鉯 sai Trng Ca M玭 n鉯 m鬰 ch nh藀 th� c馻 ph竔 ta, ch� l� h� thi猲 a ch輓h o, kh玭g  cho c竎 ph竔 Trung Nguy猲 ph秈 hi觰 l莔.",
			}
	else
		strTalk = {
			"Nghe Di謕 thi誹 hi謕 n鉯 ch� hng c馻 qu� ph竔 l� h� thi猲 a ch輓h o, tr� y猽 ma, r蕋 輙 h醝 chuy謓 Trung Nguy猲, b﹜ gi� l筰 n Trung Nguy猲, c� ph秈 l� v� chuy謓 n祔?",
			"<sex> n鉯 ng l緈, t� khi m� n骾 l藀 ph竔, C玭 L玭 chuy猲 tr� y猽 di謙 ma, k� n╪g tinh tng. Y猽 ma tr鑞 trong r鮪g s﹗ n骾 hi觤,  t� е T� C玭 L玭 c騨g thng qua l筰 n琲 n祔, kh玭g ng� Trung Nguy猲 Giang T﹏ th玭 thng xuy猲 c� qu� h筰 ngi, е T� C玭 L玭 l祄 sao c� th�  cho gian t� h筰 d﹏? N猲 C玭 L玭 ph竔 n Trung Nguy猲. C� 甶襲 ph秈 甶 v遪g qua n骾 r鮪g, l祄 cho c竎 ph竔 Trung Nguy猲 kinh ng筩, th薽 ch� c遪 g﹜ nghi ng�, n誹 c� hi觰 l莔. Xin h穣 lng th�.",
			"Th� ra l� v藋, C玭 L玭 chuy猲 tr� ma, l�  b秓 v� thi猲 a, n琲 n祇 c� t� ma, n琲  c� C玭 L玭. C竎 ph竔 Trung Nguy猲 x璦 nay nghi k� v韎 c竎 ph竔 kh竎, v� s� an to祅 c馻 Trung Nguy猲, kh玭g c� 竎 �, thi誹 hi謕 c騨g ng qu� lo l緉g, ta s� cho Trng Ca M玭 n鉯 cho c竎 ph竔 bi誸, C玭 L玭 ph竔 nh藀 th�  tr� ma, c竎 ph竔 Trung Nguy猲 kh玭g n猲 kh� x�, m� n猲 h� tr� nhau.",
			"Зy c騨g l� b鎛 � c馻 ph竔 ta, <sex> ngh躠 s﹗ c d祔, l筰 nh﹏ ngh躠, ta 頲 k誸 th﹏ v韎 ngi b筺 nh� v藋 qu� th藅 may m緉. Xin 產 t� <sex> gi髉 .",
			}
	end

	TalkEx("task_024_03_0_2",strTalk);

end

--续对话
function task_024_03_0_2()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Зy v鑞 l� b鎛 � c馻 ph竔 ta, h穣 n鉯 cho v� l﹎ Trung Nguy猲 bi誸, tr竛h ph﹏ tranh kh玭g c莕 thi誸 c騨g l� 甶襲 t鑤.",
			"Kh玭g sai, s� huynh n鉯 ch� ph秈. ng r錳, tuy b� thng t筰 Qu� M玭 H錳 Lang уng M玭 kh玭g n苙g, nh璶g n琲  r蕋 nguy hi觤, nh璶g c� c竎h c鴘 ch鱝 ch�?",
			"D� nhi猲 l� c�, C玭 L玭 Kim Кn chuy猲 tr� T� y猽 kh�, ta s� t譵 thu鑓 cho 玭g ta. Ph秈 r錳, Oan h錸 trong B譶h ng h錸 kh玭g ph秈 l� Oan h錸 th鵦 s�, m� l� nh鱪g Du h錸 v� t閕 b� Y猽 t� l鵦 kh鑞g ch� bi課 th祅h. S鴆 m筺h c馻 y猽 t� n祔 kh玭g th� coi thng, c� th� bi課 du h錸 th祅h 竎 qu�. Зy l� C玭 L玭 ti猲 n, c� th� gi秈 t�, ngi h穣 a cho 玭g ta v� n鉯 cho 玭g ta bi誸 chuy謓 oan h錸, v� h醝 ngu錸 g鑓 c馻 Y猽 t� l鵦 r錳 h穣 thng lng.",
			"Kh玭g th祅h v蕁 , n誹 i s� huynh mu鑞 t韎 C� Dng чng th� n猲 c萵 th薾, n琲  nguy c� tr飊g tr飊g.",
			}
	else
		strTalk = {
			"Di謕 thi誹 hi謕  coi ta l� b筺 th� ng n猲 kh竎h s竜. Thng t輈h c馻  t� Qu� M玭 H錳 Lang tuy kh玭g n苙g, nh璶g n琲 n祔 v蒼 r蕋 nguy hi觤, c� c竎h ch鱝 tr� n祇 kh玭g?",
			"Л琻g nhi猲 l� c�. C玭 L玭 Kim Кn chuy猲 tr� kh� t� y猽, ta v鮝 t譵 頲 n dc cho h� y. � ph秈, Oan H錸 頲 thu ph鬰 trong Ti猽 H錸 T玭 kh玭g ph秈 l� Oan H錸 th藅, m� ch� l� nh鱪g Du H錸 v� t閕 b� chi ph鑙 b雐 Gian T� chi l鵦. Ngu錸 s鴆 m筺h Gian T� n祔 kh玭g th� xem thng, ch髇g c� th� bi課 c竎 Du H錸 b譶h thng th祅h li謙 qu�. C玭 L玭 Ti猲 Кn n祔 c� th� gi秈 kh� мnh Th﹏, ng ra ta ph秈 ch th﹏ n , nh璶g v� c遪 ph秈 v閕 t韎 C� Dng чng, n猲 nh ph秈 nh� <sex> m閠 l莕 n鱝. Khi <sex> g苝 h�. Xin h穣 n鉯 r� vi謈 Oan H錸 kh玭g ph秈 l� Oan H錸 th藅, v� t譵 hi觰 v� xu蕋 x� c馻 Gian T� chi l鵦, r錳 ta s� th秓 lu薾 sau.",
			"Kh玭g th祅h v蕁 , Di謕 thi誹 hi謕 n誹 mu鑞 n C� Dng чng c莕 h誸 s鴆 c萵 th薾, C� Dng чng kh緋 n琲 u l� c筸 b蓎.",
			" t� s� nh綾 nh� c馻 <sex>, l﹗ nay 頲 <sex> gi髉 , ta th藅 r蕋 c秏 k輈h.",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_02,3);
	DelItem(2,0,699,1);--删去锁魂樽
	AddItem(2,0,756,1,1);--得到昆仑仙丹
	TaskTip("Лa C玭 L玭 Ti猲 Кn cho c竎  t� Qu� M玭 H錳 Lang 產ng b� thng.");
	Msg2Player("Лa C玭 L玭 Ti猲 Кn cho c竎  t� Qu� M玭 H錳 Lang 產ng b� thng.");
	GivePlayerAward("Award_XB_56","Easy");
	GivePlayerExp(SkeyXibei,"jiuren")
end

--未将仙丹带给鬼门回廊处的昆仑弟子
function task_024_03_1()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Зy l� C玭 L玭 Ti猲 Кn, c� th� gi秈 kh� мnh Th﹏, ngi 甧m v� a cho  t� Qu� M玭 H錳 Lang b� thng, cho h� bi誸 chuy謓 Oan H錸 gi�, ng th阨 t譵 ra u ngu錸 c馻 Gian T� chi l鵦, r錳 ta s� b祅 lu薾 sau.",
			}
	else
		strTalk = {
			"Phi襫 <sex> 甧m C玭 L玭 Ti猲 Кn n祔 n cho  t� Qu� M玭 H錳 Lang b� thng, ng th阨 t譵 hi觰 v� ngu錸 g鑓 c馻 Gian T� chi l鵦.",
			}
	end

	--补发昆仑仙丹
	if GetItemCount(2,0,756) < 1 then
		AddItem(2,0,756,1,1);--得到昆仑仙丹
		TaskTip("Лa C玭 L玭 Ti猲 Кn cho c竎  t� Qu� M玭 H錳 Lang 產ng b� thng.");
		Msg2Player("Лa C玭 L玭 Ti猲 Кn cho c竎  t� Qu� M玭 H錳 Lang 產ng b� thng.");
	end

	TalkEx("",strTalk);

end

--将仙丹交给受伤的昆仑弟子
function task_024_04_0()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"C� 甧m Ti猽 H錸 T玭 cho i s� huynh ch璦?",
			"Y猲 t﹎ 甶, ta  a Ti猽 H錸 T玭 cho i s� huynh r錳, huynh 蕐 mu鑞 ta 甧m Ti猲 Кn t韎  tr� thng cho c竎 ngi, h穣 mau d飊g 甶.",
			"Л頲, 產 t�. Чi s� huynh xem qua Ti猽 H錸 T玭 c� d苙 d� g� kh玭g?",
			"Чi s� huynh n鉯, trong Ti猽 H錸 T玭 kh玭g ph秈 l� Oan H錸 th藅, ch� l� nh鱪g Du H錸 b� Gian T� chi l鵦 kh鑞g ch�, ngi c� bi誸 n琲 c竎 Oan H錸 b� ph鉵g th輈h ra kh玭g? C� th�  ch輓h l� u ngu錸 c馻 s鴆 m筺h Gian T�.",
			}
	else
		strTalk = {
			"<sex> c� 甧m Ti猽 H錸 T玭 cho i s� huynh kh玭g?",
			"C竎 h� y猲 t﹎, ta  甧m Ti猽 H錸 T玭 t韎 tay Di謕 thi誹 hi謕, ch輓h thi誹 hi謕  nh� ta 甧m C玭 L玭 Ti猲 Кn n, c� th� gi髉 c竎 h� tr� thng, c竎 h� h穣 d飊g 甶.",
			"<sex> th藅 t鑤 b鬾g, ta ng l� c秏 琻 kh玭g xi誸. Di謕 s� huynh sau khi xem Ti猽 H錸 T玭 c� d苙 d� g� kh玭g?",
			"Di謕 thi誹 hi謕 n鉯, Oan H錸 b� ni猰 phong trong Ti猽 H錸 T玭 kh玭g ph秈 Oan H錸 th藅, m� l� c竎 Du H錸 b� kh鑞g ch� b雐 s鴆 m筺h Gian T�, ngi c� ph竧 hi謓 頲 n琲 c竎 Oan H錸 頲 ph鉵g th輈h ra kh玭g? C� th�  l� u ngu錸 c馻 s鴆 m筺h Gian T�",
			}
	end

	TalkEx("task_024_04_0_1",strTalk);

end

--续对话
function task_024_04_0_1()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"N鉯 v藋, t筰 n琲 t薾 c飊g c馻 Qu� M玭 H錳 Lang ng l� c� m閠 s鴆 m筺h Gian T� 產ng ng祔 c祅g l韓 m筺h, c竎 Oan H錸 t� n琲  tu玭 ra kh玭g ng鮪g. S鴆 m筺h n祔 dng nh� c� th� kh鑞g ch� 頲 c竎 Du H錸, s� t譶h c蕄 b竎h, li猲 quan t韎 v薾 m謓h c馻 c竎 th玭 tr蕁 quanh Qu� M玭 H錳 Lang. Gi� ta v蒼 ch璦 h錳 ph鬰 c玭g l鵦, e l� kh玭g th� n 頲 . V� c玭g c馻 ngi c� v� c騨g kh�, c� th� gi髉 ta n xem t譶h h譶h th� n祇?",
			"Li猲 quan t韎 v薾 m謓h c馻 b� t竛h, C玭 L玭 th� quy誸 theo ch輓h o, sao c� th� kh玭g 甶 頲? Nh璶g kh玭g bi誸 ph秈 甶襲 tra nh� th� n祇?",
			"Gian T� chi l鵦 mu鑞 kh鑞g ch� c竎 Du H錸, n猲 m閠 khi g苝 ph秈 c竎 h錸 ma v� t閕 総 s� hi謓 th﹏. Ch� ta c� m閠 C� H錸 T玭, trong  to祅 l� nh鱪g c� h錸 d� qu�, ngi c� th� mang theo v藅 n祔 n n琲 ph鉵g th輈h c� h錸 trong Qu� M玭 H錳 Lang  d� s鴆 m筺h n祔 xu蕋 hi謓,  xem th鵦 h� th� n祇. Ph秈 h誸 s鴆 th薾 tr鋘g, t鑤 nh蕋 l� n猲 t韎  c飊g v韎 v礽 b籲g h鱱 ng m玭. Ngu錸 s鴆 m筺h n祔 kh玭g th� xem thng, ch� ri猲g vi謈 bi課 c竎 C� h錸 b譶h thng th祅h Li謙 qu� v韎 s鴆 m筺h gh� g韒 c騨g  bi誸 uy l鵦 to l韓 c馻 n�.",
			"Ta hi觰 r錳, t筸 th阨 ngi c� an t﹎ tu dng, ta s� th薾 tr鋘g 鴑g ph�, vi謈 n祔 c� giao cho ta l� 頲.",
			}
	else
		strTalk = {
			"N鉯 v藋, t筰 n琲 t薾 c飊g c馻 Qu� M玭 H錳 Lang ng l� c� m閠 s鴆 m筺h Gian T� 產ng ng祔 c祅g l韓 m筺h, c竎 Oan H錸 t� n琲  tu玭 ra kh玭g ng鮪g. S鴆 m筺h n祔 dng nh� c� th� kh鑞g ch� 頲 c竎 Du H錸, s� t譶h c蕄 b竎h, li猲 quan t韎 v薾 m謓h c馻 c竎 th玭 tr蕁 quanh Qu� M玭 H錳 Lang. Gi� ta v蒼 ch璦 h錳 ph鬰 c玭g l鵦, e l� kh玭g th� n 頲 . V� c玭g c馻 ngi c� v� c騨g kh�, c� th� gi髉 ta n xem t譶h h譶h th� n祇?",
			"Li猲 quan t韎 v薾 m謓h c馻 b� t竛h, C玭 L玭 th� quy誸 theo ch輓h o, 琻g nhi猲 ph秈 gi髉  h誸 m譶h. Nh璶g kh玭g bi誸 ph秈 甶襲 tra nh� th� n祇?",
			"Gian T� chi l鵦 mu鑞 kh鑞g ch� c竎 Du H錸, n猲 m閠 khi g苝 ph秈 c竎 h錸 ma v� t閕 総 s� hi謓 th﹏. Ch� ta c� m閠 C� H錸 T玭, trong  to祅 l� nh鱪g c� h錸 d� qu�, ngi c� th� mang theo v藅 n祔 n n琲 ph鉵g th輈h c� h錸 trong Qu� M玭 H錳 Lang  d� s鴆 m筺h n祔 xu蕋 hi謓,  xem th鵦 h� th� n祇. Ph秈 h誸 s鴆 th薾 tr鋘g, t鑤 nh蕋 l� n猲 t韎  c飊g v韎 v礽 b籲g h鱱 ng m玭. Ngu錸 s鴆 m筺h n祔 kh玭g th� xem thng, ch� ri猲g vi謈 bi課 c竎 C� h錸 b譶h thng th祅h Li謙 qu� v韎 s鴆 m筺h gh� g韒 c騨g  bi誸 uy l鵦 to l韓 c馻 n�.",
			"Ra l� v藋, t筸 th阨 ngi c� an t﹎ tu dng, ta s� th薾 tr鋘g 鴑g ph�, vi謈 n祔 c� giao cho ta l� 頲.",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_02,4);
	AddItem(2,0,757,1,1);--孤魂樽
	DelItem(2,0,756,1);--删去昆仑仙丹
	TaskTip("S� d鬾g C� H錸 T玭 d蒼 d� O竛 H錸 Chi Vng xu蕋 hi謓 v� ti猽 di謙 ch髇g.");
	Msg2Player("S� d鬾g C� H錸 T玭 d蒼 d� O竛 H錸 Chi Vng xu蕋 hi謓 v� ti猽 di謙 ch髇g.");

end

--未消灭怨魂之王与受伤的弟子对话
function task_024_04_1()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Gian T� chi l鵦 mu鑞 kh鑞g ch� c竎 Du H錸, n猲 m閠 khi g苝 ph秈 c竎 h錸 ma v� t閕 総 s� hi謓 th﹏. Ch� ta c� m閠 C� H錸 T玭, trong  to祅 l� nh鱪g c� h錸 d� qu�, ngi c� th� mang theo v藅 n祔 n n琲 ph鉵g th輈h c� h錸 trong Qu� M玭 H錳 Lang  d� s鴆 m筺h n祔 xu蕋 hi謓,  xem th鵦 h� th� n祇. Ph秈 h誸 s鴆 th薾 tr鋘g, t鑤 nh蕋 l� n猲 t韎  c飊g v韎 v礽 b籲g h鱱 ng m玭. Ngu錸 s鴆 m筺h n祔 kh玭g th� xem thng, ch� ri猲g vi謈 bi課 c竎 C� h錸 b譶h thng th祅h Li謙 qu� v韎 s鴆 m筺h gh� g韒 c騨g  bi誸 uy l鵦 to l韓 c馻 n�.",
			}
	else
		strTalk = {
			"Gian T� chi l鵦 mu鑞 kh鑞g ch� c竎 Du H錸, n猲 m閠 khi g苝 ph秈 c竎 h錸 ma v� t閕 総 s� hi謓 th﹏. Ch� ta c� m閠 C� H錸 T玭, trong  to祅 l� nh鱪g c� h錸 d� qu�, ngi c� th� mang theo v藅 n祔 n n琲 ph鉵g th輈h c� h錸 trong Qu� M玭 H錳 Lang  d� s鴆 m筺h n祔 xu蕋 hi謓,  xem th鵦 h� th� n祇. Ph秈 h誸 s鴆 th薾 tr鋘g, t鑤 nh蕋 l� n猲 t韎  c飊g v韎 v礽 b籲g h鱱 ng m玭. Ngu錸 s鴆 m筺h n祔 kh玭g th� xem thng, ch� ri猲g vi謈 bi課 c竎 C� h錸 b譶h thng th祅h Li謙 qu� v韎 s鴆 m筺h gh� g韒 c騨g  bi誸 uy l鵦 to l韓 c馻 n�.",
			}
	end

	TalkEx("",strTalk);

	--补发孤魂樽
	if GetItemCount(2,0,757) < 1 then
		AddItem(2,0,757,1,1);--孤魂樽
		TaskTip("S� d鬾g C� H錸 T玭 d蒼 d� O竛 H錸 Chi Vng xu蕋 hi謓 v� ti猽 di謙 ch髇g.");
		Msg2Player("S� d鬾g C� H錸 T玭 d蒼 d� O竛 H錸 Chi Vng xu蕋 hi謓 v� ti猽 di謙 ch髇g.");
	end

end

--消灭怨魂之王和受伤的昆仑弟子对话
function task_024_05_0()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"C� thu ho筩h 頲 g� kh玭g? C� t譵 ra u ngu錸 s鴆 m筺h 產ng kh鑞g ch� c竎 Du H錸 ch璦?",
			"T筰 n琲 t薾 c飊g c馻 Qu� M玭 H錳 Lang, ta  g鋓 頲 Oan H錸 Chi Vng xu蕋 hi謓, h緉 r蕋 m筺h, c騨g may c� b籲g h鱱 tng tr�, khi h錸 phi ph竎h t竛 n� c�  l筰 m閠 o ph� n祔, ta kh玭g bi誸 n� l� v藅 g�, ngi xem th� 甶.",
			"馻, sao v藅 n祔 tr玭g gi鑞g Tr蕁 Ma Ph� c馻 ph竔 ta v藋, nh璶g l筰 kh玭g ho祅 to祅 l� Tr蕁 Ma Ph�, dng nh� n�  b� 竚 c﹗ T� ch� qu竔 d� m� nh蕋 th阨 ta c騨g kh玭g th� ph﹏ bi謙 r� 頲. C� l� i s� huynh s� bi誸 c﹗ tr� l阨.",
			"N誹 l� o ph� c馻 C玭 L玭, ch綾 l� i s� huynh s� nh薾 ra, nh璶g k� n祇 trong ph竔 C玭 L玭  甶襲 khi觧 Oan H錸 Vng?",
			"Vi謈 n祔 ta c騨g kh玭g r�, ch綾 l� c� u萵 kh骳 g� y. Gi� thng t輈h c馻 ta  l祅h h糿, c� th� h祅h ng 頲 r錳. Ngi h穣 甧m o ph� n祔 giao cho i s� huynh, v� b竜 v韎 huynh 蕐 ta s� ti誴 t鬰 甶襲 tra v� n祔, v礽 ng祔 n鱝 s� tr� v� C玭 L玭.",
			"Ta hi觰. N琲 n祔 r蕋 nguy hi觤, ngi ph秈 th薾 tr鋘g k蝟 b� c竎 Oan H錸  thng.",
			}
	else
		strTalk = {
			"<sex> c� thu ho筩h 頲 g� kh玭g? C� t譵 頲 u ngu錸 s鴆 m筺h kh鑞g ch� c竎 Du H錸 ch璦?",
			"T筰 n琲 t薾 c飊g c馻 Qu� M玭 H錳 Lang, ta  g鋓 頲 Oan H錸 Chi Vng xu蕋 hi謓, h緉 r蕋 m筺h, c騨g may c� b籲g h鱱 tng tr�, khi h錸 phi ph竎h t竛 n� c�  l筰 m閠 o ph� n祔, ta kh玭g bi誸 n� l� v藅 g�, ngi xem th� 甶.",
			"<sex> kh玭g nh鱪g c� t蕀 l遪g hi謕 ngh躠, c遪 c� v� c玭g cao si猽, ta r蕋 kh﹎ ph鬰. 馻, sao v藅 n祔 tr玭g gi鑞g Tr蕁 Ma Ph� c馻 ph竔 ta v藋, nh璶g l筰 kh玭g ho祅 to祅 l� Tr蕁 Ma Ph�, dng nh� n�  b� 竚 c﹗ T� ch� qu竔 d�, ta hi觰 bi誸 n玭g c筺, nh璶g c� l� i s� huynh s� c� c﹗ tr� l阨.",
			"N誹 l� o ph� c馻 C玭 L玭, ch綾 l� Di謕 thi誹 hi謕 s� nh薾 ra, nh璶g k� n祇 trong ph竔 C玭 L玭  甶襲 khi觧 Oan H錸 Vng?",
			"Vi謈 n祔 ta c騨g kh玭g r�, ch綾 l� c� u萵 kh骳 g� y. Gi� thng t輈h c馻 ta  l祅h h糿, c� th� h祅h ng 頲 r錳. <sex> c� th� 甧m o ph� n祔 giao cho Di謕 s� huynh, v� b竜 v韎 huynh 蕐 ta s� ti誴 t鬰 � l筰 甶襲 tra v� n祔, v礽 ng祔 n鱝 m韎 tr� v� C玭 L玭. L祄 phi襫 <sex>.",
			"ng kh竎h s竜, chuy謓 nh� th玦 m�. N琲 n祔 r蕋 nguy hi觤, ngi ph秈 th薾 tr鋘g k蝟 b� c竎 Oan H錸  thng.",
			}
	end

	SetTask(TASK_XB_ID_02,6);
	TalkEx("",strTalk);
	TaskTip("Лa o ph� c� 頲 sau khi gi誸 ch誸 O竛 H錸 Chi Vng cho Di謕 T� Thu ph竔 C玭 L玭, ng th阨 b竜 c竜 v� chuy謓 O竛 H錸 Chi Vng.");
	Msg2Player("Лa o ph� c� 頲 sau khi gi誸 ch誸 O竛 H錸 Chi Vng cho Di謕 T� Thu ph竔 C玭 L玭, ng th阨 b竜 c竜 v� chuy謓 O竛 H錸 Chi Vng.");
	GivePlayerAward("Award_XB_57","Easy");
	GivePlayerExp(SkeyXibei,"fuming")
end

--还未告诉叶子秋怨魂之王一事
function task_024_05_1()

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ngi a o ph� n祔 v� cho i s� huynh, ng th阨 n鉯 l筰 v韎 huynh 蕐 ta s� ti誴 t鬰 � l筰 y 甶襲 tra, v礽 ng祔 n鱝 m韎 tr� v�.",
			}
	else
		strTalk = {
			"<sex> h穣 a gi髉 o ph� n祔 n tay Di謕 s� huynh, v� n鉯 v韎 huynh 蕐, ta s� ti誴 t鬰 � l筰 y 甶襲 tra, v礽 ng祔 n鱝 m韎 v� C玭 L玭. Xin c秏 琻 <sex>.",
			}
	end

	TalkEx("",strTalk);

end

---------------------------------- 西北区25分支2_2秘境骷髅----------------------------------
--告诉叶子秋怨魂之王一事
function task_025_01_0()

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Чi s� huynh,  v鮝 tr� v� t� Qu� M玭 H錳 Lang, thng t輈h c馻  t� C玭 L玭  l祅h h糿, h緉 n鉯 ph秈 � l筰 ti誴 t鬰 甶襲 tra v� t譶h h譶h c馻 Qu� M玭 H錳 Lang, sau  m韎 tr� v� C玭 L玭. u ngu錸 c馻 Gian T� chi l鵦 l� do d� bi課 c馻 Oan H錸 Chi Vng � n琲 t薾 c飊g c馻 Qu� M玭 H錳 Lang, kh� kh╪ l緈  m韎 nh b筰 頲 h緉 v� ph竧 hi謓 o ph� n祔, i s� huynh c� bi誸 v藅 n祔 c� t竎 d鬾g g� kh玭g?",
			"е t� Qu� M玭 H錳 Lang 頲 b譶h y猲 l� ta y猲 t﹎ r錳. Чo ph� n祔 tr玭g gi鑞g v藅 c馻 ph竔 ta, r蕋 gi鑞g Tr蕁 Ma Ph� nh璶g dng nh� ph竝 l鵦 c馻 n� c遪 m筺h h琻 c� Tr蕁 Ma Ph�. C遪 nh� khi Phi Thng Чo Nh﹏ c遪 � trong m玭 ph竔, ng鉵 s� trng ch輓h l� Tr蕁 Ma Ph�, nh璶g sao Tr蕁 Ma Ph� l筰 c� th� 甶襲 khi觧 頲 ma qu竔? Ch糿g l� Phi Thng Чo Nh﹏  t╪g ph竝 l鵦 cho o ph� n祔?",
			"Phi Thng Чo Nh﹏ l� ai? Dng nh� ch璦 t鮪g nghe n鉯 n ngi n祔.",
			"Kh鬰 kh鬰, ngi n祔 k� ra c騨g d礽 d遪g l緈. Phi Thng Чo Nh﹏ v鑞 l� s� b� c馻 ta, 20 n╩ trc do s� c玭g truy襫 ng玦 v� chng m玭 cho s� ph� ta n猲  r阨 kh醝 C玭 L玭, n nay v蒼 kh玭g cam l遪g, kh玭g ng鮪g l猲 k� ho筩h ph秐 c玭g C玭 L玭 t筰 C� Dng чng, h遪g 畂箃 l筰 ng玦 v� chng m玭. C玭 L玭 coi tr鋘g vi謈 tu t﹎ dng t竛h, sao c� th� dung t髇g l遪g tham quy襫 l鵦 nh� th�. V鑞 s� ph� ta c騨g ni謒 t譶h ng m玭 m� b� qua, nh璶g theo t譶h b竜, Phi Thng Чo Nh﹏ kh玭g nh鱪g c� �  thu ph鬰 C� Dng Th�, c遪 qua l筰 v韎 T﹜ H�, nh鱪g h祅h ng ph秐 o m穒 qu鑓 nh� th� sao c� th� tha 頲? V� th� s� ph�  ph竔 ta n C� Dng чng thanh l� m玭 h�.",
			}
	else
		strTalk = {
			"Di謕 thi誹 hi謕, ta v鮝 tr� v� t� Qu� M玭 H錳 Lang, thng t輈h c馻  t� C玭 L玭  l祅h h糿, h緉 n鉯 ph秈 � l筰 ti誴 t鬰 甶襲 tra v� t譶h h譶h c馻 Qu� M玭 H錳 Lang, sau  m韎 tr� v� C玭 L玭. u ngu錸 c馻 Gian T� chi l鵦 l� do d� bi課 c馻 Oan H錸 Chi Vng � n琲 t薾 c飊g c馻 Qu� M玭 H錳 Lang, kh� kh╪ l緈 ta m韎 nh b筰 頲 h緉 v� ph竧 hi謓 o ph� n祔, Di謕 thi誹 hi謕 c� bi誸 v藅 n祔 c� t竎 d鬾g g� kh玭g?",
			"е t� Qu� M玭 H錳 Lang 頲 b譶h y猲 l� ta y猲 t﹎ r錳. Чo ph� n祔 tr玭g gi鑞g v藅 c馻 ph竔 ta, r蕋 gi鑞g Tr蕁 Ma Ph� nh璶g dng nh� ph竝 l鵦 c馻 n� c遪 m筺h h琻 c� Tr蕁 Ma Ph�. C遪 nh� khi Phi Thng Чo Nh﹏ c遪 � trong m玭 ph竔, ng鉵 s� trng ch輓h l� Tr蕁 Ma Ph�, nh璶g sao Tr蕁 Ma Ph� l筰 c� th� 甶襲 khi觧 頲 ma qu竔? Ch糿g l� Phi Thng Чo Nh﹏  t╪g ph竝 l鵦 cho o ph� n祔?",
			"Phi Thng Чo Nh﹏ l� ai? C騨g l� ngi c馻 ph竔 C玭 L玭 sao?",
			"Kh鬰 kh鬰, y l� 甶襲 h� th裯 trong m玭 ph竔. Th蕐 l� <sex> ta c騨g kh玭g ng筰 n鉯 th糿g. Phi Thng Чo Nh﹏ v鑞 l� s� b� c馻 ta, 20 n╩ trc do s� c玭g truy襫 ng玦 v� chng m玭 cho s� ph� ta n猲  r阨 kh醝 C玭 L玭, n nay v蒼 kh玭g cam l遪g, kh玭g ng鮪g l猲 k� ho筩h ph秐 c玭g C玭 L玭 t筰 C� Dng чng, h遪g 畂箃 l筰 ng玦 v� chng m玭. C玭 L玭 coi tr鋘g vi謈 tu t﹎ dng t竛h, sao c� th� dung t髇g l遪g tham quy襫 l鵦 nh� th�. V鑞 s� ph� ta c騨g ni謒 t譶h ng m玭 m� b� qua, nh璶g theo t譶h b竜, Phi Thng Чo Nh﹏ kh玭g nh鱪g c� �  thu ph鬰 C� Dng Th�, c遪 qua l筰 v韎 T﹜ H�, nh鱪g h祅h ng ph秐 o m穒 qu鑓 nh� th� sao c� th� tha 頲? V� th� s� ph�  ph竔 ta n C� Dng чng thanh l� m玭 h�. ",
			}
	end

	TalkEx("task_025_01_0_1",strTalk);

end

--续对话
function task_025_01_0_1()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ra l� v藋. Phi Thng Чo Nh﹏ kh鑞g ch� c竎 ma v藅 n祔 c騨g l� v� mu鑞 t蕁 c玭g ph竔 ta �?",
			"Vi謈 n祔 c騨g kh玭g th� n鉯 r� 頲. M蕐 ng祔 nay ta � C� Dng чng kh玭g th蕐 t玭g t輈h c馻 Phi Thng Чo Nh﹏, ch綾 l� 產ng l萵 tr鑞 u  thu ph鬰 C� Dng Th� r錳. Xem ra ta ph秈 t韎  l莕 n鱝, l莕 b籲g 頲 t玭g t輈h c馻 Phi Thng Чo Nh﹏.",
			"Nghe n C� Dng Th� uy l鵦 v� song, sao c� th� d� d祅g b� thu ph鬰? N誹 C� Dng Th� xu蕋 hi謓, ch糿g th祅h ra thi猲 h� i lo筺?",
			"Phi Thng Чo Nh﹏  mai ph鬰 � C� Dng чng su鑤 20 n╩, n誹 nghi謒 ra 頲 c竎h thu ph鬰 th� c騨g kh玭g l蕐 l祄 l�. C玭g d鬾g c馻 o ph� n祔 ch輓h l� nh� th�, nh璶g c� th� do ph竝 l鵦 ch璦  m筺h  thu ph鬰 頲 C� Dng Th�, n猲 m韎 d飊g cho nh鱪g ma v藅 y誹 h琻. � ph秈, � Thi猲 S� M藅 C秐h c騨g c� nh鱪g d� thng gi鑞g nh� v藋,  t� ph竔 ta  n  nhi襲 ng祔, nh璶g ch璦 c� tin b竜 v�. Ngi c� th� n Thi猲 S� M藅 C秐h t譵 h�  n緈 r� s� t譶h, c遪 ta ph秈 t韎 C� Dng чng i ph� v韎 Phi Thng Чo Nh﹏.",
			"Tr� ma v� o quy誸 kh玭g t� nan, chuy謓 n Thi猲 S� M藅 C秐h c� giao cho ta, Di謕 thi誹 hi謕 h穣 y猲 t﹎ l祄 c玭g vi謈 thanh l� m玭 h�.",
			}
	else
		strTalk = {
			"Ra l� v藋. Phi Thng Чo Nh﹏ kh鑞g ch� c竎 ma v藅 n祔 c騨g l� v� mu鑞 t蕁 c玭g ph竔 ta �?",
			"Vi謈 n祔 c騨g kh玭g th� n鉯 r� 頲. M蕐 ng祔 nay ta � C� Dng чng kh玭g th蕐 t玭g t輈h c馻 Phi Thng Чo Nh﹏, ch綾 l� 產ng l萵 tr鑞 u  thu ph鬰 C� Dng Th� r錳. Xem ra ta ph秈 t韎  l莕 n鱝, l莕 b籲g 頲 t玭g t輈h c馻 Phi Thng Чo Nh﹏.",
			"Nghe n C� Dng Th� uy l鵦 v� song, sao c� th� d� d祅g b� thu ph鬰? N誹 C� Dng Th� xu蕋 hi謓, ch糿g th祅h ra thi猲 h� i lo筺?",
			"Phi Thng Чo Nh﹏  mai ph鬰 � C� Dng чng su鑤 20 n╩, n誹 nghi謒 ra 頲 c竎h thu ph鬰 th� c騨g kh玭g l蕐 l祄 l�. C玭g d鬾g c馻 o ph� n祔 ch輓h l� nh� th�, nh璶g c� th� do ph竝 l鵦 ch璦  m筺h  thu ph鬰 頲 C� Dng Th�, n猲 m韎 d飊g cho nh鱪g ma v藅 y誹 h琻. � ph秈, � Thi猲 S� M藅 C秐h c騨g c� nh鱪g d� thng gi鑞g nh� v藋,  t� ph竔 ta  n  nhi襲 ng祔, nh璶g ch璦 c� tin b竜 v�. <sex> c� th� gi髉 ta th猰 m閠 l莕, n Thi猲 S� M藅 C秐h t譵 h�  n緈 r� s� t譶h, c遪 ta ph秈 t韎 C� Dng чng i ph� v韎 Phi Thng Чo Nh﹏.",
			"Tr� ma v� o quy誸 kh玭g t� nan, chuy謓 n Thi猲 S� M藅 C秐h c� giao cho ta, Di謕 thi誹 hi謕 h穣 y猲 t﹎ l祄 c玭g vi謈 thanh l� m玭 h�.",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_02,7);
	DelItem(2,0,717,1);--删去非常道符
	TaskTip("Nh薾 駓 th竎 c馻 Di謕 T� Thu, l猲 阯g n Thi猲 S� M藅 C秐h t譵 ki誱  t� C玭 L玭 b� m蕋 li猲 l筩.");
	Msg2Player("Nh薾 駓 th竎 c馻 Di謕 T� Thu, l猲 阯g n Thi猲 S� M藅 C秐h t譵 ki誱  t� C玭 L玭 b� m蕋 li猲 l筩.");

end

--还未与天师秘境中受伤的昆仑弟子对话
function task_025_01_1()

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"� Thi猲 S� M藅 C秐h c騨g c� nh鱪g d蕌 hi謚 c馻 Gian T� chi l鵦,  t� ph竔 ta  n  nh璶g ch璦 th蕐 tin b竜 v�. Ngi c� th� n Thi猲 S� M藅 C秐h t譵 h�  n緈 r� s� t譶h, c遪 ta ph秈 t韎 C� Dng чng i ph� v韎 Phi Thng Чo Nh﹏.",
			}
	else
		strTalk = {
			"� Thi猲 S� M藅 C秐h c騨g c� nh鱪g d蕌 hi謚 c馻 Gian T� chi l鵦,  t� ph竔 ta  n  nh璶g ch璦 th蕐 tin b竜 v�. <sex> c� th� gi髉 ta n Thi猲 S� M藅 C秐h t譵 h�  n緈 r� s� t譶h, c遪 ta ph秈 t韎 C� Dng чng i ph� v韎 Phi Thng Чo Nh﹏.",
			}
	end

	TalkEx("",strTalk);

end

--与天师秘境中受伤的昆仑弟子对话获得解封的咒语
function task_025_02_0()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"S� huynh ph秈 ch╪g n y  甶襲 tra v� d� thng c馻 Thi猲 S� M藅 C秐h? Чi s� huynh ph竔 ta n t譵 hi觰 t譶h h譶h c� ti課 tri觧 g� kh玭g?",
			"S�  n th藅 ng l骳. Xin h穣 chuy觧 l阨 l� ta  ph竧 hi謓 Thi猲 S� M藅 C秐h c� ngu錸 Gian T� chi l鵦 產ng t竎 qu竔, khi課 C� L﹗ Vng c� d蕌 hi謚 th鴆 t豱h sau tr筺g th竔 ng� m�. Ta b� h緉  thng, hao t鑞 t蕋 c� ph竝 l鵦 m韎 mi詎 cng phong 蕁 頲 h緉, nh璶g l筰 kh玭g c遪 s鴆 l鵦  ti猽 di謙. N誹 C� L﹗ Vng l筰 th鴆 t豱h l莕 n鱝, e s� nguy h筰 nh﹏ gian.",
			"� y c騨g c� ngu錸 Gian T� chi l鵦 l祄 C� L﹗ Vng th鴆 t豱h �? Sao l筰 tr飊g h頿 v韎 s� vi謈 c馻 Oan H錸 Vng v藋?",
			"� ngi l� Oan H錸 Chi Vng � Qu� M玭 H錳 Lang  sao? N誹 Oan H錸 Chi Vng v� C� L﹗ Vng c飊g l骳 hi謓 th� th� kh玭g ph秈 l� 甶襪 l祅h. Oan H錸 Vng c� b� ti猽 di謙 ch璦?",
			"Oan H錸 Vng  b� ta ti猽 di謙, xem ra C� L﹗ Vng c騨g kh玭g 頲 ph衟 t錸 t筰 n鱝 r錳, kh玭g bi誸 c� c竎h n祇 ti猽 di謙 C� L﹗ Vng kh玭g? H穣  ta gi髉 s� huynh ti猽 di謙 n� v藋.",
			}
	else
		strTalk = {
			"Ph秈 ch╪g ngi ch輓h l� ngi c馻 ph竔 C玭 L玭 n 甶襲 tra v� d� thng c馻 Thi猲 S� M藅 C秐h? Di謕 T� Thu ph竔 ta n t譵 hi觰 t譶h h譶h c� ti課 tri觧 g� kh玭g?",
			"Ra <sex> quen bi誸 Di謕 s� huynh. Xin h穣 chuy觧 l阨 l� ta  ph竧 hi謓 Thi猲 S� M藅 C秐h c� ngu錸 Gian T� chi l鵦 產ng t竎 qu竔, khi課 C� L﹗ Vng c� d蕌 hi謚 th鴆 t豱h sau tr筺g th竔 ng� m�. Ta b� h緉  thng, hao t鑞 t蕋 c� ph竝 l鵦 m韎 mi詎 cng phong 蕁 頲 h緉, nh璶g l筰 kh玭g c遪 s鴆 l鵦  ti猽 di謙. N誹 C� L﹗ Vng l筰 th鴆 t豱h l莕 n鱝, e s� nguy h筰 nh﹏ gian.",
			"� y c騨g c� ngu錸 Gian T� chi l鵦 l祄 C� L﹗ Vng th鴆 t豱h �? Sao l筰 tr飊g h頿 v韎 s� vi謈 c馻 Oan H錸 Vng v藋?",
			"<sex> 產ng n鉯 t韎 Oan H錸 Chi Vng trong Qu� M玭 H錳 Lang ph秈 kh玭g? N誹 Oan H錸 Chi Vng v� C� L﹗ Vng c飊g l骳 hi謓 th� th� kh玭g ph秈 l� 甶襪 l祅h. Oan H錸 Vng c� b� ti猽 di謙 ch璦?",
			"Oan H錸 Vng  b� ta ti猽 di謙, xem ra C� L﹗ Vng c騨g kh玭g 頲 ph衟 t錸 t筰 n鱝 r錳, kh玭g bi誸 c� c竎h n祇 ti猽 di謙 C� L﹗ Vng kh玭g? H穣  ta gi髉 s� huynh ti猽 di謙 n� v藋.",
			}
	end

	TalkEx("task_025_02_0_1",strTalk);

end

--续对话
function task_025_02_0_1()

local strTalk = {}
local nCruseIndex = random(1,getn(KULOUWANG_CURSE));

	SetTask(KULOUWANG_CURSE_ID,nCruseIndex);

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"C� L﹗ Vng 產ng b� ta phong 蕁 t筰 n琲 t薾 c飊g c馻 Thi猲 S� M藅 C秐h, n誹 mu鑞 ti猽 di謙 th� ph秈 nh﹏ l骳 n祔. Ngi c� th� d飊g c﹗ T� ch� n祔  gi秈 phong 蕁, sau  c飊g Tr秏 Y猽 Ph� ti猽 di謙 h緉. Ch� d飊g sai T� ch�, v� n誹 d飊g sai T� ch� trong l骳 gi秈 phong 蕁, C� L﹗ Vng s� tho竧 ra, m閠 khi h緉 ph鬰 h錳 ph竝 l鵦 s� r蕋 kh� i ph�.",
			"Xin h醝 s� huynh c﹗ T� ch� l� g�?",
			"Ngi ph秈 nh� cho k� T� ch� l� "..KULOUWANG_CURSE[nCruseIndex]..", n誹 c sai th� phong 蕁 s� kh玭g gi秈 tr� 頲 u.",
			"Hi觰 r錳, ta s� c萵 th薾. S� huynh c� y猲 t﹎ dng thng.",
			}
	else
		strTalk = {
			"C� L﹗ Vng 產ng b� ta phong 蕁 t筰 n琲 t薾 c飊g c馻 Thi猲 S� M藅 C秐h, n誹 mu鑞 ti猽 di謙 th� ph秈 nh﹏ l骳 n祔. Tuy <sex> kh玭g ph秈 ngi c馻 ph竔 C玭 L玭 ta, nh璶g l筰 c� t蕀 l遪g ph鬰 ma hi謕 ngh躠, ta xin 產 t� <sex>. Phong 蕁 c� th� d飊g c﹗ T� ch�  gi秈 tr�, sau  c飊g Tr秏 Y猽 Ph� ti猽 di謙 h緉. Ch� d飊g sai T� ch�, v� n誹 d飊g sai T� ch� trong l骳 gi秈 phong 蕁, C� L﹗ Vng s� tho竧 ra, m閠 khi h緉 ph鬰 h錳 ph竝 l鵦 s� r蕋 kh� i ph�.",
			"Xin h醝 c竎 h� c﹗ T� ch� l� g�?",
			"Ngi ph秈 nh� cho k� T� ch� l� "..KULOUWANG_CURSE[nCruseIndex]..", n誹 c sai th� phong 蕁 s� kh玭g gi秈 tr� 頲 u.",
			"Hi觰 r錳, ta s� c萵 th薾. Xin c� y猲 t﹎ dng thng.",
			}
	end

	TalkEx("",strTalk);
	AddItem(2,0,758,1,1);--斩妖符
	SetTask(TASK_XB_ID_02,8);
	TaskTip("Nh薾 駓 th竎 c馻  t� C玭 L玭, l猲 阯g 甶 n n琲 C� L﹗ Vng b� phong 蕁  ti猽 di謙 h緉.");
	Msg2Player("Nh薾 駓 th竎 c馻  t� C玭 L玭, l猲 阯g 甶 n n琲 C� L﹗ Vng b� phong 蕁  ti猽 di謙 h緉.");

end

--尚未消灭骷髅王
function task_025_02_1()

local nCruseIndex = GetTask(KULOUWANG_CURSE_ID);
local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"C� L﹗ Vng  b� ta phong 蕁 t筰 n琲 t薾 c飊g c馻 Thi猲 S� M藅 C秐h, c� th� d飊g c﹗ T� ch� l莕 trc ta  truy襫 th�  gi秈 tr�, sau d飊g Tr秏 Y猽 Ph�  ti猽 di謙. Ch� d飊g sai T� ch�, v� n誹 d飊g sai T� ch� trong l骳 gi秈 phong 蕁, C� L﹗ Vng s� tho竧 ra, m閠 khi h緉 ph鬰 h錳 ph竝 l鵦 s� r蕋 kh� i ph�.",
			"H穣 nh� c﹗ T� ch� gi秈 tr� phong 蕁 l� "..KULOUWANG_CURSE[nCruseIndex]..", n誹 c sai th� phong 蕁 s� kh玭g gi秈 tr� 頲 u.",
			}
	else
		strTalk = {
			"C� L﹗ Vng  b� ta phong 蕁 t筰 n琲 t薾 c飊g c馻 Thi猲 S� M藅 C秐h, c� th� d飊g c﹗ T� ch� l莕 trc ta  truy襫 th�  gi秈 tr�, sau d飊g Tr秏 Y猽 Ph�  ti猽 di謙. Ch� d飊g sai T� ch�, v� n誹 d飊g sai T� ch� trong l骳 gi秈 phong 蕁, C� L﹗ Vng s� tho竧 ra, m閠 khi h緉 ph鬰 h錳 ph竝 l鵦 s� r蕋 kh� i ph�.",
			"H穣 nh� c﹗ T� ch� gi秈 tr� phong 蕁 l� "..KULOUWANG_CURSE[nCruseIndex]..", n誹 c sai th� phong 蕁 s� kh玭g gi秈 tr� 頲 u.",
			}
	end

	TalkEx("",strTalk);

	--补发斩妖符
	if GetItemCount(2,0,758) < 1 then
		AddItem(2,0,758,1,1);--斩妖符
		TaskTip("Nh薾 駓 th竎 c馻  t� C玭 L玭, l猲 阯g 甶 n n琲 C� L﹗ Vng b� phong 蕁  ti猽 di謙 h緉.");
		Msg2Player("Nh薾 駓 th竎 c馻  t� C玭 L玭, l猲 阯g 甶 n n琲 C� L﹗ Vng b� phong 蕁  ti猽 di謙 h緉.");
	end

end

--成功消灭骷髅王与昆仑弟子对话
function task_025_03_0()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ngi c� ti猽 di謙 頲 C� L﹗ Vng ch璦? C� b� thng kh玭g?",
			"Nh� b� phong 蕁, uy l鵦 c馻 C� L﹗ Vng b� gi秏 甶 r蕋 nhi襲, n猲 ta kh玭g b� thng g�. Khi b� ti猽 di謙 c騨g gi鑞g nh� l骳 ta di謙 tr� Oan H錸 Vng, u  l筰 o ph� n祔, s鴆 m筺h c馻 C� L﹗ Vng v� Oan H錸 Vng u n t� c飊g m閠 ngu錸, xem ra l� c飊g m閠 th� ph筸.",
			"H鉧 ra chuy謓 � Qu� M玭 H錳 Lang c騨g c� li猲 quan, e l� vi謈 th鴆 t豱h c馻 C� L﹗ Vng l� 甶襲 b蕋 thng. C� L﹗ Vng tuy  b� di謙, nh璶g n誹 v蒼 c遪 c竎 y猽 v藅 kh竎 th� kh玭g hay ch髏 n祇. в  ph遪g b蕋 tr綾, c� l� ta s� � l筰 y ti誴 t鬰 甶襲 tra, c遪 ngi tr� v� b竜 v韎 i s� huynh chuy謓 c馻 C� L﹗ Vng � Thi猲 S� M藅 C秐h. Ta ph秈 � l筰 y th猰 v礽 h玬.",
			"Л頲, ta s� b竜 l筰 v韎 i s� huynh, ngi � l筰 ph秈 c萵 th薾 h祅h s�.",
			}
	else
		strTalk = {
			"<sex> c� ti猽 di謙 頲 C� L﹗ Vng ch璦? C� b� thng kh玭g?",
			"Nh� b� phong 蕁, uy l鵦 c馻 C� L﹗ Vng b� gi秏 甶 r蕋 nhi襲, n猲 ta kh玭g b� thng g�. Khi b� ti猽 di謙 c騨g gi鑞g nh� l骳 ta di謙 tr� Oan H錸 Vng, u  l筰 o ph� n祔, s鴆 m筺h c馻 C� L﹗ Vng v� Oan H錸 Vng u n t� c飊g m閠 ngu錸, xem ra l� c飊g m閠 th� ph筸.",
			"H鉧 ra chuy謓 � Qu� M玭 H錳 Lang c騨g c� li猲 quan, e l� vi謈 th鴆 t豱h c馻 C� L﹗ Vng l� 甶襲 b蕋 thng. C� L﹗ Vng tuy  b� di謙, nh璶g n誹 v蒼 c遪 c竎 y猽 v藅 kh竎 th� kh玭g hay ch髏 n祇. в  ph遪g b蕋 tr綾, c� l� ta s� � l筰 y ti誴 t鬰 甶襲 tra, n誹 <sex> quen bi誸 v韎 Di謕 s� huynh, c� th� phi襫 Ngi b竜 l筰 v韎 huynh 蕐 chuy謓 C� L﹗ Vng � Thi猲 S� M藅 C秐h? Ta ph秈 � l筰 y th猰 v礽 h玬.  t� s� gi髉  c馻 <sex>, ph竔 C玭 L玭 c秏 k輈h b蕋 t薾.",
			"Xin ng kh竎h s竜. T玦 s� truy襫 t t譶h h譶h c� th� n Di謕 thi誹 hi謕, ngi � l筰 nh� ph秈 th藅 c萵 tr鋘g.",
			}
	end

	SetTask(TASK_XB_ID_02,10);
	TalkEx("",strTalk);
	TaskTip("Nh薾 駓 th竎 c馻  t� C玭 L玭, 甧m s� vi謈 C� L﹗ Vng � Thi猲 S� M藅 C秐h b竜 l筰 v韎 Di謕 T� Thu.");
	Msg2Player("Nh薾 駓 th竎 c馻  t� C玭 L玭, 甧m s� vi謈 C� L﹗ Vng � Thi猲 S� M藅 C秐h b竜 l筰 v韎 Di謕 T� Thu.");
	GivePlayerAward("Award_XB_58","Easy");
	GivePlayerExp(SkeyXibei,"jiefengzhouyu")
end

--尚未告知叶子秋骷髅王一事
function task_025_03_1()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"H穣 b竜 l筰 v韎 i s� huynh chuy謓 C� L﹗ Vng � Thi猲 S� M藅 C秐h, ta ph秈 � l筰 th猰 v礽 ng祔  xem c遪 c� ma v藅 n祇 n鱝 kh玭g.  t� s� gi髉  c馻 <sex>, ph竔 C玭 L玭 c秏 k輈h b蕋 t薾.",
			}
	else
		strTalk = {
			"Nh� <sex> chuy觧 l阨 n Di謕 s� huynh v� chuy謓 C� L﹗ Vng � Thi猲 S� M藅 C秐h, ta ph秈 � l筰 th猰 v礽 ng祔  xem c遪 c� ma v藅 n祇 n鱝 kh玭g.  t� s� gi髉  c馻 <sex>, ph竔 C玭 L玭 c秏 k輈h b蕋 t薾.",
			}
	end

	TalkEx("",strTalk);

end

--告知叶子秋骷髅王一事
function task_025_04_0()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Чi s� huynh, C� L﹗ Vng � Thi猲 S� M藅 C秐h  th鴆 t豱h, nh璶g  頲 ngi c馻 ph竔 ta phong 蕁 k辮 th阨. Khi ti猽 di謙 C� L﹗ Vng,  c騨g t譵 頲 m閠 o ph�, gi鑞g y c竎h th鴆  kh鑞g ch� Oan H錸 Vng.",
			"Ta v鮝 tr� v� t� C� Dng чng, t筰 C� Dng чng ta ng蓇 nhi猲 ph竧 hi謓 t玭g t輈h c馻 Phi Thng Чo Nh﹏, nh璶g h緉 ph鉵g th輈h c竎 ma v藅  頲 thu莕 h鉧 r錳 t萿 tho竧. Khi ta ti猽 di謙 c竎 ma v藅 n祔 m韎 ph竧 hi謓 t蕋 c� u b� kh鑞g ch� b雐 o ph�. K誸 h頿 v韎 l阨 k� c馻 ngi, c� th� ch綾 ch緉 vi謈 th鴆 t豱h c馻 Oan H錸 Vng v� C� L﹗ Vng l� do Phi Thng Чo Nh﹏ g﹜ ra. Chng m玭  c秏 nh薾 頲 d� thng � C玭 L玭 s琻 產ng gia t╪g, dng nh� s� c� y猽 v藅 xu蕋 hi謓. Phi Thng Чo Nh﹏ tr鑞 trong C� Dng чngsu鑤 20 n╩, vi謈 thu莕 h鉧 C� Dng Th� ch� l� v蕁  th阨 gian.",
			"уn r籲g C� Dng Th� t輓h t譶h hung b筼, l� m鑙 h鋋 c馻 nh﹏ gian, Phi Thng Чo Nh﹏ v� c竔 l頸 ri猲g m� ph� m芻 an nguy c馻 b� t竛h, ph鉵g th輈h C� Dng Th�, 総 s� g﹜ n猲 i h鋋.",
			"ng v藋, n猲 s� ph� ta m韎 quy誸 t﹎ thanh l� m玭 h�, ch� e Phi Thng Чo Nh﹏  s緋 thu ph鬰 頲 C� Dng Th�, b籲g kh玭g sao h緉 l筰 v閕 v祅g ti誴 x骳 v韎 ngi T﹜ H�? в c鴘 b� t竛h thi猲 h�, 総 ph秈 tr鮪g tr� Phi Thng Чo Nh﹏, b秓 v� C玭 L玭 ch輓h o. � ph秈, ta v蒼 c遪 m閠 vi謈 mu鑞 nh� ngi gi髉 .",
			}
	else
		strTalk = {
			"Di謕 thi誹 hi謕, C� L﹗ Vng � Thi猲 S� M藅 C秐h th鴆 t豱h, nh璶g  b�  t� C玭 L玭 phong 蕁. Khi ti猽 di謙 C� L﹗ Vng, c� ph竧 hi謓 th猰 m閠 o ph�, gi鑞g h謙 nh� c竎h  kh鑞g ch� Oan H錸 Vng.",
			"Ta v鮝 tr� v� t� C� Dng чng, t筰 C� Dng чng ta ng蓇 nhi猲 ph竧 hi謓 t玭g t輈h c馻 Phi Thng Чo Nh﹏, nh璶g h緉 ph鉵g th輈h c竎 ma v藅  頲 thu莕 h鉧 r錳 t萿 tho竧. Khi ta ti猽 di謙 c竎 ma v藅 n祔 m韎 ph竧 hi謓 t蕋 c� u b� kh鑞g ch� b雐 o ph�. K誸 h頿 v韎 l阨 k� c馻 ngi, c� th� ch綾 ch緉 vi謈 th鴆 t豱h c馻 Oan H錸 Vng v� C� L﹗ Vng l� do Phi Thng Чo Nh﹏ g﹜ ra. Chng m玭  c秏 nh薾 頲 d� thng � C玭 L玭 s琻 產ng gia t╪g, dng nh� s� c� y猽 v藅 xu蕋 hi謓. Phi Thng Чo Nh﹏ tr鑞 trong C� Dng чngsu鑤 20 n╩, vi謈 thu莕 h鉧 C� Dng Th� ch� l� v蕁  th阨 gian.",
			"уn r籲g C� Dng Th� t輓h t譶h hung b筼, l� m鑙 h鋋 c馻 nh﹏ gian, Phi Thng Чo Nh﹏ v� c竔 l頸 ri猲g m� ph� m芻 an nguy c馻 b� t竛h, ph鉵g th輈h C� Dng Th�, 総 s� g﹜ n猲 i h鋋.",
			"<sex> n鉯 r蕋 c� l�, v藋 n猲 s� ph� ta m韎 quy誸 t﹎ thanh l� m玭 h�, ch� e Phi Thng Чo Nh﹏  s緋 thu ph鬰 頲 C� Dng Th�, b籲g kh玭g sao h緉 l筰 v閕 v祅g ti誴 x骳 v韎 ngi T﹜ H�? в c鴘 b� t竛h thi猲 h�, 総 ph秈 tr鮪g tr� Phi Thng Чo Nh﹏, b秓 v� C玭 L玭 ch輓h o. <sex>  gi髉  ph竔 C玭 L玭 r蕋 nhi襲, ta th藅 kh玭g bi誸 ph秈 n鉯 g�  c秏 琻. � ph秈, ta v蒼 c遪 m閠 vi謈 mu鑞 nh� <sex> gi髉 . ",
			}
	end

	TalkEx("task_025_04_0_1",strTalk);

end

--续对话
function task_025_04_0_1()

local strTalk = {}

		--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Чi s� huynh ng kh竎h s竜. Xin c� d苙 d�.",
			"Ph� th﹏ ta � Ph鬾g Tng  l﹗ kh玭g th蕐 li猲 l筩, l莕 trc ngi c� nh綾 n ph� th﹏ � qu� nh� thng lo l緉g cho ta, b秐 th﹏ ta c騨g r蕋 mong nh� Ngi, ngi c� th� thay ta b竜 b譶h an cho ph� th﹏? Ngo礽 ra vi謈 s� ph� giao ph� c騨g s緋 ho祅 th祅h, s緋 t韎 ta c� th� v� 畂祅 t� v韎 ph� th﹏ r錳. Xin h穣 chuy觧 l筰 t韎 ph� th﹏ ta 產ng � Ph鬾g Tng ph� 頲 an t﹎.",
			"Kh玭g ng� i s� huynh c騨g l� ngi con hi誹 th秓. Чi s� huynh c� y猲 t﹎,  s� chuy觧 l阨 c馻 huynh n Di謕 l穙, huynh c� y猲 t﹎ n C� Dng чng, nh璶g dng nh� ph竝 l鵦 c馻 Phi Thng Чo Nh﹏  t╪g r蕋 nhi襲, huynh ph秈 c萵 th薾.",
			"(C遪 n鱝 ta qu猲 b竜 v韎  Dng ti襫 b鑙 v� m鬰 ch nh藀 th� c馻 ph竔 ta.  t譵 玭g 蕐 n鉯 r� t譶h h譶h r錳 m韎 t韎 ch� Di謕 l穙 v藋.)",
			}
	else
		strTalk = {
			"Di謕 thi誹 hi謕 kh竎h s竜 qu�, b籲g h鱱 gi髉  nhau l� vi謈 n猲 l祄. Xin c� n鉯 ng ng筰. ",
			"Ph� th﹏ ta � Ph鬾g Tng  l﹗ kh玭g li猲 l筩, l莕 trc <sex> c� nh綾 n ph� th﹏ � qu� nh� thng lo l緉g cho ta, b秐 th﹏ ta c騨g r蕋 mong nh� Ngi, <sex> c� th� thay ta b竜 b譶h an cho ph� th﹏? Ngo礽 ra vi謈 s� ph� giao ph� c騨g s緋 ho祅 th祅h, s緋 t韎 ta c� th� v� 畂祅 t� v韎 ph� th﹏ r錳. Xin h穣 chuy觧 l筰 t韎 ph� th﹏ ta 產ng � Ph鬾g Tng ph� 頲 an t﹎.",
			"H鉧 ra Di謕 thi誹 hi謕 c騨g l� ngi con hi誹 th秓. Thi誹 hi謕 c� y猲 t﹎, ta s� chuy觧 l阨 n Di謕 l穙, huynh c� y猲 t﹎ n C� Dng чng, nh璶g dng nh� ph竝 l鵦 c馻 Phi Thng Чo Nh﹏  t╪g r蕋 nhi襲, huynh ph秈 c萵 th薾.",
			"(M鬰 ch nh藀 th� c馻 C玭 L玭  r� r祅g r錳, trc khi t韎 ch� Di謕 l穙 ch綾 ta n猲 甶 t譵  Dng ti襫 b鑙 n鉯 r� s� t譶h.)",
			}
	end

	TalkEx("task_025_04_0_2",strTalk);

end

--发奖励
function task_025_04_0_2()

	give_ss_award(59);

	if GetTask(TASK_GET_AWARD) == 1 then
		SetTask(TASK_GET_AWARD,0);
		DelItem(2,0,717,1);--非常道符
		SetTask(TASK_XB_ID_02,11);
		CreateTrigger(4,210,TALK_XB_OUYANGHUA);
		TaskTip("m m鬰 ch nh藀 th� c馻 C玭 L玭 ph竔 n鉯 r� v韎  Dng ti襫 b鑙.");
		Msg2Player("m m鬰 ch nh藀 th� c馻 C玭 L玭 ph竔 n鉯 r� v韎  Dng ti襫 b鑙.");
		GivePlayerAward("Award_XB_59","Easy");
		GivePlayerExp(SkeyXibei,"fuhui")
	end
end

--尚未告知欧阳画昆仑入世一事因由
function task_025_04_1()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Х l﹗ ta kh玭g li猲 l筩 g� v韎 ph� th﹏ � Ph鬾g Tng, l莕 trc ngi c� nh綾 n ph� th﹏ � qu� nh� thng lo l緉g cho ta, b秐 th﹏ ta c騨g r蕋 mong nh� Ngi, ngi c� th� thay ta b竜 b譶h an cho ph� th﹏? Ta s� nhanh ch鉵g ho祅 th祅h c玭g vi謈 s� ph� giao ph�  v� 畂祅 t� v韎 ph� th﹏.",
			"Kh玭g ng� i s� huynh c騨g l� ngi con hi誹 th秓. Чi s� huynh c� y猲 t﹎,  s� chuy觧 l阨 c馻 huynh n Di謕 l穙, huynh c� y猲 t﹎ n C� Dng чng, nh璶g dng nh� ph竝 l鵦 c馻 Phi Thng Чo Nh﹏  t╪g r蕋 nhi襲, huynh ph秈 c萵 th薾.",
			"(C遪 n鱝 ta qu猲 b竜 v韎  Dng ti襫 b鑙 v� m鬰 ch nh藀 th� c馻 ph竔 ta.  t譵 玭g 蕐 n鉯 r� t譶h h譶h r錳 m韎 t韎 ch� Di謕 l穙 v藋.)",
			}
	else
		strTalk = {
			"Х l﹗ ta kh玭g li猲 l筩 g� v韎 ph� th﹏ � Ph鬾g Tng, l莕 trc <sex> c� nh綾 n ph� th﹏ � qu� nh� thng lo l緉g cho ta, b秐 th﹏ ta c騨g r蕋 mong nh� Ngi, <sex> c� th� thay ta b竜 b譶h an cho ph� th﹏? Ta s� nhanh ch鉵g ho祅 th祅h c玭g vi謈 s� ph� giao ph�  v� 畂祅 t� v韎 ph� th﹏.",
			"H鉧 ra Di謕 thi誹 hi謕 c騨g l� ngi con hi誹 th秓. Thi誹 hi謕 c� y猲 t﹎, ta s� chuy觧 l阨 n Di謕 l穙, huynh c� y猲 t﹎ n C� Dng чng, nh璶g dng nh� ph竝 l鵦 c馻 Phi Thng Чo Nh﹏  t╪g r蕋 nhi襲, huynh ph秈 c萵 th薾.",
			"(M鬰 ch nh藀 th� c馻 C玭 L玭  r� r祅g r錳, trc khi t韎 ch� Di謕 l穙 ch綾 ta n猲 甶 t譵  Dng ti襫 b鑙 n鉯 r� s� t譶h.)",
			}
	end

	TalkEx("",strTalk);

	--补发欧阳画对话触发器
	if GetTrigger(TALK_XB_OUYANGHUA) == 0 then
		CreateTrigger(4,210,TALK_XB_OUYANGHUA);
		TaskTip("m m鬰 ch nh藀 th� c馻 C玭 L玭 ph竔 n鉯 r� v韎  Dng ti襫 b鑙.");
		Msg2Player("m m鬰 ch nh藀 th� c馻 C玭 L玭 ph竔 n鉯 r� v韎  Dng ti襫 b鑙.");
	end

end

--尚未告知欧阳画昆仑入世一事因由与叶老对话补发欧阳画对话触发器
function task_025_04_2()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Kh玭g ng� C玭 L玭 nh藀 th� l筰 d蕐 l猲 nhi襲 nghi k� nh� v藋, vi謈 quan tr鋘g trc m総 l� ph秈 n g苝  Dng H鋋 b萴 r� ng鋘 ng祅h.",
			}
	else
		strTalk = {
			"Kh玭g ng� C玭 L玭 nh藀 th� l筰 d蕐 l猲 nhi襲 nghi k� nh� v藋, vi謈 quan tr鋘g trc m総 l� ph秈 n g苝  Dng H鋋 b萴 r� ng鋘 ng祅h.",
			}
	end

	TalkEx("",strTalk);

	--补发欧阳画对话触发器
	if GetTrigger(TALK_XB_OUYANGHUA) == 0 then
		CreateTrigger(4,210,TALK_XB_OUYANGHUA);
		TaskTip("Mau ch鉵g n鉯 r� nguy猲 do C玭 L玭 nh藀 th� v韎  Dng ti襫 b鑙.");
		Msg2Player("Mau ch鉵g n鉯 r� nguy猲 do C玭 L玭 nh藀 th� v韎  Dng ti襫 b鑙.");
	end

end


---------------------------------- 西北区26分支2_3非常道人----------------------------------
--告诉欧阳画昆仑入世一事因由

function task_026_01_0()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			" Dng ti襫 b鑙, m鬰 ch nh藀 th� c馻 C玭 L玭  r�, b譶h thng ch髇g t玦 ch� h祅g y猽 tr� ma � ch鑞 r鮪g s﹗, g莕 y do Trung Nguy猲 Giang T﹏ th玭 y猽 ma ho祅h h祅h, c� nguy c� lan sang c竎 th玭 l祅g l﹏ c薾, C玭 L玭 ph竔 m韎 xu蕋 hi謓 quanh v飊g Giang T﹏ th玭, khi課 c竎 bang ph竔 Trung Nguy猲 l莔 tng ch髇g t玦 c� ﹎ m璾, s� th藅 l� y猽 ma hi謓 th�, C玭 L玭 truy hung, i s� huynh Di謕 T� Thu c� d苙, n誹 C玭 L玭 g﹜ n猲 hi觰 l莔 g�. Xin b� qu� cho.",
			"Kh玭g ng� C玭 L玭 ph竔 tuy 輙 xu蕋 hi謓 tr猲 giang h� l筰 quan t﹎ n thi猲 h� b� t竛h nh� v藋, th藅 ng qu�. Ma qu� xu蕋 hi謓 quanh Giang T﹏ th玭  bi課 quanh v飊g th祅h qu� v鵦. C玭 L玭 gi髉 s鴆 l� 甶襲 ng qu�, ta s� cho b� c﹗ a th� n c竎 bang ph竔, ng nghi k� ngi c馻 C玭 L玭,  tr竛h nh鱪g tranh ch蕄 kh玭g ng c�.",
			"е t� C玭 L玭 產 ph莕 u chuy猲 t﹎ tu luy謓, t vi謈 tr秏 y猽 tr� ma l猲 h祅g u, 輙 khi tranh ch蕄 so 畂 c飊g ai, m鋓 ngi u mong 頲 chung s鑞g h遖 m鬰 v韎 c竎 bang ph竔 Trung Nguy猲.",
			}
	else
		strTalk = {
			" Dng ti襫 b鑙, m鬰 ch nh藀 th� c馻 C玭 L玭 ph竔  頲 l祄 r�. C玭 L玭 kh玭g ph秈 kh玭g h祅h t萿 Trung Nguy猲, ch� l� t藀 trung h祅g y猽 tr� ma � ch鑞 r鮪g s﹗. G莕 y Trung Nguy猲 Giang T﹏ th玭 y猽 ma ho祅h h祅h, c� nguy c� lan sang c竎 th玭 l祅g l﹏ c薾, C玭 L玭 ph竔 m韎 xu蕋 hi謓 quanh v飊g Giang T﹏ th玭, khi課 c竎 bang ph竔 Trung Nguy猲 l莔 tng ch髇g t玦 c� ﹎ m璾, s� th藅 l� y猽 ma hi謓 th�, C玭 L玭 truy hung, i s� huynh c� d苙, n誹 C玭 L玭 g﹜ n猲 hi觰 l莔 g�. Xin b� qu� cho.",
			"Kh玭g ng� C玭 L玭 ph竔 tuy 輙 xu蕋 hi謓 tr猲 giang h� l筰 quan t﹎ n thi猲 h� b� t竛h nh� v藋, th藅 ng qu�. Ma qu� xu蕋 hi謓 quanh Giang T﹏ th玭  bi課 quanh v飊g th祅h qu� v鵦. C玭 L玭 gi髉 s鴆 l� 甶襲 ng qu�, ta s� cho b� c﹗ a th� n c竎 bang ph竔, ng nghi k� ngi c馻 C玭 L玭,  tr竛h nh鱪g tranh ch蕄 kh玭g ng c�.",
			"е t� C玭 L玭 u chuy猲 t﹎ tu luy謓, t蕀 l遪g b竎 竔, ai ai c騨g t vi謈 tr秏 y猽 tr� ma l猲 u, l� m閠 m玭 ph竔 ng k輓h.",
			}
	end

	TalkEx("task_026_01_0_1",strTalk);

end

--续对话
function task_026_01_0_1()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Gian T� y猽 nghi謙 chuy猲 l祄 甶襲 竎 m� l筰 kh� di謙 tr�, ta ph秈 th玭g b竜 n c竎 bang ph竔, tr� gi髉 C玭 L玭 tr秏 y猽 tr� ma. Nay Чi T鑞g qu鑓 n筺 li猲 mi猲, v� l﹎ ng o ph秈 ng t﹎ hi謕 l鵦, m閠 l遪g gi誸 ch m韎 ph秈.",
			"Ti襫 b鑙 d箉 ph秈 l緈, chuy謓 c馻 C玭 L玭 ph竔 xin nh� ti襫 b鑙 n鉯 gi髉 cho. Ta c遪 c� vi謈. Xin c竜 t�.",
			"(Mong sao c竎 bang ph竔 Trung Nguy猲 ng l祄 kh� C玭 L玭. M玭 ph竔 ta m閠 l遪g tr� ma c鴘 th�, nh璶g l筰 b� hi觰 l莔 th� qu� l� kh玭g ng. Kh玭g bi誸 hi謓 gi� s鴆 kh醗 Di謕 l穙 th� n祇?)",
			}
	else
		strTalk = {
			"Gian T� y猽 nghi謙 chuy猲 l祄 甶襲 竎 m� l筰 kh� di謙 tr�, ta ph秈 th玭g b竜 n c竎 bang ph竔, tr� gi髉 C玭 L玭 tr秏 y猽 tr� ma. Nay Чi T鑞g qu鑓 n筺 li猲 mi猲, v� l﹎ ng o ph秈 ng t﹎ hi謕 l鵦, m閠 l遪g gi誸 ch m韎 ph秈.",
			"Ti襫 b鑙 d箉 ph秈 l緈, chuy謓 c馻 C玭 L玭 ph竔 xin nh� ti襫 b鑙 n鉯 gi髉 cho. Ta c遪 c� vi謈. Xin c竜 t�.",
			"(Mong sao c竎 bang ph竔 Trung Nguy猲 ng l祄 kh� C玭 L玭. M玭 ph竔 ta m閠 l遪g tr� ma c鴘 th�, nh璶g l筰 b� hi觰 l莔 th� qu� l� kh玭g ng. Kh玭g bi誸 hi謓 gi� s鴆 kh醗 Di謕 l穙 th� n祇?)",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_02,12);
	TaskTip("Thay Di謕 T� Thu n v蕁 an Di謕 l穙.");
	Msg2Player("Thay Di謕 T� Thu n v蕁 an Di謕 l穙.");

end

--代叶子秋向叶老报平安
function task_026_02_0()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ch祇 Di謕 l穙! Ngi v蒼 m筺h kh醗 ch�?",
			"Ch祇 <sex>! Sao r秐h t韎 th╩ ta v藋? C竔 th﹏ gi� n祔 v蒼 kh醗, nh璶g g莕 y th阨 ti誸 th蕋 thng, khi課 ta th蕄 th醡 kh玭g y猲. <sex> n y c� vi謈 g�?",
			"Di謕 s� huynh n鉯 l穙 m閠 m譶h s鑞g t筰 Ph鬾g Tng, n猲 r蕋 mong nh�, nh� ta n b竜 v韎 l穙, nhi謒 v� c馻 s� ph� giao cho  s緋 ho祅 th祅h, s� nhanh ch鉵g tr� v� 畂祅 t� v韎 l穙. Xin ng lo l緉g qu�.",
			"Ra l� v藋, ta c騨g 產ng nh h醝 th╩ n� y. Kh玭g bi誸 s� ph� c竎 ngi giao nhi謒 v� g� m� n gi� n� v蒼 ch璦 xong. S� vi謈 c� kh� kh╪ l緈 kh玭g? Ch綾 l� v� n� kh玭g  s鴆 g竛h v竎 r錳.",
			"Kh玭g u, kh玭g u, s� vi謈 l莕 n祔 r蕋 ph鴆 t筽, Di謕 s� huynh tu鎖 tr� t礽 cao, l筰 c� ch� l韓, phen n祔 n C� Dng чng ch綾 ch緉 s� ho祅 th祅h nhi謒 v� 頲 giao.",
			"C竔� c竔 g�? C鎱 C� Dng чng� N� ph秈 n C� Dng чng th藅 sao?",
			}
	else
		strTalk = {
			"Ch祇 Di謕 l穙! Ngi v蒼 m筺h kh醗 ch�?",
			"Ch祇 <sex>! Sao r秐h t韎 th╩ ta v藋? C竔 th﹏ gi� n祔 v蒼 kh醗, nh璶g g莕 y th阨 ti誸 th蕋 thng, khi課 ta th蕄 th醡 kh玭g y猲. <sex> n y c� vi謈 g�?",
			"G莕 y ta v� Di謕 T� Thu - con c馻 Di謕 l穙 kh� th﹏, nghe huynh 蕐 nh綾 l穙 產ng s鑞g � Ph鬾g Tng, r蕋 nh� mong l穙, n猲  nh� ta n nh緉 v礽 l阨, nhi謒 v� m� s� ph� huynh 蕐 giao ph�  s緋 ho祅 th祅h, s� nhanh ch鉵g tr� v� 畂祅 t� v韎 l穙. Mong l穙 ng thng nh� qu�.",
			"Ra l� v藋, ta c騨g 產ng nh h醝 <sex> v� ti觰 nhi y. Kh玭g bi誸 s� ph� n� giao nhi謒 v� g� m� n gi� v蒼 ch璦 l祄 xong. S� vi謈 c� kh� kh╪ l緈 kh玭g? Ch綾 l� v� n� kh玭g  s鴆 g竛h v竎.",
			"Kh玭g u, kh玭g u, s� vi謈 l莕 n祔 r蕋 ph鴆 t筽, Di謕 thi誹 hi謕 tu鎖 tr� t礽 cao, l筰 c� ch� l韓, phen n祔 n C� Dng чng ch綾 ch緉 s� ho祅 th祅h nhi謒 v� 頲 giao.",
			"C竔� c竔 g�? C鎱 C� Dng чng� N� ph秈 n C� Dng чng th藅 sao?",
			}
	end

	TalkEx("task_026_02_0_1",strTalk);

end

--续对话
function task_026_02_0_1()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Di謕 l穙 h穣 b秓 tr鋘g, ng n猲 lo l緉g qu�. Chuy謓 g� v藋? C� ph秈 C� Dng чng l� n琲 r蕋 nguy hi觤? ",
			"Kh玭g� kh玭g 頲  n� n C� Dng чng, tuy謙 i kh玭g 頲  n� n C� Dng чng,  n  r錳 th� kh玭g tr� ra 頲 n鱝.",
			"Di謕 l穙 xin h穣 b譶h t躰h. Di謕 s� huynh l� i  t� C玭 L玭, v� c玭g cao cng, Di謕 l穙 ng qu� lo l緉g. Ph秈 ch╪g C� Dng чng c� 甶襲 g� b蕋 thng?",
			"<sex> kh玭g bi誸  th玦, nhi襲 n╩ trc y C� Dng чng  n鎖 ti課g l� n琲 hi觤 竎, l� m閠 n琲 ch誸 ngi. Х t鮪g c� ngi o 1 v藅 s竛g l蕄 l竛h v� b� n l� v祅g, thu h髏 r蕋 nhi襲 ngi n xem v� o b韎. V� sau ngi tham gia o c祅g ng祔 輙 甶 v� m閠 甶 kh玭g tr� l筰. T�  truy襫 r籲g kho b竨 c馻 C� Dng чng c� d� th� tr蕁 gi�, nh鱪g k� tham lam u ph秈 b� m筺g v� n琲 y b� b� hoang t� .",
			}
	else
		strTalk = {
			"Di謕 l穙 h穣 b秓 tr鋘g, ng n猲 lo l緉g qu�. Chuy謓 g� v藋? C� ph秈 C� Dng чng l� n琲 r蕋 nguy hi觤? ",
			"Kh玭g� kh玭g 頲  n� n C� Dng чng, tuy謙 i kh玭g 頲  n� n C� Dng чng,  n  r錳 th� kh玭g tr� ra 頲 n鱝.",
			"Di謕 l穙 xin h穣 b譶h t躰h. Di謕 s� huynh l� i  t� C玭 L玭, v� c玭g cao cng, Di謕 l穙 ng qu� lo l緉g. Ph秈 ch╪g C� Dng чng c� 甶襲 g� b蕋 thng?",
			"<sex> kh玭g bi誸  th玦, nhi襲 n╩ trc y C� Dng чng  n鎖 ti課g l� n琲 hi觤 竎, l� m閠 n琲 ch誸 ngi. Х t鮪g c� ngi o 1 v藅 s竛g l蕄 l竛h v� b� n l� v祅g, thu h髏 r蕋 nhi襲 ngi n xem v� o b韎. V� sau ngi tham gia o c祅g ng祔 輙 甶 v� m閠 甶 kh玭g tr� l筰. T�  truy襫 r籲g kho b竨 c馻 C� Dng чng c� d� th� tr蕁 gi�, nh鱪g k� tham lam u ph秈 b� m筺g v� n琲 y b� b� hoang t� .",
			}
	end

	TalkEx("task_026_02_0_2",strTalk);

end

--续对话
function task_026_02_0_2()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Tin n b猲 trong C� Dng чng c� d� th� kh緋 thi猲 h� ai ai c騨g bi誸, ta  t鮪g n ng 蕐, nh璶g ch璦 t鮪g th蕐 d� th� n祇 c�.",
			"D� th� l� c� th藅 y. Th藅 ra T� Thu c遪 c� m閠 huynh trng song sinh, l骳 nh� do b蕋 c萵 l筩 v祇 C� Dng чng, t�  kh玭g th蕐 tr� ra, e l�  ch誸 di m鉵g vu鑤 d� th�. V� ta m蕋 s韒, c遪 l筰 ta v� T� Thu s鑞g nng t鵤 nhau. Nam nhi ch� t筰 b鑞 phng, n� � C玭 L玭 ph竔 l祄 n猲 c� nghi謕, ta r蕋 m鮪g, nh璶g tuy謙 i kh玭g 頲 b衝 m秐g n C� Dng чng.",
			"Di謕 l穙 y猲 t﹎, Di謕 s� huynh v� c玭g cao cng, 総 s� g苝 d� h鉧 l祅h. Hay  ta n  t譵 huynh 蕐 xem c� gi髉 頲 g� kh玭g, v� c騨g  Di謕 l穙 y猲 t﹎.",
			" t� <sex>, 產 t� <sex>, c� <sex> gi髉 s鴆 th� ta y猲 t﹎ h琻. Xin ng n鉯 v韎 n� chuy謓 huynh  song sinh trong C� Dng чng,  tr竛h ph﹏ t﹎ m� l� vi謈. R蕋 bi誸 琻 <sex>  gi髉  cho con ta.",
			"Di謕 l穙 ng kh竎h s竜, c騨g ng lo l緉g qu�, ta nh蕋 nh s� d鑓 s鴆 gi髉  Di謕 s� huynh. Xin c竜 t�.",
			}
	else
		strTalk = {
			"Tin n b猲 trong C� Dng чng c� d� th� kh緋 thi猲 h� ai ai c騨g bi誸, ta  t鮪g n ng 蕐, nh璶g ch璦 t鮪g th蕐 d� th� n祇 c�.",
			"D� th� l� c� th藅 y. Th藅 ra T� Thu c遪 c� m閠 huynh trng song sinh, l骳 nh� do b蕋 c萵 l筩 v祇 C� Dng чng, t�  kh玭g th蕐 tr� ra, e l�  ch誸 di m鉵g vu鑤 d� th�. V� ta m蕋 s韒, c遪 l筰 ta v� T� Thu s鑞g nng t鵤 nhau. Nam nhi ch� t筰 b鑞 phng, n� � C玭 L玭 ph竔 l祄 n猲 c� nghi謕, ta r蕋 m鮪g, nh璶g tuy謙 i kh玭g 頲 b衝 m秐g n C� Dng чng.",
			"Di謕 l穙 y猲 t﹎, Di謕 thi誹 hi謕 v� c玭g cao cng, 総 s� g苝 d� h鉧 l祅h. Hay  ta n  t譵 huynh 蕐 xem c� gi髉 頲 g� kh玭g, v� c騨g  Di謕 l穙 y猲 t﹎.",
			" t� <sex>, 產 t� <sex>, c� <sex> gi髉 s鴆 th� ta y猲 t﹎ h琻. Xin ng n鉯 v韎 n� chuy謓 huynh  song sinh trong C� Dng чng,  tr竛h ph﹏ t﹎ m� l� vi謈. R蕋 bi誸 琻 <sex>  gi髉  cho con ta.",
			"Di謕 l穙 ng kh竎h s竜, c騨g ng lo l緉g qu�, ta nh蕋 nh s� d鑓 s鴆 gi髉  Di謕 thi誹 hi謕. Xin c竜 t�.",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_02,13);
	TaskTip("Nh薾 l阨 駓 th竎 c馻 Di謕 l穙, n gi髉  Di謕 T� Thu.");
	Msg2Player("Nh薾 l阨 駓 th竎 c馻 Di謕 l穙, n gi髉  Di謕 T� Thu.");
	GivePlayerAward("Award_XB_60","Easy");
	GivePlayerExp(SkeyXibei,"zaihuiyenao")
end

--未与叶子秋对话与叶老对话
function task_026_02_1()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			" t� <sex>, 產 t� <sex>, c� <sex> gi髉 s鴆 th� ta y猲 t﹎ h琻. Xin ng n鉯 v韎 n� chuy謓 huynh  song sinh trong C� Dng чng,  tr竛h ph﹏ t﹎ m� l� vi謈. R蕋 bi誸 琻 <sex>  gi髉  cho con ta.",
			}
	else
		strTalk = {
			" t� <sex>, 產 t� <sex>, c� <sex> gi髉 s鴆 th� ta y猲 t﹎ h琻. Xin ng n鉯 v韎 n� chuy謓 huynh  song sinh trong C� Dng чng,  tr竛h ph﹏ t﹎ m� l� vi謈. R蕋 bi誸 琻 <sex>  gi髉  cho con ta.",
			}
	end

	TalkEx("",strTalk);

end

--受叶老所托与叶子秋对话
function task_026_03_0()

local strTalk = {};

	--等级限制
	if GetLevel() < 85 then
		if GetPlayerRoute() == 100 then
			strTalk = {
				"Цng ti誧 c玭g l鵦 c馻 ngi c遪 y誹, b籲g kh玭g thu ph鬰 t猲 ph秐  C玭 L玭 Phi Thng Чo Nh﹏ nh蕋 nh ph秈 nh� n s� gi髉  c馻 ngi."
				}
		else
			strTalk = {
				"Di謕 T� Thu: Цng ti誧 <sex> v� c玭g c遪 k衜, ch璦 t n {c蕄 85}. N誹 thu ph鬰 {Чo nh﹏} n祔 nh蕋 nh ph秈 t譵 ngi gi髉  r錳."
				}
		end
		TalkEx("",strTalk);
		return
	end

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Sao i s� huynh l筰 b� thng? Thng t輈h c� n苙g l緈 kh玭g?",
			"V誸 thng kh玭g ng ng筰. Ta v� nh蕋 th阨 s� �  Phi Thng Чo Nh﹏ d蒼 d� v祇 s﹗ trong ng, b� c竎 ma v藅 頲 h緉 thu ph鬰 t蕁 c玭g, kh� kh╪ l緈 m韎 tho竧 ra 頲 nh璶g v蒼 b� b鋘 y猽 v藅 l祄 b� thng. Phi Thng Чo Nh﹏  thu ph鬰 m閠 lng l韓 y猽 v藅, h緉 ch輓h l� k�  kh鑞g ch� Oan H錸 Vng v� C� L﹗ Vng. H緉 ch� d飊g y猽 v藅 m� kh玭g hi謓 th﹏, ta e vi謈 thu ph鬰 C� Dng Th�  n giai 畂筺 quy誸 nh.",
			"S� huynh ph秈 b秓 tr鋘g, m韎 c� th� d鑓 s鴆 gi誸 ch. е  chuy觧 l阨 c馻 huynh n Di謕 l穙, Ngi r蕋 m筺h kh醗, huynh kh玭g c莕 ph秈 lo l緉g. S� huynh, C� Dng Th� c� th藅 s� t錸 t筰 kh玭g?",
			"C� Dng Th� l� c� th藅, tuy b猲 ngo礽 c� nhi襲 l阨 n, nh璶g s� ph�  t鮪g c� � nh thu ph鬰 ch髇g, sau ph竧 hi謓 C� Dng Th� ch� t蕁 c玭g nh鱪g k� x﹎ nh藀 v祇 trong ng, l蕐 ng kh萿 l祄 ranh gi韎, tuy謙 nhi猲 kh玭g c� � ra ngo礽. Thi猲 h� v筺 v藅 u c� linh kh�, quy lu藅 t� nhi猲 kh玭g n猲 b� ph� v� b雐 � ngh躠 c馻 con ngi, n誹 ma v藅 kh玭g ra kh醝 ng l祄 h筰 ngi, th� con ngi kh玭g c莕 ph秈 畊鎖 c飊g di謙 t薾. Ch輓h v� th� s� ph�  th玦 � nh thu ph鬰 C� Dng Th�. Kh玭g ng� Phi Thng Чo Nh﹏ t﹎ thu藅 b蕋 ch輓h, v� l頸 輈h c馻 b秐 th﹏, b� ngo礽 tai s� s鑞g c遪 c馻 b� t竛h, quy誸 thu ph鬰 cho b籲g 頲.",
			}
	else
		strTalk = {
			"Sao thi誹 hi謕 l筰 b� thng? Thng t輈h c� n苙g l緈 kh玭g?",
			"<sex> y猲 t﹎, v誸 thng kh玭g ng ng筰. Ta v� nh蕋 th阨 s� �  Phi Thng Чo Nh﹏ d蒼 d� v祇 s﹗ trong ng, b� c竎 ma v藅 頲 h緉 thu ph鬰 t蕁 c玭g, kh� kh╪ l緈 m韎 tho竧 ra 頲 nh璶g v蒼 b� b鋘 y猽 v藅 l祄 b� thng. Phi Thng Чo Nh﹏  thu ph鬰 m閠 lng l韓 y猽 v藅, h緉 ch輓h l� k�  kh鑞g ch� Oan H錸 Vng v� C� L﹗ Vng. H緉 ch� d飊g y猽 v藅 m� kh玭g hi謓 th﹏, ta e vi謈 thu ph鬰 C� Dng Th�  n giai 畂筺 quy誸 nh.",
			"Thi誹 hi謕 ph秈 b秓 tr鋘g, m韎 c� th� d鑓 s鴆 gi誸 ch. Ta  chuy觧 l阨 c馻 thi誹 hi謕 n Di謕 l穙, Ngi r蕋 m筺h kh醗, thi誹 hi謕 ch� lo. Xin h醝 thi誹 hi謕, C� Dng Th� c� th藅 hay kh玭g?",
			"C� Dng Th� l� c� th藅, tuy b猲 ngo礽 c� nhi襲 l阨 n, nh璶g s� ph�  t鮪g c� � nh thu ph鬰 ch髇g, sau ph竧 hi謓 C� Dng Th� ch� t蕁 c玭g nh鱪g k� x﹎ nh藀 v祇 trong ng, l蕐 ng kh萿 l祄 ranh gi韎, tuy謙 nhi猲 kh玭g c� � ra ngo礽. Thi猲 h� v筺 v藅 u c� linh kh�, quy lu藅 t� nhi猲 kh玭g n猲 b� ph� v� b雐 � ngh躠 c馻 con ngi, n誹 ma v藅 kh玭g ra kh醝 ng l祄 h筰 ngi, th� con ngi kh玭g c莕 ph秈 畊鎖 c飊g di謙 t薾. Ch輓h v� th� s� ph�  th玦 � nh thu ph鬰 C� Dng Th�. Kh玭g ng� Phi Thng Чo Nh﹏ t﹎ thu藅 b蕋 ch輓h, v� l頸 輈h c馻 b秐 th﹏, b� ngo礽 tai s� s鑞g c遪 c馻 b� t竛h, quy誸 thu ph鬰 cho b籲g 頲.",
			}
	end

	TalkEx("task_026_03_0_1",strTalk);

end

--续对话
function task_026_03_0_1()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"M閠 khi C� Dng Th� b� thu ph鬰 s� l� i h鋋 cho thi猲 h�, l� ki誴 n筺 c馻 b� t竛h, b籲g m鋓 gi� ph秈 di謙 tr� Phi Thng Чo Nh﹏. S� huynh h穣 y猲 t﹎ tu dng,  s� thay huynh 甶 thu ph鬰 Phi Thng Чo Nh﹏.",
			"Sao? Phi Thng Чo Nh﹏ ph竝 l鵦 cao cng, nh璶g hi謓 nay h緉 產ng t藀 trung thu ph鬰 C� Dng Th�, 総 s� b� ph﹏ t﹎, h琻 n鱝 c竎 ma v藅 m� h緉 thu ph鬰 頲 u  b� ta ti猽 di謙 c� r錳, gi� ch輓h l� th阨 c� t鑤 nh蕋  tr� kh� h緉. Th玦 頲, vi謈 n祔 s� giao cho ,  ph秈 h誸 s鴆 c萵 th薾, Phi Thng Чo Nh﹏ d� g� c騨g l� s� b� c馻 ch髇g ta, ch璦 k� h緉 c遪 c� c﹗ k誸 v韎 T﹜ V鵦.",
			"S� huynh y猲 t﹎,  bi誸 m譶h ph秈 l祄 g�. Huynh c� y猲 t﹎ dng thng.",
			}
	else
		strTalk = {
			" M閠 khi C� Dng Th� b� thu ph鬰 s� l� i h鋋 cho thi猲 h�, l� ki誴 n筺 c馻 b� t竛h, di謙 tr� Phi Thng Чo Nh﹏  kh玭g c遪 l� vi謈 thanh l� m玭 h� c馻 C玭 L玭, m� l� tr竎h nhi謒 c馻 to祅 thi猲 h�. Thi誹 hi謕 c� y猲 t﹎ tu dng, vi謈 thu ph鬰 Phi Thng Чo Nh﹏ c� giao cho ta.",
			"Sao ta c� th� l祄 phi襫 <sex> 頲? <sex>  gi髉 C玭 L玭 ta r蕋 nhi襲 r錳, n誹 l莕 n祔 c遪  <sex> ph秈 m筼 hi觤 th� th藅 竬 n竬 qu�.",
			"Xin ch� n鉯 v藋. Ta di謙 tr� Phi Thng Чo Nh﹏ l� v� b� t竛h trong thi猲 h�, kh玭g ph秈 gi髉 C玭 L玭 thanh l� m玭 h�, thi誹 hi謕 c� y猲 t﹎, ta s� c萵 th薾 khi i ph� v韎 Phi Thng Чo Nh﹏.",
			"Ta bi誸 ph秈 n鉯 g� trc t蕀 l遪g hi謕 ngh躠 c馻 <sex>, T� Thu xin 產 t� 琻 tng tr� c馻 <sex>. Phi Thng Чo Nh﹏ c遪 c� c﹗ k誸 v韎 T﹜ H�, c莕  cao c秐h gi竎.",
			}
	end

	SetTask(TASK_XB_ID_02,14);
	TalkEx("",strTalk);
	TaskTip("дn t莕g m閠 C� Dng чng gi髉 Di謕 T� Thu nh b筰 Phi Thng Чo Nh﹏.");
	Msg2Player("дn t莕g m閠 C� Dng чng gi髉 Di謕 T� Thu nh b筰 Phi Thng Чo Nh﹏.");

end

--未打倒非常道人对话
function task_026_03_1()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Phi Thng Чo Nh﹏ d� g� c騨g l� s� b� c馻 ch髇g ta, l筰 c遪 c﹗ k誸 v韎 T﹜ V鵦,  ph秈 h誸 s鴆  ph遪g.",
			}
	else
		strTalk = {
			"T� Thu xin 產 t� 琻 tng tr� c馻 <sex>. Phi Thng Чo Nh﹏ c遪 c� c﹗ k誸 v韎 T﹜ H�, c莕  cao c秐h gi竎.",
			}
	end

	TalkEx("",strTalk);

end

---------------------------------- 西北区27分支2_4古阳异兽----------------------------------
--打倒非常道人后与叶子秋对话
function task_027_01_0()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"е v� r錳 y �, ta c� lo l緉g cho s� an nguy c馻 .",
			" t� s� quan t﹎ c馻 i s� huynh, Phi Thng Чo Nh﹏  b� ch� ph鬰, nh璶g tr猲 ngi h緉  t譵 th蕐 m穘h v鬾 c馻 Кn dc Th莕 b�, kh玭g bi誸 c� c玭g d鬾g g�. Ngo礽 ra c遪 c� m藅 th� trao i v韎 T﹜ H�, m鋓 ﹎ m璾 u c� c� trong th� n祔.",
			"Qu� nhi猲 Phi Thng Чo Nh﹏ c� c﹗ k誸 v韎 T﹜ H�, mau a m藅 th� cho ta xem. H�, v� ham mu鑞 c� nh﹏ m� b� m芻 ﹏ o竛 nc nh�, T﹜ H� v鑞 lu玭 ch鵦 ch� chi誱 l躰h Trung Nguy猲, Phi Thng Чo Nh﹏ l筰 mu鑞 mn th� l鵦 c馻 ch髇g  nh C玭 L玭, ch糿g ph秈  v� t譶h gi髉 T﹜ H� 頲 th醓 nguy謓  sao? T猲 n祔 th藅 qu� hi觤 竎. Trong th� c� nh綾 ch� c莕 ba ng祔 l� c� th� thu ph鬰 C� Dng Th�,  � C� Dng чng c� th蕐 C� Dng Th� kh玭g?",
			"� trong ng  kh玭g th蕐 con C� Dng Th� n祇 c�, ch� th蕐 Phi Thng Чo Nh﹏ 產ng 甶 tr� ra, tr猲 ngi 甧m theo r蕋 nhi襲 Phi Thng o ph�, ch綾 l� d飊g  h� th﹏ trong l骳 thu ph鬰 y猽 v藅. Th� l�   ch苙 阯g h緉.",
			}
	else
		strTalk = {
			"<sex> v� r錳 sao? Ta c� lo cho s� an nguy c馻 <sex>.",
			" t� s� quan t﹎ c馻 thi誹 hi謕, Phi Thng Чo Nh﹏  b� ch� ph鬰, nh璶g tr猲 ngi h緉 ta t譵 頲 m穘h v鬾 c馻 Кn dc Th莕 b�, kh玭g bi誸 c� c玭g d鬾g g�. Ngo礽 ra c遪 c� m藅 th� trao i v韎 T﹜ H�, m鋓 ﹎ m璾 u c� c� trong th� n祔.",
			"Qu� nhi猲 Phi Thng Чo Nh﹏ c� c﹗ k誸 v韎 T﹜ H�, mau a m藅 th� cho ta xem. H�, v� ham mu鑞 c� nh﹏ m� b� m芻 ﹏ o竛 nc nh�, T﹜ H� v鑞 lu玭 ch鵦 ch� chi誱 l躰h Trung Nguy猲, Phi Thng Чo Nh﹏ l筰 mu鑞 mn th� l鵦 c馻 ch髇g  nh C玭 L玭, ch糿g ph秈  v� t譶h gi髉 T﹜ H� 頲 th醓 nguy謓  sao? T猲 n祔 th藅 qu� hi觤 竎. Trong th� c� nh綾 ch� c莕 ba ng祔 l� c� th� thu ph鬰 C� Dng Th�,  � C� Dng чng c� th蕐 C� Dng Th� kh玭g?",
			"� trong ng  kh玭g th蕐 con C� Dng Th� n祇 c�, ch� th蕐 Phi Thng Чo Nh﹏ 產ng 甶 tr� ra, tr猲 ngi 甧m theo r蕋 nhi襲 Phi Thng o ph�, ch綾 l� d飊g  h� th﹏ trong l骳 thu ph鬰 y猽 v藅. Th� l�   ch苙 阯g h緉.",
			}
	end

	TalkEx("task_027_01_0_1",strTalk);

end

--续对话
function task_027_01_0_1()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"(Phi Thng Чo Nh﹏ c蕌 k誸 v韎 T﹜ H�,  b� ta di謙 tr�, nh璶g n誹 T﹜ H� l筰 cho ngi n t譵 Phi Thng Чo Nh﹏ th� th﹏ ph薾 c馻 ta s� b筰 l�. Ch綾 ch緉 T﹜ H� v� mu鑞 c� 頲 Trng Sinh B蕋 T� n m韎 gi髉 Phi Thng Чo Nh﹏ t蕁 c玭g C玭 L玭, vi謈 n祔 bi誸 x� tr� ra sao y? Trc h誸 n猲 ph鉵g i s� nguy hi觤 c馻 C� Dng чng v� uy l鵦 c馻 C� Dng Th� v韎 Nh蕋 Ph萴 Л阯g  tranh th� th猰 ch髏 th阨 gian.)",
			"Xem ra th阨 h筺 ba ng祔 頲 nh綾 n trong th� l� th藅, b籲g kh玭g Phi Thng Чo Nh﹏ c騨g kh玭g c莕 v閕 v祅g 甶 t譵 y猽 v藅 h� th﹏. Nh鱪g m秐h v鬾 Kim n n祔 tr玭g gi鑞g H醓 Luy謓 Kim n, khi ma v藅 d飊g Kim n n祔 頲 49 ng祔, n� s� ph竧 huy t竎 d鬾g khi課 ch髇g ph鬰 t飊g m謓h l謓h c馻 ngi cho thu鑓. Ngo礽 ra sau khi d飊g n dc n祔, uy l鵦 c馻 ma v藅 s� t╪g g蕄 tr╩ l莕. ",
			"Theo b鴆 th� n祔, C� Dng Th�  頲 d飊g thu鑓 n ng祔 th� 46, n誹 kh玭g ti誴 t鬰 th� k誸 qu� s� nh� th� n祇?",
			}
	else
		strTalk = {
			"(Phi Thng Чo Nh﹏ c蕌 k誸 v韎 T﹜ H�,  b� ta di謙 tr�, nh璶g n誹 T﹜ H� l筰 cho ngi n t譵 Phi Thng Чo Nh﹏ th� th﹏ ph薾 c馻 ta s� b筰 l�. Ch綾 ch緉 T﹜ H� v� mu鑞 c� 頲 Trng Sinh B蕋 T� n m韎 gi髉 Phi Thng Чo Nh﹏ t蕁 c玭g C玭 L玭, vi謈 n祔 bi誸 x� tr� ra sao y? Trc h誸 n猲 ph鉵g i s� nguy hi觤 c馻 C� Dng чng v� uy l鵦 c馻 C� Dng Th� v韎 Nh蕋 Ph萴 Л阯g  tranh th� th猰 ch髏 th阨 gian.)",
			"Xem ra th阨 h筺 ba ng祔 頲 nh綾 n trong th� l� th藅, b籲g kh玭g Phi Thng Чo Nh﹏ c騨g kh玭g c莕 v閕 v祅g 甶 t譵 y猽 v藅 h� th﹏. Nh鱪g m秐h v鬾 Kim n n祔 tr玭g gi鑞g H醓 Luy謓 Kim n, khi ma v藅 d飊g Kim n n祔 頲 49 ng祔, n� s� ph竧 huy t竎 d鬾g khi課 ch髇g ph鬰 t飊g m謓h l謓h c馻 ngi cho thu鑓. Ngo礽 ra sau khi d飊g n dc n祔, uy l鵦 c馻 ma v藅 s� t╪g g蕄 tr╩ l莕. ",
			"Theo b鴆 th� n祔, C� Dng Th�  頲 d飊g thu鑓 n ng祔 th� 46, n誹 kh玭g ti誴 t鬰 th� k誸 qu� s� nh� th� n祇?",
			}
	end

	TalkEx("task_027_01_0_2",strTalk);

end

--续对话
function task_027_01_0_2()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Vi謈 n祔 ta c騨g kh玭g r� l緈, ph秈 h醝 s� ph� m韎 頲. Nh璶g trc m総 l� ph秈 nhanh ch鉵g gi秈 tr� Kim n chi l鵦, mu鑞 v藋 c莕 ph秈 nh� n ngu錸 s鴆 m筺h tng kh綾 v韎 d� th�. T莕g 2 C� Dng чng c� hai d� v藅 l� X輈h Luy謓 H醓 H� v� Li謙 Nham Ly Long, ch髇g c� th� chung s鑞g v韎 C� Dng Th�, ch綾 h糿 c騨g c� kh� n╪g 鴆 ch� n�. е h穣 n t莕g 2 C� Dng чng l蕐 10 畊玦 H醓 H� v�  10 Ly Long Tu, i ta h醝 r� s� ph�, l祄 T醓 Y猽 Ph� c� th� x鉧 dc l鵦 c馻 Kim n.",
			"V藋 th� t鑤 qu�, nh璶g kh玭g bi誸 t譶h h譶h C� Dng Th� ra sao, ch髇g c� n秠 sinh d� bi課 sau khi d飊g Kim n hay kh玭g?",
			"Vi謈 n祔 c騨g ng lo l緈,  ta t譵 m閠  t� ng tin c藋 n C� Dng чng t筸 th阨 phong 蕁 C� Dng Th�, m閠 l�  ng╪ ch苙 d� bi課, hai l� tranh th� th阨 gian. Vi謈 kh玭g th� ch薽 tr�, ta chia nhau ra h祅h s�.",
			"T鑤, v藋  s� n t莕g 2 C� Dng чng trc y.",
			}
	else
		strTalk = {
			"Vi謈 n祔 ta c騨g kh玭g r� l緈, ph秈 h醝 s� ph� m韎 頲. Nh璶g trc m総 l� ph秈 nhanh ch鉵g gi秈 tr� Kim n chi l鵦, mu鑞 v藋 c莕 ph秈 nh� n ngu錸 s鴆 m筺h tng kh綾 v韎 d� th�. T莕g 2 C� Dng чng c� hai d� v藅 l� X輈h Luy謓 H醓 H� v� Li謙 Nham Ly Long, ch髇g c� th� chung s鑞g v韎 C� Dng Th�, ch綾 h糿 c騨g c� kh� n╪g 鴆 ch� n�. е h穣 n t莕g 2 C� Dng чng l蕐 10 畊玦 H醓 H� v�  10 Ly Long Tu, i ta h醝 r� s� ph�, l祄 T醓 Y猽 Ph� c� th� x鉧 dc l鵦 c馻 Kim n.",
			"V藋 th� t鑤 qu�, nh璶g kh玭g bi誸 t譶h h譶h C� Dng Th� ra sao, ch髇g c� n秠 sinh d� bi課 sau khi d飊g Kim n hay kh玭g?",
			"Vi謈 n祔 c騨g ng lo l緈,  ta t譵 m閠  t� ng tin c藋 n C� Dng чng t筸 th阨 phong 蕁 C� Dng Th�, m閠 l�  ng╪ ch苙 d� bi課, hai l� tranh th� th阨 gian. Vi謈 kh玭g th� ch薽 tr�, ta chia nhau ra h祅h s�.",
			"T鑤, v藋  s� n t莕g 2 C� Dng чng trc y.",
			}
	end

	TalkEx("",strTalk);
	DelItem(2,0,700,1);--火炼金丹碎片
	DelItem(2,0,701,1);--西夏密信
	SetTask(TASK_XB_ID_02,16);
	CreateTrigger(0,1239,KILL_XB_LIEYANCHILONG);--裂岩螭龙杀怪触发器
	CreateTrigger(0,1240,KILL_XB_CHILIANHUOHU);--赤炼火狐杀怪触发器
	TaskTip("дn t莕g 2 C� Dng чng t譵 10 Ly Long Tu v� 畊玦 H醓 H�.");
	Msg2Player("дn t莕g 2 C� Dng чng t譵 10 Ly Long Tu v� 畊玦 H醓 H�.");
	GivePlayerAward("Award_XB_61","Easy");
	GivePlayerExp(SkeyXibei,"feichangdaoren")
end

--收集或未收集到10根火狐尾与螭龙须
function task_027_02_0()

local strTalk = {};

	--带回物品
	if GetItemCount(2,0,702) >= 10 and GetItemCount(2,0,703) >= 10 then

		--昆仑派弟子对话
		if GetPlayerRoute() == 100 then
			strTalk = {
				"Чi s� huynh, y l� 10 畊玦 H醓 H� v� 10 Ly Long Tu, huynh c� h醝 頲 c竎h gi秈 tr� t竎 d鬾g c馻 Kim n ch璦?",
				"Ta  h醝 r� s� ph� r錳, n誹 ma v藅 d飊g H醓 Luy謓 Kim n ch璦  49 ng祔 m�  ng鮪g l筰, ma v藅 総 s� c� d� bi課, s鴆 m筺h c馻 Kim n s� l祄 b閏 ph竧 ma t輓h. C� Dng Th� v鑞 kh玭g ra kh醝 ng, e l� l莕 n祔 v韎 t竎 d鬾g c馻 Kim n ch髇g s� vt qua ranh gi韎, h藆 qu� kh玭 lng. е t� m� ta ph竔 甶 ch綾 c騨g kh玭g ch鑞g  頲 l﹗, ta s� ch� T醓 Y猽 Ph� cho  ngay.",
				"C� Dng Th� ch綾  xu蕋 hi謓 d� bi課, kh玭g bi誸 v� s� huynh n phong 蕁 ch髇g c� 頲 an to祅 kh玭g?",
				"е y猲 t﹎,  t� ta ph竔 甶 c� th鮝 n╪g l鵦 phong 蕁 C� Dng Th�. е ph秈 h誸 s鴆 th薾 tr鋘g, uy l鵦 c馻 C� Dng Th� v鑞  m筺h, nay l筰 c� th猰 t竎 d鬾g c馻 Kim n, c祅g kh玭g d� i ph�. T醓 Y猽 Ph� n祔 c� th� gi髉  gi秈 tr� t竎 d鬾g c馻 Kim n trong c� th� C� Dng Th�, nh� v藋 s� nh� g竛h cho  h琻. е c� th� 甧m theo Уo M閏 Ki誱 c馻 ta 甶 c飊g, a n� cho  t� 產ng tr蕁 gi� t筰 , v� s� vi謈 h� tr鋘g, ta  c╪ d苙 kh玭g 頲 nh� d� tin ai h誸.",
				"Nh� v藋 l� t鑤. Chuy謓 kh玭g th� ch薽 tr�, n誹 C� Dng Th� x玭g ra th� gay go.",
				}
		else
			strTalk = {
				"Thi誹 hi謕, y l� 10 畊玦 H醓 H� v� 10 Ly Long Tu, thi誹 hi謕 c� h醝 頲 c竎h gi秈 tr� t竎 d鬾g c馻 Kim n ch璦?",
				"Ta  h醝 r� s� ph� r錳, n誹 ma v藅 d飊g H醓 Luy謓 Kim n ch璦  49 ng祔 m�  ng鮪g l筰, ma v藅 総 s� c� d� bi課, s鴆 m筺h c馻 Kim n s� l祄 b閏 ph竧 ma t輓h. C� Dng Th� v鑞 kh玭g ra kh醝 ng, e l� l莕 n祔 v韎 t竎 d鬾g c馻 Kim n ch髇g s� vt qua ranh gi韎, h藆 qu� kh玭 lng. е t� m� ta ph竔 甶 ch綾 c騨g kh玭g ch鑞g  頲 l﹗, ta s� ch� T醓 Y猽 Ph� cho  ngay.",
				"C� Dng Th� ch綾  xu蕋 hi謓 d� bi課,  t� 頲 ph竔 n phong 蕁 ch髇g li謚 c� 頲 an to祅 kh玭g?",
				"Y猲 t﹎,  t� ta ph竔 甶 c� th鮝 n╪g l鵦 phong 蕁 C� Dng Th�. Ngi ph秈 h誸 s鴆 th薾 tr鋘g, uy l鵦 c馻 C� Dng Th� v鑞  m筺h, nay l筰 c� th猰 t竎 d鬾g c馻 Kim n, c祅g kh玭g d� i ph�. T醓 Y猽 Ph� n祔 c� th� gi髉 ngi gi秈 tr� t竎 d鬾g c馻 Kim n trong c� th� C� Dng Th�, nh� v藋 s� nh� g竛h cho ngi h琻. Ngi c� th� 甧m theo Уo M閏 Ki誱 c馻 ta 甶 c飊g, a n� cho  t� C玭 L玭 產ng tr蕁 gi� t筰 , v� s� vi謈 h� tr鋘g, ta  c╪ d苙 kh玭g 頲 nh� d� tin ai h誸.",
				"Nh� v藋 l� t鑤. Chuy謓 kh玭g th� ch薽 tr�, n誹 C� Dng Th� x玭g ra th� gay go.",
				}
		end
		DelItem(2,0,702,10);
		DelItem(2,0,703,10);
		AddItem(2,0,704,1,1);--锁妖符
		AddItem(2,0,759,1,1);--桃木剑
		RemoveTrigger(GetTrigger(KILL_XB_LIEYANCHILONG));
		RemoveTrigger(GetTrigger(KILL_XB_CHILIANHUOHU));
		TalkEx("",strTalk);
		SetTask(TASK_XB_ID_02,17);
		TaskTip("дn t莕g 2 C� Dng чng t譵  t� ph竔 C玭 L玭 v� a Уo M閏 Ki誱, h醝 v� tr� c馻 C� Dng Th�.");
		Msg2Player("дn t莕g 2 C� Dng чng t譵  t� ph竔 C玭 L玭 v� a Уo M閏 Ki誱, h醝 v� tr� c馻 C� Dng Th�.");
		GivePlayerAward("Award_XB_62","Easy");
		GivePlayerExp(SkeyXibei,"guyangdong")
	--没有带回物品and补发任务触发器
	else

		--昆仑派弟子对话
		if GetPlayerRoute() == 100 then
			strTalk = {
				"Ngi h穣 n t莕g 2 C� Dng чng t譵 10 畊玦 H醓 H� v� 10 Ly Long Tu, ta s� ph竔  t� th﹏ t輓 n C� Dng чng t筸 th阨 phong 蕁 C� Dng Th�, i sau khi ta h醝 r� s� ph� c竎h gi秈 tr� t竎 d鬾g Kim n r錳 th秓 lu薾 ti誴.",
				}
		else
			strTalk = {
				"Phi襫 <sex> 甶 n t莕g 2 C� Dng чng t譵 10 畊玦 H醓 H� v� 10 Ly Long Tu, ta s� cho  t� th﹏ t輓 n C� Dng чng t筸 th阨 phong 蕁 C� Dng Th�, i sau khi h醝 r� c竎h gi秈 tr� t竎 d鬾g Kim n r錳 th秓 lu薾 ti誴.",
				}
		end

		if	GetTrigger(KILL_XB_LIEYANCHILONG) == 0 then
			CreateTrigger(0,1239,KILL_XB_LIEYANCHILONG);--裂岩螭龙杀怪触发器
			TaskTip("дn t莕g 2 C� Dng чng t譵 10 Ly Long Tu v� 畊玦 H醓 H�.");
			Msg2Player("дn t莕g 2 C� Dng чng t譵 10 Ly Long Tu v� 畊玦 H醓 H�.");
		end

		if	GetTrigger(KILL_XB_CHILIANHUOHU) == 0 then
			CreateTrigger(0,1240,KILL_XB_CHILIANHUOHU);--赤炼火狐杀怪触发器
			TaskTip("дn t莕g 2 C� Dng чng t譵 10 Ly Long Tu v� 畊玦 H醓 H�.");
			Msg2Player("дn t莕g 2 C� Dng чng t譵 10 Ly Long Tu v� 畊玦 H醓 H�.");
		end

		TalkEx("",strTalk);
	end

end

--未与昆仑弟子对话获悉古阳兽行踪
function task_027_02_1()

local strTalk = {};

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ngi h穣 a Уo M閏 Ki誱 cho  t� C玭 L玭 產ng ng t筰 t莕g 2 C� Dng чng, sau  c� th� d飊g T醓 Y猽 Ph� thu ph鬰 C� Dng Th�.",
			}
	else
		strTalk = {
			"Ngi h穣 a Уo M閏 Ki誱 cho  t� C玭 L玭 產ng ng t筰 t莕g 2 C� Dng чng, sau  c� th� d飊g T醓 Y猽 Ph� thu ph鬰 C� Dng Th�.",
			}
	end

	TalkEx("",strTalk);

	--补发桃木剑和锁妖符
	if GetItemCount(2,0,704) < 1 then
		AddItem(2,0,704,1,1);--锁妖符
	end

	if GetItemCount(2,0,759) < 1 then
		AddItem(2,0,759,1,1);--桃木剑
	end

end

--与昆仑弟子对话获悉古阳兽行踪
function task_027_03_0()

local strTalk = {};
local nMapDataIndex = random(1,getn(GuYangShou_MapData));
local xWPos,yWPos,xPos,yPos = GuYangShou_MapData[nMapDataIndex][1],GuYangShou_MapData[nMapDataIndex][2],GuYangShou_MapData[nMapDataIndex][3],GuYangShou_MapData[nMapDataIndex][4]
local nNpcIndex = 0;

	--玩家若任务失败需要过30分钟才能重新刷出古阳兽
	if GetTime()-GetTask(CREAT_GUYANGSHOU_TIME)	>= 1800 then

		--昆仑派弟子对话
		if GetPlayerRoute() == 100 then
			strTalk = {
				"Sao ngi l筰 n y? N琲 n祔 r蕋 nguy hi觤, n誹 kh玭g c� vi謈 g� th� h穣 甶 mau!",
				"Чi s� huynh ph竔 ta n thu ph鬰 C� Dng Th�, y l� Уo M閏 Ki誱 c馻 huynh 蕐.",
				"Ra l� ngi c馻 i s� huynh, tuy C� Dng Th�  b� ta phong 蕁, nh璶g ta c騨g  b� thng, uy l鵦 c馻 C� Dng Th� qu� m筺h, phong 蕁 ch綾 kh玭g th� duy tr� 頲 l﹗. Ngi n ng l骳 l緈, gi� ta s� gi秈 tr� phong 蕁, ngi ph秈 c萵 th薾.",
				"е t� tu﹏ l謓h!",
				}
		else
			strTalk = {
				"Ai ? N琲 n祔 r蕋 nguy hi觤, n誹 kh玭g c� vi謈 g� th� mau r阨 kh醝 y.",
				"Ta n y  thu ph鬰 C� Dng Th�, y l� Уo M閏 Ki誱 c馻 Di謕 T� Thu thi誹 hi謕.",
				"Ra l� b籲g h鱱 c馻 i s� huynh. Tuy C� Dng Th�  b� ta phong 蕁, nh璶g ta c騨g  b� thng, uy l鵦 c馻 C� Dng Th� qu� m筺h, e phong 蕁 kh玭g th� duy tr� 頲 l﹗. Ngi n ng l骳 l緈, ta s� gi秈 tr� phong 蕁, ngi ph秈 c萵 th薾.",
				" t�.",
				}
		end

		SetTask(CREAT_GUYANGSHOU_TIME,GetTime());--记录古阳兽刷新时间
		DelItem(2,0,759,1);--桃木剑
		nNpcIndex = CreateNpc("C� Dng Th�","C� Dng Th�",512,xWPos,yWPos,-1,1,1,70);
		SetNpcScript(nNpcIndex,"\\script\\西北区\\古阳洞二层\\npc\\古阳兽.lua");
		SetNpcLifeTime(nNpcIndex,1800);

		Msg2Player("дn  "..xPos..", "..yPos.." , nh b筰 C� Dng Th�.")
		TaskTip("дn  "..xPos..", "..yPos.." , nh b筰 C� Dng Th�.");

	else

		strTalk = {
			"C� Dng Th� uy l鵦 r蕋 l韓, t鑤 nh蕋 n猲 ngh� ng琲 m閠 l骳 r錳 m韎 h祅h ng.",
			}

	end

	TalkEx("",strTalk);

end

--尚未达成打败古阳兽的条件
function task_027_03_1()

local strTalk = {
	"N琲 y l� sa m筩 hi觤 竎, ch� c莕 s� s葃 m閠 ch髏 l� kh玭g c遪 c� h閕 tr� ra ngo礽.",
	};

	TalkEx("",strTalk);

end

--已经杀死古阳兽，关卡接口开启
function task_027_03_2()

local strTalk = {
	"C� Dng Th� xu蕋 hi謓 総 s� nguy h筰 th� gian!",
	};

	TalkEx("",strTalk);

end

---------------------------------- 西北区28分支2_5孪生玉壁----------------------------------
--杀死古阳兽后与叶子秋对话
function task_028_01_0()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Thi誹 hi謕, C� Dng Th�  b� thu ph鬰, nh璶g trc khi C� Dng Th� bi課 m蕋, ta nghe m閠 ti課g h衪 th蕋 thanh v� th蕐 m閠 v莕g s竛g m祏  l鉫 l猲, sau  kh玭g th蕐 d蕌 v誸 c馻 C� Dng Th� n鱝. Thi誹 hi謕 c� bi誸 chuy謓 n祔 l� sao kh玭g?",
			"Qu� nhi猲 <sex>  thu ph鬰 頲 ma v藅. Xin 產 t�. Nhi襲 n╩ trc y s� ph� ta c騨g t鮪g c� � thu ph鬰 C� Dng Th�, n猲 c騨g t譵 hi觰 nhi襲 v� ch髇g. S� ph� t鮪g n鉯, nh鱪g ngi b� C� Dng Th� nu鑤 ch鰊g n誹 v蒼 c遪 o竛 ni謒, s� huy詎 h鉧 trong ch輓h c� th� c馻 con th�, k衞 d礽 sinh m謓h b籲g c竎h h髏 ch蕋 dinh dng c馻 C� Dng Th�. Nh璶g ngo筰 h譶h v� tinh th莕 th� v蒼 b� nh鑤 b猲 trong l鑤 th�.",
			"C� chuy謓 n祔 sao? V藋 ti課g h衪 m� ta nghe th蕐 ch輓h l� c馻 nh鱪g ngi b� nh鑤 trong con th� �? C� Dng Th� bi課 m蕋, ph秈 ch╪g nh鱪g ngi b猲 trong c騨g bi課 m蕋 theo?",
			"Kh玭g, nh鱪g ngi b� nh鑤 頲 C� Dng Th� nu玦 dng, uy l鵦 c馻 h� kh玭g ch鮪g c遪 h琻 h糿 C� Dng Th�. C� th� khi C� Dng Th� ch誸 甶, h� c騨g s� ch誸 theo, nh璶g c騨g r蕋 c� kh� n╪g c竔 ch誸 c馻 C� Dng Th� ch輓h l� th阨 c�  h� tho竧 kh醝 c秐h t� t髇g. M秐h Huy誸 H錸 Tinh Ph竎h n祔 ch輓h l� v藅 c� c玭g d鬾g nu玦 dng sinh m筺g.",
			}
	else
		strTalk = {
			"Thi誹 hi謕, C� Dng Th�  b� thu ph鬰, nh璶g trc khi C� Dng Th� bi課 m蕋, ta nghe m閠 ti課g h衪 th蕋 thanh v� th蕐 m閠 v莕g s竛g m祏  l鉫 l猲, sau  kh玭g th蕐 d蕌 v誸 c馻 C� Dng Th� n鱝. Thi誹 hi謕 c� bi誸 chuy謓 n祔 l� sao kh玭g?",
			"Qu� nhi猲 <sex>  thu ph鬰 頲 ma v藅. Xin 產 t�. Nhi襲 n╩ trc y s� ph� ta c騨g t鮪g c� � thu ph鬰 C� Dng Th�, n猲 c騨g t譵 hi觰 nhi襲 v� ch髇g. S� ph� t鮪g n鉯, nh鱪g ngi b� C� Dng Th� nu鑤 ch鰊g n誹 v蒼 c遪 o竛 ni謒, s� huy詎 h鉧 trong ch輓h c� th� c馻 con th�, k衞 d礽 sinh m謓h b籲g c竎h h髏 ch蕋 dinh dng c馻 C� Dng Th�. Nh璶g ngo筰 h譶h v� tinh th莕 th� v蒼 b� nh鑤 b猲 trong l鑤 th�.",
			"C� chuy謓 n祔 sao? V藋 ti課g h衪 m� ta nghe th蕐 ch輓h l� c馻 nh鱪g ngi b� nh鑤 trong con th� �? C� Dng Th� bi課 m蕋, ph秈 ch╪g nh鱪g ngi b猲 trong c騨g bi課 m蕋 theo?",
			"Kh玭g, nh鱪g ngi b� nh鑤 頲 C� Dng Th� nu玦 dng, uy l鵦 c馻 h� kh玭g ch鮪g c遪 h琻 h糿 C� Dng Th�. C� th� khi C� Dng Th� ch誸 甶, h� c騨g s� ch誸 theo, nh璶g c騨g r蕋 c� kh� n╪g c竔 ch誸 c馻 C� Dng Th� ch輓h l� th阨 c�  h� tho竧 kh醝 c秐h t� t髇g. M秐h Huy誸 H錸 Tinh Ph竎h n祔 ch輓h l� v藅 c� c玭g d鬾g nu玦 dng sinh m筺g.",
			}
	end

	TalkEx("task_028_01_0_1",strTalk);

end

--续对话
function task_028_01_0_1()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"N誹 ma v藅 ch璦 頲 di謙 tr�, ch糿g ph秈 s� sinh ra m閠 qu竔 th� m筺h h琻 C� Dng Th� trc y? V蒼 n猲 tr� kh� 甶 th� h琻.",
			"<sex> n鉯 ph秈 l緈, n誹 l筰 xu蕋 hi謓 th猰 nh鱪g k� hi觤 c nh� Phi Thng Чo Nh﹏ th� th藅 tai h筰! N誹 ma v藅 v蒼 ch璦 ch誸, d飊g Huy誸 H錸 Tinh Ph竎h t蕋 s� d蒼 d� 頲 ch髇g.",
			"Khi ta a Huy誸 H錸 Tinh Ph竎h v� y, c騨g u th蕐 ma v藅 xu蕋 hi謓, l祄 c竎h n祇  d� 頲 ch髇g?",
			"Huy誸 H錸 Tinh Ph竎h ch� linh ng khi g苝 m竨, t鑤 nh蕋 l� m竨 c馻 ngi  thu ph鬰 C� Dng Th�. Ngi c� th� d飊g T� Linh Th蕋 Th� - v藅  quy t� linh kh� c馻 C玭 L玭  tr輈h m竨 c馻 m譶h h遖 v祇 Tinh th筩h. Khi Tinh th筩h linh ng, ma v藅 総 s� nh h琲 頲 v藅 nu玦 dng n� v� t譵 n y. Ma v藅 n祔 m筺h h琻 h糿 C� Dng Th�, ngi ph秈 h誸 s鴆 c萵 th薾.",
			"Ra l� v藋, ta hi觰 r錳. Ma v藅 n祔 tuy謙 i kh玭g 頲 ph衟 t錸 t筰.",
			}
	else
		strTalk = {
			"N誹 ma v藅 ch璦 頲 di謙 tr�, ch糿g ph秈 s� sinh ra m閠 qu竔 th� m筺h h琻 C� Dng Th� trc y? V蒼 n猲 tr� kh� 甶 th� h琻.",
			"<sex> n鉯 ph秈 l緈, n誹 l筰 xu蕋 hi謓 th猰 nh鱪g k� hi觤 c nh� Phi Thng Чo Nh﹏ th� th藅 tai h筰! N誹 ma v藅 v蒼 ch璦 ch誸, d飊g Huy誸 H錸 Tinh Ph竎h t蕋 s� d蒼 d� 頲 ch髇g.",
			"Khi ta a Huy誸 H錸 Tinh Ph竎h v� y, c騨g u th蕐 ma v藅 xu蕋 hi謓, l祄 c竎h n祇  d� 頲 ch髇g?",
			"Huy誸 H錸 Tinh Ph竎h ch� linh ng khi g苝 m竨, t鑤 nh蕋 l� m竨 c馻 ngi  thu ph鬰 C� Dng Th�. Ngi c� th� d飊g T� Linh Th蕋 Th� - v藅  quy t� linh kh� c馻 C玭 L玭  tr輈h m竨 c馻 m譶h h遖 v祇 Tinh th筩h. Khi Tinh th筩h linh ng, ma v藅 総 s� nh h琲 頲 v藅 nu玦 dng n� v� t譵 n y. Ma v藅 n祔 m筺h h琻 h糿 C� Dng Th�, ngi ph秈 h誸 s鴆 c萵 th薾.",
			"Ra l� v藋, ta hi觰 r錳. Ma v藅 n祔 tuy謙 i kh玭g 頲 ph衟 t錸 t筰.",
			}
	end

	TalkEx("",strTalk);
	AddItem(2,0,706,1,1);--聚灵匕首
	SetTask(TASK_XB_ID_02,19);
	TaskTip("дn t莕g 2 C� Dng чng, d飊g T� Linh Th蕋 Th� tr輈h m竨  khai phong, l頸 d鬾g Huy誸 H錸 Tinh Ph竎h d蒼 d� d� v藅 b猲 trong C� Dng Th� xu蕋 hi謓.");
	Msg2Player("дn t莕g 2 C� Dng чng, d飊g T� Linh Th蕋 Th� tr輈h m竨  khai phong, l頸 d鬾g Huy誸 H錸 Tinh Ph竎h d蒼 d� d� v藅 b猲 trong C� Dng Th� xu蕋 hi謓.");
	GivePlayerAward("Award_XB_63","Easy");
	GivePlayerExp(SkeyXibei,"guyangshou")
end

--还未杀死血魔人（补发聚灵匕首）
function task_028_01_1()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ngi c� th� d飊g T� Linh Th蕋 Th� tr輈h m竨 c馻 m譶h  d蒼 d� ma v藅, nh緈 ng th阨 c�  thu ph鬰 n�. Ma v藅 n祔 uy l鵦 r蕋 l韓, c莕 ph秈 h誸 s鴆 th薾 tr鋘g.",
			}
	else
		strTalk = {
			"Ngi c� th� d飊g T� Linh Th蕋 Th� tr輈h m竨 c馻 m譶h  d蒼 d� ma v藅, nh緈 ng th阨 c�  thu ph鬰 n�. Ma v藅 n祔 uy l鵦 r蕋 l韓, c莕 ph秈 h誸 s鴆 th薾 tr鋘g.",
			}
	end

	TalkEx("",strTalk);

	if GetItemCount(2,0,706) < 1 then
		AddItem(2,0,706,1,1);--聚灵匕首
		TaskTip("дn t莕g 2 C� Dng чng, d飊g T� Linh Th蕋 Th� tr輈h m竨  khai phong, l頸 d鬾g Huy誸 H錸 Tinh Ph竎h d蒼 d� d� v藅 b猲 trong C� Dng Th� xu蕋 hi謓.");
		Msg2Player("дn t莕g 2 C� Dng чng, d飊g T� Linh Th蕋 Th� tr輈h m竨  khai phong, l頸 d鬾g Huy誸 H錸 Tinh Ph竎h d蒼 d� d� v藅 b猲 trong C� Dng Th� xu蕋 hi謓.");
	end

end

--已经杀死血魔人
function task_028_02_0()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"H鉧 ra ma v藅 l� m閠 Huy誸 Ma Nh﹏, ph秈 t鑞 kh玭g 輙 c玭g s鴆 m韎 c� th� di謙 tr� 頲 n�.",
			"T鑤 qu�! M鋓 vi謈  k誸 th骳, Phi Thng Чo Nh﹏  ph鬰 ph竝, C� Dng Th� b� di謙 tr�, Huy誸 Ma Nh﹏ c騨g  頲 ti猽 di謙, t蕋 c� u l� c玭g lao c馻 . Mai n祔  s� l� tr� c閠 c馻 C玭 L玭.",
			"Чi s� huynh qu� khen, h祅g y猽 ph鬰 ma l� t玭 ch� c馻 ph竔 ta,  n祇 d竚 qu猲? � ph秈, khi ma v藅 bi課 m蕋   l筰 n鯽 m秐h ng鋍 b閕, huynh xem th� c� li猲 quan n y猽 v藅 kh玭g?",
			"M秐h ng鋍 b閕 n祔 l蕐 t� ch� Huy誸 Ma Nh﹏ sao? е xem!",
			}
	else
		strTalk = {
			"H鉧 ra ma v藅 l� m閠 Huy誸 Ma Nh﹏, ph秈 t鑞 kh玭g 輙 c玭g s鴆 m韎 c� th� di謙 tr� 頲 n�.",
			"T鑤 qu�! M鋓 vi謈  k誸 th骳, Phi Thng Чo Nh﹏  ph鬰 ph竝, C� Dng Th� b� di謙 tr�, Huy誸 Ma Nh﹏ c騨g  頲 ti猽 di謙, t蕋 c� u l� c玭g lao c馻 <sex>. <sex>  h誸 m譶h v� C玭 L玭 v� b� t竛h trong thi猲 h�, ta th藅 kh玭g bi誸 l蕐 g�  t� l遪g bi誸 琻.  c c馻 <sex>, T� Thu xin ghi t筩 trong l遪g.",
			"Huynh v� ta l� b籲g h鱱, ch� n猲 kh竎h s竜. � ph秈, khi ma v藅 bi課 m蕋 c�  l筰 n鯽 m秐h ng鋍 b閕, huynh xem th� c� li猲 quan n y猽 v藅 kh玭g?",
			"M秐h ng鋍 b閕 n祔 l蕐 t� ch� Huy誸 Ma Nh﹏ sao? <sex> xem!",
			}
	end

	TalkEx("task_028_02_0_1",strTalk);

end

--续对话
function task_028_02_0_1()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Sao s� huynh c騨g c� n鯽 m秐h ng鋍 b閕 v藋? Hai n鯽 n祔 gh衟 l筰 v鮝 kh輙 v韎 nhau, kh玭g l蠀",
			"е 畂竛 ra 甶襲 g�  ph秈 kh玭g? C� n鉯 ng ng筰.",
			"Khi  t韎 g苝 Di謕 l穙, c� nh綾 vi謈 huynh ph鬾g m謓h s� ph� t韎 C� Dng чng. Khi nghe n C� Dng чng Di謕 l穙 r蕋 k輈h ng, h醝 ra m韎 bi誸 s� huynh c遪 c� m閠 huynh trng song sinh, l骳 nh� 甶 l筩 v祇 C� Dng чng th� kh玭g th蕐 tr� ra n鱝, e l�  th祅h m錳 cho C� Dng Th�. Nay xem ra, Huy誸 Ma Nh﹏ kia r蕋 c� th� l�...",
			"Sao? Nh璶g ta ch璦 h� nghe ph� th﹏ n鉯 c遪 c� m閠 ngi huynh trng?",
			}
	else
		strTalk = {
			"Sao thi誹 hi謕 c騨g c� n鯽 m秐h ng鋍 b閕 v藋? Hai n鯽 n祔 l筰 v鮝 kh輙 v韎 nhau, kh玭g l蠀",
			"<sex> 畂竛 ra 甶襲 g�  ph秈 kh玭g? C� n鉯 ng ng筰.",
			"Khi ta t韎 g苝 Di謕 l穙, c� nh綾 vi謈 thi誹 hi謕 ph鬾g m謓h s� ph� n C� Dng чng. Khi nghe n C� Dng чng Di謕 l穙 r蕋 k輈h ng, h醝 ra m韎 bi誸 thi誹 hi謕 c遪 c� m閠 huynh trng song sinh, l骳 nh� 甶 l筩 v祇 C� Dng чng th� kh玭g th蕐 tr� ra n鱝, e l�  th祅h m錳 cho C� Dng Th�. Nay xem ra, Huy誸 Ma Nh﹏ kia r蕋 c� th� l�...",
			"Sao? Nh璶g ta ch璦 h� nghe ph� th﹏ n鉯 c遪 c� m閠 ngi huynh trng?",
			}
	end

	TalkEx("task_028_02_0_2",strTalk);

end

--续对话
function task_028_02_0_2()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Di謕 l穙 bi誸 huynh ch� t筰 b鑞 phng, tuy r蕋 y猽 thng huynh, nh璶g c騨g cam nguy謓 s鑞g c� c � Ph鬾g Tng  huynh ho祅 th祅h ch� hng. Di謕 l穙 c遪 c╪ d苙 kh玭g 頲  huynh bi誸 m譶h c遪 c� huynh trng song sinh, s� huynh b� ph﹏ t﹎, nh璶g v蒼 thng xuy猲 lo l緉g h醝 han cu閏 s鑞g c馻 huynh � C玭 L玭.",
			"Ra ph� th﹏ v蒼 lu玭 quan t﹎ lo l緉g cho ta, c遪 ta th� l筰 ph韙 l� t譶h c秏 c馻 Ngi, ta th藅 b蕋 hi誹� H祅g y猽 ph鬰 ma c騨g l� v� b� t竛h thi猲 h�, n誹 v� v藋 m� b� qu猲 t譶h th﹏, th� h祅g y猽 ph鬰 ma  l祄 g� n鱝? Ph� th﹏ tuy � xa nh璶g v蒼 lo l緉g cho ta  甶襲, i sau khi b譶h ph鬰 ta ph秈 l藀 t鴆 v� th╩ Ngi...",
			"S� vi謈  k誸 th骳, s� huynh c� th� v� th╩ Di謕 l穙 r錳, h糿 Di謕 l穙 s� vui m鮪g l緈. е kh玭g l祄 phi襫 s� huynh n鱝.",
			}
	else
		strTalk = {
			"Di謕 l穙 bi誸 huynh ch� t筰 b鑞 phng, tuy r蕋 y猽 thng huynh, nh璶g c騨g cam nguy謓 s鑞g c� c � Ph鬾g Tng  huynh ho祅 th祅h ch� hng. Di謕 l穙 c遪 c╪ d苙 kh玭g 頲  huynh bi誸 m譶h c遪 c� huynh trng song sinh, s� huynh b� ph﹏ t﹎, nh璶g v蒼 thng xuy猲 lo l緉g h醝 han cu閏 s鑞g c馻 huynh � C玭 L玭.",
			"Ra ph� th﹏ v蒼 lu玭 quan t﹎ lo l緉g cho ta, c遪 ta th� l筰 ph韙 l� t譶h c秏 c馻 Ngi, ta th藅 b蕋 hi誹� H祅g y猽 ph鬰 ma c騨g l� v� b� t竛h thi猲 h�, n誹 v� v藋 m� b� qu猲 t譶h th﹏, th� h祅g y猽 ph鬰 ma  l祄 g� n鱝? Ph� th﹏ tuy � xa nh璶g v蒼 lo l緉g cho ta  甶襲, i sau khi b譶h ph鬰 ta ph秈 l藀 t鴆 v� th╩ Ngi...",
			"S� vi謈  k誸 th骳, thi誹 hi謕 c� th� v� th╩ Di謕 l穙 r錳, h糿 Di謕 l穙 s� vui m鮪g l緈. Ta kh玭g l祄 phi襫 thi誹 hi謕 n鱝, c� th� k誸 giao b籲g h鱱 v韎 thi誹 hi謕 ng l� m閠 甶襲 may m緉.",
			}
	end

	TalkEx("task_028_02_0_3",strTalk);

end

--发奖励
function task_028_02_0_3()

	give_ss_award(64);

	if GetTask(TASK_GET_AWARD) == 1 then
		SetTask(TASK_GET_AWARD,0);
		DelItem(2,0,707,1,1);--半块玉佩
		SetTask(TASK_XB_ID_02,21);
		GivePlayerAward("Award_XB_64","Easy");
		GivePlayerExp(SkeyXibei,"yezhiqiu")
	end

end

--已经杀死血魔人
function task_028_02_1()

local strTalk = {}

	--昆仑派弟子对话
	if GetPlayerRoute() == 100 then
		strTalk = {
			"B� qu猲 t譶h th﹏ th� h祅g y猽 ph鬰 ma  l祄 g� ch�? Ph� th﹏ tuy � xa nh璶g v蒼 lu玭 lo l緉g cho ta  甶襲, i sau khi b譶h ph鬰 ta ph秈 l藀 t鴆 v� th╩ Ngi�",
			}
	else
		strTalk = {
			"B� qu猲 t譶h th﹏ th� h祅g y猽 ph鬰 ma  l祄 g� ch�? Ph� th﹏ tuy � xa nh璶g v蒼 lu玭 lo l緉g cho ta  甶襲, i sau khi b譶h ph鬰 ta ph秈 l藀 t鴆 v� th╩ Ngi�",
			}
	end

	TalkEx("",strTalk);

end

---------------------------------- 西北区29枭雄之宴----------------------------------
--与欧阳画对话领取任务
function task_029_01_0()

local strTalk = {
	" Dng H鋋: Ta nh薾 頲 tin, L� Nguy猲 Kh竛h cao th� th� 3 c馻 t﹜ H� Nh蕋 Ph萴 Л阯g  ch th﹏ n Long M玭 tr蕁, e r籲g b鋘 ch髇g 產ng ng莔 ho箃 ng � Ph鬾g Tng, h緉 xu蕋 hi謓 � y nh蕋 nh l� c� ﹎ m璾. <sex> h穣 c萵 th薾  ph遪g.",
	"Ngi ch琲: C� vi謈 n祔 sao? Nh蕋 Ph萴 Л阯g ph鬰 h錳 s鴆 m筺h nhanh v藋 �? L� Nguy猲 Kh竛h c遪 ch th﹏ ra tr薾.",
	" Dng H鋋: Theo 甶襲 tra c馻 ta, s鴆 m筺h c馻 Nh蕋 Ph萴 Л阯g � Ph鬾g Tng nh蕋 nh b� {gi秏 s髏}, n誹 kh玭g L� Nguy猲 Kh竛h s� kh玭g l� di謓. Tr薾 chi課 n祔 ta lo r籲g Nh蕋 Ph萴 Л阯g mu鑞 b竜 th� v� l﹎ Trung Nguy猲, qu� nhi猲 ta 畂竛 kh玭g sai, chuy謓 n祔 cu鑙 c飊g c騨g ph秈 x秠 ra.",
	}

	TalkEx("task_029_01_0_1",strTalk);

end

function task_029_01_0_1()

local strTalk = {
	"Ngi ch琲: Ti襫 b鑙 n鉯 ch琲 sao? L� Nguy猲 Kh竛h d竚 n th﹏ c m� n y �?",
	" Dng H鋋: <sex> c� 甶襲 ch璦 bi誸, L� Nguy猲 Kh竛h ngi n祔 kh玭g th� xem thng 頲, h緉 l� cao th� th� 3 c馻 T﹜ H� Nh蕋 Ph萴 Л阯g n猲 vi謈 y n th﹏ c m� n ch鑞 nguy hi觤 n祔 c騨g ng v韎 t竎 phong c馻 y, tuy l� ngi c馻 Nh蕋 Ph萴 阯g nh璶g r蕋 tr鋘g t譶h ngh躠, x玭g pha n c  tr竛h s� nguy hi觤 cho ng i.",
	"Ngi ch琲: Ta v蒼 bi誸 y l� i th� ng s�, t� c竎h s緋 x誴 h祅h ng c� th� th蕐 y l� ngi r蕋 c萵 th薾. Th緉g � Ph鬾g Tng l莕 n祔 th鵦 ra ch� g苝 may th玦.",
	" Dng H鋋: Ha ha, <sex> ng l� bi誸 ngi bi誸 ta tr╩ tr薾 tr╩ th緉g, L� Nguy猲 Kh竛h l莕 n祔 ch th﹏ n Long M玭 tr蕁 l� v� mu鑞 {thi誸 y課} gi秈 h遖 hi觰 l莔 x鉧 b� nh鱪g ﹏ o竛 gi鱝 Cao th� v� l﹎ trung nguy猲 v� T﹜ H� Nh蕋 Ph萴 Л阯g.",
	}

	TalkEx("task_029_01_0_2",strTalk);

end

function task_029_01_0_2()

local strTalk = {
	"Ngi ch琲: L祄 sao m韎 c� th� d� ti謈?",
	" Dng H鋋: Kh玭g sai! Ta c騨g cho r籲g bu鎖 ti謈 n祔 nh蕋 nh c� ﹎ m璾. C竔 g鋓 l� x鉧 b� ﹏ o竛 n鉯 u c� d� v藋? <sex> nh� ph秈  ph遪g, L� Nguy猲 Kh竛h d� sao c騨g l� cao th� d竚 n Trung Nguy猲 tuy猲 chi課 nh蕋 nh  c� chu萵 b� trc. Ta  nh薾 頲 {thi謕 m阨} c馻 y, ngi c� th� n g苝 {Kh蕌 Chu萵 � Bi謓 Kinh}  h醝 c竎h nh薾 thi謕 m阨.",
	"Ngi ch琲: Ta  chu萵 b� ngh猲h chi課, t藀 h頿 c竎 nh﹏ s� v� l﹎  c飊g 鴑g ph�. T筰 h� ph秈 n g苝 Kh蕌 Chu萵  h醝 thi謕 m阨, xin c竜 t�!",
	}

	--删去一品堂称号
	for i=1,6 do
		RemoveTitle(60,i);
	end
	SetTask(TASK_XB_ID_01,69);
	TalkEx("",strTalk);
	TaskTip("дn Bi謓 Kinh t譵 Kh蕌 Chu萵 h醝 y課 ti謈 Long M玭.");
	Msg2Player("дn Bi謓 Kinh t譵 Kh蕌 Chu萵 h醝 y課 ti謈 Long M玭.");

end

--未前往汴京与寇准对话
function task_029_01_1()

local strTalk = {
	" Dng H鋋: {Kh蕌 Chu萵 � Bi謓 Kinh} bi誸 c竎h nh薾 頲 thi謕 m阨 Long M玭, ngi c� th� t譵 玭g ta h醝 th�.",
	}

	TalkEx("",strTalk);

end

--与寇准对话询问请柬事宜
function task_029_02_0()

local strTalk = {
	"Kh蕌 Chu萵: Xin ch祇 <sex>! Ta 頲 tin t� {Trng Ca M玭} n鉯 ngi u m閠 tr薾 k辌h li謙 v韎 Nh蕋 Ph萴 Л阯g � Ph鬾g Tng. G莕 y ch� nghe n鉯 L� Nguy猲 Kh竛h c馻 Nh蕋 Ph萴 Л阯g 產ng n Trung Nguy猲, <sex> n y l� v� chuy謓 n祔 �?",
	"Ngi ch琲: T筰 h� n y l� v� chuy謓 L� Nguy猲 Kh竛h n Long M玭 tr蕁 v� thi誸 y課 t筰 y.  Dng H鋋 ti襫 b鑙 e r籲g {Чi y課 v� l﹎ Trung Nguy猲} n祔 kh玭g n gi秐, k� n祔 kh玭g ph秈 l� h筺g t莔 thng.",
	"Kh蕌 Chu萵: Kh玭g sai! N誹 kh玭g v� l頸 輈h qu鑓 gia, L� Nguy猲 Kh竛h kh玭g d� g� ra tay, y ch th﹏ ph秐 k輈h e r籲g kh玭g ch� n gi秐 l� chuy謓 b竜 th�, c� 2 nguy猲 nh﹏: Th� 1 l� Nh蕋 Ph萴 Л阯g tranh th� th阨 gian ngh� ng琲, th� 2 l� nh mn bu鎖 ti謈 � Long M玭  th╩ d� th鵦 l鵦 c馻 v� l﹎ trung nguy猲. Thi誸 Chu l謓h c馻 Nh蕋 Ph萴 Л阯g  ban, <sex> l� m鬰 ti猽 truy 畊鎖 c馻 ch髇g, L� Nguy猲 Kh竛h s� kh玭g b� qua u.",
	}

	TalkEx("task_029_02_0_1",strTalk);

end

function task_029_02_0_1()

local strTalk = {
	"Ngi ch琲: Ta ph秈 cho L� Nguy猲 Kh竛h hi觰, h藆 b鑙 b鋘 ta kh玭g ph秈 l� nh鱪g con r颽 r髏 u!",
	"Kh蕌 Chu萵: M鏸 c﹗ c馻 <sex> nh� hi觰 r� l遪g ta, L� Nguy猲 Kh竛h thi誸 y課 t筰 qu竛 tr� Long M玭, ch� c莕 h醝 {Ti觰 Nh� � qu竛 tr� Long M玭} c� th� nh薾 頲 {thi謕 m阨 Long M玭}!",
	"Ngi ch琲:  t� Kh蕌 ti猲 sinh! T筰 h� nh蕋 nh gi� th� di謓 cho Чi T鑞g! Xin c竜 t�.",
	}

	SetTask(TASK_XB_ID_01,70);
	TalkEx("",strTalk);
	TaskTip("дn kh竎h s筺 Long M玭 tr蕁 t譵 Ti觰 Nh� h醝 thi謕 m阨.");
	Msg2Player("дn kh竎h s筺 Long M玭 tr蕁 t譵 Ti觰 Nh� h醝 thi謕 m阨.");

end

--未前往龙门宴取得请柬
function task_029_02_1()

local strTalk ={
	"Kh蕌 Chu萵: Ngi c� th� t譵 {Ti觰 Nh� � qu竛 tr� Long M玭}  h醝 chuy謓 thi謕 m阨.",
	}

	TalkEx("",strTalk);

end

--未打败李元庆前寇准对话
function task_029_02_2()

local strTalk ={
	"Kh蕌 Chu萵: <sex> mu鑞 d� y課 ti謈 Long M玭? L� Nguy猲 Kh竛h kh玭g ph秈 d� i ph� u, bu鎖 ti謈 n祔 nh蕋 nh kh玭g ph秈 n gi秐, n誹 l莕 n祔 kh玭g th祅h c玭g y c騨g t� ch鴆 b鱝 ti謈 kh竎.",
	}

	TalkEx("",strTalk);

end

--与店小二对话获得请柬
function task_29_03_0()

local strTalk = {
	"Ti觰 Nh�: <sex> l� ngi �? {S鉵g gi銄 Long M玭 s緋 x秠 ra, kh玭g c� chuy謓 g� th� mau r阨 kh醝 y. Quanh y kh玭g c� qu竛 tr� n祇 u.",
	"Ngi ch琲: Ti觰 Nh� ca, s鉵g gi� s緋 di詎 ra � y ngi thng e kh� m� ch辵 頲, ngi h穣 mau v� nh� 甶!",
	"Ti觰 Nh�: Ha ha. Kh玭g gi蕌 g� <sex>, th藅 ra Ti觰 Nh� qu竛 tr� n祔 ch輓h l� ta, trng qu莥 c騨g l� ta, ngi h莡 c騨g l� ta, qu竛 tr� n祔 ch� c� ta v� v�, m韎 y  10 n╩ r錳, v� ta c騨g l� ch�, ch� kh玭g 甶 ta c騨g kh玭g 甶.",
	}

	TalkEx("task_29_03_0_1",strTalk);

end

function task_29_03_0_1()

local strTalk = {
	"Ngi ch琲: Ch糿g l� Ti觰 Nh� v� b� ch� l� quan h� ch� t�?",
	"Ti觰 Nh�: Kh玭g sai! B� ch� l� v� c馻 ta, ti誧 l� ngi nh� c馻 ta khi n y  b� ch誸 h誸, qu竛 tr� n祔 kh玭g ph秈  ki誱 ti襫 nh璶g n gi� b� ch� v蒼 kh玭g vui v� g�, b� ta n鉯 qu竛 tr� n祔 kh玭g c� kh竎h c騨g v蒼 ph秈 m� c鯽, ngi m� qu竛 tr� cu鑙 c飊g c騨g n! G莕 y t﹎ t譶h b� ch� vui v� h糿 ra l祄 ta c騨g vui l﹜. B雐 v� ta nghe n鉯 {L� Nguy猲 Kh竛h} i nh﹏ s緋 n qu竛 tr�, 玭g ta ch輓h l� ngi m� qu竛 tr�,  bao n╩ tr玦 qua cu鑙 c飊g ng祔 b� ch� ch� i b蕐 l﹗ c騨g  n.",
	"Ngi ch琲: Th� ra ngi ng ng sau qu竛 tr� Long M玭 l� L� Nguy猲 Kh竛h �? Ch糿g tr竎h y ch鋘 n琲 n祔 thi誸 y課. Ti觰 Nh� c� l� c騨g l� ngi c馻 Nh蕋 Ph萴 Л阯g?",
	"Ti觰 Nh�: Kh玭g! Ta v� b� ch� kh玭g ph秈 l� ngi c馻 Nh蕋 Ph萴 Л阯g, g莕 y ta m韎 bi誸 L� i nh﹏ l� ngi c馻 Nh蕋 Ph萴 Л阯g, L� i nh﹏ l� i anh h飊g  c鴘 b� ta, v� c玭g c馻 b� 蕐 c騨g l� L� i nh﹏ truy襫 th�, 玭g ta n鉯 mu鑞 n qu竛 tr� thi誸 y課 cao th� Trung Nguy猲, b� ch� c馻 ta r蕋 vui m鮪g.",
	}

	TalkEx("task_29_03_0_2",strTalk);

end

function task_29_03_0_2()

local strTalk = {
	"Ngi ch琲: Th� ra 2 ngi kh玭g ph秈 ngi c馻 Nh蕋 Ph萴 Л阯g. Ta c騨g c� nghe n鉯 L� Nguy猲 Kh竛h s� thi誸 y課 � y cho n猲 n y h醝 Ti觰 Nh� ca v� vi謈 n祔, l祄 sao m韎 c� th� d� ti謈?",
	"Ti觰 Nh�: M蕐 ng祔 trc L� i nh﹏  n y n鉯 v韎 b� ch� mu鑞 thi誸 y課 cao th� Trung Nguy猲 t筰 qu竛 tr�, b� ch� r蕋 vui m鮪g b� l祄 theo s� s緋 x誴 c馻 L� i nh﹏. g ta nh� b� ch� chu萵 b� nhi襲 thi謕 m阨 Long M玭  ph竧 cho nh﹏ s� v� l﹎. Ph秈 l� anh h飊g c� t猲 trong Thi誸 Chu l謓h m韎 c� t� c竎h nh薾 thi謕 m阨, <sex> c� ph秈 l� ngi c� t猲 trong {Thi誸 Chu l謓h}? N誹 ph秈 th� xin ngi h穣 l蕐 nh薾 m阨, <sex> c� th� n d� ti謈 r錳! {<sex> ph秈 nh� kh玭g 頲 l祄 m蕋 thi謕 n祔, ti觰 nh﹏ kh玭g c� nhi襲 thi謕 u.}",
	"Ngi ch琲: (Xem ra Ti觰 Nh� c騨g kh玭g r� 萵 kh骳 b猲 trong, L� Nguy猲 Kh竛h qu� nhi猲 ng nh�  Dng ti襫 b鑙  n鉯 r蕋 tr鋘g t譶h ngh躠, ch糿g tr竎h Xu﹏ Th藀 Tam Nng v� Ti觰 Nh� c� th� sinh t錸 � Long M玭 tr蕁 l� do 頲 L� Nguy猲 Kh竛h ﹎ th莔 b秓 v�),  l祄 phi襫 Ti觰 Nh� ca r錳, t筰 h� ch輓h l� ngi trong Thi誸 Chu l謓h truy 畊鎖, mu鑞 n y d� ti謈, 產 t� thi謕 m阨 c馻 Ti觰 Nh� ca!",
	}

	TalkEx("",strTalk);
	AddItem(2,0,1037,1,1);--获得龙门宴请柬
	SetTask(TASK_XB_ID_01,71);
	TaskTip("22:00 t鑙 th� 7 n d� y課 ti謈 Long M玭.");
	Msg2Player("22:00 t鑙 th� 7 n d� y課 ti謈 Long M玭.");

end

--打败李元庆后和寇准对话
function task_029_04_0()

local strTalk = {
	"Kh蕌 Chu萵: <sex> n 頲 y t鴆 l�  nh b筰 L� Nguy猲 Kh竛h t筰 y課 ti謈 Long M玭? ng l� 甶襲 nh m鮪g? y課 ti謈 Long M玭 c馻 h緉 so v韎 H錸g M玭 y課 c馻 H筺g b� vng th� n祇?",
	"Ngi ch琲: y課 ti謈 Long M玭 kh玭g ph秈 l� n琲 ng s�, 甶襲 ng s� nh蕋 ch輓h l� t猲 L� Nguy猲 Kh竛h, ta ch璦 th蕐 qua v� ngh� c馻 h緉 n猲 kh玭g bi誸 l祄 sao kh綾 ch� n猲 v蒼 ph秈 h頿 s鴆 c馻 nhi襲 ngi m韎 mong nh b筰 h緉.",
	"Kh蕌 Chu萵: Ha ha! Цnh b筰 L� Nguy猲 Kh竛h kh玭g ph秈 l� chuy謓 d�, kh玭g th� g蕄 g竝, v� th� Trung nguy猲 c莕 ph秈 ng t﹎ hi謕 l鵦, ph秈 r錳 <sex> c� trang b� trc y  Dng H鋋 ti猲 sinh a cho ngi kh玭g?",
	}

	TalkEx("task_029_04_0_1",strTalk);

end

--续对话
function task_029_04_0_1()

local strTalk = {
	"Ngi ch琲: �? Trang b� n祔 c� v蕁  g� �?",
	"Kh蕌 Chu萵: <sex>  g鉷 s鴆 v� Чi T鑞g, ngi ch� c莕 甧m {1 b� nhi謒 v� nh薾 頲 trong nhi謒 v� T﹜ B綾 trc y} n y i {1 b秓 v藅}?",
	"Ngi ch琲: Hay qu�!  t� Kh蕌 ti猲 sinh.",
	}

	TalkEx("task_029_04_0_2",strTalk);
	SetTask(TASK_XB_ID_01,73);

end

--已将打败李元庆 兑换最后奖励
function task_029_04_0_2()

local strTalk = {
	"Kh蕌 Chu萵: <sex> ch� c莕 甧m {1 b� trang b迃 trc y nh薾 頲 n y i {1 b秓 v藅}?",
	}

	if GetTask(TASK_GET_AWARD) == 1 then
		task_029_04_0_4()
		return
	end

	TalkEx("task_029_04_0_3",strTalk);

end

--发奖励
function task_029_04_0_3()

	final_award()

end

--奖励装备成功后
function task_029_04_0_4()

local strTalk = {
	"Kh蕌 Chu萵: Зy l� v藅 b竨 hi誱 c�, <sex> c� th� l蕐 甶."
	}

	TalkEx("task_029_04_0_5",strTalk);
	SetTask(TASK_GET_AWARD,0);
	SetTask(TASK_XB_ID_01,74);--兑换奖励完毕

end

--奖励一个储物箱
function task_029_04_0_5()

local strTalk = {
	"Kh蕌 Chu萵: ng r錳, ta nh� trong giang h� c� nhi襲 ngi o竛 h薾 nhi襲 v藅 ph萴 qu� kh玭g c� ch�  c蕋, ta  t譵 頲 Th� r蘮 c� th� gi髉 ngi {t╪g dung lng rng ch鴄 }.",
	"Ngi ch琲: Зy ch輓h l� th� t筰 h� 產ng c莕, ti猲 sinh ngh� r蕋 chu o.",
	"Kh蕌 Chu萵: Chi課 d辌h n祔 qua 甶, Чi T鑞g {giang s琻} t筸 th阨 頲 y猲 b譶h! {M璦 b鬷 xanh r阯 non nc xa, kh鉯 sng m� m辴 n筺  qua, v莕g dng xu鑞g n骾, ph錸 hoa h誸, c遪 ng鋘 gi� xanh th鎖 m閚g t祡.",
	}

	if GetTask(1481) ~= 1 and GetStoreBoxPageCount() <= 4 then
		SetTask(1481,1);
		SetStoreBoxPageCount(GetStoreBoxPageCount()+1);
		Msg2Player("Kh蕌 Chu萵 p t� n� l鵦 c馻 b筺 cho Чi T鑞g n猲 t譵 th� r蘮 n t╪g s鴆 ch鴄 rng ch鴄  c馻 b筺!");
	end

	TalkEx("task_029_04_0_100",strTalk);
	SetTask(TASK_XB_ID_01,75);--兑换奖励完毕

end

--补充之前没有领到兑换奖励:1.接口对话
function task_029_04_0_100()

local strTalk = {
	"Kh蕌 Chu萵: <sex> ch� c莕 甧m {1 b� trang b迃 trc y nh薾 頲 n y i {1 b秓 v藅}?",
	}

	if GetTask(TASK_GET_AWARD) == 1 then
		task_029_04_0_102()
		return
	end

	TalkEx("task_029_04_0_101",strTalk);

end

--补充之前没有领到兑换奖励2.发放奖励
function task_029_04_0_101()

	final_award();

end

--补充之前没有领到兑换奖励2.发放奖励完毕
function task_029_04_0_102()

local strTalk = {
	"Kh蕌 Chu萵: Зy l� v藅 b竨 hi誱 c�, <sex> c� th� l蕐 甶."
	}

	TalkEx("task_029_05_0",strTalk);
	SetTask(TASK_GET_AWARD,0);
	SetTask(TASK_XB_ID_01,76);--兑换奖励完毕

end

--完成枭雄之宴后与寇准对话
function task_029_05_0()

local strTalk =	{
	"Kh蕌 Chu萵: Чi T鑞g cu鑙 c飊g c騨g 頲 {y猲 b譶h}, th藅 hay qu�! M璦 b鬷 xanh r阯 non nc xa, kh鉯 sng m� m辴 n筺  qua, v莕g dng xu鑞g n骾 ph錸 hoa h誸, c遪 ng鋘 gi� xanh th鎖 m閚g t�.",
	}

	TalkEx("",strTalk);

end

--空函数，不做任何事情
function Task_Exit()
end;

--奖励称号
--参数nType：YIPINGTANG_TITLE的序号
function add_xb_title(nType)

	AddTitle(60,nType);
	SetCurTitle(60,nType);
	Msg2Player("B筺 nh薾 頲  "..YIPINGTANG_TITLE[nType][1].." Danh hi謚!");

end

--判断是否亮出当前阶段的称号
--返回值：1为当前亮出该阶段称号；0为当前没有亮出该阶段称号
function is_show_title_level()

local i=0;
local nTitleIndex = 0;
local nCurTitleId_1,nCurTitleId_2 = 0,0;

	for i=1,getn(YIPINGTANG_TITLE) do
		if GetTask(YIPINGTANG_TITLE[i][2]) >= YIPINGTANG_TITLE[i][3] then
			nTitleIndex = i
		end
	end

	nCurTitleId_1,nCurTitleId_2 = GetCurTitle();

	--当前没有顶着该阶段称号
	if nCurTitleId_1 == 60 and nCurTitleId_2 == nTitleIndex then
		return 1
	else
		return 0
	end

end

--车轮霸王补发称号，并设置当前称号为当前可获得的最高等级称号
function repeat_add_xb_title()

local i=0;
local nDetailType = 0;

	for i=1,getn(YIPINGTANG_TITLE) do
		--判断任务
		if GetTask(YIPINGTANG_TITLE[i][2]) >= YIPINGTANG_TITLE[i][3] then
			AddTitle(60,i);
			nDetailType = i;
		end
	end

--	if nDetailType ~= 0 then
--		SetCurTitle(60,nDetailType);
--	end
--
--	Msg2Player("你获得了"..YIPINGTANG_TITLE[nDetailType][1].."称号！");

end

--亮出该称号任务提示
--参数：nTitleIndex为需要提示的称号id，对应YIPINGTANG_TITLE表；nNpcName为需要提示的Npc名字
function xb_title_tip(nTitleIndex,nNpcName)

local strTalk = {
	[1] = {
				["Xa Lu﹏ B� Vng"] =
				{
				{"Quanh v飊g Long M玭 tr蕁 qu� nhi猲 ng鋋 h� t祅g long, ch� m韎 v礽 ng祔  quy t� 頲 r蕋 nhi襲 T﹏ B� th﹏ th� r蕋 kh� n xin gia nh藀. Ngi c馻 b鎛 阯g u c� m閠 danh hi謚, n誹 l� T﹏ B� c馻 b鎛 阯g, h穣 n tr譶h di謓, nh薾 th� th竎h nh藀 阯g; c遪 n誹 ch� mu鑞 ph� r鑙 th� h穣 nh﹏ l骳 ta ch璦 n鎖 gi薾 m� ngoan ngo穘 ra v�."},
				{"L骳 n祔 quanh Long M玭 tr蕁 xu蕋 hi謓 nhi襲 T﹏ B� th﹏ th� r蕋 kh�, n誹 c� th� th玭g qua c� 3 秈 th� th竎h, 総 c� ch� h琻 ngi, ch綾 s� h蕄 d蒼 l緈 y. Ngi c馻 b鎛 阯g u c� m閠 danh hi謚, n誹 l� T﹏ B� c馻 b鎛 阯g, h穣 n tr譶h di謓, nh薾 th� th竎h nh藀 阯g. Th� th竎h d祅h cho T﹏ B� l� m閠 cu閏 c筺h tranh kh鑓 li謙!"}
				},
				},
	[2] = {
				["Xa Lu﹏ B� Vng"] =
				{
				{"S� d� Nh蕋 Ph萴 Л阯g 頲 xem l� i qu﹏ tinh nhu� nh蕋 c馻 T﹜ H�, b雐 th輈h kh竎h c馻 b鎛 阯g 頲 ph﹏ b� r閚g kh緋 thi猲 h�. R蕋 nhi襲 T﹏ B� mu鑞 gia nh藀 b鎛 阯g u c� th﹏ th� r蕋 kh�, n誹 vt qua c� 3 th� th竎h th� s� tr� th祅h th輈h kh竎h, nh� th� Nh蕋 Ph萴 Л阯g l筰 c� th� l韓 m筺h h琻 trc. Nh鱪g nhi謒 v� c� b秐 u do th輈h kh竎h ho祅 th祅h, ngi c馻 b鎛 阯g u c� m閠 danh hi謚, n誹 l� th輈h kh竎h c馻 b鎛 阯g, h穣 n ch� ta nh薾 nhi謒 v�."},
				},
				["Th竎 B箃 Ho籲g "] =
				{
				{"Ngi c馻 b鎛 阯g u c� danh hi謚, n誹 l� th輈h kh竎h c馻 b鎛 阯g, h穣 n ch� ta nh薾 nhi謒 v�; n誹 ch璦 ph秈 l� th輈h kh竎h, h穣 n ch� Xa Lu﹏ B� Vng  nghe ch� d蒼. Th輈h kh竎h ch輓h l� tr� c閠 c馻 b鎛 阯g, l� nh鱪g cao th� 頲 r秈 u kh緋 thi猲 h�. "},
				{"Xem ra l莕 n祔  chi猽 m� 頲 kh玭g 輙 nh﹏ t礽, ph� Ph鬾g Tng qu� l� n琲 ng鋋 h� t祅g long, kh玭g bi誸 c遪 t譵 頲 cao th� n祇 c� th� so t礽 v韎 ta m閠 phen. G莕 y th輈h kh竎h c馻 b鎛 阯g t╪g l猲 r蕋 nhi襲, t鑤 l緈 t鑤 l緈. m nhi謒 v� c馻 b鎛 阯g r秈 u ra kh緋 n琲, c騨g l� m閠 c竎h l祄 vi謈 hi謚 qu�."},
				},
				},
	[3] = {
				["Xa Lu﹏ B� Vng"] =
				{
				{"Th輈h kh竎h c騨g l� m藅 th竚 c馻 b鎛 阯g, l� l鵦 lng ch輓h chuy猲 thu th藀 t譶h b竜, d� la tin t鴆, th� ti猽 nh鱪g k� g﹜ b蕋 l頸 cho b鎛 阯g. T譶h b竜 l莕 trc v� Quang Minh nh c騨g l� m閠 v� d�. Nh璶g nh鱪g t譶h b竜 c� m藅 th� v蒼 ph秈 giao cho c竎 Phi H� c馻 b鎛 阯g m nhi謒. S� trng c馻 Phi H� l� khai th竎 b� m藅, th╩ d� qu﹏ t譶h, 竚 s竧 c竎 nh﹏ v藅 u n穙 v.v... V� l� c� m藅, n猲 ph秈 m b秓 t譶h b竜 v� nhi謒 v� 頲 ho祅 th祅h tuy謙 i ch輓h x竎. Khi nh薾 nhi謒 v� b� m藅 u ph秈 cho bi誸 danh hi謚 Phi H�."},
				},
				["Th竎 B箃 Ho籲g "] =
				{
				{"Th輈h kh竎h c騨g l� m藅 th竚 c馻 b鎛 阯g, l� l鵦 lng ch輓h chuy猲 thu th藀 t譶h b竜, d� la tin t鴆, th� ti猽 nh鱪g k� g﹜ b蕋 l頸 cho b鎛 阯g. T譶h b竜 l莕 trc v� Quang Minh nh c騨g l� m閠 v� d�. Nh璶g nh鱪g t譶h b竜 c� m藅 th� v蒼 ph秈 giao cho c竎 Phi H� c馻 b鎛 阯g m nhi謒. S� trng c馻 Phi H� l� khai th竎 b� m藅, th╩ d� qu﹏ t譶h, 竚 s竧 c竎 nh﹏ v藅 u n穙 v.v... V� l� c� m藅, n猲 ph秈 m b秓 t譶h b竜 v� nhi謒 v� 頲 ho祅 th祅h tuy謙 i ch輓h x竎. Khi nh薾 nhi謒 v� b� m藅 u ph秈 cho bi誸 danh hi謚 Phi H�."},
				},
				},
	[4] = {
				["Xa Lu﹏ B� Vng"] =
				{
				{"H� D鵦 l� l鵦 lng tinh nhu� c馻 b鎛 阯g. Tuy Phi H� m nh薾 ch鴆 n╪g d� th竚 t輓h b竜, nh� l╪g m� T莕 Th駓 Ho祅g, b秐  S琻 H� X� T綾... u l� c� m藅. Song nhi謒 v� c馻 H� D鵦 l筰 l� nh鱪g nhi謒 v� c� m藅 li猲 quan n s� ti課 tho竔 c馻 b鎛 阯g, kh玭g nh鱪g ph秈 c� tuy謙 k� do th竚 c馻 Phi H�, c遪 ph秈 bi誸 ph鑙 h頿 v韎 c竎 l鵦 lng kh竎 c馻 b鎛 阯g  ho祅 th祅h nhi謒 v�. Kim Cang c馻 b鎛 阯g v� T﹜ H� ph竝 vng u r蕋 tin tng H� D鵦, v� th� c莕 ph秈 cho bi誸 danh hi謚 H� D鵦 khi nh薾 nhi謒 v� c� m藅."},
				},
				["Th竎 B箃 Ho籲g "] =
				{
				{"H� D鵦 l� lng l鵦 tinh nhu� c馻 b鎛 阯g. Tuy Phi H� m nh薾 ch鴆 n╪g d� th竚 t輓h b竜, nh� l╪g m� T莕 Th駓 Ho祅g, b秐  S琻 H� X� T綾... u l� c� m藅. Song c竎 nhi謒 v� c馻 H� D鵦 l筰 l� nh鱪g nhi謒 v� c� m藅 li猲 quan n s� ti課 tho竔 c馻 b鎛 阯g, kh玭g nh鱪g ph秈 c� tuy謙 k� do th竚 c馻 Phi H�, c遪 ph秈 bi誸 ph鑙 h頿 v韎 c竎 l鵦 lng kh竎 c馻 b鎛 阯g  ho祅 th祅h nhi謒 v�. Kim Cang c馻 b鎛 阯g v� T﹜ H� ph竝 vng u r蕋 tin tng H� D鵦, v� th� c莕 ph秈 cho bi誸 danh hi謚 H� D鵦 khi nh薾 nhi謒 v� c� m藅."},
				},
				},
	[5] = {
				["Xa Lu﹏ B� Vng"] =
				{
				{"V� V� l� c竛h tay c l鵦 nh蕋 c馻 Th藀 Чi Kim Cang. Vt qua nh鱪g nhi謒 v� th� th竎h l韓 nh� c馻 Nh蕋 Ph萴 阯g, V� V� c遪 c莕 ph秈 c� l遪g trung th祅h tuy謙 i. Nhi謒 v� c馻 V� V� kh玭g nh鱪g li猲 quan n b鎛 阯g, c遪 li猲 quan n qu鑓 gia, kh玭g nh鱪g ph秈 a b鎛 阯g 甶 l猲 m� c祅g ph秈 gi髉 qu﹏ i T﹜ H� th猰 v鱪g m筺h. Tr竎h nhi謒 c馻 V� V� c騨g ch輓h l� tr竎h nhi謒 v韎 T﹜ H�."},
				},
				["Th竎 B箃 Ho籲g "] =
				{
				{"Ng� H祅h tr薾 ngo礽 vi謈 tr鮪g tr� ph秐 , c遪 l� n琲 t藀 luy謓 c馻 V� V�. V� V� mu鑞 th╪g c蕄 l猲 Kim Cang u ph秈 tr秈 qua th� th竎h c馻 Ng� H祅h tr薾. V� th� Ng� H祅h tr薾 kh玭g ti誴 nh薾 nh鱪g ngi di c蕄 V� V�."},
				},
				},
	}

	i = random(1,getn(strTalk[nTitleIndex][nNpcName]))
	TalkEx("",strTalk[nTitleIndex][nNpcName][i]);
	repeat_add_xb_title();

end