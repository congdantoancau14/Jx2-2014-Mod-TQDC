GET_PANGTUZI_ID = 2432
GET_PANGTUZI_TIME_ID = 2433

-- file thÞt nuíng 
Include("\\script\\online\\viet_event\\200911\\6\\head_bachtiensinh.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\vng\\award\\feature_award.lua")
--Event
Include("\\settings\\static_script\\cheat\\event\\event_init.lua");

SPACING_TIME = 15 -- thêi gian gi·n c¸ch hai lÇn click vµo lß nuíng: MÆc ®?nh: 45 gi©y

function main()
	-- if GetTask(TSK_THONUONG_ACCEPT) ~= 1 then
		-- Talk(1, "", "B¹n ch­a nhËn nhiÖm vô nªn kh«ng thÓ tham gia bµn tiÖc.");
		-- return 0
	-- end
	
	if GetLevel() < 73 then
		Talk(1,"","CÊp 73 trë lªn míi cã thÓ tham gia bµn tiÖc.")
		return 0
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1,"","Gia nhËp m«n ph¸i míi cã thÓ tham gia bµn tiÖc.")
		return 0
	end
	
	local nReputation = GetReputation()
	if nReputation < 3000 then
		Talk(1,"","§¹t 3000 ®iÓm danh väng trë lªn míi cã thÓ tham gia bµn tiÖc.")
		return 0
	end

	local nDate = tonumber(date("%d"));
	local nTaskVal = GetTask(GET_PANGTUZI_ID)
	
	if GetByte(nTaskVal,1) ~= nDate then
		nTaskVal  = SetByte(nTaskVal,1,nDate)
		nTaskVal  = SetByte(nTaskVal,2,0)
		nTaskVal  = SetByte(nTaskVal,3,0)
		SetTask(GET_PANGTUZI_ID, nTaskVal)	
	end
	
	nTaskVal = GetTask(GET_PANGTUZI_ID)	
	
	-- mçi nh©n vËt thuëng thøc ®óng 180 c¸i / ngµy
	if GetByte(nTaskVal,2) >= 180 then
		Talk(1,"","Mçi ngµy chØ cã thÓ th­ëng thøc 180 ThÞt N­íng.")
		return 0
	end	
	
	-- ? gm ds SetTask( 2432, SetByte ( GetTask(2432) , 2 , value) )
	-- value: sè lÇn ¨n 	
	-- ?gm ds Msg2Player(GetByte(GetTask(100),3))	
	
	
	if GetTime() - GetTask(GET_PANGTUZI_TIME_ID) < SPACING_TIME then
		Talk(1,"","B¹n cßn "..GetTask(GET_PANGTUZI_TIME_ID) + SPACING_TIME - GetTime().." gi©y míi cã thÓ tiÕp tôc th­ëng thøc ThÞt N­íng.")
		return 0
	end
	
	-- ®iÓm danh väng = 0  kh«ng thÓ nhËn th­ëng	
	if ( GetReputation() == 0 ) then
		Talk(1,"","§iÓm danh väng kh«ng ®ñ.")
		return 0
	end
	
	local nSelfIndex = GetTargetNpc()
	SetNpcLifeTime(nSelfIndex, 0)	
	SetTask(GET_PANGTUZI_ID, SetByte(nTaskVal,2,GetByte(nTaskVal,2) + 1))
	SetTask(GET_PANGTUZI_TIME_ID,GetTime())
	local nExp, nRep, nRep1, nFaction, nFaction1 = 5000000, 5, 2, 5, 2
	
	EventAddPhoBan(20)
	local nRand = random(1,100)
	if nRand <= 30 then	
		tb_Item_List = {
			{"Th×t ba räi",1,{2,1,30142,1},0},
			{"Th×t bß",1,{2,1,258,1},0},
			{"Th×t C¸ T­¬i",1,{2,1,30837,1},0},
			{"Th×t dª",1,{2,1,30129,1},0},
			{"Th×t dª",1,{2,1,30998,1},0},
			{"Th×t heo",1,{2,1,257,1},0},
			{"Th×t Heo Ngon",1,{2,1,31304,1},0},
			--{"Th×t l¹c ®µ",1,{2,1,524,1},0},
			{"Th×t L¹p",1,{2,1,31081,1},0},
			{"Th×t Ngçng",1,{2,1,30996,1},0},
			{"Th×t Nguéi",1,{2,1,30586,1},0},
			{"Th×t R¾n",1,{2,1,30995,1},0},
			{"§ïi Heo Th¬m Ngon",1,{2,1,30838,1},0},
			{"§ïi n­íng",1,{2,1,1137,1},0},
			{"§ïi v×t",1,{2,1,30128,1},0},
			{"Trøng V×t",1,{2,1,30989,1},0},
			{"Ch©n gµ",1,{2,1,30127,1},0},
		}

		local nRand = GetRandByID(tb_Item_List);
		local nRet, nItemIdx = gf_AddItemEx2(tb_Item_List[nRand][3],tb_Item_List[nRand][1],"Ho¹t ®éng ThÞt N­íng","Boss Hoang Kim",tb_Item_List[nRand][4]);
	elseif nRand <= 15 then
		AddItem(2,1,30314,1) -- Vâ l©m b¸o míi
	else
		ModifyExp(nExp);
		Msg2Player("B¹n nhËn ®­îc "..nExp.." Kinh nghiÖm");
	end
	
	AddItem(1,1,5,1) -- Banh bao thit
	
	-- ruou
	if nRand <= 25 then
		AddItem(1,1,10,1)
	elseif nRand <= 50 then
		AddItem(1,1,11,1)
	elseif nRand <= 75 then
		AddItem(1,1,12,1)
	else
		AddItem(1,1,13,1)
	end
	
	-- doi SPACING_TIME gi©y míi cã thÓ ¨n ®­îc n÷a	
	local szNPCName = GetNpcName(nSelfIndex);
	StartTimeGuage(szNPCName,SPACING_TIME,0,1) --StartTimeGuage("ThÞt N­íng",45,0,1)	
	
		
	if GetTask(TSK_THONUONG_ACCEPT) == 1 then
		set_task_thonuong(BYTE_COUNT_COLLECT, get_task_thonuong(BYTE_COUNT_COLLECT) + 1)
		Msg2Player("Thu thËp ThÞt N­íng "..get_task_thonuong(BYTE_COUNT_COLLECT).."/20")
		if get_task_thonuong(BYTE_COUNT_COLLECT) == 20 then
			SetTask(TSK_THONUONG_ACCEPT,2)
			-- PhÇn th­ëng B¹ch Tiªn Sinh
			BachTienSinh_Award();
			ThitNuong_NhanThuong()		--function BachTienSinh_Award sÏ chuyÓn vµo function nµy
			TaskTip("Hoµn thµnh nhiÖm vô thu thËp ThÞt N­íng. Mau vÒ b¸o cho B¹ch Tiªn Sinh")
		end	
	end		
end