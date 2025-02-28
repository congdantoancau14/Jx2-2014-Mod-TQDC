--File name:emissary_npc.lua 
--Describe:三节连过，周年庆使
--Create Date:2006-8-22
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")
Include("\\script\\class\\ktabfile.lua")

tabLVEXP = new(KTabFile, "\\settings\\uplevel.txt");

function main()
	local nDate = tonumber(date("%y%m%d"));
	if nDate < 080911 then
		Talk(1,"","<color=green>Ni猲 s�<color>: Ho箃 ng s� b総 u v祇 11-9, v�  "..tSexName[GetSex()].."n l骳  nh� n y.");
		return 0;
	end;
	if GetLevel() < 30 then
		Talk(1,"","Ъng c蕄 c馻 ngi qu� th蕄, kh玭g th� tham gia ho箃 ng n祔, luy謓 n c蕄 <color=yellow>30 <color> quay l筰 g苝 ta nh�!");
		return 0;
	end;
	local selTab = {
				"Nh薾 nguy猲 li謚 l祄 b竛h/want_mooncake_resource",
				"Nh薾 頲 B竛h Trung Thu Tinh M�/want_mooncake",
				"B竛h Trung Thu, l蕐 o c� i ph莕 thng /want_reward",
--				"领取两周年礼品/want_anniversary",
				"Ta mu鑞 nh薾 b竛h trung thu/require_mooncake",
				"Mua v藅 ph萴 l� m鮪g/buy_things",
				"Nh薾 hng d蒼 ho箃 ng/get_intro_book",
				"Xem n閕 dung ho箃 ng./know_detail",
				"[-K誸 th骳 i tho筰-]/nothing",
				}
	if nDate > 281012 then
		Talk(1,"","Ho箃 ng l莕 n祔  k誸 th骳, c秏 琻 b筺  tham gia!");
		return 0;
	end;
	if nDate > 281007 then
		tremove(selTab,1);
		tremove(selTab,1);
	end;
	Say("<color=green>Ni猲 s�<color>: JX2 tr遪 3 n╩ c騨g v鮝 d辮 t誸 Trung Thu, ch骳 c竎 v� giang h� n� hi謕 ╪ t誸 vui v�!",getn(selTab),selTab);
end;

function want_reward()
	local selTab = {
				"Ta mu鑞 d飊g th� k� ni謒 i l蕐 ph莕 thng /use_card",
				"Ta mu鑞 d飊g B竛h Trung Thu i B秓 rng/use_mooncake",
				"Xem thu閏 t輓h trang s鴆 Vinh D�, Huy Ho祅g (kh玭g mua 頲)/ring_Sale",
				"[-Thuy誸 minh-]/know_reward",
				"[-Quay l筰 i tho筰-]/main",
				"[-K誸 th骳 i tho筰-]/nothing",
				}
	Say("B筺 d飊g v藅 ph萴 n祇 i ph莕 thng?",getn(selTab),selTab);
end;

function use_card()
	local selTab = {
				"фi  10 th� k� ni謒 JX2 tr遪 3 n╩ l蕐 1 B錸g Lai ti猲 l�/#ask_is_use_card(10)",
				"фi  20 th� k� ni謒 JX2 tr遪 3 n╩ l蕐 ph莕 thng kinh nghi謒/#ask_is_use_card(20)",
				"фi  40 th� k� ni謒 JX2 tr遪 3 n╩ l蕐 ph莕 thng kinh nghi謒/#ask_is_use_card(40)",
				"фi  100 th� k� ni謒 JX2 tr遪 3 n╩ l蕐 1 H閜 Ng﹏ B礽 Vinh D�/#ask_is_use_card(100)",
				"фi  500 th� k� ni謒 JX2 tr遪 3 n╩ l蕐 1 Ch譨 Kh鉧 B筩 Vinh D�/#ask_is_use_card(500)",
				"Trang k�/use_card_page_2",
				"Ta kh玭g mu鑞 i n鱝./nothing",
				}
	local nCount = GetItemCount(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4]);
	Say("Hi謓 b筺 c� <color=yellow>"..nCount.."<color>Th� k� ni謒 JX2 tr遪 3 n╩, t飝 theo s� lng <color=red>th� k� ni謒 JX2 tr遪 3 n╩<color> c馻 b筺, b筺 c� th� i ph莕 thng sau y: ",getn(selTab),selTab);
end;

function use_card_page_2()
	local selTab = {
				"фi 1000 th� k� ni謒 JX2 tr遪 3 n╩ l蕐 H閜 Kim B礽 Vinh D�/#ask_is_use_card(1000)",
				"фi 2000 th� k� ni謒 JX2 tr遪 3 n╩ l蕐 trang s鴆 Huy Ho祅g Chi Th駓/#ask_is_use_card(2000)",
				"фi 3000 th� k� ni謒 JX2 tr遪 3 n╩ l蕐 1 trang s鴆 Vinh D� Chi Th駓/#ask_is_use_card(3000)",
				"фi 6000 th� k� ni謒 JX2 tr遪 3 n╩ l蕐 1 trong 3 m鉵 Ho祅g д/use_card_exchange_equip",
				"Trang trc/use_card",
				"Ta kh玭g mu鑞 i n鱝./nothing",
				}
	local nCount = GetItemCount(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4]);
	Say("Hi謓 b筺 c� <color=yellow>"..nCount.."<color>Th� k� ni謒 JX2 tr遪 3 n╩, t飝 theo s� lng <color=red>th� k� ni謒 JX2 tr遪 3 n╩<color> c馻 b筺, b筺 c� th� i ph莕 thng sau y: ",getn(selTab),selTab);

end;

function ask_is_use_card(nCount)
	local tCardInfo = {
						 [10] = "1 B錸g Lai ti猲 l�",
						 [20] = "Ph薾 thng kinh nghi謒",
						 [40] = "Ph薾 thng kinh nghi謒",	
						 [100] = "H閜 Ng﹏ B礽 Vinh D�",	
						 [500] = "Ch譨 Kh鉧 B筩 Vinh D�",	
						 [1000] = "H閜 Kim B礽 Vinh D�",				
						 [2000] = "Trang s鴆 Huy Ho祅g Chi Th駓",	
						 [3000] = "Trang s鴆 Vinh D�"
							};
	Say("<color=green>Ni猲 s�<color>: B筺 mu鑞 s� d鬾g <color=yellow>"..nCount.."<color> th� k� ni謒 JX2 tr遪 3 n╩ i <color=yellow>"..tCardInfo[nCount].."<color> ch�?",
			2,
			"Ta mu鑞 i/#use_card_confirm("..nCount..")",
			"Ta ch鋘 nh莔 r錳./use_card");						
end

function use_card_confirm(nCount)
	if nCount ~= 1 and nCount ~= 20 and nCount ~= 40 then
		if gf_JudgeRoomWeight(2,100,".") == 0 then
			return 0;
		end;
	end;
	local nChangeTimes = 0;
	local nRetCode = 0;
	if nCount == 20 then
		nChangeTimes = GetTask(TASK_USE_CARD_20);
		if nChangeTimes >= 60 then
			Talk(1,"","C竎 h� kh玭g th� i ph莕 thng n祔 n鱝! ");
			return 0;
		end;
	end		
	if nCount == 40 then
		nChangeTimes = GetTask(TASK_USE_CARD_40);
		if nChangeTimes >= 20 then
			Talk(1,"","C竎 h� kh玭g th� i ph莕 thng n祔 n鱝! ");
			return 0;
		end;	
	end
	if DelItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],nCount) == 1 then
		local nLevel = GetLevel();
		local nExp = 0;
--		if nCount == 1 then
--			nExp = floor(80000*(nLevel^3)/(80^3));
--			nChangeTimes = GetTask(TASK_USE_CARD_1);
--			if nChangeTimes >= 600 then
--				Talk(1,"","<color=green>周年庆使<color>：你不能再换取此奖励了！");
--				return 0;
--			end;
--			ModifyExp(nExp);
--			Msg2Player("你获得"..nExp.."点经验奖励");
--			SetTask(TASK_USE_CARD_1,nChangeTimes+1);
--			Say("请您注意：您还可以换取<color=yellow>"..(599-nChangeTimes).."<color>次该奖励。",0);
		if nCount == 10 then
			AddItem(tItemInfo[24][2],tItemInfo[24][3],tItemInfo[24][4],1);
			Msg2Player("B筺 nh薾 頲 1 "..tItemInfo[24][1]);
		elseif nCount == 20 then
			nExp = floor(800000*(nLevel^3)/(80^3));
			nChangeTimes = GetTask(TASK_USE_CARD_20);
			if nChangeTimes >= 60 then
				Talk(1,"","C竎 h� kh玭g th� i ph莕 thng n祔 n鱝! ");
				return 0;
			end;
			ModifyExp(nExp);
			Msg2Player("B筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒");
			SetTask(TASK_USE_CARD_20,nChangeTimes+1);	
			Talk(1,"use_card","<color=green>Ni猲 s�<color>: B筺 c遪 c� th� i <color=yellow>"..(59-nChangeTimes).."<color> ph莕 thng. ");
		elseif nCount == 40 then
			nExp = floor(3000000*(nLevel^3)/(80^3));
			nChangeTimes = GetTask(TASK_USE_CARD_40);
			if nChangeTimes >= 20 then
				Talk(1,"","C竎 h� kh玭g th� i ph莕 thng n祔 n鱝! ");
				return 0;
			end;
			ModifyExp(nExp);
			Msg2Player("B筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒");		
			SetTask(TASK_USE_CARD_40,nChangeTimes+1);
			Talk(1,"use_card","<color=green>Ni猲 s�<color>: B筺 c遪 c� th� i <color=yellow>"..(19-nChangeTimes).."<color> ph莕 thng. ");
		elseif nCount == 100 then
			nRetCode = AddItem(tItemInfo[17][2],tItemInfo[17][3],tItemInfo[17][4],1);
			Msg2Player("B筺 nh薾 頲 1 "..tItemInfo[17][1]);		
		elseif nCount == 500 then
			nRetCode = AddItem(tItemInfo[22][2],tItemInfo[22][3],tItemInfo[22][4],1);
			Msg2Player("B筺 nh薾 頲 1 "..tItemInfo[22][1]);
		elseif nCount == 1000 then
			nRetCode = AddItem(tItemInfo[18][2],tItemInfo[18][3],tItemInfo[18][4],1);
			Msg2Player("B筺 nh薾 頲 1 "..tItemInfo[18][1]);		
		elseif nCount == 2000 then
			--辉煌
			nRetCode = AddItem(0,102,8840,1,1,-1,-1,-1,-1,-1,-1);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 trang s鴆 Huy Ho祅g Chi Th駓");
			Talk(1,"","<color=green>Ni猲 s�<color>: Ch骳 m鮪g b筺 nh薾 頲 trang s鴆 Huy Ho祅g Chi Th駓, b筺 c� th� n Tng Dng t譵 <color=yellow> t� th� r蘮 L璾<color>  th╪g c蕄 hi謚 qu�.");
			Msg2Global(GetName().."S� d鬾g "..nCount.."Th� k� ni謒 i trang s鴆 Huy Ho祅g Chi Th駓");
		elseif nCount == 3000 then
			--荣耀	
			nRetCode = AddItem(0,102,8841,1,1,-1,-1,-1,-1,-1,-1);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 trang s鴆 Vinh D�");
			Talk(1,"","<color=green>Ni猲 s�<color>: Ch骳 m鮪g b筺 nh薾 頲 trang s鴆 Vinh D�, b筺 c� th� n Tng Dng t譵 <color=yellow> t� th� r蘮 L璾<color>  th╪g c蕄 hi謚 qu�");
			Msg2Global(GetName().."S� d鬾g "..nCount.."Th� k� ni謒 i trang s鴆 Vinh D�.");				
		end;
		if nRetCode == 1 then
			WriteLog("[08 Tam ti誸 li猲 th玭g]:"..GetName().."S� d鬾g "..nCount.."Th� k� ni謒 i ph莕 thng.");
		else
			WriteLog("[L鏸 08 Tam ti誸 li猲 th玭g]:"..GetName().."S� d鬾g "..nCount.."фi th� k� ni謒 i th蕋 b筰, v� tr� th蕋 b筰: "..nRetCode);
		end
	else
		Talk(1,"use_card","<color=green>Ni猲 s�<color>: Xin l鏸! S� lng th� k� ni謒 JX2 tr遪 3 n╩ c馻 b筺 kh玭g .");
	end;
end;

function use_card_exchange_exp()
	local nTimes = 0;
	local nX = 100;
	local nLevel = GetLevel();
	if DelItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],1000) == 1 then
		nTimes = GetTask(TASK_USE_CARD_1000)+1;
		if nTimes > 10 then
			nX = max(20,100-(nTimes-10)*5);
		end;
		nExp = floor((nX/100)*(90000000*nLevel^3)/(80^3));
		SetTask(TASK_USE_CARD_1000,nTimes);
		ModifyExp(nExp);
		Msg2Player("B筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒");
		Talk(1,"","Зy l� l莕 th� <color=yellow>"..nTimes.."<color> thay i ph莕 thng kinh nghi謒. <color=yellow>10<color> l莕 u s� kh玭g b� suy gi秏, nh璶g t� l莕 th� 11 tr� 甶 ph莕 thng s� b� suy gi秏 <color=yellow>5%<color>, t鑙 產 <color=yellow>20%<color>. ");
		WriteLog("[07 Tam ti誸 li猲 th玭g]:"..GetName().."th�"..nTimes.." l莕 d飊g 1000 th� k� ni謒 i 頲 "..nExp.." 甶觤 kinh nghi謒");
	else
		Talk(1,"use_card","<color=green>Ni猲 s�<color>: Xin l鏸! S� lng th� k� ni謒 JX2 tr遪 3 n╩ c馻 b筺 kh玭g .");
	end;
end;

function use_card_exchange_equip()
	local selTab = {
			"Ta mu鑞 thay i Hi猲 Vi猲 v� kh� /#use_card_exchange_equip_confirm(1)",
			"Ta mu鑞 thay i Hi猲 Vi猲 Chi課/#use_card_exchange_equip_confirm(2)",
			"Ta mu鑞 thay i Hi猲 Vi猲 u /#use_card_exchange_equip_confirm(3)",
			"Ta mu鑞 i th� kh竎 /use_card",
			"в ta xem/nothing",
			}
	Say("<color=green>Ni猲 s�<color>: B筺 mu鑞 i trang b� n祇 sau y? <color=red>Ch� �: Ngi ch璦 v祇 l璾 ph竔 ch� nh薾 頲 1 v� kh� ho芻 trang s鴆 ng蓇 nhi猲.<color>",getn(selTab),selTab);
end;

function use_card_exchange_equip_confirm(nType)
	if GetItemCount(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4]) < 6000 then
		Talk(1,"use_card","<color=green>Ni猲 s�<color>: Xin l鏸! S� lng th� k� ni謒 JX2 tr遪 3 n╩ c馻 b筺 kh玭g .");
		return 0;
	end;
	local selTab = {
			"уng �/#get_emperor_equip("..nType..")",
			"Kh玭g,Ta mu鑞 i th� kh竎 c�/use_card_exchange_equip",
			"Ta suy ngh� m閠 ch髏 /nothing",
			}
	local tbItemName = {"Hi猲 Vi猲 v� kh�","Hi猲 Vi猲 Chi課","Hi猲 Vi猲 u"};
	Say("B筺 x竎 nh﹏ mu鑞 i <color=yellow>"..tbItemName[nType].."<color> ch�?",getn(selTab),selTab);		
end;

function get_emperor_equip(nType)
	if gf_JudgeRoomWeight(1,100,".") == 0 then
		return 0;
	end;
	local tbItemName = {"Hi猲 Vi猲 v� kh�","Hi猲 Vi猲 Chi課","Hi猲 Vi猲 u"};
	local nRoute = GetPlayerRoute();
	local nRetCode = 0;
	local nRand = 0;
	if nType == 1 then
		select_emperor_weapon();
		return 0;
	end;
	if DelItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],6000) ~= 1 then
		Talk(1,"use_card","<color=green>Ni猲 s�<color>: Xin l鏸! S� lng th� k� ni謒 JX2 tr遪 3 n╩ c馻 b筺 kh玭g .");
		return 0;
	end;
	if nType == 2 then
		nRand = random(1,getn(tbHuangDiRing1[nRoute]));
		nRetCode = AddItem(tbHuangDiRing1[nRoute][nRand][2],tbHuangDiRing1[nRoute][nRand][3],tbHuangDiRing1[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
	elseif nType == 3 then
		nRand = random(1,getn(tbHuangDiRing2[nRoute]));
		nRetCode = AddItem(tbHuangDiRing2[nRoute][nRand][2],tbHuangDiRing2[nRoute][nRand][3],tbHuangDiRing2[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
	end;
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 "..tbItemName[nType]);
		WriteLog("[08 Tam ti誸 li猲 th玭g]:"..GetName().."Х d飊g th� k� ni謒 i."..tbItemName[nType]);
	else
		WriteLog("[L鏸 08 Tam ti誸 li猲 th玭g]:"..GetName().."D飊g th� k� ni謒 i."..tbItemName[nType].."B竜 l鏸 khi AddItem, nRetCode:"..nRetCode);
	end;
end;

function select_emperor_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then
		local selTab = {
					"Ta mu鑞 Hi猲 Vi猲 To竔 V� o/#give_emperor_weapon(2,1)",
					"Ta mu鑞 Hi猲 Vi猲 To竔 V� C玭/#give_emperor_weapon(2,2)",
					"в ta xem/nothing",
					}
		Say("B筺 ch鋘 nh鱪g v� kh� g� sau y?",getn(selTab),selTab);
	else
		local nIdx = random(1,getn(tHuangDiWeapon[nRoute]));
		give_emperor_weapon(nRoute,nIdx);
	end;
end;

function give_emperor_weapon(nRoute,nIdx)
	if gf_JudgeRoomWeight(1,100,".") == 0 then
		return 0;
	end;
	if DelItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],6000) ~= 1 then
		Talk(1,"use_card","<color=green>Ni猲 s�<color>: Xin l鏸! S� lng th� k� ni謒 JX2 tr遪 3 n╩ c馻 b筺 kh玭g .");
		return 0;
	end;
	local nRetCode = AddItem(tHuangDiWeapon[nRoute][nIdx][2],tHuangDiWeapon[nRoute][nIdx][3],tHuangDiWeapon[nRoute][nIdx][4],1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 "..tHuangDiWeapon[nRoute][nIdx][1]);
		WriteLog("[08 Tam ti誸 li猲 th玭g]:"..GetName().."Х d飊g th� k� ni謒 i."..tHuangDiWeapon[nRoute][nIdx][1]);
	else
		WriteLog("[L鏸 08 Tam ti誸 li猲 th玭g]:"..GetName().."D飊g th� k� ni謒 i."..tHuangDiWeapon[nRoute][nIdx][1].."B竜 l鏸 khi AddItem, nRetCode:"..nRetCode);
	end;
end;

function use_mooncake()
	local selTab = {
				"Ta mu鑞 d飊g Th辬h Th� Kim Mai H祅 Hng Nguy謙 i ph莕 thng /#use_mooncake_confirm(1)",
				"Ta mu鑞 d飊g Th辬h Th� B筩h Ng鋍 Song Ho祅g Nguy謙 i ph莕 thng /#use_mooncake_confirm(2)",
				"Ta mu鑞 d飊g Th辬h Th� K� Hng Ng� Nh﹏ Nguy謙 i ph莕 thng /#use_mooncake_confirm(3)",
				"Ta mu鑞 d飊g Th辬h Th� B竎h Hoa Th藀 C萴 Nguy謙 i ph莕 thng /#use_mooncake_confirm(4)",
				"Ta mu鑞 d飊g Th辬h Th� Th蕋 Tinh B筺 Qu﹏ Nguy謙 i ph莕 thng /#use_mooncake_confirm(5)",
				"Ta mu鑞 d飊g Th辬h Th� Thng Nga Th駓 Tinh Nguy謙 i ph莕 thng /#use_mooncake_confirm(6)",
				"Ta mu鑞 bi誸 lo筰 B竛h Trung Thu n祔 c� th� i 頲 ph莕 thng g� /know_mookcake_use",
				"Ta  d祅h ╪ v藋./nothing",
				}
	Say("N╩ nay ch髇g ta h穣 dung b秓 h閜 c馻 V� L﹎ Minh ch� ph竧 l祄 gi秈 thng cho ngi l祄 b竛h trung thu ngon nh蕋,  xem h� c� l祄 ra nh鱪g lo筰 B竛h Trung Thu n祔 kh玭g:",getn(selTab),selTab);
end;

function know_mookcake_use()
	Talk(1,"use_mooncake","<color=green>Ni猲 s�<color>:\nTh辬h Th� Mai H祅 Hng Nguy謙 c� th� i: 100 甶觤 danh v鋘g v� 1 H閜 Ng鋍 B礽 Huy Ho祅g\nTh辬h Th� B筩h Ng鋍 Song Ho祅g Nguy謙 i: 5-20 甶觤 t輈h l騳 T� Quang C竎 v� 1 H閜 уng B礽 Huy Ho祅g\nTh辬h Th� K� Hng Ng� Nh﹏ Nguy謙 i: 10-30 甶觤 c鑞g hi課 s� m玭 v� 1 H閜 уng B礽 Huy Ho祅g\nTh辬h Th� B竎h Hoa Th藀 C萴 Nguy謙 i: 20-40 甶觤 t輈h l騳 chi課 trng v� 1 H閜 уng B礽 Huy Ho祅g\nTh辬h Th� Th蕋 Tinh B筺 Qu﹏ Nguy謙 i: 甶觤 kinh nghi謒. M鏸 l莕 n閜 1 c竔 c� th� nh薾 1 H閜 Ng﹏ B礽 Vinh D鵟nTh辬h Th� Thng Nga Th駓 Tinh Nguy謙 i: 甶觤 kinh nghi謒. M鏸 l莕 n閜 10 c竔 c� th� nh薾 1 H閜 Kim B礽 Vinh D鵟n<color=red>Ch� �: Ngi ch璦 v祇 m玭 ph竔 kh玭g nh薾 頲 甶觤 c鑞g hi課 s� m玭 v� 甶觤 t輈h l騳 chi課 trng.<color>");
end;

function use_mooncake_confirm(nType)
	if gf_JudgeRoomWeight(2,60,".") == 0 then
		return 0;
	end;
	local nPoint = 0;
	local nTimes = 0;
	local nLevel = GetLevel();
	local nExp = 0;
	local nX = 100;
	local nRoute = GetPlayerRoute();
	local nNums = 0;
	if DelItem(tMoonCake[10+nType][2],tMoonCake[10+nType][3],tMoonCake[10+nType][4],1) == 1 then
		if nType == 1 then
			nNums = GetByte(GetTask(TASK_CHANGE_YUEBING),1);
			if nNums >= 100 then
				Talk(1,"","<color=green>Ni猲 s�<color>: M鏸 ngi t鑙 產 c� th� i b竛h trung thu n祔 100 l莕, b筺  i 100 l莕 r錳, kh玭g th� i ti誴.");
				return
			end
			ModifyReputation(100,0);
			AddItem(tItemInfo[15][2],tItemInfo[15][3],tItemInfo[15][4],1);
			Msg2Player("B筺 nh薾 頲 1 "..tItemInfo[15][1]);
			SetTask(TASK_CHANGE_YUEBING,SetByte(GetTask(TASK_CHANGE_YUEBING),1,nNums+1));
			Talk(1,"use_mooncake","<color=green>Ni猲 s�<color>: B筺  i <color=yellow>"..(nNums+1).." l莕<color> Th辬h Th� Mai H祅 Hng Nguy謙, b筺 c遪 i 頲 <color=yellow>"..(99-nNums).." l莕<color>.");
		elseif nType == 2 then
			nNums = GetByte(GetTask(TASK_CHANGE_YUEBING),2);
			if nNums >= 100 then
				Talk(1,"","<color=green>Ni猲 s�<color>: M鏸 ngi t鑙 產 c� th� i b竛h trung thu n祔 100 l莕, b筺  i 100 l莕 r錳, kh玭g th� i ti誴.");
				return
			end		
			nPoint = random(5,20);
			SetTask(652,GetTask(652)+nPoint);
			Msg2Player("B筺 nh薾 頲 "..nPoint.." 甶觤 t輈h l騳 T� Quang C竎 ");
			AddItem(tItemInfo[16][2],tItemInfo[16][3],tItemInfo[16][4],1);
			Msg2Player("B筺 nh薾 頲 1 "..tItemInfo[16][1]);
			SetTask(TASK_CHANGE_YUEBING,SetByte(GetTask(TASK_CHANGE_YUEBING),2,nNums+1));
			Talk(1,"use_mooncake","<color=green>Ni猲 s�<color>: B筺  i <color=yellow>"..(nNums+1).." l莕<color> Th辬h Th� B筩h Ng鋍 Song Ho祅g Nguy謙, b筺 c遪 i 頲 <color=yellow>"..(99-nNums).." l莕<color>.");			
		elseif nType == 3 then
			nNums = GetByte(GetTask(TASK_CHANGE_YUEBING),3);
			if nNums >= 100 then
				Talk(1,"","<color=green>Ni猲 s�<color>: M鏸 ngi t鑙 產 c� th� i b竛h trung thu n祔 100 l莕, b筺  i 100 l莕 r錳, kh玭g th� i ti誴.");
				return
			end		
			if nRoute ~= 0 then
				nPoint = random(10,30);
				SetTask(336,GetTask(336)+nPoint);
				Msg2Player("B筺 nh薾 頲 "..nPoint.." 甶觤 c鑞g hi課 S� M玭 ");
			else
				--nExp = floor(100000*(nLevel^3)/(80^3));
				--ModifyExp(nExp);
				--Msg2Player("你获得"..nExp.."点经验");
			end;
			AddItem(tItemInfo[16][2],tItemInfo[16][3],tItemInfo[16][4],1);
			Msg2Player("B筺 nh薾 頲 1 "..tItemInfo[16][1]);
			SetTask(TASK_CHANGE_YUEBING,SetByte(GetTask(TASK_CHANGE_YUEBING),3,nNums+1));
			Talk(1,"use_mooncake","<color=green>Ni猲 s�<color>: B筺  i <color=yellow>"..(nNums+1).." l莕<color> Th辬h Th� K� Hng Ng� Nh﹏ Nguy謙, b筺 c遪 i 頲 <color=yellow>"..(99-nNums).." l莕<color>.");						
		elseif nType == 4 then
			nNums = GetByte(GetTask(TASK_CHANGE_YUEBING),4);
			if nNums >= 100 then
				Talk(1,"","<color=green>Ni猲 s�<color>: M鏸 ngi t鑙 產 c� th� i b竛h trung thu n祔 100 l莕, b筺  i 100 l莕 r錳, kh玭g th� i ti誴.");
				return
			end				
			if nRoute ~= 0 then
				nPoint = random(20,40);
				SetTask(707,GetTask(707)+nPoint);
				Msg2Player("B筺 nh薾 頲 "..nPoint.." 甶觤 t輈h l騳 chi課 trng");
			else
				--nExp = floor(100000*(nLevel^3)/(80^3));
				--ModifyExp(nExp);
				--Msg2Player("你获得"..nExp.."点经验");
			end;
			AddItem(tItemInfo[16][2],tItemInfo[16][3],tItemInfo[16][4],1);
			Msg2Player("B筺 nh薾 頲 1 "..tItemInfo[16][1]);
			SetTask(TASK_CHANGE_YUEBING,SetByte(GetTask(TASK_CHANGE_YUEBING),4,nNums+1));
			Talk(1,"use_mooncake","<color=green>Ni猲 s�<color>: B筺  i <color=yellow>"..(nNums+1).." l莕<color> Th辬h Th� B竎h Hoa Th藀 C萴 Nguy謙, b筺 c遪 i 頲 <color=yellow>"..(99-nNums).." l莕<color>.");			
		elseif nType == 5 then
			nTimes = GetTask(TASK_QIXING_EXCHANGE)+1;
			if nTimes > 10 then
				nX = max(20,100-(nTimes-10)*5);
			end;
			if nLevel ~= 99 then	
				nExp = floor((nX/100)*(1500000*nLevel^3)/(80^3));
				ModifyExp(nExp);
				Msg2Player("B筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒");
			else
				AddItem(tItemInfo[27][2],tItemInfo[27][3],tItemInfo[27][4],30);
				Msg2Player("B筺 nh薾 頲 30 quy觧 "..tItemInfo[27][1]);
			end
--			if mod(nTimes,5) == 0 then
				AddItem(tItemInfo[17][2],tItemInfo[17][3],tItemInfo[17][4],1);
				Msg2Player("B筺 nh薾 頲 1 "..tItemInfo[17][1]);
--				Msg2Global(GetName().."使用盛世七星伴君月换取到了1个"..tItemInfo[17][1]);
--				WriteLog("[08三节连过]"..GetName().."用盛世七星伴君月换取了1个"..tItemInfo[17][1]);
--			end;
			Msg2Player("Зy l� l莕 th� "..nTimes.." l莕 d飊g Th辬h Th� Th蕋 Tinh B筺 Qu﹏ Nguy謙 i thng ");
			SetTask(TASK_QIXING_EXCHANGE,nTimes);
		elseif nType == 6 then
			nTimes = GetTask(TASK_CHANGE_EXCHANGE)+1;
			if nTimes > 10 then
				nX = max(20,100-(nTimes-10)*5);
			end;
			if nLevel ~= 99 then	
				nExp = floor((nX/100)*(3000000*nLevel^3)/(80^3));
				ModifyExp(nExp);
				Msg2Player("B筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒");
			else
				AddItem(tItemInfo[27][2],tItemInfo[27][3],tItemInfo[27][4],60);
				Msg2Player("B筺 nh薾 頲 60 quy觧 "..tItemInfo[27][1]);			
			end
			if mod(nTimes,10) == 0 then
				AddItem(tItemInfo[18][2],tItemInfo[18][3],tItemInfo[18][4],1);
				Msg2Player("B筺 nh薾 頲 1 "..tItemInfo[18][1]);
				Msg2Global(GetName().." l莕 d飊g Th辬h Th� Thng Nga Th駓 Tinh Nguy謙 i 1"..tItemInfo[18][1]);
				WriteLog("[08 Tam ti誸 li猲 th玭g]"..GetName().." d飊g Th辬h Th� Thng Nga Th駓 Tinh Nguy謙 i 1"..tItemInfo[18][1]);
			end;
			SetTask(TASK_CHANGE_EXCHANGE,nTimes);
			Msg2Player("Зy l� l莕 th� "..nTimes.." l莕 d飊g Th辬h Th� Thng Nga Th駓 Tinh Nguy謙 i thng ");
		end;
		WriteLog("[08 Tam ti誸 li猲 th玭g]"..GetName().."Х d飊g B竛h Trung Thu i ph莕 thng, c竎 lo筰 b竛h Trung Thu:"..nType);
	else
		Talk(1,"use_mooncake","B筺 kh玭g c� <color=yellow>"..tMoonCake[10+nType][1].."<color> �!!");
	end;
end;

function know_reward()
	Talk(3,"want_reward","<color=green>Ni猲 s�<color>: M鏸 ng祔 v祇 16:30, 19:30, 21:45 7 Boss l韓 s� xu蕋 hi謓 b猲 ngo礽 3 th祅h l韓 Ph鬾g Tng, Tuy襫 Ch﹗, Th祅h Й, nh b筰 Boss c� th� g鋓 ra Ti觰 qu竔, nh蕁 v祇 Ti觰 qu竔 nh薾 頲 B秓 h閜 ho芻 Ch譨 kh鉧 (m鏸 ngi m鏸 gi� ch� c� th� nh蕁 1 l莕).","<color=green>Ni猲 s�<color>: T誸 Trung Thu l筰 n, n╩ nay ngo礽 vi謈 l祄 c竎 b竛h trung thu  thng th鴆 c遪 c� th� n ch� ta фi c竎 lo筰 b秓 h閜 c馻 V� l﹎ minh ch� ph竧. Mu鑞 bi誸 b秓 h閜 c� c玭g d鬾g g� h穣 n g苝 c s� V� L﹎.","<color=green>Ni猲 s�<color>: Trong b秓 h閜 c� th� k� ni謒 JX2 tr遪 3 n╩, ta mu鑞 thu th藀 c竎 th� n祔, n誹 ngi t譵 頲 甧m n ch� ta  i thng!");
end;

function want_mooncake_resource()
	if gf_JudgeRoomWeight(8,100) == 0 then
		Talk(1,"","B筺 trang b� qu� nhi襲, kh玭g th� th猰 ph莕 thng m韎 v祇.");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	local nRetCode = 0;
	if GetItemCount(tMaterial[9][2],tMaterial[9][3],tMaterial[9][4]) == 0 then
		nRetCode = AddItem(tMaterial[9][2],tMaterial[9][3],tMaterial[9][4],1);
		if nRetCode == 1 then
			Msg2Player("B筺 nh薾 頲 1 "..tMaterial[9][1]);
		end;
	end;
	if nDate <= GetTask(TASK_GOT_RESOURCE) then
		Talk(1,"main","H玬 nay ngi  nh薾 nguy猲 li謚 l祄 b竛h, ng祔 mai h穣 quay l筰 nh薾 ti誴!");
		return 0;
	end;
	SetTask(TASK_GOT_RESOURCE,nDate);
	nRetCode = AddItem(tMaterial[1][2],tMaterial[1][3],tMaterial[1][4],1); 
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 1 "..tMaterial[1][1]);
	end;
	nRetCode = AddItem(tMaterial[4][2],tMaterial[4][3],tMaterial[4][4],1);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 1 "..tMaterial[4][1]);
	end;
	nRetCode = AddItem(tMaterial[5][2],tMaterial[5][3],tMaterial[5][4],1);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 1 "..tMaterial[5][1]);
	end;
	nRetCode = AddItem(tMaterial[6][2],tMaterial[6][3],tMaterial[6][4],1);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 1 "..tMaterial[6][1]);
	end;
	nRetCode = AddItem(tMaterial[7][2],tMaterial[7][3],tMaterial[7][4],1);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 1 "..tMaterial[7][1]);
	end;
	nRetCode = AddItem(tMaterial[8][2],tMaterial[8][3],tMaterial[8][4],1);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 1 "..tMaterial[8][1]);
	end;
	Talk(1,"main","Зy l� nguy猲 li謚 l祄 b竛h c馻 b筺, hy v鋘g b筺 c� th� l祄 ra b竛h Trung Thu h秓 h筺g!");
end;

function want_mooncake()
	local nDate = tonumber(date("%y%m%d"));
	local nMapID = GetWorldPos();
	local sCityName = "";
	if nMapID == 100 then
		sCityName = "Tuy襫 Ch﹗";
	elseif nMapID == 200 then
		sCityName = "Bi謓 Kinh";
	elseif nMapID == 300 then
		sCityName = "Th祅h Й";
	end;
	local nLv = GetLevel();
	if IB_VERSION ~= 1 then
		if nLv < 60 then
			Talk(1,"","<color=green>Ni猲 s�<color>: Ъng c蕄 c馻 b筺 qu� th蕄, kh玭g th� nh薾 b竛h trung thu, t  <color=yellow>c蕄 60<color> h穣 quay l筰 y.");
			return
		end
	else
		if nLv < 30 then
			Talk(1,"","<color=green>Ni猲 s�<color>: Ъng c蕄 c馻 b筺 qu� th蕄, kh玭g th� nh薾 b竛h trung thu, t <color=yellow>c蕄 30<color> h穣 quay l筰 y.");
			return
		end 
	end
	if GetTask(TASK_GOT_MOONCATE) >= nDate then
		Talk(1,"main","H玬 nay b筺  nh薾 b竛h Trung Thu, ng祔 mai h穣 quay l筰 l穘h ti誴. Ch骳 b筺 Trung Thu vui v�!");
		return 0;
	end;
	local nCounter = GetMapTaskTemp(nMapID,3);
	if nCounter == 0 then
		Talk(1,"main","B竛h Trung Thu v蒼 ch璦 chu萵 b� xong,"..tSexName[GetSex()].."Th阨 gian n l蕐 B竛h Trung Thu l� <color=yellow>11h30, 14h30, 21h00, 23:00<color>, s� lng c� h筺. Xin h穣 nhanh ch﹏.");
		return 0;
	elseif nCounter == 1 then
		AddGlobalNews(sCityName.."Ni猲 s�  ph竧 xong b竛h Trung Thu, xin c竎 b筺 l莕 sau ti誴 t鬰 t輈h c鵦 tham gia.");
		Msg2SubWorld(sCityName.."Ni猲 s�  ph竧 xong b竛h Trung Thu, xin c竎 b筺 l莕 sau ti誴 t鬰 t輈h c鵦 tham gia.");
	end;
	SetTask(TASK_GOT_MOONCATE,nDate);
	local nRetCode = AddItem(tMoonCake[17][2],tMoonCake[17][3],tMoonCake[17][4],1);
	if nRetCode == 1 then
		Talk(1,"main","B竛h Trung Thu n祔 tuy ch糿g c� g� c bi謙 nh璶g h穣 coi nh� l� m閠 ch髏 t﹎ � c馻 ta.");
	else
		WriteLog("[L鏸 Tam ti誸 li猲 th玭g]:"..GetName().."L鏸 AddItem khi nh薾 b竛h trung thu, tr� quay l筰:"..nRetCode);
	end;
	SetMapTaskTemp(nMapID,3,nCounter-1);
	SetTask(TASK_GOT_MOONCANT_COUNT,GetTask(TASK_GOT_MOONCANT_COUNT)+1);
	if nCounter > 10 and mod(nCounter-1,10) == 0 then
		Msg2SubWorld(sCityName.."Ch� Ni猲 s� c遪 "..(10*floor(nCounter/10)).." ph莕 b竛h Trung Thu c� th� l穘h.");
	end;
end;

function know_detail()
	local selTab = {
			"Nh薾 頲 b竛h Trung Thu M� V�/detail_1",
			"Nh薾 thng V� L﹎ Minh/detail_6",
--			"领取两周年奖励/detail_2",
			"B竛h Trung Thu, l蕐 o c� i ph莕 thng /detail_3",
			"L祄 c竎 lo筰 b竛h Trung Thu/detail_4",
			"фi th� k� ni謒 nh薾 ph莕 thng/detail_5",
			"[-Quay l筰 i tho筰-]/main",
			"[-K誸 th骳 i tho筰-]/nothing",
			}
	Say("<color=green>Hng d蒼<color>: B筺 mu鑞 t譵 hi觰 phng di謓 n祇?",getn(selTab),selTab);
end;

function detail_1()
	Talk(1,"know_detail","<enter>Th阨 gian nh薾 b竛h Trung Thu:<color=yellow> M鏸 ng祔 4 l莕 11h30, 14h30, 21h00, 23h00<color>, ngi ch琲 c� th� g苝 Ni猲 s�  l蕐 b竛h, ch� � s� lng c� h筺, ai n trc s� l蕐 trc, <color=yellow> ch� 頲 l蕐 1 l莕 trong ng祔<color>. ");
end;

function detail_2()
	Talk(1,"know_detail","Kim S琻 chng m玭  chu萵 b� r蕋 nhi襲 ph莕 thng cho ngi ch琲 c�, b筺 n祇 tham gia V� L﹎ 2 v祇 3 th阨 甶觤 kh竎 nhau s� c� ph莕 thng tng 鴑g. \nQuy t綾 ph莕 thng: \n1, x﹜ d鵱g nh﹏ v藅 nhi襲 h琻 600 ng祔 頲 t苙g 20 rng s総 ho芻 5 rng ng ho芻 1 rng b筩\n2, x﹜ d鵱g nh﹏ v藅 tr猲 300 ng祔 頲 t苙g 10 rng s総 ho芻 2 rng ng \n3, x﹜ d鵱g nh﹏ v藅 輙 h琻 100 ng祔 頲 t苙g 5 rng s総 ho芻 1 rng ng.");
end;

function detail_3()
	Talk(1,"detail_3_ex","<color=green>Ni猲 s�<color>: M鏸 ng祔 v祇 <color=yellow>16:30, 19:30, 21:45<color> c竎 Boss s� xu蕋 hi謓 b猲 ngo礽 <color=yellow>Ph鬾g Tng. Tuy襫 Ch﹗, Th祅h Й<color>, nh b筰 c竎 BOSS n祔 c� th� g鋓 ra Ti觰 qu竔, nh蕁 v祇 Ti觰 qu竔 nh薾 頲 c竎 B秓 h閜 (m鏸 ngi m鏸 gi� ch� c� th� nh蕁 1 l莕), m鋓 ngi ph秈 c� ch譨 kh鉧 tng 鴑g m� c竎 b秓 h閜  nh薾 ph莕 thng.");
end;

function detail_3_ex()
	Talk(1,"know_detail","<color=green>Ni猲 s�<color>: T誸 Trung Thu l筰 n, n╩ nay ngo礽 vi謈 l祄 c竎 b竛h trung thu  thng th鴆 c遪 c� th� n ch� ta фi c竎 lo筰 b秓 h閜 c馻 V� l﹎ minh ch� ph竧. Mu鑞 bi誸 b秓 h閜 c� c玭g d鬾g g� h穣 n g苝 <color=yellow>c s� V� L﹎<color>. Ngo礽 ra n誹 b筺 nh薾 頲 th� k� ni謒 JX2 tr遪 3 n╩ c� th� n g苝 Ni猲 s� i thng.");
end;

function detail_4()
	Talk(1,"detail_4_ex","<color=green>Ni猲 s�<color>: <enter>C竎h l祄 b竛h trung thu: <enter>M鏸 ng祔 n g苝 Ni猲 s� nh薾 nguy猲 li謚 v� c玭g c� l祄 b竛h, ╪ c竎 b竛h trung thu s� nh薾 頲 c竎 hi謚 qu� c bi謙.<enter><color=yellow>1. Nh薾 nguy猲 li謚<color>: Trong th阨 gian ho箃 ng, m鏸 ng祔 online n g苝 Ni猲 s�  nh薾 nguy猲 li謚, ngo礽 ra c� th� mua th猰 c竎 nguy猲 li謚 l祄 b竛h t筰 y.<enter><color=yellow>2. N蕌 b竛h<color>: u ti猲, nh蕁 ch鋘 c玭g c�, sau  b� nguy猲 li謚 v祇 theo hng d蒼, c� th� ch鋘 b� 1 trong 3 nguy猲 li謚 ch輓h v祇, sau  ch鋘 than hay c駃  n蕌.");
end;

function detail_4_ex()
	Talk(1,"know_detail","<color=green>Hng d蒼<color>: Ch� �: <enter>1) N誹 ch鋘 than g� th� nhi謙  ban u l� 600 , ch鋘 c駃 th� nhi謙  ban u l� 300 . <enter>2)Nhi謙  l� s� gi秏 kh玭g ng鮪g gi秏 xu鑞g. <enter>3)B蕋 c� l骳 n祇 c騨g c� th� th猰 nhi猲 li謚 v祇 l� nh璶g nhi謙  vt qu� 900  b竛h s� b� ch竬. <enter>4) Nhi謙  trong l� nng kh玭g th� bi誸 頲 n猲 sau khi b総 u nng b竛h 3 ph髏 s� c� 1 l莕 畂 nhi謙  hi謓 t筰, n誹 qu� 3 ph髏 sau s� kh玭g th� 畂 nhi謙 . <enter><color=yellow>3, l蕐 b竛h<color><enter>1) Th阨 gian nng b竛h l� 5 ph髏. 5 ph髏 sau nh蕁 chu閠 ph秈 v祇 l� nng b竛h  l蕐 b竛h. <enter>2) Sau khi nhi謙  l� nng b竛h c遪 0  kh玭g th� ti誴 t鬰 th猰 nhi猲 li謚 v祇.");
end;

function detail_5()
	Talk(2,"know_detail","<color=green>Ni猲 s�<color>: M� b秓 h閜 c� th� nh薾 頲 th� k� ni謒 JX2 tr遪 3 n╩\n  10 th� k� ni謒 i 頲 1 B錸g Lai ti猲 l閈n  20 th� k� ni謒 i 頲 ph莕 thng 甶觤 kinh nghi謒\n  40 th� k� ni謒 i 頲 ph莕 thng 甶觤 kinh nghi謒\n  100 k� ni謒 c� th� i 1 H閜 Ng﹏ B礽 Vinh D鵟n  500 th� k� ni謒 i 1 Ch譨 Kh鉧 B筩 Vinh D�","<color=green>Ni猲 s�<color>:\n1000 th� k� ni謒 i 1 H閜 Kim B礽 Vinh D鵟n2000 th� k� ni謒 i trang s鴆 Huy Ho祅g Chi Th駓\n3000 th� k� ni謒 i trang s鴆 Vinh D鵟n6000 th� k� ni謒 i 1 trong 3 trang b� Ho祅g д.");
end;

function detail_6()
	Talk(1,"know_detail","<color=green>Ni猲 s�<color>:\nTrong th阨 gian ho箃 ng, m鏸 ng祔 n g苝 V� l﹎ truy襫 nh﹏  nh薾 thng c馻 V� l﹎ minh ch�, ph莕 thng n祔 s� thay i t飝 theo v薾 may c馻 b筺. Mu鑞 bi誸 v薾 may h穣 n t譵 Th� Ti觰 Nha.");
end;


function cancel()
	SetTaskTemp(73,0);
end;

function get_intro_book()
	if GetItemCount(tItemInfo[11][2],tItemInfo[11][3],tItemInfo[11][4]) >=1 then
		Talk(1,"main","<color=green>Hng d蒼<color>: Kh玭g ph秈 ngi c� 1 quy觧"..tItemInfo[11][1].."?");
	elseif AddItem(tItemInfo[11][2],tItemInfo[11][3],tItemInfo[11][4],1) == 1 then
		Msg2Player("B筺 nh薾 頲 1 quy觧"..tItemInfo[11][1]);
		Talk(1,"main","Зy l� s竎h hng d蒼 ho箃 ng trong n╩ nay, h穣 gi� k� v� t譵 l阨 gi秈 p cho nh鱪g c﹗ h醝 c馻 b筺 nh�!");
	end;
end;

function buy_fireworks()
	Sale(89);
end;

function require_mooncake()
	local nGotTimes = GetTask(TASK_GOT_MOONCANT_COUNT);
	local nPassDay = tonumber(date("%j")) - 255;
	if nPassDay > 27 then
		nPassDay = 27;
	end;	
	local nNum = nPassDay - nGotTimes;	--如果活动跨年了，这个计算就不合适。2008年9月11日是2008年的第255天
	if nNum <= 0 then
		Talk(1,"","B筺  nh薾  s� b竛h r錳.");
		return 0;
	end;
	Say("Ho箃 ng l莕 n祔 b筺  th鵦 hi謓 r錳.<color=yellow>"..nGotTimes.."<color> l莕 B竛h Trung Thu M� V�, b筺 c遪 <color=yellow>"..nNum.."<color> b竛h ch璦 nh薾, nh薾<color=yellow>1 l莕 <color>ph秈 c� <color=yellow>danh s竎h ngi ch琲 c�<color>, b筺 x竎 nh薾 nh薾 kh玭g?",
		2,
		"Ta mu鑞 nh薾/require_mooncake_confirm",
		"T筸 th阨 kh玭g d飊g/nothing")
end;

function require_mooncake_confirm()
	local nGotTimes = GetTask(TASK_GOT_MOONCANT_COUNT);
	if gf_JudgeRoomWeight(1,10,".") == 0 then
		return 0;
	end;
	if DelItem(2,0,1024,1) == 1 then
		AddItem(tMoonCake[17][2],tMoonCake[17][3],tMoonCake[17][4],1);
		SetTask(TASK_GOT_MOONCANT_COUNT,nGotTimes+1);
		Msg2Player("B筺 nh薾 頲 1 "..tMoonCake[17][1]);
	else
		Talk(1,"","Ph秈 c� <color=yellow>Danh s竎h ngi ch琲 c�<color> m韎 c� th� nh薾 b竛h. ");
	end;
end;

function buy_things()
	Sale(89);
end;

function ring_Sale()
	Sale(100,100,1);
end 