--Ì«Ğé¹ÅÊ÷

Include("\\script\\missions\\yp\\mm\\head.lua")
Include("\\script\\missions\\yp\\award.lua")
Include("\\script\\tmp_task_id_def.lua")

g_strFile = "\\script\\missions\\yp\\mm\\tree_npc.lua";

--Ê÷ÖÖ»º´æ±í
--½á¹¹ÊÇÊ÷µÄË÷Òı£¨ÄÄ¿ÃÊ÷£©£¬Íæ¼ÒÃû×Ö£¬ÖÖ×ÓµÄË÷Òı£¬ÖÖ×ÓµÄÇé¿ö£¨ÖÖ×ÓÃû×Ö£¬Æ·ÖÊ£¬µÚ¼¸½×¶Î£¬ÖÖÖ²Ê±¼ä£¬²Ù×÷Êı£¬Éú³ÉµÄÓñÆÇt£©
--Àı×Ó£º
--tTreeSeed = {
--	[1] = {
--		PlayerName1 = {
--			[1] = {"Ò»µÈÎŞ»¨×Ó",45,0,GetTime(),0;yupo = {ÓñÆÇÃû id ÊıÁ¿ Æ·ÖÊ}},
--			[2] = {},
--		},
--		PlayerName2 ...
--	},
--}
tTreeSeed = {};

tYupoRank = {};  --ÓñÆÇÅÅĞĞ°ñ

g_NpcName = "<color=green>Th¸i H­ Cæ Thô<color>: "

g_nNeedTime = 5*60	--60*60;  --³ÉÊìÊ±¼ä
g_nGrownTime = 75*60; --ÀÃÊìÊ±¼ä
g_nFailTime = 300*60;  --¸¯ÀÃÊ±¼ä

function main()
	local m,x,y = GetNpcWorldPos(GetTargetNpc());
	local nType = 0;
	if tPos[m].tree1[1][1] == x and tPos[m].tree1[1][2] == y then
		if tTreeSeed[1] == nil then
			tTreeSeed[1] = {};
		end
		nType = 1;
	end
	if tPos[m].tree2[1][1] == x and tPos[m].tree2[1][2] == y then
		if tTreeSeed[2] == nil then
			tTreeSeed[2] = {};
		end
		nType = 2;
	end	
	if tPos[m].tree3[1][1] == x and tPos[m].tree3[1][2] == y then
		if tTreeSeed[3] == nil then
			tTreeSeed[3] = {};
		end
		nType = 3;
	end
	
	if nType == 0 then
		print("nTypenTypenTypenType")
		return 0;
	end
	local strtab = {};
	local nMapID = GetWorldPos();
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if tMainMapID[nCamp] and tMainMapID[nCamp][1] == nMapID then
		tinsert(strtab,"\nGieo h¹t gièng/#tree_talk_1("..nType..")");
		tinsert(strtab,"\nXem t×nh tr¹ng trång/#tree_talk_2("..nType..")");
	elseif nCamp ~= 0 and gf_GetTaskByte(TASK_FIELD_PVP_SEED_STEAL,1) == 1 then
		tinsert(strtab,"\nTrém Ngäc Ph¸ch/#tree_talk_3("..nType..")");
	end
	tinsert(strtab,"\nKÕt thóc ®èi tho¹i/nothing");
	Say(g_NpcName.."ta lµ mét c©y cæ thô!",
		getn(strtab),
		strtab);
end

function tree_clearTaskValue()
	if GetTask(TASK_FIELD_PVP_SEED_NUM) ~= 0 then
		local strName = GetName();
		for i,v in tTreeSeed do
			if v[strName] then			
				return 1;
			end
		end
		SetTask(TASK_FIELD_PVP_SEED_NUM,0);
		SetTask(TASK_FIELD_PVP_SEED_TIME,0);
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME1,0);
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME2,0);
	end
	return 0;
end

--»ñÈ¡ÓñÆÇÃû id ÊıÁ¿ Æ·ÖÊ
--²ÎÊı£ºÖÖ×ÓÆ·ÖÊ ²Ù×÷Êı
function tree_getYupo(nQulity,nOp)
	local t = {};
	local nNum = ceil(random(3,4)*(nOp/4)*(random(6,10)*0.1));
	if nNum == 0 then
		nNum = 1;
	end
	local nYpQ = ceil(nQulity*(nOp/4)*(random(6,10)*0.1));	
	for i = 1,getn(tYupoName) do
		if nYpQ >= tYupoName[i][3] then
			tinsert(t,tYupoName[i][1]);
			tinsert(t,tYupoName[i][2]);
			tinsert(t,nNum);
			tinsert(t,nYpQ);
			return t;
		end
	end
end

function tree_talk_1(nType)
	local nHour = tonumber(date("%H"));
	if nHour >= 20 or nHour <= 6 then 
		Talk(1,"",g_NpcName.."Tõ 7:00-20:00 míi cã thÓ gieo h¹t gièng!");
		return 0;
	end
	tree_clearTaskValue();
	if GetTask(TASK_FIELD_PVP_SEED_NUM) >= 2 then
		Talk(1,"",g_NpcName.."B¹n ®· gieo 2 h¹t gièng råi!");
		return 0;
	end
	local strtab = {};
	for i,v in tSeedName do
		for j=1,getn(v) do
			if GetItemCount(v[j][2][1],v[j][2][2],v[j][2][3]) >= 1 then
				tinsert(strtab,format("%s/#tree_talk_1_1(%d,%d,%d)",v[j][1],nType,i,j));
			end
		end
	end
	if getn(strtab) == 0 then
		Talk(1,"",g_NpcName.."Trªn ng­êi c¸c h¹ kh«ng cã h¹t gièng!");
		return 0;
	end
	tinsert(strtab,"\nKÕt thóc ®èi tho¹i/nothing");
	Say(g_NpcName.."Gieo h¹t gièng nµo?",
		getn(strtab),
		strtab);
end

function tree_talk_1_1(nType,n,m)
	local tCurSeed = tSeedName[n][m];
	if DelItem(tCurSeed[2][1],tCurSeed[2][2],tCurSeed[2][3],1) == 1 then
		SetTask(TASK_FIELD_PVP_SEED_NUM,GetTask(TASK_FIELD_PVP_SEED_NUM)+1);
		local nTime = tonumber(date("%H%M%S"));
		if GetTask(TASK_FIELD_PVP_SEED_NUM) == 1 then
			SetTask(TASK_FIELD_PVP_SEED_SHOWTIME1,nTime);
		else 
			SetTask(TASK_FIELD_PVP_SEED_SHOWTIME2,nTime);
		end
		local strName = GetName();
		if tTreeSeed[nType][strName] == nil then
			tTreeSeed[nType][strName] = {};
		end
		local nRand = random(tCurSeed[3][1],tCurSeed[3][2]); --Æ·ÖÊ
		local t = {tCurSeed[1],nRand,0,GetTime(),0}; --ÖÖ×ÓÃû×Ö£¬Æ·ÖÊ£¬µÚ¼¸½×¶Î£¬ÖÖÖ²Ê±¼ä£¬²Ù×÷Êı£¬Éú³ÉµÄÓñÆÇt
		tinsert(tTreeSeed[nType][strName],t);
		tTreeSeed[nType][strName].n = nil
		Talk(1,"",g_NpcName.."B¹n ®æi "..tCurSeed[1].."Gieo vµo trong Th¸i H­ Cæ Thô!");
	end
end

function tree_talk_2(nType)
	local strName = GetName();
	if tTreeSeed[nType][strName] == nil or getn(tTreeSeed[nType][strName]) == 0 then
		Talk(1,"",g_NpcName.."B¹n kh«ng gieo h¹t gièng lªn c©y cæ thô nµy!");
		return 0;
	end
	local strtab = {};
	for i = 1,getn(tTreeSeed[nType][strName]) do
		tinsert(strtab,format("\n%s/#tree_talk_2_1(%d,%d)",tTreeSeed[nType][strName][i][1],nType,i));
	end
	tinsert(strtab,"\nKÕt thóc ®èi tho¹i/nothing");
	Say(g_NpcName.."Chän h¹t gièng cÇn thao t¸c: ",
		getn(strtab),
		strtab);	
end

function tree_talk_2_1(nType,n)
--	gf_PrintTable(tTreeSeed)
	local strName = GetName();
	local tCurSeed = tTreeSeed[nType][strName][n];
	local nCurTime = GetTime();
	local nDisTime = nCurTime - tCurSeed[4];
	local strtab = {};
	local strMsg = "";
	if nDisTime > g_nGrownTime and nDisTime < g_nFailTime then --2¸ö°ëĞ¡Ê±½øÈëÏÂÒ»½×¶Î
		if tCurSeed[3] < 4 then
			local nPassStep = floor(nDisTime/g_nGrownTime);
			tCurSeed[3] = tCurSeed[3]+nPassStep;
			if tCurSeed[3] > 4 then
				tCurSeed[3] = 4;
			end
			tCurSeed[4] = tCurSeed[4] + nPassStep*g_nGrownTime;
			strMsg = format("%s, sè lÇn ®· chİn: <color=yellow>%d<color>, kho¶ng c¸ch lÇn chİn tiÕp theo <color=yellow>%s<color>.",tCurSeed[1],tCurSeed[3],Get_Time_String(g_nNeedTime,"hms"));
		end
	elseif nDisTime >= g_nNeedTime and nDisTime < g_nFailTime then --2¸öĞ¡Ê±
--		if tCurSeed[3] < 4 then
--			tCurSeed[3] = tCurSeed[3]+1;
			strMsg = format("%s, sè lÇn ®· chİn: <color=yellow>%d<color>.",tCurSeed[1],tCurSeed[3]);
--		end
		if tCurSeed[3] < 4 then
			tinsert(strtab,format("\nT­íi n­íc/#tree_talk_2_2(%d,%d)",nType,n))
		end
	elseif nDisTime >= g_nFailTime then --¸¯ÀÃÁË
		strMsg = "Ngäc Ph¸ch cña ng­¬i do kh«ng dïng trong thêi gian dµi nªn ®· môc n¸t.";
		tinsert(strtab,format("\nLo¹i bá t¹p chÊt/#tree_talk_2_4(%d,%d)",nType,n))
	else
		strMsg = format("%s, sè lÇn ®· chİn: <color=yellow>%d<color>, kho¶ng c¸ch lÇn chİn tiÕp theo <color=yellow>%s<color>.",tCurSeed[1],tCurSeed[3],Get_Time_String(g_nNeedTime-(GetTime()-tCurSeed[4]),"hms"));
	end
	if tCurSeed[3] == 4 and nDisTime < g_nFailTime then
		local t = tree_getYupo(tCurSeed[2],tCurSeed[5]);
		if tCurSeed.yupo == nil then
			tCurSeed.yupo = t;
		end
		strMsg = format("%s, ®· chİn.",t[1]);
		tinsert(strtab,format("\nThu ho¹ch/#tree_talk_2_3(%d,%d)",nType,n))
	end
	tinsert(strtab,"\nKÕt thóc ®èi tho¹i/nothing");
	Say(g_NpcName..strMsg,
		getn(strtab),
		strtab)
end

function tree_talk_2_2(nType,n)
	if gf_Judge_Room_Weight(2,10,"") ~= 1 then
		return 0;
	end	
	local strName = GetName();
	local tCurSeed = tTreeSeed[nType][strName][n];
	local nCurTime = GetTime();
	local nDisTime = nCurTime - tCurSeed[4];
	local strSeedName = tCurSeed[1];
	local nAwardType = 0;
	local nAwardTypeD = 0;
	local strMsg = "";
	if nDisTime >= g_nNeedTime and nDisTime < g_nFailTime then --2¸öĞ¡Ê±
		if tCurSeed[3] < 4 then
			tCurSeed[3] = tCurSeed[3]+1;
			tCurSeed[4] = GetTime();
			tCurSeed[5] = tCurSeed[5]+1;
--			strMsg = "Äú´òÀí½½Ë®ÁË£¬½±Àø»¹Î´Éè£¬ÏÂ´ÎÔÙ¸øÄã°É¡£";
--			Talk(1,"",g_NpcName..strMsg);
			for i = 1,getn(tSeedName) do
				for j = 1,getn(tSeedName[i]) do
					if tSeedName[i][j][1] == strSeedName then
						nAwardType = i;
						nAwardTypeD = j
						break;
					end
				end
			end
			if nAwardType ~= 0 then
				yp_aw_giveAward_7(nAwardType, nAwardTypeD, tCurSeed[3]);
			end
		end
	end
end

function tree_talk_2_3(nType,n)
	local strName = GetName();
	local tCurSeed = tTreeSeed[nType][strName][n];
	if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
		return 0;
	end
	SetTask(TASK_FIELD_PVP_SEED_NUM,GetTask(TASK_FIELD_PVP_SEED_NUM)-1);
	if n == 1 then
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME1,0);
	else 
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME2,0);
	end	
	if gf_GetTaskByte(TASK_FIELD_PVP_SEED_SUR,1) == 1 then
		local nSur = gf_GetTaskByte(TASK_FIELD_PVP_SEED_SUR,2);
		gf_SetTaskByte(TASK_FIELD_PVP_SEED_SUR,2,nSur+1);
	end	
	if tCurSeed.yupo then
		gf_AddItemEx(tCurSeed.yupo[2],tCurSeed.yupo[1],tCurSeed.yupo[3]);
		--ÈÎÎñ´¥·¢
		Include("\\script\\global\\events.lua")
		local tType = {
			["H­ Kh«ng Ngäc Ph¸ch_§Æc biÖt"] = 4,
			["MÆc Tµ Ngäc Ph¸ch_NhÊt phÈm"] = 3,
			["Tó Tr¹ch Ngäc Ph¸ch_NhŞ phÈm"] = 2,
			["B¨ng T©m Ngäc Ph¸ch_Tam phÈm"] = 1,
		}
		EventOnTrigger(7, {name="Thu thËp Tiªn Ngäc Linh Hoµn", category=tType[tCurSeed.yupo[1]]});
		--ÇåÀí
		tremove(tTreeSeed[nType][strName],n);
		tTreeSeed[nType][strName].n = nil;
	end
end

function tree_talk_2_4(nType,n)
	local strName = GetName();
	SetTask(TASK_FIELD_PVP_SEED_NUM,GetTask(TASK_FIELD_PVP_SEED_NUM)-1);
	if n == 1 and GetTask(TASK_FIELD_PVP_SEED_NUM) ~= 0 then
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME1,0);
	else 
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME2,0);
	end
	tremove(tTreeSeed[nType][strName],n);
	tTreeSeed[nType][strName].n = nil;
	Talk(1,"",g_NpcName.."T¹p chÊt ®· ®­îc lo¹i bá, ng­¬i cã thÓ tiÕp tôc gieo h¹t gièng råi.");	
end

function tree_talk_3(nType)
--	gf_PrintTable(tTreeSeed)
	if gf_GetTaskByte(TASK_FIELD_PVP_SEED_STEAL,2) == 1 then
		Talk(1,"",g_NpcName.."Ng­¬i ®· trém Ngäc Ph¸ch råi, h·y mau ®i giao tr¶ nhiÖm vô.");
		return 0;
	end
	if gf_Judge_Room_Weight(4,10,g_NpcName) ~= 1 then
		return 0;
	end	
	if not tTreeSeed or type(tTreeSeed) ~= "table" then
		Talk(1,"",g_NpcName.."C©y nµy kh«ng cã Ngäc Ph¸ch ®Ó trém!");
		return 0;
	end
	local tCurSeed = tTreeSeed[nType];
	if not tCurSeed or type(tCurSeed) ~= "table" then
		Talk(1,"",g_NpcName.."C©y nµy kh«ng cã Ngäc Ph¸ch ®Ó trém!");
		return 0;
	end
	SetTaskTemp(TEMP_FIELD_PVP_TREE_TYPE, 0);
	for i,v in tCurSeed do
		for j,k in v do
			if k.yupo == nil then
				local nDisTime = GetTime() - k[4];
				if nDisTime > g_nGrownTime and nDisTime < g_nFailTime then
					if k[3] < 4 then
						k[3] = k[3]+floor(nDisTime/g_nGrownTime);
						if k[3] > 4 then
							k[3] = 4;
						end
						k[4] = k[4] + k[3]*g_nGrownTime;
					end
				end
				if k[3] == 4 then
					local t = tree_getYupo(k[2],k[5]);
					if t and t[3] and t[3] > 0 then
						local nNum = random(t[3]) - 1;
						if nNum > GetTaskTemp(TEMP_FIELD_PVP_TREE_TYPE) then
							SetTaskTemp(TEMP_FIELD_PVP_TREE_TYPE, nNum);
						end
						k.yupo = {t[1], t[2], t[3] - nNum, t[4]};
					end
				end
			end		
		end
	end
	DoWait(121,122,5);
end

function tree_talk_3_1()
	local nNum = GetTaskTemp(TEMP_FIELD_PVP_TREE_TYPE);	
	if nNum <= 0 then
		Talk(1,"",g_NpcName.."C©y nµy kh«ng cã Ngäc Ph¸ch ®Ó trém!");
		return 0;
	end
	local tYupo = {
		{1, 40, "B¨ng T©m Ngäc Ph¸ch_Tam phÈm", {2,95,910}},
		{1, 40, "Tó Tr¹ch Ngäc Ph¸ch_NhŞ phÈm", {2,95,911}},
		{1, 19, "MÆc Tµ Ngäc Ph¸ch_NhÊt phÈm", {2,95,912}},
		{1, 1, "H­ Kh«ng Ngäc Ph¸ch_§Æc biÖt", {2,95,913}},
	}
	local nIndex = gf_GetRandItemByTable(tYupo, 100, 1)
	gf_AddItemEx(tYupo[nIndex][4], tYupo[nIndex][3], nNum);
	gf_SetTaskByte(TASK_FIELD_PVP_SEED_STEAL,2,1);
end
