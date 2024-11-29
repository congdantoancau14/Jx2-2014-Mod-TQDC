Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

EFN_SZ_NPC_NAME="Ngò Hµnh T«n Gi¶"
CLR_SZ_NPC_NAME="<color=green>"..EFN_SZ_NPC_NAME.."<color>";
function equip_feed_OnServerStart()
	local npcIndex1 = CreateNpc("C«n L«n T©n Ch­ëng M«n", EFN_SZ_NPC_NAME, 300,1921,3576)
    SetNpcScript(npcIndex1, "\\script\\equip_feed\\equip_feed_npc.lua")
end

function main(bTag)
	return equip_feed_NpcTalkMain(bTag)
end

function equip_feed_NpcTalkMain(bTag)
	
	local szTitle = format("%s:%s", CLR_SZ_NPC_NAME, "Thiªn ®Þa khai, ngò hµnh sinh, tïy theo phong Ên cæ ®¹i më khãa d­ìng thµnh trang bÞ cuèi cïng t¸i xuÊt thÕ gian.")
	local tbSay = {}
	
	--»î¶¯
	local tID = {121}
	for i = 1, getn(tID) do
		if g_akct_ShowDialog(121, bTag) then
			return
		end
	end

	tinsert(tbSay, "Giíi thiÖu d­ìng thµnh trang bÞ/_equip_feed_desc")
	tinsert(tbSay, "Nu«i d­ìng trang bÞ d­ìng thµnh/_equip_feed_weiyang")
	tinsert(tbSay, "Trïng luyÖn trang bÞ d­ìng thµnh/_equip_feed_chongzhu")
	tinsert(tbSay, "Tinh luyÖn trang bÞ d­ìng thµnh/_equip_feed_jinglian")
	tinsert(tbSay, "V·n bèi muèn cã vò khÝ ngò hµnh/ask_materials")
	tinsert(tbSay, "Ra khái/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function get_wuxing_weapon(nWuxing)

	local nRoute	= GetPlayerRoute();
	
	local tbWeapon = {
		[2] = 	{3,58},
		[3] = 	{8,91},
		[4] = 	{0,8},
		[6] = 	{1,47},
		[8]= 	{2,21},
		[9]= 	{10,69},
		[11]=	{0,8},
		[12]=	{5,34},
		[14]=	{2,21},
		[15]=	{9,80},
		[17]=	{6,102},
		[18]=	{4,113},
		[20]=	{7,6},
		[21]=	{11,6},
		[23]=	{2,21},
		[25]=	{3,58},
		[26]=	{9,80},
		[27]=	{11,6},
		[29]=	{13,6},
		[30]=	{12,6},
		[31]=	{14,1},
		[32]=	{2,21},
	};
	
				
	local nAddResult = AddItem(0, tbWeapon[nRoute][1], tbWeapon[nRoute][2], 1,1,-1,-1,-1,-1,-1,-1,nWuxing,15);
	return nAddResult;
end

function check_materials()
	if 1 ~= gf_Judge_Room_Weight(1, 70, CLR_SZ_NPC_NAME.."Ng­¬i «m ®åm nhiÒu qu¸. Bá bít ®i kh«ng l¹i lµm r¬i vËt quý!") then
		return 0;
	end
	
	if GetItemCount(2,2,7) < 100 or GetItemCount(2,1,148) < 100 then 
		Talk(1,"",CLR_SZ_NPC_NAME..":Ng­¬i ch­a chuÈn bÞ ®ñ nguyªn liÖu th× ta ch­a thÓ chÕ luyÖn cho ng­¬i ®­îc!");
		return 0;
	else
		local nDel1 = DelItem(2,2,7,100);
		local nDel2 = DelItem(2,1,148,100);
		if nDel1 == 1 and nDel2 == 1 then 
			Say(CLR_SZ_NPC_NAME..":Cã 5 hµnh, ng­¬i chän hµnh nµo?",5,
				"Kim/#get_wuxing_weapon(1)",
				"Méc/#get_wuxing_weapon(2)",
				"Thû/#get_wuxing_weapon(3)",
				"Háa/#get_wuxing_weapon(4)",
				"Thæ/#get_wuxing_weapon(5)"
			)
		else
			print("equip_feed\\equip_feed_npc::X¶y ra lçi xãa vËt phÈm.");
			return 0;
		end
	end
	
	return 1;
end;

function ask_materials()
	Say(CLR_SZ_NPC_NAME..":HiÖn t¹i ta míi chØ cã thÓ luyÖn chÕ vò khÝ ngò hµnh cÊp 4. Nh­ng ph¶i cã ®ñ 100 m¶nh thiªn th¹ch vµ 100 m¶nh b¨ng th¹ch. Ng­¬i ®· chuÈn bÞ ®ñ ch­a?",2,
	"V·n bèi ®· chuÈn bÞ xong/check_materials",
	"Ch­a, ®Ó v·n bèi ®i chuÈn bÞ thªm/nothing")
end;

function _equip_feed_desc()
	local szTitle = format("%s:%s", CLR_SZ_NPC_NAME, "HiÖn t¹i d­ìng thµnh trang bÞ xuÊt thÕ cã Huy Ch­¬ng, ¸o Choµng vµ giµy. Khi ng­¬i nhËn ®­îc trang bÞ th× ®¼ng cÊp trang bÞ t­¬ng ®èi thÊp, nh­ng cã thÓ th«ng qua nu«i d­ìng ThiÕt Tinh hoÆc nh÷ng thø kh¸c ®Ó n©ng cÊp trang bÞ.")
	szTitle = format("%s\n%s", szTitle, "Tïy theo n©ng cÊp ®¼ng cÊp d­ìng thµnh trang bÞ, thuéc tÝnh d­ìng thµnh cña trang bÞ sÏ dÇn dÇn ph¸t triÓn, më khãa thuéc tÝnh sau khi ®¹t ®Õn trÞ sè t­¬ng øng còng sÏ më khãa.")
	local tbSay = {}

	tinsert(tbSay, "Quay l¹i /equip_feed_NpcTalkMain")
	tinsert(tbSay, "Ra khái/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_chongzhu()
	local szTitle = format("%s:%s", CLR_SZ_NPC_NAME, "Thuéc tÝnh ph¸t triÓn cña trang bÞ d­ìng thµnh cã thÓ th«ng qua TÈy T©m Th¹ch tiÕn hµnh trïng luyÖn, sau khi trïng luyÖn ®¼ng cÊp cña trang bÞ kh«ng thay ®æi, thuéc tÝnh ph¸t triÓn sÏ thay ®æi.")
	szTitle = format("%s\n%s", szTitle, "D­ìng thµnh trang bÞ cÊp sao cµng cao, cÇn cÊp ®é cña TÈy T©m Th¹ch cµng cao.")
	local tbSay = {}

	tinsert(tbSay, "Trïng luyÖn trang bÞ/_equip_feed_do_chongzhu")
	tinsert(tbSay, "Quay l¹i /equip_feed_NpcTalkMain")
	tinsert(tbSay, "Ra khái/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_jinglian()
	local szTitle = format("%s:%s", CLR_SZ_NPC_NAME, "Më khãa thuéc tÝnh cña trang bÞ d­ìng thµnh cã thÓ th«ng qua LuyÖn L« ThiÕt tiÕn hµnh tinh luyÖn, sau khi tinh luyÖn ®¼ng cÊp cña trang bÞ kh«ng thay ®æi, thuéc tÝnh më khãa sÏ thay ®æi.")
	szTitle = format("%s\n%s", szTitle, "D­ìng thµnh trang bÞ cÊp sao cµng cao, cÇn cÊp ®é cña LuyÖn L« ThiÕt cµng cao.")
	local tbSay = {}

	tinsert(tbSay, "Tinh luyÖn trang bÞ/_equip_feed_do_jinglian")
	tinsert(tbSay, "Quay l¹i /equip_feed_NpcTalkMain")
	tinsert(tbSay, "Ra khái/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_weiyang()
	local szTitle = format("%s:%s", CLR_SZ_NPC_NAME, "D­ìng thµnh trang bÞ cã thÓ th«ng qua viÖc thªm vµo d­ìng thµnh trang bÞ kh«ng dïng ®Õn hoÆc ThiÕt Tinh ®Ó n©ng cÊp.")
	szTitle = format("%s\n%s", szTitle, "D­ìng thµnh trang bÞ cÊp sao cµng cao, th× kinh nghiÖm cÇn ®Ó n©ng cÊp cµng nhiÒu")
	local tbSay = {}

	tinsert(tbSay, "Nu«i d­ìng trang bÞ/_equip_feed_do_weiyang")
	tinsert(tbSay, "Quay l¹i /equip_feed_NpcTalkMain")
	tinsert(tbSay, "Ra khái/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_do_chongzhu()
	SendScript2Client("Open([[EquipEvolution]], 2);");
end

function _equip_feed_do_jinglian()
	SendScript2Client("Open([[EquipEvolution]], 3);");
end


function _equip_feed_do_weiyang()
	SendScript2Client("Open([[CommonEnhanceItem]], 101);");
end

function nothing()
end