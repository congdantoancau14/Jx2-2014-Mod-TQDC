Include("\\script\\missions\\tong_mission\\main_function.lua");
Include("\\script\\missions\\tong_mission\\award.lua");
Include("\\script\\lib\\writelog.lua");
g_THIS_FILE = "\\script\\missions\\tong_mission\\npc\\npc_mission_entrance.lua";
g_szInfoHeader = "<color=green>Tö Quang C¸c L·o Nh©n<color>: ";
g_nSvrPlayerCount = 0;	
g_nLastCheckTime = 0;	
g_CHECKINTERVAL = 10*60;
MAX_SEL_PER_PAGE = 4;
function main()
	if GetGlbValue(GLB_CLEAR_FIELD) == 0 then
		CloseMissionEx(TONG_MISSIONEX);	
		OpenMissionEx(TONG_MISSIONEX,1);	
		TM_ClearAllFieldState();
		SetGlbValue(GLB_CLEAR_FIELD,1);
	end;
	local selTab = {
			"Chän chiÕn tr­êng Tö Quang C¸c/select_area",
			"§æi phÇn th­ëng Tö Quang C¸c/get_equip_award",
			"Ta chØ tiÖn thÓ ghÐ ngang qua th«i./nothing"
			}
	Say(g_szInfoHeader.."Tö Quang C¸c lµ c¬ ®Þa thÇn bÝ, theo truyÒn thuyÕt lµ n¬i Èn n¸u cña Kú L©n.",getn(selTab),selTab);
end;

function know_new_rule()
	Talk(1,"main",g_szInfoHeader.."Nh÷ng ng­êi ngo¹i bang cã thÓ gia nhËp víi t­ c¸ch tiÕp viÖn ®Ó gióp ®ì bæn bang v­ît ¶i, chØ cÇn ®­îc sù ®ång ý cña ®­êng chñ trë lªn lµ cã thÓ v­ît ¶i \n    Trong mét tuÇn ng­êi ch¬i v­ît ¶i lÇn ®Çu tiªn sÏ ®­îc toµn bé ®iÓm tÝch lòy, lÇn thø hai sÏ gi¶m 2/5, lÇn thø 3 gi¶m cßn 1/5, lÇn thø 4 sÏ gi¶m cßn 1/10, sau lÇn thø 5 trë ®i sÏ cßn 1/10.\n    Khi thùc lùc bang héi kh«ng ®ñ cã thÓ chän thñ c«ng bá ®i 2 bãng hé vÖ m«n ph¸i. Chøc n¨ng nµy chØ hiÖu lùc ë ¶i 1 ®Õn 4.");
end;

function know_background()
	Talk(1,"know_background2",g_szInfoHeader.."Lóc trêi ®Êt míi s¬ khai, tÊt c¶ mäi tinh hoa cña ©m d­¬ng tÝch tô thµnh thÇn thó NguyÖt Kú L©n trÊn gi÷ Th¸i H­. \nCho ®Õn lóc b¶n ®å s¬n hµ x· t¾c hiÖn th©n tiÕt lé thiªn c¬, thÇn minh næi giËn xÐ n¸t b¶n ®å, vÞ vua Tèng cao tæ b¹o bÖnh mµ chÕt. Nh©n dÞp Tø Èn Tö Quang ®i ngang nªn nhiÒu lÇn §¹i Tèng cÇu viÖn mµ kh«ng thµnh.");
end;
function know_background2()
	Talk(1,"know_background3",g_szInfoHeader.."Mét lÇn n÷a Tø Èn l¹i thay ®æi quyÕt ®Þnh vµ g¾n l¹i b¶n ®å s¬n hµ x· t¾c, kh«ng ngê r»ng viÖc nµy gióp ®ì cho Kú L©n ë Th¸i H­ håi sinh. Tø Èn thÊy kh«ng nì giÕt ®i thÇn thó nªn ®· ®em Kú L©n vÒ Tö Quang C¸c cøu ch÷a, nh­ng viÖc cøu ch÷a l¹i gióp cho thó tÝnh cña Kú L©n næi lªn. BiÕt m×nh kh«ng chèng ®ì næi ma thuËt cña Kú L©n. ChØ cßn mét c¸ch lµ nhê sù gióp ®ì cña vâ l©m trªn thiªn h¹ kh¾c chÕ Kú L©n vµ ®­a nã vÒ Th¸i H­");
end;
function know_background3()
	Talk(1,"main",g_szInfoHeader.."Kú L©n thuéc linh thó cña trêi ®Êt, søc m¹nh v« song. §Ó t×m ra ®­îc vÞ vâ sü ch©n chÝnh, Tö Quang Tø Èn ®· ®Æt c¸c ¶i thö th¸ch ®ång thêi tuyªn bè víi c¸c vÞ vâ l©m r»ng sÏ cã phÇn th­ëng ®¸p t¹ ë mçi cöa ¶i.");
end;

function know_stage_reflash()
	Talk(1,"main",g_szInfoHeader.."Mçi bang héi cã thÓ nhiÒu lÇn chiÕn ®Êu víi cöa ¶i ®ã, nh­ng chØ cã 1 c¬ héi v­ît ¶i duy nhÊt. VÝ dô: Sau khi thµnh c«ng v­ît ¶i xong, lÇn sau tiÕp tôc v­ît ¶i sÏ b¾t ®Çu ë ¶i thø 3 cho ®Õn lóc cöa ¶i thay l­ît. \nCöa ¶i sÏ thay l­ît vµo lóc 12 giê ngµy chñ nhËt, mçi tuÇn vµo 11:55 chñ nhËt tÊt c¶ ng­êi ch¬i trong ¶i sÏ bÞ c­ìng chÕ ®Èy ra ngoµi. Thêi gian ®æi l­ît sÏ lµ 10 phót, sau khi ®æi l­ît xong ng­êi ch¬i tiÕn vµo sÏ b¾t ®Çu tõ ¶i thø 1.");
end;

function know_stage_restriction()
	Talk(1,"know_stage_restriction2",g_szInfoHeader.."	KÝch ho¹t khu vùc ¶i: Mét bang héi chØ cã thÓ kÝch ho¹t ®­îc 1 khu vùc ¶i, kÝch ho¹t ph¶i do bang chñ phã bang chñ hoÆc tr­ëng l·o tæ ®éi ®ñ 8 ng­êi cÊp 75, sau ®ã nh÷ng ng­êi trong bang cã cÊp 75 trë lªn sÏ vµo theo sau. \n H¹n chÕ: Néi ®­êng vµ ngo¹i ®­êng cña ¶i tèi ®a 60 ng­êi. Néi ®­êng (khu vùc BOSS) tèi ®a chØ ®­îc 16 ng­êi, hÖ ph¸i kh«ng ®­îc qu¸ 3 ng­êi. Thêi gian chuÈn bÞ xong nÕu trong ¶i cã Ýt h¬n 8 ng­êi th× ¶i sÏ tù ®éng ®ãng cöa.");
end;
function know_stage_restriction2()
	Talk(1,"main",g_szInfoHeader.."H¹n chÕ ®æi ng­êi: Khi thêi gian BOSS ch­a ®­îc kÝch ho¹t th× ng­êi ch¬i ë néi ®­êng cã thÓ ®æi tïy thÝch, nh­ng cÇn ph¶i phï hîp ®iÒu kiÖn sè ng­êi vµ hÖ ph¸i. Sau khi BOSS ®­îc kÝch ho¹t th× mçi 2 phót míi cã thÓ ®æi ®­îc ng­êi tõ ngo¹i ®­êng vµo néi ®­êng (ph¶i phï hîp ®iÒu kiÖn sè ng­êi vµ hÖ ph¸i), v× vËy xin h·y cÈn träng ®æi ng­êi.");
end;

function know_boss_info()
	local selTab = {
				"Bãng hé vÖ/#know_boss_detail_info(0)",
				"¶i 1: Li Yªn/#know_boss_detail_info(1)",
				"¶i 2: B¸ KiÒu/#know_boss_detail_info(2)",
				"¶i 3: Phong D­¬ng, V©n Thïy/#know_boss_detail_info(3)",
				"¶i 4: §Þa HuyÒn/#know_boss_detail_info(4)",
				"¶i 5: TiÕt Hoµnh Thó/#know_boss_detail_info(5)",
				"¶i 6: Th­îng Cæ Háa Kú L©n Háa Vò, Th­îng Cæ Háa Kú L©n L­u Quang/#know_boss_detail_info(6)",
				"Ta chØ tiÖn ®­êng hái ch¬i!/nothing",
				}
	Say(g_szInfoHeader.."",getn(selTab),selTab);
end;

function know_boss_detail_info(nType)
	Talk(1,"know_boss_info",g_szInfoHeader..TB_BOSS_INFO[nType]);
end;

function select_area()
	local selTab = {};
	for i=1,MAX_AREA do
		tinsert(selTab,format("Khu vùc %d/#select_field(%d)",i,i));
	end;
	tinsert(selTab,"Trë l¹i/main");
	local nSvrPlayerCount = 0;
	if GetTime() - g_nLastCheckTime > g_CHECKINTERVAL then
		nSvrPlayerCount = gf_GetServerPlayerCount();
	end;
	local szSvrState = "";
	if nSvrPlayerCount <= 300 then
		szSvrState = " <color=green>nhá<color>";
	elseif nSvrPlayerCount <= 800 then
		szSvrState = " <color=yellow>võa<color>";
	else
		szSvrState = " <color=red>lín<color>";
	end;
	Say(g_szInfoHeader.."HiÖn t¹i nh©n khÈu thµnh thÞ nµy cã ¸p lùc:"..szSvrState..", ®Ó cho quý ®¹i hiÖp tiÕn hµnh v­ît ¶i ë tr¹ng th¸i tèt nhÊt, kiÕn nghÞ nªn chän nh÷ng thµnh phè cã l­îng ng­êi Ýt. Xin mêi chän khu vùc muèn tiÕn vµo: ",getn(selTab),selTab);
end;

function select_field(nAreaIdx)
	local selTab = {};
	local szFieldState = "";
	local nCurStage = 0;
	for i=1,MAX_FIELD do
		nMisstionState,nCurStage,szFieldState = TM_GetFieldInfo(nAreaIdx,i);
		szFieldState = sf_Replace(szFieldState,"/","-");
		szFieldState = sf_Replace(szFieldState,"|","-");
		szFieldState = sf_Replace(szFieldState,":","-");
		nCurStage = max(nCurStage,1);
		if nMisstionState == MS_STATE_IDEL then
			tinsert(selTab,format("Khu vùc %d: ®ang trèng/#enter_field(%d,%d)",i,nAreaIdx,i));
		else
			tinsert(selTab,format("Khu vùc %d: %s(¶i %d)/#enter_field(%d,%d)",i,szFieldState,nCurStage,nAreaIdx,i));
		end;
	end;
	tinsert(selTab,"Xin mêi chän khu vùc kh¸c/select_area");
	Say(g_szInfoHeader.."Xin mêi chän khu vùc mµ ®¹i hiÖp muèn vµo:",getn(selTab),selTab);
end;
--½øÈëÁ÷³ÌÒÑ¾­¸ÄµÃÂÒÆß°ËÔãÁË£¡£¡£¡£¡
function enter_field(nAreaIdx,nFieldIdx)
	if GetLevel() < MIN_LEVEL then
		Talk(1,"",g_szInfoHeader.."§¹i hiÖp ph¶i ®¹t ®Õn cÊp <color=yellow>"..MIN_LEVEL.."<color> trë lªn míi cã thÓ v­ît ¶i.");
		return 0;
	end;
	if GetTime() - GetJoinTongTime() <= MIN_JOIN_TONG_DAY*24*3600 then
		Talk(1,"",g_szInfoHeader.."Thêi gian ®¹i hiÖp nhËp bang Ýt h¬n <color=yellow>"..MIN_JOIN_TONG_DAY.."<color> ngµy, v× vËy kh«ng thÓ v­ît ¶i ®­îc.");
		return 0;
	end;
	local nTeamSize = GetTeamSize();
	local nCurFieldState,szFieldState = 0,"";
	nCurFieldState,szFieldState = TM_GetFieldInfo(nAreaIdx,nFieldIdx);
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	local nPlayerCount = mf_GetPlayerCount(MISSION_ID,ALL_CAMP,nFieldMapID);
	if nPlayerCount >= MAX_PLAYER_COUNT then
		Talk(1,"",g_szInfoHeader.."HiÖn t¹i sè ng­êi ë khu vùc nµy ®· v­ît qu¸ sè l­îng tèi ®a lµ <color=yellow>"..MAX_PLAYER_COUNT.."<color> ng­êi, xin mêi ®îi mét l¸t råi h·y vµo!");
		return 0;
	end;
	if nCurFieldState == MS_STATE_IDEL then	--Èç¹û³¡µØÎ´±»¿ªÆô
		open_mission_enter(nAreaIdx,nFieldIdx);
	else
		member_enter(nAreaIdx,nFieldIdx);
	end;	
end;
--³ÉÔ±½øÈë¹Ø¿¨
function member_enter(nAreaIdx,nFieldIdx)
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	local szTongName = mf_GetMissionS(MISSION_ID,MS_TONG_NAME,nFieldMapID);
	if GetTongName() ~= szTongName then
		Talk(1,"",g_szInfoHeader.."§¹i hiÖp kh«ng ph¶i lµ thµnh viªn cña <color=yellow>"..szTongName.."<color>, v× vËy kh«ng thÓ tïy ý vµo khu vùc nµy ®­îc. Ng­¬i cã thÓ t×m ®­êng chñ hoÆc ®­êng chñ trë lªn cña bang nµy ®Ó tæ ®éi råi tiÕn vµo.");
		return 0;
	end;
	local nCurMapID = GetWorldPos();
	local nTeamSize = GetTeamSize()
	local nOldPlayerIdx = PlayerIndex;
	if nTeamSize > 0 then	--´øÍâÔ®½øÈë
		if GetName() ~= GetCaptainName() then
			Talk(1,"",g_szInfoHeader.."B¾t buéc ph¶i ®éi tr­ëng chän khu vùc tiÕn vµo.");
			return 0;
		end;
		local nCurJob = IsTongMember();
		if nCurJob == 0 or nCurJob > 4 then
			Talk(1,"",g_szInfoHeader.."ChØ cã ®­êng chñ hoÆc chøc vô trë lªn míi cã thÓ dÉn tæ ®éi tiÕn vµo ¶i.");
			return 0;
		end;
		local bCheckSuccess = 1;
		for i=1,nTeamSize do	--¼ì²éµÈ¼¶
			PlayerIndex = GetTeamMember(i);
			if GetLevel() < MIN_LEVEL then
				gf_Msg2Team(GetName().."§¼ng cÊp kh«ng ®ñ");
				bCheckSuccess = 0;
			end;
			PlayerIndex = nOldPlayerIdx;
		end;
		if bCheckSuccess == 0 then
			Talk(1,"",g_szInfoHeader.."TÊt c¶ ng­êi ch¬i trong tæ ®éi ®Òu ph¶i cã ®¼ng cÊp yªu cÇu <color=yellow>"..MIN_LEVEL.." trë lªn<color>.");
			return 0;
		end;
		transmit_team(nCurMapID,nAreaIdx,nFieldIdx);
	else
		transmit_single(nCurMapID,nAreaIdx,nFieldIdx);
	end;
end;
--¿ªÆô¹Ø¿¨
function open_mission_enter(nAreaIdx,nFieldIdx)
	if check_tong(nAreaIdx,nFieldIdx) ~= 1 then
		return 0;
	end;
	local nCurFieldState,szFieldState = 0,"";
	nCurFieldState,szFieldState = TM_GetFieldInfo(nAreaIdx,nFieldIdx);
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	if nCurFieldState == MS_STATE_IDEL then
		if check_player_right() ~= 1 then
			return 0;
		end;
		if check_team() ~= 1 then
			Talk(1,"",g_szInfoHeader.."Trong tæ ®éi ph¶i cã ®¼ng cÊp Ýt nhÊt <color=yellow>"..MIN_TEAM_MEMBER.."c¸i"..MIN_LEVEL.." míi cã thÓ tiÕn hµnh v­ît ¶i.");
			return 0;
		end;
	end;
	SetTaskTemp(TSK_TEMP_AREA_IDX,nAreaIdx);
	SetTaskTemp(TSK_TEMP_FIELD_IDX,nFieldIdx);
	check_week(GetTongName());
end;

function check_player_right()
	if LIMIT_VERSION == 0 then
		return 1;
	end;
	if GetTeamSize() < MIN_TEAM_MEMBER then	
		Talk(1,"",g_szInfoHeader.."CÇn ph¶i cã <color=yellow>"..MIN_TEAM_MEMBER.."<color> ng­êi tæ ®éi víi nhau tiÕn hµnh kÝch ho¹t khu vùc.");
		return 0;
	end;
	if GetName() ~= GetCaptainName() then
		Talk(1,"",g_szInfoHeader.."Yªu cÇu cÇn ph¶i <color=yellow>®éi tr­ëng<color> chän kÝch ho¹t khu vùc nµo.");
		return 0;
	end;
	local nCurJob = IsTongMember();	

	if nCurJob == 0 or nCurJob > 3 then
		Talk(1,"",g_szInfoHeader.."Yªu cÇu cÇn ph¶i <color=yellow>bang chñ hoÆc phã bang chñ hoÆc tr­ëng l·o<color> dÉn tæ ®éi míi cã thÓ kÝch ho¹t khu vùc v­ît ¶i.");
		return 0;
	end;
	return 1;
end;


function check_team()
	if LIMIT_VERSION == 0 then
		return 1;
	end;
	local nTeamSize = GetTeamSize();
	if nTeamSize < MIN_TEAM_MEMBER then	--¼ì²é¶ÓÔ±ÈËÊý
		gf_Msg2Team("Tæ ®éi cã sè ng­êi kh«ng ®ñ.");
		return 0;
	end;
	local szTongName = GetTongName();	--»ñÈ¡¶Ó³¤µÄ°ï»áÃû
	local nOldPlayerIdx = PlayerIndex;
	local bCheckSuccess = 1;
	for i=1,nTeamSize do	--¼ì²éµÈ¼¶
		PlayerIndex = GetTeamMember(i);
		if GetLevel() < MIN_LEVEL then
			gf_Msg2Team(GetName().."§¼ng cÊp kh«ng ®ñ");
			bCheckSuccess = 0;
		end;
		PlayerIndex = nOldPlayerIdx;
	end;
	if bCheckSuccess == 0 then
		return 0;
	end;
	return 1;
end;
--¼ì²é°ï»áµ±Ç°¿É²»¿ÉÒÔ¼¤»î³¡µØ
function check_tong(nAreaIdx,nFieldIdx)
	if LIMIT_VERSION == 0 then
		return 1;
	end;
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	local tbCity = 
	{
		[100] = "TuyÒn Ch©u",
		[150] = "D­¬ng Ch©u",
		[200] = "BiÖn Kinh",
		[300] = "Thµnh §«",
		[350] = "T­¬ng D­¬ng",
	}
	local szTongName = mf_GetMissionS(MISSION_ID,MS_TONG_NAME,nFieldMapID);
	if GetTongName() ~= szTongName and szTongName ~= "" then	--¼ì²éÄ¿±ê³¡µØ°ï»áÊÇ·ñÎª×Ô¼ºµÄ°ï»á
		Talk(1,"",g_szInfoHeader.."HiÖn t¹i khu vùc nµy ®· ®­îc bang "..szTongName.." kÝch ho¹t, xin mêi h·y chän khu vùc kh¸c.");
		return 0;
	end;
	local nMapID,nTongAreaIdx,nTongFieldIdx = TM_GetTongFieldState(GetTongName());
	if nMapID == nCurMapID and nTongAreaIdx == nAreaIdx and nTongFieldIdx == nFieldIdx then
		return 1;	--Èç¹ûÑ¡ÔñµÄÊÇ±¾°ï»áµÄ³¡µØ
	end;
	if nMapID ~= 0 then	--¼ì²é°ï»áµ±Ç°ÊÇ·ñÒÑ¼¤»î¹Ø¿¨
		if nCurMapID == nMapID then
			Talk(1,"",g_szInfoHeader.."Quý bang ®ang ë t¹i <color=yellow>"..tbCity[nMapID].."cña thµnh cã sè hiÖu "..nTongAreaIdx.."cña khu vùc cã sè hiÖu "..nTongFieldIdx.."<color> ®· ®­îc kÝch ho¹t, xin mêi t×m khu vùc kh¸c ®Ó v­ît ¶i.");
			return 0;
		end;
		local selTab = {
					"Lµm phiÒn ng­êi qu¸./#go_to_the_city("..nMapID..")",
					"C¸m ¬n, ®Ó ta tù lµm./nothing",
					}
		Say(g_szInfoHeader.."Quý bang ®ang ë t¹i <color=yellow>"..tbCity[nMapID].."cña thµnh cã sè hiÖu "..nTongAreaIdx.."cña khu vùc cã sè hiÖu "..nTongFieldIdx.."sè hiÖu khu vùc<color> kÝch ho¹t v­ît ¶i, cã cÇn ta dÉn ®­êng kh«ng? Ta chØ thu phÝ <color=yellow>5<color> l­îng b¹c th«i.",getn(selTab),selTab);
		return 0;
	end;
	return 1;
end;

function go_to_the_city(nMapID)
	if GetCash() < 500 then
		Talk(1,"",g_szInfoHeader.."§¹i hiÖp kh«ng ®ñ sè ng©n l­îng cÇn thiÕt!");
	else
		PrePay(500);
		NewWorld(nMapID,tPos_Entrance[nMapID][1],tPos_Entrance[nMapID][2]-10);
	end;
end;
--´«ËÍÒ»¸öÍæ¼Ò
function transmit_single(nCurMapID,nAreaIdx,nFieldIdx)
	SetTaskTemp(TSK_TEMP_MAP_ID,nCurMapID);
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	WriteLogEx("Tu Quang Cac","tham gia");
	mf_JoinMission(MISSION_ID,ALL_CAMP,nFieldMapID);
end;
--´«ËÍÒ»¸ö¶ÓÎé
function transmit_team(nCurMapID,nAreaIdx,nFieldIdx)
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex
	local tbTeamMember = {};
	for i=1,nTeamSize do
		tbTeamMember[i] = GetTeamMember(i);
	end;
	for i=1,getn(tbTeamMember) do
		PlayerIndex = tbTeamMember[i];
		transmit_single(nCurMapID,nAreaIdx,nFieldIdx);
	end;
	PlayerIndex = nOldPlayerIndex
end;

function check_week(szTongName)
	ApplyRelayShareData(szTongName,0,0,g_THIS_FILE,"check_week_callback");
end;

function check_week_callback(szKey, nKey1, nKey2, nCount)
	local nCurWeek = tonumber(date("%y%W"));
	local szTongName = GetTongName();
	local nMapID = TM_GetTongFieldState(szTongName);
	--if nMapID ~= 0 then	--»Øµ÷µÄÊ±ºòÔÙ¼ì²éÒ»´Î£¬²»×÷ÌáÊ¾ÁË
		--return 0;
	--end;
	local nAreaIdx,nFieldIdx = GetTaskTemp(TSK_TEMP_AREA_IDX),GetTaskTemp(TSK_TEMP_FIELD_IDX);
	local nCurFieldState,szFieldState = TM_GetFieldInfo(nAreaIdx,nFieldIdx);
	local nWeek = GetRelayShareDataByKey(szTongName,0,0,KEY_WEEK);
	local nAttendWeek = GetRelayShareDataByKey(szTongName,0,0,KEY_ATTEND);
	if nWeek == nil then
		nWeek = 0;
	end;
	if nAttendWeek == nil then
		nAttendWeek = 0;
	end;
	gf_ShowDebugInfor("nAttendWeek:"..nAttendWeek);
	if nCurWeek > nAttendWeek then	--ÐÂµÄÒ»ÖÜ£¬Çå³ý½ø¶È
		TM_SetRelayTongData(szTongName,KEY_STAGE,"d",0);
	end;
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	local nWeekTime = tonumber(date("%w"));
	local nTime = tonumber(date("%H%M"));
	gf_ShowDebugInfor("nFieldMapID:"..nFieldMapID);
	if nCount == 0 or nCurWeek > nWeek then
		if nCurFieldState == MS_STATE_IDEL then
			--ÐÇÆÚÌìÍíÉÏ11µã5ÖÁÐÇÆÚÒ»Áè³¿0µã05·Ö
			if (nWeekTime == 0 and nTime > 2355) or (nWeekTime == 1 and nTime < 0001) then
				Talk(1,"",g_szInfoHeader.."¶i ®ang ë qu¸ tr×nh ®æi l­ît, t¹m thêi kh«ng thÓ tiÕn hµnh v­ît ¶i, xin mêi sau <color=yellow> 0 giê 01 phót<color> tiÕn hµnh v­ît ¶i.");
				return 0;
			end; 
			mf_SetMissionS(MISSION_ID,MS_TONG_NAME,szTongName,nFieldMapID);
			if mf_OpenMission(MISSION_ID,nFieldMapID) == 1 then
				mf_SetMissionV(MISSION_ID,MV_CITY_MAP_ID,nCurMapID,nFieldMapID);
				TM_SetRelayTongData(szTongName,KEY_ATTEND,"d",nCurWeek);
				TM_SetTongFieldState(nFieldMapID,szTongName);
				transmit_team(nCurMapID,nAreaIdx,nFieldIdx);
			end;
		else
			transmit_single(nCurMapID,nAreaIdx,nFieldIdx);
		end;	
	else
		Talk(1,"",g_szInfoHeader.."TuÇn nµy quý bang ®· v­ît ¶i råi, xin h·y ®îi tuÇn kÕ tiÕp!");
	end;
end;

function clear_relay_data()
	local selTab = {
				"thËt/clear_relay_data_confirm",
				"Gi¶/nothing",
				}
	Say(g_szInfoHeader.."ThËt? ",getn(selTab),selTab);
end;

function clear_relay_data_confirm()
	local szTongName = GetTongName();
	if szTongName == "" then
		Talk(1,"",g_szInfoHeader.."Ng­¬i vÉn ch­a gia nhËp bang héi!");
		return 0;
	end;
	ClearRelayShareData(szTongName,0,0,"","");
	DelRelayShareDataCopy(szTongName,0,0);
	Talk(1,"",g_szInfoHeader.."D÷ liÖu ®· dän s¹ch!	");
end;

function get_equip_award()
	local selTab = {
				"10 Háa Phông Tinh Hoa/#get_equip(1, 30000)",
				"1 Thiªn M«n Kim LÖnh/#get_equip(2, 500)",
				"1 Thiªn Cang LÖnh/#get_equip(3, 500)",
				"200 Th¸t NhÊt LÖnh/#get_equip(4, 10000)",
				--"Xem trang b~ kh¸c/get_award_use_point",
				"Tho¸t/nothing",
				}
	Say(g_szInfoHeader.."Ng­¬i hiÖn t¹i ca <color=yellow>"..GetTask(TSK_POINT).."<color> ®iÓm, ng­¬i muèn lo¹i vËt phÈm nµo d­íi ®©y?",getn(selTab),selTab);
end;

function get_equip(nType, nNeedPoint)
	local nPoint = GetTask(TSK_POINT);
	if nPoint < nNeedPoint then
		Talk(1,"",g_szInfoHeader.."§iÓm Tö Quang C¸c cña c¸c h¹ kh«ng ®ñ, ph¶i ®ñ <color=yellow>"..nNeedPoint.."<color> ®iÓm Tö Quang C¸c míi cã thÓ ®æi lo¹i  trang bÞ nµy.");
		return 0;
	end;

	if nType == 1 then
		AddItem(2,1,30770,10);
	elseif nType == 2 then
		AddItem(2,1,30370,1);
	elseif nType == 3 then
		AddItem(2,95,204,1);
	else
		AddItem(2,1,30687,250);
	end;

	SetTask(TSK_POINT,nPoint-nNeedPoint);
	Msg2Player("B¹n ®· nhËn ®­îc 1 vËt phÈm");
	WriteLogEx("Tu Quang Cac","®æi","1","VËt PhÈm");
end;


function go_to_the_city_test(nCityIdx)
	local tCityPos = 
	{
		[1] = {100,1426,3014},
		[2] = {150,1651,3174},
		[3] = {200,1381,2917},
		[4] = {300,1764,3594},
		[5] = {350,1449,3013},
	}
	NewWorld(tCityPos[nCityIdx][1],tCityPos[nCityIdx][2],tCityPos[nCityIdx][3]);
end;
