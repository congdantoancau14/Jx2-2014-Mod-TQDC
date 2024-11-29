-- IP Bonus Created by TuanNA5

Include("\\script\\online\\viet_event\\ip_bonus\\ip_head.lua") -- IP bonus
Include("\\script\\online\\viet_event\\golden_card\\npc_golden.lua") -- event Hoµng Kim LÖnh Bµi
Include("\\script\\online\\viet_event\\bet_game\\bet_npc.lua") -- Dù ®o¸n kÕt qu¶ thi ®Êu
Include("\\script\\online_activites\\ipbonus\\ipbonus.lua") -- IP Bonus 2011 (CSM)
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\vng\\chitonvuonglenh\\chitonvuonglenh.lua");
Include("\\script\\vng\\all_trangbi.lua");
Include("\\script\\equip_shop\\equip_shop_head.lua");

szNpcName = "<color=green>Chñ Phßng M¸y: <color>"

	
function main()
	if IsIPBonus() == 1 then
		IpBonusClose()
		IpBonusStart()	
		npc_talk()
	else
		Say(szNpcName.."Ho¹t ®éng ®· kÕt thóc!",0)
	end
end


function npc_talk()
	local nDate = tonumber(date("%Y%m%d"))
	local nDate1 =  tonumber(date("%y%m%d%H"))
	local tSay = {
			"Xem t¹p hãa Kim phiÕu/#show_equip_shop(3000)",
			"Xem t¹p hãa Ng©n phiÕu/#show_equip_shop(3033)",
			
			"NhËn th­ëng tİch lòy online/IpBonus",
			"NhËn th­ëng Vinh Danh T­íng SÜ/get_solider_glory",
			"Nguyªn So¸i tuyªn bè chiÕm ®ãng thµnh thŞ nµy, ta muèn lµm nhiÖm vô qu©n ®éi/do_military_job",
			"Thu håi CÈm Nang §¹i Sù KiÖn/get_camnang",
			"Ta chØ ghĞ qua/nothing",
	}
	local nDay = tonumber(date("%d"))
	local nYear = tonumber(date("%Y"))
	local nWeek = tonumber(date("%w"))
	Say(szNpcName.."Ta chuyªn phô tr¸ch c¸c ho¹t ®éng nhËn th­ëng. C¸c h¹ cÇn ta gióp ®ì viÖc g×?",getn(tSay),tSay)
end


function do_military_job()
	Talk(1,"",szNpcName.."HiÖn t¹i thµnh nµy ch­a cã Nguyªn So¸i nµo chiÕm ®ãng!")
end

function get_solider_glory()
	if GetLevel() < 73 then
		Talk(1,"",szNpcName.."§¼ng cÊp 73 trë lªn míi cã thÓ lÜnh th­ëng!")
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a gia nhËp hÖ ph¸i kh«ng thÓ lÜnh th­ëng!")
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
		Talk(1,"",szNpcName.."§iÓm c«ng tr¹ng cña c¸c h¹ ch­a ®ñ ®Ó lÜnh th­ëng!")
		return
	end
	local nDay = tonumber(date("%d"))
	if gf_GetTaskByte(TSK_GLORY,BYTE_GLORY_DATE) ~= nDay then
		gf_SetTaskByte(TSK_GLORY,BYTE_GLORY_DATE,nDay)
		gf_SetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT,0)	
	end
	local nCount = gf_GetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT)
	if nCount >= 3 then
		Talk(1,"",szNpcName.."H«m nay c¸c h¹ ®· lÜnh th­ëng 3 lÇn råi!")
		return
	end
	gf_SetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT,nCount + 1)
	gf_EventGiveCustomAward(1, tGloryAwardExp[nRank][3], 1, "Vinh Danh Tuong Si","nhËn")
	if tGloryAwardExp[nRank][4] > 0 and gf_GetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT) == 3 then
		gf_AddItemEx2({2,0,1082,tGloryAwardExp[nRank][4]},"Th¸i DŞch Hçn Nguyªn C«ng §å","Vinh Danh Tuong Si","nhËn")
	end
end

function IpBonus()
	local tSay = {}
	tinsert(tSay, "NhËn hiÖu qu¶ hç trî h»ng ngµy/buff_award")
	tinsert(tSay, "NhËn th­ëng mçi 1 giê trªn m¹ng/online_award")
	tinsert(tSay, "Xem thêi gian tİch lòy/show_time")
	tinsert(tSay, "T×m hiÓu ho¹t ®éng/get_help")
	tinsert(tSay, "Ta chØ ghĞ qua/nothing")	
	Say(szNpcName.."Thêi gian trªn m¹ng cña c¸c h¹ sÏ ®­îc tİch lòy ®Ó ®æi nh÷ng phÇn th­ëng hÊp dÉn. C¸c h¹ cÇn ta gióp ®ì viÖc g×?",getn(tSay),tSay)
end


function buff_award()
	if GetPlayerRoute() == 0 then
		Talk(1, "", szNpcName.."Ch­a gia nhËp m«n ph¸i kh«ng thÓ nhËn ®­îc chøc n¨ng hç trî");
		return
	end
	if GetTask(TASK_GET_FUZHU_DATE) >= tonumber(date("%y%m%d")) then
		Talk(1, "", szNpcName.."H«m nay c¸c h¹ ®· nhËn ®­îc chøc n¨ng hç trî råi, kh«ng thÓ tiÕp tôc nhËn thªm.");
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
	Say("Trong h«m nay c¸c h¹ nhËn ®­îc hiÖu qu¶ "..tBuff[nRandAttr][1],0)
	Msg2Player("B¹n nhËn ®­îc hiÖu qu¶ "..tBuff[nRandAttr][1]);
	
	SetTask(TASK_GET_FUZHU_TYPE,nRandAttr);
	SetTask(TASK_GET_FUZHU_DATE, tonumber(date("%y%m%d")));
end

function online_award()
	local tSay = {
		"\nNhËn phÇn th­ëng s¬ cÊp/get_low_award",
		"\nNhËn phÇn th­ëng trung cÊp/get_med_award",
		"\nNhËn phÇn th­ëng cao cÊp/get_high_award",
		"\nNhËn phÇn th­ëng Hoµng Kim/#get_online_award(4,0)",
		"\nNhËn phÇn th­ëng B¹ch Kim/#get_online_award(5,0)",	--new
		"Ta chØ ghĞ qua/nothing",
	}
	Say(szNpcName.."C¸c h¹ chän phÇn th­ëng nµo?",getn(tSay),tSay);
end


function get_low_award()
	local tSay = {
		format("\nNhËn th­ëng kinh nghiÖm (1 giê trªn m¹ng + 1 giê B¹ch C©u Hoµn)/#get_online_award(%d,%d)",1,0),
		format("NhËn th­ëng kinh nghiÖm vµ danh väng (1 giê trªn m¹ng + 1 giê B¹ch C©u Hoµn + 1 giê Lôc ThÇn Hoµn)/#get_online_award(%d,%d)",1,1),
		format("NhËn th­ëng kinh nghiÖm vµ s­ m«n (1 giê trªn m¹ng + 1 giê B¹ch C©u Hoµn + 1 giê Tam Thanh Hoµn)/#get_online_award(%d,%d)",1,2),
		format("NhËn th­ëng tÊt c¶ (1 giê trªn m¹ng + 1 giê B¹ch C©u Hoµn + 1 giê Lôc ThÇn Hoµn + 1 giê Tam Thanh Hoµn)/#get_online_award(%d,%d)",1,3),
		format("NhËn th­ëng tÊt c¶ kÌm ch©n khİ (1 giê trªn m¹ng + 1 giê B¹ch C©u Hoµn + 1 giê Lôc ThÇn Hoµn + 1 giê Tam Thanh Hoµn + 1 giê Tô Linh Hoµn)/#get_online_award(%d,%d)",1,4),
		"Ta chØ ghĞ qua/nothing",
	}	
	Say(szNpcName.."C¸c h¹ chän phÇn th­ëng nµo?",getn(tSay),tSay);
end


function get_med_award()
	local tSay = {		
		format("\nNhËn th­ëng kinh nghiÖm (1 giê trªn m¹ng + 1 giê §¹i B¹ch C©u Hoµn)/#get_online_award(%d,%d)",2,0),
		format("NhËn th­ëng kinh nghiÖm vµ danh väng (1 giê trªn m¹ng + 1 giê §¹i B¹ch C©u Hoµn + 1 giê C­êng Lôc ThÇn Hoµn)/#get_online_award(%d,%d)",2,1),
		format("NhËn th­ëng kinh nghiÖm vµ s­ m«n (1 giê trªn m¹ng + 1 giê §¹i B¹ch C©u Hoµn + 1 giê C­êng HiÖu Tam Thanh Hoµn)/#get_online_award(%d,%d)",2,2),
		format("NhËn th­ëng tÊt c¶ (1 giê trªn m¹ng + 1 giê §¹i B¹ch C©u Hoµn + 1 giê C­êng Lôc ThÇn Hoµn + 1 giê C­êng HiÖu Tam Thanh Hoµn)/#get_online_award(%d,%d)",2,3),
		"Ta chØ ghĞ qua/nothing",
	}	
	Say(szNpcName.."C¸c h¹ chän phÇn th­ëng nµo?",getn(tSay),tSay);
end


function get_high_award()
	local tSay = {		
		format("\nNhËn th­ëng kinh nghiÖm (1 giê trªn m¹ng + 1 giê B¹ch C©u Tiªn §¬n)/#get_online_award(%d,%d)",3,0),
		format("NhËn th­ëng kinh nghiÖm vµ danh väng (1 giê trªn m¹ng + 1 giê B¹ch C©u Tiªn §¬n + 1 giê Lôc ThÇn Tiªn §¬n)/#get_online_award(%d,%d)",3,1),
		format("NhËn th­ëng kinh nghiÖm vµ s­ m«n (1 giê trªn m¹ng + 1 giê B¹ch C©u Tiªn §¬n + 1 giê Tam Thanh Tiªn §¬n)/#get_online_award(%d,%d)",3,2),
		format("NhËn th­ëng tÊt c¶ (1 giê trªn m¹ng + 1 giê B¹ch C©u Tiªn §¬n + 1 giê Lôc ThÇn Tiªn §¬n + 1 giê Tam Thanh Tiªn §¬n)/#get_online_award(%d,%d)",3,3),
		format("NhËn th­ëng tÊt c¶ kÌm ch©n khİ (1 giê trªn m¹ng + 1 giê B¹ch C©u Tiªn §¬n + 1 giê Lôc ThÇn Tiªn §¬n + 1 giê Tam Thanh Tiªn §¬n + 1 giê Tô Linh Tiªn §¬n)/#get_online_award(%d,%d)",3,4),
		"Ta chØ ghĞ qua/nothing",
	}	
	Say(szNpcName.."C¸c h¹ chän phÇn th­ëng nµo?",getn(tSay),tSay);
end


function get_online_award(nType, nChosen)
	if GetLevel() < 73 then
		Talk(1,"IpBonus",szNpcName.."§¼ng cÊp 73 trë lªn míi cã thÓ tham gia ho¹t ®éng!")
		return
	end
	IpBonusClose()	
	IpBonusStart()
	local nLevel = floor(GetLevel()/10) - 6 -- trõ 6  t­¬ng øng víi phÇn tö 1,2,3 trong b¶ng th­ëng
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
			Talk(1,"IpBonus",szNpcName.."Thêi gian trªn m¹ng cña c¸c h¹ ch­a ®ñ 6 giê!")
			return
		end
	else
		if GetOnlineTime() < 1 * 3600 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian trªn m¹ng cña c¸c h¹ ch­a ®ñ 1 giê!")
			return
		end
	end
	
	if nType == 1 then
		if nSmallBCH < 60 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c B¹ch C©u Hoµn cña c¸c h¹ kh«ng ®ñ 1 giê!")
			return
		end	
		if nChosen == 3 or  nChosen == 4 then
			if nSmallLTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Lôc ThÇn Hoµn cña c¸c h¹ kh«ng ®ñ 1 giê!!!")
				return
			end
			if nSmallTTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tam Thanh Hoµn cña c¸c h¹ kh«ng ®ñ 1 giê!")
				return
			end
		end		
		if nChosen == 4 then
			if nSmallTLH < 60 then
				Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tô Linh Hoµn cña c¸c h¹ kh«ng ®ñ 1 giê!!")
				return
			end
		end			
	elseif nType == 2 then
			Talk(1,"IpBonus",szNpcName.."Tİnh n¨ng t¹m ®ãng!")
			return
	elseif nType == 3 then
		if nExBigBCH < 60 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c B¹ch C©u Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 1 giê!")
			return
		end	
		if nChosen == 3 or  nChosen == 4 then
			if nExBigLTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Lôc ThÇn Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 1 giê!")
				return
			end
			if nExBigTTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tam Thanh Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 1 giê!")
				return
			end
		end		
		if nChosen == 4 then
			if nExBigTLH < 60 then
				Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tô Linh Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 1 giê!")
				return
			end
		end	
	elseif nType == 4 then
		if nSmallBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c B¹ch C©u Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nSmallLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Lôc ThÇn Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end
		if nSmallTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tam Thanh Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c §¹i B¹ch C©u Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c C­êng HiÖu Lôc ThÇn Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c C­êng HiÖu Tam Thanh Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end
		if nExBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c B¹ch C©u Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nExBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Lôc ThÇn Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end
		if nExBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tam Thanh Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end
	elseif nType == 5 then
		if nSmallBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c B¹ch C©u Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nSmallLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Lôc ThÇn Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end
		if nSmallTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tam Thanh Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nSmallTLH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tô Linh Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end			
		if nBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c §¹i B¹ch C©u Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c C­êng HiÖu Lôc ThÇn Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c C­êng HiÖu Tam Thanh Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end
		if nBigTLH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c §¹i Tô Linh Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end		
		if nExBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c B¹ch C©u Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nExBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Lôc ThÇn Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end
		if nExBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tam Thanh Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end		
		if nExBigTLH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tô Linh Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end				
	else
		Talk(1,"IpBonus",szNpcName.."Ho¹t ®éng ch­a hç trî phÇn th­ëng lo¹i nµy!")
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
			Msg2Player("B¹n nhËn ®­îc 7.900.000 ®iÓm kinh nghiÖm.")
			SetTask(336,GetTask(336) + 120)
			Msg2Player("B¹n nhËn ®­îc 120 ®iÓm s­ m«n.")
			ModifyReputation(120,0)				
			Earn(790000)
			if GetTask(701) >= 0 then
				SetTask(701, GetTask(701) + 68)
				Msg2Player("B¹n nhËn ®­îc 68 ®iÓm c«ng tr¹ng.")	
			else	
				SetTask(701, GetTask(701) - 68)
				Msg2Player("B¹n nhËn ®­îc 68 ®iÓm c«ng tr¹ng.")	
			end
			if MeridianGetLevel() >= 1 then
				AwardGenuineQi(2900)
			end
			 gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho¹t thµnh c«ng", 1, "Tİch lòy online B¹ch Kim ")
			online_award()
		end
		return
	end
	if SetOnlineTime(3600,2) >= 0 then	
		if nType == 1 then
			if nChosen == 0 then
				SetTask(2501,nSmallBCH - 60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho¹t thµnh c«ng", 1, "Tİch lòy online SCÊp exp ")							
			elseif nChosen == 3 then
				SetTask(2501,nSmallBCH - 60)
				EatLiushen(1,-60)
				EatSanqin(1,-60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho¹t thµnh c«ng", 1, "Tİch lòy online SCÊp all ")		
			elseif nChosen == 4 then
				SetTask(2501,nSmallBCH - 60)
				EatLiushen(1,-60)
				EatSanqin(1,-60)
				SetTask(3105,nSmallTLH - 60, 8)
				if MeridianGetLevel() >= 1 then
					AwardGenuineQi(66)
				end
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho¹t thµnh c«ng", 1, "Tİch lòy online SCÊp all & ch©n khİ ")		
			else
				Talk(1,"IpBonus",szNpcName.."Ho¹t ®éng ch­a hç trî phÇn th­ëng lo¹i nµy!")
				return	
			end
			ModifyExp(tOnlineAward[nType][nChosen][1])	--kinh nghiÖm
			Msg2Player("B¹n nhËn ®­îc "..tOnlineAward[nType][nChosen][1].." ®iÓm kinh nghiÖm.")						
			ModifyReputation(tOnlineAward[nType][nChosen][2],0)		--danh väng
			SetTask(336,GetTask(336) + tOnlineAward[nType][nChosen][3])		--s­ m«n
			if nChosen ~= 0 then
				Msg2Player("B¹n nhËn ®­îc "..tOnlineAward[nType][nChosen][3].." ®iÓm s­ m«n.")					
			end
			Earn(tOnlineAward[nType][nChosen][6] * 10000)	--vµng
		
			online_award()	
		elseif nType == 2 then
			online_award()
		elseif nType == 3 then
			if nChosen == 0 then
				SetTask(2508,nExBigBCH - 60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho¹t thµnh c«ng", 1, "Tİch lòy online Cao CÊp exp ")							
			elseif nChosen == 3 then
				SetTask(2508,nExBigBCH - 60)
				EatLiushen(3,-60)
				EatSanqin(3,-60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho¹t thµnh c«ng", 1, "Tİch lòy online Cao CÊp all ")	
				if GetTask(701) >= 0 then
					SetTask(701, GetTask(701) + tOnlineAward[nType][nChosen][4])
					Msg2Player("B¹n nhËn ®­îc "..tOnlineAward[nType][nChosen][4].." ®iÓm c«ng tr¹ng.")				
				else
					SetTask(701, GetTask(701) -  tOnlineAward[nType][nChosen][4])
					Msg2Player("B¹n nhËn ®­îc "..tOnlineAward[nType][nChosen][4].." ®iÓm c«ng tr¹ng.")					
				end	
			elseif nChosen == 4 then
				SetTask(2508,nExBigBCH - 60)
				EatLiushen(3,-60)
				EatSanqin(3,-60)
				SetTask(3107, nExBigTLH - 60, 8)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho¹t thµnh c«ng", 1, "Tİch lòy online Cao CÊp all & ch©n khİ ")
				if GetTask(701) >= 0 then
					SetTask(701, GetTask(701) + tOnlineAward[nType][nChosen][4])
					Msg2Player("B¹n nhËn ®­îc "..tOnlineAward[nType][nChosen][4].." ®iÓm c«ng tr¹ng.")				
				else
					SetTask(701, GetTask(701) -  tOnlineAward[nType][nChosen][4])
					Msg2Player("B¹n nhËn ®­îc "..tOnlineAward[nType][nChosen][4].." ®iÓm c«ng tr¹ng.")					
				end	
				if MeridianGetLevel() >= 1 then
					AwardGenuineQi(199)
				end						
			else
				Talk(1,"IpBonus",szNpcName.."Ho¹t ®éng ch­a hç trî phÇn th­ëng lo¹i nµy!")
				return	
			end
			ModifyExp(tOnlineAward[nType][nChosen][1])	--kinh nghiÖm
			Msg2Player("B¹n nhËn ®­îc "..tOnlineAward[nType][nChosen][1].." ®iÓm kinh nghiÖm.")						
			ModifyReputation(tOnlineAward[nType][nChosen][2],0)		--danh väng
			SetTask(336,GetTask(336) + tOnlineAward[nType][nChosen][3])		--s­ m«n
			if nChosen ~= 0 then
				Msg2Player("B¹n nhËn ®­îc "..tOnlineAward[nType][nChosen][3].." ®iÓm s­ m«n.")	
			end
			Earn(tOnlineAward[nType][nChosen][6] * 10000)	--vµng
		
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
			Msg2Player("B¹n nhËn ®­îc 7.200.000 ®iÓm kinh nghiÖm.")
			SetTask(336,GetTask(336) + 120)
			Msg2Player("B¹n nhËn ®­îc 120 ®iÓm s­ m«n.")
			ModifyReputation(120,0)				
			Earn(720000)
			if GetTask(701) >= 0 then
				SetTask(701, GetTask(701) + 60)
				Msg2Player("B¹n nhËn ®­îc 60 ®iÓm c«ng tr¹ng.")	
			else	
				SetTask(701, GetTask(701) - 60)
				Msg2Player("B¹n nhËn ®­îc 60 ®iÓm c«ng tr¹ng.")	
			end
			 gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho¹t thµnh c«ng", 1, "Tİch lòy online Hoµng Kim")
			online_award()
		else
			Talk(1,"IpBonus",szNpcName.."Ho¹t ®éng ch­a hç trî phÇn th­ëng lo¹i nµy!")
			return
		end		
	end	
end


function show_time()
	IpBonusClose()	
	local nHour, nMin, nSec = ShowTime()
	local strMsg = format("%sThêi gian trªn m¹ng cña c¸c h¹ lµ: <color=yellow>%d giê %d phót %d gi©y<color>.",szNpcName,nHour, nMin, nSec)
	IpBonusStart()
	Talk(1,"IpBonus",strMsg)
end

function get_help()
	local tSay = {
		format("%sThêi gian nh©n vËt trªn m¹ng sÏ ®­îc tİch lòy liªn tôc. Nh©n vËt cã thÓ sö dông 2 giê  trªn m¹ng ®Ó ®æi c¸c lo¹i phÇn th­ëng. PhÇn th­ëng bao gåm kinh nghiÖm, danh väng, ®iÓm s­ m«n vµ vµng. <color=red>Chó ı: nÕu chän nhËn th­ëng tÊt c¶, sè l­îng phÇn th­ëng sÏ nhiÒu h¬n. Mçi nh©n vËt chØ cã thÓ tİch lòy ®­îc 8 giê trªn m¹ng, sau khi ®æi th­ëng th× thêi gian tiÕp tôc ®­îc tİch lòy<color>.",szNpcName),
		format("%sNÕu tİch lòy ®ñ 8 giê trªn m¹ng, nh©n vËt cã thÓ ®æi ®­îc c¸c lo¹i vËt phÈm thu thËp, vËt phÈm qu©n dông hoÆc Anh Hïng ThiÕp (kh«ng thÓ giao dŞch, h¹n tån t¹i 2 ngµy). <color=red>Chó ı: mçi ngµy nh©n vËt chØ cã thÓ ®æi 1 lÇn<color>.",szNpcName),
		format("%sNgoµi ra, nh©n vËt cßn cã thÓ nhËn ®­îc hiÖu qu¶ hç trî ngÉu nhiªn h»ng ngµy. <color=red>Chó ı: sau 24 giê h»ng ngµy, hiÖu qu¶ sÏ biÕn mÊt. Mçi ngµy nh©n vËt chØ cã thÓ nhËn hiÖu qu¶ hç trî 1 lÇn<color>.",szNpcName),
	}
	TalkEx("IpBonus",tSay)
end

function nothing()
end