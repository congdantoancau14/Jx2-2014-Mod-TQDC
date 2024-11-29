--ÑûÇëÂë¹¦ÄÜ
--design by liubo5
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\invite_code\\ic_define.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\misc\\taskmanager.lua")

IC_TASK_GROUP = TaskManager:Create(IC_TASK_GROUP[1], IC_TASK_GROUP[2]);
IC_TASK_GROUP.InviteCode16H = 1; --¼ÇÂ¼×Ô¼ºµÄÑûÇëÂë
IC_TASK_GROUP.InviteCode16L	= 2; --¼ÇÂ¼×Ô¼ºµÄÑûÇëÂë
IC_TASK_GROUP.Icd16H = 3; --¼ÇÂ¼ÒÑ¼¤»î±»ÑûÇëµÄ¼¤»îÂë
IC_TASK_GROUP.Icd16L = 4; --¼ÇÂ¼ÒÑ¼¤»î±»ÑûÇëµÄ¼¤»îÂë
IC_TASK_GROUP.FinishInvite = 5; --¼ÇÂ¼Íê³ÉÒÑ±»ÑûÇë
IC_TASK_GROUP.RecordAward = 6; --°´Î»¼ÇÂ¼ÑûÇëÕßÄÄÐ©Áì½±
IC_TASK_GROUP.Recrod2Award = 7; --°´Î»¼ÇÂ¼±»ÑûÇëÕßÄÄÐ©Ìõ¼þÒÑÁì½±
IC_TASK_GROUP.IBCost = 8;	--ÁìÈ¡ÑûÇëÂëÖ®ºóÔÚÓù½ÖÏû·Ñ¼ÆÊý
IC_TASK_GROUP.tagData = 9; --´æ·ÅÁì½±±ê¼Ç
IC_TASK_GROUP.TempData = 10; --´æ·ÅÁÙÊ±Êý¾Ý

IC_NPC_NAME = "<color=green> §¹i Sø ho¹t ®éng: <color>";
IC_NPC_TITLE = "H·y nhanh chãng mêi b¹n bÌ ®Õn cïng ch¬i trß ch¬i nµo! B¹n bÌ cµng nhiÒu th× sÏ cã thªm nhiÒu niÒm vui!";

IC_NPC_DIALOG = {
	"Giíi thiÖu ho¹t ®éng/ic_Introduce",
	"NhËn m· mêi/ic_GetInviteCode",
	"KÝch ho¹t m· mêi/ic_ActInviteCode",
	"Xem ®iÓm tÝch lòy/ic_QueryScore",
	"NhËn lÊy phÇn th­ëng./ic_GetAward",
}

function ic_Introduce()
	local strTitle = 	"Trong thêi gian ho¹t ®éng, tÊt c¶ ng­êi ch¬i trªn cÊp 90 cã thÓ t×m npc §¹i sø ho¹t ®éng nhËn m· mêi, ng­êi ch¬i cã thÓ tÆng m· mêi cho b¹n bÌ, ng­êi ch¬i tiÕp nhËn m· mêi cã thÓ t×m §¹i sø ho¹t ®éng kÝch ho¹t m· mêi.";
	strTitle = strTitle.."Ng­êi nhËn lêi mêi kÝch ho¹t thÎ th¸ng cã thÓ ®ãng gãp 1 ®iÓm tÝch lòy vµ nhËn th­ëng, ®¹t ®Õn 5 chuyÓn 90 cÊp cã thÓ ®ãng gãp 1 ®iÓm tÝch lòy vµ nhËn th­ëng, ®¹t ®Õn 6 chuyÓn 90 cÊp cã thÓ ®ãng gãp 3 ®iÓm tÝch lòy vµ nhËn th­ëng, tiªu phÝ t¹i Ngù C¸c ®¹t 2000xu cã thÓ ®ãng gãp 3 ®iÓm tÝch lòy vµ nhËn th­ëng, tiªu phÝ t¹i Ngù C¸c ®¹t 4000xu cã thÓ ®ãng gãp 3 ®iÓm tÝch lòy vµ nhËn th­ëng.";
	strTitle = strTitle.."Ng­êi ch¬i tÆng m· mêi nhËn ®­îc ®iÓm tÝch lòy do ng­êi tiÕp nhËn cèng hiÕn, khi ®iÓm tÝch lòy ®¹t ®Õn c¸c mèc sÏ nhËn ®­îc gi¶i th­ëng kh¸c nhau.";
	strTitle = strTitle.."Trong thêi gian ho¹t ®éng mçi ng­êi chØ ®­îc nhËn mét m· mêi vµ chØ ®­îc tiÕp nhËn ng­êi kh¸c mêi mét lÇn, cã thÓ tÆng m· mêi cho v« sè ng­êi ch¬i.";
	local tbSay = {};
	tbSay.msg = IC_NPC_NAME..strTitle;
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function ic_GetInviteCode()
	if ic_CheckCondition() ~= 1 then
		return 0;
	end
	local szInviteCode = _ic_GetInviteCode();
	DebugOutput("szInviteCode =", szInviteCode, tonumber(szInviteCode));
	if tonumber(szInviteCode) ~= 0 then
		Say(IC_NPC_NAME..format("B¹n ®· nhËn m· mêi, sè m· mêi lµ <color=gold>%q<color>", szInviteCode), 0);
	else
		szInviteCode = _ic_generate_code();
		--ÕâÀïÒªÐ´Êý¾Ý¿âÔÙ»Øµ÷
		--ic_GetInviteCode_CB
		if ic_CheckClickTime() ~= 1 then
			return 0;
		end
		DebugOutput("call InviteCode()", szInviteCode)
		InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_REG, szInviteCode, 0, "ic_GetInviteCode_CB");
	end
end

function ic_GetInviteCode_CB(nRet, nScore)
	DebugOutput("ic_GetInviteCode_CB()", nRet, nScore);
	if 1 == nRet then
		local szInviteCode = _ic_generate_code();
		DebugOutput("call _ic_generate_code()", szInviteCode)
		_ic_SetInviteCode(szInviteCode);
		Say(IC_NPC_NAME..format("M· mêi mµ b¹n nhËn ®­îc lµ <color=green>%q<color>", szInviteCode), 0);
	else
		Talk(1,"","NhËn m· mêi thÊt b¹i!");	
		WriteLog(format("[InviteCode] Accoute=%s RoleName=%s Route=%d Register[%s] Failed!", GetAccount(), GetName(), GetPlayerRoute(), _ic_generate_code()));
	end
end

function ic_ActInviteCode()
	if ic_CheckCondition() ~= 1 then
		return 0;
	end
--	local szInviteCode = _ic_GetInviteCode();
--	if szInviteCode ~= _ic_generate_code() then
--		Say(IC_NPC_NAME.."Äú×Ô¼º»¹Ã»ÓÐÁìÈ¡ÈÎºÎÑûÇëÂë£¡", 0)
--		return 0;
--	end
	AskClientForString("ic_ActInviteCode_Acfs", "M· mêi", 10, 10, "H·y nhËp m· mêi");
end

function ic_ActInviteCode_Acfs(szInviteCode)
	--ºÏ·¨ÐÔ¼ì²é
	if _ic_CheckInviteCode(szInviteCode) ~= 1 then
		Say(IC_NPC_NAME.."KÝch ho¹t m· mêi thÊt b¹i!", 0);	
		return 0;
	end
	--²»ÄÜ¼¤»î×Ô¼ºµÄÑûÇëÂë
	local selfCode = _ic_GetInviteCode();
	if selfCode == szInviteCode then
		Say(IC_NPC_NAME..format("<color=red>%q<color> lµ m· mêi cña b¹n, chØ ®­îc kÝch ho¹t m· mêi cña ng­êi kh¸c míi cã thÓ nhËn phÇn th­ëng mêi vµ tÝch lòy cèng hiÕn!", selfCode), 0);
		return 0;
	end
	--ÅÐ¶ÏÊÇ·ñÒÑ¼¤»î
	local nType = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.FinishInvite);
	if 0 ~= nType then
		Say(IC_NPC_NAME.."B¹n ®· ®­îc mêi qua råi, h·y nhanh chãng hoµn thµnh ®iÒu kiÖn nhiÖm vô ®Ó nhËn phÇn th­ëng!", 0);
		return 0;
	end
	--ic_ActInviteCode_CB
	if ic_CheckClickTime() ~= 1 then
		return 0;
	end
	DebugOutput("ic_ActInviteCode_Acfs()", szInviteCode);
	_ic_SetActInviteCode(szInviteCode); --¼ÇÂ¼¼¤»î±»ÑûÇëµÄ¼¤»îÂë£¬²»ÄÜ×÷ÎªÒÑ¼¤»î±êÖ¾
	InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_QRY, szInviteCode, 0, "ic_ActInviteCode_CB");
end

function ic_ActInviteCode_CB(nRet, nScore)
	DebugOutput("ic_ActInviteCode_CB()", nRet, nScore)
	if 1 == nRet then
		--¼ÇÂ¼ÒÑ±»ÑûÇë¹ý
		IC_TASK_GROUP:SetTask(IC_TASK_GROUP.FinishInvite, 1);
		Say(IC_NPC_NAME.."B¹n ®· kÝch ho¹t thµnh c«ng m· mêi, h·y nhanh chãng hoµn thµnh ®iÒu kiÖn ®Ó nhËn phÇn th­ëng dµnh cho ng­êi ®­îc mêi!", 0);
	else
		Say(IC_NPC_NAME.."KÝch ho¹t m· mêi thÊt b¹i!", 0);	
	end
end

function ic_QueryScore()
	if ic_CheckCondition() ~= 1 then
		return 0;
	end
	local szInviteCode = _ic_GetInviteCode();
	if szInviteCode ~= _ic_generate_code() then
		Say(IC_NPC_NAME.."B¹n vÉn ch­a nhËn m· mêi nµo!", 0)
		return 0;
	end
	--·ÃÎÊÊý¾Ý¿â
	--ic_QueryScore_CB
	if ic_CheckClickTime() ~= 1 then
		return 0;
	end
	InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_QRY, szInviteCode, 0, "ic_QueryScore_CB");
end

function ic_QueryScore_CB(nRet, nScore)
	--ÄãÄ¿Ç°ËùµÃµÄ×Ü»ý·ÖÖµÎªxx	
	if 1 == nRet and nScore >= 0 then
		Say(IC_NPC_NAME..format("M· mêi cña b¹n lµ <color=gold>%q<color>, tæng ®iÓm tÝch lòy hiÖn t¹i lµ <color=gold>%d<color>", _ic_GetInviteCode(), nScore), 0);
	else
		Say(IC_NPC_NAME.."Xem ®iÓm tÝch lòy xuÊt hiÖn lçi, h·y liªn hÖ phßng ch¨m sãc kh¸ch hµng", 0);		
		WriteLog(format("[InviteCode] Accoute=%s RoleName=%s Route=%d InviteCode=%s InviteCodeOther=%s nRet=%d nScore=%d", 
		GetAccount(), GetName(), GetPlayerRoute(), _ic_GetInviteCode(), _ic_GetActInviteCode(), nRet, nScore));
	end
end

function ic_GetAward()
	if ic_CheckCondition() ~= 1 then
		return 0;
	end
	local tSay = {
		"\nPhÇn th­ëng cho ng­êi ®­îc mêi/ic_GetShouyaoAward",
		"\nPhÇn th­ëng cho ng­êi mêi/ic_GetYaoqingAward",
		"\n rót lui/nothing",
	}
	Say(IC_NPC_NAME.."B¹n muèn nhËn phÇn th­ëng g×?", getn(tSay), tSay);
end

function ic_GetYaoqingAward()
	local szInviteCode = _ic_GetInviteCode();
	DebugOutput(szInviteCode, _ic_generate_code());
	if szInviteCode ~= _ic_generate_code() then
		Say(IC_NPC_NAME.."B¹n vÉn ch­a nhËn m· mêi, kh«ng thÓ nhËn phÇn th­ëng ®iÓm tÝch lòy!", 0);
		return 0;
	end
	if ic_CheckClickTime() ~= 1 then
		return 0;
	end
	InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_QRY, szInviteCode, 0, "ic_GetYaoqingAward_CB")
end

function ic_GetYaoqingAward_CB(nRet, nScore)
	if 1 ~= nRet then
		Say(IC_NPC_NAME.."Xem ®iÓm tÝch lòy thÊt b¹i, t¹m thêi kh«ng thÓ nhËn phÇn th­ëng!", 0);
		return 0;
	end
	if nScore < 0 then
		Say(IC_NPC_NAME.."§iÓm tÝch lòy kh¸c th­êng, kh«ng thÓ nhËn phÇn th­ëng.!", 0);
		return 0;
	end
	local tSay = {}
	for k, v in IC_YAOQING_AWARD do
		if v[1] == "yinjuan" or v[1] == "jinjuan" then
			tinsert(tSay, format("%s*%d (®· tÝch lòy %d ®iÓm)/#ic_GetYaoqingAward_do(%d, %d)", v[3], v[4], v[2], k, nScore));
		elseif v[1] == "item" then
			tinsert(tSay, format("%s*%d (®· tÝch lòy %d ®iÓm)/#ic_GetYaoqingAward_do(%d, %d)", v[3], v[4][4], v[2], k, nScore));
		elseif v[1] == "func" then
			tinsert(tSay, format("%s*%d (®· tÝch lòy %d ®iÓm)/#ic_GetYaoqingAward_do(%d, %d)", v[3], 1, v[2], k, nScore));
		end	
	end
	tinsert(tSay, "\n rót lui/nothing");
	Say(IC_NPC_NAME..format("Tæng ®iÓm tÝch lòy hiÖn t¹i lµ <color=gold>%q<color>, h·y ®æi phÇn th­ëng theo ®iÓm tÝch lòy!", nScore), getn(tSay), tSay);
end

function ic_GetYaoqingAward_do(index, nScore)
	if IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.RecordAward, index) > 0 then
		Say(IC_NPC_NAME.."PhÇn th­ëng nµy ®· nhËn råi", 0);
		return 0;
	end
	local tCell = IC_YAOQING_AWARD[index];
	if not tCell then  return 0; end
	if nScore < tCell[2] then
		Say(IC_NPC_NAME..format("Tæng ®iÓm tÝch lòy hiÖn t¹i lµ <color=gold>%q<color>, kh«ng ®ñ <color=gold>%q<color>, t¹m thêi kh«ng thÓ nhËn phÇn th­ëng nµy!", nScore, tCell[2]), 0);
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10," ") ~= 1 then
		return 0;
	end
	--¼ÇÂ¼Áì½±
	IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.RecordAward, index, 1);
	--Áì½±
	if tCell[1] == "yinjuan" then
		ModifyYinJuan(tCell[4], 1);
	elseif tCell[1] == "jinjuan" then
		ModifyJinJuan(tCell[4], 1);
	elseif tCell[1] == "func" then
		tCell[4]();
	elseif tCell[1] == "item" then
		gf_AddItemEx2(tCell[4], tCell[3], "Ho¹t ®éng m· mêi", "PhÇn th­ëng ®iÓm tÝch lòy", (tCell[5] or 0), 1);
	end
end

function ic_GetShouyaoAward()
	local tSay = {
		format("100,000,000 exp(kÝch ho¹t thÎ th¸ng)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE1),
		format("L¹c §µ Tr¾ng (30 ngµy) (§¹t chuyÓn sinh 5 Lv90)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE2),
		format("UÈn Linh CÊp 5 (NgÉu nhiªn) (§¹t chuyÓn sinh 6 Lv90)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE3),
		format("MËt TÞch Tiªu Dao Tµn Ch­¬ng (Sau khi nhËn m· mêi vµo Ngù C¸c tiªu phÝ ®¹t 2000xu)/#ic_GetShouyaoAward_do(%d) ", IC_FINISH_INVITE_TYPE4),
		format("Thiªn M«n Kim LÖnh (Sau khi nhËn m· mêi vµo Ngù C¸c tiªu phÝ ®¹t 5000xu)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE5),
		format("Gi¶i th­ëng riªng/ic_GetShouyaoExtAward"),
		
	};
	tinsert(tSay, "\n rót lui/nothing");
	Say(IC_NPC_NAME.."KÝch ho¹t m· mêi míi nhËn ®­îc phÇn th­ëng t­¬ng øng!", getn(tSay), tSay);
end

function ic_GetShouyaoExtAward()
	local tSay = {
		format("2,000,000 exp(hoµn thµnh 3 nhiÖm vô tïy ý)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE6),
		format("10,000,000 exp(hoµn thµnh 4 nhiÖm vô tïy ý)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE7),
		format("20,000,000 exp(hoµn thµnh 5 nhiÖm vô tïy ý)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE8),
	};
	tinsert(tSay, "\n rót lui/nothing");
	Say(IC_NPC_NAME.."KÝch ho¹t m· mêi míi nhËn ®­îc phÇn th­ëng t­¬ng øng!", getn(tSay), tSay);
end

function ic_GetShouyaoAward_do(nType)
	local nValue = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.FinishInvite);
	if 1 ~= nValue then
		Say(IC_NPC_NAME.."B¹n vÉn ch­a hoµn thµnh lêi mêi cña h¶o h÷u hoÆc ng­êi kh¸c, kh«ng thÓ nhËn phÇn th­ëng.", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end
	local szInviteCode = _ic_GetActInviteCode();
	if _ic_CheckInviteCode(szInviteCode) ~= 1 then
		Say(IC_NPC_NAME.."M· mêi cña b¹n kÝch ho¹t bÞ bÊt th­êng, kh«ng thÓ nhËn phÇn th­ëng!", 0);
		return 0;
	end
	if _ic_CheckAwardCondition(nType) ~= 1 then
		return 0;
	end
	DebugOutput("GetTaskBit(Recrod2Award, nType) =", IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, nType), nType)
	if IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, nType) ~= 0 then
		Say(IC_NPC_NAME.."B¹n ®· nhËn phÇn th­ëng nµy råi, kh«ng thÓ nhËn l¹i!", 0);
		return 0;
	end
	if nType > IC_FINISH_INVITE_TYPE1 and IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, nType-1) ~= 1 then
		Say(IC_NPC_NAME.."VÉn ch­a nhËn phÇn th­ëng cña nhiÖm vô tr­íc ®ã, kh«ng thÓ nhËn phÇn th­ëng hiÖn t¹i!", 0);
		return 0;
	end
	
	--ÒÑ¹±Ï×¹ý»ý·Öµ«Ã»ÓÐÁì½±
	local nOldType = IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.tagData, nType);
	if 0 ~= nOldType then
		ic_GetShouyaoAward_finish(nType);
		return 0;
	end
	if ic_CheckClickTime() ~= 1 then
		return 0;
	end
	--¹±Ï×»ý·Ö
	IC_TASK_GROUP:SetTask(IC_TASK_GROUP.TempData, nType);
	local nPoint = _get_award_point(nType)
	if nPoint > 0 then
		InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_MDY, szInviteCode, nPoint, "ic_GetShouyaoAward_CB");
	else
		ic_GetShouyaoAward_finish(nType);
	end
end

function _get_award_point(nType)
	local tAward = {1,1,3,3,3,}
	local nRet = tAward[nType] or 0
	return nRet
end

function ic_GetShouyaoAward_CB(nRet, nScore)
	if nRet ~= 1 then
		Say(IC_NPC_NAME.."Lçi ch­a x¸c ®Þnh, cèng hiÕn ®iÓm tÝch lòy cho ng­êi mêi thÊt b¹i", 0);
		return 0;
	end
	local nType = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.TempData);
	if nType < IC_FINISH_INVITE_TYPE1 or nType > IC_FINISH_INVITE_TYPE8 then
		return 0;
	end
	IC_TASK_GROUP:SetTask(IC_TASK_GROUP.TempData, 0);
	IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.tagData, nType, 1);
	ic_GetShouyaoAward_finish(nType);
end

function ic_GetShouyaoAward_finish(nType)
	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end
	if IC_FINISH_INVITE_TYPE1 == nType then
		gf_Modify("Exp", 100000000)
		IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.Recrod2Award, nType, 1);
	elseif IC_FINISH_INVITE_TYPE2 == nType then
		local tCell = {"L¹c §µ Tr¾ng", {0,105,148,1,4,-1,-1,-1,-1,-1,-1}, 30 * 24 * 3600}
		gf_AddItemEx2(tCell[2], tCell[1], "Ho¹t ®éng m· mêi", "PhÇn th­ëng ®iÓm tÝch lòy", (tCell[3] or 0), 1);
		IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.Recrod2Award, nType, 1);
	elseif IC_FINISH_INVITE_TYPE3 == nType then
		giveYunLing5()
		IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.Recrod2Award, nType, 1)
	elseif IC_FINISH_INVITE_TYPE4 == nType then
		local tCell = {"MËt TÞch Tiªu Dao Tµn Ch­¬ng", {0,112,226,1,}, 0}
		gf_AddItemEx2(tCell[2], tCell[1], "Ho¹t ®éng m· mêi", "PhÇn th­ëng ®iÓm tÝch lòy", (tCell[3] or 0), 1);
		IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.Recrod2Award, nType, 1);
	elseif IC_FINISH_INVITE_TYPE5 == nType then
		local tCell = {"Thiªn M«n Kim LÖnh", {2,1,30370,1,}, 0}
		gf_AddItemEx2(tCell[2], tCell[1], "Ho¹t ®éng m· mêi", "PhÇn th­ëng ®iÓm tÝch lòy", (tCell[3] or 0), 1);
		IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.Recrod2Award, nType, 1);
	elseif nType >= IC_FINISH_INVITE_TYPE6 and nType <= IC_FINISH_INVITE_TYPE8 then
		local tAward = { 2000000, 10000000, 20000000 }
		local nIdx = nType - IC_FINISH_INVITE_TYPE6 + 1
		gf_Modify("Exp", tAward[nIdx])
		IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.Recrod2Award, nType, 1);
	end 
end

function ic_GetYaoYangJiezi(index, nType)
	local tCell = IC_YAOYANG_JIEZI_1[index];
	if not tCell then return 0; end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	gf_AddItemEx2(tCell[2], tCell[1], "Ho¹t ®éng m· mêi", "Trang søc DiÖu D­¬ng ", 0, 1);
	IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.Recrod2Award, nType, 1);
end

--»î¶¯ÊÇ·ñ¿ªÆô
function ic_IsOpen()
	return gf_CheckDuration(IC_START_TIME, IC_END_TIME);	
end

--²ÎÓëÌõ¼þ
function ic_CheckCondition()
	if GetLevel() < 90 then
		Talk(1,"",format("Ng­êi ch¬i <color=red>cÊp %d<color> trë lªn míi ®­îc tham gia", 90));
		return 0;
	end
	return 1;
end

--¼ì²éÊ±¼ä
function ic_CheckClickTime()
	if not G_IC_CLICK_TIME then
		G_IC_CLICK_TIME = {}
	end
	local szName = GetName();
	local nCurTime = GetTime();
	if not G_IC_CLICK_TIME[szName] then
		G_IC_CLICK_TIME[szName] = nCurTime;
		return 1;
	end
	local nPastTime = nCurTime - G_IC_CLICK_TIME[szName];
	if nPastTime < IC_CLICK_TIME then
		Msg2Player(format("Thao t¸c qu¸ nhiÒu, %ds sau h·y thö l¹i", IC_CLICK_TIME - nPastTime));
		return 0;
	end
	G_IC_CLICK_TIME[szName] = nCurTime;
	return 1;
end

--Éú³ÉÑûÇëÂë
--ÒªÇóÈ«Çø·þÃ¿¸öÍæ¼ÒÑûÇëÂë²»Ò»Ñù
--¸ÄÑÎÄÜ¹»¸´ÓÃ
--·µ»Ø10Î»¹Ì¶¨ÑûÇëÂë×Ö·û´®
function _ic_generate_code()
	local szAccount = GetAccount();
	local szName = GetName();
	local szRoute = gf_GetRouteName(GetPlayerRoute());
	local szCode = tostring(abs(String2Hash(szAccount..szName..szRoute..IC_INVITE_CODE_SALT)));
	if strlen(szCode) < 10 then
		szCode = format("%010d", tonumber(szCode))
	else
		szCode = strsub(szCode, 1, 10)
	end
	return szCode;
end

--¼ì²é¼¤»îÂëºÏ·¨ÐÔ
function _ic_CheckInviteCode(szInviteCode)
	if strlen(szInviteCode) ~= 10 then
		return 0;
	end
	if tonumber(szInviteCode) == 0 then
		return 0;
	end
	for i = 1, strlen(szInviteCode) do
		local char = strsub(szInviteCode, i, i);
		local nNum = tonumber(char);
		if not nNum or (nNum < 0 or nNum > 9) then
			return 0;
		end
	end
	return 1;
end

--ÉèÖÃ×Ô¼ºÑûÇëÂë×Ö·û´®
function _ic_SetInviteCode(szCode)
	if type(szCode) ~= "string" or strlen(szCode) ~= 10 then
		WriteLog("[InviteCode] ERROR: _ic_SetInviteCode strlen(szCode) ~= 10");
		return
	end
	local nH16 = tonumber(strsub(szCode, 1, 5));
	local nL16 = tonumber(strsub(szCode, 6, 10));
	IC_TASK_GROUP:SetTask(IC_TASK_GROUP.InviteCode16H, nH16);
	IC_TASK_GROUP:SetTask(IC_TASK_GROUP.InviteCode16L, nL16);
end

--»ñÈ¡×Ô¼ºÑûÇëÂë×Ö·û´®
function _ic_GetInviteCode()
	local nH16 = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.InviteCode16H);
	local nL16 = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.InviteCode16L);
	local strH16 = format("%05d", nH16);
	local strL16 = format("%05d", nL16);
	if strlen(strH16) ~= 5 or strlen(strL16) ~= 5 then
		WriteLog(format("[InviteCode] Accoute=%s RoleName=%s Route=%d strH16=%s strL16=%s", GetAccount(), GetName(), GetPlayerRoute(), strH16, strL16));
		return 0;
	end
	return strH16..strL16;
end

--ÉèÖÃÒÑ¼¤»îÑûÇëÂë×Ö·û´®
function _ic_SetActInviteCode(szCode)
	if type(szCode) ~= "string" or strlen(szCode) ~= 10 then
		WriteLog("[InviteCode] ERROR: _ic_SetActInviteCode strlen(szCode) ~= 10");
		return
	end
	local nH16 = tonumber(strsub(szCode, 1, 5));
	local nL16 = tonumber(strsub(szCode, 6, 10));
	IC_TASK_GROUP:SetTask(IC_TASK_GROUP.Icd16H, nH16);
	IC_TASK_GROUP:SetTask(IC_TASK_GROUP.Icd16L, nL16);
end

--»ñÈ¡ÒÑ¼¤»îÑûÇëÂë×Ö·û´®
function _ic_GetActInviteCode()
	local nH16 = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.Icd16H);
	local nL16 = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.Icd16L);
	local Icd16H = format("%05d", nH16);
	local Icd16L = format("%05d", nL16);
	if strlen(Icd16H) ~= 5 or strlen(Icd16L) ~= 5 then
		WriteLog(format("[InviteCode] Accoute=%s RoleName=%s Route=%d Icd16H=%s Icd16L=%s", GetAccount(), GetName(), GetPlayerRoute(), Icd16H, Icd16L));
		return 0;
	end
	return Icd16H..Icd16L;
end

--¼ì²éÊÜÑûÕßÁì½±Ìõ¼þ
function _ic_CheckAwardCondition(nType)
	if IC_FINISH_INVITE_TYPE1 == nType then
		if IsActivatedVipCard() ~= 1 then
			Say(IC_NPC_NAME..format("B¹n vÉn ch­a tháa ®iÒu kiÖn nhËn: <color=red>%s<color>", "KÝch ho¹t ThÎ vip"), 0);
			return 0;
		else
			return 1;
		end
		
	elseif IC_FINISH_INVITE_TYPE2 == nType then
		local nTransLevel = gf_GetPlayerRebornCount() * 100 + GetLevel()
		if nTransLevel < 590 then
			Say(IC_NPC_NAME..format("B¹n vÉn ch­a tháa ®iÒu kiÖn nhËn: <color=red>%s<color>", "ChuyÓn sinh 5 cÊp 90"), 0);
			return 0;
		else
			return 1;
		end
	elseif IC_FINISH_INVITE_TYPE3 == nType then
		local nTransLevel = gf_GetPlayerRebornCount() * 100 + GetLevel()
		if nTransLevel < 690 then
			Say(IC_NPC_NAME..format("B¹n vÉn ch­a tháa ®iÒu kiÖn nhËn: <color=red>%s<color>", "6 chuyÓn 90 cÊp"), 0);
			return 0;
		else
			return 1;
		end
	elseif IC_FINISH_INVITE_TYPE4 == nType then
		if IC_TASK_GROUP:GetTask(IC_TASK_GROUP.IBCost) < 2000 then
			Say(IC_NPC_NAME..format("B¹n vÉn ch­a tháa ®iÒu kiÖn nhËn: <color=red>%s<color>", "Ngùc c¸c tiªu phÝ 2000 xu"), 0);
			return 0;
		else
			return 1;
		end
	elseif IC_FINISH_INVITE_TYPE5 == nType then
		if IC_TASK_GROUP:GetTask(IC_TASK_GROUP.IBCost) < 5000 then
			Say(IC_NPC_NAME..format("B¹n vÉn ch­a tháa ®iÒu kiÖn nhËn: <color=red>%s<color>", "Ngù C¸c tiªu hao 5000 XU"), 0);
			return 0;
		else
			return 1;
		end
	elseif nType >= IC_FINISH_INVITE_TYPE6 and nType <= IC_FINISH_INVITE_TYPE8  then
		local nNeedCnt = nType - IC_FINISH_INVITE_TYPE6 + 3
		local nFinish = _ic_getFinisCount()
		if nFinish < nNeedCnt then
			local szCondition = format("Hoµn thµnh %d nhiÖm vô tïy ý", nNeedCnt)
			Say(IC_NPC_NAME..format("B¹n vÉn ch­a tháa ®iÒu kiÖn nhËn: <color=red>%s<color>", szCondition), 0);
			return 0
		else
			return 1
		end
	end 
	WriteLog(format("[InviteCode] ERROR INVITE_AWARD type:%d", nType))
	return 0;
end

function _ic_getFinisCount()
	local nRet = 0
	for i = 1, IC_FINISH_INVITE_TYPE5 do
		if IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, i) ~= 0 then
			nRet = nRet + 1
		end
	end
	return nRet
end

--Óù½ÖÏû·Ñ¶ÔÍâ½Ó¿Ú
function _ic_IbCcost(nValue)
	if ic_IsOpen() ~= 1 then
		return 0;
	end
	local szCode = _ic_GetActInviteCode();
	local nType = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.FinishInvite);
	if tonumber(nValue) <= 0 or nType == 0 or tonumber(szCode) <= 0 then
		return 0;
	end
	IC_TASK_GROUP:SetTask(IC_TASK_GROUP.IBCost, IC_TASK_GROUP:GetTask(IC_TASK_GROUP.IBCost) + tonumber(nValue));
	Msg2Player(format("Trong ho¹t ®éng m· mêi, tiªu phÝ trªn Ngù C¸c cña b¹n ®· t¨ng %d", tonumber(nValue)));
end
