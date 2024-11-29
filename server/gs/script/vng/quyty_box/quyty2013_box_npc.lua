
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\viet_event\\platinum_card\\platinum_head.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");

tbDieuKien = {
	[1] = {--option
		[1] = {59, "59 xu v�t ph�m"},	--tabb
		[2] = {139, "139 xu v�t ph�m"},	--cdpb
		[3] = {268, "268 xu v�t ph�m"},	--xtcv								
	},
}
function main()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
--	if GetLevel() < 86 then
--		Talk(1, "", "��i hi�p ch�a �� c�p 86 �� c� th� m� ���c r��ng !!!")
--		return
--	end
--	if gf_Check55FullSkill == 0 then
--		Talk(1, "", "��i hi�p ch�a h�c �� k� n�ng c�p 55 �� c� th� m� ���c r��ng !!!")
--		return
--	end
	local npc_index = GetTargetNpc()
	local nNPC_name = GetNpcName(npc_index)
	local nLoaiBox = 1

	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th�ng tin chi ti�t c�c ho�t ��ng ��ng ��o c� th� xem tr�n trang ch� <color=green>http://volam2.zing.vn<color>."	
	tinsert(tbSayDialog, "S� d�ng v�t ph�m Xu �� m� r��ng/#open_QuyTy_box(1,"..nLoaiBox..")")
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/dialog_over"	)
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
	
end

function open_QuyTy_box(nType, nLoaiBox)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	local npc_index = GetTargetNpc()
	local nNPC_name = GetNpcName(npc_index)
	
	if nType == 1 then
		if GetItemCount(2,1,30230) < tbDieuKien[nType][nLoaiBox][1] then
			Talk(1, "", "<color=green>"..nNPC_name.."<color>: ��i hi�p kh�ng �� "..tbDieuKien[nType][nLoaiBox][2].." �� m� r��ng.");
			return 0
		end
	end

 	if gf_Judge_Room_Weight(5,500) ~= 1 then
 		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
 		return 0
 	end	
-------------------------------------
	local box_index = GetTargetNpc()
	
	if GetUnitCurStates(box_index,2) ~= 1 or (GetTime() - GetUnitCurStates(box_index,1)) > 5 then
		SetUnitCurStates(box_index,1,GetTime())
		SetUnitCurStates(box_index,2,1)
		 gf_WriteLogEx("GIAP NGO BAO RUONG", "m� r��ng th�nh c�ng", 1, "M� r��ng option "..nType.." ,lo�i "..nNPC_name);
		 
		DoWait(28,29,1)	
		DelItem(2,1,30230, tbDieuKien[nType][nLoaiBox][1])

		if nLoaiBox == 1 then
			local nCount1 = VNG_GetTaskPos(TSK_GIAPNGO_1, 4,1)
			if nCount1< 1000 then
				VNG_SetTaskPos(TSK_GIAPNGO_1, nCount1 + 1, 4,1)
				Msg2Player("M� r��ng "..nNPC_name.." th�nh c�ng, l�n th� :"..nCount1 + 1)
			end
		end
	else
		Talk(1,"","Hi�n �� c� ng��i s� d�ng <color=red> B�o r��ng<color>.")
		return
	end
	
end

function tuyetanh_box_award()
	Msg2Player("Ph�n th��ng Tuy�t �nh")
	local tAward_QuyTy = {
				--{31, 15000, "give_weapon7()"},
				--{31, 10000, "give_weapon8()"},
				{31, 100000, "give_weapon9()"},
			}		
	gf_EventGiveRandAward(tAward_QuyTy, 100000,1,"GIAP NGO BAO RUONG","m� r��ng th�nh c�ng")	
end

function give_weapon7()
tAttribute_quyty_first = {	--tAttribute_bkl_first
					[1]  	= {41,	60, 	{{5,600}, {6,400}}},
					[2]  	= {42,	60, 	{{5,600}, {6,400}}},
					[3]  	= {49,	60, 	{{6,500}, {7,500}}},		
					[4]  	= {53,	35, 	{{6,600}, {7,400}}},
					[5] 	= {54,	35, 	{{6,600}, {7,400}}},
					[6] 	= {63,	35, 	{{5,500}, {6,450}, {7,50}}},
					[7] 	= {64,	40, 	{{5,500}, {6,450}, {7,50}}},
					[8] 	= {85,	5,	 	{{5,700}, {6,250}, {7,50}}},
					[9] 	= {86,	5,	 	{{5,700}, {6,250}, {7,50}}},
					[10] 	= {94,	75, 	{{5,300}, {6,500}, {7,200}}},
					[11] 	= {95,	75,	{{5,300}, {6,500}, {7,200}}},
					[12] 	= {96,	75, 	{{5,300}, {6,500}, {7,200}}},
					[13] 	= {97,	75, 	{{5,300}, {6,500}, {7,200}}},
					[14] 	= {98,	75, 	{{5,300}, {6,500}, {7,200}}},
					[15] 	= {102,	40, 	{{5,400}, {6,500}, {7,100}}},
					[16] 	= {111,	70, 	{{5,300}, {6,300}, {7,400}}},
					[17] 	= {252,	5,		{{3,800}, {4,150}, {5,50}}},
					[18]  	= {268,	5, 		{{4,800}, {5,150}, {6,50}}},		
					[19]  	= {277,	35,	{{3,400}, {4,400}, {5,200}}},		
					[20]  	= {278,	35,	{{3,400}, {4,400}, {5,200}}},
					[21]  	= {285,	15,	{{4,700}, {5,150}, {6,150}}},
					[22]  	= {304,	30, 	{{4,800}, {5,150}, {6,50}}},
					[23]  	= {308,	50, 	{{5,600}, {6,300}, {7,100}}},
					[24] 	= {390,	5,	 	{{3,750}, {4,200}, {5,50}}},							
			}	
	local tWeapon_quyty = { --tWeapon_bkl
				{600, "V�n Nh�n", 0, 0, 14},
				{600, "M�n Thi�n Hoa V�",	 0, 1, 53},
				{1000, "H�a Tinh", 0, 2, 36},
				{600, "C� ��nh",	0, 3, 64},
				{600, "Th�n Cung", 0,	4,	119},
				{600, "Li�t Di�m", 0, 5, 40},
				{600, "��i H�o L�i Th��ng",	0,	6, 108},
				{600, "L�ng Phong", 0, 7, 12},
				{600, "A La H�n Tr��ng", 0, 8, 97},
				{600, "Th�n H�nh",	 0, 9, 86},
				{600, "Hi Nh�n C�m", 	0,	10, 75},
				{600, "M�nh H�", 0, 11, 12},
				{1200, "Minh B�ng", 0, 12, 12},
				{1200, "Ng�c Doanh", 0, 13, 12},
		}

	local add_flag = 0
	local prize_name = ""
	local nRan_weapon = get_random_quyty(tWeapon_quyty, 10000, 1)
	local nRandomAttr = 0
	local nRandomAttrLevel = 0
	local tWeaponAttr = {{0,0}, {0,0}, {0,0}}
	local nPerTurn = 1000
	for i=1, 3 do
		nRandomAttr =get_random_attrib_quyty(tAttribute_quyty_first, nPerTurn)
		--print("gia tri random "..nRandomAttr)
		nPerTurn = nPerTurn - tAttribute_quyty_first[nRandomAttr][2]		
		nRandomAttrLevel = get_random_attrib_quyty(tAttribute_quyty_first[nRandomAttr][3],1000)
		tWeaponAttr[i][1] = tAttribute_quyty_first[nRandomAttr][3][nRandomAttrLevel][1]
		tWeaponAttr[i][2] = tAttribute_quyty_first[nRandomAttr][1]	
		tremove(tAttribute_quyty_first, nRandomAttr)
	end	
	add_flag = AddItem(tWeapon_quyty[nRan_weapon][3],tWeapon_quyty[nRan_weapon][4],tWeapon_quyty[nRan_weapon][5],1,1,tWeaponAttr[1][1],tWeaponAttr[1][2],tWeaponAttr[2][1],tWeaponAttr[2][2],tWeaponAttr[3][1],tWeaponAttr[3][2])
	prize_name = tWeapon_quyty[nRan_weapon][2]
	if add_flag == 1 then
		Msg2Player("B�n m� B�o r��ng, nh�n ���c: "..prize_name.."!")
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "M� r��ng th�nh c�ng", 1, prize_name)
	else
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "M� r��ng th�t b�i", 1, prize_name)
	end	
end
function give_weapon8()
tAttribute_quyty_first = {	--tAttribute_bkl_first
				[1]  	= {41,	60, 	{{5,600}, {6,400}}},
					[2]  	= {42,	60, 	{{5,600}, {6,400}}},
					[3]  	= {49,	60, 	{{6,500}, {7,500}}},		
					[4]  	= {53,	35, 	{{6,600}, {7,400}}},
					[5] 	= {54,	35, 	{{6,600}, {7,400}}},
					[6] 	= {63,	35, 	{{5,500}, {6,450}, {7,50}}},
					[7] 	= {64,	40, 	{{5,500}, {6,450}, {7,50}}},
					[8] 	= {85,	5,	 	{{5,700}, {6,250}, {7,50}}},
					[9] 	= {86,	5,	 	{{5,700}, {6,250}, {7,50}}},
					[10] 	= {94,	75, 	{{5,300}, {6,500}, {7,200}}},
					[11] 	= {95,	75,	{{5,300}, {6,500}, {7,200}}},
					[12] 	= {96,	75, 	{{5,300}, {6,500}, {7,200}}},
					[13] 	= {97,	75, 	{{5,300}, {6,500}, {7,200}}},
					[14] 	= {98,	75, 	{{5,300}, {6,500}, {7,200}}},
					[15] 	= {102,	40, 	{{5,400}, {6,500}, {7,100}}},
					[16] 	= {111,	70, 	{{5,300}, {6,300}, {7,400}}},
					[17] 	= {252,	5,		{{3,800}, {4,150}, {5,50}}},
					[18]  	= {268,	5, 		{{4,800}, {5,150}, {6,50}}},		
					[19]  	= {277,	35,	{{3,400}, {4,400}, {5,200}}},		
					[20]  	= {278,	35,	{{3,400}, {4,400}, {5,200}}},
					[21]  	= {285,	15,	{{4,700}, {5,150}, {6,150}}},
					[22]  	= {304,	30, 	{{4,800}, {5,150}, {6,50}}},
					[23]  	= {308,	50, 	{{5,600}, {6,300}, {7,100}}},
					[24] 	= {390,	5,	 	{{3,750}, {4,200}, {5,50}}},				
		}	
	local tWeapon_quyty = { --tWeapon_bkl
				{600, "Th�n Quy", 0, 0, 15},
				{600, "Khoa Ph�",	 0, 1, 54},
				{1000, "H�a �nh", 0, 2, 37},
				{600, "L�u C�nh",	0, 3, 65},
				{600, "Vi�n ��", 0,	4,	120},
				{600, "Ng�c Tr�", 0, 5, 41},
				{600, "C�u Long To�n K�ch",	0,	6, 109},
				{600, "B�ch Th�y", 0, 7, 13},
				{600, "M�c Ki�n Li�n Tr��ng", 0, 8, 98},
				{600, "Toan D�",	 0, 9, 87},
				{600, "��i Th�nh Di �m", 	0,	10, 76},
				{600, "V� Ng�n", 0, 11, 13},
				{1200, "X�ch Ti�u", 0, 12, 13},
				{1200, "Di T�m", 0, 13, 13},
		}

	local add_flag = 0
	local prize_name = ""
	local nRan_weapon = get_random_quyty(tWeapon_quyty, 10000, 1)
	local nRandomAttr = 0
	local nRandomAttrLevel = 0
	local tWeaponAttr = {{0,0}, {0,0}, {0,0}}
	local nPerTurn = 1000
	for i=1, 3 do
		nRandomAttr =get_random_attrib_quyty(tAttribute_quyty_first, nPerTurn)
		nPerTurn = nPerTurn - tAttribute_quyty_first[nRandomAttr][2]		
		nRandomAttrLevel = get_random_attrib_quyty(tAttribute_quyty_first[nRandomAttr][3],1000)
		tWeaponAttr[i][1] = tAttribute_quyty_first[nRandomAttr][3][nRandomAttrLevel][1]
		tWeaponAttr[i][2] = tAttribute_quyty_first[nRandomAttr][1]
		tremove(tAttribute_quyty_first, nRandomAttr)
	end	
	add_flag = AddItem(tWeapon_quyty[nRan_weapon][3],tWeapon_quyty[nRan_weapon][4],tWeapon_quyty[nRan_weapon][5],1,1,tWeaponAttr[1][1],tWeaponAttr[1][2],tWeaponAttr[2][1],tWeaponAttr[2][2],tWeaponAttr[3][1],tWeaponAttr[3][2])
	prize_name = tWeapon_quyty[nRan_weapon][2]
	if add_flag == 1 then
		Msg2Player("B�n m� B�o r��ng, nh�n ���c: "..prize_name.."!")
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "M� r��ng th�nh c�ng", 1, prize_name)
	else
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "M� r��ng th�t b�i", 1, prize_name)
	end	
end
function give_weapon9()
	 tAttribute_quyty_first = {	--tAttribute_bkl_first
					[1]  	= {41,	60, 	{{5,600}, {6,400}}},
					[2]  	= {42,	60, 	{{5,600}, {6,400}}},
					[3]  	= {49,	60, 	{{6,500}, {7,500}}},		
					[4]  	= {53,	35, 	{{6,600}, {7,400}}},
					[5] 	= {54,	35, 	{{6,600}, {7,400}}},
					[6] 	= {63,	35, 	{{5,500}, {6,450}, {7,50}}},
					[7] 	= {64,	40, 	{{5,500}, {6,450}, {7,50}}},
					[8] 	= {85,	5,	 	{{5,700}, {6,250}, {7,50}}},
					[9] 	= {86,	5,	 	{{5,700}, {6,250}, {7,50}}},
					[10] 	= {94,	75, 	{{5,300}, {6,500}, {7,200}}},
					[11] 	= {95,	75,	{{5,300}, {6,500}, {7,200}}},
					[12] 	= {96,	75, 	{{5,300}, {6,500}, {7,200}}},
					[13] 	= {97,	75, 	{{5,300}, {6,500}, {7,200}}},
					[14] 	= {98,	75, 	{{5,300}, {6,500}, {7,200}}},
					[15] 	= {102,	40, 	{{5,400}, {6,500}, {7,100}}},
					[16] 	= {111,	70, 	{{5,300}, {6,300}, {7,400}}},
					[17] 	= {252,	5,		{{3,800}, {4,150}, {5,50}}},
					[18]  	= {268,	5, 		{{4,800}, {5,150}, {6,50}}},		
					[19]  	= {277,	35,	{{3,400}, {4,400}, {5,200}}},		
					[20]  	= {278,	35,	{{3,400}, {4,400}, {5,200}}},
					[21]  	= {285,	15,	{{4,700}, {5,150}, {6,150}}},
					[22]  	= {304,	30, 	{{4,800}, {5,150}, {6,50}}},
					[23]  	= {308,	50, 	{{5,600}, {6,300}, {7,100}}},
					[24] 	= {390,	5,	 	{{3,750}, {4,200}, {5,50}}},				
		}	
	local tWeapon_quyty = { --tWeapon_bkl
				{600, "�m D��ng �n", 0, 0, 16},
				{600, "Kh�ng C�",	 0, 1, 55},
				{600, "Nha C�u", 0, 2, 38},
				{600, "Ngh�ch L�n",	0, 3, 66},
				{600, "B�t X� Chi X�", 0,	4,	121},
				{600, "Th�n Ch�m", 0, 5, 42},
				{600, "Th��ng N�",	0,	6, 110},
				{600, "Thi�n T�n", 0, 7, 14},
				{600, "D��c S� Tr��ng", 0, 8, 99},
				{600, "Th�i H�",	 0, 9, 88},
				{600, "Kh� M�c Long Ng�m", 	0,	10, 77},
				{600, "Thanh Long", 0, 11, 14},
				{600, "U�n H��ng", 0, 12, 14},
				{600, "Hoan Linh", 0, 13, 14},
		}

	local add_flag = 0
	local prize_name = ""
	local nRan_weapon = get_random_quyty(tWeapon_quyty, 10000, 1)
	local nRandomAttr = 0
	local nRandomAttrLevel = 0
	local tWeaponAttr = {{0,0}, {0,0}, {0,0}}
	local nPerTurn = 1000
	for i=1, 3 do
		nRandomAttr =get_random_attrib_quyty(tAttribute_quyty_first, nPerTurn)
		nPerTurn = nPerTurn - tAttribute_quyty_first[nRandomAttr][2]		
		nRandomAttrLevel = get_random_attrib_quyty(tAttribute_quyty_first[nRandomAttr][3],1000)
		tWeaponAttr[i][1] = tAttribute_quyty_first[nRandomAttr][3][nRandomAttrLevel][1]
		tWeaponAttr[i][2] = tAttribute_quyty_first[nRandomAttr][1]
		tremove(tAttribute_quyty_first, nRandomAttr)
	end	
	add_flag = AddItem(tWeapon_quyty[nRan_weapon][3],tWeapon_quyty[nRan_weapon][4],tWeapon_quyty[nRan_weapon][5],1,1,tWeaponAttr[1][1],tWeaponAttr[1][2],tWeaponAttr[2][1],tWeaponAttr[2][2],tWeaponAttr[3][1],tWeaponAttr[3][2])
	prize_name = tWeapon_quyty[nRan_weapon][2]
	if add_flag == 1 then
		Msg2Player("B�n m� B�o r��ng, nh�n ���c: "..prize_name.."!")
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "M� r��ng th�nh c�ng", 1, prize_name)
	else
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "M� r��ng th�t b�i", 1, prize_name)
	end	
end

function get_random_quyty(tWeapon_quyty, nMaxPE, nDefault) --get_random_bkl
	local nPos = 0;
	local nRand = random(1, nMaxPE);
	for i = 1, getn(tWeapon_quyty) do
		if nRand > nPos and nRand <= nPos + tWeapon_quyty[i][1] then
			return i;
		end
		nPos = nPos + tWeapon_quyty[i][1];
	end
	return nDefault;
end
function get_random_attrib_quyty(nTabQuyTy, nDeterminator) --get_random_attrib_bkl
	local nRandom = random(1,nDeterminator)
	local nBase = 0	
	for i=1,getn(nTabQuyTy) do
		nBase = nBase + nTabQuyTy[i][2]
		if nRandom <= nBase then
			return i			
		end
	end	
end


-- M�t t�ch cao c�p 
VET_2012_GAOJIMIJI = {
				[2] = {"Kim Cang B�t Nh� Ch�n Quy�n ", {0, 107, 204, 1}},		
				[4] = {"Ti�m Long T�c Di�t Ch�n Quy�n", {0, 107, 205, 1}},
				[3] = {"V� Tr�n B� �� Ch�n Quy�n", {0, 107, 206, 1}},		
				[6] = {"Thi�n La Li�n Ch�u Ch�n Quy�n", {0, 107, 207,1 }},		
				[8] = {"Nh� � Kim ��nh Ch�n Quy�n", {0, 107, 208, 1}},		
				[9] = {"B�ch H�i Tuy�t �m Ch�n Quy�n", {0, 107, 209, 1}},		
				[11] = {"H�n ��n Tr�n Nh�c Ch�n Quy�n", {0, 107, 210, 1}},		
				[12] = {"Qu� Thi�n Du Long Ch�n Quy�n", {0, 107, 211, 1}},		
				[14] = {"Huy�n �nh M� T�ng Ch�n Quy�n", {0, 107, 212, 1}},		
				[15] = {"Qu�n T� ��i Phong Ch�n Quy�n", {0, 107, 213, 1}},		
				[17] = {"Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n", {0, 107, 214, 1}},		
				[18] = {"Xuy�n V�n L�c H�ng Ch�n Quy�n", {0, 107, 215, 1}},		
				[20] = {"Huy�n Minh Phong Ma Ch�n Quy�n", {0, 107, 216, 1}},		
				[21] = {"Linh C� Huy�n T� Ch�n Quy�n", {0, 107, 217, 1}},		
				[23] = {"C�u Thi�n Phong L�i Ch�n Quy�n", {0, 107, 218, 1}},		
				[29] = {"H�ng Tr�n T�y M�ng Ch�n Quy�n", {0, 107, 222, 1}},		
				[30] = {"Phong Hoa Thi�n Di�p Ch�n Quy�n", {0, 107, 223, 1}},						
}

function give70GaojiMiji()
	local nRoute = GetPlayerRoute()
	gf_AddItemEx2(VET_2012_GAOJIMIJI[nRoute][2], VET_2012_GAOJIMIJI[nRoute][1], "GIAP NGO BAO RUONG BK", "nh�n ���c")	
	--gf_EventGiveRandAward(VET_2012_GAOJIMIJI,10000,1)
end

function dialog_over()

end