--ÕòÔ¶ïÚ¾ÖïÚÍ·
Include("\\script\\lib\\npccmdhead.lua")
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\lib\\message.lua");
Include("\\script\\class\\ktabfile.lua");
Include("\\script\\missions\\yp\\award.lua");

TABLE_YunBiao = new(KTabFile,"\\settings\\task\\yunbiao.txt");

g_NpcName = "<color=green>Tiªu §Çu TrÊn ViÔn Tiªu Côc<color>: "

T1 = {};
T2 = {};
T3 = {};
T4 = {};
T5 = {};
T6 = {};

T1.msg = g_NpcName.."Ta lµ tæng tiªu ®Çu cña TrÊn ViÔn Tiªu Côc, h»ng ngµy ta sÏ cho 3 lÇn nhiÖm vô vËn tiªu, ®¹i hiÖp ®ång ı gióp ®ì kh«ng?";
T1.sel = {
	{"Giíi thiÖu vËn tiªu",T2},
	{"NhËn Tiªu Xa (Ngµy 3 lÇn)",T3},
	{"Ta muèn mua b¶o hiÓm",T4},
	{"NhiÖm vô c­íp tiªu (Ngµy 1 lÇn)",T5},
	{"Mua TrÊn ViÔn Ho¸n Tiªu LÖnh",T6},
	{"KÕt thóc ®èi tho¹i","nothing"},
};

T2.msg = g_NpcName.."§¹i hiÖp muèn t×m hiÓu th«ng tin g×?";
T2.sel = {
	{"H­íng dÉn vËn tiªu","#bt_Talk_1(1)"},
	{"Thêi gian x2 vËn tiªu","#bt_Talk_1(2)"},
	{"Mua b¶o hiÓm Tiªu Xa","#bt_Talk_1(3)"},
	{"NhiÖm vô c­íp tiªu","#bt_Talk_1(4)"},
	{"PhÇn th­ëng Tiªu Xa","bt_Talk_8"},
	{"trë l¹i",T1},
	{"KÕt thóc ®èi tho¹i","nothing"},
};

T3.msg = g_NpcName.."§¹i hiÖp cã thÓ nhËn Tiªu Xa vËn chuyÓn ®Õn ThÊt L¹c Nhai ë chç cña ta, vËn tiªu cÇn giao nép tiÒn thÕ chÊp nhÊt ®Şnh, sau khi thµnh c«ng hoµn thµnh vËn tiªu sÏ tr¶ l¹i tiÒn thÕ chÊp. Ng­¬i muèn nhËn Tiªu Xa ngay b©y giê kh«ng?"
T3.sel = {
	{"Ta muèn nhËn Tiªu Xa","bt_Talk_2"},
	{"Ta muèn ®æi Tiªu Xa","bt_Talk_7"},
	{"trë l¹i",T1},
	{"KÕt thóc ®èi tho¹i","nothing"},		
}

T4.msg = g_NpcName.."VËn tiªu cã thÓ gÆp nguy hiÓm, ®¹i hiÖp muèn mua b¶o hiÓm cho Tiªu Xa ph¶i kh«ng? Sau khi mua b¶o hiÓm, nÕu Tiªu Xa v× nguyªn nh©n nµo ®ã mµ bŞ mÊt sÏ nhËn ®­îc phÇn th­ëng nhÊt ®Şnh."
T4.sel = {
	{"Ta muèn mua b¶o hiÓm","bt_Talk_3"},
	{"trë l¹i",T1},
	{"KÕt thóc ®èi tho¹i","nothing"},
}

T5.msg = g_NpcName.."Mçi ngµy chØ ®­îc hoµn thµnh 1 lÇn nhiÖm vô c­íp tiªu, khi hoµn thµnh nhiÖm vô sÏ c¨n cø theo tİn vËt cao cÊp nhÊt ®Ó ph¸t phÇn th­ëng!";
T5.sel = {
	{"NhËn nhiÖm vô c­íp tiªu (Tiªu hao 5 ®iÓm tinh lùc)","bt_Talk_4_1"},
	{"Hoµn thµnh nhiÖm vô c­íp tiªu","bt_Talk_5"},
	{"trë l¹i",T1},
	{"KÕt thóc ®èi tho¹i","nothing"},
}

T6.msg = g_NpcName.."N¨m x­a khi ta cßn ch­a gia nhËp TrÊn ViÔn Tiªu Côc, trong tay cã rÊt nhiÒu TrÊn ViÔn Ho¸n Tiªu LÖnh, hiÖn t¹i nh÷ng vËt nµy kh«ng cßn gi¸ trŞ ®èi víi ta n÷a, ta sÏ b¸n rÎ cho ®¹i hiÖp, 5 c¸i chØ tèn 1 vµng th«i! <color=red>Nh­ng mçi ngµy chØ cã thÓ mua 1 lÇn!<color>";
T6.sel = {
	{"Ta muèn mua 5 TrÊn ViÔn Ho¸n Tiªu LÖnh","bt_Talk_6"},
	{"trë l¹i",T1},
	{"KÕt thóc ®èi tho¹i","nothing"},
}

function main()
	temp_Talk(T1);
end

function t2_main()
	temp_Talk(T2);
end

function bt_Talk_1(nType)
	local strMsg = {
		[1] = "NhËn nhiÖm vô vËn tiªu: Ng­êi ch¬i ®· gia nhËp thÕ lùc, mçi ngµy ®Òu cã thÓ ®Õn chç <color=yellow>Tiªu §Çu TrÊn ViÔn Tiªu Côc<color> cña thÕ lùc ®Ó nhËn nhiÖm vô vËn tiªu, mçi lÇn nhËn nhiÖm vô vËn tiªu thµnh c«ng sÏ tiªu hao <color=green>15 ®iÓm tinh lùc<color>. §æi xe: Tiªu Xa bao gåm 5 lo¹i: Tiªu Xa Th­êng, Quan Träng, Qu©n Dông, C¬ MËt vµ Hoµng Gia, mçi lÇn sÏ nhËn sÏ ®­îc ngÉu nhiªn mét lo¹i Tiªu Xa, nÕu b¹n kh«ng võa ı víi Tiªu Xa võa nhËn ®­îc, cã thÓ dïng <color=yellow>TrÊn ViÔn Ho¸n Tiªu LÖnh<color> tiÕn hµnh ®æi xe. §æi xe kh«ng giíi h¹n sè lÇn vµ kh«ng tiªu hao tinh lùc. Hoµn thµnh nhiÖm vô vËn tiªu: Sau khi nhËn ®­îc Tiªu Xa, <color=yellow>trong vßng 30 phót<color> thµnh c«ng hé tèng ®Õn chç <color=yellow>Thanh H¶i Diªm Th­¬ng<color> ë ThÊt L¹c Nhai xem nh­ hoµn thµnh nhiÖm vô. Tiªu Xa bŞ hñy hoÆc v­ît qu¸ 30 phót th× sÏ nh­ nhiÖm vô vËn tiªu thÊt b¹i.",
		[2] = "<color=yellow>20:00 - 22:00<color> h»ng ngµy sÏ lµ thêi gian x2 vËn tiªu, hoµn thµnh nhiÖm vô vËn tiªu trong kho¶ng thêi gian nµy sÏ nhËn ®­îc gÊp ®«i c¸c phÇn th­ëng nhiÖm vô kh¸c (ngo¹i trõ vµng), tiÒn thÕ chÊp ®Ó nhËn Tiªu Xa kh«ng thay ®æi.",
		[3] = "Sau khi ng­êi ch¬i nhËn Tiªu Xa thµnh c«ng cã thÓ tiÕn hµnh mua b¶o hiÓm ®Ó nhËn phÇn th­ëng b¶o hiÓm, mua b¶o hiÓm cÇn giao nép mét sè tiÒn b¶o hiÓm, sau khi hoµn thµnh nhiÖm vô sÏ kh«ng hoµn tr¶ sè tiÒn nµy. Khi Tiªu Xa ®­îc mua b¶o hiÓm bŞ ph¸ hñy hoÆc bŞ hÖ thèng thu håi sÏ nhËn ®­îc phÇn th­ëng b¶o hiÓm t­¬ng øng cña Tiªu Xa ®ã <color=yellow>(ThÊp h¬n phÇn th­ëng cè ®Şnh khi hoµn thµnh nhiÖm vô)<color>. Tiªu Xa thµnh c«ng vËn chuyÓn ®Õn chç Thanh H¶i Diªm Th­¬ng sÏ kh«ng thÓ nhËn ®­îc phÇn th­ëng b¶o hiÓm!",
		[4] = "<color=yellow>20:00 - 22:00<color> h»ng ngµy, trong thêi gian x2 ho¹t ®éng vËn tiªu sÏ ®ång thêi më nhiÖm vô ®o¹t tiªu, ng­êi ch¬i cã thÓ ®Õn chç Tiªu §Çu TrÊn ViÔn Tiªu Côc nhËn nhiÖm vô ®o¹t tiªu; sau khi nhËn nhiÖm vô, tiªu hñy Tiªu Xa cña thÕ lùc kh¸c sÏ nhËn ®­îc Tİn VËt Tiªu Xa, dïng Tİn VËt Tiªu Xa cã thÓ ®Õn chç cña ta ®Ó ®æi phÇn th­ëng ®o¹t tiªu. <color=red>Chó ı: Mçi ngµy chØ ®­îc hoµn thµnh 1 lÇn nhiÖm vô ®o¹t tiªu, khi hoµn thµnh nhiÖm vô chØ c¨n cø theo Tiªu Kú cao cÊp nhËt ®Ó ph¸t phÇn th­ëng!<color>",
	};
	suTalk("t2_main",g_NpcName..strMsg[nType]);
end

function bt_Talk_2()
	local nTalkNpc = GetTargetNpc()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local m,x,y = GetNpcWorldPos(nTalkNpc);
	if g_nDebugVersion ~= 1 then
		if tMainMapID[nCamp] == nil or tMainMapID[nCamp][1] ~= m then
			Talk(1,"",g_NpcName.."§¹i hiÖp h·y ®Õn tiªu côc thuéc thÕ lùc cña m×nh ®Ó nhËn tiªu!");
			return 0;
		end
	end
	if GetTask(TASK_FIELD_PVP_CAR_START) ~= 0 then
		Talk(1,"",g_NpcName.."Tiªu Xa cña ng­¬i ®©u? H·y mau xem thö cã ph¶i bŞ mÊt råi kh«ng!");
		return 0;
	end
	if GetTask(TASK_FIELD_PVP_CAR_DAILY_NUM) >= 3 then
		Talk(1,"",g_NpcName.."H«m nay ng­¬i ®· nhËn 3 lÇn nhiÖm vô vËn tiªu, ngµy mai h·y quay l¹i!");
		return 0;
	end
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nDistance = abs(nPosX-x)+abs(nPosY-y);
	if nMapID ~= m or nDistance > 40 then
		Talk(1,"",g_NpcName.."§¹i hiÖp ch¹y qu¸ xa råi!");
		return 0;
	end
	local nRand = random(1,100);
	for i = 1,getn(tBCRand) do
		if nRand <= tBCRand[i] then
			SetTask(TASK_FIELD_PVP_CAR_RAND,i);
			break;
		end
	end
	SendScript2Client('Open("YunBiao", 1)');
	bt_Talk_2_2()
end

function bt_Talk_7()
	if GetTask(TASK_FIELD_PVP_CAR_START) == 0 then
		Talk(1,"",g_NpcName.."Ng­¬i ch­a nhËn nhiÖm vô Tiªu Xa!");
		return 0;
	end
	local nNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nNpcID = GetTask(TASK_FIELD_PVP_CAR_ID);
	local nCurNpcID = GetNpcID(nNpcIdx);
	if nNpcIdx == 0 or nNpcID ~= nCurNpcID then
		Talk(1,"",g_NpcName.."Tiªu Xa cña ng­¬i bŞ ph¸ hñy hoÆc qu¸ thêi gian vËn tiªu vÉn ch­a ®Õn ®İch, vËn tiªu thÊt b¹i!");
		SetTask(TASK_FIELD_PVP_CAR_START,0);
		SetTask(TASK_FIELD_PVP_CAR_IDX,0);
		SetTask(TASK_FIELD_PVP_CAR_ID,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFE,0);
		SetTask(TASK_FIELD_PVP_CAR_DOUBLE,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFETIME,0);
		return 0;
	end
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nNpcIdx);
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	if nMapID ~= nNpcMapID or nDistance > 16 then
		Talk(1,"",g_NpcName.."§¹i hiÖp ®· lµm mÊt Tiªu Xa råi ph¶i kh«ng, h·y mau ®i t×m nµo!")
		return 0;
	end
	SendScript2Client('Open("YunBiao", 2)');
	bt_Talk_2_1();
end

--»»ïÚ
function bt_Talk_2_1()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nMapID,nPosX,nPosY = GetWorldPos();
	if g_nDebugVersion ~= 1 then
		if tMainMapID[nCamp] == nil or tMainMapID[nCamp][1] ~= nMapID then
			return 0;
		end
	end
	if GetTask(TASK_FIELD_PVP_CAR_START) == 0 then
		Talk(1,"",g_NpcName.."Ng­¬i ch­a nhËn nhiÖm vô Tiªu Xa!");
		return 0;
	end
	local nNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nNpcID = GetTask(TASK_FIELD_PVP_CAR_ID);
	local nCurNpcID = GetNpcID(nNpcIdx);
	if nNpcIdx == 0 or nNpcID ~= nCurNpcID then
		Talk(1,"",g_NpcName.."Tiªu Xa cña ng­¬i bŞ ph¸ hñy hoÆc qu¸ thêi gian vËn tiªu vÉn ch­a ®Õn ®İch, vËn tiªu thÊt b¹i!");
		SetTask(TASK_FIELD_PVP_CAR_START,0);
		SetTask(TASK_FIELD_PVP_CAR_IDX,0);
		SetTask(TASK_FIELD_PVP_CAR_ID,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFE,0);
		SetTask(TASK_FIELD_PVP_CAR_DOUBLE,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFETIME,0);
		return 0;
	end
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nNpcIdx);
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	if nMapID ~= nNpcMapID or nDistance > 16 then
		Talk(1,"",g_NpcName.."§¹i hiÖp ®· lµm mÊt Tiªu Xa råi ph¶i kh«ng, h·y mau ®i t×m nµo!")
		return 0;
	end
	--ÒªÉ¾³ıµÀ¾ß
	if GetTask(TASK_FIELD_PVP_CAR_RAND) == 5 then
		Talk(1,"","S¶n phÈm cña hoµng thÊt, ch¾c lµ rÊt cã gi¸ trŞ!");
		return 0;
	end
	if DelItem(tPVPItemInfo[9][2],tPVPItemInfo[9][3],tPVPItemInfo[9][4],1) == 1 then
		local nPseudoRand = GetTask(TASK_FIELD_PVP_CAR_PSEUDORAND);
		SetTask(TASK_FIELD_PVP_CAR_PSEUDORAND,nPseudoRand+1);
		if nPseudoRand >= 29 then
			SetTask(TASK_FIELD_PVP_CAR_RAND,5);
		else
			local nRand = random(1,100);
			for i = 1,getn(tBCRand) do
				if nRand <= tBCRand[i] then
					SetTask(TASK_FIELD_PVP_CAR_RAND,i);
					break;
				end
			end
		end
		SetNpcLifeTime(nNpcIdx, 0);
		bt_create_biaoche();
	else
		Talk(1,"",g_NpcName.."TrÊn ViÔn Ho¸n Tiªu LÖnh trªn ng­êi kh«ng ®ñ!");
	end
end

--½ÓïÚ
function bt_Talk_2_2()
	if GetTask(TASK_FIELD_PVP_CAR_START) ~= 0 then
		Talk(1,"",g_NpcName.."Tiªu Xa cña ng­¬i ®©u? H·y mau xem thö cã ph¶i bŞ mÊt råi kh«ng!");
		return 0;
	end
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nMapID,nPosX,nPosY = GetWorldPos();
	if g_nDebugVersion ~= 1 then
		if tMainMapID[nCamp] == nil or tMainMapID[nCamp][1] ~= nMapID then
			return 0;
		end
	end
	local nDistance = abs(nPosX-tPos[nMapID].bt[1][1])+abs(nPosY-tPos[nMapID].bt[1][2]);
	if nDistance > 40 then
		return 0;
	end
	local nRand = random(1,100);
	for i = 1,getn(tBCRand) do
		if nRand <= tBCRand[i] then
			SetTask(TASK_FIELD_PVP_CAR_RAND,i);
			break;
		end
	end
	if yp_getValue(3) < 15 then
		Talk(1,"",g_NpcName.."TrŞ tinh lùc kh«ng ®ñ!");
		return 0;		
	end
	--ÒªÉ¾³ıÑº½ğ
	local nNeedCash = tonumber(TABLE_YunBiao:getCell(GetTask(TASK_FIELD_PVP_CAR_RAND)+1,2));
	if GetCash() < nNeedCash then
		Talk(1,"",g_NpcName.."Ng©n l­îng trªn ng­êi kh«ng ®ñ!");
		return 0;
	end
	if Pay(nNeedCash) == 1 then
		yp_setValue(3,-15); --¿Û¾«Á¦Öµ
		SetTask(TASK_FIELD_PVP_CAR_DAILY_NUM,GetTask(TASK_FIELD_PVP_CAR_DAILY_NUM)+1);
		bt_create_biaoche();
	end
end

function bt_create_biaoche()
	local nBCType = GetTask(TASK_FIELD_PVP_CAR_RAND);
	local nNpcIdx = CreateNpc(tBiaoChe[nBCType][1],format("%s - %s",GetName(),tBiaoChe[nBCType][2]),GetWorldPos());
	if nNpcIdx > 0 then
		local nMaxLife,nCurLife = GetUnitCurStates(nNpcIdx,1);
		local nNpcID = GetNpcID(nNpcIdx);
		SetNpcLifeTime(nNpcIdx,30*60);
		local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
		if tAllCamp[nCamp] then
			SetCampToNpc(nNpcIdx,tAllCamp[nCamp]);
		end
		g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\yp\\biaoche_npc.lua");
		SetNpcRemoveScript(nNpcIdx,"\\script\\missions\\yp\\biaoche_npc.lua");
		SetNpcTempData(nNpcIdx, 1, nBCType)
		SetTask(TASK_FIELD_PVP_CAR_START,1);
		SetTask(TASK_FIELD_PVP_CAR_IDX,nNpcIdx);
		SetTask(TASK_FIELD_PVP_CAR_ID,nNpcID);
		SetTask(TASK_FIELD_PVP_CAR_LIFE,nCurLife);
		SetTask(TASK_FIELD_PVP_CAR_LIFETIME,GetTime());
		local nHour = tonumber(date("%H"));
		if nHour >= 20 and nHour <= 21 then
			SetTask(TASK_FIELD_PVP_CAR_DOUBLE,1);
		end
		if nBCType == 5 then
			SetTask(TASK_FIELD_PVP_CAR_PSEUDORAND,0);
			local strGlb = ""
			if g_nDebugVersion == 1 then
				strGlb = "ThÊt L¹c Nhai";
			else
				strGlb = tMainMapID[nCamp][2];
			end
			Msg2Global("§¹i hiÖp "..GetName().." Tõ chç tæng tiªu ®Çu TrÊn ViÔn Tiªu Côc cña thÕ lùc "..strGlb.." nhËn thµnh c«ng 1 Tiªu Xa Hoµng Gia chøa rÊt nhiÒu kho b¸u quı hiÕm!");
		end
	end
end

function bt_Talk_3()
	if GetTask(TASK_FIELD_PVP_CAR_START) == 0 then
		Talk(1,"",g_NpcName.."§¹i hiÖp kh«ng cã Tiªu Xa nªn kh«ng thÓ mua b¶o hiÓm!");
		return 0;
	end
	local nOldNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nType = GetTask(TASK_FIELD_PVP_CAR_RAND);
	if nType == 0 then
		return 0;
	end		
	local tMoney = {2000,3000,4000,5000,6000};
	Say(g_NpcName.."HiÖn t¹i cÊp Tiªu Xa cña ®¹i hiÖp lµ <color=yellow>"..nType.."<color>, mua b¶o hiÓm cÇn tiªu hao "..gf_GetMoneyString(tMoney[nType])..".",
		2,
		"\n§ång ı mua b¶o hiÓm/bt_Talk_3_1",
		"\nKh«ng mua b¶o hiÓm/nothing")
end

function bt_Talk_3_1()
	if GetTask(TASK_FIELD_PVP_CAR_START) == 0 then
		Talk(1,"",g_NpcName.."§¹i hiÖp kh«ng cã Tiªu Xa nªn kh«ng thÓ mua b¶o hiÓm!");
		return 0;
	end
	local nOldNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nType = GetTask(TASK_FIELD_PVP_CAR_RAND);
	if nType == 0 then
		return 0;
	end	
	local tMoney = {2000,3000,4000,5000,6000};
	if GetCash() < tMoney[nType] then
		Talk(1,"",g_NpcName.."Ng©n l­îng trªn ng­êi kh«ng ®ñ!");
		return 0;
	end
	if GetTask(TASK_FIELD_PVP_CAR_TB) == nType then
		Talk(1,"",g_NpcName.."Ng­¬i ®· mua b¶o hiÓm cho Tiªu Xa nµy råi!");
		return 0;
	end
	if Pay(tMoney[nType]) == 1 then
		SetTask(TASK_FIELD_PVP_CAR_TB,nType);
		Talk(1,"",g_NpcName.."Ng­¬i mua b¶o hiÓm cho Tiªu Xa nµy!");
	end
end

function bt_Talk_4()
	local nHour = tonumber(date("%H"));
	if nHour < 20 or nHour > 21 then
		Talk(1,"",g_NpcName.."20:00-22:00 h»ng ngµy míi cã thÓ nhËn nhiÖm vô c­íp tiªu.");
		return 0;
	end 
	Say(g_NpcName.."Mçi ngµy chØ ®­îc nhËn 1 lÇn nhiÖm vô c­íp tiªu!",
		3,
		"NhËn nhiÖm vô c­íp tiªu/bt_Talk_4_1",
--		"Íê³É¶áïÚÈÎÎñ/bt_Talk_4_2",
		"trë l¹i/main",
		"KÕt thóc ®èi tho¹i/nothing")
end

function bt_Talk_4_1()
	local nHour = tonumber(date("%H"));
	if nHour < 20 or nHour > 21 then
		Talk(1,"",g_NpcName.."20:00-22:00 h»ng ngµy míi cã thÓ nhËn nhiÖm vô c­íp tiªu.");
		return 0;
	end
	if GetTask(TASK_FIELD_PVP_CAR_TASK) >= 1 then
		Talk(1,"",g_NpcName.."H«m nµy ng­¬i ®· nhËn nhiÖm vô nµy!");
		return 0;
	else
		local nJlz = yp_getValue(3);
		if nJlz < 5 then
			Talk(1,"",g_NpcName.."§iÓm tinh lùc cña ®¹i hiÖp kh«ng ®ñ!");
			return 0;
		end
		yp_setValue(3,-5);
		SetTask(TASK_FIELD_PVP_CAR_TASK,1);
		Talk(1,"",g_NpcName.."Ng­¬i ®· nhËn nhiÖm vô c­íp tiªu!");
	end
end

function bt_Talk_5()
	local nState = GetTask(TASK_FIELD_PVP_CAR_TASK);
	local nType = 0;
	if nState == 1 then --ÈÎÎñÖĞ
		Talk(1,"",g_NpcName.."H«m nay vÉn ch­a hoµn thµnh nhiÖm vô!")
	elseif nState == 2 then
		if gf_Judge_Room_Weight(1,20,"") ~= 1 then
			return 0;
		end		
		for i = 10,14 do
			if BigGetItemCount(tPVPItemInfo[i][2],tPVPItemInfo[i][3],tPVPItemInfo[i][4]) > 0 then
				if i > nType then
					nType = i;
				end
			end
		end
		if nType == 0 then
			Talk(1,"",g_NpcName.."Trªn ng­êi c¸c h¹ kh«ng cã Tiªu Kú ®· ®o¹t!");
		else
			for i = 10,14 do
				local nCount = BigGetItemCount(tPVPItemInfo[i][2],tPVPItemInfo[i][3],tPVPItemInfo[i][4]);
				if nCount > 0 then
					BigDelItem(tPVPItemInfo[i][2],tPVPItemInfo[i][3],tPVPItemInfo[i][4],nCount);
				end
			end
			SetTask(TASK_FIELD_PVP_CAR_TASK, 3);
			yp_aw_giveAward_15(nType-9);
		end
	elseif nState == 3 then
		Talk(1,"",g_NpcName.."H«m nay ng­¬i ®· hoµn thµnh nhiÖm vô råi!")
	else
		Talk(1,"",g_NpcName.."H«m nay ®¹i hiÖp vÉn ch­a nhËn nhiÖm vô c­íp tiªu ph¶i kh«ng?");
	end
end

function bt_Talk_6()
	if GetTask(TASK_FIELD_PVP_CAR_BIAOLING) ~= 0 then
		Talk(1,"",g_NpcName.."H«m nay ng­¬i ®· mua TrÊn ViÔn Ho¸n Tiªu LÖnh råi, ngµy mai h·y quay l¹i!");
		return nil;
	end
	if GetCash() < 10000 then
		Talk(1,"",g_NpcName.."Ng©n l­îng trªn ng­êi kh«ng ®ñ!");
		return nil;		
	end
	if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
		return nil;
	end 	
	if Pay(10000) == 1 then
		SetTask(TASK_FIELD_PVP_CAR_BIAOLING,1);
		gf_AddItemEx({tPVPItemInfo[9][2],tPVPItemInfo[9][3],tPVPItemInfo[9][4],5,4},tPVPItemInfo[9][1]);
	end
end

function bt_Talk_8()
	local tSay = {
		"Tiªu Xa Th­êng/#bt_Talk_8_1(1)",
		"Tiªu Xa Quan Träng/#bt_Talk_8_1(2)",
		"Tiªu Xa Qu©n Dông/#bt_Talk_8_1(3)",
		"Tiªu Xa C¬ MËt/#bt_Talk_8_1(4)",
		"Tiªu Xa Hoµng Gia/#bt_Talk_8_1(5)",
		"trë l¹i/t2_main",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say("B¹n muèn kiÓm tra phÇn th­ëng cña lo¹i Tiªu Xa nµo?", getn(tSay), tSay);
end

function bt_Talk_8_1(nType)
	local tAward = {
		--Ãû×Ö£¬¾­Ñé£¬½ğÇ®G£¬ÊÆÁ¦ÉùÍû£¬ĞŞÎª£¬»»ïÚÁî£¬×°±¸ËéÆ¬£¬Ìì½¾Áî
		[1] = {"Tiªu Xa Th­êng", 1000000, 4, 30, 0, 1, 0, 0},
		[2] = {"Tiªu Xa Quan Träng", 2000000, 8, 30, 0, 2, 0, 0},
		[3] = {"Tiªu Xa Qu©n Dông", 3500000, 15, 30, 100, 3, 0, 0},
		[4] = {"Tiªu Xa C¬ MËt", 6000000, 30, 30, 100, 4, 1, 0},
		[5] = {"Tiªu Xa Hoµng Gia", 10000000, 50, 30, 100, 5, 1, 1},
	}
	local tSubAward = tAward[nType];
	local sTitle = "<color=green>%s<color>-phÇn th­ëng:\n\n<color=yellow>%d EXP, %d vµng, danh väng thÕ lùc %d, tu vi %d, Ho¸n Tiªu LÖnh*%d, M¶nh Trang BŞ*%d, Thiªn Kiªu LÖnh*%d<color>"
	local tSay = {
		"trë l¹i/bt_Talk_8",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say(format(sTitle, tSubAward[1], tSubAward[2], tSubAward[3], tSubAward[4], tSubAward[5], tSubAward[6], tSubAward[7], tSubAward[8])
		, getn(tSay), tSay)
end