-- Created by TriHM - C�m nang ho�t ��ng - 

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


szNPCName = "<color=green>Long H� S�<color>: "
TASKTEMP_BHTA9 = 118


--��ʦ�ص��ID
function OnUse()
	SayPage1()
end

function SayPage1()

	local nDate = tonumber(date("%y%m%d"))
	local nHour = tonumber(date("%H%M"))
	local tbSay = {}

	local szHeader = "V� l�m l�c quy�n, ghi l�i m�i s� bi�n ��ng tr�n giang h�. Ti�u ng�o phi�u du, t� do t� t�i!"	 
	-----------
	tinsert(tbSay, "Ch� t�o m�t s� v�t ph�m/makeThings"); 
	tinsert(tbSay, "Ch� bi�n m�t s� v�t ph�m/cheBien"); 
	tinsert(tbSay, "Khai th�c m�t s� v�t ph�m/showListKhaiThac"); 
	
	-- Because the following is unreal so moved it to activity_ambassador (��i s� ho�t ��ng)
	-- if nDate >= 121012 then 
		-- if (nHour >= 0800 and nHour <= 1000) or (nHour >= 1530 and nHour <= 1730) or (nHour >= 2000 and nHour <= 2200) then
			-- tinsert(tbSay, "Nh�n V� L�m B�o H�p/Rec_VLBH")
			-- tinsert(tbSay, "Nh�n V� L�m B�o H�p ti�n l�i (20 c�i - ti�u hao 20 v�ng)/Rec_VLBH_2")
		-- end
	-- end
	-- tbSay = getExtendActivities(tbSay);
	
	tinsert(tbSay, "\n��ng c�m nang/do_nothing");
	
	Say(szHeader, getn(tbSay), tbSay)
end

function getExtendActivities(tbSay)

	tinsert(tbSay, "Tham gia t�nh n�ng V� L�m B�o H�p/vlbh_active")
	tinsert(tbSay, "Tham gia ho�t ��ng T�n s� tr�ng ��o/showEventTonSu")
	tinsert(tbSay, "Ta mu�n nh�n nhi�m v� Ti�u Ng�o Giang H�!/accept_tngh_task")
	tinsert(tbSay, "M� ti�m trao ��i m�t s� v�t ph�m/exchangeItems");
	tinsert(tbSay, "Danh s�ch c�c ho�t ��ng kh�c/showActivities");
	return tbSay;
end;

function showEventTonSu()
	local tbSay = {}
	local szHeader = "---- T�n s� tr�ng ��o ---";
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 111111 and nDate <= 411212 then
		tinsert(tbSay,VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[153].."/check_onlinetime")
		tinsert(tbSay,VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[154].."/exchang_chip")
		tinsert(tbSay,VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[155].."/exchang_zhienbaoxiang")
	end
	-- tinsert(tbSay, "Trang tr��c/SayPage1");
	-- tinsert(tbSay, "\n��ng c�m nang/do_nothing");
	tinsert(tbSay, "\nTho�t/do_nothing");
	
	Say(szHeader, getn(tbSay), tbSay)
end;

function showListKhaiThac()
	tbSay = {}
	szHeader = "----- Danh s�ch k� n�ng ----- ";
	for i=1, getn(tKhaiThac) do
		tinsert(tbSay,format("Khai th�c m�t �t %s/#khaithac(%d)",tKhaiThac[i]["target_item"][1][1],i));
	end
	
	tinsert(tbSay, "\nTrang tr��c/SayPage1");
	tinsert(tbSay, "��ng c�m nang/do_nothing");
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
				Talk(1,"","H�nh nh� �� x�y ra v�n �� v�i d�ng c� khai th�c.");
			else
				AddItem(
					tItem["target_item"][1][2][1],
					tItem["target_item"][1][2][2],
					tItem["target_item"][1][2][3],
					tItem["target_item"][1][3]
				);
				Msg2Player(format("Khai th�c th�nh c�ng %d %s.",tItem["target_item"][1][3],tItem["target_item"][1][1]));
			end
		else
			local szMes = "Ti�t! Ta ch�a chu�n b� ��y �� d�ng c� khai th�c r�i!"..enter
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
		Talk(1,"",format("Mu�n khai th�c %s th� ph�i ��n %s",
						colorize("yellow",tItem["target_item"][1][1]),
						colorize("yellow",tItem["map"][1][1])
						)
			);
	end
end;



function exchangeItems()
	tbSay = {}
	szHeader = "----- Ti�m trao ��i mua b�n di ��ng IOT 4.0 ----- ";
	tinsert(tbSay,"��i ti�n/exchangeMoney")
	tinsert(tbSay,"Mua 10 L� Th�y = 1 v�ng/BuyWater")
	tinsert(tbSay,"Mua thu�c tr� b�nh/NT_Dialog2")
	tinsert(tbSay,"Ta mu�n mua m�t n� S�t Th� ���ng (60 v�ng)/buy_mask")
	tinsert(tbSay,"Nh�n th��ng �i�m ch�n kh� khi s� d�ng ch�a kh�a v�ng trong tu�n/get_chankhi")
	tinsert(tbSay,"��i v�t ph�m C�ng Th�nh/exchange_citywar")
	tinsert(tbSay,"Chu�c l�i qu�n c�ng t�n th�t trong ng�y (1 �i�m = 2 b�c)/take_jungong_back")
	tinsert(tbSay,"T�i h� mu�n mua 1 Ho�ng Kim L�nh B�i/get_golden_card")	
	tinsert(tbSay,"Ta mu�n ��i 1 M�nh B�ch Kim (ti�u hao 1 ch�a kh�a V�ng + 599 v�ng)/#exchang_Item(1)")
	tinsert(tbSay,"Ta mu�n ��i 4 M�nh B�ch Kim (ti�u hao 1 Th�n T�i B�o R��ng + 199 v�ng/#exchang_Item(2)")
	-- tinsert(tbSay, "\nTrang tr��c/SayPage1");
	-- tinsert(tbSay, "��ng c�m nang/do_nothing");
	tinsert(tbSay, "Tho�t/do_nothing");
	Say(szHeader, getn(tbSay), tbSay);
end;

function exchangeMoney()
	tbSay = {}
	szHeader = "----- ��i ti�n ----- ";
	for i=1, getn(tExchange) do
		for j=1, getn(tExchange[i]["source"]) do
			tinsert(tbSay, format("��i %d %s l�y %d %s/#exchangeWithRate(%d,%d,%d,%d)",
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
	-- tinsert(tbSay, "\nTrang tr��c/SayPage1");
	tinsert(tbSay, "Tho�t/do_nothing");
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
		Talk(1,"",format("Chu�n b� kh�ng �� s� l��ng %s, kh�ng th� ti�n h�nh trao ��i.",
				colorize("yellow",tItem["source"][nSourceId][1])
				)
		);
		return
	end
	AskClientForNumber("_request_number_call_back",1,nCount,"Nh�p s� l��ng");
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
		Talk(1,"","H�nh trang kh�ng �� "..colorize("yellow", nFreeItemRoomNeeded).." ch� tr�ng");
		return
	end
	
	local nDel = DelItem(
			tItem["source"][nSourceId][2][1],
			tItem["source"][nSourceId][2][2],
			tItem["source"][nSourceId][2][3],
			nInputed
			);
	if nDel ~= 1 then
		Talk("C� s� gian l�n n�o � ��y?!!");
	else
		AddItem(
			tItem["target"][1][2][1],
			tItem["target"][1][2][2],
			tItem["target"][1][2][3],
			nCount
			);
		Msg2Player("Giao d�ch th�nh c�ng!");
	end
end;

function convertMoney(nSourceCount, nSourceRate, nTargetRate)
	local nTargetCounted = floor((nSourceCount * nTargetRate) / nSourceRate);
	return nTargetCounted;
end;

function showActivities()
	local nDate = tonumber(date("%y%m%d"));
	tbSay = {}
	szHeader = "----- Danh s�ch ho�t ��ng -----";
	tbSay = get_tbJNDialog_info(VET_XA_ACTIVITY_TABLE);
	
	tinsert(tbSay, "Ho�t ��ng Qu�c kh�nh 09\/2009/regainDialog");
	
	tinsert(tbSay, "Ho�t ��ng Hoa h��ng d��ng 10\/2011/sunflower_main");
	
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
		tinsert(tbSay,"H� tr� C�n L�n �i�n/VLBH_HotroConLon")
	end
	
	if gf_CheckEventDateEx(VET_201302_VALENTINE) == 1 then
		tinsert(tbSay,"Event L� T�nh Nh�n/get_tinhnhan")
	end	
	if nDate >= 120120 and nDate <= 420122 and GetGlbValue(GLB_TSK_SERVER_ID) == 70 then
		tinsert(tbSay, "Nh�n ��n b� �i�m kinh nghi�m m�y ch� Th�nh Long/award_give_500_mil")
	end
	if nDate >= 110705 and nDate <= 410805 then
		tinsert(tbSay, "Nh�n th��ng ch��ng tr�nh CSM 5.0/award_CSM5")
	end
--	Nh�n th��ng TTGC
	if nDate >= 111213 and nDate <= 420102 then
		tinsert(tbSay, "Nh�n th��ng Th�n T�i G� C�a/GiveAwardTTGS")
	end	
-------------	
	-- tinsert(tbSay, "\nTrang tr��c/SayPage1");
	-- tinsert(tbSay, "��ng c�m nang/do_nothing");
	tinsert(tbSay, "Tho�i/do_nothing");
	Say(szHeader, getn(tbSay), tbSay);
end;

function sunflower_main()
	local tbSay = {}
	local szHeader;
	tbSay, szHeader = SF_dialog(tbSay, szHeader);
	tinsert(tbSay, "\nTrang tr��c/showActivities");
	-- tinsert(tbSay, "��ng c�m nang/do_nothing");
	tinsert(tbSay, "Tho�t/nothing");
	Say(szHeader,getn(tbSay),tbSay);
end;

function cheBien()
	tbSay = {}
	tinsert(tbSay, "N��ng b�nh Trung Thu 2011/nuongBanh2011");
	for i=1,getn(tCheBien) do
		tinsert(tbSay, "N��ng "..tCheBien[i]["products"][1][1]..format("/#cook(%d)",i));
	end
	tinsert(tbSay, "\nTrang ch�nh/SayPage1");
	tinsert(tbSay, "Tho�t/nothing");
	Say("----- Ch�n v�t ph�m c�n ch� bi�n -----",getn(tbSay),tbSay);
end;

function nuongBanh2011()
	-- local lonuong = CreateNpc("L� n��ng nh�",GetName().." m� l� n��ng b�nh", GetWorldPos());
	-- SetNpcScript(lonuong,"\\script\\online_activites\\2011_08\\activity_02\\npc_script.lua");
	local szSayHead = "N��ng b�nh Trung Thu 2011";
	local tbSayDialog = {}
	tbSayDialog, szSayHead = VET_201108_BakedCakes_Dialog(tbSayDialog, szSayHead);
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end;

function cook()
	tbSay = {}
	for i=1, getn(tOvens) do
		tinsert(tbSay, format("Thu� %s (ti�u %d v�ng, s�c ch�a %d)/#createLoNuong(%d)", 
			tOvens[i][2],tOvens[i][3]/10000,tOvens[i][4],i));
	end
	tinsert(tbSay, "D�ng l�a tr�i/createtLuaTrai");
	tinsert(tbSay, "\nTrang ch�nh/SayPage1");
	tinsert(tbSay, "Tho�t/nothing");
	Say("----- Ch�n v�t ph�m c�n ch�t�o -----",getn(tbSay),tbSay);
end;

function createtLuaTrai()
	local tLuaTrai = tDecorators[1];
	local nMax, tResult = countItems(tLuaTrai["mater"]);
	if nMax > 0 then
		if GetTime() - GetTask(TASK_BURNFIRETIME) < FIRELIFETIME and GetTask(TASK_BURNFIRETIME) ~= 0 then
			Talk(1,"","B�n �� c� 1 ��ng l�a r�i, kh�ng c�n l�ng ph� c�i.");
			return 0;
		end;
		local nDelResult, tDel = delItems(tLuaTrai["mater"]);
		if nDelResult == 1 then
			local map,x,y = GetWorldPos();
			x = random(x-2,x+2)
			y = random(y-2,y+2)
			local npcFireIndex = CreateNpc("L�a tr�i","��ng l�a",map,x,y);
			SetNpcScript(npcFireIndex,"\\script\\online_activites\\202007\\donglua.lua");
			SetNpcLifeTime(npcFireIndex,FIRELIFETIME)
			SetTask(TASK_FIREINDEX,npcFireIndex);
			SetTask(TASK_BURNFIRETIME,GetTime());
			
			local nTimeLeftNeedWood = FIRELIFETIME-FIRELIFETIME*0.2;
			StartTimeGuage("Th�m c�i",nTimeLeftNeedWood,0,npcFireIndex)
			
			local nOvenIndex = GetTask(TASK_OVENINDEX);
			StopTimeGuage(nOvenIndex);		
			StartTimeGuage("L� n��ng",nTimeLeftNeedWood+OVENLIFETIME,0,nOvenIndex);
			SetNpcLifeTime(nOvenIndex,nTimeLeftNeedWood+OVENLIFETIME)
		else
			Msg2Player("C� v�n �� trong qu� tr�nh x� l� nguy�n li�u.");
		end
	else
		local szNguyenLieu = "";
		for i=1, getn(tLuaTrai["mater"]) do
			szNguyenLieu = szNguyenLieu..format("* %s %s",
				colorize("green",tLuaTrai["mater"][i][1]),
				"x"..colorize("yellow",tLuaTrai["mater"][i][3]))..enter;
		end
		Talk(1,"",tLuaTrai["desc"][1][1]..enter.."Kh�ng �� nguy�n li�u."..enter..szNguyenLieu);
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
		tinsert(tbSay, "Ch� t�o "..tHandMade[i]["target_item"][1][1]..format("/#makeThing(%d)",i));
	end
	tinsert(tbSay, "\nTrang ch�nh/SayPage1");
	tinsert(tbSay, "Tho�t/nothing");
	Say("----- Ch�n v�t ph�m c�n ch�t�o -----",getn(tbSay),tbSay);
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

		local szTalk = "Ti�t! Ta ch�a chu�n b� �� nguy�n li�u\n";
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
				Msg2Player("Ch� t�o th�nh c�ng "..tItem["target_item"][1][1]);
			end
		else
			Msg2Player("Ch� t�o th�t b�i. C� th� �� b� ti�u hao m�t s� nguy�n li�u");
		end
	end
	
end;

function get_chankhi()
	local tbSay = {}
	local szHeader = "Nh�n th��ng �i�m Ch�n Kh� khi s� d�ng Ch�a Kh�a V�ng "
	.."(<color=green>Qu� ��ng ��o ch� ���c nh�n 1 l�n trong tu�n.<color>)"
	
	--tinsert(tbSay, "S� d�ng 5-9 ch�a kh�a nh�n 600 �i�m ch�n kh� (ti�u hao 33 Xu v�t ph�m)/#confirm_get_chankhi(1)")
	--tinsert(tbSay, "S� d�ng 10-14 ch�a kh�a nh�n 1200 �i�m ch�n kh� (ti�u hao 66 Xu v�t ph�m)/#confirm_get_chankhi(2)")
	tinsert(tbSay, "S� d�ng 15 ch�a kh�a nh�n 2500 �i�m ch�n kh� (ti�u hao 99 Xu v�t ph�m)/#confirm_get_chankhi(3)")
	tinsert(tbSay, "T�i h� s� quay l�i sau/do_nothing")
	
	Say(szHeader, getn(tbSay), tbSay)
end

function accept_tngh_task()
	Talk(1, "", "Nhi�m v� n�y s� m� trong th�i gian s�p t�i, c�c h� vui l�ng quay tr� l�i sau!")
	return
end

function BuyWater()
	if gf_Judge_Room_Weight(1, 10, " ") == 0 then
		return
	end
	if Pay(10000) == 0 then
		Talk(1, "OnUse", "Ng�n l��ng c�a b�n kh�ng ��!");
		return
	end
		
	gf_AddItemEx({2, 0, 351, 10}, "L� th�y")
end

function exchange_citywar()
	local tbSay = {
		"��i 8 D�ng S� L�nh (c�n 1 Th� ti�n c�)/exchange_warriorling",
		"��i 6 C�ng th�nh Ti�n Phong (c�n 1 Th� ti�n c�)/exchange_citywarling",
		"K�t th�c ��i tho�i/do_nothing",
	}
	Say("C�c h� mu�n ��i v�t ph�m n�o?",getn(tbSay),tbSay)
end

function exchange_warriorling()
	if GetItemCount(2,1,1200) < 1 then
		Talk(1,"","C�c h� h�nh nh� kh�ng mang Th� ti�n c� tr�n ng��i?")
		return
	end
	
	if gf_Judge_Room_Weight(8, 100, " ") == 0 then
		return
	end
	
	if DelItem(2,1,1200,1) == 1 then
		AddItem(2,1,1201,8,1)
		Msg2Player("B�n nh�n ���c 8 D�ng S� L�nh.")
		WriteLogEx("Cong Thanh Chien","nh�n",8,"D�ng S� L�nh","",GetTongName())
	end
end

function exchange_citywarling()
	if GetItemCount(2,1,1200) < 1 then
		Talk(1,"","C�c h� h�nh nh� kh�ng mang Th� ti�n c� tr�n ng��i?")				
		return
	end
	
	if gf_Judge_Room_Weight(6, 100, " ") == 0 then
		return
	end
	
	if DelItem(2,1,1200,1) == 1 then
		AddItem(2,1,1203,6,1)
		Msg2Player("B�n nh�n ���c 6 C�ng th�nh Ti�n Phong L�nh.")
		WriteLogEx("Cong Thanh Chien","nh�n",6,"C�ng th�nh Ti�n Phong L�nh","",GetTongName())
	end
end

function take_jungong_back()
	local nDay = tonumber(date("%w%H"))
	if nDay >= 620 and nDay <= 624 then
		Say("T� 20:00 - 24:00 th� 7 kh�ng th� chu�c l�i qu�n c�ng!",0)
		return
	end
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(TSK_JUNGONG_PUNISH_DATE) ~= nDate then
		SetTask(TSK_JUNGONG_PUNISH_DATE,nDate)
		SetTask(TSK_JUNGONG_PUNISH,0)
		SetTask(TSK_JUNGONG_LIMIT,0)
		Msg2Player("Qu�n c�ng c� th� chu�c ng�y h�m qua �� h�y b�.")
	end	
	local nLoseJungong = abs(GetTask(TSK_JUNGONG_PUNISH))	
	if nLoseJungong == 0 then
		Say("C�c h� kh�ng c� �i�m qu�n c�ng t�n th�t!",0)
		return
	end	
	if GetTask(TSK_JUNGONG_LIMIT) >= 50000 then
		Say("�i�m qu�n c�ng chu�c l�i trong ng�y �� ��t m�c gi�i h�n 50000.",0)
		return
	end
	local nMustPay =nLoseJungong * 200
	local strMoney = gf_GetMoneyString(nMustPay)	
	Say("H�m nay c�c h� c� <color=yellow>"..nLoseJungong.."<color> �i�m qu�n c�ng b� t�n th�t. C�n ph�i c� <color=yellow>"..strMoney.."<color> �� chu�c l�i s� �i�m n�y. C�c h� c� mu�n chu�c? <color=red>L�u �: n�u c�c h� chuy�n c�ng tr�ng tr��c khi chu�c, qu�n c�ng hi�n t�i c�a c�c h� s� b� tr�.<color>",2,"Ta ��ng �/take_jungong_back_confirm","Kh�ng c�n/nothing")
end

function take_jungong_back_confirm()
	local nDay = tonumber(date("%w%H"))
	if nDay >= 620 and nDay <= 624 then
		Say("T� 20:00 - 24:00 th� 7 kh�ng th� chu�c l�i qu�n c�ng!",0)
		return
	end
	local nLoseJungong = abs(GetTask(TSK_JUNGONG_PUNISH))	
	if nLoseJungong == 0 then
		Say("C�c h� kh�ng c� �i�m qu�n c�ng t�n th�t!",0)
		return
	end	
	local nMustPay =nLoseJungong * 200	
	if GetCash() < nMustPay then
		Say("S� ti�n c�c h� mang theo kh�ng ��!",0)
		return
	end
	if Pay(nMustPay) == 1 then
		SetTask(701, GetTask(701) + GetTask(TSK_JUNGONG_PUNISH))
		SetTask(TSK_JUNGONG_PUNISH,0)
		SetTask(TSK_JUNGONG_LIMIT, GetTask(TSK_JUNGONG_LIMIT) + nLoseJungong)
		Say("C�c h� �� nh�n l�i �i�m qu�n c�ng t�n th�t th�nh c�ng!",0)
		WriteLogEx("Chuoc Quan Cong","nh�n", nLoseJungong,"�i�m qu�n c�ng")
	end
end

function vlbh_active()
	local nWeekDay = tonumber(date("%w"))
	local nHour = tonumber(date("%H%M"))
--	if GetLevel() < 79 then
--		Talk(1, "", "��ng c�p 79 tr� l�n m�i c� th� s� d�ng ch�c n�ng n�y!")
--		return
--	end
--	if gf_Check55MaxSkill() == 0 then
--		Talk(1,"","Max Skill 55 m�i c� th� tham gia ho�t ��ng  ")
--		return
--	end
	local tbSay = {}
	local szHeader = "Ho�t ��ng V� L�m B�o H�p!\n"
			.. "V� l�m b�o h�p c� th� nh�n v�o c�c khung gi�: 08:00 - 10:00, 15:30 - 17:30, 20:00 - 22:00.";
	--if (nHour >= 0800 and nHour <= 1000) or (nHour >= 1530 and nHour <= 1730) or (nHour >= 2000 and nHour <= 2200) then
		tinsert(tbSay, "Nh�n V� L�m B�o H�p/Rec_VLBH")
		--tinsert(tbSay, "Nh�n V� L�m B�o H�p/CloseFeature")
		tinsert(tbSay, "Nh�n V� L�m B�o H�p ti�n l�i (20 c�i - ti�u hao 20 v�ng)/Rec_VLBH_2")
		tinsert(tbSay, "D�ng v�ng ��i c�c lo�i ch�a kh�a/vlbh_exchange_key_gold")
		tinsert(tbSay, "D�ng xu v�t ph�m ��i c�c lo�i ch�a kh�a/vlbh_exchange_key_xu")
		tinsert(tbSay, "Nh�n th��ng c�c lo�i ch�a kh�a/vlbh_receive_key_prize")

		-- tinsert(tbSay, "\nTrang tr��c/SayPage1");
		tinsert(tbSay, "T�i h� s� quay l�i sau/do_nothing")
	--else
		--Talk(1,"","Ch�a ��n gi� nh�n b�o h�p, c�c h� vui l�ng quay l�i sau");
		--return
	--end
--	tinsert(tbSay, "Shop ch�a kh�a v�ng/gold_key_shop")	

	Say(szHeader, getn(tbSay), tbSay)
end
function CloseFeature()
	Talk(1, "", "T�nh n�ng V� L�m B�o H�p �ang t�m ��ng, ��i hi�p h�y quay l�i sau !!!")
end

-- Nh�n th��ng th�n t�i g� c�a
function GiveAwardTTGS()
	if gf_GetExtPointByte(1,1) <= 0 then
		Talk(1,"","��i hi�p �� nh�n ph�n th��ng n�y r�i ho�c kh�ng c� trong danh s�ch nh�n th��ng!")
		return
	end 
	if  gf_GetExtPointByte(1,1) == 1 then
		if gf_SetExtPointByte(1, 1, 0) == 1 then
			gf_AddItemEx2({2,1,1067,1,1}, "��nh H�n Thi�n Th�ch", "Phan thuong TTGC", "nh�n", 7*24*60*60)
		end
	elseif gf_GetExtPointByte(1,1) == 2 then
		if gf_SetExtPointByte(1, 1, 0) == 1 then
			gf_AddItemEx2({0,112,78,1,1}, "L�ng Ba Vi B�", "Phan thuong TTGC", "nh�n")
		end
	else
		Talk(1, "", " ��i hi�p �� nh�n ph�n th��ng n�y r�i ho�c kh�ng c� trong danh s�ch nh�n th��ng!")
		return
	end
end

function award_give_500_mil()
	tbDenBuThanhLong = {
		[1] = "nhocksockkuto1994",
		[2] = "katsumi1990",
	}
	
	if GetExtPoint(0) ~= 0 then
		Talk(1, "", "��i hi�p �� nh�n ��n b� r�i, kh�ng th� nh�n th�m!")
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
		Talk(1, "", "��i hi�p kh�ng c� trong danh s�ch nh�n th��ng!")
		return
	end
	
	if GetExp() >= 1500000000 then
		Talk(1, "", "��i hi�p c� �i�m kinh nghi�m t�n ��ng nhi�u h�n 1500000000, kh�ng th� nh�n th��ng!")
		return
	end

	if GetExtPoint(0) == 0 then
		AddExtPoint(0,1)
		ModifyExp(500000000)
		Msg2Player("B�n nh�n ���c ��n b� 500 tri�u �i�m kinh nghi�m!")
		WriteLogEx("Den bu Thanh Long 2012", "nh�n ��n b�")
	end
end

function exchang_Item(nType)
	local tbItem = {
				[1] = {1, 0, " Ch�a kh�a V�ng", 599, {2, 1, 30346, 1}, "M�nh B�ch Kim", 30133, "MBK= key v�ng 20/7", 1},
				[2] = {0, 1, " Th�n T�i B�o R��ng", 199, {2, 1, 30346, 4}, "M�nh B�ch Kim", 30344, "MBK = TTBR 20/7", 4},
			}
	if GetCash() < tbItem[nType][4] * 10000 then
		Talk(1,"","B�n kh�ng mang �� v�ng �� ��i!!!")
		return 0
	end			
	if GetItemCount(2,1,30133) < tbItem[nType][1] then
		Talk(1,"","B�n kh�ng mang theo �� "..tbItem[nType][1]..tbItem[1][3])
		return 0
	end			
	if GetItemCount(2,1,30344) < tbItem[nType][2] then
		Talk(1,"","B�n kh�ng mang theo �� "..tbItem[nType][2]..tbItem[2][3])
		return 0
	end				
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","H�nh trang c�a b�n kh�ng �� ch� tr�ng!!!")
        	return 0
	end		
	if DelItem(2,1,tbItem[nType][7],1) == 1 and Pay(tbItem[nType][4] * 10000) == 1 then
		gf_AddItemEx2(tbItem[nType][5], tbItem[nType][8], "DOI MANH BACH KIM", "��i th�nh c�ng")
		Msg2Player("B�n nh�n ���c "..tbItem[nType][9]..tbItem[nType][6])
	end	
end
function confirm_get_chankhi(nType)
	local tbCheck = {
				[1] = {5, 33, 600},
				[2] = {10, 66, 1200},
				[3] = {15, 99, 2500},
			}
	if floor(GetTask(TSK_VLBH_QI)/100) >= 1 then
		Talk(1,"","B�n �� nh�n ph�n th��ng tu�n n�y r�i, n�n kh�ng th� nh�n th��ng ���c n�a !!!")
		return 0		
	end
	if MeridianGetLevel() <= 0 then
		Talk(1,"","B�n ch�a k�ch ho�t kinh m�ch n�n kh�ng th� nh�n th��ng !!!")
		return 0
	end
	local nNumUse = mod(GetTask(TSK_VLBH_QI), 100)
	if nNumUse <tbCheck[nType][1] then
		Talk(1,"","B�n ch�a s� d�ng �� s� l��ng ch�a kh�a v�ng n�n kh�ng th� nh�n th��ng !!!")
		return 0
	end

	if GetItemCount(2,1,30230) < tbCheck[nType][2] then
		Talk(1,"","B�n kh�ng mang theo �� "..tbCheck[nType][2].." xu v�t ph�m �� nh�n th��ng !!!")
		return 0
	end		
	SetTask(TSK_VLBH_QI, GetTask(TSK_VLBH_QI) + 100)
	if DelItem(2,1,30230,tbCheck[nType][2]) == 1 then
		AwardGenuineQi(tbCheck[nType][3])
	end
	gf_WriteLogEx("Vo Lam Bao Hap", "nh�n  th�nh c�ng", 1, "Ph�n th��ng ch�n kh� 20/7")
	WriteLogEx("LOG XU VAT PHAM","S� d�ng CKV, ti�u hao 99 xu nh�n 2k5 ch�n kh�")
end

function get_tinhnhan()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th�ng tin chi ti�t c�c ho�t ��ng ��ng ��o c� th� xem tr�n trang ch� <color=green>http://volam2.zing.vn<color>."
	--tbSayDialog, szSayHead = get_tbJNDialog_info(VET_XA_ACTIVITY_TABLE)
   	tinsert(tbSayDialog,"��i 1 Socola t�nh nh�n (5 H�t cacao + 2 Xu v�t ph�m)/VNG_DoiEventThang2_Form1")
   	tinsert(tbSayDialog,"��i 1 Socola t�nh nh�n (5 H�t cacao + 1 S�a tinh luy�n)/VNG_DoiEventThang2_Form2")
   	tinsert(tbSayDialog,"Ki�m tra s� l��ng Socola �� s� d�ng/ncheck_number_use"	)
   	tinsert(tbSayDialog,"Nh�n ph�n th��ng cu�i s� d�ng Socola/get_final_socola"	)
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/do_nothing"	)
	nSaySize = getn(tbSayDialog);	
	Say(szSayHead, nSaySize, tbSayDialog);
end
function get_final_socola()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th�ng tin chi ti�t c�c ho�t ��ng ��ng ��o c� th� xem tr�n trang ch� <color=green>http://volam2.zing.vn<color>."	
	tinsert(tbSayDialog,"Nh�n th��ng 2 thi�n m�n kim l�nh/#confirm_get_final_socola(1)")
   	tinsert(tbSayDialog,"Nh�n th��ng 300 tri�u �i�m kinh nghi�m/#confirm_get_final_socola(2)")
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/do_nothing"	)
	nSaySize = getn(tbSayDialog);	
	Say(szSayHead, nSaySize, tbSayDialog);
end
function confirm_get_final_socola(nType)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	if gf_Judge_Room_Weight(2, 50," ") ~= 1 then
        	return
    end
    if GetTask(2763) == 1 then
    		Talk(1, "", "��i hi�p �� nh�n ph�n th��ng cu�i r�i!!!")
    		return
    end   
    if GetTask(2764) < 1402 then
    		Talk(1, "", "��i hi�p ch�a s� d�ng �� 1402 v�t ph�m Valentine!!!")
    		return
    end
    SetTask(2763,1)
    if nType == 1 then
    		gf_AddItemEx2({2,1,30370,2}, "Thi�n M�n Kim L�nh", "VALENTINE 2013", "Ph�n th��ng cu�i Socola Thi�n M�n Kim L�nh", 0, 1);
    	else
    		ModifyExp(300000000)
    		gf_WriteLogEx("VALENTINE 2013", "nh�n  th�nh c�ng", 1, "Ph�n th��ng cu�i Socola exp")
    	end
    
end
function VNG_DoiEventThang2_Form1()
	AskClientForNumber("VNG_DoiEventThang2_Socola1", 1, 999, "S� l��ng (1-999)")
end
function VNG_DoiEventThang2_Socola1(nCount)
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0;
	end
	if GetItemCount(2,1,30357) < (5 * nCount ) or GetItemCount(2,1,30230) < (2 * nCount)  then
		Talk(1, "", "B�n kh�ng �� �i�u ki�n ��i.");
		return 0;
	end
	if DelItem(2,1,30357, 5 * nCount) == 1 and DelItem(2,1,30230, 2 * nCount) == 1 then
		gf_AddItemEx2({2, 1, 30495, nCount}, "Socola", "VALENTINE 2013" , "nh�n")
	end
end
function VNG_DoiEventThang2_Form2()
	AskClientForNumber("VNG_DoiEventThang2_Socola2", 1, 20, "S� l��ng (1-20)")
end
function VNG_DoiEventThang2_Socola2(nCount)
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0;
	end
	if GetItemCount(2,1,30357) < (5 * nCount ) or GetItemCount(2,1,30477) < (1 * nCount)  then
		Talk(1, "", "B�n kh�ng �� �i�u ki�n ��i.");
		return 0;
	end
	if DelItem(2,1,30357, 5 * nCount) == 1 and DelItem(2,1,30477, 1 * nCount) == 1 then
		gf_AddItemEx2({2, 1, 30495, nCount}, "Socola", "VALENTINE 2013" , "nh�n")
	end
end
function ncheck_number_use()
	local nUse = GetTask(2764)
	Talk(1, "", "S� l�n s� d�ng Socola hi�n t�i l� : "..nUse.."/10000");
end


function VLBH_HotroConLon()
	local tbSay = {}
	tinsert(tbSay,"Nh�n 900 V� L�m B�o H�p (ti�u hao 21 xu v�t ph�m)/#HoTroVLBH(1)")
	tinsert(tbSay,"Nh�n 900 V� L�m B�o H�p (ti�u hao 66 v�ng)/#HoTroVLBH(2)")
	tinsert(tbSay,"Ta ch�a mu�n nh�n b�y gi�/gf_DoNothing")
	Say("Ch� c�n t�n �t th� lao, c�c h� s� nh�n ���c nhi�u h� tr�...", getn(tbSay), tbSay)
end


function do_nothing()
	
end