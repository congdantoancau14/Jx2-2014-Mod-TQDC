-- Created by TriHM - CÈm nang ho¹t ®éng - 

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\golden_card\\npc_golden_saleman.lua")
Include("\\script\\online\\viet_event\\volambaohap\\head.lua")
Include("\\script\\online_activites\\2010_11\\activity_01\\head.lua")
Include("\\script\\task\\faction_boss\\wulinmeng_teshi.lua")
Include("\\script\\online\\viet_event\\firework_10\\award_csm_5.lua")
Include("\\script\\online_activites\\2010_11\\activity_02\\head.lua") -- Added at 07/11/2020
Include("\\script\\online_activites\\2011_10\\activity_03\\teacher_day.lua")
Include("\\script\\online_activites\\xinshouzhiyin\\head.lua")
Include("\\script\\online_activites\\201203\\gongli\\gongli.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\script\\online_activites\\head\\activity_normal_define.lua")
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 
Include("\\script\\vng\\lib\\vnglib_award.lua") 
Include("\\script\\online_activites\\2014_01\\spring1.lua") 
Include("\\script\\online_activites\\2014_01\\valentine.lua")
Include("\\script\\online_activites\\2014_01\\spring2.lua")
Include("\\script\\online_activites\\xinshouzhiyin\\item\\item_xiaoaojianghulu_head.lua")
Include("\\script\\online_activites\\2011_08\\activity_02\\baked_cakes_main.lua");
Include("\\script\\online_activites\\202007\\head.lua");
Include("\\script\\online\\viet_event\\200908\\viet0908_head.lua");


szNPCName = "<color=green>Long Hæ Sø<color>: "
TASKTEMP_BHTA9 = 118


--×ðÊ¦ÖØµÀ»î¶¯ID
function OnUse()
	SayPage1()
end

function SayPage1()

	local nDate = tonumber(date("%y%m%d"))
	local nHour = tonumber(date("%H%M"))
	local tbSay = {}

	local szHeader = "Vâ l©m lôc quyÓn, ghi l¹i mäi sù biÕn ®éng trªn giang hå. TiÕu ng¹o phiªu du, tù do tù t¹i!"	 
	-----------
	tinsert(tbSay, "ChÕ t¹o mét sè vËt phÈm/makeThings"); 
	tinsert(tbSay, "ChÕ biÕn mét sè vËt phÈm/cheBien"); 
	tinsert(tbSay, "Khai th¸c mét sè vËt phÈm/showListKhaiThac"); 
	
	-- Because the following is unreal so moved it to activity_ambassador (§¹i sø ho¹t ®éng)
	-- if nDate >= 121012 then 
		-- if (nHour >= 0800 and nHour <= 1000) or (nHour >= 1530 and nHour <= 1730) or (nHour >= 2000 and nHour <= 2200) then
			-- tinsert(tbSay, "NhËn Vâ L©m B¶o H¹p/Rec_VLBH")
			-- tinsert(tbSay, "NhËn Vâ L©m B¶o H¹p tiÖn lîi (20 c¸i - tiªu hao 20 vµng)/Rec_VLBH_2")
		-- end
	-- end
	-- tbSay = getExtendActivities(tbSay);
	
	tinsert(tbSay, "\n§ãng cÈm nang/do_nothing");
	
	Say(szHeader, getn(tbSay), tbSay)
end

function getExtendActivities(tbSay)

	tinsert(tbSay, "Tham gia tÝnh n¨ng Vâ L©m B¶o H¹p/vlbh_active")
	tinsert(tbSay, "Tham gia ho¹t ®éng T«n s­ träng ®¹o/showEventTonSu")
	tinsert(tbSay, "Ta muèn nhËn nhiÖm vô TiÕu Ng¹o Giang Hå!/accept_tngh_task")
	tinsert(tbSay, "Më tiÖm trao ®æi mét sè vËt phÈm/exchangeItems");
	tinsert(tbSay, "Danh s¸ch c¸c ho¹t ®éng kh¸c/showActivities");
	return tbSay;
end;

function showEventTonSu()
	local tbSay = {}
	local szHeader = "---- T«n s­ träng ®¹o ---";
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 111111 and nDate <= 411212 then
		tinsert(tbSay,VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[153].."/check_onlinetime")
		tinsert(tbSay,VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[154].."/exchang_chip")
		tinsert(tbSay,VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[155].."/exchang_zhienbaoxiang")
	end
	-- tinsert(tbSay, "Trang tr­íc/SayPage1");
	-- tinsert(tbSay, "\n§ãng cÈm nang/do_nothing");
	tinsert(tbSay, "\nTho¸t/do_nothing");
	
	Say(szHeader, getn(tbSay), tbSay)
end;

function showListKhaiThac()
	tbSay = {}
	szHeader = "----- Danh s¸ch kÜ n¨ng ----- ";
	for i=1, getn(tKhaiThac) do
		tinsert(tbSay,format("Khai th¸c mét Ýt %s/#khaithac(%d)",tKhaiThac[i]["target_item"][1][1],i));
	end
	
	tinsert(tbSay, "\nTrang tr­íc/SayPage1");
	tinsert(tbSay, "§ãng cÈm nang/do_nothing");
	Say(szHeader, getn(tbSay), tbSay);
end;

function khaithac(id)
	local tItem = tKhaiThac[id];
	local nMap, nX, nY = GetWorldPos();
	if nMap == tItem["map"][1][2] then
		
		local nMax, tCount = countItems(tItem["tool"]);
	
		if nMax > 0 then
			local nDel, tDel = delItems(tItem["tool"]);
			if nDel ~= 1 then
				Talk(1,"","H×nh nh­ ®· x¶y ra vÊn ®Ò víi dông cô khai th¸c.");
			else
				AddItem(
					tItem["target_item"][1][2][1],
					tItem["target_item"][1][2][2],
					tItem["target_item"][1][2][3],
					tItem["target_item"][1][3]
				);
				Msg2Player(format("Khai th¸c thµnh c«ng %d %s.",tItem["target_item"][1][3],tItem["target_item"][1][1]));
			end
		else
			local szMes = "TiÖt! Ta ch­a chuÈn bÞ ®Çy ®ñ dông cô khai th¸c råi!"..enter
					..tItem["desc"][1][1]..enter;
			for i=1, getn(tCount) do
				if tCount[i] == 0 then
					szMes = szMes.."* "..colorize("red",tItem["tool"][i][1])..space
										..colorize("yellow",tItem["tool"][i][3])..enter;
				else
					szMes = szMes.."* "..colorize("green",tItem["tool"][i][1])..space
										..colorize("yellow",tItem["tool"][i][3])..enter;
				end
			end
			Talk(1,"",szMes);
		end
		
	else
		Talk(1,"",format("Muèn khai th¸c %s th× ph¶i ®Õn %s",
						colorize("yellow",tItem["target_item"][1][1]),
						colorize("yellow",tItem["map"][1][1])
						)
			);
	end
end;



function exchangeItems()
	tbSay = {}
	szHeader = "----- TiÖm trao ®æi mua b¸n di ®éng IOT 4.0 ----- ";
	tinsert(tbSay,"§æi tiÒn/exchangeMoney")
	tinsert(tbSay,"Mua 10 Lé Thñy = 1 vµng/BuyWater")
	tinsert(tbSay,"Mua thuèc trÞ bÖnh/NT_Dialog2")
	tinsert(tbSay,"Ta muèn mua mÆt n¹ S¸t Thñ §­êng (60 vµng)/buy_mask")
	tinsert(tbSay,"NhËn th­ëng ®iÓm ch©n khÝ khi sö dông ch×a khãa vµng trong tuÇn/get_chankhi")
	tinsert(tbSay,"§æi vËt phÈm C«ng Thµnh/exchange_citywar")
	tinsert(tbSay,"Chuéc l¹i qu©n c«ng tæn thÊt trong ngµy (1 ®iÓm = 2 b¹c)/take_jungong_back")
	tinsert(tbSay,"T¹i h¹ muèn mua 1 Hoµng Kim LÖnh Bµi/get_golden_card")	
	tinsert(tbSay,"Ta muèn ®æi 1 M¶nh B¹ch Kim (tiªu hao 1 ch×a khãa Vµng + 599 vµng)/#exchang_Item(1)")
	tinsert(tbSay,"Ta muèn ®æi 4 M¶nh B¹ch Kim (tiªu hao 1 ThÇn Tµi B¶o R­¬ng + 199 vµng/#exchang_Item(2)")
	-- tinsert(tbSay, "\nTrang tr­íc/SayPage1");
	-- tinsert(tbSay, "§ãng cÈm nang/do_nothing");
	tinsert(tbSay, "Tho¸t/do_nothing");
	Say(szHeader, getn(tbSay), tbSay);
end;

function exchangeMoney()
	tbSay = {}
	szHeader = "----- §æi tiÒn ----- ";
	for i=1, getn(tExchange) do
		for j=1, getn(tExchange[i]["source"]) do
			tinsert(tbSay, format("§æi %d %s lÊy %d %s/#exchangeWithRate(%d,%d,%d,%d)",
					tExchange[i]["source"][j][3],
					tExchange[i]["source"][j][1],
					tExchange[i]["source"][j][4],
					tExchange[i]["target"][1][1],
					i,
					j,
					tExchange[i]["source"][j][3],
					tExchange[i]["source"][j][4])
					);
		end
	end
	-- tinsert(tbSay, "\nTrang tr­íc/SayPage1");
	tinsert(tbSay, "Tho¸t/do_nothing");
	Say(szHeader, getn(tbSay), tbSay);
end;

function exchangeWithRate(nExId, nSourceId, nSourceRate, nTargetRate)
	local tItem = tExchange[nExId];
	tChoosenMoneyInfo = {nExId, nSourceId, nSourceRate, nTargetRate}
	local nCount = GetItemCount(
				tItem["source"][nSourceId][2][1],
				tItem["source"][nSourceId][2][2],
				tItem["source"][nSourceId][2][3]
				);
	if nCount < 1 then
		Talk(1,"",format("ChuÈn bÞ kh«ng ®ñ sè l­îng %s, kh«ng thÓ tiÕn hµnh trao ®æi.",
				colorize("yellow",tItem["source"][nSourceId][1])
				)
		);
		return
	end
	AskClientForNumber("_request_number_call_back",1,nCount,"NhËp sè l­îng");
end;

function _request_number_call_back(nInputed)
	local nExId = tChoosenMoneyInfo[1];
	local nSourceId = tChoosenMoneyInfo[2];
	local nSourceRate = tChoosenMoneyInfo[3];
	local nTargetRate = tChoosenMoneyInfo[4];
	local tItem = tExchange[nExId];
	local nCount = convertMoney(nInputed, nSourceRate, nTargetRate);
	
	local nFreeItemRoomNeeded = nCount / tItem["target"][1][3];
	if GetFreeItemRoom() <  nFreeItemRoomNeeded then
		Talk(1,"","Hµnh trang kh«ng ®ñ "..colorize("yellow", nFreeItemRoomNeeded).." chç trèng");
		return
	end
	
	local nDel = DelItem(
			tItem["source"][nSourceId][2][1],
			tItem["source"][nSourceId][2][2],
			tItem["source"][nSourceId][2][3],
			nInputed
			);
	if nDel ~= 1 then
		Talk("Cã sù gian lËn nµo ë ®©y?!!");
	else
		AddItem(
			tItem["target"][1][2][1],
			tItem["target"][1][2][2],
			tItem["target"][1][2][3],
			nCount
			);
		Msg2Player("Giao dÞch thµnh c«ng!");
	end
end;

function convertMoney(nSourceCount, nSourceRate, nTargetRate)
	local nTargetCounted = floor((nSourceCount * nTargetRate) / nSourceRate);
	return nTargetCounted;
end;

function showActivities()
	local nDate = tonumber(date("%y%m%d"));
	tbSay = {}
	szHeader = "----- Danh s¸ch ho¹t ®éng -----";
	tbSay = get_tbJNDialog_info(VET_XA_ACTIVITY_TABLE);
	
	tinsert(tbSay, "Ho¹t ®éng Quèc kh¸nh 09\/2009/regainDialog");
	
	tinsert(tbSay, "Ho¹t ®éng Hoa h­íng d­¬ng 10\/2011/sunflower_main");
	
	if gf_CheckEventDateEx(VET_201401_SPRING1_ACTIVITYID) ==  1 then
		tinsert(tbSay,VET_201401_SPRING1_MAIN);
	end
	if gf_CheckEventDateEx(VET_201401_VALENTINE_ACTIVITYID) ==  1 then
		tinsert(tbSay,VET_201401_VALENTINE_MAIN);
	end
	if gf_CheckEventDateEx(VET_201401_SPRING2_ACTIVITYID) ==  1 then
		tinsert(tbSay,VET_201401_SPRING2_MAIN);
	end
	---------
	if gf_CheckEventDateEx(VET_201203_GONGLI_ID) == 1 then
		tinsert(tbSay,VET_201203_KuiZheng_tbMain)
	end	
	if GetGlbValue(1023) == 80 and nDate <= 430811 then
		tinsert(tbSay,"Hç trî C«n L«n §iÖn/VLBH_HotroConLon")
	end
	
	if gf_CheckEventDateEx(VET_201302_VALENTINE) == 1 then
		tinsert(tbSay,"Event LÔ T×nh Nh©n/get_tinhnhan")
	end	
	if nDate >= 120120 and nDate <= 420122 and GetGlbValue(GLB_TSK_SERVER_ID) == 70 then
		tinsert(tbSay, "NhËn ®Òn bï ®iÓm kinh nghiÖm m¸y chñ Thµnh Long/award_give_500_mil")
	end
	if nDate >= 110705 and nDate <= 410805 then
		tinsert(tbSay, "NhËn th­ëng ch­¬ng tr×nh CSM 5.0/award_CSM5")
	end
--	NhËn th­ëng TTGC
	if nDate >= 111213 and nDate <= 420102 then
		tinsert(tbSay, "NhËn th­ëng ThÇn Tµi Gâ Cöa/GiveAwardTTGS")
	end	
-------------	
	-- tinsert(tbSay, "\nTrang tr­íc/SayPage1");
	-- tinsert(tbSay, "§ãng cÈm nang/do_nothing");
	tinsert(tbSay, "Tho¸i/do_nothing");
	Say(szHeader, getn(tbSay), tbSay);
end;

function sunflower_main()
	local tbSay = {}
	local szHeader;
	tbSay, szHeader = SF_dialog(tbSay, szHeader);
	tinsert(tbSay, "\nTrang tr­íc/showActivities");
	-- tinsert(tbSay, "§ãng cÈm nang/do_nothing");
	tinsert(tbSay, "Tho¸t/nothing");
	Say(szHeader,getn(tbSay),tbSay);
end;

function cheBien()
	tbSay = {}
	tinsert(tbSay, "N­íng b¸nh Trung Thu 2011/nuongBanh2011");
	for i=1,getn(tCheBien) do
		tinsert(tbSay, "N­íng "..tCheBien[i]["products"][1][1]..format("/#cook(%d)",i));
	end
	tinsert(tbSay, "\nTrang chÝnh/SayPage1");
	tinsert(tbSay, "Tho¸t/nothing");
	Say("----- Chän vËt phÈm cÇn chÕ biÕn -----",getn(tbSay),tbSay);
end;

function nuongBanh2011()
	-- local lonuong = CreateNpc("Lß n­íng nhá",GetName().." më lß n­íng b¸nh", GetWorldPos());
	-- SetNpcScript(lonuong,"\\script\\online_activites\\2011_08\\activity_02\\npc_script.lua");
	local szSayHead = "N­íng b¸nh Trung Thu 2011";
	local tbSayDialog = {}
	tbSayDialog, szSayHead = VET_201108_BakedCakes_Dialog(tbSayDialog, szSayHead);
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end;

function cook()
	tbSay = {}
	for i=1, getn(tOvens) do
		tinsert(tbSay, format("Thuª %s (tiªu %d vµng, søc chøa %d)/#createLoNuong(%d)", 
			tOvens[i][2],tOvens[i][3]/10000,tOvens[i][4],i));
	end
	tinsert(tbSay, "Dùng löa tr¹i/createtLuaTrai");
	tinsert(tbSay, "\nTrang chÝnh/SayPage1");
	tinsert(tbSay, "Tho¸t/nothing");
	Say("----- Chän vËt phÈm cÇn chÕt¹o -----",getn(tbSay),tbSay);
end;

function createtLuaTrai()
	local tLuaTrai = tDecorators[1];
	local nMax, tResult = countItems(tLuaTrai["mater"]);
	if nMax > 0 then
		if GetTime() - GetTask(TASK_BURNFIRETIME) < FIRELIFETIME and GetTask(TASK_BURNFIRETIME) ~= 0 then
			Talk(1,"","B¹n ®· cã 1 ®èng löa råi, kh«ng cÇn l·ng phÝ cñi.");
			return 0;
		end;
		local nDelResult, tDel = delItems(tLuaTrai["mater"]);
		if nDelResult == 1 then
			local map,x,y = GetWorldPos();
			x = random(x-2,x+2)
			y = random(y-2,y+2)
			local npcFireIndex = CreateNpc("Löa tr¹i","§èng löa",map,x,y);
			SetNpcScript(npcFireIndex,"\\script\\online_activites\\202007\\donglua.lua");
			SetNpcLifeTime(npcFireIndex,FIRELIFETIME)
			SetTask(TASK_FIREINDEX,npcFireIndex);
			SetTask(TASK_BURNFIRETIME,GetTime());
			
			local nTimeLeftNeedWood = FIRELIFETIME-FIRELIFETIME*0.2;
			StartTimeGuage("Thªm cñi",nTimeLeftNeedWood,0,npcFireIndex)
			
			local nOvenIndex = GetTask(TASK_OVENINDEX);
			StopTimeGuage(nOvenIndex);		
			StartTimeGuage("Lß n­íng",nTimeLeftNeedWood+OVENLIFETIME,0,nOvenIndex);
			SetNpcLifeTime(nOvenIndex,nTimeLeftNeedWood+OVENLIFETIME)
		else
			Msg2Player("Cã vÊn ®Ò trong qu¸ tr×nh xö lÝ nguyªn liÖu.");
		end
	else
		local szNguyenLieu = "";
		for i=1, getn(tLuaTrai["mater"]) do
			szNguyenLieu = szNguyenLieu..format("* %s %s",
				colorize("green",tLuaTrai["mater"][i][1]),
				"x"..colorize("yellow",tLuaTrai["mater"][i][3]))..enter;
		end
		Talk(1,"",tLuaTrai["desc"][1][1]..enter.."Kh«ng ®ñ nguyªn liÖu."..enter..szNguyenLieu);
	end
end;

function createLoNuong(nType)
	SetTask(TASK_OVENTYPE, nType)
	Pay(tOvens[nType][3]);
	local nIndex = CreateNpc(tOvens[nType][1], tOvens[nType][2], GetWorldPos());
	SetNpcScript(nIndex,"\\script\\online_activites\\202007\\lonuong.lua");
	SetTask(TASK_OVENINDEX,nIndex);
	SetTask(TASK_HIREOVENTIME,GetTime());
	SetNpcLifeTime(nIndex,OVENLIFETIME)
	StartTimeGuage(tOvens[nType][2],OVENLIFETIME,0,nIndex)
	
end;

function makeThings()
	tbSay = {}
	for i=1,getn(tHandMade) do
		tinsert(tbSay, "ChÕ t¹o "..tHandMade[i]["target_item"][1][1]..format("/#makeThing(%d)",i));
	end
	tinsert(tbSay, "\nTrang chÝnh/SayPage1");
	tinsert(tbSay, "Tho¸t/nothing");
	Say("----- Chän vËt phÈm cÇn chÕt¹o -----",getn(tbSay),tbSay);
end;

function makeThing(nIndex)
	local tItem = tHandMade[nIndex];
	local tCounter = {}
	
	local nEnough = 1;
	local nNumMaters = getn(tItem["mater"]);
	for i=1, nNumMaters do
		local nCount = GetItemCount(tItem["mater"][i][2][1],tItem["mater"][i][2][2],tItem["mater"][i][2][3]);
		tCounter[i] = {}
		if nCount < tItem["mater"][i][3] then
			nEnough = 0;
			tCounter[i]["count"] = nCount;
			tCounter[i]["enough"] = 0;
		else
			tCounter[i]["count"] = nCount;
			tCounter[i]["enough"] = 1;
		end
	end
	
	if nEnough == 0 then

		local szTalk = "TiÖt! Ta ch­a chuÈn bÞ ®ñ nguyªn liÖu\n";
		szTalk = szTalk..tItem["desc"][1][1].."<enter>";
		
		for i=1,getn(tCounter) do
			
			if (tCounter[i]["enough"] == 0) then
				szTalk = szTalk.."* <color=red>"..tItem["mater"][i][1].." <color><color=yellow>"..tItem["mater"][i][3].."<color><enter>";
			elseif (tCounter[i]["enough"] == 1) then
				szTalk = szTalk.."* <color=green>"..tItem["mater"][i][1].." <color><color=yellow>"..tItem["mater"][i][3].."<color><enter>";
			end
		end
		
		Talk(1,"",szTalk);
		return
		
	else
		local tDel = {}
		local nDelResult = 1;
		for i=1,nNumMaters do
			if (tItem["mater"][i][4] ~= 1) then
				local nDel = DelItem(
					tItem["mater"][i][2][1],
					tItem["mater"][i][2][2], 
					tItem["mater"][i][2][3],
					tItem["mater"][i][3]
					);
				if nDel == 1 then
					tDel[i] = 1;
				else
					nDelResult = 0;
				end
			end
		end
		
		if nDelResult ~= 0 then
			for i=1, getn(tItem["target_item"]) do
				AddItem(
					tItem["target_item"][i][2][1],
					tItem["target_item"][i][2][2],
					tItem["target_item"][i][2][3],
					tItem["target_item"][i][3]
					);
				Msg2Player("ChÕ t¹o thµnh c«ng "..tItem["target_item"][1][1]);
			end
		else
			Msg2Player("ChÕ t¹o thÊt b¹i. Cã thÓ ®· bÞ tiªu hao mét sè nguyªn liÖu");
		end
	end
	
end;

function get_chankhi()
	local tbSay = {}
	local szHeader = "NhËn th­ëng ®iÓm Ch©n KhÝ khi sö dông Ch×a Khãa Vµng "
	.."(<color=green>Quý ®ång ®¹o chØ ®­îc nhËn 1 lÇn trong tuÇn.<color>)"
	
	--tinsert(tbSay, "Sö dông 5-9 ch×a khãa nhËn 600 ®iÓm ch©n khÝ (tiªu hao 33 Xu vËt phÈm)/#confirm_get_chankhi(1)")
	--tinsert(tbSay, "Sö dông 10-14 ch×a khãa nhËn 1200 ®iÓm ch©n khÝ (tiªu hao 66 Xu vËt phÈm)/#confirm_get_chankhi(2)")
	tinsert(tbSay, "Sö dông 15 ch×a khãa nhËn 2500 ®iÓm ch©n khÝ (tiªu hao 99 Xu vËt phÈm)/#confirm_get_chankhi(3)")
	tinsert(tbSay, "T¹i h¹ sÏ quay l¹i sau/do_nothing")
	
	Say(szHeader, getn(tbSay), tbSay)
end

function accept_tngh_task()
	Talk(1, "", "NhiÖm vô nµy sÏ më trong thêi gian s¾p tíi, c¸c h¹ vui lßng quay trë l¹i sau!")
	return
end

function BuyWater()
	if gf_Judge_Room_Weight(1, 10, " ") == 0 then
		return
	end
	if Pay(10000) == 0 then
		Talk(1, "OnUse", "Ng©n l­îng cña b¹n kh«ng ®ñ!");
		return
	end
		
	gf_AddItemEx({2, 0, 351, 10}, "Lé thñy")
end

function exchange_citywar()
	local tbSay = {
		"§æi 8 Dòng SÜ LÖnh (cÇn 1 Th­ tiÕn cö)/exchange_warriorling",
		"§æi 6 C«ng thµnh Tiªn Phong (cÇn 1 Th­ tiÕn cö)/exchange_citywarling",
		"KÕt thóc ®èi tho¹i/do_nothing",
	}
	Say("C¸c h¹ muèn ®æi vËt phÈm nµo?",getn(tbSay),tbSay)
end

function exchange_warriorling()
	if GetItemCount(2,1,1200) < 1 then
		Talk(1,"","C¸c h¹ h×nh nh­ kh«ng mang Th­ tiÕn cö trªn ng­êi?")
		return
	end
	
	if gf_Judge_Room_Weight(8, 100, " ") == 0 then
		return
	end
	
	if DelItem(2,1,1200,1) == 1 then
		AddItem(2,1,1201,8,1)
		Msg2Player("B¹n nhËn ®­îc 8 Dòng SÜ LÖnh.")
		WriteLogEx("Cong Thanh Chien","nhËn",8,"Dòng SÜ LÖnh","",GetTongName())
	end
end

function exchange_citywarling()
	if GetItemCount(2,1,1200) < 1 then
		Talk(1,"","C¸c h¹ h×nh nh­ kh«ng mang Th­ tiÕn cö trªn ng­êi?")				
		return
	end
	
	if gf_Judge_Room_Weight(6, 100, " ") == 0 then
		return
	end
	
	if DelItem(2,1,1200,1) == 1 then
		AddItem(2,1,1203,6,1)
		Msg2Player("B¹n nhËn ®­îc 6 C«ng thµnh Tiªn Phong LÖnh.")
		WriteLogEx("Cong Thanh Chien","nhËn",6,"C«ng thµnh Tiªn Phong LÖnh","",GetTongName())
	end
end

function take_jungong_back()
	local nDay = tonumber(date("%w%H"))
	if nDay >= 620 and nDay <= 624 then
		Say("Tõ 20:00 - 24:00 thø 7 kh«ng thÓ chuéc l¹i qu©n c«ng!",0)
		return
	end
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(TSK_JUNGONG_PUNISH_DATE) ~= nDate then
		SetTask(TSK_JUNGONG_PUNISH_DATE,nDate)
		SetTask(TSK_JUNGONG_PUNISH,0)
		SetTask(TSK_JUNGONG_LIMIT,0)
		Msg2Player("Qu©n c«ng cã thÓ chuéc ngµy h«m qua ®· hñy bá.")
	end	
	local nLoseJungong = abs(GetTask(TSK_JUNGONG_PUNISH))	
	if nLoseJungong == 0 then
		Say("C¸c h¹ kh«ng cã ®iÓm qu©n c«ng tæn thÊt!",0)
		return
	end	
	if GetTask(TSK_JUNGONG_LIMIT) >= 50000 then
		Say("§iÓm qu©n c«ng chuéc l¹i trong ngµy ®· ®¹t møc giíi h¹n 50000.",0)
		return
	end
	local nMustPay =nLoseJungong * 200
	local strMoney = gf_GetMoneyString(nMustPay)	
	Say("H«m nay c¸c h¹ cã <color=yellow>"..nLoseJungong.."<color> ®iÓm qu©n c«ng bÞ tæn thÊt. CÇn ph¶i cã <color=yellow>"..strMoney.."<color> ®Ó chuéc l¹i sè ®iÓm nµy. C¸c h¹ cã muèn chuéc? <color=red>L­u ý: nÕu c¸c h¹ chuyÓn c«ng tr¹ng tr­íc khi chuéc, qu©n c«ng hiÖn t¹i cña c¸c h¹ sÏ bÞ trõ.<color>",2,"Ta ®ång ý/take_jungong_back_confirm","Kh«ng cÇn/nothing")
end

function take_jungong_back_confirm()
	local nDay = tonumber(date("%w%H"))
	if nDay >= 620 and nDay <= 624 then
		Say("Tõ 20:00 - 24:00 thø 7 kh«ng thÓ chuéc l¹i qu©n c«ng!",0)
		return
	end
	local nLoseJungong = abs(GetTask(TSK_JUNGONG_PUNISH))	
	if nLoseJungong == 0 then
		Say("C¸c h¹ kh«ng cã ®iÓm qu©n c«ng tæn thÊt!",0)
		return
	end	
	local nMustPay =nLoseJungong * 200	
	if GetCash() < nMustPay then
		Say("Sè tiÒn c¸c h¹ mang theo kh«ng ®ñ!",0)
		return
	end
	if Pay(nMustPay) == 1 then
		SetTask(701, GetTask(701) + GetTask(TSK_JUNGONG_PUNISH))
		SetTask(TSK_JUNGONG_PUNISH,0)
		SetTask(TSK_JUNGONG_LIMIT, GetTask(TSK_JUNGONG_LIMIT) + nLoseJungong)
		Say("C¸c h¹ ®· nhËn l¹i ®iÓm qu©n c«ng tæn thÊt thµnh c«ng!",0)
		WriteLogEx("Chuoc Quan Cong","nhËn", nLoseJungong,"®iÓm qu©n c«ng")
	end
end

function vlbh_active()
	local nWeekDay = tonumber(date("%w"))
	local nHour = tonumber(date("%H%M"))
--	if GetLevel() < 79 then
--		Talk(1, "", "§¼ng cÊp 79 trë lªn míi cã thÓ sö dông chøc n¨ng nµy!")
--		return
--	end
--	if gf_Check55MaxSkill() == 0 then
--		Talk(1,"","Max Skill 55 míi cã thÓ tham gia ho¹t ®éng  ")
--		return
--	end
	local tbSay = {}
	local szHeader = "Ho¹t ®éng Vâ L©m B¶o H¹p!\n"
			.. "Vâ l©m b¶o h¹p cã thÓ nhËn vµo c¸c khung giê: 08:00 - 10:00, 15:30 - 17:30, 20:00 - 22:00.";
	--if (nHour >= 0800 and nHour <= 1000) or (nHour >= 1530 and nHour <= 1730) or (nHour >= 2000 and nHour <= 2200) then
		tinsert(tbSay, "NhËn Vâ L©m B¶o H¹p/Rec_VLBH")
		--tinsert(tbSay, "NhËn Vâ L©m B¶o H¹p/CloseFeature")
		tinsert(tbSay, "NhËn Vâ L©m B¶o H¹p tiÖn lîi (20 c¸i - tiªu hao 20 vµng)/Rec_VLBH_2")
		tinsert(tbSay, "Dïng vµng ®æi c¸c lo¹i ch×a khãa/vlbh_exchange_key_gold")
		tinsert(tbSay, "Dïng xu vËt phÈm ®æi c¸c lo¹i ch×a khãa/vlbh_exchange_key_xu")
		tinsert(tbSay, "NhËn th­ëng c¸c lo¹i ch×a khãa/vlbh_receive_key_prize")

		-- tinsert(tbSay, "\nTrang tr­íc/SayPage1");
		tinsert(tbSay, "T¹i h¹ sÏ quay l¹i sau/do_nothing")
	--else
		--Talk(1,"","Ch­a ®Õn giê nhËn b¶o h¹p, c¸c h¹ vui lßng quay l¹i sau");
		--return
	--end
--	tinsert(tbSay, "Shop ch×a khãa vµng/gold_key_shop")	

	Say(szHeader, getn(tbSay), tbSay)
end
function CloseFeature()
	Talk(1, "", "TÝnh n¨ng Vâ L©m B¶o H¹p ®ang t¹m ®ãng, ®¹i hiÖp h·y quay l¹i sau !!!")
end

-- NhËn th­ëng thÇn tµi gâ cöa
function GiveAwardTTGS()
	if gf_GetExtPointByte(1,1) <= 0 then
		Talk(1,"","§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi hoÆc kh«ng cã trong danh s¸ch nhËn th­ëng!")
		return
	end 
	if  gf_GetExtPointByte(1,1) == 1 then
		if gf_SetExtPointByte(1, 1, 0) == 1 then
			gf_AddItemEx2({2,1,1067,1,1}, "§Þnh Hån Thiªn Th¹ch", "Phan thuong TTGC", "nhËn", 7*24*60*60)
		end
	elseif gf_GetExtPointByte(1,1) == 2 then
		if gf_SetExtPointByte(1, 1, 0) == 1 then
			gf_AddItemEx2({0,112,78,1,1}, "L¨ng Ba Vi Bé", "Phan thuong TTGC", "nhËn")
		end
	else
		Talk(1, "", " §¹i hiÖp ®· nhËn phÇn th­ëng nµy råi hoÆc kh«ng cã trong danh s¸ch nhËn th­ëng!")
		return
	end
end

function award_give_500_mil()
	tbDenBuThanhLong = {
		[1] = "nhocksockkuto1994",
		[2] = "katsumi1990",
	}
	
	if GetExtPoint(0) ~= 0 then
		Talk(1, "", "§¹i hiÖp ®· nhËn ®Òn bï råi, kh«ng thÓ nhËn thªm!")
		return
	end
	
	local nCheck = 0
	for i = 1, getn(tbDenBuThanhLong) do
		if GetAccount() == tbDenBuThanhLong[i] then
			nCheck = 1
			break
		end
	end
	
	if nCheck == 0 then
		Talk(1, "", "§¹i hiÖp kh«ng cã trong danh s¸ch nhËn th­ëng!")
		return
	end
	
	if GetExp() >= 1500000000 then
		Talk(1, "", "§¹i hiÖp cã ®iÓm kinh nghiÖm tån ®äng nhiÒu h¬n 1500000000, kh«ng thÓ nhËn th­ëng!")
		return
	end

	if GetExtPoint(0) == 0 then
		AddExtPoint(0,1)
		ModifyExp(500000000)
		Msg2Player("B¹n nhËn ®­îc ®Òn bï 500 triÖu ®iÓm kinh nghiÖm!")
		WriteLogEx("Den bu Thanh Long 2012", "nhËn ®Òn bï")
	end
end

function exchang_Item(nType)
	local tbItem = {
				[1] = {1, 0, " Ch×a khãa Vµng", 599, {2, 1, 30346, 1}, "M¶nh B¹ch Kim", 30133, "MBK= key vµng 20/7", 1},
				[2] = {0, 1, " ThÇn Tµi B¶o R­¬ng", 199, {2, 1, 30346, 4}, "M¶nh B¹ch Kim", 30344, "MBK = TTBR 20/7", 4},
			}
	if GetCash() < tbItem[nType][4] * 10000 then
		Talk(1,"","B¹n kh«ng mang ®ñ vµng ®Ó ®æi!!!")
		return 0
	end			
	if GetItemCount(2,1,30133) < tbItem[nType][1] then
		Talk(1,"","B¹n kh«ng mang theo ®ñ "..tbItem[nType][1]..tbItem[1][3])
		return 0
	end			
	if GetItemCount(2,1,30344) < tbItem[nType][2] then
		Talk(1,"","B¹n kh«ng mang theo ®ñ "..tbItem[nType][2]..tbItem[2][3])
		return 0
	end				
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","Hµnh trang cña b¹n kh«ng ®ñ chç trèng!!!")
        	return 0
	end		
	if DelItem(2,1,tbItem[nType][7],1) == 1 and Pay(tbItem[nType][4] * 10000) == 1 then
		gf_AddItemEx2(tbItem[nType][5], tbItem[nType][8], "DOI MANH BACH KIM", "®æi thµnh c«ng")
		Msg2Player("B¹n nhËn ®­îc "..tbItem[nType][9]..tbItem[nType][6])
	end	
end
function confirm_get_chankhi(nType)
	local tbCheck = {
				[1] = {5, 33, 600},
				[2] = {10, 66, 1200},
				[3] = {15, 99, 2500},
			}
	if floor(GetTask(TSK_VLBH_QI)/100) >= 1 then
		Talk(1,"","B¹n ®· nhËn phÇn th­ëng tuÇn nµy råi, nªn kh«ng thÓ nhËn th­ëng ®­îc n÷a !!!")
		return 0		
	end
	if MeridianGetLevel() <= 0 then
		Talk(1,"","B¹n ch­a kÝch ho¹t kinh m¹ch nªn kh«ng thÓ nhËn th­ëng !!!")
		return 0
	end
	local nNumUse = mod(GetTask(TSK_VLBH_QI), 100)
	if nNumUse <tbCheck[nType][1] then
		Talk(1,"","B¹n ch­a sö dông ®ñ sè l­îng ch×a khãa vµng nªn kh«ng thÓ nhËn th­ëng !!!")
		return 0
	end

	if GetItemCount(2,1,30230) < tbCheck[nType][2] then
		Talk(1,"","B¹n kh«ng mang theo ®ñ "..tbCheck[nType][2].." xu vËt phÈm ®Ó nhËn th­ëng !!!")
		return 0
	end		
	SetTask(TSK_VLBH_QI, GetTask(TSK_VLBH_QI) + 100)
	if DelItem(2,1,30230,tbCheck[nType][2]) == 1 then
		AwardGenuineQi(tbCheck[nType][3])
	end
	gf_WriteLogEx("Vo Lam Bao Hap", "nhËn  thµnh c«ng", 1, "PhÇn th­ëng ch©n khÝ 20/7")
	WriteLogEx("LOG XU VAT PHAM","Sö dông CKV, tiªu hao 99 xu nhËn 2k5 ch©n khÝ")
end

function get_tinhnhan()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th«ng tin chi tiÕt c¸c ho¹t ®éng ®ång ®¹o cã thÓ xem trªn trang chñ <color=green>http://volam2.zing.vn<color>."
	--tbSayDialog, szSayHead = get_tbJNDialog_info(VET_XA_ACTIVITY_TABLE)
   	tinsert(tbSayDialog,"§æi 1 Socola t×nh nh©n (5 H¹t cacao + 2 Xu vËt phÈm)/VNG_DoiEventThang2_Form1")
   	tinsert(tbSayDialog,"§æi 1 Socola t×nh nh©n (5 H¹t cacao + 1 S÷a tinh luyÖn)/VNG_DoiEventThang2_Form2")
   	tinsert(tbSayDialog,"KiÓm tra sè l­îng Socola ®· sö dông/ncheck_number_use"	)
   	tinsert(tbSayDialog,"NhËn phÇn th­ëng cuèi sö dông Socola/get_final_socola"	)
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/do_nothing"	)
	nSaySize = getn(tbSayDialog);	
	Say(szSayHead, nSaySize, tbSayDialog);
end
function get_final_socola()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th«ng tin chi tiÕt c¸c ho¹t ®éng ®ång ®¹o cã thÓ xem trªn trang chñ <color=green>http://volam2.zing.vn<color>."	
	tinsert(tbSayDialog,"NhËn th­ëng 2 thiªn m«n kim lÖnh/#confirm_get_final_socola(1)")
   	tinsert(tbSayDialog,"NhËn th­ëng 300 triÖu ®iÓm kinh nghiÖm/#confirm_get_final_socola(2)")
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/do_nothing"	)
	nSaySize = getn(tbSayDialog);	
	Say(szSayHead, nSaySize, tbSayDialog);
end
function confirm_get_final_socola(nType)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end
	if gf_Judge_Room_Weight(2, 50," ") ~= 1 then
        	return
    end
    if GetTask(2763) == 1 then
    		Talk(1, "", "§¹i hiÖp ®· nhËn phÇn th­ëng cuèi råi!!!")
    		return
    end   
    if GetTask(2764) < 1402 then
    		Talk(1, "", "§¹i hiÖp ch­a sö dông ®ñ 1402 vËt phÈm Valentine!!!")
    		return
    end
    SetTask(2763,1)
    if nType == 1 then
    		gf_AddItemEx2({2,1,30370,2}, "Thiªn M«n Kim LÖnh", "VALENTINE 2013", "PhÇn th­ëng cuèi Socola Thiªn M«n Kim LÖnh", 0, 1);
    	else
    		ModifyExp(300000000)
    		gf_WriteLogEx("VALENTINE 2013", "nhËn  thµnh c«ng", 1, "PhÇn th­ëng cuèi Socola exp")
    	end
    
end
function VNG_DoiEventThang2_Form1()
	AskClientForNumber("VNG_DoiEventThang2_Socola1", 1, 999, "Sè l­îng (1-999)")
end
function VNG_DoiEventThang2_Socola1(nCount)
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0;
	end
	if GetItemCount(2,1,30357) < (5 * nCount ) or GetItemCount(2,1,30230) < (2 * nCount)  then
		Talk(1, "", "B¹n kh«ng ®ñ ®iÒu kiÖn ®æi.");
		return 0;
	end
	if DelItem(2,1,30357, 5 * nCount) == 1 and DelItem(2,1,30230, 2 * nCount) == 1 then
		gf_AddItemEx2({2, 1, 30495, nCount}, "Socola", "VALENTINE 2013" , "nhËn")
	end
end
function VNG_DoiEventThang2_Form2()
	AskClientForNumber("VNG_DoiEventThang2_Socola2", 1, 20, "Sè l­îng (1-20)")
end
function VNG_DoiEventThang2_Socola2(nCount)
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0;
	end
	if GetItemCount(2,1,30357) < (5 * nCount ) or GetItemCount(2,1,30477) < (1 * nCount)  then
		Talk(1, "", "B¹n kh«ng ®ñ ®iÒu kiÖn ®æi.");
		return 0;
	end
	if DelItem(2,1,30357, 5 * nCount) == 1 and DelItem(2,1,30477, 1 * nCount) == 1 then
		gf_AddItemEx2({2, 1, 30495, nCount}, "Socola", "VALENTINE 2013" , "nhËn")
	end
end
function ncheck_number_use()
	local nUse = GetTask(2764)
	Talk(1, "", "Sè lÇn sö dông Socola hiÖn t¹i lµ : "..nUse.."/10000");
end


function VLBH_HotroConLon()
	local tbSay = {}
	tinsert(tbSay,"NhËn 900 Vâ L©m B¶o H¹p (tiªu hao 21 xu vËt phÈm)/#HoTroVLBH(1)")
	tinsert(tbSay,"NhËn 900 Vâ L©m B¶o H¹p (tiªu hao 66 vµng)/#HoTroVLBH(2)")
	tinsert(tbSay,"Ta ch­a muèn nhËn b©y giê/gf_DoNothing")
	Say("ChØ cÇn tèn Ýt thï lao, c¸c h¹ sÏ nhËn ®­îc nhiÒu hç trî...", getn(tbSay), tbSay)
end


function do_nothing()
	
end