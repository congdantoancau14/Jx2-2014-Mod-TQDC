Include("\\script\\newbattles\\functions.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\newbattles\\battleaward.lua");
Include("\\script\\lib\\lingshi_head.lua");

--g_sNpcName和g_nNpcCamp都是一个全局变量，它们在萧远楼和赵延年的脚本上定义

function battle_main()
	BT_NewBattleClear();
	if GetLevel() < 40 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Chi課 trng l� n琲 nguy hi觤, i ngi luy謓 t藀 th猰 m閠 th阨 gian t c蕄 <color=yellow>40<color> r錳 h穣 quay l筰!");
		return 0;
	end;
	if GetPlayerRoute() == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: V� danh ti觰 t鑤 nh� ngi m� c騨g mu鑞 tham gia cu閏 chi課 T鑞g-Li猽 �? Gia nh藀 m玭 ph竔 r錳 h穣 t輓h.");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if nDate > BT_GetData(PT_GET_EXP_AWARD_DATE) then
		BT_SetData(PT_GET_EXP_AWARD_COUNT,0);
	end;
	local nSignUpTime = BT_GetData(PT_BATTLE_DATE);	--获取玩家报名的是哪一场次的战场
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);		--获取玩家报名的情况：哪个战场，哪方
	local nBattleType = BT_GetBattleType();
	local nSongPlayerMSCount = BT_GetPlayerCount(PRIMARY_MAINBATTLE_ID,SONG_ID);
	local nLiaoPlayerMSCount = BT_GetPlayerCount(PRIMARY_MAINBATTLE_ID,LIAO_ID);
	--新选项只能加在下面第2个选项之后
	local selTab = {
			"B竜 danh "..tBattleName[PRIMARY_MAINBATTLE_ID].." [T鑞g "..nSongPlayerMSCount.." ngi]: [Li猽 "..nLiaoPlayerMSCount.." ngi]/#sign_up("..PRIMARY_MAINBATTLE_ID..")",
			"Ta mu鑞 v祇 "..tBattleName[nBattleType].." chi課 trng [T鑞g "..nSongPlayerMSCount.." ngi]: [Li猽 "..nLiaoPlayerMSCount.." ngi]/#join_battle("..nBattleType..")",
			"Ta mu鑞 nh薾 ph莕 thng chi課 trng/get_battle_award",
			"фi ph莕 thng chi課 trng/battle_regular_award",
			"Ta mu鑞 頲 hng d蒼 v� chi課 trng/get_battle_book",
			"K誸 th骳 i tho筰/nothing",
			}
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nBattleSegment = mod(nGlobalState,10);	--获取战场当前处于哪个阶段
	if nGlobalState == 0 or nBattleSegment == 1 or nBattleSegment == 2 then
		for i=1,2 do
			tremove(selTab,1);
		end;
		Say("<color=green>"..g_sNpcName.."<color>: Чi qu﹏ ch璦 xu蕋 ph竧, luy謓 t藀 m閠 th阨 gian r錳 h穣 quay l筰.",getn(selTab),selTab);
		return 0;
	end;
	if nBattleType ~= 0 and nBattleType ~= PRIMARY_MAINBATTLE_ID then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: B筺  b竜 danh tham gia chi課 trng Nh筺 M玭 quan, m阨 b筺 n n琲 b竜 danh b竜 danh Bi謓 Kinh  tham gia chi課 u.");
		return 0;
	end;
	if BT_GetCamp() == SONGLIAO_ID-g_nNpcCamp then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: N誹 ngi  ch鋘 Чi Li猽"..tCampNameZ[3-g_nNpcCamp].." ta c騨g kh玭g cng 衟. Xin b秓 tr鋘g!");
		return 0;
	end;
	local nCurRank = BT_GetCurRank();
	if nBattleSegment == 2 or nBattleSegment == 4  then	--战场进行中
		if nDate*1000+nGlobalState-1 == nSignUpTime then	--如果之前有报名
			for i=1,1 do
				tremove(selTab,1)
			end;
			Say("<color=green>"..g_sNpcName.."<color>: V祇 chi課 trng? Trc  ngi  b竜 danh tham gia <color=yellow>"..tBattleName[nBattleType].."<color>.",getn(selTab),selTab);
			return 0;			
		else	--之前没有报名	
			tremove(selTab,2);	--去掉进入战场选项
			if nCurRank >= 4 then	--先锋以上军衔可以在战场开始后继续报名
				Say("<color=green>"..g_sNpcName.."<color>: Xin ch鋘 chi課 trng mu鑞 tham gia.",getn(selTab),selTab);
			else
				Say("<color=green>"..g_sNpcName.."<color>: Th阨 gian b竜 danh  qua, b筺 c� th� ch鋘 s� d鬾g V� Song Phi Tng M藅 L謓h (Ng� C竎) ti課 h祅h b竜 danh (B� h筺 ch� s� ngi t鑙 產 v� s� ngi 2 b猲 ch猲h l謈h) ho芻 1 Qu﹏ C玭g Chng  b竜 danh (b竜 danh v� v祇 chi課 trng kh玭g b� gi韎 h筺 s� ngi).",getn(selTab),selTab);
			end;
		end;
		return 0;
	elseif nDate*1000+nGlobalState == nSignUpTime then	--在报名阶段；报过名的
		for i=1,1 do
			tremove(selTab,1)
		end;
		Say("<color=green>"..g_sNpcName.."<color>: V祇 chi課 trng? Trc  ngi  b竜 danh tham gia <color=yellow>"..tBattleName[nBattleType].."<color>.",getn(selTab),selTab);
		return 0;		
	elseif nBattleSegment == 3 then	--主战场报名中；未报过名的
		tremove(selTab,2);	--去掉进入战场选项
	end;
	Say("<color=green>"..g_sNpcName.."<color>: Xin ch鋘 chi課 trng mu鑞 tham gia.",getn(selTab),selTab);
end;

function sign_up(nBattleType)	--判断战场时间与玩家等级
	local nUpLevel,nLowLevel = 0,0;
	if IB_VERSION == 1 then
		nLowLevel,nUpLevel = 60,79;
	else
		nLowLevel,nUpLevel = 60,79;
	end;
	if GetLevel() > nUpLevel then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ъng c蕄 c馻 b筺  r蕋 cao, m阨 b筺 n Bi謓 Kinh  t譵 <color=yellow>Tri謚 Di猲 Ni猲 <color>ho芻 <color=yellow>Ti猽 Vi詎 L﹗<color>b竜 danh tham gia chi課 trng Nh筺 M玭 quan. ");
		return 0;
	end;
	if GetLevel() < nLowLevel then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: ch璦 t c蕄 "..nLowLevel.." (c蕄) kh玭g th� tham gia Chi課 trng Ng鋍 M玭 quan.");
		return 0;
	end;
	local nCurMapID = GetWorldPos();
	local nLevel = GetLevel();
	local nBattleMapID = BT_GetBattleMapID(nCurMapID,nBattleType);
	local nCurCamp = BT_GetCurCamp();
	local nCurRank = BT_GetCurRank();
	local szBattleName = tostring(tBattleName[nBattleType]);
	if BT_GetData(PT_LAST_CAMP) ~= 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ngi ch璦 nh薾 ph莕 thng l莕 trc.");
		return 0;
	end;
	if GetPKValue() >= 4 then	--红名不能进战场
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: T閕 竎 t祔 tr阨 kh玭g th� tham gia chi課 trng!");
		return 0;
	end;
	if nBattleType == RESOURCE_ID then	--如果是草谷场
		local nNeedLevel = 0;
		if IB_VERSION == 1 then
			nNeedLevel = 85;	--免费85级
		else
			nNeedLevel = 90;	--收费90级
		end;
		if nLevel > nNeedLevel then	--大于nNeedLevel级不让参加
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: L韓 h琻 c蕄 "..nNeedLevel.." kh玭g th� b竜 danh tham gia"..szBattleName..".");
			return 0;
		end;
		if nCurRank >= 4 then	--军衔为先锋及以上（包括永久军衔）的玩家不允许进入粮草战场
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ngi ch琲 c� qu﹏ h祄 l� ti猲 phong v� l韓 h琻 (bao g錷 qu﹏ h祄 v躰h vi詎) kh玭g th� b竜 danh tham gia"..szBattleName..".");
			return 0;
		end;
	end;
	local nCamp = g_nNpcCamp;
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nGlobalState == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Чi qu﹏ ch璦 xu蕋 ph竧, luy謓 t藀 m閠 th阨 gian r錳 h穣 quay l筰.");
		return 0;
	end;
	local nBattleSegment = mod(nGlobalState,10);	--获取战场当前处于哪个阶段
	local nMaxPlayer,nPlayerDiff = 0,0;
	local nRequireLevel = 0;
	if nBattleType == VILLAGE_ID then
		if IB_VERSION == 1 then
			nRequireLevel = 60;
		else
			nRequireLevel = 70;
		end;
	elseif nBattleType == RESOURCE_ID then
		nRequireLevel = 40; 
	elseif nBattleType == EMPLACEMENT_ID then
		if IB_VERSION == 1 then
			nRequireLevel = 75;
		else
			nRequireLevel = 80;
		end;
	elseif nBattleType == MAINBATTLE_ID then
		nRequireLevel = 80;
	elseif nBattleType == PRIMARY_MAINBATTLE_ID then
		nRequireLevel = 60;
	end;
	if nLevel < nRequireLevel then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: ch璦 t c蕄 "..nRequireLevel.." kh玭g 頲 tham gia."..szBattleName..".");
		return 0;	
	end;
	local selTab = {
				"Kh玭g d飊g Qu﹏ C玭g Chng b竜 danh (ngi ch琲 qu﹏ h祄 di Ti猲 phong s� b� gi韎 h筺 s� ngi t鑙 產 v� s� ngi ch猲h l謈h)/#sign_up_confirm("..nBattleType..",0)",
				"\nTa mu鑞 d飊g 1 Qu﹏ C玭g Chng b竜 danh (kh玭g b� gi韎 h筺 s� ngi ch猲h l謈h v� s� ngi t鑙 產, tr猲 Ti猲 phong kh玭g th� s� d鬾g)/#sign_up_confirm("..nBattleType..",1)",
				"Ta suy ngh� l筰!/nothing",
				}
	if nBattleSegment == 2 or nBattleSegment == 4 then
		tremove(selTab,1);
		tinsert(selTab,1,"Ta mu鑞 s� d鬾g 1 V� Song Phi Tng M藅 L謓h b竜 danh (Ngi ch琲 qu﹏ h祄 di Ti猲 phong s� b� gi韎 h筺 s� ngi ch猲h l謈h v� s� ngi t鑙 產)/#sign_up_confirm("..nBattleType..",2)");
	end;
	local szNotice = "";
	if BT_GetData(PT_RANKPOINT) ~= 0 and nCurCamp ~= g_nNpcCamp then
		szNotice = "<color=red> B筺 tham gia phe i ch n猲 kh玭g th� nh薾 ph莕 thng kinh nghi謒 <color>. ";
	end;
	Say("<color=green>"..g_sNpcName.."<color>: <color=red> Th� c璶g s� bi課 m蕋 sau khi v祇 chi課 trng. <color>B筺 mu鑞 gia nh藀 phe <color=yellow>"..tCampNameZ[g_nNpcCamp].." kh玭g?<color>"..szNotice,getn(selTab),selTab);
end;

function sign_up_confirm(nBattleType,nSignUpType)	--判断战场时间、最大人数、最大人数差
	local nCamp = g_nNpcCamp;
	local nCurRank = BT_GetCurRank();
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	nSignUpType = nSignUpType or 0;
	if nGlobalState == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Чi qu﹏ ch璦 xu蕋 ph竧, luy謓 t藀 m閠 th阨 gian r錳 h穣 quay l筰.");
		return 0;
	end;
	if nCurRank >= 4 and nSignUpType == 1 then	--先锋以上军衔不能使用军功章
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Qu﹏ h祄 c馻 b筺 hi謓 r蕋 cao, c� th� kh玭g d飊g 頲 o c� b竜 danh.");
		return 0;
	end;
	local nBattleSegment = mod(nGlobalState,10);	--获取战场当前处于哪个阶段
	if nBattleSegment == 2 or nBattleSegment == 4 then
		if nCurRank >= 4 or nSignUpType ~= 0 then
			nGlobalState = nGlobalState - 1;	--让nGlobalState为奇数，表示是报名阶段
		else
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: Tr薾 chi課  di詎 ra nh鱪g ai ch璦 tham gia vui l遪g i tr薾 sau.");
			return 0;
		end;
	end;
	if nSignUpType == 1 then
		if DelItem(2,1,9999,1) == 1 then
			BT_SetData(PTNC_ENTER_USE_JUNGONGZHANG,nSignUpType);
			WriteLog("[Chi課 trng]:"..GetName().." d飊g 1 Qu﹏ C玭g Chng b竜 danh tham gia chi課 trng");
		else
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: B筺 c莕 <color=yellow>1 Qu﹏ C玭g Chng<color> m韎 c� th� b竜 danh.");
			return 0;
		end;
	elseif nSignUpType == 2 then
		if DelItem(2,1,9964,1) ~= 1 then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: B筺 c莕 c� <color=yellow>1 V� Song Phi Tng M藅 L謓h<color> m韎 c� th� b竜 danh.");
			return 0;
		end;
	end;
	BT_SetData(PT_SIGN_UP,nBattleType*10+nCamp);
	BT_SetData(PT_BATTLE_DATE,tonumber(date("%y%m%d"))*1000+nGlobalState);
	Talk(1,"","<color=green>"..g_sNpcName.."<color>: B筺  b竜 danh tham gia phe <color=yellow>"..tCampNameZ[nCamp].."<color>. Xin chu萵 b� ch� khai chi課! S� ngi phe");
end;

function join_battle(nBattleType)
	local nDate = tonumber(date("%y%m%d"));
	local nCurRank = BT_GetCurRank();
	local nSignUpTime = BT_GetData(PT_BATTLE_DATE);	--获取玩家报名的是哪一场战场
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);		--获取玩家报名的情况：哪个战场，哪方
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nMaxPlayer = SUB_BATTLE_MAX_PLAYER;
	local nDiffPlayerCount = SUB_BATTLE_PLAYER_DIFF;
	if nGlobalState == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Чi qu﹏ ch璦 xu蕋 ph竧, luy謓 t藀 m閠 th阨 gian r錳 h穣 quay l筰.");
		return 0;
	end;
	if nDate*1000+nGlobalState - nSignUpTime > 1 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Ngi ch璦 b竜 danh kh玭g th� tham gia chi課 trng.");
		return 0;	
	end;
	local nCurMapID = GetWorldPos();
	local nCamp = mod(nSignUpInfo,10);
	local nBattleMapID = BT_GetBattleMapID(nCurMapID,nBattleType);
	local nSongPlayerCount = mf_GetPlayerCount(tBTMSInfo[nBattleType][1],SONG_ID,nBattleMapID);
	local nLiaoPlayerCount = mf_GetPlayerCount(tBTMSInfo[nBattleType][1],LIAO_ID,nBattleMapID);
	local tPlayerCount = {nSongPlayerCount,nLiaoPlayerCount};
	if nBattleType == MAINBATTLE_ID or nBattleType == PRIMARY_MAINBATTLE_ID then
		nMaxPlayer = MAIN_BATTLE_MAX_PLAYER;
		nDiffPlayerCount = MAIN_BATTLE_PLAYER_DIFF
	end;
	if nCurRank < 4 and BT_GetData(PTNC_ENTER_USE_JUNGONGZHANG) == 0 then	--如果军衔在先锋以下并且没用军功章补报的就需要作人数上限和人数差判断
		local selTab = {
					"Ta mu鑞 d飊g Qu﹏ C玭g Chng v祇 chi課 trng/#join_battle_use_jungongzhang_confirm("..nBattleType..")",
					"\nв ta suy ngh� th猰/nothing",
					}
		if tPlayerCount[nCamp] >= nMaxPlayer then
			Say("<color=green>"..g_sNpcName.."<color>: "..tCampNameZ[nCamp].." l� <color=yellow>"..nMaxPlayer.."<color>  , "..tSexName[GetSex()].."B筺 c� th� <color=yellow>s� d鬾g Qu﹏ C玭g Chng v祇 chi課 trng<color> ho芻 i � b猲 ngo礽.",getn(selTab),selTab);
			return 0;
		end;
		if tPlayerCount[nCamp] - tPlayerCount[SONGLIAO_ID-nCamp] >= nDiffPlayerCount then
			Say("<color=green>"..g_sNpcName.."<color>: "..tCampNameZ[nCamp].."_ binh l鵦  , "..tSexName[GetSex()].."B筺 c� th� <color=yellow>s� d鬾g Qu﹏ C玭g Chng v祇 chi課 trng<color> ho芻 i b猲 ngo礽, hi謓 s� ngi 2 phe trong chi課 trng l�: <color=yellow>T鑞g ["..nSongPlayerCount.."]:["..nLiaoPlayerCount.."] Li猽<color>.",getn(selTab),selTab);
			Msg2Player("S� ngi hi謓 t筰 kho秐g "..nDiffPlayerCount);
			return 0;
		end;
	end;
	BT_SetData(PT_BATTLE_TYPE,nBattleType);	--根据nSignUpInfo也可以得到nBattleType，这里再保存一次会不会多余呢？
	mf_JoinMission(tBTMSInfo[nBattleType][1],nCamp,nBattleMapID);
end;

function join_battle_use_jungongzhang_confirm(nBattleType)
	local selTab = {
				"уng �/#join_battle_use_jungongzhang("..nBattleType..")",
				"H駓 b�/nothing",
				}
	Say("<color=green>"..g_sNpcName.."<color>: B筺 mu鑞 s� d鬾g <color=yellow>Qu﹏ C玭g Chng<color> v祇 chi課 trng?",getn(selTab),selTab);
end;

function join_battle_use_jungongzhang(nBattleType)
	if DelItem(2,1,9999,1) == 1 then
		BT_SetData(PTNC_ENTER_USE_JUNGONGZHANG,1);
	else
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: B筺 c莕 c� <color=yellow>1 Qu﹏ C玭g Chng<color> m韎 c� th� v祇 chi課 trng.");
		return 0;
	end;	
	join_battle(nBattleType);
end;

function get_battle_book()
	if GetItemCount(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4]) == 0 then
		AddItem(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4],1);
	else
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Ch糿g ph秈 ngi c� quy觧 s竎h sao?");
	end;
end;

tbJUNGONGZHANG = 
{
	[1] = {"Qu﹏ C玭g Chng",2,1,9999,2},
	[2] = {"Qu﹏ C玭g Чi",2,1,9998,5},
	[3] = {"Qu﹏ C玭g Huy Ho祅g",2,1,9977,10},
}
function get_battle_award()
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	local nCurCamp = BT_GetCurCamp();
	local nLastBattle = BT_GetData(PT_LAST_BATTLE);
	local nLastResult = BT_GetData(PT_LAST_RESULT);
	local nExpMul1,nExpMul2,nExpMul3 = 0,0,0;
	local szLastResult = "";
	if nLastCamp == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Mau 甶 tham gia chi課 trng r錳 n y l穘h thng!");
		return 0;
	end;
	if g_nNpcCamp ~= nLastCamp then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Tr薾 chi課 b筺 tham gia l� <color=yellow>"..tCampNameZ[nLastCamp].." <color>. Xin m阨 n n琲 b竜 danh l穘h thng.")
		return 0;
	end;
	if nLastResult == 0 then
		szLastResult = "K誸 qu� 2 b猲 T鑞g Li猽 h遖 nhau."
		nExpMul1,nExpMul2,nExpMul3 = 1.5,2,2.5;
	elseif nLastCamp == nLastResult then
		szLastResult = "K誸 qu�"..tCampNameZ[nLastCamp].."  th緉g.";
		nExpMul1,nExpMul2,nExpMul3 = 1.5,2,2.5;
	else
		szLastResult = "K誸 qu�"..tCampNameZ[SONGLIAO_ID-nLastCamp].."  th緉g.";
		nExpMul1,nExpMul2,nExpMul3 = 2,2.8,3.5;
	end;
	local selTab = {
	                format("Ta mu鑞 s� d鬾g qu﹏ c玭g chng (ph莕 thng qu﹏ c玭g %d, ph莕 thng kinh nghi謒*"..nExpMul1.." )/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[1][5],1),
                    format("Ta mu鑞 s� d鬾g i qu﹏ c玭g chng (ph莕 thng qu﹏ c玭g %d l莕, ph莕 thng kinh nghi謒 "..nExpMul2.." )/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[2][5],2),
                    format("Ta mu鑞 s� d鬾g Huy ho祅g qu﹏ c玭g chng (ph莕 thng qu﹏ c玭g %d l莕, ph莕 thng kinh nghi謒 "..nExpMul3.." )/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[3][5],3),
                    "Kh玭g d飊g/not_use_jungongzhang_confirm",
                    "Ch璦 mu鑞 nh薾 thng/nothing",
                    }
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	local nJunGongAward = BT_GetData(PT_JUNGONG_AWARD);
	local nExpAward = BT_GetData(PT_EXP_AWARD);
	local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
	local nCurGoldenExp = GetGoldenExp();
	local szSay = "";
	local szJunGong = "";
	local nDate = tonumber(date("%y%m%d"));
	if nLastBattle == MAINBATTLE_ID or nLastBattle == PRIMARY_MAINBATTLE_ID then
		szJunGong = "(N誹 qu﹏ c玭g nh薾 頲 <400 甶觤, d飊g Qu﹏ C玭g Chng s� t╪g i theo 400 甶觤, n誹 nh薾 qu﹏ c玭g nh薾 頲 <600 甶觤, d飊g Qu﹏ C玭g Chng v� Qu﹏ C玭g Chng huy ho祅g s� t╪g i theo 600)";
	else
		szJunGong = "(N誹 qu﹏ c玭g nh薾 頲 <200 甶觤, d飊g Qu﹏ C玭g Chng s� t╪g i theo 200 甶觤, n誹 qu﹏ c玭g nh薾 頲 <400 甶觤, d飊g Чi Qu﹏ C玭g Chng v� Huy ho祅g Qu﹏ C玭g Chng s� nh﹏ i theo 400 甶觤)";
	end;
	local szExpAward = "M鏸 ng祔 ngi ch琲 ch� c� th� nh薾 "..MAX_GET_EXP_AWARD.." l莕 ph莕 thng chi課 trng ch輓h.";
	local nGetExpAwardCount = BT_GetData(PT_GET_EXP_AWARD_COUNT);
	if nGetExpAwardCount >= MAX_GET_EXP_AWARD and (nLastBattle == MAINBATTLE_ID or nLastBattle == PRIMARY_MAINBATTLE_ID) then	--如果当天获得过经验奖励
		nExpAward = 0;
		if IB_VERSION ~= 1 then
			szExpAward = "M鏸 ng祔 ngi ch琲 ch� c� th� nh薾 "..MAX_GET_EXP_AWARD.." l莕 ph莕 thng chi課 trng ch輓h. <color=yellow>H玬 nay b筺  nh薾 "..MAX_GET_EXP_AWARD.." ph莕 thng r錳, v� v藋 kh玭g th� nh薾 n鱝<color>";
		end;
	end;
	if IB_VERSION == 1 then 	--如果是IB版本
		szExpAward = "ph莕 thng nh薾 頲 l� <color=yellow>"..nExpAward.." 甶觤<color>. ";
	else
		szExpAward = "ph莕 thng nh薾 頲 l� <color=yellow>"..nExpAward.." 甶觤<color>, t鑙 產 chuy觧 <color=yellow>"..nGoldenExpAward.." 甶觤<color> s鴆 kh醗 chuy觧 th祅h kinh nghi謒 (Hi謓 t筰 s鴆 kh醗 c馻 b筺 l� <color=yellow>"..nCurGoldenExp.."<color> 甶觤)."..szExpAward;
	end;
	if nLastCamp ~= nCurCamp then
		szExpAward = "V� b筺 tham gia phe i phng n猲 kh玭g th� nh薾 ph莕 thng.";
	end;
	szSay = "Tr薾 chi課 b筺 tham gia l莕 trc l� phe <color=yellow>"..tCampNameZ[nLastCamp].."<color>, "..szLastResult.." ph莕 thng t輈h l騳 l� <color=yellow>"..nPointAward.." 甶觤<color> t輈h l騳, <color=yellow>"..nJunGongAward.." 甶觤<color>"..szJunGong.."."..szExpAward
    Say("<color=green>"..g_sNpcName.."<color>: "..szSay,getn(selTab),selTab);
end;

function get_battle_award_confirm(nType)
	local nSpyClothTime = BT_GetData(PT_SPYCLOTH_TIME);
	local nTimePassed = GetTime() - nSpyClothTime;
	local bSpyTime = 0;	--是否在间谍装束作用效果内
	if nTimePassed <= ITEM_SPYCLOTH_TIME then
		bSpyTime = 1;
	end;
	local nCurCamp = BT_GetCurCamp();
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	if nLastCamp ~= nCurCamp and bSpyTime == 0 then
		Talk(1,"get_battle_award","<color=green>"..g_sNpcName.."<color>: B筺 tham gia chi課 trng c馻 phe i phng, kh玭g th� s� d鬾g qu﹏ c玭g chng/i qu﹏ c玭g chng/huy ho祅g chng, xin h穣 ch鋘 d遪g kh玭g s� d鬾g qu﹏ c玭g chng nh薾 ph莕 thng.");
		return 0;
	end;
	local selTab = {
				format("ng/#get_all_award(%d)",nType),
				"Sai/nothing",
				}
	Say("<color=green>"..g_sNpcName.."<color>: Ngi mu鑞 s� d鬾g <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color>?",getn(selTab),selTab);
end;

function get_all_award(nType)
	if gf_JudgeRoomWeight(1,10,"<color=green>"..g_sNpcName.."<color>: ") == 0 then
		return 0;
	end;
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	local nJunGongAward = BT_GetData(PT_JUNGONG_AWARD);
	local nExpAward = BT_GetData(PT_EXP_AWARD);
	local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	local nLastBattle = BT_GetData(PT_LAST_BATTLE);
	local nLastResult = BT_GetData(PT_LAST_RESULT);
	local nExpMul1,nExpMul2,nExpMul3 = 0,0,0;
	local nSpyClothTime = BT_GetData(PT_SPYCLOTH_TIME);
	local nTimePassed = GetTime() - nSpyClothTime;
	local bSpyTime = 0;	--是否在间谍装束作用效果内
	if nTimePassed <= ITEM_SPYCLOTH_TIME then
		bSpyTime = 1;
	end;
	local nLevel = GetLevel();
	if nType ~= 0 then
		if nLastBattle == MAINBATTLE_ID or nLastBattle == PRIMARY_MAINBATTLE_ID then
			if nType == 1 then
				nJunGongAward = max(400,nJunGongAward);
			else
				nJunGongAward = max(600,nJunGongAward);
			end;
		else
			if nType == 1 then
				nJunGongAward = max(200,nJunGongAward);
			else
				nJunGongAward = max(400,nJunGongAward);
			end;
		end;
	end;
	if nLastCamp == nLastResult or nLastResult == 0 then
		nExpMul1,nExpMul2,nExpMul3 = 1.5,2,2.5;
	else
		nExpMul1,nExpMul2,nExpMul3 = 2,2.8,3.5;
	end;
	if nType ~= 0 then
		if DelItem(tbJUNGONGZHANG[nType][2],tbJUNGONGZHANG[nType][3],tbJUNGONGZHANG[nType][4],1) == 1 then
			nJunGongAward = nJunGongAward*tbJUNGONGZHANG[nType][5];
		else
			Talk(1,"get_battle_award","<color=green>"..g_sNpcName.."<color>: Ngi kh玭g mang theo <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color> th� ph秈!");
			return 0;
		end;
	end;
	BT_SetData(PT_POINT_AWARD,0);
	BT_SetData(PT_JUNGONG_AWARD,0);
	BT_SetData(PT_EXP_AWARD,0);
	BT_SetData(PT_GOLDENEXP_AWARD,0);
	BT_SetData(PT_LAST_CAMP,0);
	BT_SetData(PT_SPYCLOTH_TIME,0);
	BT_SetData(PT_LAST_BATTLE,0);
	local nDate = tonumber(date("%y%m%d"));
	if nDate > BT_GetData(PT_GET_EXP_AWARD_DATE) then
		BT_SetData(PT_GET_EXP_AWARD_COUNT,0);
	end;
	local tbExpMultiple = --军功章的奖励翻倍倍数
	{
		[0] = 1,
		[1] = nExpMul1,
		[2] = nExpMul2,
		[3] = nExpMul3,
	};
	local nCurCamp = BT_GetCurCamp();
	local nGetExpAwardCount = BT_GetData(PT_GET_EXP_AWARD_COUNT);
	if nLastBattle ~= MAINBATTLE_ID and nLastBattle ~= PRIMARY_MAINBATTLE_ID then	--如果是小战场
		if nLastCamp == nCurCamp then
			nExpAward = floor(nExpAward*tbExpMultiple[nType]);
			ModifyExp(nExpAward);
			Msg2Player("B筺 nh薾 頲 "..nExpAward.." 甶觤 kinh nghi謒");
		else
			Msg2Player("B筺 tham gia phe i ch, v� v藋 kh玭g th� nh薾 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 頲.");
		end;
	else	--大战场奖励
		if nGetExpAwardCount < MAX_GET_EXP_AWARD then	--如果获取大战场奖励次数小于1
			if nLastCamp == nCurCamp then
				nExpAward = floor(nExpAward*tbExpMultiple[nType]);
				ModifyExp(nExpAward);
				Msg2Player("B筺 nh薾 頲 "..nExpAward.." 甶觤 kinh nghi謒");	
				BT_SetData(PT_GET_EXP_AWARD_COUNT,nGetExpAwardCount+1);
				BT_SetData(PT_GET_EXP_AWARD_DATE,nDate);
			else
				Msg2Player("B筺 tham gia phe i ch, v� v藋 kh玭g th� nh薾 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 頲.");
			end;	
		else
			Msg2Player("H玬 nay b筺  nh薾 頲 "..MAX_GET_EXP_AWARD.." l莕 nh薾 ph莕 thng kinh nghi謒, m鏸 ng祔 ch� c� th� nh薾 1 l莕"..MAX_GET_EXP_AWARD.." l莕 nh薾 ph莕 thng kinh nghi謒 i chi課 trng");
		end;
		local nLSLevel = 0;
		if nLevel <= 70 then
			nLSLevel = random(1,4);		
		elseif nLevel <= 80 then
			nLSLevel = random(1,5);
		elseif nLevel <= 100 then
			nLSLevel = random(2,5);
		end;
		if nLSLevel ~= 0 then
			lspf_AddLingShiInBottle(nLSLevel,1);
			Msg2Player("B筺 nh薾 頲 1 "..nLSLevel.." (c蕄) Linh th筩h,  cho v祇 T� Linh nh");		
		end;
	end;
	if IB_VERSION ~= 1 then	--如果是收费版本，增加健康转经验奖励
		if nLastCamp == nCurCamp then
			gf_GoldenExp2Exp(nGoldenExpAward);
		else
			Msg2Player("B筺 tham gia phe i ch, v� v藋 kh玭g th� nh薾 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 頲.");
		end;
	end;
	local nCurRankPoint = BT_GetData(PT_RANKPOINT);
	if abs(nCurRankPoint) < MAX_PRIMARY_JUNGONG or nLastBattle ~= PRIMARY_MAINBATTLE_ID then	--军功低于MAX_PRIMARY_JUNGONG时才会有军功和积分奖励
		BT_SetData(PT_TOTALPOINT,BT_GetData(PT_TOTALPOINT)+nPointAward);
		SetRankPoint(RANK_BATTLE_POINT,BATTLE_OFFSET+PT_TOTALPOINT,1);	--执行SetRankPoint会衰减军功
		Msg2Player("B筺 nh薾 頲 "..nPointAward.." 甶觤 t輈h l騳 chi課 trng");
		nCurRankPoint = BT_GetData(PT_RANKPOINT);	--获取衰减后的军功
		if bSpyTime == 1 then	--如果间谍装束有效
			if nCurCamp == LIAO_ID then
				BT_SetData(PT_RANKPOINT,nCurRankPoint-nJunGongAward);
			else
				BT_SetData(PT_RANKPOINT,nCurRankPoint+nJunGongAward);
			end;
			SetRankPoint(RANK_BATTLE_CONTRIBUTION,BATTLE_OFFSET+PT_RANKPOINT,1);
			Msg2Player("B筺 nh薾 頲 "..tCampNameZ[nCurCamp].."Phng "..nJunGongAward.." 甶觤 c玭g tr筺g");
		else
			if nLastCamp == SONG_ID then
				BT_SetData(PT_RANKPOINT,nCurRankPoint+nJunGongAward);
			else
				BT_SetData(PT_RANKPOINT,nCurRankPoint-nJunGongAward);
			end;
			SetRankPoint(RANK_BATTLE_CONTRIBUTION,BATTLE_OFFSET+PT_RANKPOINT,1);
			Msg2Player("B筺 nh薾 頲 "..tCampNameZ[nLastCamp].."Phng "..nJunGongAward.." 甶觤 c玭g tr筺g");
		end;
	else
		Msg2Player("Qu﹏ c玭g c馻 b筺  cao h琻 "..MAX_PRIMARY_JUNGONG.." 甶觤, tham gia Chi課 trng Ng鋍 M玭 quan kh玭g 頲 nh薾 qu﹏ c玭g v� ph莕 thng 甶觤 t輈h l騳.");
	end;
	WriteLog("[ph莕 thng chi課 tr薾]:"..GetName().."nh薾 l穘h ph莕 thng chi課 trng ("..nLastCamp..","..nLastBattle..","..nLastResult.."), c竎 lo筰 qu﹏ c玭g chng: "..nType..". S� qu﹏ c玭g trc: "..nCurRankPoint..", s� qu﹏ c玭g c� 頲:"..BT_GetData(PT_RANKPOINT));
end;

function not_use_jungongzhang_confirm()
	local selTab = {
				"S� d鬾g qu﹏ c玭g chng/get_battle_award",
				"Kh玭g mu鑞 d飊g qu﹏ c玭g n祇 h誸/#not_use_jungongzhang_confirm2(0)",
				}
	Say("<color=green>"..g_sNpcName.."<color>: Ngi kh玭g d飊g qu﹏ c玭g chng sao?",getn(selTab),selTab);
end;

function not_use_jungongzhang_confirm2()
	local nCurCamp = BT_GetCurCamp();
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	local nSpyClothTime = BT_GetData(PT_SPYCLOTH_TIME);
	local nTimePassed = GetTime() - nSpyClothTime;
	if nLastCamp == nCurCamp or nTimePassed <= ITEM_SPYCLOTH_TIME then	--如果参加的是本方阵营或间谍装束在有效时间内
		get_all_award(0);
		return 0;
	end;
	local selTab = {
				"уng �/#get_all_award(0)",
				"Tho竧/nothing",
				}
	if IB_VERSION == 1 then
		Say("<color=green>"..g_sNpcName.."<color>: Chi課 trng b筺 tham gia l� c馻 phe i phng, v� th� <color=red>kh玭g th� nh薾 頲 ph莕 thng kinh nghi謒<color> v� tr鵦 ti誴 nh薾 ph莕 thng ng th阨 tr� 甶觤 qu﹏ c玭g c馻 b筺, c� th� d飊g <color=yellow>Gi竛 謕 trang<color>  nh薾 qu﹏ c玭g phe m譶h. N誹 b筺 v蒼 mu鑞 nh薾 ph莕 thng h穣 ch鋘 'X竎 nh薾', n誹 b筺 mu鑞 suy ngh� th猰 h穣 ch鋘 'Tho竧 kh醝'.",getn(selTab),selTab);	
	else
		Say("<color=green>"..g_sNpcName.."<color>: Chi課 trng b筺 tham gia l� c馻 phe i phng v� th� <color=red>kh玭g th� nh薾 頲 ph莕 thng kinh nghi謒 v� ph莕 thng s鴆 kh醗 i 甶觤 kinh nghi謒<color>, v� tr鵦 ti誴 nh薾 ph莕 thng ng th阨 tr� 甶觤 qu﹏ c玭g c馻 b筺, c� th� d飊g <color=yellow>Gi竛 謕 trang<color>  nh薾 qu﹏ c玭g phe m譶h. N誹 b筺 v蒼 mu鑞 nh薾 ph莕 thng h穣 ch鋘 'X竎 nh薾', n誹 b筺 mu鑞 suy ngh� th猰 h穣 ch鋘 'Tho竧 kh醝'.",getn(selTab),selTab);	
	end;
end;

function battle_regular_award()
	local selTab = {
				"фi trang b� chi課 trng/BTA_Main",
				"Ta mu鑞 i 100000 甶觤 t輈h l騳 l蕐 H� y c馻 T祅g Ki誱 c蕄 70/want_cangjian_equip",
				"Ta mu鑞 i 30000 甶觤 t輈h l騳 l蕐 L謓h b礽 bang h閕/want_ling_pai",
				"Ta mu鑞i 1000 甶觤 t輈h l騳 l蕐 甶觤 kinh nghi謒/want_exp_award",
				"Ta mu鑞 i Tr秏 Tinh Th莕 Sa (100 甶觤 t輈h l騳 chi課 trng i 1 c竔)/want_zscs",
				"Quay l筰 n閕 dung trc./main",
				"K誸 th骳 i tho筰/nothing",
				}
	if IB_VERSION == 1 then	--IB版本没有积分换装备、经验、会盟令牌奖励
		tremove(selTab,2);
		tremove(selTab,2);
		tremove(selTab,2);
	end;
	Say("<color=green>"..g_sNpcName.."<color>: Ngi mu鑞 i ph莕 thng n祇?",getn(selTab),selTab);
end;

function want_zscs()
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local nCount = floor(nCurPoint/1000);
	if nCount <= 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: 觤 t輈h l騳 chi課 trng c馻 b筺 kh玭g , h穣 x竎 nh薾 b筺 c� 輙 nh蕋 <color=yellow>1000 甶觤 t輈h l騳 chi課 trng<color>.");
		return 0;
	end;
	AskClientForNumber("give_zscs",1,min(nCount,100),"B筺 mu鑞 i bao nhi猽?");	--１次最多换１００个
end;

function give_zscs(nCount)
	if nCount <= 0 then
		return 0;
	end;
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	if nCurPoint < nCount*1000 then
		Talk(1,"",g_szInforHeader.."B筺 kh玭g  甶觤 t輈h l騳 chi課 trng, h穣 x竎 nh薾 b筺 c� 輙 nh蕋 <color=yellow>"..(nCount*1000).." 甶觤 t輈h l騳 chi課 trng<color>.")	
		return 0;
	end;
	if gf_JudgeRoomWeight(2,nCount*5,"") == 0 then
		return 0;
	end;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nCount*1000);
	AddItem(2,1,3334,nCount);
	Msg2Player("B筺 i "..(nCount*1000).." 甶觤 t輈h l騳 i l蕐 "..nCount.." Tr秏 Tinh Th莕 Sa");
	WriteLog("[ph莕 thng chi課 tr薾]:"..GetName().."i "..nCount.." Tr秏 Tinh Th莕 Sa");
end;

function want_ling_pai()
	local selTab = {
			"уng �/give_ling_pai",
			"H駓 b�/nothing",
			}
	Say("<color=green>"..g_sNpcName.."<color>: фi <color=yellow>L謓h b礽 bang h閕<color> c莕 <color=yellow>30000 甶觤 t輈h l騳<color>, b筺 x竎 nh薾 mu鑞 i?",getn(selTab),selTab);
end;

function give_ling_pai()
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local nNeedPoint = 30000;
	if nCurPoint < nNeedPoint then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g  ");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,30) ~= 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: H祅h trang c馻 b筺 kh玭g  ch� tr鑞g!");
		return 0;
	end;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedPoint);
	local nRetCode = AddItem(2,0,125,1);
	if nRetCode == 1 then
		Msg2Player("B筺  i m閠 L謓h b礽 bang h閕");
		WriteLog("[ph莕 thng chi課 tr薾]:"..GetName().."  i m閠 l謓h b礽 bang h閕");
	else
		WriteLog("[ph莕 thng b� l鏸]"..GetName().."Khi i l謓h b礽 bang h閕 AddItem b竜 l鏸, nRetCode:"..nRetCode);
	end;
end;

function want_cangjian_equip()
	local selTab = {
			"уng �/give_cangjian_equip",
			"H駓 b�/nothing",
			}
	Say("<color=green>"..g_sNpcName.."<color>: Mu鑞 i <color=yellow>H� y T祅g Ki誱 c蕄 70<color> c莕 <color=yellow>100000 甶觤 t輈h l騳<color>, b筺 x竎 nh薾 mu鑞 i?",getn(selTab),selTab);
end;

function give_cangjian_equip()
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local nNeedPoint = 100000;
	if nCurPoint < nNeedPoint then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g  ");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,100) ~= 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: H祅h trang c馻 b筺 kh玭g  ch� tr鑞g!");
		return 0;
	end;
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: B筺 ph秈 gia nh藀 m玭 ph竔 m韎 c� th� i H� y T祅g Ki誱");
		return 0;
	end;
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nNum = nRoute * 100 + 70 + nBody;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedPoint);
	local nRetCode = AddItem(0,101,nNum,1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("B筺 i "..nNeedPoint.." 甶觤 t輈h l騳 l蕐 1 H� y T祅g Ki誱 c蕄 70");
		WriteLog("[ph莕 thng chi課 tr薾]:"..GetName().." i l蕐 H� y T祅g Ki誱 c蕄 70");
	else
		WriteLog("[ph莕 thng b� l鏸]"..GetName().."фi l蕐 H� y T祅g Ki誱 c蕄 70 AddItem b竜 l鏸, nRetCode:"..nRetCode);
	end;
end;

function want_exp_award()
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local nNeedPoint = 1000;
	local nLevel = GetLevel();
	if nLevel < 40 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Xin l鏸! Nh﹏ v藅 di c蕄 <color=yellow>40<color> kh玭g th� i ph莕 thng kinh nghi謒");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if nDate > BT_GetData(PT_EXCHANGE_EXP_DATE) then
		BT_SetData(PT_EXCHANGE_EXP_COUNT,0);
	end;
	local nCurCount = BT_GetData(PT_EXCHANGE_EXP_COUNT);
	if nCurCount >= 20 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Xin l鏸! H玬 nay b筺  nh薾 <color=yellow>20<color> l莕 ph莕 thng 甶觤 kinh nghi謒, m鏸 ng祔 ch� c� th� i 甶觤 t輈h l騳 l蕐 甶觤 kinh nghi謒 20 l莕");
		return 0;
	end;
	if nCurPoint < nNeedPoint then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g  ");
		return 0;
	end;
	local nExpAward = floor((((nLevel^2)/1600)^2)*20000);
	nCurCount = nCurCount + 1;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedPoint);
	BT_SetData(PT_EXCHANGE_EXP_COUNT,nCurCount);
	BT_SetData(PT_EXCHANGE_EXP_DATE,nDate);
	ModifyExp(nExpAward);
	Msg2Player("B筺 i "..nNeedPoint.." 甶觤 t輈h l騳 i l蕐 "..nExpAward.." 甶觤 kinh nghi謒, y l� l莕 i 甶觤 kinh nghi謒 th� "..nCurCount..".");
	WriteLog("[ph莕 thng chi課 tr薾]:"..nLevel.."-(c蕄):"..GetName().."  d飊g 甶觤 t輈h l騳 i"..nExpAward.." 甶觤 kinh nghi謒");
end;
