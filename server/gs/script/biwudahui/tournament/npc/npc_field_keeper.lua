--Create date:2008-1-9 17:37
--Author:yanjun
--Description:场地看守人脚本
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
g_szInfoHead = "<color=green>Th莕 V� Vi謓 T� Nghi謕<color>:";

function main()
	local selTab = {
--				"我想看看每个擂台是哪些人在较艺/know_matches",
				"Ta mu鑞 xem giao u/know_matches",
				"Ta mu鑞 thi誸 l藀 l筰 甶觤 s� t� v�/reset_point",
				"Ta mu鑞 r阨 kh醝 n琲 n祔/leave",
				"Kh玭g c� g�/nothing",
				}
--	if GetMaskStatus() == 0 then
--		tinsert(selTab,1,"我要匿名/#hide_name(1)");
--	else
--		tinsert(selTab,1,"我要显示名字/#hide_name(0)");
--	end;
	Say(g_szInfoHead.."Sau khi ho祅 th祅h t� v�, ngi ch琲 ph秈 quay v� server hi謓 t筰 m韎 頲 h� th鑞g ng k� t輈h 甶觤",getn(selTab),selTab);
end;

function know_matches()
	local selTab = {
				"Ta mu鑞 xem L玦 i hng ng/#list_matches(1)",
				"Ta mu鑞 xem L玦 i hng nam/#list_matches(2)",
				"Ta mu鑞 xem L玦 i hng t﹜/#list_matches(3)",
				"Ta mu鑞 xem L玦 i hng b綾/#list_matches(4)",
				"Kh玭g c� g�/nothing",
				}
	Say(g_szInfoHead.."Ngi mu鑞 xem L玦 i n祇?",getn(selTab),selTab);
end;

function list_matches(nDirection)
	local nPIdx1,nPIdx2 = 0,0;
	local nState = 0;
	local szString = "";
	local nCityID = 0;
	local nCurMapID = GetWorldPos();
	for i,v in TB_MAPID do
		if v[1] == nCurMapID then
			nCityID = i;
			break;
		end;
	end;
	local szStr = "";
	local szName1,szName2 = "","";
	for i=1,8 do
		nPIdx1,nPIdx2,nState,bAllow = BWT_GetMatchInfo(nCityID,nDirection,i);
		if bAllow == 1 then
			szStr = ", cho ph衟 xem ";
		else
			szStr = ", kh玭g cho ph衟 xem ";
		end;
		if nPIdx1 == 0 then
			szString = szString.."khu v鵦 "..i..": hi謓 t筰 kh玭g c� ngi t� v鈂n";
		elseif nState <= MS_STATE_READY then
			szString = szString.."khu v鵦 "..i..": hi謓 t筰 產ng trong giai 畂筺 chu萵 b� t� v� "..szStr.."\n";
		else
			szName1,szName2 = BWT_GetName(nPIdx1),BWT_GetName(nPIdx2);
			szString = szString.."khu v鵦 "..i..": hai b猲 l� ["..szName1.."] v� ["..szName2.."]"..szStr.."\n";
		end;
	end;
	local tbDirection = {"Hng ng","Hng nam","Hng T﹜","Hng B綾"};
	Talk(1,"know_matches",g_szInfoHead..tbDirection[nDirection].."T譶h h譶h t� v�:\n"..szString);
end;

function leave()
	if BWDH_DEBUG_VERSION == 1 then
		BWDH_Change_Map(200,1392,2817);
	else
		local selTab = {
					--"泉州/#leave_confirm(100)",
					"Bi謓 Kinh/#leave_confirm(200)",
					--"成都/#leave_confirm(300)",
					"T筸 th阨 kh玭g r阨 kh醝/nothing",
					}
		Say(g_szInfoHead.."Ngi mu鑞 甶 u?",getn(selTab),selTab);
	end;
end;

function leave_confirm(nCityID)
	GLB_BW_LEAVE(nCityID);
end;

function hide_name(nType)
	UseMask(nType,0);
end;

function reset_point()
--	local selTab = {
--		"重置分数(清空本周胜负场次)，需要100逍遥玉 /reset_point_1",
--		"重置分数(不清空本周胜负场)，需要300逍遥玉 /reset_point_2",
--		"重置分数(置回上周登记分数)，需要500逍遥玉 /reset_point_3",
--		"没什么事/nothing",
--	}
--	Say(g_szInfoHead.."全新的重置比武分数服务可以帮你把分数重置到一个较高分数段，让你可以直接遇到更强大的对手，准备好，接受高分段强者的挑战没？",getn(selTab),selTab);
end

function reset_point_1(bConfirm)
--	bConfirm = bConfirm or 0;
--
--	if 1 ~= bConfirm then
--		local selTab = {
--			"我要重置，需要100逍遥玉 /#reset_point_1(1)",
--			"返回 /main",
--			"结束对话 /nothing",
--		};
--		Say(g_szInfoHead.."该服务会将你的比武分数直接重置到320分，但会清空你本周的胜负场次，并将你传回本服。<color=yellow>你需要回到跨服重新再进行10场以上的比武才能重新登记分数。<color>",getn(selTab),selTab);
--		return
--	end
--
--	if 1 == PayXYY(100) then
--		GLB_BW_SetTask(0,3);--同步逍遥玉
--		BWDH_SetTask(TSK_CURREALRESULT,	320);
--		BWDH_SetTask(TSK_CURWEEKMATCH,	0);
--		BWDH_SetTask(TSK_CURWEEKWIN,		0);
--		BWDH_SetTask(TSK_CURWEEKLOSE,	0);
--		GLB_BW_SetTask(0,0,tRelayTask);
--		GLB_BW_LEAVE(200);
--	end

end

function reset_point_2(bConfirm)
--	bConfirm = bConfirm or 0;
--
--	if 1 ~= bConfirm then
--	local selTab = {
--			"我要重置，需要300逍遥玉 /#reset_point_2(1)",
--			"返回 /main",
--			"结束对话 /nothing",
--		};
--		Say(g_szInfoHead.."该服务会将你的比武分数直接重置到320-350分（随机），会增加你本周的胜负场次各5场，并登记你的比武积分，将你传回本服。",getn(selTab),selTab);
--		return
--	end
--
--	if 1 == PayXYY(300) then
--		GLB_BW_SetTask(0,3);--同步逍遥玉
--		BWDH_SetTask(TSK_CURREALRESULT,	320 + random(0, 30));
--		BWDH_SetTask(TSK_CURSIGNEDRESULT,GetTask(TSK_CURREALRESULT));
--		BWDH_SetTask(TSK_CURWEEKMATCH,	GetTask(TSK_CURWEEKMATCH) + 10);
--		BWDH_SetTask(TSK_CURWEEKWIN,		GetTask(TSK_CURWEEKWIN) + 5);
--		BWDH_SetTask(TSK_CURWEEKLOSE,	GetTask(TSK_CURWEEKLOSE) + 5);
--		BWDH_SetTask(TASK_BIWU_WIN_10,	10);
--		BWDH_SetTask(TASK_BIWU_LOSE_10,	0);
--		GLB_BW_SetTask(0,0,tRelayTask);
--		SignUpGestResult();
--		GLB_BW_LEAVE(200);
--	end

end

function reset_point_3(bConfirm)
--	bConfirm = bConfirm or 0;
--
--	if 1 ~= bConfirm then
--	local selTab = {
--			"我要重置，需要500逍遥玉 /#reset_point_3(1)",
--			"返回 /main",
--			"结束对话 /nothing",
--		};
--		Say(g_szInfoHead.."该服务会将你的比武分数直接重置到上周的比武登记分数，会增加你本周的胜负场次各5场，并登记你的比武积分，将你传回本服。你只能在本周参加过10场比武前才可申请使用该服务，如果你本周已自动登记了比武积分，将不能使用该服务。",getn(selTab),selTab);
--		return
--	end
--
--	if 10 <= GetTask(TSK_CURWEEKMATCH) then
--		Talk(1, "", "本周你已经比满10场，不能使用该服务。");
--		return
--	end
--
--	if 1 == PayXYY(500) then
--		GLB_BW_SetTask(0,3);--同步逍遥玉
--		BWDH_SetTask(TSK_CURREALRESULT,	GetTask(TSK_CURSIGNEDRESULT));
--		BWDH_SetTask(TSK_CURWEEKMATCH,	GetTask(TSK_CURWEEKMATCH) + 10);
--		BWDH_SetTask(TSK_CURWEEKWIN,		GetTask(TSK_CURWEEKWIN) + 5);
--		BWDH_SetTask(TSK_CURWEEKLOSE,	GetTask(TSK_CURWEEKLOSE) + 5);
--		BWDH_SetTask(TASK_BIWU_WIN_10,	10);
--		BWDH_SetTask(TASK_BIWU_LOSE_10,	0);
--		GLB_BW_SetTask(0,0,tRelayTask);
--		SignUpGestResult();
--		GLB_BW_LEAVE(200);
--	end

end

