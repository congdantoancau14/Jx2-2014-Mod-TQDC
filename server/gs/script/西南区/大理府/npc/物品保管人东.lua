Include("\\script\\mod\\expand_box\\store_box\\store_box_head.lua");
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 物品保管人脚本
-- Edited by peres
-- 2005/02/22 PM 18:03
-- 2005/05/17 PM 16:45

-- ======================================================

ID_ITEMBOX = 805;
function main()
  nLevel = GetLevel()
		if random(1,30) == 1 then
			NpcChat(GetTargetNpc(),"Nghe n鉯 g莕 y ngi c馻 C玭g D� Th� Gia  nghi猲 c鴘 ra trang b� B竧 Qu竔, kh玭g bi誸 c� ng kh玭g!");
		end;
	if (GetTask(ID_ITEMBOX))==0 and  (nLevel>=10)  then
	
		Say("<color=yellow>Rng ch鴄 <color> l� v藅 kh玭g th� thi誹 khi h祅h t萿 giang h�. H穣 ra ngo礽 th祅h b総 <color=yellow>Th� x竚<color> l蕐 v� <color=yellow>10 c竔 畊玦<color>! Ta s� gi髉 ngi l祄 rng!",
			3,
			"Ta mu鑞 l祄 rng./yes_box",
			"Kh玭g c莕 u./no_box",
			"T譵 hi觰 l頸 輈h rng ch鴄 ./intro_box");
		return
	elseif (GetTask(ID_ITEMBOX))==0 and  (nLevel<10)  then
		Say("<color=yellow>Rng ch鴄 <color> l� v藅 kh玭g th� thi誹 khi gia nh藀 giang h�. Ngi ch璦 t n c蕄 10, t筸 th阨 ch璦 d飊g 頲! дn <color=yellow>c蕄 10<color> h穣 n t譵 ta!",0)
		return
	elseif GetTask(ID_ITEMBOX)==1 then
		check_box();
		return
 	else
	if main_store_box(401) == 0 then return 0 end;
		OpenBox()
		EnableBoxLock(1)
		SetPlayerRevivalPos(401)
		
	end;
end;


function yes_box()
	if GetTask(1) < 25 then	
		Talk(1,"","<color=green>Th� kh�<color>: Ho祅 th祅h <color=yellow>nhi謒 v� t﹏ th�<color> r錳 h絥 n t譵 ta.");
		return 0;
	end;

	SetTask(ID_ITEMBOX,1);
	Say("H穣 t譵 <color=yellow>10 畊玦 Th� x竚<color> v� cho ta!",1,"Ta 甶 ngay y!/box_no");
	TaskTip("Ra ngo礽 th祅h thu th藀 10 畊玦 Th� x竚  l祄 rng ch鴄 !")
end;

function check_box()
	if GetItemCount(2,1,2)<10 then 
		Say("Ngi ch璦 t譵 頲 <color=yellow>10 畊玦 Th� x竚<color> ta c莕, ta kh玭g th� gi髉 ngi l祄 rng ch鴄 !",1,"Ta 甶 t譵 ngay y!/box_no")
	else
		DelItem(2,1,2,10)
		SetTask(ID_ITEMBOX,2) --开放储物箱标记
		Say("Rng ch鴄   l祄 xong! Y猲 t﹎ s� d鬾g nh�!",1,"T鑤 l緈! Xin 產 t�!/box_no")
		Msg2Player("Rng ch鴄   l祄 xong! Y猲 t﹎ s� d鬾g nh�!");
	end;
end;

function no_box()
end;

function intro_box()

	Say("C� th� m� r閚g kho秐g tr鑞g trong rng ch鴄   c蕋 gi�  v藅 kh玭g thng d飊g v� c竎 v藅 ph萴 qu�. Khi m� rng � m閠 th祅h th� n祇 , c� ngh躠 l� ngi  c礽 t 甶觤 v� th祅h t筰 th祅h th� . Ngo礽 ra, ngi c莕 b� ra <color=yellow>20 lng<color> s� d鬾g <color=yellow>ch鴆 n╪g kh鉧 rng<color>  m b秓 an to祅 cho rng ch鴄 . Rng ch鴄  s� 頲 h� th鑞g <color=yellow>t� ng kh鉧 ch苩<color> m鏸 khi ngi r阨 m筺g. N誹 mu鑞 <color=yellow>c礽 t l筰 m藅 m�<color>, c莕 tr� <color=yellow>th猰<color> <color=yellow>2 lng<color> n鱝!",1," t�!/no_box");
end;


