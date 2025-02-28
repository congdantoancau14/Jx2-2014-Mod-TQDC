--date:2007-4-10
--author:yanjun
--describe:开启攻城战Mission
Include("\\script\\gongcheng\\mission\\mission_head.lua");
function main()
	local nWeek = tonumber(date("%w"));
	if nWeek ~= 6 then 	--星期6才开放
		return 0;
	end;
	if GetGlbValue(GLB_GONGCHENG_FORBIDEN) == 0 then
		for i=2,2 do	--只开成都
			local nMapID = tCityInfo[i][3];
			local nCityName = tCityInfo[i][1];
			local nCityMapID = tCityInfo[i][2];
			local szGong,szShou = GetCityWarAD(nCityMapID);
			if szGong == "" then	--如果没有攻城方
				if SubWorldID2Idx(nMapID) >= 0 then	--只在目标城市地图所处的服务器上发消息
					if szShou ~= "" then
						Msg2Global("Do "..nCityName.." C玭g th祅h chi課 kh玭g c� phe c玭g"..nCityName.."Th祅h ti誴 t鬰 do "..szShou.." bang h閕 chi誱 l躰h");
					else
						Msg2Global("Do "..nCityName.." C玭g th祅h chi課 kh玭g c� phe c玭g v� phe th�, v� v藋 "..nCityName.." C玭g th祅h chi課 t筸 d鮪g 1 tr薾");
					end;
				end;
				return 0;
			end;
			if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nMapID) == MS_STATE_IDEL then
				if mf_OpenMission(MISSION_ID,nMapID) == 1 then
					Msg2Global(nCityName.."_b秐  c玭g th祅h chi課  c� th� v祇 r錳, 21: 00 - 21: 30 l� th阨 gian chu萵 b�");
				end;
			end;
		end;
	end;
end;