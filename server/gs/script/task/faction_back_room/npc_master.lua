--作者：严军
--创建日期：07年11月13日14:50
--师傅脚本
Include("\\script\\task\\faction_back_room\\back_room_function.lua");
Include("\\script\\task\\faction\\faction_equipment.lua");
g_szThisFile = "\\script\\task\\faction_back_room\\npc_master.lua";	--默认值
g_szInforHeader = "";	--默认值
g_nBackRoomEntryType = 1;	--入口类型，分两种。1表示从师傅处进入，2表示从道具处进入

function main()
--	do return end
--	backroom_main();
backroom_main_entry()
end;

function backroom_main()
	do return end
	Talk(1,"backroom_main_entry","    S� m玭 m藅 th蕋 hi謓  khai m�, c竎 ph竔 u  g鰅 tri謚 t藀 l謓h, k猽 g鋓  t� n ch� Ti誴 d蒼 s� m玭  ti課 h祅h khi猽 chi課 vt 秈. C� th� nh薾 頲 trang b� s� m玭 4. V� tr� Ti誴 d蒼 s� m玭 � c竎 ph竔:\n    Thi誹 L﹎: Huy襫 Kh玭g (205/204)     Л阯g M玭: Л阯g T� M筩 (209/183)\n    Nga My: Tu� V﹏ S� Th竔 (214/191) C竔 Bang: B祅g L� V鋘g (191/200)\n    V� ng: Ti誸 V﹏ Tranh (233/204)   Dng M玭: Dng Di猲 Chi猽 (192/183)\n    Ng� чc: C﹗ S竎h (196/197)");
end;

g_tbDialog = 
{
	[0] = {[0] = "",[1] = "",[2] = "",[3] = ""},
	[1] = 
		{	--少林
			[0] = "<color=green>Huy襫 Kh玭g<color>:",
			[1] = "La H竛 Л阯g  tu s鯽 xong, th藀 b竧 La H竛  quay v�. Ch髇g  t� c� th� v祇 trong tu t藀, tham thi襫, luy謓 v�.",	
			[2] = "T� khi Thi誹 L﹎ t� 頲 s竛g l藀, Чt Ma vi謓, La H竛 阯g 頲 d鵱g l猲 n nay, v� ngh� Thi誹 L﹎ b総 u danh tr蕁 thi猲 h�. La H竛 阯g l� n琲 c� ng� c馻 c竎 h� t� v� t╪g. H� t� v� t╪g 頲 tuy觧 l鵤 kh総 khe t� c竎 t� vi謓, v� ngh� cao th﹎, c� tr竎h nhi謒 canh gi� an to祅 cho Thi誹 L﹎ t�. B﹜ gi� vi謈 tu s鯽  xong, h� ki猰 th猰 vi謈 � S� m玭 m藅 th蕋, gi髉 ch髇g  t� r蘮 luy謓 v� ngh�.",
			[3] = "M藅 th蕋 c馻 b鎛 ph竔 l� La H竛 阯g, ch� cho ph衟  t� b鎛 ph竔 v祇 trong tu luy謓. Trong 阯g c� r蕋 nhi襲 cao th�, c莕 ph秈 h誸 s鴆 c萵 th薾 !",
		},	
	[2] = 
		{	--武当
			[0] = "<color=green>Ti誸 V﹏ Tranh<color>:",
			[1] = "M藅 th蕋 c馻 b鎛 ph竔 l� Huy襫 V� Phong, ch� cho ph衟  t� c馻 b鎛 ph竔 v祇, ch� c莕 thi tri觧 Th� V﹏ Tung th� c� th� l猲 n骾 tu luy謓.",	
			[2] = "Trong b秠 mi hai nh n骾 � V� ng s琻, ch� c� Huy襫 V� Phong m﹜ ph� t� b�, p nh� ti猲 c秐h. C� r蕋 nhi襲 cao s� trong ph竔 l竛h xa c鈏 i t鬰 lu�, 萵 th﹏ tu luy謓 t筰 Huy襫 V� Phong, ﹎ th莔 b秓 v� an to祅 cho t玭g ph竔. N誹 c竎  t� c� g� ch璦 r� trong l骳 luy謓 v�, ho芻 mu鑞 ki觤 tra th鵦 l鵦 c馻 m譶h, u c� th� n Huy襫 V� Phong th� m閠 phen.",
			[3] = "Huy襫 V� Phong thanh t辬h y猲 b譶h, 萵 hi謓 trong m﹜, l� n琲 c竎 ch﹏ nh﹏ trong ph竔 l竛h i luy謓 v�, ch髇g  t� c� th� n  nh薾 ch� gi竜!",
		},	
	[3] = 
		{	--峨嵋
			[0] = "<color=green>Tu� V﹏ S� Th竔<color>:",
			[1] = "S� m玭 m藅 th蕋 c馻 b鎛 ph竔 � V� Tng Gian, ch� c�  t� b鎛 ph竔 m韎 頲 ph衟 n   nh薾 ch� gi竜 c馻 ti襫 b鑙.",	
			[2] = "Ph藅 ph竝 r阨 xa th藀 tng, kh玭g ng� tng, kh玭g ch髇g sinh tng,  g鋓 l� v� tng. V� Tng Gian  頲 ki課 t筼 t� l骳 b鎛 ph竔 khai s琻 l藀 ph竔. Ph竔 ta nh藀 Ph藅 o,  t鮪g g苝 bi誸 bao nhi猽 th╪g tr莔, cho n猲 v� c玭g c馻 Nga My ph竔 ngo礽 vi謈 cng th﹏ h� th�, c遪 d飊g  c鴘 nh﹏  th�. Trong V� Tng Gian c� r蕋 nhi襲 ti襫 b鑙 c馻 b鎛 ph竔, l� nh鱪g ngi t礽 n╪g xu蕋 ch髇g trong s� m玭, ch髇g  t� c� th� n  tham thi襫 ng� Ph藅, tu luy謓 v� ngh�.",
			[3] = "V� Tng Gian l� n琲 tu luy謓 c馻 c竎 b薱 ti襫 b鑙 trong ph竔, ch髇g  t� c� th� n   nh薾 kh秓 nghi謒, ki觤 tra tr譶h  v� h鋍 c馻 b秐 th﹏!",
		},	
	[4] = 
		{	--丐帮
			[0] = "<color=green>B祅g L� V鋘g<color>:",
			[1] = "H祇 Tung C鑓 l� S� m玭 m藅 th蕋 c馻 b鎛 bang, ch� c�  t� b鎛 bang m韎 c� th� n   r蘮 luy謓!",	
			[2] = "N╩  bang ch髇g ta t� ngh躠 � H祇 Tung C鑓, th藅 l� r莔 r� ch璦 t鮪g th蕐,  t n襫 m鉵g cho C竔 Bang ta tr� th祅h Thi猲 h�  nh蕋 bang! Trong bang quy誸 nh ch鋘 H祇 Tung C鑓 l祄 s� m玭 tu luy謓 trng, cho t藀 h頿 truy襫 c玭g trng l穙, thi誸 k� ra nhi襲 c� quan,  ch髇g  t� c� ch鑞 tu luy謓, nh� l筰 s� anh d騨g c馻 c竎 ti襫 b鑙, th骳 gi鬰 ch髇g  t� si猲g n╪g tu luy謓 v� c玭g, l藀 danh tr猲 ch鑞 giang h�!",
			[3] = "Ta l� ngi truy襫 c玭g c馻 b鎛 bang, H祇 Tung C鑓 l� tu luy謓 trng c馻 s� m玭, ch髇g  t� c� th� v祇 y  nh薾 kh秓 nghi謒, tu luy謓 ng祔 m閠 ti課 b�!",
		},	
	[5] = 
		{ 	--唐门	
			[0] = "<color=green>Л阯g T� M筩<color>:",
			[1] = "Л阯g M玭 m藅 th蕋 Tr骳 H秈, ch� cho ph衟  t� c馻 b鎛 m玭 v祇, trong m藅 th蕋 to祅 l� cao th� ti襫 b鑙 c馻 b鎛 m玭, ph秈 h誸 s鴆 c萵 th薾 !",	
			[2] = "Tr骳 H秈 kh玭g thu閏 b鎛 m玭 t� i ph遪g, c� quy t綾 c l藀. C竎 cao th� ti襫 b鑙 c馻 t� i ph遪g u t藀 trung � Tr骳 H秈, b総 u nghi猲 c鴘 c筸 b蓎, 竚 kh� v� ho� kh� m韎, n誹 ch璦 n緈 r� v� c玭g t﹎ ph竝 c馻 b鎛 m玭 th� ch� b衝 m秐g n n琲 n祔. Nh璶g n誹 ch髇g  t� c� l遪g tin, th� nh蕋 nh s� 頲 m� r閚g t莔 m総.",
			[3] = "M藅 th蕋 Tr骳 H秈 l� n琲 t藀 trung c竎 cao th� ti襫 b鑙 � t� i ph遪g c馻 b鎛 m玭,  t� n祇  can m, h穣 n  so t礽!",
		},	
	[6] = 
		{	--杨门
			[0] = "<color=green>Dng Di猲 Chi猽<color>:",
			[1] = "Trung V� Hi謚 Trng l� n琲 tu luy謓 c馻 c竎  t� Dng M玭 ta. Nh蕋 nh m鋓 ngi ph秈 h誸 s鴆 n� l鵦, mang vinh quang v� cho Dng Gia!",	
			[2] = "Gia ph� Dng Nghi謕 nh薾 th� phong c馻 tri襲 nh, m閠 l遪g b竜 qu鑓, tr蕁 th� thi猲 m玭 tr薾. Con ch竨 Dng gia ph秈 c莕 m蒼 luy謓 v�, b竜 琻 tri襲 nh, l祄 r筺g uy danh Dng.Gia qu﹏.",
			[3] = "Dng Gia qu﹏ uy ch蕁 thi猲 h�, Dng Gia Trung V� Hi謚 Trng l� thao trng kh綾 nghi謙 nh蕋 thi猲 h�, kh玭g h� thua k衜 c蕀 qu﹏, ph秈 h誸 s鴆 c萵 th薾 !",
		},	
	[7] = 
		{	--五毒
			[0] = "<color=green>C﹗ S竎h<color>:",
			[1] = "Ng� чc m藅 th蕋 � U Nan Qu藅, ch� cho ph衟  t� b鎛 gi竜 v祇  luy謓 thi c�, nh璶g s鑞g ch誸 do tr阨 nh, ta ph秈 c秐h b竜 ch� v� 甶襲 !",	
			[2] = "B鎛 gi竜 t� l骳 Thi Thng, C� Thng s竛g l藀, v蒼 thng g苝 ph秈 m閠 s� hung th莕 竎 thi v� thi猲 ni猲 c c� r蕋 kh� thu ph鬰. Nh璶g  m韎 l� c� s� c莕 thi誸  cho v� c玭g c馻 b鎛 m玭 ng祔 m閠 ph竧 tri觧. Cho n猲  cho thu th藀 nh鱪g thi c� hi誱 th蕐, t祅g tr� � U Nan Qu藅, ng th阨 ph竔 nh鱪g cao th� ti襫 b鑙 trong gi竜 ph竔 n nghi猲 c鴘. D莕 d�, nh鱪g ti襫 b鑙 n祔 u b� m蕋 h誸 tr� nh�. е t� b鎛 gi竜 c� th� n y  tu luy謓. Nh璶g s鑞g ch誸 do tr阨 nh, n誹 kh玭g th� tr� ra, th� c騨g ng tr竎h s� m玭 kh玭g b竜 trc, ho芻 l� th蕐 ch誸 m� kh玭g c鴘!",
			[3] = "U Nan Qu藅 kh玭g gi鑞g Thi Thng v� C� Thng, l� m藅 th蕋 c馻 s� m玭, ch鴄 y nguy c�, n誹 kh玭g ra 頲 c騨g ng tr竎h s� m玭 v� t譶h !",
		},	
}

function backroom_main_entry()
	local nFaction = 0;
	if g_nBackRoomEntryType == 2 then
		nFaction = GetPlayerFaction();
	else
		nFaction = backroom_get_faction();
	end;
	local szInforHeader = backroom_get_infoheader();
	BR_WeeklyClear();
	local selTab = {
				". Khi猽 chi課 S� m玭 m藅 th蕋/backroom_challenge",
				". Gi韎 thi謚 S� m玭 m藅 th蕋/backroom_know_detail",
				". Xem gi韎 h筺 khi猽 chi課/BR_KnowLimit",
				". T╪g s� l莕 nh薾 ph莕 thng/backroom_reset_award_num",
				". B鑙 c秐h S� m玭 m藅 th蕋/backroom_know_background",
				". Tra b秐g x誴 h筺g/backroom_see_all_faction_rank",
				". фi ph莕 thng/backroom_get_reward",
				". Nh薾 S� m玭 m藅 th蕋 truy襫 t鑞g l謓h/backroom_get_smmscsl",
				"Ta ch� ti謓 阯g h醝 ch琲!/nothing",
				}
	if g_nBackRoomEntryType == 2 then
		tremove(selTab,5);	--去掉师门秘室背景
		tremove(selTab,5);	--去掉查看排行榜
		tremove(selTab,5);	--去掉换取奖励
	end;
	local szDialog = "";
	if nFaction == 0 then
		szDialog = "S� m玭 m藅 th蕋 l� n琲 tu luy謓 d祅h cho  t� b鎛 ph竔, m鏸 l莕 tu luy謓 xong ngi s� c秏 th蕐 th﹏ th� i kh竎, c玭g l鵦 t╪g cao!";
	else
		szDialog = g_tbDialog[nFaction][1];
	end;
	Say(szInforHeader..szDialog.."<color=yellow>Hi謓 t筰 m藅 th蕋 ch� c� 7  kh�<color>.",getn(selTab),selTab);
end;

function backroom_get_smmscsl()
	local szInforHeader = backroom_get_infoheader();
	if GetItemCount(2,0,1054,1) >= 1 then
		Talk(1,"",szInforHeader.."B筺  c� 1 S� m玭 m藅 th蕋 truy襫 t鑞g l謓h trong h祅h trang.");
		return 0;
	end;
	AddItem(2,0,1054,1);
	Msg2Player("B筺 nh薾 頲 1 S� m玭 m藅 th蕋 truy襫 t鑞g l謓h");
end;

function backroom_know_background()
	local szInforHeader = backroom_get_infoheader();
	local nFaction = backroom_get_faction();
	local szDialog = "";
	szDialog = g_tbDialog[nFaction][2]
	Talk(1,"backroom_main_entry",szInforHeader..szDialog);
end;

function backroom_see_all_faction_rank()
	local szInforHeader = backroom_get_infoheader();
	local nFaction = backroom_get_faction();
	if nFaction == 0 then
		nFaction = GetPlayerFaction();
	end;
	if g_nBackRoomEntryType == 1 then	--如果是从师傅处进入
		backroom_see_faction_rank(nFaction);
		return 0;
	end;
	--下面是处理从道具处进入，从道具处进入可以查看任意流派的排行榜
	local selTab = {};
	for i=1,getn(TB_FACTION_NAME) do
		tinsert(selTab,TB_FACTION_NAME[i].."/#backroom_see_faction_rank("..i..")");
	end;
	tinsert(selTab,"H駓 b�/nothing");
	Say(szInforHeader.."B筺 mu鑞 ki觤 tra th玭g tin x誴 h筺g c馻 l璾 ph竔 n祇?",getn(selTab),selTab);
end;

function backroom_reset_award_num()
	local szInforHeader = backroom_get_infoheader();
	if GetTask(TSK_WC_FAIL_TIMES) < MAX_FAILURE_TIMES then
		Talk(1,"",szInforHeader.."Xo� d� li謚 1 tu莕 <color=yellow>"..MAX_FAILURE_TIMES.."<color> l莕 tr� l猲 m韎 c� th� s� d鬾g.");
		return 0;
	end;
	local selTab = {
				"уng �/backroom_reset_award_num_confirm",
				"Kh玭g d飊g /nothing",
				}
	Say(szInforHeader.."Xo� d� li謚 1 tu莕 <color=yellow>"..MAX_FAILURE_TIMES.."<color> l莕 tr� l猲 m韎 c� th� s� d鬾g, m鏸 l莕 ti猽 hao <color=yellow>"..TB_ITEM[1][1].." 50<color> c竔, sau khi s� d鬾g, b筺 c� th� nh薾 頲 b秓 rng � m藅 th蕋 m閠 l莕 n鱝. <color=yellow>T╪g s� l莕 nh薾 ph莕 thng, s� t� ng xo� d� li謚<color>. B筺 x竎 nh薾 mu鑞 s� d鬾g?",getn(selTab),selTab);
end;

function backroom_reset_award_num_confirm()
	local szInforHeader = backroom_get_infoheader();
	if DelItem(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4],50) == 1 then
		SetTask(TSK_WC_FAIL_TIMES,0);
		SetTask(TSK_WC_LAST_RECORD,0);
		Say(szInforHeader.."Х t╪g s� l莕 nh薾 ph莕 thng th祅h c玭g, tu莕 n祔 b筺 c� th� v祇 m藅 th蕋 nh薾 b秓 rng th猰 m閠 l莕 n鱝.",0);
		Msg2Player("Х t╪g s� l莕 nh薾 ph莕 thng th祅h c玭g, tu莕 n祔 b筺 c� th� v祇 m藅 th蕋 nh薾 b秓 rng th猰 m閠 l莕 n鱝");
		WriteLog(LOG_HEADER..GetName().."S� d鬾g S� m玭 m藅 l謓h  t╪g s� l莕 nh薾 ph莕 thng");
	else
		Talk(1,"",szInforHeader.."B筺 c莕 c� <color=yellow>50 c竔 "..TB_ITEM[1][1].."<color>.");
	end;
end;

function backroom_challenge()
	local szInforHeader = backroom_get_infoheader();
	if GetPKValue() >= 4 then
		Talk(1,"",szInforHeader.."Tr� PK c馻 b筺 <color=yellow>l韓 h琻 ho芻 b籲g 4<color>, kh玭g th� v祇 m藅 th蕋.");
		return 0;
	end;
	local nPlayerFaction = GetPlayerFaction();
	local nFaction = backroom_get_faction();
	if nPlayerFaction ~= nFaction and nFaction ~= 0 and g_nBackRoomEntryType == 1 then
		Talk(1,"",szInforHeader.."B筺 kh玭g ph秈 l�  t� b鎛 ph竔, xin h穣 quay v� 甶!");
		return 0;
	end;
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"backroom_main_entry",szInforHeader.."B筺 h穣 t譵 m閠 s� ph� h鋍 v礽 chi猽 r錳 h穣 v祇 m藅 th蕋 tu luy謓.");
		return 0;
	end;
	local selTab = {
				"\n. B総 u khi猽 chi課 t� l莕 t筸 d鮪g trc/backroom_continue_last_record",
				". Ch鋘  kh�, ho祅 th祅h khi猽 chi課/backroom_select_difficulty",
				"\n. Quay l筰/backroom_main_entry",
				". K誸 th骳 i tho筰/nothing",
				}
	if GetTask(TSK_WC_LAST_RECORD) == 0 then
		tremove(selTab,1);	--如果上次没有保存记录
	else
		tremove(selTab,2);	--如果上次有保存记录
		tinsert(selTab,2,"\n. Ta mu鑞 xo� d� li謚/backroom_clear_record");
	end;
	if g_nBackRoomEntryType == 2 then
		nFaction = nPlayerFaction;
	end;
	Say(szInforHeader..g_tbDialog[nFaction][3].."Tu莕 n祔 b筺  v祇 秈 <color=yellow>"..GetTask(TSK_WC_ATTEND_TIMES).."<color> l莕, x鉧 d� li謚 <color=yellow>"..GetTask(TSK_WC_FAIL_TIMES).."<color> l莕. Ch� �, khi s� l莕 x鉧 d� li謚 tu莕 vt qu� <color=yellow>"..MAX_FAILURE_TIMES.."<color> l莕 s� kh玭g th� l蕐 b秓 rng trong m藅 th蕋.",getn(selTab),selTab);
end;

function backroom_clear_record()
	local szInforHeader = backroom_get_infoheader();
	local selTab = {
				"Ph秈, ta mu鑞 x鉧 d� li謚/backroom_clear_record_confirm",
				"Kh玭g c莕/nothing",
				}
	local nLastDiff,nLastStage = BR_GetSaveRecord();
	Say(szInforHeader.."Ti課  l莕 trc b筺 l璾 l� <color=yellow>"..TB_DIFF_NAME[nLastDiff].."<color>  kh� 秈 <color=yellow>"..nLastStage.."<color>, b筺 mu鑞 x鉧 d� li謚 n祔 kh玭g? Ch� �, s� l莕 x鉧 d� li謚 tu莕 vt qu� <color=yellow>"..MAX_FAILURE_TIMES.."<color> l莕 s� kh玭g th� l蕐 b秓 rng trong m藅 th蕋. Tu莕 n祔 b筺  x鉧 d� li謚 <color=yellow>"..GetTask(TSK_WC_FAIL_TIMES).."<color> l莕.",getn(selTab),selTab);
end;

function backroom_clear_record_confirm()
	local szInforHeader = backroom_get_infoheader();
	SetTask(TSK_WC_LAST_RECORD,0);
	SetTask(TSK_WC_FAIL_TIMES,GetTask(TSK_WC_FAIL_TIMES)+1);
	Talk(1,"",szInforHeader.."D� li謚 c馻 b筺  x鉧, trong tu莕 n祔 y l� l莕 th� "..GetTask(TSK_WC_FAIL_TIMES).." x鉧 d� li謚, ngi c� th� ch鋘 l筰   kh�  vt 秈.");
end;

function backroom_select_difficulty()
	local szInforHeader = backroom_get_infoheader();
	local nLevel = GetLevel();
	if nLevel < 50 then
		Talk(1,"",szInforHeader.."Ъng c蕄 c馻 ngi qu� th蕄, kh玭g th� v祇 m藅 th蕋.");
		return 0;
	end;
	local selTab = {};
	if DEBUG_VERSION == 0 then
		selTab = {
--				"[1]"..TB_DIFF_NAME[1].."/#backroom_enter_back_room(1)",
--				"[2]"..TB_DIFF_NAME[2].."/#backroom_enter_back_room(2)",
--				"[3]"..TB_DIFF_NAME[3].."/#backroom_enter_back_room(3)",
				"[ 秈 4]"..TB_DIFF_NAME[4].."/#backroom_enter_back_room(4)",
				}
	else
		for i=1,getn(TB_DIFF_NAME) do
			tinsert(selTab,"["..i.."]"..TB_DIFF_NAME[i].."/#backroom_enter_back_room("..i..")");
		end;
	end;
	tinsert(selTab,"\nв ta suy ngh� l筰/nothing");
	if nLevel >= 50 and nLevel < 70 then
		tremove(selTab,2);
		tremove(selTab,2);
		tremove(selTab,2);
	elseif nLevel >= 70 and nLevel < 80 then
		tremove(selTab,3);
		tremove(selTab,3);		
	elseif nLevel >= 80 and nLevel < 90 then
		tremove(selTab,4);	
	end;
	Say(szInforHeader.."H穣 ch鋘  kh�: ",getn(selTab),selTab);
end;

function backroom_continue_last_record()
	local szInforHeader = backroom_get_infoheader();
	local nLastDiff,nLastStage = BR_GetSaveRecord();
	if nLastDiff <= 0 then
		Talk(1,"backroom_challenge",szInforHeader.."L莕 trc b筺 kh玭g l璾 ti課 .");
		return 0;
	end;
	local selTab = {
				format("Л頲/#backroom_enter_back_room(%d,%d)",nLastDiff,nLastStage),
				"Ta suy ngh� m閠 l竧/nothing",
				}
	local nReadRecordTimes = GetTask(TSK_WC_READ_RECORD_TIMES)+1;
	local nNeedItemNum = 0;
	if nReadRecordTimes > MAX_FREE_READ_RECORD_TIMES then
		nNeedItemNum = 3;
	end;
	Say(szInforHeader.."Ti課  l莕 trc b筺 l璾 l� <color=yellow>"..TB_DIFF_NAME[nLastDiff].."<color>  kh� 秈 <color=yellow>"..nLastStage.."<color> 秈, c ti課  kh玭g nh薾 n鱝"..TB_ITEM[1][1]..". Trong tu莕 n祔 y l� l莕 c ti課  th� <color=yellow>"..nReadRecordTimes.."<color>. B﹜ gi� ngi mu鑞 v祇 秈 n祔  luy謓 ph秈 kh玭g?",getn(selTab),selTab);
end;

function backroom_enter_back_room(nDiff,nStage)
	local szInforHeader = backroom_get_infoheader();
	local nNeedToken = 0;
	if BR_EnterNextStageCheck(nDiff,nStage) == 0 then
		Say(szInforHeader.."B筺 hi謓 kh玭g  甶襲 ki謓  v祇 秈, xin h穣 ki觤 tra gi韎 h筺 vt 秈 � Ti誴 d蒼 m藅 th蕋 s� m玭.",0);
		Msg2Player("B筺 hi謓 kh玭g  甶襲 ki謓  v祇 秈, xin h穣 ki觤 tra gi韎 h筺 vt 秈 � Ti誴 d蒼 m藅 th蕋 s� m玭.");
		return 0;
	end;
	local selTab = {};
	if nStage == nil then
		nNeedToken = 1;	--如果不是读档进的，需要1个师门令牌
		nStage = 1;
		tinsert(selTab,"уng �/#backroom_enter_back_room_confirm("..nDiff..")");	
	else
		tinsert(selTab,"уng �/#backroom_enter_back_room_confirm("..nDiff..","..nStage..")");
	end;
	local nReadRecordTimes = GetTask(TSK_WC_READ_RECORD_TIMES)+1;
	local nNeedItemNum = 0;
--	if nReadRecordTimes > MAX_FREE_READ_RECORD_TIMES then
--		nNeedItemNum = 3;
--	end;
	local szInfo = "";
	local nNeedItemNumEx = 0;
	local szItemName = TB_ITEM[1][1];
	if g_nBackRoomEntryType == 2 then
		nNeedItemNumEx = 2;
		szInfo = "<color=yellow> d飊g h錳 ph� m藅 th蕋 v祇 秈 c莕 t鑞 "..szItemName..nNeedItemNumEx.." <color>.";
	end;
	local nTotalNeedNum = nNeedItemNum+nNeedItemNumEx;
	tinsert(selTab,"T筸 th阨 kh玭g v祇/nothing");
	Say(szInforHeader.."Ngi c� mu鑞 v祇 秈 <color=yellow>"..TB_DIFF_NAME[nDiff].."<color> 秈 <color=yellow>"..nStage.."<color> kh玭g?"..szInfo.."T鎛g c閚g ngi ph秈 t鑞 <color=yellow> "..nNeedToken.."<color> l謓h b礽 s� m玭 v� <color=yellow>"..szItemName..nTotalNeedNum.."<color>.",getn(selTab),selTab);
end;

function backroom_enter_back_room_confirm(nDiff,nStage)	--param1:difficulty，从中断处进时，nStage不为nil
	local szInforHeader = backroom_get_infoheader();
	local nReadRecordTimes = GetTask(TSK_WC_READ_RECORD_TIMES)+1;
	local nNeedItemNum = 0;
	local nNeedItemNumEx = 0;
--	if nReadRecordTimes > MAX_FREE_READ_RECORD_TIMES then
--		nNeedItemNum = 3
--	end;
	local szItemName = TB_ITEM[1][1];
	local szInfo = "";
	if g_nBackRoomEntryType == 2 then
		nNeedItemNumEx = 2;
		szInfo = "<color=yellow> d飊g h錳 ph� m藅 th蕋 v祇 秈 c莕 t鑞 "..szItemName..nNeedItemNumEx.." <color>,";
	end;
	local nTotalNeedNum = nNeedItemNum + nNeedItemNumEx;
	if nStage ~= nil then	--如果是读档进的
		if GetItemCount(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4]) < nTotalNeedNum then
			Talk(1,"",szInforHeader.."Tu莕 n祔 ngi  i <color=yellow>"..nReadRecordTimes.."<color> l莕 c ti課 , c莕 <color=yellow>"..nNeedItemNum.."<color> c竔"..szItemName.."."..szInfo.."S� lng "..szItemName.."S� lng kh玭g , t鎛g c閚g c莕 "..nTotalNeedNum.."c竔"..szItemName..".");
			return 0;
		end;
	else
		if GetItemCount(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4]) < nNeedItemNumEx then
			Talk(1,"",szInforHeader..szInfo.."S� lng "..szItemName.."S� lng kh玭g .");
			return 0;
		end;
	end;
	local nFaction = GetPlayerFaction();
	local nRoute = GetPlayerRoute();
	local nCurMapID = GetWorldPos();
	local nRoomID,nRoomIdx,nRoomCount = BR_FindIdleRoom(nFaction,g_nBackRoomEntryType);
	if nRoomID == 0 then
		Talk(1,"",szInforHeader.."T筸 th阨 kh玭g c� khu thi u  luy謓, v祇 sau nh�.");
		return 0;
	end;
	if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nRoomID) == MS_STATE_IDEL then
		if nStage == nil then	--如果不是读档进的就要收师门令牌
			if BR_DelLingPai(nFaction,1) ~= 1 then
				Talk(1,"",szInforHeader.."Ngi c莕 ph秈 c� l謓h b礽 s� m玭 m韎 c� th� v祇 m藅 th蕋.");
				return 0;
			end;
		end;
		if mf_OpenMission(MISSION_ID,nRoomID) == 1 then
			DelItem(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4],nTotalNeedNum);
			if nStage == nil then
				nStage = 1;
				SetTask(TSK_ENTER_TYPE,0);	--非读档进的
			else	--用这个来判断是不是从中断处进的
				SetTask(TSK_WC_READ_RECORD_TIMES,nReadRecordTimes);
				SetTask(TSK_ENTER_TYPE,1);	--读档进的
			end;
			if g_nBackRoomEntryType == 1 then	--从门派处进
				mf_SetMissionV(MISSION_ID,MV_MAP_TYPE,nRoute,nRoomID);
			else	--从道具处进
				mf_SetMissionV(MISSION_ID,MV_MAP_TYPE,0,nRoomID);
			end;
			mf_SetMissionV(MISSION_ID,MV_CUR_DIFF,nDiff,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_CUR_STAGE,nStage,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_MAPID,nRoomID,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_MAPIDX,nRoomIdx,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_ENTRY_MAPID,nCurMapID,nRoomID);
			mf_JoinMission(MISSION_ID,0,nRoomID);
		end;
	end;
end;

function backroom_know_detail()
	local szInforHeader = backroom_get_infoheader();
	Talk(2,"backroom_know_detail_2",szInforHeader.."\n    M藅 th蕋 s� m玭 m鏸 9 秈 l� m閠 tu莕 ho祅, 9 tu莕 ho祅 t鎛g c閚g l� 81 秈. ч kh� t╪g d莕, khi猽 chi課 chi課 th緉g th� c� th� vt qua 秈.\n    Quy nh v祇: M鏸 l莕 khi猽 chi課 c莕 t鑞 1 l謓h b礽 s� m玭 c馻 m玭 ph竔 tng 鴑g, m鏸 tu莕 c� th� v祇 khi猽 chi課 v� h筺, nh璶g ch� c� "..MAX_FAILURE_TIMES.." v遪g khi猽 chi課 qua 秈 trc  ho芻 s� l莕 x鉧 d� li謚 nh� h琻 "..MAX_FAILURE_TIMES.." l莕 m韎 nh薾 頲 ph莕 thng (vt 秈 s� t� ng x鉧 d� li謚). C� th� t╪g, nh薾 s� l莕 ph莕 thng, m鏸 l莕 ti猽 hao 50 m藅 th蕋 s� m玭. Ngo礽 ra khi b総 u m鏸 秈 s� h駓 tr筺g th竔 Th� Th﹏ ph� v� 甶觤 s竧 kh� c馻 nh﹏ v藅. T蕋 c� dc hi謚 v� k� n╣ CD x鉧 th祅h 0, sinh l鵦 n閕 l鵦 b� sung t鑙 產.","    H筺 ch� vt 秈: Ъng c蕄 c馻 ngi ch琲, thu閏 t輓h nh� trang b� danh hi謚 s� 秐h hng n  kh� l韓 nh蕋 c� th� ti課 h祅h vt 秈, khi v祇 秈 s� ki觤 tra n誹 ch璦 t y猽 c莡 th� a ra kh醝 m藅 th蕋 s� m玭, trc khi v祇 秈 h穣 x竎 nh薾 k誸 qu� ki觤 tra. Chi ti誸 h筺 ch� h穣 xem chi ti誸 h筺 ch� khi猽 chi課. \n    襲 ki謓 th蕋 b筰: T� vong, quy ph筸 秈 c bi謙, khi vt 秈 gi韎 h筺 t 頲 s� 秐h hng n s� th蕋 b筰 c馻 khi猽 chi課. \n    B祅g x誴 h筺g: Ngi ch琲 t� 秈 th� nh蕋 c馻 m鏸 tu莕 ho祅 n 秈 cu鑙 c飊g c馻 tu莕 ho祅 n祔, m鏸 l莕 vt 秈 s� 頲 ghi l筰 th阨 gian v� a s� li謚 v祇 b秐g danh s竎h. R阨 kh醝 n鯽 ch鮪g, th蕋 b筰 s� kh玭g ghi l筰 th阨 gian. M鏸 l璾 ph竔 m鏸 tu莕 ho祅 u c� 1 danh s竎h. ");
end;

function backroom_know_detail_2()
	local szInforHeader = backroom_get_infoheader();
	Talk(2,"backroom_main_entry",szInforHeader.."\n    L璾 d� li謚: Ngi ch琲 th玭g qua 秈 4, 8, 9 v� sau khi nh薾 ph莕 thng d� li謚 s� t� ng 頲 l璾 v祇 秈 hi謓 t筰. D� li謚 s� kh玭g 頲 x鉧 t� ng, nh璶g c� th� x鉧 th� c玭g. Khi c� d� li謚, c� th� nh蕁 b総 u vt 秈 t� d� li謚."..MAX_FREE_READ_RECORD_TIMES.."L莕 trc nh蕁 b総 u khi猽 chi課 t� file l� mi詎 ph�, sau  m鏸 l莕 c file v祇 s� c莕 3 M藅 th蕋 s� m玭 l謓h. \n    Nh秠 秈: Theo ng c蕄 c馻 ngi ngi c� th� ch鋘 tr鵦 ti誴 t�  kh� n祇   b総 u khi猽 chi課. \n    C蕄 50-69   kh玭g th� nh秠 秈\n    C蕄 70-79 b総 u t� ti觰 th� ng璾 產o\n    C蕄 80-89 b総 u t� ti觰 th祅h s� di詎\n    C蕄 90 tr� l猲 b総 u t� thi kuy謓 v� ngh�","    Th阨 gian ngh� ng琲: Th阨 gian ngh� ng琲 ch� c� 5 ph髏, n gi� v蒼 ch璦 vt 秈 s� b� a v祇 秈 k�, ch璦 v祇 秈 h筺 ch� c bi謙 s� b� a ra kh醝 秈. \n    Nh薾 秈: Trong khi vt 秈 v� t� vong d蒼 n vt 秈 th蕋 v鋘g th� c� th� nh薾 秈, s� tr鵦 ti誴 khi猽 chi課 秈 n祔, s� kh玭g b� a ra m藅 th蕋 s� m玭. M鏸 l莕 t鑞 2 M藅 th蕋 s� m玭 l謓h.");
end;

function backroom_see_faction_rank(nFaction)
	local szInforHeader = backroom_get_infoheader();
	local selTab = {};
	for i=1,getn(TB_FACTION_ROUTE[nFaction]) do
		selTab[i] = TB_FACTION_ROUTE[nFaction][i][2].."/#backroom_see_route_rank("..TB_FACTION_ROUTE[nFaction][i][1]..")";
	end;
	tinsert(selTab,"\nK誸 th骳 i tho筰/nothing");
	Say(szInforHeader.."Ngi mu鑞 xem th玭g tin danh s竎h h� ph竔 n祇?",getn(selTab),selTab);
end;

function backroom_see_route_rank(nRoute)
	local szInforHeader = backroom_get_infoheader();
	local selTab = {}
	for i=1,getn(TB_DIFF_NAME) do
		tinsert(selTab,"Xem ["..i.."]"..TB_DIFF_NAME[i].." Danh s竎h  kh�/#backroom_get_rank("..nRoute..","..i..")");
	end;
	tinsert(selTab,"Quay l筰 i tho筰 tr猲/backroom_see_all_faction_rank");
	tinsert(selTab,"K誸 th骳 i tho筰/nothing");
	for i=1,9 do
		DelRelayShareDataCopy(BACKROOM_RELAY_KEY,nRoute,i);
	end;
	Say(szInforHeader.."Ngi mu鑞 xem"..gf_GetRouteName(nRoute).." th玭g tin danh s竎h  kh� n祇?",getn(selTab),selTab);
end;

function backroom_get_rank(nRoute,nDiff)
	ApplyRelayShareData(BACKROOM_RELAY_KEY,nRoute,nDiff,g_szThisFile,"backroom_callback_get_rank");
end;

function backroom_callback_get_rank(szKey,nKey1,nKey2,nRecordCount)
	local szInforHeader = backroom_get_infoheader();
	if nRecordCount == 0 then
		Talk(1,"backroom_see_all_faction_rank",szInforHeader.."Hi謓 t筸 th阨 kh玭g c� th玭g tin danh s竎h li猲 quan");
		return 0;
	end;
	local szString = "";
	if nRecordCount > 8 then
		nRecordCount = 8;	--只排前8名
	end;
	local szName = "";
	local nTime = 0;
	local szFormatTime = "";
	for i=1,nRecordCount do
		szName,nTime = GetRelayShareDataByIndex(szKey,nKey1,nKey2,i-1);
		szFormatTime = tf_GetTimeString(nTime);
		szString = szString..gf_FormatStringLength(i,6);
		szString = szString..gf_FormatStringLength(szName,18);
		szString = szString..gf_FormatStringLength(szFormatTime,20);
		szString = szString.."\n";
	end;
	Talk(1,"#backroom_see_route_rank("..nKey1..")",gf_GetRouteName(nKey1).."M藅 th蕋 s� m玭 ["..nKey2.."]"..TB_DIFF_NAME[nKey2].." 8 ngi d蒼 u  kh�: \n"..gf_FormatStringLength("H筺g",6)..gf_FormatStringLength("T猲",18)..gf_FormatStringLength("T鎛g th阨 gian",20).."\n"..szString);
end;

function backroom_get_reward()
	local szInforHeader = backroom_get_infoheader();
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",szInforHeader.."Ngi ph秈 gia nh藀 l璾 ph竔 trc m韎 c� th� i ph莕 thng.");
		return 0;
	end;
	local selTab = {
				". фi v藅 ph萴 ti猽 hao/backroom_exchange_normal_item",
				". фi M藅 t辌h s� m玭, T﹎ ph竝 v� Quy誸 y誹/backroom_exchange_faction_item",
				". фi trang b� s� m玭 m韎/backroom_equip_reward",
				". V藅 ph萴 cao c蕄 i v藅 ph萴 c蕄 1/backroom_exchange_totem",
				". фi m秐h M藅 t輈h tr蕁 ph竔/backroom_exchange_zhenpai",
				". 襲 ch豱h l鵦 nh c馻 v� kh� s� m玭/backroom_exchange_attack",
				"Quay l筰 i tho筰 tr猲/backroom_main_entry",
				"Kh玭g c� g�/nothing",
				}
	Say(szInforHeader.."Ngi mu鑞 i ph莕 thng n祇?",getn(selTab),selTab);
end;

function backroom_exchange_totem()
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."Ngi ph秈 gia nh藀 l璾 ph竔 trc m韎 c� th� i trang b� s� m玭.");
		return 0;
	end;
	local szInforHeader = backroom_get_infoheader();
	local selTab = {
			". V藅 ph萴 c蕄 2 i v藅 ph萴 c蕄 1 (t� l� i 1:1)/#backroom_exchange_totem_type(2)",
			". V藅 ph萴 c蕄 3 i v藅 ph萴 c蕄 1 (t� l� i 1:2)/#backroom_exchange_totem_type(3)",
			"Quay l筰 i tho筰 tr猲/backroom_get_reward",
			"Kh玭g i/nothing",
			};
	Say(szInforHeader.."Ngi c� th� l蕐 v藅 ph萴 cao c蕄 c馻 m藅 th蕋 s� m玭 d� i th祅h v藅 ph萴 c蕄 1 d飊g  фi v藅 ph萴 ti猽 hao s� m玭.",getn(selTab),selTab);
end;

function backroom_exchange_totem_type(nType)
	local szInforHeader = backroom_get_infoheader();
	local nFaction = GetPlayerFaction();
	local nID1 = TB_TOTEM_INFO[nFaction][nType][1];
	local nID2 = TB_TOTEM_INFO[nFaction][nType][2];
	local nID3 = TB_TOTEM_INFO[nFaction][nType][3];
	local szTotemName = TB_TOTEM_INFO[nFaction][nType][4];
	local nTotemCount = GetItemCount(nID1,nID2,nID3);
	if nTotemCount <= 0 then
		Talk(1,"backroom_exchange_totem",szInforHeader.."Ngi kh玭g c� <color=yellow>"..szTotemName.."<color> �!!");
		return 0;
	end;
	SetTaskTemp(TTSK_NORMAL_ITEM_TYPE,nType);
	AskClientForNumber("backroom_exchange_totem_confirm",1,min(nTotemCount,100),"Ngi mu鑞 d飊g bao nhi猽  i?");	--１次最多换１００个
end;

function backroom_exchange_totem_confirm(nCount)
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."Ngi ph秈 gia nh藀 l璾 ph竔 m韎 c� th� i.");
		return 0;
	end;
	local nFaction = GetPlayerFaction();
	local nType = GetTaskTemp(TTSK_NORMAL_ITEM_TYPE);
	local nID1 = TB_TOTEM_INFO[nFaction][nType][1];
	local nID2 = TB_TOTEM_INFO[nFaction][nType][2];
	local nID3 = TB_TOTEM_INFO[nFaction][nType][3];
	local szTotemName = TB_TOTEM_INFO[nFaction][nType][4];
	local nTotemCount = GetItemCount(nID1,nID2,nID3);
	if nTotemCount < nCount then
		Talk(1,"backroom_exchange_totem",szInforHeader.."Ngi  i <color=yellow>"..szTotemName.."<color> kh玭g  <color=yellow>"..nCount.."<color> �!!");
		return 0;
	end;
	local nLV1ID1 = TB_TOTEM_INFO[nFaction][1][1];
	local nLV1ID2 = TB_TOTEM_INFO[nFaction][1][2];
	local nLV1ID3 = TB_TOTEM_INFO[nFaction][1][3];
	local szLV1TotemName = 	TB_TOTEM_INFO[nFaction][1][4];
	local nLV1TotemCount = 0;
	if nType == 2 then
		nLV1TotemCount = nCount;	--比率1：1
	else
		nLV1TotemCount = 2*nCount;	--比率1：2
	end;
	if gf_JudgeRoomWeight(2,nLV1TotemCount*5,"") == 0 then
		return 0;
	end;
	if DelItem(nID1,nID2,nID3,nCount) == 1 then
		AddItem(nLV1ID1,nLV1ID2,nLV1ID3,nLV1TotemCount);
		Msg2Player("B筺 i "..nCount.."c竔"..szTotemName.." r錳"..nLV1TotemCount.."c竔"..szLV1TotemName);
		WriteLog(LOG_HEADER..GetName().."(m玭 ph竔:"..nFaction..") d飊g "..nCount.."c竔"..szTotemName.." r錳"..nLV1TotemCount.."c竔"..szLV1TotemName);
	end;
end;

function backroom_exchange_normal_item()
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."Ngi ph秈 gia nh藀 l璾 ph竔 m韎 c� th� i ph莕 thng.");
		return 0;
	end;
	backroom_list_normal_item(1,getn(TB_NORMAL_ITEM));
end;

function backroom_list_normal_item(nPageNum,nCount)
	local szInforHeader = backroom_get_infoheader();
	local tMedList = backroom_get_normal_item_list();
	local selTab = {};
	local nItemPerPage = 5;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nCount);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("Trang trc \n /#backroom_list_normal_item(%d,%d)",nPageNum-1,nCount));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tMedList[i]);
	end;
	if nPageNum ~= ceil(nCount/nItemPerPage) then
		tinsert(selTab,format("\n Trang sau/#backroom_list_normal_item(%d,%d)",nPageNum+1,nCount));	
	end;
	tinsert(selTab,"в ta ngh� l筰/nothing");
	Say(szInforHeader.."Ngi mu鑞 i lo筰 v藅 ph萴 ti猽 hao n祇?",getn(selTab),selTab);
end;

function backroom_get_normal_item(nType)
	local szInforHeader = backroom_get_infoheader();
	local nFaction = GetPlayerFaction();
	local nTotemCount = GetItemCount(TB_TOTEM_INFO[nFaction][1][1],TB_TOTEM_INFO[nFaction][1][2],TB_TOTEM_INFO[nFaction][1][3]);
	local nNeedNum = TB_NORMAL_ITEM[nType][5];
	local nMedCount = floor(nTotemCount/nNeedNum);
	if nMedCount <= 0 then
		Talk(1,"backroom_exchange_normal_item",szInforHeader.."S� lng huy hi謚 c馻 ngi kh玭g , x竎 nh薾 tr猲 ngi ngi 輙 nh蕋 c� <color=yellow>"..nNeedNum.."c竔"..TB_TOTEM_INFO[nFaction][1][4].."<color>.");
		return 0;
	end;
	SetTaskTemp(TTSK_NORMAL_ITEM_TYPE,nType);
	AskClientForNumber("backroom_get_normal_item_confirm",1,min(nMedCount,100),"B筺 mu鑞 i bao nhi猽?");	--１次最多换１００个
end;

function backroom_get_normal_item_list()
	local nFaction = GetPlayerFaction();
	local tSelTab = {};
	for i=1,getn(TB_NORMAL_ITEM) do
		tinsert(tSelTab,format(TB_NORMAL_ITEM[i][1].."("..TB_NORMAL_ITEM[i][5].."c竔"..TB_TOTEM_INFO[nFaction][1][4].." c閚g "..TB_NORMAL_ITEM[i][6].." v祅g i 1 )/#backroom_get_normal_item(%d)",i));
	end;
	return tSelTab;
end;

function backroom_get_normal_item_confirm(nCount)
	local szInforHeader = backroom_get_infoheader();
	if nCount <= 0 then
		return 0;
	end;
	local nFaction = GetPlayerFaction();
	local nType = GetTaskTemp(TTSK_NORMAL_ITEM_TYPE);
	local nNeedMoney = TB_NORMAL_ITEM[nType][6]*nCount;
	local nNeedNum = TB_NORMAL_ITEM[nType][5]*nCount;
	local nTotemID1 = TB_TOTEM_INFO[nFaction][1][1];
	local nTotemID2 = TB_TOTEM_INFO[nFaction][1][2];
	local nTotemID3 = TB_TOTEM_INFO[nFaction][1][3];
	if GetItemCount(nTotemID1,nTotemID2,nTotemID3) < nNeedNum then
		Talk(1,"backroom_exchange_normal_item",szInforHeader.."S� lng huy hi謚 c馻 ngi kh玭g , x竎 nh薾 tr猲 ngi ngi 輙 nh蕋 c� <color=yellow>"..nNeedNum.."c竔"..TB_TOTEM_INFO[nFaction][1][4].."<color>.")	
		return 0;
	end;
	if GetCash() < nNeedMoney*10000 then
		Talk(1,"",szInforHeader.."V祅g kh玭g , x竎 nh薾 輙 nh蕋 ngi c� <color=yellow>"..(nNeedMoney).."v祅g<color>.");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,nCount*5,"") == 0 then
		return 0;
	end;
	local szItemName = TB_NORMAL_ITEM[nType][1];
	local nItemID1 = TB_NORMAL_ITEM[nType][2];
	local nItemID2 = TB_NORMAL_ITEM[nType][3];
	local nItemID3 = TB_NORMAL_ITEM[nType][4];
	Pay(nNeedMoney*10000);
	if DelItem(nTotemID1,nTotemID2,nTotemID3,nNeedNum) == 1 then
		AddItem(nItemID1,nItemID2,nItemID3,nCount);
		Msg2Player("Ngi  i "..nCount.."c竔"..szItemName);
		WriteLog(LOG_HEADER..GetName().."(m玭 ph竔:"..nFaction..") r錳"..nCount.."c竔"..szItemName);
	end;
end;

backroom_tbNeedTotem = 
{
	[4] = 
	{
		[1] = {0,110,0},	--师门第4套帽子
		[2] = {0,130,0},	--师门第4套衣服
		[3] = {0,110,0},	--师门第4套裤子
		[4] = {0,150,0},	--师门第4套首饰1
		[5] = {0,150,0},	--师门第4套首饰2
		[6] = {0,240,0},	--师门第4套武器
	},
	[5] = 
	{
		[1] = {0,0,240},	--师门第5套帽子
		[2] = {0,0,360},	--师门第5套衣服
		[3] = {0,0,240},	--师门第5套裤子
		[4] = {0,0,480},	--师门第5套首饰1
		[5] = {0,0,480},	--师门第5套首饰2
		[6] = {0,0,720},	--师门第5套武器
	},
}

function backroom_equip_reward()
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."Ngi ph秈 gia nh藀 l璾 ph竔 trc m韎 c� th� i trang b� s� m玭.");
		return 0;
	end;
	local selTab = {
				"Xem thu閏 t輓h trang b� m韎/backroom_see_equip_info",
				"фi trang b� s� m玭 m韎/backroom_exchange_equip",
				"Quay l筰 i tho筰 tr猲/backroom_get_reward",
				"Kh玭g i/nothing",
				}
	Say(szInforHeader.."Ngi mu鑞 i trang b� s� m玭 kh玭g?",getn(selTab),selTab);
end;

function backroom_see_equip_info()
	local nFaction = backroom_get_faction();
	local szInforHeader = backroom_get_infoheader();
	local tb = {90,94,92,93,91,95,96};
	if nFaction == 0 then
		Talk(1,"",szInforHeader.."� y kh玭g th� xem thu閏 t輓h trang b� m韎.");
		return 0;
	end;
	Sale(tb[nFaction],100,1);
end;

function backroom_exchange_equip()
	local szInforHeader = backroom_get_infoheader();
	local nPlayerFaction = GetPlayerFaction();
	local nFaction = backroom_get_faction();
	if nPlayerFaction ~= nFaction and nFaction ~= 0 and g_nBackRoomEntryType == 1 then
		Talk(1,"",szInforHeader.."Ngi kh玭g ph秈  t� b鎛 ph竔, kh玭g th� i trang b� s� m玭!");
		return 0;
	end;
	local selTab = {
				"Trang b� s� m玭 4/#backroom_get_equip_reward(4)",
				"Trang b� s� m玭 5/#backroom_get_equip_reward(5)",
				"Quay l筰 i tho筰 tr猲/backroom_equip_reward",
				"Kh玭g i/nothing",
				}
	Say(szInforHeader.."Ngi mu鑞 i trang b� s� m玭 n祇?",getn(selTab),selTab);
end;

function backroom_get_equip_reward(nGeneration)
	local szInforHeader = backroom_get_infoheader();
	local nRoute = GetPlayerRoute();
	local selTab = {
				backroom_get_equip_name(nRoute,nGeneration,1).."/#backroom_get_equip("..nGeneration..",1)",
				backroom_get_equip_name(nRoute,nGeneration,2).."/#backroom_get_equip("..nGeneration..",2)",
				backroom_get_equip_name(nRoute,nGeneration,3).."/#backroom_get_equip("..nGeneration..",3)",
				backroom_get_equip_name(nRoute,nGeneration,4).."/#backroom_get_equip("..nGeneration..",4)",
				backroom_get_equip_name(nRoute,nGeneration,5).."/#backroom_get_equip("..nGeneration..",5)",
				backroom_get_equip_name(nRoute,nGeneration,6).."/#backroom_get_equip("..nGeneration..",6)",
				"Quay l筰 i tho筰 tr猲/backroom_exchange_equip",
				"Kh玭g i/nothing",
				}
	Say(szInforHeader.."Ngi mu鑞 i trang b� n祇 di y?",getn(selTab),selTab);
end;

function backroom_get_equip(nGeneration,nType)
	local szInforHeader = backroom_get_infoheader();
	local nRoute = GetPlayerRoute();
	local nFaction = GetPlayerFaction();
	local szEquipName = backroom_get_equip_name(nRoute,nGeneration,nType);
	local selTab = {};
	local nTotemNum = 0;
	local szTotemName = "";
	for i=1,3 do
		nTotemNum = backroom_tbNeedTotem[nGeneration][nType][i];
		if nTotemNum > 0 then
			szTotemName = TB_TOTEM_INFO[nFaction][i][4];
			tinsert(selTab,"X竎 nh薾 i (ti猽 hao "..nTotemNum.."c竔"..szTotemName..")/#backroom_get_equip_confirm("..nGeneration..","..nType..","..i..")");
		end;
	end;
	tinsert(selTab,"Quay l筰 i tho筰 tr猲/#backroom_get_equip_reward("..nGeneration..")");
	tinsert(selTab,"Kh玭g i/nothing");
	Say(szInforHeader.."Ngi mu鑞 i <color=yellow>"..szEquipName.."<color> ch�?",getn(selTab),selTab);
end;

function backroom_get_equip_name(nRoute,nGeneration,nType)
	local szName = fe_tbFactionEquipExName[nRoute][nGeneration][nType];
	return szName;
end;

function backroom_get_equip_confirm(nGeneration,nType,nTotemType)
	local szInforHeader = backroom_get_infoheader();
	if gf_JudgeRoomWeight(3,500,"") ~= 1 then
		return 0;
	end;
	local nFaction = GetPlayerFaction();
	local tb = TB_TOTEM_INFO[nFaction][nTotemType];
	local nNeedTotemNum = backroom_tbNeedTotem[nGeneration][nType][nTotemType];
	local szTotemName = tb[4];
	if GetItemCount(tb[1],tb[2],tb[3]) < nNeedTotemNum then
		Talk(1,"#backroom_get_equip_reward("..nGeneration..")",szInforHeader.."<color=yellow>"..szTotemName.."<color> kh玭g .")	
		return 0;	   
	end;
	DelItem(tb[1],tb[2],tb[3],nNeedTotemNum);
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	fe_AddFactionEquipmentEx(nRoute,nBody,nGeneration,nType);
	local szEquipName = backroom_get_equip_name(nRoute,nGeneration,nType);
	Msg2Player("B筺 nh薾 頲 "..szEquipName);
	WriteLog(LOG_HEADER..GetName().."Nh薾 頲 1 trang b� s� m玭:"..szEquipName..",nGeneration:"..nGeneration..",nType:"..nType);
end;
--根据当前地图来判断这个师傅是哪个门派的
function backroom_get_faction()
	local nMapID = GetWorldPos();
	local tbFactionMapID = {204,312,303,209,305,219,407};
	for i=1,getn(tbFactionMapID) do
		if nMapID == tbFactionMapID[i] then
			return i;
		end;
	end;
	return 0;
end;

function backroom_get_infoheader()
	if g_nBackRoomEntryType == 2 then	--如果是从道具处打开
		return "";
	end;
	local nFaction = backroom_get_faction();
	local szInfoHeader = g_tbDialog[nFaction][0];
	return szInfoHeader;
end;

function backroom_exchange_faction_item()
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",szInforHeader.."Ngi v� m玭 v� ph竔 kh玭g 頲 i v藅 ph萴 n祔.");
		return 0;
	end;
	local szTotemName = TB_TOTEM_INFO[nFaction][1][4];	
	local selTab = {
				". фi M藅 t辌h s� m玭 (c莕"..szTotemName..TB_FACTION_ITEM[1][0][2].." )/#backroom_exchange_faction_item_type(1)",
				". фi T﹎ ph竝 s� m玭 (c莕 "..szTotemName..TB_FACTION_ITEM[2][0][2].." )/#backroom_exchange_faction_item_type(2)",
				". фi T骾 Quy誸 y誹 bang ph竔 m譶h ("..gf_GetFactionName(nFaction).." ) (c莕 "..szTotemName..TB_FACTION_ITEM[3][0][2].." )/#backroom_exchange_faction_item_type(3)",
				". фi M藅 t辌h cao c蕄 s� m玭 (c莕 "..TB_TOTEM_INFO[nFaction][3][4]..TB_FACTION_ITEM[4][0][2].." )/#backroom_exchange_faction_item_type(4)",
				". фi M藅 t辌h cao c蕄 s� m玭 (c莕 "..TB_TOTEM_INFO[nFaction][3][4].."120 c竔 v� 2000 v祅g)/#backroom_exchange_book(1,4)",
				"Quay l筰 i tho筰 tr猲/backroom_get_reward",
				"Kh玭g i/nothing",
				}
	local szInforHeader = backroom_get_infoheader();
	Say(szInforHeader.."Ngi mu鑞 i v藅 ph萴 g�?",getn(selTab),selTab);
end;

function backroom_exchange_faction_item_type(nItemType)
	local nFaction = GetPlayerFaction();
	if nItemType == 3 then	--如果是诀要包
		backroom_get_faction_item(nItemType,nFaction);
	else
		backroom_list_faction_item(1,nItemType);
	end;
end;

function backroom_list_faction_item(nPageNum,nItemType)
	local szInforHeader = backroom_get_infoheader();
	local tbList = backroom_get_faction_item_list(nItemType);
	local selTab = {};
	local nItemNum = getn(tbList);
	local nItemPerPage = 5;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nItemNum);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("Trang trc \n /#backroom_list_faction_item(%d,%d)",nPageNum-1,nItemType));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbList[i]);
	end;
	if nPageNum ~= ceil(nItemNum/nItemPerPage) then
		tinsert(selTab,format("\n Trang sau/#backroom_list_faction_item(%d,%d)",nPageNum+1,nItemType));	
	end;
	tinsert(selTab,"\n в ta suy ngh�/nothing");
	Say(szInforHeader.."Ngi mu鑞 i v藅 ph萴 n祇 di y?",getn(selTab),selTab);
end;

function backroom_get_faction_item_list(nItemType)
	local tbItem = TB_FACTION_ITEM[nItemType];
	local tbRetTb = {};
	for i=1,getn(tbItem) do
		tinsert(tbRetTb,tbItem[i][1].."/#backroom_get_faction_item("..nItemType..","..i..")");
	end;
	return tbRetTb;
end;

function backroom_get_faction_item(nItemType,nItemIdx)
	local szInforHeader = backroom_get_infoheader();
	local tbItem = TB_FACTION_ITEM[nItemType];
	local szItemName = tbItem[nItemIdx][1];
	local nFaction = GetPlayerFaction();
	local nNeedItemNum = tbItem[0][2];
	local nTotemType = tbItem[0][1];
	local szNeedItemName = TB_TOTEM_INFO[nFaction][nTotemType][4];
	local selTab = {
				"уng �/#backroom_get_faction_item_confirm("..nItemType..","..nItemIdx..")",
				"H駓 b�/nothing",
				}
	Say(szInforHeader.."Ngi mu鑞 i <color=yellow>"..szItemName.."<color>? C莕 ph秈 c� <color=yellow>"..nNeedItemNum.."c竔"..szNeedItemName.."<color>.",getn(selTab),selTab);
end;

function backroom_get_faction_item_confirm(nItemType,nItemIdx)
	local szInforHeader = backroom_get_infoheader();
	local tbItem = TB_FACTION_ITEM[nItemType];
	local nNeedItemNum = tbItem[0][2];
	local nTotemType = tbItem[0][1];
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",szInforHeader.."Ngi v� m玭 v� ph竔 kh玭g 頲 i v藅 ph萴 n祔.");
		return 0;
	end;
	local szNeedItemName = TB_TOTEM_INFO[nFaction][nTotemType][4];
	local nID1 = TB_TOTEM_INFO[nFaction][nTotemType][1];
	local nID2 = TB_TOTEM_INFO[nFaction][nTotemType][2];
	local nID3 = TB_TOTEM_INFO[nFaction][nTotemType][3];
	local nCurItemNum = GetItemCount(nID1,nID2,nID3);
	if nCurItemNum < nNeedItemNum then
		Talk(1,"",szInforHeader.."Ngi c莕 <color=yellow>"..nNeedItemNum.."c竔"..szNeedItemName.."<color> m韎 c� th� i v藅 ph萴 n祔.");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,15,szInforHeader) == 0 then
		return 0;
	end;
	local szItemName = tbItem[nItemIdx][1];
	local nItemID1 = tbItem[nItemIdx][2];
	local nItemID2 = tbItem[nItemIdx][3];
	local nItemID3 = tbItem[nItemIdx][4];
	if DelItem(nID1,nID2,nID3,nNeedItemNum) == 1 then
		AddItem(nItemID1,nItemID2,nItemID3,1);
		Msg2Player("B筺 i "..nNeedItemNum.."c竔"..szNeedItemName.."i "..szItemName);
		WriteLog(LOG_HEADER..GetName().."(m玭 ph竔:"..nFaction..") d飊g "..nNeedItemNum.."c竔"..szNeedItemName.." r錳"..szItemName);
	end;
end;

function backroom_exchange_zhenpai()
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."Ngi ph秈 gia nh藀 l璾 ph竔 trc m韎 c� th� i M藅 t辌h tr蕁 ph竔.");
		return 0;
	end;
	local nRoute = GetPlayerRoute();
	local nFaction = GetPlayerFaction();
	local nIdx = 0;
	local strtab = {};
	nIdx = TB_BOOK_REQUIRE[1][1];			
	tinsert(strtab,"@ "..TB_BOOK_LIST[nRoute][1][1].."(c莕 "..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[1][2].." )/#backroom_exchange_zhenpai_ask(1)");
	nIdx = TB_BOOK_REQUIRE[2][1];
	tinsert(strtab,"@ "..TB_BOOK_LIST[nRoute][2][1].."(c莕 "..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[2][2].." )/#backroom_exchange_zhenpai_ask(2)");
	nIdx = TB_BOOK_REQUIRE[3][1];
	tinsert(strtab,"@ "..TB_BOOK_LIST[nRoute][3][1].."(c莕 "..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[3][2].." )/#backroom_exchange_zhenpai_ask(3)");
	tinsert(strtab,"Kh玭g i/nothing");
	Say(szInforHeader.."Ngi mu鑞 i cu鑞 n祇?",getn(strtab),strtab);	
end

function backroom_exchange_zhenpai_ask(nType)
	local szInforHeader = backroom_get_infoheader();
	local nRoute = GetPlayerRoute();
	local nFaction = GetPlayerFaction();
	local nIdx = TB_BOOK_REQUIRE[nType][1];
	if GetItemCount(TB_TOTEM_INFO[nFaction][nIdx][1],TB_TOTEM_INFO[nFaction][nIdx][2],TB_TOTEM_INFO[nFaction][nIdx][3]) < TB_BOOK_REQUIRE[nType][2] then
		Talk(1,"",szInforHeader.."фi"..TB_BOOK_LIST[nRoute][nType][1].."C莕"..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[nType][2].." , tr猲 ngi ngi kh玭g .");
		return 0;
	end	
	Say(szInforHeader.."Ngi d飊g <color=yellow>"..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[nType][2].." <color> i <color=yellow>"..TB_BOOK_LIST[nRoute][nType][1].."<color> ch�?",
			3,
			"Л頲/#backroom_exchange_zhenpai_confirm("..nType..")",
			"Kh玭g, ta nh莔!/backroom_exchange_zhenpai",
			"Kh玭g i/nothing")	
end

function backroom_exchange_zhenpai_confirm(nType)
	local szInforHeader = backroom_get_infoheader();
	local nRoute = GetPlayerRoute();
	local nFaction = GetPlayerFaction();
	local nIdx = TB_BOOK_REQUIRE[nType][1];
	if GetItemCount(TB_TOTEM_INFO[nFaction][nIdx][1],TB_TOTEM_INFO[nFaction][nIdx][2],TB_TOTEM_INFO[nFaction][nIdx][3]) < TB_BOOK_REQUIRE[nType][2] then
		Talk(1,"",szInforHeader.."фi"..TB_BOOK_LIST[nRoute][nType][1].."C莕"..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[nType][2].." , tr猲 ngi ngi kh玭g .");
		return 0;
	end	
	if gf_JudgeRoomWeight(1,50,szInforHeader) == 0 then
		return 0;
	end;  
	if DelItem(TB_TOTEM_INFO[nFaction][nIdx][1],TB_TOTEM_INFO[nFaction][nIdx][2],TB_TOTEM_INFO[nFaction][nIdx][3],TB_BOOK_REQUIRE[nType][2]) == 1 then
		AddItem(TB_BOOK_LIST[nRoute][nType][2],TB_BOOK_LIST[nRoute][nType][3],TB_BOOK_LIST[nRoute][nType][4],1);
		Msg2Player("B筺 nh薾 頲 "..TB_BOOK_LIST[nRoute][nType][1]);
		WriteLog(LOG_HEADER..GetName().."(m玭 ph竔:"..nFaction..") d飊g "..TB_BOOK_REQUIRE[nType][2].."c竔"..TB_TOTEM_INFO[nFaction][nIdx][4].." r錳"..TB_BOOK_LIST[nRoute][nType][1]);
	end
end

function backroom_exchange_book(nPageNum,nItemType)
	local szInforHeader = backroom_get_infoheader();
	local tbList = backroom_exchange_book_list(nItemType);
	local selTab = {};
	local nItemNum = getn(tbList);
	local nItemPerPage = 5;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nItemNum);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("Trang trc \n /#backroom_exchange_book(%d,%d)",nPageNum-1,nItemType));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbList[i]);
	end;
	if nPageNum ~= ceil(nItemNum/nItemPerPage) then
		tinsert(selTab,format("\n Trang sau/#backroom_exchange_book(%d,%d)",nPageNum+1,nItemType));	
	end;
	tinsert(selTab,"\n в ta suy ngh�/nothing");
	Say(szInforHeader.."Ngi mu鑞 i v藅 ph萴 n祇 di y?",getn(selTab),selTab);
end;

function backroom_exchange_book_list(nItemType)
	local tbItem = TB_FACTION_ITEM[nItemType];
	local tbRetTb = {};
	for i=1,getn(tbItem) do
		tinsert(tbRetTb,tbItem[i][1].."/#backroom_exchange_book_item("..nItemType..","..i..")");
	end;
	return tbRetTb;
end;

function backroom_exchange_book_item(nItemType,nItemIdx)
	local szInforHeader = backroom_get_infoheader();
	local tbItem = TB_FACTION_ITEM[nItemType];
	local szItemName = tbItem[nItemIdx][1];
	local nFaction = GetPlayerFaction();
	local nNeedItemNum = 120;
	local nTotemType = tbItem[0][1];
	local szNeedItemName = TB_TOTEM_INFO[nFaction][nTotemType][4];
	local selTab = {
				"уng �/#backroom_exchange_book_item_confirm("..nItemType..","..nItemIdx..")",
				"H駓 b�/nothing",
				}
	Say(szInforHeader.."Ngi mu鑞 i <color=yellow>"..szItemName.."<color>? C莕 ph秈 c� <color=yellow>"..nNeedItemNum.."c竔"..szNeedItemName.." v� 2000 v祅g<color>.",getn(selTab),selTab);
end;

function backroom_exchange_book_item_confirm(nItemType,nItemIdx)
	local szInforHeader = backroom_get_infoheader();
	local tbItem = TB_FACTION_ITEM[nItemType];
	local nNeedItemNum = 120;
	local nTotemType = tbItem[0][1];
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",szInforHeader.."Ngi v� m玭 v� ph竔 kh玭g 頲 i v藅 ph萴 n祔.");
		return 0;
	end;
	local szNeedItemName = TB_TOTEM_INFO[nFaction][nTotemType][4];
	local nID1 = TB_TOTEM_INFO[nFaction][nTotemType][1];
	local nID2 = TB_TOTEM_INFO[nFaction][nTotemType][2];
	local nID3 = TB_TOTEM_INFO[nFaction][nTotemType][3];
	local nCurItemNum = GetItemCount(nID1,nID2,nID3);
	if nCurItemNum < nNeedItemNum then
		Talk(1,"",szInforHeader.."Ngi c莕 <color=yellow>"..nNeedItemNum.."c竔"..szNeedItemName.."<color> m韎 c� th� i v藅 ph萴 n祔.");
		return 0;
	end;
	if GetCash() < 20000000 then
		Talk(1,"",szInforHeader.."Ngi ph秈 c� <color=yellow>2000 v祅g<color> m韎 c� th� i v藅 ph萴 n祔.");
		return 0;
	end
	if gf_JudgeRoomWeight(1,15,szInforHeader) == 0 then
		return 0;
	end;
	local szItemName = tbItem[nItemIdx][1];
	local nItemID1 = tbItem[nItemIdx][2];
	local nItemID2 = tbItem[nItemIdx][3];
	local nItemID3 = tbItem[nItemIdx][4];
	if DelItem(nID1,nID2,nID3,nNeedItemNum) == 1 and Pay(20000000) == 1 then
		AddItem(nItemID1,nItemID2,nItemID3,1);
		Msg2Player("B筺 i "..nNeedItemNum.."c竔"..szNeedItemName.." v� 2000 v祅g i "..szItemName);
		WriteLog(LOG_HEADER..GetName().."(m玭 ph竔:"..nFaction..") d飊g "..nNeedItemNum.."c竔"..szNeedItemName.." v� 2000 v祅g i "..szItemName);
	end;
end;

function backroom_exchange_attack()
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."Ngi ph秈 gia nh藀 l璾 ph竔 trc m韎 c� th� 甶襲 ch豱h l鵦 nh v� kh� s� m玭.");
		return 0;
	end;	
	local strtab = {
			". Ta mu鑞 甶襲 ch豱h v� kh� trang b� s� m玭 4/#backroom_exchange_attack_ask(4)",
			". Ta mu鑞 甶襲 ch豱h v� kh� trang b� s� m玭 5/#backroom_exchange_attack_ask(5)",
			"в ta ngh� l筰/nothing"
	};
	Say(szInforHeader.."Ngi mu鑞 d飊g 1 Tinh Luy謓 B╪g Th筩h  甶襲 ch豱h l鵦 nh c馻 v� kh� trang b� s� m玭 4, 5 kh玭g? Sau khi 甶襲 ch豱h gi� l筰  cng h鉧 c馻 v� kh�, мnh H錸, l鵦 nh c馻 v� kh� s� ng蓇 nhi猲. Ch� �, v� kh� kh鉧 ho芻 kh鉧 h錸 kh玭g th� 甶襲 ch豱h, khi 甶襲 ch豱h c莕 ph秈 mang trang b� v� kh� l猲 ngi.",getn(strtab),strtab);
end

function backroom_exchange_attack_ask(nType)
	local szInforHeader = backroom_get_infoheader();
	if GetItemCount(2,1,533) < 1 then
		Talk(1,"",szInforHeader.."襲 ch豱h l鵦 nh c馻 v� kh� c蕁 1 Tinh Luy謓 B╪g Th筩h, tr猲 ngi ngi kh玭g c�.");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nID2,nID3 = 0,0;
	local tbWeaponID2 = {nil,5,8,0,nil,1,nil,2,10,nil,0,5,nil,2,9,nil,6,4,nil,7,11};
	nID2 = tbWeaponID2[nRoute];
	if nRoute == 8 or nRoute == 9 then	--峨嵋特殊处理
		nID3 = nRoute*100+(nType-1)*10+nBody-2;
	else
		nID3 = nRoute*100+(nType-1)*10+nBody;
	end;
	local nIndex = GetPlayerEquipIndex(2);
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --获取装备是否定魂
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定	
	local nEquipId1,nEquipId2,nEquipId3 = GetPlayerEquipInfo(2); --获取装备id	
	if nRoute == 2 then	--该死的少林俗家
		if nEquipId1 ~= 0 or (nEquipId2 ~= 3 and nEquipId2 ~= 5) or nEquipId3 ~= nID3 then
			if nType == 4 then
				Talk(1,"","Ngi ch鋘 甶襲 ch豱h l鵦 nh v� kh� trang b� s� m玭 4, tr猲 ngi ngi hi謓 kh玭g ph秈.");
				return 0;
			elseif nType == 5 then
				Talk(1,"","Ngi ch鋘 甶襲 ch豱h l鵦 nh v� kh� trang b� s� m玭 5, tr猲 ngi ngi hi謓 kh玭g ph秈.");
				return 0;				
			end
		end
	else
		if nEquipId1 ~= 0 or nEquipId2 ~= nID2 or nEquipId3 ~= nID3 then
			if nType == 4 then
				Talk(1,"","Ngi ch鋘 甶襲 ch豱h l鵦 nh v� kh� trang b� s� m玭 4, tr猲 ngi ngi hi謓 kh玭g ph秈.");
				return 0;
			elseif nType == 5 then
				Talk(1,"","Ngi ch鋘 甶襲 ch豱h l鵦 nh v� kh� trang b� s� m玭 5, tr猲 ngi ngi hi謓 kh玭g ph秈.");
				return 0;				
			end
		end
	end
	if nLock == 1 then
		Talk(1,"","Trang b� tr猲 ngi ngi  kh鉧, c莕 m� kh鉧 m韎 c� th� th╪g c蕄.");
		return
	end
	local nItemName = GetItemName(nIndex);
	Say(szInforHeader.."Ngi s� d鬾g 1 Tinh Luy謓 B╪g Th筩h  甶襲 ch豱h l鵦 nh c馻 <color=yellow>"..nItemName.."<color> ph秈 kh玭g?",
		3,
		"Л頲/#backroom_exchange_attack_confirm("..nType..")",
		"Kh玭g, ta nh莔!/backroom_exchange_attack",
		"в ta ngh� l筰/nothing")	
end

function backroom_exchange_attack_confirm(nType)
	local szInforHeader = backroom_get_infoheader();
	if GetItemCount(2,1,533) < 1 then
		Talk(1,"",szInforHeader.."襲 ch豱h l鵦 nh c馻 v� kh� c蕁 1 Tinh Luy謓 B╪g Th筩h, tr猲 ngi ngi kh玭g c�.");
		return 0;
	end
	if gf_JudgeRoomWeight(1,200,szInforHeader) == 0 then
		return 0;
	end;	
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nID2,nID3 = 0,0;
	local tbWeaponID2 = {nil,5,8,0,nil,1,nil,2,10,nil,0,5,nil,2,9,nil,6,4,nil,7,11};
	nID2 = tbWeaponID2[nRoute];
	if nRoute == 8 or nRoute == 9 then	--峨嵋特殊处理
		nID3 = nRoute*100+(nType-1)*10+nBody-2;
	else
		nID3 = nRoute*100+(nType-1)*10+nBody;
	end;		
	local nIndex = GetPlayerEquipIndex(2);
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --获取装备是否定魂
	local nEquipId1,nEquipId2,nEquipId3 = GetPlayerEquipInfo(2); --获取装备id	
	if DelItemByIndex(nIndex,-1) == 1 and DelItem(2,1,533,1) == 1 then
		local nAddFlag,nItemIdx = AddItem(nEquipId1,nEquipId2,nEquipId3,1,1,-1,-1,-1,-1,-1,-1,0,nQianghua);
		if nDing == 1 then
			SetItemSpecialAttr(nItemIdx,"DING7",1); --定魂
		end
		Msg2Player("L鵦 nh c馻 v� kh�  甶襲 ch豱h.");
	end
end

TB_FACTION_ITEM = 
{
	[1] = --师门秘籍
	{
		[0] = {1,60},	--所需物品等级和数量
		[1] = {"Kim Cang Ph鬰 Ma kinh (Thi誹 L﹎ t鬰 gia)",0,107,1},	
		[2] = {"V� Tr莕 M藅 t辌h (Thi誹 L﹎ thi襫 t╪g)",0,107,5},	
		[3] = {"Ti襪 Long M藅 t辌h (Thi誹 L﹎ v� t╪g)",0,107,3},	
		[4] = {"Thi猲 La M藅 T辌h (Л阯g M玭)",0,107,7},	
		[5] = {"Nh� � M藅 T辌h (Nga My ph藅 gia)",0,107,9},	
		[6] = {"B輈h H秈 Ph� (Nga My t鬰 gia)",0,107,11},
		[7] = {"H鏽 чn M藅 t辌h (C竔 Bang t辬h y)",0,107,13},	
		[8] = {"Qu� Thi猲 M藅 t辌h (C竔 Bang � y)",0,107,15},	
		[9] = {"Huy襫 秐h M藅 t辌h (V� ng o gia)",0,107,17},	
		[10] = {"Qu﹏ T� M藅 t辌h (V� ng t鬰 gia)",0,107,19},	
		[11] = {"Tr蕁 Qu﹏ M藅 t辌h (Dng M玭 thng k�)",0,107,21},	
		[12] = {"Xuy猲 V﹏ M藅 t辌h (Dng M玭 cung k�)",0,107,23},	
		[13] = {"U Minh Qu� L鬰 (Ng� чc t� hi謕)",0,107,25},	
		[14] = {"Linh C� M藅 t辌h (Ng� чc c� s�)",0,107,27},
	},
 	[2] = 	--师门心法
	{
		[0] = {1,60},
		[1] = {"Kim Cang Ph鬰 Ma T﹎ Ph竝 (Thi誹 L﹎ t鬰 gia)",0,107,2},	
		[2] = {"V� Tr莕 T﹎ Ph竝 (Thi誹 L﹎ thi襫 t╪g)",0,107,6},	
		[3] = {"Ti襪 Long T﹎ Ph竝 (Thi誹 L﹎ v� t╪g)",0,107,4},
		[4] = {"Thi猲 La T﹎ Ph竝 (Л阯g M玭)",0,107,8},	
		[5] = {"Nh� � T﹎ Ph竝 (Nga My ph藅 gia)",0,107,10},
		[6] = {"B輈h H秈 T﹎ Ph竝 (Nga My t鬰 gia)",0,107,12},
		[7] = {"H鏽 чn T﹎ Ph竝 (C竔 Bang t辬h y)",0,107,14},
		[8] = {"Qu� Thi猲 T﹎ Ph竝 (C竔 Bang � y)",0,107,16},		
		[9] = {"Huy襫 秐h T﹎ Ph竝 (V� ng o gia)",0,107,18},	
		[10] = {"Qu﹏ T� T﹎ Ph竝 (V� ng t鬰 gia)",0,107,20},
		[11] = {"Tr蕁 Qu﹏ T﹎ Ph竝 (Dng M玭 thng k�)",0,107,22},	
		[12] = {"Xuy猲 V﹏ T﹎ Ph竝 (Dng M玭 cung k�)",0,107,24},	
		[13] = {"U Minh T﹎ Ph竝 (Ng� чc t� hi謕)",0,107,26},
		[14] = {"Linh C� T﹎ Ph竝 (Ng� чc c� s�)",0,107,28},	
	},
	[3] = 	--门派诀要包
	{
		[0] = {1,80},
		[1] = {"T骾 b� ki誴 Thi誹 L﹎",2,0,607},	
		[2] = {"T骾 b� ki誴 V� ng",2,0,611},
		[3] = {"T骾 b� ki誴 Nga My",2,0,609},	
		[4] = {"T骾 b� ki誴 C竔 Bang",2,0,610},	
		[5] = {"T骾 b� ki誴 Л阯g M玭",2,0,608},		
		[6] = {"T骾 b� ki誴 Dng M玭",2,0,612},	
		[7] = {"T骾 b� ki誴 Ng� чc",2,0,613},	
	},
	[4] = --高级师门秘籍
	{
		[0] = {3,600},
		[1] = {"Kim Cang Ban Nh� Kinh (Thi誹 L﹎ t鬰 gia)",0,107,166},
		[2] = {"V� Tr莕 B� б Kinh (Thi誹 L﹎ thi襫 t╪g)",0,107,168},	
		[3] = {"Ti襪 Long T辌h Di謙 Kinh (Thi誹 L﹎ v� t╪g)",0,107,167},
		[4] = {"Thi猲 La Li猲 Ch﹗ L鬰 (Л阯g M玭)",0,107,169},	
		[5] = {"Nh� � Kim жnh M藅 T辌h (Nga My ph藅 gia)",0,107,170},
		[6] = {"B輈h H秈 Tuy謙  Ph� (Nga My t鬰 gia)",0,107,171},
		[7] = {"H鏽 чn Tr蕁 Nh筩 M藅 T辌h (C竔 Bang t辬h y)",0,107,172},
		[8] = {"Qu� Thi猲 Du Long M藅 T辌h (C竔 Bang � y)",0,107,173},		
		[9] = {"Huy襫 秐h M� Tung M藅 T辌h (V� ng o gia)",0,107,174},	
		[10] = {"Qu﹏ T� Ti謙 Phong M藅 T辌h (V� ng t鬰 gia)",0,107,175},
		[11] = {"Tr蕁 Qu﹏ Phi Long Thng Ph� (Dng M玭 thng k�)",0,107,176},	
		[12] = {"Xuy猲 V﹏ L筩 H錸g M藅 T辌h (Dng M玭 cung k�)",0,107,177},	
		[13] = {"U Minh Phong Ma L鬰 (Ng� чc t� hi謕)",0,107,178},
		[14] = {"Linh C� Huy襫 T� L鬰 (Ng� чc c� s�)",0,107,179},			
	},
}