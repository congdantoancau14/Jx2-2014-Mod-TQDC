--¿İÄ¾´óÊ¦

Include("\\script\\missions\\yp\\award.lua");

g_NpcName = "<color=green>Vâ L©m Minh-Kh« Méc §¹i S­<color>: ";
g_MaxRewardCount = 3;

function main()
	local strtab = {
		"NhËn lÊy phÇn th­ëng./kmds_talk_2",
		"Giíi thiÖu Thiªn ¢m Th¸m Bİ/kmds_talk_3",
		"KÕt thóc ®èi tho¹i/nothing",
		};
	local nCurState = yp_checkRewardTime();
	if nCurState ~= 0 then
		local nCount = gf_GetTaskByte(TASK_FIELD_PVP_REWARD_TIME2,nCurState);
		tinsert(strtab,1,format("§Ö tö nhËn lÖnh (%d/%d)/#kmds_talk_1(%d)",nCount,g_MaxRewardCount,nCurState));
	end
	Say(g_NpcName.."Nh×n vÎ bÒ ngoµi cña Thiªn ¢m Th¸nh §Şa rÊt yªn tÜnh nh­ng thËt ra lµ nguy hiÓm kh¾p n¬i. T­¬ng truyÒn gÇn ®©y tËp trung rÊt nhiÒu nh©n sÜ giang hå, nh­ng hµnh ®éng cña hä rÊt kú quÆc, d­êng nh­ lµ mÊt hÕt lı trİ. Tr­ëng l·o B¸ch HiÓu Sinh nhê ta ®i ®iÒu tra t×nh h×nh, nh­ng Thiªn Ba D­¬ng Phñ cã chuyÖn nªn cÇn ta ®Õn ®ã gÊp. ThiÕu hiÖp cã thÓ gióp ta ®i xem thö kh«ng? Nhí mang theo Huy HiÖu Vâ L©m Minh ®Ó tr¸nh bŞ ng­êi cña m×nh ngé th­¬ng.",
		getn(strtab),
		strtab);
end

function kmds_talk_1(nCurState)
	local nLastState = nCurState - 1;
	if nLastState == 0 then
		nLastState = 2;
	end
	local nLastAward = gf_GetTaskByte(TASK_FIELD_PVP_REWARD_TIME1,nLastState);
	if nLastAward ~= 0 then
		Talk(1,"",g_NpcName.."L·o phu rÊt hµi lßng vÒ biÓu hiÖn lÇn tr­íc cña ®¹i hiÖp, h·y nhËn lÊy quµ t¹ lÔ cña l·o phu råi nhËn lÖnh sau (CÇn ph¶i nhËn th­ëng cña trËn tr­íc).");
		return 0;
	end
	if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
		return 0;
	end
	local nNum = BigGetItemCount(tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4]);
	if nNum >= 8 then
		gf_SetTaskByte(TASK_FIELD_PVP_REWARD_TIME1,nCurState,1);
		SetPlayerScript("\\script\\missions\\yp\\tysd\\entrynpc.lua");
		SendScript2VM("\\script\\missions\\yp\\tysd\\entrynpc.lua","enter()");
		return 0;
	end
	local nCurCount = gf_GetTaskByte(TASK_FIELD_PVP_REWARD_TIME2,nCurState);
	if nCurCount >= g_MaxRewardCount and nNum >= 1 then
		gf_SetTaskByte(TASK_FIELD_PVP_REWARD_TIME1,nCurState,1);
		SetPlayerScript("\\script\\missions\\yp\\tysd\\entrynpc.lua");
		SendScript2VM("\\script\\missions\\yp\\tysd\\entrynpc.lua","enter()");
		return 0;
	elseif nCurCount >= g_MaxRewardCount and nNum < 1 then
		Talk(1,"",g_NpcName.."BiÓu hiÖn cña thiÕu hiÖp khiÕn l·o phu khã lßng chÊp nhËn, h·y tiÕp tôc rÌn luyÖn råi quay l¹i sau.");
		return 0;
	end	
	gf_SetTaskByte(TASK_FIELD_PVP_REWARD_TIME1,nCurState,1);
	gf_SetTaskByte(TASK_FIELD_PVP_REWARD_TIME2,nCurState,nCurCount+1);
	gf_AddItemEx({tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4],8-nNum},tPVPItemInfo[15][1]);
	Talk(1,"",g_NpcName.."§­îc, thiÕu hiÖp h·y cÇm lÊy huy hiÖu nµy, chóc thµnh c«ng nhĞ!");
	SetPlayerScript("\\script\\missions\\yp\\tysd\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\tysd\\entrynpc.lua","enter()");
end

function kmds_talk_2()
	local nState = 0;
	local nCurTime = yp_checkRewardTime();
	for i = 1,4 do
		nState = gf_GetTaskByte(TASK_FIELD_PVP_REWARD_TIME1,i);
		if nState ~= 0 then		
			break;
		end
	end
	if nState == 0 then
		Talk(1,"",g_NpcName.."§¹i hiÖp kh«ng cã tham gia hµnh ®éng Thiªn ¢m Th¸m Bİ lÇn tr­íc!");
		return 0;
	end
	if nState ~= nCurTime then --ÉÏÒ»³¡Êı¾İ
		if gf_Judge_Room_Weight(4,20,"") ~= 1 then
			return 0;
		end		
		local nNum1 = BigGetItemCount(tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4]);
		local nNum2 = GetTask(TASK_FIELD_PVP_REWARD_HANDED);
		if nNum1 ~= 0 or nNum2 ~= 0 then
			if nNum1 ~= 0 then
				if BigDelItem(tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4],nNum1) ~= 1 then
					return 0;
				end
			end
			kmds_clearTaskID();
			yp_aw_giveAward_17(nNum1+nNum2);
		elseif GetTask(TASK_FIELD_PVP_REWARD_DEADNUM) >= 8 then
			kmds_clearTaskID();
			yp_aw_giveAward_17(0);
		else
			kmds_clearTaskID();
			Talk(1,"",g_NpcName.."BiÓu hiÖn cña thiÕu hiÖp khiÕn l·o phu khã lßng chÊp nhËn, h·y tiÕp tôc rÌn luyÖn råi quay l¹i sau.");
		end
	else --µ±Ç°³¡´Î
		Talk(1,"",g_NpcName.."§¹i hiÖp h·y b×nh tÜnh, ®îi hµnh ®éng Thiªn ¢m Th¸m Bİ lÇn nµy kÕt thóc råi h·y ®Õn nhËn th­ëng!");
	end
end

function kmds_clearTaskID()
	SetTask(TASK_FIELD_PVP_REWARD_HANDED,0);
	SetTask(TASK_FIELD_PVP_REWARD_TIME1,0);
	SetTask(TASK_FIELD_PVP_REWARD_TIME2,0);
	SetTask(TASK_FIELD_PVP_REWARD_DEADNUM,0);	
end

function kmds_talk_3()
	local strtab = {
		"Bèi c¶nh/#kmds_talk_3_1(1)",
		"Chó ı/#kmds_talk_3_1(2)",
		"trë l¹i/main",
		"KÕt thóc ®èi tho¹i/nothing",
	};
	Say(g_NpcName.."§¹i hiÖp muèn t×m hiÓu vÒ viÖc g×?",
		getn(strtab),
		strtab)
end

function kmds_talk_3_1(nType)
	local strMsg = {
		"RÊt nhiÒu nh©n sÜ giang hå bŞ mÊt lı trİ tËp trung t¹i Thiªn ¢m Th¸nh §Şa, viÖc kú l¹ nµy ®· g©y sù chó ı cho Vâ L©m Minh Chñ. Mét ng­êi tù x­ng lµ L·o Gi¶ cña Kh« Méc §¹i S­ Vâ L©m Minh hy väng c¸c h¹ cã thÓ t×m hiÓu gióp nguyªn nh©n.",		
		"Test",
		}
	Talk(1,"kmds_talk_3",g_NpcName..strMsg[nType])
end