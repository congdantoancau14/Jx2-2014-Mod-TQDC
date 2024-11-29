-- IP Bonus Created by TuanNA5

Include("\\script\\online\\viet_event\\ip_bonus\\ip_head.lua") -- IP bonus
Include("\\script\\online\\viet_event\\golden_card\\npc_golden.lua") -- event Ho�ng Kim L�nh B�i
Include("\\script\\online\\viet_event\\bet_game\\bet_npc.lua") -- D� �o�n k�t qu� thi ��u
Include("\\script\\online_activites\\ipbonus\\ipbonus.lua") -- IP Bonus 2011 (CSM)
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\vng\\chitonvuonglenh\\chitonvuonglenh.lua");
Include("\\script\\vng\\all_trangbi.lua");
Include("\\script\\equip_shop\\equip_shop_head.lua");

szNpcName = "<color=green>Ch� Ph�ng M�y: <color>"

	
function main()
	if IsIPBonus() == 1 then
		IpBonusClose()
		IpBonusStart()	
		npc_talk()
	else
		Say(szNpcName.."Ho�t ��ng �� k�t th�c!",0)
	end
end


function npc_talk()
	local nDate = tonumber(date("%Y%m%d"))
	local nDate1 =  tonumber(date("%y%m%d%H"))
	local tSay = {
			"Xem t�p h�a Kim phi�u/#show_equip_shop(3000)",
			"Xem t�p h�a Ng�n phi�u/#show_equip_shop(3033)",
			
			"Nh�n th��ng t�ch l�y online/IpBonus",
			"Nh�n th��ng Vinh Danh T��ng S�/get_solider_glory",
			"Nguy�n So�i tuy�n b� chi�m ��ng th�nh th� n�y, ta mu�n l�m nhi�m v� qu�n ��i/do_military_job",
			"Thu h�i C�m Nang ��i S� Ki�n/get_camnang",
			"Ta ch� gh� qua/nothing",
	}
	local nDay = tonumber(date("%d"))
	local nYear = tonumber(date("%Y"))
	local nWeek = tonumber(date("%w"))
	Say(szNpcName.."Ta chuy�n ph� tr�ch c�c ho�t ��ng nh�n th��ng. C�c h� c�n ta gi�p �� vi�c g�?",getn(tSay),tSay)
end


function do_military_job()
	Talk(1,"",szNpcName.."Hi�n t�i th�nh n�y ch�a c� Nguy�n So�i n�o chi�m ��ng!")
end

function get_solider_glory()
	if GetLevel() < 73 then
		Talk(1,"",szNpcName.."��ng c�p 73 tr� l�n m�i c� th� l�nh th��ng!")
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."C�c h� ch�a gia nh�p h� ph�i kh�ng th� l�nh th��ng!")
		return
	end
	if gf_JudgeRoomWeight(2,100,szNpcName) == 0 then
		return
	end
	 local tGloryAwardExp = {	
		{240000,300000,1000000,0},
		{300001,350000,1300000,0},
		{350001,400000,1600000,1},
		{400001,450000,1900000,1},
		{450001,500000,2200000,2},
		{500001,550000,2500000,2},
		{550001,800000,3000000,3},
		{800000,9000000,3500000,3}	
	}
	local nBattlePoint = abs(GetTask(701))
	local nRank = 0
	for i=1,getn(tGloryAwardExp) do
		if tGloryAwardExp[i][1] <= nBattlePoint and nBattlePoint <= tGloryAwardExp[i][2] then
			nRank = i
			break
		end
	end
	if nRank <= 0 then
		Talk(1,"",szNpcName.."�i�m c�ng tr�ng c�a c�c h� ch�a �� �� l�nh th��ng!")
		return
	end
	local nDay = tonumber(date("%d"))
	if gf_GetTaskByte(TSK_GLORY,BYTE_GLORY_DATE) ~= nDay then
		gf_SetTaskByte(TSK_GLORY,BYTE_GLORY_DATE,nDay)
		gf_SetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT,0)	
	end
	local nCount = gf_GetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT)
	if nCount >= 3 then
		Talk(1,"",szNpcName.."H�m nay c�c h� �� l�nh th��ng 3 l�n r�i!")
		return
	end
	gf_SetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT,nCount + 1)
	gf_EventGiveCustomAward(1, tGloryAwardExp[nRank][3], 1, "Vinh Danh Tuong Si","nh�n")
	if tGloryAwardExp[nRank][4] > 0 and gf_GetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT) == 3 then
		gf_AddItemEx2({2,0,1082,tGloryAwardExp[nRank][4]},"Th�i D�ch H�n Nguy�n C�ng ��","Vinh Danh Tuong Si","nh�n")
	end
end

function IpBonus()
	local tSay = {}
	tinsert(tSay, "Nh�n hi�u qu� h� tr� h�ng ng�y/buff_award")
	tinsert(tSay, "Nh�n th��ng m�i 1 gi� tr�n m�ng/online_award")
	tinsert(tSay, "Xem th�i gian t�ch l�y/show_time")
	tinsert(tSay, "T�m hi�u ho�t ��ng/get_help")
	tinsert(tSay, "Ta ch� gh� qua/nothing")	
	Say(szNpcName.."Th�i gian tr�n m�ng c�a c�c h� s� ���c t�ch l�y �� ��i nh�ng ph�n th��ng h�p d�n. C�c h� c�n ta gi�p �� vi�c g�?",getn(tSay),tSay)
end


function buff_award()
	if GetPlayerRoute() == 0 then
		Talk(1, "", szNpcName.."Ch�a gia nh�p m�n ph�i kh�ng th� nh�n ���c ch�c n�ng h� tr�");
		return
	end
	if GetTask(TASK_GET_FUZHU_DATE) >= tonumber(date("%y%m%d")) then
		Talk(1, "", szNpcName.."H�m nay c�c h� �� nh�n ���c ch�c n�ng h� tr� r�i, kh�ng th� ti�p t�c nh�n th�m.");
		return
	end
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nLeftTime = ((23 - nHour) * 60 * 60 + (59 - nMin) * 60 + (60 - nSec)) * 18;
	local nRandAttr = 0;
	local nAttrId = 2600022;
	nRandAttr = gf_GetRandItemByTable(tBuff, 1000, 1);
	for i = 1, getn(tBuff[nRandAttr][3]) do
		CastState(tBuff[nRandAttr][3][i][1], tBuff[nRandAttr][3][i][2], nLeftTime, 1, nAttrId, 1);
		nAttrId = nAttrId + 1;
	end
	Say("Trong h�m nay c�c h� nh�n ���c hi�u qu� "..tBuff[nRandAttr][1],0)
	Msg2Player("B�n nh�n ���c hi�u qu� "..tBuff[nRandAttr][1]);
	
	SetTask(TASK_GET_FUZHU_TYPE,nRandAttr);
	SetTask(TASK_GET_FUZHU_DATE, tonumber(date("%y%m%d")));
end

function online_award()
	local tSay = {
		"\nNh�n ph�n th��ng s� c�p/get_low_award",
		"\nNh�n ph�n th��ng trung c�p/get_med_award",
		"\nNh�n ph�n th��ng cao c�p/get_high_award",
		"\nNh�n ph�n th��ng Ho�ng Kim/#get_online_award(4,0)",
		"\nNh�n ph�n th��ng B�ch Kim/#get_online_award(5,0)",	--new
		"Ta ch� gh� qua/nothing",
	}
	Say(szNpcName.."C�c h� ch�n ph�n th��ng n�o?",getn(tSay),tSay);
end


function get_low_award()
	local tSay = {
		format("\nNh�n th��ng kinh nghi�m (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ho�n)/#get_online_award(%d,%d)",1,0),
		format("Nh�n th��ng kinh nghi�m v� danh v�ng (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ho�n + 1 gi� L�c Th�n Ho�n)/#get_online_award(%d,%d)",1,1),
		format("Nh�n th��ng kinh nghi�m v� s� m�n (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ho�n + 1 gi� Tam Thanh Ho�n)/#get_online_award(%d,%d)",1,2),
		format("Nh�n th��ng t�t c� (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ho�n + 1 gi� L�c Th�n Ho�n + 1 gi� Tam Thanh Ho�n)/#get_online_award(%d,%d)",1,3),
		format("Nh�n th��ng t�t c� k�m ch�n kh� (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ho�n + 1 gi� L�c Th�n Ho�n + 1 gi� Tam Thanh Ho�n + 1 gi� T� Linh Ho�n)/#get_online_award(%d,%d)",1,4),
		"Ta ch� gh� qua/nothing",
	}	
	Say(szNpcName.."C�c h� ch�n ph�n th��ng n�o?",getn(tSay),tSay);
end


function get_med_award()
	local tSay = {		
		format("\nNh�n th��ng kinh nghi�m (1 gi� tr�n m�ng + 1 gi� ��i B�ch C�u Ho�n)/#get_online_award(%d,%d)",2,0),
		format("Nh�n th��ng kinh nghi�m v� danh v�ng (1 gi� tr�n m�ng + 1 gi� ��i B�ch C�u Ho�n + 1 gi� C��ng L�c Th�n Ho�n)/#get_online_award(%d,%d)",2,1),
		format("Nh�n th��ng kinh nghi�m v� s� m�n (1 gi� tr�n m�ng + 1 gi� ��i B�ch C�u Ho�n + 1 gi� C��ng Hi�u Tam Thanh Ho�n)/#get_online_award(%d,%d)",2,2),
		format("Nh�n th��ng t�t c� (1 gi� tr�n m�ng + 1 gi� ��i B�ch C�u Ho�n + 1 gi� C��ng L�c Th�n Ho�n + 1 gi� C��ng Hi�u Tam Thanh Ho�n)/#get_online_award(%d,%d)",2,3),
		"Ta ch� gh� qua/nothing",
	}	
	Say(szNpcName.."C�c h� ch�n ph�n th��ng n�o?",getn(tSay),tSay);
end


function get_high_award()
	local tSay = {		
		format("\nNh�n th��ng kinh nghi�m (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ti�n ��n)/#get_online_award(%d,%d)",3,0),
		format("Nh�n th��ng kinh nghi�m v� danh v�ng (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ti�n ��n + 1 gi� L�c Th�n Ti�n ��n)/#get_online_award(%d,%d)",3,1),
		format("Nh�n th��ng kinh nghi�m v� s� m�n (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ti�n ��n + 1 gi� Tam Thanh Ti�n ��n)/#get_online_award(%d,%d)",3,2),
		format("Nh�n th��ng t�t c� (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ti�n ��n + 1 gi� L�c Th�n Ti�n ��n + 1 gi� Tam Thanh Ti�n ��n)/#get_online_award(%d,%d)",3,3),
		format("Nh�n th��ng t�t c� k�m ch�n kh� (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ti�n ��n + 1 gi� L�c Th�n Ti�n ��n + 1 gi� Tam Thanh Ti�n ��n + 1 gi� T� Linh Ti�n ��n)/#get_online_award(%d,%d)",3,4),
		"Ta ch� gh� qua/nothing",
	}	
	Say(szNpcName.."C�c h� ch�n ph�n th��ng n�o?",getn(tSay),tSay);
end


function get_online_award(nType, nChosen)
	if GetLevel() < 73 then
		Talk(1,"IpBonus",szNpcName.."��ng c�p 73 tr� l�n m�i c� th� tham gia ho�t ��ng!")
		return
	end
	IpBonusClose()	
	IpBonusStart()
	local nLevel = floor(GetLevel()/10) - 6 -- tr� 6  t��ng �ng v�i ph�n t� 1,2,3 trong b�ng th��ng
	local nSmallBCH = GetTask(2501)
	local nSmallLTH = EatLiushen(1,0)
	local nSmallTTH = EatSanqin(1,0)
	local nSmallTLH = GetTask(3105)
	
	local nBigBCH = GetTask(2507)
	local nBigLTH = EatLiushen(2,0)
	local nBigTTH = EatSanqin(2,0)
	local nBigTLH = GetTask(3106)
	
	local nExBigBCH = GetTask(2508)
	local nExBigLTH = EatLiushen(3,0)
	local nExBigTTH = EatSanqin(3,0)
	local nExBigTLH = GetTask(3107)
	
	if nType == 5 then
		if GetOnlineTime() < 1 * 3600 * 6 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian tr�n m�ng c�a c�c h� ch�a �� 6 gi�!")
			return
		end
	else
		if GetOnlineTime() < 1 * 3600 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian tr�n m�ng c�a c�c h� ch�a �� 1 gi�!")
			return
		end
	end
	
	if nType == 1 then
		if nSmallBCH < 60 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c B�ch C�u Ho�n c�a c�c h� kh�ng �� 1 gi�!")
			return
		end	
		if nChosen == 3 or  nChosen == 4 then
			if nSmallLTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c L�c Th�n Ho�n c�a c�c h� kh�ng �� 1 gi�!!!")
				return
			end
			if nSmallTTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c Tam Thanh Ho�n c�a c�c h� kh�ng �� 1 gi�!")
				return
			end
		end		
		if nChosen == 4 then
			if nSmallTLH < 60 then
				Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c T� Linh Ho�n c�a c�c h� kh�ng �� 1 gi�!!")
				return
			end
		end			
	elseif nType == 2 then
			Talk(1,"IpBonus",szNpcName.."T�nh n�ng t�m ��ng!")
			return
	elseif nType == 3 then
		if nExBigBCH < 60 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c B�ch C�u Ti�n ��n c�a c�c h� kh�ng �� 1 gi�!")
			return
		end	
		if nChosen == 3 or  nChosen == 4 then
			if nExBigLTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c L�c Th�n Ti�n ��n c�a c�c h� kh�ng �� 1 gi�!")
				return
			end
			if nExBigTTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c Tam Thanh Ti�n ��n c�a c�c h� kh�ng �� 1 gi�!")
				return
			end
		end		
		if nChosen == 4 then
			if nExBigTLH < 60 then
				Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c T� Linh Ti�n ��n c�a c�c h� kh�ng �� 1 gi�!")
				return
			end
		end	
	elseif nType == 4 then
		if nSmallBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c B�ch C�u Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nSmallLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c L�c Th�n Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
		if nSmallTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c Tam Thanh Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c ��i B�ch C�u Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c C��ng Hi�u L�c Th�n Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c C��ng Hi�u Tam Thanh Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
		if nExBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c B�ch C�u Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nExBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c L�c Th�n Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
		if nExBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c Tam Thanh Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
	elseif nType == 5 then
		if nSmallBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c B�ch C�u Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nSmallLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c L�c Th�n Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
		if nSmallTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c Tam Thanh Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nSmallTLH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c T� Linh Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end			
		if nBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c ��i B�ch C�u Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c C��ng Hi�u L�c Th�n Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c C��ng Hi�u Tam Thanh Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
		if nBigTLH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c ��i T� Linh Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end		
		if nExBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c B�ch C�u Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nExBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c L�c Th�n Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
		if nExBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c Tam Thanh Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end		
		if nExBigTLH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c T� Linh Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end				
	else
		Talk(1,"IpBonus",szNpcName.."Ho�t ��ng ch�a h� tr� ph�n th��ng lo�i n�y!")
		return
	end
	if nType == 5 then
		if SetOnlineTime(3600 * 6,2) >= 0 then	
			SetTask(2501,nSmallBCH - 480)
			EatLiushen(1,-480)
			EatSanqin(1,-480)
			SetTask(2507,nBigBCH - 480)
			EatLiushen(2,-480)
			EatSanqin(2,-480)
			SetTask(2508,nExBigBCH - 480)
			EatLiushen(3,-480)
			EatSanqin(3,-480)
			SetTask(3105, nSmallTLH - 480,8)
			SetTask(3106, nBigTLH - 480,8)
			SetTask(3107, nExBigTLH - 480,8)
		
			ModifyExp(7900000)
			Msg2Player("B�n nh�n ���c 7.900.000 �i�m kinh nghi�m.")
			SetTask(336,GetTask(336) + 120)
			Msg2Player("B�n nh�n ���c 120 �i�m s� m�n.")
			ModifyReputation(120,0)				
			Earn(790000)
			if GetTask(701) >= 0 then
				SetTask(701, GetTask(701) + 68)
				Msg2Player("B�n nh�n ���c 68 �i�m c�ng tr�ng.")	
			else	
				SetTask(701, GetTask(701) - 68)
				Msg2Player("B�n nh�n ���c 68 �i�m c�ng tr�ng.")	
			end
			if MeridianGetLevel() >= 1 then
				AwardGenuineQi(2900)
			end
			 gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online B�ch Kim ")
			online_award()
		end
		return
	end
	if SetOnlineTime(3600,2) >= 0 then	
		if nType == 1 then
			if nChosen == 0 then
				SetTask(2501,nSmallBCH - 60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online SC�p exp ")							
			elseif nChosen == 3 then
				SetTask(2501,nSmallBCH - 60)
				EatLiushen(1,-60)
				EatSanqin(1,-60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online SC�p all ")		
			elseif nChosen == 4 then
				SetTask(2501,nSmallBCH - 60)
				EatLiushen(1,-60)
				EatSanqin(1,-60)
				SetTask(3105,nSmallTLH - 60, 8)
				if MeridianGetLevel() >= 1 then
					AwardGenuineQi(66)
				end
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online SC�p all & ch�n kh� ")		
			else
				Talk(1,"IpBonus",szNpcName.."Ho�t ��ng ch�a h� tr� ph�n th��ng lo�i n�y!")
				return	
			end
			ModifyExp(tOnlineAward[nType][nChosen][1])	--kinh nghi�m
			Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][1].." �i�m kinh nghi�m.")						
			ModifyReputation(tOnlineAward[nType][nChosen][2],0)		--danh v�ng
			SetTask(336,GetTask(336) + tOnlineAward[nType][nChosen][3])		--s� m�n
			if nChosen ~= 0 then
				Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][3].." �i�m s� m�n.")					
			end
			Earn(tOnlineAward[nType][nChosen][6] * 10000)	--v�ng
		
			online_award()	
		elseif nType == 2 then
			online_award()
		elseif nType == 3 then
			if nChosen == 0 then
				SetTask(2508,nExBigBCH - 60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online Cao C�p exp ")							
			elseif nChosen == 3 then
				SetTask(2508,nExBigBCH - 60)
				EatLiushen(3,-60)
				EatSanqin(3,-60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online Cao C�p all ")	
				if GetTask(701) >= 0 then
					SetTask(701, GetTask(701) + tOnlineAward[nType][nChosen][4])
					Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][4].." �i�m c�ng tr�ng.")				
				else
					SetTask(701, GetTask(701) -  tOnlineAward[nType][nChosen][4])
					Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][4].." �i�m c�ng tr�ng.")					
				end	
			elseif nChosen == 4 then
				SetTask(2508,nExBigBCH - 60)
				EatLiushen(3,-60)
				EatSanqin(3,-60)
				SetTask(3107, nExBigTLH - 60, 8)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online Cao C�p all & ch�n kh� ")
				if GetTask(701) >= 0 then
					SetTask(701, GetTask(701) + tOnlineAward[nType][nChosen][4])
					Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][4].." �i�m c�ng tr�ng.")				
				else
					SetTask(701, GetTask(701) -  tOnlineAward[nType][nChosen][4])
					Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][4].." �i�m c�ng tr�ng.")					
				end	
				if MeridianGetLevel() >= 1 then
					AwardGenuineQi(199)
				end						
			else
				Talk(1,"IpBonus",szNpcName.."Ho�t ��ng ch�a h� tr� ph�n th��ng lo�i n�y!")
				return	
			end
			ModifyExp(tOnlineAward[nType][nChosen][1])	--kinh nghi�m
			Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][1].." �i�m kinh nghi�m.")						
			ModifyReputation(tOnlineAward[nType][nChosen][2],0)		--danh v�ng
			SetTask(336,GetTask(336) + tOnlineAward[nType][nChosen][3])		--s� m�n
			if nChosen ~= 0 then
				Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][3].." �i�m s� m�n.")	
			end
			Earn(tOnlineAward[nType][nChosen][6] * 10000)	--v�ng
		
			online_award()
		elseif nType == 4 then
			SetTask(2501,nSmallBCH - 480)
			EatLiushen(1,-480)
			EatSanqin(1,-480)
			SetTask(2507,nBigBCH - 480)
			EatLiushen(2,-480)
			EatSanqin(2,-480)
			SetTask(2508,nExBigBCH - 480)
			EatLiushen(3,-480)
			EatSanqin(3,-480)
		
			ModifyExp(7200000)
			Msg2Player("B�n nh�n ���c 7.200.000 �i�m kinh nghi�m.")
			SetTask(336,GetTask(336) + 120)
			Msg2Player("B�n nh�n ���c 120 �i�m s� m�n.")
			ModifyReputation(120,0)				
			Earn(720000)
			if GetTask(701) >= 0 then
				SetTask(701, GetTask(701) + 60)
				Msg2Player("B�n nh�n ���c 60 �i�m c�ng tr�ng.")	
			else	
				SetTask(701, GetTask(701) - 60)
				Msg2Player("B�n nh�n ���c 60 �i�m c�ng tr�ng.")	
			end
			 gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online Ho�ng Kim")
			online_award()
		else
			Talk(1,"IpBonus",szNpcName.."Ho�t ��ng ch�a h� tr� ph�n th��ng lo�i n�y!")
			return
		end		
	end	
end


function show_time()
	IpBonusClose()	
	local nHour, nMin, nSec = ShowTime()
	local strMsg = format("%sTh�i gian tr�n m�ng c�a c�c h� l�: <color=yellow>%d gi� %d ph�t %d gi�y<color>.",szNpcName,nHour, nMin, nSec)
	IpBonusStart()
	Talk(1,"IpBonus",strMsg)
end

function get_help()
	local tSay = {
		format("%sTh�i gian nh�n v�t tr�n m�ng s� ���c t�ch l�y li�n t�c. Nh�n v�t c� th� s� d�ng 2 gi�  tr�n m�ng �� ��i c�c lo�i ph�n th��ng. Ph�n th��ng bao g�m kinh nghi�m, danh v�ng, �i�m s� m�n v� v�ng. <color=red>Ch� �: n�u ch�n nh�n th��ng t�t c�, s� l��ng ph�n th��ng s� nhi�u h�n. M�i nh�n v�t ch� c� th� t�ch l�y ���c 8 gi� tr�n m�ng, sau khi ��i th��ng th� th�i gian ti�p t�c ���c t�ch l�y<color>.",szNpcName),
		format("%sN�u t�ch l�y �� 8 gi� tr�n m�ng, nh�n v�t c� th� ��i ���c c�c lo�i v�t ph�m thu th�p, v�t ph�m qu�n d�ng ho�c Anh H�ng Thi�p (kh�ng th� giao d�ch, h�n t�n t�i 2 ng�y). <color=red>Ch� �: m�i ng�y nh�n v�t ch� c� th� ��i 1 l�n<color>.",szNpcName),
		format("%sNgo�i ra, nh�n v�t c�n c� th� nh�n ���c hi�u qu� h� tr� ng�u nhi�n h�ng ng�y. <color=red>Ch� �: sau 24 gi� h�ng ng�y, hi�u qu� s� bi�n m�t. M�i ng�y nh�n v�t ch� c� th� nh�n hi�u qu� h� tr� 1 l�n<color>.",szNpcName),
	}
	TalkEx("IpBonus",tSay)
end

function nothing()
end