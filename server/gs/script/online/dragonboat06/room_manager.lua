--File name:room_manager_CD.lua
--Describe:龙舟赛报名处NPC脚本
--Create Date:2006-4-18
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
Include("\\script\\online\\dragonboat06\\room.lua");

function main()
	--do return end
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(ATTENDCOUNTPERDAY2) < nDate then
		SetTask(ATTENDCOUNTPERDAY1,0);
		SetTask(ATTENDCOUNTPERDAY3,0);
	end;
	SetTask(STATUS,0);	--设置玩家的身份
	SetTask(POSITION,0);
	SetTask(RANK,MAXPLAYER);	--最后一名
	SetTask(FINISHTIME,0);
	SetTask(FLAG_COLOR,0);
	SetTask(ENTERORDER,0);	--上面的操作都是为了使状态出错的玩家可以正常进行游戏
	local nGenre,nDetail,nParticular = GetPlayerEquipInfo(10);
	local bOnBoat = 0;
	if nGenre == 0 and nDetail ==105 then
		for i=25,31 do
			if nParticular == i then
				bOnBoat = 1;
				break;
			end;
		end;
	end;
	if bOnBoat == 1 then
		UnEquipAtPosition(10);
	end;
	local selTab = {
			"Ta mu鑞 tham gia thi u/selectroom",
			"Ta mu鑞 ng thuy襫 R錸g/wantboat",
			"Thi u n猲 bi誸/knowdetail",
--			"我要领取粽子和江湖心得/wantzongzi",
			"Ta mu鑞 l穘h ch� nam thi thuy襫 R錸g/wantzhinan",
--			"我要用积分换奖励/seebonus",
			"K誸 th骳 i tho筰/nothing",
			};
	if Get_DragonBoatDay_State() == 0 then
		Talk(1,"","T誸 an Ng�  n. Ch骳 m鋓 ngi m閠 c竔 T誸 vui v�.");
		return 0;
	end;
	if Get_DragonBoatDay_State() == 1 then
		Talk(1,"","Ho箃 ng t誸 an Ng�  k誸 th骳. B筺 ╪ t誸 vui v� ch�?");
		return 0;
	end;
	local sContent = "T誸 an Ng�  n, m鋓 ngi h穣 tham gia thi u thuy襫 R錸g!";
	if Get_DragonBoatDay_State() == 2 then
		for i=1,5 do
			tremove(selTab,1);
		end;
		sContent = "Х k誸 th骳 thi u thuy襫 R錸g, m阨 b筺 l穘h ph莕 thng trc <color=yellow>6/7<color>.";
	end;
	if nDate <= 071021 then
		tinsert(selTab,7,"Ta mu鑞 nh薾 b錳 thng/get_compensation");
	end;
	Say(sContent,getn(selTab),selTab);
end;

function get_compensation()
	if GetCreateTime() > 1192032000 then	--MkTime和GmTime这两个指令不是对称的，晕
		Talk(1,"","Ch� nh鱪g nh﹏ v藅 ng k� trc <color=yellow>ng祔 11 th竛g 10 n╩ 2007<color> m韎 頲 nh薾 b錳 thng.");
		return 0;
	end;
	if GetPlayerRoute() == 0 then
		Talk(1,"","Ngi kh玭g nh藀 m玭 ph竔 kh玭g 頲 nh薾 b錳 thng 畊a thuy襫. ");
		return 0;
	end;
	if GetLevel() <= 10 then
		Talk(1,"","Ъng c蕄 c馻 b筺 qu� th蕄, ph秈 t c蕄 <color=yellow>10<color> tr� l猲 (kh玭g bao g錷 c蕄 10) m韎 c� th� nh薾 b錳 thng.");
		return 0;
	end;
	if GetTask(1898) ~= 0 then
		Talk(1,"","Ngi  l躰h ph莕 b錳 thng r錳! M鏸 ngi ch� 頲 l穘h b錳 thng 1 l莕 th玦!");
		return 0;
	end;
	if GetTask(BONUSPOINT) < 10 then
		Talk(1,"","觤 t輈h l騳 畊a thuy襫 r錸g c馻 ngi 輙 qu�! Mu鑞 l穘h ph秈 c� t� <color=yellow>10 甶觤 tr� l猲<color>!");
		return 0;
	end;
	if GetFreeItemRoom() <= 3 or GetMaxItemWeight()-GetCurItemWeight() <= 60 then
		Talk(1,"main","Xin ki觤 tra kho秐g tr鑞g h祅h trang v� s鴆 l鵦!");
		return 0;
	end;
	AddItem(2,1,967,30);
	Msg2Player("B筺 nh薾 頲 30 T﹎ c giang h�");
	AddItem(2,1,394,20);
	Msg2Player("B筺 nh薾 頲 20 B竛h 輙 g筼 n誴");
	SetTask(1898,1);
end;

function selectroom()
	local nHour = tonumber(date("%H"));
	if nHour < 19 or nHour > 22 and nHour ~= 12 and nHour ~= 13 then
		Talk(1,"main","Khu v鵦 thi u 產ng chu萵 b�, t� <color=yellow>12h n 14h<color> v� <color=yellow>19h n 23h<color> s� m�. Nh� n tham gia nh�!");
		return 0;
	end;
	local MapID = GetWorldPos();
	local RoomIndex = 0;
	if MapID == 100 then
		RoomIndex = 0;
	elseif MapID == 200 then
		RoomIndex = g_TotalRoomNum;
	elseif MapID == 300 then
		RoomIndex = g_TotalRoomNum*2;
	else
		Write_Log("Ho箃 ng t誸 an Ng� sai s鉻","Khi nh蕁 v祇 NPC b竜 danh, s� ID b秐  nh薾 頲 sai, t猲 nh﹏ v藅:"..GetName());
	end;
	if GetPlayerRoute() == 0 then
		Talk(1,"main","Xin l鏸! Ngi v� m玭 v� ph竔 kh玭g 頲 tham gia thi u thuy襫 R錸g.");
		return 0;
	end;
	local RoomTab = Init_Room();
	local selTab = {};
	local statTab = {
				"ng ti課 h祅h thi u, kh玭g th� v祇 trong!",
				"ng trong giai 畂筺 b竜 danh, kh玭g th� v祇 trong",
				"C� th� v祇 trong"
				}
	local nIndex = 1;
	local nNeedRoom = 0;
	local nIdelRoomCount,nReadyRoomCount,nMatchingRoomCount = Get_Room_Count_Info();

	if nIdelRoomCount == g_TotalRoomNum then
		for i=1,2 do
			selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[3]..")/#joinconfirm("..i..")";
			nIndex = nIndex + 1;	
		end;
	elseif nReadyRoomCount >= 1 then
		for i=1,g_TotalRoomNum do
			if RoomTab[i]:GetRoomState() >= MS_STATE_WAITSIGNUP then
				local state = RoomTab[i]:GetRoomState();
				if state == MS_STATE_WAITSIGNUP then
					selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[2].." S� ngi hi謓 c�:"..RoomTab[i]:GetPlayerNum()..")/#joinconfirm("..i..")";
				else
					selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[1].." S� ngi hi謓 c�:"..RoomTab[i]:GetPlayerNum()..")/#joinconfirm("..i..")";			
				end;
				nIndex = nIndex + 1;
			end;	
		end;
	elseif nMatchingRoomCount ~= 0 and nMatchingRoomCount == g_TotalRoomNum - nIdelRoomCount then
		local bDisplayIdelRoom = 0;
		for i=1,g_TotalRoomNum do
			if bDisplayIdelRoom ~= 1 then
				if RoomTab[i]:GetRoomState() == MS_STATE_IDLE then
					bDisplayIdelRoom = 1;
					selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[3]..")/#joinconfirm("..i..")";
					nIndex = nIndex + 1;	
				end;
			end;
			if RoomTab[i]:GetRoomState() >= MS_STATE_WAITSTART then
				selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[1].." S� ngi hi謓 c�:"..RoomTab[i]:GetPlayerNum()..")/#joinconfirm("..i..")";			
				nIndex = nIndex + 1;	
			end;
		end;	
	end;
	selTab[getn(selTab)+1] = "Quay l筰 i tho筰 ch輓h./main";
	selTab[getn(selTab)+1] = "R阨 kh醝/nothing";
	Say("B筺 mu鑞 v祇 trng u n祇?",getn(selTab),selTab);
end;

function joinconfirm(RoomID)
	if GetPlayerRoute() == 20 then --五毒邪侠
		local selTab = {
				"ng v藋!/#join("..RoomID..")",
				"в ta suy ngh� l筰/main",
				}
		Say("B筺 mu鑞 v祇 thi u?",getn(selTab),selTab)
	else
		join(RoomID);
	end;
end;

function join(RoomID)
	if RoomID < 1 or RoomID > g_TotalRoomNum then
		Msg2Player("L鏸 m� s� ph遪g, xin th� l筰");
		return 0;
	end;
	if checkboat() == 0 then
		Talk(1,"","Xin l鏸! Mu鑞 tham gia thi u b筺 ph秈 c� m閠 chi誧 thuy襫 R錸g.");
		return 0;		
	end;
	if checkequipment() == 0 then
		Talk(1,"","в c玭g b籲g, trc khi v祇 trng u xin b筺 h穣 b� <color=yellow>c竎 trang b� tr� ngo筰 trang<color> ra  tr竛h t鎛 th蕋 ngo礽 � mu鑞. Xin x竎 nh薾 <color=yellow>h祅h trang c遪 ch� tr鑞g<color>.");
		return 0;
	end;
	local MapID = GetWorldPos();
	local RoomIndex = 0;
	if MapID == 100 then
		RoomIndex = 0;
	elseif MapID == 200 then
		RoomIndex = g_TotalRoomNum;
	elseif MapID == 300 then
		RoomIndex = g_TotalRoomNum*2;
	else
		Write_Log("Ho箃 ng t誸 an Ng� sai s鉻","Khi nh蕁 v祇 NPC b竜 danh, s� ID b秐  nh薾 頲 sai, t猲 nh﹏ v藅:"..GetName());
	end;
	local RoomTab = Init_Room();
	if RoomTab[RoomID]:GetRoomState() <= MS_STATE_WAITSIGNUP then
		RoomTab[RoomID]:AddPlayer();
		WriteLog("[Ho箃 ng t誸 an Ng鋆\t"..GetAccount().."\t"..GetName().."\t tham gia 畊a thuy襫 R錸g.")
	else
		Talk(1,"selectroom","Xin l鏸! Л阯g 畊a b筺 ch鋘 <color=yellow>"..RoomName[RoomID+RoomIndex].."<color> chu萵 b� b総 u thi u ho芻 產ng thi u kh玭g th� v祇 頲.");
	end;
end;

function seebonus()
	local selTab = {
			"Ta mu鑞 d飊g 甶觤 i thng/wantaward",
			"Thuy誸 minh i thng/knowaward",
			"Quay l筰 i tho筰 ch輓h./main",
			"K誸 th骳 i tho筰/nothing",
			}
	Say("<enter>S� l莕 tham gia thi u c馻 b筺 l�:<color=yellow>"..GetTask(ATTENDCOUNT).."<color><enter>觤 t輈h l騳 c馻 b筺:<color=yellow>"..GetTask(BONUSPOINT).."<color>",getn(selTab),selTab);
end;

function wantaward()
	local selTab = {
			"фi 1 甶觤 t輈h l騳 l蕐 b竛h 輙 th辴 quay/#askfornum(1)",	--无限领
			"фi 1 甶觤 t輈h l騳 l蕐 1 甶觤 danh v鋘g/#askfornum(2)",	--最多换１０００点
			"D飊g 5 甶觤 t輈h l騳 i b竛h 輙 x� x輚/#askfornum(3)",--每天最多３次
			"D飊g 8 甶觤 t輈h l騳 i b竛h 輙 th藀 c萴/#askfornum(4)",--无限
			"D飊g 8 甶觤 t輈h l騳 i b竛h nh﹏ m鴗/#askfornum(5)",--无限
			--"用15积分换取试炼果子/#askfornum(6)",--每天最多3次,注释原因：IB没有试练果
			"Xem trang sau/wantaward1",
			"Quay l筰 i tho筰 ch輓h./main",
			"K誸 th骳 i tho筰/nothing",
			}
	Say("觤 t輈h l騳 thi u thuy襫 R錸g c馻 b筺 l� <color=yellow>"..GetTask(BONUSPOINT).."<color> 甶觤, b筺 mu鑞 i ph莕 thng n祇?",getn(selTab),selTab);
end;

function wantaward1()
	local selTab = {
			"фi 50 甶觤 t輈h l騳 l蕐 b竛h 輙 Gia H璶g/#askfornum(7)",--每天最多3次
			"D飊g 100 甶觤 t輈h l騳 i t骾 b竛h/#askfornum(8)",--每天最多一次
			"фi 500 甶觤 t輈h l騳 l蕐 bao l� x� b竛h 輙/#askfornum(9)",--最多5次，每天最多3次
			"D飊g 1000 甶觤 t輈h l騳 i th� th� ch� t筼 v� kh�/#askfornum(10)",--最多2次，每天最多1次
			"эng 1500 甶觤 t輈h l騳 i H鑤 L玦 B竎/#askfornum(11)",--最多2次，每天最多1次
			"фi 2000 甶觤 t輈h l騳 l蕐 Khu蕋 Nguy猲 Ng鋍 B閕/#askfornum(12)",--最多1次
			"Xem trang trc/wantaward",
			--"查看下一页/wantaward2",
			"Quay l筰 i tho筰 ch輓h./main",
			"K誸 th骳 i tho筰/nothing",
			}
	Say("觤 t輈h l騳 thi u thuy襫 R錸g c馻 b筺 l� <color=yellow>"..GetTask(BONUSPOINT).."<color> 甶觤, b筺 mu鑞 i ph莕 thng n祇?",getn(selTab),selTab);
end;

function askfornum(nType)
	local selTab = {
				"1 nh鉳/#giveaward("..nType..",1)",
				"2 nh鉳/#giveaward("..nType..",2)",
				"5 nh鉳/#giveaward("..nType..",5)",
				"10 nh鉳/#giveaward("..nType..",10)",
				"20 nh鉳/#giveaward("..nType..",20)",
				" 50 nh鉳/#giveaward("..nType..",50)",
				"100 nh鉳/#giveaward("..nType..",100)",
				"Ta suy ngh� l筰!/wantaward",
				"K誸 th骳 i tho筰/nothing",
				};
	if nType > 6 then
		for i=1,6 do 
			tremove(selTab,2)
		end;
	end;
	Say("B筺 mu鑞 i bao nhi猽 nh鉳 gi秈 thng?",getn(selTab),selTab);
end;

function giveaward(nType,nNum)
	local DecBonusTab = {1,1,5,8,8,15,50,100,500,1000,1500,2000};
	local nRetCode = 0;		
	if GetTask(BONUSPOINT) < DecBonusTab[nType]*nNum then
		Talk(1,"wantaward","Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g , kh玭g th� фi ph莕 thng!");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if nType == 1 then
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		nRetCode = AddItem(2,1,388,nNum);
		if nRetCode == 1 then
			Msg2Player("B筺 nh薾 頲 b竛h 輙 th辴 quay");
		end;
	elseif nType == 2 then
		if GetTask(AWARD_REPUTATION)+nNum > 1000 then
			Talk(1,"wantaward","Xin l鏸! Hi謓 gi� b筺 ch� c� th� i t鑙 產 <color=yellow>"..(1000-GetTask(AWARD_REPUTATION)).." 甶觤<color> danh v鋘g.")
			return 0;
		end;
		ModifyReputation(nNum,0);
		Msg2Player("B筺 nh薾 頲 "..nNum.." 甶觤 danh v鋘g");
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_REPUTATION,GetTask(AWARD_REPUTATION)+nNum);
	elseif nType == 3 then
		if GetTask(AWARD_CSZZ2) < nDate then
			SetTask(AWARD_CSZZ1,0);
		end;
		if GetTask(AWARD_CSZZ1) >= 3 then
			Talk(1,"wantaward","Xin l鏸! H玬 nay b筺 kh玭g th� i ph莕 thng, ng祔 mai h穣 quay l筰.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_CSZZ1,GetTask(AWARD_CSZZ1)+1);
		SetTask(AWARD_CSZZ2,nDate);
		nRetCode = AddItem(2,1,965,nNum)
		if nRetCode == 1 then
			Msg2Player("B筺 nh薾 頲 "..nNum.." B竛h 輙 x� x輚");
		end;
	elseif nType == 4 then
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		nRetCode = AddItem(2,1,391,nNum)
		if nRetCode == 1 then
			Msg2Player("B筺 nh薾 頲 "..nNum.." b竛h 輙 th藀 c萴");
		end;
	elseif nType == 5 then
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		nRetCode = AddItem(2,1,389,nNum)
		if nRetCode == 1 then
			Msg2Player("B筺 nh薾 頲 "..nNum.." B竛h nh﹏ m鴗");
		end;
	elseif nType == 6 then
--		if GetTask(AWARD_SLGZ2) < nDate then
--			SetTask(AWARD_SLGZ1,0);
--		end;
--		if GetTask(AWARD_SLGZ1) >= 3 then
--			Talk(1,"wantaward","<color=green>赛龙舟使者：<color>不好意思，今天你不能再换取这个奖励了，你可以明天再换。");
--			return 0;
--		end;
--		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
--		SetTask(AWARD_SLGZ1,GetTask(AWARD_SLGZ1)+1);
--		SetTask(AWARD_SLGZ2,nDate);
--		nRetCode = AddItem(2,0,392,nNum)
--		if nRetCode == 1 then
--			Msg2Player("您得到"..nNum.."个试炼果子");
--			Write_Log("龙舟积分换奖励",GetName().."得到试炼果子")
--		else
--			Write_Log("龙舟积分换奖励错误",GetName().."AddItem(2,0,392,nNum)时返回值为:"..nRetCode)
--		end;	
	elseif nType == 7 then
		if GetTask(AWARD_JXZZ2) < nDate then
			SetTask(AWARD_JXZZ1,0);
		end;
		if GetTask(AWARD_JXZZ1) >= 3 then
			Talk(1,"wantaward","Xin l鏸! H玬 nay b筺 kh玭g th� i ph莕 thng, ng祔 mai h穣 quay l筰.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_JXZZ1,GetTask(AWARD_JXZZ1)+1);
		SetTask(AWARD_JXZZ2,nDate);
		nRetCode = AddItem(2,1,392,nNum)
		if nRetCode == 1 then
			Msg2Player("B筺 nh薾 頲 "..nNum.." b竛h 輙 Gia H璶g");
			Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng",GetName().."Nh薾 頲 b竛h 輙 Gia H璶g")
		else
			Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng c� sai s鉻",GetName().."AddItem(2,1,392,nNum) tr� quay l筰:"..nRetCode)
		end;	
	elseif nType == 8 then			--粽子礼包
		if GetTask(AWARD_ZZLB) < nDate then
			SetTask(AWARD_ZZLB,0);
		end;
		if GetTask(AWARD_ZZLB) ~= 0 then
			Talk(1,"wantaward","Xin l鏸! H玬 nay b筺 kh玭g th� i ph莕 thng, ng祔 mai h穣 quay l筰.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_ZZLB,nDate);
		nRetCode = AddItem(2,1,966,nNum)
		if nRetCode == 1 then
			Msg2Player("B筺 nh薾 頲 "..nNum.." t骾 b竛h");
		end;
	elseif nType == 9 then	--粽子大礼包
		if GetTask(AWARD_ZZDLB3) < nDate then
			SetTask(AWARD_ZZDLB2,0);
		end;
		if GetTask(AWARD_ZZDLB1) >= 5 then
			Talk(1,"wantaward","Xin l鏸! B筺 kh玭g th� i ph莕 thng n祔, xin ch鋘 m鉵 kh竎.");
			return 0;
		end;
		if GetTask(AWARD_ZZDLB2) >= 3 then
			Talk(1,"wantaward","Xin l鏸! H玬 nay b筺 kh玭g th� i ph莕 thng, ng祔 mai h穣 quay l筰.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_ZZDLB1,GetTask(AWARD_ZZDLB1)+1);
		SetTask(AWARD_ZZDLB2,GetTask(AWARD_ZZDLB2)+1);
		SetTask(AWARD_ZZDLB3,nDate);
		nRetCode = AddItem(2,1,393,nNum)
		if nRetCode == 1 then
			Msg2Player("B筺 nh薾 頲 "..nNum.." t骾 b竛h l韓");
			Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng",GetName().."Nh薾 頲 bao l� x� b竛h 輙");
		else
			Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng c� sai s鉻",GetName().."AddItem(2,1,393,nNum) tr� quay l筰:"..nRetCode)
		end;	
	elseif nType == 10 then
		if GetTask(AWARD_DJSWQZZSC3) < nDate then
			SetTask(AWARD_DJSWQZZSC3,0);
		end;
		if GetTask(AWARD_DJSWQZZSC3) == 0 then
			SetTask(AWARD_DJSWQZZSC2,0);
		end;
		if GetTask(AWARD_DJSWQZZSC1) >= 2 then
			Talk(1,"wantaward","Xin l鏸! B筺 kh玭g th� i ph莕 thng n祔, xin ch鋘 m鉵 kh竎.");
			return 0;
		end;
		if GetTask(AWARD_DJSWQZZSC2) >= 1 then
			Talk(1,"wantaward","Xin l鏸! H玬 nay b筺 kh玭g th� i ph莕 thng, ng祔 mai h穣 quay l筰.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_DJSWQZZSC1,GetTask(AWARD_DJSWQZZSC1)+1);
		SetTask(AWARD_DJSWQZZSC2,GetTask(AWARD_DJSWQZZSC2)+1);
		SetTask(AWARD_DJSWQZZSC3,nDate);
		nRetCode = AddItem(2,0,397,nNum)
		if nRetCode == 1 then
			Msg2Player("B筺 nh薾 頲 s� tay c馻 b薱 th莥 ch� v� kh�");
			Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng",GetName().."B筺 nh薾 頲 s� tay c馻 b薱 th莥 ch� v� kh�");
		else
			Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng c� sai s鉻",GetName().."AddItem(2,0,397,nNum) tr� quay l筰:"..nRetCode)
		end;	
	elseif nType == 11 then
		if GetTask(AWARD_HLB3) < nDate then
			SetTask(AWARD_HLB2,0);
		end;
		if GetTask(AWARD_HLB1) >= 1 then
			Talk(1,"wantaward","Xin l鏸! B筺 kh玭g th� i ph莕 thng n祔, xin ch鋘 m鉵 kh竎.");
			return 0;
		end;
		if GetTask(AWARD_HLB2) >= 1 then
			Talk(1,"wantaward","Xin l鏸! H玬 nay b筺 kh玭g th� i ph莕 thng, ng祔 mai h穣 quay l筰.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_HLB1,GetTask(AWARD_HLB1)+1);
		SetTask(AWARD_HLB2,GetTask(AWARD_HLB2)+1);
		SetTask(AWARD_HLB3,nDate);
		nRetCode = AddItem(0,105,12,nNum,1,-1,-1,-1,-1,-1,-1)
		if nRetCode == 1 then
			Msg2Player("B筺 nh薾 頲 H鑤 L玦 B竎");
			Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng",GetName().."Nh薾 頲 H鑤 L玦 B竎");
		else
			Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng c� sai s鉻",GetName().."AddItem(0,105,12,nNum) tr� quay l筰:"..nRetCode)
		end;
	elseif nType == 12 then
		if GetTask(AWARD_QYZP) == 1 then
			Talk(1,"wantaward","B筺  i qua ph莕 thng n祔, kh玭g th� i n鱝. H穣 ch鋘 ph莕 thng kh竎.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_QYZP,1);
		nRetCode = AddItem(0,102,27,nNum,1,-1,-1,-1,-1,-1,-1);
		if nRetCode == 1 then
			Msg2Player("B筺 nh薾 頲 Khu蕋 Nguy猲 Ng鋍 B閕");
			Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng",GetName().."Nh薾 頲 Khu蕋 Nguy猲 Ng鋍 B閕");
		else
			Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng c� sai s鉻",GetName().."AddItem(0,102,27,nNum) tr� quay l筰:"..nRetCode)
		end;
	else
		Write_Log("фi ph莕 thng t誸 an Ng� c� sai s鉻","Lo筰 h譶h gi秈 thng c� sai s鉻, tr� s� lo筰 h譶h l�:"..nType);
	end;
	wantaward();
end;

function knowaward()
	local selTab = {
			"s� l莕 gi韎 h筺 фi ph莕 thng /seerestriction1",
			"Quay l筰 i tho筰 tr猲/seebonus",
			"K誸 th骳 i tho筰/nothing",
			}
	Say("B筺 c� th� tham gia thi u thuy襫 R錸g  nh薾 甶觤 t輈h l騳, sau  b筺 c� th� l蕐 甶觤 thng i ph莕 thng. Ch� �! C� m閠 s� ph莕 thng kh玭g c� h筺 ch� s� l莕 i v� ngc l筰, c騨g c� m閠 s� ph莕 thng ch� cho i t鎛g c閚g v礽 l莕, chi ti誸 xin tham kh秓 <color=yellow>s� l莕 h筺 ch� i ph莕 thng<color>.",getn(selTab),selTab);
end;

function seerestriction1()
	Talk(1,"seerestriction2","B竛h 輙 nh﹏ th辴: kh玭g h筺 ch� s� l莕 i<enter>Danh v鋘g: t鑙 產 c� th� i <color=yellow>1000 甶觤<color><enter>B竛h 輙 x� x輚: m鏸 ng祔 頲 i t鑙 產 <color=yellow>3 l莕<color><enter>B竛h 輙 Th藀 c萴: kh玭g h筺 ch� s� l莕 i<enter>B竛h 輙 nh﹏ m鴗: kh玭g h筺 ch� s� l莕 i<enter>B竛h 輙 Gia H璶g: m鏸 ng祔 i t玦 產 <color=yellow>3 l莕<color>");
end;

function seerestriction2()
	Talk(1,"seebonus","L� bao b竛h 輙: m鏸 ng祔 i t鑙 產 <color=yellow>1 l莕<color><enter>Чi L� bao b竛h 輙: t鑙 產 i 頲 <color=yellow>5 l莕<color>, m鏸 ng祔 i t鑙 產 <color=yellow>3 l莕<color><enter>S� tay ch� t竎 v� kh� Чi Tng s�: t鑙 產 i 頲 <color=yellow>2 l莕<color>, m鏸 ng祔 i t鑙 產 <color=yellow>1 l莕<color><enter>H鑤 L玦 B竎: t鑙 產 i 頲 <color=yellow>1 l莕<color><enter>Khu蕋 Nguy猲 B閕: t鑙 產 ch� i 頲 <color=yellow>1 l莕<color>");
end;

function knowdetail()
	Talk(1,"knowdetail1","M飊g 5 th竛g 5  l辌h l� T誸 an Ng� truy襫 th鑞g. Th� gi韎 trong VLTK 2 c騨g s� y m祏 s綾 nh� t誸 an Ng�. Л琻g nhi猲 s� kh玭g th� thi誹 l� h閕 畊a thuy襫 R錸g v� ╪ b竛h 輙.");
end;

function knowdetail1()
	Talk(1,"knowdetail2","Th阨 gian ho箃 ng: <enter>T� <color=yellow>30 th竛g: m鏸 ng祔 c� hai tr薾 t� 13h-15h v� 19h-23h<color><enter>Y猽 c莡: kh玭g ph秈 l� ngi ch琲 t猲 ch� tr緉g");
end;
function knowdetail2()
	Talk(1,"knowdetail3","<color=green>Ho箃 ng 1: B竛h 輙<color>:<enter>M鏸 ng祔 ho祅 th祅h <color=yellow>3 tr薾<color> thi u thuy襫 R錸g c� th� n g苝 Long Chu s� gi� nh薾 b竛h 輙 n誴, s� d鬾g c� th� nh薾 頲 甶觤 kinh nghi謒 v� 5 甶觤 danh v鋘g. Ngo礽 ra c遪 c� th� nh薾 頲 s� b竛h 輙 tr鴑g mu鑙 b籲g v韎 s� tr薾 tham gia, s� d鬾g b竛h 輙 tr鴑g  mu鑙 s� nh薾 頲 ph莕 thng ho芻 hi謚 qu� ng蓇 nhi猲");
end;
function knowdetail3()
	Talk(1,"knowdetail4","Ho箃 ng th� 2-a thuy襫 R錸g: <enter>Thu th藀  nguy猲 li謚 t譵 Long Chu s� gi� ch鋘 ch� t筼 thuy襫 R錸g. Long Chu s� gi� s� l祄 cho b筺 m閠 chi誧 thuy襫 R錸g. T� l� l祄 ra thuy襫 R錸g ph� th玭g l� r蕋 cao. Trc ti猲 ch鋘 tham gia thi u sau  ch鋘 trng u b筺 mu鑞 v祇. 4 ph髏 30 gi﹜ sau khi ngi u ti猲 v祇 trng u ho芻 s� ngi b竜 danh  8 ngi s� ch輓h th鴆 thi u. Khi ngi ch琲 b竜 danh y猽 c莡 kh玭g mang v� kh� trang b�, n鉵, 竚 kh�, 竜, qu莕, nh蒼, m藅 t辌h nh璶g c� th� trang b� ngo筰 trang ng th阨 nh蕋 nh ph秈 c� 1 chi誧 thuy襫 R錸g trong h祅h trang.");
end;
function knowdetail4()
	Talk(1,"knowdetail5","Sau khi v祇 trng u, b筺 s� v祇 khu v鵦 xu蕋 ph竧 m芻 nh  ch� xu蕋 ph竧. Sau khi cu閏 thi chu萵 b� b総 u s� c� 30 gi﹜  chu萵 b�. Trong th阨 gian chu萵 b�, tuy觧 th� trang b� thuy襫 R錸g  h誸 th阨 gian chu萵 b� s� xu蕋 ph竧. Trong qu� tr譶h thi u tuy觧 th� kh玭g th� trang b� b蕋 c� trang b� v� kh玭g th� i thuy襫 R錸g kh竎 ho芻 b� thuy襫 R錸g. Sau khi v� ch tuy觧 th� s� tr� l筰 tr筺g th竔 b譶h thng.");
end;
function knowdetail5()
	Talk(1,"knowdetail6","Trong qu� tr譶h thi u, tuy觧 th� c� th� s� d鬾g k� n╪g m� thuy襫 R錸g c�. Trong khu v鵦 thi u c� c竎 c鎛g nh� 頲 t筼 th祅h b雐 c竎 c﹜ c� nhi襲 m祏 s綾, n誹 l莕 lt vt qua 2 c鎛g nh� th� c� th� nh薾 頲 hi謚 qu� c nh. Xin ch� �: K� m玭 m祏 Xanh, п, V祅g l� hi謚 qu� ch輓h di謓. C遪 c� m祏 Cam v� m祏 T輒 n誹 vt qua s� b蕋 l頸 cho b秐 th﹏. Trong khu v鵦 thi u s� xu蕋 hi謓 ng蓇 nhi猲 1 lo筰 b秓 rng, khi m� b秓 rng s� nh薾 頲 hi謚 qu� ng蓇 nhi猲. Thi u thuy襫 R錸g c╪ c� v祇 th� t� c竎 tuy觧 th� v� ch l祄 k誸 qu�.");
end;
function knowdetail6()
	Talk(1,"main","Quy t綾 thi u nh� sau theo s� ngi nh� sau, s� 甶觤 頲 thng theo th� t� t� cao n th蕄. <enter>S� ngi thi u l� 2: 1, 0. <enter>S� ngi thi u l� 3: 2, 1, 0. <enter>S� ngi thi u l� 4: 2, 1, 1, 0. <enter>S� ngi thi u l� 5: 3, 2, 1, 0, 0. <enter>S� ngi thi u l� 6: 3, 2, 1, 1, 0, 0. <enter>S� ngi thi u l� 7: 4, 3, 4, 1, 1, 0, 0. <enter>S� ngi thi u l� 8: 5, 4, 3, 2, 1, 1, 0, 0.");
end;

--检查身上是否装有外装之外的装备
function checkequipment()
	for i=0,11 do
		if i~= 6 and i~= 7 and i~= 8 then
			local nGenre,nDetail,nParticular = GetPlayerEquipInfo(i);
			if nGenre ~= 0 or nDetail ~= 0 or nParticular ~= 0 then
				return 0;
			end;
		end;
	end;
	return 1;
end;
--检查背包里面是否有龙舟
function checkboat()
	for i=25,31 do
		if GetItemCount(0,105,i) >= 1 then
			return 1;
		end;
	end;
	return 0;
end;

function wantboat()
	local selTab = {
			"Ch� t筼 thuy襫 R錸g/makeboat",
			"Gi韎 thi謚 thuy襫 R錸g/knowboat",
			"Quay l筰/main",
			"K誸 th骳 i tho筰/nothing"
			}
	Say("Ngi h穣 gi髉 ta thu th藀 <color=yellow>10 Chu Sa v� 10 畊玦 Th�<color>, ta s� ch� t筼 gi髉 ngi 1 chi誧 thuy襫 R錸g.",getn(selTab),selTab);
end;

function makeboat()
	if DelItem(2,2,30,10) == 1 and DelItem(2,1,2,10) == 1 then
		local nRandomNum = random(1,100);
		local nType = 0;
		if nRandomNum <= 50 then
			AddItem(0,105,25,1);
			nType = 1;
		else
			AddItem(0,105,29,1);
			nType = 5;
		end;
		Msg2Player("B筺 nh薾 頲 1 chi誧"..BoatInfo[nType][1]);
	else
		Talk(1,"","Xin l鏸! Ngi kh玭g c� th� ta c莕, ta kh玭g th� gi髉 ngi l祄 thuy襫 R錸g.");
	end;
end;

function knowboat()
	local selTab = {};
	for i=1,getn(BoatInfo) do
		selTab[i] = BoatInfo[i][1].."/#knowboatdetail("..i..")";
	end;
	selTab[getn(selTab)+1] = "Quay l筰 i tho筰 tr猲/wantboat";
	selTab[getn(selTab)+1] = "K誸 th骳 i tho筰/nothing";
	Say("Kh竎h quan mu鑞 t譵 hi觰 lo筰 thuy襫 R錸g n祇?",getn(selTab),selTab);
end;

function knowboatdetail(nType)
	local sContent = ""
	if nType > 7 or nType <= 0 then
		Write_Log("Ho箃 ng t誸 an Ng� sai s鉻","Lo筰 thuy襫 r錸g sai! T猲 nh﹏ v藅:"..GetName())
		return 0;
	end;
	sConten = "<color=yellow>"..BoatInfo[nType][1].."<color>:"..BoatInfo[nType][2];
	Talk(1,"knowboat",sConten);
end;

function wantzongzi()
	local selTab = {
				"Ta mu鑞 l穘h b竛h 輙 tr鴑g 苙/givexdzz",
				"Ta mu鑞 l穘h b竛h 輙 g筼 n誴/givenmzz",
				"Nh薾 t﹎ c giang h�/givediary",
				"Ta s� quay l筰 sau/main",
				};
	local nCount = GetTask(ATTENDCOUNTPERDAY1);
	Say("T鎛g c閚g b筺  tham gia <color=yellow>"..GetTask(ATTENDCOUNT).."<color> tr薾 thi u, nh薾 頲 <color=yellow>"..GetTask(GETXDZZCOUNT).."c竔<color> b竛h 輙 mu鑙 m苙, c遪 c� th� l穘h <color=yellow>"..(GetTask(ATTENDCOUNT)-GetTask(GETXDZZCOUNT)).."<color> c竔. H玬 nay b筺  tham gia thi u thuy襫 R錸g <color=yellow>"..nCount.."<color> l莕 u thuy襫 r錸g, ch� c莕 <color=yellow>tham gia 3 tr薾 ho芻 nhi襲 h琻<color> l� c� th� nh薾 b竛h 輙 n誴, <color=yellow>1 ng祔 ch� nh薾 頲 1 l莕<color>! M鏸 l莕 tham gia u nh薾 頲 1 quy觧 t﹎ c giang h�, t鑙 產 4 quy觧, nh薾 ch�?",getn(selTab),selTab);
end;

function givediary()
	if GetFreeItemRoom() <= 0 or GetMaxItemWeight()-GetCurItemWeight() <= 10 then
		Talk(1,"main","Xin ki觤 tra kho秐g tr鑞g h祅h trang v� s鴆 l鵦!");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(AWARD_DIARY2) < nDate then
		SetTask(AWARD_DIARY1,0);
	end;
	if GetTask(AWARD_DIARY1) >= GetTask(ATTENDCOUNTPERDAY1) then
		Talk(1,"wantzongzi","Xin l鏸! S� l莕 tham gia thi u ng祔 h玬 nay kh玭g   nh薾 t﹎ c giang h�.");
		return 0;
	end;
	if GetTask(AWARD_DIARY1) >= 4 then
		Talk(1,"wantzongzi","Xin l鏸! Ngi  nh薾 <color=yellow>4 quy觧<color> t﹎ c giang h�, ng祔 mai h穣 quay l筰!");
		return 0;
	end;
	SetTask(AWARD_DIARY1,GetTask(AWARD_DIARY1)+1);
	SetTask(AWARD_DIARY2,nDate);
	nRetCode = AddItem(2,1,967,1)
	if nRetCode == 1 then
--		Msg2Player("您得到一本江湖心得");
	end;	
end;

function givexdzz()
	if GetTask(GETXDZZCOUNT) >= GetTask(ATTENDCOUNT) then
		Talk(1,"wantzongzi","Xin l鏸! Kh竎h quan  l穘h h誸 b竛h 輙 mu鑙 m苙! Hh穣 tham gia thi u thuy襫 R錸g ti誴 r錳 quay l筰 nh�!");
		return 0;
	end;
	local nZzLeft = GetTask(ATTENDCOUNT) - GetTask(GETXDZZCOUNT);
	local selTab = {
			"Ta mu鑞 l穘h 1 b竛h 輙 mu鑙 m苙/giveonexdzz",
			"Ta mu鑞 l穘h to祅 b� ("..nZzLeft.." c竔) b竛h 輙 mu鑙 m苙/giveallxdzz",
			"L莕 sau h穣 l穘h/main",
			}
	Say("B筺 mu鑞 l穘h bao nhi猽 b竛h 輙 mu鑙 m苙?",getn(selTab),selTab);
end;

function giveonexdzz()
	if GetFreeItemRoom() <= 0 or GetMaxItemWeight()-GetCurItemWeight() <= 10 then
		Talk(1,"main","Xin ki觤 tra kho秐g tr鑞g h祅h trang v� s鴆 l鵦!");
		return 0;
	end;
	SetTask(GETXDZZCOUNT,GetTask(GETXDZZCOUNT)+1);
	if AddItem(2,1,390,1) == 1 then
		Msg2Player("B筺 nh薾 頲 1 b竛h 輙 mu鑙 m苙");
	end;
end;

function giveallxdzz()
	local nZzLeft = GetTask(ATTENDCOUNT) - GetTask(GETXDZZCOUNT);
	if GetFreeItemRoom() <= 2 or GetMaxItemWeight()-GetCurItemWeight() <= nZzLeft then
		Talk(1,"main","Xin ki觤 tra kho秐g tr鑞g h祅h trang v� s鴆 l鵦!");
		return 0;
	end;
	SetTask(GETXDZZCOUNT,GetTask(ATTENDCOUNT));
	if AddItem(2,1,390,nZzLeft) == 1 then
		Msg2Player("B筺 nh薾 頲 "..nZzLeft.." B竛h 輙 mu鑙 m苙");
	end;
end;

function givenmzz()
	if GetTask(ATTENDCOUNTPERDAY3) ~= 0 then
		Talk(1,"main","H玬 nay b筺  l穘h b竛h 輙 g筼 n誴 r錳, ng祔 mai h穣 quay l筰.");
		return 0;
	end;
	if GetFreeItemRoom() <= 0 or GetMaxItemWeight()-GetCurItemWeight() <= 10 then
		Talk(1,"main","Xin ki觤 tra kho秐g tr鑞g h祅h trang v� s鴆 l鵦!");
		return 0;
	end;
	if GetTask(ATTENDCOUNTPERDAY1) >= 3 then
		SetTask(ATTENDCOUNTPERDAY3,1);
		local nRetCode = AddItem(2,1,394,1);
		if nRetCode == 1 then
			Msg2Player("B筺 nh薾 頲 1 b竛h 輙 g筼 n誴");
			Write_Log("Nh薾 b竛h 輙 g筼 n誴",GetName().." nh薾 1 b竛h 輙 g筼 n誴");
			Talk(1,"main","b竛h 輙 g筼 n誴 m韎 ra l� y, i hi謕 h穣 nh薾 l蕐.");
		elseif nRetCode == 2 then
			Write_Log("Nh薾 b竛h 輙 g筼 n誴",GetName().."Khi nh薾 b竛h 輙 g筼 n誴, b竛h 輙 g筼 n誴 r琲 xu鑞g t, c遪 ╪ 頲 kh玭g?");
		else
			Write_Log("L鏸 nh薾 b竛h 輙 g筼 n誴",GetName().."Nh薾 b竛h 輙 g筼 n誴 th蕋 b筰");
		end;
	else
		Talk(1,"main","Xin l鏸! S� l莕 b筺 thi u thuy襫 R錸g h玬 n祔 qu� 輙, b筺 ph秈 tham gia 輙 nh蕋 <color=yellow>3 tr薾<color> m韎 c� th� nh薾 b竛h 輙 g筼 n誴.");
	end;
end;

function wantzhinan()
	if GetItemCount(2,0,396) == 0 then
		AddItem(2,0,396,1);	--龙舟赛指南
		Msg2Player("B筺 nh薾 頲 1 quy觧 hng d蒼 thi u thuy襫 R錸g");
	else
		Talk(1,"main","Kh玭g ph秈 b筺 c� quy觧 hng d蒼 thi u thuy襫 R錸g?");
	end;
end;

function Get_Room_Count_Info()
	local RoomTab = Init_Room();
	local nIdelCounter,nReadyCounte,nMatchingCounter = 0,0,0;
	for i=1,g_TotalRoomNum do
		if RoomTab[i]:GetRoomState() == MS_STATE_IDLE then
			nIdelCounter = nIdelCounter + 1;
		end;
		if RoomTab[i]:GetRoomState() == MS_STATE_WAITSIGNUP then
			nReadyCounte = nReadyCounte + 1;
		end;
		if RoomTab[i]:GetRoomState() >= MS_STATE_WAITSTART then
			nMatchingCounter = nMatchingCounter + 1;
		end;
	end;
	return nIdelCounter,nReadyCounte,nMatchingCounter;
end;
