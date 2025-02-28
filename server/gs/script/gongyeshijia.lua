--公冶世家npc脚本
--by vivi
--08/13/2007

Include("\\script\\task\\lingshi_task.lua")
Include("\\script\\lib\\globalfunctions.lua");

--npc，对应扬州、襄阳、大理
tNpcName = {"C玭g D� kh� ","C玭g D� binh ","C玭g D� c� "}
szNpcName = "";

function main()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." v�"..tNpcName[2];		
	end
	szNpcName = gf_FixColor(sNowNpc,2)..": ";
	
	if BigGetItemCount(2,0,1022) < 1 and Zgc_pub_goods_add_chk(1,1) == 1 then
		AddItem(2,0,1022,1,1);
	end
	local strtab = {
		"Ta mu鑞 h頿 th祅h trang b� B竧 qu竔/hecheng_bagua",
		"Ta mu鑞 h頿 th祅h Linh Th筩h/hecheng_lingshi",	
		"Ta mu鑞 g� b� trang b� B竧 qu竔/chongzu_bagua",
		"Ta mu鑞 r髏 Linh Th筩h kh醝 trang b�/chouqu_lingshi",
		"Ta mu鑞 l穘h <b秓 甶觧 B竧 Qu竔>/bagua_baodian",
		"Ta mu鑞 th豱h gi竜 m閠 s� 甶襲/askForInfomation",
		}
	if GetTask(TASK_LINGSHI_ID) == 1 or GetTask(TASK_LINGSHI_ID) == 4 or GetTask(TASK_LINGSHI_ID) == 5 or GetTask(TASK_LINGSHI_ID) == 7 then
		tinsert(strtab,"Ti誴 t鬰 nhi謒 v� h鋍 t藀 Linh Th筩h B竧 Qu竔/new_task");
	end
		tinsert(strtab,"Kh玭g c莕 u/nothing");
	Say("<color=green>"..sNowNpc.."<color>: ch輓h l� ta "..sNowNpc.."Ta c遪 c� hai huynh , "
		..sXiongDi..", l� truy襫 nh﹏ c馻 C玭g tr� th� gia, ta v� l穙 L璾 � Tng Dng  nghi猲 c鴘 ch� t筼 th祅h c玭g Linh Th筩h truy襫 thuy誸 v� b� trang b� B竧 Qu竔 th莕 k�. Ngo礽 ra c遪 ch� ra ch鴆 n╪g <color=red>B竧 Qu竔 l蕐 Linh Th筩h<color>. Kh玭g tin , h穣 nh蕁 ch鋘 <color=green>L蕐 Linh Th筩h<color> xem th� tin t鴆!",
		getn(strtab),
		strtab)
end

function askForInfomation()
	tSay = {
		"Ta mu鑞 t譵 hi觰 c竎h r髏 linh th筩h/how_chouqu",
		"Ta mu鑞 h醝 v� h頿 th祅h b� B竧 Qu竔/detail_bagua",
		"L祄 sao nh薾 頲 Nguy猲 Th筩h, Linh Th筩h v� Linh Th筩h ph鑙 phng?/ziyuanhuode",
		"� kh玭g. C竔 kh竎 c�/main",
		"V穘 b鑙 ch� h醝 ch琲 th玦, 產 t� ti襫 b鑙/nothing",
	};
	Say(szNpcName.."C竎 h� mu鑞 h醝 v� 甶襲 g�?",getn(tSay),tSay);
end;

function hecheng_bagua()
	BaguaCompose(); --合成八卦套装界面
end

function chongzu_bagua()
	--BaguaDepose(); --重铸八卦套装界面
	--Talk(1,"","八卦打散我已经全权交与<color=yellow>襄阳的刘铁匠弟子<color>了，你去襄阳找他吧。");
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." v�"..tNpcName[2];		
	end
	Say("<color=green>"..sNowNpc.."<color>: Xin ch� �! c莕 ph秈 n筽 v祇 <color=red> 10000 lng gi� tr� <color> m韎 c� th� m b秓 khi t竎h ra trang b� c馻 b筺 kh玭g bi課 m蕋.",
		2,
		"M� giao di謓 c/dasan_bagua_item",
		"Kh玭g c� g�/nothing")
end

function dasan_bagua_item()
	BaguaDepose(); --重铸八卦套装界面
end

function chouqu_lingshi()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." v� "..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." v� "..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." v� "..tNpcName[2];		
	end
	TransformAttr(); --抽取灵石
	-- Say("<color=green>"..sNowNpc.."<color>: Trang b� B竧 Qu竔 c騨g c� th� l蕐 頲 Linh Th筩h. B籲g h鱱 c� mu鑞 t譵 hi觰 huy襫 c� n祔 kh玭g?",2,
	-- "Mu鑞 ch�!/how_chouqu",
	-- "Kh醝 甶! Ta hi觰 r錳/chouqu_lingstone")
end

function how_chouqu()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." v�"..tNpcName[2];		
	end
	Talk(1,"chouqu_lingstone","<color=green>"..sNowNpc.."<color>: Ch� c莕 <color=red>trang b�  kh秏 qua Linh Th筩h<color> l� c� th� l蕐 頲 Linh Th筩h ra, Trang b� B竧 Qu竔 th� kh玭g th�! Ch� c莕 d飊g <color=green>Thi猲 C� to祅<color> l� c� th� l蕐, nh璶g ch� l蕐 頲 <color=red>1 Linh Th筩h<color> ra. L蕐 ra xong <color=green>trang b� s� m蕋<color>. Linh Th筩h n誹 b� l蕐 ra nhi襲 l莕 c� th� bi課 t輓h, <color=red>tr� Linh kh� c� th� thay i<color> nh璶g <color=green>Thu閏 t輓h  dng<color> th� v蒼 gi� nguy猲. Thi猲 C� to祅 c� th� xem � <color=yellow>Ng� C竎<color>!")
end

function chouqu_lingstone()
	TransformAttr()
end

function hecheng_lingshi()
	ComposeLingShi();--合成灵石
end

function ziyuanhuode()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." v�"..tNpcName[2];		
	end
	Say("<color=green>"..sNowNpc.."<color>: Xin h穣 xem k� c竎 phng ph竝 c� 頲 nh鱪g v藅 ph萴 li猲 quan Linh Th筩h!",
	5,
	"Nh薾 頲 Nguy猲 Th筩h/yuanshihuode",
	"Nh薾 頲 Linh Th筩h/lingshihuode",
	"H頿 th祅h Linh Th筩h/hechenglingshi",
	"Bi誸 頲 c竎h ph鑙 h頿 Linh Th筩h /lingshipeifanghuode",
	"дn h醝 th╩ th玦 m�!/nothing"
	)
end

function yuanshihuode()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." v�"..tNpcName[2];		
	end
	Talk(1,"","<color=green>"..sNowNpc.."<color>: C� th� n <color=red>Ch� ti謒 T筽 h鉧<color>  mua <color=red>Nguy猲 Th筩h<color>. C莕 ch� �, Nguy猲 Th筩h kh竎 nhau c� v� tr� thu閏 t輓h Linh kh� tng 鴑g kh竎 nhau, Nguy猲 Th筩h kh玭g c飊g ng c蕄 l蕐 頲 thu閏 t輓h t鑙 cao kh竎 nhau, n猲 xem trc thuy誸 minh c� li猲 quan n Nguy猲 Th筩h r錳 h穣 r髏.")
end

function lingshihuode()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." v�"..tNpcName[2];		
	end
	Talk(1,"","<color=green>"..sNowNpc.."<color>Ngo礽 d飊g Nguy猲 Th筩h  r髏 Linh kh� trang b� ra, nghe n鉯 hai nc T鑞g Li猽  c� v� tng s�, ph祄 ai tham gia <color=red>chi課 trng Nh筺 M玭 quan<color> u 頲 thng <color=red>Linh Th筩h<color>, nh璶g mu鑞 c� 頲 Linh Th筩h ph秈 xem x衪 c玭g tr筺g v� bi觰 hi謓 c馻 h�. Truy襫 r籲g b鋘 s竧 th� r蕋 h鴑g th� v韎 Linh Th筩h, c竎 anh h飊g khi g苝 b鋘 <color=red>s竧 th�<color> c莕 l璾 t﹎ xem ch髇g c� mang theo Linh Th筩h n祔 kh玭g.")
end

function hechenglingshi()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." v�"..tNpcName[2];		
	end
	Talk(1,"","<color=green>"..sNowNpc.."<color>: Linh Th筩h n祔 th� gian r蕋 hi誱 th蕐. C竎 v� ti襫 nh﹏  v� c飊g kh� c鵦 nghi猲 c鴘 ra <color=red>Linh Th筩h ph鑙 phng<color>, ch� c莕 <color=red>Linh Th筩h ph鑙 phng<color> v� <color=red>Linh Th筩h<color> c飊g t tr猲 c閠 h頿 th祅h Linh Th筩h  t筼 ra <color=red>Linh Th筩h theo ph鑙 phng<color>. Kh玭g th猰 ph鑙 phng, t飝 � k誴 h頿 Linh Th筩h tuy c� th� h頿 th祅h, nh璶g th祅h c玭g hay kh玭g c遪 do Tr阨 nh.")
end

function lingshipeifanghuode()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." v�"..tNpcName[2];		
	end
	Talk(1,"","<color=green>"..sNowNpc.."<color>: Linh Th筩h ph鑙 phng t� Thng c� l璾 truy襫 n nay kh玭g nhi襲...Ngi c鑞g hi課 cho m玭 ph竔, ho祅 th祅h <color=red>nhi謒 v� s� m玭<color> m鏸 ng祔, tin r籲g chng m玭 s� hi觰 頲 s� n� l鵦 c馻 ngi. C竎 s竧 th� cao c蕄 trong <color=red>S竧 th� 阯g<color> u c� mang theo ph鑙 phng, nh璶g c� l蕐 頲 hay kh玭g c遪 ph秈 xem v薾 kh� c馻 ngi n鱝!")
end

function detail_bagua()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end
	local strtab = {
		"L祄 sao ch� t筼 trang b� B竧 Qu竔?/how_make_bagua",
		"L祄 sao nh薾 頲 Linh Th筩h/how_get_lingshi",
		"L祄 sao k輈h ho箃 b� B竧 Qu竔/how_jihuo_bagua",
		"T筸 th阨 ch璦 ngh� ra g�!/nothing"	
		}
	Say("<color=green>"..sNowNpc.."<color>: B竧 Qu竔 tng tr璶g cho 8 th� l鵦 t� nhi猲 thi猲, a, l玦, phong, th駓, h醓, s琻, tr筩h. Thi猲 a v筺 v藅, kh玭g c� v藅 n祇 kh玭g nh ﹎ dng, kh玭g ph﹏ B竧 Qu竔. N誹 ngi c� trang b� c� n╪g l鵦 B竧 Qu竔, ta c� th� gi髉 k輈h ho箃 n╪g lng B竧 Qu竔.",
		getn(strtab),
		strtab);	
end

function how_make_bagua()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_make_bagua2","<color=green>"..sNowNpc.."<color> Mu鑞 ch� t筼 trang b� B竧 Qu竔 kh玭g d� u\nM閠, ph秈 c� trang b� c� b秐 c� Thi猲 a linh kh�, ngi c� th� ch� t筼 trang b� n祔 nh� k� n╪g s鑞g. M鏸 trang b� c� m閠 <color=red>gi韎 h筺 tr� Linh kh� v� s� l�<color>, gi韎 h筺 tr� Linh kh� quy誸 nh  b襫 c馻 Linh Th筩h 頲 kh秏 v� Qu竔 v� B竧 Qu竔 s� xu蕋 hi謓, s� l� quy誸 nh s� lng Linh Th筩h 頲 kh秏, n誹 mu鑞 t筼 trang b� B竧 Qu竔, c莕 c� 3 l�. Mu鑞 t筼 m閠 trang b� c� gi韎 h筺 tr� Linh kh� cao, ph秈 th猰 nhi襲 v藅 ph萴 <color=red>gi� tr�<color>, t鎛g gi� tr� v藅 ph萴 c祅g cao, t� l� t筼 th祅h trang b� c� tr� Linh kh� c祅g cao.");
end

function how_make_bagua2()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_make_bagua3","<color=green>"..sNowNpc.."<color>Hai, l祄 xong trang b� c� b秐, b総 u kh秏 Linh Th筩h. Tr猲 m鏸 Linh Th筩h u c� tr� Linh kh�, tr� s� Linh kh� l� <color=red>l�<color> th� Linh Th筩h <color=red>Dng<color>, tr� s� l� <color=red>ch絥<color>, th� Linh Th筩h <color=red>﹎<color>. To祅 b� Tr� Linh kh� c馻 Linh Th筩h kh秏 tr猲 m閠 trang b� c� b秐, kh玭g 頲 vt qu� gi韎 h筺 Linh kh� c馻 trang b� . Khi <color=red>Tr� linh kh� Linh Th筩h<color> v鮝 <color=red>b籲g<color> <color=red>gi韎 h筺 tr� Linh kh� c馻 trang b�<color>, trang b� n祔 s� h頿 th祅h m閠 <color=red>Trang b� B竧 Qu竔 ch璦 k輈h ho箃<color>, trang b� m鏸 b竧 v� c� th� c莕 t筼 ra sao. Xin xem 'B竧 Qu竔 B秓 觧'");
end

function how_make_bagua3()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"detail_bagua","<color=green>"..sNowNpc.."<color>: Ba, c� trang b� B竧 Qu竔 ch璦 k輈h ho箃 v蒼 kh玭g th� tham gia v韎 trang b� B竧 Qu竔  k輈h ho箃, mu鑞 tham gia k輈h ho箃 B� B竧 Qu竔, ph秈 k輈h ho箃 trc thu閏 t輓h B竧 Qu竔 tr猲 trang b� B竧 Qu竔. Mang theo trang b� B竧 Qu竔 mu鑞 k輈h ho箃,n c竎 th祅h t譵 <color=red>Th莕 Du Ch﹏ Nh﹏<color>  nh� 玭g ta k輈h ho箃, nh璶g ph秈 ti猽 hao Th竔 H� B竧 Qu竔 B礽 tng 鴑g. Trang b� B竧 qu竔 sau khi  k輈h ho箃 c� th� n g苝 ta  ti課 h祅h h頿 th祅h");
end

function how_get_lingshi()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_get_lingshi2","<color=green>"..sNowNpc.."<color>: C� nhi襲 甶襲 ph秈 n鉯 v� Linh Th筩h\nM閠, mu鑞 nh薾 Linh Th筩h, ph秈 c� Nguy猲 Th筩h trc v� c竎 trang b� hi謚 qu�. Nguy猲 Th筩h n祔 v鮝 c� th� dung n筽 thi猲 a linh kh�, v鮝 c� th� r髏 thu閏 t輓h tr猲 trang b�, sau khi r髏 th祅h c玭g, Nguy猲 Th筩h bi課 th祅h Linh Th筩h tng 鴑g. T� Nguy猲 Th筩h c騨g c� t竎 d鬾g v� cao th蕄 kh竎 nhau, ph﹏ th祅h 7 c蕄 n誹 ng c蕄 Nguy猲 Th筩h kh玭g , kh玭g c� c竎h n祇 dung n筽 thu閏 t輓h cao c蕄 b� sung tr猲 trang b�. Nguy猲 Th筩h ph﹏ th祅h <color=red>Thi猲, мa, Nh﹏<color>, tng 鴑g v韎 3 v� tr� thu閏 t輓h <color=red>1,2,3<color>. Mu鑞 nh薾 頲 thu閏 t輓h � v� tr� n祇 ph秈 d飊g lo筰 Nguy猲 Th筩h .");
end

function how_get_lingshi2()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"detail_bagua","<color=green>"..sNowNpc.."<color>: Hai, trang b� c� thu閏 t輓h linh kh� cao c蕄 r蕋 輙, mu鑞 nh薾 頲 Linh Th筩h cao c蕄, c遪 m閠 c竎h kh竎, t� m譶h<color=red>h頿 th祅h Linh Th筩h<color>, bi課 nhi襲 Linh Th筩h th祅h m閠 Linh Th筩h, n誹 nhi襲 Linh Th筩h c飊g lo筰, kh� n╪g h頿 th祅h Linh Th筩h s� cao. Th阨 chi課 Thng c� Phong Th莕 c� truy襫 l筰 phng ph竝 ph鑙 h頿 h頿 th祅h Linh th筩h, n誹 l蕐 頲 phng ph竝 ph鑙 h頿 n祔, l祄 theo ghi ch衟, b� sung Linh Th筩h tng 鴑g, c� th� h頿 th祅h Linh Th筩h, nh璶g ch璦 C竎 ngi th祅h c玭g...");
end

function how_jihuo_bagua()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_jihuo_bagua2","<color=green>"..sNowNpc.."<color>: Ta d祅h t﹎ huy誸 c� i, nghi猲 c鴘 ra b� B竧 Qu竔 bi課 h鉧 kh玭 lng, c� mu鑞 t譵 hi觰 kh玭g?");
end

function how_jihuo_bagua2()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_jihuo_bagua3","<color=green>"..sNowNpc.."<color>: M閠, mu鑞 k輈h ho箃 b� B竧 Qu竔, u ti猲 ph秈 c� <color=red>trang b� B竧 Qu竔<color> tng 鴑g v韎 m鏸 b� B竧 Qu竔. Sau khi t藀 h頿 trang b� B竧 Qu竔 tng 鴑g, c� th� h頿 th祅h t筰 y. Nh璶g linh kh� m鏸 b� trang b� B竧 Qu竔 kh竎 nhau, hi謚 qu� sau khi k輈h ho箃 v� <color=red>Tr� Linh kh� trang b� B竧 Qu竔<color> tham gia h頿 th祅h c� tng quan, n誹 tr� linh kh� trang b� B竧 Qu竔 tham gia h頿 th祅h qu� th蕄, hi謚 qu� b� B竧 Qu竔 s� th蕄. B� B竧 Qu竔 n祔 khi h頿 th祅h do thi猲 th阨 bi課 h鉧, hi謚 qu� s� kh玭g 鎛 nh. Mu鑞 c� hi謚 qu� t鑤 nh蕋 c莕 th猰 c竎 v藅 ph萴 <color=red>gi� tr�<color>");
end

function how_jihuo_bagua3()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"detail_bagua","<color=green>"..sNowNpc.."<color>: Hai, n誹 kh玭g h礽 l遪g v韎 thu閏 t輓h k輈h ho箃 b� B竧 Qu竔, ch� c莕 th竜 r阨 b� B竧 Qu竔 t筼 b� m韎. Nn璶g n誹 kh玭g th竜 r阨 b� B竧 Qu竔, s� t鎛 th蕋 m閠 s� trang b� trong b� B竧 Qu竔. Mu鑞 n﹏g t� l� th祅h c玭g v� h� th蕄 t鎛 th蕋, ch� c莕 th猰 nhi襲 v藅 ph萴 <color=red>gi� tr�<color> khi c l筰, n誹  gi� tr�, c� th� <color=red>kh玭g h� t鎛 th蕋<color>.");
end

function nothing()

end

function bagua_baodian()
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end
	if GetItemCount(2,1,2639) >= 1 then
		Talk(1,"","<color=green>"..sNowNpc.."<color>: Ch糿g ph秈 ngi  c� m閠 quy觧 r錳 sao?");
	elseif AddItem(2,1,2639,1) == 1 then
		Msg2Player("B筺 nh薾 頲 m閞 B竧 Qu竔 B秓 甶觧");
		Talk(1,"","<color=green>"..sNowNpc.."<color>: 'B竧 Qu竔 B秓 甶觧' n祔 ghi ch衟 li猲 quan n b� B竧 Qu竔!");
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

function new_task()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end
	if GetTask(TASK_LINGSHI_ID) == 1 then
		Say("<color=green>"..sNowNpc.."<color>: Ch� c� Linh Th筩h th� kh玭g 頲, Linh Th筩h n祔 ch� c� kh秏 tr猲 trang b� m韎 ph竧 huy t竎 d鬾g, trang b� Ph� th玭g kh玭g th� kh秏 Linh Th筩h, ch� c� truy襫 t� M筩 Чi, M筩 Nh�, M筩 Tam, C萴 Lang, linh kh� c馻 T� Quy猲 c� nng v� Minh s� ph� m韎 c� th� kh秏 Linh Th筩h, ngi h穣 甶 h醝 m閠 trong s� 6 ngi h� xem",
			3,
			"Ta 甶 t譵 s竨 ngi h� y!/#goto_zhizao_npc(1)",
			"R秐h r鏸 ta s� 甶 t譵 h� sau!/#goto_zhizao_npc(2)",
			"Л頲 r錳, ta  hi觰!/confirm_cancel");	
	elseif GetTask(TASK_LINGSHI_ID) == 4 then
		Say("<color=green>"..sNowNpc.."<color>: kh玭g ng� ngi  甶 頲 t韎 y r錳, sau khi ngi m� giao di謓 k輈h ho箃, nh蕄 v� hi謚 qu� b� B竧 Qu竔 c莕 k輈h ho箃, c╪ c� theo b竧 v�  ch� d蒼 m� s緋 t l猲 trang b� B竧 Qu竔 tng 鴑g. L穙 Th莕 Du a ngi 4 trang b� B竧 Qu竔 n祔 輙 nhi襲 c� th� k輈h ho箃 b� Ti襪 Long, tuy b� n祔  l﹗ kh玭g s鯽 ch鱝, hi謚 qu� k輈h ho箃 r蕋 k衜, nh璶g ngi c� th� xem. Sau  h穣 n t譵 ta.",
			1,
			"Л頲,  ta th� xem!/try_try");
	elseif GetTask(TASK_LINGSHI_ID) == 5 then
		if GetLevel() < 75 then 
			Talk(1,"","<color=green>"..sNowNpc.."<color>: Th� xong ch璦? Л頲 , c� ti襫 , gi�  hi觰 h� th鑞g Linh Th筩h v� B竧 Qu竔, nh璶g mu鑞 hi觰 r� h琻, c莕 xem m藅 truy襫 c馻 'B竧 Qu竔 b秓 甶觧'. Ta v鑞 nh cho ngi m閠 s� phng ph竝 ph鑙 h頿 Linh Th筩h, nh璶g ng c蕄 ngi th蕄 qu� l祄 sao d飊g 頲! дn <color=yellow>c蕄 75<color> h穣 n t譵 ta.");
		else
			Talk(1,"","<color=green>"..sNowNpc.."<color>: Th� xong ch璦? Л頲 , c� ti襫 , gi�  hi觰 h� th鑞g Linh Th筩h v� B竧 Qu竔, nh璶g mu鑞 hi觰 r� h琻, c莕 xem m藅 truy襫 c馻 'B竧 Qu竔 b秓 甶觧'. Ngi ch箉 l﹗ nh� v藋, c鵦 kh� r錳, nh薾 l蕐 Linh Th筩h ph鑙 phng 甶, tuy kh玭g ph秈 th� qu� hi誱 g� nh璶g l� t蕀 l遪g c馻 ta.")
			give_final();
		end
	elseif GetTask(TASK_LINGSHI_ID) == 7 then
		Talk(1,"go_id_one","<color=green>"..sNowNpc.."<color>: R髏 Linh Th筩h ch璦? Quang h閕 Linh Th筩h h髏 ch璦 . N猲 bi誸, Linh Th筩h n祔 th� gian r蕋 hi誱, c鵦 ph萴 Linh Th筩h c祅g kh� ki誱, ti襫 nh﹏ ph秈 tr秈 qua mu玭 ng祅 kh� c鵦, t筼 ra nhi襲 Linh Th筩h ph鑙 phng, ch� c莕 c飊g ph鑙 h頿 Linh Th筩h ph鑙 phng v� Linh Th筩h theo hng d蒼 l� c� th� h頿 th祅h ra Linh Th筩h. Kh玭g th猰 ph鑙 phng, t飝 � k誸 h頿 Linh Th筩h. Tuy c� th� h頿 th祅h, nh璶g th祅h c玭g hay kh玭g l� do m謓h Tr阨. Ngi th� xem!")	
	end
end

function goto_zhizao_npc(nType)
	SetTask(TASK_LINGSHI_ID,2);
	if nType == 1 then
		local nRand = random(1,6);
		NewWorld(tZhizaoNpc[nRand][1],tZhizaoNpc[nRand][2],tZhizaoNpc[nRand][3]);
	end
end

function try_try()
	SetTask(TASK_LINGSHI_ID,5);
end

--经过7后跳回1
function go_id_one()
	for i = 1,5 do
		AddLingShi(343,0,1);
	end
	local add_flog = AddItem(2,21,2325,1,1);
	if add_flog == 1 then
		Msg2Player("B筺 nh薾 頲 5 Linh Th筩h, 1 Linh Th筩h ph鑙 phng");
		SetTask(TASK_LINGSHI_ID,1);
		TaskTip("Th� t筼 ra Linh Th筩h theo ph鑙 phng ghi, sau  t譵 truy襫 nh﹏ C玭g Tr� Th� Gia");
	else
		WriteLog("Nhi謒 v� h� th鑞g Linh Th筩h: ngi ch琲 "..GetName().."Nh薾 Linh Th筩h v� Linh Th筩h ph鑙 phng th蕋 b筰. Log: "..add_flog);
	end
end

