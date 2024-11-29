--×÷Õß£ºÑÏ¾ü
--´´½¨ÈÕÆÚ£º07Äê11ÔÂ13ÈÕ14:50
--½ÓÒýµÜ×Ó½Å±¾
Include("\\script\\task\\faction_back_room\\back_room_function.lua");
g_szInforHeader = "<color=green>TiÕp dÉn ®Ö tö<color>: ";

function main()
	local nPlayerState = GetMissionV(MV_MISSION_STATE);
	local nDiff = BR_GetCurDiff();
	local nStage = BR_GetCurStage();
	local selTab = {
				"Më r­¬ng chøa ®å/open_box",
				"Xem trang bÞ hiÖn t¹i cã thÓ vµo ¶i kÕ tiÕp hay kh«ng /#check_equipment("..nDiff..","..nStage..")",
				"Xem h¹n chÕ khiªu chiÕn/BR_KnowLimit",
				"\nB¾t ®Çu v­ît ¶i/start_stage",
				"Ta muèn rêi khái mËt thÊt/leave_stage",
				}
	local szSay = "";
	if nPlayerState == MS_STATE_END_WAITING then
		tremove(selTab,1);
		tremove(selTab,1);
		tremove(selTab,1);
		tremove(selTab,1);
		szSay = "B¹n muèn rêi khái n¬i v­ît ¶i ph¶i kh«ng?";
	else
		szSay = "B¹n s¾p vµo <color=yellow>"..TB_DIFF_NAME[nDiff].."<color> ¶i <color=yellow>"..nStage.." <color>."
	end;
	if DEBUG_VERSION == 1 and nPlayerState == MS_STATE_STARTED then
		tinsert(selTab,"Vµo ¶i kÕ tiÕp (thö luyÖn)/next_stage");
	end;
	tinsert(selTab,"Kh«ng cã g×/nothing");
	Say(g_szInforHeader..szSay,getn(selTab),selTab);
end;

function next_stage()
	BR_EndStage();
end;

function leave_stage()
	local selTab = {
				"§óng! Ta muèn rêi khái/leave_confirm",
				"Ta muèn tiÕp tôc ë l¹i ®©y/nothing",
				}
	Say(g_szInforHeader.."B¹n muèn rêi khái mËt thÊt?",getn(selTab),selTab);				
end;

function start_stage()
	local nDiff,nStage = 0,0;
	nDiff = BR_GetCurDiff();
	nStage = BR_GetCurStage();
--	if BR_EnterNextStageCheck(nDiff,nStage) == 0 then
--		Say("Tr¹ng th¸i hiÖn t¹i cña b¹n kh«ng ®ñ ®iÒu kiÖn ®Ó vµo ¶i, xin h·y kiÓm tra giíi h¹n v­ît ¶i.",0)
--		return 0;
--	end;
	local nPlayerState = GetMissionV(MV_MISSION_STATE);
	if nPlayerState == MS_STATE_READY or DEBUG_VERSION == 1 then
		BR_NextStage();
	end;
end;

function leave_confirm()
	local nPlayerState = GetMissionV(MV_MISSION_STATE);
	if nPlayerState == MS_STATE_END_WAITING then

	end;
	BR_CloseStage();
end;

function open_box()
	if GetTask(805) == 0 then
		Talk(1,"",g_szInforHeader.."Ng­¬i vÉn ch­a thuéc vÒ r­¬ng cña m×nh.");
		return 0;
	end;
	OpenBox();
end;

function check_equipment(nDiff,nStage)
	if BR_EnterNextStageCheck(nDiff,nStage) == 0 then
		Say("Tr¹ng th¸i hiÖn t¹i cña b¹n kh«ng ®ñ ®iÒu kiÖn ®Ó vµo ¶i, xin h·y kiÓm tra giíi h¹n v­ît ¶i.",0)
	else
		Say("Tr¹ng th¸i hiÖn t¹i cña b¹n ®ñ ®iÒu kiÖn ®Ó vµo ¶i.",0);
	end;
end;
