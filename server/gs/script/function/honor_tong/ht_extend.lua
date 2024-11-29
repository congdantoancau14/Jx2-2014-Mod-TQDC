Include("\\script\\function\\honor_tong\\ht_head.lua")

function OnUse(nItem)
	local tSay = {
		"Gäi boss thÕ giíi/AddWorldBoss",
		"TriÖu tËp boss tæng hîp/BossTongHop",
		"TriÖu håi §«ng Ph­¬ng bÊt b¹i (tan vì 1 lÖnh bµi)/"..format("#createDongPhuong(%d)",nItem),
	}
	tinsert(tSay, "T¹m ch­a triÖu tËp/nothing");
	Say("",getn(tSay),tSay);
end;

function nothing()
end;

function AddWorldBoss(nVar1)
	local map_ID,att_X,att_Y = GetWorldPos();
	
	local nNpcIndex = CreateNpc("WorldBoss_rwx", "BOSS ThÕ Giíi", map_ID, att_X, att_Y);
	SetNpcLifeTime(nNpcIndex,1000);
	--SetNpcDeathScript(nNpcIndex, );
end

function BossTongHop()
	local tSay = {}

	tinsert(tSay, format("%s/Boss_LucLam", "B¾c Lôc L©m Minh Chñ"))
	tinsert(tSay, format("%s/Boss_ThuongThan", "Th­¬ng ThÇn Doanh Thiªn"))
	tinsert(tSay, format("%s/Boss_HuongLang", "L·nh H­¬ng L¨ng"))
	tinsert(tSay, format("%s/Boss_LanHoa", "Lan Hoa"))
	tinsert(tSay, format("%s/Boss_AnhTu", "Anh Tö"))
	tinsert(tSay, format("%s/Boss_PhuThuy", "Phï thñy b¨ng gi¸"))
	tinsert(tSay, format("%s/Boss_LuongSon", "H¶o h¸n L­¬ng S¬n"))
	tinsert(tSay, format("%s/Boss_W1", "§µo Hoa §¶o Chñ Hoµng Long"))
	tinsert(tSay, format("%s/Boss_W2", "T©y Vùc Th­¬ng Lang B¸ V­¬ng"))
	tinsert(tSay, format("%s/Boss_W3", "Ngäc S¬n Chi Linh Thiªn Cöu"))
	tinsert(tSay, format("%s/Boss_W4", "U Tr¹ch Chi ¶nh Minh Vâ"))
	tinsert(tSay, format("%s/Boss_TuLinh", "Tø Linh"))
	tinsert(tSay, format("%s/Boss_NienThu", "§¹i Niªn Thó"))
	tinsert(tSay, format("%s/Boss_ThitNuong", "YÕn tiÖc ThÞt N­íng"))
	tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing");
	Say("Ng­¬i cÇn gäi boss g×?", getn(tSay), tSay);
end

function Boss_LucLam()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("S¬n TÆc §Çu Môc","B¾c Lôc L©m Minh Chñ", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("Nghe nãi minh chñ lôc l©m ®ang ë t©y TuyÒn Ch©u 191/192, ch¾c ®ang cã ©m m­u!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")

end

function Boss_ThuongThan()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("HuyÒn Vâ Th­ong","Th­¬ng ThÇn Doanh Thiªn", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("Nghe nãi thÞ vÖ th©n tÝn cña TÇn Thñy Hoµng ®ang ë t©y TuyÒn Ch©u 189/192, vâ l©m s¾p cã mét trËn hµo kiÕp!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")

end

function Boss_HuongLang()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("NghiÖt Hån","L·nh H­¬ng L¨ng", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("Nghe nãi L·nh H­¬ng L¨ng  ®ang ë t©y TuyÒn Ch©u 186/194, mau ®Õn ®ã xem thö dung nhan kiÒu diÔm cña nµng!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")

end

function Boss_LanHoa()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("lanhua_viet","Lan Hoa", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("Cã ng­êi nh×n thÊy Lan Hoa ®ang ë t©y TuyÒn Ch©u 181/190, mau ®Õn ®ã xem!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\online\\viet_event\\lanhua_boss\\lanhua_boss.lua")

end

function Boss_AnhTu()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("yingzi_viet","Anh Tö", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("Cã ng­êi nh×n thÊy Anh Tö  ®ang ë t©y TuyÒn Ch©u 179/192, mau ®Õn ®ã xem!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\online\\viet_event\\lanhua_boss\\lanhua_boss.lua")

end


function Boss_ThitNuong()

	--Msg2Global("Cã ng­êi nh×n thÊy YÕn tiÖc ThÞt N­íng ®ang ë t©y TuyÒn Ch©u 181/188, mau ®Õn tham dù!")
	local nAddX = 0
	local nAddY = 0
	local nTargetNpc = 0
	local nMap,nX,nY = GetWorldPos();			
	for i = 1, 20 do
		nAddX = random(-70, 70)
		nAddY = random(-70, 70)		
		nTargetNpc = CreateNpc("M©m cç", "ThÞt N­íng", nMap, nX + nAddX,  nY + nAddY)
		SetNpcLifeTime(nTargetNpc, 130)
		SetNpcScript(nTargetNpc, "\\script\\online\\viet_event\\200909\\2\\pangtuzi_baoguo.lua")
end

end

function Boss_PhuThuy()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIndex = 0
	local nNpcIndex = CreateNpc("Phï thñy b¨ng gi¸", "Phï thñy b¨ng gi¸", nMap, nX + 2, nY + 2);
	SetNpcLifeTime(nNpcIndex, 7200);
	SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200912\\3\\death_binglengwushi.lua");
	--Msg2Global("Cã ng­êi nh×n thÊy Phï thñy b¨ng gi¸  ®ang ë t©y TuyÒn Ch©u 192/188, mau ®Õn ®ã xem!")


end

function Boss_LuongSon()

	local nNpcIndex = 0
	local nMap,nX,nY = GetWorldPos();
	local n = gf_GetRandItemByTable(LSB_NPC_GOLD_BOSS, 1000, 1) or 1;
	local nNpcIndex = CreateNpc(LSB_NPC_GOLD_BOSS[n][1],LSB_NPC_GOLD_BOSS[n][3],  nMap, nX + 2, nY + 2);
		SetNpcLifeTime(nNpcIndex,7200);
		SetNpcDeathScript(nNpcIndex,"\\script\\online\\liangshanboss\\npc\\gld_boos_death.lua");
		SetNpcRemoveScript(nNpcIndex,"\\script\\online\\liangshanboss\\npc\\gld_boss_remove.lua");
	--Msg2Global("Cã ng­êi ph¸t hiÖn H¶o h¸n L­¬ng S¬n  ®ang ë t©y TuyÒn Ch©u 191/187, mau ®Õn ®ã xem!")

end

LSB_NPC_GOLD_BOSS = {
	{"yangxiong", 165, "BÖnh Quan S¸c D­¬ng Hïng", 30 * 60},
	{"linchong", 167, "B¸o Tö §Çu L©m Xung", 30 * 60},
	{"luzhishen", 167, "Hoa Hßa Th­îng Lç TrÝ Th©m", 30 * 60},
	{"likui", 167, "H¾c Toµn Phong Lý Quú", 30 * 60},
	{"husanliang", 167, "NhÊt Tr­îng Thanh Hæ Tam N­¬ng", 30 * 60},
	{"shixiu", 167, "Phanh MÖnh Tam Lang Th¹ch Tó", 30 * 60},
	{"CËp Thêi Vò Tèng Giang", 167, "CËp Thêi Vò Tèng Giang", 30 * 60},
	{"Tri §a Tinh Ng« Dông", 167, "Tri §a Tinh Ng« Dông", 30 * 60},
	{"Cöu V¨n Long Sö TiÕn", 167, "Cöu V¨n Long Sö TiÕn", 30 * 60},
	{"TiÓu TuyÒn Phong Sµi TiÕn", 167, "TiÓu TuyÒn Phong Sµi TiÕn", 30 * 60},
	{"§¹i §ao Quan Th¾ng", 167, "§¹i §ao Quan Th¾ng", 30 * 60},
	{"NhËp V©n Long C«ng T«n Th¾ng", 167, "NhËp V©n Long C«ng T«n Th¾ng", 30 * 60},
	{"B¸o Tö §Çu L©m Xung", 167, "B¸o Tö §Çu L©m Xung", 30 * 60},
	{"Hoa Hßa Th­îng Lç TrÝ Th©m", 167, "Hoa Hßa Th­îng Lç TrÝ Th©m", 30 * 60},
	{"Hµnh Gi¶ Vâ Tßng", 167, "Hµnh Gi¶ Vâ Tßng", 30 * 60},
	{"Tóy B¸n Tiªn Phong NhÊt Phµm", 167, "Tóy B¸n Tiªn Phong NhÊt Phµm", 30 * 60},
	{"BÖnh Quan S¸c D­¬ng Hïng", 167, "BÖnh Quan S¸c D­¬ng Hïng", 30 * 60},
	{"Phanh MÖnh Tam Lang Th¹ch Tó", 167, "Phanh MÖnh Tam Lang Th¹ch Tó", 30 * 60},
	{"NhÊt Tr­îng Thanh Hæ Tam N­¬ng", 167, "NhÊt Tr­îng Thanh Hæ Tam N­¬ng", 30 * 60},
	{"Song Th­¬ng T­íng §æng B×nh", 167, "Song Th­¬ng T­íng §æng B×nh", 30 * 60},
	{"Thanh DiÖn Thó D­¬ng TrÝ", 167, "Thanh DiÖn Thó D­¬ng TrÝ", 30 * 60},
	{"TÝch LÞch Háa TÇn Minh", 167, "TÝch LÞch Háa TÇn Minh", 30 * 60},
	{"Song Tiªn H« Diªn Ch­íc", 167, "Song Tiªn H« Diªn Ch­íc", 30 * 60},
	{"H¾c Toµn Phong Lý Quú", 167, "H¾c Toµn Phong Lý Quú", 30 * 60},
};

function Boss_W1()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
		local npcIndex = CreateNpc("WorldBoss_HL", "§µo Hoa §¶o Chñ Hoµng Long", nMap, nX + 2, nY + 2);
		SetNpcLifeTime(npcIndex, 20 * 60);
		SetNpcDeathScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_remove.lua");

end
function Boss_W2()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
		local npcIndex = CreateNpc("WorldBoss_CLBZ", "T©y Vùc Th­¬ng Lang B¸ V­¬ng", nMap, nX + 2, nY + 2);
		SetNpcLifeTime(npcIndex, 20 * 60);
		SetNpcDeathScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_remove.lua");

end
function Boss_W3()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
		local npcIndex = CreateNpc("WorldBoss_TJ", "Ngäc S¬n Chi Linh Thiªn Cöu", nMap, nX + 2, nY + 2);
		SetNpcLifeTime(npcIndex, 20 * 60);
		SetNpcDeathScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_remove.lua");

end
function Boss_W4()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
		local npcIndex = CreateNpc("WorldBoss_MW", "U Tr¹ch Chi ¶nh Minh Vâ", nMap, nX + 2, nY + 2);
		SetNpcLifeTime(npcIndex, 20 * 60);
		SetNpcDeathScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_remove.lua");

end

function Thuong_LuongSon()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
			local nNpcIdx = CreateNpc(IBbaoxiang, "R­¬ng H¶o H¸n", nMap, nX + 2, nY + 2);
			SetNpcLifeTime(nNpcIdx, 3 * 60);
			SetNpcScript(nNpcIdx,"\\script\\online\\liangshanboss\\npc\\box\\box_e.lua");

end

function Boss_TuLinh()

	local nNpcIndex = 0
	local nMap,nX,nY = GetWorldPos();
	local n = gf_GetRandItemByTable(TuLinh_BOSS_LIST, 1000, 1) or 1;
	local nNpcIndex = CreateNpc(TuLinh_BOSS_LIST[n][1],TuLinh_BOSS_LIST[n][3],  nMap, nX + 2, nY + 2);
		SetNpcLifeTime(nNpcIndex,7200);
		SetNpcDeathScript(nNpcIndex,"\\script\\online_activites\\tiaozhansilingboss\\boss\\boss_death.lua");

end

TuLinh_BOSS_LIST = {
	{"Long Tö", 165, "Long ThÇn Hãa Th©n", 30 * 60},
	{"Phông Tö", 167, "Phông ThÇn Hãa Th©n", 30 * 60},
	{"Hæ Tö", 165, "Hæ ThÇn Hãa Th©n", 30 * 60},
	{"¦ng Tö", 167, "¦ng ThÇn Hãa Th©n", 30 * 60},
}

function Boss_NienThu()

	local nNpcIndex = 0
	local nMap,nX,nY = GetWorldPos();
	local nNpcIndex = CreateNpc("§¹i Niªn Thó","ThÇn thó ngh×n n¨m",  nMap, nX + 2, nY + 2);
		SetNpcLifeTime(nNpcIndex,7200);
		SetNpcScript(nNpcIndex,"\\script\\online_activites\\2011_03\\boss\\npc\\bigboss.lua");

end




function createDongPhuong(nItem)
	local nMapId, nX, nY = GetWorldPos();
	if nMapId ~= 108 then
		Talk(1,"","H·y ®Õn B¾c TuyÒn Ch©u dïng Vâ L©m HiÖu TriÖu LÖnh triÖu håi §«ng Ph­¬ng BÊt B¹i!");
		return 0;
	end
	if GetTongDuty() ~= 1 then
		Talk(1,"","ChØ cã bang chñ míi cã thÓ dïng Vâ L©m HiÖu TriÖu LÖnh!");
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	local npcIndex = CreateNpc("§«ng Ph­¬ng BÊt B¹i", "§«ng Ph­¬ng BÊt B¹i", nMapId, nX, nY);
	if npcIndex <= 0 then
		return 0;
	end
	SetNpcLifeTime(npcIndex, 30*60);
	SetNpcDeathScript(npcIndex, "\\script\\function\\honor_tong\\ht_extend.lua");
	SetNpcTempData(npcIndex, 1, GetTongID()); --°ïÅÉ¹éÊô
	SetNpcTempData(npcIndex, 2, gf_GetTaskByte(HT_TASK_1, 2));  --ÊÇ·ñÊÇµÚÒ»Ãû°ïÅÉ
	Msg2Tong(format("Bang chñ %s ë B¾c TuyÒn Ch©u dïng Vâ L©m HiÖu TriÖu LÖnh triÖu håi BOSS §«ng Ph­¬ng BÊt B¹i, c¸c vÞ h·y nhanh chãng ®i khiªu chiÕn BOSS ®Ó nhËn phÇn th­ëng phong phó nµo!", GetName()));
end

function OnDeath(id, f, x)
	local nTargetTong = GetNpcTempData(id, 1);
	local bRankOne = GetNpcTempData(id, 2);
	local nMapID, nX, nY = GetNpcWorldPos(id);
	SetNpcLifeTime(id, 0);
	local npcIndex = CreateNpc("jinbaoxiang", "R­¬ng Vµng Bang Ph¸i", nMapID, nX, nY);
	SetNpcScript(npcIndex, "\\script\\function\\honor_tong\\ht_extend.lua");
	SetNpcLifeTime(npcIndex, 10*60);
	SetNpcTempData(npcIndex, 1, nTargetTong); --°ïÅÉ¹éÊô
	SetNpcTempData(npcIndex, 2, bRankOne);  --ÊÇ·ñÊÇµÚÒ»Ãû°ïÅÉ
end

function main()
	if gf_GetTaskByte(HT_TASK_1, 3) ~= 0 then
		Talk(1,"",format("%s ®· nhËn phÇn th­ëng r­¬ng, kh«ng thÓ nhËn l¹i!", gf_GetPlayerSexName()));
		return 0;
	end
	
	local nTargetNpc = GetTargetNpc();
	local nTargetTong = GetNpcTempData(nTargetNpc, 1);
	if nTargetTong ~= GetTongID() then
		Talk(1,"","ChØ cã thµnh viªn cña bang héi míi cã thÓ nhËn th­ëng!");
		return 0;
	end
	local nJoinTime = GetJoinTongTime();
	if nJoinTime <= 0 or GetTime() - nJoinTime < 7 * 24 * 3600 then
		Talk(1,"",HT_NPC..format("%s ch­a gia nhËp bang héi hoÆc thêi gian gia nhËp kh«ng ®ñ %d ngµy", gf_GetPlayerSexName(), 7));
		return 0;
	end
	
	if gf_CheckBaseCondition(90) ~= 1 then
		return 0;
	end
	
	if gf_Check55HaveSkill() ~= 1 then
		Talk(1,"",HT_NPC.."C¸c h¹ ch­a häc skill 55. Kh«ng thÓ nhËn th­ëng!")
		return 0;
	end
	
	local nRankone = GetNpcTempData(nTargetNpc, 2);
	local nTongDuty = GetTongDuty();
	if nTongDuty == 1 then --°ïÖ÷
		if GetNpcTempData(nTargetNpc, 3) ~= 0 then
			Talk(1,"","Bang chñ ®· nhËn th­ëng råi, kh«ng thÓ nhËn l¹i!");
			return 0;
		end
		if gf_Judge_Room_Weight(15, 100,1) ~= 1 then
			Talk(1,"",szMsgHead.."Hµnh trang cña ®¹i hiÖp kh«ng ®ñ chç trèng hoÆc søc lùc kh«ng ®ñ, xin h·y s¾p xÕp l¹i hµnh trang!");
			return 0;
		end
		gf_SetTaskByte(HT_TASK_1, 3, 1, TASK_ACCESS_CODE_HONOR_TONG);
		gf_ModifyExp(10000000);
		gf_AddItemEx2({2, 1, 1210, 3}, "B¶o r­¬ng Tµi nguyªn", "Bang Héi Vinh Danh", "R­¬ng Vµng Bang Ph¸i", 3600 * 24, 1);
		hte_RandBook();
		gf_AddItemEx2({2, 1, 30844, 1, 4}, "R­¬ng Háa Phông", "Bang Héi Vinh Danh", "R­¬ng Vµng Bang Ph¸i", 0, 1);
		if nRankone == 1 then --ÈÙÓþ°ïÖ÷
			gf_AddItemEx2({0, 105, 10112, 1, 4, -1, -1, -1, -1, -1, -1}, "Tö Ngäc Tr­êng Phong", "Bang Héi Vinh Danh", "R­¬ng Vµng Bang Ph¸i", 7*24*3600, 1);
			gf_AddItemEx2({2, 1, 1210, 5}, "B¶o r­¬ng Tµi nguyªn", "Bang Héi Vinh Danh", "R­¬ng Vµng Bang Ph¸i", 0, 1);
			for i = 1, 2 do
				hte_RandBook();
			end
			gf_AddItemEx2({2, 1, 30844, 2, 4}, "R­¬ng Háa Phông", "Bang Héi Vinh Danh", "R­¬ng Vµng Bang Ph¸i", 0, 1);
		end
		SetNpcTempData(nTargetNpc, 3, 1); --±ê¼Ç°ïÖ÷ÒÑÁì
	else --°ïÖÚ
		gf_SetTaskByte(HT_TASK_1, 3, 1, TASK_ACCESS_CODE_HONOR_TONG);
		gf_ModifyExp(10000000);
		gf_EventGiveCustomAward(5, 4*60, 1, "Bang Héi Vinh Danh", "R­¬ng Vµng Bang Ph¸i");
		gf_EventGiveCustomAward(9, 4*60, 1, "Bang Héi Vinh Danh", "R­¬ng Vµng Bang Ph¸i");
		gf_EventGiveCustomAward(12, 4*60, 1, "Bang Héi Vinh Danh", "R­¬ng Vµng Bang Ph¸i");
		if nRankone == 1 then --ÈÙÓþ°ïÖÚ
			gf_ModifyExp(10000000);
			gf_EventGiveCustomAward(5, 4*60, 1, "Bang Héi Vinh Danh", "R­¬ng Vµng Bang Ph¸i");
			gf_EventGiveCustomAward(9, 4*60, 1, "Bang Héi Vinh Danh", "R­¬ng Vµng Bang Ph¸i");
			gf_EventGiveCustomAward(12, 4*60, 1, "Bang Héi Vinh Danh", "R­¬ng Vµng Bang Ph¸i");
		end
	end
end

function hte_RandBook()
	local tAward = {
		{0, 107, 30001, "Kim Cang B¸t Nh· Ch©n QuyÓn (Cao cÊp)"},
		{0, 107, 30002, "TiÒm Long Tóc DiÖt Ch©n QuyÓn (Cao cÊp)"},
		{0, 107, 30003, "V« TrÇn Bå §Ò Ch©n QuyÓn (Cao cÊp)"},
		{0, 107, 30004, "Thiªn La Liªn Ch©u Ch©n QuyÓn (Cao cÊp)"},
		{0, 107, 30005, "Nh­ ý Kim §Ønh Ch©n QuyÓn (Cao cÊp)"},
		{0, 107, 30006, "BÝch H¶i TuyÖt ¢m Ch©n QuyÓn (Cao cÊp)"},
		{0, 107, 30007, "Hçn §én TrÊn Nh¹c Ch©n QuyÓn (Cao cÊp)"},
		{0, 107, 30008, "Quú Thiªn Du Long Ch©n QuyÓn (Cao cÊp)"},
		{0, 107, 30009, "HuyÒn ¶nh Mª T«ng Ch©n QuyÓn (Cao cÊp)"},
		{0, 107, 30010, "Qu©n Tö §íi Phong Ch©n QuyÓn (Cao cÊp)"},
		{0, 107, 30011, "TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn (Cao cÊp)"},
		{0, 107, 30012, "Xuyªn V©n L¹c Hång Ch©n QuyÓn (Cao cÊp)"},
		{0, 107, 30013, "HuyÒn Minh Phong Ma Ch©n QuyÓn (Cao cÊp)"},
		{0, 107, 30014, "Linh Cæ HuyÒn Tµ Ch©n QuyÓn (Cao cÊp)"},
		{0, 107, 30015, "Cöu Thiªn Phong L«i Ch©n QuyÓn (Cao cÊp)"},
		{0, 107, 30016, "Hång TrÇn Tóy Méng Ch©n QuyÓn (Cao cÊp)"},
		{0, 107, 30017, "Phong Hoa Thiªn DiÖp Ch©n QuyÓn (Cao cÊp)"},
	}
	local nIndex = random(getn(tAward));
	gf_AddItemEx2({tAward[nIndex][1], tAward[nIndex][2], tAward[nIndex][3], 1}, tAward[nIndex][4], "Bang Héi Vinh Danh", "R­¬ng Vµng Bang Ph¸i", 0, 1);
end