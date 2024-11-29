GET_PANGTUZI_ID = 2432
GET_PANGTUZI_TIME_ID = 2433

-- file th�t nu�ng 
Include("\\script\\online\\viet_event\\200911\\6\\head_bachtiensinh.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\vng\\award\\feature_award.lua")
--Event
Include("\\settings\\static_script\\cheat\\event\\event_init.lua");

SPACING_TIME = 15 -- th�i gian gi�n c�ch hai l�n click v�o l� nu�ng: M�c �?nh: 45 gi�y

function main()
	-- if GetTask(TSK_THONUONG_ACCEPT) ~= 1 then
		-- Talk(1, "", "B�n ch�a nh�n nhi�m v� n�n kh�ng th� tham gia b�n ti�c.");
		-- return 0
	-- end
	
	if GetLevel() < 73 then
		Talk(1,"","C�p 73 tr� l�n m�i c� th� tham gia b�n ti�c.")
		return 0
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1,"","Gia nh�p m�n ph�i m�i c� th� tham gia b�n ti�c.")
		return 0
	end
	
	local nReputation = GetReputation()
	if nReputation < 3000 then
		Talk(1,"","��t 3000 �i�m danh v�ng tr� l�n m�i c� th� tham gia b�n ti�c.")
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
	
	-- m�i nh�n v�t thu�ng th�c ��ng 180 c�i / ng�y
	if GetByte(nTaskVal,2) >= 180 then
		Talk(1,"","M�i ng�y ch� c� th� th��ng th�c 180 Th�t N��ng.")
		return 0
	end	
	
	-- ? gm ds SetTask( 2432, SetByte ( GetTask(2432) , 2 , value) )
	-- value: s� l�n �n 	
	-- ?gm ds Msg2Player(GetByte(GetTask(100),3))	
	
	
	if GetTime() - GetTask(GET_PANGTUZI_TIME_ID) < SPACING_TIME then
		Talk(1,"","B�n c�n "..GetTask(GET_PANGTUZI_TIME_ID) + SPACING_TIME - GetTime().." gi�y m�i c� th� ti�p t�c th��ng th�c Th�t N��ng.")
		return 0
	end
	
	-- �i�m danh v�ng = 0  kh�ng th� nh�n th��ng	
	if ( GetReputation() == 0 ) then
		Talk(1,"","�i�m danh v�ng kh�ng ��.")
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
			{"Th�t ba r�i",1,{2,1,30142,1},0},
			{"Th�t b�",1,{2,1,258,1},0},
			{"Th�t C� T��i",1,{2,1,30837,1},0},
			{"Th�t d�",1,{2,1,30129,1},0},
			{"Th�t d�",1,{2,1,30998,1},0},
			{"Th�t heo",1,{2,1,257,1},0},
			{"Th�t Heo Ngon",1,{2,1,31304,1},0},
			--{"Th�t l�c ��",1,{2,1,524,1},0},
			{"Th�t L�p",1,{2,1,31081,1},0},
			{"Th�t Ng�ng",1,{2,1,30996,1},0},
			{"Th�t Ngu�i",1,{2,1,30586,1},0},
			{"Th�t R�n",1,{2,1,30995,1},0},
			{"��i Heo Th�m Ngon",1,{2,1,30838,1},0},
			{"��i n��ng",1,{2,1,1137,1},0},
			{"��i v�t",1,{2,1,30128,1},0},
			{"Tr�ng V�t",1,{2,1,30989,1},0},
			{"Ch�n g�",1,{2,1,30127,1},0},
		}

		local nRand = GetRandByID(tb_Item_List);
		local nRet, nItemIdx = gf_AddItemEx2(tb_Item_List[nRand][3],tb_Item_List[nRand][1],"Ho�t ��ng Th�t N��ng","Boss Hoang Kim",tb_Item_List[nRand][4]);
	elseif nRand <= 15 then
		AddItem(2,1,30314,1) -- V� l�m b�o m�i
	else
		ModifyExp(nExp);
		Msg2Player("B�n nh�n ���c "..nExp.." Kinh nghi�m");
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
	
	-- doi SPACING_TIME gi�y m�i c� th� �n ���c n�a	
	local szNPCName = GetNpcName(nSelfIndex);
	StartTimeGuage(szNPCName,SPACING_TIME,0,1) --StartTimeGuage("Th�t N��ng",45,0,1)	
	
		
	if GetTask(TSK_THONUONG_ACCEPT) == 1 then
		set_task_thonuong(BYTE_COUNT_COLLECT, get_task_thonuong(BYTE_COUNT_COLLECT) + 1)
		Msg2Player("Thu th�p Th�t N��ng "..get_task_thonuong(BYTE_COUNT_COLLECT).."/20")
		if get_task_thonuong(BYTE_COUNT_COLLECT) == 20 then
			SetTask(TSK_THONUONG_ACCEPT,2)
			-- Ph�n th��ng B�ch Ti�n Sinh
			BachTienSinh_Award();
			ThitNuong_NhanThuong()		--function BachTienSinh_Award s� chuy�n v�o function n�y
			TaskTip("Ho�n th�nh nhi�m v� thu th�p Th�t N��ng. Mau v� b�o cho B�ch Ti�n Sinh")
		end	
	end		
end